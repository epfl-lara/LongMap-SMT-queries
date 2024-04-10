; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97336 () Bool)

(assert start!97336)

(declare-fun b_free!23307 () Bool)

(declare-fun b_next!23307 () Bool)

(assert (=> start!97336 (= b_free!23307 (not b_next!23307))))

(declare-fun tp!82220 () Bool)

(declare-fun b_and!37449 () Bool)

(assert (=> start!97336 (= tp!82220 b_and!37449)))

(declare-fun mapIsEmpty!43168 () Bool)

(declare-fun mapRes!43168 () Bool)

(assert (=> mapIsEmpty!43168 mapRes!43168))

(declare-fun b!1109069 () Bool)

(declare-fun res!740140 () Bool)

(declare-fun e!632635 () Bool)

(assert (=> b!1109069 (=> (not res!740140) (not e!632635))))

(declare-datatypes ((array!72051 0))(
  ( (array!72052 (arr!34678 (Array (_ BitVec 32) (_ BitVec 64))) (size!35214 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72051)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72051 (_ BitVec 32)) Bool)

(assert (=> b!1109069 (= res!740140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!41883 0))(
  ( (V!41884 (val!13840 Int)) )
))
(declare-fun zeroValue!944 () V!41883)

(declare-fun lt!495919 () array!72051)

(declare-datatypes ((tuple2!17494 0))(
  ( (tuple2!17495 (_1!8758 (_ BitVec 64)) (_2!8758 V!41883)) )
))
(declare-datatypes ((List!24177 0))(
  ( (Nil!24174) (Cons!24173 (h!25382 tuple2!17494) (t!34530 List!24177)) )
))
(declare-datatypes ((ListLongMap!15463 0))(
  ( (ListLongMap!15464 (toList!7747 List!24177)) )
))
(declare-fun call!46617 () ListLongMap!15463)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13074 0))(
  ( (ValueCellFull!13074 (v!16473 V!41883)) (EmptyCell!13074) )
))
(declare-datatypes ((array!72053 0))(
  ( (array!72054 (arr!34679 (Array (_ BitVec 32) ValueCell!13074)) (size!35215 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72053)

(declare-fun minValue!944 () V!41883)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46614 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4241 (array!72051 array!72053 (_ BitVec 32) (_ BitVec 32) V!41883 V!41883 (_ BitVec 32) Int) ListLongMap!15463)

(declare-fun dynLambda!2371 (Int (_ BitVec 64)) V!41883)

(assert (=> bm!46614 (= call!46617 (getCurrentListMapNoExtraKeys!4241 lt!495919 (array!72054 (store (arr!34679 _values!996) i!673 (ValueCellFull!13074 (dynLambda!2371 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35215 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!740139 () Bool)

(assert (=> start!97336 (=> (not res!740139) (not e!632635))))

(assert (=> start!97336 (= res!740139 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35214 _keys!1208))))))

(assert (=> start!97336 e!632635))

(declare-fun tp_is_empty!27567 () Bool)

(assert (=> start!97336 tp_is_empty!27567))

(declare-fun array_inv!26688 (array!72051) Bool)

(assert (=> start!97336 (array_inv!26688 _keys!1208)))

(assert (=> start!97336 true))

(assert (=> start!97336 tp!82220))

(declare-fun e!632634 () Bool)

(declare-fun array_inv!26689 (array!72053) Bool)

(assert (=> start!97336 (and (array_inv!26689 _values!996) e!632634)))

(declare-fun b!1109070 () Bool)

(declare-fun res!740136 () Bool)

(assert (=> b!1109070 (=> (not res!740136) (not e!632635))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1109070 (= res!740136 (= (select (arr!34678 _keys!1208) i!673) k0!934))))

(declare-fun b!1109071 () Bool)

(declare-fun e!632633 () Bool)

(assert (=> b!1109071 (= e!632635 e!632633)))

(declare-fun res!740133 () Bool)

(assert (=> b!1109071 (=> (not res!740133) (not e!632633))))

(assert (=> b!1109071 (= res!740133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495919 mask!1564))))

(assert (=> b!1109071 (= lt!495919 (array!72052 (store (arr!34678 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35214 _keys!1208)))))

(declare-fun call!46618 () ListLongMap!15463)

(declare-fun b!1109072 () Bool)

(declare-fun e!632637 () Bool)

(declare-fun -!1024 (ListLongMap!15463 (_ BitVec 64)) ListLongMap!15463)

(assert (=> b!1109072 (= e!632637 (= call!46617 (-!1024 call!46618 k0!934)))))

(declare-fun b!1109073 () Bool)

(declare-fun res!740134 () Bool)

(assert (=> b!1109073 (=> (not res!740134) (not e!632635))))

(assert (=> b!1109073 (= res!740134 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35214 _keys!1208))))))

(declare-fun b!1109074 () Bool)

(declare-fun res!740132 () Bool)

(assert (=> b!1109074 (=> (not res!740132) (not e!632633))))

(declare-datatypes ((List!24178 0))(
  ( (Nil!24175) (Cons!24174 (h!25383 (_ BitVec 64)) (t!34531 List!24178)) )
))
(declare-fun arrayNoDuplicates!0 (array!72051 (_ BitVec 32) List!24178) Bool)

(assert (=> b!1109074 (= res!740132 (arrayNoDuplicates!0 lt!495919 #b00000000000000000000000000000000 Nil!24175))))

(declare-fun b!1109075 () Bool)

(declare-fun res!740131 () Bool)

(assert (=> b!1109075 (=> (not res!740131) (not e!632635))))

(assert (=> b!1109075 (= res!740131 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24175))))

(declare-fun b!1109076 () Bool)

(declare-fun res!740138 () Bool)

(assert (=> b!1109076 (=> (not res!740138) (not e!632635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109076 (= res!740138 (validKeyInArray!0 k0!934))))

(declare-fun b!1109077 () Bool)

(declare-fun e!632630 () Bool)

(assert (=> b!1109077 (= e!632630 tp_is_empty!27567)))

(declare-fun b!1109078 () Bool)

(declare-fun e!632632 () Bool)

(assert (=> b!1109078 (= e!632634 (and e!632632 mapRes!43168))))

(declare-fun condMapEmpty!43168 () Bool)

(declare-fun mapDefault!43168 () ValueCell!13074)

(assert (=> b!1109078 (= condMapEmpty!43168 (= (arr!34679 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13074)) mapDefault!43168)))))

(declare-fun b!1109079 () Bool)

(declare-fun res!740135 () Bool)

(assert (=> b!1109079 (=> (not res!740135) (not e!632635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109079 (= res!740135 (validMask!0 mask!1564))))

(declare-fun b!1109080 () Bool)

(assert (=> b!1109080 (= e!632632 tp_is_empty!27567)))

(declare-fun bm!46615 () Bool)

(assert (=> bm!46615 (= call!46618 (getCurrentListMapNoExtraKeys!4241 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109081 () Bool)

(assert (=> b!1109081 (= e!632637 (= call!46617 call!46618))))

(declare-fun b!1109082 () Bool)

(declare-fun e!632636 () Bool)

(assert (=> b!1109082 (= e!632633 (not e!632636))))

(declare-fun res!740130 () Bool)

(assert (=> b!1109082 (=> res!740130 e!632636)))

(assert (=> b!1109082 (= res!740130 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35214 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109082 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36398 0))(
  ( (Unit!36399) )
))
(declare-fun lt!495920 () Unit!36398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72051 (_ BitVec 64) (_ BitVec 32)) Unit!36398)

(assert (=> b!1109082 (= lt!495920 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43168 () Bool)

(declare-fun tp!82219 () Bool)

(assert (=> mapNonEmpty!43168 (= mapRes!43168 (and tp!82219 e!632630))))

(declare-fun mapValue!43168 () ValueCell!13074)

(declare-fun mapRest!43168 () (Array (_ BitVec 32) ValueCell!13074))

(declare-fun mapKey!43168 () (_ BitVec 32))

(assert (=> mapNonEmpty!43168 (= (arr!34679 _values!996) (store mapRest!43168 mapKey!43168 mapValue!43168))))

(declare-fun b!1109083 () Bool)

(declare-fun res!740137 () Bool)

(assert (=> b!1109083 (=> (not res!740137) (not e!632635))))

(assert (=> b!1109083 (= res!740137 (and (= (size!35215 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35214 _keys!1208) (size!35215 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109084 () Bool)

(assert (=> b!1109084 (= e!632636 true)))

(assert (=> b!1109084 e!632637))

(declare-fun c!109152 () Bool)

(assert (=> b!1109084 (= c!109152 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495918 () Unit!36398)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!270 (array!72051 array!72053 (_ BitVec 32) (_ BitVec 32) V!41883 V!41883 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36398)

(assert (=> b!1109084 (= lt!495918 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!270 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97336 res!740139) b!1109079))

(assert (= (and b!1109079 res!740135) b!1109083))

(assert (= (and b!1109083 res!740137) b!1109069))

(assert (= (and b!1109069 res!740140) b!1109075))

(assert (= (and b!1109075 res!740131) b!1109073))

(assert (= (and b!1109073 res!740134) b!1109076))

(assert (= (and b!1109076 res!740138) b!1109070))

(assert (= (and b!1109070 res!740136) b!1109071))

(assert (= (and b!1109071 res!740133) b!1109074))

(assert (= (and b!1109074 res!740132) b!1109082))

(assert (= (and b!1109082 (not res!740130)) b!1109084))

(assert (= (and b!1109084 c!109152) b!1109072))

(assert (= (and b!1109084 (not c!109152)) b!1109081))

(assert (= (or b!1109072 b!1109081) bm!46614))

(assert (= (or b!1109072 b!1109081) bm!46615))

(assert (= (and b!1109078 condMapEmpty!43168) mapIsEmpty!43168))

(assert (= (and b!1109078 (not condMapEmpty!43168)) mapNonEmpty!43168))

(get-info :version)

(assert (= (and mapNonEmpty!43168 ((_ is ValueCellFull!13074) mapValue!43168)) b!1109077))

(assert (= (and b!1109078 ((_ is ValueCellFull!13074) mapDefault!43168)) b!1109080))

(assert (= start!97336 b!1109078))

(declare-fun b_lambda!18329 () Bool)

(assert (=> (not b_lambda!18329) (not bm!46614)))

(declare-fun t!34529 () Bool)

(declare-fun tb!8173 () Bool)

(assert (=> (and start!97336 (= defaultEntry!1004 defaultEntry!1004) t!34529) tb!8173))

(declare-fun result!16907 () Bool)

(assert (=> tb!8173 (= result!16907 tp_is_empty!27567)))

(assert (=> bm!46614 t!34529))

(declare-fun b_and!37451 () Bool)

(assert (= b_and!37449 (and (=> t!34529 result!16907) b_and!37451)))

(declare-fun m!1027435 () Bool)

(assert (=> b!1109071 m!1027435))

(declare-fun m!1027437 () Bool)

(assert (=> b!1109071 m!1027437))

(declare-fun m!1027439 () Bool)

(assert (=> b!1109072 m!1027439))

(declare-fun m!1027441 () Bool)

(assert (=> start!97336 m!1027441))

(declare-fun m!1027443 () Bool)

(assert (=> start!97336 m!1027443))

(declare-fun m!1027445 () Bool)

(assert (=> bm!46614 m!1027445))

(declare-fun m!1027447 () Bool)

(assert (=> bm!46614 m!1027447))

(declare-fun m!1027449 () Bool)

(assert (=> bm!46614 m!1027449))

(declare-fun m!1027451 () Bool)

(assert (=> b!1109069 m!1027451))

(declare-fun m!1027453 () Bool)

(assert (=> b!1109082 m!1027453))

(declare-fun m!1027455 () Bool)

(assert (=> b!1109082 m!1027455))

(declare-fun m!1027457 () Bool)

(assert (=> b!1109070 m!1027457))

(declare-fun m!1027459 () Bool)

(assert (=> b!1109076 m!1027459))

(declare-fun m!1027461 () Bool)

(assert (=> b!1109079 m!1027461))

(declare-fun m!1027463 () Bool)

(assert (=> b!1109084 m!1027463))

(declare-fun m!1027465 () Bool)

(assert (=> bm!46615 m!1027465))

(declare-fun m!1027467 () Bool)

(assert (=> b!1109075 m!1027467))

(declare-fun m!1027469 () Bool)

(assert (=> mapNonEmpty!43168 m!1027469))

(declare-fun m!1027471 () Bool)

(assert (=> b!1109074 m!1027471))

(check-sat (not b!1109079) (not b!1109069) (not b!1109071) (not b!1109074) (not b!1109082) b_and!37451 (not start!97336) (not b!1109072) tp_is_empty!27567 (not bm!46614) (not b!1109084) (not b_next!23307) (not mapNonEmpty!43168) (not bm!46615) (not b_lambda!18329) (not b!1109076) (not b!1109075))
(check-sat b_and!37451 (not b_next!23307))
