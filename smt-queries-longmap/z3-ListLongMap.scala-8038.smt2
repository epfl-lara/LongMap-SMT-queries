; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99062 () Bool)

(assert start!99062)

(declare-fun b_free!24673 () Bool)

(declare-fun b_next!24673 () Bool)

(assert (=> start!99062 (= b_free!24673 (not b_next!24673))))

(declare-fun tp!86729 () Bool)

(declare-fun b_and!40173 () Bool)

(assert (=> start!99062 (= tp!86729 b_and!40173)))

(declare-fun b!1164806 () Bool)

(declare-fun res!772489 () Bool)

(declare-fun e!662220 () Bool)

(assert (=> b!1164806 (=> (not res!772489) (not e!662220))))

(declare-datatypes ((array!75162 0))(
  ( (array!75163 (arr!36232 (Array (_ BitVec 32) (_ BitVec 64))) (size!36770 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75162)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75162 (_ BitVec 32)) Bool)

(assert (=> b!1164806 (= res!772489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!772493 () Bool)

(assert (=> start!99062 (=> (not res!772493) (not e!662220))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99062 (= res!772493 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36770 _keys!1208))))))

(assert (=> start!99062 e!662220))

(declare-fun tp_is_empty!29203 () Bool)

(assert (=> start!99062 tp_is_empty!29203))

(declare-fun array_inv!27816 (array!75162) Bool)

(assert (=> start!99062 (array_inv!27816 _keys!1208)))

(assert (=> start!99062 true))

(assert (=> start!99062 tp!86729))

(declare-datatypes ((V!44065 0))(
  ( (V!44066 (val!14658 Int)) )
))
(declare-datatypes ((ValueCell!13892 0))(
  ( (ValueCellFull!13892 (v!17294 V!44065)) (EmptyCell!13892) )
))
(declare-datatypes ((array!75164 0))(
  ( (array!75165 (arr!36233 (Array (_ BitVec 32) ValueCell!13892)) (size!36771 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75164)

(declare-fun e!662219 () Bool)

(declare-fun array_inv!27817 (array!75164) Bool)

(assert (=> start!99062 (and (array_inv!27817 _values!996) e!662219)))

(declare-fun b!1164807 () Bool)

(declare-fun res!772491 () Bool)

(assert (=> b!1164807 (=> (not res!772491) (not e!662220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164807 (= res!772491 (validMask!0 mask!1564))))

(declare-fun b!1164808 () Bool)

(declare-fun e!662218 () Bool)

(assert (=> b!1164808 (= e!662218 tp_is_empty!29203)))

(declare-fun b!1164809 () Bool)

(declare-fun e!662223 () Bool)

(assert (=> b!1164809 (= e!662223 true)))

(declare-fun zeroValue!944 () V!44065)

(declare-fun lt!524583 () array!75162)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44065)

(declare-datatypes ((tuple2!18778 0))(
  ( (tuple2!18779 (_1!9400 (_ BitVec 64)) (_2!9400 V!44065)) )
))
(declare-datatypes ((List!25496 0))(
  ( (Nil!25493) (Cons!25492 (h!26701 tuple2!18778) (t!37152 List!25496)) )
))
(declare-datatypes ((ListLongMap!16747 0))(
  ( (ListLongMap!16748 (toList!8389 List!25496)) )
))
(declare-fun lt!524581 () ListLongMap!16747)

(declare-fun getCurrentListMapNoExtraKeys!4865 (array!75162 array!75164 (_ BitVec 32) (_ BitVec 32) V!44065 V!44065 (_ BitVec 32) Int) ListLongMap!16747)

(declare-fun dynLambda!2798 (Int (_ BitVec 64)) V!44065)

(assert (=> b!1164809 (= lt!524581 (getCurrentListMapNoExtraKeys!4865 lt!524583 (array!75165 (store (arr!36233 _values!996) i!673 (ValueCellFull!13892 (dynLambda!2798 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36771 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524580 () ListLongMap!16747)

(assert (=> b!1164809 (= lt!524580 (getCurrentListMapNoExtraKeys!4865 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164810 () Bool)

(declare-fun res!772492 () Bool)

(assert (=> b!1164810 (=> (not res!772492) (not e!662220))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164810 (= res!772492 (validKeyInArray!0 k0!934))))

(declare-fun b!1164811 () Bool)

(declare-fun e!662217 () Bool)

(declare-fun mapRes!45629 () Bool)

(assert (=> b!1164811 (= e!662219 (and e!662217 mapRes!45629))))

(declare-fun condMapEmpty!45629 () Bool)

(declare-fun mapDefault!45629 () ValueCell!13892)

(assert (=> b!1164811 (= condMapEmpty!45629 (= (arr!36233 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13892)) mapDefault!45629)))))

(declare-fun b!1164812 () Bool)

(declare-fun res!772485 () Bool)

(assert (=> b!1164812 (=> (not res!772485) (not e!662220))))

(declare-datatypes ((List!25497 0))(
  ( (Nil!25494) (Cons!25493 (h!26702 (_ BitVec 64)) (t!37153 List!25497)) )
))
(declare-fun arrayNoDuplicates!0 (array!75162 (_ BitVec 32) List!25497) Bool)

(assert (=> b!1164812 (= res!772485 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25494))))

(declare-fun mapIsEmpty!45629 () Bool)

(assert (=> mapIsEmpty!45629 mapRes!45629))

(declare-fun b!1164813 () Bool)

(declare-fun res!772483 () Bool)

(assert (=> b!1164813 (=> (not res!772483) (not e!662220))))

(assert (=> b!1164813 (= res!772483 (= (select (arr!36232 _keys!1208) i!673) k0!934))))

(declare-fun b!1164814 () Bool)

(assert (=> b!1164814 (= e!662217 tp_is_empty!29203)))

(declare-fun b!1164815 () Bool)

(declare-fun res!772486 () Bool)

(declare-fun e!662221 () Bool)

(assert (=> b!1164815 (=> (not res!772486) (not e!662221))))

(assert (=> b!1164815 (= res!772486 (arrayNoDuplicates!0 lt!524583 #b00000000000000000000000000000000 Nil!25494))))

(declare-fun b!1164816 () Bool)

(declare-fun res!772484 () Bool)

(assert (=> b!1164816 (=> (not res!772484) (not e!662220))))

(assert (=> b!1164816 (= res!772484 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36770 _keys!1208))))))

(declare-fun mapNonEmpty!45629 () Bool)

(declare-fun tp!86730 () Bool)

(assert (=> mapNonEmpty!45629 (= mapRes!45629 (and tp!86730 e!662218))))

(declare-fun mapValue!45629 () ValueCell!13892)

(declare-fun mapKey!45629 () (_ BitVec 32))

(declare-fun mapRest!45629 () (Array (_ BitVec 32) ValueCell!13892))

(assert (=> mapNonEmpty!45629 (= (arr!36233 _values!996) (store mapRest!45629 mapKey!45629 mapValue!45629))))

(declare-fun b!1164817 () Bool)

(assert (=> b!1164817 (= e!662221 (not e!662223))))

(declare-fun res!772490 () Bool)

(assert (=> b!1164817 (=> res!772490 e!662223)))

(assert (=> b!1164817 (= res!772490 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164817 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38275 0))(
  ( (Unit!38276) )
))
(declare-fun lt!524582 () Unit!38275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75162 (_ BitVec 64) (_ BitVec 32)) Unit!38275)

(assert (=> b!1164817 (= lt!524582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164818 () Bool)

(assert (=> b!1164818 (= e!662220 e!662221)))

(declare-fun res!772488 () Bool)

(assert (=> b!1164818 (=> (not res!772488) (not e!662221))))

(assert (=> b!1164818 (= res!772488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524583 mask!1564))))

(assert (=> b!1164818 (= lt!524583 (array!75163 (store (arr!36232 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36770 _keys!1208)))))

(declare-fun b!1164819 () Bool)

(declare-fun res!772487 () Bool)

(assert (=> b!1164819 (=> (not res!772487) (not e!662220))))

(assert (=> b!1164819 (= res!772487 (and (= (size!36771 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36770 _keys!1208) (size!36771 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99062 res!772493) b!1164807))

(assert (= (and b!1164807 res!772491) b!1164819))

(assert (= (and b!1164819 res!772487) b!1164806))

(assert (= (and b!1164806 res!772489) b!1164812))

(assert (= (and b!1164812 res!772485) b!1164816))

(assert (= (and b!1164816 res!772484) b!1164810))

(assert (= (and b!1164810 res!772492) b!1164813))

(assert (= (and b!1164813 res!772483) b!1164818))

(assert (= (and b!1164818 res!772488) b!1164815))

(assert (= (and b!1164815 res!772486) b!1164817))

(assert (= (and b!1164817 (not res!772490)) b!1164809))

(assert (= (and b!1164811 condMapEmpty!45629) mapIsEmpty!45629))

(assert (= (and b!1164811 (not condMapEmpty!45629)) mapNonEmpty!45629))

(get-info :version)

(assert (= (and mapNonEmpty!45629 ((_ is ValueCellFull!13892) mapValue!45629)) b!1164808))

(assert (= (and b!1164811 ((_ is ValueCellFull!13892) mapDefault!45629)) b!1164814))

(assert (= start!99062 b!1164811))

(declare-fun b_lambda!19761 () Bool)

(assert (=> (not b_lambda!19761) (not b!1164809)))

(declare-fun t!37151 () Bool)

(declare-fun tb!9477 () Bool)

(assert (=> (and start!99062 (= defaultEntry!1004 defaultEntry!1004) t!37151) tb!9477))

(declare-fun result!19527 () Bool)

(assert (=> tb!9477 (= result!19527 tp_is_empty!29203)))

(assert (=> b!1164809 t!37151))

(declare-fun b_and!40175 () Bool)

(assert (= b_and!40173 (and (=> t!37151 result!19527) b_and!40175)))

(declare-fun m!1072633 () Bool)

(assert (=> b!1164813 m!1072633))

(declare-fun m!1072635 () Bool)

(assert (=> start!99062 m!1072635))

(declare-fun m!1072637 () Bool)

(assert (=> start!99062 m!1072637))

(declare-fun m!1072639 () Bool)

(assert (=> b!1164812 m!1072639))

(declare-fun m!1072641 () Bool)

(assert (=> b!1164810 m!1072641))

(declare-fun m!1072643 () Bool)

(assert (=> b!1164817 m!1072643))

(declare-fun m!1072645 () Bool)

(assert (=> b!1164817 m!1072645))

(declare-fun m!1072647 () Bool)

(assert (=> b!1164807 m!1072647))

(declare-fun m!1072649 () Bool)

(assert (=> b!1164815 m!1072649))

(declare-fun m!1072651 () Bool)

(assert (=> b!1164806 m!1072651))

(declare-fun m!1072653 () Bool)

(assert (=> b!1164809 m!1072653))

(declare-fun m!1072655 () Bool)

(assert (=> b!1164809 m!1072655))

(declare-fun m!1072657 () Bool)

(assert (=> b!1164809 m!1072657))

(declare-fun m!1072659 () Bool)

(assert (=> b!1164809 m!1072659))

(declare-fun m!1072661 () Bool)

(assert (=> mapNonEmpty!45629 m!1072661))

(declare-fun m!1072663 () Bool)

(assert (=> b!1164818 m!1072663))

(declare-fun m!1072665 () Bool)

(assert (=> b!1164818 m!1072665))

(check-sat (not b!1164817) (not b!1164810) (not b!1164809) b_and!40175 tp_is_empty!29203 (not start!99062) (not b!1164806) (not b!1164818) (not b_lambda!19761) (not b!1164807) (not mapNonEmpty!45629) (not b!1164815) (not b!1164812) (not b_next!24673))
(check-sat b_and!40175 (not b_next!24673))
