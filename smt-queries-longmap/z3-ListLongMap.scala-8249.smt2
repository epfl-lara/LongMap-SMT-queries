; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100678 () Bool)

(assert start!100678)

(declare-fun b_free!25765 () Bool)

(declare-fun b_next!25765 () Bool)

(assert (=> start!100678 (= b_free!25765 (not b_next!25765))))

(declare-fun tp!90285 () Bool)

(declare-fun b_and!42419 () Bool)

(assert (=> start!100678 (= tp!90285 b_and!42419)))

(declare-fun mapIsEmpty!47546 () Bool)

(declare-fun mapRes!47546 () Bool)

(assert (=> mapIsEmpty!47546 mapRes!47546))

(declare-fun b!1200521 () Bool)

(declare-fun e!681978 () Bool)

(declare-fun tp_is_empty!30469 () Bool)

(assert (=> b!1200521 (= e!681978 tp_is_empty!30469)))

(declare-fun b!1200522 () Bool)

(declare-fun e!681982 () Bool)

(assert (=> b!1200522 (= e!681982 true)))

(declare-datatypes ((V!45753 0))(
  ( (V!45754 (val!15291 Int)) )
))
(declare-fun zeroValue!944 () V!45753)

(declare-datatypes ((tuple2!19590 0))(
  ( (tuple2!19591 (_1!9806 (_ BitVec 64)) (_2!9806 V!45753)) )
))
(declare-datatypes ((List!26406 0))(
  ( (Nil!26403) (Cons!26402 (h!27620 tuple2!19590) (t!39143 List!26406)) )
))
(declare-datatypes ((ListLongMap!17567 0))(
  ( (ListLongMap!17568 (toList!8799 List!26406)) )
))
(declare-fun lt!544197 () ListLongMap!17567)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77753 0))(
  ( (array!77754 (arr!37515 (Array (_ BitVec 32) (_ BitVec 64))) (size!38052 (_ BitVec 32))) )
))
(declare-fun lt!544196 () array!77753)

