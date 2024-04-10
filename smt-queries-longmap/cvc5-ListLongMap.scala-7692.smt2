; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96550 () Bool)

(assert start!96550)

(declare-fun b_free!23077 () Bool)

(declare-fun b_next!23077 () Bool)

(assert (=> start!96550 (= b_free!23077 (not b_next!23077))))

(declare-fun tp!81164 () Bool)

(declare-fun b_and!36845 () Bool)

(assert (=> start!96550 (= tp!81164 b_and!36845)))

(declare-fun b!1097972 () Bool)

(declare-fun res!732770 () Bool)

(declare-fun e!626673 () Bool)

(assert (=> b!1097972 (=> (not res!732770) (not e!626673))))

(declare-datatypes ((array!71167 0))(
  ( (array!71168 (arr!34253 (Array (_ BitVec 32) (_ BitVec 64))) (size!34789 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71167)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097972 (= res!732770 (= (select (arr!34253 _keys!1070) i!650) k!904))))

(declare-fun b!1097973 () Bool)

(declare-fun res!732764 () Bool)

(declare-fun e!626674 () Bool)

(assert (=> b!1097973 (=> (not res!732764) (not e!626674))))

(declare-fun lt!490991 () array!71167)

(declare-datatypes ((List!23919 0))(
  ( (Nil!23916) (Cons!23915 (h!25124 (_ BitVec 64)) (t!34042 List!23919)) )
))
(declare-fun arrayNoDuplicates!0 (array!71167 (_ BitVec 32) List!23919) Bool)

(assert (=> b!1097973 (= res!732764 (arrayNoDuplicates!0 lt!490991 #b00000000000000000000000000000000 Nil!23916))))

(declare-fun b!1097974 () Bool)

(declare-fun e!626670 () Bool)

(declare-fun tp_is_empty!27127 () Bool)

(assert (=> b!1097974 (= e!626670 tp_is_empty!27127)))

(declare-fun mapIsEmpty!42457 () Bool)

(declare-fun mapRes!42457 () Bool)

(assert (=> mapIsEmpty!42457 mapRes!42457))

(declare-datatypes ((V!41297 0))(
  ( (V!41298 (val!13620 Int)) )
))
(declare-datatypes ((tuple2!17298 0))(
  ( (tuple2!17299 (_1!8660 (_ BitVec 64)) (_2!8660 V!41297)) )
))
(declare-fun lt!490996 () tuple2!17298)

(declare-fun b!1097975 () Bool)

(declare-datatypes ((List!23920 0))(
  ( (Nil!23917) (Cons!23916 (h!25125 tuple2!17298) (t!34043 List!23920)) )
))
(declare-datatypes ((ListLongMap!15267 0))(
  ( (ListLongMap!15268 (toList!7649 List!23920)) )
))
(declare-fun lt!490997 () ListLongMap!15267)

(declare-fun lt!490989 () tuple2!17298)

(declare-fun e!626672 () Bool)

(declare-fun lt!490998 () ListLongMap!15267)

(declare-fun +!3358 (ListLongMap!15267 tuple2!17298) ListLongMap!15267)

(assert (=> b!1097975 (= e!626672 (= lt!490997 (+!3358 (+!3358 lt!490998 lt!490996) lt!490989)))))

(declare-fun res!732768 () Bool)

(assert (=> start!96550 (=> (not res!732768) (not e!626673))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96550 (= res!732768 (validMask!0 mask!1414))))

(assert (=> start!96550 e!626673))

(assert (=> start!96550 tp!81164))

(assert (=> start!96550 true))

(assert (=> start!96550 tp_is_empty!27127))

(declare-fun array_inv!26388 (array!71167) Bool)

(assert (=> start!96550 (array_inv!26388 _keys!1070)))

(declare-datatypes ((ValueCell!12854 0))(
  ( (ValueCellFull!12854 (v!16243 V!41297)) (EmptyCell!12854) )
))
(declare-datatypes ((array!71169 0))(
  ( (array!71170 (arr!34254 (Array (_ BitVec 32) ValueCell!12854)) (size!34790 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71169)

(declare-fun e!626668 () Bool)

(declare-fun array_inv!26389 (array!71169) Bool)

(assert (=> start!96550 (and (array_inv!26389 _values!874) e!626668)))

(declare-fun b!1097976 () Bool)

(declare-fun res!732767 () Bool)

(assert (=> b!1097976 (=> (not res!732767) (not e!626673))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097976 (= res!732767 (and (= (size!34790 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34789 _keys!1070) (size!34790 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097977 () Bool)

(assert (=> b!1097977 (= e!626673 e!626674)))

(declare-fun res!732769 () Bool)

(assert (=> b!1097977 (=> (not res!732769) (not e!626674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71167 (_ BitVec 32)) Bool)

(assert (=> b!1097977 (= res!732769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490991 mask!1414))))

(assert (=> b!1097977 (= lt!490991 (array!71168 (store (arr!34253 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34789 _keys!1070)))))

(declare-fun lt!490993 () ListLongMap!15267)

(declare-fun b!1097978 () Bool)

(declare-fun e!626675 () Bool)

(declare-fun lt!490995 () ListLongMap!15267)

(assert (=> b!1097978 (= e!626675 (= lt!490993 (+!3358 (+!3358 lt!490995 lt!490996) lt!490989)))))

(assert (=> b!1097978 e!626672))

(declare-fun res!732763 () Bool)

(assert (=> b!1097978 (=> (not res!732763) (not e!626672))))

(declare-fun lt!490994 () ListLongMap!15267)

(assert (=> b!1097978 (= res!732763 (= lt!490993 (+!3358 (+!3358 lt!490994 lt!490996) lt!490989)))))

(declare-fun minValue!831 () V!41297)

(assert (=> b!1097978 (= lt!490989 (tuple2!17299 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!41297)

(assert (=> b!1097978 (= lt!490996 (tuple2!17299 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1097979 () Bool)

(assert (=> b!1097979 (= e!626674 (not e!626675))))

(declare-fun res!732766 () Bool)

(assert (=> b!1097979 (=> res!732766 e!626675)))

(assert (=> b!1097979 (= res!732766 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4369 (array!71167 array!71169 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) Int) ListLongMap!15267)

(assert (=> b!1097979 (= lt!490997 (getCurrentListMap!4369 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490992 () array!71169)

(assert (=> b!1097979 (= lt!490993 (getCurrentListMap!4369 lt!490991 lt!490992 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097979 (and (= lt!490994 lt!490995) (= lt!490995 lt!490994))))

(declare-fun -!939 (ListLongMap!15267 (_ BitVec 64)) ListLongMap!15267)

(assert (=> b!1097979 (= lt!490995 (-!939 lt!490998 k!904))))

(declare-datatypes ((Unit!36114 0))(
  ( (Unit!36115) )
))
(declare-fun lt!490990 () Unit!36114)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!195 (array!71167 array!71169 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36114)

(assert (=> b!1097979 (= lt!490990 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!195 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4165 (array!71167 array!71169 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) Int) ListLongMap!15267)

(assert (=> b!1097979 (= lt!490994 (getCurrentListMapNoExtraKeys!4165 lt!490991 lt!490992 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2300 (Int (_ BitVec 64)) V!41297)

(assert (=> b!1097979 (= lt!490992 (array!71170 (store (arr!34254 _values!874) i!650 (ValueCellFull!12854 (dynLambda!2300 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34790 _values!874)))))

(assert (=> b!1097979 (= lt!490998 (getCurrentListMapNoExtraKeys!4165 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097979 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!490988 () Unit!36114)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71167 (_ BitVec 64) (_ BitVec 32)) Unit!36114)

(assert (=> b!1097979 (= lt!490988 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1097980 () Bool)

(assert (=> b!1097980 (= e!626668 (and e!626670 mapRes!42457))))

(declare-fun condMapEmpty!42457 () Bool)

(declare-fun mapDefault!42457 () ValueCell!12854)

