; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109886 () Bool)

(assert start!109886)

(declare-fun b_free!29131 () Bool)

(declare-fun b_next!29131 () Bool)

(assert (=> start!109886 (= b_free!29131 (not b_next!29131))))

(declare-fun tp!102514 () Bool)

(declare-fun b_and!47227 () Bool)

(assert (=> start!109886 (= tp!102514 b_and!47227)))

(declare-fun res!863787 () Bool)

(declare-fun e!741911 () Bool)

(assert (=> start!109886 (=> (not res!863787) (not e!741911))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109886 (= res!863787 (validMask!0 mask!2175))))

(assert (=> start!109886 e!741911))

(declare-fun tp_is_empty!34771 () Bool)

(assert (=> start!109886 tp_is_empty!34771))

(assert (=> start!109886 true))

(declare-datatypes ((V!51465 0))(
  ( (V!51466 (val!17460 Int)) )
))
(declare-datatypes ((ValueCell!16487 0))(
  ( (ValueCellFull!16487 (v!20059 V!51465)) (EmptyCell!16487) )
))
(declare-datatypes ((array!86587 0))(
  ( (array!86588 (arr!41789 (Array (_ BitVec 32) ValueCell!16487)) (size!42340 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86587)

(declare-fun e!741908 () Bool)

(declare-fun array_inv!31861 (array!86587) Bool)

(assert (=> start!109886 (and (array_inv!31861 _values!1445) e!741908)))

(declare-datatypes ((array!86589 0))(
  ( (array!86590 (arr!41790 (Array (_ BitVec 32) (_ BitVec 64))) (size!42341 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86589)

(declare-fun array_inv!31862 (array!86589) Bool)

(assert (=> start!109886 (array_inv!31862 _keys!1741)))

(assert (=> start!109886 tp!102514))

(declare-fun b!1300288 () Bool)

(declare-fun res!863786 () Bool)

(assert (=> b!1300288 (=> (not res!863786) (not e!741911))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1300288 (= res!863786 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42341 _keys!1741)) (= (select (arr!41790 _keys!1741) from!2144) k0!1205)))))

(declare-fun b!1300289 () Bool)

(declare-fun res!863790 () Bool)

(assert (=> b!1300289 (=> (not res!863790) (not e!741911))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300289 (= res!863790 (and (= (size!42340 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42341 _keys!1741) (size!42340 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300290 () Bool)

(declare-fun e!741910 () Bool)

(assert (=> b!1300290 (= e!741910 tp_is_empty!34771)))

(declare-fun b!1300291 () Bool)

(declare-fun e!741909 () Bool)

(assert (=> b!1300291 (= e!741909 tp_is_empty!34771)))

(declare-fun mapNonEmpty!53720 () Bool)

(declare-fun mapRes!53720 () Bool)

(declare-fun tp!102515 () Bool)

(assert (=> mapNonEmpty!53720 (= mapRes!53720 (and tp!102515 e!741909))))

(declare-fun mapKey!53720 () (_ BitVec 32))

(declare-fun mapRest!53720 () (Array (_ BitVec 32) ValueCell!16487))

(declare-fun mapValue!53720 () ValueCell!16487)

(assert (=> mapNonEmpty!53720 (= (arr!41789 _values!1445) (store mapRest!53720 mapKey!53720 mapValue!53720))))

(declare-fun b!1300292 () Bool)

(declare-fun res!863791 () Bool)

(assert (=> b!1300292 (=> (not res!863791) (not e!741911))))

(declare-datatypes ((List!29685 0))(
  ( (Nil!29682) (Cons!29681 (h!30899 (_ BitVec 64)) (t!43243 List!29685)) )
))
(declare-fun arrayNoDuplicates!0 (array!86589 (_ BitVec 32) List!29685) Bool)

(assert (=> b!1300292 (= res!863791 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29682))))

(declare-fun b!1300293 () Bool)

(declare-fun arrayContainsKey!0 (array!86589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1300293 (= e!741911 (not (arrayContainsKey!0 _keys!1741 k0!1205 from!2144)))))

(declare-fun b!1300294 () Bool)

(declare-fun res!863789 () Bool)

(assert (=> b!1300294 (=> (not res!863789) (not e!741911))))

(assert (=> b!1300294 (= res!863789 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42341 _keys!1741))))))

(declare-fun b!1300295 () Bool)

(declare-fun res!863785 () Bool)

(assert (=> b!1300295 (=> (not res!863785) (not e!741911))))

(declare-fun minValue!1387 () V!51465)

(declare-fun zeroValue!1387 () V!51465)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22526 0))(
  ( (tuple2!22527 (_1!11274 (_ BitVec 64)) (_2!11274 V!51465)) )
))
(declare-datatypes ((List!29686 0))(
  ( (Nil!29683) (Cons!29682 (h!30900 tuple2!22526) (t!43244 List!29686)) )
))
(declare-datatypes ((ListLongMap!20191 0))(
  ( (ListLongMap!20192 (toList!10111 List!29686)) )
))
(declare-fun contains!8242 (ListLongMap!20191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5130 (array!86589 array!86587 (_ BitVec 32) (_ BitVec 32) V!51465 V!51465 (_ BitVec 32) Int) ListLongMap!20191)

(assert (=> b!1300295 (= res!863785 (contains!8242 (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300296 () Bool)

(assert (=> b!1300296 (= e!741908 (and e!741910 mapRes!53720))))

(declare-fun condMapEmpty!53720 () Bool)

(declare-fun mapDefault!53720 () ValueCell!16487)

(assert (=> b!1300296 (= condMapEmpty!53720 (= (arr!41789 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16487)) mapDefault!53720)))))

(declare-fun mapIsEmpty!53720 () Bool)

(assert (=> mapIsEmpty!53720 mapRes!53720))

(declare-fun b!1300297 () Bool)

(declare-fun res!863788 () Bool)

(assert (=> b!1300297 (=> (not res!863788) (not e!741911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86589 (_ BitVec 32)) Bool)

(assert (=> b!1300297 (= res!863788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109886 res!863787) b!1300289))

(assert (= (and b!1300289 res!863790) b!1300297))

(assert (= (and b!1300297 res!863788) b!1300292))

(assert (= (and b!1300292 res!863791) b!1300294))

(assert (= (and b!1300294 res!863789) b!1300295))

(assert (= (and b!1300295 res!863785) b!1300288))

(assert (= (and b!1300288 res!863786) b!1300293))

(assert (= (and b!1300296 condMapEmpty!53720) mapIsEmpty!53720))

(assert (= (and b!1300296 (not condMapEmpty!53720)) mapNonEmpty!53720))

(get-info :version)

(assert (= (and mapNonEmpty!53720 ((_ is ValueCellFull!16487) mapValue!53720)) b!1300291))

(assert (= (and b!1300296 ((_ is ValueCellFull!16487) mapDefault!53720)) b!1300290))

(assert (= start!109886 b!1300296))

(declare-fun m!1191893 () Bool)

(assert (=> b!1300297 m!1191893))

(declare-fun m!1191895 () Bool)

(assert (=> b!1300295 m!1191895))

(assert (=> b!1300295 m!1191895))

(declare-fun m!1191897 () Bool)

(assert (=> b!1300295 m!1191897))

(declare-fun m!1191899 () Bool)

(assert (=> b!1300288 m!1191899))

(declare-fun m!1191901 () Bool)

(assert (=> start!109886 m!1191901))

(declare-fun m!1191903 () Bool)

(assert (=> start!109886 m!1191903))

(declare-fun m!1191905 () Bool)

(assert (=> start!109886 m!1191905))

(declare-fun m!1191907 () Bool)

(assert (=> b!1300293 m!1191907))

(declare-fun m!1191909 () Bool)

(assert (=> mapNonEmpty!53720 m!1191909))

(declare-fun m!1191911 () Bool)

(assert (=> b!1300292 m!1191911))

(check-sat (not b!1300293) b_and!47227 (not b!1300295) (not b!1300292) tp_is_empty!34771 (not mapNonEmpty!53720) (not b_next!29131) (not start!109886) (not b!1300297))
(check-sat b_and!47227 (not b_next!29131))
(get-model)

(declare-fun d!141527 () Bool)

(declare-fun e!741946 () Bool)

(assert (=> d!141527 e!741946))

(declare-fun res!863836 () Bool)

(assert (=> d!141527 (=> res!863836 e!741946)))

(declare-fun lt!581362 () Bool)

(assert (=> d!141527 (= res!863836 (not lt!581362))))

(declare-fun lt!581360 () Bool)

(assert (=> d!141527 (= lt!581362 lt!581360)))

(declare-datatypes ((Unit!42979 0))(
  ( (Unit!42980) )
))
(declare-fun lt!581363 () Unit!42979)

(declare-fun e!741947 () Unit!42979)

(assert (=> d!141527 (= lt!581363 e!741947)))

(declare-fun c!124854 () Bool)

(assert (=> d!141527 (= c!124854 lt!581360)))

(declare-fun containsKey!718 (List!29686 (_ BitVec 64)) Bool)

(assert (=> d!141527 (= lt!581360 (containsKey!718 (toList!10111 (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141527 (= (contains!8242 (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581362)))

(declare-fun b!1300364 () Bool)

(declare-fun lt!581361 () Unit!42979)

(assert (=> b!1300364 (= e!741947 lt!581361)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!464 (List!29686 (_ BitVec 64)) Unit!42979)

(assert (=> b!1300364 (= lt!581361 (lemmaContainsKeyImpliesGetValueByKeyDefined!464 (toList!10111 (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!743 0))(
  ( (Some!742 (v!20062 V!51465)) (None!741) )
))
(declare-fun isDefined!501 (Option!743) Bool)

(declare-fun getValueByKey!692 (List!29686 (_ BitVec 64)) Option!743)

(assert (=> b!1300364 (isDefined!501 (getValueByKey!692 (toList!10111 (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1300365 () Bool)

(declare-fun Unit!42981 () Unit!42979)

(assert (=> b!1300365 (= e!741947 Unit!42981)))

(declare-fun b!1300366 () Bool)

(assert (=> b!1300366 (= e!741946 (isDefined!501 (getValueByKey!692 (toList!10111 (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141527 c!124854) b!1300364))

(assert (= (and d!141527 (not c!124854)) b!1300365))

(assert (= (and d!141527 (not res!863836)) b!1300366))

(declare-fun m!1191953 () Bool)

(assert (=> d!141527 m!1191953))

(declare-fun m!1191955 () Bool)

(assert (=> b!1300364 m!1191955))

(declare-fun m!1191957 () Bool)

(assert (=> b!1300364 m!1191957))

(assert (=> b!1300364 m!1191957))

(declare-fun m!1191959 () Bool)

(assert (=> b!1300364 m!1191959))

(assert (=> b!1300366 m!1191957))

(assert (=> b!1300366 m!1191957))

(assert (=> b!1300366 m!1191959))

(assert (=> b!1300295 d!141527))

(declare-fun b!1300409 () Bool)

(declare-fun e!741983 () ListLongMap!20191)

(declare-fun call!63625 () ListLongMap!20191)

(assert (=> b!1300409 (= e!741983 call!63625)))

(declare-fun b!1300410 () Bool)

(declare-fun e!741985 () Bool)

(declare-fun call!63627 () Bool)

(assert (=> b!1300410 (= e!741985 (not call!63627))))

(declare-fun b!1300411 () Bool)

(declare-fun e!741980 () Bool)

(declare-fun call!63626 () Bool)

(assert (=> b!1300411 (= e!741980 (not call!63626))))

(declare-fun b!1300412 () Bool)

(declare-fun e!741984 () Bool)

(declare-fun lt!581428 () ListLongMap!20191)

(declare-fun apply!1022 (ListLongMap!20191 (_ BitVec 64)) V!51465)

(assert (=> b!1300412 (= e!741984 (= (apply!1022 lt!581428 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1300413 () Bool)

(declare-fun e!741986 () Bool)

(assert (=> b!1300413 (= e!741986 e!741980)))

(declare-fun c!124872 () Bool)

(assert (=> b!1300413 (= c!124872 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63620 () Bool)

(assert (=> bm!63620 (= call!63626 (contains!8242 lt!581428 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1300414 () Bool)

(declare-fun e!741975 () ListLongMap!20191)

(declare-fun e!741977 () ListLongMap!20191)

(assert (=> b!1300414 (= e!741975 e!741977)))

(declare-fun c!124869 () Bool)

(assert (=> b!1300414 (= c!124869 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300415 () Bool)

(declare-fun call!63628 () ListLongMap!20191)

(assert (=> b!1300415 (= e!741983 call!63628)))

(declare-fun b!1300416 () Bool)

(declare-fun call!63629 () ListLongMap!20191)

(declare-fun +!4488 (ListLongMap!20191 tuple2!22526) ListLongMap!20191)

(assert (=> b!1300416 (= e!741975 (+!4488 call!63629 (tuple2!22527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun e!741979 () Bool)

(declare-fun b!1300417 () Bool)

(declare-fun get!21152 (ValueCell!16487 V!51465) V!51465)

(declare-fun dynLambda!3479 (Int (_ BitVec 64)) V!51465)

(assert (=> b!1300417 (= e!741979 (= (apply!1022 lt!581428 (select (arr!41790 _keys!1741) from!2144)) (get!21152 (select (arr!41789 _values!1445) from!2144) (dynLambda!3479 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300417 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42340 _values!1445)))))

(assert (=> b!1300417 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42341 _keys!1741)))))

(declare-fun b!1300418 () Bool)

(declare-fun e!741974 () Bool)

(assert (=> b!1300418 (= e!741974 (= (apply!1022 lt!581428 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun call!63624 () ListLongMap!20191)

(declare-fun bm!63622 () Bool)

(declare-fun call!63623 () ListLongMap!20191)

(declare-fun c!124867 () Bool)

(assert (=> bm!63622 (= call!63629 (+!4488 (ite c!124867 call!63624 (ite c!124869 call!63623 call!63628)) (ite (or c!124867 c!124869) (tuple2!22527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1300419 () Bool)

(assert (=> b!1300419 (= e!741980 e!741984)))

(declare-fun res!863863 () Bool)

(assert (=> b!1300419 (= res!863863 call!63626)))

(assert (=> b!1300419 (=> (not res!863863) (not e!741984))))

(declare-fun b!1300420 () Bool)

(declare-fun e!741981 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300420 (= e!741981 (validKeyInArray!0 (select (arr!41790 _keys!1741) from!2144)))))

(declare-fun b!1300421 () Bool)

(declare-fun res!863859 () Bool)

(assert (=> b!1300421 (=> (not res!863859) (not e!741986))))

(assert (=> b!1300421 (= res!863859 e!741985)))

(declare-fun c!124870 () Bool)

(assert (=> b!1300421 (= c!124870 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!63621 () Bool)

(assert (=> bm!63621 (= call!63628 call!63623)))

(declare-fun d!141529 () Bool)

(assert (=> d!141529 e!741986))

(declare-fun res!863858 () Bool)

(assert (=> d!141529 (=> (not res!863858) (not e!741986))))

(assert (=> d!141529 (= res!863858 (or (bvsge from!2144 (size!42341 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42341 _keys!1741)))))))

(declare-fun lt!581425 () ListLongMap!20191)

(assert (=> d!141529 (= lt!581428 lt!581425)))

(declare-fun lt!581413 () Unit!42979)

(declare-fun e!741978 () Unit!42979)

(assert (=> d!141529 (= lt!581413 e!741978)))

(declare-fun c!124868 () Bool)

(assert (=> d!141529 (= c!124868 e!741981)))

(declare-fun res!863862 () Bool)

(assert (=> d!141529 (=> (not res!863862) (not e!741981))))

(assert (=> d!141529 (= res!863862 (bvslt from!2144 (size!42341 _keys!1741)))))

(assert (=> d!141529 (= lt!581425 e!741975)))

(assert (=> d!141529 (= c!124867 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141529 (validMask!0 mask!2175)))

(assert (=> d!141529 (= (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581428)))

(declare-fun b!1300422 () Bool)

(declare-fun res!863857 () Bool)

(assert (=> b!1300422 (=> (not res!863857) (not e!741986))))

(declare-fun e!741976 () Bool)

(assert (=> b!1300422 (= res!863857 e!741976)))

(declare-fun res!863856 () Bool)

(assert (=> b!1300422 (=> res!863856 e!741976)))

(declare-fun e!741982 () Bool)

(assert (=> b!1300422 (= res!863856 (not e!741982))))

(declare-fun res!863855 () Bool)

(assert (=> b!1300422 (=> (not res!863855) (not e!741982))))

(assert (=> b!1300422 (= res!863855 (bvslt from!2144 (size!42341 _keys!1741)))))

(declare-fun bm!63623 () Bool)

(assert (=> bm!63623 (= call!63623 call!63624)))

(declare-fun b!1300423 () Bool)

(assert (=> b!1300423 (= e!741982 (validKeyInArray!0 (select (arr!41790 _keys!1741) from!2144)))))

(declare-fun b!1300424 () Bool)

(declare-fun c!124871 () Bool)

(assert (=> b!1300424 (= c!124871 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1300424 (= e!741977 e!741983)))

(declare-fun b!1300425 () Bool)

(assert (=> b!1300425 (= e!741985 e!741974)))

(declare-fun res!863860 () Bool)

(assert (=> b!1300425 (= res!863860 call!63627)))

(assert (=> b!1300425 (=> (not res!863860) (not e!741974))))

(declare-fun bm!63624 () Bool)

(assert (=> bm!63624 (= call!63627 (contains!8242 lt!581428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63625 () Bool)

(assert (=> bm!63625 (= call!63625 call!63629)))

(declare-fun bm!63626 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6128 (array!86589 array!86587 (_ BitVec 32) (_ BitVec 32) V!51465 V!51465 (_ BitVec 32) Int) ListLongMap!20191)

(assert (=> bm!63626 (= call!63624 (getCurrentListMapNoExtraKeys!6128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300426 () Bool)

(assert (=> b!1300426 (= e!741977 call!63625)))

(declare-fun b!1300427 () Bool)

(declare-fun lt!581421 () Unit!42979)

(assert (=> b!1300427 (= e!741978 lt!581421)))

(declare-fun lt!581423 () ListLongMap!20191)

(assert (=> b!1300427 (= lt!581423 (getCurrentListMapNoExtraKeys!6128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581416 () (_ BitVec 64))

(assert (=> b!1300427 (= lt!581416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581422 () (_ BitVec 64))

(assert (=> b!1300427 (= lt!581422 (select (arr!41790 _keys!1741) from!2144))))

(declare-fun lt!581426 () Unit!42979)

(declare-fun addStillContains!1109 (ListLongMap!20191 (_ BitVec 64) V!51465 (_ BitVec 64)) Unit!42979)

(assert (=> b!1300427 (= lt!581426 (addStillContains!1109 lt!581423 lt!581416 zeroValue!1387 lt!581422))))

(assert (=> b!1300427 (contains!8242 (+!4488 lt!581423 (tuple2!22527 lt!581416 zeroValue!1387)) lt!581422)))

(declare-fun lt!581408 () Unit!42979)

(assert (=> b!1300427 (= lt!581408 lt!581426)))

(declare-fun lt!581424 () ListLongMap!20191)

(assert (=> b!1300427 (= lt!581424 (getCurrentListMapNoExtraKeys!6128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581417 () (_ BitVec 64))

(assert (=> b!1300427 (= lt!581417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581427 () (_ BitVec 64))

(assert (=> b!1300427 (= lt!581427 (select (arr!41790 _keys!1741) from!2144))))

(declare-fun lt!581412 () Unit!42979)

(declare-fun addApplyDifferent!551 (ListLongMap!20191 (_ BitVec 64) V!51465 (_ BitVec 64)) Unit!42979)

(assert (=> b!1300427 (= lt!581412 (addApplyDifferent!551 lt!581424 lt!581417 minValue!1387 lt!581427))))

(assert (=> b!1300427 (= (apply!1022 (+!4488 lt!581424 (tuple2!22527 lt!581417 minValue!1387)) lt!581427) (apply!1022 lt!581424 lt!581427))))

(declare-fun lt!581419 () Unit!42979)

(assert (=> b!1300427 (= lt!581419 lt!581412)))

(declare-fun lt!581409 () ListLongMap!20191)

(assert (=> b!1300427 (= lt!581409 (getCurrentListMapNoExtraKeys!6128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581414 () (_ BitVec 64))

(assert (=> b!1300427 (= lt!581414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581420 () (_ BitVec 64))

(assert (=> b!1300427 (= lt!581420 (select (arr!41790 _keys!1741) from!2144))))

(declare-fun lt!581429 () Unit!42979)

(assert (=> b!1300427 (= lt!581429 (addApplyDifferent!551 lt!581409 lt!581414 zeroValue!1387 lt!581420))))

(assert (=> b!1300427 (= (apply!1022 (+!4488 lt!581409 (tuple2!22527 lt!581414 zeroValue!1387)) lt!581420) (apply!1022 lt!581409 lt!581420))))

(declare-fun lt!581410 () Unit!42979)

(assert (=> b!1300427 (= lt!581410 lt!581429)))

(declare-fun lt!581418 () ListLongMap!20191)

(assert (=> b!1300427 (= lt!581418 (getCurrentListMapNoExtraKeys!6128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581415 () (_ BitVec 64))

(assert (=> b!1300427 (= lt!581415 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581411 () (_ BitVec 64))

(assert (=> b!1300427 (= lt!581411 (select (arr!41790 _keys!1741) from!2144))))

(assert (=> b!1300427 (= lt!581421 (addApplyDifferent!551 lt!581418 lt!581415 minValue!1387 lt!581411))))

(assert (=> b!1300427 (= (apply!1022 (+!4488 lt!581418 (tuple2!22527 lt!581415 minValue!1387)) lt!581411) (apply!1022 lt!581418 lt!581411))))

(declare-fun b!1300428 () Bool)

(declare-fun Unit!42982 () Unit!42979)

(assert (=> b!1300428 (= e!741978 Unit!42982)))

(declare-fun b!1300429 () Bool)

(assert (=> b!1300429 (= e!741976 e!741979)))

(declare-fun res!863861 () Bool)

(assert (=> b!1300429 (=> (not res!863861) (not e!741979))))

(assert (=> b!1300429 (= res!863861 (contains!8242 lt!581428 (select (arr!41790 _keys!1741) from!2144)))))

(assert (=> b!1300429 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42341 _keys!1741)))))

(assert (= (and d!141529 c!124867) b!1300416))

(assert (= (and d!141529 (not c!124867)) b!1300414))

(assert (= (and b!1300414 c!124869) b!1300426))

(assert (= (and b!1300414 (not c!124869)) b!1300424))

(assert (= (and b!1300424 c!124871) b!1300409))

(assert (= (and b!1300424 (not c!124871)) b!1300415))

(assert (= (or b!1300409 b!1300415) bm!63621))

(assert (= (or b!1300426 bm!63621) bm!63623))

(assert (= (or b!1300426 b!1300409) bm!63625))

(assert (= (or b!1300416 bm!63623) bm!63626))

(assert (= (or b!1300416 bm!63625) bm!63622))

(assert (= (and d!141529 res!863862) b!1300420))

(assert (= (and d!141529 c!124868) b!1300427))

(assert (= (and d!141529 (not c!124868)) b!1300428))

(assert (= (and d!141529 res!863858) b!1300422))

(assert (= (and b!1300422 res!863855) b!1300423))

(assert (= (and b!1300422 (not res!863856)) b!1300429))

(assert (= (and b!1300429 res!863861) b!1300417))

(assert (= (and b!1300422 res!863857) b!1300421))

(assert (= (and b!1300421 c!124870) b!1300425))

(assert (= (and b!1300421 (not c!124870)) b!1300410))

(assert (= (and b!1300425 res!863860) b!1300418))

(assert (= (or b!1300425 b!1300410) bm!63624))

(assert (= (and b!1300421 res!863859) b!1300413))

(assert (= (and b!1300413 c!124872) b!1300419))

(assert (= (and b!1300413 (not c!124872)) b!1300411))

(assert (= (and b!1300419 res!863863) b!1300412))

(assert (= (or b!1300419 b!1300411) bm!63620))

(declare-fun b_lambda!23139 () Bool)

(assert (=> (not b_lambda!23139) (not b!1300417)))

(declare-fun t!43247 () Bool)

(declare-fun tb!11363 () Bool)

(assert (=> (and start!109886 (= defaultEntry!1448 defaultEntry!1448) t!43247) tb!11363))

(declare-fun result!23737 () Bool)

(assert (=> tb!11363 (= result!23737 tp_is_empty!34771)))

(assert (=> b!1300417 t!43247))

(declare-fun b_and!47233 () Bool)

(assert (= b_and!47227 (and (=> t!43247 result!23737) b_and!47233)))

(declare-fun m!1191961 () Bool)

(assert (=> bm!63622 m!1191961))

(assert (=> b!1300429 m!1191899))

(assert (=> b!1300429 m!1191899))

(declare-fun m!1191963 () Bool)

(assert (=> b!1300429 m!1191963))

(declare-fun m!1191965 () Bool)

(assert (=> b!1300412 m!1191965))

(declare-fun m!1191967 () Bool)

(assert (=> bm!63626 m!1191967))

(assert (=> b!1300417 m!1191899))

(declare-fun m!1191969 () Bool)

(assert (=> b!1300417 m!1191969))

(assert (=> b!1300417 m!1191969))

(declare-fun m!1191971 () Bool)

(assert (=> b!1300417 m!1191971))

(declare-fun m!1191973 () Bool)

(assert (=> b!1300417 m!1191973))

(assert (=> b!1300417 m!1191971))

(assert (=> b!1300417 m!1191899))

(declare-fun m!1191975 () Bool)

(assert (=> b!1300417 m!1191975))

(declare-fun m!1191977 () Bool)

(assert (=> bm!63624 m!1191977))

(assert (=> b!1300420 m!1191899))

(assert (=> b!1300420 m!1191899))

(declare-fun m!1191979 () Bool)

(assert (=> b!1300420 m!1191979))

(declare-fun m!1191981 () Bool)

(assert (=> b!1300427 m!1191981))

(declare-fun m!1191983 () Bool)

(assert (=> b!1300427 m!1191983))

(declare-fun m!1191985 () Bool)

(assert (=> b!1300427 m!1191985))

(declare-fun m!1191987 () Bool)

(assert (=> b!1300427 m!1191987))

(declare-fun m!1191989 () Bool)

(assert (=> b!1300427 m!1191989))

(declare-fun m!1191991 () Bool)

(assert (=> b!1300427 m!1191991))

(declare-fun m!1191993 () Bool)

(assert (=> b!1300427 m!1191993))

(declare-fun m!1191995 () Bool)

(assert (=> b!1300427 m!1191995))

(assert (=> b!1300427 m!1191989))

(declare-fun m!1191997 () Bool)

(assert (=> b!1300427 m!1191997))

(declare-fun m!1191999 () Bool)

(assert (=> b!1300427 m!1191999))

(declare-fun m!1192001 () Bool)

(assert (=> b!1300427 m!1192001))

(assert (=> b!1300427 m!1191985))

(assert (=> b!1300427 m!1191967))

(assert (=> b!1300427 m!1191899))

(declare-fun m!1192003 () Bool)

(assert (=> b!1300427 m!1192003))

(declare-fun m!1192005 () Bool)

(assert (=> b!1300427 m!1192005))

(assert (=> b!1300427 m!1191997))

(declare-fun m!1192007 () Bool)

(assert (=> b!1300427 m!1192007))

(assert (=> b!1300427 m!1191995))

(declare-fun m!1192009 () Bool)

(assert (=> b!1300427 m!1192009))

(declare-fun m!1192011 () Bool)

(assert (=> b!1300416 m!1192011))

(assert (=> d!141529 m!1191901))

(assert (=> b!1300423 m!1191899))

(assert (=> b!1300423 m!1191899))

(assert (=> b!1300423 m!1191979))

(declare-fun m!1192013 () Bool)

(assert (=> bm!63620 m!1192013))

(declare-fun m!1192015 () Bool)

(assert (=> b!1300418 m!1192015))

(assert (=> b!1300295 d!141529))

(declare-fun b!1300442 () Bool)

(declare-fun e!741998 () Bool)

(declare-fun e!741997 () Bool)

(assert (=> b!1300442 (= e!741998 e!741997)))

(declare-fun res!863872 () Bool)

(assert (=> b!1300442 (=> (not res!863872) (not e!741997))))

(declare-fun e!741996 () Bool)

(assert (=> b!1300442 (= res!863872 (not e!741996))))

(declare-fun res!863870 () Bool)

(assert (=> b!1300442 (=> (not res!863870) (not e!741996))))

(assert (=> b!1300442 (= res!863870 (validKeyInArray!0 (select (arr!41790 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300443 () Bool)

(declare-fun e!741995 () Bool)

(declare-fun call!63632 () Bool)

(assert (=> b!1300443 (= e!741995 call!63632)))

(declare-fun b!1300444 () Bool)

(assert (=> b!1300444 (= e!741995 call!63632)))

(declare-fun bm!63629 () Bool)

(declare-fun c!124875 () Bool)

(assert (=> bm!63629 (= call!63632 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124875 (Cons!29681 (select (arr!41790 _keys!1741) #b00000000000000000000000000000000) Nil!29682) Nil!29682)))))

(declare-fun d!141531 () Bool)

(declare-fun res!863871 () Bool)

(assert (=> d!141531 (=> res!863871 e!741998)))

(assert (=> d!141531 (= res!863871 (bvsge #b00000000000000000000000000000000 (size!42341 _keys!1741)))))

(assert (=> d!141531 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29682) e!741998)))

(declare-fun b!1300445 () Bool)

(assert (=> b!1300445 (= e!741997 e!741995)))

(assert (=> b!1300445 (= c!124875 (validKeyInArray!0 (select (arr!41790 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300446 () Bool)

(declare-fun contains!8243 (List!29685 (_ BitVec 64)) Bool)

(assert (=> b!1300446 (= e!741996 (contains!8243 Nil!29682 (select (arr!41790 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141531 (not res!863871)) b!1300442))

(assert (= (and b!1300442 res!863870) b!1300446))

(assert (= (and b!1300442 res!863872) b!1300445))

(assert (= (and b!1300445 c!124875) b!1300443))

(assert (= (and b!1300445 (not c!124875)) b!1300444))

(assert (= (or b!1300443 b!1300444) bm!63629))

(declare-fun m!1192017 () Bool)

(assert (=> b!1300442 m!1192017))

(assert (=> b!1300442 m!1192017))

(declare-fun m!1192019 () Bool)

(assert (=> b!1300442 m!1192019))

(assert (=> bm!63629 m!1192017))

(declare-fun m!1192021 () Bool)

(assert (=> bm!63629 m!1192021))

(assert (=> b!1300445 m!1192017))

(assert (=> b!1300445 m!1192017))

(assert (=> b!1300445 m!1192019))

(assert (=> b!1300446 m!1192017))

(assert (=> b!1300446 m!1192017))

(declare-fun m!1192023 () Bool)

(assert (=> b!1300446 m!1192023))

(assert (=> b!1300292 d!141531))

(declare-fun b!1300455 () Bool)

(declare-fun e!742007 () Bool)

(declare-fun call!63635 () Bool)

(assert (=> b!1300455 (= e!742007 call!63635)))

(declare-fun b!1300456 () Bool)

(declare-fun e!742006 () Bool)

(assert (=> b!1300456 (= e!742007 e!742006)))

(declare-fun lt!581438 () (_ BitVec 64))

(assert (=> b!1300456 (= lt!581438 (select (arr!41790 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!581437 () Unit!42979)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86589 (_ BitVec 64) (_ BitVec 32)) Unit!42979)

(assert (=> b!1300456 (= lt!581437 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581438 #b00000000000000000000000000000000))))

(assert (=> b!1300456 (arrayContainsKey!0 _keys!1741 lt!581438 #b00000000000000000000000000000000)))

(declare-fun lt!581436 () Unit!42979)

(assert (=> b!1300456 (= lt!581436 lt!581437)))

(declare-fun res!863878 () Bool)

(declare-datatypes ((SeekEntryResult!9972 0))(
  ( (MissingZero!9972 (index!42259 (_ BitVec 32))) (Found!9972 (index!42260 (_ BitVec 32))) (Intermediate!9972 (undefined!10784 Bool) (index!42261 (_ BitVec 32)) (x!115380 (_ BitVec 32))) (Undefined!9972) (MissingVacant!9972 (index!42262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86589 (_ BitVec 32)) SeekEntryResult!9972)

(assert (=> b!1300456 (= res!863878 (= (seekEntryOrOpen!0 (select (arr!41790 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9972 #b00000000000000000000000000000000)))))

(assert (=> b!1300456 (=> (not res!863878) (not e!742006))))

(declare-fun b!1300457 () Bool)

(assert (=> b!1300457 (= e!742006 call!63635)))

(declare-fun d!141533 () Bool)

(declare-fun res!863877 () Bool)

(declare-fun e!742005 () Bool)

(assert (=> d!141533 (=> res!863877 e!742005)))

(assert (=> d!141533 (= res!863877 (bvsge #b00000000000000000000000000000000 (size!42341 _keys!1741)))))

(assert (=> d!141533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742005)))

(declare-fun bm!63632 () Bool)

(assert (=> bm!63632 (= call!63635 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1300458 () Bool)

(assert (=> b!1300458 (= e!742005 e!742007)))

(declare-fun c!124878 () Bool)

(assert (=> b!1300458 (= c!124878 (validKeyInArray!0 (select (arr!41790 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141533 (not res!863877)) b!1300458))

(assert (= (and b!1300458 c!124878) b!1300456))

(assert (= (and b!1300458 (not c!124878)) b!1300455))

(assert (= (and b!1300456 res!863878) b!1300457))

(assert (= (or b!1300457 b!1300455) bm!63632))

(assert (=> b!1300456 m!1192017))

(declare-fun m!1192025 () Bool)

(assert (=> b!1300456 m!1192025))

(declare-fun m!1192027 () Bool)

(assert (=> b!1300456 m!1192027))

(assert (=> b!1300456 m!1192017))

(declare-fun m!1192029 () Bool)

(assert (=> b!1300456 m!1192029))

(declare-fun m!1192031 () Bool)

(assert (=> bm!63632 m!1192031))

(assert (=> b!1300458 m!1192017))

(assert (=> b!1300458 m!1192017))

(assert (=> b!1300458 m!1192019))

(assert (=> b!1300297 d!141533))

(declare-fun d!141535 () Bool)

(declare-fun res!863883 () Bool)

(declare-fun e!742012 () Bool)

(assert (=> d!141535 (=> res!863883 e!742012)))

(assert (=> d!141535 (= res!863883 (= (select (arr!41790 _keys!1741) from!2144) k0!1205))))

(assert (=> d!141535 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!742012)))

(declare-fun b!1300463 () Bool)

(declare-fun e!742013 () Bool)

(assert (=> b!1300463 (= e!742012 e!742013)))

(declare-fun res!863884 () Bool)

(assert (=> b!1300463 (=> (not res!863884) (not e!742013))))

(assert (=> b!1300463 (= res!863884 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42341 _keys!1741)))))

(declare-fun b!1300464 () Bool)

(assert (=> b!1300464 (= e!742013 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141535 (not res!863883)) b!1300463))

(assert (= (and b!1300463 res!863884) b!1300464))

(assert (=> d!141535 m!1191899))

(declare-fun m!1192033 () Bool)

(assert (=> b!1300464 m!1192033))

(assert (=> b!1300293 d!141535))

(declare-fun d!141537 () Bool)

(assert (=> d!141537 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109886 d!141537))

(declare-fun d!141539 () Bool)

(assert (=> d!141539 (= (array_inv!31861 _values!1445) (bvsge (size!42340 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109886 d!141539))

(declare-fun d!141541 () Bool)

(assert (=> d!141541 (= (array_inv!31862 _keys!1741) (bvsge (size!42341 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109886 d!141541))

(declare-fun b!1300472 () Bool)

(declare-fun e!742019 () Bool)

(assert (=> b!1300472 (= e!742019 tp_is_empty!34771)))

(declare-fun mapNonEmpty!53729 () Bool)

(declare-fun mapRes!53729 () Bool)

(declare-fun tp!102530 () Bool)

(declare-fun e!742018 () Bool)

(assert (=> mapNonEmpty!53729 (= mapRes!53729 (and tp!102530 e!742018))))

(declare-fun mapValue!53729 () ValueCell!16487)

(declare-fun mapRest!53729 () (Array (_ BitVec 32) ValueCell!16487))

(declare-fun mapKey!53729 () (_ BitVec 32))

(assert (=> mapNonEmpty!53729 (= mapRest!53720 (store mapRest!53729 mapKey!53729 mapValue!53729))))

(declare-fun b!1300471 () Bool)

(assert (=> b!1300471 (= e!742018 tp_is_empty!34771)))

(declare-fun condMapEmpty!53729 () Bool)

(declare-fun mapDefault!53729 () ValueCell!16487)

(assert (=> mapNonEmpty!53720 (= condMapEmpty!53729 (= mapRest!53720 ((as const (Array (_ BitVec 32) ValueCell!16487)) mapDefault!53729)))))

(assert (=> mapNonEmpty!53720 (= tp!102515 (and e!742019 mapRes!53729))))

(declare-fun mapIsEmpty!53729 () Bool)

(assert (=> mapIsEmpty!53729 mapRes!53729))

(assert (= (and mapNonEmpty!53720 condMapEmpty!53729) mapIsEmpty!53729))

(assert (= (and mapNonEmpty!53720 (not condMapEmpty!53729)) mapNonEmpty!53729))

(assert (= (and mapNonEmpty!53729 ((_ is ValueCellFull!16487) mapValue!53729)) b!1300471))

(assert (= (and mapNonEmpty!53720 ((_ is ValueCellFull!16487) mapDefault!53729)) b!1300472))

(declare-fun m!1192035 () Bool)

(assert (=> mapNonEmpty!53729 m!1192035))

(declare-fun b_lambda!23141 () Bool)

(assert (= b_lambda!23139 (or (and start!109886 b_free!29131) b_lambda!23141)))

(check-sat (not b!1300366) (not b!1300445) (not d!141527) (not b!1300418) (not b!1300417) (not b_next!29131) (not bm!63632) (not b!1300416) (not b!1300464) (not bm!63629) (not b!1300427) (not b!1300456) b_and!47233 (not bm!63622) (not d!141529) (not b!1300458) (not b!1300412) (not b_lambda!23141) (not b!1300423) (not mapNonEmpty!53729) (not b!1300420) (not bm!63624) tp_is_empty!34771 (not bm!63626) (not b!1300364) (not b!1300446) (not b!1300429) (not b!1300442) (not bm!63620))
(check-sat b_and!47233 (not b_next!29131))
