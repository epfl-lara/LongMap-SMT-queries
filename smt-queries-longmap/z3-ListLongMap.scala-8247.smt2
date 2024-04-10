; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100432 () Bool)

(assert start!100432)

(declare-fun b_free!25755 () Bool)

(declare-fun b_next!25755 () Bool)

(assert (=> start!100432 (= b_free!25755 (not b_next!25755))))

(declare-fun tp!90255 () Bool)

(declare-fun b_and!42397 () Bool)

(assert (=> start!100432 (= tp!90255 b_and!42397)))

(declare-fun b!1199012 () Bool)

(declare-fun res!798044 () Bool)

(declare-fun e!681040 () Bool)

(assert (=> b!1199012 (=> (not res!798044) (not e!681040))))

(declare-datatypes ((array!77695 0))(
  ( (array!77696 (arr!37492 (Array (_ BitVec 32) (_ BitVec 64))) (size!38028 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77695)

(declare-datatypes ((List!26378 0))(
  ( (Nil!26375) (Cons!26374 (h!27583 (_ BitVec 64)) (t!39113 List!26378)) )
))
(declare-fun arrayNoDuplicates!0 (array!77695 (_ BitVec 32) List!26378) Bool)

(assert (=> b!1199012 (= res!798044 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26375))))

(declare-fun b!1199013 () Bool)

(declare-fun e!681042 () Bool)

(declare-fun e!681045 () Bool)

(declare-fun mapRes!47531 () Bool)

(assert (=> b!1199013 (= e!681042 (and e!681045 mapRes!47531))))

(declare-fun condMapEmpty!47531 () Bool)

(declare-datatypes ((V!45739 0))(
  ( (V!45740 (val!15286 Int)) )
))
(declare-datatypes ((ValueCell!14520 0))(
  ( (ValueCellFull!14520 (v!17924 V!45739)) (EmptyCell!14520) )
))
(declare-datatypes ((array!77697 0))(
  ( (array!77698 (arr!37493 (Array (_ BitVec 32) ValueCell!14520)) (size!38029 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77697)

(declare-fun mapDefault!47531 () ValueCell!14520)

(assert (=> b!1199013 (= condMapEmpty!47531 (= (arr!37493 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14520)) mapDefault!47531)))))

(declare-fun b!1199014 () Bool)

(declare-fun res!798036 () Bool)

(assert (=> b!1199014 (=> (not res!798036) (not e!681040))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77695 (_ BitVec 32)) Bool)

(assert (=> b!1199014 (= res!798036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199015 () Bool)

(declare-fun e!681046 () Bool)

(declare-fun e!681041 () Bool)

(assert (=> b!1199015 (= e!681046 (not e!681041))))

(declare-fun res!798040 () Bool)

(assert (=> b!1199015 (=> res!798040 e!681041)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199015 (= res!798040 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199015 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39756 0))(
  ( (Unit!39757) )
))
(declare-fun lt!543655 () Unit!39756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77695 (_ BitVec 64) (_ BitVec 32)) Unit!39756)

(assert (=> b!1199015 (= lt!543655 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199016 () Bool)

(declare-fun res!798037 () Bool)

(assert (=> b!1199016 (=> (not res!798037) (not e!681040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199016 (= res!798037 (validMask!0 mask!1564))))

(declare-fun b!1199017 () Bool)

(declare-fun tp_is_empty!30459 () Bool)

(assert (=> b!1199017 (= e!681045 tp_is_empty!30459)))

(declare-fun mapNonEmpty!47531 () Bool)

(declare-fun tp!90254 () Bool)

(declare-fun e!681044 () Bool)

(assert (=> mapNonEmpty!47531 (= mapRes!47531 (and tp!90254 e!681044))))

(declare-fun mapValue!47531 () ValueCell!14520)

(declare-fun mapKey!47531 () (_ BitVec 32))

(declare-fun mapRest!47531 () (Array (_ BitVec 32) ValueCell!14520))

(assert (=> mapNonEmpty!47531 (= (arr!37493 _values!996) (store mapRest!47531 mapKey!47531 mapValue!47531))))

(declare-fun b!1199018 () Bool)

(assert (=> b!1199018 (= e!681041 true)))

(declare-fun zeroValue!944 () V!45739)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19562 0))(
  ( (tuple2!19563 (_1!9792 (_ BitVec 64)) (_2!9792 V!45739)) )
))
(declare-datatypes ((List!26379 0))(
  ( (Nil!26376) (Cons!26375 (h!27584 tuple2!19562) (t!39114 List!26379)) )
))
(declare-datatypes ((ListLongMap!17531 0))(
  ( (ListLongMap!17532 (toList!8781 List!26379)) )
))
(declare-fun lt!543652 () ListLongMap!17531)

(declare-fun lt!543653 () array!77695)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45739)

(declare-fun getCurrentListMapNoExtraKeys!5220 (array!77695 array!77697 (_ BitVec 32) (_ BitVec 32) V!45739 V!45739 (_ BitVec 32) Int) ListLongMap!17531)

(declare-fun dynLambda!3140 (Int (_ BitVec 64)) V!45739)

(assert (=> b!1199018 (= lt!543652 (getCurrentListMapNoExtraKeys!5220 lt!543653 (array!77698 (store (arr!37493 _values!996) i!673 (ValueCellFull!14520 (dynLambda!3140 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38029 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543654 () ListLongMap!17531)

(assert (=> b!1199018 (= lt!543654 (getCurrentListMapNoExtraKeys!5220 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199019 () Bool)

(assert (=> b!1199019 (= e!681040 e!681046)))

(declare-fun res!798043 () Bool)

(assert (=> b!1199019 (=> (not res!798043) (not e!681046))))

(assert (=> b!1199019 (= res!798043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543653 mask!1564))))

(assert (=> b!1199019 (= lt!543653 (array!77696 (store (arr!37492 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38028 _keys!1208)))))

(declare-fun b!1199020 () Bool)

(declare-fun res!798041 () Bool)

(assert (=> b!1199020 (=> (not res!798041) (not e!681040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199020 (= res!798041 (validKeyInArray!0 k0!934))))

(declare-fun b!1199021 () Bool)

(declare-fun res!798039 () Bool)

(assert (=> b!1199021 (=> (not res!798039) (not e!681040))))

(assert (=> b!1199021 (= res!798039 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38028 _keys!1208))))))

(declare-fun mapIsEmpty!47531 () Bool)

(assert (=> mapIsEmpty!47531 mapRes!47531))

(declare-fun res!798045 () Bool)

(assert (=> start!100432 (=> (not res!798045) (not e!681040))))

(assert (=> start!100432 (= res!798045 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38028 _keys!1208))))))

(assert (=> start!100432 e!681040))

(assert (=> start!100432 tp_is_empty!30459))

(declare-fun array_inv!28570 (array!77695) Bool)

(assert (=> start!100432 (array_inv!28570 _keys!1208)))

(assert (=> start!100432 true))

(assert (=> start!100432 tp!90255))

(declare-fun array_inv!28571 (array!77697) Bool)

(assert (=> start!100432 (and (array_inv!28571 _values!996) e!681042)))

(declare-fun b!1199022 () Bool)

(declare-fun res!798042 () Bool)

(assert (=> b!1199022 (=> (not res!798042) (not e!681040))))

(assert (=> b!1199022 (= res!798042 (and (= (size!38029 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38028 _keys!1208) (size!38029 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199023 () Bool)

(assert (=> b!1199023 (= e!681044 tp_is_empty!30459)))

(declare-fun b!1199024 () Bool)

(declare-fun res!798038 () Bool)

(assert (=> b!1199024 (=> (not res!798038) (not e!681040))))

(assert (=> b!1199024 (= res!798038 (= (select (arr!37492 _keys!1208) i!673) k0!934))))

(declare-fun b!1199025 () Bool)

(declare-fun res!798035 () Bool)

(assert (=> b!1199025 (=> (not res!798035) (not e!681046))))

(assert (=> b!1199025 (= res!798035 (arrayNoDuplicates!0 lt!543653 #b00000000000000000000000000000000 Nil!26375))))

(assert (= (and start!100432 res!798045) b!1199016))

(assert (= (and b!1199016 res!798037) b!1199022))

(assert (= (and b!1199022 res!798042) b!1199014))

(assert (= (and b!1199014 res!798036) b!1199012))

(assert (= (and b!1199012 res!798044) b!1199021))

(assert (= (and b!1199021 res!798039) b!1199020))

(assert (= (and b!1199020 res!798041) b!1199024))

(assert (= (and b!1199024 res!798038) b!1199019))

(assert (= (and b!1199019 res!798043) b!1199025))

(assert (= (and b!1199025 res!798035) b!1199015))

(assert (= (and b!1199015 (not res!798040)) b!1199018))

(assert (= (and b!1199013 condMapEmpty!47531) mapIsEmpty!47531))

(assert (= (and b!1199013 (not condMapEmpty!47531)) mapNonEmpty!47531))

(get-info :version)

(assert (= (and mapNonEmpty!47531 ((_ is ValueCellFull!14520) mapValue!47531)) b!1199023))

(assert (= (and b!1199013 ((_ is ValueCellFull!14520) mapDefault!47531)) b!1199017))

(assert (= start!100432 b!1199013))

(declare-fun b_lambda!20951 () Bool)

(assert (=> (not b_lambda!20951) (not b!1199018)))

(declare-fun t!39112 () Bool)

(declare-fun tb!10555 () Bool)

(assert (=> (and start!100432 (= defaultEntry!1004 defaultEntry!1004) t!39112) tb!10555))

(declare-fun result!21687 () Bool)

(assert (=> tb!10555 (= result!21687 tp_is_empty!30459)))

(assert (=> b!1199018 t!39112))

(declare-fun b_and!42399 () Bool)

(assert (= b_and!42397 (and (=> t!39112 result!21687) b_and!42399)))

(declare-fun m!1105647 () Bool)

(assert (=> b!1199025 m!1105647))

(declare-fun m!1105649 () Bool)

(assert (=> b!1199018 m!1105649))

(declare-fun m!1105651 () Bool)

(assert (=> b!1199018 m!1105651))

(declare-fun m!1105653 () Bool)

(assert (=> b!1199018 m!1105653))

(declare-fun m!1105655 () Bool)

(assert (=> b!1199018 m!1105655))

(declare-fun m!1105657 () Bool)

(assert (=> b!1199015 m!1105657))

(declare-fun m!1105659 () Bool)

(assert (=> b!1199015 m!1105659))

(declare-fun m!1105661 () Bool)

(assert (=> b!1199012 m!1105661))

(declare-fun m!1105663 () Bool)

(assert (=> b!1199019 m!1105663))

(declare-fun m!1105665 () Bool)

(assert (=> b!1199019 m!1105665))

(declare-fun m!1105667 () Bool)

(assert (=> start!100432 m!1105667))

(declare-fun m!1105669 () Bool)

(assert (=> start!100432 m!1105669))

(declare-fun m!1105671 () Bool)

(assert (=> b!1199014 m!1105671))

(declare-fun m!1105673 () Bool)

(assert (=> b!1199020 m!1105673))

(declare-fun m!1105675 () Bool)

(assert (=> b!1199024 m!1105675))

(declare-fun m!1105677 () Bool)

(assert (=> b!1199016 m!1105677))

(declare-fun m!1105679 () Bool)

(assert (=> mapNonEmpty!47531 m!1105679))

(check-sat (not b!1199020) (not b!1199019) (not b!1199018) (not b!1199025) (not start!100432) (not b!1199014) (not b!1199016) (not b_next!25755) tp_is_empty!30459 (not b!1199015) (not mapNonEmpty!47531) (not b_lambda!20951) b_and!42399 (not b!1199012))
(check-sat b_and!42399 (not b_next!25755))
