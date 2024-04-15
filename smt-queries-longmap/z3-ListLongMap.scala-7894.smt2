; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98102 () Bool)

(assert start!98102)

(declare-fun b_free!23809 () Bool)

(declare-fun b_next!23809 () Bool)

(assert (=> start!98102 (= b_free!23809 (not b_next!23809))))

(declare-fun tp!84131 () Bool)

(declare-fun b_and!38379 () Bool)

(assert (=> start!98102 (= tp!84131 b_and!38379)))

(declare-fun b!1127122 () Bool)

(declare-fun res!753219 () Bool)

(declare-fun e!641520 () Bool)

(assert (=> b!1127122 (=> (not res!753219) (not e!641520))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73464 0))(
  ( (array!73465 (arr!35385 (Array (_ BitVec 32) (_ BitVec 64))) (size!35923 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73464)

(assert (=> b!1127122 (= res!753219 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35923 _keys!1208))))))

(declare-fun b!1127123 () Bool)

(declare-fun e!641521 () Bool)

(declare-fun tp_is_empty!28339 () Bool)

(assert (=> b!1127123 (= e!641521 tp_is_empty!28339)))

(declare-fun b!1127124 () Bool)

(declare-fun e!641522 () Bool)

(declare-fun e!641526 () Bool)

(assert (=> b!1127124 (= e!641522 e!641526)))

(declare-fun res!753227 () Bool)

