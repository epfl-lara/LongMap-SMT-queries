; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100080 () Bool)

(assert start!100080)

(declare-fun b_free!25659 () Bool)

(declare-fun b_next!25659 () Bool)

(assert (=> start!100080 (= b_free!25659 (not b_next!25659))))

(declare-fun tp!89691 () Bool)

(declare-fun b_and!42185 () Bool)

(assert (=> start!100080 (= tp!89691 b_and!42185)))

(declare-fun mapIsEmpty!47111 () Bool)

(declare-fun mapRes!47111 () Bool)

(assert (=> mapIsEmpty!47111 mapRes!47111))

(declare-fun b!1193160 () Bool)

(declare-fun e!678153 () Bool)

(declare-fun tp_is_empty!30189 () Bool)

(assert (=> b!1193160 (= e!678153 tp_is_empty!30189)))

(declare-fun b!1193161 () Bool)

(declare-fun e!678151 () Bool)

(assert (=> b!1193161 (= e!678151 tp_is_empty!30189)))

(declare-fun b!1193162 () Bool)

(declare-fun res!793797 () Bool)

(declare-fun e!678149 () Bool)

(assert (=> b!1193162 (=> (not res!793797) (not e!678149))))

(declare-datatypes ((array!77159 0))(
  ( (array!77160 (arr!37229 (Array (_ BitVec 32) (_ BitVec 64))) (size!37765 (_ BitVec 32))) )
))
(declare-fun lt!542494 () array!77159)

(declare-datatypes ((List!26222 0))(
  ( (Nil!26219) (Cons!26218 (h!27427 (_ BitVec 64)) (t!38873 List!26222)) )
))
(declare-fun arrayNoDuplicates!0 (array!77159 (_ BitVec 32) List!26222) Bool)

