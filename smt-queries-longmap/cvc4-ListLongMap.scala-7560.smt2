; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95684 () Bool)

(assert start!95684)

(declare-fun b_free!22337 () Bool)

(declare-fun b_next!22337 () Bool)

(assert (=> start!95684 (= b_free!22337 (not b_next!22337))))

(declare-fun tp!78860 () Bool)

(declare-fun b_and!35349 () Bool)

(assert (=> start!95684 (= tp!78860 b_and!35349)))

(declare-fun b!1081615 () Bool)

(declare-fun res!720951 () Bool)

(declare-fun e!618211 () Bool)

(assert (=> b!1081615 (=> (not res!720951) (not e!618211))))

(declare-datatypes ((array!69625 0))(
  ( (array!69626 (arr!33486 (Array (_ BitVec 32) (_ BitVec 64))) (size!34022 (_ BitVec 32))) )
))
(declare-fun lt!479358 () array!69625)

(declare-datatypes ((List!23338 0))(
  ( (Nil!23335) (Cons!23334 (h!24543 (_ BitVec 64)) (t!32733 List!23338)) )
))
(declare-fun arrayNoDuplicates!0 (array!69625 (_ BitVec 32) List!23338) Bool)

(assert (=> b!1081615 (= res!720951 (arrayNoDuplicates!0 lt!479358 #b00000000000000000000000000000000 Nil!23335))))

(declare-fun b!1081616 () Bool)

(declare-fun res!720954 () Bool)

(declare-fun e!618212 () Bool)

(assert (=> b!1081616 (=> (not res!720954) (not e!618212))))

(declare-fun _keys!1070 () array!69625)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081616 (= res!720954 (= (select (arr!33486 _keys!1070) i!650) k!904))))

(declare-fun b!1081617 () Bool)

(declare-fun e!618213 () Bool)

(declare-fun e!618210 () Bool)

(declare-fun mapRes!41263 () Bool)

(assert (=> b!1081617 (= e!618213 (and e!618210 mapRes!41263))))

(declare-fun condMapEmpty!41263 () Bool)

(declare-datatypes ((V!40245 0))(
  ( (V!40246 (val!13226 Int)) )
))
(declare-datatypes ((ValueCell!12460 0))(
  ( (ValueCellFull!12460 (v!15847 V!40245)) (EmptyCell!12460) )
))
(declare-datatypes ((array!69627 0))(
  ( (array!69628 (arr!33487 (Array (_ BitVec 32) ValueCell!12460)) (size!34023 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69627)

(declare-fun mapDefault!41263 () ValueCell!12460)

