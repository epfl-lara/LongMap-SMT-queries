; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1302 () Bool)

(assert start!1302)

(declare-fun b_free!403 () Bool)

(declare-fun b_next!403 () Bool)

(assert (=> start!1302 (= b_free!403 (not b_next!403))))

(declare-fun tp!1610 () Bool)

(declare-fun b_and!585 () Bool)

(assert (=> start!1302 (= tp!1610 b_and!585)))

(assert (=> start!1302 false))

(declare-datatypes ((B!344 0))(
  ( (B!345 (val!267 Int)) )
))
(declare-datatypes ((tuple2!330 0))(
  ( (tuple2!331 (_1!165 (_ BitVec 64)) (_2!165 B!344)) )
))
(declare-datatypes ((List!315 0))(
  ( (Nil!312) (Cons!311 (h!877 tuple2!330) (t!2486 List!315)) )
))
(declare-datatypes ((ListLongMap!311 0))(
  ( (ListLongMap!312 (toList!171 List!315)) )
))
(declare-fun lm!227 () ListLongMap!311)

(declare-fun e!6187 () Bool)

(declare-fun inv!502 (ListLongMap!311) Bool)

(assert (=> start!1302 (and (inv!502 lm!227) e!6187)))

(assert (=> start!1302 tp!1610))

(declare-fun e!6188 () Bool)

(assert (=> start!1302 e!6188))

(declare-fun b!10633 () Bool)

(declare-fun tp!1608 () Bool)

(assert (=> b!10633 (= e!6187 tp!1608)))

(declare-fun b!10634 () Bool)

(declare-fun tp_is_empty!517 () Bool)

(declare-fun tp!1609 () Bool)

(assert (=> b!10634 (= e!6188 (and tp_is_empty!517 tp!1609))))

(assert (= start!1302 b!10633))

(declare-fun kvs!4 () List!315)

(get-info :version)

(assert (= (and start!1302 ((_ is Cons!311) kvs!4)) b!10634))

(declare-fun m!6851 () Bool)

(assert (=> start!1302 m!6851))

(check-sat (not start!1302) tp_is_empty!517 (not b!10634) (not b!10633) (not b_next!403) b_and!585)
(check-sat b_and!585 (not b_next!403))
