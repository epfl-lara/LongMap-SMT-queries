; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97442 () Bool)

(assert start!97442)

(declare-fun b_free!23413 () Bool)

(declare-fun b_next!23413 () Bool)

(assert (=> start!97442 (= b_free!23413 (not b_next!23413))))

(declare-fun tp!82538 () Bool)

(declare-fun b_and!37663 () Bool)

(assert (=> start!97442 (= tp!82538 b_and!37663)))

(declare-fun b!1111731 () Bool)

(declare-fun e!633915 () Bool)

(declare-fun tp_is_empty!27673 () Bool)

(assert (=> b!1111731 (= e!633915 tp_is_empty!27673)))

(declare-fun mapIsEmpty!43327 () Bool)

(declare-fun mapRes!43327 () Bool)

(assert (=> mapIsEmpty!43327 mapRes!43327))

(declare-fun b!1111732 () Bool)

(declare-fun e!633913 () Bool)

(declare-fun e!633909 () Bool)

(assert (=> b!1111732 (= e!633913 (and e!633909 mapRes!43327))))

(declare-fun condMapEmpty!43327 () Bool)

(declare-datatypes ((V!42025 0))(
  ( (V!42026 (val!13893 Int)) )
))
(declare-datatypes ((ValueCell!13127 0))(
  ( (ValueCellFull!13127 (v!16526 V!42025)) (EmptyCell!13127) )
))
(declare-datatypes ((array!72263 0))(
  ( (array!72264 (arr!34784 (Array (_ BitVec 32) ValueCell!13127)) (size!35320 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72263)

(declare-fun mapDefault!43327 () ValueCell!13127)

