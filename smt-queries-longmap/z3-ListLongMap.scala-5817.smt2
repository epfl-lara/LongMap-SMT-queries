; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75190 () Bool)

(assert start!75190)

(assert (=> start!75190 false))

(declare-datatypes ((B!1220 0))(
  ( (B!1221 (val!8916 Int)) )
))
(declare-datatypes ((tuple2!11756 0))(
  ( (tuple2!11757 (_1!5889 (_ BitVec 64)) (_2!5889 B!1220)) )
))
(declare-datatypes ((List!17587 0))(
  ( (Nil!17584) (Cons!17583 (h!18720 tuple2!11756) (t!24856 List!17587)) )
))
(declare-datatypes ((ListLongMap!10527 0))(
  ( (ListLongMap!10528 (toList!5279 List!17587)) )
))
(declare-fun lm!210 () ListLongMap!10527)

(declare-fun e!493080 () Bool)

(declare-fun inv!29353 (ListLongMap!10527) Bool)

(assert (=> start!75190 (and (inv!29353 lm!210) e!493080)))

(declare-fun b!885871 () Bool)

(declare-fun tp!54186 () Bool)

(assert (=> b!885871 (= e!493080 tp!54186)))

(assert (= start!75190 b!885871))

(declare-fun m!826523 () Bool)

(assert (=> start!75190 m!826523))

(check-sat (not start!75190) (not b!885871))
(check-sat)
