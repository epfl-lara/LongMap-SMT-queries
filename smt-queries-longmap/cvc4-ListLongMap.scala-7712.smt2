; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96884 () Bool)

(assert start!96884)

(declare-fun b_free!23201 () Bool)

(declare-fun b_next!23201 () Bool)

(assert (=> start!96884 (= b_free!23201 (not b_next!23201))))

(declare-fun tp!81559 () Bool)

(declare-fun b_and!37205 () Bool)

(assert (=> start!96884 (= tp!81559 b_and!37205)))

(declare-fun b!1102276 () Bool)

(declare-fun res!735505 () Bool)

(declare-fun e!629147 () Bool)

(assert (=> b!1102276 (=> (not res!735505) (not e!629147))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71423 0))(
  ( (array!71424 (arr!34373 (Array (_ BitVec 32) (_ BitVec 64))) (size!34909 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71423)

(assert (=> b!1102276 (= res!735505 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34909 _keys!1070))))))

(declare-fun b!1102277 () Bool)

(declare-fun res!735506 () Bool)

(assert (=> b!1102277 (=> (not res!735506) (not e!629147))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41461 0))(
  ( (V!41462 (val!13682 Int)) )
))
(declare-datatypes ((ValueCell!12916 0))(
  ( (ValueCellFull!12916 (v!16313 V!41461)) (EmptyCell!12916) )
))
(declare-datatypes ((array!71425 0))(
  ( (array!71426 (arr!34374 (Array (_ BitVec 32) ValueCell!12916)) (size!34910 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71425)

(assert (=> b!1102277 (= res!735506 (and (= (size!34910 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34909 _keys!1070) (size!34910 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42667 () Bool)

(declare-fun mapRes!42667 () Bool)

(assert (=> mapIsEmpty!42667 mapRes!42667))

(declare-fun b!1102278 () Bool)

(declare-fun res!735511 () Bool)

(declare-fun e!629148 () Bool)

(assert (=> b!1102278 (=> (not res!735511) (not e!629148))))

(declare-fun lt!494502 () array!71423)

(declare-datatypes ((List!24019 0))(
  ( (Nil!24016) (Cons!24015 (h!25224 (_ BitVec 64)) (t!34266 List!24019)) )
))
(declare-fun arrayNoDuplicates!0 (array!71423 (_ BitVec 32) List!24019) Bool)

(assert (=> b!1102278 (= res!735511 (arrayNoDuplicates!0 lt!494502 #b00000000000000000000000000000000 Nil!24016))))

(declare-fun b!1102279 () Bool)

(declare-fun res!735509 () Bool)

(assert (=> b!1102279 (=> (not res!735509) (not e!629147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71423 (_ BitVec 32)) Bool)

(assert (=> b!1102279 (= res!735509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102280 () Bool)

(declare-fun res!735504 () Bool)

(assert (=> b!1102280 (=> (not res!735504) (not e!629147))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1102280 (= res!735504 (= (select (arr!34373 _keys!1070) i!650) k!904))))

(declare-fun b!1102281 () Bool)

(declare-fun res!735503 () Bool)

(assert (=> b!1102281 (=> (not res!735503) (not e!629147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102281 (= res!735503 (validKeyInArray!0 k!904))))

(declare-fun b!1102282 () Bool)

(declare-fun e!629146 () Bool)

(declare-fun tp_is_empty!27251 () Bool)

(assert (=> b!1102282 (= e!629146 tp_is_empty!27251)))

(declare-fun b!1102283 () Bool)

(declare-fun e!629145 () Bool)

(declare-fun e!629149 () Bool)

(assert (=> b!1102283 (= e!629145 (and e!629149 mapRes!42667))))

(declare-fun condMapEmpty!42667 () Bool)

(declare-fun mapDefault!42667 () ValueCell!12916)

