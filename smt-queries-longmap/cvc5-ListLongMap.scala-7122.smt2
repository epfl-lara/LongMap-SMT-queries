; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90266 () Bool)

(assert start!90266)

(declare-fun b!1033349 () Bool)

(declare-fun b_free!20785 () Bool)

(declare-fun b_next!20785 () Bool)

(assert (=> b!1033349 (= b_free!20785 (not b_next!20785))))

(declare-fun tp!73448 () Bool)

(declare-fun b_and!33253 () Bool)

(assert (=> b!1033349 (= tp!73448 b_and!33253)))

(declare-fun b!1033346 () Bool)

(declare-fun e!584064 () Bool)

(declare-fun tp_is_empty!24505 () Bool)

(assert (=> b!1033346 (= e!584064 tp_is_empty!24505)))

(declare-fun mapIsEmpty!38234 () Bool)

(declare-fun mapRes!38234 () Bool)

(assert (=> mapIsEmpty!38234 mapRes!38234))

(declare-fun b!1033347 () Bool)

(declare-fun e!584065 () Bool)

(declare-datatypes ((V!37547 0))(
  ( (V!37548 (val!12303 Int)) )
))
(declare-datatypes ((ValueCell!11549 0))(
  ( (ValueCellFull!11549 (v!14880 V!37547)) (EmptyCell!11549) )
))
(declare-datatypes ((array!65086 0))(
  ( (array!65087 (arr!31339 (Array (_ BitVec 32) (_ BitVec 64))) (size!31861 (_ BitVec 32))) )
))
(declare-datatypes ((array!65088 0))(
  ( (array!65089 (arr!31340 (Array (_ BitVec 32) ValueCell!11549)) (size!31862 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5692 0))(
  ( (LongMapFixedSize!5693 (defaultEntry!6220 Int) (mask!30069 (_ BitVec 32)) (extraKeys!5952 (_ BitVec 32)) (zeroValue!6056 V!37547) (minValue!6056 V!37547) (_size!2901 (_ BitVec 32)) (_keys!11398 array!65086) (_values!6243 array!65088) (_vacant!2901 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5692)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65086 (_ BitVec 32)) Bool)

(assert (=> b!1033347 (= e!584065 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11398 thiss!1427) (mask!30069 thiss!1427))))))

(declare-fun b!1033348 () Bool)

(declare-fun e!584062 () Bool)

(assert (=> b!1033348 (= e!584062 tp_is_empty!24505)))

(declare-fun e!584061 () Bool)

(declare-fun e!584063 () Bool)

(declare-fun array_inv!24247 (array!65086) Bool)

(declare-fun array_inv!24248 (array!65088) Bool)

(assert (=> b!1033349 (= e!584063 (and tp!73448 tp_is_empty!24505 (array_inv!24247 (_keys!11398 thiss!1427)) (array_inv!24248 (_values!6243 thiss!1427)) e!584061))))

(declare-fun b!1033350 () Bool)

(declare-fun res!690460 () Bool)

(assert (=> b!1033350 (=> (not res!690460) (not e!584065))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033350 (= res!690460 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38234 () Bool)

(declare-fun tp!73449 () Bool)

(assert (=> mapNonEmpty!38234 (= mapRes!38234 (and tp!73449 e!584062))))

(declare-fun mapKey!38234 () (_ BitVec 32))

(declare-fun mapRest!38234 () (Array (_ BitVec 32) ValueCell!11549))

(declare-fun mapValue!38234 () ValueCell!11549)

(assert (=> mapNonEmpty!38234 (= (arr!31340 (_values!6243 thiss!1427)) (store mapRest!38234 mapKey!38234 mapValue!38234))))

(declare-fun b!1033351 () Bool)

(declare-fun res!690458 () Bool)

(assert (=> b!1033351 (=> (not res!690458) (not e!584065))))

(assert (=> b!1033351 (= res!690458 (and (= (size!31862 (_values!6243 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30069 thiss!1427))) (= (size!31861 (_keys!11398 thiss!1427)) (size!31862 (_values!6243 thiss!1427))) (bvsge (mask!30069 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5952 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5952 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!690461 () Bool)

(assert (=> start!90266 (=> (not res!690461) (not e!584065))))

(declare-fun valid!2151 (LongMapFixedSize!5692) Bool)

(assert (=> start!90266 (= res!690461 (valid!2151 thiss!1427))))

(assert (=> start!90266 e!584065))

(assert (=> start!90266 e!584063))

(assert (=> start!90266 true))

(declare-fun b!1033352 () Bool)

(declare-fun res!690459 () Bool)

(assert (=> b!1033352 (=> (not res!690459) (not e!584065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033352 (= res!690459 (validMask!0 (mask!30069 thiss!1427)))))

(declare-fun b!1033353 () Bool)

(assert (=> b!1033353 (= e!584061 (and e!584064 mapRes!38234))))

(declare-fun condMapEmpty!38234 () Bool)

(declare-fun mapDefault!38234 () ValueCell!11549)

