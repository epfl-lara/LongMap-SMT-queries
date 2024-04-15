; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97394 () Bool)

(assert start!97394)

(declare-fun b_free!23371 () Bool)

(declare-fun b_next!23371 () Bool)

(assert (=> start!97394 (= b_free!23371 (not b_next!23371))))

(declare-fun tp!82412 () Bool)

(declare-fun b_and!37557 () Bool)

(assert (=> start!97394 (= tp!82412 b_and!37557)))

(declare-fun b!1110552 () Bool)

(declare-fun e!633329 () Bool)

(declare-fun e!633325 () Bool)

(assert (=> b!1110552 (= e!633329 (not e!633325))))

(declare-fun res!741123 () Bool)

(assert (=> b!1110552 (=> res!741123 e!633325)))

(declare-datatypes ((array!72072 0))(
  ( (array!72073 (arr!34689 (Array (_ BitVec 32) (_ BitVec 64))) (size!35227 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72072)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1110552 (= res!741123 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35227 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110552 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36259 0))(
  ( (Unit!36260) )
))
(declare-fun lt!496006 () Unit!36259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72072 (_ BitVec 64) (_ BitVec 32)) Unit!36259)

(assert (=> b!1110552 (= lt!496006 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110553 () Bool)

(declare-fun res!741125 () Bool)

(declare-fun e!633324 () Bool)

(assert (=> b!1110553 (=> (not res!741125) (not e!633324))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41969 0))(
  ( (V!41970 (val!13872 Int)) )
))
(declare-datatypes ((ValueCell!13106 0))(
  ( (ValueCellFull!13106 (v!16504 V!41969)) (EmptyCell!13106) )
))
(declare-datatypes ((array!72074 0))(
  ( (array!72075 (arr!34690 (Array (_ BitVec 32) ValueCell!13106)) (size!35228 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72074)

(assert (=> b!1110553 (= res!741125 (and (= (size!35228 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35227 _keys!1208) (size!35228 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!41969)

(declare-datatypes ((tuple2!17608 0))(
  ( (tuple2!17609 (_1!8815 (_ BitVec 64)) (_2!8815 V!41969)) )
))
(declare-datatypes ((List!24263 0))(
  ( (Nil!24260) (Cons!24259 (h!25468 tuple2!17608) (t!34671 List!24263)) )
))
(declare-datatypes ((ListLongMap!15577 0))(
  ( (ListLongMap!15578 (toList!7804 List!24263)) )
))
(declare-fun call!46786 () ListLongMap!15577)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41969)

(declare-fun bm!46783 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4319 (array!72072 array!72074 (_ BitVec 32) (_ BitVec 32) V!41969 V!41969 (_ BitVec 32) Int) ListLongMap!15577)

(assert (=> bm!46783 (= call!46786 (getCurrentListMapNoExtraKeys!4319 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110554 () Bool)

(declare-fun res!741119 () Bool)

(assert (=> b!1110554 (=> (not res!741119) (not e!633329))))

(declare-fun lt!496008 () array!72072)

(declare-datatypes ((List!24264 0))(
  ( (Nil!24261) (Cons!24260 (h!25469 (_ BitVec 64)) (t!34672 List!24264)) )
))
(declare-fun arrayNoDuplicates!0 (array!72072 (_ BitVec 32) List!24264) Bool)

(assert (=> b!1110554 (= res!741119 (arrayNoDuplicates!0 lt!496008 #b00000000000000000000000000000000 Nil!24261))))

(declare-fun call!46787 () ListLongMap!15577)

(declare-fun bm!46784 () Bool)

(declare-fun dynLambda!2383 (Int (_ BitVec 64)) V!41969)

(assert (=> bm!46784 (= call!46787 (getCurrentListMapNoExtraKeys!4319 lt!496008 (array!72075 (store (arr!34690 _values!996) i!673 (ValueCellFull!13106 (dynLambda!2383 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35228 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!741127 () Bool)

(assert (=> start!97394 (=> (not res!741127) (not e!633324))))

(assert (=> start!97394 (= res!741127 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35227 _keys!1208))))))

(assert (=> start!97394 e!633324))

(declare-fun tp_is_empty!27631 () Bool)

(assert (=> start!97394 tp_is_empty!27631))

(declare-fun array_inv!26740 (array!72072) Bool)

(assert (=> start!97394 (array_inv!26740 _keys!1208)))

(assert (=> start!97394 true))

(assert (=> start!97394 tp!82412))

(declare-fun e!633323 () Bool)

(declare-fun array_inv!26741 (array!72074) Bool)

(assert (=> start!97394 (and (array_inv!26741 _values!996) e!633323)))

(declare-fun b!1110555 () Bool)

(declare-fun e!633326 () Bool)

(declare-fun mapRes!43264 () Bool)

(assert (=> b!1110555 (= e!633323 (and e!633326 mapRes!43264))))

(declare-fun condMapEmpty!43264 () Bool)

(declare-fun mapDefault!43264 () ValueCell!13106)

(assert (=> b!1110555 (= condMapEmpty!43264 (= (arr!34690 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13106)) mapDefault!43264)))))

(declare-fun e!633327 () Bool)

(declare-fun b!1110556 () Bool)

(declare-fun -!1018 (ListLongMap!15577 (_ BitVec 64)) ListLongMap!15577)

(assert (=> b!1110556 (= e!633327 (= call!46787 (-!1018 call!46786 k0!934)))))

(declare-fun b!1110557 () Bool)

(declare-fun res!741120 () Bool)

(assert (=> b!1110557 (=> (not res!741120) (not e!633324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72072 (_ BitVec 32)) Bool)

(assert (=> b!1110557 (= res!741120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110558 () Bool)

(assert (=> b!1110558 (= e!633327 (= call!46787 call!46786))))

(declare-fun b!1110559 () Bool)

(declare-fun res!741117 () Bool)

(assert (=> b!1110559 (=> (not res!741117) (not e!633324))))

(assert (=> b!1110559 (= res!741117 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35227 _keys!1208))))))

(declare-fun b!1110560 () Bool)

(assert (=> b!1110560 (= e!633326 tp_is_empty!27631)))

(declare-fun b!1110561 () Bool)

(assert (=> b!1110561 (= e!633324 e!633329)))

(declare-fun res!741121 () Bool)

(assert (=> b!1110561 (=> (not res!741121) (not e!633329))))

(assert (=> b!1110561 (= res!741121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496008 mask!1564))))

(assert (=> b!1110561 (= lt!496008 (array!72073 (store (arr!34689 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35227 _keys!1208)))))

(declare-fun mapIsEmpty!43264 () Bool)

(assert (=> mapIsEmpty!43264 mapRes!43264))

(declare-fun b!1110562 () Bool)

(declare-fun res!741126 () Bool)

(assert (=> b!1110562 (=> (not res!741126) (not e!633324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110562 (= res!741126 (validKeyInArray!0 k0!934))))

(declare-fun b!1110563 () Bool)

(assert (=> b!1110563 (= e!633325 true)))

(assert (=> b!1110563 e!633327))

(declare-fun c!109227 () Bool)

(assert (=> b!1110563 (= c!109227 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496007 () Unit!36259)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!291 (array!72072 array!72074 (_ BitVec 32) (_ BitVec 32) V!41969 V!41969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36259)

(assert (=> b!1110563 (= lt!496007 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!291 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110564 () Bool)

(declare-fun e!633328 () Bool)

(assert (=> b!1110564 (= e!633328 tp_is_empty!27631)))

(declare-fun b!1110565 () Bool)

(declare-fun res!741124 () Bool)

(assert (=> b!1110565 (=> (not res!741124) (not e!633324))))

(assert (=> b!1110565 (= res!741124 (= (select (arr!34689 _keys!1208) i!673) k0!934))))

(declare-fun b!1110566 () Bool)

(declare-fun res!741122 () Bool)

(assert (=> b!1110566 (=> (not res!741122) (not e!633324))))

(assert (=> b!1110566 (= res!741122 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24261))))

(declare-fun b!1110567 () Bool)

(declare-fun res!741118 () Bool)

(assert (=> b!1110567 (=> (not res!741118) (not e!633324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110567 (= res!741118 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43264 () Bool)

(declare-fun tp!82411 () Bool)

(assert (=> mapNonEmpty!43264 (= mapRes!43264 (and tp!82411 e!633328))))

(declare-fun mapKey!43264 () (_ BitVec 32))

(declare-fun mapRest!43264 () (Array (_ BitVec 32) ValueCell!13106))

(declare-fun mapValue!43264 () ValueCell!13106)

(assert (=> mapNonEmpty!43264 (= (arr!34690 _values!996) (store mapRest!43264 mapKey!43264 mapValue!43264))))

(assert (= (and start!97394 res!741127) b!1110567))

(assert (= (and b!1110567 res!741118) b!1110553))

(assert (= (and b!1110553 res!741125) b!1110557))

(assert (= (and b!1110557 res!741120) b!1110566))

(assert (= (and b!1110566 res!741122) b!1110559))

(assert (= (and b!1110559 res!741117) b!1110562))

(assert (= (and b!1110562 res!741126) b!1110565))

(assert (= (and b!1110565 res!741124) b!1110561))

(assert (= (and b!1110561 res!741121) b!1110554))

(assert (= (and b!1110554 res!741119) b!1110552))

(assert (= (and b!1110552 (not res!741123)) b!1110563))

(assert (= (and b!1110563 c!109227) b!1110556))

(assert (= (and b!1110563 (not c!109227)) b!1110558))

(assert (= (or b!1110556 b!1110558) bm!46784))

(assert (= (or b!1110556 b!1110558) bm!46783))

(assert (= (and b!1110555 condMapEmpty!43264) mapIsEmpty!43264))

(assert (= (and b!1110555 (not condMapEmpty!43264)) mapNonEmpty!43264))

(get-info :version)

(assert (= (and mapNonEmpty!43264 ((_ is ValueCellFull!13106) mapValue!43264)) b!1110564))

(assert (= (and b!1110555 ((_ is ValueCellFull!13106) mapDefault!43264)) b!1110560))

(assert (= start!97394 b!1110555))

(declare-fun b_lambda!18377 () Bool)

(assert (=> (not b_lambda!18377) (not bm!46784)))

(declare-fun t!34670 () Bool)

(declare-fun tb!8229 () Bool)

(assert (=> (and start!97394 (= defaultEntry!1004 defaultEntry!1004) t!34670) tb!8229))

(declare-fun result!17027 () Bool)

(assert (=> tb!8229 (= result!17027 tp_is_empty!27631)))

(assert (=> bm!46784 t!34670))

(declare-fun b_and!37559 () Bool)

(assert (= b_and!37557 (and (=> t!34670 result!17027) b_and!37559)))

(declare-fun m!1028025 () Bool)

(assert (=> b!1110565 m!1028025))

(declare-fun m!1028027 () Bool)

(assert (=> start!97394 m!1028027))

(declare-fun m!1028029 () Bool)

(assert (=> start!97394 m!1028029))

(declare-fun m!1028031 () Bool)

(assert (=> b!1110567 m!1028031))

(declare-fun m!1028033 () Bool)

(assert (=> mapNonEmpty!43264 m!1028033))

(declare-fun m!1028035 () Bool)

(assert (=> bm!46784 m!1028035))

(declare-fun m!1028037 () Bool)

(assert (=> bm!46784 m!1028037))

(declare-fun m!1028039 () Bool)

(assert (=> bm!46784 m!1028039))

(declare-fun m!1028041 () Bool)

(assert (=> b!1110566 m!1028041))

(declare-fun m!1028043 () Bool)

(assert (=> b!1110552 m!1028043))

(declare-fun m!1028045 () Bool)

(assert (=> b!1110552 m!1028045))

(declare-fun m!1028047 () Bool)

(assert (=> bm!46783 m!1028047))

(declare-fun m!1028049 () Bool)

(assert (=> b!1110556 m!1028049))

(declare-fun m!1028051 () Bool)

(assert (=> b!1110554 m!1028051))

(declare-fun m!1028053 () Bool)

(assert (=> b!1110562 m!1028053))

(declare-fun m!1028055 () Bool)

(assert (=> b!1110561 m!1028055))

(declare-fun m!1028057 () Bool)

(assert (=> b!1110561 m!1028057))

(declare-fun m!1028059 () Bool)

(assert (=> b!1110557 m!1028059))

(declare-fun m!1028061 () Bool)

(assert (=> b!1110563 m!1028061))

(check-sat (not b!1110561) (not mapNonEmpty!43264) (not b!1110567) (not b!1110554) (not b!1110556) (not bm!46784) (not b!1110557) (not start!97394) (not bm!46783) tp_is_empty!27631 b_and!37559 (not b!1110552) (not b!1110563) (not b_lambda!18377) (not b!1110562) (not b_next!23371) (not b!1110566))
(check-sat b_and!37559 (not b_next!23371))
