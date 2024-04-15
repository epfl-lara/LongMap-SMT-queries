; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100096 () Bool)

(assert start!100096)

(declare-fun b_free!25675 () Bool)

(declare-fun b_next!25675 () Bool)

(assert (=> start!100096 (= b_free!25675 (not b_next!25675))))

(declare-fun tp!89748 () Bool)

(declare-fun b_and!42195 () Bool)

(assert (=> start!100096 (= tp!89748 b_and!42195)))

(declare-fun b!1193545 () Bool)

(declare-fun e!678326 () Bool)

(declare-fun e!678323 () Bool)

(assert (=> b!1193545 (= e!678326 (not e!678323))))

(declare-fun res!794115 () Bool)

(assert (=> b!1193545 (=> res!794115 e!678323)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193545 (= res!794115 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77138 0))(
  ( (array!77139 (arr!37219 (Array (_ BitVec 32) (_ BitVec 64))) (size!37757 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77138)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193545 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39471 0))(
  ( (Unit!39472) )
))
(declare-fun lt!542459 () Unit!39471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77138 (_ BitVec 64) (_ BitVec 32)) Unit!39471)

(assert (=> b!1193545 (= lt!542459 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!794111 () Bool)

(declare-fun e!678324 () Bool)

(assert (=> start!100096 (=> (not res!794111) (not e!678324))))

(assert (=> start!100096 (= res!794111 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37757 _keys!1208))))))

(assert (=> start!100096 e!678324))

(declare-fun tp_is_empty!30211 () Bool)

(assert (=> start!100096 tp_is_empty!30211))

(declare-fun array_inv!28496 (array!77138) Bool)

(assert (=> start!100096 (array_inv!28496 _keys!1208)))

(assert (=> start!100096 true))

(assert (=> start!100096 tp!89748))

(declare-datatypes ((V!45409 0))(
  ( (V!45410 (val!15162 Int)) )
))
(declare-datatypes ((ValueCell!14396 0))(
  ( (ValueCellFull!14396 (v!17799 V!45409)) (EmptyCell!14396) )
))
(declare-datatypes ((array!77140 0))(
  ( (array!77141 (arr!37220 (Array (_ BitVec 32) ValueCell!14396)) (size!37758 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77140)

(declare-fun e!678325 () Bool)

(declare-fun array_inv!28497 (array!77140) Bool)

(assert (=> start!100096 (and (array_inv!28497 _values!996) e!678325)))

(declare-fun b!1193546 () Bool)

(declare-fun res!794106 () Bool)

(assert (=> b!1193546 (=> (not res!794106) (not e!678324))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193546 (= res!794106 (validMask!0 mask!1564))))

(declare-fun b!1193547 () Bool)

(declare-fun e!678322 () Bool)

(declare-fun mapRes!47144 () Bool)

(assert (=> b!1193547 (= e!678325 (and e!678322 mapRes!47144))))

(declare-fun condMapEmpty!47144 () Bool)

(declare-fun mapDefault!47144 () ValueCell!14396)

(assert (=> b!1193547 (= condMapEmpty!47144 (= (arr!37220 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14396)) mapDefault!47144)))))

(declare-fun b!1193548 () Bool)

(declare-fun res!794109 () Bool)

(assert (=> b!1193548 (=> (not res!794109) (not e!678324))))

(assert (=> b!1193548 (= res!794109 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37757 _keys!1208))))))

(declare-fun b!1193549 () Bool)

(declare-fun res!794114 () Bool)

(assert (=> b!1193549 (=> (not res!794114) (not e!678326))))

(declare-fun lt!542458 () array!77138)

(declare-datatypes ((List!26319 0))(
  ( (Nil!26316) (Cons!26315 (h!27524 (_ BitVec 64)) (t!38977 List!26319)) )
))
(declare-fun arrayNoDuplicates!0 (array!77138 (_ BitVec 32) List!26319) Bool)

