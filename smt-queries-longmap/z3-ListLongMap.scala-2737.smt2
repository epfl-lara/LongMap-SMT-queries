; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40242 () Bool)

(assert start!40242)

(declare-fun b_free!10509 () Bool)

(declare-fun b_next!10509 () Bool)

(assert (=> start!40242 (= b_free!10509 (not b_next!10509))))

(declare-fun tp!37056 () Bool)

(declare-fun b_and!18477 () Bool)

(assert (=> start!40242 (= tp!37056 b_and!18477)))

(declare-fun b!441572 () Bool)

(declare-fun res!261426 () Bool)

(declare-fun e!259989 () Bool)

(assert (=> b!441572 (=> (not res!261426) (not e!259989))))

(declare-datatypes ((array!27135 0))(
  ( (array!27136 (arr!13017 (Array (_ BitVec 32) (_ BitVec 64))) (size!13369 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27135)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441572 (= res!261426 (or (= (select (arr!13017 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13017 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441573 () Bool)

(declare-fun e!259988 () Bool)

(assert (=> b!441573 (= e!259989 e!259988)))

(declare-fun res!261420 () Bool)

(assert (=> b!441573 (=> (not res!261420) (not e!259988))))

(declare-fun lt!202938 () array!27135)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27135 (_ BitVec 32)) Bool)

(assert (=> b!441573 (= res!261420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202938 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!441573 (= lt!202938 (array!27136 (store (arr!13017 _keys!709) i!563 k0!794) (size!13369 _keys!709)))))

(declare-fun b!441574 () Bool)

(declare-fun res!261422 () Bool)

(assert (=> b!441574 (=> (not res!261422) (not e!259989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441574 (= res!261422 (validMask!0 mask!1025))))

(declare-fun b!441575 () Bool)

(declare-fun e!259990 () Bool)

(assert (=> b!441575 (= e!259990 (not true))))

(declare-datatypes ((V!16653 0))(
  ( (V!16654 (val!5875 Int)) )
))
(declare-fun minValue!515 () V!16653)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5487 0))(
  ( (ValueCellFull!5487 (v!8122 V!16653)) (EmptyCell!5487) )
))
(declare-datatypes ((array!27137 0))(
  ( (array!27138 (arr!13018 (Array (_ BitVec 32) ValueCell!5487)) (size!13370 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27137)

(declare-fun zeroValue!515 () V!16653)

(declare-fun v!412 () V!16653)

(declare-fun lt!202936 () array!27137)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7818 0))(
  ( (tuple2!7819 (_1!3920 (_ BitVec 64)) (_2!3920 V!16653)) )
))
(declare-datatypes ((List!7814 0))(
  ( (Nil!7811) (Cons!7810 (h!8666 tuple2!7818) (t!13570 List!7814)) )
))
(declare-datatypes ((ListLongMap!6731 0))(
  ( (ListLongMap!6732 (toList!3381 List!7814)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1570 (array!27135 array!27137 (_ BitVec 32) (_ BitVec 32) V!16653 V!16653 (_ BitVec 32) Int) ListLongMap!6731)

(declare-fun +!1517 (ListLongMap!6731 tuple2!7818) ListLongMap!6731)

(assert (=> b!441575 (= (getCurrentListMapNoExtraKeys!1570 lt!202938 lt!202936 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1517 (getCurrentListMapNoExtraKeys!1570 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7819 k0!794 v!412)))))

(declare-datatypes ((Unit!13138 0))(
  ( (Unit!13139) )
))
(declare-fun lt!202940 () Unit!13138)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!686 (array!27135 array!27137 (_ BitVec 32) (_ BitVec 32) V!16653 V!16653 (_ BitVec 32) (_ BitVec 64) V!16653 (_ BitVec 32) Int) Unit!13138)

(assert (=> b!441575 (= lt!202940 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!686 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441576 () Bool)

(declare-fun res!261425 () Bool)

(assert (=> b!441576 (=> (not res!261425) (not e!259989))))

(assert (=> b!441576 (= res!261425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!261417 () Bool)

(assert (=> start!40242 (=> (not res!261417) (not e!259989))))

(assert (=> start!40242 (= res!261417 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13369 _keys!709))))))

(assert (=> start!40242 e!259989))

(declare-fun tp_is_empty!11661 () Bool)

(assert (=> start!40242 tp_is_empty!11661))

(assert (=> start!40242 tp!37056))

(assert (=> start!40242 true))

(declare-fun e!259987 () Bool)

(declare-fun array_inv!9446 (array!27137) Bool)

(assert (=> start!40242 (and (array_inv!9446 _values!549) e!259987)))

(declare-fun array_inv!9447 (array!27135) Bool)

(assert (=> start!40242 (array_inv!9447 _keys!709)))

(declare-fun b!441577 () Bool)

(declare-fun e!259991 () Bool)

(assert (=> b!441577 (= e!259991 tp_is_empty!11661)))

(declare-fun b!441578 () Bool)

(assert (=> b!441578 (= e!259988 e!259990)))

(declare-fun res!261428 () Bool)

(assert (=> b!441578 (=> (not res!261428) (not e!259990))))

(assert (=> b!441578 (= res!261428 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202937 () ListLongMap!6731)

(assert (=> b!441578 (= lt!202937 (getCurrentListMapNoExtraKeys!1570 lt!202938 lt!202936 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441578 (= lt!202936 (array!27138 (store (arr!13018 _values!549) i!563 (ValueCellFull!5487 v!412)) (size!13370 _values!549)))))

(declare-fun lt!202939 () ListLongMap!6731)

(assert (=> b!441578 (= lt!202939 (getCurrentListMapNoExtraKeys!1570 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19113 () Bool)

(declare-fun mapRes!19113 () Bool)

(assert (=> mapIsEmpty!19113 mapRes!19113))

(declare-fun b!441579 () Bool)

(declare-fun res!261419 () Bool)

(assert (=> b!441579 (=> (not res!261419) (not e!259989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441579 (= res!261419 (validKeyInArray!0 k0!794))))

(declare-fun b!441580 () Bool)

(declare-fun res!261423 () Bool)

(assert (=> b!441580 (=> (not res!261423) (not e!259989))))

(declare-fun arrayContainsKey!0 (array!27135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441580 (= res!261423 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441581 () Bool)

(declare-fun e!259986 () Bool)

(assert (=> b!441581 (= e!259986 tp_is_empty!11661)))

(declare-fun b!441582 () Bool)

(declare-fun res!261421 () Bool)

(assert (=> b!441582 (=> (not res!261421) (not e!259989))))

(assert (=> b!441582 (= res!261421 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13369 _keys!709))))))

(declare-fun b!441583 () Bool)

(declare-fun res!261429 () Bool)

(assert (=> b!441583 (=> (not res!261429) (not e!259988))))

(declare-datatypes ((List!7815 0))(
  ( (Nil!7812) (Cons!7811 (h!8667 (_ BitVec 64)) (t!13571 List!7815)) )
))
(declare-fun arrayNoDuplicates!0 (array!27135 (_ BitVec 32) List!7815) Bool)

(assert (=> b!441583 (= res!261429 (arrayNoDuplicates!0 lt!202938 #b00000000000000000000000000000000 Nil!7812))))

(declare-fun b!441584 () Bool)

(declare-fun res!261424 () Bool)

(assert (=> b!441584 (=> (not res!261424) (not e!259989))))

(assert (=> b!441584 (= res!261424 (and (= (size!13370 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13369 _keys!709) (size!13370 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19113 () Bool)

(declare-fun tp!37055 () Bool)

(assert (=> mapNonEmpty!19113 (= mapRes!19113 (and tp!37055 e!259991))))

(declare-fun mapKey!19113 () (_ BitVec 32))

(declare-fun mapRest!19113 () (Array (_ BitVec 32) ValueCell!5487))

(declare-fun mapValue!19113 () ValueCell!5487)

(assert (=> mapNonEmpty!19113 (= (arr!13018 _values!549) (store mapRest!19113 mapKey!19113 mapValue!19113))))

(declare-fun b!441585 () Bool)

(assert (=> b!441585 (= e!259987 (and e!259986 mapRes!19113))))

(declare-fun condMapEmpty!19113 () Bool)

(declare-fun mapDefault!19113 () ValueCell!5487)

(assert (=> b!441585 (= condMapEmpty!19113 (= (arr!13018 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5487)) mapDefault!19113)))))

(declare-fun b!441586 () Bool)

(declare-fun res!261418 () Bool)

(assert (=> b!441586 (=> (not res!261418) (not e!259989))))

(assert (=> b!441586 (= res!261418 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7812))))

(declare-fun b!441587 () Bool)

(declare-fun res!261427 () Bool)

(assert (=> b!441587 (=> (not res!261427) (not e!259988))))

(assert (=> b!441587 (= res!261427 (bvsle from!863 i!563))))

(assert (= (and start!40242 res!261417) b!441574))

(assert (= (and b!441574 res!261422) b!441584))

(assert (= (and b!441584 res!261424) b!441576))

(assert (= (and b!441576 res!261425) b!441586))

(assert (= (and b!441586 res!261418) b!441582))

(assert (= (and b!441582 res!261421) b!441579))

(assert (= (and b!441579 res!261419) b!441572))

(assert (= (and b!441572 res!261426) b!441580))

(assert (= (and b!441580 res!261423) b!441573))

(assert (= (and b!441573 res!261420) b!441583))

(assert (= (and b!441583 res!261429) b!441587))

(assert (= (and b!441587 res!261427) b!441578))

(assert (= (and b!441578 res!261428) b!441575))

(assert (= (and b!441585 condMapEmpty!19113) mapIsEmpty!19113))

(assert (= (and b!441585 (not condMapEmpty!19113)) mapNonEmpty!19113))

(get-info :version)

(assert (= (and mapNonEmpty!19113 ((_ is ValueCellFull!5487) mapValue!19113)) b!441577))

(assert (= (and b!441585 ((_ is ValueCellFull!5487) mapDefault!19113)) b!441581))

(assert (= start!40242 b!441585))

(declare-fun m!428381 () Bool)

(assert (=> b!441573 m!428381))

(declare-fun m!428383 () Bool)

(assert (=> b!441573 m!428383))

(declare-fun m!428385 () Bool)

(assert (=> start!40242 m!428385))

(declare-fun m!428387 () Bool)

(assert (=> start!40242 m!428387))

(declare-fun m!428389 () Bool)

(assert (=> b!441580 m!428389))

(declare-fun m!428391 () Bool)

(assert (=> b!441578 m!428391))

(declare-fun m!428393 () Bool)

(assert (=> b!441578 m!428393))

(declare-fun m!428395 () Bool)

(assert (=> b!441578 m!428395))

(declare-fun m!428397 () Bool)

(assert (=> b!441586 m!428397))

(declare-fun m!428399 () Bool)

(assert (=> b!441583 m!428399))

(declare-fun m!428401 () Bool)

(assert (=> b!441574 m!428401))

(declare-fun m!428403 () Bool)

(assert (=> b!441576 m!428403))

(declare-fun m!428405 () Bool)

(assert (=> b!441575 m!428405))

(declare-fun m!428407 () Bool)

(assert (=> b!441575 m!428407))

(assert (=> b!441575 m!428407))

(declare-fun m!428409 () Bool)

(assert (=> b!441575 m!428409))

(declare-fun m!428411 () Bool)

(assert (=> b!441575 m!428411))

(declare-fun m!428413 () Bool)

(assert (=> b!441579 m!428413))

(declare-fun m!428415 () Bool)

(assert (=> mapNonEmpty!19113 m!428415))

(declare-fun m!428417 () Bool)

(assert (=> b!441572 m!428417))

(check-sat tp_is_empty!11661 (not b!441576) b_and!18477 (not b!441579) (not b_next!10509) (not b!441573) (not mapNonEmpty!19113) (not start!40242) (not b!441578) (not b!441580) (not b!441583) (not b!441586) (not b!441575) (not b!441574))
(check-sat b_and!18477 (not b_next!10509))
