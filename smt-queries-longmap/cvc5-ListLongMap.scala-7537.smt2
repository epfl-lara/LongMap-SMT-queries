; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95542 () Bool)

(assert start!95542)

(declare-fun b!1079025 () Bool)

(declare-fun res!719031 () Bool)

(declare-fun e!616934 () Bool)

(assert (=> b!1079025 (=> (not res!719031) (not e!616934))))

(declare-datatypes ((array!69351 0))(
  ( (array!69352 (arr!33349 (Array (_ BitVec 32) (_ BitVec 64))) (size!33885 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69351)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69351 (_ BitVec 32)) Bool)

(assert (=> b!1079025 (= res!719031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079026 () Bool)

(declare-fun res!719033 () Bool)

(assert (=> b!1079026 (=> (not res!719033) (not e!616934))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079026 (= res!719033 (validKeyInArray!0 k!904))))

(declare-fun b!1079027 () Bool)

(declare-fun e!616933 () Bool)

(declare-fun e!616935 () Bool)

(declare-fun mapRes!41050 () Bool)

(assert (=> b!1079027 (= e!616933 (and e!616935 mapRes!41050))))

(declare-fun condMapEmpty!41050 () Bool)

(declare-datatypes ((V!40057 0))(
  ( (V!40058 (val!13155 Int)) )
))
(declare-datatypes ((ValueCell!12389 0))(
  ( (ValueCellFull!12389 (v!15776 V!40057)) (EmptyCell!12389) )
))
(declare-datatypes ((array!69353 0))(
  ( (array!69354 (arr!33350 (Array (_ BitVec 32) ValueCell!12389)) (size!33886 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69353)

(declare-fun mapDefault!41050 () ValueCell!12389)

