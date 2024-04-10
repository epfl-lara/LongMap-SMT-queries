; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77554 () Bool)

(assert start!77554)

(declare-fun b_free!16139 () Bool)

(declare-fun b_next!16139 () Bool)

(assert (=> start!77554 (= b_free!16139 (not b_next!16139))))

(declare-fun tp!56678 () Bool)

(declare-fun b_and!26505 () Bool)

(assert (=> start!77554 (= tp!56678 b_and!26505)))

(declare-fun b!903593 () Bool)

(declare-fun res!609629 () Bool)

(declare-fun e!506293 () Bool)

(assert (=> b!903593 (=> (not res!609629) (not e!506293))))

(declare-datatypes ((array!53166 0))(
  ( (array!53167 (arr!25542 (Array (_ BitVec 32) (_ BitVec 64))) (size!26001 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53166)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53166 (_ BitVec 32)) Bool)

(assert (=> b!903593 (= res!609629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903594 () Bool)

(declare-fun e!506291 () Bool)

(declare-fun tp_is_empty!18557 () Bool)

(assert (=> b!903594 (= e!506291 tp_is_empty!18557)))

(declare-fun b!903595 () Bool)

(declare-fun e!506292 () Bool)

(declare-fun e!506294 () Bool)

(declare-fun mapRes!29548 () Bool)

(assert (=> b!903595 (= e!506292 (and e!506294 mapRes!29548))))

(declare-fun condMapEmpty!29548 () Bool)

(declare-datatypes ((V!29707 0))(
  ( (V!29708 (val!9329 Int)) )
))
(declare-datatypes ((ValueCell!8797 0))(
  ( (ValueCellFull!8797 (v!11834 V!29707)) (EmptyCell!8797) )
))
(declare-datatypes ((array!53168 0))(
  ( (array!53169 (arr!25543 (Array (_ BitVec 32) ValueCell!8797)) (size!26002 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53168)

(declare-fun mapDefault!29548 () ValueCell!8797)

