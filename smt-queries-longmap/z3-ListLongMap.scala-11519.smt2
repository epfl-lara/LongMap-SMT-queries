; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134038 () Bool)

(assert start!134038)

(declare-fun b_free!32215 () Bool)

(declare-fun b_next!32215 () Bool)

(assert (=> start!134038 (= b_free!32215 (not b_next!32215))))

(declare-fun tp!113965 () Bool)

(declare-fun b_and!51841 () Bool)

(assert (=> start!134038 (= tp!113965 b_and!51841)))

(declare-fun mapNonEmpty!59892 () Bool)

(declare-fun mapRes!59892 () Bool)

(declare-fun tp!113964 () Bool)

(declare-fun e!873386 () Bool)

(assert (=> mapNonEmpty!59892 (= mapRes!59892 (and tp!113964 e!873386))))

(declare-datatypes ((V!60201 0))(
  ( (V!60202 (val!19581 Int)) )
))
(declare-datatypes ((ValueCell!18467 0))(
  ( (ValueCellFull!18467 (v!22336 V!60201)) (EmptyCell!18467) )
))
(declare-fun mapRest!59892 () (Array (_ BitVec 32) ValueCell!18467))

(declare-fun mapValue!59892 () ValueCell!18467)

(declare-fun mapKey!59892 () (_ BitVec 32))

