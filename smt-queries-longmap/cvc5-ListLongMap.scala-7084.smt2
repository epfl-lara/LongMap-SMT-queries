; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89558 () Bool)

(assert start!89558)

(declare-fun b!1027309 () Bool)

(declare-fun b_free!20557 () Bool)

(declare-fun b_next!20557 () Bool)

(assert (=> b!1027309 (= b_free!20557 (not b_next!20557))))

(declare-fun tp!72717 () Bool)

(declare-fun b_and!32803 () Bool)

(assert (=> b!1027309 (= tp!72717 b_and!32803)))

(declare-fun mapNonEmpty!37844 () Bool)

(declare-fun mapRes!37844 () Bool)

(declare-fun tp!72716 () Bool)

(declare-fun e!579741 () Bool)

(assert (=> mapNonEmpty!37844 (= mapRes!37844 (and tp!72716 e!579741))))

(declare-datatypes ((V!37243 0))(
  ( (V!37244 (val!12189 Int)) )
))
(declare-datatypes ((ValueCell!11435 0))(
  ( (ValueCellFull!11435 (v!14758 V!37243)) (EmptyCell!11435) )
))
(declare-fun mapValue!37844 () ValueCell!11435)

(declare-datatypes ((array!64604 0))(
  ( (array!64605 (arr!31111 (Array (_ BitVec 32) (_ BitVec 64))) (size!31624 (_ BitVec 32))) )
))
(declare-datatypes ((array!64606 0))(
  ( (array!64607 (arr!31112 (Array (_ BitVec 32) ValueCell!11435)) (size!31625 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5464 0))(
  ( (LongMapFixedSize!5465 (defaultEntry!6084 Int) (mask!29798 (_ BitVec 32)) (extraKeys!5816 (_ BitVec 32)) (zeroValue!5920 V!37243) (minValue!5920 V!37243) (_size!2787 (_ BitVec 32)) (_keys!11231 array!64604) (_values!6107 array!64606) (_vacant!2787 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5464)

(declare-fun mapKey!37844 () (_ BitVec 32))

(declare-fun mapRest!37844 () (Array (_ BitVec 32) ValueCell!11435))

(assert (=> mapNonEmpty!37844 (= (arr!31112 (_values!6107 thiss!1427)) (store mapRest!37844 mapKey!37844 mapValue!37844))))

(declare-fun b!1027301 () Bool)

(declare-fun res!687623 () Bool)

(declare-fun e!579736 () Bool)

(assert (=> b!1027301 (=> res!687623 e!579736)))

(assert (=> b!1027301 (= res!687623 (or (not (= (size!31625 (_values!6107 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29798 thiss!1427)))) (not (= (size!31624 (_keys!11231 thiss!1427)) (size!31625 (_values!6107 thiss!1427)))) (bvslt (mask!29798 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5816 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5816 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37844 () Bool)

(assert (=> mapIsEmpty!37844 mapRes!37844))

(declare-fun b!1027302 () Bool)

(declare-fun res!687625 () Bool)

(declare-fun e!579737 () Bool)

(assert (=> b!1027302 (=> (not res!687625) (not e!579737))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027302 (= res!687625 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027303 () Bool)

(declare-fun e!579739 () Bool)

(declare-fun e!579735 () Bool)

(assert (=> b!1027303 (= e!579739 (and e!579735 mapRes!37844))))

(declare-fun condMapEmpty!37844 () Bool)

(declare-fun mapDefault!37844 () ValueCell!11435)

