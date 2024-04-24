; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4364 () Bool)

(assert start!4364)

(declare-fun b_free!1183 () Bool)

(declare-fun b_next!1183 () Bool)

(assert (=> start!4364 (= b_free!1183 (not b_next!1183))))

(declare-fun tp!4981 () Bool)

(declare-fun b_and!1991 () Bool)

(assert (=> start!4364 (= tp!4981 b_and!1991)))

(declare-fun lt!12301 () (_ BitVec 32))

(declare-datatypes ((array!2273 0))(
  ( (array!2274 (arr!1086 (Array (_ BitVec 32) (_ BitVec 64))) (size!1187 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2273)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun b!33595 () Bool)

(declare-fun e!21328 () Bool)

(assert (=> b!33595 (= e!21328 (not (or (not (= (size!1187 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))) (bvsgt #b00000000000000000000000000000000 (size!1187 _keys!1833)) (and (bvsge lt!12301 #b00000000000000000000000000000000) (bvsle lt!12301 (size!1187 _keys!1833))))))))

(declare-datatypes ((SeekEntryResult!127 0))(
  ( (MissingZero!127 (index!2630 (_ BitVec 32))) (Found!127 (index!2631 (_ BitVec 32))) (Intermediate!127 (undefined!939 Bool) (index!2632 (_ BitVec 32)) (x!6837 (_ BitVec 32))) (Undefined!127) (MissingVacant!127 (index!2633 (_ BitVec 32))) )
))
(declare-fun lt!12300 () SeekEntryResult!127)

(get-info :version)

(assert (=> b!33595 (and ((_ is Found!127) lt!12300) (= (index!2631 lt!12300) lt!12301))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2273 (_ BitVec 32)) SeekEntryResult!127)

(assert (=> b!33595 (= lt!12300 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!757 0))(
  ( (Unit!758) )
))
(declare-fun lt!12299 () Unit!757)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2273 (_ BitVec 32)) Unit!757)

(assert (=> b!33595 (= lt!12299 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12301 _keys!1833 mask!2294))))

(declare-datatypes ((V!1875 0))(
  ( (V!1876 (val!795 Int)) )
))
(declare-datatypes ((tuple2!1276 0))(
  ( (tuple2!1277 (_1!649 (_ BitVec 64)) (_2!649 V!1875)) )
))
(declare-datatypes ((List!869 0))(
  ( (Nil!866) (Cons!865 (h!1432 tuple2!1276) (t!3564 List!869)) )
))
(declare-datatypes ((ListLongMap!847 0))(
  ( (ListLongMap!848 (toList!439 List!869)) )
))
(declare-fun lt!12298 () ListLongMap!847)

(declare-fun contains!385 (ListLongMap!847 (_ BitVec 64)) Bool)

(assert (=> b!33595 (contains!385 lt!12298 (select (arr!1086 _keys!1833) lt!12301))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!569 0))(
  ( (ValueCellFull!569 (v!1888 V!1875)) (EmptyCell!569) )
))
(declare-datatypes ((array!2275 0))(
  ( (array!2276 (arr!1087 (Array (_ BitVec 32) ValueCell!569)) (size!1188 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2275)

(declare-fun lt!12302 () Unit!757)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1875)

(declare-fun minValue!1443 () V!1875)

(declare-fun lemmaValidKeyInArrayIsInListMap!61 (array!2273 array!2275 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) Unit!757)

(assert (=> b!33595 (= lt!12302 (lemmaValidKeyInArrayIsInListMap!61 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12301 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2273 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33595 (= lt!12301 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33596 () Bool)

(declare-fun res!20401 () Bool)

(assert (=> b!33596 (=> (not res!20401) (not e!21328))))

(declare-fun arrayContainsKey!0 (array!2273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33596 (= res!20401 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33597 () Bool)

(declare-fun res!20404 () Bool)

(declare-fun e!21329 () Bool)

(assert (=> b!33597 (=> (not res!20404) (not e!21329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2273 (_ BitVec 32)) Bool)

(assert (=> b!33597 (= res!20404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33598 () Bool)

(declare-fun e!21330 () Bool)

(declare-fun e!21331 () Bool)

(declare-fun mapRes!1846 () Bool)

(assert (=> b!33598 (= e!21330 (and e!21331 mapRes!1846))))

(declare-fun condMapEmpty!1846 () Bool)

(declare-fun mapDefault!1846 () ValueCell!569)

(assert (=> b!33598 (= condMapEmpty!1846 (= (arr!1087 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!569)) mapDefault!1846)))))

(declare-fun b!33600 () Bool)

(declare-fun res!20405 () Bool)

(assert (=> b!33600 (=> (not res!20405) (not e!21329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33600 (= res!20405 (validKeyInArray!0 k0!1304))))

(declare-fun b!33601 () Bool)

(declare-fun tp_is_empty!1537 () Bool)

(assert (=> b!33601 (= e!21331 tp_is_empty!1537)))

(declare-fun mapIsEmpty!1846 () Bool)

(assert (=> mapIsEmpty!1846 mapRes!1846))

(declare-fun b!33602 () Bool)

(declare-fun res!20407 () Bool)

(assert (=> b!33602 (=> (not res!20407) (not e!21329))))

(assert (=> b!33602 (= res!20407 (and (= (size!1188 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1187 _keys!1833) (size!1188 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1846 () Bool)

(declare-fun tp!4980 () Bool)

(declare-fun e!21327 () Bool)

(assert (=> mapNonEmpty!1846 (= mapRes!1846 (and tp!4980 e!21327))))

(declare-fun mapRest!1846 () (Array (_ BitVec 32) ValueCell!569))

(declare-fun mapValue!1846 () ValueCell!569)

(declare-fun mapKey!1846 () (_ BitVec 32))

(assert (=> mapNonEmpty!1846 (= (arr!1087 _values!1501) (store mapRest!1846 mapKey!1846 mapValue!1846))))

(declare-fun b!33603 () Bool)

(assert (=> b!33603 (= e!21327 tp_is_empty!1537)))

(declare-fun b!33604 () Bool)

(declare-fun res!20402 () Bool)

(assert (=> b!33604 (=> (not res!20402) (not e!21329))))

(declare-datatypes ((List!870 0))(
  ( (Nil!867) (Cons!866 (h!1433 (_ BitVec 64)) (t!3565 List!870)) )
))
(declare-fun arrayNoDuplicates!0 (array!2273 (_ BitVec 32) List!870) Bool)

(assert (=> b!33604 (= res!20402 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!867))))

(declare-fun b!33599 () Bool)

(assert (=> b!33599 (= e!21329 e!21328)))

(declare-fun res!20403 () Bool)

(assert (=> b!33599 (=> (not res!20403) (not e!21328))))

(assert (=> b!33599 (= res!20403 (not (contains!385 lt!12298 k0!1304)))))

(declare-fun getCurrentListMap!262 (array!2273 array!2275 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) ListLongMap!847)

(assert (=> b!33599 (= lt!12298 (getCurrentListMap!262 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!20406 () Bool)

(assert (=> start!4364 (=> (not res!20406) (not e!21329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4364 (= res!20406 (validMask!0 mask!2294))))

(assert (=> start!4364 e!21329))

(assert (=> start!4364 true))

(assert (=> start!4364 tp!4981))

(declare-fun array_inv!747 (array!2275) Bool)

(assert (=> start!4364 (and (array_inv!747 _values!1501) e!21330)))

(declare-fun array_inv!748 (array!2273) Bool)

(assert (=> start!4364 (array_inv!748 _keys!1833)))

(assert (=> start!4364 tp_is_empty!1537))

(assert (= (and start!4364 res!20406) b!33602))

(assert (= (and b!33602 res!20407) b!33597))

(assert (= (and b!33597 res!20404) b!33604))

(assert (= (and b!33604 res!20402) b!33600))

(assert (= (and b!33600 res!20405) b!33599))

(assert (= (and b!33599 res!20403) b!33596))

(assert (= (and b!33596 res!20401) b!33595))

(assert (= (and b!33598 condMapEmpty!1846) mapIsEmpty!1846))

(assert (= (and b!33598 (not condMapEmpty!1846)) mapNonEmpty!1846))

(assert (= (and mapNonEmpty!1846 ((_ is ValueCellFull!569) mapValue!1846)) b!33603))

(assert (= (and b!33598 ((_ is ValueCellFull!569) mapDefault!1846)) b!33601))

(assert (= start!4364 b!33598))

(declare-fun m!26889 () Bool)

(assert (=> b!33604 m!26889))

(declare-fun m!26891 () Bool)

(assert (=> start!4364 m!26891))

(declare-fun m!26893 () Bool)

(assert (=> start!4364 m!26893))

(declare-fun m!26895 () Bool)

(assert (=> start!4364 m!26895))

(declare-fun m!26897 () Bool)

(assert (=> b!33596 m!26897))

(declare-fun m!26899 () Bool)

(assert (=> b!33597 m!26899))

(declare-fun m!26901 () Bool)

(assert (=> b!33599 m!26901))

(declare-fun m!26903 () Bool)

(assert (=> b!33599 m!26903))

(declare-fun m!26905 () Bool)

(assert (=> mapNonEmpty!1846 m!26905))

(declare-fun m!26907 () Bool)

(assert (=> b!33595 m!26907))

(declare-fun m!26909 () Bool)

(assert (=> b!33595 m!26909))

(declare-fun m!26911 () Bool)

(assert (=> b!33595 m!26911))

(assert (=> b!33595 m!26909))

(declare-fun m!26913 () Bool)

(assert (=> b!33595 m!26913))

(declare-fun m!26915 () Bool)

(assert (=> b!33595 m!26915))

(declare-fun m!26917 () Bool)

(assert (=> b!33595 m!26917))

(declare-fun m!26919 () Bool)

(assert (=> b!33600 m!26919))

(check-sat (not b!33599) (not b!33595) (not b!33600) b_and!1991 (not b!33596) (not b!33597) (not mapNonEmpty!1846) (not start!4364) (not b_next!1183) tp_is_empty!1537 (not b!33604))
(check-sat b_and!1991 (not b_next!1183))
(get-model)

(declare-fun b!33675 () Bool)

(declare-fun e!21379 () Bool)

(declare-fun call!2685 () Bool)

(assert (=> b!33675 (= e!21379 call!2685)))

(declare-fun b!33676 () Bool)

(declare-fun e!21378 () Bool)

(declare-fun e!21380 () Bool)

(assert (=> b!33676 (= e!21378 e!21380)))

(declare-fun res!20458 () Bool)

(assert (=> b!33676 (=> (not res!20458) (not e!21380))))

(declare-fun e!21377 () Bool)

(assert (=> b!33676 (= res!20458 (not e!21377))))

(declare-fun res!20456 () Bool)

(assert (=> b!33676 (=> (not res!20456) (not e!21377))))

(assert (=> b!33676 (= res!20456 (validKeyInArray!0 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2682 () Bool)

(declare-fun c!3864 () Bool)

(assert (=> bm!2682 (= call!2685 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3864 (Cons!866 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000) Nil!867) Nil!867)))))

(declare-fun b!33677 () Bool)

(assert (=> b!33677 (= e!21379 call!2685)))

(declare-fun b!33679 () Bool)

(declare-fun contains!387 (List!870 (_ BitVec 64)) Bool)

(assert (=> b!33679 (= e!21377 (contains!387 Nil!867 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33678 () Bool)

(assert (=> b!33678 (= e!21380 e!21379)))

(assert (=> b!33678 (= c!3864 (validKeyInArray!0 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5155 () Bool)

(declare-fun res!20457 () Bool)

(assert (=> d!5155 (=> res!20457 e!21378)))

(assert (=> d!5155 (= res!20457 (bvsge #b00000000000000000000000000000000 (size!1187 _keys!1833)))))

(assert (=> d!5155 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!867) e!21378)))

(assert (= (and d!5155 (not res!20457)) b!33676))

(assert (= (and b!33676 res!20456) b!33679))

(assert (= (and b!33676 res!20458) b!33678))

(assert (= (and b!33678 c!3864) b!33677))

(assert (= (and b!33678 (not c!3864)) b!33675))

(assert (= (or b!33677 b!33675) bm!2682))

(declare-fun m!26985 () Bool)

(assert (=> b!33676 m!26985))

(assert (=> b!33676 m!26985))

(declare-fun m!26987 () Bool)

(assert (=> b!33676 m!26987))

(assert (=> bm!2682 m!26985))

(declare-fun m!26989 () Bool)

(assert (=> bm!2682 m!26989))

(assert (=> b!33679 m!26985))

(assert (=> b!33679 m!26985))

(declare-fun m!26991 () Bool)

(assert (=> b!33679 m!26991))

(assert (=> b!33678 m!26985))

(assert (=> b!33678 m!26985))

(assert (=> b!33678 m!26987))

(assert (=> b!33604 d!5155))

(declare-fun d!5157 () Bool)

(assert (=> d!5157 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33600 d!5157))

(declare-fun d!5159 () Bool)

(declare-fun lt!12338 () SeekEntryResult!127)

(assert (=> d!5159 (and ((_ is Found!127) lt!12338) (= (index!2631 lt!12338) lt!12301))))

(assert (=> d!5159 (= lt!12338 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12337 () Unit!757)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2273 (_ BitVec 32)) Unit!757)

(assert (=> d!5159 (= lt!12337 (choose!0 k0!1304 lt!12301 _keys!1833 mask!2294))))

(assert (=> d!5159 (validMask!0 mask!2294)))

(assert (=> d!5159 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12301 _keys!1833 mask!2294) lt!12337)))

(declare-fun bs!1308 () Bool)

(assert (= bs!1308 d!5159))

(assert (=> bs!1308 m!26911))

(declare-fun m!26993 () Bool)

(assert (=> bs!1308 m!26993))

(assert (=> bs!1308 m!26891))

(assert (=> b!33595 d!5159))

(declare-fun d!5161 () Bool)

(declare-fun e!21385 () Bool)

(assert (=> d!5161 e!21385))

(declare-fun res!20461 () Bool)

(assert (=> d!5161 (=> res!20461 e!21385)))

(declare-fun lt!12350 () Bool)

(assert (=> d!5161 (= res!20461 (not lt!12350))))

(declare-fun lt!12347 () Bool)

(assert (=> d!5161 (= lt!12350 lt!12347)))

(declare-fun lt!12348 () Unit!757)

(declare-fun e!21386 () Unit!757)

(assert (=> d!5161 (= lt!12348 e!21386)))

(declare-fun c!3867 () Bool)

(assert (=> d!5161 (= c!3867 lt!12347)))

(declare-fun containsKey!33 (List!869 (_ BitVec 64)) Bool)

(assert (=> d!5161 (= lt!12347 (containsKey!33 (toList!439 lt!12298) (select (arr!1086 _keys!1833) lt!12301)))))

(assert (=> d!5161 (= (contains!385 lt!12298 (select (arr!1086 _keys!1833) lt!12301)) lt!12350)))

(declare-fun b!33686 () Bool)

(declare-fun lt!12349 () Unit!757)

(assert (=> b!33686 (= e!21386 lt!12349)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!30 (List!869 (_ BitVec 64)) Unit!757)

(assert (=> b!33686 (= lt!12349 (lemmaContainsKeyImpliesGetValueByKeyDefined!30 (toList!439 lt!12298) (select (arr!1086 _keys!1833) lt!12301)))))

(declare-datatypes ((Option!75 0))(
  ( (Some!74 (v!1891 V!1875)) (None!73) )
))
(declare-fun isDefined!31 (Option!75) Bool)

(declare-fun getValueByKey!69 (List!869 (_ BitVec 64)) Option!75)

(assert (=> b!33686 (isDefined!31 (getValueByKey!69 (toList!439 lt!12298) (select (arr!1086 _keys!1833) lt!12301)))))

(declare-fun b!33687 () Bool)

(declare-fun Unit!761 () Unit!757)

(assert (=> b!33687 (= e!21386 Unit!761)))

(declare-fun b!33688 () Bool)

(assert (=> b!33688 (= e!21385 (isDefined!31 (getValueByKey!69 (toList!439 lt!12298) (select (arr!1086 _keys!1833) lt!12301))))))

(assert (= (and d!5161 c!3867) b!33686))

(assert (= (and d!5161 (not c!3867)) b!33687))

(assert (= (and d!5161 (not res!20461)) b!33688))

(assert (=> d!5161 m!26909))

(declare-fun m!26995 () Bool)

(assert (=> d!5161 m!26995))

(assert (=> b!33686 m!26909))

(declare-fun m!26997 () Bool)

(assert (=> b!33686 m!26997))

(assert (=> b!33686 m!26909))

(declare-fun m!26999 () Bool)

(assert (=> b!33686 m!26999))

(assert (=> b!33686 m!26999))

(declare-fun m!27001 () Bool)

(assert (=> b!33686 m!27001))

(assert (=> b!33688 m!26909))

(assert (=> b!33688 m!26999))

(assert (=> b!33688 m!26999))

(assert (=> b!33688 m!27001))

(assert (=> b!33595 d!5161))

(declare-fun d!5163 () Bool)

(declare-fun lt!12359 () SeekEntryResult!127)

(assert (=> d!5163 (and (or ((_ is MissingVacant!127) lt!12359) (not ((_ is Found!127) lt!12359)) (and (bvsge (index!2631 lt!12359) #b00000000000000000000000000000000) (bvslt (index!2631 lt!12359) (size!1187 _keys!1833)))) (not ((_ is MissingVacant!127) lt!12359)) (or (not ((_ is Found!127) lt!12359)) (= (select (arr!1086 _keys!1833) (index!2631 lt!12359)) k0!1304)))))

(declare-fun e!21393 () SeekEntryResult!127)

(assert (=> d!5163 (= lt!12359 e!21393)))

(declare-fun c!3874 () Bool)

(declare-fun lt!12360 () SeekEntryResult!127)

(assert (=> d!5163 (= c!3874 (and ((_ is Intermediate!127) lt!12360) (undefined!939 lt!12360)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2273 (_ BitVec 32)) SeekEntryResult!127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5163 (= lt!12360 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5163 (validMask!0 mask!2294)))

(assert (=> d!5163 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12359)))

(declare-fun b!33701 () Bool)

(declare-fun c!3876 () Bool)

(declare-fun lt!12362 () (_ BitVec 64))

(assert (=> b!33701 (= c!3876 (= lt!12362 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21395 () SeekEntryResult!127)

(declare-fun e!21394 () SeekEntryResult!127)

(assert (=> b!33701 (= e!21395 e!21394)))

(declare-fun b!33702 () Bool)

(declare-fun lt!12361 () SeekEntryResult!127)

(assert (=> b!33702 (= e!21394 (ite ((_ is MissingVacant!127) lt!12361) (MissingZero!127 (index!2633 lt!12361)) lt!12361))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2273 (_ BitVec 32)) SeekEntryResult!127)

(assert (=> b!33702 (= lt!12361 (seekKeyOrZeroReturnVacant!0 (x!6837 lt!12360) (index!2632 lt!12360) (index!2632 lt!12360) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!33703 () Bool)

(assert (=> b!33703 (= e!21394 (MissingZero!127 (index!2632 lt!12360)))))

(declare-fun b!33704 () Bool)

(assert (=> b!33704 (= e!21395 (Found!127 (index!2632 lt!12360)))))

(declare-fun b!33705 () Bool)

(assert (=> b!33705 (= e!21393 e!21395)))

(assert (=> b!33705 (= lt!12362 (select (arr!1086 _keys!1833) (index!2632 lt!12360)))))

(declare-fun c!3875 () Bool)

(assert (=> b!33705 (= c!3875 (= lt!12362 k0!1304))))

(declare-fun b!33706 () Bool)

(assert (=> b!33706 (= e!21393 Undefined!127)))

(assert (= (and d!5163 c!3874) b!33706))

(assert (= (and d!5163 (not c!3874)) b!33705))

(assert (= (and b!33705 c!3875) b!33704))

(assert (= (and b!33705 (not c!3875)) b!33701))

(assert (= (and b!33701 c!3876) b!33703))

(assert (= (and b!33701 (not c!3876)) b!33702))

(declare-fun m!27003 () Bool)

(assert (=> d!5163 m!27003))

(declare-fun m!27005 () Bool)

(assert (=> d!5163 m!27005))

(assert (=> d!5163 m!27005))

(declare-fun m!27007 () Bool)

(assert (=> d!5163 m!27007))

(assert (=> d!5163 m!26891))

(declare-fun m!27009 () Bool)

(assert (=> b!33702 m!27009))

(declare-fun m!27011 () Bool)

(assert (=> b!33705 m!27011))

(assert (=> b!33595 d!5163))

(declare-fun d!5165 () Bool)

(declare-fun lt!12365 () (_ BitVec 32))

(assert (=> d!5165 (and (or (bvslt lt!12365 #b00000000000000000000000000000000) (bvsge lt!12365 (size!1187 _keys!1833)) (and (bvsge lt!12365 #b00000000000000000000000000000000) (bvslt lt!12365 (size!1187 _keys!1833)))) (bvsge lt!12365 #b00000000000000000000000000000000) (bvslt lt!12365 (size!1187 _keys!1833)) (= (select (arr!1086 _keys!1833) lt!12365) k0!1304))))

(declare-fun e!21398 () (_ BitVec 32))

(assert (=> d!5165 (= lt!12365 e!21398)))

(declare-fun c!3879 () Bool)

(assert (=> d!5165 (= c!3879 (= (select (arr!1086 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1187 _keys!1833)) (bvslt (size!1187 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5165 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12365)))

(declare-fun b!33711 () Bool)

(assert (=> b!33711 (= e!21398 #b00000000000000000000000000000000)))

(declare-fun b!33712 () Bool)

(assert (=> b!33712 (= e!21398 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5165 c!3879) b!33711))

(assert (= (and d!5165 (not c!3879)) b!33712))

(declare-fun m!27013 () Bool)

(assert (=> d!5165 m!27013))

(assert (=> d!5165 m!26985))

(declare-fun m!27015 () Bool)

(assert (=> b!33712 m!27015))

(assert (=> b!33595 d!5165))

(declare-fun d!5167 () Bool)

(declare-fun e!21401 () Bool)

(assert (=> d!5167 e!21401))

(declare-fun res!20464 () Bool)

(assert (=> d!5167 (=> (not res!20464) (not e!21401))))

(assert (=> d!5167 (= res!20464 (and (bvsge lt!12301 #b00000000000000000000000000000000) (bvslt lt!12301 (size!1187 _keys!1833))))))

(declare-fun lt!12368 () Unit!757)

(declare-fun choose!219 (array!2273 array!2275 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) Unit!757)

(assert (=> d!5167 (= lt!12368 (choose!219 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12301 defaultEntry!1504))))

(assert (=> d!5167 (validMask!0 mask!2294)))

(assert (=> d!5167 (= (lemmaValidKeyInArrayIsInListMap!61 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12301 defaultEntry!1504) lt!12368)))

(declare-fun b!33715 () Bool)

(assert (=> b!33715 (= e!21401 (contains!385 (getCurrentListMap!262 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1086 _keys!1833) lt!12301)))))

(assert (= (and d!5167 res!20464) b!33715))

(declare-fun m!27017 () Bool)

(assert (=> d!5167 m!27017))

(assert (=> d!5167 m!26891))

(assert (=> b!33715 m!26903))

(assert (=> b!33715 m!26909))

(assert (=> b!33715 m!26903))

(assert (=> b!33715 m!26909))

(declare-fun m!27019 () Bool)

(assert (=> b!33715 m!27019))

(assert (=> b!33595 d!5167))

(declare-fun d!5169 () Bool)

(declare-fun e!21402 () Bool)

(assert (=> d!5169 e!21402))

(declare-fun res!20465 () Bool)

(assert (=> d!5169 (=> res!20465 e!21402)))

(declare-fun lt!12372 () Bool)

(assert (=> d!5169 (= res!20465 (not lt!12372))))

(declare-fun lt!12369 () Bool)

(assert (=> d!5169 (= lt!12372 lt!12369)))

(declare-fun lt!12370 () Unit!757)

(declare-fun e!21403 () Unit!757)

(assert (=> d!5169 (= lt!12370 e!21403)))

(declare-fun c!3880 () Bool)

(assert (=> d!5169 (= c!3880 lt!12369)))

(assert (=> d!5169 (= lt!12369 (containsKey!33 (toList!439 lt!12298) k0!1304))))

(assert (=> d!5169 (= (contains!385 lt!12298 k0!1304) lt!12372)))

(declare-fun b!33716 () Bool)

(declare-fun lt!12371 () Unit!757)

(assert (=> b!33716 (= e!21403 lt!12371)))

(assert (=> b!33716 (= lt!12371 (lemmaContainsKeyImpliesGetValueByKeyDefined!30 (toList!439 lt!12298) k0!1304))))

(assert (=> b!33716 (isDefined!31 (getValueByKey!69 (toList!439 lt!12298) k0!1304))))

(declare-fun b!33717 () Bool)

(declare-fun Unit!762 () Unit!757)

(assert (=> b!33717 (= e!21403 Unit!762)))

(declare-fun b!33718 () Bool)

(assert (=> b!33718 (= e!21402 (isDefined!31 (getValueByKey!69 (toList!439 lt!12298) k0!1304)))))

(assert (= (and d!5169 c!3880) b!33716))

(assert (= (and d!5169 (not c!3880)) b!33717))

(assert (= (and d!5169 (not res!20465)) b!33718))

(declare-fun m!27021 () Bool)

(assert (=> d!5169 m!27021))

(declare-fun m!27023 () Bool)

(assert (=> b!33716 m!27023))

(declare-fun m!27025 () Bool)

(assert (=> b!33716 m!27025))

(assert (=> b!33716 m!27025))

(declare-fun m!27027 () Bool)

(assert (=> b!33716 m!27027))

(assert (=> b!33718 m!27025))

(assert (=> b!33718 m!27025))

(assert (=> b!33718 m!27027))

(assert (=> b!33599 d!5169))

(declare-fun b!33761 () Bool)

(declare-fun res!20491 () Bool)

(declare-fun e!21432 () Bool)

(assert (=> b!33761 (=> (not res!20491) (not e!21432))))

(declare-fun e!21442 () Bool)

(assert (=> b!33761 (= res!20491 e!21442)))

(declare-fun c!3893 () Bool)

(assert (=> b!33761 (= c!3893 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!33762 () Bool)

(declare-fun e!21435 () Bool)

(declare-fun lt!12419 () ListLongMap!847)

(declare-fun apply!37 (ListLongMap!847 (_ BitVec 64)) V!1875)

(assert (=> b!33762 (= e!21435 (= (apply!37 lt!12419 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!33763 () Bool)

(declare-fun e!21431 () Bool)

(declare-fun e!21440 () Bool)

(assert (=> b!33763 (= e!21431 e!21440)))

(declare-fun res!20489 () Bool)

(assert (=> b!33763 (=> (not res!20489) (not e!21440))))

(assert (=> b!33763 (= res!20489 (contains!385 lt!12419 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1187 _keys!1833)))))

(declare-fun b!33764 () Bool)

(declare-fun e!21437 () Bool)

(declare-fun e!21441 () Bool)

(assert (=> b!33764 (= e!21437 e!21441)))

(declare-fun res!20486 () Bool)

(declare-fun call!2704 () Bool)

(assert (=> b!33764 (= res!20486 call!2704)))

(assert (=> b!33764 (=> (not res!20486) (not e!21441))))

(declare-fun bm!2697 () Bool)

(declare-fun call!2703 () Bool)

(assert (=> bm!2697 (= call!2703 (contains!385 lt!12419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2698 () Bool)

(declare-fun call!2705 () ListLongMap!847)

(declare-fun call!2702 () ListLongMap!847)

(assert (=> bm!2698 (= call!2705 call!2702)))

(declare-fun b!33765 () Bool)

(declare-fun e!21436 () Bool)

(assert (=> b!33765 (= e!21436 (validKeyInArray!0 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33766 () Bool)

(declare-fun e!21439 () ListLongMap!847)

(declare-fun call!2706 () ListLongMap!847)

(assert (=> b!33766 (= e!21439 call!2706)))

(declare-fun d!5171 () Bool)

(assert (=> d!5171 e!21432))

(declare-fun res!20488 () Bool)

(assert (=> d!5171 (=> (not res!20488) (not e!21432))))

(assert (=> d!5171 (= res!20488 (or (bvsge #b00000000000000000000000000000000 (size!1187 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1187 _keys!1833)))))))

(declare-fun lt!12434 () ListLongMap!847)

(assert (=> d!5171 (= lt!12419 lt!12434)))

(declare-fun lt!12428 () Unit!757)

(declare-fun e!21433 () Unit!757)

(assert (=> d!5171 (= lt!12428 e!21433)))

(declare-fun c!3897 () Bool)

(assert (=> d!5171 (= c!3897 e!21436)))

(declare-fun res!20490 () Bool)

(assert (=> d!5171 (=> (not res!20490) (not e!21436))))

(assert (=> d!5171 (= res!20490 (bvslt #b00000000000000000000000000000000 (size!1187 _keys!1833)))))

(declare-fun e!21438 () ListLongMap!847)

(assert (=> d!5171 (= lt!12434 e!21438)))

(declare-fun c!3894 () Bool)

(assert (=> d!5171 (= c!3894 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5171 (validMask!0 mask!2294)))

(assert (=> d!5171 (= (getCurrentListMap!262 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12419)))

(declare-fun b!33767 () Bool)

(assert (=> b!33767 (= e!21442 (not call!2703))))

(declare-fun bm!2699 () Bool)

(assert (=> bm!2699 (= call!2704 (contains!385 lt!12419 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!33768 () Bool)

(declare-fun e!21430 () ListLongMap!847)

(assert (=> b!33768 (= e!21430 call!2706)))

(declare-fun b!33769 () Bool)

(assert (=> b!33769 (= e!21437 (not call!2704))))

(declare-fun bm!2700 () Bool)

(declare-fun call!2701 () ListLongMap!847)

(assert (=> bm!2700 (= call!2702 call!2701)))

(declare-fun bm!2701 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!24 (array!2273 array!2275 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) ListLongMap!847)

(assert (=> bm!2701 (= call!2701 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33770 () Bool)

(declare-fun e!21434 () Bool)

(assert (=> b!33770 (= e!21434 (validKeyInArray!0 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33771 () Bool)

(assert (=> b!33771 (= e!21432 e!21437)))

(declare-fun c!3898 () Bool)

(assert (=> b!33771 (= c!3898 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!3896 () Bool)

(declare-fun bm!2702 () Bool)

(declare-fun call!2700 () ListLongMap!847)

(declare-fun +!54 (ListLongMap!847 tuple2!1276) ListLongMap!847)

(assert (=> bm!2702 (= call!2700 (+!54 (ite c!3894 call!2701 (ite c!3896 call!2702 call!2705)) (ite (or c!3894 c!3896) (tuple2!1277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!33772 () Bool)

(assert (=> b!33772 (= e!21439 call!2705)))

(declare-fun b!33773 () Bool)

(assert (=> b!33773 (= e!21441 (= (apply!37 lt!12419 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!33774 () Bool)

(declare-fun Unit!763 () Unit!757)

(assert (=> b!33774 (= e!21433 Unit!763)))

(declare-fun b!33775 () Bool)

(assert (=> b!33775 (= e!21442 e!21435)))

(declare-fun res!20484 () Bool)

(assert (=> b!33775 (= res!20484 call!2703)))

(assert (=> b!33775 (=> (not res!20484) (not e!21435))))

(declare-fun b!33776 () Bool)

(declare-fun res!20487 () Bool)

(assert (=> b!33776 (=> (not res!20487) (not e!21432))))

(assert (=> b!33776 (= res!20487 e!21431)))

(declare-fun res!20492 () Bool)

(assert (=> b!33776 (=> res!20492 e!21431)))

(assert (=> b!33776 (= res!20492 (not e!21434))))

(declare-fun res!20485 () Bool)

(assert (=> b!33776 (=> (not res!20485) (not e!21434))))

(assert (=> b!33776 (= res!20485 (bvslt #b00000000000000000000000000000000 (size!1187 _keys!1833)))))

(declare-fun b!33777 () Bool)

(assert (=> b!33777 (= e!21438 e!21430)))

(assert (=> b!33777 (= c!3896 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33778 () Bool)

(declare-fun get!574 (ValueCell!569 V!1875) V!1875)

(declare-fun dynLambda!150 (Int (_ BitVec 64)) V!1875)

(assert (=> b!33778 (= e!21440 (= (apply!37 lt!12419 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000)) (get!574 (select (arr!1087 _values!1501) #b00000000000000000000000000000000) (dynLambda!150 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1188 _values!1501)))))

(assert (=> b!33778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1187 _keys!1833)))))

(declare-fun bm!2703 () Bool)

(assert (=> bm!2703 (= call!2706 call!2700)))

(declare-fun b!33779 () Bool)

(declare-fun lt!12425 () Unit!757)

(assert (=> b!33779 (= e!21433 lt!12425)))

(declare-fun lt!12417 () ListLongMap!847)

(assert (=> b!33779 (= lt!12417 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12423 () (_ BitVec 64))

(assert (=> b!33779 (= lt!12423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12429 () (_ BitVec 64))

(assert (=> b!33779 (= lt!12429 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12436 () Unit!757)

(declare-fun addStillContains!22 (ListLongMap!847 (_ BitVec 64) V!1875 (_ BitVec 64)) Unit!757)

(assert (=> b!33779 (= lt!12436 (addStillContains!22 lt!12417 lt!12423 zeroValue!1443 lt!12429))))

(assert (=> b!33779 (contains!385 (+!54 lt!12417 (tuple2!1277 lt!12423 zeroValue!1443)) lt!12429)))

(declare-fun lt!12426 () Unit!757)

(assert (=> b!33779 (= lt!12426 lt!12436)))

(declare-fun lt!12437 () ListLongMap!847)

(assert (=> b!33779 (= lt!12437 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12438 () (_ BitVec 64))

(assert (=> b!33779 (= lt!12438 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12430 () (_ BitVec 64))

(assert (=> b!33779 (= lt!12430 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12432 () Unit!757)

(declare-fun addApplyDifferent!22 (ListLongMap!847 (_ BitVec 64) V!1875 (_ BitVec 64)) Unit!757)

(assert (=> b!33779 (= lt!12432 (addApplyDifferent!22 lt!12437 lt!12438 minValue!1443 lt!12430))))

(assert (=> b!33779 (= (apply!37 (+!54 lt!12437 (tuple2!1277 lt!12438 minValue!1443)) lt!12430) (apply!37 lt!12437 lt!12430))))

(declare-fun lt!12424 () Unit!757)

(assert (=> b!33779 (= lt!12424 lt!12432)))

(declare-fun lt!12427 () ListLongMap!847)

(assert (=> b!33779 (= lt!12427 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12422 () (_ BitVec 64))

(assert (=> b!33779 (= lt!12422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12435 () (_ BitVec 64))

(assert (=> b!33779 (= lt!12435 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12433 () Unit!757)

(assert (=> b!33779 (= lt!12433 (addApplyDifferent!22 lt!12427 lt!12422 zeroValue!1443 lt!12435))))

(assert (=> b!33779 (= (apply!37 (+!54 lt!12427 (tuple2!1277 lt!12422 zeroValue!1443)) lt!12435) (apply!37 lt!12427 lt!12435))))

(declare-fun lt!12420 () Unit!757)

(assert (=> b!33779 (= lt!12420 lt!12433)))

(declare-fun lt!12431 () ListLongMap!847)

(assert (=> b!33779 (= lt!12431 (getCurrentListMapNoExtraKeys!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12418 () (_ BitVec 64))

(assert (=> b!33779 (= lt!12418 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12421 () (_ BitVec 64))

(assert (=> b!33779 (= lt!12421 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33779 (= lt!12425 (addApplyDifferent!22 lt!12431 lt!12418 minValue!1443 lt!12421))))

(assert (=> b!33779 (= (apply!37 (+!54 lt!12431 (tuple2!1277 lt!12418 minValue!1443)) lt!12421) (apply!37 lt!12431 lt!12421))))

(declare-fun b!33780 () Bool)

(assert (=> b!33780 (= e!21438 (+!54 call!2700 (tuple2!1277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!33781 () Bool)

(declare-fun c!3895 () Bool)

(assert (=> b!33781 (= c!3895 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!33781 (= e!21430 e!21439)))

(assert (= (and d!5171 c!3894) b!33780))

(assert (= (and d!5171 (not c!3894)) b!33777))

(assert (= (and b!33777 c!3896) b!33768))

(assert (= (and b!33777 (not c!3896)) b!33781))

(assert (= (and b!33781 c!3895) b!33766))

(assert (= (and b!33781 (not c!3895)) b!33772))

(assert (= (or b!33766 b!33772) bm!2698))

(assert (= (or b!33768 bm!2698) bm!2700))

(assert (= (or b!33768 b!33766) bm!2703))

(assert (= (or b!33780 bm!2700) bm!2701))

(assert (= (or b!33780 bm!2703) bm!2702))

(assert (= (and d!5171 res!20490) b!33765))

(assert (= (and d!5171 c!3897) b!33779))

(assert (= (and d!5171 (not c!3897)) b!33774))

(assert (= (and d!5171 res!20488) b!33776))

(assert (= (and b!33776 res!20485) b!33770))

(assert (= (and b!33776 (not res!20492)) b!33763))

(assert (= (and b!33763 res!20489) b!33778))

(assert (= (and b!33776 res!20487) b!33761))

(assert (= (and b!33761 c!3893) b!33775))

(assert (= (and b!33761 (not c!3893)) b!33767))

(assert (= (and b!33775 res!20484) b!33762))

(assert (= (or b!33775 b!33767) bm!2697))

(assert (= (and b!33761 res!20491) b!33771))

(assert (= (and b!33771 c!3898) b!33764))

(assert (= (and b!33771 (not c!3898)) b!33769))

(assert (= (and b!33764 res!20486) b!33773))

(assert (= (or b!33764 b!33769) bm!2699))

(declare-fun b_lambda!1695 () Bool)

(assert (=> (not b_lambda!1695) (not b!33778)))

(declare-fun t!3570 () Bool)

(declare-fun tb!683 () Bool)

(assert (=> (and start!4364 (= defaultEntry!1504 defaultEntry!1504) t!3570) tb!683))

(declare-fun result!1171 () Bool)

(assert (=> tb!683 (= result!1171 tp_is_empty!1537)))

(assert (=> b!33778 t!3570))

(declare-fun b_and!1997 () Bool)

(assert (= b_and!1991 (and (=> t!3570 result!1171) b_and!1997)))

(declare-fun m!27029 () Bool)

(assert (=> bm!2699 m!27029))

(assert (=> d!5171 m!26891))

(assert (=> b!33763 m!26985))

(assert (=> b!33763 m!26985))

(declare-fun m!27031 () Bool)

(assert (=> b!33763 m!27031))

(declare-fun m!27033 () Bool)

(assert (=> bm!2697 m!27033))

(assert (=> b!33778 m!26985))

(declare-fun m!27035 () Bool)

(assert (=> b!33778 m!27035))

(declare-fun m!27037 () Bool)

(assert (=> b!33778 m!27037))

(assert (=> b!33778 m!26985))

(declare-fun m!27039 () Bool)

(assert (=> b!33778 m!27039))

(assert (=> b!33778 m!27037))

(assert (=> b!33778 m!27035))

(declare-fun m!27041 () Bool)

(assert (=> b!33778 m!27041))

(declare-fun m!27043 () Bool)

(assert (=> bm!2701 m!27043))

(assert (=> b!33770 m!26985))

(assert (=> b!33770 m!26985))

(assert (=> b!33770 m!26987))

(declare-fun m!27045 () Bool)

(assert (=> b!33779 m!27045))

(assert (=> b!33779 m!26985))

(declare-fun m!27047 () Bool)

(assert (=> b!33779 m!27047))

(declare-fun m!27049 () Bool)

(assert (=> b!33779 m!27049))

(assert (=> b!33779 m!27047))

(declare-fun m!27051 () Bool)

(assert (=> b!33779 m!27051))

(declare-fun m!27053 () Bool)

(assert (=> b!33779 m!27053))

(declare-fun m!27055 () Bool)

(assert (=> b!33779 m!27055))

(assert (=> b!33779 m!27055))

(declare-fun m!27057 () Bool)

(assert (=> b!33779 m!27057))

(declare-fun m!27059 () Bool)

(assert (=> b!33779 m!27059))

(declare-fun m!27061 () Bool)

(assert (=> b!33779 m!27061))

(assert (=> b!33779 m!27043))

(declare-fun m!27063 () Bool)

(assert (=> b!33779 m!27063))

(assert (=> b!33779 m!27059))

(declare-fun m!27065 () Bool)

(assert (=> b!33779 m!27065))

(declare-fun m!27067 () Bool)

(assert (=> b!33779 m!27067))

(assert (=> b!33779 m!27051))

(declare-fun m!27069 () Bool)

(assert (=> b!33779 m!27069))

(declare-fun m!27071 () Bool)

(assert (=> b!33779 m!27071))

(declare-fun m!27073 () Bool)

(assert (=> b!33779 m!27073))

(declare-fun m!27075 () Bool)

(assert (=> bm!2702 m!27075))

(declare-fun m!27077 () Bool)

(assert (=> b!33773 m!27077))

(declare-fun m!27079 () Bool)

(assert (=> b!33780 m!27079))

(declare-fun m!27081 () Bool)

(assert (=> b!33762 m!27081))

(assert (=> b!33765 m!26985))

(assert (=> b!33765 m!26985))

(assert (=> b!33765 m!26987))

(assert (=> b!33599 d!5171))

(declare-fun d!5173 () Bool)

(assert (=> d!5173 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4364 d!5173))

(declare-fun d!5175 () Bool)

(assert (=> d!5175 (= (array_inv!747 _values!1501) (bvsge (size!1188 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4364 d!5175))

(declare-fun d!5177 () Bool)

(assert (=> d!5177 (= (array_inv!748 _keys!1833) (bvsge (size!1187 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4364 d!5177))

(declare-fun b!33792 () Bool)

(declare-fun e!21449 () Bool)

(declare-fun e!21451 () Bool)

(assert (=> b!33792 (= e!21449 e!21451)))

(declare-fun lt!12447 () (_ BitVec 64))

(assert (=> b!33792 (= lt!12447 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12446 () Unit!757)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2273 (_ BitVec 64) (_ BitVec 32)) Unit!757)

(assert (=> b!33792 (= lt!12446 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12447 #b00000000000000000000000000000000))))

(assert (=> b!33792 (arrayContainsKey!0 _keys!1833 lt!12447 #b00000000000000000000000000000000)))

(declare-fun lt!12445 () Unit!757)

(assert (=> b!33792 (= lt!12445 lt!12446)))

(declare-fun res!20497 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2273 (_ BitVec 32)) SeekEntryResult!127)

(assert (=> b!33792 (= res!20497 (= (seekEntryOrOpen!0 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!127 #b00000000000000000000000000000000)))))

(assert (=> b!33792 (=> (not res!20497) (not e!21451))))

(declare-fun b!33793 () Bool)

(declare-fun call!2709 () Bool)

(assert (=> b!33793 (= e!21451 call!2709)))

(declare-fun b!33794 () Bool)

(assert (=> b!33794 (= e!21449 call!2709)))

(declare-fun bm!2706 () Bool)

(assert (=> bm!2706 (= call!2709 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!33795 () Bool)

(declare-fun e!21450 () Bool)

(assert (=> b!33795 (= e!21450 e!21449)))

(declare-fun c!3901 () Bool)

(assert (=> b!33795 (= c!3901 (validKeyInArray!0 (select (arr!1086 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5179 () Bool)

(declare-fun res!20498 () Bool)

(assert (=> d!5179 (=> res!20498 e!21450)))

(assert (=> d!5179 (= res!20498 (bvsge #b00000000000000000000000000000000 (size!1187 _keys!1833)))))

(assert (=> d!5179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21450)))

(assert (= (and d!5179 (not res!20498)) b!33795))

(assert (= (and b!33795 c!3901) b!33792))

(assert (= (and b!33795 (not c!3901)) b!33794))

(assert (= (and b!33792 res!20497) b!33793))

(assert (= (or b!33793 b!33794) bm!2706))

(assert (=> b!33792 m!26985))

(declare-fun m!27083 () Bool)

(assert (=> b!33792 m!27083))

(declare-fun m!27085 () Bool)

(assert (=> b!33792 m!27085))

(assert (=> b!33792 m!26985))

(declare-fun m!27087 () Bool)

(assert (=> b!33792 m!27087))

(declare-fun m!27089 () Bool)

(assert (=> bm!2706 m!27089))

(assert (=> b!33795 m!26985))

(assert (=> b!33795 m!26985))

(assert (=> b!33795 m!26987))

(assert (=> b!33597 d!5179))

(declare-fun d!5181 () Bool)

(declare-fun res!20503 () Bool)

(declare-fun e!21456 () Bool)

(assert (=> d!5181 (=> res!20503 e!21456)))

(assert (=> d!5181 (= res!20503 (= (select (arr!1086 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5181 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21456)))

(declare-fun b!33800 () Bool)

(declare-fun e!21457 () Bool)

(assert (=> b!33800 (= e!21456 e!21457)))

(declare-fun res!20504 () Bool)

(assert (=> b!33800 (=> (not res!20504) (not e!21457))))

(assert (=> b!33800 (= res!20504 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1187 _keys!1833)))))

(declare-fun b!33801 () Bool)

(assert (=> b!33801 (= e!21457 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5181 (not res!20503)) b!33800))

(assert (= (and b!33800 res!20504) b!33801))

(assert (=> d!5181 m!26985))

(declare-fun m!27091 () Bool)

(assert (=> b!33801 m!27091))

(assert (=> b!33596 d!5181))

(declare-fun mapIsEmpty!1855 () Bool)

(declare-fun mapRes!1855 () Bool)

(assert (=> mapIsEmpty!1855 mapRes!1855))

(declare-fun mapNonEmpty!1855 () Bool)

(declare-fun tp!4996 () Bool)

(declare-fun e!21463 () Bool)

(assert (=> mapNonEmpty!1855 (= mapRes!1855 (and tp!4996 e!21463))))

(declare-fun mapValue!1855 () ValueCell!569)

(declare-fun mapRest!1855 () (Array (_ BitVec 32) ValueCell!569))

(declare-fun mapKey!1855 () (_ BitVec 32))

(assert (=> mapNonEmpty!1855 (= mapRest!1846 (store mapRest!1855 mapKey!1855 mapValue!1855))))

(declare-fun b!33808 () Bool)

(assert (=> b!33808 (= e!21463 tp_is_empty!1537)))

(declare-fun b!33809 () Bool)

(declare-fun e!21462 () Bool)

(assert (=> b!33809 (= e!21462 tp_is_empty!1537)))

(declare-fun condMapEmpty!1855 () Bool)

(declare-fun mapDefault!1855 () ValueCell!569)

(assert (=> mapNonEmpty!1846 (= condMapEmpty!1855 (= mapRest!1846 ((as const (Array (_ BitVec 32) ValueCell!569)) mapDefault!1855)))))

(assert (=> mapNonEmpty!1846 (= tp!4980 (and e!21462 mapRes!1855))))

(assert (= (and mapNonEmpty!1846 condMapEmpty!1855) mapIsEmpty!1855))

(assert (= (and mapNonEmpty!1846 (not condMapEmpty!1855)) mapNonEmpty!1855))

(assert (= (and mapNonEmpty!1855 ((_ is ValueCellFull!569) mapValue!1855)) b!33808))

(assert (= (and mapNonEmpty!1846 ((_ is ValueCellFull!569) mapDefault!1855)) b!33809))

(declare-fun m!27093 () Bool)

(assert (=> mapNonEmpty!1855 m!27093))

(declare-fun b_lambda!1697 () Bool)

(assert (= b_lambda!1695 (or (and start!4364 b_free!1183) b_lambda!1697)))

(check-sat (not b!33718) (not b!33765) (not b!33702) (not d!5171) (not bm!2697) (not b!33773) (not d!5169) (not d!5161) (not bm!2702) (not b!33778) (not b!33712) (not b_next!1183) (not d!5163) (not b!33716) tp_is_empty!1537 b_and!1997 (not d!5159) (not b!33792) (not b!33715) (not b!33678) (not bm!2701) (not b!33679) (not b!33763) (not b!33801) (not b!33780) (not b!33795) (not b!33770) (not bm!2699) (not b!33762) (not b!33688) (not mapNonEmpty!1855) (not bm!2682) (not b_lambda!1697) (not bm!2706) (not d!5167) (not b!33779) (not b!33676) (not b!33686))
(check-sat b_and!1997 (not b_next!1183))
