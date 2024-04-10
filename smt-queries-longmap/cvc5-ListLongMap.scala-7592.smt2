; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95872 () Bool)

(assert start!95872)

(declare-fun b_free!22525 () Bool)

(declare-fun b_next!22525 () Bool)

(assert (=> start!95872 (= b_free!22525 (not b_next!22525))))

(declare-fun tp!79424 () Bool)

(declare-fun b_and!35725 () Bool)

(assert (=> start!95872 (= tp!79424 b_and!35725)))

(declare-fun b!1085281 () Bool)

(declare-fun res!723582 () Bool)

(declare-fun e!619992 () Bool)

(assert (=> b!1085281 (=> (not res!723582) (not e!619992))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69989 0))(
  ( (array!69990 (arr!33668 (Array (_ BitVec 32) (_ BitVec 64))) (size!34204 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69989)

(assert (=> b!1085281 (= res!723582 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34204 _keys!1070))))))

(declare-fun b!1085282 () Bool)

(declare-fun e!619993 () Bool)

(declare-fun e!619987 () Bool)

(declare-fun mapRes!41545 () Bool)

(assert (=> b!1085282 (= e!619993 (and e!619987 mapRes!41545))))

(declare-fun condMapEmpty!41545 () Bool)

(declare-datatypes ((V!40497 0))(
  ( (V!40498 (val!13320 Int)) )
))
(declare-datatypes ((ValueCell!12554 0))(
  ( (ValueCellFull!12554 (v!15941 V!40497)) (EmptyCell!12554) )
))
(declare-datatypes ((array!69991 0))(
  ( (array!69992 (arr!33669 (Array (_ BitVec 32) ValueCell!12554)) (size!34205 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69991)

(declare-fun mapDefault!41545 () ValueCell!12554)

