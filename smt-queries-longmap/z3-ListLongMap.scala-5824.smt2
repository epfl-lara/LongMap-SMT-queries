; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75106 () Bool)

(assert start!75106)

(assert (=> start!75106 false))

(declare-fun e!492722 () Bool)

(assert (=> start!75106 e!492722))

(declare-fun b!885353 () Bool)

(declare-fun tp_is_empty!17773 () Bool)

(declare-fun tp!54276 () Bool)

(assert (=> b!885353 (= e!492722 (and tp_is_empty!17773 tp!54276))))

(declare-datatypes ((B!1262 0))(
  ( (B!1263 (val!8937 Int)) )
))
(declare-datatypes ((tuple2!11888 0))(
  ( (tuple2!11889 (_1!5955 (_ BitVec 64)) (_2!5955 B!1262)) )
))
(declare-datatypes ((List!17661 0))(
  ( (Nil!17658) (Cons!17657 (h!18788 tuple2!11888) (t!24929 List!17661)) )
))
(declare-fun l!906 () List!17661)

(get-info :version)

(assert (= (and start!75106 ((_ is Cons!17657) l!906)) b!885353))

(check-sat (not b!885353) tp_is_empty!17773)
(check-sat)
