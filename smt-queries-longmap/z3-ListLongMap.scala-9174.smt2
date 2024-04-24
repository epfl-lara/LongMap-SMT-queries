; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110558 () Bool)

(assert start!110558)

(declare-fun b_free!29317 () Bool)

(declare-fun b_next!29317 () Bool)

(assert (=> start!110558 (= b_free!29317 (not b_next!29317))))

(declare-fun tp!103119 () Bool)

(declare-fun b_and!47525 () Bool)

(assert (=> start!110558 (= tp!103119 b_and!47525)))

(declare-fun b!1307200 () Bool)

(declare-fun res!867568 () Bool)

(declare-fun e!745741 () Bool)

(assert (=> b!1307200 (=> (not res!867568) (not e!745741))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51713 0))(
  ( (V!51714 (val!17553 Int)) )
))
(declare-datatypes ((ValueCell!16580 0))(
  ( (ValueCellFull!16580 (v!20173 V!51713)) (EmptyCell!16580) )
))
(declare-datatypes ((array!86977 0))(
  ( (array!86978 (arr!41970 (Array (_ BitVec 32) ValueCell!16580)) (size!42521 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86977)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86979 0))(
  ( (array!86980 (arr!41971 (Array (_ BitVec 32) (_ BitVec 64))) (size!42522 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86979)

(assert (=> b!1307200 (= res!867568 (and (= (size!42521 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42522 _keys!1741) (size!42521 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54046 () Bool)

(declare-fun mapRes!54046 () Bool)

(declare-fun tp!103120 () Bool)

(declare-fun e!745739 () Bool)

(assert (=> mapNonEmpty!54046 (= mapRes!54046 (and tp!103120 e!745739))))

(declare-fun mapRest!54046 () (Array (_ BitVec 32) ValueCell!16580))

(declare-fun mapKey!54046 () (_ BitVec 32))

(declare-fun mapValue!54046 () ValueCell!16580)

(assert (=> mapNonEmpty!54046 (= (arr!41970 _values!1445) (store mapRest!54046 mapKey!54046 mapValue!54046))))

(declare-fun b!1307201 () Bool)

(declare-fun res!867570 () Bool)

(assert (=> b!1307201 (=> (not res!867570) (not e!745741))))

(declare-fun minValue!1387 () V!51713)

(declare-fun zeroValue!1387 () V!51713)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22688 0))(
  ( (tuple2!22689 (_1!11355 (_ BitVec 64)) (_2!11355 V!51713)) )
))
(declare-datatypes ((List!29828 0))(
  ( (Nil!29825) (Cons!29824 (h!31042 tuple2!22688) (t!43424 List!29828)) )
))
(declare-datatypes ((ListLongMap!20353 0))(
  ( (ListLongMap!20354 (toList!10192 List!29828)) )
))
(declare-fun contains!8349 (ListLongMap!20353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5196 (array!86979 array!86977 (_ BitVec 32) (_ BitVec 32) V!51713 V!51713 (_ BitVec 32) Int) ListLongMap!20353)

(assert (=> b!1307201 (= res!867570 (contains!8349 (getCurrentListMap!5196 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1307202 () Bool)

(declare-fun e!745742 () Bool)

(declare-fun tp_is_empty!34957 () Bool)

(assert (=> b!1307202 (= e!745742 tp_is_empty!34957)))

(declare-fun mapIsEmpty!54046 () Bool)

(assert (=> mapIsEmpty!54046 mapRes!54046))

(declare-fun b!1307203 () Bool)

(declare-fun res!867572 () Bool)

(assert (=> b!1307203 (=> (not res!867572) (not e!745741))))

(declare-datatypes ((List!29829 0))(
  ( (Nil!29826) (Cons!29825 (h!31043 (_ BitVec 64)) (t!43425 List!29829)) )
))
(declare-fun arrayNoDuplicates!0 (array!86979 (_ BitVec 32) List!29829) Bool)

(assert (=> b!1307203 (= res!867572 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29826))))

(declare-fun b!1307204 () Bool)

(assert (=> b!1307204 (= e!745741 (and (or (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1307205 () Bool)

(declare-fun res!867573 () Bool)

(assert (=> b!1307205 (=> (not res!867573) (not e!745741))))

(assert (=> b!1307205 (= res!867573 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42522 _keys!1741))))))

(declare-fun b!1307199 () Bool)

(assert (=> b!1307199 (= e!745739 tp_is_empty!34957)))

(declare-fun res!867571 () Bool)

(assert (=> start!110558 (=> (not res!867571) (not e!745741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110558 (= res!867571 (validMask!0 mask!2175))))

(assert (=> start!110558 e!745741))

(assert (=> start!110558 tp_is_empty!34957))

(assert (=> start!110558 true))

(declare-fun e!745740 () Bool)

(declare-fun array_inv!31987 (array!86977) Bool)

(assert (=> start!110558 (and (array_inv!31987 _values!1445) e!745740)))

(declare-fun array_inv!31988 (array!86979) Bool)

(assert (=> start!110558 (array_inv!31988 _keys!1741)))

(assert (=> start!110558 tp!103119))

(declare-fun b!1307206 () Bool)

(assert (=> b!1307206 (= e!745740 (and e!745742 mapRes!54046))))

(declare-fun condMapEmpty!54046 () Bool)

(declare-fun mapDefault!54046 () ValueCell!16580)

(assert (=> b!1307206 (= condMapEmpty!54046 (= (arr!41970 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16580)) mapDefault!54046)))))

(declare-fun b!1307207 () Bool)

(declare-fun res!867569 () Bool)

(assert (=> b!1307207 (=> (not res!867569) (not e!745741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86979 (_ BitVec 32)) Bool)

(assert (=> b!1307207 (= res!867569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!110558 res!867571) b!1307200))

(assert (= (and b!1307200 res!867568) b!1307207))

(assert (= (and b!1307207 res!867569) b!1307203))

(assert (= (and b!1307203 res!867572) b!1307205))

(assert (= (and b!1307205 res!867573) b!1307201))

(assert (= (and b!1307201 res!867570) b!1307204))

(assert (= (and b!1307206 condMapEmpty!54046) mapIsEmpty!54046))

(assert (= (and b!1307206 (not condMapEmpty!54046)) mapNonEmpty!54046))

(get-info :version)

(assert (= (and mapNonEmpty!54046 ((_ is ValueCellFull!16580) mapValue!54046)) b!1307199))

(assert (= (and b!1307206 ((_ is ValueCellFull!16580) mapDefault!54046)) b!1307202))

(assert (= start!110558 b!1307206))

(declare-fun m!1198723 () Bool)

(assert (=> b!1307207 m!1198723))

(declare-fun m!1198725 () Bool)

(assert (=> b!1307201 m!1198725))

(assert (=> b!1307201 m!1198725))

(declare-fun m!1198727 () Bool)

(assert (=> b!1307201 m!1198727))

(declare-fun m!1198729 () Bool)

(assert (=> mapNonEmpty!54046 m!1198729))

(declare-fun m!1198731 () Bool)

(assert (=> b!1307203 m!1198731))

(declare-fun m!1198733 () Bool)

(assert (=> start!110558 m!1198733))

(declare-fun m!1198735 () Bool)

(assert (=> start!110558 m!1198735))

(declare-fun m!1198737 () Bool)

(assert (=> start!110558 m!1198737))

(check-sat (not b!1307207) (not mapNonEmpty!54046) b_and!47525 (not b!1307201) (not b_next!29317) (not start!110558) tp_is_empty!34957 (not b!1307203))
(check-sat b_and!47525 (not b_next!29317))
(get-model)

(declare-fun d!142641 () Bool)

(declare-fun res!867614 () Bool)

(declare-fun e!745781 () Bool)

(assert (=> d!142641 (=> res!867614 e!745781)))

(assert (=> d!142641 (= res!867614 (bvsge #b00000000000000000000000000000000 (size!42522 _keys!1741)))))

(assert (=> d!142641 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!745781)))

(declare-fun b!1307270 () Bool)

(declare-fun e!745782 () Bool)

(declare-fun call!64661 () Bool)

(assert (=> b!1307270 (= e!745782 call!64661)))

(declare-fun b!1307271 () Bool)

(declare-fun e!745780 () Bool)

(assert (=> b!1307271 (= e!745782 e!745780)))

(declare-fun lt!585286 () (_ BitVec 64))

(assert (=> b!1307271 (= lt!585286 (select (arr!41971 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43229 0))(
  ( (Unit!43230) )
))
(declare-fun lt!585285 () Unit!43229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86979 (_ BitVec 64) (_ BitVec 32)) Unit!43229)

(assert (=> b!1307271 (= lt!585285 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!585286 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1307271 (arrayContainsKey!0 _keys!1741 lt!585286 #b00000000000000000000000000000000)))

(declare-fun lt!585284 () Unit!43229)

(assert (=> b!1307271 (= lt!585284 lt!585285)))

(declare-fun res!867615 () Bool)

(declare-datatypes ((SeekEntryResult!9986 0))(
  ( (MissingZero!9986 (index!42315 (_ BitVec 32))) (Found!9986 (index!42316 (_ BitVec 32))) (Intermediate!9986 (undefined!10798 Bool) (index!42317 (_ BitVec 32)) (x!115946 (_ BitVec 32))) (Undefined!9986) (MissingVacant!9986 (index!42318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86979 (_ BitVec 32)) SeekEntryResult!9986)

(assert (=> b!1307271 (= res!867615 (= (seekEntryOrOpen!0 (select (arr!41971 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9986 #b00000000000000000000000000000000)))))

(assert (=> b!1307271 (=> (not res!867615) (not e!745780))))

(declare-fun b!1307272 () Bool)

(assert (=> b!1307272 (= e!745781 e!745782)))

(declare-fun c!125909 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307272 (= c!125909 (validKeyInArray!0 (select (arr!41971 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64658 () Bool)

(assert (=> bm!64658 (= call!64661 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1307273 () Bool)

(assert (=> b!1307273 (= e!745780 call!64661)))

(assert (= (and d!142641 (not res!867614)) b!1307272))

(assert (= (and b!1307272 c!125909) b!1307271))

(assert (= (and b!1307272 (not c!125909)) b!1307270))

(assert (= (and b!1307271 res!867615) b!1307273))

(assert (= (or b!1307273 b!1307270) bm!64658))

(declare-fun m!1198771 () Bool)

(assert (=> b!1307271 m!1198771))

(declare-fun m!1198773 () Bool)

(assert (=> b!1307271 m!1198773))

(declare-fun m!1198775 () Bool)

(assert (=> b!1307271 m!1198775))

(assert (=> b!1307271 m!1198771))

(declare-fun m!1198777 () Bool)

(assert (=> b!1307271 m!1198777))

(assert (=> b!1307272 m!1198771))

(assert (=> b!1307272 m!1198771))

(declare-fun m!1198779 () Bool)

(assert (=> b!1307272 m!1198779))

(declare-fun m!1198781 () Bool)

(assert (=> bm!64658 m!1198781))

(assert (=> b!1307207 d!142641))

(declare-fun b!1307284 () Bool)

(declare-fun e!745792 () Bool)

(declare-fun e!745793 () Bool)

(assert (=> b!1307284 (= e!745792 e!745793)))

(declare-fun res!867623 () Bool)

(assert (=> b!1307284 (=> (not res!867623) (not e!745793))))

(declare-fun e!745794 () Bool)

(assert (=> b!1307284 (= res!867623 (not e!745794))))

(declare-fun res!867624 () Bool)

(assert (=> b!1307284 (=> (not res!867624) (not e!745794))))

(assert (=> b!1307284 (= res!867624 (validKeyInArray!0 (select (arr!41971 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1307285 () Bool)

(declare-fun e!745791 () Bool)

(assert (=> b!1307285 (= e!745793 e!745791)))

(declare-fun c!125912 () Bool)

(assert (=> b!1307285 (= c!125912 (validKeyInArray!0 (select (arr!41971 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142643 () Bool)

(declare-fun res!867622 () Bool)

(assert (=> d!142643 (=> res!867622 e!745792)))

(assert (=> d!142643 (= res!867622 (bvsge #b00000000000000000000000000000000 (size!42522 _keys!1741)))))

(assert (=> d!142643 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29826) e!745792)))

(declare-fun b!1307286 () Bool)

(declare-fun call!64664 () Bool)

(assert (=> b!1307286 (= e!745791 call!64664)))

(declare-fun bm!64661 () Bool)

(assert (=> bm!64661 (= call!64664 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125912 (Cons!29825 (select (arr!41971 _keys!1741) #b00000000000000000000000000000000) Nil!29826) Nil!29826)))))

(declare-fun b!1307287 () Bool)

(assert (=> b!1307287 (= e!745791 call!64664)))

(declare-fun b!1307288 () Bool)

(declare-fun contains!8351 (List!29829 (_ BitVec 64)) Bool)

(assert (=> b!1307288 (= e!745794 (contains!8351 Nil!29826 (select (arr!41971 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142643 (not res!867622)) b!1307284))

(assert (= (and b!1307284 res!867624) b!1307288))

(assert (= (and b!1307284 res!867623) b!1307285))

(assert (= (and b!1307285 c!125912) b!1307287))

(assert (= (and b!1307285 (not c!125912)) b!1307286))

(assert (= (or b!1307287 b!1307286) bm!64661))

(assert (=> b!1307284 m!1198771))

(assert (=> b!1307284 m!1198771))

(assert (=> b!1307284 m!1198779))

(assert (=> b!1307285 m!1198771))

(assert (=> b!1307285 m!1198771))

(assert (=> b!1307285 m!1198779))

(assert (=> bm!64661 m!1198771))

(declare-fun m!1198783 () Bool)

(assert (=> bm!64661 m!1198783))

(assert (=> b!1307288 m!1198771))

(assert (=> b!1307288 m!1198771))

(declare-fun m!1198785 () Bool)

(assert (=> b!1307288 m!1198785))

(assert (=> b!1307203 d!142643))

(declare-fun d!142645 () Bool)

(declare-fun e!745799 () Bool)

(assert (=> d!142645 e!745799))

(declare-fun res!867627 () Bool)

(assert (=> d!142645 (=> res!867627 e!745799)))

(declare-fun lt!585296 () Bool)

(assert (=> d!142645 (= res!867627 (not lt!585296))))

(declare-fun lt!585295 () Bool)

(assert (=> d!142645 (= lt!585296 lt!585295)))

(declare-fun lt!585298 () Unit!43229)

(declare-fun e!745800 () Unit!43229)

(assert (=> d!142645 (= lt!585298 e!745800)))

(declare-fun c!125915 () Bool)

(assert (=> d!142645 (= c!125915 lt!585295)))

(declare-fun containsKey!732 (List!29828 (_ BitVec 64)) Bool)

(assert (=> d!142645 (= lt!585295 (containsKey!732 (toList!10192 (getCurrentListMap!5196 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142645 (= (contains!8349 (getCurrentListMap!5196 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!585296)))

(declare-fun b!1307295 () Bool)

(declare-fun lt!585297 () Unit!43229)

(assert (=> b!1307295 (= e!745800 lt!585297)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!478 (List!29828 (_ BitVec 64)) Unit!43229)

(assert (=> b!1307295 (= lt!585297 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10192 (getCurrentListMap!5196 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!757 0))(
  ( (Some!756 (v!20176 V!51713)) (None!755) )
))
(declare-fun isDefined!515 (Option!757) Bool)

(declare-fun getValueByKey!706 (List!29828 (_ BitVec 64)) Option!757)

(assert (=> b!1307295 (isDefined!515 (getValueByKey!706 (toList!10192 (getCurrentListMap!5196 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1307296 () Bool)

(declare-fun Unit!43231 () Unit!43229)

(assert (=> b!1307296 (= e!745800 Unit!43231)))

(declare-fun b!1307297 () Bool)

(assert (=> b!1307297 (= e!745799 (isDefined!515 (getValueByKey!706 (toList!10192 (getCurrentListMap!5196 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142645 c!125915) b!1307295))

(assert (= (and d!142645 (not c!125915)) b!1307296))

(assert (= (and d!142645 (not res!867627)) b!1307297))

(declare-fun m!1198787 () Bool)

(assert (=> d!142645 m!1198787))

(declare-fun m!1198789 () Bool)

(assert (=> b!1307295 m!1198789))

(declare-fun m!1198791 () Bool)

(assert (=> b!1307295 m!1198791))

(assert (=> b!1307295 m!1198791))

(declare-fun m!1198793 () Bool)

(assert (=> b!1307295 m!1198793))

(assert (=> b!1307297 m!1198791))

(assert (=> b!1307297 m!1198791))

(assert (=> b!1307297 m!1198793))

(assert (=> b!1307201 d!142645))

(declare-fun b!1307340 () Bool)

(declare-fun res!867649 () Bool)

(declare-fun e!745830 () Bool)

(assert (=> b!1307340 (=> (not res!867649) (not e!745830))))

(declare-fun e!745827 () Bool)

(assert (=> b!1307340 (= res!867649 e!745827)))

(declare-fun c!125929 () Bool)

(assert (=> b!1307340 (= c!125929 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1307341 () Bool)

(declare-fun e!745828 () ListLongMap!20353)

(declare-fun call!64683 () ListLongMap!20353)

(declare-fun +!4543 (ListLongMap!20353 tuple2!22688) ListLongMap!20353)

(assert (=> b!1307341 (= e!745828 (+!4543 call!64683 (tuple2!22689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun lt!585349 () ListLongMap!20353)

(declare-fun e!745839 () Bool)

(declare-fun b!1307342 () Bool)

(declare-fun apply!1036 (ListLongMap!20353 (_ BitVec 64)) V!51713)

(declare-fun get!21247 (ValueCell!16580 V!51713) V!51713)

(declare-fun dynLambda!3497 (Int (_ BitVec 64)) V!51713)

(assert (=> b!1307342 (= e!745839 (= (apply!1036 lt!585349 (select (arr!41971 _keys!1741) from!2144)) (get!21247 (select (arr!41970 _values!1445) from!2144) (dynLambda!3497 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1307342 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42521 _values!1445)))))

(assert (=> b!1307342 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42522 _keys!1741)))))

(declare-fun b!1307343 () Bool)

(declare-fun e!745838 () Bool)

(assert (=> b!1307343 (= e!745838 (validKeyInArray!0 (select (arr!41971 _keys!1741) from!2144)))))

(declare-fun bm!64676 () Bool)

(declare-fun call!64685 () Bool)

(assert (=> bm!64676 (= call!64685 (contains!8349 lt!585349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1307344 () Bool)

(declare-fun e!745836 () Bool)

(assert (=> b!1307344 (= e!745836 (= (apply!1036 lt!585349 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1307345 () Bool)

(declare-fun e!745829 () ListLongMap!20353)

(assert (=> b!1307345 (= e!745828 e!745829)))

(declare-fun c!125932 () Bool)

(assert (=> b!1307345 (= c!125932 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64677 () Bool)

(declare-fun call!64680 () ListLongMap!20353)

(assert (=> bm!64677 (= call!64680 call!64683)))

(declare-fun b!1307346 () Bool)

(declare-fun c!125930 () Bool)

(assert (=> b!1307346 (= c!125930 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!745833 () ListLongMap!20353)

(assert (=> b!1307346 (= e!745829 e!745833)))

(declare-fun b!1307347 () Bool)

(declare-fun e!745837 () Bool)

(assert (=> b!1307347 (= e!745837 (= (apply!1036 lt!585349 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1307348 () Bool)

(assert (=> b!1307348 (= e!745827 (not call!64685))))

(declare-fun d!142647 () Bool)

(assert (=> d!142647 e!745830))

(declare-fun res!867653 () Bool)

(assert (=> d!142647 (=> (not res!867653) (not e!745830))))

(assert (=> d!142647 (= res!867653 (or (bvsge from!2144 (size!42522 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42522 _keys!1741)))))))

(declare-fun lt!585347 () ListLongMap!20353)

(assert (=> d!142647 (= lt!585349 lt!585347)))

(declare-fun lt!585357 () Unit!43229)

(declare-fun e!745831 () Unit!43229)

(assert (=> d!142647 (= lt!585357 e!745831)))

(declare-fun c!125933 () Bool)

(declare-fun e!745835 () Bool)

(assert (=> d!142647 (= c!125933 e!745835)))

(declare-fun res!867646 () Bool)

(assert (=> d!142647 (=> (not res!867646) (not e!745835))))

(assert (=> d!142647 (= res!867646 (bvslt from!2144 (size!42522 _keys!1741)))))

(assert (=> d!142647 (= lt!585347 e!745828)))

(declare-fun c!125928 () Bool)

(assert (=> d!142647 (= c!125928 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142647 (validMask!0 mask!2175)))

(assert (=> d!142647 (= (getCurrentListMap!5196 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!585349)))

(declare-fun b!1307349 () Bool)

(declare-fun e!745832 () Bool)

(assert (=> b!1307349 (= e!745832 e!745837)))

(declare-fun res!867654 () Bool)

(declare-fun call!64682 () Bool)

(assert (=> b!1307349 (= res!867654 call!64682)))

(assert (=> b!1307349 (=> (not res!867654) (not e!745837))))

(declare-fun b!1307350 () Bool)

(declare-fun Unit!43232 () Unit!43229)

(assert (=> b!1307350 (= e!745831 Unit!43232)))

(declare-fun call!64679 () ListLongMap!20353)

(declare-fun call!64684 () ListLongMap!20353)

(declare-fun bm!64678 () Bool)

(declare-fun call!64681 () ListLongMap!20353)

(assert (=> bm!64678 (= call!64683 (+!4543 (ite c!125928 call!64684 (ite c!125932 call!64679 call!64681)) (ite (or c!125928 c!125932) (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64679 () Bool)

(assert (=> bm!64679 (= call!64682 (contains!8349 lt!585349 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1307351 () Bool)

(assert (=> b!1307351 (= e!745833 call!64680)))

(declare-fun b!1307352 () Bool)

(declare-fun lt!585344 () Unit!43229)

(assert (=> b!1307352 (= e!745831 lt!585344)))

(declare-fun lt!585355 () ListLongMap!20353)

(declare-fun getCurrentListMapNoExtraKeys!6182 (array!86979 array!86977 (_ BitVec 32) (_ BitVec 32) V!51713 V!51713 (_ BitVec 32) Int) ListLongMap!20353)

(assert (=> b!1307352 (= lt!585355 (getCurrentListMapNoExtraKeys!6182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!585362 () (_ BitVec 64))

(assert (=> b!1307352 (= lt!585362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585352 () (_ BitVec 64))

(assert (=> b!1307352 (= lt!585352 (select (arr!41971 _keys!1741) from!2144))))

(declare-fun lt!585359 () Unit!43229)

(declare-fun addStillContains!1123 (ListLongMap!20353 (_ BitVec 64) V!51713 (_ BitVec 64)) Unit!43229)

(assert (=> b!1307352 (= lt!585359 (addStillContains!1123 lt!585355 lt!585362 zeroValue!1387 lt!585352))))

(assert (=> b!1307352 (contains!8349 (+!4543 lt!585355 (tuple2!22689 lt!585362 zeroValue!1387)) lt!585352)))

(declare-fun lt!585358 () Unit!43229)

(assert (=> b!1307352 (= lt!585358 lt!585359)))

(declare-fun lt!585346 () ListLongMap!20353)

(assert (=> b!1307352 (= lt!585346 (getCurrentListMapNoExtraKeys!6182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!585345 () (_ BitVec 64))

(assert (=> b!1307352 (= lt!585345 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585343 () (_ BitVec 64))

(assert (=> b!1307352 (= lt!585343 (select (arr!41971 _keys!1741) from!2144))))

(declare-fun lt!585364 () Unit!43229)

(declare-fun addApplyDifferent!565 (ListLongMap!20353 (_ BitVec 64) V!51713 (_ BitVec 64)) Unit!43229)

(assert (=> b!1307352 (= lt!585364 (addApplyDifferent!565 lt!585346 lt!585345 minValue!1387 lt!585343))))

(assert (=> b!1307352 (= (apply!1036 (+!4543 lt!585346 (tuple2!22689 lt!585345 minValue!1387)) lt!585343) (apply!1036 lt!585346 lt!585343))))

(declare-fun lt!585350 () Unit!43229)

(assert (=> b!1307352 (= lt!585350 lt!585364)))

(declare-fun lt!585354 () ListLongMap!20353)

(assert (=> b!1307352 (= lt!585354 (getCurrentListMapNoExtraKeys!6182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!585361 () (_ BitVec 64))

(assert (=> b!1307352 (= lt!585361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585360 () (_ BitVec 64))

(assert (=> b!1307352 (= lt!585360 (select (arr!41971 _keys!1741) from!2144))))

(declare-fun lt!585348 () Unit!43229)

(assert (=> b!1307352 (= lt!585348 (addApplyDifferent!565 lt!585354 lt!585361 zeroValue!1387 lt!585360))))

(assert (=> b!1307352 (= (apply!1036 (+!4543 lt!585354 (tuple2!22689 lt!585361 zeroValue!1387)) lt!585360) (apply!1036 lt!585354 lt!585360))))

(declare-fun lt!585356 () Unit!43229)

(assert (=> b!1307352 (= lt!585356 lt!585348)))

(declare-fun lt!585363 () ListLongMap!20353)

(assert (=> b!1307352 (= lt!585363 (getCurrentListMapNoExtraKeys!6182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!585353 () (_ BitVec 64))

(assert (=> b!1307352 (= lt!585353 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585351 () (_ BitVec 64))

(assert (=> b!1307352 (= lt!585351 (select (arr!41971 _keys!1741) from!2144))))

(assert (=> b!1307352 (= lt!585344 (addApplyDifferent!565 lt!585363 lt!585353 minValue!1387 lt!585351))))

(assert (=> b!1307352 (= (apply!1036 (+!4543 lt!585363 (tuple2!22689 lt!585353 minValue!1387)) lt!585351) (apply!1036 lt!585363 lt!585351))))

(declare-fun bm!64680 () Bool)

(assert (=> bm!64680 (= call!64684 (getCurrentListMapNoExtraKeys!6182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1307353 () Bool)

(assert (=> b!1307353 (= e!745830 e!745832)))

(declare-fun c!125931 () Bool)

(assert (=> b!1307353 (= c!125931 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1307354 () Bool)

(assert (=> b!1307354 (= e!745829 call!64680)))

(declare-fun bm!64681 () Bool)

(assert (=> bm!64681 (= call!64679 call!64684)))

(declare-fun b!1307355 () Bool)

(declare-fun res!867651 () Bool)

(assert (=> b!1307355 (=> (not res!867651) (not e!745830))))

(declare-fun e!745834 () Bool)

(assert (=> b!1307355 (= res!867651 e!745834)))

(declare-fun res!867652 () Bool)

(assert (=> b!1307355 (=> res!867652 e!745834)))

(assert (=> b!1307355 (= res!867652 (not e!745838))))

(declare-fun res!867650 () Bool)

(assert (=> b!1307355 (=> (not res!867650) (not e!745838))))

(assert (=> b!1307355 (= res!867650 (bvslt from!2144 (size!42522 _keys!1741)))))

(declare-fun b!1307356 () Bool)

(assert (=> b!1307356 (= e!745833 call!64681)))

(declare-fun bm!64682 () Bool)

(assert (=> bm!64682 (= call!64681 call!64679)))

(declare-fun b!1307357 () Bool)

(assert (=> b!1307357 (= e!745834 e!745839)))

(declare-fun res!867647 () Bool)

(assert (=> b!1307357 (=> (not res!867647) (not e!745839))))

(assert (=> b!1307357 (= res!867647 (contains!8349 lt!585349 (select (arr!41971 _keys!1741) from!2144)))))

(assert (=> b!1307357 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42522 _keys!1741)))))

(declare-fun b!1307358 () Bool)

(assert (=> b!1307358 (= e!745827 e!745836)))

(declare-fun res!867648 () Bool)

(assert (=> b!1307358 (= res!867648 call!64685)))

(assert (=> b!1307358 (=> (not res!867648) (not e!745836))))

(declare-fun b!1307359 () Bool)

(assert (=> b!1307359 (= e!745835 (validKeyInArray!0 (select (arr!41971 _keys!1741) from!2144)))))

(declare-fun b!1307360 () Bool)

(assert (=> b!1307360 (= e!745832 (not call!64682))))

(assert (= (and d!142647 c!125928) b!1307341))

(assert (= (and d!142647 (not c!125928)) b!1307345))

(assert (= (and b!1307345 c!125932) b!1307354))

(assert (= (and b!1307345 (not c!125932)) b!1307346))

(assert (= (and b!1307346 c!125930) b!1307351))

(assert (= (and b!1307346 (not c!125930)) b!1307356))

(assert (= (or b!1307351 b!1307356) bm!64682))

(assert (= (or b!1307354 bm!64682) bm!64681))

(assert (= (or b!1307354 b!1307351) bm!64677))

(assert (= (or b!1307341 bm!64681) bm!64680))

(assert (= (or b!1307341 bm!64677) bm!64678))

(assert (= (and d!142647 res!867646) b!1307359))

(assert (= (and d!142647 c!125933) b!1307352))

(assert (= (and d!142647 (not c!125933)) b!1307350))

(assert (= (and d!142647 res!867653) b!1307355))

(assert (= (and b!1307355 res!867650) b!1307343))

(assert (= (and b!1307355 (not res!867652)) b!1307357))

(assert (= (and b!1307357 res!867647) b!1307342))

(assert (= (and b!1307355 res!867651) b!1307340))

(assert (= (and b!1307340 c!125929) b!1307358))

(assert (= (and b!1307340 (not c!125929)) b!1307348))

(assert (= (and b!1307358 res!867648) b!1307344))

(assert (= (or b!1307358 b!1307348) bm!64676))

(assert (= (and b!1307340 res!867649) b!1307353))

(assert (= (and b!1307353 c!125931) b!1307349))

(assert (= (and b!1307353 (not c!125931)) b!1307360))

(assert (= (and b!1307349 res!867654) b!1307347))

(assert (= (or b!1307349 b!1307360) bm!64679))

(declare-fun b_lambda!23353 () Bool)

(assert (=> (not b_lambda!23353) (not b!1307342)))

(declare-fun t!43429 () Bool)

(declare-fun tb!11401 () Bool)

(assert (=> (and start!110558 (= defaultEntry!1448 defaultEntry!1448) t!43429) tb!11401))

(declare-fun result!23841 () Bool)

(assert (=> tb!11401 (= result!23841 tp_is_empty!34957)))

(assert (=> b!1307342 t!43429))

(declare-fun b_and!47531 () Bool)

(assert (= b_and!47525 (and (=> t!43429 result!23841) b_and!47531)))

(declare-fun m!1198795 () Bool)

(assert (=> bm!64680 m!1198795))

(declare-fun m!1198797 () Bool)

(assert (=> b!1307343 m!1198797))

(assert (=> b!1307343 m!1198797))

(declare-fun m!1198799 () Bool)

(assert (=> b!1307343 m!1198799))

(assert (=> b!1307359 m!1198797))

(assert (=> b!1307359 m!1198797))

(assert (=> b!1307359 m!1198799))

(declare-fun m!1198801 () Bool)

(assert (=> bm!64676 m!1198801))

(declare-fun m!1198803 () Bool)

(assert (=> bm!64679 m!1198803))

(declare-fun m!1198805 () Bool)

(assert (=> b!1307344 m!1198805))

(declare-fun m!1198807 () Bool)

(assert (=> bm!64678 m!1198807))

(assert (=> b!1307342 m!1198797))

(declare-fun m!1198809 () Bool)

(assert (=> b!1307342 m!1198809))

(declare-fun m!1198811 () Bool)

(assert (=> b!1307342 m!1198811))

(declare-fun m!1198813 () Bool)

(assert (=> b!1307342 m!1198813))

(assert (=> b!1307342 m!1198809))

(assert (=> b!1307342 m!1198797))

(declare-fun m!1198815 () Bool)

(assert (=> b!1307342 m!1198815))

(assert (=> b!1307342 m!1198811))

(declare-fun m!1198817 () Bool)

(assert (=> b!1307352 m!1198817))

(declare-fun m!1198819 () Bool)

(assert (=> b!1307352 m!1198819))

(declare-fun m!1198821 () Bool)

(assert (=> b!1307352 m!1198821))

(declare-fun m!1198823 () Bool)

(assert (=> b!1307352 m!1198823))

(declare-fun m!1198825 () Bool)

(assert (=> b!1307352 m!1198825))

(declare-fun m!1198827 () Bool)

(assert (=> b!1307352 m!1198827))

(declare-fun m!1198829 () Bool)

(assert (=> b!1307352 m!1198829))

(declare-fun m!1198831 () Bool)

(assert (=> b!1307352 m!1198831))

(declare-fun m!1198833 () Bool)

(assert (=> b!1307352 m!1198833))

(assert (=> b!1307352 m!1198821))

(declare-fun m!1198835 () Bool)

(assert (=> b!1307352 m!1198835))

(declare-fun m!1198837 () Bool)

(assert (=> b!1307352 m!1198837))

(assert (=> b!1307352 m!1198827))

(assert (=> b!1307352 m!1198795))

(declare-fun m!1198839 () Bool)

(assert (=> b!1307352 m!1198839))

(assert (=> b!1307352 m!1198797))

(assert (=> b!1307352 m!1198831))

(assert (=> b!1307352 m!1198837))

(declare-fun m!1198841 () Bool)

(assert (=> b!1307352 m!1198841))

(declare-fun m!1198843 () Bool)

(assert (=> b!1307352 m!1198843))

(declare-fun m!1198845 () Bool)

(assert (=> b!1307352 m!1198845))

(declare-fun m!1198847 () Bool)

(assert (=> b!1307347 m!1198847))

(assert (=> b!1307357 m!1198797))

(assert (=> b!1307357 m!1198797))

(declare-fun m!1198849 () Bool)

(assert (=> b!1307357 m!1198849))

(declare-fun m!1198851 () Bool)

(assert (=> b!1307341 m!1198851))

(assert (=> d!142647 m!1198733))

(assert (=> b!1307201 d!142647))

(declare-fun d!142649 () Bool)

(assert (=> d!142649 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110558 d!142649))

(declare-fun d!142651 () Bool)

(assert (=> d!142651 (= (array_inv!31987 _values!1445) (bvsge (size!42521 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110558 d!142651))

(declare-fun d!142653 () Bool)

(assert (=> d!142653 (= (array_inv!31988 _keys!1741) (bvsge (size!42522 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110558 d!142653))

(declare-fun condMapEmpty!54055 () Bool)

(declare-fun mapDefault!54055 () ValueCell!16580)

(assert (=> mapNonEmpty!54046 (= condMapEmpty!54055 (= mapRest!54046 ((as const (Array (_ BitVec 32) ValueCell!16580)) mapDefault!54055)))))

(declare-fun e!745844 () Bool)

(declare-fun mapRes!54055 () Bool)

(assert (=> mapNonEmpty!54046 (= tp!103120 (and e!745844 mapRes!54055))))

(declare-fun mapIsEmpty!54055 () Bool)

(assert (=> mapIsEmpty!54055 mapRes!54055))

(declare-fun b!1307369 () Bool)

(declare-fun e!745845 () Bool)

(assert (=> b!1307369 (= e!745845 tp_is_empty!34957)))

(declare-fun b!1307370 () Bool)

(assert (=> b!1307370 (= e!745844 tp_is_empty!34957)))

(declare-fun mapNonEmpty!54055 () Bool)

(declare-fun tp!103135 () Bool)

(assert (=> mapNonEmpty!54055 (= mapRes!54055 (and tp!103135 e!745845))))

(declare-fun mapValue!54055 () ValueCell!16580)

(declare-fun mapKey!54055 () (_ BitVec 32))

(declare-fun mapRest!54055 () (Array (_ BitVec 32) ValueCell!16580))

(assert (=> mapNonEmpty!54055 (= mapRest!54046 (store mapRest!54055 mapKey!54055 mapValue!54055))))

(assert (= (and mapNonEmpty!54046 condMapEmpty!54055) mapIsEmpty!54055))

(assert (= (and mapNonEmpty!54046 (not condMapEmpty!54055)) mapNonEmpty!54055))

(assert (= (and mapNonEmpty!54055 ((_ is ValueCellFull!16580) mapValue!54055)) b!1307369))

(assert (= (and mapNonEmpty!54046 ((_ is ValueCellFull!16580) mapDefault!54055)) b!1307370))

(declare-fun m!1198853 () Bool)

(assert (=> mapNonEmpty!54055 m!1198853))

(declare-fun b_lambda!23355 () Bool)

(assert (= b_lambda!23353 (or (and start!110558 b_free!29317) b_lambda!23355)))

(check-sat (not b!1307352) (not b!1307344) (not b!1307343) (not b!1307342) (not b!1307347) (not d!142645) (not b_next!29317) (not bm!64661) (not bm!64676) (not b!1307271) (not b!1307285) b_and!47531 (not b!1307288) (not b!1307272) (not b_lambda!23355) (not bm!64658) (not b!1307357) (not b!1307295) (not b!1307297) (not d!142647) (not b!1307284) (not mapNonEmpty!54055) (not bm!64679) (not bm!64678) (not b!1307341) tp_is_empty!34957 (not bm!64680) (not b!1307359))
(check-sat b_and!47531 (not b_next!29317))
