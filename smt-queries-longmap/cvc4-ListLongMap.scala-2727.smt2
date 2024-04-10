; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40184 () Bool)

(assert start!40184)

(declare-fun b_free!10451 () Bool)

(declare-fun b_next!10451 () Bool)

(assert (=> start!40184 (= b_free!10451 (not b_next!10451))))

(declare-fun tp!36881 () Bool)

(declare-fun b_and!18419 () Bool)

(assert (=> start!40184 (= tp!36881 b_and!18419)))

(declare-fun b!440180 () Bool)

(declare-fun e!259382 () Bool)

(declare-fun tp_is_empty!11603 () Bool)

(assert (=> b!440180 (= e!259382 tp_is_empty!11603)))

(declare-fun b!440181 () Bool)

(declare-fun res!260287 () Bool)

(declare-fun e!259383 () Bool)

(assert (=> b!440181 (=> (not res!260287) (not e!259383))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440181 (= res!260287 (validKeyInArray!0 k!794))))

(declare-fun b!440182 () Bool)

(declare-fun e!259379 () Bool)

(declare-fun e!259381 () Bool)

(declare-fun mapRes!19026 () Bool)

(assert (=> b!440182 (= e!259379 (and e!259381 mapRes!19026))))

(declare-fun condMapEmpty!19026 () Bool)

(declare-datatypes ((V!16575 0))(
  ( (V!16576 (val!5846 Int)) )
))
(declare-datatypes ((ValueCell!5458 0))(
  ( (ValueCellFull!5458 (v!8093 V!16575)) (EmptyCell!5458) )
))
(declare-datatypes ((array!27021 0))(
  ( (array!27022 (arr!12960 (Array (_ BitVec 32) ValueCell!5458)) (size!13312 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27021)

(declare-fun mapDefault!19026 () ValueCell!5458)

