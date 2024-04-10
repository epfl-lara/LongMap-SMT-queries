; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96166 () Bool)

(assert start!96166)

(declare-fun b_free!22819 () Bool)

(declare-fun b_next!22819 () Bool)

(assert (=> start!96166 (= b_free!22819 (not b_next!22819))))

(declare-fun tp!80306 () Bool)

(declare-fun b_and!36313 () Bool)

(assert (=> start!96166 (= tp!80306 b_and!36313)))

(declare-fun mapIsEmpty!41986 () Bool)

(declare-fun mapRes!41986 () Bool)

(assert (=> mapIsEmpty!41986 mapRes!41986))

(declare-fun b!1091767 () Bool)

(declare-fun res!728447 () Bool)

(declare-fun e!623515 () Bool)

(assert (=> b!1091767 (=> (not res!728447) (not e!623515))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70561 0))(
  ( (array!70562 (arr!33954 (Array (_ BitVec 32) (_ BitVec 64))) (size!34490 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70561)

(declare-datatypes ((V!40889 0))(
  ( (V!40890 (val!13467 Int)) )
))
(declare-datatypes ((ValueCell!12701 0))(
  ( (ValueCellFull!12701 (v!16088 V!40889)) (EmptyCell!12701) )
))
(declare-datatypes ((array!70563 0))(
  ( (array!70564 (arr!33955 (Array (_ BitVec 32) ValueCell!12701)) (size!34491 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70563)

(assert (=> b!1091767 (= res!728447 (and (= (size!34491 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34490 _keys!1070) (size!34491 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091768 () Bool)

(declare-fun e!623517 () Bool)

(declare-fun tp_is_empty!26821 () Bool)

(assert (=> b!1091768 (= e!623517 tp_is_empty!26821)))

(declare-fun b!1091769 () Bool)

(declare-fun res!728450 () Bool)

(assert (=> b!1091769 (=> (not res!728450) (not e!623515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70561 (_ BitVec 32)) Bool)

(assert (=> b!1091769 (= res!728450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091770 () Bool)

(declare-fun res!728452 () Bool)

(assert (=> b!1091770 (=> (not res!728452) (not e!623515))))

(declare-datatypes ((List!23717 0))(
  ( (Nil!23714) (Cons!23713 (h!24922 (_ BitVec 64)) (t!33594 List!23717)) )
))
(declare-fun arrayNoDuplicates!0 (array!70561 (_ BitVec 32) List!23717) Bool)

(assert (=> b!1091770 (= res!728452 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23714))))

(declare-fun b!1091771 () Bool)

(declare-fun res!728456 () Bool)

(assert (=> b!1091771 (=> (not res!728456) (not e!623515))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091771 (= res!728456 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!41986 () Bool)

(declare-fun tp!80305 () Bool)

(assert (=> mapNonEmpty!41986 (= mapRes!41986 (and tp!80305 e!623517))))

(declare-fun mapRest!41986 () (Array (_ BitVec 32) ValueCell!12701))

(declare-fun mapValue!41986 () ValueCell!12701)

(declare-fun mapKey!41986 () (_ BitVec 32))

(assert (=> mapNonEmpty!41986 (= (arr!33955 _values!874) (store mapRest!41986 mapKey!41986 mapValue!41986))))

(declare-fun b!1091772 () Bool)

(declare-fun e!623522 () Bool)

(assert (=> b!1091772 (= e!623515 e!623522)))

(declare-fun res!728454 () Bool)

(assert (=> b!1091772 (=> (not res!728454) (not e!623522))))

(declare-fun lt!487723 () array!70561)

(assert (=> b!1091772 (= res!728454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487723 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091772 (= lt!487723 (array!70562 (store (arr!33954 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34490 _keys!1070)))))

(declare-fun b!1091773 () Bool)

(declare-fun res!728457 () Bool)

(assert (=> b!1091773 (=> (not res!728457) (not e!623515))))

(assert (=> b!1091773 (= res!728457 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34490 _keys!1070))))))

(declare-fun b!1091774 () Bool)

(declare-fun res!728448 () Bool)

(assert (=> b!1091774 (=> (not res!728448) (not e!623515))))

(assert (=> b!1091774 (= res!728448 (= (select (arr!33954 _keys!1070) i!650) k!904))))

(declare-fun b!1091775 () Bool)

(declare-fun e!623521 () Bool)

(declare-fun e!623518 () Bool)

(assert (=> b!1091775 (= e!623521 (and e!623518 mapRes!41986))))

(declare-fun condMapEmpty!41986 () Bool)

(declare-fun mapDefault!41986 () ValueCell!12701)

