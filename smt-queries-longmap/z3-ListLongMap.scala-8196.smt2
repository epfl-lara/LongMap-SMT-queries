; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100036 () Bool)

(assert start!100036)

(declare-fun b_free!25621 () Bool)

(declare-fun b_next!25621 () Bool)

(assert (=> start!100036 (= b_free!25621 (not b_next!25621))))

(declare-fun tp!89576 () Bool)

(declare-fun b_and!42087 () Bool)

(assert (=> start!100036 (= tp!89576 b_and!42087)))

(declare-fun b!1192143 () Bool)

(declare-fun res!793056 () Bool)

(declare-fun e!677614 () Bool)

(assert (=> b!1192143 (=> (not res!793056) (not e!677614))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192143 (= res!793056 (validMask!0 mask!1564))))

(declare-fun b!1192144 () Bool)

(declare-fun e!677617 () Bool)

(declare-fun e!677619 () Bool)

(assert (=> b!1192144 (= e!677617 (not e!677619))))

(declare-fun res!793050 () Bool)

(assert (=> b!1192144 (=> res!793050 e!677619)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192144 (= res!793050 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77022 0))(
  ( (array!77023 (arr!37161 (Array (_ BitVec 32) (_ BitVec 64))) (size!37699 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77022)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192144 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39431 0))(
  ( (Unit!39432) )
))
(declare-fun lt!541960 () Unit!39431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77022 (_ BitVec 64) (_ BitVec 32)) Unit!39431)

(assert (=> b!1192144 (= lt!541960 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192145 () Bool)

(declare-fun res!793049 () Bool)

(assert (=> b!1192145 (=> (not res!793049) (not e!677614))))

(assert (=> b!1192145 (= res!793049 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37699 _keys!1208))))))

(declare-fun b!1192147 () Bool)

(declare-fun res!793054 () Bool)

