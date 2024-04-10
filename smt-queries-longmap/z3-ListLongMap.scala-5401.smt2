; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72116 () Bool)

(assert start!72116)

(assert (=> start!72116 false))

(declare-fun e!466896 () Bool)

(assert (=> start!72116 e!466896))

(declare-fun b!836759 () Bool)

(declare-fun tp_is_empty!15279 () Bool)

(declare-fun tp!47503 () Bool)

(assert (=> b!836759 (= e!466896 (and tp_is_empty!15279 tp!47503))))

(declare-datatypes ((B!1210 0))(
  ( (B!1211 (val!7687 Int)) )
))
(declare-datatypes ((tuple2!10234 0))(
  ( (tuple2!10235 (_1!5128 (_ BitVec 64)) (_2!5128 B!1210)) )
))
(declare-datatypes ((List!15998 0))(
  ( (Nil!15995) (Cons!15994 (h!17125 tuple2!10234) (t!22369 List!15998)) )
))
(declare-fun l!390 () List!15998)

(get-info :version)

(assert (= (and start!72116 ((_ is Cons!15994) l!390)) b!836759))

(check-sat (not b!836759) tp_is_empty!15279)
(check-sat)
