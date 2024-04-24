; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134522 () Bool)

(assert start!134522)

(declare-fun b_free!32221 () Bool)

(declare-fun b_next!32221 () Bool)

(assert (=> start!134522 (= b_free!32221 (not b_next!32221))))

(declare-fun tp!113984 () Bool)

(declare-fun b_and!51871 () Bool)

(assert (=> start!134522 (= tp!113984 b_and!51871)))

(declare-fun b!1569803 () Bool)

(declare-fun res!1072069 () Bool)

(declare-fun e!875204 () Bool)

(assert (=> b!1569803 (=> (not res!1072069) (not e!875204))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104814 0))(
  ( (array!104815 (arr!50584 (Array (_ BitVec 32) (_ BitVec 64))) (size!51135 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104814)

(declare-datatypes ((V!60209 0))(
  ( (V!60210 (val!19584 Int)) )
))
(declare-datatypes ((ValueCell!18470 0))(
  ( (ValueCellFull!18470 (v!22336 V!60209)) (EmptyCell!18470) )
))
(declare-datatypes ((array!104816 0))(
  ( (array!104817 (arr!50585 (Array (_ BitVec 32) ValueCell!18470)) (size!51136 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104816)

(assert (=> b!1569803 (= res!1072069 (and (= (size!51136 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51135 _keys!637) (size!51136 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1569804 () Bool)

(declare-fun res!1072067 () Bool)

(assert (=> b!1569804 (=> (not res!1072067) (not e!875204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104814 (_ BitVec 32)) Bool)

(assert (=> b!1569804 (= res!1072067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1569806 () Bool)

(declare-fun e!875206 () Bool)

(assert (=> b!1569806 (= e!875204 e!875206)))

(declare-fun res!1072070 () Bool)

(assert (=> b!1569806 (=> res!1072070 e!875206)))

(declare-datatypes ((tuple2!25330 0))(
  ( (tuple2!25331 (_1!12676 (_ BitVec 64)) (_2!12676 V!60209)) )
))
(declare-datatypes ((List!36690 0))(
  ( (Nil!36687) (Cons!36686 (h!38151 tuple2!25330) (t!51588 List!36690)) )
))
(declare-datatypes ((ListLongMap!22773 0))(
  ( (ListLongMap!22774 (toList!11402 List!36690)) )
))
(declare-fun lt!673841 () ListLongMap!22773)

(declare-fun contains!10408 (ListLongMap!22773 (_ BitVec 64)) Bool)

(assert (=> b!1569806 (= res!1072070 (contains!10408 lt!673841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60209)

(declare-fun minValue!453 () V!60209)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6780 (array!104814 array!104816 (_ BitVec 32) (_ BitVec 32) V!60209 V!60209 (_ BitVec 32) Int) ListLongMap!22773)

(assert (=> b!1569806 (= lt!673841 (getCurrentListMapNoExtraKeys!6780 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1569807 () Bool)

(declare-fun e!875207 () Bool)

(declare-fun tp_is_empty!39001 () Bool)

(assert (=> b!1569807 (= e!875207 tp_is_empty!39001)))

(declare-fun b!1569808 () Bool)

(assert (=> b!1569808 (= e!875206 (contains!10408 lt!673841 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569809 () Bool)

(declare-fun e!875205 () Bool)

(assert (=> b!1569809 (= e!875205 tp_is_empty!39001)))

(declare-fun mapIsEmpty!59904 () Bool)

(declare-fun mapRes!59904 () Bool)

(assert (=> mapIsEmpty!59904 mapRes!59904))

(declare-fun b!1569810 () Bool)

(declare-fun res!1072068 () Bool)

(assert (=> b!1569810 (=> (not res!1072068) (not e!875204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1569810 (= res!1072068 (not (validKeyInArray!0 (select (arr!50584 _keys!637) from!782))))))

(declare-fun b!1569811 () Bool)

(declare-fun res!1072066 () Bool)

(assert (=> b!1569811 (=> (not res!1072066) (not e!875204))))

(declare-datatypes ((List!36691 0))(
  ( (Nil!36688) (Cons!36687 (h!38152 (_ BitVec 64)) (t!51589 List!36691)) )
))
(declare-fun arrayNoDuplicates!0 (array!104814 (_ BitVec 32) List!36691) Bool)

(assert (=> b!1569811 (= res!1072066 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36688))))

(declare-fun b!1569805 () Bool)

(declare-fun e!875208 () Bool)

(assert (=> b!1569805 (= e!875208 (and e!875207 mapRes!59904))))

(declare-fun condMapEmpty!59904 () Bool)

(declare-fun mapDefault!59904 () ValueCell!18470)

(assert (=> b!1569805 (= condMapEmpty!59904 (= (arr!50585 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18470)) mapDefault!59904)))))

(declare-fun res!1072071 () Bool)

(assert (=> start!134522 (=> (not res!1072071) (not e!875204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134522 (= res!1072071 (validMask!0 mask!947))))

(assert (=> start!134522 e!875204))

(assert (=> start!134522 tp!113984))

(assert (=> start!134522 tp_is_empty!39001))

(assert (=> start!134522 true))

(declare-fun array_inv!39539 (array!104814) Bool)

(assert (=> start!134522 (array_inv!39539 _keys!637)))

(declare-fun array_inv!39540 (array!104816) Bool)

(assert (=> start!134522 (and (array_inv!39540 _values!487) e!875208)))

(declare-fun b!1569812 () Bool)

(declare-fun res!1072072 () Bool)

(assert (=> b!1569812 (=> (not res!1072072) (not e!875204))))

(assert (=> b!1569812 (= res!1072072 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51135 _keys!637)) (bvslt from!782 (size!51135 _keys!637))))))

(declare-fun mapNonEmpty!59904 () Bool)

(declare-fun tp!113985 () Bool)

(assert (=> mapNonEmpty!59904 (= mapRes!59904 (and tp!113985 e!875205))))

(declare-fun mapRest!59904 () (Array (_ BitVec 32) ValueCell!18470))

(declare-fun mapValue!59904 () ValueCell!18470)

(declare-fun mapKey!59904 () (_ BitVec 32))

(assert (=> mapNonEmpty!59904 (= (arr!50585 _values!487) (store mapRest!59904 mapKey!59904 mapValue!59904))))

(assert (= (and start!134522 res!1072071) b!1569803))

(assert (= (and b!1569803 res!1072069) b!1569804))

(assert (= (and b!1569804 res!1072067) b!1569811))

(assert (= (and b!1569811 res!1072066) b!1569812))

(assert (= (and b!1569812 res!1072072) b!1569810))

(assert (= (and b!1569810 res!1072068) b!1569806))

(assert (= (and b!1569806 (not res!1072070)) b!1569808))

(assert (= (and b!1569805 condMapEmpty!59904) mapIsEmpty!59904))

(assert (= (and b!1569805 (not condMapEmpty!59904)) mapNonEmpty!59904))

(get-info :version)

(assert (= (and mapNonEmpty!59904 ((_ is ValueCellFull!18470) mapValue!59904)) b!1569809))

(assert (= (and b!1569805 ((_ is ValueCellFull!18470) mapDefault!59904)) b!1569807))

(assert (= start!134522 b!1569805))

(declare-fun m!1444499 () Bool)

(assert (=> b!1569811 m!1444499))

(declare-fun m!1444501 () Bool)

(assert (=> mapNonEmpty!59904 m!1444501))

(declare-fun m!1444503 () Bool)

(assert (=> b!1569808 m!1444503))

(declare-fun m!1444505 () Bool)

(assert (=> b!1569810 m!1444505))

(assert (=> b!1569810 m!1444505))

(declare-fun m!1444507 () Bool)

(assert (=> b!1569810 m!1444507))

(declare-fun m!1444509 () Bool)

(assert (=> b!1569804 m!1444509))

(declare-fun m!1444511 () Bool)

(assert (=> b!1569806 m!1444511))

(declare-fun m!1444513 () Bool)

(assert (=> b!1569806 m!1444513))

(declare-fun m!1444515 () Bool)

(assert (=> start!134522 m!1444515))

(declare-fun m!1444517 () Bool)

(assert (=> start!134522 m!1444517))

(declare-fun m!1444519 () Bool)

(assert (=> start!134522 m!1444519))

(check-sat b_and!51871 tp_is_empty!39001 (not b!1569806) (not start!134522) (not b_next!32221) (not b!1569810) (not b!1569808) (not b!1569811) (not b!1569804) (not mapNonEmpty!59904))
(check-sat b_and!51871 (not b_next!32221))
(get-model)

(declare-fun d!164269 () Bool)

(assert (=> d!164269 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134522 d!164269))

(declare-fun d!164271 () Bool)

(assert (=> d!164271 (= (array_inv!39539 _keys!637) (bvsge (size!51135 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134522 d!164271))

(declare-fun d!164273 () Bool)

(assert (=> d!164273 (= (array_inv!39540 _values!487) (bvsge (size!51136 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134522 d!164273))

(declare-fun d!164275 () Bool)

(declare-fun e!875250 () Bool)

(assert (=> d!164275 e!875250))

(declare-fun res!1072117 () Bool)

(assert (=> d!164275 (=> res!1072117 e!875250)))

(declare-fun lt!673857 () Bool)

(assert (=> d!164275 (= res!1072117 (not lt!673857))))

(declare-fun lt!673856 () Bool)

(assert (=> d!164275 (= lt!673857 lt!673856)))

(declare-datatypes ((Unit!51968 0))(
  ( (Unit!51969) )
))
(declare-fun lt!673859 () Unit!51968)

(declare-fun e!875249 () Unit!51968)

(assert (=> d!164275 (= lt!673859 e!875249)))

(declare-fun c!145288 () Bool)

(assert (=> d!164275 (= c!145288 lt!673856)))

(declare-fun containsKey!853 (List!36690 (_ BitVec 64)) Bool)

(assert (=> d!164275 (= lt!673856 (containsKey!853 (toList!11402 lt!673841) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164275 (= (contains!10408 lt!673841 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673857)))

(declare-fun b!1569879 () Bool)

(declare-fun lt!673858 () Unit!51968)

(assert (=> b!1569879 (= e!875249 lt!673858)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!536 (List!36690 (_ BitVec 64)) Unit!51968)

(assert (=> b!1569879 (= lt!673858 (lemmaContainsKeyImpliesGetValueByKeyDefined!536 (toList!11402 lt!673841) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!866 0))(
  ( (Some!865 (v!22339 V!60209)) (None!864) )
))
(declare-fun isDefined!582 (Option!866) Bool)

(declare-fun getValueByKey!791 (List!36690 (_ BitVec 64)) Option!866)

(assert (=> b!1569879 (isDefined!582 (getValueByKey!791 (toList!11402 lt!673841) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569880 () Bool)

(declare-fun Unit!51970 () Unit!51968)

(assert (=> b!1569880 (= e!875249 Unit!51970)))

(declare-fun b!1569881 () Bool)

(assert (=> b!1569881 (= e!875250 (isDefined!582 (getValueByKey!791 (toList!11402 lt!673841) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164275 c!145288) b!1569879))

(assert (= (and d!164275 (not c!145288)) b!1569880))

(assert (= (and d!164275 (not res!1072117)) b!1569881))

(declare-fun m!1444565 () Bool)

(assert (=> d!164275 m!1444565))

(declare-fun m!1444567 () Bool)

(assert (=> b!1569879 m!1444567))

(declare-fun m!1444569 () Bool)

(assert (=> b!1569879 m!1444569))

(assert (=> b!1569879 m!1444569))

(declare-fun m!1444571 () Bool)

(assert (=> b!1569879 m!1444571))

(assert (=> b!1569881 m!1444569))

(assert (=> b!1569881 m!1444569))

(assert (=> b!1569881 m!1444571))

(assert (=> b!1569806 d!164275))

(declare-fun b!1569906 () Bool)

(declare-fun res!1072129 () Bool)

(declare-fun e!875266 () Bool)

(assert (=> b!1569906 (=> (not res!1072129) (not e!875266))))

(declare-fun lt!673877 () ListLongMap!22773)

(assert (=> b!1569906 (= res!1072129 (not (contains!10408 lt!673877 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1569907 () Bool)

(declare-fun e!875265 () Bool)

(declare-fun e!875271 () Bool)

(assert (=> b!1569907 (= e!875265 e!875271)))

(declare-fun c!145300 () Bool)

(assert (=> b!1569907 (= c!145300 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51135 _keys!637)))))

(declare-fun call!72083 () ListLongMap!22773)

(declare-fun bm!72080 () Bool)

(assert (=> bm!72080 (= call!72083 (getCurrentListMapNoExtraKeys!6780 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1569908 () Bool)

(declare-fun e!875270 () Bool)

(assert (=> b!1569908 (= e!875270 (validKeyInArray!0 (select (arr!50584 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1569908 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun d!164277 () Bool)

(assert (=> d!164277 e!875266))

(declare-fun res!1072127 () Bool)

(assert (=> d!164277 (=> (not res!1072127) (not e!875266))))

(assert (=> d!164277 (= res!1072127 (not (contains!10408 lt!673877 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!875269 () ListLongMap!22773)

(assert (=> d!164277 (= lt!673877 e!875269)))

(declare-fun c!145298 () Bool)

(assert (=> d!164277 (= c!145298 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51135 _keys!637)))))

(assert (=> d!164277 (validMask!0 mask!947)))

(assert (=> d!164277 (= (getCurrentListMapNoExtraKeys!6780 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!673877)))

(declare-fun b!1569909 () Bool)

(declare-fun isEmpty!1153 (ListLongMap!22773) Bool)

(assert (=> b!1569909 (= e!875271 (isEmpty!1153 lt!673877))))

(declare-fun b!1569910 () Bool)

(assert (=> b!1569910 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51135 _keys!637)))))

(assert (=> b!1569910 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51136 _values!487)))))

(declare-fun e!875268 () Bool)

(declare-fun apply!1124 (ListLongMap!22773 (_ BitVec 64)) V!60209)

(declare-fun get!26421 (ValueCell!18470 V!60209) V!60209)

(declare-fun dynLambda!3924 (Int (_ BitVec 64)) V!60209)

(assert (=> b!1569910 (= e!875268 (= (apply!1124 lt!673877 (select (arr!50584 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26421 (select (arr!50585 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3924 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1569911 () Bool)

(declare-fun e!875267 () ListLongMap!22773)

(assert (=> b!1569911 (= e!875269 e!875267)))

(declare-fun c!145299 () Bool)

(assert (=> b!1569911 (= c!145299 (validKeyInArray!0 (select (arr!50584 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1569912 () Bool)

(assert (=> b!1569912 (= e!875269 (ListLongMap!22774 Nil!36687))))

(declare-fun b!1569913 () Bool)

(assert (=> b!1569913 (= e!875265 e!875268)))

(assert (=> b!1569913 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51135 _keys!637)))))

(declare-fun res!1072126 () Bool)

(assert (=> b!1569913 (= res!1072126 (contains!10408 lt!673877 (select (arr!50584 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1569913 (=> (not res!1072126) (not e!875268))))

(declare-fun b!1569914 () Bool)

(assert (=> b!1569914 (= e!875267 call!72083)))

(declare-fun b!1569915 () Bool)

(assert (=> b!1569915 (= e!875271 (= lt!673877 (getCurrentListMapNoExtraKeys!6780 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1569916 () Bool)

(declare-fun lt!673880 () Unit!51968)

(declare-fun lt!673876 () Unit!51968)

(assert (=> b!1569916 (= lt!673880 lt!673876)))

(declare-fun lt!673879 () (_ BitVec 64))

(declare-fun lt!673874 () V!60209)

(declare-fun lt!673878 () ListLongMap!22773)

(declare-fun lt!673875 () (_ BitVec 64))

(declare-fun +!5126 (ListLongMap!22773 tuple2!25330) ListLongMap!22773)

(assert (=> b!1569916 (not (contains!10408 (+!5126 lt!673878 (tuple2!25331 lt!673875 lt!673874)) lt!673879))))

(declare-fun addStillNotContains!577 (ListLongMap!22773 (_ BitVec 64) V!60209 (_ BitVec 64)) Unit!51968)

(assert (=> b!1569916 (= lt!673876 (addStillNotContains!577 lt!673878 lt!673875 lt!673874 lt!673879))))

(assert (=> b!1569916 (= lt!673879 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1569916 (= lt!673874 (get!26421 (select (arr!50585 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3924 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1569916 (= lt!673875 (select (arr!50584 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1569916 (= lt!673878 call!72083)))

(assert (=> b!1569916 (= e!875267 (+!5126 call!72083 (tuple2!25331 (select (arr!50584 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26421 (select (arr!50585 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3924 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1569917 () Bool)

(assert (=> b!1569917 (= e!875266 e!875265)))

(declare-fun c!145297 () Bool)

(assert (=> b!1569917 (= c!145297 e!875270)))

(declare-fun res!1072128 () Bool)

(assert (=> b!1569917 (=> (not res!1072128) (not e!875270))))

(assert (=> b!1569917 (= res!1072128 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51135 _keys!637)))))

(assert (= (and d!164277 c!145298) b!1569912))

(assert (= (and d!164277 (not c!145298)) b!1569911))

(assert (= (and b!1569911 c!145299) b!1569916))

(assert (= (and b!1569911 (not c!145299)) b!1569914))

(assert (= (or b!1569916 b!1569914) bm!72080))

(assert (= (and d!164277 res!1072127) b!1569906))

(assert (= (and b!1569906 res!1072129) b!1569917))

(assert (= (and b!1569917 res!1072128) b!1569908))

(assert (= (and b!1569917 c!145297) b!1569913))

(assert (= (and b!1569917 (not c!145297)) b!1569907))

(assert (= (and b!1569913 res!1072126) b!1569910))

(assert (= (and b!1569907 c!145300) b!1569915))

(assert (= (and b!1569907 (not c!145300)) b!1569909))

(declare-fun b_lambda!25033 () Bool)

(assert (=> (not b_lambda!25033) (not b!1569910)))

(declare-fun t!51593 () Bool)

(declare-fun tb!12653 () Bool)

(assert (=> (and start!134522 (= defaultEntry!495 defaultEntry!495) t!51593) tb!12653))

(declare-fun result!26611 () Bool)

(assert (=> tb!12653 (= result!26611 tp_is_empty!39001)))

(assert (=> b!1569910 t!51593))

(declare-fun b_and!51877 () Bool)

(assert (= b_and!51871 (and (=> t!51593 result!26611) b_and!51877)))

(declare-fun b_lambda!25035 () Bool)

(assert (=> (not b_lambda!25035) (not b!1569916)))

(assert (=> b!1569916 t!51593))

(declare-fun b_and!51879 () Bool)

(assert (= b_and!51877 (and (=> t!51593 result!26611) b_and!51879)))

(declare-fun m!1444573 () Bool)

(assert (=> bm!72080 m!1444573))

(declare-fun m!1444575 () Bool)

(assert (=> b!1569909 m!1444575))

(declare-fun m!1444577 () Bool)

(assert (=> b!1569906 m!1444577))

(declare-fun m!1444579 () Bool)

(assert (=> b!1569911 m!1444579))

(assert (=> b!1569911 m!1444579))

(declare-fun m!1444581 () Bool)

(assert (=> b!1569911 m!1444581))

(declare-fun m!1444583 () Bool)

(assert (=> d!164277 m!1444583))

(assert (=> d!164277 m!1444515))

(assert (=> b!1569915 m!1444573))

(assert (=> b!1569908 m!1444579))

(assert (=> b!1569908 m!1444579))

(assert (=> b!1569908 m!1444581))

(declare-fun m!1444585 () Bool)

(assert (=> b!1569910 m!1444585))

(declare-fun m!1444587 () Bool)

(assert (=> b!1569910 m!1444587))

(declare-fun m!1444589 () Bool)

(assert (=> b!1569910 m!1444589))

(assert (=> b!1569910 m!1444579))

(assert (=> b!1569910 m!1444579))

(declare-fun m!1444591 () Bool)

(assert (=> b!1569910 m!1444591))

(assert (=> b!1569910 m!1444587))

(assert (=> b!1569910 m!1444585))

(assert (=> b!1569913 m!1444579))

(assert (=> b!1569913 m!1444579))

(declare-fun m!1444593 () Bool)

(assert (=> b!1569913 m!1444593))

(declare-fun m!1444595 () Bool)

(assert (=> b!1569916 m!1444595))

(declare-fun m!1444597 () Bool)

(assert (=> b!1569916 m!1444597))

(assert (=> b!1569916 m!1444585))

(assert (=> b!1569916 m!1444587))

(assert (=> b!1569916 m!1444589))

(assert (=> b!1569916 m!1444579))

(declare-fun m!1444599 () Bool)

(assert (=> b!1569916 m!1444599))

(declare-fun m!1444601 () Bool)

(assert (=> b!1569916 m!1444601))

(assert (=> b!1569916 m!1444595))

(assert (=> b!1569916 m!1444587))

(assert (=> b!1569916 m!1444585))

(assert (=> b!1569806 d!164277))

(declare-fun d!164279 () Bool)

(assert (=> d!164279 (= (validKeyInArray!0 (select (arr!50584 _keys!637) from!782)) (and (not (= (select (arr!50584 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50584 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1569810 d!164279))

(declare-fun b!1569930 () Bool)

(declare-fun e!875281 () Bool)

(declare-fun e!875282 () Bool)

(assert (=> b!1569930 (= e!875281 e!875282)))

(declare-fun c!145303 () Bool)

(assert (=> b!1569930 (= c!145303 (validKeyInArray!0 (select (arr!50584 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1569931 () Bool)

(declare-fun call!72086 () Bool)

(assert (=> b!1569931 (= e!875282 call!72086)))

(declare-fun b!1569933 () Bool)

(declare-fun e!875280 () Bool)

(assert (=> b!1569933 (= e!875280 e!875281)))

(declare-fun res!1072138 () Bool)

(assert (=> b!1569933 (=> (not res!1072138) (not e!875281))))

(declare-fun e!875283 () Bool)

(assert (=> b!1569933 (= res!1072138 (not e!875283))))

(declare-fun res!1072137 () Bool)

(assert (=> b!1569933 (=> (not res!1072137) (not e!875283))))

(assert (=> b!1569933 (= res!1072137 (validKeyInArray!0 (select (arr!50584 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!72083 () Bool)

(assert (=> bm!72083 (= call!72086 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145303 (Cons!36687 (select (arr!50584 _keys!637) #b00000000000000000000000000000000) Nil!36688) Nil!36688)))))

(declare-fun b!1569934 () Bool)

(assert (=> b!1569934 (= e!875282 call!72086)))

(declare-fun b!1569932 () Bool)

(declare-fun contains!10411 (List!36691 (_ BitVec 64)) Bool)

(assert (=> b!1569932 (= e!875283 (contains!10411 Nil!36688 (select (arr!50584 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!164281 () Bool)

(declare-fun res!1072136 () Bool)

(assert (=> d!164281 (=> res!1072136 e!875280)))

(assert (=> d!164281 (= res!1072136 (bvsge #b00000000000000000000000000000000 (size!51135 _keys!637)))))

(assert (=> d!164281 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36688) e!875280)))

(assert (= (and d!164281 (not res!1072136)) b!1569933))

(assert (= (and b!1569933 res!1072137) b!1569932))

(assert (= (and b!1569933 res!1072138) b!1569930))

(assert (= (and b!1569930 c!145303) b!1569934))

(assert (= (and b!1569930 (not c!145303)) b!1569931))

(assert (= (or b!1569934 b!1569931) bm!72083))

(declare-fun m!1444603 () Bool)

(assert (=> b!1569930 m!1444603))

(assert (=> b!1569930 m!1444603))

(declare-fun m!1444605 () Bool)

(assert (=> b!1569930 m!1444605))

(assert (=> b!1569933 m!1444603))

(assert (=> b!1569933 m!1444603))

(assert (=> b!1569933 m!1444605))

(assert (=> bm!72083 m!1444603))

(declare-fun m!1444607 () Bool)

(assert (=> bm!72083 m!1444607))

(assert (=> b!1569932 m!1444603))

(assert (=> b!1569932 m!1444603))

(declare-fun m!1444609 () Bool)

(assert (=> b!1569932 m!1444609))

(assert (=> b!1569811 d!164281))

(declare-fun d!164283 () Bool)

(declare-fun e!875285 () Bool)

(assert (=> d!164283 e!875285))

(declare-fun res!1072139 () Bool)

(assert (=> d!164283 (=> res!1072139 e!875285)))

(declare-fun lt!673882 () Bool)

(assert (=> d!164283 (= res!1072139 (not lt!673882))))

(declare-fun lt!673881 () Bool)

(assert (=> d!164283 (= lt!673882 lt!673881)))

(declare-fun lt!673884 () Unit!51968)

(declare-fun e!875284 () Unit!51968)

(assert (=> d!164283 (= lt!673884 e!875284)))

(declare-fun c!145304 () Bool)

(assert (=> d!164283 (= c!145304 lt!673881)))

(assert (=> d!164283 (= lt!673881 (containsKey!853 (toList!11402 lt!673841) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164283 (= (contains!10408 lt!673841 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673882)))

(declare-fun b!1569935 () Bool)

(declare-fun lt!673883 () Unit!51968)

(assert (=> b!1569935 (= e!875284 lt!673883)))

(assert (=> b!1569935 (= lt!673883 (lemmaContainsKeyImpliesGetValueByKeyDefined!536 (toList!11402 lt!673841) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1569935 (isDefined!582 (getValueByKey!791 (toList!11402 lt!673841) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569936 () Bool)

(declare-fun Unit!51971 () Unit!51968)

(assert (=> b!1569936 (= e!875284 Unit!51971)))

(declare-fun b!1569937 () Bool)

(assert (=> b!1569937 (= e!875285 (isDefined!582 (getValueByKey!791 (toList!11402 lt!673841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164283 c!145304) b!1569935))

(assert (= (and d!164283 (not c!145304)) b!1569936))

(assert (= (and d!164283 (not res!1072139)) b!1569937))

(declare-fun m!1444611 () Bool)

(assert (=> d!164283 m!1444611))

(declare-fun m!1444613 () Bool)

(assert (=> b!1569935 m!1444613))

(declare-fun m!1444615 () Bool)

(assert (=> b!1569935 m!1444615))

(assert (=> b!1569935 m!1444615))

(declare-fun m!1444617 () Bool)

(assert (=> b!1569935 m!1444617))

(assert (=> b!1569937 m!1444615))

(assert (=> b!1569937 m!1444615))

(assert (=> b!1569937 m!1444617))

(assert (=> b!1569808 d!164283))

(declare-fun bm!72086 () Bool)

(declare-fun call!72089 () Bool)

(assert (=> bm!72086 (= call!72089 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1569946 () Bool)

(declare-fun e!875294 () Bool)

(declare-fun e!875292 () Bool)

(assert (=> b!1569946 (= e!875294 e!875292)))

(declare-fun c!145307 () Bool)

(assert (=> b!1569946 (= c!145307 (validKeyInArray!0 (select (arr!50584 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1569948 () Bool)

(assert (=> b!1569948 (= e!875292 call!72089)))

(declare-fun b!1569949 () Bool)

(declare-fun e!875293 () Bool)

(assert (=> b!1569949 (= e!875293 call!72089)))

(declare-fun b!1569947 () Bool)

(assert (=> b!1569947 (= e!875292 e!875293)))

(declare-fun lt!673893 () (_ BitVec 64))

(assert (=> b!1569947 (= lt!673893 (select (arr!50584 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!673891 () Unit!51968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104814 (_ BitVec 64) (_ BitVec 32)) Unit!51968)

(assert (=> b!1569947 (= lt!673891 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673893 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1569947 (arrayContainsKey!0 _keys!637 lt!673893 #b00000000000000000000000000000000)))

(declare-fun lt!673892 () Unit!51968)

(assert (=> b!1569947 (= lt!673892 lt!673891)))

(declare-fun res!1072145 () Bool)

(declare-datatypes ((SeekEntryResult!13477 0))(
  ( (MissingZero!13477 (index!56306 (_ BitVec 32))) (Found!13477 (index!56307 (_ BitVec 32))) (Intermediate!13477 (undefined!14289 Bool) (index!56308 (_ BitVec 32)) (x!140840 (_ BitVec 32))) (Undefined!13477) (MissingVacant!13477 (index!56309 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104814 (_ BitVec 32)) SeekEntryResult!13477)

(assert (=> b!1569947 (= res!1072145 (= (seekEntryOrOpen!0 (select (arr!50584 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13477 #b00000000000000000000000000000000)))))

(assert (=> b!1569947 (=> (not res!1072145) (not e!875293))))

(declare-fun d!164285 () Bool)

(declare-fun res!1072144 () Bool)

(assert (=> d!164285 (=> res!1072144 e!875294)))

(assert (=> d!164285 (= res!1072144 (bvsge #b00000000000000000000000000000000 (size!51135 _keys!637)))))

(assert (=> d!164285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!875294)))

(assert (= (and d!164285 (not res!1072144)) b!1569946))

(assert (= (and b!1569946 c!145307) b!1569947))

(assert (= (and b!1569946 (not c!145307)) b!1569948))

(assert (= (and b!1569947 res!1072145) b!1569949))

(assert (= (or b!1569949 b!1569948) bm!72086))

(declare-fun m!1444619 () Bool)

(assert (=> bm!72086 m!1444619))

(assert (=> b!1569946 m!1444603))

(assert (=> b!1569946 m!1444603))

(assert (=> b!1569946 m!1444605))

(assert (=> b!1569947 m!1444603))

(declare-fun m!1444621 () Bool)

(assert (=> b!1569947 m!1444621))

(declare-fun m!1444623 () Bool)

(assert (=> b!1569947 m!1444623))

(assert (=> b!1569947 m!1444603))

(declare-fun m!1444625 () Bool)

(assert (=> b!1569947 m!1444625))

(assert (=> b!1569804 d!164285))

(declare-fun b!1569957 () Bool)

(declare-fun e!875300 () Bool)

(assert (=> b!1569957 (= e!875300 tp_is_empty!39001)))

(declare-fun mapIsEmpty!59913 () Bool)

(declare-fun mapRes!59913 () Bool)

(assert (=> mapIsEmpty!59913 mapRes!59913))

(declare-fun condMapEmpty!59913 () Bool)

(declare-fun mapDefault!59913 () ValueCell!18470)

(assert (=> mapNonEmpty!59904 (= condMapEmpty!59913 (= mapRest!59904 ((as const (Array (_ BitVec 32) ValueCell!18470)) mapDefault!59913)))))

(assert (=> mapNonEmpty!59904 (= tp!113985 (and e!875300 mapRes!59913))))

(declare-fun b!1569956 () Bool)

(declare-fun e!875299 () Bool)

(assert (=> b!1569956 (= e!875299 tp_is_empty!39001)))

(declare-fun mapNonEmpty!59913 () Bool)

(declare-fun tp!114000 () Bool)

(assert (=> mapNonEmpty!59913 (= mapRes!59913 (and tp!114000 e!875299))))

(declare-fun mapRest!59913 () (Array (_ BitVec 32) ValueCell!18470))

(declare-fun mapValue!59913 () ValueCell!18470)

(declare-fun mapKey!59913 () (_ BitVec 32))

(assert (=> mapNonEmpty!59913 (= mapRest!59904 (store mapRest!59913 mapKey!59913 mapValue!59913))))

(assert (= (and mapNonEmpty!59904 condMapEmpty!59913) mapIsEmpty!59913))

(assert (= (and mapNonEmpty!59904 (not condMapEmpty!59913)) mapNonEmpty!59913))

(assert (= (and mapNonEmpty!59913 ((_ is ValueCellFull!18470) mapValue!59913)) b!1569956))

(assert (= (and mapNonEmpty!59904 ((_ is ValueCellFull!18470) mapDefault!59913)) b!1569957))

(declare-fun m!1444627 () Bool)

(assert (=> mapNonEmpty!59913 m!1444627))

(declare-fun b_lambda!25037 () Bool)

(assert (= b_lambda!25035 (or (and start!134522 b_free!32221) b_lambda!25037)))

(declare-fun b_lambda!25039 () Bool)

(assert (= b_lambda!25033 (or (and start!134522 b_free!32221) b_lambda!25039)))

(check-sat b_and!51879 (not d!164275) (not b!1569911) (not b!1569910) (not b_next!32221) (not b!1569915) (not b!1569947) (not b!1569937) (not b!1569932) (not b_lambda!25039) (not b!1569913) (not b_lambda!25037) (not b!1569930) (not b!1569906) (not d!164277) (not b!1569933) tp_is_empty!39001 (not b!1569881) (not b!1569935) (not mapNonEmpty!59913) (not bm!72083) (not bm!72080) (not b!1569909) (not b!1569946) (not b!1569879) (not bm!72086) (not d!164283) (not b!1569916) (not b!1569908))
(check-sat b_and!51879 (not b_next!32221))
