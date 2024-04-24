; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100660 () Bool)

(assert start!100660)

(declare-fun b_free!25747 () Bool)

(declare-fun b_next!25747 () Bool)

(assert (=> start!100660 (= b_free!25747 (not b_next!25747))))

(declare-fun tp!90231 () Bool)

(declare-fun b_and!42383 () Bool)

(assert (=> start!100660 (= tp!90231 b_and!42383)))

(declare-fun b!1200125 () Bool)

(declare-fun e!681791 () Bool)

(declare-fun e!681794 () Bool)

(assert (=> b!1200125 (= e!681791 e!681794)))

(declare-fun res!798411 () Bool)

(assert (=> b!1200125 (=> (not res!798411) (not e!681794))))

(declare-datatypes ((array!77717 0))(
  ( (array!77718 (arr!37497 (Array (_ BitVec 32) (_ BitVec 64))) (size!38034 (_ BitVec 32))) )
))
(declare-fun lt!544089 () array!77717)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77717 (_ BitVec 32)) Bool)

(assert (=> b!1200125 (= res!798411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544089 mask!1564))))

(declare-fun _keys!1208 () array!77717)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200125 (= lt!544089 (array!77718 (store (arr!37497 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38034 _keys!1208)))))

(declare-fun b!1200126 () Bool)

(declare-fun res!798420 () Bool)

(assert (=> b!1200126 (=> (not res!798420) (not e!681791))))

