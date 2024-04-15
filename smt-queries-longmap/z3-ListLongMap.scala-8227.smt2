; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100264 () Bool)

(assert start!100264)

(declare-fun mapNonEmpty!47342 () Bool)

(declare-fun mapRes!47342 () Bool)

(declare-fun tp!89952 () Bool)

(declare-fun e!679553 () Bool)

(assert (=> mapNonEmpty!47342 (= mapRes!47342 (and tp!89952 e!679553))))

(declare-fun mapKey!47342 () (_ BitVec 32))

(declare-datatypes ((V!45577 0))(
  ( (V!45578 (val!15225 Int)) )
))
(declare-datatypes ((ValueCell!14459 0))(
  ( (ValueCellFull!14459 (v!17862 V!45577)) (EmptyCell!14459) )
))
(declare-fun mapRest!47342 () (Array (_ BitVec 32) ValueCell!14459))

(declare-datatypes ((array!77384 0))(
  ( (array!77385 (arr!37339 (Array (_ BitVec 32) ValueCell!14459)) (size!37877 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77384)

(declare-fun mapValue!47342 () ValueCell!14459)

(assert (=> mapNonEmpty!47342 (= (arr!37339 _values!996) (store mapRest!47342 mapKey!47342 mapValue!47342))))

(declare-fun b!1196016 () Bool)

(declare-fun res!795932 () Bool)

(declare-fun e!679551 () Bool)

(assert (=> b!1196016 (=> (not res!795932) (not e!679551))))

(declare-datatypes ((array!77386 0))(
  ( (array!77387 (arr!37340 (Array (_ BitVec 32) (_ BitVec 64))) (size!37878 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77386)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77386 (_ BitVec 32)) Bool)

(assert (=> b!1196016 (= res!795932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196017 () Bool)

(declare-fun res!795937 () Bool)

(assert (=> b!1196017 (=> (not res!795937) (not e!679551))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196017 (= res!795937 (validKeyInArray!0 k0!934))))

(declare-fun b!1196018 () Bool)

(declare-fun res!795935 () Bool)

(declare-fun e!679554 () Bool)

(assert (=> b!1196018 (=> (not res!795935) (not e!679554))))

(declare-fun lt!542843 () array!77386)

(declare-datatypes ((List!26370 0))(
  ( (Nil!26367) (Cons!26366 (h!27575 (_ BitVec 64)) (t!39032 List!26370)) )
))
(declare-fun arrayNoDuplicates!0 (array!77386 (_ BitVec 32) List!26370) Bool)

(assert (=> b!1196018 (= res!795935 (arrayNoDuplicates!0 lt!542843 #b00000000000000000000000000000000 Nil!26367))))

(declare-fun b!1196019 () Bool)

(declare-fun tp_is_empty!30337 () Bool)

(assert (=> b!1196019 (= e!679553 tp_is_empty!30337)))

(declare-fun b!1196020 () Bool)

(declare-fun res!795934 () Bool)

(assert (=> b!1196020 (=> (not res!795934) (not e!679551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196020 (= res!795934 (validMask!0 mask!1564))))

(declare-fun b!1196021 () Bool)

(declare-fun e!679552 () Bool)

(declare-fun e!679555 () Bool)

(assert (=> b!1196021 (= e!679552 (and e!679555 mapRes!47342))))

(declare-fun condMapEmpty!47342 () Bool)

(declare-fun mapDefault!47342 () ValueCell!14459)

(assert (=> b!1196021 (= condMapEmpty!47342 (= (arr!37339 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14459)) mapDefault!47342)))))

(declare-fun b!1196022 () Bool)

(assert (=> b!1196022 (= e!679551 e!679554)))

(declare-fun res!795940 () Bool)

(assert (=> b!1196022 (=> (not res!795940) (not e!679554))))

(assert (=> b!1196022 (= res!795940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542843 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196022 (= lt!542843 (array!77387 (store (arr!37340 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37878 _keys!1208)))))

(declare-fun b!1196023 () Bool)

(declare-fun res!795936 () Bool)

(assert (=> b!1196023 (=> (not res!795936) (not e!679551))))

(assert (=> b!1196023 (= res!795936 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26367))))

(declare-fun b!1196024 () Bool)

(assert (=> b!1196024 (= e!679554 (not true))))

(declare-fun arrayContainsKey!0 (array!77386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196024 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39531 0))(
  ( (Unit!39532) )
))
(declare-fun lt!542844 () Unit!39531)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77386 (_ BitVec 64) (_ BitVec 32)) Unit!39531)

(assert (=> b!1196024 (= lt!542844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196025 () Bool)

(declare-fun res!795931 () Bool)

(assert (=> b!1196025 (=> (not res!795931) (not e!679551))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196025 (= res!795931 (and (= (size!37877 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37878 _keys!1208) (size!37877 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47342 () Bool)

(assert (=> mapIsEmpty!47342 mapRes!47342))

(declare-fun res!795939 () Bool)

(assert (=> start!100264 (=> (not res!795939) (not e!679551))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100264 (= res!795939 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37878 _keys!1208))))))

(assert (=> start!100264 e!679551))

(declare-fun array_inv!28584 (array!77386) Bool)

(assert (=> start!100264 (array_inv!28584 _keys!1208)))

(assert (=> start!100264 true))

(declare-fun array_inv!28585 (array!77384) Bool)

(assert (=> start!100264 (and (array_inv!28585 _values!996) e!679552)))

(declare-fun b!1196015 () Bool)

(declare-fun res!795933 () Bool)

(assert (=> b!1196015 (=> (not res!795933) (not e!679551))))

(assert (=> b!1196015 (= res!795933 (= (select (arr!37340 _keys!1208) i!673) k0!934))))

(declare-fun b!1196026 () Bool)

(declare-fun res!795938 () Bool)

(assert (=> b!1196026 (=> (not res!795938) (not e!679551))))

(assert (=> b!1196026 (= res!795938 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37878 _keys!1208))))))

(declare-fun b!1196027 () Bool)

(assert (=> b!1196027 (= e!679555 tp_is_empty!30337)))

(assert (= (and start!100264 res!795939) b!1196020))

(assert (= (and b!1196020 res!795934) b!1196025))

(assert (= (and b!1196025 res!795931) b!1196016))

(assert (= (and b!1196016 res!795932) b!1196023))

(assert (= (and b!1196023 res!795936) b!1196026))

(assert (= (and b!1196026 res!795938) b!1196017))

(assert (= (and b!1196017 res!795937) b!1196015))

(assert (= (and b!1196015 res!795933) b!1196022))

(assert (= (and b!1196022 res!795940) b!1196018))

(assert (= (and b!1196018 res!795935) b!1196024))

(assert (= (and b!1196021 condMapEmpty!47342) mapIsEmpty!47342))

(assert (= (and b!1196021 (not condMapEmpty!47342)) mapNonEmpty!47342))

(get-info :version)

(assert (= (and mapNonEmpty!47342 ((_ is ValueCellFull!14459) mapValue!47342)) b!1196019))

(assert (= (and b!1196021 ((_ is ValueCellFull!14459) mapDefault!47342)) b!1196027))

(assert (= start!100264 b!1196021))

(declare-fun m!1102865 () Bool)

(assert (=> b!1196022 m!1102865))

(declare-fun m!1102867 () Bool)

(assert (=> b!1196022 m!1102867))

(declare-fun m!1102869 () Bool)

(assert (=> mapNonEmpty!47342 m!1102869))

(declare-fun m!1102871 () Bool)

(assert (=> b!1196017 m!1102871))

(declare-fun m!1102873 () Bool)

(assert (=> b!1196016 m!1102873))

(declare-fun m!1102875 () Bool)

(assert (=> b!1196020 m!1102875))

(declare-fun m!1102877 () Bool)

(assert (=> start!100264 m!1102877))

(declare-fun m!1102879 () Bool)

(assert (=> start!100264 m!1102879))

(declare-fun m!1102881 () Bool)

(assert (=> b!1196023 m!1102881))

(declare-fun m!1102883 () Bool)

(assert (=> b!1196015 m!1102883))

(declare-fun m!1102885 () Bool)

(assert (=> b!1196018 m!1102885))

(declare-fun m!1102887 () Bool)

(assert (=> b!1196024 m!1102887))

(declare-fun m!1102889 () Bool)

(assert (=> b!1196024 m!1102889))

(check-sat (not b!1196017) (not b!1196016) (not b!1196023) (not mapNonEmpty!47342) (not b!1196022) tp_is_empty!30337 (not b!1196018) (not start!100264) (not b!1196024) (not b!1196020))
(check-sat)
