; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40588 () Bool)

(assert start!40588)

(declare-fun b_free!10599 () Bool)

(declare-fun b_next!10599 () Bool)

(assert (=> start!40588 (= b_free!10599 (not b_next!10599))))

(declare-fun tp!37616 () Bool)

(declare-fun b_and!18607 () Bool)

(assert (=> start!40588 (= tp!37616 b_and!18607)))

(declare-fun res!265900 () Bool)

(declare-fun e!262812 () Bool)

(assert (=> start!40588 (=> (not res!265900) (not e!262812))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27681 0))(
  ( (array!27682 (arr!13286 (Array (_ BitVec 32) (_ BitVec 64))) (size!13638 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27681)

(assert (=> start!40588 (= res!265900 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13638 _keys!709))))))

(assert (=> start!40588 e!262812))

(declare-fun tp_is_empty!11937 () Bool)

(assert (=> start!40588 tp_is_empty!11937))

(assert (=> start!40588 tp!37616))

(assert (=> start!40588 true))

(declare-datatypes ((V!17021 0))(
  ( (V!17022 (val!6013 Int)) )
))
(declare-datatypes ((ValueCell!5625 0))(
  ( (ValueCellFull!5625 (v!8268 V!17021)) (EmptyCell!5625) )
))
(declare-datatypes ((array!27683 0))(
  ( (array!27684 (arr!13287 (Array (_ BitVec 32) ValueCell!5625)) (size!13639 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27683)

(declare-fun e!262810 () Bool)

(declare-fun array_inv!9630 (array!27683) Bool)

(assert (=> start!40588 (and (array_inv!9630 _values!549) e!262810)))

(declare-fun array_inv!9631 (array!27681) Bool)

(assert (=> start!40588 (array_inv!9631 _keys!709)))

(declare-fun b!447647 () Bool)

(declare-fun res!265902 () Bool)

(assert (=> b!447647 (=> (not res!265902) (not e!262812))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447647 (= res!265902 (validKeyInArray!0 k0!794))))

(declare-fun b!447648 () Bool)

(declare-fun res!265901 () Bool)

(declare-fun e!262809 () Bool)

(assert (=> b!447648 (=> (not res!265901) (not e!262809))))

(declare-fun lt!204007 () array!27681)

(declare-datatypes ((List!7951 0))(
  ( (Nil!7948) (Cons!7947 (h!8803 (_ BitVec 64)) (t!13713 List!7951)) )
))
(declare-fun arrayNoDuplicates!0 (array!27681 (_ BitVec 32) List!7951) Bool)

(assert (=> b!447648 (= res!265901 (arrayNoDuplicates!0 lt!204007 #b00000000000000000000000000000000 Nil!7948))))

(declare-fun b!447649 () Bool)

(assert (=> b!447649 (= e!262809 false)))

(declare-fun minValue!515 () V!17021)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7886 0))(
  ( (tuple2!7887 (_1!3954 (_ BitVec 64)) (_2!3954 V!17021)) )
))
(declare-datatypes ((List!7952 0))(
  ( (Nil!7949) (Cons!7948 (h!8804 tuple2!7886) (t!13714 List!7952)) )
))
(declare-datatypes ((ListLongMap!6799 0))(
  ( (ListLongMap!6800 (toList!3415 List!7952)) )
))
(declare-fun lt!204008 () ListLongMap!6799)

(declare-fun zeroValue!515 () V!17021)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17021)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1601 (array!27681 array!27683 (_ BitVec 32) (_ BitVec 32) V!17021 V!17021 (_ BitVec 32) Int) ListLongMap!6799)

(assert (=> b!447649 (= lt!204008 (getCurrentListMapNoExtraKeys!1601 lt!204007 (array!27684 (store (arr!13287 _values!549) i!563 (ValueCellFull!5625 v!412)) (size!13639 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204009 () ListLongMap!6799)

(assert (=> b!447649 (= lt!204009 (getCurrentListMapNoExtraKeys!1601 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447650 () Bool)

(declare-fun res!265906 () Bool)

(assert (=> b!447650 (=> (not res!265906) (not e!262812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27681 (_ BitVec 32)) Bool)

(assert (=> b!447650 (= res!265906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447651 () Bool)

(declare-fun e!262811 () Bool)

(assert (=> b!447651 (= e!262811 tp_is_empty!11937)))

(declare-fun b!447652 () Bool)

(declare-fun mapRes!19539 () Bool)

(assert (=> b!447652 (= e!262810 (and e!262811 mapRes!19539))))

(declare-fun condMapEmpty!19539 () Bool)

(declare-fun mapDefault!19539 () ValueCell!5625)

(assert (=> b!447652 (= condMapEmpty!19539 (= (arr!13287 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5625)) mapDefault!19539)))))

(declare-fun b!447653 () Bool)

(declare-fun res!265904 () Bool)

(assert (=> b!447653 (=> (not res!265904) (not e!262812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447653 (= res!265904 (validMask!0 mask!1025))))

(declare-fun b!447654 () Bool)

(declare-fun res!265909 () Bool)

(assert (=> b!447654 (=> (not res!265909) (not e!262812))))

(declare-fun arrayContainsKey!0 (array!27681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447654 (= res!265909 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447655 () Bool)

(declare-fun res!265911 () Bool)

(assert (=> b!447655 (=> (not res!265911) (not e!262812))))

(assert (=> b!447655 (= res!265911 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13638 _keys!709))))))

(declare-fun mapNonEmpty!19539 () Bool)

(declare-fun tp!37617 () Bool)

(declare-fun e!262813 () Bool)

(assert (=> mapNonEmpty!19539 (= mapRes!19539 (and tp!37617 e!262813))))

(declare-fun mapKey!19539 () (_ BitVec 32))

(declare-fun mapRest!19539 () (Array (_ BitVec 32) ValueCell!5625))

(declare-fun mapValue!19539 () ValueCell!5625)

(assert (=> mapNonEmpty!19539 (= (arr!13287 _values!549) (store mapRest!19539 mapKey!19539 mapValue!19539))))

(declare-fun b!447656 () Bool)

(declare-fun res!265905 () Bool)

(assert (=> b!447656 (=> (not res!265905) (not e!262812))))

(assert (=> b!447656 (= res!265905 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7948))))

(declare-fun b!447657 () Bool)

(declare-fun res!265907 () Bool)

(assert (=> b!447657 (=> (not res!265907) (not e!262809))))

(assert (=> b!447657 (= res!265907 (bvsle from!863 i!563))))

(declare-fun b!447658 () Bool)

(assert (=> b!447658 (= e!262813 tp_is_empty!11937)))

(declare-fun b!447659 () Bool)

(assert (=> b!447659 (= e!262812 e!262809)))

(declare-fun res!265903 () Bool)

(assert (=> b!447659 (=> (not res!265903) (not e!262809))))

(assert (=> b!447659 (= res!265903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204007 mask!1025))))

(assert (=> b!447659 (= lt!204007 (array!27682 (store (arr!13286 _keys!709) i!563 k0!794) (size!13638 _keys!709)))))

(declare-fun b!447660 () Bool)

(declare-fun res!265908 () Bool)

(assert (=> b!447660 (=> (not res!265908) (not e!262812))))

(assert (=> b!447660 (= res!265908 (or (= (select (arr!13286 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13286 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19539 () Bool)

(assert (=> mapIsEmpty!19539 mapRes!19539))

(declare-fun b!447661 () Bool)

(declare-fun res!265910 () Bool)

(assert (=> b!447661 (=> (not res!265910) (not e!262812))))

(assert (=> b!447661 (= res!265910 (and (= (size!13639 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13638 _keys!709) (size!13639 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40588 res!265900) b!447653))

(assert (= (and b!447653 res!265904) b!447661))

(assert (= (and b!447661 res!265910) b!447650))

(assert (= (and b!447650 res!265906) b!447656))

(assert (= (and b!447656 res!265905) b!447655))

(assert (= (and b!447655 res!265911) b!447647))

(assert (= (and b!447647 res!265902) b!447660))

(assert (= (and b!447660 res!265908) b!447654))

(assert (= (and b!447654 res!265909) b!447659))

(assert (= (and b!447659 res!265903) b!447648))

(assert (= (and b!447648 res!265901) b!447657))

(assert (= (and b!447657 res!265907) b!447649))

(assert (= (and b!447652 condMapEmpty!19539) mapIsEmpty!19539))

(assert (= (and b!447652 (not condMapEmpty!19539)) mapNonEmpty!19539))

(get-info :version)

(assert (= (and mapNonEmpty!19539 ((_ is ValueCellFull!5625) mapValue!19539)) b!447658))

(assert (= (and b!447652 ((_ is ValueCellFull!5625) mapDefault!19539)) b!447651))

(assert (= start!40588 b!447652))

(declare-fun m!432463 () Bool)

(assert (=> b!447660 m!432463))

(declare-fun m!432465 () Bool)

(assert (=> b!447656 m!432465))

(declare-fun m!432467 () Bool)

(assert (=> b!447648 m!432467))

(declare-fun m!432469 () Bool)

(assert (=> b!447649 m!432469))

(declare-fun m!432471 () Bool)

(assert (=> b!447649 m!432471))

(declare-fun m!432473 () Bool)

(assert (=> b!447649 m!432473))

(declare-fun m!432475 () Bool)

(assert (=> b!447650 m!432475))

(declare-fun m!432477 () Bool)

(assert (=> b!447654 m!432477))

(declare-fun m!432479 () Bool)

(assert (=> mapNonEmpty!19539 m!432479))

(declare-fun m!432481 () Bool)

(assert (=> b!447653 m!432481))

(declare-fun m!432483 () Bool)

(assert (=> start!40588 m!432483))

(declare-fun m!432485 () Bool)

(assert (=> start!40588 m!432485))

(declare-fun m!432487 () Bool)

(assert (=> b!447647 m!432487))

(declare-fun m!432489 () Bool)

(assert (=> b!447659 m!432489))

(declare-fun m!432491 () Bool)

(assert (=> b!447659 m!432491))

(check-sat (not start!40588) tp_is_empty!11937 (not mapNonEmpty!19539) (not b!447650) (not b!447659) (not b!447648) (not b!447649) (not b_next!10599) (not b!447653) (not b!447656) (not b!447647) (not b!447654) b_and!18607)
(check-sat b_and!18607 (not b_next!10599))
