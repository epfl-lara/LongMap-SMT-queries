; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40676 () Bool)

(assert start!40676)

(declare-fun b_free!10687 () Bool)

(declare-fun b_next!10687 () Bool)

(assert (=> start!40676 (= b_free!10687 (not b_next!10687))))

(declare-fun tp!37881 () Bool)

(declare-fun b_and!18695 () Bool)

(assert (=> start!40676 (= tp!37881 b_and!18695)))

(declare-fun b!449627 () Bool)

(declare-fun res!267488 () Bool)

(declare-fun e!263603 () Bool)

(assert (=> b!449627 (=> (not res!267488) (not e!263603))))

(declare-datatypes ((array!27857 0))(
  ( (array!27858 (arr!13374 (Array (_ BitVec 32) (_ BitVec 64))) (size!13726 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27857)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17139 0))(
  ( (V!17140 (val!6057 Int)) )
))
(declare-datatypes ((ValueCell!5669 0))(
  ( (ValueCellFull!5669 (v!8312 V!17139)) (EmptyCell!5669) )
))
(declare-datatypes ((array!27859 0))(
  ( (array!27860 (arr!13375 (Array (_ BitVec 32) ValueCell!5669)) (size!13727 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27859)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!449627 (= res!267488 (and (= (size!13727 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13726 _keys!709) (size!13727 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449628 () Bool)

(declare-fun e!263604 () Bool)

(declare-fun tp_is_empty!12025 () Bool)

(assert (=> b!449628 (= e!263604 tp_is_empty!12025)))

(declare-fun mapNonEmpty!19671 () Bool)

(declare-fun mapRes!19671 () Bool)

(declare-fun tp!37880 () Bool)

(assert (=> mapNonEmpty!19671 (= mapRes!19671 (and tp!37880 e!263604))))

(declare-fun mapValue!19671 () ValueCell!5669)

(declare-fun mapRest!19671 () (Array (_ BitVec 32) ValueCell!5669))

(declare-fun mapKey!19671 () (_ BitVec 32))

(assert (=> mapNonEmpty!19671 (= (arr!13375 _values!549) (store mapRest!19671 mapKey!19671 mapValue!19671))))

(declare-fun res!267484 () Bool)

(assert (=> start!40676 (=> (not res!267484) (not e!263603))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40676 (= res!267484 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13726 _keys!709))))))

(assert (=> start!40676 e!263603))

(assert (=> start!40676 tp_is_empty!12025))

(assert (=> start!40676 tp!37881))

(assert (=> start!40676 true))

(declare-fun e!263602 () Bool)

(declare-fun array_inv!9690 (array!27859) Bool)

(assert (=> start!40676 (and (array_inv!9690 _values!549) e!263602)))

(declare-fun array_inv!9691 (array!27857) Bool)

(assert (=> start!40676 (array_inv!9691 _keys!709)))

(declare-fun b!449629 () Bool)

(declare-fun res!267495 () Bool)

(declare-fun e!263601 () Bool)

(assert (=> b!449629 (=> (not res!267495) (not e!263601))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449629 (= res!267495 (bvsle from!863 i!563))))

(declare-fun b!449630 () Bool)

(declare-fun res!267485 () Bool)

(assert (=> b!449630 (=> (not res!267485) (not e!263601))))

(declare-fun lt!204403 () array!27857)

(declare-datatypes ((List!8020 0))(
  ( (Nil!8017) (Cons!8016 (h!8872 (_ BitVec 64)) (t!13782 List!8020)) )
))
(declare-fun arrayNoDuplicates!0 (array!27857 (_ BitVec 32) List!8020) Bool)

(assert (=> b!449630 (= res!267485 (arrayNoDuplicates!0 lt!204403 #b00000000000000000000000000000000 Nil!8017))))

(declare-fun mapIsEmpty!19671 () Bool)

(assert (=> mapIsEmpty!19671 mapRes!19671))

(declare-fun b!449631 () Bool)

(declare-fun res!267493 () Bool)

(assert (=> b!449631 (=> (not res!267493) (not e!263603))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449631 (= res!267493 (validKeyInArray!0 k!794))))

(declare-fun b!449632 () Bool)

(declare-fun e!263605 () Bool)

(assert (=> b!449632 (= e!263602 (and e!263605 mapRes!19671))))

(declare-fun condMapEmpty!19671 () Bool)

(declare-fun mapDefault!19671 () ValueCell!5669)

