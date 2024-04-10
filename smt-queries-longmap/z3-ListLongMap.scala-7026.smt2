; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89170 () Bool)

(assert start!89170)

(declare-fun b!1022393 () Bool)

(declare-fun b_free!20211 () Bool)

(declare-fun b_next!20211 () Bool)

(assert (=> b!1022393 (= b_free!20211 (not b_next!20211))))

(declare-fun tp!71667 () Bool)

(declare-fun b_and!32409 () Bool)

(assert (=> b!1022393 (= tp!71667 b_and!32409)))

(declare-fun b!1022387 () Bool)

(declare-fun e!575937 () Bool)

(assert (=> b!1022387 (= e!575937 false)))

(declare-fun lt!450210 () Bool)

(declare-datatypes ((V!36781 0))(
  ( (V!36782 (val!12016 Int)) )
))
(declare-datatypes ((ValueCell!11262 0))(
  ( (ValueCellFull!11262 (v!14585 V!36781)) (EmptyCell!11262) )
))
(declare-datatypes ((array!63906 0))(
  ( (array!63907 (arr!30765 (Array (_ BitVec 32) (_ BitVec 64))) (size!31276 (_ BitVec 32))) )
))
(declare-datatypes ((array!63908 0))(
  ( (array!63909 (arr!30766 (Array (_ BitVec 32) ValueCell!11262)) (size!31277 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5118 0))(
  ( (LongMapFixedSize!5119 (defaultEntry!5911 Int) (mask!29504 (_ BitVec 32)) (extraKeys!5643 (_ BitVec 32)) (zeroValue!5747 V!36781) (minValue!5747 V!36781) (_size!2614 (_ BitVec 32)) (_keys!11056 array!63906) (_values!5934 array!63908) (_vacant!2614 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5118)

(declare-datatypes ((List!21680 0))(
  ( (Nil!21677) (Cons!21676 (h!22874 (_ BitVec 64)) (t!30694 List!21680)) )
))
(declare-fun arrayNoDuplicates!0 (array!63906 (_ BitVec 32) List!21680) Bool)

(assert (=> b!1022387 (= lt!450210 (arrayNoDuplicates!0 (_keys!11056 thiss!1427) #b00000000000000000000000000000000 Nil!21677))))

(declare-fun mapNonEmpty!37314 () Bool)

(declare-fun mapRes!37314 () Bool)

(declare-fun tp!71668 () Bool)

(declare-fun e!575932 () Bool)

(assert (=> mapNonEmpty!37314 (= mapRes!37314 (and tp!71668 e!575932))))

(declare-fun mapValue!37314 () ValueCell!11262)

(declare-fun mapRest!37314 () (Array (_ BitVec 32) ValueCell!11262))

(declare-fun mapKey!37314 () (_ BitVec 32))

(assert (=> mapNonEmpty!37314 (= (arr!30766 (_values!5934 thiss!1427)) (store mapRest!37314 mapKey!37314 mapValue!37314))))

(declare-fun b!1022388 () Bool)

(declare-fun tp_is_empty!23931 () Bool)

(assert (=> b!1022388 (= e!575932 tp_is_empty!23931)))

(declare-fun b!1022389 () Bool)

(declare-fun e!575935 () Bool)

(assert (=> b!1022389 (= e!575935 tp_is_empty!23931)))

(declare-fun b!1022390 () Bool)

(declare-fun res!684908 () Bool)

(assert (=> b!1022390 (=> (not res!684908) (not e!575937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63906 (_ BitVec 32)) Bool)

(assert (=> b!1022390 (= res!684908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11056 thiss!1427) (mask!29504 thiss!1427)))))

(declare-fun b!1022391 () Bool)

(declare-fun res!684911 () Bool)

(assert (=> b!1022391 (=> (not res!684911) (not e!575937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022391 (= res!684911 (validMask!0 (mask!29504 thiss!1427)))))

(declare-fun b!1022392 () Bool)

(declare-fun e!575933 () Bool)

(assert (=> b!1022392 (= e!575933 (and e!575935 mapRes!37314))))

(declare-fun condMapEmpty!37314 () Bool)

(declare-fun mapDefault!37314 () ValueCell!11262)

(assert (=> b!1022392 (= condMapEmpty!37314 (= (arr!30766 (_values!5934 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11262)) mapDefault!37314)))))

(declare-fun e!575936 () Bool)

(declare-fun array_inv!23851 (array!63906) Bool)

(declare-fun array_inv!23852 (array!63908) Bool)

(assert (=> b!1022393 (= e!575936 (and tp!71667 tp_is_empty!23931 (array_inv!23851 (_keys!11056 thiss!1427)) (array_inv!23852 (_values!5934 thiss!1427)) e!575933))))

(declare-fun mapIsEmpty!37314 () Bool)

(assert (=> mapIsEmpty!37314 mapRes!37314))

(declare-fun res!684909 () Bool)

(assert (=> start!89170 (=> (not res!684909) (not e!575937))))

(declare-fun valid!1949 (LongMapFixedSize!5118) Bool)

(assert (=> start!89170 (= res!684909 (valid!1949 thiss!1427))))

(assert (=> start!89170 e!575937))

(assert (=> start!89170 e!575936))

(assert (=> start!89170 true))

(declare-fun b!1022394 () Bool)

(declare-fun res!684907 () Bool)

(assert (=> b!1022394 (=> (not res!684907) (not e!575937))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022394 (= res!684907 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022395 () Bool)

(declare-fun res!684910 () Bool)

(assert (=> b!1022395 (=> (not res!684910) (not e!575937))))

(assert (=> b!1022395 (= res!684910 (and (= (size!31277 (_values!5934 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29504 thiss!1427))) (= (size!31276 (_keys!11056 thiss!1427)) (size!31277 (_values!5934 thiss!1427))) (bvsge (mask!29504 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5643 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5643 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5643 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5643 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5643 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5643 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5643 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!89170 res!684909) b!1022394))

(assert (= (and b!1022394 res!684907) b!1022391))

(assert (= (and b!1022391 res!684911) b!1022395))

(assert (= (and b!1022395 res!684910) b!1022390))

(assert (= (and b!1022390 res!684908) b!1022387))

(assert (= (and b!1022392 condMapEmpty!37314) mapIsEmpty!37314))

(assert (= (and b!1022392 (not condMapEmpty!37314)) mapNonEmpty!37314))

(get-info :version)

(assert (= (and mapNonEmpty!37314 ((_ is ValueCellFull!11262) mapValue!37314)) b!1022388))

(assert (= (and b!1022392 ((_ is ValueCellFull!11262) mapDefault!37314)) b!1022389))

(assert (= b!1022393 b!1022392))

(assert (= start!89170 b!1022393))

(declare-fun m!941461 () Bool)

(assert (=> b!1022387 m!941461))

(declare-fun m!941463 () Bool)

(assert (=> b!1022391 m!941463))

(declare-fun m!941465 () Bool)

(assert (=> start!89170 m!941465))

(declare-fun m!941467 () Bool)

(assert (=> b!1022390 m!941467))

(declare-fun m!941469 () Bool)

(assert (=> b!1022393 m!941469))

(declare-fun m!941471 () Bool)

(assert (=> b!1022393 m!941471))

(declare-fun m!941473 () Bool)

(assert (=> mapNonEmpty!37314 m!941473))

(check-sat (not b!1022391) (not start!89170) (not b_next!20211) b_and!32409 (not b!1022393) tp_is_empty!23931 (not mapNonEmpty!37314) (not b!1022390) (not b!1022387))
(check-sat b_and!32409 (not b_next!20211))
