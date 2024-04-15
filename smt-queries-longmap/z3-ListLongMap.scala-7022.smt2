; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89142 () Bool)

(assert start!89142)

(declare-fun b!1021888 () Bool)

(declare-fun b_free!20185 () Bool)

(declare-fun b_next!20185 () Bool)

(assert (=> b!1021888 (= b_free!20185 (not b_next!20185))))

(declare-fun tp!71589 () Bool)

(declare-fun b_and!32357 () Bool)

(assert (=> b!1021888 (= tp!71589 b_and!32357)))

(declare-fun b!1021885 () Bool)

(declare-fun res!684645 () Bool)

(declare-fun e!575607 () Bool)

(assert (=> b!1021885 (=> (not res!684645) (not e!575607))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021885 (= res!684645 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021886 () Bool)

(declare-fun e!575610 () Bool)

(declare-fun e!575612 () Bool)

(declare-fun mapRes!37275 () Bool)

(assert (=> b!1021886 (= e!575610 (and e!575612 mapRes!37275))))

(declare-fun condMapEmpty!37275 () Bool)

(declare-datatypes ((V!36747 0))(
  ( (V!36748 (val!12003 Int)) )
))
(declare-datatypes ((ValueCell!11249 0))(
  ( (ValueCellFull!11249 (v!14571 V!36747)) (EmptyCell!11249) )
))
(declare-datatypes ((array!63793 0))(
  ( (array!63794 (arr!30708 (Array (_ BitVec 32) (_ BitVec 64))) (size!31221 (_ BitVec 32))) )
))
(declare-datatypes ((array!63795 0))(
  ( (array!63796 (arr!30709 (Array (_ BitVec 32) ValueCell!11249)) (size!31222 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5092 0))(
  ( (LongMapFixedSize!5093 (defaultEntry!5898 Int) (mask!29478 (_ BitVec 32)) (extraKeys!5630 (_ BitVec 32)) (zeroValue!5734 V!36747) (minValue!5734 V!36747) (_size!2601 (_ BitVec 32)) (_keys!11039 array!63793) (_values!5921 array!63795) (_vacant!2601 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5092)

(declare-fun mapDefault!37275 () ValueCell!11249)

(assert (=> b!1021886 (= condMapEmpty!37275 (= (arr!30709 (_values!5921 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11249)) mapDefault!37275)))))

(declare-fun b!1021887 () Bool)

(declare-fun e!575611 () Bool)

(declare-fun tp_is_empty!23905 () Bool)

(assert (=> b!1021887 (= e!575611 tp_is_empty!23905)))

(declare-fun e!575608 () Bool)

(declare-fun array_inv!23823 (array!63793) Bool)

(declare-fun array_inv!23824 (array!63795) Bool)

(assert (=> b!1021888 (= e!575608 (and tp!71589 tp_is_empty!23905 (array_inv!23823 (_keys!11039 thiss!1427)) (array_inv!23824 (_values!5921 thiss!1427)) e!575610))))

(declare-fun mapNonEmpty!37275 () Bool)

(declare-fun tp!71590 () Bool)

(assert (=> mapNonEmpty!37275 (= mapRes!37275 (and tp!71590 e!575611))))

(declare-fun mapValue!37275 () ValueCell!11249)

(declare-fun mapKey!37275 () (_ BitVec 32))

(declare-fun mapRest!37275 () (Array (_ BitVec 32) ValueCell!11249))

(assert (=> mapNonEmpty!37275 (= (arr!30709 (_values!5921 thiss!1427)) (store mapRest!37275 mapKey!37275 mapValue!37275))))

(declare-fun b!1021889 () Bool)

(declare-fun res!684649 () Bool)

(assert (=> b!1021889 (=> (not res!684649) (not e!575607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021889 (= res!684649 (validMask!0 (mask!29478 thiss!1427)))))

(declare-fun b!1021890 () Bool)

(declare-fun res!684648 () Bool)

(assert (=> b!1021890 (=> (not res!684648) (not e!575607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63793 (_ BitVec 32)) Bool)

(assert (=> b!1021890 (= res!684648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11039 thiss!1427) (mask!29478 thiss!1427)))))

(declare-fun res!684647 () Bool)

(assert (=> start!89142 (=> (not res!684647) (not e!575607))))

(declare-fun valid!1941 (LongMapFixedSize!5092) Bool)

(assert (=> start!89142 (= res!684647 (valid!1941 thiss!1427))))

(assert (=> start!89142 e!575607))

(assert (=> start!89142 e!575608))

(assert (=> start!89142 true))

(declare-fun b!1021891 () Bool)

(declare-fun res!684646 () Bool)

(assert (=> b!1021891 (=> (not res!684646) (not e!575607))))

(assert (=> b!1021891 (= res!684646 (and (= (size!31222 (_values!5921 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29478 thiss!1427))) (= (size!31221 (_keys!11039 thiss!1427)) (size!31222 (_values!5921 thiss!1427))) (bvsge (mask!29478 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5630 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5630 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37275 () Bool)

(assert (=> mapIsEmpty!37275 mapRes!37275))

(declare-fun b!1021892 () Bool)

(assert (=> b!1021892 (= e!575607 false)))

(declare-fun lt!449971 () Bool)

(declare-datatypes ((List!21702 0))(
  ( (Nil!21699) (Cons!21698 (h!22896 (_ BitVec 64)) (t!30707 List!21702)) )
))
(declare-fun arrayNoDuplicates!0 (array!63793 (_ BitVec 32) List!21702) Bool)

(assert (=> b!1021892 (= lt!449971 (arrayNoDuplicates!0 (_keys!11039 thiss!1427) #b00000000000000000000000000000000 Nil!21699))))

(declare-fun b!1021893 () Bool)

(assert (=> b!1021893 (= e!575612 tp_is_empty!23905)))

(assert (= (and start!89142 res!684647) b!1021885))

(assert (= (and b!1021885 res!684645) b!1021889))

(assert (= (and b!1021889 res!684649) b!1021891))

(assert (= (and b!1021891 res!684646) b!1021890))

(assert (= (and b!1021890 res!684648) b!1021892))

(assert (= (and b!1021886 condMapEmpty!37275) mapIsEmpty!37275))

(assert (= (and b!1021886 (not condMapEmpty!37275)) mapNonEmpty!37275))

(get-info :version)

(assert (= (and mapNonEmpty!37275 ((_ is ValueCellFull!11249) mapValue!37275)) b!1021887))

(assert (= (and b!1021886 ((_ is ValueCellFull!11249) mapDefault!37275)) b!1021893))

(assert (= b!1021888 b!1021886))

(assert (= start!89142 b!1021888))

(declare-fun m!940659 () Bool)

(assert (=> b!1021890 m!940659))

(declare-fun m!940661 () Bool)

(assert (=> b!1021888 m!940661))

(declare-fun m!940663 () Bool)

(assert (=> b!1021888 m!940663))

(declare-fun m!940665 () Bool)

(assert (=> mapNonEmpty!37275 m!940665))

(declare-fun m!940667 () Bool)

(assert (=> b!1021889 m!940667))

(declare-fun m!940669 () Bool)

(assert (=> start!89142 m!940669))

(declare-fun m!940671 () Bool)

(assert (=> b!1021892 m!940671))

(check-sat (not start!89142) (not mapNonEmpty!37275) (not b_next!20185) (not b!1021890) (not b!1021888) (not b!1021889) b_and!32357 tp_is_empty!23905 (not b!1021892))
(check-sat b_and!32357 (not b_next!20185))
