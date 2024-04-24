; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100188 () Bool)

(assert start!100188)

(declare-fun b_free!25531 () Bool)

(declare-fun b_next!25531 () Bool)

(assert (=> start!100188 (= b_free!25531 (not b_next!25531))))

(declare-fun tp!89306 () Bool)

(declare-fun b_and!41931 () Bool)

(assert (=> start!100188 (= tp!89306 b_and!41931)))

(declare-fun b!1191441 () Bool)

(declare-fun e!677443 () Bool)

(declare-fun tp_is_empty!30061 () Bool)

(assert (=> b!1191441 (= e!677443 tp_is_empty!30061)))

(declare-fun b!1191442 () Bool)

(declare-fun e!677450 () Bool)

(declare-fun e!677447 () Bool)

(declare-fun mapRes!46919 () Bool)

(assert (=> b!1191442 (= e!677450 (and e!677447 mapRes!46919))))

(declare-fun condMapEmpty!46919 () Bool)

(declare-datatypes ((V!45209 0))(
  ( (V!45210 (val!15087 Int)) )
))
(declare-datatypes ((ValueCell!14321 0))(
  ( (ValueCellFull!14321 (v!17721 V!45209)) (EmptyCell!14321) )
))
(declare-datatypes ((array!76959 0))(
  ( (array!76960 (arr!37123 (Array (_ BitVec 32) ValueCell!14321)) (size!37660 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76959)

(declare-fun mapDefault!46919 () ValueCell!14321)

(assert (=> b!1191442 (= condMapEmpty!46919 (= (arr!37123 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14321)) mapDefault!46919)))))

(declare-fun b!1191443 () Bool)

(declare-fun e!677445 () Bool)

(declare-fun e!677444 () Bool)

(assert (=> b!1191443 (= e!677445 (not e!677444))))

(declare-fun res!792010 () Bool)

(assert (=> b!1191443 (=> res!792010 e!677444)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191443 (= res!792010 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76961 0))(
  ( (array!76962 (arr!37124 (Array (_ BitVec 32) (_ BitVec 64))) (size!37661 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76961)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191443 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39465 0))(
  ( (Unit!39466) )
))
(declare-fun lt!541827 () Unit!39465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76961 (_ BitVec 64) (_ BitVec 32)) Unit!39465)

(assert (=> b!1191443 (= lt!541827 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191444 () Bool)

(declare-fun res!792002 () Bool)

(declare-fun e!677449 () Bool)

(assert (=> b!1191444 (=> (not res!792002) (not e!677449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191444 (= res!792002 (validKeyInArray!0 k0!934))))

(declare-fun b!1191446 () Bool)

(declare-fun res!792006 () Bool)

(assert (=> b!1191446 (=> (not res!792006) (not e!677445))))

(declare-fun lt!541825 () array!76961)

(declare-datatypes ((List!26156 0))(
  ( (Nil!26153) (Cons!26152 (h!27370 (_ BitVec 64)) (t!38671 List!26156)) )
))
(declare-fun arrayNoDuplicates!0 (array!76961 (_ BitVec 32) List!26156) Bool)

(assert (=> b!1191446 (= res!792006 (arrayNoDuplicates!0 lt!541825 #b00000000000000000000000000000000 Nil!26153))))

(declare-fun b!1191447 () Bool)

(assert (=> b!1191447 (= e!677447 tp_is_empty!30061)))

(declare-fun b!1191448 () Bool)

(declare-fun res!792001 () Bool)

(assert (=> b!1191448 (=> (not res!792001) (not e!677449))))

(assert (=> b!1191448 (= res!792001 (= (select (arr!37124 _keys!1208) i!673) k0!934))))

(declare-fun b!1191449 () Bool)

(declare-fun e!677446 () Bool)

(assert (=> b!1191449 (= e!677446 true)))

(declare-fun zeroValue!944 () V!45209)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541826 () array!76959)

(declare-fun minValue!944 () V!45209)

(declare-datatypes ((tuple2!19412 0))(
  ( (tuple2!19413 (_1!9717 (_ BitVec 64)) (_2!9717 V!45209)) )
))
(declare-datatypes ((List!26157 0))(
  ( (Nil!26154) (Cons!26153 (h!27371 tuple2!19412) (t!38672 List!26157)) )
))
(declare-datatypes ((ListLongMap!17389 0))(
  ( (ListLongMap!17390 (toList!8710 List!26157)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5178 (array!76961 array!76959 (_ BitVec 32) (_ BitVec 32) V!45209 V!45209 (_ BitVec 32) Int) ListLongMap!17389)

(declare-fun -!1724 (ListLongMap!17389 (_ BitVec 64)) ListLongMap!17389)

(assert (=> b!1191449 (= (getCurrentListMapNoExtraKeys!5178 lt!541825 lt!541826 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1724 (getCurrentListMapNoExtraKeys!5178 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541824 () Unit!39465)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!939 (array!76961 array!76959 (_ BitVec 32) (_ BitVec 32) V!45209 V!45209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39465)

(assert (=> b!1191449 (= lt!541824 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191450 () Bool)

(declare-fun res!792004 () Bool)

(assert (=> b!1191450 (=> (not res!792004) (not e!677449))))

(assert (=> b!1191450 (= res!792004 (and (= (size!37660 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37661 _keys!1208) (size!37660 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191451 () Bool)

(assert (=> b!1191451 (= e!677449 e!677445)))

(declare-fun res!792007 () Bool)

(assert (=> b!1191451 (=> (not res!792007) (not e!677445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76961 (_ BitVec 32)) Bool)

(assert (=> b!1191451 (= res!792007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541825 mask!1564))))

(assert (=> b!1191451 (= lt!541825 (array!76962 (store (arr!37124 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37661 _keys!1208)))))

(declare-fun b!1191452 () Bool)

(declare-fun res!792008 () Bool)

(assert (=> b!1191452 (=> (not res!792008) (not e!677449))))

(assert (=> b!1191452 (= res!792008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46919 () Bool)

(assert (=> mapIsEmpty!46919 mapRes!46919))

(declare-fun b!1191453 () Bool)

(declare-fun res!792003 () Bool)

(assert (=> b!1191453 (=> (not res!792003) (not e!677449))))

(assert (=> b!1191453 (= res!792003 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26153))))

(declare-fun b!1191454 () Bool)

(declare-fun res!792005 () Bool)

(assert (=> b!1191454 (=> (not res!792005) (not e!677449))))

(assert (=> b!1191454 (= res!792005 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37661 _keys!1208))))))

(declare-fun res!792011 () Bool)

(assert (=> start!100188 (=> (not res!792011) (not e!677449))))

(assert (=> start!100188 (= res!792011 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37661 _keys!1208))))))

(assert (=> start!100188 e!677449))

(assert (=> start!100188 tp_is_empty!30061))

(declare-fun array_inv!28378 (array!76961) Bool)

(assert (=> start!100188 (array_inv!28378 _keys!1208)))

(assert (=> start!100188 true))

(assert (=> start!100188 tp!89306))

(declare-fun array_inv!28379 (array!76959) Bool)

(assert (=> start!100188 (and (array_inv!28379 _values!996) e!677450)))

(declare-fun b!1191445 () Bool)

(assert (=> b!1191445 (= e!677444 e!677446)))

(declare-fun res!792000 () Bool)

(assert (=> b!1191445 (=> res!792000 e!677446)))

(assert (=> b!1191445 (= res!792000 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541828 () ListLongMap!17389)

(assert (=> b!1191445 (= lt!541828 (getCurrentListMapNoExtraKeys!5178 lt!541825 lt!541826 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3135 (Int (_ BitVec 64)) V!45209)

(assert (=> b!1191445 (= lt!541826 (array!76960 (store (arr!37123 _values!996) i!673 (ValueCellFull!14321 (dynLambda!3135 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37660 _values!996)))))

(declare-fun lt!541823 () ListLongMap!17389)

(assert (=> b!1191445 (= lt!541823 (getCurrentListMapNoExtraKeys!5178 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191455 () Bool)

(declare-fun res!792009 () Bool)

(assert (=> b!1191455 (=> (not res!792009) (not e!677449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191455 (= res!792009 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46919 () Bool)

(declare-fun tp!89307 () Bool)

(assert (=> mapNonEmpty!46919 (= mapRes!46919 (and tp!89307 e!677443))))

(declare-fun mapValue!46919 () ValueCell!14321)

(declare-fun mapRest!46919 () (Array (_ BitVec 32) ValueCell!14321))

(declare-fun mapKey!46919 () (_ BitVec 32))

(assert (=> mapNonEmpty!46919 (= (arr!37123 _values!996) (store mapRest!46919 mapKey!46919 mapValue!46919))))

(assert (= (and start!100188 res!792011) b!1191455))

(assert (= (and b!1191455 res!792009) b!1191450))

(assert (= (and b!1191450 res!792004) b!1191452))

(assert (= (and b!1191452 res!792008) b!1191453))

(assert (= (and b!1191453 res!792003) b!1191454))

(assert (= (and b!1191454 res!792005) b!1191444))

(assert (= (and b!1191444 res!792002) b!1191448))

(assert (= (and b!1191448 res!792001) b!1191451))

(assert (= (and b!1191451 res!792007) b!1191446))

(assert (= (and b!1191446 res!792006) b!1191443))

(assert (= (and b!1191443 (not res!792010)) b!1191445))

(assert (= (and b!1191445 (not res!792000)) b!1191449))

(assert (= (and b!1191442 condMapEmpty!46919) mapIsEmpty!46919))

(assert (= (and b!1191442 (not condMapEmpty!46919)) mapNonEmpty!46919))

(get-info :version)

(assert (= (and mapNonEmpty!46919 ((_ is ValueCellFull!14321) mapValue!46919)) b!1191441))

(assert (= (and b!1191442 ((_ is ValueCellFull!14321) mapDefault!46919)) b!1191447))

(assert (= start!100188 b!1191442))

(declare-fun b_lambda!20669 () Bool)

(assert (=> (not b_lambda!20669) (not b!1191445)))

(declare-fun t!38670 () Bool)

(declare-fun tb!10335 () Bool)

(assert (=> (and start!100188 (= defaultEntry!1004 defaultEntry!1004) t!38670) tb!10335))

(declare-fun result!21245 () Bool)

(assert (=> tb!10335 (= result!21245 tp_is_empty!30061)))

(assert (=> b!1191445 t!38670))

(declare-fun b_and!41933 () Bool)

(assert (= b_and!41931 (and (=> t!38670 result!21245) b_and!41933)))

(declare-fun m!1100325 () Bool)

(assert (=> b!1191443 m!1100325))

(declare-fun m!1100327 () Bool)

(assert (=> b!1191443 m!1100327))

(declare-fun m!1100329 () Bool)

(assert (=> mapNonEmpty!46919 m!1100329))

(declare-fun m!1100331 () Bool)

(assert (=> start!100188 m!1100331))

(declare-fun m!1100333 () Bool)

(assert (=> start!100188 m!1100333))

(declare-fun m!1100335 () Bool)

(assert (=> b!1191455 m!1100335))

(declare-fun m!1100337 () Bool)

(assert (=> b!1191444 m!1100337))

(declare-fun m!1100339 () Bool)

(assert (=> b!1191452 m!1100339))

(declare-fun m!1100341 () Bool)

(assert (=> b!1191451 m!1100341))

(declare-fun m!1100343 () Bool)

(assert (=> b!1191451 m!1100343))

(declare-fun m!1100345 () Bool)

(assert (=> b!1191445 m!1100345))

(declare-fun m!1100347 () Bool)

(assert (=> b!1191445 m!1100347))

(declare-fun m!1100349 () Bool)

(assert (=> b!1191445 m!1100349))

(declare-fun m!1100351 () Bool)

(assert (=> b!1191445 m!1100351))

(declare-fun m!1100353 () Bool)

(assert (=> b!1191449 m!1100353))

(declare-fun m!1100355 () Bool)

(assert (=> b!1191449 m!1100355))

(assert (=> b!1191449 m!1100355))

(declare-fun m!1100357 () Bool)

(assert (=> b!1191449 m!1100357))

(declare-fun m!1100359 () Bool)

(assert (=> b!1191449 m!1100359))

(declare-fun m!1100361 () Bool)

(assert (=> b!1191453 m!1100361))

(declare-fun m!1100363 () Bool)

(assert (=> b!1191448 m!1100363))

(declare-fun m!1100365 () Bool)

(assert (=> b!1191446 m!1100365))

(check-sat (not b!1191451) (not b!1191455) (not b_next!25531) (not b!1191445) (not start!100188) (not mapNonEmpty!46919) (not b!1191452) (not b!1191453) tp_is_empty!30061 (not b_lambda!20669) (not b!1191444) (not b!1191449) (not b!1191443) b_and!41933 (not b!1191446))
(check-sat b_and!41933 (not b_next!25531))
