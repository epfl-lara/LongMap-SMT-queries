; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89104 () Bool)

(assert start!89104)

(declare-fun b!1021499 () Bool)

(declare-fun b_free!20145 () Bool)

(declare-fun b_next!20145 () Bool)

(assert (=> b!1021499 (= b_free!20145 (not b_next!20145))))

(declare-fun tp!71470 () Bool)

(declare-fun b_and!32343 () Bool)

(assert (=> b!1021499 (= tp!71470 b_and!32343)))

(declare-fun b!1021496 () Bool)

(declare-fun res!684416 () Bool)

(declare-fun e!575342 () Bool)

(assert (=> b!1021496 (=> (not res!684416) (not e!575342))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021496 (= res!684416 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021497 () Bool)

(declare-fun e!575341 () Bool)

(declare-fun e!575339 () Bool)

(declare-fun mapRes!37215 () Bool)

(assert (=> b!1021497 (= e!575341 (and e!575339 mapRes!37215))))

(declare-fun condMapEmpty!37215 () Bool)

(declare-datatypes ((V!36693 0))(
  ( (V!36694 (val!11983 Int)) )
))
(declare-datatypes ((ValueCell!11229 0))(
  ( (ValueCellFull!11229 (v!14552 V!36693)) (EmptyCell!11229) )
))
(declare-datatypes ((array!63774 0))(
  ( (array!63775 (arr!30699 (Array (_ BitVec 32) (_ BitVec 64))) (size!31210 (_ BitVec 32))) )
))
(declare-datatypes ((array!63776 0))(
  ( (array!63777 (arr!30700 (Array (_ BitVec 32) ValueCell!11229)) (size!31211 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5052 0))(
  ( (LongMapFixedSize!5053 (defaultEntry!5878 Int) (mask!29449 (_ BitVec 32)) (extraKeys!5610 (_ BitVec 32)) (zeroValue!5714 V!36693) (minValue!5714 V!36693) (_size!2581 (_ BitVec 32)) (_keys!11023 array!63774) (_values!5901 array!63776) (_vacant!2581 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5052)

(declare-fun mapDefault!37215 () ValueCell!11229)

(assert (=> b!1021497 (= condMapEmpty!37215 (= (arr!30700 (_values!5901 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11229)) mapDefault!37215)))))

(declare-fun b!1021498 () Bool)

(declare-fun res!684413 () Bool)

(assert (=> b!1021498 (=> (not res!684413) (not e!575342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63774 (_ BitVec 32)) Bool)

(assert (=> b!1021498 (= res!684413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11023 thiss!1427) (mask!29449 thiss!1427)))))

(declare-fun tp_is_empty!23865 () Bool)

(declare-fun e!575338 () Bool)

(declare-fun array_inv!23807 (array!63774) Bool)

(declare-fun array_inv!23808 (array!63776) Bool)

(assert (=> b!1021499 (= e!575338 (and tp!71470 tp_is_empty!23865 (array_inv!23807 (_keys!11023 thiss!1427)) (array_inv!23808 (_values!5901 thiss!1427)) e!575341))))

(declare-fun mapIsEmpty!37215 () Bool)

(assert (=> mapIsEmpty!37215 mapRes!37215))

(declare-fun b!1021500 () Bool)

(declare-fun res!684415 () Bool)

(assert (=> b!1021500 (=> (not res!684415) (not e!575342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021500 (= res!684415 (validMask!0 (mask!29449 thiss!1427)))))

(declare-fun b!1021501 () Bool)

(declare-fun e!575340 () Bool)

(assert (=> b!1021501 (= e!575340 tp_is_empty!23865)))

(declare-fun mapNonEmpty!37215 () Bool)

(declare-fun tp!71469 () Bool)

(assert (=> mapNonEmpty!37215 (= mapRes!37215 (and tp!71469 e!575340))))

(declare-fun mapRest!37215 () (Array (_ BitVec 32) ValueCell!11229))

(declare-fun mapValue!37215 () ValueCell!11229)

(declare-fun mapKey!37215 () (_ BitVec 32))

(assert (=> mapNonEmpty!37215 (= (arr!30700 (_values!5901 thiss!1427)) (store mapRest!37215 mapKey!37215 mapValue!37215))))

(declare-fun b!1021502 () Bool)

(declare-fun res!684412 () Bool)

(assert (=> b!1021502 (=> (not res!684412) (not e!575342))))

(assert (=> b!1021502 (= res!684412 (and (= (size!31211 (_values!5901 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29449 thiss!1427))) (= (size!31210 (_keys!11023 thiss!1427)) (size!31211 (_values!5901 thiss!1427))) (bvsge (mask!29449 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5610 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5610 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5610 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5610 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5610 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5610 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5610 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!684414 () Bool)

(assert (=> start!89104 (=> (not res!684414) (not e!575342))))

(declare-fun valid!1927 (LongMapFixedSize!5052) Bool)

(assert (=> start!89104 (= res!684414 (valid!1927 thiss!1427))))

(assert (=> start!89104 e!575342))

(assert (=> start!89104 e!575338))

(assert (=> start!89104 true))

(declare-fun b!1021503 () Bool)

(assert (=> b!1021503 (= e!575342 false)))

(declare-fun lt!450111 () Bool)

(declare-datatypes ((List!21656 0))(
  ( (Nil!21653) (Cons!21652 (h!22850 (_ BitVec 64)) (t!30670 List!21656)) )
))
(declare-fun arrayNoDuplicates!0 (array!63774 (_ BitVec 32) List!21656) Bool)

(assert (=> b!1021503 (= lt!450111 (arrayNoDuplicates!0 (_keys!11023 thiss!1427) #b00000000000000000000000000000000 Nil!21653))))

(declare-fun b!1021504 () Bool)

(assert (=> b!1021504 (= e!575339 tp_is_empty!23865)))

(assert (= (and start!89104 res!684414) b!1021496))

(assert (= (and b!1021496 res!684416) b!1021500))

(assert (= (and b!1021500 res!684415) b!1021502))

(assert (= (and b!1021502 res!684412) b!1021498))

(assert (= (and b!1021498 res!684413) b!1021503))

(assert (= (and b!1021497 condMapEmpty!37215) mapIsEmpty!37215))

(assert (= (and b!1021497 (not condMapEmpty!37215)) mapNonEmpty!37215))

(get-info :version)

(assert (= (and mapNonEmpty!37215 ((_ is ValueCellFull!11229) mapValue!37215)) b!1021501))

(assert (= (and b!1021497 ((_ is ValueCellFull!11229) mapDefault!37215)) b!1021504))

(assert (= b!1021499 b!1021497))

(assert (= start!89104 b!1021499))

(declare-fun m!940999 () Bool)

(assert (=> b!1021499 m!940999))

(declare-fun m!941001 () Bool)

(assert (=> b!1021499 m!941001))

(declare-fun m!941003 () Bool)

(assert (=> mapNonEmpty!37215 m!941003))

(declare-fun m!941005 () Bool)

(assert (=> b!1021498 m!941005))

(declare-fun m!941007 () Bool)

(assert (=> start!89104 m!941007))

(declare-fun m!941009 () Bool)

(assert (=> b!1021503 m!941009))

(declare-fun m!941011 () Bool)

(assert (=> b!1021500 m!941011))

(check-sat (not mapNonEmpty!37215) (not b!1021503) (not b!1021499) (not b!1021500) (not b!1021498) (not start!89104) b_and!32343 (not b_next!20145) tp_is_empty!23865)
(check-sat b_and!32343 (not b_next!20145))
