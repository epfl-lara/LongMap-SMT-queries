; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72188 () Bool)

(assert start!72188)

(declare-fun res!569258 () Bool)

(declare-fun e!466982 () Bool)

(assert (=> start!72188 (=> (not res!569258) (not e!466982))))

(declare-datatypes ((List!16017 0))(
  ( (Nil!16014) (Cons!16013 (h!17144 (_ BitVec 64)) (t!22388 List!16017)) )
))
(declare-fun l!404 () List!16017)

(declare-fun length!37 (List!16017) Int)

(assert (=> start!72188 (= res!569258 (< (length!37 l!404) 2147483647))))

(assert (=> start!72188 e!466982))

(assert (=> start!72188 true))

(declare-fun b!836900 () Bool)

(declare-fun res!569259 () Bool)

(assert (=> b!836900 (=> (not res!569259) (not e!466982))))

(assert (=> b!836900 (= res!569259 (is-Cons!16013 l!404))))

(declare-fun b!836901 () Bool)

(declare-fun ListPrimitiveSize!84 (List!16017) Int)

(assert (=> b!836901 (= e!466982 (>= (ListPrimitiveSize!84 (t!22388 l!404)) (ListPrimitiveSize!84 l!404)))))

(assert (= (and start!72188 res!569258) b!836900))

(assert (= (and b!836900 res!569259) b!836901))

(declare-fun m!781991 () Bool)

(assert (=> start!72188 m!781991))

(declare-fun m!781993 () Bool)

(assert (=> b!836901 m!781993))

(declare-fun m!781995 () Bool)

(assert (=> b!836901 m!781995))

(push 1)

(assert (not b!836901))

(assert (not start!72188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

