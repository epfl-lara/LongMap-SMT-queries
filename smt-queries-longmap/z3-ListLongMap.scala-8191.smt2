; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100006 () Bool)

(assert start!100006)

(declare-fun b_free!25591 () Bool)

(declare-fun b_next!25591 () Bool)

(assert (=> start!100006 (= b_free!25591 (not b_next!25591))))

(declare-fun tp!89486 () Bool)

(declare-fun b_and!42027 () Bool)

(assert (=> start!100006 (= tp!89486 b_and!42027)))

(declare-fun b!1191438 () Bool)

(declare-fun res!792508 () Bool)

(declare-fun e!677254 () Bool)

(assert (=> b!1191438 (=> (not res!792508) (not e!677254))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76962 0))(
  ( (array!76963 (arr!37131 (Array (_ BitVec 32) (_ BitVec 64))) (size!37669 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76962)

(assert (=> b!1191438 (= res!792508 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37669 _keys!1208))))))

(declare-fun b!1191439 () Bool)

(declare-fun e!677259 () Bool)

(declare-fun e!677260 () Bool)

(declare-fun mapRes!47009 () Bool)

(assert (=> b!1191439 (= e!677259 (and e!677260 mapRes!47009))))

(declare-fun condMapEmpty!47009 () Bool)

