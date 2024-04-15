; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75004 () Bool)

(assert start!75004)

(assert (=> start!75004 false))

(declare-datatypes ((B!1220 0))(
  ( (B!1221 (val!8916 Int)) )
))
(declare-datatypes ((tuple2!11846 0))(
  ( (tuple2!11847 (_1!5934 (_ BitVec 64)) (_2!5934 B!1220)) )
))
(declare-datatypes ((List!17640 0))(
  ( (Nil!17637) (Cons!17636 (h!18767 tuple2!11846) (t!24908 List!17640)) )
))
(declare-datatypes ((ListLongMap!10605 0))(
  ( (ListLongMap!10606 (toList!5318 List!17640)) )
))
(declare-fun lm!210 () ListLongMap!10605)

(declare-fun e!492350 () Bool)

(declare-fun inv!29353 (ListLongMap!10605) Bool)

(assert (=> start!75004 (and (inv!29353 lm!210) e!492350)))

(declare-fun b!884729 () Bool)

(declare-fun tp!54186 () Bool)

(assert (=> b!884729 (= e!492350 tp!54186)))

(assert (= start!75004 b!884729))

(declare-fun m!824471 () Bool)

(assert (=> start!75004 m!824471))

(check-sat (not start!75004) (not b!884729))
(check-sat)
