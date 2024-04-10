; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90576 () Bool)

(assert start!90576)

(declare-fun b!1035903 () Bool)

(declare-fun b_free!20877 () Bool)

(declare-fun b_next!20877 () Bool)

(assert (=> b!1035903 (= b_free!20877 (not b_next!20877))))

(declare-fun tp!73764 () Bool)

(declare-fun b_and!33379 () Bool)

(assert (=> b!1035903 (= tp!73764 b_and!33379)))

(declare-fun res!691580 () Bool)

(declare-fun e!585835 () Bool)

(assert (=> start!90576 (=> (not res!691580) (not e!585835))))

(declare-datatypes ((V!37669 0))(
  ( (V!37670 (val!12349 Int)) )
))
(declare-datatypes ((ValueCell!11595 0))(
  ( (ValueCellFull!11595 (v!14929 V!37669)) (EmptyCell!11595) )
))
(declare-datatypes ((array!65292 0))(
  ( (array!65293 (arr!31431 (Array (_ BitVec 32) (_ BitVec 64))) (size!31959 (_ BitVec 32))) )
))
(declare-datatypes ((array!65294 0))(
  ( (array!65295 (arr!31432 (Array (_ BitVec 32) ValueCell!11595)) (size!31960 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5784 0))(
  ( (LongMapFixedSize!5785 (defaultEntry!6270 Int) (mask!30171 (_ BitVec 32)) (extraKeys!6000 (_ BitVec 32)) (zeroValue!6104 V!37669) (minValue!6106 V!37669) (_size!2947 (_ BitVec 32)) (_keys!11459 array!65292) (_values!6293 array!65294) (_vacant!2947 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5784)

(declare-fun valid!2181 (LongMapFixedSize!5784) Bool)

(assert (=> start!90576 (= res!691580 (valid!2181 thiss!1427))))

(assert (=> start!90576 e!585835))

(declare-fun e!585837 () Bool)

(assert (=> start!90576 e!585837))

(assert (=> start!90576 true))

(declare-fun b!1035901 () Bool)

(declare-fun res!691578 () Bool)

(assert (=> b!1035901 (=> (not res!691578) (not e!585835))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035901 (= res!691578 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!38412 () Bool)

(declare-fun mapRes!38412 () Bool)

(assert (=> mapIsEmpty!38412 mapRes!38412))

(declare-fun mapNonEmpty!38412 () Bool)

(declare-fun tp!73765 () Bool)

(declare-fun e!585836 () Bool)

(assert (=> mapNonEmpty!38412 (= mapRes!38412 (and tp!73765 e!585836))))

(declare-fun mapKey!38412 () (_ BitVec 32))

(declare-fun mapValue!38412 () ValueCell!11595)

(declare-fun mapRest!38412 () (Array (_ BitVec 32) ValueCell!11595))

(assert (=> mapNonEmpty!38412 (= (arr!31432 (_values!6293 thiss!1427)) (store mapRest!38412 mapKey!38412 mapValue!38412))))

(declare-fun b!1035902 () Bool)

(declare-fun e!585841 () Bool)

(declare-fun lt!456791 () LongMapFixedSize!5784)

(declare-datatypes ((tuple2!15730 0))(
  ( (tuple2!15731 (_1!7876 (_ BitVec 64)) (_2!7876 V!37669)) )
))
(declare-datatypes ((List!21918 0))(
  ( (Nil!21915) (Cons!21914 (h!23116 tuple2!15730) (t!31125 List!21918)) )
))
(declare-datatypes ((ListLongMap!13759 0))(
  ( (ListLongMap!13760 (toList!6895 List!21918)) )
))
(declare-fun map!14729 (LongMapFixedSize!5784) ListLongMap!13759)

(declare-fun -!522 (ListLongMap!13759 (_ BitVec 64)) ListLongMap!13759)

(assert (=> b!1035902 (= e!585841 (= (map!14729 lt!456791) (-!522 (map!14729 thiss!1427) key!909)))))

(declare-fun e!585838 () Bool)

(declare-fun tp_is_empty!24597 () Bool)

(declare-fun array_inv!24315 (array!65292) Bool)

(declare-fun array_inv!24316 (array!65294) Bool)

(assert (=> b!1035903 (= e!585837 (and tp!73764 tp_is_empty!24597 (array_inv!24315 (_keys!11459 thiss!1427)) (array_inv!24316 (_values!6293 thiss!1427)) e!585838))))

(declare-fun b!1035904 () Bool)

(declare-fun e!585840 () Bool)

(assert (=> b!1035904 (= e!585840 tp_is_empty!24597)))

(declare-fun b!1035905 () Bool)

(assert (=> b!1035905 (= e!585836 tp_is_empty!24597)))

(declare-fun b!1035906 () Bool)

(assert (=> b!1035906 (= e!585835 (not e!585841))))

(declare-fun res!691579 () Bool)

(assert (=> b!1035906 (=> (not res!691579) (not e!585841))))

(assert (=> b!1035906 (= res!691579 (valid!2181 lt!456791))))

(declare-fun lt!456792 () V!37669)

(assert (=> b!1035906 (= lt!456791 (LongMapFixedSize!5785 (defaultEntry!6270 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 (_size!2947 thiss!1427) (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (_vacant!2947 thiss!1427)))))

(declare-fun getCurrentListMap!3943 (array!65292 array!65294 (_ BitVec 32) (_ BitVec 32) V!37669 V!37669 (_ BitVec 32) Int) ListLongMap!13759)

(assert (=> b!1035906 (= (-!522 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-datatypes ((Unit!33894 0))(
  ( (Unit!33895) )
))
(declare-fun lt!456790 () Unit!33894)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!8 (array!65292 array!65294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37669 V!37669 V!37669 Int) Unit!33894)

(assert (=> b!1035906 (= lt!456790 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!8 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) lt!456792 (defaultEntry!6270 thiss!1427)))))

(declare-fun dynLambda!1992 (Int (_ BitVec 64)) V!37669)

(assert (=> b!1035906 (= lt!456792 (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035907 () Bool)

(assert (=> b!1035907 (= e!585838 (and e!585840 mapRes!38412))))

(declare-fun condMapEmpty!38412 () Bool)

(declare-fun mapDefault!38412 () ValueCell!11595)

(assert (=> b!1035907 (= condMapEmpty!38412 (= (arr!31432 (_values!6293 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11595)) mapDefault!38412)))))

(assert (= (and start!90576 res!691580) b!1035901))

(assert (= (and b!1035901 res!691578) b!1035906))

(assert (= (and b!1035906 res!691579) b!1035902))

(assert (= (and b!1035907 condMapEmpty!38412) mapIsEmpty!38412))

(assert (= (and b!1035907 (not condMapEmpty!38412)) mapNonEmpty!38412))

(get-info :version)

(assert (= (and mapNonEmpty!38412 ((_ is ValueCellFull!11595) mapValue!38412)) b!1035905))

(assert (= (and b!1035907 ((_ is ValueCellFull!11595) mapDefault!38412)) b!1035904))

(assert (= b!1035903 b!1035907))

(assert (= start!90576 b!1035903))

(declare-fun b_lambda!16103 () Bool)

(assert (=> (not b_lambda!16103) (not b!1035906)))

(declare-fun t!31124 () Bool)

(declare-fun tb!7029 () Bool)

(assert (=> (and b!1035903 (= (defaultEntry!6270 thiss!1427) (defaultEntry!6270 thiss!1427)) t!31124) tb!7029))

(declare-fun result!14419 () Bool)

(assert (=> tb!7029 (= result!14419 tp_is_empty!24597)))

(assert (=> b!1035906 t!31124))

(declare-fun b_and!33381 () Bool)

(assert (= b_and!33379 (and (=> t!31124 result!14419) b_and!33381)))

(declare-fun m!955629 () Bool)

(assert (=> start!90576 m!955629))

(declare-fun m!955631 () Bool)

(assert (=> b!1035903 m!955631))

(declare-fun m!955633 () Bool)

(assert (=> b!1035903 m!955633))

(declare-fun m!955635 () Bool)

(assert (=> mapNonEmpty!38412 m!955635))

(declare-fun m!955637 () Bool)

(assert (=> b!1035902 m!955637))

(declare-fun m!955639 () Bool)

(assert (=> b!1035902 m!955639))

(assert (=> b!1035902 m!955639))

(declare-fun m!955641 () Bool)

(assert (=> b!1035902 m!955641))

(declare-fun m!955643 () Bool)

(assert (=> b!1035906 m!955643))

(declare-fun m!955645 () Bool)

(assert (=> b!1035906 m!955645))

(declare-fun m!955647 () Bool)

(assert (=> b!1035906 m!955647))

(declare-fun m!955649 () Bool)

(assert (=> b!1035906 m!955649))

(declare-fun m!955651 () Bool)

(assert (=> b!1035906 m!955651))

(assert (=> b!1035906 m!955647))

(declare-fun m!955653 () Bool)

(assert (=> b!1035906 m!955653))

(check-sat (not b!1035903) (not mapNonEmpty!38412) tp_is_empty!24597 (not b!1035902) (not b_lambda!16103) (not start!90576) (not b!1035906) b_and!33381 (not b_next!20877))
(check-sat b_and!33381 (not b_next!20877))
(get-model)

(declare-fun b_lambda!16107 () Bool)

(assert (= b_lambda!16103 (or (and b!1035903 b_free!20877) b_lambda!16107)))

(check-sat (not b!1035903) (not mapNonEmpty!38412) tp_is_empty!24597 (not b!1035902) (not b!1035906) (not start!90576) (not b_lambda!16107) b_and!33381 (not b_next!20877))
(check-sat b_and!33381 (not b_next!20877))
(get-model)

(declare-fun d!124559 () Bool)

(assert (=> d!124559 (= (map!14729 lt!456791) (getCurrentListMap!3943 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) #b00000000000000000000000000000000 (defaultEntry!6270 lt!456791)))))

(declare-fun bs!30310 () Bool)

(assert (= bs!30310 d!124559))

(declare-fun m!955681 () Bool)

(assert (=> bs!30310 m!955681))

(assert (=> b!1035902 d!124559))

(declare-fun d!124561 () Bool)

(declare-fun lt!456804 () ListLongMap!13759)

(declare-fun contains!6021 (ListLongMap!13759 (_ BitVec 64)) Bool)

(assert (=> d!124561 (not (contains!6021 lt!456804 key!909))))

(declare-fun removeStrictlySorted!57 (List!21918 (_ BitVec 64)) List!21918)

(assert (=> d!124561 (= lt!456804 (ListLongMap!13760 (removeStrictlySorted!57 (toList!6895 (map!14729 thiss!1427)) key!909)))))

(assert (=> d!124561 (= (-!522 (map!14729 thiss!1427) key!909) lt!456804)))

(declare-fun bs!30311 () Bool)

(assert (= bs!30311 d!124561))

(declare-fun m!955683 () Bool)

(assert (=> bs!30311 m!955683))

(declare-fun m!955685 () Bool)

(assert (=> bs!30311 m!955685))

(assert (=> b!1035902 d!124561))

(declare-fun d!124563 () Bool)

(assert (=> d!124563 (= (map!14729 thiss!1427) (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun bs!30312 () Bool)

(assert (= bs!30312 d!124563))

(assert (=> bs!30312 m!955647))

(assert (=> b!1035902 d!124563))

(declare-fun b!1035975 () Bool)

(declare-fun res!691613 () Bool)

(declare-fun e!585889 () Bool)

(assert (=> b!1035975 (=> (not res!691613) (not e!585889))))

(declare-fun e!585892 () Bool)

(assert (=> b!1035975 (= res!691613 e!585892)))

(declare-fun res!691616 () Bool)

(assert (=> b!1035975 (=> res!691616 e!585892)))

(declare-fun e!585897 () Bool)

(assert (=> b!1035975 (= res!691616 (not e!585897))))

(declare-fun res!691614 () Bool)

(assert (=> b!1035975 (=> (not res!691614) (not e!585897))))

(assert (=> b!1035975 (= res!691614 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun bm!43812 () Bool)

(declare-fun call!43819 () Bool)

(declare-fun lt!456864 () ListLongMap!13759)

(assert (=> bm!43812 (= call!43819 (contains!6021 lt!456864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124565 () Bool)

(assert (=> d!124565 e!585889))

(declare-fun res!691610 () Bool)

(assert (=> d!124565 (=> (not res!691610) (not e!585889))))

(assert (=> d!124565 (= res!691610 (or (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))))

(declare-fun lt!456870 () ListLongMap!13759)

(assert (=> d!124565 (= lt!456864 lt!456870)))

(declare-fun lt!456861 () Unit!33894)

(declare-fun e!585894 () Unit!33894)

(assert (=> d!124565 (= lt!456861 e!585894)))

(declare-fun c!104758 () Bool)

(declare-fun e!585896 () Bool)

(assert (=> d!124565 (= c!104758 e!585896)))

(declare-fun res!691612 () Bool)

(assert (=> d!124565 (=> (not res!691612) (not e!585896))))

(assert (=> d!124565 (= res!691612 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun e!585898 () ListLongMap!13759)

(assert (=> d!124565 (= lt!456870 e!585898)))

(declare-fun c!104763 () Bool)

(assert (=> d!124565 (= c!104763 (and (not (= (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!124565 (validMask!0 (mask!30171 thiss!1427))))

(assert (=> d!124565 (= (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)) lt!456864)))

(declare-fun b!1035976 () Bool)

(declare-fun e!585893 () Bool)

(declare-fun e!585899 () Bool)

(assert (=> b!1035976 (= e!585893 e!585899)))

(declare-fun res!691609 () Bool)

(declare-fun call!43821 () Bool)

(assert (=> b!1035976 (= res!691609 call!43821)))

(assert (=> b!1035976 (=> (not res!691609) (not e!585899))))

(declare-fun b!1035977 () Bool)

(declare-fun e!585890 () ListLongMap!13759)

(declare-fun call!43820 () ListLongMap!13759)

(assert (=> b!1035977 (= e!585890 call!43820)))

(declare-fun b!1035978 () Bool)

(declare-fun e!585900 () Bool)

(declare-fun e!585901 () Bool)

(assert (=> b!1035978 (= e!585900 e!585901)))

(declare-fun res!691611 () Bool)

(assert (=> b!1035978 (= res!691611 call!43819)))

(assert (=> b!1035978 (=> (not res!691611) (not e!585901))))

(declare-fun b!1035979 () Bool)

(declare-fun apply!907 (ListLongMap!13759 (_ BitVec 64)) V!37669)

(assert (=> b!1035979 (= e!585899 (= (apply!907 lt!456864 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6106 thiss!1427)))))

(declare-fun b!1035980 () Bool)

(assert (=> b!1035980 (= e!585893 (not call!43821))))

(declare-fun b!1035981 () Bool)

(declare-fun res!691615 () Bool)

(assert (=> b!1035981 (=> (not res!691615) (not e!585889))))

(assert (=> b!1035981 (= res!691615 e!585900)))

(declare-fun c!104759 () Bool)

(assert (=> b!1035981 (= c!104759 (not (= (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43813 () Bool)

(assert (=> bm!43813 (= call!43821 (contains!6021 lt!456864 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035982 () Bool)

(declare-fun call!43816 () ListLongMap!13759)

(assert (=> b!1035982 (= e!585890 call!43816)))

(declare-fun b!1035983 () Bool)

(assert (=> b!1035983 (= e!585900 (not call!43819))))

(declare-fun bm!43814 () Bool)

(declare-fun call!43818 () ListLongMap!13759)

(declare-fun call!43817 () ListLongMap!13759)

(assert (=> bm!43814 (= call!43818 call!43817)))

(declare-fun b!1035984 () Bool)

(declare-fun call!43815 () ListLongMap!13759)

(declare-fun +!3105 (ListLongMap!13759 tuple2!15730) ListLongMap!13759)

(assert (=> b!1035984 (= e!585898 (+!3105 call!43815 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))

(declare-fun b!1035985 () Bool)

(declare-fun lt!456867 () Unit!33894)

(assert (=> b!1035985 (= e!585894 lt!456867)))

(declare-fun lt!456860 () ListLongMap!13759)

(declare-fun getCurrentListMapNoExtraKeys!3521 (array!65292 array!65294 (_ BitVec 32) (_ BitVec 32) V!37669 V!37669 (_ BitVec 32) Int) ListLongMap!13759)

(assert (=> b!1035985 (= lt!456860 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456857 () (_ BitVec 64))

(assert (=> b!1035985 (= lt!456857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456869 () (_ BitVec 64))

(assert (=> b!1035985 (= lt!456869 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456856 () Unit!33894)

(declare-fun addStillContains!626 (ListLongMap!13759 (_ BitVec 64) V!37669 (_ BitVec 64)) Unit!33894)

(assert (=> b!1035985 (= lt!456856 (addStillContains!626 lt!456860 lt!456857 (zeroValue!6104 thiss!1427) lt!456869))))

(assert (=> b!1035985 (contains!6021 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) lt!456869)))

(declare-fun lt!456859 () Unit!33894)

(assert (=> b!1035985 (= lt!456859 lt!456856)))

(declare-fun lt!456854 () ListLongMap!13759)

(assert (=> b!1035985 (= lt!456854 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456849 () (_ BitVec 64))

(assert (=> b!1035985 (= lt!456849 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456868 () (_ BitVec 64))

(assert (=> b!1035985 (= lt!456868 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456858 () Unit!33894)

(declare-fun addApplyDifferent!486 (ListLongMap!13759 (_ BitVec 64) V!37669 (_ BitVec 64)) Unit!33894)

(assert (=> b!1035985 (= lt!456858 (addApplyDifferent!486 lt!456854 lt!456849 (minValue!6106 thiss!1427) lt!456868))))

(assert (=> b!1035985 (= (apply!907 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) lt!456868) (apply!907 lt!456854 lt!456868))))

(declare-fun lt!456850 () Unit!33894)

(assert (=> b!1035985 (= lt!456850 lt!456858)))

(declare-fun lt!456851 () ListLongMap!13759)

(assert (=> b!1035985 (= lt!456851 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456862 () (_ BitVec 64))

(assert (=> b!1035985 (= lt!456862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456865 () (_ BitVec 64))

(assert (=> b!1035985 (= lt!456865 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456853 () Unit!33894)

(assert (=> b!1035985 (= lt!456853 (addApplyDifferent!486 lt!456851 lt!456862 (zeroValue!6104 thiss!1427) lt!456865))))

(assert (=> b!1035985 (= (apply!907 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) lt!456865) (apply!907 lt!456851 lt!456865))))

(declare-fun lt!456863 () Unit!33894)

(assert (=> b!1035985 (= lt!456863 lt!456853)))

(declare-fun lt!456855 () ListLongMap!13759)

(assert (=> b!1035985 (= lt!456855 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456852 () (_ BitVec 64))

(assert (=> b!1035985 (= lt!456852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456866 () (_ BitVec 64))

(assert (=> b!1035985 (= lt!456866 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035985 (= lt!456867 (addApplyDifferent!486 lt!456855 lt!456852 (minValue!6106 thiss!1427) lt!456866))))

(assert (=> b!1035985 (= (apply!907 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) lt!456866) (apply!907 lt!456855 lt!456866))))

(declare-fun b!1035986 () Bool)

(declare-fun e!585895 () Bool)

(declare-fun get!16463 (ValueCell!11595 V!37669) V!37669)

(assert (=> b!1035986 (= e!585895 (= (apply!907 lt!456864 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1035986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31960 (_values!6293 thiss!1427))))))

(assert (=> b!1035986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1035987 () Bool)

(assert (=> b!1035987 (= e!585889 e!585893)))

(declare-fun c!104762 () Bool)

(assert (=> b!1035987 (= c!104762 (not (= (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035988 () Bool)

(declare-fun Unit!33898 () Unit!33894)

(assert (=> b!1035988 (= e!585894 Unit!33898)))

(declare-fun b!1035989 () Bool)

(assert (=> b!1035989 (= e!585901 (= (apply!907 lt!456864 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6104 thiss!1427)))))

(declare-fun b!1035990 () Bool)

(declare-fun e!585891 () ListLongMap!13759)

(assert (=> b!1035990 (= e!585891 call!43820)))

(declare-fun b!1035991 () Bool)

(assert (=> b!1035991 (= e!585892 e!585895)))

(declare-fun res!691608 () Bool)

(assert (=> b!1035991 (=> (not res!691608) (not e!585895))))

(assert (=> b!1035991 (= res!691608 (contains!6021 lt!456864 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035991 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun c!104760 () Bool)

(declare-fun bm!43815 () Bool)

(assert (=> bm!43815 (= call!43815 (+!3105 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)) (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun bm!43816 () Bool)

(assert (=> bm!43816 (= call!43817 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun bm!43817 () Bool)

(assert (=> bm!43817 (= call!43816 call!43818)))

(declare-fun b!1035992 () Bool)

(assert (=> b!1035992 (= e!585898 e!585891)))

(assert (=> b!1035992 (= c!104760 (and (not (= (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035993 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035993 (= e!585896 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035994 () Bool)

(assert (=> b!1035994 (= e!585897 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43818 () Bool)

(assert (=> bm!43818 (= call!43820 call!43815)))

(declare-fun b!1035995 () Bool)

(declare-fun c!104761 () Bool)

(assert (=> b!1035995 (= c!104761 (and (not (= (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1035995 (= e!585891 e!585890)))

(assert (= (and d!124565 c!104763) b!1035984))

(assert (= (and d!124565 (not c!104763)) b!1035992))

(assert (= (and b!1035992 c!104760) b!1035990))

(assert (= (and b!1035992 (not c!104760)) b!1035995))

(assert (= (and b!1035995 c!104761) b!1035977))

(assert (= (and b!1035995 (not c!104761)) b!1035982))

(assert (= (or b!1035977 b!1035982) bm!43817))

(assert (= (or b!1035990 bm!43817) bm!43814))

(assert (= (or b!1035990 b!1035977) bm!43818))

(assert (= (or b!1035984 bm!43814) bm!43816))

(assert (= (or b!1035984 bm!43818) bm!43815))

(assert (= (and d!124565 res!691612) b!1035993))

(assert (= (and d!124565 c!104758) b!1035985))

(assert (= (and d!124565 (not c!104758)) b!1035988))

(assert (= (and d!124565 res!691610) b!1035975))

(assert (= (and b!1035975 res!691614) b!1035994))

(assert (= (and b!1035975 (not res!691616)) b!1035991))

(assert (= (and b!1035991 res!691608) b!1035986))

(assert (= (and b!1035975 res!691613) b!1035981))

(assert (= (and b!1035981 c!104759) b!1035978))

(assert (= (and b!1035981 (not c!104759)) b!1035983))

(assert (= (and b!1035978 res!691611) b!1035989))

(assert (= (or b!1035978 b!1035983) bm!43812))

(assert (= (and b!1035981 res!691615) b!1035987))

(assert (= (and b!1035987 c!104762) b!1035976))

(assert (= (and b!1035987 (not c!104762)) b!1035980))

(assert (= (and b!1035976 res!691609) b!1035979))

(assert (= (or b!1035976 b!1035980) bm!43813))

(declare-fun b_lambda!16109 () Bool)

(assert (=> (not b_lambda!16109) (not b!1035986)))

(declare-fun t!31130 () Bool)

(declare-fun tb!7033 () Bool)

(assert (=> (and b!1035903 (= (defaultEntry!6270 thiss!1427) (defaultEntry!6270 thiss!1427)) t!31130) tb!7033))

(declare-fun result!14427 () Bool)

(assert (=> tb!7033 (= result!14427 tp_is_empty!24597)))

(assert (=> b!1035986 t!31130))

(declare-fun b_and!33387 () Bool)

(assert (= b_and!33381 (and (=> t!31130 result!14427) b_and!33387)))

(declare-fun m!955687 () Bool)

(assert (=> bm!43816 m!955687))

(declare-fun m!955689 () Bool)

(assert (=> bm!43815 m!955689))

(declare-fun m!955691 () Bool)

(assert (=> b!1035979 m!955691))

(declare-fun m!955693 () Bool)

(assert (=> b!1035994 m!955693))

(assert (=> b!1035994 m!955693))

(declare-fun m!955695 () Bool)

(assert (=> b!1035994 m!955695))

(assert (=> b!1035993 m!955693))

(assert (=> b!1035993 m!955693))

(assert (=> b!1035993 m!955695))

(assert (=> b!1035986 m!955693))

(declare-fun m!955697 () Bool)

(assert (=> b!1035986 m!955697))

(assert (=> b!1035986 m!955693))

(declare-fun m!955699 () Bool)

(assert (=> b!1035986 m!955699))

(declare-fun m!955701 () Bool)

(assert (=> b!1035986 m!955701))

(assert (=> b!1035986 m!955701))

(assert (=> b!1035986 m!955697))

(declare-fun m!955703 () Bool)

(assert (=> b!1035986 m!955703))

(declare-fun m!955705 () Bool)

(assert (=> b!1035989 m!955705))

(declare-fun m!955707 () Bool)

(assert (=> bm!43813 m!955707))

(declare-fun m!955709 () Bool)

(assert (=> b!1035984 m!955709))

(declare-fun m!955711 () Bool)

(assert (=> b!1035985 m!955711))

(declare-fun m!955713 () Bool)

(assert (=> b!1035985 m!955713))

(assert (=> b!1035985 m!955693))

(declare-fun m!955715 () Bool)

(assert (=> b!1035985 m!955715))

(declare-fun m!955717 () Bool)

(assert (=> b!1035985 m!955717))

(assert (=> b!1035985 m!955715))

(declare-fun m!955719 () Bool)

(assert (=> b!1035985 m!955719))

(declare-fun m!955721 () Bool)

(assert (=> b!1035985 m!955721))

(declare-fun m!955723 () Bool)

(assert (=> b!1035985 m!955723))

(assert (=> b!1035985 m!955723))

(declare-fun m!955725 () Bool)

(assert (=> b!1035985 m!955725))

(declare-fun m!955727 () Bool)

(assert (=> b!1035985 m!955727))

(declare-fun m!955729 () Bool)

(assert (=> b!1035985 m!955729))

(declare-fun m!955731 () Bool)

(assert (=> b!1035985 m!955731))

(declare-fun m!955733 () Bool)

(assert (=> b!1035985 m!955733))

(assert (=> b!1035985 m!955687))

(assert (=> b!1035985 m!955719))

(assert (=> b!1035985 m!955731))

(declare-fun m!955735 () Bool)

(assert (=> b!1035985 m!955735))

(declare-fun m!955737 () Bool)

(assert (=> b!1035985 m!955737))

(declare-fun m!955739 () Bool)

(assert (=> b!1035985 m!955739))

(declare-fun m!955741 () Bool)

(assert (=> bm!43812 m!955741))

(assert (=> b!1035991 m!955693))

(assert (=> b!1035991 m!955693))

(declare-fun m!955743 () Bool)

(assert (=> b!1035991 m!955743))

(declare-fun m!955745 () Bool)

(assert (=> d!124565 m!955745))

(assert (=> b!1035906 d!124565))

(declare-fun d!124567 () Bool)

(assert (=> d!124567 (= (-!522 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456873 () Unit!33894)

(declare-fun choose!1702 (array!65292 array!65294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37669 V!37669 V!37669 Int) Unit!33894)

(assert (=> d!124567 (= lt!456873 (choose!1702 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) lt!456792 (defaultEntry!6270 thiss!1427)))))

(assert (=> d!124567 (validMask!0 (mask!30171 thiss!1427))))

(assert (=> d!124567 (= (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!8 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) lt!456792 (defaultEntry!6270 thiss!1427)) lt!456873)))

(declare-fun bs!30313 () Bool)

(assert (= bs!30313 d!124567))

(assert (=> bs!30313 m!955647))

(assert (=> bs!30313 m!955649))

(assert (=> bs!30313 m!955745))

(declare-fun m!955747 () Bool)

(assert (=> bs!30313 m!955747))

(assert (=> bs!30313 m!955645))

(assert (=> bs!30313 m!955647))

(assert (=> b!1035906 d!124567))

(declare-fun d!124569 () Bool)

(declare-fun lt!456874 () ListLongMap!13759)

(assert (=> d!124569 (not (contains!6021 lt!456874 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124569 (= lt!456874 (ListLongMap!13760 (removeStrictlySorted!57 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124569 (= (-!522 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456874)))

(declare-fun bs!30314 () Bool)

(assert (= bs!30314 d!124569))

(declare-fun m!955749 () Bool)

(assert (=> bs!30314 m!955749))

(declare-fun m!955751 () Bool)

(assert (=> bs!30314 m!955751))

(assert (=> b!1035906 d!124569))

(declare-fun b!1035996 () Bool)

(declare-fun res!691622 () Bool)

(declare-fun e!585902 () Bool)

(assert (=> b!1035996 (=> (not res!691622) (not e!585902))))

(declare-fun e!585905 () Bool)

(assert (=> b!1035996 (= res!691622 e!585905)))

(declare-fun res!691625 () Bool)

(assert (=> b!1035996 (=> res!691625 e!585905)))

(declare-fun e!585910 () Bool)

(assert (=> b!1035996 (= res!691625 (not e!585910))))

(declare-fun res!691623 () Bool)

(assert (=> b!1035996 (=> (not res!691623) (not e!585910))))

(assert (=> b!1035996 (= res!691623 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun bm!43819 () Bool)

(declare-fun call!43826 () Bool)

(declare-fun lt!456890 () ListLongMap!13759)

(assert (=> bm!43819 (= call!43826 (contains!6021 lt!456890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124571 () Bool)

(assert (=> d!124571 e!585902))

(declare-fun res!691619 () Bool)

(assert (=> d!124571 (=> (not res!691619) (not e!585902))))

(assert (=> d!124571 (= res!691619 (or (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))))

(declare-fun lt!456896 () ListLongMap!13759)

(assert (=> d!124571 (= lt!456890 lt!456896)))

(declare-fun lt!456887 () Unit!33894)

(declare-fun e!585907 () Unit!33894)

(assert (=> d!124571 (= lt!456887 e!585907)))

(declare-fun c!104764 () Bool)

(declare-fun e!585909 () Bool)

(assert (=> d!124571 (= c!104764 e!585909)))

(declare-fun res!691621 () Bool)

(assert (=> d!124571 (=> (not res!691621) (not e!585909))))

(assert (=> d!124571 (= res!691621 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun e!585911 () ListLongMap!13759)

(assert (=> d!124571 (= lt!456896 e!585911)))

(declare-fun c!104769 () Bool)

(assert (=> d!124571 (= c!104769 (and (not (= (bvand (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124571 (validMask!0 (mask!30171 thiss!1427))))

(assert (=> d!124571 (= (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)) lt!456890)))

(declare-fun b!1035997 () Bool)

(declare-fun e!585906 () Bool)

(declare-fun e!585912 () Bool)

(assert (=> b!1035997 (= e!585906 e!585912)))

(declare-fun res!691618 () Bool)

(declare-fun call!43828 () Bool)

(assert (=> b!1035997 (= res!691618 call!43828)))

(assert (=> b!1035997 (=> (not res!691618) (not e!585912))))

(declare-fun b!1035998 () Bool)

(declare-fun e!585903 () ListLongMap!13759)

(declare-fun call!43827 () ListLongMap!13759)

(assert (=> b!1035998 (= e!585903 call!43827)))

(declare-fun b!1035999 () Bool)

(declare-fun e!585913 () Bool)

(declare-fun e!585914 () Bool)

(assert (=> b!1035999 (= e!585913 e!585914)))

(declare-fun res!691620 () Bool)

(assert (=> b!1035999 (= res!691620 call!43826)))

(assert (=> b!1035999 (=> (not res!691620) (not e!585914))))

(declare-fun b!1036000 () Bool)

(assert (=> b!1036000 (= e!585912 (= (apply!907 lt!456890 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456792))))

(declare-fun b!1036001 () Bool)

(assert (=> b!1036001 (= e!585906 (not call!43828))))

(declare-fun b!1036002 () Bool)

(declare-fun res!691624 () Bool)

(assert (=> b!1036002 (=> (not res!691624) (not e!585902))))

(assert (=> b!1036002 (= res!691624 e!585913)))

(declare-fun c!104765 () Bool)

(assert (=> b!1036002 (= c!104765 (not (= (bvand (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43820 () Bool)

(assert (=> bm!43820 (= call!43828 (contains!6021 lt!456890 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036003 () Bool)

(declare-fun call!43823 () ListLongMap!13759)

(assert (=> b!1036003 (= e!585903 call!43823)))

(declare-fun b!1036004 () Bool)

(assert (=> b!1036004 (= e!585913 (not call!43826))))

(declare-fun bm!43821 () Bool)

(declare-fun call!43825 () ListLongMap!13759)

(declare-fun call!43824 () ListLongMap!13759)

(assert (=> bm!43821 (= call!43825 call!43824)))

(declare-fun b!1036005 () Bool)

(declare-fun call!43822 () ListLongMap!13759)

(assert (=> b!1036005 (= e!585911 (+!3105 call!43822 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))

(declare-fun b!1036006 () Bool)

(declare-fun lt!456893 () Unit!33894)

(assert (=> b!1036006 (= e!585907 lt!456893)))

(declare-fun lt!456886 () ListLongMap!13759)

(assert (=> b!1036006 (= lt!456886 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456883 () (_ BitVec 64))

(assert (=> b!1036006 (= lt!456883 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456895 () (_ BitVec 64))

(assert (=> b!1036006 (= lt!456895 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456882 () Unit!33894)

(assert (=> b!1036006 (= lt!456882 (addStillContains!626 lt!456886 lt!456883 (zeroValue!6104 thiss!1427) lt!456895))))

(assert (=> b!1036006 (contains!6021 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) lt!456895)))

(declare-fun lt!456885 () Unit!33894)

(assert (=> b!1036006 (= lt!456885 lt!456882)))

(declare-fun lt!456880 () ListLongMap!13759)

(assert (=> b!1036006 (= lt!456880 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456875 () (_ BitVec 64))

(assert (=> b!1036006 (= lt!456875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456894 () (_ BitVec 64))

(assert (=> b!1036006 (= lt!456894 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456884 () Unit!33894)

(assert (=> b!1036006 (= lt!456884 (addApplyDifferent!486 lt!456880 lt!456875 lt!456792 lt!456894))))

(assert (=> b!1036006 (= (apply!907 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)) lt!456894) (apply!907 lt!456880 lt!456894))))

(declare-fun lt!456876 () Unit!33894)

(assert (=> b!1036006 (= lt!456876 lt!456884)))

(declare-fun lt!456877 () ListLongMap!13759)

(assert (=> b!1036006 (= lt!456877 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456888 () (_ BitVec 64))

(assert (=> b!1036006 (= lt!456888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456891 () (_ BitVec 64))

(assert (=> b!1036006 (= lt!456891 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456879 () Unit!33894)

(assert (=> b!1036006 (= lt!456879 (addApplyDifferent!486 lt!456877 lt!456888 (zeroValue!6104 thiss!1427) lt!456891))))

(assert (=> b!1036006 (= (apply!907 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) lt!456891) (apply!907 lt!456877 lt!456891))))

(declare-fun lt!456889 () Unit!33894)

(assert (=> b!1036006 (= lt!456889 lt!456879)))

(declare-fun lt!456881 () ListLongMap!13759)

(assert (=> b!1036006 (= lt!456881 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun lt!456878 () (_ BitVec 64))

(assert (=> b!1036006 (= lt!456878 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456892 () (_ BitVec 64))

(assert (=> b!1036006 (= lt!456892 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036006 (= lt!456893 (addApplyDifferent!486 lt!456881 lt!456878 lt!456792 lt!456892))))

(assert (=> b!1036006 (= (apply!907 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)) lt!456892) (apply!907 lt!456881 lt!456892))))

(declare-fun b!1036007 () Bool)

(declare-fun e!585908 () Bool)

(assert (=> b!1036007 (= e!585908 (= (apply!907 lt!456890 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1036007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31960 (_values!6293 thiss!1427))))))

(assert (=> b!1036007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036008 () Bool)

(assert (=> b!1036008 (= e!585902 e!585906)))

(declare-fun c!104768 () Bool)

(assert (=> b!1036008 (= c!104768 (not (= (bvand (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1036009 () Bool)

(declare-fun Unit!33899 () Unit!33894)

(assert (=> b!1036009 (= e!585907 Unit!33899)))

(declare-fun b!1036010 () Bool)

(assert (=> b!1036010 (= e!585914 (= (apply!907 lt!456890 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6104 thiss!1427)))))

(declare-fun b!1036011 () Bool)

(declare-fun e!585904 () ListLongMap!13759)

(assert (=> b!1036011 (= e!585904 call!43827)))

(declare-fun b!1036012 () Bool)

(assert (=> b!1036012 (= e!585905 e!585908)))

(declare-fun res!691617 () Bool)

(assert (=> b!1036012 (=> (not res!691617) (not e!585908))))

(assert (=> b!1036012 (= res!691617 (contains!6021 lt!456890 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun c!104766 () Bool)

(declare-fun bm!43822 () Bool)

(assert (=> bm!43822 (= call!43822 (+!3105 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)) (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun bm!43823 () Bool)

(assert (=> bm!43823 (= call!43824 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(declare-fun bm!43824 () Bool)

(assert (=> bm!43824 (= call!43823 call!43825)))

(declare-fun b!1036013 () Bool)

(assert (=> b!1036013 (= e!585911 e!585904)))

(assert (=> b!1036013 (= c!104766 (and (not (= (bvand (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1036014 () Bool)

(assert (=> b!1036014 (= e!585909 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036015 () Bool)

(assert (=> b!1036015 (= e!585910 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43825 () Bool)

(assert (=> bm!43825 (= call!43827 call!43822)))

(declare-fun b!1036016 () Bool)

(declare-fun c!104767 () Bool)

(assert (=> b!1036016 (= c!104767 (and (not (= (bvand (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1036016 (= e!585904 e!585903)))

(assert (= (and d!124571 c!104769) b!1036005))

(assert (= (and d!124571 (not c!104769)) b!1036013))

(assert (= (and b!1036013 c!104766) b!1036011))

(assert (= (and b!1036013 (not c!104766)) b!1036016))

(assert (= (and b!1036016 c!104767) b!1035998))

(assert (= (and b!1036016 (not c!104767)) b!1036003))

(assert (= (or b!1035998 b!1036003) bm!43824))

(assert (= (or b!1036011 bm!43824) bm!43821))

(assert (= (or b!1036011 b!1035998) bm!43825))

(assert (= (or b!1036005 bm!43821) bm!43823))

(assert (= (or b!1036005 bm!43825) bm!43822))

(assert (= (and d!124571 res!691621) b!1036014))

(assert (= (and d!124571 c!104764) b!1036006))

(assert (= (and d!124571 (not c!104764)) b!1036009))

(assert (= (and d!124571 res!691619) b!1035996))

(assert (= (and b!1035996 res!691623) b!1036015))

(assert (= (and b!1035996 (not res!691625)) b!1036012))

(assert (= (and b!1036012 res!691617) b!1036007))

(assert (= (and b!1035996 res!691622) b!1036002))

(assert (= (and b!1036002 c!104765) b!1035999))

(assert (= (and b!1036002 (not c!104765)) b!1036004))

(assert (= (and b!1035999 res!691620) b!1036010))

(assert (= (or b!1035999 b!1036004) bm!43819))

(assert (= (and b!1036002 res!691624) b!1036008))

(assert (= (and b!1036008 c!104768) b!1035997))

(assert (= (and b!1036008 (not c!104768)) b!1036001))

(assert (= (and b!1035997 res!691618) b!1036000))

(assert (= (or b!1035997 b!1036001) bm!43820))

(declare-fun b_lambda!16111 () Bool)

(assert (=> (not b_lambda!16111) (not b!1036007)))

(assert (=> b!1036007 t!31130))

(declare-fun b_and!33389 () Bool)

(assert (= b_and!33387 (and (=> t!31130 result!14427) b_and!33389)))

(declare-fun m!955753 () Bool)

(assert (=> bm!43823 m!955753))

(declare-fun m!955755 () Bool)

(assert (=> bm!43822 m!955755))

(declare-fun m!955757 () Bool)

(assert (=> b!1036000 m!955757))

(assert (=> b!1036015 m!955693))

(assert (=> b!1036015 m!955693))

(assert (=> b!1036015 m!955695))

(assert (=> b!1036014 m!955693))

(assert (=> b!1036014 m!955693))

(assert (=> b!1036014 m!955695))

(assert (=> b!1036007 m!955693))

(assert (=> b!1036007 m!955697))

(assert (=> b!1036007 m!955693))

(declare-fun m!955759 () Bool)

(assert (=> b!1036007 m!955759))

(assert (=> b!1036007 m!955701))

(assert (=> b!1036007 m!955701))

(assert (=> b!1036007 m!955697))

(assert (=> b!1036007 m!955703))

(declare-fun m!955761 () Bool)

(assert (=> b!1036010 m!955761))

(declare-fun m!955763 () Bool)

(assert (=> bm!43820 m!955763))

(declare-fun m!955765 () Bool)

(assert (=> b!1036005 m!955765))

(declare-fun m!955767 () Bool)

(assert (=> b!1036006 m!955767))

(declare-fun m!955769 () Bool)

(assert (=> b!1036006 m!955769))

(assert (=> b!1036006 m!955693))

(declare-fun m!955771 () Bool)

(assert (=> b!1036006 m!955771))

(declare-fun m!955773 () Bool)

(assert (=> b!1036006 m!955773))

(assert (=> b!1036006 m!955771))

(declare-fun m!955775 () Bool)

(assert (=> b!1036006 m!955775))

(declare-fun m!955777 () Bool)

(assert (=> b!1036006 m!955777))

(declare-fun m!955779 () Bool)

(assert (=> b!1036006 m!955779))

(assert (=> b!1036006 m!955779))

(declare-fun m!955781 () Bool)

(assert (=> b!1036006 m!955781))

(declare-fun m!955783 () Bool)

(assert (=> b!1036006 m!955783))

(declare-fun m!955785 () Bool)

(assert (=> b!1036006 m!955785))

(declare-fun m!955787 () Bool)

(assert (=> b!1036006 m!955787))

(declare-fun m!955789 () Bool)

(assert (=> b!1036006 m!955789))

(assert (=> b!1036006 m!955753))

(assert (=> b!1036006 m!955775))

(assert (=> b!1036006 m!955787))

(declare-fun m!955791 () Bool)

(assert (=> b!1036006 m!955791))

(declare-fun m!955793 () Bool)

(assert (=> b!1036006 m!955793))

(declare-fun m!955795 () Bool)

(assert (=> b!1036006 m!955795))

(declare-fun m!955797 () Bool)

(assert (=> bm!43819 m!955797))

(assert (=> b!1036012 m!955693))

(assert (=> b!1036012 m!955693))

(declare-fun m!955799 () Bool)

(assert (=> b!1036012 m!955799))

(assert (=> d!124571 m!955745))

(assert (=> b!1035906 d!124571))

(declare-fun d!124573 () Bool)

(declare-fun res!691632 () Bool)

(declare-fun e!585917 () Bool)

(assert (=> d!124573 (=> (not res!691632) (not e!585917))))

(declare-fun simpleValid!414 (LongMapFixedSize!5784) Bool)

(assert (=> d!124573 (= res!691632 (simpleValid!414 lt!456791))))

(assert (=> d!124573 (= (valid!2181 lt!456791) e!585917)))

(declare-fun b!1036023 () Bool)

(declare-fun res!691633 () Bool)

(assert (=> b!1036023 (=> (not res!691633) (not e!585917))))

(declare-fun arrayCountValidKeys!0 (array!65292 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036023 (= res!691633 (= (arrayCountValidKeys!0 (_keys!11459 lt!456791) #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))) (_size!2947 lt!456791)))))

(declare-fun b!1036024 () Bool)

(declare-fun res!691634 () Bool)

(assert (=> b!1036024 (=> (not res!691634) (not e!585917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65292 (_ BitVec 32)) Bool)

(assert (=> b!1036024 (= res!691634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11459 lt!456791) (mask!30171 lt!456791)))))

(declare-fun b!1036025 () Bool)

(declare-datatypes ((List!21920 0))(
  ( (Nil!21917) (Cons!21916 (h!23118 (_ BitVec 64)) (t!31131 List!21920)) )
))
(declare-fun arrayNoDuplicates!0 (array!65292 (_ BitVec 32) List!21920) Bool)

(assert (=> b!1036025 (= e!585917 (arrayNoDuplicates!0 (_keys!11459 lt!456791) #b00000000000000000000000000000000 Nil!21917))))

(assert (= (and d!124573 res!691632) b!1036023))

(assert (= (and b!1036023 res!691633) b!1036024))

(assert (= (and b!1036024 res!691634) b!1036025))

(declare-fun m!955801 () Bool)

(assert (=> d!124573 m!955801))

(declare-fun m!955803 () Bool)

(assert (=> b!1036023 m!955803))

(declare-fun m!955805 () Bool)

(assert (=> b!1036024 m!955805))

(declare-fun m!955807 () Bool)

(assert (=> b!1036025 m!955807))

(assert (=> b!1035906 d!124573))

(declare-fun d!124575 () Bool)

(declare-fun res!691635 () Bool)

(declare-fun e!585918 () Bool)

(assert (=> d!124575 (=> (not res!691635) (not e!585918))))

(assert (=> d!124575 (= res!691635 (simpleValid!414 thiss!1427))))

(assert (=> d!124575 (= (valid!2181 thiss!1427) e!585918)))

(declare-fun b!1036026 () Bool)

(declare-fun res!691636 () Bool)

(assert (=> b!1036026 (=> (not res!691636) (not e!585918))))

(assert (=> b!1036026 (= res!691636 (= (arrayCountValidKeys!0 (_keys!11459 thiss!1427) #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))) (_size!2947 thiss!1427)))))

(declare-fun b!1036027 () Bool)

(declare-fun res!691637 () Bool)

(assert (=> b!1036027 (=> (not res!691637) (not e!585918))))

(assert (=> b!1036027 (= res!691637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11459 thiss!1427) (mask!30171 thiss!1427)))))

(declare-fun b!1036028 () Bool)

(assert (=> b!1036028 (= e!585918 (arrayNoDuplicates!0 (_keys!11459 thiss!1427) #b00000000000000000000000000000000 Nil!21917))))

(assert (= (and d!124575 res!691635) b!1036026))

(assert (= (and b!1036026 res!691636) b!1036027))

(assert (= (and b!1036027 res!691637) b!1036028))

(declare-fun m!955809 () Bool)

(assert (=> d!124575 m!955809))

(declare-fun m!955811 () Bool)

(assert (=> b!1036026 m!955811))

(declare-fun m!955813 () Bool)

(assert (=> b!1036027 m!955813))

(declare-fun m!955815 () Bool)

(assert (=> b!1036028 m!955815))

(assert (=> start!90576 d!124575))

(declare-fun d!124577 () Bool)

(assert (=> d!124577 (= (array_inv!24315 (_keys!11459 thiss!1427)) (bvsge (size!31959 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035903 d!124577))

(declare-fun d!124579 () Bool)

(assert (=> d!124579 (= (array_inv!24316 (_values!6293 thiss!1427)) (bvsge (size!31960 (_values!6293 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035903 d!124579))

(declare-fun mapNonEmpty!38418 () Bool)

(declare-fun mapRes!38418 () Bool)

(declare-fun tp!73774 () Bool)

(declare-fun e!585924 () Bool)

(assert (=> mapNonEmpty!38418 (= mapRes!38418 (and tp!73774 e!585924))))

(declare-fun mapKey!38418 () (_ BitVec 32))

(declare-fun mapRest!38418 () (Array (_ BitVec 32) ValueCell!11595))

(declare-fun mapValue!38418 () ValueCell!11595)

(assert (=> mapNonEmpty!38418 (= mapRest!38412 (store mapRest!38418 mapKey!38418 mapValue!38418))))

(declare-fun b!1036035 () Bool)

(assert (=> b!1036035 (= e!585924 tp_is_empty!24597)))

(declare-fun mapIsEmpty!38418 () Bool)

(assert (=> mapIsEmpty!38418 mapRes!38418))

(declare-fun condMapEmpty!38418 () Bool)

(declare-fun mapDefault!38418 () ValueCell!11595)

(assert (=> mapNonEmpty!38412 (= condMapEmpty!38418 (= mapRest!38412 ((as const (Array (_ BitVec 32) ValueCell!11595)) mapDefault!38418)))))

(declare-fun e!585923 () Bool)

(assert (=> mapNonEmpty!38412 (= tp!73765 (and e!585923 mapRes!38418))))

(declare-fun b!1036036 () Bool)

(assert (=> b!1036036 (= e!585923 tp_is_empty!24597)))

(assert (= (and mapNonEmpty!38412 condMapEmpty!38418) mapIsEmpty!38418))

(assert (= (and mapNonEmpty!38412 (not condMapEmpty!38418)) mapNonEmpty!38418))

(assert (= (and mapNonEmpty!38418 ((_ is ValueCellFull!11595) mapValue!38418)) b!1036035))

(assert (= (and mapNonEmpty!38412 ((_ is ValueCellFull!11595) mapDefault!38418)) b!1036036))

(declare-fun m!955817 () Bool)

(assert (=> mapNonEmpty!38418 m!955817))

(declare-fun b_lambda!16113 () Bool)

(assert (= b_lambda!16109 (or (and b!1035903 b_free!20877) b_lambda!16113)))

(declare-fun b_lambda!16115 () Bool)

(assert (= b_lambda!16111 (or (and b!1035903 b_free!20877) b_lambda!16115)))

(check-sat tp_is_empty!24597 (not d!124569) (not b!1036027) (not bm!43815) (not d!124573) (not b_lambda!16113) (not b!1036007) (not bm!43822) (not bm!43816) (not bm!43820) (not b!1035985) (not d!124571) (not b!1036024) (not b!1036006) (not b!1036014) (not mapNonEmpty!38418) (not bm!43813) (not b!1036012) (not b!1035984) (not b!1035994) (not b!1036025) (not b!1035979) (not b!1035986) (not b!1036015) b_and!33389 (not b!1036010) (not b_lambda!16107) (not b!1036026) (not b!1036028) (not b_next!20877) (not d!124559) (not b!1036000) (not b_lambda!16115) (not b!1035993) (not d!124575) (not b!1035991) (not bm!43812) (not d!124565) (not bm!43823) (not b!1035989) (not b!1036023) (not d!124563) (not bm!43819) (not d!124567) (not b!1036005) (not d!124561))
(check-sat b_and!33389 (not b_next!20877))
(get-model)

(declare-fun d!124581 () Bool)

(assert (=> d!124581 (= (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1036014 d!124581))

(assert (=> d!124563 d!124565))

(declare-fun d!124583 () Bool)

(declare-datatypes ((Option!640 0))(
  ( (Some!639 (v!14931 V!37669)) (None!638) )
))
(declare-fun get!16464 (Option!640) V!37669)

(declare-fun getValueByKey!589 (List!21918 (_ BitVec 64)) Option!640)

(assert (=> d!124583 (= (apply!907 lt!456864 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (get!16464 (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30315 () Bool)

(assert (= bs!30315 d!124583))

(assert (=> bs!30315 m!955693))

(declare-fun m!955819 () Bool)

(assert (=> bs!30315 m!955819))

(assert (=> bs!30315 m!955819))

(declare-fun m!955821 () Bool)

(assert (=> bs!30315 m!955821))

(assert (=> b!1035986 d!124583))

(declare-fun d!124585 () Bool)

(declare-fun c!104772 () Bool)

(assert (=> d!124585 (= c!104772 ((_ is ValueCellFull!11595) (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585927 () V!37669)

(assert (=> d!124585 (= (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!585927)))

(declare-fun b!1036041 () Bool)

(declare-fun get!16465 (ValueCell!11595 V!37669) V!37669)

(assert (=> b!1036041 (= e!585927 (get!16465 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036042 () Bool)

(declare-fun get!16466 (ValueCell!11595 V!37669) V!37669)

(assert (=> b!1036042 (= e!585927 (get!16466 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124585 c!104772) b!1036041))

(assert (= (and d!124585 (not c!104772)) b!1036042))

(assert (=> b!1036041 m!955701))

(assert (=> b!1036041 m!955697))

(declare-fun m!955823 () Bool)

(assert (=> b!1036041 m!955823))

(assert (=> b!1036042 m!955701))

(assert (=> b!1036042 m!955697))

(declare-fun m!955825 () Bool)

(assert (=> b!1036042 m!955825))

(assert (=> b!1035986 d!124585))

(declare-fun d!124587 () Bool)

(declare-fun e!585932 () Bool)

(assert (=> d!124587 e!585932))

(declare-fun res!691640 () Bool)

(assert (=> d!124587 (=> res!691640 e!585932)))

(declare-fun lt!456906 () Bool)

(assert (=> d!124587 (= res!691640 (not lt!456906))))

(declare-fun lt!456908 () Bool)

(assert (=> d!124587 (= lt!456906 lt!456908)))

(declare-fun lt!456905 () Unit!33894)

(declare-fun e!585933 () Unit!33894)

(assert (=> d!124587 (= lt!456905 e!585933)))

(declare-fun c!104775 () Bool)

(assert (=> d!124587 (= c!104775 lt!456908)))

(declare-fun containsKey!564 (List!21918 (_ BitVec 64)) Bool)

(assert (=> d!124587 (= lt!456908 (containsKey!564 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124587 (= (contains!6021 lt!456890 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456906)))

(declare-fun b!1036049 () Bool)

(declare-fun lt!456907 () Unit!33894)

(assert (=> b!1036049 (= e!585933 lt!456907)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!397 (List!21918 (_ BitVec 64)) Unit!33894)

(assert (=> b!1036049 (= lt!456907 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!436 (Option!640) Bool)

(assert (=> b!1036049 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036050 () Bool)

(declare-fun Unit!33900 () Unit!33894)

(assert (=> b!1036050 (= e!585933 Unit!33900)))

(declare-fun b!1036051 () Bool)

(assert (=> b!1036051 (= e!585932 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124587 c!104775) b!1036049))

(assert (= (and d!124587 (not c!104775)) b!1036050))

(assert (= (and d!124587 (not res!691640)) b!1036051))

(declare-fun m!955827 () Bool)

(assert (=> d!124587 m!955827))

(declare-fun m!955829 () Bool)

(assert (=> b!1036049 m!955829))

(declare-fun m!955831 () Bool)

(assert (=> b!1036049 m!955831))

(assert (=> b!1036049 m!955831))

(declare-fun m!955833 () Bool)

(assert (=> b!1036049 m!955833))

(assert (=> b!1036051 m!955831))

(assert (=> b!1036051 m!955831))

(assert (=> b!1036051 m!955833))

(assert (=> bm!43819 d!124587))

(declare-fun b!1036052 () Bool)

(declare-fun res!691646 () Bool)

(declare-fun e!585934 () Bool)

(assert (=> b!1036052 (=> (not res!691646) (not e!585934))))

(declare-fun e!585937 () Bool)

(assert (=> b!1036052 (= res!691646 e!585937)))

(declare-fun res!691649 () Bool)

(assert (=> b!1036052 (=> res!691649 e!585937)))

(declare-fun e!585942 () Bool)

(assert (=> b!1036052 (= res!691649 (not e!585942))))

(declare-fun res!691647 () Bool)

(assert (=> b!1036052 (=> (not res!691647) (not e!585942))))

(assert (=> b!1036052 (= res!691647 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(declare-fun bm!43826 () Bool)

(declare-fun call!43833 () Bool)

(declare-fun lt!456924 () ListLongMap!13759)

(assert (=> bm!43826 (= call!43833 (contains!6021 lt!456924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124589 () Bool)

(assert (=> d!124589 e!585934))

(declare-fun res!691643 () Bool)

(assert (=> d!124589 (=> (not res!691643) (not e!585934))))

(assert (=> d!124589 (= res!691643 (or (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))))

(declare-fun lt!456930 () ListLongMap!13759)

(assert (=> d!124589 (= lt!456924 lt!456930)))

(declare-fun lt!456921 () Unit!33894)

(declare-fun e!585939 () Unit!33894)

(assert (=> d!124589 (= lt!456921 e!585939)))

(declare-fun c!104776 () Bool)

(declare-fun e!585941 () Bool)

(assert (=> d!124589 (= c!104776 e!585941)))

(declare-fun res!691645 () Bool)

(assert (=> d!124589 (=> (not res!691645) (not e!585941))))

(assert (=> d!124589 (= res!691645 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(declare-fun e!585943 () ListLongMap!13759)

(assert (=> d!124589 (= lt!456930 e!585943)))

(declare-fun c!104781 () Bool)

(assert (=> d!124589 (= c!104781 (and (not (= (bvand (extraKeys!6000 lt!456791) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6000 lt!456791) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124589 (validMask!0 (mask!30171 lt!456791))))

(assert (=> d!124589 (= (getCurrentListMap!3943 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) #b00000000000000000000000000000000 (defaultEntry!6270 lt!456791)) lt!456924)))

(declare-fun b!1036053 () Bool)

(declare-fun e!585938 () Bool)

(declare-fun e!585944 () Bool)

(assert (=> b!1036053 (= e!585938 e!585944)))

(declare-fun res!691642 () Bool)

(declare-fun call!43835 () Bool)

(assert (=> b!1036053 (= res!691642 call!43835)))

(assert (=> b!1036053 (=> (not res!691642) (not e!585944))))

(declare-fun b!1036054 () Bool)

(declare-fun e!585935 () ListLongMap!13759)

(declare-fun call!43834 () ListLongMap!13759)

(assert (=> b!1036054 (= e!585935 call!43834)))

(declare-fun b!1036055 () Bool)

(declare-fun e!585945 () Bool)

(declare-fun e!585946 () Bool)

(assert (=> b!1036055 (= e!585945 e!585946)))

(declare-fun res!691644 () Bool)

(assert (=> b!1036055 (= res!691644 call!43833)))

(assert (=> b!1036055 (=> (not res!691644) (not e!585946))))

(declare-fun b!1036056 () Bool)

(assert (=> b!1036056 (= e!585944 (= (apply!907 lt!456924 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6106 lt!456791)))))

(declare-fun b!1036057 () Bool)

(assert (=> b!1036057 (= e!585938 (not call!43835))))

(declare-fun b!1036058 () Bool)

(declare-fun res!691648 () Bool)

(assert (=> b!1036058 (=> (not res!691648) (not e!585934))))

(assert (=> b!1036058 (= res!691648 e!585945)))

(declare-fun c!104777 () Bool)

(assert (=> b!1036058 (= c!104777 (not (= (bvand (extraKeys!6000 lt!456791) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43827 () Bool)

(assert (=> bm!43827 (= call!43835 (contains!6021 lt!456924 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036059 () Bool)

(declare-fun call!43830 () ListLongMap!13759)

(assert (=> b!1036059 (= e!585935 call!43830)))

(declare-fun b!1036060 () Bool)

(assert (=> b!1036060 (= e!585945 (not call!43833))))

(declare-fun bm!43828 () Bool)

(declare-fun call!43832 () ListLongMap!13759)

(declare-fun call!43831 () ListLongMap!13759)

(assert (=> bm!43828 (= call!43832 call!43831)))

(declare-fun b!1036061 () Bool)

(declare-fun call!43829 () ListLongMap!13759)

(assert (=> b!1036061 (= e!585943 (+!3105 call!43829 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))))

(declare-fun b!1036062 () Bool)

(declare-fun lt!456927 () Unit!33894)

(assert (=> b!1036062 (= e!585939 lt!456927)))

(declare-fun lt!456920 () ListLongMap!13759)

(assert (=> b!1036062 (= lt!456920 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) #b00000000000000000000000000000000 (defaultEntry!6270 lt!456791)))))

(declare-fun lt!456917 () (_ BitVec 64))

(assert (=> b!1036062 (= lt!456917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456929 () (_ BitVec 64))

(assert (=> b!1036062 (= lt!456929 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000))))

(declare-fun lt!456916 () Unit!33894)

(assert (=> b!1036062 (= lt!456916 (addStillContains!626 lt!456920 lt!456917 (zeroValue!6104 lt!456791) lt!456929))))

(assert (=> b!1036062 (contains!6021 (+!3105 lt!456920 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791))) lt!456929)))

(declare-fun lt!456919 () Unit!33894)

(assert (=> b!1036062 (= lt!456919 lt!456916)))

(declare-fun lt!456914 () ListLongMap!13759)

(assert (=> b!1036062 (= lt!456914 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) #b00000000000000000000000000000000 (defaultEntry!6270 lt!456791)))))

(declare-fun lt!456909 () (_ BitVec 64))

(assert (=> b!1036062 (= lt!456909 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456928 () (_ BitVec 64))

(assert (=> b!1036062 (= lt!456928 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000))))

(declare-fun lt!456918 () Unit!33894)

(assert (=> b!1036062 (= lt!456918 (addApplyDifferent!486 lt!456914 lt!456909 (minValue!6106 lt!456791) lt!456928))))

(assert (=> b!1036062 (= (apply!907 (+!3105 lt!456914 (tuple2!15731 lt!456909 (minValue!6106 lt!456791))) lt!456928) (apply!907 lt!456914 lt!456928))))

(declare-fun lt!456910 () Unit!33894)

(assert (=> b!1036062 (= lt!456910 lt!456918)))

(declare-fun lt!456911 () ListLongMap!13759)

(assert (=> b!1036062 (= lt!456911 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) #b00000000000000000000000000000000 (defaultEntry!6270 lt!456791)))))

(declare-fun lt!456922 () (_ BitVec 64))

(assert (=> b!1036062 (= lt!456922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456925 () (_ BitVec 64))

(assert (=> b!1036062 (= lt!456925 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000))))

(declare-fun lt!456913 () Unit!33894)

(assert (=> b!1036062 (= lt!456913 (addApplyDifferent!486 lt!456911 lt!456922 (zeroValue!6104 lt!456791) lt!456925))))

(assert (=> b!1036062 (= (apply!907 (+!3105 lt!456911 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791))) lt!456925) (apply!907 lt!456911 lt!456925))))

(declare-fun lt!456923 () Unit!33894)

(assert (=> b!1036062 (= lt!456923 lt!456913)))

(declare-fun lt!456915 () ListLongMap!13759)

(assert (=> b!1036062 (= lt!456915 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) #b00000000000000000000000000000000 (defaultEntry!6270 lt!456791)))))

(declare-fun lt!456912 () (_ BitVec 64))

(assert (=> b!1036062 (= lt!456912 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456926 () (_ BitVec 64))

(assert (=> b!1036062 (= lt!456926 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000))))

(assert (=> b!1036062 (= lt!456927 (addApplyDifferent!486 lt!456915 lt!456912 (minValue!6106 lt!456791) lt!456926))))

(assert (=> b!1036062 (= (apply!907 (+!3105 lt!456915 (tuple2!15731 lt!456912 (minValue!6106 lt!456791))) lt!456926) (apply!907 lt!456915 lt!456926))))

(declare-fun b!1036063 () Bool)

(declare-fun e!585940 () Bool)

(assert (=> b!1036063 (= e!585940 (= (apply!907 lt!456924 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)) (get!16463 (select (arr!31432 (_values!6293 lt!456791)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 lt!456791) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1036063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31960 (_values!6293 lt!456791))))))

(assert (=> b!1036063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(declare-fun b!1036064 () Bool)

(assert (=> b!1036064 (= e!585934 e!585938)))

(declare-fun c!104780 () Bool)

(assert (=> b!1036064 (= c!104780 (not (= (bvand (extraKeys!6000 lt!456791) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1036065 () Bool)

(declare-fun Unit!33901 () Unit!33894)

(assert (=> b!1036065 (= e!585939 Unit!33901)))

(declare-fun b!1036066 () Bool)

(assert (=> b!1036066 (= e!585946 (= (apply!907 lt!456924 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6104 lt!456791)))))

(declare-fun b!1036067 () Bool)

(declare-fun e!585936 () ListLongMap!13759)

(assert (=> b!1036067 (= e!585936 call!43834)))

(declare-fun b!1036068 () Bool)

(assert (=> b!1036068 (= e!585937 e!585940)))

(declare-fun res!691641 () Bool)

(assert (=> b!1036068 (=> (not res!691641) (not e!585940))))

(assert (=> b!1036068 (= res!691641 (contains!6021 lt!456924 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (=> b!1036068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(declare-fun c!104778 () Bool)

(declare-fun bm!43829 () Bool)

(assert (=> bm!43829 (= call!43829 (+!3105 (ite c!104781 call!43831 (ite c!104778 call!43832 call!43830)) (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))))))

(declare-fun bm!43830 () Bool)

(assert (=> bm!43830 (= call!43831 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) #b00000000000000000000000000000000 (defaultEntry!6270 lt!456791)))))

(declare-fun bm!43831 () Bool)

(assert (=> bm!43831 (= call!43830 call!43832)))

(declare-fun b!1036069 () Bool)

(assert (=> b!1036069 (= e!585943 e!585936)))

(assert (=> b!1036069 (= c!104778 (and (not (= (bvand (extraKeys!6000 lt!456791) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6000 lt!456791) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1036070 () Bool)

(assert (=> b!1036070 (= e!585941 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun b!1036071 () Bool)

(assert (=> b!1036071 (= e!585942 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun bm!43832 () Bool)

(assert (=> bm!43832 (= call!43834 call!43829)))

(declare-fun b!1036072 () Bool)

(declare-fun c!104779 () Bool)

(assert (=> b!1036072 (= c!104779 (and (not (= (bvand (extraKeys!6000 lt!456791) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6000 lt!456791) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1036072 (= e!585936 e!585935)))

(assert (= (and d!124589 c!104781) b!1036061))

(assert (= (and d!124589 (not c!104781)) b!1036069))

(assert (= (and b!1036069 c!104778) b!1036067))

(assert (= (and b!1036069 (not c!104778)) b!1036072))

(assert (= (and b!1036072 c!104779) b!1036054))

(assert (= (and b!1036072 (not c!104779)) b!1036059))

(assert (= (or b!1036054 b!1036059) bm!43831))

(assert (= (or b!1036067 bm!43831) bm!43828))

(assert (= (or b!1036067 b!1036054) bm!43832))

(assert (= (or b!1036061 bm!43828) bm!43830))

(assert (= (or b!1036061 bm!43832) bm!43829))

(assert (= (and d!124589 res!691645) b!1036070))

(assert (= (and d!124589 c!104776) b!1036062))

(assert (= (and d!124589 (not c!104776)) b!1036065))

(assert (= (and d!124589 res!691643) b!1036052))

(assert (= (and b!1036052 res!691647) b!1036071))

(assert (= (and b!1036052 (not res!691649)) b!1036068))

(assert (= (and b!1036068 res!691641) b!1036063))

(assert (= (and b!1036052 res!691646) b!1036058))

(assert (= (and b!1036058 c!104777) b!1036055))

(assert (= (and b!1036058 (not c!104777)) b!1036060))

(assert (= (and b!1036055 res!691644) b!1036066))

(assert (= (or b!1036055 b!1036060) bm!43826))

(assert (= (and b!1036058 res!691648) b!1036064))

(assert (= (and b!1036064 c!104780) b!1036053))

(assert (= (and b!1036064 (not c!104780)) b!1036057))

(assert (= (and b!1036053 res!691642) b!1036056))

(assert (= (or b!1036053 b!1036057) bm!43827))

(declare-fun b_lambda!16117 () Bool)

(assert (=> (not b_lambda!16117) (not b!1036063)))

(declare-fun tb!7035 () Bool)

(declare-fun t!31133 () Bool)

(assert (=> (and b!1035903 (= (defaultEntry!6270 thiss!1427) (defaultEntry!6270 lt!456791)) t!31133) tb!7035))

(declare-fun result!14431 () Bool)

(assert (=> tb!7035 (= result!14431 tp_is_empty!24597)))

(assert (=> b!1036063 t!31133))

(declare-fun b_and!33391 () Bool)

(assert (= b_and!33389 (and (=> t!31133 result!14431) b_and!33391)))

(declare-fun m!955835 () Bool)

(assert (=> bm!43830 m!955835))

(declare-fun m!955837 () Bool)

(assert (=> bm!43829 m!955837))

(declare-fun m!955839 () Bool)

(assert (=> b!1036056 m!955839))

(declare-fun m!955841 () Bool)

(assert (=> b!1036071 m!955841))

(assert (=> b!1036071 m!955841))

(declare-fun m!955843 () Bool)

(assert (=> b!1036071 m!955843))

(assert (=> b!1036070 m!955841))

(assert (=> b!1036070 m!955841))

(assert (=> b!1036070 m!955843))

(assert (=> b!1036063 m!955841))

(declare-fun m!955845 () Bool)

(assert (=> b!1036063 m!955845))

(assert (=> b!1036063 m!955841))

(declare-fun m!955847 () Bool)

(assert (=> b!1036063 m!955847))

(declare-fun m!955849 () Bool)

(assert (=> b!1036063 m!955849))

(assert (=> b!1036063 m!955849))

(assert (=> b!1036063 m!955845))

(declare-fun m!955851 () Bool)

(assert (=> b!1036063 m!955851))

(declare-fun m!955853 () Bool)

(assert (=> b!1036066 m!955853))

(declare-fun m!955855 () Bool)

(assert (=> bm!43827 m!955855))

(declare-fun m!955857 () Bool)

(assert (=> b!1036061 m!955857))

(declare-fun m!955859 () Bool)

(assert (=> b!1036062 m!955859))

(declare-fun m!955861 () Bool)

(assert (=> b!1036062 m!955861))

(assert (=> b!1036062 m!955841))

(declare-fun m!955863 () Bool)

(assert (=> b!1036062 m!955863))

(declare-fun m!955865 () Bool)

(assert (=> b!1036062 m!955865))

(assert (=> b!1036062 m!955863))

(declare-fun m!955867 () Bool)

(assert (=> b!1036062 m!955867))

(declare-fun m!955869 () Bool)

(assert (=> b!1036062 m!955869))

(declare-fun m!955871 () Bool)

(assert (=> b!1036062 m!955871))

(assert (=> b!1036062 m!955871))

(declare-fun m!955873 () Bool)

(assert (=> b!1036062 m!955873))

(declare-fun m!955875 () Bool)

(assert (=> b!1036062 m!955875))

(declare-fun m!955877 () Bool)

(assert (=> b!1036062 m!955877))

(declare-fun m!955879 () Bool)

(assert (=> b!1036062 m!955879))

(declare-fun m!955881 () Bool)

(assert (=> b!1036062 m!955881))

(assert (=> b!1036062 m!955835))

(assert (=> b!1036062 m!955867))

(assert (=> b!1036062 m!955879))

(declare-fun m!955883 () Bool)

(assert (=> b!1036062 m!955883))

(declare-fun m!955885 () Bool)

(assert (=> b!1036062 m!955885))

(declare-fun m!955887 () Bool)

(assert (=> b!1036062 m!955887))

(declare-fun m!955889 () Bool)

(assert (=> bm!43826 m!955889))

(assert (=> b!1036068 m!955841))

(assert (=> b!1036068 m!955841))

(declare-fun m!955891 () Bool)

(assert (=> b!1036068 m!955891))

(declare-fun m!955893 () Bool)

(assert (=> d!124589 m!955893))

(assert (=> d!124559 d!124589))

(declare-fun d!124591 () Bool)

(assert (=> d!124591 (= (-!522 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))

(assert (=> d!124591 true))

(declare-fun _$10!34 () Unit!33894)

(assert (=> d!124591 (= (choose!1702 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) lt!456792 (defaultEntry!6270 thiss!1427)) _$10!34)))

(declare-fun bs!30316 () Bool)

(assert (= bs!30316 d!124591))

(assert (=> bs!30316 m!955647))

(assert (=> bs!30316 m!955647))

(assert (=> bs!30316 m!955649))

(assert (=> bs!30316 m!955645))

(assert (=> d!124567 d!124591))

(assert (=> d!124567 d!124565))

(declare-fun d!124593 () Bool)

(assert (=> d!124593 (= (validMask!0 (mask!30171 thiss!1427)) (and (or (= (mask!30171 thiss!1427) #b00000000000000000000000000000111) (= (mask!30171 thiss!1427) #b00000000000000000000000000001111) (= (mask!30171 thiss!1427) #b00000000000000000000000000011111) (= (mask!30171 thiss!1427) #b00000000000000000000000000111111) (= (mask!30171 thiss!1427) #b00000000000000000000000001111111) (= (mask!30171 thiss!1427) #b00000000000000000000000011111111) (= (mask!30171 thiss!1427) #b00000000000000000000000111111111) (= (mask!30171 thiss!1427) #b00000000000000000000001111111111) (= (mask!30171 thiss!1427) #b00000000000000000000011111111111) (= (mask!30171 thiss!1427) #b00000000000000000000111111111111) (= (mask!30171 thiss!1427) #b00000000000000000001111111111111) (= (mask!30171 thiss!1427) #b00000000000000000011111111111111) (= (mask!30171 thiss!1427) #b00000000000000000111111111111111) (= (mask!30171 thiss!1427) #b00000000000000001111111111111111) (= (mask!30171 thiss!1427) #b00000000000000011111111111111111) (= (mask!30171 thiss!1427) #b00000000000000111111111111111111) (= (mask!30171 thiss!1427) #b00000000000001111111111111111111) (= (mask!30171 thiss!1427) #b00000000000011111111111111111111) (= (mask!30171 thiss!1427) #b00000000000111111111111111111111) (= (mask!30171 thiss!1427) #b00000000001111111111111111111111) (= (mask!30171 thiss!1427) #b00000000011111111111111111111111) (= (mask!30171 thiss!1427) #b00000000111111111111111111111111) (= (mask!30171 thiss!1427) #b00000001111111111111111111111111) (= (mask!30171 thiss!1427) #b00000011111111111111111111111111) (= (mask!30171 thiss!1427) #b00000111111111111111111111111111) (= (mask!30171 thiss!1427) #b00001111111111111111111111111111) (= (mask!30171 thiss!1427) #b00011111111111111111111111111111) (= (mask!30171 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30171 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!124567 d!124593))

(assert (=> d!124567 d!124569))

(assert (=> d!124567 d!124571))

(declare-fun b!1036097 () Bool)

(declare-fun e!585961 () Bool)

(declare-fun e!585963 () Bool)

(assert (=> b!1036097 (= e!585961 e!585963)))

(assert (=> b!1036097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun res!691659 () Bool)

(declare-fun lt!456950 () ListLongMap!13759)

(assert (=> b!1036097 (= res!691659 (contains!6021 lt!456950 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036097 (=> (not res!691659) (not e!585963))))

(declare-fun b!1036098 () Bool)

(assert (=> b!1036098 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> b!1036098 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31960 (_values!6293 thiss!1427))))))

(assert (=> b!1036098 (= e!585963 (= (apply!907 lt!456950 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036099 () Bool)

(declare-fun e!585964 () ListLongMap!13759)

(declare-fun call!43838 () ListLongMap!13759)

(assert (=> b!1036099 (= e!585964 call!43838)))

(declare-fun b!1036100 () Bool)

(declare-fun e!585967 () ListLongMap!13759)

(assert (=> b!1036100 (= e!585967 (ListLongMap!13760 Nil!21915))))

(declare-fun d!124595 () Bool)

(declare-fun e!585962 () Bool)

(assert (=> d!124595 e!585962))

(declare-fun res!691660 () Bool)

(assert (=> d!124595 (=> (not res!691660) (not e!585962))))

(assert (=> d!124595 (= res!691660 (not (contains!6021 lt!456950 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124595 (= lt!456950 e!585967)))

(declare-fun c!104790 () Bool)

(assert (=> d!124595 (= c!104790 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!124595 (validMask!0 (mask!30171 thiss!1427))))

(assert (=> d!124595 (= (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)) lt!456950)))

(declare-fun bm!43835 () Bool)

(assert (=> bm!43835 (= call!43838 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427)))))

(declare-fun e!585966 () Bool)

(declare-fun b!1036101 () Bool)

(assert (=> b!1036101 (= e!585966 (= lt!456950 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427))))))

(declare-fun b!1036102 () Bool)

(declare-fun e!585965 () Bool)

(assert (=> b!1036102 (= e!585965 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036102 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1036103 () Bool)

(assert (=> b!1036103 (= e!585961 e!585966)))

(declare-fun c!104791 () Bool)

(assert (=> b!1036103 (= c!104791 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036104 () Bool)

(assert (=> b!1036104 (= e!585962 e!585961)))

(declare-fun c!104793 () Bool)

(assert (=> b!1036104 (= c!104793 e!585965)))

(declare-fun res!691661 () Bool)

(assert (=> b!1036104 (=> (not res!691661) (not e!585965))))

(assert (=> b!1036104 (= res!691661 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036105 () Bool)

(declare-fun isEmpty!929 (ListLongMap!13759) Bool)

(assert (=> b!1036105 (= e!585966 (isEmpty!929 lt!456950))))

(declare-fun b!1036106 () Bool)

(declare-fun lt!456951 () Unit!33894)

(declare-fun lt!456948 () Unit!33894)

(assert (=> b!1036106 (= lt!456951 lt!456948)))

(declare-fun lt!456947 () V!37669)

(declare-fun lt!456946 () (_ BitVec 64))

(declare-fun lt!456949 () (_ BitVec 64))

(declare-fun lt!456945 () ListLongMap!13759)

(assert (=> b!1036106 (not (contains!6021 (+!3105 lt!456945 (tuple2!15731 lt!456949 lt!456947)) lt!456946))))

(declare-fun addStillNotContains!243 (ListLongMap!13759 (_ BitVec 64) V!37669 (_ BitVec 64)) Unit!33894)

(assert (=> b!1036106 (= lt!456948 (addStillNotContains!243 lt!456945 lt!456949 lt!456947 lt!456946))))

(assert (=> b!1036106 (= lt!456946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036106 (= lt!456947 (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036106 (= lt!456949 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036106 (= lt!456945 call!43838)))

(assert (=> b!1036106 (= e!585964 (+!3105 call!43838 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036107 () Bool)

(declare-fun res!691658 () Bool)

(assert (=> b!1036107 (=> (not res!691658) (not e!585962))))

(assert (=> b!1036107 (= res!691658 (not (contains!6021 lt!456950 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036108 () Bool)

(assert (=> b!1036108 (= e!585967 e!585964)))

(declare-fun c!104792 () Bool)

(assert (=> b!1036108 (= c!104792 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124595 c!104790) b!1036100))

(assert (= (and d!124595 (not c!104790)) b!1036108))

(assert (= (and b!1036108 c!104792) b!1036106))

(assert (= (and b!1036108 (not c!104792)) b!1036099))

(assert (= (or b!1036106 b!1036099) bm!43835))

(assert (= (and d!124595 res!691660) b!1036107))

(assert (= (and b!1036107 res!691658) b!1036104))

(assert (= (and b!1036104 res!691661) b!1036102))

(assert (= (and b!1036104 c!104793) b!1036097))

(assert (= (and b!1036104 (not c!104793)) b!1036103))

(assert (= (and b!1036097 res!691659) b!1036098))

(assert (= (and b!1036103 c!104791) b!1036101))

(assert (= (and b!1036103 (not c!104791)) b!1036105))

(declare-fun b_lambda!16119 () Bool)

(assert (=> (not b_lambda!16119) (not b!1036098)))

(assert (=> b!1036098 t!31130))

(declare-fun b_and!33393 () Bool)

(assert (= b_and!33391 (and (=> t!31130 result!14427) b_and!33393)))

(declare-fun b_lambda!16121 () Bool)

(assert (=> (not b_lambda!16121) (not b!1036106)))

(assert (=> b!1036106 t!31130))

(declare-fun b_and!33395 () Bool)

(assert (= b_and!33393 (and (=> t!31130 result!14427) b_and!33395)))

(declare-fun m!955895 () Bool)

(assert (=> b!1036105 m!955895))

(assert (=> b!1036102 m!955693))

(assert (=> b!1036102 m!955693))

(assert (=> b!1036102 m!955695))

(assert (=> b!1036097 m!955693))

(assert (=> b!1036097 m!955693))

(declare-fun m!955897 () Bool)

(assert (=> b!1036097 m!955897))

(declare-fun m!955899 () Bool)

(assert (=> b!1036107 m!955899))

(declare-fun m!955901 () Bool)

(assert (=> bm!43835 m!955901))

(assert (=> b!1036108 m!955693))

(assert (=> b!1036108 m!955693))

(assert (=> b!1036108 m!955695))

(declare-fun m!955903 () Bool)

(assert (=> b!1036106 m!955903))

(assert (=> b!1036106 m!955701))

(assert (=> b!1036106 m!955697))

(assert (=> b!1036106 m!955703))

(assert (=> b!1036106 m!955701))

(assert (=> b!1036106 m!955697))

(assert (=> b!1036106 m!955693))

(declare-fun m!955905 () Bool)

(assert (=> b!1036106 m!955905))

(declare-fun m!955907 () Bool)

(assert (=> b!1036106 m!955907))

(assert (=> b!1036106 m!955903))

(declare-fun m!955909 () Bool)

(assert (=> b!1036106 m!955909))

(declare-fun m!955911 () Bool)

(assert (=> d!124595 m!955911))

(assert (=> d!124595 m!955745))

(assert (=> b!1036101 m!955901))

(assert (=> b!1036098 m!955693))

(declare-fun m!955913 () Bool)

(assert (=> b!1036098 m!955913))

(assert (=> b!1036098 m!955701))

(assert (=> b!1036098 m!955697))

(assert (=> b!1036098 m!955703))

(assert (=> b!1036098 m!955701))

(assert (=> b!1036098 m!955697))

(assert (=> b!1036098 m!955693))

(assert (=> bm!43823 d!124595))

(declare-fun d!124597 () Bool)

(assert (=> d!124597 (= (apply!907 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) lt!456865) (apply!907 lt!456851 lt!456865))))

(declare-fun lt!456954 () Unit!33894)

(declare-fun choose!1703 (ListLongMap!13759 (_ BitVec 64) V!37669 (_ BitVec 64)) Unit!33894)

(assert (=> d!124597 (= lt!456954 (choose!1703 lt!456851 lt!456862 (zeroValue!6104 thiss!1427) lt!456865))))

(declare-fun e!585970 () Bool)

(assert (=> d!124597 e!585970))

(declare-fun res!691664 () Bool)

(assert (=> d!124597 (=> (not res!691664) (not e!585970))))

(assert (=> d!124597 (= res!691664 (contains!6021 lt!456851 lt!456865))))

(assert (=> d!124597 (= (addApplyDifferent!486 lt!456851 lt!456862 (zeroValue!6104 thiss!1427) lt!456865) lt!456954)))

(declare-fun b!1036112 () Bool)

(assert (=> b!1036112 (= e!585970 (not (= lt!456865 lt!456862)))))

(assert (= (and d!124597 res!691664) b!1036112))

(assert (=> d!124597 m!955719))

(assert (=> d!124597 m!955721))

(declare-fun m!955915 () Bool)

(assert (=> d!124597 m!955915))

(assert (=> d!124597 m!955719))

(declare-fun m!955917 () Bool)

(assert (=> d!124597 m!955917))

(assert (=> d!124597 m!955733))

(assert (=> b!1035985 d!124597))

(declare-fun b!1036113 () Bool)

(declare-fun e!585971 () Bool)

(declare-fun e!585973 () Bool)

(assert (=> b!1036113 (= e!585971 e!585973)))

(assert (=> b!1036113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun res!691666 () Bool)

(declare-fun lt!456960 () ListLongMap!13759)

(assert (=> b!1036113 (= res!691666 (contains!6021 lt!456960 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036113 (=> (not res!691666) (not e!585973))))

(declare-fun b!1036114 () Bool)

(assert (=> b!1036114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> b!1036114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31960 (_values!6293 thiss!1427))))))

(assert (=> b!1036114 (= e!585973 (= (apply!907 lt!456960 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036115 () Bool)

(declare-fun e!585974 () ListLongMap!13759)

(declare-fun call!43839 () ListLongMap!13759)

(assert (=> b!1036115 (= e!585974 call!43839)))

(declare-fun b!1036116 () Bool)

(declare-fun e!585977 () ListLongMap!13759)

(assert (=> b!1036116 (= e!585977 (ListLongMap!13760 Nil!21915))))

(declare-fun d!124599 () Bool)

(declare-fun e!585972 () Bool)

(assert (=> d!124599 e!585972))

(declare-fun res!691667 () Bool)

(assert (=> d!124599 (=> (not res!691667) (not e!585972))))

(assert (=> d!124599 (= res!691667 (not (contains!6021 lt!456960 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124599 (= lt!456960 e!585977)))

(declare-fun c!104794 () Bool)

(assert (=> d!124599 (= c!104794 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!124599 (validMask!0 (mask!30171 thiss!1427))))

(assert (=> d!124599 (= (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)) lt!456960)))

(declare-fun bm!43836 () Bool)

(assert (=> bm!43836 (= call!43839 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427)))))

(declare-fun b!1036117 () Bool)

(declare-fun e!585976 () Bool)

(assert (=> b!1036117 (= e!585976 (= lt!456960 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427))))))

(declare-fun b!1036118 () Bool)

(declare-fun e!585975 () Bool)

(assert (=> b!1036118 (= e!585975 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036118 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1036119 () Bool)

(assert (=> b!1036119 (= e!585971 e!585976)))

(declare-fun c!104795 () Bool)

(assert (=> b!1036119 (= c!104795 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036120 () Bool)

(assert (=> b!1036120 (= e!585972 e!585971)))

(declare-fun c!104797 () Bool)

(assert (=> b!1036120 (= c!104797 e!585975)))

(declare-fun res!691668 () Bool)

(assert (=> b!1036120 (=> (not res!691668) (not e!585975))))

(assert (=> b!1036120 (= res!691668 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036121 () Bool)

(assert (=> b!1036121 (= e!585976 (isEmpty!929 lt!456960))))

(declare-fun b!1036122 () Bool)

(declare-fun lt!456961 () Unit!33894)

(declare-fun lt!456958 () Unit!33894)

(assert (=> b!1036122 (= lt!456961 lt!456958)))

(declare-fun lt!456957 () V!37669)

(declare-fun lt!456959 () (_ BitVec 64))

(declare-fun lt!456956 () (_ BitVec 64))

(declare-fun lt!456955 () ListLongMap!13759)

(assert (=> b!1036122 (not (contains!6021 (+!3105 lt!456955 (tuple2!15731 lt!456959 lt!456957)) lt!456956))))

(assert (=> b!1036122 (= lt!456958 (addStillNotContains!243 lt!456955 lt!456959 lt!456957 lt!456956))))

(assert (=> b!1036122 (= lt!456956 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036122 (= lt!456957 (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036122 (= lt!456959 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036122 (= lt!456955 call!43839)))

(assert (=> b!1036122 (= e!585974 (+!3105 call!43839 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036123 () Bool)

(declare-fun res!691665 () Bool)

(assert (=> b!1036123 (=> (not res!691665) (not e!585972))))

(assert (=> b!1036123 (= res!691665 (not (contains!6021 lt!456960 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036124 () Bool)

(assert (=> b!1036124 (= e!585977 e!585974)))

(declare-fun c!104796 () Bool)

(assert (=> b!1036124 (= c!104796 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124599 c!104794) b!1036116))

(assert (= (and d!124599 (not c!104794)) b!1036124))

(assert (= (and b!1036124 c!104796) b!1036122))

(assert (= (and b!1036124 (not c!104796)) b!1036115))

(assert (= (or b!1036122 b!1036115) bm!43836))

(assert (= (and d!124599 res!691667) b!1036123))

(assert (= (and b!1036123 res!691665) b!1036120))

(assert (= (and b!1036120 res!691668) b!1036118))

(assert (= (and b!1036120 c!104797) b!1036113))

(assert (= (and b!1036120 (not c!104797)) b!1036119))

(assert (= (and b!1036113 res!691666) b!1036114))

(assert (= (and b!1036119 c!104795) b!1036117))

(assert (= (and b!1036119 (not c!104795)) b!1036121))

(declare-fun b_lambda!16123 () Bool)

(assert (=> (not b_lambda!16123) (not b!1036114)))

(assert (=> b!1036114 t!31130))

(declare-fun b_and!33397 () Bool)

(assert (= b_and!33395 (and (=> t!31130 result!14427) b_and!33397)))

(declare-fun b_lambda!16125 () Bool)

(assert (=> (not b_lambda!16125) (not b!1036122)))

(assert (=> b!1036122 t!31130))

(declare-fun b_and!33399 () Bool)

(assert (= b_and!33397 (and (=> t!31130 result!14427) b_and!33399)))

(declare-fun m!955919 () Bool)

(assert (=> b!1036121 m!955919))

(assert (=> b!1036118 m!955693))

(assert (=> b!1036118 m!955693))

(assert (=> b!1036118 m!955695))

(assert (=> b!1036113 m!955693))

(assert (=> b!1036113 m!955693))

(declare-fun m!955921 () Bool)

(assert (=> b!1036113 m!955921))

(declare-fun m!955923 () Bool)

(assert (=> b!1036123 m!955923))

(declare-fun m!955925 () Bool)

(assert (=> bm!43836 m!955925))

(assert (=> b!1036124 m!955693))

(assert (=> b!1036124 m!955693))

(assert (=> b!1036124 m!955695))

(declare-fun m!955927 () Bool)

(assert (=> b!1036122 m!955927))

(assert (=> b!1036122 m!955701))

(assert (=> b!1036122 m!955697))

(assert (=> b!1036122 m!955703))

(assert (=> b!1036122 m!955701))

(assert (=> b!1036122 m!955697))

(assert (=> b!1036122 m!955693))

(declare-fun m!955929 () Bool)

(assert (=> b!1036122 m!955929))

(declare-fun m!955931 () Bool)

(assert (=> b!1036122 m!955931))

(assert (=> b!1036122 m!955927))

(declare-fun m!955933 () Bool)

(assert (=> b!1036122 m!955933))

(declare-fun m!955935 () Bool)

(assert (=> d!124599 m!955935))

(assert (=> d!124599 m!955745))

(assert (=> b!1036117 m!955925))

(assert (=> b!1036114 m!955693))

(declare-fun m!955937 () Bool)

(assert (=> b!1036114 m!955937))

(assert (=> b!1036114 m!955701))

(assert (=> b!1036114 m!955697))

(assert (=> b!1036114 m!955703))

(assert (=> b!1036114 m!955701))

(assert (=> b!1036114 m!955697))

(assert (=> b!1036114 m!955693))

(assert (=> b!1035985 d!124599))

(declare-fun d!124601 () Bool)

(declare-fun e!585980 () Bool)

(assert (=> d!124601 e!585980))

(declare-fun res!691673 () Bool)

(assert (=> d!124601 (=> (not res!691673) (not e!585980))))

(declare-fun lt!456972 () ListLongMap!13759)

(assert (=> d!124601 (= res!691673 (contains!6021 lt!456972 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun lt!456971 () List!21918)

(assert (=> d!124601 (= lt!456972 (ListLongMap!13760 lt!456971))))

(declare-fun lt!456970 () Unit!33894)

(declare-fun lt!456973 () Unit!33894)

(assert (=> d!124601 (= lt!456970 lt!456973)))

(assert (=> d!124601 (= (getValueByKey!589 lt!456971 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!280 (List!21918 (_ BitVec 64) V!37669) Unit!33894)

(assert (=> d!124601 (= lt!456973 (lemmaContainsTupThenGetReturnValue!280 lt!456971 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun insertStrictlySorted!373 (List!21918 (_ BitVec 64) V!37669) List!21918)

(assert (=> d!124601 (= lt!456971 (insertStrictlySorted!373 (toList!6895 lt!456855) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(assert (=> d!124601 (= (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) lt!456972)))

(declare-fun b!1036129 () Bool)

(declare-fun res!691674 () Bool)

(assert (=> b!1036129 (=> (not res!691674) (not e!585980))))

(assert (=> b!1036129 (= res!691674 (= (getValueByKey!589 (toList!6895 lt!456972) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036130 () Bool)

(declare-fun contains!6022 (List!21918 tuple2!15730) Bool)

(assert (=> b!1036130 (= e!585980 (contains!6022 (toList!6895 lt!456972) (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))

(assert (= (and d!124601 res!691673) b!1036129))

(assert (= (and b!1036129 res!691674) b!1036130))

(declare-fun m!955939 () Bool)

(assert (=> d!124601 m!955939))

(declare-fun m!955941 () Bool)

(assert (=> d!124601 m!955941))

(declare-fun m!955943 () Bool)

(assert (=> d!124601 m!955943))

(declare-fun m!955945 () Bool)

(assert (=> d!124601 m!955945))

(declare-fun m!955947 () Bool)

(assert (=> b!1036129 m!955947))

(declare-fun m!955949 () Bool)

(assert (=> b!1036130 m!955949))

(assert (=> b!1035985 d!124601))

(declare-fun d!124603 () Bool)

(assert (=> d!124603 (= (apply!907 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) lt!456866) (apply!907 lt!456855 lt!456866))))

(declare-fun lt!456974 () Unit!33894)

(assert (=> d!124603 (= lt!456974 (choose!1703 lt!456855 lt!456852 (minValue!6106 thiss!1427) lt!456866))))

(declare-fun e!585981 () Bool)

(assert (=> d!124603 e!585981))

(declare-fun res!691675 () Bool)

(assert (=> d!124603 (=> (not res!691675) (not e!585981))))

(assert (=> d!124603 (= res!691675 (contains!6021 lt!456855 lt!456866))))

(assert (=> d!124603 (= (addApplyDifferent!486 lt!456855 lt!456852 (minValue!6106 thiss!1427) lt!456866) lt!456974)))

(declare-fun b!1036131 () Bool)

(assert (=> b!1036131 (= e!585981 (not (= lt!456866 lt!456852)))))

(assert (= (and d!124603 res!691675) b!1036131))

(assert (=> d!124603 m!955731))

(assert (=> d!124603 m!955735))

(declare-fun m!955951 () Bool)

(assert (=> d!124603 m!955951))

(assert (=> d!124603 m!955731))

(declare-fun m!955953 () Bool)

(assert (=> d!124603 m!955953))

(assert (=> d!124603 m!955737))

(assert (=> b!1035985 d!124603))

(declare-fun d!124605 () Bool)

(assert (=> d!124605 (= (apply!907 lt!456854 lt!456868) (get!16464 (getValueByKey!589 (toList!6895 lt!456854) lt!456868)))))

(declare-fun bs!30317 () Bool)

(assert (= bs!30317 d!124605))

(declare-fun m!955955 () Bool)

(assert (=> bs!30317 m!955955))

(assert (=> bs!30317 m!955955))

(declare-fun m!955957 () Bool)

(assert (=> bs!30317 m!955957))

(assert (=> b!1035985 d!124605))

(declare-fun d!124607 () Bool)

(declare-fun e!585982 () Bool)

(assert (=> d!124607 e!585982))

(declare-fun res!691676 () Bool)

(assert (=> d!124607 (=> (not res!691676) (not e!585982))))

(declare-fun lt!456977 () ListLongMap!13759)

(assert (=> d!124607 (= res!691676 (contains!6021 lt!456977 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun lt!456976 () List!21918)

(assert (=> d!124607 (= lt!456977 (ListLongMap!13760 lt!456976))))

(declare-fun lt!456975 () Unit!33894)

(declare-fun lt!456978 () Unit!33894)

(assert (=> d!124607 (= lt!456975 lt!456978)))

(assert (=> d!124607 (= (getValueByKey!589 lt!456976 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(assert (=> d!124607 (= lt!456978 (lemmaContainsTupThenGetReturnValue!280 lt!456976 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(assert (=> d!124607 (= lt!456976 (insertStrictlySorted!373 (toList!6895 lt!456854) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(assert (=> d!124607 (= (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) lt!456977)))

(declare-fun b!1036132 () Bool)

(declare-fun res!691677 () Bool)

(assert (=> b!1036132 (=> (not res!691677) (not e!585982))))

(assert (=> b!1036132 (= res!691677 (= (getValueByKey!589 (toList!6895 lt!456977) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036133 () Bool)

(assert (=> b!1036133 (= e!585982 (contains!6022 (toList!6895 lt!456977) (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))

(assert (= (and d!124607 res!691676) b!1036132))

(assert (= (and b!1036132 res!691677) b!1036133))

(declare-fun m!955959 () Bool)

(assert (=> d!124607 m!955959))

(declare-fun m!955961 () Bool)

(assert (=> d!124607 m!955961))

(declare-fun m!955963 () Bool)

(assert (=> d!124607 m!955963))

(declare-fun m!955965 () Bool)

(assert (=> d!124607 m!955965))

(declare-fun m!955967 () Bool)

(assert (=> b!1036132 m!955967))

(declare-fun m!955969 () Bool)

(assert (=> b!1036133 m!955969))

(assert (=> b!1035985 d!124607))

(declare-fun d!124609 () Bool)

(declare-fun e!585983 () Bool)

(assert (=> d!124609 e!585983))

(declare-fun res!691678 () Bool)

(assert (=> d!124609 (=> res!691678 e!585983)))

(declare-fun lt!456980 () Bool)

(assert (=> d!124609 (= res!691678 (not lt!456980))))

(declare-fun lt!456982 () Bool)

(assert (=> d!124609 (= lt!456980 lt!456982)))

(declare-fun lt!456979 () Unit!33894)

(declare-fun e!585984 () Unit!33894)

(assert (=> d!124609 (= lt!456979 e!585984)))

(declare-fun c!104798 () Bool)

(assert (=> d!124609 (= c!104798 lt!456982)))

(assert (=> d!124609 (= lt!456982 (containsKey!564 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869))))

(assert (=> d!124609 (= (contains!6021 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) lt!456869) lt!456980)))

(declare-fun b!1036134 () Bool)

(declare-fun lt!456981 () Unit!33894)

(assert (=> b!1036134 (= e!585984 lt!456981)))

(assert (=> b!1036134 (= lt!456981 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869))))

(assert (=> b!1036134 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869))))

(declare-fun b!1036135 () Bool)

(declare-fun Unit!33902 () Unit!33894)

(assert (=> b!1036135 (= e!585984 Unit!33902)))

(declare-fun b!1036136 () Bool)

(assert (=> b!1036136 (= e!585983 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869)))))

(assert (= (and d!124609 c!104798) b!1036134))

(assert (= (and d!124609 (not c!104798)) b!1036135))

(assert (= (and d!124609 (not res!691678)) b!1036136))

(declare-fun m!955971 () Bool)

(assert (=> d!124609 m!955971))

(declare-fun m!955973 () Bool)

(assert (=> b!1036134 m!955973))

(declare-fun m!955975 () Bool)

(assert (=> b!1036134 m!955975))

(assert (=> b!1036134 m!955975))

(declare-fun m!955977 () Bool)

(assert (=> b!1036134 m!955977))

(assert (=> b!1036136 m!955975))

(assert (=> b!1036136 m!955975))

(assert (=> b!1036136 m!955977))

(assert (=> b!1035985 d!124609))

(declare-fun d!124611 () Bool)

(assert (=> d!124611 (= (apply!907 lt!456855 lt!456866) (get!16464 (getValueByKey!589 (toList!6895 lt!456855) lt!456866)))))

(declare-fun bs!30318 () Bool)

(assert (= bs!30318 d!124611))

(declare-fun m!955979 () Bool)

(assert (=> bs!30318 m!955979))

(assert (=> bs!30318 m!955979))

(declare-fun m!955981 () Bool)

(assert (=> bs!30318 m!955981))

(assert (=> b!1035985 d!124611))

(declare-fun d!124613 () Bool)

(assert (=> d!124613 (contains!6021 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) lt!456869)))

(declare-fun lt!456985 () Unit!33894)

(declare-fun choose!1704 (ListLongMap!13759 (_ BitVec 64) V!37669 (_ BitVec 64)) Unit!33894)

(assert (=> d!124613 (= lt!456985 (choose!1704 lt!456860 lt!456857 (zeroValue!6104 thiss!1427) lt!456869))))

(assert (=> d!124613 (contains!6021 lt!456860 lt!456869)))

(assert (=> d!124613 (= (addStillContains!626 lt!456860 lt!456857 (zeroValue!6104 thiss!1427) lt!456869) lt!456985)))

(declare-fun bs!30319 () Bool)

(assert (= bs!30319 d!124613))

(assert (=> bs!30319 m!955715))

(assert (=> bs!30319 m!955715))

(assert (=> bs!30319 m!955717))

(declare-fun m!955983 () Bool)

(assert (=> bs!30319 m!955983))

(declare-fun m!955985 () Bool)

(assert (=> bs!30319 m!955985))

(assert (=> b!1035985 d!124613))

(declare-fun d!124615 () Bool)

(assert (=> d!124615 (= (apply!907 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) lt!456868) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) lt!456868)))))

(declare-fun bs!30320 () Bool)

(assert (= bs!30320 d!124615))

(declare-fun m!955987 () Bool)

(assert (=> bs!30320 m!955987))

(assert (=> bs!30320 m!955987))

(declare-fun m!955989 () Bool)

(assert (=> bs!30320 m!955989))

(assert (=> b!1035985 d!124615))

(declare-fun d!124617 () Bool)

(assert (=> d!124617 (= (apply!907 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) lt!456866) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) lt!456866)))))

(declare-fun bs!30321 () Bool)

(assert (= bs!30321 d!124617))

(declare-fun m!955991 () Bool)

(assert (=> bs!30321 m!955991))

(assert (=> bs!30321 m!955991))

(declare-fun m!955993 () Bool)

(assert (=> bs!30321 m!955993))

(assert (=> b!1035985 d!124617))

(declare-fun d!124619 () Bool)

(assert (=> d!124619 (= (apply!907 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) lt!456865) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) lt!456865)))))

(declare-fun bs!30322 () Bool)

(assert (= bs!30322 d!124619))

(declare-fun m!955995 () Bool)

(assert (=> bs!30322 m!955995))

(assert (=> bs!30322 m!955995))

(declare-fun m!955997 () Bool)

(assert (=> bs!30322 m!955997))

(assert (=> b!1035985 d!124619))

(declare-fun d!124621 () Bool)

(assert (=> d!124621 (= (apply!907 lt!456851 lt!456865) (get!16464 (getValueByKey!589 (toList!6895 lt!456851) lt!456865)))))

(declare-fun bs!30323 () Bool)

(assert (= bs!30323 d!124621))

(declare-fun m!955999 () Bool)

(assert (=> bs!30323 m!955999))

(assert (=> bs!30323 m!955999))

(declare-fun m!956001 () Bool)

(assert (=> bs!30323 m!956001))

(assert (=> b!1035985 d!124621))

(declare-fun d!124623 () Bool)

(assert (=> d!124623 (= (apply!907 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) lt!456868) (apply!907 lt!456854 lt!456868))))

(declare-fun lt!456986 () Unit!33894)

(assert (=> d!124623 (= lt!456986 (choose!1703 lt!456854 lt!456849 (minValue!6106 thiss!1427) lt!456868))))

(declare-fun e!585985 () Bool)

(assert (=> d!124623 e!585985))

(declare-fun res!691679 () Bool)

(assert (=> d!124623 (=> (not res!691679) (not e!585985))))

(assert (=> d!124623 (= res!691679 (contains!6021 lt!456854 lt!456868))))

(assert (=> d!124623 (= (addApplyDifferent!486 lt!456854 lt!456849 (minValue!6106 thiss!1427) lt!456868) lt!456986)))

(declare-fun b!1036138 () Bool)

(assert (=> b!1036138 (= e!585985 (not (= lt!456868 lt!456849)))))

(assert (= (and d!124623 res!691679) b!1036138))

(assert (=> d!124623 m!955723))

(assert (=> d!124623 m!955725))

(declare-fun m!956003 () Bool)

(assert (=> d!124623 m!956003))

(assert (=> d!124623 m!955723))

(declare-fun m!956005 () Bool)

(assert (=> d!124623 m!956005))

(assert (=> d!124623 m!955711))

(assert (=> b!1035985 d!124623))

(declare-fun d!124625 () Bool)

(declare-fun e!585986 () Bool)

(assert (=> d!124625 e!585986))

(declare-fun res!691680 () Bool)

(assert (=> d!124625 (=> (not res!691680) (not e!585986))))

(declare-fun lt!456989 () ListLongMap!13759)

(assert (=> d!124625 (= res!691680 (contains!6021 lt!456989 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun lt!456988 () List!21918)

(assert (=> d!124625 (= lt!456989 (ListLongMap!13760 lt!456988))))

(declare-fun lt!456987 () Unit!33894)

(declare-fun lt!456990 () Unit!33894)

(assert (=> d!124625 (= lt!456987 lt!456990)))

(assert (=> d!124625 (= (getValueByKey!589 lt!456988 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124625 (= lt!456990 (lemmaContainsTupThenGetReturnValue!280 lt!456988 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124625 (= lt!456988 (insertStrictlySorted!373 (toList!6895 lt!456851) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124625 (= (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) lt!456989)))

(declare-fun b!1036139 () Bool)

(declare-fun res!691681 () Bool)

(assert (=> b!1036139 (=> (not res!691681) (not e!585986))))

(assert (=> b!1036139 (= res!691681 (= (getValueByKey!589 (toList!6895 lt!456989) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(declare-fun b!1036140 () Bool)

(assert (=> b!1036140 (= e!585986 (contains!6022 (toList!6895 lt!456989) (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))

(assert (= (and d!124625 res!691680) b!1036139))

(assert (= (and b!1036139 res!691681) b!1036140))

(declare-fun m!956007 () Bool)

(assert (=> d!124625 m!956007))

(declare-fun m!956009 () Bool)

(assert (=> d!124625 m!956009))

(declare-fun m!956011 () Bool)

(assert (=> d!124625 m!956011))

(declare-fun m!956013 () Bool)

(assert (=> d!124625 m!956013))

(declare-fun m!956015 () Bool)

(assert (=> b!1036139 m!956015))

(declare-fun m!956017 () Bool)

(assert (=> b!1036140 m!956017))

(assert (=> b!1035985 d!124625))

(declare-fun d!124627 () Bool)

(declare-fun e!585987 () Bool)

(assert (=> d!124627 e!585987))

(declare-fun res!691682 () Bool)

(assert (=> d!124627 (=> (not res!691682) (not e!585987))))

(declare-fun lt!456993 () ListLongMap!13759)

(assert (=> d!124627 (= res!691682 (contains!6021 lt!456993 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun lt!456992 () List!21918)

(assert (=> d!124627 (= lt!456993 (ListLongMap!13760 lt!456992))))

(declare-fun lt!456991 () Unit!33894)

(declare-fun lt!456994 () Unit!33894)

(assert (=> d!124627 (= lt!456991 lt!456994)))

(assert (=> d!124627 (= (getValueByKey!589 lt!456992 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124627 (= lt!456994 (lemmaContainsTupThenGetReturnValue!280 lt!456992 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124627 (= lt!456992 (insertStrictlySorted!373 (toList!6895 lt!456860) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124627 (= (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) lt!456993)))

(declare-fun b!1036141 () Bool)

(declare-fun res!691683 () Bool)

(assert (=> b!1036141 (=> (not res!691683) (not e!585987))))

(assert (=> b!1036141 (= res!691683 (= (getValueByKey!589 (toList!6895 lt!456993) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(declare-fun b!1036142 () Bool)

(assert (=> b!1036142 (= e!585987 (contains!6022 (toList!6895 lt!456993) (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))

(assert (= (and d!124627 res!691682) b!1036141))

(assert (= (and b!1036141 res!691683) b!1036142))

(declare-fun m!956019 () Bool)

(assert (=> d!124627 m!956019))

(declare-fun m!956021 () Bool)

(assert (=> d!124627 m!956021))

(declare-fun m!956023 () Bool)

(assert (=> d!124627 m!956023))

(declare-fun m!956025 () Bool)

(assert (=> d!124627 m!956025))

(declare-fun m!956027 () Bool)

(assert (=> b!1036141 m!956027))

(declare-fun m!956029 () Bool)

(assert (=> b!1036142 m!956029))

(assert (=> b!1035985 d!124627))

(declare-fun d!124629 () Bool)

(declare-fun e!585988 () Bool)

(assert (=> d!124629 e!585988))

(declare-fun res!691684 () Bool)

(assert (=> d!124629 (=> (not res!691684) (not e!585988))))

(declare-fun lt!456997 () ListLongMap!13759)

(assert (=> d!124629 (= res!691684 (contains!6021 lt!456997 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun lt!456996 () List!21918)

(assert (=> d!124629 (= lt!456997 (ListLongMap!13760 lt!456996))))

(declare-fun lt!456995 () Unit!33894)

(declare-fun lt!456998 () Unit!33894)

(assert (=> d!124629 (= lt!456995 lt!456998)))

(assert (=> d!124629 (= (getValueByKey!589 lt!456996 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))) (Some!639 (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> d!124629 (= lt!456998 (lemmaContainsTupThenGetReturnValue!280 lt!456996 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> d!124629 (= lt!456996 (insertStrictlySorted!373 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823))) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> d!124629 (= (+!3105 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)) (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) lt!456997)))

(declare-fun b!1036143 () Bool)

(declare-fun res!691685 () Bool)

(assert (=> b!1036143 (=> (not res!691685) (not e!585988))))

(assert (=> b!1036143 (= res!691685 (= (getValueByKey!589 (toList!6895 lt!456997) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))) (Some!639 (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(declare-fun b!1036144 () Bool)

(assert (=> b!1036144 (= e!585988 (contains!6022 (toList!6895 lt!456997) (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(assert (= (and d!124629 res!691684) b!1036143))

(assert (= (and b!1036143 res!691685) b!1036144))

(declare-fun m!956031 () Bool)

(assert (=> d!124629 m!956031))

(declare-fun m!956033 () Bool)

(assert (=> d!124629 m!956033))

(declare-fun m!956035 () Bool)

(assert (=> d!124629 m!956035))

(declare-fun m!956037 () Bool)

(assert (=> d!124629 m!956037))

(declare-fun m!956039 () Bool)

(assert (=> b!1036143 m!956039))

(declare-fun m!956041 () Bool)

(assert (=> b!1036144 m!956041))

(assert (=> bm!43822 d!124629))

(declare-fun d!124631 () Bool)

(declare-fun e!585989 () Bool)

(assert (=> d!124631 e!585989))

(declare-fun res!691686 () Bool)

(assert (=> d!124631 (=> (not res!691686) (not e!585989))))

(declare-fun lt!457001 () ListLongMap!13759)

(assert (=> d!124631 (= res!691686 (contains!6021 lt!457001 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun lt!457000 () List!21918)

(assert (=> d!124631 (= lt!457001 (ListLongMap!13760 lt!457000))))

(declare-fun lt!456999 () Unit!33894)

(declare-fun lt!457002 () Unit!33894)

(assert (=> d!124631 (= lt!456999 lt!457002)))

(assert (=> d!124631 (= (getValueByKey!589 lt!457000 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(assert (=> d!124631 (= lt!457002 (lemmaContainsTupThenGetReturnValue!280 lt!457000 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(assert (=> d!124631 (= lt!457000 (insertStrictlySorted!373 (toList!6895 call!43815) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(assert (=> d!124631 (= (+!3105 call!43815 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) lt!457001)))

(declare-fun b!1036145 () Bool)

(declare-fun res!691687 () Bool)

(assert (=> b!1036145 (=> (not res!691687) (not e!585989))))

(assert (=> b!1036145 (= res!691687 (= (getValueByKey!589 (toList!6895 lt!457001) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036146 () Bool)

(assert (=> b!1036146 (= e!585989 (contains!6022 (toList!6895 lt!457001) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))

(assert (= (and d!124631 res!691686) b!1036145))

(assert (= (and b!1036145 res!691687) b!1036146))

(declare-fun m!956043 () Bool)

(assert (=> d!124631 m!956043))

(declare-fun m!956045 () Bool)

(assert (=> d!124631 m!956045))

(declare-fun m!956047 () Bool)

(assert (=> d!124631 m!956047))

(declare-fun m!956049 () Bool)

(assert (=> d!124631 m!956049))

(declare-fun m!956051 () Bool)

(assert (=> b!1036145 m!956051))

(declare-fun m!956053 () Bool)

(assert (=> b!1036146 m!956053))

(assert (=> b!1035984 d!124631))

(declare-fun d!124633 () Bool)

(declare-fun e!585990 () Bool)

(assert (=> d!124633 e!585990))

(declare-fun res!691688 () Bool)

(assert (=> d!124633 (=> res!691688 e!585990)))

(declare-fun lt!457004 () Bool)

(assert (=> d!124633 (= res!691688 (not lt!457004))))

(declare-fun lt!457006 () Bool)

(assert (=> d!124633 (= lt!457004 lt!457006)))

(declare-fun lt!457003 () Unit!33894)

(declare-fun e!585991 () Unit!33894)

(assert (=> d!124633 (= lt!457003 e!585991)))

(declare-fun c!104799 () Bool)

(assert (=> d!124633 (= c!104799 lt!457006)))

(assert (=> d!124633 (= lt!457006 (containsKey!564 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124633 (= (contains!6021 lt!456874 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457004)))

(declare-fun b!1036147 () Bool)

(declare-fun lt!457005 () Unit!33894)

(assert (=> b!1036147 (= e!585991 lt!457005)))

(assert (=> b!1036147 (= lt!457005 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036147 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036148 () Bool)

(declare-fun Unit!33903 () Unit!33894)

(assert (=> b!1036148 (= e!585991 Unit!33903)))

(declare-fun b!1036149 () Bool)

(assert (=> b!1036149 (= e!585990 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124633 c!104799) b!1036147))

(assert (= (and d!124633 (not c!104799)) b!1036148))

(assert (= (and d!124633 (not res!691688)) b!1036149))

(declare-fun m!956055 () Bool)

(assert (=> d!124633 m!956055))

(declare-fun m!956057 () Bool)

(assert (=> b!1036147 m!956057))

(declare-fun m!956059 () Bool)

(assert (=> b!1036147 m!956059))

(assert (=> b!1036147 m!956059))

(declare-fun m!956061 () Bool)

(assert (=> b!1036147 m!956061))

(assert (=> b!1036149 m!956059))

(assert (=> b!1036149 m!956059))

(assert (=> b!1036149 m!956061))

(assert (=> d!124569 d!124633))

(declare-fun b!1036160 () Bool)

(declare-fun e!585998 () List!21918)

(declare-fun $colon$colon!603 (List!21918 tuple2!15730) List!21918)

(assert (=> b!1036160 (= e!585998 ($colon$colon!603 (removeStrictlySorted!57 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23116 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))))))

(declare-fun b!1036161 () Bool)

(declare-fun e!585999 () Bool)

(declare-fun lt!457009 () List!21918)

(assert (=> b!1036161 (= e!585999 (not (containsKey!564 lt!457009 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036162 () Bool)

(assert (=> b!1036162 (= e!585998 Nil!21915)))

(declare-fun b!1036163 () Bool)

(declare-fun e!586000 () List!21918)

(assert (=> b!1036163 (= e!586000 e!585998)))

(declare-fun c!104805 () Bool)

(assert (=> b!1036163 (= c!104805 (and ((_ is Cons!21914) (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) (not (= (_1!7876 (h!23116 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!124635 () Bool)

(assert (=> d!124635 e!585999))

(declare-fun res!691691 () Bool)

(assert (=> d!124635 (=> (not res!691691) (not e!585999))))

(declare-fun isStrictlySorted!719 (List!21918) Bool)

(assert (=> d!124635 (= res!691691 (isStrictlySorted!719 lt!457009))))

(assert (=> d!124635 (= lt!457009 e!586000)))

(declare-fun c!104804 () Bool)

(assert (=> d!124635 (= c!104804 (and ((_ is Cons!21914) (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) (= (_1!7876 (h!23116 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124635 (isStrictlySorted!719 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))))

(assert (=> d!124635 (= (removeStrictlySorted!57 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457009)))

(declare-fun b!1036164 () Bool)

(assert (=> b!1036164 (= e!586000 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))))

(assert (= (and d!124635 c!104804) b!1036164))

(assert (= (and d!124635 (not c!104804)) b!1036163))

(assert (= (and b!1036163 c!104805) b!1036160))

(assert (= (and b!1036163 (not c!104805)) b!1036162))

(assert (= (and d!124635 res!691691) b!1036161))

(declare-fun m!956063 () Bool)

(assert (=> b!1036160 m!956063))

(assert (=> b!1036160 m!956063))

(declare-fun m!956065 () Bool)

(assert (=> b!1036160 m!956065))

(declare-fun m!956067 () Bool)

(assert (=> b!1036161 m!956067))

(declare-fun m!956069 () Bool)

(assert (=> d!124635 m!956069))

(declare-fun m!956071 () Bool)

(assert (=> d!124635 m!956071))

(assert (=> d!124569 d!124635))

(declare-fun b!1036175 () Bool)

(declare-fun e!586010 () Bool)

(declare-fun e!586012 () Bool)

(assert (=> b!1036175 (= e!586010 e!586012)))

(declare-fun res!691698 () Bool)

(assert (=> b!1036175 (=> (not res!691698) (not e!586012))))

(declare-fun e!586011 () Bool)

(assert (=> b!1036175 (= res!691698 (not e!586011))))

(declare-fun res!691700 () Bool)

(assert (=> b!1036175 (=> (not res!691700) (not e!586011))))

(assert (=> b!1036175 (= res!691700 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun b!1036176 () Bool)

(declare-fun e!586009 () Bool)

(assert (=> b!1036176 (= e!586012 e!586009)))

(declare-fun c!104808 () Bool)

(assert (=> b!1036176 (= c!104808 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun d!124637 () Bool)

(declare-fun res!691699 () Bool)

(assert (=> d!124637 (=> res!691699 e!586010)))

(assert (=> d!124637 (= res!691699 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!124637 (= (arrayNoDuplicates!0 (_keys!11459 lt!456791) #b00000000000000000000000000000000 Nil!21917) e!586010)))

(declare-fun bm!43839 () Bool)

(declare-fun call!43842 () Bool)

(assert (=> bm!43839 (= call!43842 (arrayNoDuplicates!0 (_keys!11459 lt!456791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104808 (Cons!21916 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) Nil!21917) Nil!21917)))))

(declare-fun b!1036177 () Bool)

(assert (=> b!1036177 (= e!586009 call!43842)))

(declare-fun b!1036178 () Bool)

(declare-fun contains!6023 (List!21920 (_ BitVec 64)) Bool)

(assert (=> b!1036178 (= e!586011 (contains!6023 Nil!21917 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun b!1036179 () Bool)

(assert (=> b!1036179 (= e!586009 call!43842)))

(assert (= (and d!124637 (not res!691699)) b!1036175))

(assert (= (and b!1036175 res!691700) b!1036178))

(assert (= (and b!1036175 res!691698) b!1036176))

(assert (= (and b!1036176 c!104808) b!1036179))

(assert (= (and b!1036176 (not c!104808)) b!1036177))

(assert (= (or b!1036179 b!1036177) bm!43839))

(assert (=> b!1036175 m!955841))

(assert (=> b!1036175 m!955841))

(assert (=> b!1036175 m!955843))

(assert (=> b!1036176 m!955841))

(assert (=> b!1036176 m!955841))

(assert (=> b!1036176 m!955843))

(assert (=> bm!43839 m!955841))

(declare-fun m!956073 () Bool)

(assert (=> bm!43839 m!956073))

(assert (=> b!1036178 m!955841))

(assert (=> b!1036178 m!955841))

(declare-fun m!956075 () Bool)

(assert (=> b!1036178 m!956075))

(assert (=> b!1036025 d!124637))

(declare-fun d!124639 () Bool)

(declare-fun e!586013 () Bool)

(assert (=> d!124639 e!586013))

(declare-fun res!691701 () Bool)

(assert (=> d!124639 (=> res!691701 e!586013)))

(declare-fun lt!457011 () Bool)

(assert (=> d!124639 (= res!691701 (not lt!457011))))

(declare-fun lt!457013 () Bool)

(assert (=> d!124639 (= lt!457011 lt!457013)))

(declare-fun lt!457010 () Unit!33894)

(declare-fun e!586014 () Unit!33894)

(assert (=> d!124639 (= lt!457010 e!586014)))

(declare-fun c!104809 () Bool)

(assert (=> d!124639 (= c!104809 lt!457013)))

(assert (=> d!124639 (= lt!457013 (containsKey!564 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124639 (= (contains!6021 lt!456890 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457011)))

(declare-fun b!1036180 () Bool)

(declare-fun lt!457012 () Unit!33894)

(assert (=> b!1036180 (= e!586014 lt!457012)))

(assert (=> b!1036180 (= lt!457012 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036180 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036181 () Bool)

(declare-fun Unit!33904 () Unit!33894)

(assert (=> b!1036181 (= e!586014 Unit!33904)))

(declare-fun b!1036182 () Bool)

(assert (=> b!1036182 (= e!586013 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124639 c!104809) b!1036180))

(assert (= (and d!124639 (not c!104809)) b!1036181))

(assert (= (and d!124639 (not res!691701)) b!1036182))

(declare-fun m!956077 () Bool)

(assert (=> d!124639 m!956077))

(declare-fun m!956079 () Bool)

(assert (=> b!1036180 m!956079))

(declare-fun m!956081 () Bool)

(assert (=> b!1036180 m!956081))

(assert (=> b!1036180 m!956081))

(declare-fun m!956083 () Bool)

(assert (=> b!1036180 m!956083))

(assert (=> b!1036182 m!956081))

(assert (=> b!1036182 m!956081))

(assert (=> b!1036182 m!956083))

(assert (=> bm!43820 d!124639))

(declare-fun b!1036194 () Bool)

(declare-fun e!586017 () Bool)

(assert (=> b!1036194 (= e!586017 (and (bvsge (extraKeys!6000 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6000 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2947 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1036191 () Bool)

(declare-fun res!691711 () Bool)

(assert (=> b!1036191 (=> (not res!691711) (not e!586017))))

(assert (=> b!1036191 (= res!691711 (and (= (size!31960 (_values!6293 thiss!1427)) (bvadd (mask!30171 thiss!1427) #b00000000000000000000000000000001)) (= (size!31959 (_keys!11459 thiss!1427)) (size!31960 (_values!6293 thiss!1427))) (bvsge (_size!2947 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2947 thiss!1427) (bvadd (mask!30171 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1036192 () Bool)

(declare-fun res!691710 () Bool)

(assert (=> b!1036192 (=> (not res!691710) (not e!586017))))

(declare-fun size!31963 (LongMapFixedSize!5784) (_ BitVec 32))

(assert (=> b!1036192 (= res!691710 (bvsge (size!31963 thiss!1427) (_size!2947 thiss!1427)))))

(declare-fun b!1036193 () Bool)

(declare-fun res!691712 () Bool)

(assert (=> b!1036193 (=> (not res!691712) (not e!586017))))

(assert (=> b!1036193 (= res!691712 (= (size!31963 thiss!1427) (bvadd (_size!2947 thiss!1427) (bvsdiv (bvadd (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124641 () Bool)

(declare-fun res!691713 () Bool)

(assert (=> d!124641 (=> (not res!691713) (not e!586017))))

(assert (=> d!124641 (= res!691713 (validMask!0 (mask!30171 thiss!1427)))))

(assert (=> d!124641 (= (simpleValid!414 thiss!1427) e!586017)))

(assert (= (and d!124641 res!691713) b!1036191))

(assert (= (and b!1036191 res!691711) b!1036192))

(assert (= (and b!1036192 res!691710) b!1036193))

(assert (= (and b!1036193 res!691712) b!1036194))

(declare-fun m!956085 () Bool)

(assert (=> b!1036192 m!956085))

(assert (=> b!1036193 m!956085))

(assert (=> d!124641 m!955745))

(assert (=> d!124575 d!124641))

(assert (=> bm!43816 d!124599))

(declare-fun d!124643 () Bool)

(declare-fun e!586018 () Bool)

(assert (=> d!124643 e!586018))

(declare-fun res!691714 () Bool)

(assert (=> d!124643 (=> (not res!691714) (not e!586018))))

(declare-fun lt!457016 () ListLongMap!13759)

(assert (=> d!124643 (= res!691714 (contains!6021 lt!457016 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun lt!457015 () List!21918)

(assert (=> d!124643 (= lt!457016 (ListLongMap!13760 lt!457015))))

(declare-fun lt!457014 () Unit!33894)

(declare-fun lt!457017 () Unit!33894)

(assert (=> d!124643 (= lt!457014 lt!457017)))

(assert (=> d!124643 (= (getValueByKey!589 lt!457015 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))) (Some!639 (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> d!124643 (= lt!457017 (lemmaContainsTupThenGetReturnValue!280 lt!457015 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> d!124643 (= lt!457015 (insertStrictlySorted!373 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816))) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> d!124643 (= (+!3105 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)) (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) lt!457016)))

(declare-fun b!1036195 () Bool)

(declare-fun res!691715 () Bool)

(assert (=> b!1036195 (=> (not res!691715) (not e!586018))))

(assert (=> b!1036195 (= res!691715 (= (getValueByKey!589 (toList!6895 lt!457016) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))) (Some!639 (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(declare-fun b!1036196 () Bool)

(assert (=> b!1036196 (= e!586018 (contains!6022 (toList!6895 lt!457016) (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(assert (= (and d!124643 res!691714) b!1036195))

(assert (= (and b!1036195 res!691715) b!1036196))

(declare-fun m!956087 () Bool)

(assert (=> d!124643 m!956087))

(declare-fun m!956089 () Bool)

(assert (=> d!124643 m!956089))

(declare-fun m!956091 () Bool)

(assert (=> d!124643 m!956091))

(declare-fun m!956093 () Bool)

(assert (=> d!124643 m!956093))

(declare-fun m!956095 () Bool)

(assert (=> b!1036195 m!956095))

(declare-fun m!956097 () Bool)

(assert (=> b!1036196 m!956097))

(assert (=> bm!43815 d!124643))

(assert (=> d!124571 d!124593))

(declare-fun d!124645 () Bool)

(declare-fun e!586019 () Bool)

(assert (=> d!124645 e!586019))

(declare-fun res!691716 () Bool)

(assert (=> d!124645 (=> res!691716 e!586019)))

(declare-fun lt!457019 () Bool)

(assert (=> d!124645 (= res!691716 (not lt!457019))))

(declare-fun lt!457021 () Bool)

(assert (=> d!124645 (= lt!457019 lt!457021)))

(declare-fun lt!457018 () Unit!33894)

(declare-fun e!586020 () Unit!33894)

(assert (=> d!124645 (= lt!457018 e!586020)))

(declare-fun c!104810 () Bool)

(assert (=> d!124645 (= c!104810 lt!457021)))

(assert (=> d!124645 (= lt!457021 (containsKey!564 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124645 (= (contains!6021 lt!456864 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) lt!457019)))

(declare-fun b!1036197 () Bool)

(declare-fun lt!457020 () Unit!33894)

(assert (=> b!1036197 (= e!586020 lt!457020)))

(assert (=> b!1036197 (= lt!457020 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036197 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036198 () Bool)

(declare-fun Unit!33905 () Unit!33894)

(assert (=> b!1036198 (= e!586020 Unit!33905)))

(declare-fun b!1036199 () Bool)

(assert (=> b!1036199 (= e!586019 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124645 c!104810) b!1036197))

(assert (= (and d!124645 (not c!104810)) b!1036198))

(assert (= (and d!124645 (not res!691716)) b!1036199))

(assert (=> d!124645 m!955693))

(declare-fun m!956099 () Bool)

(assert (=> d!124645 m!956099))

(assert (=> b!1036197 m!955693))

(declare-fun m!956101 () Bool)

(assert (=> b!1036197 m!956101))

(assert (=> b!1036197 m!955693))

(assert (=> b!1036197 m!955819))

(assert (=> b!1036197 m!955819))

(declare-fun m!956103 () Bool)

(assert (=> b!1036197 m!956103))

(assert (=> b!1036199 m!955693))

(assert (=> b!1036199 m!955819))

(assert (=> b!1036199 m!955819))

(assert (=> b!1036199 m!956103))

(assert (=> b!1035991 d!124645))

(assert (=> d!124565 d!124593))

(declare-fun d!124647 () Bool)

(assert (=> d!124647 (= (apply!907 lt!456890 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16464 (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30324 () Bool)

(assert (= bs!30324 d!124647))

(assert (=> bs!30324 m!956081))

(assert (=> bs!30324 m!956081))

(declare-fun m!956105 () Bool)

(assert (=> bs!30324 m!956105))

(assert (=> b!1036000 d!124647))

(assert (=> b!1036015 d!124581))

(declare-fun d!124649 () Bool)

(assert (=> d!124649 (= (apply!907 lt!456864 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16464 (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30325 () Bool)

(assert (= bs!30325 d!124649))

(declare-fun m!956107 () Bool)

(assert (=> bs!30325 m!956107))

(assert (=> bs!30325 m!956107))

(declare-fun m!956109 () Bool)

(assert (=> bs!30325 m!956109))

(assert (=> b!1035989 d!124649))

(declare-fun b!1036208 () Bool)

(declare-fun e!586025 () (_ BitVec 32))

(assert (=> b!1036208 (= e!586025 #b00000000000000000000000000000000)))

(declare-fun b!1036209 () Bool)

(declare-fun e!586026 () (_ BitVec 32))

(assert (=> b!1036209 (= e!586025 e!586026)))

(declare-fun c!104816 () Bool)

(assert (=> b!1036209 (= c!104816 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124651 () Bool)

(declare-fun lt!457024 () (_ BitVec 32))

(assert (=> d!124651 (and (bvsge lt!457024 #b00000000000000000000000000000000) (bvsle lt!457024 (bvsub (size!31959 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124651 (= lt!457024 e!586025)))

(declare-fun c!104815 () Bool)

(assert (=> d!124651 (= c!104815 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!124651 (and (bvsle #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31959 (_keys!11459 thiss!1427)) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!124651 (= (arrayCountValidKeys!0 (_keys!11459 thiss!1427) #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))) lt!457024)))

(declare-fun b!1036210 () Bool)

(declare-fun call!43845 () (_ BitVec 32))

(assert (=> b!1036210 (= e!586026 (bvadd #b00000000000000000000000000000001 call!43845))))

(declare-fun bm!43842 () Bool)

(assert (=> bm!43842 (= call!43845 (arrayCountValidKeys!0 (_keys!11459 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036211 () Bool)

(assert (=> b!1036211 (= e!586026 call!43845)))

(assert (= (and d!124651 c!104815) b!1036208))

(assert (= (and d!124651 (not c!104815)) b!1036209))

(assert (= (and b!1036209 c!104816) b!1036210))

(assert (= (and b!1036209 (not c!104816)) b!1036211))

(assert (= (or b!1036210 b!1036211) bm!43842))

(assert (=> b!1036209 m!955693))

(assert (=> b!1036209 m!955693))

(assert (=> b!1036209 m!955695))

(declare-fun m!956111 () Bool)

(assert (=> bm!43842 m!956111))

(assert (=> b!1036026 d!124651))

(declare-fun d!124653 () Bool)

(declare-fun e!586027 () Bool)

(assert (=> d!124653 e!586027))

(declare-fun res!691717 () Bool)

(assert (=> d!124653 (=> (not res!691717) (not e!586027))))

(declare-fun lt!457027 () ListLongMap!13759)

(assert (=> d!124653 (= res!691717 (contains!6021 lt!457027 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun lt!457026 () List!21918)

(assert (=> d!124653 (= lt!457027 (ListLongMap!13760 lt!457026))))

(declare-fun lt!457025 () Unit!33894)

(declare-fun lt!457028 () Unit!33894)

(assert (=> d!124653 (= lt!457025 lt!457028)))

(assert (=> d!124653 (= (getValueByKey!589 lt!457026 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124653 (= lt!457028 (lemmaContainsTupThenGetReturnValue!280 lt!457026 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124653 (= lt!457026 (insertStrictlySorted!373 (toList!6895 lt!456886) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124653 (= (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) lt!457027)))

(declare-fun b!1036212 () Bool)

(declare-fun res!691718 () Bool)

(assert (=> b!1036212 (=> (not res!691718) (not e!586027))))

(assert (=> b!1036212 (= res!691718 (= (getValueByKey!589 (toList!6895 lt!457027) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(declare-fun b!1036213 () Bool)

(assert (=> b!1036213 (= e!586027 (contains!6022 (toList!6895 lt!457027) (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))

(assert (= (and d!124653 res!691717) b!1036212))

(assert (= (and b!1036212 res!691718) b!1036213))

(declare-fun m!956113 () Bool)

(assert (=> d!124653 m!956113))

(declare-fun m!956115 () Bool)

(assert (=> d!124653 m!956115))

(declare-fun m!956117 () Bool)

(assert (=> d!124653 m!956117))

(declare-fun m!956119 () Bool)

(assert (=> d!124653 m!956119))

(declare-fun m!956121 () Bool)

(assert (=> b!1036212 m!956121))

(declare-fun m!956123 () Bool)

(assert (=> b!1036213 m!956123))

(assert (=> b!1036006 d!124653))

(declare-fun d!124655 () Bool)

(assert (=> d!124655 (= (apply!907 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)) lt!456892) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792))) lt!456892)))))

(declare-fun bs!30326 () Bool)

(assert (= bs!30326 d!124655))

(declare-fun m!956125 () Bool)

(assert (=> bs!30326 m!956125))

(assert (=> bs!30326 m!956125))

(declare-fun m!956127 () Bool)

(assert (=> bs!30326 m!956127))

(assert (=> b!1036006 d!124655))

(declare-fun d!124657 () Bool)

(assert (=> d!124657 (= (apply!907 lt!456881 lt!456892) (get!16464 (getValueByKey!589 (toList!6895 lt!456881) lt!456892)))))

(declare-fun bs!30327 () Bool)

(assert (= bs!30327 d!124657))

(declare-fun m!956129 () Bool)

(assert (=> bs!30327 m!956129))

(assert (=> bs!30327 m!956129))

(declare-fun m!956131 () Bool)

(assert (=> bs!30327 m!956131))

(assert (=> b!1036006 d!124657))

(declare-fun d!124659 () Bool)

(assert (=> d!124659 (= (apply!907 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)) lt!456894) (apply!907 lt!456880 lt!456894))))

(declare-fun lt!457029 () Unit!33894)

(assert (=> d!124659 (= lt!457029 (choose!1703 lt!456880 lt!456875 lt!456792 lt!456894))))

(declare-fun e!586028 () Bool)

(assert (=> d!124659 e!586028))

(declare-fun res!691719 () Bool)

(assert (=> d!124659 (=> (not res!691719) (not e!586028))))

(assert (=> d!124659 (= res!691719 (contains!6021 lt!456880 lt!456894))))

(assert (=> d!124659 (= (addApplyDifferent!486 lt!456880 lt!456875 lt!456792 lt!456894) lt!457029)))

(declare-fun b!1036214 () Bool)

(assert (=> b!1036214 (= e!586028 (not (= lt!456894 lt!456875)))))

(assert (= (and d!124659 res!691719) b!1036214))

(assert (=> d!124659 m!955779))

(assert (=> d!124659 m!955781))

(declare-fun m!956133 () Bool)

(assert (=> d!124659 m!956133))

(assert (=> d!124659 m!955779))

(declare-fun m!956135 () Bool)

(assert (=> d!124659 m!956135))

(assert (=> d!124659 m!955767))

(assert (=> b!1036006 d!124659))

(assert (=> b!1036006 d!124595))

(declare-fun d!124661 () Bool)

(assert (=> d!124661 (= (apply!907 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) lt!456891) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) lt!456891)))))

(declare-fun bs!30328 () Bool)

(assert (= bs!30328 d!124661))

(declare-fun m!956137 () Bool)

(assert (=> bs!30328 m!956137))

(assert (=> bs!30328 m!956137))

(declare-fun m!956139 () Bool)

(assert (=> bs!30328 m!956139))

(assert (=> b!1036006 d!124661))

(declare-fun d!124663 () Bool)

(assert (=> d!124663 (= (apply!907 lt!456877 lt!456891) (get!16464 (getValueByKey!589 (toList!6895 lt!456877) lt!456891)))))

(declare-fun bs!30329 () Bool)

(assert (= bs!30329 d!124663))

(declare-fun m!956141 () Bool)

(assert (=> bs!30329 m!956141))

(assert (=> bs!30329 m!956141))

(declare-fun m!956143 () Bool)

(assert (=> bs!30329 m!956143))

(assert (=> b!1036006 d!124663))

(declare-fun d!124665 () Bool)

(assert (=> d!124665 (= (apply!907 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) lt!456891) (apply!907 lt!456877 lt!456891))))

(declare-fun lt!457030 () Unit!33894)

(assert (=> d!124665 (= lt!457030 (choose!1703 lt!456877 lt!456888 (zeroValue!6104 thiss!1427) lt!456891))))

(declare-fun e!586029 () Bool)

(assert (=> d!124665 e!586029))

(declare-fun res!691720 () Bool)

(assert (=> d!124665 (=> (not res!691720) (not e!586029))))

(assert (=> d!124665 (= res!691720 (contains!6021 lt!456877 lt!456891))))

(assert (=> d!124665 (= (addApplyDifferent!486 lt!456877 lt!456888 (zeroValue!6104 thiss!1427) lt!456891) lt!457030)))

(declare-fun b!1036215 () Bool)

(assert (=> b!1036215 (= e!586029 (not (= lt!456891 lt!456888)))))

(assert (= (and d!124665 res!691720) b!1036215))

(assert (=> d!124665 m!955775))

(assert (=> d!124665 m!955777))

(declare-fun m!956145 () Bool)

(assert (=> d!124665 m!956145))

(assert (=> d!124665 m!955775))

(declare-fun m!956147 () Bool)

(assert (=> d!124665 m!956147))

(assert (=> d!124665 m!955789))

(assert (=> b!1036006 d!124665))

(declare-fun d!124667 () Bool)

(declare-fun e!586030 () Bool)

(assert (=> d!124667 e!586030))

(declare-fun res!691721 () Bool)

(assert (=> d!124667 (=> (not res!691721) (not e!586030))))

(declare-fun lt!457033 () ListLongMap!13759)

(assert (=> d!124667 (= res!691721 (contains!6021 lt!457033 (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun lt!457032 () List!21918)

(assert (=> d!124667 (= lt!457033 (ListLongMap!13760 lt!457032))))

(declare-fun lt!457031 () Unit!33894)

(declare-fun lt!457034 () Unit!33894)

(assert (=> d!124667 (= lt!457031 lt!457034)))

(assert (=> d!124667 (= (getValueByKey!589 lt!457032 (_1!7876 (tuple2!15731 lt!456875 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 lt!456875 lt!456792))))))

(assert (=> d!124667 (= lt!457034 (lemmaContainsTupThenGetReturnValue!280 lt!457032 (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792))))))

(assert (=> d!124667 (= lt!457032 (insertStrictlySorted!373 (toList!6895 lt!456880) (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792))))))

(assert (=> d!124667 (= (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)) lt!457033)))

(declare-fun b!1036216 () Bool)

(declare-fun res!691722 () Bool)

(assert (=> b!1036216 (=> (not res!691722) (not e!586030))))

(assert (=> b!1036216 (= res!691722 (= (getValueByKey!589 (toList!6895 lt!457033) (_1!7876 (tuple2!15731 lt!456875 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(declare-fun b!1036217 () Bool)

(assert (=> b!1036217 (= e!586030 (contains!6022 (toList!6895 lt!457033) (tuple2!15731 lt!456875 lt!456792)))))

(assert (= (and d!124667 res!691721) b!1036216))

(assert (= (and b!1036216 res!691722) b!1036217))

(declare-fun m!956149 () Bool)

(assert (=> d!124667 m!956149))

(declare-fun m!956151 () Bool)

(assert (=> d!124667 m!956151))

(declare-fun m!956153 () Bool)

(assert (=> d!124667 m!956153))

(declare-fun m!956155 () Bool)

(assert (=> d!124667 m!956155))

(declare-fun m!956157 () Bool)

(assert (=> b!1036216 m!956157))

(declare-fun m!956159 () Bool)

(assert (=> b!1036217 m!956159))

(assert (=> b!1036006 d!124667))

(declare-fun d!124669 () Bool)

(declare-fun e!586031 () Bool)

(assert (=> d!124669 e!586031))

(declare-fun res!691723 () Bool)

(assert (=> d!124669 (=> (not res!691723) (not e!586031))))

(declare-fun lt!457037 () ListLongMap!13759)

(assert (=> d!124669 (= res!691723 (contains!6021 lt!457037 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun lt!457036 () List!21918)

(assert (=> d!124669 (= lt!457037 (ListLongMap!13760 lt!457036))))

(declare-fun lt!457035 () Unit!33894)

(declare-fun lt!457038 () Unit!33894)

(assert (=> d!124669 (= lt!457035 lt!457038)))

(assert (=> d!124669 (= (getValueByKey!589 lt!457036 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124669 (= lt!457038 (lemmaContainsTupThenGetReturnValue!280 lt!457036 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124669 (= lt!457036 (insertStrictlySorted!373 (toList!6895 lt!456877) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124669 (= (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) lt!457037)))

(declare-fun b!1036218 () Bool)

(declare-fun res!691724 () Bool)

(assert (=> b!1036218 (=> (not res!691724) (not e!586031))))

(assert (=> b!1036218 (= res!691724 (= (getValueByKey!589 (toList!6895 lt!457037) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(declare-fun b!1036219 () Bool)

(assert (=> b!1036219 (= e!586031 (contains!6022 (toList!6895 lt!457037) (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))

(assert (= (and d!124669 res!691723) b!1036218))

(assert (= (and b!1036218 res!691724) b!1036219))

(declare-fun m!956161 () Bool)

(assert (=> d!124669 m!956161))

(declare-fun m!956163 () Bool)

(assert (=> d!124669 m!956163))

(declare-fun m!956165 () Bool)

(assert (=> d!124669 m!956165))

(declare-fun m!956167 () Bool)

(assert (=> d!124669 m!956167))

(declare-fun m!956169 () Bool)

(assert (=> b!1036218 m!956169))

(declare-fun m!956171 () Bool)

(assert (=> b!1036219 m!956171))

(assert (=> b!1036006 d!124669))

(declare-fun d!124671 () Bool)

(assert (=> d!124671 (contains!6021 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) lt!456895)))

(declare-fun lt!457039 () Unit!33894)

(assert (=> d!124671 (= lt!457039 (choose!1704 lt!456886 lt!456883 (zeroValue!6104 thiss!1427) lt!456895))))

(assert (=> d!124671 (contains!6021 lt!456886 lt!456895)))

(assert (=> d!124671 (= (addStillContains!626 lt!456886 lt!456883 (zeroValue!6104 thiss!1427) lt!456895) lt!457039)))

(declare-fun bs!30330 () Bool)

(assert (= bs!30330 d!124671))

(assert (=> bs!30330 m!955771))

(assert (=> bs!30330 m!955771))

(assert (=> bs!30330 m!955773))

(declare-fun m!956173 () Bool)

(assert (=> bs!30330 m!956173))

(declare-fun m!956175 () Bool)

(assert (=> bs!30330 m!956175))

(assert (=> b!1036006 d!124671))

(declare-fun d!124673 () Bool)

(assert (=> d!124673 (= (apply!907 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)) lt!456892) (apply!907 lt!456881 lt!456892))))

(declare-fun lt!457040 () Unit!33894)

(assert (=> d!124673 (= lt!457040 (choose!1703 lt!456881 lt!456878 lt!456792 lt!456892))))

(declare-fun e!586032 () Bool)

(assert (=> d!124673 e!586032))

(declare-fun res!691725 () Bool)

(assert (=> d!124673 (=> (not res!691725) (not e!586032))))

(assert (=> d!124673 (= res!691725 (contains!6021 lt!456881 lt!456892))))

(assert (=> d!124673 (= (addApplyDifferent!486 lt!456881 lt!456878 lt!456792 lt!456892) lt!457040)))

(declare-fun b!1036220 () Bool)

(assert (=> b!1036220 (= e!586032 (not (= lt!456892 lt!456878)))))

(assert (= (and d!124673 res!691725) b!1036220))

(assert (=> d!124673 m!955787))

(assert (=> d!124673 m!955791))

(declare-fun m!956177 () Bool)

(assert (=> d!124673 m!956177))

(assert (=> d!124673 m!955787))

(declare-fun m!956179 () Bool)

(assert (=> d!124673 m!956179))

(assert (=> d!124673 m!955793))

(assert (=> b!1036006 d!124673))

(declare-fun d!124675 () Bool)

(assert (=> d!124675 (= (apply!907 lt!456880 lt!456894) (get!16464 (getValueByKey!589 (toList!6895 lt!456880) lt!456894)))))

(declare-fun bs!30331 () Bool)

(assert (= bs!30331 d!124675))

(declare-fun m!956181 () Bool)

(assert (=> bs!30331 m!956181))

(assert (=> bs!30331 m!956181))

(declare-fun m!956183 () Bool)

(assert (=> bs!30331 m!956183))

(assert (=> b!1036006 d!124675))

(declare-fun d!124677 () Bool)

(assert (=> d!124677 (= (apply!907 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)) lt!456894) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792))) lt!456894)))))

(declare-fun bs!30332 () Bool)

(assert (= bs!30332 d!124677))

(declare-fun m!956185 () Bool)

(assert (=> bs!30332 m!956185))

(assert (=> bs!30332 m!956185))

(declare-fun m!956187 () Bool)

(assert (=> bs!30332 m!956187))

(assert (=> b!1036006 d!124677))

(declare-fun d!124679 () Bool)

(declare-fun e!586033 () Bool)

(assert (=> d!124679 e!586033))

(declare-fun res!691726 () Bool)

(assert (=> d!124679 (=> res!691726 e!586033)))

(declare-fun lt!457042 () Bool)

(assert (=> d!124679 (= res!691726 (not lt!457042))))

(declare-fun lt!457044 () Bool)

(assert (=> d!124679 (= lt!457042 lt!457044)))

(declare-fun lt!457041 () Unit!33894)

(declare-fun e!586034 () Unit!33894)

(assert (=> d!124679 (= lt!457041 e!586034)))

(declare-fun c!104817 () Bool)

(assert (=> d!124679 (= c!104817 lt!457044)))

(assert (=> d!124679 (= lt!457044 (containsKey!564 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895))))

(assert (=> d!124679 (= (contains!6021 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) lt!456895) lt!457042)))

(declare-fun b!1036221 () Bool)

(declare-fun lt!457043 () Unit!33894)

(assert (=> b!1036221 (= e!586034 lt!457043)))

(assert (=> b!1036221 (= lt!457043 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895))))

(assert (=> b!1036221 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895))))

(declare-fun b!1036222 () Bool)

(declare-fun Unit!33906 () Unit!33894)

(assert (=> b!1036222 (= e!586034 Unit!33906)))

(declare-fun b!1036223 () Bool)

(assert (=> b!1036223 (= e!586033 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895)))))

(assert (= (and d!124679 c!104817) b!1036221))

(assert (= (and d!124679 (not c!104817)) b!1036222))

(assert (= (and d!124679 (not res!691726)) b!1036223))

(declare-fun m!956189 () Bool)

(assert (=> d!124679 m!956189))

(declare-fun m!956191 () Bool)

(assert (=> b!1036221 m!956191))

(declare-fun m!956193 () Bool)

(assert (=> b!1036221 m!956193))

(assert (=> b!1036221 m!956193))

(declare-fun m!956195 () Bool)

(assert (=> b!1036221 m!956195))

(assert (=> b!1036223 m!956193))

(assert (=> b!1036223 m!956193))

(assert (=> b!1036223 m!956195))

(assert (=> b!1036006 d!124679))

(declare-fun d!124681 () Bool)

(declare-fun e!586035 () Bool)

(assert (=> d!124681 e!586035))

(declare-fun res!691727 () Bool)

(assert (=> d!124681 (=> (not res!691727) (not e!586035))))

(declare-fun lt!457047 () ListLongMap!13759)

(assert (=> d!124681 (= res!691727 (contains!6021 lt!457047 (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun lt!457046 () List!21918)

(assert (=> d!124681 (= lt!457047 (ListLongMap!13760 lt!457046))))

(declare-fun lt!457045 () Unit!33894)

(declare-fun lt!457048 () Unit!33894)

(assert (=> d!124681 (= lt!457045 lt!457048)))

(assert (=> d!124681 (= (getValueByKey!589 lt!457046 (_1!7876 (tuple2!15731 lt!456878 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 lt!456878 lt!456792))))))

(assert (=> d!124681 (= lt!457048 (lemmaContainsTupThenGetReturnValue!280 lt!457046 (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792))))))

(assert (=> d!124681 (= lt!457046 (insertStrictlySorted!373 (toList!6895 lt!456881) (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792))))))

(assert (=> d!124681 (= (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)) lt!457047)))

(declare-fun b!1036224 () Bool)

(declare-fun res!691728 () Bool)

(assert (=> b!1036224 (=> (not res!691728) (not e!586035))))

(assert (=> b!1036224 (= res!691728 (= (getValueByKey!589 (toList!6895 lt!457047) (_1!7876 (tuple2!15731 lt!456878 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(declare-fun b!1036225 () Bool)

(assert (=> b!1036225 (= e!586035 (contains!6022 (toList!6895 lt!457047) (tuple2!15731 lt!456878 lt!456792)))))

(assert (= (and d!124681 res!691727) b!1036224))

(assert (= (and b!1036224 res!691728) b!1036225))

(declare-fun m!956197 () Bool)

(assert (=> d!124681 m!956197))

(declare-fun m!956199 () Bool)

(assert (=> d!124681 m!956199))

(declare-fun m!956201 () Bool)

(assert (=> d!124681 m!956201))

(declare-fun m!956203 () Bool)

(assert (=> d!124681 m!956203))

(declare-fun m!956205 () Bool)

(assert (=> b!1036224 m!956205))

(declare-fun m!956207 () Bool)

(assert (=> b!1036225 m!956207))

(assert (=> b!1036006 d!124681))

(declare-fun d!124683 () Bool)

(assert (=> d!124683 (= (apply!907 lt!456864 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16464 (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30333 () Bool)

(assert (= bs!30333 d!124683))

(declare-fun m!956209 () Bool)

(assert (=> bs!30333 m!956209))

(assert (=> bs!30333 m!956209))

(declare-fun m!956211 () Bool)

(assert (=> bs!30333 m!956211))

(assert (=> b!1035979 d!124683))

(declare-fun d!124685 () Bool)

(declare-fun e!586036 () Bool)

(assert (=> d!124685 e!586036))

(declare-fun res!691729 () Bool)

(assert (=> d!124685 (=> (not res!691729) (not e!586036))))

(declare-fun lt!457051 () ListLongMap!13759)

(assert (=> d!124685 (= res!691729 (contains!6021 lt!457051 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun lt!457050 () List!21918)

(assert (=> d!124685 (= lt!457051 (ListLongMap!13760 lt!457050))))

(declare-fun lt!457049 () Unit!33894)

(declare-fun lt!457052 () Unit!33894)

(assert (=> d!124685 (= lt!457049 lt!457052)))

(assert (=> d!124685 (= (getValueByKey!589 lt!457050 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(assert (=> d!124685 (= lt!457052 (lemmaContainsTupThenGetReturnValue!280 lt!457050 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(assert (=> d!124685 (= lt!457050 (insertStrictlySorted!373 (toList!6895 call!43822) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(assert (=> d!124685 (= (+!3105 call!43822 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) lt!457051)))

(declare-fun b!1036226 () Bool)

(declare-fun res!691730 () Bool)

(assert (=> b!1036226 (=> (not res!691730) (not e!586036))))

(assert (=> b!1036226 (= res!691730 (= (getValueByKey!589 (toList!6895 lt!457051) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun b!1036227 () Bool)

(assert (=> b!1036227 (= e!586036 (contains!6022 (toList!6895 lt!457051) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))

(assert (= (and d!124685 res!691729) b!1036226))

(assert (= (and b!1036226 res!691730) b!1036227))

(declare-fun m!956213 () Bool)

(assert (=> d!124685 m!956213))

(declare-fun m!956215 () Bool)

(assert (=> d!124685 m!956215))

(declare-fun m!956217 () Bool)

(assert (=> d!124685 m!956217))

(declare-fun m!956219 () Bool)

(assert (=> d!124685 m!956219))

(declare-fun m!956221 () Bool)

(assert (=> b!1036226 m!956221))

(declare-fun m!956223 () Bool)

(assert (=> b!1036227 m!956223))

(assert (=> b!1036005 d!124685))

(assert (=> b!1035994 d!124581))

(assert (=> b!1035993 d!124581))

(declare-fun d!124687 () Bool)

(declare-fun e!586037 () Bool)

(assert (=> d!124687 e!586037))

(declare-fun res!691731 () Bool)

(assert (=> d!124687 (=> res!691731 e!586037)))

(declare-fun lt!457054 () Bool)

(assert (=> d!124687 (= res!691731 (not lt!457054))))

(declare-fun lt!457056 () Bool)

(assert (=> d!124687 (= lt!457054 lt!457056)))

(declare-fun lt!457053 () Unit!33894)

(declare-fun e!586038 () Unit!33894)

(assert (=> d!124687 (= lt!457053 e!586038)))

(declare-fun c!104818 () Bool)

(assert (=> d!124687 (= c!104818 lt!457056)))

(assert (=> d!124687 (= lt!457056 (containsKey!564 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124687 (= (contains!6021 lt!456864 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457054)))

(declare-fun b!1036228 () Bool)

(declare-fun lt!457055 () Unit!33894)

(assert (=> b!1036228 (= e!586038 lt!457055)))

(assert (=> b!1036228 (= lt!457055 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036228 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036229 () Bool)

(declare-fun Unit!33907 () Unit!33894)

(assert (=> b!1036229 (= e!586038 Unit!33907)))

(declare-fun b!1036230 () Bool)

(assert (=> b!1036230 (= e!586037 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124687 c!104818) b!1036228))

(assert (= (and d!124687 (not c!104818)) b!1036229))

(assert (= (and d!124687 (not res!691731)) b!1036230))

(declare-fun m!956225 () Bool)

(assert (=> d!124687 m!956225))

(declare-fun m!956227 () Bool)

(assert (=> b!1036228 m!956227))

(assert (=> b!1036228 m!956107))

(assert (=> b!1036228 m!956107))

(declare-fun m!956229 () Bool)

(assert (=> b!1036228 m!956229))

(assert (=> b!1036230 m!956107))

(assert (=> b!1036230 m!956107))

(assert (=> b!1036230 m!956229))

(assert (=> bm!43812 d!124687))

(declare-fun d!124689 () Bool)

(declare-fun e!586039 () Bool)

(assert (=> d!124689 e!586039))

(declare-fun res!691732 () Bool)

(assert (=> d!124689 (=> res!691732 e!586039)))

(declare-fun lt!457058 () Bool)

(assert (=> d!124689 (= res!691732 (not lt!457058))))

(declare-fun lt!457060 () Bool)

(assert (=> d!124689 (= lt!457058 lt!457060)))

(declare-fun lt!457057 () Unit!33894)

(declare-fun e!586040 () Unit!33894)

(assert (=> d!124689 (= lt!457057 e!586040)))

(declare-fun c!104819 () Bool)

(assert (=> d!124689 (= c!104819 lt!457060)))

(assert (=> d!124689 (= lt!457060 (containsKey!564 (toList!6895 lt!456804) key!909))))

(assert (=> d!124689 (= (contains!6021 lt!456804 key!909) lt!457058)))

(declare-fun b!1036231 () Bool)

(declare-fun lt!457059 () Unit!33894)

(assert (=> b!1036231 (= e!586040 lt!457059)))

(assert (=> b!1036231 (= lt!457059 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456804) key!909))))

(assert (=> b!1036231 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456804) key!909))))

(declare-fun b!1036232 () Bool)

(declare-fun Unit!33908 () Unit!33894)

(assert (=> b!1036232 (= e!586040 Unit!33908)))

(declare-fun b!1036233 () Bool)

(assert (=> b!1036233 (= e!586039 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456804) key!909)))))

(assert (= (and d!124689 c!104819) b!1036231))

(assert (= (and d!124689 (not c!104819)) b!1036232))

(assert (= (and d!124689 (not res!691732)) b!1036233))

(declare-fun m!956231 () Bool)

(assert (=> d!124689 m!956231))

(declare-fun m!956233 () Bool)

(assert (=> b!1036231 m!956233))

(declare-fun m!956235 () Bool)

(assert (=> b!1036231 m!956235))

(assert (=> b!1036231 m!956235))

(declare-fun m!956237 () Bool)

(assert (=> b!1036231 m!956237))

(assert (=> b!1036233 m!956235))

(assert (=> b!1036233 m!956235))

(assert (=> b!1036233 m!956237))

(assert (=> d!124561 d!124689))

(declare-fun b!1036234 () Bool)

(declare-fun e!586041 () List!21918)

(assert (=> b!1036234 (= e!586041 ($colon$colon!603 (removeStrictlySorted!57 (t!31125 (toList!6895 (map!14729 thiss!1427))) key!909) (h!23116 (toList!6895 (map!14729 thiss!1427)))))))

(declare-fun b!1036235 () Bool)

(declare-fun e!586042 () Bool)

(declare-fun lt!457061 () List!21918)

(assert (=> b!1036235 (= e!586042 (not (containsKey!564 lt!457061 key!909)))))

(declare-fun b!1036236 () Bool)

(assert (=> b!1036236 (= e!586041 Nil!21915)))

(declare-fun b!1036237 () Bool)

(declare-fun e!586043 () List!21918)

(assert (=> b!1036237 (= e!586043 e!586041)))

(declare-fun c!104821 () Bool)

(assert (=> b!1036237 (= c!104821 (and ((_ is Cons!21914) (toList!6895 (map!14729 thiss!1427))) (not (= (_1!7876 (h!23116 (toList!6895 (map!14729 thiss!1427)))) key!909))))))

(declare-fun d!124691 () Bool)

(assert (=> d!124691 e!586042))

(declare-fun res!691733 () Bool)

(assert (=> d!124691 (=> (not res!691733) (not e!586042))))

(assert (=> d!124691 (= res!691733 (isStrictlySorted!719 lt!457061))))

(assert (=> d!124691 (= lt!457061 e!586043)))

(declare-fun c!104820 () Bool)

(assert (=> d!124691 (= c!104820 (and ((_ is Cons!21914) (toList!6895 (map!14729 thiss!1427))) (= (_1!7876 (h!23116 (toList!6895 (map!14729 thiss!1427)))) key!909)))))

(assert (=> d!124691 (isStrictlySorted!719 (toList!6895 (map!14729 thiss!1427)))))

(assert (=> d!124691 (= (removeStrictlySorted!57 (toList!6895 (map!14729 thiss!1427)) key!909) lt!457061)))

(declare-fun b!1036238 () Bool)

(assert (=> b!1036238 (= e!586043 (t!31125 (toList!6895 (map!14729 thiss!1427))))))

(assert (= (and d!124691 c!104820) b!1036238))

(assert (= (and d!124691 (not c!104820)) b!1036237))

(assert (= (and b!1036237 c!104821) b!1036234))

(assert (= (and b!1036237 (not c!104821)) b!1036236))

(assert (= (and d!124691 res!691733) b!1036235))

(declare-fun m!956239 () Bool)

(assert (=> b!1036234 m!956239))

(assert (=> b!1036234 m!956239))

(declare-fun m!956241 () Bool)

(assert (=> b!1036234 m!956241))

(declare-fun m!956243 () Bool)

(assert (=> b!1036235 m!956243))

(declare-fun m!956245 () Bool)

(assert (=> d!124691 m!956245))

(declare-fun m!956247 () Bool)

(assert (=> d!124691 m!956247))

(assert (=> d!124561 d!124691))

(declare-fun bm!43845 () Bool)

(declare-fun call!43848 () Bool)

(assert (=> bm!43845 (= call!43848 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11459 lt!456791) (mask!30171 lt!456791)))))

(declare-fun b!1036247 () Bool)

(declare-fun e!586051 () Bool)

(assert (=> b!1036247 (= e!586051 call!43848)))

(declare-fun d!124693 () Bool)

(declare-fun res!691738 () Bool)

(declare-fun e!586052 () Bool)

(assert (=> d!124693 (=> res!691738 e!586052)))

(assert (=> d!124693 (= res!691738 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!124693 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11459 lt!456791) (mask!30171 lt!456791)) e!586052)))

(declare-fun b!1036248 () Bool)

(declare-fun e!586050 () Bool)

(assert (=> b!1036248 (= e!586051 e!586050)))

(declare-fun lt!457069 () (_ BitVec 64))

(assert (=> b!1036248 (= lt!457069 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000))))

(declare-fun lt!457068 () Unit!33894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65292 (_ BitVec 64) (_ BitVec 32)) Unit!33894)

(assert (=> b!1036248 (= lt!457068 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11459 lt!456791) lt!457069 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1036248 (arrayContainsKey!0 (_keys!11459 lt!456791) lt!457069 #b00000000000000000000000000000000)))

(declare-fun lt!457070 () Unit!33894)

(assert (=> b!1036248 (= lt!457070 lt!457068)))

(declare-fun res!691739 () Bool)

(declare-datatypes ((SeekEntryResult!9746 0))(
  ( (MissingZero!9746 (index!41355 (_ BitVec 32))) (Found!9746 (index!41356 (_ BitVec 32))) (Intermediate!9746 (undefined!10558 Bool) (index!41357 (_ BitVec 32)) (x!92472 (_ BitVec 32))) (Undefined!9746) (MissingVacant!9746 (index!41358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65292 (_ BitVec 32)) SeekEntryResult!9746)

(assert (=> b!1036248 (= res!691739 (= (seekEntryOrOpen!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) (_keys!11459 lt!456791) (mask!30171 lt!456791)) (Found!9746 #b00000000000000000000000000000000)))))

(assert (=> b!1036248 (=> (not res!691739) (not e!586050))))

(declare-fun b!1036249 () Bool)

(assert (=> b!1036249 (= e!586050 call!43848)))

(declare-fun b!1036250 () Bool)

(assert (=> b!1036250 (= e!586052 e!586051)))

(declare-fun c!104824 () Bool)

(assert (=> b!1036250 (= c!104824 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (= (and d!124693 (not res!691738)) b!1036250))

(assert (= (and b!1036250 c!104824) b!1036248))

(assert (= (and b!1036250 (not c!104824)) b!1036247))

(assert (= (and b!1036248 res!691739) b!1036249))

(assert (= (or b!1036249 b!1036247) bm!43845))

(declare-fun m!956249 () Bool)

(assert (=> bm!43845 m!956249))

(assert (=> b!1036248 m!955841))

(declare-fun m!956251 () Bool)

(assert (=> b!1036248 m!956251))

(declare-fun m!956253 () Bool)

(assert (=> b!1036248 m!956253))

(assert (=> b!1036248 m!955841))

(declare-fun m!956255 () Bool)

(assert (=> b!1036248 m!956255))

(assert (=> b!1036250 m!955841))

(assert (=> b!1036250 m!955841))

(assert (=> b!1036250 m!955843))

(assert (=> b!1036024 d!124693))

(declare-fun d!124695 () Bool)

(declare-fun e!586053 () Bool)

(assert (=> d!124695 e!586053))

(declare-fun res!691740 () Bool)

(assert (=> d!124695 (=> res!691740 e!586053)))

(declare-fun lt!457072 () Bool)

(assert (=> d!124695 (= res!691740 (not lt!457072))))

(declare-fun lt!457074 () Bool)

(assert (=> d!124695 (= lt!457072 lt!457074)))

(declare-fun lt!457071 () Unit!33894)

(declare-fun e!586054 () Unit!33894)

(assert (=> d!124695 (= lt!457071 e!586054)))

(declare-fun c!104825 () Bool)

(assert (=> d!124695 (= c!104825 lt!457074)))

(assert (=> d!124695 (= lt!457074 (containsKey!564 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124695 (= (contains!6021 lt!456890 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) lt!457072)))

(declare-fun b!1036251 () Bool)

(declare-fun lt!457073 () Unit!33894)

(assert (=> b!1036251 (= e!586054 lt!457073)))

(assert (=> b!1036251 (= lt!457073 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036251 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036252 () Bool)

(declare-fun Unit!33909 () Unit!33894)

(assert (=> b!1036252 (= e!586054 Unit!33909)))

(declare-fun b!1036253 () Bool)

(assert (=> b!1036253 (= e!586053 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124695 c!104825) b!1036251))

(assert (= (and d!124695 (not c!104825)) b!1036252))

(assert (= (and d!124695 (not res!691740)) b!1036253))

(assert (=> d!124695 m!955693))

(declare-fun m!956257 () Bool)

(assert (=> d!124695 m!956257))

(assert (=> b!1036251 m!955693))

(declare-fun m!956259 () Bool)

(assert (=> b!1036251 m!956259))

(assert (=> b!1036251 m!955693))

(declare-fun m!956261 () Bool)

(assert (=> b!1036251 m!956261))

(assert (=> b!1036251 m!956261))

(declare-fun m!956263 () Bool)

(assert (=> b!1036251 m!956263))

(assert (=> b!1036253 m!955693))

(assert (=> b!1036253 m!956261))

(assert (=> b!1036253 m!956261))

(assert (=> b!1036253 m!956263))

(assert (=> b!1036012 d!124695))

(declare-fun b!1036254 () Bool)

(declare-fun e!586055 () (_ BitVec 32))

(assert (=> b!1036254 (= e!586055 #b00000000000000000000000000000000)))

(declare-fun b!1036255 () Bool)

(declare-fun e!586056 () (_ BitVec 32))

(assert (=> b!1036255 (= e!586055 e!586056)))

(declare-fun c!104827 () Bool)

(assert (=> b!1036255 (= c!104827 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun d!124697 () Bool)

(declare-fun lt!457075 () (_ BitVec 32))

(assert (=> d!124697 (and (bvsge lt!457075 #b00000000000000000000000000000000) (bvsle lt!457075 (bvsub (size!31959 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (=> d!124697 (= lt!457075 e!586055)))

(declare-fun c!104826 () Bool)

(assert (=> d!124697 (= c!104826 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!124697 (and (bvsle #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31959 (_keys!11459 lt!456791)) (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!124697 (= (arrayCountValidKeys!0 (_keys!11459 lt!456791) #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))) lt!457075)))

(declare-fun b!1036256 () Bool)

(declare-fun call!43849 () (_ BitVec 32))

(assert (=> b!1036256 (= e!586056 (bvadd #b00000000000000000000000000000001 call!43849))))

(declare-fun bm!43846 () Bool)

(assert (=> bm!43846 (= call!43849 (arrayCountValidKeys!0 (_keys!11459 lt!456791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 lt!456791))))))

(declare-fun b!1036257 () Bool)

(assert (=> b!1036257 (= e!586056 call!43849)))

(assert (= (and d!124697 c!104826) b!1036254))

(assert (= (and d!124697 (not c!104826)) b!1036255))

(assert (= (and b!1036255 c!104827) b!1036256))

(assert (= (and b!1036255 (not c!104827)) b!1036257))

(assert (= (or b!1036256 b!1036257) bm!43846))

(assert (=> b!1036255 m!955841))

(assert (=> b!1036255 m!955841))

(assert (=> b!1036255 m!955843))

(declare-fun m!956265 () Bool)

(assert (=> bm!43846 m!956265))

(assert (=> b!1036023 d!124697))

(declare-fun b!1036261 () Bool)

(declare-fun e!586057 () Bool)

(assert (=> b!1036261 (= e!586057 (and (bvsge (extraKeys!6000 lt!456791) #b00000000000000000000000000000000) (bvsle (extraKeys!6000 lt!456791) #b00000000000000000000000000000011) (bvsge (_vacant!2947 lt!456791) #b00000000000000000000000000000000)))))

(declare-fun b!1036258 () Bool)

(declare-fun res!691742 () Bool)

(assert (=> b!1036258 (=> (not res!691742) (not e!586057))))

(assert (=> b!1036258 (= res!691742 (and (= (size!31960 (_values!6293 lt!456791)) (bvadd (mask!30171 lt!456791) #b00000000000000000000000000000001)) (= (size!31959 (_keys!11459 lt!456791)) (size!31960 (_values!6293 lt!456791))) (bvsge (_size!2947 lt!456791) #b00000000000000000000000000000000) (bvsle (_size!2947 lt!456791) (bvadd (mask!30171 lt!456791) #b00000000000000000000000000000001))))))

(declare-fun b!1036259 () Bool)

(declare-fun res!691741 () Bool)

(assert (=> b!1036259 (=> (not res!691741) (not e!586057))))

(assert (=> b!1036259 (= res!691741 (bvsge (size!31963 lt!456791) (_size!2947 lt!456791)))))

(declare-fun b!1036260 () Bool)

(declare-fun res!691743 () Bool)

(assert (=> b!1036260 (=> (not res!691743) (not e!586057))))

(assert (=> b!1036260 (= res!691743 (= (size!31963 lt!456791) (bvadd (_size!2947 lt!456791) (bvsdiv (bvadd (extraKeys!6000 lt!456791) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124699 () Bool)

(declare-fun res!691744 () Bool)

(assert (=> d!124699 (=> (not res!691744) (not e!586057))))

(assert (=> d!124699 (= res!691744 (validMask!0 (mask!30171 lt!456791)))))

(assert (=> d!124699 (= (simpleValid!414 lt!456791) e!586057)))

(assert (= (and d!124699 res!691744) b!1036258))

(assert (= (and b!1036258 res!691742) b!1036259))

(assert (= (and b!1036259 res!691741) b!1036260))

(assert (= (and b!1036260 res!691743) b!1036261))

(declare-fun m!956267 () Bool)

(assert (=> b!1036259 m!956267))

(assert (=> b!1036260 m!956267))

(assert (=> d!124699 m!955893))

(assert (=> d!124573 d!124699))

(declare-fun d!124701 () Bool)

(assert (=> d!124701 (= (apply!907 lt!456890 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16464 (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30334 () Bool)

(assert (= bs!30334 d!124701))

(assert (=> bs!30334 m!955831))

(assert (=> bs!30334 m!955831))

(declare-fun m!956269 () Bool)

(assert (=> bs!30334 m!956269))

(assert (=> b!1036010 d!124701))

(declare-fun d!124703 () Bool)

(declare-fun e!586058 () Bool)

(assert (=> d!124703 e!586058))

(declare-fun res!691745 () Bool)

(assert (=> d!124703 (=> res!691745 e!586058)))

(declare-fun lt!457077 () Bool)

(assert (=> d!124703 (= res!691745 (not lt!457077))))

(declare-fun lt!457079 () Bool)

(assert (=> d!124703 (= lt!457077 lt!457079)))

(declare-fun lt!457076 () Unit!33894)

(declare-fun e!586059 () Unit!33894)

(assert (=> d!124703 (= lt!457076 e!586059)))

(declare-fun c!104828 () Bool)

(assert (=> d!124703 (= c!104828 lt!457079)))

(assert (=> d!124703 (= lt!457079 (containsKey!564 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124703 (= (contains!6021 lt!456864 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457077)))

(declare-fun b!1036262 () Bool)

(declare-fun lt!457078 () Unit!33894)

(assert (=> b!1036262 (= e!586059 lt!457078)))

(assert (=> b!1036262 (= lt!457078 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036262 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036263 () Bool)

(declare-fun Unit!33910 () Unit!33894)

(assert (=> b!1036263 (= e!586059 Unit!33910)))

(declare-fun b!1036264 () Bool)

(assert (=> b!1036264 (= e!586058 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124703 c!104828) b!1036262))

(assert (= (and d!124703 (not c!104828)) b!1036263))

(assert (= (and d!124703 (not res!691745)) b!1036264))

(declare-fun m!956271 () Bool)

(assert (=> d!124703 m!956271))

(declare-fun m!956273 () Bool)

(assert (=> b!1036262 m!956273))

(assert (=> b!1036262 m!956209))

(assert (=> b!1036262 m!956209))

(declare-fun m!956275 () Bool)

(assert (=> b!1036262 m!956275))

(assert (=> b!1036264 m!956209))

(assert (=> b!1036264 m!956209))

(assert (=> b!1036264 m!956275))

(assert (=> bm!43813 d!124703))

(declare-fun b!1036265 () Bool)

(declare-fun e!586061 () Bool)

(declare-fun e!586063 () Bool)

(assert (=> b!1036265 (= e!586061 e!586063)))

(declare-fun res!691746 () Bool)

(assert (=> b!1036265 (=> (not res!691746) (not e!586063))))

(declare-fun e!586062 () Bool)

(assert (=> b!1036265 (= res!691746 (not e!586062))))

(declare-fun res!691748 () Bool)

(assert (=> b!1036265 (=> (not res!691748) (not e!586062))))

(assert (=> b!1036265 (= res!691748 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036266 () Bool)

(declare-fun e!586060 () Bool)

(assert (=> b!1036266 (= e!586063 e!586060)))

(declare-fun c!104829 () Bool)

(assert (=> b!1036266 (= c!104829 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124705 () Bool)

(declare-fun res!691747 () Bool)

(assert (=> d!124705 (=> res!691747 e!586061)))

(assert (=> d!124705 (= res!691747 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!124705 (= (arrayNoDuplicates!0 (_keys!11459 thiss!1427) #b00000000000000000000000000000000 Nil!21917) e!586061)))

(declare-fun bm!43847 () Bool)

(declare-fun call!43850 () Bool)

(assert (=> bm!43847 (= call!43850 (arrayNoDuplicates!0 (_keys!11459 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104829 (Cons!21916 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) Nil!21917) Nil!21917)))))

(declare-fun b!1036267 () Bool)

(assert (=> b!1036267 (= e!586060 call!43850)))

(declare-fun b!1036268 () Bool)

(assert (=> b!1036268 (= e!586062 (contains!6023 Nil!21917 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036269 () Bool)

(assert (=> b!1036269 (= e!586060 call!43850)))

(assert (= (and d!124705 (not res!691747)) b!1036265))

(assert (= (and b!1036265 res!691748) b!1036268))

(assert (= (and b!1036265 res!691746) b!1036266))

(assert (= (and b!1036266 c!104829) b!1036269))

(assert (= (and b!1036266 (not c!104829)) b!1036267))

(assert (= (or b!1036269 b!1036267) bm!43847))

(assert (=> b!1036265 m!955693))

(assert (=> b!1036265 m!955693))

(assert (=> b!1036265 m!955695))

(assert (=> b!1036266 m!955693))

(assert (=> b!1036266 m!955693))

(assert (=> b!1036266 m!955695))

(assert (=> bm!43847 m!955693))

(declare-fun m!956277 () Bool)

(assert (=> bm!43847 m!956277))

(assert (=> b!1036268 m!955693))

(assert (=> b!1036268 m!955693))

(declare-fun m!956279 () Bool)

(assert (=> b!1036268 m!956279))

(assert (=> b!1036028 d!124705))

(declare-fun d!124707 () Bool)

(assert (=> d!124707 (= (apply!907 lt!456890 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (get!16464 (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30335 () Bool)

(assert (= bs!30335 d!124707))

(assert (=> bs!30335 m!955693))

(assert (=> bs!30335 m!956261))

(assert (=> bs!30335 m!956261))

(declare-fun m!956281 () Bool)

(assert (=> bs!30335 m!956281))

(assert (=> b!1036007 d!124707))

(assert (=> b!1036007 d!124585))

(declare-fun bm!43848 () Bool)

(declare-fun call!43851 () Bool)

(assert (=> bm!43848 (= call!43851 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11459 thiss!1427) (mask!30171 thiss!1427)))))

(declare-fun b!1036270 () Bool)

(declare-fun e!586065 () Bool)

(assert (=> b!1036270 (= e!586065 call!43851)))

(declare-fun d!124709 () Bool)

(declare-fun res!691749 () Bool)

(declare-fun e!586066 () Bool)

(assert (=> d!124709 (=> res!691749 e!586066)))

(assert (=> d!124709 (= res!691749 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!124709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11459 thiss!1427) (mask!30171 thiss!1427)) e!586066)))

(declare-fun b!1036271 () Bool)

(declare-fun e!586064 () Bool)

(assert (=> b!1036271 (= e!586065 e!586064)))

(declare-fun lt!457081 () (_ BitVec 64))

(assert (=> b!1036271 (= lt!457081 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457080 () Unit!33894)

(assert (=> b!1036271 (= lt!457080 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11459 thiss!1427) lt!457081 #b00000000000000000000000000000000))))

(assert (=> b!1036271 (arrayContainsKey!0 (_keys!11459 thiss!1427) lt!457081 #b00000000000000000000000000000000)))

(declare-fun lt!457082 () Unit!33894)

(assert (=> b!1036271 (= lt!457082 lt!457080)))

(declare-fun res!691750 () Bool)

(assert (=> b!1036271 (= res!691750 (= (seekEntryOrOpen!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (_keys!11459 thiss!1427) (mask!30171 thiss!1427)) (Found!9746 #b00000000000000000000000000000000)))))

(assert (=> b!1036271 (=> (not res!691750) (not e!586064))))

(declare-fun b!1036272 () Bool)

(assert (=> b!1036272 (= e!586064 call!43851)))

(declare-fun b!1036273 () Bool)

(assert (=> b!1036273 (= e!586066 e!586065)))

(declare-fun c!104830 () Bool)

(assert (=> b!1036273 (= c!104830 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124709 (not res!691749)) b!1036273))

(assert (= (and b!1036273 c!104830) b!1036271))

(assert (= (and b!1036273 (not c!104830)) b!1036270))

(assert (= (and b!1036271 res!691750) b!1036272))

(assert (= (or b!1036272 b!1036270) bm!43848))

(declare-fun m!956283 () Bool)

(assert (=> bm!43848 m!956283))

(assert (=> b!1036271 m!955693))

(declare-fun m!956285 () Bool)

(assert (=> b!1036271 m!956285))

(declare-fun m!956287 () Bool)

(assert (=> b!1036271 m!956287))

(assert (=> b!1036271 m!955693))

(declare-fun m!956289 () Bool)

(assert (=> b!1036271 m!956289))

(assert (=> b!1036273 m!955693))

(assert (=> b!1036273 m!955693))

(assert (=> b!1036273 m!955695))

(assert (=> b!1036027 d!124709))

(declare-fun mapNonEmpty!38419 () Bool)

(declare-fun mapRes!38419 () Bool)

(declare-fun tp!73775 () Bool)

(declare-fun e!586068 () Bool)

(assert (=> mapNonEmpty!38419 (= mapRes!38419 (and tp!73775 e!586068))))

(declare-fun mapKey!38419 () (_ BitVec 32))

(declare-fun mapRest!38419 () (Array (_ BitVec 32) ValueCell!11595))

(declare-fun mapValue!38419 () ValueCell!11595)

(assert (=> mapNonEmpty!38419 (= mapRest!38418 (store mapRest!38419 mapKey!38419 mapValue!38419))))

(declare-fun b!1036274 () Bool)

(assert (=> b!1036274 (= e!586068 tp_is_empty!24597)))

(declare-fun mapIsEmpty!38419 () Bool)

(assert (=> mapIsEmpty!38419 mapRes!38419))

(declare-fun condMapEmpty!38419 () Bool)

(declare-fun mapDefault!38419 () ValueCell!11595)

(assert (=> mapNonEmpty!38418 (= condMapEmpty!38419 (= mapRest!38418 ((as const (Array (_ BitVec 32) ValueCell!11595)) mapDefault!38419)))))

(declare-fun e!586067 () Bool)

(assert (=> mapNonEmpty!38418 (= tp!73774 (and e!586067 mapRes!38419))))

(declare-fun b!1036275 () Bool)

(assert (=> b!1036275 (= e!586067 tp_is_empty!24597)))

(assert (= (and mapNonEmpty!38418 condMapEmpty!38419) mapIsEmpty!38419))

(assert (= (and mapNonEmpty!38418 (not condMapEmpty!38419)) mapNonEmpty!38419))

(assert (= (and mapNonEmpty!38419 ((_ is ValueCellFull!11595) mapValue!38419)) b!1036274))

(assert (= (and mapNonEmpty!38418 ((_ is ValueCellFull!11595) mapDefault!38419)) b!1036275))

(declare-fun m!956291 () Bool)

(assert (=> mapNonEmpty!38419 m!956291))

(declare-fun b_lambda!16127 () Bool)

(assert (= b_lambda!16125 (or (and b!1035903 b_free!20877) b_lambda!16127)))

(declare-fun b_lambda!16129 () Bool)

(assert (= b_lambda!16119 (or (and b!1035903 b_free!20877) b_lambda!16129)))

(declare-fun b_lambda!16131 () Bool)

(assert (= b_lambda!16121 (or (and b!1035903 b_free!20877) b_lambda!16131)))

(declare-fun b_lambda!16133 () Bool)

(assert (= b_lambda!16123 (or (and b!1035903 b_free!20877) b_lambda!16133)))

(check-sat (not d!124659) (not d!124653) (not b!1036142) (not b!1036262) (not d!124613) (not d!124643) (not b!1036117) (not b!1036264) (not d!124687) (not b!1036253) (not b!1036146) (not b!1036250) (not d!124595) (not d!124621) (not d!124673) (not b_lambda!16127) (not b!1036248) (not b!1036196) (not b!1036130) (not bm!43829) (not d!124631) (not b!1036071) (not d!124689) (not mapNonEmpty!38419) (not b!1036139) (not b!1036160) (not d!124661) (not b!1036062) tp_is_empty!24597 (not b!1036061) (not b!1036230) (not b!1036105) (not b_lambda!16117) (not d!124633) (not b!1036227) (not b!1036145) (not d!124639) (not d!124663) (not b!1036107) (not b!1036251) (not b!1036176) (not b!1036193) (not d!124611) (not b!1036063) (not bm!43847) (not d!124707) (not b!1036213) (not b!1036133) (not b!1036097) (not b!1036175) (not b!1036121) (not b!1036101) (not b!1036113) (not b!1036271) (not b!1036228) (not d!124619) (not b!1036216) (not b_lambda!16113) (not bm!43827) (not b!1036268) (not b!1036225) (not b!1036218) (not b!1036129) (not d!124615) (not b!1036041) (not b!1036098) (not b!1036123) (not b!1036226) (not d!124679) (not b!1036161) (not b!1036224) (not b_lambda!16107) (not bm!43835) (not b!1036056) (not b!1036147) (not d!124629) (not bm!43846) (not d!124623) (not b!1036221) (not bm!43845) (not b_next!20877) (not d!124589) (not b!1036182) (not d!124655) (not d!124583) (not d!124675) (not b!1036051) (not b!1036143) (not b!1036134) (not b!1036106) (not b!1036068) (not b!1036122) (not d!124657) (not b!1036049) (not b!1036197) (not b!1036265) (not b_lambda!16115) (not b!1036066) (not b_lambda!16131) (not b!1036212) (not b_lambda!16133) (not b!1036231) (not d!124627) (not b!1036260) (not d!124649) (not d!124681) (not b!1036124) (not b!1036178) (not d!124597) (not b!1036235) (not d!124607) (not d!124635) (not d!124699) (not d!124701) (not b!1036233) (not bm!43848) (not b!1036217) (not b!1036136) (not b!1036149) (not d!124617) (not b!1036259) (not b!1036192) (not d!124641) (not d!124625) (not b!1036132) (not d!124671) (not b!1036140) (not b!1036195) (not b!1036255) (not b!1036209) (not bm!43842) (not b!1036102) (not b_lambda!16129) (not d!124645) (not d!124703) (not d!124691) (not d!124677) (not d!124591) (not b!1036234) (not bm!43836) (not d!124609) (not bm!43839) (not b!1036042) b_and!33399 (not b!1036180) (not b!1036219) (not d!124647) (not d!124665) (not d!124587) (not d!124683) (not d!124599) (not b!1036223) (not d!124667) (not b!1036144) (not bm!43830) (not d!124669) (not b!1036266) (not d!124603) (not bm!43826) (not b!1036141) (not b!1036108) (not b!1036118) (not d!124685) (not b!1036199) (not d!124605) (not b!1036273) (not b!1036070) (not d!124695) (not b!1036114) (not d!124601))
(check-sat b_and!33399 (not b_next!20877))
(get-model)

(declare-fun lt!457085 () Bool)

(declare-fun d!124711 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!514 (List!21918) (InoxSet tuple2!15730))

(assert (=> d!124711 (= lt!457085 (select (content!514 (toList!6895 lt!457033)) (tuple2!15731 lt!456875 lt!456792)))))

(declare-fun e!586073 () Bool)

(assert (=> d!124711 (= lt!457085 e!586073)))

(declare-fun res!691755 () Bool)

(assert (=> d!124711 (=> (not res!691755) (not e!586073))))

(assert (=> d!124711 (= res!691755 ((_ is Cons!21914) (toList!6895 lt!457033)))))

(assert (=> d!124711 (= (contains!6022 (toList!6895 lt!457033) (tuple2!15731 lt!456875 lt!456792)) lt!457085)))

(declare-fun b!1036280 () Bool)

(declare-fun e!586074 () Bool)

(assert (=> b!1036280 (= e!586073 e!586074)))

(declare-fun res!691756 () Bool)

(assert (=> b!1036280 (=> res!691756 e!586074)))

(assert (=> b!1036280 (= res!691756 (= (h!23116 (toList!6895 lt!457033)) (tuple2!15731 lt!456875 lt!456792)))))

(declare-fun b!1036281 () Bool)

(assert (=> b!1036281 (= e!586074 (contains!6022 (t!31125 (toList!6895 lt!457033)) (tuple2!15731 lt!456875 lt!456792)))))

(assert (= (and d!124711 res!691755) b!1036280))

(assert (= (and b!1036280 (not res!691756)) b!1036281))

(declare-fun m!956293 () Bool)

(assert (=> d!124711 m!956293))

(declare-fun m!956295 () Bool)

(assert (=> d!124711 m!956295))

(declare-fun m!956297 () Bool)

(assert (=> b!1036281 m!956297))

(assert (=> b!1036217 d!124711))

(declare-fun b!1036282 () Bool)

(declare-fun e!586075 () Bool)

(declare-fun e!586077 () Bool)

(assert (=> b!1036282 (= e!586075 e!586077)))

(assert (=> b!1036282 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun res!691758 () Bool)

(declare-fun lt!457091 () ListLongMap!13759)

(assert (=> b!1036282 (= res!691758 (contains!6021 lt!457091 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036282 (=> (not res!691758) (not e!586077))))

(declare-fun b!1036283 () Bool)

(assert (=> b!1036283 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> b!1036283 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31960 (_values!6293 thiss!1427))))))

(assert (=> b!1036283 (= e!586077 (= (apply!907 lt!457091 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036284 () Bool)

(declare-fun e!586078 () ListLongMap!13759)

(declare-fun call!43852 () ListLongMap!13759)

(assert (=> b!1036284 (= e!586078 call!43852)))

(declare-fun b!1036285 () Bool)

(declare-fun e!586081 () ListLongMap!13759)

(assert (=> b!1036285 (= e!586081 (ListLongMap!13760 Nil!21915))))

(declare-fun d!124713 () Bool)

(declare-fun e!586076 () Bool)

(assert (=> d!124713 e!586076))

(declare-fun res!691759 () Bool)

(assert (=> d!124713 (=> (not res!691759) (not e!586076))))

(assert (=> d!124713 (= res!691759 (not (contains!6021 lt!457091 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124713 (= lt!457091 e!586081)))

(declare-fun c!104831 () Bool)

(assert (=> d!124713 (= c!104831 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!124713 (validMask!0 (mask!30171 thiss!1427))))

(assert (=> d!124713 (= (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427)) lt!457091)))

(declare-fun bm!43849 () Bool)

(assert (=> bm!43849 (= call!43852 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427)))))

(declare-fun e!586080 () Bool)

(declare-fun b!1036286 () Bool)

(assert (=> b!1036286 (= e!586080 (= lt!457091 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (bvand (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6104 thiss!1427) lt!456792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427))))))

(declare-fun b!1036287 () Bool)

(declare-fun e!586079 () Bool)

(assert (=> b!1036287 (= e!586079 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036287 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1036288 () Bool)

(assert (=> b!1036288 (= e!586075 e!586080)))

(declare-fun c!104832 () Bool)

(assert (=> b!1036288 (= c!104832 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036289 () Bool)

(assert (=> b!1036289 (= e!586076 e!586075)))

(declare-fun c!104834 () Bool)

(assert (=> b!1036289 (= c!104834 e!586079)))

(declare-fun res!691760 () Bool)

(assert (=> b!1036289 (=> (not res!691760) (not e!586079))))

(assert (=> b!1036289 (= res!691760 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036290 () Bool)

(assert (=> b!1036290 (= e!586080 (isEmpty!929 lt!457091))))

(declare-fun b!1036291 () Bool)

(declare-fun lt!457092 () Unit!33894)

(declare-fun lt!457089 () Unit!33894)

(assert (=> b!1036291 (= lt!457092 lt!457089)))

(declare-fun lt!457090 () (_ BitVec 64))

(declare-fun lt!457087 () (_ BitVec 64))

(declare-fun lt!457088 () V!37669)

(declare-fun lt!457086 () ListLongMap!13759)

(assert (=> b!1036291 (not (contains!6021 (+!3105 lt!457086 (tuple2!15731 lt!457090 lt!457088)) lt!457087))))

(assert (=> b!1036291 (= lt!457089 (addStillNotContains!243 lt!457086 lt!457090 lt!457088 lt!457087))))

(assert (=> b!1036291 (= lt!457087 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036291 (= lt!457088 (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036291 (= lt!457090 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1036291 (= lt!457086 call!43852)))

(assert (=> b!1036291 (= e!586078 (+!3105 call!43852 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036292 () Bool)

(declare-fun res!691757 () Bool)

(assert (=> b!1036292 (=> (not res!691757) (not e!586076))))

(assert (=> b!1036292 (= res!691757 (not (contains!6021 lt!457091 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036293 () Bool)

(assert (=> b!1036293 (= e!586081 e!586078)))

(declare-fun c!104833 () Bool)

(assert (=> b!1036293 (= c!104833 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124713 c!104831) b!1036285))

(assert (= (and d!124713 (not c!104831)) b!1036293))

(assert (= (and b!1036293 c!104833) b!1036291))

(assert (= (and b!1036293 (not c!104833)) b!1036284))

(assert (= (or b!1036291 b!1036284) bm!43849))

(assert (= (and d!124713 res!691759) b!1036292))

(assert (= (and b!1036292 res!691757) b!1036289))

(assert (= (and b!1036289 res!691760) b!1036287))

(assert (= (and b!1036289 c!104834) b!1036282))

(assert (= (and b!1036289 (not c!104834)) b!1036288))

(assert (= (and b!1036282 res!691758) b!1036283))

(assert (= (and b!1036288 c!104832) b!1036286))

(assert (= (and b!1036288 (not c!104832)) b!1036290))

(declare-fun b_lambda!16135 () Bool)

(assert (=> (not b_lambda!16135) (not b!1036283)))

(assert (=> b!1036283 t!31130))

(declare-fun b_and!33401 () Bool)

(assert (= b_and!33399 (and (=> t!31130 result!14427) b_and!33401)))

(declare-fun b_lambda!16137 () Bool)

(assert (=> (not b_lambda!16137) (not b!1036291)))

(assert (=> b!1036291 t!31130))

(declare-fun b_and!33403 () Bool)

(assert (= b_and!33401 (and (=> t!31130 result!14427) b_and!33403)))

(declare-fun m!956299 () Bool)

(assert (=> b!1036290 m!956299))

(declare-fun m!956301 () Bool)

(assert (=> b!1036287 m!956301))

(assert (=> b!1036287 m!956301))

(declare-fun m!956303 () Bool)

(assert (=> b!1036287 m!956303))

(assert (=> b!1036282 m!956301))

(assert (=> b!1036282 m!956301))

(declare-fun m!956305 () Bool)

(assert (=> b!1036282 m!956305))

(declare-fun m!956307 () Bool)

(assert (=> b!1036292 m!956307))

(declare-fun m!956309 () Bool)

(assert (=> bm!43849 m!956309))

(assert (=> b!1036293 m!956301))

(assert (=> b!1036293 m!956301))

(assert (=> b!1036293 m!956303))

(declare-fun m!956311 () Bool)

(assert (=> b!1036291 m!956311))

(declare-fun m!956313 () Bool)

(assert (=> b!1036291 m!956313))

(assert (=> b!1036291 m!955697))

(declare-fun m!956315 () Bool)

(assert (=> b!1036291 m!956315))

(assert (=> b!1036291 m!956313))

(assert (=> b!1036291 m!955697))

(assert (=> b!1036291 m!956301))

(declare-fun m!956317 () Bool)

(assert (=> b!1036291 m!956317))

(declare-fun m!956319 () Bool)

(assert (=> b!1036291 m!956319))

(assert (=> b!1036291 m!956311))

(declare-fun m!956321 () Bool)

(assert (=> b!1036291 m!956321))

(declare-fun m!956323 () Bool)

(assert (=> d!124713 m!956323))

(assert (=> d!124713 m!955745))

(assert (=> b!1036286 m!956309))

(assert (=> b!1036283 m!956301))

(declare-fun m!956325 () Bool)

(assert (=> b!1036283 m!956325))

(assert (=> b!1036283 m!956313))

(assert (=> b!1036283 m!955697))

(assert (=> b!1036283 m!956315))

(assert (=> b!1036283 m!956313))

(assert (=> b!1036283 m!955697))

(assert (=> b!1036283 m!956301))

(assert (=> bm!43835 d!124713))

(declare-fun d!124715 () Bool)

(assert (=> d!124715 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))) (v!14931 (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124707 d!124715))

(declare-fun b!1036303 () Bool)

(declare-fun e!586086 () Option!640)

(declare-fun e!586087 () Option!640)

(assert (=> b!1036303 (= e!586086 e!586087)))

(declare-fun c!104840 () Bool)

(assert (=> b!1036303 (= c!104840 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456890))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun d!124717 () Bool)

(declare-fun c!104839 () Bool)

(assert (=> d!124717 (= c!104839 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (= (_1!7876 (h!23116 (toList!6895 lt!456890))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124717 (= (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) e!586086)))

(declare-fun b!1036304 () Bool)

(assert (=> b!1036304 (= e!586087 (getValueByKey!589 (t!31125 (toList!6895 lt!456890)) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036302 () Bool)

(assert (=> b!1036302 (= e!586086 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456890)))))))

(declare-fun b!1036305 () Bool)

(assert (=> b!1036305 (= e!586087 None!638)))

(assert (= (and d!124717 c!104839) b!1036302))

(assert (= (and d!124717 (not c!104839)) b!1036303))

(assert (= (and b!1036303 c!104840) b!1036304))

(assert (= (and b!1036303 (not c!104840)) b!1036305))

(assert (=> b!1036304 m!955693))

(declare-fun m!956327 () Bool)

(assert (=> b!1036304 m!956327))

(assert (=> d!124707 d!124717))

(declare-fun b!1036306 () Bool)

(declare-fun e!586088 () (_ BitVec 32))

(assert (=> b!1036306 (= e!586088 #b00000000000000000000000000000000)))

(declare-fun b!1036307 () Bool)

(declare-fun e!586089 () (_ BitVec 32))

(assert (=> b!1036307 (= e!586088 e!586089)))

(declare-fun c!104842 () Bool)

(assert (=> b!1036307 (= c!104842 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124719 () Bool)

(declare-fun lt!457093 () (_ BitVec 32))

(assert (=> d!124719 (and (bvsge lt!457093 #b00000000000000000000000000000000) (bvsle lt!457093 (bvsub (size!31959 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!124719 (= lt!457093 e!586088)))

(declare-fun c!104841 () Bool)

(assert (=> d!124719 (= c!104841 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!124719 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 lt!456791))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31959 (_keys!11459 lt!456791)) (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!124719 (= (arrayCountValidKeys!0 (_keys!11459 lt!456791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 lt!456791))) lt!457093)))

(declare-fun b!1036308 () Bool)

(declare-fun call!43853 () (_ BitVec 32))

(assert (=> b!1036308 (= e!586089 (bvadd #b00000000000000000000000000000001 call!43853))))

(declare-fun bm!43850 () Bool)

(assert (=> bm!43850 (= call!43853 (arrayCountValidKeys!0 (_keys!11459 lt!456791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31959 (_keys!11459 lt!456791))))))

(declare-fun b!1036309 () Bool)

(assert (=> b!1036309 (= e!586089 call!43853)))

(assert (= (and d!124719 c!104841) b!1036306))

(assert (= (and d!124719 (not c!104841)) b!1036307))

(assert (= (and b!1036307 c!104842) b!1036308))

(assert (= (and b!1036307 (not c!104842)) b!1036309))

(assert (= (or b!1036308 b!1036309) bm!43850))

(declare-fun m!956329 () Bool)

(assert (=> b!1036307 m!956329))

(assert (=> b!1036307 m!956329))

(declare-fun m!956331 () Bool)

(assert (=> b!1036307 m!956331))

(declare-fun m!956333 () Bool)

(assert (=> bm!43850 m!956333))

(assert (=> bm!43846 d!124719))

(declare-fun d!124721 () Bool)

(assert (=> d!124721 (= (get!16465 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14929 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036041 d!124721))

(declare-fun d!124723 () Bool)

(declare-fun lt!457094 () Bool)

(assert (=> d!124723 (= lt!457094 (select (content!514 (toList!6895 lt!456993)) (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))

(declare-fun e!586090 () Bool)

(assert (=> d!124723 (= lt!457094 e!586090)))

(declare-fun res!691761 () Bool)

(assert (=> d!124723 (=> (not res!691761) (not e!586090))))

(assert (=> d!124723 (= res!691761 ((_ is Cons!21914) (toList!6895 lt!456993)))))

(assert (=> d!124723 (= (contains!6022 (toList!6895 lt!456993) (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) lt!457094)))

(declare-fun b!1036310 () Bool)

(declare-fun e!586091 () Bool)

(assert (=> b!1036310 (= e!586090 e!586091)))

(declare-fun res!691762 () Bool)

(assert (=> b!1036310 (=> res!691762 e!586091)))

(assert (=> b!1036310 (= res!691762 (= (h!23116 (toList!6895 lt!456993)) (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))

(declare-fun b!1036311 () Bool)

(assert (=> b!1036311 (= e!586091 (contains!6022 (t!31125 (toList!6895 lt!456993)) (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))

(assert (= (and d!124723 res!691761) b!1036310))

(assert (= (and b!1036310 (not res!691762)) b!1036311))

(declare-fun m!956335 () Bool)

(assert (=> d!124723 m!956335))

(declare-fun m!956337 () Bool)

(assert (=> d!124723 m!956337))

(declare-fun m!956339 () Bool)

(assert (=> b!1036311 m!956339))

(assert (=> b!1036142 d!124723))

(declare-fun d!124725 () Bool)

(assert (=> d!124725 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14931 (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124683 d!124725))

(declare-fun b!1036313 () Bool)

(declare-fun e!586092 () Option!640)

(declare-fun e!586093 () Option!640)

(assert (=> b!1036313 (= e!586092 e!586093)))

(declare-fun c!104844 () Bool)

(assert (=> b!1036313 (= c!104844 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456864))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!124727 () Bool)

(declare-fun c!104843 () Bool)

(assert (=> d!124727 (= c!104843 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (= (_1!7876 (h!23116 (toList!6895 lt!456864))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124727 (= (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000) e!586092)))

(declare-fun b!1036314 () Bool)

(assert (=> b!1036314 (= e!586093 (getValueByKey!589 (t!31125 (toList!6895 lt!456864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036312 () Bool)

(assert (=> b!1036312 (= e!586092 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456864)))))))

(declare-fun b!1036315 () Bool)

(assert (=> b!1036315 (= e!586093 None!638)))

(assert (= (and d!124727 c!104843) b!1036312))

(assert (= (and d!124727 (not c!104843)) b!1036313))

(assert (= (and b!1036313 c!104844) b!1036314))

(assert (= (and b!1036313 (not c!104844)) b!1036315))

(declare-fun m!956341 () Bool)

(assert (=> b!1036314 m!956341))

(assert (=> d!124683 d!124727))

(declare-fun d!124729 () Bool)

(assert (=> d!124729 (= (apply!907 lt!456924 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16464 (getValueByKey!589 (toList!6895 lt!456924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30336 () Bool)

(assert (= bs!30336 d!124729))

(declare-fun m!956343 () Bool)

(assert (=> bs!30336 m!956343))

(assert (=> bs!30336 m!956343))

(declare-fun m!956345 () Bool)

(assert (=> bs!30336 m!956345))

(assert (=> b!1036056 d!124729))

(assert (=> b!1036118 d!124581))

(assert (=> d!124623 d!124615))

(declare-fun d!124731 () Bool)

(assert (=> d!124731 (= (apply!907 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) lt!456868) (apply!907 lt!456854 lt!456868))))

(assert (=> d!124731 true))

(declare-fun _$34!1172 () Unit!33894)

(assert (=> d!124731 (= (choose!1703 lt!456854 lt!456849 (minValue!6106 thiss!1427) lt!456868) _$34!1172)))

(declare-fun bs!30337 () Bool)

(assert (= bs!30337 d!124731))

(assert (=> bs!30337 m!955723))

(assert (=> bs!30337 m!955723))

(assert (=> bs!30337 m!955725))

(assert (=> bs!30337 m!955711))

(assert (=> d!124623 d!124731))

(declare-fun d!124733 () Bool)

(declare-fun e!586094 () Bool)

(assert (=> d!124733 e!586094))

(declare-fun res!691763 () Bool)

(assert (=> d!124733 (=> res!691763 e!586094)))

(declare-fun lt!457096 () Bool)

(assert (=> d!124733 (= res!691763 (not lt!457096))))

(declare-fun lt!457098 () Bool)

(assert (=> d!124733 (= lt!457096 lt!457098)))

(declare-fun lt!457095 () Unit!33894)

(declare-fun e!586095 () Unit!33894)

(assert (=> d!124733 (= lt!457095 e!586095)))

(declare-fun c!104845 () Bool)

(assert (=> d!124733 (= c!104845 lt!457098)))

(assert (=> d!124733 (= lt!457098 (containsKey!564 (toList!6895 lt!456854) lt!456868))))

(assert (=> d!124733 (= (contains!6021 lt!456854 lt!456868) lt!457096)))

(declare-fun b!1036317 () Bool)

(declare-fun lt!457097 () Unit!33894)

(assert (=> b!1036317 (= e!586095 lt!457097)))

(assert (=> b!1036317 (= lt!457097 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456854) lt!456868))))

(assert (=> b!1036317 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456854) lt!456868))))

(declare-fun b!1036318 () Bool)

(declare-fun Unit!33911 () Unit!33894)

(assert (=> b!1036318 (= e!586095 Unit!33911)))

(declare-fun b!1036319 () Bool)

(assert (=> b!1036319 (= e!586094 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456854) lt!456868)))))

(assert (= (and d!124733 c!104845) b!1036317))

(assert (= (and d!124733 (not c!104845)) b!1036318))

(assert (= (and d!124733 (not res!691763)) b!1036319))

(declare-fun m!956347 () Bool)

(assert (=> d!124733 m!956347))

(declare-fun m!956349 () Bool)

(assert (=> b!1036317 m!956349))

(assert (=> b!1036317 m!955955))

(assert (=> b!1036317 m!955955))

(declare-fun m!956351 () Bool)

(assert (=> b!1036317 m!956351))

(assert (=> b!1036319 m!955955))

(assert (=> b!1036319 m!955955))

(assert (=> b!1036319 m!956351))

(assert (=> d!124623 d!124733))

(assert (=> d!124623 d!124605))

(assert (=> d!124623 d!124607))

(declare-fun d!124735 () Bool)

(declare-fun e!586096 () Bool)

(assert (=> d!124735 e!586096))

(declare-fun res!691764 () Bool)

(assert (=> d!124735 (=> res!691764 e!586096)))

(declare-fun lt!457100 () Bool)

(assert (=> d!124735 (= res!691764 (not lt!457100))))

(declare-fun lt!457102 () Bool)

(assert (=> d!124735 (= lt!457100 lt!457102)))

(declare-fun lt!457099 () Unit!33894)

(declare-fun e!586097 () Unit!33894)

(assert (=> d!124735 (= lt!457099 e!586097)))

(declare-fun c!104846 () Bool)

(assert (=> d!124735 (= c!104846 lt!457102)))

(assert (=> d!124735 (= lt!457102 (containsKey!564 (toList!6895 lt!457027) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124735 (= (contains!6021 lt!457027 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!457100)))

(declare-fun b!1036320 () Bool)

(declare-fun lt!457101 () Unit!33894)

(assert (=> b!1036320 (= e!586097 lt!457101)))

(assert (=> b!1036320 (= lt!457101 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!457027) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(assert (=> b!1036320 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457027) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036321 () Bool)

(declare-fun Unit!33912 () Unit!33894)

(assert (=> b!1036321 (= e!586097 Unit!33912)))

(declare-fun b!1036322 () Bool)

(assert (=> b!1036322 (= e!586096 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457027) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(assert (= (and d!124735 c!104846) b!1036320))

(assert (= (and d!124735 (not c!104846)) b!1036321))

(assert (= (and d!124735 (not res!691764)) b!1036322))

(declare-fun m!956353 () Bool)

(assert (=> d!124735 m!956353))

(declare-fun m!956355 () Bool)

(assert (=> b!1036320 m!956355))

(assert (=> b!1036320 m!956121))

(assert (=> b!1036320 m!956121))

(declare-fun m!956357 () Bool)

(assert (=> b!1036320 m!956357))

(assert (=> b!1036322 m!956121))

(assert (=> b!1036322 m!956121))

(assert (=> b!1036322 m!956357))

(assert (=> d!124653 d!124735))

(declare-fun b!1036324 () Bool)

(declare-fun e!586098 () Option!640)

(declare-fun e!586099 () Option!640)

(assert (=> b!1036324 (= e!586098 e!586099)))

(declare-fun c!104848 () Bool)

(assert (=> b!1036324 (= c!104848 (and ((_ is Cons!21914) lt!457026) (not (= (_1!7876 (h!23116 lt!457026)) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!104847 () Bool)

(declare-fun d!124737 () Bool)

(assert (=> d!124737 (= c!104847 (and ((_ is Cons!21914) lt!457026) (= (_1!7876 (h!23116 lt!457026)) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!124737 (= (getValueByKey!589 lt!457026 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) e!586098)))

(declare-fun b!1036325 () Bool)

(assert (=> b!1036325 (= e!586099 (getValueByKey!589 (t!31125 lt!457026) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036323 () Bool)

(assert (=> b!1036323 (= e!586098 (Some!639 (_2!7876 (h!23116 lt!457026))))))

(declare-fun b!1036326 () Bool)

(assert (=> b!1036326 (= e!586099 None!638)))

(assert (= (and d!124737 c!104847) b!1036323))

(assert (= (and d!124737 (not c!104847)) b!1036324))

(assert (= (and b!1036324 c!104848) b!1036325))

(assert (= (and b!1036324 (not c!104848)) b!1036326))

(declare-fun m!956359 () Bool)

(assert (=> b!1036325 m!956359))

(assert (=> d!124653 d!124737))

(declare-fun d!124739 () Bool)

(assert (=> d!124739 (= (getValueByKey!589 lt!457026 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun lt!457105 () Unit!33894)

(declare-fun choose!1705 (List!21918 (_ BitVec 64) V!37669) Unit!33894)

(assert (=> d!124739 (= lt!457105 (choose!1705 lt!457026 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun e!586102 () Bool)

(assert (=> d!124739 e!586102))

(declare-fun res!691769 () Bool)

(assert (=> d!124739 (=> (not res!691769) (not e!586102))))

(assert (=> d!124739 (= res!691769 (isStrictlySorted!719 lt!457026))))

(assert (=> d!124739 (= (lemmaContainsTupThenGetReturnValue!280 lt!457026 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!457105)))

(declare-fun b!1036331 () Bool)

(declare-fun res!691770 () Bool)

(assert (=> b!1036331 (=> (not res!691770) (not e!586102))))

(assert (=> b!1036331 (= res!691770 (containsKey!564 lt!457026 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036332 () Bool)

(assert (=> b!1036332 (= e!586102 (contains!6022 lt!457026 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(assert (= (and d!124739 res!691769) b!1036331))

(assert (= (and b!1036331 res!691770) b!1036332))

(assert (=> d!124739 m!956115))

(declare-fun m!956361 () Bool)

(assert (=> d!124739 m!956361))

(declare-fun m!956363 () Bool)

(assert (=> d!124739 m!956363))

(declare-fun m!956365 () Bool)

(assert (=> b!1036331 m!956365))

(declare-fun m!956367 () Bool)

(assert (=> b!1036332 m!956367))

(assert (=> d!124653 d!124739))

(declare-fun e!586116 () List!21918)

(declare-fun b!1036353 () Bool)

(assert (=> b!1036353 (= e!586116 (insertStrictlySorted!373 (t!31125 (toList!6895 lt!456886)) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036354 () Bool)

(declare-fun e!586115 () List!21918)

(declare-fun call!43862 () List!21918)

(assert (=> b!1036354 (= e!586115 call!43862)))

(declare-fun bm!43857 () Bool)

(declare-fun call!43860 () List!21918)

(assert (=> bm!43857 (= call!43862 call!43860)))

(declare-fun b!1036355 () Bool)

(declare-fun e!586117 () List!21918)

(assert (=> b!1036355 (= e!586117 call!43860)))

(declare-fun b!1036356 () Bool)

(declare-fun e!586113 () List!21918)

(declare-fun call!43861 () List!21918)

(assert (=> b!1036356 (= e!586113 call!43861)))

(declare-fun b!1036357 () Bool)

(declare-fun res!691776 () Bool)

(declare-fun e!586114 () Bool)

(assert (=> b!1036357 (=> (not res!691776) (not e!586114))))

(declare-fun lt!457108 () List!21918)

(assert (=> b!1036357 (= res!691776 (containsKey!564 lt!457108 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun c!104857 () Bool)

(declare-fun b!1036359 () Bool)

(assert (=> b!1036359 (= c!104857 (and ((_ is Cons!21914) (toList!6895 lt!456886)) (bvsgt (_1!7876 (h!23116 (toList!6895 lt!456886))) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(assert (=> b!1036359 (= e!586115 e!586113)))

(declare-fun b!1036360 () Bool)

(assert (=> b!1036360 (= e!586113 call!43861)))

(declare-fun b!1036361 () Bool)

(assert (=> b!1036361 (= e!586114 (contains!6022 lt!457108 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(declare-fun bm!43858 () Bool)

(declare-fun c!104858 () Bool)

(assert (=> bm!43858 (= call!43860 ($colon$colon!603 e!586116 (ite c!104858 (h!23116 (toList!6895 lt!456886)) (tuple2!15731 (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!104859 () Bool)

(assert (=> bm!43858 (= c!104859 c!104858)))

(declare-fun b!1036362 () Bool)

(assert (=> b!1036362 (= e!586117 e!586115)))

(declare-fun c!104860 () Bool)

(assert (=> b!1036362 (= c!104860 (and ((_ is Cons!21914) (toList!6895 lt!456886)) (= (_1!7876 (h!23116 (toList!6895 lt!456886))) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(declare-fun bm!43859 () Bool)

(assert (=> bm!43859 (= call!43861 call!43862)))

(declare-fun b!1036358 () Bool)

(assert (=> b!1036358 (= e!586116 (ite c!104860 (t!31125 (toList!6895 lt!456886)) (ite c!104857 (Cons!21914 (h!23116 (toList!6895 lt!456886)) (t!31125 (toList!6895 lt!456886))) Nil!21915)))))

(declare-fun d!124741 () Bool)

(assert (=> d!124741 e!586114))

(declare-fun res!691775 () Bool)

(assert (=> d!124741 (=> (not res!691775) (not e!586114))))

(assert (=> d!124741 (= res!691775 (isStrictlySorted!719 lt!457108))))

(assert (=> d!124741 (= lt!457108 e!586117)))

(assert (=> d!124741 (= c!104858 (and ((_ is Cons!21914) (toList!6895 lt!456886)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456886))) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!124741 (isStrictlySorted!719 (toList!6895 lt!456886))))

(assert (=> d!124741 (= (insertStrictlySorted!373 (toList!6895 lt!456886) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!457108)))

(assert (= (and d!124741 c!104858) b!1036355))

(assert (= (and d!124741 (not c!104858)) b!1036362))

(assert (= (and b!1036362 c!104860) b!1036354))

(assert (= (and b!1036362 (not c!104860)) b!1036359))

(assert (= (and b!1036359 c!104857) b!1036360))

(assert (= (and b!1036359 (not c!104857)) b!1036356))

(assert (= (or b!1036360 b!1036356) bm!43859))

(assert (= (or b!1036354 bm!43859) bm!43857))

(assert (= (or b!1036355 bm!43857) bm!43858))

(assert (= (and bm!43858 c!104859) b!1036353))

(assert (= (and bm!43858 (not c!104859)) b!1036358))

(assert (= (and d!124741 res!691775) b!1036357))

(assert (= (and b!1036357 res!691776) b!1036361))

(declare-fun m!956369 () Bool)

(assert (=> b!1036361 m!956369))

(declare-fun m!956371 () Bool)

(assert (=> b!1036353 m!956371))

(declare-fun m!956373 () Bool)

(assert (=> b!1036357 m!956373))

(declare-fun m!956375 () Bool)

(assert (=> bm!43858 m!956375))

(declare-fun m!956377 () Bool)

(assert (=> d!124741 m!956377))

(declare-fun m!956379 () Bool)

(assert (=> d!124741 m!956379))

(assert (=> d!124653 d!124741))

(declare-fun d!124743 () Bool)

(declare-fun res!691781 () Bool)

(declare-fun e!586122 () Bool)

(assert (=> d!124743 (=> res!691781 e!586122)))

(assert (=> d!124743 (= res!691781 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (= (_1!7876 (h!23116 (toList!6895 lt!456890))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124743 (= (containsKey!564 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000) e!586122)))

(declare-fun b!1036367 () Bool)

(declare-fun e!586123 () Bool)

(assert (=> b!1036367 (= e!586122 e!586123)))

(declare-fun res!691782 () Bool)

(assert (=> b!1036367 (=> (not res!691782) (not e!586123))))

(assert (=> b!1036367 (= res!691782 (and (or (not ((_ is Cons!21914) (toList!6895 lt!456890))) (bvsle (_1!7876 (h!23116 (toList!6895 lt!456890))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21914) (toList!6895 lt!456890)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456890))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036368 () Bool)

(assert (=> b!1036368 (= e!586123 (containsKey!564 (t!31125 (toList!6895 lt!456890)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124743 (not res!691781)) b!1036367))

(assert (= (and b!1036367 res!691782) b!1036368))

(declare-fun m!956381 () Bool)

(assert (=> b!1036368 m!956381))

(assert (=> d!124639 d!124743))

(declare-fun b!1036370 () Bool)

(declare-fun e!586124 () Option!640)

(declare-fun e!586125 () Option!640)

(assert (=> b!1036370 (= e!586124 e!586125)))

(declare-fun c!104862 () Bool)

(assert (=> b!1036370 (= c!104862 (and ((_ is Cons!21914) (toList!6895 lt!457016)) (not (= (_1!7876 (h!23116 (toList!6895 lt!457016))) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))))

(declare-fun d!124745 () Bool)

(declare-fun c!104861 () Bool)

(assert (=> d!124745 (= c!104861 (and ((_ is Cons!21914) (toList!6895 lt!457016)) (= (_1!7876 (h!23116 (toList!6895 lt!457016))) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(assert (=> d!124745 (= (getValueByKey!589 (toList!6895 lt!457016) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))) e!586124)))

(declare-fun b!1036371 () Bool)

(assert (=> b!1036371 (= e!586125 (getValueByKey!589 (t!31125 (toList!6895 lt!457016)) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036369 () Bool)

(assert (=> b!1036369 (= e!586124 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!457016)))))))

(declare-fun b!1036372 () Bool)

(assert (=> b!1036372 (= e!586125 None!638)))

(assert (= (and d!124745 c!104861) b!1036369))

(assert (= (and d!124745 (not c!104861)) b!1036370))

(assert (= (and b!1036370 c!104862) b!1036371))

(assert (= (and b!1036370 (not c!104862)) b!1036372))

(declare-fun m!956383 () Bool)

(assert (=> b!1036371 m!956383))

(assert (=> b!1036195 d!124745))

(declare-fun d!124747 () Bool)

(declare-fun e!586126 () Bool)

(assert (=> d!124747 e!586126))

(declare-fun res!691783 () Bool)

(assert (=> d!124747 (=> res!691783 e!586126)))

(declare-fun lt!457110 () Bool)

(assert (=> d!124747 (= res!691783 (not lt!457110))))

(declare-fun lt!457112 () Bool)

(assert (=> d!124747 (= lt!457110 lt!457112)))

(declare-fun lt!457109 () Unit!33894)

(declare-fun e!586127 () Unit!33894)

(assert (=> d!124747 (= lt!457109 e!586127)))

(declare-fun c!104863 () Bool)

(assert (=> d!124747 (= c!104863 lt!457112)))

(assert (=> d!124747 (= lt!457112 (containsKey!564 (toList!6895 lt!456924) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124747 (= (contains!6021 lt!456924 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457110)))

(declare-fun b!1036373 () Bool)

(declare-fun lt!457111 () Unit!33894)

(assert (=> b!1036373 (= e!586127 lt!457111)))

(assert (=> b!1036373 (= lt!457111 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456924) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036373 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456924) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036374 () Bool)

(declare-fun Unit!33913 () Unit!33894)

(assert (=> b!1036374 (= e!586127 Unit!33913)))

(declare-fun b!1036375 () Bool)

(assert (=> b!1036375 (= e!586126 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456924) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124747 c!104863) b!1036373))

(assert (= (and d!124747 (not c!104863)) b!1036374))

(assert (= (and d!124747 (not res!691783)) b!1036375))

(declare-fun m!956385 () Bool)

(assert (=> d!124747 m!956385))

(declare-fun m!956387 () Bool)

(assert (=> b!1036373 m!956387))

(declare-fun m!956389 () Bool)

(assert (=> b!1036373 m!956389))

(assert (=> b!1036373 m!956389))

(declare-fun m!956391 () Bool)

(assert (=> b!1036373 m!956391))

(assert (=> b!1036375 m!956389))

(assert (=> b!1036375 m!956389))

(assert (=> b!1036375 m!956391))

(assert (=> bm!43826 d!124747))

(assert (=> d!124641 d!124593))

(declare-fun d!124749 () Bool)

(declare-fun isEmpty!930 (Option!640) Bool)

(assert (=> d!124749 (= (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!930 (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30338 () Bool)

(assert (= bs!30338 d!124749))

(assert (=> bs!30338 m!956209))

(declare-fun m!956393 () Bool)

(assert (=> bs!30338 m!956393))

(assert (=> b!1036264 d!124749))

(assert (=> b!1036264 d!124727))

(declare-fun d!124751 () Bool)

(assert (=> d!124751 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457115 () Unit!33894)

(declare-fun choose!1706 (List!21918 (_ BitVec 64)) Unit!33894)

(assert (=> d!124751 (= lt!457115 (choose!1706 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586130 () Bool)

(assert (=> d!124751 e!586130))

(declare-fun res!691786 () Bool)

(assert (=> d!124751 (=> (not res!691786) (not e!586130))))

(assert (=> d!124751 (= res!691786 (isStrictlySorted!719 (toList!6895 lt!456890)))))

(assert (=> d!124751 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457115)))

(declare-fun b!1036378 () Bool)

(assert (=> b!1036378 (= e!586130 (containsKey!564 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124751 res!691786) b!1036378))

(assert (=> d!124751 m!956081))

(assert (=> d!124751 m!956081))

(assert (=> d!124751 m!956083))

(declare-fun m!956395 () Bool)

(assert (=> d!124751 m!956395))

(declare-fun m!956397 () Bool)

(assert (=> d!124751 m!956397))

(assert (=> b!1036378 m!956077))

(assert (=> b!1036180 d!124751))

(declare-fun d!124753 () Bool)

(assert (=> d!124753 (= (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!930 (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30339 () Bool)

(assert (= bs!30339 d!124753))

(assert (=> bs!30339 m!956081))

(declare-fun m!956399 () Bool)

(assert (=> bs!30339 m!956399))

(assert (=> b!1036180 d!124753))

(declare-fun b!1036380 () Bool)

(declare-fun e!586131 () Option!640)

(declare-fun e!586132 () Option!640)

(assert (=> b!1036380 (= e!586131 e!586132)))

(declare-fun c!104865 () Bool)

(assert (=> b!1036380 (= c!104865 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456890))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!124755 () Bool)

(declare-fun c!104864 () Bool)

(assert (=> d!124755 (= c!104864 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (= (_1!7876 (h!23116 (toList!6895 lt!456890))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124755 (= (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000) e!586131)))

(declare-fun b!1036381 () Bool)

(assert (=> b!1036381 (= e!586132 (getValueByKey!589 (t!31125 (toList!6895 lt!456890)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036379 () Bool)

(assert (=> b!1036379 (= e!586131 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456890)))))))

(declare-fun b!1036382 () Bool)

(assert (=> b!1036382 (= e!586132 None!638)))

(assert (= (and d!124755 c!104864) b!1036379))

(assert (= (and d!124755 (not c!104864)) b!1036380))

(assert (= (and b!1036380 c!104865) b!1036381))

(assert (= (and b!1036380 (not c!104865)) b!1036382))

(declare-fun m!956401 () Bool)

(assert (=> b!1036381 m!956401))

(assert (=> b!1036180 d!124755))

(declare-fun d!124757 () Bool)

(assert (=> d!124757 (= (size!31963 lt!456791) (bvadd (_size!2947 lt!456791) (bvsdiv (bvadd (extraKeys!6000 lt!456791) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1036260 d!124757))

(declare-fun d!124759 () Bool)

(assert (=> d!124759 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456880) lt!456894)) (v!14931 (getValueByKey!589 (toList!6895 lt!456880) lt!456894)))))

(assert (=> d!124675 d!124759))

(declare-fun b!1036384 () Bool)

(declare-fun e!586133 () Option!640)

(declare-fun e!586134 () Option!640)

(assert (=> b!1036384 (= e!586133 e!586134)))

(declare-fun c!104867 () Bool)

(assert (=> b!1036384 (= c!104867 (and ((_ is Cons!21914) (toList!6895 lt!456880)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456880))) lt!456894))))))

(declare-fun d!124761 () Bool)

(declare-fun c!104866 () Bool)

(assert (=> d!124761 (= c!104866 (and ((_ is Cons!21914) (toList!6895 lt!456880)) (= (_1!7876 (h!23116 (toList!6895 lt!456880))) lt!456894)))))

(assert (=> d!124761 (= (getValueByKey!589 (toList!6895 lt!456880) lt!456894) e!586133)))

(declare-fun b!1036385 () Bool)

(assert (=> b!1036385 (= e!586134 (getValueByKey!589 (t!31125 (toList!6895 lt!456880)) lt!456894))))

(declare-fun b!1036383 () Bool)

(assert (=> b!1036383 (= e!586133 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456880)))))))

(declare-fun b!1036386 () Bool)

(assert (=> b!1036386 (= e!586134 None!638)))

(assert (= (and d!124761 c!104866) b!1036383))

(assert (= (and d!124761 (not c!104866)) b!1036384))

(assert (= (and b!1036384 c!104867) b!1036385))

(assert (= (and b!1036384 (not c!104867)) b!1036386))

(declare-fun m!956403 () Bool)

(assert (=> b!1036385 m!956403))

(assert (=> d!124675 d!124761))

(declare-fun d!124763 () Bool)

(declare-fun e!586135 () Bool)

(assert (=> d!124763 e!586135))

(declare-fun res!691787 () Bool)

(assert (=> d!124763 (=> res!691787 e!586135)))

(declare-fun lt!457117 () Bool)

(assert (=> d!124763 (= res!691787 (not lt!457117))))

(declare-fun lt!457119 () Bool)

(assert (=> d!124763 (= lt!457117 lt!457119)))

(declare-fun lt!457116 () Unit!33894)

(declare-fun e!586136 () Unit!33894)

(assert (=> d!124763 (= lt!457116 e!586136)))

(declare-fun c!104868 () Bool)

(assert (=> d!124763 (= c!104868 lt!457119)))

(assert (=> d!124763 (= lt!457119 (containsKey!564 (toList!6895 lt!456960) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124763 (= (contains!6021 lt!456960 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457117)))

(declare-fun b!1036387 () Bool)

(declare-fun lt!457118 () Unit!33894)

(assert (=> b!1036387 (= e!586136 lt!457118)))

(assert (=> b!1036387 (= lt!457118 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456960) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036387 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456960) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036388 () Bool)

(declare-fun Unit!33914 () Unit!33894)

(assert (=> b!1036388 (= e!586136 Unit!33914)))

(declare-fun b!1036389 () Bool)

(assert (=> b!1036389 (= e!586135 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124763 c!104868) b!1036387))

(assert (= (and d!124763 (not c!104868)) b!1036388))

(assert (= (and d!124763 (not res!691787)) b!1036389))

(declare-fun m!956405 () Bool)

(assert (=> d!124763 m!956405))

(declare-fun m!956407 () Bool)

(assert (=> b!1036387 m!956407))

(declare-fun m!956409 () Bool)

(assert (=> b!1036387 m!956409))

(assert (=> b!1036387 m!956409))

(declare-fun m!956411 () Bool)

(assert (=> b!1036387 m!956411))

(assert (=> b!1036389 m!956409))

(assert (=> b!1036389 m!956409))

(assert (=> b!1036389 m!956411))

(assert (=> b!1036123 d!124763))

(declare-fun d!124765 () Bool)

(assert (=> d!124765 (= (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) lt!456891)) (v!14931 (getValueByKey!589 (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) lt!456891)))))

(assert (=> d!124661 d!124765))

(declare-fun b!1036391 () Bool)

(declare-fun e!586137 () Option!640)

(declare-fun e!586138 () Option!640)

(assert (=> b!1036391 (= e!586137 e!586138)))

(declare-fun c!104870 () Bool)

(assert (=> b!1036391 (= c!104870 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))) (not (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))) lt!456891))))))

(declare-fun d!124767 () Bool)

(declare-fun c!104869 () Bool)

(assert (=> d!124767 (= c!104869 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))) lt!456891)))))

(assert (=> d!124767 (= (getValueByKey!589 (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) lt!456891) e!586137)))

(declare-fun b!1036392 () Bool)

(assert (=> b!1036392 (= e!586138 (getValueByKey!589 (t!31125 (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))) lt!456891))))

(declare-fun b!1036390 () Bool)

(assert (=> b!1036390 (= e!586137 (Some!639 (_2!7876 (h!23116 (toList!6895 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))))

(declare-fun b!1036393 () Bool)

(assert (=> b!1036393 (= e!586138 None!638)))

(assert (= (and d!124767 c!104869) b!1036390))

(assert (= (and d!124767 (not c!104869)) b!1036391))

(assert (= (and b!1036391 c!104870) b!1036392))

(assert (= (and b!1036391 (not c!104870)) b!1036393))

(declare-fun m!956413 () Bool)

(assert (=> b!1036392 m!956413))

(assert (=> d!124661 d!124767))

(declare-fun d!124769 () Bool)

(assert (=> d!124769 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457120 () Unit!33894)

(assert (=> d!124769 (= lt!457120 (choose!1706 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586139 () Bool)

(assert (=> d!124769 e!586139))

(declare-fun res!691788 () Bool)

(assert (=> d!124769 (=> (not res!691788) (not e!586139))))

(assert (=> d!124769 (= res!691788 (isStrictlySorted!719 (toList!6895 lt!456890)))))

(assert (=> d!124769 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000) lt!457120)))

(declare-fun b!1036394 () Bool)

(assert (=> b!1036394 (= e!586139 (containsKey!564 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124769 res!691788) b!1036394))

(assert (=> d!124769 m!955831))

(assert (=> d!124769 m!955831))

(assert (=> d!124769 m!955833))

(declare-fun m!956415 () Bool)

(assert (=> d!124769 m!956415))

(assert (=> d!124769 m!956397))

(assert (=> b!1036394 m!955827))

(assert (=> b!1036049 d!124769))

(declare-fun d!124771 () Bool)

(assert (=> d!124771 (= (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!930 (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30340 () Bool)

(assert (= bs!30340 d!124771))

(assert (=> bs!30340 m!955831))

(declare-fun m!956417 () Bool)

(assert (=> bs!30340 m!956417))

(assert (=> b!1036049 d!124771))

(declare-fun b!1036396 () Bool)

(declare-fun e!586140 () Option!640)

(declare-fun e!586141 () Option!640)

(assert (=> b!1036396 (= e!586140 e!586141)))

(declare-fun c!104872 () Bool)

(assert (=> b!1036396 (= c!104872 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456890))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!124773 () Bool)

(declare-fun c!104871 () Bool)

(assert (=> d!124773 (= c!104871 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (= (_1!7876 (h!23116 (toList!6895 lt!456890))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124773 (= (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000) e!586140)))

(declare-fun b!1036397 () Bool)

(assert (=> b!1036397 (= e!586141 (getValueByKey!589 (t!31125 (toList!6895 lt!456890)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036395 () Bool)

(assert (=> b!1036395 (= e!586140 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456890)))))))

(declare-fun b!1036398 () Bool)

(assert (=> b!1036398 (= e!586141 None!638)))

(assert (= (and d!124773 c!104871) b!1036395))

(assert (= (and d!124773 (not c!104871)) b!1036396))

(assert (= (and b!1036396 c!104872) b!1036397))

(assert (= (and b!1036396 (not c!104872)) b!1036398))

(declare-fun m!956419 () Bool)

(assert (=> b!1036397 m!956419))

(assert (=> b!1036049 d!124773))

(declare-fun d!124775 () Bool)

(declare-fun e!586142 () Bool)

(assert (=> d!124775 e!586142))

(declare-fun res!691789 () Bool)

(assert (=> d!124775 (=> res!691789 e!586142)))

(declare-fun lt!457122 () Bool)

(assert (=> d!124775 (= res!691789 (not lt!457122))))

(declare-fun lt!457124 () Bool)

(assert (=> d!124775 (= lt!457122 lt!457124)))

(declare-fun lt!457121 () Unit!33894)

(declare-fun e!586143 () Unit!33894)

(assert (=> d!124775 (= lt!457121 e!586143)))

(declare-fun c!104873 () Bool)

(assert (=> d!124775 (= c!104873 lt!457124)))

(assert (=> d!124775 (= lt!457124 (containsKey!564 (toList!6895 lt!456950) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124775 (= (contains!6021 lt!456950 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) lt!457122)))

(declare-fun b!1036399 () Bool)

(declare-fun lt!457123 () Unit!33894)

(assert (=> b!1036399 (= e!586143 lt!457123)))

(assert (=> b!1036399 (= lt!457123 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456950) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036399 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456950) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036400 () Bool)

(declare-fun Unit!33915 () Unit!33894)

(assert (=> b!1036400 (= e!586143 Unit!33915)))

(declare-fun b!1036401 () Bool)

(assert (=> b!1036401 (= e!586142 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456950) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124775 c!104873) b!1036399))

(assert (= (and d!124775 (not c!104873)) b!1036400))

(assert (= (and d!124775 (not res!691789)) b!1036401))

(assert (=> d!124775 m!955693))

(declare-fun m!956421 () Bool)

(assert (=> d!124775 m!956421))

(assert (=> b!1036399 m!955693))

(declare-fun m!956423 () Bool)

(assert (=> b!1036399 m!956423))

(assert (=> b!1036399 m!955693))

(declare-fun m!956425 () Bool)

(assert (=> b!1036399 m!956425))

(assert (=> b!1036399 m!956425))

(declare-fun m!956427 () Bool)

(assert (=> b!1036399 m!956427))

(assert (=> b!1036401 m!955693))

(assert (=> b!1036401 m!956425))

(assert (=> b!1036401 m!956425))

(assert (=> b!1036401 m!956427))

(assert (=> b!1036097 d!124775))

(declare-fun d!124777 () Bool)

(declare-fun res!691790 () Bool)

(declare-fun e!586144 () Bool)

(assert (=> d!124777 (=> res!691790 e!586144)))

(assert (=> d!124777 (= res!691790 (and ((_ is Cons!21914) lt!457009) (= (_1!7876 (h!23116 lt!457009)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124777 (= (containsKey!564 lt!457009 #b1000000000000000000000000000000000000000000000000000000000000000) e!586144)))

(declare-fun b!1036402 () Bool)

(declare-fun e!586145 () Bool)

(assert (=> b!1036402 (= e!586144 e!586145)))

(declare-fun res!691791 () Bool)

(assert (=> b!1036402 (=> (not res!691791) (not e!586145))))

(assert (=> b!1036402 (= res!691791 (and (or (not ((_ is Cons!21914) lt!457009)) (bvsle (_1!7876 (h!23116 lt!457009)) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21914) lt!457009) (bvslt (_1!7876 (h!23116 lt!457009)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036403 () Bool)

(assert (=> b!1036403 (= e!586145 (containsKey!564 (t!31125 lt!457009) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124777 (not res!691790)) b!1036402))

(assert (= (and b!1036402 res!691791) b!1036403))

(declare-fun m!956429 () Bool)

(assert (=> b!1036403 m!956429))

(assert (=> b!1036161 d!124777))

(declare-fun d!124779 () Bool)

(assert (=> d!124779 (= (apply!907 lt!456924 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)) (get!16464 (getValueByKey!589 (toList!6895 lt!456924) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000))))))

(declare-fun bs!30341 () Bool)

(assert (= bs!30341 d!124779))

(assert (=> bs!30341 m!955841))

(declare-fun m!956431 () Bool)

(assert (=> bs!30341 m!956431))

(assert (=> bs!30341 m!956431))

(declare-fun m!956433 () Bool)

(assert (=> bs!30341 m!956433))

(assert (=> b!1036063 d!124779))

(declare-fun d!124781 () Bool)

(declare-fun c!104874 () Bool)

(assert (=> d!124781 (= c!104874 ((_ is ValueCellFull!11595) (select (arr!31432 (_values!6293 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun e!586146 () V!37669)

(assert (=> d!124781 (= (get!16463 (select (arr!31432 (_values!6293 lt!456791)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 lt!456791) #b0000000000000000000000000000000000000000000000000000000000000000)) e!586146)))

(declare-fun b!1036404 () Bool)

(assert (=> b!1036404 (= e!586146 (get!16465 (select (arr!31432 (_values!6293 lt!456791)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 lt!456791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036405 () Bool)

(assert (=> b!1036405 (= e!586146 (get!16466 (select (arr!31432 (_values!6293 lt!456791)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 lt!456791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124781 c!104874) b!1036404))

(assert (= (and d!124781 (not c!104874)) b!1036405))

(assert (=> b!1036404 m!955849))

(assert (=> b!1036404 m!955845))

(declare-fun m!956435 () Bool)

(assert (=> b!1036404 m!956435))

(assert (=> b!1036405 m!955849))

(assert (=> b!1036405 m!955845))

(declare-fun m!956437 () Bool)

(assert (=> b!1036405 m!956437))

(assert (=> b!1036063 d!124781))

(declare-fun d!124783 () Bool)

(assert (=> d!124783 (= (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895)) (not (isEmpty!930 (getValueByKey!589 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895))))))

(declare-fun bs!30342 () Bool)

(assert (= bs!30342 d!124783))

(assert (=> bs!30342 m!956193))

(declare-fun m!956439 () Bool)

(assert (=> bs!30342 m!956439))

(assert (=> b!1036223 d!124783))

(declare-fun b!1036407 () Bool)

(declare-fun e!586147 () Option!640)

(declare-fun e!586148 () Option!640)

(assert (=> b!1036407 (= e!586147 e!586148)))

(declare-fun c!104876 () Bool)

(assert (=> b!1036407 (= c!104876 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))) (not (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))) lt!456895))))))

(declare-fun d!124785 () Bool)

(declare-fun c!104875 () Bool)

(assert (=> d!124785 (= c!104875 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))) lt!456895)))))

(assert (=> d!124785 (= (getValueByKey!589 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895) e!586147)))

(declare-fun b!1036408 () Bool)

(assert (=> b!1036408 (= e!586148 (getValueByKey!589 (t!31125 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))) lt!456895))))

(declare-fun b!1036406 () Bool)

(assert (=> b!1036406 (= e!586147 (Some!639 (_2!7876 (h!23116 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))))

(declare-fun b!1036409 () Bool)

(assert (=> b!1036409 (= e!586148 None!638)))

(assert (= (and d!124785 c!104875) b!1036406))

(assert (= (and d!124785 (not c!104875)) b!1036407))

(assert (= (and b!1036407 c!104876) b!1036408))

(assert (= (and b!1036407 (not c!104876)) b!1036409))

(declare-fun m!956441 () Bool)

(assert (=> b!1036408 m!956441))

(assert (=> b!1036223 d!124785))

(declare-fun d!124787 () Bool)

(declare-fun e!586149 () Bool)

(assert (=> d!124787 e!586149))

(declare-fun res!691792 () Bool)

(assert (=> d!124787 (=> res!691792 e!586149)))

(declare-fun lt!457126 () Bool)

(assert (=> d!124787 (= res!691792 (not lt!457126))))

(declare-fun lt!457128 () Bool)

(assert (=> d!124787 (= lt!457126 lt!457128)))

(declare-fun lt!457125 () Unit!33894)

(declare-fun e!586150 () Unit!33894)

(assert (=> d!124787 (= lt!457125 e!586150)))

(declare-fun c!104877 () Bool)

(assert (=> d!124787 (= c!104877 lt!457128)))

(assert (=> d!124787 (= lt!457128 (containsKey!564 (toList!6895 lt!457016) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> d!124787 (= (contains!6021 lt!457016 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))) lt!457126)))

(declare-fun b!1036410 () Bool)

(declare-fun lt!457127 () Unit!33894)

(assert (=> b!1036410 (= e!586150 lt!457127)))

(assert (=> b!1036410 (= lt!457127 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!457016) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> b!1036410 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457016) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036411 () Bool)

(declare-fun Unit!33916 () Unit!33894)

(assert (=> b!1036411 (= e!586150 Unit!33916)))

(declare-fun b!1036412 () Bool)

(assert (=> b!1036412 (= e!586149 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457016) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(assert (= (and d!124787 c!104877) b!1036410))

(assert (= (and d!124787 (not c!104877)) b!1036411))

(assert (= (and d!124787 (not res!691792)) b!1036412))

(declare-fun m!956443 () Bool)

(assert (=> d!124787 m!956443))

(declare-fun m!956445 () Bool)

(assert (=> b!1036410 m!956445))

(assert (=> b!1036410 m!956095))

(assert (=> b!1036410 m!956095))

(declare-fun m!956447 () Bool)

(assert (=> b!1036410 m!956447))

(assert (=> b!1036412 m!956095))

(assert (=> b!1036412 m!956095))

(assert (=> b!1036412 m!956447))

(assert (=> d!124643 d!124787))

(declare-fun b!1036414 () Bool)

(declare-fun e!586151 () Option!640)

(declare-fun e!586152 () Option!640)

(assert (=> b!1036414 (= e!586151 e!586152)))

(declare-fun c!104879 () Bool)

(assert (=> b!1036414 (= c!104879 (and ((_ is Cons!21914) lt!457015) (not (= (_1!7876 (h!23116 lt!457015)) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))))

(declare-fun d!124789 () Bool)

(declare-fun c!104878 () Bool)

(assert (=> d!124789 (= c!104878 (and ((_ is Cons!21914) lt!457015) (= (_1!7876 (h!23116 lt!457015)) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(assert (=> d!124789 (= (getValueByKey!589 lt!457015 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))) e!586151)))

(declare-fun b!1036415 () Bool)

(assert (=> b!1036415 (= e!586152 (getValueByKey!589 (t!31125 lt!457015) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036413 () Bool)

(assert (=> b!1036413 (= e!586151 (Some!639 (_2!7876 (h!23116 lt!457015))))))

(declare-fun b!1036416 () Bool)

(assert (=> b!1036416 (= e!586152 None!638)))

(assert (= (and d!124789 c!104878) b!1036413))

(assert (= (and d!124789 (not c!104878)) b!1036414))

(assert (= (and b!1036414 c!104879) b!1036415))

(assert (= (and b!1036414 (not c!104879)) b!1036416))

(declare-fun m!956449 () Bool)

(assert (=> b!1036415 m!956449))

(assert (=> d!124643 d!124789))

(declare-fun d!124791 () Bool)

(assert (=> d!124791 (= (getValueByKey!589 lt!457015 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))) (Some!639 (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun lt!457129 () Unit!33894)

(assert (=> d!124791 (= lt!457129 (choose!1705 lt!457015 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun e!586153 () Bool)

(assert (=> d!124791 e!586153))

(declare-fun res!691793 () Bool)

(assert (=> d!124791 (=> (not res!691793) (not e!586153))))

(assert (=> d!124791 (= res!691793 (isStrictlySorted!719 lt!457015))))

(assert (=> d!124791 (= (lemmaContainsTupThenGetReturnValue!280 lt!457015 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))) lt!457129)))

(declare-fun b!1036417 () Bool)

(declare-fun res!691794 () Bool)

(assert (=> b!1036417 (=> (not res!691794) (not e!586153))))

(assert (=> b!1036417 (= res!691794 (containsKey!564 lt!457015 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036418 () Bool)

(assert (=> b!1036418 (= e!586153 (contains!6022 lt!457015 (tuple2!15731 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(assert (= (and d!124791 res!691793) b!1036417))

(assert (= (and b!1036417 res!691794) b!1036418))

(assert (=> d!124791 m!956089))

(declare-fun m!956451 () Bool)

(assert (=> d!124791 m!956451))

(declare-fun m!956453 () Bool)

(assert (=> d!124791 m!956453))

(declare-fun m!956455 () Bool)

(assert (=> b!1036417 m!956455))

(declare-fun m!956457 () Bool)

(assert (=> b!1036418 m!956457))

(assert (=> d!124643 d!124791))

(declare-fun e!586157 () List!21918)

(declare-fun b!1036419 () Bool)

(assert (=> b!1036419 (= e!586157 (insertStrictlySorted!373 (t!31125 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)))) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036420 () Bool)

(declare-fun e!586156 () List!21918)

(declare-fun call!43865 () List!21918)

(assert (=> b!1036420 (= e!586156 call!43865)))

(declare-fun bm!43860 () Bool)

(declare-fun call!43863 () List!21918)

(assert (=> bm!43860 (= call!43865 call!43863)))

(declare-fun b!1036421 () Bool)

(declare-fun e!586158 () List!21918)

(assert (=> b!1036421 (= e!586158 call!43863)))

(declare-fun b!1036422 () Bool)

(declare-fun e!586154 () List!21918)

(declare-fun call!43864 () List!21918)

(assert (=> b!1036422 (= e!586154 call!43864)))

(declare-fun b!1036423 () Bool)

(declare-fun res!691796 () Bool)

(declare-fun e!586155 () Bool)

(assert (=> b!1036423 (=> (not res!691796) (not e!586155))))

(declare-fun lt!457130 () List!21918)

(assert (=> b!1036423 (= res!691796 (containsKey!564 lt!457130 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun b!1036425 () Bool)

(declare-fun c!104880 () Bool)

(assert (=> b!1036425 (= c!104880 (and ((_ is Cons!21914) (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)))) (bvsgt (_1!7876 (h!23116 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816))))) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(assert (=> b!1036425 (= e!586156 e!586154)))

(declare-fun b!1036426 () Bool)

(assert (=> b!1036426 (= e!586154 call!43864)))

(declare-fun b!1036427 () Bool)

(assert (=> b!1036427 (= e!586155 (contains!6022 lt!457130 (tuple2!15731 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(declare-fun bm!43861 () Bool)

(declare-fun c!104881 () Bool)

(assert (=> bm!43861 (= call!43863 ($colon$colon!603 e!586157 (ite c!104881 (h!23116 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)))) (tuple2!15731 (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))))

(declare-fun c!104882 () Bool)

(assert (=> bm!43861 (= c!104882 c!104881)))

(declare-fun b!1036428 () Bool)

(assert (=> b!1036428 (= e!586158 e!586156)))

(declare-fun c!104883 () Bool)

(assert (=> b!1036428 (= c!104883 (and ((_ is Cons!21914) (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)))) (= (_1!7876 (h!23116 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816))))) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(declare-fun bm!43862 () Bool)

(assert (=> bm!43862 (= call!43864 call!43865)))

(declare-fun b!1036424 () Bool)

(assert (=> b!1036424 (= e!586157 (ite c!104883 (t!31125 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)))) (ite c!104880 (Cons!21914 (h!23116 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)))) (t!31125 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816))))) Nil!21915)))))

(declare-fun d!124793 () Bool)

(assert (=> d!124793 e!586155))

(declare-fun res!691795 () Bool)

(assert (=> d!124793 (=> (not res!691795) (not e!586155))))

(assert (=> d!124793 (= res!691795 (isStrictlySorted!719 lt!457130))))

(assert (=> d!124793 (= lt!457130 e!586158)))

(assert (=> d!124793 (= c!104881 (and ((_ is Cons!21914) (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816)))) (bvslt (_1!7876 (h!23116 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816))))) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(assert (=> d!124793 (isStrictlySorted!719 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816))))))

(assert (=> d!124793 (= (insertStrictlySorted!373 (toList!6895 (ite c!104763 call!43817 (ite c!104760 call!43818 call!43816))) (_1!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (_2!7876 (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))) lt!457130)))

(assert (= (and d!124793 c!104881) b!1036421))

(assert (= (and d!124793 (not c!104881)) b!1036428))

(assert (= (and b!1036428 c!104883) b!1036420))

(assert (= (and b!1036428 (not c!104883)) b!1036425))

(assert (= (and b!1036425 c!104880) b!1036426))

(assert (= (and b!1036425 (not c!104880)) b!1036422))

(assert (= (or b!1036426 b!1036422) bm!43862))

(assert (= (or b!1036420 bm!43862) bm!43860))

(assert (= (or b!1036421 bm!43860) bm!43861))

(assert (= (and bm!43861 c!104882) b!1036419))

(assert (= (and bm!43861 (not c!104882)) b!1036424))

(assert (= (and d!124793 res!691795) b!1036423))

(assert (= (and b!1036423 res!691796) b!1036427))

(declare-fun m!956459 () Bool)

(assert (=> b!1036427 m!956459))

(declare-fun m!956461 () Bool)

(assert (=> b!1036419 m!956461))

(declare-fun m!956463 () Bool)

(assert (=> b!1036423 m!956463))

(declare-fun m!956465 () Bool)

(assert (=> bm!43861 m!956465))

(declare-fun m!956467 () Bool)

(assert (=> d!124793 m!956467))

(declare-fun m!956469 () Bool)

(assert (=> d!124793 m!956469))

(assert (=> d!124643 d!124793))

(assert (=> d!124597 d!124619))

(assert (=> d!124597 d!124621))

(assert (=> d!124597 d!124625))

(declare-fun d!124795 () Bool)

(assert (=> d!124795 (= (apply!907 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) lt!456865) (apply!907 lt!456851 lt!456865))))

(assert (=> d!124795 true))

(declare-fun _$34!1173 () Unit!33894)

(assert (=> d!124795 (= (choose!1703 lt!456851 lt!456862 (zeroValue!6104 thiss!1427) lt!456865) _$34!1173)))

(declare-fun bs!30343 () Bool)

(assert (= bs!30343 d!124795))

(assert (=> bs!30343 m!955719))

(assert (=> bs!30343 m!955719))

(assert (=> bs!30343 m!955721))

(assert (=> bs!30343 m!955733))

(assert (=> d!124597 d!124795))

(declare-fun d!124797 () Bool)

(declare-fun e!586159 () Bool)

(assert (=> d!124797 e!586159))

(declare-fun res!691797 () Bool)

(assert (=> d!124797 (=> res!691797 e!586159)))

(declare-fun lt!457132 () Bool)

(assert (=> d!124797 (= res!691797 (not lt!457132))))

(declare-fun lt!457134 () Bool)

(assert (=> d!124797 (= lt!457132 lt!457134)))

(declare-fun lt!457131 () Unit!33894)

(declare-fun e!586160 () Unit!33894)

(assert (=> d!124797 (= lt!457131 e!586160)))

(declare-fun c!104884 () Bool)

(assert (=> d!124797 (= c!104884 lt!457134)))

(assert (=> d!124797 (= lt!457134 (containsKey!564 (toList!6895 lt!456851) lt!456865))))

(assert (=> d!124797 (= (contains!6021 lt!456851 lt!456865) lt!457132)))

(declare-fun b!1036429 () Bool)

(declare-fun lt!457133 () Unit!33894)

(assert (=> b!1036429 (= e!586160 lt!457133)))

(assert (=> b!1036429 (= lt!457133 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456851) lt!456865))))

(assert (=> b!1036429 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456851) lt!456865))))

(declare-fun b!1036430 () Bool)

(declare-fun Unit!33917 () Unit!33894)

(assert (=> b!1036430 (= e!586160 Unit!33917)))

(declare-fun b!1036431 () Bool)

(assert (=> b!1036431 (= e!586159 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456851) lt!456865)))))

(assert (= (and d!124797 c!104884) b!1036429))

(assert (= (and d!124797 (not c!104884)) b!1036430))

(assert (= (and d!124797 (not res!691797)) b!1036431))

(declare-fun m!956471 () Bool)

(assert (=> d!124797 m!956471))

(declare-fun m!956473 () Bool)

(assert (=> b!1036429 m!956473))

(assert (=> b!1036429 m!955999))

(assert (=> b!1036429 m!955999))

(declare-fun m!956475 () Bool)

(assert (=> b!1036429 m!956475))

(assert (=> b!1036431 m!955999))

(assert (=> b!1036431 m!955999))

(assert (=> b!1036431 m!956475))

(assert (=> d!124597 d!124797))

(declare-fun lt!457135 () Bool)

(declare-fun d!124799 () Bool)

(assert (=> d!124799 (= lt!457135 (select (content!514 (toList!6895 lt!457027)) (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))

(declare-fun e!586161 () Bool)

(assert (=> d!124799 (= lt!457135 e!586161)))

(declare-fun res!691798 () Bool)

(assert (=> d!124799 (=> (not res!691798) (not e!586161))))

(assert (=> d!124799 (= res!691798 ((_ is Cons!21914) (toList!6895 lt!457027)))))

(assert (=> d!124799 (= (contains!6022 (toList!6895 lt!457027) (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) lt!457135)))

(declare-fun b!1036432 () Bool)

(declare-fun e!586162 () Bool)

(assert (=> b!1036432 (= e!586161 e!586162)))

(declare-fun res!691799 () Bool)

(assert (=> b!1036432 (=> res!691799 e!586162)))

(assert (=> b!1036432 (= res!691799 (= (h!23116 (toList!6895 lt!457027)) (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))

(declare-fun b!1036433 () Bool)

(assert (=> b!1036433 (= e!586162 (contains!6022 (t!31125 (toList!6895 lt!457027)) (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))

(assert (= (and d!124799 res!691798) b!1036432))

(assert (= (and b!1036432 (not res!691799)) b!1036433))

(declare-fun m!956477 () Bool)

(assert (=> d!124799 m!956477))

(declare-fun m!956479 () Bool)

(assert (=> d!124799 m!956479))

(declare-fun m!956481 () Bool)

(assert (=> b!1036433 m!956481))

(assert (=> b!1036213 d!124799))

(declare-fun d!124801 () Bool)

(assert (=> d!124801 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14931 (getValueByKey!589 (toList!6895 lt!456890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124647 d!124801))

(assert (=> d!124647 d!124755))

(declare-fun d!124803 () Bool)

(declare-fun res!691800 () Bool)

(declare-fun e!586163 () Bool)

(assert (=> d!124803 (=> res!691800 e!586163)))

(assert (=> d!124803 (= res!691800 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (= (_1!7876 (h!23116 (toList!6895 lt!456864))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124803 (= (containsKey!564 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000) e!586163)))

(declare-fun b!1036434 () Bool)

(declare-fun e!586164 () Bool)

(assert (=> b!1036434 (= e!586163 e!586164)))

(declare-fun res!691801 () Bool)

(assert (=> b!1036434 (=> (not res!691801) (not e!586164))))

(assert (=> b!1036434 (= res!691801 (and (or (not ((_ is Cons!21914) (toList!6895 lt!456864))) (bvsle (_1!7876 (h!23116 (toList!6895 lt!456864))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21914) (toList!6895 lt!456864)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456864))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036435 () Bool)

(assert (=> b!1036435 (= e!586164 (containsKey!564 (t!31125 (toList!6895 lt!456864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124803 (not res!691800)) b!1036434))

(assert (= (and b!1036434 res!691801) b!1036435))

(declare-fun m!956483 () Bool)

(assert (=> b!1036435 m!956483))

(assert (=> d!124687 d!124803))

(declare-fun d!124805 () Bool)

(assert (=> d!124805 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456881) lt!456892)) (v!14931 (getValueByKey!589 (toList!6895 lt!456881) lt!456892)))))

(assert (=> d!124657 d!124805))

(declare-fun b!1036437 () Bool)

(declare-fun e!586165 () Option!640)

(declare-fun e!586166 () Option!640)

(assert (=> b!1036437 (= e!586165 e!586166)))

(declare-fun c!104886 () Bool)

(assert (=> b!1036437 (= c!104886 (and ((_ is Cons!21914) (toList!6895 lt!456881)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456881))) lt!456892))))))

(declare-fun d!124807 () Bool)

(declare-fun c!104885 () Bool)

(assert (=> d!124807 (= c!104885 (and ((_ is Cons!21914) (toList!6895 lt!456881)) (= (_1!7876 (h!23116 (toList!6895 lt!456881))) lt!456892)))))

(assert (=> d!124807 (= (getValueByKey!589 (toList!6895 lt!456881) lt!456892) e!586165)))

(declare-fun b!1036438 () Bool)

(assert (=> b!1036438 (= e!586166 (getValueByKey!589 (t!31125 (toList!6895 lt!456881)) lt!456892))))

(declare-fun b!1036436 () Bool)

(assert (=> b!1036436 (= e!586165 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456881)))))))

(declare-fun b!1036439 () Bool)

(assert (=> b!1036439 (= e!586166 None!638)))

(assert (= (and d!124807 c!104885) b!1036436))

(assert (= (and d!124807 (not c!104885)) b!1036437))

(assert (= (and b!1036437 c!104886) b!1036438))

(assert (= (and b!1036437 (not c!104886)) b!1036439))

(declare-fun m!956485 () Bool)

(assert (=> b!1036438 m!956485))

(assert (=> d!124657 d!124807))

(declare-fun d!124809 () Bool)

(assert (=> d!124809 (= (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1036250 d!124809))

(assert (=> d!124603 d!124617))

(declare-fun d!124811 () Bool)

(assert (=> d!124811 (= (apply!907 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) lt!456866) (apply!907 lt!456855 lt!456866))))

(assert (=> d!124811 true))

(declare-fun _$34!1174 () Unit!33894)

(assert (=> d!124811 (= (choose!1703 lt!456855 lt!456852 (minValue!6106 thiss!1427) lt!456866) _$34!1174)))

(declare-fun bs!30344 () Bool)

(assert (= bs!30344 d!124811))

(assert (=> bs!30344 m!955731))

(assert (=> bs!30344 m!955731))

(assert (=> bs!30344 m!955735))

(assert (=> bs!30344 m!955737))

(assert (=> d!124603 d!124811))

(assert (=> d!124603 d!124601))

(assert (=> d!124603 d!124611))

(declare-fun d!124813 () Bool)

(declare-fun e!586167 () Bool)

(assert (=> d!124813 e!586167))

(declare-fun res!691802 () Bool)

(assert (=> d!124813 (=> res!691802 e!586167)))

(declare-fun lt!457137 () Bool)

(assert (=> d!124813 (= res!691802 (not lt!457137))))

(declare-fun lt!457139 () Bool)

(assert (=> d!124813 (= lt!457137 lt!457139)))

(declare-fun lt!457136 () Unit!33894)

(declare-fun e!586168 () Unit!33894)

(assert (=> d!124813 (= lt!457136 e!586168)))

(declare-fun c!104887 () Bool)

(assert (=> d!124813 (= c!104887 lt!457139)))

(assert (=> d!124813 (= lt!457139 (containsKey!564 (toList!6895 lt!456855) lt!456866))))

(assert (=> d!124813 (= (contains!6021 lt!456855 lt!456866) lt!457137)))

(declare-fun b!1036440 () Bool)

(declare-fun lt!457138 () Unit!33894)

(assert (=> b!1036440 (= e!586168 lt!457138)))

(assert (=> b!1036440 (= lt!457138 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456855) lt!456866))))

(assert (=> b!1036440 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456855) lt!456866))))

(declare-fun b!1036441 () Bool)

(declare-fun Unit!33918 () Unit!33894)

(assert (=> b!1036441 (= e!586168 Unit!33918)))

(declare-fun b!1036442 () Bool)

(assert (=> b!1036442 (= e!586167 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456855) lt!456866)))))

(assert (= (and d!124813 c!104887) b!1036440))

(assert (= (and d!124813 (not c!104887)) b!1036441))

(assert (= (and d!124813 (not res!691802)) b!1036442))

(declare-fun m!956487 () Bool)

(assert (=> d!124813 m!956487))

(declare-fun m!956489 () Bool)

(assert (=> b!1036440 m!956489))

(assert (=> b!1036440 m!955979))

(assert (=> b!1036440 m!955979))

(declare-fun m!956491 () Bool)

(assert (=> b!1036440 m!956491))

(assert (=> b!1036442 m!955979))

(assert (=> b!1036442 m!955979))

(assert (=> b!1036442 m!956491))

(assert (=> d!124603 d!124813))

(declare-fun d!124815 () Bool)

(declare-fun e!586169 () Bool)

(assert (=> d!124815 e!586169))

(declare-fun res!691803 () Bool)

(assert (=> d!124815 (=> res!691803 e!586169)))

(declare-fun lt!457141 () Bool)

(assert (=> d!124815 (= res!691803 (not lt!457141))))

(declare-fun lt!457143 () Bool)

(assert (=> d!124815 (= lt!457141 lt!457143)))

(declare-fun lt!457140 () Unit!33894)

(declare-fun e!586170 () Unit!33894)

(assert (=> d!124815 (= lt!457140 e!586170)))

(declare-fun c!104888 () Bool)

(assert (=> d!124815 (= c!104888 lt!457143)))

(assert (=> d!124815 (= lt!457143 (containsKey!564 (toList!6895 lt!456924) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (=> d!124815 (= (contains!6021 lt!456924 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)) lt!457141)))

(declare-fun b!1036443 () Bool)

(declare-fun lt!457142 () Unit!33894)

(assert (=> b!1036443 (= e!586170 lt!457142)))

(assert (=> b!1036443 (= lt!457142 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456924) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (=> b!1036443 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456924) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun b!1036444 () Bool)

(declare-fun Unit!33919 () Unit!33894)

(assert (=> b!1036444 (= e!586170 Unit!33919)))

(declare-fun b!1036445 () Bool)

(assert (=> b!1036445 (= e!586169 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456924) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000))))))

(assert (= (and d!124815 c!104888) b!1036443))

(assert (= (and d!124815 (not c!104888)) b!1036444))

(assert (= (and d!124815 (not res!691803)) b!1036445))

(assert (=> d!124815 m!955841))

(declare-fun m!956493 () Bool)

(assert (=> d!124815 m!956493))

(assert (=> b!1036443 m!955841))

(declare-fun m!956495 () Bool)

(assert (=> b!1036443 m!956495))

(assert (=> b!1036443 m!955841))

(assert (=> b!1036443 m!956431))

(assert (=> b!1036443 m!956431))

(declare-fun m!956497 () Bool)

(assert (=> b!1036443 m!956497))

(assert (=> b!1036445 m!955841))

(assert (=> b!1036445 m!956431))

(assert (=> b!1036445 m!956431))

(assert (=> b!1036445 m!956497))

(assert (=> b!1036068 d!124815))

(declare-fun b!1036447 () Bool)

(declare-fun e!586171 () Option!640)

(declare-fun e!586172 () Option!640)

(assert (=> b!1036447 (= e!586171 e!586172)))

(declare-fun c!104890 () Bool)

(assert (=> b!1036447 (= c!104890 (and ((_ is Cons!21914) (toList!6895 lt!457037)) (not (= (_1!7876 (h!23116 (toList!6895 lt!457037))) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))))

(declare-fun d!124817 () Bool)

(declare-fun c!104889 () Bool)

(assert (=> d!124817 (= c!104889 (and ((_ is Cons!21914) (toList!6895 lt!457037)) (= (_1!7876 (h!23116 (toList!6895 lt!457037))) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!124817 (= (getValueByKey!589 (toList!6895 lt!457037) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) e!586171)))

(declare-fun b!1036448 () Bool)

(assert (=> b!1036448 (= e!586172 (getValueByKey!589 (t!31125 (toList!6895 lt!457037)) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036446 () Bool)

(assert (=> b!1036446 (= e!586171 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!457037)))))))

(declare-fun b!1036449 () Bool)

(assert (=> b!1036449 (= e!586172 None!638)))

(assert (= (and d!124817 c!104889) b!1036446))

(assert (= (and d!124817 (not c!104889)) b!1036447))

(assert (= (and b!1036447 c!104890) b!1036448))

(assert (= (and b!1036447 (not c!104890)) b!1036449))

(declare-fun m!956499 () Bool)

(assert (=> b!1036448 m!956499))

(assert (=> b!1036218 d!124817))

(declare-fun d!124819 () Bool)

(assert (=> d!124819 (= (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) lt!456868)) (v!14931 (getValueByKey!589 (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) lt!456868)))))

(assert (=> d!124615 d!124819))

(declare-fun b!1036451 () Bool)

(declare-fun e!586173 () Option!640)

(declare-fun e!586174 () Option!640)

(assert (=> b!1036451 (= e!586173 e!586174)))

(declare-fun c!104892 () Bool)

(assert (=> b!1036451 (= c!104892 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))) (not (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))) lt!456868))))))

(declare-fun c!104891 () Bool)

(declare-fun d!124821 () Bool)

(assert (=> d!124821 (= c!104891 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))) lt!456868)))))

(assert (=> d!124821 (= (getValueByKey!589 (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) lt!456868) e!586173)))

(declare-fun b!1036452 () Bool)

(assert (=> b!1036452 (= e!586174 (getValueByKey!589 (t!31125 (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))) lt!456868))))

(declare-fun b!1036450 () Bool)

(assert (=> b!1036450 (= e!586173 (Some!639 (_2!7876 (h!23116 (toList!6895 (+!3105 lt!456854 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))))

(declare-fun b!1036453 () Bool)

(assert (=> b!1036453 (= e!586174 None!638)))

(assert (= (and d!124821 c!104891) b!1036450))

(assert (= (and d!124821 (not c!104891)) b!1036451))

(assert (= (and b!1036451 c!104892) b!1036452))

(assert (= (and b!1036451 (not c!104892)) b!1036453))

(declare-fun m!956501 () Bool)

(assert (=> b!1036452 m!956501))

(assert (=> d!124615 d!124821))

(assert (=> b!1036101 d!124713))

(declare-fun d!124823 () Bool)

(assert (=> d!124823 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456851) lt!456865)) (v!14931 (getValueByKey!589 (toList!6895 lt!456851) lt!456865)))))

(assert (=> d!124621 d!124823))

(declare-fun b!1036455 () Bool)

(declare-fun e!586175 () Option!640)

(declare-fun e!586176 () Option!640)

(assert (=> b!1036455 (= e!586175 e!586176)))

(declare-fun c!104894 () Bool)

(assert (=> b!1036455 (= c!104894 (and ((_ is Cons!21914) (toList!6895 lt!456851)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456851))) lt!456865))))))

(declare-fun d!124825 () Bool)

(declare-fun c!104893 () Bool)

(assert (=> d!124825 (= c!104893 (and ((_ is Cons!21914) (toList!6895 lt!456851)) (= (_1!7876 (h!23116 (toList!6895 lt!456851))) lt!456865)))))

(assert (=> d!124825 (= (getValueByKey!589 (toList!6895 lt!456851) lt!456865) e!586175)))

(declare-fun b!1036456 () Bool)

(assert (=> b!1036456 (= e!586176 (getValueByKey!589 (t!31125 (toList!6895 lt!456851)) lt!456865))))

(declare-fun b!1036454 () Bool)

(assert (=> b!1036454 (= e!586175 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456851)))))))

(declare-fun b!1036457 () Bool)

(assert (=> b!1036457 (= e!586176 None!638)))

(assert (= (and d!124825 c!104893) b!1036454))

(assert (= (and d!124825 (not c!104893)) b!1036455))

(assert (= (and b!1036455 c!104894) b!1036456))

(assert (= (and b!1036455 (not c!104894)) b!1036457))

(declare-fun m!956503 () Bool)

(assert (=> b!1036456 m!956503))

(assert (=> d!124621 d!124825))

(declare-fun d!124827 () Bool)

(assert (=> d!124827 (= (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!930 (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30345 () Bool)

(assert (= bs!30345 d!124827))

(assert (=> bs!30345 m!956261))

(declare-fun m!956505 () Bool)

(assert (=> bs!30345 m!956505))

(assert (=> b!1036253 d!124827))

(assert (=> b!1036253 d!124717))

(assert (=> b!1036209 d!124581))

(declare-fun d!124829 () Bool)

(declare-fun e!586177 () Bool)

(assert (=> d!124829 e!586177))

(declare-fun res!691804 () Bool)

(assert (=> d!124829 (=> res!691804 e!586177)))

(declare-fun lt!457145 () Bool)

(assert (=> d!124829 (= res!691804 (not lt!457145))))

(declare-fun lt!457147 () Bool)

(assert (=> d!124829 (= lt!457145 lt!457147)))

(declare-fun lt!457144 () Unit!33894)

(declare-fun e!586178 () Unit!33894)

(assert (=> d!124829 (= lt!457144 e!586178)))

(declare-fun c!104895 () Bool)

(assert (=> d!124829 (= c!104895 lt!457147)))

(assert (=> d!124829 (= lt!457147 (containsKey!564 (toList!6895 lt!456997) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> d!124829 (= (contains!6021 lt!456997 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))) lt!457145)))

(declare-fun b!1036458 () Bool)

(declare-fun lt!457146 () Unit!33894)

(assert (=> b!1036458 (= e!586178 lt!457146)))

(assert (=> b!1036458 (= lt!457146 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456997) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> b!1036458 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456997) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun b!1036459 () Bool)

(declare-fun Unit!33920 () Unit!33894)

(assert (=> b!1036459 (= e!586178 Unit!33920)))

(declare-fun b!1036460 () Bool)

(assert (=> b!1036460 (= e!586177 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456997) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(assert (= (and d!124829 c!104895) b!1036458))

(assert (= (and d!124829 (not c!104895)) b!1036459))

(assert (= (and d!124829 (not res!691804)) b!1036460))

(declare-fun m!956507 () Bool)

(assert (=> d!124829 m!956507))

(declare-fun m!956509 () Bool)

(assert (=> b!1036458 m!956509))

(assert (=> b!1036458 m!956039))

(assert (=> b!1036458 m!956039))

(declare-fun m!956511 () Bool)

(assert (=> b!1036458 m!956511))

(assert (=> b!1036460 m!956039))

(assert (=> b!1036460 m!956039))

(assert (=> b!1036460 m!956511))

(assert (=> d!124629 d!124829))

(declare-fun b!1036462 () Bool)

(declare-fun e!586179 () Option!640)

(declare-fun e!586180 () Option!640)

(assert (=> b!1036462 (= e!586179 e!586180)))

(declare-fun c!104897 () Bool)

(assert (=> b!1036462 (= c!104897 (and ((_ is Cons!21914) lt!456996) (not (= (_1!7876 (h!23116 lt!456996)) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))))

(declare-fun d!124831 () Bool)

(declare-fun c!104896 () Bool)

(assert (=> d!124831 (= c!104896 (and ((_ is Cons!21914) lt!456996) (= (_1!7876 (h!23116 lt!456996)) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(assert (=> d!124831 (= (getValueByKey!589 lt!456996 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))) e!586179)))

(declare-fun b!1036463 () Bool)

(assert (=> b!1036463 (= e!586180 (getValueByKey!589 (t!31125 lt!456996) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun b!1036461 () Bool)

(assert (=> b!1036461 (= e!586179 (Some!639 (_2!7876 (h!23116 lt!456996))))))

(declare-fun b!1036464 () Bool)

(assert (=> b!1036464 (= e!586180 None!638)))

(assert (= (and d!124831 c!104896) b!1036461))

(assert (= (and d!124831 (not c!104896)) b!1036462))

(assert (= (and b!1036462 c!104897) b!1036463))

(assert (= (and b!1036462 (not c!104897)) b!1036464))

(declare-fun m!956513 () Bool)

(assert (=> b!1036463 m!956513))

(assert (=> d!124629 d!124831))

(declare-fun d!124833 () Bool)

(assert (=> d!124833 (= (getValueByKey!589 lt!456996 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))) (Some!639 (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun lt!457148 () Unit!33894)

(assert (=> d!124833 (= lt!457148 (choose!1705 lt!456996 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun e!586181 () Bool)

(assert (=> d!124833 e!586181))

(declare-fun res!691805 () Bool)

(assert (=> d!124833 (=> (not res!691805) (not e!586181))))

(assert (=> d!124833 (= res!691805 (isStrictlySorted!719 lt!456996))))

(assert (=> d!124833 (= (lemmaContainsTupThenGetReturnValue!280 lt!456996 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))) lt!457148)))

(declare-fun b!1036465 () Bool)

(declare-fun res!691806 () Bool)

(assert (=> b!1036465 (=> (not res!691806) (not e!586181))))

(assert (=> b!1036465 (= res!691806 (containsKey!564 lt!456996 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun b!1036466 () Bool)

(assert (=> b!1036466 (= e!586181 (contains!6022 lt!456996 (tuple2!15731 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(assert (= (and d!124833 res!691805) b!1036465))

(assert (= (and b!1036465 res!691806) b!1036466))

(assert (=> d!124833 m!956033))

(declare-fun m!956515 () Bool)

(assert (=> d!124833 m!956515))

(declare-fun m!956517 () Bool)

(assert (=> d!124833 m!956517))

(declare-fun m!956519 () Bool)

(assert (=> b!1036465 m!956519))

(declare-fun m!956521 () Bool)

(assert (=> b!1036466 m!956521))

(assert (=> d!124629 d!124833))

(declare-fun e!586185 () List!21918)

(declare-fun b!1036467 () Bool)

(assert (=> b!1036467 (= e!586185 (insertStrictlySorted!373 (t!31125 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)))) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun b!1036468 () Bool)

(declare-fun e!586184 () List!21918)

(declare-fun call!43868 () List!21918)

(assert (=> b!1036468 (= e!586184 call!43868)))

(declare-fun bm!43863 () Bool)

(declare-fun call!43866 () List!21918)

(assert (=> bm!43863 (= call!43868 call!43866)))

(declare-fun b!1036469 () Bool)

(declare-fun e!586186 () List!21918)

(assert (=> b!1036469 (= e!586186 call!43866)))

(declare-fun b!1036470 () Bool)

(declare-fun e!586182 () List!21918)

(declare-fun call!43867 () List!21918)

(assert (=> b!1036470 (= e!586182 call!43867)))

(declare-fun b!1036471 () Bool)

(declare-fun res!691808 () Bool)

(declare-fun e!586183 () Bool)

(assert (=> b!1036471 (=> (not res!691808) (not e!586183))))

(declare-fun lt!457149 () List!21918)

(assert (=> b!1036471 (= res!691808 (containsKey!564 lt!457149 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun c!104898 () Bool)

(declare-fun b!1036473 () Bool)

(assert (=> b!1036473 (= c!104898 (and ((_ is Cons!21914) (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)))) (bvsgt (_1!7876 (h!23116 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823))))) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(assert (=> b!1036473 (= e!586184 e!586182)))

(declare-fun b!1036474 () Bool)

(assert (=> b!1036474 (= e!586182 call!43867)))

(declare-fun b!1036475 () Bool)

(assert (=> b!1036475 (= e!586183 (contains!6022 lt!457149 (tuple2!15731 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(declare-fun c!104899 () Bool)

(declare-fun bm!43864 () Bool)

(assert (=> bm!43864 (= call!43866 ($colon$colon!603 e!586185 (ite c!104899 (h!23116 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)))) (tuple2!15731 (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))))

(declare-fun c!104900 () Bool)

(assert (=> bm!43864 (= c!104900 c!104899)))

(declare-fun b!1036476 () Bool)

(assert (=> b!1036476 (= e!586186 e!586184)))

(declare-fun c!104901 () Bool)

(assert (=> b!1036476 (= c!104901 (and ((_ is Cons!21914) (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)))) (= (_1!7876 (h!23116 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823))))) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(declare-fun bm!43865 () Bool)

(assert (=> bm!43865 (= call!43867 call!43868)))

(declare-fun b!1036472 () Bool)

(assert (=> b!1036472 (= e!586185 (ite c!104901 (t!31125 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)))) (ite c!104898 (Cons!21914 (h!23116 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)))) (t!31125 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823))))) Nil!21915)))))

(declare-fun d!124835 () Bool)

(assert (=> d!124835 e!586183))

(declare-fun res!691807 () Bool)

(assert (=> d!124835 (=> (not res!691807) (not e!586183))))

(assert (=> d!124835 (= res!691807 (isStrictlySorted!719 lt!457149))))

(assert (=> d!124835 (= lt!457149 e!586186)))

(assert (=> d!124835 (= c!104899 (and ((_ is Cons!21914) (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823)))) (bvslt (_1!7876 (h!23116 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823))))) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(assert (=> d!124835 (isStrictlySorted!719 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823))))))

(assert (=> d!124835 (= (insertStrictlySorted!373 (toList!6895 (ite c!104769 call!43824 (ite c!104766 call!43825 call!43823))) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (_2!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))) lt!457149)))

(assert (= (and d!124835 c!104899) b!1036469))

(assert (= (and d!124835 (not c!104899)) b!1036476))

(assert (= (and b!1036476 c!104901) b!1036468))

(assert (= (and b!1036476 (not c!104901)) b!1036473))

(assert (= (and b!1036473 c!104898) b!1036474))

(assert (= (and b!1036473 (not c!104898)) b!1036470))

(assert (= (or b!1036474 b!1036470) bm!43865))

(assert (= (or b!1036468 bm!43865) bm!43863))

(assert (= (or b!1036469 bm!43863) bm!43864))

(assert (= (and bm!43864 c!104900) b!1036467))

(assert (= (and bm!43864 (not c!104900)) b!1036472))

(assert (= (and d!124835 res!691807) b!1036471))

(assert (= (and b!1036471 res!691808) b!1036475))

(declare-fun m!956523 () Bool)

(assert (=> b!1036475 m!956523))

(declare-fun m!956525 () Bool)

(assert (=> b!1036467 m!956525))

(declare-fun m!956527 () Bool)

(assert (=> b!1036471 m!956527))

(declare-fun m!956529 () Bool)

(assert (=> bm!43864 m!956529))

(declare-fun m!956531 () Bool)

(assert (=> d!124835 m!956531))

(declare-fun m!956533 () Bool)

(assert (=> d!124835 m!956533))

(assert (=> d!124629 d!124835))

(declare-fun d!124837 () Bool)

(assert (=> d!124837 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14931 (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124649 d!124837))

(declare-fun b!1036478 () Bool)

(declare-fun e!586187 () Option!640)

(declare-fun e!586188 () Option!640)

(assert (=> b!1036478 (= e!586187 e!586188)))

(declare-fun c!104903 () Bool)

(assert (=> b!1036478 (= c!104903 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456864))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!124839 () Bool)

(declare-fun c!104902 () Bool)

(assert (=> d!124839 (= c!104902 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (= (_1!7876 (h!23116 (toList!6895 lt!456864))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124839 (= (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000) e!586187)))

(declare-fun b!1036479 () Bool)

(assert (=> b!1036479 (= e!586188 (getValueByKey!589 (t!31125 (toList!6895 lt!456864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036477 () Bool)

(assert (=> b!1036477 (= e!586187 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456864)))))))

(declare-fun b!1036480 () Bool)

(assert (=> b!1036480 (= e!586188 None!638)))

(assert (= (and d!124839 c!104902) b!1036477))

(assert (= (and d!124839 (not c!104902)) b!1036478))

(assert (= (and b!1036478 c!104903) b!1036479))

(assert (= (and b!1036478 (not c!104903)) b!1036480))

(declare-fun m!956535 () Bool)

(assert (=> b!1036479 m!956535))

(assert (=> d!124649 d!124839))

(declare-fun bm!43866 () Bool)

(declare-fun call!43869 () Bool)

(assert (=> bm!43866 (= call!43869 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11459 lt!456791) (mask!30171 lt!456791)))))

(declare-fun b!1036481 () Bool)

(declare-fun e!586190 () Bool)

(assert (=> b!1036481 (= e!586190 call!43869)))

(declare-fun d!124841 () Bool)

(declare-fun res!691809 () Bool)

(declare-fun e!586191 () Bool)

(assert (=> d!124841 (=> res!691809 e!586191)))

(assert (=> d!124841 (= res!691809 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!124841 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11459 lt!456791) (mask!30171 lt!456791)) e!586191)))

(declare-fun b!1036482 () Bool)

(declare-fun e!586189 () Bool)

(assert (=> b!1036482 (= e!586190 e!586189)))

(declare-fun lt!457151 () (_ BitVec 64))

(assert (=> b!1036482 (= lt!457151 (select (arr!31431 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!457150 () Unit!33894)

(assert (=> b!1036482 (= lt!457150 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11459 lt!456791) lt!457151 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1036482 (arrayContainsKey!0 (_keys!11459 lt!456791) lt!457151 #b00000000000000000000000000000000)))

(declare-fun lt!457152 () Unit!33894)

(assert (=> b!1036482 (= lt!457152 lt!457150)))

(declare-fun res!691810 () Bool)

(assert (=> b!1036482 (= res!691810 (= (seekEntryOrOpen!0 (select (arr!31431 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11459 lt!456791) (mask!30171 lt!456791)) (Found!9746 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036482 (=> (not res!691810) (not e!586189))))

(declare-fun b!1036483 () Bool)

(assert (=> b!1036483 (= e!586189 call!43869)))

(declare-fun b!1036484 () Bool)

(assert (=> b!1036484 (= e!586191 e!586190)))

(declare-fun c!104904 () Bool)

(assert (=> b!1036484 (= c!104904 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124841 (not res!691809)) b!1036484))

(assert (= (and b!1036484 c!104904) b!1036482))

(assert (= (and b!1036484 (not c!104904)) b!1036481))

(assert (= (and b!1036482 res!691810) b!1036483))

(assert (= (or b!1036483 b!1036481) bm!43866))

(declare-fun m!956537 () Bool)

(assert (=> bm!43866 m!956537))

(assert (=> b!1036482 m!956329))

(declare-fun m!956539 () Bool)

(assert (=> b!1036482 m!956539))

(declare-fun m!956541 () Bool)

(assert (=> b!1036482 m!956541))

(assert (=> b!1036482 m!956329))

(declare-fun m!956543 () Bool)

(assert (=> b!1036482 m!956543))

(assert (=> b!1036484 m!956329))

(assert (=> b!1036484 m!956329))

(assert (=> b!1036484 m!956331))

(assert (=> bm!43845 d!124841))

(declare-fun d!124843 () Bool)

(assert (=> d!124843 (= (get!16466 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036042 d!124843))

(declare-fun d!124845 () Bool)

(declare-fun e!586192 () Bool)

(assert (=> d!124845 e!586192))

(declare-fun res!691811 () Bool)

(assert (=> d!124845 (=> res!691811 e!586192)))

(declare-fun lt!457154 () Bool)

(assert (=> d!124845 (= res!691811 (not lt!457154))))

(declare-fun lt!457156 () Bool)

(assert (=> d!124845 (= lt!457154 lt!457156)))

(declare-fun lt!457153 () Unit!33894)

(declare-fun e!586193 () Unit!33894)

(assert (=> d!124845 (= lt!457153 e!586193)))

(declare-fun c!104905 () Bool)

(assert (=> d!124845 (= c!104905 lt!457156)))

(assert (=> d!124845 (= lt!457156 (containsKey!564 (toList!6895 lt!456977) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(assert (=> d!124845 (= (contains!6021 lt!456977 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) lt!457154)))

(declare-fun b!1036485 () Bool)

(declare-fun lt!457155 () Unit!33894)

(assert (=> b!1036485 (= e!586193 lt!457155)))

(assert (=> b!1036485 (= lt!457155 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456977) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(assert (=> b!1036485 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456977) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036486 () Bool)

(declare-fun Unit!33921 () Unit!33894)

(assert (=> b!1036486 (= e!586193 Unit!33921)))

(declare-fun b!1036487 () Bool)

(assert (=> b!1036487 (= e!586192 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456977) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(assert (= (and d!124845 c!104905) b!1036485))

(assert (= (and d!124845 (not c!104905)) b!1036486))

(assert (= (and d!124845 (not res!691811)) b!1036487))

(declare-fun m!956545 () Bool)

(assert (=> d!124845 m!956545))

(declare-fun m!956547 () Bool)

(assert (=> b!1036485 m!956547))

(assert (=> b!1036485 m!955967))

(assert (=> b!1036485 m!955967))

(declare-fun m!956549 () Bool)

(assert (=> b!1036485 m!956549))

(assert (=> b!1036487 m!955967))

(assert (=> b!1036487 m!955967))

(assert (=> b!1036487 m!956549))

(assert (=> d!124607 d!124845))

(declare-fun b!1036489 () Bool)

(declare-fun e!586194 () Option!640)

(declare-fun e!586195 () Option!640)

(assert (=> b!1036489 (= e!586194 e!586195)))

(declare-fun c!104907 () Bool)

(assert (=> b!1036489 (= c!104907 (and ((_ is Cons!21914) lt!456976) (not (= (_1!7876 (h!23116 lt!456976)) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))))

(declare-fun c!104906 () Bool)

(declare-fun d!124847 () Bool)

(assert (=> d!124847 (= c!104906 (and ((_ is Cons!21914) lt!456976) (= (_1!7876 (h!23116 lt!456976)) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(assert (=> d!124847 (= (getValueByKey!589 lt!456976 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) e!586194)))

(declare-fun b!1036490 () Bool)

(assert (=> b!1036490 (= e!586195 (getValueByKey!589 (t!31125 lt!456976) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036488 () Bool)

(assert (=> b!1036488 (= e!586194 (Some!639 (_2!7876 (h!23116 lt!456976))))))

(declare-fun b!1036491 () Bool)

(assert (=> b!1036491 (= e!586195 None!638)))

(assert (= (and d!124847 c!104906) b!1036488))

(assert (= (and d!124847 (not c!104906)) b!1036489))

(assert (= (and b!1036489 c!104907) b!1036490))

(assert (= (and b!1036489 (not c!104907)) b!1036491))

(declare-fun m!956551 () Bool)

(assert (=> b!1036490 m!956551))

(assert (=> d!124607 d!124847))

(declare-fun d!124849 () Bool)

(assert (=> d!124849 (= (getValueByKey!589 lt!456976 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun lt!457157 () Unit!33894)

(assert (=> d!124849 (= lt!457157 (choose!1705 lt!456976 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun e!586196 () Bool)

(assert (=> d!124849 e!586196))

(declare-fun res!691812 () Bool)

(assert (=> d!124849 (=> (not res!691812) (not e!586196))))

(assert (=> d!124849 (= res!691812 (isStrictlySorted!719 lt!456976))))

(assert (=> d!124849 (= (lemmaContainsTupThenGetReturnValue!280 lt!456976 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) lt!457157)))

(declare-fun b!1036492 () Bool)

(declare-fun res!691813 () Bool)

(assert (=> b!1036492 (=> (not res!691813) (not e!586196))))

(assert (=> b!1036492 (= res!691813 (containsKey!564 lt!456976 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036493 () Bool)

(assert (=> b!1036493 (= e!586196 (contains!6022 lt!456976 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(assert (= (and d!124849 res!691812) b!1036492))

(assert (= (and b!1036492 res!691813) b!1036493))

(assert (=> d!124849 m!955961))

(declare-fun m!956553 () Bool)

(assert (=> d!124849 m!956553))

(declare-fun m!956555 () Bool)

(assert (=> d!124849 m!956555))

(declare-fun m!956557 () Bool)

(assert (=> b!1036492 m!956557))

(declare-fun m!956559 () Bool)

(assert (=> b!1036493 m!956559))

(assert (=> d!124607 d!124849))

(declare-fun b!1036494 () Bool)

(declare-fun e!586200 () List!21918)

(assert (=> b!1036494 (= e!586200 (insertStrictlySorted!373 (t!31125 (toList!6895 lt!456854)) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036495 () Bool)

(declare-fun e!586199 () List!21918)

(declare-fun call!43872 () List!21918)

(assert (=> b!1036495 (= e!586199 call!43872)))

(declare-fun bm!43867 () Bool)

(declare-fun call!43870 () List!21918)

(assert (=> bm!43867 (= call!43872 call!43870)))

(declare-fun b!1036496 () Bool)

(declare-fun e!586201 () List!21918)

(assert (=> b!1036496 (= e!586201 call!43870)))

(declare-fun b!1036497 () Bool)

(declare-fun e!586197 () List!21918)

(declare-fun call!43871 () List!21918)

(assert (=> b!1036497 (= e!586197 call!43871)))

(declare-fun b!1036498 () Bool)

(declare-fun res!691815 () Bool)

(declare-fun e!586198 () Bool)

(assert (=> b!1036498 (=> (not res!691815) (not e!586198))))

(declare-fun lt!457158 () List!21918)

(assert (=> b!1036498 (= res!691815 (containsKey!564 lt!457158 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun c!104908 () Bool)

(declare-fun b!1036500 () Bool)

(assert (=> b!1036500 (= c!104908 (and ((_ is Cons!21914) (toList!6895 lt!456854)) (bvsgt (_1!7876 (h!23116 (toList!6895 lt!456854))) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(assert (=> b!1036500 (= e!586199 e!586197)))

(declare-fun b!1036501 () Bool)

(assert (=> b!1036501 (= e!586197 call!43871)))

(declare-fun b!1036502 () Bool)

(assert (=> b!1036502 (= e!586198 (contains!6022 lt!457158 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(declare-fun bm!43868 () Bool)

(declare-fun c!104909 () Bool)

(assert (=> bm!43868 (= call!43870 ($colon$colon!603 e!586200 (ite c!104909 (h!23116 (toList!6895 lt!456854)) (tuple2!15731 (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))))

(declare-fun c!104910 () Bool)

(assert (=> bm!43868 (= c!104910 c!104909)))

(declare-fun b!1036503 () Bool)

(assert (=> b!1036503 (= e!586201 e!586199)))

(declare-fun c!104911 () Bool)

(assert (=> b!1036503 (= c!104911 (and ((_ is Cons!21914) (toList!6895 lt!456854)) (= (_1!7876 (h!23116 (toList!6895 lt!456854))) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(declare-fun bm!43869 () Bool)

(assert (=> bm!43869 (= call!43871 call!43872)))

(declare-fun b!1036499 () Bool)

(assert (=> b!1036499 (= e!586200 (ite c!104911 (t!31125 (toList!6895 lt!456854)) (ite c!104908 (Cons!21914 (h!23116 (toList!6895 lt!456854)) (t!31125 (toList!6895 lt!456854))) Nil!21915)))))

(declare-fun d!124851 () Bool)

(assert (=> d!124851 e!586198))

(declare-fun res!691814 () Bool)

(assert (=> d!124851 (=> (not res!691814) (not e!586198))))

(assert (=> d!124851 (= res!691814 (isStrictlySorted!719 lt!457158))))

(assert (=> d!124851 (= lt!457158 e!586201)))

(assert (=> d!124851 (= c!104909 (and ((_ is Cons!21914) (toList!6895 lt!456854)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456854))) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(assert (=> d!124851 (isStrictlySorted!719 (toList!6895 lt!456854))))

(assert (=> d!124851 (= (insertStrictlySorted!373 (toList!6895 lt!456854) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) lt!457158)))

(assert (= (and d!124851 c!104909) b!1036496))

(assert (= (and d!124851 (not c!104909)) b!1036503))

(assert (= (and b!1036503 c!104911) b!1036495))

(assert (= (and b!1036503 (not c!104911)) b!1036500))

(assert (= (and b!1036500 c!104908) b!1036501))

(assert (= (and b!1036500 (not c!104908)) b!1036497))

(assert (= (or b!1036501 b!1036497) bm!43869))

(assert (= (or b!1036495 bm!43869) bm!43867))

(assert (= (or b!1036496 bm!43867) bm!43868))

(assert (= (and bm!43868 c!104910) b!1036494))

(assert (= (and bm!43868 (not c!104910)) b!1036499))

(assert (= (and d!124851 res!691814) b!1036498))

(assert (= (and b!1036498 res!691815) b!1036502))

(declare-fun m!956561 () Bool)

(assert (=> b!1036502 m!956561))

(declare-fun m!956563 () Bool)

(assert (=> b!1036494 m!956563))

(declare-fun m!956565 () Bool)

(assert (=> b!1036498 m!956565))

(declare-fun m!956567 () Bool)

(assert (=> bm!43868 m!956567))

(declare-fun m!956569 () Bool)

(assert (=> d!124851 m!956569))

(declare-fun m!956571 () Bool)

(assert (=> d!124851 m!956571))

(assert (=> d!124607 d!124851))

(declare-fun d!124853 () Bool)

(assert (=> d!124853 (= (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!930 (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30346 () Bool)

(assert (= bs!30346 d!124853))

(assert (=> bs!30346 m!955819))

(declare-fun m!956573 () Bool)

(assert (=> bs!30346 m!956573))

(assert (=> b!1036199 d!124853))

(declare-fun b!1036505 () Bool)

(declare-fun e!586202 () Option!640)

(declare-fun e!586203 () Option!640)

(assert (=> b!1036505 (= e!586202 e!586203)))

(declare-fun c!104913 () Bool)

(assert (=> b!1036505 (= c!104913 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456864))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun d!124855 () Bool)

(declare-fun c!104912 () Bool)

(assert (=> d!124855 (= c!104912 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (= (_1!7876 (h!23116 (toList!6895 lt!456864))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124855 (= (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) e!586202)))

(declare-fun b!1036506 () Bool)

(assert (=> b!1036506 (= e!586203 (getValueByKey!589 (t!31125 (toList!6895 lt!456864)) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036504 () Bool)

(assert (=> b!1036504 (= e!586202 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456864)))))))

(declare-fun b!1036507 () Bool)

(assert (=> b!1036507 (= e!586203 None!638)))

(assert (= (and d!124855 c!104912) b!1036504))

(assert (= (and d!124855 (not c!104912)) b!1036505))

(assert (= (and b!1036505 c!104913) b!1036506))

(assert (= (and b!1036505 (not c!104913)) b!1036507))

(assert (=> b!1036506 m!955693))

(declare-fun m!956575 () Bool)

(assert (=> b!1036506 m!956575))

(assert (=> b!1036199 d!124855))

(declare-fun b!1036509 () Bool)

(declare-fun e!586204 () Option!640)

(declare-fun e!586205 () Option!640)

(assert (=> b!1036509 (= e!586204 e!586205)))

(declare-fun c!104915 () Bool)

(assert (=> b!1036509 (= c!104915 (and ((_ is Cons!21914) (toList!6895 lt!456997)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456997))) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))))

(declare-fun c!104914 () Bool)

(declare-fun d!124857 () Bool)

(assert (=> d!124857 (= c!104914 (and ((_ is Cons!21914) (toList!6895 lt!456997)) (= (_1!7876 (h!23116 (toList!6895 lt!456997))) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(assert (=> d!124857 (= (getValueByKey!589 (toList!6895 lt!456997) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))) e!586204)))

(declare-fun b!1036510 () Bool)

(assert (=> b!1036510 (= e!586205 (getValueByKey!589 (t!31125 (toList!6895 lt!456997)) (_1!7876 (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun b!1036508 () Bool)

(assert (=> b!1036508 (= e!586204 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456997)))))))

(declare-fun b!1036511 () Bool)

(assert (=> b!1036511 (= e!586205 None!638)))

(assert (= (and d!124857 c!104914) b!1036508))

(assert (= (and d!124857 (not c!104914)) b!1036509))

(assert (= (and b!1036509 c!104915) b!1036510))

(assert (= (and b!1036509 (not c!104915)) b!1036511))

(declare-fun m!956577 () Bool)

(assert (=> b!1036510 m!956577))

(assert (=> b!1036143 d!124857))

(declare-fun b!1036513 () Bool)

(declare-fun e!586206 () Option!640)

(declare-fun e!586207 () Option!640)

(assert (=> b!1036513 (= e!586206 e!586207)))

(declare-fun c!104917 () Bool)

(assert (=> b!1036513 (= c!104917 (and ((_ is Cons!21914) (toList!6895 lt!456977)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456977))) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))))

(declare-fun c!104916 () Bool)

(declare-fun d!124859 () Bool)

(assert (=> d!124859 (= c!104916 (and ((_ is Cons!21914) (toList!6895 lt!456977)) (= (_1!7876 (h!23116 (toList!6895 lt!456977))) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))))

(assert (=> d!124859 (= (getValueByKey!589 (toList!6895 lt!456977) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))) e!586206)))

(declare-fun b!1036514 () Bool)

(assert (=> b!1036514 (= e!586207 (getValueByKey!589 (t!31125 (toList!6895 lt!456977)) (_1!7876 (tuple2!15731 lt!456849 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036512 () Bool)

(assert (=> b!1036512 (= e!586206 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456977)))))))

(declare-fun b!1036515 () Bool)

(assert (=> b!1036515 (= e!586207 None!638)))

(assert (= (and d!124859 c!104916) b!1036512))

(assert (= (and d!124859 (not c!104916)) b!1036513))

(assert (= (and b!1036513 c!104917) b!1036514))

(assert (= (and b!1036513 (not c!104917)) b!1036515))

(declare-fun m!956579 () Bool)

(assert (=> b!1036514 m!956579))

(assert (=> b!1036132 d!124859))

(declare-fun b!1036517 () Bool)

(declare-fun e!586208 () Option!640)

(declare-fun e!586209 () Option!640)

(assert (=> b!1036517 (= e!586208 e!586209)))

(declare-fun c!104919 () Bool)

(assert (=> b!1036517 (= c!104919 (and ((_ is Cons!21914) (toList!6895 lt!456989)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456989))) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))))

(declare-fun d!124861 () Bool)

(declare-fun c!104918 () Bool)

(assert (=> d!124861 (= c!104918 (and ((_ is Cons!21914) (toList!6895 lt!456989)) (= (_1!7876 (h!23116 (toList!6895 lt!456989))) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!124861 (= (getValueByKey!589 (toList!6895 lt!456989) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) e!586208)))

(declare-fun b!1036518 () Bool)

(assert (=> b!1036518 (= e!586209 (getValueByKey!589 (t!31125 (toList!6895 lt!456989)) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036516 () Bool)

(assert (=> b!1036516 (= e!586208 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456989)))))))

(declare-fun b!1036519 () Bool)

(assert (=> b!1036519 (= e!586209 None!638)))

(assert (= (and d!124861 c!104918) b!1036516))

(assert (= (and d!124861 (not c!104918)) b!1036517))

(assert (= (and b!1036517 c!104919) b!1036518))

(assert (= (and b!1036517 (not c!104919)) b!1036519))

(declare-fun m!956581 () Bool)

(assert (=> b!1036518 m!956581))

(assert (=> b!1036139 d!124861))

(declare-fun lt!457159 () Bool)

(declare-fun d!124863 () Bool)

(assert (=> d!124863 (= lt!457159 (select (content!514 (toList!6895 lt!457016)) (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun e!586210 () Bool)

(assert (=> d!124863 (= lt!457159 e!586210)))

(declare-fun res!691816 () Bool)

(assert (=> d!124863 (=> (not res!691816) (not e!586210))))

(assert (=> d!124863 (= res!691816 ((_ is Cons!21914) (toList!6895 lt!457016)))))

(assert (=> d!124863 (= (contains!6022 (toList!6895 lt!457016) (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) lt!457159)))

(declare-fun b!1036520 () Bool)

(declare-fun e!586211 () Bool)

(assert (=> b!1036520 (= e!586210 e!586211)))

(declare-fun res!691817 () Bool)

(assert (=> b!1036520 (=> res!691817 e!586211)))

(assert (=> b!1036520 (= res!691817 (= (h!23116 (toList!6895 lt!457016)) (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036521 () Bool)

(assert (=> b!1036521 (= e!586211 (contains!6022 (t!31125 (toList!6895 lt!457016)) (ite (or c!104763 c!104760) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(assert (= (and d!124863 res!691816) b!1036520))

(assert (= (and b!1036520 (not res!691817)) b!1036521))

(declare-fun m!956583 () Bool)

(assert (=> d!124863 m!956583))

(declare-fun m!956585 () Bool)

(assert (=> d!124863 m!956585))

(declare-fun m!956587 () Bool)

(assert (=> b!1036521 m!956587))

(assert (=> b!1036196 d!124863))

(declare-fun d!124865 () Bool)

(declare-fun isEmpty!931 (List!21918) Bool)

(assert (=> d!124865 (= (isEmpty!929 lt!456950) (isEmpty!931 (toList!6895 lt!456950)))))

(declare-fun bs!30347 () Bool)

(assert (= bs!30347 d!124865))

(declare-fun m!956589 () Bool)

(assert (=> bs!30347 m!956589))

(assert (=> b!1036105 d!124865))

(declare-fun d!124867 () Bool)

(assert (=> d!124867 (= (validMask!0 (mask!30171 lt!456791)) (and (or (= (mask!30171 lt!456791) #b00000000000000000000000000000111) (= (mask!30171 lt!456791) #b00000000000000000000000000001111) (= (mask!30171 lt!456791) #b00000000000000000000000000011111) (= (mask!30171 lt!456791) #b00000000000000000000000000111111) (= (mask!30171 lt!456791) #b00000000000000000000000001111111) (= (mask!30171 lt!456791) #b00000000000000000000000011111111) (= (mask!30171 lt!456791) #b00000000000000000000000111111111) (= (mask!30171 lt!456791) #b00000000000000000000001111111111) (= (mask!30171 lt!456791) #b00000000000000000000011111111111) (= (mask!30171 lt!456791) #b00000000000000000000111111111111) (= (mask!30171 lt!456791) #b00000000000000000001111111111111) (= (mask!30171 lt!456791) #b00000000000000000011111111111111) (= (mask!30171 lt!456791) #b00000000000000000111111111111111) (= (mask!30171 lt!456791) #b00000000000000001111111111111111) (= (mask!30171 lt!456791) #b00000000000000011111111111111111) (= (mask!30171 lt!456791) #b00000000000000111111111111111111) (= (mask!30171 lt!456791) #b00000000000001111111111111111111) (= (mask!30171 lt!456791) #b00000000000011111111111111111111) (= (mask!30171 lt!456791) #b00000000000111111111111111111111) (= (mask!30171 lt!456791) #b00000000001111111111111111111111) (= (mask!30171 lt!456791) #b00000000011111111111111111111111) (= (mask!30171 lt!456791) #b00000000111111111111111111111111) (= (mask!30171 lt!456791) #b00000001111111111111111111111111) (= (mask!30171 lt!456791) #b00000011111111111111111111111111) (= (mask!30171 lt!456791) #b00000111111111111111111111111111) (= (mask!30171 lt!456791) #b00001111111111111111111111111111) (= (mask!30171 lt!456791) #b00011111111111111111111111111111) (= (mask!30171 lt!456791) #b00111111111111111111111111111111)) (bvsle (mask!30171 lt!456791) #b00111111111111111111111111111111)))))

(assert (=> d!124699 d!124867))

(declare-fun d!124869 () Bool)

(declare-fun res!691818 () Bool)

(declare-fun e!586212 () Bool)

(assert (=> d!124869 (=> res!691818 e!586212)))

(assert (=> d!124869 (= res!691818 (and ((_ is Cons!21914) (toList!6895 lt!456874)) (= (_1!7876 (h!23116 (toList!6895 lt!456874))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124869 (= (containsKey!564 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000) e!586212)))

(declare-fun b!1036522 () Bool)

(declare-fun e!586213 () Bool)

(assert (=> b!1036522 (= e!586212 e!586213)))

(declare-fun res!691819 () Bool)

(assert (=> b!1036522 (=> (not res!691819) (not e!586213))))

(assert (=> b!1036522 (= res!691819 (and (or (not ((_ is Cons!21914) (toList!6895 lt!456874))) (bvsle (_1!7876 (h!23116 (toList!6895 lt!456874))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21914) (toList!6895 lt!456874)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456874))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036523 () Bool)

(assert (=> b!1036523 (= e!586213 (containsKey!564 (t!31125 (toList!6895 lt!456874)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124869 (not res!691818)) b!1036522))

(assert (= (and b!1036522 res!691819) b!1036523))

(declare-fun m!956591 () Bool)

(assert (=> b!1036523 m!956591))

(assert (=> d!124633 d!124869))

(declare-fun d!124871 () Bool)

(assert (=> d!124871 (= (isDefined!436 (getValueByKey!589 (toList!6895 lt!456804) key!909)) (not (isEmpty!930 (getValueByKey!589 (toList!6895 lt!456804) key!909))))))

(declare-fun bs!30348 () Bool)

(assert (= bs!30348 d!124871))

(assert (=> bs!30348 m!956235))

(declare-fun m!956593 () Bool)

(assert (=> bs!30348 m!956593))

(assert (=> b!1036233 d!124871))

(declare-fun b!1036525 () Bool)

(declare-fun e!586214 () Option!640)

(declare-fun e!586215 () Option!640)

(assert (=> b!1036525 (= e!586214 e!586215)))

(declare-fun c!104921 () Bool)

(assert (=> b!1036525 (= c!104921 (and ((_ is Cons!21914) (toList!6895 lt!456804)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456804))) key!909))))))

(declare-fun d!124873 () Bool)

(declare-fun c!104920 () Bool)

(assert (=> d!124873 (= c!104920 (and ((_ is Cons!21914) (toList!6895 lt!456804)) (= (_1!7876 (h!23116 (toList!6895 lt!456804))) key!909)))))

(assert (=> d!124873 (= (getValueByKey!589 (toList!6895 lt!456804) key!909) e!586214)))

(declare-fun b!1036526 () Bool)

(assert (=> b!1036526 (= e!586215 (getValueByKey!589 (t!31125 (toList!6895 lt!456804)) key!909))))

(declare-fun b!1036524 () Bool)

(assert (=> b!1036524 (= e!586214 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456804)))))))

(declare-fun b!1036527 () Bool)

(assert (=> b!1036527 (= e!586215 None!638)))

(assert (= (and d!124873 c!104920) b!1036524))

(assert (= (and d!124873 (not c!104920)) b!1036525))

(assert (= (and b!1036525 c!104921) b!1036526))

(assert (= (and b!1036525 (not c!104921)) b!1036527))

(declare-fun m!956595 () Bool)

(assert (=> b!1036526 m!956595))

(assert (=> b!1036233 d!124873))

(declare-fun d!124875 () Bool)

(declare-fun res!691824 () Bool)

(declare-fun e!586220 () Bool)

(assert (=> d!124875 (=> res!691824 e!586220)))

(assert (=> d!124875 (= res!691824 (or ((_ is Nil!21915) lt!457009) ((_ is Nil!21915) (t!31125 lt!457009))))))

(assert (=> d!124875 (= (isStrictlySorted!719 lt!457009) e!586220)))

(declare-fun b!1036532 () Bool)

(declare-fun e!586221 () Bool)

(assert (=> b!1036532 (= e!586220 e!586221)))

(declare-fun res!691825 () Bool)

(assert (=> b!1036532 (=> (not res!691825) (not e!586221))))

(assert (=> b!1036532 (= res!691825 (bvslt (_1!7876 (h!23116 lt!457009)) (_1!7876 (h!23116 (t!31125 lt!457009)))))))

(declare-fun b!1036533 () Bool)

(assert (=> b!1036533 (= e!586221 (isStrictlySorted!719 (t!31125 lt!457009)))))

(assert (= (and d!124875 (not res!691824)) b!1036532))

(assert (= (and b!1036532 res!691825) b!1036533))

(declare-fun m!956597 () Bool)

(assert (=> b!1036533 m!956597))

(assert (=> d!124635 d!124875))

(declare-fun d!124877 () Bool)

(declare-fun res!691826 () Bool)

(declare-fun e!586222 () Bool)

(assert (=> d!124877 (=> res!691826 e!586222)))

(assert (=> d!124877 (= res!691826 (or ((_ is Nil!21915) (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) ((_ is Nil!21915) (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))))))

(assert (=> d!124877 (= (isStrictlySorted!719 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) e!586222)))

(declare-fun b!1036534 () Bool)

(declare-fun e!586223 () Bool)

(assert (=> b!1036534 (= e!586222 e!586223)))

(declare-fun res!691827 () Bool)

(assert (=> b!1036534 (=> (not res!691827) (not e!586223))))

(assert (=> b!1036534 (= res!691827 (bvslt (_1!7876 (h!23116 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))) (_1!7876 (h!23116 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))))))))

(declare-fun b!1036535 () Bool)

(assert (=> b!1036535 (= e!586223 (isStrictlySorted!719 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))))))

(assert (= (and d!124877 (not res!691826)) b!1036534))

(assert (= (and b!1036534 res!691827) b!1036535))

(declare-fun m!956599 () Bool)

(assert (=> b!1036535 m!956599))

(assert (=> d!124635 d!124877))

(declare-fun d!124879 () Bool)

(assert (=> d!124879 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457160 () Unit!33894)

(assert (=> d!124879 (= lt!457160 (choose!1706 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586224 () Bool)

(assert (=> d!124879 e!586224))

(declare-fun res!691828 () Bool)

(assert (=> d!124879 (=> (not res!691828) (not e!586224))))

(assert (=> d!124879 (= res!691828 (isStrictlySorted!719 (toList!6895 lt!456864)))))

(assert (=> d!124879 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000) lt!457160)))

(declare-fun b!1036536 () Bool)

(assert (=> b!1036536 (= e!586224 (containsKey!564 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124879 res!691828) b!1036536))

(assert (=> d!124879 m!956107))

(assert (=> d!124879 m!956107))

(assert (=> d!124879 m!956229))

(declare-fun m!956601 () Bool)

(assert (=> d!124879 m!956601))

(declare-fun m!956603 () Bool)

(assert (=> d!124879 m!956603))

(assert (=> b!1036536 m!956225))

(assert (=> b!1036228 d!124879))

(declare-fun d!124881 () Bool)

(assert (=> d!124881 (= (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!930 (getValueByKey!589 (toList!6895 lt!456864) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30349 () Bool)

(assert (= bs!30349 d!124881))

(assert (=> bs!30349 m!956107))

(declare-fun m!956605 () Bool)

(assert (=> bs!30349 m!956605))

(assert (=> b!1036228 d!124881))

(assert (=> b!1036228 d!124839))

(declare-fun d!124883 () Bool)

(assert (=> d!124883 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457161 () Unit!33894)

(assert (=> d!124883 (= lt!457161 (choose!1706 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586225 () Bool)

(assert (=> d!124883 e!586225))

(declare-fun res!691829 () Bool)

(assert (=> d!124883 (=> (not res!691829) (not e!586225))))

(assert (=> d!124883 (= res!691829 (isStrictlySorted!719 (toList!6895 lt!456874)))))

(assert (=> d!124883 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457161)))

(declare-fun b!1036537 () Bool)

(assert (=> b!1036537 (= e!586225 (containsKey!564 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124883 res!691829) b!1036537))

(assert (=> d!124883 m!956059))

(assert (=> d!124883 m!956059))

(assert (=> d!124883 m!956061))

(declare-fun m!956607 () Bool)

(assert (=> d!124883 m!956607))

(declare-fun m!956609 () Bool)

(assert (=> d!124883 m!956609))

(assert (=> b!1036537 m!956055))

(assert (=> b!1036147 d!124883))

(declare-fun d!124885 () Bool)

(assert (=> d!124885 (= (isDefined!436 (getValueByKey!589 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!930 (getValueByKey!589 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30350 () Bool)

(assert (= bs!30350 d!124885))

(assert (=> bs!30350 m!956059))

(declare-fun m!956611 () Bool)

(assert (=> bs!30350 m!956611))

(assert (=> b!1036147 d!124885))

(declare-fun b!1036539 () Bool)

(declare-fun e!586226 () Option!640)

(declare-fun e!586227 () Option!640)

(assert (=> b!1036539 (= e!586226 e!586227)))

(declare-fun c!104923 () Bool)

(assert (=> b!1036539 (= c!104923 (and ((_ is Cons!21914) (toList!6895 lt!456874)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456874))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!124887 () Bool)

(declare-fun c!104922 () Bool)

(assert (=> d!124887 (= c!104922 (and ((_ is Cons!21914) (toList!6895 lt!456874)) (= (_1!7876 (h!23116 (toList!6895 lt!456874))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124887 (= (getValueByKey!589 (toList!6895 lt!456874) #b1000000000000000000000000000000000000000000000000000000000000000) e!586226)))

(declare-fun b!1036540 () Bool)

(assert (=> b!1036540 (= e!586227 (getValueByKey!589 (t!31125 (toList!6895 lt!456874)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036538 () Bool)

(assert (=> b!1036538 (= e!586226 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456874)))))))

(declare-fun b!1036541 () Bool)

(assert (=> b!1036541 (= e!586227 None!638)))

(assert (= (and d!124887 c!104922) b!1036538))

(assert (= (and d!124887 (not c!104922)) b!1036539))

(assert (= (and b!1036539 c!104923) b!1036540))

(assert (= (and b!1036539 (not c!104923)) b!1036541))

(declare-fun m!956613 () Bool)

(assert (=> b!1036540 m!956613))

(assert (=> b!1036147 d!124887))

(declare-fun b!1036543 () Bool)

(declare-fun e!586228 () Option!640)

(declare-fun e!586229 () Option!640)

(assert (=> b!1036543 (= e!586228 e!586229)))

(declare-fun c!104925 () Bool)

(assert (=> b!1036543 (= c!104925 (and ((_ is Cons!21914) (toList!6895 lt!457047)) (not (= (_1!7876 (h!23116 (toList!6895 lt!457047))) (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))))

(declare-fun c!104924 () Bool)

(declare-fun d!124889 () Bool)

(assert (=> d!124889 (= c!104924 (and ((_ is Cons!21914) (toList!6895 lt!457047)) (= (_1!7876 (h!23116 (toList!6895 lt!457047))) (_1!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(assert (=> d!124889 (= (getValueByKey!589 (toList!6895 lt!457047) (_1!7876 (tuple2!15731 lt!456878 lt!456792))) e!586228)))

(declare-fun b!1036544 () Bool)

(assert (=> b!1036544 (= e!586229 (getValueByKey!589 (t!31125 (toList!6895 lt!457047)) (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun b!1036542 () Bool)

(assert (=> b!1036542 (= e!586228 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!457047)))))))

(declare-fun b!1036545 () Bool)

(assert (=> b!1036545 (= e!586229 None!638)))

(assert (= (and d!124889 c!104924) b!1036542))

(assert (= (and d!124889 (not c!104924)) b!1036543))

(assert (= (and b!1036543 c!104925) b!1036544))

(assert (= (and b!1036543 (not c!104925)) b!1036545))

(declare-fun m!956615 () Bool)

(assert (=> b!1036544 m!956615))

(assert (=> b!1036224 d!124889))

(assert (=> b!1036124 d!124581))

(declare-fun d!124891 () Bool)

(declare-fun lt!457164 () Bool)

(declare-fun content!515 (List!21920) (InoxSet (_ BitVec 64)))

(assert (=> d!124891 (= lt!457164 (select (content!515 Nil!21917) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586234 () Bool)

(assert (=> d!124891 (= lt!457164 e!586234)))

(declare-fun res!691834 () Bool)

(assert (=> d!124891 (=> (not res!691834) (not e!586234))))

(assert (=> d!124891 (= res!691834 ((_ is Cons!21916) Nil!21917))))

(assert (=> d!124891 (= (contains!6023 Nil!21917 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) lt!457164)))

(declare-fun b!1036550 () Bool)

(declare-fun e!586235 () Bool)

(assert (=> b!1036550 (= e!586234 e!586235)))

(declare-fun res!691835 () Bool)

(assert (=> b!1036550 (=> res!691835 e!586235)))

(assert (=> b!1036550 (= res!691835 (= (h!23118 Nil!21917) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036551 () Bool)

(assert (=> b!1036551 (= e!586235 (contains!6023 (t!31131 Nil!21917) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124891 res!691834) b!1036550))

(assert (= (and b!1036550 (not res!691835)) b!1036551))

(declare-fun m!956617 () Bool)

(assert (=> d!124891 m!956617))

(assert (=> d!124891 m!955693))

(declare-fun m!956619 () Bool)

(assert (=> d!124891 m!956619))

(assert (=> b!1036551 m!955693))

(declare-fun m!956621 () Bool)

(assert (=> b!1036551 m!956621))

(assert (=> b!1036268 d!124891))

(declare-fun d!124893 () Bool)

(assert (=> d!124893 (= (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869)) (not (isEmpty!930 (getValueByKey!589 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869))))))

(declare-fun bs!30351 () Bool)

(assert (= bs!30351 d!124893))

(assert (=> bs!30351 m!955975))

(declare-fun m!956623 () Bool)

(assert (=> bs!30351 m!956623))

(assert (=> b!1036136 d!124893))

(declare-fun b!1036553 () Bool)

(declare-fun e!586236 () Option!640)

(declare-fun e!586237 () Option!640)

(assert (=> b!1036553 (= e!586236 e!586237)))

(declare-fun c!104927 () Bool)

(assert (=> b!1036553 (= c!104927 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))) (not (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))) lt!456869))))))

(declare-fun c!104926 () Bool)

(declare-fun d!124895 () Bool)

(assert (=> d!124895 (= c!104926 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))) lt!456869)))))

(assert (=> d!124895 (= (getValueByKey!589 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869) e!586236)))

(declare-fun b!1036554 () Bool)

(assert (=> b!1036554 (= e!586237 (getValueByKey!589 (t!31125 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))) lt!456869))))

(declare-fun b!1036552 () Bool)

(assert (=> b!1036552 (= e!586236 (Some!639 (_2!7876 (h!23116 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))))

(declare-fun b!1036555 () Bool)

(assert (=> b!1036555 (= e!586237 None!638)))

(assert (= (and d!124895 c!104926) b!1036552))

(assert (= (and d!124895 (not c!104926)) b!1036553))

(assert (= (and b!1036553 c!104927) b!1036554))

(assert (= (and b!1036553 (not c!104927)) b!1036555))

(declare-fun m!956625 () Bool)

(assert (=> b!1036554 m!956625))

(assert (=> b!1036136 d!124895))

(declare-fun d!124897 () Bool)

(declare-fun lt!457165 () Bool)

(assert (=> d!124897 (= lt!457165 (select (content!514 (toList!6895 lt!456997)) (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun e!586238 () Bool)

(assert (=> d!124897 (= lt!457165 e!586238)))

(declare-fun res!691836 () Bool)

(assert (=> d!124897 (=> (not res!691836) (not e!586238))))

(assert (=> d!124897 (= res!691836 ((_ is Cons!21914) (toList!6895 lt!456997)))))

(assert (=> d!124897 (= (contains!6022 (toList!6895 lt!456997) (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) lt!457165)))

(declare-fun b!1036556 () Bool)

(declare-fun e!586239 () Bool)

(assert (=> b!1036556 (= e!586238 e!586239)))

(declare-fun res!691837 () Bool)

(assert (=> b!1036556 (=> res!691837 e!586239)))

(assert (=> b!1036556 (= res!691837 (= (h!23116 (toList!6895 lt!456997)) (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun b!1036557 () Bool)

(assert (=> b!1036557 (= e!586239 (contains!6022 (t!31125 (toList!6895 lt!456997)) (ite (or c!104769 c!104766) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 thiss!1427)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(assert (= (and d!124897 res!691836) b!1036556))

(assert (= (and b!1036556 (not res!691837)) b!1036557))

(declare-fun m!956627 () Bool)

(assert (=> d!124897 m!956627))

(declare-fun m!956629 () Bool)

(assert (=> d!124897 m!956629))

(declare-fun m!956631 () Bool)

(assert (=> b!1036557 m!956631))

(assert (=> b!1036144 d!124897))

(assert (=> b!1036265 d!124581))

(declare-fun d!124899 () Bool)

(declare-fun e!586240 () Bool)

(assert (=> d!124899 e!586240))

(declare-fun res!691838 () Bool)

(assert (=> d!124899 (=> res!691838 e!586240)))

(declare-fun lt!457167 () Bool)

(assert (=> d!124899 (= res!691838 (not lt!457167))))

(declare-fun lt!457169 () Bool)

(assert (=> d!124899 (= lt!457167 lt!457169)))

(declare-fun lt!457166 () Unit!33894)

(declare-fun e!586241 () Unit!33894)

(assert (=> d!124899 (= lt!457166 e!586241)))

(declare-fun c!104928 () Bool)

(assert (=> d!124899 (= c!104928 lt!457169)))

(assert (=> d!124899 (= lt!457169 (containsKey!564 (toList!6895 lt!456989) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124899 (= (contains!6021 lt!456989 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) lt!457167)))

(declare-fun b!1036558 () Bool)

(declare-fun lt!457168 () Unit!33894)

(assert (=> b!1036558 (= e!586241 lt!457168)))

(assert (=> b!1036558 (= lt!457168 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456989) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(assert (=> b!1036558 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456989) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036559 () Bool)

(declare-fun Unit!33922 () Unit!33894)

(assert (=> b!1036559 (= e!586241 Unit!33922)))

(declare-fun b!1036560 () Bool)

(assert (=> b!1036560 (= e!586240 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456989) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(assert (= (and d!124899 c!104928) b!1036558))

(assert (= (and d!124899 (not c!104928)) b!1036559))

(assert (= (and d!124899 (not res!691838)) b!1036560))

(declare-fun m!956633 () Bool)

(assert (=> d!124899 m!956633))

(declare-fun m!956635 () Bool)

(assert (=> b!1036558 m!956635))

(assert (=> b!1036558 m!956015))

(assert (=> b!1036558 m!956015))

(declare-fun m!956637 () Bool)

(assert (=> b!1036558 m!956637))

(assert (=> b!1036560 m!956015))

(assert (=> b!1036560 m!956015))

(assert (=> b!1036560 m!956637))

(assert (=> d!124625 d!124899))

(declare-fun b!1036562 () Bool)

(declare-fun e!586242 () Option!640)

(declare-fun e!586243 () Option!640)

(assert (=> b!1036562 (= e!586242 e!586243)))

(declare-fun c!104930 () Bool)

(assert (=> b!1036562 (= c!104930 (and ((_ is Cons!21914) lt!456988) (not (= (_1!7876 (h!23116 lt!456988)) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))))

(declare-fun d!124901 () Bool)

(declare-fun c!104929 () Bool)

(assert (=> d!124901 (= c!104929 (and ((_ is Cons!21914) lt!456988) (= (_1!7876 (h!23116 lt!456988)) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!124901 (= (getValueByKey!589 lt!456988 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) e!586242)))

(declare-fun b!1036563 () Bool)

(assert (=> b!1036563 (= e!586243 (getValueByKey!589 (t!31125 lt!456988) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036561 () Bool)

(assert (=> b!1036561 (= e!586242 (Some!639 (_2!7876 (h!23116 lt!456988))))))

(declare-fun b!1036564 () Bool)

(assert (=> b!1036564 (= e!586243 None!638)))

(assert (= (and d!124901 c!104929) b!1036561))

(assert (= (and d!124901 (not c!104929)) b!1036562))

(assert (= (and b!1036562 c!104930) b!1036563))

(assert (= (and b!1036562 (not c!104930)) b!1036564))

(declare-fun m!956639 () Bool)

(assert (=> b!1036563 m!956639))

(assert (=> d!124625 d!124901))

(declare-fun d!124903 () Bool)

(assert (=> d!124903 (= (getValueByKey!589 lt!456988 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun lt!457170 () Unit!33894)

(assert (=> d!124903 (= lt!457170 (choose!1705 lt!456988 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun e!586244 () Bool)

(assert (=> d!124903 e!586244))

(declare-fun res!691839 () Bool)

(assert (=> d!124903 (=> (not res!691839) (not e!586244))))

(assert (=> d!124903 (= res!691839 (isStrictlySorted!719 lt!456988))))

(assert (=> d!124903 (= (lemmaContainsTupThenGetReturnValue!280 lt!456988 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) lt!457170)))

(declare-fun b!1036565 () Bool)

(declare-fun res!691840 () Bool)

(assert (=> b!1036565 (=> (not res!691840) (not e!586244))))

(assert (=> b!1036565 (= res!691840 (containsKey!564 lt!456988 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036566 () Bool)

(assert (=> b!1036566 (= e!586244 (contains!6022 lt!456988 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(assert (= (and d!124903 res!691839) b!1036565))

(assert (= (and b!1036565 res!691840) b!1036566))

(assert (=> d!124903 m!956009))

(declare-fun m!956641 () Bool)

(assert (=> d!124903 m!956641))

(declare-fun m!956643 () Bool)

(assert (=> d!124903 m!956643))

(declare-fun m!956645 () Bool)

(assert (=> b!1036565 m!956645))

(declare-fun m!956647 () Bool)

(assert (=> b!1036566 m!956647))

(assert (=> d!124625 d!124903))

(declare-fun b!1036567 () Bool)

(declare-fun e!586248 () List!21918)

(assert (=> b!1036567 (= e!586248 (insertStrictlySorted!373 (t!31125 (toList!6895 lt!456851)) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036568 () Bool)

(declare-fun e!586247 () List!21918)

(declare-fun call!43875 () List!21918)

(assert (=> b!1036568 (= e!586247 call!43875)))

(declare-fun bm!43870 () Bool)

(declare-fun call!43873 () List!21918)

(assert (=> bm!43870 (= call!43875 call!43873)))

(declare-fun b!1036569 () Bool)

(declare-fun e!586249 () List!21918)

(assert (=> b!1036569 (= e!586249 call!43873)))

(declare-fun b!1036570 () Bool)

(declare-fun e!586245 () List!21918)

(declare-fun call!43874 () List!21918)

(assert (=> b!1036570 (= e!586245 call!43874)))

(declare-fun b!1036571 () Bool)

(declare-fun res!691842 () Bool)

(declare-fun e!586246 () Bool)

(assert (=> b!1036571 (=> (not res!691842) (not e!586246))))

(declare-fun lt!457171 () List!21918)

(assert (=> b!1036571 (= res!691842 (containsKey!564 lt!457171 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036573 () Bool)

(declare-fun c!104931 () Bool)

(assert (=> b!1036573 (= c!104931 (and ((_ is Cons!21914) (toList!6895 lt!456851)) (bvsgt (_1!7876 (h!23116 (toList!6895 lt!456851))) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(assert (=> b!1036573 (= e!586247 e!586245)))

(declare-fun b!1036574 () Bool)

(assert (=> b!1036574 (= e!586245 call!43874)))

(declare-fun b!1036575 () Bool)

(assert (=> b!1036575 (= e!586246 (contains!6022 lt!457171 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(declare-fun c!104932 () Bool)

(declare-fun bm!43871 () Bool)

(assert (=> bm!43871 (= call!43873 ($colon$colon!603 e!586248 (ite c!104932 (h!23116 (toList!6895 lt!456851)) (tuple2!15731 (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!104933 () Bool)

(assert (=> bm!43871 (= c!104933 c!104932)))

(declare-fun b!1036576 () Bool)

(assert (=> b!1036576 (= e!586249 e!586247)))

(declare-fun c!104934 () Bool)

(assert (=> b!1036576 (= c!104934 (and ((_ is Cons!21914) (toList!6895 lt!456851)) (= (_1!7876 (h!23116 (toList!6895 lt!456851))) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(declare-fun bm!43872 () Bool)

(assert (=> bm!43872 (= call!43874 call!43875)))

(declare-fun b!1036572 () Bool)

(assert (=> b!1036572 (= e!586248 (ite c!104934 (t!31125 (toList!6895 lt!456851)) (ite c!104931 (Cons!21914 (h!23116 (toList!6895 lt!456851)) (t!31125 (toList!6895 lt!456851))) Nil!21915)))))

(declare-fun d!124905 () Bool)

(assert (=> d!124905 e!586246))

(declare-fun res!691841 () Bool)

(assert (=> d!124905 (=> (not res!691841) (not e!586246))))

(assert (=> d!124905 (= res!691841 (isStrictlySorted!719 lt!457171))))

(assert (=> d!124905 (= lt!457171 e!586249)))

(assert (=> d!124905 (= c!104932 (and ((_ is Cons!21914) (toList!6895 lt!456851)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456851))) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!124905 (isStrictlySorted!719 (toList!6895 lt!456851))))

(assert (=> d!124905 (= (insertStrictlySorted!373 (toList!6895 lt!456851) (_1!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) lt!457171)))

(assert (= (and d!124905 c!104932) b!1036569))

(assert (= (and d!124905 (not c!104932)) b!1036576))

(assert (= (and b!1036576 c!104934) b!1036568))

(assert (= (and b!1036576 (not c!104934)) b!1036573))

(assert (= (and b!1036573 c!104931) b!1036574))

(assert (= (and b!1036573 (not c!104931)) b!1036570))

(assert (= (or b!1036574 b!1036570) bm!43872))

(assert (= (or b!1036568 bm!43872) bm!43870))

(assert (= (or b!1036569 bm!43870) bm!43871))

(assert (= (and bm!43871 c!104933) b!1036567))

(assert (= (and bm!43871 (not c!104933)) b!1036572))

(assert (= (and d!124905 res!691841) b!1036571))

(assert (= (and b!1036571 res!691842) b!1036575))

(declare-fun m!956649 () Bool)

(assert (=> b!1036575 m!956649))

(declare-fun m!956651 () Bool)

(assert (=> b!1036567 m!956651))

(declare-fun m!956653 () Bool)

(assert (=> b!1036571 m!956653))

(declare-fun m!956655 () Bool)

(assert (=> bm!43871 m!956655))

(declare-fun m!956657 () Bool)

(assert (=> d!124905 m!956657))

(declare-fun m!956659 () Bool)

(assert (=> d!124905 m!956659))

(assert (=> d!124625 d!124905))

(declare-fun d!124907 () Bool)

(assert (=> d!124907 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14931 (getValueByKey!589 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124701 d!124907))

(assert (=> d!124701 d!124773))

(declare-fun d!124909 () Bool)

(declare-fun lt!457172 () Bool)

(assert (=> d!124909 (= lt!457172 (select (content!515 Nil!21917) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun e!586250 () Bool)

(assert (=> d!124909 (= lt!457172 e!586250)))

(declare-fun res!691843 () Bool)

(assert (=> d!124909 (=> (not res!691843) (not e!586250))))

(assert (=> d!124909 (= res!691843 ((_ is Cons!21916) Nil!21917))))

(assert (=> d!124909 (= (contains!6023 Nil!21917 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)) lt!457172)))

(declare-fun b!1036577 () Bool)

(declare-fun e!586251 () Bool)

(assert (=> b!1036577 (= e!586250 e!586251)))

(declare-fun res!691844 () Bool)

(assert (=> b!1036577 (=> res!691844 e!586251)))

(assert (=> b!1036577 (= res!691844 (= (h!23118 Nil!21917) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun b!1036578 () Bool)

(assert (=> b!1036578 (= e!586251 (contains!6023 (t!31131 Nil!21917) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (= (and d!124909 res!691843) b!1036577))

(assert (= (and b!1036577 (not res!691844)) b!1036578))

(assert (=> d!124909 m!956617))

(assert (=> d!124909 m!955841))

(declare-fun m!956661 () Bool)

(assert (=> d!124909 m!956661))

(assert (=> b!1036578 m!955841))

(declare-fun m!956663 () Bool)

(assert (=> b!1036578 m!956663))

(assert (=> b!1036178 d!124909))

(declare-fun d!124911 () Bool)

(assert (=> d!124911 (= (apply!907 lt!456950 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (get!16464 (getValueByKey!589 (toList!6895 lt!456950) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30352 () Bool)

(assert (= bs!30352 d!124911))

(assert (=> bs!30352 m!955693))

(assert (=> bs!30352 m!956425))

(assert (=> bs!30352 m!956425))

(declare-fun m!956665 () Bool)

(assert (=> bs!30352 m!956665))

(assert (=> b!1036098 d!124911))

(assert (=> b!1036098 d!124585))

(assert (=> d!124591 d!124569))

(assert (=> d!124591 d!124565))

(assert (=> d!124591 d!124571))

(declare-fun d!124913 () Bool)

(assert (=> d!124913 (arrayContainsKey!0 (_keys!11459 thiss!1427) lt!457081 #b00000000000000000000000000000000)))

(declare-fun lt!457175 () Unit!33894)

(declare-fun choose!13 (array!65292 (_ BitVec 64) (_ BitVec 32)) Unit!33894)

(assert (=> d!124913 (= lt!457175 (choose!13 (_keys!11459 thiss!1427) lt!457081 #b00000000000000000000000000000000))))

(assert (=> d!124913 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124913 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11459 thiss!1427) lt!457081 #b00000000000000000000000000000000) lt!457175)))

(declare-fun bs!30353 () Bool)

(assert (= bs!30353 d!124913))

(assert (=> bs!30353 m!956287))

(declare-fun m!956667 () Bool)

(assert (=> bs!30353 m!956667))

(assert (=> b!1036271 d!124913))

(declare-fun d!124915 () Bool)

(declare-fun res!691849 () Bool)

(declare-fun e!586256 () Bool)

(assert (=> d!124915 (=> res!691849 e!586256)))

(assert (=> d!124915 (= res!691849 (= (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) lt!457081))))

(assert (=> d!124915 (= (arrayContainsKey!0 (_keys!11459 thiss!1427) lt!457081 #b00000000000000000000000000000000) e!586256)))

(declare-fun b!1036583 () Bool)

(declare-fun e!586257 () Bool)

(assert (=> b!1036583 (= e!586256 e!586257)))

(declare-fun res!691850 () Bool)

(assert (=> b!1036583 (=> (not res!691850) (not e!586257))))

(assert (=> b!1036583 (= res!691850 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036584 () Bool)

(assert (=> b!1036584 (= e!586257 (arrayContainsKey!0 (_keys!11459 thiss!1427) lt!457081 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124915 (not res!691849)) b!1036583))

(assert (= (and b!1036583 res!691850) b!1036584))

(assert (=> d!124915 m!955693))

(declare-fun m!956669 () Bool)

(assert (=> b!1036584 m!956669))

(assert (=> b!1036271 d!124915))

(declare-fun b!1036597 () Bool)

(declare-fun e!586266 () SeekEntryResult!9746)

(declare-fun e!586264 () SeekEntryResult!9746)

(assert (=> b!1036597 (= e!586266 e!586264)))

(declare-fun lt!457183 () (_ BitVec 64))

(declare-fun lt!457182 () SeekEntryResult!9746)

(assert (=> b!1036597 (= lt!457183 (select (arr!31431 (_keys!11459 thiss!1427)) (index!41357 lt!457182)))))

(declare-fun c!104942 () Bool)

(assert (=> b!1036597 (= c!104942 (= lt!457183 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036598 () Bool)

(assert (=> b!1036598 (= e!586264 (Found!9746 (index!41357 lt!457182)))))

(declare-fun d!124917 () Bool)

(declare-fun lt!457184 () SeekEntryResult!9746)

(assert (=> d!124917 (and (or ((_ is Undefined!9746) lt!457184) (not ((_ is Found!9746) lt!457184)) (and (bvsge (index!41356 lt!457184) #b00000000000000000000000000000000) (bvslt (index!41356 lt!457184) (size!31959 (_keys!11459 thiss!1427))))) (or ((_ is Undefined!9746) lt!457184) ((_ is Found!9746) lt!457184) (not ((_ is MissingZero!9746) lt!457184)) (and (bvsge (index!41355 lt!457184) #b00000000000000000000000000000000) (bvslt (index!41355 lt!457184) (size!31959 (_keys!11459 thiss!1427))))) (or ((_ is Undefined!9746) lt!457184) ((_ is Found!9746) lt!457184) ((_ is MissingZero!9746) lt!457184) (not ((_ is MissingVacant!9746) lt!457184)) (and (bvsge (index!41358 lt!457184) #b00000000000000000000000000000000) (bvslt (index!41358 lt!457184) (size!31959 (_keys!11459 thiss!1427))))) (or ((_ is Undefined!9746) lt!457184) (ite ((_ is Found!9746) lt!457184) (= (select (arr!31431 (_keys!11459 thiss!1427)) (index!41356 lt!457184)) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9746) lt!457184) (= (select (arr!31431 (_keys!11459 thiss!1427)) (index!41355 lt!457184)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9746) lt!457184) (= (select (arr!31431 (_keys!11459 thiss!1427)) (index!41358 lt!457184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124917 (= lt!457184 e!586266)))

(declare-fun c!104943 () Bool)

(assert (=> d!124917 (= c!104943 (and ((_ is Intermediate!9746) lt!457182) (undefined!10558 lt!457182)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65292 (_ BitVec 32)) SeekEntryResult!9746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!124917 (= lt!457182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (mask!30171 thiss!1427)) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (_keys!11459 thiss!1427) (mask!30171 thiss!1427)))))

(assert (=> d!124917 (validMask!0 (mask!30171 thiss!1427))))

(assert (=> d!124917 (= (seekEntryOrOpen!0 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (_keys!11459 thiss!1427) (mask!30171 thiss!1427)) lt!457184)))

(declare-fun b!1036599 () Bool)

(declare-fun c!104941 () Bool)

(assert (=> b!1036599 (= c!104941 (= lt!457183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586265 () SeekEntryResult!9746)

(assert (=> b!1036599 (= e!586264 e!586265)))

(declare-fun b!1036600 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65292 (_ BitVec 32)) SeekEntryResult!9746)

(assert (=> b!1036600 (= e!586265 (seekKeyOrZeroReturnVacant!0 (x!92472 lt!457182) (index!41357 lt!457182) (index!41357 lt!457182) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (_keys!11459 thiss!1427) (mask!30171 thiss!1427)))))

(declare-fun b!1036601 () Bool)

(assert (=> b!1036601 (= e!586266 Undefined!9746)))

(declare-fun b!1036602 () Bool)

(assert (=> b!1036602 (= e!586265 (MissingZero!9746 (index!41357 lt!457182)))))

(assert (= (and d!124917 c!104943) b!1036601))

(assert (= (and d!124917 (not c!104943)) b!1036597))

(assert (= (and b!1036597 c!104942) b!1036598))

(assert (= (and b!1036597 (not c!104942)) b!1036599))

(assert (= (and b!1036599 c!104941) b!1036602))

(assert (= (and b!1036599 (not c!104941)) b!1036600))

(declare-fun m!956671 () Bool)

(assert (=> b!1036597 m!956671))

(assert (=> d!124917 m!955745))

(declare-fun m!956673 () Bool)

(assert (=> d!124917 m!956673))

(declare-fun m!956675 () Bool)

(assert (=> d!124917 m!956675))

(assert (=> d!124917 m!955693))

(declare-fun m!956677 () Bool)

(assert (=> d!124917 m!956677))

(declare-fun m!956679 () Bool)

(assert (=> d!124917 m!956679))

(declare-fun m!956681 () Bool)

(assert (=> d!124917 m!956681))

(assert (=> d!124917 m!955693))

(assert (=> d!124917 m!956675))

(assert (=> b!1036600 m!955693))

(declare-fun m!956683 () Bool)

(assert (=> b!1036600 m!956683))

(assert (=> b!1036271 d!124917))

(declare-fun d!124919 () Bool)

(declare-fun e!586267 () Bool)

(assert (=> d!124919 e!586267))

(declare-fun res!691851 () Bool)

(assert (=> d!124919 (=> res!691851 e!586267)))

(declare-fun lt!457186 () Bool)

(assert (=> d!124919 (= res!691851 (not lt!457186))))

(declare-fun lt!457188 () Bool)

(assert (=> d!124919 (= lt!457186 lt!457188)))

(declare-fun lt!457185 () Unit!33894)

(declare-fun e!586268 () Unit!33894)

(assert (=> d!124919 (= lt!457185 e!586268)))

(declare-fun c!104944 () Bool)

(assert (=> d!124919 (= c!104944 lt!457188)))

(assert (=> d!124919 (= lt!457188 (containsKey!564 (toList!6895 lt!457037) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!124919 (= (contains!6021 lt!457037 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) lt!457186)))

(declare-fun b!1036603 () Bool)

(declare-fun lt!457187 () Unit!33894)

(assert (=> b!1036603 (= e!586268 lt!457187)))

(assert (=> b!1036603 (= lt!457187 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!457037) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(assert (=> b!1036603 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457037) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036604 () Bool)

(declare-fun Unit!33923 () Unit!33894)

(assert (=> b!1036604 (= e!586268 Unit!33923)))

(declare-fun b!1036605 () Bool)

(assert (=> b!1036605 (= e!586267 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457037) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(assert (= (and d!124919 c!104944) b!1036603))

(assert (= (and d!124919 (not c!104944)) b!1036604))

(assert (= (and d!124919 (not res!691851)) b!1036605))

(declare-fun m!956685 () Bool)

(assert (=> d!124919 m!956685))

(declare-fun m!956687 () Bool)

(assert (=> b!1036603 m!956687))

(assert (=> b!1036603 m!956169))

(assert (=> b!1036603 m!956169))

(declare-fun m!956689 () Bool)

(assert (=> b!1036603 m!956689))

(assert (=> b!1036605 m!956169))

(assert (=> b!1036605 m!956169))

(assert (=> b!1036605 m!956689))

(assert (=> d!124669 d!124919))

(declare-fun b!1036607 () Bool)

(declare-fun e!586269 () Option!640)

(declare-fun e!586270 () Option!640)

(assert (=> b!1036607 (= e!586269 e!586270)))

(declare-fun c!104946 () Bool)

(assert (=> b!1036607 (= c!104946 (and ((_ is Cons!21914) lt!457036) (not (= (_1!7876 (h!23116 lt!457036)) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!104945 () Bool)

(declare-fun d!124921 () Bool)

(assert (=> d!124921 (= c!104945 (and ((_ is Cons!21914) lt!457036) (= (_1!7876 (h!23116 lt!457036)) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!124921 (= (getValueByKey!589 lt!457036 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) e!586269)))

(declare-fun b!1036608 () Bool)

(assert (=> b!1036608 (= e!586270 (getValueByKey!589 (t!31125 lt!457036) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036606 () Bool)

(assert (=> b!1036606 (= e!586269 (Some!639 (_2!7876 (h!23116 lt!457036))))))

(declare-fun b!1036609 () Bool)

(assert (=> b!1036609 (= e!586270 None!638)))

(assert (= (and d!124921 c!104945) b!1036606))

(assert (= (and d!124921 (not c!104945)) b!1036607))

(assert (= (and b!1036607 c!104946) b!1036608))

(assert (= (and b!1036607 (not c!104946)) b!1036609))

(declare-fun m!956691 () Bool)

(assert (=> b!1036608 m!956691))

(assert (=> d!124669 d!124921))

(declare-fun d!124923 () Bool)

(assert (=> d!124923 (= (getValueByKey!589 lt!457036 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun lt!457189 () Unit!33894)

(assert (=> d!124923 (= lt!457189 (choose!1705 lt!457036 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun e!586271 () Bool)

(assert (=> d!124923 e!586271))

(declare-fun res!691852 () Bool)

(assert (=> d!124923 (=> (not res!691852) (not e!586271))))

(assert (=> d!124923 (= res!691852 (isStrictlySorted!719 lt!457036))))

(assert (=> d!124923 (= (lemmaContainsTupThenGetReturnValue!280 lt!457036 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) lt!457189)))

(declare-fun b!1036610 () Bool)

(declare-fun res!691853 () Bool)

(assert (=> b!1036610 (=> (not res!691853) (not e!586271))))

(assert (=> b!1036610 (= res!691853 (containsKey!564 lt!457036 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036611 () Bool)

(assert (=> b!1036611 (= e!586271 (contains!6022 lt!457036 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(assert (= (and d!124923 res!691852) b!1036610))

(assert (= (and b!1036610 res!691853) b!1036611))

(assert (=> d!124923 m!956163))

(declare-fun m!956693 () Bool)

(assert (=> d!124923 m!956693))

(declare-fun m!956695 () Bool)

(assert (=> d!124923 m!956695))

(declare-fun m!956697 () Bool)

(assert (=> b!1036610 m!956697))

(declare-fun m!956699 () Bool)

(assert (=> b!1036611 m!956699))

(assert (=> d!124669 d!124923))

(declare-fun e!586275 () List!21918)

(declare-fun b!1036612 () Bool)

(assert (=> b!1036612 (= e!586275 (insertStrictlySorted!373 (t!31125 (toList!6895 lt!456877)) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036613 () Bool)

(declare-fun e!586274 () List!21918)

(declare-fun call!43878 () List!21918)

(assert (=> b!1036613 (= e!586274 call!43878)))

(declare-fun bm!43873 () Bool)

(declare-fun call!43876 () List!21918)

(assert (=> bm!43873 (= call!43878 call!43876)))

(declare-fun b!1036614 () Bool)

(declare-fun e!586276 () List!21918)

(assert (=> b!1036614 (= e!586276 call!43876)))

(declare-fun b!1036615 () Bool)

(declare-fun e!586272 () List!21918)

(declare-fun call!43877 () List!21918)

(assert (=> b!1036615 (= e!586272 call!43877)))

(declare-fun b!1036616 () Bool)

(declare-fun res!691855 () Bool)

(declare-fun e!586273 () Bool)

(assert (=> b!1036616 (=> (not res!691855) (not e!586273))))

(declare-fun lt!457190 () List!21918)

(assert (=> b!1036616 (= res!691855 (containsKey!564 lt!457190 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))

(declare-fun c!104947 () Bool)

(declare-fun b!1036618 () Bool)

(assert (=> b!1036618 (= c!104947 (and ((_ is Cons!21914) (toList!6895 lt!456877)) (bvsgt (_1!7876 (h!23116 (toList!6895 lt!456877))) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(assert (=> b!1036618 (= e!586274 e!586272)))

(declare-fun b!1036619 () Bool)

(assert (=> b!1036619 (= e!586272 call!43877)))

(declare-fun b!1036620 () Bool)

(assert (=> b!1036620 (= e!586273 (contains!6022 lt!457190 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(declare-fun c!104948 () Bool)

(declare-fun bm!43874 () Bool)

(assert (=> bm!43874 (= call!43876 ($colon$colon!603 e!586275 (ite c!104948 (h!23116 (toList!6895 lt!456877)) (tuple2!15731 (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!104949 () Bool)

(assert (=> bm!43874 (= c!104949 c!104948)))

(declare-fun b!1036621 () Bool)

(assert (=> b!1036621 (= e!586276 e!586274)))

(declare-fun c!104950 () Bool)

(assert (=> b!1036621 (= c!104950 (and ((_ is Cons!21914) (toList!6895 lt!456877)) (= (_1!7876 (h!23116 (toList!6895 lt!456877))) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(declare-fun bm!43875 () Bool)

(assert (=> bm!43875 (= call!43877 call!43878)))

(declare-fun b!1036617 () Bool)

(assert (=> b!1036617 (= e!586275 (ite c!104950 (t!31125 (toList!6895 lt!456877)) (ite c!104947 (Cons!21914 (h!23116 (toList!6895 lt!456877)) (t!31125 (toList!6895 lt!456877))) Nil!21915)))))

(declare-fun d!124925 () Bool)

(assert (=> d!124925 e!586273))

(declare-fun res!691854 () Bool)

(assert (=> d!124925 (=> (not res!691854) (not e!586273))))

(assert (=> d!124925 (= res!691854 (isStrictlySorted!719 lt!457190))))

(assert (=> d!124925 (= lt!457190 e!586276)))

(assert (=> d!124925 (= c!104948 (and ((_ is Cons!21914) (toList!6895 lt!456877)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456877))) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!124925 (isStrictlySorted!719 (toList!6895 lt!456877))))

(assert (=> d!124925 (= (insertStrictlySorted!373 (toList!6895 lt!456877) (_1!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427)))) lt!457190)))

(assert (= (and d!124925 c!104948) b!1036614))

(assert (= (and d!124925 (not c!104948)) b!1036621))

(assert (= (and b!1036621 c!104950) b!1036613))

(assert (= (and b!1036621 (not c!104950)) b!1036618))

(assert (= (and b!1036618 c!104947) b!1036619))

(assert (= (and b!1036618 (not c!104947)) b!1036615))

(assert (= (or b!1036619 b!1036615) bm!43875))

(assert (= (or b!1036613 bm!43875) bm!43873))

(assert (= (or b!1036614 bm!43873) bm!43874))

(assert (= (and bm!43874 c!104949) b!1036612))

(assert (= (and bm!43874 (not c!104949)) b!1036617))

(assert (= (and d!124925 res!691854) b!1036616))

(assert (= (and b!1036616 res!691855) b!1036620))

(declare-fun m!956701 () Bool)

(assert (=> b!1036620 m!956701))

(declare-fun m!956703 () Bool)

(assert (=> b!1036612 m!956703))

(declare-fun m!956705 () Bool)

(assert (=> b!1036616 m!956705))

(declare-fun m!956707 () Bool)

(assert (=> bm!43874 m!956707))

(declare-fun m!956709 () Bool)

(assert (=> d!124925 m!956709))

(declare-fun m!956711 () Bool)

(assert (=> d!124925 m!956711))

(assert (=> d!124669 d!124925))

(assert (=> b!1036175 d!124809))

(declare-fun d!124927 () Bool)

(declare-fun res!691856 () Bool)

(declare-fun e!586277 () Bool)

(assert (=> d!124927 (=> res!691856 e!586277)))

(assert (=> d!124927 (= res!691856 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (= (_1!7876 (h!23116 (toList!6895 lt!456864))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124927 (= (containsKey!564 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000) e!586277)))

(declare-fun b!1036622 () Bool)

(declare-fun e!586278 () Bool)

(assert (=> b!1036622 (= e!586277 e!586278)))

(declare-fun res!691857 () Bool)

(assert (=> b!1036622 (=> (not res!691857) (not e!586278))))

(assert (=> b!1036622 (= res!691857 (and (or (not ((_ is Cons!21914) (toList!6895 lt!456864))) (bvsle (_1!7876 (h!23116 (toList!6895 lt!456864))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21914) (toList!6895 lt!456864)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456864))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036623 () Bool)

(assert (=> b!1036623 (= e!586278 (containsKey!564 (t!31125 (toList!6895 lt!456864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124927 (not res!691856)) b!1036622))

(assert (= (and b!1036622 res!691857) b!1036623))

(declare-fun m!956713 () Bool)

(assert (=> b!1036623 m!956713))

(assert (=> d!124703 d!124927))

(declare-fun d!124929 () Bool)

(declare-fun e!586279 () Bool)

(assert (=> d!124929 e!586279))

(declare-fun res!691858 () Bool)

(assert (=> d!124929 (=> (not res!691858) (not e!586279))))

(declare-fun lt!457193 () ListLongMap!13759)

(assert (=> d!124929 (= res!691858 (contains!6021 lt!457193 (_1!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))))))

(declare-fun lt!457192 () List!21918)

(assert (=> d!124929 (= lt!457193 (ListLongMap!13760 lt!457192))))

(declare-fun lt!457191 () Unit!33894)

(declare-fun lt!457194 () Unit!33894)

(assert (=> d!124929 (= lt!457191 lt!457194)))

(assert (=> d!124929 (= (getValueByKey!589 lt!457192 (_1!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))) (Some!639 (_2!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))))))

(assert (=> d!124929 (= lt!457194 (lemmaContainsTupThenGetReturnValue!280 lt!457192 (_1!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))) (_2!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))))))

(assert (=> d!124929 (= lt!457192 (insertStrictlySorted!373 (toList!6895 (ite c!104781 call!43831 (ite c!104778 call!43832 call!43830))) (_1!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))) (_2!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))))))

(assert (=> d!124929 (= (+!3105 (ite c!104781 call!43831 (ite c!104778 call!43832 call!43830)) (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))) lt!457193)))

(declare-fun b!1036624 () Bool)

(declare-fun res!691859 () Bool)

(assert (=> b!1036624 (=> (not res!691859) (not e!586279))))

(assert (=> b!1036624 (= res!691859 (= (getValueByKey!589 (toList!6895 lt!457193) (_1!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))) (Some!639 (_2!7876 (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))))))))

(declare-fun b!1036625 () Bool)

(assert (=> b!1036625 (= e!586279 (contains!6022 (toList!6895 lt!457193) (ite (or c!104781 c!104778) (tuple2!15731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6104 lt!456791)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))))))

(assert (= (and d!124929 res!691858) b!1036624))

(assert (= (and b!1036624 res!691859) b!1036625))

(declare-fun m!956715 () Bool)

(assert (=> d!124929 m!956715))

(declare-fun m!956717 () Bool)

(assert (=> d!124929 m!956717))

(declare-fun m!956719 () Bool)

(assert (=> d!124929 m!956719))

(declare-fun m!956721 () Bool)

(assert (=> d!124929 m!956721))

(declare-fun m!956723 () Bool)

(assert (=> b!1036624 m!956723))

(declare-fun m!956725 () Bool)

(assert (=> b!1036625 m!956725))

(assert (=> bm!43829 d!124929))

(declare-fun d!124931 () Bool)

(declare-fun lt!457195 () Bool)

(assert (=> d!124931 (= lt!457195 (select (content!514 (toList!6895 lt!457037)) (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))

(declare-fun e!586280 () Bool)

(assert (=> d!124931 (= lt!457195 e!586280)))

(declare-fun res!691860 () Bool)

(assert (=> d!124931 (=> (not res!691860) (not e!586280))))

(assert (=> d!124931 (= res!691860 ((_ is Cons!21914) (toList!6895 lt!457037)))))

(assert (=> d!124931 (= (contains!6022 (toList!6895 lt!457037) (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) lt!457195)))

(declare-fun b!1036626 () Bool)

(declare-fun e!586281 () Bool)

(assert (=> b!1036626 (= e!586280 e!586281)))

(declare-fun res!691861 () Bool)

(assert (=> b!1036626 (=> res!691861 e!586281)))

(assert (=> b!1036626 (= res!691861 (= (h!23116 (toList!6895 lt!457037)) (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))

(declare-fun b!1036627 () Bool)

(assert (=> b!1036627 (= e!586281 (contains!6022 (t!31125 (toList!6895 lt!457037)) (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))))))

(assert (= (and d!124931 res!691860) b!1036626))

(assert (= (and b!1036626 (not res!691861)) b!1036627))

(declare-fun m!956727 () Bool)

(assert (=> d!124931 m!956727))

(declare-fun m!956729 () Bool)

(assert (=> d!124931 m!956729))

(declare-fun m!956731 () Bool)

(assert (=> b!1036627 m!956731))

(assert (=> b!1036219 d!124931))

(assert (=> b!1036102 d!124581))

(declare-fun d!124933 () Bool)

(declare-fun e!586282 () Bool)

(assert (=> d!124933 e!586282))

(declare-fun res!691862 () Bool)

(assert (=> d!124933 (=> res!691862 e!586282)))

(declare-fun lt!457197 () Bool)

(assert (=> d!124933 (= res!691862 (not lt!457197))))

(declare-fun lt!457199 () Bool)

(assert (=> d!124933 (= lt!457197 lt!457199)))

(declare-fun lt!457196 () Unit!33894)

(declare-fun e!586283 () Unit!33894)

(assert (=> d!124933 (= lt!457196 e!586283)))

(declare-fun c!104951 () Bool)

(assert (=> d!124933 (= c!104951 lt!457199)))

(assert (=> d!124933 (= lt!457199 (containsKey!564 (toList!6895 lt!456972) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(assert (=> d!124933 (= (contains!6021 lt!456972 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) lt!457197)))

(declare-fun b!1036628 () Bool)

(declare-fun lt!457198 () Unit!33894)

(assert (=> b!1036628 (= e!586283 lt!457198)))

(assert (=> b!1036628 (= lt!457198 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456972) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(assert (=> b!1036628 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456972) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036629 () Bool)

(declare-fun Unit!33924 () Unit!33894)

(assert (=> b!1036629 (= e!586283 Unit!33924)))

(declare-fun b!1036630 () Bool)

(assert (=> b!1036630 (= e!586282 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456972) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(assert (= (and d!124933 c!104951) b!1036628))

(assert (= (and d!124933 (not c!104951)) b!1036629))

(assert (= (and d!124933 (not res!691862)) b!1036630))

(declare-fun m!956733 () Bool)

(assert (=> d!124933 m!956733))

(declare-fun m!956735 () Bool)

(assert (=> b!1036628 m!956735))

(assert (=> b!1036628 m!955947))

(assert (=> b!1036628 m!955947))

(declare-fun m!956737 () Bool)

(assert (=> b!1036628 m!956737))

(assert (=> b!1036630 m!955947))

(assert (=> b!1036630 m!955947))

(assert (=> b!1036630 m!956737))

(assert (=> d!124601 d!124933))

(declare-fun b!1036632 () Bool)

(declare-fun e!586284 () Option!640)

(declare-fun e!586285 () Option!640)

(assert (=> b!1036632 (= e!586284 e!586285)))

(declare-fun c!104953 () Bool)

(assert (=> b!1036632 (= c!104953 (and ((_ is Cons!21914) lt!456971) (not (= (_1!7876 (h!23116 lt!456971)) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))))

(declare-fun c!104952 () Bool)

(declare-fun d!124935 () Bool)

(assert (=> d!124935 (= c!104952 (and ((_ is Cons!21914) lt!456971) (= (_1!7876 (h!23116 lt!456971)) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(assert (=> d!124935 (= (getValueByKey!589 lt!456971 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) e!586284)))

(declare-fun b!1036633 () Bool)

(assert (=> b!1036633 (= e!586285 (getValueByKey!589 (t!31125 lt!456971) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036631 () Bool)

(assert (=> b!1036631 (= e!586284 (Some!639 (_2!7876 (h!23116 lt!456971))))))

(declare-fun b!1036634 () Bool)

(assert (=> b!1036634 (= e!586285 None!638)))

(assert (= (and d!124935 c!104952) b!1036631))

(assert (= (and d!124935 (not c!104952)) b!1036632))

(assert (= (and b!1036632 c!104953) b!1036633))

(assert (= (and b!1036632 (not c!104953)) b!1036634))

(declare-fun m!956739 () Bool)

(assert (=> b!1036633 m!956739))

(assert (=> d!124601 d!124935))

(declare-fun d!124937 () Bool)

(assert (=> d!124937 (= (getValueByKey!589 lt!456971 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun lt!457200 () Unit!33894)

(assert (=> d!124937 (= lt!457200 (choose!1705 lt!456971 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun e!586286 () Bool)

(assert (=> d!124937 e!586286))

(declare-fun res!691863 () Bool)

(assert (=> d!124937 (=> (not res!691863) (not e!586286))))

(assert (=> d!124937 (= res!691863 (isStrictlySorted!719 lt!456971))))

(assert (=> d!124937 (= (lemmaContainsTupThenGetReturnValue!280 lt!456971 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) lt!457200)))

(declare-fun b!1036635 () Bool)

(declare-fun res!691864 () Bool)

(assert (=> b!1036635 (=> (not res!691864) (not e!586286))))

(assert (=> b!1036635 (= res!691864 (containsKey!564 lt!456971 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036636 () Bool)

(assert (=> b!1036636 (= e!586286 (contains!6022 lt!456971 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(assert (= (and d!124937 res!691863) b!1036635))

(assert (= (and b!1036635 res!691864) b!1036636))

(assert (=> d!124937 m!955941))

(declare-fun m!956741 () Bool)

(assert (=> d!124937 m!956741))

(declare-fun m!956743 () Bool)

(assert (=> d!124937 m!956743))

(declare-fun m!956745 () Bool)

(assert (=> b!1036635 m!956745))

(declare-fun m!956747 () Bool)

(assert (=> b!1036636 m!956747))

(assert (=> d!124601 d!124937))

(declare-fun e!586290 () List!21918)

(declare-fun b!1036637 () Bool)

(assert (=> b!1036637 (= e!586290 (insertStrictlySorted!373 (t!31125 (toList!6895 lt!456855)) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036638 () Bool)

(declare-fun e!586289 () List!21918)

(declare-fun call!43881 () List!21918)

(assert (=> b!1036638 (= e!586289 call!43881)))

(declare-fun bm!43876 () Bool)

(declare-fun call!43879 () List!21918)

(assert (=> bm!43876 (= call!43881 call!43879)))

(declare-fun b!1036639 () Bool)

(declare-fun e!586291 () List!21918)

(assert (=> b!1036639 (= e!586291 call!43879)))

(declare-fun b!1036640 () Bool)

(declare-fun e!586287 () List!21918)

(declare-fun call!43880 () List!21918)

(assert (=> b!1036640 (= e!586287 call!43880)))

(declare-fun b!1036641 () Bool)

(declare-fun res!691866 () Bool)

(declare-fun e!586288 () Bool)

(assert (=> b!1036641 (=> (not res!691866) (not e!586288))))

(declare-fun lt!457201 () List!21918)

(assert (=> b!1036641 (= res!691866 (containsKey!564 lt!457201 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun c!104954 () Bool)

(declare-fun b!1036643 () Bool)

(assert (=> b!1036643 (= c!104954 (and ((_ is Cons!21914) (toList!6895 lt!456855)) (bvsgt (_1!7876 (h!23116 (toList!6895 lt!456855))) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(assert (=> b!1036643 (= e!586289 e!586287)))

(declare-fun b!1036644 () Bool)

(assert (=> b!1036644 (= e!586287 call!43880)))

(declare-fun b!1036645 () Bool)

(assert (=> b!1036645 (= e!586288 (contains!6022 lt!457201 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(declare-fun bm!43877 () Bool)

(declare-fun c!104955 () Bool)

(assert (=> bm!43877 (= call!43879 ($colon$colon!603 e!586290 (ite c!104955 (h!23116 (toList!6895 lt!456855)) (tuple2!15731 (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))))

(declare-fun c!104956 () Bool)

(assert (=> bm!43877 (= c!104956 c!104955)))

(declare-fun b!1036646 () Bool)

(assert (=> b!1036646 (= e!586291 e!586289)))

(declare-fun c!104957 () Bool)

(assert (=> b!1036646 (= c!104957 (and ((_ is Cons!21914) (toList!6895 lt!456855)) (= (_1!7876 (h!23116 (toList!6895 lt!456855))) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(declare-fun bm!43878 () Bool)

(assert (=> bm!43878 (= call!43880 call!43881)))

(declare-fun b!1036642 () Bool)

(assert (=> b!1036642 (= e!586290 (ite c!104957 (t!31125 (toList!6895 lt!456855)) (ite c!104954 (Cons!21914 (h!23116 (toList!6895 lt!456855)) (t!31125 (toList!6895 lt!456855))) Nil!21915)))))

(declare-fun d!124939 () Bool)

(assert (=> d!124939 e!586288))

(declare-fun res!691865 () Bool)

(assert (=> d!124939 (=> (not res!691865) (not e!586288))))

(assert (=> d!124939 (= res!691865 (isStrictlySorted!719 lt!457201))))

(assert (=> d!124939 (= lt!457201 e!586291)))

(assert (=> d!124939 (= c!104955 (and ((_ is Cons!21914) (toList!6895 lt!456855)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456855))) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(assert (=> d!124939 (isStrictlySorted!719 (toList!6895 lt!456855))))

(assert (=> d!124939 (= (insertStrictlySorted!373 (toList!6895 lt!456855) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) lt!457201)))

(assert (= (and d!124939 c!104955) b!1036639))

(assert (= (and d!124939 (not c!104955)) b!1036646))

(assert (= (and b!1036646 c!104957) b!1036638))

(assert (= (and b!1036646 (not c!104957)) b!1036643))

(assert (= (and b!1036643 c!104954) b!1036644))

(assert (= (and b!1036643 (not c!104954)) b!1036640))

(assert (= (or b!1036644 b!1036640) bm!43878))

(assert (= (or b!1036638 bm!43878) bm!43876))

(assert (= (or b!1036639 bm!43876) bm!43877))

(assert (= (and bm!43877 c!104956) b!1036637))

(assert (= (and bm!43877 (not c!104956)) b!1036642))

(assert (= (and d!124939 res!691865) b!1036641))

(assert (= (and b!1036641 res!691866) b!1036645))

(declare-fun m!956749 () Bool)

(assert (=> b!1036645 m!956749))

(declare-fun m!956751 () Bool)

(assert (=> b!1036637 m!956751))

(declare-fun m!956753 () Bool)

(assert (=> b!1036641 m!956753))

(declare-fun m!956755 () Bool)

(assert (=> bm!43877 m!956755))

(declare-fun m!956757 () Bool)

(assert (=> d!124939 m!956757))

(declare-fun m!956759 () Bool)

(assert (=> d!124939 m!956759))

(assert (=> d!124601 d!124939))

(declare-fun b!1036648 () Bool)

(declare-fun e!586292 () Option!640)

(declare-fun e!586293 () Option!640)

(assert (=> b!1036648 (= e!586292 e!586293)))

(declare-fun c!104959 () Bool)

(assert (=> b!1036648 (= c!104959 (and ((_ is Cons!21914) (toList!6895 lt!457051)) (not (= (_1!7876 (h!23116 (toList!6895 lt!457051))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(declare-fun d!124941 () Bool)

(declare-fun c!104958 () Bool)

(assert (=> d!124941 (= c!104958 (and ((_ is Cons!21914) (toList!6895 lt!457051)) (= (_1!7876 (h!23116 (toList!6895 lt!457051))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> d!124941 (= (getValueByKey!589 (toList!6895 lt!457051) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) e!586292)))

(declare-fun b!1036649 () Bool)

(assert (=> b!1036649 (= e!586293 (getValueByKey!589 (t!31125 (toList!6895 lt!457051)) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun b!1036647 () Bool)

(assert (=> b!1036647 (= e!586292 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!457051)))))))

(declare-fun b!1036650 () Bool)

(assert (=> b!1036650 (= e!586293 None!638)))

(assert (= (and d!124941 c!104958) b!1036647))

(assert (= (and d!124941 (not c!104958)) b!1036648))

(assert (= (and b!1036648 c!104959) b!1036649))

(assert (= (and b!1036648 (not c!104959)) b!1036650))

(declare-fun m!956761 () Bool)

(assert (=> b!1036649 m!956761))

(assert (=> b!1036226 d!124941))

(declare-fun d!124943 () Bool)

(declare-fun e!586294 () Bool)

(assert (=> d!124943 e!586294))

(declare-fun res!691867 () Bool)

(assert (=> d!124943 (=> res!691867 e!586294)))

(declare-fun lt!457203 () Bool)

(assert (=> d!124943 (= res!691867 (not lt!457203))))

(declare-fun lt!457205 () Bool)

(assert (=> d!124943 (= lt!457203 lt!457205)))

(declare-fun lt!457202 () Unit!33894)

(declare-fun e!586295 () Unit!33894)

(assert (=> d!124943 (= lt!457202 e!586295)))

(declare-fun c!104960 () Bool)

(assert (=> d!124943 (= c!104960 lt!457205)))

(assert (=> d!124943 (= lt!457205 (containsKey!564 (toList!6895 lt!456960) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124943 (= (contains!6021 lt!456960 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) lt!457203)))

(declare-fun b!1036651 () Bool)

(declare-fun lt!457204 () Unit!33894)

(assert (=> b!1036651 (= e!586295 lt!457204)))

(assert (=> b!1036651 (= lt!457204 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456960) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036651 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456960) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036652 () Bool)

(declare-fun Unit!33925 () Unit!33894)

(assert (=> b!1036652 (= e!586295 Unit!33925)))

(declare-fun b!1036653 () Bool)

(assert (=> b!1036653 (= e!586294 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456960) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124943 c!104960) b!1036651))

(assert (= (and d!124943 (not c!104960)) b!1036652))

(assert (= (and d!124943 (not res!691867)) b!1036653))

(assert (=> d!124943 m!955693))

(declare-fun m!956763 () Bool)

(assert (=> d!124943 m!956763))

(assert (=> b!1036651 m!955693))

(declare-fun m!956765 () Bool)

(assert (=> b!1036651 m!956765))

(assert (=> b!1036651 m!955693))

(declare-fun m!956767 () Bool)

(assert (=> b!1036651 m!956767))

(assert (=> b!1036651 m!956767))

(declare-fun m!956769 () Bool)

(assert (=> b!1036651 m!956769))

(assert (=> b!1036653 m!955693))

(assert (=> b!1036653 m!956767))

(assert (=> b!1036653 m!956767))

(assert (=> b!1036653 m!956769))

(assert (=> b!1036113 d!124943))

(assert (=> b!1036051 d!124771))

(assert (=> b!1036051 d!124773))

(declare-fun d!124945 () Bool)

(assert (=> d!124945 (= ($colon$colon!603 (removeStrictlySorted!57 (t!31125 (toList!6895 (map!14729 thiss!1427))) key!909) (h!23116 (toList!6895 (map!14729 thiss!1427)))) (Cons!21914 (h!23116 (toList!6895 (map!14729 thiss!1427))) (removeStrictlySorted!57 (t!31125 (toList!6895 (map!14729 thiss!1427))) key!909)))))

(assert (=> b!1036234 d!124945))

(declare-fun b!1036654 () Bool)

(declare-fun e!586296 () List!21918)

(assert (=> b!1036654 (= e!586296 ($colon$colon!603 (removeStrictlySorted!57 (t!31125 (t!31125 (toList!6895 (map!14729 thiss!1427)))) key!909) (h!23116 (t!31125 (toList!6895 (map!14729 thiss!1427))))))))

(declare-fun b!1036655 () Bool)

(declare-fun e!586297 () Bool)

(declare-fun lt!457206 () List!21918)

(assert (=> b!1036655 (= e!586297 (not (containsKey!564 lt!457206 key!909)))))

(declare-fun b!1036656 () Bool)

(assert (=> b!1036656 (= e!586296 Nil!21915)))

(declare-fun b!1036657 () Bool)

(declare-fun e!586298 () List!21918)

(assert (=> b!1036657 (= e!586298 e!586296)))

(declare-fun c!104962 () Bool)

(assert (=> b!1036657 (= c!104962 (and ((_ is Cons!21914) (t!31125 (toList!6895 (map!14729 thiss!1427)))) (not (= (_1!7876 (h!23116 (t!31125 (toList!6895 (map!14729 thiss!1427))))) key!909))))))

(declare-fun d!124947 () Bool)

(assert (=> d!124947 e!586297))

(declare-fun res!691868 () Bool)

(assert (=> d!124947 (=> (not res!691868) (not e!586297))))

(assert (=> d!124947 (= res!691868 (isStrictlySorted!719 lt!457206))))

(assert (=> d!124947 (= lt!457206 e!586298)))

(declare-fun c!104961 () Bool)

(assert (=> d!124947 (= c!104961 (and ((_ is Cons!21914) (t!31125 (toList!6895 (map!14729 thiss!1427)))) (= (_1!7876 (h!23116 (t!31125 (toList!6895 (map!14729 thiss!1427))))) key!909)))))

(assert (=> d!124947 (isStrictlySorted!719 (t!31125 (toList!6895 (map!14729 thiss!1427))))))

(assert (=> d!124947 (= (removeStrictlySorted!57 (t!31125 (toList!6895 (map!14729 thiss!1427))) key!909) lt!457206)))

(declare-fun b!1036658 () Bool)

(assert (=> b!1036658 (= e!586298 (t!31125 (t!31125 (toList!6895 (map!14729 thiss!1427)))))))

(assert (= (and d!124947 c!104961) b!1036658))

(assert (= (and d!124947 (not c!104961)) b!1036657))

(assert (= (and b!1036657 c!104962) b!1036654))

(assert (= (and b!1036657 (not c!104962)) b!1036656))

(assert (= (and d!124947 res!691868) b!1036655))

(declare-fun m!956771 () Bool)

(assert (=> b!1036654 m!956771))

(assert (=> b!1036654 m!956771))

(declare-fun m!956773 () Bool)

(assert (=> b!1036654 m!956773))

(declare-fun m!956775 () Bool)

(assert (=> b!1036655 m!956775))

(declare-fun m!956777 () Bool)

(assert (=> d!124947 m!956777))

(declare-fun m!956779 () Bool)

(assert (=> d!124947 m!956779))

(assert (=> b!1036234 d!124947))

(assert (=> b!1036255 d!124809))

(declare-fun d!124949 () Bool)

(declare-fun lt!457207 () Bool)

(assert (=> d!124949 (= lt!457207 (select (content!514 (toList!6895 lt!456977)) (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))

(declare-fun e!586299 () Bool)

(assert (=> d!124949 (= lt!457207 e!586299)))

(declare-fun res!691869 () Bool)

(assert (=> d!124949 (=> (not res!691869) (not e!586299))))

(assert (=> d!124949 (= res!691869 ((_ is Cons!21914) (toList!6895 lt!456977)))))

(assert (=> d!124949 (= (contains!6022 (toList!6895 lt!456977) (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))) lt!457207)))

(declare-fun b!1036659 () Bool)

(declare-fun e!586300 () Bool)

(assert (=> b!1036659 (= e!586299 e!586300)))

(declare-fun res!691870 () Bool)

(assert (=> b!1036659 (=> res!691870 e!586300)))

(assert (=> b!1036659 (= res!691870 (= (h!23116 (toList!6895 lt!456977)) (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))

(declare-fun b!1036660 () Bool)

(assert (=> b!1036660 (= e!586300 (contains!6022 (t!31125 (toList!6895 lt!456977)) (tuple2!15731 lt!456849 (minValue!6106 thiss!1427))))))

(assert (= (and d!124949 res!691869) b!1036659))

(assert (= (and b!1036659 (not res!691870)) b!1036660))

(declare-fun m!956781 () Bool)

(assert (=> d!124949 m!956781))

(declare-fun m!956783 () Bool)

(assert (=> d!124949 m!956783))

(declare-fun m!956785 () Bool)

(assert (=> b!1036660 m!956785))

(assert (=> b!1036133 d!124949))

(declare-fun d!124951 () Bool)

(assert (=> d!124951 (= (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792))) lt!456892)) (v!14931 (getValueByKey!589 (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792))) lt!456892)))))

(assert (=> d!124655 d!124951))

(declare-fun b!1036662 () Bool)

(declare-fun e!586301 () Option!640)

(declare-fun e!586302 () Option!640)

(assert (=> b!1036662 (= e!586301 e!586302)))

(declare-fun c!104964 () Bool)

(assert (=> b!1036662 (= c!104964 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)))) (not (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792))))) lt!456892))))))

(declare-fun d!124953 () Bool)

(declare-fun c!104963 () Bool)

(assert (=> d!124953 (= c!104963 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792))))) lt!456892)))))

(assert (=> d!124953 (= (getValueByKey!589 (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792))) lt!456892) e!586301)))

(declare-fun b!1036663 () Bool)

(assert (=> b!1036663 (= e!586302 (getValueByKey!589 (t!31125 (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)))) lt!456892))))

(declare-fun b!1036661 () Bool)

(assert (=> b!1036661 (= e!586301 (Some!639 (_2!7876 (h!23116 (toList!6895 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)))))))))

(declare-fun b!1036664 () Bool)

(assert (=> b!1036664 (= e!586302 None!638)))

(assert (= (and d!124953 c!104963) b!1036661))

(assert (= (and d!124953 (not c!104963)) b!1036662))

(assert (= (and b!1036662 c!104964) b!1036663))

(assert (= (and b!1036662 (not c!104964)) b!1036664))

(declare-fun m!956787 () Bool)

(assert (=> b!1036663 m!956787))

(assert (=> d!124655 d!124953))

(declare-fun d!124955 () Bool)

(declare-fun res!691871 () Bool)

(declare-fun e!586303 () Bool)

(assert (=> d!124955 (=> res!691871 e!586303)))

(assert (=> d!124955 (= res!691871 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))) lt!456895)))))

(assert (=> d!124955 (= (containsKey!564 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895) e!586303)))

(declare-fun b!1036665 () Bool)

(declare-fun e!586304 () Bool)

(assert (=> b!1036665 (= e!586303 e!586304)))

(declare-fun res!691872 () Bool)

(assert (=> b!1036665 (=> (not res!691872) (not e!586304))))

(assert (=> b!1036665 (= res!691872 (and (or (not ((_ is Cons!21914) (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))) (bvsle (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))) lt!456895)) ((_ is Cons!21914) (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))) (bvslt (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))) lt!456895)))))

(declare-fun b!1036666 () Bool)

(assert (=> b!1036666 (= e!586304 (containsKey!564 (t!31125 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))) lt!456895))))

(assert (= (and d!124955 (not res!691871)) b!1036665))

(assert (= (and b!1036665 res!691872) b!1036666))

(declare-fun m!956789 () Bool)

(assert (=> b!1036666 m!956789))

(assert (=> d!124679 d!124955))

(declare-fun d!124957 () Bool)

(declare-fun lt!457208 () Bool)

(assert (=> d!124957 (= lt!457208 (select (content!514 (toList!6895 lt!456989)) (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))

(declare-fun e!586305 () Bool)

(assert (=> d!124957 (= lt!457208 e!586305)))

(declare-fun res!691873 () Bool)

(assert (=> d!124957 (=> (not res!691873) (not e!586305))))

(assert (=> d!124957 (= res!691873 ((_ is Cons!21914) (toList!6895 lt!456989)))))

(assert (=> d!124957 (= (contains!6022 (toList!6895 lt!456989) (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))) lt!457208)))

(declare-fun b!1036667 () Bool)

(declare-fun e!586306 () Bool)

(assert (=> b!1036667 (= e!586305 e!586306)))

(declare-fun res!691874 () Bool)

(assert (=> b!1036667 (=> res!691874 e!586306)))

(assert (=> b!1036667 (= res!691874 (= (h!23116 (toList!6895 lt!456989)) (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))

(declare-fun b!1036668 () Bool)

(assert (=> b!1036668 (= e!586306 (contains!6022 (t!31125 (toList!6895 lt!456989)) (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))

(assert (= (and d!124957 res!691873) b!1036667))

(assert (= (and b!1036667 (not res!691874)) b!1036668))

(declare-fun m!956791 () Bool)

(assert (=> d!124957 m!956791))

(declare-fun m!956793 () Bool)

(assert (=> d!124957 m!956793))

(declare-fun m!956795 () Bool)

(assert (=> b!1036668 m!956795))

(assert (=> b!1036140 d!124957))

(assert (=> b!1036070 d!124809))

(assert (=> d!124613 d!124609))

(assert (=> d!124613 d!124627))

(declare-fun d!124959 () Bool)

(assert (=> d!124959 (contains!6021 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) lt!456869)))

(assert (=> d!124959 true))

(declare-fun _$35!442 () Unit!33894)

(assert (=> d!124959 (= (choose!1704 lt!456860 lt!456857 (zeroValue!6104 thiss!1427) lt!456869) _$35!442)))

(declare-fun bs!30354 () Bool)

(assert (= bs!30354 d!124959))

(assert (=> bs!30354 m!955715))

(assert (=> bs!30354 m!955715))

(assert (=> bs!30354 m!955717))

(assert (=> d!124613 d!124959))

(declare-fun d!124961 () Bool)

(declare-fun e!586307 () Bool)

(assert (=> d!124961 e!586307))

(declare-fun res!691875 () Bool)

(assert (=> d!124961 (=> res!691875 e!586307)))

(declare-fun lt!457210 () Bool)

(assert (=> d!124961 (= res!691875 (not lt!457210))))

(declare-fun lt!457212 () Bool)

(assert (=> d!124961 (= lt!457210 lt!457212)))

(declare-fun lt!457209 () Unit!33894)

(declare-fun e!586308 () Unit!33894)

(assert (=> d!124961 (= lt!457209 e!586308)))

(declare-fun c!104965 () Bool)

(assert (=> d!124961 (= c!104965 lt!457212)))

(assert (=> d!124961 (= lt!457212 (containsKey!564 (toList!6895 lt!456860) lt!456869))))

(assert (=> d!124961 (= (contains!6021 lt!456860 lt!456869) lt!457210)))

(declare-fun b!1036670 () Bool)

(declare-fun lt!457211 () Unit!33894)

(assert (=> b!1036670 (= e!586308 lt!457211)))

(assert (=> b!1036670 (= lt!457211 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456860) lt!456869))))

(assert (=> b!1036670 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456860) lt!456869))))

(declare-fun b!1036671 () Bool)

(declare-fun Unit!33926 () Unit!33894)

(assert (=> b!1036671 (= e!586308 Unit!33926)))

(declare-fun b!1036672 () Bool)

(assert (=> b!1036672 (= e!586307 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456860) lt!456869)))))

(assert (= (and d!124961 c!104965) b!1036670))

(assert (= (and d!124961 (not c!104965)) b!1036671))

(assert (= (and d!124961 (not res!691875)) b!1036672))

(declare-fun m!956797 () Bool)

(assert (=> d!124961 m!956797))

(declare-fun m!956799 () Bool)

(assert (=> b!1036670 m!956799))

(declare-fun m!956801 () Bool)

(assert (=> b!1036670 m!956801))

(assert (=> b!1036670 m!956801))

(declare-fun m!956803 () Bool)

(assert (=> b!1036670 m!956803))

(assert (=> b!1036672 m!956801))

(assert (=> b!1036672 m!956801))

(assert (=> b!1036672 m!956803))

(assert (=> d!124613 d!124961))

(declare-fun d!124963 () Bool)

(assert (=> d!124963 (not (contains!6021 (+!3105 lt!456945 (tuple2!15731 lt!456949 lt!456947)) lt!456946))))

(declare-fun lt!457215 () Unit!33894)

(declare-fun choose!1707 (ListLongMap!13759 (_ BitVec 64) V!37669 (_ BitVec 64)) Unit!33894)

(assert (=> d!124963 (= lt!457215 (choose!1707 lt!456945 lt!456949 lt!456947 lt!456946))))

(declare-fun e!586311 () Bool)

(assert (=> d!124963 e!586311))

(declare-fun res!691878 () Bool)

(assert (=> d!124963 (=> (not res!691878) (not e!586311))))

(assert (=> d!124963 (= res!691878 (not (contains!6021 lt!456945 lt!456946)))))

(assert (=> d!124963 (= (addStillNotContains!243 lt!456945 lt!456949 lt!456947 lt!456946) lt!457215)))

(declare-fun b!1036676 () Bool)

(assert (=> b!1036676 (= e!586311 (not (= lt!456949 lt!456946)))))

(assert (= (and d!124963 res!691878) b!1036676))

(assert (=> d!124963 m!955903))

(assert (=> d!124963 m!955903))

(assert (=> d!124963 m!955909))

(declare-fun m!956805 () Bool)

(assert (=> d!124963 m!956805))

(declare-fun m!956807 () Bool)

(assert (=> d!124963 m!956807))

(assert (=> b!1036106 d!124963))

(declare-fun d!124965 () Bool)

(declare-fun e!586312 () Bool)

(assert (=> d!124965 e!586312))

(declare-fun res!691879 () Bool)

(assert (=> d!124965 (=> res!691879 e!586312)))

(declare-fun lt!457217 () Bool)

(assert (=> d!124965 (= res!691879 (not lt!457217))))

(declare-fun lt!457219 () Bool)

(assert (=> d!124965 (= lt!457217 lt!457219)))

(declare-fun lt!457216 () Unit!33894)

(declare-fun e!586313 () Unit!33894)

(assert (=> d!124965 (= lt!457216 e!586313)))

(declare-fun c!104966 () Bool)

(assert (=> d!124965 (= c!104966 lt!457219)))

(assert (=> d!124965 (= lt!457219 (containsKey!564 (toList!6895 (+!3105 lt!456945 (tuple2!15731 lt!456949 lt!456947))) lt!456946))))

(assert (=> d!124965 (= (contains!6021 (+!3105 lt!456945 (tuple2!15731 lt!456949 lt!456947)) lt!456946) lt!457217)))

(declare-fun b!1036677 () Bool)

(declare-fun lt!457218 () Unit!33894)

(assert (=> b!1036677 (= e!586313 lt!457218)))

(assert (=> b!1036677 (= lt!457218 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 (+!3105 lt!456945 (tuple2!15731 lt!456949 lt!456947))) lt!456946))))

(assert (=> b!1036677 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456945 (tuple2!15731 lt!456949 lt!456947))) lt!456946))))

(declare-fun b!1036678 () Bool)

(declare-fun Unit!33927 () Unit!33894)

(assert (=> b!1036678 (= e!586313 Unit!33927)))

(declare-fun b!1036679 () Bool)

(assert (=> b!1036679 (= e!586312 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456945 (tuple2!15731 lt!456949 lt!456947))) lt!456946)))))

(assert (= (and d!124965 c!104966) b!1036677))

(assert (= (and d!124965 (not c!104966)) b!1036678))

(assert (= (and d!124965 (not res!691879)) b!1036679))

(declare-fun m!956809 () Bool)

(assert (=> d!124965 m!956809))

(declare-fun m!956811 () Bool)

(assert (=> b!1036677 m!956811))

(declare-fun m!956813 () Bool)

(assert (=> b!1036677 m!956813))

(assert (=> b!1036677 m!956813))

(declare-fun m!956815 () Bool)

(assert (=> b!1036677 m!956815))

(assert (=> b!1036679 m!956813))

(assert (=> b!1036679 m!956813))

(assert (=> b!1036679 m!956815))

(assert (=> b!1036106 d!124965))

(assert (=> b!1036106 d!124585))

(declare-fun d!124967 () Bool)

(declare-fun e!586314 () Bool)

(assert (=> d!124967 e!586314))

(declare-fun res!691880 () Bool)

(assert (=> d!124967 (=> (not res!691880) (not e!586314))))

(declare-fun lt!457222 () ListLongMap!13759)

(assert (=> d!124967 (= res!691880 (contains!6021 lt!457222 (_1!7876 (tuple2!15731 lt!456949 lt!456947))))))

(declare-fun lt!457221 () List!21918)

(assert (=> d!124967 (= lt!457222 (ListLongMap!13760 lt!457221))))

(declare-fun lt!457220 () Unit!33894)

(declare-fun lt!457223 () Unit!33894)

(assert (=> d!124967 (= lt!457220 lt!457223)))

(assert (=> d!124967 (= (getValueByKey!589 lt!457221 (_1!7876 (tuple2!15731 lt!456949 lt!456947))) (Some!639 (_2!7876 (tuple2!15731 lt!456949 lt!456947))))))

(assert (=> d!124967 (= lt!457223 (lemmaContainsTupThenGetReturnValue!280 lt!457221 (_1!7876 (tuple2!15731 lt!456949 lt!456947)) (_2!7876 (tuple2!15731 lt!456949 lt!456947))))))

(assert (=> d!124967 (= lt!457221 (insertStrictlySorted!373 (toList!6895 lt!456945) (_1!7876 (tuple2!15731 lt!456949 lt!456947)) (_2!7876 (tuple2!15731 lt!456949 lt!456947))))))

(assert (=> d!124967 (= (+!3105 lt!456945 (tuple2!15731 lt!456949 lt!456947)) lt!457222)))

(declare-fun b!1036680 () Bool)

(declare-fun res!691881 () Bool)

(assert (=> b!1036680 (=> (not res!691881) (not e!586314))))

(assert (=> b!1036680 (= res!691881 (= (getValueByKey!589 (toList!6895 lt!457222) (_1!7876 (tuple2!15731 lt!456949 lt!456947))) (Some!639 (_2!7876 (tuple2!15731 lt!456949 lt!456947)))))))

(declare-fun b!1036681 () Bool)

(assert (=> b!1036681 (= e!586314 (contains!6022 (toList!6895 lt!457222) (tuple2!15731 lt!456949 lt!456947)))))

(assert (= (and d!124967 res!691880) b!1036680))

(assert (= (and b!1036680 res!691881) b!1036681))

(declare-fun m!956817 () Bool)

(assert (=> d!124967 m!956817))

(declare-fun m!956819 () Bool)

(assert (=> d!124967 m!956819))

(declare-fun m!956821 () Bool)

(assert (=> d!124967 m!956821))

(declare-fun m!956823 () Bool)

(assert (=> d!124967 m!956823))

(declare-fun m!956825 () Bool)

(assert (=> b!1036680 m!956825))

(declare-fun m!956827 () Bool)

(assert (=> b!1036681 m!956827))

(assert (=> b!1036106 d!124967))

(declare-fun d!124969 () Bool)

(declare-fun e!586315 () Bool)

(assert (=> d!124969 e!586315))

(declare-fun res!691882 () Bool)

(assert (=> d!124969 (=> (not res!691882) (not e!586315))))

(declare-fun lt!457226 () ListLongMap!13759)

(assert (=> d!124969 (= res!691882 (contains!6021 lt!457226 (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!457225 () List!21918)

(assert (=> d!124969 (= lt!457226 (ListLongMap!13760 lt!457225))))

(declare-fun lt!457224 () Unit!33894)

(declare-fun lt!457227 () Unit!33894)

(assert (=> d!124969 (= lt!457224 lt!457227)))

(assert (=> d!124969 (= (getValueByKey!589 lt!457225 (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!639 (_2!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124969 (= lt!457227 (lemmaContainsTupThenGetReturnValue!280 lt!457225 (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124969 (= lt!457225 (insertStrictlySorted!373 (toList!6895 call!43838) (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124969 (= (+!3105 call!43838 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!457226)))

(declare-fun b!1036682 () Bool)

(declare-fun res!691883 () Bool)

(assert (=> b!1036682 (=> (not res!691883) (not e!586315))))

(assert (=> b!1036682 (= res!691883 (= (getValueByKey!589 (toList!6895 lt!457226) (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!639 (_2!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1036683 () Bool)

(assert (=> b!1036683 (= e!586315 (contains!6022 (toList!6895 lt!457226) (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124969 res!691882) b!1036682))

(assert (= (and b!1036682 res!691883) b!1036683))

(declare-fun m!956829 () Bool)

(assert (=> d!124969 m!956829))

(declare-fun m!956831 () Bool)

(assert (=> d!124969 m!956831))

(declare-fun m!956833 () Bool)

(assert (=> d!124969 m!956833))

(declare-fun m!956835 () Bool)

(assert (=> d!124969 m!956835))

(declare-fun m!956837 () Bool)

(assert (=> b!1036682 m!956837))

(declare-fun m!956839 () Bool)

(assert (=> b!1036683 m!956839))

(assert (=> b!1036106 d!124969))

(declare-fun d!124971 () Bool)

(declare-fun e!586316 () Bool)

(assert (=> d!124971 e!586316))

(declare-fun res!691884 () Bool)

(assert (=> d!124971 (=> res!691884 e!586316)))

(declare-fun lt!457229 () Bool)

(assert (=> d!124971 (= res!691884 (not lt!457229))))

(declare-fun lt!457231 () Bool)

(assert (=> d!124971 (= lt!457229 lt!457231)))

(declare-fun lt!457228 () Unit!33894)

(declare-fun e!586317 () Unit!33894)

(assert (=> d!124971 (= lt!457228 e!586317)))

(declare-fun c!104967 () Bool)

(assert (=> d!124971 (= c!104967 lt!457231)))

(assert (=> d!124971 (= lt!457231 (containsKey!564 (toList!6895 lt!457047) (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))

(assert (=> d!124971 (= (contains!6021 lt!457047 (_1!7876 (tuple2!15731 lt!456878 lt!456792))) lt!457229)))

(declare-fun b!1036684 () Bool)

(declare-fun lt!457230 () Unit!33894)

(assert (=> b!1036684 (= e!586317 lt!457230)))

(assert (=> b!1036684 (= lt!457230 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!457047) (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))

(assert (=> b!1036684 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457047) (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun b!1036685 () Bool)

(declare-fun Unit!33928 () Unit!33894)

(assert (=> b!1036685 (= e!586317 Unit!33928)))

(declare-fun b!1036686 () Bool)

(assert (=> b!1036686 (= e!586316 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457047) (_1!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(assert (= (and d!124971 c!104967) b!1036684))

(assert (= (and d!124971 (not c!104967)) b!1036685))

(assert (= (and d!124971 (not res!691884)) b!1036686))

(declare-fun m!956841 () Bool)

(assert (=> d!124971 m!956841))

(declare-fun m!956843 () Bool)

(assert (=> b!1036684 m!956843))

(assert (=> b!1036684 m!956205))

(assert (=> b!1036684 m!956205))

(declare-fun m!956845 () Bool)

(assert (=> b!1036684 m!956845))

(assert (=> b!1036686 m!956205))

(assert (=> b!1036686 m!956205))

(assert (=> b!1036686 m!956845))

(assert (=> d!124681 d!124971))

(declare-fun b!1036688 () Bool)

(declare-fun e!586318 () Option!640)

(declare-fun e!586319 () Option!640)

(assert (=> b!1036688 (= e!586318 e!586319)))

(declare-fun c!104969 () Bool)

(assert (=> b!1036688 (= c!104969 (and ((_ is Cons!21914) lt!457046) (not (= (_1!7876 (h!23116 lt!457046)) (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))))

(declare-fun d!124973 () Bool)

(declare-fun c!104968 () Bool)

(assert (=> d!124973 (= c!104968 (and ((_ is Cons!21914) lt!457046) (= (_1!7876 (h!23116 lt!457046)) (_1!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(assert (=> d!124973 (= (getValueByKey!589 lt!457046 (_1!7876 (tuple2!15731 lt!456878 lt!456792))) e!586318)))

(declare-fun b!1036689 () Bool)

(assert (=> b!1036689 (= e!586319 (getValueByKey!589 (t!31125 lt!457046) (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun b!1036687 () Bool)

(assert (=> b!1036687 (= e!586318 (Some!639 (_2!7876 (h!23116 lt!457046))))))

(declare-fun b!1036690 () Bool)

(assert (=> b!1036690 (= e!586319 None!638)))

(assert (= (and d!124973 c!104968) b!1036687))

(assert (= (and d!124973 (not c!104968)) b!1036688))

(assert (= (and b!1036688 c!104969) b!1036689))

(assert (= (and b!1036688 (not c!104969)) b!1036690))

(declare-fun m!956847 () Bool)

(assert (=> b!1036689 m!956847))

(assert (=> d!124681 d!124973))

(declare-fun d!124975 () Bool)

(assert (=> d!124975 (= (getValueByKey!589 lt!457046 (_1!7876 (tuple2!15731 lt!456878 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun lt!457232 () Unit!33894)

(assert (=> d!124975 (= lt!457232 (choose!1705 lt!457046 (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun e!586320 () Bool)

(assert (=> d!124975 e!586320))

(declare-fun res!691885 () Bool)

(assert (=> d!124975 (=> (not res!691885) (not e!586320))))

(assert (=> d!124975 (= res!691885 (isStrictlySorted!719 lt!457046))))

(assert (=> d!124975 (= (lemmaContainsTupThenGetReturnValue!280 lt!457046 (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792))) lt!457232)))

(declare-fun b!1036691 () Bool)

(declare-fun res!691886 () Bool)

(assert (=> b!1036691 (=> (not res!691886) (not e!586320))))

(assert (=> b!1036691 (= res!691886 (containsKey!564 lt!457046 (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun b!1036692 () Bool)

(assert (=> b!1036692 (= e!586320 (contains!6022 lt!457046 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(assert (= (and d!124975 res!691885) b!1036691))

(assert (= (and b!1036691 res!691886) b!1036692))

(assert (=> d!124975 m!956199))

(declare-fun m!956849 () Bool)

(assert (=> d!124975 m!956849))

(declare-fun m!956851 () Bool)

(assert (=> d!124975 m!956851))

(declare-fun m!956853 () Bool)

(assert (=> b!1036691 m!956853))

(declare-fun m!956855 () Bool)

(assert (=> b!1036692 m!956855))

(assert (=> d!124681 d!124975))

(declare-fun b!1036693 () Bool)

(declare-fun e!586324 () List!21918)

(assert (=> b!1036693 (= e!586324 (insertStrictlySorted!373 (t!31125 (toList!6895 lt!456881)) (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun b!1036694 () Bool)

(declare-fun e!586323 () List!21918)

(declare-fun call!43884 () List!21918)

(assert (=> b!1036694 (= e!586323 call!43884)))

(declare-fun bm!43879 () Bool)

(declare-fun call!43882 () List!21918)

(assert (=> bm!43879 (= call!43884 call!43882)))

(declare-fun b!1036695 () Bool)

(declare-fun e!586325 () List!21918)

(assert (=> b!1036695 (= e!586325 call!43882)))

(declare-fun b!1036696 () Bool)

(declare-fun e!586321 () List!21918)

(declare-fun call!43883 () List!21918)

(assert (=> b!1036696 (= e!586321 call!43883)))

(declare-fun b!1036697 () Bool)

(declare-fun res!691888 () Bool)

(declare-fun e!586322 () Bool)

(assert (=> b!1036697 (=> (not res!691888) (not e!586322))))

(declare-fun lt!457233 () List!21918)

(assert (=> b!1036697 (= res!691888 (containsKey!564 lt!457233 (_1!7876 (tuple2!15731 lt!456878 lt!456792))))))

(declare-fun b!1036699 () Bool)

(declare-fun c!104970 () Bool)

(assert (=> b!1036699 (= c!104970 (and ((_ is Cons!21914) (toList!6895 lt!456881)) (bvsgt (_1!7876 (h!23116 (toList!6895 lt!456881))) (_1!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(assert (=> b!1036699 (= e!586323 e!586321)))

(declare-fun b!1036700 () Bool)

(assert (=> b!1036700 (= e!586321 call!43883)))

(declare-fun b!1036701 () Bool)

(assert (=> b!1036701 (= e!586322 (contains!6022 lt!457233 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(declare-fun c!104971 () Bool)

(declare-fun bm!43880 () Bool)

(assert (=> bm!43880 (= call!43882 ($colon$colon!603 e!586324 (ite c!104971 (h!23116 (toList!6895 lt!456881)) (tuple2!15731 (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792))))))))

(declare-fun c!104972 () Bool)

(assert (=> bm!43880 (= c!104972 c!104971)))

(declare-fun b!1036702 () Bool)

(assert (=> b!1036702 (= e!586325 e!586323)))

(declare-fun c!104973 () Bool)

(assert (=> b!1036702 (= c!104973 (and ((_ is Cons!21914) (toList!6895 lt!456881)) (= (_1!7876 (h!23116 (toList!6895 lt!456881))) (_1!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(declare-fun bm!43881 () Bool)

(assert (=> bm!43881 (= call!43883 call!43884)))

(declare-fun b!1036698 () Bool)

(assert (=> b!1036698 (= e!586324 (ite c!104973 (t!31125 (toList!6895 lt!456881)) (ite c!104970 (Cons!21914 (h!23116 (toList!6895 lt!456881)) (t!31125 (toList!6895 lt!456881))) Nil!21915)))))

(declare-fun d!124977 () Bool)

(assert (=> d!124977 e!586322))

(declare-fun res!691887 () Bool)

(assert (=> d!124977 (=> (not res!691887) (not e!586322))))

(assert (=> d!124977 (= res!691887 (isStrictlySorted!719 lt!457233))))

(assert (=> d!124977 (= lt!457233 e!586325)))

(assert (=> d!124977 (= c!104971 (and ((_ is Cons!21914) (toList!6895 lt!456881)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456881))) (_1!7876 (tuple2!15731 lt!456878 lt!456792)))))))

(assert (=> d!124977 (isStrictlySorted!719 (toList!6895 lt!456881))))

(assert (=> d!124977 (= (insertStrictlySorted!373 (toList!6895 lt!456881) (_1!7876 (tuple2!15731 lt!456878 lt!456792)) (_2!7876 (tuple2!15731 lt!456878 lt!456792))) lt!457233)))

(assert (= (and d!124977 c!104971) b!1036695))

(assert (= (and d!124977 (not c!104971)) b!1036702))

(assert (= (and b!1036702 c!104973) b!1036694))

(assert (= (and b!1036702 (not c!104973)) b!1036699))

(assert (= (and b!1036699 c!104970) b!1036700))

(assert (= (and b!1036699 (not c!104970)) b!1036696))

(assert (= (or b!1036700 b!1036696) bm!43881))

(assert (= (or b!1036694 bm!43881) bm!43879))

(assert (= (or b!1036695 bm!43879) bm!43880))

(assert (= (and bm!43880 c!104972) b!1036693))

(assert (= (and bm!43880 (not c!104972)) b!1036698))

(assert (= (and d!124977 res!691887) b!1036697))

(assert (= (and b!1036697 res!691888) b!1036701))

(declare-fun m!956857 () Bool)

(assert (=> b!1036701 m!956857))

(declare-fun m!956859 () Bool)

(assert (=> b!1036693 m!956859))

(declare-fun m!956861 () Bool)

(assert (=> b!1036697 m!956861))

(declare-fun m!956863 () Bool)

(assert (=> bm!43880 m!956863))

(declare-fun m!956865 () Bool)

(assert (=> d!124977 m!956865))

(declare-fun m!956867 () Bool)

(assert (=> d!124977 m!956867))

(assert (=> d!124681 d!124977))

(declare-fun b!1036703 () Bool)

(declare-fun e!586326 () Bool)

(declare-fun e!586328 () Bool)

(assert (=> b!1036703 (= e!586326 e!586328)))

(assert (=> b!1036703 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun res!691890 () Bool)

(declare-fun lt!457239 () ListLongMap!13759)

(assert (=> b!1036703 (= res!691890 (contains!6021 lt!457239 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036703 (=> (not res!691890) (not e!586328))))

(declare-fun b!1036704 () Bool)

(assert (=> b!1036704 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> b!1036704 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31960 (_values!6293 thiss!1427))))))

(assert (=> b!1036704 (= e!586328 (= (apply!907 lt!457239 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036705 () Bool)

(declare-fun e!586329 () ListLongMap!13759)

(declare-fun call!43885 () ListLongMap!13759)

(assert (=> b!1036705 (= e!586329 call!43885)))

(declare-fun b!1036706 () Bool)

(declare-fun e!586332 () ListLongMap!13759)

(assert (=> b!1036706 (= e!586332 (ListLongMap!13760 Nil!21915))))

(declare-fun d!124979 () Bool)

(declare-fun e!586327 () Bool)

(assert (=> d!124979 e!586327))

(declare-fun res!691891 () Bool)

(assert (=> d!124979 (=> (not res!691891) (not e!586327))))

(assert (=> d!124979 (= res!691891 (not (contains!6021 lt!457239 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124979 (= lt!457239 e!586332)))

(declare-fun c!104974 () Bool)

(assert (=> d!124979 (= c!104974 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!124979 (validMask!0 (mask!30171 thiss!1427))))

(assert (=> d!124979 (= (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427)) lt!457239)))

(declare-fun bm!43882 () Bool)

(assert (=> bm!43882 (= call!43885 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427)))))

(declare-fun b!1036707 () Bool)

(declare-fun e!586331 () Bool)

(assert (=> b!1036707 (= e!586331 (= lt!457239 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6270 thiss!1427))))))

(declare-fun b!1036708 () Bool)

(declare-fun e!586330 () Bool)

(assert (=> b!1036708 (= e!586330 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036708 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1036709 () Bool)

(assert (=> b!1036709 (= e!586326 e!586331)))

(declare-fun c!104975 () Bool)

(assert (=> b!1036709 (= c!104975 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036710 () Bool)

(assert (=> b!1036710 (= e!586327 e!586326)))

(declare-fun c!104977 () Bool)

(assert (=> b!1036710 (= c!104977 e!586330)))

(declare-fun res!691892 () Bool)

(assert (=> b!1036710 (=> (not res!691892) (not e!586330))))

(assert (=> b!1036710 (= res!691892 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036711 () Bool)

(assert (=> b!1036711 (= e!586331 (isEmpty!929 lt!457239))))

(declare-fun b!1036712 () Bool)

(declare-fun lt!457240 () Unit!33894)

(declare-fun lt!457237 () Unit!33894)

(assert (=> b!1036712 (= lt!457240 lt!457237)))

(declare-fun lt!457238 () (_ BitVec 64))

(declare-fun lt!457235 () (_ BitVec 64))

(declare-fun lt!457234 () ListLongMap!13759)

(declare-fun lt!457236 () V!37669)

(assert (=> b!1036712 (not (contains!6021 (+!3105 lt!457234 (tuple2!15731 lt!457238 lt!457236)) lt!457235))))

(assert (=> b!1036712 (= lt!457237 (addStillNotContains!243 lt!457234 lt!457238 lt!457236 lt!457235))))

(assert (=> b!1036712 (= lt!457235 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036712 (= lt!457236 (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036712 (= lt!457238 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1036712 (= lt!457234 call!43885)))

(assert (=> b!1036712 (= e!586329 (+!3105 call!43885 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036713 () Bool)

(declare-fun res!691889 () Bool)

(assert (=> b!1036713 (=> (not res!691889) (not e!586327))))

(assert (=> b!1036713 (= res!691889 (not (contains!6021 lt!457239 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036714 () Bool)

(assert (=> b!1036714 (= e!586332 e!586329)))

(declare-fun c!104976 () Bool)

(assert (=> b!1036714 (= c!104976 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124979 c!104974) b!1036706))

(assert (= (and d!124979 (not c!104974)) b!1036714))

(assert (= (and b!1036714 c!104976) b!1036712))

(assert (= (and b!1036714 (not c!104976)) b!1036705))

(assert (= (or b!1036712 b!1036705) bm!43882))

(assert (= (and d!124979 res!691891) b!1036713))

(assert (= (and b!1036713 res!691889) b!1036710))

(assert (= (and b!1036710 res!691892) b!1036708))

(assert (= (and b!1036710 c!104977) b!1036703))

(assert (= (and b!1036710 (not c!104977)) b!1036709))

(assert (= (and b!1036703 res!691890) b!1036704))

(assert (= (and b!1036709 c!104975) b!1036707))

(assert (= (and b!1036709 (not c!104975)) b!1036711))

(declare-fun b_lambda!16139 () Bool)

(assert (=> (not b_lambda!16139) (not b!1036704)))

(assert (=> b!1036704 t!31130))

(declare-fun b_and!33405 () Bool)

(assert (= b_and!33403 (and (=> t!31130 result!14427) b_and!33405)))

(declare-fun b_lambda!16141 () Bool)

(assert (=> (not b_lambda!16141) (not b!1036712)))

(assert (=> b!1036712 t!31130))

(declare-fun b_and!33407 () Bool)

(assert (= b_and!33405 (and (=> t!31130 result!14427) b_and!33407)))

(declare-fun m!956869 () Bool)

(assert (=> b!1036711 m!956869))

(assert (=> b!1036708 m!956301))

(assert (=> b!1036708 m!956301))

(assert (=> b!1036708 m!956303))

(assert (=> b!1036703 m!956301))

(assert (=> b!1036703 m!956301))

(declare-fun m!956871 () Bool)

(assert (=> b!1036703 m!956871))

(declare-fun m!956873 () Bool)

(assert (=> b!1036713 m!956873))

(declare-fun m!956875 () Bool)

(assert (=> bm!43882 m!956875))

(assert (=> b!1036714 m!956301))

(assert (=> b!1036714 m!956301))

(assert (=> b!1036714 m!956303))

(declare-fun m!956877 () Bool)

(assert (=> b!1036712 m!956877))

(assert (=> b!1036712 m!956313))

(assert (=> b!1036712 m!955697))

(assert (=> b!1036712 m!956315))

(assert (=> b!1036712 m!956313))

(assert (=> b!1036712 m!955697))

(assert (=> b!1036712 m!956301))

(declare-fun m!956879 () Bool)

(assert (=> b!1036712 m!956879))

(declare-fun m!956881 () Bool)

(assert (=> b!1036712 m!956881))

(assert (=> b!1036712 m!956877))

(declare-fun m!956883 () Bool)

(assert (=> b!1036712 m!956883))

(declare-fun m!956885 () Bool)

(assert (=> d!124979 m!956885))

(assert (=> d!124979 m!955745))

(assert (=> b!1036707 m!956875))

(assert (=> b!1036704 m!956301))

(declare-fun m!956887 () Bool)

(assert (=> b!1036704 m!956887))

(assert (=> b!1036704 m!956313))

(assert (=> b!1036704 m!955697))

(assert (=> b!1036704 m!956315))

(assert (=> b!1036704 m!956313))

(assert (=> b!1036704 m!955697))

(assert (=> b!1036704 m!956301))

(assert (=> bm!43836 d!124979))

(assert (=> d!124665 d!124669))

(assert (=> d!124665 d!124661))

(assert (=> d!124665 d!124663))

(declare-fun d!124981 () Bool)

(declare-fun e!586333 () Bool)

(assert (=> d!124981 e!586333))

(declare-fun res!691893 () Bool)

(assert (=> d!124981 (=> res!691893 e!586333)))

(declare-fun lt!457242 () Bool)

(assert (=> d!124981 (= res!691893 (not lt!457242))))

(declare-fun lt!457244 () Bool)

(assert (=> d!124981 (= lt!457242 lt!457244)))

(declare-fun lt!457241 () Unit!33894)

(declare-fun e!586334 () Unit!33894)

(assert (=> d!124981 (= lt!457241 e!586334)))

(declare-fun c!104978 () Bool)

(assert (=> d!124981 (= c!104978 lt!457244)))

(assert (=> d!124981 (= lt!457244 (containsKey!564 (toList!6895 lt!456877) lt!456891))))

(assert (=> d!124981 (= (contains!6021 lt!456877 lt!456891) lt!457242)))

(declare-fun b!1036715 () Bool)

(declare-fun lt!457243 () Unit!33894)

(assert (=> b!1036715 (= e!586334 lt!457243)))

(assert (=> b!1036715 (= lt!457243 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456877) lt!456891))))

(assert (=> b!1036715 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456877) lt!456891))))

(declare-fun b!1036716 () Bool)

(declare-fun Unit!33929 () Unit!33894)

(assert (=> b!1036716 (= e!586334 Unit!33929)))

(declare-fun b!1036717 () Bool)

(assert (=> b!1036717 (= e!586333 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456877) lt!456891)))))

(assert (= (and d!124981 c!104978) b!1036715))

(assert (= (and d!124981 (not c!104978)) b!1036716))

(assert (= (and d!124981 (not res!691893)) b!1036717))

(declare-fun m!956889 () Bool)

(assert (=> d!124981 m!956889))

(declare-fun m!956891 () Bool)

(assert (=> b!1036715 m!956891))

(assert (=> b!1036715 m!956141))

(assert (=> b!1036715 m!956141))

(declare-fun m!956893 () Bool)

(assert (=> b!1036715 m!956893))

(assert (=> b!1036717 m!956141))

(assert (=> b!1036717 m!956141))

(assert (=> b!1036717 m!956893))

(assert (=> d!124665 d!124981))

(declare-fun d!124983 () Bool)

(assert (=> d!124983 (= (apply!907 (+!3105 lt!456877 (tuple2!15731 lt!456888 (zeroValue!6104 thiss!1427))) lt!456891) (apply!907 lt!456877 lt!456891))))

(assert (=> d!124983 true))

(declare-fun _$34!1175 () Unit!33894)

(assert (=> d!124983 (= (choose!1703 lt!456877 lt!456888 (zeroValue!6104 thiss!1427) lt!456891) _$34!1175)))

(declare-fun bs!30355 () Bool)

(assert (= bs!30355 d!124983))

(assert (=> bs!30355 m!955775))

(assert (=> bs!30355 m!955775))

(assert (=> bs!30355 m!955777))

(assert (=> bs!30355 m!955789))

(assert (=> d!124665 d!124983))

(declare-fun d!124985 () Bool)

(assert (=> d!124985 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456854) lt!456868)) (v!14931 (getValueByKey!589 (toList!6895 lt!456854) lt!456868)))))

(assert (=> d!124605 d!124985))

(declare-fun b!1036719 () Bool)

(declare-fun e!586335 () Option!640)

(declare-fun e!586336 () Option!640)

(assert (=> b!1036719 (= e!586335 e!586336)))

(declare-fun c!104980 () Bool)

(assert (=> b!1036719 (= c!104980 (and ((_ is Cons!21914) (toList!6895 lt!456854)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456854))) lt!456868))))))

(declare-fun d!124987 () Bool)

(declare-fun c!104979 () Bool)

(assert (=> d!124987 (= c!104979 (and ((_ is Cons!21914) (toList!6895 lt!456854)) (= (_1!7876 (h!23116 (toList!6895 lt!456854))) lt!456868)))))

(assert (=> d!124987 (= (getValueByKey!589 (toList!6895 lt!456854) lt!456868) e!586335)))

(declare-fun b!1036720 () Bool)

(assert (=> b!1036720 (= e!586336 (getValueByKey!589 (t!31125 (toList!6895 lt!456854)) lt!456868))))

(declare-fun b!1036718 () Bool)

(assert (=> b!1036718 (= e!586335 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456854)))))))

(declare-fun b!1036721 () Bool)

(assert (=> b!1036721 (= e!586336 None!638)))

(assert (= (and d!124987 c!104979) b!1036718))

(assert (= (and d!124987 (not c!104979)) b!1036719))

(assert (= (and b!1036719 c!104980) b!1036720))

(assert (= (and b!1036719 (not c!104980)) b!1036721))

(declare-fun m!956895 () Bool)

(assert (=> b!1036720 m!956895))

(assert (=> d!124605 d!124987))

(declare-fun d!124989 () Bool)

(declare-fun res!691894 () Bool)

(declare-fun e!586337 () Bool)

(assert (=> d!124989 (=> res!691894 e!586337)))

(assert (=> d!124989 (= res!691894 (or ((_ is Nil!21915) lt!457061) ((_ is Nil!21915) (t!31125 lt!457061))))))

(assert (=> d!124989 (= (isStrictlySorted!719 lt!457061) e!586337)))

(declare-fun b!1036722 () Bool)

(declare-fun e!586338 () Bool)

(assert (=> b!1036722 (= e!586337 e!586338)))

(declare-fun res!691895 () Bool)

(assert (=> b!1036722 (=> (not res!691895) (not e!586338))))

(assert (=> b!1036722 (= res!691895 (bvslt (_1!7876 (h!23116 lt!457061)) (_1!7876 (h!23116 (t!31125 lt!457061)))))))

(declare-fun b!1036723 () Bool)

(assert (=> b!1036723 (= e!586338 (isStrictlySorted!719 (t!31125 lt!457061)))))

(assert (= (and d!124989 (not res!691894)) b!1036722))

(assert (= (and b!1036722 res!691895) b!1036723))

(declare-fun m!956897 () Bool)

(assert (=> b!1036723 m!956897))

(assert (=> d!124691 d!124989))

(declare-fun d!124991 () Bool)

(declare-fun res!691896 () Bool)

(declare-fun e!586339 () Bool)

(assert (=> d!124991 (=> res!691896 e!586339)))

(assert (=> d!124991 (= res!691896 (or ((_ is Nil!21915) (toList!6895 (map!14729 thiss!1427))) ((_ is Nil!21915) (t!31125 (toList!6895 (map!14729 thiss!1427))))))))

(assert (=> d!124991 (= (isStrictlySorted!719 (toList!6895 (map!14729 thiss!1427))) e!586339)))

(declare-fun b!1036724 () Bool)

(declare-fun e!586340 () Bool)

(assert (=> b!1036724 (= e!586339 e!586340)))

(declare-fun res!691897 () Bool)

(assert (=> b!1036724 (=> (not res!691897) (not e!586340))))

(assert (=> b!1036724 (= res!691897 (bvslt (_1!7876 (h!23116 (toList!6895 (map!14729 thiss!1427)))) (_1!7876 (h!23116 (t!31125 (toList!6895 (map!14729 thiss!1427)))))))))

(declare-fun b!1036725 () Bool)

(assert (=> b!1036725 (= e!586340 (isStrictlySorted!719 (t!31125 (toList!6895 (map!14729 thiss!1427)))))))

(assert (= (and d!124991 (not res!691896)) b!1036724))

(assert (= (and b!1036724 res!691897) b!1036725))

(assert (=> b!1036725 m!956779))

(assert (=> d!124691 d!124991))

(declare-fun d!124993 () Bool)

(declare-fun res!691898 () Bool)

(declare-fun e!586341 () Bool)

(assert (=> d!124993 (=> res!691898 e!586341)))

(assert (=> d!124993 (= res!691898 (and ((_ is Cons!21914) (toList!6895 lt!456804)) (= (_1!7876 (h!23116 (toList!6895 lt!456804))) key!909)))))

(assert (=> d!124993 (= (containsKey!564 (toList!6895 lt!456804) key!909) e!586341)))

(declare-fun b!1036726 () Bool)

(declare-fun e!586342 () Bool)

(assert (=> b!1036726 (= e!586341 e!586342)))

(declare-fun res!691899 () Bool)

(assert (=> b!1036726 (=> (not res!691899) (not e!586342))))

(assert (=> b!1036726 (= res!691899 (and (or (not ((_ is Cons!21914) (toList!6895 lt!456804))) (bvsle (_1!7876 (h!23116 (toList!6895 lt!456804))) key!909)) ((_ is Cons!21914) (toList!6895 lt!456804)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456804))) key!909)))))

(declare-fun b!1036727 () Bool)

(assert (=> b!1036727 (= e!586342 (containsKey!564 (t!31125 (toList!6895 lt!456804)) key!909))))

(assert (= (and d!124993 (not res!691898)) b!1036726))

(assert (= (and b!1036726 res!691899) b!1036727))

(declare-fun m!956899 () Bool)

(assert (=> b!1036727 m!956899))

(assert (=> d!124689 d!124993))

(declare-fun d!124995 () Bool)

(declare-fun e!586343 () Bool)

(assert (=> d!124995 e!586343))

(declare-fun res!691900 () Bool)

(assert (=> d!124995 (=> res!691900 e!586343)))

(declare-fun lt!457246 () Bool)

(assert (=> d!124995 (= res!691900 (not lt!457246))))

(declare-fun lt!457248 () Bool)

(assert (=> d!124995 (= lt!457246 lt!457248)))

(declare-fun lt!457245 () Unit!33894)

(declare-fun e!586344 () Unit!33894)

(assert (=> d!124995 (= lt!457245 e!586344)))

(declare-fun c!104981 () Bool)

(assert (=> d!124995 (= c!104981 lt!457248)))

(assert (=> d!124995 (= lt!457248 (containsKey!564 (toList!6895 lt!456924) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124995 (= (contains!6021 lt!456924 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457246)))

(declare-fun b!1036728 () Bool)

(declare-fun lt!457247 () Unit!33894)

(assert (=> b!1036728 (= e!586344 lt!457247)))

(assert (=> b!1036728 (= lt!457247 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456924) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036728 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456924) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036729 () Bool)

(declare-fun Unit!33930 () Unit!33894)

(assert (=> b!1036729 (= e!586344 Unit!33930)))

(declare-fun b!1036730 () Bool)

(assert (=> b!1036730 (= e!586343 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124995 c!104981) b!1036728))

(assert (= (and d!124995 (not c!104981)) b!1036729))

(assert (= (and d!124995 (not res!691900)) b!1036730))

(declare-fun m!956901 () Bool)

(assert (=> d!124995 m!956901))

(declare-fun m!956903 () Bool)

(assert (=> b!1036728 m!956903))

(assert (=> b!1036728 m!956343))

(assert (=> b!1036728 m!956343))

(declare-fun m!956905 () Bool)

(assert (=> b!1036728 m!956905))

(assert (=> b!1036730 m!956343))

(assert (=> b!1036730 m!956343))

(assert (=> b!1036730 m!956905))

(assert (=> bm!43827 d!124995))

(declare-fun d!124997 () Bool)

(declare-fun res!691901 () Bool)

(declare-fun e!586345 () Bool)

(assert (=> d!124997 (=> res!691901 e!586345)))

(assert (=> d!124997 (= res!691901 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (= (_1!7876 (h!23116 (toList!6895 lt!456890))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124997 (= (containsKey!564 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) e!586345)))

(declare-fun b!1036731 () Bool)

(declare-fun e!586346 () Bool)

(assert (=> b!1036731 (= e!586345 e!586346)))

(declare-fun res!691902 () Bool)

(assert (=> b!1036731 (=> (not res!691902) (not e!586346))))

(assert (=> b!1036731 (= res!691902 (and (or (not ((_ is Cons!21914) (toList!6895 lt!456890))) (bvsle (_1!7876 (h!23116 (toList!6895 lt!456890))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21914) (toList!6895 lt!456890)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456890))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1036732 () Bool)

(assert (=> b!1036732 (= e!586346 (containsKey!564 (t!31125 (toList!6895 lt!456890)) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124997 (not res!691901)) b!1036731))

(assert (= (and b!1036731 res!691902) b!1036732))

(assert (=> b!1036732 m!955693))

(declare-fun m!956907 () Bool)

(assert (=> b!1036732 m!956907))

(assert (=> d!124695 d!124997))

(declare-fun d!124999 () Bool)

(assert (=> d!124999 (= (isEmpty!929 lt!456960) (isEmpty!931 (toList!6895 lt!456960)))))

(declare-fun bs!30356 () Bool)

(assert (= bs!30356 d!124999))

(declare-fun m!956909 () Bool)

(assert (=> bs!30356 m!956909))

(assert (=> b!1036121 d!124999))

(declare-fun b!1036734 () Bool)

(declare-fun e!586347 () Option!640)

(declare-fun e!586348 () Option!640)

(assert (=> b!1036734 (= e!586347 e!586348)))

(declare-fun c!104983 () Bool)

(assert (=> b!1036734 (= c!104983 (and ((_ is Cons!21914) (toList!6895 lt!457001)) (not (= (_1!7876 (h!23116 (toList!6895 lt!457001))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(declare-fun d!125001 () Bool)

(declare-fun c!104982 () Bool)

(assert (=> d!125001 (= c!104982 (and ((_ is Cons!21914) (toList!6895 lt!457001)) (= (_1!7876 (h!23116 (toList!6895 lt!457001))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> d!125001 (= (getValueByKey!589 (toList!6895 lt!457001) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) e!586347)))

(declare-fun b!1036735 () Bool)

(assert (=> b!1036735 (= e!586348 (getValueByKey!589 (t!31125 (toList!6895 lt!457001)) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036733 () Bool)

(assert (=> b!1036733 (= e!586347 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!457001)))))))

(declare-fun b!1036736 () Bool)

(assert (=> b!1036736 (= e!586348 None!638)))

(assert (= (and d!125001 c!104982) b!1036733))

(assert (= (and d!125001 (not c!104982)) b!1036734))

(assert (= (and b!1036734 c!104983) b!1036735))

(assert (= (and b!1036734 (not c!104983)) b!1036736))

(declare-fun m!956911 () Bool)

(assert (=> b!1036735 m!956911))

(assert (=> b!1036145 d!125001))

(declare-fun d!125003 () Bool)

(assert (=> d!125003 (= (size!31963 thiss!1427) (bvadd (_size!2947 thiss!1427) (bvsdiv (bvadd (extraKeys!6000 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1036192 d!125003))

(assert (=> b!1036266 d!124581))

(declare-fun d!125005 () Bool)

(assert (=> d!125005 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457249 () Unit!33894)

(assert (=> d!125005 (= lt!457249 (choose!1706 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586349 () Bool)

(assert (=> d!125005 e!586349))

(declare-fun res!691903 () Bool)

(assert (=> d!125005 (=> (not res!691903) (not e!586349))))

(assert (=> d!125005 (= res!691903 (isStrictlySorted!719 (toList!6895 lt!456864)))))

(assert (=> d!125005 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457249)))

(declare-fun b!1036737 () Bool)

(assert (=> b!1036737 (= e!586349 (containsKey!564 (toList!6895 lt!456864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125005 res!691903) b!1036737))

(assert (=> d!125005 m!956209))

(assert (=> d!125005 m!956209))

(assert (=> d!125005 m!956275))

(declare-fun m!956913 () Bool)

(assert (=> d!125005 m!956913))

(assert (=> d!125005 m!956603))

(assert (=> b!1036737 m!956271))

(assert (=> b!1036262 d!125005))

(assert (=> b!1036262 d!124749))

(assert (=> b!1036262 d!124727))

(declare-fun b!1036739 () Bool)

(declare-fun e!586350 () Option!640)

(declare-fun e!586351 () Option!640)

(assert (=> b!1036739 (= e!586350 e!586351)))

(declare-fun c!104985 () Bool)

(assert (=> b!1036739 (= c!104985 (and ((_ is Cons!21914) (toList!6895 lt!456972)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456972))) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))))

(declare-fun d!125007 () Bool)

(declare-fun c!104984 () Bool)

(assert (=> d!125007 (= c!104984 (and ((_ is Cons!21914) (toList!6895 lt!456972)) (= (_1!7876 (h!23116 (toList!6895 lt!456972))) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))

(assert (=> d!125007 (= (getValueByKey!589 (toList!6895 lt!456972) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) e!586350)))

(declare-fun b!1036740 () Bool)

(assert (=> b!1036740 (= e!586351 (getValueByKey!589 (t!31125 (toList!6895 lt!456972)) (_1!7876 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036738 () Bool)

(assert (=> b!1036738 (= e!586350 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456972)))))))

(declare-fun b!1036741 () Bool)

(assert (=> b!1036741 (= e!586351 None!638)))

(assert (= (and d!125007 c!104984) b!1036738))

(assert (= (and d!125007 (not c!104984)) b!1036739))

(assert (= (and b!1036739 c!104985) b!1036740))

(assert (= (and b!1036739 (not c!104985)) b!1036741))

(declare-fun m!956915 () Bool)

(assert (=> b!1036740 m!956915))

(assert (=> b!1036129 d!125007))

(declare-fun d!125009 () Bool)

(declare-fun res!691904 () Bool)

(declare-fun e!586352 () Bool)

(assert (=> d!125009 (=> res!691904 e!586352)))

(assert (=> d!125009 (= res!691904 (and ((_ is Cons!21914) (toList!6895 lt!456864)) (= (_1!7876 (h!23116 (toList!6895 lt!456864))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!125009 (= (containsKey!564 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) e!586352)))

(declare-fun b!1036742 () Bool)

(declare-fun e!586353 () Bool)

(assert (=> b!1036742 (= e!586352 e!586353)))

(declare-fun res!691905 () Bool)

(assert (=> b!1036742 (=> (not res!691905) (not e!586353))))

(assert (=> b!1036742 (= res!691905 (and (or (not ((_ is Cons!21914) (toList!6895 lt!456864))) (bvsle (_1!7876 (h!23116 (toList!6895 lt!456864))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21914) (toList!6895 lt!456864)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456864))) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1036743 () Bool)

(assert (=> b!1036743 (= e!586353 (containsKey!564 (t!31125 (toList!6895 lt!456864)) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125009 (not res!691904)) b!1036742))

(assert (= (and b!1036742 res!691905) b!1036743))

(assert (=> b!1036743 m!955693))

(declare-fun m!956917 () Bool)

(assert (=> b!1036743 m!956917))

(assert (=> d!124645 d!125009))

(declare-fun d!125011 () Bool)

(declare-fun e!586354 () Bool)

(assert (=> d!125011 e!586354))

(declare-fun res!691906 () Bool)

(assert (=> d!125011 (=> res!691906 e!586354)))

(declare-fun lt!457251 () Bool)

(assert (=> d!125011 (= res!691906 (not lt!457251))))

(declare-fun lt!457253 () Bool)

(assert (=> d!125011 (= lt!457251 lt!457253)))

(declare-fun lt!457250 () Unit!33894)

(declare-fun e!586355 () Unit!33894)

(assert (=> d!125011 (= lt!457250 e!586355)))

(declare-fun c!104986 () Bool)

(assert (=> d!125011 (= c!104986 lt!457253)))

(assert (=> d!125011 (= lt!457253 (containsKey!564 (toList!6895 lt!456950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125011 (= (contains!6021 lt!456950 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457251)))

(declare-fun b!1036744 () Bool)

(declare-fun lt!457252 () Unit!33894)

(assert (=> b!1036744 (= e!586355 lt!457252)))

(assert (=> b!1036744 (= lt!457252 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036744 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036745 () Bool)

(declare-fun Unit!33931 () Unit!33894)

(assert (=> b!1036745 (= e!586355 Unit!33931)))

(declare-fun b!1036746 () Bool)

(assert (=> b!1036746 (= e!586354 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456950) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125011 c!104986) b!1036744))

(assert (= (and d!125011 (not c!104986)) b!1036745))

(assert (= (and d!125011 (not res!691906)) b!1036746))

(declare-fun m!956919 () Bool)

(assert (=> d!125011 m!956919))

(declare-fun m!956921 () Bool)

(assert (=> b!1036744 m!956921))

(declare-fun m!956923 () Bool)

(assert (=> b!1036744 m!956923))

(assert (=> b!1036744 m!956923))

(declare-fun m!956925 () Bool)

(assert (=> b!1036744 m!956925))

(assert (=> b!1036746 m!956923))

(assert (=> b!1036746 m!956923))

(assert (=> b!1036746 m!956925))

(assert (=> d!124595 d!125011))

(assert (=> d!124595 d!124593))

(assert (=> b!1036182 d!124753))

(assert (=> b!1036182 d!124755))

(declare-fun d!125013 () Bool)

(assert (=> d!125013 (= (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) lt!456865)) (v!14931 (getValueByKey!589 (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) lt!456865)))))

(assert (=> d!124619 d!125013))

(declare-fun b!1036748 () Bool)

(declare-fun e!586356 () Option!640)

(declare-fun e!586357 () Option!640)

(assert (=> b!1036748 (= e!586356 e!586357)))

(declare-fun c!104988 () Bool)

(assert (=> b!1036748 (= c!104988 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))) (not (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))) lt!456865))))))

(declare-fun c!104987 () Bool)

(declare-fun d!125015 () Bool)

(assert (=> d!125015 (= c!104987 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))))) lt!456865)))))

(assert (=> d!125015 (= (getValueByKey!589 (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427)))) lt!456865) e!586356)))

(declare-fun b!1036749 () Bool)

(assert (=> b!1036749 (= e!586357 (getValueByKey!589 (t!31125 (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))) lt!456865))))

(declare-fun b!1036747 () Bool)

(assert (=> b!1036747 (= e!586356 (Some!639 (_2!7876 (h!23116 (toList!6895 (+!3105 lt!456851 (tuple2!15731 lt!456862 (zeroValue!6104 thiss!1427))))))))))

(declare-fun b!1036750 () Bool)

(assert (=> b!1036750 (= e!586357 None!638)))

(assert (= (and d!125015 c!104987) b!1036747))

(assert (= (and d!125015 (not c!104987)) b!1036748))

(assert (= (and b!1036748 c!104988) b!1036749))

(assert (= (and b!1036748 (not c!104988)) b!1036750))

(declare-fun m!956927 () Bool)

(assert (=> b!1036749 m!956927))

(assert (=> d!124619 d!125015))

(declare-fun d!125017 () Bool)

(declare-fun e!586358 () Bool)

(assert (=> d!125017 e!586358))

(declare-fun res!691907 () Bool)

(assert (=> d!125017 (=> (not res!691907) (not e!586358))))

(declare-fun lt!457256 () ListLongMap!13759)

(assert (=> d!125017 (= res!691907 (contains!6021 lt!457256 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))))))

(declare-fun lt!457255 () List!21918)

(assert (=> d!125017 (= lt!457256 (ListLongMap!13760 lt!457255))))

(declare-fun lt!457254 () Unit!33894)

(declare-fun lt!457257 () Unit!33894)

(assert (=> d!125017 (= lt!457254 lt!457257)))

(assert (=> d!125017 (= (getValueByKey!589 lt!457255 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))))))

(assert (=> d!125017 (= lt!457257 (lemmaContainsTupThenGetReturnValue!280 lt!457255 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))))))

(assert (=> d!125017 (= lt!457255 (insertStrictlySorted!373 (toList!6895 call!43829) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))))))

(assert (=> d!125017 (= (+!3105 call!43829 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))) lt!457256)))

(declare-fun b!1036751 () Bool)

(declare-fun res!691908 () Bool)

(assert (=> b!1036751 (=> (not res!691908) (not e!586358))))

(assert (=> b!1036751 (= res!691908 (= (getValueByKey!589 (toList!6895 lt!457256) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))))))

(declare-fun b!1036752 () Bool)

(assert (=> b!1036752 (= e!586358 (contains!6022 (toList!6895 lt!457256) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 lt!456791))))))

(assert (= (and d!125017 res!691907) b!1036751))

(assert (= (and b!1036751 res!691908) b!1036752))

(declare-fun m!956929 () Bool)

(assert (=> d!125017 m!956929))

(declare-fun m!956931 () Bool)

(assert (=> d!125017 m!956931))

(declare-fun m!956933 () Bool)

(assert (=> d!125017 m!956933))

(declare-fun m!956935 () Bool)

(assert (=> d!125017 m!956935))

(declare-fun m!956937 () Bool)

(assert (=> b!1036751 m!956937))

(declare-fun m!956939 () Bool)

(assert (=> b!1036752 m!956939))

(assert (=> b!1036061 d!125017))

(assert (=> b!1036176 d!124809))

(declare-fun d!125019 () Bool)

(declare-fun e!586359 () Bool)

(assert (=> d!125019 e!586359))

(declare-fun res!691909 () Bool)

(assert (=> d!125019 (=> res!691909 e!586359)))

(declare-fun lt!457259 () Bool)

(assert (=> d!125019 (= res!691909 (not lt!457259))))

(declare-fun lt!457261 () Bool)

(assert (=> d!125019 (= lt!457259 lt!457261)))

(declare-fun lt!457258 () Unit!33894)

(declare-fun e!586360 () Unit!33894)

(assert (=> d!125019 (= lt!457258 e!586360)))

(declare-fun c!104989 () Bool)

(assert (=> d!125019 (= c!104989 lt!457261)))

(assert (=> d!125019 (= lt!457261 (containsKey!564 (toList!6895 lt!457051) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(assert (=> d!125019 (= (contains!6021 lt!457051 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) lt!457259)))

(declare-fun b!1036753 () Bool)

(declare-fun lt!457260 () Unit!33894)

(assert (=> b!1036753 (= e!586360 lt!457260)))

(assert (=> b!1036753 (= lt!457260 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!457051) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(assert (=> b!1036753 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457051) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun b!1036754 () Bool)

(declare-fun Unit!33932 () Unit!33894)

(assert (=> b!1036754 (= e!586360 Unit!33932)))

(declare-fun b!1036755 () Bool)

(assert (=> b!1036755 (= e!586359 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457051) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (= (and d!125019 c!104989) b!1036753))

(assert (= (and d!125019 (not c!104989)) b!1036754))

(assert (= (and d!125019 (not res!691909)) b!1036755))

(declare-fun m!956941 () Bool)

(assert (=> d!125019 m!956941))

(declare-fun m!956943 () Bool)

(assert (=> b!1036753 m!956943))

(assert (=> b!1036753 m!956221))

(assert (=> b!1036753 m!956221))

(declare-fun m!956945 () Bool)

(assert (=> b!1036753 m!956945))

(assert (=> b!1036755 m!956221))

(assert (=> b!1036755 m!956221))

(assert (=> b!1036755 m!956945))

(assert (=> d!124685 d!125019))

(declare-fun b!1036757 () Bool)

(declare-fun e!586361 () Option!640)

(declare-fun e!586362 () Option!640)

(assert (=> b!1036757 (= e!586361 e!586362)))

(declare-fun c!104991 () Bool)

(assert (=> b!1036757 (= c!104991 (and ((_ is Cons!21914) lt!457050) (not (= (_1!7876 (h!23116 lt!457050)) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(declare-fun d!125021 () Bool)

(declare-fun c!104990 () Bool)

(assert (=> d!125021 (= c!104990 (and ((_ is Cons!21914) lt!457050) (= (_1!7876 (h!23116 lt!457050)) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> d!125021 (= (getValueByKey!589 lt!457050 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) e!586361)))

(declare-fun b!1036758 () Bool)

(assert (=> b!1036758 (= e!586362 (getValueByKey!589 (t!31125 lt!457050) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun b!1036756 () Bool)

(assert (=> b!1036756 (= e!586361 (Some!639 (_2!7876 (h!23116 lt!457050))))))

(declare-fun b!1036759 () Bool)

(assert (=> b!1036759 (= e!586362 None!638)))

(assert (= (and d!125021 c!104990) b!1036756))

(assert (= (and d!125021 (not c!104990)) b!1036757))

(assert (= (and b!1036757 c!104991) b!1036758))

(assert (= (and b!1036757 (not c!104991)) b!1036759))

(declare-fun m!956947 () Bool)

(assert (=> b!1036758 m!956947))

(assert (=> d!124685 d!125021))

(declare-fun d!125023 () Bool)

(assert (=> d!125023 (= (getValueByKey!589 lt!457050 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun lt!457262 () Unit!33894)

(assert (=> d!125023 (= lt!457262 (choose!1705 lt!457050 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun e!586363 () Bool)

(assert (=> d!125023 e!586363))

(declare-fun res!691910 () Bool)

(assert (=> d!125023 (=> (not res!691910) (not e!586363))))

(assert (=> d!125023 (= res!691910 (isStrictlySorted!719 lt!457050))))

(assert (=> d!125023 (= (lemmaContainsTupThenGetReturnValue!280 lt!457050 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) lt!457262)))

(declare-fun b!1036760 () Bool)

(declare-fun res!691911 () Bool)

(assert (=> b!1036760 (=> (not res!691911) (not e!586363))))

(assert (=> b!1036760 (= res!691911 (containsKey!564 lt!457050 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun b!1036761 () Bool)

(assert (=> b!1036761 (= e!586363 (contains!6022 lt!457050 (tuple2!15731 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (= (and d!125023 res!691910) b!1036760))

(assert (= (and b!1036760 res!691911) b!1036761))

(assert (=> d!125023 m!956215))

(declare-fun m!956949 () Bool)

(assert (=> d!125023 m!956949))

(declare-fun m!956951 () Bool)

(assert (=> d!125023 m!956951))

(declare-fun m!956953 () Bool)

(assert (=> b!1036760 m!956953))

(declare-fun m!956955 () Bool)

(assert (=> b!1036761 m!956955))

(assert (=> d!124685 d!125023))

(declare-fun b!1036762 () Bool)

(declare-fun e!586367 () List!21918)

(assert (=> b!1036762 (= e!586367 (insertStrictlySorted!373 (t!31125 (toList!6895 call!43822)) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun b!1036763 () Bool)

(declare-fun e!586366 () List!21918)

(declare-fun call!43888 () List!21918)

(assert (=> b!1036763 (= e!586366 call!43888)))

(declare-fun bm!43883 () Bool)

(declare-fun call!43886 () List!21918)

(assert (=> bm!43883 (= call!43888 call!43886)))

(declare-fun b!1036764 () Bool)

(declare-fun e!586368 () List!21918)

(assert (=> b!1036764 (= e!586368 call!43886)))

(declare-fun b!1036765 () Bool)

(declare-fun e!586364 () List!21918)

(declare-fun call!43887 () List!21918)

(assert (=> b!1036765 (= e!586364 call!43887)))

(declare-fun b!1036766 () Bool)

(declare-fun res!691913 () Bool)

(declare-fun e!586365 () Bool)

(assert (=> b!1036766 (=> (not res!691913) (not e!586365))))

(declare-fun lt!457263 () List!21918)

(assert (=> b!1036766 (= res!691913 (containsKey!564 lt!457263 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))

(declare-fun b!1036768 () Bool)

(declare-fun c!104992 () Bool)

(assert (=> b!1036768 (= c!104992 (and ((_ is Cons!21914) (toList!6895 call!43822)) (bvsgt (_1!7876 (h!23116 (toList!6895 call!43822))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> b!1036768 (= e!586366 e!586364)))

(declare-fun b!1036769 () Bool)

(assert (=> b!1036769 (= e!586364 call!43887)))

(declare-fun b!1036770 () Bool)

(assert (=> b!1036770 (= e!586365 (contains!6022 lt!457263 (tuple2!15731 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun c!104993 () Bool)

(declare-fun bm!43884 () Bool)

(assert (=> bm!43884 (= call!43886 ($colon$colon!603 e!586367 (ite c!104993 (h!23116 (toList!6895 call!43822)) (tuple2!15731 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))))))))

(declare-fun c!104994 () Bool)

(assert (=> bm!43884 (= c!104994 c!104993)))

(declare-fun b!1036771 () Bool)

(assert (=> b!1036771 (= e!586368 e!586366)))

(declare-fun c!104995 () Bool)

(assert (=> b!1036771 (= c!104995 (and ((_ is Cons!21914) (toList!6895 call!43822)) (= (_1!7876 (h!23116 (toList!6895 call!43822))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(declare-fun bm!43885 () Bool)

(assert (=> bm!43885 (= call!43887 call!43888)))

(declare-fun b!1036767 () Bool)

(assert (=> b!1036767 (= e!586367 (ite c!104995 (t!31125 (toList!6895 call!43822)) (ite c!104992 (Cons!21914 (h!23116 (toList!6895 call!43822)) (t!31125 (toList!6895 call!43822))) Nil!21915)))))

(declare-fun d!125025 () Bool)

(assert (=> d!125025 e!586365))

(declare-fun res!691912 () Bool)

(assert (=> d!125025 (=> (not res!691912) (not e!586365))))

(assert (=> d!125025 (= res!691912 (isStrictlySorted!719 lt!457263))))

(assert (=> d!125025 (= lt!457263 e!586368)))

(assert (=> d!125025 (= c!104993 (and ((_ is Cons!21914) (toList!6895 call!43822)) (bvslt (_1!7876 (h!23116 (toList!6895 call!43822))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))))

(assert (=> d!125025 (isStrictlySorted!719 (toList!6895 call!43822))))

(assert (=> d!125025 (= (insertStrictlySorted!373 (toList!6895 call!43822) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792))) lt!457263)))

(assert (= (and d!125025 c!104993) b!1036764))

(assert (= (and d!125025 (not c!104993)) b!1036771))

(assert (= (and b!1036771 c!104995) b!1036763))

(assert (= (and b!1036771 (not c!104995)) b!1036768))

(assert (= (and b!1036768 c!104992) b!1036769))

(assert (= (and b!1036768 (not c!104992)) b!1036765))

(assert (= (or b!1036769 b!1036765) bm!43885))

(assert (= (or b!1036763 bm!43885) bm!43883))

(assert (= (or b!1036764 bm!43883) bm!43884))

(assert (= (and bm!43884 c!104994) b!1036762))

(assert (= (and bm!43884 (not c!104994)) b!1036767))

(assert (= (and d!125025 res!691912) b!1036766))

(assert (= (and b!1036766 res!691913) b!1036770))

(declare-fun m!956957 () Bool)

(assert (=> b!1036770 m!956957))

(declare-fun m!956959 () Bool)

(assert (=> b!1036762 m!956959))

(declare-fun m!956961 () Bool)

(assert (=> b!1036766 m!956961))

(declare-fun m!956963 () Bool)

(assert (=> bm!43884 m!956963))

(declare-fun m!956965 () Bool)

(assert (=> d!125025 m!956965))

(declare-fun m!956967 () Bool)

(assert (=> d!125025 m!956967))

(assert (=> d!124685 d!125025))

(declare-fun d!125027 () Bool)

(assert (=> d!125027 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895))))

(declare-fun lt!457264 () Unit!33894)

(assert (=> d!125027 (= lt!457264 (choose!1706 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895))))

(declare-fun e!586369 () Bool)

(assert (=> d!125027 e!586369))

(declare-fun res!691914 () Bool)

(assert (=> d!125027 (=> (not res!691914) (not e!586369))))

(assert (=> d!125027 (= res!691914 (isStrictlySorted!719 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!125027 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895) lt!457264)))

(declare-fun b!1036772 () Bool)

(assert (=> b!1036772 (= e!586369 (containsKey!564 (toList!6895 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) lt!456895))))

(assert (= (and d!125027 res!691914) b!1036772))

(assert (=> d!125027 m!956193))

(assert (=> d!125027 m!956193))

(assert (=> d!125027 m!956195))

(declare-fun m!956969 () Bool)

(assert (=> d!125027 m!956969))

(declare-fun m!956971 () Bool)

(assert (=> d!125027 m!956971))

(assert (=> b!1036772 m!956189))

(assert (=> b!1036221 d!125027))

(assert (=> b!1036221 d!124783))

(assert (=> b!1036221 d!124785))

(declare-fun lt!457265 () Bool)

(declare-fun d!125029 () Bool)

(assert (=> d!125029 (= lt!457265 (select (content!514 (toList!6895 lt!457047)) (tuple2!15731 lt!456878 lt!456792)))))

(declare-fun e!586370 () Bool)

(assert (=> d!125029 (= lt!457265 e!586370)))

(declare-fun res!691915 () Bool)

(assert (=> d!125029 (=> (not res!691915) (not e!586370))))

(assert (=> d!125029 (= res!691915 ((_ is Cons!21914) (toList!6895 lt!457047)))))

(assert (=> d!125029 (= (contains!6022 (toList!6895 lt!457047) (tuple2!15731 lt!456878 lt!456792)) lt!457265)))

(declare-fun b!1036773 () Bool)

(declare-fun e!586371 () Bool)

(assert (=> b!1036773 (= e!586370 e!586371)))

(declare-fun res!691916 () Bool)

(assert (=> b!1036773 (=> res!691916 e!586371)))

(assert (=> b!1036773 (= res!691916 (= (h!23116 (toList!6895 lt!457047)) (tuple2!15731 lt!456878 lt!456792)))))

(declare-fun b!1036774 () Bool)

(assert (=> b!1036774 (= e!586371 (contains!6022 (t!31125 (toList!6895 lt!457047)) (tuple2!15731 lt!456878 lt!456792)))))

(assert (= (and d!125029 res!691915) b!1036773))

(assert (= (and b!1036773 (not res!691916)) b!1036774))

(declare-fun m!956973 () Bool)

(assert (=> d!125029 m!956973))

(declare-fun m!956975 () Bool)

(assert (=> d!125029 m!956975))

(declare-fun m!956977 () Bool)

(assert (=> b!1036774 m!956977))

(assert (=> b!1036225 d!125029))

(declare-fun d!125031 () Bool)

(assert (=> d!125031 (= (apply!907 lt!456960 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) (get!16464 (getValueByKey!589 (toList!6895 lt!456960) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30357 () Bool)

(assert (= bs!30357 d!125031))

(assert (=> bs!30357 m!955693))

(assert (=> bs!30357 m!956767))

(assert (=> bs!30357 m!956767))

(declare-fun m!956979 () Bool)

(assert (=> bs!30357 m!956979))

(assert (=> b!1036114 d!125031))

(assert (=> b!1036114 d!124585))

(declare-fun d!125033 () Bool)

(declare-fun lt!457266 () Bool)

(assert (=> d!125033 (= lt!457266 (select (content!514 (toList!6895 lt!457051)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))

(declare-fun e!586372 () Bool)

(assert (=> d!125033 (= lt!457266 e!586372)))

(declare-fun res!691917 () Bool)

(assert (=> d!125033 (=> (not res!691917) (not e!586372))))

(assert (=> d!125033 (= res!691917 ((_ is Cons!21914) (toList!6895 lt!457051)))))

(assert (=> d!125033 (= (contains!6022 (toList!6895 lt!457051) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)) lt!457266)))

(declare-fun b!1036775 () Bool)

(declare-fun e!586373 () Bool)

(assert (=> b!1036775 (= e!586372 e!586373)))

(declare-fun res!691918 () Bool)

(assert (=> b!1036775 (=> res!691918 e!586373)))

(assert (=> b!1036775 (= res!691918 (= (h!23116 (toList!6895 lt!457051)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))

(declare-fun b!1036776 () Bool)

(assert (=> b!1036776 (= e!586373 (contains!6022 (t!31125 (toList!6895 lt!457051)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456792)))))

(assert (= (and d!125033 res!691917) b!1036775))

(assert (= (and b!1036775 (not res!691918)) b!1036776))

(declare-fun m!956981 () Bool)

(assert (=> d!125033 m!956981))

(declare-fun m!956983 () Bool)

(assert (=> d!125033 m!956983))

(declare-fun m!956985 () Bool)

(assert (=> b!1036776 m!956985))

(assert (=> b!1036227 d!125033))

(declare-fun d!125035 () Bool)

(declare-fun e!586374 () Bool)

(assert (=> d!125035 e!586374))

(declare-fun res!691919 () Bool)

(assert (=> d!125035 (=> res!691919 e!586374)))

(declare-fun lt!457268 () Bool)

(assert (=> d!125035 (= res!691919 (not lt!457268))))

(declare-fun lt!457270 () Bool)

(assert (=> d!125035 (= lt!457268 lt!457270)))

(declare-fun lt!457267 () Unit!33894)

(declare-fun e!586375 () Unit!33894)

(assert (=> d!125035 (= lt!457267 e!586375)))

(declare-fun c!104996 () Bool)

(assert (=> d!125035 (= c!104996 lt!457270)))

(assert (=> d!125035 (= lt!457270 (containsKey!564 (toList!6895 lt!457001) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(assert (=> d!125035 (= (contains!6021 lt!457001 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) lt!457268)))

(declare-fun b!1036777 () Bool)

(declare-fun lt!457269 () Unit!33894)

(assert (=> b!1036777 (= e!586375 lt!457269)))

(assert (=> b!1036777 (= lt!457269 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!457001) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(assert (=> b!1036777 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457001) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036778 () Bool)

(declare-fun Unit!33933 () Unit!33894)

(assert (=> b!1036778 (= e!586375 Unit!33933)))

(declare-fun b!1036779 () Bool)

(assert (=> b!1036779 (= e!586374 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457001) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (= (and d!125035 c!104996) b!1036777))

(assert (= (and d!125035 (not c!104996)) b!1036778))

(assert (= (and d!125035 (not res!691919)) b!1036779))

(declare-fun m!956987 () Bool)

(assert (=> d!125035 m!956987))

(declare-fun m!956989 () Bool)

(assert (=> b!1036777 m!956989))

(assert (=> b!1036777 m!956051))

(assert (=> b!1036777 m!956051))

(declare-fun m!956991 () Bool)

(assert (=> b!1036777 m!956991))

(assert (=> b!1036779 m!956051))

(assert (=> b!1036779 m!956051))

(assert (=> b!1036779 m!956991))

(assert (=> d!124631 d!125035))

(declare-fun b!1036781 () Bool)

(declare-fun e!586376 () Option!640)

(declare-fun e!586377 () Option!640)

(assert (=> b!1036781 (= e!586376 e!586377)))

(declare-fun c!104998 () Bool)

(assert (=> b!1036781 (= c!104998 (and ((_ is Cons!21914) lt!457000) (not (= (_1!7876 (h!23116 lt!457000)) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(declare-fun d!125037 () Bool)

(declare-fun c!104997 () Bool)

(assert (=> d!125037 (= c!104997 (and ((_ is Cons!21914) lt!457000) (= (_1!7876 (h!23116 lt!457000)) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> d!125037 (= (getValueByKey!589 lt!457000 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) e!586376)))

(declare-fun b!1036782 () Bool)

(assert (=> b!1036782 (= e!586377 (getValueByKey!589 (t!31125 lt!457000) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036780 () Bool)

(assert (=> b!1036780 (= e!586376 (Some!639 (_2!7876 (h!23116 lt!457000))))))

(declare-fun b!1036783 () Bool)

(assert (=> b!1036783 (= e!586377 None!638)))

(assert (= (and d!125037 c!104997) b!1036780))

(assert (= (and d!125037 (not c!104997)) b!1036781))

(assert (= (and b!1036781 c!104998) b!1036782))

(assert (= (and b!1036781 (not c!104998)) b!1036783))

(declare-fun m!956993 () Bool)

(assert (=> b!1036782 m!956993))

(assert (=> d!124631 d!125037))

(declare-fun d!125039 () Bool)

(assert (=> d!125039 (= (getValueByKey!589 lt!457000 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun lt!457271 () Unit!33894)

(assert (=> d!125039 (= lt!457271 (choose!1705 lt!457000 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun e!586378 () Bool)

(assert (=> d!125039 e!586378))

(declare-fun res!691920 () Bool)

(assert (=> d!125039 (=> (not res!691920) (not e!586378))))

(assert (=> d!125039 (= res!691920 (isStrictlySorted!719 lt!457000))))

(assert (=> d!125039 (= (lemmaContainsTupThenGetReturnValue!280 lt!457000 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) lt!457271)))

(declare-fun b!1036784 () Bool)

(declare-fun res!691921 () Bool)

(assert (=> b!1036784 (=> (not res!691921) (not e!586378))))

(assert (=> b!1036784 (= res!691921 (containsKey!564 lt!457000 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036785 () Bool)

(assert (=> b!1036785 (= e!586378 (contains!6022 lt!457000 (tuple2!15731 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (= (and d!125039 res!691920) b!1036784))

(assert (= (and b!1036784 res!691921) b!1036785))

(assert (=> d!125039 m!956045))

(declare-fun m!956995 () Bool)

(assert (=> d!125039 m!956995))

(declare-fun m!956997 () Bool)

(assert (=> d!125039 m!956997))

(declare-fun m!956999 () Bool)

(assert (=> b!1036784 m!956999))

(declare-fun m!957001 () Bool)

(assert (=> b!1036785 m!957001))

(assert (=> d!124631 d!125039))

(declare-fun b!1036786 () Bool)

(declare-fun e!586382 () List!21918)

(assert (=> b!1036786 (= e!586382 (insertStrictlySorted!373 (t!31125 (toList!6895 call!43815)) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036787 () Bool)

(declare-fun e!586381 () List!21918)

(declare-fun call!43891 () List!21918)

(assert (=> b!1036787 (= e!586381 call!43891)))

(declare-fun bm!43886 () Bool)

(declare-fun call!43889 () List!21918)

(assert (=> bm!43886 (= call!43891 call!43889)))

(declare-fun b!1036788 () Bool)

(declare-fun e!586383 () List!21918)

(assert (=> b!1036788 (= e!586383 call!43889)))

(declare-fun b!1036789 () Bool)

(declare-fun e!586379 () List!21918)

(declare-fun call!43890 () List!21918)

(assert (=> b!1036789 (= e!586379 call!43890)))

(declare-fun b!1036790 () Bool)

(declare-fun res!691923 () Bool)

(declare-fun e!586380 () Bool)

(assert (=> b!1036790 (=> (not res!691923) (not e!586380))))

(declare-fun lt!457272 () List!21918)

(assert (=> b!1036790 (= res!691923 (containsKey!564 lt!457272 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))

(declare-fun b!1036792 () Bool)

(declare-fun c!104999 () Bool)

(assert (=> b!1036792 (= c!104999 (and ((_ is Cons!21914) (toList!6895 call!43815)) (bvsgt (_1!7876 (h!23116 (toList!6895 call!43815))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> b!1036792 (= e!586381 e!586379)))

(declare-fun b!1036793 () Bool)

(assert (=> b!1036793 (= e!586379 call!43890)))

(declare-fun b!1036794 () Bool)

(assert (=> b!1036794 (= e!586380 (contains!6022 lt!457272 (tuple2!15731 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun bm!43887 () Bool)

(declare-fun c!105000 () Bool)

(assert (=> bm!43887 (= call!43889 ($colon$colon!603 e!586382 (ite c!105000 (h!23116 (toList!6895 call!43815)) (tuple2!15731 (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))))))))

(declare-fun c!105001 () Bool)

(assert (=> bm!43887 (= c!105001 c!105000)))

(declare-fun b!1036795 () Bool)

(assert (=> b!1036795 (= e!586383 e!586381)))

(declare-fun c!105002 () Bool)

(assert (=> b!1036795 (= c!105002 (and ((_ is Cons!21914) (toList!6895 call!43815)) (= (_1!7876 (h!23116 (toList!6895 call!43815))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(declare-fun bm!43888 () Bool)

(assert (=> bm!43888 (= call!43890 call!43891)))

(declare-fun b!1036791 () Bool)

(assert (=> b!1036791 (= e!586382 (ite c!105002 (t!31125 (toList!6895 call!43815)) (ite c!104999 (Cons!21914 (h!23116 (toList!6895 call!43815)) (t!31125 (toList!6895 call!43815))) Nil!21915)))))

(declare-fun d!125041 () Bool)

(assert (=> d!125041 e!586380))

(declare-fun res!691922 () Bool)

(assert (=> d!125041 (=> (not res!691922) (not e!586380))))

(assert (=> d!125041 (= res!691922 (isStrictlySorted!719 lt!457272))))

(assert (=> d!125041 (= lt!457272 e!586383)))

(assert (=> d!125041 (= c!105000 (and ((_ is Cons!21914) (toList!6895 call!43815)) (bvslt (_1!7876 (h!23116 (toList!6895 call!43815))) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))))

(assert (=> d!125041 (isStrictlySorted!719 (toList!6895 call!43815))))

(assert (=> d!125041 (= (insertStrictlySorted!373 (toList!6895 call!43815) (_1!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) (_2!7876 (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427)))) lt!457272)))

(assert (= (and d!125041 c!105000) b!1036788))

(assert (= (and d!125041 (not c!105000)) b!1036795))

(assert (= (and b!1036795 c!105002) b!1036787))

(assert (= (and b!1036795 (not c!105002)) b!1036792))

(assert (= (and b!1036792 c!104999) b!1036793))

(assert (= (and b!1036792 (not c!104999)) b!1036789))

(assert (= (or b!1036793 b!1036789) bm!43888))

(assert (= (or b!1036787 bm!43888) bm!43886))

(assert (= (or b!1036788 bm!43886) bm!43887))

(assert (= (and bm!43887 c!105001) b!1036786))

(assert (= (and bm!43887 (not c!105001)) b!1036791))

(assert (= (and d!125041 res!691922) b!1036790))

(assert (= (and b!1036790 res!691923) b!1036794))

(declare-fun m!957003 () Bool)

(assert (=> b!1036794 m!957003))

(declare-fun m!957005 () Bool)

(assert (=> b!1036786 m!957005))

(declare-fun m!957007 () Bool)

(assert (=> b!1036790 m!957007))

(declare-fun m!957009 () Bool)

(assert (=> bm!43887 m!957009))

(declare-fun m!957011 () Bool)

(assert (=> d!125041 m!957011))

(declare-fun m!957013 () Bool)

(assert (=> d!125041 m!957013))

(assert (=> d!124631 d!125041))

(declare-fun b!1036796 () Bool)

(declare-fun e!586384 () Bool)

(declare-fun e!586386 () Bool)

(assert (=> b!1036796 (= e!586384 e!586386)))

(assert (=> b!1036796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(declare-fun res!691925 () Bool)

(declare-fun lt!457278 () ListLongMap!13759)

(assert (=> b!1036796 (= res!691925 (contains!6021 lt!457278 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (=> b!1036796 (=> (not res!691925) (not e!586386))))

(declare-fun b!1036797 () Bool)

(assert (=> b!1036797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(assert (=> b!1036797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31960 (_values!6293 lt!456791))))))

(assert (=> b!1036797 (= e!586386 (= (apply!907 lt!457278 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)) (get!16463 (select (arr!31432 (_values!6293 lt!456791)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 lt!456791) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036798 () Bool)

(declare-fun e!586387 () ListLongMap!13759)

(declare-fun call!43892 () ListLongMap!13759)

(assert (=> b!1036798 (= e!586387 call!43892)))

(declare-fun b!1036799 () Bool)

(declare-fun e!586390 () ListLongMap!13759)

(assert (=> b!1036799 (= e!586390 (ListLongMap!13760 Nil!21915))))

(declare-fun d!125043 () Bool)

(declare-fun e!586385 () Bool)

(assert (=> d!125043 e!586385))

(declare-fun res!691926 () Bool)

(assert (=> d!125043 (=> (not res!691926) (not e!586385))))

(assert (=> d!125043 (= res!691926 (not (contains!6021 lt!457278 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125043 (= lt!457278 e!586390)))

(declare-fun c!105003 () Bool)

(assert (=> d!125043 (= c!105003 (bvsge #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!125043 (validMask!0 (mask!30171 lt!456791))))

(assert (=> d!125043 (= (getCurrentListMapNoExtraKeys!3521 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) #b00000000000000000000000000000000 (defaultEntry!6270 lt!456791)) lt!457278)))

(declare-fun bm!43889 () Bool)

(assert (=> bm!43889 (= call!43892 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6270 lt!456791)))))

(declare-fun b!1036800 () Bool)

(declare-fun e!586389 () Bool)

(assert (=> b!1036800 (= e!586389 (= lt!457278 (getCurrentListMapNoExtraKeys!3521 (_keys!11459 lt!456791) (_values!6293 lt!456791) (mask!30171 lt!456791) (extraKeys!6000 lt!456791) (zeroValue!6104 lt!456791) (minValue!6106 lt!456791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6270 lt!456791))))))

(declare-fun b!1036801 () Bool)

(declare-fun e!586388 () Bool)

(assert (=> b!1036801 (= e!586388 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (=> b!1036801 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1036802 () Bool)

(assert (=> b!1036802 (= e!586384 e!586389)))

(declare-fun c!105004 () Bool)

(assert (=> b!1036802 (= c!105004 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(declare-fun b!1036803 () Bool)

(assert (=> b!1036803 (= e!586385 e!586384)))

(declare-fun c!105006 () Bool)

(assert (=> b!1036803 (= c!105006 e!586388)))

(declare-fun res!691927 () Bool)

(assert (=> b!1036803 (=> (not res!691927) (not e!586388))))

(assert (=> b!1036803 (= res!691927 (bvslt #b00000000000000000000000000000000 (size!31959 (_keys!11459 lt!456791))))))

(declare-fun b!1036804 () Bool)

(assert (=> b!1036804 (= e!586389 (isEmpty!929 lt!457278))))

(declare-fun b!1036805 () Bool)

(declare-fun lt!457279 () Unit!33894)

(declare-fun lt!457276 () Unit!33894)

(assert (=> b!1036805 (= lt!457279 lt!457276)))

(declare-fun lt!457277 () (_ BitVec 64))

(declare-fun lt!457274 () (_ BitVec 64))

(declare-fun lt!457275 () V!37669)

(declare-fun lt!457273 () ListLongMap!13759)

(assert (=> b!1036805 (not (contains!6021 (+!3105 lt!457273 (tuple2!15731 lt!457277 lt!457275)) lt!457274))))

(assert (=> b!1036805 (= lt!457276 (addStillNotContains!243 lt!457273 lt!457277 lt!457275 lt!457274))))

(assert (=> b!1036805 (= lt!457274 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036805 (= lt!457275 (get!16463 (select (arr!31432 (_values!6293 lt!456791)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 lt!456791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036805 (= lt!457277 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000))))

(assert (=> b!1036805 (= lt!457273 call!43892)))

(assert (=> b!1036805 (= e!586387 (+!3105 call!43892 (tuple2!15731 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 lt!456791)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 lt!456791) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036806 () Bool)

(declare-fun res!691924 () Bool)

(assert (=> b!1036806 (=> (not res!691924) (not e!586385))))

(assert (=> b!1036806 (= res!691924 (not (contains!6021 lt!457278 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036807 () Bool)

(assert (=> b!1036807 (= e!586390 e!586387)))

(declare-fun c!105005 () Bool)

(assert (=> b!1036807 (= c!105005 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(assert (= (and d!125043 c!105003) b!1036799))

(assert (= (and d!125043 (not c!105003)) b!1036807))

(assert (= (and b!1036807 c!105005) b!1036805))

(assert (= (and b!1036807 (not c!105005)) b!1036798))

(assert (= (or b!1036805 b!1036798) bm!43889))

(assert (= (and d!125043 res!691926) b!1036806))

(assert (= (and b!1036806 res!691924) b!1036803))

(assert (= (and b!1036803 res!691927) b!1036801))

(assert (= (and b!1036803 c!105006) b!1036796))

(assert (= (and b!1036803 (not c!105006)) b!1036802))

(assert (= (and b!1036796 res!691925) b!1036797))

(assert (= (and b!1036802 c!105004) b!1036800))

(assert (= (and b!1036802 (not c!105004)) b!1036804))

(declare-fun b_lambda!16143 () Bool)

(assert (=> (not b_lambda!16143) (not b!1036797)))

(assert (=> b!1036797 t!31133))

(declare-fun b_and!33409 () Bool)

(assert (= b_and!33407 (and (=> t!31133 result!14431) b_and!33409)))

(declare-fun b_lambda!16145 () Bool)

(assert (=> (not b_lambda!16145) (not b!1036805)))

(assert (=> b!1036805 t!31133))

(declare-fun b_and!33411 () Bool)

(assert (= b_and!33409 (and (=> t!31133 result!14431) b_and!33411)))

(declare-fun m!957015 () Bool)

(assert (=> b!1036804 m!957015))

(assert (=> b!1036801 m!955841))

(assert (=> b!1036801 m!955841))

(assert (=> b!1036801 m!955843))

(assert (=> b!1036796 m!955841))

(assert (=> b!1036796 m!955841))

(declare-fun m!957017 () Bool)

(assert (=> b!1036796 m!957017))

(declare-fun m!957019 () Bool)

(assert (=> b!1036806 m!957019))

(declare-fun m!957021 () Bool)

(assert (=> bm!43889 m!957021))

(assert (=> b!1036807 m!955841))

(assert (=> b!1036807 m!955841))

(assert (=> b!1036807 m!955843))

(declare-fun m!957023 () Bool)

(assert (=> b!1036805 m!957023))

(assert (=> b!1036805 m!955849))

(assert (=> b!1036805 m!955845))

(assert (=> b!1036805 m!955851))

(assert (=> b!1036805 m!955849))

(assert (=> b!1036805 m!955845))

(assert (=> b!1036805 m!955841))

(declare-fun m!957025 () Bool)

(assert (=> b!1036805 m!957025))

(declare-fun m!957027 () Bool)

(assert (=> b!1036805 m!957027))

(assert (=> b!1036805 m!957023))

(declare-fun m!957029 () Bool)

(assert (=> b!1036805 m!957029))

(declare-fun m!957031 () Bool)

(assert (=> d!125043 m!957031))

(assert (=> d!125043 m!955893))

(assert (=> b!1036800 m!957021))

(assert (=> b!1036797 m!955841))

(declare-fun m!957033 () Bool)

(assert (=> b!1036797 m!957033))

(assert (=> b!1036797 m!955849))

(assert (=> b!1036797 m!955845))

(assert (=> b!1036797 m!955851))

(assert (=> b!1036797 m!955849))

(assert (=> b!1036797 m!955845))

(assert (=> b!1036797 m!955841))

(assert (=> bm!43830 d!125043))

(assert (=> d!124659 d!124667))

(declare-fun d!125045 () Bool)

(assert (=> d!125045 (= (apply!907 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)) lt!456894) (apply!907 lt!456880 lt!456894))))

(assert (=> d!125045 true))

(declare-fun _$34!1176 () Unit!33894)

(assert (=> d!125045 (= (choose!1703 lt!456880 lt!456875 lt!456792 lt!456894) _$34!1176)))

(declare-fun bs!30358 () Bool)

(assert (= bs!30358 d!125045))

(assert (=> bs!30358 m!955779))

(assert (=> bs!30358 m!955779))

(assert (=> bs!30358 m!955781))

(assert (=> bs!30358 m!955767))

(assert (=> d!124659 d!125045))

(declare-fun d!125047 () Bool)

(declare-fun e!586391 () Bool)

(assert (=> d!125047 e!586391))

(declare-fun res!691928 () Bool)

(assert (=> d!125047 (=> res!691928 e!586391)))

(declare-fun lt!457281 () Bool)

(assert (=> d!125047 (= res!691928 (not lt!457281))))

(declare-fun lt!457283 () Bool)

(assert (=> d!125047 (= lt!457281 lt!457283)))

(declare-fun lt!457280 () Unit!33894)

(declare-fun e!586392 () Unit!33894)

(assert (=> d!125047 (= lt!457280 e!586392)))

(declare-fun c!105007 () Bool)

(assert (=> d!125047 (= c!105007 lt!457283)))

(assert (=> d!125047 (= lt!457283 (containsKey!564 (toList!6895 lt!456880) lt!456894))))

(assert (=> d!125047 (= (contains!6021 lt!456880 lt!456894) lt!457281)))

(declare-fun b!1036808 () Bool)

(declare-fun lt!457282 () Unit!33894)

(assert (=> b!1036808 (= e!586392 lt!457282)))

(assert (=> b!1036808 (= lt!457282 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456880) lt!456894))))

(assert (=> b!1036808 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456880) lt!456894))))

(declare-fun b!1036809 () Bool)

(declare-fun Unit!33934 () Unit!33894)

(assert (=> b!1036809 (= e!586392 Unit!33934)))

(declare-fun b!1036810 () Bool)

(assert (=> b!1036810 (= e!586391 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456880) lt!456894)))))

(assert (= (and d!125047 c!105007) b!1036808))

(assert (= (and d!125047 (not c!105007)) b!1036809))

(assert (= (and d!125047 (not res!691928)) b!1036810))

(declare-fun m!957035 () Bool)

(assert (=> d!125047 m!957035))

(declare-fun m!957037 () Bool)

(assert (=> b!1036808 m!957037))

(assert (=> b!1036808 m!956181))

(assert (=> b!1036808 m!956181))

(declare-fun m!957039 () Bool)

(assert (=> b!1036808 m!957039))

(assert (=> b!1036810 m!956181))

(assert (=> b!1036810 m!956181))

(assert (=> b!1036810 m!957039))

(assert (=> d!124659 d!125047))

(assert (=> d!124659 d!124675))

(assert (=> d!124659 d!124677))

(declare-fun d!125049 () Bool)

(declare-fun res!691929 () Bool)

(declare-fun e!586393 () Bool)

(assert (=> d!125049 (=> res!691929 e!586393)))

(assert (=> d!125049 (= res!691929 (and ((_ is Cons!21914) lt!457061) (= (_1!7876 (h!23116 lt!457061)) key!909)))))

(assert (=> d!125049 (= (containsKey!564 lt!457061 key!909) e!586393)))

(declare-fun b!1036811 () Bool)

(declare-fun e!586394 () Bool)

(assert (=> b!1036811 (= e!586393 e!586394)))

(declare-fun res!691930 () Bool)

(assert (=> b!1036811 (=> (not res!691930) (not e!586394))))

(assert (=> b!1036811 (= res!691930 (and (or (not ((_ is Cons!21914) lt!457061)) (bvsle (_1!7876 (h!23116 lt!457061)) key!909)) ((_ is Cons!21914) lt!457061) (bvslt (_1!7876 (h!23116 lt!457061)) key!909)))))

(declare-fun b!1036812 () Bool)

(assert (=> b!1036812 (= e!586394 (containsKey!564 (t!31125 lt!457061) key!909))))

(assert (= (and d!125049 (not res!691929)) b!1036811))

(assert (= (and b!1036811 res!691930) b!1036812))

(declare-fun m!957041 () Bool)

(assert (=> b!1036812 m!957041))

(assert (=> b!1036235 d!125049))

(declare-fun d!125051 () Bool)

(assert (=> d!125051 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456804) key!909))))

(declare-fun lt!457284 () Unit!33894)

(assert (=> d!125051 (= lt!457284 (choose!1706 (toList!6895 lt!456804) key!909))))

(declare-fun e!586395 () Bool)

(assert (=> d!125051 e!586395))

(declare-fun res!691931 () Bool)

(assert (=> d!125051 (=> (not res!691931) (not e!586395))))

(assert (=> d!125051 (= res!691931 (isStrictlySorted!719 (toList!6895 lt!456804)))))

(assert (=> d!125051 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456804) key!909) lt!457284)))

(declare-fun b!1036813 () Bool)

(assert (=> b!1036813 (= e!586395 (containsKey!564 (toList!6895 lt!456804) key!909))))

(assert (= (and d!125051 res!691931) b!1036813))

(assert (=> d!125051 m!956235))

(assert (=> d!125051 m!956235))

(assert (=> d!125051 m!956237))

(declare-fun m!957043 () Bool)

(assert (=> d!125051 m!957043))

(declare-fun m!957045 () Bool)

(assert (=> d!125051 m!957045))

(assert (=> b!1036813 m!956231))

(assert (=> b!1036231 d!125051))

(assert (=> b!1036231 d!124871))

(assert (=> b!1036231 d!124873))

(declare-fun b!1036814 () Bool)

(declare-fun e!586396 () (_ BitVec 32))

(assert (=> b!1036814 (= e!586396 #b00000000000000000000000000000000)))

(declare-fun b!1036815 () Bool)

(declare-fun e!586397 () (_ BitVec 32))

(assert (=> b!1036815 (= e!586396 e!586397)))

(declare-fun c!105009 () Bool)

(assert (=> b!1036815 (= c!105009 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125053 () Bool)

(declare-fun lt!457285 () (_ BitVec 32))

(assert (=> d!125053 (and (bvsge lt!457285 #b00000000000000000000000000000000) (bvsle lt!457285 (bvsub (size!31959 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125053 (= lt!457285 e!586396)))

(declare-fun c!105008 () Bool)

(assert (=> d!125053 (= c!105008 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!125053 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31959 (_keys!11459 thiss!1427)) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!125053 (= (arrayCountValidKeys!0 (_keys!11459 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))) lt!457285)))

(declare-fun b!1036816 () Bool)

(declare-fun call!43893 () (_ BitVec 32))

(assert (=> b!1036816 (= e!586397 (bvadd #b00000000000000000000000000000001 call!43893))))

(declare-fun bm!43890 () Bool)

(assert (=> bm!43890 (= call!43893 (arrayCountValidKeys!0 (_keys!11459 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(declare-fun b!1036817 () Bool)

(assert (=> b!1036817 (= e!586397 call!43893)))

(assert (= (and d!125053 c!105008) b!1036814))

(assert (= (and d!125053 (not c!105008)) b!1036815))

(assert (= (and b!1036815 c!105009) b!1036816))

(assert (= (and b!1036815 (not c!105009)) b!1036817))

(assert (= (or b!1036816 b!1036817) bm!43890))

(assert (=> b!1036815 m!956301))

(assert (=> b!1036815 m!956301))

(assert (=> b!1036815 m!956303))

(declare-fun m!957047 () Bool)

(assert (=> bm!43890 m!957047))

(assert (=> bm!43842 d!125053))

(declare-fun d!125055 () Bool)

(assert (=> d!125055 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!457286 () Unit!33894)

(assert (=> d!125055 (= lt!457286 (choose!1706 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586398 () Bool)

(assert (=> d!125055 e!586398))

(declare-fun res!691932 () Bool)

(assert (=> d!125055 (=> (not res!691932) (not e!586398))))

(assert (=> d!125055 (= res!691932 (isStrictlySorted!719 (toList!6895 lt!456890)))))

(assert (=> d!125055 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) lt!457286)))

(declare-fun b!1036818 () Bool)

(assert (=> b!1036818 (= e!586398 (containsKey!564 (toList!6895 lt!456890) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125055 res!691932) b!1036818))

(assert (=> d!125055 m!955693))

(assert (=> d!125055 m!956261))

(assert (=> d!125055 m!956261))

(assert (=> d!125055 m!956263))

(assert (=> d!125055 m!955693))

(declare-fun m!957049 () Bool)

(assert (=> d!125055 m!957049))

(assert (=> d!125055 m!956397))

(assert (=> b!1036818 m!955693))

(assert (=> b!1036818 m!956257))

(assert (=> b!1036251 d!125055))

(assert (=> b!1036251 d!124827))

(assert (=> b!1036251 d!124717))

(declare-fun d!125057 () Bool)

(declare-fun res!691933 () Bool)

(declare-fun e!586399 () Bool)

(assert (=> d!125057 (=> res!691933 e!586399)))

(assert (=> d!125057 (= res!691933 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))) lt!456869)))))

(assert (=> d!125057 (= (containsKey!564 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869) e!586399)))

(declare-fun b!1036819 () Bool)

(declare-fun e!586400 () Bool)

(assert (=> b!1036819 (= e!586399 e!586400)))

(declare-fun res!691934 () Bool)

(assert (=> b!1036819 (=> (not res!691934) (not e!586400))))

(assert (=> b!1036819 (= res!691934 (and (or (not ((_ is Cons!21914) (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))) (bvsle (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))) lt!456869)) ((_ is Cons!21914) (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))) (bvslt (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))) lt!456869)))))

(declare-fun b!1036820 () Bool)

(assert (=> b!1036820 (= e!586400 (containsKey!564 (t!31125 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))) lt!456869))))

(assert (= (and d!125057 (not res!691933)) b!1036819))

(assert (= (and b!1036819 res!691934) b!1036820))

(declare-fun m!957051 () Bool)

(assert (=> b!1036820 m!957051))

(assert (=> d!124609 d!125057))

(declare-fun d!125059 () Bool)

(assert (=> d!125059 (arrayContainsKey!0 (_keys!11459 lt!456791) lt!457069 #b00000000000000000000000000000000)))

(declare-fun lt!457287 () Unit!33894)

(assert (=> d!125059 (= lt!457287 (choose!13 (_keys!11459 lt!456791) lt!457069 #b00000000000000000000000000000000))))

(assert (=> d!125059 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125059 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11459 lt!456791) lt!457069 #b00000000000000000000000000000000) lt!457287)))

(declare-fun bs!30359 () Bool)

(assert (= bs!30359 d!125059))

(assert (=> bs!30359 m!956253))

(declare-fun m!957053 () Bool)

(assert (=> bs!30359 m!957053))

(assert (=> b!1036248 d!125059))

(declare-fun d!125061 () Bool)

(declare-fun res!691935 () Bool)

(declare-fun e!586401 () Bool)

(assert (=> d!125061 (=> res!691935 e!586401)))

(assert (=> d!125061 (= res!691935 (= (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) lt!457069))))

(assert (=> d!125061 (= (arrayContainsKey!0 (_keys!11459 lt!456791) lt!457069 #b00000000000000000000000000000000) e!586401)))

(declare-fun b!1036821 () Bool)

(declare-fun e!586402 () Bool)

(assert (=> b!1036821 (= e!586401 e!586402)))

(declare-fun res!691936 () Bool)

(assert (=> b!1036821 (=> (not res!691936) (not e!586402))))

(assert (=> b!1036821 (= res!691936 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 lt!456791))))))

(declare-fun b!1036822 () Bool)

(assert (=> b!1036822 (= e!586402 (arrayContainsKey!0 (_keys!11459 lt!456791) lt!457069 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125061 (not res!691935)) b!1036821))

(assert (= (and b!1036821 res!691936) b!1036822))

(assert (=> d!125061 m!955841))

(declare-fun m!957055 () Bool)

(assert (=> b!1036822 m!957055))

(assert (=> b!1036248 d!125061))

(declare-fun b!1036823 () Bool)

(declare-fun e!586405 () SeekEntryResult!9746)

(declare-fun e!586403 () SeekEntryResult!9746)

(assert (=> b!1036823 (= e!586405 e!586403)))

(declare-fun lt!457289 () (_ BitVec 64))

(declare-fun lt!457288 () SeekEntryResult!9746)

(assert (=> b!1036823 (= lt!457289 (select (arr!31431 (_keys!11459 lt!456791)) (index!41357 lt!457288)))))

(declare-fun c!105011 () Bool)

(assert (=> b!1036823 (= c!105011 (= lt!457289 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)))))

(declare-fun b!1036824 () Bool)

(assert (=> b!1036824 (= e!586403 (Found!9746 (index!41357 lt!457288)))))

(declare-fun d!125063 () Bool)

(declare-fun lt!457290 () SeekEntryResult!9746)

(assert (=> d!125063 (and (or ((_ is Undefined!9746) lt!457290) (not ((_ is Found!9746) lt!457290)) (and (bvsge (index!41356 lt!457290) #b00000000000000000000000000000000) (bvslt (index!41356 lt!457290) (size!31959 (_keys!11459 lt!456791))))) (or ((_ is Undefined!9746) lt!457290) ((_ is Found!9746) lt!457290) (not ((_ is MissingZero!9746) lt!457290)) (and (bvsge (index!41355 lt!457290) #b00000000000000000000000000000000) (bvslt (index!41355 lt!457290) (size!31959 (_keys!11459 lt!456791))))) (or ((_ is Undefined!9746) lt!457290) ((_ is Found!9746) lt!457290) ((_ is MissingZero!9746) lt!457290) (not ((_ is MissingVacant!9746) lt!457290)) (and (bvsge (index!41358 lt!457290) #b00000000000000000000000000000000) (bvslt (index!41358 lt!457290) (size!31959 (_keys!11459 lt!456791))))) (or ((_ is Undefined!9746) lt!457290) (ite ((_ is Found!9746) lt!457290) (= (select (arr!31431 (_keys!11459 lt!456791)) (index!41356 lt!457290)) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9746) lt!457290) (= (select (arr!31431 (_keys!11459 lt!456791)) (index!41355 lt!457290)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9746) lt!457290) (= (select (arr!31431 (_keys!11459 lt!456791)) (index!41358 lt!457290)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125063 (= lt!457290 e!586405)))

(declare-fun c!105012 () Bool)

(assert (=> d!125063 (= c!105012 (and ((_ is Intermediate!9746) lt!457288) (undefined!10558 lt!457288)))))

(assert (=> d!125063 (= lt!457288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) (mask!30171 lt!456791)) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) (_keys!11459 lt!456791) (mask!30171 lt!456791)))))

(assert (=> d!125063 (validMask!0 (mask!30171 lt!456791))))

(assert (=> d!125063 (= (seekEntryOrOpen!0 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) (_keys!11459 lt!456791) (mask!30171 lt!456791)) lt!457290)))

(declare-fun b!1036825 () Bool)

(declare-fun c!105010 () Bool)

(assert (=> b!1036825 (= c!105010 (= lt!457289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586404 () SeekEntryResult!9746)

(assert (=> b!1036825 (= e!586403 e!586404)))

(declare-fun b!1036826 () Bool)

(assert (=> b!1036826 (= e!586404 (seekKeyOrZeroReturnVacant!0 (x!92472 lt!457288) (index!41357 lt!457288) (index!41357 lt!457288) (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) (_keys!11459 lt!456791) (mask!30171 lt!456791)))))

(declare-fun b!1036827 () Bool)

(assert (=> b!1036827 (= e!586405 Undefined!9746)))

(declare-fun b!1036828 () Bool)

(assert (=> b!1036828 (= e!586404 (MissingZero!9746 (index!41357 lt!457288)))))

(assert (= (and d!125063 c!105012) b!1036827))

(assert (= (and d!125063 (not c!105012)) b!1036823))

(assert (= (and b!1036823 c!105011) b!1036824))

(assert (= (and b!1036823 (not c!105011)) b!1036825))

(assert (= (and b!1036825 c!105010) b!1036828))

(assert (= (and b!1036825 (not c!105010)) b!1036826))

(declare-fun m!957057 () Bool)

(assert (=> b!1036823 m!957057))

(assert (=> d!125063 m!955893))

(declare-fun m!957059 () Bool)

(assert (=> d!125063 m!957059))

(declare-fun m!957061 () Bool)

(assert (=> d!125063 m!957061))

(assert (=> d!125063 m!955841))

(declare-fun m!957063 () Bool)

(assert (=> d!125063 m!957063))

(declare-fun m!957065 () Bool)

(assert (=> d!125063 m!957065))

(declare-fun m!957067 () Bool)

(assert (=> d!125063 m!957067))

(assert (=> d!125063 m!955841))

(assert (=> d!125063 m!957061))

(assert (=> b!1036826 m!955841))

(declare-fun m!957069 () Bool)

(assert (=> b!1036826 m!957069))

(assert (=> b!1036248 d!125063))

(declare-fun b!1036830 () Bool)

(declare-fun e!586406 () Option!640)

(declare-fun e!586407 () Option!640)

(assert (=> b!1036830 (= e!586406 e!586407)))

(declare-fun c!105014 () Bool)

(assert (=> b!1036830 (= c!105014 (and ((_ is Cons!21914) (toList!6895 lt!457033)) (not (= (_1!7876 (h!23116 (toList!6895 lt!457033))) (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))))

(declare-fun c!105013 () Bool)

(declare-fun d!125065 () Bool)

(assert (=> d!125065 (= c!105013 (and ((_ is Cons!21914) (toList!6895 lt!457033)) (= (_1!7876 (h!23116 (toList!6895 lt!457033))) (_1!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(assert (=> d!125065 (= (getValueByKey!589 (toList!6895 lt!457033) (_1!7876 (tuple2!15731 lt!456875 lt!456792))) e!586406)))

(declare-fun b!1036831 () Bool)

(assert (=> b!1036831 (= e!586407 (getValueByKey!589 (t!31125 (toList!6895 lt!457033)) (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun b!1036829 () Bool)

(assert (=> b!1036829 (= e!586406 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!457033)))))))

(declare-fun b!1036832 () Bool)

(assert (=> b!1036832 (= e!586407 None!638)))

(assert (= (and d!125065 c!105013) b!1036829))

(assert (= (and d!125065 (not c!105013)) b!1036830))

(assert (= (and b!1036830 c!105014) b!1036831))

(assert (= (and b!1036830 (not c!105014)) b!1036832))

(declare-fun m!957071 () Bool)

(assert (=> b!1036831 m!957071))

(assert (=> b!1036216 d!125065))

(declare-fun d!125067 () Bool)

(assert (=> d!125067 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456855) lt!456866)) (v!14931 (getValueByKey!589 (toList!6895 lt!456855) lt!456866)))))

(assert (=> d!124611 d!125067))

(declare-fun b!1036834 () Bool)

(declare-fun e!586408 () Option!640)

(declare-fun e!586409 () Option!640)

(assert (=> b!1036834 (= e!586408 e!586409)))

(declare-fun c!105016 () Bool)

(assert (=> b!1036834 (= c!105016 (and ((_ is Cons!21914) (toList!6895 lt!456855)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456855))) lt!456866))))))

(declare-fun d!125069 () Bool)

(declare-fun c!105015 () Bool)

(assert (=> d!125069 (= c!105015 (and ((_ is Cons!21914) (toList!6895 lt!456855)) (= (_1!7876 (h!23116 (toList!6895 lt!456855))) lt!456866)))))

(assert (=> d!125069 (= (getValueByKey!589 (toList!6895 lt!456855) lt!456866) e!586408)))

(declare-fun b!1036835 () Bool)

(assert (=> b!1036835 (= e!586409 (getValueByKey!589 (t!31125 (toList!6895 lt!456855)) lt!456866))))

(declare-fun b!1036833 () Bool)

(assert (=> b!1036833 (= e!586408 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456855)))))))

(declare-fun b!1036836 () Bool)

(assert (=> b!1036836 (= e!586409 None!638)))

(assert (= (and d!125069 c!105015) b!1036833))

(assert (= (and d!125069 (not c!105015)) b!1036834))

(assert (= (and b!1036834 c!105016) b!1036835))

(assert (= (and b!1036834 (not c!105016)) b!1036836))

(declare-fun m!957073 () Bool)

(assert (=> b!1036835 m!957073))

(assert (=> d!124611 d!125069))

(assert (=> b!1036273 d!124581))

(declare-fun d!125071 () Bool)

(assert (=> d!125071 (= (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792))) lt!456894)) (v!14931 (getValueByKey!589 (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792))) lt!456894)))))

(assert (=> d!124677 d!125071))

(declare-fun b!1036838 () Bool)

(declare-fun e!586410 () Option!640)

(declare-fun e!586411 () Option!640)

(assert (=> b!1036838 (= e!586410 e!586411)))

(declare-fun c!105018 () Bool)

(assert (=> b!1036838 (= c!105018 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)))) (not (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792))))) lt!456894))))))

(declare-fun c!105017 () Bool)

(declare-fun d!125073 () Bool)

(assert (=> d!125073 (= c!105017 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792))))) lt!456894)))))

(assert (=> d!125073 (= (getValueByKey!589 (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792))) lt!456894) e!586410)))

(declare-fun b!1036839 () Bool)

(assert (=> b!1036839 (= e!586411 (getValueByKey!589 (t!31125 (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)))) lt!456894))))

(declare-fun b!1036837 () Bool)

(assert (=> b!1036837 (= e!586410 (Some!639 (_2!7876 (h!23116 (toList!6895 (+!3105 lt!456880 (tuple2!15731 lt!456875 lt!456792)))))))))

(declare-fun b!1036840 () Bool)

(assert (=> b!1036840 (= e!586411 None!638)))

(assert (= (and d!125073 c!105017) b!1036837))

(assert (= (and d!125073 (not c!105017)) b!1036838))

(assert (= (and b!1036838 c!105018) b!1036839))

(assert (= (and b!1036838 (not c!105018)) b!1036840))

(declare-fun m!957075 () Bool)

(assert (=> b!1036839 m!957075))

(assert (=> d!124677 d!125073))

(declare-fun d!125075 () Bool)

(assert (=> d!125075 (= (apply!907 lt!456924 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16464 (getValueByKey!589 (toList!6895 lt!456924) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30360 () Bool)

(assert (= bs!30360 d!125075))

(assert (=> bs!30360 m!956389))

(assert (=> bs!30360 m!956389))

(declare-fun m!957077 () Bool)

(assert (=> bs!30360 m!957077))

(assert (=> b!1036066 d!125075))

(declare-fun d!125077 () Bool)

(declare-fun e!586412 () Bool)

(assert (=> d!125077 e!586412))

(declare-fun res!691937 () Bool)

(assert (=> d!125077 (=> res!691937 e!586412)))

(declare-fun lt!457292 () Bool)

(assert (=> d!125077 (= res!691937 (not lt!457292))))

(declare-fun lt!457294 () Bool)

(assert (=> d!125077 (= lt!457292 lt!457294)))

(declare-fun lt!457291 () Unit!33894)

(declare-fun e!586413 () Unit!33894)

(assert (=> d!125077 (= lt!457291 e!586413)))

(declare-fun c!105019 () Bool)

(assert (=> d!125077 (= c!105019 lt!457294)))

(assert (=> d!125077 (= lt!457294 (containsKey!564 (toList!6895 lt!456993) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(assert (=> d!125077 (= (contains!6021 lt!456993 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!457292)))

(declare-fun b!1036841 () Bool)

(declare-fun lt!457293 () Unit!33894)

(assert (=> b!1036841 (= e!586413 lt!457293)))

(assert (=> b!1036841 (= lt!457293 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456993) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(assert (=> b!1036841 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456993) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036842 () Bool)

(declare-fun Unit!33935 () Unit!33894)

(assert (=> b!1036842 (= e!586413 Unit!33935)))

(declare-fun b!1036843 () Bool)

(assert (=> b!1036843 (= e!586412 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456993) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(assert (= (and d!125077 c!105019) b!1036841))

(assert (= (and d!125077 (not c!105019)) b!1036842))

(assert (= (and d!125077 (not res!691937)) b!1036843))

(declare-fun m!957079 () Bool)

(assert (=> d!125077 m!957079))

(declare-fun m!957081 () Bool)

(assert (=> b!1036841 m!957081))

(assert (=> b!1036841 m!956027))

(assert (=> b!1036841 m!956027))

(declare-fun m!957083 () Bool)

(assert (=> b!1036841 m!957083))

(assert (=> b!1036843 m!956027))

(assert (=> b!1036843 m!956027))

(assert (=> b!1036843 m!957083))

(assert (=> d!124627 d!125077))

(declare-fun b!1036845 () Bool)

(declare-fun e!586414 () Option!640)

(declare-fun e!586415 () Option!640)

(assert (=> b!1036845 (= e!586414 e!586415)))

(declare-fun c!105021 () Bool)

(assert (=> b!1036845 (= c!105021 (and ((_ is Cons!21914) lt!456992) (not (= (_1!7876 (h!23116 lt!456992)) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!105020 () Bool)

(declare-fun d!125079 () Bool)

(assert (=> d!125079 (= c!105020 (and ((_ is Cons!21914) lt!456992) (= (_1!7876 (h!23116 lt!456992)) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!125079 (= (getValueByKey!589 lt!456992 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) e!586414)))

(declare-fun b!1036846 () Bool)

(assert (=> b!1036846 (= e!586415 (getValueByKey!589 (t!31125 lt!456992) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036844 () Bool)

(assert (=> b!1036844 (= e!586414 (Some!639 (_2!7876 (h!23116 lt!456992))))))

(declare-fun b!1036847 () Bool)

(assert (=> b!1036847 (= e!586415 None!638)))

(assert (= (and d!125079 c!105020) b!1036844))

(assert (= (and d!125079 (not c!105020)) b!1036845))

(assert (= (and b!1036845 c!105021) b!1036846))

(assert (= (and b!1036845 (not c!105021)) b!1036847))

(declare-fun m!957085 () Bool)

(assert (=> b!1036846 m!957085))

(assert (=> d!124627 d!125079))

(declare-fun d!125081 () Bool)

(assert (=> d!125081 (= (getValueByKey!589 lt!456992 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) (Some!639 (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun lt!457295 () Unit!33894)

(assert (=> d!125081 (= lt!457295 (choose!1705 lt!456992 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun e!586416 () Bool)

(assert (=> d!125081 e!586416))

(declare-fun res!691938 () Bool)

(assert (=> d!125081 (=> (not res!691938) (not e!586416))))

(assert (=> d!125081 (= res!691938 (isStrictlySorted!719 lt!456992))))

(assert (=> d!125081 (= (lemmaContainsTupThenGetReturnValue!280 lt!456992 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!457295)))

(declare-fun b!1036848 () Bool)

(declare-fun res!691939 () Bool)

(assert (=> b!1036848 (=> (not res!691939) (not e!586416))))

(assert (=> b!1036848 (= res!691939 (containsKey!564 lt!456992 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036849 () Bool)

(assert (=> b!1036849 (= e!586416 (contains!6022 lt!456992 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(assert (= (and d!125081 res!691938) b!1036848))

(assert (= (and b!1036848 res!691939) b!1036849))

(assert (=> d!125081 m!956021))

(declare-fun m!957087 () Bool)

(assert (=> d!125081 m!957087))

(declare-fun m!957089 () Bool)

(assert (=> d!125081 m!957089))

(declare-fun m!957091 () Bool)

(assert (=> b!1036848 m!957091))

(declare-fun m!957093 () Bool)

(assert (=> b!1036849 m!957093))

(assert (=> d!124627 d!125081))

(declare-fun e!586420 () List!21918)

(declare-fun b!1036850 () Bool)

(assert (=> b!1036850 (= e!586420 (insertStrictlySorted!373 (t!31125 (toList!6895 lt!456860)) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036851 () Bool)

(declare-fun e!586419 () List!21918)

(declare-fun call!43896 () List!21918)

(assert (=> b!1036851 (= e!586419 call!43896)))

(declare-fun bm!43891 () Bool)

(declare-fun call!43894 () List!21918)

(assert (=> bm!43891 (= call!43896 call!43894)))

(declare-fun b!1036852 () Bool)

(declare-fun e!586421 () List!21918)

(assert (=> b!1036852 (= e!586421 call!43894)))

(declare-fun b!1036853 () Bool)

(declare-fun e!586417 () List!21918)

(declare-fun call!43895 () List!21918)

(assert (=> b!1036853 (= e!586417 call!43895)))

(declare-fun b!1036854 () Bool)

(declare-fun res!691941 () Bool)

(declare-fun e!586418 () Bool)

(assert (=> b!1036854 (=> (not res!691941) (not e!586418))))

(declare-fun lt!457296 () List!21918)

(assert (=> b!1036854 (= res!691941 (containsKey!564 lt!457296 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun c!105022 () Bool)

(declare-fun b!1036856 () Bool)

(assert (=> b!1036856 (= c!105022 (and ((_ is Cons!21914) (toList!6895 lt!456860)) (bvsgt (_1!7876 (h!23116 (toList!6895 lt!456860))) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(assert (=> b!1036856 (= e!586419 e!586417)))

(declare-fun b!1036857 () Bool)

(assert (=> b!1036857 (= e!586417 call!43895)))

(declare-fun b!1036858 () Bool)

(assert (=> b!1036858 (= e!586418 (contains!6022 lt!457296 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(declare-fun c!105023 () Bool)

(declare-fun bm!43892 () Bool)

(assert (=> bm!43892 (= call!43894 ($colon$colon!603 e!586420 (ite c!105023 (h!23116 (toList!6895 lt!456860)) (tuple2!15731 (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!105024 () Bool)

(assert (=> bm!43892 (= c!105024 c!105023)))

(declare-fun b!1036859 () Bool)

(assert (=> b!1036859 (= e!586421 e!586419)))

(declare-fun c!105025 () Bool)

(assert (=> b!1036859 (= c!105025 (and ((_ is Cons!21914) (toList!6895 lt!456860)) (= (_1!7876 (h!23116 (toList!6895 lt!456860))) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(declare-fun bm!43893 () Bool)

(assert (=> bm!43893 (= call!43895 call!43896)))

(declare-fun b!1036855 () Bool)

(assert (=> b!1036855 (= e!586420 (ite c!105025 (t!31125 (toList!6895 lt!456860)) (ite c!105022 (Cons!21914 (h!23116 (toList!6895 lt!456860)) (t!31125 (toList!6895 lt!456860))) Nil!21915)))))

(declare-fun d!125083 () Bool)

(assert (=> d!125083 e!586418))

(declare-fun res!691940 () Bool)

(assert (=> d!125083 (=> (not res!691940) (not e!586418))))

(assert (=> d!125083 (= res!691940 (isStrictlySorted!719 lt!457296))))

(assert (=> d!125083 (= lt!457296 e!586421)))

(assert (=> d!125083 (= c!105023 (and ((_ is Cons!21914) (toList!6895 lt!456860)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456860))) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!125083 (isStrictlySorted!719 (toList!6895 lt!456860))))

(assert (=> d!125083 (= (insertStrictlySorted!373 (toList!6895 lt!456860) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))) (_2!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!457296)))

(assert (= (and d!125083 c!105023) b!1036852))

(assert (= (and d!125083 (not c!105023)) b!1036859))

(assert (= (and b!1036859 c!105025) b!1036851))

(assert (= (and b!1036859 (not c!105025)) b!1036856))

(assert (= (and b!1036856 c!105022) b!1036857))

(assert (= (and b!1036856 (not c!105022)) b!1036853))

(assert (= (or b!1036857 b!1036853) bm!43893))

(assert (= (or b!1036851 bm!43893) bm!43891))

(assert (= (or b!1036852 bm!43891) bm!43892))

(assert (= (and bm!43892 c!105024) b!1036850))

(assert (= (and bm!43892 (not c!105024)) b!1036855))

(assert (= (and d!125083 res!691940) b!1036854))

(assert (= (and b!1036854 res!691941) b!1036858))

(declare-fun m!957095 () Bool)

(assert (=> b!1036858 m!957095))

(declare-fun m!957097 () Bool)

(assert (=> b!1036850 m!957097))

(declare-fun m!957099 () Bool)

(assert (=> b!1036854 m!957099))

(declare-fun m!957101 () Bool)

(assert (=> bm!43892 m!957101))

(declare-fun m!957103 () Bool)

(assert (=> d!125083 m!957103))

(declare-fun m!957105 () Bool)

(assert (=> d!125083 m!957105))

(assert (=> d!124627 d!125083))

(declare-fun d!125085 () Bool)

(declare-fun e!586422 () Bool)

(assert (=> d!125085 e!586422))

(declare-fun res!691942 () Bool)

(assert (=> d!125085 (=> res!691942 e!586422)))

(declare-fun lt!457298 () Bool)

(assert (=> d!125085 (= res!691942 (not lt!457298))))

(declare-fun lt!457300 () Bool)

(assert (=> d!125085 (= lt!457298 lt!457300)))

(declare-fun lt!457297 () Unit!33894)

(declare-fun e!586423 () Unit!33894)

(assert (=> d!125085 (= lt!457297 e!586423)))

(declare-fun c!105026 () Bool)

(assert (=> d!125085 (= c!105026 lt!457300)))

(assert (=> d!125085 (= lt!457300 (containsKey!564 (toList!6895 lt!456960) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125085 (= (contains!6021 lt!456960 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457298)))

(declare-fun b!1036860 () Bool)

(declare-fun lt!457299 () Unit!33894)

(assert (=> b!1036860 (= e!586423 lt!457299)))

(assert (=> b!1036860 (= lt!457299 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456960) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036860 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456960) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036861 () Bool)

(declare-fun Unit!33936 () Unit!33894)

(assert (=> b!1036861 (= e!586423 Unit!33936)))

(declare-fun b!1036862 () Bool)

(assert (=> b!1036862 (= e!586422 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456960) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125085 c!105026) b!1036860))

(assert (= (and d!125085 (not c!105026)) b!1036861))

(assert (= (and d!125085 (not res!691942)) b!1036862))

(declare-fun m!957107 () Bool)

(assert (=> d!125085 m!957107))

(declare-fun m!957109 () Bool)

(assert (=> b!1036860 m!957109))

(declare-fun m!957111 () Bool)

(assert (=> b!1036860 m!957111))

(assert (=> b!1036860 m!957111))

(declare-fun m!957113 () Bool)

(assert (=> b!1036860 m!957113))

(assert (=> b!1036862 m!957111))

(assert (=> b!1036862 m!957111))

(assert (=> b!1036862 m!957113))

(assert (=> d!124599 d!125085))

(assert (=> d!124599 d!124593))

(declare-fun d!125087 () Bool)

(declare-fun e!586424 () Bool)

(assert (=> d!125087 e!586424))

(declare-fun res!691943 () Bool)

(assert (=> d!125087 (=> res!691943 e!586424)))

(declare-fun lt!457302 () Bool)

(assert (=> d!125087 (= res!691943 (not lt!457302))))

(declare-fun lt!457304 () Bool)

(assert (=> d!125087 (= lt!457302 lt!457304)))

(declare-fun lt!457301 () Unit!33894)

(declare-fun e!586425 () Unit!33894)

(assert (=> d!125087 (= lt!457301 e!586425)))

(declare-fun c!105027 () Bool)

(assert (=> d!125087 (= c!105027 lt!457304)))

(assert (=> d!125087 (= lt!457304 (containsKey!564 (toList!6895 lt!456950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125087 (= (contains!6021 lt!456950 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457302)))

(declare-fun b!1036863 () Bool)

(declare-fun lt!457303 () Unit!33894)

(assert (=> b!1036863 (= e!586425 lt!457303)))

(assert (=> b!1036863 (= lt!457303 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036863 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036864 () Bool)

(declare-fun Unit!33937 () Unit!33894)

(assert (=> b!1036864 (= e!586425 Unit!33937)))

(declare-fun b!1036865 () Bool)

(assert (=> b!1036865 (= e!586424 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125087 c!105027) b!1036863))

(assert (= (and d!125087 (not c!105027)) b!1036864))

(assert (= (and d!125087 (not res!691943)) b!1036865))

(declare-fun m!957115 () Bool)

(assert (=> d!125087 m!957115))

(declare-fun m!957117 () Bool)

(assert (=> b!1036863 m!957117))

(declare-fun m!957119 () Bool)

(assert (=> b!1036863 m!957119))

(assert (=> b!1036863 m!957119))

(declare-fun m!957121 () Bool)

(assert (=> b!1036863 m!957121))

(assert (=> b!1036865 m!957119))

(assert (=> b!1036865 m!957119))

(assert (=> b!1036865 m!957121))

(assert (=> b!1036107 d!125087))

(declare-fun d!125089 () Bool)

(assert (=> d!125089 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!457305 () Unit!33894)

(assert (=> d!125089 (= lt!457305 (choose!1706 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586426 () Bool)

(assert (=> d!125089 e!586426))

(declare-fun res!691944 () Bool)

(assert (=> d!125089 (=> (not res!691944) (not e!586426))))

(assert (=> d!125089 (= res!691944 (isStrictlySorted!719 (toList!6895 lt!456864)))))

(assert (=> d!125089 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)) lt!457305)))

(declare-fun b!1036866 () Bool)

(assert (=> b!1036866 (= e!586426 (containsKey!564 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125089 res!691944) b!1036866))

(assert (=> d!125089 m!955693))

(assert (=> d!125089 m!955819))

(assert (=> d!125089 m!955819))

(assert (=> d!125089 m!956103))

(assert (=> d!125089 m!955693))

(declare-fun m!957123 () Bool)

(assert (=> d!125089 m!957123))

(assert (=> d!125089 m!956603))

(assert (=> b!1036866 m!955693))

(assert (=> b!1036866 m!956099))

(assert (=> b!1036197 d!125089))

(assert (=> b!1036197 d!124853))

(assert (=> b!1036197 d!124855))

(assert (=> b!1036117 d!124979))

(assert (=> b!1036071 d!124809))

(declare-fun b!1036868 () Bool)

(declare-fun e!586427 () Option!640)

(declare-fun e!586428 () Option!640)

(assert (=> b!1036868 (= e!586427 e!586428)))

(declare-fun c!105029 () Bool)

(assert (=> b!1036868 (= c!105029 (and ((_ is Cons!21914) (toList!6895 lt!456993)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456993))) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!105028 () Bool)

(declare-fun d!125091 () Bool)

(assert (=> d!125091 (= c!105028 (and ((_ is Cons!21914) (toList!6895 lt!456993)) (= (_1!7876 (h!23116 (toList!6895 lt!456993))) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!125091 (= (getValueByKey!589 (toList!6895 lt!456993) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) e!586427)))

(declare-fun b!1036869 () Bool)

(assert (=> b!1036869 (= e!586428 (getValueByKey!589 (t!31125 (toList!6895 lt!456993)) (_1!7876 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036867 () Bool)

(assert (=> b!1036867 (= e!586427 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456993)))))))

(declare-fun b!1036870 () Bool)

(assert (=> b!1036870 (= e!586428 None!638)))

(assert (= (and d!125091 c!105028) b!1036867))

(assert (= (and d!125091 (not c!105028)) b!1036868))

(assert (= (and b!1036868 c!105029) b!1036869))

(assert (= (and b!1036868 (not c!105029)) b!1036870))

(declare-fun m!957125 () Bool)

(assert (=> b!1036869 m!957125))

(assert (=> b!1036141 d!125091))

(declare-fun d!125093 () Bool)

(declare-fun res!691945 () Bool)

(declare-fun e!586429 () Bool)

(assert (=> d!125093 (=> res!691945 e!586429)))

(assert (=> d!125093 (= res!691945 (and ((_ is Cons!21914) (toList!6895 lt!456890)) (= (_1!7876 (h!23116 (toList!6895 lt!456890))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125093 (= (containsKey!564 (toList!6895 lt!456890) #b0000000000000000000000000000000000000000000000000000000000000000) e!586429)))

(declare-fun b!1036871 () Bool)

(declare-fun e!586430 () Bool)

(assert (=> b!1036871 (= e!586429 e!586430)))

(declare-fun res!691946 () Bool)

(assert (=> b!1036871 (=> (not res!691946) (not e!586430))))

(assert (=> b!1036871 (= res!691946 (and (or (not ((_ is Cons!21914) (toList!6895 lt!456890))) (bvsle (_1!7876 (h!23116 (toList!6895 lt!456890))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21914) (toList!6895 lt!456890)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456890))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036872 () Bool)

(assert (=> b!1036872 (= e!586430 (containsKey!564 (t!31125 (toList!6895 lt!456890)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125093 (not res!691945)) b!1036871))

(assert (= (and b!1036871 res!691946) b!1036872))

(declare-fun m!957127 () Bool)

(assert (=> b!1036872 m!957127))

(assert (=> d!124587 d!125093))

(assert (=> b!1036230 d!124881))

(assert (=> b!1036230 d!124839))

(assert (=> d!124673 d!124655))

(assert (=> d!124673 d!124657))

(declare-fun d!125095 () Bool)

(declare-fun e!586431 () Bool)

(assert (=> d!125095 e!586431))

(declare-fun res!691947 () Bool)

(assert (=> d!125095 (=> res!691947 e!586431)))

(declare-fun lt!457307 () Bool)

(assert (=> d!125095 (= res!691947 (not lt!457307))))

(declare-fun lt!457309 () Bool)

(assert (=> d!125095 (= lt!457307 lt!457309)))

(declare-fun lt!457306 () Unit!33894)

(declare-fun e!586432 () Unit!33894)

(assert (=> d!125095 (= lt!457306 e!586432)))

(declare-fun c!105030 () Bool)

(assert (=> d!125095 (= c!105030 lt!457309)))

(assert (=> d!125095 (= lt!457309 (containsKey!564 (toList!6895 lt!456881) lt!456892))))

(assert (=> d!125095 (= (contains!6021 lt!456881 lt!456892) lt!457307)))

(declare-fun b!1036873 () Bool)

(declare-fun lt!457308 () Unit!33894)

(assert (=> b!1036873 (= e!586432 lt!457308)))

(assert (=> b!1036873 (= lt!457308 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456881) lt!456892))))

(assert (=> b!1036873 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456881) lt!456892))))

(declare-fun b!1036874 () Bool)

(declare-fun Unit!33938 () Unit!33894)

(assert (=> b!1036874 (= e!586432 Unit!33938)))

(declare-fun b!1036875 () Bool)

(assert (=> b!1036875 (= e!586431 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456881) lt!456892)))))

(assert (= (and d!125095 c!105030) b!1036873))

(assert (= (and d!125095 (not c!105030)) b!1036874))

(assert (= (and d!125095 (not res!691947)) b!1036875))

(declare-fun m!957129 () Bool)

(assert (=> d!125095 m!957129))

(declare-fun m!957131 () Bool)

(assert (=> b!1036873 m!957131))

(assert (=> b!1036873 m!956129))

(assert (=> b!1036873 m!956129))

(declare-fun m!957133 () Bool)

(assert (=> b!1036873 m!957133))

(assert (=> b!1036875 m!956129))

(assert (=> b!1036875 m!956129))

(assert (=> b!1036875 m!957133))

(assert (=> d!124673 d!125095))

(assert (=> d!124673 d!124681))

(declare-fun d!125097 () Bool)

(assert (=> d!125097 (= (apply!907 (+!3105 lt!456881 (tuple2!15731 lt!456878 lt!456792)) lt!456892) (apply!907 lt!456881 lt!456892))))

(assert (=> d!125097 true))

(declare-fun _$34!1177 () Unit!33894)

(assert (=> d!125097 (= (choose!1703 lt!456881 lt!456878 lt!456792 lt!456892) _$34!1177)))

(declare-fun bs!30361 () Bool)

(assert (= bs!30361 d!125097))

(assert (=> bs!30361 m!955787))

(assert (=> bs!30361 m!955787))

(assert (=> bs!30361 m!955791))

(assert (=> bs!30361 m!955793))

(assert (=> d!124673 d!125097))

(declare-fun d!125099 () Bool)

(declare-fun e!586433 () Bool)

(assert (=> d!125099 e!586433))

(declare-fun res!691948 () Bool)

(assert (=> d!125099 (=> res!691948 e!586433)))

(declare-fun lt!457311 () Bool)

(assert (=> d!125099 (= res!691948 (not lt!457311))))

(declare-fun lt!457313 () Bool)

(assert (=> d!125099 (= lt!457311 lt!457313)))

(declare-fun lt!457310 () Unit!33894)

(declare-fun e!586434 () Unit!33894)

(assert (=> d!125099 (= lt!457310 e!586434)))

(declare-fun c!105031 () Bool)

(assert (=> d!125099 (= c!105031 lt!457313)))

(assert (=> d!125099 (= lt!457313 (containsKey!564 (toList!6895 lt!457033) (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))

(assert (=> d!125099 (= (contains!6021 lt!457033 (_1!7876 (tuple2!15731 lt!456875 lt!456792))) lt!457311)))

(declare-fun b!1036876 () Bool)

(declare-fun lt!457312 () Unit!33894)

(assert (=> b!1036876 (= e!586434 lt!457312)))

(assert (=> b!1036876 (= lt!457312 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!457033) (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))

(assert (=> b!1036876 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457033) (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun b!1036877 () Bool)

(declare-fun Unit!33939 () Unit!33894)

(assert (=> b!1036877 (= e!586434 Unit!33939)))

(declare-fun b!1036878 () Bool)

(assert (=> b!1036878 (= e!586433 (isDefined!436 (getValueByKey!589 (toList!6895 lt!457033) (_1!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(assert (= (and d!125099 c!105031) b!1036876))

(assert (= (and d!125099 (not c!105031)) b!1036877))

(assert (= (and d!125099 (not res!691948)) b!1036878))

(declare-fun m!957135 () Bool)

(assert (=> d!125099 m!957135))

(declare-fun m!957137 () Bool)

(assert (=> b!1036876 m!957137))

(assert (=> b!1036876 m!956157))

(assert (=> b!1036876 m!956157))

(declare-fun m!957139 () Bool)

(assert (=> b!1036876 m!957139))

(assert (=> b!1036878 m!956157))

(assert (=> b!1036878 m!956157))

(assert (=> b!1036878 m!957139))

(assert (=> d!124667 d!125099))

(declare-fun b!1036880 () Bool)

(declare-fun e!586435 () Option!640)

(declare-fun e!586436 () Option!640)

(assert (=> b!1036880 (= e!586435 e!586436)))

(declare-fun c!105033 () Bool)

(assert (=> b!1036880 (= c!105033 (and ((_ is Cons!21914) lt!457032) (not (= (_1!7876 (h!23116 lt!457032)) (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))))

(declare-fun d!125101 () Bool)

(declare-fun c!105032 () Bool)

(assert (=> d!125101 (= c!105032 (and ((_ is Cons!21914) lt!457032) (= (_1!7876 (h!23116 lt!457032)) (_1!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(assert (=> d!125101 (= (getValueByKey!589 lt!457032 (_1!7876 (tuple2!15731 lt!456875 lt!456792))) e!586435)))

(declare-fun b!1036881 () Bool)

(assert (=> b!1036881 (= e!586436 (getValueByKey!589 (t!31125 lt!457032) (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun b!1036879 () Bool)

(assert (=> b!1036879 (= e!586435 (Some!639 (_2!7876 (h!23116 lt!457032))))))

(declare-fun b!1036882 () Bool)

(assert (=> b!1036882 (= e!586436 None!638)))

(assert (= (and d!125101 c!105032) b!1036879))

(assert (= (and d!125101 (not c!105032)) b!1036880))

(assert (= (and b!1036880 c!105033) b!1036881))

(assert (= (and b!1036880 (not c!105033)) b!1036882))

(declare-fun m!957141 () Bool)

(assert (=> b!1036881 m!957141))

(assert (=> d!124667 d!125101))

(declare-fun d!125103 () Bool)

(assert (=> d!125103 (= (getValueByKey!589 lt!457032 (_1!7876 (tuple2!15731 lt!456875 lt!456792))) (Some!639 (_2!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun lt!457314 () Unit!33894)

(assert (=> d!125103 (= lt!457314 (choose!1705 lt!457032 (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun e!586437 () Bool)

(assert (=> d!125103 e!586437))

(declare-fun res!691949 () Bool)

(assert (=> d!125103 (=> (not res!691949) (not e!586437))))

(assert (=> d!125103 (= res!691949 (isStrictlySorted!719 lt!457032))))

(assert (=> d!125103 (= (lemmaContainsTupThenGetReturnValue!280 lt!457032 (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792))) lt!457314)))

(declare-fun b!1036883 () Bool)

(declare-fun res!691950 () Bool)

(assert (=> b!1036883 (=> (not res!691950) (not e!586437))))

(assert (=> b!1036883 (= res!691950 (containsKey!564 lt!457032 (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun b!1036884 () Bool)

(assert (=> b!1036884 (= e!586437 (contains!6022 lt!457032 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(assert (= (and d!125103 res!691949) b!1036883))

(assert (= (and b!1036883 res!691950) b!1036884))

(assert (=> d!125103 m!956151))

(declare-fun m!957143 () Bool)

(assert (=> d!125103 m!957143))

(declare-fun m!957145 () Bool)

(assert (=> d!125103 m!957145))

(declare-fun m!957147 () Bool)

(assert (=> b!1036883 m!957147))

(declare-fun m!957149 () Bool)

(assert (=> b!1036884 m!957149))

(assert (=> d!124667 d!125103))

(declare-fun b!1036885 () Bool)

(declare-fun e!586441 () List!21918)

(assert (=> b!1036885 (= e!586441 (insertStrictlySorted!373 (t!31125 (toList!6895 lt!456880)) (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun b!1036886 () Bool)

(declare-fun e!586440 () List!21918)

(declare-fun call!43899 () List!21918)

(assert (=> b!1036886 (= e!586440 call!43899)))

(declare-fun bm!43894 () Bool)

(declare-fun call!43897 () List!21918)

(assert (=> bm!43894 (= call!43899 call!43897)))

(declare-fun b!1036887 () Bool)

(declare-fun e!586442 () List!21918)

(assert (=> b!1036887 (= e!586442 call!43897)))

(declare-fun b!1036888 () Bool)

(declare-fun e!586438 () List!21918)

(declare-fun call!43898 () List!21918)

(assert (=> b!1036888 (= e!586438 call!43898)))

(declare-fun b!1036889 () Bool)

(declare-fun res!691952 () Bool)

(declare-fun e!586439 () Bool)

(assert (=> b!1036889 (=> (not res!691952) (not e!586439))))

(declare-fun lt!457315 () List!21918)

(assert (=> b!1036889 (= res!691952 (containsKey!564 lt!457315 (_1!7876 (tuple2!15731 lt!456875 lt!456792))))))

(declare-fun b!1036891 () Bool)

(declare-fun c!105034 () Bool)

(assert (=> b!1036891 (= c!105034 (and ((_ is Cons!21914) (toList!6895 lt!456880)) (bvsgt (_1!7876 (h!23116 (toList!6895 lt!456880))) (_1!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(assert (=> b!1036891 (= e!586440 e!586438)))

(declare-fun b!1036892 () Bool)

(assert (=> b!1036892 (= e!586438 call!43898)))

(declare-fun b!1036893 () Bool)

(assert (=> b!1036893 (= e!586439 (contains!6022 lt!457315 (tuple2!15731 (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(declare-fun bm!43895 () Bool)

(declare-fun c!105035 () Bool)

(assert (=> bm!43895 (= call!43897 ($colon$colon!603 e!586441 (ite c!105035 (h!23116 (toList!6895 lt!456880)) (tuple2!15731 (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792))))))))

(declare-fun c!105036 () Bool)

(assert (=> bm!43895 (= c!105036 c!105035)))

(declare-fun b!1036894 () Bool)

(assert (=> b!1036894 (= e!586442 e!586440)))

(declare-fun c!105037 () Bool)

(assert (=> b!1036894 (= c!105037 (and ((_ is Cons!21914) (toList!6895 lt!456880)) (= (_1!7876 (h!23116 (toList!6895 lt!456880))) (_1!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(declare-fun bm!43896 () Bool)

(assert (=> bm!43896 (= call!43898 call!43899)))

(declare-fun b!1036890 () Bool)

(assert (=> b!1036890 (= e!586441 (ite c!105037 (t!31125 (toList!6895 lt!456880)) (ite c!105034 (Cons!21914 (h!23116 (toList!6895 lt!456880)) (t!31125 (toList!6895 lt!456880))) Nil!21915)))))

(declare-fun d!125105 () Bool)

(assert (=> d!125105 e!586439))

(declare-fun res!691951 () Bool)

(assert (=> d!125105 (=> (not res!691951) (not e!586439))))

(assert (=> d!125105 (= res!691951 (isStrictlySorted!719 lt!457315))))

(assert (=> d!125105 (= lt!457315 e!586442)))

(assert (=> d!125105 (= c!105035 (and ((_ is Cons!21914) (toList!6895 lt!456880)) (bvslt (_1!7876 (h!23116 (toList!6895 lt!456880))) (_1!7876 (tuple2!15731 lt!456875 lt!456792)))))))

(assert (=> d!125105 (isStrictlySorted!719 (toList!6895 lt!456880))))

(assert (=> d!125105 (= (insertStrictlySorted!373 (toList!6895 lt!456880) (_1!7876 (tuple2!15731 lt!456875 lt!456792)) (_2!7876 (tuple2!15731 lt!456875 lt!456792))) lt!457315)))

(assert (= (and d!125105 c!105035) b!1036887))

(assert (= (and d!125105 (not c!105035)) b!1036894))

(assert (= (and b!1036894 c!105037) b!1036886))

(assert (= (and b!1036894 (not c!105037)) b!1036891))

(assert (= (and b!1036891 c!105034) b!1036892))

(assert (= (and b!1036891 (not c!105034)) b!1036888))

(assert (= (or b!1036892 b!1036888) bm!43896))

(assert (= (or b!1036886 bm!43896) bm!43894))

(assert (= (or b!1036887 bm!43894) bm!43895))

(assert (= (and bm!43895 c!105036) b!1036885))

(assert (= (and bm!43895 (not c!105036)) b!1036890))

(assert (= (and d!125105 res!691951) b!1036889))

(assert (= (and b!1036889 res!691952) b!1036893))

(declare-fun m!957151 () Bool)

(assert (=> b!1036893 m!957151))

(declare-fun m!957153 () Bool)

(assert (=> b!1036885 m!957153))

(declare-fun m!957155 () Bool)

(assert (=> b!1036889 m!957155))

(declare-fun m!957157 () Bool)

(assert (=> bm!43895 m!957157))

(declare-fun m!957159 () Bool)

(assert (=> d!125105 m!957159))

(declare-fun m!957161 () Bool)

(assert (=> d!125105 m!957161))

(assert (=> d!124667 d!125105))

(declare-fun d!125107 () Bool)

(declare-fun e!586443 () Bool)

(assert (=> d!125107 e!586443))

(declare-fun res!691953 () Bool)

(assert (=> d!125107 (=> res!691953 e!586443)))

(declare-fun lt!457317 () Bool)

(assert (=> d!125107 (= res!691953 (not lt!457317))))

(declare-fun lt!457319 () Bool)

(assert (=> d!125107 (= lt!457317 lt!457319)))

(declare-fun lt!457316 () Unit!33894)

(declare-fun e!586444 () Unit!33894)

(assert (=> d!125107 (= lt!457316 e!586444)))

(declare-fun c!105038 () Bool)

(assert (=> d!125107 (= c!105038 lt!457319)))

(assert (=> d!125107 (= lt!457319 (containsKey!564 (toList!6895 (+!3105 lt!456955 (tuple2!15731 lt!456959 lt!456957))) lt!456956))))

(assert (=> d!125107 (= (contains!6021 (+!3105 lt!456955 (tuple2!15731 lt!456959 lt!456957)) lt!456956) lt!457317)))

(declare-fun b!1036895 () Bool)

(declare-fun lt!457318 () Unit!33894)

(assert (=> b!1036895 (= e!586444 lt!457318)))

(assert (=> b!1036895 (= lt!457318 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 (+!3105 lt!456955 (tuple2!15731 lt!456959 lt!456957))) lt!456956))))

(assert (=> b!1036895 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456955 (tuple2!15731 lt!456959 lt!456957))) lt!456956))))

(declare-fun b!1036896 () Bool)

(declare-fun Unit!33940 () Unit!33894)

(assert (=> b!1036896 (= e!586444 Unit!33940)))

(declare-fun b!1036897 () Bool)

(assert (=> b!1036897 (= e!586443 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456955 (tuple2!15731 lt!456959 lt!456957))) lt!456956)))))

(assert (= (and d!125107 c!105038) b!1036895))

(assert (= (and d!125107 (not c!105038)) b!1036896))

(assert (= (and d!125107 (not res!691953)) b!1036897))

(declare-fun m!957163 () Bool)

(assert (=> d!125107 m!957163))

(declare-fun m!957165 () Bool)

(assert (=> b!1036895 m!957165))

(declare-fun m!957167 () Bool)

(assert (=> b!1036895 m!957167))

(assert (=> b!1036895 m!957167))

(declare-fun m!957169 () Bool)

(assert (=> b!1036895 m!957169))

(assert (=> b!1036897 m!957167))

(assert (=> b!1036897 m!957167))

(assert (=> b!1036897 m!957169))

(assert (=> b!1036122 d!125107))

(assert (=> b!1036122 d!124585))

(declare-fun d!125109 () Bool)

(declare-fun e!586445 () Bool)

(assert (=> d!125109 e!586445))

(declare-fun res!691954 () Bool)

(assert (=> d!125109 (=> (not res!691954) (not e!586445))))

(declare-fun lt!457322 () ListLongMap!13759)

(assert (=> d!125109 (= res!691954 (contains!6021 lt!457322 (_1!7876 (tuple2!15731 lt!456959 lt!456957))))))

(declare-fun lt!457321 () List!21918)

(assert (=> d!125109 (= lt!457322 (ListLongMap!13760 lt!457321))))

(declare-fun lt!457320 () Unit!33894)

(declare-fun lt!457323 () Unit!33894)

(assert (=> d!125109 (= lt!457320 lt!457323)))

(assert (=> d!125109 (= (getValueByKey!589 lt!457321 (_1!7876 (tuple2!15731 lt!456959 lt!456957))) (Some!639 (_2!7876 (tuple2!15731 lt!456959 lt!456957))))))

(assert (=> d!125109 (= lt!457323 (lemmaContainsTupThenGetReturnValue!280 lt!457321 (_1!7876 (tuple2!15731 lt!456959 lt!456957)) (_2!7876 (tuple2!15731 lt!456959 lt!456957))))))

(assert (=> d!125109 (= lt!457321 (insertStrictlySorted!373 (toList!6895 lt!456955) (_1!7876 (tuple2!15731 lt!456959 lt!456957)) (_2!7876 (tuple2!15731 lt!456959 lt!456957))))))

(assert (=> d!125109 (= (+!3105 lt!456955 (tuple2!15731 lt!456959 lt!456957)) lt!457322)))

(declare-fun b!1036898 () Bool)

(declare-fun res!691955 () Bool)

(assert (=> b!1036898 (=> (not res!691955) (not e!586445))))

(assert (=> b!1036898 (= res!691955 (= (getValueByKey!589 (toList!6895 lt!457322) (_1!7876 (tuple2!15731 lt!456959 lt!456957))) (Some!639 (_2!7876 (tuple2!15731 lt!456959 lt!456957)))))))

(declare-fun b!1036899 () Bool)

(assert (=> b!1036899 (= e!586445 (contains!6022 (toList!6895 lt!457322) (tuple2!15731 lt!456959 lt!456957)))))

(assert (= (and d!125109 res!691954) b!1036898))

(assert (= (and b!1036898 res!691955) b!1036899))

(declare-fun m!957171 () Bool)

(assert (=> d!125109 m!957171))

(declare-fun m!957173 () Bool)

(assert (=> d!125109 m!957173))

(declare-fun m!957175 () Bool)

(assert (=> d!125109 m!957175))

(declare-fun m!957177 () Bool)

(assert (=> d!125109 m!957177))

(declare-fun m!957179 () Bool)

(assert (=> b!1036898 m!957179))

(declare-fun m!957181 () Bool)

(assert (=> b!1036899 m!957181))

(assert (=> b!1036122 d!125109))

(declare-fun d!125111 () Bool)

(assert (=> d!125111 (not (contains!6021 (+!3105 lt!456955 (tuple2!15731 lt!456959 lt!456957)) lt!456956))))

(declare-fun lt!457324 () Unit!33894)

(assert (=> d!125111 (= lt!457324 (choose!1707 lt!456955 lt!456959 lt!456957 lt!456956))))

(declare-fun e!586446 () Bool)

(assert (=> d!125111 e!586446))

(declare-fun res!691956 () Bool)

(assert (=> d!125111 (=> (not res!691956) (not e!586446))))

(assert (=> d!125111 (= res!691956 (not (contains!6021 lt!456955 lt!456956)))))

(assert (=> d!125111 (= (addStillNotContains!243 lt!456955 lt!456959 lt!456957 lt!456956) lt!457324)))

(declare-fun b!1036900 () Bool)

(assert (=> b!1036900 (= e!586446 (not (= lt!456959 lt!456956)))))

(assert (= (and d!125111 res!691956) b!1036900))

(assert (=> d!125111 m!955927))

(assert (=> d!125111 m!955927))

(assert (=> d!125111 m!955933))

(declare-fun m!957183 () Bool)

(assert (=> d!125111 m!957183))

(declare-fun m!957185 () Bool)

(assert (=> d!125111 m!957185))

(assert (=> b!1036122 d!125111))

(declare-fun d!125113 () Bool)

(declare-fun e!586447 () Bool)

(assert (=> d!125113 e!586447))

(declare-fun res!691957 () Bool)

(assert (=> d!125113 (=> (not res!691957) (not e!586447))))

(declare-fun lt!457327 () ListLongMap!13759)

(assert (=> d!125113 (= res!691957 (contains!6021 lt!457327 (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!457326 () List!21918)

(assert (=> d!125113 (= lt!457327 (ListLongMap!13760 lt!457326))))

(declare-fun lt!457325 () Unit!33894)

(declare-fun lt!457328 () Unit!33894)

(assert (=> d!125113 (= lt!457325 lt!457328)))

(assert (=> d!125113 (= (getValueByKey!589 lt!457326 (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!639 (_2!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125113 (= lt!457328 (lemmaContainsTupThenGetReturnValue!280 lt!457326 (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125113 (= lt!457326 (insertStrictlySorted!373 (toList!6895 call!43839) (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125113 (= (+!3105 call!43839 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!457327)))

(declare-fun b!1036901 () Bool)

(declare-fun res!691958 () Bool)

(assert (=> b!1036901 (=> (not res!691958) (not e!586447))))

(assert (=> b!1036901 (= res!691958 (= (getValueByKey!589 (toList!6895 lt!457327) (_1!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!639 (_2!7876 (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1036902 () Bool)

(assert (=> b!1036902 (= e!586447 (contains!6022 (toList!6895 lt!457327) (tuple2!15731 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) (get!16463 (select (arr!31432 (_values!6293 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1992 (defaultEntry!6270 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!125113 res!691957) b!1036901))

(assert (= (and b!1036901 res!691958) b!1036902))

(declare-fun m!957187 () Bool)

(assert (=> d!125113 m!957187))

(declare-fun m!957189 () Bool)

(assert (=> d!125113 m!957189))

(declare-fun m!957191 () Bool)

(assert (=> d!125113 m!957191))

(declare-fun m!957193 () Bool)

(assert (=> d!125113 m!957193))

(declare-fun m!957195 () Bool)

(assert (=> b!1036901 m!957195))

(declare-fun m!957197 () Bool)

(assert (=> b!1036902 m!957197))

(assert (=> b!1036122 d!125113))

(declare-fun b!1036903 () Bool)

(declare-fun e!586449 () Bool)

(declare-fun e!586451 () Bool)

(assert (=> b!1036903 (= e!586449 e!586451)))

(declare-fun res!691959 () Bool)

(assert (=> b!1036903 (=> (not res!691959) (not e!586451))))

(declare-fun e!586450 () Bool)

(assert (=> b!1036903 (= res!691959 (not e!586450))))

(declare-fun res!691961 () Bool)

(assert (=> b!1036903 (=> (not res!691961) (not e!586450))))

(assert (=> b!1036903 (= res!691961 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036904 () Bool)

(declare-fun e!586448 () Bool)

(assert (=> b!1036904 (= e!586451 e!586448)))

(declare-fun c!105039 () Bool)

(assert (=> b!1036904 (= c!105039 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125115 () Bool)

(declare-fun res!691960 () Bool)

(assert (=> d!125115 (=> res!691960 e!586449)))

(assert (=> d!125115 (= res!691960 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!125115 (= (arrayNoDuplicates!0 (_keys!11459 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104829 (Cons!21916 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) Nil!21917) Nil!21917)) e!586449)))

(declare-fun call!43900 () Bool)

(declare-fun bm!43897 () Bool)

(assert (=> bm!43897 (= call!43900 (arrayNoDuplicates!0 (_keys!11459 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105039 (Cons!21916 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104829 (Cons!21916 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) Nil!21917) Nil!21917)) (ite c!104829 (Cons!21916 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) Nil!21917) Nil!21917))))))

(declare-fun b!1036905 () Bool)

(assert (=> b!1036905 (= e!586448 call!43900)))

(declare-fun b!1036906 () Bool)

(assert (=> b!1036906 (= e!586450 (contains!6023 (ite c!104829 (Cons!21916 (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000) Nil!21917) Nil!21917) (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036907 () Bool)

(assert (=> b!1036907 (= e!586448 call!43900)))

(assert (= (and d!125115 (not res!691960)) b!1036903))

(assert (= (and b!1036903 res!691961) b!1036906))

(assert (= (and b!1036903 res!691959) b!1036904))

(assert (= (and b!1036904 c!105039) b!1036907))

(assert (= (and b!1036904 (not c!105039)) b!1036905))

(assert (= (or b!1036907 b!1036905) bm!43897))

(assert (=> b!1036903 m!956301))

(assert (=> b!1036903 m!956301))

(assert (=> b!1036903 m!956303))

(assert (=> b!1036904 m!956301))

(assert (=> b!1036904 m!956301))

(assert (=> b!1036904 m!956303))

(assert (=> bm!43897 m!956301))

(declare-fun m!957199 () Bool)

(assert (=> bm!43897 m!957199))

(assert (=> b!1036906 m!956301))

(assert (=> b!1036906 m!956301))

(declare-fun m!957201 () Bool)

(assert (=> b!1036906 m!957201))

(assert (=> bm!43847 d!125115))

(assert (=> b!1036193 d!125003))

(assert (=> b!1036259 d!124757))

(declare-fun lt!457329 () Bool)

(declare-fun d!125117 () Bool)

(assert (=> d!125117 (= lt!457329 (select (content!514 (toList!6895 lt!456972)) (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))

(declare-fun e!586452 () Bool)

(assert (=> d!125117 (= lt!457329 e!586452)))

(declare-fun res!691962 () Bool)

(assert (=> d!125117 (=> (not res!691962) (not e!586452))))

(assert (=> d!125117 (= res!691962 ((_ is Cons!21914) (toList!6895 lt!456972)))))

(assert (=> d!125117 (= (contains!6022 (toList!6895 lt!456972) (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))) lt!457329)))

(declare-fun b!1036908 () Bool)

(declare-fun e!586453 () Bool)

(assert (=> b!1036908 (= e!586452 e!586453)))

(declare-fun res!691963 () Bool)

(assert (=> b!1036908 (=> res!691963 e!586453)))

(assert (=> b!1036908 (= res!691963 (= (h!23116 (toList!6895 lt!456972)) (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))

(declare-fun b!1036909 () Bool)

(assert (=> b!1036909 (= e!586453 (contains!6022 (t!31125 (toList!6895 lt!456972)) (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))

(assert (= (and d!125117 res!691962) b!1036908))

(assert (= (and b!1036908 (not res!691963)) b!1036909))

(declare-fun m!957203 () Bool)

(assert (=> d!125117 m!957203))

(declare-fun m!957205 () Bool)

(assert (=> d!125117 m!957205))

(declare-fun m!957207 () Bool)

(assert (=> b!1036909 m!957207))

(assert (=> b!1036130 d!125117))

(declare-fun d!125119 () Bool)

(declare-fun lt!457330 () Bool)

(assert (=> d!125119 (= lt!457330 (select (content!514 (toList!6895 lt!457001)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))

(declare-fun e!586454 () Bool)

(assert (=> d!125119 (= lt!457330 e!586454)))

(declare-fun res!691964 () Bool)

(assert (=> d!125119 (=> (not res!691964) (not e!586454))))

(assert (=> d!125119 (= res!691964 ((_ is Cons!21914) (toList!6895 lt!457001)))))

(assert (=> d!125119 (= (contains!6022 (toList!6895 lt!457001) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))) lt!457330)))

(declare-fun b!1036910 () Bool)

(declare-fun e!586455 () Bool)

(assert (=> b!1036910 (= e!586454 e!586455)))

(declare-fun res!691965 () Bool)

(assert (=> b!1036910 (=> res!691965 e!586455)))

(assert (=> b!1036910 (= res!691965 (= (h!23116 (toList!6895 lt!457001)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))

(declare-fun b!1036911 () Bool)

(assert (=> b!1036911 (= e!586455 (contains!6022 (t!31125 (toList!6895 lt!457001)) (tuple2!15731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6106 thiss!1427))))))

(assert (= (and d!125119 res!691964) b!1036910))

(assert (= (and b!1036910 (not res!691965)) b!1036911))

(declare-fun m!957209 () Bool)

(assert (=> d!125119 m!957209))

(declare-fun m!957211 () Bool)

(assert (=> d!125119 m!957211))

(declare-fun m!957213 () Bool)

(assert (=> b!1036911 m!957213))

(assert (=> b!1036146 d!125119))

(assert (=> d!124589 d!124867))

(declare-fun d!125121 () Bool)

(assert (=> d!125121 (= (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) lt!456866)) (v!14931 (getValueByKey!589 (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) lt!456866)))))

(assert (=> d!124617 d!125121))

(declare-fun b!1036913 () Bool)

(declare-fun e!586456 () Option!640)

(declare-fun e!586457 () Option!640)

(assert (=> b!1036913 (= e!586456 e!586457)))

(declare-fun c!105041 () Bool)

(assert (=> b!1036913 (= c!105041 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))) (not (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))) lt!456866))))))

(declare-fun d!125123 () Bool)

(declare-fun c!105040 () Bool)

(assert (=> d!125123 (= c!105040 (and ((_ is Cons!21914) (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))) (= (_1!7876 (h!23116 (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))))) lt!456866)))))

(assert (=> d!125123 (= (getValueByKey!589 (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427)))) lt!456866) e!586456)))

(declare-fun b!1036914 () Bool)

(assert (=> b!1036914 (= e!586457 (getValueByKey!589 (t!31125 (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))) lt!456866))))

(declare-fun b!1036912 () Bool)

(assert (=> b!1036912 (= e!586456 (Some!639 (_2!7876 (h!23116 (toList!6895 (+!3105 lt!456855 (tuple2!15731 lt!456852 (minValue!6106 thiss!1427))))))))))

(declare-fun b!1036915 () Bool)

(assert (=> b!1036915 (= e!586457 None!638)))

(assert (= (and d!125123 c!105040) b!1036912))

(assert (= (and d!125123 (not c!105040)) b!1036913))

(assert (= (and b!1036913 c!105041) b!1036914))

(assert (= (and b!1036913 (not c!105041)) b!1036915))

(declare-fun m!957215 () Bool)

(assert (=> b!1036914 m!957215))

(assert (=> d!124617 d!125123))

(assert (=> b!1036108 d!124581))

(declare-fun d!125125 () Bool)

(assert (=> d!125125 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869))))

(declare-fun lt!457331 () Unit!33894)

(assert (=> d!125125 (= lt!457331 (choose!1706 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869))))

(declare-fun e!586458 () Bool)

(assert (=> d!125125 e!586458))

(declare-fun res!691966 () Bool)

(assert (=> d!125125 (=> (not res!691966) (not e!586458))))

(assert (=> d!125125 (= res!691966 (isStrictlySorted!719 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!125125 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869) lt!457331)))

(declare-fun b!1036916 () Bool)

(assert (=> b!1036916 (= e!586458 (containsKey!564 (toList!6895 (+!3105 lt!456860 (tuple2!15731 lt!456857 (zeroValue!6104 thiss!1427)))) lt!456869))))

(assert (= (and d!125125 res!691966) b!1036916))

(assert (=> d!125125 m!955975))

(assert (=> d!125125 m!955975))

(assert (=> d!125125 m!955977))

(declare-fun m!957217 () Bool)

(assert (=> d!125125 m!957217))

(declare-fun m!957219 () Bool)

(assert (=> d!125125 m!957219))

(assert (=> b!1036916 m!955971))

(assert (=> b!1036134 d!125125))

(assert (=> b!1036134 d!124893))

(assert (=> b!1036134 d!124895))

(declare-fun d!125127 () Bool)

(assert (=> d!125127 (= ($colon$colon!603 (removeStrictlySorted!57 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23116 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))) (Cons!21914 (h!23116 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) (removeStrictlySorted!57 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036160 d!125127))

(declare-fun b!1036917 () Bool)

(declare-fun e!586459 () List!21918)

(assert (=> b!1036917 (= e!586459 ($colon$colon!603 (removeStrictlySorted!57 (t!31125 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23116 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))))))

(declare-fun b!1036918 () Bool)

(declare-fun e!586460 () Bool)

(declare-fun lt!457332 () List!21918)

(assert (=> b!1036918 (= e!586460 (not (containsKey!564 lt!457332 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036919 () Bool)

(assert (=> b!1036919 (= e!586459 Nil!21915)))

(declare-fun b!1036920 () Bool)

(declare-fun e!586461 () List!21918)

(assert (=> b!1036920 (= e!586461 e!586459)))

(declare-fun c!105043 () Bool)

(assert (=> b!1036920 (= c!105043 (and ((_ is Cons!21914) (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))) (not (= (_1!7876 (h!23116 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!125129 () Bool)

(assert (=> d!125129 e!586460))

(declare-fun res!691967 () Bool)

(assert (=> d!125129 (=> (not res!691967) (not e!586460))))

(assert (=> d!125129 (= res!691967 (isStrictlySorted!719 lt!457332))))

(assert (=> d!125129 (= lt!457332 e!586461)))

(declare-fun c!105042 () Bool)

(assert (=> d!125129 (= c!105042 (and ((_ is Cons!21914) (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))) (= (_1!7876 (h!23116 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125129 (isStrictlySorted!719 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))))))

(assert (=> d!125129 (= (removeStrictlySorted!57 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457332)))

(declare-fun b!1036921 () Bool)

(assert (=> b!1036921 (= e!586461 (t!31125 (t!31125 (toList!6895 (getCurrentListMap!3943 (_keys!11459 thiss!1427) (_values!6293 thiss!1427) (mask!30171 thiss!1427) (extraKeys!6000 thiss!1427) (zeroValue!6104 thiss!1427) (minValue!6106 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6270 thiss!1427))))))))

(assert (= (and d!125129 c!105042) b!1036921))

(assert (= (and d!125129 (not c!105042)) b!1036920))

(assert (= (and b!1036920 c!105043) b!1036917))

(assert (= (and b!1036920 (not c!105043)) b!1036919))

(assert (= (and d!125129 res!691967) b!1036918))

(declare-fun m!957221 () Bool)

(assert (=> b!1036917 m!957221))

(assert (=> b!1036917 m!957221))

(declare-fun m!957223 () Bool)

(assert (=> b!1036917 m!957223))

(declare-fun m!957225 () Bool)

(assert (=> b!1036918 m!957225))

(declare-fun m!957227 () Bool)

(assert (=> d!125129 m!957227))

(assert (=> d!125129 m!956599))

(assert (=> b!1036160 d!125129))

(declare-fun b!1036922 () Bool)

(declare-fun e!586463 () Bool)

(declare-fun e!586465 () Bool)

(assert (=> b!1036922 (= e!586463 e!586465)))

(declare-fun res!691968 () Bool)

(assert (=> b!1036922 (=> (not res!691968) (not e!586465))))

(declare-fun e!586464 () Bool)

(assert (=> b!1036922 (= res!691968 (not e!586464))))

(declare-fun res!691970 () Bool)

(assert (=> b!1036922 (=> (not res!691970) (not e!586464))))

(assert (=> b!1036922 (= res!691970 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036923 () Bool)

(declare-fun e!586462 () Bool)

(assert (=> b!1036923 (= e!586465 e!586462)))

(declare-fun c!105044 () Bool)

(assert (=> b!1036923 (= c!105044 (validKeyInArray!0 (select (arr!31431 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125131 () Bool)

(declare-fun res!691969 () Bool)

(assert (=> d!125131 (=> res!691969 e!586463)))

(assert (=> d!125131 (= res!691969 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 lt!456791))))))

(assert (=> d!125131 (= (arrayNoDuplicates!0 (_keys!11459 lt!456791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104808 (Cons!21916 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) Nil!21917) Nil!21917)) e!586463)))

(declare-fun call!43901 () Bool)

(declare-fun bm!43898 () Bool)

(assert (=> bm!43898 (= call!43901 (arrayNoDuplicates!0 (_keys!11459 lt!456791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105044 (Cons!21916 (select (arr!31431 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104808 (Cons!21916 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) Nil!21917) Nil!21917)) (ite c!104808 (Cons!21916 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) Nil!21917) Nil!21917))))))

(declare-fun b!1036924 () Bool)

(assert (=> b!1036924 (= e!586462 call!43901)))

(declare-fun b!1036925 () Bool)

(assert (=> b!1036925 (= e!586464 (contains!6023 (ite c!104808 (Cons!21916 (select (arr!31431 (_keys!11459 lt!456791)) #b00000000000000000000000000000000) Nil!21917) Nil!21917) (select (arr!31431 (_keys!11459 lt!456791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036926 () Bool)

(assert (=> b!1036926 (= e!586462 call!43901)))

(assert (= (and d!125131 (not res!691969)) b!1036922))

(assert (= (and b!1036922 res!691970) b!1036925))

(assert (= (and b!1036922 res!691968) b!1036923))

(assert (= (and b!1036923 c!105044) b!1036926))

(assert (= (and b!1036923 (not c!105044)) b!1036924))

(assert (= (or b!1036926 b!1036924) bm!43898))

(assert (=> b!1036922 m!956329))

(assert (=> b!1036922 m!956329))

(assert (=> b!1036922 m!956331))

(assert (=> b!1036923 m!956329))

(assert (=> b!1036923 m!956329))

(assert (=> b!1036923 m!956331))

(assert (=> bm!43898 m!956329))

(declare-fun m!957229 () Bool)

(assert (=> bm!43898 m!957229))

(assert (=> b!1036925 m!956329))

(assert (=> b!1036925 m!956329))

(declare-fun m!957231 () Bool)

(assert (=> b!1036925 m!957231))

(assert (=> bm!43839 d!125131))

(assert (=> d!124671 d!124679))

(assert (=> d!124671 d!124653))

(declare-fun d!125133 () Bool)

(assert (=> d!125133 (contains!6021 (+!3105 lt!456886 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))) lt!456895)))

(assert (=> d!125133 true))

(declare-fun _$35!443 () Unit!33894)

(assert (=> d!125133 (= (choose!1704 lt!456886 lt!456883 (zeroValue!6104 thiss!1427) lt!456895) _$35!443)))

(declare-fun bs!30362 () Bool)

(assert (= bs!30362 d!125133))

(assert (=> bs!30362 m!955771))

(assert (=> bs!30362 m!955771))

(assert (=> bs!30362 m!955773))

(assert (=> d!124671 d!125133))

(declare-fun d!125135 () Bool)

(declare-fun e!586466 () Bool)

(assert (=> d!125135 e!586466))

(declare-fun res!691971 () Bool)

(assert (=> d!125135 (=> res!691971 e!586466)))

(declare-fun lt!457334 () Bool)

(assert (=> d!125135 (= res!691971 (not lt!457334))))

(declare-fun lt!457336 () Bool)

(assert (=> d!125135 (= lt!457334 lt!457336)))

(declare-fun lt!457333 () Unit!33894)

(declare-fun e!586467 () Unit!33894)

(assert (=> d!125135 (= lt!457333 e!586467)))

(declare-fun c!105045 () Bool)

(assert (=> d!125135 (= c!105045 lt!457336)))

(assert (=> d!125135 (= lt!457336 (containsKey!564 (toList!6895 lt!456886) lt!456895))))

(assert (=> d!125135 (= (contains!6021 lt!456886 lt!456895) lt!457334)))

(declare-fun b!1036927 () Bool)

(declare-fun lt!457335 () Unit!33894)

(assert (=> b!1036927 (= e!586467 lt!457335)))

(assert (=> b!1036927 (= lt!457335 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 lt!456886) lt!456895))))

(assert (=> b!1036927 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456886) lt!456895))))

(declare-fun b!1036928 () Bool)

(declare-fun Unit!33941 () Unit!33894)

(assert (=> b!1036928 (= e!586467 Unit!33941)))

(declare-fun b!1036929 () Bool)

(assert (=> b!1036929 (= e!586466 (isDefined!436 (getValueByKey!589 (toList!6895 lt!456886) lt!456895)))))

(assert (= (and d!125135 c!105045) b!1036927))

(assert (= (and d!125135 (not c!105045)) b!1036928))

(assert (= (and d!125135 (not res!691971)) b!1036929))

(declare-fun m!957233 () Bool)

(assert (=> d!125135 m!957233))

(declare-fun m!957235 () Bool)

(assert (=> b!1036927 m!957235))

(declare-fun m!957237 () Bool)

(assert (=> b!1036927 m!957237))

(assert (=> b!1036927 m!957237))

(declare-fun m!957239 () Bool)

(assert (=> b!1036927 m!957239))

(assert (=> b!1036929 m!957237))

(assert (=> b!1036929 m!957237))

(assert (=> b!1036929 m!957239))

(assert (=> d!124671 d!125135))

(declare-fun d!125137 () Bool)

(assert (=> d!125137 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456877) lt!456891)) (v!14931 (getValueByKey!589 (toList!6895 lt!456877) lt!456891)))))

(assert (=> d!124663 d!125137))

(declare-fun b!1036931 () Bool)

(declare-fun e!586468 () Option!640)

(declare-fun e!586469 () Option!640)

(assert (=> b!1036931 (= e!586468 e!586469)))

(declare-fun c!105047 () Bool)

(assert (=> b!1036931 (= c!105047 (and ((_ is Cons!21914) (toList!6895 lt!456877)) (not (= (_1!7876 (h!23116 (toList!6895 lt!456877))) lt!456891))))))

(declare-fun d!125139 () Bool)

(declare-fun c!105046 () Bool)

(assert (=> d!125139 (= c!105046 (and ((_ is Cons!21914) (toList!6895 lt!456877)) (= (_1!7876 (h!23116 (toList!6895 lt!456877))) lt!456891)))))

(assert (=> d!125139 (= (getValueByKey!589 (toList!6895 lt!456877) lt!456891) e!586468)))

(declare-fun b!1036932 () Bool)

(assert (=> b!1036932 (= e!586469 (getValueByKey!589 (t!31125 (toList!6895 lt!456877)) lt!456891))))

(declare-fun b!1036930 () Bool)

(assert (=> b!1036930 (= e!586468 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!456877)))))))

(declare-fun b!1036933 () Bool)

(assert (=> b!1036933 (= e!586469 None!638)))

(assert (= (and d!125139 c!105046) b!1036930))

(assert (= (and d!125139 (not c!105046)) b!1036931))

(assert (= (and b!1036931 c!105047) b!1036932))

(assert (= (and b!1036931 (not c!105047)) b!1036933))

(declare-fun m!957241 () Bool)

(assert (=> b!1036932 m!957241))

(assert (=> d!124663 d!125139))

(declare-fun bm!43899 () Bool)

(declare-fun call!43902 () Bool)

(assert (=> bm!43899 (= call!43902 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11459 thiss!1427) (mask!30171 thiss!1427)))))

(declare-fun b!1036934 () Bool)

(declare-fun e!586471 () Bool)

(assert (=> b!1036934 (= e!586471 call!43902)))

(declare-fun d!125141 () Bool)

(declare-fun res!691972 () Bool)

(declare-fun e!586472 () Bool)

(assert (=> d!125141 (=> res!691972 e!586472)))

(assert (=> d!125141 (= res!691972 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31959 (_keys!11459 thiss!1427))))))

(assert (=> d!125141 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11459 thiss!1427) (mask!30171 thiss!1427)) e!586472)))

(declare-fun b!1036935 () Bool)

(declare-fun e!586470 () Bool)

(assert (=> b!1036935 (= e!586471 e!586470)))

(declare-fun lt!457338 () (_ BitVec 64))

(assert (=> b!1036935 (= lt!457338 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!457337 () Unit!33894)

(assert (=> b!1036935 (= lt!457337 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11459 thiss!1427) lt!457338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1036935 (arrayContainsKey!0 (_keys!11459 thiss!1427) lt!457338 #b00000000000000000000000000000000)))

(declare-fun lt!457339 () Unit!33894)

(assert (=> b!1036935 (= lt!457339 lt!457337)))

(declare-fun res!691973 () Bool)

(assert (=> b!1036935 (= res!691973 (= (seekEntryOrOpen!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11459 thiss!1427) (mask!30171 thiss!1427)) (Found!9746 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036935 (=> (not res!691973) (not e!586470))))

(declare-fun b!1036936 () Bool)

(assert (=> b!1036936 (= e!586470 call!43902)))

(declare-fun b!1036937 () Bool)

(assert (=> b!1036937 (= e!586472 e!586471)))

(declare-fun c!105048 () Bool)

(assert (=> b!1036937 (= c!105048 (validKeyInArray!0 (select (arr!31431 (_keys!11459 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!125141 (not res!691972)) b!1036937))

(assert (= (and b!1036937 c!105048) b!1036935))

(assert (= (and b!1036937 (not c!105048)) b!1036934))

(assert (= (and b!1036935 res!691973) b!1036936))

(assert (= (or b!1036936 b!1036934) bm!43899))

(declare-fun m!957243 () Bool)

(assert (=> bm!43899 m!957243))

(assert (=> b!1036935 m!956301))

(declare-fun m!957245 () Bool)

(assert (=> b!1036935 m!957245))

(declare-fun m!957247 () Bool)

(assert (=> b!1036935 m!957247))

(assert (=> b!1036935 m!956301))

(declare-fun m!957249 () Bool)

(assert (=> b!1036935 m!957249))

(assert (=> b!1036937 m!956301))

(assert (=> b!1036937 m!956301))

(assert (=> b!1036937 m!956303))

(assert (=> bm!43848 d!125141))

(declare-fun d!125143 () Bool)

(declare-fun e!586473 () Bool)

(assert (=> d!125143 e!586473))

(declare-fun res!691974 () Bool)

(assert (=> d!125143 (=> res!691974 e!586473)))

(declare-fun lt!457341 () Bool)

(assert (=> d!125143 (= res!691974 (not lt!457341))))

(declare-fun lt!457343 () Bool)

(assert (=> d!125143 (= lt!457341 lt!457343)))

(declare-fun lt!457340 () Unit!33894)

(declare-fun e!586474 () Unit!33894)

(assert (=> d!125143 (= lt!457340 e!586474)))

(declare-fun c!105049 () Bool)

(assert (=> d!125143 (= c!105049 lt!457343)))

(assert (=> d!125143 (= lt!457343 (containsKey!564 (toList!6895 (+!3105 lt!456920 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))) lt!456929))))

(assert (=> d!125143 (= (contains!6021 (+!3105 lt!456920 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791))) lt!456929) lt!457341)))

(declare-fun b!1036938 () Bool)

(declare-fun lt!457342 () Unit!33894)

(assert (=> b!1036938 (= e!586474 lt!457342)))

(assert (=> b!1036938 (= lt!457342 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6895 (+!3105 lt!456920 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))) lt!456929))))

(assert (=> b!1036938 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456920 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))) lt!456929))))

(declare-fun b!1036939 () Bool)

(declare-fun Unit!33942 () Unit!33894)

(assert (=> b!1036939 (= e!586474 Unit!33942)))

(declare-fun b!1036940 () Bool)

(assert (=> b!1036940 (= e!586473 (isDefined!436 (getValueByKey!589 (toList!6895 (+!3105 lt!456920 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))) lt!456929)))))

(assert (= (and d!125143 c!105049) b!1036938))

(assert (= (and d!125143 (not c!105049)) b!1036939))

(assert (= (and d!125143 (not res!691974)) b!1036940))

(declare-fun m!957251 () Bool)

(assert (=> d!125143 m!957251))

(declare-fun m!957253 () Bool)

(assert (=> b!1036938 m!957253))

(declare-fun m!957255 () Bool)

(assert (=> b!1036938 m!957255))

(assert (=> b!1036938 m!957255))

(declare-fun m!957257 () Bool)

(assert (=> b!1036938 m!957257))

(assert (=> b!1036940 m!957255))

(assert (=> b!1036940 m!957255))

(assert (=> b!1036940 m!957257))

(assert (=> b!1036062 d!125143))

(declare-fun d!125145 () Bool)

(assert (=> d!125145 (contains!6021 (+!3105 lt!456920 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791))) lt!456929)))

(declare-fun lt!457344 () Unit!33894)

(assert (=> d!125145 (= lt!457344 (choose!1704 lt!456920 lt!456917 (zeroValue!6104 lt!456791) lt!456929))))

(assert (=> d!125145 (contains!6021 lt!456920 lt!456929)))

(assert (=> d!125145 (= (addStillContains!626 lt!456920 lt!456917 (zeroValue!6104 lt!456791) lt!456929) lt!457344)))

(declare-fun bs!30363 () Bool)

(assert (= bs!30363 d!125145))

(assert (=> bs!30363 m!955863))

(assert (=> bs!30363 m!955863))

(assert (=> bs!30363 m!955865))

(declare-fun m!957259 () Bool)

(assert (=> bs!30363 m!957259))

(declare-fun m!957261 () Bool)

(assert (=> bs!30363 m!957261))

(assert (=> b!1036062 d!125145))

(declare-fun d!125147 () Bool)

(assert (=> d!125147 (= (apply!907 (+!3105 lt!456914 (tuple2!15731 lt!456909 (minValue!6106 lt!456791))) lt!456928) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456914 (tuple2!15731 lt!456909 (minValue!6106 lt!456791)))) lt!456928)))))

(declare-fun bs!30364 () Bool)

(assert (= bs!30364 d!125147))

(declare-fun m!957263 () Bool)

(assert (=> bs!30364 m!957263))

(assert (=> bs!30364 m!957263))

(declare-fun m!957265 () Bool)

(assert (=> bs!30364 m!957265))

(assert (=> b!1036062 d!125147))

(declare-fun d!125149 () Bool)

(declare-fun e!586475 () Bool)

(assert (=> d!125149 e!586475))

(declare-fun res!691975 () Bool)

(assert (=> d!125149 (=> (not res!691975) (not e!586475))))

(declare-fun lt!457347 () ListLongMap!13759)

(assert (=> d!125149 (= res!691975 (contains!6021 lt!457347 (_1!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791)))))))

(declare-fun lt!457346 () List!21918)

(assert (=> d!125149 (= lt!457347 (ListLongMap!13760 lt!457346))))

(declare-fun lt!457345 () Unit!33894)

(declare-fun lt!457348 () Unit!33894)

(assert (=> d!125149 (= lt!457345 lt!457348)))

(assert (=> d!125149 (= (getValueByKey!589 lt!457346 (_1!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791)))))))

(assert (=> d!125149 (= lt!457348 (lemmaContainsTupThenGetReturnValue!280 lt!457346 (_1!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791))) (_2!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791)))))))

(assert (=> d!125149 (= lt!457346 (insertStrictlySorted!373 (toList!6895 lt!456911) (_1!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791))) (_2!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791)))))))

(assert (=> d!125149 (= (+!3105 lt!456911 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791))) lt!457347)))

(declare-fun b!1036941 () Bool)

(declare-fun res!691976 () Bool)

(assert (=> b!1036941 (=> (not res!691976) (not e!586475))))

(assert (=> b!1036941 (= res!691976 (= (getValueByKey!589 (toList!6895 lt!457347) (_1!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791))))))))

(declare-fun b!1036942 () Bool)

(assert (=> b!1036942 (= e!586475 (contains!6022 (toList!6895 lt!457347) (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791))))))

(assert (= (and d!125149 res!691975) b!1036941))

(assert (= (and b!1036941 res!691976) b!1036942))

(declare-fun m!957267 () Bool)

(assert (=> d!125149 m!957267))

(declare-fun m!957269 () Bool)

(assert (=> d!125149 m!957269))

(declare-fun m!957271 () Bool)

(assert (=> d!125149 m!957271))

(declare-fun m!957273 () Bool)

(assert (=> d!125149 m!957273))

(declare-fun m!957275 () Bool)

(assert (=> b!1036941 m!957275))

(declare-fun m!957277 () Bool)

(assert (=> b!1036942 m!957277))

(assert (=> b!1036062 d!125149))

(declare-fun d!125151 () Bool)

(assert (=> d!125151 (= (apply!907 (+!3105 lt!456915 (tuple2!15731 lt!456912 (minValue!6106 lt!456791))) lt!456926) (apply!907 lt!456915 lt!456926))))

(declare-fun lt!457349 () Unit!33894)

(assert (=> d!125151 (= lt!457349 (choose!1703 lt!456915 lt!456912 (minValue!6106 lt!456791) lt!456926))))

(declare-fun e!586476 () Bool)

(assert (=> d!125151 e!586476))

(declare-fun res!691977 () Bool)

(assert (=> d!125151 (=> (not res!691977) (not e!586476))))

(assert (=> d!125151 (= res!691977 (contains!6021 lt!456915 lt!456926))))

(assert (=> d!125151 (= (addApplyDifferent!486 lt!456915 lt!456912 (minValue!6106 lt!456791) lt!456926) lt!457349)))

(declare-fun b!1036943 () Bool)

(assert (=> b!1036943 (= e!586476 (not (= lt!456926 lt!456912)))))

(assert (= (and d!125151 res!691977) b!1036943))

(assert (=> d!125151 m!955879))

(assert (=> d!125151 m!955883))

(declare-fun m!957279 () Bool)

(assert (=> d!125151 m!957279))

(assert (=> d!125151 m!955879))

(declare-fun m!957281 () Bool)

(assert (=> d!125151 m!957281))

(assert (=> d!125151 m!955885))

(assert (=> b!1036062 d!125151))

(declare-fun d!125153 () Bool)

(declare-fun e!586477 () Bool)

(assert (=> d!125153 e!586477))

(declare-fun res!691978 () Bool)

(assert (=> d!125153 (=> (not res!691978) (not e!586477))))

(declare-fun lt!457352 () ListLongMap!13759)

(assert (=> d!125153 (= res!691978 (contains!6021 lt!457352 (_1!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))))))

(declare-fun lt!457351 () List!21918)

(assert (=> d!125153 (= lt!457352 (ListLongMap!13760 lt!457351))))

(declare-fun lt!457350 () Unit!33894)

(declare-fun lt!457353 () Unit!33894)

(assert (=> d!125153 (= lt!457350 lt!457353)))

(assert (=> d!125153 (= (getValueByKey!589 lt!457351 (_1!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))))))

(assert (=> d!125153 (= lt!457353 (lemmaContainsTupThenGetReturnValue!280 lt!457351 (_1!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791))) (_2!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))))))

(assert (=> d!125153 (= lt!457351 (insertStrictlySorted!373 (toList!6895 lt!456920) (_1!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791))) (_2!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))))))

(assert (=> d!125153 (= (+!3105 lt!456920 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791))) lt!457352)))

(declare-fun b!1036944 () Bool)

(declare-fun res!691979 () Bool)

(assert (=> b!1036944 (=> (not res!691979) (not e!586477))))

(assert (=> b!1036944 (= res!691979 (= (getValueByKey!589 (toList!6895 lt!457352) (_1!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791))))))))

(declare-fun b!1036945 () Bool)

(assert (=> b!1036945 (= e!586477 (contains!6022 (toList!6895 lt!457352) (tuple2!15731 lt!456917 (zeroValue!6104 lt!456791))))))

(assert (= (and d!125153 res!691978) b!1036944))

(assert (= (and b!1036944 res!691979) b!1036945))

(declare-fun m!957283 () Bool)

(assert (=> d!125153 m!957283))

(declare-fun m!957285 () Bool)

(assert (=> d!125153 m!957285))

(declare-fun m!957287 () Bool)

(assert (=> d!125153 m!957287))

(declare-fun m!957289 () Bool)

(assert (=> d!125153 m!957289))

(declare-fun m!957291 () Bool)

(assert (=> b!1036944 m!957291))

(declare-fun m!957293 () Bool)

(assert (=> b!1036945 m!957293))

(assert (=> b!1036062 d!125153))

(declare-fun d!125155 () Bool)

(assert (=> d!125155 (= (apply!907 lt!456911 lt!456925) (get!16464 (getValueByKey!589 (toList!6895 lt!456911) lt!456925)))))

(declare-fun bs!30365 () Bool)

(assert (= bs!30365 d!125155))

(declare-fun m!957295 () Bool)

(assert (=> bs!30365 m!957295))

(assert (=> bs!30365 m!957295))

(declare-fun m!957297 () Bool)

(assert (=> bs!30365 m!957297))

(assert (=> b!1036062 d!125155))

(declare-fun d!125157 () Bool)

(assert (=> d!125157 (= (apply!907 (+!3105 lt!456914 (tuple2!15731 lt!456909 (minValue!6106 lt!456791))) lt!456928) (apply!907 lt!456914 lt!456928))))

(declare-fun lt!457354 () Unit!33894)

(assert (=> d!125157 (= lt!457354 (choose!1703 lt!456914 lt!456909 (minValue!6106 lt!456791) lt!456928))))

(declare-fun e!586478 () Bool)

(assert (=> d!125157 e!586478))

(declare-fun res!691980 () Bool)

(assert (=> d!125157 (=> (not res!691980) (not e!586478))))

(assert (=> d!125157 (= res!691980 (contains!6021 lt!456914 lt!456928))))

(assert (=> d!125157 (= (addApplyDifferent!486 lt!456914 lt!456909 (minValue!6106 lt!456791) lt!456928) lt!457354)))

(declare-fun b!1036946 () Bool)

(assert (=> b!1036946 (= e!586478 (not (= lt!456928 lt!456909)))))

(assert (= (and d!125157 res!691980) b!1036946))

(assert (=> d!125157 m!955871))

(assert (=> d!125157 m!955873))

(declare-fun m!957299 () Bool)

(assert (=> d!125157 m!957299))

(assert (=> d!125157 m!955871))

(declare-fun m!957301 () Bool)

(assert (=> d!125157 m!957301))

(assert (=> d!125157 m!955859))

(assert (=> b!1036062 d!125157))

(declare-fun d!125159 () Bool)

(assert (=> d!125159 (= (apply!907 (+!3105 lt!456911 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791))) lt!456925) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456911 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791)))) lt!456925)))))

(declare-fun bs!30366 () Bool)

(assert (= bs!30366 d!125159))

(declare-fun m!957303 () Bool)

(assert (=> bs!30366 m!957303))

(assert (=> bs!30366 m!957303))

(declare-fun m!957305 () Bool)

(assert (=> bs!30366 m!957305))

(assert (=> b!1036062 d!125159))

(declare-fun d!125161 () Bool)

(declare-fun e!586479 () Bool)

(assert (=> d!125161 e!586479))

(declare-fun res!691981 () Bool)

(assert (=> d!125161 (=> (not res!691981) (not e!586479))))

(declare-fun lt!457357 () ListLongMap!13759)

(assert (=> d!125161 (= res!691981 (contains!6021 lt!457357 (_1!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791)))))))

(declare-fun lt!457356 () List!21918)

(assert (=> d!125161 (= lt!457357 (ListLongMap!13760 lt!457356))))

(declare-fun lt!457355 () Unit!33894)

(declare-fun lt!457358 () Unit!33894)

(assert (=> d!125161 (= lt!457355 lt!457358)))

(assert (=> d!125161 (= (getValueByKey!589 lt!457356 (_1!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791)))))))

(assert (=> d!125161 (= lt!457358 (lemmaContainsTupThenGetReturnValue!280 lt!457356 (_1!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791))) (_2!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791)))))))

(assert (=> d!125161 (= lt!457356 (insertStrictlySorted!373 (toList!6895 lt!456914) (_1!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791))) (_2!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791)))))))

(assert (=> d!125161 (= (+!3105 lt!456914 (tuple2!15731 lt!456909 (minValue!6106 lt!456791))) lt!457357)))

(declare-fun b!1036947 () Bool)

(declare-fun res!691982 () Bool)

(assert (=> b!1036947 (=> (not res!691982) (not e!586479))))

(assert (=> b!1036947 (= res!691982 (= (getValueByKey!589 (toList!6895 lt!457357) (_1!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 lt!456909 (minValue!6106 lt!456791))))))))

(declare-fun b!1036948 () Bool)

(assert (=> b!1036948 (= e!586479 (contains!6022 (toList!6895 lt!457357) (tuple2!15731 lt!456909 (minValue!6106 lt!456791))))))

(assert (= (and d!125161 res!691981) b!1036947))

(assert (= (and b!1036947 res!691982) b!1036948))

(declare-fun m!957307 () Bool)

(assert (=> d!125161 m!957307))

(declare-fun m!957309 () Bool)

(assert (=> d!125161 m!957309))

(declare-fun m!957311 () Bool)

(assert (=> d!125161 m!957311))

(declare-fun m!957313 () Bool)

(assert (=> d!125161 m!957313))

(declare-fun m!957315 () Bool)

(assert (=> b!1036947 m!957315))

(declare-fun m!957317 () Bool)

(assert (=> b!1036948 m!957317))

(assert (=> b!1036062 d!125161))

(declare-fun d!125163 () Bool)

(assert (=> d!125163 (= (apply!907 (+!3105 lt!456915 (tuple2!15731 lt!456912 (minValue!6106 lt!456791))) lt!456926) (get!16464 (getValueByKey!589 (toList!6895 (+!3105 lt!456915 (tuple2!15731 lt!456912 (minValue!6106 lt!456791)))) lt!456926)))))

(declare-fun bs!30367 () Bool)

(assert (= bs!30367 d!125163))

(declare-fun m!957319 () Bool)

(assert (=> bs!30367 m!957319))

(assert (=> bs!30367 m!957319))

(declare-fun m!957321 () Bool)

(assert (=> bs!30367 m!957321))

(assert (=> b!1036062 d!125163))

(declare-fun d!125165 () Bool)

(assert (=> d!125165 (= (apply!907 lt!456914 lt!456928) (get!16464 (getValueByKey!589 (toList!6895 lt!456914) lt!456928)))))

(declare-fun bs!30368 () Bool)

(assert (= bs!30368 d!125165))

(declare-fun m!957323 () Bool)

(assert (=> bs!30368 m!957323))

(assert (=> bs!30368 m!957323))

(declare-fun m!957325 () Bool)

(assert (=> bs!30368 m!957325))

(assert (=> b!1036062 d!125165))

(declare-fun d!125167 () Bool)

(assert (=> d!125167 (= (apply!907 lt!456915 lt!456926) (get!16464 (getValueByKey!589 (toList!6895 lt!456915) lt!456926)))))

(declare-fun bs!30369 () Bool)

(assert (= bs!30369 d!125167))

(declare-fun m!957327 () Bool)

(assert (=> bs!30369 m!957327))

(assert (=> bs!30369 m!957327))

(declare-fun m!957329 () Bool)

(assert (=> bs!30369 m!957329))

(assert (=> b!1036062 d!125167))

(assert (=> b!1036062 d!125043))

(declare-fun d!125169 () Bool)

(assert (=> d!125169 (= (apply!907 (+!3105 lt!456911 (tuple2!15731 lt!456922 (zeroValue!6104 lt!456791))) lt!456925) (apply!907 lt!456911 lt!456925))))

(declare-fun lt!457359 () Unit!33894)

(assert (=> d!125169 (= lt!457359 (choose!1703 lt!456911 lt!456922 (zeroValue!6104 lt!456791) lt!456925))))

(declare-fun e!586480 () Bool)

(assert (=> d!125169 e!586480))

(declare-fun res!691983 () Bool)

(assert (=> d!125169 (=> (not res!691983) (not e!586480))))

(assert (=> d!125169 (= res!691983 (contains!6021 lt!456911 lt!456925))))

(assert (=> d!125169 (= (addApplyDifferent!486 lt!456911 lt!456922 (zeroValue!6104 lt!456791) lt!456925) lt!457359)))

(declare-fun b!1036949 () Bool)

(assert (=> b!1036949 (= e!586480 (not (= lt!456925 lt!456922)))))

(assert (= (and d!125169 res!691983) b!1036949))

(assert (=> d!125169 m!955867))

(assert (=> d!125169 m!955869))

(declare-fun m!957331 () Bool)

(assert (=> d!125169 m!957331))

(assert (=> d!125169 m!955867))

(declare-fun m!957333 () Bool)

(assert (=> d!125169 m!957333))

(assert (=> d!125169 m!955881))

(assert (=> b!1036062 d!125169))

(declare-fun d!125171 () Bool)

(declare-fun e!586481 () Bool)

(assert (=> d!125171 e!586481))

(declare-fun res!691984 () Bool)

(assert (=> d!125171 (=> (not res!691984) (not e!586481))))

(declare-fun lt!457362 () ListLongMap!13759)

(assert (=> d!125171 (= res!691984 (contains!6021 lt!457362 (_1!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791)))))))

(declare-fun lt!457361 () List!21918)

(assert (=> d!125171 (= lt!457362 (ListLongMap!13760 lt!457361))))

(declare-fun lt!457360 () Unit!33894)

(declare-fun lt!457363 () Unit!33894)

(assert (=> d!125171 (= lt!457360 lt!457363)))

(assert (=> d!125171 (= (getValueByKey!589 lt!457361 (_1!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791)))))))

(assert (=> d!125171 (= lt!457363 (lemmaContainsTupThenGetReturnValue!280 lt!457361 (_1!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791))) (_2!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791)))))))

(assert (=> d!125171 (= lt!457361 (insertStrictlySorted!373 (toList!6895 lt!456915) (_1!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791))) (_2!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791)))))))

(assert (=> d!125171 (= (+!3105 lt!456915 (tuple2!15731 lt!456912 (minValue!6106 lt!456791))) lt!457362)))

(declare-fun b!1036950 () Bool)

(declare-fun res!691985 () Bool)

(assert (=> b!1036950 (=> (not res!691985) (not e!586481))))

(assert (=> b!1036950 (= res!691985 (= (getValueByKey!589 (toList!6895 lt!457362) (_1!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791)))) (Some!639 (_2!7876 (tuple2!15731 lt!456912 (minValue!6106 lt!456791))))))))

(declare-fun b!1036951 () Bool)

(assert (=> b!1036951 (= e!586481 (contains!6022 (toList!6895 lt!457362) (tuple2!15731 lt!456912 (minValue!6106 lt!456791))))))

(assert (= (and d!125171 res!691984) b!1036950))

(assert (= (and b!1036950 res!691985) b!1036951))

(declare-fun m!957335 () Bool)

(assert (=> d!125171 m!957335))

(declare-fun m!957337 () Bool)

(assert (=> d!125171 m!957337))

(declare-fun m!957339 () Bool)

(assert (=> d!125171 m!957339))

(declare-fun m!957341 () Bool)

(assert (=> d!125171 m!957341))

(declare-fun m!957343 () Bool)

(assert (=> b!1036950 m!957343))

(declare-fun m!957345 () Bool)

(assert (=> b!1036951 m!957345))

(assert (=> b!1036062 d!125171))

(declare-fun d!125173 () Bool)

(assert (=> d!125173 (= (get!16464 (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))) (v!14931 (getValueByKey!589 (toList!6895 lt!456864) (select (arr!31431 (_keys!11459 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124583 d!125173))

(assert (=> d!124583 d!124855))

(declare-fun b!1036953 () Bool)

(declare-fun e!586482 () Option!640)

(declare-fun e!586483 () Option!640)

(assert (=> b!1036953 (= e!586482 e!586483)))

(declare-fun c!105051 () Bool)

(assert (=> b!1036953 (= c!105051 (and ((_ is Cons!21914) (toList!6895 lt!457027)) (not (= (_1!7876 (h!23116 (toList!6895 lt!457027))) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))))

(declare-fun c!105050 () Bool)

(declare-fun d!125175 () Bool)

(assert (=> d!125175 (= c!105050 (and ((_ is Cons!21914) (toList!6895 lt!457027)) (= (_1!7876 (h!23116 (toList!6895 lt!457027))) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427))))))))

(assert (=> d!125175 (= (getValueByKey!589 (toList!6895 lt!457027) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))) e!586482)))

(declare-fun b!1036954 () Bool)

(assert (=> b!1036954 (= e!586483 (getValueByKey!589 (t!31125 (toList!6895 lt!457027)) (_1!7876 (tuple2!15731 lt!456883 (zeroValue!6104 thiss!1427)))))))

(declare-fun b!1036952 () Bool)

(assert (=> b!1036952 (= e!586482 (Some!639 (_2!7876 (h!23116 (toList!6895 lt!457027)))))))

(declare-fun b!1036955 () Bool)

(assert (=> b!1036955 (= e!586483 None!638)))

(assert (= (and d!125175 c!105050) b!1036952))

(assert (= (and d!125175 (not c!105050)) b!1036953))

(assert (= (and b!1036953 c!105051) b!1036954))

(assert (= (and b!1036953 (not c!105051)) b!1036955))

(declare-fun m!957347 () Bool)

(assert (=> b!1036954 m!957347))

(assert (=> b!1036212 d!125175))

(assert (=> b!1036149 d!124885))

(assert (=> b!1036149 d!124887))

(declare-fun mapNonEmpty!38420 () Bool)

(declare-fun mapRes!38420 () Bool)

(declare-fun tp!73776 () Bool)

(declare-fun e!586485 () Bool)

(assert (=> mapNonEmpty!38420 (= mapRes!38420 (and tp!73776 e!586485))))

(declare-fun mapValue!38420 () ValueCell!11595)

(declare-fun mapKey!38420 () (_ BitVec 32))

(declare-fun mapRest!38420 () (Array (_ BitVec 32) ValueCell!11595))

(assert (=> mapNonEmpty!38420 (= mapRest!38419 (store mapRest!38420 mapKey!38420 mapValue!38420))))

(declare-fun b!1036956 () Bool)

(assert (=> b!1036956 (= e!586485 tp_is_empty!24597)))

(declare-fun mapIsEmpty!38420 () Bool)

(assert (=> mapIsEmpty!38420 mapRes!38420))

(declare-fun condMapEmpty!38420 () Bool)

(declare-fun mapDefault!38420 () ValueCell!11595)

(assert (=> mapNonEmpty!38419 (= condMapEmpty!38420 (= mapRest!38419 ((as const (Array (_ BitVec 32) ValueCell!11595)) mapDefault!38420)))))

(declare-fun e!586484 () Bool)

(assert (=> mapNonEmpty!38419 (= tp!73775 (and e!586484 mapRes!38420))))

(declare-fun b!1036957 () Bool)

(assert (=> b!1036957 (= e!586484 tp_is_empty!24597)))

(assert (= (and mapNonEmpty!38419 condMapEmpty!38420) mapIsEmpty!38420))

(assert (= (and mapNonEmpty!38419 (not condMapEmpty!38420)) mapNonEmpty!38420))

(assert (= (and mapNonEmpty!38420 ((_ is ValueCellFull!11595) mapValue!38420)) b!1036956))

(assert (= (and mapNonEmpty!38419 ((_ is ValueCellFull!11595) mapDefault!38420)) b!1036957))

(declare-fun m!957349 () Bool)

(assert (=> mapNonEmpty!38420 m!957349))

(declare-fun b_lambda!16147 () Bool)

(assert (= b_lambda!16141 (or (and b!1035903 b_free!20877) b_lambda!16147)))

(declare-fun b_lambda!16149 () Bool)

(assert (= b_lambda!16135 (or (and b!1035903 b_free!20877) b_lambda!16149)))

(declare-fun b_lambda!16151 () Bool)

(assert (= b_lambda!16117 (or (and b!1035903 b_free!20877 (= (defaultEntry!6270 thiss!1427) (defaultEntry!6270 lt!456791))) b_lambda!16151)))

(declare-fun b_lambda!16153 () Bool)

(assert (= b_lambda!16137 (or (and b!1035903 b_free!20877) b_lambda!16153)))

(declare-fun b_lambda!16155 () Bool)

(assert (= b_lambda!16139 (or (and b!1035903 b_free!20877) b_lambda!16155)))

(check-sat (not d!125085) (not d!124863) (not b!1036711) (not d!124975) (not d!124851) (not b!1036720) (not b!1036533) (not b!1036322) (not d!124849) (not d!125033) (not b_lambda!16145) (not bm!43868) (not b!1036419) (not b!1036784) (not b!1036796) (not b!1036873) (not b!1036922) (not d!125157) (not bm!43864) (not b!1036475) (not d!124783) (not d!124913) (not d!124971) (not b!1036567) (not b!1036408) (not d!124835) (not b!1036689) (not b!1036677) (not b!1036804) (not b!1036865) (not d!124897) (not d!124903) (not d!124957) (not d!124923) (not d!124999) (not b!1036917) (not b!1036758) (not b!1036860) (not b!1036633) (not b!1036714) (not d!125099) (not d!124893) (not b!1036282) (not b!1036753) b_and!33411 (not b!1036932) (not b!1036942) (not b!1036889) (not b_lambda!16127) (not b!1036732) (not d!125019) (not b!1036883) (not b!1036458) (not b!1036693) (not d!124779) (not b!1036381) (not b!1036666) (not b!1036954) (not b!1036727) (not d!125063) (not d!124735) (not b!1036901) (not d!124763) (not b!1036460) (not b!1036405) tp_is_empty!24597 (not b!1036818) (not d!125149) (not b!1036751) (not d!125035) (not b!1036357) (not d!124929) (not d!124983) (not b!1036373) (not d!125047) (not b!1036320) (not d!124813) (not b!1036839) (not d!124881) (not b!1036630) (not b!1036566) (not b!1036923) (not b!1036941) (not d!125119) (not b!1036878) (not b!1036353) (not b!1036291) (not d!125155) (not b_lambda!16151) (not b!1036881) (not b!1036893) (not d!124909) (not d!124741) (not bm!43850) (not b!1036628) (not d!124885) (not b!1036293) (not b!1036442) (not b!1036371) (not mapNonEmpty!38420) (not b!1036440) (not bm!43874) (not b!1036506) (not d!124771) (not b!1036815) (not b!1036498) (not d!124961) (not b!1036713) (not b!1036645) (not d!124799) (not d!124925) (not b!1036418) (not b!1036872) (not b!1036412) (not b!1036493) (not d!125025) (not b!1036808) (not b!1036801) (not b!1036544) (not d!124729) (not b!1036623) (not b!1036292) (not d!124815) (not d!125159) (not b!1036779) (not b!1036660) (not b!1036387) (not b!1036283) (not b!1036314) (not d!125129) (not bm!43858) (not b!1036605) (not b!1036951) (not b!1036866) (not b!1036813) (not b!1036663) (not b!1036849) (not b!1036467) (not b!1036944) (not b!1036401) (not b!1036571) (not b!1036807) (not d!124919) (not b!1036730) (not b!1036945) (not bm!43877) (not d!125031) (not b!1036898) (not d!125147) (not d!124879) (not b!1036918) (not d!125151) (not d!125097) (not d!125041) (not b_lambda!16143) (not d!125083) (not b!1036776) (not b!1036616) (not b!1036290) (not b!1036762) (not b!1036755) (not b!1036862) (not b!1036551) (not b!1036806) (not b!1036410) (not b!1036850) (not d!125143) (not b!1036797) (not d!125117) (not d!124865) (not b!1036670) (not b!1036790) (not b!1036286) (not d!124753) (not b!1036325) (not b!1036672) (not b_lambda!16113) (not b!1036897) (not b!1036863) (not d!125081) (not b!1036841) (not b!1036332) (not b!1036885) (not b!1036510) (not b!1036712) (not b!1036526) (not d!125005) (not b!1036800) (not b!1036502) (not b!1036848) (not bm!43884) (not b!1036938) (not b!1036487) (not b!1036304) (not d!125029) (not b!1036575) (not b!1036523) (not d!125027) (not b!1036812) (not b!1036636) (not b!1036317) (not d!124883) (not bm!43890) (not b!1036485) (not b!1036404) (not b!1036319) (not b!1036641) (not b!1036311) (not b!1036717) (not b!1036557) (not b_lambda!16107) (not b!1036925) (not b!1036433) (not bm!43861) (not d!125095) (not b!1036937) (not b!1036603) (not b!1036466) (not d!124977) (not d!124939) (not d!124739) (not b!1036448) (not d!124827) (not d!125055) (not b!1036902) (not d!124733) (not b!1036649) (not b!1036627) (not b!1036822) (not b!1036786) (not b!1036554) (not b!1036463) (not d!124947) (not b!1036914) (not d!124937) (not b!1036471) (not b!1036875) (not b!1036715) (not b!1036651) (not b!1036707) (not b!1036916) (not d!125169) (not b!1036399) (not d!125045) (not b!1036777) (not b!1036492) (not b_next!20877) (not b!1036895) (not b!1036691) (not b!1036681) (not d!125051) (not b!1036770) (not b!1036415) (not b!1036858) (not d!125133) (not b!1036950) (not d!124751) (not b!1036884) (not bm!43880) (not b!1036785) (not b!1036281) (not b!1036540) (not b!1036935) (not d!124723) (not d!124891) (not b!1036929) (not b!1036906) (not d!124845) (not d!124795) (not d!125161) (not b!1036456) (not d!125111) (not b!1036445) (not b!1036494) (not b!1036668) (not b_lambda!16155) (not d!124995) (not d!125089) (not bm!43899) (not d!124959) (not b!1036443) (not b!1036403) (not b!1036820) (not b!1036831) (not b!1036287) (not d!124769) (not b!1036794) (not d!125107) (not b!1036909) (not b!1036876) (not b!1036746) (not bm!43889) (not b!1036948) (not d!125043) (not b_lambda!16115) (not b!1036940) (not b!1036760) (not b!1036692) (not b!1036431) (not b_lambda!16131) (not b_lambda!16153) (not b!1036608) (not b!1036735) (not b!1036684) (not b!1036435) (not d!124711) (not b_lambda!16133) (not b!1036653) (not b!1036899) (not b!1036535) (not d!124829) (not b!1036417) (not b!1036536) (not b!1036708) (not b!1036389) (not b!1036654) (not b!1036378) (not b!1036490) (not b!1036612) (not b!1036361) (not b!1036846) (not b!1036558) (not d!124749) (not b!1036427) (not d!124979) (not b!1036560) (not d!124981) (not b!1036537) (not d!125077) (not b!1036704) (not b!1036723) (not d!125165) (not d!124793) (not d!124967) (not b!1036600) (not b!1036514) (not b!1036744) (not d!124943) (not b!1036904) (not bm!43895) (not d!125039) (not b!1036701) (not d!125125) (not b!1036563) (not b!1036686) (not b!1036375) (not bm!43892) (not b!1036740) (not b!1036810) (not bm!43849) (not d!125103) (not b!1036869) (not b!1036680) (not d!124905) (not b!1036843) (not d!125105) (not b!1036761) (not b!1036611) (not d!124811) (not b!1036429) (not d!125017) (not d!124787) (not bm!43887) (not b!1036385) (not d!124791) (not b!1036805) (not b!1036911) (not b!1036518) (not d!124731) (not b!1036826) (not b!1036637) (not b_lambda!16129) (not b!1036725) (not b!1036743) (not b!1036703) (not d!124775) (not b!1036578) (not b!1036927) (not d!125171) (not d!124949) (not b!1036452) (not b!1036728) (not d!125163) (not b!1036423) (not bm!43897) (not bm!43866) (not d!124965) (not d!125167) (not b!1036835) (not b!1036394) (not d!124899) (not b!1036854) (not b!1036620) (not b!1036565) (not b!1036774) (not b!1036624) (not d!124917) (not d!124911) (not b!1036610) (not b!1036782) (not b!1036482) (not d!124797) (not b!1036307) (not d!124933) (not b!1036392) (not d!125135) (not b!1036397) (not b!1036331) (not d!124931) (not b!1036682) (not d!124969) (not b!1036737) (not bm!43882) (not b_lambda!16149) (not d!125087) (not d!125023) (not b_lambda!16147) (not d!124833) (not b!1036635) (not b!1036697) (not b!1036521) (not b!1036479) (not b!1036749) (not d!124871) (not b!1036766) (not d!125109) (not b!1036683) (not d!124747) (not b!1036752) (not d!125113) (not b!1036655) (not b!1036903) (not d!124713) (not b!1036368) (not b!1036947) (not b!1036772) (not d!124963) (not b!1036625) (not bm!43898) (not b!1036465) (not d!125075) (not d!124853) (not d!125153) (not d!125059) (not b!1036484) (not b!1036679) (not b!1036584) (not d!125145) (not b!1036438) (not d!125011) (not bm!43871))
(check-sat b_and!33411 (not b_next!20877))
