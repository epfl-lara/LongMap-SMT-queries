; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89280 () Bool)

(assert start!89280)

(declare-fun b!1023747 () Bool)

(declare-fun b_free!20321 () Bool)

(declare-fun b_next!20321 () Bool)

(assert (=> b!1023747 (= b_free!20321 (not b_next!20321))))

(declare-fun tp!71997 () Bool)

(declare-fun b_and!32553 () Bool)

(assert (=> b!1023747 (= tp!71997 b_and!32553)))

(declare-fun tp_is_empty!24041 () Bool)

(declare-fun e!576924 () Bool)

(declare-datatypes ((V!36927 0))(
  ( (V!36928 (val!12071 Int)) )
))
(declare-datatypes ((ValueCell!11317 0))(
  ( (ValueCellFull!11317 (v!14640 V!36927)) (EmptyCell!11317) )
))
(declare-datatypes ((array!64126 0))(
  ( (array!64127 (arr!30875 (Array (_ BitVec 32) (_ BitVec 64))) (size!31386 (_ BitVec 32))) )
))
(declare-datatypes ((array!64128 0))(
  ( (array!64129 (arr!30876 (Array (_ BitVec 32) ValueCell!11317)) (size!31387 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5228 0))(
  ( (LongMapFixedSize!5229 (defaultEntry!5966 Int) (mask!29595 (_ BitVec 32)) (extraKeys!5698 (_ BitVec 32)) (zeroValue!5802 V!36927) (minValue!5802 V!36927) (_size!2669 (_ BitVec 32)) (_keys!11111 array!64126) (_values!5989 array!64128) (_vacant!2669 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5228)

(declare-fun e!576926 () Bool)

(declare-fun array_inv!23923 (array!64126) Bool)

(declare-fun array_inv!23924 (array!64128) Bool)

(assert (=> b!1023747 (= e!576926 (and tp!71997 tp_is_empty!24041 (array_inv!23923 (_keys!11111 thiss!1427)) (array_inv!23924 (_values!5989 thiss!1427)) e!576924))))

(declare-fun mapIsEmpty!37479 () Bool)

(declare-fun mapRes!37479 () Bool)

(assert (=> mapIsEmpty!37479 mapRes!37479))

(declare-fun b!1023748 () Bool)

(declare-fun e!576925 () Bool)

(assert (=> b!1023748 (= e!576924 (and e!576925 mapRes!37479))))

(declare-fun condMapEmpty!37479 () Bool)

(declare-fun mapDefault!37479 () ValueCell!11317)