(declare-datatypes ((ValueCell!14525 0))(
  ( (ValueCellFull!14525 (v!17925 V!45753)) (EmptyCell!14525) )
))
(declare-datatypes ((array!77755 0))(
  ( (array!77756 (arr!37516 (Array (_ BitVec 32) ValueCell!14525)) (size!38053 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77755)

(declare-fun minValue!944 () V!45753)

(declare-fun getCurrentListMapNoExtraKeys!5266 (array!77753 array!77755 (_ BitVec 32) (_ BitVec 32) V!45753 V!45753 (_ BitVec 32) Int) ListLongMap!17567)

(declare-fun dynLambda!3210 (Int (_ BitVec 64)) V!45753)

(assert (=> b!1200522 (= lt!544197 (getCurrentListMapNoExtraKeys!5266 lt!544196 (array!77756 (store (arr!37516 _values!996) i!673 (ValueCellFull!14525 (dynLambda!3210 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38053 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77753)

(declare-fun lt!544198 () ListLongMap!17567)

(assert (=> b!1200522 (= lt!544198 (getCurrentListMapNoExtraKeys!5266 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200523 () Bool)

(declare-fun e!681981 () Bool)

(assert (=> b!1200523 (= e!681981 tp_is_empty!30469)))

(declare-fun b!1200524 () Bool)

(declare-fun e!681980 () Bool)

(assert (=> b!1200524 (= e!681980 (not e!681982))))

(declare-fun res!798714 () Bool)

(assert (=> b!1200524 (=> res!798714 e!681982)))

(assert (=> b!1200524 (= res!798714 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200524 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39725 0))(
  ( (Unit!39726) )
))
(declare-fun lt!544199 () Unit!39725)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77753 (_ BitVec 64) (_ BitVec 32)) Unit!39725)

(assert (=> b!1200524 (= lt!544199 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200525 () Bool)

(declare-fun res!798718 () Bool)

(declare-fun e!681979 () Bool)

(assert (=> b!1200525 (=> (not res!798718) (not e!681979))))

(assert (=> b!1200525 (= res!798718 (= (select (arr!37515 _keys!1208) i!673) k0!934))))

(declare-fun b!1200526 () Bool)

(declare-fun res!798711 () Bool)

(assert (=> b!1200526 (=> (not res!798711) (not e!681979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200526 (= res!798711 (validMask!0 mask!1564))))

(declare-fun b!1200527 () Bool)

(declare-fun res!798710 () Bool)

(assert (=> b!1200527 (=> (not res!798710) (not e!681979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77753 (_ BitVec 32)) Bool)

(assert (=> b!1200527 (= res!798710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200528 () Bool)

(declare-fun res!798717 () Bool)

(assert (=> b!1200528 (=> (not res!798717) (not e!681979))))

(assert (=> b!1200528 (= res!798717 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38052 _keys!1208))))))

(declare-fun b!1200529 () Bool)

(declare-fun res!798716 () Bool)

(assert (=> b!1200529 (=> (not res!798716) (not e!681979))))

(declare-datatypes ((List!26407 0))(
  ( (Nil!26404) (Cons!26403 (h!27621 (_ BitVec 64)) (t!39144 List!26407)) )
))
(declare-fun arrayNoDuplicates!0 (array!77753 (_ BitVec 32) List!26407) Bool)

(assert (=> b!1200529 (= res!798716 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26404))))

(declare-fun res!798713 () Bool)

(assert (=> start!100678 (=> (not res!798713) (not e!681979))))

(assert (=> start!100678 (= res!798713 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38052 _keys!1208))))))

(assert (=> start!100678 e!681979))

(assert (=> start!100678 tp_is_empty!30469))

(declare-fun array_inv!28660 (array!77753) Bool)

(assert (=> start!100678 (array_inv!28660 _keys!1208)))

(assert (=> start!100678 true))

(assert (=> start!100678 tp!90285))

(declare-fun e!681977 () Bool)

(declare-fun array_inv!28661 (array!77755) Bool)

(assert (=> start!100678 (and (array_inv!28661 _values!996) e!681977)))

(declare-fun b!1200530 () Bool)

(assert (=> b!1200530 (= e!681979 e!681980)))

(declare-fun res!798709 () Bool)

(assert (=> b!1200530 (=> (not res!798709) (not e!681980))))

(assert (=> b!1200530 (= res!798709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544196 mask!1564))))

(assert (=> b!1200530 (= lt!544196 (array!77754 (store (arr!37515 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38052 _keys!1208)))))

(declare-fun b!1200531 () Bool)

(declare-fun res!798708 () Bool)

(assert (=> b!1200531 (=> (not res!798708) (not e!681979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200531 (= res!798708 (validKeyInArray!0 k0!934))))

(declare-fun b!1200532 () Bool)

(declare-fun res!798715 () Bool)

(assert (=> b!1200532 (=> (not res!798715) (not e!681980))))

(assert (=> b!1200532 (= res!798715 (arrayNoDuplicates!0 lt!544196 #b00000000000000000000000000000000 Nil!26404))))

(declare-fun b!1200533 () Bool)

(declare-fun res!798712 () Bool)

(assert (=> b!1200533 (=> (not res!798712) (not e!681979))))

(assert (=> b!1200533 (= res!798712 (and (= (size!38053 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38052 _keys!1208) (size!38053 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47546 () Bool)

(declare-fun tp!90284 () Bool)

(assert (=> mapNonEmpty!47546 (= mapRes!47546 (and tp!90284 e!681981))))

(declare-fun mapRest!47546 () (Array (_ BitVec 32) ValueCell!14525))

(declare-fun mapKey!47546 () (_ BitVec 32))

(declare-fun mapValue!47546 () ValueCell!14525)

(assert (=> mapNonEmpty!47546 (= (arr!37516 _values!996) (store mapRest!47546 mapKey!47546 mapValue!47546))))

(declare-fun b!1200534 () Bool)

(assert (=> b!1200534 (= e!681977 (and e!681978 mapRes!47546))))

(declare-fun condMapEmpty!47546 () Bool)

(declare-fun mapDefault!47546 () ValueCell!14525)

(assert (=> b!1200534 (= condMapEmpty!47546 (= (arr!37516 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14525)) mapDefault!47546)))))

(assert (= (and start!100678 res!798713) b!1200526))

(assert (= (and b!1200526 res!798711) b!1200533))

(assert (= (and b!1200533 res!798712) b!1200527))

(assert (= (and b!1200527 res!798710) b!1200529))

(assert (= (and b!1200529 res!798716) b!1200528))

(assert (= (and b!1200528 res!798717) b!1200531))

(assert (= (and b!1200531 res!798708) b!1200525))

(assert (= (and b!1200525 res!798718) b!1200530))

(assert (= (and b!1200530 res!798709) b!1200532))

(assert (= (and b!1200532 res!798715) b!1200524))

(assert (= (and b!1200524 (not res!798714)) b!1200522))

(assert (= (and b!1200534 condMapEmpty!47546) mapIsEmpty!47546))

(assert (= (and b!1200534 (not condMapEmpty!47546)) mapNonEmpty!47546))

(get-info :version)

(assert (= (and mapNonEmpty!47546 ((_ is ValueCellFull!14525) mapValue!47546)) b!1200523))

(assert (= (and b!1200534 ((_ is ValueCellFull!14525) mapDefault!47546)) b!1200521))

(assert (= start!100678 b!1200534))

(declare-fun b_lambda!20955 () Bool)

(assert (=> (not b_lambda!20955) (not b!1200522)))

(declare-fun t!39142 () Bool)

(declare-fun tb!10557 () Bool)

(assert (=> (and start!100678 (= defaultEntry!1004 defaultEntry!1004) t!39142) tb!10557))

(declare-fun result!21699 () Bool)

(assert (=> tb!10557 (= result!21699 tp_is_empty!30469)))

(assert (=> b!1200522 t!39142))

(declare-fun b_and!42421 () Bool)

(assert (= b_and!42419 (and (=> t!39142 result!21699) b_and!42421)))

(declare-fun m!1107389 () Bool)

(assert (=> b!1200524 m!1107389))

(declare-fun m!1107391 () Bool)

(assert (=> b!1200524 m!1107391))

(declare-fun m!1107393 () Bool)

(assert (=> b!1200527 m!1107393))

(declare-fun m!1107395 () Bool)

(assert (=> b!1200526 m!1107395))

(declare-fun m!1107397 () Bool)

(assert (=> b!1200531 m!1107397))

(declare-fun m!1107399 () Bool)

(assert (=> mapNonEmpty!47546 m!1107399))

(declare-fun m!1107401 () Bool)

(assert (=> b!1200530 m!1107401))

(declare-fun m!1107403 () Bool)

(assert (=> b!1200530 m!1107403))

(declare-fun m!1107405 () Bool)

(assert (=> b!1200532 m!1107405))

(declare-fun m!1107407 () Bool)

(assert (=> b!1200522 m!1107407))

(declare-fun m!1107409 () Bool)

(assert (=> b!1200522 m!1107409))

(declare-fun m!1107411 () Bool)

(assert (=> b!1200522 m!1107411))

(declare-fun m!1107413 () Bool)

(assert (=> b!1200522 m!1107413))

(declare-fun m!1107415 () Bool)

(assert (=> start!100678 m!1107415))

(declare-fun m!1107417 () Bool)

(assert (=> start!100678 m!1107417))

(declare-fun m!1107419 () Bool)

(assert (=> b!1200525 m!1107419))

(declare-fun m!1107421 () Bool)

(assert (=> b!1200529 m!1107421))

(check-sat (not b!1200532) (not b!1200530) (not b_next!25765) (not b!1200522) (not mapNonEmpty!47546) (not b!1200524) (not start!100678) b_and!42421 (not b!1200527) (not b!1200526) (not b!1200529) (not b!1200531) tp_is_empty!30469 (not b_lambda!20955))
(check-sat b_and!42421 (not b_next!25765))
