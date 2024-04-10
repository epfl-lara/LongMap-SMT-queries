; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96556 () Bool)

(assert start!96556)

(declare-fun b_free!23083 () Bool)

(declare-fun b_next!23083 () Bool)

(assert (=> start!96556 (= b_free!23083 (not b_next!23083))))

(declare-fun tp!81181 () Bool)

(declare-fun b_and!36857 () Bool)

(assert (=> start!96556 (= tp!81181 b_and!36857)))

(declare-fun b!1098106 () Bool)

(declare-fun e!626746 () Bool)

(declare-fun tp_is_empty!27133 () Bool)

(assert (=> b!1098106 (= e!626746 tp_is_empty!27133)))

(declare-fun b!1098107 () Bool)

(declare-fun res!732871 () Bool)

(declare-fun e!626741 () Bool)

(assert (=> b!1098107 (=> (not res!732871) (not e!626741))))

(declare-datatypes ((array!71177 0))(
  ( (array!71178 (arr!34258 (Array (_ BitVec 32) (_ BitVec 64))) (size!34794 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71177)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098107 (= res!732871 (= (select (arr!34258 _keys!1070) i!650) k!904))))

(declare-fun b!1098108 () Bool)

(declare-fun e!626747 () Bool)

(assert (=> b!1098108 (= e!626747 tp_is_empty!27133)))

(declare-datatypes ((V!41305 0))(
  ( (V!41306 (val!13623 Int)) )
))
(declare-datatypes ((tuple2!17302 0))(
  ( (tuple2!17303 (_1!8662 (_ BitVec 64)) (_2!8662 V!41305)) )
))
(declare-fun lt!491091 () tuple2!17302)

(declare-datatypes ((List!23923 0))(
  ( (Nil!23920) (Cons!23919 (h!25128 tuple2!17302) (t!34052 List!23923)) )
))
(declare-datatypes ((ListLongMap!15271 0))(
  ( (ListLongMap!15272 (toList!7651 List!23923)) )
))
(declare-fun lt!491094 () ListLongMap!15271)

(declare-fun lt!491097 () ListLongMap!15271)

(declare-fun e!626740 () Bool)

(declare-fun b!1098109 () Bool)

(declare-fun lt!491090 () tuple2!17302)

(declare-fun +!3360 (ListLongMap!15271 tuple2!17302) ListLongMap!15271)

(assert (=> b!1098109 (= e!626740 (= lt!491094 (+!3360 (+!3360 lt!491097 lt!491090) lt!491091)))))

(declare-fun b!1098111 () Bool)

(declare-fun e!626742 () Bool)

(declare-fun e!626745 () Bool)

(assert (=> b!1098111 (= e!626742 (not e!626745))))

(declare-fun res!732867 () Bool)

(assert (=> b!1098111 (=> res!732867 e!626745)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098111 (= res!732867 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!41305)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41305)

(declare-fun lt!491092 () ListLongMap!15271)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((ValueCell!12857 0))(
  ( (ValueCellFull!12857 (v!16246 V!41305)) (EmptyCell!12857) )
))
(declare-datatypes ((array!71179 0))(
  ( (array!71180 (arr!34259 (Array (_ BitVec 32) ValueCell!12857)) (size!34795 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71179)

(declare-fun getCurrentListMap!4371 (array!71177 array!71179 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) Int) ListLongMap!15271)

(assert (=> b!1098111 (= lt!491092 (getCurrentListMap!4371 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491096 () array!71177)

(declare-fun lt!491095 () array!71179)

(assert (=> b!1098111 (= lt!491094 (getCurrentListMap!4371 lt!491096 lt!491095 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491087 () ListLongMap!15271)

(assert (=> b!1098111 (and (= lt!491087 lt!491097) (= lt!491097 lt!491087))))

(declare-fun lt!491093 () ListLongMap!15271)

(declare-fun -!941 (ListLongMap!15271 (_ BitVec 64)) ListLongMap!15271)

(assert (=> b!1098111 (= lt!491097 (-!941 lt!491093 k!904))))

(declare-datatypes ((Unit!36118 0))(
  ( (Unit!36119) )
))
(declare-fun lt!491088 () Unit!36118)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!197 (array!71177 array!71179 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36118)

(assert (=> b!1098111 (= lt!491088 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!197 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4167 (array!71177 array!71179 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) Int) ListLongMap!15271)

(assert (=> b!1098111 (= lt!491087 (getCurrentListMapNoExtraKeys!4167 lt!491096 lt!491095 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2302 (Int (_ BitVec 64)) V!41305)

(assert (=> b!1098111 (= lt!491095 (array!71180 (store (arr!34259 _values!874) i!650 (ValueCellFull!12857 (dynLambda!2302 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34795 _values!874)))))

(assert (=> b!1098111 (= lt!491093 (getCurrentListMapNoExtraKeys!4167 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098111 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!491089 () Unit!36118)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71177 (_ BitVec 64) (_ BitVec 32)) Unit!36118)

(assert (=> b!1098111 (= lt!491089 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1098112 () Bool)

(declare-fun res!732864 () Bool)

(assert (=> b!1098112 (=> (not res!732864) (not e!626741))))

(assert (=> b!1098112 (= res!732864 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34794 _keys!1070))))))

(declare-fun b!1098113 () Bool)

(declare-fun res!732863 () Bool)

(assert (=> b!1098113 (=> (not res!732863) (not e!626741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71177 (_ BitVec 32)) Bool)

(assert (=> b!1098113 (= res!732863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098114 () Bool)

(declare-fun res!732872 () Bool)

(assert (=> b!1098114 (=> (not res!732872) (not e!626742))))

(declare-datatypes ((List!23924 0))(
  ( (Nil!23921) (Cons!23920 (h!25129 (_ BitVec 64)) (t!34053 List!23924)) )
))
(declare-fun arrayNoDuplicates!0 (array!71177 (_ BitVec 32) List!23924) Bool)

(assert (=> b!1098114 (= res!732872 (arrayNoDuplicates!0 lt!491096 #b00000000000000000000000000000000 Nil!23921))))

(declare-fun b!1098115 () Bool)

(assert (=> b!1098115 (= e!626741 e!626742)))

(declare-fun res!732862 () Bool)

(assert (=> b!1098115 (=> (not res!732862) (not e!626742))))

(assert (=> b!1098115 (= res!732862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491096 mask!1414))))

(assert (=> b!1098115 (= lt!491096 (array!71178 (store (arr!34258 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34794 _keys!1070)))))

(declare-fun mapNonEmpty!42466 () Bool)

(declare-fun mapRes!42466 () Bool)

(declare-fun tp!81182 () Bool)

(assert (=> mapNonEmpty!42466 (= mapRes!42466 (and tp!81182 e!626747))))

(declare-fun mapKey!42466 () (_ BitVec 32))

(declare-fun mapValue!42466 () ValueCell!12857)

(declare-fun mapRest!42466 () (Array (_ BitVec 32) ValueCell!12857))

(assert (=> mapNonEmpty!42466 (= (arr!34259 _values!874) (store mapRest!42466 mapKey!42466 mapValue!42466))))

(declare-fun b!1098116 () Bool)

(declare-fun res!732866 () Bool)

(assert (=> b!1098116 (=> (not res!732866) (not e!626741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098116 (= res!732866 (validKeyInArray!0 k!904))))

(declare-fun res!732873 () Bool)

(assert (=> start!96556 (=> (not res!732873) (not e!626741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96556 (= res!732873 (validMask!0 mask!1414))))

(assert (=> start!96556 e!626741))

(assert (=> start!96556 tp!81181))

(assert (=> start!96556 true))

(assert (=> start!96556 tp_is_empty!27133))

(declare-fun array_inv!26392 (array!71177) Bool)

(assert (=> start!96556 (array_inv!26392 _keys!1070)))

(declare-fun e!626744 () Bool)

(declare-fun array_inv!26393 (array!71179) Bool)

(assert (=> start!96556 (and (array_inv!26393 _values!874) e!626744)))

(declare-fun b!1098110 () Bool)

(declare-fun res!732870 () Bool)

(assert (=> b!1098110 (=> (not res!732870) (not e!626741))))

(assert (=> b!1098110 (= res!732870 (and (= (size!34795 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34794 _keys!1070) (size!34795 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098117 () Bool)

(declare-fun res!732868 () Bool)

(assert (=> b!1098117 (=> (not res!732868) (not e!626741))))

(assert (=> b!1098117 (= res!732868 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23921))))

(declare-fun b!1098118 () Bool)

(assert (=> b!1098118 (= e!626745 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904)))))

(assert (=> b!1098118 e!626740))

(declare-fun res!732865 () Bool)

(assert (=> b!1098118 (=> (not res!732865) (not e!626740))))

(assert (=> b!1098118 (= res!732865 (= lt!491094 (+!3360 (+!3360 lt!491087 lt!491090) lt!491091)))))

(assert (=> b!1098118 (= lt!491091 (tuple2!17303 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098118 (= lt!491090 (tuple2!17303 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapIsEmpty!42466 () Bool)

(assert (=> mapIsEmpty!42466 mapRes!42466))

(declare-fun b!1098119 () Bool)

(assert (=> b!1098119 (= e!626744 (and e!626746 mapRes!42466))))

(declare-fun condMapEmpty!42466 () Bool)

(declare-fun mapDefault!42466 () ValueCell!12857)

