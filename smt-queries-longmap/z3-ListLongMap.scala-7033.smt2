; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89444 () Bool)

(assert start!89444)

(declare-fun b!1024165 () Bool)

(declare-fun b_free!20251 () Bool)

(declare-fun b_next!20251 () Bool)

(assert (=> b!1024165 (= b_free!20251 (not b_next!20251))))

(declare-fun tp!71787 () Bool)

(declare-fun b_and!32483 () Bool)

(assert (=> b!1024165 (= tp!71787 b_and!32483)))

(declare-fun b!1024158 () Bool)

(declare-fun e!577138 () Bool)

(declare-fun e!577137 () Bool)

(declare-fun mapRes!37374 () Bool)

(assert (=> b!1024158 (= e!577138 (and e!577137 mapRes!37374))))

(declare-fun condMapEmpty!37374 () Bool)

(declare-datatypes ((V!36835 0))(
  ( (V!36836 (val!12036 Int)) )
))
(declare-datatypes ((ValueCell!11282 0))(
  ( (ValueCellFull!11282 (v!14601 V!36835)) (EmptyCell!11282) )
))
(declare-datatypes ((array!64035 0))(
  ( (array!64036 (arr!30823 (Array (_ BitVec 32) (_ BitVec 64))) (size!31335 (_ BitVec 32))) )
))
(declare-datatypes ((array!64037 0))(
  ( (array!64038 (arr!30824 (Array (_ BitVec 32) ValueCell!11282)) (size!31336 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5158 0))(
  ( (LongMapFixedSize!5159 (defaultEntry!5931 Int) (mask!29598 (_ BitVec 32)) (extraKeys!5663 (_ BitVec 32)) (zeroValue!5767 V!36835) (minValue!5767 V!36835) (_size!2634 (_ BitVec 32)) (_keys!11114 array!64035) (_values!5954 array!64037) (_vacant!2634 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5158)

(declare-fun mapDefault!37374 () ValueCell!11282)

(assert (=> b!1024158 (= condMapEmpty!37374 (= (arr!30824 (_values!5954 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11282)) mapDefault!37374)))))

(declare-fun b!1024159 () Bool)

(declare-fun res!685609 () Bool)

(declare-fun e!577135 () Bool)

(assert (=> b!1024159 (=> (not res!685609) (not e!577135))))

(assert (=> b!1024159 (= res!685609 (and (= (size!31336 (_values!5954 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29598 thiss!1427))) (= (size!31335 (_keys!11114 thiss!1427)) (size!31336 (_values!5954 thiss!1427))) (bvsge (mask!29598 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5663 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5663 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1024160 () Bool)

(assert (=> b!1024160 (= e!577135 false)))

(declare-fun lt!450857 () Bool)

(declare-datatypes ((List!21682 0))(
  ( (Nil!21679) (Cons!21678 (h!22885 (_ BitVec 64)) (t!30712 List!21682)) )
))
(declare-fun arrayNoDuplicates!0 (array!64035 (_ BitVec 32) List!21682) Bool)

(assert (=> b!1024160 (= lt!450857 (arrayNoDuplicates!0 (_keys!11114 thiss!1427) #b00000000000000000000000000000000 Nil!21679))))

(declare-fun mapNonEmpty!37374 () Bool)

(declare-fun tp!71788 () Bool)

(declare-fun e!577139 () Bool)

(assert (=> mapNonEmpty!37374 (= mapRes!37374 (and tp!71788 e!577139))))

(declare-fun mapValue!37374 () ValueCell!11282)

(declare-fun mapRest!37374 () (Array (_ BitVec 32) ValueCell!11282))

(declare-fun mapKey!37374 () (_ BitVec 32))

(assert (=> mapNonEmpty!37374 (= (arr!30824 (_values!5954 thiss!1427)) (store mapRest!37374 mapKey!37374 mapValue!37374))))

(declare-fun res!685610 () Bool)

(assert (=> start!89444 (=> (not res!685610) (not e!577135))))

(declare-fun valid!1972 (LongMapFixedSize!5158) Bool)

(assert (=> start!89444 (= res!685610 (valid!1972 thiss!1427))))

(assert (=> start!89444 e!577135))

(declare-fun e!577140 () Bool)

(assert (=> start!89444 e!577140))

(assert (=> start!89444 true))

(declare-fun b!1024161 () Bool)

(declare-fun res!685612 () Bool)

(assert (=> b!1024161 (=> (not res!685612) (not e!577135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024161 (= res!685612 (validMask!0 (mask!29598 thiss!1427)))))

(declare-fun mapIsEmpty!37374 () Bool)

(assert (=> mapIsEmpty!37374 mapRes!37374))

(declare-fun b!1024162 () Bool)

(declare-fun tp_is_empty!23971 () Bool)

(assert (=> b!1024162 (= e!577137 tp_is_empty!23971)))

(declare-fun b!1024163 () Bool)

(declare-fun res!685613 () Bool)

(assert (=> b!1024163 (=> (not res!685613) (not e!577135))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024163 (= res!685613 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024164 () Bool)

(assert (=> b!1024164 (= e!577139 tp_is_empty!23971)))

(declare-fun array_inv!23905 (array!64035) Bool)

(declare-fun array_inv!23906 (array!64037) Bool)

(assert (=> b!1024165 (= e!577140 (and tp!71787 tp_is_empty!23971 (array_inv!23905 (_keys!11114 thiss!1427)) (array_inv!23906 (_values!5954 thiss!1427)) e!577138))))

(declare-fun b!1024166 () Bool)

(declare-fun res!685611 () Bool)

(assert (=> b!1024166 (=> (not res!685611) (not e!577135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64035 (_ BitVec 32)) Bool)

(assert (=> b!1024166 (= res!685611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11114 thiss!1427) (mask!29598 thiss!1427)))))

(assert (= (and start!89444 res!685610) b!1024163))

(assert (= (and b!1024163 res!685613) b!1024161))

(assert (= (and b!1024161 res!685612) b!1024159))

(assert (= (and b!1024159 res!685609) b!1024166))

(assert (= (and b!1024166 res!685611) b!1024160))

(assert (= (and b!1024158 condMapEmpty!37374) mapIsEmpty!37374))

(assert (= (and b!1024158 (not condMapEmpty!37374)) mapNonEmpty!37374))

(get-info :version)

(assert (= (and mapNonEmpty!37374 ((_ is ValueCellFull!11282) mapValue!37374)) b!1024164))

(assert (= (and b!1024158 ((_ is ValueCellFull!11282) mapDefault!37374)) b!1024162))

(assert (= b!1024165 b!1024158))

(assert (= start!89444 b!1024165))

(declare-fun m!943477 () Bool)

(assert (=> b!1024165 m!943477))

(declare-fun m!943479 () Bool)

(assert (=> b!1024165 m!943479))

(declare-fun m!943481 () Bool)

(assert (=> start!89444 m!943481))

(declare-fun m!943483 () Bool)

(assert (=> b!1024161 m!943483))

(declare-fun m!943485 () Bool)

(assert (=> mapNonEmpty!37374 m!943485))

(declare-fun m!943487 () Bool)

(assert (=> b!1024160 m!943487))

(declare-fun m!943489 () Bool)

(assert (=> b!1024166 m!943489))

(check-sat (not b!1024165) (not b!1024166) (not mapNonEmpty!37374) (not b!1024161) b_and!32483 (not b!1024160) tp_is_empty!23971 (not b_next!20251) (not start!89444))
(check-sat b_and!32483 (not b_next!20251))
