; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40634 () Bool)

(assert start!40634)

(declare-fun b_free!10645 () Bool)

(declare-fun b_next!10645 () Bool)

(assert (=> start!40634 (= b_free!10645 (not b_next!10645))))

(declare-fun tp!37754 () Bool)

(declare-fun b_and!18653 () Bool)

(assert (=> start!40634 (= tp!37754 b_and!18653)))

(declare-fun res!266736 () Bool)

(declare-fun e!263228 () Bool)

(assert (=> start!40634 (=> (not res!266736) (not e!263228))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27773 0))(
  ( (array!27774 (arr!13332 (Array (_ BitVec 32) (_ BitVec 64))) (size!13684 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27773)

(assert (=> start!40634 (= res!266736 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13684 _keys!709))))))

(assert (=> start!40634 e!263228))

(declare-fun tp_is_empty!11983 () Bool)

(assert (=> start!40634 tp_is_empty!11983))

(assert (=> start!40634 tp!37754))

(assert (=> start!40634 true))

(declare-datatypes ((V!17083 0))(
  ( (V!17084 (val!6036 Int)) )
))
(declare-datatypes ((ValueCell!5648 0))(
  ( (ValueCellFull!5648 (v!8291 V!17083)) (EmptyCell!5648) )
))
(declare-datatypes ((array!27775 0))(
  ( (array!27776 (arr!13333 (Array (_ BitVec 32) ValueCell!5648)) (size!13685 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27775)

(declare-fun e!263225 () Bool)

(declare-fun array_inv!9662 (array!27775) Bool)

(assert (=> start!40634 (and (array_inv!9662 _values!549) e!263225)))

(declare-fun array_inv!9663 (array!27773) Bool)

(assert (=> start!40634 (array_inv!9663 _keys!709)))

(declare-fun b!448682 () Bool)

(declare-fun e!263224 () Bool)

(assert (=> b!448682 (= e!263224 tp_is_empty!11983)))

(declare-fun b!448683 () Bool)

(declare-fun res!266735 () Bool)

(declare-fun e!263223 () Bool)

(assert (=> b!448683 (=> (not res!266735) (not e!263223))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448683 (= res!266735 (bvsle from!863 i!563))))

(declare-fun b!448684 () Bool)

(declare-fun res!266737 () Bool)

(assert (=> b!448684 (=> (not res!266737) (not e!263228))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!448684 (= res!266737 (and (= (size!13685 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13684 _keys!709) (size!13685 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448685 () Bool)

(declare-fun res!266729 () Bool)

(assert (=> b!448685 (=> (not res!266729) (not e!263228))))

(declare-datatypes ((List!7986 0))(
  ( (Nil!7983) (Cons!7982 (h!8838 (_ BitVec 64)) (t!13748 List!7986)) )
))
(declare-fun arrayNoDuplicates!0 (array!27773 (_ BitVec 32) List!7986) Bool)

(assert (=> b!448685 (= res!266729 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7983))))

(declare-fun b!448686 () Bool)

(declare-fun e!263226 () Bool)

(declare-fun mapRes!19608 () Bool)

(assert (=> b!448686 (= e!263225 (and e!263226 mapRes!19608))))

(declare-fun condMapEmpty!19608 () Bool)

(declare-fun mapDefault!19608 () ValueCell!5648)

