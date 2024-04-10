; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40490 () Bool)

(assert start!40490)

(declare-fun b_free!10561 () Bool)

(declare-fun b_next!10561 () Bool)

(assert (=> start!40490 (= b_free!10561 (not b_next!10561))))

(declare-fun tp!37461 () Bool)

(declare-fun b_and!18545 () Bool)

(assert (=> start!40490 (= tp!37461 b_and!18545)))

(declare-fun b!446062 () Bool)

(declare-fun e!262091 () Bool)

(declare-fun tp_is_empty!11875 () Bool)

(assert (=> b!446062 (= e!262091 tp_is_empty!11875)))

(declare-fun b!446063 () Bool)

(declare-fun res!264755 () Bool)

(declare-fun e!262089 () Bool)

(assert (=> b!446063 (=> (not res!264755) (not e!262089))))

(declare-datatypes ((array!27557 0))(
  ( (array!27558 (arr!13226 (Array (_ BitVec 32) (_ BitVec 64))) (size!13578 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27557)

(declare-datatypes ((List!7912 0))(
  ( (Nil!7909) (Cons!7908 (h!8764 (_ BitVec 64)) (t!13670 List!7912)) )
))
(declare-fun arrayNoDuplicates!0 (array!27557 (_ BitVec 32) List!7912) Bool)

(assert (=> b!446063 (= res!264755 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7909))))

(declare-fun b!446064 () Bool)

(declare-fun e!262088 () Bool)

(declare-fun mapRes!19440 () Bool)

(assert (=> b!446064 (= e!262088 (and e!262091 mapRes!19440))))

(declare-fun condMapEmpty!19440 () Bool)

(declare-datatypes ((V!16939 0))(
  ( (V!16940 (val!5982 Int)) )
))
(declare-datatypes ((ValueCell!5594 0))(
  ( (ValueCellFull!5594 (v!8233 V!16939)) (EmptyCell!5594) )
))
(declare-datatypes ((array!27559 0))(
  ( (array!27560 (arr!13227 (Array (_ BitVec 32) ValueCell!5594)) (size!13579 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27559)

(declare-fun mapDefault!19440 () ValueCell!5594)

