; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99262 () Bool)

(assert start!99262)

(declare-fun b_free!24847 () Bool)

(declare-fun b_next!24847 () Bool)

(assert (=> start!99262 (= b_free!24847 (not b_next!24847))))

(declare-fun tp!87254 () Bool)

(declare-fun b_and!40539 () Bool)

(assert (=> start!99262 (= tp!87254 b_and!40539)))

(declare-fun b!1169046 () Bool)

(declare-fun e!664414 () Bool)

(declare-fun tp_is_empty!29377 () Bool)

(assert (=> b!1169046 (= e!664414 tp_is_empty!29377)))

(declare-fun b!1169047 () Bool)

(declare-fun e!664413 () Bool)

(declare-fun e!664415 () Bool)

(assert (=> b!1169047 (= e!664413 e!664415)))

(declare-fun res!775696 () Bool)

(assert (=> b!1169047 (=> (not res!775696) (not e!664415))))

(declare-datatypes ((array!75502 0))(
  ( (array!75503 (arr!36401 (Array (_ BitVec 32) (_ BitVec 64))) (size!36939 (_ BitVec 32))) )
))
(declare-fun lt!526252 () array!75502)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75502 (_ BitVec 32)) Bool)

(assert (=> b!1169047 (= res!775696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526252 mask!1564))))

(declare-fun _keys!1208 () array!75502)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169047 (= lt!526252 (array!75503 (store (arr!36401 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36939 _keys!1208)))))

(declare-fun b!1169048 () Bool)

(declare-fun res!775690 () Bool)

(assert (=> b!1169048 (=> (not res!775690) (not e!664413))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1169048 (= res!775690 (= (select (arr!36401 _keys!1208) i!673) k0!934))))

(declare-fun b!1169049 () Bool)

(declare-fun e!664412 () Bool)

(assert (=> b!1169049 (= e!664412 tp_is_empty!29377)))

(declare-fun b!1169050 () Bool)

(declare-fun e!664411 () Bool)

(assert (=> b!1169050 (= e!664415 (not e!664411))))

(declare-fun res!775689 () Bool)

(assert (=> b!1169050 (=> res!775689 e!664411)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1169050 (= res!775689 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169050 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38397 0))(
  ( (Unit!38398) )
))
(declare-fun lt!526256 () Unit!38397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75502 (_ BitVec 64) (_ BitVec 32)) Unit!38397)

