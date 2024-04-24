; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100536 () Bool)

(assert start!100536)

(declare-fun b_free!25687 () Bool)

(declare-fun b_next!25687 () Bool)

(assert (=> start!100536 (= b_free!25687 (not b_next!25687))))

(declare-fun tp!90008 () Bool)

(declare-fun b_and!42243 () Bool)

(assert (=> start!100536 (= tp!90008 b_and!42243)))

(declare-datatypes ((V!45617 0))(
  ( (V!45618 (val!15240 Int)) )
))
(declare-fun zeroValue!944 () V!45617)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19538 0))(
  ( (tuple2!19539 (_1!9780 (_ BitVec 64)) (_2!9780 V!45617)) )
))
(declare-datatypes ((List!26338 0))(
  ( (Nil!26335) (Cons!26334 (h!27552 tuple2!19538) (t!39009 List!26338)) )
))
(declare-datatypes ((ListLongMap!17515 0))(
  ( (ListLongMap!17516 (toList!8773 List!26338)) )
))
(declare-fun call!57247 () ListLongMap!17515)

(declare-fun bm!57244 () Bool)

(declare-datatypes ((ValueCell!14474 0))(
  ( (ValueCellFull!14474 (v!17874 V!45617)) (EmptyCell!14474) )
))
(declare-datatypes ((array!77551 0))(
  ( (array!77552 (arr!37416 (Array (_ BitVec 32) ValueCell!14474)) (size!37953 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77551)

(declare-fun minValue!944 () V!45617)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!77553 0))(
  ( (array!77554 (arr!37417 (Array (_ BitVec 32) (_ BitVec 64))) (size!37954 (_ BitVec 32))) )
))
(declare-fun lt!543622 () array!77553)

(declare-fun getCurrentListMapNoExtraKeys!5240 (array!77553 array!77551 (_ BitVec 32) (_ BitVec 32) V!45617 V!45617 (_ BitVec 32) Int) ListLongMap!17515)

(declare-fun dynLambda!3188 (Int (_ BitVec 64)) V!45617)

(assert (=> bm!57244 (= call!57247 (getCurrentListMapNoExtraKeys!5240 lt!543622 (array!77552 (store (arr!37416 _values!996) i!673 (ValueCellFull!14474 (dynLambda!3188 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37953 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198052 () Bool)

(declare-fun res!796971 () Bool)

(declare-fun e!680759 () Bool)

(assert (=> b!1198052 (=> (not res!796971) (not e!680759))))

(declare-fun _keys!1208 () array!77553)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77553 (_ BitVec 32)) Bool)

(assert (=> b!1198052 (= res!796971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198053 () Bool)

(declare-fun e!680753 () Bool)

(assert (=> b!1198053 (= e!680753 true)))

(declare-fun e!680752 () Bool)

(assert (=> b!1198053 e!680752))

(declare-fun c!117743 () Bool)

(assert (=> b!1198053 (= c!117743 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39653 0))(
  ( (Unit!39654) )
))
(declare-fun lt!543620 () Unit!39653)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!988 (array!77553 array!77551 (_ BitVec 32) (_ BitVec 32) V!45617 V!45617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39653)

(assert (=> b!1198053 (= lt!543620 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!988 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47387 () Bool)

(declare-fun mapRes!47387 () Bool)

(declare-fun tp!90009 () Bool)

(declare-fun e!680756 () Bool)

(assert (=> mapNonEmpty!47387 (= mapRes!47387 (and tp!90009 e!680756))))

(declare-fun mapRest!47387 () (Array (_ BitVec 32) ValueCell!14474))

(declare-fun mapKey!47387 () (_ BitVec 32))

(declare-fun mapValue!47387 () ValueCell!14474)

(assert (=> mapNonEmpty!47387 (= (arr!37416 _values!996) (store mapRest!47387 mapKey!47387 mapValue!47387))))

(declare-fun b!1198054 () Bool)

(declare-fun res!796966 () Bool)

(declare-fun e!680757 () Bool)

(assert (=> b!1198054 (=> (not res!796966) (not e!680757))))

(declare-datatypes ((List!26339 0))(
  ( (Nil!26336) (Cons!26335 (h!27553 (_ BitVec 64)) (t!39010 List!26339)) )
))
(declare-fun arrayNoDuplicates!0 (array!77553 (_ BitVec 32) List!26339) Bool)

(assert (=> b!1198054 (= res!796966 (arrayNoDuplicates!0 lt!543622 #b00000000000000000000000000000000 Nil!26336))))

(declare-fun b!1198055 () Bool)

(declare-fun res!796967 () Bool)

(assert (=> b!1198055 (=> (not res!796967) (not e!680759))))

(assert (=> b!1198055 (= res!796967 (and (= (size!37953 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37954 _keys!1208) (size!37953 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198056 () Bool)

(declare-fun e!680758 () Bool)

(declare-fun tp_is_empty!30367 () Bool)

(assert (=> b!1198056 (= e!680758 tp_is_empty!30367)))

(declare-fun call!57248 () ListLongMap!17515)

(declare-fun bm!57245 () Bool)

(assert (=> bm!57245 (= call!57248 (getCurrentListMapNoExtraKeys!5240 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198057 () Bool)

(declare-fun res!796973 () Bool)

(assert (=> b!1198057 (=> (not res!796973) (not e!680759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198057 (= res!796973 (validKeyInArray!0 k0!934))))

(declare-fun b!1198058 () Bool)

(assert (=> b!1198058 (= e!680759 e!680757)))

(declare-fun res!796972 () Bool)

(assert (=> b!1198058 (=> (not res!796972) (not e!680757))))

(assert (=> b!1198058 (= res!796972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543622 mask!1564))))

(assert (=> b!1198058 (= lt!543622 (array!77554 (store (arr!37417 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37954 _keys!1208)))))

(declare-fun mapIsEmpty!47387 () Bool)

(assert (=> mapIsEmpty!47387 mapRes!47387))

(declare-fun b!1198059 () Bool)

(assert (=> b!1198059 (= e!680757 (not e!680753))))

(declare-fun res!796969 () Bool)

(assert (=> b!1198059 (=> res!796969 e!680753)))

(assert (=> b!1198059 (= res!796969 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37954 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198059 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543621 () Unit!39653)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77553 (_ BitVec 64) (_ BitVec 32)) Unit!39653)

(assert (=> b!1198059 (= lt!543621 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!796968 () Bool)

(assert (=> start!100536 (=> (not res!796968) (not e!680759))))

(assert (=> start!100536 (= res!796968 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37954 _keys!1208))))))

(assert (=> start!100536 e!680759))

(assert (=> start!100536 tp_is_empty!30367))

(declare-fun array_inv!28586 (array!77553) Bool)

(assert (=> start!100536 (array_inv!28586 _keys!1208)))

(assert (=> start!100536 true))

(assert (=> start!100536 tp!90008))

(declare-fun e!680755 () Bool)

(declare-fun array_inv!28587 (array!77551) Bool)

(assert (=> start!100536 (and (array_inv!28587 _values!996) e!680755)))

(declare-fun b!1198060 () Bool)

(declare-fun -!1773 (ListLongMap!17515 (_ BitVec 64)) ListLongMap!17515)

(assert (=> b!1198060 (= e!680752 (= call!57247 (-!1773 call!57248 k0!934)))))

(declare-fun b!1198061 () Bool)

(declare-fun res!796976 () Bool)

(assert (=> b!1198061 (=> (not res!796976) (not e!680759))))

(assert (=> b!1198061 (= res!796976 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37954 _keys!1208))))))

(declare-fun b!1198062 () Bool)

(declare-fun res!796970 () Bool)

(assert (=> b!1198062 (=> (not res!796970) (not e!680759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198062 (= res!796970 (validMask!0 mask!1564))))

(declare-fun b!1198063 () Bool)

(assert (=> b!1198063 (= e!680755 (and e!680758 mapRes!47387))))

(declare-fun condMapEmpty!47387 () Bool)

(declare-fun mapDefault!47387 () ValueCell!14474)

(assert (=> b!1198063 (= condMapEmpty!47387 (= (arr!37416 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14474)) mapDefault!47387)))))

(declare-fun b!1198064 () Bool)

(assert (=> b!1198064 (= e!680752 (= call!57247 call!57248))))

(declare-fun b!1198065 () Bool)

(assert (=> b!1198065 (= e!680756 tp_is_empty!30367)))

(declare-fun b!1198066 () Bool)

(declare-fun res!796974 () Bool)

(assert (=> b!1198066 (=> (not res!796974) (not e!680759))))

(assert (=> b!1198066 (= res!796974 (= (select (arr!37417 _keys!1208) i!673) k0!934))))

(declare-fun b!1198067 () Bool)

(declare-fun res!796975 () Bool)

(assert (=> b!1198067 (=> (not res!796975) (not e!680759))))

(assert (=> b!1198067 (= res!796975 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26336))))

(assert (= (and start!100536 res!796968) b!1198062))

(assert (= (and b!1198062 res!796970) b!1198055))

(assert (= (and b!1198055 res!796967) b!1198052))

(assert (= (and b!1198052 res!796971) b!1198067))

(assert (= (and b!1198067 res!796975) b!1198061))

(assert (= (and b!1198061 res!796976) b!1198057))

(assert (= (and b!1198057 res!796973) b!1198066))

(assert (= (and b!1198066 res!796974) b!1198058))

(assert (= (and b!1198058 res!796972) b!1198054))

(assert (= (and b!1198054 res!796966) b!1198059))

(assert (= (and b!1198059 (not res!796969)) b!1198053))

(assert (= (and b!1198053 c!117743) b!1198060))

(assert (= (and b!1198053 (not c!117743)) b!1198064))

(assert (= (or b!1198060 b!1198064) bm!57244))

(assert (= (or b!1198060 b!1198064) bm!57245))

(assert (= (and b!1198063 condMapEmpty!47387) mapIsEmpty!47387))

(assert (= (and b!1198063 (not condMapEmpty!47387)) mapNonEmpty!47387))

(get-info :version)

(assert (= (and mapNonEmpty!47387 ((_ is ValueCellFull!14474) mapValue!47387)) b!1198065))

(assert (= (and b!1198063 ((_ is ValueCellFull!14474) mapDefault!47387)) b!1198056))

(assert (= start!100536 b!1198063))

(declare-fun b_lambda!20825 () Bool)

(assert (=> (not b_lambda!20825) (not bm!57244)))

(declare-fun t!39008 () Bool)

(declare-fun tb!10491 () Bool)

(assert (=> (and start!100536 (= defaultEntry!1004 defaultEntry!1004) t!39008) tb!10491))

(declare-fun result!21563 () Bool)

(assert (=> tb!10491 (= result!21563 tp_is_empty!30367)))

(assert (=> bm!57244 t!39008))

(declare-fun b_and!42245 () Bool)

(assert (= b_and!42243 (and (=> t!39008 result!21563) b_and!42245)))

(declare-fun m!1105473 () Bool)

(assert (=> start!100536 m!1105473))

(declare-fun m!1105475 () Bool)

(assert (=> start!100536 m!1105475))

(declare-fun m!1105477 () Bool)

(assert (=> mapNonEmpty!47387 m!1105477))

(declare-fun m!1105479 () Bool)

(assert (=> b!1198059 m!1105479))

(declare-fun m!1105481 () Bool)

(assert (=> b!1198059 m!1105481))

(declare-fun m!1105483 () Bool)

(assert (=> bm!57244 m!1105483))

(declare-fun m!1105485 () Bool)

(assert (=> bm!57244 m!1105485))

(declare-fun m!1105487 () Bool)

(assert (=> bm!57244 m!1105487))

(declare-fun m!1105489 () Bool)

(assert (=> b!1198053 m!1105489))

(declare-fun m!1105491 () Bool)

(assert (=> b!1198052 m!1105491))

(declare-fun m!1105493 () Bool)

(assert (=> b!1198060 m!1105493))

(declare-fun m!1105495 () Bool)

(assert (=> b!1198066 m!1105495))

(declare-fun m!1105497 () Bool)

(assert (=> bm!57245 m!1105497))

(declare-fun m!1105499 () Bool)

(assert (=> b!1198054 m!1105499))

(declare-fun m!1105501 () Bool)

(assert (=> b!1198057 m!1105501))

(declare-fun m!1105503 () Bool)

(assert (=> b!1198067 m!1105503))

(declare-fun m!1105505 () Bool)

(assert (=> b!1198058 m!1105505))

(declare-fun m!1105507 () Bool)

(assert (=> b!1198058 m!1105507))

(declare-fun m!1105509 () Bool)

(assert (=> b!1198062 m!1105509))

(check-sat (not b!1198057) (not b!1198060) (not start!100536) (not b!1198067) (not b!1198062) (not b!1198059) (not b!1198058) (not b_lambda!20825) (not bm!57244) (not b!1198053) tp_is_empty!30367 (not b_next!25687) (not mapNonEmpty!47387) (not b!1198054) (not b!1198052) b_and!42245 (not bm!57245))
(check-sat b_and!42245 (not b_next!25687))
