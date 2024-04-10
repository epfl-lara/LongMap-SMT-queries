; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89276 () Bool)

(assert start!89276)

(declare-fun b!1023710 () Bool)

(declare-fun b_free!20317 () Bool)

(declare-fun b_next!20317 () Bool)

(assert (=> b!1023710 (= b_free!20317 (not b_next!20317))))

(declare-fun tp!71986 () Bool)

(declare-fun b_and!32545 () Bool)

(assert (=> b!1023710 (= tp!71986 b_and!32545)))

(declare-fun b!1023707 () Bool)

(declare-fun e!576886 () Bool)

(declare-fun tp_is_empty!24037 () Bool)

(assert (=> b!1023707 (= e!576886 tp_is_empty!24037)))

(declare-fun mapNonEmpty!37473 () Bool)

(declare-fun mapRes!37473 () Bool)

(declare-fun tp!71985 () Bool)

(assert (=> mapNonEmpty!37473 (= mapRes!37473 (and tp!71985 e!576886))))

(declare-fun mapKey!37473 () (_ BitVec 32))

(declare-datatypes ((V!36923 0))(
  ( (V!36924 (val!12069 Int)) )
))
(declare-datatypes ((ValueCell!11315 0))(
  ( (ValueCellFull!11315 (v!14638 V!36923)) (EmptyCell!11315) )
))
(declare-datatypes ((array!64118 0))(
  ( (array!64119 (arr!30871 (Array (_ BitVec 32) (_ BitVec 64))) (size!31382 (_ BitVec 32))) )
))
(declare-datatypes ((array!64120 0))(
  ( (array!64121 (arr!30872 (Array (_ BitVec 32) ValueCell!11315)) (size!31383 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5224 0))(
  ( (LongMapFixedSize!5225 (defaultEntry!5964 Int) (mask!29593 (_ BitVec 32)) (extraKeys!5696 (_ BitVec 32)) (zeroValue!5800 V!36923) (minValue!5800 V!36923) (_size!2667 (_ BitVec 32)) (_keys!11109 array!64118) (_values!5987 array!64120) (_vacant!2667 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5224)

(declare-fun mapValue!37473 () ValueCell!11315)

(declare-fun mapRest!37473 () (Array (_ BitVec 32) ValueCell!11315))

(assert (=> mapNonEmpty!37473 (= (arr!30872 (_values!5987 thiss!1427)) (store mapRest!37473 mapKey!37473 mapValue!37473))))

(declare-fun b!1023708 () Bool)

(declare-fun e!576887 () Bool)

(assert (=> b!1023708 (= e!576887 tp_is_empty!24037)))

(declare-fun res!685562 () Bool)

(declare-fun e!576888 () Bool)

(assert (=> start!89276 (=> (not res!685562) (not e!576888))))

(declare-fun valid!1990 (LongMapFixedSize!5224) Bool)

(assert (=> start!89276 (= res!685562 (valid!1990 thiss!1427))))

(assert (=> start!89276 e!576888))

(declare-fun e!576889 () Bool)

(assert (=> start!89276 e!576889))

(assert (=> start!89276 true))

(declare-fun b!1023709 () Bool)

(declare-fun e!576890 () Bool)

(assert (=> b!1023709 (= e!576890 (and e!576887 mapRes!37473))))

(declare-fun condMapEmpty!37473 () Bool)

(declare-fun mapDefault!37473 () ValueCell!11315)

