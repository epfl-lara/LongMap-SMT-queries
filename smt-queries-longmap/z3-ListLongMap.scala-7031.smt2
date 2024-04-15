; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89196 () Bool)

(assert start!89196)

(declare-fun b!1022536 () Bool)

(declare-fun b_free!20239 () Bool)

(declare-fun b_next!20239 () Bool)

(assert (=> b!1022536 (= b_free!20239 (not b_next!20239))))

(declare-fun tp!71751 () Bool)

(declare-fun b_and!32435 () Bool)

(assert (=> b!1022536 (= tp!71751 b_and!32435)))

(declare-fun mapNonEmpty!37356 () Bool)

(declare-fun mapRes!37356 () Bool)

(declare-fun tp!71752 () Bool)

(declare-fun e!576093 () Bool)

(assert (=> mapNonEmpty!37356 (= mapRes!37356 (and tp!71752 e!576093))))

(declare-fun mapKey!37356 () (_ BitVec 32))

(declare-datatypes ((V!36819 0))(
  ( (V!36820 (val!12030 Int)) )
))
(declare-datatypes ((ValueCell!11276 0))(
  ( (ValueCellFull!11276 (v!14598 V!36819)) (EmptyCell!11276) )
))
(declare-fun mapValue!37356 () ValueCell!11276)

(declare-datatypes ((array!63901 0))(
  ( (array!63902 (arr!30762 (Array (_ BitVec 32) (_ BitVec 64))) (size!31275 (_ BitVec 32))) )
))
(declare-datatypes ((array!63903 0))(
  ( (array!63904 (arr!30763 (Array (_ BitVec 32) ValueCell!11276)) (size!31276 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5146 0))(
  ( (LongMapFixedSize!5147 (defaultEntry!5925 Int) (mask!29523 (_ BitVec 32)) (extraKeys!5657 (_ BitVec 32)) (zeroValue!5761 V!36819) (minValue!5761 V!36819) (_size!2628 (_ BitVec 32)) (_keys!11066 array!63901) (_values!5948 array!63903) (_vacant!2628 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5146)

(declare-fun mapRest!37356 () (Array (_ BitVec 32) ValueCell!11276))

(assert (=> mapNonEmpty!37356 (= (arr!30763 (_values!5948 thiss!1427)) (store mapRest!37356 mapKey!37356 mapValue!37356))))

(declare-fun b!1022530 () Bool)

(declare-fun res!684946 () Bool)

(declare-fun e!576098 () Bool)

(assert (=> b!1022530 (=> (not res!684946) (not e!576098))))

(assert (=> b!1022530 (= res!684946 (and (= (size!31276 (_values!5948 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29523 thiss!1427))) (= (size!31275 (_keys!11066 thiss!1427)) (size!31276 (_values!5948 thiss!1427))) (bvsge (mask!29523 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5657 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5657 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022531 () Bool)

(declare-fun res!684944 () Bool)

(assert (=> b!1022531 (=> (not res!684944) (not e!576098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022531 (= res!684944 (validMask!0 (mask!29523 thiss!1427)))))

(declare-fun b!1022533 () Bool)

(assert (=> b!1022533 (= e!576098 false)))

(declare-fun lt!450124 () Bool)

(declare-datatypes ((List!21723 0))(
  ( (Nil!21720) (Cons!21719 (h!22917 (_ BitVec 64)) (t!30752 List!21723)) )
))
(declare-fun arrayNoDuplicates!0 (array!63901 (_ BitVec 32) List!21723) Bool)

(assert (=> b!1022533 (= lt!450124 (arrayNoDuplicates!0 (_keys!11066 thiss!1427) #b00000000000000000000000000000000 Nil!21720))))

(declare-fun mapIsEmpty!37356 () Bool)

(assert (=> mapIsEmpty!37356 mapRes!37356))

(declare-fun b!1022534 () Bool)

(declare-fun e!576095 () Bool)

(declare-fun tp_is_empty!23959 () Bool)

(assert (=> b!1022534 (= e!576095 tp_is_empty!23959)))

(declare-fun b!1022535 () Bool)

(declare-fun e!576096 () Bool)

(assert (=> b!1022535 (= e!576096 (and e!576095 mapRes!37356))))

(declare-fun condMapEmpty!37356 () Bool)

(declare-fun mapDefault!37356 () ValueCell!11276)

(assert (=> b!1022535 (= condMapEmpty!37356 (= (arr!30763 (_values!5948 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11276)) mapDefault!37356)))))

(declare-fun e!576097 () Bool)

(declare-fun array_inv!23861 (array!63901) Bool)

(declare-fun array_inv!23862 (array!63903) Bool)

(assert (=> b!1022536 (= e!576097 (and tp!71751 tp_is_empty!23959 (array_inv!23861 (_keys!11066 thiss!1427)) (array_inv!23862 (_values!5948 thiss!1427)) e!576096))))

(declare-fun b!1022532 () Bool)

(declare-fun res!684945 () Bool)

(assert (=> b!1022532 (=> (not res!684945) (not e!576098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63901 (_ BitVec 32)) Bool)

(assert (=> b!1022532 (= res!684945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11066 thiss!1427) (mask!29523 thiss!1427)))))

(declare-fun res!684942 () Bool)

(assert (=> start!89196 (=> (not res!684942) (not e!576098))))

(declare-fun valid!1961 (LongMapFixedSize!5146) Bool)

(assert (=> start!89196 (= res!684942 (valid!1961 thiss!1427))))

(assert (=> start!89196 e!576098))

(assert (=> start!89196 e!576097))

(assert (=> start!89196 true))

(declare-fun b!1022537 () Bool)

(declare-fun res!684943 () Bool)

(assert (=> b!1022537 (=> (not res!684943) (not e!576098))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022537 (= res!684943 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1022538 () Bool)

(assert (=> b!1022538 (= e!576093 tp_is_empty!23959)))

(assert (= (and start!89196 res!684942) b!1022537))

(assert (= (and b!1022537 res!684943) b!1022531))

(assert (= (and b!1022531 res!684944) b!1022530))

(assert (= (and b!1022530 res!684946) b!1022532))

(assert (= (and b!1022532 res!684945) b!1022533))

(assert (= (and b!1022535 condMapEmpty!37356) mapIsEmpty!37356))

(assert (= (and b!1022535 (not condMapEmpty!37356)) mapNonEmpty!37356))

(get-info :version)

(assert (= (and mapNonEmpty!37356 ((_ is ValueCellFull!11276) mapValue!37356)) b!1022538))

(assert (= (and b!1022535 ((_ is ValueCellFull!11276) mapDefault!37356)) b!1022534))

(assert (= b!1022536 b!1022535))

(assert (= start!89196 b!1022536))

(declare-fun m!941109 () Bool)

(assert (=> b!1022532 m!941109))

(declare-fun m!941111 () Bool)

(assert (=> b!1022531 m!941111))

(declare-fun m!941113 () Bool)

(assert (=> b!1022536 m!941113))

(declare-fun m!941115 () Bool)

(assert (=> b!1022536 m!941115))

(declare-fun m!941117 () Bool)

(assert (=> mapNonEmpty!37356 m!941117))

(declare-fun m!941119 () Bool)

(assert (=> b!1022533 m!941119))

(declare-fun m!941121 () Bool)

(assert (=> start!89196 m!941121))

(check-sat (not b!1022532) (not b!1022533) tp_is_empty!23959 (not b_next!20239) (not mapNonEmpty!37356) b_and!32435 (not start!89196) (not b!1022531) (not b!1022536))
(check-sat b_and!32435 (not b_next!20239))
