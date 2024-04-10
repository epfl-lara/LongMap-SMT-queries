; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101376 () Bool)

(assert start!101376)

(declare-fun b_free!26247 () Bool)

(declare-fun b_next!26247 () Bool)

(assert (=> start!101376 (= b_free!26247 (not b_next!26247))))

(declare-fun tp!91769 () Bool)

(declare-fun b_and!43647 () Bool)

(assert (=> start!101376 (= tp!91769 b_and!43647)))

(declare-datatypes ((array!78677 0))(
  ( (array!78678 (arr!37971 (Array (_ BitVec 32) (_ BitVec 64))) (size!38507 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78677)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!691645 () Bool)

(declare-fun b!1218223 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1218223 (= e!691645 (or (not (= (select (arr!37971 _keys!1208) from!1455) k0!934)) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun e!691649 () Bool)

(assert (=> b!1218223 e!691649))

(declare-fun res!809055 () Bool)

(assert (=> b!1218223 (=> (not res!809055) (not e!691649))))

(declare-datatypes ((V!46395 0))(
  ( (V!46396 (val!15532 Int)) )
))
(declare-datatypes ((tuple2!19978 0))(
  ( (tuple2!19979 (_1!10000 (_ BitVec 64)) (_2!10000 V!46395)) )
))
(declare-datatypes ((List!26781 0))(
  ( (Nil!26778) (Cons!26777 (h!27986 tuple2!19978) (t!40008 List!26781)) )
))
(declare-datatypes ((ListLongMap!17947 0))(
  ( (ListLongMap!17948 (toList!8989 List!26781)) )
))
(declare-fun lt!553778 () ListLongMap!17947)

(declare-fun lt!553777 () V!46395)

(declare-datatypes ((ValueCell!14766 0))(
  ( (ValueCellFull!14766 (v!18187 V!46395)) (EmptyCell!14766) )
))
(declare-datatypes ((array!78679 0))(
  ( (array!78680 (arr!37972 (Array (_ BitVec 32) ValueCell!14766)) (size!38508 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78679)

(declare-fun lt!553779 () ListLongMap!17947)

(declare-fun +!4060 (ListLongMap!17947 tuple2!19978) ListLongMap!17947)

(declare-fun get!19353 (ValueCell!14766 V!46395) V!46395)

(assert (=> b!1218223 (= res!809055 (= lt!553778 (+!4060 lt!553779 (tuple2!19979 (select (arr!37971 _keys!1208) from!1455) (get!19353 (select (arr!37972 _values!996) from!1455) lt!553777)))))))

(declare-fun b!1218224 () Bool)

(declare-fun e!691652 () Bool)

(declare-fun tp_is_empty!30951 () Bool)

(assert (=> b!1218224 (= e!691652 tp_is_empty!30951)))

(declare-fun res!809052 () Bool)

(declare-fun e!691651 () Bool)

(assert (=> start!101376 (=> (not res!809052) (not e!691651))))

(assert (=> start!101376 (= res!809052 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38507 _keys!1208))))))

(assert (=> start!101376 e!691651))

(assert (=> start!101376 tp_is_empty!30951))

(declare-fun array_inv!28900 (array!78677) Bool)

(assert (=> start!101376 (array_inv!28900 _keys!1208)))

(assert (=> start!101376 true))

(assert (=> start!101376 tp!91769))

(declare-fun e!691650 () Bool)

(declare-fun array_inv!28901 (array!78679) Bool)

(assert (=> start!101376 (and (array_inv!28901 _values!996) e!691650)))

(declare-fun b!1218225 () Bool)

(declare-fun e!691647 () Bool)

(declare-fun e!691643 () Bool)

(assert (=> b!1218225 (= e!691647 (not e!691643))))

(declare-fun res!809056 () Bool)

(assert (=> b!1218225 (=> res!809056 e!691643)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218225 (= res!809056 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218225 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40382 0))(
  ( (Unit!40383) )
))
(declare-fun lt!553773 () Unit!40382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78677 (_ BitVec 64) (_ BitVec 32)) Unit!40382)

(assert (=> b!1218225 (= lt!553773 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218226 () Bool)

(declare-fun e!691644 () Bool)

(assert (=> b!1218226 (= e!691644 e!691645)))

(declare-fun res!809054 () Bool)

(assert (=> b!1218226 (=> res!809054 e!691645)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218226 (= res!809054 (not (validKeyInArray!0 (select (arr!37971 _keys!1208) from!1455))))))

(declare-fun lt!553781 () ListLongMap!17947)

(assert (=> b!1218226 (= lt!553781 lt!553779)))

(declare-fun lt!553780 () ListLongMap!17947)

(declare-fun -!1904 (ListLongMap!17947 (_ BitVec 64)) ListLongMap!17947)

(assert (=> b!1218226 (= lt!553779 (-!1904 lt!553780 k0!934))))

(declare-fun zeroValue!944 () V!46395)

(declare-fun lt!553775 () array!78679)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553776 () array!78677)

(declare-fun minValue!944 () V!46395)

(declare-fun getCurrentListMapNoExtraKeys!5415 (array!78677 array!78679 (_ BitVec 32) (_ BitVec 32) V!46395 V!46395 (_ BitVec 32) Int) ListLongMap!17947)

(assert (=> b!1218226 (= lt!553781 (getCurrentListMapNoExtraKeys!5415 lt!553776 lt!553775 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218226 (= lt!553780 (getCurrentListMapNoExtraKeys!5415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553774 () Unit!40382)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1111 (array!78677 array!78679 (_ BitVec 32) (_ BitVec 32) V!46395 V!46395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40382)

(assert (=> b!1218226 (= lt!553774 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1111 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218227 () Bool)

(declare-fun res!809061 () Bool)

(assert (=> b!1218227 (=> (not res!809061) (not e!691651))))

(assert (=> b!1218227 (= res!809061 (= (select (arr!37971 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48307 () Bool)

(declare-fun mapRes!48307 () Bool)

(declare-fun tp!91768 () Bool)

(assert (=> mapNonEmpty!48307 (= mapRes!48307 (and tp!91768 e!691652))))

(declare-fun mapRest!48307 () (Array (_ BitVec 32) ValueCell!14766))

(declare-fun mapValue!48307 () ValueCell!14766)

(declare-fun mapKey!48307 () (_ BitVec 32))

(assert (=> mapNonEmpty!48307 (= (arr!37972 _values!996) (store mapRest!48307 mapKey!48307 mapValue!48307))))

(declare-fun b!1218228 () Bool)

(declare-fun e!691642 () Bool)

(assert (=> b!1218228 (= e!691649 e!691642)))

(declare-fun res!809065 () Bool)

(assert (=> b!1218228 (=> res!809065 e!691642)))

(assert (=> b!1218228 (= res!809065 (not (= (select (arr!37971 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1218229 () Bool)

(declare-fun res!809059 () Bool)

(assert (=> b!1218229 (=> (not res!809059) (not e!691651))))

(assert (=> b!1218229 (= res!809059 (and (= (size!38508 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38507 _keys!1208) (size!38508 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218230 () Bool)

(assert (=> b!1218230 (= e!691643 e!691644)))

(declare-fun res!809058 () Bool)

(assert (=> b!1218230 (=> res!809058 e!691644)))

(assert (=> b!1218230 (= res!809058 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1218230 (= lt!553778 (getCurrentListMapNoExtraKeys!5415 lt!553776 lt!553775 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218230 (= lt!553775 (array!78680 (store (arr!37972 _values!996) i!673 (ValueCellFull!14766 lt!553777)) (size!38508 _values!996)))))

(declare-fun dynLambda!3299 (Int (_ BitVec 64)) V!46395)

(assert (=> b!1218230 (= lt!553777 (dynLambda!3299 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553782 () ListLongMap!17947)

(assert (=> b!1218230 (= lt!553782 (getCurrentListMapNoExtraKeys!5415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218231 () Bool)

(declare-fun res!809066 () Bool)

(assert (=> b!1218231 (=> (not res!809066) (not e!691647))))

(declare-datatypes ((List!26782 0))(
  ( (Nil!26779) (Cons!26778 (h!27987 (_ BitVec 64)) (t!40009 List!26782)) )
))
(declare-fun arrayNoDuplicates!0 (array!78677 (_ BitVec 32) List!26782) Bool)

(assert (=> b!1218231 (= res!809066 (arrayNoDuplicates!0 lt!553776 #b00000000000000000000000000000000 Nil!26779))))

(declare-fun b!1218232 () Bool)

(declare-fun res!809057 () Bool)

(assert (=> b!1218232 (=> (not res!809057) (not e!691651))))

(assert (=> b!1218232 (= res!809057 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38507 _keys!1208))))))

(declare-fun b!1218233 () Bool)

(declare-fun res!809062 () Bool)

(assert (=> b!1218233 (=> (not res!809062) (not e!691651))))

(assert (=> b!1218233 (= res!809062 (validKeyInArray!0 k0!934))))

(declare-fun b!1218234 () Bool)

(assert (=> b!1218234 (= e!691651 e!691647)))

(declare-fun res!809064 () Bool)

(assert (=> b!1218234 (=> (not res!809064) (not e!691647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78677 (_ BitVec 32)) Bool)

(assert (=> b!1218234 (= res!809064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553776 mask!1564))))

(assert (=> b!1218234 (= lt!553776 (array!78678 (store (arr!37971 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38507 _keys!1208)))))

(declare-fun mapIsEmpty!48307 () Bool)

(assert (=> mapIsEmpty!48307 mapRes!48307))

(declare-fun b!1218235 () Bool)

(declare-fun res!809053 () Bool)

(assert (=> b!1218235 (=> (not res!809053) (not e!691651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218235 (= res!809053 (validMask!0 mask!1564))))

(declare-fun b!1218236 () Bool)

(declare-fun res!809063 () Bool)

(assert (=> b!1218236 (=> (not res!809063) (not e!691651))))

(assert (=> b!1218236 (= res!809063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218237 () Bool)

(declare-fun e!691646 () Bool)

(assert (=> b!1218237 (= e!691650 (and e!691646 mapRes!48307))))

(declare-fun condMapEmpty!48307 () Bool)

(declare-fun mapDefault!48307 () ValueCell!14766)

(assert (=> b!1218237 (= condMapEmpty!48307 (= (arr!37972 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14766)) mapDefault!48307)))))

(declare-fun b!1218238 () Bool)

(assert (=> b!1218238 (= e!691646 tp_is_empty!30951)))

(declare-fun b!1218239 () Bool)

(declare-fun res!809060 () Bool)

(assert (=> b!1218239 (=> (not res!809060) (not e!691651))))

(assert (=> b!1218239 (= res!809060 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26779))))

(declare-fun b!1218240 () Bool)

(assert (=> b!1218240 (= e!691642 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101376 res!809052) b!1218235))

(assert (= (and b!1218235 res!809053) b!1218229))

(assert (= (and b!1218229 res!809059) b!1218236))

(assert (= (and b!1218236 res!809063) b!1218239))

(assert (= (and b!1218239 res!809060) b!1218232))

(assert (= (and b!1218232 res!809057) b!1218233))

(assert (= (and b!1218233 res!809062) b!1218227))

(assert (= (and b!1218227 res!809061) b!1218234))

(assert (= (and b!1218234 res!809064) b!1218231))

(assert (= (and b!1218231 res!809066) b!1218225))

(assert (= (and b!1218225 (not res!809056)) b!1218230))

(assert (= (and b!1218230 (not res!809058)) b!1218226))

(assert (= (and b!1218226 (not res!809054)) b!1218223))

(assert (= (and b!1218223 res!809055) b!1218228))

(assert (= (and b!1218228 (not res!809065)) b!1218240))

(assert (= (and b!1218237 condMapEmpty!48307) mapIsEmpty!48307))

(assert (= (and b!1218237 (not condMapEmpty!48307)) mapNonEmpty!48307))

(get-info :version)

(assert (= (and mapNonEmpty!48307 ((_ is ValueCellFull!14766) mapValue!48307)) b!1218224))

(assert (= (and b!1218237 ((_ is ValueCellFull!14766) mapDefault!48307)) b!1218238))

(assert (= start!101376 b!1218237))

(declare-fun b_lambda!21999 () Bool)

(assert (=> (not b_lambda!21999) (not b!1218230)))

(declare-fun t!40007 () Bool)

(declare-fun tb!11047 () Bool)

(assert (=> (and start!101376 (= defaultEntry!1004 defaultEntry!1004) t!40007) tb!11047))

(declare-fun result!22695 () Bool)

(assert (=> tb!11047 (= result!22695 tp_is_empty!30951)))

(assert (=> b!1218230 t!40007))

(declare-fun b_and!43649 () Bool)

(assert (= b_and!43647 (and (=> t!40007 result!22695) b_and!43649)))

(declare-fun m!1122973 () Bool)

(assert (=> mapNonEmpty!48307 m!1122973))

(declare-fun m!1122975 () Bool)

(assert (=> b!1218233 m!1122975))

(declare-fun m!1122977 () Bool)

(assert (=> b!1218236 m!1122977))

(declare-fun m!1122979 () Bool)

(assert (=> start!101376 m!1122979))

(declare-fun m!1122981 () Bool)

(assert (=> start!101376 m!1122981))

(declare-fun m!1122983 () Bool)

(assert (=> b!1218228 m!1122983))

(declare-fun m!1122985 () Bool)

(assert (=> b!1218234 m!1122985))

(declare-fun m!1122987 () Bool)

(assert (=> b!1218234 m!1122987))

(declare-fun m!1122989 () Bool)

(assert (=> b!1218227 m!1122989))

(declare-fun m!1122991 () Bool)

(assert (=> b!1218240 m!1122991))

(assert (=> b!1218223 m!1122983))

(declare-fun m!1122993 () Bool)

(assert (=> b!1218223 m!1122993))

(assert (=> b!1218223 m!1122993))

(declare-fun m!1122995 () Bool)

(assert (=> b!1218223 m!1122995))

(declare-fun m!1122997 () Bool)

(assert (=> b!1218223 m!1122997))

(declare-fun m!1122999 () Bool)

(assert (=> b!1218239 m!1122999))

(declare-fun m!1123001 () Bool)

(assert (=> b!1218225 m!1123001))

(declare-fun m!1123003 () Bool)

(assert (=> b!1218225 m!1123003))

(declare-fun m!1123005 () Bool)

(assert (=> b!1218231 m!1123005))

(declare-fun m!1123007 () Bool)

(assert (=> b!1218226 m!1123007))

(declare-fun m!1123009 () Bool)

(assert (=> b!1218226 m!1123009))

(declare-fun m!1123011 () Bool)

(assert (=> b!1218226 m!1123011))

(assert (=> b!1218226 m!1122983))

(declare-fun m!1123013 () Bool)

(assert (=> b!1218226 m!1123013))

(assert (=> b!1218226 m!1122983))

(declare-fun m!1123015 () Bool)

(assert (=> b!1218226 m!1123015))

(declare-fun m!1123017 () Bool)

(assert (=> b!1218230 m!1123017))

(declare-fun m!1123019 () Bool)

(assert (=> b!1218230 m!1123019))

(declare-fun m!1123021 () Bool)

(assert (=> b!1218230 m!1123021))

(declare-fun m!1123023 () Bool)

(assert (=> b!1218230 m!1123023))

(declare-fun m!1123025 () Bool)

(assert (=> b!1218235 m!1123025))

(check-sat (not start!101376) (not b!1218236) (not b_lambda!21999) (not b!1218240) (not b!1218223) (not b!1218233) (not b!1218235) (not b!1218226) (not b!1218234) (not b!1218231) tp_is_empty!30951 (not b!1218230) (not mapNonEmpty!48307) b_and!43649 (not b!1218239) (not b_next!26247) (not b!1218225))
(check-sat b_and!43649 (not b_next!26247))
