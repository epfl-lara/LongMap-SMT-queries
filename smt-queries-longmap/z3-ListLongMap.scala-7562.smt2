; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95928 () Bool)

(assert start!95928)

(declare-fun b_free!22345 () Bool)

(declare-fun b_next!22345 () Bool)

(assert (=> start!95928 (= b_free!22345 (not b_next!22345))))

(declare-fun tp!78884 () Bool)

(declare-fun b_and!35375 () Bool)

(assert (=> start!95928 (= tp!78884 b_and!35375)))

(declare-fun b!1083094 () Bool)

(declare-fun res!721579 () Bool)

(declare-fun e!619137 () Bool)

(assert (=> b!1083094 (=> (not res!721579) (not e!619137))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69677 0))(
  ( (array!69678 (arr!33506 (Array (_ BitVec 32) (_ BitVec 64))) (size!34043 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69677)

(assert (=> b!1083094 (= res!721579 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34043 _keys!1070))))))

(declare-fun b!1083095 () Bool)

(declare-fun e!619141 () Bool)

(declare-fun e!619138 () Bool)

(declare-fun mapRes!41275 () Bool)

(assert (=> b!1083095 (= e!619141 (and e!619138 mapRes!41275))))

(declare-fun condMapEmpty!41275 () Bool)

