; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100636 () Bool)

(assert start!100636)

(declare-fun b_free!25723 () Bool)

(declare-fun b_next!25723 () Bool)

(assert (=> start!100636 (= b_free!25723 (not b_next!25723))))

(declare-fun tp!90158 () Bool)

(declare-fun b_and!42341 () Bool)

(assert (=> start!100636 (= tp!90158 b_and!42341)))

(declare-fun b!1199603 () Bool)

(declare-fun e!681540 () Bool)

(declare-fun e!681536 () Bool)

(assert (=> b!1199603 (= e!681540 e!681536)))

(declare-fun res!798021 () Bool)

(assert (=> b!1199603 (=> (not res!798021) (not e!681536))))

(declare-datatypes ((array!77669 0))(
  ( (array!77670 (arr!37473 (Array (_ BitVec 32) (_ BitVec 64))) (size!38010 (_ BitVec 32))) )
))
(declare-fun lt!543952 () array!77669)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77669 (_ BitVec 32)) Bool)

(assert (=> b!1199603 (= res!798021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543952 mask!1564))))

(declare-fun _keys!1208 () array!77669)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199603 (= lt!543952 (array!77670 (store (arr!37473 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38010 _keys!1208)))))

(declare-fun b!1199604 () Bool)

(declare-fun e!681538 () Bool)

(declare-fun e!681541 () Bool)

(declare-fun mapRes!47483 () Bool)

(assert (=> b!1199604 (= e!681538 (and e!681541 mapRes!47483))))

(declare-fun condMapEmpty!47483 () Bool)

