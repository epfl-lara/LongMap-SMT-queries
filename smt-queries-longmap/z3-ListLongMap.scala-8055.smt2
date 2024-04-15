; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99164 () Bool)

(assert start!99164)

(declare-fun b_free!24775 () Bool)

(declare-fun b_next!24775 () Bool)

(assert (=> start!99164 (= b_free!24775 (not b_next!24775))))

(declare-fun tp!87036 () Bool)

(declare-fun b_and!40377 () Bool)

(assert (=> start!99164 (= tp!87036 b_and!40377)))

(declare-fun b!1167142 () Bool)

(declare-fun e!663383 () Bool)

(declare-fun e!663387 () Bool)

(assert (=> b!1167142 (= e!663383 e!663387)))

(declare-fun res!774267 () Bool)

(assert (=> b!1167142 (=> (not res!774267) (not e!663387))))

(declare-datatypes ((array!75360 0))(
  ( (array!75361 (arr!36331 (Array (_ BitVec 32) (_ BitVec 64))) (size!36869 (_ BitVec 32))) )
))
(declare-fun lt!525379 () array!75360)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75360 (_ BitVec 32)) Bool)

(assert (=> b!1167142 (= res!774267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525379 mask!1564))))

(declare-fun _keys!1208 () array!75360)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167142 (= lt!525379 (array!75361 (store (arr!36331 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36869 _keys!1208)))))

(declare-fun b!1167143 () Bool)

(declare-fun e!663380 () Bool)

(declare-fun e!663386 () Bool)

(declare-fun mapRes!45782 () Bool)

(assert (=> b!1167143 (= e!663380 (and e!663386 mapRes!45782))))

(declare-fun condMapEmpty!45782 () Bool)

(declare-datatypes ((V!44201 0))(
  ( (V!44202 (val!14709 Int)) )
))
(declare-datatypes ((ValueCell!13943 0))(
  ( (ValueCellFull!13943 (v!17345 V!44201)) (EmptyCell!13943) )
))
(declare-datatypes ((array!75362 0))(
  ( (array!75363 (arr!36332 (Array (_ BitVec 32) ValueCell!13943)) (size!36870 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75362)

(declare-fun mapDefault!45782 () ValueCell!13943)

(assert (=> b!1167143 (= condMapEmpty!45782 (= (arr!36332 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13943)) mapDefault!45782)))))

(declare-fun res!774265 () Bool)

(assert (=> start!99164 (=> (not res!774265) (not e!663383))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99164 (= res!774265 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36869 _keys!1208))))))

(assert (=> start!99164 e!663383))

(declare-fun tp_is_empty!29305 () Bool)

(assert (=> start!99164 tp_is_empty!29305))

(declare-fun array_inv!27880 (array!75360) Bool)

(assert (=> start!99164 (array_inv!27880 _keys!1208)))

(assert (=> start!99164 true))

(assert (=> start!99164 tp!87036))

(declare-fun array_inv!27881 (array!75362) Bool)

(assert (=> start!99164 (and (array_inv!27881 _values!996) e!663380)))

(declare-fun b!1167144 () Bool)

(declare-fun res!774266 () Bool)

(assert (=> b!1167144 (=> (not res!774266) (not e!663383))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1167144 (= res!774266 (= (select (arr!36331 _keys!1208) i!673) k0!934))))

(declare-fun b!1167145 () Bool)

(declare-fun res!774259 () Bool)

