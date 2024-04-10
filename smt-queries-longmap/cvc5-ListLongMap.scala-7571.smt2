; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95746 () Bool)

(assert start!95746)

(declare-fun b_free!22399 () Bool)

(declare-fun b_next!22399 () Bool)

(assert (=> start!95746 (= b_free!22399 (not b_next!22399))))

(declare-fun tp!79045 () Bool)

(declare-fun b_and!35473 () Bool)

(assert (=> start!95746 (= tp!79045 b_and!35473)))

(declare-fun b!1082793 () Bool)

(declare-fun res!721786 () Bool)

(declare-fun e!618768 () Bool)

(assert (=> b!1082793 (=> (not res!721786) (not e!618768))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69747 0))(
  ( (array!69748 (arr!33547 (Array (_ BitVec 32) (_ BitVec 64))) (size!34083 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69747)

(declare-datatypes ((V!40329 0))(
  ( (V!40330 (val!13257 Int)) )
))
(declare-datatypes ((ValueCell!12491 0))(
  ( (ValueCellFull!12491 (v!15878 V!40329)) (EmptyCell!12491) )
))
(declare-datatypes ((array!69749 0))(
  ( (array!69750 (arr!33548 (Array (_ BitVec 32) ValueCell!12491)) (size!34084 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69749)

(assert (=> b!1082793 (= res!721786 (and (= (size!34084 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34083 _keys!1070) (size!34084 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082794 () Bool)

(declare-fun res!721784 () Bool)

(assert (=> b!1082794 (=> (not res!721784) (not e!618768))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082794 (= res!721784 (= (select (arr!33547 _keys!1070) i!650) k!904))))

(declare-fun b!1082795 () Bool)

(declare-fun res!721789 () Bool)

(assert (=> b!1082795 (=> (not res!721789) (not e!618768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082795 (= res!721789 (validKeyInArray!0 k!904))))

(declare-fun b!1082796 () Bool)

(declare-fun res!721791 () Bool)

(assert (=> b!1082796 (=> (not res!721791) (not e!618768))))

(declare-datatypes ((List!23384 0))(
  ( (Nil!23381) (Cons!23380 (h!24589 (_ BitVec 64)) (t!32841 List!23384)) )
))
(declare-fun arrayNoDuplicates!0 (array!69747 (_ BitVec 32) List!23384) Bool)

(assert (=> b!1082796 (= res!721791 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23381))))

(declare-fun b!1082797 () Bool)

(declare-fun e!618773 () Bool)

(assert (=> b!1082797 (= e!618768 e!618773)))

(declare-fun res!721788 () Bool)

(assert (=> b!1082797 (=> (not res!721788) (not e!618773))))

(declare-fun lt!479768 () array!69747)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69747 (_ BitVec 32)) Bool)

(assert (=> b!1082797 (= res!721788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479768 mask!1414))))

(assert (=> b!1082797 (= lt!479768 (array!69748 (store (arr!33547 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34083 _keys!1070)))))

(declare-fun b!1082798 () Bool)

(declare-fun e!618772 () Bool)

(declare-fun e!618769 () Bool)

(declare-fun mapRes!41356 () Bool)

(assert (=> b!1082798 (= e!618772 (and e!618769 mapRes!41356))))

(declare-fun condMapEmpty!41356 () Bool)

(declare-fun mapDefault!41356 () ValueCell!12491)

