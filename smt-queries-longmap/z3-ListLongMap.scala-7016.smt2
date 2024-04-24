; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89342 () Bool)

(assert start!89342)

(declare-fun b!1022873 () Bool)

(declare-fun b_free!20149 () Bool)

(declare-fun b_next!20149 () Bool)

(assert (=> b!1022873 (= b_free!20149 (not b_next!20149))))

(declare-fun tp!71482 () Bool)

(declare-fun b_and!32357 () Bool)

(assert (=> b!1022873 (= tp!71482 b_and!32357)))

(declare-fun b!1022865 () Bool)

(declare-fun res!684956 () Bool)

(declare-fun e!576221 () Bool)

(assert (=> b!1022865 (=> (not res!684956) (not e!576221))))

(declare-datatypes ((V!36699 0))(
  ( (V!36700 (val!11985 Int)) )
))
(declare-datatypes ((ValueCell!11231 0))(
  ( (ValueCellFull!11231 (v!14550 V!36699)) (EmptyCell!11231) )
))
(declare-datatypes ((array!63831 0))(
  ( (array!63832 (arr!30721 (Array (_ BitVec 32) (_ BitVec 64))) (size!31233 (_ BitVec 32))) )
))
(declare-datatypes ((array!63833 0))(
  ( (array!63834 (arr!30722 (Array (_ BitVec 32) ValueCell!11231)) (size!31234 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5056 0))(
  ( (LongMapFixedSize!5057 (defaultEntry!5880 Int) (mask!29513 (_ BitVec 32)) (extraKeys!5612 (_ BitVec 32)) (zeroValue!5716 V!36699) (minValue!5716 V!36699) (_size!2583 (_ BitVec 32)) (_keys!11063 array!63831) (_values!5903 array!63833) (_vacant!2583 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5056)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022865 (= res!684956 (validMask!0 (mask!29513 thiss!1427)))))

(declare-fun res!684953 () Bool)

(assert (=> start!89342 (=> (not res!684953) (not e!576221))))

(declare-fun valid!1933 (LongMapFixedSize!5056) Bool)

(assert (=> start!89342 (= res!684953 (valid!1933 thiss!1427))))

(assert (=> start!89342 e!576221))

(declare-fun e!576220 () Bool)

(assert (=> start!89342 e!576220))

(assert (=> start!89342 true))

(declare-fun b!1022866 () Bool)

(declare-fun e!576217 () Bool)

(declare-fun tp_is_empty!23869 () Bool)

(assert (=> b!1022866 (= e!576217 tp_is_empty!23869)))

(declare-fun b!1022867 () Bool)

(declare-fun e!576218 () Bool)

(declare-fun mapRes!37221 () Bool)

(assert (=> b!1022867 (= e!576218 (and e!576217 mapRes!37221))))

(declare-fun condMapEmpty!37221 () Bool)

(declare-fun mapDefault!37221 () ValueCell!11231)

(assert (=> b!1022867 (= condMapEmpty!37221 (= (arr!30722 (_values!5903 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11231)) mapDefault!37221)))))

(declare-fun b!1022868 () Bool)

(declare-fun res!684954 () Bool)

(assert (=> b!1022868 (=> (not res!684954) (not e!576221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63831 (_ BitVec 32)) Bool)

(assert (=> b!1022868 (= res!684954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11063 thiss!1427) (mask!29513 thiss!1427)))))

(declare-fun b!1022869 () Bool)

(declare-fun res!684952 () Bool)

(assert (=> b!1022869 (=> (not res!684952) (not e!576221))))

(assert (=> b!1022869 (= res!684952 (and (= (size!31234 (_values!5903 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29513 thiss!1427))) (= (size!31233 (_keys!11063 thiss!1427)) (size!31234 (_values!5903 thiss!1427))) (bvsge (mask!29513 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5612 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5612 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5612 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022870 () Bool)

(declare-fun e!576222 () Bool)

(assert (=> b!1022870 (= e!576222 tp_is_empty!23869)))

(declare-fun b!1022871 () Bool)

(declare-fun res!684955 () Bool)

(assert (=> b!1022871 (=> (not res!684955) (not e!576221))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022871 (= res!684955 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37221 () Bool)

(declare-fun tp!71481 () Bool)

(assert (=> mapNonEmpty!37221 (= mapRes!37221 (and tp!71481 e!576222))))

(declare-fun mapRest!37221 () (Array (_ BitVec 32) ValueCell!11231))

(declare-fun mapKey!37221 () (_ BitVec 32))

(declare-fun mapValue!37221 () ValueCell!11231)

(assert (=> mapNonEmpty!37221 (= (arr!30722 (_values!5903 thiss!1427)) (store mapRest!37221 mapKey!37221 mapValue!37221))))

(declare-fun b!1022872 () Bool)

(assert (=> b!1022872 (= e!576221 false)))

(declare-fun lt!450632 () Bool)

(declare-datatypes ((List!21645 0))(
  ( (Nil!21642) (Cons!21641 (h!22848 (_ BitVec 64)) (t!30651 List!21645)) )
))
(declare-fun arrayNoDuplicates!0 (array!63831 (_ BitVec 32) List!21645) Bool)

(assert (=> b!1022872 (= lt!450632 (arrayNoDuplicates!0 (_keys!11063 thiss!1427) #b00000000000000000000000000000000 Nil!21642))))

(declare-fun mapIsEmpty!37221 () Bool)

(assert (=> mapIsEmpty!37221 mapRes!37221))

(declare-fun array_inv!23841 (array!63831) Bool)

(declare-fun array_inv!23842 (array!63833) Bool)

(assert (=> b!1022873 (= e!576220 (and tp!71482 tp_is_empty!23869 (array_inv!23841 (_keys!11063 thiss!1427)) (array_inv!23842 (_values!5903 thiss!1427)) e!576218))))

(assert (= (and start!89342 res!684953) b!1022871))

(assert (= (and b!1022871 res!684955) b!1022865))

(assert (= (and b!1022865 res!684956) b!1022869))

(assert (= (and b!1022869 res!684952) b!1022868))

(assert (= (and b!1022868 res!684954) b!1022872))

(assert (= (and b!1022867 condMapEmpty!37221) mapIsEmpty!37221))

(assert (= (and b!1022867 (not condMapEmpty!37221)) mapNonEmpty!37221))

(get-info :version)

(assert (= (and mapNonEmpty!37221 ((_ is ValueCellFull!11231) mapValue!37221)) b!1022870))

(assert (= (and b!1022867 ((_ is ValueCellFull!11231) mapDefault!37221)) b!1022866))

(assert (= b!1022873 b!1022867))

(assert (= start!89342 b!1022873))

(declare-fun m!942691 () Bool)

(assert (=> start!89342 m!942691))

(declare-fun m!942693 () Bool)

(assert (=> b!1022873 m!942693))

(declare-fun m!942695 () Bool)

(assert (=> b!1022873 m!942695))

(declare-fun m!942697 () Bool)

(assert (=> b!1022872 m!942697))

(declare-fun m!942699 () Bool)

(assert (=> b!1022868 m!942699))

(declare-fun m!942701 () Bool)

(assert (=> mapNonEmpty!37221 m!942701))

(declare-fun m!942703 () Bool)

(assert (=> b!1022865 m!942703))

(check-sat (not start!89342) (not b_next!20149) (not mapNonEmpty!37221) (not b!1022865) (not b!1022873) (not b!1022872) tp_is_empty!23869 b_and!32357 (not b!1022868))
(check-sat b_and!32357 (not b_next!20149))