(assert (=> b!1193549 (= res!794114 (arrayNoDuplicates!0 lt!542458 #b00000000000000000000000000000000 Nil!26316))))

(declare-fun b!1193550 () Bool)

(declare-fun res!794116 () Bool)

(assert (=> b!1193550 (=> (not res!794116) (not e!678324))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193550 (= res!794116 (and (= (size!37758 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37757 _keys!1208) (size!37758 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193551 () Bool)

(declare-fun res!794107 () Bool)

(assert (=> b!1193551 (=> (not res!794107) (not e!678324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77138 (_ BitVec 32)) Bool)

(assert (=> b!1193551 (= res!794107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193552 () Bool)

(declare-fun e!678328 () Bool)

(assert (=> b!1193552 (= e!678328 tp_is_empty!30211)))

(declare-fun b!1193553 () Bool)

(assert (=> b!1193553 (= e!678323 (or (= from!1455 i!673) (bvslt from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45409)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45409)

(declare-datatypes ((tuple2!19602 0))(
  ( (tuple2!19603 (_1!9812 (_ BitVec 64)) (_2!9812 V!45409)) )
))
(declare-datatypes ((List!26320 0))(
  ( (Nil!26317) (Cons!26316 (h!27525 tuple2!19602) (t!38978 List!26320)) )
))
(declare-datatypes ((ListLongMap!17571 0))(
  ( (ListLongMap!17572 (toList!8801 List!26320)) )
))
(declare-fun lt!542460 () ListLongMap!17571)

(declare-fun getCurrentListMapNoExtraKeys!5251 (array!77138 array!77140 (_ BitVec 32) (_ BitVec 32) V!45409 V!45409 (_ BitVec 32) Int) ListLongMap!17571)

(declare-fun dynLambda!3135 (Int (_ BitVec 64)) V!45409)

(assert (=> b!1193553 (= lt!542460 (getCurrentListMapNoExtraKeys!5251 lt!542458 (array!77141 (store (arr!37220 _values!996) i!673 (ValueCellFull!14396 (dynLambda!3135 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37758 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!542457 () ListLongMap!17571)

(assert (=> b!1193553 (= lt!542457 (getCurrentListMapNoExtraKeys!5251 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47144 () Bool)

(declare-fun tp!89747 () Bool)

(assert (=> mapNonEmpty!47144 (= mapRes!47144 (and tp!89747 e!678328))))

(declare-fun mapKey!47144 () (_ BitVec 32))

(declare-fun mapValue!47144 () ValueCell!14396)

(declare-fun mapRest!47144 () (Array (_ BitVec 32) ValueCell!14396))

(assert (=> mapNonEmpty!47144 (= (arr!37220 _values!996) (store mapRest!47144 mapKey!47144 mapValue!47144))))

(declare-fun b!1193554 () Bool)

(declare-fun res!794112 () Bool)

(assert (=> b!1193554 (=> (not res!794112) (not e!678324))))

(assert (=> b!1193554 (= res!794112 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26316))))

(declare-fun mapIsEmpty!47144 () Bool)

(assert (=> mapIsEmpty!47144 mapRes!47144))

(declare-fun b!1193555 () Bool)

(declare-fun res!794110 () Bool)

(assert (=> b!1193555 (=> (not res!794110) (not e!678324))))

(assert (=> b!1193555 (= res!794110 (= (select (arr!37219 _keys!1208) i!673) k0!934))))

(declare-fun b!1193556 () Bool)

(declare-fun res!794108 () Bool)

(assert (=> b!1193556 (=> (not res!794108) (not e!678324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193556 (= res!794108 (validKeyInArray!0 k0!934))))

(declare-fun b!1193557 () Bool)

(assert (=> b!1193557 (= e!678322 tp_is_empty!30211)))

(declare-fun b!1193558 () Bool)

(assert (=> b!1193558 (= e!678324 e!678326)))

(declare-fun res!794113 () Bool)

(assert (=> b!1193558 (=> (not res!794113) (not e!678326))))

(assert (=> b!1193558 (= res!794113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542458 mask!1564))))

(assert (=> b!1193558 (= lt!542458 (array!77139 (store (arr!37219 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37757 _keys!1208)))))

(assert (= (and start!100096 res!794111) b!1193546))

(assert (= (and b!1193546 res!794106) b!1193550))

(assert (= (and b!1193550 res!794116) b!1193551))

(assert (= (and b!1193551 res!794107) b!1193554))

(assert (= (and b!1193554 res!794112) b!1193548))

(assert (= (and b!1193548 res!794109) b!1193556))

(assert (= (and b!1193556 res!794108) b!1193555))

(assert (= (and b!1193555 res!794110) b!1193558))

(assert (= (and b!1193558 res!794113) b!1193549))

(assert (= (and b!1193549 res!794114) b!1193545))

(assert (= (and b!1193545 (not res!794115)) b!1193553))

(assert (= (and b!1193547 condMapEmpty!47144) mapIsEmpty!47144))

(assert (= (and b!1193547 (not condMapEmpty!47144)) mapNonEmpty!47144))

(get-info :version)

(assert (= (and mapNonEmpty!47144 ((_ is ValueCellFull!14396) mapValue!47144)) b!1193552))

(assert (= (and b!1193547 ((_ is ValueCellFull!14396) mapDefault!47144)) b!1193557))

(assert (= start!100096 b!1193547))

(declare-fun b_lambda!20801 () Bool)

(assert (=> (not b_lambda!20801) (not b!1193553)))

(declare-fun t!38976 () Bool)

(declare-fun tb!10479 () Bool)

(assert (=> (and start!100096 (= defaultEntry!1004 defaultEntry!1004) t!38976) tb!10479))

(declare-fun result!21533 () Bool)

(assert (=> tb!10479 (= result!21533 tp_is_empty!30211)))

(assert (=> b!1193553 t!38976))

(declare-fun b_and!42197 () Bool)

(assert (= b_and!42195 (and (=> t!38976 result!21533) b_and!42197)))

(declare-fun m!1101251 () Bool)

(assert (=> b!1193554 m!1101251))

(declare-fun m!1101253 () Bool)

(assert (=> b!1193546 m!1101253))

(declare-fun m!1101255 () Bool)

(assert (=> b!1193549 m!1101255))

(declare-fun m!1101257 () Bool)

(assert (=> mapNonEmpty!47144 m!1101257))

(declare-fun m!1101259 () Bool)

(assert (=> b!1193556 m!1101259))

(declare-fun m!1101261 () Bool)

(assert (=> b!1193551 m!1101261))

(declare-fun m!1101263 () Bool)

(assert (=> start!100096 m!1101263))

(declare-fun m!1101265 () Bool)

(assert (=> start!100096 m!1101265))

(declare-fun m!1101267 () Bool)

(assert (=> b!1193558 m!1101267))

(declare-fun m!1101269 () Bool)

(assert (=> b!1193558 m!1101269))

(declare-fun m!1101271 () Bool)

(assert (=> b!1193553 m!1101271))

(declare-fun m!1101273 () Bool)

(assert (=> b!1193553 m!1101273))

(declare-fun m!1101275 () Bool)

(assert (=> b!1193553 m!1101275))

(declare-fun m!1101277 () Bool)

(assert (=> b!1193553 m!1101277))

(declare-fun m!1101279 () Bool)

(assert (=> b!1193555 m!1101279))

(declare-fun m!1101281 () Bool)

(assert (=> b!1193545 m!1101281))

(declare-fun m!1101283 () Bool)

(assert (=> b!1193545 m!1101283))

(check-sat (not b!1193545) (not b!1193551) (not b!1193558) tp_is_empty!30211 (not b!1193556) (not b_lambda!20801) (not mapNonEmpty!47144) (not start!100096) (not b_next!25675) (not b!1193549) b_and!42197 (not b!1193546) (not b!1193554) (not b!1193553))
(check-sat b_and!42197 (not b_next!25675))