(assert (=> b!1193162 (= res!793797 (arrayNoDuplicates!0 lt!542494 #b00000000000000000000000000000000 Nil!26219))))

(declare-fun res!793805 () Bool)

(declare-fun e!678148 () Bool)

(assert (=> start!100080 (=> (not res!793805) (not e!678148))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77159)

(assert (=> start!100080 (= res!793805 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37765 _keys!1208))))))

(assert (=> start!100080 e!678148))

(assert (=> start!100080 tp_is_empty!30189))

(declare-fun array_inv!28384 (array!77159) Bool)

(assert (=> start!100080 (array_inv!28384 _keys!1208)))

(assert (=> start!100080 true))

(assert (=> start!100080 tp!89691))

(declare-datatypes ((V!45379 0))(
  ( (V!45380 (val!15151 Int)) )
))
(declare-datatypes ((ValueCell!14385 0))(
  ( (ValueCellFull!14385 (v!17789 V!45379)) (EmptyCell!14385) )
))
(declare-datatypes ((array!77161 0))(
  ( (array!77162 (arr!37230 (Array (_ BitVec 32) ValueCell!14385)) (size!37766 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77161)

(declare-fun e!678147 () Bool)

(declare-fun array_inv!28385 (array!77161) Bool)

(assert (=> start!100080 (and (array_inv!28385 _values!996) e!678147)))

(declare-fun b!1193163 () Bool)

(declare-fun e!678152 () Bool)

(assert (=> b!1193163 (= e!678149 (not e!678152))))

(declare-fun res!793802 () Bool)

(assert (=> b!1193163 (=> res!793802 e!678152)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193163 (= res!793802 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193163 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39582 0))(
  ( (Unit!39583) )
))
(declare-fun lt!542492 () Unit!39582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77159 (_ BitVec 64) (_ BitVec 32)) Unit!39582)

(assert (=> b!1193163 (= lt!542492 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193164 () Bool)

(declare-fun res!793807 () Bool)

(assert (=> b!1193164 (=> (not res!793807) (not e!678148))))

(assert (=> b!1193164 (= res!793807 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26219))))

(declare-fun b!1193165 () Bool)

(declare-fun e!678154 () Bool)

(assert (=> b!1193165 (= e!678152 e!678154)))

(declare-fun res!793804 () Bool)

(assert (=> b!1193165 (=> res!793804 e!678154)))

(assert (=> b!1193165 (= res!793804 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45379)

(declare-datatypes ((tuple2!19478 0))(
  ( (tuple2!19479 (_1!9750 (_ BitVec 64)) (_2!9750 V!45379)) )
))
(declare-datatypes ((List!26223 0))(
  ( (Nil!26220) (Cons!26219 (h!27428 tuple2!19478) (t!38874 List!26223)) )
))
(declare-datatypes ((ListLongMap!17447 0))(
  ( (ListLongMap!17448 (toList!8739 List!26223)) )
))
(declare-fun lt!542493 () ListLongMap!17447)

(declare-fun lt!542491 () array!77161)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45379)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5180 (array!77159 array!77161 (_ BitVec 32) (_ BitVec 32) V!45379 V!45379 (_ BitVec 32) Int) ListLongMap!17447)

(assert (=> b!1193165 (= lt!542493 (getCurrentListMapNoExtraKeys!5180 lt!542494 lt!542491 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3110 (Int (_ BitVec 64)) V!45379)

(assert (=> b!1193165 (= lt!542491 (array!77162 (store (arr!37230 _values!996) i!673 (ValueCellFull!14385 (dynLambda!3110 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37766 _values!996)))))

(declare-fun lt!542496 () ListLongMap!17447)

(assert (=> b!1193165 (= lt!542496 (getCurrentListMapNoExtraKeys!5180 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193166 () Bool)

(declare-fun res!793796 () Bool)

(assert (=> b!1193166 (=> (not res!793796) (not e!678148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77159 (_ BitVec 32)) Bool)

(assert (=> b!1193166 (= res!793796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193167 () Bool)

(declare-fun res!793801 () Bool)

(assert (=> b!1193167 (=> (not res!793801) (not e!678148))))

(assert (=> b!1193167 (= res!793801 (= (select (arr!37229 _keys!1208) i!673) k0!934))))

(declare-fun b!1193168 () Bool)

(declare-fun res!793798 () Bool)

(assert (=> b!1193168 (=> (not res!793798) (not e!678148))))

(assert (=> b!1193168 (= res!793798 (and (= (size!37766 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37765 _keys!1208) (size!37766 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193169 () Bool)

(assert (=> b!1193169 (= e!678154 true)))

(declare-fun -!1764 (ListLongMap!17447 (_ BitVec 64)) ListLongMap!17447)

(assert (=> b!1193169 (= (getCurrentListMapNoExtraKeys!5180 lt!542494 lt!542491 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1764 (getCurrentListMapNoExtraKeys!5180 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542495 () Unit!39582)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!973 (array!77159 array!77161 (_ BitVec 32) (_ BitVec 32) V!45379 V!45379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39582)

(assert (=> b!1193169 (= lt!542495 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!973 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193170 () Bool)

(assert (=> b!1193170 (= e!678148 e!678149)))

(declare-fun res!793806 () Bool)

(assert (=> b!1193170 (=> (not res!793806) (not e!678149))))

(assert (=> b!1193170 (= res!793806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542494 mask!1564))))

(assert (=> b!1193170 (= lt!542494 (array!77160 (store (arr!37229 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37765 _keys!1208)))))

(declare-fun mapNonEmpty!47111 () Bool)

(declare-fun tp!89690 () Bool)

(assert (=> mapNonEmpty!47111 (= mapRes!47111 (and tp!89690 e!678151))))

(declare-fun mapRest!47111 () (Array (_ BitVec 32) ValueCell!14385))

(declare-fun mapKey!47111 () (_ BitVec 32))

(declare-fun mapValue!47111 () ValueCell!14385)

(assert (=> mapNonEmpty!47111 (= (arr!37230 _values!996) (store mapRest!47111 mapKey!47111 mapValue!47111))))

(declare-fun b!1193171 () Bool)

(declare-fun res!793800 () Bool)

(assert (=> b!1193171 (=> (not res!793800) (not e!678148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193171 (= res!793800 (validKeyInArray!0 k0!934))))

(declare-fun b!1193172 () Bool)

(declare-fun res!793799 () Bool)

(assert (=> b!1193172 (=> (not res!793799) (not e!678148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193172 (= res!793799 (validMask!0 mask!1564))))

(declare-fun b!1193173 () Bool)

(declare-fun res!793803 () Bool)

(assert (=> b!1193173 (=> (not res!793803) (not e!678148))))

(assert (=> b!1193173 (= res!793803 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37765 _keys!1208))))))

(declare-fun b!1193174 () Bool)

(assert (=> b!1193174 (= e!678147 (and e!678153 mapRes!47111))))

(declare-fun condMapEmpty!47111 () Bool)

(declare-fun mapDefault!47111 () ValueCell!14385)

(assert (=> b!1193174 (= condMapEmpty!47111 (= (arr!37230 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14385)) mapDefault!47111)))))

(assert (= (and start!100080 res!793805) b!1193172))

(assert (= (and b!1193172 res!793799) b!1193168))

(assert (= (and b!1193168 res!793798) b!1193166))

(assert (= (and b!1193166 res!793796) b!1193164))

(assert (= (and b!1193164 res!793807) b!1193173))

(assert (= (and b!1193173 res!793803) b!1193171))

(assert (= (and b!1193171 res!793800) b!1193167))

(assert (= (and b!1193167 res!793801) b!1193170))

(assert (= (and b!1193170 res!793806) b!1193162))

(assert (= (and b!1193162 res!793797) b!1193163))

(assert (= (and b!1193163 (not res!793802)) b!1193165))

(assert (= (and b!1193165 (not res!793804)) b!1193169))

(assert (= (and b!1193174 condMapEmpty!47111) mapIsEmpty!47111))

(assert (= (and b!1193174 (not condMapEmpty!47111)) mapNonEmpty!47111))

(get-info :version)

(assert (= (and mapNonEmpty!47111 ((_ is ValueCellFull!14385) mapValue!47111)) b!1193161))

(assert (= (and b!1193174 ((_ is ValueCellFull!14385) mapDefault!47111)) b!1193160))

(assert (= start!100080 b!1193174))

(declare-fun b_lambda!20803 () Bool)

(assert (=> (not b_lambda!20803) (not b!1193165)))

(declare-fun t!38872 () Bool)

(declare-fun tb!10471 () Bool)

(assert (=> (and start!100080 (= defaultEntry!1004 defaultEntry!1004) t!38872) tb!10471))

(declare-fun result!21509 () Bool)

(assert (=> tb!10471 (= result!21509 tp_is_empty!30189)))

(assert (=> b!1193165 t!38872))

(declare-fun b_and!42187 () Bool)

(assert (= b_and!42185 (and (=> t!38872 result!21509) b_and!42187)))

(declare-fun m!1101441 () Bool)

(assert (=> b!1193163 m!1101441))

(declare-fun m!1101443 () Bool)

(assert (=> b!1193163 m!1101443))

(declare-fun m!1101445 () Bool)

(assert (=> b!1193172 m!1101445))

(declare-fun m!1101447 () Bool)

(assert (=> mapNonEmpty!47111 m!1101447))

(declare-fun m!1101449 () Bool)

(assert (=> b!1193167 m!1101449))

(declare-fun m!1101451 () Bool)

(assert (=> b!1193169 m!1101451))

(declare-fun m!1101453 () Bool)

(assert (=> b!1193169 m!1101453))

(assert (=> b!1193169 m!1101453))

(declare-fun m!1101455 () Bool)

(assert (=> b!1193169 m!1101455))

(declare-fun m!1101457 () Bool)

(assert (=> b!1193169 m!1101457))

(declare-fun m!1101459 () Bool)

(assert (=> b!1193170 m!1101459))

(declare-fun m!1101461 () Bool)

(assert (=> b!1193170 m!1101461))

(declare-fun m!1101463 () Bool)

(assert (=> b!1193171 m!1101463))

(declare-fun m!1101465 () Bool)

(assert (=> b!1193165 m!1101465))

(declare-fun m!1101467 () Bool)

(assert (=> b!1193165 m!1101467))

(declare-fun m!1101469 () Bool)

(assert (=> b!1193165 m!1101469))

(declare-fun m!1101471 () Bool)

(assert (=> b!1193165 m!1101471))

(declare-fun m!1101473 () Bool)

(assert (=> start!100080 m!1101473))

(declare-fun m!1101475 () Bool)

(assert (=> start!100080 m!1101475))

(declare-fun m!1101477 () Bool)

(assert (=> b!1193166 m!1101477))

(declare-fun m!1101479 () Bool)

(assert (=> b!1193164 m!1101479))

(declare-fun m!1101481 () Bool)

(assert (=> b!1193162 m!1101481))

(check-sat b_and!42187 (not b_next!25659) (not start!100080) tp_is_empty!30189 (not mapNonEmpty!47111) (not b!1193170) (not b!1193169) (not b!1193172) (not b_lambda!20803) (not b!1193164) (not b!1193171) (not b!1193166) (not b!1193162) (not b!1193165) (not b!1193163))
(check-sat b_and!42187 (not b_next!25659))
