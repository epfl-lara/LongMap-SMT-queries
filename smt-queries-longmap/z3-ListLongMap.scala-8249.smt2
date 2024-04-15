; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100436 () Bool)

(assert start!100436)

(declare-fun b_free!25765 () Bool)

(declare-fun b_next!25765 () Bool)

(assert (=> start!100436 (= b_free!25765 (not b_next!25765))))

(declare-fun tp!90285 () Bool)

(declare-fun b_and!42395 () Bool)

(assert (=> start!100436 (= tp!90285 b_and!42395)))

(declare-fun mapIsEmpty!47546 () Bool)

(declare-fun mapRes!47546 () Bool)

(assert (=> mapIsEmpty!47546 mapRes!47546))

(declare-fun b!1199108 () Bool)

(declare-fun res!798141 () Bool)

(declare-fun e!681073 () Bool)

(assert (=> b!1199108 (=> (not res!798141) (not e!681073))))

(declare-datatypes ((array!77642 0))(
  ( (array!77643 (arr!37466 (Array (_ BitVec 32) (_ BitVec 64))) (size!38004 (_ BitVec 32))) )
))
(declare-fun lt!543523 () array!77642)

(declare-datatypes ((List!26450 0))(
  ( (Nil!26447) (Cons!26446 (h!27655 (_ BitVec 64)) (t!39186 List!26450)) )
))
(declare-fun arrayNoDuplicates!0 (array!77642 (_ BitVec 32) List!26450) Bool)

