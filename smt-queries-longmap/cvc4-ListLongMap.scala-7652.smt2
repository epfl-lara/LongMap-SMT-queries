; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96236 () Bool)

(assert start!96236)

(declare-fun b_free!22889 () Bool)

(declare-fun b_next!22889 () Bool)

(assert (=> start!96236 (= b_free!22889 (not b_next!22889))))

(declare-fun tp!80516 () Bool)

(declare-fun b_and!36453 () Bool)

(assert (=> start!96236 (= tp!80516 b_and!36453)))

(declare-fun b!1093165 () Bool)

(declare-fun e!624213 () Bool)

(declare-fun tp_is_empty!26891 () Bool)

(assert (=> b!1093165 (= e!624213 tp_is_empty!26891)))

(declare-fun res!729464 () Bool)

(declare-fun e!624214 () Bool)

(assert (=> start!96236 (=> (not res!729464) (not e!624214))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96236 (= res!729464 (validMask!0 mask!1414))))

(assert (=> start!96236 e!624214))

(assert (=> start!96236 tp!80516))

(assert (=> start!96236 true))

(assert (=> start!96236 tp_is_empty!26891))

(declare-datatypes ((array!70701 0))(
  ( (array!70702 (arr!34024 (Array (_ BitVec 32) (_ BitVec 64))) (size!34560 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70701)

(declare-fun array_inv!26222 (array!70701) Bool)

(assert (=> start!96236 (array_inv!26222 _keys!1070)))

(declare-datatypes ((V!40981 0))(
  ( (V!40982 (val!13502 Int)) )
))
(declare-datatypes ((ValueCell!12736 0))(
  ( (ValueCellFull!12736 (v!16123 V!40981)) (EmptyCell!12736) )
))
(declare-datatypes ((array!70703 0))(
  ( (array!70704 (arr!34025 (Array (_ BitVec 32) ValueCell!12736)) (size!34561 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70703)

(declare-fun e!624217 () Bool)

(declare-fun array_inv!26223 (array!70703) Bool)

(assert (=> start!96236 (and (array_inv!26223 _values!874) e!624217)))

(declare-fun b!1093166 () Bool)

(declare-fun res!729460 () Bool)

(assert (=> b!1093166 (=> (not res!729460) (not e!624214))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093166 (= res!729460 (and (= (size!34561 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34560 _keys!1070) (size!34561 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42091 () Bool)

(declare-fun mapRes!42091 () Bool)

(assert (=> mapIsEmpty!42091 mapRes!42091))

(declare-fun b!1093167 () Bool)

(declare-fun res!729468 () Bool)

(declare-fun e!624216 () Bool)

(assert (=> b!1093167 (=> (not res!729468) (not e!624216))))

(declare-fun lt!488794 () array!70701)

(declare-datatypes ((List!23771 0))(
  ( (Nil!23768) (Cons!23767 (h!24976 (_ BitVec 64)) (t!33718 List!23771)) )
))
(declare-fun arrayNoDuplicates!0 (array!70701 (_ BitVec 32) List!23771) Bool)

(assert (=> b!1093167 (= res!729468 (arrayNoDuplicates!0 lt!488794 #b00000000000000000000000000000000 Nil!23768))))

(declare-fun b!1093168 () Bool)

(declare-fun res!729465 () Bool)

(assert (=> b!1093168 (=> (not res!729465) (not e!624214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70701 (_ BitVec 32)) Bool)

(assert (=> b!1093168 (= res!729465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093169 () Bool)

(declare-fun res!729463 () Bool)

(assert (=> b!1093169 (=> (not res!729463) (not e!624214))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093169 (= res!729463 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34560 _keys!1070))))))

(declare-fun b!1093170 () Bool)

(declare-fun res!729461 () Bool)

(assert (=> b!1093170 (=> (not res!729461) (not e!624214))))

(assert (=> b!1093170 (= res!729461 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23768))))

(declare-fun b!1093171 () Bool)

(assert (=> b!1093171 (= e!624214 e!624216)))

(declare-fun res!729466 () Bool)

(assert (=> b!1093171 (=> (not res!729466) (not e!624216))))

(assert (=> b!1093171 (= res!729466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488794 mask!1414))))

(assert (=> b!1093171 (= lt!488794 (array!70702 (store (arr!34024 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34560 _keys!1070)))))

(declare-fun b!1093172 () Bool)

(declare-fun e!624218 () Bool)

(assert (=> b!1093172 (= e!624218 tp_is_empty!26891)))

(declare-fun b!1093173 () Bool)

(assert (=> b!1093173 (= e!624217 (and e!624213 mapRes!42091))))

(declare-fun condMapEmpty!42091 () Bool)

(declare-fun mapDefault!42091 () ValueCell!12736)