(declare-datatypes ((V!45697 0))(
  ( (V!45698 (val!15270 Int)) )
))
(declare-datatypes ((ValueCell!14504 0))(
  ( (ValueCellFull!14504 (v!17904 V!45697)) (EmptyCell!14504) )
))
(declare-datatypes ((array!77671 0))(
  ( (array!77672 (arr!37474 (Array (_ BitVec 32) ValueCell!14504)) (size!38011 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77671)

(declare-fun mapDefault!47483 () ValueCell!14504)

(assert (=> b!1199604 (= condMapEmpty!47483 (= (arr!37474 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14504)) mapDefault!47483)))))

(declare-fun b!1199605 () Bool)

(declare-fun res!798015 () Bool)

(assert (=> b!1199605 (=> (not res!798015) (not e!681540))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199605 (= res!798015 (and (= (size!38011 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38010 _keys!1208) (size!38011 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199606 () Bool)

(declare-fun res!798022 () Bool)

(assert (=> b!1199606 (=> (not res!798022) (not e!681540))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199606 (= res!798022 (validKeyInArray!0 k0!934))))

(declare-fun b!1199607 () Bool)

(declare-fun res!798017 () Bool)

(assert (=> b!1199607 (=> (not res!798017) (not e!681540))))

(assert (=> b!1199607 (= res!798017 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38010 _keys!1208))))))

(declare-fun mapIsEmpty!47483 () Bool)

(assert (=> mapIsEmpty!47483 mapRes!47483))

(declare-fun mapNonEmpty!47483 () Bool)

(declare-fun tp!90159 () Bool)

(declare-fun e!681539 () Bool)

(assert (=> mapNonEmpty!47483 (= mapRes!47483 (and tp!90159 e!681539))))

(declare-fun mapKey!47483 () (_ BitVec 32))

(declare-fun mapRest!47483 () (Array (_ BitVec 32) ValueCell!14504))

(declare-fun mapValue!47483 () ValueCell!14504)

(assert (=> mapNonEmpty!47483 (= (arr!37474 _values!996) (store mapRest!47483 mapKey!47483 mapValue!47483))))

(declare-fun b!1199608 () Bool)

(declare-fun res!798016 () Bool)

(assert (=> b!1199608 (=> (not res!798016) (not e!681540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199608 (= res!798016 (validMask!0 mask!1564))))

(declare-fun b!1199609 () Bool)

(declare-fun e!681537 () Bool)

(assert (=> b!1199609 (= e!681536 (not e!681537))))

(declare-fun res!798018 () Bool)

(assert (=> b!1199609 (=> res!798018 e!681537)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1199609 (= res!798018 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199609 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39697 0))(
  ( (Unit!39698) )
))
(declare-fun lt!543953 () Unit!39697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77669 (_ BitVec 64) (_ BitVec 32)) Unit!39697)

(assert (=> b!1199609 (= lt!543953 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199610 () Bool)

(declare-fun tp_is_empty!30427 () Bool)

(assert (=> b!1199610 (= e!681541 tp_is_empty!30427)))

(declare-fun res!798023 () Bool)

(assert (=> start!100636 (=> (not res!798023) (not e!681540))))

(assert (=> start!100636 (= res!798023 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38010 _keys!1208))))))

(assert (=> start!100636 e!681540))

(assert (=> start!100636 tp_is_empty!30427))

(declare-fun array_inv!28632 (array!77669) Bool)

(assert (=> start!100636 (array_inv!28632 _keys!1208)))

(assert (=> start!100636 true))

(assert (=> start!100636 tp!90158))

(declare-fun array_inv!28633 (array!77671) Bool)

(assert (=> start!100636 (and (array_inv!28633 _values!996) e!681538)))

(declare-fun b!1199611 () Bool)

(declare-fun res!798024 () Bool)

(assert (=> b!1199611 (=> (not res!798024) (not e!681540))))

(assert (=> b!1199611 (= res!798024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199612 () Bool)

(declare-fun res!798020 () Bool)

(assert (=> b!1199612 (=> (not res!798020) (not e!681540))))

(assert (=> b!1199612 (= res!798020 (= (select (arr!37473 _keys!1208) i!673) k0!934))))

(declare-fun b!1199613 () Bool)

(declare-fun res!798019 () Bool)

(assert (=> b!1199613 (=> (not res!798019) (not e!681540))))

(declare-datatypes ((List!26376 0))(
  ( (Nil!26373) (Cons!26372 (h!27590 (_ BitVec 64)) (t!39075 List!26376)) )
))
(declare-fun arrayNoDuplicates!0 (array!77669 (_ BitVec 32) List!26376) Bool)

(assert (=> b!1199613 (= res!798019 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26373))))

(declare-fun b!1199614 () Bool)

(declare-fun res!798025 () Bool)

(assert (=> b!1199614 (=> (not res!798025) (not e!681536))))

(assert (=> b!1199614 (= res!798025 (arrayNoDuplicates!0 lt!543952 #b00000000000000000000000000000000 Nil!26373))))

(declare-fun b!1199615 () Bool)

(assert (=> b!1199615 (= e!681539 tp_is_empty!30427)))

(declare-fun b!1199616 () Bool)

(assert (=> b!1199616 (= e!681537 (bvslt i!673 (size!38011 _values!996)))))

(declare-fun zeroValue!944 () V!45697)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45697)

(declare-datatypes ((tuple2!19564 0))(
  ( (tuple2!19565 (_1!9793 (_ BitVec 64)) (_2!9793 V!45697)) )
))
(declare-datatypes ((List!26377 0))(
  ( (Nil!26374) (Cons!26373 (h!27591 tuple2!19564) (t!39076 List!26377)) )
))
(declare-datatypes ((ListLongMap!17541 0))(
  ( (ListLongMap!17542 (toList!8786 List!26377)) )
))
(declare-fun lt!543951 () ListLongMap!17541)

(declare-fun getCurrentListMapNoExtraKeys!5253 (array!77669 array!77671 (_ BitVec 32) (_ BitVec 32) V!45697 V!45697 (_ BitVec 32) Int) ListLongMap!17541)

(assert (=> b!1199616 (= lt!543951 (getCurrentListMapNoExtraKeys!5253 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100636 res!798023) b!1199608))

(assert (= (and b!1199608 res!798016) b!1199605))

(assert (= (and b!1199605 res!798015) b!1199611))

(assert (= (and b!1199611 res!798024) b!1199613))

(assert (= (and b!1199613 res!798019) b!1199607))

(assert (= (and b!1199607 res!798017) b!1199606))

(assert (= (and b!1199606 res!798022) b!1199612))

(assert (= (and b!1199612 res!798020) b!1199603))

(assert (= (and b!1199603 res!798021) b!1199614))

(assert (= (and b!1199614 res!798025) b!1199609))

(assert (= (and b!1199609 (not res!798018)) b!1199616))

(assert (= (and b!1199604 condMapEmpty!47483) mapIsEmpty!47483))

(assert (= (and b!1199604 (not condMapEmpty!47483)) mapNonEmpty!47483))

(get-info :version)

(assert (= (and mapNonEmpty!47483 ((_ is ValueCellFull!14504) mapValue!47483)) b!1199615))

(assert (= (and b!1199604 ((_ is ValueCellFull!14504) mapDefault!47483)) b!1199610))

(assert (= start!100636 b!1199604))

(declare-fun m!1106693 () Bool)

(assert (=> b!1199611 m!1106693))

(declare-fun m!1106695 () Bool)

(assert (=> b!1199609 m!1106695))

(declare-fun m!1106697 () Bool)

(assert (=> b!1199609 m!1106697))

(declare-fun m!1106699 () Bool)

(assert (=> b!1199603 m!1106699))

(declare-fun m!1106701 () Bool)

(assert (=> b!1199603 m!1106701))

(declare-fun m!1106703 () Bool)

(assert (=> b!1199616 m!1106703))

(declare-fun m!1106705 () Bool)

(assert (=> mapNonEmpty!47483 m!1106705))

(declare-fun m!1106707 () Bool)

(assert (=> b!1199613 m!1106707))

(declare-fun m!1106709 () Bool)

(assert (=> b!1199612 m!1106709))

(declare-fun m!1106711 () Bool)

(assert (=> b!1199608 m!1106711))

(declare-fun m!1106713 () Bool)

(assert (=> b!1199606 m!1106713))

(declare-fun m!1106715 () Bool)

(assert (=> start!100636 m!1106715))

(declare-fun m!1106717 () Bool)

(assert (=> start!100636 m!1106717))

(declare-fun m!1106719 () Bool)

(assert (=> b!1199614 m!1106719))

(check-sat tp_is_empty!30427 (not b!1199609) (not start!100636) (not b_next!25723) (not b!1199603) (not mapNonEmpty!47483) (not b!1199606) b_and!42341 (not b!1199616) (not b!1199611) (not b!1199613) (not b!1199614) (not b!1199608))
(check-sat b_and!42341 (not b_next!25723))
