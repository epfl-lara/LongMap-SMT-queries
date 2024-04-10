; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96922 () Bool)

(assert start!96922)

(declare-fun b_free!23215 () Bool)

(declare-fun b_next!23215 () Bool)

(assert (=> start!96922 (= b_free!23215 (not b_next!23215))))

(declare-fun tp!81604 () Bool)

(declare-fun b_and!37247 () Bool)

(assert (=> start!96922 (= tp!81604 b_and!37247)))

(declare-fun b!1102735 () Bool)

(declare-fun e!629400 () Bool)

(declare-fun e!629401 () Bool)

(assert (=> b!1102735 (= e!629400 (not e!629401))))

(declare-fun res!735777 () Bool)

(assert (=> b!1102735 (=> res!735777 e!629401)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!494838 () Bool)

(declare-datatypes ((V!41481 0))(
  ( (V!41482 (val!13689 Int)) )
))
(declare-datatypes ((tuple2!17412 0))(
  ( (tuple2!17413 (_1!8717 (_ BitVec 64)) (_2!8717 V!41481)) )
))
(declare-datatypes ((List!24029 0))(
  ( (Nil!24026) (Cons!24025 (h!25234 tuple2!17412) (t!34290 List!24029)) )
))
(declare-datatypes ((ListLongMap!15381 0))(
  ( (ListLongMap!15382 (toList!7706 List!24029)) )
))
(declare-fun lt!494840 () ListLongMap!15381)

(declare-fun lt!494839 () ListLongMap!15381)

(assert (=> b!1102735 (= res!735777 (or (and (not lt!494838) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494838) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494838) (not (= lt!494840 lt!494839))))))

(assert (=> b!1102735 (= lt!494838 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41481)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun lt!494842 () ListLongMap!15381)

(declare-fun zeroValue!831 () V!41481)

(declare-datatypes ((array!71451 0))(
  ( (array!71452 (arr!34386 (Array (_ BitVec 32) (_ BitVec 64))) (size!34922 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71451)

(declare-datatypes ((ValueCell!12923 0))(
  ( (ValueCellFull!12923 (v!16320 V!41481)) (EmptyCell!12923) )
))
(declare-datatypes ((array!71453 0))(
  ( (array!71454 (arr!34387 (Array (_ BitVec 32) ValueCell!12923)) (size!34923 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71453)

(declare-fun getCurrentListMap!4410 (array!71451 array!71453 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) Int) ListLongMap!15381)

(assert (=> b!1102735 (= lt!494842 (getCurrentListMap!4410 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494836 () array!71453)

(declare-fun lt!494837 () array!71451)

(assert (=> b!1102735 (= lt!494840 (getCurrentListMap!4410 lt!494837 lt!494836 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494835 () ListLongMap!15381)

(assert (=> b!1102735 (and (= lt!494839 lt!494835) (= lt!494835 lt!494839))))

(declare-fun lt!494841 () ListLongMap!15381)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!989 (ListLongMap!15381 (_ BitVec 64)) ListLongMap!15381)

(assert (=> b!1102735 (= lt!494835 (-!989 lt!494841 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36232 0))(
  ( (Unit!36233) )
))
(declare-fun lt!494844 () Unit!36232)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!236 (array!71451 array!71453 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36232)

(assert (=> b!1102735 (= lt!494844 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!236 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4206 (array!71451 array!71453 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) Int) ListLongMap!15381)

(assert (=> b!1102735 (= lt!494839 (getCurrentListMapNoExtraKeys!4206 lt!494837 lt!494836 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2341 (Int (_ BitVec 64)) V!41481)

(assert (=> b!1102735 (= lt!494836 (array!71454 (store (arr!34387 _values!874) i!650 (ValueCellFull!12923 (dynLambda!2341 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34923 _values!874)))))

(assert (=> b!1102735 (= lt!494841 (getCurrentListMapNoExtraKeys!4206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102735 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!494843 () Unit!36232)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71451 (_ BitVec 64) (_ BitVec 32)) Unit!36232)

(assert (=> b!1102735 (= lt!494843 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1102736 () Bool)

(declare-fun res!735775 () Bool)

(declare-fun e!629404 () Bool)

(assert (=> b!1102736 (=> (not res!735775) (not e!629404))))

(assert (=> b!1102736 (= res!735775 (= (select (arr!34386 _keys!1070) i!650) k!904))))

(declare-fun b!1102737 () Bool)

(declare-fun res!735776 () Bool)

(assert (=> b!1102737 (=> (not res!735776) (not e!629404))))

(assert (=> b!1102737 (= res!735776 (and (= (size!34923 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34922 _keys!1070) (size!34923 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102738 () Bool)

(declare-fun res!735778 () Bool)

(assert (=> b!1102738 (=> (not res!735778) (not e!629404))))

(assert (=> b!1102738 (= res!735778 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34922 _keys!1070))))))

(declare-fun b!1102739 () Bool)

(declare-fun res!735782 () Bool)

(assert (=> b!1102739 (=> (not res!735782) (not e!629404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71451 (_ BitVec 32)) Bool)

(assert (=> b!1102739 (= res!735782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102740 () Bool)

(declare-fun res!735781 () Bool)

(assert (=> b!1102740 (=> (not res!735781) (not e!629404))))

(declare-datatypes ((List!24030 0))(
  ( (Nil!24027) (Cons!24026 (h!25235 (_ BitVec 64)) (t!34291 List!24030)) )
))
(declare-fun arrayNoDuplicates!0 (array!71451 (_ BitVec 32) List!24030) Bool)

(assert (=> b!1102740 (= res!735781 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24027))))

(declare-fun b!1102741 () Bool)

(declare-fun e!629398 () Bool)

(declare-fun e!629402 () Bool)

(declare-fun mapRes!42691 () Bool)

(assert (=> b!1102741 (= e!629398 (and e!629402 mapRes!42691))))

(declare-fun condMapEmpty!42691 () Bool)

(declare-fun mapDefault!42691 () ValueCell!12923)

