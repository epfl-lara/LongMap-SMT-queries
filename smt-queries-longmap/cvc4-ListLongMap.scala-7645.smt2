; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96194 () Bool)

(assert start!96194)

(declare-fun b_free!22847 () Bool)

(declare-fun b_next!22847 () Bool)

(assert (=> start!96194 (= b_free!22847 (not b_next!22847))))

(declare-fun tp!80390 () Bool)

(declare-fun b_and!36369 () Bool)

(assert (=> start!96194 (= tp!80390 b_and!36369)))

(declare-fun b!1092367 () Bool)

(declare-fun res!728893 () Bool)

(declare-fun e!623835 () Bool)

(assert (=> b!1092367 (=> (not res!728893) (not e!623835))))

(declare-datatypes ((array!70617 0))(
  ( (array!70618 (arr!33982 (Array (_ BitVec 32) (_ BitVec 64))) (size!34518 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70617)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092367 (= res!728893 (= (select (arr!33982 _keys!1070) i!650) k!904))))

(declare-fun b!1092368 () Bool)

(declare-fun e!623837 () Bool)

(assert (=> b!1092368 (= e!623835 e!623837)))

(declare-fun res!728898 () Bool)

(assert (=> b!1092368 (=> (not res!728898) (not e!623837))))

(declare-fun lt!488232 () array!70617)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70617 (_ BitVec 32)) Bool)

(assert (=> b!1092368 (= res!728898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488232 mask!1414))))

(assert (=> b!1092368 (= lt!488232 (array!70618 (store (arr!33982 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34518 _keys!1070)))))

(declare-fun b!1092369 () Bool)

(declare-fun res!728897 () Bool)

(assert (=> b!1092369 (=> (not res!728897) (not e!623835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092369 (= res!728897 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!42028 () Bool)

(declare-fun mapRes!42028 () Bool)

(declare-fun tp!80389 () Bool)

(declare-fun e!623838 () Bool)

(assert (=> mapNonEmpty!42028 (= mapRes!42028 (and tp!80389 e!623838))))

(declare-datatypes ((V!40925 0))(
  ( (V!40926 (val!13481 Int)) )
))
(declare-datatypes ((ValueCell!12715 0))(
  ( (ValueCellFull!12715 (v!16102 V!40925)) (EmptyCell!12715) )
))
(declare-fun mapValue!42028 () ValueCell!12715)

(declare-datatypes ((array!70619 0))(
  ( (array!70620 (arr!33983 (Array (_ BitVec 32) ValueCell!12715)) (size!34519 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70619)

(declare-fun mapKey!42028 () (_ BitVec 32))

(declare-fun mapRest!42028 () (Array (_ BitVec 32) ValueCell!12715))

(assert (=> mapNonEmpty!42028 (= (arr!33983 _values!874) (store mapRest!42028 mapKey!42028 mapValue!42028))))

(declare-fun b!1092370 () Bool)

(declare-fun res!728894 () Bool)

(assert (=> b!1092370 (=> (not res!728894) (not e!623835))))

(declare-datatypes ((List!23738 0))(
  ( (Nil!23735) (Cons!23734 (h!24943 (_ BitVec 64)) (t!33643 List!23738)) )
))
(declare-fun arrayNoDuplicates!0 (array!70617 (_ BitVec 32) List!23738) Bool)

(assert (=> b!1092370 (= res!728894 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23735))))

(declare-fun b!1092371 () Bool)

(declare-fun res!728895 () Bool)

(assert (=> b!1092371 (=> (not res!728895) (not e!623835))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092371 (= res!728895 (and (= (size!34519 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34518 _keys!1070) (size!34519 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092372 () Bool)

(declare-fun tp_is_empty!26849 () Bool)

(assert (=> b!1092372 (= e!623838 tp_is_empty!26849)))

(declare-fun b!1092373 () Bool)

(assert (=> b!1092373 (= e!623837 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40925)

(declare-datatypes ((tuple2!17154 0))(
  ( (tuple2!17155 (_1!8588 (_ BitVec 64)) (_2!8588 V!40925)) )
))
(declare-datatypes ((List!23739 0))(
  ( (Nil!23736) (Cons!23735 (h!24944 tuple2!17154) (t!33644 List!23739)) )
))
(declare-datatypes ((ListLongMap!15123 0))(
  ( (ListLongMap!15124 (toList!7577 List!23739)) )
))
(declare-fun lt!488231 () ListLongMap!15123)

(declare-fun zeroValue!831 () V!40925)

(declare-fun getCurrentListMap!4333 (array!70617 array!70619 (_ BitVec 32) (_ BitVec 32) V!40925 V!40925 (_ BitVec 32) Int) ListLongMap!15123)

(assert (=> b!1092373 (= lt!488231 (getCurrentListMap!4333 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488233 () array!70619)

(declare-fun lt!488225 () ListLongMap!15123)

(assert (=> b!1092373 (= lt!488225 (getCurrentListMap!4333 lt!488232 lt!488233 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488228 () ListLongMap!15123)

(declare-fun lt!488230 () ListLongMap!15123)

(assert (=> b!1092373 (and (= lt!488228 lt!488230) (= lt!488230 lt!488228))))

(declare-fun lt!488226 () ListLongMap!15123)

(declare-fun -!896 (ListLongMap!15123 (_ BitVec 64)) ListLongMap!15123)

(assert (=> b!1092373 (= lt!488230 (-!896 lt!488226 k!904))))

(declare-datatypes ((Unit!35958 0))(
  ( (Unit!35959) )
))
(declare-fun lt!488229 () Unit!35958)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!152 (array!70617 array!70619 (_ BitVec 32) (_ BitVec 32) V!40925 V!40925 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35958)

(assert (=> b!1092373 (= lt!488229 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!152 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4093 (array!70617 array!70619 (_ BitVec 32) (_ BitVec 32) V!40925 V!40925 (_ BitVec 32) Int) ListLongMap!15123)

(assert (=> b!1092373 (= lt!488228 (getCurrentListMapNoExtraKeys!4093 lt!488232 lt!488233 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2230 (Int (_ BitVec 64)) V!40925)

(assert (=> b!1092373 (= lt!488233 (array!70620 (store (arr!33983 _values!874) i!650 (ValueCellFull!12715 (dynLambda!2230 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34519 _values!874)))))

(assert (=> b!1092373 (= lt!488226 (getCurrentListMapNoExtraKeys!4093 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092373 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488227 () Unit!35958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70617 (_ BitVec 64) (_ BitVec 32)) Unit!35958)

(assert (=> b!1092373 (= lt!488227 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1092374 () Bool)

(declare-fun res!728896 () Bool)

(assert (=> b!1092374 (=> (not res!728896) (not e!623837))))

(assert (=> b!1092374 (= res!728896 (arrayNoDuplicates!0 lt!488232 #b00000000000000000000000000000000 Nil!23735))))

(declare-fun b!1092375 () Bool)

(declare-fun e!623840 () Bool)

(declare-fun e!623839 () Bool)

(assert (=> b!1092375 (= e!623840 (and e!623839 mapRes!42028))))

(declare-fun condMapEmpty!42028 () Bool)

(declare-fun mapDefault!42028 () ValueCell!12715)