(declare-datatypes ((V!45289 0))(
  ( (V!45290 (val!15117 Int)) )
))
(declare-datatypes ((ValueCell!14351 0))(
  ( (ValueCellFull!14351 (v!17754 V!45289)) (EmptyCell!14351) )
))
(declare-datatypes ((array!76964 0))(
  ( (array!76965 (arr!37132 (Array (_ BitVec 32) ValueCell!14351)) (size!37670 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76964)

(declare-fun mapDefault!47009 () ValueCell!14351)

(assert (=> b!1191439 (= condMapEmpty!47009 (= (arr!37132 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14351)) mapDefault!47009)))))

(declare-fun b!1191440 () Bool)

(declare-fun res!792510 () Bool)

(assert (=> b!1191440 (=> (not res!792510) (not e!677254))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76962 (_ BitVec 32)) Bool)

(assert (=> b!1191440 (= res!792510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191441 () Bool)

(declare-fun res!792509 () Bool)

(declare-fun e!677253 () Bool)

(assert (=> b!1191441 (=> (not res!792509) (not e!677253))))

(declare-fun lt!541687 () array!76962)

(declare-datatypes ((List!26251 0))(
  ( (Nil!26248) (Cons!26247 (h!27456 (_ BitVec 64)) (t!38825 List!26251)) )
))
(declare-fun arrayNoDuplicates!0 (array!76962 (_ BitVec 32) List!26251) Bool)

(assert (=> b!1191441 (= res!792509 (arrayNoDuplicates!0 lt!541687 #b00000000000000000000000000000000 Nil!26248))))

(declare-fun b!1191442 () Bool)

(declare-fun e!677255 () Bool)

(assert (=> b!1191442 (= e!677253 (not e!677255))))

(declare-fun res!792507 () Bool)

(assert (=> b!1191442 (=> res!792507 e!677255)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1191442 (= res!792507 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191442 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39403 0))(
  ( (Unit!39404) )
))
(declare-fun lt!541692 () Unit!39403)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76962 (_ BitVec 64) (_ BitVec 32)) Unit!39403)

(assert (=> b!1191442 (= lt!541692 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191443 () Bool)

(declare-fun res!792515 () Bool)

(assert (=> b!1191443 (=> (not res!792515) (not e!677254))))

(assert (=> b!1191443 (= res!792515 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26248))))

(declare-fun b!1191445 () Bool)

(declare-fun res!792514 () Bool)

(assert (=> b!1191445 (=> (not res!792514) (not e!677254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191445 (= res!792514 (validMask!0 mask!1564))))

(declare-fun b!1191446 () Bool)

(assert (=> b!1191446 (= e!677254 e!677253)))

(declare-fun res!792512 () Bool)

(assert (=> b!1191446 (=> (not res!792512) (not e!677253))))

(assert (=> b!1191446 (= res!792512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541687 mask!1564))))

(assert (=> b!1191446 (= lt!541687 (array!76963 (store (arr!37131 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37669 _keys!1208)))))

(declare-fun b!1191447 () Bool)

(declare-fun e!677257 () Bool)

(declare-fun tp_is_empty!30121 () Bool)

(assert (=> b!1191447 (= e!677257 tp_is_empty!30121)))

(declare-fun mapNonEmpty!47009 () Bool)

(declare-fun tp!89487 () Bool)

(assert (=> mapNonEmpty!47009 (= mapRes!47009 (and tp!89487 e!677257))))

(declare-fun mapRest!47009 () (Array (_ BitVec 32) ValueCell!14351))

(declare-fun mapValue!47009 () ValueCell!14351)

(declare-fun mapKey!47009 () (_ BitVec 32))

(assert (=> mapNonEmpty!47009 (= (arr!37132 _values!996) (store mapRest!47009 mapKey!47009 mapValue!47009))))

(declare-fun b!1191448 () Bool)

(assert (=> b!1191448 (= e!677260 tp_is_empty!30121)))

(declare-fun b!1191449 () Bool)

(declare-fun res!792516 () Bool)

(assert (=> b!1191449 (=> (not res!792516) (not e!677254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191449 (= res!792516 (validKeyInArray!0 k0!934))))

(declare-fun b!1191450 () Bool)

(declare-fun e!677256 () Bool)

(assert (=> b!1191450 (= e!677255 e!677256)))

(declare-fun res!792517 () Bool)

(assert (=> b!1191450 (=> res!792517 e!677256)))

(assert (=> b!1191450 (= res!792517 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45289)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45289)

(declare-datatypes ((tuple2!19538 0))(
  ( (tuple2!19539 (_1!9780 (_ BitVec 64)) (_2!9780 V!45289)) )
))
(declare-datatypes ((List!26252 0))(
  ( (Nil!26249) (Cons!26248 (h!27457 tuple2!19538) (t!38826 List!26252)) )
))
(declare-datatypes ((ListLongMap!17507 0))(
  ( (ListLongMap!17508 (toList!8769 List!26252)) )
))
(declare-fun lt!541691 () ListLongMap!17507)

(declare-fun lt!541690 () array!76964)

(declare-fun getCurrentListMapNoExtraKeys!5219 (array!76962 array!76964 (_ BitVec 32) (_ BitVec 32) V!45289 V!45289 (_ BitVec 32) Int) ListLongMap!17507)

(assert (=> b!1191450 (= lt!541691 (getCurrentListMapNoExtraKeys!5219 lt!541687 lt!541690 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3108 (Int (_ BitVec 64)) V!45289)

(assert (=> b!1191450 (= lt!541690 (array!76965 (store (arr!37132 _values!996) i!673 (ValueCellFull!14351 (dynLambda!3108 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37670 _values!996)))))

(declare-fun lt!541689 () ListLongMap!17507)

(assert (=> b!1191450 (= lt!541689 (getCurrentListMapNoExtraKeys!5219 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191451 () Bool)

(assert (=> b!1191451 (= e!677256 true)))

(declare-fun -!1712 (ListLongMap!17507 (_ BitVec 64)) ListLongMap!17507)

(assert (=> b!1191451 (= (getCurrentListMapNoExtraKeys!5219 lt!541687 lt!541690 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1712 (getCurrentListMapNoExtraKeys!5219 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541688 () Unit!39403)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!962 (array!76962 array!76964 (_ BitVec 32) (_ BitVec 32) V!45289 V!45289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39403)

(assert (=> b!1191451 (= lt!541688 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!962 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191452 () Bool)

(declare-fun res!792513 () Bool)

(assert (=> b!1191452 (=> (not res!792513) (not e!677254))))

(assert (=> b!1191452 (= res!792513 (and (= (size!37670 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37669 _keys!1208) (size!37670 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47009 () Bool)

(assert (=> mapIsEmpty!47009 mapRes!47009))

(declare-fun b!1191444 () Bool)

(declare-fun res!792506 () Bool)

(assert (=> b!1191444 (=> (not res!792506) (not e!677254))))

(assert (=> b!1191444 (= res!792506 (= (select (arr!37131 _keys!1208) i!673) k0!934))))

(declare-fun res!792511 () Bool)

(assert (=> start!100006 (=> (not res!792511) (not e!677254))))

(assert (=> start!100006 (= res!792511 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37669 _keys!1208))))))

(assert (=> start!100006 e!677254))

(assert (=> start!100006 tp_is_empty!30121))

(declare-fun array_inv!28438 (array!76962) Bool)

(assert (=> start!100006 (array_inv!28438 _keys!1208)))

(assert (=> start!100006 true))

(assert (=> start!100006 tp!89486))

(declare-fun array_inv!28439 (array!76964) Bool)

(assert (=> start!100006 (and (array_inv!28439 _values!996) e!677259)))

(assert (= (and start!100006 res!792511) b!1191445))

(assert (= (and b!1191445 res!792514) b!1191452))

(assert (= (and b!1191452 res!792513) b!1191440))

(assert (= (and b!1191440 res!792510) b!1191443))

(assert (= (and b!1191443 res!792515) b!1191438))

(assert (= (and b!1191438 res!792508) b!1191449))

(assert (= (and b!1191449 res!792516) b!1191444))

(assert (= (and b!1191444 res!792506) b!1191446))

(assert (= (and b!1191446 res!792512) b!1191441))

(assert (= (and b!1191441 res!792509) b!1191442))

(assert (= (and b!1191442 (not res!792507)) b!1191450))

(assert (= (and b!1191450 (not res!792517)) b!1191451))

(assert (= (and b!1191439 condMapEmpty!47009) mapIsEmpty!47009))

(assert (= (and b!1191439 (not condMapEmpty!47009)) mapNonEmpty!47009))

(get-info :version)

(assert (= (and mapNonEmpty!47009 ((_ is ValueCellFull!14351) mapValue!47009)) b!1191447))

(assert (= (and b!1191439 ((_ is ValueCellFull!14351) mapDefault!47009)) b!1191448))

(assert (= start!100006 b!1191439))

(declare-fun b_lambda!20717 () Bool)

(assert (=> (not b_lambda!20717) (not b!1191450)))

(declare-fun t!38824 () Bool)

(declare-fun tb!10395 () Bool)

(assert (=> (and start!100006 (= defaultEntry!1004 defaultEntry!1004) t!38824) tb!10395))

(declare-fun result!21365 () Bool)

(assert (=> tb!10395 (= result!21365 tp_is_empty!30121)))

(assert (=> b!1191450 t!38824))

(declare-fun b_and!42029 () Bool)

(assert (= b_and!42027 (and (=> t!38824 result!21365) b_and!42029)))

(declare-fun m!1099403 () Bool)

(assert (=> start!100006 m!1099403))

(declare-fun m!1099405 () Bool)

(assert (=> start!100006 m!1099405))

(declare-fun m!1099407 () Bool)

(assert (=> b!1191450 m!1099407))

(declare-fun m!1099409 () Bool)

(assert (=> b!1191450 m!1099409))

(declare-fun m!1099411 () Bool)

(assert (=> b!1191450 m!1099411))

(declare-fun m!1099413 () Bool)

(assert (=> b!1191450 m!1099413))

(declare-fun m!1099415 () Bool)

(assert (=> b!1191443 m!1099415))

(declare-fun m!1099417 () Bool)

(assert (=> b!1191441 m!1099417))

(declare-fun m!1099419 () Bool)

(assert (=> b!1191449 m!1099419))

(declare-fun m!1099421 () Bool)

(assert (=> b!1191446 m!1099421))

(declare-fun m!1099423 () Bool)

(assert (=> b!1191446 m!1099423))

(declare-fun m!1099425 () Bool)

(assert (=> b!1191440 m!1099425))

(declare-fun m!1099427 () Bool)

(assert (=> b!1191444 m!1099427))

(declare-fun m!1099429 () Bool)

(assert (=> b!1191442 m!1099429))

(declare-fun m!1099431 () Bool)

(assert (=> b!1191442 m!1099431))

(declare-fun m!1099433 () Bool)

(assert (=> b!1191445 m!1099433))

(declare-fun m!1099435 () Bool)

(assert (=> b!1191451 m!1099435))

(declare-fun m!1099437 () Bool)

(assert (=> b!1191451 m!1099437))

(assert (=> b!1191451 m!1099437))

(declare-fun m!1099439 () Bool)

(assert (=> b!1191451 m!1099439))

(declare-fun m!1099441 () Bool)

(assert (=> b!1191451 m!1099441))

(declare-fun m!1099443 () Bool)

(assert (=> mapNonEmpty!47009 m!1099443))

(check-sat (not b!1191446) (not b!1191440) (not b!1191441) (not b!1191443) (not b!1191451) (not b!1191450) (not b!1191449) (not start!100006) (not b_lambda!20717) (not b_next!25591) tp_is_empty!30121 (not b!1191442) (not b!1191445) (not mapNonEmpty!47009) b_and!42029)
(check-sat b_and!42029 (not b_next!25591))
