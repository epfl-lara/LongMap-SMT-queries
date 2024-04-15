; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95986 () Bool)

(assert start!95986)

(declare-fun b_free!22645 () Bool)

(declare-fun b_next!22645 () Bool)

(assert (=> start!95986 (= b_free!22645 (not b_next!22645))))

(declare-fun tp!79784 () Bool)

(declare-fun b_and!35939 () Bool)

(assert (=> start!95986 (= tp!79784 b_and!35939)))

(declare-fun res!725500 () Bool)

(declare-fun e!621334 () Bool)

(assert (=> start!95986 (=> (not res!725500) (not e!621334))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95986 (= res!725500 (validMask!0 mask!1414))))

(assert (=> start!95986 e!621334))

(assert (=> start!95986 tp!79784))

(assert (=> start!95986 true))

(declare-fun tp_is_empty!26647 () Bool)

(assert (=> start!95986 tp_is_empty!26647))

(declare-datatypes ((array!70144 0))(
  ( (array!70145 (arr!33746 (Array (_ BitVec 32) (_ BitVec 64))) (size!34284 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70144)

(declare-fun array_inv!26076 (array!70144) Bool)

(assert (=> start!95986 (array_inv!26076 _keys!1070)))

(declare-datatypes ((V!40657 0))(
  ( (V!40658 (val!13380 Int)) )
))
(declare-datatypes ((ValueCell!12614 0))(
  ( (ValueCellFull!12614 (v!16000 V!40657)) (EmptyCell!12614) )
))
(declare-datatypes ((array!70146 0))(
  ( (array!70147 (arr!33747 (Array (_ BitVec 32) ValueCell!12614)) (size!34285 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70146)

(declare-fun e!621341 () Bool)

(declare-fun array_inv!26077 (array!70146) Bool)

(assert (=> start!95986 (and (array_inv!26077 _values!874) e!621341)))

(declare-fun b!1087777 () Bool)

(declare-fun e!621337 () Bool)

(assert (=> b!1087777 (= e!621334 e!621337)))

(declare-fun res!725501 () Bool)

(assert (=> b!1087777 (=> (not res!725501) (not e!621337))))

(declare-fun lt!484152 () array!70144)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70144 (_ BitVec 32)) Bool)

(assert (=> b!1087777 (= res!725501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484152 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087777 (= lt!484152 (array!70145 (store (arr!33746 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34284 _keys!1070)))))

(declare-fun b!1087778 () Bool)

(declare-fun res!725498 () Bool)

(assert (=> b!1087778 (=> (not res!725498) (not e!621334))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087778 (= res!725498 (and (= (size!34285 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34284 _keys!1070) (size!34285 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087779 () Bool)

(declare-fun res!725508 () Bool)

(assert (=> b!1087779 (=> (not res!725508) (not e!621334))))

(declare-datatypes ((List!23609 0))(
  ( (Nil!23606) (Cons!23605 (h!24814 (_ BitVec 64)) (t!33303 List!23609)) )
))
(declare-fun arrayNoDuplicates!0 (array!70144 (_ BitVec 32) List!23609) Bool)

(assert (=> b!1087779 (= res!725508 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23606))))

(declare-fun b!1087780 () Bool)

(declare-fun e!621335 () Bool)

(assert (=> b!1087780 (= e!621335 tp_is_empty!26647)))

(declare-fun b!1087781 () Bool)

(declare-fun res!725499 () Bool)

(assert (=> b!1087781 (=> (not res!725499) (not e!621337))))

(assert (=> b!1087781 (= res!725499 (arrayNoDuplicates!0 lt!484152 #b00000000000000000000000000000000 Nil!23606))))

(declare-fun b!1087782 () Bool)

(declare-fun res!725504 () Bool)

(assert (=> b!1087782 (=> (not res!725504) (not e!621334))))

(assert (=> b!1087782 (= res!725504 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34284 _keys!1070))))))

(declare-fun mapIsEmpty!41725 () Bool)

(declare-fun mapRes!41725 () Bool)

(assert (=> mapIsEmpty!41725 mapRes!41725))

(declare-fun b!1087783 () Bool)

(declare-fun e!621340 () Bool)

(assert (=> b!1087783 (= e!621340 tp_is_empty!26647)))

(declare-fun b!1087784 () Bool)

(declare-fun res!725505 () Bool)

(assert (=> b!1087784 (=> (not res!725505) (not e!621334))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1087784 (= res!725505 (= (select (arr!33746 _keys!1070) i!650) k0!904))))

(declare-fun b!1087785 () Bool)

(declare-fun e!621339 () Bool)

(declare-fun e!621336 () Bool)

(assert (=> b!1087785 (= e!621339 e!621336)))

(declare-fun res!725507 () Bool)

(assert (=> b!1087785 (=> res!725507 e!621336)))

(assert (=> b!1087785 (= res!725507 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17042 0))(
  ( (tuple2!17043 (_1!8532 (_ BitVec 64)) (_2!8532 V!40657)) )
))
(declare-datatypes ((List!23610 0))(
  ( (Nil!23607) (Cons!23606 (h!24815 tuple2!17042) (t!33304 List!23610)) )
))
(declare-datatypes ((ListLongMap!15011 0))(
  ( (ListLongMap!15012 (toList!7521 List!23610)) )
))
(declare-fun lt!484150 () ListLongMap!15011)

(declare-fun lt!484154 () ListLongMap!15011)

(assert (=> b!1087785 (= lt!484150 lt!484154)))

(declare-fun lt!484149 () ListLongMap!15011)

(declare-fun lt!484151 () tuple2!17042)

(declare-fun +!3325 (ListLongMap!15011 tuple2!17042) ListLongMap!15011)

(assert (=> b!1087785 (= lt!484154 (+!3325 lt!484149 lt!484151))))

(declare-fun lt!484157 () ListLongMap!15011)

(declare-fun lt!484156 () ListLongMap!15011)

(assert (=> b!1087785 (= lt!484157 lt!484156)))

(declare-fun lt!484153 () ListLongMap!15011)

(assert (=> b!1087785 (= lt!484156 (+!3325 lt!484153 lt!484151))))

(declare-fun lt!484146 () ListLongMap!15011)

(assert (=> b!1087785 (= lt!484150 (+!3325 lt!484146 lt!484151))))

(declare-fun zeroValue!831 () V!40657)

(assert (=> b!1087785 (= lt!484151 (tuple2!17043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087786 () Bool)

(assert (=> b!1087786 (= e!621336 true)))

(declare-fun -!799 (ListLongMap!15011 (_ BitVec 64)) ListLongMap!15011)

(assert (=> b!1087786 (= (-!799 lt!484156 k0!904) lt!484154)))

(declare-datatypes ((Unit!35633 0))(
  ( (Unit!35634) )
))
(declare-fun lt!484155 () Unit!35633)

(declare-fun addRemoveCommutativeForDiffKeys!52 (ListLongMap!15011 (_ BitVec 64) V!40657 (_ BitVec 64)) Unit!35633)

(assert (=> b!1087786 (= lt!484155 (addRemoveCommutativeForDiffKeys!52 lt!484153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087787 () Bool)

(declare-fun res!725506 () Bool)

(assert (=> b!1087787 (=> (not res!725506) (not e!621334))))

(assert (=> b!1087787 (= res!725506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41725 () Bool)

(declare-fun tp!79783 () Bool)

(assert (=> mapNonEmpty!41725 (= mapRes!41725 (and tp!79783 e!621335))))

(declare-fun mapRest!41725 () (Array (_ BitVec 32) ValueCell!12614))

(declare-fun mapKey!41725 () (_ BitVec 32))

(declare-fun mapValue!41725 () ValueCell!12614)

(assert (=> mapNonEmpty!41725 (= (arr!33747 _values!874) (store mapRest!41725 mapKey!41725 mapValue!41725))))

(declare-fun b!1087788 () Bool)

(assert (=> b!1087788 (= e!621337 (not e!621339))))

(declare-fun res!725502 () Bool)

(assert (=> b!1087788 (=> res!725502 e!621339)))

(assert (=> b!1087788 (= res!725502 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40657)

(declare-fun getCurrentListMap!4202 (array!70144 array!70146 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) Int) ListLongMap!15011)

(assert (=> b!1087788 (= lt!484157 (getCurrentListMap!4202 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484148 () array!70146)

(assert (=> b!1087788 (= lt!484150 (getCurrentListMap!4202 lt!484152 lt!484148 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087788 (and (= lt!484146 lt!484149) (= lt!484149 lt!484146))))

(assert (=> b!1087788 (= lt!484149 (-!799 lt!484153 k0!904))))

(declare-fun lt!484147 () Unit!35633)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!86 (array!70144 array!70146 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35633)

(assert (=> b!1087788 (= lt!484147 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!86 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4072 (array!70144 array!70146 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) Int) ListLongMap!15011)

(assert (=> b!1087788 (= lt!484146 (getCurrentListMapNoExtraKeys!4072 lt!484152 lt!484148 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2143 (Int (_ BitVec 64)) V!40657)

(assert (=> b!1087788 (= lt!484148 (array!70147 (store (arr!33747 _values!874) i!650 (ValueCellFull!12614 (dynLambda!2143 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34285 _values!874)))))

(assert (=> b!1087788 (= lt!484153 (getCurrentListMapNoExtraKeys!4072 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087788 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484145 () Unit!35633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70144 (_ BitVec 64) (_ BitVec 32)) Unit!35633)

(assert (=> b!1087788 (= lt!484145 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087789 () Bool)

(declare-fun res!725503 () Bool)

(assert (=> b!1087789 (=> (not res!725503) (not e!621334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087789 (= res!725503 (validKeyInArray!0 k0!904))))

(declare-fun b!1087790 () Bool)

(assert (=> b!1087790 (= e!621341 (and e!621340 mapRes!41725))))

(declare-fun condMapEmpty!41725 () Bool)

(declare-fun mapDefault!41725 () ValueCell!12614)

(assert (=> b!1087790 (= condMapEmpty!41725 (= (arr!33747 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12614)) mapDefault!41725)))))

(assert (= (and start!95986 res!725500) b!1087778))

(assert (= (and b!1087778 res!725498) b!1087787))

(assert (= (and b!1087787 res!725506) b!1087779))

(assert (= (and b!1087779 res!725508) b!1087782))

(assert (= (and b!1087782 res!725504) b!1087789))

(assert (= (and b!1087789 res!725503) b!1087784))

(assert (= (and b!1087784 res!725505) b!1087777))

(assert (= (and b!1087777 res!725501) b!1087781))

(assert (= (and b!1087781 res!725499) b!1087788))

(assert (= (and b!1087788 (not res!725502)) b!1087785))

(assert (= (and b!1087785 (not res!725507)) b!1087786))

(assert (= (and b!1087790 condMapEmpty!41725) mapIsEmpty!41725))

(assert (= (and b!1087790 (not condMapEmpty!41725)) mapNonEmpty!41725))

(get-info :version)

(assert (= (and mapNonEmpty!41725 ((_ is ValueCellFull!12614) mapValue!41725)) b!1087780))

(assert (= (and b!1087790 ((_ is ValueCellFull!12614) mapDefault!41725)) b!1087783))

(assert (= start!95986 b!1087790))

(declare-fun b_lambda!17293 () Bool)

(assert (=> (not b_lambda!17293) (not b!1087788)))

(declare-fun t!33302 () Bool)

(declare-fun tb!7515 () Bool)

(assert (=> (and start!95986 (= defaultEntry!882 defaultEntry!882) t!33302) tb!7515))

(declare-fun result!15557 () Bool)

(assert (=> tb!7515 (= result!15557 tp_is_empty!26647)))

(assert (=> b!1087788 t!33302))

(declare-fun b_and!35941 () Bool)

(assert (= b_and!35939 (and (=> t!33302 result!15557) b_and!35941)))

(declare-fun m!1006277 () Bool)

(assert (=> mapNonEmpty!41725 m!1006277))

(declare-fun m!1006279 () Bool)

(assert (=> b!1087787 m!1006279))

(declare-fun m!1006281 () Bool)

(assert (=> start!95986 m!1006281))

(declare-fun m!1006283 () Bool)

(assert (=> start!95986 m!1006283))

(declare-fun m!1006285 () Bool)

(assert (=> start!95986 m!1006285))

(declare-fun m!1006287 () Bool)

(assert (=> b!1087786 m!1006287))

(declare-fun m!1006289 () Bool)

(assert (=> b!1087786 m!1006289))

(declare-fun m!1006291 () Bool)

(assert (=> b!1087781 m!1006291))

(declare-fun m!1006293 () Bool)

(assert (=> b!1087784 m!1006293))

(declare-fun m!1006295 () Bool)

(assert (=> b!1087789 m!1006295))

(declare-fun m!1006297 () Bool)

(assert (=> b!1087788 m!1006297))

(declare-fun m!1006299 () Bool)

(assert (=> b!1087788 m!1006299))

(declare-fun m!1006301 () Bool)

(assert (=> b!1087788 m!1006301))

(declare-fun m!1006303 () Bool)

(assert (=> b!1087788 m!1006303))

(declare-fun m!1006305 () Bool)

(assert (=> b!1087788 m!1006305))

(declare-fun m!1006307 () Bool)

(assert (=> b!1087788 m!1006307))

(declare-fun m!1006309 () Bool)

(assert (=> b!1087788 m!1006309))

(declare-fun m!1006311 () Bool)

(assert (=> b!1087788 m!1006311))

(declare-fun m!1006313 () Bool)

(assert (=> b!1087788 m!1006313))

(declare-fun m!1006315 () Bool)

(assert (=> b!1087788 m!1006315))

(declare-fun m!1006317 () Bool)

(assert (=> b!1087785 m!1006317))

(declare-fun m!1006319 () Bool)

(assert (=> b!1087785 m!1006319))

(declare-fun m!1006321 () Bool)

(assert (=> b!1087785 m!1006321))

(declare-fun m!1006323 () Bool)

(assert (=> b!1087777 m!1006323))

(declare-fun m!1006325 () Bool)

(assert (=> b!1087777 m!1006325))

(declare-fun m!1006327 () Bool)

(assert (=> b!1087779 m!1006327))

(check-sat (not b!1087789) (not b!1087785) (not b!1087786) (not start!95986) tp_is_empty!26647 (not b!1087788) (not b_next!22645) (not b!1087779) (not b!1087777) (not b!1087781) (not mapNonEmpty!41725) (not b_lambda!17293) (not b!1087787) b_and!35941)
(check-sat b_and!35941 (not b_next!22645))