(assert (=> b!1167145 (=> (not res!774259) (not e!663383))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1167145 (= res!774259 (and (= (size!36870 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36869 _keys!1208) (size!36870 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167146 () Bool)

(declare-fun res!774262 () Bool)

(assert (=> b!1167146 (=> (not res!774262) (not e!663383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167146 (= res!774262 (validMask!0 mask!1564))))

(declare-fun b!1167147 () Bool)

(declare-fun e!663385 () Bool)

(assert (=> b!1167147 (= e!663385 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44201)

(declare-fun lt!525381 () array!75362)

(declare-fun zeroValue!944 () V!44201)

(declare-datatypes ((tuple2!18856 0))(
  ( (tuple2!18857 (_1!9439 (_ BitVec 64)) (_2!9439 V!44201)) )
))
(declare-datatypes ((List!25573 0))(
  ( (Nil!25570) (Cons!25569 (h!26778 tuple2!18856) (t!37331 List!25573)) )
))
(declare-datatypes ((ListLongMap!16825 0))(
  ( (ListLongMap!16826 (toList!8428 List!25573)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4904 (array!75360 array!75362 (_ BitVec 32) (_ BitVec 32) V!44201 V!44201 (_ BitVec 32) Int) ListLongMap!16825)

(declare-fun -!1438 (ListLongMap!16825 (_ BitVec 64)) ListLongMap!16825)

(assert (=> b!1167147 (= (getCurrentListMapNoExtraKeys!4904 lt!525379 lt!525381 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1438 (getCurrentListMapNoExtraKeys!4904 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38341 0))(
  ( (Unit!38342) )
))
(declare-fun lt!525380 () Unit!38341)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!702 (array!75360 array!75362 (_ BitVec 32) (_ BitVec 32) V!44201 V!44201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38341)

(assert (=> b!1167147 (= lt!525380 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!702 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45782 () Bool)

(declare-fun tp!87035 () Bool)

(declare-fun e!663382 () Bool)

(assert (=> mapNonEmpty!45782 (= mapRes!45782 (and tp!87035 e!663382))))

(declare-fun mapValue!45782 () ValueCell!13943)

(declare-fun mapKey!45782 () (_ BitVec 32))

(declare-fun mapRest!45782 () (Array (_ BitVec 32) ValueCell!13943))

(assert (=> mapNonEmpty!45782 (= (arr!36332 _values!996) (store mapRest!45782 mapKey!45782 mapValue!45782))))

(declare-fun b!1167148 () Bool)

(assert (=> b!1167148 (= e!663386 tp_is_empty!29305)))

(declare-fun b!1167149 () Bool)

(declare-fun res!774258 () Bool)

(assert (=> b!1167149 (=> (not res!774258) (not e!663383))))

(declare-datatypes ((List!25574 0))(
  ( (Nil!25571) (Cons!25570 (h!26779 (_ BitVec 64)) (t!37332 List!25574)) )
))
(declare-fun arrayNoDuplicates!0 (array!75360 (_ BitVec 32) List!25574) Bool)

(assert (=> b!1167149 (= res!774258 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25571))))

(declare-fun mapIsEmpty!45782 () Bool)

(assert (=> mapIsEmpty!45782 mapRes!45782))

(declare-fun b!1167150 () Bool)

(declare-fun e!663384 () Bool)

(assert (=> b!1167150 (= e!663384 e!663385)))

(declare-fun res!774269 () Bool)

(assert (=> b!1167150 (=> res!774269 e!663385)))

(assert (=> b!1167150 (= res!774269 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525378 () ListLongMap!16825)

(assert (=> b!1167150 (= lt!525378 (getCurrentListMapNoExtraKeys!4904 lt!525379 lt!525381 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2837 (Int (_ BitVec 64)) V!44201)

(assert (=> b!1167150 (= lt!525381 (array!75363 (store (arr!36332 _values!996) i!673 (ValueCellFull!13943 (dynLambda!2837 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36870 _values!996)))))

(declare-fun lt!525377 () ListLongMap!16825)

(assert (=> b!1167150 (= lt!525377 (getCurrentListMapNoExtraKeys!4904 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167151 () Bool)

(declare-fun res!774264 () Bool)

(assert (=> b!1167151 (=> (not res!774264) (not e!663387))))

(assert (=> b!1167151 (= res!774264 (arrayNoDuplicates!0 lt!525379 #b00000000000000000000000000000000 Nil!25571))))

(declare-fun b!1167152 () Bool)

(declare-fun res!774261 () Bool)

(assert (=> b!1167152 (=> (not res!774261) (not e!663383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167152 (= res!774261 (validKeyInArray!0 k0!934))))

(declare-fun b!1167153 () Bool)

(assert (=> b!1167153 (= e!663382 tp_is_empty!29305)))

(declare-fun b!1167154 () Bool)

(assert (=> b!1167154 (= e!663387 (not e!663384))))

(declare-fun res!774263 () Bool)

(assert (=> b!1167154 (=> res!774263 e!663384)))

(assert (=> b!1167154 (= res!774263 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167154 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525376 () Unit!38341)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75360 (_ BitVec 64) (_ BitVec 32)) Unit!38341)

(assert (=> b!1167154 (= lt!525376 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167155 () Bool)

(declare-fun res!774260 () Bool)

(assert (=> b!1167155 (=> (not res!774260) (not e!663383))))

(assert (=> b!1167155 (= res!774260 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36869 _keys!1208))))))

(declare-fun b!1167156 () Bool)

(declare-fun res!774268 () Bool)

(assert (=> b!1167156 (=> (not res!774268) (not e!663383))))

(assert (=> b!1167156 (= res!774268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99164 res!774265) b!1167146))

(assert (= (and b!1167146 res!774262) b!1167145))

(assert (= (and b!1167145 res!774259) b!1167156))

(assert (= (and b!1167156 res!774268) b!1167149))

(assert (= (and b!1167149 res!774258) b!1167155))

(assert (= (and b!1167155 res!774260) b!1167152))

(assert (= (and b!1167152 res!774261) b!1167144))

(assert (= (and b!1167144 res!774266) b!1167142))

(assert (= (and b!1167142 res!774267) b!1167151))

(assert (= (and b!1167151 res!774264) b!1167154))

(assert (= (and b!1167154 (not res!774263)) b!1167150))

(assert (= (and b!1167150 (not res!774269)) b!1167147))

(assert (= (and b!1167143 condMapEmpty!45782) mapIsEmpty!45782))

(assert (= (and b!1167143 (not condMapEmpty!45782)) mapNonEmpty!45782))

(get-info :version)

(assert (= (and mapNonEmpty!45782 ((_ is ValueCellFull!13943) mapValue!45782)) b!1167153))

(assert (= (and b!1167143 ((_ is ValueCellFull!13943) mapDefault!45782)) b!1167148))

(assert (= start!99164 b!1167143))

(declare-fun b_lambda!19863 () Bool)

(assert (=> (not b_lambda!19863) (not b!1167150)))

(declare-fun t!37330 () Bool)

(declare-fun tb!9579 () Bool)

(assert (=> (and start!99164 (= defaultEntry!1004 defaultEntry!1004) t!37330) tb!9579))

(declare-fun result!19731 () Bool)

(assert (=> tb!9579 (= result!19731 tp_is_empty!29305)))

(assert (=> b!1167150 t!37330))

(declare-fun b_and!40379 () Bool)

(assert (= b_and!40377 (and (=> t!37330 result!19731) b_and!40379)))

(declare-fun m!1074607 () Bool)

(assert (=> b!1167146 m!1074607))

(declare-fun m!1074609 () Bool)

(assert (=> b!1167150 m!1074609))

(declare-fun m!1074611 () Bool)

(assert (=> b!1167150 m!1074611))

(declare-fun m!1074613 () Bool)

(assert (=> b!1167150 m!1074613))

(declare-fun m!1074615 () Bool)

(assert (=> b!1167150 m!1074615))

(declare-fun m!1074617 () Bool)

(assert (=> b!1167156 m!1074617))

(declare-fun m!1074619 () Bool)

(assert (=> b!1167151 m!1074619))

(declare-fun m!1074621 () Bool)

(assert (=> b!1167152 m!1074621))

(declare-fun m!1074623 () Bool)

(assert (=> b!1167142 m!1074623))

(declare-fun m!1074625 () Bool)

(assert (=> b!1167142 m!1074625))

(declare-fun m!1074627 () Bool)

(assert (=> mapNonEmpty!45782 m!1074627))

(declare-fun m!1074629 () Bool)

(assert (=> b!1167154 m!1074629))

(declare-fun m!1074631 () Bool)

(assert (=> b!1167154 m!1074631))

(declare-fun m!1074633 () Bool)

(assert (=> start!99164 m!1074633))

(declare-fun m!1074635 () Bool)

(assert (=> start!99164 m!1074635))

(declare-fun m!1074637 () Bool)

(assert (=> b!1167149 m!1074637))

(declare-fun m!1074639 () Bool)

(assert (=> b!1167147 m!1074639))

(declare-fun m!1074641 () Bool)

(assert (=> b!1167147 m!1074641))

(assert (=> b!1167147 m!1074641))

(declare-fun m!1074643 () Bool)

(assert (=> b!1167147 m!1074643))

(declare-fun m!1074645 () Bool)

(assert (=> b!1167147 m!1074645))

(declare-fun m!1074647 () Bool)

(assert (=> b!1167144 m!1074647))

(check-sat (not b_next!24775) (not b!1167150) tp_is_empty!29305 (not b!1167147) (not b!1167149) (not b!1167154) (not b!1167146) (not mapNonEmpty!45782) (not b!1167142) (not b!1167156) b_and!40379 (not b!1167152) (not b!1167151) (not b_lambda!19863) (not start!99164))
(check-sat b_and!40379 (not b_next!24775))