(assert (=> b!1200126 (= res!798420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200127 () Bool)

(declare-fun e!681790 () Bool)

(assert (=> b!1200127 (= e!681794 (not e!681790))))

(declare-fun res!798417 () Bool)

(assert (=> b!1200127 (=> res!798417 e!681790)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1200127 (= res!798417 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200127 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39713 0))(
  ( (Unit!39714) )
))
(declare-fun lt!544091 () Unit!39713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77717 (_ BitVec 64) (_ BitVec 32)) Unit!39713)

(assert (=> b!1200127 (= lt!544091 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200128 () Bool)

(declare-fun res!798414 () Bool)

(assert (=> b!1200128 (=> (not res!798414) (not e!681791))))

(declare-datatypes ((List!26393 0))(
  ( (Nil!26390) (Cons!26389 (h!27607 (_ BitVec 64)) (t!39112 List!26393)) )
))
(declare-fun arrayNoDuplicates!0 (array!77717 (_ BitVec 32) List!26393) Bool)

(assert (=> b!1200128 (= res!798414 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26390))))

(declare-fun b!1200129 () Bool)

(declare-fun res!798418 () Bool)

(assert (=> b!1200129 (=> (not res!798418) (not e!681791))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45729 0))(
  ( (V!45730 (val!15282 Int)) )
))
(declare-datatypes ((ValueCell!14516 0))(
  ( (ValueCellFull!14516 (v!17916 V!45729)) (EmptyCell!14516) )
))
(declare-datatypes ((array!77719 0))(
  ( (array!77720 (arr!37498 (Array (_ BitVec 32) ValueCell!14516)) (size!38035 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77719)

(assert (=> b!1200129 (= res!798418 (and (= (size!38035 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38034 _keys!1208) (size!38035 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200130 () Bool)

(declare-fun e!681792 () Bool)

(declare-fun tp_is_empty!30451 () Bool)

(assert (=> b!1200130 (= e!681792 tp_is_empty!30451)))

(declare-fun b!1200131 () Bool)

(declare-fun res!798415 () Bool)

(assert (=> b!1200131 (=> (not res!798415) (not e!681791))))

(assert (=> b!1200131 (= res!798415 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38034 _keys!1208))))))

(declare-fun b!1200132 () Bool)

(declare-fun res!798413 () Bool)

(assert (=> b!1200132 (=> (not res!798413) (not e!681791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200132 (= res!798413 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47519 () Bool)

(declare-fun mapRes!47519 () Bool)

(declare-fun tp!90230 () Bool)

(declare-fun e!681789 () Bool)

(assert (=> mapNonEmpty!47519 (= mapRes!47519 (and tp!90230 e!681789))))

(declare-fun mapKey!47519 () (_ BitVec 32))

(declare-fun mapValue!47519 () ValueCell!14516)

(declare-fun mapRest!47519 () (Array (_ BitVec 32) ValueCell!14516))

(assert (=> mapNonEmpty!47519 (= (arr!37498 _values!996) (store mapRest!47519 mapKey!47519 mapValue!47519))))

(declare-fun b!1200133 () Bool)

(assert (=> b!1200133 (= e!681790 true)))

(declare-fun zeroValue!944 () V!45729)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19578 0))(
  ( (tuple2!19579 (_1!9800 (_ BitVec 64)) (_2!9800 V!45729)) )
))
(declare-datatypes ((List!26394 0))(
  ( (Nil!26391) (Cons!26390 (h!27608 tuple2!19578) (t!39113 List!26394)) )
))
(declare-datatypes ((ListLongMap!17555 0))(
  ( (ListLongMap!17556 (toList!8793 List!26394)) )
))
(declare-fun lt!544088 () ListLongMap!17555)

(declare-fun minValue!944 () V!45729)

(declare-fun getCurrentListMapNoExtraKeys!5260 (array!77717 array!77719 (_ BitVec 32) (_ BitVec 32) V!45729 V!45729 (_ BitVec 32) Int) ListLongMap!17555)

(declare-fun dynLambda!3204 (Int (_ BitVec 64)) V!45729)

(assert (=> b!1200133 (= lt!544088 (getCurrentListMapNoExtraKeys!5260 lt!544089 (array!77720 (store (arr!37498 _values!996) i!673 (ValueCellFull!14516 (dynLambda!3204 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38035 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544090 () ListLongMap!17555)

(assert (=> b!1200133 (= lt!544090 (getCurrentListMapNoExtraKeys!5260 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200134 () Bool)

(declare-fun res!798416 () Bool)

(assert (=> b!1200134 (=> (not res!798416) (not e!681791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200134 (= res!798416 (validMask!0 mask!1564))))

(declare-fun res!798419 () Bool)

(assert (=> start!100660 (=> (not res!798419) (not e!681791))))

(assert (=> start!100660 (= res!798419 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38034 _keys!1208))))))

(assert (=> start!100660 e!681791))

(assert (=> start!100660 tp_is_empty!30451))

(declare-fun array_inv!28646 (array!77717) Bool)

(assert (=> start!100660 (array_inv!28646 _keys!1208)))

(assert (=> start!100660 true))

(assert (=> start!100660 tp!90231))

(declare-fun e!681788 () Bool)

(declare-fun array_inv!28647 (array!77719) Bool)

(assert (=> start!100660 (and (array_inv!28647 _values!996) e!681788)))

(declare-fun b!1200135 () Bool)

(assert (=> b!1200135 (= e!681788 (and e!681792 mapRes!47519))))

(declare-fun condMapEmpty!47519 () Bool)

(declare-fun mapDefault!47519 () ValueCell!14516)

(assert (=> b!1200135 (= condMapEmpty!47519 (= (arr!37498 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14516)) mapDefault!47519)))))

(declare-fun b!1200136 () Bool)

(declare-fun res!798421 () Bool)

(assert (=> b!1200136 (=> (not res!798421) (not e!681794))))

(assert (=> b!1200136 (= res!798421 (arrayNoDuplicates!0 lt!544089 #b00000000000000000000000000000000 Nil!26390))))

(declare-fun b!1200137 () Bool)

(declare-fun res!798412 () Bool)

(assert (=> b!1200137 (=> (not res!798412) (not e!681791))))

(assert (=> b!1200137 (= res!798412 (= (select (arr!37497 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47519 () Bool)

(assert (=> mapIsEmpty!47519 mapRes!47519))

(declare-fun b!1200138 () Bool)

(assert (=> b!1200138 (= e!681789 tp_is_empty!30451)))

(assert (= (and start!100660 res!798419) b!1200134))

(assert (= (and b!1200134 res!798416) b!1200129))

(assert (= (and b!1200129 res!798418) b!1200126))

(assert (= (and b!1200126 res!798420) b!1200128))

(assert (= (and b!1200128 res!798414) b!1200131))

(assert (= (and b!1200131 res!798415) b!1200132))

(assert (= (and b!1200132 res!798413) b!1200137))

(assert (= (and b!1200137 res!798412) b!1200125))

(assert (= (and b!1200125 res!798411) b!1200136))

(assert (= (and b!1200136 res!798421) b!1200127))

(assert (= (and b!1200127 (not res!798417)) b!1200133))

(assert (= (and b!1200135 condMapEmpty!47519) mapIsEmpty!47519))

(assert (= (and b!1200135 (not condMapEmpty!47519)) mapNonEmpty!47519))

(get-info :version)

(assert (= (and mapNonEmpty!47519 ((_ is ValueCellFull!14516) mapValue!47519)) b!1200138))

(assert (= (and b!1200135 ((_ is ValueCellFull!14516) mapDefault!47519)) b!1200130))

(assert (= start!100660 b!1200135))

(declare-fun b_lambda!20937 () Bool)

(assert (=> (not b_lambda!20937) (not b!1200133)))

(declare-fun t!39111 () Bool)

(declare-fun tb!10539 () Bool)

(assert (=> (and start!100660 (= defaultEntry!1004 defaultEntry!1004) t!39111) tb!10539))

(declare-fun result!21663 () Bool)

(assert (=> tb!10539 (= result!21663 tp_is_empty!30451)))

(assert (=> b!1200133 t!39111))

(declare-fun b_and!42385 () Bool)

(assert (= b_and!42383 (and (=> t!39111 result!21663) b_and!42385)))

(declare-fun m!1107083 () Bool)

(assert (=> b!1200136 m!1107083))

(declare-fun m!1107085 () Bool)

(assert (=> b!1200132 m!1107085))

(declare-fun m!1107087 () Bool)

(assert (=> b!1200133 m!1107087))

(declare-fun m!1107089 () Bool)

(assert (=> b!1200133 m!1107089))

(declare-fun m!1107091 () Bool)

(assert (=> b!1200133 m!1107091))

(declare-fun m!1107093 () Bool)

(assert (=> b!1200133 m!1107093))

(declare-fun m!1107095 () Bool)

(assert (=> start!100660 m!1107095))

(declare-fun m!1107097 () Bool)

(assert (=> start!100660 m!1107097))

(declare-fun m!1107099 () Bool)

(assert (=> b!1200134 m!1107099))

(declare-fun m!1107101 () Bool)

(assert (=> mapNonEmpty!47519 m!1107101))

(declare-fun m!1107103 () Bool)

(assert (=> b!1200127 m!1107103))

(declare-fun m!1107105 () Bool)

(assert (=> b!1200127 m!1107105))

(declare-fun m!1107107 () Bool)

(assert (=> b!1200128 m!1107107))

(declare-fun m!1107109 () Bool)

(assert (=> b!1200125 m!1107109))

(declare-fun m!1107111 () Bool)

(assert (=> b!1200125 m!1107111))

(declare-fun m!1107113 () Bool)

(assert (=> b!1200137 m!1107113))

(declare-fun m!1107115 () Bool)

(assert (=> b!1200126 m!1107115))

(check-sat (not b!1200125) (not b!1200127) (not start!100660) (not b_next!25747) b_and!42385 (not b!1200132) (not b_lambda!20937) (not b!1200134) (not b!1200126) (not b!1200136) tp_is_empty!30451 (not b!1200128) (not b!1200133) (not mapNonEmpty!47519))
(check-sat b_and!42385 (not b_next!25747))