(assert (=> b!1127124 (=> res!753227 e!641526)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1127124 (= res!753227 (not (= (select (arr!35385 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641523 () Bool)

(assert (=> b!1127124 e!641523))

(declare-fun c!109677 () Bool)

(assert (=> b!1127124 (= c!109677 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42913 0))(
  ( (V!42914 (val!14226 Int)) )
))
(declare-fun zeroValue!944 () V!42913)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((Unit!36787 0))(
  ( (Unit!36788) )
))
(declare-fun lt!500321 () Unit!36787)

(declare-datatypes ((ValueCell!13460 0))(
  ( (ValueCellFull!13460 (v!16858 V!42913)) (EmptyCell!13460) )
))
(declare-datatypes ((array!73466 0))(
  ( (array!73467 (arr!35386 (Array (_ BitVec 32) ValueCell!13460)) (size!35924 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73466)

(declare-fun minValue!944 () V!42913)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!398 (array!73464 array!73466 (_ BitVec 32) (_ BitVec 32) V!42913 V!42913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36787)

(assert (=> b!1127124 (= lt!500321 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127125 () Bool)

(declare-fun res!753217 () Bool)

(assert (=> b!1127125 (=> (not res!753217) (not e!641520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73464 (_ BitVec 32)) Bool)

(assert (=> b!1127125 (= res!753217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127126 () Bool)

(declare-fun res!753224 () Bool)

(assert (=> b!1127126 (=> (not res!753224) (not e!641520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127126 (= res!753224 (validMask!0 mask!1564))))

(declare-fun b!1127127 () Bool)

(declare-fun e!641524 () Bool)

(declare-fun e!641525 () Bool)

(declare-fun mapRes!44326 () Bool)

(assert (=> b!1127127 (= e!641524 (and e!641525 mapRes!44326))))

(declare-fun condMapEmpty!44326 () Bool)

(declare-fun mapDefault!44326 () ValueCell!13460)

(assert (=> b!1127127 (= condMapEmpty!44326 (= (arr!35386 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13460)) mapDefault!44326)))))

(declare-fun b!1127128 () Bool)

(assert (=> b!1127128 (= e!641525 tp_is_empty!28339)))

(declare-fun b!1127129 () Bool)

(declare-fun res!753221 () Bool)

(assert (=> b!1127129 (=> (not res!753221) (not e!641520))))

(declare-datatypes ((List!24743 0))(
  ( (Nil!24740) (Cons!24739 (h!25948 (_ BitVec 64)) (t!35535 List!24743)) )
))
(declare-fun arrayNoDuplicates!0 (array!73464 (_ BitVec 32) List!24743) Bool)

(assert (=> b!1127129 (= res!753221 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24740))))

(declare-fun b!1127130 () Bool)

(declare-fun res!753228 () Bool)

(assert (=> b!1127130 (=> (not res!753228) (not e!641520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127130 (= res!753228 (validKeyInArray!0 k0!934))))

(declare-fun lt!500320 () array!73466)

(declare-fun lt!500318 () array!73464)

(declare-datatypes ((tuple2!17986 0))(
  ( (tuple2!17987 (_1!9004 (_ BitVec 64)) (_2!9004 V!42913)) )
))
(declare-datatypes ((List!24744 0))(
  ( (Nil!24741) (Cons!24740 (h!25949 tuple2!17986) (t!35536 List!24744)) )
))
(declare-datatypes ((ListLongMap!15955 0))(
  ( (ListLongMap!15956 (toList!7993 List!24744)) )
))
(declare-fun call!47687 () ListLongMap!15955)

(declare-fun bm!47683 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4493 (array!73464 array!73466 (_ BitVec 32) (_ BitVec 32) V!42913 V!42913 (_ BitVec 32) Int) ListLongMap!15955)

(assert (=> bm!47683 (= call!47687 (getCurrentListMapNoExtraKeys!4493 lt!500318 lt!500320 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44326 () Bool)

(declare-fun tp!84130 () Bool)

(assert (=> mapNonEmpty!44326 (= mapRes!44326 (and tp!84130 e!641521))))

(declare-fun mapKey!44326 () (_ BitVec 32))

(declare-fun mapValue!44326 () ValueCell!13460)

(declare-fun mapRest!44326 () (Array (_ BitVec 32) ValueCell!13460))

(assert (=> mapNonEmpty!44326 (= (arr!35386 _values!996) (store mapRest!44326 mapKey!44326 mapValue!44326))))

(declare-fun b!1127131 () Bool)

(declare-fun call!47686 () ListLongMap!15955)

(assert (=> b!1127131 (= e!641523 (= call!47687 call!47686))))

(declare-fun res!753220 () Bool)

(assert (=> start!98102 (=> (not res!753220) (not e!641520))))

(assert (=> start!98102 (= res!753220 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35923 _keys!1208))))))

(assert (=> start!98102 e!641520))

(assert (=> start!98102 tp_is_empty!28339))

(declare-fun array_inv!27234 (array!73464) Bool)

(assert (=> start!98102 (array_inv!27234 _keys!1208)))

(assert (=> start!98102 true))

(assert (=> start!98102 tp!84131))

(declare-fun array_inv!27235 (array!73466) Bool)

(assert (=> start!98102 (and (array_inv!27235 _values!996) e!641524)))

(declare-fun b!1127132 () Bool)

(declare-fun res!753229 () Bool)

(assert (=> b!1127132 (=> (not res!753229) (not e!641520))))

(assert (=> b!1127132 (= res!753229 (= (select (arr!35385 _keys!1208) i!673) k0!934))))

(declare-fun b!1127133 () Bool)

(declare-fun e!641518 () Bool)

(assert (=> b!1127133 (= e!641518 e!641522)))

(declare-fun res!753226 () Bool)

(assert (=> b!1127133 (=> res!753226 e!641522)))

(assert (=> b!1127133 (= res!753226 (not (= from!1455 i!673)))))

(declare-fun lt!500316 () ListLongMap!15955)

(assert (=> b!1127133 (= lt!500316 (getCurrentListMapNoExtraKeys!4493 lt!500318 lt!500320 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2507 (Int (_ BitVec 64)) V!42913)

(assert (=> b!1127133 (= lt!500320 (array!73467 (store (arr!35386 _values!996) i!673 (ValueCellFull!13460 (dynLambda!2507 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35924 _values!996)))))

(declare-fun lt!500317 () ListLongMap!15955)

(assert (=> b!1127133 (= lt!500317 (getCurrentListMapNoExtraKeys!4493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47684 () Bool)

(assert (=> bm!47684 (= call!47686 (getCurrentListMapNoExtraKeys!4493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127134 () Bool)

(declare-fun -!1118 (ListLongMap!15955 (_ BitVec 64)) ListLongMap!15955)

(assert (=> b!1127134 (= e!641523 (= call!47687 (-!1118 call!47686 k0!934)))))

(declare-fun b!1127135 () Bool)

(declare-fun res!753218 () Bool)

(declare-fun e!641519 () Bool)

(assert (=> b!1127135 (=> (not res!753218) (not e!641519))))

(assert (=> b!1127135 (= res!753218 (arrayNoDuplicates!0 lt!500318 #b00000000000000000000000000000000 Nil!24740))))

(declare-fun b!1127136 () Bool)

(assert (=> b!1127136 (= e!641519 (not e!641518))))

(declare-fun res!753223 () Bool)

(assert (=> b!1127136 (=> res!753223 e!641518)))

(assert (=> b!1127136 (= res!753223 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127136 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500319 () Unit!36787)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73464 (_ BitVec 64) (_ BitVec 32)) Unit!36787)

(assert (=> b!1127136 (= lt!500319 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44326 () Bool)

(assert (=> mapIsEmpty!44326 mapRes!44326))

(declare-fun b!1127137 () Bool)

(declare-fun res!753222 () Bool)

(assert (=> b!1127137 (=> (not res!753222) (not e!641520))))

(assert (=> b!1127137 (= res!753222 (and (= (size!35924 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35923 _keys!1208) (size!35924 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127138 () Bool)

(assert (=> b!1127138 (= e!641526 true)))

(declare-fun lt!500322 () Bool)

(declare-fun contains!6452 (ListLongMap!15955 (_ BitVec 64)) Bool)

(assert (=> b!1127138 (= lt!500322 (contains!6452 (getCurrentListMapNoExtraKeys!4493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127139 () Bool)

(assert (=> b!1127139 (= e!641520 e!641519)))

(declare-fun res!753225 () Bool)

(assert (=> b!1127139 (=> (not res!753225) (not e!641519))))

(assert (=> b!1127139 (= res!753225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500318 mask!1564))))

(assert (=> b!1127139 (= lt!500318 (array!73465 (store (arr!35385 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35923 _keys!1208)))))

(assert (= (and start!98102 res!753220) b!1127126))

(assert (= (and b!1127126 res!753224) b!1127137))

(assert (= (and b!1127137 res!753222) b!1127125))

(assert (= (and b!1127125 res!753217) b!1127129))

(assert (= (and b!1127129 res!753221) b!1127122))

(assert (= (and b!1127122 res!753219) b!1127130))

(assert (= (and b!1127130 res!753228) b!1127132))

(assert (= (and b!1127132 res!753229) b!1127139))

(assert (= (and b!1127139 res!753225) b!1127135))

(assert (= (and b!1127135 res!753218) b!1127136))

(assert (= (and b!1127136 (not res!753223)) b!1127133))

(assert (= (and b!1127133 (not res!753226)) b!1127124))

(assert (= (and b!1127124 c!109677) b!1127134))

(assert (= (and b!1127124 (not c!109677)) b!1127131))

(assert (= (or b!1127134 b!1127131) bm!47683))

(assert (= (or b!1127134 b!1127131) bm!47684))

(assert (= (and b!1127124 (not res!753227)) b!1127138))

(assert (= (and b!1127127 condMapEmpty!44326) mapIsEmpty!44326))

(assert (= (and b!1127127 (not condMapEmpty!44326)) mapNonEmpty!44326))

(get-info :version)

(assert (= (and mapNonEmpty!44326 ((_ is ValueCellFull!13460) mapValue!44326)) b!1127123))

(assert (= (and b!1127127 ((_ is ValueCellFull!13460) mapDefault!44326)) b!1127128))

(assert (= start!98102 b!1127127))

(declare-fun b_lambda!18761 () Bool)

(assert (=> (not b_lambda!18761) (not b!1127133)))

(declare-fun t!35534 () Bool)

(declare-fun tb!8613 () Bool)

(assert (=> (and start!98102 (= defaultEntry!1004 defaultEntry!1004) t!35534) tb!8613))

(declare-fun result!17795 () Bool)

(assert (=> tb!8613 (= result!17795 tp_is_empty!28339)))

(assert (=> b!1127133 t!35534))

(declare-fun b_and!38381 () Bool)

(assert (= b_and!38379 (and (=> t!35534 result!17795) b_and!38381)))

(declare-fun m!1040433 () Bool)

(assert (=> b!1127136 m!1040433))

(declare-fun m!1040435 () Bool)

(assert (=> b!1127136 m!1040435))

(declare-fun m!1040437 () Bool)

(assert (=> bm!47684 m!1040437))

(declare-fun m!1040439 () Bool)

(assert (=> b!1127135 m!1040439))

(declare-fun m!1040441 () Bool)

(assert (=> start!98102 m!1040441))

(declare-fun m!1040443 () Bool)

(assert (=> start!98102 m!1040443))

(declare-fun m!1040445 () Bool)

(assert (=> b!1127124 m!1040445))

(declare-fun m!1040447 () Bool)

(assert (=> b!1127124 m!1040447))

(declare-fun m!1040449 () Bool)

(assert (=> mapNonEmpty!44326 m!1040449))

(declare-fun m!1040451 () Bool)

(assert (=> b!1127132 m!1040451))

(declare-fun m!1040453 () Bool)

(assert (=> b!1127129 m!1040453))

(declare-fun m!1040455 () Bool)

(assert (=> b!1127125 m!1040455))

(declare-fun m!1040457 () Bool)

(assert (=> b!1127126 m!1040457))

(declare-fun m!1040459 () Bool)

(assert (=> b!1127134 m!1040459))

(declare-fun m!1040461 () Bool)

(assert (=> b!1127133 m!1040461))

(declare-fun m!1040463 () Bool)

(assert (=> b!1127133 m!1040463))

(declare-fun m!1040465 () Bool)

(assert (=> b!1127133 m!1040465))

(declare-fun m!1040467 () Bool)

(assert (=> b!1127133 m!1040467))

(declare-fun m!1040469 () Bool)

(assert (=> b!1127130 m!1040469))

(assert (=> b!1127138 m!1040437))

(assert (=> b!1127138 m!1040437))

(declare-fun m!1040471 () Bool)

(assert (=> b!1127138 m!1040471))

(declare-fun m!1040473 () Bool)

(assert (=> bm!47683 m!1040473))

(declare-fun m!1040475 () Bool)

(assert (=> b!1127139 m!1040475))

(declare-fun m!1040477 () Bool)

(assert (=> b!1127139 m!1040477))

(check-sat (not b!1127133) (not b!1127138) (not b!1127125) (not b!1127129) (not bm!47684) (not b!1127134) (not b!1127126) (not b_next!23809) (not b!1127135) b_and!38381 tp_is_empty!28339 (not b!1127136) (not b_lambda!18761) (not start!98102) (not bm!47683) (not b!1127139) (not b!1127124) (not b!1127130) (not mapNonEmpty!44326))
(check-sat b_and!38381 (not b_next!23809))
