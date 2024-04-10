; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40608 () Bool)

(assert start!40608)

(declare-fun b_free!10619 () Bool)

(declare-fun b_next!10619 () Bool)

(assert (=> start!40608 (= b_free!10619 (not b_next!10619))))

(declare-fun tp!37676 () Bool)

(declare-fun b_and!18627 () Bool)

(assert (=> start!40608 (= tp!37676 b_and!18627)))

(declare-fun b!448097 () Bool)

(declare-fun res!266268 () Bool)

(declare-fun e!262992 () Bool)

(assert (=> b!448097 (=> (not res!266268) (not e!262992))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27721 0))(
  ( (array!27722 (arr!13306 (Array (_ BitVec 32) (_ BitVec 64))) (size!13658 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27721)

(assert (=> b!448097 (= res!266268 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13658 _keys!709))))))

(declare-fun b!448098 () Bool)

(declare-fun e!262994 () Bool)

(declare-fun e!262990 () Bool)

(declare-fun mapRes!19569 () Bool)

(assert (=> b!448098 (= e!262994 (and e!262990 mapRes!19569))))

(declare-fun condMapEmpty!19569 () Bool)

(declare-datatypes ((V!17047 0))(
  ( (V!17048 (val!6023 Int)) )
))
(declare-datatypes ((ValueCell!5635 0))(
  ( (ValueCellFull!5635 (v!8278 V!17047)) (EmptyCell!5635) )
))
(declare-datatypes ((array!27723 0))(
  ( (array!27724 (arr!13307 (Array (_ BitVec 32) ValueCell!5635)) (size!13659 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27723)

(declare-fun mapDefault!19569 () ValueCell!5635)

