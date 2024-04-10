; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97282 () Bool)

(assert start!97282)

(declare-fun b_free!23253 () Bool)

(declare-fun b_next!23253 () Bool)

(assert (=> start!97282 (= b_free!23253 (not b_next!23253))))

(declare-fun tp!82057 () Bool)

(declare-fun b_and!37337 () Bool)

(assert (=> start!97282 (= tp!82057 b_and!37337)))

(declare-fun b!1107695 () Bool)

(declare-fun e!631975 () Bool)

(declare-fun e!631974 () Bool)

(assert (=> b!1107695 (= e!631975 (not e!631974))))

(declare-fun res!739239 () Bool)

(assert (=> b!1107695 (=> res!739239 e!631974)))

(declare-datatypes ((array!71943 0))(
  ( (array!71944 (arr!34624 (Array (_ BitVec 32) (_ BitVec 64))) (size!35160 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71943)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1107695 (= res!739239 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35160 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107695 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36356 0))(
  ( (Unit!36357) )
))
(declare-fun lt!495677 () Unit!36356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71943 (_ BitVec 64) (_ BitVec 32)) Unit!36356)

(assert (=> b!1107695 (= lt!495677 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107696 () Bool)

(declare-fun e!631971 () Bool)

(declare-fun tp_is_empty!27513 () Bool)

(assert (=> b!1107696 (= e!631971 tp_is_empty!27513)))

(declare-fun b!1107697 () Bool)

(declare-fun res!739247 () Bool)

(declare-fun e!631976 () Bool)

(assert (=> b!1107697 (=> (not res!739247) (not e!631976))))

(assert (=> b!1107697 (= res!739247 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35160 _keys!1208))))))

(declare-fun b!1107698 () Bool)

(assert (=> b!1107698 (= e!631976 e!631975)))

(declare-fun res!739245 () Bool)

(assert (=> b!1107698 (=> (not res!739245) (not e!631975))))

(declare-fun lt!495676 () array!71943)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71943 (_ BitVec 32)) Bool)

(assert (=> b!1107698 (= res!739245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495676 mask!1564))))

