; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40562 () Bool)

(assert start!40562)

(declare-fun b_free!10573 () Bool)

(declare-fun b_next!10573 () Bool)

(assert (=> start!40562 (= b_free!10573 (not b_next!10573))))

(declare-fun tp!37539 () Bool)

(declare-fun b_and!18581 () Bool)

(assert (=> start!40562 (= tp!37539 b_and!18581)))

(declare-fun b!447062 () Bool)

(declare-fun res!265432 () Bool)

(declare-fun e!262578 () Bool)

(assert (=> b!447062 (=> (not res!265432) (not e!262578))))

(declare-datatypes ((array!27629 0))(
  ( (array!27630 (arr!13260 (Array (_ BitVec 32) (_ BitVec 64))) (size!13612 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27629)

(declare-datatypes ((List!7932 0))(
  ( (Nil!7929) (Cons!7928 (h!8784 (_ BitVec 64)) (t!13694 List!7932)) )
))
(declare-fun arrayNoDuplicates!0 (array!27629 (_ BitVec 32) List!7932) Bool)

(assert (=> b!447062 (= res!265432 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7929))))

(declare-fun b!447063 () Bool)

(declare-fun res!265440 () Bool)

(assert (=> b!447063 (=> (not res!265440) (not e!262578))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27629 (_ BitVec 32)) Bool)

(assert (=> b!447063 (= res!265440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447064 () Bool)

(declare-fun e!262579 () Bool)

(assert (=> b!447064 (= e!262578 e!262579)))

(declare-fun res!265438 () Bool)

(assert (=> b!447064 (=> (not res!265438) (not e!262579))))

(declare-fun lt!203907 () array!27629)

(assert (=> b!447064 (= res!265438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203907 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447064 (= lt!203907 (array!27630 (store (arr!13260 _keys!709) i!563 k!794) (size!13612 _keys!709)))))

(declare-fun b!447065 () Bool)

(declare-fun res!265442 () Bool)

(assert (=> b!447065 (=> (not res!265442) (not e!262578))))

(assert (=> b!447065 (= res!265442 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13612 _keys!709))))))

(declare-fun b!447066 () Bool)

(declare-fun e!262576 () Bool)

(declare-fun tp_is_empty!11911 () Bool)

(assert (=> b!447066 (= e!262576 tp_is_empty!11911)))

(declare-fun b!447067 () Bool)

(declare-fun res!265433 () Bool)

(assert (=> b!447067 (=> (not res!265433) (not e!262579))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447067 (= res!265433 (bvsle from!863 i!563))))

(declare-fun b!447068 () Bool)

(declare-fun res!265443 () Bool)

(assert (=> b!447068 (=> (not res!265443) (not e!262579))))

(assert (=> b!447068 (= res!265443 (arrayNoDuplicates!0 lt!203907 #b00000000000000000000000000000000 Nil!7929))))

(declare-fun res!265434 () Bool)

(assert (=> start!40562 (=> (not res!265434) (not e!262578))))

(assert (=> start!40562 (= res!265434 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13612 _keys!709))))))

(assert (=> start!40562 e!262578))

(assert (=> start!40562 tp_is_empty!11911))

(assert (=> start!40562 tp!37539))

(assert (=> start!40562 true))

(declare-datatypes ((V!16987 0))(
  ( (V!16988 (val!6000 Int)) )
))
(declare-datatypes ((ValueCell!5612 0))(
  ( (ValueCellFull!5612 (v!8255 V!16987)) (EmptyCell!5612) )
))
(declare-datatypes ((array!27631 0))(
  ( (array!27632 (arr!13261 (Array (_ BitVec 32) ValueCell!5612)) (size!13613 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27631)

(declare-fun e!262577 () Bool)

(declare-fun array_inv!9616 (array!27631) Bool)

(assert (=> start!40562 (and (array_inv!9616 _values!549) e!262577)))

(declare-fun array_inv!9617 (array!27629) Bool)

(assert (=> start!40562 (array_inv!9617 _keys!709)))

(declare-fun b!447069 () Bool)

(declare-fun res!265436 () Bool)

(assert (=> b!447069 (=> (not res!265436) (not e!262578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447069 (= res!265436 (validMask!0 mask!1025))))

(declare-fun b!447070 () Bool)

(declare-fun res!265435 () Bool)

(assert (=> b!447070 (=> (not res!265435) (not e!262578))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447070 (= res!265435 (and (= (size!13613 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13612 _keys!709) (size!13613 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19500 () Bool)

(declare-fun mapRes!19500 () Bool)

(assert (=> mapIsEmpty!19500 mapRes!19500))

(declare-fun b!447071 () Bool)

(declare-fun e!262580 () Bool)

(assert (=> b!447071 (= e!262577 (and e!262580 mapRes!19500))))

(declare-fun condMapEmpty!19500 () Bool)

(declare-fun mapDefault!19500 () ValueCell!5612)

