; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95644 () Bool)

(assert start!95644)

(declare-fun b_free!22303 () Bool)

(declare-fun b_next!22303 () Bool)

(assert (=> start!95644 (= b_free!22303 (not b_next!22303))))

(declare-fun tp!78758 () Bool)

(declare-fun b_and!35255 () Bool)

(assert (=> start!95644 (= tp!78758 b_and!35255)))

(declare-fun mapIsEmpty!41212 () Bool)

(declare-fun mapRes!41212 () Bool)

(assert (=> mapIsEmpty!41212 mapRes!41212))

(declare-fun b!1080816 () Bool)

(declare-fun res!720425 () Bool)

(declare-fun e!617813 () Bool)

(assert (=> b!1080816 (=> (not res!720425) (not e!617813))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080816 (= res!720425 (validKeyInArray!0 k0!904))))

(declare-fun b!1080817 () Bool)

(declare-fun e!617815 () Bool)

(declare-fun tp_is_empty!26305 () Bool)

(assert (=> b!1080817 (= e!617815 tp_is_empty!26305)))

(declare-fun b!1080818 () Bool)

(declare-fun res!720426 () Bool)

(assert (=> b!1080818 (=> (not res!720426) (not e!617813))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69490 0))(
  ( (array!69491 (arr!33419 (Array (_ BitVec 32) (_ BitVec 64))) (size!33957 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69490)

(declare-datatypes ((V!40201 0))(
  ( (V!40202 (val!13209 Int)) )
))
(declare-datatypes ((ValueCell!12443 0))(
  ( (ValueCellFull!12443 (v!15829 V!40201)) (EmptyCell!12443) )
))
(declare-datatypes ((array!69492 0))(
  ( (array!69493 (arr!33420 (Array (_ BitVec 32) ValueCell!12443)) (size!33958 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69492)

(assert (=> b!1080818 (= res!720426 (and (= (size!33958 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33957 _keys!1070) (size!33958 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080819 () Bool)

(declare-fun res!720423 () Bool)

(assert (=> b!1080819 (=> (not res!720423) (not e!617813))))

(declare-datatypes ((List!23363 0))(
  ( (Nil!23360) (Cons!23359 (h!24568 (_ BitVec 64)) (t!32715 List!23363)) )
))
(declare-fun arrayNoDuplicates!0 (array!69490 (_ BitVec 32) List!23363) Bool)

(assert (=> b!1080819 (= res!720423 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23360))))

(declare-fun b!1080820 () Bool)

(declare-fun res!720422 () Bool)

(assert (=> b!1080820 (=> (not res!720422) (not e!617813))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080820 (= res!720422 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33957 _keys!1070))))))

(declare-fun b!1080822 () Bool)

(declare-fun res!720424 () Bool)

(assert (=> b!1080822 (=> (not res!720424) (not e!617813))))

(assert (=> b!1080822 (= res!720424 (= (select (arr!33419 _keys!1070) i!650) k0!904))))

(declare-fun b!1080823 () Bool)

(declare-fun e!617816 () Bool)

(assert (=> b!1080823 (= e!617816 tp_is_empty!26305)))

(declare-fun b!1080824 () Bool)

(declare-fun e!617811 () Bool)

(assert (=> b!1080824 (= e!617811 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40201)

(declare-datatypes ((tuple2!16802 0))(
  ( (tuple2!16803 (_1!8412 (_ BitVec 64)) (_2!8412 V!40201)) )
))
(declare-datatypes ((List!23364 0))(
  ( (Nil!23361) (Cons!23360 (h!24569 tuple2!16802) (t!32716 List!23364)) )
))
(declare-datatypes ((ListLongMap!14771 0))(
  ( (ListLongMap!14772 (toList!7401 List!23364)) )
))
(declare-fun lt!478953 () ListLongMap!14771)

(declare-fun lt!478952 () array!69490)

(declare-fun zeroValue!831 () V!40201)

(declare-fun getCurrentListMapNoExtraKeys!3964 (array!69490 array!69492 (_ BitVec 32) (_ BitVec 32) V!40201 V!40201 (_ BitVec 32) Int) ListLongMap!14771)

(declare-fun dynLambda!2035 (Int (_ BitVec 64)) V!40201)

(assert (=> b!1080824 (= lt!478953 (getCurrentListMapNoExtraKeys!3964 lt!478952 (array!69493 (store (arr!33420 _values!874) i!650 (ValueCellFull!12443 (dynLambda!2035 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33958 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!478955 () ListLongMap!14771)

(assert (=> b!1080824 (= lt!478955 (getCurrentListMapNoExtraKeys!3964 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080824 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35395 0))(
  ( (Unit!35396) )
))
(declare-fun lt!478954 () Unit!35395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69490 (_ BitVec 64) (_ BitVec 32)) Unit!35395)

(assert (=> b!1080824 (= lt!478954 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080825 () Bool)

(declare-fun res!720419 () Bool)

(assert (=> b!1080825 (=> (not res!720419) (not e!617813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69490 (_ BitVec 32)) Bool)

(assert (=> b!1080825 (= res!720419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41212 () Bool)

(declare-fun tp!78757 () Bool)

(assert (=> mapNonEmpty!41212 (= mapRes!41212 (and tp!78757 e!617815))))

(declare-fun mapKey!41212 () (_ BitVec 32))

(declare-fun mapValue!41212 () ValueCell!12443)

(declare-fun mapRest!41212 () (Array (_ BitVec 32) ValueCell!12443))

(assert (=> mapNonEmpty!41212 (= (arr!33420 _values!874) (store mapRest!41212 mapKey!41212 mapValue!41212))))

(declare-fun b!1080821 () Bool)

(assert (=> b!1080821 (= e!617813 e!617811)))

(declare-fun res!720420 () Bool)

(assert (=> b!1080821 (=> (not res!720420) (not e!617811))))

(assert (=> b!1080821 (= res!720420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478952 mask!1414))))

(assert (=> b!1080821 (= lt!478952 (array!69491 (store (arr!33419 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33957 _keys!1070)))))

(declare-fun res!720421 () Bool)

(assert (=> start!95644 (=> (not res!720421) (not e!617813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95644 (= res!720421 (validMask!0 mask!1414))))

(assert (=> start!95644 e!617813))

(assert (=> start!95644 tp!78758))

(assert (=> start!95644 true))

(assert (=> start!95644 tp_is_empty!26305))

(declare-fun array_inv!25834 (array!69490) Bool)

(assert (=> start!95644 (array_inv!25834 _keys!1070)))

(declare-fun e!617814 () Bool)

(declare-fun array_inv!25835 (array!69492) Bool)

(assert (=> start!95644 (and (array_inv!25835 _values!874) e!617814)))

(declare-fun b!1080826 () Bool)

(assert (=> b!1080826 (= e!617814 (and e!617816 mapRes!41212))))

(declare-fun condMapEmpty!41212 () Bool)

(declare-fun mapDefault!41212 () ValueCell!12443)

(assert (=> b!1080826 (= condMapEmpty!41212 (= (arr!33420 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12443)) mapDefault!41212)))))

(declare-fun b!1080827 () Bool)

(declare-fun res!720418 () Bool)

(assert (=> b!1080827 (=> (not res!720418) (not e!617811))))

(assert (=> b!1080827 (= res!720418 (arrayNoDuplicates!0 lt!478952 #b00000000000000000000000000000000 Nil!23360))))

(assert (= (and start!95644 res!720421) b!1080818))

(assert (= (and b!1080818 res!720426) b!1080825))

(assert (= (and b!1080825 res!720419) b!1080819))

(assert (= (and b!1080819 res!720423) b!1080820))

(assert (= (and b!1080820 res!720422) b!1080816))

(assert (= (and b!1080816 res!720425) b!1080822))

(assert (= (and b!1080822 res!720424) b!1080821))

(assert (= (and b!1080821 res!720420) b!1080827))

(assert (= (and b!1080827 res!720418) b!1080824))

(assert (= (and b!1080826 condMapEmpty!41212) mapIsEmpty!41212))

(assert (= (and b!1080826 (not condMapEmpty!41212)) mapNonEmpty!41212))

(get-info :version)

(assert (= (and mapNonEmpty!41212 ((_ is ValueCellFull!12443) mapValue!41212)) b!1080817))

(assert (= (and b!1080826 ((_ is ValueCellFull!12443) mapDefault!41212)) b!1080823))

(assert (= start!95644 b!1080826))

(declare-fun b_lambda!16951 () Bool)

(assert (=> (not b_lambda!16951) (not b!1080824)))

(declare-fun t!32714 () Bool)

(declare-fun tb!7173 () Bool)

(assert (=> (and start!95644 (= defaultEntry!882 defaultEntry!882) t!32714) tb!7173))

(declare-fun result!14873 () Bool)

(assert (=> tb!7173 (= result!14873 tp_is_empty!26305)))

(assert (=> b!1080824 t!32714))

(declare-fun b_and!35257 () Bool)

(assert (= b_and!35255 (and (=> t!32714 result!14873) b_and!35257)))

(declare-fun m!998183 () Bool)

(assert (=> start!95644 m!998183))

(declare-fun m!998185 () Bool)

(assert (=> start!95644 m!998185))

(declare-fun m!998187 () Bool)

(assert (=> start!95644 m!998187))

(declare-fun m!998189 () Bool)

(assert (=> b!1080821 m!998189))

(declare-fun m!998191 () Bool)

(assert (=> b!1080821 m!998191))

(declare-fun m!998193 () Bool)

(assert (=> b!1080825 m!998193))

(declare-fun m!998195 () Bool)

(assert (=> mapNonEmpty!41212 m!998195))

(declare-fun m!998197 () Bool)

(assert (=> b!1080816 m!998197))

(declare-fun m!998199 () Bool)

(assert (=> b!1080822 m!998199))

(declare-fun m!998201 () Bool)

(assert (=> b!1080819 m!998201))

(declare-fun m!998203 () Bool)

(assert (=> b!1080824 m!998203))

(declare-fun m!998205 () Bool)

(assert (=> b!1080824 m!998205))

(declare-fun m!998207 () Bool)

(assert (=> b!1080824 m!998207))

(declare-fun m!998209 () Bool)

(assert (=> b!1080824 m!998209))

(declare-fun m!998211 () Bool)

(assert (=> b!1080824 m!998211))

(declare-fun m!998213 () Bool)

(assert (=> b!1080824 m!998213))

(declare-fun m!998215 () Bool)

(assert (=> b!1080827 m!998215))

(check-sat (not mapNonEmpty!41212) (not b_next!22303) b_and!35257 (not b_lambda!16951) (not b!1080825) (not b!1080821) (not b!1080819) (not b!1080816) (not b!1080827) (not b!1080824) tp_is_empty!26305 (not start!95644))
(check-sat b_and!35257 (not b_next!22303))
