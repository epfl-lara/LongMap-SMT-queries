; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95692 () Bool)

(assert start!95692)

(declare-fun b_free!22345 () Bool)

(declare-fun b_next!22345 () Bool)

(assert (=> start!95692 (= b_free!22345 (not b_next!22345))))

(declare-fun tp!78883 () Bool)

(declare-fun b_and!35365 () Bool)

(assert (=> start!95692 (= tp!78883 b_and!35365)))

(declare-fun b!1081767 () Bool)

(declare-fun res!721061 () Bool)

(declare-fun e!618282 () Bool)

(assert (=> b!1081767 (=> (not res!721061) (not e!618282))))

(declare-datatypes ((array!69641 0))(
  ( (array!69642 (arr!33494 (Array (_ BitVec 32) (_ BitVec 64))) (size!34030 (_ BitVec 32))) )
))
(declare-fun lt!479405 () array!69641)

(declare-datatypes ((List!23343 0))(
  ( (Nil!23340) (Cons!23339 (h!24548 (_ BitVec 64)) (t!32746 List!23343)) )
))
(declare-fun arrayNoDuplicates!0 (array!69641 (_ BitVec 32) List!23343) Bool)

(assert (=> b!1081767 (= res!721061 (arrayNoDuplicates!0 lt!479405 #b00000000000000000000000000000000 Nil!23340))))

(declare-fun b!1081768 () Bool)

(declare-fun res!721057 () Bool)

(declare-fun e!618284 () Bool)

(assert (=> b!1081768 (=> (not res!721057) (not e!618284))))

(declare-fun _keys!1070 () array!69641)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69641 (_ BitVec 32)) Bool)

(assert (=> b!1081768 (= res!721057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081769 () Bool)

(declare-fun res!721054 () Bool)

(assert (=> b!1081769 (=> (not res!721054) (not e!618284))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081769 (= res!721054 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34030 _keys!1070))))))

(declare-fun b!1081770 () Bool)

(assert (=> b!1081770 (= e!618284 e!618282)))

(declare-fun res!721059 () Bool)

(assert (=> b!1081770 (=> (not res!721059) (not e!618282))))

(assert (=> b!1081770 (= res!721059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479405 mask!1414))))

(assert (=> b!1081770 (= lt!479405 (array!69642 (store (arr!33494 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34030 _keys!1070)))))

(declare-fun b!1081772 () Bool)

(declare-fun res!721058 () Bool)

(assert (=> b!1081772 (=> (not res!721058) (not e!618284))))

(assert (=> b!1081772 (= res!721058 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23340))))

(declare-fun b!1081773 () Bool)

(declare-fun e!618283 () Bool)

(declare-fun e!618287 () Bool)

(declare-fun mapRes!41275 () Bool)

(assert (=> b!1081773 (= e!618283 (and e!618287 mapRes!41275))))

(declare-fun condMapEmpty!41275 () Bool)

(declare-datatypes ((V!40257 0))(
  ( (V!40258 (val!13230 Int)) )
))
(declare-datatypes ((ValueCell!12464 0))(
  ( (ValueCellFull!12464 (v!15851 V!40257)) (EmptyCell!12464) )
))
(declare-datatypes ((array!69643 0))(
  ( (array!69644 (arr!33495 (Array (_ BitVec 32) ValueCell!12464)) (size!34031 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69643)

(declare-fun mapDefault!41275 () ValueCell!12464)

