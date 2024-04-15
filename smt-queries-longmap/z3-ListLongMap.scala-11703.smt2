; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136804 () Bool)

(assert start!136804)

(declare-fun res!1078638 () Bool)

(declare-fun e!880477 () Bool)

(assert (=> start!136804 (=> (not res!1078638) (not e!880477))))

(declare-datatypes ((B!2558 0))(
  ( (B!2559 (val!19641 Int)) )
))
(declare-datatypes ((tuple2!25452 0))(
  ( (tuple2!25453 (_1!12737 (_ BitVec 64)) (_2!12737 B!2558)) )
))
(declare-datatypes ((List!36802 0))(
  ( (Nil!36799) (Cons!36798 (h!38342 tuple2!25452) (t!51708 List!36802)) )
))
(declare-datatypes ((ListLongMap!22791 0))(
  ( (ListLongMap!22792 (toList!11411 List!36802)) )
))
(declare-fun lm!251 () ListLongMap!22791)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun contains!10388 (ListLongMap!22791 (_ BitVec 64)) Bool)

(assert (=> start!136804 (= res!1078638 (not (contains!10388 lm!251 a0!51)))))

(assert (=> start!136804 e!880477))

(declare-fun e!880478 () Bool)

(declare-fun inv!58912 (ListLongMap!22791) Bool)

(assert (=> start!136804 (and (inv!58912 lm!251) e!880478)))

(assert (=> start!136804 true))

(declare-fun b!1578517 () Bool)

(assert (=> b!1578517 (= e!880477 false)))

(declare-fun b!1578518 () Bool)

(declare-fun tp!114253 () Bool)

(assert (=> b!1578518 (= e!880478 tp!114253)))

(assert (= (and start!136804 res!1078638) b!1578517))

(assert (= start!136804 b!1578518))

(declare-fun m!1449993 () Bool)

(assert (=> start!136804 m!1449993))

(declare-fun m!1449995 () Bool)

(assert (=> start!136804 m!1449995))

(check-sat (not start!136804) (not b!1578518))
(check-sat)
