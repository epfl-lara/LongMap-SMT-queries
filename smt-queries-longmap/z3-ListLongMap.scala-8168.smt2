; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99868 () Bool)

(assert start!99868)

(declare-fun b_free!25453 () Bool)

(declare-fun b_next!25453 () Bool)

(assert (=> start!99868 (= b_free!25453 (not b_next!25453))))

(declare-fun tp!89073 () Bool)

(declare-fun b_and!41751 () Bool)

(assert (=> start!99868 (= tp!89073 b_and!41751)))

(declare-fun mapIsEmpty!46802 () Bool)

(declare-fun mapRes!46802 () Bool)

(assert (=> mapIsEmpty!46802 mapRes!46802))

(declare-fun b!1188195 () Bool)

(declare-fun res!790026 () Bool)

(declare-fun e!675597 () Bool)

(assert (=> b!1188195 (=> (not res!790026) (not e!675597))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188195 (= res!790026 (validKeyInArray!0 k0!934))))

(declare-fun b!1188196 () Bool)

(declare-fun e!675598 () Bool)

(declare-fun tp_is_empty!29983 () Bool)

(assert (=> b!1188196 (= e!675598 tp_is_empty!29983)))

(declare-fun mapNonEmpty!46802 () Bool)

(declare-fun tp!89072 () Bool)

(assert (=> mapNonEmpty!46802 (= mapRes!46802 (and tp!89072 e!675598))))

(declare-datatypes ((V!45105 0))(
  ( (V!45106 (val!15048 Int)) )
))
(declare-datatypes ((ValueCell!14282 0))(
  ( (ValueCellFull!14282 (v!17685 V!45105)) (EmptyCell!14282) )
))
(declare-fun mapRest!46802 () (Array (_ BitVec 32) ValueCell!14282))

(declare-fun mapValue!46802 () ValueCell!14282)

