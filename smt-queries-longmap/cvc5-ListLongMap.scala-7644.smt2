; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96184 () Bool)

(assert start!96184)

(declare-fun b_free!22837 () Bool)

(declare-fun b_next!22837 () Bool)

(assert (=> start!96184 (= b_free!22837 (not b_next!22837))))

(declare-fun tp!80360 () Bool)

(declare-fun b_and!36349 () Bool)

(assert (=> start!96184 (= tp!80360 b_and!36349)))

(declare-fun b!1092163 () Bool)

(declare-fun e!623738 () Bool)

(declare-fun tp_is_empty!26839 () Bool)

(assert (=> b!1092163 (= e!623738 tp_is_empty!26839)))

(declare-fun b!1092164 () Bool)

(declare-fun e!623731 () Bool)

(assert (=> b!1092164 (= e!623731 tp_is_empty!26839)))

(declare-fun b!1092165 () Bool)

(declare-fun e!623735 () Bool)

(declare-fun e!623732 () Bool)

(assert (=> b!1092165 (= e!623735 e!623732)))

(declare-fun res!728750 () Bool)

(assert (=> b!1092165 (=> (not res!728750) (not e!623732))))

(declare-datatypes ((array!70597 0))(
  ( (array!70598 (arr!33972 (Array (_ BitVec 32) (_ BitVec 64))) (size!34508 (_ BitVec 32))) )
))
(declare-fun lt!488072 () array!70597)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70597 (_ BitVec 32)) Bool)

(assert (=> b!1092165 (= res!728750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488072 mask!1414))))

(declare-fun _keys!1070 () array!70597)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092165 (= lt!488072 (array!70598 (store (arr!33972 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34508 _keys!1070)))))

(declare-fun b!1092166 () Bool)

(declare-fun res!728747 () Bool)

(assert (=> b!1092166 (=> (not res!728747) (not e!623735))))

(assert (=> b!1092166 (= res!728747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!728746 () Bool)

(assert (=> start!96184 (=> (not res!728746) (not e!623735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96184 (= res!728746 (validMask!0 mask!1414))))

(assert (=> start!96184 e!623735))

(assert (=> start!96184 tp!80360))

(assert (=> start!96184 true))

(assert (=> start!96184 tp_is_empty!26839))

(declare-fun array_inv!26192 (array!70597) Bool)

(assert (=> start!96184 (array_inv!26192 _keys!1070)))

(declare-datatypes ((V!40913 0))(
  ( (V!40914 (val!13476 Int)) )
))
(declare-datatypes ((ValueCell!12710 0))(
  ( (ValueCellFull!12710 (v!16097 V!40913)) (EmptyCell!12710) )
))
(declare-datatypes ((array!70599 0))(
  ( (array!70600 (arr!33973 (Array (_ BitVec 32) ValueCell!12710)) (size!34509 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70599)

(declare-fun e!623737 () Bool)

(declare-fun array_inv!26193 (array!70599) Bool)

(assert (=> start!96184 (and (array_inv!26193 _values!874) e!623737)))

(declare-fun b!1092167 () Bool)

(declare-fun mapRes!42013 () Bool)

(assert (=> b!1092167 (= e!623737 (and e!623731 mapRes!42013))))

(declare-fun condMapEmpty!42013 () Bool)

(declare-fun mapDefault!42013 () ValueCell!12710)

