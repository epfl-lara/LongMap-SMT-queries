; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113028 () Bool)

(assert start!113028)

(declare-fun b_free!31057 () Bool)

(declare-fun b_next!31057 () Bool)

(assert (=> start!113028 (= b_free!31057 (not b_next!31057))))

(declare-fun tp!108818 () Bool)

(declare-fun b_and!50063 () Bool)

(assert (=> start!113028 (= tp!108818 b_and!50063)))

(declare-fun b!1339197 () Bool)

(declare-fun e!762647 () Bool)

(declare-fun tp_is_empty!36967 () Bool)

(assert (=> b!1339197 (= e!762647 tp_is_empty!36967)))

(declare-fun b!1339198 () Bool)

(declare-fun res!888301 () Bool)

(declare-fun e!762648 () Bool)

(assert (=> b!1339198 (=> (not res!888301) (not e!762648))))

(declare-datatypes ((V!54393 0))(
  ( (V!54394 (val!18558 Int)) )
))
(declare-datatypes ((ValueCell!17585 0))(
  ( (ValueCellFull!17585 (v!21197 V!54393)) (EmptyCell!17585) )
))
(declare-datatypes ((array!90911 0))(
  ( (array!90912 (arr!43914 (Array (_ BitVec 32) ValueCell!17585)) (size!44465 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90911)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90913 0))(
  ( (array!90914 (arr!43915 (Array (_ BitVec 32) (_ BitVec 64))) (size!44466 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90913)

(assert (=> b!1339198 (= res!888301 (and (= (size!44465 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44466 _keys!1590) (size!44465 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1339199 () Bool)

(declare-fun res!888303 () Bool)

(assert (=> b!1339199 (=> (not res!888303) (not e!762648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90913 (_ BitVec 32)) Bool)

(assert (=> b!1339199 (= res!888303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!57135 () Bool)

(declare-fun mapRes!57135 () Bool)

(assert (=> mapIsEmpty!57135 mapRes!57135))

(declare-fun b!1339200 () Bool)

(declare-fun e!762645 () Bool)

(assert (=> b!1339200 (= e!762645 tp_is_empty!36967)))

(declare-fun b!1339201 () Bool)

(declare-fun res!888300 () Bool)

(declare-fun e!762649 () Bool)

(assert (=> b!1339201 (=> (not res!888300) (not e!762649))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1339201 (= res!888300 (not (= k0!1153 (select (arr!43915 _keys!1590) from!1980))))))

(declare-fun b!1339202 () Bool)

(declare-fun res!888307 () Bool)

(assert (=> b!1339202 (=> (not res!888307) (not e!762648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1339202 (= res!888307 (validKeyInArray!0 (select (arr!43915 _keys!1590) from!1980)))))

(declare-fun b!1339203 () Bool)

(declare-fun res!888299 () Bool)

(assert (=> b!1339203 (=> (not res!888299) (not e!762648))))

(assert (=> b!1339203 (= res!888299 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1339204 () Bool)

(assert (=> b!1339204 (= e!762648 e!762649)))

(declare-fun res!888306 () Bool)

(assert (=> b!1339204 (=> (not res!888306) (not e!762649))))

(declare-fun lt!593820 () V!54393)

(declare-datatypes ((tuple2!23988 0))(
  ( (tuple2!23989 (_1!12005 (_ BitVec 64)) (_2!12005 V!54393)) )
))
(declare-datatypes ((List!31126 0))(
  ( (Nil!31123) (Cons!31122 (h!32340 tuple2!23988) (t!45444 List!31126)) )
))
(declare-datatypes ((ListLongMap!21653 0))(
  ( (ListLongMap!21654 (toList!10842 List!31126)) )
))
(declare-fun lt!593819 () ListLongMap!21653)

(declare-fun contains!9023 (ListLongMap!21653 (_ BitVec 64)) Bool)

(declare-fun +!4787 (ListLongMap!21653 tuple2!23988) ListLongMap!21653)

(assert (=> b!1339204 (= res!888306 (contains!9023 (+!4787 lt!593819 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54393)

(declare-fun minValue!1262 () V!54393)

(declare-fun getCurrentListMapNoExtraKeys!6436 (array!90913 array!90911 (_ BitVec 32) (_ BitVec 32) V!54393 V!54393 (_ BitVec 32) Int) ListLongMap!21653)

(assert (=> b!1339204 (= lt!593819 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22180 (ValueCell!17585 V!54393) V!54393)

(declare-fun dynLambda!3741 (Int (_ BitVec 64)) V!54393)

(assert (=> b!1339204 (= lt!593820 (get!22180 (select (arr!43914 _values!1320) from!1980) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1339205 () Bool)

(declare-fun e!762650 () Bool)

(assert (=> b!1339205 (= e!762650 (and e!762647 mapRes!57135))))

(declare-fun condMapEmpty!57135 () Bool)

(declare-fun mapDefault!57135 () ValueCell!17585)

(assert (=> b!1339205 (= condMapEmpty!57135 (= (arr!43914 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17585)) mapDefault!57135)))))

(declare-fun b!1339206 () Bool)

(declare-fun res!888304 () Bool)

(assert (=> b!1339206 (=> (not res!888304) (not e!762648))))

(declare-datatypes ((List!31127 0))(
  ( (Nil!31124) (Cons!31123 (h!32341 (_ BitVec 64)) (t!45445 List!31127)) )
))
(declare-fun arrayNoDuplicates!0 (array!90913 (_ BitVec 32) List!31127) Bool)

(assert (=> b!1339206 (= res!888304 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31124))))

(declare-fun b!1339196 () Bool)

(declare-fun res!888308 () Bool)

(assert (=> b!1339196 (=> (not res!888308) (not e!762648))))

(declare-fun getCurrentListMap!5795 (array!90913 array!90911 (_ BitVec 32) (_ BitVec 32) V!54393 V!54393 (_ BitVec 32) Int) ListLongMap!21653)

(assert (=> b!1339196 (= res!888308 (contains!9023 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!888302 () Bool)

(assert (=> start!113028 (=> (not res!888302) (not e!762648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113028 (= res!888302 (validMask!0 mask!1998))))

(assert (=> start!113028 e!762648))

(declare-fun array_inv!33379 (array!90911) Bool)

(assert (=> start!113028 (and (array_inv!33379 _values!1320) e!762650)))

(assert (=> start!113028 true))

(declare-fun array_inv!33380 (array!90913) Bool)

(assert (=> start!113028 (array_inv!33380 _keys!1590)))

(assert (=> start!113028 tp!108818))

(assert (=> start!113028 tp_is_empty!36967))

(declare-fun b!1339207 () Bool)

(declare-fun res!888305 () Bool)

(assert (=> b!1339207 (=> (not res!888305) (not e!762648))))

(assert (=> b!1339207 (= res!888305 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44466 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57135 () Bool)

(declare-fun tp!108819 () Bool)

(assert (=> mapNonEmpty!57135 (= mapRes!57135 (and tp!108819 e!762645))))

(declare-fun mapKey!57135 () (_ BitVec 32))

(declare-fun mapValue!57135 () ValueCell!17585)

(declare-fun mapRest!57135 () (Array (_ BitVec 32) ValueCell!17585))

(assert (=> mapNonEmpty!57135 (= (arr!43914 _values!1320) (store mapRest!57135 mapKey!57135 mapValue!57135))))

(declare-fun b!1339208 () Bool)

(declare-fun res!888309 () Bool)

(assert (=> b!1339208 (=> (not res!888309) (not e!762648))))

(assert (=> b!1339208 (= res!888309 (not (= (select (arr!43915 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1339209 () Bool)

(assert (=> b!1339209 (= e!762649 (not (contains!9023 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(assert (=> b!1339209 (contains!9023 lt!593819 k0!1153)))

(declare-datatypes ((Unit!43894 0))(
  ( (Unit!43895) )
))
(declare-fun lt!593821 () Unit!43894)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!317 ((_ BitVec 64) (_ BitVec 64) V!54393 ListLongMap!21653) Unit!43894)

(assert (=> b!1339209 (= lt!593821 (lemmaInListMapAfterAddingDiffThenInBefore!317 k0!1153 (select (arr!43915 _keys!1590) from!1980) lt!593820 lt!593819))))

(assert (= (and start!113028 res!888302) b!1339198))

(assert (= (and b!1339198 res!888301) b!1339199))

(assert (= (and b!1339199 res!888303) b!1339206))

(assert (= (and b!1339206 res!888304) b!1339207))

(assert (= (and b!1339207 res!888305) b!1339196))

(assert (= (and b!1339196 res!888308) b!1339208))

(assert (= (and b!1339208 res!888309) b!1339202))

(assert (= (and b!1339202 res!888307) b!1339203))

(assert (= (and b!1339203 res!888299) b!1339204))

(assert (= (and b!1339204 res!888306) b!1339201))

(assert (= (and b!1339201 res!888300) b!1339209))

(assert (= (and b!1339205 condMapEmpty!57135) mapIsEmpty!57135))

(assert (= (and b!1339205 (not condMapEmpty!57135)) mapNonEmpty!57135))

(get-info :version)

(assert (= (and mapNonEmpty!57135 ((_ is ValueCellFull!17585) mapValue!57135)) b!1339200))

(assert (= (and b!1339205 ((_ is ValueCellFull!17585) mapDefault!57135)) b!1339197))

(assert (= start!113028 b!1339205))

(declare-fun b_lambda!24245 () Bool)

(assert (=> (not b_lambda!24245) (not b!1339204)))

(declare-fun t!45443 () Bool)

(declare-fun tb!12121 () Bool)

(assert (=> (and start!113028 (= defaultEntry!1323 defaultEntry!1323) t!45443) tb!12121))

(declare-fun result!25327 () Bool)

(assert (=> tb!12121 (= result!25327 tp_is_empty!36967)))

(assert (=> b!1339204 t!45443))

(declare-fun b_and!50065 () Bool)

(assert (= b_and!50063 (and (=> t!45443 result!25327) b_and!50065)))

(declare-fun m!1227635 () Bool)

(assert (=> b!1339196 m!1227635))

(assert (=> b!1339196 m!1227635))

(declare-fun m!1227637 () Bool)

(assert (=> b!1339196 m!1227637))

(declare-fun m!1227639 () Bool)

(assert (=> b!1339202 m!1227639))

(assert (=> b!1339202 m!1227639))

(declare-fun m!1227641 () Bool)

(assert (=> b!1339202 m!1227641))

(declare-fun m!1227643 () Bool)

(assert (=> b!1339204 m!1227643))

(declare-fun m!1227645 () Bool)

(assert (=> b!1339204 m!1227645))

(assert (=> b!1339204 m!1227643))

(declare-fun m!1227647 () Bool)

(assert (=> b!1339204 m!1227647))

(declare-fun m!1227649 () Bool)

(assert (=> b!1339204 m!1227649))

(declare-fun m!1227651 () Bool)

(assert (=> b!1339204 m!1227651))

(assert (=> b!1339204 m!1227649))

(declare-fun m!1227653 () Bool)

(assert (=> b!1339204 m!1227653))

(assert (=> b!1339204 m!1227645))

(assert (=> b!1339204 m!1227639))

(declare-fun m!1227655 () Bool)

(assert (=> start!113028 m!1227655))

(declare-fun m!1227657 () Bool)

(assert (=> start!113028 m!1227657))

(declare-fun m!1227659 () Bool)

(assert (=> start!113028 m!1227659))

(declare-fun m!1227661 () Bool)

(assert (=> mapNonEmpty!57135 m!1227661))

(declare-fun m!1227663 () Bool)

(assert (=> b!1339209 m!1227663))

(declare-fun m!1227665 () Bool)

(assert (=> b!1339209 m!1227665))

(declare-fun m!1227667 () Bool)

(assert (=> b!1339209 m!1227667))

(assert (=> b!1339209 m!1227639))

(assert (=> b!1339209 m!1227639))

(declare-fun m!1227669 () Bool)

(assert (=> b!1339209 m!1227669))

(assert (=> b!1339209 m!1227665))

(assert (=> b!1339208 m!1227639))

(declare-fun m!1227671 () Bool)

(assert (=> b!1339199 m!1227671))

(declare-fun m!1227673 () Bool)

(assert (=> b!1339206 m!1227673))

(assert (=> b!1339201 m!1227639))

(check-sat (not start!113028) (not b!1339202) (not b_lambda!24245) (not b_next!31057) (not b!1339199) (not b!1339196) b_and!50065 (not b!1339204) (not b!1339209) (not b!1339206) (not mapNonEmpty!57135) tp_is_empty!36967)
(check-sat b_and!50065 (not b_next!31057))
(get-model)

(declare-fun b_lambda!24251 () Bool)

(assert (= b_lambda!24245 (or (and start!113028 b_free!31057) b_lambda!24251)))

(check-sat (not b!1339202) (not b_next!31057) (not b!1339199) (not b!1339196) b_and!50065 (not b!1339204) (not start!113028) (not b_lambda!24251) (not b!1339209) (not b!1339206) (not mapNonEmpty!57135) tp_is_empty!36967)
(check-sat b_and!50065 (not b_next!31057))
(get-model)

(declare-fun d!144327 () Bool)

(assert (=> d!144327 (= (validKeyInArray!0 (select (arr!43915 _keys!1590) from!1980)) (and (not (= (select (arr!43915 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43915 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1339202 d!144327))

(declare-fun d!144329 () Bool)

(assert (=> d!144329 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!113028 d!144329))

(declare-fun d!144331 () Bool)

(assert (=> d!144331 (= (array_inv!33379 _values!1320) (bvsge (size!44465 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!113028 d!144331))

(declare-fun d!144333 () Bool)

(assert (=> d!144333 (= (array_inv!33380 _keys!1590) (bvsge (size!44466 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!113028 d!144333))

(declare-fun d!144335 () Bool)

(declare-fun e!762691 () Bool)

(assert (=> d!144335 e!762691))

(declare-fun res!888378 () Bool)

(assert (=> d!144335 (=> res!888378 e!762691)))

(declare-fun lt!593849 () Bool)

(assert (=> d!144335 (= res!888378 (not lt!593849))))

(declare-fun lt!593848 () Bool)

(assert (=> d!144335 (= lt!593849 lt!593848)))

(declare-fun lt!593850 () Unit!43894)

(declare-fun e!762692 () Unit!43894)

(assert (=> d!144335 (= lt!593850 e!762692)))

(declare-fun c!126555 () Bool)

(assert (=> d!144335 (= c!126555 lt!593848)))

(declare-fun containsKey!740 (List!31126 (_ BitVec 64)) Bool)

(assert (=> d!144335 (= lt!593848 (containsKey!740 (toList!10842 (+!4787 lt!593819 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))) k0!1153))))

(assert (=> d!144335 (= (contains!9023 (+!4787 lt!593819 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820)) k0!1153) lt!593849)))

(declare-fun b!1339306 () Bool)

(declare-fun lt!593851 () Unit!43894)

(assert (=> b!1339306 (= e!762692 lt!593851)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!486 (List!31126 (_ BitVec 64)) Unit!43894)

(assert (=> b!1339306 (= lt!593851 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10842 (+!4787 lt!593819 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))) k0!1153))))

(declare-datatypes ((Option!765 0))(
  ( (Some!764 (v!21200 V!54393)) (None!763) )
))
(declare-fun isDefined!523 (Option!765) Bool)

(declare-fun getValueByKey!714 (List!31126 (_ BitVec 64)) Option!765)

(assert (=> b!1339306 (isDefined!523 (getValueByKey!714 (toList!10842 (+!4787 lt!593819 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))) k0!1153))))

(declare-fun b!1339307 () Bool)

(declare-fun Unit!43900 () Unit!43894)

(assert (=> b!1339307 (= e!762692 Unit!43900)))

(declare-fun b!1339308 () Bool)

(assert (=> b!1339308 (= e!762691 (isDefined!523 (getValueByKey!714 (toList!10842 (+!4787 lt!593819 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))) k0!1153)))))

(assert (= (and d!144335 c!126555) b!1339306))

(assert (= (and d!144335 (not c!126555)) b!1339307))

(assert (= (and d!144335 (not res!888378)) b!1339308))

(declare-fun m!1227755 () Bool)

(assert (=> d!144335 m!1227755))

(declare-fun m!1227757 () Bool)

(assert (=> b!1339306 m!1227757))

(declare-fun m!1227759 () Bool)

(assert (=> b!1339306 m!1227759))

(assert (=> b!1339306 m!1227759))

(declare-fun m!1227761 () Bool)

(assert (=> b!1339306 m!1227761))

(assert (=> b!1339308 m!1227759))

(assert (=> b!1339308 m!1227759))

(assert (=> b!1339308 m!1227761))

(assert (=> b!1339204 d!144335))

(declare-fun d!144337 () Bool)

(declare-fun e!762695 () Bool)

(assert (=> d!144337 e!762695))

(declare-fun res!888383 () Bool)

(assert (=> d!144337 (=> (not res!888383) (not e!762695))))

(declare-fun lt!593861 () ListLongMap!21653)

(assert (=> d!144337 (= res!888383 (contains!9023 lt!593861 (_1!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))))))

(declare-fun lt!593863 () List!31126)

(assert (=> d!144337 (= lt!593861 (ListLongMap!21654 lt!593863))))

(declare-fun lt!593862 () Unit!43894)

(declare-fun lt!593860 () Unit!43894)

(assert (=> d!144337 (= lt!593862 lt!593860)))

(assert (=> d!144337 (= (getValueByKey!714 lt!593863 (_1!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))) (Some!764 (_2!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))))))

(declare-fun lemmaContainsTupThenGetReturnValue!364 (List!31126 (_ BitVec 64) V!54393) Unit!43894)

(assert (=> d!144337 (= lt!593860 (lemmaContainsTupThenGetReturnValue!364 lt!593863 (_1!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820)) (_2!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))))))

(declare-fun insertStrictlySorted!493 (List!31126 (_ BitVec 64) V!54393) List!31126)

(assert (=> d!144337 (= lt!593863 (insertStrictlySorted!493 (toList!10842 lt!593819) (_1!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820)) (_2!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))))))

(assert (=> d!144337 (= (+!4787 lt!593819 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820)) lt!593861)))

(declare-fun b!1339313 () Bool)

(declare-fun res!888384 () Bool)

(assert (=> b!1339313 (=> (not res!888384) (not e!762695))))

(assert (=> b!1339313 (= res!888384 (= (getValueByKey!714 (toList!10842 lt!593861) (_1!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820))) (Some!764 (_2!12005 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820)))))))

(declare-fun b!1339314 () Bool)

(declare-fun contains!9026 (List!31126 tuple2!23988) Bool)

(assert (=> b!1339314 (= e!762695 (contains!9026 (toList!10842 lt!593861) (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820)))))

(assert (= (and d!144337 res!888383) b!1339313))

(assert (= (and b!1339313 res!888384) b!1339314))

(declare-fun m!1227763 () Bool)

(assert (=> d!144337 m!1227763))

(declare-fun m!1227765 () Bool)

(assert (=> d!144337 m!1227765))

(declare-fun m!1227767 () Bool)

(assert (=> d!144337 m!1227767))

(declare-fun m!1227769 () Bool)

(assert (=> d!144337 m!1227769))

(declare-fun m!1227771 () Bool)

(assert (=> b!1339313 m!1227771))

(declare-fun m!1227773 () Bool)

(assert (=> b!1339314 m!1227773))

(assert (=> b!1339204 d!144337))

(declare-fun lt!593880 () ListLongMap!21653)

(declare-fun e!762710 () Bool)

(declare-fun b!1339339 () Bool)

(assert (=> b!1339339 (= e!762710 (= lt!593880 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1339340 () Bool)

(declare-fun res!888393 () Bool)

(declare-fun e!762711 () Bool)

(assert (=> b!1339340 (=> (not res!888393) (not e!762711))))

(assert (=> b!1339340 (= res!888393 (not (contains!9023 lt!593880 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!144339 () Bool)

(assert (=> d!144339 e!762711))

(declare-fun res!888395 () Bool)

(assert (=> d!144339 (=> (not res!888395) (not e!762711))))

(assert (=> d!144339 (= res!888395 (not (contains!9023 lt!593880 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!762715 () ListLongMap!21653)

(assert (=> d!144339 (= lt!593880 e!762715)))

(declare-fun c!126565 () Bool)

(assert (=> d!144339 (= c!126565 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(assert (=> d!144339 (validMask!0 mask!1998)))

(assert (=> d!144339 (= (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593880)))

(declare-fun b!1339341 () Bool)

(assert (=> b!1339341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(assert (=> b!1339341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44465 _values!1320)))))

(declare-fun e!762713 () Bool)

(declare-fun apply!1044 (ListLongMap!21653 (_ BitVec 64)) V!54393)

(assert (=> b!1339341 (= e!762713 (= (apply!1044 lt!593880 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22180 (select (arr!43914 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339342 () Bool)

(declare-fun e!762712 () Bool)

(assert (=> b!1339342 (= e!762712 e!762710)))

(declare-fun c!126564 () Bool)

(assert (=> b!1339342 (= c!126564 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(declare-fun b!1339343 () Bool)

(assert (=> b!1339343 (= e!762711 e!762712)))

(declare-fun c!126566 () Bool)

(declare-fun e!762714 () Bool)

(assert (=> b!1339343 (= c!126566 e!762714)))

(declare-fun res!888394 () Bool)

(assert (=> b!1339343 (=> (not res!888394) (not e!762714))))

(assert (=> b!1339343 (= res!888394 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(declare-fun b!1339344 () Bool)

(declare-fun lt!593879 () Unit!43894)

(declare-fun lt!593883 () Unit!43894)

(assert (=> b!1339344 (= lt!593879 lt!593883)))

(declare-fun lt!593878 () (_ BitVec 64))

(declare-fun lt!593882 () (_ BitVec 64))

(declare-fun lt!593884 () V!54393)

(declare-fun lt!593881 () ListLongMap!21653)

(assert (=> b!1339344 (not (contains!9023 (+!4787 lt!593881 (tuple2!23989 lt!593878 lt!593884)) lt!593882))))

(declare-fun addStillNotContains!500 (ListLongMap!21653 (_ BitVec 64) V!54393 (_ BitVec 64)) Unit!43894)

(assert (=> b!1339344 (= lt!593883 (addStillNotContains!500 lt!593881 lt!593878 lt!593884 lt!593882))))

(assert (=> b!1339344 (= lt!593882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1339344 (= lt!593884 (get!22180 (select (arr!43914 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1339344 (= lt!593878 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun call!65016 () ListLongMap!21653)

(assert (=> b!1339344 (= lt!593881 call!65016)))

(declare-fun e!762716 () ListLongMap!21653)

(assert (=> b!1339344 (= e!762716 (+!4787 call!65016 (tuple2!23989 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22180 (select (arr!43914 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!65013 () Bool)

(assert (=> bm!65013 (= call!65016 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1339345 () Bool)

(assert (=> b!1339345 (= e!762715 e!762716)))

(declare-fun c!126567 () Bool)

(assert (=> b!1339345 (= c!126567 (validKeyInArray!0 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1339346 () Bool)

(assert (=> b!1339346 (= e!762712 e!762713)))

(assert (=> b!1339346 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(declare-fun res!888396 () Bool)

(assert (=> b!1339346 (= res!888396 (contains!9023 lt!593880 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1339346 (=> (not res!888396) (not e!762713))))

(declare-fun b!1339347 () Bool)

(assert (=> b!1339347 (= e!762715 (ListLongMap!21654 Nil!31123))))

(declare-fun b!1339348 () Bool)

(declare-fun isEmpty!1092 (ListLongMap!21653) Bool)

(assert (=> b!1339348 (= e!762710 (isEmpty!1092 lt!593880))))

(declare-fun b!1339349 () Bool)

(assert (=> b!1339349 (= e!762714 (validKeyInArray!0 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1339349 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1339350 () Bool)

(assert (=> b!1339350 (= e!762716 call!65016)))

(assert (= (and d!144339 c!126565) b!1339347))

(assert (= (and d!144339 (not c!126565)) b!1339345))

(assert (= (and b!1339345 c!126567) b!1339344))

(assert (= (and b!1339345 (not c!126567)) b!1339350))

(assert (= (or b!1339344 b!1339350) bm!65013))

(assert (= (and d!144339 res!888395) b!1339340))

(assert (= (and b!1339340 res!888393) b!1339343))

(assert (= (and b!1339343 res!888394) b!1339349))

(assert (= (and b!1339343 c!126566) b!1339346))

(assert (= (and b!1339343 (not c!126566)) b!1339342))

(assert (= (and b!1339346 res!888396) b!1339341))

(assert (= (and b!1339342 c!126564) b!1339339))

(assert (= (and b!1339342 (not c!126564)) b!1339348))

(declare-fun b_lambda!24253 () Bool)

(assert (=> (not b_lambda!24253) (not b!1339341)))

(assert (=> b!1339341 t!45443))

(declare-fun b_and!50075 () Bool)

(assert (= b_and!50065 (and (=> t!45443 result!25327) b_and!50075)))

(declare-fun b_lambda!24255 () Bool)

(assert (=> (not b_lambda!24255) (not b!1339344)))

(assert (=> b!1339344 t!45443))

(declare-fun b_and!50077 () Bool)

(assert (= b_and!50075 (and (=> t!45443 result!25327) b_and!50077)))

(declare-fun m!1227775 () Bool)

(assert (=> b!1339349 m!1227775))

(assert (=> b!1339349 m!1227775))

(declare-fun m!1227777 () Bool)

(assert (=> b!1339349 m!1227777))

(declare-fun m!1227779 () Bool)

(assert (=> b!1339341 m!1227779))

(assert (=> b!1339341 m!1227643))

(assert (=> b!1339341 m!1227775))

(assert (=> b!1339341 m!1227779))

(assert (=> b!1339341 m!1227643))

(declare-fun m!1227781 () Bool)

(assert (=> b!1339341 m!1227781))

(assert (=> b!1339341 m!1227775))

(declare-fun m!1227783 () Bool)

(assert (=> b!1339341 m!1227783))

(declare-fun m!1227785 () Bool)

(assert (=> b!1339340 m!1227785))

(declare-fun m!1227787 () Bool)

(assert (=> b!1339339 m!1227787))

(assert (=> b!1339345 m!1227775))

(assert (=> b!1339345 m!1227775))

(assert (=> b!1339345 m!1227777))

(assert (=> b!1339346 m!1227775))

(assert (=> b!1339346 m!1227775))

(declare-fun m!1227789 () Bool)

(assert (=> b!1339346 m!1227789))

(assert (=> bm!65013 m!1227787))

(declare-fun m!1227791 () Bool)

(assert (=> d!144339 m!1227791))

(assert (=> d!144339 m!1227655))

(declare-fun m!1227793 () Bool)

(assert (=> b!1339348 m!1227793))

(declare-fun m!1227795 () Bool)

(assert (=> b!1339344 m!1227795))

(declare-fun m!1227797 () Bool)

(assert (=> b!1339344 m!1227797))

(declare-fun m!1227799 () Bool)

(assert (=> b!1339344 m!1227799))

(assert (=> b!1339344 m!1227779))

(assert (=> b!1339344 m!1227643))

(assert (=> b!1339344 m!1227775))

(assert (=> b!1339344 m!1227779))

(assert (=> b!1339344 m!1227643))

(assert (=> b!1339344 m!1227781))

(assert (=> b!1339344 m!1227797))

(declare-fun m!1227801 () Bool)

(assert (=> b!1339344 m!1227801))

(assert (=> b!1339204 d!144339))

(declare-fun d!144341 () Bool)

(declare-fun c!126570 () Bool)

(assert (=> d!144341 (= c!126570 ((_ is ValueCellFull!17585) (select (arr!43914 _values!1320) from!1980)))))

(declare-fun e!762719 () V!54393)

(assert (=> d!144341 (= (get!22180 (select (arr!43914 _values!1320) from!1980) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762719)))

(declare-fun b!1339355 () Bool)

(declare-fun get!22183 (ValueCell!17585 V!54393) V!54393)

(assert (=> b!1339355 (= e!762719 (get!22183 (select (arr!43914 _values!1320) from!1980) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1339356 () Bool)

(declare-fun get!22184 (ValueCell!17585 V!54393) V!54393)

(assert (=> b!1339356 (= e!762719 (get!22184 (select (arr!43914 _values!1320) from!1980) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144341 c!126570) b!1339355))

(assert (= (and d!144341 (not c!126570)) b!1339356))

(assert (=> b!1339355 m!1227645))

(assert (=> b!1339355 m!1227643))

(declare-fun m!1227803 () Bool)

(assert (=> b!1339355 m!1227803))

(assert (=> b!1339356 m!1227645))

(assert (=> b!1339356 m!1227643))

(declare-fun m!1227805 () Bool)

(assert (=> b!1339356 m!1227805))

(assert (=> b!1339204 d!144341))

(declare-fun b!1339365 () Bool)

(declare-fun e!762726 () Bool)

(declare-fun call!65019 () Bool)

(assert (=> b!1339365 (= e!762726 call!65019)))

(declare-fun b!1339366 () Bool)

(declare-fun e!762728 () Bool)

(assert (=> b!1339366 (= e!762728 call!65019)))

(declare-fun b!1339367 () Bool)

(declare-fun e!762727 () Bool)

(assert (=> b!1339367 (= e!762727 e!762728)))

(declare-fun c!126573 () Bool)

(assert (=> b!1339367 (= c!126573 (validKeyInArray!0 (select (arr!43915 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1339368 () Bool)

(assert (=> b!1339368 (= e!762728 e!762726)))

(declare-fun lt!593892 () (_ BitVec 64))

(assert (=> b!1339368 (= lt!593892 (select (arr!43915 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!593893 () Unit!43894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90913 (_ BitVec 64) (_ BitVec 32)) Unit!43894)

(assert (=> b!1339368 (= lt!593893 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593892 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1339368 (arrayContainsKey!0 _keys!1590 lt!593892 #b00000000000000000000000000000000)))

(declare-fun lt!593891 () Unit!43894)

(assert (=> b!1339368 (= lt!593891 lt!593893)))

(declare-fun res!888402 () Bool)

(declare-datatypes ((SeekEntryResult!10006 0))(
  ( (MissingZero!10006 (index!42395 (_ BitVec 32))) (Found!10006 (index!42396 (_ BitVec 32))) (Intermediate!10006 (undefined!10818 Bool) (index!42397 (_ BitVec 32)) (x!119504 (_ BitVec 32))) (Undefined!10006) (MissingVacant!10006 (index!42398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90913 (_ BitVec 32)) SeekEntryResult!10006)

(assert (=> b!1339368 (= res!888402 (= (seekEntryOrOpen!0 (select (arr!43915 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10006 #b00000000000000000000000000000000)))))

(assert (=> b!1339368 (=> (not res!888402) (not e!762726))))

(declare-fun d!144343 () Bool)

(declare-fun res!888401 () Bool)

(assert (=> d!144343 (=> res!888401 e!762727)))

(assert (=> d!144343 (= res!888401 (bvsge #b00000000000000000000000000000000 (size!44466 _keys!1590)))))

(assert (=> d!144343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!762727)))

(declare-fun bm!65016 () Bool)

(assert (=> bm!65016 (= call!65019 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(assert (= (and d!144343 (not res!888401)) b!1339367))

(assert (= (and b!1339367 c!126573) b!1339368))

(assert (= (and b!1339367 (not c!126573)) b!1339366))

(assert (= (and b!1339368 res!888402) b!1339365))

(assert (= (or b!1339365 b!1339366) bm!65016))

(declare-fun m!1227807 () Bool)

(assert (=> b!1339367 m!1227807))

(assert (=> b!1339367 m!1227807))

(declare-fun m!1227809 () Bool)

(assert (=> b!1339367 m!1227809))

(assert (=> b!1339368 m!1227807))

(declare-fun m!1227811 () Bool)

(assert (=> b!1339368 m!1227811))

(declare-fun m!1227813 () Bool)

(assert (=> b!1339368 m!1227813))

(assert (=> b!1339368 m!1227807))

(declare-fun m!1227815 () Bool)

(assert (=> b!1339368 m!1227815))

(declare-fun m!1227817 () Bool)

(assert (=> bm!65016 m!1227817))

(assert (=> b!1339199 d!144343))

(declare-fun d!144345 () Bool)

(declare-fun e!762729 () Bool)

(assert (=> d!144345 e!762729))

(declare-fun res!888403 () Bool)

(assert (=> d!144345 (=> res!888403 e!762729)))

(declare-fun lt!593895 () Bool)

(assert (=> d!144345 (= res!888403 (not lt!593895))))

(declare-fun lt!593894 () Bool)

(assert (=> d!144345 (= lt!593895 lt!593894)))

(declare-fun lt!593896 () Unit!43894)

(declare-fun e!762730 () Unit!43894)

(assert (=> d!144345 (= lt!593896 e!762730)))

(declare-fun c!126574 () Bool)

(assert (=> d!144345 (= c!126574 lt!593894)))

(assert (=> d!144345 (= lt!593894 (containsKey!740 (toList!10842 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!144345 (= (contains!9023 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593895)))

(declare-fun b!1339369 () Bool)

(declare-fun lt!593897 () Unit!43894)

(assert (=> b!1339369 (= e!762730 lt!593897)))

(assert (=> b!1339369 (= lt!593897 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10842 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1339369 (isDefined!523 (getValueByKey!714 (toList!10842 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1339370 () Bool)

(declare-fun Unit!43901 () Unit!43894)

(assert (=> b!1339370 (= e!762730 Unit!43901)))

(declare-fun b!1339371 () Bool)

(assert (=> b!1339371 (= e!762729 (isDefined!523 (getValueByKey!714 (toList!10842 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!144345 c!126574) b!1339369))

(assert (= (and d!144345 (not c!126574)) b!1339370))

(assert (= (and d!144345 (not res!888403)) b!1339371))

(declare-fun m!1227819 () Bool)

(assert (=> d!144345 m!1227819))

(declare-fun m!1227821 () Bool)

(assert (=> b!1339369 m!1227821))

(declare-fun m!1227823 () Bool)

(assert (=> b!1339369 m!1227823))

(assert (=> b!1339369 m!1227823))

(declare-fun m!1227825 () Bool)

(assert (=> b!1339369 m!1227825))

(assert (=> b!1339371 m!1227823))

(assert (=> b!1339371 m!1227823))

(assert (=> b!1339371 m!1227825))

(assert (=> b!1339196 d!144345))

(declare-fun bm!65031 () Bool)

(declare-fun call!65039 () Bool)

(declare-fun lt!593958 () ListLongMap!21653)

(assert (=> bm!65031 (= call!65039 (contains!9023 lt!593958 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339414 () Bool)

(declare-fun e!762768 () ListLongMap!21653)

(declare-fun call!65034 () ListLongMap!21653)

(assert (=> b!1339414 (= e!762768 call!65034)))

(declare-fun bm!65032 () Bool)

(declare-fun call!65040 () ListLongMap!21653)

(declare-fun call!65037 () ListLongMap!21653)

(assert (=> bm!65032 (= call!65040 call!65037)))

(declare-fun b!1339415 () Bool)

(declare-fun e!762767 () Bool)

(assert (=> b!1339415 (= e!762767 (= (apply!1044 lt!593958 (select (arr!43915 _keys!1590) from!1980)) (get!22180 (select (arr!43914 _values!1320) from!1980) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1339415 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44465 _values!1320)))))

(assert (=> b!1339415 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44466 _keys!1590)))))

(declare-fun b!1339416 () Bool)

(declare-fun c!126589 () Bool)

(assert (=> b!1339416 (= c!126589 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762762 () ListLongMap!21653)

(assert (=> b!1339416 (= e!762762 e!762768)))

(declare-fun b!1339417 () Bool)

(declare-fun e!762764 () Bool)

(declare-fun call!65038 () Bool)

(assert (=> b!1339417 (= e!762764 (not call!65038))))

(declare-fun d!144347 () Bool)

(declare-fun e!762759 () Bool)

(assert (=> d!144347 e!762759))

(declare-fun res!888425 () Bool)

(assert (=> d!144347 (=> (not res!888425) (not e!762759))))

(assert (=> d!144347 (= res!888425 (or (bvsge from!1980 (size!44466 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44466 _keys!1590)))))))

(declare-fun lt!593957 () ListLongMap!21653)

(assert (=> d!144347 (= lt!593958 lt!593957)))

(declare-fun lt!593952 () Unit!43894)

(declare-fun e!762769 () Unit!43894)

(assert (=> d!144347 (= lt!593952 e!762769)))

(declare-fun c!126591 () Bool)

(declare-fun e!762758 () Bool)

(assert (=> d!144347 (= c!126591 e!762758)))

(declare-fun res!888430 () Bool)

(assert (=> d!144347 (=> (not res!888430) (not e!762758))))

(assert (=> d!144347 (= res!888430 (bvslt from!1980 (size!44466 _keys!1590)))))

(declare-fun e!762765 () ListLongMap!21653)

(assert (=> d!144347 (= lt!593957 e!762765)))

(declare-fun c!126592 () Bool)

(assert (=> d!144347 (= c!126592 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144347 (validMask!0 mask!1998)))

(assert (=> d!144347 (= (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593958)))

(declare-fun b!1339418 () Bool)

(declare-fun e!762757 () Bool)

(assert (=> b!1339418 (= e!762757 (= (apply!1044 lt!593958 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!65033 () Bool)

(assert (=> bm!65033 (= call!65034 call!65040)))

(declare-fun b!1339419 () Bool)

(assert (=> b!1339419 (= e!762758 (validKeyInArray!0 (select (arr!43915 _keys!1590) from!1980)))))

(declare-fun b!1339420 () Bool)

(declare-fun call!65036 () ListLongMap!21653)

(assert (=> b!1339420 (= e!762765 (+!4787 call!65036 (tuple2!23989 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1339421 () Bool)

(declare-fun e!762763 () Bool)

(assert (=> b!1339421 (= e!762763 (validKeyInArray!0 (select (arr!43915 _keys!1590) from!1980)))))

(declare-fun c!126587 () Bool)

(declare-fun bm!65034 () Bool)

(assert (=> bm!65034 (= call!65036 (+!4787 (ite c!126592 call!65037 (ite c!126587 call!65040 call!65034)) (ite (or c!126592 c!126587) (tuple2!23989 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23989 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1339422 () Bool)

(declare-fun e!762760 () Bool)

(assert (=> b!1339422 (= e!762760 (not call!65039))))

(declare-fun b!1339423 () Bool)

(declare-fun e!762766 () Bool)

(assert (=> b!1339423 (= e!762764 e!762766)))

(declare-fun res!888424 () Bool)

(assert (=> b!1339423 (= res!888424 call!65038)))

(assert (=> b!1339423 (=> (not res!888424) (not e!762766))))

(declare-fun bm!65035 () Bool)

(assert (=> bm!65035 (= call!65037 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun bm!65036 () Bool)

(assert (=> bm!65036 (= call!65038 (contains!9023 lt!593958 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339424 () Bool)

(assert (=> b!1339424 (= e!762765 e!762762)))

(assert (=> b!1339424 (= c!126587 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1339425 () Bool)

(declare-fun call!65035 () ListLongMap!21653)

(assert (=> b!1339425 (= e!762762 call!65035)))

(declare-fun b!1339426 () Bool)

(declare-fun res!888428 () Bool)

(assert (=> b!1339426 (=> (not res!888428) (not e!762759))))

(assert (=> b!1339426 (= res!888428 e!762764)))

(declare-fun c!126588 () Bool)

(assert (=> b!1339426 (= c!126588 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1339427 () Bool)

(assert (=> b!1339427 (= e!762760 e!762757)))

(declare-fun res!888429 () Bool)

(assert (=> b!1339427 (= res!888429 call!65039)))

(assert (=> b!1339427 (=> (not res!888429) (not e!762757))))

(declare-fun bm!65037 () Bool)

(assert (=> bm!65037 (= call!65035 call!65036)))

(declare-fun b!1339428 () Bool)

(declare-fun res!888423 () Bool)

(assert (=> b!1339428 (=> (not res!888423) (not e!762759))))

(declare-fun e!762761 () Bool)

(assert (=> b!1339428 (= res!888423 e!762761)))

(declare-fun res!888427 () Bool)

(assert (=> b!1339428 (=> res!888427 e!762761)))

(assert (=> b!1339428 (= res!888427 (not e!762763))))

(declare-fun res!888426 () Bool)

(assert (=> b!1339428 (=> (not res!888426) (not e!762763))))

(assert (=> b!1339428 (= res!888426 (bvslt from!1980 (size!44466 _keys!1590)))))

(declare-fun b!1339429 () Bool)

(assert (=> b!1339429 (= e!762766 (= (apply!1044 lt!593958 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1339430 () Bool)

(assert (=> b!1339430 (= e!762761 e!762767)))

(declare-fun res!888422 () Bool)

(assert (=> b!1339430 (=> (not res!888422) (not e!762767))))

(assert (=> b!1339430 (= res!888422 (contains!9023 lt!593958 (select (arr!43915 _keys!1590) from!1980)))))

(assert (=> b!1339430 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44466 _keys!1590)))))

(declare-fun b!1339431 () Bool)

(declare-fun Unit!43902 () Unit!43894)

(assert (=> b!1339431 (= e!762769 Unit!43902)))

(declare-fun b!1339432 () Bool)

(declare-fun lt!593948 () Unit!43894)

(assert (=> b!1339432 (= e!762769 lt!593948)))

(declare-fun lt!593947 () ListLongMap!21653)

(assert (=> b!1339432 (= lt!593947 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593942 () (_ BitVec 64))

(assert (=> b!1339432 (= lt!593942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593956 () (_ BitVec 64))

(assert (=> b!1339432 (= lt!593956 (select (arr!43915 _keys!1590) from!1980))))

(declare-fun lt!593949 () Unit!43894)

(declare-fun addStillContains!1196 (ListLongMap!21653 (_ BitVec 64) V!54393 (_ BitVec 64)) Unit!43894)

(assert (=> b!1339432 (= lt!593949 (addStillContains!1196 lt!593947 lt!593942 zeroValue!1262 lt!593956))))

(assert (=> b!1339432 (contains!9023 (+!4787 lt!593947 (tuple2!23989 lt!593942 zeroValue!1262)) lt!593956)))

(declare-fun lt!593960 () Unit!43894)

(assert (=> b!1339432 (= lt!593960 lt!593949)))

(declare-fun lt!593945 () ListLongMap!21653)

(assert (=> b!1339432 (= lt!593945 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593955 () (_ BitVec 64))

(assert (=> b!1339432 (= lt!593955 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593944 () (_ BitVec 64))

(assert (=> b!1339432 (= lt!593944 (select (arr!43915 _keys!1590) from!1980))))

(declare-fun lt!593963 () Unit!43894)

(declare-fun addApplyDifferent!573 (ListLongMap!21653 (_ BitVec 64) V!54393 (_ BitVec 64)) Unit!43894)

(assert (=> b!1339432 (= lt!593963 (addApplyDifferent!573 lt!593945 lt!593955 minValue!1262 lt!593944))))

(assert (=> b!1339432 (= (apply!1044 (+!4787 lt!593945 (tuple2!23989 lt!593955 minValue!1262)) lt!593944) (apply!1044 lt!593945 lt!593944))))

(declare-fun lt!593959 () Unit!43894)

(assert (=> b!1339432 (= lt!593959 lt!593963)))

(declare-fun lt!593953 () ListLongMap!21653)

(assert (=> b!1339432 (= lt!593953 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593950 () (_ BitVec 64))

(assert (=> b!1339432 (= lt!593950 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593951 () (_ BitVec 64))

(assert (=> b!1339432 (= lt!593951 (select (arr!43915 _keys!1590) from!1980))))

(declare-fun lt!593954 () Unit!43894)

(assert (=> b!1339432 (= lt!593954 (addApplyDifferent!573 lt!593953 lt!593950 zeroValue!1262 lt!593951))))

(assert (=> b!1339432 (= (apply!1044 (+!4787 lt!593953 (tuple2!23989 lt!593950 zeroValue!1262)) lt!593951) (apply!1044 lt!593953 lt!593951))))

(declare-fun lt!593962 () Unit!43894)

(assert (=> b!1339432 (= lt!593962 lt!593954)))

(declare-fun lt!593961 () ListLongMap!21653)

(assert (=> b!1339432 (= lt!593961 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593946 () (_ BitVec 64))

(assert (=> b!1339432 (= lt!593946 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593943 () (_ BitVec 64))

(assert (=> b!1339432 (= lt!593943 (select (arr!43915 _keys!1590) from!1980))))

(assert (=> b!1339432 (= lt!593948 (addApplyDifferent!573 lt!593961 lt!593946 minValue!1262 lt!593943))))

(assert (=> b!1339432 (= (apply!1044 (+!4787 lt!593961 (tuple2!23989 lt!593946 minValue!1262)) lt!593943) (apply!1044 lt!593961 lt!593943))))

(declare-fun b!1339433 () Bool)

(assert (=> b!1339433 (= e!762768 call!65035)))

(declare-fun b!1339434 () Bool)

(assert (=> b!1339434 (= e!762759 e!762760)))

(declare-fun c!126590 () Bool)

(assert (=> b!1339434 (= c!126590 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!144347 c!126592) b!1339420))

(assert (= (and d!144347 (not c!126592)) b!1339424))

(assert (= (and b!1339424 c!126587) b!1339425))

(assert (= (and b!1339424 (not c!126587)) b!1339416))

(assert (= (and b!1339416 c!126589) b!1339433))

(assert (= (and b!1339416 (not c!126589)) b!1339414))

(assert (= (or b!1339433 b!1339414) bm!65033))

(assert (= (or b!1339425 bm!65033) bm!65032))

(assert (= (or b!1339425 b!1339433) bm!65037))

(assert (= (or b!1339420 bm!65032) bm!65035))

(assert (= (or b!1339420 bm!65037) bm!65034))

(assert (= (and d!144347 res!888430) b!1339419))

(assert (= (and d!144347 c!126591) b!1339432))

(assert (= (and d!144347 (not c!126591)) b!1339431))

(assert (= (and d!144347 res!888425) b!1339428))

(assert (= (and b!1339428 res!888426) b!1339421))

(assert (= (and b!1339428 (not res!888427)) b!1339430))

(assert (= (and b!1339430 res!888422) b!1339415))

(assert (= (and b!1339428 res!888423) b!1339426))

(assert (= (and b!1339426 c!126588) b!1339423))

(assert (= (and b!1339426 (not c!126588)) b!1339417))

(assert (= (and b!1339423 res!888424) b!1339429))

(assert (= (or b!1339423 b!1339417) bm!65036))

(assert (= (and b!1339426 res!888428) b!1339434))

(assert (= (and b!1339434 c!126590) b!1339427))

(assert (= (and b!1339434 (not c!126590)) b!1339422))

(assert (= (and b!1339427 res!888429) b!1339418))

(assert (= (or b!1339427 b!1339422) bm!65031))

(declare-fun b_lambda!24257 () Bool)

(assert (=> (not b_lambda!24257) (not b!1339415)))

(assert (=> b!1339415 t!45443))

(declare-fun b_and!50079 () Bool)

(assert (= b_and!50077 (and (=> t!45443 result!25327) b_and!50079)))

(assert (=> b!1339421 m!1227639))

(assert (=> b!1339421 m!1227639))

(assert (=> b!1339421 m!1227641))

(assert (=> b!1339430 m!1227639))

(assert (=> b!1339430 m!1227639))

(declare-fun m!1227827 () Bool)

(assert (=> b!1339430 m!1227827))

(declare-fun m!1227829 () Bool)

(assert (=> b!1339420 m!1227829))

(declare-fun m!1227831 () Bool)

(assert (=> b!1339429 m!1227831))

(declare-fun m!1227833 () Bool)

(assert (=> b!1339418 m!1227833))

(declare-fun m!1227835 () Bool)

(assert (=> bm!65035 m!1227835))

(declare-fun m!1227837 () Bool)

(assert (=> bm!65036 m!1227837))

(assert (=> d!144347 m!1227655))

(declare-fun m!1227839 () Bool)

(assert (=> bm!65031 m!1227839))

(assert (=> b!1339415 m!1227645))

(assert (=> b!1339415 m!1227639))

(declare-fun m!1227841 () Bool)

(assert (=> b!1339415 m!1227841))

(assert (=> b!1339415 m!1227645))

(assert (=> b!1339415 m!1227643))

(assert (=> b!1339415 m!1227647))

(assert (=> b!1339415 m!1227643))

(assert (=> b!1339415 m!1227639))

(declare-fun m!1227843 () Bool)

(assert (=> bm!65034 m!1227843))

(assert (=> b!1339419 m!1227639))

(assert (=> b!1339419 m!1227639))

(assert (=> b!1339419 m!1227641))

(declare-fun m!1227845 () Bool)

(assert (=> b!1339432 m!1227845))

(declare-fun m!1227847 () Bool)

(assert (=> b!1339432 m!1227847))

(declare-fun m!1227849 () Bool)

(assert (=> b!1339432 m!1227849))

(assert (=> b!1339432 m!1227639))

(declare-fun m!1227851 () Bool)

(assert (=> b!1339432 m!1227851))

(declare-fun m!1227853 () Bool)

(assert (=> b!1339432 m!1227853))

(declare-fun m!1227855 () Bool)

(assert (=> b!1339432 m!1227855))

(declare-fun m!1227857 () Bool)

(assert (=> b!1339432 m!1227857))

(assert (=> b!1339432 m!1227851))

(declare-fun m!1227859 () Bool)

(assert (=> b!1339432 m!1227859))

(assert (=> b!1339432 m!1227857))

(declare-fun m!1227861 () Bool)

(assert (=> b!1339432 m!1227861))

(assert (=> b!1339432 m!1227847))

(declare-fun m!1227863 () Bool)

(assert (=> b!1339432 m!1227863))

(assert (=> b!1339432 m!1227835))

(declare-fun m!1227865 () Bool)

(assert (=> b!1339432 m!1227865))

(assert (=> b!1339432 m!1227855))

(declare-fun m!1227867 () Bool)

(assert (=> b!1339432 m!1227867))

(declare-fun m!1227869 () Bool)

(assert (=> b!1339432 m!1227869))

(declare-fun m!1227871 () Bool)

(assert (=> b!1339432 m!1227871))

(declare-fun m!1227873 () Bool)

(assert (=> b!1339432 m!1227873))

(assert (=> b!1339196 d!144347))

(declare-fun d!144349 () Bool)

(declare-fun e!762770 () Bool)

(assert (=> d!144349 e!762770))

(declare-fun res!888431 () Bool)

(assert (=> d!144349 (=> res!888431 e!762770)))

(declare-fun lt!593965 () Bool)

(assert (=> d!144349 (= res!888431 (not lt!593965))))

(declare-fun lt!593964 () Bool)

(assert (=> d!144349 (= lt!593965 lt!593964)))

(declare-fun lt!593966 () Unit!43894)

(declare-fun e!762771 () Unit!43894)

(assert (=> d!144349 (= lt!593966 e!762771)))

(declare-fun c!126593 () Bool)

(assert (=> d!144349 (= c!126593 lt!593964)))

(assert (=> d!144349 (= lt!593964 (containsKey!740 (toList!10842 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!144349 (= (contains!9023 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!593965)))

(declare-fun b!1339435 () Bool)

(declare-fun lt!593967 () Unit!43894)

(assert (=> b!1339435 (= e!762771 lt!593967)))

(assert (=> b!1339435 (= lt!593967 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10842 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> b!1339435 (isDefined!523 (getValueByKey!714 (toList!10842 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1339436 () Bool)

(declare-fun Unit!43903 () Unit!43894)

(assert (=> b!1339436 (= e!762771 Unit!43903)))

(declare-fun b!1339437 () Bool)

(assert (=> b!1339437 (= e!762770 (isDefined!523 (getValueByKey!714 (toList!10842 (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!144349 c!126593) b!1339435))

(assert (= (and d!144349 (not c!126593)) b!1339436))

(assert (= (and d!144349 (not res!888431)) b!1339437))

(declare-fun m!1227875 () Bool)

(assert (=> d!144349 m!1227875))

(declare-fun m!1227877 () Bool)

(assert (=> b!1339435 m!1227877))

(declare-fun m!1227879 () Bool)

(assert (=> b!1339435 m!1227879))

(assert (=> b!1339435 m!1227879))

(declare-fun m!1227881 () Bool)

(assert (=> b!1339435 m!1227881))

(assert (=> b!1339437 m!1227879))

(assert (=> b!1339437 m!1227879))

(assert (=> b!1339437 m!1227881))

(assert (=> b!1339209 d!144349))

(declare-fun bm!65038 () Bool)

(declare-fun call!65046 () Bool)

(declare-fun lt!593984 () ListLongMap!21653)

(assert (=> bm!65038 (= call!65046 (contains!9023 lt!593984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339438 () Bool)

(declare-fun e!762783 () ListLongMap!21653)

(declare-fun call!65041 () ListLongMap!21653)

(assert (=> b!1339438 (= e!762783 call!65041)))

(declare-fun bm!65039 () Bool)

(declare-fun call!65047 () ListLongMap!21653)

(declare-fun call!65044 () ListLongMap!21653)

(assert (=> bm!65039 (= call!65047 call!65044)))

(declare-fun b!1339439 () Bool)

(declare-fun e!762782 () Bool)

(assert (=> b!1339439 (= e!762782 (= (apply!1044 lt!593984 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22180 (select (arr!43914 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3741 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1339439 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44465 _values!1320)))))

(assert (=> b!1339439 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(declare-fun b!1339440 () Bool)

(declare-fun c!126596 () Bool)

(assert (=> b!1339440 (= c!126596 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762777 () ListLongMap!21653)

(assert (=> b!1339440 (= e!762777 e!762783)))

(declare-fun b!1339441 () Bool)

(declare-fun e!762779 () Bool)

(declare-fun call!65045 () Bool)

(assert (=> b!1339441 (= e!762779 (not call!65045))))

(declare-fun d!144351 () Bool)

(declare-fun e!762774 () Bool)

(assert (=> d!144351 e!762774))

(declare-fun res!888435 () Bool)

(assert (=> d!144351 (=> (not res!888435) (not e!762774))))

(assert (=> d!144351 (= res!888435 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))))

(declare-fun lt!593983 () ListLongMap!21653)

(assert (=> d!144351 (= lt!593984 lt!593983)))

(declare-fun lt!593978 () Unit!43894)

(declare-fun e!762784 () Unit!43894)

(assert (=> d!144351 (= lt!593978 e!762784)))

(declare-fun c!126598 () Bool)

(declare-fun e!762773 () Bool)

(assert (=> d!144351 (= c!126598 e!762773)))

(declare-fun res!888440 () Bool)

(assert (=> d!144351 (=> (not res!888440) (not e!762773))))

(assert (=> d!144351 (= res!888440 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(declare-fun e!762780 () ListLongMap!21653)

(assert (=> d!144351 (= lt!593983 e!762780)))

(declare-fun c!126599 () Bool)

(assert (=> d!144351 (= c!126599 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144351 (validMask!0 mask!1998)))

(assert (=> d!144351 (= (getCurrentListMap!5795 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593984)))

(declare-fun b!1339442 () Bool)

(declare-fun e!762772 () Bool)

(assert (=> b!1339442 (= e!762772 (= (apply!1044 lt!593984 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!65040 () Bool)

(assert (=> bm!65040 (= call!65041 call!65047)))

(declare-fun b!1339443 () Bool)

(assert (=> b!1339443 (= e!762773 (validKeyInArray!0 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1339444 () Bool)

(declare-fun call!65043 () ListLongMap!21653)

(assert (=> b!1339444 (= e!762780 (+!4787 call!65043 (tuple2!23989 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1339445 () Bool)

(declare-fun e!762778 () Bool)

(assert (=> b!1339445 (= e!762778 (validKeyInArray!0 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun c!126594 () Bool)

(declare-fun bm!65041 () Bool)

(assert (=> bm!65041 (= call!65043 (+!4787 (ite c!126599 call!65044 (ite c!126594 call!65047 call!65041)) (ite (or c!126599 c!126594) (tuple2!23989 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23989 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1339446 () Bool)

(declare-fun e!762775 () Bool)

(assert (=> b!1339446 (= e!762775 (not call!65046))))

(declare-fun b!1339447 () Bool)

(declare-fun e!762781 () Bool)

(assert (=> b!1339447 (= e!762779 e!762781)))

(declare-fun res!888434 () Bool)

(assert (=> b!1339447 (= res!888434 call!65045)))

(assert (=> b!1339447 (=> (not res!888434) (not e!762781))))

(declare-fun bm!65042 () Bool)

(assert (=> bm!65042 (= call!65044 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun bm!65043 () Bool)

(assert (=> bm!65043 (= call!65045 (contains!9023 lt!593984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339448 () Bool)

(assert (=> b!1339448 (= e!762780 e!762777)))

(assert (=> b!1339448 (= c!126594 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1339449 () Bool)

(declare-fun call!65042 () ListLongMap!21653)

(assert (=> b!1339449 (= e!762777 call!65042)))

(declare-fun b!1339450 () Bool)

(declare-fun res!888438 () Bool)

(assert (=> b!1339450 (=> (not res!888438) (not e!762774))))

(assert (=> b!1339450 (= res!888438 e!762779)))

(declare-fun c!126595 () Bool)

(assert (=> b!1339450 (= c!126595 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1339451 () Bool)

(assert (=> b!1339451 (= e!762775 e!762772)))

(declare-fun res!888439 () Bool)

(assert (=> b!1339451 (= res!888439 call!65046)))

(assert (=> b!1339451 (=> (not res!888439) (not e!762772))))

(declare-fun bm!65044 () Bool)

(assert (=> bm!65044 (= call!65042 call!65043)))

(declare-fun b!1339452 () Bool)

(declare-fun res!888433 () Bool)

(assert (=> b!1339452 (=> (not res!888433) (not e!762774))))

(declare-fun e!762776 () Bool)

(assert (=> b!1339452 (= res!888433 e!762776)))

(declare-fun res!888437 () Bool)

(assert (=> b!1339452 (=> res!888437 e!762776)))

(assert (=> b!1339452 (= res!888437 (not e!762778))))

(declare-fun res!888436 () Bool)

(assert (=> b!1339452 (=> (not res!888436) (not e!762778))))

(assert (=> b!1339452 (= res!888436 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(declare-fun b!1339453 () Bool)

(assert (=> b!1339453 (= e!762781 (= (apply!1044 lt!593984 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1339454 () Bool)

(assert (=> b!1339454 (= e!762776 e!762782)))

(declare-fun res!888432 () Bool)

(assert (=> b!1339454 (=> (not res!888432) (not e!762782))))

(assert (=> b!1339454 (= res!888432 (contains!9023 lt!593984 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1339454 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44466 _keys!1590)))))

(declare-fun b!1339455 () Bool)

(declare-fun Unit!43904 () Unit!43894)

(assert (=> b!1339455 (= e!762784 Unit!43904)))

(declare-fun b!1339456 () Bool)

(declare-fun lt!593974 () Unit!43894)

(assert (=> b!1339456 (= e!762784 lt!593974)))

(declare-fun lt!593973 () ListLongMap!21653)

(assert (=> b!1339456 (= lt!593973 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593968 () (_ BitVec 64))

(assert (=> b!1339456 (= lt!593968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593982 () (_ BitVec 64))

(assert (=> b!1339456 (= lt!593982 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593975 () Unit!43894)

(assert (=> b!1339456 (= lt!593975 (addStillContains!1196 lt!593973 lt!593968 zeroValue!1262 lt!593982))))

(assert (=> b!1339456 (contains!9023 (+!4787 lt!593973 (tuple2!23989 lt!593968 zeroValue!1262)) lt!593982)))

(declare-fun lt!593986 () Unit!43894)

(assert (=> b!1339456 (= lt!593986 lt!593975)))

(declare-fun lt!593971 () ListLongMap!21653)

(assert (=> b!1339456 (= lt!593971 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593981 () (_ BitVec 64))

(assert (=> b!1339456 (= lt!593981 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593970 () (_ BitVec 64))

(assert (=> b!1339456 (= lt!593970 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593989 () Unit!43894)

(assert (=> b!1339456 (= lt!593989 (addApplyDifferent!573 lt!593971 lt!593981 minValue!1262 lt!593970))))

(assert (=> b!1339456 (= (apply!1044 (+!4787 lt!593971 (tuple2!23989 lt!593981 minValue!1262)) lt!593970) (apply!1044 lt!593971 lt!593970))))

(declare-fun lt!593985 () Unit!43894)

(assert (=> b!1339456 (= lt!593985 lt!593989)))

(declare-fun lt!593979 () ListLongMap!21653)

(assert (=> b!1339456 (= lt!593979 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593976 () (_ BitVec 64))

(assert (=> b!1339456 (= lt!593976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593977 () (_ BitVec 64))

(assert (=> b!1339456 (= lt!593977 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593980 () Unit!43894)

(assert (=> b!1339456 (= lt!593980 (addApplyDifferent!573 lt!593979 lt!593976 zeroValue!1262 lt!593977))))

(assert (=> b!1339456 (= (apply!1044 (+!4787 lt!593979 (tuple2!23989 lt!593976 zeroValue!1262)) lt!593977) (apply!1044 lt!593979 lt!593977))))

(declare-fun lt!593988 () Unit!43894)

(assert (=> b!1339456 (= lt!593988 lt!593980)))

(declare-fun lt!593987 () ListLongMap!21653)

(assert (=> b!1339456 (= lt!593987 (getCurrentListMapNoExtraKeys!6436 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593972 () (_ BitVec 64))

(assert (=> b!1339456 (= lt!593972 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593969 () (_ BitVec 64))

(assert (=> b!1339456 (= lt!593969 (select (arr!43915 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1339456 (= lt!593974 (addApplyDifferent!573 lt!593987 lt!593972 minValue!1262 lt!593969))))

(assert (=> b!1339456 (= (apply!1044 (+!4787 lt!593987 (tuple2!23989 lt!593972 minValue!1262)) lt!593969) (apply!1044 lt!593987 lt!593969))))

(declare-fun b!1339457 () Bool)

(assert (=> b!1339457 (= e!762783 call!65042)))

(declare-fun b!1339458 () Bool)

(assert (=> b!1339458 (= e!762774 e!762775)))

(declare-fun c!126597 () Bool)

(assert (=> b!1339458 (= c!126597 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!144351 c!126599) b!1339444))

(assert (= (and d!144351 (not c!126599)) b!1339448))

(assert (= (and b!1339448 c!126594) b!1339449))

(assert (= (and b!1339448 (not c!126594)) b!1339440))

(assert (= (and b!1339440 c!126596) b!1339457))

(assert (= (and b!1339440 (not c!126596)) b!1339438))

(assert (= (or b!1339457 b!1339438) bm!65040))

(assert (= (or b!1339449 bm!65040) bm!65039))

(assert (= (or b!1339449 b!1339457) bm!65044))

(assert (= (or b!1339444 bm!65039) bm!65042))

(assert (= (or b!1339444 bm!65044) bm!65041))

(assert (= (and d!144351 res!888440) b!1339443))

(assert (= (and d!144351 c!126598) b!1339456))

(assert (= (and d!144351 (not c!126598)) b!1339455))

(assert (= (and d!144351 res!888435) b!1339452))

(assert (= (and b!1339452 res!888436) b!1339445))

(assert (= (and b!1339452 (not res!888437)) b!1339454))

(assert (= (and b!1339454 res!888432) b!1339439))

(assert (= (and b!1339452 res!888433) b!1339450))

(assert (= (and b!1339450 c!126595) b!1339447))

(assert (= (and b!1339450 (not c!126595)) b!1339441))

(assert (= (and b!1339447 res!888434) b!1339453))

(assert (= (or b!1339447 b!1339441) bm!65043))

(assert (= (and b!1339450 res!888438) b!1339458))

(assert (= (and b!1339458 c!126597) b!1339451))

(assert (= (and b!1339458 (not c!126597)) b!1339446))

(assert (= (and b!1339451 res!888439) b!1339442))

(assert (= (or b!1339451 b!1339446) bm!65038))

(declare-fun b_lambda!24259 () Bool)

(assert (=> (not b_lambda!24259) (not b!1339439)))

(assert (=> b!1339439 t!45443))

(declare-fun b_and!50081 () Bool)

(assert (= b_and!50079 (and (=> t!45443 result!25327) b_and!50081)))

(assert (=> b!1339445 m!1227775))

(assert (=> b!1339445 m!1227775))

(assert (=> b!1339445 m!1227777))

(assert (=> b!1339454 m!1227775))

(assert (=> b!1339454 m!1227775))

(declare-fun m!1227883 () Bool)

(assert (=> b!1339454 m!1227883))

(declare-fun m!1227885 () Bool)

(assert (=> b!1339444 m!1227885))

(declare-fun m!1227887 () Bool)

(assert (=> b!1339453 m!1227887))

(declare-fun m!1227889 () Bool)

(assert (=> b!1339442 m!1227889))

(assert (=> bm!65042 m!1227653))

(declare-fun m!1227891 () Bool)

(assert (=> bm!65043 m!1227891))

(assert (=> d!144351 m!1227655))

(declare-fun m!1227893 () Bool)

(assert (=> bm!65038 m!1227893))

(assert (=> b!1339439 m!1227779))

(assert (=> b!1339439 m!1227775))

(declare-fun m!1227895 () Bool)

(assert (=> b!1339439 m!1227895))

(assert (=> b!1339439 m!1227779))

(assert (=> b!1339439 m!1227643))

(assert (=> b!1339439 m!1227781))

(assert (=> b!1339439 m!1227643))

(assert (=> b!1339439 m!1227775))

(declare-fun m!1227897 () Bool)

(assert (=> bm!65041 m!1227897))

(assert (=> b!1339443 m!1227775))

(assert (=> b!1339443 m!1227775))

(assert (=> b!1339443 m!1227777))

(declare-fun m!1227899 () Bool)

(assert (=> b!1339456 m!1227899))

(declare-fun m!1227901 () Bool)

(assert (=> b!1339456 m!1227901))

(declare-fun m!1227903 () Bool)

(assert (=> b!1339456 m!1227903))

(assert (=> b!1339456 m!1227775))

(declare-fun m!1227905 () Bool)

(assert (=> b!1339456 m!1227905))

(declare-fun m!1227907 () Bool)

(assert (=> b!1339456 m!1227907))

(declare-fun m!1227909 () Bool)

(assert (=> b!1339456 m!1227909))

(declare-fun m!1227911 () Bool)

(assert (=> b!1339456 m!1227911))

(assert (=> b!1339456 m!1227905))

(declare-fun m!1227913 () Bool)

(assert (=> b!1339456 m!1227913))

(assert (=> b!1339456 m!1227911))

(declare-fun m!1227915 () Bool)

(assert (=> b!1339456 m!1227915))

(assert (=> b!1339456 m!1227901))

(declare-fun m!1227917 () Bool)

(assert (=> b!1339456 m!1227917))

(assert (=> b!1339456 m!1227653))

(declare-fun m!1227919 () Bool)

(assert (=> b!1339456 m!1227919))

(assert (=> b!1339456 m!1227909))

(declare-fun m!1227921 () Bool)

(assert (=> b!1339456 m!1227921))

(declare-fun m!1227923 () Bool)

(assert (=> b!1339456 m!1227923))

(declare-fun m!1227925 () Bool)

(assert (=> b!1339456 m!1227925))

(declare-fun m!1227927 () Bool)

(assert (=> b!1339456 m!1227927))

(assert (=> b!1339209 d!144351))

(declare-fun d!144353 () Bool)

(declare-fun e!762785 () Bool)

(assert (=> d!144353 e!762785))

(declare-fun res!888441 () Bool)

(assert (=> d!144353 (=> res!888441 e!762785)))

(declare-fun lt!593991 () Bool)

(assert (=> d!144353 (= res!888441 (not lt!593991))))

(declare-fun lt!593990 () Bool)

(assert (=> d!144353 (= lt!593991 lt!593990)))

(declare-fun lt!593992 () Unit!43894)

(declare-fun e!762786 () Unit!43894)

(assert (=> d!144353 (= lt!593992 e!762786)))

(declare-fun c!126600 () Bool)

(assert (=> d!144353 (= c!126600 lt!593990)))

(assert (=> d!144353 (= lt!593990 (containsKey!740 (toList!10842 lt!593819) k0!1153))))

(assert (=> d!144353 (= (contains!9023 lt!593819 k0!1153) lt!593991)))

(declare-fun b!1339459 () Bool)

(declare-fun lt!593993 () Unit!43894)

(assert (=> b!1339459 (= e!762786 lt!593993)))

(assert (=> b!1339459 (= lt!593993 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10842 lt!593819) k0!1153))))

(assert (=> b!1339459 (isDefined!523 (getValueByKey!714 (toList!10842 lt!593819) k0!1153))))

(declare-fun b!1339460 () Bool)

(declare-fun Unit!43905 () Unit!43894)

(assert (=> b!1339460 (= e!762786 Unit!43905)))

(declare-fun b!1339461 () Bool)

(assert (=> b!1339461 (= e!762785 (isDefined!523 (getValueByKey!714 (toList!10842 lt!593819) k0!1153)))))

(assert (= (and d!144353 c!126600) b!1339459))

(assert (= (and d!144353 (not c!126600)) b!1339460))

(assert (= (and d!144353 (not res!888441)) b!1339461))

(declare-fun m!1227929 () Bool)

(assert (=> d!144353 m!1227929))

(declare-fun m!1227931 () Bool)

(assert (=> b!1339459 m!1227931))

(declare-fun m!1227933 () Bool)

(assert (=> b!1339459 m!1227933))

(assert (=> b!1339459 m!1227933))

(declare-fun m!1227935 () Bool)

(assert (=> b!1339459 m!1227935))

(assert (=> b!1339461 m!1227933))

(assert (=> b!1339461 m!1227933))

(assert (=> b!1339461 m!1227935))

(assert (=> b!1339209 d!144353))

(declare-fun d!144355 () Bool)

(assert (=> d!144355 (contains!9023 lt!593819 k0!1153)))

(declare-fun lt!593996 () Unit!43894)

(declare-fun choose!1970 ((_ BitVec 64) (_ BitVec 64) V!54393 ListLongMap!21653) Unit!43894)

(assert (=> d!144355 (= lt!593996 (choose!1970 k0!1153 (select (arr!43915 _keys!1590) from!1980) lt!593820 lt!593819))))

(assert (=> d!144355 (contains!9023 (+!4787 lt!593819 (tuple2!23989 (select (arr!43915 _keys!1590) from!1980) lt!593820)) k0!1153)))

(assert (=> d!144355 (= (lemmaInListMapAfterAddingDiffThenInBefore!317 k0!1153 (select (arr!43915 _keys!1590) from!1980) lt!593820 lt!593819) lt!593996)))

(declare-fun bs!38332 () Bool)

(assert (= bs!38332 d!144355))

(assert (=> bs!38332 m!1227663))

(assert (=> bs!38332 m!1227639))

(declare-fun m!1227937 () Bool)

(assert (=> bs!38332 m!1227937))

(assert (=> bs!38332 m!1227649))

(assert (=> bs!38332 m!1227649))

(assert (=> bs!38332 m!1227651))

(assert (=> b!1339209 d!144355))

(declare-fun b!1339472 () Bool)

(declare-fun e!762797 () Bool)

(declare-fun e!762798 () Bool)

(assert (=> b!1339472 (= e!762797 e!762798)))

(declare-fun res!888449 () Bool)

(assert (=> b!1339472 (=> (not res!888449) (not e!762798))))

(declare-fun e!762795 () Bool)

(assert (=> b!1339472 (= res!888449 (not e!762795))))

(declare-fun res!888450 () Bool)

(assert (=> b!1339472 (=> (not res!888450) (not e!762795))))

(assert (=> b!1339472 (= res!888450 (validKeyInArray!0 (select (arr!43915 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!65047 () Bool)

(declare-fun call!65050 () Bool)

(declare-fun c!126603 () Bool)

(assert (=> bm!65047 (= call!65050 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126603 (Cons!31123 (select (arr!43915 _keys!1590) #b00000000000000000000000000000000) Nil!31124) Nil!31124)))))

(declare-fun b!1339473 () Bool)

(declare-fun e!762796 () Bool)

(assert (=> b!1339473 (= e!762796 call!65050)))

(declare-fun d!144357 () Bool)

(declare-fun res!888448 () Bool)

(assert (=> d!144357 (=> res!888448 e!762797)))

(assert (=> d!144357 (= res!888448 (bvsge #b00000000000000000000000000000000 (size!44466 _keys!1590)))))

(assert (=> d!144357 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31124) e!762797)))

(declare-fun b!1339474 () Bool)

(assert (=> b!1339474 (= e!762796 call!65050)))

(declare-fun b!1339475 () Bool)

(declare-fun contains!9027 (List!31127 (_ BitVec 64)) Bool)

(assert (=> b!1339475 (= e!762795 (contains!9027 Nil!31124 (select (arr!43915 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1339476 () Bool)

(assert (=> b!1339476 (= e!762798 e!762796)))

(assert (=> b!1339476 (= c!126603 (validKeyInArray!0 (select (arr!43915 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!144357 (not res!888448)) b!1339472))

(assert (= (and b!1339472 res!888450) b!1339475))

(assert (= (and b!1339472 res!888449) b!1339476))

(assert (= (and b!1339476 c!126603) b!1339474))

(assert (= (and b!1339476 (not c!126603)) b!1339473))

(assert (= (or b!1339474 b!1339473) bm!65047))

(assert (=> b!1339472 m!1227807))

(assert (=> b!1339472 m!1227807))

(assert (=> b!1339472 m!1227809))

(assert (=> bm!65047 m!1227807))

(declare-fun m!1227939 () Bool)

(assert (=> bm!65047 m!1227939))

(assert (=> b!1339475 m!1227807))

(assert (=> b!1339475 m!1227807))

(declare-fun m!1227941 () Bool)

(assert (=> b!1339475 m!1227941))

(assert (=> b!1339476 m!1227807))

(assert (=> b!1339476 m!1227807))

(assert (=> b!1339476 m!1227809))

(assert (=> b!1339206 d!144357))

(declare-fun b!1339483 () Bool)

(declare-fun e!762804 () Bool)

(assert (=> b!1339483 (= e!762804 tp_is_empty!36967)))

(declare-fun condMapEmpty!57144 () Bool)

(declare-fun mapDefault!57144 () ValueCell!17585)

(assert (=> mapNonEmpty!57135 (= condMapEmpty!57144 (= mapRest!57135 ((as const (Array (_ BitVec 32) ValueCell!17585)) mapDefault!57144)))))

(declare-fun e!762803 () Bool)

(declare-fun mapRes!57144 () Bool)

(assert (=> mapNonEmpty!57135 (= tp!108819 (and e!762803 mapRes!57144))))

(declare-fun mapNonEmpty!57144 () Bool)

(declare-fun tp!108834 () Bool)

(assert (=> mapNonEmpty!57144 (= mapRes!57144 (and tp!108834 e!762804))))

(declare-fun mapKey!57144 () (_ BitVec 32))

(declare-fun mapRest!57144 () (Array (_ BitVec 32) ValueCell!17585))

(declare-fun mapValue!57144 () ValueCell!17585)

(assert (=> mapNonEmpty!57144 (= mapRest!57135 (store mapRest!57144 mapKey!57144 mapValue!57144))))

(declare-fun mapIsEmpty!57144 () Bool)

(assert (=> mapIsEmpty!57144 mapRes!57144))

(declare-fun b!1339484 () Bool)

(assert (=> b!1339484 (= e!762803 tp_is_empty!36967)))

(assert (= (and mapNonEmpty!57135 condMapEmpty!57144) mapIsEmpty!57144))

(assert (= (and mapNonEmpty!57135 (not condMapEmpty!57144)) mapNonEmpty!57144))

(assert (= (and mapNonEmpty!57144 ((_ is ValueCellFull!17585) mapValue!57144)) b!1339483))

(assert (= (and mapNonEmpty!57135 ((_ is ValueCellFull!17585) mapDefault!57144)) b!1339484))

(declare-fun m!1227943 () Bool)

(assert (=> mapNonEmpty!57144 m!1227943))

(declare-fun b_lambda!24261 () Bool)

(assert (= b_lambda!24253 (or (and start!113028 b_free!31057) b_lambda!24261)))

(declare-fun b_lambda!24263 () Bool)

(assert (= b_lambda!24259 (or (and start!113028 b_free!31057) b_lambda!24263)))

(declare-fun b_lambda!24265 () Bool)

(assert (= b_lambda!24255 (or (and start!113028 b_free!31057) b_lambda!24265)))

(declare-fun b_lambda!24267 () Bool)

(assert (= b_lambda!24257 (or (and start!113028 b_free!31057) b_lambda!24267)))

(check-sat (not b!1339341) (not b!1339456) (not d!144347) (not b!1339419) (not b_lambda!24251) (not b!1339349) (not b!1339367) (not b!1339439) (not bm!65036) (not b!1339435) (not b_lambda!24265) (not b!1339415) (not b!1339348) (not b!1339368) (not b!1339443) (not b!1339340) (not d!144335) (not b!1339313) (not b!1339472) (not bm!65013) (not b!1339429) (not b!1339445) (not b!1339461) (not d!144349) (not b!1339442) (not b!1339339) (not d!144355) (not b!1339355) (not b!1339421) (not d!144351) (not b_lambda!24261) (not d!144339) (not b!1339306) (not b!1339346) (not b!1339369) (not bm!65031) (not d!144337) (not b!1339453) (not b!1339308) (not bm!65016) (not b_lambda!24263) (not b_next!31057) (not b!1339432) (not b!1339430) (not b!1339444) (not d!144345) (not bm!65042) (not b!1339454) b_and!50081 (not b!1339371) (not b_lambda!24267) (not b!1339476) (not b!1339344) (not b!1339437) (not b!1339345) (not bm!65047) (not bm!65041) (not b!1339314) (not bm!65043) (not b!1339459) (not b!1339418) tp_is_empty!36967 (not d!144353) (not bm!65034) (not b!1339356) (not b!1339420) (not mapNonEmpty!57144) (not b!1339475) (not bm!65035) (not bm!65038))
(check-sat b_and!50081 (not b_next!31057))