(assert (=> b!1169050 (= lt!526256 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169051 () Bool)

(declare-fun res!775685 () Bool)

(assert (=> b!1169051 (=> (not res!775685) (not e!664413))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44297 0))(
  ( (V!44298 (val!14745 Int)) )
))
(declare-datatypes ((ValueCell!13979 0))(
  ( (ValueCellFull!13979 (v!17382 V!44297)) (EmptyCell!13979) )
))
(declare-datatypes ((array!75504 0))(
  ( (array!75505 (arr!36402 (Array (_ BitVec 32) ValueCell!13979)) (size!36940 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75504)

(assert (=> b!1169051 (= res!775685 (and (= (size!36940 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36939 _keys!1208) (size!36940 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169052 () Bool)

(declare-fun e!664410 () Bool)

(assert (=> b!1169052 (= e!664411 e!664410)))

(declare-fun res!775684 () Bool)

(assert (=> b!1169052 (=> res!775684 e!664410)))

(assert (=> b!1169052 (= res!775684 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44297)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18912 0))(
  ( (tuple2!18913 (_1!9467 (_ BitVec 64)) (_2!9467 V!44297)) )
))
(declare-datatypes ((List!25627 0))(
  ( (Nil!25624) (Cons!25623 (h!26832 tuple2!18912) (t!37457 List!25627)) )
))
(declare-datatypes ((ListLongMap!16881 0))(
  ( (ListLongMap!16882 (toList!8456 List!25627)) )
))
(declare-fun lt!526260 () ListLongMap!16881)

(declare-fun lt!526253 () array!75504)

(declare-fun minValue!944 () V!44297)

(declare-fun getCurrentListMapNoExtraKeys!4931 (array!75502 array!75504 (_ BitVec 32) (_ BitVec 32) V!44297 V!44297 (_ BitVec 32) Int) ListLongMap!16881)

(assert (=> b!1169052 (= lt!526260 (getCurrentListMapNoExtraKeys!4931 lt!526252 lt!526253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526254 () V!44297)

(assert (=> b!1169052 (= lt!526253 (array!75505 (store (arr!36402 _values!996) i!673 (ValueCellFull!13979 lt!526254)) (size!36940 _values!996)))))

(declare-fun dynLambda!2858 (Int (_ BitVec 64)) V!44297)

(assert (=> b!1169052 (= lt!526254 (dynLambda!2858 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526251 () ListLongMap!16881)

(assert (=> b!1169052 (= lt!526251 (getCurrentListMapNoExtraKeys!4931 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169053 () Bool)

(declare-fun res!775691 () Bool)

(assert (=> b!1169053 (=> (not res!775691) (not e!664413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169053 (= res!775691 (validKeyInArray!0 k0!934))))

(declare-fun b!1169055 () Bool)

(declare-fun e!664408 () Bool)

(assert (=> b!1169055 (= e!664408 true)))

(declare-fun e!664409 () Bool)

(assert (=> b!1169055 e!664409))

(declare-fun res!775683 () Bool)

(assert (=> b!1169055 (=> (not res!775683) (not e!664409))))

(declare-fun lt!526257 () ListLongMap!16881)

(declare-fun +!3781 (ListLongMap!16881 tuple2!18912) ListLongMap!16881)

(declare-fun get!18563 (ValueCell!13979 V!44297) V!44297)

(assert (=> b!1169055 (= res!775683 (= lt!526260 (+!3781 lt!526257 (tuple2!18913 (select (arr!36401 _keys!1208) from!1455) (get!18563 (select (arr!36402 _values!996) from!1455) lt!526254)))))))

(declare-fun mapNonEmpty!45893 () Bool)

(declare-fun mapRes!45893 () Bool)

(declare-fun tp!87255 () Bool)

(assert (=> mapNonEmpty!45893 (= mapRes!45893 (and tp!87255 e!664412))))

(declare-fun mapRest!45893 () (Array (_ BitVec 32) ValueCell!13979))

(declare-fun mapKey!45893 () (_ BitVec 32))

(declare-fun mapValue!45893 () ValueCell!13979)

(assert (=> mapNonEmpty!45893 (= (arr!36402 _values!996) (store mapRest!45893 mapKey!45893 mapValue!45893))))

(declare-fun b!1169056 () Bool)

(declare-fun e!664416 () Bool)

(assert (=> b!1169056 (= e!664416 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169057 () Bool)

(assert (=> b!1169057 (= e!664409 e!664416)))

(declare-fun res!775693 () Bool)

(assert (=> b!1169057 (=> res!775693 e!664416)))

(assert (=> b!1169057 (= res!775693 (not (= (select (arr!36401 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169058 () Bool)

(assert (=> b!1169058 (= e!664410 e!664408)))

(declare-fun res!775692 () Bool)

(assert (=> b!1169058 (=> res!775692 e!664408)))

(assert (=> b!1169058 (= res!775692 (not (validKeyInArray!0 (select (arr!36401 _keys!1208) from!1455))))))

(declare-fun lt!526259 () ListLongMap!16881)

(assert (=> b!1169058 (= lt!526259 lt!526257)))

(declare-fun lt!526255 () ListLongMap!16881)

(declare-fun -!1460 (ListLongMap!16881 (_ BitVec 64)) ListLongMap!16881)

(assert (=> b!1169058 (= lt!526257 (-!1460 lt!526255 k0!934))))

(assert (=> b!1169058 (= lt!526259 (getCurrentListMapNoExtraKeys!4931 lt!526252 lt!526253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169058 (= lt!526255 (getCurrentListMapNoExtraKeys!4931 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526258 () Unit!38397)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!724 (array!75502 array!75504 (_ BitVec 32) (_ BitVec 32) V!44297 V!44297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38397)

(assert (=> b!1169058 (= lt!526258 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45893 () Bool)

(assert (=> mapIsEmpty!45893 mapRes!45893))

(declare-fun b!1169059 () Bool)

(declare-fun res!775695 () Bool)

(assert (=> b!1169059 (=> (not res!775695) (not e!664415))))

(declare-datatypes ((List!25628 0))(
  ( (Nil!25625) (Cons!25624 (h!26833 (_ BitVec 64)) (t!37458 List!25628)) )
))
(declare-fun arrayNoDuplicates!0 (array!75502 (_ BitVec 32) List!25628) Bool)

(assert (=> b!1169059 (= res!775695 (arrayNoDuplicates!0 lt!526252 #b00000000000000000000000000000000 Nil!25625))))

(declare-fun b!1169060 () Bool)

(declare-fun e!664407 () Bool)

(assert (=> b!1169060 (= e!664407 (and e!664414 mapRes!45893))))

(declare-fun condMapEmpty!45893 () Bool)

(declare-fun mapDefault!45893 () ValueCell!13979)

(assert (=> b!1169060 (= condMapEmpty!45893 (= (arr!36402 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13979)) mapDefault!45893)))))

(declare-fun b!1169061 () Bool)

(declare-fun res!775688 () Bool)

(assert (=> b!1169061 (=> (not res!775688) (not e!664413))))

(assert (=> b!1169061 (= res!775688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!775682 () Bool)

(assert (=> start!99262 (=> (not res!775682) (not e!664413))))

(assert (=> start!99262 (= res!775682 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36939 _keys!1208))))))

(assert (=> start!99262 e!664413))

(assert (=> start!99262 tp_is_empty!29377))

(declare-fun array_inv!27924 (array!75502) Bool)

(assert (=> start!99262 (array_inv!27924 _keys!1208)))

(assert (=> start!99262 true))

(assert (=> start!99262 tp!87254))

(declare-fun array_inv!27925 (array!75504) Bool)

(assert (=> start!99262 (and (array_inv!27925 _values!996) e!664407)))

(declare-fun b!1169054 () Bool)

(declare-fun res!775686 () Bool)

(assert (=> b!1169054 (=> (not res!775686) (not e!664413))))

(assert (=> b!1169054 (= res!775686 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25625))))

(declare-fun b!1169062 () Bool)

(declare-fun res!775694 () Bool)

(assert (=> b!1169062 (=> (not res!775694) (not e!664413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169062 (= res!775694 (validMask!0 mask!1564))))

(declare-fun b!1169063 () Bool)

(declare-fun res!775687 () Bool)

(assert (=> b!1169063 (=> (not res!775687) (not e!664413))))

(assert (=> b!1169063 (= res!775687 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36939 _keys!1208))))))

(assert (= (and start!99262 res!775682) b!1169062))

(assert (= (and b!1169062 res!775694) b!1169051))

(assert (= (and b!1169051 res!775685) b!1169061))

(assert (= (and b!1169061 res!775688) b!1169054))

(assert (= (and b!1169054 res!775686) b!1169063))

(assert (= (and b!1169063 res!775687) b!1169053))

(assert (= (and b!1169053 res!775691) b!1169048))

(assert (= (and b!1169048 res!775690) b!1169047))

(assert (= (and b!1169047 res!775696) b!1169059))

(assert (= (and b!1169059 res!775695) b!1169050))

(assert (= (and b!1169050 (not res!775689)) b!1169052))

(assert (= (and b!1169052 (not res!775684)) b!1169058))

(assert (= (and b!1169058 (not res!775692)) b!1169055))

(assert (= (and b!1169055 res!775683) b!1169057))

(assert (= (and b!1169057 (not res!775693)) b!1169056))

(assert (= (and b!1169060 condMapEmpty!45893) mapIsEmpty!45893))

(assert (= (and b!1169060 (not condMapEmpty!45893)) mapNonEmpty!45893))

(get-info :version)

(assert (= (and mapNonEmpty!45893 ((_ is ValueCellFull!13979) mapValue!45893)) b!1169049))

(assert (= (and b!1169060 ((_ is ValueCellFull!13979) mapDefault!45893)) b!1169046))

(assert (= start!99262 b!1169060))

(declare-fun b_lambda!19973 () Bool)

(assert (=> (not b_lambda!19973) (not b!1169052)))

(declare-fun t!37456 () Bool)

(declare-fun tb!9651 () Bool)

(assert (=> (and start!99262 (= defaultEntry!1004 defaultEntry!1004) t!37456) tb!9651))

(declare-fun result!19877 () Bool)

(assert (=> tb!9651 (= result!19877 tp_is_empty!29377)))

(assert (=> b!1169052 t!37456))

(declare-fun b_and!40541 () Bool)

(assert (= b_and!40539 (and (=> t!37456 result!19877) b_and!40541)))

(declare-fun m!1076429 () Bool)

(assert (=> b!1169052 m!1076429))

(declare-fun m!1076431 () Bool)

(assert (=> b!1169052 m!1076431))

(declare-fun m!1076433 () Bool)

(assert (=> b!1169052 m!1076433))

(declare-fun m!1076435 () Bool)

(assert (=> b!1169052 m!1076435))

(declare-fun m!1076437 () Bool)

(assert (=> b!1169050 m!1076437))

(declare-fun m!1076439 () Bool)

(assert (=> b!1169050 m!1076439))

(declare-fun m!1076441 () Bool)

(assert (=> mapNonEmpty!45893 m!1076441))

(declare-fun m!1076443 () Bool)

(assert (=> b!1169048 m!1076443))

(declare-fun m!1076445 () Bool)

(assert (=> b!1169058 m!1076445))

(declare-fun m!1076447 () Bool)

(assert (=> b!1169058 m!1076447))

(declare-fun m!1076449 () Bool)

(assert (=> b!1169058 m!1076449))

(declare-fun m!1076451 () Bool)

(assert (=> b!1169058 m!1076451))

(declare-fun m!1076453 () Bool)

(assert (=> b!1169058 m!1076453))

(declare-fun m!1076455 () Bool)

(assert (=> b!1169058 m!1076455))

(assert (=> b!1169058 m!1076453))

(assert (=> b!1169055 m!1076453))

(declare-fun m!1076457 () Bool)

(assert (=> b!1169055 m!1076457))

(assert (=> b!1169055 m!1076457))

(declare-fun m!1076459 () Bool)

(assert (=> b!1169055 m!1076459))

(declare-fun m!1076461 () Bool)

(assert (=> b!1169055 m!1076461))

(declare-fun m!1076463 () Bool)

(assert (=> b!1169056 m!1076463))

(declare-fun m!1076465 () Bool)

(assert (=> b!1169062 m!1076465))

(declare-fun m!1076467 () Bool)

(assert (=> b!1169054 m!1076467))

(declare-fun m!1076469 () Bool)

(assert (=> b!1169061 m!1076469))

(declare-fun m!1076471 () Bool)

(assert (=> b!1169047 m!1076471))

(declare-fun m!1076473 () Bool)

(assert (=> b!1169047 m!1076473))

(declare-fun m!1076475 () Bool)

(assert (=> b!1169053 m!1076475))

(declare-fun m!1076477 () Bool)

(assert (=> start!99262 m!1076477))

(declare-fun m!1076479 () Bool)

(assert (=> start!99262 m!1076479))

(assert (=> b!1169057 m!1076453))

(declare-fun m!1076481 () Bool)

(assert (=> b!1169059 m!1076481))

(check-sat (not b!1169061) tp_is_empty!29377 (not b!1169052) (not start!99262) (not b_lambda!19973) (not b!1169059) (not mapNonEmpty!45893) (not b_next!24847) (not b!1169053) (not b!1169056) (not b!1169055) b_and!40541 (not b!1169058) (not b!1169050) (not b!1169054) (not b!1169047) (not b!1169062))
(check-sat b_and!40541 (not b_next!24847))
