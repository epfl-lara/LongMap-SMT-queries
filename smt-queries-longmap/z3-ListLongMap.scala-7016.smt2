; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89106 () Bool)

(assert start!89106)

(declare-fun b!1021407 () Bool)

(declare-fun b_free!20149 () Bool)

(declare-fun b_next!20149 () Bool)

(assert (=> b!1021407 (= b_free!20149 (not b_next!20149))))

(declare-fun tp!71481 () Bool)

(declare-fun b_and!32321 () Bool)

(assert (=> b!1021407 (= tp!71481 b_and!32321)))

(declare-fun b!1021399 () Bool)

(declare-fun res!684376 () Bool)

(declare-fun e!575284 () Bool)

(assert (=> b!1021399 (=> (not res!684376) (not e!575284))))

(declare-datatypes ((V!36699 0))(
  ( (V!36700 (val!11985 Int)) )
))
(declare-datatypes ((ValueCell!11231 0))(
  ( (ValueCellFull!11231 (v!14553 V!36699)) (EmptyCell!11231) )
))
(declare-datatypes ((array!63721 0))(
  ( (array!63722 (arr!30672 (Array (_ BitVec 32) (_ BitVec 64))) (size!31185 (_ BitVec 32))) )
))
(declare-datatypes ((array!63723 0))(
  ( (array!63724 (arr!30673 (Array (_ BitVec 32) ValueCell!11231)) (size!31186 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5056 0))(
  ( (LongMapFixedSize!5057 (defaultEntry!5880 Int) (mask!29448 (_ BitVec 32)) (extraKeys!5612 (_ BitVec 32)) (zeroValue!5716 V!36699) (minValue!5716 V!36699) (_size!2583 (_ BitVec 32)) (_keys!11021 array!63721) (_values!5903 array!63723) (_vacant!2583 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5056)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63721 (_ BitVec 32)) Bool)

(assert (=> b!1021399 (= res!684376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11021 thiss!1427) (mask!29448 thiss!1427)))))

(declare-fun b!1021400 () Bool)

(assert (=> b!1021400 (= e!575284 false)))

(declare-fun lt!449917 () Bool)

(declare-datatypes ((List!21691 0))(
  ( (Nil!21688) (Cons!21687 (h!22885 (_ BitVec 64)) (t!30696 List!21691)) )
))
(declare-fun arrayNoDuplicates!0 (array!63721 (_ BitVec 32) List!21691) Bool)

(assert (=> b!1021400 (= lt!449917 (arrayNoDuplicates!0 (_keys!11021 thiss!1427) #b00000000000000000000000000000000 Nil!21688))))

(declare-fun b!1021401 () Bool)

(declare-fun res!684379 () Bool)

(assert (=> b!1021401 (=> (not res!684379) (not e!575284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021401 (= res!684379 (validMask!0 (mask!29448 thiss!1427)))))

(declare-fun b!1021402 () Bool)

(declare-fun e!575286 () Bool)

(declare-fun e!575288 () Bool)

(declare-fun mapRes!37221 () Bool)

(assert (=> b!1021402 (= e!575286 (and e!575288 mapRes!37221))))

(declare-fun condMapEmpty!37221 () Bool)

(declare-fun mapDefault!37221 () ValueCell!11231)

(assert (=> b!1021402 (= condMapEmpty!37221 (= (arr!30673 (_values!5903 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11231)) mapDefault!37221)))))

(declare-fun res!684375 () Bool)

(assert (=> start!89106 (=> (not res!684375) (not e!575284))))

(declare-fun valid!1930 (LongMapFixedSize!5056) Bool)

(assert (=> start!89106 (= res!684375 (valid!1930 thiss!1427))))

(assert (=> start!89106 e!575284))

(declare-fun e!575287 () Bool)

(assert (=> start!89106 e!575287))

(assert (=> start!89106 true))

(declare-fun b!1021403 () Bool)

(declare-fun res!684378 () Bool)

(assert (=> b!1021403 (=> (not res!684378) (not e!575284))))

(assert (=> b!1021403 (= res!684378 (and (= (size!31186 (_values!5903 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29448 thiss!1427))) (= (size!31185 (_keys!11021 thiss!1427)) (size!31186 (_values!5903 thiss!1427))) (bvsge (mask!29448 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5612 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5612 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37221 () Bool)

(assert (=> mapIsEmpty!37221 mapRes!37221))

(declare-fun mapNonEmpty!37221 () Bool)

(declare-fun tp!71482 () Bool)

(declare-fun e!575283 () Bool)

(assert (=> mapNonEmpty!37221 (= mapRes!37221 (and tp!71482 e!575283))))

(declare-fun mapKey!37221 () (_ BitVec 32))

(declare-fun mapRest!37221 () (Array (_ BitVec 32) ValueCell!11231))

(declare-fun mapValue!37221 () ValueCell!11231)

(assert (=> mapNonEmpty!37221 (= (arr!30673 (_values!5903 thiss!1427)) (store mapRest!37221 mapKey!37221 mapValue!37221))))

(declare-fun b!1021404 () Bool)

(declare-fun res!684377 () Bool)

(assert (=> b!1021404 (=> (not res!684377) (not e!575284))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021404 (= res!684377 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021405 () Bool)

(declare-fun tp_is_empty!23869 () Bool)

(assert (=> b!1021405 (= e!575288 tp_is_empty!23869)))

(declare-fun b!1021406 () Bool)

(assert (=> b!1021406 (= e!575283 tp_is_empty!23869)))

(declare-fun array_inv!23797 (array!63721) Bool)

(declare-fun array_inv!23798 (array!63723) Bool)

(assert (=> b!1021407 (= e!575287 (and tp!71481 tp_is_empty!23869 (array_inv!23797 (_keys!11021 thiss!1427)) (array_inv!23798 (_values!5903 thiss!1427)) e!575286))))

(assert (= (and start!89106 res!684375) b!1021404))

(assert (= (and b!1021404 res!684377) b!1021401))

(assert (= (and b!1021401 res!684379) b!1021403))

(assert (= (and b!1021403 res!684378) b!1021399))

(assert (= (and b!1021399 res!684376) b!1021400))

(assert (= (and b!1021402 condMapEmpty!37221) mapIsEmpty!37221))

(assert (= (and b!1021402 (not condMapEmpty!37221)) mapNonEmpty!37221))

(get-info :version)

(assert (= (and mapNonEmpty!37221 ((_ is ValueCellFull!11231) mapValue!37221)) b!1021406))

(assert (= (and b!1021402 ((_ is ValueCellFull!11231) mapDefault!37221)) b!1021405))

(assert (= b!1021407 b!1021402))

(assert (= start!89106 b!1021407))

(declare-fun m!940407 () Bool)

(assert (=> b!1021399 m!940407))

(declare-fun m!940409 () Bool)

(assert (=> start!89106 m!940409))

(declare-fun m!940411 () Bool)

(assert (=> b!1021407 m!940411))

(declare-fun m!940413 () Bool)

(assert (=> b!1021407 m!940413))

(declare-fun m!940415 () Bool)

(assert (=> mapNonEmpty!37221 m!940415))

(declare-fun m!940417 () Bool)

(assert (=> b!1021400 m!940417))

(declare-fun m!940419 () Bool)

(assert (=> b!1021401 m!940419))

(check-sat (not b!1021399) (not b!1021401) (not b_next!20149) (not mapNonEmpty!37221) (not b!1021407) (not b!1021400) b_and!32321 tp_is_empty!23869 (not start!89106))
(check-sat b_and!32321 (not b_next!20149))
