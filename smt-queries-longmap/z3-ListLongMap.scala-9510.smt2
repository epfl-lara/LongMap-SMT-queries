; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112834 () Bool)

(assert start!112834)

(declare-fun b_free!31063 () Bool)

(declare-fun b_next!31063 () Bool)

(assert (=> start!112834 (= b_free!31063 (not b_next!31063))))

(declare-fun tp!108841 () Bool)

(declare-fun b_and!50063 () Bool)

(assert (=> start!112834 (= tp!108841 b_and!50063)))

(declare-fun b!1338138 () Bool)

(declare-fun res!887927 () Bool)

(declare-fun e!761943 () Bool)

(assert (=> b!1338138 (=> (not res!887927) (not e!761943))))

(declare-datatypes ((array!90749 0))(
  ( (array!90750 (arr!43837 (Array (_ BitVec 32) (_ BitVec 64))) (size!44389 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90749)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90749 (_ BitVec 32)) Bool)

(assert (=> b!1338138 (= res!887927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1338139 () Bool)

(declare-fun res!887920 () Bool)

(assert (=> b!1338139 (=> (not res!887920) (not e!761943))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338139 (= res!887920 (not (validKeyInArray!0 (select (arr!43837 _keys!1590) from!1980))))))

(declare-fun b!1338140 () Bool)

(declare-fun e!761942 () Bool)

(declare-fun tp_is_empty!36973 () Bool)

(assert (=> b!1338140 (= e!761942 tp_is_empty!36973)))

(declare-fun b!1338141 () Bool)

(declare-fun res!887925 () Bool)

(assert (=> b!1338141 (=> (not res!887925) (not e!761943))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1338141 (= res!887925 (not (= (select (arr!43837 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1338142 () Bool)

(declare-fun e!761940 () Bool)

(assert (=> b!1338142 (= e!761940 tp_is_empty!36973)))

(declare-fun b!1338143 () Bool)

(declare-fun res!887924 () Bool)

(assert (=> b!1338143 (=> (not res!887924) (not e!761943))))

(declare-datatypes ((V!54401 0))(
  ( (V!54402 (val!18561 Int)) )
))
(declare-datatypes ((ValueCell!17588 0))(
  ( (ValueCellFull!17588 (v!21205 V!54401)) (EmptyCell!17588) )
))
(declare-datatypes ((array!90751 0))(
  ( (array!90752 (arr!43838 (Array (_ BitVec 32) ValueCell!17588)) (size!44390 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90751)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1338143 (= res!887924 (and (= (size!44390 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44389 _keys!1590) (size!44390 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1338144 () Bool)

(declare-fun res!887922 () Bool)

(assert (=> b!1338144 (=> (not res!887922) (not e!761943))))

(assert (=> b!1338144 (= res!887922 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44389 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57147 () Bool)

(declare-fun mapRes!57147 () Bool)

(assert (=> mapIsEmpty!57147 mapRes!57147))

(declare-fun mapNonEmpty!57147 () Bool)

(declare-fun tp!108840 () Bool)

(assert (=> mapNonEmpty!57147 (= mapRes!57147 (and tp!108840 e!761942))))

(declare-fun mapValue!57147 () ValueCell!17588)

(declare-fun mapKey!57147 () (_ BitVec 32))

(declare-fun mapRest!57147 () (Array (_ BitVec 32) ValueCell!17588))

(assert (=> mapNonEmpty!57147 (= (arr!43838 _values!1320) (store mapRest!57147 mapKey!57147 mapValue!57147))))

(declare-fun b!1338145 () Bool)

(declare-fun res!887923 () Bool)

(assert (=> b!1338145 (=> (not res!887923) (not e!761943))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54401)

(declare-fun zeroValue!1262 () V!54401)

(declare-datatypes ((tuple2!24002 0))(
  ( (tuple2!24003 (_1!12012 (_ BitVec 64)) (_2!12012 V!54401)) )
))
(declare-datatypes ((List!31130 0))(
  ( (Nil!31127) (Cons!31126 (h!32335 tuple2!24002) (t!45452 List!31130)) )
))
(declare-datatypes ((ListLongMap!21659 0))(
  ( (ListLongMap!21660 (toList!10845 List!31130)) )
))
(declare-fun contains!8945 (ListLongMap!21659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5698 (array!90749 array!90751 (_ BitVec 32) (_ BitVec 32) V!54401 V!54401 (_ BitVec 32) Int) ListLongMap!21659)

(assert (=> b!1338145 (= res!887923 (contains!8945 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1338146 () Bool)

(declare-fun e!761941 () Bool)

(assert (=> b!1338146 (= e!761941 (and e!761940 mapRes!57147))))

(declare-fun condMapEmpty!57147 () Bool)

(declare-fun mapDefault!57147 () ValueCell!17588)

(assert (=> b!1338146 (= condMapEmpty!57147 (= (arr!43838 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17588)) mapDefault!57147)))))

(declare-fun res!887926 () Bool)

(assert (=> start!112834 (=> (not res!887926) (not e!761943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112834 (= res!887926 (validMask!0 mask!1998))))

(assert (=> start!112834 e!761943))

(declare-fun array_inv!33255 (array!90751) Bool)

(assert (=> start!112834 (and (array_inv!33255 _values!1320) e!761941)))

(assert (=> start!112834 true))

(declare-fun array_inv!33256 (array!90749) Bool)

(assert (=> start!112834 (array_inv!33256 _keys!1590)))

(assert (=> start!112834 tp!108841))

(assert (=> start!112834 tp_is_empty!36973))

(declare-fun b!1338147 () Bool)

(declare-fun res!887921 () Bool)

(assert (=> b!1338147 (=> (not res!887921) (not e!761943))))

(declare-datatypes ((List!31131 0))(
  ( (Nil!31128) (Cons!31127 (h!32336 (_ BitVec 64)) (t!45453 List!31131)) )
))
(declare-fun arrayNoDuplicates!0 (array!90749 (_ BitVec 32) List!31131) Bool)

(assert (=> b!1338147 (= res!887921 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31128))))

(declare-fun b!1338148 () Bool)

(assert (=> b!1338148 (= e!761943 (not (contains!8945 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(assert (= (and start!112834 res!887926) b!1338143))

(assert (= (and b!1338143 res!887924) b!1338138))

(assert (= (and b!1338138 res!887927) b!1338147))

(assert (= (and b!1338147 res!887921) b!1338144))

(assert (= (and b!1338144 res!887922) b!1338145))

(assert (= (and b!1338145 res!887923) b!1338141))

(assert (= (and b!1338141 res!887925) b!1338139))

(assert (= (and b!1338139 res!887920) b!1338148))

(assert (= (and b!1338146 condMapEmpty!57147) mapIsEmpty!57147))

(assert (= (and b!1338146 (not condMapEmpty!57147)) mapNonEmpty!57147))

(get-info :version)

(assert (= (and mapNonEmpty!57147 ((_ is ValueCellFull!17588) mapValue!57147)) b!1338140))

(assert (= (and b!1338146 ((_ is ValueCellFull!17588) mapDefault!57147)) b!1338142))

(assert (= start!112834 b!1338146))

(declare-fun m!1225831 () Bool)

(assert (=> mapNonEmpty!57147 m!1225831))

(declare-fun m!1225833 () Bool)

(assert (=> b!1338147 m!1225833))

(declare-fun m!1225835 () Bool)

(assert (=> b!1338148 m!1225835))

(assert (=> b!1338148 m!1225835))

(declare-fun m!1225837 () Bool)

(assert (=> b!1338148 m!1225837))

(declare-fun m!1225839 () Bool)

(assert (=> start!112834 m!1225839))

(declare-fun m!1225841 () Bool)

(assert (=> start!112834 m!1225841))

(declare-fun m!1225843 () Bool)

(assert (=> start!112834 m!1225843))

(declare-fun m!1225845 () Bool)

(assert (=> b!1338141 m!1225845))

(declare-fun m!1225847 () Bool)

(assert (=> b!1338145 m!1225847))

(assert (=> b!1338145 m!1225847))

(declare-fun m!1225849 () Bool)

(assert (=> b!1338145 m!1225849))

(assert (=> b!1338139 m!1225845))

(assert (=> b!1338139 m!1225845))

(declare-fun m!1225851 () Bool)

(assert (=> b!1338139 m!1225851))

(declare-fun m!1225853 () Bool)

(assert (=> b!1338138 m!1225853))

(check-sat (not b!1338145) (not start!112834) (not b!1338139) (not b!1338147) (not mapNonEmpty!57147) (not b_next!31063) (not b!1338148) b_and!50063 tp_is_empty!36973 (not b!1338138))
(check-sat b_and!50063 (not b_next!31063))
(get-model)

(declare-fun d!143801 () Bool)

(declare-fun e!761978 () Bool)

(assert (=> d!143801 e!761978))

(declare-fun res!887978 () Bool)

(assert (=> d!143801 (=> res!887978 e!761978)))

(declare-fun lt!593346 () Bool)

(assert (=> d!143801 (= res!887978 (not lt!593346))))

(declare-fun lt!593345 () Bool)

(assert (=> d!143801 (= lt!593346 lt!593345)))

(declare-datatypes ((Unit!43774 0))(
  ( (Unit!43775) )
))
(declare-fun lt!593344 () Unit!43774)

(declare-fun e!761979 () Unit!43774)

(assert (=> d!143801 (= lt!593344 e!761979)))

(declare-fun c!126190 () Bool)

(assert (=> d!143801 (= c!126190 lt!593345)))

(declare-fun containsKey!739 (List!31130 (_ BitVec 64)) Bool)

(assert (=> d!143801 (= lt!593345 (containsKey!739 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!143801 (= (contains!8945 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!593346)))

(declare-fun b!1338221 () Bool)

(declare-fun lt!593343 () Unit!43774)

(assert (=> b!1338221 (= e!761979 lt!593343)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!486 (List!31130 (_ BitVec 64)) Unit!43774)

(assert (=> b!1338221 (= lt!593343 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-datatypes ((Option!773 0))(
  ( (Some!772 (v!21208 V!54401)) (None!771) )
))
(declare-fun isDefined!529 (Option!773) Bool)

(declare-fun getValueByKey!722 (List!31130 (_ BitVec 64)) Option!773)

(assert (=> b!1338221 (isDefined!529 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1338222 () Bool)

(declare-fun Unit!43776 () Unit!43774)

(assert (=> b!1338222 (= e!761979 Unit!43776)))

(declare-fun b!1338223 () Bool)

(assert (=> b!1338223 (= e!761978 (isDefined!529 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143801 c!126190) b!1338221))

(assert (= (and d!143801 (not c!126190)) b!1338222))

(assert (= (and d!143801 (not res!887978)) b!1338223))

(declare-fun m!1225903 () Bool)

(assert (=> d!143801 m!1225903))

(declare-fun m!1225905 () Bool)

(assert (=> b!1338221 m!1225905))

(declare-fun m!1225907 () Bool)

(assert (=> b!1338221 m!1225907))

(assert (=> b!1338221 m!1225907))

(declare-fun m!1225909 () Bool)

(assert (=> b!1338221 m!1225909))

(assert (=> b!1338223 m!1225907))

(assert (=> b!1338223 m!1225907))

(assert (=> b!1338223 m!1225909))

(assert (=> b!1338148 d!143801))

(declare-fun b!1338266 () Bool)

(declare-fun e!762011 () Unit!43774)

(declare-fun Unit!43777 () Unit!43774)

(assert (=> b!1338266 (= e!762011 Unit!43777)))

(declare-fun b!1338267 () Bool)

(declare-fun e!762015 () Bool)

(declare-fun lt!593402 () ListLongMap!21659)

(declare-fun apply!1029 (ListLongMap!21659 (_ BitVec 64)) V!54401)

(assert (=> b!1338267 (= e!762015 (= (apply!1029 lt!593402 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!64978 () Bool)

(declare-fun call!64982 () ListLongMap!21659)

(declare-fun c!126205 () Bool)

(declare-fun call!64984 () ListLongMap!21659)

(declare-fun call!64986 () ListLongMap!21659)

(declare-fun c!126204 () Bool)

(declare-fun call!64985 () ListLongMap!21659)

(declare-fun +!4774 (ListLongMap!21659 tuple2!24002) ListLongMap!21659)

(assert (=> bm!64978 (= call!64986 (+!4774 (ite c!126205 call!64985 (ite c!126204 call!64982 call!64984)) (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338268 () Bool)

(declare-fun e!762012 () Bool)

(declare-fun call!64987 () Bool)

(assert (=> b!1338268 (= e!762012 (not call!64987))))

(declare-fun b!1338269 () Bool)

(declare-fun e!762017 () Bool)

(assert (=> b!1338269 (= e!762017 e!762012)))

(declare-fun c!126207 () Bool)

(assert (=> b!1338269 (= c!126207 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338270 () Bool)

(declare-fun e!762010 () ListLongMap!21659)

(declare-fun call!64983 () ListLongMap!21659)

(assert (=> b!1338270 (= e!762010 call!64983)))

(declare-fun bm!64979 () Bool)

(assert (=> bm!64979 (= call!64983 call!64986)))

(declare-fun b!1338271 () Bool)

(declare-fun c!126203 () Bool)

(assert (=> b!1338271 (= c!126203 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762009 () ListLongMap!21659)

(assert (=> b!1338271 (= e!762009 e!762010)))

(declare-fun b!1338272 () Bool)

(declare-fun e!762007 () Bool)

(declare-fun e!762014 () Bool)

(assert (=> b!1338272 (= e!762007 e!762014)))

(declare-fun res!888003 () Bool)

(assert (=> b!1338272 (=> (not res!888003) (not e!762014))))

(assert (=> b!1338272 (= res!888003 (contains!8945 lt!593402 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338272 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(declare-fun bm!64980 () Bool)

(assert (=> bm!64980 (= call!64982 call!64985)))

(declare-fun b!1338273 () Bool)

(declare-fun e!762008 () Bool)

(assert (=> b!1338273 (= e!762008 (validKeyInArray!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338274 () Bool)

(declare-fun e!762016 () Bool)

(declare-fun call!64981 () Bool)

(assert (=> b!1338274 (= e!762016 (not call!64981))))

(declare-fun b!1338275 () Bool)

(declare-fun lt!593408 () Unit!43774)

(assert (=> b!1338275 (= e!762011 lt!593408)))

(declare-fun lt!593393 () ListLongMap!21659)

(declare-fun getCurrentListMapNoExtraKeys!6417 (array!90749 array!90751 (_ BitVec 32) (_ BitVec 32) V!54401 V!54401 (_ BitVec 32) Int) ListLongMap!21659)

(assert (=> b!1338275 (= lt!593393 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593397 () (_ BitVec 64))

(assert (=> b!1338275 (= lt!593397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593398 () (_ BitVec 64))

(assert (=> b!1338275 (= lt!593398 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593396 () Unit!43774)

(declare-fun addStillContains!1187 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43774)

(assert (=> b!1338275 (= lt!593396 (addStillContains!1187 lt!593393 lt!593397 zeroValue!1262 lt!593398))))

(assert (=> b!1338275 (contains!8945 (+!4774 lt!593393 (tuple2!24003 lt!593397 zeroValue!1262)) lt!593398)))

(declare-fun lt!593400 () Unit!43774)

(assert (=> b!1338275 (= lt!593400 lt!593396)))

(declare-fun lt!593392 () ListLongMap!21659)

(assert (=> b!1338275 (= lt!593392 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593406 () (_ BitVec 64))

(assert (=> b!1338275 (= lt!593406 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593409 () (_ BitVec 64))

(assert (=> b!1338275 (= lt!593409 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593394 () Unit!43774)

(declare-fun addApplyDifferent!567 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43774)

(assert (=> b!1338275 (= lt!593394 (addApplyDifferent!567 lt!593392 lt!593406 minValue!1262 lt!593409))))

(assert (=> b!1338275 (= (apply!1029 (+!4774 lt!593392 (tuple2!24003 lt!593406 minValue!1262)) lt!593409) (apply!1029 lt!593392 lt!593409))))

(declare-fun lt!593407 () Unit!43774)

(assert (=> b!1338275 (= lt!593407 lt!593394)))

(declare-fun lt!593395 () ListLongMap!21659)

(assert (=> b!1338275 (= lt!593395 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593401 () (_ BitVec 64))

(assert (=> b!1338275 (= lt!593401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593405 () (_ BitVec 64))

(assert (=> b!1338275 (= lt!593405 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593410 () Unit!43774)

(assert (=> b!1338275 (= lt!593410 (addApplyDifferent!567 lt!593395 lt!593401 zeroValue!1262 lt!593405))))

(assert (=> b!1338275 (= (apply!1029 (+!4774 lt!593395 (tuple2!24003 lt!593401 zeroValue!1262)) lt!593405) (apply!1029 lt!593395 lt!593405))))

(declare-fun lt!593403 () Unit!43774)

(assert (=> b!1338275 (= lt!593403 lt!593410)))

(declare-fun lt!593404 () ListLongMap!21659)

(assert (=> b!1338275 (= lt!593404 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593411 () (_ BitVec 64))

(assert (=> b!1338275 (= lt!593411 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593412 () (_ BitVec 64))

(assert (=> b!1338275 (= lt!593412 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338275 (= lt!593408 (addApplyDifferent!567 lt!593404 lt!593411 minValue!1262 lt!593412))))

(assert (=> b!1338275 (= (apply!1029 (+!4774 lt!593404 (tuple2!24003 lt!593411 minValue!1262)) lt!593412) (apply!1029 lt!593404 lt!593412))))

(declare-fun bm!64981 () Bool)

(assert (=> bm!64981 (= call!64984 call!64982)))

(declare-fun b!1338277 () Bool)

(declare-fun e!762006 () ListLongMap!21659)

(assert (=> b!1338277 (= e!762006 e!762009)))

(assert (=> b!1338277 (= c!126204 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64982 () Bool)

(assert (=> bm!64982 (= call!64985 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1338278 () Bool)

(assert (=> b!1338278 (= e!762012 e!762015)))

(declare-fun res!887999 () Bool)

(assert (=> b!1338278 (= res!887999 call!64987)))

(assert (=> b!1338278 (=> (not res!887999) (not e!762015))))

(declare-fun b!1338279 () Bool)

(declare-fun e!762013 () Bool)

(assert (=> b!1338279 (= e!762013 (validKeyInArray!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338280 () Bool)

(declare-fun get!22135 (ValueCell!17588 V!54401) V!54401)

(declare-fun dynLambda!3704 (Int (_ BitVec 64)) V!54401)

(assert (=> b!1338280 (= e!762014 (= (apply!1029 lt!593402 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22135 (select (arr!43838 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338280 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44390 _values!1320)))))

(assert (=> b!1338280 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(declare-fun b!1338281 () Bool)

(declare-fun res!887997 () Bool)

(assert (=> b!1338281 (=> (not res!887997) (not e!762017))))

(assert (=> b!1338281 (= res!887997 e!762007)))

(declare-fun res!887998 () Bool)

(assert (=> b!1338281 (=> res!887998 e!762007)))

(assert (=> b!1338281 (= res!887998 (not e!762013))))

(declare-fun res!888000 () Bool)

(assert (=> b!1338281 (=> (not res!888000) (not e!762013))))

(assert (=> b!1338281 (= res!888000 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(declare-fun b!1338282 () Bool)

(assert (=> b!1338282 (= e!762009 call!64983)))

(declare-fun b!1338283 () Bool)

(assert (=> b!1338283 (= e!762010 call!64984)))

(declare-fun b!1338284 () Bool)

(declare-fun res!888002 () Bool)

(assert (=> b!1338284 (=> (not res!888002) (not e!762017))))

(assert (=> b!1338284 (= res!888002 e!762016)))

(declare-fun c!126206 () Bool)

(assert (=> b!1338284 (= c!126206 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1338285 () Bool)

(assert (=> b!1338285 (= e!762006 (+!4774 call!64986 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun bm!64983 () Bool)

(assert (=> bm!64983 (= call!64981 (contains!8945 lt!593402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64984 () Bool)

(assert (=> bm!64984 (= call!64987 (contains!8945 lt!593402 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338286 () Bool)

(declare-fun e!762018 () Bool)

(assert (=> b!1338286 (= e!762018 (= (apply!1029 lt!593402 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun d!143803 () Bool)

(assert (=> d!143803 e!762017))

(declare-fun res!888001 () Bool)

(assert (=> d!143803 (=> (not res!888001) (not e!762017))))

(assert (=> d!143803 (= res!888001 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))))

(declare-fun lt!593399 () ListLongMap!21659)

(assert (=> d!143803 (= lt!593402 lt!593399)))

(declare-fun lt!593391 () Unit!43774)

(assert (=> d!143803 (= lt!593391 e!762011)))

(declare-fun c!126208 () Bool)

(assert (=> d!143803 (= c!126208 e!762008)))

(declare-fun res!888005 () Bool)

(assert (=> d!143803 (=> (not res!888005) (not e!762008))))

(assert (=> d!143803 (= res!888005 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(assert (=> d!143803 (= lt!593399 e!762006)))

(assert (=> d!143803 (= c!126205 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143803 (validMask!0 mask!1998)))

(assert (=> d!143803 (= (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593402)))

(declare-fun b!1338276 () Bool)

(assert (=> b!1338276 (= e!762016 e!762018)))

(declare-fun res!888004 () Bool)

(assert (=> b!1338276 (= res!888004 call!64981)))

(assert (=> b!1338276 (=> (not res!888004) (not e!762018))))

(assert (= (and d!143803 c!126205) b!1338285))

(assert (= (and d!143803 (not c!126205)) b!1338277))

(assert (= (and b!1338277 c!126204) b!1338282))

(assert (= (and b!1338277 (not c!126204)) b!1338271))

(assert (= (and b!1338271 c!126203) b!1338270))

(assert (= (and b!1338271 (not c!126203)) b!1338283))

(assert (= (or b!1338270 b!1338283) bm!64981))

(assert (= (or b!1338282 bm!64981) bm!64980))

(assert (= (or b!1338282 b!1338270) bm!64979))

(assert (= (or b!1338285 bm!64980) bm!64982))

(assert (= (or b!1338285 bm!64979) bm!64978))

(assert (= (and d!143803 res!888005) b!1338273))

(assert (= (and d!143803 c!126208) b!1338275))

(assert (= (and d!143803 (not c!126208)) b!1338266))

(assert (= (and d!143803 res!888001) b!1338281))

(assert (= (and b!1338281 res!888000) b!1338279))

(assert (= (and b!1338281 (not res!887998)) b!1338272))

(assert (= (and b!1338272 res!888003) b!1338280))

(assert (= (and b!1338281 res!887997) b!1338284))

(assert (= (and b!1338284 c!126206) b!1338276))

(assert (= (and b!1338284 (not c!126206)) b!1338274))

(assert (= (and b!1338276 res!888004) b!1338286))

(assert (= (or b!1338276 b!1338274) bm!64983))

(assert (= (and b!1338284 res!888002) b!1338269))

(assert (= (and b!1338269 c!126207) b!1338278))

(assert (= (and b!1338269 (not c!126207)) b!1338268))

(assert (= (and b!1338278 res!887999) b!1338267))

(assert (= (or b!1338278 b!1338268) bm!64984))

(declare-fun b_lambda!24265 () Bool)

(assert (=> (not b_lambda!24265) (not b!1338280)))

(declare-fun t!45459 () Bool)

(declare-fun tb!12127 () Bool)

(assert (=> (and start!112834 (= defaultEntry!1323 defaultEntry!1323) t!45459) tb!12127))

(declare-fun result!25341 () Bool)

(assert (=> tb!12127 (= result!25341 tp_is_empty!36973)))

(assert (=> b!1338280 t!45459))

(declare-fun b_and!50069 () Bool)

(assert (= b_and!50063 (and (=> t!45459 result!25341) b_and!50069)))

(declare-fun m!1225911 () Bool)

(assert (=> b!1338275 m!1225911))

(declare-fun m!1225913 () Bool)

(assert (=> b!1338275 m!1225913))

(declare-fun m!1225915 () Bool)

(assert (=> b!1338275 m!1225915))

(declare-fun m!1225917 () Bool)

(assert (=> b!1338275 m!1225917))

(declare-fun m!1225919 () Bool)

(assert (=> b!1338275 m!1225919))

(declare-fun m!1225921 () Bool)

(assert (=> b!1338275 m!1225921))

(declare-fun m!1225923 () Bool)

(assert (=> b!1338275 m!1225923))

(declare-fun m!1225925 () Bool)

(assert (=> b!1338275 m!1225925))

(declare-fun m!1225927 () Bool)

(assert (=> b!1338275 m!1225927))

(declare-fun m!1225929 () Bool)

(assert (=> b!1338275 m!1225929))

(declare-fun m!1225931 () Bool)

(assert (=> b!1338275 m!1225931))

(declare-fun m!1225933 () Bool)

(assert (=> b!1338275 m!1225933))

(declare-fun m!1225935 () Bool)

(assert (=> b!1338275 m!1225935))

(declare-fun m!1225937 () Bool)

(assert (=> b!1338275 m!1225937))

(assert (=> b!1338275 m!1225917))

(declare-fun m!1225939 () Bool)

(assert (=> b!1338275 m!1225939))

(assert (=> b!1338275 m!1225923))

(declare-fun m!1225941 () Bool)

(assert (=> b!1338275 m!1225941))

(declare-fun m!1225943 () Bool)

(assert (=> b!1338275 m!1225943))

(assert (=> b!1338275 m!1225911))

(assert (=> b!1338275 m!1225927))

(assert (=> bm!64982 m!1225931))

(declare-fun m!1225945 () Bool)

(assert (=> b!1338286 m!1225945))

(declare-fun m!1225947 () Bool)

(assert (=> bm!64984 m!1225947))

(assert (=> b!1338273 m!1225919))

(assert (=> b!1338273 m!1225919))

(declare-fun m!1225949 () Bool)

(assert (=> b!1338273 m!1225949))

(declare-fun m!1225951 () Bool)

(assert (=> b!1338280 m!1225951))

(assert (=> b!1338280 m!1225919))

(declare-fun m!1225953 () Bool)

(assert (=> b!1338280 m!1225953))

(assert (=> b!1338280 m!1225919))

(declare-fun m!1225955 () Bool)

(assert (=> b!1338280 m!1225955))

(assert (=> b!1338280 m!1225953))

(assert (=> b!1338280 m!1225951))

(declare-fun m!1225957 () Bool)

(assert (=> b!1338280 m!1225957))

(assert (=> d!143803 m!1225839))

(declare-fun m!1225959 () Bool)

(assert (=> b!1338285 m!1225959))

(declare-fun m!1225961 () Bool)

(assert (=> b!1338267 m!1225961))

(declare-fun m!1225963 () Bool)

(assert (=> bm!64978 m!1225963))

(declare-fun m!1225965 () Bool)

(assert (=> bm!64983 m!1225965))

(assert (=> b!1338272 m!1225919))

(assert (=> b!1338272 m!1225919))

(declare-fun m!1225967 () Bool)

(assert (=> b!1338272 m!1225967))

(assert (=> b!1338279 m!1225919))

(assert (=> b!1338279 m!1225919))

(assert (=> b!1338279 m!1225949))

(assert (=> b!1338148 d!143803))

(declare-fun d!143805 () Bool)

(assert (=> d!143805 (= (validKeyInArray!0 (select (arr!43837 _keys!1590) from!1980)) (and (not (= (select (arr!43837 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43837 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338139 d!143805))

(declare-fun bm!64987 () Bool)

(declare-fun call!64990 () Bool)

(declare-fun c!126211 () Bool)

(assert (=> bm!64987 (= call!64990 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126211 (Cons!31127 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) Nil!31128) Nil!31128)))))

(declare-fun b!1338299 () Bool)

(declare-fun e!762027 () Bool)

(declare-fun contains!8948 (List!31131 (_ BitVec 64)) Bool)

(assert (=> b!1338299 (= e!762027 (contains!8948 Nil!31128 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338300 () Bool)

(declare-fun e!762029 () Bool)

(assert (=> b!1338300 (= e!762029 call!64990)))

(declare-fun b!1338301 () Bool)

(declare-fun e!762028 () Bool)

(declare-fun e!762030 () Bool)

(assert (=> b!1338301 (= e!762028 e!762030)))

(declare-fun res!888013 () Bool)

(assert (=> b!1338301 (=> (not res!888013) (not e!762030))))

(assert (=> b!1338301 (= res!888013 (not e!762027))))

(declare-fun res!888012 () Bool)

(assert (=> b!1338301 (=> (not res!888012) (not e!762027))))

(assert (=> b!1338301 (= res!888012 (validKeyInArray!0 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338302 () Bool)

(assert (=> b!1338302 (= e!762030 e!762029)))

(assert (=> b!1338302 (= c!126211 (validKeyInArray!0 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338303 () Bool)

(assert (=> b!1338303 (= e!762029 call!64990)))

(declare-fun d!143807 () Bool)

(declare-fun res!888014 () Bool)

(assert (=> d!143807 (=> res!888014 e!762028)))

(assert (=> d!143807 (= res!888014 (bvsge #b00000000000000000000000000000000 (size!44389 _keys!1590)))))

(assert (=> d!143807 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31128) e!762028)))

(assert (= (and d!143807 (not res!888014)) b!1338301))

(assert (= (and b!1338301 res!888012) b!1338299))

(assert (= (and b!1338301 res!888013) b!1338302))

(assert (= (and b!1338302 c!126211) b!1338303))

(assert (= (and b!1338302 (not c!126211)) b!1338300))

(assert (= (or b!1338303 b!1338300) bm!64987))

(declare-fun m!1225969 () Bool)

(assert (=> bm!64987 m!1225969))

(declare-fun m!1225971 () Bool)

(assert (=> bm!64987 m!1225971))

(assert (=> b!1338299 m!1225969))

(assert (=> b!1338299 m!1225969))

(declare-fun m!1225973 () Bool)

(assert (=> b!1338299 m!1225973))

(assert (=> b!1338301 m!1225969))

(assert (=> b!1338301 m!1225969))

(declare-fun m!1225975 () Bool)

(assert (=> b!1338301 m!1225975))

(assert (=> b!1338302 m!1225969))

(assert (=> b!1338302 m!1225969))

(assert (=> b!1338302 m!1225975))

(assert (=> b!1338147 d!143807))

(declare-fun bm!64990 () Bool)

(declare-fun call!64993 () Bool)

(assert (=> bm!64990 (= call!64993 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1338312 () Bool)

(declare-fun e!762039 () Bool)

(assert (=> b!1338312 (= e!762039 call!64993)))

(declare-fun b!1338313 () Bool)

(declare-fun e!762037 () Bool)

(assert (=> b!1338313 (= e!762039 e!762037)))

(declare-fun lt!593420 () (_ BitVec 64))

(assert (=> b!1338313 (= lt!593420 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!593421 () Unit!43774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90749 (_ BitVec 64) (_ BitVec 32)) Unit!43774)

(assert (=> b!1338313 (= lt!593421 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593420 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338313 (arrayContainsKey!0 _keys!1590 lt!593420 #b00000000000000000000000000000000)))

(declare-fun lt!593419 () Unit!43774)

(assert (=> b!1338313 (= lt!593419 lt!593421)))

(declare-fun res!888020 () Bool)

(declare-datatypes ((SeekEntryResult!10050 0))(
  ( (MissingZero!10050 (index!42571 (_ BitVec 32))) (Found!10050 (index!42572 (_ BitVec 32))) (Intermediate!10050 (undefined!10862 Bool) (index!42573 (_ BitVec 32)) (x!119541 (_ BitVec 32))) (Undefined!10050) (MissingVacant!10050 (index!42574 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90749 (_ BitVec 32)) SeekEntryResult!10050)

(assert (=> b!1338313 (= res!888020 (= (seekEntryOrOpen!0 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10050 #b00000000000000000000000000000000)))))

(assert (=> b!1338313 (=> (not res!888020) (not e!762037))))

(declare-fun d!143809 () Bool)

(declare-fun res!888019 () Bool)

(declare-fun e!762038 () Bool)

(assert (=> d!143809 (=> res!888019 e!762038)))

(assert (=> d!143809 (= res!888019 (bvsge #b00000000000000000000000000000000 (size!44389 _keys!1590)))))

(assert (=> d!143809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!762038)))

(declare-fun b!1338314 () Bool)

(assert (=> b!1338314 (= e!762038 e!762039)))

(declare-fun c!126214 () Bool)

(assert (=> b!1338314 (= c!126214 (validKeyInArray!0 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338315 () Bool)

(assert (=> b!1338315 (= e!762037 call!64993)))

(assert (= (and d!143809 (not res!888019)) b!1338314))

(assert (= (and b!1338314 c!126214) b!1338313))

(assert (= (and b!1338314 (not c!126214)) b!1338312))

(assert (= (and b!1338313 res!888020) b!1338315))

(assert (= (or b!1338315 b!1338312) bm!64990))

(declare-fun m!1225977 () Bool)

(assert (=> bm!64990 m!1225977))

(assert (=> b!1338313 m!1225969))

(declare-fun m!1225979 () Bool)

(assert (=> b!1338313 m!1225979))

(declare-fun m!1225981 () Bool)

(assert (=> b!1338313 m!1225981))

(assert (=> b!1338313 m!1225969))

(declare-fun m!1225983 () Bool)

(assert (=> b!1338313 m!1225983))

(assert (=> b!1338314 m!1225969))

(assert (=> b!1338314 m!1225969))

(assert (=> b!1338314 m!1225975))

(assert (=> b!1338138 d!143809))

(declare-fun d!143811 () Bool)

(assert (=> d!143811 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112834 d!143811))

(declare-fun d!143813 () Bool)

(assert (=> d!143813 (= (array_inv!33255 _values!1320) (bvsge (size!44390 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112834 d!143813))

(declare-fun d!143815 () Bool)

(assert (=> d!143815 (= (array_inv!33256 _keys!1590) (bvsge (size!44389 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112834 d!143815))

(declare-fun d!143817 () Bool)

(declare-fun e!762040 () Bool)

(assert (=> d!143817 e!762040))

(declare-fun res!888021 () Bool)

(assert (=> d!143817 (=> res!888021 e!762040)))

(declare-fun lt!593425 () Bool)

(assert (=> d!143817 (= res!888021 (not lt!593425))))

(declare-fun lt!593424 () Bool)

(assert (=> d!143817 (= lt!593425 lt!593424)))

(declare-fun lt!593423 () Unit!43774)

(declare-fun e!762041 () Unit!43774)

(assert (=> d!143817 (= lt!593423 e!762041)))

(declare-fun c!126215 () Bool)

(assert (=> d!143817 (= c!126215 lt!593424)))

(assert (=> d!143817 (= lt!593424 (containsKey!739 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143817 (= (contains!8945 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593425)))

(declare-fun b!1338316 () Bool)

(declare-fun lt!593422 () Unit!43774)

(assert (=> b!1338316 (= e!762041 lt!593422)))

(assert (=> b!1338316 (= lt!593422 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1338316 (isDefined!529 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1338317 () Bool)

(declare-fun Unit!43778 () Unit!43774)

(assert (=> b!1338317 (= e!762041 Unit!43778)))

(declare-fun b!1338318 () Bool)

(assert (=> b!1338318 (= e!762040 (isDefined!529 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143817 c!126215) b!1338316))

(assert (= (and d!143817 (not c!126215)) b!1338317))

(assert (= (and d!143817 (not res!888021)) b!1338318))

(declare-fun m!1225985 () Bool)

(assert (=> d!143817 m!1225985))

(declare-fun m!1225987 () Bool)

(assert (=> b!1338316 m!1225987))

(declare-fun m!1225989 () Bool)

(assert (=> b!1338316 m!1225989))

(assert (=> b!1338316 m!1225989))

(declare-fun m!1225991 () Bool)

(assert (=> b!1338316 m!1225991))

(assert (=> b!1338318 m!1225989))

(assert (=> b!1338318 m!1225989))

(assert (=> b!1338318 m!1225991))

(assert (=> b!1338145 d!143817))

(declare-fun b!1338319 () Bool)

(declare-fun e!762047 () Unit!43774)

(declare-fun Unit!43779 () Unit!43774)

(assert (=> b!1338319 (= e!762047 Unit!43779)))

(declare-fun b!1338320 () Bool)

(declare-fun e!762051 () Bool)

(declare-fun lt!593437 () ListLongMap!21659)

(assert (=> b!1338320 (= e!762051 (= (apply!1029 lt!593437 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!64991 () Bool)

(declare-fun call!64997 () ListLongMap!21659)

(declare-fun call!64998 () ListLongMap!21659)

(declare-fun call!64999 () ListLongMap!21659)

(declare-fun c!126217 () Bool)

(declare-fun call!64995 () ListLongMap!21659)

(declare-fun c!126218 () Bool)

(assert (=> bm!64991 (= call!64999 (+!4774 (ite c!126218 call!64998 (ite c!126217 call!64995 call!64997)) (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338321 () Bool)

(declare-fun e!762048 () Bool)

(declare-fun call!65000 () Bool)

(assert (=> b!1338321 (= e!762048 (not call!65000))))

(declare-fun b!1338322 () Bool)

(declare-fun e!762053 () Bool)

(assert (=> b!1338322 (= e!762053 e!762048)))

(declare-fun c!126220 () Bool)

(assert (=> b!1338322 (= c!126220 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338323 () Bool)

(declare-fun e!762046 () ListLongMap!21659)

(declare-fun call!64996 () ListLongMap!21659)

(assert (=> b!1338323 (= e!762046 call!64996)))

(declare-fun bm!64992 () Bool)

(assert (=> bm!64992 (= call!64996 call!64999)))

(declare-fun b!1338324 () Bool)

(declare-fun c!126216 () Bool)

(assert (=> b!1338324 (= c!126216 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762045 () ListLongMap!21659)

(assert (=> b!1338324 (= e!762045 e!762046)))

(declare-fun b!1338325 () Bool)

(declare-fun e!762043 () Bool)

(declare-fun e!762050 () Bool)

(assert (=> b!1338325 (= e!762043 e!762050)))

(declare-fun res!888028 () Bool)

(assert (=> b!1338325 (=> (not res!888028) (not e!762050))))

(assert (=> b!1338325 (= res!888028 (contains!8945 lt!593437 (select (arr!43837 _keys!1590) from!1980)))))

(assert (=> b!1338325 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44389 _keys!1590)))))

(declare-fun bm!64993 () Bool)

(assert (=> bm!64993 (= call!64995 call!64998)))

(declare-fun b!1338326 () Bool)

(declare-fun e!762044 () Bool)

(assert (=> b!1338326 (= e!762044 (validKeyInArray!0 (select (arr!43837 _keys!1590) from!1980)))))

(declare-fun b!1338327 () Bool)

(declare-fun e!762052 () Bool)

(declare-fun call!64994 () Bool)

(assert (=> b!1338327 (= e!762052 (not call!64994))))

(declare-fun b!1338328 () Bool)

(declare-fun lt!593443 () Unit!43774)

(assert (=> b!1338328 (= e!762047 lt!593443)))

(declare-fun lt!593428 () ListLongMap!21659)

(assert (=> b!1338328 (= lt!593428 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593432 () (_ BitVec 64))

(assert (=> b!1338328 (= lt!593432 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593433 () (_ BitVec 64))

(assert (=> b!1338328 (= lt!593433 (select (arr!43837 _keys!1590) from!1980))))

(declare-fun lt!593431 () Unit!43774)

(assert (=> b!1338328 (= lt!593431 (addStillContains!1187 lt!593428 lt!593432 zeroValue!1262 lt!593433))))

(assert (=> b!1338328 (contains!8945 (+!4774 lt!593428 (tuple2!24003 lt!593432 zeroValue!1262)) lt!593433)))

(declare-fun lt!593435 () Unit!43774)

(assert (=> b!1338328 (= lt!593435 lt!593431)))

(declare-fun lt!593427 () ListLongMap!21659)

(assert (=> b!1338328 (= lt!593427 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593441 () (_ BitVec 64))

(assert (=> b!1338328 (= lt!593441 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593444 () (_ BitVec 64))

(assert (=> b!1338328 (= lt!593444 (select (arr!43837 _keys!1590) from!1980))))

(declare-fun lt!593429 () Unit!43774)

(assert (=> b!1338328 (= lt!593429 (addApplyDifferent!567 lt!593427 lt!593441 minValue!1262 lt!593444))))

(assert (=> b!1338328 (= (apply!1029 (+!4774 lt!593427 (tuple2!24003 lt!593441 minValue!1262)) lt!593444) (apply!1029 lt!593427 lt!593444))))

(declare-fun lt!593442 () Unit!43774)

(assert (=> b!1338328 (= lt!593442 lt!593429)))

(declare-fun lt!593430 () ListLongMap!21659)

(assert (=> b!1338328 (= lt!593430 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593436 () (_ BitVec 64))

(assert (=> b!1338328 (= lt!593436 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593440 () (_ BitVec 64))

(assert (=> b!1338328 (= lt!593440 (select (arr!43837 _keys!1590) from!1980))))

(declare-fun lt!593445 () Unit!43774)

(assert (=> b!1338328 (= lt!593445 (addApplyDifferent!567 lt!593430 lt!593436 zeroValue!1262 lt!593440))))

(assert (=> b!1338328 (= (apply!1029 (+!4774 lt!593430 (tuple2!24003 lt!593436 zeroValue!1262)) lt!593440) (apply!1029 lt!593430 lt!593440))))

(declare-fun lt!593438 () Unit!43774)

(assert (=> b!1338328 (= lt!593438 lt!593445)))

(declare-fun lt!593439 () ListLongMap!21659)

(assert (=> b!1338328 (= lt!593439 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593446 () (_ BitVec 64))

(assert (=> b!1338328 (= lt!593446 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593447 () (_ BitVec 64))

(assert (=> b!1338328 (= lt!593447 (select (arr!43837 _keys!1590) from!1980))))

(assert (=> b!1338328 (= lt!593443 (addApplyDifferent!567 lt!593439 lt!593446 minValue!1262 lt!593447))))

(assert (=> b!1338328 (= (apply!1029 (+!4774 lt!593439 (tuple2!24003 lt!593446 minValue!1262)) lt!593447) (apply!1029 lt!593439 lt!593447))))

(declare-fun bm!64994 () Bool)

(assert (=> bm!64994 (= call!64997 call!64995)))

(declare-fun b!1338330 () Bool)

(declare-fun e!762042 () ListLongMap!21659)

(assert (=> b!1338330 (= e!762042 e!762045)))

(assert (=> b!1338330 (= c!126217 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64995 () Bool)

(assert (=> bm!64995 (= call!64998 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1338331 () Bool)

(assert (=> b!1338331 (= e!762048 e!762051)))

(declare-fun res!888024 () Bool)

(assert (=> b!1338331 (= res!888024 call!65000)))

(assert (=> b!1338331 (=> (not res!888024) (not e!762051))))

(declare-fun b!1338332 () Bool)

(declare-fun e!762049 () Bool)

(assert (=> b!1338332 (= e!762049 (validKeyInArray!0 (select (arr!43837 _keys!1590) from!1980)))))

(declare-fun b!1338333 () Bool)

(assert (=> b!1338333 (= e!762050 (= (apply!1029 lt!593437 (select (arr!43837 _keys!1590) from!1980)) (get!22135 (select (arr!43838 _values!1320) from!1980) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338333 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44390 _values!1320)))))

(assert (=> b!1338333 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44389 _keys!1590)))))

(declare-fun b!1338334 () Bool)

(declare-fun res!888022 () Bool)

(assert (=> b!1338334 (=> (not res!888022) (not e!762053))))

(assert (=> b!1338334 (= res!888022 e!762043)))

(declare-fun res!888023 () Bool)

(assert (=> b!1338334 (=> res!888023 e!762043)))

(assert (=> b!1338334 (= res!888023 (not e!762049))))

(declare-fun res!888025 () Bool)

(assert (=> b!1338334 (=> (not res!888025) (not e!762049))))

(assert (=> b!1338334 (= res!888025 (bvslt from!1980 (size!44389 _keys!1590)))))

(declare-fun b!1338335 () Bool)

(assert (=> b!1338335 (= e!762045 call!64996)))

(declare-fun b!1338336 () Bool)

(assert (=> b!1338336 (= e!762046 call!64997)))

(declare-fun b!1338337 () Bool)

(declare-fun res!888027 () Bool)

(assert (=> b!1338337 (=> (not res!888027) (not e!762053))))

(assert (=> b!1338337 (= res!888027 e!762052)))

(declare-fun c!126219 () Bool)

(assert (=> b!1338337 (= c!126219 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1338338 () Bool)

(assert (=> b!1338338 (= e!762042 (+!4774 call!64999 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun bm!64996 () Bool)

(assert (=> bm!64996 (= call!64994 (contains!8945 lt!593437 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64997 () Bool)

(assert (=> bm!64997 (= call!65000 (contains!8945 lt!593437 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338339 () Bool)

(declare-fun e!762054 () Bool)

(assert (=> b!1338339 (= e!762054 (= (apply!1029 lt!593437 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun d!143819 () Bool)

(assert (=> d!143819 e!762053))

(declare-fun res!888026 () Bool)

(assert (=> d!143819 (=> (not res!888026) (not e!762053))))

(assert (=> d!143819 (= res!888026 (or (bvsge from!1980 (size!44389 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44389 _keys!1590)))))))

(declare-fun lt!593434 () ListLongMap!21659)

(assert (=> d!143819 (= lt!593437 lt!593434)))

(declare-fun lt!593426 () Unit!43774)

(assert (=> d!143819 (= lt!593426 e!762047)))

(declare-fun c!126221 () Bool)

(assert (=> d!143819 (= c!126221 e!762044)))

(declare-fun res!888030 () Bool)

(assert (=> d!143819 (=> (not res!888030) (not e!762044))))

(assert (=> d!143819 (= res!888030 (bvslt from!1980 (size!44389 _keys!1590)))))

(assert (=> d!143819 (= lt!593434 e!762042)))

(assert (=> d!143819 (= c!126218 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143819 (validMask!0 mask!1998)))

(assert (=> d!143819 (= (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593437)))

(declare-fun b!1338329 () Bool)

(assert (=> b!1338329 (= e!762052 e!762054)))

(declare-fun res!888029 () Bool)

(assert (=> b!1338329 (= res!888029 call!64994)))

(assert (=> b!1338329 (=> (not res!888029) (not e!762054))))

(assert (= (and d!143819 c!126218) b!1338338))

(assert (= (and d!143819 (not c!126218)) b!1338330))

(assert (= (and b!1338330 c!126217) b!1338335))

(assert (= (and b!1338330 (not c!126217)) b!1338324))

(assert (= (and b!1338324 c!126216) b!1338323))

(assert (= (and b!1338324 (not c!126216)) b!1338336))

(assert (= (or b!1338323 b!1338336) bm!64994))

(assert (= (or b!1338335 bm!64994) bm!64993))

(assert (= (or b!1338335 b!1338323) bm!64992))

(assert (= (or b!1338338 bm!64993) bm!64995))

(assert (= (or b!1338338 bm!64992) bm!64991))

(assert (= (and d!143819 res!888030) b!1338326))

(assert (= (and d!143819 c!126221) b!1338328))

(assert (= (and d!143819 (not c!126221)) b!1338319))

(assert (= (and d!143819 res!888026) b!1338334))

(assert (= (and b!1338334 res!888025) b!1338332))

(assert (= (and b!1338334 (not res!888023)) b!1338325))

(assert (= (and b!1338325 res!888028) b!1338333))

(assert (= (and b!1338334 res!888022) b!1338337))

(assert (= (and b!1338337 c!126219) b!1338329))

(assert (= (and b!1338337 (not c!126219)) b!1338327))

(assert (= (and b!1338329 res!888029) b!1338339))

(assert (= (or b!1338329 b!1338327) bm!64996))

(assert (= (and b!1338337 res!888027) b!1338322))

(assert (= (and b!1338322 c!126220) b!1338331))

(assert (= (and b!1338322 (not c!126220)) b!1338321))

(assert (= (and b!1338331 res!888024) b!1338320))

(assert (= (or b!1338331 b!1338321) bm!64997))

(declare-fun b_lambda!24267 () Bool)

(assert (=> (not b_lambda!24267) (not b!1338333)))

(assert (=> b!1338333 t!45459))

(declare-fun b_and!50071 () Bool)

(assert (= b_and!50069 (and (=> t!45459 result!25341) b_and!50071)))

(declare-fun m!1225993 () Bool)

(assert (=> b!1338328 m!1225993))

(declare-fun m!1225995 () Bool)

(assert (=> b!1338328 m!1225995))

(declare-fun m!1225997 () Bool)

(assert (=> b!1338328 m!1225997))

(declare-fun m!1225999 () Bool)

(assert (=> b!1338328 m!1225999))

(assert (=> b!1338328 m!1225845))

(declare-fun m!1226001 () Bool)

(assert (=> b!1338328 m!1226001))

(declare-fun m!1226003 () Bool)

(assert (=> b!1338328 m!1226003))

(declare-fun m!1226005 () Bool)

(assert (=> b!1338328 m!1226005))

(declare-fun m!1226007 () Bool)

(assert (=> b!1338328 m!1226007))

(declare-fun m!1226009 () Bool)

(assert (=> b!1338328 m!1226009))

(declare-fun m!1226011 () Bool)

(assert (=> b!1338328 m!1226011))

(declare-fun m!1226013 () Bool)

(assert (=> b!1338328 m!1226013))

(declare-fun m!1226015 () Bool)

(assert (=> b!1338328 m!1226015))

(declare-fun m!1226017 () Bool)

(assert (=> b!1338328 m!1226017))

(assert (=> b!1338328 m!1225999))

(declare-fun m!1226019 () Bool)

(assert (=> b!1338328 m!1226019))

(assert (=> b!1338328 m!1226003))

(declare-fun m!1226021 () Bool)

(assert (=> b!1338328 m!1226021))

(declare-fun m!1226023 () Bool)

(assert (=> b!1338328 m!1226023))

(assert (=> b!1338328 m!1225993))

(assert (=> b!1338328 m!1226007))

(assert (=> bm!64995 m!1226011))

(declare-fun m!1226025 () Bool)

(assert (=> b!1338339 m!1226025))

(declare-fun m!1226027 () Bool)

(assert (=> bm!64997 m!1226027))

(assert (=> b!1338326 m!1225845))

(assert (=> b!1338326 m!1225845))

(assert (=> b!1338326 m!1225851))

(assert (=> b!1338333 m!1225951))

(assert (=> b!1338333 m!1225845))

(declare-fun m!1226029 () Bool)

(assert (=> b!1338333 m!1226029))

(assert (=> b!1338333 m!1225845))

(declare-fun m!1226031 () Bool)

(assert (=> b!1338333 m!1226031))

(assert (=> b!1338333 m!1226029))

(assert (=> b!1338333 m!1225951))

(declare-fun m!1226033 () Bool)

(assert (=> b!1338333 m!1226033))

(assert (=> d!143819 m!1225839))

(declare-fun m!1226035 () Bool)

(assert (=> b!1338338 m!1226035))

(declare-fun m!1226037 () Bool)

(assert (=> b!1338320 m!1226037))

(declare-fun m!1226039 () Bool)

(assert (=> bm!64991 m!1226039))

(declare-fun m!1226041 () Bool)

(assert (=> bm!64996 m!1226041))

(assert (=> b!1338325 m!1225845))

(assert (=> b!1338325 m!1225845))

(declare-fun m!1226043 () Bool)

(assert (=> b!1338325 m!1226043))

(assert (=> b!1338332 m!1225845))

(assert (=> b!1338332 m!1225845))

(assert (=> b!1338332 m!1225851))

(assert (=> b!1338145 d!143819))

(declare-fun mapIsEmpty!57156 () Bool)

(declare-fun mapRes!57156 () Bool)

(assert (=> mapIsEmpty!57156 mapRes!57156))

(declare-fun b!1338346 () Bool)

(declare-fun e!762060 () Bool)

(assert (=> b!1338346 (= e!762060 tp_is_empty!36973)))

(declare-fun mapNonEmpty!57156 () Bool)

(declare-fun tp!108856 () Bool)

(assert (=> mapNonEmpty!57156 (= mapRes!57156 (and tp!108856 e!762060))))

(declare-fun mapKey!57156 () (_ BitVec 32))

(declare-fun mapValue!57156 () ValueCell!17588)

(declare-fun mapRest!57156 () (Array (_ BitVec 32) ValueCell!17588))

(assert (=> mapNonEmpty!57156 (= mapRest!57147 (store mapRest!57156 mapKey!57156 mapValue!57156))))

(declare-fun condMapEmpty!57156 () Bool)

(declare-fun mapDefault!57156 () ValueCell!17588)

(assert (=> mapNonEmpty!57147 (= condMapEmpty!57156 (= mapRest!57147 ((as const (Array (_ BitVec 32) ValueCell!17588)) mapDefault!57156)))))

(declare-fun e!762059 () Bool)

(assert (=> mapNonEmpty!57147 (= tp!108840 (and e!762059 mapRes!57156))))

(declare-fun b!1338347 () Bool)

(assert (=> b!1338347 (= e!762059 tp_is_empty!36973)))

(assert (= (and mapNonEmpty!57147 condMapEmpty!57156) mapIsEmpty!57156))

(assert (= (and mapNonEmpty!57147 (not condMapEmpty!57156)) mapNonEmpty!57156))

(assert (= (and mapNonEmpty!57156 ((_ is ValueCellFull!17588) mapValue!57156)) b!1338346))

(assert (= (and mapNonEmpty!57147 ((_ is ValueCellFull!17588) mapDefault!57156)) b!1338347))

(declare-fun m!1226045 () Bool)

(assert (=> mapNonEmpty!57156 m!1226045))

(declare-fun b_lambda!24269 () Bool)

(assert (= b_lambda!24265 (or (and start!112834 b_free!31063) b_lambda!24269)))

(declare-fun b_lambda!24271 () Bool)

(assert (= b_lambda!24267 (or (and start!112834 b_free!31063) b_lambda!24271)))

(check-sat (not bm!64982) (not b!1338328) (not b!1338221) (not b!1338320) (not d!143819) (not b_lambda!24271) (not bm!64995) (not b!1338318) (not b!1338285) (not b_lambda!24269) (not b!1338273) (not b!1338286) (not bm!64978) (not b!1338338) (not b!1338326) (not b!1338316) (not b!1338272) (not b!1338301) (not b!1338339) (not b!1338314) (not b!1338332) (not bm!64991) (not b!1338279) (not bm!64987) (not b!1338267) (not bm!64983) (not bm!64984) (not b!1338325) (not bm!64996) (not d!143817) (not bm!64997) (not b_next!31063) (not b!1338299) (not b!1338280) (not bm!64990) (not b!1338223) (not d!143801) (not b!1338302) b_and!50071 (not b!1338313) (not b!1338275) (not d!143803) tp_is_empty!36973 (not b!1338333) (not mapNonEmpty!57156))
(check-sat b_and!50071 (not b_next!31063))
(get-model)

(declare-fun d!143821 () Bool)

(declare-fun res!888035 () Bool)

(declare-fun e!762065 () Bool)

(assert (=> d!143821 (=> res!888035 e!762065)))

(assert (=> d!143821 (= res!888035 (and ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143821 (= (containsKey!739 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!762065)))

(declare-fun b!1338352 () Bool)

(declare-fun e!762066 () Bool)

(assert (=> b!1338352 (= e!762065 e!762066)))

(declare-fun res!888036 () Bool)

(assert (=> b!1338352 (=> (not res!888036) (not e!762066))))

(assert (=> b!1338352 (= res!888036 (and (or (not ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1338353 () Bool)

(assert (=> b!1338353 (= e!762066 (containsKey!739 (t!45452 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!143821 (not res!888035)) b!1338352))

(assert (= (and b!1338352 res!888036) b!1338353))

(declare-fun m!1226047 () Bool)

(assert (=> b!1338353 m!1226047))

(assert (=> d!143817 d!143821))

(declare-fun d!143823 () Bool)

(declare-fun isEmpty!1095 (Option!773) Bool)

(assert (=> d!143823 (= (isDefined!529 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)) (not (isEmpty!1095 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38293 () Bool)

(assert (= bs!38293 d!143823))

(assert (=> bs!38293 m!1225907))

(declare-fun m!1226049 () Bool)

(assert (=> bs!38293 m!1226049))

(assert (=> b!1338223 d!143823))

(declare-fun b!1338365 () Bool)

(declare-fun e!762072 () Option!773)

(assert (=> b!1338365 (= e!762072 None!771)))

(declare-fun e!762071 () Option!773)

(declare-fun b!1338362 () Bool)

(assert (=> b!1338362 (= e!762071 (Some!772 (_2!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))))))

(declare-fun b!1338364 () Bool)

(assert (=> b!1338364 (= e!762072 (getValueByKey!722 (t!45452 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) k0!1153))))

(declare-fun b!1338363 () Bool)

(assert (=> b!1338363 (= e!762071 e!762072)))

(declare-fun c!126227 () Bool)

(assert (=> b!1338363 (= c!126227 (and ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (not (= (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153))))))

(declare-fun d!143825 () Bool)

(declare-fun c!126226 () Bool)

(assert (=> d!143825 (= c!126226 (and ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143825 (= (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) e!762071)))

(assert (= (and d!143825 c!126226) b!1338362))

(assert (= (and d!143825 (not c!126226)) b!1338363))

(assert (= (and b!1338363 c!126227) b!1338364))

(assert (= (and b!1338363 (not c!126227)) b!1338365))

(declare-fun m!1226051 () Bool)

(assert (=> b!1338364 m!1226051))

(assert (=> b!1338223 d!143825))

(declare-fun d!143827 () Bool)

(declare-fun e!762073 () Bool)

(assert (=> d!143827 e!762073))

(declare-fun res!888037 () Bool)

(assert (=> d!143827 (=> res!888037 e!762073)))

(declare-fun lt!593451 () Bool)

(assert (=> d!143827 (= res!888037 (not lt!593451))))

(declare-fun lt!593450 () Bool)

(assert (=> d!143827 (= lt!593451 lt!593450)))

(declare-fun lt!593449 () Unit!43774)

(declare-fun e!762074 () Unit!43774)

(assert (=> d!143827 (= lt!593449 e!762074)))

(declare-fun c!126228 () Bool)

(assert (=> d!143827 (= c!126228 lt!593450)))

(assert (=> d!143827 (= lt!593450 (containsKey!739 (toList!10845 lt!593402) (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!143827 (= (contains!8945 lt!593402 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!593451)))

(declare-fun b!1338366 () Bool)

(declare-fun lt!593448 () Unit!43774)

(assert (=> b!1338366 (= e!762074 lt!593448)))

(assert (=> b!1338366 (= lt!593448 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 lt!593402) (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338366 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593402) (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338367 () Bool)

(declare-fun Unit!43780 () Unit!43774)

(assert (=> b!1338367 (= e!762074 Unit!43780)))

(declare-fun b!1338368 () Bool)

(assert (=> b!1338368 (= e!762073 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593402) (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!143827 c!126228) b!1338366))

(assert (= (and d!143827 (not c!126228)) b!1338367))

(assert (= (and d!143827 (not res!888037)) b!1338368))

(assert (=> d!143827 m!1225919))

(declare-fun m!1226053 () Bool)

(assert (=> d!143827 m!1226053))

(assert (=> b!1338366 m!1225919))

(declare-fun m!1226055 () Bool)

(assert (=> b!1338366 m!1226055))

(assert (=> b!1338366 m!1225919))

(declare-fun m!1226057 () Bool)

(assert (=> b!1338366 m!1226057))

(assert (=> b!1338366 m!1226057))

(declare-fun m!1226059 () Bool)

(assert (=> b!1338366 m!1226059))

(assert (=> b!1338368 m!1225919))

(assert (=> b!1338368 m!1226057))

(assert (=> b!1338368 m!1226057))

(assert (=> b!1338368 m!1226059))

(assert (=> b!1338272 d!143827))

(declare-fun d!143829 () Bool)

(assert (=> d!143829 (= (validKeyInArray!0 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338302 d!143829))

(declare-fun d!143831 () Bool)

(declare-fun get!22136 (Option!773) V!54401)

(assert (=> d!143831 (= (apply!1029 lt!593437 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22136 (getValueByKey!722 (toList!10845 lt!593437) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38294 () Bool)

(assert (= bs!38294 d!143831))

(declare-fun m!1226061 () Bool)

(assert (=> bs!38294 m!1226061))

(assert (=> bs!38294 m!1226061))

(declare-fun m!1226063 () Bool)

(assert (=> bs!38294 m!1226063))

(assert (=> b!1338339 d!143831))

(assert (=> d!143819 d!143811))

(assert (=> b!1338301 d!143829))

(declare-fun d!143833 () Bool)

(declare-fun e!762075 () Bool)

(assert (=> d!143833 e!762075))

(declare-fun res!888038 () Bool)

(assert (=> d!143833 (=> res!888038 e!762075)))

(declare-fun lt!593455 () Bool)

(assert (=> d!143833 (= res!888038 (not lt!593455))))

(declare-fun lt!593454 () Bool)

(assert (=> d!143833 (= lt!593455 lt!593454)))

(declare-fun lt!593453 () Unit!43774)

(declare-fun e!762076 () Unit!43774)

(assert (=> d!143833 (= lt!593453 e!762076)))

(declare-fun c!126229 () Bool)

(assert (=> d!143833 (= c!126229 lt!593454)))

(assert (=> d!143833 (= lt!593454 (containsKey!739 (toList!10845 lt!593437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143833 (= (contains!8945 lt!593437 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593455)))

(declare-fun b!1338369 () Bool)

(declare-fun lt!593452 () Unit!43774)

(assert (=> b!1338369 (= e!762076 lt!593452)))

(assert (=> b!1338369 (= lt!593452 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 lt!593437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338369 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338370 () Bool)

(declare-fun Unit!43781 () Unit!43774)

(assert (=> b!1338370 (= e!762076 Unit!43781)))

(declare-fun b!1338371 () Bool)

(assert (=> b!1338371 (= e!762075 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143833 c!126229) b!1338369))

(assert (= (and d!143833 (not c!126229)) b!1338370))

(assert (= (and d!143833 (not res!888038)) b!1338371))

(declare-fun m!1226065 () Bool)

(assert (=> d!143833 m!1226065))

(declare-fun m!1226067 () Bool)

(assert (=> b!1338369 m!1226067))

(declare-fun m!1226069 () Bool)

(assert (=> b!1338369 m!1226069))

(assert (=> b!1338369 m!1226069))

(declare-fun m!1226071 () Bool)

(assert (=> b!1338369 m!1226071))

(assert (=> b!1338371 m!1226069))

(assert (=> b!1338371 m!1226069))

(assert (=> b!1338371 m!1226071))

(assert (=> bm!64997 d!143833))

(declare-fun d!143835 () Bool)

(assert (=> d!143835 (= (validKeyInArray!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338273 d!143835))

(declare-fun d!143837 () Bool)

(declare-fun e!762077 () Bool)

(assert (=> d!143837 e!762077))

(declare-fun res!888039 () Bool)

(assert (=> d!143837 (=> res!888039 e!762077)))

(declare-fun lt!593459 () Bool)

(assert (=> d!143837 (= res!888039 (not lt!593459))))

(declare-fun lt!593458 () Bool)

(assert (=> d!143837 (= lt!593459 lt!593458)))

(declare-fun lt!593457 () Unit!43774)

(declare-fun e!762078 () Unit!43774)

(assert (=> d!143837 (= lt!593457 e!762078)))

(declare-fun c!126230 () Bool)

(assert (=> d!143837 (= c!126230 lt!593458)))

(assert (=> d!143837 (= lt!593458 (containsKey!739 (toList!10845 lt!593437) (select (arr!43837 _keys!1590) from!1980)))))

(assert (=> d!143837 (= (contains!8945 lt!593437 (select (arr!43837 _keys!1590) from!1980)) lt!593459)))

(declare-fun b!1338372 () Bool)

(declare-fun lt!593456 () Unit!43774)

(assert (=> b!1338372 (= e!762078 lt!593456)))

(assert (=> b!1338372 (= lt!593456 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 lt!593437) (select (arr!43837 _keys!1590) from!1980)))))

(assert (=> b!1338372 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593437) (select (arr!43837 _keys!1590) from!1980)))))

(declare-fun b!1338373 () Bool)

(declare-fun Unit!43782 () Unit!43774)

(assert (=> b!1338373 (= e!762078 Unit!43782)))

(declare-fun b!1338374 () Bool)

(assert (=> b!1338374 (= e!762077 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593437) (select (arr!43837 _keys!1590) from!1980))))))

(assert (= (and d!143837 c!126230) b!1338372))

(assert (= (and d!143837 (not c!126230)) b!1338373))

(assert (= (and d!143837 (not res!888039)) b!1338374))

(assert (=> d!143837 m!1225845))

(declare-fun m!1226073 () Bool)

(assert (=> d!143837 m!1226073))

(assert (=> b!1338372 m!1225845))

(declare-fun m!1226075 () Bool)

(assert (=> b!1338372 m!1226075))

(assert (=> b!1338372 m!1225845))

(declare-fun m!1226077 () Bool)

(assert (=> b!1338372 m!1226077))

(assert (=> b!1338372 m!1226077))

(declare-fun m!1226079 () Bool)

(assert (=> b!1338372 m!1226079))

(assert (=> b!1338374 m!1225845))

(assert (=> b!1338374 m!1226077))

(assert (=> b!1338374 m!1226077))

(assert (=> b!1338374 m!1226079))

(assert (=> b!1338325 d!143837))

(declare-fun d!143839 () Bool)

(assert (=> d!143839 (= (apply!1029 lt!593437 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22136 (getValueByKey!722 (toList!10845 lt!593437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38295 () Bool)

(assert (= bs!38295 d!143839))

(assert (=> bs!38295 m!1226069))

(assert (=> bs!38295 m!1226069))

(declare-fun m!1226081 () Bool)

(assert (=> bs!38295 m!1226081))

(assert (=> b!1338320 d!143839))

(declare-fun d!143841 () Bool)

(declare-fun e!762081 () Bool)

(assert (=> d!143841 e!762081))

(declare-fun res!888044 () Bool)

(assert (=> d!143841 (=> (not res!888044) (not e!762081))))

(declare-fun lt!593468 () ListLongMap!21659)

(assert (=> d!143841 (= res!888044 (contains!8945 lt!593468 (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593470 () List!31130)

(assert (=> d!143841 (= lt!593468 (ListLongMap!21660 lt!593470))))

(declare-fun lt!593471 () Unit!43774)

(declare-fun lt!593469 () Unit!43774)

(assert (=> d!143841 (= lt!593471 lt!593469)))

(assert (=> d!143841 (= (getValueByKey!722 lt!593470 (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lemmaContainsTupThenGetReturnValue!365 (List!31130 (_ BitVec 64) V!54401) Unit!43774)

(assert (=> d!143841 (= lt!593469 (lemmaContainsTupThenGetReturnValue!365 lt!593470 (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun insertStrictlySorted!494 (List!31130 (_ BitVec 64) V!54401) List!31130)

(assert (=> d!143841 (= lt!593470 (insertStrictlySorted!494 (toList!10845 call!64986) (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143841 (= (+!4774 call!64986 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593468)))

(declare-fun b!1338379 () Bool)

(declare-fun res!888045 () Bool)

(assert (=> b!1338379 (=> (not res!888045) (not e!762081))))

(assert (=> b!1338379 (= res!888045 (= (getValueByKey!722 (toList!10845 lt!593468) (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1338380 () Bool)

(declare-fun contains!8949 (List!31130 tuple2!24002) Bool)

(assert (=> b!1338380 (= e!762081 (contains!8949 (toList!10845 lt!593468) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143841 res!888044) b!1338379))

(assert (= (and b!1338379 res!888045) b!1338380))

(declare-fun m!1226083 () Bool)

(assert (=> d!143841 m!1226083))

(declare-fun m!1226085 () Bool)

(assert (=> d!143841 m!1226085))

(declare-fun m!1226087 () Bool)

(assert (=> d!143841 m!1226087))

(declare-fun m!1226089 () Bool)

(assert (=> d!143841 m!1226089))

(declare-fun m!1226091 () Bool)

(assert (=> b!1338379 m!1226091))

(declare-fun m!1226093 () Bool)

(assert (=> b!1338380 m!1226093))

(assert (=> b!1338285 d!143841))

(declare-fun d!143843 () Bool)

(assert (=> d!143843 (arrayContainsKey!0 _keys!1590 lt!593420 #b00000000000000000000000000000000)))

(declare-fun lt!593474 () Unit!43774)

(declare-fun choose!13 (array!90749 (_ BitVec 64) (_ BitVec 32)) Unit!43774)

(assert (=> d!143843 (= lt!593474 (choose!13 _keys!1590 lt!593420 #b00000000000000000000000000000000))))

(assert (=> d!143843 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143843 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593420 #b00000000000000000000000000000000) lt!593474)))

(declare-fun bs!38296 () Bool)

(assert (= bs!38296 d!143843))

(assert (=> bs!38296 m!1225981))

(declare-fun m!1226095 () Bool)

(assert (=> bs!38296 m!1226095))

(assert (=> b!1338313 d!143843))

(declare-fun d!143845 () Bool)

(declare-fun res!888050 () Bool)

(declare-fun e!762086 () Bool)

(assert (=> d!143845 (=> res!888050 e!762086)))

(assert (=> d!143845 (= res!888050 (= (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) lt!593420))))

(assert (=> d!143845 (= (arrayContainsKey!0 _keys!1590 lt!593420 #b00000000000000000000000000000000) e!762086)))

(declare-fun b!1338385 () Bool)

(declare-fun e!762087 () Bool)

(assert (=> b!1338385 (= e!762086 e!762087)))

(declare-fun res!888051 () Bool)

(assert (=> b!1338385 (=> (not res!888051) (not e!762087))))

(assert (=> b!1338385 (= res!888051 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44389 _keys!1590)))))

(declare-fun b!1338386 () Bool)

(assert (=> b!1338386 (= e!762087 (arrayContainsKey!0 _keys!1590 lt!593420 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143845 (not res!888050)) b!1338385))

(assert (= (and b!1338385 res!888051) b!1338386))

(assert (=> d!143845 m!1225969))

(declare-fun m!1226097 () Bool)

(assert (=> b!1338386 m!1226097))

(assert (=> b!1338313 d!143845))

(declare-fun b!1338399 () Bool)

(declare-fun e!762096 () SeekEntryResult!10050)

(assert (=> b!1338399 (= e!762096 Undefined!10050)))

(declare-fun d!143847 () Bool)

(declare-fun lt!593482 () SeekEntryResult!10050)

(assert (=> d!143847 (and (or ((_ is Undefined!10050) lt!593482) (not ((_ is Found!10050) lt!593482)) (and (bvsge (index!42572 lt!593482) #b00000000000000000000000000000000) (bvslt (index!42572 lt!593482) (size!44389 _keys!1590)))) (or ((_ is Undefined!10050) lt!593482) ((_ is Found!10050) lt!593482) (not ((_ is MissingZero!10050) lt!593482)) (and (bvsge (index!42571 lt!593482) #b00000000000000000000000000000000) (bvslt (index!42571 lt!593482) (size!44389 _keys!1590)))) (or ((_ is Undefined!10050) lt!593482) ((_ is Found!10050) lt!593482) ((_ is MissingZero!10050) lt!593482) (not ((_ is MissingVacant!10050) lt!593482)) (and (bvsge (index!42574 lt!593482) #b00000000000000000000000000000000) (bvslt (index!42574 lt!593482) (size!44389 _keys!1590)))) (or ((_ is Undefined!10050) lt!593482) (ite ((_ is Found!10050) lt!593482) (= (select (arr!43837 _keys!1590) (index!42572 lt!593482)) (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10050) lt!593482) (= (select (arr!43837 _keys!1590) (index!42571 lt!593482)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10050) lt!593482) (= (select (arr!43837 _keys!1590) (index!42574 lt!593482)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143847 (= lt!593482 e!762096)))

(declare-fun c!126237 () Bool)

(declare-fun lt!593481 () SeekEntryResult!10050)

(assert (=> d!143847 (= c!126237 (and ((_ is Intermediate!10050) lt!593481) (undefined!10862 lt!593481)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90749 (_ BitVec 32)) SeekEntryResult!10050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143847 (= lt!593481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!143847 (validMask!0 mask!1998)))

(assert (=> d!143847 (= (seekEntryOrOpen!0 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!593482)))

(declare-fun b!1338400 () Bool)

(declare-fun e!762094 () SeekEntryResult!10050)

(assert (=> b!1338400 (= e!762094 (MissingZero!10050 (index!42573 lt!593481)))))

(declare-fun b!1338401 () Bool)

(declare-fun c!126238 () Bool)

(declare-fun lt!593483 () (_ BitVec 64))

(assert (=> b!1338401 (= c!126238 (= lt!593483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!762095 () SeekEntryResult!10050)

(assert (=> b!1338401 (= e!762095 e!762094)))

(declare-fun b!1338402 () Bool)

(assert (=> b!1338402 (= e!762096 e!762095)))

(assert (=> b!1338402 (= lt!593483 (select (arr!43837 _keys!1590) (index!42573 lt!593481)))))

(declare-fun c!126239 () Bool)

(assert (=> b!1338402 (= c!126239 (= lt!593483 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338403 () Bool)

(assert (=> b!1338403 (= e!762095 (Found!10050 (index!42573 lt!593481)))))

(declare-fun b!1338404 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90749 (_ BitVec 32)) SeekEntryResult!10050)

(assert (=> b!1338404 (= e!762094 (seekKeyOrZeroReturnVacant!0 (x!119541 lt!593481) (index!42573 lt!593481) (index!42573 lt!593481) (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (= (and d!143847 c!126237) b!1338399))

(assert (= (and d!143847 (not c!126237)) b!1338402))

(assert (= (and b!1338402 c!126239) b!1338403))

(assert (= (and b!1338402 (not c!126239)) b!1338401))

(assert (= (and b!1338401 c!126238) b!1338400))

(assert (= (and b!1338401 (not c!126238)) b!1338404))

(declare-fun m!1226099 () Bool)

(assert (=> d!143847 m!1226099))

(assert (=> d!143847 m!1225969))

(declare-fun m!1226101 () Bool)

(assert (=> d!143847 m!1226101))

(declare-fun m!1226103 () Bool)

(assert (=> d!143847 m!1226103))

(assert (=> d!143847 m!1225839))

(declare-fun m!1226105 () Bool)

(assert (=> d!143847 m!1226105))

(declare-fun m!1226107 () Bool)

(assert (=> d!143847 m!1226107))

(assert (=> d!143847 m!1225969))

(assert (=> d!143847 m!1226099))

(declare-fun m!1226109 () Bool)

(assert (=> b!1338402 m!1226109))

(assert (=> b!1338404 m!1225969))

(declare-fun m!1226111 () Bool)

(assert (=> b!1338404 m!1226111))

(assert (=> b!1338313 d!143847))

(declare-fun d!143849 () Bool)

(declare-fun e!762097 () Bool)

(assert (=> d!143849 e!762097))

(declare-fun res!888052 () Bool)

(assert (=> d!143849 (=> (not res!888052) (not e!762097))))

(declare-fun lt!593484 () ListLongMap!21659)

(assert (=> d!143849 (= res!888052 (contains!8945 lt!593484 (_1!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!593486 () List!31130)

(assert (=> d!143849 (= lt!593484 (ListLongMap!21660 lt!593486))))

(declare-fun lt!593487 () Unit!43774)

(declare-fun lt!593485 () Unit!43774)

(assert (=> d!143849 (= lt!593487 lt!593485)))

(assert (=> d!143849 (= (getValueByKey!722 lt!593486 (_1!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!772 (_2!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143849 (= lt!593485 (lemmaContainsTupThenGetReturnValue!365 lt!593486 (_1!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143849 (= lt!593486 (insertStrictlySorted!494 (toList!10845 (ite c!126205 call!64985 (ite c!126204 call!64982 call!64984))) (_1!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143849 (= (+!4774 (ite c!126205 call!64985 (ite c!126204 call!64982 call!64984)) (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593484)))

(declare-fun b!1338405 () Bool)

(declare-fun res!888053 () Bool)

(assert (=> b!1338405 (=> (not res!888053) (not e!762097))))

(assert (=> b!1338405 (= res!888053 (= (getValueByKey!722 (toList!10845 lt!593484) (_1!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!772 (_2!12012 (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1338406 () Bool)

(assert (=> b!1338406 (= e!762097 (contains!8949 (toList!10845 lt!593484) (ite (or c!126205 c!126204) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143849 res!888052) b!1338405))

(assert (= (and b!1338405 res!888053) b!1338406))

(declare-fun m!1226113 () Bool)

(assert (=> d!143849 m!1226113))

(declare-fun m!1226115 () Bool)

(assert (=> d!143849 m!1226115))

(declare-fun m!1226117 () Bool)

(assert (=> d!143849 m!1226117))

(declare-fun m!1226119 () Bool)

(assert (=> d!143849 m!1226119))

(declare-fun m!1226121 () Bool)

(assert (=> b!1338405 m!1226121))

(declare-fun m!1226123 () Bool)

(assert (=> b!1338406 m!1226123))

(assert (=> bm!64978 d!143849))

(declare-fun d!143851 () Bool)

(assert (=> d!143851 (= (apply!1029 lt!593402 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22136 (getValueByKey!722 (toList!10845 lt!593402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38297 () Bool)

(assert (= bs!38297 d!143851))

(declare-fun m!1226125 () Bool)

(assert (=> bs!38297 m!1226125))

(assert (=> bs!38297 m!1226125))

(declare-fun m!1226127 () Bool)

(assert (=> bs!38297 m!1226127))

(assert (=> b!1338267 d!143851))

(declare-fun d!143853 () Bool)

(assert (=> d!143853 (isDefined!529 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun lt!593490 () Unit!43774)

(declare-fun choose!1977 (List!31130 (_ BitVec 64)) Unit!43774)

(assert (=> d!143853 (= lt!593490 (choose!1977 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun e!762100 () Bool)

(assert (=> d!143853 e!762100))

(declare-fun res!888056 () Bool)

(assert (=> d!143853 (=> (not res!888056) (not e!762100))))

(declare-fun isStrictlySorted!877 (List!31130) Bool)

(assert (=> d!143853 (= res!888056 (isStrictlySorted!877 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))))

(assert (=> d!143853 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) lt!593490)))

(declare-fun b!1338409 () Bool)

(assert (=> b!1338409 (= e!762100 (containsKey!739 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (= (and d!143853 res!888056) b!1338409))

(assert (=> d!143853 m!1225907))

(assert (=> d!143853 m!1225907))

(assert (=> d!143853 m!1225909))

(declare-fun m!1226129 () Bool)

(assert (=> d!143853 m!1226129))

(declare-fun m!1226131 () Bool)

(assert (=> d!143853 m!1226131))

(assert (=> b!1338409 m!1225903))

(assert (=> b!1338221 d!143853))

(assert (=> b!1338221 d!143823))

(assert (=> b!1338221 d!143825))

(declare-fun d!143855 () Bool)

(declare-fun e!762101 () Bool)

(assert (=> d!143855 e!762101))

(declare-fun res!888057 () Bool)

(assert (=> d!143855 (=> res!888057 e!762101)))

(declare-fun lt!593494 () Bool)

(assert (=> d!143855 (= res!888057 (not lt!593494))))

(declare-fun lt!593493 () Bool)

(assert (=> d!143855 (= lt!593494 lt!593493)))

(declare-fun lt!593492 () Unit!43774)

(declare-fun e!762102 () Unit!43774)

(assert (=> d!143855 (= lt!593492 e!762102)))

(declare-fun c!126240 () Bool)

(assert (=> d!143855 (= c!126240 lt!593493)))

(assert (=> d!143855 (= lt!593493 (containsKey!739 (toList!10845 lt!593437) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143855 (= (contains!8945 lt!593437 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593494)))

(declare-fun b!1338410 () Bool)

(declare-fun lt!593491 () Unit!43774)

(assert (=> b!1338410 (= e!762102 lt!593491)))

(assert (=> b!1338410 (= lt!593491 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 lt!593437) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338410 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593437) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338411 () Bool)

(declare-fun Unit!43783 () Unit!43774)

(assert (=> b!1338411 (= e!762102 Unit!43783)))

(declare-fun b!1338412 () Bool)

(assert (=> b!1338412 (= e!762101 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593437) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143855 c!126240) b!1338410))

(assert (= (and d!143855 (not c!126240)) b!1338411))

(assert (= (and d!143855 (not res!888057)) b!1338412))

(declare-fun m!1226133 () Bool)

(assert (=> d!143855 m!1226133))

(declare-fun m!1226135 () Bool)

(assert (=> b!1338410 m!1226135))

(assert (=> b!1338410 m!1226061))

(assert (=> b!1338410 m!1226061))

(declare-fun m!1226137 () Bool)

(assert (=> b!1338410 m!1226137))

(assert (=> b!1338412 m!1226061))

(assert (=> b!1338412 m!1226061))

(assert (=> b!1338412 m!1226137))

(assert (=> bm!64996 d!143855))

(declare-fun d!143857 () Bool)

(assert (=> d!143857 (= (apply!1029 lt!593402 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22136 (getValueByKey!722 (toList!10845 lt!593402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38298 () Bool)

(assert (= bs!38298 d!143857))

(declare-fun m!1226139 () Bool)

(assert (=> bs!38298 m!1226139))

(assert (=> bs!38298 m!1226139))

(declare-fun m!1226141 () Bool)

(assert (=> bs!38298 m!1226141))

(assert (=> b!1338286 d!143857))

(declare-fun d!143859 () Bool)

(declare-fun e!762103 () Bool)

(assert (=> d!143859 e!762103))

(declare-fun res!888058 () Bool)

(assert (=> d!143859 (=> res!888058 e!762103)))

(declare-fun lt!593498 () Bool)

(assert (=> d!143859 (= res!888058 (not lt!593498))))

(declare-fun lt!593497 () Bool)

(assert (=> d!143859 (= lt!593498 lt!593497)))

(declare-fun lt!593496 () Unit!43774)

(declare-fun e!762104 () Unit!43774)

(assert (=> d!143859 (= lt!593496 e!762104)))

(declare-fun c!126241 () Bool)

(assert (=> d!143859 (= c!126241 lt!593497)))

(assert (=> d!143859 (= lt!593497 (containsKey!739 (toList!10845 lt!593402) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143859 (= (contains!8945 lt!593402 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593498)))

(declare-fun b!1338413 () Bool)

(declare-fun lt!593495 () Unit!43774)

(assert (=> b!1338413 (= e!762104 lt!593495)))

(assert (=> b!1338413 (= lt!593495 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 lt!593402) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338413 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593402) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338414 () Bool)

(declare-fun Unit!43784 () Unit!43774)

(assert (=> b!1338414 (= e!762104 Unit!43784)))

(declare-fun b!1338415 () Bool)

(assert (=> b!1338415 (= e!762103 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143859 c!126241) b!1338413))

(assert (= (and d!143859 (not c!126241)) b!1338414))

(assert (= (and d!143859 (not res!888058)) b!1338415))

(declare-fun m!1226143 () Bool)

(assert (=> d!143859 m!1226143))

(declare-fun m!1226145 () Bool)

(assert (=> b!1338413 m!1226145))

(assert (=> b!1338413 m!1226125))

(assert (=> b!1338413 m!1226125))

(declare-fun m!1226147 () Bool)

(assert (=> b!1338413 m!1226147))

(assert (=> b!1338415 m!1226125))

(assert (=> b!1338415 m!1226125))

(assert (=> b!1338415 m!1226147))

(assert (=> bm!64984 d!143859))

(declare-fun d!143861 () Bool)

(declare-fun lt!593501 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!659 (List!31131) (InoxSet (_ BitVec 64)))

(assert (=> d!143861 (= lt!593501 (select (content!659 Nil!31128) (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!762109 () Bool)

(assert (=> d!143861 (= lt!593501 e!762109)))

(declare-fun res!888064 () Bool)

(assert (=> d!143861 (=> (not res!888064) (not e!762109))))

(assert (=> d!143861 (= res!888064 ((_ is Cons!31127) Nil!31128))))

(assert (=> d!143861 (= (contains!8948 Nil!31128 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)) lt!593501)))

(declare-fun b!1338420 () Bool)

(declare-fun e!762110 () Bool)

(assert (=> b!1338420 (= e!762109 e!762110)))

(declare-fun res!888063 () Bool)

(assert (=> b!1338420 (=> res!888063 e!762110)))

(assert (=> b!1338420 (= res!888063 (= (h!32336 Nil!31128) (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338421 () Bool)

(assert (=> b!1338421 (= e!762110 (contains!8948 (t!45453 Nil!31128) (select (arr!43837 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143861 res!888064) b!1338420))

(assert (= (and b!1338420 (not res!888063)) b!1338421))

(declare-fun m!1226149 () Bool)

(assert (=> d!143861 m!1226149))

(assert (=> d!143861 m!1225969))

(declare-fun m!1226151 () Bool)

(assert (=> d!143861 m!1226151))

(assert (=> b!1338421 m!1225969))

(declare-fun m!1226153 () Bool)

(assert (=> b!1338421 m!1226153))

(assert (=> b!1338299 d!143861))

(declare-fun d!143863 () Bool)

(declare-fun e!762111 () Bool)

(assert (=> d!143863 e!762111))

(declare-fun res!888065 () Bool)

(assert (=> d!143863 (=> (not res!888065) (not e!762111))))

(declare-fun lt!593502 () ListLongMap!21659)

(assert (=> d!143863 (= res!888065 (contains!8945 lt!593502 (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593504 () List!31130)

(assert (=> d!143863 (= lt!593502 (ListLongMap!21660 lt!593504))))

(declare-fun lt!593505 () Unit!43774)

(declare-fun lt!593503 () Unit!43774)

(assert (=> d!143863 (= lt!593505 lt!593503)))

(assert (=> d!143863 (= (getValueByKey!722 lt!593504 (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143863 (= lt!593503 (lemmaContainsTupThenGetReturnValue!365 lt!593504 (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143863 (= lt!593504 (insertStrictlySorted!494 (toList!10845 call!64999) (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143863 (= (+!4774 call!64999 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593502)))

(declare-fun b!1338422 () Bool)

(declare-fun res!888066 () Bool)

(assert (=> b!1338422 (=> (not res!888066) (not e!762111))))

(assert (=> b!1338422 (= res!888066 (= (getValueByKey!722 (toList!10845 lt!593502) (_1!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1338423 () Bool)

(assert (=> b!1338423 (= e!762111 (contains!8949 (toList!10845 lt!593502) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143863 res!888065) b!1338422))

(assert (= (and b!1338422 res!888066) b!1338423))

(declare-fun m!1226155 () Bool)

(assert (=> d!143863 m!1226155))

(declare-fun m!1226157 () Bool)

(assert (=> d!143863 m!1226157))

(declare-fun m!1226159 () Bool)

(assert (=> d!143863 m!1226159))

(declare-fun m!1226161 () Bool)

(assert (=> d!143863 m!1226161))

(declare-fun m!1226163 () Bool)

(assert (=> b!1338422 m!1226163))

(declare-fun m!1226165 () Bool)

(assert (=> b!1338423 m!1226165))

(assert (=> b!1338338 d!143863))

(declare-fun c!126242 () Bool)

(declare-fun call!65001 () Bool)

(declare-fun bm!64998 () Bool)

(assert (=> bm!64998 (= call!65001 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126242 (Cons!31127 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126211 (Cons!31127 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) Nil!31128) Nil!31128)) (ite c!126211 (Cons!31127 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) Nil!31128) Nil!31128))))))

(declare-fun b!1338424 () Bool)

(declare-fun e!762112 () Bool)

(assert (=> b!1338424 (= e!762112 (contains!8948 (ite c!126211 (Cons!31127 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) Nil!31128) Nil!31128) (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1338425 () Bool)

(declare-fun e!762114 () Bool)

(assert (=> b!1338425 (= e!762114 call!65001)))

(declare-fun b!1338426 () Bool)

(declare-fun e!762113 () Bool)

(declare-fun e!762115 () Bool)

(assert (=> b!1338426 (= e!762113 e!762115)))

(declare-fun res!888068 () Bool)

(assert (=> b!1338426 (=> (not res!888068) (not e!762115))))

(assert (=> b!1338426 (= res!888068 (not e!762112))))

(declare-fun res!888067 () Bool)

(assert (=> b!1338426 (=> (not res!888067) (not e!762112))))

(assert (=> b!1338426 (= res!888067 (validKeyInArray!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1338427 () Bool)

(assert (=> b!1338427 (= e!762115 e!762114)))

(assert (=> b!1338427 (= c!126242 (validKeyInArray!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1338428 () Bool)

(assert (=> b!1338428 (= e!762114 call!65001)))

(declare-fun d!143865 () Bool)

(declare-fun res!888069 () Bool)

(assert (=> d!143865 (=> res!888069 e!762113)))

(assert (=> d!143865 (= res!888069 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44389 _keys!1590)))))

(assert (=> d!143865 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126211 (Cons!31127 (select (arr!43837 _keys!1590) #b00000000000000000000000000000000) Nil!31128) Nil!31128)) e!762113)))

(assert (= (and d!143865 (not res!888069)) b!1338426))

(assert (= (and b!1338426 res!888067) b!1338424))

(assert (= (and b!1338426 res!888068) b!1338427))

(assert (= (and b!1338427 c!126242) b!1338428))

(assert (= (and b!1338427 (not c!126242)) b!1338425))

(assert (= (or b!1338428 b!1338425) bm!64998))

(declare-fun m!1226167 () Bool)

(assert (=> bm!64998 m!1226167))

(declare-fun m!1226169 () Bool)

(assert (=> bm!64998 m!1226169))

(assert (=> b!1338424 m!1226167))

(assert (=> b!1338424 m!1226167))

(declare-fun m!1226171 () Bool)

(assert (=> b!1338424 m!1226171))

(assert (=> b!1338426 m!1226167))

(assert (=> b!1338426 m!1226167))

(declare-fun m!1226173 () Bool)

(assert (=> b!1338426 m!1226173))

(assert (=> b!1338427 m!1226167))

(assert (=> b!1338427 m!1226167))

(assert (=> b!1338427 m!1226173))

(assert (=> bm!64987 d!143865))

(assert (=> b!1338314 d!143829))

(declare-fun d!143867 () Bool)

(declare-fun e!762116 () Bool)

(assert (=> d!143867 e!762116))

(declare-fun res!888070 () Bool)

(assert (=> d!143867 (=> res!888070 e!762116)))

(declare-fun lt!593509 () Bool)

(assert (=> d!143867 (= res!888070 (not lt!593509))))

(declare-fun lt!593508 () Bool)

(assert (=> d!143867 (= lt!593509 lt!593508)))

(declare-fun lt!593507 () Unit!43774)

(declare-fun e!762117 () Unit!43774)

(assert (=> d!143867 (= lt!593507 e!762117)))

(declare-fun c!126243 () Bool)

(assert (=> d!143867 (= c!126243 lt!593508)))

(assert (=> d!143867 (= lt!593508 (containsKey!739 (toList!10845 lt!593402) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143867 (= (contains!8945 lt!593402 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593509)))

(declare-fun b!1338429 () Bool)

(declare-fun lt!593506 () Unit!43774)

(assert (=> b!1338429 (= e!762117 lt!593506)))

(assert (=> b!1338429 (= lt!593506 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 lt!593402) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338429 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593402) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338430 () Bool)

(declare-fun Unit!43785 () Unit!43774)

(assert (=> b!1338430 (= e!762117 Unit!43785)))

(declare-fun b!1338431 () Bool)

(assert (=> b!1338431 (= e!762116 (isDefined!529 (getValueByKey!722 (toList!10845 lt!593402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143867 c!126243) b!1338429))

(assert (= (and d!143867 (not c!126243)) b!1338430))

(assert (= (and d!143867 (not res!888070)) b!1338431))

(declare-fun m!1226175 () Bool)

(assert (=> d!143867 m!1226175))

(declare-fun m!1226177 () Bool)

(assert (=> b!1338429 m!1226177))

(assert (=> b!1338429 m!1226139))

(assert (=> b!1338429 m!1226139))

(declare-fun m!1226179 () Bool)

(assert (=> b!1338429 m!1226179))

(assert (=> b!1338431 m!1226139))

(assert (=> b!1338431 m!1226139))

(assert (=> b!1338431 m!1226179))

(assert (=> bm!64983 d!143867))

(declare-fun d!143869 () Bool)

(declare-fun e!762118 () Bool)

(assert (=> d!143869 e!762118))

(declare-fun res!888071 () Bool)

(assert (=> d!143869 (=> (not res!888071) (not e!762118))))

(declare-fun lt!593510 () ListLongMap!21659)

(assert (=> d!143869 (= res!888071 (contains!8945 lt!593510 (_1!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!593512 () List!31130)

(assert (=> d!143869 (= lt!593510 (ListLongMap!21660 lt!593512))))

(declare-fun lt!593513 () Unit!43774)

(declare-fun lt!593511 () Unit!43774)

(assert (=> d!143869 (= lt!593513 lt!593511)))

(assert (=> d!143869 (= (getValueByKey!722 lt!593512 (_1!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!772 (_2!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143869 (= lt!593511 (lemmaContainsTupThenGetReturnValue!365 lt!593512 (_1!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143869 (= lt!593512 (insertStrictlySorted!494 (toList!10845 (ite c!126218 call!64998 (ite c!126217 call!64995 call!64997))) (_1!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143869 (= (+!4774 (ite c!126218 call!64998 (ite c!126217 call!64995 call!64997)) (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593510)))

(declare-fun b!1338432 () Bool)

(declare-fun res!888072 () Bool)

(assert (=> b!1338432 (=> (not res!888072) (not e!762118))))

(assert (=> b!1338432 (= res!888072 (= (getValueByKey!722 (toList!10845 lt!593510) (_1!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!772 (_2!12012 (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1338433 () Bool)

(assert (=> b!1338433 (= e!762118 (contains!8949 (toList!10845 lt!593510) (ite (or c!126218 c!126217) (tuple2!24003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!24003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143869 res!888071) b!1338432))

(assert (= (and b!1338432 res!888072) b!1338433))

(declare-fun m!1226181 () Bool)

(assert (=> d!143869 m!1226181))

(declare-fun m!1226183 () Bool)

(assert (=> d!143869 m!1226183))

(declare-fun m!1226185 () Bool)

(assert (=> d!143869 m!1226185))

(declare-fun m!1226187 () Bool)

(assert (=> d!143869 m!1226187))

(declare-fun m!1226189 () Bool)

(assert (=> b!1338432 m!1226189))

(declare-fun m!1226191 () Bool)

(assert (=> b!1338433 m!1226191))

(assert (=> bm!64991 d!143869))

(declare-fun d!143871 () Bool)

(assert (=> d!143871 (= (apply!1029 lt!593402 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22136 (getValueByKey!722 (toList!10845 lt!593402) (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38299 () Bool)

(assert (= bs!38299 d!143871))

(assert (=> bs!38299 m!1225919))

(assert (=> bs!38299 m!1226057))

(assert (=> bs!38299 m!1226057))

(declare-fun m!1226193 () Bool)

(assert (=> bs!38299 m!1226193))

(assert (=> b!1338280 d!143871))

(declare-fun d!143873 () Bool)

(declare-fun c!126246 () Bool)

(assert (=> d!143873 (= c!126246 ((_ is ValueCellFull!17588) (select (arr!43838 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!762121 () V!54401)

(assert (=> d!143873 (= (get!22135 (select (arr!43838 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762121)))

(declare-fun b!1338438 () Bool)

(declare-fun get!22137 (ValueCell!17588 V!54401) V!54401)

(assert (=> b!1338438 (= e!762121 (get!22137 (select (arr!43838 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338439 () Bool)

(declare-fun get!22138 (ValueCell!17588 V!54401) V!54401)

(assert (=> b!1338439 (= e!762121 (get!22138 (select (arr!43838 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143873 c!126246) b!1338438))

(assert (= (and d!143873 (not c!126246)) b!1338439))

(assert (=> b!1338438 m!1225953))

(assert (=> b!1338438 m!1225951))

(declare-fun m!1226195 () Bool)

(assert (=> b!1338438 m!1226195))

(assert (=> b!1338439 m!1225953))

(assert (=> b!1338439 m!1225951))

(declare-fun m!1226197 () Bool)

(assert (=> b!1338439 m!1226197))

(assert (=> b!1338280 d!143873))

(declare-fun d!143875 () Bool)

(assert (=> d!143875 (= (isDefined!529 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1095 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38300 () Bool)

(assert (= bs!38300 d!143875))

(assert (=> bs!38300 m!1225989))

(declare-fun m!1226199 () Bool)

(assert (=> bs!38300 m!1226199))

(assert (=> b!1338318 d!143875))

(declare-fun b!1338443 () Bool)

(declare-fun e!762123 () Option!773)

(assert (=> b!1338443 (= e!762123 None!771)))

(declare-fun b!1338440 () Bool)

(declare-fun e!762122 () Option!773)

(assert (=> b!1338440 (= e!762122 (Some!772 (_2!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(declare-fun b!1338442 () Bool)

(assert (=> b!1338442 (= e!762123 (getValueByKey!722 (t!45452 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun b!1338441 () Bool)

(assert (=> b!1338441 (= e!762122 e!762123)))

(declare-fun c!126248 () Bool)

(assert (=> b!1338441 (= c!126248 (and ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(declare-fun c!126247 () Bool)

(declare-fun d!143877 () Bool)

(assert (=> d!143877 (= c!126247 (and ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143877 (= (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!762122)))

(assert (= (and d!143877 c!126247) b!1338440))

(assert (= (and d!143877 (not c!126247)) b!1338441))

(assert (= (and b!1338441 c!126248) b!1338442))

(assert (= (and b!1338441 (not c!126248)) b!1338443))

(declare-fun m!1226201 () Bool)

(assert (=> b!1338442 m!1226201))

(assert (=> b!1338318 d!143877))

(assert (=> d!143803 d!143811))

(assert (=> b!1338279 d!143835))

(declare-fun b!1338468 () Bool)

(declare-fun e!762140 () Bool)

(assert (=> b!1338468 (= e!762140 (validKeyInArray!0 (select (arr!43837 _keys!1590) from!1980)))))

(assert (=> b!1338468 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1338469 () Bool)

(declare-fun e!762138 () Bool)

(declare-fun e!762141 () Bool)

(assert (=> b!1338469 (= e!762138 e!762141)))

(assert (=> b!1338469 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44389 _keys!1590)))))

(declare-fun lt!593529 () ListLongMap!21659)

(declare-fun res!888081 () Bool)

(assert (=> b!1338469 (= res!888081 (contains!8945 lt!593529 (select (arr!43837 _keys!1590) from!1980)))))

(assert (=> b!1338469 (=> (not res!888081) (not e!762141))))

(declare-fun d!143879 () Bool)

(declare-fun e!762144 () Bool)

(assert (=> d!143879 e!762144))

(declare-fun res!888082 () Bool)

(assert (=> d!143879 (=> (not res!888082) (not e!762144))))

(assert (=> d!143879 (= res!888082 (not (contains!8945 lt!593529 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!762142 () ListLongMap!21659)

(assert (=> d!143879 (= lt!593529 e!762142)))

(declare-fun c!126258 () Bool)

(assert (=> d!143879 (= c!126258 (bvsge from!1980 (size!44389 _keys!1590)))))

(assert (=> d!143879 (validMask!0 mask!1998)))

(assert (=> d!143879 (= (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593529)))

(declare-fun b!1338470 () Bool)

(declare-fun e!762143 () Bool)

(assert (=> b!1338470 (= e!762138 e!762143)))

(declare-fun c!126259 () Bool)

(assert (=> b!1338470 (= c!126259 (bvslt from!1980 (size!44389 _keys!1590)))))

(declare-fun b!1338471 () Bool)

(assert (=> b!1338471 (= e!762142 (ListLongMap!21660 Nil!31127))))

(declare-fun call!65004 () ListLongMap!21659)

(declare-fun bm!65001 () Bool)

(assert (=> bm!65001 (= call!65004 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338472 () Bool)

(declare-fun lt!593534 () Unit!43774)

(declare-fun lt!593530 () Unit!43774)

(assert (=> b!1338472 (= lt!593534 lt!593530)))

(declare-fun lt!593531 () (_ BitVec 64))

(declare-fun lt!593528 () V!54401)

(declare-fun lt!593533 () (_ BitVec 64))

(declare-fun lt!593532 () ListLongMap!21659)

(assert (=> b!1338472 (not (contains!8945 (+!4774 lt!593532 (tuple2!24003 lt!593531 lt!593528)) lt!593533))))

(declare-fun addStillNotContains!488 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43774)

(assert (=> b!1338472 (= lt!593530 (addStillNotContains!488 lt!593532 lt!593531 lt!593528 lt!593533))))

(assert (=> b!1338472 (= lt!593533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338472 (= lt!593528 (get!22135 (select (arr!43838 _values!1320) from!1980) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338472 (= lt!593531 (select (arr!43837 _keys!1590) from!1980))))

(assert (=> b!1338472 (= lt!593532 call!65004)))

(declare-fun e!762139 () ListLongMap!21659)

(assert (=> b!1338472 (= e!762139 (+!4774 call!65004 (tuple2!24003 (select (arr!43837 _keys!1590) from!1980) (get!22135 (select (arr!43838 _values!1320) from!1980) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338473 () Bool)

(declare-fun isEmpty!1096 (ListLongMap!21659) Bool)

(assert (=> b!1338473 (= e!762143 (isEmpty!1096 lt!593529))))

(declare-fun b!1338474 () Bool)

(assert (=> b!1338474 (= e!762144 e!762138)))

(declare-fun c!126257 () Bool)

(assert (=> b!1338474 (= c!126257 e!762140)))

(declare-fun res!888083 () Bool)

(assert (=> b!1338474 (=> (not res!888083) (not e!762140))))

(assert (=> b!1338474 (= res!888083 (bvslt from!1980 (size!44389 _keys!1590)))))

(declare-fun b!1338475 () Bool)

(assert (=> b!1338475 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44389 _keys!1590)))))

(assert (=> b!1338475 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44390 _values!1320)))))

(assert (=> b!1338475 (= e!762141 (= (apply!1029 lt!593529 (select (arr!43837 _keys!1590) from!1980)) (get!22135 (select (arr!43838 _values!1320) from!1980) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1338476 () Bool)

(assert (=> b!1338476 (= e!762142 e!762139)))

(declare-fun c!126260 () Bool)

(assert (=> b!1338476 (= c!126260 (validKeyInArray!0 (select (arr!43837 _keys!1590) from!1980)))))

(declare-fun b!1338477 () Bool)

(assert (=> b!1338477 (= e!762139 call!65004)))

(declare-fun b!1338478 () Bool)

(declare-fun res!888084 () Bool)

(assert (=> b!1338478 (=> (not res!888084) (not e!762144))))

(assert (=> b!1338478 (= res!888084 (not (contains!8945 lt!593529 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338479 () Bool)

(assert (=> b!1338479 (= e!762143 (= lt!593529 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(assert (= (and d!143879 c!126258) b!1338471))

(assert (= (and d!143879 (not c!126258)) b!1338476))

(assert (= (and b!1338476 c!126260) b!1338472))

(assert (= (and b!1338476 (not c!126260)) b!1338477))

(assert (= (or b!1338472 b!1338477) bm!65001))

(assert (= (and d!143879 res!888082) b!1338478))

(assert (= (and b!1338478 res!888084) b!1338474))

(assert (= (and b!1338474 res!888083) b!1338468))

(assert (= (and b!1338474 c!126257) b!1338469))

(assert (= (and b!1338474 (not c!126257)) b!1338470))

(assert (= (and b!1338469 res!888081) b!1338475))

(assert (= (and b!1338470 c!126259) b!1338479))

(assert (= (and b!1338470 (not c!126259)) b!1338473))

(declare-fun b_lambda!24273 () Bool)

(assert (=> (not b_lambda!24273) (not b!1338472)))

(assert (=> b!1338472 t!45459))

(declare-fun b_and!50073 () Bool)

(assert (= b_and!50071 (and (=> t!45459 result!25341) b_and!50073)))

(declare-fun b_lambda!24275 () Bool)

(assert (=> (not b_lambda!24275) (not b!1338475)))

(assert (=> b!1338475 t!45459))

(declare-fun b_and!50075 () Bool)

(assert (= b_and!50073 (and (=> t!45459 result!25341) b_and!50075)))

(declare-fun m!1226203 () Bool)

(assert (=> b!1338478 m!1226203))

(assert (=> b!1338468 m!1225845))

(assert (=> b!1338468 m!1225845))

(assert (=> b!1338468 m!1225851))

(assert (=> b!1338475 m!1226029))

(assert (=> b!1338475 m!1225951))

(assert (=> b!1338475 m!1226033))

(assert (=> b!1338475 m!1225845))

(assert (=> b!1338475 m!1225951))

(assert (=> b!1338475 m!1225845))

(declare-fun m!1226205 () Bool)

(assert (=> b!1338475 m!1226205))

(assert (=> b!1338475 m!1226029))

(declare-fun m!1226207 () Bool)

(assert (=> d!143879 m!1226207))

(assert (=> d!143879 m!1225839))

(declare-fun m!1226209 () Bool)

(assert (=> bm!65001 m!1226209))

(declare-fun m!1226211 () Bool)

(assert (=> b!1338472 m!1226211))

(declare-fun m!1226213 () Bool)

(assert (=> b!1338472 m!1226213))

(declare-fun m!1226215 () Bool)

(assert (=> b!1338472 m!1226215))

(declare-fun m!1226217 () Bool)

(assert (=> b!1338472 m!1226217))

(assert (=> b!1338472 m!1226029))

(assert (=> b!1338472 m!1225951))

(assert (=> b!1338472 m!1226033))

(assert (=> b!1338472 m!1226211))

(assert (=> b!1338472 m!1225845))

(assert (=> b!1338472 m!1225951))

(assert (=> b!1338472 m!1226029))

(assert (=> b!1338469 m!1225845))

(assert (=> b!1338469 m!1225845))

(declare-fun m!1226219 () Bool)

(assert (=> b!1338469 m!1226219))

(assert (=> b!1338479 m!1226209))

(assert (=> b!1338476 m!1225845))

(assert (=> b!1338476 m!1225845))

(assert (=> b!1338476 m!1225851))

(declare-fun m!1226221 () Bool)

(assert (=> b!1338473 m!1226221))

(assert (=> bm!64995 d!143879))

(declare-fun d!143881 () Bool)

(assert (=> d!143881 (isDefined!529 (getValueByKey!722 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!593535 () Unit!43774)

(assert (=> d!143881 (= lt!593535 (choose!1977 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!762145 () Bool)

(assert (=> d!143881 e!762145))

(declare-fun res!888085 () Bool)

(assert (=> d!143881 (=> (not res!888085) (not e!762145))))

(assert (=> d!143881 (= res!888085 (isStrictlySorted!877 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!143881 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!593535)))

(declare-fun b!1338480 () Bool)

(assert (=> b!1338480 (= e!762145 (containsKey!739 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!143881 res!888085) b!1338480))

(assert (=> d!143881 m!1225989))

(assert (=> d!143881 m!1225989))

(assert (=> d!143881 m!1225991))

(declare-fun m!1226223 () Bool)

(assert (=> d!143881 m!1226223))

(declare-fun m!1226225 () Bool)

(assert (=> d!143881 m!1226225))

(assert (=> b!1338480 m!1225985))

(assert (=> b!1338316 d!143881))

(assert (=> b!1338316 d!143875))

(assert (=> b!1338316 d!143877))

(declare-fun bm!65002 () Bool)

(declare-fun call!65005 () Bool)

(assert (=> bm!65002 (= call!65005 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1338481 () Bool)

(declare-fun e!762148 () Bool)

(assert (=> b!1338481 (= e!762148 call!65005)))

(declare-fun b!1338482 () Bool)

(declare-fun e!762146 () Bool)

(assert (=> b!1338482 (= e!762148 e!762146)))

(declare-fun lt!593537 () (_ BitVec 64))

(assert (=> b!1338482 (= lt!593537 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!593538 () Unit!43774)

(assert (=> b!1338482 (= lt!593538 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593537 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1338482 (arrayContainsKey!0 _keys!1590 lt!593537 #b00000000000000000000000000000000)))

(declare-fun lt!593536 () Unit!43774)

(assert (=> b!1338482 (= lt!593536 lt!593538)))

(declare-fun res!888087 () Bool)

(assert (=> b!1338482 (= res!888087 (= (seekEntryOrOpen!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10050 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1338482 (=> (not res!888087) (not e!762146))))

(declare-fun d!143883 () Bool)

(declare-fun res!888086 () Bool)

(declare-fun e!762147 () Bool)

(assert (=> d!143883 (=> res!888086 e!762147)))

(assert (=> d!143883 (= res!888086 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44389 _keys!1590)))))

(assert (=> d!143883 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!762147)))

(declare-fun b!1338483 () Bool)

(assert (=> b!1338483 (= e!762147 e!762148)))

(declare-fun c!126261 () Bool)

(assert (=> b!1338483 (= c!126261 (validKeyInArray!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1338484 () Bool)

(assert (=> b!1338484 (= e!762146 call!65005)))

(assert (= (and d!143883 (not res!888086)) b!1338483))

(assert (= (and b!1338483 c!126261) b!1338482))

(assert (= (and b!1338483 (not c!126261)) b!1338481))

(assert (= (and b!1338482 res!888087) b!1338484))

(assert (= (or b!1338484 b!1338481) bm!65002))

(declare-fun m!1226227 () Bool)

(assert (=> bm!65002 m!1226227))

(assert (=> b!1338482 m!1226167))

(declare-fun m!1226229 () Bool)

(assert (=> b!1338482 m!1226229))

(declare-fun m!1226231 () Bool)

(assert (=> b!1338482 m!1226231))

(assert (=> b!1338482 m!1226167))

(declare-fun m!1226233 () Bool)

(assert (=> b!1338482 m!1226233))

(assert (=> b!1338483 m!1226167))

(assert (=> b!1338483 m!1226167))

(assert (=> b!1338483 m!1226173))

(assert (=> bm!64990 d!143883))

(declare-fun d!143885 () Bool)

(assert (=> d!143885 (= (apply!1029 lt!593437 (select (arr!43837 _keys!1590) from!1980)) (get!22136 (getValueByKey!722 (toList!10845 lt!593437) (select (arr!43837 _keys!1590) from!1980))))))

(declare-fun bs!38301 () Bool)

(assert (= bs!38301 d!143885))

(assert (=> bs!38301 m!1225845))

(assert (=> bs!38301 m!1226077))

(assert (=> bs!38301 m!1226077))

(declare-fun m!1226235 () Bool)

(assert (=> bs!38301 m!1226235))

(assert (=> b!1338333 d!143885))

(declare-fun d!143887 () Bool)

(declare-fun c!126262 () Bool)

(assert (=> d!143887 (= c!126262 ((_ is ValueCellFull!17588) (select (arr!43838 _values!1320) from!1980)))))

(declare-fun e!762149 () V!54401)

(assert (=> d!143887 (= (get!22135 (select (arr!43838 _values!1320) from!1980) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762149)))

(declare-fun b!1338485 () Bool)

(assert (=> b!1338485 (= e!762149 (get!22137 (select (arr!43838 _values!1320) from!1980) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338486 () Bool)

(assert (=> b!1338486 (= e!762149 (get!22138 (select (arr!43838 _values!1320) from!1980) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143887 c!126262) b!1338485))

(assert (= (and d!143887 (not c!126262)) b!1338486))

(assert (=> b!1338485 m!1226029))

(assert (=> b!1338485 m!1225951))

(declare-fun m!1226237 () Bool)

(assert (=> b!1338485 m!1226237))

(assert (=> b!1338486 m!1226029))

(assert (=> b!1338486 m!1225951))

(declare-fun m!1226239 () Bool)

(assert (=> b!1338486 m!1226239))

(assert (=> b!1338333 d!143887))

(assert (=> b!1338332 d!143805))

(declare-fun d!143889 () Bool)

(declare-fun res!888088 () Bool)

(declare-fun e!762150 () Bool)

(assert (=> d!143889 (=> res!888088 e!762150)))

(assert (=> d!143889 (= res!888088 (and ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143889 (= (containsKey!739 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) e!762150)))

(declare-fun b!1338487 () Bool)

(declare-fun e!762151 () Bool)

(assert (=> b!1338487 (= e!762150 e!762151)))

(declare-fun res!888089 () Bool)

(assert (=> b!1338487 (=> (not res!888089) (not e!762151))))

(assert (=> b!1338487 (= res!888089 (and (or (not ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (bvsle (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)) ((_ is Cons!31126) (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!12012 (h!32335 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1338488 () Bool)

(assert (=> b!1338488 (= e!762151 (containsKey!739 (t!45452 (toList!10845 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) k0!1153))))

(assert (= (and d!143889 (not res!888088)) b!1338487))

(assert (= (and b!1338487 res!888089) b!1338488))

(declare-fun m!1226241 () Bool)

(assert (=> b!1338488 m!1226241))

(assert (=> d!143801 d!143889))

(declare-fun d!143891 () Bool)

(assert (=> d!143891 (= (apply!1029 (+!4774 lt!593427 (tuple2!24003 lt!593441 minValue!1262)) lt!593444) (apply!1029 lt!593427 lt!593444))))

(declare-fun lt!593541 () Unit!43774)

(declare-fun choose!1978 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43774)

(assert (=> d!143891 (= lt!593541 (choose!1978 lt!593427 lt!593441 minValue!1262 lt!593444))))

(declare-fun e!762154 () Bool)

(assert (=> d!143891 e!762154))

(declare-fun res!888092 () Bool)

(assert (=> d!143891 (=> (not res!888092) (not e!762154))))

(assert (=> d!143891 (= res!888092 (contains!8945 lt!593427 lt!593444))))

(assert (=> d!143891 (= (addApplyDifferent!567 lt!593427 lt!593441 minValue!1262 lt!593444) lt!593541)))

(declare-fun b!1338492 () Bool)

(assert (=> b!1338492 (= e!762154 (not (= lt!593444 lt!593441)))))

(assert (= (and d!143891 res!888092) b!1338492))

(assert (=> d!143891 m!1225993))

(assert (=> d!143891 m!1225995))

(declare-fun m!1226243 () Bool)

(assert (=> d!143891 m!1226243))

(declare-fun m!1226245 () Bool)

(assert (=> d!143891 m!1226245))

(assert (=> d!143891 m!1226001))

(assert (=> d!143891 m!1225993))

(assert (=> b!1338328 d!143891))

(declare-fun d!143893 () Bool)

(assert (=> d!143893 (= (apply!1029 (+!4774 lt!593439 (tuple2!24003 lt!593446 minValue!1262)) lt!593447) (get!22136 (getValueByKey!722 (toList!10845 (+!4774 lt!593439 (tuple2!24003 lt!593446 minValue!1262))) lt!593447)))))

(declare-fun bs!38302 () Bool)

(assert (= bs!38302 d!143893))

(declare-fun m!1226247 () Bool)

(assert (=> bs!38302 m!1226247))

(assert (=> bs!38302 m!1226247))

(declare-fun m!1226249 () Bool)

(assert (=> bs!38302 m!1226249))

(assert (=> b!1338328 d!143893))

(declare-fun d!143895 () Bool)

(assert (=> d!143895 (= (apply!1029 (+!4774 lt!593430 (tuple2!24003 lt!593436 zeroValue!1262)) lt!593440) (get!22136 (getValueByKey!722 (toList!10845 (+!4774 lt!593430 (tuple2!24003 lt!593436 zeroValue!1262))) lt!593440)))))

(declare-fun bs!38303 () Bool)

(assert (= bs!38303 d!143895))

(declare-fun m!1226251 () Bool)

(assert (=> bs!38303 m!1226251))

(assert (=> bs!38303 m!1226251))

(declare-fun m!1226253 () Bool)

(assert (=> bs!38303 m!1226253))

(assert (=> b!1338328 d!143895))

(assert (=> b!1338328 d!143879))

(declare-fun d!143897 () Bool)

(assert (=> d!143897 (= (apply!1029 lt!593439 lt!593447) (get!22136 (getValueByKey!722 (toList!10845 lt!593439) lt!593447)))))

(declare-fun bs!38304 () Bool)

(assert (= bs!38304 d!143897))

(declare-fun m!1226255 () Bool)

(assert (=> bs!38304 m!1226255))

(assert (=> bs!38304 m!1226255))

(declare-fun m!1226257 () Bool)

(assert (=> bs!38304 m!1226257))

(assert (=> b!1338328 d!143897))

(declare-fun d!143899 () Bool)

(declare-fun e!762155 () Bool)

(assert (=> d!143899 e!762155))

(declare-fun res!888093 () Bool)

(assert (=> d!143899 (=> res!888093 e!762155)))

(declare-fun lt!593545 () Bool)

(assert (=> d!143899 (= res!888093 (not lt!593545))))

(declare-fun lt!593544 () Bool)

(assert (=> d!143899 (= lt!593545 lt!593544)))

(declare-fun lt!593543 () Unit!43774)

(declare-fun e!762156 () Unit!43774)

(assert (=> d!143899 (= lt!593543 e!762156)))

(declare-fun c!126263 () Bool)

(assert (=> d!143899 (= c!126263 lt!593544)))

(assert (=> d!143899 (= lt!593544 (containsKey!739 (toList!10845 (+!4774 lt!593428 (tuple2!24003 lt!593432 zeroValue!1262))) lt!593433))))

(assert (=> d!143899 (= (contains!8945 (+!4774 lt!593428 (tuple2!24003 lt!593432 zeroValue!1262)) lt!593433) lt!593545)))

(declare-fun b!1338493 () Bool)

(declare-fun lt!593542 () Unit!43774)

(assert (=> b!1338493 (= e!762156 lt!593542)))

(assert (=> b!1338493 (= lt!593542 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 (+!4774 lt!593428 (tuple2!24003 lt!593432 zeroValue!1262))) lt!593433))))

(assert (=> b!1338493 (isDefined!529 (getValueByKey!722 (toList!10845 (+!4774 lt!593428 (tuple2!24003 lt!593432 zeroValue!1262))) lt!593433))))

(declare-fun b!1338494 () Bool)

(declare-fun Unit!43786 () Unit!43774)

(assert (=> b!1338494 (= e!762156 Unit!43786)))

(declare-fun b!1338495 () Bool)

(assert (=> b!1338495 (= e!762155 (isDefined!529 (getValueByKey!722 (toList!10845 (+!4774 lt!593428 (tuple2!24003 lt!593432 zeroValue!1262))) lt!593433)))))

(assert (= (and d!143899 c!126263) b!1338493))

(assert (= (and d!143899 (not c!126263)) b!1338494))

(assert (= (and d!143899 (not res!888093)) b!1338495))

(declare-fun m!1226259 () Bool)

(assert (=> d!143899 m!1226259))

(declare-fun m!1226261 () Bool)

(assert (=> b!1338493 m!1226261))

(declare-fun m!1226263 () Bool)

(assert (=> b!1338493 m!1226263))

(assert (=> b!1338493 m!1226263))

(declare-fun m!1226265 () Bool)

(assert (=> b!1338493 m!1226265))

(assert (=> b!1338495 m!1226263))

(assert (=> b!1338495 m!1226263))

(assert (=> b!1338495 m!1226265))

(assert (=> b!1338328 d!143899))

(declare-fun d!143901 () Bool)

(assert (=> d!143901 (= (apply!1029 lt!593430 lt!593440) (get!22136 (getValueByKey!722 (toList!10845 lt!593430) lt!593440)))))

(declare-fun bs!38305 () Bool)

(assert (= bs!38305 d!143901))

(declare-fun m!1226267 () Bool)

(assert (=> bs!38305 m!1226267))

(assert (=> bs!38305 m!1226267))

(declare-fun m!1226269 () Bool)

(assert (=> bs!38305 m!1226269))

(assert (=> b!1338328 d!143901))

(declare-fun d!143903 () Bool)

(assert (=> d!143903 (= (apply!1029 (+!4774 lt!593439 (tuple2!24003 lt!593446 minValue!1262)) lt!593447) (apply!1029 lt!593439 lt!593447))))

(declare-fun lt!593546 () Unit!43774)

(assert (=> d!143903 (= lt!593546 (choose!1978 lt!593439 lt!593446 minValue!1262 lt!593447))))

(declare-fun e!762157 () Bool)

(assert (=> d!143903 e!762157))

(declare-fun res!888094 () Bool)

(assert (=> d!143903 (=> (not res!888094) (not e!762157))))

(assert (=> d!143903 (= res!888094 (contains!8945 lt!593439 lt!593447))))

(assert (=> d!143903 (= (addApplyDifferent!567 lt!593439 lt!593446 minValue!1262 lt!593447) lt!593546)))

(declare-fun b!1338496 () Bool)

(assert (=> b!1338496 (= e!762157 (not (= lt!593447 lt!593446)))))

(assert (= (and d!143903 res!888094) b!1338496))

(assert (=> d!143903 m!1225999))

(assert (=> d!143903 m!1226019))

(declare-fun m!1226271 () Bool)

(assert (=> d!143903 m!1226271))

(declare-fun m!1226273 () Bool)

(assert (=> d!143903 m!1226273))

(assert (=> d!143903 m!1225997))

(assert (=> d!143903 m!1225999))

(assert (=> b!1338328 d!143903))

(declare-fun d!143905 () Bool)

(assert (=> d!143905 (= (apply!1029 (+!4774 lt!593430 (tuple2!24003 lt!593436 zeroValue!1262)) lt!593440) (apply!1029 lt!593430 lt!593440))))

(declare-fun lt!593547 () Unit!43774)

(assert (=> d!143905 (= lt!593547 (choose!1978 lt!593430 lt!593436 zeroValue!1262 lt!593440))))

(declare-fun e!762158 () Bool)

(assert (=> d!143905 e!762158))

(declare-fun res!888095 () Bool)

(assert (=> d!143905 (=> (not res!888095) (not e!762158))))

(assert (=> d!143905 (= res!888095 (contains!8945 lt!593430 lt!593440))))

(assert (=> d!143905 (= (addApplyDifferent!567 lt!593430 lt!593436 zeroValue!1262 lt!593440) lt!593547)))

(declare-fun b!1338497 () Bool)

(assert (=> b!1338497 (= e!762158 (not (= lt!593440 lt!593436)))))

(assert (= (and d!143905 res!888095) b!1338497))

(assert (=> d!143905 m!1226003))

(assert (=> d!143905 m!1226005))

(declare-fun m!1226275 () Bool)

(assert (=> d!143905 m!1226275))

(declare-fun m!1226277 () Bool)

(assert (=> d!143905 m!1226277))

(assert (=> d!143905 m!1226015))

(assert (=> d!143905 m!1226003))

(assert (=> b!1338328 d!143905))

(declare-fun d!143907 () Bool)

(assert (=> d!143907 (= (apply!1029 (+!4774 lt!593427 (tuple2!24003 lt!593441 minValue!1262)) lt!593444) (get!22136 (getValueByKey!722 (toList!10845 (+!4774 lt!593427 (tuple2!24003 lt!593441 minValue!1262))) lt!593444)))))

(declare-fun bs!38306 () Bool)

(assert (= bs!38306 d!143907))

(declare-fun m!1226279 () Bool)

(assert (=> bs!38306 m!1226279))

(assert (=> bs!38306 m!1226279))

(declare-fun m!1226281 () Bool)

(assert (=> bs!38306 m!1226281))

(assert (=> b!1338328 d!143907))

(declare-fun d!143909 () Bool)

(assert (=> d!143909 (= (apply!1029 lt!593427 lt!593444) (get!22136 (getValueByKey!722 (toList!10845 lt!593427) lt!593444)))))

(declare-fun bs!38307 () Bool)

(assert (= bs!38307 d!143909))

(declare-fun m!1226283 () Bool)

(assert (=> bs!38307 m!1226283))

(assert (=> bs!38307 m!1226283))

(declare-fun m!1226285 () Bool)

(assert (=> bs!38307 m!1226285))

(assert (=> b!1338328 d!143909))

(declare-fun d!143911 () Bool)

(declare-fun e!762159 () Bool)

(assert (=> d!143911 e!762159))

(declare-fun res!888096 () Bool)

(assert (=> d!143911 (=> (not res!888096) (not e!762159))))

(declare-fun lt!593548 () ListLongMap!21659)

(assert (=> d!143911 (= res!888096 (contains!8945 lt!593548 (_1!12012 (tuple2!24003 lt!593446 minValue!1262))))))

(declare-fun lt!593550 () List!31130)

(assert (=> d!143911 (= lt!593548 (ListLongMap!21660 lt!593550))))

(declare-fun lt!593551 () Unit!43774)

(declare-fun lt!593549 () Unit!43774)

(assert (=> d!143911 (= lt!593551 lt!593549)))

(assert (=> d!143911 (= (getValueByKey!722 lt!593550 (_1!12012 (tuple2!24003 lt!593446 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593446 minValue!1262))))))

(assert (=> d!143911 (= lt!593549 (lemmaContainsTupThenGetReturnValue!365 lt!593550 (_1!12012 (tuple2!24003 lt!593446 minValue!1262)) (_2!12012 (tuple2!24003 lt!593446 minValue!1262))))))

(assert (=> d!143911 (= lt!593550 (insertStrictlySorted!494 (toList!10845 lt!593439) (_1!12012 (tuple2!24003 lt!593446 minValue!1262)) (_2!12012 (tuple2!24003 lt!593446 minValue!1262))))))

(assert (=> d!143911 (= (+!4774 lt!593439 (tuple2!24003 lt!593446 minValue!1262)) lt!593548)))

(declare-fun b!1338498 () Bool)

(declare-fun res!888097 () Bool)

(assert (=> b!1338498 (=> (not res!888097) (not e!762159))))

(assert (=> b!1338498 (= res!888097 (= (getValueByKey!722 (toList!10845 lt!593548) (_1!12012 (tuple2!24003 lt!593446 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593446 minValue!1262)))))))

(declare-fun b!1338499 () Bool)

(assert (=> b!1338499 (= e!762159 (contains!8949 (toList!10845 lt!593548) (tuple2!24003 lt!593446 minValue!1262)))))

(assert (= (and d!143911 res!888096) b!1338498))

(assert (= (and b!1338498 res!888097) b!1338499))

(declare-fun m!1226287 () Bool)

(assert (=> d!143911 m!1226287))

(declare-fun m!1226289 () Bool)

(assert (=> d!143911 m!1226289))

(declare-fun m!1226291 () Bool)

(assert (=> d!143911 m!1226291))

(declare-fun m!1226293 () Bool)

(assert (=> d!143911 m!1226293))

(declare-fun m!1226295 () Bool)

(assert (=> b!1338498 m!1226295))

(declare-fun m!1226297 () Bool)

(assert (=> b!1338499 m!1226297))

(assert (=> b!1338328 d!143911))

(declare-fun d!143913 () Bool)

(declare-fun e!762160 () Bool)

(assert (=> d!143913 e!762160))

(declare-fun res!888098 () Bool)

(assert (=> d!143913 (=> (not res!888098) (not e!762160))))

(declare-fun lt!593552 () ListLongMap!21659)

(assert (=> d!143913 (= res!888098 (contains!8945 lt!593552 (_1!12012 (tuple2!24003 lt!593436 zeroValue!1262))))))

(declare-fun lt!593554 () List!31130)

(assert (=> d!143913 (= lt!593552 (ListLongMap!21660 lt!593554))))

(declare-fun lt!593555 () Unit!43774)

(declare-fun lt!593553 () Unit!43774)

(assert (=> d!143913 (= lt!593555 lt!593553)))

(assert (=> d!143913 (= (getValueByKey!722 lt!593554 (_1!12012 (tuple2!24003 lt!593436 zeroValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593436 zeroValue!1262))))))

(assert (=> d!143913 (= lt!593553 (lemmaContainsTupThenGetReturnValue!365 lt!593554 (_1!12012 (tuple2!24003 lt!593436 zeroValue!1262)) (_2!12012 (tuple2!24003 lt!593436 zeroValue!1262))))))

(assert (=> d!143913 (= lt!593554 (insertStrictlySorted!494 (toList!10845 lt!593430) (_1!12012 (tuple2!24003 lt!593436 zeroValue!1262)) (_2!12012 (tuple2!24003 lt!593436 zeroValue!1262))))))

(assert (=> d!143913 (= (+!4774 lt!593430 (tuple2!24003 lt!593436 zeroValue!1262)) lt!593552)))

(declare-fun b!1338500 () Bool)

(declare-fun res!888099 () Bool)

(assert (=> b!1338500 (=> (not res!888099) (not e!762160))))

(assert (=> b!1338500 (= res!888099 (= (getValueByKey!722 (toList!10845 lt!593552) (_1!12012 (tuple2!24003 lt!593436 zeroValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593436 zeroValue!1262)))))))

(declare-fun b!1338501 () Bool)

(assert (=> b!1338501 (= e!762160 (contains!8949 (toList!10845 lt!593552) (tuple2!24003 lt!593436 zeroValue!1262)))))

(assert (= (and d!143913 res!888098) b!1338500))

(assert (= (and b!1338500 res!888099) b!1338501))

(declare-fun m!1226299 () Bool)

(assert (=> d!143913 m!1226299))

(declare-fun m!1226301 () Bool)

(assert (=> d!143913 m!1226301))

(declare-fun m!1226303 () Bool)

(assert (=> d!143913 m!1226303))

(declare-fun m!1226305 () Bool)

(assert (=> d!143913 m!1226305))

(declare-fun m!1226307 () Bool)

(assert (=> b!1338500 m!1226307))

(declare-fun m!1226309 () Bool)

(assert (=> b!1338501 m!1226309))

(assert (=> b!1338328 d!143913))

(declare-fun d!143915 () Bool)

(declare-fun e!762161 () Bool)

(assert (=> d!143915 e!762161))

(declare-fun res!888100 () Bool)

(assert (=> d!143915 (=> (not res!888100) (not e!762161))))

(declare-fun lt!593556 () ListLongMap!21659)

(assert (=> d!143915 (= res!888100 (contains!8945 lt!593556 (_1!12012 (tuple2!24003 lt!593432 zeroValue!1262))))))

(declare-fun lt!593558 () List!31130)

(assert (=> d!143915 (= lt!593556 (ListLongMap!21660 lt!593558))))

(declare-fun lt!593559 () Unit!43774)

(declare-fun lt!593557 () Unit!43774)

(assert (=> d!143915 (= lt!593559 lt!593557)))

(assert (=> d!143915 (= (getValueByKey!722 lt!593558 (_1!12012 (tuple2!24003 lt!593432 zeroValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593432 zeroValue!1262))))))

(assert (=> d!143915 (= lt!593557 (lemmaContainsTupThenGetReturnValue!365 lt!593558 (_1!12012 (tuple2!24003 lt!593432 zeroValue!1262)) (_2!12012 (tuple2!24003 lt!593432 zeroValue!1262))))))

(assert (=> d!143915 (= lt!593558 (insertStrictlySorted!494 (toList!10845 lt!593428) (_1!12012 (tuple2!24003 lt!593432 zeroValue!1262)) (_2!12012 (tuple2!24003 lt!593432 zeroValue!1262))))))

(assert (=> d!143915 (= (+!4774 lt!593428 (tuple2!24003 lt!593432 zeroValue!1262)) lt!593556)))

(declare-fun b!1338502 () Bool)

(declare-fun res!888101 () Bool)

(assert (=> b!1338502 (=> (not res!888101) (not e!762161))))

(assert (=> b!1338502 (= res!888101 (= (getValueByKey!722 (toList!10845 lt!593556) (_1!12012 (tuple2!24003 lt!593432 zeroValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593432 zeroValue!1262)))))))

(declare-fun b!1338503 () Bool)

(assert (=> b!1338503 (= e!762161 (contains!8949 (toList!10845 lt!593556) (tuple2!24003 lt!593432 zeroValue!1262)))))

(assert (= (and d!143915 res!888100) b!1338502))

(assert (= (and b!1338502 res!888101) b!1338503))

(declare-fun m!1226311 () Bool)

(assert (=> d!143915 m!1226311))

(declare-fun m!1226313 () Bool)

(assert (=> d!143915 m!1226313))

(declare-fun m!1226315 () Bool)

(assert (=> d!143915 m!1226315))

(declare-fun m!1226317 () Bool)

(assert (=> d!143915 m!1226317))

(declare-fun m!1226319 () Bool)

(assert (=> b!1338502 m!1226319))

(declare-fun m!1226321 () Bool)

(assert (=> b!1338503 m!1226321))

(assert (=> b!1338328 d!143915))

(declare-fun d!143917 () Bool)

(declare-fun e!762162 () Bool)

(assert (=> d!143917 e!762162))

(declare-fun res!888102 () Bool)

(assert (=> d!143917 (=> (not res!888102) (not e!762162))))

(declare-fun lt!593560 () ListLongMap!21659)

(assert (=> d!143917 (= res!888102 (contains!8945 lt!593560 (_1!12012 (tuple2!24003 lt!593441 minValue!1262))))))

(declare-fun lt!593562 () List!31130)

(assert (=> d!143917 (= lt!593560 (ListLongMap!21660 lt!593562))))

(declare-fun lt!593563 () Unit!43774)

(declare-fun lt!593561 () Unit!43774)

(assert (=> d!143917 (= lt!593563 lt!593561)))

(assert (=> d!143917 (= (getValueByKey!722 lt!593562 (_1!12012 (tuple2!24003 lt!593441 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593441 minValue!1262))))))

(assert (=> d!143917 (= lt!593561 (lemmaContainsTupThenGetReturnValue!365 lt!593562 (_1!12012 (tuple2!24003 lt!593441 minValue!1262)) (_2!12012 (tuple2!24003 lt!593441 minValue!1262))))))

(assert (=> d!143917 (= lt!593562 (insertStrictlySorted!494 (toList!10845 lt!593427) (_1!12012 (tuple2!24003 lt!593441 minValue!1262)) (_2!12012 (tuple2!24003 lt!593441 minValue!1262))))))

(assert (=> d!143917 (= (+!4774 lt!593427 (tuple2!24003 lt!593441 minValue!1262)) lt!593560)))

(declare-fun b!1338504 () Bool)

(declare-fun res!888103 () Bool)

(assert (=> b!1338504 (=> (not res!888103) (not e!762162))))

(assert (=> b!1338504 (= res!888103 (= (getValueByKey!722 (toList!10845 lt!593560) (_1!12012 (tuple2!24003 lt!593441 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593441 minValue!1262)))))))

(declare-fun b!1338505 () Bool)

(assert (=> b!1338505 (= e!762162 (contains!8949 (toList!10845 lt!593560) (tuple2!24003 lt!593441 minValue!1262)))))

(assert (= (and d!143917 res!888102) b!1338504))

(assert (= (and b!1338504 res!888103) b!1338505))

(declare-fun m!1226323 () Bool)

(assert (=> d!143917 m!1226323))

(declare-fun m!1226325 () Bool)

(assert (=> d!143917 m!1226325))

(declare-fun m!1226327 () Bool)

(assert (=> d!143917 m!1226327))

(declare-fun m!1226329 () Bool)

(assert (=> d!143917 m!1226329))

(declare-fun m!1226331 () Bool)

(assert (=> b!1338504 m!1226331))

(declare-fun m!1226333 () Bool)

(assert (=> b!1338505 m!1226333))

(assert (=> b!1338328 d!143917))

(declare-fun d!143919 () Bool)

(assert (=> d!143919 (contains!8945 (+!4774 lt!593428 (tuple2!24003 lt!593432 zeroValue!1262)) lt!593433)))

(declare-fun lt!593566 () Unit!43774)

(declare-fun choose!1979 (ListLongMap!21659 (_ BitVec 64) V!54401 (_ BitVec 64)) Unit!43774)

(assert (=> d!143919 (= lt!593566 (choose!1979 lt!593428 lt!593432 zeroValue!1262 lt!593433))))

(assert (=> d!143919 (contains!8945 lt!593428 lt!593433)))

(assert (=> d!143919 (= (addStillContains!1187 lt!593428 lt!593432 zeroValue!1262 lt!593433) lt!593566)))

(declare-fun bs!38308 () Bool)

(assert (= bs!38308 d!143919))

(assert (=> bs!38308 m!1226007))

(assert (=> bs!38308 m!1226007))

(assert (=> bs!38308 m!1226009))

(declare-fun m!1226335 () Bool)

(assert (=> bs!38308 m!1226335))

(declare-fun m!1226337 () Bool)

(assert (=> bs!38308 m!1226337))

(assert (=> b!1338328 d!143919))

(declare-fun d!143921 () Bool)

(assert (=> d!143921 (= (apply!1029 (+!4774 lt!593395 (tuple2!24003 lt!593401 zeroValue!1262)) lt!593405) (apply!1029 lt!593395 lt!593405))))

(declare-fun lt!593567 () Unit!43774)

(assert (=> d!143921 (= lt!593567 (choose!1978 lt!593395 lt!593401 zeroValue!1262 lt!593405))))

(declare-fun e!762163 () Bool)

(assert (=> d!143921 e!762163))

(declare-fun res!888104 () Bool)

(assert (=> d!143921 (=> (not res!888104) (not e!762163))))

(assert (=> d!143921 (= res!888104 (contains!8945 lt!593395 lt!593405))))

(assert (=> d!143921 (= (addApplyDifferent!567 lt!593395 lt!593401 zeroValue!1262 lt!593405) lt!593567)))

(declare-fun b!1338507 () Bool)

(assert (=> b!1338507 (= e!762163 (not (= lt!593405 lt!593401)))))

(assert (= (and d!143921 res!888104) b!1338507))

(assert (=> d!143921 m!1225923))

(assert (=> d!143921 m!1225925))

(declare-fun m!1226339 () Bool)

(assert (=> d!143921 m!1226339))

(declare-fun m!1226341 () Bool)

(assert (=> d!143921 m!1226341))

(assert (=> d!143921 m!1225935))

(assert (=> d!143921 m!1225923))

(assert (=> b!1338275 d!143921))

(declare-fun d!143923 () Bool)

(assert (=> d!143923 (= (apply!1029 lt!593404 lt!593412) (get!22136 (getValueByKey!722 (toList!10845 lt!593404) lt!593412)))))

(declare-fun bs!38309 () Bool)

(assert (= bs!38309 d!143923))

(declare-fun m!1226343 () Bool)

(assert (=> bs!38309 m!1226343))

(assert (=> bs!38309 m!1226343))

(declare-fun m!1226345 () Bool)

(assert (=> bs!38309 m!1226345))

(assert (=> b!1338275 d!143923))

(declare-fun d!143925 () Bool)

(declare-fun e!762164 () Bool)

(assert (=> d!143925 e!762164))

(declare-fun res!888105 () Bool)

(assert (=> d!143925 (=> (not res!888105) (not e!762164))))

(declare-fun lt!593568 () ListLongMap!21659)

(assert (=> d!143925 (= res!888105 (contains!8945 lt!593568 (_1!12012 (tuple2!24003 lt!593406 minValue!1262))))))

(declare-fun lt!593570 () List!31130)

(assert (=> d!143925 (= lt!593568 (ListLongMap!21660 lt!593570))))

(declare-fun lt!593571 () Unit!43774)

(declare-fun lt!593569 () Unit!43774)

(assert (=> d!143925 (= lt!593571 lt!593569)))

(assert (=> d!143925 (= (getValueByKey!722 lt!593570 (_1!12012 (tuple2!24003 lt!593406 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593406 minValue!1262))))))

(assert (=> d!143925 (= lt!593569 (lemmaContainsTupThenGetReturnValue!365 lt!593570 (_1!12012 (tuple2!24003 lt!593406 minValue!1262)) (_2!12012 (tuple2!24003 lt!593406 minValue!1262))))))

(assert (=> d!143925 (= lt!593570 (insertStrictlySorted!494 (toList!10845 lt!593392) (_1!12012 (tuple2!24003 lt!593406 minValue!1262)) (_2!12012 (tuple2!24003 lt!593406 minValue!1262))))))

(assert (=> d!143925 (= (+!4774 lt!593392 (tuple2!24003 lt!593406 minValue!1262)) lt!593568)))

(declare-fun b!1338508 () Bool)

(declare-fun res!888106 () Bool)

(assert (=> b!1338508 (=> (not res!888106) (not e!762164))))

(assert (=> b!1338508 (= res!888106 (= (getValueByKey!722 (toList!10845 lt!593568) (_1!12012 (tuple2!24003 lt!593406 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593406 minValue!1262)))))))

(declare-fun b!1338509 () Bool)

(assert (=> b!1338509 (= e!762164 (contains!8949 (toList!10845 lt!593568) (tuple2!24003 lt!593406 minValue!1262)))))

(assert (= (and d!143925 res!888105) b!1338508))

(assert (= (and b!1338508 res!888106) b!1338509))

(declare-fun m!1226347 () Bool)

(assert (=> d!143925 m!1226347))

(declare-fun m!1226349 () Bool)

(assert (=> d!143925 m!1226349))

(declare-fun m!1226351 () Bool)

(assert (=> d!143925 m!1226351))

(declare-fun m!1226353 () Bool)

(assert (=> d!143925 m!1226353))

(declare-fun m!1226355 () Bool)

(assert (=> b!1338508 m!1226355))

(declare-fun m!1226357 () Bool)

(assert (=> b!1338509 m!1226357))

(assert (=> b!1338275 d!143925))

(declare-fun d!143927 () Bool)

(assert (=> d!143927 (= (apply!1029 (+!4774 lt!593395 (tuple2!24003 lt!593401 zeroValue!1262)) lt!593405) (get!22136 (getValueByKey!722 (toList!10845 (+!4774 lt!593395 (tuple2!24003 lt!593401 zeroValue!1262))) lt!593405)))))

(declare-fun bs!38310 () Bool)

(assert (= bs!38310 d!143927))

(declare-fun m!1226359 () Bool)

(assert (=> bs!38310 m!1226359))

(assert (=> bs!38310 m!1226359))

(declare-fun m!1226361 () Bool)

(assert (=> bs!38310 m!1226361))

(assert (=> b!1338275 d!143927))

(declare-fun d!143929 () Bool)

(assert (=> d!143929 (= (apply!1029 (+!4774 lt!593392 (tuple2!24003 lt!593406 minValue!1262)) lt!593409) (apply!1029 lt!593392 lt!593409))))

(declare-fun lt!593572 () Unit!43774)

(assert (=> d!143929 (= lt!593572 (choose!1978 lt!593392 lt!593406 minValue!1262 lt!593409))))

(declare-fun e!762165 () Bool)

(assert (=> d!143929 e!762165))

(declare-fun res!888107 () Bool)

(assert (=> d!143929 (=> (not res!888107) (not e!762165))))

(assert (=> d!143929 (= res!888107 (contains!8945 lt!593392 lt!593409))))

(assert (=> d!143929 (= (addApplyDifferent!567 lt!593392 lt!593406 minValue!1262 lt!593409) lt!593572)))

(declare-fun b!1338510 () Bool)

(assert (=> b!1338510 (= e!762165 (not (= lt!593409 lt!593406)))))

(assert (= (and d!143929 res!888107) b!1338510))

(assert (=> d!143929 m!1225911))

(assert (=> d!143929 m!1225913))

(declare-fun m!1226363 () Bool)

(assert (=> d!143929 m!1226363))

(declare-fun m!1226365 () Bool)

(assert (=> d!143929 m!1226365))

(assert (=> d!143929 m!1225921))

(assert (=> d!143929 m!1225911))

(assert (=> b!1338275 d!143929))

(declare-fun d!143931 () Bool)

(declare-fun e!762166 () Bool)

(assert (=> d!143931 e!762166))

(declare-fun res!888108 () Bool)

(assert (=> d!143931 (=> res!888108 e!762166)))

(declare-fun lt!593576 () Bool)

(assert (=> d!143931 (= res!888108 (not lt!593576))))

(declare-fun lt!593575 () Bool)

(assert (=> d!143931 (= lt!593576 lt!593575)))

(declare-fun lt!593574 () Unit!43774)

(declare-fun e!762167 () Unit!43774)

(assert (=> d!143931 (= lt!593574 e!762167)))

(declare-fun c!126264 () Bool)

(assert (=> d!143931 (= c!126264 lt!593575)))

(assert (=> d!143931 (= lt!593575 (containsKey!739 (toList!10845 (+!4774 lt!593393 (tuple2!24003 lt!593397 zeroValue!1262))) lt!593398))))

(assert (=> d!143931 (= (contains!8945 (+!4774 lt!593393 (tuple2!24003 lt!593397 zeroValue!1262)) lt!593398) lt!593576)))

(declare-fun b!1338511 () Bool)

(declare-fun lt!593573 () Unit!43774)

(assert (=> b!1338511 (= e!762167 lt!593573)))

(assert (=> b!1338511 (= lt!593573 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10845 (+!4774 lt!593393 (tuple2!24003 lt!593397 zeroValue!1262))) lt!593398))))

(assert (=> b!1338511 (isDefined!529 (getValueByKey!722 (toList!10845 (+!4774 lt!593393 (tuple2!24003 lt!593397 zeroValue!1262))) lt!593398))))

(declare-fun b!1338512 () Bool)

(declare-fun Unit!43787 () Unit!43774)

(assert (=> b!1338512 (= e!762167 Unit!43787)))

(declare-fun b!1338513 () Bool)

(assert (=> b!1338513 (= e!762166 (isDefined!529 (getValueByKey!722 (toList!10845 (+!4774 lt!593393 (tuple2!24003 lt!593397 zeroValue!1262))) lt!593398)))))

(assert (= (and d!143931 c!126264) b!1338511))

(assert (= (and d!143931 (not c!126264)) b!1338512))

(assert (= (and d!143931 (not res!888108)) b!1338513))

(declare-fun m!1226367 () Bool)

(assert (=> d!143931 m!1226367))

(declare-fun m!1226369 () Bool)

(assert (=> b!1338511 m!1226369))

(declare-fun m!1226371 () Bool)

(assert (=> b!1338511 m!1226371))

(assert (=> b!1338511 m!1226371))

(declare-fun m!1226373 () Bool)

(assert (=> b!1338511 m!1226373))

(assert (=> b!1338513 m!1226371))

(assert (=> b!1338513 m!1226371))

(assert (=> b!1338513 m!1226373))

(assert (=> b!1338275 d!143931))

(declare-fun d!143933 () Bool)

(assert (=> d!143933 (= (apply!1029 lt!593392 lt!593409) (get!22136 (getValueByKey!722 (toList!10845 lt!593392) lt!593409)))))

(declare-fun bs!38311 () Bool)

(assert (= bs!38311 d!143933))

(declare-fun m!1226375 () Bool)

(assert (=> bs!38311 m!1226375))

(assert (=> bs!38311 m!1226375))

(declare-fun m!1226377 () Bool)

(assert (=> bs!38311 m!1226377))

(assert (=> b!1338275 d!143933))

(declare-fun d!143935 () Bool)

(assert (=> d!143935 (= (apply!1029 (+!4774 lt!593392 (tuple2!24003 lt!593406 minValue!1262)) lt!593409) (get!22136 (getValueByKey!722 (toList!10845 (+!4774 lt!593392 (tuple2!24003 lt!593406 minValue!1262))) lt!593409)))))

(declare-fun bs!38312 () Bool)

(assert (= bs!38312 d!143935))

(declare-fun m!1226379 () Bool)

(assert (=> bs!38312 m!1226379))

(assert (=> bs!38312 m!1226379))

(declare-fun m!1226381 () Bool)

(assert (=> bs!38312 m!1226381))

(assert (=> b!1338275 d!143935))

(declare-fun d!143937 () Bool)

(declare-fun e!762168 () Bool)

(assert (=> d!143937 e!762168))

(declare-fun res!888109 () Bool)

(assert (=> d!143937 (=> (not res!888109) (not e!762168))))

(declare-fun lt!593577 () ListLongMap!21659)

(assert (=> d!143937 (= res!888109 (contains!8945 lt!593577 (_1!12012 (tuple2!24003 lt!593401 zeroValue!1262))))))

(declare-fun lt!593579 () List!31130)

(assert (=> d!143937 (= lt!593577 (ListLongMap!21660 lt!593579))))

(declare-fun lt!593580 () Unit!43774)

(declare-fun lt!593578 () Unit!43774)

(assert (=> d!143937 (= lt!593580 lt!593578)))

(assert (=> d!143937 (= (getValueByKey!722 lt!593579 (_1!12012 (tuple2!24003 lt!593401 zeroValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593401 zeroValue!1262))))))

(assert (=> d!143937 (= lt!593578 (lemmaContainsTupThenGetReturnValue!365 lt!593579 (_1!12012 (tuple2!24003 lt!593401 zeroValue!1262)) (_2!12012 (tuple2!24003 lt!593401 zeroValue!1262))))))

(assert (=> d!143937 (= lt!593579 (insertStrictlySorted!494 (toList!10845 lt!593395) (_1!12012 (tuple2!24003 lt!593401 zeroValue!1262)) (_2!12012 (tuple2!24003 lt!593401 zeroValue!1262))))))

(assert (=> d!143937 (= (+!4774 lt!593395 (tuple2!24003 lt!593401 zeroValue!1262)) lt!593577)))

(declare-fun b!1338514 () Bool)

(declare-fun res!888110 () Bool)

(assert (=> b!1338514 (=> (not res!888110) (not e!762168))))

(assert (=> b!1338514 (= res!888110 (= (getValueByKey!722 (toList!10845 lt!593577) (_1!12012 (tuple2!24003 lt!593401 zeroValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593401 zeroValue!1262)))))))

(declare-fun b!1338515 () Bool)

(assert (=> b!1338515 (= e!762168 (contains!8949 (toList!10845 lt!593577) (tuple2!24003 lt!593401 zeroValue!1262)))))

(assert (= (and d!143937 res!888109) b!1338514))

(assert (= (and b!1338514 res!888110) b!1338515))

(declare-fun m!1226383 () Bool)

(assert (=> d!143937 m!1226383))

(declare-fun m!1226385 () Bool)

(assert (=> d!143937 m!1226385))

(declare-fun m!1226387 () Bool)

(assert (=> d!143937 m!1226387))

(declare-fun m!1226389 () Bool)

(assert (=> d!143937 m!1226389))

(declare-fun m!1226391 () Bool)

(assert (=> b!1338514 m!1226391))

(declare-fun m!1226393 () Bool)

(assert (=> b!1338515 m!1226393))

(assert (=> b!1338275 d!143937))

(declare-fun d!143939 () Bool)

(declare-fun e!762169 () Bool)

(assert (=> d!143939 e!762169))

(declare-fun res!888111 () Bool)

(assert (=> d!143939 (=> (not res!888111) (not e!762169))))

(declare-fun lt!593581 () ListLongMap!21659)

(assert (=> d!143939 (= res!888111 (contains!8945 lt!593581 (_1!12012 (tuple2!24003 lt!593411 minValue!1262))))))

(declare-fun lt!593583 () List!31130)

(assert (=> d!143939 (= lt!593581 (ListLongMap!21660 lt!593583))))

(declare-fun lt!593584 () Unit!43774)

(declare-fun lt!593582 () Unit!43774)

(assert (=> d!143939 (= lt!593584 lt!593582)))

(assert (=> d!143939 (= (getValueByKey!722 lt!593583 (_1!12012 (tuple2!24003 lt!593411 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593411 minValue!1262))))))

(assert (=> d!143939 (= lt!593582 (lemmaContainsTupThenGetReturnValue!365 lt!593583 (_1!12012 (tuple2!24003 lt!593411 minValue!1262)) (_2!12012 (tuple2!24003 lt!593411 minValue!1262))))))

(assert (=> d!143939 (= lt!593583 (insertStrictlySorted!494 (toList!10845 lt!593404) (_1!12012 (tuple2!24003 lt!593411 minValue!1262)) (_2!12012 (tuple2!24003 lt!593411 minValue!1262))))))

(assert (=> d!143939 (= (+!4774 lt!593404 (tuple2!24003 lt!593411 minValue!1262)) lt!593581)))

(declare-fun b!1338516 () Bool)

(declare-fun res!888112 () Bool)

(assert (=> b!1338516 (=> (not res!888112) (not e!762169))))

(assert (=> b!1338516 (= res!888112 (= (getValueByKey!722 (toList!10845 lt!593581) (_1!12012 (tuple2!24003 lt!593411 minValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593411 minValue!1262)))))))

(declare-fun b!1338517 () Bool)

(assert (=> b!1338517 (= e!762169 (contains!8949 (toList!10845 lt!593581) (tuple2!24003 lt!593411 minValue!1262)))))

(assert (= (and d!143939 res!888111) b!1338516))

(assert (= (and b!1338516 res!888112) b!1338517))

(declare-fun m!1226395 () Bool)

(assert (=> d!143939 m!1226395))

(declare-fun m!1226397 () Bool)

(assert (=> d!143939 m!1226397))

(declare-fun m!1226399 () Bool)

(assert (=> d!143939 m!1226399))

(declare-fun m!1226401 () Bool)

(assert (=> d!143939 m!1226401))

(declare-fun m!1226403 () Bool)

(assert (=> b!1338516 m!1226403))

(declare-fun m!1226405 () Bool)

(assert (=> b!1338517 m!1226405))

(assert (=> b!1338275 d!143939))

(declare-fun d!143941 () Bool)

(assert (=> d!143941 (contains!8945 (+!4774 lt!593393 (tuple2!24003 lt!593397 zeroValue!1262)) lt!593398)))

(declare-fun lt!593585 () Unit!43774)

(assert (=> d!143941 (= lt!593585 (choose!1979 lt!593393 lt!593397 zeroValue!1262 lt!593398))))

(assert (=> d!143941 (contains!8945 lt!593393 lt!593398)))

(assert (=> d!143941 (= (addStillContains!1187 lt!593393 lt!593397 zeroValue!1262 lt!593398) lt!593585)))

(declare-fun bs!38313 () Bool)

(assert (= bs!38313 d!143941))

(assert (=> bs!38313 m!1225927))

(assert (=> bs!38313 m!1225927))

(assert (=> bs!38313 m!1225929))

(declare-fun m!1226407 () Bool)

(assert (=> bs!38313 m!1226407))

(declare-fun m!1226409 () Bool)

(assert (=> bs!38313 m!1226409))

(assert (=> b!1338275 d!143941))

(declare-fun d!143943 () Bool)

(declare-fun e!762170 () Bool)

(assert (=> d!143943 e!762170))

(declare-fun res!888113 () Bool)

(assert (=> d!143943 (=> (not res!888113) (not e!762170))))

(declare-fun lt!593586 () ListLongMap!21659)

(assert (=> d!143943 (= res!888113 (contains!8945 lt!593586 (_1!12012 (tuple2!24003 lt!593397 zeroValue!1262))))))

(declare-fun lt!593588 () List!31130)

(assert (=> d!143943 (= lt!593586 (ListLongMap!21660 lt!593588))))

(declare-fun lt!593589 () Unit!43774)

(declare-fun lt!593587 () Unit!43774)

(assert (=> d!143943 (= lt!593589 lt!593587)))

(assert (=> d!143943 (= (getValueByKey!722 lt!593588 (_1!12012 (tuple2!24003 lt!593397 zeroValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593397 zeroValue!1262))))))

(assert (=> d!143943 (= lt!593587 (lemmaContainsTupThenGetReturnValue!365 lt!593588 (_1!12012 (tuple2!24003 lt!593397 zeroValue!1262)) (_2!12012 (tuple2!24003 lt!593397 zeroValue!1262))))))

(assert (=> d!143943 (= lt!593588 (insertStrictlySorted!494 (toList!10845 lt!593393) (_1!12012 (tuple2!24003 lt!593397 zeroValue!1262)) (_2!12012 (tuple2!24003 lt!593397 zeroValue!1262))))))

(assert (=> d!143943 (= (+!4774 lt!593393 (tuple2!24003 lt!593397 zeroValue!1262)) lt!593586)))

(declare-fun b!1338518 () Bool)

(declare-fun res!888114 () Bool)

(assert (=> b!1338518 (=> (not res!888114) (not e!762170))))

(assert (=> b!1338518 (= res!888114 (= (getValueByKey!722 (toList!10845 lt!593586) (_1!12012 (tuple2!24003 lt!593397 zeroValue!1262))) (Some!772 (_2!12012 (tuple2!24003 lt!593397 zeroValue!1262)))))))

(declare-fun b!1338519 () Bool)

(assert (=> b!1338519 (= e!762170 (contains!8949 (toList!10845 lt!593586) (tuple2!24003 lt!593397 zeroValue!1262)))))

(assert (= (and d!143943 res!888113) b!1338518))

(assert (= (and b!1338518 res!888114) b!1338519))

(declare-fun m!1226411 () Bool)

(assert (=> d!143943 m!1226411))

(declare-fun m!1226413 () Bool)

(assert (=> d!143943 m!1226413))

(declare-fun m!1226415 () Bool)

(assert (=> d!143943 m!1226415))

(declare-fun m!1226417 () Bool)

(assert (=> d!143943 m!1226417))

(declare-fun m!1226419 () Bool)

(assert (=> b!1338518 m!1226419))

(declare-fun m!1226421 () Bool)

(assert (=> b!1338519 m!1226421))

(assert (=> b!1338275 d!143943))

(declare-fun d!143945 () Bool)

(assert (=> d!143945 (= (apply!1029 (+!4774 lt!593404 (tuple2!24003 lt!593411 minValue!1262)) lt!593412) (get!22136 (getValueByKey!722 (toList!10845 (+!4774 lt!593404 (tuple2!24003 lt!593411 minValue!1262))) lt!593412)))))

(declare-fun bs!38314 () Bool)

(assert (= bs!38314 d!143945))

(declare-fun m!1226423 () Bool)

(assert (=> bs!38314 m!1226423))

(assert (=> bs!38314 m!1226423))

(declare-fun m!1226425 () Bool)

(assert (=> bs!38314 m!1226425))

(assert (=> b!1338275 d!143945))

(declare-fun d!143947 () Bool)

(assert (=> d!143947 (= (apply!1029 lt!593395 lt!593405) (get!22136 (getValueByKey!722 (toList!10845 lt!593395) lt!593405)))))

(declare-fun bs!38315 () Bool)

(assert (= bs!38315 d!143947))

(declare-fun m!1226427 () Bool)

(assert (=> bs!38315 m!1226427))

(assert (=> bs!38315 m!1226427))

(declare-fun m!1226429 () Bool)

(assert (=> bs!38315 m!1226429))

(assert (=> b!1338275 d!143947))

(declare-fun d!143949 () Bool)

(assert (=> d!143949 (= (apply!1029 (+!4774 lt!593404 (tuple2!24003 lt!593411 minValue!1262)) lt!593412) (apply!1029 lt!593404 lt!593412))))

(declare-fun lt!593590 () Unit!43774)

(assert (=> d!143949 (= lt!593590 (choose!1978 lt!593404 lt!593411 minValue!1262 lt!593412))))

(declare-fun e!762171 () Bool)

(assert (=> d!143949 e!762171))

(declare-fun res!888115 () Bool)

(assert (=> d!143949 (=> (not res!888115) (not e!762171))))

(assert (=> d!143949 (= res!888115 (contains!8945 lt!593404 lt!593412))))

(assert (=> d!143949 (= (addApplyDifferent!567 lt!593404 lt!593411 minValue!1262 lt!593412) lt!593590)))

(declare-fun b!1338520 () Bool)

(assert (=> b!1338520 (= e!762171 (not (= lt!593412 lt!593411)))))

(assert (= (and d!143949 res!888115) b!1338520))

(assert (=> d!143949 m!1225917))

(assert (=> d!143949 m!1225939))

(declare-fun m!1226431 () Bool)

(assert (=> d!143949 m!1226431))

(declare-fun m!1226433 () Bool)

(assert (=> d!143949 m!1226433))

(assert (=> d!143949 m!1225915))

(assert (=> d!143949 m!1225917))

(assert (=> b!1338275 d!143949))

(declare-fun b!1338521 () Bool)

(declare-fun e!762174 () Bool)

(assert (=> b!1338521 (= e!762174 (validKeyInArray!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338521 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1338522 () Bool)

(declare-fun e!762172 () Bool)

(declare-fun e!762175 () Bool)

(assert (=> b!1338522 (= e!762172 e!762175)))

(assert (=> b!1338522 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(declare-fun res!888116 () Bool)

(declare-fun lt!593592 () ListLongMap!21659)

(assert (=> b!1338522 (= res!888116 (contains!8945 lt!593592 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338522 (=> (not res!888116) (not e!762175))))

(declare-fun d!143951 () Bool)

(declare-fun e!762178 () Bool)

(assert (=> d!143951 e!762178))

(declare-fun res!888117 () Bool)

(assert (=> d!143951 (=> (not res!888117) (not e!762178))))

(assert (=> d!143951 (= res!888117 (not (contains!8945 lt!593592 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!762176 () ListLongMap!21659)

(assert (=> d!143951 (= lt!593592 e!762176)))

(declare-fun c!126266 () Bool)

(assert (=> d!143951 (= c!126266 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(assert (=> d!143951 (validMask!0 mask!1998)))

(assert (=> d!143951 (= (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593592)))

(declare-fun b!1338523 () Bool)

(declare-fun e!762177 () Bool)

(assert (=> b!1338523 (= e!762172 e!762177)))

(declare-fun c!126267 () Bool)

(assert (=> b!1338523 (= c!126267 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(declare-fun b!1338524 () Bool)

(assert (=> b!1338524 (= e!762176 (ListLongMap!21660 Nil!31127))))

(declare-fun bm!65003 () Bool)

(declare-fun call!65006 () ListLongMap!21659)

(assert (=> bm!65003 (= call!65006 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338525 () Bool)

(declare-fun lt!593597 () Unit!43774)

(declare-fun lt!593593 () Unit!43774)

(assert (=> b!1338525 (= lt!593597 lt!593593)))

(declare-fun lt!593591 () V!54401)

(declare-fun lt!593594 () (_ BitVec 64))

(declare-fun lt!593595 () ListLongMap!21659)

(declare-fun lt!593596 () (_ BitVec 64))

(assert (=> b!1338525 (not (contains!8945 (+!4774 lt!593595 (tuple2!24003 lt!593594 lt!593591)) lt!593596))))

(assert (=> b!1338525 (= lt!593593 (addStillNotContains!488 lt!593595 lt!593594 lt!593591 lt!593596))))

(assert (=> b!1338525 (= lt!593596 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338525 (= lt!593591 (get!22135 (select (arr!43838 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338525 (= lt!593594 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338525 (= lt!593595 call!65006)))

(declare-fun e!762173 () ListLongMap!21659)

(assert (=> b!1338525 (= e!762173 (+!4774 call!65006 (tuple2!24003 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22135 (select (arr!43838 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338526 () Bool)

(assert (=> b!1338526 (= e!762177 (isEmpty!1096 lt!593592))))

(declare-fun b!1338527 () Bool)

(assert (=> b!1338527 (= e!762178 e!762172)))

(declare-fun c!126265 () Bool)

(assert (=> b!1338527 (= c!126265 e!762174)))

(declare-fun res!888118 () Bool)

(assert (=> b!1338527 (=> (not res!888118) (not e!762174))))

(assert (=> b!1338527 (= res!888118 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(declare-fun b!1338528 () Bool)

(assert (=> b!1338528 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44389 _keys!1590)))))

(assert (=> b!1338528 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44390 _values!1320)))))

(assert (=> b!1338528 (= e!762175 (= (apply!1029 lt!593592 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22135 (select (arr!43838 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1338529 () Bool)

(assert (=> b!1338529 (= e!762176 e!762173)))

(declare-fun c!126268 () Bool)

(assert (=> b!1338529 (= c!126268 (validKeyInArray!0 (select (arr!43837 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338530 () Bool)

(assert (=> b!1338530 (= e!762173 call!65006)))

(declare-fun b!1338531 () Bool)

(declare-fun res!888119 () Bool)

(assert (=> b!1338531 (=> (not res!888119) (not e!762178))))

(assert (=> b!1338531 (= res!888119 (not (contains!8945 lt!593592 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338532 () Bool)

(assert (=> b!1338532 (= e!762177 (= lt!593592 (getCurrentListMapNoExtraKeys!6417 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(assert (= (and d!143951 c!126266) b!1338524))

(assert (= (and d!143951 (not c!126266)) b!1338529))

(assert (= (and b!1338529 c!126268) b!1338525))

(assert (= (and b!1338529 (not c!126268)) b!1338530))

(assert (= (or b!1338525 b!1338530) bm!65003))

(assert (= (and d!143951 res!888117) b!1338531))

(assert (= (and b!1338531 res!888119) b!1338527))

(assert (= (and b!1338527 res!888118) b!1338521))

(assert (= (and b!1338527 c!126265) b!1338522))

(assert (= (and b!1338527 (not c!126265)) b!1338523))

(assert (= (and b!1338522 res!888116) b!1338528))

(assert (= (and b!1338523 c!126267) b!1338532))

(assert (= (and b!1338523 (not c!126267)) b!1338526))

(declare-fun b_lambda!24277 () Bool)

(assert (=> (not b_lambda!24277) (not b!1338525)))

(assert (=> b!1338525 t!45459))

(declare-fun b_and!50077 () Bool)

(assert (= b_and!50075 (and (=> t!45459 result!25341) b_and!50077)))

(declare-fun b_lambda!24279 () Bool)

(assert (=> (not b_lambda!24279) (not b!1338528)))

(assert (=> b!1338528 t!45459))

(declare-fun b_and!50079 () Bool)

(assert (= b_and!50077 (and (=> t!45459 result!25341) b_and!50079)))

(declare-fun m!1226435 () Bool)

(assert (=> b!1338531 m!1226435))

(assert (=> b!1338521 m!1225919))

(assert (=> b!1338521 m!1225919))

(assert (=> b!1338521 m!1225949))

(assert (=> b!1338528 m!1225953))

(assert (=> b!1338528 m!1225951))

(assert (=> b!1338528 m!1225957))

(assert (=> b!1338528 m!1225919))

(assert (=> b!1338528 m!1225951))

(assert (=> b!1338528 m!1225919))

(declare-fun m!1226437 () Bool)

(assert (=> b!1338528 m!1226437))

(assert (=> b!1338528 m!1225953))

(declare-fun m!1226439 () Bool)

(assert (=> d!143951 m!1226439))

(assert (=> d!143951 m!1225839))

(declare-fun m!1226441 () Bool)

(assert (=> bm!65003 m!1226441))

(declare-fun m!1226443 () Bool)

(assert (=> b!1338525 m!1226443))

(declare-fun m!1226445 () Bool)

(assert (=> b!1338525 m!1226445))

(declare-fun m!1226447 () Bool)

(assert (=> b!1338525 m!1226447))

(declare-fun m!1226449 () Bool)

(assert (=> b!1338525 m!1226449))

(assert (=> b!1338525 m!1225953))

(assert (=> b!1338525 m!1225951))

(assert (=> b!1338525 m!1225957))

(assert (=> b!1338525 m!1226443))

(assert (=> b!1338525 m!1225919))

(assert (=> b!1338525 m!1225951))

(assert (=> b!1338525 m!1225953))

(assert (=> b!1338522 m!1225919))

(assert (=> b!1338522 m!1225919))

(declare-fun m!1226451 () Bool)

(assert (=> b!1338522 m!1226451))

(assert (=> b!1338532 m!1226441))

(assert (=> b!1338529 m!1225919))

(assert (=> b!1338529 m!1225919))

(assert (=> b!1338529 m!1225949))

(declare-fun m!1226453 () Bool)

(assert (=> b!1338526 m!1226453))

(assert (=> b!1338275 d!143951))

(assert (=> b!1338326 d!143805))

(assert (=> bm!64982 d!143951))

(declare-fun mapIsEmpty!57157 () Bool)

(declare-fun mapRes!57157 () Bool)

(assert (=> mapIsEmpty!57157 mapRes!57157))

(declare-fun b!1338533 () Bool)

(declare-fun e!762180 () Bool)

(assert (=> b!1338533 (= e!762180 tp_is_empty!36973)))

(declare-fun mapNonEmpty!57157 () Bool)

(declare-fun tp!108857 () Bool)

(assert (=> mapNonEmpty!57157 (= mapRes!57157 (and tp!108857 e!762180))))

(declare-fun mapValue!57157 () ValueCell!17588)

(declare-fun mapRest!57157 () (Array (_ BitVec 32) ValueCell!17588))

(declare-fun mapKey!57157 () (_ BitVec 32))

(assert (=> mapNonEmpty!57157 (= mapRest!57156 (store mapRest!57157 mapKey!57157 mapValue!57157))))

(declare-fun condMapEmpty!57157 () Bool)

(declare-fun mapDefault!57157 () ValueCell!17588)

(assert (=> mapNonEmpty!57156 (= condMapEmpty!57157 (= mapRest!57156 ((as const (Array (_ BitVec 32) ValueCell!17588)) mapDefault!57157)))))

(declare-fun e!762179 () Bool)

(assert (=> mapNonEmpty!57156 (= tp!108856 (and e!762179 mapRes!57157))))

(declare-fun b!1338534 () Bool)

(assert (=> b!1338534 (= e!762179 tp_is_empty!36973)))

(assert (= (and mapNonEmpty!57156 condMapEmpty!57157) mapIsEmpty!57157))

(assert (= (and mapNonEmpty!57156 (not condMapEmpty!57157)) mapNonEmpty!57157))

(assert (= (and mapNonEmpty!57157 ((_ is ValueCellFull!17588) mapValue!57157)) b!1338533))

(assert (= (and mapNonEmpty!57156 ((_ is ValueCellFull!17588) mapDefault!57157)) b!1338534))

(declare-fun m!1226455 () Bool)

(assert (=> mapNonEmpty!57157 m!1226455))

(declare-fun b_lambda!24281 () Bool)

(assert (= b_lambda!24275 (or (and start!112834 b_free!31063) b_lambda!24281)))

(declare-fun b_lambda!24283 () Bool)

(assert (= b_lambda!24279 (or (and start!112834 b_free!31063) b_lambda!24283)))

(declare-fun b_lambda!24285 () Bool)

(assert (= b_lambda!24273 (or (and start!112834 b_free!31063) b_lambda!24285)))

(declare-fun b_lambda!24287 () Bool)

(assert (= b_lambda!24277 (or (and start!112834 b_free!31063) b_lambda!24287)))

(check-sat (not b!1338405) (not d!143925) (not b!1338386) (not d!143945) (not b_lambda!24287) (not d!143907) (not d!143903) (not b!1338423) (not d!143901) (not d!143839) (not b_lambda!24269) (not d!143933) (not b!1338495) (not b!1338509) (not b!1338415) (not d!143881) (not d!143841) (not d!143853) (not b!1338522) (not b!1338486) (not b!1338422) (not bm!64998) (not b!1338508) (not d!143919) (not d!143857) (not d!143861) (not b!1338421) (not b!1338412) (not b!1338371) (not d!143943) (not d!143913) (not b!1338504) (not b!1338515) (not d!143875) (not d!143827) (not b!1338374) (not b!1338424) (not b!1338431) (not b!1338521) (not d!143831) (not d!143929) (not d!143935) (not b!1338501) (not b!1338479) (not d!143867) (not d!143917) (not d!143851) (not d!143849) (not b!1338525) (not d!143843) (not d!143891) (not b!1338404) (not b!1338368) (not b!1338505) (not d!143823) (not d!143899) (not b!1338476) (not b!1338475) (not d!143915) (not b!1338410) (not bm!65003) (not b!1338519) (not d!143941) (not bm!65001) (not b!1338438) (not b!1338529) (not b!1338353) (not b_lambda!24285) (not d!143921) (not b!1338502) (not d!143905) (not b!1338379) (not b!1338426) (not d!143923) (not b!1338517) (not d!143949) (not d!143895) (not b!1338433) (not b!1338526) (not b!1338516) (not b_lambda!24281) (not b!1338493) (not bm!65002) (not d!143893) (not b!1338500) (not b!1338413) (not b!1338483) (not b_next!31063) (not b!1338442) (not d!143931) (not b!1338366) (not b_lambda!24271) (not b!1338429) (not b!1338432) (not b!1338480) (not d!143911) (not b!1338372) (not d!143869) (not b!1338409) (not d!143897) (not b_lambda!24283) (not d!143937) (not b!1338439) (not b!1338511) tp_is_empty!36973 (not b!1338472) (not b!1338513) (not b!1338482) (not d!143939) (not b!1338531) (not b!1338478) (not b!1338528) (not b!1338532) (not d!143951) (not b!1338427) (not b!1338498) (not mapNonEmpty!57157) (not b!1338468) (not d!143863) (not d!143847) (not b!1338369) (not b!1338380) (not b!1338503) (not b!1338518) (not b!1338364) (not b!1338473) (not b!1338469) (not b!1338485) (not d!143871) (not d!143879) (not d!143837) (not b!1338406) (not d!143885) b_and!50079 (not d!143859) (not d!143909) (not d!143855) (not b!1338514) (not b!1338488) (not d!143927) (not b!1338499) (not d!143833) (not d!143947))
(check-sat b_and!50079 (not b_next!31063))
