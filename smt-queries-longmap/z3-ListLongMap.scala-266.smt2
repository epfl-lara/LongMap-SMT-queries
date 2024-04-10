; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4370 () Bool)

(assert start!4370)

(declare-fun b_free!1185 () Bool)

(declare-fun b_next!1185 () Bool)

(assert (=> start!4370 (= b_free!1185 (not b_next!1185))))

(declare-fun tp!4987 () Bool)

(declare-fun b_and!2003 () Bool)

(assert (=> start!4370 (= tp!4987 b_and!2003)))

(declare-fun b!33697 () Bool)

(declare-fun res!20468 () Bool)

(declare-fun e!21400 () Bool)

(assert (=> b!33697 (=> (not res!20468) (not e!21400))))

(declare-datatypes ((array!2291 0))(
  ( (array!2292 (arr!1095 (Array (_ BitVec 32) (_ BitVec 64))) (size!1196 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2291)

(declare-datatypes ((List!885 0))(
  ( (Nil!882) (Cons!881 (h!1448 (_ BitVec 64)) (t!3586 List!885)) )
))
(declare-fun arrayNoDuplicates!0 (array!2291 (_ BitVec 32) List!885) Bool)

(assert (=> b!33697 (= res!20468 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!882))))

(declare-fun b!33699 () Bool)

(declare-fun e!21397 () Bool)

(declare-fun tp_is_empty!1539 () Bool)

(assert (=> b!33699 (= e!21397 tp_is_empty!1539)))

(declare-fun b!33700 () Bool)

(declare-fun res!20462 () Bool)

(assert (=> b!33700 (=> (not res!20462) (not e!21400))))

(declare-datatypes ((V!1877 0))(
  ( (V!1878 (val!796 Int)) )
))
(declare-datatypes ((ValueCell!570 0))(
  ( (ValueCellFull!570 (v!1889 V!1877)) (EmptyCell!570) )
))
(declare-datatypes ((array!2293 0))(
  ( (array!2294 (arr!1096 (Array (_ BitVec 32) ValueCell!570)) (size!1197 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2293)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!33700 (= res!20462 (and (= (size!1197 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1196 _keys!1833) (size!1197 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33701 () Bool)

(declare-fun res!20465 () Bool)

(assert (=> b!33701 (=> (not res!20465) (not e!21400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2291 (_ BitVec 32)) Bool)

(assert (=> b!33701 (= res!20465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33702 () Bool)

(declare-fun e!21401 () Bool)

(declare-fun e!21398 () Bool)

(declare-fun mapRes!1849 () Bool)

(assert (=> b!33702 (= e!21401 (and e!21398 mapRes!1849))))

(declare-fun condMapEmpty!1849 () Bool)

(declare-fun mapDefault!1849 () ValueCell!570)

(assert (=> b!33702 (= condMapEmpty!1849 (= (arr!1096 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!570)) mapDefault!1849)))))

(declare-fun b!33703 () Bool)

(assert (=> b!33703 (= e!21398 tp_is_empty!1539)))

(declare-fun mapNonEmpty!1849 () Bool)

(declare-fun tp!4986 () Bool)

(assert (=> mapNonEmpty!1849 (= mapRes!1849 (and tp!4986 e!21397))))

(declare-fun mapValue!1849 () ValueCell!570)

(declare-fun mapKey!1849 () (_ BitVec 32))

(declare-fun mapRest!1849 () (Array (_ BitVec 32) ValueCell!570))

(assert (=> mapNonEmpty!1849 (= (arr!1096 _values!1501) (store mapRest!1849 mapKey!1849 mapValue!1849))))

(declare-fun b!33704 () Bool)

(declare-fun res!20467 () Bool)

(assert (=> b!33704 (=> (not res!20467) (not e!21400))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33704 (= res!20467 (validKeyInArray!0 k0!1304))))

(declare-fun b!33705 () Bool)

(declare-fun res!20466 () Bool)

(declare-fun e!21402 () Bool)

(assert (=> b!33705 (=> (not res!20466) (not e!21402))))

(declare-fun arrayContainsKey!0 (array!2291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33705 (= res!20466 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33698 () Bool)

(assert (=> b!33698 (= e!21400 e!21402)))

(declare-fun res!20464 () Bool)

(assert (=> b!33698 (=> (not res!20464) (not e!21402))))

(declare-datatypes ((tuple2!1296 0))(
  ( (tuple2!1297 (_1!659 (_ BitVec 64)) (_2!659 V!1877)) )
))
(declare-datatypes ((List!886 0))(
  ( (Nil!883) (Cons!882 (h!1449 tuple2!1296) (t!3587 List!886)) )
))
(declare-datatypes ((ListLongMap!873 0))(
  ( (ListLongMap!874 (toList!452 List!886)) )
))
(declare-fun lt!12359 () ListLongMap!873)

(declare-fun contains!396 (ListLongMap!873 (_ BitVec 64)) Bool)

(assert (=> b!33698 (= res!20464 (not (contains!396 lt!12359 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1877)

(declare-fun minValue!1443 () V!1877)

(declare-fun getCurrentListMap!278 (array!2291 array!2293 (_ BitVec 32) (_ BitVec 32) V!1877 V!1877 (_ BitVec 32) Int) ListLongMap!873)

(assert (=> b!33698 (= lt!12359 (getCurrentListMap!278 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!20463 () Bool)

(assert (=> start!4370 (=> (not res!20463) (not e!21400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4370 (= res!20463 (validMask!0 mask!2294))))

(assert (=> start!4370 e!21400))

(assert (=> start!4370 true))

(assert (=> start!4370 tp!4987))

(declare-fun array_inv!771 (array!2293) Bool)

(assert (=> start!4370 (and (array_inv!771 _values!1501) e!21401)))

(declare-fun array_inv!772 (array!2291) Bool)

(assert (=> start!4370 (array_inv!772 _keys!1833)))

(assert (=> start!4370 tp_is_empty!1539))

(declare-fun mapIsEmpty!1849 () Bool)

(assert (=> mapIsEmpty!1849 mapRes!1849))

(declare-fun lt!12358 () (_ BitVec 32))

(declare-fun b!33706 () Bool)

(assert (=> b!33706 (= e!21402 (not (or (not (= (size!1196 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))) (bvsgt #b00000000000000000000000000000000 (size!1196 _keys!1833)) (and (bvsge lt!12358 #b00000000000000000000000000000000) (bvsle lt!12358 (size!1196 _keys!1833))))))))

(declare-datatypes ((SeekEntryResult!132 0))(
  ( (MissingZero!132 (index!2650 (_ BitVec 32))) (Found!132 (index!2651 (_ BitVec 32))) (Intermediate!132 (undefined!944 Bool) (index!2652 (_ BitVec 32)) (x!6842 (_ BitVec 32))) (Undefined!132) (MissingVacant!132 (index!2653 (_ BitVec 32))) )
))
(declare-fun lt!12360 () SeekEntryResult!132)

(get-info :version)

(assert (=> b!33706 (and ((_ is Found!132) lt!12360) (= (index!2651 lt!12360) lt!12358))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2291 (_ BitVec 32)) SeekEntryResult!132)

(assert (=> b!33706 (= lt!12360 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!755 0))(
  ( (Unit!756) )
))
(declare-fun lt!12361 () Unit!755)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2291 (_ BitVec 32)) Unit!755)

(assert (=> b!33706 (= lt!12361 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12358 _keys!1833 mask!2294))))

(assert (=> b!33706 (contains!396 lt!12359 (select (arr!1095 _keys!1833) lt!12358))))

(declare-fun lt!12357 () Unit!755)

(declare-fun lemmaValidKeyInArrayIsInListMap!64 (array!2291 array!2293 (_ BitVec 32) (_ BitVec 32) V!1877 V!1877 (_ BitVec 32) Int) Unit!755)

(assert (=> b!33706 (= lt!12357 (lemmaValidKeyInArrayIsInListMap!64 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12358 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2291 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33706 (= lt!12358 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!4370 res!20463) b!33700))

(assert (= (and b!33700 res!20462) b!33701))

(assert (= (and b!33701 res!20465) b!33697))

(assert (= (and b!33697 res!20468) b!33704))

(assert (= (and b!33704 res!20467) b!33698))

(assert (= (and b!33698 res!20464) b!33705))

(assert (= (and b!33705 res!20466) b!33706))

(assert (= (and b!33702 condMapEmpty!1849) mapIsEmpty!1849))

(assert (= (and b!33702 (not condMapEmpty!1849)) mapNonEmpty!1849))

(assert (= (and mapNonEmpty!1849 ((_ is ValueCellFull!570) mapValue!1849)) b!33699))

(assert (= (and b!33702 ((_ is ValueCellFull!570) mapDefault!1849)) b!33703))

(assert (= start!4370 b!33702))

(declare-fun m!27073 () Bool)

(assert (=> start!4370 m!27073))

(declare-fun m!27075 () Bool)

(assert (=> start!4370 m!27075))

(declare-fun m!27077 () Bool)

(assert (=> start!4370 m!27077))

(declare-fun m!27079 () Bool)

(assert (=> b!33705 m!27079))

(declare-fun m!27081 () Bool)

(assert (=> b!33701 m!27081))

(declare-fun m!27083 () Bool)

(assert (=> mapNonEmpty!1849 m!27083))

(declare-fun m!27085 () Bool)

(assert (=> b!33704 m!27085))

(declare-fun m!27087 () Bool)

(assert (=> b!33698 m!27087))

(declare-fun m!27089 () Bool)

(assert (=> b!33698 m!27089))

(declare-fun m!27091 () Bool)

(assert (=> b!33697 m!27091))

(declare-fun m!27093 () Bool)

(assert (=> b!33706 m!27093))

(declare-fun m!27095 () Bool)

(assert (=> b!33706 m!27095))

(declare-fun m!27097 () Bool)

(assert (=> b!33706 m!27097))

(declare-fun m!27099 () Bool)

(assert (=> b!33706 m!27099))

(declare-fun m!27101 () Bool)

(assert (=> b!33706 m!27101))

(declare-fun m!27103 () Bool)

(assert (=> b!33706 m!27103))

(assert (=> b!33706 m!27095))

(check-sat (not b!33704) (not mapNonEmpty!1849) (not b!33706) (not start!4370) (not b!33698) (not b!33697) (not b!33705) b_and!2003 tp_is_empty!1539 (not b!33701) (not b_next!1185))
(check-sat b_and!2003 (not b_next!1185))
(get-model)

(declare-fun d!5191 () Bool)

(declare-fun res!20495 () Bool)

(declare-fun e!21428 () Bool)

(assert (=> d!5191 (=> res!20495 e!21428)))

(assert (=> d!5191 (= res!20495 (bvsge #b00000000000000000000000000000000 (size!1196 _keys!1833)))))

(assert (=> d!5191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21428)))

(declare-fun bm!2696 () Bool)

(declare-fun call!2699 () Bool)

(assert (=> bm!2696 (= call!2699 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!33745 () Bool)

(declare-fun e!21429 () Bool)

(declare-fun e!21427 () Bool)

(assert (=> b!33745 (= e!21429 e!21427)))

(declare-fun lt!12383 () (_ BitVec 64))

(assert (=> b!33745 (= lt!12383 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12384 () Unit!755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2291 (_ BitVec 64) (_ BitVec 32)) Unit!755)

(assert (=> b!33745 (= lt!12384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12383 #b00000000000000000000000000000000))))

(assert (=> b!33745 (arrayContainsKey!0 _keys!1833 lt!12383 #b00000000000000000000000000000000)))

(declare-fun lt!12385 () Unit!755)

(assert (=> b!33745 (= lt!12385 lt!12384)))

(declare-fun res!20494 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2291 (_ BitVec 32)) SeekEntryResult!132)

(assert (=> b!33745 (= res!20494 (= (seekEntryOrOpen!0 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!132 #b00000000000000000000000000000000)))))

(assert (=> b!33745 (=> (not res!20494) (not e!21427))))

(declare-fun b!33746 () Bool)

(assert (=> b!33746 (= e!21428 e!21429)))

(declare-fun c!3880 () Bool)

(assert (=> b!33746 (= c!3880 (validKeyInArray!0 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33747 () Bool)

(assert (=> b!33747 (= e!21429 call!2699)))

(declare-fun b!33748 () Bool)

(assert (=> b!33748 (= e!21427 call!2699)))

(assert (= (and d!5191 (not res!20495)) b!33746))

(assert (= (and b!33746 c!3880) b!33745))

(assert (= (and b!33746 (not c!3880)) b!33747))

(assert (= (and b!33745 res!20494) b!33748))

(assert (= (or b!33748 b!33747) bm!2696))

(declare-fun m!27137 () Bool)

(assert (=> bm!2696 m!27137))

(declare-fun m!27139 () Bool)

(assert (=> b!33745 m!27139))

(declare-fun m!27141 () Bool)

(assert (=> b!33745 m!27141))

(declare-fun m!27143 () Bool)

(assert (=> b!33745 m!27143))

(assert (=> b!33745 m!27139))

(declare-fun m!27145 () Bool)

(assert (=> b!33745 m!27145))

(assert (=> b!33746 m!27139))

(assert (=> b!33746 m!27139))

(declare-fun m!27147 () Bool)

(assert (=> b!33746 m!27147))

(assert (=> b!33701 d!5191))

(declare-fun d!5193 () Bool)

(assert (=> d!5193 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33704 d!5193))

(declare-fun d!5195 () Bool)

(declare-fun res!20500 () Bool)

(declare-fun e!21434 () Bool)

(assert (=> d!5195 (=> res!20500 e!21434)))

(assert (=> d!5195 (= res!20500 (= (select (arr!1095 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5195 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21434)))

(declare-fun b!33753 () Bool)

(declare-fun e!21435 () Bool)

(assert (=> b!33753 (= e!21434 e!21435)))

(declare-fun res!20501 () Bool)

(assert (=> b!33753 (=> (not res!20501) (not e!21435))))

(assert (=> b!33753 (= res!20501 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1196 _keys!1833)))))

(declare-fun b!33754 () Bool)

(assert (=> b!33754 (= e!21435 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5195 (not res!20500)) b!33753))

(assert (= (and b!33753 res!20501) b!33754))

(assert (=> d!5195 m!27139))

(declare-fun m!27149 () Bool)

(assert (=> b!33754 m!27149))

(assert (=> b!33705 d!5195))

(declare-fun d!5197 () Bool)

(assert (=> d!5197 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4370 d!5197))

(declare-fun d!5199 () Bool)

(assert (=> d!5199 (= (array_inv!771 _values!1501) (bvsge (size!1197 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4370 d!5199))

(declare-fun d!5201 () Bool)

(assert (=> d!5201 (= (array_inv!772 _keys!1833) (bvsge (size!1196 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4370 d!5201))

(declare-fun d!5203 () Bool)

(declare-fun lt!12391 () SeekEntryResult!132)

(assert (=> d!5203 (and ((_ is Found!132) lt!12391) (= (index!2651 lt!12391) lt!12358))))

(assert (=> d!5203 (= lt!12391 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12390 () Unit!755)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2291 (_ BitVec 32)) Unit!755)

(assert (=> d!5203 (= lt!12390 (choose!0 k0!1304 lt!12358 _keys!1833 mask!2294))))

(assert (=> d!5203 (validMask!0 mask!2294)))

(assert (=> d!5203 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12358 _keys!1833 mask!2294) lt!12390)))

(declare-fun bs!1310 () Bool)

(assert (= bs!1310 d!5203))

(assert (=> bs!1310 m!27101))

(declare-fun m!27151 () Bool)

(assert (=> bs!1310 m!27151))

(assert (=> bs!1310 m!27073))

(assert (=> b!33706 d!5203))

(declare-fun d!5205 () Bool)

(declare-fun lt!12394 () (_ BitVec 32))

(assert (=> d!5205 (and (or (bvslt lt!12394 #b00000000000000000000000000000000) (bvsge lt!12394 (size!1196 _keys!1833)) (and (bvsge lt!12394 #b00000000000000000000000000000000) (bvslt lt!12394 (size!1196 _keys!1833)))) (bvsge lt!12394 #b00000000000000000000000000000000) (bvslt lt!12394 (size!1196 _keys!1833)) (= (select (arr!1095 _keys!1833) lt!12394) k0!1304))))

(declare-fun e!21438 () (_ BitVec 32))

(assert (=> d!5205 (= lt!12394 e!21438)))

(declare-fun c!3883 () Bool)

(assert (=> d!5205 (= c!3883 (= (select (arr!1095 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5205 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1196 _keys!1833)) (bvslt (size!1196 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5205 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12394)))

(declare-fun b!33759 () Bool)

(assert (=> b!33759 (= e!21438 #b00000000000000000000000000000000)))

(declare-fun b!33760 () Bool)

(assert (=> b!33760 (= e!21438 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5205 c!3883) b!33759))

(assert (= (and d!5205 (not c!3883)) b!33760))

(declare-fun m!27153 () Bool)

(assert (=> d!5205 m!27153))

(assert (=> d!5205 m!27139))

(declare-fun m!27155 () Bool)

(assert (=> b!33760 m!27155))

(assert (=> b!33706 d!5205))

(declare-fun d!5207 () Bool)

(declare-fun lt!12406 () SeekEntryResult!132)

(assert (=> d!5207 (and (or ((_ is MissingVacant!132) lt!12406) (not ((_ is Found!132) lt!12406)) (and (bvsge (index!2651 lt!12406) #b00000000000000000000000000000000) (bvslt (index!2651 lt!12406) (size!1196 _keys!1833)))) (not ((_ is MissingVacant!132) lt!12406)) (or (not ((_ is Found!132) lt!12406)) (= (select (arr!1095 _keys!1833) (index!2651 lt!12406)) k0!1304)))))

(declare-fun e!21446 () SeekEntryResult!132)

(assert (=> d!5207 (= lt!12406 e!21446)))

(declare-fun c!3891 () Bool)

(declare-fun lt!12405 () SeekEntryResult!132)

(assert (=> d!5207 (= c!3891 (and ((_ is Intermediate!132) lt!12405) (undefined!944 lt!12405)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2291 (_ BitVec 32)) SeekEntryResult!132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5207 (= lt!12405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5207 (validMask!0 mask!2294)))

(assert (=> d!5207 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12406)))

(declare-fun b!33773 () Bool)

(assert (=> b!33773 (= e!21446 Undefined!132)))

(declare-fun b!33774 () Bool)

(declare-fun c!3892 () Bool)

(declare-fun lt!12404 () (_ BitVec 64))

(assert (=> b!33774 (= c!3892 (= lt!12404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21447 () SeekEntryResult!132)

(declare-fun e!21445 () SeekEntryResult!132)

(assert (=> b!33774 (= e!21447 e!21445)))

(declare-fun b!33775 () Bool)

(assert (=> b!33775 (= e!21447 (Found!132 (index!2652 lt!12405)))))

(declare-fun b!33776 () Bool)

(assert (=> b!33776 (= e!21445 (MissingZero!132 (index!2652 lt!12405)))))

(declare-fun b!33777 () Bool)

(declare-fun lt!12403 () SeekEntryResult!132)

(assert (=> b!33777 (= e!21445 (ite ((_ is MissingVacant!132) lt!12403) (MissingZero!132 (index!2653 lt!12403)) lt!12403))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2291 (_ BitVec 32)) SeekEntryResult!132)

(assert (=> b!33777 (= lt!12403 (seekKeyOrZeroReturnVacant!0 (x!6842 lt!12405) (index!2652 lt!12405) (index!2652 lt!12405) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!33778 () Bool)

(assert (=> b!33778 (= e!21446 e!21447)))

(assert (=> b!33778 (= lt!12404 (select (arr!1095 _keys!1833) (index!2652 lt!12405)))))

(declare-fun c!3890 () Bool)

(assert (=> b!33778 (= c!3890 (= lt!12404 k0!1304))))

(assert (= (and d!5207 c!3891) b!33773))

(assert (= (and d!5207 (not c!3891)) b!33778))

(assert (= (and b!33778 c!3890) b!33775))

(assert (= (and b!33778 (not c!3890)) b!33774))

(assert (= (and b!33774 c!3892) b!33776))

(assert (= (and b!33774 (not c!3892)) b!33777))

(declare-fun m!27157 () Bool)

(assert (=> d!5207 m!27157))

(declare-fun m!27159 () Bool)

(assert (=> d!5207 m!27159))

(assert (=> d!5207 m!27159))

(declare-fun m!27161 () Bool)

(assert (=> d!5207 m!27161))

(assert (=> d!5207 m!27073))

(declare-fun m!27163 () Bool)

(assert (=> b!33777 m!27163))

(declare-fun m!27165 () Bool)

(assert (=> b!33778 m!27165))

(assert (=> b!33706 d!5207))

(declare-fun d!5209 () Bool)

(declare-fun e!21453 () Bool)

(assert (=> d!5209 e!21453))

(declare-fun res!20504 () Bool)

(assert (=> d!5209 (=> res!20504 e!21453)))

(declare-fun lt!12416 () Bool)

(assert (=> d!5209 (= res!20504 (not lt!12416))))

(declare-fun lt!12415 () Bool)

(assert (=> d!5209 (= lt!12416 lt!12415)))

(declare-fun lt!12418 () Unit!755)

(declare-fun e!21452 () Unit!755)

(assert (=> d!5209 (= lt!12418 e!21452)))

(declare-fun c!3895 () Bool)

(assert (=> d!5209 (= c!3895 lt!12415)))

(declare-fun containsKey!33 (List!886 (_ BitVec 64)) Bool)

(assert (=> d!5209 (= lt!12415 (containsKey!33 (toList!452 lt!12359) (select (arr!1095 _keys!1833) lt!12358)))))

(assert (=> d!5209 (= (contains!396 lt!12359 (select (arr!1095 _keys!1833) lt!12358)) lt!12416)))

(declare-fun b!33785 () Bool)

(declare-fun lt!12417 () Unit!755)

(assert (=> b!33785 (= e!21452 lt!12417)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!30 (List!886 (_ BitVec 64)) Unit!755)

(assert (=> b!33785 (= lt!12417 (lemmaContainsKeyImpliesGetValueByKeyDefined!30 (toList!452 lt!12359) (select (arr!1095 _keys!1833) lt!12358)))))

(declare-datatypes ((Option!75 0))(
  ( (Some!74 (v!1891 V!1877)) (None!73) )
))
(declare-fun isDefined!31 (Option!75) Bool)

(declare-fun getValueByKey!69 (List!886 (_ BitVec 64)) Option!75)

(assert (=> b!33785 (isDefined!31 (getValueByKey!69 (toList!452 lt!12359) (select (arr!1095 _keys!1833) lt!12358)))))

(declare-fun b!33786 () Bool)

(declare-fun Unit!757 () Unit!755)

(assert (=> b!33786 (= e!21452 Unit!757)))

(declare-fun b!33787 () Bool)

(assert (=> b!33787 (= e!21453 (isDefined!31 (getValueByKey!69 (toList!452 lt!12359) (select (arr!1095 _keys!1833) lt!12358))))))

(assert (= (and d!5209 c!3895) b!33785))

(assert (= (and d!5209 (not c!3895)) b!33786))

(assert (= (and d!5209 (not res!20504)) b!33787))

(assert (=> d!5209 m!27095))

(declare-fun m!27167 () Bool)

(assert (=> d!5209 m!27167))

(assert (=> b!33785 m!27095))

(declare-fun m!27169 () Bool)

(assert (=> b!33785 m!27169))

(assert (=> b!33785 m!27095))

(declare-fun m!27171 () Bool)

(assert (=> b!33785 m!27171))

(assert (=> b!33785 m!27171))

(declare-fun m!27173 () Bool)

(assert (=> b!33785 m!27173))

(assert (=> b!33787 m!27095))

(assert (=> b!33787 m!27171))

(assert (=> b!33787 m!27171))

(assert (=> b!33787 m!27173))

(assert (=> b!33706 d!5209))

(declare-fun d!5211 () Bool)

(declare-fun e!21456 () Bool)

(assert (=> d!5211 e!21456))

(declare-fun res!20507 () Bool)

(assert (=> d!5211 (=> (not res!20507) (not e!21456))))

(assert (=> d!5211 (= res!20507 (and (bvsge lt!12358 #b00000000000000000000000000000000) (bvslt lt!12358 (size!1196 _keys!1833))))))

(declare-fun lt!12421 () Unit!755)

(declare-fun choose!218 (array!2291 array!2293 (_ BitVec 32) (_ BitVec 32) V!1877 V!1877 (_ BitVec 32) Int) Unit!755)

(assert (=> d!5211 (= lt!12421 (choose!218 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12358 defaultEntry!1504))))

(assert (=> d!5211 (validMask!0 mask!2294)))

(assert (=> d!5211 (= (lemmaValidKeyInArrayIsInListMap!64 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12358 defaultEntry!1504) lt!12421)))

(declare-fun b!33790 () Bool)

(assert (=> b!33790 (= e!21456 (contains!396 (getCurrentListMap!278 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1095 _keys!1833) lt!12358)))))

(assert (= (and d!5211 res!20507) b!33790))

(declare-fun m!27175 () Bool)

(assert (=> d!5211 m!27175))

(assert (=> d!5211 m!27073))

(assert (=> b!33790 m!27089))

(assert (=> b!33790 m!27095))

(assert (=> b!33790 m!27089))

(assert (=> b!33790 m!27095))

(declare-fun m!27177 () Bool)

(assert (=> b!33790 m!27177))

(assert (=> b!33706 d!5211))

(declare-fun b!33801 () Bool)

(declare-fun e!21466 () Bool)

(declare-fun call!2702 () Bool)

(assert (=> b!33801 (= e!21466 call!2702)))

(declare-fun bm!2699 () Bool)

(declare-fun c!3898 () Bool)

(assert (=> bm!2699 (= call!2702 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3898 (Cons!881 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000) Nil!882) Nil!882)))))

(declare-fun b!33802 () Bool)

(declare-fun e!21467 () Bool)

(declare-fun contains!397 (List!885 (_ BitVec 64)) Bool)

(assert (=> b!33802 (= e!21467 (contains!397 Nil!882 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33803 () Bool)

(assert (=> b!33803 (= e!21466 call!2702)))

(declare-fun b!33804 () Bool)

(declare-fun e!21468 () Bool)

(declare-fun e!21465 () Bool)

(assert (=> b!33804 (= e!21468 e!21465)))

(declare-fun res!20515 () Bool)

(assert (=> b!33804 (=> (not res!20515) (not e!21465))))

(assert (=> b!33804 (= res!20515 (not e!21467))))

(declare-fun res!20514 () Bool)

(assert (=> b!33804 (=> (not res!20514) (not e!21467))))

(assert (=> b!33804 (= res!20514 (validKeyInArray!0 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33805 () Bool)

(assert (=> b!33805 (= e!21465 e!21466)))

(assert (=> b!33805 (= c!3898 (validKeyInArray!0 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5213 () Bool)

(declare-fun res!20516 () Bool)

(assert (=> d!5213 (=> res!20516 e!21468)))

(assert (=> d!5213 (= res!20516 (bvsge #b00000000000000000000000000000000 (size!1196 _keys!1833)))))

(assert (=> d!5213 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!882) e!21468)))

(assert (= (and d!5213 (not res!20516)) b!33804))

(assert (= (and b!33804 res!20514) b!33802))

(assert (= (and b!33804 res!20515) b!33805))

(assert (= (and b!33805 c!3898) b!33803))

(assert (= (and b!33805 (not c!3898)) b!33801))

(assert (= (or b!33803 b!33801) bm!2699))

(assert (=> bm!2699 m!27139))

(declare-fun m!27179 () Bool)

(assert (=> bm!2699 m!27179))

(assert (=> b!33802 m!27139))

(assert (=> b!33802 m!27139))

(declare-fun m!27181 () Bool)

(assert (=> b!33802 m!27181))

(assert (=> b!33804 m!27139))

(assert (=> b!33804 m!27139))

(assert (=> b!33804 m!27147))

(assert (=> b!33805 m!27139))

(assert (=> b!33805 m!27139))

(assert (=> b!33805 m!27147))

(assert (=> b!33697 d!5213))

(declare-fun d!5215 () Bool)

(declare-fun e!21470 () Bool)

(assert (=> d!5215 e!21470))

(declare-fun res!20517 () Bool)

(assert (=> d!5215 (=> res!20517 e!21470)))

(declare-fun lt!12423 () Bool)

(assert (=> d!5215 (= res!20517 (not lt!12423))))

(declare-fun lt!12422 () Bool)

(assert (=> d!5215 (= lt!12423 lt!12422)))

(declare-fun lt!12425 () Unit!755)

(declare-fun e!21469 () Unit!755)

(assert (=> d!5215 (= lt!12425 e!21469)))

(declare-fun c!3899 () Bool)

(assert (=> d!5215 (= c!3899 lt!12422)))

(assert (=> d!5215 (= lt!12422 (containsKey!33 (toList!452 lt!12359) k0!1304))))

(assert (=> d!5215 (= (contains!396 lt!12359 k0!1304) lt!12423)))

(declare-fun b!33806 () Bool)

(declare-fun lt!12424 () Unit!755)

(assert (=> b!33806 (= e!21469 lt!12424)))

(assert (=> b!33806 (= lt!12424 (lemmaContainsKeyImpliesGetValueByKeyDefined!30 (toList!452 lt!12359) k0!1304))))

(assert (=> b!33806 (isDefined!31 (getValueByKey!69 (toList!452 lt!12359) k0!1304))))

(declare-fun b!33807 () Bool)

(declare-fun Unit!758 () Unit!755)

(assert (=> b!33807 (= e!21469 Unit!758)))

(declare-fun b!33808 () Bool)

(assert (=> b!33808 (= e!21470 (isDefined!31 (getValueByKey!69 (toList!452 lt!12359) k0!1304)))))

(assert (= (and d!5215 c!3899) b!33806))

(assert (= (and d!5215 (not c!3899)) b!33807))

(assert (= (and d!5215 (not res!20517)) b!33808))

(declare-fun m!27183 () Bool)

(assert (=> d!5215 m!27183))

(declare-fun m!27185 () Bool)

(assert (=> b!33806 m!27185))

(declare-fun m!27187 () Bool)

(assert (=> b!33806 m!27187))

(assert (=> b!33806 m!27187))

(declare-fun m!27189 () Bool)

(assert (=> b!33806 m!27189))

(assert (=> b!33808 m!27187))

(assert (=> b!33808 m!27187))

(assert (=> b!33808 m!27189))

(assert (=> b!33698 d!5215))

(declare-fun bm!2714 () Bool)

(declare-fun call!2717 () ListLongMap!873)

(declare-fun call!2720 () ListLongMap!873)

(assert (=> bm!2714 (= call!2717 call!2720)))

(declare-fun b!33851 () Bool)

(declare-fun e!21503 () Bool)

(declare-fun e!21506 () Bool)

(assert (=> b!33851 (= e!21503 e!21506)))

(declare-fun res!20544 () Bool)

(declare-fun call!2723 () Bool)

(assert (=> b!33851 (= res!20544 call!2723)))

(assert (=> b!33851 (=> (not res!20544) (not e!21506))))

(declare-fun bm!2715 () Bool)

(declare-fun call!2719 () ListLongMap!873)

(declare-fun call!2718 () ListLongMap!873)

(assert (=> bm!2715 (= call!2719 call!2718)))

(declare-fun b!33852 () Bool)

(declare-fun lt!12481 () ListLongMap!873)

(declare-fun apply!37 (ListLongMap!873 (_ BitVec 64)) V!1877)

(assert (=> b!33852 (= e!21506 (= (apply!37 lt!12481 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!33853 () Bool)

(declare-fun e!21502 () Bool)

(assert (=> b!33853 (= e!21502 (validKeyInArray!0 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33854 () Bool)

(assert (=> b!33854 (= e!21503 (not call!2723))))

(declare-fun b!33855 () Bool)

(declare-fun e!21504 () ListLongMap!873)

(declare-fun +!55 (ListLongMap!873 tuple2!1296) ListLongMap!873)

(assert (=> b!33855 (= e!21504 (+!55 call!2718 (tuple2!1297 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!33856 () Bool)

(declare-fun e!21501 () Bool)

(declare-fun e!21505 () Bool)

(assert (=> b!33856 (= e!21501 e!21505)))

(declare-fun c!3916 () Bool)

(assert (=> b!33856 (= c!3916 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2716 () Bool)

(declare-fun call!2721 () Bool)

(assert (=> bm!2716 (= call!2721 (contains!396 lt!12481 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!33857 () Bool)

(declare-fun e!21498 () Bool)

(assert (=> b!33857 (= e!21498 (validKeyInArray!0 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33858 () Bool)

(declare-fun res!20538 () Bool)

(assert (=> b!33858 (=> (not res!20538) (not e!21501))))

(declare-fun e!21509 () Bool)

(assert (=> b!33858 (= res!20538 e!21509)))

(declare-fun res!20539 () Bool)

(assert (=> b!33858 (=> res!20539 e!21509)))

(assert (=> b!33858 (= res!20539 (not e!21498))))

(declare-fun res!20543 () Bool)

(assert (=> b!33858 (=> (not res!20543) (not e!21498))))

(assert (=> b!33858 (= res!20543 (bvslt #b00000000000000000000000000000000 (size!1196 _keys!1833)))))

(declare-fun b!33859 () Bool)

(declare-fun e!21497 () ListLongMap!873)

(declare-fun call!2722 () ListLongMap!873)

(assert (=> b!33859 (= e!21497 call!2722)))

(declare-fun b!33860 () Bool)

(declare-fun e!21507 () Bool)

(declare-fun get!574 (ValueCell!570 V!1877) V!1877)

(declare-fun dynLambda!154 (Int (_ BitVec 64)) V!1877)

(assert (=> b!33860 (= e!21507 (= (apply!37 lt!12481 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000)) (get!574 (select (arr!1096 _values!1501) #b00000000000000000000000000000000) (dynLambda!154 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1197 _values!1501)))))

(assert (=> b!33860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1196 _keys!1833)))))

(declare-fun b!33861 () Bool)

(declare-fun e!21499 () Unit!755)

(declare-fun Unit!759 () Unit!755)

(assert (=> b!33861 (= e!21499 Unit!759)))

(declare-fun b!33862 () Bool)

(assert (=> b!33862 (= e!21505 (not call!2721))))

(declare-fun bm!2717 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!24 (array!2291 array!2293 (_ BitVec 32) (_ BitVec 32) V!1877 V!1877 (_ BitVec 32) Int) ListLongMap!873)

(assert (=> bm!2717 (= call!2720 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun bm!2718 () Bool)

(assert (=> bm!2718 (= call!2722 call!2717)))

(declare-fun b!33863 () Bool)

(declare-fun e!21500 () Bool)

(assert (=> b!33863 (= e!21505 e!21500)))

(declare-fun res!20542 () Bool)

(assert (=> b!33863 (= res!20542 call!2721)))

(assert (=> b!33863 (=> (not res!20542) (not e!21500))))

(declare-fun b!33864 () Bool)

(declare-fun c!3913 () Bool)

(assert (=> b!33864 (= c!3913 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!21508 () ListLongMap!873)

(assert (=> b!33864 (= e!21508 e!21497)))

(declare-fun b!33865 () Bool)

(declare-fun lt!12482 () Unit!755)

(assert (=> b!33865 (= e!21499 lt!12482)))

(declare-fun lt!12474 () ListLongMap!873)

(assert (=> b!33865 (= lt!12474 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12488 () (_ BitVec 64))

(assert (=> b!33865 (= lt!12488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12486 () (_ BitVec 64))

(assert (=> b!33865 (= lt!12486 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12485 () Unit!755)

(declare-fun addStillContains!22 (ListLongMap!873 (_ BitVec 64) V!1877 (_ BitVec 64)) Unit!755)

(assert (=> b!33865 (= lt!12485 (addStillContains!22 lt!12474 lt!12488 zeroValue!1443 lt!12486))))

(assert (=> b!33865 (contains!396 (+!55 lt!12474 (tuple2!1297 lt!12488 zeroValue!1443)) lt!12486)))

(declare-fun lt!12487 () Unit!755)

(assert (=> b!33865 (= lt!12487 lt!12485)))

(declare-fun lt!12473 () ListLongMap!873)

(assert (=> b!33865 (= lt!12473 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12480 () (_ BitVec 64))

(assert (=> b!33865 (= lt!12480 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12471 () (_ BitVec 64))

(assert (=> b!33865 (= lt!12471 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12475 () Unit!755)

(declare-fun addApplyDifferent!22 (ListLongMap!873 (_ BitVec 64) V!1877 (_ BitVec 64)) Unit!755)

(assert (=> b!33865 (= lt!12475 (addApplyDifferent!22 lt!12473 lt!12480 minValue!1443 lt!12471))))

(assert (=> b!33865 (= (apply!37 (+!55 lt!12473 (tuple2!1297 lt!12480 minValue!1443)) lt!12471) (apply!37 lt!12473 lt!12471))))

(declare-fun lt!12491 () Unit!755)

(assert (=> b!33865 (= lt!12491 lt!12475)))

(declare-fun lt!12489 () ListLongMap!873)

(assert (=> b!33865 (= lt!12489 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12484 () (_ BitVec 64))

(assert (=> b!33865 (= lt!12484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12477 () (_ BitVec 64))

(assert (=> b!33865 (= lt!12477 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12478 () Unit!755)

(assert (=> b!33865 (= lt!12478 (addApplyDifferent!22 lt!12489 lt!12484 zeroValue!1443 lt!12477))))

(assert (=> b!33865 (= (apply!37 (+!55 lt!12489 (tuple2!1297 lt!12484 zeroValue!1443)) lt!12477) (apply!37 lt!12489 lt!12477))))

(declare-fun lt!12476 () Unit!755)

(assert (=> b!33865 (= lt!12476 lt!12478)))

(declare-fun lt!12483 () ListLongMap!873)

(assert (=> b!33865 (= lt!12483 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12479 () (_ BitVec 64))

(assert (=> b!33865 (= lt!12479 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12472 () (_ BitVec 64))

(assert (=> b!33865 (= lt!12472 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33865 (= lt!12482 (addApplyDifferent!22 lt!12483 lt!12479 minValue!1443 lt!12472))))

(assert (=> b!33865 (= (apply!37 (+!55 lt!12483 (tuple2!1297 lt!12479 minValue!1443)) lt!12472) (apply!37 lt!12483 lt!12472))))

(declare-fun b!33866 () Bool)

(assert (=> b!33866 (= e!21509 e!21507)))

(declare-fun res!20540 () Bool)

(assert (=> b!33866 (=> (not res!20540) (not e!21507))))

(assert (=> b!33866 (= res!20540 (contains!396 lt!12481 (select (arr!1095 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1196 _keys!1833)))))

(declare-fun bm!2719 () Bool)

(assert (=> bm!2719 (= call!2723 (contains!396 lt!12481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2720 () Bool)

(declare-fun c!3917 () Bool)

(declare-fun c!3914 () Bool)

(assert (=> bm!2720 (= call!2718 (+!55 (ite c!3917 call!2720 (ite c!3914 call!2717 call!2722)) (ite (or c!3917 c!3914) (tuple2!1297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1297 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!33867 () Bool)

(declare-fun res!20536 () Bool)

(assert (=> b!33867 (=> (not res!20536) (not e!21501))))

(assert (=> b!33867 (= res!20536 e!21503)))

(declare-fun c!3912 () Bool)

(assert (=> b!33867 (= c!3912 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!5217 () Bool)

(assert (=> d!5217 e!21501))

(declare-fun res!20541 () Bool)

(assert (=> d!5217 (=> (not res!20541) (not e!21501))))

(assert (=> d!5217 (= res!20541 (or (bvsge #b00000000000000000000000000000000 (size!1196 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1196 _keys!1833)))))))

(declare-fun lt!12490 () ListLongMap!873)

(assert (=> d!5217 (= lt!12481 lt!12490)))

(declare-fun lt!12470 () Unit!755)

(assert (=> d!5217 (= lt!12470 e!21499)))

(declare-fun c!3915 () Bool)

(assert (=> d!5217 (= c!3915 e!21502)))

(declare-fun res!20537 () Bool)

(assert (=> d!5217 (=> (not res!20537) (not e!21502))))

(assert (=> d!5217 (= res!20537 (bvslt #b00000000000000000000000000000000 (size!1196 _keys!1833)))))

(assert (=> d!5217 (= lt!12490 e!21504)))

(assert (=> d!5217 (= c!3917 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5217 (validMask!0 mask!2294)))

(assert (=> d!5217 (= (getCurrentListMap!278 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12481)))

(declare-fun b!33868 () Bool)

(assert (=> b!33868 (= e!21497 call!2719)))

(declare-fun b!33869 () Bool)

(assert (=> b!33869 (= e!21508 call!2719)))

(declare-fun b!33870 () Bool)

(assert (=> b!33870 (= e!21500 (= (apply!37 lt!12481 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!33871 () Bool)

(assert (=> b!33871 (= e!21504 e!21508)))

(assert (=> b!33871 (= c!3914 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!5217 c!3917) b!33855))

(assert (= (and d!5217 (not c!3917)) b!33871))

(assert (= (and b!33871 c!3914) b!33869))

(assert (= (and b!33871 (not c!3914)) b!33864))

(assert (= (and b!33864 c!3913) b!33868))

(assert (= (and b!33864 (not c!3913)) b!33859))

(assert (= (or b!33868 b!33859) bm!2718))

(assert (= (or b!33869 bm!2718) bm!2714))

(assert (= (or b!33869 b!33868) bm!2715))

(assert (= (or b!33855 bm!2714) bm!2717))

(assert (= (or b!33855 bm!2715) bm!2720))

(assert (= (and d!5217 res!20537) b!33853))

(assert (= (and d!5217 c!3915) b!33865))

(assert (= (and d!5217 (not c!3915)) b!33861))

(assert (= (and d!5217 res!20541) b!33858))

(assert (= (and b!33858 res!20543) b!33857))

(assert (= (and b!33858 (not res!20539)) b!33866))

(assert (= (and b!33866 res!20540) b!33860))

(assert (= (and b!33858 res!20538) b!33867))

(assert (= (and b!33867 c!3912) b!33851))

(assert (= (and b!33867 (not c!3912)) b!33854))

(assert (= (and b!33851 res!20544) b!33852))

(assert (= (or b!33851 b!33854) bm!2719))

(assert (= (and b!33867 res!20536) b!33856))

(assert (= (and b!33856 c!3916) b!33863))

(assert (= (and b!33856 (not c!3916)) b!33862))

(assert (= (and b!33863 res!20542) b!33870))

(assert (= (or b!33863 b!33862) bm!2716))

(declare-fun b_lambda!1711 () Bool)

(assert (=> (not b_lambda!1711) (not b!33860)))

(declare-fun t!3590 () Bool)

(declare-fun tb!689 () Bool)

(assert (=> (and start!4370 (= defaultEntry!1504 defaultEntry!1504) t!3590) tb!689))

(declare-fun result!1177 () Bool)

(assert (=> tb!689 (= result!1177 tp_is_empty!1539)))

(assert (=> b!33860 t!3590))

(declare-fun b_and!2007 () Bool)

(assert (= b_and!2003 (and (=> t!3590 result!1177) b_and!2007)))

(declare-fun m!27191 () Bool)

(assert (=> bm!2719 m!27191))

(declare-fun m!27193 () Bool)

(assert (=> bm!2717 m!27193))

(declare-fun m!27195 () Bool)

(assert (=> bm!2720 m!27195))

(declare-fun m!27197 () Bool)

(assert (=> bm!2716 m!27197))

(declare-fun m!27199 () Bool)

(assert (=> b!33865 m!27199))

(declare-fun m!27201 () Bool)

(assert (=> b!33865 m!27201))

(declare-fun m!27203 () Bool)

(assert (=> b!33865 m!27203))

(declare-fun m!27205 () Bool)

(assert (=> b!33865 m!27205))

(declare-fun m!27207 () Bool)

(assert (=> b!33865 m!27207))

(declare-fun m!27209 () Bool)

(assert (=> b!33865 m!27209))

(declare-fun m!27211 () Bool)

(assert (=> b!33865 m!27211))

(declare-fun m!27213 () Bool)

(assert (=> b!33865 m!27213))

(assert (=> b!33865 m!27139))

(assert (=> b!33865 m!27207))

(declare-fun m!27215 () Bool)

(assert (=> b!33865 m!27215))

(declare-fun m!27217 () Bool)

(assert (=> b!33865 m!27217))

(declare-fun m!27219 () Bool)

(assert (=> b!33865 m!27219))

(assert (=> b!33865 m!27211))

(declare-fun m!27221 () Bool)

(assert (=> b!33865 m!27221))

(assert (=> b!33865 m!27217))

(declare-fun m!27223 () Bool)

(assert (=> b!33865 m!27223))

(declare-fun m!27225 () Bool)

(assert (=> b!33865 m!27225))

(assert (=> b!33865 m!27193))

(assert (=> b!33865 m!27199))

(declare-fun m!27227 () Bool)

(assert (=> b!33865 m!27227))

(assert (=> d!5217 m!27073))

(declare-fun m!27229 () Bool)

(assert (=> b!33860 m!27229))

(assert (=> b!33860 m!27229))

(declare-fun m!27231 () Bool)

(assert (=> b!33860 m!27231))

(declare-fun m!27233 () Bool)

(assert (=> b!33860 m!27233))

(assert (=> b!33860 m!27231))

(assert (=> b!33860 m!27139))

(assert (=> b!33860 m!27139))

(declare-fun m!27235 () Bool)

(assert (=> b!33860 m!27235))

(assert (=> b!33857 m!27139))

(assert (=> b!33857 m!27139))

(assert (=> b!33857 m!27147))

(assert (=> b!33866 m!27139))

(assert (=> b!33866 m!27139))

(declare-fun m!27237 () Bool)

(assert (=> b!33866 m!27237))

(declare-fun m!27239 () Bool)

(assert (=> b!33870 m!27239))

(declare-fun m!27241 () Bool)

(assert (=> b!33852 m!27241))

(declare-fun m!27243 () Bool)

(assert (=> b!33855 m!27243))

(assert (=> b!33853 m!27139))

(assert (=> b!33853 m!27139))

(assert (=> b!33853 m!27147))

(assert (=> b!33698 d!5217))

(declare-fun b!33880 () Bool)

(declare-fun e!21514 () Bool)

(assert (=> b!33880 (= e!21514 tp_is_empty!1539)))

(declare-fun b!33881 () Bool)

(declare-fun e!21515 () Bool)

(assert (=> b!33881 (= e!21515 tp_is_empty!1539)))

(declare-fun condMapEmpty!1855 () Bool)

(declare-fun mapDefault!1855 () ValueCell!570)

(assert (=> mapNonEmpty!1849 (= condMapEmpty!1855 (= mapRest!1849 ((as const (Array (_ BitVec 32) ValueCell!570)) mapDefault!1855)))))

(declare-fun mapRes!1855 () Bool)

(assert (=> mapNonEmpty!1849 (= tp!4986 (and e!21515 mapRes!1855))))

(declare-fun mapIsEmpty!1855 () Bool)

(assert (=> mapIsEmpty!1855 mapRes!1855))

(declare-fun mapNonEmpty!1855 () Bool)

(declare-fun tp!4996 () Bool)

(assert (=> mapNonEmpty!1855 (= mapRes!1855 (and tp!4996 e!21514))))

(declare-fun mapRest!1855 () (Array (_ BitVec 32) ValueCell!570))

(declare-fun mapKey!1855 () (_ BitVec 32))

(declare-fun mapValue!1855 () ValueCell!570)

(assert (=> mapNonEmpty!1855 (= mapRest!1849 (store mapRest!1855 mapKey!1855 mapValue!1855))))

(assert (= (and mapNonEmpty!1849 condMapEmpty!1855) mapIsEmpty!1855))

(assert (= (and mapNonEmpty!1849 (not condMapEmpty!1855)) mapNonEmpty!1855))

(assert (= (and mapNonEmpty!1855 ((_ is ValueCellFull!570) mapValue!1855)) b!33880))

(assert (= (and mapNonEmpty!1849 ((_ is ValueCellFull!570) mapDefault!1855)) b!33881))

(declare-fun m!27245 () Bool)

(assert (=> mapNonEmpty!1855 m!27245))

(declare-fun b_lambda!1713 () Bool)

(assert (= b_lambda!1711 (or (and start!4370 b_free!1185) b_lambda!1713)))

(check-sat (not bm!2699) (not b!33853) (not b!33804) (not b!33866) (not b!33777) b_and!2007 (not b!33787) (not b!33806) (not b!33754) (not d!5209) (not b!33802) (not b!33785) (not b_lambda!1713) tp_is_empty!1539 (not b!33790) (not b!33860) (not b!33857) (not d!5215) (not d!5203) (not mapNonEmpty!1855) (not b!33745) (not b!33760) (not d!5211) (not bm!2720) (not bm!2717) (not bm!2696) (not b!33805) (not b!33746) (not b!33852) (not b!33808) (not d!5217) (not b!33865) (not bm!2716) (not b!33870) (not b_next!1185) (not d!5207) (not bm!2719) (not b!33855))
(check-sat b_and!2007 (not b_next!1185))
