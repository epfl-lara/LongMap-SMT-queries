; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96000 () Bool)

(assert start!96000)

(declare-fun b_free!22653 () Bool)

(declare-fun b_next!22653 () Bool)

(assert (=> start!96000 (= b_free!22653 (not b_next!22653))))

(declare-fun tp!79807 () Bool)

(declare-fun b_and!35981 () Bool)

(assert (=> start!96000 (= tp!79807 b_and!35981)))

(declare-fun b!1088106 () Bool)

(declare-fun e!621528 () Bool)

(declare-fun e!621524 () Bool)

(assert (=> b!1088106 (= e!621528 e!621524)))

(declare-fun res!725701 () Bool)

(assert (=> b!1088106 (=> (not res!725701) (not e!621524))))

(declare-datatypes ((array!70235 0))(
  ( (array!70236 (arr!33791 (Array (_ BitVec 32) (_ BitVec 64))) (size!34327 (_ BitVec 32))) )
))
(declare-fun lt!484502 () array!70235)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70235 (_ BitVec 32)) Bool)

(assert (=> b!1088106 (= res!725701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484502 mask!1414))))

(declare-fun _keys!1070 () array!70235)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088106 (= lt!484502 (array!70236 (store (arr!33791 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34327 _keys!1070)))))

(declare-fun res!725703 () Bool)

