; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104718 () Bool)

(assert start!104718)

(declare-fun b_free!26535 () Bool)

(declare-fun b_next!26535 () Bool)

(assert (=> start!104718 (= b_free!26535 (not b_next!26535))))

(declare-fun tp!93091 () Bool)

(declare-fun b_and!44299 () Bool)

(assert (=> start!104718 (= tp!93091 b_and!44299)))

(declare-fun b!1248434 () Bool)

(declare-fun res!832906 () Bool)

(declare-fun e!708422 () Bool)

(assert (=> b!1248434 (=> (not res!832906) (not e!708422))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80564 0))(
  ( (array!80565 (arr!38850 (Array (_ BitVec 32) (_ BitVec 64))) (size!39386 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80564)

(declare-datatypes ((V!47281 0))(
  ( (V!47282 (val!15781 Int)) )
))
(declare-datatypes ((ValueCell!14955 0))(
  ( (ValueCellFull!14955 (v!18477 V!47281)) (EmptyCell!14955) )
))
(declare-datatypes ((array!80566 0))(
  ( (array!80567 (arr!38851 (Array (_ BitVec 32) ValueCell!14955)) (size!39387 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80566)

(assert (=> b!1248434 (= res!832906 (and (= (size!39387 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39386 _keys!1118) (size!39387 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48913 () Bool)

(declare-fun mapRes!48913 () Bool)

(declare-fun tp!93092 () Bool)

(declare-fun e!708420 () Bool)

(assert (=> mapNonEmpty!48913 (= mapRes!48913 (and tp!93092 e!708420))))

(declare-fun mapValue!48913 () ValueCell!14955)

(declare-fun mapRest!48913 () (Array (_ BitVec 32) ValueCell!14955))

(declare-fun mapKey!48913 () (_ BitVec 32))

(assert (=> mapNonEmpty!48913 (= (arr!38851 _values!914) (store mapRest!48913 mapKey!48913 mapValue!48913))))

(declare-fun b!1248435 () Bool)

(declare-fun res!832908 () Bool)

(assert (=> b!1248435 (=> (not res!832908) (not e!708422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80564 (_ BitVec 32)) Bool)

(assert (=> b!1248435 (= res!832908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48913 () Bool)

(assert (=> mapIsEmpty!48913 mapRes!48913))

(declare-fun res!832905 () Bool)

(assert (=> start!104718 (=> (not res!832905) (not e!708422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104718 (= res!832905 (validMask!0 mask!1466))))

(assert (=> start!104718 e!708422))

(assert (=> start!104718 true))

(assert (=> start!104718 tp!93091))

(declare-fun tp_is_empty!31437 () Bool)

(assert (=> start!104718 tp_is_empty!31437))

(declare-fun array_inv!29651 (array!80564) Bool)

(assert (=> start!104718 (array_inv!29651 _keys!1118)))

(declare-fun e!708421 () Bool)

(declare-fun array_inv!29652 (array!80566) Bool)

(assert (=> start!104718 (and (array_inv!29652 _values!914) e!708421)))

(declare-fun b!1248436 () Bool)

(assert (=> b!1248436 (= e!708422 (bvsgt #b00000000000000000000000000000000 (size!39386 _keys!1118)))))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20326 0))(
  ( (tuple2!20327 (_1!10174 (_ BitVec 64)) (_2!10174 V!47281)) )
))
(declare-datatypes ((List!27573 0))(
  ( (Nil!27570) (Cons!27569 (h!28778 tuple2!20326) (t!41042 List!27573)) )
))
(declare-datatypes ((ListLongMap!18199 0))(
  ( (ListLongMap!18200 (toList!9115 List!27573)) )
))
(declare-fun lt!563407 () ListLongMap!18199)

(declare-fun zeroValue!871 () V!47281)

(declare-fun minValueBefore!43 () V!47281)

(declare-fun getCurrentListMapNoExtraKeys!5522 (array!80564 array!80566 (_ BitVec 32) (_ BitVec 32) V!47281 V!47281 (_ BitVec 32) Int) ListLongMap!18199)

(assert (=> b!1248436 (= lt!563407 (getCurrentListMapNoExtraKeys!5522 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248437 () Bool)

(declare-fun e!708423 () Bool)

(assert (=> b!1248437 (= e!708421 (and e!708423 mapRes!48913))))

(declare-fun condMapEmpty!48913 () Bool)

(declare-fun mapDefault!48913 () ValueCell!14955)

(assert (=> b!1248437 (= condMapEmpty!48913 (= (arr!38851 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14955)) mapDefault!48913)))))

(declare-fun b!1248438 () Bool)

(assert (=> b!1248438 (= e!708423 tp_is_empty!31437)))

(declare-fun b!1248439 () Bool)

(assert (=> b!1248439 (= e!708420 tp_is_empty!31437)))

(declare-fun b!1248440 () Bool)

(declare-fun res!832907 () Bool)

(assert (=> b!1248440 (=> (not res!832907) (not e!708422))))

(declare-datatypes ((List!27574 0))(
  ( (Nil!27571) (Cons!27570 (h!28779 (_ BitVec 64)) (t!41043 List!27574)) )
))
(declare-fun arrayNoDuplicates!0 (array!80564 (_ BitVec 32) List!27574) Bool)

(assert (=> b!1248440 (= res!832907 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27571))))

(assert (= (and start!104718 res!832905) b!1248434))

(assert (= (and b!1248434 res!832906) b!1248435))

(assert (= (and b!1248435 res!832908) b!1248440))

(assert (= (and b!1248440 res!832907) b!1248436))

(assert (= (and b!1248437 condMapEmpty!48913) mapIsEmpty!48913))

(assert (= (and b!1248437 (not condMapEmpty!48913)) mapNonEmpty!48913))

(get-info :version)

(assert (= (and mapNonEmpty!48913 ((_ is ValueCellFull!14955) mapValue!48913)) b!1248439))

(assert (= (and b!1248437 ((_ is ValueCellFull!14955) mapDefault!48913)) b!1248438))

(assert (= start!104718 b!1248437))

(declare-fun m!1149599 () Bool)

(assert (=> b!1248440 m!1149599))

(declare-fun m!1149601 () Bool)

(assert (=> b!1248435 m!1149601))

(declare-fun m!1149603 () Bool)

(assert (=> mapNonEmpty!48913 m!1149603))

(declare-fun m!1149605 () Bool)

(assert (=> start!104718 m!1149605))

(declare-fun m!1149607 () Bool)

(assert (=> start!104718 m!1149607))

(declare-fun m!1149609 () Bool)

(assert (=> start!104718 m!1149609))

(declare-fun m!1149611 () Bool)

(assert (=> b!1248436 m!1149611))

(check-sat (not b!1248440) (not start!104718) (not mapNonEmpty!48913) (not b!1248435) (not b_next!26535) tp_is_empty!31437 b_and!44299 (not b!1248436))
(check-sat b_and!44299 (not b_next!26535))
(get-model)

(declare-fun d!137813 () Bool)

(assert (=> d!137813 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104718 d!137813))

(declare-fun d!137815 () Bool)

(assert (=> d!137815 (= (array_inv!29651 _keys!1118) (bvsge (size!39386 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104718 d!137815))

(declare-fun d!137817 () Bool)

(assert (=> d!137817 (= (array_inv!29652 _values!914) (bvsge (size!39387 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104718 d!137817))

(declare-fun bm!61569 () Bool)

(declare-fun call!61572 () Bool)

(declare-fun c!122109 () Bool)

(assert (=> bm!61569 (= call!61572 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122109 (Cons!27570 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000) Nil!27571) Nil!27571)))))

(declare-fun d!137819 () Bool)

(declare-fun res!832927 () Bool)

(declare-fun e!708451 () Bool)

(assert (=> d!137819 (=> res!832927 e!708451)))

(assert (=> d!137819 (= res!832927 (bvsge #b00000000000000000000000000000000 (size!39386 _keys!1118)))))

(assert (=> d!137819 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27571) e!708451)))

(declare-fun b!1248472 () Bool)

(declare-fun e!708448 () Bool)

(assert (=> b!1248472 (= e!708448 call!61572)))

(declare-fun b!1248473 () Bool)

(declare-fun e!708450 () Bool)

(assert (=> b!1248473 (= e!708450 e!708448)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248473 (= c!122109 (validKeyInArray!0 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1248474 () Bool)

(declare-fun e!708449 () Bool)

(declare-fun contains!7469 (List!27574 (_ BitVec 64)) Bool)

(assert (=> b!1248474 (= e!708449 (contains!7469 Nil!27571 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1248475 () Bool)

(assert (=> b!1248475 (= e!708448 call!61572)))

(declare-fun b!1248476 () Bool)

(assert (=> b!1248476 (= e!708451 e!708450)))

(declare-fun res!832929 () Bool)

(assert (=> b!1248476 (=> (not res!832929) (not e!708450))))

(assert (=> b!1248476 (= res!832929 (not e!708449))))

(declare-fun res!832928 () Bool)

(assert (=> b!1248476 (=> (not res!832928) (not e!708449))))

(assert (=> b!1248476 (= res!832928 (validKeyInArray!0 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137819 (not res!832927)) b!1248476))

(assert (= (and b!1248476 res!832928) b!1248474))

(assert (= (and b!1248476 res!832929) b!1248473))

(assert (= (and b!1248473 c!122109) b!1248475))

(assert (= (and b!1248473 (not c!122109)) b!1248472))

(assert (= (or b!1248475 b!1248472) bm!61569))

(declare-fun m!1149627 () Bool)

(assert (=> bm!61569 m!1149627))

(declare-fun m!1149629 () Bool)

(assert (=> bm!61569 m!1149629))

(assert (=> b!1248473 m!1149627))

(assert (=> b!1248473 m!1149627))

(declare-fun m!1149631 () Bool)

(assert (=> b!1248473 m!1149631))

(assert (=> b!1248474 m!1149627))

(assert (=> b!1248474 m!1149627))

(declare-fun m!1149633 () Bool)

(assert (=> b!1248474 m!1149633))

(assert (=> b!1248476 m!1149627))

(assert (=> b!1248476 m!1149627))

(assert (=> b!1248476 m!1149631))

(assert (=> b!1248440 d!137819))

(declare-fun b!1248485 () Bool)

(declare-fun e!708458 () Bool)

(declare-fun call!61575 () Bool)

(assert (=> b!1248485 (= e!708458 call!61575)))

(declare-fun b!1248486 () Bool)

(declare-fun e!708459 () Bool)

(assert (=> b!1248486 (= e!708459 e!708458)))

(declare-fun c!122112 () Bool)

(assert (=> b!1248486 (= c!122112 (validKeyInArray!0 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61572 () Bool)

(assert (=> bm!61572 (= call!61575 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1248487 () Bool)

(declare-fun e!708460 () Bool)

(assert (=> b!1248487 (= e!708460 call!61575)))

(declare-fun d!137821 () Bool)

(declare-fun res!832935 () Bool)

(assert (=> d!137821 (=> res!832935 e!708459)))

(assert (=> d!137821 (= res!832935 (bvsge #b00000000000000000000000000000000 (size!39386 _keys!1118)))))

(assert (=> d!137821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!708459)))

(declare-fun b!1248488 () Bool)

(assert (=> b!1248488 (= e!708458 e!708460)))

(declare-fun lt!563417 () (_ BitVec 64))

(assert (=> b!1248488 (= lt!563417 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41475 0))(
  ( (Unit!41476) )
))
(declare-fun lt!563419 () Unit!41475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80564 (_ BitVec 64) (_ BitVec 32)) Unit!41475)

(assert (=> b!1248488 (= lt!563419 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563417 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1248488 (arrayContainsKey!0 _keys!1118 lt!563417 #b00000000000000000000000000000000)))

(declare-fun lt!563418 () Unit!41475)

(assert (=> b!1248488 (= lt!563418 lt!563419)))

(declare-fun res!832934 () Bool)

(declare-datatypes ((SeekEntryResult!9957 0))(
  ( (MissingZero!9957 (index!42199 (_ BitVec 32))) (Found!9957 (index!42200 (_ BitVec 32))) (Intermediate!9957 (undefined!10769 Bool) (index!42201 (_ BitVec 32)) (x!109765 (_ BitVec 32))) (Undefined!9957) (MissingVacant!9957 (index!42202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80564 (_ BitVec 32)) SeekEntryResult!9957)

(assert (=> b!1248488 (= res!832934 (= (seekEntryOrOpen!0 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9957 #b00000000000000000000000000000000)))))

(assert (=> b!1248488 (=> (not res!832934) (not e!708460))))

(assert (= (and d!137821 (not res!832935)) b!1248486))

(assert (= (and b!1248486 c!122112) b!1248488))

(assert (= (and b!1248486 (not c!122112)) b!1248485))

(assert (= (and b!1248488 res!832934) b!1248487))

(assert (= (or b!1248487 b!1248485) bm!61572))

(assert (=> b!1248486 m!1149627))

(assert (=> b!1248486 m!1149627))

(assert (=> b!1248486 m!1149631))

(declare-fun m!1149635 () Bool)

(assert (=> bm!61572 m!1149635))

(assert (=> b!1248488 m!1149627))

(declare-fun m!1149637 () Bool)

(assert (=> b!1248488 m!1149637))

(declare-fun m!1149639 () Bool)

(assert (=> b!1248488 m!1149639))

(assert (=> b!1248488 m!1149627))

(declare-fun m!1149641 () Bool)

(assert (=> b!1248488 m!1149641))

(assert (=> b!1248435 d!137821))

(declare-fun b!1248513 () Bool)

(declare-fun e!708481 () ListLongMap!18199)

(declare-fun call!61578 () ListLongMap!18199)

(assert (=> b!1248513 (= e!708481 call!61578)))

(declare-fun bm!61575 () Bool)

(assert (=> bm!61575 (= call!61578 (getCurrentListMapNoExtraKeys!5522 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun e!708480 () Bool)

(declare-fun b!1248514 () Bool)

(declare-fun lt!563440 () ListLongMap!18199)

(assert (=> b!1248514 (= e!708480 (= lt!563440 (getCurrentListMapNoExtraKeys!5522 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1248516 () Bool)

(assert (=> b!1248516 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39386 _keys!1118)))))

(assert (=> b!1248516 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39387 _values!914)))))

(declare-fun e!708479 () Bool)

(declare-fun apply!979 (ListLongMap!18199 (_ BitVec 64)) V!47281)

(declare-fun get!19942 (ValueCell!14955 V!47281) V!47281)

(declare-fun dynLambda!3377 (Int (_ BitVec 64)) V!47281)

(assert (=> b!1248516 (= e!708479 (= (apply!979 lt!563440 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000)) (get!19942 (select (arr!38851 _values!914) #b00000000000000000000000000000000) (dynLambda!3377 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1248517 () Bool)

(declare-fun isEmpty!1021 (ListLongMap!18199) Bool)

(assert (=> b!1248517 (= e!708480 (isEmpty!1021 lt!563440))))

(declare-fun b!1248518 () Bool)

(declare-fun e!708476 () Bool)

(declare-fun e!708475 () Bool)

(assert (=> b!1248518 (= e!708476 e!708475)))

(declare-fun c!122122 () Bool)

(declare-fun e!708478 () Bool)

(assert (=> b!1248518 (= c!122122 e!708478)))

(declare-fun res!832944 () Bool)

(assert (=> b!1248518 (=> (not res!832944) (not e!708478))))

(assert (=> b!1248518 (= res!832944 (bvslt #b00000000000000000000000000000000 (size!39386 _keys!1118)))))

(declare-fun b!1248519 () Bool)

(declare-fun res!832945 () Bool)

(assert (=> b!1248519 (=> (not res!832945) (not e!708476))))

(declare-fun contains!7470 (ListLongMap!18199 (_ BitVec 64)) Bool)

(assert (=> b!1248519 (= res!832945 (not (contains!7470 lt!563440 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1248520 () Bool)

(assert (=> b!1248520 (= e!708475 e!708479)))

(assert (=> b!1248520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39386 _keys!1118)))))

(declare-fun res!832946 () Bool)

(assert (=> b!1248520 (= res!832946 (contains!7470 lt!563440 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1248520 (=> (not res!832946) (not e!708479))))

(declare-fun d!137823 () Bool)

(assert (=> d!137823 e!708476))

(declare-fun res!832947 () Bool)

(assert (=> d!137823 (=> (not res!832947) (not e!708476))))

(assert (=> d!137823 (= res!832947 (not (contains!7470 lt!563440 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!708477 () ListLongMap!18199)

(assert (=> d!137823 (= lt!563440 e!708477)))

(declare-fun c!122124 () Bool)

(assert (=> d!137823 (= c!122124 (bvsge #b00000000000000000000000000000000 (size!39386 _keys!1118)))))

(assert (=> d!137823 (validMask!0 mask!1466)))

(assert (=> d!137823 (= (getCurrentListMapNoExtraKeys!5522 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563440)))

(declare-fun b!1248515 () Bool)

(assert (=> b!1248515 (= e!708475 e!708480)))

(declare-fun c!122123 () Bool)

(assert (=> b!1248515 (= c!122123 (bvslt #b00000000000000000000000000000000 (size!39386 _keys!1118)))))

(declare-fun b!1248521 () Bool)

(assert (=> b!1248521 (= e!708477 (ListLongMap!18200 Nil!27570))))

(declare-fun b!1248522 () Bool)

(assert (=> b!1248522 (= e!708477 e!708481)))

(declare-fun c!122121 () Bool)

(assert (=> b!1248522 (= c!122121 (validKeyInArray!0 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1248523 () Bool)

(declare-fun lt!563438 () Unit!41475)

(declare-fun lt!563439 () Unit!41475)

(assert (=> b!1248523 (= lt!563438 lt!563439)))

(declare-fun lt!563436 () (_ BitVec 64))

(declare-fun lt!563434 () ListLongMap!18199)

(declare-fun lt!563435 () (_ BitVec 64))

(declare-fun lt!563437 () V!47281)

(declare-fun +!4135 (ListLongMap!18199 tuple2!20326) ListLongMap!18199)

(assert (=> b!1248523 (not (contains!7470 (+!4135 lt!563434 (tuple2!20327 lt!563435 lt!563437)) lt!563436))))

(declare-fun addStillNotContains!307 (ListLongMap!18199 (_ BitVec 64) V!47281 (_ BitVec 64)) Unit!41475)

(assert (=> b!1248523 (= lt!563439 (addStillNotContains!307 lt!563434 lt!563435 lt!563437 lt!563436))))

(assert (=> b!1248523 (= lt!563436 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1248523 (= lt!563437 (get!19942 (select (arr!38851 _values!914) #b00000000000000000000000000000000) (dynLambda!3377 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1248523 (= lt!563435 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1248523 (= lt!563434 call!61578)))

(assert (=> b!1248523 (= e!708481 (+!4135 call!61578 (tuple2!20327 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000) (get!19942 (select (arr!38851 _values!914) #b00000000000000000000000000000000) (dynLambda!3377 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1248524 () Bool)

(assert (=> b!1248524 (= e!708478 (validKeyInArray!0 (select (arr!38850 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1248524 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!137823 c!122124) b!1248521))

(assert (= (and d!137823 (not c!122124)) b!1248522))

(assert (= (and b!1248522 c!122121) b!1248523))

(assert (= (and b!1248522 (not c!122121)) b!1248513))

(assert (= (or b!1248523 b!1248513) bm!61575))

(assert (= (and d!137823 res!832947) b!1248519))

(assert (= (and b!1248519 res!832945) b!1248518))

(assert (= (and b!1248518 res!832944) b!1248524))

(assert (= (and b!1248518 c!122122) b!1248520))

(assert (= (and b!1248518 (not c!122122)) b!1248515))

(assert (= (and b!1248520 res!832946) b!1248516))

(assert (= (and b!1248515 c!122123) b!1248514))

(assert (= (and b!1248515 (not c!122123)) b!1248517))

(declare-fun b_lambda!22503 () Bool)

(assert (=> (not b_lambda!22503) (not b!1248516)))

(declare-fun t!41045 () Bool)

(declare-fun tb!11285 () Bool)

(assert (=> (and start!104718 (= defaultEntry!922 defaultEntry!922) t!41045) tb!11285))

(declare-fun result!23263 () Bool)

(assert (=> tb!11285 (= result!23263 tp_is_empty!31437)))

(assert (=> b!1248516 t!41045))

(declare-fun b_and!44303 () Bool)

(assert (= b_and!44299 (and (=> t!41045 result!23263) b_and!44303)))

(declare-fun b_lambda!22505 () Bool)

(assert (=> (not b_lambda!22505) (not b!1248523)))

(assert (=> b!1248523 t!41045))

(declare-fun b_and!44305 () Bool)

(assert (= b_and!44303 (and (=> t!41045 result!23263) b_and!44305)))

(declare-fun m!1149643 () Bool)

(assert (=> b!1248519 m!1149643))

(declare-fun m!1149645 () Bool)

(assert (=> bm!61575 m!1149645))

(assert (=> b!1248520 m!1149627))

(assert (=> b!1248520 m!1149627))

(declare-fun m!1149647 () Bool)

(assert (=> b!1248520 m!1149647))

(declare-fun m!1149649 () Bool)

(assert (=> b!1248516 m!1149649))

(assert (=> b!1248516 m!1149649))

(declare-fun m!1149651 () Bool)

(assert (=> b!1248516 m!1149651))

(declare-fun m!1149653 () Bool)

(assert (=> b!1248516 m!1149653))

(assert (=> b!1248516 m!1149651))

(assert (=> b!1248516 m!1149627))

(declare-fun m!1149655 () Bool)

(assert (=> b!1248516 m!1149655))

(assert (=> b!1248516 m!1149627))

(assert (=> b!1248514 m!1149645))

(declare-fun m!1149657 () Bool)

(assert (=> b!1248517 m!1149657))

(declare-fun m!1149659 () Bool)

(assert (=> b!1248523 m!1149659))

(declare-fun m!1149661 () Bool)

(assert (=> b!1248523 m!1149661))

(declare-fun m!1149663 () Bool)

(assert (=> b!1248523 m!1149663))

(assert (=> b!1248523 m!1149649))

(assert (=> b!1248523 m!1149649))

(assert (=> b!1248523 m!1149651))

(assert (=> b!1248523 m!1149653))

(declare-fun m!1149665 () Bool)

(assert (=> b!1248523 m!1149665))

(assert (=> b!1248523 m!1149659))

(assert (=> b!1248523 m!1149651))

(assert (=> b!1248523 m!1149627))

(declare-fun m!1149667 () Bool)

(assert (=> d!137823 m!1149667))

(assert (=> d!137823 m!1149605))

(assert (=> b!1248524 m!1149627))

(assert (=> b!1248524 m!1149627))

(assert (=> b!1248524 m!1149631))

(assert (=> b!1248522 m!1149627))

(assert (=> b!1248522 m!1149627))

(assert (=> b!1248522 m!1149631))

(assert (=> b!1248436 d!137823))

(declare-fun b!1248534 () Bool)

(declare-fun e!708486 () Bool)

(assert (=> b!1248534 (= e!708486 tp_is_empty!31437)))

(declare-fun mapIsEmpty!48919 () Bool)

(declare-fun mapRes!48919 () Bool)

(assert (=> mapIsEmpty!48919 mapRes!48919))

(declare-fun condMapEmpty!48919 () Bool)

(declare-fun mapDefault!48919 () ValueCell!14955)

(assert (=> mapNonEmpty!48913 (= condMapEmpty!48919 (= mapRest!48913 ((as const (Array (_ BitVec 32) ValueCell!14955)) mapDefault!48919)))))

(assert (=> mapNonEmpty!48913 (= tp!93092 (and e!708486 mapRes!48919))))

(declare-fun b!1248533 () Bool)

(declare-fun e!708487 () Bool)

(assert (=> b!1248533 (= e!708487 tp_is_empty!31437)))

(declare-fun mapNonEmpty!48919 () Bool)

(declare-fun tp!93101 () Bool)

(assert (=> mapNonEmpty!48919 (= mapRes!48919 (and tp!93101 e!708487))))

(declare-fun mapValue!48919 () ValueCell!14955)

(declare-fun mapRest!48919 () (Array (_ BitVec 32) ValueCell!14955))

(declare-fun mapKey!48919 () (_ BitVec 32))

(assert (=> mapNonEmpty!48919 (= mapRest!48913 (store mapRest!48919 mapKey!48919 mapValue!48919))))

(assert (= (and mapNonEmpty!48913 condMapEmpty!48919) mapIsEmpty!48919))

(assert (= (and mapNonEmpty!48913 (not condMapEmpty!48919)) mapNonEmpty!48919))

(assert (= (and mapNonEmpty!48919 ((_ is ValueCellFull!14955) mapValue!48919)) b!1248533))

(assert (= (and mapNonEmpty!48913 ((_ is ValueCellFull!14955) mapDefault!48919)) b!1248534))

(declare-fun m!1149669 () Bool)

(assert (=> mapNonEmpty!48919 m!1149669))

(declare-fun b_lambda!22507 () Bool)

(assert (= b_lambda!22505 (or (and start!104718 b_free!26535) b_lambda!22507)))

(declare-fun b_lambda!22509 () Bool)

(assert (= b_lambda!22503 (or (and start!104718 b_free!26535) b_lambda!22509)))

(check-sat (not b!1248473) (not b!1248474) b_and!44305 (not mapNonEmpty!48919) (not b!1248517) tp_is_empty!31437 (not bm!61569) (not b!1248523) (not bm!61575) (not b!1248476) (not b_lambda!22509) (not b!1248486) (not b!1248488) (not b!1248524) (not b!1248522) (not b_next!26535) (not d!137823) (not b_lambda!22507) (not b!1248516) (not bm!61572) (not b!1248514) (not b!1248520) (not b!1248519))
(check-sat b_and!44305 (not b_next!26535))