(assert (=> b!1199108 (= res!798141 (arrayNoDuplicates!0 lt!543523 #b00000000000000000000000000000000 Nil!26447))))

(declare-fun b!1199109 () Bool)

(declare-fun res!798142 () Bool)

(declare-fun e!681072 () Bool)

(assert (=> b!1199109 (=> (not res!798142) (not e!681072))))

(declare-fun _keys!1208 () array!77642)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1199109 (= res!798142 (= (select (arr!37466 _keys!1208) i!673) k0!934))))

(declare-fun b!1199110 () Bool)

(declare-fun e!681068 () Bool)

(declare-fun tp_is_empty!30469 () Bool)

(assert (=> b!1199110 (= e!681068 tp_is_empty!30469)))

(declare-fun b!1199111 () Bool)

(declare-fun e!681070 () Bool)

(assert (=> b!1199111 (= e!681070 true)))

(declare-datatypes ((V!45753 0))(
  ( (V!45754 (val!15291 Int)) )
))
(declare-fun zeroValue!944 () V!45753)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14525 0))(
  ( (ValueCellFull!14525 (v!17928 V!45753)) (EmptyCell!14525) )
))
(declare-datatypes ((array!77644 0))(
  ( (array!77645 (arr!37467 (Array (_ BitVec 32) ValueCell!14525)) (size!38005 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77644)

(declare-datatypes ((tuple2!19662 0))(
  ( (tuple2!19663 (_1!9842 (_ BitVec 64)) (_2!9842 V!45753)) )
))
(declare-datatypes ((List!26451 0))(
  ( (Nil!26448) (Cons!26447 (h!27656 tuple2!19662) (t!39187 List!26451)) )
))
(declare-datatypes ((ListLongMap!17631 0))(
  ( (ListLongMap!17632 (toList!8831 List!26451)) )
))
(declare-fun lt!543521 () ListLongMap!17631)

(declare-fun minValue!944 () V!45753)

(declare-fun getCurrentListMapNoExtraKeys!5280 (array!77642 array!77644 (_ BitVec 32) (_ BitVec 32) V!45753 V!45753 (_ BitVec 32) Int) ListLongMap!17631)

(declare-fun dynLambda!3160 (Int (_ BitVec 64)) V!45753)

(assert (=> b!1199111 (= lt!543521 (getCurrentListMapNoExtraKeys!5280 lt!543523 (array!77645 (store (arr!37467 _values!996) i!673 (ValueCellFull!14525 (dynLambda!3160 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38005 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543520 () ListLongMap!17631)

(assert (=> b!1199111 (= lt!543520 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199112 () Bool)

(declare-fun res!798137 () Bool)

(assert (=> b!1199112 (=> (not res!798137) (not e!681072))))

(assert (=> b!1199112 (= res!798137 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38004 _keys!1208))))))

(declare-fun b!1199113 () Bool)

(declare-fun e!681067 () Bool)

(assert (=> b!1199113 (= e!681067 tp_is_empty!30469)))

(declare-fun b!1199114 () Bool)

(assert (=> b!1199114 (= e!681072 e!681073)))

(declare-fun res!798134 () Bool)

(assert (=> b!1199114 (=> (not res!798134) (not e!681073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77642 (_ BitVec 32)) Bool)

(assert (=> b!1199114 (= res!798134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543523 mask!1564))))

(assert (=> b!1199114 (= lt!543523 (array!77643 (store (arr!37466 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38004 _keys!1208)))))

(declare-fun b!1199115 () Bool)

(declare-fun res!798143 () Bool)

(assert (=> b!1199115 (=> (not res!798143) (not e!681072))))

(assert (=> b!1199115 (= res!798143 (and (= (size!38005 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38004 _keys!1208) (size!38005 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199116 () Bool)

(assert (=> b!1199116 (= e!681073 (not e!681070))))

(declare-fun res!798140 () Bool)

(assert (=> b!1199116 (=> res!798140 e!681070)))

(assert (=> b!1199116 (= res!798140 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199116 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39623 0))(
  ( (Unit!39624) )
))
(declare-fun lt!543522 () Unit!39623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77642 (_ BitVec 64) (_ BitVec 32)) Unit!39623)

(assert (=> b!1199116 (= lt!543522 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47546 () Bool)

(declare-fun tp!90284 () Bool)

(assert (=> mapNonEmpty!47546 (= mapRes!47546 (and tp!90284 e!681068))))

(declare-fun mapValue!47546 () ValueCell!14525)

(declare-fun mapKey!47546 () (_ BitVec 32))

(declare-fun mapRest!47546 () (Array (_ BitVec 32) ValueCell!14525))

(assert (=> mapNonEmpty!47546 (= (arr!37467 _values!996) (store mapRest!47546 mapKey!47546 mapValue!47546))))

(declare-fun b!1199117 () Bool)

(declare-fun res!798138 () Bool)

(assert (=> b!1199117 (=> (not res!798138) (not e!681072))))

(assert (=> b!1199117 (= res!798138 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26447))))

(declare-fun b!1199119 () Bool)

(declare-fun res!798135 () Bool)

(assert (=> b!1199119 (=> (not res!798135) (not e!681072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199119 (= res!798135 (validKeyInArray!0 k0!934))))

(declare-fun b!1199120 () Bool)

(declare-fun res!798136 () Bool)

(assert (=> b!1199120 (=> (not res!798136) (not e!681072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199120 (= res!798136 (validMask!0 mask!1564))))

(declare-fun b!1199121 () Bool)

(declare-fun e!681071 () Bool)

(assert (=> b!1199121 (= e!681071 (and e!681067 mapRes!47546))))

(declare-fun condMapEmpty!47546 () Bool)

(declare-fun mapDefault!47546 () ValueCell!14525)

(assert (=> b!1199121 (= condMapEmpty!47546 (= (arr!37467 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14525)) mapDefault!47546)))))

(declare-fun res!798144 () Bool)

(assert (=> start!100436 (=> (not res!798144) (not e!681072))))

(assert (=> start!100436 (= res!798144 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38004 _keys!1208))))))

(assert (=> start!100436 e!681072))

(assert (=> start!100436 tp_is_empty!30469))

(declare-fun array_inv!28672 (array!77642) Bool)

(assert (=> start!100436 (array_inv!28672 _keys!1208)))

(assert (=> start!100436 true))

(assert (=> start!100436 tp!90285))

(declare-fun array_inv!28673 (array!77644) Bool)

(assert (=> start!100436 (and (array_inv!28673 _values!996) e!681071)))

(declare-fun b!1199118 () Bool)

(declare-fun res!798139 () Bool)

(assert (=> b!1199118 (=> (not res!798139) (not e!681072))))

(assert (=> b!1199118 (= res!798139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100436 res!798144) b!1199120))

(assert (= (and b!1199120 res!798136) b!1199115))

(assert (= (and b!1199115 res!798143) b!1199118))

(assert (= (and b!1199118 res!798139) b!1199117))

(assert (= (and b!1199117 res!798138) b!1199112))

(assert (= (and b!1199112 res!798137) b!1199119))

(assert (= (and b!1199119 res!798135) b!1199109))

(assert (= (and b!1199109 res!798142) b!1199114))

(assert (= (and b!1199114 res!798134) b!1199108))

(assert (= (and b!1199108 res!798141) b!1199116))

(assert (= (and b!1199116 (not res!798140)) b!1199111))

(assert (= (and b!1199121 condMapEmpty!47546) mapIsEmpty!47546))

(assert (= (and b!1199121 (not condMapEmpty!47546)) mapNonEmpty!47546))

(get-info :version)

(assert (= (and mapNonEmpty!47546 ((_ is ValueCellFull!14525) mapValue!47546)) b!1199110))

(assert (= (and b!1199121 ((_ is ValueCellFull!14525) mapDefault!47546)) b!1199113))

(assert (= start!100436 b!1199121))

(declare-fun b_lambda!20943 () Bool)

(assert (=> (not b_lambda!20943) (not b!1199111)))

(declare-fun t!39185 () Bool)

(declare-fun tb!10557 () Bool)

(assert (=> (and start!100436 (= defaultEntry!1004 defaultEntry!1004) t!39185) tb!10557))

(declare-fun result!21699 () Bool)

(assert (=> tb!10557 (= result!21699 tp_is_empty!30469)))

(assert (=> b!1199111 t!39185))

(declare-fun b_and!42397 () Bool)

(assert (= b_and!42395 (and (=> t!39185 result!21699) b_and!42397)))

(declare-fun m!1105207 () Bool)

(assert (=> b!1199117 m!1105207))

(declare-fun m!1105209 () Bool)

(assert (=> mapNonEmpty!47546 m!1105209))

(declare-fun m!1105211 () Bool)

(assert (=> b!1199114 m!1105211))

(declare-fun m!1105213 () Bool)

(assert (=> b!1199114 m!1105213))

(declare-fun m!1105215 () Bool)

(assert (=> b!1199108 m!1105215))

(declare-fun m!1105217 () Bool)

(assert (=> start!100436 m!1105217))

(declare-fun m!1105219 () Bool)

(assert (=> start!100436 m!1105219))

(declare-fun m!1105221 () Bool)

(assert (=> b!1199119 m!1105221))

(declare-fun m!1105223 () Bool)

(assert (=> b!1199118 m!1105223))

(declare-fun m!1105225 () Bool)

(assert (=> b!1199120 m!1105225))

(declare-fun m!1105227 () Bool)

(assert (=> b!1199109 m!1105227))

(declare-fun m!1105229 () Bool)

(assert (=> b!1199111 m!1105229))

(declare-fun m!1105231 () Bool)

(assert (=> b!1199111 m!1105231))

(declare-fun m!1105233 () Bool)

(assert (=> b!1199111 m!1105233))

(declare-fun m!1105235 () Bool)

(assert (=> b!1199111 m!1105235))

(declare-fun m!1105237 () Bool)

(assert (=> b!1199116 m!1105237))

(declare-fun m!1105239 () Bool)

(assert (=> b!1199116 m!1105239))

(check-sat (not b!1199119) tp_is_empty!30469 (not b!1199117) (not b_lambda!20943) (not b!1199120) (not b!1199116) (not b!1199114) (not mapNonEmpty!47546) (not start!100436) (not b!1199118) (not b_next!25765) b_and!42397 (not b!1199111) (not b!1199108))
(check-sat b_and!42397 (not b_next!25765))
