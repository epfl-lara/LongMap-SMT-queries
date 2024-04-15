; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106200 () Bool)

(assert start!106200)

(declare-fun res!842055 () Bool)

(declare-fun e!719974 () Bool)

(assert (=> start!106200 (=> (not res!842055) (not e!719974))))

(declare-datatypes ((B!1898 0))(
  ( (B!1899 (val!16284 Int)) )
))
(declare-datatypes ((tuple2!21168 0))(
  ( (tuple2!21169 (_1!10595 (_ BitVec 64)) (_2!10595 B!1898)) )
))
(declare-datatypes ((List!28360 0))(
  ( (Nil!28357) (Cons!28356 (h!29565 tuple2!21168) (t!41872 List!28360)) )
))
(declare-datatypes ((ListLongMap!19041 0))(
  ( (ListLongMap!19042 (toList!9536 List!28360)) )
))
(declare-fun lm!212 () ListLongMap!19041)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7585 (ListLongMap!19041 (_ BitVec 64)) Bool)

(assert (=> start!106200 (= res!842055 (not (contains!7585 lm!212 a1!67)))))

(assert (=> start!106200 e!719974))

(declare-fun e!719975 () Bool)

(declare-fun inv!44056 (ListLongMap!19041) Bool)

(assert (=> start!106200 (and (inv!44056 lm!212) e!719975)))

(assert (=> start!106200 true))

(declare-fun b!1264385 () Bool)

(assert (=> b!1264385 (= e!719974 false)))

(declare-fun b!1264386 () Bool)

(declare-fun tp!96185 () Bool)

(assert (=> b!1264386 (= e!719975 tp!96185)))

(assert (= (and start!106200 res!842055) b!1264385))

(assert (= start!106200 b!1264386))

(declare-fun m!1164527 () Bool)

(assert (=> start!106200 m!1164527))

(declare-fun m!1164529 () Bool)

(assert (=> start!106200 m!1164529))

(check-sat (not start!106200) (not b!1264386))
(check-sat)
