; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99224 () Bool)

(assert start!99224)

(declare-fun b_free!24835 () Bool)

(declare-fun b_next!24835 () Bool)

(assert (=> start!99224 (= b_free!24835 (not b_next!24835))))

(declare-fun tp!87216 () Bool)

(declare-fun b_and!40497 () Bool)

(assert (=> start!99224 (= tp!87216 b_and!40497)))

(declare-fun b!1168581 () Bool)

(declare-fun res!775371 () Bool)

(declare-fun e!664129 () Bool)

(assert (=> b!1168581 (=> (not res!775371) (not e!664129))))

(declare-datatypes ((array!75476 0))(
  ( (array!75477 (arr!36389 (Array (_ BitVec 32) (_ BitVec 64))) (size!36927 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75476)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1168581 (= res!775371 (= (select (arr!36389 _keys!1208) i!673) k0!934))))

(declare-fun b!1168582 () Bool)

(declare-fun e!664136 () Bool)

(assert (=> b!1168582 (= e!664129 e!664136)))

(declare-fun res!775377 () Bool)

(assert (=> b!1168582 (=> (not res!775377) (not e!664136))))

(declare-fun lt!526004 () array!75476)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75476 (_ BitVec 32)) Bool)

(assert (=> b!1168582 (= res!775377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526004 mask!1564))))

(assert (=> b!1168582 (= lt!526004 (array!75477 (store (arr!36389 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36927 _keys!1208)))))

(declare-fun b!1168583 () Bool)

(declare-fun e!664130 () Bool)

(declare-fun e!664132 () Bool)

(assert (=> b!1168583 (= e!664130 e!664132)))

(declare-fun res!775376 () Bool)

(assert (=> b!1168583 (=> res!775376 e!664132)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1168583 (= res!775376 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44281 0))(
  ( (V!44282 (val!14739 Int)) )
))
(declare-fun zeroValue!944 () V!44281)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44281)

(declare-datatypes ((tuple2!18902 0))(
  ( (tuple2!18903 (_1!9462 (_ BitVec 64)) (_2!9462 V!44281)) )
))
(declare-datatypes ((List!25617 0))(
  ( (Nil!25614) (Cons!25613 (h!26822 tuple2!18902) (t!37435 List!25617)) )
))
(declare-datatypes ((ListLongMap!16871 0))(
  ( (ListLongMap!16872 (toList!8451 List!25617)) )
))
(declare-fun lt!525998 () ListLongMap!16871)

(declare-datatypes ((ValueCell!13973 0))(
  ( (ValueCellFull!13973 (v!17375 V!44281)) (EmptyCell!13973) )
))
(declare-datatypes ((array!75478 0))(
  ( (array!75479 (arr!36390 (Array (_ BitVec 32) ValueCell!13973)) (size!36928 (_ BitVec 32))) )
))
(declare-fun lt!526000 () array!75478)

(declare-fun getCurrentListMapNoExtraKeys!4927 (array!75476 array!75478 (_ BitVec 32) (_ BitVec 32) V!44281 V!44281 (_ BitVec 32) Int) ListLongMap!16871)

