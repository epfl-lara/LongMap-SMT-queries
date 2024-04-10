; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107626 () Bool)

(assert start!107626)

(declare-fun b!1273823 () Bool)

(declare-fun b_free!27751 () Bool)

(declare-fun b_next!27751 () Bool)

(assert (=> b!1273823 (= b_free!27751 (not b_next!27751))))

(declare-fun tp!97812 () Bool)

(declare-fun b_and!45807 () Bool)

(assert (=> b!1273823 (= tp!97812 b_and!45807)))

(declare-fun b!1273819 () Bool)

(declare-fun e!726857 () Bool)

(declare-fun tp_is_empty!33121 () Bool)

(assert (=> b!1273819 (= e!726857 tp_is_empty!33121)))

(declare-fun mapNonEmpty!51316 () Bool)

(declare-fun mapRes!51316 () Bool)

(declare-fun tp!97813 () Bool)

(assert (=> mapNonEmpty!51316 (= mapRes!51316 (and tp!97813 e!726857))))

(declare-datatypes ((V!49355 0))(
  ( (V!49356 (val!16635 Int)) )
))
(declare-datatypes ((ValueCell!15707 0))(
  ( (ValueCellFull!15707 (v!19272 V!49355)) (EmptyCell!15707) )
))
(declare-fun mapValue!51316 () ValueCell!15707)

(declare-fun mapKey!51316 () (_ BitVec 32))

(declare-datatypes ((array!83522 0))(
  ( (array!83523 (arr!40282 (Array (_ BitVec 32) ValueCell!15707)) (size!40828 (_ BitVec 32))) )
))
(declare-datatypes ((array!83524 0))(
  ( (array!83525 (arr!40283 (Array (_ BitVec 32) (_ BitVec 64))) (size!40829 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6178 0))(
  ( (LongMapFixedSize!6179 (defaultEntry!6735 Int) (mask!34530 (_ BitVec 32)) (extraKeys!6414 (_ BitVec 32)) (zeroValue!6520 V!49355) (minValue!6520 V!49355) (_size!3144 (_ BitVec 32)) (_keys!12149 array!83524) (_values!6758 array!83522) (_vacant!3144 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6178)

(declare-fun mapRest!51316 () (Array (_ BitVec 32) ValueCell!15707))

(assert (=> mapNonEmpty!51316 (= (arr!40282 (_values!6758 thiss!1551)) (store mapRest!51316 mapKey!51316 mapValue!51316))))

(declare-fun b!1273820 () Bool)

(declare-fun res!846987 () Bool)

(declare-fun e!726861 () Bool)

(assert (=> b!1273820 (=> (not res!846987) (not e!726861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83524 (_ BitVec 32)) Bool)

(assert (=> b!1273820 (= res!846987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12149 thiss!1551) (mask!34530 thiss!1551)))))

(declare-fun b!1273821 () Bool)

(declare-fun res!846985 () Bool)

(assert (=> b!1273821 (=> (not res!846985) (not e!726861))))

(declare-fun arrayCountValidKeys!0 (array!83524 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273821 (= res!846985 (= (arrayCountValidKeys!0 (_keys!12149 thiss!1551) #b00000000000000000000000000000000 (size!40829 (_keys!12149 thiss!1551))) (_size!3144 thiss!1551)))))

(declare-fun b!1273822 () Bool)

(assert (=> b!1273822 (= e!726861 (bvsgt #b00000000000000000000000000000000 (size!40829 (_keys!12149 thiss!1551))))))

(declare-fun e!726862 () Bool)

(declare-fun e!726859 () Bool)

(declare-fun array_inv!30623 (array!83524) Bool)

(declare-fun array_inv!30624 (array!83522) Bool)

(assert (=> b!1273823 (= e!726862 (and tp!97812 tp_is_empty!33121 (array_inv!30623 (_keys!12149 thiss!1551)) (array_inv!30624 (_values!6758 thiss!1551)) e!726859))))

(declare-fun b!1273824 () Bool)

(declare-fun e!726858 () Bool)

(assert (=> b!1273824 (= e!726859 (and e!726858 mapRes!51316))))

(declare-fun condMapEmpty!51316 () Bool)

(declare-fun mapDefault!51316 () ValueCell!15707)

