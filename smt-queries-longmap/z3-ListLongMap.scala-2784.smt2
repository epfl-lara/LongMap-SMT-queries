; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40578 () Bool)

(assert start!40578)

(declare-fun b_free!10603 () Bool)

(declare-fun b_next!10603 () Bool)

(assert (=> start!40578 (= b_free!10603 (not b_next!10603))))

(declare-fun tp!37628 () Bool)

(declare-fun b_and!18585 () Bool)

(assert (=> start!40578 (= tp!37628 b_and!18585)))

(declare-fun b!447466 () Bool)

(declare-fun res!265854 () Bool)

(declare-fun e!262675 () Bool)

(assert (=> b!447466 (=> (not res!265854) (not e!262675))))

(declare-datatypes ((array!27687 0))(
  ( (array!27688 (arr!13289 (Array (_ BitVec 32) (_ BitVec 64))) (size!13642 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27687)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17027 0))(
  ( (V!17028 (val!6015 Int)) )
))
(declare-datatypes ((ValueCell!5627 0))(
  ( (ValueCellFull!5627 (v!8264 V!17027)) (EmptyCell!5627) )
))
(declare-datatypes ((array!27689 0))(
  ( (array!27690 (arr!13290 (Array (_ BitVec 32) ValueCell!5627)) (size!13643 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27689)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!447466 (= res!265854 (and (= (size!13643 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13642 _keys!709) (size!13643 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447467 () Bool)

(declare-fun e!262674 () Bool)

(declare-fun tp_is_empty!11941 () Bool)

(assert (=> b!447467 (= e!262674 tp_is_empty!11941)))

(declare-fun mapIsEmpty!19545 () Bool)

(declare-fun mapRes!19545 () Bool)

(assert (=> mapIsEmpty!19545 mapRes!19545))

(declare-fun b!447468 () Bool)

(declare-fun res!265849 () Bool)

(assert (=> b!447468 (=> (not res!265849) (not e!262675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27687 (_ BitVec 32)) Bool)

(assert (=> b!447468 (= res!265849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447469 () Bool)

(declare-fun res!265848 () Bool)

(declare-fun e!262673 () Bool)

(assert (=> b!447469 (=> (not res!265848) (not e!262673))))

(declare-fun lt!203791 () array!27687)

(declare-datatypes ((List!7957 0))(
  ( (Nil!7954) (Cons!7953 (h!8809 (_ BitVec 64)) (t!13710 List!7957)) )
))
(declare-fun arrayNoDuplicates!0 (array!27687 (_ BitVec 32) List!7957) Bool)

(assert (=> b!447469 (= res!265848 (arrayNoDuplicates!0 lt!203791 #b00000000000000000000000000000000 Nil!7954))))

(declare-fun b!447470 () Bool)

(assert (=> b!447470 (= e!262675 e!262673)))

(declare-fun res!265845 () Bool)

(assert (=> b!447470 (=> (not res!265845) (not e!262673))))

(assert (=> b!447470 (= res!265845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203791 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447470 (= lt!203791 (array!27688 (store (arr!13289 _keys!709) i!563 k0!794) (size!13642 _keys!709)))))

(declare-fun b!447471 () Bool)

(declare-fun e!262672 () Bool)

(assert (=> b!447471 (= e!262672 tp_is_empty!11941)))

(declare-fun b!447472 () Bool)

(declare-fun res!265846 () Bool)

(assert (=> b!447472 (=> (not res!265846) (not e!262675))))

(assert (=> b!447472 (= res!265846 (or (= (select (arr!13289 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13289 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447473 () Bool)

(declare-fun res!265853 () Bool)

(assert (=> b!447473 (=> (not res!265853) (not e!262675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447473 (= res!265853 (validMask!0 mask!1025))))

(declare-fun b!447474 () Bool)

(assert (=> b!447474 (= e!262673 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7896 0))(
  ( (tuple2!7897 (_1!3959 (_ BitVec 64)) (_2!3959 V!17027)) )
))
(declare-datatypes ((List!7958 0))(
  ( (Nil!7955) (Cons!7954 (h!8810 tuple2!7896) (t!13711 List!7958)) )
))
(declare-datatypes ((ListLongMap!6799 0))(
  ( (ListLongMap!6800 (toList!3415 List!7958)) )
))
(declare-fun lt!203793 () ListLongMap!6799)

(declare-fun minValue!515 () V!17027)

(declare-fun zeroValue!515 () V!17027)

(declare-fun v!412 () V!17027)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1613 (array!27687 array!27689 (_ BitVec 32) (_ BitVec 32) V!17027 V!17027 (_ BitVec 32) Int) ListLongMap!6799)

(assert (=> b!447474 (= lt!203793 (getCurrentListMapNoExtraKeys!1613 lt!203791 (array!27690 (store (arr!13290 _values!549) i!563 (ValueCellFull!5627 v!412)) (size!13643 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203792 () ListLongMap!6799)

(assert (=> b!447474 (= lt!203792 (getCurrentListMapNoExtraKeys!1613 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447475 () Bool)

(declare-fun res!265844 () Bool)

(assert (=> b!447475 (=> (not res!265844) (not e!262675))))

(assert (=> b!447475 (= res!265844 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7954))))

(declare-fun mapNonEmpty!19545 () Bool)

(declare-fun tp!37629 () Bool)

(assert (=> mapNonEmpty!19545 (= mapRes!19545 (and tp!37629 e!262674))))

(declare-fun mapRest!19545 () (Array (_ BitVec 32) ValueCell!5627))

(declare-fun mapKey!19545 () (_ BitVec 32))

(declare-fun mapValue!19545 () ValueCell!5627)

(assert (=> mapNonEmpty!19545 (= (arr!13290 _values!549) (store mapRest!19545 mapKey!19545 mapValue!19545))))

(declare-fun res!265851 () Bool)

(assert (=> start!40578 (=> (not res!265851) (not e!262675))))

(assert (=> start!40578 (= res!265851 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13642 _keys!709))))))

(assert (=> start!40578 e!262675))

(assert (=> start!40578 tp_is_empty!11941))

(assert (=> start!40578 tp!37628))

(assert (=> start!40578 true))

(declare-fun e!262671 () Bool)

(declare-fun array_inv!9686 (array!27689) Bool)

(assert (=> start!40578 (and (array_inv!9686 _values!549) e!262671)))

(declare-fun array_inv!9687 (array!27687) Bool)

(assert (=> start!40578 (array_inv!9687 _keys!709)))

(declare-fun b!447476 () Bool)

(declare-fun res!265852 () Bool)

(assert (=> b!447476 (=> (not res!265852) (not e!262673))))

(assert (=> b!447476 (= res!265852 (bvsle from!863 i!563))))

(declare-fun b!447477 () Bool)

(declare-fun res!265843 () Bool)

(assert (=> b!447477 (=> (not res!265843) (not e!262675))))

(assert (=> b!447477 (= res!265843 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13642 _keys!709))))))

(declare-fun b!447478 () Bool)

(assert (=> b!447478 (= e!262671 (and e!262672 mapRes!19545))))

(declare-fun condMapEmpty!19545 () Bool)

(declare-fun mapDefault!19545 () ValueCell!5627)

(assert (=> b!447478 (= condMapEmpty!19545 (= (arr!13290 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5627)) mapDefault!19545)))))

(declare-fun b!447479 () Bool)

(declare-fun res!265847 () Bool)

(assert (=> b!447479 (=> (not res!265847) (not e!262675))))

(declare-fun arrayContainsKey!0 (array!27687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447479 (= res!265847 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447480 () Bool)

(declare-fun res!265850 () Bool)

(assert (=> b!447480 (=> (not res!265850) (not e!262675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447480 (= res!265850 (validKeyInArray!0 k0!794))))

(assert (= (and start!40578 res!265851) b!447473))

(assert (= (and b!447473 res!265853) b!447466))

(assert (= (and b!447466 res!265854) b!447468))

(assert (= (and b!447468 res!265849) b!447475))

(assert (= (and b!447475 res!265844) b!447477))

(assert (= (and b!447477 res!265843) b!447480))

(assert (= (and b!447480 res!265850) b!447472))

(assert (= (and b!447472 res!265846) b!447479))

(assert (= (and b!447479 res!265847) b!447470))

(assert (= (and b!447470 res!265845) b!447469))

(assert (= (and b!447469 res!265848) b!447476))

(assert (= (and b!447476 res!265852) b!447474))

(assert (= (and b!447478 condMapEmpty!19545) mapIsEmpty!19545))

(assert (= (and b!447478 (not condMapEmpty!19545)) mapNonEmpty!19545))

(get-info :version)

(assert (= (and mapNonEmpty!19545 ((_ is ValueCellFull!5627) mapValue!19545)) b!447467))

(assert (= (and b!447478 ((_ is ValueCellFull!5627) mapDefault!19545)) b!447471))

(assert (= start!40578 b!447478))

(declare-fun m!431791 () Bool)

(assert (=> b!447473 m!431791))

(declare-fun m!431793 () Bool)

(assert (=> b!447470 m!431793))

(declare-fun m!431795 () Bool)

(assert (=> b!447470 m!431795))

(declare-fun m!431797 () Bool)

(assert (=> b!447475 m!431797))

(declare-fun m!431799 () Bool)

(assert (=> b!447479 m!431799))

(declare-fun m!431801 () Bool)

(assert (=> b!447480 m!431801))

(declare-fun m!431803 () Bool)

(assert (=> start!40578 m!431803))

(declare-fun m!431805 () Bool)

(assert (=> start!40578 m!431805))

(declare-fun m!431807 () Bool)

(assert (=> b!447469 m!431807))

(declare-fun m!431809 () Bool)

(assert (=> b!447472 m!431809))

(declare-fun m!431811 () Bool)

(assert (=> b!447474 m!431811))

(declare-fun m!431813 () Bool)

(assert (=> b!447474 m!431813))

(declare-fun m!431815 () Bool)

(assert (=> b!447474 m!431815))

(declare-fun m!431817 () Bool)

(assert (=> mapNonEmpty!19545 m!431817))

(declare-fun m!431819 () Bool)

(assert (=> b!447468 m!431819))

(check-sat (not b!447469) (not b!447468) (not b!447475) b_and!18585 (not b!447479) (not b!447470) (not b!447474) (not b_next!10603) (not b!447473) (not b!447480) (not mapNonEmpty!19545) tp_is_empty!11941 (not start!40578))
(check-sat b_and!18585 (not b_next!10603))