(declare-datatypes ((V!40257 0))(
  ( (V!40258 (val!13230 Int)) )
))
(declare-datatypes ((ValueCell!12464 0))(
  ( (ValueCellFull!12464 (v!15847 V!40257)) (EmptyCell!12464) )
))
(declare-datatypes ((array!69679 0))(
  ( (array!69680 (arr!33507 (Array (_ BitVec 32) ValueCell!12464)) (size!34044 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69679)

(declare-fun mapDefault!41275 () ValueCell!12464)

(assert (=> b!1083095 (= condMapEmpty!41275 (= (arr!33507 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12464)) mapDefault!41275)))))

(declare-fun mapNonEmpty!41275 () Bool)

(declare-fun tp!78883 () Bool)

(declare-fun e!619140 () Bool)

(assert (=> mapNonEmpty!41275 (= mapRes!41275 (and tp!78883 e!619140))))

(declare-fun mapValue!41275 () ValueCell!12464)

(declare-fun mapRest!41275 () (Array (_ BitVec 32) ValueCell!12464))

(declare-fun mapKey!41275 () (_ BitVec 32))

(assert (=> mapNonEmpty!41275 (= (arr!33507 _values!874) (store mapRest!41275 mapKey!41275 mapValue!41275))))

(declare-fun res!721580 () Bool)

(assert (=> start!95928 (=> (not res!721580) (not e!619137))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95928 (= res!721580 (validMask!0 mask!1414))))

(assert (=> start!95928 e!619137))

(assert (=> start!95928 tp!78884))

(assert (=> start!95928 true))

(declare-fun tp_is_empty!26347 () Bool)

(assert (=> start!95928 tp_is_empty!26347))

(declare-fun array_inv!25906 (array!69677) Bool)

(assert (=> start!95928 (array_inv!25906 _keys!1070)))

(declare-fun array_inv!25907 (array!69679) Bool)

(assert (=> start!95928 (and (array_inv!25907 _values!874) e!619141)))

(declare-fun b!1083096 () Bool)

(declare-fun res!721584 () Bool)

(assert (=> b!1083096 (=> (not res!721584) (not e!619137))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083096 (= res!721584 (validKeyInArray!0 k0!904))))

(declare-fun b!1083097 () Bool)

(declare-fun res!721576 () Bool)

(declare-fun e!619139 () Bool)

(assert (=> b!1083097 (=> (not res!721576) (not e!619139))))

(declare-fun lt!479920 () array!69677)

(declare-datatypes ((List!23353 0))(
  ( (Nil!23350) (Cons!23349 (h!24567 (_ BitVec 64)) (t!32748 List!23353)) )
))
(declare-fun arrayNoDuplicates!0 (array!69677 (_ BitVec 32) List!23353) Bool)

(assert (=> b!1083097 (= res!721576 (arrayNoDuplicates!0 lt!479920 #b00000000000000000000000000000000 Nil!23350))))

(declare-fun b!1083098 () Bool)

(declare-fun res!721581 () Bool)

(assert (=> b!1083098 (=> (not res!721581) (not e!619137))))

(assert (=> b!1083098 (= res!721581 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23350))))

(declare-fun mapIsEmpty!41275 () Bool)

(assert (=> mapIsEmpty!41275 mapRes!41275))

(declare-fun b!1083099 () Bool)

(assert (=> b!1083099 (= e!619137 e!619139)))

(declare-fun res!721578 () Bool)

(assert (=> b!1083099 (=> (not res!721578) (not e!619139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69677 (_ BitVec 32)) Bool)

(assert (=> b!1083099 (= res!721578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479920 mask!1414))))

(assert (=> b!1083099 (= lt!479920 (array!69678 (store (arr!33506 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34043 _keys!1070)))))

(declare-fun b!1083100 () Bool)

(declare-fun res!721583 () Bool)

(assert (=> b!1083100 (=> (not res!721583) (not e!619137))))

(assert (=> b!1083100 (= res!721583 (= (select (arr!33506 _keys!1070) i!650) k0!904))))

(declare-fun b!1083101 () Bool)

(assert (=> b!1083101 (= e!619138 tp_is_empty!26347)))

(declare-fun b!1083102 () Bool)

(declare-fun res!721577 () Bool)

(assert (=> b!1083102 (=> (not res!721577) (not e!619137))))

(assert (=> b!1083102 (= res!721577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083103 () Bool)

(declare-fun res!721582 () Bool)

(assert (=> b!1083103 (=> (not res!721582) (not e!619137))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1083103 (= res!721582 (and (= (size!34044 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34043 _keys!1070) (size!34044 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083104 () Bool)

(assert (=> b!1083104 (= e!619139 (not true))))

(declare-fun minValue!831 () V!40257)

(declare-fun zeroValue!831 () V!40257)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16764 0))(
  ( (tuple2!16765 (_1!8393 (_ BitVec 64)) (_2!8393 V!40257)) )
))
(declare-datatypes ((List!23354 0))(
  ( (Nil!23351) (Cons!23350 (h!24568 tuple2!16764) (t!32749 List!23354)) )
))
(declare-datatypes ((ListLongMap!14741 0))(
  ( (ListLongMap!14742 (toList!7386 List!23354)) )
))
(declare-fun lt!479921 () ListLongMap!14741)

(declare-fun getCurrentListMapNoExtraKeys!3963 (array!69677 array!69679 (_ BitVec 32) (_ BitVec 32) V!40257 V!40257 (_ BitVec 32) Int) ListLongMap!14741)

(declare-fun dynLambda!2084 (Int (_ BitVec 64)) V!40257)

(assert (=> b!1083104 (= lt!479921 (getCurrentListMapNoExtraKeys!3963 lt!479920 (array!69680 (store (arr!33507 _values!874) i!650 (ValueCellFull!12464 (dynLambda!2084 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34044 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479919 () ListLongMap!14741)

(assert (=> b!1083104 (= lt!479919 (getCurrentListMapNoExtraKeys!3963 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083104 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35563 0))(
  ( (Unit!35564) )
))
(declare-fun lt!479922 () Unit!35563)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69677 (_ BitVec 64) (_ BitVec 32)) Unit!35563)

(assert (=> b!1083104 (= lt!479922 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083105 () Bool)

(assert (=> b!1083105 (= e!619140 tp_is_empty!26347)))

(assert (= (and start!95928 res!721580) b!1083103))

(assert (= (and b!1083103 res!721582) b!1083102))

(assert (= (and b!1083102 res!721577) b!1083098))

(assert (= (and b!1083098 res!721581) b!1083094))

(assert (= (and b!1083094 res!721579) b!1083096))

(assert (= (and b!1083096 res!721584) b!1083100))

(assert (= (and b!1083100 res!721583) b!1083099))

(assert (= (and b!1083099 res!721578) b!1083097))

(assert (= (and b!1083097 res!721576) b!1083104))

(assert (= (and b!1083095 condMapEmpty!41275) mapIsEmpty!41275))

(assert (= (and b!1083095 (not condMapEmpty!41275)) mapNonEmpty!41275))

(get-info :version)

(assert (= (and mapNonEmpty!41275 ((_ is ValueCellFull!12464) mapValue!41275)) b!1083105))

(assert (= (and b!1083095 ((_ is ValueCellFull!12464) mapDefault!41275)) b!1083101))

(assert (= start!95928 b!1083095))

(declare-fun b_lambda!17025 () Bool)

(assert (=> (not b_lambda!17025) (not b!1083104)))

(declare-fun t!32747 () Bool)

(declare-fun tb!7215 () Bool)

(assert (=> (and start!95928 (= defaultEntry!882 defaultEntry!882) t!32747) tb!7215))

(declare-fun result!14957 () Bool)

(assert (=> tb!7215 (= result!14957 tp_is_empty!26347)))

(assert (=> b!1083104 t!32747))

(declare-fun b_and!35377 () Bool)

(assert (= b_and!35375 (and (=> t!32747 result!14957) b_and!35377)))

(declare-fun m!1001195 () Bool)

(assert (=> mapNonEmpty!41275 m!1001195))

(declare-fun m!1001197 () Bool)

(assert (=> b!1083099 m!1001197))

(declare-fun m!1001199 () Bool)

(assert (=> b!1083099 m!1001199))

(declare-fun m!1001201 () Bool)

(assert (=> b!1083097 m!1001201))

(declare-fun m!1001203 () Bool)

(assert (=> start!95928 m!1001203))

(declare-fun m!1001205 () Bool)

(assert (=> start!95928 m!1001205))

(declare-fun m!1001207 () Bool)

(assert (=> start!95928 m!1001207))

(declare-fun m!1001209 () Bool)

(assert (=> b!1083102 m!1001209))

(declare-fun m!1001211 () Bool)

(assert (=> b!1083100 m!1001211))

(declare-fun m!1001213 () Bool)

(assert (=> b!1083098 m!1001213))

(declare-fun m!1001215 () Bool)

(assert (=> b!1083096 m!1001215))

(declare-fun m!1001217 () Bool)

(assert (=> b!1083104 m!1001217))

(declare-fun m!1001219 () Bool)

(assert (=> b!1083104 m!1001219))

(declare-fun m!1001221 () Bool)

(assert (=> b!1083104 m!1001221))

(declare-fun m!1001223 () Bool)

(assert (=> b!1083104 m!1001223))

(declare-fun m!1001225 () Bool)

(assert (=> b!1083104 m!1001225))

(declare-fun m!1001227 () Bool)

(assert (=> b!1083104 m!1001227))

(check-sat (not mapNonEmpty!41275) tp_is_empty!26347 (not b_lambda!17025) (not b!1083104) (not b_next!22345) b_and!35377 (not b!1083096) (not b!1083098) (not b!1083097) (not start!95928) (not b!1083099) (not b!1083102))
(check-sat b_and!35377 (not b_next!22345))
