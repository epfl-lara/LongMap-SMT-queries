; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89212 () Bool)

(assert start!89212)

(declare-fun b!1022878 () Bool)

(declare-fun b_free!20253 () Bool)

(declare-fun b_next!20253 () Bool)

(assert (=> b!1022878 (= b_free!20253 (not b_next!20253))))

(declare-fun tp!71794 () Bool)

(declare-fun b_and!32475 () Bool)

(assert (=> b!1022878 (= tp!71794 b_and!32475)))

(declare-fun b!1022870 () Bool)

(declare-fun e!576311 () Bool)

(assert (=> b!1022870 (= e!576311 false)))

(declare-fun lt!450345 () Bool)

(declare-datatypes ((V!36837 0))(
  ( (V!36838 (val!12037 Int)) )
))
(declare-datatypes ((ValueCell!11283 0))(
  ( (ValueCellFull!11283 (v!14606 V!36837)) (EmptyCell!11283) )
))
(declare-datatypes ((array!63990 0))(
  ( (array!63991 (arr!30807 (Array (_ BitVec 32) (_ BitVec 64))) (size!31318 (_ BitVec 32))) )
))
(declare-datatypes ((array!63992 0))(
  ( (array!63993 (arr!30808 (Array (_ BitVec 32) ValueCell!11283)) (size!31319 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5160 0))(
  ( (LongMapFixedSize!5161 (defaultEntry!5932 Int) (mask!29539 (_ BitVec 32)) (extraKeys!5664 (_ BitVec 32)) (zeroValue!5768 V!36837) (minValue!5768 V!36837) (_size!2635 (_ BitVec 32)) (_keys!11077 array!63990) (_values!5955 array!63992) (_vacant!2635 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5160)

(declare-datatypes ((List!21697 0))(
  ( (Nil!21694) (Cons!21693 (h!22891 (_ BitVec 64)) (t!30735 List!21697)) )
))
(declare-fun arrayNoDuplicates!0 (array!63990 (_ BitVec 32) List!21697) Bool)

(assert (=> b!1022870 (= lt!450345 (arrayNoDuplicates!0 (_keys!11077 thiss!1427) #b00000000000000000000000000000000 Nil!21694))))

(declare-fun res!685118 () Bool)

(assert (=> start!89212 (=> (not res!685118) (not e!576311))))

(declare-fun valid!1966 (LongMapFixedSize!5160) Bool)

(assert (=> start!89212 (= res!685118 (valid!1966 thiss!1427))))

(assert (=> start!89212 e!576311))

(declare-fun e!576314 () Bool)

(assert (=> start!89212 e!576314))

(assert (=> start!89212 true))

(declare-fun mapNonEmpty!37377 () Bool)

(declare-fun mapRes!37377 () Bool)

(declare-fun tp!71793 () Bool)

(declare-fun e!576310 () Bool)

(assert (=> mapNonEmpty!37377 (= mapRes!37377 (and tp!71793 e!576310))))

(declare-fun mapValue!37377 () ValueCell!11283)

(declare-fun mapRest!37377 () (Array (_ BitVec 32) ValueCell!11283))

(declare-fun mapKey!37377 () (_ BitVec 32))

(assert (=> mapNonEmpty!37377 (= (arr!30808 (_values!5955 thiss!1427)) (store mapRest!37377 mapKey!37377 mapValue!37377))))

(declare-fun b!1022871 () Bool)

(declare-fun res!685117 () Bool)

(assert (=> b!1022871 (=> (not res!685117) (not e!576311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022871 (= res!685117 (validMask!0 (mask!29539 thiss!1427)))))

(declare-fun b!1022872 () Bool)

(declare-fun res!685116 () Bool)

(assert (=> b!1022872 (=> (not res!685116) (not e!576311))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022872 (= res!685116 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1022873 () Bool)

(declare-fun e!576315 () Bool)

(declare-fun e!576313 () Bool)

(assert (=> b!1022873 (= e!576315 (and e!576313 mapRes!37377))))

(declare-fun condMapEmpty!37377 () Bool)

(declare-fun mapDefault!37377 () ValueCell!11283)

(assert (=> b!1022873 (= condMapEmpty!37377 (= (arr!30808 (_values!5955 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11283)) mapDefault!37377)))))

(declare-fun b!1022874 () Bool)

(declare-fun res!685115 () Bool)

(assert (=> b!1022874 (=> (not res!685115) (not e!576311))))

(assert (=> b!1022874 (= res!685115 (and (= (size!31319 (_values!5955 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29539 thiss!1427))) (= (size!31318 (_keys!11077 thiss!1427)) (size!31319 (_values!5955 thiss!1427))) (bvsge (mask!29539 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5664 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5664 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5664 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5664 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5664 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5664 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5664 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022875 () Bool)

(declare-fun tp_is_empty!23973 () Bool)

(assert (=> b!1022875 (= e!576313 tp_is_empty!23973)))

(declare-fun b!1022876 () Bool)

(assert (=> b!1022876 (= e!576310 tp_is_empty!23973)))

(declare-fun b!1022877 () Bool)

(declare-fun res!685114 () Bool)

(assert (=> b!1022877 (=> (not res!685114) (not e!576311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63990 (_ BitVec 32)) Bool)

(assert (=> b!1022877 (= res!685114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11077 thiss!1427) (mask!29539 thiss!1427)))))

(declare-fun mapIsEmpty!37377 () Bool)

(assert (=> mapIsEmpty!37377 mapRes!37377))

(declare-fun array_inv!23871 (array!63990) Bool)

(declare-fun array_inv!23872 (array!63992) Bool)

(assert (=> b!1022878 (= e!576314 (and tp!71794 tp_is_empty!23973 (array_inv!23871 (_keys!11077 thiss!1427)) (array_inv!23872 (_values!5955 thiss!1427)) e!576315))))

(assert (= (and start!89212 res!685118) b!1022872))

(assert (= (and b!1022872 res!685116) b!1022871))

(assert (= (and b!1022871 res!685117) b!1022874))

(assert (= (and b!1022874 res!685115) b!1022877))

(assert (= (and b!1022877 res!685114) b!1022870))

(assert (= (and b!1022873 condMapEmpty!37377) mapIsEmpty!37377))

(assert (= (and b!1022873 (not condMapEmpty!37377)) mapNonEmpty!37377))

(get-info :version)

(assert (= (and mapNonEmpty!37377 ((_ is ValueCellFull!11283) mapValue!37377)) b!1022876))

(assert (= (and b!1022873 ((_ is ValueCellFull!11283) mapDefault!37377)) b!1022875))

(assert (= b!1022878 b!1022873))

(assert (= start!89212 b!1022878))

(declare-fun m!941827 () Bool)

(assert (=> b!1022870 m!941827))

(declare-fun m!941829 () Bool)

(assert (=> b!1022877 m!941829))

(declare-fun m!941831 () Bool)

(assert (=> b!1022878 m!941831))

(declare-fun m!941833 () Bool)

(assert (=> b!1022878 m!941833))

(declare-fun m!941835 () Bool)

(assert (=> mapNonEmpty!37377 m!941835))

(declare-fun m!941837 () Bool)

(assert (=> start!89212 m!941837))

(declare-fun m!941839 () Bool)

(assert (=> b!1022871 m!941839))

(check-sat (not b!1022878) (not mapNonEmpty!37377) (not b_next!20253) (not b!1022877) tp_is_empty!23973 (not b!1022871) (not b!1022870) b_and!32475 (not start!89212))
(check-sat b_and!32475 (not b_next!20253))
