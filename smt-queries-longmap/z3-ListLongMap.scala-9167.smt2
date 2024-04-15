; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110128 () Bool)

(assert start!110128)

(declare-fun b_free!29275 () Bool)

(declare-fun b_next!29275 () Bool)

(assert (=> start!110128 (= b_free!29275 (not b_next!29275))))

(declare-fun tp!102981 () Bool)

(declare-fun b_and!47431 () Bool)

(assert (=> start!110128 (= tp!102981 b_and!47431)))

(declare-fun b!1303933 () Bool)

(declare-fun res!866025 () Bool)

(declare-fun e!743769 () Bool)

(assert (=> b!1303933 (=> (not res!866025) (not e!743769))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86749 0))(
  ( (array!86750 (arr!41865 (Array (_ BitVec 32) (_ BitVec 64))) (size!42417 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86749)

(assert (=> b!1303933 (= res!866025 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42417 _keys!1741))))))

(declare-fun b!1303934 () Bool)

(declare-fun res!866027 () Bool)

(assert (=> b!1303934 (=> (not res!866027) (not e!743769))))

(declare-datatypes ((V!51657 0))(
  ( (V!51658 (val!17532 Int)) )
))
(declare-fun zeroValue!1387 () V!51657)

(declare-datatypes ((ValueCell!16559 0))(
  ( (ValueCellFull!16559 (v!20149 V!51657)) (EmptyCell!16559) )
))
(declare-datatypes ((array!86751 0))(
  ( (array!86752 (arr!41866 (Array (_ BitVec 32) ValueCell!16559)) (size!42418 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86751)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!51657)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22688 0))(
  ( (tuple2!22689 (_1!11355 (_ BitVec 64)) (_2!11355 V!51657)) )
))
(declare-datatypes ((List!29795 0))(
  ( (Nil!29792) (Cons!29791 (h!31000 tuple2!22688) (t!43383 List!29795)) )
))
(declare-datatypes ((ListLongMap!20345 0))(
  ( (ListLongMap!20346 (toList!10188 List!29795)) )
))
(declare-fun contains!8254 (ListLongMap!20345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5089 (array!86749 array!86751 (_ BitVec 32) (_ BitVec 32) V!51657 V!51657 (_ BitVec 32) Int) ListLongMap!20345)

(assert (=> b!1303934 (= res!866027 (contains!8254 (getCurrentListMap!5089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53969 () Bool)

(declare-fun mapRes!53969 () Bool)

(assert (=> mapIsEmpty!53969 mapRes!53969))

(declare-fun b!1303935 () Bool)

(declare-fun e!743774 () Bool)

(assert (=> b!1303935 (= e!743769 (not e!743774))))

(declare-fun res!866026 () Bool)

(assert (=> b!1303935 (=> res!866026 e!743774)))

(assert (=> b!1303935 (= res!866026 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1303935 (not (contains!8254 (ListLongMap!20346 Nil!29792) k0!1205))))

(declare-datatypes ((Unit!43025 0))(
  ( (Unit!43026) )
))
(declare-fun lt!583410 () Unit!43025)

(declare-fun emptyContainsNothing!218 ((_ BitVec 64)) Unit!43025)

(assert (=> b!1303935 (= lt!583410 (emptyContainsNothing!218 k0!1205))))

(declare-fun res!866020 () Bool)

(assert (=> start!110128 (=> (not res!866020) (not e!743769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110128 (= res!866020 (validMask!0 mask!2175))))

(assert (=> start!110128 e!743769))

(declare-fun tp_is_empty!34915 () Bool)

(assert (=> start!110128 tp_is_empty!34915))

(assert (=> start!110128 true))

(declare-fun e!743773 () Bool)

(declare-fun array_inv!31843 (array!86751) Bool)

(assert (=> start!110128 (and (array_inv!31843 _values!1445) e!743773)))

(declare-fun array_inv!31844 (array!86749) Bool)

(assert (=> start!110128 (array_inv!31844 _keys!1741)))

(assert (=> start!110128 tp!102981))

(declare-fun b!1303936 () Bool)

(declare-fun res!866021 () Bool)

(assert (=> b!1303936 (=> (not res!866021) (not e!743769))))

(assert (=> b!1303936 (= res!866021 (and (= (size!42418 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42417 _keys!1741) (size!42418 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303937 () Bool)

(declare-fun e!743771 () Bool)

(assert (=> b!1303937 (= e!743773 (and e!743771 mapRes!53969))))

(declare-fun condMapEmpty!53969 () Bool)

(declare-fun mapDefault!53969 () ValueCell!16559)

(assert (=> b!1303937 (= condMapEmpty!53969 (= (arr!41866 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16559)) mapDefault!53969)))))

(declare-fun b!1303938 () Bool)

(declare-fun res!866022 () Bool)

(assert (=> b!1303938 (=> (not res!866022) (not e!743769))))

(declare-datatypes ((List!29796 0))(
  ( (Nil!29793) (Cons!29792 (h!31001 (_ BitVec 64)) (t!43384 List!29796)) )
))
(declare-fun arrayNoDuplicates!0 (array!86749 (_ BitVec 32) List!29796) Bool)

(assert (=> b!1303938 (= res!866022 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29793))))

(declare-fun b!1303939 () Bool)

(declare-fun res!866024 () Bool)

(assert (=> b!1303939 (=> (not res!866024) (not e!743769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303939 (= res!866024 (not (validKeyInArray!0 (select (arr!41865 _keys!1741) from!2144))))))

(declare-fun b!1303940 () Bool)

(assert (=> b!1303940 (= e!743771 tp_is_empty!34915)))

(declare-fun b!1303941 () Bool)

(declare-fun res!866023 () Bool)

(assert (=> b!1303941 (=> (not res!866023) (not e!743769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86749 (_ BitVec 32)) Bool)

(assert (=> b!1303941 (= res!866023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303942 () Bool)

(declare-fun res!866028 () Bool)

(assert (=> b!1303942 (=> (not res!866028) (not e!743769))))

(assert (=> b!1303942 (= res!866028 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42417 _keys!1741))))))

(declare-fun mapNonEmpty!53969 () Bool)

(declare-fun tp!102980 () Bool)

(declare-fun e!743770 () Bool)

(assert (=> mapNonEmpty!53969 (= mapRes!53969 (and tp!102980 e!743770))))

(declare-fun mapRest!53969 () (Array (_ BitVec 32) ValueCell!16559))

(declare-fun mapValue!53969 () ValueCell!16559)

(declare-fun mapKey!53969 () (_ BitVec 32))

(assert (=> mapNonEmpty!53969 (= (arr!41866 _values!1445) (store mapRest!53969 mapKey!53969 mapValue!53969))))

(declare-fun b!1303943 () Bool)

(assert (=> b!1303943 (= e!743770 tp_is_empty!34915)))

(declare-fun b!1303944 () Bool)

(assert (=> b!1303944 (= e!743774 false)))

(declare-fun lt!583411 () ListLongMap!20345)

(declare-fun +!4516 (ListLongMap!20345 tuple2!22688) ListLongMap!20345)

(assert (=> b!1303944 (not (contains!8254 (+!4516 lt!583411 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!583409 () Unit!43025)

(declare-fun addStillNotContains!469 (ListLongMap!20345 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43025)

(assert (=> b!1303944 (= lt!583409 (addStillNotContains!469 lt!583411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6150 (array!86749 array!86751 (_ BitVec 32) (_ BitVec 32) V!51657 V!51657 (_ BitVec 32) Int) ListLongMap!20345)

(assert (=> b!1303944 (= lt!583411 (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!110128 res!866020) b!1303936))

(assert (= (and b!1303936 res!866021) b!1303941))

(assert (= (and b!1303941 res!866023) b!1303938))

(assert (= (and b!1303938 res!866022) b!1303933))

(assert (= (and b!1303933 res!866025) b!1303934))

(assert (= (and b!1303934 res!866027) b!1303942))

(assert (= (and b!1303942 res!866028) b!1303939))

(assert (= (and b!1303939 res!866024) b!1303935))

(assert (= (and b!1303935 (not res!866026)) b!1303944))

(assert (= (and b!1303937 condMapEmpty!53969) mapIsEmpty!53969))

(assert (= (and b!1303937 (not condMapEmpty!53969)) mapNonEmpty!53969))

(get-info :version)

(assert (= (and mapNonEmpty!53969 ((_ is ValueCellFull!16559) mapValue!53969)) b!1303943))

(assert (= (and b!1303937 ((_ is ValueCellFull!16559) mapDefault!53969)) b!1303940))

(assert (= start!110128 b!1303937))

(declare-fun m!1194513 () Bool)

(assert (=> b!1303935 m!1194513))

(declare-fun m!1194515 () Bool)

(assert (=> b!1303935 m!1194515))

(declare-fun m!1194517 () Bool)

(assert (=> start!110128 m!1194517))

(declare-fun m!1194519 () Bool)

(assert (=> start!110128 m!1194519))

(declare-fun m!1194521 () Bool)

(assert (=> start!110128 m!1194521))

(declare-fun m!1194523 () Bool)

(assert (=> b!1303939 m!1194523))

(assert (=> b!1303939 m!1194523))

(declare-fun m!1194525 () Bool)

(assert (=> b!1303939 m!1194525))

(declare-fun m!1194527 () Bool)

(assert (=> b!1303934 m!1194527))

(assert (=> b!1303934 m!1194527))

(declare-fun m!1194529 () Bool)

(assert (=> b!1303934 m!1194529))

(declare-fun m!1194531 () Bool)

(assert (=> b!1303944 m!1194531))

(assert (=> b!1303944 m!1194531))

(declare-fun m!1194533 () Bool)

(assert (=> b!1303944 m!1194533))

(declare-fun m!1194535 () Bool)

(assert (=> b!1303944 m!1194535))

(declare-fun m!1194537 () Bool)

(assert (=> b!1303944 m!1194537))

(declare-fun m!1194539 () Bool)

(assert (=> mapNonEmpty!53969 m!1194539))

(declare-fun m!1194541 () Bool)

(assert (=> b!1303938 m!1194541))

(declare-fun m!1194543 () Bool)

(assert (=> b!1303941 m!1194543))

(check-sat (not b!1303935) (not b!1303934) (not mapNonEmpty!53969) (not b!1303939) (not b!1303944) (not start!110128) (not b_next!29275) (not b!1303941) b_and!47431 tp_is_empty!34915 (not b!1303938))
(check-sat b_and!47431 (not b_next!29275))
(get-model)

(declare-fun d!141667 () Bool)

(declare-fun e!743815 () Bool)

(assert (=> d!141667 e!743815))

(declare-fun res!866085 () Bool)

(assert (=> d!141667 (=> res!866085 e!743815)))

(declare-fun lt!583439 () Bool)

(assert (=> d!141667 (= res!866085 (not lt!583439))))

(declare-fun lt!583440 () Bool)

(assert (=> d!141667 (= lt!583439 lt!583440)))

(declare-fun lt!583441 () Unit!43025)

(declare-fun e!743816 () Unit!43025)

(assert (=> d!141667 (= lt!583441 e!743816)))

(declare-fun c!125166 () Bool)

(assert (=> d!141667 (= c!125166 lt!583440)))

(declare-fun containsKey!726 (List!29795 (_ BitVec 64)) Bool)

(assert (=> d!141667 (= lt!583440 (containsKey!726 (toList!10188 (+!4516 lt!583411 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141667 (= (contains!8254 (+!4516 lt!583411 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!583439)))

(declare-fun b!1304023 () Bool)

(declare-fun lt!583438 () Unit!43025)

(assert (=> b!1304023 (= e!743816 lt!583438)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!473 (List!29795 (_ BitVec 64)) Unit!43025)

(assert (=> b!1304023 (= lt!583438 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10188 (+!4516 lt!583411 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-datatypes ((Option!760 0))(
  ( (Some!759 (v!20152 V!51657)) (None!758) )
))
(declare-fun isDefined!516 (Option!760) Bool)

(declare-fun getValueByKey!709 (List!29795 (_ BitVec 64)) Option!760)

(assert (=> b!1304023 (isDefined!516 (getValueByKey!709 (toList!10188 (+!4516 lt!583411 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1304024 () Bool)

(declare-fun Unit!43027 () Unit!43025)

(assert (=> b!1304024 (= e!743816 Unit!43027)))

(declare-fun b!1304025 () Bool)

(assert (=> b!1304025 (= e!743815 (isDefined!516 (getValueByKey!709 (toList!10188 (+!4516 lt!583411 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141667 c!125166) b!1304023))

(assert (= (and d!141667 (not c!125166)) b!1304024))

(assert (= (and d!141667 (not res!866085)) b!1304025))

(declare-fun m!1194609 () Bool)

(assert (=> d!141667 m!1194609))

(declare-fun m!1194611 () Bool)

(assert (=> b!1304023 m!1194611))

(declare-fun m!1194613 () Bool)

(assert (=> b!1304023 m!1194613))

(assert (=> b!1304023 m!1194613))

(declare-fun m!1194615 () Bool)

(assert (=> b!1304023 m!1194615))

(assert (=> b!1304025 m!1194613))

(assert (=> b!1304025 m!1194613))

(assert (=> b!1304025 m!1194615))

(assert (=> b!1303944 d!141667))

(declare-fun d!141669 () Bool)

(declare-fun e!743819 () Bool)

(assert (=> d!141669 e!743819))

(declare-fun res!866090 () Bool)

(assert (=> d!141669 (=> (not res!866090) (not e!743819))))

(declare-fun lt!583450 () ListLongMap!20345)

(assert (=> d!141669 (= res!866090 (contains!8254 lt!583450 (_1!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!583453 () List!29795)

(assert (=> d!141669 (= lt!583450 (ListLongMap!20346 lt!583453))))

(declare-fun lt!583451 () Unit!43025)

(declare-fun lt!583452 () Unit!43025)

(assert (=> d!141669 (= lt!583451 lt!583452)))

(assert (=> d!141669 (= (getValueByKey!709 lt!583453 (_1!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!759 (_2!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!353 (List!29795 (_ BitVec 64) V!51657) Unit!43025)

(assert (=> d!141669 (= lt!583452 (lemmaContainsTupThenGetReturnValue!353 lt!583453 (_1!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!482 (List!29795 (_ BitVec 64) V!51657) List!29795)

(assert (=> d!141669 (= lt!583453 (insertStrictlySorted!482 (toList!10188 lt!583411) (_1!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141669 (= (+!4516 lt!583411 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!583450)))

(declare-fun b!1304030 () Bool)

(declare-fun res!866091 () Bool)

(assert (=> b!1304030 (=> (not res!866091) (not e!743819))))

(assert (=> b!1304030 (= res!866091 (= (getValueByKey!709 (toList!10188 lt!583450) (_1!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!759 (_2!11355 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1304031 () Bool)

(declare-fun contains!8257 (List!29795 tuple2!22688) Bool)

(assert (=> b!1304031 (= e!743819 (contains!8257 (toList!10188 lt!583450) (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141669 res!866090) b!1304030))

(assert (= (and b!1304030 res!866091) b!1304031))

(declare-fun m!1194617 () Bool)

(assert (=> d!141669 m!1194617))

(declare-fun m!1194619 () Bool)

(assert (=> d!141669 m!1194619))

(declare-fun m!1194621 () Bool)

(assert (=> d!141669 m!1194621))

(declare-fun m!1194623 () Bool)

(assert (=> d!141669 m!1194623))

(declare-fun m!1194625 () Bool)

(assert (=> b!1304030 m!1194625))

(declare-fun m!1194627 () Bool)

(assert (=> b!1304031 m!1194627))

(assert (=> b!1303944 d!141669))

(declare-fun d!141671 () Bool)

(assert (=> d!141671 (not (contains!8254 (+!4516 lt!583411 (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!583456 () Unit!43025)

(declare-fun choose!1935 (ListLongMap!20345 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43025)

(assert (=> d!141671 (= lt!583456 (choose!1935 lt!583411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!743822 () Bool)

(assert (=> d!141671 e!743822))

(declare-fun res!866094 () Bool)

(assert (=> d!141671 (=> (not res!866094) (not e!743822))))

(assert (=> d!141671 (= res!866094 (not (contains!8254 lt!583411 k0!1205)))))

(assert (=> d!141671 (= (addStillNotContains!469 lt!583411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!583456)))

(declare-fun b!1304035 () Bool)

(assert (=> b!1304035 (= e!743822 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141671 res!866094) b!1304035))

(assert (=> d!141671 m!1194531))

(assert (=> d!141671 m!1194531))

(assert (=> d!141671 m!1194533))

(declare-fun m!1194629 () Bool)

(assert (=> d!141671 m!1194629))

(declare-fun m!1194631 () Bool)

(assert (=> d!141671 m!1194631))

(assert (=> b!1303944 d!141671))

(declare-fun b!1304060 () Bool)

(declare-fun e!743841 () Bool)

(declare-fun lt!583475 () ListLongMap!20345)

(declare-fun isEmpty!1071 (ListLongMap!20345) Bool)

(assert (=> b!1304060 (= e!743841 (isEmpty!1071 lt!583475))))

(declare-fun b!1304061 () Bool)

(declare-fun res!866104 () Bool)

(declare-fun e!743842 () Bool)

(assert (=> b!1304061 (=> (not res!866104) (not e!743842))))

(assert (=> b!1304061 (= res!866104 (not (contains!8254 lt!583475 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304062 () Bool)

(assert (=> b!1304062 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42417 _keys!1741)))))

(assert (=> b!1304062 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42418 _values!1445)))))

(declare-fun e!743839 () Bool)

(declare-fun apply!1016 (ListLongMap!20345 (_ BitVec 64)) V!51657)

(declare-fun get!21172 (ValueCell!16559 V!51657) V!51657)

(declare-fun dynLambda!3454 (Int (_ BitVec 64)) V!51657)

(assert (=> b!1304062 (= e!743839 (= (apply!1016 lt!583475 (select (arr!41865 _keys!1741) from!2144)) (get!21172 (select (arr!41866 _values!1445) from!2144) (dynLambda!3454 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1304063 () Bool)

(declare-fun e!743837 () Bool)

(assert (=> b!1304063 (= e!743842 e!743837)))

(declare-fun c!125176 () Bool)

(declare-fun e!743840 () Bool)

(assert (=> b!1304063 (= c!125176 e!743840)))

(declare-fun res!866105 () Bool)

(assert (=> b!1304063 (=> (not res!866105) (not e!743840))))

(assert (=> b!1304063 (= res!866105 (bvslt from!2144 (size!42417 _keys!1741)))))

(declare-fun b!1304064 () Bool)

(declare-fun e!743838 () ListLongMap!20345)

(declare-fun call!64223 () ListLongMap!20345)

(assert (=> b!1304064 (= e!743838 call!64223)))

(declare-fun b!1304065 () Bool)

(declare-fun e!743843 () ListLongMap!20345)

(assert (=> b!1304065 (= e!743843 e!743838)))

(declare-fun c!125178 () Bool)

(assert (=> b!1304065 (= c!125178 (validKeyInArray!0 (select (arr!41865 _keys!1741) from!2144)))))

(declare-fun b!1304066 () Bool)

(assert (=> b!1304066 (= e!743837 e!743839)))

(assert (=> b!1304066 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42417 _keys!1741)))))

(declare-fun res!866106 () Bool)

(assert (=> b!1304066 (= res!866106 (contains!8254 lt!583475 (select (arr!41865 _keys!1741) from!2144)))))

(assert (=> b!1304066 (=> (not res!866106) (not e!743839))))

(declare-fun d!141673 () Bool)

(assert (=> d!141673 e!743842))

(declare-fun res!866103 () Bool)

(assert (=> d!141673 (=> (not res!866103) (not e!743842))))

(assert (=> d!141673 (= res!866103 (not (contains!8254 lt!583475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141673 (= lt!583475 e!743843)))

(declare-fun c!125177 () Bool)

(assert (=> d!141673 (= c!125177 (bvsge from!2144 (size!42417 _keys!1741)))))

(assert (=> d!141673 (validMask!0 mask!2175)))

(assert (=> d!141673 (= (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583475)))

(declare-fun bm!64220 () Bool)

(assert (=> bm!64220 (= call!64223 (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1304067 () Bool)

(assert (=> b!1304067 (= e!743837 e!743841)))

(declare-fun c!125175 () Bool)

(assert (=> b!1304067 (= c!125175 (bvslt from!2144 (size!42417 _keys!1741)))))

(declare-fun b!1304068 () Bool)

(assert (=> b!1304068 (= e!743841 (= lt!583475 (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304069 () Bool)

(assert (=> b!1304069 (= e!743840 (validKeyInArray!0 (select (arr!41865 _keys!1741) from!2144)))))

(assert (=> b!1304069 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1304070 () Bool)

(assert (=> b!1304070 (= e!743843 (ListLongMap!20346 Nil!29792))))

(declare-fun b!1304071 () Bool)

(declare-fun lt!583476 () Unit!43025)

(declare-fun lt!583474 () Unit!43025)

(assert (=> b!1304071 (= lt!583476 lt!583474)))

(declare-fun lt!583477 () V!51657)

(declare-fun lt!583473 () (_ BitVec 64))

(declare-fun lt!583472 () ListLongMap!20345)

(declare-fun lt!583471 () (_ BitVec 64))

(assert (=> b!1304071 (not (contains!8254 (+!4516 lt!583472 (tuple2!22689 lt!583473 lt!583477)) lt!583471))))

(assert (=> b!1304071 (= lt!583474 (addStillNotContains!469 lt!583472 lt!583473 lt!583477 lt!583471))))

(assert (=> b!1304071 (= lt!583471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1304071 (= lt!583477 (get!21172 (select (arr!41866 _values!1445) from!2144) (dynLambda!3454 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304071 (= lt!583473 (select (arr!41865 _keys!1741) from!2144))))

(assert (=> b!1304071 (= lt!583472 call!64223)))

(assert (=> b!1304071 (= e!743838 (+!4516 call!64223 (tuple2!22689 (select (arr!41865 _keys!1741) from!2144) (get!21172 (select (arr!41866 _values!1445) from!2144) (dynLambda!3454 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141673 c!125177) b!1304070))

(assert (= (and d!141673 (not c!125177)) b!1304065))

(assert (= (and b!1304065 c!125178) b!1304071))

(assert (= (and b!1304065 (not c!125178)) b!1304064))

(assert (= (or b!1304071 b!1304064) bm!64220))

(assert (= (and d!141673 res!866103) b!1304061))

(assert (= (and b!1304061 res!866104) b!1304063))

(assert (= (and b!1304063 res!866105) b!1304069))

(assert (= (and b!1304063 c!125176) b!1304066))

(assert (= (and b!1304063 (not c!125176)) b!1304067))

(assert (= (and b!1304066 res!866106) b!1304062))

(assert (= (and b!1304067 c!125175) b!1304068))

(assert (= (and b!1304067 (not c!125175)) b!1304060))

(declare-fun b_lambda!23285 () Bool)

(assert (=> (not b_lambda!23285) (not b!1304062)))

(declare-fun t!43389 () Bool)

(declare-fun tb!11393 () Bool)

(assert (=> (and start!110128 (= defaultEntry!1448 defaultEntry!1448) t!43389) tb!11393))

(declare-fun result!23817 () Bool)

(assert (=> tb!11393 (= result!23817 tp_is_empty!34915)))

(assert (=> b!1304062 t!43389))

(declare-fun b_and!47437 () Bool)

(assert (= b_and!47431 (and (=> t!43389 result!23817) b_and!47437)))

(declare-fun b_lambda!23287 () Bool)

(assert (=> (not b_lambda!23287) (not b!1304071)))

(assert (=> b!1304071 t!43389))

(declare-fun b_and!47439 () Bool)

(assert (= b_and!47437 (and (=> t!43389 result!23817) b_and!47439)))

(declare-fun m!1194633 () Bool)

(assert (=> b!1304071 m!1194633))

(assert (=> b!1304071 m!1194523))

(declare-fun m!1194635 () Bool)

(assert (=> b!1304071 m!1194635))

(declare-fun m!1194637 () Bool)

(assert (=> b!1304071 m!1194637))

(declare-fun m!1194639 () Bool)

(assert (=> b!1304071 m!1194639))

(assert (=> b!1304071 m!1194639))

(declare-fun m!1194641 () Bool)

(assert (=> b!1304071 m!1194641))

(declare-fun m!1194643 () Bool)

(assert (=> b!1304071 m!1194643))

(assert (=> b!1304071 m!1194637))

(assert (=> b!1304071 m!1194635))

(declare-fun m!1194645 () Bool)

(assert (=> b!1304071 m!1194645))

(assert (=> b!1304062 m!1194523))

(declare-fun m!1194647 () Bool)

(assert (=> b!1304062 m!1194647))

(assert (=> b!1304062 m!1194523))

(assert (=> b!1304062 m!1194637))

(assert (=> b!1304062 m!1194635))

(assert (=> b!1304062 m!1194645))

(assert (=> b!1304062 m!1194635))

(assert (=> b!1304062 m!1194637))

(assert (=> b!1304066 m!1194523))

(assert (=> b!1304066 m!1194523))

(declare-fun m!1194649 () Bool)

(assert (=> b!1304066 m!1194649))

(declare-fun m!1194651 () Bool)

(assert (=> bm!64220 m!1194651))

(assert (=> b!1304069 m!1194523))

(assert (=> b!1304069 m!1194523))

(assert (=> b!1304069 m!1194525))

(assert (=> b!1304068 m!1194651))

(declare-fun m!1194653 () Bool)

(assert (=> d!141673 m!1194653))

(assert (=> d!141673 m!1194517))

(declare-fun m!1194655 () Bool)

(assert (=> b!1304061 m!1194655))

(assert (=> b!1304065 m!1194523))

(assert (=> b!1304065 m!1194523))

(assert (=> b!1304065 m!1194525))

(declare-fun m!1194657 () Bool)

(assert (=> b!1304060 m!1194657))

(assert (=> b!1303944 d!141673))

(declare-fun d!141675 () Bool)

(assert (=> d!141675 (= (validKeyInArray!0 (select (arr!41865 _keys!1741) from!2144)) (and (not (= (select (arr!41865 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41865 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303939 d!141675))

(declare-fun d!141677 () Bool)

(assert (=> d!141677 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110128 d!141677))

(declare-fun d!141679 () Bool)

(assert (=> d!141679 (= (array_inv!31843 _values!1445) (bvsge (size!42418 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110128 d!141679))

(declare-fun d!141681 () Bool)

(assert (=> d!141681 (= (array_inv!31844 _keys!1741) (bvsge (size!42417 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110128 d!141681))

(declare-fun d!141683 () Bool)

(declare-fun e!743844 () Bool)

(assert (=> d!141683 e!743844))

(declare-fun res!866107 () Bool)

(assert (=> d!141683 (=> res!866107 e!743844)))

(declare-fun lt!583479 () Bool)

(assert (=> d!141683 (= res!866107 (not lt!583479))))

(declare-fun lt!583480 () Bool)

(assert (=> d!141683 (= lt!583479 lt!583480)))

(declare-fun lt!583481 () Unit!43025)

(declare-fun e!743845 () Unit!43025)

(assert (=> d!141683 (= lt!583481 e!743845)))

(declare-fun c!125179 () Bool)

(assert (=> d!141683 (= c!125179 lt!583480)))

(assert (=> d!141683 (= lt!583480 (containsKey!726 (toList!10188 (getCurrentListMap!5089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141683 (= (contains!8254 (getCurrentListMap!5089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583479)))

(declare-fun b!1304074 () Bool)

(declare-fun lt!583478 () Unit!43025)

(assert (=> b!1304074 (= e!743845 lt!583478)))

(assert (=> b!1304074 (= lt!583478 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10188 (getCurrentListMap!5089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304074 (isDefined!516 (getValueByKey!709 (toList!10188 (getCurrentListMap!5089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304075 () Bool)

(declare-fun Unit!43028 () Unit!43025)

(assert (=> b!1304075 (= e!743845 Unit!43028)))

(declare-fun b!1304076 () Bool)

(assert (=> b!1304076 (= e!743844 (isDefined!516 (getValueByKey!709 (toList!10188 (getCurrentListMap!5089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141683 c!125179) b!1304074))

(assert (= (and d!141683 (not c!125179)) b!1304075))

(assert (= (and d!141683 (not res!866107)) b!1304076))

(declare-fun m!1194659 () Bool)

(assert (=> d!141683 m!1194659))

(declare-fun m!1194661 () Bool)

(assert (=> b!1304074 m!1194661))

(declare-fun m!1194663 () Bool)

(assert (=> b!1304074 m!1194663))

(assert (=> b!1304074 m!1194663))

(declare-fun m!1194665 () Bool)

(assert (=> b!1304074 m!1194665))

(assert (=> b!1304076 m!1194663))

(assert (=> b!1304076 m!1194663))

(assert (=> b!1304076 m!1194665))

(assert (=> b!1303934 d!141683))

(declare-fun b!1304119 () Bool)

(declare-fun c!125195 () Bool)

(assert (=> b!1304119 (= c!125195 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!743876 () ListLongMap!20345)

(declare-fun e!743884 () ListLongMap!20345)

(assert (=> b!1304119 (= e!743876 e!743884)))

(declare-fun bm!64235 () Bool)

(declare-fun call!64241 () ListLongMap!20345)

(declare-fun call!64238 () ListLongMap!20345)

(assert (=> bm!64235 (= call!64241 call!64238)))

(declare-fun b!1304120 () Bool)

(declare-fun e!743882 () Bool)

(declare-fun e!743874 () Bool)

(assert (=> b!1304120 (= e!743882 e!743874)))

(declare-fun res!866128 () Bool)

(declare-fun call!64242 () Bool)

(assert (=> b!1304120 (= res!866128 call!64242)))

(assert (=> b!1304120 (=> (not res!866128) (not e!743874))))

(declare-fun b!1304121 () Bool)

(declare-fun e!743881 () ListLongMap!20345)

(assert (=> b!1304121 (= e!743881 e!743876)))

(declare-fun c!125192 () Bool)

(assert (=> b!1304121 (= c!125192 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!141685 () Bool)

(declare-fun e!743880 () Bool)

(assert (=> d!141685 e!743880))

(declare-fun res!866133 () Bool)

(assert (=> d!141685 (=> (not res!866133) (not e!743880))))

(assert (=> d!141685 (= res!866133 (or (bvsge from!2144 (size!42417 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42417 _keys!1741)))))))

(declare-fun lt!583535 () ListLongMap!20345)

(declare-fun lt!583530 () ListLongMap!20345)

(assert (=> d!141685 (= lt!583535 lt!583530)))

(declare-fun lt!583540 () Unit!43025)

(declare-fun e!743872 () Unit!43025)

(assert (=> d!141685 (= lt!583540 e!743872)))

(declare-fun c!125194 () Bool)

(declare-fun e!743875 () Bool)

(assert (=> d!141685 (= c!125194 e!743875)))

(declare-fun res!866129 () Bool)

(assert (=> d!141685 (=> (not res!866129) (not e!743875))))

(assert (=> d!141685 (= res!866129 (bvslt from!2144 (size!42417 _keys!1741)))))

(assert (=> d!141685 (= lt!583530 e!743881)))

(declare-fun c!125193 () Bool)

(assert (=> d!141685 (= c!125193 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141685 (validMask!0 mask!2175)))

(assert (=> d!141685 (= (getCurrentListMap!5089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583535)))

(declare-fun b!1304122 () Bool)

(declare-fun e!743873 () Bool)

(declare-fun e!743878 () Bool)

(assert (=> b!1304122 (= e!743873 e!743878)))

(declare-fun res!866132 () Bool)

(declare-fun call!64244 () Bool)

(assert (=> b!1304122 (= res!866132 call!64244)))

(assert (=> b!1304122 (=> (not res!866132) (not e!743878))))

(declare-fun b!1304123 () Bool)

(declare-fun res!866127 () Bool)

(assert (=> b!1304123 (=> (not res!866127) (not e!743880))))

(assert (=> b!1304123 (= res!866127 e!743873)))

(declare-fun c!125197 () Bool)

(assert (=> b!1304123 (= c!125197 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64236 () Bool)

(declare-fun call!64239 () ListLongMap!20345)

(assert (=> bm!64236 (= call!64238 call!64239)))

(declare-fun b!1304124 () Bool)

(declare-fun call!64243 () ListLongMap!20345)

(assert (=> b!1304124 (= e!743884 call!64243)))

(declare-fun b!1304125 () Bool)

(declare-fun e!743879 () Bool)

(assert (=> b!1304125 (= e!743879 (= (apply!1016 lt!583535 (select (arr!41865 _keys!1741) from!2144)) (get!21172 (select (arr!41866 _values!1445) from!2144) (dynLambda!3454 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304125 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42418 _values!1445)))))

(assert (=> b!1304125 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42417 _keys!1741)))))

(declare-fun b!1304126 () Bool)

(assert (=> b!1304126 (= e!743878 (= (apply!1016 lt!583535 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64237 () Bool)

(declare-fun call!64240 () ListLongMap!20345)

(assert (=> bm!64237 (= call!64240 (+!4516 (ite c!125193 call!64239 (ite c!125192 call!64238 call!64241)) (ite (or c!125193 c!125192) (tuple2!22689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64238 () Bool)

(assert (=> bm!64238 (= call!64243 call!64240)))

(declare-fun b!1304127 () Bool)

(assert (=> b!1304127 (= e!743884 call!64241)))

(declare-fun b!1304128 () Bool)

(assert (=> b!1304128 (= e!743873 (not call!64244))))

(declare-fun b!1304129 () Bool)

(assert (=> b!1304129 (= e!743876 call!64243)))

(declare-fun b!1304130 () Bool)

(declare-fun Unit!43029 () Unit!43025)

(assert (=> b!1304130 (= e!743872 Unit!43029)))

(declare-fun b!1304131 () Bool)

(assert (=> b!1304131 (= e!743875 (validKeyInArray!0 (select (arr!41865 _keys!1741) from!2144)))))

(declare-fun b!1304132 () Bool)

(declare-fun e!743883 () Bool)

(assert (=> b!1304132 (= e!743883 (validKeyInArray!0 (select (arr!41865 _keys!1741) from!2144)))))

(declare-fun bm!64239 () Bool)

(assert (=> bm!64239 (= call!64239 (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!64240 () Bool)

(assert (=> bm!64240 (= call!64242 (contains!8254 lt!583535 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64241 () Bool)

(assert (=> bm!64241 (= call!64244 (contains!8254 lt!583535 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304133 () Bool)

(assert (=> b!1304133 (= e!743874 (= (apply!1016 lt!583535 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1304134 () Bool)

(assert (=> b!1304134 (= e!743880 e!743882)))

(declare-fun c!125196 () Bool)

(assert (=> b!1304134 (= c!125196 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1304135 () Bool)

(declare-fun res!866134 () Bool)

(assert (=> b!1304135 (=> (not res!866134) (not e!743880))))

(declare-fun e!743877 () Bool)

(assert (=> b!1304135 (= res!866134 e!743877)))

(declare-fun res!866130 () Bool)

(assert (=> b!1304135 (=> res!866130 e!743877)))

(assert (=> b!1304135 (= res!866130 (not e!743883))))

(declare-fun res!866126 () Bool)

(assert (=> b!1304135 (=> (not res!866126) (not e!743883))))

(assert (=> b!1304135 (= res!866126 (bvslt from!2144 (size!42417 _keys!1741)))))

(declare-fun b!1304136 () Bool)

(assert (=> b!1304136 (= e!743881 (+!4516 call!64240 (tuple2!22689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1304137 () Bool)

(declare-fun lt!583547 () Unit!43025)

(assert (=> b!1304137 (= e!743872 lt!583547)))

(declare-fun lt!583537 () ListLongMap!20345)

(assert (=> b!1304137 (= lt!583537 (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583544 () (_ BitVec 64))

(assert (=> b!1304137 (= lt!583544 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583541 () (_ BitVec 64))

(assert (=> b!1304137 (= lt!583541 (select (arr!41865 _keys!1741) from!2144))))

(declare-fun lt!583539 () Unit!43025)

(declare-fun addStillContains!1111 (ListLongMap!20345 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43025)

(assert (=> b!1304137 (= lt!583539 (addStillContains!1111 lt!583537 lt!583544 zeroValue!1387 lt!583541))))

(assert (=> b!1304137 (contains!8254 (+!4516 lt!583537 (tuple2!22689 lt!583544 zeroValue!1387)) lt!583541)))

(declare-fun lt!583534 () Unit!43025)

(assert (=> b!1304137 (= lt!583534 lt!583539)))

(declare-fun lt!583529 () ListLongMap!20345)

(assert (=> b!1304137 (= lt!583529 (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583533 () (_ BitVec 64))

(assert (=> b!1304137 (= lt!583533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583526 () (_ BitVec 64))

(assert (=> b!1304137 (= lt!583526 (select (arr!41865 _keys!1741) from!2144))))

(declare-fun lt!583538 () Unit!43025)

(declare-fun addApplyDifferent!554 (ListLongMap!20345 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43025)

(assert (=> b!1304137 (= lt!583538 (addApplyDifferent!554 lt!583529 lt!583533 minValue!1387 lt!583526))))

(assert (=> b!1304137 (= (apply!1016 (+!4516 lt!583529 (tuple2!22689 lt!583533 minValue!1387)) lt!583526) (apply!1016 lt!583529 lt!583526))))

(declare-fun lt!583528 () Unit!43025)

(assert (=> b!1304137 (= lt!583528 lt!583538)))

(declare-fun lt!583545 () ListLongMap!20345)

(assert (=> b!1304137 (= lt!583545 (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583532 () (_ BitVec 64))

(assert (=> b!1304137 (= lt!583532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583542 () (_ BitVec 64))

(assert (=> b!1304137 (= lt!583542 (select (arr!41865 _keys!1741) from!2144))))

(declare-fun lt!583531 () Unit!43025)

(assert (=> b!1304137 (= lt!583531 (addApplyDifferent!554 lt!583545 lt!583532 zeroValue!1387 lt!583542))))

(assert (=> b!1304137 (= (apply!1016 (+!4516 lt!583545 (tuple2!22689 lt!583532 zeroValue!1387)) lt!583542) (apply!1016 lt!583545 lt!583542))))

(declare-fun lt!583536 () Unit!43025)

(assert (=> b!1304137 (= lt!583536 lt!583531)))

(declare-fun lt!583546 () ListLongMap!20345)

(assert (=> b!1304137 (= lt!583546 (getCurrentListMapNoExtraKeys!6150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583543 () (_ BitVec 64))

(assert (=> b!1304137 (= lt!583543 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583527 () (_ BitVec 64))

(assert (=> b!1304137 (= lt!583527 (select (arr!41865 _keys!1741) from!2144))))

(assert (=> b!1304137 (= lt!583547 (addApplyDifferent!554 lt!583546 lt!583543 minValue!1387 lt!583527))))

(assert (=> b!1304137 (= (apply!1016 (+!4516 lt!583546 (tuple2!22689 lt!583543 minValue!1387)) lt!583527) (apply!1016 lt!583546 lt!583527))))

(declare-fun b!1304138 () Bool)

(assert (=> b!1304138 (= e!743882 (not call!64242))))

(declare-fun b!1304139 () Bool)

(assert (=> b!1304139 (= e!743877 e!743879)))

(declare-fun res!866131 () Bool)

(assert (=> b!1304139 (=> (not res!866131) (not e!743879))))

(assert (=> b!1304139 (= res!866131 (contains!8254 lt!583535 (select (arr!41865 _keys!1741) from!2144)))))

(assert (=> b!1304139 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42417 _keys!1741)))))

(assert (= (and d!141685 c!125193) b!1304136))

(assert (= (and d!141685 (not c!125193)) b!1304121))

(assert (= (and b!1304121 c!125192) b!1304129))

(assert (= (and b!1304121 (not c!125192)) b!1304119))

(assert (= (and b!1304119 c!125195) b!1304124))

(assert (= (and b!1304119 (not c!125195)) b!1304127))

(assert (= (or b!1304124 b!1304127) bm!64235))

(assert (= (or b!1304129 bm!64235) bm!64236))

(assert (= (or b!1304129 b!1304124) bm!64238))

(assert (= (or b!1304136 bm!64236) bm!64239))

(assert (= (or b!1304136 bm!64238) bm!64237))

(assert (= (and d!141685 res!866129) b!1304131))

(assert (= (and d!141685 c!125194) b!1304137))

(assert (= (and d!141685 (not c!125194)) b!1304130))

(assert (= (and d!141685 res!866133) b!1304135))

(assert (= (and b!1304135 res!866126) b!1304132))

(assert (= (and b!1304135 (not res!866130)) b!1304139))

(assert (= (and b!1304139 res!866131) b!1304125))

(assert (= (and b!1304135 res!866134) b!1304123))

(assert (= (and b!1304123 c!125197) b!1304122))

(assert (= (and b!1304123 (not c!125197)) b!1304128))

(assert (= (and b!1304122 res!866132) b!1304126))

(assert (= (or b!1304122 b!1304128) bm!64241))

(assert (= (and b!1304123 res!866127) b!1304134))

(assert (= (and b!1304134 c!125196) b!1304120))

(assert (= (and b!1304134 (not c!125196)) b!1304138))

(assert (= (and b!1304120 res!866128) b!1304133))

(assert (= (or b!1304120 b!1304138) bm!64240))

(declare-fun b_lambda!23289 () Bool)

(assert (=> (not b_lambda!23289) (not b!1304125)))

(assert (=> b!1304125 t!43389))

(declare-fun b_and!47441 () Bool)

(assert (= b_and!47439 (and (=> t!43389 result!23817) b_and!47441)))

(declare-fun m!1194667 () Bool)

(assert (=> bm!64237 m!1194667))

(declare-fun m!1194669 () Bool)

(assert (=> b!1304137 m!1194669))

(declare-fun m!1194671 () Bool)

(assert (=> b!1304137 m!1194671))

(assert (=> b!1304137 m!1194537))

(declare-fun m!1194673 () Bool)

(assert (=> b!1304137 m!1194673))

(declare-fun m!1194675 () Bool)

(assert (=> b!1304137 m!1194675))

(declare-fun m!1194677 () Bool)

(assert (=> b!1304137 m!1194677))

(declare-fun m!1194679 () Bool)

(assert (=> b!1304137 m!1194679))

(declare-fun m!1194681 () Bool)

(assert (=> b!1304137 m!1194681))

(assert (=> b!1304137 m!1194679))

(declare-fun m!1194683 () Bool)

(assert (=> b!1304137 m!1194683))

(declare-fun m!1194685 () Bool)

(assert (=> b!1304137 m!1194685))

(assert (=> b!1304137 m!1194685))

(declare-fun m!1194687 () Bool)

(assert (=> b!1304137 m!1194687))

(assert (=> b!1304137 m!1194523))

(declare-fun m!1194689 () Bool)

(assert (=> b!1304137 m!1194689))

(assert (=> b!1304137 m!1194671))

(declare-fun m!1194691 () Bool)

(assert (=> b!1304137 m!1194691))

(assert (=> b!1304137 m!1194689))

(declare-fun m!1194693 () Bool)

(assert (=> b!1304137 m!1194693))

(declare-fun m!1194695 () Bool)

(assert (=> b!1304137 m!1194695))

(declare-fun m!1194697 () Bool)

(assert (=> b!1304137 m!1194697))

(declare-fun m!1194699 () Bool)

(assert (=> bm!64240 m!1194699))

(declare-fun m!1194701 () Bool)

(assert (=> b!1304126 m!1194701))

(assert (=> d!141685 m!1194517))

(assert (=> b!1304139 m!1194523))

(assert (=> b!1304139 m!1194523))

(declare-fun m!1194703 () Bool)

(assert (=> b!1304139 m!1194703))

(assert (=> b!1304131 m!1194523))

(assert (=> b!1304131 m!1194523))

(assert (=> b!1304131 m!1194525))

(assert (=> b!1304125 m!1194637))

(assert (=> b!1304125 m!1194635))

(assert (=> b!1304125 m!1194645))

(assert (=> b!1304125 m!1194635))

(assert (=> b!1304125 m!1194523))

(assert (=> b!1304125 m!1194523))

(declare-fun m!1194705 () Bool)

(assert (=> b!1304125 m!1194705))

(assert (=> b!1304125 m!1194637))

(assert (=> bm!64239 m!1194537))

(declare-fun m!1194707 () Bool)

(assert (=> bm!64241 m!1194707))

(declare-fun m!1194709 () Bool)

(assert (=> b!1304136 m!1194709))

(declare-fun m!1194711 () Bool)

(assert (=> b!1304133 m!1194711))

(assert (=> b!1304132 m!1194523))

(assert (=> b!1304132 m!1194523))

(assert (=> b!1304132 m!1194525))

(assert (=> b!1303934 d!141685))

(declare-fun b!1304150 () Bool)

(declare-fun e!743896 () Bool)

(declare-fun contains!8258 (List!29796 (_ BitVec 64)) Bool)

(assert (=> b!1304150 (= e!743896 (contains!8258 Nil!29793 (select (arr!41865 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141687 () Bool)

(declare-fun res!866143 () Bool)

(declare-fun e!743893 () Bool)

(assert (=> d!141687 (=> res!866143 e!743893)))

(assert (=> d!141687 (= res!866143 (bvsge #b00000000000000000000000000000000 (size!42417 _keys!1741)))))

(assert (=> d!141687 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29793) e!743893)))

(declare-fun b!1304151 () Bool)

(declare-fun e!743895 () Bool)

(declare-fun call!64247 () Bool)

(assert (=> b!1304151 (= e!743895 call!64247)))

(declare-fun b!1304152 () Bool)

(assert (=> b!1304152 (= e!743895 call!64247)))

(declare-fun bm!64244 () Bool)

(declare-fun c!125200 () Bool)

(assert (=> bm!64244 (= call!64247 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125200 (Cons!29792 (select (arr!41865 _keys!1741) #b00000000000000000000000000000000) Nil!29793) Nil!29793)))))

(declare-fun b!1304153 () Bool)

(declare-fun e!743894 () Bool)

(assert (=> b!1304153 (= e!743893 e!743894)))

(declare-fun res!866141 () Bool)

(assert (=> b!1304153 (=> (not res!866141) (not e!743894))))

(assert (=> b!1304153 (= res!866141 (not e!743896))))

(declare-fun res!866142 () Bool)

(assert (=> b!1304153 (=> (not res!866142) (not e!743896))))

(assert (=> b!1304153 (= res!866142 (validKeyInArray!0 (select (arr!41865 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304154 () Bool)

(assert (=> b!1304154 (= e!743894 e!743895)))

(assert (=> b!1304154 (= c!125200 (validKeyInArray!0 (select (arr!41865 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141687 (not res!866143)) b!1304153))

(assert (= (and b!1304153 res!866142) b!1304150))

(assert (= (and b!1304153 res!866141) b!1304154))

(assert (= (and b!1304154 c!125200) b!1304151))

(assert (= (and b!1304154 (not c!125200)) b!1304152))

(assert (= (or b!1304151 b!1304152) bm!64244))

(declare-fun m!1194713 () Bool)

(assert (=> b!1304150 m!1194713))

(assert (=> b!1304150 m!1194713))

(declare-fun m!1194715 () Bool)

(assert (=> b!1304150 m!1194715))

(assert (=> bm!64244 m!1194713))

(declare-fun m!1194717 () Bool)

(assert (=> bm!64244 m!1194717))

(assert (=> b!1304153 m!1194713))

(assert (=> b!1304153 m!1194713))

(declare-fun m!1194719 () Bool)

(assert (=> b!1304153 m!1194719))

(assert (=> b!1304154 m!1194713))

(assert (=> b!1304154 m!1194713))

(assert (=> b!1304154 m!1194719))

(assert (=> b!1303938 d!141687))

(declare-fun b!1304163 () Bool)

(declare-fun e!743904 () Bool)

(declare-fun call!64250 () Bool)

(assert (=> b!1304163 (= e!743904 call!64250)))

(declare-fun b!1304164 () Bool)

(declare-fun e!743903 () Bool)

(assert (=> b!1304164 (= e!743903 call!64250)))

(declare-fun d!141689 () Bool)

(declare-fun res!866148 () Bool)

(declare-fun e!743905 () Bool)

(assert (=> d!141689 (=> res!866148 e!743905)))

(assert (=> d!141689 (= res!866148 (bvsge #b00000000000000000000000000000000 (size!42417 _keys!1741)))))

(assert (=> d!141689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743905)))

(declare-fun b!1304165 () Bool)

(assert (=> b!1304165 (= e!743905 e!743903)))

(declare-fun c!125203 () Bool)

(assert (=> b!1304165 (= c!125203 (validKeyInArray!0 (select (arr!41865 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304166 () Bool)

(assert (=> b!1304166 (= e!743903 e!743904)))

(declare-fun lt!583556 () (_ BitVec 64))

(assert (=> b!1304166 (= lt!583556 (select (arr!41865 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583554 () Unit!43025)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86749 (_ BitVec 64) (_ BitVec 32)) Unit!43025)

(assert (=> b!1304166 (= lt!583554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583556 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1304166 (arrayContainsKey!0 _keys!1741 lt!583556 #b00000000000000000000000000000000)))

(declare-fun lt!583555 () Unit!43025)

(assert (=> b!1304166 (= lt!583555 lt!583554)))

(declare-fun res!866149 () Bool)

(declare-datatypes ((SeekEntryResult!10025 0))(
  ( (MissingZero!10025 (index!42471 (_ BitVec 32))) (Found!10025 (index!42472 (_ BitVec 32))) (Intermediate!10025 (undefined!10837 Bool) (index!42473 (_ BitVec 32)) (x!115821 (_ BitVec 32))) (Undefined!10025) (MissingVacant!10025 (index!42474 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86749 (_ BitVec 32)) SeekEntryResult!10025)

(assert (=> b!1304166 (= res!866149 (= (seekEntryOrOpen!0 (select (arr!41865 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10025 #b00000000000000000000000000000000)))))

(assert (=> b!1304166 (=> (not res!866149) (not e!743904))))

(declare-fun bm!64247 () Bool)

(assert (=> bm!64247 (= call!64250 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!141689 (not res!866148)) b!1304165))

(assert (= (and b!1304165 c!125203) b!1304166))

(assert (= (and b!1304165 (not c!125203)) b!1304164))

(assert (= (and b!1304166 res!866149) b!1304163))

(assert (= (or b!1304163 b!1304164) bm!64247))

(assert (=> b!1304165 m!1194713))

(assert (=> b!1304165 m!1194713))

(assert (=> b!1304165 m!1194719))

(assert (=> b!1304166 m!1194713))

(declare-fun m!1194721 () Bool)

(assert (=> b!1304166 m!1194721))

(declare-fun m!1194723 () Bool)

(assert (=> b!1304166 m!1194723))

(assert (=> b!1304166 m!1194713))

(declare-fun m!1194725 () Bool)

(assert (=> b!1304166 m!1194725))

(declare-fun m!1194727 () Bool)

(assert (=> bm!64247 m!1194727))

(assert (=> b!1303941 d!141689))

(declare-fun d!141691 () Bool)

(declare-fun e!743906 () Bool)

(assert (=> d!141691 e!743906))

(declare-fun res!866150 () Bool)

(assert (=> d!141691 (=> res!866150 e!743906)))

(declare-fun lt!583558 () Bool)

(assert (=> d!141691 (= res!866150 (not lt!583558))))

(declare-fun lt!583559 () Bool)

(assert (=> d!141691 (= lt!583558 lt!583559)))

(declare-fun lt!583560 () Unit!43025)

(declare-fun e!743907 () Unit!43025)

(assert (=> d!141691 (= lt!583560 e!743907)))

(declare-fun c!125204 () Bool)

(assert (=> d!141691 (= c!125204 lt!583559)))

(assert (=> d!141691 (= lt!583559 (containsKey!726 (toList!10188 (ListLongMap!20346 Nil!29792)) k0!1205))))

(assert (=> d!141691 (= (contains!8254 (ListLongMap!20346 Nil!29792) k0!1205) lt!583558)))

(declare-fun b!1304167 () Bool)

(declare-fun lt!583557 () Unit!43025)

(assert (=> b!1304167 (= e!743907 lt!583557)))

(assert (=> b!1304167 (= lt!583557 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10188 (ListLongMap!20346 Nil!29792)) k0!1205))))

(assert (=> b!1304167 (isDefined!516 (getValueByKey!709 (toList!10188 (ListLongMap!20346 Nil!29792)) k0!1205))))

(declare-fun b!1304168 () Bool)

(declare-fun Unit!43030 () Unit!43025)

(assert (=> b!1304168 (= e!743907 Unit!43030)))

(declare-fun b!1304169 () Bool)

(assert (=> b!1304169 (= e!743906 (isDefined!516 (getValueByKey!709 (toList!10188 (ListLongMap!20346 Nil!29792)) k0!1205)))))

(assert (= (and d!141691 c!125204) b!1304167))

(assert (= (and d!141691 (not c!125204)) b!1304168))

(assert (= (and d!141691 (not res!866150)) b!1304169))

(declare-fun m!1194729 () Bool)

(assert (=> d!141691 m!1194729))

(declare-fun m!1194731 () Bool)

(assert (=> b!1304167 m!1194731))

(declare-fun m!1194733 () Bool)

(assert (=> b!1304167 m!1194733))

(assert (=> b!1304167 m!1194733))

(declare-fun m!1194735 () Bool)

(assert (=> b!1304167 m!1194735))

(assert (=> b!1304169 m!1194733))

(assert (=> b!1304169 m!1194733))

(assert (=> b!1304169 m!1194735))

(assert (=> b!1303935 d!141691))

(declare-fun d!141693 () Bool)

(assert (=> d!141693 (not (contains!8254 (ListLongMap!20346 Nil!29792) k0!1205))))

(declare-fun lt!583563 () Unit!43025)

(declare-fun choose!1936 ((_ BitVec 64)) Unit!43025)

(assert (=> d!141693 (= lt!583563 (choose!1936 k0!1205))))

(assert (=> d!141693 (= (emptyContainsNothing!218 k0!1205) lt!583563)))

(declare-fun bs!37118 () Bool)

(assert (= bs!37118 d!141693))

(assert (=> bs!37118 m!1194513))

(declare-fun m!1194737 () Bool)

(assert (=> bs!37118 m!1194737))

(assert (=> b!1303935 d!141693))

(declare-fun condMapEmpty!53978 () Bool)

(declare-fun mapDefault!53978 () ValueCell!16559)

(assert (=> mapNonEmpty!53969 (= condMapEmpty!53978 (= mapRest!53969 ((as const (Array (_ BitVec 32) ValueCell!16559)) mapDefault!53978)))))

(declare-fun e!743912 () Bool)

(declare-fun mapRes!53978 () Bool)

(assert (=> mapNonEmpty!53969 (= tp!102980 (and e!743912 mapRes!53978))))

(declare-fun mapNonEmpty!53978 () Bool)

(declare-fun tp!102996 () Bool)

(declare-fun e!743913 () Bool)

(assert (=> mapNonEmpty!53978 (= mapRes!53978 (and tp!102996 e!743913))))

(declare-fun mapValue!53978 () ValueCell!16559)

(declare-fun mapRest!53978 () (Array (_ BitVec 32) ValueCell!16559))

(declare-fun mapKey!53978 () (_ BitVec 32))

(assert (=> mapNonEmpty!53978 (= mapRest!53969 (store mapRest!53978 mapKey!53978 mapValue!53978))))

(declare-fun b!1304176 () Bool)

(assert (=> b!1304176 (= e!743913 tp_is_empty!34915)))

(declare-fun mapIsEmpty!53978 () Bool)

(assert (=> mapIsEmpty!53978 mapRes!53978))

(declare-fun b!1304177 () Bool)

(assert (=> b!1304177 (= e!743912 tp_is_empty!34915)))

(assert (= (and mapNonEmpty!53969 condMapEmpty!53978) mapIsEmpty!53978))

(assert (= (and mapNonEmpty!53969 (not condMapEmpty!53978)) mapNonEmpty!53978))

(assert (= (and mapNonEmpty!53978 ((_ is ValueCellFull!16559) mapValue!53978)) b!1304176))

(assert (= (and mapNonEmpty!53969 ((_ is ValueCellFull!16559) mapDefault!53978)) b!1304177))

(declare-fun m!1194739 () Bool)

(assert (=> mapNonEmpty!53978 m!1194739))

(declare-fun b_lambda!23291 () Bool)

(assert (= b_lambda!23287 (or (and start!110128 b_free!29275) b_lambda!23291)))

(declare-fun b_lambda!23293 () Bool)

(assert (= b_lambda!23289 (or (and start!110128 b_free!29275) b_lambda!23293)))

(declare-fun b_lambda!23295 () Bool)

(assert (= b_lambda!23285 (or (and start!110128 b_free!29275) b_lambda!23295)))

(check-sat (not b!1304132) (not b_next!29275) (not bm!64220) (not d!141685) (not d!141671) (not b!1304031) (not b!1304066) (not b!1304166) (not b!1304153) (not mapNonEmpty!53978) (not b!1304125) (not d!141691) (not b!1304169) (not b!1304065) (not bm!64241) (not b!1304069) (not b!1304137) (not d!141693) (not b!1304068) (not b_lambda!23291) (not b!1304126) (not d!141669) (not b!1304061) (not b!1304023) (not b!1304167) (not b!1304071) b_and!47441 (not b!1304133) (not b!1304060) (not b!1304076) (not bm!64247) (not b!1304136) (not d!141667) (not bm!64239) (not b!1304154) (not b_lambda!23293) (not bm!64244) (not b!1304131) (not b!1304165) tp_is_empty!34915 (not b!1304139) (not bm!64240) (not d!141683) (not bm!64237) (not b_lambda!23295) (not d!141673) (not b!1304150) (not b!1304074) (not b!1304025) (not b!1304062) (not b!1304030))
(check-sat b_and!47441 (not b_next!29275))
