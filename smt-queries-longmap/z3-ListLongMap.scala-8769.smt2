; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106602 () Bool)

(assert start!106602)

(declare-fun res!843292 () Bool)

(declare-fun e!721531 () Bool)

(assert (=> start!106602 (=> (not res!843292) (not e!721531))))

(declare-datatypes ((B!2008 0))(
  ( (B!2009 (val!16339 Int)) )
))
(declare-datatypes ((tuple2!21196 0))(
  ( (tuple2!21197 (_1!10609 (_ BitVec 64)) (_2!10609 B!2008)) )
))
(declare-datatypes ((List!28331 0))(
  ( (Nil!28328) (Cons!28327 (h!29536 tuple2!21196) (t!41858 List!28331)) )
))
(declare-datatypes ((ListLongMap!18991 0))(
  ( (ListLongMap!18992 (toList!9511 List!28331)) )
))
(declare-fun lm!209 () ListLongMap!18991)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7647 (ListLongMap!18991 (_ BitVec 64)) Bool)

(assert (=> start!106602 (= res!843292 (not (contains!7647 lm!209 a!499)))))

(assert (=> start!106602 e!721531))

(declare-fun e!721532 () Bool)

(declare-fun inv!44162 (ListLongMap!18991) Bool)

(assert (=> start!106602 (and (inv!44162 lm!209) e!721532)))

(assert (=> start!106602 true))

(declare-fun b!1266744 () Bool)

(assert (=> b!1266744 (= e!721531 false)))

(declare-fun b!1266745 () Bool)

(declare-fun tp!96455 () Bool)

(assert (=> b!1266745 (= e!721532 tp!96455)))

(assert (= (and start!106602 res!843292) b!1266744))

(assert (= start!106602 b!1266745))

(declare-fun m!1166389 () Bool)

(assert (=> start!106602 m!1166389))

(declare-fun m!1166391 () Bool)

(assert (=> start!106602 m!1166391))

(check-sat (not start!106602) (not b!1266745))
(check-sat)
