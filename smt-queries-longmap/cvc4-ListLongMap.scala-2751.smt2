; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40362 () Bool)

(assert start!40362)

(declare-fun b!443405 () Bool)

(declare-fun e!260897 () Bool)

(declare-fun tp_is_empty!11747 () Bool)

(assert (=> b!443405 (= e!260897 tp_is_empty!11747)))

(declare-fun b!443406 () Bool)

(declare-fun res!262749 () Bool)

(declare-fun e!260896 () Bool)

(assert (=> b!443406 (=> (not res!262749) (not e!260896))))

(declare-datatypes ((array!27307 0))(
  ( (array!27308 (arr!13101 (Array (_ BitVec 32) (_ BitVec 64))) (size!13453 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27307)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16767 0))(
  ( (V!16768 (val!5918 Int)) )
))
(declare-datatypes ((ValueCell!5530 0))(
  ( (ValueCellFull!5530 (v!8169 V!16767)) (EmptyCell!5530) )
))
(declare-datatypes ((array!27309 0))(
  ( (array!27310 (arr!13102 (Array (_ BitVec 32) ValueCell!5530)) (size!13454 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27309)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443406 (= res!262749 (and (= (size!13454 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13453 _keys!709) (size!13454 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19248 () Bool)

(declare-fun mapRes!19248 () Bool)

(assert (=> mapIsEmpty!19248 mapRes!19248))

(declare-fun b!443407 () Bool)

(declare-fun e!260895 () Bool)

(assert (=> b!443407 (= e!260895 false)))

(declare-fun lt!203333 () Bool)

(declare-fun lt!203332 () array!27307)

(declare-datatypes ((List!7855 0))(
  ( (Nil!7852) (Cons!7851 (h!8707 (_ BitVec 64)) (t!13613 List!7855)) )
))
(declare-fun arrayNoDuplicates!0 (array!27307 (_ BitVec 32) List!7855) Bool)

(assert (=> b!443407 (= lt!203333 (arrayNoDuplicates!0 lt!203332 #b00000000000000000000000000000000 Nil!7852))))

(declare-fun res!262743 () Bool)

(assert (=> start!40362 (=> (not res!262743) (not e!260896))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40362 (= res!262743 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13453 _keys!709))))))

(assert (=> start!40362 e!260896))

(assert (=> start!40362 true))

(declare-fun e!260898 () Bool)

(declare-fun array_inv!9504 (array!27309) Bool)

(assert (=> start!40362 (and (array_inv!9504 _values!549) e!260898)))

(declare-fun array_inv!9505 (array!27307) Bool)

(assert (=> start!40362 (array_inv!9505 _keys!709)))

(declare-fun b!443408 () Bool)

(declare-fun res!262745 () Bool)

(assert (=> b!443408 (=> (not res!262745) (not e!260896))))

(assert (=> b!443408 (= res!262745 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7852))))

(declare-fun b!443409 () Bool)

(declare-fun res!262746 () Bool)

(assert (=> b!443409 (=> (not res!262746) (not e!260896))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443409 (= res!262746 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13453 _keys!709))))))

(declare-fun b!443410 () Bool)

(declare-fun e!260900 () Bool)

(assert (=> b!443410 (= e!260898 (and e!260900 mapRes!19248))))

(declare-fun condMapEmpty!19248 () Bool)

(declare-fun mapDefault!19248 () ValueCell!5530)