(assert (=> b!1192147 (=> (not res!793054) (not e!677614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192147 (= res!793054 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47054 () Bool)

(declare-fun mapRes!47054 () Bool)

(assert (=> mapIsEmpty!47054 mapRes!47054))

(declare-fun b!1192148 () Bool)

(declare-fun e!677618 () Bool)

(assert (=> b!1192148 (= e!677619 e!677618)))

(declare-fun res!793046 () Bool)

(assert (=> b!1192148 (=> res!793046 e!677618)))

(assert (=> b!1192148 (= res!793046 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45329 0))(
  ( (V!45330 (val!15132 Int)) )
))
(declare-fun zeroValue!944 () V!45329)

(declare-datatypes ((tuple2!19564 0))(
  ( (tuple2!19565 (_1!9793 (_ BitVec 64)) (_2!9793 V!45329)) )
))
(declare-datatypes ((List!26277 0))(
  ( (Nil!26274) (Cons!26273 (h!27482 tuple2!19564) (t!38881 List!26277)) )
))
(declare-datatypes ((ListLongMap!17533 0))(
  ( (ListLongMap!17534 (toList!8782 List!26277)) )
))
(declare-fun lt!541961 () ListLongMap!17533)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541962 () array!77022)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45329)

(declare-datatypes ((ValueCell!14366 0))(
  ( (ValueCellFull!14366 (v!17769 V!45329)) (EmptyCell!14366) )
))
(declare-datatypes ((array!77024 0))(
  ( (array!77025 (arr!37162 (Array (_ BitVec 32) ValueCell!14366)) (size!37700 (_ BitVec 32))) )
))
(declare-fun lt!541957 () array!77024)

(declare-fun getCurrentListMapNoExtraKeys!5232 (array!77022 array!77024 (_ BitVec 32) (_ BitVec 32) V!45329 V!45329 (_ BitVec 32) Int) ListLongMap!17533)

(assert (=> b!1192148 (= lt!541961 (getCurrentListMapNoExtraKeys!5232 lt!541962 lt!541957 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77024)

(declare-fun dynLambda!3118 (Int (_ BitVec 64)) V!45329)

(assert (=> b!1192148 (= lt!541957 (array!77025 (store (arr!37162 _values!996) i!673 (ValueCellFull!14366 (dynLambda!3118 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37700 _values!996)))))

(declare-fun lt!541958 () ListLongMap!17533)

(assert (=> b!1192148 (= lt!541958 (getCurrentListMapNoExtraKeys!5232 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47054 () Bool)

(declare-fun tp!89577 () Bool)

(declare-fun e!677615 () Bool)

(assert (=> mapNonEmpty!47054 (= mapRes!47054 (and tp!89577 e!677615))))

(declare-fun mapRest!47054 () (Array (_ BitVec 32) ValueCell!14366))

(declare-fun mapValue!47054 () ValueCell!14366)

(declare-fun mapKey!47054 () (_ BitVec 32))

(assert (=> mapNonEmpty!47054 (= (arr!37162 _values!996) (store mapRest!47054 mapKey!47054 mapValue!47054))))

(declare-fun b!1192149 () Bool)

(assert (=> b!1192149 (= e!677614 e!677617)))

(declare-fun res!793048 () Bool)

(assert (=> b!1192149 (=> (not res!793048) (not e!677617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77022 (_ BitVec 32)) Bool)

(assert (=> b!1192149 (= res!793048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541962 mask!1564))))

(assert (=> b!1192149 (= lt!541962 (array!77023 (store (arr!37161 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37699 _keys!1208)))))

(declare-fun b!1192150 () Bool)

(declare-fun tp_is_empty!30151 () Bool)

(assert (=> b!1192150 (= e!677615 tp_is_empty!30151)))

(declare-fun b!1192151 () Bool)

(declare-fun res!793052 () Bool)

(assert (=> b!1192151 (=> (not res!793052) (not e!677614))))

(assert (=> b!1192151 (= res!793052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192146 () Bool)

(declare-fun e!677613 () Bool)

(assert (=> b!1192146 (= e!677613 tp_is_empty!30151)))

(declare-fun res!793047 () Bool)

(assert (=> start!100036 (=> (not res!793047) (not e!677614))))

(assert (=> start!100036 (= res!793047 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37699 _keys!1208))))))

(assert (=> start!100036 e!677614))

(assert (=> start!100036 tp_is_empty!30151))

(declare-fun array_inv!28460 (array!77022) Bool)

(assert (=> start!100036 (array_inv!28460 _keys!1208)))

(assert (=> start!100036 true))

(assert (=> start!100036 tp!89576))

(declare-fun e!677620 () Bool)

(declare-fun array_inv!28461 (array!77024) Bool)

(assert (=> start!100036 (and (array_inv!28461 _values!996) e!677620)))

(declare-fun b!1192152 () Bool)

(declare-fun res!793057 () Bool)

(assert (=> b!1192152 (=> (not res!793057) (not e!677614))))

(assert (=> b!1192152 (= res!793057 (and (= (size!37700 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37699 _keys!1208) (size!37700 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192153 () Bool)

(declare-fun res!793055 () Bool)

(assert (=> b!1192153 (=> (not res!793055) (not e!677614))))

(assert (=> b!1192153 (= res!793055 (= (select (arr!37161 _keys!1208) i!673) k0!934))))

(declare-fun b!1192154 () Bool)

(assert (=> b!1192154 (= e!677618 true)))

(declare-fun -!1724 (ListLongMap!17533 (_ BitVec 64)) ListLongMap!17533)

(assert (=> b!1192154 (= (getCurrentListMapNoExtraKeys!5232 lt!541962 lt!541957 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1724 (getCurrentListMapNoExtraKeys!5232 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541959 () Unit!39431)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!974 (array!77022 array!77024 (_ BitVec 32) (_ BitVec 32) V!45329 V!45329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39431)

(assert (=> b!1192154 (= lt!541959 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!974 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192155 () Bool)

(declare-fun res!793051 () Bool)

(assert (=> b!1192155 (=> (not res!793051) (not e!677614))))

(declare-datatypes ((List!26278 0))(
  ( (Nil!26275) (Cons!26274 (h!27483 (_ BitVec 64)) (t!38882 List!26278)) )
))
(declare-fun arrayNoDuplicates!0 (array!77022 (_ BitVec 32) List!26278) Bool)

(assert (=> b!1192155 (= res!793051 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26275))))

(declare-fun b!1192156 () Bool)

(declare-fun res!793053 () Bool)

(assert (=> b!1192156 (=> (not res!793053) (not e!677617))))

(assert (=> b!1192156 (= res!793053 (arrayNoDuplicates!0 lt!541962 #b00000000000000000000000000000000 Nil!26275))))

(declare-fun b!1192157 () Bool)

(assert (=> b!1192157 (= e!677620 (and e!677613 mapRes!47054))))

(declare-fun condMapEmpty!47054 () Bool)

(declare-fun mapDefault!47054 () ValueCell!14366)

(assert (=> b!1192157 (= condMapEmpty!47054 (= (arr!37162 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14366)) mapDefault!47054)))))

(assert (= (and start!100036 res!793047) b!1192143))

(assert (= (and b!1192143 res!793056) b!1192152))

(assert (= (and b!1192152 res!793057) b!1192151))

(assert (= (and b!1192151 res!793052) b!1192155))

(assert (= (and b!1192155 res!793051) b!1192145))

(assert (= (and b!1192145 res!793049) b!1192147))

(assert (= (and b!1192147 res!793054) b!1192153))

(assert (= (and b!1192153 res!793055) b!1192149))

(assert (= (and b!1192149 res!793048) b!1192156))

(assert (= (and b!1192156 res!793053) b!1192144))

(assert (= (and b!1192144 (not res!793050)) b!1192148))

(assert (= (and b!1192148 (not res!793046)) b!1192154))

(assert (= (and b!1192157 condMapEmpty!47054) mapIsEmpty!47054))

(assert (= (and b!1192157 (not condMapEmpty!47054)) mapNonEmpty!47054))

(get-info :version)

(assert (= (and mapNonEmpty!47054 ((_ is ValueCellFull!14366) mapValue!47054)) b!1192150))

(assert (= (and b!1192157 ((_ is ValueCellFull!14366) mapDefault!47054)) b!1192146))

(assert (= start!100036 b!1192157))

(declare-fun b_lambda!20747 () Bool)

(assert (=> (not b_lambda!20747) (not b!1192148)))

(declare-fun t!38880 () Bool)

(declare-fun tb!10425 () Bool)

(assert (=> (and start!100036 (= defaultEntry!1004 defaultEntry!1004) t!38880) tb!10425))

(declare-fun result!21425 () Bool)

(assert (=> tb!10425 (= result!21425 tp_is_empty!30151)))

(assert (=> b!1192148 t!38880))

(declare-fun b_and!42089 () Bool)

(assert (= b_and!42087 (and (=> t!38880 result!21425) b_and!42089)))

(declare-fun m!1100033 () Bool)

(assert (=> b!1192156 m!1100033))

(declare-fun m!1100035 () Bool)

(assert (=> b!1192154 m!1100035))

(declare-fun m!1100037 () Bool)

(assert (=> b!1192154 m!1100037))

(assert (=> b!1192154 m!1100037))

(declare-fun m!1100039 () Bool)

(assert (=> b!1192154 m!1100039))

(declare-fun m!1100041 () Bool)

(assert (=> b!1192154 m!1100041))

(declare-fun m!1100043 () Bool)

(assert (=> mapNonEmpty!47054 m!1100043))

(declare-fun m!1100045 () Bool)

(assert (=> b!1192153 m!1100045))

(declare-fun m!1100047 () Bool)

(assert (=> b!1192151 m!1100047))

(declare-fun m!1100049 () Bool)

(assert (=> b!1192147 m!1100049))

(declare-fun m!1100051 () Bool)

(assert (=> b!1192155 m!1100051))

(declare-fun m!1100053 () Bool)

(assert (=> b!1192148 m!1100053))

(declare-fun m!1100055 () Bool)

(assert (=> b!1192148 m!1100055))

(declare-fun m!1100057 () Bool)

(assert (=> b!1192148 m!1100057))

(declare-fun m!1100059 () Bool)

(assert (=> b!1192148 m!1100059))

(declare-fun m!1100061 () Bool)

(assert (=> b!1192144 m!1100061))

(declare-fun m!1100063 () Bool)

(assert (=> b!1192144 m!1100063))

(declare-fun m!1100065 () Bool)

(assert (=> start!100036 m!1100065))

(declare-fun m!1100067 () Bool)

(assert (=> start!100036 m!1100067))

(declare-fun m!1100069 () Bool)

(assert (=> b!1192143 m!1100069))

(declare-fun m!1100071 () Bool)

(assert (=> b!1192149 m!1100071))

(declare-fun m!1100073 () Bool)

(assert (=> b!1192149 m!1100073))

(check-sat (not b!1192154) (not start!100036) tp_is_empty!30151 (not b!1192143) (not b!1192156) (not b!1192147) (not b!1192144) b_and!42089 (not b!1192149) (not mapNonEmpty!47054) (not b_next!25621) (not b!1192155) (not b!1192151) (not b!1192148) (not b_lambda!20747))
(check-sat b_and!42089 (not b_next!25621))
