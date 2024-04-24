; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113058 () Bool)

(assert start!113058)

(declare-fun b_free!31063 () Bool)

(declare-fun b_next!31063 () Bool)

(assert (=> start!113058 (= b_free!31063 (not b_next!31063))))

(declare-fun tp!108839 () Bool)

(declare-fun b_and!50083 () Bool)

(assert (=> start!113058 (= tp!108839 b_and!50083)))

(declare-fun mapIsEmpty!57147 () Bool)

(declare-fun mapRes!57147 () Bool)

(assert (=> mapIsEmpty!57147 mapRes!57147))

(declare-fun b!1339507 () Bool)

(declare-fun res!888471 () Bool)

(declare-fun e!762817 () Bool)

(assert (=> b!1339507 (=> (not res!888471) (not e!762817))))

(declare-datatypes ((array!90925 0))(
  ( (array!90926 (arr!43920 (Array (_ BitVec 32) (_ BitVec 64))) (size!44471 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90925)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90925 (_ BitVec 32)) Bool)

(assert (=> b!1339507 (= res!888471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1339508 () Bool)

(declare-fun e!762819 () Bool)

(declare-fun tp_is_empty!36973 () Bool)

(assert (=> b!1339508 (= e!762819 tp_is_empty!36973)))

(declare-fun res!888469 () Bool)

(assert (=> start!113058 (=> (not res!888469) (not e!762817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113058 (= res!888469 (validMask!0 mask!1998))))

(assert (=> start!113058 e!762817))

(declare-datatypes ((V!54401 0))(
  ( (V!54402 (val!18561 Int)) )
))
(declare-datatypes ((ValueCell!17588 0))(
  ( (ValueCellFull!17588 (v!21201 V!54401)) (EmptyCell!17588) )
))
(declare-datatypes ((array!90927 0))(
  ( (array!90928 (arr!43921 (Array (_ BitVec 32) ValueCell!17588)) (size!44472 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90927)

(declare-fun e!762818 () Bool)

(declare-fun array_inv!33385 (array!90927) Bool)

(assert (=> start!113058 (and (array_inv!33385 _values!1320) e!762818)))

(assert (=> start!113058 true))

(declare-fun array_inv!33386 (array!90925) Bool)

(assert (=> start!113058 (array_inv!33386 _keys!1590)))

(assert (=> start!113058 tp!108839))

(assert (=> start!113058 tp_is_empty!36973))

(declare-fun b!1339509 () Bool)

(declare-fun res!888474 () Bool)

(assert (=> b!1339509 (=> (not res!888474) (not e!762817))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1339509 (= res!888474 (not (validKeyInArray!0 (select (arr!43920 _keys!1590) from!1980))))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun b!1339510 () Bool)

(declare-fun minValue!1262 () V!54401)

(declare-fun zeroValue!1262 () V!54401)

(declare-datatypes ((tuple2!23994 0))(
  ( (tuple2!23995 (_1!12008 (_ BitVec 64)) (_2!12008 V!54401)) )
))
(declare-datatypes ((List!31132 0))(
  ( (Nil!31129) (Cons!31128 (h!32346 tuple2!23994) (t!45454 List!31132)) )
))
(declare-datatypes ((ListLongMap!21659 0))(
  ( (ListLongMap!21660 (toList!10845 List!31132)) )
))
(declare-fun contains!9028 (ListLongMap!21659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5798 (array!90925 array!90927 (_ BitVec 32) (_ BitVec 32) V!54401 V!54401 (_ BitVec 32) Int) ListLongMap!21659)

(assert (=> b!1339510 (= e!762817 (not (contains!9028 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(declare-fun b!1339511 () Bool)

(declare-fun res!888473 () Bool)

(assert (=> b!1339511 (=> (not res!888473) (not e!762817))))

(assert (=> b!1339511 (= res!888473 (contains!9028 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1339512 () Bool)

(declare-fun res!888468 () Bool)

(assert (=> b!1339512 (=> (not res!888468) (not e!762817))))

(declare-datatypes ((List!31133 0))(
  ( (Nil!31130) (Cons!31129 (h!32347 (_ BitVec 64)) (t!45455 List!31133)) )
))
(declare-fun arrayNoDuplicates!0 (array!90925 (_ BitVec 32) List!31133) Bool)

(assert (=> b!1339512 (= res!888468 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31130))))

(declare-fun b!1339513 () Bool)

(assert (=> b!1339513 (= e!762818 (and e!762819 mapRes!57147))))

(declare-fun condMapEmpty!57147 () Bool)

(declare-fun mapDefault!57147 () ValueCell!17588)

(assert (=> b!1339513 (= condMapEmpty!57147 (= (arr!43921 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17588)) mapDefault!57147)))))

(declare-fun b!1339514 () Bool)

(declare-fun res!888472 () Bool)

(assert (=> b!1339514 (=> (not res!888472) (not e!762817))))

(assert (=> b!1339514 (= res!888472 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44471 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57147 () Bool)

(declare-fun tp!108840 () Bool)

(declare-fun e!762816 () Bool)

(assert (=> mapNonEmpty!57147 (= mapRes!57147 (and tp!108840 e!762816))))

(declare-fun mapValue!57147 () ValueCell!17588)

(declare-fun mapKey!57147 () (_ BitVec 32))

(declare-fun mapRest!57147 () (Array (_ BitVec 32) ValueCell!17588))

(assert (=> mapNonEmpty!57147 (= (arr!43921 _values!1320) (store mapRest!57147 mapKey!57147 mapValue!57147))))

(declare-fun b!1339515 () Bool)

(declare-fun res!888470 () Bool)

(assert (=> b!1339515 (=> (not res!888470) (not e!762817))))

(assert (=> b!1339515 (= res!888470 (and (= (size!44472 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44471 _keys!1590) (size!44472 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1339516 () Bool)

(declare-fun res!888467 () Bool)

(assert (=> b!1339516 (=> (not res!888467) (not e!762817))))

(assert (=> b!1339516 (= res!888467 (not (= (select (arr!43920 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1339517 () Bool)

(assert (=> b!1339517 (= e!762816 tp_is_empty!36973)))

(assert (= (and start!113058 res!888469) b!1339515))

(assert (= (and b!1339515 res!888470) b!1339507))

(assert (= (and b!1339507 res!888471) b!1339512))

(assert (= (and b!1339512 res!888468) b!1339514))

(assert (= (and b!1339514 res!888472) b!1339511))

(assert (= (and b!1339511 res!888473) b!1339516))

(assert (= (and b!1339516 res!888467) b!1339509))

(assert (= (and b!1339509 res!888474) b!1339510))

(assert (= (and b!1339513 condMapEmpty!57147) mapIsEmpty!57147))

(assert (= (and b!1339513 (not condMapEmpty!57147)) mapNonEmpty!57147))

(get-info :version)

(assert (= (and mapNonEmpty!57147 ((_ is ValueCellFull!17588) mapValue!57147)) b!1339517))

(assert (= (and b!1339513 ((_ is ValueCellFull!17588) mapDefault!57147)) b!1339508))

(assert (= start!113058 b!1339513))

(declare-fun m!1227945 () Bool)

(assert (=> b!1339507 m!1227945))

(declare-fun m!1227947 () Bool)

(assert (=> mapNonEmpty!57147 m!1227947))

(declare-fun m!1227949 () Bool)

(assert (=> b!1339509 m!1227949))

(assert (=> b!1339509 m!1227949))

(declare-fun m!1227951 () Bool)

(assert (=> b!1339509 m!1227951))

(declare-fun m!1227953 () Bool)

(assert (=> start!113058 m!1227953))

(declare-fun m!1227955 () Bool)

(assert (=> start!113058 m!1227955))

(declare-fun m!1227957 () Bool)

(assert (=> start!113058 m!1227957))

(declare-fun m!1227959 () Bool)

(assert (=> b!1339510 m!1227959))

(assert (=> b!1339510 m!1227959))

(declare-fun m!1227961 () Bool)

(assert (=> b!1339510 m!1227961))

(assert (=> b!1339516 m!1227949))

(declare-fun m!1227963 () Bool)

(assert (=> b!1339512 m!1227963))

(declare-fun m!1227965 () Bool)

(assert (=> b!1339511 m!1227965))

(assert (=> b!1339511 m!1227965))

(declare-fun m!1227967 () Bool)

(assert (=> b!1339511 m!1227967))

(check-sat b_and!50083 (not b_next!31063) (not start!113058) (not b!1339507) (not mapNonEmpty!57147) tp_is_empty!36973 (not b!1339509) (not b!1339511) (not b!1339510) (not b!1339512))
(check-sat b_and!50083 (not b_next!31063))
(get-model)

(declare-fun d!144361 () Bool)

(assert (=> d!144361 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!113058 d!144361))

(declare-fun d!144363 () Bool)

(assert (=> d!144363 (= (array_inv!33385 _values!1320) (bvsge (size!44472 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!113058 d!144363))

(declare-fun d!144365 () Bool)

(assert (=> d!144365 (= (array_inv!33386 _keys!1590) (bvsge (size!44471 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!113058 d!144365))

(declare-fun d!144367 () Bool)

(declare-fun e!762854 () Bool)

(assert (=> d!144367 e!762854))

(declare-fun res!888525 () Bool)

(assert (=> d!144367 (=> res!888525 e!762854)))

(declare-fun lt!594005 () Bool)

(assert (=> d!144367 (= res!888525 (not lt!594005))))

(declare-fun lt!594008 () Bool)

(assert (=> d!144367 (= lt!594005 lt!594008)))

(declare-datatypes ((Unit!43906 0))(
  ( (Unit!43907) )
))
(declare-fun lt!594007 () Unit!43906)

(declare-fun e!762855 () Unit!43906)

(assert (=> d!144367 (= lt!594007 e!762855)))

(declare-fun c!126606 () Bool)

(assert (=> d!144367 (= c!126606 lt!594008)))

(declare-fun containsKey!741 (List!31132 (_ BitVec 64)) Bool)

(assert (=> d!144367 (= lt!594008 (containsKey!741 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!144367 (= (contains!9028 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!594005)))

(declare-fun b!1339590 () Bool)

(declare-fun lt!594006 () Unit!43906)

(assert (=> b!1339590 (= e!762855 lt!594006)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!487 (List!31132 (_ BitVec 64)) Unit!43906)

(assert (=> b!1339590 (= lt!594006 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-datatypes ((Option!766 0))(
  ( (Some!765 (v!21204 V!54401)) (None!764) )
))
(declare-fun isDefined!524 (Option!766) Bool)

(declare-fun getValueByKey!715 (List!31132 (_ BitVec 64)) Option!766)

(assert (=> b!1339590 (isDefined!524 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1339591 () Bool)

(declare-fun Unit!43908 () Unit!43906)

(assert (=> b!1339591 (= e!762855 Unit!43908)))

(declare-fun b!1339592 () Bool)

(assert (=> b!1339592 (= e!762854 (isDefined!524 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!144367 c!126606) b!1339590))

(assert (= (and d!144367 (not c!126606)) b!1339591))

(assert (= (and d!144367 (not res!888525)) b!1339592))

(declare-fun m!1228017 () Bool)

(assert (=> d!144367 m!1228017))

(declare-fun m!1228019 () Bool)

(assert (=> b!1339590 m!1228019))

(declare-fun m!1228021 () Bool)

(assert (=> b!1339590 m!1228021))

(assert (=> b!1339590 m!1228021))

(declare-fun m!1228023 () Bool)

(assert (=> b!1339590 m!1228023))

(assert (=> b!1339592 m!1228021))

(assert (=> b!1339592 m!1228021))

(assert (=> b!1339592 m!1228023))

(assert (=> b!1339510 d!144367))

(declare-fun b!1339635 () Bool)

(declare-fun c!126623 () Bool)

(assert (=> b!1339635 (= c!126623 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762885 () ListLongMap!21659)

(declare-fun e!762894 () ListLongMap!21659)

(assert (=> b!1339635 (= e!762885 e!762894)))

(declare-fun b!1339636 () Bool)

(declare-fun e!762891 () Bool)

(declare-fun e!762883 () Bool)

(assert (=> b!1339636 (= e!762891 e!762883)))

(declare-fun c!126622 () Bool)

(assert (=> b!1339636 (= c!126622 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1339637 () Bool)

(declare-fun e!762888 () Bool)

(assert (=> b!1339637 (= e!762888 (validKeyInArray!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun c!126624 () Bool)

(declare-fun c!126621 () Bool)

(declare-fun call!65069 () ListLongMap!21659)

(declare-fun call!65068 () ListLongMap!21659)

(declare-fun call!65071 () ListLongMap!21659)

(declare-fun bm!65062 () Bool)

(declare-fun call!65070 () ListLongMap!21659)

(declare-fun +!4790 (ListLongMap!21659 tuple2!23994) ListLongMap!21659)

(assert (=> bm!65062 (= call!65071 (+!4790 (ite c!126621 call!65070 (ite c!126624 call!65069 call!65068)) (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1339638 () Bool)

(declare-fun e!762884 () Unit!43906)

(declare-fun Unit!43909 () Unit!43906)

(assert (=> b!1339638 (= e!762884 Unit!43909)))

(declare-fun b!1339639 () Bool)

(declare-fun e!762890 () ListLongMap!21659)

(assert (=> b!1339639 (= e!762890 (+!4790 call!65071 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1339640 () Bool)

(declare-fun e!762892 () Bool)

(declare-fun lt!594058 () ListLongMap!21659)

(declare-fun apply!1045 (ListLongMap!21659 (_ BitVec 64)) V!54401)

(assert (=> b!1339640 (= e!762892 (= (apply!1045 lt!594058 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!65063 () Bool)

(declare-fun call!65065 () Bool)

(assert (=> bm!65063 (= call!65065 (contains!9028 lt!594058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65064 () Bool)

(declare-fun call!65067 () ListLongMap!21659)

(assert (=> bm!65064 (= call!65067 call!65071)))

(declare-fun bm!65065 () Bool)

(declare-fun call!65066 () Bool)

(assert (=> bm!65065 (= call!65066 (contains!9028 lt!594058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339642 () Bool)

(assert (=> b!1339642 (= e!762894 call!65068)))

(declare-fun b!1339643 () Bool)

(declare-fun e!762889 () Bool)

(assert (=> b!1339643 (= e!762889 (= (apply!1045 lt!594058 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1339644 () Bool)

(assert (=> b!1339644 (= e!762883 e!762892)))

(declare-fun res!888547 () Bool)

(assert (=> b!1339644 (= res!888547 call!65065)))

(assert (=> b!1339644 (=> (not res!888547) (not e!762892))))

(declare-fun e!762882 () Bool)

(declare-fun b!1339645 () Bool)

(declare-fun get!22187 (ValueCell!17588 V!54401) V!54401)

(declare-fun dynLambda!3744 (Int (_ BitVec 64)) V!54401)

(assert (=> b!1339645 (= e!762882 (= (apply!1045 lt!594058 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22187 (select (arr!43921 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1339645 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44472 _values!1320)))))

(assert (=> b!1339645 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(declare-fun b!1339646 () Bool)

(declare-fun res!888552 () Bool)

(assert (=> b!1339646 (=> (not res!888552) (not e!762891))))

(declare-fun e!762887 () Bool)

(assert (=> b!1339646 (= res!888552 e!762887)))

(declare-fun c!126619 () Bool)

(assert (=> b!1339646 (= c!126619 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1339647 () Bool)

(declare-fun lt!594068 () Unit!43906)

(assert (=> b!1339647 (= e!762884 lt!594068)))

(declare-fun lt!594069 () ListLongMap!21659)

(declare-fun getCurrentListMapNoExtraKeys!6439 (array!90925 array!90927 (_ BitVec 32) (_ BitVec 32) V!54401 V!54401 (_ BitVec 32) Int) ListLongMap!21659)

(assert (=> b!1339647 (= lt!594069 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!594063 () (_ BitVec 64))

(assert (=> b!1339647 (= lt!594063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!594071 () (_ BitVec 64))

(assert (=> b!1339647 (= lt!594071 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!594073 () Unit!43906)

(declare-fun addStillContains!1197 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43906)

(assert (=> b!1339647 (= lt!594073 (addStillContains!1197 lt!594069 lt!594063 zeroValue!1262 lt!594071))))

(assert (=> b!1339647 (contains!9028 (+!4790 lt!594069 (tuple2!23995 lt!594063 zeroValue!1262)) lt!594071)))

(declare-fun lt!594072 () Unit!43906)

(assert (=> b!1339647 (= lt!594072 lt!594073)))

(declare-fun lt!594065 () ListLongMap!21659)

(assert (=> b!1339647 (= lt!594065 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!594053 () (_ BitVec 64))

(assert (=> b!1339647 (= lt!594053 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!594054 () (_ BitVec 64))

(assert (=> b!1339647 (= lt!594054 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!594056 () Unit!43906)

(declare-fun addApplyDifferent!574 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43906)

(assert (=> b!1339647 (= lt!594056 (addApplyDifferent!574 lt!594065 lt!594053 minValue!1262 lt!594054))))

(assert (=> b!1339647 (= (apply!1045 (+!4790 lt!594065 (tuple2!23995 lt!594053 minValue!1262)) lt!594054) (apply!1045 lt!594065 lt!594054))))

(declare-fun lt!594070 () Unit!43906)

(assert (=> b!1339647 (= lt!594070 lt!594056)))

(declare-fun lt!594062 () ListLongMap!21659)

(assert (=> b!1339647 (= lt!594062 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!594066 () (_ BitVec 64))

(assert (=> b!1339647 (= lt!594066 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!594061 () (_ BitVec 64))

(assert (=> b!1339647 (= lt!594061 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!594064 () Unit!43906)

(assert (=> b!1339647 (= lt!594064 (addApplyDifferent!574 lt!594062 lt!594066 zeroValue!1262 lt!594061))))

(assert (=> b!1339647 (= (apply!1045 (+!4790 lt!594062 (tuple2!23995 lt!594066 zeroValue!1262)) lt!594061) (apply!1045 lt!594062 lt!594061))))

(declare-fun lt!594060 () Unit!43906)

(assert (=> b!1339647 (= lt!594060 lt!594064)))

(declare-fun lt!594059 () ListLongMap!21659)

(assert (=> b!1339647 (= lt!594059 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!594067 () (_ BitVec 64))

(assert (=> b!1339647 (= lt!594067 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!594055 () (_ BitVec 64))

(assert (=> b!1339647 (= lt!594055 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1339647 (= lt!594068 (addApplyDifferent!574 lt!594059 lt!594067 minValue!1262 lt!594055))))

(assert (=> b!1339647 (= (apply!1045 (+!4790 lt!594059 (tuple2!23995 lt!594067 minValue!1262)) lt!594055) (apply!1045 lt!594059 lt!594055))))

(declare-fun b!1339648 () Bool)

(declare-fun e!762886 () Bool)

(assert (=> b!1339648 (= e!762886 e!762882)))

(declare-fun res!888548 () Bool)

(assert (=> b!1339648 (=> (not res!888548) (not e!762882))))

(assert (=> b!1339648 (= res!888548 (contains!9028 lt!594058 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1339648 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(declare-fun bm!65066 () Bool)

(assert (=> bm!65066 (= call!65068 call!65069)))

(declare-fun b!1339649 () Bool)

(assert (=> b!1339649 (= e!762894 call!65067)))

(declare-fun bm!65067 () Bool)

(assert (=> bm!65067 (= call!65069 call!65070)))

(declare-fun b!1339650 () Bool)

(declare-fun res!888544 () Bool)

(assert (=> b!1339650 (=> (not res!888544) (not e!762891))))

(assert (=> b!1339650 (= res!888544 e!762886)))

(declare-fun res!888550 () Bool)

(assert (=> b!1339650 (=> res!888550 e!762886)))

(assert (=> b!1339650 (= res!888550 (not e!762888))))

(declare-fun res!888551 () Bool)

(assert (=> b!1339650 (=> (not res!888551) (not e!762888))))

(assert (=> b!1339650 (= res!888551 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(declare-fun b!1339651 () Bool)

(assert (=> b!1339651 (= e!762887 e!762889)))

(declare-fun res!888549 () Bool)

(assert (=> b!1339651 (= res!888549 call!65066)))

(assert (=> b!1339651 (=> (not res!888549) (not e!762889))))

(declare-fun d!144369 () Bool)

(assert (=> d!144369 e!762891))

(declare-fun res!888545 () Bool)

(assert (=> d!144369 (=> (not res!888545) (not e!762891))))

(assert (=> d!144369 (= res!888545 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))))

(declare-fun lt!594057 () ListLongMap!21659)

(assert (=> d!144369 (= lt!594058 lt!594057)))

(declare-fun lt!594074 () Unit!43906)

(assert (=> d!144369 (= lt!594074 e!762884)))

(declare-fun c!126620 () Bool)

(declare-fun e!762893 () Bool)

(assert (=> d!144369 (= c!126620 e!762893)))

(declare-fun res!888546 () Bool)

(assert (=> d!144369 (=> (not res!888546) (not e!762893))))

(assert (=> d!144369 (= res!888546 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(assert (=> d!144369 (= lt!594057 e!762890)))

(assert (=> d!144369 (= c!126621 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144369 (validMask!0 mask!1998)))

(assert (=> d!144369 (= (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!594058)))

(declare-fun b!1339641 () Bool)

(assert (=> b!1339641 (= e!762883 (not call!65065))))

(declare-fun b!1339652 () Bool)

(assert (=> b!1339652 (= e!762887 (not call!65066))))

(declare-fun bm!65068 () Bool)

(assert (=> bm!65068 (= call!65070 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1339653 () Bool)

(assert (=> b!1339653 (= e!762885 call!65067)))

(declare-fun b!1339654 () Bool)

(assert (=> b!1339654 (= e!762893 (validKeyInArray!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1339655 () Bool)

(assert (=> b!1339655 (= e!762890 e!762885)))

(assert (=> b!1339655 (= c!126624 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!144369 c!126621) b!1339639))

(assert (= (and d!144369 (not c!126621)) b!1339655))

(assert (= (and b!1339655 c!126624) b!1339653))

(assert (= (and b!1339655 (not c!126624)) b!1339635))

(assert (= (and b!1339635 c!126623) b!1339649))

(assert (= (and b!1339635 (not c!126623)) b!1339642))

(assert (= (or b!1339649 b!1339642) bm!65066))

(assert (= (or b!1339653 bm!65066) bm!65067))

(assert (= (or b!1339653 b!1339649) bm!65064))

(assert (= (or b!1339639 bm!65067) bm!65068))

(assert (= (or b!1339639 bm!65064) bm!65062))

(assert (= (and d!144369 res!888546) b!1339654))

(assert (= (and d!144369 c!126620) b!1339647))

(assert (= (and d!144369 (not c!126620)) b!1339638))

(assert (= (and d!144369 res!888545) b!1339650))

(assert (= (and b!1339650 res!888551) b!1339637))

(assert (= (and b!1339650 (not res!888550)) b!1339648))

(assert (= (and b!1339648 res!888548) b!1339645))

(assert (= (and b!1339650 res!888544) b!1339646))

(assert (= (and b!1339646 c!126619) b!1339651))

(assert (= (and b!1339646 (not c!126619)) b!1339652))

(assert (= (and b!1339651 res!888549) b!1339643))

(assert (= (or b!1339651 b!1339652) bm!65065))

(assert (= (and b!1339646 res!888552) b!1339636))

(assert (= (and b!1339636 c!126622) b!1339644))

(assert (= (and b!1339636 (not c!126622)) b!1339641))

(assert (= (and b!1339644 res!888547) b!1339640))

(assert (= (or b!1339644 b!1339641) bm!65063))

(declare-fun b_lambda!24269 () Bool)

(assert (=> (not b_lambda!24269) (not b!1339645)))

(declare-fun t!45460 () Bool)

(declare-fun tb!12127 () Bool)

(assert (=> (and start!113058 (= defaultEntry!1323 defaultEntry!1323) t!45460) tb!12127))

(declare-fun result!25341 () Bool)

(assert (=> tb!12127 (= result!25341 tp_is_empty!36973)))

(assert (=> b!1339645 t!45460))

(declare-fun b_and!50089 () Bool)

(assert (= b_and!50083 (and (=> t!45460 result!25341) b_and!50089)))

(declare-fun m!1228025 () Bool)

(assert (=> bm!65062 m!1228025))

(declare-fun m!1228027 () Bool)

(assert (=> b!1339639 m!1228027))

(declare-fun m!1228029 () Bool)

(assert (=> b!1339654 m!1228029))

(assert (=> b!1339654 m!1228029))

(declare-fun m!1228031 () Bool)

(assert (=> b!1339654 m!1228031))

(assert (=> b!1339648 m!1228029))

(assert (=> b!1339648 m!1228029))

(declare-fun m!1228033 () Bool)

(assert (=> b!1339648 m!1228033))

(assert (=> b!1339637 m!1228029))

(assert (=> b!1339637 m!1228029))

(assert (=> b!1339637 m!1228031))

(declare-fun m!1228035 () Bool)

(assert (=> bm!65065 m!1228035))

(declare-fun m!1228037 () Bool)

(assert (=> bm!65063 m!1228037))

(assert (=> d!144369 m!1227953))

(declare-fun m!1228039 () Bool)

(assert (=> bm!65068 m!1228039))

(assert (=> b!1339645 m!1228029))

(declare-fun m!1228041 () Bool)

(assert (=> b!1339645 m!1228041))

(assert (=> b!1339645 m!1228029))

(declare-fun m!1228043 () Bool)

(assert (=> b!1339645 m!1228043))

(declare-fun m!1228045 () Bool)

(assert (=> b!1339645 m!1228045))

(assert (=> b!1339645 m!1228045))

(assert (=> b!1339645 m!1228043))

(declare-fun m!1228047 () Bool)

(assert (=> b!1339645 m!1228047))

(declare-fun m!1228049 () Bool)

(assert (=> b!1339647 m!1228049))

(declare-fun m!1228051 () Bool)

(assert (=> b!1339647 m!1228051))

(declare-fun m!1228053 () Bool)

(assert (=> b!1339647 m!1228053))

(declare-fun m!1228055 () Bool)

(assert (=> b!1339647 m!1228055))

(assert (=> b!1339647 m!1228053))

(declare-fun m!1228057 () Bool)

(assert (=> b!1339647 m!1228057))

(declare-fun m!1228059 () Bool)

(assert (=> b!1339647 m!1228059))

(assert (=> b!1339647 m!1228049))

(assert (=> b!1339647 m!1228029))

(assert (=> b!1339647 m!1228059))

(declare-fun m!1228061 () Bool)

(assert (=> b!1339647 m!1228061))

(declare-fun m!1228063 () Bool)

(assert (=> b!1339647 m!1228063))

(declare-fun m!1228065 () Bool)

(assert (=> b!1339647 m!1228065))

(declare-fun m!1228067 () Bool)

(assert (=> b!1339647 m!1228067))

(declare-fun m!1228069 () Bool)

(assert (=> b!1339647 m!1228069))

(assert (=> b!1339647 m!1228039))

(declare-fun m!1228071 () Bool)

(assert (=> b!1339647 m!1228071))

(assert (=> b!1339647 m!1228067))

(declare-fun m!1228073 () Bool)

(assert (=> b!1339647 m!1228073))

(declare-fun m!1228075 () Bool)

(assert (=> b!1339647 m!1228075))

(declare-fun m!1228077 () Bool)

(assert (=> b!1339647 m!1228077))

(declare-fun m!1228079 () Bool)

(assert (=> b!1339643 m!1228079))

(declare-fun m!1228081 () Bool)

(assert (=> b!1339640 m!1228081))

(assert (=> b!1339510 d!144369))

(declare-fun d!144371 () Bool)

(declare-fun e!762895 () Bool)

(assert (=> d!144371 e!762895))

(declare-fun res!888553 () Bool)

(assert (=> d!144371 (=> res!888553 e!762895)))

(declare-fun lt!594075 () Bool)

(assert (=> d!144371 (= res!888553 (not lt!594075))))

(declare-fun lt!594078 () Bool)

(assert (=> d!144371 (= lt!594075 lt!594078)))

(declare-fun lt!594077 () Unit!43906)

(declare-fun e!762896 () Unit!43906)

(assert (=> d!144371 (= lt!594077 e!762896)))

(declare-fun c!126625 () Bool)

(assert (=> d!144371 (= c!126625 lt!594078)))

(assert (=> d!144371 (= lt!594078 (containsKey!741 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!144371 (= (contains!9028 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!594075)))

(declare-fun b!1339658 () Bool)

(declare-fun lt!594076 () Unit!43906)

(assert (=> b!1339658 (= e!762896 lt!594076)))

(assert (=> b!1339658 (= lt!594076 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1339658 (isDefined!524 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1339659 () Bool)

(declare-fun Unit!43910 () Unit!43906)

(assert (=> b!1339659 (= e!762896 Unit!43910)))

(declare-fun b!1339660 () Bool)

(assert (=> b!1339660 (= e!762895 (isDefined!524 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!144371 c!126625) b!1339658))

(assert (= (and d!144371 (not c!126625)) b!1339659))

(assert (= (and d!144371 (not res!888553)) b!1339660))

(declare-fun m!1228083 () Bool)

(assert (=> d!144371 m!1228083))

(declare-fun m!1228085 () Bool)

(assert (=> b!1339658 m!1228085))

(declare-fun m!1228087 () Bool)

(assert (=> b!1339658 m!1228087))

(assert (=> b!1339658 m!1228087))

(declare-fun m!1228089 () Bool)

(assert (=> b!1339658 m!1228089))

(assert (=> b!1339660 m!1228087))

(assert (=> b!1339660 m!1228087))

(assert (=> b!1339660 m!1228089))

(assert (=> b!1339511 d!144371))

(declare-fun b!1339661 () Bool)

(declare-fun c!126630 () Bool)

(assert (=> b!1339661 (= c!126630 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762900 () ListLongMap!21659)

(declare-fun e!762909 () ListLongMap!21659)

(assert (=> b!1339661 (= e!762900 e!762909)))

(declare-fun b!1339662 () Bool)

(declare-fun e!762906 () Bool)

(declare-fun e!762898 () Bool)

(assert (=> b!1339662 (= e!762906 e!762898)))

(declare-fun c!126629 () Bool)

(assert (=> b!1339662 (= c!126629 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1339663 () Bool)

(declare-fun e!762903 () Bool)

(assert (=> b!1339663 (= e!762903 (validKeyInArray!0 (select (arr!43920 _keys!1590) from!1980)))))

(declare-fun call!65078 () ListLongMap!21659)

(declare-fun bm!65069 () Bool)

(declare-fun c!126631 () Bool)

(declare-fun c!126628 () Bool)

(declare-fun call!65076 () ListLongMap!21659)

(declare-fun call!65075 () ListLongMap!21659)

(declare-fun call!65077 () ListLongMap!21659)

(assert (=> bm!65069 (= call!65078 (+!4790 (ite c!126628 call!65077 (ite c!126631 call!65076 call!65075)) (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1339664 () Bool)

(declare-fun e!762899 () Unit!43906)

(declare-fun Unit!43911 () Unit!43906)

(assert (=> b!1339664 (= e!762899 Unit!43911)))

(declare-fun b!1339665 () Bool)

(declare-fun e!762905 () ListLongMap!21659)

(assert (=> b!1339665 (= e!762905 (+!4790 call!65078 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1339666 () Bool)

(declare-fun e!762907 () Bool)

(declare-fun lt!594084 () ListLongMap!21659)

(assert (=> b!1339666 (= e!762907 (= (apply!1045 lt!594084 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!65070 () Bool)

(declare-fun call!65072 () Bool)

(assert (=> bm!65070 (= call!65072 (contains!9028 lt!594084 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65071 () Bool)

(declare-fun call!65074 () ListLongMap!21659)

(assert (=> bm!65071 (= call!65074 call!65078)))

(declare-fun bm!65072 () Bool)

(declare-fun call!65073 () Bool)

(assert (=> bm!65072 (= call!65073 (contains!9028 lt!594084 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339668 () Bool)

(assert (=> b!1339668 (= e!762909 call!65075)))

(declare-fun b!1339669 () Bool)

(declare-fun e!762904 () Bool)

(assert (=> b!1339669 (= e!762904 (= (apply!1045 lt!594084 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1339670 () Bool)

(assert (=> b!1339670 (= e!762898 e!762907)))

(declare-fun res!888557 () Bool)

(assert (=> b!1339670 (= res!888557 call!65072)))

(assert (=> b!1339670 (=> (not res!888557) (not e!762907))))

(declare-fun e!762897 () Bool)

(declare-fun b!1339671 () Bool)

(assert (=> b!1339671 (= e!762897 (= (apply!1045 lt!594084 (select (arr!43920 _keys!1590) from!1980)) (get!22187 (select (arr!43921 _values!1320) from!1980) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1339671 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44472 _values!1320)))))

(assert (=> b!1339671 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44471 _keys!1590)))))

(declare-fun b!1339672 () Bool)

(declare-fun res!888562 () Bool)

(assert (=> b!1339672 (=> (not res!888562) (not e!762906))))

(declare-fun e!762902 () Bool)

(assert (=> b!1339672 (= res!888562 e!762902)))

(declare-fun c!126626 () Bool)

(assert (=> b!1339672 (= c!126626 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1339673 () Bool)

(declare-fun lt!594094 () Unit!43906)

(assert (=> b!1339673 (= e!762899 lt!594094)))

(declare-fun lt!594095 () ListLongMap!21659)

(assert (=> b!1339673 (= lt!594095 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!594089 () (_ BitVec 64))

(assert (=> b!1339673 (= lt!594089 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!594097 () (_ BitVec 64))

(assert (=> b!1339673 (= lt!594097 (select (arr!43920 _keys!1590) from!1980))))

(declare-fun lt!594099 () Unit!43906)

(assert (=> b!1339673 (= lt!594099 (addStillContains!1197 lt!594095 lt!594089 zeroValue!1262 lt!594097))))

(assert (=> b!1339673 (contains!9028 (+!4790 lt!594095 (tuple2!23995 lt!594089 zeroValue!1262)) lt!594097)))

(declare-fun lt!594098 () Unit!43906)

(assert (=> b!1339673 (= lt!594098 lt!594099)))

(declare-fun lt!594091 () ListLongMap!21659)

(assert (=> b!1339673 (= lt!594091 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!594079 () (_ BitVec 64))

(assert (=> b!1339673 (= lt!594079 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!594080 () (_ BitVec 64))

(assert (=> b!1339673 (= lt!594080 (select (arr!43920 _keys!1590) from!1980))))

(declare-fun lt!594082 () Unit!43906)

(assert (=> b!1339673 (= lt!594082 (addApplyDifferent!574 lt!594091 lt!594079 minValue!1262 lt!594080))))

(assert (=> b!1339673 (= (apply!1045 (+!4790 lt!594091 (tuple2!23995 lt!594079 minValue!1262)) lt!594080) (apply!1045 lt!594091 lt!594080))))

(declare-fun lt!594096 () Unit!43906)

(assert (=> b!1339673 (= lt!594096 lt!594082)))

(declare-fun lt!594088 () ListLongMap!21659)

(assert (=> b!1339673 (= lt!594088 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!594092 () (_ BitVec 64))

(assert (=> b!1339673 (= lt!594092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!594087 () (_ BitVec 64))

(assert (=> b!1339673 (= lt!594087 (select (arr!43920 _keys!1590) from!1980))))

(declare-fun lt!594090 () Unit!43906)

(assert (=> b!1339673 (= lt!594090 (addApplyDifferent!574 lt!594088 lt!594092 zeroValue!1262 lt!594087))))

(assert (=> b!1339673 (= (apply!1045 (+!4790 lt!594088 (tuple2!23995 lt!594092 zeroValue!1262)) lt!594087) (apply!1045 lt!594088 lt!594087))))

(declare-fun lt!594086 () Unit!43906)

(assert (=> b!1339673 (= lt!594086 lt!594090)))

(declare-fun lt!594085 () ListLongMap!21659)

(assert (=> b!1339673 (= lt!594085 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!594093 () (_ BitVec 64))

(assert (=> b!1339673 (= lt!594093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!594081 () (_ BitVec 64))

(assert (=> b!1339673 (= lt!594081 (select (arr!43920 _keys!1590) from!1980))))

(assert (=> b!1339673 (= lt!594094 (addApplyDifferent!574 lt!594085 lt!594093 minValue!1262 lt!594081))))

(assert (=> b!1339673 (= (apply!1045 (+!4790 lt!594085 (tuple2!23995 lt!594093 minValue!1262)) lt!594081) (apply!1045 lt!594085 lt!594081))))

(declare-fun b!1339674 () Bool)

(declare-fun e!762901 () Bool)

(assert (=> b!1339674 (= e!762901 e!762897)))

(declare-fun res!888558 () Bool)

(assert (=> b!1339674 (=> (not res!888558) (not e!762897))))

(assert (=> b!1339674 (= res!888558 (contains!9028 lt!594084 (select (arr!43920 _keys!1590) from!1980)))))

(assert (=> b!1339674 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44471 _keys!1590)))))

(declare-fun bm!65073 () Bool)

(assert (=> bm!65073 (= call!65075 call!65076)))

(declare-fun b!1339675 () Bool)

(assert (=> b!1339675 (= e!762909 call!65074)))

(declare-fun bm!65074 () Bool)

(assert (=> bm!65074 (= call!65076 call!65077)))

(declare-fun b!1339676 () Bool)

(declare-fun res!888554 () Bool)

(assert (=> b!1339676 (=> (not res!888554) (not e!762906))))

(assert (=> b!1339676 (= res!888554 e!762901)))

(declare-fun res!888560 () Bool)

(assert (=> b!1339676 (=> res!888560 e!762901)))

(assert (=> b!1339676 (= res!888560 (not e!762903))))

(declare-fun res!888561 () Bool)

(assert (=> b!1339676 (=> (not res!888561) (not e!762903))))

(assert (=> b!1339676 (= res!888561 (bvslt from!1980 (size!44471 _keys!1590)))))

(declare-fun b!1339677 () Bool)

(assert (=> b!1339677 (= e!762902 e!762904)))

(declare-fun res!888559 () Bool)

(assert (=> b!1339677 (= res!888559 call!65073)))

(assert (=> b!1339677 (=> (not res!888559) (not e!762904))))

(declare-fun d!144373 () Bool)

(assert (=> d!144373 e!762906))

(declare-fun res!888555 () Bool)

(assert (=> d!144373 (=> (not res!888555) (not e!762906))))

(assert (=> d!144373 (= res!888555 (or (bvsge from!1980 (size!44471 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44471 _keys!1590)))))))

(declare-fun lt!594083 () ListLongMap!21659)

(assert (=> d!144373 (= lt!594084 lt!594083)))

(declare-fun lt!594100 () Unit!43906)

(assert (=> d!144373 (= lt!594100 e!762899)))

(declare-fun c!126627 () Bool)

(declare-fun e!762908 () Bool)

(assert (=> d!144373 (= c!126627 e!762908)))

(declare-fun res!888556 () Bool)

(assert (=> d!144373 (=> (not res!888556) (not e!762908))))

(assert (=> d!144373 (= res!888556 (bvslt from!1980 (size!44471 _keys!1590)))))

(assert (=> d!144373 (= lt!594083 e!762905)))

(assert (=> d!144373 (= c!126628 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144373 (validMask!0 mask!1998)))

(assert (=> d!144373 (= (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!594084)))

(declare-fun b!1339667 () Bool)

(assert (=> b!1339667 (= e!762898 (not call!65072))))

(declare-fun b!1339678 () Bool)

(assert (=> b!1339678 (= e!762902 (not call!65073))))

(declare-fun bm!65075 () Bool)

(assert (=> bm!65075 (= call!65077 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1339679 () Bool)

(assert (=> b!1339679 (= e!762900 call!65074)))

(declare-fun b!1339680 () Bool)

(assert (=> b!1339680 (= e!762908 (validKeyInArray!0 (select (arr!43920 _keys!1590) from!1980)))))

(declare-fun b!1339681 () Bool)

(assert (=> b!1339681 (= e!762905 e!762900)))

(assert (=> b!1339681 (= c!126631 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!144373 c!126628) b!1339665))

(assert (= (and d!144373 (not c!126628)) b!1339681))

(assert (= (and b!1339681 c!126631) b!1339679))

(assert (= (and b!1339681 (not c!126631)) b!1339661))

(assert (= (and b!1339661 c!126630) b!1339675))

(assert (= (and b!1339661 (not c!126630)) b!1339668))

(assert (= (or b!1339675 b!1339668) bm!65073))

(assert (= (or b!1339679 bm!65073) bm!65074))

(assert (= (or b!1339679 b!1339675) bm!65071))

(assert (= (or b!1339665 bm!65074) bm!65075))

(assert (= (or b!1339665 bm!65071) bm!65069))

(assert (= (and d!144373 res!888556) b!1339680))

(assert (= (and d!144373 c!126627) b!1339673))

(assert (= (and d!144373 (not c!126627)) b!1339664))

(assert (= (and d!144373 res!888555) b!1339676))

(assert (= (and b!1339676 res!888561) b!1339663))

(assert (= (and b!1339676 (not res!888560)) b!1339674))

(assert (= (and b!1339674 res!888558) b!1339671))

(assert (= (and b!1339676 res!888554) b!1339672))

(assert (= (and b!1339672 c!126626) b!1339677))

(assert (= (and b!1339672 (not c!126626)) b!1339678))

(assert (= (and b!1339677 res!888559) b!1339669))

(assert (= (or b!1339677 b!1339678) bm!65072))

(assert (= (and b!1339672 res!888562) b!1339662))

(assert (= (and b!1339662 c!126629) b!1339670))

(assert (= (and b!1339662 (not c!126629)) b!1339667))

(assert (= (and b!1339670 res!888557) b!1339666))

(assert (= (or b!1339670 b!1339667) bm!65070))

(declare-fun b_lambda!24271 () Bool)

(assert (=> (not b_lambda!24271) (not b!1339671)))

(assert (=> b!1339671 t!45460))

(declare-fun b_and!50091 () Bool)

(assert (= b_and!50089 (and (=> t!45460 result!25341) b_and!50091)))

(declare-fun m!1228091 () Bool)

(assert (=> bm!65069 m!1228091))

(declare-fun m!1228093 () Bool)

(assert (=> b!1339665 m!1228093))

(assert (=> b!1339680 m!1227949))

(assert (=> b!1339680 m!1227949))

(assert (=> b!1339680 m!1227951))

(assert (=> b!1339674 m!1227949))

(assert (=> b!1339674 m!1227949))

(declare-fun m!1228095 () Bool)

(assert (=> b!1339674 m!1228095))

(assert (=> b!1339663 m!1227949))

(assert (=> b!1339663 m!1227949))

(assert (=> b!1339663 m!1227951))

(declare-fun m!1228097 () Bool)

(assert (=> bm!65072 m!1228097))

(declare-fun m!1228099 () Bool)

(assert (=> bm!65070 m!1228099))

(assert (=> d!144373 m!1227953))

(declare-fun m!1228101 () Bool)

(assert (=> bm!65075 m!1228101))

(assert (=> b!1339671 m!1227949))

(declare-fun m!1228103 () Bool)

(assert (=> b!1339671 m!1228103))

(assert (=> b!1339671 m!1227949))

(assert (=> b!1339671 m!1228043))

(declare-fun m!1228105 () Bool)

(assert (=> b!1339671 m!1228105))

(assert (=> b!1339671 m!1228105))

(assert (=> b!1339671 m!1228043))

(declare-fun m!1228107 () Bool)

(assert (=> b!1339671 m!1228107))

(declare-fun m!1228109 () Bool)

(assert (=> b!1339673 m!1228109))

(declare-fun m!1228111 () Bool)

(assert (=> b!1339673 m!1228111))

(declare-fun m!1228113 () Bool)

(assert (=> b!1339673 m!1228113))

(declare-fun m!1228115 () Bool)

(assert (=> b!1339673 m!1228115))

(assert (=> b!1339673 m!1228113))

(declare-fun m!1228117 () Bool)

(assert (=> b!1339673 m!1228117))

(declare-fun m!1228119 () Bool)

(assert (=> b!1339673 m!1228119))

(assert (=> b!1339673 m!1228109))

(assert (=> b!1339673 m!1227949))

(assert (=> b!1339673 m!1228119))

(declare-fun m!1228121 () Bool)

(assert (=> b!1339673 m!1228121))

(declare-fun m!1228123 () Bool)

(assert (=> b!1339673 m!1228123))

(declare-fun m!1228125 () Bool)

(assert (=> b!1339673 m!1228125))

(declare-fun m!1228127 () Bool)

(assert (=> b!1339673 m!1228127))

(declare-fun m!1228129 () Bool)

(assert (=> b!1339673 m!1228129))

(assert (=> b!1339673 m!1228101))

(declare-fun m!1228131 () Bool)

(assert (=> b!1339673 m!1228131))

(assert (=> b!1339673 m!1228127))

(declare-fun m!1228133 () Bool)

(assert (=> b!1339673 m!1228133))

(declare-fun m!1228135 () Bool)

(assert (=> b!1339673 m!1228135))

(declare-fun m!1228137 () Bool)

(assert (=> b!1339673 m!1228137))

(declare-fun m!1228139 () Bool)

(assert (=> b!1339669 m!1228139))

(declare-fun m!1228141 () Bool)

(assert (=> b!1339666 m!1228141))

(assert (=> b!1339511 d!144373))

(declare-fun b!1339692 () Bool)

(declare-fun e!762920 () Bool)

(declare-fun call!65081 () Bool)

(assert (=> b!1339692 (= e!762920 call!65081)))

(declare-fun b!1339693 () Bool)

(declare-fun e!762921 () Bool)

(declare-fun contains!9031 (List!31133 (_ BitVec 64)) Bool)

(assert (=> b!1339693 (= e!762921 (contains!9031 Nil!31130 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1339694 () Bool)

(assert (=> b!1339694 (= e!762920 call!65081)))

(declare-fun b!1339695 () Bool)

(declare-fun e!762918 () Bool)

(declare-fun e!762919 () Bool)

(assert (=> b!1339695 (= e!762918 e!762919)))

(declare-fun res!888570 () Bool)

(assert (=> b!1339695 (=> (not res!888570) (not e!762919))))

(assert (=> b!1339695 (= res!888570 (not e!762921))))

(declare-fun res!888569 () Bool)

(assert (=> b!1339695 (=> (not res!888569) (not e!762921))))

(assert (=> b!1339695 (= res!888569 (validKeyInArray!0 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!144375 () Bool)

(declare-fun res!888571 () Bool)

(assert (=> d!144375 (=> res!888571 e!762918)))

(assert (=> d!144375 (= res!888571 (bvsge #b00000000000000000000000000000000 (size!44471 _keys!1590)))))

(assert (=> d!144375 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31130) e!762918)))

(declare-fun b!1339696 () Bool)

(assert (=> b!1339696 (= e!762919 e!762920)))

(declare-fun c!126634 () Bool)

(assert (=> b!1339696 (= c!126634 (validKeyInArray!0 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!65078 () Bool)

(assert (=> bm!65078 (= call!65081 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126634 (Cons!31129 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) Nil!31130) Nil!31130)))))

(assert (= (and d!144375 (not res!888571)) b!1339695))

(assert (= (and b!1339695 res!888569) b!1339693))

(assert (= (and b!1339695 res!888570) b!1339696))

(assert (= (and b!1339696 c!126634) b!1339694))

(assert (= (and b!1339696 (not c!126634)) b!1339692))

(assert (= (or b!1339694 b!1339692) bm!65078))

(declare-fun m!1228143 () Bool)

(assert (=> b!1339693 m!1228143))

(assert (=> b!1339693 m!1228143))

(declare-fun m!1228145 () Bool)

(assert (=> b!1339693 m!1228145))

(assert (=> b!1339695 m!1228143))

(assert (=> b!1339695 m!1228143))

(declare-fun m!1228147 () Bool)

(assert (=> b!1339695 m!1228147))

(assert (=> b!1339696 m!1228143))

(assert (=> b!1339696 m!1228143))

(assert (=> b!1339696 m!1228147))

(assert (=> bm!65078 m!1228143))

(declare-fun m!1228149 () Bool)

(assert (=> bm!65078 m!1228149))

(assert (=> b!1339512 d!144375))

(declare-fun b!1339705 () Bool)

(declare-fun e!762930 () Bool)

(declare-fun call!65084 () Bool)

(assert (=> b!1339705 (= e!762930 call!65084)))

(declare-fun d!144377 () Bool)

(declare-fun res!888577 () Bool)

(declare-fun e!762928 () Bool)

(assert (=> d!144377 (=> res!888577 e!762928)))

(assert (=> d!144377 (= res!888577 (bvsge #b00000000000000000000000000000000 (size!44471 _keys!1590)))))

(assert (=> d!144377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!762928)))

(declare-fun b!1339706 () Bool)

(declare-fun e!762929 () Bool)

(assert (=> b!1339706 (= e!762930 e!762929)))

(declare-fun lt!594107 () (_ BitVec 64))

(assert (=> b!1339706 (= lt!594107 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!594109 () Unit!43906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90925 (_ BitVec 64) (_ BitVec 32)) Unit!43906)

(assert (=> b!1339706 (= lt!594109 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!594107 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1339706 (arrayContainsKey!0 _keys!1590 lt!594107 #b00000000000000000000000000000000)))

(declare-fun lt!594108 () Unit!43906)

(assert (=> b!1339706 (= lt!594108 lt!594109)))

(declare-fun res!888576 () Bool)

(declare-datatypes ((SeekEntryResult!10007 0))(
  ( (MissingZero!10007 (index!42399 (_ BitVec 32))) (Found!10007 (index!42400 (_ BitVec 32))) (Intermediate!10007 (undefined!10819 Bool) (index!42401 (_ BitVec 32)) (x!119523 (_ BitVec 32))) (Undefined!10007) (MissingVacant!10007 (index!42402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90925 (_ BitVec 32)) SeekEntryResult!10007)

(assert (=> b!1339706 (= res!888576 (= (seekEntryOrOpen!0 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10007 #b00000000000000000000000000000000)))))

(assert (=> b!1339706 (=> (not res!888576) (not e!762929))))

(declare-fun bm!65081 () Bool)

(assert (=> bm!65081 (= call!65084 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1339707 () Bool)

(assert (=> b!1339707 (= e!762928 e!762930)))

(declare-fun c!126637 () Bool)

(assert (=> b!1339707 (= c!126637 (validKeyInArray!0 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1339708 () Bool)

(assert (=> b!1339708 (= e!762929 call!65084)))

(assert (= (and d!144377 (not res!888577)) b!1339707))

(assert (= (and b!1339707 c!126637) b!1339706))

(assert (= (and b!1339707 (not c!126637)) b!1339705))

(assert (= (and b!1339706 res!888576) b!1339708))

(assert (= (or b!1339708 b!1339705) bm!65081))

(assert (=> b!1339706 m!1228143))

(declare-fun m!1228151 () Bool)

(assert (=> b!1339706 m!1228151))

(declare-fun m!1228153 () Bool)

(assert (=> b!1339706 m!1228153))

(assert (=> b!1339706 m!1228143))

(declare-fun m!1228155 () Bool)

(assert (=> b!1339706 m!1228155))

(declare-fun m!1228157 () Bool)

(assert (=> bm!65081 m!1228157))

(assert (=> b!1339707 m!1228143))

(assert (=> b!1339707 m!1228143))

(assert (=> b!1339707 m!1228147))

(assert (=> b!1339507 d!144377))

(declare-fun d!144379 () Bool)

(assert (=> d!144379 (= (validKeyInArray!0 (select (arr!43920 _keys!1590) from!1980)) (and (not (= (select (arr!43920 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43920 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1339509 d!144379))

(declare-fun condMapEmpty!57156 () Bool)

(declare-fun mapDefault!57156 () ValueCell!17588)

(assert (=> mapNonEmpty!57147 (= condMapEmpty!57156 (= mapRest!57147 ((as const (Array (_ BitVec 32) ValueCell!17588)) mapDefault!57156)))))

(declare-fun e!762935 () Bool)

(declare-fun mapRes!57156 () Bool)

(assert (=> mapNonEmpty!57147 (= tp!108840 (and e!762935 mapRes!57156))))

(declare-fun b!1339715 () Bool)

(declare-fun e!762936 () Bool)

(assert (=> b!1339715 (= e!762936 tp_is_empty!36973)))

(declare-fun mapIsEmpty!57156 () Bool)

(assert (=> mapIsEmpty!57156 mapRes!57156))

(declare-fun mapNonEmpty!57156 () Bool)

(declare-fun tp!108855 () Bool)

(assert (=> mapNonEmpty!57156 (= mapRes!57156 (and tp!108855 e!762936))))

(declare-fun mapKey!57156 () (_ BitVec 32))

(declare-fun mapRest!57156 () (Array (_ BitVec 32) ValueCell!17588))

(declare-fun mapValue!57156 () ValueCell!17588)

(assert (=> mapNonEmpty!57156 (= mapRest!57147 (store mapRest!57156 mapKey!57156 mapValue!57156))))

(declare-fun b!1339716 () Bool)

(assert (=> b!1339716 (= e!762935 tp_is_empty!36973)))

(assert (= (and mapNonEmpty!57147 condMapEmpty!57156) mapIsEmpty!57156))

(assert (= (and mapNonEmpty!57147 (not condMapEmpty!57156)) mapNonEmpty!57156))

(assert (= (and mapNonEmpty!57156 ((_ is ValueCellFull!17588) mapValue!57156)) b!1339715))

(assert (= (and mapNonEmpty!57147 ((_ is ValueCellFull!17588) mapDefault!57156)) b!1339716))

(declare-fun m!1228159 () Bool)

(assert (=> mapNonEmpty!57156 m!1228159))

(declare-fun b_lambda!24273 () Bool)

(assert (= b_lambda!24271 (or (and start!113058 b_free!31063) b_lambda!24273)))

(declare-fun b_lambda!24275 () Bool)

(assert (= b_lambda!24269 (or (and start!113058 b_free!31063) b_lambda!24275)))

(check-sat (not b!1339695) (not bm!65078) (not b!1339696) (not b!1339666) (not b!1339660) (not d!144373) (not d!144367) (not b!1339648) (not bm!65070) (not b!1339645) (not b_lambda!24275) (not bm!65081) (not b_lambda!24273) (not b!1339647) tp_is_empty!36973 (not b!1339707) (not b_next!31063) (not b!1339693) (not bm!65062) (not b!1339590) (not bm!65068) (not b!1339674) (not bm!65072) (not b!1339639) (not b!1339671) (not mapNonEmpty!57156) (not b!1339665) (not bm!65075) (not b!1339706) (not bm!65065) (not b!1339658) (not b!1339673) (not b!1339669) (not bm!65063) b_and!50091 (not d!144369) (not b!1339637) (not b!1339680) (not b!1339592) (not b!1339640) (not bm!65069) (not b!1339663) (not d!144371) (not b!1339654) (not b!1339643))
(check-sat b_and!50091 (not b_next!31063))
(get-model)

(declare-fun d!144381 () Bool)

(assert (=> d!144381 (= (validKeyInArray!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1339637 d!144381))

(declare-fun d!144383 () Bool)

(declare-fun get!22188 (Option!766) V!54401)

(assert (=> d!144383 (= (apply!1045 lt!594084 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22188 (getValueByKey!715 (toList!10845 lt!594084) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38336 () Bool)

(assert (= bs!38336 d!144383))

(declare-fun m!1228161 () Bool)

(assert (=> bs!38336 m!1228161))

(assert (=> bs!38336 m!1228161))

(declare-fun m!1228163 () Bool)

(assert (=> bs!38336 m!1228163))

(assert (=> b!1339669 d!144383))

(declare-fun d!144385 () Bool)

(declare-fun e!762937 () Bool)

(assert (=> d!144385 e!762937))

(declare-fun res!888578 () Bool)

(assert (=> d!144385 (=> res!888578 e!762937)))

(declare-fun lt!594110 () Bool)

(assert (=> d!144385 (= res!888578 (not lt!594110))))

(declare-fun lt!594113 () Bool)

(assert (=> d!144385 (= lt!594110 lt!594113)))

(declare-fun lt!594112 () Unit!43906)

(declare-fun e!762938 () Unit!43906)

(assert (=> d!144385 (= lt!594112 e!762938)))

(declare-fun c!126638 () Bool)

(assert (=> d!144385 (= c!126638 lt!594113)))

(assert (=> d!144385 (= lt!594113 (containsKey!741 (toList!10845 lt!594084) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144385 (= (contains!9028 lt!594084 #b0000000000000000000000000000000000000000000000000000000000000000) lt!594110)))

(declare-fun b!1339717 () Bool)

(declare-fun lt!594111 () Unit!43906)

(assert (=> b!1339717 (= e!762938 lt!594111)))

(assert (=> b!1339717 (= lt!594111 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 lt!594084) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1339717 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594084) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339718 () Bool)

(declare-fun Unit!43912 () Unit!43906)

(assert (=> b!1339718 (= e!762938 Unit!43912)))

(declare-fun b!1339719 () Bool)

(assert (=> b!1339719 (= e!762937 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594084) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144385 c!126638) b!1339717))

(assert (= (and d!144385 (not c!126638)) b!1339718))

(assert (= (and d!144385 (not res!888578)) b!1339719))

(declare-fun m!1228165 () Bool)

(assert (=> d!144385 m!1228165))

(declare-fun m!1228167 () Bool)

(assert (=> b!1339717 m!1228167))

(assert (=> b!1339717 m!1228161))

(assert (=> b!1339717 m!1228161))

(declare-fun m!1228169 () Bool)

(assert (=> b!1339717 m!1228169))

(assert (=> b!1339719 m!1228161))

(assert (=> b!1339719 m!1228161))

(assert (=> b!1339719 m!1228169))

(assert (=> bm!65072 d!144385))

(declare-fun d!144387 () Bool)

(assert (=> d!144387 (isDefined!524 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun lt!594116 () Unit!43906)

(declare-fun choose!1971 (List!31132 (_ BitVec 64)) Unit!43906)

(assert (=> d!144387 (= lt!594116 (choose!1971 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun e!762941 () Bool)

(assert (=> d!144387 e!762941))

(declare-fun res!888581 () Bool)

(assert (=> d!144387 (=> (not res!888581) (not e!762941))))

(declare-fun isStrictlySorted!869 (List!31132) Bool)

(assert (=> d!144387 (= res!888581 (isStrictlySorted!869 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))))

(assert (=> d!144387 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) lt!594116)))

(declare-fun b!1339722 () Bool)

(assert (=> b!1339722 (= e!762941 (containsKey!741 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (= (and d!144387 res!888581) b!1339722))

(assert (=> d!144387 m!1228021))

(assert (=> d!144387 m!1228021))

(assert (=> d!144387 m!1228023))

(declare-fun m!1228171 () Bool)

(assert (=> d!144387 m!1228171))

(declare-fun m!1228173 () Bool)

(assert (=> d!144387 m!1228173))

(assert (=> b!1339722 m!1228017))

(assert (=> b!1339590 d!144387))

(declare-fun d!144389 () Bool)

(declare-fun isEmpty!1093 (Option!766) Bool)

(assert (=> d!144389 (= (isDefined!524 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)) (not (isEmpty!1093 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38337 () Bool)

(assert (= bs!38337 d!144389))

(assert (=> bs!38337 m!1228021))

(declare-fun m!1228175 () Bool)

(assert (=> bs!38337 m!1228175))

(assert (=> b!1339590 d!144389))

(declare-fun e!762946 () Option!766)

(declare-fun b!1339731 () Bool)

(assert (=> b!1339731 (= e!762946 (Some!765 (_2!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))))))

(declare-fun b!1339734 () Bool)

(declare-fun e!762947 () Option!766)

(assert (=> b!1339734 (= e!762947 None!764)))

(declare-fun b!1339732 () Bool)

(assert (=> b!1339732 (= e!762946 e!762947)))

(declare-fun c!126644 () Bool)

(assert (=> b!1339732 (= c!126644 (and ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (not (= (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153))))))

(declare-fun b!1339733 () Bool)

(assert (=> b!1339733 (= e!762947 (getValueByKey!715 (t!45454 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) k0!1153))))

(declare-fun d!144391 () Bool)

(declare-fun c!126643 () Bool)

(assert (=> d!144391 (= c!126643 (and ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(assert (=> d!144391 (= (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) e!762946)))

(assert (= (and d!144391 c!126643) b!1339731))

(assert (= (and d!144391 (not c!126643)) b!1339732))

(assert (= (and b!1339732 c!126644) b!1339733))

(assert (= (and b!1339732 (not c!126644)) b!1339734))

(declare-fun m!1228177 () Bool)

(assert (=> b!1339733 m!1228177))

(assert (=> b!1339590 d!144391))

(declare-fun d!144393 () Bool)

(declare-fun e!762948 () Bool)

(assert (=> d!144393 e!762948))

(declare-fun res!888582 () Bool)

(assert (=> d!144393 (=> res!888582 e!762948)))

(declare-fun lt!594117 () Bool)

(assert (=> d!144393 (= res!888582 (not lt!594117))))

(declare-fun lt!594120 () Bool)

(assert (=> d!144393 (= lt!594117 lt!594120)))

(declare-fun lt!594119 () Unit!43906)

(declare-fun e!762949 () Unit!43906)

(assert (=> d!144393 (= lt!594119 e!762949)))

(declare-fun c!126645 () Bool)

(assert (=> d!144393 (= c!126645 lt!594120)))

(assert (=> d!144393 (= lt!594120 (containsKey!741 (toList!10845 lt!594084) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144393 (= (contains!9028 lt!594084 #b1000000000000000000000000000000000000000000000000000000000000000) lt!594117)))

(declare-fun b!1339735 () Bool)

(declare-fun lt!594118 () Unit!43906)

(assert (=> b!1339735 (= e!762949 lt!594118)))

(assert (=> b!1339735 (= lt!594118 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 lt!594084) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1339735 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594084) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339736 () Bool)

(declare-fun Unit!43913 () Unit!43906)

(assert (=> b!1339736 (= e!762949 Unit!43913)))

(declare-fun b!1339737 () Bool)

(assert (=> b!1339737 (= e!762948 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144393 c!126645) b!1339735))

(assert (= (and d!144393 (not c!126645)) b!1339736))

(assert (= (and d!144393 (not res!888582)) b!1339737))

(declare-fun m!1228179 () Bool)

(assert (=> d!144393 m!1228179))

(declare-fun m!1228181 () Bool)

(assert (=> b!1339735 m!1228181))

(declare-fun m!1228183 () Bool)

(assert (=> b!1339735 m!1228183))

(assert (=> b!1339735 m!1228183))

(declare-fun m!1228185 () Bool)

(assert (=> b!1339735 m!1228185))

(assert (=> b!1339737 m!1228183))

(assert (=> b!1339737 m!1228183))

(assert (=> b!1339737 m!1228185))

(assert (=> bm!65070 d!144393))

(declare-fun b!1339738 () Bool)

(declare-fun e!762952 () Bool)

(declare-fun call!65085 () Bool)

(assert (=> b!1339738 (= e!762952 call!65085)))

(declare-fun b!1339739 () Bool)

(declare-fun e!762953 () Bool)

(assert (=> b!1339739 (= e!762953 (contains!9031 (ite c!126634 (Cons!31129 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) Nil!31130) Nil!31130) (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1339740 () Bool)

(assert (=> b!1339740 (= e!762952 call!65085)))

(declare-fun b!1339741 () Bool)

(declare-fun e!762950 () Bool)

(declare-fun e!762951 () Bool)

(assert (=> b!1339741 (= e!762950 e!762951)))

(declare-fun res!888584 () Bool)

(assert (=> b!1339741 (=> (not res!888584) (not e!762951))))

(assert (=> b!1339741 (= res!888584 (not e!762953))))

(declare-fun res!888583 () Bool)

(assert (=> b!1339741 (=> (not res!888583) (not e!762953))))

(assert (=> b!1339741 (= res!888583 (validKeyInArray!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!144395 () Bool)

(declare-fun res!888585 () Bool)

(assert (=> d!144395 (=> res!888585 e!762950)))

(assert (=> d!144395 (= res!888585 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44471 _keys!1590)))))

(assert (=> d!144395 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126634 (Cons!31129 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) Nil!31130) Nil!31130)) e!762950)))

(declare-fun b!1339742 () Bool)

(assert (=> b!1339742 (= e!762951 e!762952)))

(declare-fun c!126646 () Bool)

(assert (=> b!1339742 (= c!126646 (validKeyInArray!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!65082 () Bool)

(assert (=> bm!65082 (= call!65085 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126646 (Cons!31129 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126634 (Cons!31129 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) Nil!31130) Nil!31130)) (ite c!126634 (Cons!31129 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) Nil!31130) Nil!31130))))))

(assert (= (and d!144395 (not res!888585)) b!1339741))

(assert (= (and b!1339741 res!888583) b!1339739))

(assert (= (and b!1339741 res!888584) b!1339742))

(assert (= (and b!1339742 c!126646) b!1339740))

(assert (= (and b!1339742 (not c!126646)) b!1339738))

(assert (= (or b!1339740 b!1339738) bm!65082))

(declare-fun m!1228187 () Bool)

(assert (=> b!1339739 m!1228187))

(assert (=> b!1339739 m!1228187))

(declare-fun m!1228189 () Bool)

(assert (=> b!1339739 m!1228189))

(assert (=> b!1339741 m!1228187))

(assert (=> b!1339741 m!1228187))

(declare-fun m!1228191 () Bool)

(assert (=> b!1339741 m!1228191))

(assert (=> b!1339742 m!1228187))

(assert (=> b!1339742 m!1228187))

(assert (=> b!1339742 m!1228191))

(assert (=> bm!65082 m!1228187))

(declare-fun m!1228193 () Bool)

(assert (=> bm!65082 m!1228193))

(assert (=> bm!65078 d!144395))

(declare-fun d!144397 () Bool)

(assert (=> d!144397 (= (isDefined!524 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1093 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38338 () Bool)

(assert (= bs!38338 d!144397))

(assert (=> bs!38338 m!1228087))

(declare-fun m!1228195 () Bool)

(assert (=> bs!38338 m!1228195))

(assert (=> b!1339660 d!144397))

(declare-fun e!762954 () Option!766)

(declare-fun b!1339743 () Bool)

(assert (=> b!1339743 (= e!762954 (Some!765 (_2!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(declare-fun b!1339746 () Bool)

(declare-fun e!762955 () Option!766)

(assert (=> b!1339746 (= e!762955 None!764)))

(declare-fun b!1339744 () Bool)

(assert (=> b!1339744 (= e!762954 e!762955)))

(declare-fun c!126648 () Bool)

(assert (=> b!1339744 (= c!126648 (and ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(declare-fun b!1339745 () Bool)

(assert (=> b!1339745 (= e!762955 (getValueByKey!715 (t!45454 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun d!144399 () Bool)

(declare-fun c!126647 () Bool)

(assert (=> d!144399 (= c!126647 (and ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!144399 (= (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!762954)))

(assert (= (and d!144399 c!126647) b!1339743))

(assert (= (and d!144399 (not c!126647)) b!1339744))

(assert (= (and b!1339744 c!126648) b!1339745))

(assert (= (and b!1339744 (not c!126648)) b!1339746))

(declare-fun m!1228197 () Bool)

(assert (=> b!1339745 m!1228197))

(assert (=> b!1339660 d!144399))

(declare-fun d!144401 () Bool)

(declare-fun e!762956 () Bool)

(assert (=> d!144401 e!762956))

(declare-fun res!888586 () Bool)

(assert (=> d!144401 (=> res!888586 e!762956)))

(declare-fun lt!594121 () Bool)

(assert (=> d!144401 (= res!888586 (not lt!594121))))

(declare-fun lt!594124 () Bool)

(assert (=> d!144401 (= lt!594121 lt!594124)))

(declare-fun lt!594123 () Unit!43906)

(declare-fun e!762957 () Unit!43906)

(assert (=> d!144401 (= lt!594123 e!762957)))

(declare-fun c!126649 () Bool)

(assert (=> d!144401 (= c!126649 lt!594124)))

(assert (=> d!144401 (= lt!594124 (containsKey!741 (toList!10845 lt!594084) (select (arr!43920 _keys!1590) from!1980)))))

(assert (=> d!144401 (= (contains!9028 lt!594084 (select (arr!43920 _keys!1590) from!1980)) lt!594121)))

(declare-fun b!1339747 () Bool)

(declare-fun lt!594122 () Unit!43906)

(assert (=> b!1339747 (= e!762957 lt!594122)))

(assert (=> b!1339747 (= lt!594122 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 lt!594084) (select (arr!43920 _keys!1590) from!1980)))))

(assert (=> b!1339747 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594084) (select (arr!43920 _keys!1590) from!1980)))))

(declare-fun b!1339748 () Bool)

(declare-fun Unit!43914 () Unit!43906)

(assert (=> b!1339748 (= e!762957 Unit!43914)))

(declare-fun b!1339749 () Bool)

(assert (=> b!1339749 (= e!762956 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594084) (select (arr!43920 _keys!1590) from!1980))))))

(assert (= (and d!144401 c!126649) b!1339747))

(assert (= (and d!144401 (not c!126649)) b!1339748))

(assert (= (and d!144401 (not res!888586)) b!1339749))

(assert (=> d!144401 m!1227949))

(declare-fun m!1228199 () Bool)

(assert (=> d!144401 m!1228199))

(assert (=> b!1339747 m!1227949))

(declare-fun m!1228201 () Bool)

(assert (=> b!1339747 m!1228201))

(assert (=> b!1339747 m!1227949))

(declare-fun m!1228203 () Bool)

(assert (=> b!1339747 m!1228203))

(assert (=> b!1339747 m!1228203))

(declare-fun m!1228205 () Bool)

(assert (=> b!1339747 m!1228205))

(assert (=> b!1339749 m!1227949))

(assert (=> b!1339749 m!1228203))

(assert (=> b!1339749 m!1228203))

(assert (=> b!1339749 m!1228205))

(assert (=> b!1339674 d!144401))

(declare-fun d!144403 () Bool)

(assert (=> d!144403 (= (apply!1045 lt!594058 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22188 (getValueByKey!715 (toList!10845 lt!594058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38339 () Bool)

(assert (= bs!38339 d!144403))

(declare-fun m!1228207 () Bool)

(assert (=> bs!38339 m!1228207))

(assert (=> bs!38339 m!1228207))

(declare-fun m!1228209 () Bool)

(assert (=> bs!38339 m!1228209))

(assert (=> b!1339640 d!144403))

(declare-fun d!144405 () Bool)

(assert (=> d!144405 (= (apply!1045 lt!594085 lt!594081) (get!22188 (getValueByKey!715 (toList!10845 lt!594085) lt!594081)))))

(declare-fun bs!38340 () Bool)

(assert (= bs!38340 d!144405))

(declare-fun m!1228211 () Bool)

(assert (=> bs!38340 m!1228211))

(assert (=> bs!38340 m!1228211))

(declare-fun m!1228213 () Bool)

(assert (=> bs!38340 m!1228213))

(assert (=> b!1339673 d!144405))

(declare-fun d!144407 () Bool)

(assert (=> d!144407 (= (apply!1045 (+!4790 lt!594088 (tuple2!23995 lt!594092 zeroValue!1262)) lt!594087) (get!22188 (getValueByKey!715 (toList!10845 (+!4790 lt!594088 (tuple2!23995 lt!594092 zeroValue!1262))) lt!594087)))))

(declare-fun bs!38341 () Bool)

(assert (= bs!38341 d!144407))

(declare-fun m!1228215 () Bool)

(assert (=> bs!38341 m!1228215))

(assert (=> bs!38341 m!1228215))

(declare-fun m!1228217 () Bool)

(assert (=> bs!38341 m!1228217))

(assert (=> b!1339673 d!144407))

(declare-fun d!144409 () Bool)

(declare-fun e!762960 () Bool)

(assert (=> d!144409 e!762960))

(declare-fun res!888591 () Bool)

(assert (=> d!144409 (=> (not res!888591) (not e!762960))))

(declare-fun lt!594135 () ListLongMap!21659)

(assert (=> d!144409 (= res!888591 (contains!9028 lt!594135 (_1!12008 (tuple2!23995 lt!594079 minValue!1262))))))

(declare-fun lt!594136 () List!31132)

(assert (=> d!144409 (= lt!594135 (ListLongMap!21660 lt!594136))))

(declare-fun lt!594133 () Unit!43906)

(declare-fun lt!594134 () Unit!43906)

(assert (=> d!144409 (= lt!594133 lt!594134)))

(assert (=> d!144409 (= (getValueByKey!715 lt!594136 (_1!12008 (tuple2!23995 lt!594079 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594079 minValue!1262))))))

(declare-fun lemmaContainsTupThenGetReturnValue!365 (List!31132 (_ BitVec 64) V!54401) Unit!43906)

(assert (=> d!144409 (= lt!594134 (lemmaContainsTupThenGetReturnValue!365 lt!594136 (_1!12008 (tuple2!23995 lt!594079 minValue!1262)) (_2!12008 (tuple2!23995 lt!594079 minValue!1262))))))

(declare-fun insertStrictlySorted!494 (List!31132 (_ BitVec 64) V!54401) List!31132)

(assert (=> d!144409 (= lt!594136 (insertStrictlySorted!494 (toList!10845 lt!594091) (_1!12008 (tuple2!23995 lt!594079 minValue!1262)) (_2!12008 (tuple2!23995 lt!594079 minValue!1262))))))

(assert (=> d!144409 (= (+!4790 lt!594091 (tuple2!23995 lt!594079 minValue!1262)) lt!594135)))

(declare-fun b!1339754 () Bool)

(declare-fun res!888592 () Bool)

(assert (=> b!1339754 (=> (not res!888592) (not e!762960))))

(assert (=> b!1339754 (= res!888592 (= (getValueByKey!715 (toList!10845 lt!594135) (_1!12008 (tuple2!23995 lt!594079 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594079 minValue!1262)))))))

(declare-fun b!1339755 () Bool)

(declare-fun contains!9032 (List!31132 tuple2!23994) Bool)

(assert (=> b!1339755 (= e!762960 (contains!9032 (toList!10845 lt!594135) (tuple2!23995 lt!594079 minValue!1262)))))

(assert (= (and d!144409 res!888591) b!1339754))

(assert (= (and b!1339754 res!888592) b!1339755))

(declare-fun m!1228219 () Bool)

(assert (=> d!144409 m!1228219))

(declare-fun m!1228221 () Bool)

(assert (=> d!144409 m!1228221))

(declare-fun m!1228223 () Bool)

(assert (=> d!144409 m!1228223))

(declare-fun m!1228225 () Bool)

(assert (=> d!144409 m!1228225))

(declare-fun m!1228227 () Bool)

(assert (=> b!1339754 m!1228227))

(declare-fun m!1228229 () Bool)

(assert (=> b!1339755 m!1228229))

(assert (=> b!1339673 d!144409))

(declare-fun d!144411 () Bool)

(assert (=> d!144411 (= (apply!1045 (+!4790 lt!594088 (tuple2!23995 lt!594092 zeroValue!1262)) lt!594087) (apply!1045 lt!594088 lt!594087))))

(declare-fun lt!594139 () Unit!43906)

(declare-fun choose!1972 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43906)

(assert (=> d!144411 (= lt!594139 (choose!1972 lt!594088 lt!594092 zeroValue!1262 lt!594087))))

(declare-fun e!762963 () Bool)

(assert (=> d!144411 e!762963))

(declare-fun res!888595 () Bool)

(assert (=> d!144411 (=> (not res!888595) (not e!762963))))

(assert (=> d!144411 (= res!888595 (contains!9028 lt!594088 lt!594087))))

(assert (=> d!144411 (= (addApplyDifferent!574 lt!594088 lt!594092 zeroValue!1262 lt!594087) lt!594139)))

(declare-fun b!1339759 () Bool)

(assert (=> b!1339759 (= e!762963 (not (= lt!594087 lt!594092)))))

(assert (= (and d!144411 res!888595) b!1339759))

(declare-fun m!1228231 () Bool)

(assert (=> d!144411 m!1228231))

(assert (=> d!144411 m!1228109))

(assert (=> d!144411 m!1228111))

(assert (=> d!144411 m!1228109))

(declare-fun m!1228233 () Bool)

(assert (=> d!144411 m!1228233))

(assert (=> d!144411 m!1228133))

(assert (=> b!1339673 d!144411))

(declare-fun d!144413 () Bool)

(assert (=> d!144413 (= (apply!1045 lt!594091 lt!594080) (get!22188 (getValueByKey!715 (toList!10845 lt!594091) lt!594080)))))

(declare-fun bs!38342 () Bool)

(assert (= bs!38342 d!144413))

(declare-fun m!1228235 () Bool)

(assert (=> bs!38342 m!1228235))

(assert (=> bs!38342 m!1228235))

(declare-fun m!1228237 () Bool)

(assert (=> bs!38342 m!1228237))

(assert (=> b!1339673 d!144413))

(declare-fun d!144415 () Bool)

(assert (=> d!144415 (contains!9028 (+!4790 lt!594095 (tuple2!23995 lt!594089 zeroValue!1262)) lt!594097)))

(declare-fun lt!594142 () Unit!43906)

(declare-fun choose!1973 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43906)

(assert (=> d!144415 (= lt!594142 (choose!1973 lt!594095 lt!594089 zeroValue!1262 lt!594097))))

(assert (=> d!144415 (contains!9028 lt!594095 lt!594097)))

(assert (=> d!144415 (= (addStillContains!1197 lt!594095 lt!594089 zeroValue!1262 lt!594097) lt!594142)))

(declare-fun bs!38343 () Bool)

(assert (= bs!38343 d!144415))

(assert (=> bs!38343 m!1228113))

(assert (=> bs!38343 m!1228113))

(assert (=> bs!38343 m!1228117))

(declare-fun m!1228239 () Bool)

(assert (=> bs!38343 m!1228239))

(declare-fun m!1228241 () Bool)

(assert (=> bs!38343 m!1228241))

(assert (=> b!1339673 d!144415))

(declare-fun d!144417 () Bool)

(assert (=> d!144417 (= (apply!1045 (+!4790 lt!594085 (tuple2!23995 lt!594093 minValue!1262)) lt!594081) (get!22188 (getValueByKey!715 (toList!10845 (+!4790 lt!594085 (tuple2!23995 lt!594093 minValue!1262))) lt!594081)))))

(declare-fun bs!38344 () Bool)

(assert (= bs!38344 d!144417))

(declare-fun m!1228243 () Bool)

(assert (=> bs!38344 m!1228243))

(assert (=> bs!38344 m!1228243))

(declare-fun m!1228245 () Bool)

(assert (=> bs!38344 m!1228245))

(assert (=> b!1339673 d!144417))

(declare-fun d!144419 () Bool)

(declare-fun e!762964 () Bool)

(assert (=> d!144419 e!762964))

(declare-fun res!888596 () Bool)

(assert (=> d!144419 (=> (not res!888596) (not e!762964))))

(declare-fun lt!594145 () ListLongMap!21659)

(assert (=> d!144419 (= res!888596 (contains!9028 lt!594145 (_1!12008 (tuple2!23995 lt!594093 minValue!1262))))))

(declare-fun lt!594146 () List!31132)

(assert (=> d!144419 (= lt!594145 (ListLongMap!21660 lt!594146))))

(declare-fun lt!594143 () Unit!43906)

(declare-fun lt!594144 () Unit!43906)

(assert (=> d!144419 (= lt!594143 lt!594144)))

(assert (=> d!144419 (= (getValueByKey!715 lt!594146 (_1!12008 (tuple2!23995 lt!594093 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594093 minValue!1262))))))

(assert (=> d!144419 (= lt!594144 (lemmaContainsTupThenGetReturnValue!365 lt!594146 (_1!12008 (tuple2!23995 lt!594093 minValue!1262)) (_2!12008 (tuple2!23995 lt!594093 minValue!1262))))))

(assert (=> d!144419 (= lt!594146 (insertStrictlySorted!494 (toList!10845 lt!594085) (_1!12008 (tuple2!23995 lt!594093 minValue!1262)) (_2!12008 (tuple2!23995 lt!594093 minValue!1262))))))

(assert (=> d!144419 (= (+!4790 lt!594085 (tuple2!23995 lt!594093 minValue!1262)) lt!594145)))

(declare-fun b!1339761 () Bool)

(declare-fun res!888597 () Bool)

(assert (=> b!1339761 (=> (not res!888597) (not e!762964))))

(assert (=> b!1339761 (= res!888597 (= (getValueByKey!715 (toList!10845 lt!594145) (_1!12008 (tuple2!23995 lt!594093 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594093 minValue!1262)))))))

(declare-fun b!1339762 () Bool)

(assert (=> b!1339762 (= e!762964 (contains!9032 (toList!10845 lt!594145) (tuple2!23995 lt!594093 minValue!1262)))))

(assert (= (and d!144419 res!888596) b!1339761))

(assert (= (and b!1339761 res!888597) b!1339762))

(declare-fun m!1228247 () Bool)

(assert (=> d!144419 m!1228247))

(declare-fun m!1228249 () Bool)

(assert (=> d!144419 m!1228249))

(declare-fun m!1228251 () Bool)

(assert (=> d!144419 m!1228251))

(declare-fun m!1228253 () Bool)

(assert (=> d!144419 m!1228253))

(declare-fun m!1228255 () Bool)

(assert (=> b!1339761 m!1228255))

(declare-fun m!1228257 () Bool)

(assert (=> b!1339762 m!1228257))

(assert (=> b!1339673 d!144419))

(declare-fun d!144421 () Bool)

(declare-fun e!762965 () Bool)

(assert (=> d!144421 e!762965))

(declare-fun res!888598 () Bool)

(assert (=> d!144421 (=> (not res!888598) (not e!762965))))

(declare-fun lt!594149 () ListLongMap!21659)

(assert (=> d!144421 (= res!888598 (contains!9028 lt!594149 (_1!12008 (tuple2!23995 lt!594089 zeroValue!1262))))))

(declare-fun lt!594150 () List!31132)

(assert (=> d!144421 (= lt!594149 (ListLongMap!21660 lt!594150))))

(declare-fun lt!594147 () Unit!43906)

(declare-fun lt!594148 () Unit!43906)

(assert (=> d!144421 (= lt!594147 lt!594148)))

(assert (=> d!144421 (= (getValueByKey!715 lt!594150 (_1!12008 (tuple2!23995 lt!594089 zeroValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594089 zeroValue!1262))))))

(assert (=> d!144421 (= lt!594148 (lemmaContainsTupThenGetReturnValue!365 lt!594150 (_1!12008 (tuple2!23995 lt!594089 zeroValue!1262)) (_2!12008 (tuple2!23995 lt!594089 zeroValue!1262))))))

(assert (=> d!144421 (= lt!594150 (insertStrictlySorted!494 (toList!10845 lt!594095) (_1!12008 (tuple2!23995 lt!594089 zeroValue!1262)) (_2!12008 (tuple2!23995 lt!594089 zeroValue!1262))))))

(assert (=> d!144421 (= (+!4790 lt!594095 (tuple2!23995 lt!594089 zeroValue!1262)) lt!594149)))

(declare-fun b!1339763 () Bool)

(declare-fun res!888599 () Bool)

(assert (=> b!1339763 (=> (not res!888599) (not e!762965))))

(assert (=> b!1339763 (= res!888599 (= (getValueByKey!715 (toList!10845 lt!594149) (_1!12008 (tuple2!23995 lt!594089 zeroValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594089 zeroValue!1262)))))))

(declare-fun b!1339764 () Bool)

(assert (=> b!1339764 (= e!762965 (contains!9032 (toList!10845 lt!594149) (tuple2!23995 lt!594089 zeroValue!1262)))))

(assert (= (and d!144421 res!888598) b!1339763))

(assert (= (and b!1339763 res!888599) b!1339764))

(declare-fun m!1228259 () Bool)

(assert (=> d!144421 m!1228259))

(declare-fun m!1228261 () Bool)

(assert (=> d!144421 m!1228261))

(declare-fun m!1228263 () Bool)

(assert (=> d!144421 m!1228263))

(declare-fun m!1228265 () Bool)

(assert (=> d!144421 m!1228265))

(declare-fun m!1228267 () Bool)

(assert (=> b!1339763 m!1228267))

(declare-fun m!1228269 () Bool)

(assert (=> b!1339764 m!1228269))

(assert (=> b!1339673 d!144421))

(declare-fun d!144423 () Bool)

(declare-fun e!762966 () Bool)

(assert (=> d!144423 e!762966))

(declare-fun res!888600 () Bool)

(assert (=> d!144423 (=> res!888600 e!762966)))

(declare-fun lt!594151 () Bool)

(assert (=> d!144423 (= res!888600 (not lt!594151))))

(declare-fun lt!594154 () Bool)

(assert (=> d!144423 (= lt!594151 lt!594154)))

(declare-fun lt!594153 () Unit!43906)

(declare-fun e!762967 () Unit!43906)

(assert (=> d!144423 (= lt!594153 e!762967)))

(declare-fun c!126650 () Bool)

(assert (=> d!144423 (= c!126650 lt!594154)))

(assert (=> d!144423 (= lt!594154 (containsKey!741 (toList!10845 (+!4790 lt!594095 (tuple2!23995 lt!594089 zeroValue!1262))) lt!594097))))

(assert (=> d!144423 (= (contains!9028 (+!4790 lt!594095 (tuple2!23995 lt!594089 zeroValue!1262)) lt!594097) lt!594151)))

(declare-fun b!1339765 () Bool)

(declare-fun lt!594152 () Unit!43906)

(assert (=> b!1339765 (= e!762967 lt!594152)))

(assert (=> b!1339765 (= lt!594152 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 (+!4790 lt!594095 (tuple2!23995 lt!594089 zeroValue!1262))) lt!594097))))

(assert (=> b!1339765 (isDefined!524 (getValueByKey!715 (toList!10845 (+!4790 lt!594095 (tuple2!23995 lt!594089 zeroValue!1262))) lt!594097))))

(declare-fun b!1339766 () Bool)

(declare-fun Unit!43915 () Unit!43906)

(assert (=> b!1339766 (= e!762967 Unit!43915)))

(declare-fun b!1339767 () Bool)

(assert (=> b!1339767 (= e!762966 (isDefined!524 (getValueByKey!715 (toList!10845 (+!4790 lt!594095 (tuple2!23995 lt!594089 zeroValue!1262))) lt!594097)))))

(assert (= (and d!144423 c!126650) b!1339765))

(assert (= (and d!144423 (not c!126650)) b!1339766))

(assert (= (and d!144423 (not res!888600)) b!1339767))

(declare-fun m!1228271 () Bool)

(assert (=> d!144423 m!1228271))

(declare-fun m!1228273 () Bool)

(assert (=> b!1339765 m!1228273))

(declare-fun m!1228275 () Bool)

(assert (=> b!1339765 m!1228275))

(assert (=> b!1339765 m!1228275))

(declare-fun m!1228277 () Bool)

(assert (=> b!1339765 m!1228277))

(assert (=> b!1339767 m!1228275))

(assert (=> b!1339767 m!1228275))

(assert (=> b!1339767 m!1228277))

(assert (=> b!1339673 d!144423))

(declare-fun d!144425 () Bool)

(assert (=> d!144425 (= (apply!1045 (+!4790 lt!594085 (tuple2!23995 lt!594093 minValue!1262)) lt!594081) (apply!1045 lt!594085 lt!594081))))

(declare-fun lt!594155 () Unit!43906)

(assert (=> d!144425 (= lt!594155 (choose!1972 lt!594085 lt!594093 minValue!1262 lt!594081))))

(declare-fun e!762968 () Bool)

(assert (=> d!144425 e!762968))

(declare-fun res!888601 () Bool)

(assert (=> d!144425 (=> (not res!888601) (not e!762968))))

(assert (=> d!144425 (= res!888601 (contains!9028 lt!594085 lt!594081))))

(assert (=> d!144425 (= (addApplyDifferent!574 lt!594085 lt!594093 minValue!1262 lt!594081) lt!594155)))

(declare-fun b!1339768 () Bool)

(assert (=> b!1339768 (= e!762968 (not (= lt!594081 lt!594093)))))

(assert (= (and d!144425 res!888601) b!1339768))

(declare-fun m!1228279 () Bool)

(assert (=> d!144425 m!1228279))

(assert (=> d!144425 m!1228127))

(assert (=> d!144425 m!1228129))

(assert (=> d!144425 m!1228127))

(declare-fun m!1228281 () Bool)

(assert (=> d!144425 m!1228281))

(assert (=> d!144425 m!1228123))

(assert (=> b!1339673 d!144425))

(declare-fun lt!594172 () ListLongMap!21659)

(declare-fun b!1339793 () Bool)

(declare-fun e!762989 () Bool)

(assert (=> b!1339793 (= e!762989 (= lt!594172 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1339794 () Bool)

(declare-fun e!762985 () ListLongMap!21659)

(declare-fun e!762988 () ListLongMap!21659)

(assert (=> b!1339794 (= e!762985 e!762988)))

(declare-fun c!126662 () Bool)

(assert (=> b!1339794 (= c!126662 (validKeyInArray!0 (select (arr!43920 _keys!1590) from!1980)))))

(declare-fun b!1339795 () Bool)

(declare-fun lt!594174 () Unit!43906)

(declare-fun lt!594175 () Unit!43906)

(assert (=> b!1339795 (= lt!594174 lt!594175)))

(declare-fun lt!594170 () V!54401)

(declare-fun lt!594171 () (_ BitVec 64))

(declare-fun lt!594173 () ListLongMap!21659)

(declare-fun lt!594176 () (_ BitVec 64))

(assert (=> b!1339795 (not (contains!9028 (+!4790 lt!594173 (tuple2!23995 lt!594176 lt!594170)) lt!594171))))

(declare-fun addStillNotContains!501 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43906)

(assert (=> b!1339795 (= lt!594175 (addStillNotContains!501 lt!594173 lt!594176 lt!594170 lt!594171))))

(assert (=> b!1339795 (= lt!594171 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1339795 (= lt!594170 (get!22187 (select (arr!43921 _values!1320) from!1980) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1339795 (= lt!594176 (select (arr!43920 _keys!1590) from!1980))))

(declare-fun call!65088 () ListLongMap!21659)

(assert (=> b!1339795 (= lt!594173 call!65088)))

(assert (=> b!1339795 (= e!762988 (+!4790 call!65088 (tuple2!23995 (select (arr!43920 _keys!1590) from!1980) (get!22187 (select (arr!43921 _values!1320) from!1980) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1339796 () Bool)

(declare-fun e!762986 () Bool)

(assert (=> b!1339796 (= e!762986 e!762989)))

(declare-fun c!126659 () Bool)

(assert (=> b!1339796 (= c!126659 (bvslt from!1980 (size!44471 _keys!1590)))))

(declare-fun b!1339797 () Bool)

(declare-fun e!762984 () Bool)

(assert (=> b!1339797 (= e!762986 e!762984)))

(assert (=> b!1339797 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44471 _keys!1590)))))

(declare-fun res!888613 () Bool)

(assert (=> b!1339797 (= res!888613 (contains!9028 lt!594172 (select (arr!43920 _keys!1590) from!1980)))))

(assert (=> b!1339797 (=> (not res!888613) (not e!762984))))

(declare-fun bm!65085 () Bool)

(assert (=> bm!65085 (= call!65088 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1339798 () Bool)

(declare-fun res!888611 () Bool)

(declare-fun e!762983 () Bool)

(assert (=> b!1339798 (=> (not res!888611) (not e!762983))))

(assert (=> b!1339798 (= res!888611 (not (contains!9028 lt!594172 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1339799 () Bool)

(declare-fun e!762987 () Bool)

(assert (=> b!1339799 (= e!762987 (validKeyInArray!0 (select (arr!43920 _keys!1590) from!1980)))))

(assert (=> b!1339799 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1339800 () Bool)

(declare-fun isEmpty!1094 (ListLongMap!21659) Bool)

(assert (=> b!1339800 (= e!762989 (isEmpty!1094 lt!594172))))

(declare-fun d!144427 () Bool)

(assert (=> d!144427 e!762983))

(declare-fun res!888612 () Bool)

(assert (=> d!144427 (=> (not res!888612) (not e!762983))))

(assert (=> d!144427 (= res!888612 (not (contains!9028 lt!594172 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144427 (= lt!594172 e!762985)))

(declare-fun c!126660 () Bool)

(assert (=> d!144427 (= c!126660 (bvsge from!1980 (size!44471 _keys!1590)))))

(assert (=> d!144427 (validMask!0 mask!1998)))

(assert (=> d!144427 (= (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!594172)))

(declare-fun b!1339801 () Bool)

(assert (=> b!1339801 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44471 _keys!1590)))))

(assert (=> b!1339801 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44472 _values!1320)))))

(assert (=> b!1339801 (= e!762984 (= (apply!1045 lt!594172 (select (arr!43920 _keys!1590) from!1980)) (get!22187 (select (arr!43921 _values!1320) from!1980) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339802 () Bool)

(assert (=> b!1339802 (= e!762985 (ListLongMap!21660 Nil!31129))))

(declare-fun b!1339803 () Bool)

(assert (=> b!1339803 (= e!762983 e!762986)))

(declare-fun c!126661 () Bool)

(assert (=> b!1339803 (= c!126661 e!762987)))

(declare-fun res!888610 () Bool)

(assert (=> b!1339803 (=> (not res!888610) (not e!762987))))

(assert (=> b!1339803 (= res!888610 (bvslt from!1980 (size!44471 _keys!1590)))))

(declare-fun b!1339804 () Bool)

(assert (=> b!1339804 (= e!762988 call!65088)))

(assert (= (and d!144427 c!126660) b!1339802))

(assert (= (and d!144427 (not c!126660)) b!1339794))

(assert (= (and b!1339794 c!126662) b!1339795))

(assert (= (and b!1339794 (not c!126662)) b!1339804))

(assert (= (or b!1339795 b!1339804) bm!65085))

(assert (= (and d!144427 res!888612) b!1339798))

(assert (= (and b!1339798 res!888611) b!1339803))

(assert (= (and b!1339803 res!888610) b!1339799))

(assert (= (and b!1339803 c!126661) b!1339797))

(assert (= (and b!1339803 (not c!126661)) b!1339796))

(assert (= (and b!1339797 res!888613) b!1339801))

(assert (= (and b!1339796 c!126659) b!1339793))

(assert (= (and b!1339796 (not c!126659)) b!1339800))

(declare-fun b_lambda!24277 () Bool)

(assert (=> (not b_lambda!24277) (not b!1339795)))

(assert (=> b!1339795 t!45460))

(declare-fun b_and!50093 () Bool)

(assert (= b_and!50091 (and (=> t!45460 result!25341) b_and!50093)))

(declare-fun b_lambda!24279 () Bool)

(assert (=> (not b_lambda!24279) (not b!1339801)))

(assert (=> b!1339801 t!45460))

(declare-fun b_and!50095 () Bool)

(assert (= b_and!50093 (and (=> t!45460 result!25341) b_and!50095)))

(assert (=> b!1339801 m!1228105))

(assert (=> b!1339801 m!1228105))

(assert (=> b!1339801 m!1228043))

(assert (=> b!1339801 m!1228107))

(assert (=> b!1339801 m!1227949))

(declare-fun m!1228283 () Bool)

(assert (=> b!1339801 m!1228283))

(assert (=> b!1339801 m!1227949))

(assert (=> b!1339801 m!1228043))

(assert (=> b!1339799 m!1227949))

(assert (=> b!1339799 m!1227949))

(assert (=> b!1339799 m!1227951))

(declare-fun m!1228285 () Bool)

(assert (=> b!1339793 m!1228285))

(assert (=> b!1339794 m!1227949))

(assert (=> b!1339794 m!1227949))

(assert (=> b!1339794 m!1227951))

(declare-fun m!1228287 () Bool)

(assert (=> b!1339798 m!1228287))

(assert (=> b!1339795 m!1228105))

(declare-fun m!1228289 () Bool)

(assert (=> b!1339795 m!1228289))

(assert (=> b!1339795 m!1228105))

(assert (=> b!1339795 m!1228043))

(assert (=> b!1339795 m!1228107))

(assert (=> b!1339795 m!1227949))

(declare-fun m!1228291 () Bool)

(assert (=> b!1339795 m!1228291))

(declare-fun m!1228293 () Bool)

(assert (=> b!1339795 m!1228293))

(assert (=> b!1339795 m!1228043))

(assert (=> b!1339795 m!1228291))

(declare-fun m!1228295 () Bool)

(assert (=> b!1339795 m!1228295))

(declare-fun m!1228297 () Bool)

(assert (=> b!1339800 m!1228297))

(declare-fun m!1228299 () Bool)

(assert (=> d!144427 m!1228299))

(assert (=> d!144427 m!1227953))

(assert (=> b!1339797 m!1227949))

(assert (=> b!1339797 m!1227949))

(declare-fun m!1228301 () Bool)

(assert (=> b!1339797 m!1228301))

(assert (=> bm!65085 m!1228285))

(assert (=> b!1339673 d!144427))

(declare-fun d!144429 () Bool)

(declare-fun e!762990 () Bool)

(assert (=> d!144429 e!762990))

(declare-fun res!888614 () Bool)

(assert (=> d!144429 (=> (not res!888614) (not e!762990))))

(declare-fun lt!594179 () ListLongMap!21659)

(assert (=> d!144429 (= res!888614 (contains!9028 lt!594179 (_1!12008 (tuple2!23995 lt!594092 zeroValue!1262))))))

(declare-fun lt!594180 () List!31132)

(assert (=> d!144429 (= lt!594179 (ListLongMap!21660 lt!594180))))

(declare-fun lt!594177 () Unit!43906)

(declare-fun lt!594178 () Unit!43906)

(assert (=> d!144429 (= lt!594177 lt!594178)))

(assert (=> d!144429 (= (getValueByKey!715 lt!594180 (_1!12008 (tuple2!23995 lt!594092 zeroValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594092 zeroValue!1262))))))

(assert (=> d!144429 (= lt!594178 (lemmaContainsTupThenGetReturnValue!365 lt!594180 (_1!12008 (tuple2!23995 lt!594092 zeroValue!1262)) (_2!12008 (tuple2!23995 lt!594092 zeroValue!1262))))))

(assert (=> d!144429 (= lt!594180 (insertStrictlySorted!494 (toList!10845 lt!594088) (_1!12008 (tuple2!23995 lt!594092 zeroValue!1262)) (_2!12008 (tuple2!23995 lt!594092 zeroValue!1262))))))

(assert (=> d!144429 (= (+!4790 lt!594088 (tuple2!23995 lt!594092 zeroValue!1262)) lt!594179)))

(declare-fun b!1339805 () Bool)

(declare-fun res!888615 () Bool)

(assert (=> b!1339805 (=> (not res!888615) (not e!762990))))

(assert (=> b!1339805 (= res!888615 (= (getValueByKey!715 (toList!10845 lt!594179) (_1!12008 (tuple2!23995 lt!594092 zeroValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594092 zeroValue!1262)))))))

(declare-fun b!1339806 () Bool)

(assert (=> b!1339806 (= e!762990 (contains!9032 (toList!10845 lt!594179) (tuple2!23995 lt!594092 zeroValue!1262)))))

(assert (= (and d!144429 res!888614) b!1339805))

(assert (= (and b!1339805 res!888615) b!1339806))

(declare-fun m!1228303 () Bool)

(assert (=> d!144429 m!1228303))

(declare-fun m!1228305 () Bool)

(assert (=> d!144429 m!1228305))

(declare-fun m!1228307 () Bool)

(assert (=> d!144429 m!1228307))

(declare-fun m!1228309 () Bool)

(assert (=> d!144429 m!1228309))

(declare-fun m!1228311 () Bool)

(assert (=> b!1339805 m!1228311))

(declare-fun m!1228313 () Bool)

(assert (=> b!1339806 m!1228313))

(assert (=> b!1339673 d!144429))

(declare-fun d!144431 () Bool)

(assert (=> d!144431 (= (apply!1045 (+!4790 lt!594091 (tuple2!23995 lt!594079 minValue!1262)) lt!594080) (apply!1045 lt!594091 lt!594080))))

(declare-fun lt!594181 () Unit!43906)

(assert (=> d!144431 (= lt!594181 (choose!1972 lt!594091 lt!594079 minValue!1262 lt!594080))))

(declare-fun e!762991 () Bool)

(assert (=> d!144431 e!762991))

(declare-fun res!888616 () Bool)

(assert (=> d!144431 (=> (not res!888616) (not e!762991))))

(assert (=> d!144431 (= res!888616 (contains!9028 lt!594091 lt!594080))))

(assert (=> d!144431 (= (addApplyDifferent!574 lt!594091 lt!594079 minValue!1262 lt!594080) lt!594181)))

(declare-fun b!1339807 () Bool)

(assert (=> b!1339807 (= e!762991 (not (= lt!594080 lt!594079)))))

(assert (= (and d!144431 res!888616) b!1339807))

(declare-fun m!1228315 () Bool)

(assert (=> d!144431 m!1228315))

(assert (=> d!144431 m!1228119))

(assert (=> d!144431 m!1228121))

(assert (=> d!144431 m!1228119))

(declare-fun m!1228317 () Bool)

(assert (=> d!144431 m!1228317))

(assert (=> d!144431 m!1228137))

(assert (=> b!1339673 d!144431))

(declare-fun d!144433 () Bool)

(assert (=> d!144433 (= (apply!1045 lt!594088 lt!594087) (get!22188 (getValueByKey!715 (toList!10845 lt!594088) lt!594087)))))

(declare-fun bs!38345 () Bool)

(assert (= bs!38345 d!144433))

(declare-fun m!1228319 () Bool)

(assert (=> bs!38345 m!1228319))

(assert (=> bs!38345 m!1228319))

(declare-fun m!1228321 () Bool)

(assert (=> bs!38345 m!1228321))

(assert (=> b!1339673 d!144433))

(declare-fun d!144435 () Bool)

(assert (=> d!144435 (= (apply!1045 (+!4790 lt!594091 (tuple2!23995 lt!594079 minValue!1262)) lt!594080) (get!22188 (getValueByKey!715 (toList!10845 (+!4790 lt!594091 (tuple2!23995 lt!594079 minValue!1262))) lt!594080)))))

(declare-fun bs!38346 () Bool)

(assert (= bs!38346 d!144435))

(declare-fun m!1228323 () Bool)

(assert (=> bs!38346 m!1228323))

(assert (=> bs!38346 m!1228323))

(declare-fun m!1228325 () Bool)

(assert (=> bs!38346 m!1228325))

(assert (=> b!1339673 d!144435))

(declare-fun d!144437 () Bool)

(assert (=> d!144437 (isDefined!524 (getValueByKey!715 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!594182 () Unit!43906)

(assert (=> d!144437 (= lt!594182 (choose!1971 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!762992 () Bool)

(assert (=> d!144437 e!762992))

(declare-fun res!888617 () Bool)

(assert (=> d!144437 (=> (not res!888617) (not e!762992))))

(assert (=> d!144437 (= res!888617 (isStrictlySorted!869 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!144437 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!594182)))

(declare-fun b!1339808 () Bool)

(assert (=> b!1339808 (= e!762992 (containsKey!741 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!144437 res!888617) b!1339808))

(assert (=> d!144437 m!1228087))

(assert (=> d!144437 m!1228087))

(assert (=> d!144437 m!1228089))

(declare-fun m!1228327 () Bool)

(assert (=> d!144437 m!1228327))

(declare-fun m!1228329 () Bool)

(assert (=> d!144437 m!1228329))

(assert (=> b!1339808 m!1228083))

(assert (=> b!1339658 d!144437))

(assert (=> b!1339658 d!144397))

(assert (=> b!1339658 d!144399))

(declare-fun d!144439 () Bool)

(declare-fun e!762993 () Bool)

(assert (=> d!144439 e!762993))

(declare-fun res!888618 () Bool)

(assert (=> d!144439 (=> (not res!888618) (not e!762993))))

(declare-fun lt!594185 () ListLongMap!21659)

(assert (=> d!144439 (= res!888618 (contains!9028 lt!594185 (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!594186 () List!31132)

(assert (=> d!144439 (= lt!594185 (ListLongMap!21660 lt!594186))))

(declare-fun lt!594183 () Unit!43906)

(declare-fun lt!594184 () Unit!43906)

(assert (=> d!144439 (= lt!594183 lt!594184)))

(assert (=> d!144439 (= (getValueByKey!715 lt!594186 (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144439 (= lt!594184 (lemmaContainsTupThenGetReturnValue!365 lt!594186 (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144439 (= lt!594186 (insertStrictlySorted!494 (toList!10845 call!65071) (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144439 (= (+!4790 call!65071 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!594185)))

(declare-fun b!1339809 () Bool)

(declare-fun res!888619 () Bool)

(assert (=> b!1339809 (=> (not res!888619) (not e!762993))))

(assert (=> b!1339809 (= res!888619 (= (getValueByKey!715 (toList!10845 lt!594185) (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1339810 () Bool)

(assert (=> b!1339810 (= e!762993 (contains!9032 (toList!10845 lt!594185) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!144439 res!888618) b!1339809))

(assert (= (and b!1339809 res!888619) b!1339810))

(declare-fun m!1228331 () Bool)

(assert (=> d!144439 m!1228331))

(declare-fun m!1228333 () Bool)

(assert (=> d!144439 m!1228333))

(declare-fun m!1228335 () Bool)

(assert (=> d!144439 m!1228335))

(declare-fun m!1228337 () Bool)

(assert (=> d!144439 m!1228337))

(declare-fun m!1228339 () Bool)

(assert (=> b!1339809 m!1228339))

(declare-fun m!1228341 () Bool)

(assert (=> b!1339810 m!1228341))

(assert (=> b!1339639 d!144439))

(assert (=> b!1339654 d!144381))

(declare-fun d!144441 () Bool)

(assert (=> d!144441 (= (apply!1045 lt!594084 (select (arr!43920 _keys!1590) from!1980)) (get!22188 (getValueByKey!715 (toList!10845 lt!594084) (select (arr!43920 _keys!1590) from!1980))))))

(declare-fun bs!38347 () Bool)

(assert (= bs!38347 d!144441))

(assert (=> bs!38347 m!1227949))

(assert (=> bs!38347 m!1228203))

(assert (=> bs!38347 m!1228203))

(declare-fun m!1228343 () Bool)

(assert (=> bs!38347 m!1228343))

(assert (=> b!1339671 d!144441))

(declare-fun d!144443 () Bool)

(declare-fun c!126665 () Bool)

(assert (=> d!144443 (= c!126665 ((_ is ValueCellFull!17588) (select (arr!43921 _values!1320) from!1980)))))

(declare-fun e!762996 () V!54401)

(assert (=> d!144443 (= (get!22187 (select (arr!43921 _values!1320) from!1980) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762996)))

(declare-fun b!1339815 () Bool)

(declare-fun get!22189 (ValueCell!17588 V!54401) V!54401)

(assert (=> b!1339815 (= e!762996 (get!22189 (select (arr!43921 _values!1320) from!1980) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1339816 () Bool)

(declare-fun get!22190 (ValueCell!17588 V!54401) V!54401)

(assert (=> b!1339816 (= e!762996 (get!22190 (select (arr!43921 _values!1320) from!1980) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144443 c!126665) b!1339815))

(assert (= (and d!144443 (not c!126665)) b!1339816))

(assert (=> b!1339815 m!1228105))

(assert (=> b!1339815 m!1228043))

(declare-fun m!1228345 () Bool)

(assert (=> b!1339815 m!1228345))

(assert (=> b!1339816 m!1228105))

(assert (=> b!1339816 m!1228043))

(declare-fun m!1228347 () Bool)

(assert (=> b!1339816 m!1228347))

(assert (=> b!1339671 d!144443))

(declare-fun d!144445 () Bool)

(declare-fun e!762997 () Bool)

(assert (=> d!144445 e!762997))

(declare-fun res!888620 () Bool)

(assert (=> d!144445 (=> (not res!888620) (not e!762997))))

(declare-fun lt!594189 () ListLongMap!21659)

(assert (=> d!144445 (= res!888620 (contains!9028 lt!594189 (_1!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!594190 () List!31132)

(assert (=> d!144445 (= lt!594189 (ListLongMap!21660 lt!594190))))

(declare-fun lt!594187 () Unit!43906)

(declare-fun lt!594188 () Unit!43906)

(assert (=> d!144445 (= lt!594187 lt!594188)))

(assert (=> d!144445 (= (getValueByKey!715 lt!594190 (_1!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!765 (_2!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144445 (= lt!594188 (lemmaContainsTupThenGetReturnValue!365 lt!594190 (_1!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144445 (= lt!594190 (insertStrictlySorted!494 (toList!10845 (ite c!126621 call!65070 (ite c!126624 call!65069 call!65068))) (_1!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144445 (= (+!4790 (ite c!126621 call!65070 (ite c!126624 call!65069 call!65068)) (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!594189)))

(declare-fun b!1339817 () Bool)

(declare-fun res!888621 () Bool)

(assert (=> b!1339817 (=> (not res!888621) (not e!762997))))

(assert (=> b!1339817 (= res!888621 (= (getValueByKey!715 (toList!10845 lt!594189) (_1!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!765 (_2!12008 (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1339818 () Bool)

(assert (=> b!1339818 (= e!762997 (contains!9032 (toList!10845 lt!594189) (ite (or c!126621 c!126624) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!144445 res!888620) b!1339817))

(assert (= (and b!1339817 res!888621) b!1339818))

(declare-fun m!1228349 () Bool)

(assert (=> d!144445 m!1228349))

(declare-fun m!1228351 () Bool)

(assert (=> d!144445 m!1228351))

(declare-fun m!1228353 () Bool)

(assert (=> d!144445 m!1228353))

(declare-fun m!1228355 () Bool)

(assert (=> d!144445 m!1228355))

(declare-fun m!1228357 () Bool)

(assert (=> b!1339817 m!1228357))

(declare-fun m!1228359 () Bool)

(assert (=> b!1339818 m!1228359))

(assert (=> bm!65062 d!144445))

(declare-fun lt!594193 () ListLongMap!21659)

(declare-fun b!1339819 () Bool)

(declare-fun e!763004 () Bool)

(assert (=> b!1339819 (= e!763004 (= lt!594193 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1339820 () Bool)

(declare-fun e!763000 () ListLongMap!21659)

(declare-fun e!763003 () ListLongMap!21659)

(assert (=> b!1339820 (= e!763000 e!763003)))

(declare-fun c!126669 () Bool)

(assert (=> b!1339820 (= c!126669 (validKeyInArray!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1339821 () Bool)

(declare-fun lt!594195 () Unit!43906)

(declare-fun lt!594196 () Unit!43906)

(assert (=> b!1339821 (= lt!594195 lt!594196)))

(declare-fun lt!594197 () (_ BitVec 64))

(declare-fun lt!594194 () ListLongMap!21659)

(declare-fun lt!594191 () V!54401)

(declare-fun lt!594192 () (_ BitVec 64))

(assert (=> b!1339821 (not (contains!9028 (+!4790 lt!594194 (tuple2!23995 lt!594197 lt!594191)) lt!594192))))

(assert (=> b!1339821 (= lt!594196 (addStillNotContains!501 lt!594194 lt!594197 lt!594191 lt!594192))))

(assert (=> b!1339821 (= lt!594192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1339821 (= lt!594191 (get!22187 (select (arr!43921 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1339821 (= lt!594197 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun call!65089 () ListLongMap!21659)

(assert (=> b!1339821 (= lt!594194 call!65089)))

(assert (=> b!1339821 (= e!763003 (+!4790 call!65089 (tuple2!23995 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22187 (select (arr!43921 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1339822 () Bool)

(declare-fun e!763001 () Bool)

(assert (=> b!1339822 (= e!763001 e!763004)))

(declare-fun c!126666 () Bool)

(assert (=> b!1339822 (= c!126666 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(declare-fun b!1339823 () Bool)

(declare-fun e!762999 () Bool)

(assert (=> b!1339823 (= e!763001 e!762999)))

(assert (=> b!1339823 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(declare-fun res!888625 () Bool)

(assert (=> b!1339823 (= res!888625 (contains!9028 lt!594193 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1339823 (=> (not res!888625) (not e!762999))))

(declare-fun bm!65086 () Bool)

(assert (=> bm!65086 (= call!65089 (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1339824 () Bool)

(declare-fun res!888623 () Bool)

(declare-fun e!762998 () Bool)

(assert (=> b!1339824 (=> (not res!888623) (not e!762998))))

(assert (=> b!1339824 (= res!888623 (not (contains!9028 lt!594193 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1339825 () Bool)

(declare-fun e!763002 () Bool)

(assert (=> b!1339825 (= e!763002 (validKeyInArray!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1339825 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1339826 () Bool)

(assert (=> b!1339826 (= e!763004 (isEmpty!1094 lt!594193))))

(declare-fun d!144447 () Bool)

(assert (=> d!144447 e!762998))

(declare-fun res!888624 () Bool)

(assert (=> d!144447 (=> (not res!888624) (not e!762998))))

(assert (=> d!144447 (= res!888624 (not (contains!9028 lt!594193 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144447 (= lt!594193 e!763000)))

(declare-fun c!126667 () Bool)

(assert (=> d!144447 (= c!126667 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(assert (=> d!144447 (validMask!0 mask!1998)))

(assert (=> d!144447 (= (getCurrentListMapNoExtraKeys!6439 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!594193)))

(declare-fun b!1339827 () Bool)

(assert (=> b!1339827 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(assert (=> b!1339827 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44472 _values!1320)))))

(assert (=> b!1339827 (= e!762999 (= (apply!1045 lt!594193 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22187 (select (arr!43921 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339828 () Bool)

(assert (=> b!1339828 (= e!763000 (ListLongMap!21660 Nil!31129))))

(declare-fun b!1339829 () Bool)

(assert (=> b!1339829 (= e!762998 e!763001)))

(declare-fun c!126668 () Bool)

(assert (=> b!1339829 (= c!126668 e!763002)))

(declare-fun res!888622 () Bool)

(assert (=> b!1339829 (=> (not res!888622) (not e!763002))))

(assert (=> b!1339829 (= res!888622 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44471 _keys!1590)))))

(declare-fun b!1339830 () Bool)

(assert (=> b!1339830 (= e!763003 call!65089)))

(assert (= (and d!144447 c!126667) b!1339828))

(assert (= (and d!144447 (not c!126667)) b!1339820))

(assert (= (and b!1339820 c!126669) b!1339821))

(assert (= (and b!1339820 (not c!126669)) b!1339830))

(assert (= (or b!1339821 b!1339830) bm!65086))

(assert (= (and d!144447 res!888624) b!1339824))

(assert (= (and b!1339824 res!888623) b!1339829))

(assert (= (and b!1339829 res!888622) b!1339825))

(assert (= (and b!1339829 c!126668) b!1339823))

(assert (= (and b!1339829 (not c!126668)) b!1339822))

(assert (= (and b!1339823 res!888625) b!1339827))

(assert (= (and b!1339822 c!126666) b!1339819))

(assert (= (and b!1339822 (not c!126666)) b!1339826))

(declare-fun b_lambda!24281 () Bool)

(assert (=> (not b_lambda!24281) (not b!1339821)))

(assert (=> b!1339821 t!45460))

(declare-fun b_and!50097 () Bool)

(assert (= b_and!50095 (and (=> t!45460 result!25341) b_and!50097)))

(declare-fun b_lambda!24283 () Bool)

(assert (=> (not b_lambda!24283) (not b!1339827)))

(assert (=> b!1339827 t!45460))

(declare-fun b_and!50099 () Bool)

(assert (= b_and!50097 (and (=> t!45460 result!25341) b_and!50099)))

(assert (=> b!1339827 m!1228045))

(assert (=> b!1339827 m!1228045))

(assert (=> b!1339827 m!1228043))

(assert (=> b!1339827 m!1228047))

(assert (=> b!1339827 m!1228029))

(declare-fun m!1228361 () Bool)

(assert (=> b!1339827 m!1228361))

(assert (=> b!1339827 m!1228029))

(assert (=> b!1339827 m!1228043))

(assert (=> b!1339825 m!1228029))

(assert (=> b!1339825 m!1228029))

(assert (=> b!1339825 m!1228031))

(declare-fun m!1228363 () Bool)

(assert (=> b!1339819 m!1228363))

(assert (=> b!1339820 m!1228029))

(assert (=> b!1339820 m!1228029))

(assert (=> b!1339820 m!1228031))

(declare-fun m!1228365 () Bool)

(assert (=> b!1339824 m!1228365))

(assert (=> b!1339821 m!1228045))

(declare-fun m!1228367 () Bool)

(assert (=> b!1339821 m!1228367))

(assert (=> b!1339821 m!1228045))

(assert (=> b!1339821 m!1228043))

(assert (=> b!1339821 m!1228047))

(assert (=> b!1339821 m!1228029))

(declare-fun m!1228369 () Bool)

(assert (=> b!1339821 m!1228369))

(declare-fun m!1228371 () Bool)

(assert (=> b!1339821 m!1228371))

(assert (=> b!1339821 m!1228043))

(assert (=> b!1339821 m!1228369))

(declare-fun m!1228373 () Bool)

(assert (=> b!1339821 m!1228373))

(declare-fun m!1228375 () Bool)

(assert (=> b!1339826 m!1228375))

(declare-fun m!1228377 () Bool)

(assert (=> d!144447 m!1228377))

(assert (=> d!144447 m!1227953))

(assert (=> b!1339823 m!1228029))

(assert (=> b!1339823 m!1228029))

(declare-fun m!1228379 () Bool)

(assert (=> b!1339823 m!1228379))

(assert (=> bm!65086 m!1228363))

(assert (=> bm!65068 d!144447))

(declare-fun b!1339831 () Bool)

(declare-fun e!763007 () Bool)

(declare-fun call!65090 () Bool)

(assert (=> b!1339831 (= e!763007 call!65090)))

(declare-fun d!144449 () Bool)

(declare-fun res!888627 () Bool)

(declare-fun e!763005 () Bool)

(assert (=> d!144449 (=> res!888627 e!763005)))

(assert (=> d!144449 (= res!888627 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44471 _keys!1590)))))

(assert (=> d!144449 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!763005)))

(declare-fun b!1339832 () Bool)

(declare-fun e!763006 () Bool)

(assert (=> b!1339832 (= e!763007 e!763006)))

(declare-fun lt!594198 () (_ BitVec 64))

(assert (=> b!1339832 (= lt!594198 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!594200 () Unit!43906)

(assert (=> b!1339832 (= lt!594200 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!594198 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1339832 (arrayContainsKey!0 _keys!1590 lt!594198 #b00000000000000000000000000000000)))

(declare-fun lt!594199 () Unit!43906)

(assert (=> b!1339832 (= lt!594199 lt!594200)))

(declare-fun res!888626 () Bool)

(assert (=> b!1339832 (= res!888626 (= (seekEntryOrOpen!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10007 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1339832 (=> (not res!888626) (not e!763006))))

(declare-fun bm!65087 () Bool)

(assert (=> bm!65087 (= call!65090 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1339833 () Bool)

(assert (=> b!1339833 (= e!763005 e!763007)))

(declare-fun c!126670 () Bool)

(assert (=> b!1339833 (= c!126670 (validKeyInArray!0 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1339834 () Bool)

(assert (=> b!1339834 (= e!763006 call!65090)))

(assert (= (and d!144449 (not res!888627)) b!1339833))

(assert (= (and b!1339833 c!126670) b!1339832))

(assert (= (and b!1339833 (not c!126670)) b!1339831))

(assert (= (and b!1339832 res!888626) b!1339834))

(assert (= (or b!1339834 b!1339831) bm!65087))

(assert (=> b!1339832 m!1228187))

(declare-fun m!1228381 () Bool)

(assert (=> b!1339832 m!1228381))

(declare-fun m!1228383 () Bool)

(assert (=> b!1339832 m!1228383))

(assert (=> b!1339832 m!1228187))

(declare-fun m!1228385 () Bool)

(assert (=> b!1339832 m!1228385))

(declare-fun m!1228387 () Bool)

(assert (=> bm!65087 m!1228387))

(assert (=> b!1339833 m!1228187))

(assert (=> b!1339833 m!1228187))

(assert (=> b!1339833 m!1228191))

(assert (=> bm!65081 d!144449))

(declare-fun d!144451 () Bool)

(declare-fun res!888632 () Bool)

(declare-fun e!763012 () Bool)

(assert (=> d!144451 (=> res!888632 e!763012)))

(assert (=> d!144451 (= res!888632 (and ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(assert (=> d!144451 (= (containsKey!741 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) e!763012)))

(declare-fun b!1339839 () Bool)

(declare-fun e!763013 () Bool)

(assert (=> b!1339839 (= e!763012 e!763013)))

(declare-fun res!888633 () Bool)

(assert (=> b!1339839 (=> (not res!888633) (not e!763013))))

(assert (=> b!1339839 (= res!888633 (and (or (not ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (bvsle (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)) ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1339840 () Bool)

(assert (=> b!1339840 (= e!763013 (containsKey!741 (t!45454 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) k0!1153))))

(assert (= (and d!144451 (not res!888632)) b!1339839))

(assert (= (and b!1339839 res!888633) b!1339840))

(declare-fun m!1228389 () Bool)

(assert (=> b!1339840 m!1228389))

(assert (=> d!144367 d!144451))

(declare-fun d!144453 () Bool)

(assert (=> d!144453 (= (apply!1045 lt!594058 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22188 (getValueByKey!715 (toList!10845 lt!594058) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38348 () Bool)

(assert (= bs!38348 d!144453))

(declare-fun m!1228391 () Bool)

(assert (=> bs!38348 m!1228391))

(assert (=> bs!38348 m!1228391))

(declare-fun m!1228393 () Bool)

(assert (=> bs!38348 m!1228393))

(assert (=> b!1339643 d!144453))

(declare-fun d!144455 () Bool)

(assert (=> d!144455 (arrayContainsKey!0 _keys!1590 lt!594107 #b00000000000000000000000000000000)))

(declare-fun lt!594203 () Unit!43906)

(declare-fun choose!13 (array!90925 (_ BitVec 64) (_ BitVec 32)) Unit!43906)

(assert (=> d!144455 (= lt!594203 (choose!13 _keys!1590 lt!594107 #b00000000000000000000000000000000))))

(assert (=> d!144455 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144455 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!594107 #b00000000000000000000000000000000) lt!594203)))

(declare-fun bs!38349 () Bool)

(assert (= bs!38349 d!144455))

(assert (=> bs!38349 m!1228153))

(declare-fun m!1228395 () Bool)

(assert (=> bs!38349 m!1228395))

(assert (=> b!1339706 d!144455))

(declare-fun d!144457 () Bool)

(declare-fun res!888638 () Bool)

(declare-fun e!763018 () Bool)

(assert (=> d!144457 (=> res!888638 e!763018)))

(assert (=> d!144457 (= res!888638 (= (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) lt!594107))))

(assert (=> d!144457 (= (arrayContainsKey!0 _keys!1590 lt!594107 #b00000000000000000000000000000000) e!763018)))

(declare-fun b!1339845 () Bool)

(declare-fun e!763019 () Bool)

(assert (=> b!1339845 (= e!763018 e!763019)))

(declare-fun res!888639 () Bool)

(assert (=> b!1339845 (=> (not res!888639) (not e!763019))))

(assert (=> b!1339845 (= res!888639 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44471 _keys!1590)))))

(declare-fun b!1339846 () Bool)

(assert (=> b!1339846 (= e!763019 (arrayContainsKey!0 _keys!1590 lt!594107 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144457 (not res!888638)) b!1339845))

(assert (= (and b!1339845 res!888639) b!1339846))

(assert (=> d!144457 m!1228143))

(declare-fun m!1228397 () Bool)

(assert (=> b!1339846 m!1228397))

(assert (=> b!1339706 d!144457))

(declare-fun b!1339859 () Bool)

(declare-fun c!126678 () Bool)

(declare-fun lt!594210 () (_ BitVec 64))

(assert (=> b!1339859 (= c!126678 (= lt!594210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!763028 () SeekEntryResult!10007)

(declare-fun e!763026 () SeekEntryResult!10007)

(assert (=> b!1339859 (= e!763028 e!763026)))

(declare-fun b!1339860 () Bool)

(declare-fun e!763027 () SeekEntryResult!10007)

(assert (=> b!1339860 (= e!763027 e!763028)))

(declare-fun lt!594212 () SeekEntryResult!10007)

(assert (=> b!1339860 (= lt!594210 (select (arr!43920 _keys!1590) (index!42401 lt!594212)))))

(declare-fun c!126677 () Bool)

(assert (=> b!1339860 (= c!126677 (= lt!594210 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1339861 () Bool)

(assert (=> b!1339861 (= e!763028 (Found!10007 (index!42401 lt!594212)))))

(declare-fun b!1339862 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90925 (_ BitVec 32)) SeekEntryResult!10007)

(assert (=> b!1339862 (= e!763026 (seekKeyOrZeroReturnVacant!0 (x!119523 lt!594212) (index!42401 lt!594212) (index!42401 lt!594212) (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(declare-fun b!1339863 () Bool)

(assert (=> b!1339863 (= e!763027 Undefined!10007)))

(declare-fun b!1339864 () Bool)

(assert (=> b!1339864 (= e!763026 (MissingZero!10007 (index!42401 lt!594212)))))

(declare-fun d!144459 () Bool)

(declare-fun lt!594211 () SeekEntryResult!10007)

(assert (=> d!144459 (and (or ((_ is Undefined!10007) lt!594211) (not ((_ is Found!10007) lt!594211)) (and (bvsge (index!42400 lt!594211) #b00000000000000000000000000000000) (bvslt (index!42400 lt!594211) (size!44471 _keys!1590)))) (or ((_ is Undefined!10007) lt!594211) ((_ is Found!10007) lt!594211) (not ((_ is MissingZero!10007) lt!594211)) (and (bvsge (index!42399 lt!594211) #b00000000000000000000000000000000) (bvslt (index!42399 lt!594211) (size!44471 _keys!1590)))) (or ((_ is Undefined!10007) lt!594211) ((_ is Found!10007) lt!594211) ((_ is MissingZero!10007) lt!594211) (not ((_ is MissingVacant!10007) lt!594211)) (and (bvsge (index!42402 lt!594211) #b00000000000000000000000000000000) (bvslt (index!42402 lt!594211) (size!44471 _keys!1590)))) (or ((_ is Undefined!10007) lt!594211) (ite ((_ is Found!10007) lt!594211) (= (select (arr!43920 _keys!1590) (index!42400 lt!594211)) (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10007) lt!594211) (= (select (arr!43920 _keys!1590) (index!42399 lt!594211)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10007) lt!594211) (= (select (arr!43920 _keys!1590) (index!42402 lt!594211)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144459 (= lt!594211 e!763027)))

(declare-fun c!126679 () Bool)

(assert (=> d!144459 (= c!126679 (and ((_ is Intermediate!10007) lt!594212) (undefined!10819 lt!594212)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90925 (_ BitVec 32)) SeekEntryResult!10007)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144459 (= lt!594212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!144459 (validMask!0 mask!1998)))

(assert (=> d!144459 (= (seekEntryOrOpen!0 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!594211)))

(assert (= (and d!144459 c!126679) b!1339863))

(assert (= (and d!144459 (not c!126679)) b!1339860))

(assert (= (and b!1339860 c!126677) b!1339861))

(assert (= (and b!1339860 (not c!126677)) b!1339859))

(assert (= (and b!1339859 c!126678) b!1339864))

(assert (= (and b!1339859 (not c!126678)) b!1339862))

(declare-fun m!1228399 () Bool)

(assert (=> b!1339860 m!1228399))

(assert (=> b!1339862 m!1228143))

(declare-fun m!1228401 () Bool)

(assert (=> b!1339862 m!1228401))

(declare-fun m!1228403 () Bool)

(assert (=> d!144459 m!1228403))

(declare-fun m!1228405 () Bool)

(assert (=> d!144459 m!1228405))

(assert (=> d!144459 m!1228143))

(declare-fun m!1228407 () Bool)

(assert (=> d!144459 m!1228407))

(assert (=> d!144459 m!1228407))

(assert (=> d!144459 m!1228143))

(declare-fun m!1228409 () Bool)

(assert (=> d!144459 m!1228409))

(declare-fun m!1228411 () Bool)

(assert (=> d!144459 m!1228411))

(assert (=> d!144459 m!1227953))

(assert (=> b!1339706 d!144459))

(declare-fun d!144461 () Bool)

(declare-fun e!763029 () Bool)

(assert (=> d!144461 e!763029))

(declare-fun res!888640 () Bool)

(assert (=> d!144461 (=> res!888640 e!763029)))

(declare-fun lt!594213 () Bool)

(assert (=> d!144461 (= res!888640 (not lt!594213))))

(declare-fun lt!594216 () Bool)

(assert (=> d!144461 (= lt!594213 lt!594216)))

(declare-fun lt!594215 () Unit!43906)

(declare-fun e!763030 () Unit!43906)

(assert (=> d!144461 (= lt!594215 e!763030)))

(declare-fun c!126680 () Bool)

(assert (=> d!144461 (= c!126680 lt!594216)))

(assert (=> d!144461 (= lt!594216 (containsKey!741 (toList!10845 lt!594058) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144461 (= (contains!9028 lt!594058 #b0000000000000000000000000000000000000000000000000000000000000000) lt!594213)))

(declare-fun b!1339865 () Bool)

(declare-fun lt!594214 () Unit!43906)

(assert (=> b!1339865 (= e!763030 lt!594214)))

(assert (=> b!1339865 (= lt!594214 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 lt!594058) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1339865 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594058) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339866 () Bool)

(declare-fun Unit!43916 () Unit!43906)

(assert (=> b!1339866 (= e!763030 Unit!43916)))

(declare-fun b!1339867 () Bool)

(assert (=> b!1339867 (= e!763029 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594058) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144461 c!126680) b!1339865))

(assert (= (and d!144461 (not c!126680)) b!1339866))

(assert (= (and d!144461 (not res!888640)) b!1339867))

(declare-fun m!1228413 () Bool)

(assert (=> d!144461 m!1228413))

(declare-fun m!1228415 () Bool)

(assert (=> b!1339865 m!1228415))

(assert (=> b!1339865 m!1228391))

(assert (=> b!1339865 m!1228391))

(declare-fun m!1228417 () Bool)

(assert (=> b!1339865 m!1228417))

(assert (=> b!1339867 m!1228391))

(assert (=> b!1339867 m!1228391))

(assert (=> b!1339867 m!1228417))

(assert (=> bm!65065 d!144461))

(declare-fun d!144463 () Bool)

(declare-fun e!763031 () Bool)

(assert (=> d!144463 e!763031))

(declare-fun res!888641 () Bool)

(assert (=> d!144463 (=> res!888641 e!763031)))

(declare-fun lt!594217 () Bool)

(assert (=> d!144463 (= res!888641 (not lt!594217))))

(declare-fun lt!594220 () Bool)

(assert (=> d!144463 (= lt!594217 lt!594220)))

(declare-fun lt!594219 () Unit!43906)

(declare-fun e!763032 () Unit!43906)

(assert (=> d!144463 (= lt!594219 e!763032)))

(declare-fun c!126681 () Bool)

(assert (=> d!144463 (= c!126681 lt!594220)))

(assert (=> d!144463 (= lt!594220 (containsKey!741 (toList!10845 lt!594058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144463 (= (contains!9028 lt!594058 #b1000000000000000000000000000000000000000000000000000000000000000) lt!594217)))

(declare-fun b!1339868 () Bool)

(declare-fun lt!594218 () Unit!43906)

(assert (=> b!1339868 (= e!763032 lt!594218)))

(assert (=> b!1339868 (= lt!594218 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 lt!594058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1339868 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339869 () Bool)

(declare-fun Unit!43917 () Unit!43906)

(assert (=> b!1339869 (= e!763032 Unit!43917)))

(declare-fun b!1339870 () Bool)

(assert (=> b!1339870 (= e!763031 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144463 c!126681) b!1339868))

(assert (= (and d!144463 (not c!126681)) b!1339869))

(assert (= (and d!144463 (not res!888641)) b!1339870))

(declare-fun m!1228419 () Bool)

(assert (=> d!144463 m!1228419))

(declare-fun m!1228421 () Bool)

(assert (=> b!1339868 m!1228421))

(assert (=> b!1339868 m!1228207))

(assert (=> b!1339868 m!1228207))

(declare-fun m!1228423 () Bool)

(assert (=> b!1339868 m!1228423))

(assert (=> b!1339870 m!1228207))

(assert (=> b!1339870 m!1228207))

(assert (=> b!1339870 m!1228423))

(assert (=> bm!65063 d!144463))

(assert (=> d!144369 d!144361))

(assert (=> b!1339592 d!144389))

(assert (=> b!1339592 d!144391))

(declare-fun d!144465 () Bool)

(declare-fun res!888642 () Bool)

(declare-fun e!763033 () Bool)

(assert (=> d!144465 (=> res!888642 e!763033)))

(assert (=> d!144465 (= res!888642 (and ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!144465 (= (containsKey!741 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!763033)))

(declare-fun b!1339871 () Bool)

(declare-fun e!763034 () Bool)

(assert (=> b!1339871 (= e!763033 e!763034)))

(declare-fun res!888643 () Bool)

(assert (=> b!1339871 (=> (not res!888643) (not e!763034))))

(assert (=> b!1339871 (= res!888643 (and (or (not ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31128) (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!12008 (h!32346 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1339872 () Bool)

(assert (=> b!1339872 (= e!763034 (containsKey!741 (t!45454 (toList!10845 (getCurrentListMap!5798 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!144465 (not res!888642)) b!1339871))

(assert (= (and b!1339871 res!888643) b!1339872))

(declare-fun m!1228425 () Bool)

(assert (=> b!1339872 m!1228425))

(assert (=> d!144371 d!144465))

(assert (=> d!144373 d!144361))

(declare-fun d!144467 () Bool)

(assert (=> d!144467 (= (apply!1045 lt!594084 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22188 (getValueByKey!715 (toList!10845 lt!594084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38350 () Bool)

(assert (= bs!38350 d!144467))

(assert (=> bs!38350 m!1228183))

(assert (=> bs!38350 m!1228183))

(declare-fun m!1228427 () Bool)

(assert (=> bs!38350 m!1228427))

(assert (=> b!1339666 d!144467))

(declare-fun d!144469 () Bool)

(assert (=> d!144469 (= (validKeyInArray!0 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43920 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1339696 d!144469))

(declare-fun d!144471 () Bool)

(declare-fun e!763035 () Bool)

(assert (=> d!144471 e!763035))

(declare-fun res!888644 () Bool)

(assert (=> d!144471 (=> res!888644 e!763035)))

(declare-fun lt!594221 () Bool)

(assert (=> d!144471 (= res!888644 (not lt!594221))))

(declare-fun lt!594224 () Bool)

(assert (=> d!144471 (= lt!594221 lt!594224)))

(declare-fun lt!594223 () Unit!43906)

(declare-fun e!763036 () Unit!43906)

(assert (=> d!144471 (= lt!594223 e!763036)))

(declare-fun c!126682 () Bool)

(assert (=> d!144471 (= c!126682 lt!594224)))

(assert (=> d!144471 (= lt!594224 (containsKey!741 (toList!10845 lt!594058) (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!144471 (= (contains!9028 lt!594058 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!594221)))

(declare-fun b!1339873 () Bool)

(declare-fun lt!594222 () Unit!43906)

(assert (=> b!1339873 (= e!763036 lt!594222)))

(assert (=> b!1339873 (= lt!594222 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 lt!594058) (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1339873 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594058) (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1339874 () Bool)

(declare-fun Unit!43918 () Unit!43906)

(assert (=> b!1339874 (= e!763036 Unit!43918)))

(declare-fun b!1339875 () Bool)

(assert (=> b!1339875 (= e!763035 (isDefined!524 (getValueByKey!715 (toList!10845 lt!594058) (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!144471 c!126682) b!1339873))

(assert (= (and d!144471 (not c!126682)) b!1339874))

(assert (= (and d!144471 (not res!888644)) b!1339875))

(assert (=> d!144471 m!1228029))

(declare-fun m!1228429 () Bool)

(assert (=> d!144471 m!1228429))

(assert (=> b!1339873 m!1228029))

(declare-fun m!1228431 () Bool)

(assert (=> b!1339873 m!1228431))

(assert (=> b!1339873 m!1228029))

(declare-fun m!1228433 () Bool)

(assert (=> b!1339873 m!1228433))

(assert (=> b!1339873 m!1228433))

(declare-fun m!1228435 () Bool)

(assert (=> b!1339873 m!1228435))

(assert (=> b!1339875 m!1228029))

(assert (=> b!1339875 m!1228433))

(assert (=> b!1339875 m!1228433))

(assert (=> b!1339875 m!1228435))

(assert (=> b!1339648 d!144471))

(declare-fun d!144473 () Bool)

(declare-fun e!763037 () Bool)

(assert (=> d!144473 e!763037))

(declare-fun res!888645 () Bool)

(assert (=> d!144473 (=> (not res!888645) (not e!763037))))

(declare-fun lt!594227 () ListLongMap!21659)

(assert (=> d!144473 (= res!888645 (contains!9028 lt!594227 (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!594228 () List!31132)

(assert (=> d!144473 (= lt!594227 (ListLongMap!21660 lt!594228))))

(declare-fun lt!594225 () Unit!43906)

(declare-fun lt!594226 () Unit!43906)

(assert (=> d!144473 (= lt!594225 lt!594226)))

(assert (=> d!144473 (= (getValueByKey!715 lt!594228 (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144473 (= lt!594226 (lemmaContainsTupThenGetReturnValue!365 lt!594228 (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144473 (= lt!594228 (insertStrictlySorted!494 (toList!10845 call!65078) (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144473 (= (+!4790 call!65078 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!594227)))

(declare-fun b!1339876 () Bool)

(declare-fun res!888646 () Bool)

(assert (=> b!1339876 (=> (not res!888646) (not e!763037))))

(assert (=> b!1339876 (= res!888646 (= (getValueByKey!715 (toList!10845 lt!594227) (_1!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1339877 () Bool)

(assert (=> b!1339877 (= e!763037 (contains!9032 (toList!10845 lt!594227) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!144473 res!888645) b!1339876))

(assert (= (and b!1339876 res!888646) b!1339877))

(declare-fun m!1228437 () Bool)

(assert (=> d!144473 m!1228437))

(declare-fun m!1228439 () Bool)

(assert (=> d!144473 m!1228439))

(declare-fun m!1228441 () Bool)

(assert (=> d!144473 m!1228441))

(declare-fun m!1228443 () Bool)

(assert (=> d!144473 m!1228443))

(declare-fun m!1228445 () Bool)

(assert (=> b!1339876 m!1228445))

(declare-fun m!1228447 () Bool)

(assert (=> b!1339877 m!1228447))

(assert (=> b!1339665 d!144473))

(assert (=> b!1339695 d!144469))

(declare-fun d!144475 () Bool)

(declare-fun e!763038 () Bool)

(assert (=> d!144475 e!763038))

(declare-fun res!888647 () Bool)

(assert (=> d!144475 (=> (not res!888647) (not e!763038))))

(declare-fun lt!594231 () ListLongMap!21659)

(assert (=> d!144475 (= res!888647 (contains!9028 lt!594231 (_1!12008 (tuple2!23995 lt!594063 zeroValue!1262))))))

(declare-fun lt!594232 () List!31132)

(assert (=> d!144475 (= lt!594231 (ListLongMap!21660 lt!594232))))

(declare-fun lt!594229 () Unit!43906)

(declare-fun lt!594230 () Unit!43906)

(assert (=> d!144475 (= lt!594229 lt!594230)))

(assert (=> d!144475 (= (getValueByKey!715 lt!594232 (_1!12008 (tuple2!23995 lt!594063 zeroValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594063 zeroValue!1262))))))

(assert (=> d!144475 (= lt!594230 (lemmaContainsTupThenGetReturnValue!365 lt!594232 (_1!12008 (tuple2!23995 lt!594063 zeroValue!1262)) (_2!12008 (tuple2!23995 lt!594063 zeroValue!1262))))))

(assert (=> d!144475 (= lt!594232 (insertStrictlySorted!494 (toList!10845 lt!594069) (_1!12008 (tuple2!23995 lt!594063 zeroValue!1262)) (_2!12008 (tuple2!23995 lt!594063 zeroValue!1262))))))

(assert (=> d!144475 (= (+!4790 lt!594069 (tuple2!23995 lt!594063 zeroValue!1262)) lt!594231)))

(declare-fun b!1339878 () Bool)

(declare-fun res!888648 () Bool)

(assert (=> b!1339878 (=> (not res!888648) (not e!763038))))

(assert (=> b!1339878 (= res!888648 (= (getValueByKey!715 (toList!10845 lt!594231) (_1!12008 (tuple2!23995 lt!594063 zeroValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594063 zeroValue!1262)))))))

(declare-fun b!1339879 () Bool)

(assert (=> b!1339879 (= e!763038 (contains!9032 (toList!10845 lt!594231) (tuple2!23995 lt!594063 zeroValue!1262)))))

(assert (= (and d!144475 res!888647) b!1339878))

(assert (= (and b!1339878 res!888648) b!1339879))

(declare-fun m!1228449 () Bool)

(assert (=> d!144475 m!1228449))

(declare-fun m!1228451 () Bool)

(assert (=> d!144475 m!1228451))

(declare-fun m!1228453 () Bool)

(assert (=> d!144475 m!1228453))

(declare-fun m!1228455 () Bool)

(assert (=> d!144475 m!1228455))

(declare-fun m!1228457 () Bool)

(assert (=> b!1339878 m!1228457))

(declare-fun m!1228459 () Bool)

(assert (=> b!1339879 m!1228459))

(assert (=> b!1339647 d!144475))

(declare-fun d!144477 () Bool)

(assert (=> d!144477 (= (apply!1045 (+!4790 lt!594059 (tuple2!23995 lt!594067 minValue!1262)) lt!594055) (get!22188 (getValueByKey!715 (toList!10845 (+!4790 lt!594059 (tuple2!23995 lt!594067 minValue!1262))) lt!594055)))))

(declare-fun bs!38351 () Bool)

(assert (= bs!38351 d!144477))

(declare-fun m!1228461 () Bool)

(assert (=> bs!38351 m!1228461))

(assert (=> bs!38351 m!1228461))

(declare-fun m!1228463 () Bool)

(assert (=> bs!38351 m!1228463))

(assert (=> b!1339647 d!144477))

(declare-fun d!144479 () Bool)

(assert (=> d!144479 (= (apply!1045 (+!4790 lt!594059 (tuple2!23995 lt!594067 minValue!1262)) lt!594055) (apply!1045 lt!594059 lt!594055))))

(declare-fun lt!594233 () Unit!43906)

(assert (=> d!144479 (= lt!594233 (choose!1972 lt!594059 lt!594067 minValue!1262 lt!594055))))

(declare-fun e!763039 () Bool)

(assert (=> d!144479 e!763039))

(declare-fun res!888649 () Bool)

(assert (=> d!144479 (=> (not res!888649) (not e!763039))))

(assert (=> d!144479 (= res!888649 (contains!9028 lt!594059 lt!594055))))

(assert (=> d!144479 (= (addApplyDifferent!574 lt!594059 lt!594067 minValue!1262 lt!594055) lt!594233)))

(declare-fun b!1339880 () Bool)

(assert (=> b!1339880 (= e!763039 (not (= lt!594055 lt!594067)))))

(assert (= (and d!144479 res!888649) b!1339880))

(declare-fun m!1228465 () Bool)

(assert (=> d!144479 m!1228465))

(assert (=> d!144479 m!1228067))

(assert (=> d!144479 m!1228069))

(assert (=> d!144479 m!1228067))

(declare-fun m!1228467 () Bool)

(assert (=> d!144479 m!1228467))

(assert (=> d!144479 m!1228063))

(assert (=> b!1339647 d!144479))

(declare-fun d!144481 () Bool)

(declare-fun e!763040 () Bool)

(assert (=> d!144481 e!763040))

(declare-fun res!888650 () Bool)

(assert (=> d!144481 (=> (not res!888650) (not e!763040))))

(declare-fun lt!594236 () ListLongMap!21659)

(assert (=> d!144481 (= res!888650 (contains!9028 lt!594236 (_1!12008 (tuple2!23995 lt!594066 zeroValue!1262))))))

(declare-fun lt!594237 () List!31132)

(assert (=> d!144481 (= lt!594236 (ListLongMap!21660 lt!594237))))

(declare-fun lt!594234 () Unit!43906)

(declare-fun lt!594235 () Unit!43906)

(assert (=> d!144481 (= lt!594234 lt!594235)))

(assert (=> d!144481 (= (getValueByKey!715 lt!594237 (_1!12008 (tuple2!23995 lt!594066 zeroValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594066 zeroValue!1262))))))

(assert (=> d!144481 (= lt!594235 (lemmaContainsTupThenGetReturnValue!365 lt!594237 (_1!12008 (tuple2!23995 lt!594066 zeroValue!1262)) (_2!12008 (tuple2!23995 lt!594066 zeroValue!1262))))))

(assert (=> d!144481 (= lt!594237 (insertStrictlySorted!494 (toList!10845 lt!594062) (_1!12008 (tuple2!23995 lt!594066 zeroValue!1262)) (_2!12008 (tuple2!23995 lt!594066 zeroValue!1262))))))

(assert (=> d!144481 (= (+!4790 lt!594062 (tuple2!23995 lt!594066 zeroValue!1262)) lt!594236)))

(declare-fun b!1339881 () Bool)

(declare-fun res!888651 () Bool)

(assert (=> b!1339881 (=> (not res!888651) (not e!763040))))

(assert (=> b!1339881 (= res!888651 (= (getValueByKey!715 (toList!10845 lt!594236) (_1!12008 (tuple2!23995 lt!594066 zeroValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594066 zeroValue!1262)))))))

(declare-fun b!1339882 () Bool)

(assert (=> b!1339882 (= e!763040 (contains!9032 (toList!10845 lt!594236) (tuple2!23995 lt!594066 zeroValue!1262)))))

(assert (= (and d!144481 res!888650) b!1339881))

(assert (= (and b!1339881 res!888651) b!1339882))

(declare-fun m!1228469 () Bool)

(assert (=> d!144481 m!1228469))

(declare-fun m!1228471 () Bool)

(assert (=> d!144481 m!1228471))

(declare-fun m!1228473 () Bool)

(assert (=> d!144481 m!1228473))

(declare-fun m!1228475 () Bool)

(assert (=> d!144481 m!1228475))

(declare-fun m!1228477 () Bool)

(assert (=> b!1339881 m!1228477))

(declare-fun m!1228479 () Bool)

(assert (=> b!1339882 m!1228479))

(assert (=> b!1339647 d!144481))

(declare-fun d!144483 () Bool)

(assert (=> d!144483 (contains!9028 (+!4790 lt!594069 (tuple2!23995 lt!594063 zeroValue!1262)) lt!594071)))

(declare-fun lt!594238 () Unit!43906)

(assert (=> d!144483 (= lt!594238 (choose!1973 lt!594069 lt!594063 zeroValue!1262 lt!594071))))

(assert (=> d!144483 (contains!9028 lt!594069 lt!594071)))

(assert (=> d!144483 (= (addStillContains!1197 lt!594069 lt!594063 zeroValue!1262 lt!594071) lt!594238)))

(declare-fun bs!38352 () Bool)

(assert (= bs!38352 d!144483))

(assert (=> bs!38352 m!1228053))

(assert (=> bs!38352 m!1228053))

(assert (=> bs!38352 m!1228057))

(declare-fun m!1228481 () Bool)

(assert (=> bs!38352 m!1228481))

(declare-fun m!1228483 () Bool)

(assert (=> bs!38352 m!1228483))

(assert (=> b!1339647 d!144483))

(declare-fun d!144485 () Bool)

(assert (=> d!144485 (= (apply!1045 (+!4790 lt!594062 (tuple2!23995 lt!594066 zeroValue!1262)) lt!594061) (apply!1045 lt!594062 lt!594061))))

(declare-fun lt!594239 () Unit!43906)

(assert (=> d!144485 (= lt!594239 (choose!1972 lt!594062 lt!594066 zeroValue!1262 lt!594061))))

(declare-fun e!763041 () Bool)

(assert (=> d!144485 e!763041))

(declare-fun res!888652 () Bool)

(assert (=> d!144485 (=> (not res!888652) (not e!763041))))

(assert (=> d!144485 (= res!888652 (contains!9028 lt!594062 lt!594061))))

(assert (=> d!144485 (= (addApplyDifferent!574 lt!594062 lt!594066 zeroValue!1262 lt!594061) lt!594239)))

(declare-fun b!1339883 () Bool)

(assert (=> b!1339883 (= e!763041 (not (= lt!594061 lt!594066)))))

(assert (= (and d!144485 res!888652) b!1339883))

(declare-fun m!1228485 () Bool)

(assert (=> d!144485 m!1228485))

(assert (=> d!144485 m!1228049))

(assert (=> d!144485 m!1228051))

(assert (=> d!144485 m!1228049))

(declare-fun m!1228487 () Bool)

(assert (=> d!144485 m!1228487))

(assert (=> d!144485 m!1228073))

(assert (=> b!1339647 d!144485))

(assert (=> b!1339647 d!144447))

(declare-fun d!144487 () Bool)

(assert (=> d!144487 (= (apply!1045 lt!594062 lt!594061) (get!22188 (getValueByKey!715 (toList!10845 lt!594062) lt!594061)))))

(declare-fun bs!38353 () Bool)

(assert (= bs!38353 d!144487))

(declare-fun m!1228489 () Bool)

(assert (=> bs!38353 m!1228489))

(assert (=> bs!38353 m!1228489))

(declare-fun m!1228491 () Bool)

(assert (=> bs!38353 m!1228491))

(assert (=> b!1339647 d!144487))

(declare-fun d!144489 () Bool)

(declare-fun e!763042 () Bool)

(assert (=> d!144489 e!763042))

(declare-fun res!888653 () Bool)

(assert (=> d!144489 (=> (not res!888653) (not e!763042))))

(declare-fun lt!594242 () ListLongMap!21659)

(assert (=> d!144489 (= res!888653 (contains!9028 lt!594242 (_1!12008 (tuple2!23995 lt!594053 minValue!1262))))))

(declare-fun lt!594243 () List!31132)

(assert (=> d!144489 (= lt!594242 (ListLongMap!21660 lt!594243))))

(declare-fun lt!594240 () Unit!43906)

(declare-fun lt!594241 () Unit!43906)

(assert (=> d!144489 (= lt!594240 lt!594241)))

(assert (=> d!144489 (= (getValueByKey!715 lt!594243 (_1!12008 (tuple2!23995 lt!594053 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594053 minValue!1262))))))

(assert (=> d!144489 (= lt!594241 (lemmaContainsTupThenGetReturnValue!365 lt!594243 (_1!12008 (tuple2!23995 lt!594053 minValue!1262)) (_2!12008 (tuple2!23995 lt!594053 minValue!1262))))))

(assert (=> d!144489 (= lt!594243 (insertStrictlySorted!494 (toList!10845 lt!594065) (_1!12008 (tuple2!23995 lt!594053 minValue!1262)) (_2!12008 (tuple2!23995 lt!594053 minValue!1262))))))

(assert (=> d!144489 (= (+!4790 lt!594065 (tuple2!23995 lt!594053 minValue!1262)) lt!594242)))

(declare-fun b!1339884 () Bool)

(declare-fun res!888654 () Bool)

(assert (=> b!1339884 (=> (not res!888654) (not e!763042))))

(assert (=> b!1339884 (= res!888654 (= (getValueByKey!715 (toList!10845 lt!594242) (_1!12008 (tuple2!23995 lt!594053 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594053 minValue!1262)))))))

(declare-fun b!1339885 () Bool)

(assert (=> b!1339885 (= e!763042 (contains!9032 (toList!10845 lt!594242) (tuple2!23995 lt!594053 minValue!1262)))))

(assert (= (and d!144489 res!888653) b!1339884))

(assert (= (and b!1339884 res!888654) b!1339885))

(declare-fun m!1228493 () Bool)

(assert (=> d!144489 m!1228493))

(declare-fun m!1228495 () Bool)

(assert (=> d!144489 m!1228495))

(declare-fun m!1228497 () Bool)

(assert (=> d!144489 m!1228497))

(declare-fun m!1228499 () Bool)

(assert (=> d!144489 m!1228499))

(declare-fun m!1228501 () Bool)

(assert (=> b!1339884 m!1228501))

(declare-fun m!1228503 () Bool)

(assert (=> b!1339885 m!1228503))

(assert (=> b!1339647 d!144489))

(declare-fun d!144491 () Bool)

(assert (=> d!144491 (= (apply!1045 (+!4790 lt!594065 (tuple2!23995 lt!594053 minValue!1262)) lt!594054) (get!22188 (getValueByKey!715 (toList!10845 (+!4790 lt!594065 (tuple2!23995 lt!594053 minValue!1262))) lt!594054)))))

(declare-fun bs!38354 () Bool)

(assert (= bs!38354 d!144491))

(declare-fun m!1228505 () Bool)

(assert (=> bs!38354 m!1228505))

(assert (=> bs!38354 m!1228505))

(declare-fun m!1228507 () Bool)

(assert (=> bs!38354 m!1228507))

(assert (=> b!1339647 d!144491))

(declare-fun d!144493 () Bool)

(declare-fun e!763043 () Bool)

(assert (=> d!144493 e!763043))

(declare-fun res!888655 () Bool)

(assert (=> d!144493 (=> res!888655 e!763043)))

(declare-fun lt!594244 () Bool)

(assert (=> d!144493 (= res!888655 (not lt!594244))))

(declare-fun lt!594247 () Bool)

(assert (=> d!144493 (= lt!594244 lt!594247)))

(declare-fun lt!594246 () Unit!43906)

(declare-fun e!763044 () Unit!43906)

(assert (=> d!144493 (= lt!594246 e!763044)))

(declare-fun c!126683 () Bool)

(assert (=> d!144493 (= c!126683 lt!594247)))

(assert (=> d!144493 (= lt!594247 (containsKey!741 (toList!10845 (+!4790 lt!594069 (tuple2!23995 lt!594063 zeroValue!1262))) lt!594071))))

(assert (=> d!144493 (= (contains!9028 (+!4790 lt!594069 (tuple2!23995 lt!594063 zeroValue!1262)) lt!594071) lt!594244)))

(declare-fun b!1339886 () Bool)

(declare-fun lt!594245 () Unit!43906)

(assert (=> b!1339886 (= e!763044 lt!594245)))

(assert (=> b!1339886 (= lt!594245 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10845 (+!4790 lt!594069 (tuple2!23995 lt!594063 zeroValue!1262))) lt!594071))))

(assert (=> b!1339886 (isDefined!524 (getValueByKey!715 (toList!10845 (+!4790 lt!594069 (tuple2!23995 lt!594063 zeroValue!1262))) lt!594071))))

(declare-fun b!1339887 () Bool)

(declare-fun Unit!43919 () Unit!43906)

(assert (=> b!1339887 (= e!763044 Unit!43919)))

(declare-fun b!1339888 () Bool)

(assert (=> b!1339888 (= e!763043 (isDefined!524 (getValueByKey!715 (toList!10845 (+!4790 lt!594069 (tuple2!23995 lt!594063 zeroValue!1262))) lt!594071)))))

(assert (= (and d!144493 c!126683) b!1339886))

(assert (= (and d!144493 (not c!126683)) b!1339887))

(assert (= (and d!144493 (not res!888655)) b!1339888))

(declare-fun m!1228509 () Bool)

(assert (=> d!144493 m!1228509))

(declare-fun m!1228511 () Bool)

(assert (=> b!1339886 m!1228511))

(declare-fun m!1228513 () Bool)

(assert (=> b!1339886 m!1228513))

(assert (=> b!1339886 m!1228513))

(declare-fun m!1228515 () Bool)

(assert (=> b!1339886 m!1228515))

(assert (=> b!1339888 m!1228513))

(assert (=> b!1339888 m!1228513))

(assert (=> b!1339888 m!1228515))

(assert (=> b!1339647 d!144493))

(declare-fun d!144495 () Bool)

(assert (=> d!144495 (= (apply!1045 (+!4790 lt!594065 (tuple2!23995 lt!594053 minValue!1262)) lt!594054) (apply!1045 lt!594065 lt!594054))))

(declare-fun lt!594248 () Unit!43906)

(assert (=> d!144495 (= lt!594248 (choose!1972 lt!594065 lt!594053 minValue!1262 lt!594054))))

(declare-fun e!763045 () Bool)

(assert (=> d!144495 e!763045))

(declare-fun res!888656 () Bool)

(assert (=> d!144495 (=> (not res!888656) (not e!763045))))

(assert (=> d!144495 (= res!888656 (contains!9028 lt!594065 lt!594054))))

(assert (=> d!144495 (= (addApplyDifferent!574 lt!594065 lt!594053 minValue!1262 lt!594054) lt!594248)))

(declare-fun b!1339889 () Bool)

(assert (=> b!1339889 (= e!763045 (not (= lt!594054 lt!594053)))))

(assert (= (and d!144495 res!888656) b!1339889))

(declare-fun m!1228517 () Bool)

(assert (=> d!144495 m!1228517))

(assert (=> d!144495 m!1228059))

(assert (=> d!144495 m!1228061))

(assert (=> d!144495 m!1228059))

(declare-fun m!1228519 () Bool)

(assert (=> d!144495 m!1228519))

(assert (=> d!144495 m!1228077))

(assert (=> b!1339647 d!144495))

(declare-fun d!144497 () Bool)

(assert (=> d!144497 (= (apply!1045 lt!594059 lt!594055) (get!22188 (getValueByKey!715 (toList!10845 lt!594059) lt!594055)))))

(declare-fun bs!38355 () Bool)

(assert (= bs!38355 d!144497))

(declare-fun m!1228521 () Bool)

(assert (=> bs!38355 m!1228521))

(assert (=> bs!38355 m!1228521))

(declare-fun m!1228523 () Bool)

(assert (=> bs!38355 m!1228523))

(assert (=> b!1339647 d!144497))

(declare-fun d!144499 () Bool)

(assert (=> d!144499 (= (apply!1045 (+!4790 lt!594062 (tuple2!23995 lt!594066 zeroValue!1262)) lt!594061) (get!22188 (getValueByKey!715 (toList!10845 (+!4790 lt!594062 (tuple2!23995 lt!594066 zeroValue!1262))) lt!594061)))))

(declare-fun bs!38356 () Bool)

(assert (= bs!38356 d!144499))

(declare-fun m!1228525 () Bool)

(assert (=> bs!38356 m!1228525))

(assert (=> bs!38356 m!1228525))

(declare-fun m!1228527 () Bool)

(assert (=> bs!38356 m!1228527))

(assert (=> b!1339647 d!144499))

(declare-fun d!144501 () Bool)

(assert (=> d!144501 (= (apply!1045 lt!594065 lt!594054) (get!22188 (getValueByKey!715 (toList!10845 lt!594065) lt!594054)))))

(declare-fun bs!38357 () Bool)

(assert (= bs!38357 d!144501))

(declare-fun m!1228529 () Bool)

(assert (=> bs!38357 m!1228529))

(assert (=> bs!38357 m!1228529))

(declare-fun m!1228531 () Bool)

(assert (=> bs!38357 m!1228531))

(assert (=> b!1339647 d!144501))

(declare-fun d!144503 () Bool)

(declare-fun e!763046 () Bool)

(assert (=> d!144503 e!763046))

(declare-fun res!888657 () Bool)

(assert (=> d!144503 (=> (not res!888657) (not e!763046))))

(declare-fun lt!594251 () ListLongMap!21659)

(assert (=> d!144503 (= res!888657 (contains!9028 lt!594251 (_1!12008 (tuple2!23995 lt!594067 minValue!1262))))))

(declare-fun lt!594252 () List!31132)

(assert (=> d!144503 (= lt!594251 (ListLongMap!21660 lt!594252))))

(declare-fun lt!594249 () Unit!43906)

(declare-fun lt!594250 () Unit!43906)

(assert (=> d!144503 (= lt!594249 lt!594250)))

(assert (=> d!144503 (= (getValueByKey!715 lt!594252 (_1!12008 (tuple2!23995 lt!594067 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594067 minValue!1262))))))

(assert (=> d!144503 (= lt!594250 (lemmaContainsTupThenGetReturnValue!365 lt!594252 (_1!12008 (tuple2!23995 lt!594067 minValue!1262)) (_2!12008 (tuple2!23995 lt!594067 minValue!1262))))))

(assert (=> d!144503 (= lt!594252 (insertStrictlySorted!494 (toList!10845 lt!594059) (_1!12008 (tuple2!23995 lt!594067 minValue!1262)) (_2!12008 (tuple2!23995 lt!594067 minValue!1262))))))

(assert (=> d!144503 (= (+!4790 lt!594059 (tuple2!23995 lt!594067 minValue!1262)) lt!594251)))

(declare-fun b!1339890 () Bool)

(declare-fun res!888658 () Bool)

(assert (=> b!1339890 (=> (not res!888658) (not e!763046))))

(assert (=> b!1339890 (= res!888658 (= (getValueByKey!715 (toList!10845 lt!594251) (_1!12008 (tuple2!23995 lt!594067 minValue!1262))) (Some!765 (_2!12008 (tuple2!23995 lt!594067 minValue!1262)))))))

(declare-fun b!1339891 () Bool)

(assert (=> b!1339891 (= e!763046 (contains!9032 (toList!10845 lt!594251) (tuple2!23995 lt!594067 minValue!1262)))))

(assert (= (and d!144503 res!888657) b!1339890))

(assert (= (and b!1339890 res!888658) b!1339891))

(declare-fun m!1228533 () Bool)

(assert (=> d!144503 m!1228533))

(declare-fun m!1228535 () Bool)

(assert (=> d!144503 m!1228535))

(declare-fun m!1228537 () Bool)

(assert (=> d!144503 m!1228537))

(declare-fun m!1228539 () Bool)

(assert (=> d!144503 m!1228539))

(declare-fun m!1228541 () Bool)

(assert (=> b!1339890 m!1228541))

(declare-fun m!1228543 () Bool)

(assert (=> b!1339891 m!1228543))

(assert (=> b!1339647 d!144503))

(assert (=> b!1339680 d!144379))

(declare-fun d!144505 () Bool)

(declare-fun e!763047 () Bool)

(assert (=> d!144505 e!763047))

(declare-fun res!888659 () Bool)

(assert (=> d!144505 (=> (not res!888659) (not e!763047))))

(declare-fun lt!594255 () ListLongMap!21659)

(assert (=> d!144505 (= res!888659 (contains!9028 lt!594255 (_1!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!594256 () List!31132)

(assert (=> d!144505 (= lt!594255 (ListLongMap!21660 lt!594256))))

(declare-fun lt!594253 () Unit!43906)

(declare-fun lt!594254 () Unit!43906)

(assert (=> d!144505 (= lt!594253 lt!594254)))

(assert (=> d!144505 (= (getValueByKey!715 lt!594256 (_1!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!765 (_2!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144505 (= lt!594254 (lemmaContainsTupThenGetReturnValue!365 lt!594256 (_1!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144505 (= lt!594256 (insertStrictlySorted!494 (toList!10845 (ite c!126628 call!65077 (ite c!126631 call!65076 call!65075))) (_1!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144505 (= (+!4790 (ite c!126628 call!65077 (ite c!126631 call!65076 call!65075)) (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!594255)))

(declare-fun b!1339892 () Bool)

(declare-fun res!888660 () Bool)

(assert (=> b!1339892 (=> (not res!888660) (not e!763047))))

(assert (=> b!1339892 (= res!888660 (= (getValueByKey!715 (toList!10845 lt!594255) (_1!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!765 (_2!12008 (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1339893 () Bool)

(assert (=> b!1339893 (= e!763047 (contains!9032 (toList!10845 lt!594255) (ite (or c!126628 c!126631) (tuple2!23995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!144505 res!888659) b!1339892))

(assert (= (and b!1339892 res!888660) b!1339893))

(declare-fun m!1228545 () Bool)

(assert (=> d!144505 m!1228545))

(declare-fun m!1228547 () Bool)

(assert (=> d!144505 m!1228547))

(declare-fun m!1228549 () Bool)

(assert (=> d!144505 m!1228549))

(declare-fun m!1228551 () Bool)

(assert (=> d!144505 m!1228551))

(declare-fun m!1228553 () Bool)

(assert (=> b!1339892 m!1228553))

(declare-fun m!1228555 () Bool)

(assert (=> b!1339893 m!1228555))

(assert (=> bm!65069 d!144505))

(declare-fun d!144507 () Bool)

(declare-fun lt!594259 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!660 (List!31133) (InoxSet (_ BitVec 64)))

(assert (=> d!144507 (= lt!594259 (select (content!660 Nil!31130) (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!763053 () Bool)

(assert (=> d!144507 (= lt!594259 e!763053)))

(declare-fun res!888665 () Bool)

(assert (=> d!144507 (=> (not res!888665) (not e!763053))))

(assert (=> d!144507 (= res!888665 ((_ is Cons!31129) Nil!31130))))

(assert (=> d!144507 (= (contains!9031 Nil!31130 (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)) lt!594259)))

(declare-fun b!1339898 () Bool)

(declare-fun e!763052 () Bool)

(assert (=> b!1339898 (= e!763053 e!763052)))

(declare-fun res!888666 () Bool)

(assert (=> b!1339898 (=> res!888666 e!763052)))

(assert (=> b!1339898 (= res!888666 (= (h!32347 Nil!31130) (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1339899 () Bool)

(assert (=> b!1339899 (= e!763052 (contains!9031 (t!45455 Nil!31130) (select (arr!43920 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!144507 res!888665) b!1339898))

(assert (= (and b!1339898 (not res!888666)) b!1339899))

(declare-fun m!1228557 () Bool)

(assert (=> d!144507 m!1228557))

(assert (=> d!144507 m!1228143))

(declare-fun m!1228559 () Bool)

(assert (=> d!144507 m!1228559))

(assert (=> b!1339899 m!1228143))

(declare-fun m!1228561 () Bool)

(assert (=> b!1339899 m!1228561))

(assert (=> b!1339693 d!144507))

(declare-fun d!144509 () Bool)

(assert (=> d!144509 (= (apply!1045 lt!594058 (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22188 (getValueByKey!715 (toList!10845 lt!594058) (select (arr!43920 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38358 () Bool)

(assert (= bs!38358 d!144509))

(assert (=> bs!38358 m!1228029))

(assert (=> bs!38358 m!1228433))

(assert (=> bs!38358 m!1228433))

(declare-fun m!1228563 () Bool)

(assert (=> bs!38358 m!1228563))

(assert (=> b!1339645 d!144509))

(declare-fun d!144511 () Bool)

(declare-fun c!126684 () Bool)

(assert (=> d!144511 (= c!126684 ((_ is ValueCellFull!17588) (select (arr!43921 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!763054 () V!54401)

(assert (=> d!144511 (= (get!22187 (select (arr!43921 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!763054)))

(declare-fun b!1339900 () Bool)

(assert (=> b!1339900 (= e!763054 (get!22189 (select (arr!43921 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1339901 () Bool)

(assert (=> b!1339901 (= e!763054 (get!22190 (select (arr!43921 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3744 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144511 c!126684) b!1339900))

(assert (= (and d!144511 (not c!126684)) b!1339901))

(assert (=> b!1339900 m!1228045))

(assert (=> b!1339900 m!1228043))

(declare-fun m!1228565 () Bool)

(assert (=> b!1339900 m!1228565))

(assert (=> b!1339901 m!1228045))

(assert (=> b!1339901 m!1228043))

(declare-fun m!1228567 () Bool)

(assert (=> b!1339901 m!1228567))

(assert (=> b!1339645 d!144511))

(assert (=> bm!65075 d!144427))

(assert (=> b!1339663 d!144379))

(assert (=> b!1339707 d!144469))

(declare-fun condMapEmpty!57157 () Bool)

(declare-fun mapDefault!57157 () ValueCell!17588)

(assert (=> mapNonEmpty!57156 (= condMapEmpty!57157 (= mapRest!57156 ((as const (Array (_ BitVec 32) ValueCell!17588)) mapDefault!57157)))))

(declare-fun e!763055 () Bool)

(declare-fun mapRes!57157 () Bool)

(assert (=> mapNonEmpty!57156 (= tp!108855 (and e!763055 mapRes!57157))))

(declare-fun b!1339902 () Bool)

(declare-fun e!763056 () Bool)

(assert (=> b!1339902 (= e!763056 tp_is_empty!36973)))

(declare-fun mapIsEmpty!57157 () Bool)

(assert (=> mapIsEmpty!57157 mapRes!57157))

(declare-fun mapNonEmpty!57157 () Bool)

(declare-fun tp!108856 () Bool)

(assert (=> mapNonEmpty!57157 (= mapRes!57157 (and tp!108856 e!763056))))

(declare-fun mapKey!57157 () (_ BitVec 32))

(declare-fun mapValue!57157 () ValueCell!17588)

(declare-fun mapRest!57157 () (Array (_ BitVec 32) ValueCell!17588))

(assert (=> mapNonEmpty!57157 (= mapRest!57156 (store mapRest!57157 mapKey!57157 mapValue!57157))))

(declare-fun b!1339903 () Bool)

(assert (=> b!1339903 (= e!763055 tp_is_empty!36973)))

(assert (= (and mapNonEmpty!57156 condMapEmpty!57157) mapIsEmpty!57157))

(assert (= (and mapNonEmpty!57156 (not condMapEmpty!57157)) mapNonEmpty!57157))

(assert (= (and mapNonEmpty!57157 ((_ is ValueCellFull!17588) mapValue!57157)) b!1339902))

(assert (= (and mapNonEmpty!57156 ((_ is ValueCellFull!17588) mapDefault!57157)) b!1339903))

(declare-fun m!1228569 () Bool)

(assert (=> mapNonEmpty!57157 m!1228569))

(declare-fun b_lambda!24285 () Bool)

(assert (= b_lambda!24277 (or (and start!113058 b_free!31063) b_lambda!24285)))

(declare-fun b_lambda!24287 () Bool)

(assert (= b_lambda!24281 (or (and start!113058 b_free!31063) b_lambda!24287)))

(declare-fun b_lambda!24289 () Bool)

(assert (= b_lambda!24283 (or (and start!113058 b_free!31063) b_lambda!24289)))

(declare-fun b_lambda!24291 () Bool)

(assert (= b_lambda!24279 (or (and start!113058 b_free!31063) b_lambda!24291)))

(check-sat (not b!1339884) (not d!144419) (not d!144493) (not b!1339754) (not d!144483) (not d!144489) (not b_lambda!24275) (not d!144505) (not b!1339742) (not b!1339797) (not d!144409) (not b!1339815) (not mapNonEmpty!57157) (not d!144429) (not d!144481) (not b_lambda!24273) (not b!1339868) (not b!1339793) (not d!144397) tp_is_empty!36973 (not d!144437) (not b!1339763) (not d!144439) (not b!1339820) (not b!1339800) (not b!1339885) (not b_next!31063) (not b!1339888) (not b!1339733) (not d!144411) (not bm!65085) (not b_lambda!24291) (not b!1339876) (not b!1339761) (not d!144459) (not d!144461) (not b!1339817) (not b!1339893) (not b!1339818) (not b!1339808) (not bm!65086) (not d!144383) (not b!1339717) (not b!1339739) (not d!144401) (not d!144487) (not b!1339827) (not b!1339899) (not b!1339741) (not b!1339749) (not b!1339755) (not d!144491) (not bm!65082) (not b!1339737) (not b!1339890) (not d!144413) (not b!1339886) (not b!1339873) (not d!144445) (not b!1339795) (not b!1339745) (not b!1339879) (not d!144431) (not d!144509) (not b!1339816) (not b!1339832) (not b!1339805) (not b!1339881) (not b!1339799) (not d!144421) (not b!1339819) (not b!1339809) (not b!1339719) (not d!144415) (not d!144473) (not d!144385) (not b!1339865) (not d!144387) (not d!144479) (not d!144475) (not b!1339762) (not d!144441) (not d!144463) (not b!1339823) (not d!144453) (not d!144389) (not b!1339901) (not d!144507) (not b!1339824) (not d!144405) (not d!144407) (not b!1339862) (not b!1339801) (not b!1339872) (not b_lambda!24285) (not b!1339806) (not b!1339878) (not d!144433) (not b!1339747) (not b!1339882) (not b!1339826) (not d!144471) (not b!1339794) (not b!1339764) (not d!144423) (not d!144393) (not b_lambda!24287) (not b!1339892) (not d!144497) (not d!144467) (not d!144425) (not b!1339833) (not b!1339735) (not d!144417) (not b_lambda!24289) (not d!144447) (not d!144477) (not d!144495) b_and!50099 (not b!1339877) (not b!1339846) (not b!1339867) (not b!1339810) (not d!144403) (not b!1339870) (not b!1339825) (not d!144455) (not b!1339900) (not b!1339875) (not d!144435) (not d!144501) (not b!1339798) (not d!144427) (not bm!65087) (not b!1339765) (not d!144503) (not b!1339840) (not b!1339722) (not b!1339767) (not b!1339891) (not d!144485) (not d!144499) (not b!1339821))
(check-sat b_and!50099 (not b_next!31063))
