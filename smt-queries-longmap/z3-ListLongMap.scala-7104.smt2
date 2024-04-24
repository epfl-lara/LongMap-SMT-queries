; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90304 () Bool)

(assert start!90304)

(declare-fun b!1033018 () Bool)

(declare-fun b_free!20677 () Bool)

(declare-fun b_next!20677 () Bool)

(assert (=> b!1033018 (= b_free!20677 (not b_next!20677))))

(declare-fun tp!73102 () Bool)

(declare-fun b_and!33131 () Bool)

(assert (=> b!1033018 (= tp!73102 b_and!33131)))

(declare-fun b!1033010 () Bool)

(declare-fun e!583590 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37403 0))(
  ( (V!37404 (val!12249 Int)) )
))
(declare-datatypes ((ValueCell!11495 0))(
  ( (ValueCellFull!11495 (v!14822 V!37403)) (EmptyCell!11495) )
))
(declare-datatypes ((Unit!33762 0))(
  ( (Unit!33763) )
))
(declare-datatypes ((array!64907 0))(
  ( (array!64908 (arr!31249 (Array (_ BitVec 32) (_ BitVec 64))) (size!31767 (_ BitVec 32))) )
))
(declare-datatypes ((array!64909 0))(
  ( (array!64910 (arr!31250 (Array (_ BitVec 32) ValueCell!11495)) (size!31768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5584 0))(
  ( (LongMapFixedSize!5585 (defaultEntry!6166 Int) (mask!30028 (_ BitVec 32)) (extraKeys!5898 (_ BitVec 32)) (zeroValue!6002 V!37403) (minValue!6002 V!37403) (_size!2847 (_ BitVec 32)) (_keys!11377 array!64907) (_values!6189 array!64909) (_vacant!2847 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15686 0))(
  ( (tuple2!15687 (_1!7854 Unit!33762) (_2!7854 LongMapFixedSize!5584)) )
))
(declare-fun lt!456101 () tuple2!15686)

(assert (=> b!1033010 (= e!583590 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5898 (_2!7854 lt!456101)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5898 (_2!7854 lt!456101)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1033011 () Bool)

(declare-fun e!583589 () Bool)

(assert (=> b!1033011 (= e!583589 false)))

(declare-fun b!1033012 () Bool)

(declare-fun e!583582 () Unit!33762)

(declare-fun Unit!33764 () Unit!33762)

(assert (=> b!1033012 (= e!583582 Unit!33764)))

(declare-fun b!1033013 () Bool)

(declare-fun arrayContainsKey!0 (array!64907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033013 (= e!583590 (arrayContainsKey!0 (_keys!11377 (_2!7854 lt!456101)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1033014 () Bool)

(declare-fun e!583585 () Bool)

(declare-fun e!583588 () Bool)

(declare-fun mapRes!38049 () Bool)

(assert (=> b!1033014 (= e!583585 (and e!583588 mapRes!38049))))

(declare-fun condMapEmpty!38049 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5584)

(declare-fun mapDefault!38049 () ValueCell!11495)

(assert (=> b!1033014 (= condMapEmpty!38049 (= (arr!31250 (_values!6189 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11495)) mapDefault!38049)))))

(declare-fun b!1033015 () Bool)

(declare-fun e!583587 () Bool)

(declare-fun tp_is_empty!24397 () Bool)

(assert (=> b!1033015 (= e!583587 tp_is_empty!24397)))

(declare-fun b!1033016 () Bool)

(assert (=> b!1033016 (= e!583588 tp_is_empty!24397)))

(declare-fun res!690303 () Bool)

(declare-fun e!583584 () Bool)

(assert (=> start!90304 (=> (not res!690303) (not e!583584))))

(declare-fun valid!2117 (LongMapFixedSize!5584) Bool)

(assert (=> start!90304 (= res!690303 (valid!2117 thiss!1427))))

(assert (=> start!90304 e!583584))

(declare-fun e!583586 () Bool)

(assert (=> start!90304 e!583586))

(assert (=> start!90304 true))

(declare-fun b!1033009 () Bool)

(declare-fun Unit!33765 () Unit!33762)

(assert (=> b!1033009 (= e!583582 Unit!33765)))

(declare-fun lt!456105 () Unit!33762)

(declare-fun lemmaKeyInListMapIsInArray!341 (array!64907 array!64909 (_ BitVec 32) (_ BitVec 32) V!37403 V!37403 (_ BitVec 64) Int) Unit!33762)

(assert (=> b!1033009 (= lt!456105 (lemmaKeyInListMapIsInArray!341 (_keys!11377 (_2!7854 lt!456101)) (_values!6189 (_2!7854 lt!456101)) (mask!30028 (_2!7854 lt!456101)) (extraKeys!5898 (_2!7854 lt!456101)) (zeroValue!6002 (_2!7854 lt!456101)) (minValue!6002 (_2!7854 lt!456101)) key!909 (defaultEntry!6166 (_2!7854 lt!456101))))))

(declare-fun c!104644 () Bool)

(assert (=> b!1033009 (= c!104644 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!690302 () Bool)

(assert (=> b!1033009 (= res!690302 e!583590)))

(assert (=> b!1033009 (=> (not res!690302) (not e!583589))))

(assert (=> b!1033009 e!583589))

(declare-fun mapIsEmpty!38049 () Bool)

(assert (=> mapIsEmpty!38049 mapRes!38049))

(declare-fun b!1033017 () Bool)

(declare-fun e!583583 () Bool)

(assert (=> b!1033017 (= e!583584 e!583583)))

(declare-fun res!690305 () Bool)

(assert (=> b!1033017 (=> (not res!690305) (not e!583583))))

(declare-datatypes ((SeekEntryResult!9667 0))(
  ( (MissingZero!9667 (index!41039 (_ BitVec 32))) (Found!9667 (index!41040 (_ BitVec 32))) (Intermediate!9667 (undefined!10479 Bool) (index!41041 (_ BitVec 32)) (x!91867 (_ BitVec 32))) (Undefined!9667) (MissingVacant!9667 (index!41042 (_ BitVec 32))) )
))
(declare-fun lt!456111 () SeekEntryResult!9667)

(get-info :version)

(assert (=> b!1033017 (= res!690305 ((_ is Found!9667) lt!456111))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64907 (_ BitVec 32)) SeekEntryResult!9667)

(assert (=> b!1033017 (= lt!456111 (seekEntry!0 key!909 (_keys!11377 thiss!1427) (mask!30028 thiss!1427)))))

(declare-fun array_inv!24195 (array!64907) Bool)

(declare-fun array_inv!24196 (array!64909) Bool)

(assert (=> b!1033018 (= e!583586 (and tp!73102 tp_is_empty!24397 (array_inv!24195 (_keys!11377 thiss!1427)) (array_inv!24196 (_values!6189 thiss!1427)) e!583585))))

(declare-fun mapNonEmpty!38049 () Bool)

(declare-fun tp!73101 () Bool)

(assert (=> mapNonEmpty!38049 (= mapRes!38049 (and tp!73101 e!583587))))

(declare-fun mapValue!38049 () ValueCell!11495)

(declare-fun mapRest!38049 () (Array (_ BitVec 32) ValueCell!11495))

(declare-fun mapKey!38049 () (_ BitVec 32))

(assert (=> mapNonEmpty!38049 (= (arr!31250 (_values!6189 thiss!1427)) (store mapRest!38049 mapKey!38049 mapValue!38049))))

(declare-fun b!1033019 () Bool)

(declare-fun res!690304 () Bool)

(assert (=> b!1033019 (=> (not res!690304) (not e!583584))))

(assert (=> b!1033019 (= res!690304 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1033020 () Bool)

(assert (=> b!1033020 (= e!583583 (not true))))

(declare-fun lt!456107 () Bool)

(assert (=> b!1033020 (= lt!456107 (valid!2117 (_2!7854 lt!456101)))))

(declare-fun lt!456112 () Unit!33762)

(assert (=> b!1033020 (= lt!456112 e!583582)))

(declare-fun c!104645 () Bool)

(declare-datatypes ((tuple2!15688 0))(
  ( (tuple2!15689 (_1!7855 (_ BitVec 64)) (_2!7855 V!37403)) )
))
(declare-datatypes ((List!21866 0))(
  ( (Nil!21863) (Cons!21862 (h!23073 tuple2!15688) (t!31030 List!21866)) )
))
(declare-datatypes ((ListLongMap!13745 0))(
  ( (ListLongMap!13746 (toList!6888 List!21866)) )
))
(declare-fun contains!6023 (ListLongMap!13745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3934 (array!64907 array!64909 (_ BitVec 32) (_ BitVec 32) V!37403 V!37403 (_ BitVec 32) Int) ListLongMap!13745)

(assert (=> b!1033020 (= c!104645 (contains!6023 (getCurrentListMap!3934 (_keys!11377 (_2!7854 lt!456101)) (_values!6189 (_2!7854 lt!456101)) (mask!30028 (_2!7854 lt!456101)) (extraKeys!5898 (_2!7854 lt!456101)) (zeroValue!6002 (_2!7854 lt!456101)) (minValue!6002 (_2!7854 lt!456101)) #b00000000000000000000000000000000 (defaultEntry!6166 (_2!7854 lt!456101))) key!909))))

(declare-fun lt!456104 () array!64907)

(declare-fun lt!456106 () array!64909)

(declare-fun Unit!33766 () Unit!33762)

(declare-fun Unit!33767 () Unit!33762)

(assert (=> b!1033020 (= lt!456101 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2847 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15687 Unit!33766 (LongMapFixedSize!5585 (defaultEntry!6166 thiss!1427) (mask!30028 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) (bvsub (_size!2847 thiss!1427) #b00000000000000000000000000000001) lt!456104 lt!456106 (bvadd #b00000000000000000000000000000001 (_vacant!2847 thiss!1427)))) (tuple2!15687 Unit!33767 (LongMapFixedSize!5585 (defaultEntry!6166 thiss!1427) (mask!30028 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) (bvsub (_size!2847 thiss!1427) #b00000000000000000000000000000001) lt!456104 lt!456106 (_vacant!2847 thiss!1427)))))))

(declare-fun -!511 (ListLongMap!13745 (_ BitVec 64)) ListLongMap!13745)

(assert (=> b!1033020 (= (-!511 (getCurrentListMap!3934 (_keys!11377 thiss!1427) (_values!6189 thiss!1427) (mask!30028 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6166 thiss!1427)) key!909) (getCurrentListMap!3934 lt!456104 lt!456106 (mask!30028 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6166 thiss!1427)))))

(declare-fun dynLambda!2005 (Int (_ BitVec 64)) V!37403)

(assert (=> b!1033020 (= lt!456106 (array!64910 (store (arr!31250 (_values!6189 thiss!1427)) (index!41040 lt!456111) (ValueCellFull!11495 (dynLambda!2005 (defaultEntry!6166 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31768 (_values!6189 thiss!1427))))))

(declare-fun lt!456103 () Unit!33762)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!37 (array!64907 array!64909 (_ BitVec 32) (_ BitVec 32) V!37403 V!37403 (_ BitVec 32) (_ BitVec 64) Int) Unit!33762)

(assert (=> b!1033020 (= lt!456103 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!37 (_keys!11377 thiss!1427) (_values!6189 thiss!1427) (mask!30028 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) (index!41040 lt!456111) key!909 (defaultEntry!6166 thiss!1427)))))

(assert (=> b!1033020 (not (arrayContainsKey!0 lt!456104 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!456108 () Unit!33762)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64907 (_ BitVec 32) (_ BitVec 64)) Unit!33762)

(assert (=> b!1033020 (= lt!456108 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11377 thiss!1427) (index!41040 lt!456111) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64907 (_ BitVec 32)) Bool)

(assert (=> b!1033020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!456104 (mask!30028 thiss!1427))))

(declare-fun lt!456102 () Unit!33762)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64907 (_ BitVec 32) (_ BitVec 32)) Unit!33762)

(assert (=> b!1033020 (= lt!456102 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11377 thiss!1427) (index!41040 lt!456111) (mask!30028 thiss!1427)))))

(declare-datatypes ((List!21867 0))(
  ( (Nil!21864) (Cons!21863 (h!23074 (_ BitVec 64)) (t!31031 List!21867)) )
))
(declare-fun arrayNoDuplicates!0 (array!64907 (_ BitVec 32) List!21867) Bool)

(assert (=> b!1033020 (arrayNoDuplicates!0 lt!456104 #b00000000000000000000000000000000 Nil!21864)))

(declare-fun lt!456110 () Unit!33762)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64907 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21867) Unit!33762)

(assert (=> b!1033020 (= lt!456110 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11377 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41040 lt!456111) #b00000000000000000000000000000000 Nil!21864))))

(declare-fun arrayCountValidKeys!0 (array!64907 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033020 (= (arrayCountValidKeys!0 lt!456104 #b00000000000000000000000000000000 (size!31767 (_keys!11377 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11377 thiss!1427) #b00000000000000000000000000000000 (size!31767 (_keys!11377 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1033020 (= lt!456104 (array!64908 (store (arr!31249 (_keys!11377 thiss!1427)) (index!41040 lt!456111) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31767 (_keys!11377 thiss!1427))))))

(declare-fun lt!456109 () Unit!33762)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64907 (_ BitVec 32) (_ BitVec 64)) Unit!33762)

(assert (=> b!1033020 (= lt!456109 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11377 thiss!1427) (index!41040 lt!456111) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90304 res!690303) b!1033019))

(assert (= (and b!1033019 res!690304) b!1033017))

(assert (= (and b!1033017 res!690305) b!1033020))

(assert (= (and b!1033020 c!104645) b!1033009))

(assert (= (and b!1033020 (not c!104645)) b!1033012))

(assert (= (and b!1033009 c!104644) b!1033013))

(assert (= (and b!1033009 (not c!104644)) b!1033010))

(assert (= (and b!1033009 res!690302) b!1033011))

(assert (= (and b!1033014 condMapEmpty!38049) mapIsEmpty!38049))

(assert (= (and b!1033014 (not condMapEmpty!38049)) mapNonEmpty!38049))

(assert (= (and mapNonEmpty!38049 ((_ is ValueCellFull!11495) mapValue!38049)) b!1033015))

(assert (= (and b!1033014 ((_ is ValueCellFull!11495) mapDefault!38049)) b!1033016))

(assert (= b!1033018 b!1033014))

(assert (= start!90304 b!1033018))

(declare-fun b_lambda!16031 () Bool)

(assert (=> (not b_lambda!16031) (not b!1033020)))

(declare-fun t!31029 () Bool)

(declare-fun tb!6987 () Bool)

(assert (=> (and b!1033018 (= (defaultEntry!6166 thiss!1427) (defaultEntry!6166 thiss!1427)) t!31029) tb!6987))

(declare-fun result!14311 () Bool)

(assert (=> tb!6987 (= result!14311 tp_is_empty!24397)))

(assert (=> b!1033020 t!31029))

(declare-fun b_and!33133 () Bool)

(assert (= b_and!33131 (and (=> t!31029 result!14311) b_and!33133)))

(declare-fun m!953597 () Bool)

(assert (=> b!1033020 m!953597))

(declare-fun m!953599 () Bool)

(assert (=> b!1033020 m!953599))

(assert (=> b!1033020 m!953597))

(declare-fun m!953601 () Bool)

(assert (=> b!1033020 m!953601))

(declare-fun m!953603 () Bool)

(assert (=> b!1033020 m!953603))

(declare-fun m!953605 () Bool)

(assert (=> b!1033020 m!953605))

(declare-fun m!953607 () Bool)

(assert (=> b!1033020 m!953607))

(declare-fun m!953609 () Bool)

(assert (=> b!1033020 m!953609))

(declare-fun m!953611 () Bool)

(assert (=> b!1033020 m!953611))

(declare-fun m!953613 () Bool)

(assert (=> b!1033020 m!953613))

(declare-fun m!953615 () Bool)

(assert (=> b!1033020 m!953615))

(declare-fun m!953617 () Bool)

(assert (=> b!1033020 m!953617))

(declare-fun m!953619 () Bool)

(assert (=> b!1033020 m!953619))

(declare-fun m!953621 () Bool)

(assert (=> b!1033020 m!953621))

(declare-fun m!953623 () Bool)

(assert (=> b!1033020 m!953623))

(declare-fun m!953625 () Bool)

(assert (=> b!1033020 m!953625))

(declare-fun m!953627 () Bool)

(assert (=> b!1033020 m!953627))

(declare-fun m!953629 () Bool)

(assert (=> b!1033020 m!953629))

(declare-fun m!953631 () Bool)

(assert (=> b!1033020 m!953631))

(declare-fun m!953633 () Bool)

(assert (=> b!1033020 m!953633))

(assert (=> b!1033020 m!953629))

(declare-fun m!953635 () Bool)

(assert (=> b!1033018 m!953635))

(declare-fun m!953637 () Bool)

(assert (=> b!1033018 m!953637))

(declare-fun m!953639 () Bool)

(assert (=> start!90304 m!953639))

(declare-fun m!953641 () Bool)

(assert (=> b!1033013 m!953641))

(declare-fun m!953643 () Bool)

(assert (=> mapNonEmpty!38049 m!953643))

(declare-fun m!953645 () Bool)

(assert (=> b!1033009 m!953645))

(declare-fun m!953647 () Bool)

(assert (=> b!1033017 m!953647))

(check-sat (not b!1033009) tp_is_empty!24397 (not b!1033020) (not start!90304) (not b_next!20677) (not b!1033013) (not b_lambda!16031) (not mapNonEmpty!38049) b_and!33133 (not b!1033017) (not b!1033018))
(check-sat b_and!33133 (not b_next!20677))
