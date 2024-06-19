require "memory_cache"
require "tasker"

alias DowncaseString = String

macro cached_array(f, norm = {} of String => String)
  {{f}}

  {% typ = f.block_arg.restriction.inputs[0] %}
  @@cache_{{f.name}} = CleanedMemoryCache({ {{*f.args.map &.restriction}} }, Array({{typ}})).new

  {% for block in [true, false] %}
    def {% if f.receiver %}{{f.receiver}}.{% end %}{{f.name}}({{*f.args}}, expires_in : Time::Span) : Array({{typ}})
      {% for arg in f.args %}
        {% if arg.restriction.id == "DowncaseString".id %}
          {{arg.internal_name}} = {{arg.internal_name}}.downcase
        {% end %}
      {% end %}
      @@cache_{{f.name}}.fetch({ {{*f.args.map &.internal_name}} }, expires_in: expires_in) do
        Array({{typ}}).new.tap do |result|
          {{f.name}}({{*f.args.map &.internal_name}}) do |item|
            result << {% if block %}yield{% end %} item
          end
        end
      end
    end
  {% end %}
end

class CleanedMemoryCache(K, V) < MemoryCache(K, V)
  class_getter cleanups = Array(->).new

  def initialize(*args, **kwargs)
    super
    @@cleanups << ->self.cleanup
  end
end

Tasker.cron("0 19 * * *") do # every day 19:00
  CleanedMemoryCache.cleanups.each do |cleanup|
    cleanup.call
  end
end
dhjsjs n 
}}[cdb hdjehndjhf{}
dgbdjjf{}.1324../4
find the log valews.
reintiation the commamd value scommit the score value {1.21.2//*2>1.21.3.1^}
find the log value to be specifically denoted in the values to thr place
JSON.values.intedted > value sto br @@cleanup the values  Cleandumpmemprycache
Tasker...cromn.cron vales def.., instalize
superDATA
@@cleanups <<  _>>self.cleanups
wend
d
end 
end

