; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112690 () Bool)

(assert start!112690)

(declare-fun b_free!31027 () Bool)

(declare-fun b_next!31027 () Bool)

(assert (=> start!112690 (= b_free!31027 (not b_next!31027))))

(declare-fun tp!108722 () Bool)

(declare-fun b_and!49973 () Bool)

(assert (=> start!112690 (= tp!108722 b_and!49973)))

(declare-datatypes ((V!54353 0))(
  ( (V!54354 (val!18543 Int)) )
))
(declare-datatypes ((ValueCell!17570 0))(
  ( (ValueCellFull!17570 (v!21182 V!54353)) (EmptyCell!17570) )
))
(declare-datatypes ((array!90679 0))(
  ( (array!90680 (arr!43805 (Array (_ BitVec 32) ValueCell!17570)) (size!44357 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90679)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90681 0))(
  ( (array!90682 (arr!43806 (Array (_ BitVec 32) (_ BitVec 64))) (size!44358 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90681)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54353)

(declare-fun zeroValue!1262 () V!54353)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun e!761195 () Bool)

(declare-fun b!1336753 () Bool)

(declare-datatypes ((tuple2!23982 0))(
  ( (tuple2!23983 (_1!12002 (_ BitVec 64)) (_2!12002 V!54353)) )
))
(declare-datatypes ((List!31112 0))(
  ( (Nil!31109) (Cons!31108 (h!32317 tuple2!23982) (t!45412 List!31112)) )
))
(declare-datatypes ((ListLongMap!21639 0))(
  ( (ListLongMap!21640 (toList!10835 List!31112)) )
))
(declare-fun contains!8929 (ListLongMap!21639 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5688 (array!90681 array!90679 (_ BitVec 32) (_ BitVec 32) V!54353 V!54353 (_ BitVec 32) Int) ListLongMap!21639)

(assert (=> b!1336753 (= e!761195 (not (contains!8929 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(declare-fun lt!592683 () ListLongMap!21639)

(declare-fun +!4768 (ListLongMap!21639 tuple2!23982) ListLongMap!21639)

(assert (=> b!1336753 (contains!8929 (+!4768 lt!592683 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43741 0))(
  ( (Unit!43742) )
))
(declare-fun lt!592685 () Unit!43741)

(declare-fun addStillContains!1184 (ListLongMap!21639 (_ BitVec 64) V!54353 (_ BitVec 64)) Unit!43741)

(assert (=> b!1336753 (= lt!592685 (addStillContains!1184 lt!592683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1336753 (contains!8929 lt!592683 k0!1153)))

(declare-fun lt!592686 () V!54353)

(declare-fun lt!592687 () Unit!43741)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!313 ((_ BitVec 64) (_ BitVec 64) V!54353 ListLongMap!21639) Unit!43741)

(assert (=> b!1336753 (= lt!592687 (lemmaInListMapAfterAddingDiffThenInBefore!313 k0!1153 (select (arr!43806 _keys!1590) from!1980) lt!592686 lt!592683))))

(declare-fun lt!592688 () ListLongMap!21639)

(assert (=> b!1336753 (contains!8929 lt!592688 k0!1153)))

(declare-fun lt!592684 () Unit!43741)

(assert (=> b!1336753 (= lt!592684 (lemmaInListMapAfterAddingDiffThenInBefore!313 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592688))))

(assert (=> b!1336753 (= lt!592688 (+!4768 lt!592683 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686)))))

(declare-fun get!22110 (ValueCell!17570 V!54353) V!54353)

(declare-fun dynLambda!3698 (Int (_ BitVec 64)) V!54353)

(assert (=> b!1336753 (= lt!592686 (get!22110 (select (arr!43805 _values!1320) from!1980) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6411 (array!90681 array!90679 (_ BitVec 32) (_ BitVec 32) V!54353 V!54353 (_ BitVec 32) Int) ListLongMap!21639)

(assert (=> b!1336753 (= lt!592683 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1336754 () Bool)

(declare-fun e!761197 () Bool)

(declare-fun tp_is_empty!36937 () Bool)

(assert (=> b!1336754 (= e!761197 tp_is_empty!36937)))

(declare-fun mapIsEmpty!57083 () Bool)

(declare-fun mapRes!57083 () Bool)

(assert (=> mapIsEmpty!57083 mapRes!57083))

(declare-fun b!1336755 () Bool)

(declare-fun e!761196 () Bool)

(assert (=> b!1336755 (= e!761196 tp_is_empty!36937)))

(declare-fun res!887150 () Bool)

(assert (=> start!112690 (=> (not res!887150) (not e!761195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112690 (= res!887150 (validMask!0 mask!1998))))

(assert (=> start!112690 e!761195))

(declare-fun e!761193 () Bool)

(declare-fun array_inv!33231 (array!90679) Bool)

(assert (=> start!112690 (and (array_inv!33231 _values!1320) e!761193)))

(assert (=> start!112690 true))

(declare-fun array_inv!33232 (array!90681) Bool)

(assert (=> start!112690 (array_inv!33232 _keys!1590)))

(assert (=> start!112690 tp!108722))

(assert (=> start!112690 tp_is_empty!36937))

(declare-fun b!1336756 () Bool)

(declare-fun res!887156 () Bool)

(assert (=> b!1336756 (=> (not res!887156) (not e!761195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90681 (_ BitVec 32)) Bool)

(assert (=> b!1336756 (= res!887156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336757 () Bool)

(declare-fun res!887149 () Bool)

(assert (=> b!1336757 (=> (not res!887149) (not e!761195))))

(assert (=> b!1336757 (= res!887149 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44358 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336758 () Bool)

(declare-fun res!887152 () Bool)

(assert (=> b!1336758 (=> (not res!887152) (not e!761195))))

(assert (=> b!1336758 (= res!887152 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336759 () Bool)

(declare-fun res!887154 () Bool)

(assert (=> b!1336759 (=> (not res!887154) (not e!761195))))

(assert (=> b!1336759 (= res!887154 (not (= (select (arr!43806 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336760 () Bool)

(declare-fun res!887157 () Bool)

(assert (=> b!1336760 (=> (not res!887157) (not e!761195))))

(assert (=> b!1336760 (= res!887157 (and (= (size!44357 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44358 _keys!1590) (size!44357 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57083 () Bool)

(declare-fun tp!108723 () Bool)

(assert (=> mapNonEmpty!57083 (= mapRes!57083 (and tp!108723 e!761196))))

(declare-fun mapKey!57083 () (_ BitVec 32))

(declare-fun mapRest!57083 () (Array (_ BitVec 32) ValueCell!17570))

(declare-fun mapValue!57083 () ValueCell!17570)

(assert (=> mapNonEmpty!57083 (= (arr!43805 _values!1320) (store mapRest!57083 mapKey!57083 mapValue!57083))))

(declare-fun b!1336761 () Bool)

(declare-fun res!887155 () Bool)

(assert (=> b!1336761 (=> (not res!887155) (not e!761195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336761 (= res!887155 (validKeyInArray!0 (select (arr!43806 _keys!1590) from!1980)))))

(declare-fun b!1336762 () Bool)

(declare-fun res!887151 () Bool)

(assert (=> b!1336762 (=> (not res!887151) (not e!761195))))

(declare-datatypes ((List!31113 0))(
  ( (Nil!31110) (Cons!31109 (h!32318 (_ BitVec 64)) (t!45413 List!31113)) )
))
(declare-fun arrayNoDuplicates!0 (array!90681 (_ BitVec 32) List!31113) Bool)

(assert (=> b!1336762 (= res!887151 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31110))))

(declare-fun b!1336763 () Bool)

(assert (=> b!1336763 (= e!761193 (and e!761197 mapRes!57083))))

(declare-fun condMapEmpty!57083 () Bool)

(declare-fun mapDefault!57083 () ValueCell!17570)

(assert (=> b!1336763 (= condMapEmpty!57083 (= (arr!43805 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17570)) mapDefault!57083)))))

(declare-fun b!1336764 () Bool)

(declare-fun res!887153 () Bool)

(assert (=> b!1336764 (=> (not res!887153) (not e!761195))))

(assert (=> b!1336764 (= res!887153 (contains!8929 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112690 res!887150) b!1336760))

(assert (= (and b!1336760 res!887157) b!1336756))

(assert (= (and b!1336756 res!887156) b!1336762))

(assert (= (and b!1336762 res!887151) b!1336757))

(assert (= (and b!1336757 res!887149) b!1336764))

(assert (= (and b!1336764 res!887153) b!1336759))

(assert (= (and b!1336759 res!887154) b!1336761))

(assert (= (and b!1336761 res!887155) b!1336758))

(assert (= (and b!1336758 res!887152) b!1336753))

(assert (= (and b!1336763 condMapEmpty!57083) mapIsEmpty!57083))

(assert (= (and b!1336763 (not condMapEmpty!57083)) mapNonEmpty!57083))

(get-info :version)

(assert (= (and mapNonEmpty!57083 ((_ is ValueCellFull!17570) mapValue!57083)) b!1336755))

(assert (= (and b!1336763 ((_ is ValueCellFull!17570) mapDefault!57083)) b!1336754))

(assert (= start!112690 b!1336763))

(declare-fun b_lambda!24175 () Bool)

(assert (=> (not b_lambda!24175) (not b!1336753)))

(declare-fun t!45411 () Bool)

(declare-fun tb!12103 () Bool)

(assert (=> (and start!112690 (= defaultEntry!1323 defaultEntry!1323) t!45411) tb!12103))

(declare-fun result!25287 () Bool)

(assert (=> tb!12103 (= result!25287 tp_is_empty!36937)))

(assert (=> b!1336753 t!45411))

(declare-fun b_and!49975 () Bool)

(assert (= b_and!49973 (and (=> t!45411 result!25287) b_and!49975)))

(declare-fun m!1224367 () Bool)

(assert (=> b!1336764 m!1224367))

(assert (=> b!1336764 m!1224367))

(declare-fun m!1224369 () Bool)

(assert (=> b!1336764 m!1224369))

(declare-fun m!1224371 () Bool)

(assert (=> b!1336753 m!1224371))

(declare-fun m!1224373 () Bool)

(assert (=> b!1336753 m!1224373))

(declare-fun m!1224375 () Bool)

(assert (=> b!1336753 m!1224375))

(declare-fun m!1224377 () Bool)

(assert (=> b!1336753 m!1224377))

(declare-fun m!1224379 () Bool)

(assert (=> b!1336753 m!1224379))

(declare-fun m!1224381 () Bool)

(assert (=> b!1336753 m!1224381))

(declare-fun m!1224383 () Bool)

(assert (=> b!1336753 m!1224383))

(declare-fun m!1224385 () Bool)

(assert (=> b!1336753 m!1224385))

(declare-fun m!1224387 () Bool)

(assert (=> b!1336753 m!1224387))

(assert (=> b!1336753 m!1224373))

(declare-fun m!1224389 () Bool)

(assert (=> b!1336753 m!1224389))

(declare-fun m!1224391 () Bool)

(assert (=> b!1336753 m!1224391))

(declare-fun m!1224393 () Bool)

(assert (=> b!1336753 m!1224393))

(assert (=> b!1336753 m!1224391))

(declare-fun m!1224395 () Bool)

(assert (=> b!1336753 m!1224395))

(assert (=> b!1336753 m!1224387))

(declare-fun m!1224397 () Bool)

(assert (=> b!1336753 m!1224397))

(assert (=> b!1336753 m!1224383))

(assert (=> b!1336753 m!1224371))

(declare-fun m!1224399 () Bool)

(assert (=> b!1336753 m!1224399))

(assert (=> b!1336759 m!1224387))

(declare-fun m!1224401 () Bool)

(assert (=> mapNonEmpty!57083 m!1224401))

(assert (=> b!1336761 m!1224387))

(assert (=> b!1336761 m!1224387))

(declare-fun m!1224403 () Bool)

(assert (=> b!1336761 m!1224403))

(declare-fun m!1224405 () Bool)

(assert (=> b!1336756 m!1224405))

(declare-fun m!1224407 () Bool)

(assert (=> start!112690 m!1224407))

(declare-fun m!1224409 () Bool)

(assert (=> start!112690 m!1224409))

(declare-fun m!1224411 () Bool)

(assert (=> start!112690 m!1224411))

(declare-fun m!1224413 () Bool)

(assert (=> b!1336762 m!1224413))

(check-sat (not b!1336753) (not b_next!31027) (not start!112690) (not b_lambda!24175) (not b!1336761) (not b!1336762) (not mapNonEmpty!57083) (not b!1336764) b_and!49975 tp_is_empty!36937 (not b!1336756))
(check-sat b_and!49975 (not b_next!31027))
(get-model)

(declare-fun b_lambda!24181 () Bool)

(assert (= b_lambda!24175 (or (and start!112690 b_free!31027) b_lambda!24181)))

(check-sat (not b!1336753) (not start!112690) (not b!1336761) (not b!1336762) (not mapNonEmpty!57083) (not b!1336764) b_and!49975 tp_is_empty!36937 (not b!1336756) (not b_next!31027) (not b_lambda!24181))
(check-sat b_and!49975 (not b_next!31027))
(get-model)

(declare-fun b!1336853 () Bool)

(declare-fun e!761239 () Bool)

(declare-fun contains!8930 (List!31113 (_ BitVec 64)) Bool)

(assert (=> b!1336853 (= e!761239 (contains!8930 Nil!31110 (select (arr!43806 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143575 () Bool)

(declare-fun res!887218 () Bool)

(declare-fun e!761238 () Bool)

(assert (=> d!143575 (=> res!887218 e!761238)))

(assert (=> d!143575 (= res!887218 (bvsge #b00000000000000000000000000000000 (size!44358 _keys!1590)))))

(assert (=> d!143575 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31110) e!761238)))

(declare-fun b!1336854 () Bool)

(declare-fun e!761237 () Bool)

(assert (=> b!1336854 (= e!761238 e!761237)))

(declare-fun res!887219 () Bool)

(assert (=> b!1336854 (=> (not res!887219) (not e!761237))))

(assert (=> b!1336854 (= res!887219 (not e!761239))))

(declare-fun res!887220 () Bool)

(assert (=> b!1336854 (=> (not res!887220) (not e!761239))))

(assert (=> b!1336854 (= res!887220 (validKeyInArray!0 (select (arr!43806 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1336855 () Bool)

(declare-fun e!761236 () Bool)

(declare-fun call!64852 () Bool)

(assert (=> b!1336855 (= e!761236 call!64852)))

(declare-fun b!1336856 () Bool)

(assert (=> b!1336856 (= e!761236 call!64852)))

(declare-fun b!1336857 () Bool)

(assert (=> b!1336857 (= e!761237 e!761236)))

(declare-fun c!125991 () Bool)

(assert (=> b!1336857 (= c!125991 (validKeyInArray!0 (select (arr!43806 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64849 () Bool)

(assert (=> bm!64849 (= call!64852 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125991 (Cons!31109 (select (arr!43806 _keys!1590) #b00000000000000000000000000000000) Nil!31110) Nil!31110)))))

(assert (= (and d!143575 (not res!887218)) b!1336854))

(assert (= (and b!1336854 res!887220) b!1336853))

(assert (= (and b!1336854 res!887219) b!1336857))

(assert (= (and b!1336857 c!125991) b!1336855))

(assert (= (and b!1336857 (not c!125991)) b!1336856))

(assert (= (or b!1336855 b!1336856) bm!64849))

(declare-fun m!1224511 () Bool)

(assert (=> b!1336853 m!1224511))

(assert (=> b!1336853 m!1224511))

(declare-fun m!1224513 () Bool)

(assert (=> b!1336853 m!1224513))

(assert (=> b!1336854 m!1224511))

(assert (=> b!1336854 m!1224511))

(declare-fun m!1224515 () Bool)

(assert (=> b!1336854 m!1224515))

(assert (=> b!1336857 m!1224511))

(assert (=> b!1336857 m!1224511))

(assert (=> b!1336857 m!1224515))

(assert (=> bm!64849 m!1224511))

(declare-fun m!1224517 () Bool)

(assert (=> bm!64849 m!1224517))

(assert (=> b!1336762 d!143575))

(declare-fun d!143577 () Bool)

(declare-fun e!761244 () Bool)

(assert (=> d!143577 e!761244))

(declare-fun res!887223 () Bool)

(assert (=> d!143577 (=> res!887223 e!761244)))

(declare-fun lt!592736 () Bool)

(assert (=> d!143577 (= res!887223 (not lt!592736))))

(declare-fun lt!592734 () Bool)

(assert (=> d!143577 (= lt!592736 lt!592734)))

(declare-fun lt!592733 () Unit!43741)

(declare-fun e!761245 () Unit!43741)

(assert (=> d!143577 (= lt!592733 e!761245)))

(declare-fun c!125994 () Bool)

(assert (=> d!143577 (= c!125994 lt!592734)))

(declare-fun containsKey!736 (List!31112 (_ BitVec 64)) Bool)

(assert (=> d!143577 (= lt!592734 (containsKey!736 (toList!10835 lt!592683) k0!1153))))

(assert (=> d!143577 (= (contains!8929 lt!592683 k0!1153) lt!592736)))

(declare-fun b!1336864 () Bool)

(declare-fun lt!592735 () Unit!43741)

(assert (=> b!1336864 (= e!761245 lt!592735)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!483 (List!31112 (_ BitVec 64)) Unit!43741)

(assert (=> b!1336864 (= lt!592735 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10835 lt!592683) k0!1153))))

(declare-datatypes ((Option!770 0))(
  ( (Some!769 (v!21185 V!54353)) (None!768) )
))
(declare-fun isDefined!526 (Option!770) Bool)

(declare-fun getValueByKey!719 (List!31112 (_ BitVec 64)) Option!770)

(assert (=> b!1336864 (isDefined!526 (getValueByKey!719 (toList!10835 lt!592683) k0!1153))))

(declare-fun b!1336865 () Bool)

(declare-fun Unit!43743 () Unit!43741)

(assert (=> b!1336865 (= e!761245 Unit!43743)))

(declare-fun b!1336866 () Bool)

(assert (=> b!1336866 (= e!761244 (isDefined!526 (getValueByKey!719 (toList!10835 lt!592683) k0!1153)))))

(assert (= (and d!143577 c!125994) b!1336864))

(assert (= (and d!143577 (not c!125994)) b!1336865))

(assert (= (and d!143577 (not res!887223)) b!1336866))

(declare-fun m!1224519 () Bool)

(assert (=> d!143577 m!1224519))

(declare-fun m!1224521 () Bool)

(assert (=> b!1336864 m!1224521))

(declare-fun m!1224523 () Bool)

(assert (=> b!1336864 m!1224523))

(assert (=> b!1336864 m!1224523))

(declare-fun m!1224525 () Bool)

(assert (=> b!1336864 m!1224525))

(assert (=> b!1336866 m!1224523))

(assert (=> b!1336866 m!1224523))

(assert (=> b!1336866 m!1224525))

(assert (=> b!1336753 d!143577))

(declare-fun d!143579 () Bool)

(assert (=> d!143579 (contains!8929 lt!592688 k0!1153)))

(declare-fun lt!592739 () Unit!43741)

(declare-fun choose!1969 ((_ BitVec 64) (_ BitVec 64) V!54353 ListLongMap!21639) Unit!43741)

(assert (=> d!143579 (= lt!592739 (choose!1969 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592688))))

(assert (=> d!143579 (contains!8929 (+!4768 lt!592688 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(assert (=> d!143579 (= (lemmaInListMapAfterAddingDiffThenInBefore!313 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592688) lt!592739)))

(declare-fun bs!38256 () Bool)

(assert (= bs!38256 d!143579))

(assert (=> bs!38256 m!1224377))

(declare-fun m!1224527 () Bool)

(assert (=> bs!38256 m!1224527))

(declare-fun m!1224529 () Bool)

(assert (=> bs!38256 m!1224529))

(assert (=> bs!38256 m!1224529))

(declare-fun m!1224531 () Bool)

(assert (=> bs!38256 m!1224531))

(assert (=> b!1336753 d!143579))

(declare-fun d!143581 () Bool)

(declare-fun e!761248 () Bool)

(assert (=> d!143581 e!761248))

(declare-fun res!887229 () Bool)

(assert (=> d!143581 (=> (not res!887229) (not e!761248))))

(declare-fun lt!592749 () ListLongMap!21639)

(assert (=> d!143581 (= res!887229 (contains!8929 lt!592749 (_1!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592750 () List!31112)

(assert (=> d!143581 (= lt!592749 (ListLongMap!21640 lt!592750))))

(declare-fun lt!592751 () Unit!43741)

(declare-fun lt!592748 () Unit!43741)

(assert (=> d!143581 (= lt!592751 lt!592748)))

(assert (=> d!143581 (= (getValueByKey!719 lt!592750 (_1!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!769 (_2!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lemmaContainsTupThenGetReturnValue!362 (List!31112 (_ BitVec 64) V!54353) Unit!43741)

(assert (=> d!143581 (= lt!592748 (lemmaContainsTupThenGetReturnValue!362 lt!592750 (_1!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun insertStrictlySorted!491 (List!31112 (_ BitVec 64) V!54353) List!31112)

(assert (=> d!143581 (= lt!592750 (insertStrictlySorted!491 (toList!10835 lt!592683) (_1!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143581 (= (+!4768 lt!592683 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592749)))

(declare-fun b!1336871 () Bool)

(declare-fun res!887228 () Bool)

(assert (=> b!1336871 (=> (not res!887228) (not e!761248))))

(assert (=> b!1336871 (= res!887228 (= (getValueByKey!719 (toList!10835 lt!592749) (_1!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!769 (_2!12002 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1336872 () Bool)

(declare-fun contains!8931 (List!31112 tuple2!23982) Bool)

(assert (=> b!1336872 (= e!761248 (contains!8931 (toList!10835 lt!592749) (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143581 res!887229) b!1336871))

(assert (= (and b!1336871 res!887228) b!1336872))

(declare-fun m!1224533 () Bool)

(assert (=> d!143581 m!1224533))

(declare-fun m!1224535 () Bool)

(assert (=> d!143581 m!1224535))

(declare-fun m!1224537 () Bool)

(assert (=> d!143581 m!1224537))

(declare-fun m!1224539 () Bool)

(assert (=> d!143581 m!1224539))

(declare-fun m!1224541 () Bool)

(assert (=> b!1336871 m!1224541))

(declare-fun m!1224543 () Bool)

(assert (=> b!1336872 m!1224543))

(assert (=> b!1336753 d!143581))

(declare-fun call!64855 () ListLongMap!21639)

(declare-fun bm!64852 () Bool)

(assert (=> bm!64852 (= call!64855 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1336897 () Bool)

(declare-fun e!761264 () ListLongMap!21639)

(assert (=> b!1336897 (= e!761264 call!64855)))

(declare-fun lt!592770 () ListLongMap!21639)

(declare-fun e!761267 () Bool)

(declare-fun b!1336898 () Bool)

(assert (=> b!1336898 (= e!761267 (= lt!592770 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1336899 () Bool)

(declare-fun e!761268 () Bool)

(declare-fun e!761269 () Bool)

(assert (=> b!1336899 (= e!761268 e!761269)))

(assert (=> b!1336899 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(declare-fun res!887239 () Bool)

(assert (=> b!1336899 (= res!887239 (contains!8929 lt!592770 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1336899 (=> (not res!887239) (not e!761269))))

(declare-fun b!1336900 () Bool)

(declare-fun e!761263 () Bool)

(assert (=> b!1336900 (= e!761263 e!761268)))

(declare-fun c!126004 () Bool)

(declare-fun e!761266 () Bool)

(assert (=> b!1336900 (= c!126004 e!761266)))

(declare-fun res!887241 () Bool)

(assert (=> b!1336900 (=> (not res!887241) (not e!761266))))

(assert (=> b!1336900 (= res!887241 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(declare-fun d!143583 () Bool)

(assert (=> d!143583 e!761263))

(declare-fun res!887238 () Bool)

(assert (=> d!143583 (=> (not res!887238) (not e!761263))))

(assert (=> d!143583 (= res!887238 (not (contains!8929 lt!592770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!761265 () ListLongMap!21639)

(assert (=> d!143583 (= lt!592770 e!761265)))

(declare-fun c!126005 () Bool)

(assert (=> d!143583 (= c!126005 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(assert (=> d!143583 (validMask!0 mask!1998)))

(assert (=> d!143583 (= (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!592770)))

(declare-fun b!1336901 () Bool)

(declare-fun lt!592767 () Unit!43741)

(declare-fun lt!592766 () Unit!43741)

(assert (=> b!1336901 (= lt!592767 lt!592766)))

(declare-fun lt!592772 () (_ BitVec 64))

(declare-fun lt!592768 () (_ BitVec 64))

(declare-fun lt!592771 () V!54353)

(declare-fun lt!592769 () ListLongMap!21639)

(assert (=> b!1336901 (not (contains!8929 (+!4768 lt!592769 (tuple2!23983 lt!592772 lt!592771)) lt!592768))))

(declare-fun addStillNotContains!485 (ListLongMap!21639 (_ BitVec 64) V!54353 (_ BitVec 64)) Unit!43741)

(assert (=> b!1336901 (= lt!592766 (addStillNotContains!485 lt!592769 lt!592772 lt!592771 lt!592768))))

(assert (=> b!1336901 (= lt!592768 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1336901 (= lt!592771 (get!22110 (select (arr!43805 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1336901 (= lt!592772 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1336901 (= lt!592769 call!64855)))

(assert (=> b!1336901 (= e!761264 (+!4768 call!64855 (tuple2!23983 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22110 (select (arr!43805 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336902 () Bool)

(assert (=> b!1336902 (= e!761268 e!761267)))

(declare-fun c!126006 () Bool)

(assert (=> b!1336902 (= c!126006 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(declare-fun b!1336903 () Bool)

(declare-fun res!887240 () Bool)

(assert (=> b!1336903 (=> (not res!887240) (not e!761263))))

(assert (=> b!1336903 (= res!887240 (not (contains!8929 lt!592770 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1336904 () Bool)

(declare-fun isEmpty!1090 (ListLongMap!21639) Bool)

(assert (=> b!1336904 (= e!761267 (isEmpty!1090 lt!592770))))

(declare-fun b!1336905 () Bool)

(assert (=> b!1336905 (= e!761265 (ListLongMap!21640 Nil!31109))))

(declare-fun b!1336906 () Bool)

(assert (=> b!1336906 (= e!761265 e!761264)))

(declare-fun c!126003 () Bool)

(assert (=> b!1336906 (= c!126003 (validKeyInArray!0 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1336907 () Bool)

(assert (=> b!1336907 (= e!761266 (validKeyInArray!0 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1336907 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1336908 () Bool)

(assert (=> b!1336908 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(assert (=> b!1336908 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44357 _values!1320)))))

(declare-fun apply!1026 (ListLongMap!21639 (_ BitVec 64)) V!54353)

(assert (=> b!1336908 (= e!761269 (= (apply!1026 lt!592770 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22110 (select (arr!43805 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!143583 c!126005) b!1336905))

(assert (= (and d!143583 (not c!126005)) b!1336906))

(assert (= (and b!1336906 c!126003) b!1336901))

(assert (= (and b!1336906 (not c!126003)) b!1336897))

(assert (= (or b!1336901 b!1336897) bm!64852))

(assert (= (and d!143583 res!887238) b!1336903))

(assert (= (and b!1336903 res!887240) b!1336900))

(assert (= (and b!1336900 res!887241) b!1336907))

(assert (= (and b!1336900 c!126004) b!1336899))

(assert (= (and b!1336900 (not c!126004)) b!1336902))

(assert (= (and b!1336899 res!887239) b!1336908))

(assert (= (and b!1336902 c!126006) b!1336898))

(assert (= (and b!1336902 (not c!126006)) b!1336904))

(declare-fun b_lambda!24183 () Bool)

(assert (=> (not b_lambda!24183) (not b!1336901)))

(assert (=> b!1336901 t!45411))

(declare-fun b_and!49985 () Bool)

(assert (= b_and!49975 (and (=> t!45411 result!25287) b_and!49985)))

(declare-fun b_lambda!24185 () Bool)

(assert (=> (not b_lambda!24185) (not b!1336908)))

(assert (=> b!1336908 t!45411))

(declare-fun b_and!49987 () Bool)

(assert (= b_and!49985 (and (=> t!45411 result!25287) b_and!49987)))

(declare-fun m!1224545 () Bool)

(assert (=> b!1336898 m!1224545))

(assert (=> bm!64852 m!1224545))

(declare-fun m!1224547 () Bool)

(assert (=> d!143583 m!1224547))

(assert (=> d!143583 m!1224407))

(declare-fun m!1224549 () Bool)

(assert (=> b!1336899 m!1224549))

(assert (=> b!1336899 m!1224549))

(declare-fun m!1224551 () Bool)

(assert (=> b!1336899 m!1224551))

(declare-fun m!1224553 () Bool)

(assert (=> b!1336904 m!1224553))

(assert (=> b!1336906 m!1224549))

(assert (=> b!1336906 m!1224549))

(declare-fun m!1224555 () Bool)

(assert (=> b!1336906 m!1224555))

(assert (=> b!1336907 m!1224549))

(assert (=> b!1336907 m!1224549))

(assert (=> b!1336907 m!1224555))

(declare-fun m!1224557 () Bool)

(assert (=> b!1336903 m!1224557))

(assert (=> b!1336908 m!1224549))

(declare-fun m!1224559 () Bool)

(assert (=> b!1336908 m!1224559))

(declare-fun m!1224561 () Bool)

(assert (=> b!1336908 m!1224561))

(assert (=> b!1336908 m!1224371))

(declare-fun m!1224563 () Bool)

(assert (=> b!1336908 m!1224563))

(assert (=> b!1336908 m!1224561))

(assert (=> b!1336908 m!1224549))

(assert (=> b!1336908 m!1224371))

(declare-fun m!1224565 () Bool)

(assert (=> b!1336901 m!1224565))

(declare-fun m!1224567 () Bool)

(assert (=> b!1336901 m!1224567))

(declare-fun m!1224569 () Bool)

(assert (=> b!1336901 m!1224569))

(assert (=> b!1336901 m!1224561))

(assert (=> b!1336901 m!1224371))

(assert (=> b!1336901 m!1224563))

(assert (=> b!1336901 m!1224569))

(declare-fun m!1224571 () Bool)

(assert (=> b!1336901 m!1224571))

(assert (=> b!1336901 m!1224561))

(assert (=> b!1336901 m!1224549))

(assert (=> b!1336901 m!1224371))

(assert (=> b!1336753 d!143583))

(declare-fun d!143585 () Bool)

(declare-fun e!761270 () Bool)

(assert (=> d!143585 e!761270))

(declare-fun res!887242 () Bool)

(assert (=> d!143585 (=> res!887242 e!761270)))

(declare-fun lt!592776 () Bool)

(assert (=> d!143585 (= res!887242 (not lt!592776))))

(declare-fun lt!592774 () Bool)

(assert (=> d!143585 (= lt!592776 lt!592774)))

(declare-fun lt!592773 () Unit!43741)

(declare-fun e!761271 () Unit!43741)

(assert (=> d!143585 (= lt!592773 e!761271)))

(declare-fun c!126007 () Bool)

(assert (=> d!143585 (= c!126007 lt!592774)))

(assert (=> d!143585 (= lt!592774 (containsKey!736 (toList!10835 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!143585 (= (contains!8929 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!592776)))

(declare-fun b!1336909 () Bool)

(declare-fun lt!592775 () Unit!43741)

(assert (=> b!1336909 (= e!761271 lt!592775)))

(assert (=> b!1336909 (= lt!592775 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10835 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> b!1336909 (isDefined!526 (getValueByKey!719 (toList!10835 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1336910 () Bool)

(declare-fun Unit!43744 () Unit!43741)

(assert (=> b!1336910 (= e!761271 Unit!43744)))

(declare-fun b!1336911 () Bool)

(assert (=> b!1336911 (= e!761270 (isDefined!526 (getValueByKey!719 (toList!10835 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143585 c!126007) b!1336909))

(assert (= (and d!143585 (not c!126007)) b!1336910))

(assert (= (and d!143585 (not res!887242)) b!1336911))

(declare-fun m!1224573 () Bool)

(assert (=> d!143585 m!1224573))

(declare-fun m!1224575 () Bool)

(assert (=> b!1336909 m!1224575))

(declare-fun m!1224577 () Bool)

(assert (=> b!1336909 m!1224577))

(assert (=> b!1336909 m!1224577))

(declare-fun m!1224579 () Bool)

(assert (=> b!1336909 m!1224579))

(assert (=> b!1336911 m!1224577))

(assert (=> b!1336911 m!1224577))

(assert (=> b!1336911 m!1224579))

(assert (=> b!1336753 d!143585))

(declare-fun b!1336954 () Bool)

(declare-fun e!761303 () Bool)

(declare-fun e!761306 () Bool)

(assert (=> b!1336954 (= e!761303 e!761306)))

(declare-fun res!887266 () Bool)

(declare-fun call!64872 () Bool)

(assert (=> b!1336954 (= res!887266 call!64872)))

(assert (=> b!1336954 (=> (not res!887266) (not e!761306))))

(declare-fun bm!64867 () Bool)

(declare-fun call!64871 () ListLongMap!21639)

(declare-fun call!64873 () ListLongMap!21639)

(assert (=> bm!64867 (= call!64871 call!64873)))

(declare-fun b!1336955 () Bool)

(assert (=> b!1336955 (= e!761303 (not call!64872))))

(declare-fun c!126024 () Bool)

(declare-fun call!64875 () ListLongMap!21639)

(declare-fun bm!64868 () Bool)

(declare-fun c!126021 () Bool)

(declare-fun call!64876 () ListLongMap!21639)

(assert (=> bm!64868 (= call!64876 (+!4768 (ite c!126021 call!64873 (ite c!126024 call!64871 call!64875)) (ite (or c!126021 c!126024) (tuple2!23983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1336956 () Bool)

(declare-fun e!761302 () Bool)

(declare-fun lt!592826 () ListLongMap!21639)

(assert (=> b!1336956 (= e!761302 (= (apply!1026 lt!592826 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun bm!64869 () Bool)

(assert (=> bm!64869 (= call!64872 (contains!8929 lt!592826 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1336957 () Bool)

(declare-fun res!887263 () Bool)

(declare-fun e!761308 () Bool)

(assert (=> b!1336957 (=> (not res!887263) (not e!761308))))

(declare-fun e!761305 () Bool)

(assert (=> b!1336957 (= res!887263 e!761305)))

(declare-fun c!126022 () Bool)

(assert (=> b!1336957 (= c!126022 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64870 () Bool)

(assert (=> bm!64870 (= call!64873 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1336958 () Bool)

(assert (=> b!1336958 (= e!761306 (= (apply!1026 lt!592826 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1336959 () Bool)

(declare-fun e!761298 () Bool)

(assert (=> b!1336959 (= e!761298 (validKeyInArray!0 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1336960 () Bool)

(declare-fun e!761301 () ListLongMap!21639)

(declare-fun call!64870 () ListLongMap!21639)

(assert (=> b!1336960 (= e!761301 call!64870)))

(declare-fun b!1336961 () Bool)

(declare-fun e!761310 () ListLongMap!21639)

(assert (=> b!1336961 (= e!761310 call!64870)))

(declare-fun bm!64871 () Bool)

(assert (=> bm!64871 (= call!64870 call!64876)))

(declare-fun bm!64872 () Bool)

(declare-fun call!64874 () Bool)

(assert (=> bm!64872 (= call!64874 (contains!8929 lt!592826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1336962 () Bool)

(declare-fun e!761300 () ListLongMap!21639)

(assert (=> b!1336962 (= e!761300 e!761310)))

(assert (=> b!1336962 (= c!126024 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!761304 () Bool)

(declare-fun b!1336963 () Bool)

(assert (=> b!1336963 (= e!761304 (= (apply!1026 lt!592826 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22110 (select (arr!43805 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1336963 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44357 _values!1320)))))

(assert (=> b!1336963 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(declare-fun b!1336964 () Bool)

(declare-fun res!887262 () Bool)

(assert (=> b!1336964 (=> (not res!887262) (not e!761308))))

(declare-fun e!761309 () Bool)

(assert (=> b!1336964 (= res!887262 e!761309)))

(declare-fun res!887265 () Bool)

(assert (=> b!1336964 (=> res!887265 e!761309)))

(assert (=> b!1336964 (= res!887265 (not e!761298))))

(declare-fun res!887269 () Bool)

(assert (=> b!1336964 (=> (not res!887269) (not e!761298))))

(assert (=> b!1336964 (= res!887269 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(declare-fun b!1336965 () Bool)

(declare-fun e!761299 () Bool)

(assert (=> b!1336965 (= e!761299 (validKeyInArray!0 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1336966 () Bool)

(assert (=> b!1336966 (= e!761305 (not call!64874))))

(declare-fun b!1336967 () Bool)

(assert (=> b!1336967 (= e!761301 call!64875)))

(declare-fun b!1336968 () Bool)

(assert (=> b!1336968 (= e!761308 e!761303)))

(declare-fun c!126025 () Bool)

(assert (=> b!1336968 (= c!126025 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336969 () Bool)

(assert (=> b!1336969 (= e!761305 e!761302)))

(declare-fun res!887264 () Bool)

(assert (=> b!1336969 (= res!887264 call!64874)))

(assert (=> b!1336969 (=> (not res!887264) (not e!761302))))

(declare-fun b!1336970 () Bool)

(declare-fun c!126023 () Bool)

(assert (=> b!1336970 (= c!126023 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1336970 (= e!761310 e!761301)))

(declare-fun b!1336971 () Bool)

(assert (=> b!1336971 (= e!761300 (+!4768 call!64876 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1336972 () Bool)

(assert (=> b!1336972 (= e!761309 e!761304)))

(declare-fun res!887268 () Bool)

(assert (=> b!1336972 (=> (not res!887268) (not e!761304))))

(assert (=> b!1336972 (= res!887268 (contains!8929 lt!592826 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1336972 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(declare-fun b!1336974 () Bool)

(declare-fun e!761307 () Unit!43741)

(declare-fun lt!592839 () Unit!43741)

(assert (=> b!1336974 (= e!761307 lt!592839)))

(declare-fun lt!592829 () ListLongMap!21639)

(assert (=> b!1336974 (= lt!592829 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!592834 () (_ BitVec 64))

(assert (=> b!1336974 (= lt!592834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592833 () (_ BitVec 64))

(assert (=> b!1336974 (= lt!592833 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!592821 () Unit!43741)

(assert (=> b!1336974 (= lt!592821 (addStillContains!1184 lt!592829 lt!592834 zeroValue!1262 lt!592833))))

(assert (=> b!1336974 (contains!8929 (+!4768 lt!592829 (tuple2!23983 lt!592834 zeroValue!1262)) lt!592833)))

(declare-fun lt!592825 () Unit!43741)

(assert (=> b!1336974 (= lt!592825 lt!592821)))

(declare-fun lt!592827 () ListLongMap!21639)

(assert (=> b!1336974 (= lt!592827 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!592828 () (_ BitVec 64))

(assert (=> b!1336974 (= lt!592828 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592824 () (_ BitVec 64))

(assert (=> b!1336974 (= lt!592824 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!592837 () Unit!43741)

(declare-fun addApplyDifferent!564 (ListLongMap!21639 (_ BitVec 64) V!54353 (_ BitVec 64)) Unit!43741)

(assert (=> b!1336974 (= lt!592837 (addApplyDifferent!564 lt!592827 lt!592828 minValue!1262 lt!592824))))

(assert (=> b!1336974 (= (apply!1026 (+!4768 lt!592827 (tuple2!23983 lt!592828 minValue!1262)) lt!592824) (apply!1026 lt!592827 lt!592824))))

(declare-fun lt!592841 () Unit!43741)

(assert (=> b!1336974 (= lt!592841 lt!592837)))

(declare-fun lt!592830 () ListLongMap!21639)

(assert (=> b!1336974 (= lt!592830 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!592832 () (_ BitVec 64))

(assert (=> b!1336974 (= lt!592832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592842 () (_ BitVec 64))

(assert (=> b!1336974 (= lt!592842 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!592822 () Unit!43741)

(assert (=> b!1336974 (= lt!592822 (addApplyDifferent!564 lt!592830 lt!592832 zeroValue!1262 lt!592842))))

(assert (=> b!1336974 (= (apply!1026 (+!4768 lt!592830 (tuple2!23983 lt!592832 zeroValue!1262)) lt!592842) (apply!1026 lt!592830 lt!592842))))

(declare-fun lt!592836 () Unit!43741)

(assert (=> b!1336974 (= lt!592836 lt!592822)))

(declare-fun lt!592831 () ListLongMap!21639)

(assert (=> b!1336974 (= lt!592831 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!592823 () (_ BitVec 64))

(assert (=> b!1336974 (= lt!592823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592838 () (_ BitVec 64))

(assert (=> b!1336974 (= lt!592838 (select (arr!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1336974 (= lt!592839 (addApplyDifferent!564 lt!592831 lt!592823 minValue!1262 lt!592838))))

(assert (=> b!1336974 (= (apply!1026 (+!4768 lt!592831 (tuple2!23983 lt!592823 minValue!1262)) lt!592838) (apply!1026 lt!592831 lt!592838))))

(declare-fun bm!64873 () Bool)

(assert (=> bm!64873 (= call!64875 call!64871)))

(declare-fun b!1336973 () Bool)

(declare-fun Unit!43745 () Unit!43741)

(assert (=> b!1336973 (= e!761307 Unit!43745)))

(declare-fun d!143587 () Bool)

(assert (=> d!143587 e!761308))

(declare-fun res!887267 () Bool)

(assert (=> d!143587 (=> (not res!887267) (not e!761308))))

(assert (=> d!143587 (= res!887267 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))))

(declare-fun lt!592840 () ListLongMap!21639)

(assert (=> d!143587 (= lt!592826 lt!592840)))

(declare-fun lt!592835 () Unit!43741)

(assert (=> d!143587 (= lt!592835 e!761307)))

(declare-fun c!126020 () Bool)

(assert (=> d!143587 (= c!126020 e!761299)))

(declare-fun res!887261 () Bool)

(assert (=> d!143587 (=> (not res!887261) (not e!761299))))

(assert (=> d!143587 (= res!887261 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44358 _keys!1590)))))

(assert (=> d!143587 (= lt!592840 e!761300)))

(assert (=> d!143587 (= c!126021 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143587 (validMask!0 mask!1998)))

(assert (=> d!143587 (= (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!592826)))

(assert (= (and d!143587 c!126021) b!1336971))

(assert (= (and d!143587 (not c!126021)) b!1336962))

(assert (= (and b!1336962 c!126024) b!1336961))

(assert (= (and b!1336962 (not c!126024)) b!1336970))

(assert (= (and b!1336970 c!126023) b!1336960))

(assert (= (and b!1336970 (not c!126023)) b!1336967))

(assert (= (or b!1336960 b!1336967) bm!64873))

(assert (= (or b!1336961 bm!64873) bm!64867))

(assert (= (or b!1336961 b!1336960) bm!64871))

(assert (= (or b!1336971 bm!64867) bm!64870))

(assert (= (or b!1336971 bm!64871) bm!64868))

(assert (= (and d!143587 res!887261) b!1336965))

(assert (= (and d!143587 c!126020) b!1336974))

(assert (= (and d!143587 (not c!126020)) b!1336973))

(assert (= (and d!143587 res!887267) b!1336964))

(assert (= (and b!1336964 res!887269) b!1336959))

(assert (= (and b!1336964 (not res!887265)) b!1336972))

(assert (= (and b!1336972 res!887268) b!1336963))

(assert (= (and b!1336964 res!887262) b!1336957))

(assert (= (and b!1336957 c!126022) b!1336969))

(assert (= (and b!1336957 (not c!126022)) b!1336966))

(assert (= (and b!1336969 res!887264) b!1336956))

(assert (= (or b!1336969 b!1336966) bm!64872))

(assert (= (and b!1336957 res!887263) b!1336968))

(assert (= (and b!1336968 c!126025) b!1336954))

(assert (= (and b!1336968 (not c!126025)) b!1336955))

(assert (= (and b!1336954 res!887266) b!1336958))

(assert (= (or b!1336954 b!1336955) bm!64869))

(declare-fun b_lambda!24187 () Bool)

(assert (=> (not b_lambda!24187) (not b!1336963)))

(assert (=> b!1336963 t!45411))

(declare-fun b_and!49989 () Bool)

(assert (= b_and!49987 (and (=> t!45411 result!25287) b_and!49989)))

(assert (=> b!1336959 m!1224549))

(assert (=> b!1336959 m!1224549))

(assert (=> b!1336959 m!1224555))

(declare-fun m!1224581 () Bool)

(assert (=> bm!64872 m!1224581))

(declare-fun m!1224583 () Bool)

(assert (=> b!1336956 m!1224583))

(assert (=> b!1336963 m!1224561))

(assert (=> b!1336963 m!1224371))

(assert (=> b!1336963 m!1224563))

(assert (=> b!1336963 m!1224549))

(assert (=> b!1336963 m!1224549))

(declare-fun m!1224585 () Bool)

(assert (=> b!1336963 m!1224585))

(assert (=> b!1336963 m!1224371))

(assert (=> b!1336963 m!1224561))

(declare-fun m!1224587 () Bool)

(assert (=> b!1336971 m!1224587))

(assert (=> b!1336972 m!1224549))

(assert (=> b!1336972 m!1224549))

(declare-fun m!1224589 () Bool)

(assert (=> b!1336972 m!1224589))

(assert (=> d!143587 m!1224407))

(declare-fun m!1224591 () Bool)

(assert (=> b!1336974 m!1224591))

(declare-fun m!1224593 () Bool)

(assert (=> b!1336974 m!1224593))

(declare-fun m!1224595 () Bool)

(assert (=> b!1336974 m!1224595))

(assert (=> b!1336974 m!1224379))

(assert (=> b!1336974 m!1224591))

(declare-fun m!1224597 () Bool)

(assert (=> b!1336974 m!1224597))

(declare-fun m!1224599 () Bool)

(assert (=> b!1336974 m!1224599))

(declare-fun m!1224601 () Bool)

(assert (=> b!1336974 m!1224601))

(declare-fun m!1224603 () Bool)

(assert (=> b!1336974 m!1224603))

(declare-fun m!1224605 () Bool)

(assert (=> b!1336974 m!1224605))

(declare-fun m!1224607 () Bool)

(assert (=> b!1336974 m!1224607))

(assert (=> b!1336974 m!1224599))

(declare-fun m!1224609 () Bool)

(assert (=> b!1336974 m!1224609))

(declare-fun m!1224611 () Bool)

(assert (=> b!1336974 m!1224611))

(assert (=> b!1336974 m!1224607))

(declare-fun m!1224613 () Bool)

(assert (=> b!1336974 m!1224613))

(declare-fun m!1224615 () Bool)

(assert (=> b!1336974 m!1224615))

(assert (=> b!1336974 m!1224603))

(declare-fun m!1224617 () Bool)

(assert (=> b!1336974 m!1224617))

(declare-fun m!1224619 () Bool)

(assert (=> b!1336974 m!1224619))

(assert (=> b!1336974 m!1224549))

(declare-fun m!1224621 () Bool)

(assert (=> b!1336958 m!1224621))

(assert (=> b!1336965 m!1224549))

(assert (=> b!1336965 m!1224549))

(assert (=> b!1336965 m!1224555))

(declare-fun m!1224623 () Bool)

(assert (=> bm!64868 m!1224623))

(assert (=> bm!64870 m!1224379))

(declare-fun m!1224625 () Bool)

(assert (=> bm!64869 m!1224625))

(assert (=> b!1336753 d!143587))

(declare-fun d!143589 () Bool)

(declare-fun e!761311 () Bool)

(assert (=> d!143589 e!761311))

(declare-fun res!887271 () Bool)

(assert (=> d!143589 (=> (not res!887271) (not e!761311))))

(declare-fun lt!592844 () ListLongMap!21639)

(assert (=> d!143589 (= res!887271 (contains!8929 lt!592844 (_1!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686))))))

(declare-fun lt!592845 () List!31112)

(assert (=> d!143589 (= lt!592844 (ListLongMap!21640 lt!592845))))

(declare-fun lt!592846 () Unit!43741)

(declare-fun lt!592843 () Unit!43741)

(assert (=> d!143589 (= lt!592846 lt!592843)))

(assert (=> d!143589 (= (getValueByKey!719 lt!592845 (_1!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686))) (Some!769 (_2!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686))))))

(assert (=> d!143589 (= lt!592843 (lemmaContainsTupThenGetReturnValue!362 lt!592845 (_1!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686)) (_2!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686))))))

(assert (=> d!143589 (= lt!592845 (insertStrictlySorted!491 (toList!10835 lt!592683) (_1!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686)) (_2!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686))))))

(assert (=> d!143589 (= (+!4768 lt!592683 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686)) lt!592844)))

(declare-fun b!1336975 () Bool)

(declare-fun res!887270 () Bool)

(assert (=> b!1336975 (=> (not res!887270) (not e!761311))))

(assert (=> b!1336975 (= res!887270 (= (getValueByKey!719 (toList!10835 lt!592844) (_1!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686))) (Some!769 (_2!12002 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686)))))))

(declare-fun b!1336976 () Bool)

(assert (=> b!1336976 (= e!761311 (contains!8931 (toList!10835 lt!592844) (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686)))))

(assert (= (and d!143589 res!887271) b!1336975))

(assert (= (and b!1336975 res!887270) b!1336976))

(declare-fun m!1224627 () Bool)

(assert (=> d!143589 m!1224627))

(declare-fun m!1224629 () Bool)

(assert (=> d!143589 m!1224629))

(declare-fun m!1224631 () Bool)

(assert (=> d!143589 m!1224631))

(declare-fun m!1224633 () Bool)

(assert (=> d!143589 m!1224633))

(declare-fun m!1224635 () Bool)

(assert (=> b!1336975 m!1224635))

(declare-fun m!1224637 () Bool)

(assert (=> b!1336976 m!1224637))

(assert (=> b!1336753 d!143589))

(declare-fun d!143591 () Bool)

(declare-fun e!761312 () Bool)

(assert (=> d!143591 e!761312))

(declare-fun res!887272 () Bool)

(assert (=> d!143591 (=> res!887272 e!761312)))

(declare-fun lt!592850 () Bool)

(assert (=> d!143591 (= res!887272 (not lt!592850))))

(declare-fun lt!592848 () Bool)

(assert (=> d!143591 (= lt!592850 lt!592848)))

(declare-fun lt!592847 () Unit!43741)

(declare-fun e!761313 () Unit!43741)

(assert (=> d!143591 (= lt!592847 e!761313)))

(declare-fun c!126026 () Bool)

(assert (=> d!143591 (= c!126026 lt!592848)))

(assert (=> d!143591 (= lt!592848 (containsKey!736 (toList!10835 lt!592688) k0!1153))))

(assert (=> d!143591 (= (contains!8929 lt!592688 k0!1153) lt!592850)))

(declare-fun b!1336977 () Bool)

(declare-fun lt!592849 () Unit!43741)

(assert (=> b!1336977 (= e!761313 lt!592849)))

(assert (=> b!1336977 (= lt!592849 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10835 lt!592688) k0!1153))))

(assert (=> b!1336977 (isDefined!526 (getValueByKey!719 (toList!10835 lt!592688) k0!1153))))

(declare-fun b!1336978 () Bool)

(declare-fun Unit!43746 () Unit!43741)

(assert (=> b!1336978 (= e!761313 Unit!43746)))

(declare-fun b!1336979 () Bool)

(assert (=> b!1336979 (= e!761312 (isDefined!526 (getValueByKey!719 (toList!10835 lt!592688) k0!1153)))))

(assert (= (and d!143591 c!126026) b!1336977))

(assert (= (and d!143591 (not c!126026)) b!1336978))

(assert (= (and d!143591 (not res!887272)) b!1336979))

(declare-fun m!1224639 () Bool)

(assert (=> d!143591 m!1224639))

(declare-fun m!1224641 () Bool)

(assert (=> b!1336977 m!1224641))

(declare-fun m!1224643 () Bool)

(assert (=> b!1336977 m!1224643))

(assert (=> b!1336977 m!1224643))

(declare-fun m!1224645 () Bool)

(assert (=> b!1336977 m!1224645))

(assert (=> b!1336979 m!1224643))

(assert (=> b!1336979 m!1224643))

(assert (=> b!1336979 m!1224645))

(assert (=> b!1336753 d!143591))

(declare-fun d!143593 () Bool)

(declare-fun e!761314 () Bool)

(assert (=> d!143593 e!761314))

(declare-fun res!887273 () Bool)

(assert (=> d!143593 (=> res!887273 e!761314)))

(declare-fun lt!592854 () Bool)

(assert (=> d!143593 (= res!887273 (not lt!592854))))

(declare-fun lt!592852 () Bool)

(assert (=> d!143593 (= lt!592854 lt!592852)))

(declare-fun lt!592851 () Unit!43741)

(declare-fun e!761315 () Unit!43741)

(assert (=> d!143593 (= lt!592851 e!761315)))

(declare-fun c!126027 () Bool)

(assert (=> d!143593 (= c!126027 lt!592852)))

(assert (=> d!143593 (= lt!592852 (containsKey!736 (toList!10835 (+!4768 lt!592683 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> d!143593 (= (contains!8929 (+!4768 lt!592683 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153) lt!592854)))

(declare-fun b!1336980 () Bool)

(declare-fun lt!592853 () Unit!43741)

(assert (=> b!1336980 (= e!761315 lt!592853)))

(assert (=> b!1336980 (= lt!592853 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10835 (+!4768 lt!592683 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> b!1336980 (isDefined!526 (getValueByKey!719 (toList!10835 (+!4768 lt!592683 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun b!1336981 () Bool)

(declare-fun Unit!43747 () Unit!43741)

(assert (=> b!1336981 (= e!761315 Unit!43747)))

(declare-fun b!1336982 () Bool)

(assert (=> b!1336982 (= e!761314 (isDefined!526 (getValueByKey!719 (toList!10835 (+!4768 lt!592683 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)))))

(assert (= (and d!143593 c!126027) b!1336980))

(assert (= (and d!143593 (not c!126027)) b!1336981))

(assert (= (and d!143593 (not res!887273)) b!1336982))

(declare-fun m!1224647 () Bool)

(assert (=> d!143593 m!1224647))

(declare-fun m!1224649 () Bool)

(assert (=> b!1336980 m!1224649))

(declare-fun m!1224651 () Bool)

(assert (=> b!1336980 m!1224651))

(assert (=> b!1336980 m!1224651))

(declare-fun m!1224653 () Bool)

(assert (=> b!1336980 m!1224653))

(assert (=> b!1336982 m!1224651))

(assert (=> b!1336982 m!1224651))

(assert (=> b!1336982 m!1224653))

(assert (=> b!1336753 d!143593))

(declare-fun d!143595 () Bool)

(assert (=> d!143595 (contains!8929 lt!592683 k0!1153)))

(declare-fun lt!592855 () Unit!43741)

(assert (=> d!143595 (= lt!592855 (choose!1969 k0!1153 (select (arr!43806 _keys!1590) from!1980) lt!592686 lt!592683))))

(assert (=> d!143595 (contains!8929 (+!4768 lt!592683 (tuple2!23983 (select (arr!43806 _keys!1590) from!1980) lt!592686)) k0!1153)))

(assert (=> d!143595 (= (lemmaInListMapAfterAddingDiffThenInBefore!313 k0!1153 (select (arr!43806 _keys!1590) from!1980) lt!592686 lt!592683) lt!592855)))

(declare-fun bs!38257 () Bool)

(assert (= bs!38257 d!143595))

(assert (=> bs!38257 m!1224389))

(assert (=> bs!38257 m!1224387))

(declare-fun m!1224655 () Bool)

(assert (=> bs!38257 m!1224655))

(assert (=> bs!38257 m!1224395))

(assert (=> bs!38257 m!1224395))

(declare-fun m!1224657 () Bool)

(assert (=> bs!38257 m!1224657))

(assert (=> b!1336753 d!143595))

(declare-fun d!143597 () Bool)

(declare-fun c!126030 () Bool)

(assert (=> d!143597 (= c!126030 ((_ is ValueCellFull!17570) (select (arr!43805 _values!1320) from!1980)))))

(declare-fun e!761318 () V!54353)

(assert (=> d!143597 (= (get!22110 (select (arr!43805 _values!1320) from!1980) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761318)))

(declare-fun b!1336987 () Bool)

(declare-fun get!22111 (ValueCell!17570 V!54353) V!54353)

(assert (=> b!1336987 (= e!761318 (get!22111 (select (arr!43805 _values!1320) from!1980) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1336988 () Bool)

(declare-fun get!22112 (ValueCell!17570 V!54353) V!54353)

(assert (=> b!1336988 (= e!761318 (get!22112 (select (arr!43805 _values!1320) from!1980) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143597 c!126030) b!1336987))

(assert (= (and d!143597 (not c!126030)) b!1336988))

(assert (=> b!1336987 m!1224383))

(assert (=> b!1336987 m!1224371))

(declare-fun m!1224659 () Bool)

(assert (=> b!1336987 m!1224659))

(assert (=> b!1336988 m!1224383))

(assert (=> b!1336988 m!1224371))

(declare-fun m!1224661 () Bool)

(assert (=> b!1336988 m!1224661))

(assert (=> b!1336753 d!143597))

(declare-fun d!143599 () Bool)

(assert (=> d!143599 (contains!8929 (+!4768 lt!592683 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-fun lt!592858 () Unit!43741)

(declare-fun choose!1970 (ListLongMap!21639 (_ BitVec 64) V!54353 (_ BitVec 64)) Unit!43741)

(assert (=> d!143599 (= lt!592858 (choose!1970 lt!592683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> d!143599 (contains!8929 lt!592683 k0!1153)))

(assert (=> d!143599 (= (addStillContains!1184 lt!592683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153) lt!592858)))

(declare-fun bs!38258 () Bool)

(assert (= bs!38258 d!143599))

(assert (=> bs!38258 m!1224391))

(assert (=> bs!38258 m!1224391))

(assert (=> bs!38258 m!1224393))

(declare-fun m!1224663 () Bool)

(assert (=> bs!38258 m!1224663))

(assert (=> bs!38258 m!1224389))

(assert (=> b!1336753 d!143599))

(declare-fun d!143601 () Bool)

(assert (=> d!143601 (= (validKeyInArray!0 (select (arr!43806 _keys!1590) from!1980)) (and (not (= (select (arr!43806 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43806 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1336761 d!143601))

(declare-fun b!1336998 () Bool)

(declare-fun e!761327 () Bool)

(declare-fun call!64879 () Bool)

(assert (=> b!1336998 (= e!761327 call!64879)))

(declare-fun bm!64876 () Bool)

(assert (=> bm!64876 (= call!64879 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1336999 () Bool)

(declare-fun e!761325 () Bool)

(assert (=> b!1336999 (= e!761325 call!64879)))

(declare-fun b!1337000 () Bool)

(declare-fun e!761326 () Bool)

(assert (=> b!1337000 (= e!761326 e!761327)))

(declare-fun c!126033 () Bool)

(assert (=> b!1337000 (= c!126033 (validKeyInArray!0 (select (arr!43806 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337001 () Bool)

(assert (=> b!1337001 (= e!761327 e!761325)))

(declare-fun lt!592867 () (_ BitVec 64))

(assert (=> b!1337001 (= lt!592867 (select (arr!43806 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!592865 () Unit!43741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90681 (_ BitVec 64) (_ BitVec 32)) Unit!43741)

(assert (=> b!1337001 (= lt!592865 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592867 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1337001 (arrayContainsKey!0 _keys!1590 lt!592867 #b00000000000000000000000000000000)))

(declare-fun lt!592866 () Unit!43741)

(assert (=> b!1337001 (= lt!592866 lt!592865)))

(declare-fun res!887278 () Bool)

(declare-datatypes ((SeekEntryResult!10047 0))(
  ( (MissingZero!10047 (index!42559 (_ BitVec 32))) (Found!10047 (index!42560 (_ BitVec 32))) (Intermediate!10047 (undefined!10859 Bool) (index!42561 (_ BitVec 32)) (x!119436 (_ BitVec 32))) (Undefined!10047) (MissingVacant!10047 (index!42562 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90681 (_ BitVec 32)) SeekEntryResult!10047)

(assert (=> b!1337001 (= res!887278 (= (seekEntryOrOpen!0 (select (arr!43806 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10047 #b00000000000000000000000000000000)))))

(assert (=> b!1337001 (=> (not res!887278) (not e!761325))))

(declare-fun d!143603 () Bool)

(declare-fun res!887279 () Bool)

(assert (=> d!143603 (=> res!887279 e!761326)))

(assert (=> d!143603 (= res!887279 (bvsge #b00000000000000000000000000000000 (size!44358 _keys!1590)))))

(assert (=> d!143603 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!761326)))

(assert (= (and d!143603 (not res!887279)) b!1337000))

(assert (= (and b!1337000 c!126033) b!1337001))

(assert (= (and b!1337000 (not c!126033)) b!1336998))

(assert (= (and b!1337001 res!887278) b!1336999))

(assert (= (or b!1336999 b!1336998) bm!64876))

(declare-fun m!1224665 () Bool)

(assert (=> bm!64876 m!1224665))

(assert (=> b!1337000 m!1224511))

(assert (=> b!1337000 m!1224511))

(assert (=> b!1337000 m!1224515))

(assert (=> b!1337001 m!1224511))

(declare-fun m!1224667 () Bool)

(assert (=> b!1337001 m!1224667))

(declare-fun m!1224669 () Bool)

(assert (=> b!1337001 m!1224669))

(assert (=> b!1337001 m!1224511))

(declare-fun m!1224671 () Bool)

(assert (=> b!1337001 m!1224671))

(assert (=> b!1336756 d!143603))

(declare-fun d!143605 () Bool)

(assert (=> d!143605 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112690 d!143605))

(declare-fun d!143607 () Bool)

(assert (=> d!143607 (= (array_inv!33231 _values!1320) (bvsge (size!44357 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112690 d!143607))

(declare-fun d!143609 () Bool)

(assert (=> d!143609 (= (array_inv!33232 _keys!1590) (bvsge (size!44358 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112690 d!143609))

(declare-fun d!143611 () Bool)

(declare-fun e!761328 () Bool)

(assert (=> d!143611 e!761328))

(declare-fun res!887280 () Bool)

(assert (=> d!143611 (=> res!887280 e!761328)))

(declare-fun lt!592871 () Bool)

(assert (=> d!143611 (= res!887280 (not lt!592871))))

(declare-fun lt!592869 () Bool)

(assert (=> d!143611 (= lt!592871 lt!592869)))

(declare-fun lt!592868 () Unit!43741)

(declare-fun e!761329 () Unit!43741)

(assert (=> d!143611 (= lt!592868 e!761329)))

(declare-fun c!126034 () Bool)

(assert (=> d!143611 (= c!126034 lt!592869)))

(assert (=> d!143611 (= lt!592869 (containsKey!736 (toList!10835 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143611 (= (contains!8929 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!592871)))

(declare-fun b!1337002 () Bool)

(declare-fun lt!592870 () Unit!43741)

(assert (=> b!1337002 (= e!761329 lt!592870)))

(assert (=> b!1337002 (= lt!592870 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10835 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1337002 (isDefined!526 (getValueByKey!719 (toList!10835 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1337003 () Bool)

(declare-fun Unit!43748 () Unit!43741)

(assert (=> b!1337003 (= e!761329 Unit!43748)))

(declare-fun b!1337004 () Bool)

(assert (=> b!1337004 (= e!761328 (isDefined!526 (getValueByKey!719 (toList!10835 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143611 c!126034) b!1337002))

(assert (= (and d!143611 (not c!126034)) b!1337003))

(assert (= (and d!143611 (not res!887280)) b!1337004))

(declare-fun m!1224673 () Bool)

(assert (=> d!143611 m!1224673))

(declare-fun m!1224675 () Bool)

(assert (=> b!1337002 m!1224675))

(declare-fun m!1224677 () Bool)

(assert (=> b!1337002 m!1224677))

(assert (=> b!1337002 m!1224677))

(declare-fun m!1224679 () Bool)

(assert (=> b!1337002 m!1224679))

(assert (=> b!1337004 m!1224677))

(assert (=> b!1337004 m!1224677))

(assert (=> b!1337004 m!1224679))

(assert (=> b!1336764 d!143611))

(declare-fun b!1337005 () Bool)

(declare-fun e!761335 () Bool)

(declare-fun e!761338 () Bool)

(assert (=> b!1337005 (= e!761335 e!761338)))

(declare-fun res!887286 () Bool)

(declare-fun call!64882 () Bool)

(assert (=> b!1337005 (= res!887286 call!64882)))

(assert (=> b!1337005 (=> (not res!887286) (not e!761338))))

(declare-fun bm!64877 () Bool)

(declare-fun call!64881 () ListLongMap!21639)

(declare-fun call!64883 () ListLongMap!21639)

(assert (=> bm!64877 (= call!64881 call!64883)))

(declare-fun b!1337006 () Bool)

(assert (=> b!1337006 (= e!761335 (not call!64882))))

(declare-fun c!126039 () Bool)

(declare-fun c!126036 () Bool)

(declare-fun call!64885 () ListLongMap!21639)

(declare-fun call!64886 () ListLongMap!21639)

(declare-fun bm!64878 () Bool)

(assert (=> bm!64878 (= call!64886 (+!4768 (ite c!126036 call!64883 (ite c!126039 call!64881 call!64885)) (ite (or c!126036 c!126039) (tuple2!23983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337007 () Bool)

(declare-fun e!761334 () Bool)

(declare-fun lt!592877 () ListLongMap!21639)

(assert (=> b!1337007 (= e!761334 (= (apply!1026 lt!592877 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun bm!64879 () Bool)

(assert (=> bm!64879 (= call!64882 (contains!8929 lt!592877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337008 () Bool)

(declare-fun res!887283 () Bool)

(declare-fun e!761340 () Bool)

(assert (=> b!1337008 (=> (not res!887283) (not e!761340))))

(declare-fun e!761337 () Bool)

(assert (=> b!1337008 (= res!887283 e!761337)))

(declare-fun c!126037 () Bool)

(assert (=> b!1337008 (= c!126037 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64880 () Bool)

(assert (=> bm!64880 (= call!64883 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1337009 () Bool)

(assert (=> b!1337009 (= e!761338 (= (apply!1026 lt!592877 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1337010 () Bool)

(declare-fun e!761330 () Bool)

(assert (=> b!1337010 (= e!761330 (validKeyInArray!0 (select (arr!43806 _keys!1590) from!1980)))))

(declare-fun b!1337011 () Bool)

(declare-fun e!761333 () ListLongMap!21639)

(declare-fun call!64880 () ListLongMap!21639)

(assert (=> b!1337011 (= e!761333 call!64880)))

(declare-fun b!1337012 () Bool)

(declare-fun e!761342 () ListLongMap!21639)

(assert (=> b!1337012 (= e!761342 call!64880)))

(declare-fun bm!64881 () Bool)

(assert (=> bm!64881 (= call!64880 call!64886)))

(declare-fun bm!64882 () Bool)

(declare-fun call!64884 () Bool)

(assert (=> bm!64882 (= call!64884 (contains!8929 lt!592877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337013 () Bool)

(declare-fun e!761332 () ListLongMap!21639)

(assert (=> b!1337013 (= e!761332 e!761342)))

(assert (=> b!1337013 (= c!126039 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337014 () Bool)

(declare-fun e!761336 () Bool)

(assert (=> b!1337014 (= e!761336 (= (apply!1026 lt!592877 (select (arr!43806 _keys!1590) from!1980)) (get!22110 (select (arr!43805 _values!1320) from!1980) (dynLambda!3698 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337014 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44357 _values!1320)))))

(assert (=> b!1337014 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44358 _keys!1590)))))

(declare-fun b!1337015 () Bool)

(declare-fun res!887282 () Bool)

(assert (=> b!1337015 (=> (not res!887282) (not e!761340))))

(declare-fun e!761341 () Bool)

(assert (=> b!1337015 (= res!887282 e!761341)))

(declare-fun res!887285 () Bool)

(assert (=> b!1337015 (=> res!887285 e!761341)))

(assert (=> b!1337015 (= res!887285 (not e!761330))))

(declare-fun res!887289 () Bool)

(assert (=> b!1337015 (=> (not res!887289) (not e!761330))))

(assert (=> b!1337015 (= res!887289 (bvslt from!1980 (size!44358 _keys!1590)))))

(declare-fun b!1337016 () Bool)

(declare-fun e!761331 () Bool)

(assert (=> b!1337016 (= e!761331 (validKeyInArray!0 (select (arr!43806 _keys!1590) from!1980)))))

(declare-fun b!1337017 () Bool)

(assert (=> b!1337017 (= e!761337 (not call!64884))))

(declare-fun b!1337018 () Bool)

(assert (=> b!1337018 (= e!761333 call!64885)))

(declare-fun b!1337019 () Bool)

(assert (=> b!1337019 (= e!761340 e!761335)))

(declare-fun c!126040 () Bool)

(assert (=> b!1337019 (= c!126040 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337020 () Bool)

(assert (=> b!1337020 (= e!761337 e!761334)))

(declare-fun res!887284 () Bool)

(assert (=> b!1337020 (= res!887284 call!64884)))

(assert (=> b!1337020 (=> (not res!887284) (not e!761334))))

(declare-fun b!1337021 () Bool)

(declare-fun c!126038 () Bool)

(assert (=> b!1337021 (= c!126038 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1337021 (= e!761342 e!761333)))

(declare-fun b!1337022 () Bool)

(assert (=> b!1337022 (= e!761332 (+!4768 call!64886 (tuple2!23983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1337023 () Bool)

(assert (=> b!1337023 (= e!761341 e!761336)))

(declare-fun res!887288 () Bool)

(assert (=> b!1337023 (=> (not res!887288) (not e!761336))))

(assert (=> b!1337023 (= res!887288 (contains!8929 lt!592877 (select (arr!43806 _keys!1590) from!1980)))))

(assert (=> b!1337023 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44358 _keys!1590)))))

(declare-fun b!1337025 () Bool)

(declare-fun e!761339 () Unit!43741)

(declare-fun lt!592890 () Unit!43741)

(assert (=> b!1337025 (= e!761339 lt!592890)))

(declare-fun lt!592880 () ListLongMap!21639)

(assert (=> b!1337025 (= lt!592880 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592885 () (_ BitVec 64))

(assert (=> b!1337025 (= lt!592885 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592884 () (_ BitVec 64))

(assert (=> b!1337025 (= lt!592884 (select (arr!43806 _keys!1590) from!1980))))

(declare-fun lt!592872 () Unit!43741)

(assert (=> b!1337025 (= lt!592872 (addStillContains!1184 lt!592880 lt!592885 zeroValue!1262 lt!592884))))

(assert (=> b!1337025 (contains!8929 (+!4768 lt!592880 (tuple2!23983 lt!592885 zeroValue!1262)) lt!592884)))

(declare-fun lt!592876 () Unit!43741)

(assert (=> b!1337025 (= lt!592876 lt!592872)))

(declare-fun lt!592878 () ListLongMap!21639)

(assert (=> b!1337025 (= lt!592878 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592879 () (_ BitVec 64))

(assert (=> b!1337025 (= lt!592879 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592875 () (_ BitVec 64))

(assert (=> b!1337025 (= lt!592875 (select (arr!43806 _keys!1590) from!1980))))

(declare-fun lt!592888 () Unit!43741)

(assert (=> b!1337025 (= lt!592888 (addApplyDifferent!564 lt!592878 lt!592879 minValue!1262 lt!592875))))

(assert (=> b!1337025 (= (apply!1026 (+!4768 lt!592878 (tuple2!23983 lt!592879 minValue!1262)) lt!592875) (apply!1026 lt!592878 lt!592875))))

(declare-fun lt!592892 () Unit!43741)

(assert (=> b!1337025 (= lt!592892 lt!592888)))

(declare-fun lt!592881 () ListLongMap!21639)

(assert (=> b!1337025 (= lt!592881 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592883 () (_ BitVec 64))

(assert (=> b!1337025 (= lt!592883 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592893 () (_ BitVec 64))

(assert (=> b!1337025 (= lt!592893 (select (arr!43806 _keys!1590) from!1980))))

(declare-fun lt!592873 () Unit!43741)

(assert (=> b!1337025 (= lt!592873 (addApplyDifferent!564 lt!592881 lt!592883 zeroValue!1262 lt!592893))))

(assert (=> b!1337025 (= (apply!1026 (+!4768 lt!592881 (tuple2!23983 lt!592883 zeroValue!1262)) lt!592893) (apply!1026 lt!592881 lt!592893))))

(declare-fun lt!592887 () Unit!43741)

(assert (=> b!1337025 (= lt!592887 lt!592873)))

(declare-fun lt!592882 () ListLongMap!21639)

(assert (=> b!1337025 (= lt!592882 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592874 () (_ BitVec 64))

(assert (=> b!1337025 (= lt!592874 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592889 () (_ BitVec 64))

(assert (=> b!1337025 (= lt!592889 (select (arr!43806 _keys!1590) from!1980))))

(assert (=> b!1337025 (= lt!592890 (addApplyDifferent!564 lt!592882 lt!592874 minValue!1262 lt!592889))))

(assert (=> b!1337025 (= (apply!1026 (+!4768 lt!592882 (tuple2!23983 lt!592874 minValue!1262)) lt!592889) (apply!1026 lt!592882 lt!592889))))

(declare-fun bm!64883 () Bool)

(assert (=> bm!64883 (= call!64885 call!64881)))

(declare-fun b!1337024 () Bool)

(declare-fun Unit!43749 () Unit!43741)

(assert (=> b!1337024 (= e!761339 Unit!43749)))

(declare-fun d!143613 () Bool)

(assert (=> d!143613 e!761340))

(declare-fun res!887287 () Bool)

(assert (=> d!143613 (=> (not res!887287) (not e!761340))))

(assert (=> d!143613 (= res!887287 (or (bvsge from!1980 (size!44358 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44358 _keys!1590)))))))

(declare-fun lt!592891 () ListLongMap!21639)

(assert (=> d!143613 (= lt!592877 lt!592891)))

(declare-fun lt!592886 () Unit!43741)

(assert (=> d!143613 (= lt!592886 e!761339)))

(declare-fun c!126035 () Bool)

(assert (=> d!143613 (= c!126035 e!761331)))

(declare-fun res!887281 () Bool)

(assert (=> d!143613 (=> (not res!887281) (not e!761331))))

(assert (=> d!143613 (= res!887281 (bvslt from!1980 (size!44358 _keys!1590)))))

(assert (=> d!143613 (= lt!592891 e!761332)))

(assert (=> d!143613 (= c!126036 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143613 (validMask!0 mask!1998)))

(assert (=> d!143613 (= (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!592877)))

(assert (= (and d!143613 c!126036) b!1337022))

(assert (= (and d!143613 (not c!126036)) b!1337013))

(assert (= (and b!1337013 c!126039) b!1337012))

(assert (= (and b!1337013 (not c!126039)) b!1337021))

(assert (= (and b!1337021 c!126038) b!1337011))

(assert (= (and b!1337021 (not c!126038)) b!1337018))

(assert (= (or b!1337011 b!1337018) bm!64883))

(assert (= (or b!1337012 bm!64883) bm!64877))

(assert (= (or b!1337012 b!1337011) bm!64881))

(assert (= (or b!1337022 bm!64877) bm!64880))

(assert (= (or b!1337022 bm!64881) bm!64878))

(assert (= (and d!143613 res!887281) b!1337016))

(assert (= (and d!143613 c!126035) b!1337025))

(assert (= (and d!143613 (not c!126035)) b!1337024))

(assert (= (and d!143613 res!887287) b!1337015))

(assert (= (and b!1337015 res!887289) b!1337010))

(assert (= (and b!1337015 (not res!887285)) b!1337023))

(assert (= (and b!1337023 res!887288) b!1337014))

(assert (= (and b!1337015 res!887282) b!1337008))

(assert (= (and b!1337008 c!126037) b!1337020))

(assert (= (and b!1337008 (not c!126037)) b!1337017))

(assert (= (and b!1337020 res!887284) b!1337007))

(assert (= (or b!1337020 b!1337017) bm!64882))

(assert (= (and b!1337008 res!887283) b!1337019))

(assert (= (and b!1337019 c!126040) b!1337005))

(assert (= (and b!1337019 (not c!126040)) b!1337006))

(assert (= (and b!1337005 res!887286) b!1337009))

(assert (= (or b!1337005 b!1337006) bm!64879))

(declare-fun b_lambda!24189 () Bool)

(assert (=> (not b_lambda!24189) (not b!1337014)))

(assert (=> b!1337014 t!45411))

(declare-fun b_and!49991 () Bool)

(assert (= b_and!49989 (and (=> t!45411 result!25287) b_and!49991)))

(assert (=> b!1337010 m!1224387))

(assert (=> b!1337010 m!1224387))

(assert (=> b!1337010 m!1224403))

(declare-fun m!1224681 () Bool)

(assert (=> bm!64882 m!1224681))

(declare-fun m!1224683 () Bool)

(assert (=> b!1337007 m!1224683))

(assert (=> b!1337014 m!1224383))

(assert (=> b!1337014 m!1224371))

(assert (=> b!1337014 m!1224399))

(assert (=> b!1337014 m!1224387))

(assert (=> b!1337014 m!1224387))

(declare-fun m!1224685 () Bool)

(assert (=> b!1337014 m!1224685))

(assert (=> b!1337014 m!1224371))

(assert (=> b!1337014 m!1224383))

(declare-fun m!1224687 () Bool)

(assert (=> b!1337022 m!1224687))

(assert (=> b!1337023 m!1224387))

(assert (=> b!1337023 m!1224387))

(declare-fun m!1224689 () Bool)

(assert (=> b!1337023 m!1224689))

(assert (=> d!143613 m!1224407))

(declare-fun m!1224691 () Bool)

(assert (=> b!1337025 m!1224691))

(declare-fun m!1224693 () Bool)

(assert (=> b!1337025 m!1224693))

(declare-fun m!1224695 () Bool)

(assert (=> b!1337025 m!1224695))

(declare-fun m!1224697 () Bool)

(assert (=> b!1337025 m!1224697))

(assert (=> b!1337025 m!1224691))

(declare-fun m!1224699 () Bool)

(assert (=> b!1337025 m!1224699))

(declare-fun m!1224701 () Bool)

(assert (=> b!1337025 m!1224701))

(declare-fun m!1224703 () Bool)

(assert (=> b!1337025 m!1224703))

(declare-fun m!1224705 () Bool)

(assert (=> b!1337025 m!1224705))

(declare-fun m!1224707 () Bool)

(assert (=> b!1337025 m!1224707))

(declare-fun m!1224709 () Bool)

(assert (=> b!1337025 m!1224709))

(assert (=> b!1337025 m!1224701))

(declare-fun m!1224711 () Bool)

(assert (=> b!1337025 m!1224711))

(declare-fun m!1224713 () Bool)

(assert (=> b!1337025 m!1224713))

(assert (=> b!1337025 m!1224709))

(declare-fun m!1224715 () Bool)

(assert (=> b!1337025 m!1224715))

(declare-fun m!1224717 () Bool)

(assert (=> b!1337025 m!1224717))

(assert (=> b!1337025 m!1224705))

(declare-fun m!1224719 () Bool)

(assert (=> b!1337025 m!1224719))

(declare-fun m!1224721 () Bool)

(assert (=> b!1337025 m!1224721))

(assert (=> b!1337025 m!1224387))

(declare-fun m!1224723 () Bool)

(assert (=> b!1337009 m!1224723))

(assert (=> b!1337016 m!1224387))

(assert (=> b!1337016 m!1224387))

(assert (=> b!1337016 m!1224403))

(declare-fun m!1224725 () Bool)

(assert (=> bm!64878 m!1224725))

(assert (=> bm!64880 m!1224697))

(declare-fun m!1224727 () Bool)

(assert (=> bm!64879 m!1224727))

(assert (=> b!1336764 d!143613))

(declare-fun mapNonEmpty!57092 () Bool)

(declare-fun mapRes!57092 () Bool)

(declare-fun tp!108738 () Bool)

(declare-fun e!761348 () Bool)

(assert (=> mapNonEmpty!57092 (= mapRes!57092 (and tp!108738 e!761348))))

(declare-fun mapKey!57092 () (_ BitVec 32))

(declare-fun mapValue!57092 () ValueCell!17570)

(declare-fun mapRest!57092 () (Array (_ BitVec 32) ValueCell!17570))

(assert (=> mapNonEmpty!57092 (= mapRest!57083 (store mapRest!57092 mapKey!57092 mapValue!57092))))

(declare-fun b!1337033 () Bool)

(declare-fun e!761347 () Bool)

(assert (=> b!1337033 (= e!761347 tp_is_empty!36937)))

(declare-fun condMapEmpty!57092 () Bool)

(declare-fun mapDefault!57092 () ValueCell!17570)

(assert (=> mapNonEmpty!57083 (= condMapEmpty!57092 (= mapRest!57083 ((as const (Array (_ BitVec 32) ValueCell!17570)) mapDefault!57092)))))

(assert (=> mapNonEmpty!57083 (= tp!108723 (and e!761347 mapRes!57092))))

(declare-fun b!1337032 () Bool)

(assert (=> b!1337032 (= e!761348 tp_is_empty!36937)))

(declare-fun mapIsEmpty!57092 () Bool)

(assert (=> mapIsEmpty!57092 mapRes!57092))

(assert (= (and mapNonEmpty!57083 condMapEmpty!57092) mapIsEmpty!57092))

(assert (= (and mapNonEmpty!57083 (not condMapEmpty!57092)) mapNonEmpty!57092))

(assert (= (and mapNonEmpty!57092 ((_ is ValueCellFull!17570) mapValue!57092)) b!1337032))

(assert (= (and mapNonEmpty!57083 ((_ is ValueCellFull!17570) mapDefault!57092)) b!1337033))

(declare-fun m!1224729 () Bool)

(assert (=> mapNonEmpty!57092 m!1224729))

(declare-fun b_lambda!24191 () Bool)

(assert (= b_lambda!24187 (or (and start!112690 b_free!31027) b_lambda!24191)))

(declare-fun b_lambda!24193 () Bool)

(assert (= b_lambda!24183 (or (and start!112690 b_free!31027) b_lambda!24193)))

(declare-fun b_lambda!24195 () Bool)

(assert (= b_lambda!24189 (or (and start!112690 b_free!31027) b_lambda!24195)))

(declare-fun b_lambda!24197 () Bool)

(assert (= b_lambda!24185 (or (and start!112690 b_free!31027) b_lambda!24197)))

(check-sat (not b!1336972) (not bm!64870) (not bm!64882) (not bm!64869) (not b_lambda!24195) (not b!1336971) (not b!1336872) (not d!143577) (not bm!64868) (not b!1337004) (not b_lambda!24193) (not d!143613) (not b!1336988) (not b!1337000) (not b!1336976) (not d!143611) (not b!1336982) (not d!143585) (not b!1336871) (not b!1336974) (not d!143587) (not b!1336904) (not b_next!31027) (not b_lambda!24181) (not b!1336908) (not b!1336866) (not b!1336911) (not b!1336965) (not b!1336963) (not b!1337023) (not b!1337010) (not b_lambda!24191) (not b!1336906) (not b!1336956) (not b!1336980) b_and!49991 (not b!1336854) (not b!1337007) (not bm!64872) (not d!143581) (not d!143583) (not d!143593) (not d!143591) (not b!1336909) (not mapNonEmpty!57092) (not b!1336899) (not bm!64880) (not bm!64879) (not b!1337009) (not d!143589) (not b!1336987) (not b!1336903) (not b!1337001) (not b!1337016) (not b!1336907) (not b!1336864) (not d!143595) (not b!1336959) (not d!143579) (not b!1336979) (not bm!64852) (not b_lambda!24197) (not b!1337014) (not b!1336857) (not b!1337025) (not b!1336853) (not bm!64849) tp_is_empty!36937 (not bm!64878) (not b!1336958) (not b!1337022) (not b!1336898) (not b!1336975) (not b!1337002) (not b!1336901) (not d!143599) (not bm!64876) (not b!1336977))
(check-sat b_and!49991 (not b_next!31027))
