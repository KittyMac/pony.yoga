use "fileExt"
use "ponytest"
use "files"
use "flow"
use "bitmap"

actor Main is TestList
	new create(env: Env) => PonyTest(env, this)
	new make() => None

	fun tag tests(test: PonyTest) =>
		test(_TestYoga1)


class iso _TestYoga1 is UnitTest
	fun name(): String => "Test 1: do something trivial in yoga"

	fun apply(h: TestHelper) =>
      h.long_test(30_000_000_000)
      
      let node = YGNode
      node.layout()
      node.print()
      
      h.complete(false)
	

