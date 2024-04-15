; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106206 () Bool)

(assert start!106206)

(declare-fun res!842064 () Bool)

(declare-fun e!719992 () Bool)

(assert (=> start!106206 (=> (not res!842064) (not e!719992))))

(declare-datatypes ((B!1904 0))(
  ( (B!1905 (val!16287 Int)) )
))
(declare-datatypes ((tuple2!21174 0))(
  ( (tuple2!21175 (_1!10598 (_ BitVec 64)) (_2!10598 B!1904)) )
))
(declare-datatypes ((List!28363 0))(
  ( (Nil!28360) (Cons!28359 (h!29568 tuple2!21174) (t!41875 List!28363)) )
))
(declare-datatypes ((ListLongMap!19047 0))(
  ( (ListLongMap!19048 (toList!9539 List!28363)) )
))
(declare-fun lm!212 () ListLongMap!19047)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7588 (ListLongMap!19047 (_ BitVec 64)) Bool)

(assert (=> start!106206 (= res!842064 (not (contains!7588 lm!212 a1!67)))))

(assert (=> start!106206 e!719992))

(declare-fun e!719993 () Bool)

(declare-fun inv!44064 (ListLongMap!19047) Bool)

(assert (=> start!106206 (and (inv!44064 lm!212) e!719993)))

(assert (=> start!106206 true))

(declare-fun b!1264403 () Bool)

(assert (=> b!1264403 (= e!719992 false)))

(declare-fun b!1264404 () Bool)

(declare-fun tp!96194 () Bool)

(assert (=> b!1264404 (= e!719993 tp!96194)))

(assert (= (and start!106206 res!842064) b!1264403))

(assert (= start!106206 b!1264404))

(declare-fun m!1164539 () Bool)

(assert (=> start!106206 m!1164539))

(declare-fun m!1164541 () Bool)

(assert (=> start!106206 m!1164541))

(check-sat (not start!106206) (not b!1264404))
(check-sat)