(assert (=> b!1107698 (= lt!495676 (array!71944 (store (arr!34624 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35160 _keys!1208)))))

(declare-fun b!1107699 () Bool)

(declare-fun e!631970 () Bool)

(declare-fun e!631973 () Bool)

(declare-fun mapRes!43087 () Bool)

(assert (=> b!1107699 (= e!631970 (and e!631973 mapRes!43087))))

(declare-fun condMapEmpty!43087 () Bool)

(declare-datatypes ((V!41811 0))(
  ( (V!41812 (val!13813 Int)) )
))
(declare-datatypes ((ValueCell!13047 0))(
  ( (ValueCellFull!13047 (v!16446 V!41811)) (EmptyCell!13047) )
))
(declare-datatypes ((array!71945 0))(
  ( (array!71946 (arr!34625 (Array (_ BitVec 32) ValueCell!13047)) (size!35161 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71945)

(declare-fun mapDefault!43087 () ValueCell!13047)

(assert (=> b!1107699 (= condMapEmpty!43087 (= (arr!34625 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13047)) mapDefault!43087)))))

(declare-fun b!1107700 () Bool)

(declare-fun e!631977 () Bool)

(declare-datatypes ((tuple2!17450 0))(
  ( (tuple2!17451 (_1!8736 (_ BitVec 64)) (_2!8736 V!41811)) )
))
(declare-datatypes ((List!24134 0))(
  ( (Nil!24131) (Cons!24130 (h!25339 tuple2!17450) (t!34433 List!24134)) )
))
(declare-datatypes ((ListLongMap!15419 0))(
  ( (ListLongMap!15420 (toList!7725 List!24134)) )
))
(declare-fun call!46456 () ListLongMap!15419)

(declare-fun call!46455 () ListLongMap!15419)

(assert (=> b!1107700 (= e!631977 (= call!46456 call!46455))))

(declare-fun b!1107701 () Bool)

(declare-fun res!739243 () Bool)

(assert (=> b!1107701 (=> (not res!739243) (not e!631976))))

(assert (=> b!1107701 (= res!739243 (= (select (arr!34624 _keys!1208) i!673) k0!934))))

(declare-fun b!1107702 () Bool)

(assert (=> b!1107702 (= e!631974 true)))

(assert (=> b!1107702 e!631977))

(declare-fun c!109059 () Bool)

(assert (=> b!1107702 (= c!109059 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41811)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41811)

(declare-fun lt!495675 () Unit!36356)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!251 (array!71943 array!71945 (_ BitVec 32) (_ BitVec 32) V!41811 V!41811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36356)

(assert (=> b!1107702 (= lt!495675 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!251 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107703 () Bool)

(declare-fun res!739241 () Bool)

(assert (=> b!1107703 (=> (not res!739241) (not e!631975))))

(declare-datatypes ((List!24135 0))(
  ( (Nil!24132) (Cons!24131 (h!25340 (_ BitVec 64)) (t!34434 List!24135)) )
))
(declare-fun arrayNoDuplicates!0 (array!71943 (_ BitVec 32) List!24135) Bool)

(assert (=> b!1107703 (= res!739241 (arrayNoDuplicates!0 lt!495676 #b00000000000000000000000000000000 Nil!24132))))

(declare-fun bm!46452 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4223 (array!71943 array!71945 (_ BitVec 32) (_ BitVec 32) V!41811 V!41811 (_ BitVec 32) Int) ListLongMap!15419)

(declare-fun dynLambda!2355 (Int (_ BitVec 64)) V!41811)

(assert (=> bm!46452 (= call!46456 (getCurrentListMapNoExtraKeys!4223 lt!495676 (array!71946 (store (arr!34625 _values!996) i!673 (ValueCellFull!13047 (dynLambda!2355 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35161 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107704 () Bool)

(declare-fun -!1005 (ListLongMap!15419 (_ BitVec 64)) ListLongMap!15419)

(assert (=> b!1107704 (= e!631977 (= call!46456 (-!1005 call!46455 k0!934)))))

(declare-fun b!1107705 () Bool)

(declare-fun res!739249 () Bool)

(assert (=> b!1107705 (=> (not res!739249) (not e!631976))))

(assert (=> b!1107705 (= res!739249 (and (= (size!35161 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35160 _keys!1208) (size!35161 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107706 () Bool)

(declare-fun res!739246 () Bool)

(assert (=> b!1107706 (=> (not res!739246) (not e!631976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107706 (= res!739246 (validKeyInArray!0 k0!934))))

(declare-fun b!1107707 () Bool)

(declare-fun res!739244 () Bool)

(assert (=> b!1107707 (=> (not res!739244) (not e!631976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107707 (= res!739244 (validMask!0 mask!1564))))

(declare-fun b!1107708 () Bool)

(declare-fun res!739242 () Bool)

(assert (=> b!1107708 (=> (not res!739242) (not e!631976))))

(assert (=> b!1107708 (= res!739242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!46453 () Bool)

(assert (=> bm!46453 (= call!46455 (getCurrentListMapNoExtraKeys!4223 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43087 () Bool)

(declare-fun tp!82058 () Bool)

(assert (=> mapNonEmpty!43087 (= mapRes!43087 (and tp!82058 e!631971))))

(declare-fun mapKey!43087 () (_ BitVec 32))

(declare-fun mapValue!43087 () ValueCell!13047)

(declare-fun mapRest!43087 () (Array (_ BitVec 32) ValueCell!13047))

(assert (=> mapNonEmpty!43087 (= (arr!34625 _values!996) (store mapRest!43087 mapKey!43087 mapValue!43087))))

(declare-fun b!1107709 () Bool)

(declare-fun res!739248 () Bool)

(assert (=> b!1107709 (=> (not res!739248) (not e!631976))))

(assert (=> b!1107709 (= res!739248 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24132))))

(declare-fun b!1107710 () Bool)

(assert (=> b!1107710 (= e!631973 tp_is_empty!27513)))

(declare-fun mapIsEmpty!43087 () Bool)

(assert (=> mapIsEmpty!43087 mapRes!43087))

(declare-fun res!739240 () Bool)

(assert (=> start!97282 (=> (not res!739240) (not e!631976))))

(assert (=> start!97282 (= res!739240 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35160 _keys!1208))))))

(assert (=> start!97282 e!631976))

(assert (=> start!97282 tp_is_empty!27513))

(declare-fun array_inv!26648 (array!71943) Bool)

(assert (=> start!97282 (array_inv!26648 _keys!1208)))

(assert (=> start!97282 true))

(assert (=> start!97282 tp!82057))

(declare-fun array_inv!26649 (array!71945) Bool)

(assert (=> start!97282 (and (array_inv!26649 _values!996) e!631970)))

(assert (= (and start!97282 res!739240) b!1107707))

(assert (= (and b!1107707 res!739244) b!1107705))

(assert (= (and b!1107705 res!739249) b!1107708))

(assert (= (and b!1107708 res!739242) b!1107709))

(assert (= (and b!1107709 res!739248) b!1107697))

(assert (= (and b!1107697 res!739247) b!1107706))

(assert (= (and b!1107706 res!739246) b!1107701))

(assert (= (and b!1107701 res!739243) b!1107698))

(assert (= (and b!1107698 res!739245) b!1107703))

(assert (= (and b!1107703 res!739241) b!1107695))

(assert (= (and b!1107695 (not res!739239)) b!1107702))

(assert (= (and b!1107702 c!109059) b!1107704))

(assert (= (and b!1107702 (not c!109059)) b!1107700))

(assert (= (or b!1107704 b!1107700) bm!46452))

(assert (= (or b!1107704 b!1107700) bm!46453))

(assert (= (and b!1107699 condMapEmpty!43087) mapIsEmpty!43087))

(assert (= (and b!1107699 (not condMapEmpty!43087)) mapNonEmpty!43087))

(get-info :version)

(assert (= (and mapNonEmpty!43087 ((_ is ValueCellFull!13047) mapValue!43087)) b!1107696))

(assert (= (and b!1107699 ((_ is ValueCellFull!13047) mapDefault!43087)) b!1107710))

(assert (= start!97282 b!1107699))

(declare-fun b_lambda!18271 () Bool)

(assert (=> (not b_lambda!18271) (not bm!46452)))

(declare-fun t!34432 () Bool)

(declare-fun tb!8119 () Bool)

(assert (=> (and start!97282 (= defaultEntry!1004 defaultEntry!1004) t!34432) tb!8119))

(declare-fun result!16799 () Bool)

(assert (=> tb!8119 (= result!16799 tp_is_empty!27513)))

(assert (=> bm!46452 t!34432))

(declare-fun b_and!37339 () Bool)

(assert (= b_and!37337 (and (=> t!34432 result!16799) b_and!37339)))

(declare-fun m!1026409 () Bool)

(assert (=> b!1107704 m!1026409))

(declare-fun m!1026411 () Bool)

(assert (=> b!1107708 m!1026411))

(declare-fun m!1026413 () Bool)

(assert (=> b!1107706 m!1026413))

(declare-fun m!1026415 () Bool)

(assert (=> b!1107702 m!1026415))

(declare-fun m!1026417 () Bool)

(assert (=> bm!46452 m!1026417))

(declare-fun m!1026419 () Bool)

(assert (=> bm!46452 m!1026419))

(declare-fun m!1026421 () Bool)

(assert (=> bm!46452 m!1026421))

(declare-fun m!1026423 () Bool)

(assert (=> b!1107695 m!1026423))

(declare-fun m!1026425 () Bool)

(assert (=> b!1107695 m!1026425))

(declare-fun m!1026427 () Bool)

(assert (=> b!1107701 m!1026427))

(declare-fun m!1026429 () Bool)

(assert (=> b!1107703 m!1026429))

(declare-fun m!1026431 () Bool)

(assert (=> start!97282 m!1026431))

(declare-fun m!1026433 () Bool)

(assert (=> start!97282 m!1026433))

(declare-fun m!1026435 () Bool)

(assert (=> bm!46453 m!1026435))

(declare-fun m!1026437 () Bool)

(assert (=> b!1107707 m!1026437))

(declare-fun m!1026439 () Bool)

(assert (=> b!1107709 m!1026439))

(declare-fun m!1026441 () Bool)

(assert (=> mapNonEmpty!43087 m!1026441))

(declare-fun m!1026443 () Bool)

(assert (=> b!1107698 m!1026443))

(declare-fun m!1026445 () Bool)

(assert (=> b!1107698 m!1026445))

(check-sat tp_is_empty!27513 (not b!1107708) (not mapNonEmpty!43087) (not b!1107698) b_and!37339 (not start!97282) (not bm!46452) (not b!1107704) (not b_lambda!18271) (not bm!46453) (not b!1107707) (not b!1107706) (not b_next!23253) (not b!1107702) (not b!1107709) (not b!1107703) (not b!1107695))
(check-sat b_and!37339 (not b_next!23253))
