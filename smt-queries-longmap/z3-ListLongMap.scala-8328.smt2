; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101362 () Bool)

(assert start!101362)

(declare-fun b_free!26239 () Bool)

(declare-fun b_next!26239 () Bool)

(assert (=> start!101362 (= b_free!26239 (not b_next!26239))))

(declare-fun tp!91744 () Bool)

(declare-fun b_and!43613 () Bool)

(assert (=> start!101362 (= tp!91744 b_and!43613)))

(declare-fun res!808815 () Bool)

(declare-fun e!691449 () Bool)

(assert (=> start!101362 (=> (not res!808815) (not e!691449))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78580 0))(
  ( (array!78581 (arr!37923 (Array (_ BitVec 32) (_ BitVec 64))) (size!38461 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78580)

(assert (=> start!101362 (= res!808815 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38461 _keys!1208))))))

(assert (=> start!101362 e!691449))

(declare-fun tp_is_empty!30943 () Bool)

(assert (=> start!101362 tp_is_empty!30943))

(declare-fun array_inv!28988 (array!78580) Bool)

(assert (=> start!101362 (array_inv!28988 _keys!1208)))

(assert (=> start!101362 true))

(assert (=> start!101362 tp!91744))

(declare-datatypes ((V!46385 0))(
  ( (V!46386 (val!15528 Int)) )
))
(declare-datatypes ((ValueCell!14762 0))(
  ( (ValueCellFull!14762 (v!18182 V!46385)) (EmptyCell!14762) )
))
(declare-datatypes ((array!78582 0))(
  ( (array!78583 (arr!37924 (Array (_ BitVec 32) ValueCell!14762)) (size!38462 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78582)

(declare-fun e!691444 () Bool)

(declare-fun array_inv!28989 (array!78582) Bool)

(assert (=> start!101362 (and (array_inv!28989 _values!996) e!691444)))

(declare-fun b!1217890 () Bool)

(declare-fun e!691445 () Bool)

(assert (=> b!1217890 (= e!691445 true)))

(declare-fun e!691446 () Bool)

(assert (=> b!1217890 e!691446))

(declare-fun res!808820 () Bool)

(assert (=> b!1217890 (=> (not res!808820) (not e!691446))))

(declare-fun lt!553481 () V!46385)

(declare-datatypes ((tuple2!20060 0))(
  ( (tuple2!20061 (_1!10041 (_ BitVec 64)) (_2!10041 V!46385)) )
))
(declare-datatypes ((List!26838 0))(
  ( (Nil!26835) (Cons!26834 (h!28043 tuple2!20060) (t!40048 List!26838)) )
))
(declare-datatypes ((ListLongMap!18029 0))(
  ( (ListLongMap!18030 (toList!9030 List!26838)) )
))
(declare-fun lt!553476 () ListLongMap!18029)

(declare-fun lt!553479 () ListLongMap!18029)

(declare-fun +!4098 (ListLongMap!18029 tuple2!20060) ListLongMap!18029)

(declare-fun get!19341 (ValueCell!14762 V!46385) V!46385)

(assert (=> b!1217890 (= res!808820 (= lt!553476 (+!4098 lt!553479 (tuple2!20061 (select (arr!37923 _keys!1208) from!1455) (get!19341 (select (arr!37924 _values!996) from!1455) lt!553481)))))))

(declare-fun b!1217891 () Bool)

(declare-fun res!808813 () Bool)

(declare-fun e!691442 () Bool)

(assert (=> b!1217891 (=> (not res!808813) (not e!691442))))

(declare-fun lt!553474 () array!78580)

(declare-datatypes ((List!26839 0))(
  ( (Nil!26836) (Cons!26835 (h!28044 (_ BitVec 64)) (t!40049 List!26839)) )
))
(declare-fun arrayNoDuplicates!0 (array!78580 (_ BitVec 32) List!26839) Bool)

(assert (=> b!1217891 (= res!808813 (arrayNoDuplicates!0 lt!553474 #b00000000000000000000000000000000 Nil!26836))))

(declare-fun b!1217892 () Bool)

(declare-fun res!808825 () Bool)

(assert (=> b!1217892 (=> (not res!808825) (not e!691449))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1217892 (= res!808825 (and (= (size!38462 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38461 _keys!1208) (size!38462 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217893 () Bool)

(declare-fun res!808819 () Bool)

(assert (=> b!1217893 (=> (not res!808819) (not e!691449))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217893 (= res!808819 (validKeyInArray!0 k0!934))))

(declare-fun b!1217894 () Bool)

(declare-fun res!808816 () Bool)

(assert (=> b!1217894 (=> (not res!808816) (not e!691449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217894 (= res!808816 (validMask!0 mask!1564))))

(declare-fun b!1217895 () Bool)

(declare-fun e!691450 () Bool)

(assert (=> b!1217895 (= e!691442 (not e!691450))))

(declare-fun res!808814 () Bool)

(assert (=> b!1217895 (=> res!808814 e!691450)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217895 (= res!808814 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217895 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40231 0))(
  ( (Unit!40232) )
))
(declare-fun lt!553480 () Unit!40231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78580 (_ BitVec 64) (_ BitVec 32)) Unit!40231)

(assert (=> b!1217895 (= lt!553480 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217896 () Bool)

(declare-fun e!691441 () Bool)

(assert (=> b!1217896 (= e!691446 e!691441)))

(declare-fun res!808812 () Bool)

(assert (=> b!1217896 (=> res!808812 e!691441)))

(assert (=> b!1217896 (= res!808812 (not (= (select (arr!37923 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!48295 () Bool)

(declare-fun mapRes!48295 () Bool)

(declare-fun tp!91745 () Bool)

(declare-fun e!691451 () Bool)

(assert (=> mapNonEmpty!48295 (= mapRes!48295 (and tp!91745 e!691451))))

(declare-fun mapKey!48295 () (_ BitVec 32))

(declare-fun mapValue!48295 () ValueCell!14762)

(declare-fun mapRest!48295 () (Array (_ BitVec 32) ValueCell!14762))

(assert (=> mapNonEmpty!48295 (= (arr!37924 _values!996) (store mapRest!48295 mapKey!48295 mapValue!48295))))

(declare-fun b!1217897 () Bool)

(declare-fun e!691443 () Bool)

(assert (=> b!1217897 (= e!691444 (and e!691443 mapRes!48295))))

(declare-fun condMapEmpty!48295 () Bool)

(declare-fun mapDefault!48295 () ValueCell!14762)

(assert (=> b!1217897 (= condMapEmpty!48295 (= (arr!37924 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14762)) mapDefault!48295)))))

(declare-fun b!1217898 () Bool)

(declare-fun res!808824 () Bool)

(assert (=> b!1217898 (=> (not res!808824) (not e!691449))))

(assert (=> b!1217898 (= res!808824 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38461 _keys!1208))))))

(declare-fun mapIsEmpty!48295 () Bool)

(assert (=> mapIsEmpty!48295 mapRes!48295))

(declare-fun b!1217899 () Bool)

(declare-fun e!691447 () Bool)

(assert (=> b!1217899 (= e!691450 e!691447)))

(declare-fun res!808821 () Bool)

(assert (=> b!1217899 (=> res!808821 e!691447)))

(assert (=> b!1217899 (= res!808821 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46385)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553478 () array!78582)

(declare-fun minValue!944 () V!46385)

(declare-fun getCurrentListMapNoExtraKeys!5469 (array!78580 array!78582 (_ BitVec 32) (_ BitVec 32) V!46385 V!46385 (_ BitVec 32) Int) ListLongMap!18029)

(assert (=> b!1217899 (= lt!553476 (getCurrentListMapNoExtraKeys!5469 lt!553474 lt!553478 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1217899 (= lt!553478 (array!78583 (store (arr!37924 _values!996) i!673 (ValueCellFull!14762 lt!553481)) (size!38462 _values!996)))))

(declare-fun dynLambda!3320 (Int (_ BitVec 64)) V!46385)

(assert (=> b!1217899 (= lt!553481 (dynLambda!3320 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553477 () ListLongMap!18029)

(assert (=> b!1217899 (= lt!553477 (getCurrentListMapNoExtraKeys!5469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217900 () Bool)

(assert (=> b!1217900 (= e!691443 tp_is_empty!30943)))

(declare-fun b!1217901 () Bool)

(declare-fun res!808823 () Bool)

(assert (=> b!1217901 (=> (not res!808823) (not e!691449))))

(assert (=> b!1217901 (= res!808823 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26836))))

(declare-fun b!1217902 () Bool)

(assert (=> b!1217902 (= e!691441 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217903 () Bool)

(assert (=> b!1217903 (= e!691449 e!691442)))

(declare-fun res!808822 () Bool)

(assert (=> b!1217903 (=> (not res!808822) (not e!691442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78580 (_ BitVec 32)) Bool)

(assert (=> b!1217903 (= res!808822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553474 mask!1564))))

(assert (=> b!1217903 (= lt!553474 (array!78581 (store (arr!37923 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38461 _keys!1208)))))

(declare-fun b!1217904 () Bool)

(assert (=> b!1217904 (= e!691447 e!691445)))

(declare-fun res!808817 () Bool)

(assert (=> b!1217904 (=> res!808817 e!691445)))

(assert (=> b!1217904 (= res!808817 (not (validKeyInArray!0 (select (arr!37923 _keys!1208) from!1455))))))

(declare-fun lt!553473 () ListLongMap!18029)

(assert (=> b!1217904 (= lt!553473 lt!553479)))

(declare-fun lt!553472 () ListLongMap!18029)

(declare-fun -!1864 (ListLongMap!18029 (_ BitVec 64)) ListLongMap!18029)

(assert (=> b!1217904 (= lt!553479 (-!1864 lt!553472 k0!934))))

(assert (=> b!1217904 (= lt!553473 (getCurrentListMapNoExtraKeys!5469 lt!553474 lt!553478 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217904 (= lt!553472 (getCurrentListMapNoExtraKeys!5469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553475 () Unit!40231)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1099 (array!78580 array!78582 (_ BitVec 32) (_ BitVec 32) V!46385 V!46385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40231)

(assert (=> b!1217904 (= lt!553475 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1099 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217905 () Bool)

(declare-fun res!808811 () Bool)

(assert (=> b!1217905 (=> (not res!808811) (not e!691449))))

(assert (=> b!1217905 (= res!808811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217906 () Bool)

(assert (=> b!1217906 (= e!691451 tp_is_empty!30943)))

(declare-fun b!1217907 () Bool)

(declare-fun res!808818 () Bool)

(assert (=> b!1217907 (=> (not res!808818) (not e!691449))))

(assert (=> b!1217907 (= res!808818 (= (select (arr!37923 _keys!1208) i!673) k0!934))))

(assert (= (and start!101362 res!808815) b!1217894))

(assert (= (and b!1217894 res!808816) b!1217892))

(assert (= (and b!1217892 res!808825) b!1217905))

(assert (= (and b!1217905 res!808811) b!1217901))

(assert (= (and b!1217901 res!808823) b!1217898))

(assert (= (and b!1217898 res!808824) b!1217893))

(assert (= (and b!1217893 res!808819) b!1217907))

(assert (= (and b!1217907 res!808818) b!1217903))

(assert (= (and b!1217903 res!808822) b!1217891))

(assert (= (and b!1217891 res!808813) b!1217895))

(assert (= (and b!1217895 (not res!808814)) b!1217899))

(assert (= (and b!1217899 (not res!808821)) b!1217904))

(assert (= (and b!1217904 (not res!808817)) b!1217890))

(assert (= (and b!1217890 res!808820) b!1217896))

(assert (= (and b!1217896 (not res!808812)) b!1217902))

(assert (= (and b!1217897 condMapEmpty!48295) mapIsEmpty!48295))

(assert (= (and b!1217897 (not condMapEmpty!48295)) mapNonEmpty!48295))

(get-info :version)

(assert (= (and mapNonEmpty!48295 ((_ is ValueCellFull!14762) mapValue!48295)) b!1217906))

(assert (= (and b!1217897 ((_ is ValueCellFull!14762) mapDefault!48295)) b!1217900))

(assert (= start!101362 b!1217897))

(declare-fun b_lambda!21981 () Bool)

(assert (=> (not b_lambda!21981) (not b!1217899)))

(declare-fun t!40047 () Bool)

(declare-fun tb!11031 () Bool)

(assert (=> (and start!101362 (= defaultEntry!1004 defaultEntry!1004) t!40047) tb!11031))

(declare-fun result!22671 () Bool)

(assert (=> tb!11031 (= result!22671 tp_is_empty!30943)))

(assert (=> b!1217899 t!40047))

(declare-fun b_and!43615 () Bool)

(assert (= b_and!43613 (and (=> t!40047 result!22671) b_and!43615)))

(declare-fun m!1122193 () Bool)

(assert (=> b!1217901 m!1122193))

(declare-fun m!1122195 () Bool)

(assert (=> start!101362 m!1122195))

(declare-fun m!1122197 () Bool)

(assert (=> start!101362 m!1122197))

(declare-fun m!1122199 () Bool)

(assert (=> b!1217903 m!1122199))

(declare-fun m!1122201 () Bool)

(assert (=> b!1217903 m!1122201))

(declare-fun m!1122203 () Bool)

(assert (=> b!1217905 m!1122203))

(declare-fun m!1122205 () Bool)

(assert (=> b!1217891 m!1122205))

(declare-fun m!1122207 () Bool)

(assert (=> b!1217895 m!1122207))

(declare-fun m!1122209 () Bool)

(assert (=> b!1217895 m!1122209))

(declare-fun m!1122211 () Bool)

(assert (=> b!1217904 m!1122211))

(declare-fun m!1122213 () Bool)

(assert (=> b!1217904 m!1122213))

(declare-fun m!1122215 () Bool)

(assert (=> b!1217904 m!1122215))

(declare-fun m!1122217 () Bool)

(assert (=> b!1217904 m!1122217))

(declare-fun m!1122219 () Bool)

(assert (=> b!1217904 m!1122219))

(declare-fun m!1122221 () Bool)

(assert (=> b!1217904 m!1122221))

(assert (=> b!1217904 m!1122217))

(declare-fun m!1122223 () Bool)

(assert (=> b!1217893 m!1122223))

(declare-fun m!1122225 () Bool)

(assert (=> mapNonEmpty!48295 m!1122225))

(declare-fun m!1122227 () Bool)

(assert (=> b!1217907 m!1122227))

(assert (=> b!1217890 m!1122217))

(declare-fun m!1122229 () Bool)

(assert (=> b!1217890 m!1122229))

(assert (=> b!1217890 m!1122229))

(declare-fun m!1122231 () Bool)

(assert (=> b!1217890 m!1122231))

(declare-fun m!1122233 () Bool)

(assert (=> b!1217890 m!1122233))

(assert (=> b!1217896 m!1122217))

(declare-fun m!1122235 () Bool)

(assert (=> b!1217902 m!1122235))

(declare-fun m!1122237 () Bool)

(assert (=> b!1217894 m!1122237))

(declare-fun m!1122239 () Bool)

(assert (=> b!1217899 m!1122239))

(declare-fun m!1122241 () Bool)

(assert (=> b!1217899 m!1122241))

(declare-fun m!1122243 () Bool)

(assert (=> b!1217899 m!1122243))

(declare-fun m!1122245 () Bool)

(assert (=> b!1217899 m!1122245))

(check-sat (not b!1217902) b_and!43615 (not b!1217893) (not b!1217899) (not b!1217904) (not mapNonEmpty!48295) (not b!1217905) (not b_next!26239) (not b_lambda!21981) (not b!1217890) (not b!1217903) (not b!1217891) tp_is_empty!30943 (not b!1217901) (not start!101362) (not b!1217894) (not b!1217895))
(check-sat b_and!43615 (not b_next!26239))
