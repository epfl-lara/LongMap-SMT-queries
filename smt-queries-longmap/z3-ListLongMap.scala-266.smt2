; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4358 () Bool)

(assert start!4358)

(declare-fun b_free!1183 () Bool)

(declare-fun b_next!1183 () Bool)

(assert (=> start!4358 (= b_free!1183 (not b_next!1183))))

(declare-fun tp!4980 () Bool)

(declare-fun b_and!1995 () Bool)

(assert (=> start!4358 (= tp!4980 b_and!1995)))

(declare-fun res!20411 () Bool)

(declare-fun e!21337 () Bool)

(assert (=> start!4358 (=> (not res!20411) (not e!21337))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4358 (= res!20411 (validMask!0 mask!2294))))

(assert (=> start!4358 e!21337))

(assert (=> start!4358 true))

(assert (=> start!4358 tp!4980))

(declare-datatypes ((V!1875 0))(
  ( (V!1876 (val!795 Int)) )
))
(declare-datatypes ((ValueCell!569 0))(
  ( (ValueCellFull!569 (v!1887 V!1875)) (EmptyCell!569) )
))
(declare-datatypes ((array!2263 0))(
  ( (array!2264 (arr!1081 (Array (_ BitVec 32) ValueCell!569)) (size!1182 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2263)

(declare-fun e!21340 () Bool)

(declare-fun array_inv!769 (array!2263) Bool)

(assert (=> start!4358 (and (array_inv!769 _values!1501) e!21340)))

(declare-datatypes ((array!2265 0))(
  ( (array!2266 (arr!1082 (Array (_ BitVec 32) (_ BitVec 64))) (size!1183 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2265)

(declare-fun array_inv!770 (array!2265) Bool)

(assert (=> start!4358 (array_inv!770 _keys!1833)))

(declare-fun tp_is_empty!1537 () Bool)

(assert (=> start!4358 tp_is_empty!1537))

(declare-fun b!33613 () Bool)

(declare-fun res!20413 () Bool)

(assert (=> b!33613 (=> (not res!20413) (not e!21337))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!33613 (= res!20413 (and (= (size!1182 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1183 _keys!1833) (size!1182 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun e!21341 () Bool)

(declare-fun lt!12339 () (_ BitVec 32))

(declare-fun b!33614 () Bool)

(assert (=> b!33614 (= e!21341 (not (or (not (= (size!1183 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))) (bvsgt #b00000000000000000000000000000000 (size!1183 _keys!1833)) (and (bvsge lt!12339 #b00000000000000000000000000000000) (bvsle lt!12339 (size!1183 _keys!1833))))))))

(declare-datatypes ((SeekEntryResult!139 0))(
  ( (MissingZero!139 (index!2678 (_ BitVec 32))) (Found!139 (index!2679 (_ BitVec 32))) (Intermediate!139 (undefined!951 Bool) (index!2680 (_ BitVec 32)) (x!6849 (_ BitVec 32))) (Undefined!139) (MissingVacant!139 (index!2681 (_ BitVec 32))) )
))
(declare-fun lt!12338 () SeekEntryResult!139)

(get-info :version)

(assert (=> b!33614 (and ((_ is Found!139) lt!12338) (= (index!2679 lt!12338) lt!12339))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2265 (_ BitVec 32)) SeekEntryResult!139)

(assert (=> b!33614 (= lt!12338 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!754 0))(
  ( (Unit!755) )
))
(declare-fun lt!12341 () Unit!754)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2265 (_ BitVec 32)) Unit!754)

(assert (=> b!33614 (= lt!12341 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12339 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1294 0))(
  ( (tuple2!1295 (_1!658 (_ BitVec 64)) (_2!658 V!1875)) )
))
(declare-datatypes ((List!877 0))(
  ( (Nil!874) (Cons!873 (h!1440 tuple2!1294) (t!3571 List!877)) )
))
(declare-datatypes ((ListLongMap!859 0))(
  ( (ListLongMap!860 (toList!445 List!877)) )
))
(declare-fun lt!12340 () ListLongMap!859)

(declare-fun contains!390 (ListLongMap!859 (_ BitVec 64)) Bool)

(assert (=> b!33614 (contains!390 lt!12340 (select (arr!1082 _keys!1833) lt!12339))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!12342 () Unit!754)

(declare-fun zeroValue!1443 () V!1875)

(declare-fun minValue!1443 () V!1875)

(declare-fun lemmaValidKeyInArrayIsInListMap!60 (array!2265 array!2263 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) Unit!754)

(assert (=> b!33614 (= lt!12342 (lemmaValidKeyInArrayIsInListMap!60 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12339 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2265 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33614 (= lt!12339 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33615 () Bool)

(declare-fun e!21338 () Bool)

(assert (=> b!33615 (= e!21338 tp_is_empty!1537)))

(declare-fun mapNonEmpty!1846 () Bool)

(declare-fun mapRes!1846 () Bool)

(declare-fun tp!4981 () Bool)

(assert (=> mapNonEmpty!1846 (= mapRes!1846 (and tp!4981 e!21338))))

(declare-fun mapRest!1846 () (Array (_ BitVec 32) ValueCell!569))

(declare-fun mapKey!1846 () (_ BitVec 32))

(declare-fun mapValue!1846 () ValueCell!569)

(assert (=> mapNonEmpty!1846 (= (arr!1081 _values!1501) (store mapRest!1846 mapKey!1846 mapValue!1846))))

(declare-fun b!33616 () Bool)

(declare-fun e!21336 () Bool)

(assert (=> b!33616 (= e!21336 tp_is_empty!1537)))

(declare-fun b!33617 () Bool)

(declare-fun res!20410 () Bool)

(assert (=> b!33617 (=> (not res!20410) (not e!21337))))

(declare-datatypes ((List!878 0))(
  ( (Nil!875) (Cons!874 (h!1441 (_ BitVec 64)) (t!3572 List!878)) )
))
(declare-fun arrayNoDuplicates!0 (array!2265 (_ BitVec 32) List!878) Bool)

(assert (=> b!33617 (= res!20410 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!875))))

(declare-fun b!33618 () Bool)

(declare-fun res!20412 () Bool)

(assert (=> b!33618 (=> (not res!20412) (not e!21337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2265 (_ BitVec 32)) Bool)

(assert (=> b!33618 (= res!20412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33619 () Bool)

(declare-fun res!20414 () Bool)

(assert (=> b!33619 (=> (not res!20414) (not e!21341))))

(declare-fun arrayContainsKey!0 (array!2265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33619 (= res!20414 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33620 () Bool)

(declare-fun res!20409 () Bool)

(assert (=> b!33620 (=> (not res!20409) (not e!21337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33620 (= res!20409 (validKeyInArray!0 k0!1304))))

(declare-fun b!33621 () Bool)

(assert (=> b!33621 (= e!21340 (and e!21336 mapRes!1846))))

(declare-fun condMapEmpty!1846 () Bool)

(declare-fun mapDefault!1846 () ValueCell!569)

(assert (=> b!33621 (= condMapEmpty!1846 (= (arr!1081 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!569)) mapDefault!1846)))))

(declare-fun b!33622 () Bool)

(assert (=> b!33622 (= e!21337 e!21341)))

(declare-fun res!20415 () Bool)

(assert (=> b!33622 (=> (not res!20415) (not e!21341))))

(assert (=> b!33622 (= res!20415 (not (contains!390 lt!12340 k0!1304)))))

(declare-fun getCurrentListMap!265 (array!2265 array!2263 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) ListLongMap!859)

(assert (=> b!33622 (= lt!12340 (getCurrentListMap!265 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1846 () Bool)

(assert (=> mapIsEmpty!1846 mapRes!1846))

(assert (= (and start!4358 res!20411) b!33613))

(assert (= (and b!33613 res!20413) b!33618))

(assert (= (and b!33618 res!20412) b!33617))

(assert (= (and b!33617 res!20410) b!33620))

(assert (= (and b!33620 res!20409) b!33622))

(assert (= (and b!33622 res!20415) b!33619))

(assert (= (and b!33619 res!20414) b!33614))

(assert (= (and b!33621 condMapEmpty!1846) mapIsEmpty!1846))

(assert (= (and b!33621 (not condMapEmpty!1846)) mapNonEmpty!1846))

(assert (= (and mapNonEmpty!1846 ((_ is ValueCellFull!569) mapValue!1846)) b!33615))

(assert (= (and b!33621 ((_ is ValueCellFull!569) mapDefault!1846)) b!33616))

(assert (= start!4358 b!33621))

(declare-fun m!26971 () Bool)

(assert (=> b!33614 m!26971))

(declare-fun m!26973 () Bool)

(assert (=> b!33614 m!26973))

(declare-fun m!26975 () Bool)

(assert (=> b!33614 m!26975))

(assert (=> b!33614 m!26973))

(declare-fun m!26977 () Bool)

(assert (=> b!33614 m!26977))

(declare-fun m!26979 () Bool)

(assert (=> b!33614 m!26979))

(declare-fun m!26981 () Bool)

(assert (=> b!33614 m!26981))

(declare-fun m!26983 () Bool)

(assert (=> b!33618 m!26983))

(declare-fun m!26985 () Bool)

(assert (=> mapNonEmpty!1846 m!26985))

(declare-fun m!26987 () Bool)

(assert (=> b!33622 m!26987))

(declare-fun m!26989 () Bool)

(assert (=> b!33622 m!26989))

(declare-fun m!26991 () Bool)

(assert (=> b!33617 m!26991))

(declare-fun m!26993 () Bool)

(assert (=> start!4358 m!26993))

(declare-fun m!26995 () Bool)

(assert (=> start!4358 m!26995))

(declare-fun m!26997 () Bool)

(assert (=> start!4358 m!26997))

(declare-fun m!26999 () Bool)

(assert (=> b!33619 m!26999))

(declare-fun m!27001 () Bool)

(assert (=> b!33620 m!27001))

(check-sat (not start!4358) (not b!33617) (not b!33620) (not mapNonEmpty!1846) (not b!33622) (not b!33614) tp_is_empty!1537 (not b!33619) b_and!1995 (not b!33618) (not b_next!1183))
(check-sat b_and!1995 (not b_next!1183))
(get-model)

(declare-fun d!5153 () Bool)

(assert (=> d!5153 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33620 d!5153))

(declare-fun d!5155 () Bool)

(declare-fun res!20462 () Bool)

(declare-fun e!21382 () Bool)

(assert (=> d!5155 (=> res!20462 e!21382)))

(assert (=> d!5155 (= res!20462 (= (select (arr!1082 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5155 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21382)))

(declare-fun b!33687 () Bool)

(declare-fun e!21383 () Bool)

(assert (=> b!33687 (= e!21382 e!21383)))

(declare-fun res!20463 () Bool)

(assert (=> b!33687 (=> (not res!20463) (not e!21383))))

(assert (=> b!33687 (= res!20463 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1183 _keys!1833)))))

(declare-fun b!33688 () Bool)

(assert (=> b!33688 (= e!21383 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5155 (not res!20462)) b!33687))

(assert (= (and b!33687 res!20463) b!33688))

(declare-fun m!27067 () Bool)

(assert (=> d!5155 m!27067))

(declare-fun m!27069 () Bool)

(assert (=> b!33688 m!27069))

(assert (=> b!33619 d!5155))

(declare-fun d!5157 () Bool)

(assert (=> d!5157 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4358 d!5157))

(declare-fun d!5159 () Bool)

(assert (=> d!5159 (= (array_inv!769 _values!1501) (bvsge (size!1182 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4358 d!5159))

(declare-fun d!5161 () Bool)

(assert (=> d!5161 (= (array_inv!770 _keys!1833) (bvsge (size!1183 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4358 d!5161))

(declare-fun b!33697 () Bool)

(declare-fun e!21390 () Bool)

(declare-fun e!21392 () Bool)

(assert (=> b!33697 (= e!21390 e!21392)))

(declare-fun c!3869 () Bool)

(assert (=> b!33697 (= c!3869 (validKeyInArray!0 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5163 () Bool)

(declare-fun res!20468 () Bool)

(assert (=> d!5163 (=> res!20468 e!21390)))

(assert (=> d!5163 (= res!20468 (bvsge #b00000000000000000000000000000000 (size!1183 _keys!1833)))))

(assert (=> d!5163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21390)))

(declare-fun b!33698 () Bool)

(declare-fun call!2699 () Bool)

(assert (=> b!33698 (= e!21392 call!2699)))

(declare-fun b!33699 () Bool)

(declare-fun e!21391 () Bool)

(assert (=> b!33699 (= e!21391 call!2699)))

(declare-fun bm!2696 () Bool)

(assert (=> bm!2696 (= call!2699 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!33700 () Bool)

(assert (=> b!33700 (= e!21392 e!21391)))

(declare-fun lt!12380 () (_ BitVec 64))

(assert (=> b!33700 (= lt!12380 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12379 () Unit!754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2265 (_ BitVec 64) (_ BitVec 32)) Unit!754)

(assert (=> b!33700 (= lt!12379 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12380 #b00000000000000000000000000000000))))

(assert (=> b!33700 (arrayContainsKey!0 _keys!1833 lt!12380 #b00000000000000000000000000000000)))

(declare-fun lt!12381 () Unit!754)

(assert (=> b!33700 (= lt!12381 lt!12379)))

(declare-fun res!20469 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2265 (_ BitVec 32)) SeekEntryResult!139)

(assert (=> b!33700 (= res!20469 (= (seekEntryOrOpen!0 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!139 #b00000000000000000000000000000000)))))

(assert (=> b!33700 (=> (not res!20469) (not e!21391))))

(assert (= (and d!5163 (not res!20468)) b!33697))

(assert (= (and b!33697 c!3869) b!33700))

(assert (= (and b!33697 (not c!3869)) b!33698))

(assert (= (and b!33700 res!20469) b!33699))

(assert (= (or b!33699 b!33698) bm!2696))

(assert (=> b!33697 m!27067))

(assert (=> b!33697 m!27067))

(declare-fun m!27071 () Bool)

(assert (=> b!33697 m!27071))

(declare-fun m!27073 () Bool)

(assert (=> bm!2696 m!27073))

(assert (=> b!33700 m!27067))

(declare-fun m!27075 () Bool)

(assert (=> b!33700 m!27075))

(declare-fun m!27077 () Bool)

(assert (=> b!33700 m!27077))

(assert (=> b!33700 m!27067))

(declare-fun m!27079 () Bool)

(assert (=> b!33700 m!27079))

(assert (=> b!33618 d!5163))

(declare-fun d!5165 () Bool)

(declare-fun lt!12384 () (_ BitVec 32))

(assert (=> d!5165 (and (or (bvslt lt!12384 #b00000000000000000000000000000000) (bvsge lt!12384 (size!1183 _keys!1833)) (and (bvsge lt!12384 #b00000000000000000000000000000000) (bvslt lt!12384 (size!1183 _keys!1833)))) (bvsge lt!12384 #b00000000000000000000000000000000) (bvslt lt!12384 (size!1183 _keys!1833)) (= (select (arr!1082 _keys!1833) lt!12384) k0!1304))))

(declare-fun e!21395 () (_ BitVec 32))

(assert (=> d!5165 (= lt!12384 e!21395)))

(declare-fun c!3872 () Bool)

(assert (=> d!5165 (= c!3872 (= (select (arr!1082 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1183 _keys!1833)) (bvslt (size!1183 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5165 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12384)))

(declare-fun b!33705 () Bool)

(assert (=> b!33705 (= e!21395 #b00000000000000000000000000000000)))

(declare-fun b!33706 () Bool)

(assert (=> b!33706 (= e!21395 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5165 c!3872) b!33705))

(assert (= (and d!5165 (not c!3872)) b!33706))

(declare-fun m!27081 () Bool)

(assert (=> d!5165 m!27081))

(assert (=> d!5165 m!27067))

(declare-fun m!27083 () Bool)

(assert (=> b!33706 m!27083))

(assert (=> b!33614 d!5165))

(declare-fun d!5167 () Bool)

(declare-fun e!21398 () Bool)

(assert (=> d!5167 e!21398))

(declare-fun res!20472 () Bool)

(assert (=> d!5167 (=> (not res!20472) (not e!21398))))

(assert (=> d!5167 (= res!20472 (and (bvsge lt!12339 #b00000000000000000000000000000000) (bvslt lt!12339 (size!1183 _keys!1833))))))

(declare-fun lt!12387 () Unit!754)

(declare-fun choose!218 (array!2265 array!2263 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) Unit!754)

(assert (=> d!5167 (= lt!12387 (choose!218 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12339 defaultEntry!1504))))

(assert (=> d!5167 (validMask!0 mask!2294)))

(assert (=> d!5167 (= (lemmaValidKeyInArrayIsInListMap!60 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12339 defaultEntry!1504) lt!12387)))

(declare-fun b!33709 () Bool)

(assert (=> b!33709 (= e!21398 (contains!390 (getCurrentListMap!265 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1082 _keys!1833) lt!12339)))))

(assert (= (and d!5167 res!20472) b!33709))

(declare-fun m!27085 () Bool)

(assert (=> d!5167 m!27085))

(assert (=> d!5167 m!26993))

(assert (=> b!33709 m!26989))

(assert (=> b!33709 m!26973))

(assert (=> b!33709 m!26989))

(assert (=> b!33709 m!26973))

(declare-fun m!27087 () Bool)

(assert (=> b!33709 m!27087))

(assert (=> b!33614 d!5167))

(declare-fun b!33723 () Bool)

(declare-fun c!3881 () Bool)

(declare-fun lt!12399 () (_ BitVec 64))

(assert (=> b!33723 (= c!3881 (= lt!12399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21407 () SeekEntryResult!139)

(declare-fun e!21406 () SeekEntryResult!139)

(assert (=> b!33723 (= e!21407 e!21406)))

(declare-fun b!33724 () Bool)

(declare-fun e!21405 () SeekEntryResult!139)

(assert (=> b!33724 (= e!21405 e!21407)))

(declare-fun lt!12398 () SeekEntryResult!139)

(assert (=> b!33724 (= lt!12399 (select (arr!1082 _keys!1833) (index!2680 lt!12398)))))

(declare-fun c!3879 () Bool)

(assert (=> b!33724 (= c!3879 (= lt!12399 k0!1304))))

(declare-fun b!33725 () Bool)

(assert (=> b!33725 (= e!21405 Undefined!139)))

(declare-fun b!33726 () Bool)

(declare-fun lt!12396 () SeekEntryResult!139)

(assert (=> b!33726 (= e!21406 (ite ((_ is MissingVacant!139) lt!12396) (MissingZero!139 (index!2681 lt!12396)) lt!12396))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2265 (_ BitVec 32)) SeekEntryResult!139)

(assert (=> b!33726 (= lt!12396 (seekKeyOrZeroReturnVacant!0 (x!6849 lt!12398) (index!2680 lt!12398) (index!2680 lt!12398) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!33727 () Bool)

(assert (=> b!33727 (= e!21406 (MissingZero!139 (index!2680 lt!12398)))))

(declare-fun b!33722 () Bool)

(assert (=> b!33722 (= e!21407 (Found!139 (index!2680 lt!12398)))))

(declare-fun d!5169 () Bool)

(declare-fun lt!12397 () SeekEntryResult!139)

(assert (=> d!5169 (and (or ((_ is MissingVacant!139) lt!12397) (not ((_ is Found!139) lt!12397)) (and (bvsge (index!2679 lt!12397) #b00000000000000000000000000000000) (bvslt (index!2679 lt!12397) (size!1183 _keys!1833)))) (not ((_ is MissingVacant!139) lt!12397)) (or (not ((_ is Found!139) lt!12397)) (= (select (arr!1082 _keys!1833) (index!2679 lt!12397)) k0!1304)))))

(assert (=> d!5169 (= lt!12397 e!21405)))

(declare-fun c!3880 () Bool)

(assert (=> d!5169 (= c!3880 (and ((_ is Intermediate!139) lt!12398) (undefined!951 lt!12398)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2265 (_ BitVec 32)) SeekEntryResult!139)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5169 (= lt!12398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5169 (validMask!0 mask!2294)))

(assert (=> d!5169 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12397)))

(assert (= (and d!5169 c!3880) b!33725))

(assert (= (and d!5169 (not c!3880)) b!33724))

(assert (= (and b!33724 c!3879) b!33722))

(assert (= (and b!33724 (not c!3879)) b!33723))

(assert (= (and b!33723 c!3881) b!33727))

(assert (= (and b!33723 (not c!3881)) b!33726))

(declare-fun m!27089 () Bool)

(assert (=> b!33724 m!27089))

(declare-fun m!27091 () Bool)

(assert (=> b!33726 m!27091))

(declare-fun m!27093 () Bool)

(assert (=> d!5169 m!27093))

(declare-fun m!27095 () Bool)

(assert (=> d!5169 m!27095))

(assert (=> d!5169 m!27095))

(declare-fun m!27097 () Bool)

(assert (=> d!5169 m!27097))

(assert (=> d!5169 m!26993))

(assert (=> b!33614 d!5169))

(declare-fun d!5171 () Bool)

(declare-fun lt!12405 () SeekEntryResult!139)

(assert (=> d!5171 (and ((_ is Found!139) lt!12405) (= (index!2679 lt!12405) lt!12339))))

(assert (=> d!5171 (= lt!12405 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12404 () Unit!754)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2265 (_ BitVec 32)) Unit!754)

(assert (=> d!5171 (= lt!12404 (choose!0 k0!1304 lt!12339 _keys!1833 mask!2294))))

(assert (=> d!5171 (validMask!0 mask!2294)))

(assert (=> d!5171 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12339 _keys!1833 mask!2294) lt!12404)))

(declare-fun bs!1308 () Bool)

(assert (= bs!1308 d!5171))

(assert (=> bs!1308 m!26975))

(declare-fun m!27099 () Bool)

(assert (=> bs!1308 m!27099))

(assert (=> bs!1308 m!26993))

(assert (=> b!33614 d!5171))

(declare-fun d!5173 () Bool)

(declare-fun e!21413 () Bool)

(assert (=> d!5173 e!21413))

(declare-fun res!20475 () Bool)

(assert (=> d!5173 (=> res!20475 e!21413)))

(declare-fun lt!12417 () Bool)

(assert (=> d!5173 (= res!20475 (not lt!12417))))

(declare-fun lt!12414 () Bool)

(assert (=> d!5173 (= lt!12417 lt!12414)))

(declare-fun lt!12416 () Unit!754)

(declare-fun e!21412 () Unit!754)

(assert (=> d!5173 (= lt!12416 e!21412)))

(declare-fun c!3884 () Bool)

(assert (=> d!5173 (= c!3884 lt!12414)))

(declare-fun containsKey!32 (List!877 (_ BitVec 64)) Bool)

(assert (=> d!5173 (= lt!12414 (containsKey!32 (toList!445 lt!12340) (select (arr!1082 _keys!1833) lt!12339)))))

(assert (=> d!5173 (= (contains!390 lt!12340 (select (arr!1082 _keys!1833) lt!12339)) lt!12417)))

(declare-fun b!33734 () Bool)

(declare-fun lt!12415 () Unit!754)

(assert (=> b!33734 (= e!21412 lt!12415)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!29 (List!877 (_ BitVec 64)) Unit!754)

(assert (=> b!33734 (= lt!12415 (lemmaContainsKeyImpliesGetValueByKeyDefined!29 (toList!445 lt!12340) (select (arr!1082 _keys!1833) lt!12339)))))

(declare-datatypes ((Option!74 0))(
  ( (Some!73 (v!1890 V!1875)) (None!72) )
))
(declare-fun isDefined!30 (Option!74) Bool)

(declare-fun getValueByKey!68 (List!877 (_ BitVec 64)) Option!74)

(assert (=> b!33734 (isDefined!30 (getValueByKey!68 (toList!445 lt!12340) (select (arr!1082 _keys!1833) lt!12339)))))

(declare-fun b!33735 () Bool)

(declare-fun Unit!760 () Unit!754)

(assert (=> b!33735 (= e!21412 Unit!760)))

(declare-fun b!33736 () Bool)

(assert (=> b!33736 (= e!21413 (isDefined!30 (getValueByKey!68 (toList!445 lt!12340) (select (arr!1082 _keys!1833) lt!12339))))))

(assert (= (and d!5173 c!3884) b!33734))

(assert (= (and d!5173 (not c!3884)) b!33735))

(assert (= (and d!5173 (not res!20475)) b!33736))

(assert (=> d!5173 m!26973))

(declare-fun m!27101 () Bool)

(assert (=> d!5173 m!27101))

(assert (=> b!33734 m!26973))

(declare-fun m!27103 () Bool)

(assert (=> b!33734 m!27103))

(assert (=> b!33734 m!26973))

(declare-fun m!27105 () Bool)

(assert (=> b!33734 m!27105))

(assert (=> b!33734 m!27105))

(declare-fun m!27107 () Bool)

(assert (=> b!33734 m!27107))

(assert (=> b!33736 m!26973))

(assert (=> b!33736 m!27105))

(assert (=> b!33736 m!27105))

(assert (=> b!33736 m!27107))

(assert (=> b!33614 d!5173))

(declare-fun d!5175 () Bool)

(declare-fun e!21415 () Bool)

(assert (=> d!5175 e!21415))

(declare-fun res!20476 () Bool)

(assert (=> d!5175 (=> res!20476 e!21415)))

(declare-fun lt!12421 () Bool)

(assert (=> d!5175 (= res!20476 (not lt!12421))))

(declare-fun lt!12418 () Bool)

(assert (=> d!5175 (= lt!12421 lt!12418)))

(declare-fun lt!12420 () Unit!754)

(declare-fun e!21414 () Unit!754)

(assert (=> d!5175 (= lt!12420 e!21414)))

(declare-fun c!3885 () Bool)

(assert (=> d!5175 (= c!3885 lt!12418)))

(assert (=> d!5175 (= lt!12418 (containsKey!32 (toList!445 lt!12340) k0!1304))))

(assert (=> d!5175 (= (contains!390 lt!12340 k0!1304) lt!12421)))

(declare-fun b!33737 () Bool)

(declare-fun lt!12419 () Unit!754)

(assert (=> b!33737 (= e!21414 lt!12419)))

(assert (=> b!33737 (= lt!12419 (lemmaContainsKeyImpliesGetValueByKeyDefined!29 (toList!445 lt!12340) k0!1304))))

(assert (=> b!33737 (isDefined!30 (getValueByKey!68 (toList!445 lt!12340) k0!1304))))

(declare-fun b!33738 () Bool)

(declare-fun Unit!761 () Unit!754)

(assert (=> b!33738 (= e!21414 Unit!761)))

(declare-fun b!33739 () Bool)

(assert (=> b!33739 (= e!21415 (isDefined!30 (getValueByKey!68 (toList!445 lt!12340) k0!1304)))))

(assert (= (and d!5175 c!3885) b!33737))

(assert (= (and d!5175 (not c!3885)) b!33738))

(assert (= (and d!5175 (not res!20476)) b!33739))

(declare-fun m!27109 () Bool)

(assert (=> d!5175 m!27109))

(declare-fun m!27111 () Bool)

(assert (=> b!33737 m!27111))

(declare-fun m!27113 () Bool)

(assert (=> b!33737 m!27113))

(assert (=> b!33737 m!27113))

(declare-fun m!27115 () Bool)

(assert (=> b!33737 m!27115))

(assert (=> b!33739 m!27113))

(assert (=> b!33739 m!27113))

(assert (=> b!33739 m!27115))

(assert (=> b!33622 d!5175))

(declare-fun bm!2711 () Bool)

(declare-fun call!2718 () ListLongMap!859)

(declare-fun call!2714 () ListLongMap!859)

(assert (=> bm!2711 (= call!2718 call!2714)))

(declare-fun b!33782 () Bool)

(declare-fun e!21451 () Bool)

(declare-fun e!21445 () Bool)

(assert (=> b!33782 (= e!21451 e!21445)))

(declare-fun res!20503 () Bool)

(declare-fun call!2716 () Bool)

(assert (=> b!33782 (= res!20503 call!2716)))

(assert (=> b!33782 (=> (not res!20503) (not e!21445))))

(declare-fun b!33783 () Bool)

(declare-fun c!3901 () Bool)

(assert (=> b!33783 (= c!3901 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!21443 () ListLongMap!859)

(declare-fun e!21454 () ListLongMap!859)

(assert (=> b!33783 (= e!21443 e!21454)))

(declare-fun b!33784 () Bool)

(declare-fun call!2715 () ListLongMap!859)

(assert (=> b!33784 (= e!21454 call!2715)))

(declare-fun d!5177 () Bool)

(declare-fun e!21442 () Bool)

(assert (=> d!5177 e!21442))

(declare-fun res!20497 () Bool)

(assert (=> d!5177 (=> (not res!20497) (not e!21442))))

(assert (=> d!5177 (= res!20497 (or (bvsge #b00000000000000000000000000000000 (size!1183 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1183 _keys!1833)))))))

(declare-fun lt!12486 () ListLongMap!859)

(declare-fun lt!12482 () ListLongMap!859)

(assert (=> d!5177 (= lt!12486 lt!12482)))

(declare-fun lt!12475 () Unit!754)

(declare-fun e!21450 () Unit!754)

(assert (=> d!5177 (= lt!12475 e!21450)))

(declare-fun c!3902 () Bool)

(declare-fun e!21452 () Bool)

(assert (=> d!5177 (= c!3902 e!21452)))

(declare-fun res!20502 () Bool)

(assert (=> d!5177 (=> (not res!20502) (not e!21452))))

(assert (=> d!5177 (= res!20502 (bvslt #b00000000000000000000000000000000 (size!1183 _keys!1833)))))

(declare-fun e!21453 () ListLongMap!859)

(assert (=> d!5177 (= lt!12482 e!21453)))

(declare-fun c!3898 () Bool)

(assert (=> d!5177 (= c!3898 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5177 (validMask!0 mask!2294)))

(assert (=> d!5177 (= (getCurrentListMap!265 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12486)))

(declare-fun e!21444 () Bool)

(declare-fun b!33785 () Bool)

(declare-fun apply!37 (ListLongMap!859 (_ BitVec 64)) V!1875)

(declare-fun get!574 (ValueCell!569 V!1875) V!1875)

(declare-fun dynLambda!153 (Int (_ BitVec 64)) V!1875)

(assert (=> b!33785 (= e!21444 (= (apply!37 lt!12486 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000)) (get!574 (select (arr!1081 _values!1501) #b00000000000000000000000000000000) (dynLambda!153 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1182 _values!1501)))))

(assert (=> b!33785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1183 _keys!1833)))))

(declare-fun b!33786 () Bool)

(assert (=> b!33786 (= e!21452 (validKeyInArray!0 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33787 () Bool)

(assert (=> b!33787 (= e!21443 call!2718)))

(declare-fun b!33788 () Bool)

(assert (=> b!33788 (= e!21454 call!2718)))

(declare-fun bm!2712 () Bool)

(declare-fun call!2720 () ListLongMap!859)

(declare-fun call!2719 () ListLongMap!859)

(assert (=> bm!2712 (= call!2720 call!2719)))

(declare-fun b!33789 () Bool)

(declare-fun e!21448 () Bool)

(assert (=> b!33789 (= e!21442 e!21448)))

(declare-fun c!3903 () Bool)

(assert (=> b!33789 (= c!3903 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33790 () Bool)

(assert (=> b!33790 (= e!21453 e!21443)))

(declare-fun c!3899 () Bool)

(assert (=> b!33790 (= c!3899 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2713 () Bool)

(assert (=> bm!2713 (= call!2715 call!2720)))

(declare-fun bm!2714 () Bool)

(declare-fun call!2717 () Bool)

(assert (=> bm!2714 (= call!2717 (contains!390 lt!12486 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2715 () Bool)

(declare-fun +!55 (ListLongMap!859 tuple2!1294) ListLongMap!859)

(assert (=> bm!2715 (= call!2714 (+!55 (ite c!3898 call!2719 (ite c!3899 call!2720 call!2715)) (ite (or c!3898 c!3899) (tuple2!1295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!33791 () Bool)

(declare-fun e!21447 () Bool)

(assert (=> b!33791 (= e!21447 e!21444)))

(declare-fun res!20498 () Bool)

(assert (=> b!33791 (=> (not res!20498) (not e!21444))))

(assert (=> b!33791 (= res!20498 (contains!390 lt!12486 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1183 _keys!1833)))))

(declare-fun b!33792 () Bool)

(declare-fun res!20500 () Bool)

(assert (=> b!33792 (=> (not res!20500) (not e!21442))))

(assert (=> b!33792 (= res!20500 e!21447)))

(declare-fun res!20496 () Bool)

(assert (=> b!33792 (=> res!20496 e!21447)))

(declare-fun e!21449 () Bool)

(assert (=> b!33792 (= res!20496 (not e!21449))))

(declare-fun res!20501 () Bool)

(assert (=> b!33792 (=> (not res!20501) (not e!21449))))

(assert (=> b!33792 (= res!20501 (bvslt #b00000000000000000000000000000000 (size!1183 _keys!1833)))))

(declare-fun b!33793 () Bool)

(declare-fun res!20495 () Bool)

(assert (=> b!33793 (=> (not res!20495) (not e!21442))))

(assert (=> b!33793 (= res!20495 e!21451)))

(declare-fun c!3900 () Bool)

(assert (=> b!33793 (= c!3900 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!33794 () Bool)

(declare-fun e!21446 () Bool)

(assert (=> b!33794 (= e!21446 (= (apply!37 lt!12486 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!33795 () Bool)

(assert (=> b!33795 (= e!21451 (not call!2716))))

(declare-fun bm!2716 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!24 (array!2265 array!2263 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) ListLongMap!859)

(assert (=> bm!2716 (= call!2719 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33796 () Bool)

(assert (=> b!33796 (= e!21448 e!21446)))

(declare-fun res!20499 () Bool)

(assert (=> b!33796 (= res!20499 call!2717)))

(assert (=> b!33796 (=> (not res!20499) (not e!21446))))

(declare-fun b!33797 () Bool)

(assert (=> b!33797 (= e!21453 (+!55 call!2714 (tuple2!1295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!33798 () Bool)

(assert (=> b!33798 (= e!21448 (not call!2717))))

(declare-fun b!33799 () Bool)

(declare-fun lt!12485 () Unit!754)

(assert (=> b!33799 (= e!21450 lt!12485)))

(declare-fun lt!12487 () ListLongMap!859)

(assert (=> b!33799 (= lt!12487 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12484 () (_ BitVec 64))

(assert (=> b!33799 (= lt!12484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12478 () (_ BitVec 64))

(assert (=> b!33799 (= lt!12478 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12481 () Unit!754)

(declare-fun addStillContains!22 (ListLongMap!859 (_ BitVec 64) V!1875 (_ BitVec 64)) Unit!754)

(assert (=> b!33799 (= lt!12481 (addStillContains!22 lt!12487 lt!12484 zeroValue!1443 lt!12478))))

(assert (=> b!33799 (contains!390 (+!55 lt!12487 (tuple2!1295 lt!12484 zeroValue!1443)) lt!12478)))

(declare-fun lt!12471 () Unit!754)

(assert (=> b!33799 (= lt!12471 lt!12481)))

(declare-fun lt!12477 () ListLongMap!859)

(assert (=> b!33799 (= lt!12477 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12476 () (_ BitVec 64))

(assert (=> b!33799 (= lt!12476 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12480 () (_ BitVec 64))

(assert (=> b!33799 (= lt!12480 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12469 () Unit!754)

(declare-fun addApplyDifferent!22 (ListLongMap!859 (_ BitVec 64) V!1875 (_ BitVec 64)) Unit!754)

(assert (=> b!33799 (= lt!12469 (addApplyDifferent!22 lt!12477 lt!12476 minValue!1443 lt!12480))))

(assert (=> b!33799 (= (apply!37 (+!55 lt!12477 (tuple2!1295 lt!12476 minValue!1443)) lt!12480) (apply!37 lt!12477 lt!12480))))

(declare-fun lt!12474 () Unit!754)

(assert (=> b!33799 (= lt!12474 lt!12469)))

(declare-fun lt!12467 () ListLongMap!859)

(assert (=> b!33799 (= lt!12467 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12479 () (_ BitVec 64))

(assert (=> b!33799 (= lt!12479 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12468 () (_ BitVec 64))

(assert (=> b!33799 (= lt!12468 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12472 () Unit!754)

(assert (=> b!33799 (= lt!12472 (addApplyDifferent!22 lt!12467 lt!12479 zeroValue!1443 lt!12468))))

(assert (=> b!33799 (= (apply!37 (+!55 lt!12467 (tuple2!1295 lt!12479 zeroValue!1443)) lt!12468) (apply!37 lt!12467 lt!12468))))

(declare-fun lt!12483 () Unit!754)

(assert (=> b!33799 (= lt!12483 lt!12472)))

(declare-fun lt!12473 () ListLongMap!859)

(assert (=> b!33799 (= lt!12473 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12466 () (_ BitVec 64))

(assert (=> b!33799 (= lt!12466 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12470 () (_ BitVec 64))

(assert (=> b!33799 (= lt!12470 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33799 (= lt!12485 (addApplyDifferent!22 lt!12473 lt!12466 minValue!1443 lt!12470))))

(assert (=> b!33799 (= (apply!37 (+!55 lt!12473 (tuple2!1295 lt!12466 minValue!1443)) lt!12470) (apply!37 lt!12473 lt!12470))))

(declare-fun b!33800 () Bool)

(assert (=> b!33800 (= e!21449 (validKeyInArray!0 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2717 () Bool)

(assert (=> bm!2717 (= call!2716 (contains!390 lt!12486 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!33801 () Bool)

(declare-fun Unit!762 () Unit!754)

(assert (=> b!33801 (= e!21450 Unit!762)))

(declare-fun b!33802 () Bool)

(assert (=> b!33802 (= e!21445 (= (apply!37 lt!12486 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(assert (= (and d!5177 c!3898) b!33797))

(assert (= (and d!5177 (not c!3898)) b!33790))

(assert (= (and b!33790 c!3899) b!33787))

(assert (= (and b!33790 (not c!3899)) b!33783))

(assert (= (and b!33783 c!3901) b!33788))

(assert (= (and b!33783 (not c!3901)) b!33784))

(assert (= (or b!33788 b!33784) bm!2713))

(assert (= (or b!33787 bm!2713) bm!2712))

(assert (= (or b!33787 b!33788) bm!2711))

(assert (= (or b!33797 bm!2712) bm!2716))

(assert (= (or b!33797 bm!2711) bm!2715))

(assert (= (and d!5177 res!20502) b!33786))

(assert (= (and d!5177 c!3902) b!33799))

(assert (= (and d!5177 (not c!3902)) b!33801))

(assert (= (and d!5177 res!20497) b!33792))

(assert (= (and b!33792 res!20501) b!33800))

(assert (= (and b!33792 (not res!20496)) b!33791))

(assert (= (and b!33791 res!20498) b!33785))

(assert (= (and b!33792 res!20500) b!33793))

(assert (= (and b!33793 c!3900) b!33782))

(assert (= (and b!33793 (not c!3900)) b!33795))

(assert (= (and b!33782 res!20503) b!33802))

(assert (= (or b!33782 b!33795) bm!2717))

(assert (= (and b!33793 res!20495) b!33789))

(assert (= (and b!33789 c!3903) b!33796))

(assert (= (and b!33789 (not c!3903)) b!33798))

(assert (= (and b!33796 res!20499) b!33794))

(assert (= (or b!33796 b!33798) bm!2714))

(declare-fun b_lambda!1699 () Bool)

(assert (=> (not b_lambda!1699) (not b!33785)))

(declare-fun t!3578 () Bool)

(declare-fun tb!683 () Bool)

(assert (=> (and start!4358 (= defaultEntry!1504 defaultEntry!1504) t!3578) tb!683))

(declare-fun result!1171 () Bool)

(assert (=> tb!683 (= result!1171 tp_is_empty!1537)))

(assert (=> b!33785 t!3578))

(declare-fun b_and!2001 () Bool)

(assert (= b_and!1995 (and (=> t!3578 result!1171) b_and!2001)))

(declare-fun m!27117 () Bool)

(assert (=> bm!2714 m!27117))

(declare-fun m!27119 () Bool)

(assert (=> b!33797 m!27119))

(declare-fun m!27121 () Bool)

(assert (=> bm!2715 m!27121))

(declare-fun m!27123 () Bool)

(assert (=> b!33794 m!27123))

(declare-fun m!27125 () Bool)

(assert (=> bm!2717 m!27125))

(declare-fun m!27127 () Bool)

(assert (=> bm!2716 m!27127))

(assert (=> b!33800 m!27067))

(assert (=> b!33800 m!27067))

(assert (=> b!33800 m!27071))

(declare-fun m!27129 () Bool)

(assert (=> b!33802 m!27129))

(assert (=> d!5177 m!26993))

(assert (=> b!33786 m!27067))

(assert (=> b!33786 m!27067))

(assert (=> b!33786 m!27071))

(declare-fun m!27131 () Bool)

(assert (=> b!33799 m!27131))

(assert (=> b!33799 m!27067))

(declare-fun m!27133 () Bool)

(assert (=> b!33799 m!27133))

(declare-fun m!27135 () Bool)

(assert (=> b!33799 m!27135))

(declare-fun m!27137 () Bool)

(assert (=> b!33799 m!27137))

(declare-fun m!27139 () Bool)

(assert (=> b!33799 m!27139))

(declare-fun m!27141 () Bool)

(assert (=> b!33799 m!27141))

(declare-fun m!27143 () Bool)

(assert (=> b!33799 m!27143))

(declare-fun m!27145 () Bool)

(assert (=> b!33799 m!27145))

(assert (=> b!33799 m!27139))

(declare-fun m!27147 () Bool)

(assert (=> b!33799 m!27147))

(declare-fun m!27149 () Bool)

(assert (=> b!33799 m!27149))

(declare-fun m!27151 () Bool)

(assert (=> b!33799 m!27151))

(declare-fun m!27153 () Bool)

(assert (=> b!33799 m!27153))

(assert (=> b!33799 m!27143))

(assert (=> b!33799 m!27137))

(declare-fun m!27155 () Bool)

(assert (=> b!33799 m!27155))

(assert (=> b!33799 m!27153))

(declare-fun m!27157 () Bool)

(assert (=> b!33799 m!27157))

(assert (=> b!33799 m!27127))

(declare-fun m!27159 () Bool)

(assert (=> b!33799 m!27159))

(declare-fun m!27161 () Bool)

(assert (=> b!33785 m!27161))

(declare-fun m!27163 () Bool)

(assert (=> b!33785 m!27163))

(assert (=> b!33785 m!27067))

(assert (=> b!33785 m!27163))

(assert (=> b!33785 m!27161))

(declare-fun m!27165 () Bool)

(assert (=> b!33785 m!27165))

(assert (=> b!33785 m!27067))

(declare-fun m!27167 () Bool)

(assert (=> b!33785 m!27167))

(assert (=> b!33791 m!27067))

(assert (=> b!33791 m!27067))

(declare-fun m!27169 () Bool)

(assert (=> b!33791 m!27169))

(assert (=> b!33622 d!5177))

(declare-fun bm!2720 () Bool)

(declare-fun call!2723 () Bool)

(declare-fun c!3906 () Bool)

(assert (=> bm!2720 (= call!2723 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3906 (Cons!874 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000) Nil!875) Nil!875)))))

(declare-fun b!33815 () Bool)

(declare-fun e!21466 () Bool)

(assert (=> b!33815 (= e!21466 call!2723)))

(declare-fun d!5179 () Bool)

(declare-fun res!20511 () Bool)

(declare-fun e!21465 () Bool)

(assert (=> d!5179 (=> res!20511 e!21465)))

(assert (=> d!5179 (= res!20511 (bvsge #b00000000000000000000000000000000 (size!1183 _keys!1833)))))

(assert (=> d!5179 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!875) e!21465)))

(declare-fun b!33816 () Bool)

(assert (=> b!33816 (= e!21466 call!2723)))

(declare-fun b!33817 () Bool)

(declare-fun e!21463 () Bool)

(assert (=> b!33817 (= e!21463 e!21466)))

(assert (=> b!33817 (= c!3906 (validKeyInArray!0 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33818 () Bool)

(declare-fun e!21464 () Bool)

(declare-fun contains!393 (List!878 (_ BitVec 64)) Bool)

(assert (=> b!33818 (= e!21464 (contains!393 Nil!875 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33819 () Bool)

(assert (=> b!33819 (= e!21465 e!21463)))

(declare-fun res!20512 () Bool)

(assert (=> b!33819 (=> (not res!20512) (not e!21463))))

(assert (=> b!33819 (= res!20512 (not e!21464))))

(declare-fun res!20510 () Bool)

(assert (=> b!33819 (=> (not res!20510) (not e!21464))))

(assert (=> b!33819 (= res!20510 (validKeyInArray!0 (select (arr!1082 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5179 (not res!20511)) b!33819))

(assert (= (and b!33819 res!20510) b!33818))

(assert (= (and b!33819 res!20512) b!33817))

(assert (= (and b!33817 c!3906) b!33816))

(assert (= (and b!33817 (not c!3906)) b!33815))

(assert (= (or b!33816 b!33815) bm!2720))

(assert (=> bm!2720 m!27067))

(declare-fun m!27171 () Bool)

(assert (=> bm!2720 m!27171))

(assert (=> b!33817 m!27067))

(assert (=> b!33817 m!27067))

(assert (=> b!33817 m!27071))

(assert (=> b!33818 m!27067))

(assert (=> b!33818 m!27067))

(declare-fun m!27173 () Bool)

(assert (=> b!33818 m!27173))

(assert (=> b!33819 m!27067))

(assert (=> b!33819 m!27067))

(assert (=> b!33819 m!27071))

(assert (=> b!33617 d!5179))

(declare-fun mapIsEmpty!1855 () Bool)

(declare-fun mapRes!1855 () Bool)

(assert (=> mapIsEmpty!1855 mapRes!1855))

(declare-fun b!33827 () Bool)

(declare-fun e!21471 () Bool)

(assert (=> b!33827 (= e!21471 tp_is_empty!1537)))

(declare-fun condMapEmpty!1855 () Bool)

(declare-fun mapDefault!1855 () ValueCell!569)

(assert (=> mapNonEmpty!1846 (= condMapEmpty!1855 (= mapRest!1846 ((as const (Array (_ BitVec 32) ValueCell!569)) mapDefault!1855)))))

(assert (=> mapNonEmpty!1846 (= tp!4981 (and e!21471 mapRes!1855))))

(declare-fun b!33826 () Bool)

(declare-fun e!21472 () Bool)

(assert (=> b!33826 (= e!21472 tp_is_empty!1537)))

(declare-fun mapNonEmpty!1855 () Bool)

(declare-fun tp!4996 () Bool)

(assert (=> mapNonEmpty!1855 (= mapRes!1855 (and tp!4996 e!21472))))

(declare-fun mapValue!1855 () ValueCell!569)

(declare-fun mapKey!1855 () (_ BitVec 32))

(declare-fun mapRest!1855 () (Array (_ BitVec 32) ValueCell!569))

(assert (=> mapNonEmpty!1855 (= mapRest!1846 (store mapRest!1855 mapKey!1855 mapValue!1855))))

(assert (= (and mapNonEmpty!1846 condMapEmpty!1855) mapIsEmpty!1855))

(assert (= (and mapNonEmpty!1846 (not condMapEmpty!1855)) mapNonEmpty!1855))

(assert (= (and mapNonEmpty!1855 ((_ is ValueCellFull!569) mapValue!1855)) b!33826))

(assert (= (and mapNonEmpty!1846 ((_ is ValueCellFull!569) mapDefault!1855)) b!33827))

(declare-fun m!27175 () Bool)

(assert (=> mapNonEmpty!1855 m!27175))

(declare-fun b_lambda!1701 () Bool)

(assert (= b_lambda!1699 (or (and start!4358 b_free!1183) b_lambda!1701)))

(check-sat (not b!33794) (not b!33819) (not b!33697) b_and!2001 (not b!33736) (not bm!2720) (not bm!2696) (not b!33797) (not b!33700) (not b!33799) (not mapNonEmpty!1855) (not b!33791) (not b!33802) (not bm!2715) (not b!33818) (not b!33706) (not d!5167) (not b!33800) (not b!33786) tp_is_empty!1537 (not d!5175) (not b!33688) (not bm!2714) (not b!33785) (not b_lambda!1701) (not d!5171) (not b!33817) (not b!33734) (not bm!2716) (not b!33709) (not d!5177) (not b!33739) (not bm!2717) (not b!33737) (not d!5169) (not b!33726) (not d!5173) (not b_next!1183))
(check-sat b_and!2001 (not b_next!1183))