(declare-datatypes ((array!76698 0))(
  ( (array!76699 (arr!36999 (Array (_ BitVec 32) ValueCell!14282)) (size!37537 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76698)

(declare-fun mapKey!46802 () (_ BitVec 32))

(assert (=> mapNonEmpty!46802 (= (arr!36999 _values!996) (store mapRest!46802 mapKey!46802 mapValue!46802))))

(declare-fun b!1188197 () Bool)

(declare-fun res!790027 () Bool)

(assert (=> b!1188197 (=> (not res!790027) (not e!675597))))

(declare-datatypes ((array!76700 0))(
  ( (array!76701 (arr!37000 (Array (_ BitVec 32) (_ BitVec 64))) (size!37538 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76700)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1188197 (= res!790027 (and (= (size!37537 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37538 _keys!1208) (size!37537 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188198 () Bool)

(declare-fun res!790024 () Bool)

(assert (=> b!1188198 (=> (not res!790024) (not e!675597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188198 (= res!790024 (validMask!0 mask!1564))))

(declare-fun b!1188199 () Bool)

(declare-fun e!675600 () Bool)

(declare-fun e!675603 () Bool)

(assert (=> b!1188199 (= e!675600 (and e!675603 mapRes!46802))))

(declare-fun condMapEmpty!46802 () Bool)

(declare-fun mapDefault!46802 () ValueCell!14282)

(assert (=> b!1188199 (= condMapEmpty!46802 (= (arr!36999 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14282)) mapDefault!46802)))))

(declare-fun b!1188200 () Bool)

(declare-fun e!675601 () Bool)

(declare-fun e!675602 () Bool)

(assert (=> b!1188200 (= e!675601 e!675602)))

(declare-fun res!790028 () Bool)

(assert (=> b!1188200 (=> res!790028 e!675602)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188200 (= res!790028 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45105)

(declare-fun lt!540448 () array!76698)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19436 0))(
  ( (tuple2!19437 (_1!9729 (_ BitVec 64)) (_2!9729 V!45105)) )
))
(declare-datatypes ((List!26148 0))(
  ( (Nil!26145) (Cons!26144 (h!27353 tuple2!19436) (t!38584 List!26148)) )
))
(declare-datatypes ((ListLongMap!17405 0))(
  ( (ListLongMap!17406 (toList!8718 List!26148)) )
))
(declare-fun lt!540449 () ListLongMap!17405)

(declare-fun minValue!944 () V!45105)

(declare-fun lt!540445 () array!76700)

(declare-fun getCurrentListMapNoExtraKeys!5168 (array!76700 array!76698 (_ BitVec 32) (_ BitVec 32) V!45105 V!45105 (_ BitVec 32) Int) ListLongMap!17405)

(assert (=> b!1188200 (= lt!540449 (getCurrentListMapNoExtraKeys!5168 lt!540445 lt!540448 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3065 (Int (_ BitVec 64)) V!45105)

(assert (=> b!1188200 (= lt!540448 (array!76699 (store (arr!36999 _values!996) i!673 (ValueCellFull!14282 (dynLambda!3065 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37537 _values!996)))))

(declare-fun lt!540446 () ListLongMap!17405)

(assert (=> b!1188200 (= lt!540446 (getCurrentListMapNoExtraKeys!5168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188201 () Bool)

(declare-fun res!790032 () Bool)

(assert (=> b!1188201 (=> (not res!790032) (not e!675597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76700 (_ BitVec 32)) Bool)

(assert (=> b!1188201 (= res!790032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188202 () Bool)

(declare-fun e!675604 () Bool)

(assert (=> b!1188202 (= e!675604 (not e!675601))))

(declare-fun res!790023 () Bool)

(assert (=> b!1188202 (=> res!790023 e!675601)))

(assert (=> b!1188202 (= res!790023 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188202 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39293 0))(
  ( (Unit!39294) )
))
(declare-fun lt!540447 () Unit!39293)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76700 (_ BitVec 64) (_ BitVec 32)) Unit!39293)

(assert (=> b!1188202 (= lt!540447 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!790031 () Bool)

(assert (=> start!99868 (=> (not res!790031) (not e!675597))))

(assert (=> start!99868 (= res!790031 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37538 _keys!1208))))))

(assert (=> start!99868 e!675597))

(assert (=> start!99868 tp_is_empty!29983))

(declare-fun array_inv!28336 (array!76700) Bool)

(assert (=> start!99868 (array_inv!28336 _keys!1208)))

(assert (=> start!99868 true))

(assert (=> start!99868 tp!89073))

(declare-fun array_inv!28337 (array!76698) Bool)

(assert (=> start!99868 (and (array_inv!28337 _values!996) e!675600)))

(declare-fun b!1188203 () Bool)

(assert (=> b!1188203 (= e!675603 tp_is_empty!29983)))

(declare-fun b!1188204 () Bool)

(assert (=> b!1188204 (= e!675597 e!675604)))

(declare-fun res!790025 () Bool)

(assert (=> b!1188204 (=> (not res!790025) (not e!675604))))

(assert (=> b!1188204 (= res!790025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540445 mask!1564))))

(assert (=> b!1188204 (= lt!540445 (array!76701 (store (arr!37000 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37538 _keys!1208)))))

(declare-fun b!1188205 () Bool)

(declare-fun res!790029 () Bool)

(assert (=> b!1188205 (=> (not res!790029) (not e!675597))))

(declare-datatypes ((List!26149 0))(
  ( (Nil!26146) (Cons!26145 (h!27354 (_ BitVec 64)) (t!38585 List!26149)) )
))
(declare-fun arrayNoDuplicates!0 (array!76700 (_ BitVec 32) List!26149) Bool)

(assert (=> b!1188205 (= res!790029 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26146))))

(declare-fun b!1188206 () Bool)

(assert (=> b!1188206 (= e!675602 true)))

(declare-fun -!1667 (ListLongMap!17405 (_ BitVec 64)) ListLongMap!17405)

(assert (=> b!1188206 (= (getCurrentListMapNoExtraKeys!5168 lt!540445 lt!540448 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1667 (getCurrentListMapNoExtraKeys!5168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540450 () Unit!39293)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!917 (array!76700 array!76698 (_ BitVec 32) (_ BitVec 32) V!45105 V!45105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39293)

(assert (=> b!1188206 (= lt!540450 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!917 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188207 () Bool)

(declare-fun res!790033 () Bool)

(assert (=> b!1188207 (=> (not res!790033) (not e!675597))))

(assert (=> b!1188207 (= res!790033 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37538 _keys!1208))))))

(declare-fun b!1188208 () Bool)

(declare-fun res!790022 () Bool)

(assert (=> b!1188208 (=> (not res!790022) (not e!675604))))

(assert (=> b!1188208 (= res!790022 (arrayNoDuplicates!0 lt!540445 #b00000000000000000000000000000000 Nil!26146))))

(declare-fun b!1188209 () Bool)

(declare-fun res!790030 () Bool)

(assert (=> b!1188209 (=> (not res!790030) (not e!675597))))

(assert (=> b!1188209 (= res!790030 (= (select (arr!37000 _keys!1208) i!673) k0!934))))

(assert (= (and start!99868 res!790031) b!1188198))

(assert (= (and b!1188198 res!790024) b!1188197))

(assert (= (and b!1188197 res!790027) b!1188201))

(assert (= (and b!1188201 res!790032) b!1188205))

(assert (= (and b!1188205 res!790029) b!1188207))

(assert (= (and b!1188207 res!790033) b!1188195))

(assert (= (and b!1188195 res!790026) b!1188209))

(assert (= (and b!1188209 res!790030) b!1188204))

(assert (= (and b!1188204 res!790025) b!1188208))

(assert (= (and b!1188208 res!790022) b!1188202))

(assert (= (and b!1188202 (not res!790023)) b!1188200))

(assert (= (and b!1188200 (not res!790028)) b!1188206))

(assert (= (and b!1188199 condMapEmpty!46802) mapIsEmpty!46802))

(assert (= (and b!1188199 (not condMapEmpty!46802)) mapNonEmpty!46802))

(get-info :version)

(assert (= (and mapNonEmpty!46802 ((_ is ValueCellFull!14282) mapValue!46802)) b!1188196))

(assert (= (and b!1188199 ((_ is ValueCellFull!14282) mapDefault!46802)) b!1188203))

(assert (= start!99868 b!1188199))

(declare-fun b_lambda!20579 () Bool)

(assert (=> (not b_lambda!20579) (not b!1188200)))

(declare-fun t!38583 () Bool)

(declare-fun tb!10257 () Bool)

(assert (=> (and start!99868 (= defaultEntry!1004 defaultEntry!1004) t!38583) tb!10257))

(declare-fun result!21089 () Bool)

(assert (=> tb!10257 (= result!21089 tp_is_empty!29983)))

(assert (=> b!1188200 t!38583))

(declare-fun b_and!41753 () Bool)

(assert (= b_and!41751 (and (=> t!38583 result!21089) b_and!41753)))

(declare-fun m!1096505 () Bool)

(assert (=> b!1188209 m!1096505))

(declare-fun m!1096507 () Bool)

(assert (=> b!1188200 m!1096507))

(declare-fun m!1096509 () Bool)

(assert (=> b!1188200 m!1096509))

(declare-fun m!1096511 () Bool)

(assert (=> b!1188200 m!1096511))

(declare-fun m!1096513 () Bool)

(assert (=> b!1188200 m!1096513))

(declare-fun m!1096515 () Bool)

(assert (=> b!1188195 m!1096515))

(declare-fun m!1096517 () Bool)

(assert (=> b!1188204 m!1096517))

(declare-fun m!1096519 () Bool)

(assert (=> b!1188204 m!1096519))

(declare-fun m!1096521 () Bool)

(assert (=> start!99868 m!1096521))

(declare-fun m!1096523 () Bool)

(assert (=> start!99868 m!1096523))

(declare-fun m!1096525 () Bool)

(assert (=> b!1188206 m!1096525))

(declare-fun m!1096527 () Bool)

(assert (=> b!1188206 m!1096527))

(assert (=> b!1188206 m!1096527))

(declare-fun m!1096529 () Bool)

(assert (=> b!1188206 m!1096529))

(declare-fun m!1096531 () Bool)

(assert (=> b!1188206 m!1096531))

(declare-fun m!1096533 () Bool)

(assert (=> b!1188201 m!1096533))

(declare-fun m!1096535 () Bool)

(assert (=> b!1188208 m!1096535))

(declare-fun m!1096537 () Bool)

(assert (=> b!1188202 m!1096537))

(declare-fun m!1096539 () Bool)

(assert (=> b!1188202 m!1096539))

(declare-fun m!1096541 () Bool)

(assert (=> mapNonEmpty!46802 m!1096541))

(declare-fun m!1096543 () Bool)

(assert (=> b!1188205 m!1096543))

(declare-fun m!1096545 () Bool)

(assert (=> b!1188198 m!1096545))

(check-sat (not mapNonEmpty!46802) (not b!1188201) (not b!1188195) (not start!99868) (not b!1188206) (not b_lambda!20579) (not b!1188205) (not b!1188200) (not b!1188198) (not b!1188202) (not b!1188204) tp_is_empty!29983 (not b!1188208) (not b_next!25453) b_and!41753)
(check-sat b_and!41753 (not b_next!25453))
