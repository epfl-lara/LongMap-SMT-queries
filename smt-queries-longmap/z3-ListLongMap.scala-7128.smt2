; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90456 () Bool)

(assert start!90456)

(declare-fun b!1034905 () Bool)

(declare-fun b_free!20821 () Bool)

(declare-fun b_next!20821 () Bool)

(assert (=> b!1034905 (= b_free!20821 (not b_next!20821))))

(declare-fun tp!73579 () Bool)

(declare-fun b_and!33295 () Bool)

(assert (=> b!1034905 (= tp!73579 b_and!33295)))

(declare-fun b!1034903 () Bool)

(declare-fun e!585100 () Bool)

(declare-fun tp_is_empty!24541 () Bool)

(assert (=> b!1034903 (= e!585100 tp_is_empty!24541)))

(declare-fun b!1034904 () Bool)

(declare-fun e!585099 () Bool)

(declare-datatypes ((V!37595 0))(
  ( (V!37596 (val!12321 Int)) )
))
(declare-datatypes ((ValueCell!11567 0))(
  ( (ValueCellFull!11567 (v!14900 V!37595)) (EmptyCell!11567) )
))
(declare-datatypes ((array!65109 0))(
  ( (array!65110 (arr!31344 (Array (_ BitVec 32) (_ BitVec 64))) (size!31872 (_ BitVec 32))) )
))
(declare-datatypes ((array!65111 0))(
  ( (array!65112 (arr!31345 (Array (_ BitVec 32) ValueCell!11567)) (size!31873 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5728 0))(
  ( (LongMapFixedSize!5729 (defaultEntry!6242 Int) (mask!30111 (_ BitVec 32)) (extraKeys!5972 (_ BitVec 32)) (zeroValue!6076 V!37595) (minValue!6078 V!37595) (_size!2919 (_ BitVec 32)) (_keys!11423 array!65109) (_values!6265 array!65111) (_vacant!2919 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5728)

(assert (=> b!1034904 (= e!585099 (and (= (size!31873 (_values!6265 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30111 thiss!1427))) (= (size!31872 (_keys!11423 thiss!1427)) (size!31873 (_values!6265 thiss!1427))) (bvslt (mask!30111 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun e!585097 () Bool)

(declare-fun e!585096 () Bool)

(declare-fun array_inv!24247 (array!65109) Bool)

(declare-fun array_inv!24248 (array!65111) Bool)

(assert (=> b!1034905 (= e!585097 (and tp!73579 tp_is_empty!24541 (array_inv!24247 (_keys!11423 thiss!1427)) (array_inv!24248 (_values!6265 thiss!1427)) e!585096))))

(declare-fun b!1034906 () Bool)

(declare-fun e!585101 () Bool)

(declare-fun mapRes!38311 () Bool)

(assert (=> b!1034906 (= e!585096 (and e!585101 mapRes!38311))))

(declare-fun condMapEmpty!38311 () Bool)

(declare-fun mapDefault!38311 () ValueCell!11567)

(assert (=> b!1034906 (= condMapEmpty!38311 (= (arr!31345 (_values!6265 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11567)) mapDefault!38311)))))

(declare-fun mapNonEmpty!38311 () Bool)

(declare-fun tp!73580 () Bool)

(assert (=> mapNonEmpty!38311 (= mapRes!38311 (and tp!73580 e!585100))))

(declare-fun mapValue!38311 () ValueCell!11567)

(declare-fun mapRest!38311 () (Array (_ BitVec 32) ValueCell!11567))

(declare-fun mapKey!38311 () (_ BitVec 32))

(assert (=> mapNonEmpty!38311 (= (arr!31345 (_values!6265 thiss!1427)) (store mapRest!38311 mapKey!38311 mapValue!38311))))

(declare-fun res!691114 () Bool)

(assert (=> start!90456 (=> (not res!691114) (not e!585099))))

(declare-fun valid!2153 (LongMapFixedSize!5728) Bool)

(assert (=> start!90456 (= res!691114 (valid!2153 thiss!1427))))

(assert (=> start!90456 e!585099))

(assert (=> start!90456 e!585097))

(assert (=> start!90456 true))

(declare-fun b!1034907 () Bool)

(declare-fun res!691112 () Bool)

(assert (=> b!1034907 (=> (not res!691112) (not e!585099))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034907 (= res!691112 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034908 () Bool)

(assert (=> b!1034908 (= e!585101 tp_is_empty!24541)))

(declare-fun mapIsEmpty!38311 () Bool)

(assert (=> mapIsEmpty!38311 mapRes!38311))

(declare-fun b!1034909 () Bool)

(declare-fun res!691113 () Bool)

(assert (=> b!1034909 (=> (not res!691113) (not e!585099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034909 (= res!691113 (validMask!0 (mask!30111 thiss!1427)))))

(assert (= (and start!90456 res!691114) b!1034907))

(assert (= (and b!1034907 res!691112) b!1034909))

(assert (= (and b!1034909 res!691113) b!1034904))

(assert (= (and b!1034906 condMapEmpty!38311) mapIsEmpty!38311))

(assert (= (and b!1034906 (not condMapEmpty!38311)) mapNonEmpty!38311))

(get-info :version)

(assert (= (and mapNonEmpty!38311 ((_ is ValueCellFull!11567) mapValue!38311)) b!1034903))

(assert (= (and b!1034906 ((_ is ValueCellFull!11567) mapDefault!38311)) b!1034908))

(assert (= b!1034905 b!1034906))

(assert (= start!90456 b!1034905))

(declare-fun m!954579 () Bool)

(assert (=> b!1034905 m!954579))

(declare-fun m!954581 () Bool)

(assert (=> b!1034905 m!954581))

(declare-fun m!954583 () Bool)

(assert (=> mapNonEmpty!38311 m!954583))

(declare-fun m!954585 () Bool)

(assert (=> start!90456 m!954585))

(declare-fun m!954587 () Bool)

(assert (=> b!1034909 m!954587))

(check-sat (not b_next!20821) (not b!1034905) b_and!33295 (not start!90456) tp_is_empty!24541 (not mapNonEmpty!38311) (not b!1034909))
(check-sat b_and!33295 (not b_next!20821))
(get-model)

(declare-fun d!124329 () Bool)

(assert (=> d!124329 (= (validMask!0 (mask!30111 thiss!1427)) (and (or (= (mask!30111 thiss!1427) #b00000000000000000000000000000111) (= (mask!30111 thiss!1427) #b00000000000000000000000000001111) (= (mask!30111 thiss!1427) #b00000000000000000000000000011111) (= (mask!30111 thiss!1427) #b00000000000000000000000000111111) (= (mask!30111 thiss!1427) #b00000000000000000000000001111111) (= (mask!30111 thiss!1427) #b00000000000000000000000011111111) (= (mask!30111 thiss!1427) #b00000000000000000000000111111111) (= (mask!30111 thiss!1427) #b00000000000000000000001111111111) (= (mask!30111 thiss!1427) #b00000000000000000000011111111111) (= (mask!30111 thiss!1427) #b00000000000000000000111111111111) (= (mask!30111 thiss!1427) #b00000000000000000001111111111111) (= (mask!30111 thiss!1427) #b00000000000000000011111111111111) (= (mask!30111 thiss!1427) #b00000000000000000111111111111111) (= (mask!30111 thiss!1427) #b00000000000000001111111111111111) (= (mask!30111 thiss!1427) #b00000000000000011111111111111111) (= (mask!30111 thiss!1427) #b00000000000000111111111111111111) (= (mask!30111 thiss!1427) #b00000000000001111111111111111111) (= (mask!30111 thiss!1427) #b00000000000011111111111111111111) (= (mask!30111 thiss!1427) #b00000000000111111111111111111111) (= (mask!30111 thiss!1427) #b00000000001111111111111111111111) (= (mask!30111 thiss!1427) #b00000000011111111111111111111111) (= (mask!30111 thiss!1427) #b00000000111111111111111111111111) (= (mask!30111 thiss!1427) #b00000001111111111111111111111111) (= (mask!30111 thiss!1427) #b00000011111111111111111111111111) (= (mask!30111 thiss!1427) #b00000111111111111111111111111111) (= (mask!30111 thiss!1427) #b00001111111111111111111111111111) (= (mask!30111 thiss!1427) #b00011111111111111111111111111111) (= (mask!30111 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30111 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034909 d!124329))

(declare-fun d!124331 () Bool)

(declare-fun res!691139 () Bool)

(declare-fun e!585140 () Bool)

(assert (=> d!124331 (=> (not res!691139) (not e!585140))))

(declare-fun simpleValid!409 (LongMapFixedSize!5728) Bool)

(assert (=> d!124331 (= res!691139 (simpleValid!409 thiss!1427))))

(assert (=> d!124331 (= (valid!2153 thiss!1427) e!585140)))

(declare-fun b!1034958 () Bool)

(declare-fun res!691140 () Bool)

(assert (=> b!1034958 (=> (not res!691140) (not e!585140))))

(declare-fun arrayCountValidKeys!0 (array!65109 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034958 (= res!691140 (= (arrayCountValidKeys!0 (_keys!11423 thiss!1427) #b00000000000000000000000000000000 (size!31872 (_keys!11423 thiss!1427))) (_size!2919 thiss!1427)))))

(declare-fun b!1034959 () Bool)

(declare-fun res!691141 () Bool)

(assert (=> b!1034959 (=> (not res!691141) (not e!585140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65109 (_ BitVec 32)) Bool)

(assert (=> b!1034959 (= res!691141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11423 thiss!1427) (mask!30111 thiss!1427)))))

(declare-fun b!1034960 () Bool)

(declare-datatypes ((List!21945 0))(
  ( (Nil!21942) (Cons!21941 (h!23143 (_ BitVec 64)) (t!31139 List!21945)) )
))
(declare-fun arrayNoDuplicates!0 (array!65109 (_ BitVec 32) List!21945) Bool)

(assert (=> b!1034960 (= e!585140 (arrayNoDuplicates!0 (_keys!11423 thiss!1427) #b00000000000000000000000000000000 Nil!21942))))

(assert (= (and d!124331 res!691139) b!1034958))

(assert (= (and b!1034958 res!691140) b!1034959))

(assert (= (and b!1034959 res!691141) b!1034960))

(declare-fun m!954609 () Bool)

(assert (=> d!124331 m!954609))

(declare-fun m!954611 () Bool)

(assert (=> b!1034958 m!954611))

(declare-fun m!954613 () Bool)

(assert (=> b!1034959 m!954613))

(declare-fun m!954615 () Bool)

(assert (=> b!1034960 m!954615))

(assert (=> start!90456 d!124331))

(declare-fun d!124333 () Bool)

(assert (=> d!124333 (= (array_inv!24247 (_keys!11423 thiss!1427)) (bvsge (size!31872 (_keys!11423 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034905 d!124333))

(declare-fun d!124335 () Bool)

(assert (=> d!124335 (= (array_inv!24248 (_values!6265 thiss!1427)) (bvsge (size!31873 (_values!6265 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034905 d!124335))

(declare-fun mapIsEmpty!38320 () Bool)

(declare-fun mapRes!38320 () Bool)

(assert (=> mapIsEmpty!38320 mapRes!38320))

(declare-fun b!1034968 () Bool)

(declare-fun e!585146 () Bool)

(assert (=> b!1034968 (= e!585146 tp_is_empty!24541)))

(declare-fun condMapEmpty!38320 () Bool)

(declare-fun mapDefault!38320 () ValueCell!11567)

(assert (=> mapNonEmpty!38311 (= condMapEmpty!38320 (= mapRest!38311 ((as const (Array (_ BitVec 32) ValueCell!11567)) mapDefault!38320)))))

(assert (=> mapNonEmpty!38311 (= tp!73580 (and e!585146 mapRes!38320))))

(declare-fun mapNonEmpty!38320 () Bool)

(declare-fun tp!73595 () Bool)

(declare-fun e!585145 () Bool)

(assert (=> mapNonEmpty!38320 (= mapRes!38320 (and tp!73595 e!585145))))

(declare-fun mapRest!38320 () (Array (_ BitVec 32) ValueCell!11567))

(declare-fun mapKey!38320 () (_ BitVec 32))

(declare-fun mapValue!38320 () ValueCell!11567)

(assert (=> mapNonEmpty!38320 (= mapRest!38311 (store mapRest!38320 mapKey!38320 mapValue!38320))))

(declare-fun b!1034967 () Bool)

(assert (=> b!1034967 (= e!585145 tp_is_empty!24541)))

(assert (= (and mapNonEmpty!38311 condMapEmpty!38320) mapIsEmpty!38320))

(assert (= (and mapNonEmpty!38311 (not condMapEmpty!38320)) mapNonEmpty!38320))

(assert (= (and mapNonEmpty!38320 ((_ is ValueCellFull!11567) mapValue!38320)) b!1034967))

(assert (= (and mapNonEmpty!38311 ((_ is ValueCellFull!11567) mapDefault!38320)) b!1034968))

(declare-fun m!954617 () Bool)

(assert (=> mapNonEmpty!38320 m!954617))

(check-sat (not b!1034960) (not b_next!20821) b_and!33295 (not d!124331) tp_is_empty!24541 (not mapNonEmpty!38320) (not b!1034958) (not b!1034959))
(check-sat b_and!33295 (not b_next!20821))
