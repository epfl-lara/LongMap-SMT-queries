; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107530 () Bool)

(assert start!107530)

(declare-fun b!1273306 () Bool)

(declare-fun b_free!27713 () Bool)

(declare-fun b_next!27713 () Bool)

(assert (=> b!1273306 (= b_free!27713 (not b_next!27713))))

(declare-fun tp!97680 () Bool)

(declare-fun b_and!45769 () Bool)

(assert (=> b!1273306 (= tp!97680 b_and!45769)))

(declare-fun b!1273299 () Bool)

(declare-fun e!726422 () Bool)

(declare-datatypes ((V!49303 0))(
  ( (V!49304 (val!16616 Int)) )
))
(declare-datatypes ((ValueCell!15688 0))(
  ( (ValueCellFull!15688 (v!19253 V!49303)) (EmptyCell!15688) )
))
(declare-datatypes ((array!83434 0))(
  ( (array!83435 (arr!40244 (Array (_ BitVec 32) ValueCell!15688)) (size!40785 (_ BitVec 32))) )
))
(declare-datatypes ((array!83436 0))(
  ( (array!83437 (arr!40245 (Array (_ BitVec 32) (_ BitVec 64))) (size!40786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6140 0))(
  ( (LongMapFixedSize!6141 (defaultEntry!6716 Int) (mask!34491 (_ BitVec 32)) (extraKeys!6395 (_ BitVec 32)) (zeroValue!6501 V!49303) (minValue!6501 V!49303) (_size!3125 (_ BitVec 32)) (_keys!12129 array!83436) (_values!6739 array!83434) (_vacant!3125 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6140)

(assert (=> b!1273299 (= e!726422 (bvsgt #b00000000000000000000000000000000 (size!40786 (_keys!12129 thiss!1559))))))

(declare-fun b!1273300 () Bool)

(declare-fun res!846791 () Bool)

(assert (=> b!1273300 (=> (not res!846791) (not e!726422))))

(assert (=> b!1273300 (= res!846791 (and (= (size!40785 (_values!6739 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34491 thiss!1559))) (= (size!40786 (_keys!12129 thiss!1559)) (size!40785 (_values!6739 thiss!1559))) (bvsge (mask!34491 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6395 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6395 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273301 () Bool)

(declare-fun res!846794 () Bool)

(assert (=> b!1273301 (=> (not res!846794) (not e!726422))))

(declare-datatypes ((List!28568 0))(
  ( (Nil!28565) (Cons!28564 (h!29773 (_ BitVec 64)) (t!42101 List!28568)) )
))
(declare-fun arrayNoDuplicates!0 (array!83436 (_ BitVec 32) List!28568) Bool)

(assert (=> b!1273301 (= res!846794 (arrayNoDuplicates!0 (_keys!12129 thiss!1559) #b00000000000000000000000000000000 Nil!28565))))

(declare-fun mapNonEmpty!51240 () Bool)

(declare-fun mapRes!51240 () Bool)

(declare-fun tp!97679 () Bool)

(declare-fun e!726424 () Bool)

(assert (=> mapNonEmpty!51240 (= mapRes!51240 (and tp!97679 e!726424))))

(declare-fun mapRest!51240 () (Array (_ BitVec 32) ValueCell!15688))

(declare-fun mapKey!51240 () (_ BitVec 32))

(declare-fun mapValue!51240 () ValueCell!15688)

(assert (=> mapNonEmpty!51240 (= (arr!40244 (_values!6739 thiss!1559)) (store mapRest!51240 mapKey!51240 mapValue!51240))))

(declare-fun res!846793 () Bool)

(assert (=> start!107530 (=> (not res!846793) (not e!726422))))

(declare-fun valid!2304 (LongMapFixedSize!6140) Bool)

(assert (=> start!107530 (= res!846793 (valid!2304 thiss!1559))))

(assert (=> start!107530 e!726422))

(declare-fun e!726420 () Bool)

(assert (=> start!107530 e!726420))

(declare-fun mapIsEmpty!51240 () Bool)

(assert (=> mapIsEmpty!51240 mapRes!51240))

(declare-fun b!1273302 () Bool)

(declare-fun res!846792 () Bool)

(assert (=> b!1273302 (=> (not res!846792) (not e!726422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83436 (_ BitVec 32)) Bool)

(assert (=> b!1273302 (= res!846792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12129 thiss!1559) (mask!34491 thiss!1559)))))

(declare-fun b!1273303 () Bool)

(declare-fun e!726423 () Bool)

(declare-fun e!726421 () Bool)

(assert (=> b!1273303 (= e!726423 (and e!726421 mapRes!51240))))

(declare-fun condMapEmpty!51240 () Bool)

(declare-fun mapDefault!51240 () ValueCell!15688)