(assert (=> start!96000 (=> (not res!725703) (not e!621528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96000 (= res!725703 (validMask!0 mask!1414))))

(assert (=> start!96000 e!621528))

(assert (=> start!96000 tp!79807))

(assert (=> start!96000 true))

(declare-fun tp_is_empty!26655 () Bool)

(assert (=> start!96000 tp_is_empty!26655))

(declare-fun array_inv!26062 (array!70235) Bool)

(assert (=> start!96000 (array_inv!26062 _keys!1070)))

(declare-datatypes ((V!40667 0))(
  ( (V!40668 (val!13384 Int)) )
))
(declare-datatypes ((ValueCell!12618 0))(
  ( (ValueCellFull!12618 (v!16005 V!40667)) (EmptyCell!12618) )
))
(declare-datatypes ((array!70237 0))(
  ( (array!70238 (arr!33792 (Array (_ BitVec 32) ValueCell!12618)) (size!34328 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70237)

(declare-fun e!621529 () Bool)

(declare-fun array_inv!26063 (array!70237) Bool)

(assert (=> start!96000 (and (array_inv!26063 _values!874) e!621529)))

(declare-fun b!1088107 () Bool)

(declare-fun res!725708 () Bool)

(assert (=> b!1088107 (=> (not res!725708) (not e!621528))))

(assert (=> b!1088107 (= res!725708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41737 () Bool)

(declare-fun mapRes!41737 () Bool)

(declare-fun tp!79808 () Bool)

(declare-fun e!621525 () Bool)

(assert (=> mapNonEmpty!41737 (= mapRes!41737 (and tp!79808 e!621525))))

(declare-fun mapKey!41737 () (_ BitVec 32))

(declare-fun mapRest!41737 () (Array (_ BitVec 32) ValueCell!12618))

(declare-fun mapValue!41737 () ValueCell!12618)

(assert (=> mapNonEmpty!41737 (= (arr!33792 _values!874) (store mapRest!41737 mapKey!41737 mapValue!41737))))

(declare-fun b!1088108 () Bool)

(declare-fun e!621527 () Bool)

(assert (=> b!1088108 (= e!621524 (not e!621527))))

(declare-fun res!725702 () Bool)

(assert (=> b!1088108 (=> res!725702 e!621527)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088108 (= res!725702 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40667)

(declare-fun zeroValue!831 () V!40667)

(declare-datatypes ((tuple2!16986 0))(
  ( (tuple2!16987 (_1!8504 (_ BitVec 64)) (_2!8504 V!40667)) )
))
(declare-datatypes ((List!23574 0))(
  ( (Nil!23571) (Cons!23570 (h!24779 tuple2!16986) (t!33285 List!23574)) )
))
(declare-datatypes ((ListLongMap!14955 0))(
  ( (ListLongMap!14956 (toList!7493 List!23574)) )
))
(declare-fun lt!484504 () ListLongMap!14955)

(declare-fun getCurrentListMap!4267 (array!70235 array!70237 (_ BitVec 32) (_ BitVec 32) V!40667 V!40667 (_ BitVec 32) Int) ListLongMap!14955)

(assert (=> b!1088108 (= lt!484504 (getCurrentListMap!4267 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484501 () ListLongMap!14955)

(declare-fun lt!484506 () array!70237)

(assert (=> b!1088108 (= lt!484501 (getCurrentListMap!4267 lt!484502 lt!484506 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484503 () ListLongMap!14955)

(declare-fun lt!484507 () ListLongMap!14955)

(assert (=> b!1088108 (and (= lt!484503 lt!484507) (= lt!484507 lt!484503))))

(declare-fun lt!484505 () ListLongMap!14955)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!818 (ListLongMap!14955 (_ BitVec 64)) ListLongMap!14955)

(assert (=> b!1088108 (= lt!484507 (-!818 lt!484505 k0!904))))

(declare-datatypes ((Unit!35802 0))(
  ( (Unit!35803) )
))
(declare-fun lt!484511 () Unit!35802)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!86 (array!70235 array!70237 (_ BitVec 32) (_ BitVec 32) V!40667 V!40667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35802)

(assert (=> b!1088108 (= lt!484511 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!86 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4027 (array!70235 array!70237 (_ BitVec 32) (_ BitVec 32) V!40667 V!40667 (_ BitVec 32) Int) ListLongMap!14955)

(assert (=> b!1088108 (= lt!484503 (getCurrentListMapNoExtraKeys!4027 lt!484502 lt!484506 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2164 (Int (_ BitVec 64)) V!40667)

(assert (=> b!1088108 (= lt!484506 (array!70238 (store (arr!33792 _values!874) i!650 (ValueCellFull!12618 (dynLambda!2164 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34328 _values!874)))))

(assert (=> b!1088108 (= lt!484505 (getCurrentListMapNoExtraKeys!4027 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088108 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484513 () Unit!35802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70235 (_ BitVec 64) (_ BitVec 32)) Unit!35802)

(assert (=> b!1088108 (= lt!484513 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088109 () Bool)

(assert (=> b!1088109 (= e!621525 tp_is_empty!26655)))

(declare-fun b!1088110 () Bool)

(declare-fun e!621526 () Bool)

(assert (=> b!1088110 (= e!621527 e!621526)))

(declare-fun res!725705 () Bool)

(assert (=> b!1088110 (=> res!725705 e!621526)))

(assert (=> b!1088110 (= res!725705 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484512 () ListLongMap!14955)

(assert (=> b!1088110 (= lt!484501 lt!484512)))

(declare-fun lt!484509 () tuple2!16986)

(declare-fun +!3294 (ListLongMap!14955 tuple2!16986) ListLongMap!14955)

(assert (=> b!1088110 (= lt!484512 (+!3294 lt!484507 lt!484509))))

(declare-fun lt!484510 () ListLongMap!14955)

(assert (=> b!1088110 (= lt!484504 lt!484510)))

(assert (=> b!1088110 (= lt!484510 (+!3294 lt!484505 lt!484509))))

(assert (=> b!1088110 (= lt!484501 (+!3294 lt!484503 lt!484509))))

(assert (=> b!1088110 (= lt!484509 (tuple2!16987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088111 () Bool)

(declare-fun e!621530 () Bool)

(assert (=> b!1088111 (= e!621530 tp_is_empty!26655)))

(declare-fun mapIsEmpty!41737 () Bool)

(assert (=> mapIsEmpty!41737 mapRes!41737))

(declare-fun b!1088112 () Bool)

(declare-fun res!725706 () Bool)

(assert (=> b!1088112 (=> (not res!725706) (not e!621528))))

(assert (=> b!1088112 (= res!725706 (and (= (size!34328 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34327 _keys!1070) (size!34328 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088113 () Bool)

(assert (=> b!1088113 (= e!621526 true)))

(assert (=> b!1088113 (= (-!818 lt!484510 k0!904) lt!484512)))

(declare-fun lt!484508 () Unit!35802)

(declare-fun addRemoveCommutativeForDiffKeys!49 (ListLongMap!14955 (_ BitVec 64) V!40667 (_ BitVec 64)) Unit!35802)

(assert (=> b!1088113 (= lt!484508 (addRemoveCommutativeForDiffKeys!49 lt!484505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088114 () Bool)

(declare-fun res!725700 () Bool)

(assert (=> b!1088114 (=> (not res!725700) (not e!621528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088114 (= res!725700 (validKeyInArray!0 k0!904))))

(declare-fun b!1088115 () Bool)

(assert (=> b!1088115 (= e!621529 (and e!621530 mapRes!41737))))

(declare-fun condMapEmpty!41737 () Bool)

(declare-fun mapDefault!41737 () ValueCell!12618)

(assert (=> b!1088115 (= condMapEmpty!41737 (= (arr!33792 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12618)) mapDefault!41737)))))

(declare-fun b!1088116 () Bool)

(declare-fun res!725709 () Bool)

(assert (=> b!1088116 (=> (not res!725709) (not e!621528))))

(assert (=> b!1088116 (= res!725709 (= (select (arr!33791 _keys!1070) i!650) k0!904))))

(declare-fun b!1088117 () Bool)

(declare-fun res!725704 () Bool)

(assert (=> b!1088117 (=> (not res!725704) (not e!621528))))

(declare-datatypes ((List!23575 0))(
  ( (Nil!23572) (Cons!23571 (h!24780 (_ BitVec 64)) (t!33286 List!23575)) )
))
(declare-fun arrayNoDuplicates!0 (array!70235 (_ BitVec 32) List!23575) Bool)

(assert (=> b!1088117 (= res!725704 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23572))))

(declare-fun b!1088118 () Bool)

(declare-fun res!725699 () Bool)

(assert (=> b!1088118 (=> (not res!725699) (not e!621524))))

(assert (=> b!1088118 (= res!725699 (arrayNoDuplicates!0 lt!484502 #b00000000000000000000000000000000 Nil!23572))))

(declare-fun b!1088119 () Bool)

(declare-fun res!725707 () Bool)

(assert (=> b!1088119 (=> (not res!725707) (not e!621528))))

(assert (=> b!1088119 (= res!725707 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34327 _keys!1070))))))

(assert (= (and start!96000 res!725703) b!1088112))

(assert (= (and b!1088112 res!725706) b!1088107))

(assert (= (and b!1088107 res!725708) b!1088117))

(assert (= (and b!1088117 res!725704) b!1088119))

(assert (= (and b!1088119 res!725707) b!1088114))

(assert (= (and b!1088114 res!725700) b!1088116))

(assert (= (and b!1088116 res!725709) b!1088106))

(assert (= (and b!1088106 res!725701) b!1088118))

(assert (= (and b!1088118 res!725699) b!1088108))

(assert (= (and b!1088108 (not res!725702)) b!1088110))

(assert (= (and b!1088110 (not res!725705)) b!1088113))

(assert (= (and b!1088115 condMapEmpty!41737) mapIsEmpty!41737))

(assert (= (and b!1088115 (not condMapEmpty!41737)) mapNonEmpty!41737))

(get-info :version)

(assert (= (and mapNonEmpty!41737 ((_ is ValueCellFull!12618) mapValue!41737)) b!1088109))

(assert (= (and b!1088115 ((_ is ValueCellFull!12618) mapDefault!41737)) b!1088111))

(assert (= start!96000 b!1088115))

(declare-fun b_lambda!17323 () Bool)

(assert (=> (not b_lambda!17323) (not b!1088108)))

(declare-fun t!33284 () Bool)

(declare-fun tb!7531 () Bool)

(assert (=> (and start!96000 (= defaultEntry!882 defaultEntry!882) t!33284) tb!7531))

(declare-fun result!15581 () Bool)

(assert (=> tb!7531 (= result!15581 tp_is_empty!26655)))

(assert (=> b!1088108 t!33284))

(declare-fun b_and!35983 () Bool)

(assert (= b_and!35981 (and (=> t!33284 result!15581) b_and!35983)))

(declare-fun m!1007111 () Bool)

(assert (=> b!1088114 m!1007111))

(declare-fun m!1007113 () Bool)

(assert (=> b!1088110 m!1007113))

(declare-fun m!1007115 () Bool)

(assert (=> b!1088110 m!1007115))

(declare-fun m!1007117 () Bool)

(assert (=> b!1088110 m!1007117))

(declare-fun m!1007119 () Bool)

(assert (=> b!1088118 m!1007119))

(declare-fun m!1007121 () Bool)

(assert (=> b!1088107 m!1007121))

(declare-fun m!1007123 () Bool)

(assert (=> b!1088108 m!1007123))

(declare-fun m!1007125 () Bool)

(assert (=> b!1088108 m!1007125))

(declare-fun m!1007127 () Bool)

(assert (=> b!1088108 m!1007127))

(declare-fun m!1007129 () Bool)

(assert (=> b!1088108 m!1007129))

(declare-fun m!1007131 () Bool)

(assert (=> b!1088108 m!1007131))

(declare-fun m!1007133 () Bool)

(assert (=> b!1088108 m!1007133))

(declare-fun m!1007135 () Bool)

(assert (=> b!1088108 m!1007135))

(declare-fun m!1007137 () Bool)

(assert (=> b!1088108 m!1007137))

(declare-fun m!1007139 () Bool)

(assert (=> b!1088108 m!1007139))

(declare-fun m!1007141 () Bool)

(assert (=> b!1088108 m!1007141))

(declare-fun m!1007143 () Bool)

(assert (=> mapNonEmpty!41737 m!1007143))

(declare-fun m!1007145 () Bool)

(assert (=> b!1088116 m!1007145))

(declare-fun m!1007147 () Bool)

(assert (=> b!1088113 m!1007147))

(declare-fun m!1007149 () Bool)

(assert (=> b!1088113 m!1007149))

(declare-fun m!1007151 () Bool)

(assert (=> b!1088117 m!1007151))

(declare-fun m!1007153 () Bool)

(assert (=> start!96000 m!1007153))

(declare-fun m!1007155 () Bool)

(assert (=> start!96000 m!1007155))

(declare-fun m!1007157 () Bool)

(assert (=> start!96000 m!1007157))

(declare-fun m!1007159 () Bool)

(assert (=> b!1088106 m!1007159))

(declare-fun m!1007161 () Bool)

(assert (=> b!1088106 m!1007161))

(check-sat tp_is_empty!26655 (not b!1088108) (not start!96000) (not b!1088106) (not b_next!22653) (not b!1088117) (not mapNonEmpty!41737) (not b!1088113) (not b_lambda!17323) (not b!1088118) (not b!1088114) (not b!1088110) b_and!35983 (not b!1088107))
(check-sat b_and!35983 (not b_next!22653))
