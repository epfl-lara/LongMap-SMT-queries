; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40470 () Bool)

(assert start!40470)

(declare-fun b_free!10555 () Bool)

(declare-fun b_next!10555 () Bool)

(assert (=> start!40470 (= b_free!10555 (not b_next!10555))))

(declare-fun tp!37442 () Bool)

(declare-fun b_and!18553 () Bool)

(assert (=> start!40470 (= tp!37442 b_and!18553)))

(declare-fun b!445860 () Bool)

(declare-fun res!264642 () Bool)

(declare-fun e!261994 () Bool)

(assert (=> b!445860 (=> (not res!264642) (not e!261994))))

(declare-datatypes ((array!27550 0))(
  ( (array!27551 (arr!13222 (Array (_ BitVec 32) (_ BitVec 64))) (size!13574 (_ BitVec 32))) )
))
(declare-fun lt!203709 () array!27550)

(declare-datatypes ((List!7823 0))(
  ( (Nil!7820) (Cons!7819 (h!8675 (_ BitVec 64)) (t!13573 List!7823)) )
))
(declare-fun arrayNoDuplicates!0 (array!27550 (_ BitVec 32) List!7823) Bool)

(assert (=> b!445860 (= res!264642 (arrayNoDuplicates!0 lt!203709 #b00000000000000000000000000000000 Nil!7820))))

(declare-fun mapIsEmpty!19431 () Bool)

(declare-fun mapRes!19431 () Bool)

(assert (=> mapIsEmpty!19431 mapRes!19431))

(declare-fun b!445861 () Bool)

(declare-fun res!264644 () Bool)

(declare-fun e!261996 () Bool)

(assert (=> b!445861 (=> (not res!264644) (not e!261996))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445861 (= res!264644 (validMask!0 mask!1025))))

(declare-fun b!445862 () Bool)

(declare-fun res!264639 () Bool)

(assert (=> b!445862 (=> (not res!264639) (not e!261996))))

(declare-fun _keys!709 () array!27550)

(assert (=> b!445862 (= res!264639 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7820))))

(declare-fun b!445863 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((V!16931 0))(
  ( (V!16932 (val!5979 Int)) )
))
(declare-datatypes ((ValueCell!5591 0))(
  ( (ValueCellFull!5591 (v!8231 V!16931)) (EmptyCell!5591) )
))
(declare-datatypes ((array!27552 0))(
  ( (array!27553 (arr!13223 (Array (_ BitVec 32) ValueCell!5591)) (size!13575 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27552)

(assert (=> b!445863 (= e!261994 (not (bvslt i!563 (size!13575 _values!549))))))

(declare-fun e!261995 () Bool)

(assert (=> b!445863 e!261995))

(declare-fun c!55855 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!445863 (= c!55855 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!16931)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16931)

(declare-fun zeroValue!515 () V!16931)

(declare-datatypes ((Unit!13143 0))(
  ( (Unit!13144) )
))
(declare-fun lt!203708 () Unit!13143)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!693 (array!27550 array!27552 (_ BitVec 32) (_ BitVec 32) V!16931 V!16931 (_ BitVec 32) (_ BitVec 64) V!16931 (_ BitVec 32) Int) Unit!13143)

(assert (=> b!445863 (= lt!203708 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!693 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445865 () Bool)

(declare-fun res!264645 () Bool)

(assert (=> b!445865 (=> (not res!264645) (not e!261996))))

(declare-fun arrayContainsKey!0 (array!27550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445865 (= res!264645 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445866 () Bool)

(declare-fun res!264638 () Bool)

(assert (=> b!445866 (=> (not res!264638) (not e!261996))))

(assert (=> b!445866 (= res!264638 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13574 _keys!709))))))

(declare-fun b!445867 () Bool)

(declare-fun res!264635 () Bool)

(assert (=> b!445867 (=> (not res!264635) (not e!261996))))

(assert (=> b!445867 (= res!264635 (and (= (size!13575 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13574 _keys!709) (size!13575 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19431 () Bool)

(declare-fun tp!37443 () Bool)

(declare-fun e!261992 () Bool)

(assert (=> mapNonEmpty!19431 (= mapRes!19431 (and tp!37443 e!261992))))

(declare-fun mapRest!19431 () (Array (_ BitVec 32) ValueCell!5591))

(declare-fun mapKey!19431 () (_ BitVec 32))

(declare-fun mapValue!19431 () ValueCell!5591)

(assert (=> mapNonEmpty!19431 (= (arr!13223 _values!549) (store mapRest!19431 mapKey!19431 mapValue!19431))))

(declare-fun b!445868 () Bool)

(declare-fun res!264636 () Bool)

(assert (=> b!445868 (=> (not res!264636) (not e!261996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27550 (_ BitVec 32)) Bool)

(assert (=> b!445868 (= res!264636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445869 () Bool)

(assert (=> b!445869 (= e!261996 e!261994)))

(declare-fun res!264637 () Bool)

(assert (=> b!445869 (=> (not res!264637) (not e!261994))))

(assert (=> b!445869 (= res!264637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203709 mask!1025))))

(assert (=> b!445869 (= lt!203709 (array!27551 (store (arr!13222 _keys!709) i!563 k0!794) (size!13574 _keys!709)))))

(declare-fun b!445870 () Bool)

(declare-fun res!264646 () Bool)

(assert (=> b!445870 (=> (not res!264646) (not e!261996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445870 (= res!264646 (validKeyInArray!0 k0!794))))

(declare-fun b!445871 () Bool)

(declare-fun res!264641 () Bool)

(assert (=> b!445871 (=> (not res!264641) (not e!261994))))

(assert (=> b!445871 (= res!264641 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13574 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445864 () Bool)

(declare-fun e!261990 () Bool)

(declare-fun e!261993 () Bool)

(assert (=> b!445864 (= e!261990 (and e!261993 mapRes!19431))))

(declare-fun condMapEmpty!19431 () Bool)

(declare-fun mapDefault!19431 () ValueCell!5591)

(assert (=> b!445864 (= condMapEmpty!19431 (= (arr!13223 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5591)) mapDefault!19431)))))

(declare-fun res!264640 () Bool)

(assert (=> start!40470 (=> (not res!264640) (not e!261996))))

(assert (=> start!40470 (= res!264640 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13574 _keys!709))))))

(assert (=> start!40470 e!261996))

(declare-fun tp_is_empty!11869 () Bool)

(assert (=> start!40470 tp_is_empty!11869))

(assert (=> start!40470 tp!37442))

(assert (=> start!40470 true))

(declare-fun array_inv!9668 (array!27552) Bool)

(assert (=> start!40470 (and (array_inv!9668 _values!549) e!261990)))

(declare-fun array_inv!9669 (array!27550) Bool)

(assert (=> start!40470 (array_inv!9669 _keys!709)))

(declare-datatypes ((tuple2!7762 0))(
  ( (tuple2!7763 (_1!3892 (_ BitVec 64)) (_2!3892 V!16931)) )
))
(declare-datatypes ((List!7824 0))(
  ( (Nil!7821) (Cons!7820 (h!8676 tuple2!7762) (t!13574 List!7824)) )
))
(declare-datatypes ((ListLongMap!6677 0))(
  ( (ListLongMap!6678 (toList!3354 List!7824)) )
))
(declare-fun call!29609 () ListLongMap!6677)

(declare-fun b!445872 () Bool)

(declare-fun call!29608 () ListLongMap!6677)

(declare-fun +!1532 (ListLongMap!6677 tuple2!7762) ListLongMap!6677)

(assert (=> b!445872 (= e!261995 (= call!29609 (+!1532 call!29608 (tuple2!7763 k0!794 v!412))))))

(declare-fun bm!29605 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1584 (array!27550 array!27552 (_ BitVec 32) (_ BitVec 32) V!16931 V!16931 (_ BitVec 32) Int) ListLongMap!6677)

(assert (=> bm!29605 (= call!29608 (getCurrentListMapNoExtraKeys!1584 (ite c!55855 _keys!709 lt!203709) (ite c!55855 _values!549 (array!27553 (store (arr!13223 _values!549) i!563 (ValueCellFull!5591 v!412)) (size!13575 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29606 () Bool)

(assert (=> bm!29606 (= call!29609 (getCurrentListMapNoExtraKeys!1584 (ite c!55855 lt!203709 _keys!709) (ite c!55855 (array!27553 (store (arr!13223 _values!549) i!563 (ValueCellFull!5591 v!412)) (size!13575 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445873 () Bool)

(declare-fun res!264643 () Bool)

(assert (=> b!445873 (=> (not res!264643) (not e!261996))))

(assert (=> b!445873 (= res!264643 (or (= (select (arr!13222 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13222 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445874 () Bool)

(assert (=> b!445874 (= e!261993 tp_is_empty!11869)))

(declare-fun b!445875 () Bool)

(assert (=> b!445875 (= e!261995 (= call!29608 call!29609))))

(declare-fun b!445876 () Bool)

(assert (=> b!445876 (= e!261992 tp_is_empty!11869)))

(assert (= (and start!40470 res!264640) b!445861))

(assert (= (and b!445861 res!264644) b!445867))

(assert (= (and b!445867 res!264635) b!445868))

(assert (= (and b!445868 res!264636) b!445862))

(assert (= (and b!445862 res!264639) b!445866))

(assert (= (and b!445866 res!264638) b!445870))

(assert (= (and b!445870 res!264646) b!445873))

(assert (= (and b!445873 res!264643) b!445865))

(assert (= (and b!445865 res!264645) b!445869))

(assert (= (and b!445869 res!264637) b!445860))

(assert (= (and b!445860 res!264642) b!445871))

(assert (= (and b!445871 res!264641) b!445863))

(assert (= (and b!445863 c!55855) b!445872))

(assert (= (and b!445863 (not c!55855)) b!445875))

(assert (= (or b!445872 b!445875) bm!29606))

(assert (= (or b!445872 b!445875) bm!29605))

(assert (= (and b!445864 condMapEmpty!19431) mapIsEmpty!19431))

(assert (= (and b!445864 (not condMapEmpty!19431)) mapNonEmpty!19431))

(get-info :version)

(assert (= (and mapNonEmpty!19431 ((_ is ValueCellFull!5591) mapValue!19431)) b!445876))

(assert (= (and b!445864 ((_ is ValueCellFull!5591) mapDefault!19431)) b!445874))

(assert (= start!40470 b!445864))

(declare-fun m!431457 () Bool)

(assert (=> b!445863 m!431457))

(declare-fun m!431459 () Bool)

(assert (=> b!445869 m!431459))

(declare-fun m!431461 () Bool)

(assert (=> b!445869 m!431461))

(declare-fun m!431463 () Bool)

(assert (=> b!445870 m!431463))

(declare-fun m!431465 () Bool)

(assert (=> b!445861 m!431465))

(declare-fun m!431467 () Bool)

(assert (=> bm!29606 m!431467))

(declare-fun m!431469 () Bool)

(assert (=> bm!29606 m!431469))

(declare-fun m!431471 () Bool)

(assert (=> mapNonEmpty!19431 m!431471))

(declare-fun m!431473 () Bool)

(assert (=> b!445865 m!431473))

(declare-fun m!431475 () Bool)

(assert (=> b!445862 m!431475))

(declare-fun m!431477 () Bool)

(assert (=> start!40470 m!431477))

(declare-fun m!431479 () Bool)

(assert (=> start!40470 m!431479))

(declare-fun m!431481 () Bool)

(assert (=> b!445868 m!431481))

(declare-fun m!431483 () Bool)

(assert (=> b!445873 m!431483))

(declare-fun m!431485 () Bool)

(assert (=> b!445872 m!431485))

(declare-fun m!431487 () Bool)

(assert (=> b!445860 m!431487))

(assert (=> bm!29605 m!431467))

(declare-fun m!431489 () Bool)

(assert (=> bm!29605 m!431489))

(check-sat (not b!445869) (not b!445860) (not b_next!10555) (not mapNonEmpty!19431) (not b!445863) (not b!445870) (not b!445861) (not bm!29605) (not b!445868) (not b!445862) (not bm!29606) (not b!445865) (not b!445872) b_and!18553 (not start!40470) tp_is_empty!11869)
(check-sat b_and!18553 (not b_next!10555))
