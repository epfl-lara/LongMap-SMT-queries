; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95696 () Bool)

(assert start!95696)

(declare-fun b_free!22349 () Bool)

(declare-fun b_next!22349 () Bool)

(assert (=> start!95696 (= b_free!22349 (not b_next!22349))))

(declare-fun tp!78896 () Bool)

(declare-fun b_and!35373 () Bool)

(assert (=> start!95696 (= tp!78896 b_and!35373)))

(declare-fun b!1081843 () Bool)

(declare-fun res!721115 () Bool)

(declare-fun e!618320 () Bool)

(assert (=> b!1081843 (=> (not res!721115) (not e!618320))))

(declare-datatypes ((array!69649 0))(
  ( (array!69650 (arr!33498 (Array (_ BitVec 32) (_ BitVec 64))) (size!34034 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69649)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081843 (= res!721115 (= (select (arr!33498 _keys!1070) i!650) k!904))))

(declare-fun b!1081844 () Bool)

(declare-fun res!721114 () Bool)

(assert (=> b!1081844 (=> (not res!721114) (not e!618320))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69649 (_ BitVec 32)) Bool)

(assert (=> b!1081844 (= res!721114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081845 () Bool)

(declare-fun e!618322 () Bool)

(declare-fun tp_is_empty!26351 () Bool)

(assert (=> b!1081845 (= e!618322 tp_is_empty!26351)))

(declare-fun b!1081846 () Bool)

(declare-fun res!721110 () Bool)

(assert (=> b!1081846 (=> (not res!721110) (not e!618320))))

(declare-datatypes ((List!23346 0))(
  ( (Nil!23343) (Cons!23342 (h!24551 (_ BitVec 64)) (t!32753 List!23346)) )
))
(declare-fun arrayNoDuplicates!0 (array!69649 (_ BitVec 32) List!23346) Bool)

(assert (=> b!1081846 (= res!721110 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23343))))

(declare-fun b!1081847 () Bool)

(declare-fun e!618323 () Bool)

(assert (=> b!1081847 (= e!618323 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!479430 () array!69649)

(declare-datatypes ((V!40261 0))(
  ( (V!40262 (val!13232 Int)) )
))
(declare-datatypes ((ValueCell!12466 0))(
  ( (ValueCellFull!12466 (v!15853 V!40261)) (EmptyCell!12466) )
))
(declare-datatypes ((array!69651 0))(
  ( (array!69652 (arr!33499 (Array (_ BitVec 32) ValueCell!12466)) (size!34035 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69651)

(declare-fun minValue!831 () V!40261)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16766 0))(
  ( (tuple2!16767 (_1!8394 (_ BitVec 64)) (_2!8394 V!40261)) )
))
(declare-datatypes ((List!23347 0))(
  ( (Nil!23344) (Cons!23343 (h!24552 tuple2!16766) (t!32754 List!23347)) )
))
(declare-datatypes ((ListLongMap!14735 0))(
  ( (ListLongMap!14736 (toList!7383 List!23347)) )
))
(declare-fun lt!479429 () ListLongMap!14735)

(declare-fun zeroValue!831 () V!40261)

(declare-fun getCurrentListMapNoExtraKeys!3931 (array!69649 array!69651 (_ BitVec 32) (_ BitVec 32) V!40261 V!40261 (_ BitVec 32) Int) ListLongMap!14735)

(declare-fun dynLambda!2068 (Int (_ BitVec 64)) V!40261)

(assert (=> b!1081847 (= lt!479429 (getCurrentListMapNoExtraKeys!3931 lt!479430 (array!69652 (store (arr!33499 _values!874) i!650 (ValueCellFull!12466 (dynLambda!2068 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34035 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479431 () ListLongMap!14735)

(assert (=> b!1081847 (= lt!479431 (getCurrentListMapNoExtraKeys!3931 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081847 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35586 0))(
  ( (Unit!35587) )
))
(declare-fun lt!479428 () Unit!35586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69649 (_ BitVec 64) (_ BitVec 32)) Unit!35586)

(assert (=> b!1081847 (= lt!479428 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081848 () Bool)

(declare-fun res!721111 () Bool)

(assert (=> b!1081848 (=> (not res!721111) (not e!618320))))

(assert (=> b!1081848 (= res!721111 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34034 _keys!1070))))))

(declare-fun mapNonEmpty!41281 () Bool)

(declare-fun mapRes!41281 () Bool)

(declare-fun tp!78895 () Bool)

(assert (=> mapNonEmpty!41281 (= mapRes!41281 (and tp!78895 e!618322))))

(declare-fun mapRest!41281 () (Array (_ BitVec 32) ValueCell!12466))

(declare-fun mapValue!41281 () ValueCell!12466)

(declare-fun mapKey!41281 () (_ BitVec 32))

(assert (=> mapNonEmpty!41281 (= (arr!33499 _values!874) (store mapRest!41281 mapKey!41281 mapValue!41281))))

(declare-fun res!721113 () Bool)

(assert (=> start!95696 (=> (not res!721113) (not e!618320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95696 (= res!721113 (validMask!0 mask!1414))))

(assert (=> start!95696 e!618320))

(assert (=> start!95696 tp!78896))

(assert (=> start!95696 true))

(assert (=> start!95696 tp_is_empty!26351))

(declare-fun array_inv!25860 (array!69649) Bool)

(assert (=> start!95696 (array_inv!25860 _keys!1070)))

(declare-fun e!618321 () Bool)

(declare-fun array_inv!25861 (array!69651) Bool)

(assert (=> start!95696 (and (array_inv!25861 _values!874) e!618321)))

(declare-fun b!1081849 () Bool)

(declare-fun res!721109 () Bool)

(assert (=> b!1081849 (=> (not res!721109) (not e!618323))))

(assert (=> b!1081849 (= res!721109 (arrayNoDuplicates!0 lt!479430 #b00000000000000000000000000000000 Nil!23343))))

(declare-fun b!1081850 () Bool)

(declare-fun e!618318 () Bool)

(assert (=> b!1081850 (= e!618318 tp_is_empty!26351)))

(declare-fun b!1081851 () Bool)

(declare-fun res!721116 () Bool)

(assert (=> b!1081851 (=> (not res!721116) (not e!618320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081851 (= res!721116 (validKeyInArray!0 k!904))))

(declare-fun b!1081852 () Bool)

(declare-fun res!721108 () Bool)

(assert (=> b!1081852 (=> (not res!721108) (not e!618320))))

(assert (=> b!1081852 (= res!721108 (and (= (size!34035 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34034 _keys!1070) (size!34035 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081853 () Bool)

(assert (=> b!1081853 (= e!618321 (and e!618318 mapRes!41281))))

(declare-fun condMapEmpty!41281 () Bool)

(declare-fun mapDefault!41281 () ValueCell!12466)

