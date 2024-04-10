; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72142 () Bool)

(assert start!72142)

(declare-fun res!569214 () Bool)

(declare-fun e!466926 () Bool)

(assert (=> start!72142 (=> (not res!569214) (not e!466926))))

(declare-datatypes ((List!16008 0))(
  ( (Nil!16005) (Cons!16004 (h!17135 (_ BitVec 64)) (t!22379 List!16008)) )
))
(declare-fun l!632 () List!16008)

(assert (=> start!72142 (= res!569214 (and (not (is-Nil!16005 l!632)) (not (is-Nil!16005 (t!22379 l!632))) (bvslt (h!17135 l!632) (h!17135 (t!22379 l!632)))))))

(assert (=> start!72142 e!466926))

(assert (=> start!72142 true))

(declare-fun b!836798 () Bool)

(declare-fun ListPrimitiveSize!78 (List!16008) Int)

(assert (=> b!836798 (= e!466926 (>= (ListPrimitiveSize!78 (t!22379 l!632)) (ListPrimitiveSize!78 l!632)))))

(assert (= (and start!72142 res!569214) b!836798))

(declare-fun m!781917 () Bool)

(assert (=> b!836798 m!781917))

(declare-fun m!781919 () Bool)

(assert (=> b!836798 m!781919))

(push 1)

(assert (not b!836798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

