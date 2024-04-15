; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2484 () Bool)

(assert start!2484)

(declare-fun b_free!505 () Bool)

(declare-fun b_next!505 () Bool)

(assert (=> start!2484 (= b_free!505 (not b_next!505))))

(declare-fun tp!2615 () Bool)

(declare-fun b_and!951 () Bool)

(assert (=> start!2484 (= tp!2615 b_and!951)))

(assert (=> start!2484 false))

(declare-datatypes ((B!626 0))(
  ( (B!627 (val!411 Int)) )
))
(declare-datatypes ((tuple2!618 0))(
  ( (tuple2!619 (_1!309 (_ BitVec 64)) (_2!309 B!626)) )
))
(declare-datatypes ((List!480 0))(
  ( (Nil!477) (Cons!476 (h!1042 tuple2!618) (t!2918 List!480)) )
))
(declare-datatypes ((ListLongMap!449 0))(
  ( (ListLongMap!450 (toList!240 List!480)) )
))
(declare-fun lm!238 () ListLongMap!449)

(declare-fun e!9434 () Bool)

(declare-fun inv!808 (ListLongMap!449) Bool)

(assert (=> start!2484 (and (inv!808 lm!238) e!9434)))

(assert (=> start!2484 tp!2615))

(declare-fun b!15509 () Bool)

(declare-fun tp!2614 () Bool)

(assert (=> b!15509 (= e!9434 tp!2614)))

(assert (= start!2484 b!15509))

(declare-fun m!10425 () Bool)

(assert (=> start!2484 m!10425))

(check-sat (not start!2484) (not b!15509) b_and!951 (not b_next!505))
(check-sat b_and!951 (not b_next!505))
