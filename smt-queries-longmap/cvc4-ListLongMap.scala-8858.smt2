; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107474 () Bool)

(assert start!107474)

(declare-fun b!1272948 () Bool)

(declare-fun b_free!27695 () Bool)

(declare-fun b_next!27695 () Bool)

(assert (=> b!1272948 (= b_free!27695 (not b_next!27695))))

(declare-fun tp!97616 () Bool)

(declare-fun b_and!45751 () Bool)

(assert (=> b!1272948 (= tp!97616 b_and!45751)))

(declare-fun b!1272943 () Bool)

(declare-fun e!726172 () Bool)

(declare-datatypes ((V!49279 0))(
  ( (V!49280 (val!16607 Int)) )
))
(declare-datatypes ((ValueCell!15679 0))(
  ( (ValueCellFull!15679 (v!19244 V!49279)) (EmptyCell!15679) )
))
(declare-datatypes ((array!83392 0))(
  ( (array!83393 (arr!40226 (Array (_ BitVec 32) ValueCell!15679)) (size!40766 (_ BitVec 32))) )
))
(declare-datatypes ((array!83394 0))(
  ( (array!83395 (arr!40227 (Array (_ BitVec 32) (_ BitVec 64))) (size!40767 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6122 0))(
  ( (LongMapFixedSize!6123 (defaultEntry!6707 Int) (mask!34470 (_ BitVec 32)) (extraKeys!6386 (_ BitVec 32)) (zeroValue!6492 V!49279) (minValue!6492 V!49279) (_size!3116 (_ BitVec 32)) (_keys!12117 array!83394) (_values!6730 array!83392) (_vacant!3116 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6122)

(assert (=> b!1272943 (= e!726172 (and (= (size!40766 (_values!6730 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34470 thiss!1559))) (= (size!40767 (_keys!12117 thiss!1559)) (size!40766 (_values!6730 thiss!1559))) (bvsge (mask!34470 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6386 thiss!1559) #b00000000000000000000000000000000) (bvsgt (extraKeys!6386 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51203 () Bool)

(declare-fun mapRes!51203 () Bool)

(assert (=> mapIsEmpty!51203 mapRes!51203))

(declare-fun res!846611 () Bool)

(assert (=> start!107474 (=> (not res!846611) (not e!726172))))

(declare-fun valid!2297 (LongMapFixedSize!6122) Bool)

(assert (=> start!107474 (= res!846611 (valid!2297 thiss!1559))))

(assert (=> start!107474 e!726172))

(declare-fun e!726169 () Bool)

(assert (=> start!107474 e!726169))

(declare-fun mapNonEmpty!51203 () Bool)

(declare-fun tp!97615 () Bool)

(declare-fun e!726170 () Bool)

(assert (=> mapNonEmpty!51203 (= mapRes!51203 (and tp!97615 e!726170))))

(declare-fun mapValue!51203 () ValueCell!15679)

(declare-fun mapKey!51203 () (_ BitVec 32))

(declare-fun mapRest!51203 () (Array (_ BitVec 32) ValueCell!15679))

(assert (=> mapNonEmpty!51203 (= (arr!40226 (_values!6730 thiss!1559)) (store mapRest!51203 mapKey!51203 mapValue!51203))))

(declare-fun b!1272944 () Bool)

(declare-fun res!846612 () Bool)

(assert (=> b!1272944 (=> (not res!846612) (not e!726172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272944 (= res!846612 (validMask!0 (mask!34470 thiss!1559)))))

(declare-fun b!1272945 () Bool)

(declare-fun e!726173 () Bool)

(declare-fun e!726174 () Bool)

(assert (=> b!1272945 (= e!726173 (and e!726174 mapRes!51203))))

(declare-fun condMapEmpty!51203 () Bool)

(declare-fun mapDefault!51203 () ValueCell!15679)