(declare-datatypes ((array!104606 0))(
  ( (array!104607 (arr!50489 (Array (_ BitVec 32) ValueCell!18467)) (size!51041 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104606)

(assert (=> mapNonEmpty!59892 (= (arr!50489 _values!487) (store mapRest!59892 mapKey!59892 mapValue!59892))))

(declare-fun b!1566872 () Bool)

(declare-fun tp_is_empty!38995 () Bool)

(assert (=> b!1566872 (= e!873386 tp_is_empty!38995)))

(declare-fun mapIsEmpty!59892 () Bool)

(assert (=> mapIsEmpty!59892 mapRes!59892))

(declare-fun b!1566873 () Bool)

(declare-fun res!1070976 () Bool)

(declare-fun e!873387 () Bool)

(assert (=> b!1566873 (=> (not res!1070976) (not e!873387))))

(declare-datatypes ((tuple2!25336 0))(
  ( (tuple2!25337 (_1!12679 (_ BitVec 64)) (_2!12679 V!60201)) )
))
(declare-datatypes ((List!36696 0))(
  ( (Nil!36693) (Cons!36692 (h!38140 tuple2!25336) (t!51592 List!36696)) )
))
(declare-datatypes ((ListLongMap!22771 0))(
  ( (ListLongMap!22772 (toList!11401 List!36696)) )
))
(declare-fun lt!672592 () ListLongMap!22771)

(declare-fun contains!10316 (ListLongMap!22771 (_ BitVec 64)) Bool)

(assert (=> b!1566873 (= res!1070976 (not (contains!10316 lt!672592 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566874 () Bool)

(declare-fun e!873391 () Bool)

(assert (=> b!1566874 (= e!873391 tp_is_empty!38995)))

(declare-fun b!1566875 () Bool)

(declare-fun res!1070982 () Bool)

(declare-fun e!873388 () Bool)

(assert (=> b!1566875 (=> (not res!1070982) (not e!873388))))

(declare-datatypes ((array!104608 0))(
  ( (array!104609 (arr!50490 (Array (_ BitVec 32) (_ BitVec 64))) (size!51042 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104608)

(declare-datatypes ((List!36697 0))(
  ( (Nil!36694) (Cons!36693 (h!38141 (_ BitVec 64)) (t!51593 List!36697)) )
))
(declare-fun arrayNoDuplicates!0 (array!104608 (_ BitVec 32) List!36697) Bool)

(assert (=> b!1566875 (= res!1070982 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36694))))

(declare-fun res!1070979 () Bool)

(assert (=> start!134038 (=> (not res!1070979) (not e!873388))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134038 (= res!1070979 (validMask!0 mask!947))))

(assert (=> start!134038 e!873388))

(assert (=> start!134038 tp!113965))

(assert (=> start!134038 tp_is_empty!38995))

(assert (=> start!134038 true))

(declare-fun array_inv!39429 (array!104608) Bool)

(assert (=> start!134038 (array_inv!39429 _keys!637)))

(declare-fun e!873389 () Bool)

(declare-fun array_inv!39430 (array!104606) Bool)

(assert (=> start!134038 (and (array_inv!39430 _values!487) e!873389)))

(declare-fun b!1566876 () Bool)

(declare-fun res!1070981 () Bool)

(assert (=> b!1566876 (=> (not res!1070981) (not e!873388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104608 (_ BitVec 32)) Bool)

(assert (=> b!1566876 (= res!1070981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566877 () Bool)

(declare-fun res!1070983 () Bool)

(assert (=> b!1566877 (=> (not res!1070983) (not e!873388))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566877 (= res!1070983 (not (validKeyInArray!0 (select (arr!50490 _keys!637) from!782))))))

(declare-fun b!1566878 () Bool)

(declare-fun res!1070977 () Bool)

(assert (=> b!1566878 (=> (not res!1070977) (not e!873388))))

(assert (=> b!1566878 (= res!1070977 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51042 _keys!637)) (bvslt from!782 (size!51042 _keys!637))))))

(declare-fun b!1566879 () Bool)

(assert (=> b!1566879 (= e!873388 e!873387)))

(declare-fun res!1070980 () Bool)

(assert (=> b!1566879 (=> (not res!1070980) (not e!873387))))

(assert (=> b!1566879 (= res!1070980 (not (contains!10316 lt!672592 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60201)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60201)

(declare-fun getCurrentListMapNoExtraKeys!6751 (array!104608 array!104606 (_ BitVec 32) (_ BitVec 32) V!60201 V!60201 (_ BitVec 32) Int) ListLongMap!22771)

(assert (=> b!1566879 (= lt!672592 (getCurrentListMapNoExtraKeys!6751 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566880 () Bool)

(assert (=> b!1566880 (= e!873389 (and e!873391 mapRes!59892))))

(declare-fun condMapEmpty!59892 () Bool)

(declare-fun mapDefault!59892 () ValueCell!18467)

(assert (=> b!1566880 (= condMapEmpty!59892 (= (arr!50489 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18467)) mapDefault!59892)))))

(declare-fun b!1566881 () Bool)

(declare-fun res!1070978 () Bool)

(assert (=> b!1566881 (=> (not res!1070978) (not e!873388))))

(assert (=> b!1566881 (= res!1070978 (and (= (size!51041 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51042 _keys!637) (size!51041 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566882 () Bool)

(assert (=> b!1566882 (= e!873387 (bvsge (bvsub (size!51042 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51042 _keys!637)) from!782)))))

(assert (= (and start!134038 res!1070979) b!1566881))

(assert (= (and b!1566881 res!1070978) b!1566876))

(assert (= (and b!1566876 res!1070981) b!1566875))

(assert (= (and b!1566875 res!1070982) b!1566878))

(assert (= (and b!1566878 res!1070977) b!1566877))

(assert (= (and b!1566877 res!1070983) b!1566879))

(assert (= (and b!1566879 res!1070980) b!1566873))

(assert (= (and b!1566873 res!1070976) b!1566882))

(assert (= (and b!1566880 condMapEmpty!59892) mapIsEmpty!59892))

(assert (= (and b!1566880 (not condMapEmpty!59892)) mapNonEmpty!59892))

(get-info :version)

(assert (= (and mapNonEmpty!59892 ((_ is ValueCellFull!18467) mapValue!59892)) b!1566872))

(assert (= (and b!1566880 ((_ is ValueCellFull!18467) mapDefault!59892)) b!1566874))

(assert (= start!134038 b!1566880))

(declare-fun m!1441219 () Bool)

(assert (=> b!1566879 m!1441219))

(declare-fun m!1441221 () Bool)

(assert (=> b!1566879 m!1441221))

(declare-fun m!1441223 () Bool)

(assert (=> b!1566875 m!1441223))

(declare-fun m!1441225 () Bool)

(assert (=> mapNonEmpty!59892 m!1441225))

(declare-fun m!1441227 () Bool)

(assert (=> b!1566876 m!1441227))

(declare-fun m!1441229 () Bool)

(assert (=> b!1566873 m!1441229))

(declare-fun m!1441231 () Bool)

(assert (=> b!1566877 m!1441231))

(assert (=> b!1566877 m!1441231))

(declare-fun m!1441233 () Bool)

(assert (=> b!1566877 m!1441233))

(declare-fun m!1441235 () Bool)

(assert (=> start!134038 m!1441235))

(declare-fun m!1441237 () Bool)

(assert (=> start!134038 m!1441237))

(declare-fun m!1441239 () Bool)

(assert (=> start!134038 m!1441239))

(check-sat (not b_next!32215) b_and!51841 (not b!1566879) (not mapNonEmpty!59892) (not b!1566873) (not start!134038) (not b!1566876) (not b!1566875) (not b!1566877) tp_is_empty!38995)
(check-sat b_and!51841 (not b_next!32215))
(get-model)

(declare-fun d!163295 () Bool)

(declare-fun res!1071037 () Bool)

(declare-fun e!873436 () Bool)

(assert (=> d!163295 (=> res!1071037 e!873436)))

(assert (=> d!163295 (= res!1071037 (bvsge #b00000000000000000000000000000000 (size!51042 _keys!637)))))

(assert (=> d!163295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873436)))

(declare-fun b!1566957 () Bool)

(declare-fun e!873434 () Bool)

(declare-fun call!71889 () Bool)

(assert (=> b!1566957 (= e!873434 call!71889)))

(declare-fun bm!71886 () Bool)

(assert (=> bm!71886 (= call!71889 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566958 () Bool)

(declare-fun e!873435 () Bool)

(assert (=> b!1566958 (= e!873436 e!873435)))

(declare-fun c!144377 () Bool)

(assert (=> b!1566958 (= c!144377 (validKeyInArray!0 (select (arr!50490 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566959 () Bool)

(assert (=> b!1566959 (= e!873435 call!71889)))

(declare-fun b!1566960 () Bool)

(assert (=> b!1566960 (= e!873435 e!873434)))

(declare-fun lt!672607 () (_ BitVec 64))

(assert (=> b!1566960 (= lt!672607 (select (arr!50490 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51867 0))(
  ( (Unit!51868) )
))
(declare-fun lt!672606 () Unit!51867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104608 (_ BitVec 64) (_ BitVec 32)) Unit!51867)

(assert (=> b!1566960 (= lt!672606 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672607 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1566960 (arrayContainsKey!0 _keys!637 lt!672607 #b00000000000000000000000000000000)))

(declare-fun lt!672605 () Unit!51867)

(assert (=> b!1566960 (= lt!672605 lt!672606)))

(declare-fun res!1071036 () Bool)

(declare-datatypes ((SeekEntryResult!13528 0))(
  ( (MissingZero!13528 (index!56510 (_ BitVec 32))) (Found!13528 (index!56511 (_ BitVec 32))) (Intermediate!13528 (undefined!14340 Bool) (index!56512 (_ BitVec 32)) (x!140818 (_ BitVec 32))) (Undefined!13528) (MissingVacant!13528 (index!56513 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104608 (_ BitVec 32)) SeekEntryResult!13528)

(assert (=> b!1566960 (= res!1071036 (= (seekEntryOrOpen!0 (select (arr!50490 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13528 #b00000000000000000000000000000000)))))

(assert (=> b!1566960 (=> (not res!1071036) (not e!873434))))

(assert (= (and d!163295 (not res!1071037)) b!1566958))

(assert (= (and b!1566958 c!144377) b!1566960))

(assert (= (and b!1566958 (not c!144377)) b!1566959))

(assert (= (and b!1566960 res!1071036) b!1566957))

(assert (= (or b!1566957 b!1566959) bm!71886))

(declare-fun m!1441285 () Bool)

(assert (=> bm!71886 m!1441285))

(declare-fun m!1441287 () Bool)

(assert (=> b!1566958 m!1441287))

(assert (=> b!1566958 m!1441287))

(declare-fun m!1441289 () Bool)

(assert (=> b!1566958 m!1441289))

(assert (=> b!1566960 m!1441287))

(declare-fun m!1441291 () Bool)

(assert (=> b!1566960 m!1441291))

(declare-fun m!1441293 () Bool)

(assert (=> b!1566960 m!1441293))

(assert (=> b!1566960 m!1441287))

(declare-fun m!1441295 () Bool)

(assert (=> b!1566960 m!1441295))

(assert (=> b!1566876 d!163295))

(declare-fun b!1566971 () Bool)

(declare-fun e!873446 () Bool)

(declare-fun e!873445 () Bool)

(assert (=> b!1566971 (= e!873446 e!873445)))

(declare-fun res!1071046 () Bool)

(assert (=> b!1566971 (=> (not res!1071046) (not e!873445))))

(declare-fun e!873448 () Bool)

(assert (=> b!1566971 (= res!1071046 (not e!873448))))

(declare-fun res!1071045 () Bool)

(assert (=> b!1566971 (=> (not res!1071045) (not e!873448))))

(assert (=> b!1566971 (= res!1071045 (validKeyInArray!0 (select (arr!50490 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163297 () Bool)

(declare-fun res!1071044 () Bool)

(assert (=> d!163297 (=> res!1071044 e!873446)))

(assert (=> d!163297 (= res!1071044 (bvsge #b00000000000000000000000000000000 (size!51042 _keys!637)))))

(assert (=> d!163297 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36694) e!873446)))

(declare-fun b!1566972 () Bool)

(declare-fun e!873447 () Bool)

(declare-fun call!71892 () Bool)

(assert (=> b!1566972 (= e!873447 call!71892)))

(declare-fun b!1566973 () Bool)

(assert (=> b!1566973 (= e!873447 call!71892)))

(declare-fun bm!71889 () Bool)

(declare-fun c!144380 () Bool)

(assert (=> bm!71889 (= call!71892 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144380 (Cons!36693 (select (arr!50490 _keys!637) #b00000000000000000000000000000000) Nil!36694) Nil!36694)))))

(declare-fun b!1566974 () Bool)

(assert (=> b!1566974 (= e!873445 e!873447)))

(assert (=> b!1566974 (= c!144380 (validKeyInArray!0 (select (arr!50490 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566975 () Bool)

(declare-fun contains!10318 (List!36697 (_ BitVec 64)) Bool)

(assert (=> b!1566975 (= e!873448 (contains!10318 Nil!36694 (select (arr!50490 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163297 (not res!1071044)) b!1566971))

(assert (= (and b!1566971 res!1071045) b!1566975))

(assert (= (and b!1566971 res!1071046) b!1566974))

(assert (= (and b!1566974 c!144380) b!1566973))

(assert (= (and b!1566974 (not c!144380)) b!1566972))

(assert (= (or b!1566973 b!1566972) bm!71889))

(assert (=> b!1566971 m!1441287))

(assert (=> b!1566971 m!1441287))

(assert (=> b!1566971 m!1441289))

(assert (=> bm!71889 m!1441287))

(declare-fun m!1441297 () Bool)

(assert (=> bm!71889 m!1441297))

(assert (=> b!1566974 m!1441287))

(assert (=> b!1566974 m!1441287))

(assert (=> b!1566974 m!1441289))

(assert (=> b!1566975 m!1441287))

(assert (=> b!1566975 m!1441287))

(declare-fun m!1441299 () Bool)

(assert (=> b!1566975 m!1441299))

(assert (=> b!1566875 d!163297))

(declare-fun d!163299 () Bool)

(declare-fun e!873454 () Bool)

(assert (=> d!163299 e!873454))

(declare-fun res!1071049 () Bool)

(assert (=> d!163299 (=> res!1071049 e!873454)))

(declare-fun lt!672616 () Bool)

(assert (=> d!163299 (= res!1071049 (not lt!672616))))

(declare-fun lt!672619 () Bool)

(assert (=> d!163299 (= lt!672616 lt!672619)))

(declare-fun lt!672617 () Unit!51867)

(declare-fun e!873453 () Unit!51867)

(assert (=> d!163299 (= lt!672617 e!873453)))

(declare-fun c!144383 () Bool)

(assert (=> d!163299 (= c!144383 lt!672619)))

(declare-fun containsKey!850 (List!36696 (_ BitVec 64)) Bool)

(assert (=> d!163299 (= lt!672619 (containsKey!850 (toList!11401 lt!672592) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163299 (= (contains!10316 lt!672592 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672616)))

(declare-fun b!1566982 () Bool)

(declare-fun lt!672618 () Unit!51867)

(assert (=> b!1566982 (= e!873453 lt!672618)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!534 (List!36696 (_ BitVec 64)) Unit!51867)

(assert (=> b!1566982 (= lt!672618 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11401 lt!672592) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!872 0))(
  ( (Some!871 (v!22339 V!60201)) (None!870) )
))
(declare-fun isDefined!585 (Option!872) Bool)

(declare-fun getValueByKey!797 (List!36696 (_ BitVec 64)) Option!872)

(assert (=> b!1566982 (isDefined!585 (getValueByKey!797 (toList!11401 lt!672592) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566983 () Bool)

(declare-fun Unit!51869 () Unit!51867)

(assert (=> b!1566983 (= e!873453 Unit!51869)))

(declare-fun b!1566984 () Bool)

(assert (=> b!1566984 (= e!873454 (isDefined!585 (getValueByKey!797 (toList!11401 lt!672592) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163299 c!144383) b!1566982))

(assert (= (and d!163299 (not c!144383)) b!1566983))

(assert (= (and d!163299 (not res!1071049)) b!1566984))

(declare-fun m!1441301 () Bool)

(assert (=> d!163299 m!1441301))

(declare-fun m!1441303 () Bool)

(assert (=> b!1566982 m!1441303))

(declare-fun m!1441305 () Bool)

(assert (=> b!1566982 m!1441305))

(assert (=> b!1566982 m!1441305))

(declare-fun m!1441307 () Bool)

(assert (=> b!1566982 m!1441307))

(assert (=> b!1566984 m!1441305))

(assert (=> b!1566984 m!1441305))

(assert (=> b!1566984 m!1441307))

(assert (=> b!1566879 d!163299))

(declare-fun lt!672636 () ListLongMap!22771)

(declare-fun b!1567009 () Bool)

(declare-fun e!873471 () Bool)

(assert (=> b!1567009 (= e!873471 (= lt!672636 (getCurrentListMapNoExtraKeys!6751 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1567010 () Bool)

(declare-fun res!1071059 () Bool)

(declare-fun e!873469 () Bool)

(assert (=> b!1567010 (=> (not res!1071059) (not e!873469))))

(assert (=> b!1567010 (= res!1071059 (not (contains!10316 lt!672636 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567011 () Bool)

(declare-fun e!873470 () ListLongMap!22771)

(assert (=> b!1567011 (= e!873470 (ListLongMap!22772 Nil!36693))))

(declare-fun b!1567013 () Bool)

(declare-fun e!873473 () Bool)

(assert (=> b!1567013 (= e!873473 (validKeyInArray!0 (select (arr!50490 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567013 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun b!1567014 () Bool)

(declare-fun e!873475 () ListLongMap!22771)

(assert (=> b!1567014 (= e!873470 e!873475)))

(declare-fun c!144393 () Bool)

(assert (=> b!1567014 (= c!144393 (validKeyInArray!0 (select (arr!50490 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun bm!71892 () Bool)

(declare-fun call!71895 () ListLongMap!22771)

(assert (=> bm!71892 (= call!71895 (getCurrentListMapNoExtraKeys!6751 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1567015 () Bool)

(assert (=> b!1567015 (= e!873475 call!71895)))

(declare-fun b!1567016 () Bool)

(declare-fun isEmpty!1154 (ListLongMap!22771) Bool)

(assert (=> b!1567016 (= e!873471 (isEmpty!1154 lt!672636))))

(declare-fun b!1567017 () Bool)

(assert (=> b!1567017 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51042 _keys!637)))))

(assert (=> b!1567017 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51041 _values!487)))))

(declare-fun e!873474 () Bool)

(declare-fun apply!1107 (ListLongMap!22771 (_ BitVec 64)) V!60201)

(declare-fun get!26375 (ValueCell!18467 V!60201) V!60201)

(declare-fun dynLambda!3891 (Int (_ BitVec 64)) V!60201)

(assert (=> b!1567017 (= e!873474 (= (apply!1107 lt!672636 (select (arr!50490 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26375 (select (arr!50489 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3891 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1567018 () Bool)

(declare-fun e!873472 () Bool)

(assert (=> b!1567018 (= e!873472 e!873471)))

(declare-fun c!144392 () Bool)

(assert (=> b!1567018 (= c!144392 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51042 _keys!637)))))

(declare-fun d!163301 () Bool)

(assert (=> d!163301 e!873469))

(declare-fun res!1071061 () Bool)

(assert (=> d!163301 (=> (not res!1071061) (not e!873469))))

(assert (=> d!163301 (= res!1071061 (not (contains!10316 lt!672636 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163301 (= lt!672636 e!873470)))

(declare-fun c!144394 () Bool)

(assert (=> d!163301 (= c!144394 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51042 _keys!637)))))

(assert (=> d!163301 (validMask!0 mask!947)))

(assert (=> d!163301 (= (getCurrentListMapNoExtraKeys!6751 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!672636)))

(declare-fun b!1567012 () Bool)

(assert (=> b!1567012 (= e!873472 e!873474)))

(assert (=> b!1567012 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51042 _keys!637)))))

(declare-fun res!1071060 () Bool)

(assert (=> b!1567012 (= res!1071060 (contains!10316 lt!672636 (select (arr!50490 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567012 (=> (not res!1071060) (not e!873474))))

(declare-fun b!1567019 () Bool)

(assert (=> b!1567019 (= e!873469 e!873472)))

(declare-fun c!144395 () Bool)

(assert (=> b!1567019 (= c!144395 e!873473)))

(declare-fun res!1071058 () Bool)

(assert (=> b!1567019 (=> (not res!1071058) (not e!873473))))

(assert (=> b!1567019 (= res!1071058 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51042 _keys!637)))))

(declare-fun b!1567020 () Bool)

(declare-fun lt!672635 () Unit!51867)

(declare-fun lt!672637 () Unit!51867)

(assert (=> b!1567020 (= lt!672635 lt!672637)))

(declare-fun lt!672639 () (_ BitVec 64))

(declare-fun lt!672638 () (_ BitVec 64))

(declare-fun lt!672634 () V!60201)

(declare-fun lt!672640 () ListLongMap!22771)

(declare-fun +!5115 (ListLongMap!22771 tuple2!25336) ListLongMap!22771)

(assert (=> b!1567020 (not (contains!10316 (+!5115 lt!672640 (tuple2!25337 lt!672638 lt!672634)) lt!672639))))

(declare-fun addStillNotContains!562 (ListLongMap!22771 (_ BitVec 64) V!60201 (_ BitVec 64)) Unit!51867)

(assert (=> b!1567020 (= lt!672637 (addStillNotContains!562 lt!672640 lt!672638 lt!672634 lt!672639))))

(assert (=> b!1567020 (= lt!672639 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1567020 (= lt!672634 (get!26375 (select (arr!50489 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3891 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1567020 (= lt!672638 (select (arr!50490 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1567020 (= lt!672640 call!71895)))

(assert (=> b!1567020 (= e!873475 (+!5115 call!71895 (tuple2!25337 (select (arr!50490 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26375 (select (arr!50489 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3891 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!163301 c!144394) b!1567011))

(assert (= (and d!163301 (not c!144394)) b!1567014))

(assert (= (and b!1567014 c!144393) b!1567020))

(assert (= (and b!1567014 (not c!144393)) b!1567015))

(assert (= (or b!1567020 b!1567015) bm!71892))

(assert (= (and d!163301 res!1071061) b!1567010))

(assert (= (and b!1567010 res!1071059) b!1567019))

(assert (= (and b!1567019 res!1071058) b!1567013))

(assert (= (and b!1567019 c!144395) b!1567012))

(assert (= (and b!1567019 (not c!144395)) b!1567018))

(assert (= (and b!1567012 res!1071060) b!1567017))

(assert (= (and b!1567018 c!144392) b!1567009))

(assert (= (and b!1567018 (not c!144392)) b!1567016))

(declare-fun b_lambda!25021 () Bool)

(assert (=> (not b_lambda!25021) (not b!1567017)))

(declare-fun t!51597 () Bool)

(declare-fun tb!12651 () Bool)

(assert (=> (and start!134038 (= defaultEntry!495 defaultEntry!495) t!51597) tb!12651))

(declare-fun result!26605 () Bool)

(assert (=> tb!12651 (= result!26605 tp_is_empty!38995)))

(assert (=> b!1567017 t!51597))

(declare-fun b_and!51847 () Bool)

(assert (= b_and!51841 (and (=> t!51597 result!26605) b_and!51847)))

(declare-fun b_lambda!25023 () Bool)

(assert (=> (not b_lambda!25023) (not b!1567020)))

(assert (=> b!1567020 t!51597))

(declare-fun b_and!51849 () Bool)

(assert (= b_and!51847 (and (=> t!51597 result!26605) b_and!51849)))

(declare-fun m!1441309 () Bool)

(assert (=> b!1567017 m!1441309))

(declare-fun m!1441311 () Bool)

(assert (=> b!1567017 m!1441311))

(declare-fun m!1441313 () Bool)

(assert (=> b!1567017 m!1441313))

(declare-fun m!1441315 () Bool)

(assert (=> b!1567017 m!1441315))

(declare-fun m!1441317 () Bool)

(assert (=> b!1567017 m!1441317))

(assert (=> b!1567017 m!1441313))

(assert (=> b!1567017 m!1441309))

(assert (=> b!1567017 m!1441315))

(declare-fun m!1441319 () Bool)

(assert (=> d!163301 m!1441319))

(assert (=> d!163301 m!1441235))

(declare-fun m!1441321 () Bool)

(assert (=> b!1567016 m!1441321))

(declare-fun m!1441323 () Bool)

(assert (=> b!1567009 m!1441323))

(assert (=> b!1567014 m!1441309))

(assert (=> b!1567014 m!1441309))

(declare-fun m!1441325 () Bool)

(assert (=> b!1567014 m!1441325))

(assert (=> bm!71892 m!1441323))

(assert (=> b!1567012 m!1441309))

(assert (=> b!1567012 m!1441309))

(declare-fun m!1441327 () Bool)

(assert (=> b!1567012 m!1441327))

(declare-fun m!1441329 () Bool)

(assert (=> b!1567010 m!1441329))

(assert (=> b!1567013 m!1441309))

(assert (=> b!1567013 m!1441309))

(assert (=> b!1567013 m!1441325))

(declare-fun m!1441331 () Bool)

(assert (=> b!1567020 m!1441331))

(assert (=> b!1567020 m!1441313))

(assert (=> b!1567020 m!1441315))

(assert (=> b!1567020 m!1441317))

(declare-fun m!1441333 () Bool)

(assert (=> b!1567020 m!1441333))

(declare-fun m!1441335 () Bool)

(assert (=> b!1567020 m!1441335))

(assert (=> b!1567020 m!1441309))

(assert (=> b!1567020 m!1441315))

(assert (=> b!1567020 m!1441335))

(declare-fun m!1441337 () Bool)

(assert (=> b!1567020 m!1441337))

(assert (=> b!1567020 m!1441313))

(assert (=> b!1566879 d!163301))

(declare-fun d!163303 () Bool)

(assert (=> d!163303 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134038 d!163303))

(declare-fun d!163305 () Bool)

(assert (=> d!163305 (= (array_inv!39429 _keys!637) (bvsge (size!51042 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134038 d!163305))

(declare-fun d!163307 () Bool)

(assert (=> d!163307 (= (array_inv!39430 _values!487) (bvsge (size!51041 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134038 d!163307))

(declare-fun d!163309 () Bool)

(declare-fun e!873477 () Bool)

(assert (=> d!163309 e!873477))

(declare-fun res!1071062 () Bool)

(assert (=> d!163309 (=> res!1071062 e!873477)))

(declare-fun lt!672641 () Bool)

(assert (=> d!163309 (= res!1071062 (not lt!672641))))

(declare-fun lt!672644 () Bool)

(assert (=> d!163309 (= lt!672641 lt!672644)))

(declare-fun lt!672642 () Unit!51867)

(declare-fun e!873476 () Unit!51867)

(assert (=> d!163309 (= lt!672642 e!873476)))

(declare-fun c!144396 () Bool)

(assert (=> d!163309 (= c!144396 lt!672644)))

(assert (=> d!163309 (= lt!672644 (containsKey!850 (toList!11401 lt!672592) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163309 (= (contains!10316 lt!672592 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672641)))

(declare-fun b!1567023 () Bool)

(declare-fun lt!672643 () Unit!51867)

(assert (=> b!1567023 (= e!873476 lt!672643)))

(assert (=> b!1567023 (= lt!672643 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11401 lt!672592) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1567023 (isDefined!585 (getValueByKey!797 (toList!11401 lt!672592) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567024 () Bool)

(declare-fun Unit!51870 () Unit!51867)

(assert (=> b!1567024 (= e!873476 Unit!51870)))

(declare-fun b!1567025 () Bool)

(assert (=> b!1567025 (= e!873477 (isDefined!585 (getValueByKey!797 (toList!11401 lt!672592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163309 c!144396) b!1567023))

(assert (= (and d!163309 (not c!144396)) b!1567024))

(assert (= (and d!163309 (not res!1071062)) b!1567025))

(declare-fun m!1441339 () Bool)

(assert (=> d!163309 m!1441339))

(declare-fun m!1441341 () Bool)

(assert (=> b!1567023 m!1441341))

(declare-fun m!1441343 () Bool)

(assert (=> b!1567023 m!1441343))

(assert (=> b!1567023 m!1441343))

(declare-fun m!1441345 () Bool)

(assert (=> b!1567023 m!1441345))

(assert (=> b!1567025 m!1441343))

(assert (=> b!1567025 m!1441343))

(assert (=> b!1567025 m!1441345))

(assert (=> b!1566873 d!163309))

(declare-fun d!163311 () Bool)

(assert (=> d!163311 (= (validKeyInArray!0 (select (arr!50490 _keys!637) from!782)) (and (not (= (select (arr!50490 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50490 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566877 d!163311))

(declare-fun b!1567032 () Bool)

(declare-fun e!873483 () Bool)

(assert (=> b!1567032 (= e!873483 tp_is_empty!38995)))

(declare-fun mapIsEmpty!59901 () Bool)

(declare-fun mapRes!59901 () Bool)

(assert (=> mapIsEmpty!59901 mapRes!59901))

(declare-fun b!1567033 () Bool)

(declare-fun e!873482 () Bool)

(assert (=> b!1567033 (= e!873482 tp_is_empty!38995)))

(declare-fun mapNonEmpty!59901 () Bool)

(declare-fun tp!113980 () Bool)

(assert (=> mapNonEmpty!59901 (= mapRes!59901 (and tp!113980 e!873483))))

(declare-fun mapKey!59901 () (_ BitVec 32))

(declare-fun mapRest!59901 () (Array (_ BitVec 32) ValueCell!18467))

(declare-fun mapValue!59901 () ValueCell!18467)

(assert (=> mapNonEmpty!59901 (= mapRest!59892 (store mapRest!59901 mapKey!59901 mapValue!59901))))

(declare-fun condMapEmpty!59901 () Bool)

(declare-fun mapDefault!59901 () ValueCell!18467)

(assert (=> mapNonEmpty!59892 (= condMapEmpty!59901 (= mapRest!59892 ((as const (Array (_ BitVec 32) ValueCell!18467)) mapDefault!59901)))))

(assert (=> mapNonEmpty!59892 (= tp!113964 (and e!873482 mapRes!59901))))

(assert (= (and mapNonEmpty!59892 condMapEmpty!59901) mapIsEmpty!59901))

(assert (= (and mapNonEmpty!59892 (not condMapEmpty!59901)) mapNonEmpty!59901))

(assert (= (and mapNonEmpty!59901 ((_ is ValueCellFull!18467) mapValue!59901)) b!1567032))

(assert (= (and mapNonEmpty!59892 ((_ is ValueCellFull!18467) mapDefault!59901)) b!1567033))

(declare-fun m!1441347 () Bool)

(assert (=> mapNonEmpty!59901 m!1441347))

(declare-fun b_lambda!25025 () Bool)

(assert (= b_lambda!25023 (or (and start!134038 b_free!32215) b_lambda!25025)))

(declare-fun b_lambda!25027 () Bool)

(assert (= b_lambda!25021 (or (and start!134038 b_free!32215) b_lambda!25027)))

(check-sat (not b!1567025) (not b_next!32215) (not d!163309) (not bm!71889) (not b!1567013) (not b!1567014) (not b_lambda!25027) (not b!1567023) (not b!1566982) (not bm!71886) (not bm!71892) (not b_lambda!25025) (not b!1567012) (not d!163299) (not b!1567017) (not b!1566960) (not b!1566958) (not b!1566975) (not b!1566974) (not mapNonEmpty!59901) (not b!1567010) (not b!1567020) b_and!51849 (not b!1566984) (not b!1567016) (not b!1567009) (not b!1566971) tp_is_empty!38995 (not d!163301))
(check-sat b_and!51849 (not b_next!32215))
