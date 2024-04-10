; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109994 () Bool)

(assert start!109994)

(declare-fun b_free!29241 () Bool)

(declare-fun b_next!29241 () Bool)

(assert (=> start!109994 (= b_free!29241 (not b_next!29241))))

(declare-fun tp!102868 () Bool)

(declare-fun b_and!47393 () Bool)

(assert (=> start!109994 (= tp!102868 b_and!47393)))

(declare-fun mapNonEmpty!53908 () Bool)

(declare-fun mapRes!53908 () Bool)

(declare-fun tp!102867 () Bool)

(declare-fun e!743072 () Bool)

(assert (=> mapNonEmpty!53908 (= mapRes!53908 (and tp!102867 e!743072))))

(declare-datatypes ((V!51611 0))(
  ( (V!51612 (val!17515 Int)) )
))
(declare-datatypes ((ValueCell!16542 0))(
  ( (ValueCellFull!16542 (v!20129 V!51611)) (EmptyCell!16542) )
))
(declare-fun mapValue!53908 () ValueCell!16542)

(declare-fun mapRest!53908 () (Array (_ BitVec 32) ValueCell!16542))

(declare-datatypes ((array!86774 0))(
  ( (array!86775 (arr!41880 (Array (_ BitVec 32) ValueCell!16542)) (size!42430 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86774)

(declare-fun mapKey!53908 () (_ BitVec 32))

(assert (=> mapNonEmpty!53908 (= (arr!41880 _values!1445) (store mapRest!53908 mapKey!53908 mapValue!53908))))

(declare-fun b!1302742 () Bool)

(declare-fun res!865302 () Bool)

(declare-fun e!743076 () Bool)

(assert (=> b!1302742 (=> (not res!865302) (not e!743076))))

(declare-datatypes ((array!86776 0))(
  ( (array!86777 (arr!41881 (Array (_ BitVec 32) (_ BitVec 64))) (size!42431 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86776)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302742 (= res!865302 (not (validKeyInArray!0 (select (arr!41881 _keys!1741) from!2144))))))

(declare-fun b!1302743 () Bool)

(declare-fun res!865305 () Bool)

(assert (=> b!1302743 (=> (not res!865305) (not e!743076))))

(declare-datatypes ((List!29725 0))(
  ( (Nil!29722) (Cons!29721 (h!30930 (_ BitVec 64)) (t!43315 List!29725)) )
))
(declare-fun arrayNoDuplicates!0 (array!86776 (_ BitVec 32) List!29725) Bool)

(assert (=> b!1302743 (= res!865305 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29722))))

(declare-fun mapIsEmpty!53908 () Bool)

(assert (=> mapIsEmpty!53908 mapRes!53908))

(declare-fun b!1302744 () Bool)

(declare-fun e!743077 () Bool)

(assert (=> b!1302744 (= e!743076 (not e!743077))))

(declare-fun res!865303 () Bool)

(assert (=> b!1302744 (=> res!865303 e!743077)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1302744 (= res!865303 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22598 0))(
  ( (tuple2!22599 (_1!11310 (_ BitVec 64)) (_2!11310 V!51611)) )
))
(declare-datatypes ((List!29726 0))(
  ( (Nil!29723) (Cons!29722 (h!30931 tuple2!22598) (t!43316 List!29726)) )
))
(declare-datatypes ((ListLongMap!20255 0))(
  ( (ListLongMap!20256 (toList!10143 List!29726)) )
))
(declare-fun contains!8275 (ListLongMap!20255 (_ BitVec 64)) Bool)

(assert (=> b!1302744 (not (contains!8275 (ListLongMap!20256 Nil!29723) k0!1205))))

(declare-datatypes ((Unit!43129 0))(
  ( (Unit!43130) )
))
(declare-fun lt!582822 () Unit!43129)

(declare-fun emptyContainsNothing!209 ((_ BitVec 64)) Unit!43129)

(assert (=> b!1302744 (= lt!582822 (emptyContainsNothing!209 k0!1205))))

(declare-fun b!1302745 () Bool)

(declare-fun res!865309 () Bool)

(assert (=> b!1302745 (=> (not res!865309) (not e!743076))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86776 (_ BitVec 32)) Bool)

(assert (=> b!1302745 (= res!865309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302746 () Bool)

(declare-fun res!865304 () Bool)

(assert (=> b!1302746 (=> (not res!865304) (not e!743076))))

(declare-fun minValue!1387 () V!51611)

(declare-fun zeroValue!1387 () V!51611)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5167 (array!86776 array!86774 (_ BitVec 32) (_ BitVec 32) V!51611 V!51611 (_ BitVec 32) Int) ListLongMap!20255)

(assert (=> b!1302746 (= res!865304 (contains!8275 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302747 () Bool)

(declare-fun e!743074 () Bool)

(declare-fun e!743073 () Bool)

(assert (=> b!1302747 (= e!743074 (and e!743073 mapRes!53908))))

(declare-fun condMapEmpty!53908 () Bool)

(declare-fun mapDefault!53908 () ValueCell!16542)

(assert (=> b!1302747 (= condMapEmpty!53908 (= (arr!41880 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16542)) mapDefault!53908)))))

(declare-fun b!1302748 () Bool)

(declare-fun e!743078 () Bool)

(assert (=> b!1302748 (= e!743077 e!743078)))

(declare-fun res!865310 () Bool)

(assert (=> b!1302748 (=> (not res!865310) (not e!743078))))

(declare-fun lt!582823 () ListLongMap!20255)

(assert (=> b!1302748 (= res!865310 (not (contains!8275 lt!582823 k0!1205)))))

(declare-fun +!4469 (ListLongMap!20255 tuple2!22598) ListLongMap!20255)

(assert (=> b!1302748 (not (contains!8275 (+!4469 lt!582823 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!582824 () Unit!43129)

(declare-fun addStillNotContains!466 (ListLongMap!20255 (_ BitVec 64) V!51611 (_ BitVec 64)) Unit!43129)

(assert (=> b!1302748 (= lt!582824 (addStillNotContains!466 lt!582823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6102 (array!86776 array!86774 (_ BitVec 32) (_ BitVec 32) V!51611 V!51611 (_ BitVec 32) Int) ListLongMap!20255)

(assert (=> b!1302748 (= lt!582823 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302749 () Bool)

(declare-fun res!865306 () Bool)

(assert (=> b!1302749 (=> (not res!865306) (not e!743076))))

(assert (=> b!1302749 (= res!865306 (and (= (size!42430 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42431 _keys!1741) (size!42430 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302750 () Bool)

(declare-fun tp_is_empty!34881 () Bool)

(assert (=> b!1302750 (= e!743072 tp_is_empty!34881)))

(declare-fun res!865311 () Bool)

(assert (=> start!109994 (=> (not res!865311) (not e!743076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109994 (= res!865311 (validMask!0 mask!2175))))

(assert (=> start!109994 e!743076))

(assert (=> start!109994 tp_is_empty!34881))

(assert (=> start!109994 true))

(declare-fun array_inv!31679 (array!86774) Bool)

(assert (=> start!109994 (and (array_inv!31679 _values!1445) e!743074)))

(declare-fun array_inv!31680 (array!86776) Bool)

(assert (=> start!109994 (array_inv!31680 _keys!1741)))

(assert (=> start!109994 tp!102868))

(declare-fun b!1302751 () Bool)

(assert (=> b!1302751 (= e!743078 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1302752 () Bool)

(declare-fun res!865308 () Bool)

(assert (=> b!1302752 (=> (not res!865308) (not e!743076))))

(assert (=> b!1302752 (= res!865308 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42431 _keys!1741))))))

(declare-fun b!1302753 () Bool)

(declare-fun res!865307 () Bool)

(assert (=> b!1302753 (=> (not res!865307) (not e!743076))))

(assert (=> b!1302753 (= res!865307 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42431 _keys!1741))))))

(declare-fun b!1302754 () Bool)

(assert (=> b!1302754 (= e!743073 tp_is_empty!34881)))

(assert (= (and start!109994 res!865311) b!1302749))

(assert (= (and b!1302749 res!865306) b!1302745))

(assert (= (and b!1302745 res!865309) b!1302743))

(assert (= (and b!1302743 res!865305) b!1302752))

(assert (= (and b!1302752 res!865308) b!1302746))

(assert (= (and b!1302746 res!865304) b!1302753))

(assert (= (and b!1302753 res!865307) b!1302742))

(assert (= (and b!1302742 res!865302) b!1302744))

(assert (= (and b!1302744 (not res!865303)) b!1302748))

(assert (= (and b!1302748 res!865310) b!1302751))

(assert (= (and b!1302747 condMapEmpty!53908) mapIsEmpty!53908))

(assert (= (and b!1302747 (not condMapEmpty!53908)) mapNonEmpty!53908))

(get-info :version)

(assert (= (and mapNonEmpty!53908 ((_ is ValueCellFull!16542) mapValue!53908)) b!1302750))

(assert (= (and b!1302747 ((_ is ValueCellFull!16542) mapDefault!53908)) b!1302754))

(assert (= start!109994 b!1302747))

(declare-fun m!1193633 () Bool)

(assert (=> start!109994 m!1193633))

(declare-fun m!1193635 () Bool)

(assert (=> start!109994 m!1193635))

(declare-fun m!1193637 () Bool)

(assert (=> start!109994 m!1193637))

(declare-fun m!1193639 () Bool)

(assert (=> b!1302746 m!1193639))

(assert (=> b!1302746 m!1193639))

(declare-fun m!1193641 () Bool)

(assert (=> b!1302746 m!1193641))

(declare-fun m!1193643 () Bool)

(assert (=> b!1302744 m!1193643))

(declare-fun m!1193645 () Bool)

(assert (=> b!1302744 m!1193645))

(declare-fun m!1193647 () Bool)

(assert (=> b!1302745 m!1193647))

(declare-fun m!1193649 () Bool)

(assert (=> mapNonEmpty!53908 m!1193649))

(declare-fun m!1193651 () Bool)

(assert (=> b!1302742 m!1193651))

(assert (=> b!1302742 m!1193651))

(declare-fun m!1193653 () Bool)

(assert (=> b!1302742 m!1193653))

(declare-fun m!1193655 () Bool)

(assert (=> b!1302748 m!1193655))

(declare-fun m!1193657 () Bool)

(assert (=> b!1302748 m!1193657))

(declare-fun m!1193659 () Bool)

(assert (=> b!1302748 m!1193659))

(assert (=> b!1302748 m!1193655))

(declare-fun m!1193661 () Bool)

(assert (=> b!1302748 m!1193661))

(declare-fun m!1193663 () Bool)

(assert (=> b!1302748 m!1193663))

(declare-fun m!1193665 () Bool)

(assert (=> b!1302743 m!1193665))

(check-sat (not start!109994) (not b_next!29241) (not b!1302742) (not b!1302744) (not b!1302748) tp_is_empty!34881 (not b!1302746) (not mapNonEmpty!53908) (not b!1302743) b_and!47393 (not b!1302745))
(check-sat b_and!47393 (not b_next!29241))
(get-model)

(declare-fun d!141571 () Bool)

(declare-fun e!743104 () Bool)

(assert (=> d!141571 e!743104))

(declare-fun res!865344 () Bool)

(assert (=> d!141571 (=> res!865344 e!743104)))

(declare-fun lt!582845 () Bool)

(assert (=> d!141571 (= res!865344 (not lt!582845))))

(declare-fun lt!582844 () Bool)

(assert (=> d!141571 (= lt!582845 lt!582844)))

(declare-fun lt!582843 () Unit!43129)

(declare-fun e!743105 () Unit!43129)

(assert (=> d!141571 (= lt!582843 e!743105)))

(declare-fun c!125022 () Bool)

(assert (=> d!141571 (= c!125022 lt!582844)))

(declare-fun containsKey!725 (List!29726 (_ BitVec 64)) Bool)

(assert (=> d!141571 (= lt!582844 (containsKey!725 (toList!10143 (ListLongMap!20256 Nil!29723)) k0!1205))))

(assert (=> d!141571 (= (contains!8275 (ListLongMap!20256 Nil!29723) k0!1205) lt!582845)))

(declare-fun b!1302800 () Bool)

(declare-fun lt!582842 () Unit!43129)

(assert (=> b!1302800 (= e!743105 lt!582842)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!471 (List!29726 (_ BitVec 64)) Unit!43129)

(assert (=> b!1302800 (= lt!582842 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10143 (ListLongMap!20256 Nil!29723)) k0!1205))))

(declare-datatypes ((Option!755 0))(
  ( (Some!754 (v!20131 V!51611)) (None!753) )
))
(declare-fun isDefined!510 (Option!755) Bool)

(declare-fun getValueByKey!703 (List!29726 (_ BitVec 64)) Option!755)

(assert (=> b!1302800 (isDefined!510 (getValueByKey!703 (toList!10143 (ListLongMap!20256 Nil!29723)) k0!1205))))

(declare-fun b!1302801 () Bool)

(declare-fun Unit!43133 () Unit!43129)

(assert (=> b!1302801 (= e!743105 Unit!43133)))

(declare-fun b!1302802 () Bool)

(assert (=> b!1302802 (= e!743104 (isDefined!510 (getValueByKey!703 (toList!10143 (ListLongMap!20256 Nil!29723)) k0!1205)))))

(assert (= (and d!141571 c!125022) b!1302800))

(assert (= (and d!141571 (not c!125022)) b!1302801))

(assert (= (and d!141571 (not res!865344)) b!1302802))

(declare-fun m!1193701 () Bool)

(assert (=> d!141571 m!1193701))

(declare-fun m!1193703 () Bool)

(assert (=> b!1302800 m!1193703))

(declare-fun m!1193705 () Bool)

(assert (=> b!1302800 m!1193705))

(assert (=> b!1302800 m!1193705))

(declare-fun m!1193707 () Bool)

(assert (=> b!1302800 m!1193707))

(assert (=> b!1302802 m!1193705))

(assert (=> b!1302802 m!1193705))

(assert (=> b!1302802 m!1193707))

(assert (=> b!1302744 d!141571))

(declare-fun d!141573 () Bool)

(assert (=> d!141573 (not (contains!8275 (ListLongMap!20256 Nil!29723) k0!1205))))

(declare-fun lt!582848 () Unit!43129)

(declare-fun choose!1917 ((_ BitVec 64)) Unit!43129)

(assert (=> d!141573 (= lt!582848 (choose!1917 k0!1205))))

(assert (=> d!141573 (= (emptyContainsNothing!209 k0!1205) lt!582848)))

(declare-fun bs!37107 () Bool)

(assert (= bs!37107 d!141573))

(assert (=> bs!37107 m!1193643))

(declare-fun m!1193709 () Bool)

(assert (=> bs!37107 m!1193709))

(assert (=> b!1302744 d!141573))

(declare-fun b!1302813 () Bool)

(declare-fun e!743114 () Bool)

(declare-fun contains!8277 (List!29725 (_ BitVec 64)) Bool)

(assert (=> b!1302813 (= e!743114 (contains!8277 Nil!29722 (select (arr!41881 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141575 () Bool)

(declare-fun res!865352 () Bool)

(declare-fun e!743115 () Bool)

(assert (=> d!141575 (=> res!865352 e!743115)))

(assert (=> d!141575 (= res!865352 (bvsge #b00000000000000000000000000000000 (size!42431 _keys!1741)))))

(assert (=> d!141575 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29722) e!743115)))

(declare-fun b!1302814 () Bool)

(declare-fun e!743116 () Bool)

(assert (=> b!1302814 (= e!743115 e!743116)))

(declare-fun res!865351 () Bool)

(assert (=> b!1302814 (=> (not res!865351) (not e!743116))))

(assert (=> b!1302814 (= res!865351 (not e!743114))))

(declare-fun res!865353 () Bool)

(assert (=> b!1302814 (=> (not res!865353) (not e!743114))))

(assert (=> b!1302814 (= res!865353 (validKeyInArray!0 (select (arr!41881 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302815 () Bool)

(declare-fun e!743117 () Bool)

(assert (=> b!1302815 (= e!743116 e!743117)))

(declare-fun c!125025 () Bool)

(assert (=> b!1302815 (= c!125025 (validKeyInArray!0 (select (arr!41881 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64146 () Bool)

(declare-fun call!64149 () Bool)

(assert (=> bm!64146 (= call!64149 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125025 (Cons!29721 (select (arr!41881 _keys!1741) #b00000000000000000000000000000000) Nil!29722) Nil!29722)))))

(declare-fun b!1302816 () Bool)

(assert (=> b!1302816 (= e!743117 call!64149)))

(declare-fun b!1302817 () Bool)

(assert (=> b!1302817 (= e!743117 call!64149)))

(assert (= (and d!141575 (not res!865352)) b!1302814))

(assert (= (and b!1302814 res!865353) b!1302813))

(assert (= (and b!1302814 res!865351) b!1302815))

(assert (= (and b!1302815 c!125025) b!1302817))

(assert (= (and b!1302815 (not c!125025)) b!1302816))

(assert (= (or b!1302817 b!1302816) bm!64146))

(declare-fun m!1193711 () Bool)

(assert (=> b!1302813 m!1193711))

(assert (=> b!1302813 m!1193711))

(declare-fun m!1193713 () Bool)

(assert (=> b!1302813 m!1193713))

(assert (=> b!1302814 m!1193711))

(assert (=> b!1302814 m!1193711))

(declare-fun m!1193715 () Bool)

(assert (=> b!1302814 m!1193715))

(assert (=> b!1302815 m!1193711))

(assert (=> b!1302815 m!1193711))

(assert (=> b!1302815 m!1193715))

(assert (=> bm!64146 m!1193711))

(declare-fun m!1193717 () Bool)

(assert (=> bm!64146 m!1193717))

(assert (=> b!1302743 d!141575))

(declare-fun d!141577 () Bool)

(declare-fun e!743118 () Bool)

(assert (=> d!141577 e!743118))

(declare-fun res!865354 () Bool)

(assert (=> d!141577 (=> res!865354 e!743118)))

(declare-fun lt!582852 () Bool)

(assert (=> d!141577 (= res!865354 (not lt!582852))))

(declare-fun lt!582851 () Bool)

(assert (=> d!141577 (= lt!582852 lt!582851)))

(declare-fun lt!582850 () Unit!43129)

(declare-fun e!743119 () Unit!43129)

(assert (=> d!141577 (= lt!582850 e!743119)))

(declare-fun c!125026 () Bool)

(assert (=> d!141577 (= c!125026 lt!582851)))

(assert (=> d!141577 (= lt!582851 (containsKey!725 (toList!10143 (+!4469 lt!582823 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141577 (= (contains!8275 (+!4469 lt!582823 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!582852)))

(declare-fun b!1302818 () Bool)

(declare-fun lt!582849 () Unit!43129)

(assert (=> b!1302818 (= e!743119 lt!582849)))

(assert (=> b!1302818 (= lt!582849 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10143 (+!4469 lt!582823 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1302818 (isDefined!510 (getValueByKey!703 (toList!10143 (+!4469 lt!582823 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1302819 () Bool)

(declare-fun Unit!43134 () Unit!43129)

(assert (=> b!1302819 (= e!743119 Unit!43134)))

(declare-fun b!1302820 () Bool)

(assert (=> b!1302820 (= e!743118 (isDefined!510 (getValueByKey!703 (toList!10143 (+!4469 lt!582823 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141577 c!125026) b!1302818))

(assert (= (and d!141577 (not c!125026)) b!1302819))

(assert (= (and d!141577 (not res!865354)) b!1302820))

(declare-fun m!1193719 () Bool)

(assert (=> d!141577 m!1193719))

(declare-fun m!1193721 () Bool)

(assert (=> b!1302818 m!1193721))

(declare-fun m!1193723 () Bool)

(assert (=> b!1302818 m!1193723))

(assert (=> b!1302818 m!1193723))

(declare-fun m!1193725 () Bool)

(assert (=> b!1302818 m!1193725))

(assert (=> b!1302820 m!1193723))

(assert (=> b!1302820 m!1193723))

(assert (=> b!1302820 m!1193725))

(assert (=> b!1302748 d!141577))

(declare-fun d!141579 () Bool)

(declare-fun e!743120 () Bool)

(assert (=> d!141579 e!743120))

(declare-fun res!865355 () Bool)

(assert (=> d!141579 (=> res!865355 e!743120)))

(declare-fun lt!582856 () Bool)

(assert (=> d!141579 (= res!865355 (not lt!582856))))

(declare-fun lt!582855 () Bool)

(assert (=> d!141579 (= lt!582856 lt!582855)))

(declare-fun lt!582854 () Unit!43129)

(declare-fun e!743121 () Unit!43129)

(assert (=> d!141579 (= lt!582854 e!743121)))

(declare-fun c!125027 () Bool)

(assert (=> d!141579 (= c!125027 lt!582855)))

(assert (=> d!141579 (= lt!582855 (containsKey!725 (toList!10143 lt!582823) k0!1205))))

(assert (=> d!141579 (= (contains!8275 lt!582823 k0!1205) lt!582856)))

(declare-fun b!1302821 () Bool)

(declare-fun lt!582853 () Unit!43129)

(assert (=> b!1302821 (= e!743121 lt!582853)))

(assert (=> b!1302821 (= lt!582853 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10143 lt!582823) k0!1205))))

(assert (=> b!1302821 (isDefined!510 (getValueByKey!703 (toList!10143 lt!582823) k0!1205))))

(declare-fun b!1302822 () Bool)

(declare-fun Unit!43135 () Unit!43129)

(assert (=> b!1302822 (= e!743121 Unit!43135)))

(declare-fun b!1302823 () Bool)

(assert (=> b!1302823 (= e!743120 (isDefined!510 (getValueByKey!703 (toList!10143 lt!582823) k0!1205)))))

(assert (= (and d!141579 c!125027) b!1302821))

(assert (= (and d!141579 (not c!125027)) b!1302822))

(assert (= (and d!141579 (not res!865355)) b!1302823))

(declare-fun m!1193727 () Bool)

(assert (=> d!141579 m!1193727))

(declare-fun m!1193729 () Bool)

(assert (=> b!1302821 m!1193729))

(declare-fun m!1193731 () Bool)

(assert (=> b!1302821 m!1193731))

(assert (=> b!1302821 m!1193731))

(declare-fun m!1193733 () Bool)

(assert (=> b!1302821 m!1193733))

(assert (=> b!1302823 m!1193731))

(assert (=> b!1302823 m!1193731))

(assert (=> b!1302823 m!1193733))

(assert (=> b!1302748 d!141579))

(declare-fun b!1302848 () Bool)

(declare-fun e!743140 () Bool)

(declare-fun e!743142 () Bool)

(assert (=> b!1302848 (= e!743140 e!743142)))

(declare-fun c!125039 () Bool)

(declare-fun e!743137 () Bool)

(assert (=> b!1302848 (= c!125039 e!743137)))

(declare-fun res!865367 () Bool)

(assert (=> b!1302848 (=> (not res!865367) (not e!743137))))

(assert (=> b!1302848 (= res!865367 (bvslt from!2144 (size!42431 _keys!1741)))))

(declare-fun b!1302849 () Bool)

(assert (=> b!1302849 (= e!743137 (validKeyInArray!0 (select (arr!41881 _keys!1741) from!2144)))))

(assert (=> b!1302849 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1302850 () Bool)

(declare-fun e!743138 () ListLongMap!20255)

(declare-fun e!743136 () ListLongMap!20255)

(assert (=> b!1302850 (= e!743138 e!743136)))

(declare-fun c!125038 () Bool)

(assert (=> b!1302850 (= c!125038 (validKeyInArray!0 (select (arr!41881 _keys!1741) from!2144)))))

(declare-fun b!1302851 () Bool)

(declare-fun e!743139 () Bool)

(assert (=> b!1302851 (= e!743142 e!743139)))

(declare-fun c!125037 () Bool)

(assert (=> b!1302851 (= c!125037 (bvslt from!2144 (size!42431 _keys!1741)))))

(declare-fun b!1302852 () Bool)

(assert (=> b!1302852 (= e!743138 (ListLongMap!20256 Nil!29723))))

(declare-fun lt!582874 () ListLongMap!20255)

(declare-fun b!1302853 () Bool)

(assert (=> b!1302853 (= e!743139 (= lt!582874 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun call!64152 () ListLongMap!20255)

(declare-fun bm!64149 () Bool)

(assert (=> bm!64149 (= call!64152 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun d!141581 () Bool)

(assert (=> d!141581 e!743140))

(declare-fun res!865366 () Bool)

(assert (=> d!141581 (=> (not res!865366) (not e!743140))))

(assert (=> d!141581 (= res!865366 (not (contains!8275 lt!582874 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141581 (= lt!582874 e!743138)))

(declare-fun c!125036 () Bool)

(assert (=> d!141581 (= c!125036 (bvsge from!2144 (size!42431 _keys!1741)))))

(assert (=> d!141581 (validMask!0 mask!2175)))

(assert (=> d!141581 (= (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582874)))

(declare-fun b!1302854 () Bool)

(declare-fun e!743141 () Bool)

(assert (=> b!1302854 (= e!743142 e!743141)))

(assert (=> b!1302854 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42431 _keys!1741)))))

(declare-fun res!865364 () Bool)

(assert (=> b!1302854 (= res!865364 (contains!8275 lt!582874 (select (arr!41881 _keys!1741) from!2144)))))

(assert (=> b!1302854 (=> (not res!865364) (not e!743141))))

(declare-fun b!1302855 () Bool)

(declare-fun res!865365 () Bool)

(assert (=> b!1302855 (=> (not res!865365) (not e!743140))))

(assert (=> b!1302855 (= res!865365 (not (contains!8275 lt!582874 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302856 () Bool)

(declare-fun lt!582876 () Unit!43129)

(declare-fun lt!582877 () Unit!43129)

(assert (=> b!1302856 (= lt!582876 lt!582877)))

(declare-fun lt!582872 () (_ BitVec 64))

(declare-fun lt!582871 () ListLongMap!20255)

(declare-fun lt!582875 () V!51611)

(declare-fun lt!582873 () (_ BitVec 64))

(assert (=> b!1302856 (not (contains!8275 (+!4469 lt!582871 (tuple2!22599 lt!582872 lt!582875)) lt!582873))))

(assert (=> b!1302856 (= lt!582877 (addStillNotContains!466 lt!582871 lt!582872 lt!582875 lt!582873))))

(assert (=> b!1302856 (= lt!582873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21154 (ValueCell!16542 V!51611) V!51611)

(declare-fun dynLambda!3427 (Int (_ BitVec 64)) V!51611)

(assert (=> b!1302856 (= lt!582875 (get!21154 (select (arr!41880 _values!1445) from!2144) (dynLambda!3427 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302856 (= lt!582872 (select (arr!41881 _keys!1741) from!2144))))

(assert (=> b!1302856 (= lt!582871 call!64152)))

(assert (=> b!1302856 (= e!743136 (+!4469 call!64152 (tuple2!22599 (select (arr!41881 _keys!1741) from!2144) (get!21154 (select (arr!41880 _values!1445) from!2144) (dynLambda!3427 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302857 () Bool)

(declare-fun isEmpty!1060 (ListLongMap!20255) Bool)

(assert (=> b!1302857 (= e!743139 (isEmpty!1060 lt!582874))))

(declare-fun b!1302858 () Bool)

(assert (=> b!1302858 (= e!743136 call!64152)))

(declare-fun b!1302859 () Bool)

(assert (=> b!1302859 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42431 _keys!1741)))))

(assert (=> b!1302859 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42430 _values!1445)))))

(declare-fun apply!1020 (ListLongMap!20255 (_ BitVec 64)) V!51611)

(assert (=> b!1302859 (= e!743141 (= (apply!1020 lt!582874 (select (arr!41881 _keys!1741) from!2144)) (get!21154 (select (arr!41880 _values!1445) from!2144) (dynLambda!3427 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!141581 c!125036) b!1302852))

(assert (= (and d!141581 (not c!125036)) b!1302850))

(assert (= (and b!1302850 c!125038) b!1302856))

(assert (= (and b!1302850 (not c!125038)) b!1302858))

(assert (= (or b!1302856 b!1302858) bm!64149))

(assert (= (and d!141581 res!865366) b!1302855))

(assert (= (and b!1302855 res!865365) b!1302848))

(assert (= (and b!1302848 res!865367) b!1302849))

(assert (= (and b!1302848 c!125039) b!1302854))

(assert (= (and b!1302848 (not c!125039)) b!1302851))

(assert (= (and b!1302854 res!865364) b!1302859))

(assert (= (and b!1302851 c!125037) b!1302853))

(assert (= (and b!1302851 (not c!125037)) b!1302857))

(declare-fun b_lambda!23251 () Bool)

(assert (=> (not b_lambda!23251) (not b!1302856)))

(declare-fun t!43320 () Bool)

(declare-fun tb!11395 () Bool)

(assert (=> (and start!109994 (= defaultEntry!1448 defaultEntry!1448) t!43320) tb!11395))

(declare-fun result!23807 () Bool)

(assert (=> tb!11395 (= result!23807 tp_is_empty!34881)))

(assert (=> b!1302856 t!43320))

(declare-fun b_and!47397 () Bool)

(assert (= b_and!47393 (and (=> t!43320 result!23807) b_and!47397)))

(declare-fun b_lambda!23253 () Bool)

(assert (=> (not b_lambda!23253) (not b!1302859)))

(assert (=> b!1302859 t!43320))

(declare-fun b_and!47399 () Bool)

(assert (= b_and!47397 (and (=> t!43320 result!23807) b_and!47399)))

(declare-fun m!1193735 () Bool)

(assert (=> b!1302857 m!1193735))

(assert (=> b!1302854 m!1193651))

(assert (=> b!1302854 m!1193651))

(declare-fun m!1193737 () Bool)

(assert (=> b!1302854 m!1193737))

(declare-fun m!1193739 () Bool)

(assert (=> b!1302853 m!1193739))

(assert (=> b!1302849 m!1193651))

(assert (=> b!1302849 m!1193651))

(assert (=> b!1302849 m!1193653))

(declare-fun m!1193741 () Bool)

(assert (=> b!1302856 m!1193741))

(declare-fun m!1193743 () Bool)

(assert (=> b!1302856 m!1193743))

(declare-fun m!1193745 () Bool)

(assert (=> b!1302856 m!1193745))

(declare-fun m!1193747 () Bool)

(assert (=> b!1302856 m!1193747))

(declare-fun m!1193749 () Bool)

(assert (=> b!1302856 m!1193749))

(declare-fun m!1193751 () Bool)

(assert (=> b!1302856 m!1193751))

(assert (=> b!1302856 m!1193741))

(assert (=> b!1302856 m!1193749))

(declare-fun m!1193753 () Bool)

(assert (=> b!1302856 m!1193753))

(assert (=> b!1302856 m!1193743))

(assert (=> b!1302856 m!1193651))

(declare-fun m!1193755 () Bool)

(assert (=> d!141581 m!1193755))

(assert (=> d!141581 m!1193633))

(assert (=> bm!64149 m!1193739))

(declare-fun m!1193757 () Bool)

(assert (=> b!1302855 m!1193757))

(assert (=> b!1302850 m!1193651))

(assert (=> b!1302850 m!1193651))

(assert (=> b!1302850 m!1193653))

(assert (=> b!1302859 m!1193651))

(assert (=> b!1302859 m!1193741))

(assert (=> b!1302859 m!1193749))

(assert (=> b!1302859 m!1193651))

(declare-fun m!1193759 () Bool)

(assert (=> b!1302859 m!1193759))

(assert (=> b!1302859 m!1193741))

(assert (=> b!1302859 m!1193749))

(assert (=> b!1302859 m!1193753))

(assert (=> b!1302748 d!141581))

(declare-fun d!141583 () Bool)

(assert (=> d!141583 (not (contains!8275 (+!4469 lt!582823 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!582880 () Unit!43129)

(declare-fun choose!1918 (ListLongMap!20255 (_ BitVec 64) V!51611 (_ BitVec 64)) Unit!43129)

(assert (=> d!141583 (= lt!582880 (choose!1918 lt!582823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!743145 () Bool)

(assert (=> d!141583 e!743145))

(declare-fun res!865370 () Bool)

(assert (=> d!141583 (=> (not res!865370) (not e!743145))))

(assert (=> d!141583 (= res!865370 (not (contains!8275 lt!582823 k0!1205)))))

(assert (=> d!141583 (= (addStillNotContains!466 lt!582823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!582880)))

(declare-fun b!1302865 () Bool)

(assert (=> b!1302865 (= e!743145 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141583 res!865370) b!1302865))

(assert (=> d!141583 m!1193655))

(assert (=> d!141583 m!1193655))

(assert (=> d!141583 m!1193657))

(declare-fun m!1193761 () Bool)

(assert (=> d!141583 m!1193761))

(assert (=> d!141583 m!1193659))

(assert (=> b!1302748 d!141583))

(declare-fun d!141585 () Bool)

(declare-fun e!743148 () Bool)

(assert (=> d!141585 e!743148))

(declare-fun res!865375 () Bool)

(assert (=> d!141585 (=> (not res!865375) (not e!743148))))

(declare-fun lt!582889 () ListLongMap!20255)

(assert (=> d!141585 (= res!865375 (contains!8275 lt!582889 (_1!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582890 () List!29726)

(assert (=> d!141585 (= lt!582889 (ListLongMap!20256 lt!582890))))

(declare-fun lt!582891 () Unit!43129)

(declare-fun lt!582892 () Unit!43129)

(assert (=> d!141585 (= lt!582891 lt!582892)))

(assert (=> d!141585 (= (getValueByKey!703 lt!582890 (_1!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!754 (_2!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!349 (List!29726 (_ BitVec 64) V!51611) Unit!43129)

(assert (=> d!141585 (= lt!582892 (lemmaContainsTupThenGetReturnValue!349 lt!582890 (_1!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!478 (List!29726 (_ BitVec 64) V!51611) List!29726)

(assert (=> d!141585 (= lt!582890 (insertStrictlySorted!478 (toList!10143 lt!582823) (_1!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141585 (= (+!4469 lt!582823 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582889)))

(declare-fun b!1302870 () Bool)

(declare-fun res!865376 () Bool)

(assert (=> b!1302870 (=> (not res!865376) (not e!743148))))

(assert (=> b!1302870 (= res!865376 (= (getValueByKey!703 (toList!10143 lt!582889) (_1!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!754 (_2!11310 (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1302871 () Bool)

(declare-fun contains!8278 (List!29726 tuple2!22598) Bool)

(assert (=> b!1302871 (= e!743148 (contains!8278 (toList!10143 lt!582889) (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141585 res!865375) b!1302870))

(assert (= (and b!1302870 res!865376) b!1302871))

(declare-fun m!1193763 () Bool)

(assert (=> d!141585 m!1193763))

(declare-fun m!1193765 () Bool)

(assert (=> d!141585 m!1193765))

(declare-fun m!1193767 () Bool)

(assert (=> d!141585 m!1193767))

(declare-fun m!1193769 () Bool)

(assert (=> d!141585 m!1193769))

(declare-fun m!1193771 () Bool)

(assert (=> b!1302870 m!1193771))

(declare-fun m!1193773 () Bool)

(assert (=> b!1302871 m!1193773))

(assert (=> b!1302748 d!141585))

(declare-fun d!141587 () Bool)

(declare-fun e!743149 () Bool)

(assert (=> d!141587 e!743149))

(declare-fun res!865377 () Bool)

(assert (=> d!141587 (=> res!865377 e!743149)))

(declare-fun lt!582896 () Bool)

(assert (=> d!141587 (= res!865377 (not lt!582896))))

(declare-fun lt!582895 () Bool)

(assert (=> d!141587 (= lt!582896 lt!582895)))

(declare-fun lt!582894 () Unit!43129)

(declare-fun e!743150 () Unit!43129)

(assert (=> d!141587 (= lt!582894 e!743150)))

(declare-fun c!125040 () Bool)

(assert (=> d!141587 (= c!125040 lt!582895)))

(assert (=> d!141587 (= lt!582895 (containsKey!725 (toList!10143 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141587 (= (contains!8275 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582896)))

(declare-fun b!1302872 () Bool)

(declare-fun lt!582893 () Unit!43129)

(assert (=> b!1302872 (= e!743150 lt!582893)))

(assert (=> b!1302872 (= lt!582893 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10143 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1302872 (isDefined!510 (getValueByKey!703 (toList!10143 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302873 () Bool)

(declare-fun Unit!43136 () Unit!43129)

(assert (=> b!1302873 (= e!743150 Unit!43136)))

(declare-fun b!1302874 () Bool)

(assert (=> b!1302874 (= e!743149 (isDefined!510 (getValueByKey!703 (toList!10143 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141587 c!125040) b!1302872))

(assert (= (and d!141587 (not c!125040)) b!1302873))

(assert (= (and d!141587 (not res!865377)) b!1302874))

(declare-fun m!1193775 () Bool)

(assert (=> d!141587 m!1193775))

(declare-fun m!1193777 () Bool)

(assert (=> b!1302872 m!1193777))

(declare-fun m!1193779 () Bool)

(assert (=> b!1302872 m!1193779))

(assert (=> b!1302872 m!1193779))

(declare-fun m!1193781 () Bool)

(assert (=> b!1302872 m!1193781))

(assert (=> b!1302874 m!1193779))

(assert (=> b!1302874 m!1193779))

(assert (=> b!1302874 m!1193781))

(assert (=> b!1302746 d!141587))

(declare-fun b!1302917 () Bool)

(declare-fun res!865402 () Bool)

(declare-fun e!743179 () Bool)

(assert (=> b!1302917 (=> (not res!865402) (not e!743179))))

(declare-fun e!743177 () Bool)

(assert (=> b!1302917 (= res!865402 e!743177)))

(declare-fun res!865401 () Bool)

(assert (=> b!1302917 (=> res!865401 e!743177)))

(declare-fun e!743184 () Bool)

(assert (=> b!1302917 (= res!865401 (not e!743184))))

(declare-fun res!865398 () Bool)

(assert (=> b!1302917 (=> (not res!865398) (not e!743184))))

(assert (=> b!1302917 (= res!865398 (bvslt from!2144 (size!42431 _keys!1741)))))

(declare-fun bm!64164 () Bool)

(declare-fun call!64172 () ListLongMap!20255)

(assert (=> bm!64164 (= call!64172 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun c!125055 () Bool)

(declare-fun call!64171 () ListLongMap!20255)

(declare-fun c!125053 () Bool)

(declare-fun call!64170 () ListLongMap!20255)

(declare-fun bm!64165 () Bool)

(declare-fun call!64167 () ListLongMap!20255)

(assert (=> bm!64165 (= call!64170 (+!4469 (ite c!125055 call!64172 (ite c!125053 call!64167 call!64171)) (ite (or c!125055 c!125053) (tuple2!22599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1302918 () Bool)

(declare-fun e!743188 () Bool)

(declare-fun e!743186 () Bool)

(assert (=> b!1302918 (= e!743188 e!743186)))

(declare-fun res!865397 () Bool)

(declare-fun call!64168 () Bool)

(assert (=> b!1302918 (= res!865397 call!64168)))

(assert (=> b!1302918 (=> (not res!865397) (not e!743186))))

(declare-fun b!1302919 () Bool)

(declare-fun e!743183 () ListLongMap!20255)

(declare-fun call!64169 () ListLongMap!20255)

(assert (=> b!1302919 (= e!743183 call!64169)))

(declare-fun bm!64166 () Bool)

(assert (=> bm!64166 (= call!64167 call!64172)))

(declare-fun b!1302920 () Bool)

(declare-fun e!743182 () Bool)

(declare-fun lt!582949 () ListLongMap!20255)

(assert (=> b!1302920 (= e!743182 (= (apply!1020 lt!582949 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun e!743180 () Bool)

(declare-fun b!1302921 () Bool)

(assert (=> b!1302921 (= e!743180 (= (apply!1020 lt!582949 (select (arr!41881 _keys!1741) from!2144)) (get!21154 (select (arr!41880 _values!1445) from!2144) (dynLambda!3427 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302921 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42430 _values!1445)))))

(assert (=> b!1302921 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42431 _keys!1741)))))

(declare-fun b!1302922 () Bool)

(assert (=> b!1302922 (= e!743183 call!64171)))

(declare-fun b!1302923 () Bool)

(declare-fun e!743181 () Bool)

(assert (=> b!1302923 (= e!743181 e!743182)))

(declare-fun res!865399 () Bool)

(declare-fun call!64173 () Bool)

(assert (=> b!1302923 (= res!865399 call!64173)))

(assert (=> b!1302923 (=> (not res!865399) (not e!743182))))

(declare-fun bm!64167 () Bool)

(assert (=> bm!64167 (= call!64169 call!64170)))

(declare-fun b!1302924 () Bool)

(declare-fun e!743185 () ListLongMap!20255)

(assert (=> b!1302924 (= e!743185 call!64169)))

(declare-fun bm!64168 () Bool)

(assert (=> bm!64168 (= call!64168 (contains!8275 lt!582949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302925 () Bool)

(assert (=> b!1302925 (= e!743181 (not call!64173))))

(declare-fun b!1302926 () Bool)

(assert (=> b!1302926 (= e!743184 (validKeyInArray!0 (select (arr!41881 _keys!1741) from!2144)))))

(declare-fun b!1302927 () Bool)

(declare-fun e!743178 () Unit!43129)

(declare-fun lt!582944 () Unit!43129)

(assert (=> b!1302927 (= e!743178 lt!582944)))

(declare-fun lt!582957 () ListLongMap!20255)

(assert (=> b!1302927 (= lt!582957 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582952 () (_ BitVec 64))

(assert (=> b!1302927 (= lt!582952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582959 () (_ BitVec 64))

(assert (=> b!1302927 (= lt!582959 (select (arr!41881 _keys!1741) from!2144))))

(declare-fun lt!582961 () Unit!43129)

(declare-fun addStillContains!1108 (ListLongMap!20255 (_ BitVec 64) V!51611 (_ BitVec 64)) Unit!43129)

(assert (=> b!1302927 (= lt!582961 (addStillContains!1108 lt!582957 lt!582952 zeroValue!1387 lt!582959))))

(assert (=> b!1302927 (contains!8275 (+!4469 lt!582957 (tuple2!22599 lt!582952 zeroValue!1387)) lt!582959)))

(declare-fun lt!582948 () Unit!43129)

(assert (=> b!1302927 (= lt!582948 lt!582961)))

(declare-fun lt!582955 () ListLongMap!20255)

(assert (=> b!1302927 (= lt!582955 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582962 () (_ BitVec 64))

(assert (=> b!1302927 (= lt!582962 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582941 () (_ BitVec 64))

(assert (=> b!1302927 (= lt!582941 (select (arr!41881 _keys!1741) from!2144))))

(declare-fun lt!582953 () Unit!43129)

(declare-fun addApplyDifferent!562 (ListLongMap!20255 (_ BitVec 64) V!51611 (_ BitVec 64)) Unit!43129)

(assert (=> b!1302927 (= lt!582953 (addApplyDifferent!562 lt!582955 lt!582962 minValue!1387 lt!582941))))

(assert (=> b!1302927 (= (apply!1020 (+!4469 lt!582955 (tuple2!22599 lt!582962 minValue!1387)) lt!582941) (apply!1020 lt!582955 lt!582941))))

(declare-fun lt!582958 () Unit!43129)

(assert (=> b!1302927 (= lt!582958 lt!582953)))

(declare-fun lt!582951 () ListLongMap!20255)

(assert (=> b!1302927 (= lt!582951 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582942 () (_ BitVec 64))

(assert (=> b!1302927 (= lt!582942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582960 () (_ BitVec 64))

(assert (=> b!1302927 (= lt!582960 (select (arr!41881 _keys!1741) from!2144))))

(declare-fun lt!582946 () Unit!43129)

(assert (=> b!1302927 (= lt!582946 (addApplyDifferent!562 lt!582951 lt!582942 zeroValue!1387 lt!582960))))

(assert (=> b!1302927 (= (apply!1020 (+!4469 lt!582951 (tuple2!22599 lt!582942 zeroValue!1387)) lt!582960) (apply!1020 lt!582951 lt!582960))))

(declare-fun lt!582954 () Unit!43129)

(assert (=> b!1302927 (= lt!582954 lt!582946)))

(declare-fun lt!582947 () ListLongMap!20255)

(assert (=> b!1302927 (= lt!582947 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582956 () (_ BitVec 64))

(assert (=> b!1302927 (= lt!582956 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582943 () (_ BitVec 64))

(assert (=> b!1302927 (= lt!582943 (select (arr!41881 _keys!1741) from!2144))))

(assert (=> b!1302927 (= lt!582944 (addApplyDifferent!562 lt!582947 lt!582956 minValue!1387 lt!582943))))

(assert (=> b!1302927 (= (apply!1020 (+!4469 lt!582947 (tuple2!22599 lt!582956 minValue!1387)) lt!582943) (apply!1020 lt!582947 lt!582943))))

(declare-fun b!1302928 () Bool)

(declare-fun e!743187 () Bool)

(assert (=> b!1302928 (= e!743187 (validKeyInArray!0 (select (arr!41881 _keys!1741) from!2144)))))

(declare-fun b!1302929 () Bool)

(assert (=> b!1302929 (= e!743177 e!743180)))

(declare-fun res!865396 () Bool)

(assert (=> b!1302929 (=> (not res!865396) (not e!743180))))

(assert (=> b!1302929 (= res!865396 (contains!8275 lt!582949 (select (arr!41881 _keys!1741) from!2144)))))

(assert (=> b!1302929 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42431 _keys!1741)))))

(declare-fun bm!64169 () Bool)

(assert (=> bm!64169 (= call!64173 (contains!8275 lt!582949 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302930 () Bool)

(declare-fun c!125058 () Bool)

(assert (=> b!1302930 (= c!125058 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1302930 (= e!743185 e!743183)))

(declare-fun b!1302932 () Bool)

(declare-fun Unit!43137 () Unit!43129)

(assert (=> b!1302932 (= e!743178 Unit!43137)))

(declare-fun d!141589 () Bool)

(assert (=> d!141589 e!743179))

(declare-fun res!865404 () Bool)

(assert (=> d!141589 (=> (not res!865404) (not e!743179))))

(assert (=> d!141589 (= res!865404 (or (bvsge from!2144 (size!42431 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42431 _keys!1741)))))))

(declare-fun lt!582945 () ListLongMap!20255)

(assert (=> d!141589 (= lt!582949 lt!582945)))

(declare-fun lt!582950 () Unit!43129)

(assert (=> d!141589 (= lt!582950 e!743178)))

(declare-fun c!125057 () Bool)

(assert (=> d!141589 (= c!125057 e!743187)))

(declare-fun res!865400 () Bool)

(assert (=> d!141589 (=> (not res!865400) (not e!743187))))

(assert (=> d!141589 (= res!865400 (bvslt from!2144 (size!42431 _keys!1741)))))

(declare-fun e!743189 () ListLongMap!20255)

(assert (=> d!141589 (= lt!582945 e!743189)))

(assert (=> d!141589 (= c!125055 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141589 (validMask!0 mask!2175)))

(assert (=> d!141589 (= (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582949)))

(declare-fun b!1302931 () Bool)

(assert (=> b!1302931 (= e!743186 (= (apply!1020 lt!582949 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64170 () Bool)

(assert (=> bm!64170 (= call!64171 call!64167)))

(declare-fun b!1302933 () Bool)

(assert (=> b!1302933 (= e!743189 e!743185)))

(assert (=> b!1302933 (= c!125053 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302934 () Bool)

(assert (=> b!1302934 (= e!743189 (+!4469 call!64170 (tuple2!22599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1302935 () Bool)

(assert (=> b!1302935 (= e!743188 (not call!64168))))

(declare-fun b!1302936 () Bool)

(assert (=> b!1302936 (= e!743179 e!743181)))

(declare-fun c!125054 () Bool)

(assert (=> b!1302936 (= c!125054 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302937 () Bool)

(declare-fun res!865403 () Bool)

(assert (=> b!1302937 (=> (not res!865403) (not e!743179))))

(assert (=> b!1302937 (= res!865403 e!743188)))

(declare-fun c!125056 () Bool)

(assert (=> b!1302937 (= c!125056 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!141589 c!125055) b!1302934))

(assert (= (and d!141589 (not c!125055)) b!1302933))

(assert (= (and b!1302933 c!125053) b!1302924))

(assert (= (and b!1302933 (not c!125053)) b!1302930))

(assert (= (and b!1302930 c!125058) b!1302919))

(assert (= (and b!1302930 (not c!125058)) b!1302922))

(assert (= (or b!1302919 b!1302922) bm!64170))

(assert (= (or b!1302924 bm!64170) bm!64166))

(assert (= (or b!1302924 b!1302919) bm!64167))

(assert (= (or b!1302934 bm!64166) bm!64164))

(assert (= (or b!1302934 bm!64167) bm!64165))

(assert (= (and d!141589 res!865400) b!1302928))

(assert (= (and d!141589 c!125057) b!1302927))

(assert (= (and d!141589 (not c!125057)) b!1302932))

(assert (= (and d!141589 res!865404) b!1302917))

(assert (= (and b!1302917 res!865398) b!1302926))

(assert (= (and b!1302917 (not res!865401)) b!1302929))

(assert (= (and b!1302929 res!865396) b!1302921))

(assert (= (and b!1302917 res!865402) b!1302937))

(assert (= (and b!1302937 c!125056) b!1302918))

(assert (= (and b!1302937 (not c!125056)) b!1302935))

(assert (= (and b!1302918 res!865397) b!1302931))

(assert (= (or b!1302918 b!1302935) bm!64168))

(assert (= (and b!1302937 res!865403) b!1302936))

(assert (= (and b!1302936 c!125054) b!1302923))

(assert (= (and b!1302936 (not c!125054)) b!1302925))

(assert (= (and b!1302923 res!865399) b!1302920))

(assert (= (or b!1302923 b!1302925) bm!64169))

(declare-fun b_lambda!23255 () Bool)

(assert (=> (not b_lambda!23255) (not b!1302921)))

(assert (=> b!1302921 t!43320))

(declare-fun b_and!47401 () Bool)

(assert (= b_and!47399 (and (=> t!43320 result!23807) b_and!47401)))

(declare-fun m!1193783 () Bool)

(assert (=> bm!64165 m!1193783))

(declare-fun m!1193785 () Bool)

(assert (=> bm!64168 m!1193785))

(assert (=> bm!64164 m!1193661))

(assert (=> b!1302921 m!1193651))

(assert (=> b!1302921 m!1193741))

(assert (=> b!1302921 m!1193749))

(assert (=> b!1302921 m!1193753))

(assert (=> b!1302921 m!1193749))

(assert (=> b!1302921 m!1193651))

(declare-fun m!1193787 () Bool)

(assert (=> b!1302921 m!1193787))

(assert (=> b!1302921 m!1193741))

(assert (=> b!1302929 m!1193651))

(assert (=> b!1302929 m!1193651))

(declare-fun m!1193789 () Bool)

(assert (=> b!1302929 m!1193789))

(declare-fun m!1193791 () Bool)

(assert (=> b!1302920 m!1193791))

(assert (=> b!1302927 m!1193651))

(declare-fun m!1193793 () Bool)

(assert (=> b!1302927 m!1193793))

(declare-fun m!1193795 () Bool)

(assert (=> b!1302927 m!1193795))

(declare-fun m!1193797 () Bool)

(assert (=> b!1302927 m!1193797))

(assert (=> b!1302927 m!1193661))

(declare-fun m!1193799 () Bool)

(assert (=> b!1302927 m!1193799))

(declare-fun m!1193801 () Bool)

(assert (=> b!1302927 m!1193801))

(declare-fun m!1193803 () Bool)

(assert (=> b!1302927 m!1193803))

(assert (=> b!1302927 m!1193797))

(declare-fun m!1193805 () Bool)

(assert (=> b!1302927 m!1193805))

(declare-fun m!1193807 () Bool)

(assert (=> b!1302927 m!1193807))

(declare-fun m!1193809 () Bool)

(assert (=> b!1302927 m!1193809))

(declare-fun m!1193811 () Bool)

(assert (=> b!1302927 m!1193811))

(declare-fun m!1193813 () Bool)

(assert (=> b!1302927 m!1193813))

(declare-fun m!1193815 () Bool)

(assert (=> b!1302927 m!1193815))

(declare-fun m!1193817 () Bool)

(assert (=> b!1302927 m!1193817))

(assert (=> b!1302927 m!1193793))

(declare-fun m!1193819 () Bool)

(assert (=> b!1302927 m!1193819))

(assert (=> b!1302927 m!1193803))

(declare-fun m!1193821 () Bool)

(assert (=> b!1302927 m!1193821))

(assert (=> b!1302927 m!1193815))

(assert (=> b!1302928 m!1193651))

(assert (=> b!1302928 m!1193651))

(assert (=> b!1302928 m!1193653))

(declare-fun m!1193823 () Bool)

(assert (=> bm!64169 m!1193823))

(assert (=> d!141589 m!1193633))

(assert (=> b!1302926 m!1193651))

(assert (=> b!1302926 m!1193651))

(assert (=> b!1302926 m!1193653))

(declare-fun m!1193825 () Bool)

(assert (=> b!1302934 m!1193825))

(declare-fun m!1193827 () Bool)

(assert (=> b!1302931 m!1193827))

(assert (=> b!1302746 d!141589))

(declare-fun d!141591 () Bool)

(assert (=> d!141591 (= (validKeyInArray!0 (select (arr!41881 _keys!1741) from!2144)) (and (not (= (select (arr!41881 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41881 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302742 d!141591))

(declare-fun d!141593 () Bool)

(assert (=> d!141593 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109994 d!141593))

(declare-fun d!141595 () Bool)

(assert (=> d!141595 (= (array_inv!31679 _values!1445) (bvsge (size!42430 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109994 d!141595))

(declare-fun d!141597 () Bool)

(assert (=> d!141597 (= (array_inv!31680 _keys!1741) (bvsge (size!42431 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109994 d!141597))

(declare-fun bm!64173 () Bool)

(declare-fun call!64176 () Bool)

(assert (=> bm!64173 (= call!64176 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1302946 () Bool)

(declare-fun e!743197 () Bool)

(assert (=> b!1302946 (= e!743197 call!64176)))

(declare-fun b!1302947 () Bool)

(declare-fun e!743198 () Bool)

(assert (=> b!1302947 (= e!743197 e!743198)))

(declare-fun lt!582970 () (_ BitVec 64))

(assert (=> b!1302947 (= lt!582970 (select (arr!41881 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582969 () Unit!43129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86776 (_ BitVec 64) (_ BitVec 32)) Unit!43129)

(assert (=> b!1302947 (= lt!582969 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582970 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1302947 (arrayContainsKey!0 _keys!1741 lt!582970 #b00000000000000000000000000000000)))

(declare-fun lt!582971 () Unit!43129)

(assert (=> b!1302947 (= lt!582971 lt!582969)))

(declare-fun res!865410 () Bool)

(declare-datatypes ((SeekEntryResult!10023 0))(
  ( (MissingZero!10023 (index!42463 (_ BitVec 32))) (Found!10023 (index!42464 (_ BitVec 32))) (Intermediate!10023 (undefined!10835 Bool) (index!42465 (_ BitVec 32)) (x!115709 (_ BitVec 32))) (Undefined!10023) (MissingVacant!10023 (index!42466 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86776 (_ BitVec 32)) SeekEntryResult!10023)

(assert (=> b!1302947 (= res!865410 (= (seekEntryOrOpen!0 (select (arr!41881 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10023 #b00000000000000000000000000000000)))))

(assert (=> b!1302947 (=> (not res!865410) (not e!743198))))

(declare-fun b!1302949 () Bool)

(assert (=> b!1302949 (= e!743198 call!64176)))

(declare-fun b!1302948 () Bool)

(declare-fun e!743196 () Bool)

(assert (=> b!1302948 (= e!743196 e!743197)))

(declare-fun c!125061 () Bool)

(assert (=> b!1302948 (= c!125061 (validKeyInArray!0 (select (arr!41881 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141599 () Bool)

(declare-fun res!865409 () Bool)

(assert (=> d!141599 (=> res!865409 e!743196)))

(assert (=> d!141599 (= res!865409 (bvsge #b00000000000000000000000000000000 (size!42431 _keys!1741)))))

(assert (=> d!141599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743196)))

(assert (= (and d!141599 (not res!865409)) b!1302948))

(assert (= (and b!1302948 c!125061) b!1302947))

(assert (= (and b!1302948 (not c!125061)) b!1302946))

(assert (= (and b!1302947 res!865410) b!1302949))

(assert (= (or b!1302949 b!1302946) bm!64173))

(declare-fun m!1193829 () Bool)

(assert (=> bm!64173 m!1193829))

(assert (=> b!1302947 m!1193711))

(declare-fun m!1193831 () Bool)

(assert (=> b!1302947 m!1193831))

(declare-fun m!1193833 () Bool)

(assert (=> b!1302947 m!1193833))

(assert (=> b!1302947 m!1193711))

(declare-fun m!1193835 () Bool)

(assert (=> b!1302947 m!1193835))

(assert (=> b!1302948 m!1193711))

(assert (=> b!1302948 m!1193711))

(assert (=> b!1302948 m!1193715))

(assert (=> b!1302745 d!141599))

(declare-fun mapNonEmpty!53914 () Bool)

(declare-fun mapRes!53914 () Bool)

(declare-fun tp!102877 () Bool)

(declare-fun e!743203 () Bool)

(assert (=> mapNonEmpty!53914 (= mapRes!53914 (and tp!102877 e!743203))))

(declare-fun mapKey!53914 () (_ BitVec 32))

(declare-fun mapValue!53914 () ValueCell!16542)

(declare-fun mapRest!53914 () (Array (_ BitVec 32) ValueCell!16542))

(assert (=> mapNonEmpty!53914 (= mapRest!53908 (store mapRest!53914 mapKey!53914 mapValue!53914))))

(declare-fun b!1302957 () Bool)

(declare-fun e!743204 () Bool)

(assert (=> b!1302957 (= e!743204 tp_is_empty!34881)))

(declare-fun b!1302956 () Bool)

(assert (=> b!1302956 (= e!743203 tp_is_empty!34881)))

(declare-fun mapIsEmpty!53914 () Bool)

(assert (=> mapIsEmpty!53914 mapRes!53914))

(declare-fun condMapEmpty!53914 () Bool)

(declare-fun mapDefault!53914 () ValueCell!16542)

(assert (=> mapNonEmpty!53908 (= condMapEmpty!53914 (= mapRest!53908 ((as const (Array (_ BitVec 32) ValueCell!16542)) mapDefault!53914)))))

(assert (=> mapNonEmpty!53908 (= tp!102867 (and e!743204 mapRes!53914))))

(assert (= (and mapNonEmpty!53908 condMapEmpty!53914) mapIsEmpty!53914))

(assert (= (and mapNonEmpty!53908 (not condMapEmpty!53914)) mapNonEmpty!53914))

(assert (= (and mapNonEmpty!53914 ((_ is ValueCellFull!16542) mapValue!53914)) b!1302956))

(assert (= (and mapNonEmpty!53908 ((_ is ValueCellFull!16542) mapDefault!53914)) b!1302957))

(declare-fun m!1193837 () Bool)

(assert (=> mapNonEmpty!53914 m!1193837))

(declare-fun b_lambda!23257 () Bool)

(assert (= b_lambda!23251 (or (and start!109994 b_free!29241) b_lambda!23257)))

(declare-fun b_lambda!23259 () Bool)

(assert (= b_lambda!23255 (or (and start!109994 b_free!29241) b_lambda!23259)))

(declare-fun b_lambda!23261 () Bool)

(assert (= b_lambda!23253 (or (and start!109994 b_free!29241) b_lambda!23261)))

(check-sat b_and!47401 (not b_next!29241) (not bm!64169) (not b!1302855) (not d!141583) (not b!1302948) (not b!1302818) tp_is_empty!34881 (not b!1302872) (not b!1302813) (not b!1302871) (not b!1302850) (not b!1302927) (not b!1302859) (not b!1302853) (not b_lambda!23259) (not b!1302821) (not b!1302814) (not d!141581) (not d!141571) (not b!1302870) (not bm!64146) (not d!141589) (not bm!64165) (not bm!64168) (not b_lambda!23257) (not b!1302920) (not bm!64149) (not b!1302874) (not b!1302921) (not b!1302931) (not b_lambda!23261) (not d!141573) (not b!1302929) (not d!141587) (not b!1302800) (not b!1302856) (not d!141577) (not d!141585) (not mapNonEmpty!53914) (not b!1302928) (not b!1302857) (not b!1302934) (not b!1302802) (not b!1302849) (not b!1302854) (not b!1302815) (not b!1302823) (not d!141579) (not bm!64164) (not b!1302820) (not b!1302926) (not bm!64173) (not b!1302947))
(check-sat b_and!47401 (not b_next!29241))