(assert (=> b!1168583 (= lt!525998 (getCurrentListMapNoExtraKeys!4927 lt!526004 lt!526000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526002 () V!44281)

(declare-fun _values!996 () array!75478)

(assert (=> b!1168583 (= lt!526000 (array!75479 (store (arr!36390 _values!996) i!673 (ValueCellFull!13973 lt!526002)) (size!36928 _values!996)))))

(declare-fun dynLambda!2854 (Int (_ BitVec 64)) V!44281)

(assert (=> b!1168583 (= lt!526002 (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526003 () ListLongMap!16871)

(assert (=> b!1168583 (= lt!526003 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168584 () Bool)

(declare-fun res!775368 () Bool)

(assert (=> b!1168584 (=> (not res!775368) (not e!664129))))

(assert (=> b!1168584 (= res!775368 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36927 _keys!1208))))))

(declare-fun b!1168585 () Bool)

(declare-fun res!775374 () Bool)

(assert (=> b!1168585 (=> (not res!775374) (not e!664129))))

(assert (=> b!1168585 (= res!775374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168586 () Bool)

(declare-fun e!664135 () Bool)

(assert (=> b!1168586 (= e!664132 e!664135)))

(declare-fun res!775373 () Bool)

(assert (=> b!1168586 (=> res!775373 e!664135)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168586 (= res!775373 (not (validKeyInArray!0 (select (arr!36389 _keys!1208) from!1455))))))

(declare-fun lt!526005 () ListLongMap!16871)

(declare-fun lt!525997 () ListLongMap!16871)

(assert (=> b!1168586 (= lt!526005 lt!525997)))

(declare-fun lt!525999 () ListLongMap!16871)

(declare-fun -!1458 (ListLongMap!16871 (_ BitVec 64)) ListLongMap!16871)

(assert (=> b!1168586 (= lt!525997 (-!1458 lt!525999 k0!934))))

(assert (=> b!1168586 (= lt!526005 (getCurrentListMapNoExtraKeys!4927 lt!526004 lt!526000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1168586 (= lt!525999 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38391 0))(
  ( (Unit!38392) )
))
(declare-fun lt!526001 () Unit!38391)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!722 (array!75476 array!75478 (_ BitVec 32) (_ BitVec 32) V!44281 V!44281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38391)

(assert (=> b!1168586 (= lt!526001 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168587 () Bool)

(declare-fun res!775375 () Bool)

(assert (=> b!1168587 (=> (not res!775375) (not e!664129))))

(declare-datatypes ((List!25618 0))(
  ( (Nil!25615) (Cons!25614 (h!26823 (_ BitVec 64)) (t!37436 List!25618)) )
))
(declare-fun arrayNoDuplicates!0 (array!75476 (_ BitVec 32) List!25618) Bool)

(assert (=> b!1168587 (= res!775375 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25615))))

(declare-fun b!1168588 () Bool)

(assert (=> b!1168588 (= e!664136 (not e!664130))))

(declare-fun res!775367 () Bool)

(assert (=> b!1168588 (=> res!775367 e!664130)))

(assert (=> b!1168588 (= res!775367 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168588 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525996 () Unit!38391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75476 (_ BitVec 64) (_ BitVec 32)) Unit!38391)

(assert (=> b!1168588 (= lt!525996 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168589 () Bool)

(declare-fun e!664134 () Bool)

(declare-fun tp_is_empty!29365 () Bool)

(assert (=> b!1168589 (= e!664134 tp_is_empty!29365)))

(declare-fun b!1168590 () Bool)

(declare-fun res!775369 () Bool)

(assert (=> b!1168590 (=> (not res!775369) (not e!664136))))

(assert (=> b!1168590 (= res!775369 (arrayNoDuplicates!0 lt!526004 #b00000000000000000000000000000000 Nil!25615))))

(declare-fun mapIsEmpty!45872 () Bool)

(declare-fun mapRes!45872 () Bool)

(assert (=> mapIsEmpty!45872 mapRes!45872))

(declare-fun b!1168591 () Bool)

(declare-fun res!775379 () Bool)

(assert (=> b!1168591 (=> (not res!775379) (not e!664129))))

(assert (=> b!1168591 (= res!775379 (validKeyInArray!0 k0!934))))

(declare-fun b!1168592 () Bool)

(declare-fun res!775370 () Bool)

(assert (=> b!1168592 (=> (not res!775370) (not e!664129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168592 (= res!775370 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45872 () Bool)

(declare-fun tp!87215 () Bool)

(assert (=> mapNonEmpty!45872 (= mapRes!45872 (and tp!87215 e!664134))))

(declare-fun mapKey!45872 () (_ BitVec 32))

(declare-fun mapValue!45872 () ValueCell!13973)

(declare-fun mapRest!45872 () (Array (_ BitVec 32) ValueCell!13973))

(assert (=> mapNonEmpty!45872 (= (arr!36390 _values!996) (store mapRest!45872 mapKey!45872 mapValue!45872))))

(declare-fun b!1168593 () Bool)

(declare-fun e!664137 () Bool)

(declare-fun e!664133 () Bool)

(assert (=> b!1168593 (= e!664137 (and e!664133 mapRes!45872))))

(declare-fun condMapEmpty!45872 () Bool)

(declare-fun mapDefault!45872 () ValueCell!13973)

(assert (=> b!1168593 (= condMapEmpty!45872 (= (arr!36390 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13973)) mapDefault!45872)))))

(declare-fun b!1168594 () Bool)

(assert (=> b!1168594 (= e!664133 tp_is_empty!29365)))

(declare-fun b!1168595 () Bool)

(assert (=> b!1168595 (= e!664135 (or (not (= (select (arr!36389 _keys!1208) from!1455) k0!934)) (bvslt (size!36927 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun +!3777 (ListLongMap!16871 tuple2!18902) ListLongMap!16871)

(declare-fun get!18553 (ValueCell!13973 V!44281) V!44281)

(assert (=> b!1168595 (= lt!525998 (+!3777 lt!525997 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002))))))

(declare-fun b!1168596 () Bool)

(declare-fun res!775378 () Bool)

(assert (=> b!1168596 (=> (not res!775378) (not e!664129))))

(assert (=> b!1168596 (= res!775378 (and (= (size!36928 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36927 _keys!1208) (size!36928 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!775372 () Bool)

(assert (=> start!99224 (=> (not res!775372) (not e!664129))))

(assert (=> start!99224 (= res!775372 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36927 _keys!1208))))))

(assert (=> start!99224 e!664129))

(assert (=> start!99224 tp_is_empty!29365))

(declare-fun array_inv!27918 (array!75476) Bool)

(assert (=> start!99224 (array_inv!27918 _keys!1208)))

(assert (=> start!99224 true))

(assert (=> start!99224 tp!87216))

(declare-fun array_inv!27919 (array!75478) Bool)

(assert (=> start!99224 (and (array_inv!27919 _values!996) e!664137)))

(assert (= (and start!99224 res!775372) b!1168592))

(assert (= (and b!1168592 res!775370) b!1168596))

(assert (= (and b!1168596 res!775378) b!1168585))

(assert (= (and b!1168585 res!775374) b!1168587))

(assert (= (and b!1168587 res!775375) b!1168584))

(assert (= (and b!1168584 res!775368) b!1168591))

(assert (= (and b!1168591 res!775379) b!1168581))

(assert (= (and b!1168581 res!775371) b!1168582))

(assert (= (and b!1168582 res!775377) b!1168590))

(assert (= (and b!1168590 res!775369) b!1168588))

(assert (= (and b!1168588 (not res!775367)) b!1168583))

(assert (= (and b!1168583 (not res!775376)) b!1168586))

(assert (= (and b!1168586 (not res!775373)) b!1168595))

(assert (= (and b!1168593 condMapEmpty!45872) mapIsEmpty!45872))

(assert (= (and b!1168593 (not condMapEmpty!45872)) mapNonEmpty!45872))

(get-info :version)

(assert (= (and mapNonEmpty!45872 ((_ is ValueCellFull!13973) mapValue!45872)) b!1168589))

(assert (= (and b!1168593 ((_ is ValueCellFull!13973) mapDefault!45872)) b!1168594))

(assert (= start!99224 b!1168593))

(declare-fun b_lambda!19923 () Bool)

(assert (=> (not b_lambda!19923) (not b!1168583)))

(declare-fun t!37434 () Bool)

(declare-fun tb!9639 () Bool)

(assert (=> (and start!99224 (= defaultEntry!1004 defaultEntry!1004) t!37434) tb!9639))

(declare-fun result!19851 () Bool)

(assert (=> tb!9639 (= result!19851 tp_is_empty!29365)))

(assert (=> b!1168583 t!37434))

(declare-fun b_and!40499 () Bool)

(assert (= b_and!40497 (and (=> t!37434 result!19851) b_and!40499)))

(declare-fun m!1075939 () Bool)

(assert (=> b!1168591 m!1075939))

(declare-fun m!1075941 () Bool)

(assert (=> b!1168583 m!1075941))

(declare-fun m!1075943 () Bool)

(assert (=> b!1168583 m!1075943))

(declare-fun m!1075945 () Bool)

(assert (=> b!1168583 m!1075945))

(declare-fun m!1075947 () Bool)

(assert (=> b!1168583 m!1075947))

(declare-fun m!1075949 () Bool)

(assert (=> b!1168595 m!1075949))

(declare-fun m!1075951 () Bool)

(assert (=> b!1168595 m!1075951))

(assert (=> b!1168595 m!1075951))

(declare-fun m!1075953 () Bool)

(assert (=> b!1168595 m!1075953))

(declare-fun m!1075955 () Bool)

(assert (=> b!1168595 m!1075955))

(declare-fun m!1075957 () Bool)

(assert (=> b!1168586 m!1075957))

(declare-fun m!1075959 () Bool)

(assert (=> b!1168586 m!1075959))

(declare-fun m!1075961 () Bool)

(assert (=> b!1168586 m!1075961))

(assert (=> b!1168586 m!1075949))

(declare-fun m!1075963 () Bool)

(assert (=> b!1168586 m!1075963))

(declare-fun m!1075965 () Bool)

(assert (=> b!1168586 m!1075965))

(assert (=> b!1168586 m!1075949))

(declare-fun m!1075967 () Bool)

(assert (=> b!1168581 m!1075967))

(declare-fun m!1075969 () Bool)

(assert (=> b!1168582 m!1075969))

(declare-fun m!1075971 () Bool)

(assert (=> b!1168582 m!1075971))

(declare-fun m!1075973 () Bool)

(assert (=> start!99224 m!1075973))

(declare-fun m!1075975 () Bool)

(assert (=> start!99224 m!1075975))

(declare-fun m!1075977 () Bool)

(assert (=> b!1168585 m!1075977))

(declare-fun m!1075979 () Bool)

(assert (=> b!1168588 m!1075979))

(declare-fun m!1075981 () Bool)

(assert (=> b!1168588 m!1075981))

(declare-fun m!1075983 () Bool)

(assert (=> mapNonEmpty!45872 m!1075983))

(declare-fun m!1075985 () Bool)

(assert (=> b!1168592 m!1075985))

(declare-fun m!1075987 () Bool)

(assert (=> b!1168587 m!1075987))

(declare-fun m!1075989 () Bool)

(assert (=> b!1168590 m!1075989))

(check-sat (not b!1168583) (not b!1168592) (not b!1168582) (not b!1168595) (not b!1168591) (not b_next!24835) b_and!40499 (not b_lambda!19923) (not b!1168590) (not start!99224) (not b!1168585) (not b!1168587) tp_is_empty!29365 (not b!1168586) (not b!1168588) (not mapNonEmpty!45872))
(check-sat b_and!40499 (not b_next!24835))
(get-model)

(declare-fun b_lambda!19929 () Bool)

(assert (= b_lambda!19923 (or (and start!99224 b_free!24835) b_lambda!19929)))

(check-sat (not b_lambda!19929) (not b!1168583) (not b!1168592) (not b!1168582) (not b!1168595) (not b!1168591) (not b_next!24835) b_and!40499 (not b!1168590) (not start!99224) (not b!1168585) (not b!1168587) tp_is_empty!29365 (not b!1168586) (not b!1168588) (not mapNonEmpty!45872))
(check-sat b_and!40499 (not b_next!24835))
(get-model)

(declare-fun d!131771 () Bool)

(assert (=> d!131771 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1168591 d!131771))

(declare-fun d!131773 () Bool)

(assert (=> d!131773 (= (array_inv!27918 _keys!1208) (bvsge (size!36927 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!99224 d!131773))

(declare-fun d!131775 () Bool)

(assert (=> d!131775 (= (array_inv!27919 _values!996) (bvsge (size!36928 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!99224 d!131775))

(declare-fun b!1168707 () Bool)

(declare-fun e!664200 () Bool)

(declare-fun e!664199 () Bool)

(assert (=> b!1168707 (= e!664200 e!664199)))

(declare-fun lt!526073 () (_ BitVec 64))

(assert (=> b!1168707 (= lt!526073 (select (arr!36389 lt!526004) #b00000000000000000000000000000000))))

(declare-fun lt!526072 () Unit!38391)

(assert (=> b!1168707 (= lt!526072 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!526004 lt!526073 #b00000000000000000000000000000000))))

(assert (=> b!1168707 (arrayContainsKey!0 lt!526004 lt!526073 #b00000000000000000000000000000000)))

(declare-fun lt!526074 () Unit!38391)

(assert (=> b!1168707 (= lt!526074 lt!526072)))

(declare-fun res!775463 () Bool)

(declare-datatypes ((SeekEntryResult!9926 0))(
  ( (MissingZero!9926 (index!42075 (_ BitVec 32))) (Found!9926 (index!42076 (_ BitVec 32))) (Intermediate!9926 (undefined!10738 Bool) (index!42077 (_ BitVec 32)) (x!103615 (_ BitVec 32))) (Undefined!9926) (MissingVacant!9926 (index!42078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!75476 (_ BitVec 32)) SeekEntryResult!9926)

(assert (=> b!1168707 (= res!775463 (= (seekEntryOrOpen!0 (select (arr!36389 lt!526004) #b00000000000000000000000000000000) lt!526004 mask!1564) (Found!9926 #b00000000000000000000000000000000)))))

(assert (=> b!1168707 (=> (not res!775463) (not e!664199))))

(declare-fun b!1168708 () Bool)

(declare-fun e!664198 () Bool)

(assert (=> b!1168708 (= e!664198 e!664200)))

(declare-fun c!116501 () Bool)

(assert (=> b!1168708 (= c!116501 (validKeyInArray!0 (select (arr!36389 lt!526004) #b00000000000000000000000000000000)))))

(declare-fun b!1168709 () Bool)

(declare-fun call!57077 () Bool)

(assert (=> b!1168709 (= e!664200 call!57077)))

(declare-fun b!1168710 () Bool)

(assert (=> b!1168710 (= e!664199 call!57077)))

(declare-fun d!131777 () Bool)

(declare-fun res!775462 () Bool)

(assert (=> d!131777 (=> res!775462 e!664198)))

(assert (=> d!131777 (= res!775462 (bvsge #b00000000000000000000000000000000 (size!36927 lt!526004)))))

(assert (=> d!131777 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526004 mask!1564) e!664198)))

(declare-fun bm!57074 () Bool)

(assert (=> bm!57074 (= call!57077 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!526004 mask!1564))))

(assert (= (and d!131777 (not res!775462)) b!1168708))

(assert (= (and b!1168708 c!116501) b!1168707))

(assert (= (and b!1168708 (not c!116501)) b!1168709))

(assert (= (and b!1168707 res!775463) b!1168710))

(assert (= (or b!1168710 b!1168709) bm!57074))

(declare-fun m!1076095 () Bool)

(assert (=> b!1168707 m!1076095))

(declare-fun m!1076097 () Bool)

(assert (=> b!1168707 m!1076097))

(declare-fun m!1076099 () Bool)

(assert (=> b!1168707 m!1076099))

(assert (=> b!1168707 m!1076095))

(declare-fun m!1076101 () Bool)

(assert (=> b!1168707 m!1076101))

(assert (=> b!1168708 m!1076095))

(assert (=> b!1168708 m!1076095))

(declare-fun m!1076103 () Bool)

(assert (=> b!1168708 m!1076103))

(declare-fun m!1076105 () Bool)

(assert (=> bm!57074 m!1076105))

(assert (=> b!1168582 d!131777))

(declare-fun d!131779 () Bool)

(assert (=> d!131779 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1168592 d!131779))

(declare-fun b!1168735 () Bool)

(declare-fun e!664218 () Bool)

(declare-fun lt!526091 () ListLongMap!16871)

(assert (=> b!1168735 (= e!664218 (= lt!526091 (getCurrentListMapNoExtraKeys!4927 lt!526004 lt!526000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1168736 () Bool)

(declare-fun e!664216 () Bool)

(assert (=> b!1168736 (= e!664216 e!664218)))

(declare-fun c!116511 () Bool)

(assert (=> b!1168736 (= c!116511 (bvslt from!1455 (size!36927 lt!526004)))))

(declare-fun b!1168737 () Bool)

(declare-fun e!664221 () Bool)

(assert (=> b!1168737 (= e!664216 e!664221)))

(assert (=> b!1168737 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36927 lt!526004)))))

(declare-fun res!775474 () Bool)

(declare-fun contains!6818 (ListLongMap!16871 (_ BitVec 64)) Bool)

(assert (=> b!1168737 (= res!775474 (contains!6818 lt!526091 (select (arr!36389 lt!526004) from!1455)))))

(assert (=> b!1168737 (=> (not res!775474) (not e!664221))))

(declare-fun b!1168738 () Bool)

(declare-fun e!664217 () ListLongMap!16871)

(assert (=> b!1168738 (= e!664217 (ListLongMap!16872 Nil!25614))))

(declare-fun b!1168740 () Bool)

(declare-fun e!664220 () ListLongMap!16871)

(declare-fun call!57080 () ListLongMap!16871)

(assert (=> b!1168740 (= e!664220 call!57080)))

(declare-fun b!1168741 () Bool)

(declare-fun e!664219 () Bool)

(assert (=> b!1168741 (= e!664219 (validKeyInArray!0 (select (arr!36389 lt!526004) from!1455)))))

(assert (=> b!1168741 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!57077 () Bool)

(assert (=> bm!57077 (= call!57080 (getCurrentListMapNoExtraKeys!4927 lt!526004 lt!526000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1168742 () Bool)

(declare-fun res!775472 () Bool)

(declare-fun e!664215 () Bool)

(assert (=> b!1168742 (=> (not res!775472) (not e!664215))))

(assert (=> b!1168742 (= res!775472 (not (contains!6818 lt!526091 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1168743 () Bool)

(declare-fun isEmpty!982 (ListLongMap!16871) Bool)

(assert (=> b!1168743 (= e!664218 (isEmpty!982 lt!526091))))

(declare-fun b!1168744 () Bool)

(declare-fun lt!526090 () Unit!38391)

(declare-fun lt!526089 () Unit!38391)

(assert (=> b!1168744 (= lt!526090 lt!526089)))

(declare-fun lt!526095 () (_ BitVec 64))

(declare-fun lt!526092 () (_ BitVec 64))

(declare-fun lt!526094 () V!44281)

(declare-fun lt!526093 () ListLongMap!16871)

(assert (=> b!1168744 (not (contains!6818 (+!3777 lt!526093 (tuple2!18903 lt!526095 lt!526094)) lt!526092))))

(declare-fun addStillNotContains!286 (ListLongMap!16871 (_ BitVec 64) V!44281 (_ BitVec 64)) Unit!38391)

(assert (=> b!1168744 (= lt!526089 (addStillNotContains!286 lt!526093 lt!526095 lt!526094 lt!526092))))

(assert (=> b!1168744 (= lt!526092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1168744 (= lt!526094 (get!18553 (select (arr!36390 lt!526000) from!1455) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1168744 (= lt!526095 (select (arr!36389 lt!526004) from!1455))))

(assert (=> b!1168744 (= lt!526093 call!57080)))

(assert (=> b!1168744 (= e!664220 (+!3777 call!57080 (tuple2!18903 (select (arr!36389 lt!526004) from!1455) (get!18553 (select (arr!36390 lt!526000) from!1455) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!131781 () Bool)

(assert (=> d!131781 e!664215))

(declare-fun res!775475 () Bool)

(assert (=> d!131781 (=> (not res!775475) (not e!664215))))

(assert (=> d!131781 (= res!775475 (not (contains!6818 lt!526091 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131781 (= lt!526091 e!664217)))

(declare-fun c!116512 () Bool)

(assert (=> d!131781 (= c!116512 (bvsge from!1455 (size!36927 lt!526004)))))

(assert (=> d!131781 (validMask!0 mask!1564)))

(assert (=> d!131781 (= (getCurrentListMapNoExtraKeys!4927 lt!526004 lt!526000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!526091)))

(declare-fun b!1168739 () Bool)

(assert (=> b!1168739 (= e!664215 e!664216)))

(declare-fun c!116510 () Bool)

(assert (=> b!1168739 (= c!116510 e!664219)))

(declare-fun res!775473 () Bool)

(assert (=> b!1168739 (=> (not res!775473) (not e!664219))))

(assert (=> b!1168739 (= res!775473 (bvslt from!1455 (size!36927 lt!526004)))))

(declare-fun b!1168745 () Bool)

(assert (=> b!1168745 (= e!664217 e!664220)))

(declare-fun c!116513 () Bool)

(assert (=> b!1168745 (= c!116513 (validKeyInArray!0 (select (arr!36389 lt!526004) from!1455)))))

(declare-fun b!1168746 () Bool)

(assert (=> b!1168746 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36927 lt!526004)))))

(assert (=> b!1168746 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36928 lt!526000)))))

(declare-fun apply!950 (ListLongMap!16871 (_ BitVec 64)) V!44281)

(assert (=> b!1168746 (= e!664221 (= (apply!950 lt!526091 (select (arr!36389 lt!526004) from!1455)) (get!18553 (select (arr!36390 lt!526000) from!1455) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!131781 c!116512) b!1168738))

(assert (= (and d!131781 (not c!116512)) b!1168745))

(assert (= (and b!1168745 c!116513) b!1168744))

(assert (= (and b!1168745 (not c!116513)) b!1168740))

(assert (= (or b!1168744 b!1168740) bm!57077))

(assert (= (and d!131781 res!775475) b!1168742))

(assert (= (and b!1168742 res!775472) b!1168739))

(assert (= (and b!1168739 res!775473) b!1168741))

(assert (= (and b!1168739 c!116510) b!1168737))

(assert (= (and b!1168739 (not c!116510)) b!1168736))

(assert (= (and b!1168737 res!775474) b!1168746))

(assert (= (and b!1168736 c!116511) b!1168735))

(assert (= (and b!1168736 (not c!116511)) b!1168743))

(declare-fun b_lambda!19931 () Bool)

(assert (=> (not b_lambda!19931) (not b!1168744)))

(assert (=> b!1168744 t!37434))

(declare-fun b_and!40509 () Bool)

(assert (= b_and!40499 (and (=> t!37434 result!19851) b_and!40509)))

(declare-fun b_lambda!19933 () Bool)

(assert (=> (not b_lambda!19933) (not b!1168746)))

(assert (=> b!1168746 t!37434))

(declare-fun b_and!40511 () Bool)

(assert (= b_and!40509 (and (=> t!37434 result!19851) b_and!40511)))

(declare-fun m!1076107 () Bool)

(assert (=> b!1168741 m!1076107))

(assert (=> b!1168741 m!1076107))

(declare-fun m!1076109 () Bool)

(assert (=> b!1168741 m!1076109))

(assert (=> b!1168745 m!1076107))

(assert (=> b!1168745 m!1076107))

(assert (=> b!1168745 m!1076109))

(declare-fun m!1076111 () Bool)

(assert (=> b!1168742 m!1076111))

(declare-fun m!1076113 () Bool)

(assert (=> bm!57077 m!1076113))

(assert (=> b!1168744 m!1076107))

(assert (=> b!1168744 m!1075945))

(declare-fun m!1076115 () Bool)

(assert (=> b!1168744 m!1076115))

(declare-fun m!1076117 () Bool)

(assert (=> b!1168744 m!1076117))

(assert (=> b!1168744 m!1076117))

(assert (=> b!1168744 m!1075945))

(declare-fun m!1076119 () Bool)

(assert (=> b!1168744 m!1076119))

(declare-fun m!1076121 () Bool)

(assert (=> b!1168744 m!1076121))

(declare-fun m!1076123 () Bool)

(assert (=> b!1168744 m!1076123))

(assert (=> b!1168744 m!1076115))

(declare-fun m!1076125 () Bool)

(assert (=> b!1168744 m!1076125))

(assert (=> b!1168737 m!1076107))

(assert (=> b!1168737 m!1076107))

(declare-fun m!1076127 () Bool)

(assert (=> b!1168737 m!1076127))

(declare-fun m!1076129 () Bool)

(assert (=> d!131781 m!1076129))

(assert (=> d!131781 m!1075985))

(assert (=> b!1168735 m!1076113))

(declare-fun m!1076131 () Bool)

(assert (=> b!1168743 m!1076131))

(assert (=> b!1168746 m!1076107))

(assert (=> b!1168746 m!1075945))

(assert (=> b!1168746 m!1076117))

(assert (=> b!1168746 m!1075945))

(assert (=> b!1168746 m!1076119))

(assert (=> b!1168746 m!1076107))

(declare-fun m!1076133 () Bool)

(assert (=> b!1168746 m!1076133))

(assert (=> b!1168746 m!1076117))

(assert (=> b!1168583 d!131781))

(declare-fun b!1168747 () Bool)

(declare-fun lt!526098 () ListLongMap!16871)

(declare-fun e!664225 () Bool)

(assert (=> b!1168747 (= e!664225 (= lt!526098 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1168748 () Bool)

(declare-fun e!664223 () Bool)

(assert (=> b!1168748 (= e!664223 e!664225)))

(declare-fun c!116515 () Bool)

(assert (=> b!1168748 (= c!116515 (bvslt from!1455 (size!36927 _keys!1208)))))

(declare-fun b!1168749 () Bool)

(declare-fun e!664228 () Bool)

(assert (=> b!1168749 (= e!664223 e!664228)))

(assert (=> b!1168749 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36927 _keys!1208)))))

(declare-fun res!775478 () Bool)

(assert (=> b!1168749 (= res!775478 (contains!6818 lt!526098 (select (arr!36389 _keys!1208) from!1455)))))

(assert (=> b!1168749 (=> (not res!775478) (not e!664228))))

(declare-fun b!1168750 () Bool)

(declare-fun e!664224 () ListLongMap!16871)

(assert (=> b!1168750 (= e!664224 (ListLongMap!16872 Nil!25614))))

(declare-fun b!1168752 () Bool)

(declare-fun e!664227 () ListLongMap!16871)

(declare-fun call!57081 () ListLongMap!16871)

(assert (=> b!1168752 (= e!664227 call!57081)))

(declare-fun b!1168753 () Bool)

(declare-fun e!664226 () Bool)

(assert (=> b!1168753 (= e!664226 (validKeyInArray!0 (select (arr!36389 _keys!1208) from!1455)))))

(assert (=> b!1168753 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!57078 () Bool)

(assert (=> bm!57078 (= call!57081 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1168754 () Bool)

(declare-fun res!775476 () Bool)

(declare-fun e!664222 () Bool)

(assert (=> b!1168754 (=> (not res!775476) (not e!664222))))

(assert (=> b!1168754 (= res!775476 (not (contains!6818 lt!526098 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1168755 () Bool)

(assert (=> b!1168755 (= e!664225 (isEmpty!982 lt!526098))))

(declare-fun b!1168756 () Bool)

(declare-fun lt!526097 () Unit!38391)

(declare-fun lt!526096 () Unit!38391)

(assert (=> b!1168756 (= lt!526097 lt!526096)))

(declare-fun lt!526101 () V!44281)

(declare-fun lt!526100 () ListLongMap!16871)

(declare-fun lt!526099 () (_ BitVec 64))

(declare-fun lt!526102 () (_ BitVec 64))

(assert (=> b!1168756 (not (contains!6818 (+!3777 lt!526100 (tuple2!18903 lt!526102 lt!526101)) lt!526099))))

(assert (=> b!1168756 (= lt!526096 (addStillNotContains!286 lt!526100 lt!526102 lt!526101 lt!526099))))

(assert (=> b!1168756 (= lt!526099 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1168756 (= lt!526101 (get!18553 (select (arr!36390 _values!996) from!1455) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1168756 (= lt!526102 (select (arr!36389 _keys!1208) from!1455))))

(assert (=> b!1168756 (= lt!526100 call!57081)))

(assert (=> b!1168756 (= e!664227 (+!3777 call!57081 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!131783 () Bool)

(assert (=> d!131783 e!664222))

(declare-fun res!775479 () Bool)

(assert (=> d!131783 (=> (not res!775479) (not e!664222))))

(assert (=> d!131783 (= res!775479 (not (contains!6818 lt!526098 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131783 (= lt!526098 e!664224)))

(declare-fun c!116516 () Bool)

(assert (=> d!131783 (= c!116516 (bvsge from!1455 (size!36927 _keys!1208)))))

(assert (=> d!131783 (validMask!0 mask!1564)))

(assert (=> d!131783 (= (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!526098)))

(declare-fun b!1168751 () Bool)

(assert (=> b!1168751 (= e!664222 e!664223)))

(declare-fun c!116514 () Bool)

(assert (=> b!1168751 (= c!116514 e!664226)))

(declare-fun res!775477 () Bool)

(assert (=> b!1168751 (=> (not res!775477) (not e!664226))))

(assert (=> b!1168751 (= res!775477 (bvslt from!1455 (size!36927 _keys!1208)))))

(declare-fun b!1168757 () Bool)

(assert (=> b!1168757 (= e!664224 e!664227)))

(declare-fun c!116517 () Bool)

(assert (=> b!1168757 (= c!116517 (validKeyInArray!0 (select (arr!36389 _keys!1208) from!1455)))))

(declare-fun b!1168758 () Bool)

(assert (=> b!1168758 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36927 _keys!1208)))))

(assert (=> b!1168758 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36928 _values!996)))))

(assert (=> b!1168758 (= e!664228 (= (apply!950 lt!526098 (select (arr!36389 _keys!1208) from!1455)) (get!18553 (select (arr!36390 _values!996) from!1455) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!131783 c!116516) b!1168750))

(assert (= (and d!131783 (not c!116516)) b!1168757))

(assert (= (and b!1168757 c!116517) b!1168756))

(assert (= (and b!1168757 (not c!116517)) b!1168752))

(assert (= (or b!1168756 b!1168752) bm!57078))

(assert (= (and d!131783 res!775479) b!1168754))

(assert (= (and b!1168754 res!775476) b!1168751))

(assert (= (and b!1168751 res!775477) b!1168753))

(assert (= (and b!1168751 c!116514) b!1168749))

(assert (= (and b!1168751 (not c!116514)) b!1168748))

(assert (= (and b!1168749 res!775478) b!1168758))

(assert (= (and b!1168748 c!116515) b!1168747))

(assert (= (and b!1168748 (not c!116515)) b!1168755))

(declare-fun b_lambda!19935 () Bool)

(assert (=> (not b_lambda!19935) (not b!1168756)))

(assert (=> b!1168756 t!37434))

(declare-fun b_and!40513 () Bool)

(assert (= b_and!40511 (and (=> t!37434 result!19851) b_and!40513)))

(declare-fun b_lambda!19937 () Bool)

(assert (=> (not b_lambda!19937) (not b!1168758)))

(assert (=> b!1168758 t!37434))

(declare-fun b_and!40515 () Bool)

(assert (= b_and!40513 (and (=> t!37434 result!19851) b_and!40515)))

(assert (=> b!1168753 m!1075949))

(assert (=> b!1168753 m!1075949))

(assert (=> b!1168753 m!1075963))

(assert (=> b!1168757 m!1075949))

(assert (=> b!1168757 m!1075949))

(assert (=> b!1168757 m!1075963))

(declare-fun m!1076135 () Bool)

(assert (=> b!1168754 m!1076135))

(declare-fun m!1076137 () Bool)

(assert (=> bm!57078 m!1076137))

(assert (=> b!1168756 m!1075949))

(assert (=> b!1168756 m!1075945))

(declare-fun m!1076139 () Bool)

(assert (=> b!1168756 m!1076139))

(assert (=> b!1168756 m!1075951))

(assert (=> b!1168756 m!1075951))

(assert (=> b!1168756 m!1075945))

(declare-fun m!1076141 () Bool)

(assert (=> b!1168756 m!1076141))

(declare-fun m!1076143 () Bool)

(assert (=> b!1168756 m!1076143))

(declare-fun m!1076145 () Bool)

(assert (=> b!1168756 m!1076145))

(assert (=> b!1168756 m!1076139))

(declare-fun m!1076147 () Bool)

(assert (=> b!1168756 m!1076147))

(assert (=> b!1168749 m!1075949))

(assert (=> b!1168749 m!1075949))

(declare-fun m!1076149 () Bool)

(assert (=> b!1168749 m!1076149))

(declare-fun m!1076151 () Bool)

(assert (=> d!131783 m!1076151))

(assert (=> d!131783 m!1075985))

(assert (=> b!1168747 m!1076137))

(declare-fun m!1076153 () Bool)

(assert (=> b!1168755 m!1076153))

(assert (=> b!1168758 m!1075949))

(assert (=> b!1168758 m!1075945))

(assert (=> b!1168758 m!1075951))

(assert (=> b!1168758 m!1075945))

(assert (=> b!1168758 m!1076141))

(assert (=> b!1168758 m!1075949))

(declare-fun m!1076155 () Bool)

(assert (=> b!1168758 m!1076155))

(assert (=> b!1168758 m!1075951))

(assert (=> b!1168583 d!131783))

(declare-fun b!1168759 () Bool)

(declare-fun e!664231 () Bool)

(declare-fun e!664230 () Bool)

(assert (=> b!1168759 (= e!664231 e!664230)))

(declare-fun lt!526104 () (_ BitVec 64))

(assert (=> b!1168759 (= lt!526104 (select (arr!36389 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!526103 () Unit!38391)

(assert (=> b!1168759 (= lt!526103 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!526104 #b00000000000000000000000000000000))))

(assert (=> b!1168759 (arrayContainsKey!0 _keys!1208 lt!526104 #b00000000000000000000000000000000)))

(declare-fun lt!526105 () Unit!38391)

(assert (=> b!1168759 (= lt!526105 lt!526103)))

(declare-fun res!775481 () Bool)

(assert (=> b!1168759 (= res!775481 (= (seekEntryOrOpen!0 (select (arr!36389 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9926 #b00000000000000000000000000000000)))))

(assert (=> b!1168759 (=> (not res!775481) (not e!664230))))

(declare-fun b!1168760 () Bool)

(declare-fun e!664229 () Bool)

(assert (=> b!1168760 (= e!664229 e!664231)))

(declare-fun c!116518 () Bool)

(assert (=> b!1168760 (= c!116518 (validKeyInArray!0 (select (arr!36389 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1168761 () Bool)

(declare-fun call!57082 () Bool)

(assert (=> b!1168761 (= e!664231 call!57082)))

(declare-fun b!1168762 () Bool)

(assert (=> b!1168762 (= e!664230 call!57082)))

(declare-fun d!131785 () Bool)

(declare-fun res!775480 () Bool)

(assert (=> d!131785 (=> res!775480 e!664229)))

(assert (=> d!131785 (= res!775480 (bvsge #b00000000000000000000000000000000 (size!36927 _keys!1208)))))

(assert (=> d!131785 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!664229)))

(declare-fun bm!57079 () Bool)

(assert (=> bm!57079 (= call!57082 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!131785 (not res!775480)) b!1168760))

(assert (= (and b!1168760 c!116518) b!1168759))

(assert (= (and b!1168760 (not c!116518)) b!1168761))

(assert (= (and b!1168759 res!775481) b!1168762))

(assert (= (or b!1168762 b!1168761) bm!57079))

(declare-fun m!1076157 () Bool)

(assert (=> b!1168759 m!1076157))

(declare-fun m!1076159 () Bool)

(assert (=> b!1168759 m!1076159))

(declare-fun m!1076161 () Bool)

(assert (=> b!1168759 m!1076161))

(assert (=> b!1168759 m!1076157))

(declare-fun m!1076163 () Bool)

(assert (=> b!1168759 m!1076163))

(assert (=> b!1168760 m!1076157))

(assert (=> b!1168760 m!1076157))

(declare-fun m!1076165 () Bool)

(assert (=> b!1168760 m!1076165))

(declare-fun m!1076167 () Bool)

(assert (=> bm!57079 m!1076167))

(assert (=> b!1168585 d!131785))

(declare-fun d!131787 () Bool)

(assert (=> d!131787 (= (validKeyInArray!0 (select (arr!36389 _keys!1208) from!1455)) (and (not (= (select (arr!36389 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!36389 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1168586 d!131787))

(declare-fun lt!526108 () ListLongMap!16871)

(declare-fun e!664235 () Bool)

(declare-fun b!1168763 () Bool)

(assert (=> b!1168763 (= e!664235 (= lt!526108 (getCurrentListMapNoExtraKeys!4927 lt!526004 lt!526000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1168764 () Bool)

(declare-fun e!664233 () Bool)

(assert (=> b!1168764 (= e!664233 e!664235)))

(declare-fun c!116520 () Bool)

(assert (=> b!1168764 (= c!116520 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 lt!526004)))))

(declare-fun b!1168765 () Bool)

(declare-fun e!664238 () Bool)

(assert (=> b!1168765 (= e!664233 e!664238)))

(assert (=> b!1168765 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 lt!526004)))))

(declare-fun res!775484 () Bool)

(assert (=> b!1168765 (= res!775484 (contains!6818 lt!526108 (select (arr!36389 lt!526004) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1168765 (=> (not res!775484) (not e!664238))))

(declare-fun b!1168766 () Bool)

(declare-fun e!664234 () ListLongMap!16871)

(assert (=> b!1168766 (= e!664234 (ListLongMap!16872 Nil!25614))))

(declare-fun b!1168768 () Bool)

(declare-fun e!664237 () ListLongMap!16871)

(declare-fun call!57083 () ListLongMap!16871)

(assert (=> b!1168768 (= e!664237 call!57083)))

(declare-fun b!1168769 () Bool)

(declare-fun e!664236 () Bool)

(assert (=> b!1168769 (= e!664236 (validKeyInArray!0 (select (arr!36389 lt!526004) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1168769 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!57080 () Bool)

(assert (=> bm!57080 (= call!57083 (getCurrentListMapNoExtraKeys!4927 lt!526004 lt!526000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1168770 () Bool)

(declare-fun res!775482 () Bool)

(declare-fun e!664232 () Bool)

(assert (=> b!1168770 (=> (not res!775482) (not e!664232))))

(assert (=> b!1168770 (= res!775482 (not (contains!6818 lt!526108 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1168771 () Bool)

(assert (=> b!1168771 (= e!664235 (isEmpty!982 lt!526108))))

(declare-fun b!1168772 () Bool)

(declare-fun lt!526107 () Unit!38391)

(declare-fun lt!526106 () Unit!38391)

(assert (=> b!1168772 (= lt!526107 lt!526106)))

(declare-fun lt!526111 () V!44281)

(declare-fun lt!526109 () (_ BitVec 64))

(declare-fun lt!526110 () ListLongMap!16871)

(declare-fun lt!526112 () (_ BitVec 64))

(assert (=> b!1168772 (not (contains!6818 (+!3777 lt!526110 (tuple2!18903 lt!526112 lt!526111)) lt!526109))))

(assert (=> b!1168772 (= lt!526106 (addStillNotContains!286 lt!526110 lt!526112 lt!526111 lt!526109))))

(assert (=> b!1168772 (= lt!526109 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1168772 (= lt!526111 (get!18553 (select (arr!36390 lt!526000) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1168772 (= lt!526112 (select (arr!36389 lt!526004) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1168772 (= lt!526110 call!57083)))

(assert (=> b!1168772 (= e!664237 (+!3777 call!57083 (tuple2!18903 (select (arr!36389 lt!526004) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18553 (select (arr!36390 lt!526000) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!131789 () Bool)

(assert (=> d!131789 e!664232))

(declare-fun res!775485 () Bool)

(assert (=> d!131789 (=> (not res!775485) (not e!664232))))

(assert (=> d!131789 (= res!775485 (not (contains!6818 lt!526108 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131789 (= lt!526108 e!664234)))

(declare-fun c!116521 () Bool)

(assert (=> d!131789 (= c!116521 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 lt!526004)))))

(assert (=> d!131789 (validMask!0 mask!1564)))

(assert (=> d!131789 (= (getCurrentListMapNoExtraKeys!4927 lt!526004 lt!526000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526108)))

(declare-fun b!1168767 () Bool)

(assert (=> b!1168767 (= e!664232 e!664233)))

(declare-fun c!116519 () Bool)

(assert (=> b!1168767 (= c!116519 e!664236)))

(declare-fun res!775483 () Bool)

(assert (=> b!1168767 (=> (not res!775483) (not e!664236))))

(assert (=> b!1168767 (= res!775483 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 lt!526004)))))

(declare-fun b!1168773 () Bool)

(assert (=> b!1168773 (= e!664234 e!664237)))

(declare-fun c!116522 () Bool)

(assert (=> b!1168773 (= c!116522 (validKeyInArray!0 (select (arr!36389 lt!526004) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1168774 () Bool)

(assert (=> b!1168774 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 lt!526004)))))

(assert (=> b!1168774 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36928 lt!526000)))))

(assert (=> b!1168774 (= e!664238 (= (apply!950 lt!526108 (select (arr!36389 lt!526004) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18553 (select (arr!36390 lt!526000) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!131789 c!116521) b!1168766))

(assert (= (and d!131789 (not c!116521)) b!1168773))

(assert (= (and b!1168773 c!116522) b!1168772))

(assert (= (and b!1168773 (not c!116522)) b!1168768))

(assert (= (or b!1168772 b!1168768) bm!57080))

(assert (= (and d!131789 res!775485) b!1168770))

(assert (= (and b!1168770 res!775482) b!1168767))

(assert (= (and b!1168767 res!775483) b!1168769))

(assert (= (and b!1168767 c!116519) b!1168765))

(assert (= (and b!1168767 (not c!116519)) b!1168764))

(assert (= (and b!1168765 res!775484) b!1168774))

(assert (= (and b!1168764 c!116520) b!1168763))

(assert (= (and b!1168764 (not c!116520)) b!1168771))

(declare-fun b_lambda!19939 () Bool)

(assert (=> (not b_lambda!19939) (not b!1168772)))

(assert (=> b!1168772 t!37434))

(declare-fun b_and!40517 () Bool)

(assert (= b_and!40515 (and (=> t!37434 result!19851) b_and!40517)))

(declare-fun b_lambda!19941 () Bool)

(assert (=> (not b_lambda!19941) (not b!1168774)))

(assert (=> b!1168774 t!37434))

(declare-fun b_and!40519 () Bool)

(assert (= b_and!40517 (and (=> t!37434 result!19851) b_and!40519)))

(declare-fun m!1076169 () Bool)

(assert (=> b!1168769 m!1076169))

(assert (=> b!1168769 m!1076169))

(declare-fun m!1076171 () Bool)

(assert (=> b!1168769 m!1076171))

(assert (=> b!1168773 m!1076169))

(assert (=> b!1168773 m!1076169))

(assert (=> b!1168773 m!1076171))

(declare-fun m!1076173 () Bool)

(assert (=> b!1168770 m!1076173))

(declare-fun m!1076175 () Bool)

(assert (=> bm!57080 m!1076175))

(assert (=> b!1168772 m!1076169))

(assert (=> b!1168772 m!1075945))

(declare-fun m!1076177 () Bool)

(assert (=> b!1168772 m!1076177))

(declare-fun m!1076179 () Bool)

(assert (=> b!1168772 m!1076179))

(assert (=> b!1168772 m!1076179))

(assert (=> b!1168772 m!1075945))

(declare-fun m!1076181 () Bool)

(assert (=> b!1168772 m!1076181))

(declare-fun m!1076183 () Bool)

(assert (=> b!1168772 m!1076183))

(declare-fun m!1076185 () Bool)

(assert (=> b!1168772 m!1076185))

(assert (=> b!1168772 m!1076177))

(declare-fun m!1076187 () Bool)

(assert (=> b!1168772 m!1076187))

(assert (=> b!1168765 m!1076169))

(assert (=> b!1168765 m!1076169))

(declare-fun m!1076189 () Bool)

(assert (=> b!1168765 m!1076189))

(declare-fun m!1076191 () Bool)

(assert (=> d!131789 m!1076191))

(assert (=> d!131789 m!1075985))

(assert (=> b!1168763 m!1076175))

(declare-fun m!1076193 () Bool)

(assert (=> b!1168771 m!1076193))

(assert (=> b!1168774 m!1076169))

(assert (=> b!1168774 m!1075945))

(assert (=> b!1168774 m!1076179))

(assert (=> b!1168774 m!1075945))

(assert (=> b!1168774 m!1076181))

(assert (=> b!1168774 m!1076169))

(declare-fun m!1076195 () Bool)

(assert (=> b!1168774 m!1076195))

(assert (=> b!1168774 m!1076179))

(assert (=> b!1168586 d!131789))

(declare-fun b!1168781 () Bool)

(declare-fun e!664243 () Bool)

(declare-fun call!57088 () ListLongMap!16871)

(declare-fun call!57089 () ListLongMap!16871)

(assert (=> b!1168781 (= e!664243 (= call!57088 call!57089))))

(assert (=> b!1168781 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36928 _values!996)))))

(declare-fun d!131791 () Bool)

(declare-fun e!664244 () Bool)

(assert (=> d!131791 e!664244))

(declare-fun res!775488 () Bool)

(assert (=> d!131791 (=> (not res!775488) (not e!664244))))

(assert (=> d!131791 (= res!775488 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36927 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36927 _keys!1208))))))))

(declare-fun lt!526115 () Unit!38391)

(declare-fun choose!1791 (array!75476 array!75478 (_ BitVec 32) (_ BitVec 32) V!44281 V!44281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38391)

(assert (=> d!131791 (= lt!526115 (choose!1791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131791 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 _keys!1208)))))

(assert (=> d!131791 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526115)))

(declare-fun bm!57085 () Bool)

(assert (=> bm!57085 (= call!57088 (getCurrentListMapNoExtraKeys!4927 (array!75477 (store (arr!36389 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36927 _keys!1208)) (array!75479 (store (arr!36390 _values!996) i!673 (ValueCellFull!13973 (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36928 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57086 () Bool)

(assert (=> bm!57086 (= call!57089 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168782 () Bool)

(assert (=> b!1168782 (= e!664243 (= call!57088 (-!1458 call!57089 k0!934)))))

(assert (=> b!1168782 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36928 _values!996)))))

(declare-fun b!1168783 () Bool)

(assert (=> b!1168783 (= e!664244 e!664243)))

(declare-fun c!116525 () Bool)

(assert (=> b!1168783 (= c!116525 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!131791 res!775488) b!1168783))

(assert (= (and b!1168783 c!116525) b!1168782))

(assert (= (and b!1168783 (not c!116525)) b!1168781))

(assert (= (or b!1168782 b!1168781) bm!57086))

(assert (= (or b!1168782 b!1168781) bm!57085))

(declare-fun b_lambda!19943 () Bool)

(assert (=> (not b_lambda!19943) (not bm!57085)))

(assert (=> bm!57085 t!37434))

(declare-fun b_and!40521 () Bool)

(assert (= b_and!40519 (and (=> t!37434 result!19851) b_and!40521)))

(declare-fun m!1076197 () Bool)

(assert (=> d!131791 m!1076197))

(assert (=> bm!57085 m!1075971))

(assert (=> bm!57085 m!1075945))

(declare-fun m!1076199 () Bool)

(assert (=> bm!57085 m!1076199))

(declare-fun m!1076201 () Bool)

(assert (=> bm!57085 m!1076201))

(assert (=> bm!57086 m!1075957))

(declare-fun m!1076203 () Bool)

(assert (=> b!1168782 m!1076203))

(assert (=> b!1168586 d!131791))

(declare-fun e!664248 () Bool)

(declare-fun b!1168784 () Bool)

(declare-fun lt!526118 () ListLongMap!16871)

(assert (=> b!1168784 (= e!664248 (= lt!526118 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1168785 () Bool)

(declare-fun e!664246 () Bool)

(assert (=> b!1168785 (= e!664246 e!664248)))

(declare-fun c!116527 () Bool)

(assert (=> b!1168785 (= c!116527 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 _keys!1208)))))

(declare-fun b!1168786 () Bool)

(declare-fun e!664251 () Bool)

(assert (=> b!1168786 (= e!664246 e!664251)))

(assert (=> b!1168786 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 _keys!1208)))))

(declare-fun res!775491 () Bool)

(assert (=> b!1168786 (= res!775491 (contains!6818 lt!526118 (select (arr!36389 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1168786 (=> (not res!775491) (not e!664251))))

(declare-fun b!1168787 () Bool)

(declare-fun e!664247 () ListLongMap!16871)

(assert (=> b!1168787 (= e!664247 (ListLongMap!16872 Nil!25614))))

(declare-fun b!1168789 () Bool)

(declare-fun e!664250 () ListLongMap!16871)

(declare-fun call!57090 () ListLongMap!16871)

(assert (=> b!1168789 (= e!664250 call!57090)))

(declare-fun b!1168790 () Bool)

(declare-fun e!664249 () Bool)

(assert (=> b!1168790 (= e!664249 (validKeyInArray!0 (select (arr!36389 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1168790 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!57087 () Bool)

(assert (=> bm!57087 (= call!57090 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1168791 () Bool)

(declare-fun res!775489 () Bool)

(declare-fun e!664245 () Bool)

(assert (=> b!1168791 (=> (not res!775489) (not e!664245))))

(assert (=> b!1168791 (= res!775489 (not (contains!6818 lt!526118 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1168792 () Bool)

(assert (=> b!1168792 (= e!664248 (isEmpty!982 lt!526118))))

(declare-fun b!1168793 () Bool)

(declare-fun lt!526117 () Unit!38391)

(declare-fun lt!526116 () Unit!38391)

(assert (=> b!1168793 (= lt!526117 lt!526116)))

(declare-fun lt!526120 () ListLongMap!16871)

(declare-fun lt!526122 () (_ BitVec 64))

(declare-fun lt!526121 () V!44281)

(declare-fun lt!526119 () (_ BitVec 64))

(assert (=> b!1168793 (not (contains!6818 (+!3777 lt!526120 (tuple2!18903 lt!526122 lt!526121)) lt!526119))))

(assert (=> b!1168793 (= lt!526116 (addStillNotContains!286 lt!526120 lt!526122 lt!526121 lt!526119))))

(assert (=> b!1168793 (= lt!526119 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1168793 (= lt!526121 (get!18553 (select (arr!36390 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1168793 (= lt!526122 (select (arr!36389 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1168793 (= lt!526120 call!57090)))

(assert (=> b!1168793 (= e!664250 (+!3777 call!57090 (tuple2!18903 (select (arr!36389 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18553 (select (arr!36390 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!131793 () Bool)

(assert (=> d!131793 e!664245))

(declare-fun res!775492 () Bool)

(assert (=> d!131793 (=> (not res!775492) (not e!664245))))

(assert (=> d!131793 (= res!775492 (not (contains!6818 lt!526118 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131793 (= lt!526118 e!664247)))

(declare-fun c!116528 () Bool)

(assert (=> d!131793 (= c!116528 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 _keys!1208)))))

(assert (=> d!131793 (validMask!0 mask!1564)))

(assert (=> d!131793 (= (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526118)))

(declare-fun b!1168788 () Bool)

(assert (=> b!1168788 (= e!664245 e!664246)))

(declare-fun c!116526 () Bool)

(assert (=> b!1168788 (= c!116526 e!664249)))

(declare-fun res!775490 () Bool)

(assert (=> b!1168788 (=> (not res!775490) (not e!664249))))

(assert (=> b!1168788 (= res!775490 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 _keys!1208)))))

(declare-fun b!1168794 () Bool)

(assert (=> b!1168794 (= e!664247 e!664250)))

(declare-fun c!116529 () Bool)

(assert (=> b!1168794 (= c!116529 (validKeyInArray!0 (select (arr!36389 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1168795 () Bool)

(assert (=> b!1168795 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36927 _keys!1208)))))

(assert (=> b!1168795 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36928 _values!996)))))

(assert (=> b!1168795 (= e!664251 (= (apply!950 lt!526118 (select (arr!36389 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18553 (select (arr!36390 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!131793 c!116528) b!1168787))

(assert (= (and d!131793 (not c!116528)) b!1168794))

(assert (= (and b!1168794 c!116529) b!1168793))

(assert (= (and b!1168794 (not c!116529)) b!1168789))

(assert (= (or b!1168793 b!1168789) bm!57087))

(assert (= (and d!131793 res!775492) b!1168791))

(assert (= (and b!1168791 res!775489) b!1168788))

(assert (= (and b!1168788 res!775490) b!1168790))

(assert (= (and b!1168788 c!116526) b!1168786))

(assert (= (and b!1168788 (not c!116526)) b!1168785))

(assert (= (and b!1168786 res!775491) b!1168795))

(assert (= (and b!1168785 c!116527) b!1168784))

(assert (= (and b!1168785 (not c!116527)) b!1168792))

(declare-fun b_lambda!19945 () Bool)

(assert (=> (not b_lambda!19945) (not b!1168793)))

(assert (=> b!1168793 t!37434))

(declare-fun b_and!40523 () Bool)

(assert (= b_and!40521 (and (=> t!37434 result!19851) b_and!40523)))

(declare-fun b_lambda!19947 () Bool)

(assert (=> (not b_lambda!19947) (not b!1168795)))

(assert (=> b!1168795 t!37434))

(declare-fun b_and!40525 () Bool)

(assert (= b_and!40523 (and (=> t!37434 result!19851) b_and!40525)))

(declare-fun m!1076205 () Bool)

(assert (=> b!1168790 m!1076205))

(assert (=> b!1168790 m!1076205))

(declare-fun m!1076207 () Bool)

(assert (=> b!1168790 m!1076207))

(assert (=> b!1168794 m!1076205))

(assert (=> b!1168794 m!1076205))

(assert (=> b!1168794 m!1076207))

(declare-fun m!1076209 () Bool)

(assert (=> b!1168791 m!1076209))

(declare-fun m!1076211 () Bool)

(assert (=> bm!57087 m!1076211))

(assert (=> b!1168793 m!1076205))

(assert (=> b!1168793 m!1075945))

(declare-fun m!1076213 () Bool)

(assert (=> b!1168793 m!1076213))

(declare-fun m!1076215 () Bool)

(assert (=> b!1168793 m!1076215))

(assert (=> b!1168793 m!1076215))

(assert (=> b!1168793 m!1075945))

(declare-fun m!1076217 () Bool)

(assert (=> b!1168793 m!1076217))

(declare-fun m!1076219 () Bool)

(assert (=> b!1168793 m!1076219))

(declare-fun m!1076221 () Bool)

(assert (=> b!1168793 m!1076221))

(assert (=> b!1168793 m!1076213))

(declare-fun m!1076223 () Bool)

(assert (=> b!1168793 m!1076223))

(assert (=> b!1168786 m!1076205))

(assert (=> b!1168786 m!1076205))

(declare-fun m!1076225 () Bool)

(assert (=> b!1168786 m!1076225))

(declare-fun m!1076227 () Bool)

(assert (=> d!131793 m!1076227))

(assert (=> d!131793 m!1075985))

(assert (=> b!1168784 m!1076211))

(declare-fun m!1076229 () Bool)

(assert (=> b!1168792 m!1076229))

(assert (=> b!1168795 m!1076205))

(assert (=> b!1168795 m!1075945))

(assert (=> b!1168795 m!1076215))

(assert (=> b!1168795 m!1075945))

(assert (=> b!1168795 m!1076217))

(assert (=> b!1168795 m!1076205))

(declare-fun m!1076231 () Bool)

(assert (=> b!1168795 m!1076231))

(assert (=> b!1168795 m!1076215))

(assert (=> b!1168586 d!131793))

(declare-fun d!131795 () Bool)

(declare-fun lt!526125 () ListLongMap!16871)

(assert (=> d!131795 (not (contains!6818 lt!526125 k0!934))))

(declare-fun removeStrictlySorted!91 (List!25617 (_ BitVec 64)) List!25617)

(assert (=> d!131795 (= lt!526125 (ListLongMap!16872 (removeStrictlySorted!91 (toList!8451 lt!525999) k0!934)))))

(assert (=> d!131795 (= (-!1458 lt!525999 k0!934) lt!526125)))

(declare-fun bs!33405 () Bool)

(assert (= bs!33405 d!131795))

(declare-fun m!1076233 () Bool)

(assert (=> bs!33405 m!1076233))

(declare-fun m!1076235 () Bool)

(assert (=> bs!33405 m!1076235))

(assert (=> b!1168586 d!131795))

(declare-fun d!131797 () Bool)

(declare-fun e!664254 () Bool)

(assert (=> d!131797 e!664254))

(declare-fun res!775497 () Bool)

(assert (=> d!131797 (=> (not res!775497) (not e!664254))))

(declare-fun lt!526137 () ListLongMap!16871)

(assert (=> d!131797 (= res!775497 (contains!6818 lt!526137 (_1!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002)))))))

(declare-fun lt!526136 () List!25617)

(assert (=> d!131797 (= lt!526137 (ListLongMap!16872 lt!526136))))

(declare-fun lt!526135 () Unit!38391)

(declare-fun lt!526134 () Unit!38391)

(assert (=> d!131797 (= lt!526135 lt!526134)))

(declare-datatypes ((Option!683 0))(
  ( (Some!682 (v!17378 V!44281)) (None!681) )
))
(declare-fun getValueByKey!632 (List!25617 (_ BitVec 64)) Option!683)

(assert (=> d!131797 (= (getValueByKey!632 lt!526136 (_1!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002)))) (Some!682 (_2!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!308 (List!25617 (_ BitVec 64) V!44281) Unit!38391)

(assert (=> d!131797 (= lt!526134 (lemmaContainsTupThenGetReturnValue!308 lt!526136 (_1!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002))) (_2!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002)))))))

(declare-fun insertStrictlySorted!401 (List!25617 (_ BitVec 64) V!44281) List!25617)

(assert (=> d!131797 (= lt!526136 (insertStrictlySorted!401 (toList!8451 lt!525997) (_1!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002))) (_2!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002)))))))

(assert (=> d!131797 (= (+!3777 lt!525997 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002))) lt!526137)))

(declare-fun b!1168800 () Bool)

(declare-fun res!775498 () Bool)

(assert (=> b!1168800 (=> (not res!775498) (not e!664254))))

(assert (=> b!1168800 (= res!775498 (= (getValueByKey!632 (toList!8451 lt!526137) (_1!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002)))) (Some!682 (_2!9462 (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002))))))))

(declare-fun b!1168801 () Bool)

(declare-fun contains!6819 (List!25617 tuple2!18902) Bool)

(assert (=> b!1168801 (= e!664254 (contains!6819 (toList!8451 lt!526137) (tuple2!18903 (select (arr!36389 _keys!1208) from!1455) (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002))))))

(assert (= (and d!131797 res!775497) b!1168800))

(assert (= (and b!1168800 res!775498) b!1168801))

(declare-fun m!1076237 () Bool)

(assert (=> d!131797 m!1076237))

(declare-fun m!1076239 () Bool)

(assert (=> d!131797 m!1076239))

(declare-fun m!1076241 () Bool)

(assert (=> d!131797 m!1076241))

(declare-fun m!1076243 () Bool)

(assert (=> d!131797 m!1076243))

(declare-fun m!1076245 () Bool)

(assert (=> b!1168800 m!1076245))

(declare-fun m!1076247 () Bool)

(assert (=> b!1168801 m!1076247))

(assert (=> b!1168595 d!131797))

(declare-fun d!131799 () Bool)

(declare-fun c!116532 () Bool)

(assert (=> d!131799 (= c!116532 ((_ is ValueCellFull!13973) (select (arr!36390 _values!996) from!1455)))))

(declare-fun e!664257 () V!44281)

(assert (=> d!131799 (= (get!18553 (select (arr!36390 _values!996) from!1455) lt!526002) e!664257)))

(declare-fun b!1168806 () Bool)

(declare-fun get!18555 (ValueCell!13973 V!44281) V!44281)

(assert (=> b!1168806 (= e!664257 (get!18555 (select (arr!36390 _values!996) from!1455) lt!526002))))

(declare-fun b!1168807 () Bool)

(declare-fun get!18556 (ValueCell!13973 V!44281) V!44281)

(assert (=> b!1168807 (= e!664257 (get!18556 (select (arr!36390 _values!996) from!1455) lt!526002))))

(assert (= (and d!131799 c!116532) b!1168806))

(assert (= (and d!131799 (not c!116532)) b!1168807))

(assert (=> b!1168806 m!1075951))

(declare-fun m!1076249 () Bool)

(assert (=> b!1168806 m!1076249))

(assert (=> b!1168807 m!1075951))

(declare-fun m!1076251 () Bool)

(assert (=> b!1168807 m!1076251))

(assert (=> b!1168595 d!131799))

(declare-fun d!131801 () Bool)

(declare-fun res!775507 () Bool)

(declare-fun e!664267 () Bool)

(assert (=> d!131801 (=> res!775507 e!664267)))

(assert (=> d!131801 (= res!775507 (bvsge #b00000000000000000000000000000000 (size!36927 _keys!1208)))))

(assert (=> d!131801 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25615) e!664267)))

(declare-fun b!1168818 () Bool)

(declare-fun e!664269 () Bool)

(declare-fun call!57093 () Bool)

(assert (=> b!1168818 (= e!664269 call!57093)))

(declare-fun b!1168819 () Bool)

(assert (=> b!1168819 (= e!664269 call!57093)))

(declare-fun bm!57090 () Bool)

(declare-fun c!116535 () Bool)

(assert (=> bm!57090 (= call!57093 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!116535 (Cons!25614 (select (arr!36389 _keys!1208) #b00000000000000000000000000000000) Nil!25615) Nil!25615)))))

(declare-fun b!1168820 () Bool)

(declare-fun e!664268 () Bool)

(assert (=> b!1168820 (= e!664267 e!664268)))

(declare-fun res!775506 () Bool)

(assert (=> b!1168820 (=> (not res!775506) (not e!664268))))

(declare-fun e!664266 () Bool)

(assert (=> b!1168820 (= res!775506 (not e!664266))))

(declare-fun res!775505 () Bool)

(assert (=> b!1168820 (=> (not res!775505) (not e!664266))))

(assert (=> b!1168820 (= res!775505 (validKeyInArray!0 (select (arr!36389 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1168821 () Bool)

(assert (=> b!1168821 (= e!664268 e!664269)))

(assert (=> b!1168821 (= c!116535 (validKeyInArray!0 (select (arr!36389 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1168822 () Bool)

(declare-fun contains!6820 (List!25618 (_ BitVec 64)) Bool)

(assert (=> b!1168822 (= e!664266 (contains!6820 Nil!25615 (select (arr!36389 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131801 (not res!775507)) b!1168820))

(assert (= (and b!1168820 res!775505) b!1168822))

(assert (= (and b!1168820 res!775506) b!1168821))

(assert (= (and b!1168821 c!116535) b!1168819))

(assert (= (and b!1168821 (not c!116535)) b!1168818))

(assert (= (or b!1168819 b!1168818) bm!57090))

(assert (=> bm!57090 m!1076157))

(declare-fun m!1076253 () Bool)

(assert (=> bm!57090 m!1076253))

(assert (=> b!1168820 m!1076157))

(assert (=> b!1168820 m!1076157))

(assert (=> b!1168820 m!1076165))

(assert (=> b!1168821 m!1076157))

(assert (=> b!1168821 m!1076157))

(assert (=> b!1168821 m!1076165))

(assert (=> b!1168822 m!1076157))

(assert (=> b!1168822 m!1076157))

(declare-fun m!1076255 () Bool)

(assert (=> b!1168822 m!1076255))

(assert (=> b!1168587 d!131801))

(declare-fun d!131803 () Bool)

(declare-fun res!775512 () Bool)

(declare-fun e!664274 () Bool)

(assert (=> d!131803 (=> res!775512 e!664274)))

(assert (=> d!131803 (= res!775512 (= (select (arr!36389 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!131803 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!664274)))

(declare-fun b!1168827 () Bool)

(declare-fun e!664275 () Bool)

(assert (=> b!1168827 (= e!664274 e!664275)))

(declare-fun res!775513 () Bool)

(assert (=> b!1168827 (=> (not res!775513) (not e!664275))))

(assert (=> b!1168827 (= res!775513 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36927 _keys!1208)))))

(declare-fun b!1168828 () Bool)

(assert (=> b!1168828 (= e!664275 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131803 (not res!775512)) b!1168827))

(assert (= (and b!1168827 res!775513) b!1168828))

(assert (=> d!131803 m!1076157))

(declare-fun m!1076257 () Bool)

(assert (=> b!1168828 m!1076257))

(assert (=> b!1168588 d!131803))

(declare-fun d!131805 () Bool)

(assert (=> d!131805 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526140 () Unit!38391)

(declare-fun choose!13 (array!75476 (_ BitVec 64) (_ BitVec 32)) Unit!38391)

(assert (=> d!131805 (= lt!526140 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!131805 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!131805 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!526140)))

(declare-fun bs!33406 () Bool)

(assert (= bs!33406 d!131805))

(assert (=> bs!33406 m!1075979))

(declare-fun m!1076259 () Bool)

(assert (=> bs!33406 m!1076259))

(assert (=> b!1168588 d!131805))

(declare-fun d!131807 () Bool)

(declare-fun res!775516 () Bool)

(declare-fun e!664277 () Bool)

(assert (=> d!131807 (=> res!775516 e!664277)))

(assert (=> d!131807 (= res!775516 (bvsge #b00000000000000000000000000000000 (size!36927 lt!526004)))))

(assert (=> d!131807 (= (arrayNoDuplicates!0 lt!526004 #b00000000000000000000000000000000 Nil!25615) e!664277)))

(declare-fun b!1168829 () Bool)

(declare-fun e!664279 () Bool)

(declare-fun call!57094 () Bool)

(assert (=> b!1168829 (= e!664279 call!57094)))

(declare-fun b!1168830 () Bool)

(assert (=> b!1168830 (= e!664279 call!57094)))

(declare-fun bm!57091 () Bool)

(declare-fun c!116536 () Bool)

(assert (=> bm!57091 (= call!57094 (arrayNoDuplicates!0 lt!526004 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!116536 (Cons!25614 (select (arr!36389 lt!526004) #b00000000000000000000000000000000) Nil!25615) Nil!25615)))))

(declare-fun b!1168831 () Bool)

(declare-fun e!664278 () Bool)

(assert (=> b!1168831 (= e!664277 e!664278)))

(declare-fun res!775515 () Bool)

(assert (=> b!1168831 (=> (not res!775515) (not e!664278))))

(declare-fun e!664276 () Bool)

(assert (=> b!1168831 (= res!775515 (not e!664276))))

(declare-fun res!775514 () Bool)

(assert (=> b!1168831 (=> (not res!775514) (not e!664276))))

(assert (=> b!1168831 (= res!775514 (validKeyInArray!0 (select (arr!36389 lt!526004) #b00000000000000000000000000000000)))))

(declare-fun b!1168832 () Bool)

(assert (=> b!1168832 (= e!664278 e!664279)))

(assert (=> b!1168832 (= c!116536 (validKeyInArray!0 (select (arr!36389 lt!526004) #b00000000000000000000000000000000)))))

(declare-fun b!1168833 () Bool)

(assert (=> b!1168833 (= e!664276 (contains!6820 Nil!25615 (select (arr!36389 lt!526004) #b00000000000000000000000000000000)))))

(assert (= (and d!131807 (not res!775516)) b!1168831))

(assert (= (and b!1168831 res!775514) b!1168833))

(assert (= (and b!1168831 res!775515) b!1168832))

(assert (= (and b!1168832 c!116536) b!1168830))

(assert (= (and b!1168832 (not c!116536)) b!1168829))

(assert (= (or b!1168830 b!1168829) bm!57091))

(assert (=> bm!57091 m!1076095))

(declare-fun m!1076261 () Bool)

(assert (=> bm!57091 m!1076261))

(assert (=> b!1168831 m!1076095))

(assert (=> b!1168831 m!1076095))

(assert (=> b!1168831 m!1076103))

(assert (=> b!1168832 m!1076095))

(assert (=> b!1168832 m!1076095))

(assert (=> b!1168832 m!1076103))

(assert (=> b!1168833 m!1076095))

(assert (=> b!1168833 m!1076095))

(declare-fun m!1076263 () Bool)

(assert (=> b!1168833 m!1076263))

(assert (=> b!1168590 d!131807))

(declare-fun b!1168840 () Bool)

(declare-fun e!664285 () Bool)

(assert (=> b!1168840 (= e!664285 tp_is_empty!29365)))

(declare-fun mapIsEmpty!45881 () Bool)

(declare-fun mapRes!45881 () Bool)

(assert (=> mapIsEmpty!45881 mapRes!45881))

(declare-fun condMapEmpty!45881 () Bool)

(declare-fun mapDefault!45881 () ValueCell!13973)

(assert (=> mapNonEmpty!45872 (= condMapEmpty!45881 (= mapRest!45872 ((as const (Array (_ BitVec 32) ValueCell!13973)) mapDefault!45881)))))

(declare-fun e!664284 () Bool)

(assert (=> mapNonEmpty!45872 (= tp!87215 (and e!664284 mapRes!45881))))

(declare-fun mapNonEmpty!45881 () Bool)

(declare-fun tp!87231 () Bool)

(assert (=> mapNonEmpty!45881 (= mapRes!45881 (and tp!87231 e!664285))))

(declare-fun mapKey!45881 () (_ BitVec 32))

(declare-fun mapRest!45881 () (Array (_ BitVec 32) ValueCell!13973))

(declare-fun mapValue!45881 () ValueCell!13973)

(assert (=> mapNonEmpty!45881 (= mapRest!45872 (store mapRest!45881 mapKey!45881 mapValue!45881))))

(declare-fun b!1168841 () Bool)

(assert (=> b!1168841 (= e!664284 tp_is_empty!29365)))

(assert (= (and mapNonEmpty!45872 condMapEmpty!45881) mapIsEmpty!45881))

(assert (= (and mapNonEmpty!45872 (not condMapEmpty!45881)) mapNonEmpty!45881))

(assert (= (and mapNonEmpty!45881 ((_ is ValueCellFull!13973) mapValue!45881)) b!1168840))

(assert (= (and mapNonEmpty!45872 ((_ is ValueCellFull!13973) mapDefault!45881)) b!1168841))

(declare-fun m!1076265 () Bool)

(assert (=> mapNonEmpty!45881 m!1076265))

(declare-fun b_lambda!19949 () Bool)

(assert (= b_lambda!19945 (or (and start!99224 b_free!24835) b_lambda!19949)))

(declare-fun b_lambda!19951 () Bool)

(assert (= b_lambda!19947 (or (and start!99224 b_free!24835) b_lambda!19951)))

(declare-fun b_lambda!19953 () Bool)

(assert (= b_lambda!19937 (or (and start!99224 b_free!24835) b_lambda!19953)))

(declare-fun b_lambda!19955 () Bool)

(assert (= b_lambda!19939 (or (and start!99224 b_free!24835) b_lambda!19955)))

(declare-fun b_lambda!19957 () Bool)

(assert (= b_lambda!19941 (or (and start!99224 b_free!24835) b_lambda!19957)))

(declare-fun b_lambda!19959 () Bool)

(assert (= b_lambda!19935 (or (and start!99224 b_free!24835) b_lambda!19959)))

(declare-fun b_lambda!19961 () Bool)

(assert (= b_lambda!19933 (or (and start!99224 b_free!24835) b_lambda!19961)))

(declare-fun b_lambda!19963 () Bool)

(assert (= b_lambda!19943 (or (and start!99224 b_free!24835) b_lambda!19963)))

(declare-fun b_lambda!19965 () Bool)

(assert (= b_lambda!19931 (or (and start!99224 b_free!24835) b_lambda!19965)))

(check-sat (not b!1168793) (not b!1168743) (not d!131797) (not b!1168795) (not b!1168741) (not d!131789) (not bm!57087) (not b!1168786) (not b_lambda!19955) (not b!1168832) tp_is_empty!29365 (not b_lambda!19959) (not b!1168760) (not b_lambda!19929) (not bm!57077) (not b!1168784) (not b!1168755) (not b!1168794) (not b!1168791) (not b!1168806) (not b!1168821) (not bm!57085) (not b!1168765) (not b!1168831) (not b_lambda!19949) (not b!1168737) (not d!131783) b_and!40525 (not b_lambda!19953) (not bm!57079) (not b!1168749) (not bm!57078) (not b!1168707) (not d!131793) (not b!1168746) (not b!1168753) (not b!1168782) (not mapNonEmpty!45881) (not b!1168773) (not d!131781) (not b!1168833) (not b!1168772) (not b!1168807) (not bm!57074) (not b!1168774) (not b!1168735) (not b!1168790) (not b!1168758) (not b!1168757) (not bm!57086) (not b_next!24835) (not b!1168744) (not b_lambda!19965) (not b!1168828) (not b!1168747) (not b!1168745) (not d!131805) (not d!131791) (not b!1168759) (not b_lambda!19957) (not b!1168822) (not b!1168771) (not b!1168769) (not b!1168708) (not b!1168754) (not b_lambda!19961) (not bm!57090) (not b_lambda!19951) (not bm!57091) (not b!1168801) (not b!1168800) (not b_lambda!19963) (not b!1168792) (not b!1168820) (not d!131795) (not b!1168742) (not bm!57080) (not b!1168770) (not b!1168763) (not b!1168756))
(check-sat b_and!40525 (not b_next!24835))
