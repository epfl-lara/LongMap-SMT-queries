; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89372 () Bool)

(assert start!89372)

(declare-fun b!1023271 () Bool)

(declare-fun b_free!20179 () Bool)

(declare-fun b_next!20179 () Bool)

(assert (=> b!1023271 (= b_free!20179 (not b_next!20179))))

(declare-fun tp!71571 () Bool)

(declare-fun b_and!32387 () Bool)

(assert (=> b!1023271 (= tp!71571 b_and!32387)))

(declare-fun b!1023270 () Bool)

(declare-fun e!576487 () Bool)

(declare-fun tp_is_empty!23899 () Bool)

(assert (=> b!1023270 (= e!576487 tp_is_empty!23899)))

(declare-fun mapIsEmpty!37266 () Bool)

(declare-fun mapRes!37266 () Bool)

(assert (=> mapIsEmpty!37266 mapRes!37266))

(declare-fun e!576488 () Bool)

(declare-datatypes ((V!36739 0))(
  ( (V!36740 (val!12000 Int)) )
))
(declare-datatypes ((ValueCell!11246 0))(
  ( (ValueCellFull!11246 (v!14565 V!36739)) (EmptyCell!11246) )
))
(declare-datatypes ((array!63891 0))(
  ( (array!63892 (arr!30751 (Array (_ BitVec 32) (_ BitVec 64))) (size!31263 (_ BitVec 32))) )
))
(declare-datatypes ((array!63893 0))(
  ( (array!63894 (arr!30752 (Array (_ BitVec 32) ValueCell!11246)) (size!31264 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5086 0))(
  ( (LongMapFixedSize!5087 (defaultEntry!5895 Int) (mask!29538 (_ BitVec 32)) (extraKeys!5627 (_ BitVec 32)) (zeroValue!5731 V!36739) (minValue!5731 V!36739) (_size!2598 (_ BitVec 32)) (_keys!11078 array!63891) (_values!5918 array!63893) (_vacant!2598 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5086)

(declare-fun e!576491 () Bool)

(declare-fun array_inv!23859 (array!63891) Bool)

(declare-fun array_inv!23860 (array!63893) Bool)

(assert (=> b!1023271 (= e!576488 (and tp!71571 tp_is_empty!23899 (array_inv!23859 (_keys!11078 thiss!1427)) (array_inv!23860 (_values!5918 thiss!1427)) e!576491))))

(declare-fun b!1023272 () Bool)

(declare-fun res!685177 () Bool)

(declare-fun e!576489 () Bool)

(assert (=> b!1023272 (=> (not res!685177) (not e!576489))))

(assert (=> b!1023272 (= res!685177 (and (= (size!31264 (_values!5918 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29538 thiss!1427))) (= (size!31263 (_keys!11078 thiss!1427)) (size!31264 (_values!5918 thiss!1427))) (bvsge (mask!29538 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5627 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5627 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!685178 () Bool)

(assert (=> start!89372 (=> (not res!685178) (not e!576489))))

(declare-fun valid!1945 (LongMapFixedSize!5086) Bool)

(assert (=> start!89372 (= res!685178 (valid!1945 thiss!1427))))

(assert (=> start!89372 e!576489))

(assert (=> start!89372 e!576488))

(assert (=> start!89372 true))

(declare-fun b!1023273 () Bool)

(declare-fun e!576490 () Bool)

(assert (=> b!1023273 (= e!576490 tp_is_empty!23899)))

(declare-fun b!1023274 () Bool)

(declare-fun res!685180 () Bool)

(assert (=> b!1023274 (=> (not res!685180) (not e!576489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63891 (_ BitVec 32)) Bool)

(assert (=> b!1023274 (= res!685180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11078 thiss!1427) (mask!29538 thiss!1427)))))

(declare-fun b!1023275 () Bool)

(assert (=> b!1023275 (= e!576489 false)))

(declare-fun lt!450677 () Bool)

(declare-datatypes ((List!21655 0))(
  ( (Nil!21652) (Cons!21651 (h!22858 (_ BitVec 64)) (t!30661 List!21655)) )
))
(declare-fun arrayNoDuplicates!0 (array!63891 (_ BitVec 32) List!21655) Bool)

(assert (=> b!1023275 (= lt!450677 (arrayNoDuplicates!0 (_keys!11078 thiss!1427) #b00000000000000000000000000000000 Nil!21652))))

(declare-fun mapNonEmpty!37266 () Bool)

(declare-fun tp!71572 () Bool)

(assert (=> mapNonEmpty!37266 (= mapRes!37266 (and tp!71572 e!576490))))

(declare-fun mapValue!37266 () ValueCell!11246)

(declare-fun mapRest!37266 () (Array (_ BitVec 32) ValueCell!11246))

(declare-fun mapKey!37266 () (_ BitVec 32))

(assert (=> mapNonEmpty!37266 (= (arr!30752 (_values!5918 thiss!1427)) (store mapRest!37266 mapKey!37266 mapValue!37266))))

(declare-fun b!1023276 () Bool)

(declare-fun res!685181 () Bool)

(assert (=> b!1023276 (=> (not res!685181) (not e!576489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023276 (= res!685181 (validMask!0 (mask!29538 thiss!1427)))))

(declare-fun b!1023277 () Bool)

(declare-fun res!685179 () Bool)

(assert (=> b!1023277 (=> (not res!685179) (not e!576489))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023277 (= res!685179 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023278 () Bool)

(assert (=> b!1023278 (= e!576491 (and e!576487 mapRes!37266))))

(declare-fun condMapEmpty!37266 () Bool)

(declare-fun mapDefault!37266 () ValueCell!11246)

(assert (=> b!1023278 (= condMapEmpty!37266 (= (arr!30752 (_values!5918 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11246)) mapDefault!37266)))))

(assert (= (and start!89372 res!685178) b!1023277))

(assert (= (and b!1023277 res!685179) b!1023276))

(assert (= (and b!1023276 res!685181) b!1023272))

(assert (= (and b!1023272 res!685177) b!1023274))

(assert (= (and b!1023274 res!685180) b!1023275))

(assert (= (and b!1023278 condMapEmpty!37266) mapIsEmpty!37266))

(assert (= (and b!1023278 (not condMapEmpty!37266)) mapNonEmpty!37266))

(get-info :version)

(assert (= (and mapNonEmpty!37266 ((_ is ValueCellFull!11246) mapValue!37266)) b!1023273))

(assert (= (and b!1023278 ((_ is ValueCellFull!11246) mapDefault!37266)) b!1023270))

(assert (= b!1023271 b!1023278))

(assert (= start!89372 b!1023271))

(declare-fun m!942901 () Bool)

(assert (=> mapNonEmpty!37266 m!942901))

(declare-fun m!942903 () Bool)

(assert (=> b!1023274 m!942903))

(declare-fun m!942905 () Bool)

(assert (=> b!1023275 m!942905))

(declare-fun m!942907 () Bool)

(assert (=> b!1023276 m!942907))

(declare-fun m!942909 () Bool)

(assert (=> b!1023271 m!942909))

(declare-fun m!942911 () Bool)

(assert (=> b!1023271 m!942911))

(declare-fun m!942913 () Bool)

(assert (=> start!89372 m!942913))

(check-sat (not b!1023274) b_and!32387 (not b_next!20179) (not b!1023275) (not mapNonEmpty!37266) tp_is_empty!23899 (not start!89372) (not b!1023271) (not b!1023276))
(check-sat b_and!32387 (not b_next!20179))
