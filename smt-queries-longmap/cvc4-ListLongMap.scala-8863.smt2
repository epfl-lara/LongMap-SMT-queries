; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107560 () Bool)

(assert start!107560)

(declare-fun b!1273457 () Bool)

(declare-fun b_free!27725 () Bool)

(declare-fun b_next!27725 () Bool)

(assert (=> b!1273457 (= b_free!27725 (not b_next!27725))))

(declare-fun tp!97721 () Bool)

(declare-fun b_and!45781 () Bool)

(assert (=> b!1273457 (= tp!97721 b_and!45781)))

(declare-fun e!726569 () Bool)

(declare-fun tp_is_empty!33095 () Bool)

(declare-fun e!726567 () Bool)

(declare-datatypes ((V!49319 0))(
  ( (V!49320 (val!16622 Int)) )
))
(declare-datatypes ((ValueCell!15694 0))(
  ( (ValueCellFull!15694 (v!19259 V!49319)) (EmptyCell!15694) )
))
(declare-datatypes ((array!83462 0))(
  ( (array!83463 (arr!40256 (Array (_ BitVec 32) ValueCell!15694)) (size!40798 (_ BitVec 32))) )
))
(declare-datatypes ((array!83464 0))(
  ( (array!83465 (arr!40257 (Array (_ BitVec 32) (_ BitVec 64))) (size!40799 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6152 0))(
  ( (LongMapFixedSize!6153 (defaultEntry!6722 Int) (mask!34503 (_ BitVec 32)) (extraKeys!6401 (_ BitVec 32)) (zeroValue!6507 V!49319) (minValue!6507 V!49319) (_size!3131 (_ BitVec 32)) (_keys!12136 array!83464) (_values!6745 array!83462) (_vacant!3131 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6152)

(declare-fun array_inv!30607 (array!83464) Bool)

(declare-fun array_inv!30608 (array!83462) Bool)

(assert (=> b!1273457 (= e!726569 (and tp!97721 tp_is_empty!33095 (array_inv!30607 (_keys!12136 thiss!1551)) (array_inv!30608 (_values!6745 thiss!1551)) e!726567))))

(declare-fun b!1273458 () Bool)

(declare-fun e!726572 () Bool)

(assert (=> b!1273458 (= e!726572 (and (bvsle #b00000000000000000000000000000000 (size!40799 (_keys!12136 thiss!1551))) (bvsge (size!40799 (_keys!12136 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1273459 () Bool)

(declare-fun e!726568 () Bool)

(assert (=> b!1273459 (= e!726568 tp_is_empty!33095)))

(declare-fun mapNonEmpty!51264 () Bool)

(declare-fun mapRes!51264 () Bool)

(declare-fun tp!97722 () Bool)

(declare-fun e!726571 () Bool)

(assert (=> mapNonEmpty!51264 (= mapRes!51264 (and tp!97722 e!726571))))

(declare-fun mapRest!51264 () (Array (_ BitVec 32) ValueCell!15694))

(declare-fun mapValue!51264 () ValueCell!15694)

(declare-fun mapKey!51264 () (_ BitVec 32))

(assert (=> mapNonEmpty!51264 (= (arr!40256 (_values!6745 thiss!1551)) (store mapRest!51264 mapKey!51264 mapValue!51264))))

(declare-fun mapIsEmpty!51264 () Bool)

(assert (=> mapIsEmpty!51264 mapRes!51264))

(declare-fun res!846849 () Bool)

(assert (=> start!107560 (=> (not res!846849) (not e!726572))))

(declare-fun simpleValid!466 (LongMapFixedSize!6152) Bool)

(assert (=> start!107560 (= res!846849 (simpleValid!466 thiss!1551))))

(assert (=> start!107560 e!726572))

(assert (=> start!107560 e!726569))

(declare-fun b!1273460 () Bool)

(assert (=> b!1273460 (= e!726567 (and e!726568 mapRes!51264))))

(declare-fun condMapEmpty!51264 () Bool)

(declare-fun mapDefault!51264 () ValueCell!15694)

