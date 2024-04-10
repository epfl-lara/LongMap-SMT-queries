; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95998 () Bool)

(assert start!95998)

(declare-fun b_free!22651 () Bool)

(declare-fun b_next!22651 () Bool)

(assert (=> start!95998 (= b_free!22651 (not b_next!22651))))

(declare-fun tp!79802 () Bool)

(declare-fun b_and!35977 () Bool)

(assert (=> start!95998 (= tp!79802 b_and!35977)))

(declare-fun res!725676 () Bool)

(declare-fun e!621500 () Bool)

(assert (=> start!95998 (=> (not res!725676) (not e!621500))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95998 (= res!725676 (validMask!0 mask!1414))))

(assert (=> start!95998 e!621500))

(assert (=> start!95998 tp!79802))

(assert (=> start!95998 true))

(declare-fun tp_is_empty!26653 () Bool)

(assert (=> start!95998 tp_is_empty!26653))

(declare-datatypes ((array!70231 0))(
  ( (array!70232 (arr!33789 (Array (_ BitVec 32) (_ BitVec 64))) (size!34325 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70231)

(declare-fun array_inv!26060 (array!70231) Bool)

(assert (=> start!95998 (array_inv!26060 _keys!1070)))

(declare-datatypes ((V!40665 0))(
  ( (V!40666 (val!13383 Int)) )
))
(declare-datatypes ((ValueCell!12617 0))(
  ( (ValueCellFull!12617 (v!16004 V!40665)) (EmptyCell!12617) )
))
(declare-datatypes ((array!70233 0))(
  ( (array!70234 (arr!33790 (Array (_ BitVec 32) ValueCell!12617)) (size!34326 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70233)

(declare-fun e!621503 () Bool)

(declare-fun array_inv!26061 (array!70233) Bool)

(assert (=> start!95998 (and (array_inv!26061 _values!874) e!621503)))

(declare-fun b!1088062 () Bool)

(declare-fun e!621506 () Bool)

(assert (=> b!1088062 (= e!621506 tp_is_empty!26653)))

(declare-fun b!1088063 () Bool)

(declare-fun e!621501 () Bool)

(assert (=> b!1088063 (= e!621500 e!621501)))

(declare-fun res!725666 () Bool)

(assert (=> b!1088063 (=> (not res!725666) (not e!621501))))

(declare-fun lt!484465 () array!70231)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70231 (_ BitVec 32)) Bool)

(assert (=> b!1088063 (= res!725666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484465 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088063 (= lt!484465 (array!70232 (store (arr!33789 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34325 _keys!1070)))))

(declare-fun b!1088064 () Bool)

(declare-fun res!725674 () Bool)

(assert (=> b!1088064 (=> (not res!725674) (not e!621500))))

(assert (=> b!1088064 (= res!725674 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34325 _keys!1070))))))

(declare-fun b!1088065 () Bool)

(declare-fun res!725675 () Bool)

(assert (=> b!1088065 (=> (not res!725675) (not e!621500))))

(declare-datatypes ((List!23573 0))(
  ( (Nil!23570) (Cons!23569 (h!24778 (_ BitVec 64)) (t!33282 List!23573)) )
))
(declare-fun arrayNoDuplicates!0 (array!70231 (_ BitVec 32) List!23573) Bool)

(assert (=> b!1088065 (= res!725675 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23570))))

(declare-fun b!1088066 () Bool)

(declare-fun res!725671 () Bool)

(assert (=> b!1088066 (=> (not res!725671) (not e!621500))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088066 (= res!725671 (validKeyInArray!0 k!904))))

(declare-fun b!1088067 () Bool)

(declare-fun e!621502 () Bool)

(declare-fun mapRes!41734 () Bool)

(assert (=> b!1088067 (= e!621503 (and e!621502 mapRes!41734))))

(declare-fun condMapEmpty!41734 () Bool)

(declare-fun mapDefault!41734 () ValueCell!12617)

