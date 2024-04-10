; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95896 () Bool)

(assert start!95896)

(declare-fun b_free!22549 () Bool)

(declare-fun b_next!22549 () Bool)

(assert (=> start!95896 (= b_free!22549 (not b_next!22549))))

(declare-fun tp!79496 () Bool)

(declare-fun b_and!35773 () Bool)

(assert (=> start!95896 (= tp!79496 b_and!35773)))

(declare-fun b!1085809 () Bool)

(declare-fun e!620278 () Bool)

(declare-fun e!620277 () Bool)

(assert (=> b!1085809 (= e!620278 e!620277)))

(declare-fun res!723976 () Bool)

(assert (=> b!1085809 (=> (not res!723976) (not e!620277))))

(declare-datatypes ((array!70037 0))(
  ( (array!70038 (arr!33692 (Array (_ BitVec 32) (_ BitVec 64))) (size!34228 (_ BitVec 32))) )
))
(declare-fun lt!482125 () array!70037)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70037 (_ BitVec 32)) Bool)

(assert (=> b!1085809 (= res!723976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482125 mask!1414))))

(declare-fun _keys!1070 () array!70037)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085809 (= lt!482125 (array!70038 (store (arr!33692 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34228 _keys!1070)))))

(declare-fun b!1085811 () Bool)

(declare-fun e!620282 () Bool)

(declare-fun e!620279 () Bool)

(declare-fun mapRes!41581 () Bool)

(assert (=> b!1085811 (= e!620282 (and e!620279 mapRes!41581))))

(declare-fun condMapEmpty!41581 () Bool)

(declare-datatypes ((V!40529 0))(
  ( (V!40530 (val!13332 Int)) )
))
(declare-datatypes ((ValueCell!12566 0))(
  ( (ValueCellFull!12566 (v!15953 V!40529)) (EmptyCell!12566) )
))
(declare-datatypes ((array!70039 0))(
  ( (array!70040 (arr!33693 (Array (_ BitVec 32) ValueCell!12566)) (size!34229 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70039)

(declare-fun mapDefault!41581 () ValueCell!12566)

