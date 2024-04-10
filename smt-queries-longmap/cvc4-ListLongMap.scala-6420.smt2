; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82320 () Bool)

(assert start!82320)

(declare-fun b_free!18587 () Bool)

(declare-fun b_next!18587 () Bool)

(assert (=> start!82320 (= b_free!18587 (not b_next!18587))))

(declare-fun tp!64730 () Bool)

(declare-fun b_and!30075 () Bool)

(assert (=> start!82320 (= tp!64730 b_and!30075)))

(declare-fun b!959747 () Bool)

(declare-fun res!642443 () Bool)

(declare-fun e!541017 () Bool)

(assert (=> b!959747 (=> (not res!642443) (not e!541017))))

(declare-datatypes ((array!58689 0))(
  ( (array!58690 (arr!28218 (Array (_ BitVec 32) (_ BitVec 64))) (size!28697 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58689)

(declare-datatypes ((List!19621 0))(
  ( (Nil!19618) (Cons!19617 (h!20779 (_ BitVec 64)) (t!27984 List!19621)) )
))
(declare-fun arrayNoDuplicates!0 (array!58689 (_ BitVec 32) List!19621) Bool)

(assert (=> b!959747 (= res!642443 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19618))))

(declare-fun b!959748 () Bool)

(declare-fun e!541020 () Bool)

(declare-fun tp_is_empty!21299 () Bool)

(assert (=> b!959748 (= e!541020 tp_is_empty!21299)))

(declare-fun b!959749 () Bool)

(declare-fun e!541016 () Bool)

(declare-fun mapRes!33928 () Bool)

(assert (=> b!959749 (= e!541016 (and e!541020 mapRes!33928))))

(declare-fun condMapEmpty!33928 () Bool)

(declare-datatypes ((V!33381 0))(
  ( (V!33382 (val!10700 Int)) )
))
(declare-datatypes ((ValueCell!10168 0))(
  ( (ValueCellFull!10168 (v!13257 V!33381)) (EmptyCell!10168) )
))
(declare-datatypes ((array!58691 0))(
  ( (array!58692 (arr!28219 (Array (_ BitVec 32) ValueCell!10168)) (size!28698 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58691)

(declare-fun mapDefault!33928 () ValueCell!10168)

