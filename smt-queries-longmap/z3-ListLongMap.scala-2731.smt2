; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40206 () Bool)

(assert start!40206)

(declare-fun b_free!10473 () Bool)

(declare-fun b_next!10473 () Bool)

(assert (=> start!40206 (= b_free!10473 (not b_next!10473))))

(declare-fun tp!36947 () Bool)

(declare-fun b_and!18441 () Bool)

(assert (=> start!40206 (= tp!36947 b_and!18441)))

(declare-fun b!440708 () Bool)

(declare-fun res!260720 () Bool)

(declare-fun e!259613 () Bool)

(assert (=> b!440708 (=> (not res!260720) (not e!259613))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27063 0))(
  ( (array!27064 (arr!12981 (Array (_ BitVec 32) (_ BitVec 64))) (size!13333 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27063)

(assert (=> b!440708 (= res!260720 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13333 _keys!709))))))

(declare-fun b!440709 () Bool)

(declare-fun res!260726 () Bool)

(assert (=> b!440709 (=> (not res!260726) (not e!259613))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16605 0))(
  ( (V!16606 (val!5857 Int)) )
))
(declare-datatypes ((ValueCell!5469 0))(
  ( (ValueCellFull!5469 (v!8104 V!16605)) (EmptyCell!5469) )
))
(declare-datatypes ((array!27065 0))(
  ( (array!27066 (arr!12982 (Array (_ BitVec 32) ValueCell!5469)) (size!13334 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27065)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!440709 (= res!260726 (and (= (size!13334 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13333 _keys!709) (size!13334 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19059 () Bool)

(declare-fun mapRes!19059 () Bool)

(assert (=> mapIsEmpty!19059 mapRes!19059))

(declare-fun b!440710 () Bool)

(declare-fun res!260717 () Bool)

(assert (=> b!440710 (=> (not res!260717) (not e!259613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27063 (_ BitVec 32)) Bool)

(assert (=> b!440710 (= res!260717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440712 () Bool)

(declare-fun res!260725 () Bool)

(assert (=> b!440712 (=> (not res!260725) (not e!259613))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440712 (= res!260725 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440713 () Bool)

(declare-fun res!260723 () Bool)

(declare-fun e!259608 () Bool)

(assert (=> b!440713 (=> (not res!260723) (not e!259608))))

(declare-fun lt!202667 () array!27063)

(declare-datatypes ((List!7783 0))(
  ( (Nil!7780) (Cons!7779 (h!8635 (_ BitVec 64)) (t!13539 List!7783)) )
))
(declare-fun arrayNoDuplicates!0 (array!27063 (_ BitVec 32) List!7783) Bool)

(assert (=> b!440713 (= res!260723 (arrayNoDuplicates!0 lt!202667 #b00000000000000000000000000000000 Nil!7780))))

(declare-fun mapNonEmpty!19059 () Bool)

(declare-fun tp!36948 () Bool)

(declare-fun e!259612 () Bool)

(assert (=> mapNonEmpty!19059 (= mapRes!19059 (and tp!36948 e!259612))))

(declare-fun mapRest!19059 () (Array (_ BitVec 32) ValueCell!5469))

(declare-fun mapKey!19059 () (_ BitVec 32))

(declare-fun mapValue!19059 () ValueCell!5469)

(assert (=> mapNonEmpty!19059 (= (arr!12982 _values!549) (store mapRest!19059 mapKey!19059 mapValue!19059))))

(declare-fun b!440714 () Bool)

(assert (=> b!440714 (= e!259613 e!259608)))

(declare-fun res!260715 () Bool)

(assert (=> b!440714 (=> (not res!260715) (not e!259608))))

(assert (=> b!440714 (= res!260715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202667 mask!1025))))

(assert (=> b!440714 (= lt!202667 (array!27064 (store (arr!12981 _keys!709) i!563 k0!794) (size!13333 _keys!709)))))

(declare-fun b!440715 () Bool)

(declare-fun res!260727 () Bool)

(assert (=> b!440715 (=> (not res!260727) (not e!259613))))

(assert (=> b!440715 (= res!260727 (or (= (select (arr!12981 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12981 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440716 () Bool)

(declare-fun res!260722 () Bool)

(assert (=> b!440716 (=> (not res!260722) (not e!259608))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!440716 (= res!260722 (bvsle from!863 i!563))))

(declare-fun b!440717 () Bool)

(declare-fun tp_is_empty!11625 () Bool)

(assert (=> b!440717 (= e!259612 tp_is_empty!11625)))

(declare-fun b!440718 () Bool)

(declare-fun e!259614 () Bool)

(assert (=> b!440718 (= e!259608 e!259614)))

(declare-fun res!260724 () Bool)

(assert (=> b!440718 (=> (not res!260724) (not e!259614))))

(assert (=> b!440718 (= res!260724 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16605)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16605)

(declare-fun lt!202669 () array!27065)

(declare-datatypes ((tuple2!7786 0))(
  ( (tuple2!7787 (_1!3904 (_ BitVec 64)) (_2!3904 V!16605)) )
))
(declare-datatypes ((List!7784 0))(
  ( (Nil!7781) (Cons!7780 (h!8636 tuple2!7786) (t!13540 List!7784)) )
))
(declare-datatypes ((ListLongMap!6699 0))(
  ( (ListLongMap!6700 (toList!3365 List!7784)) )
))
(declare-fun lt!202670 () ListLongMap!6699)

(declare-fun getCurrentListMapNoExtraKeys!1554 (array!27063 array!27065 (_ BitVec 32) (_ BitVec 32) V!16605 V!16605 (_ BitVec 32) Int) ListLongMap!6699)

(assert (=> b!440718 (= lt!202670 (getCurrentListMapNoExtraKeys!1554 lt!202667 lt!202669 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16605)

(assert (=> b!440718 (= lt!202669 (array!27066 (store (arr!12982 _values!549) i!563 (ValueCellFull!5469 v!412)) (size!13334 _values!549)))))

(declare-fun lt!202668 () ListLongMap!6699)

(assert (=> b!440718 (= lt!202668 (getCurrentListMapNoExtraKeys!1554 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440711 () Bool)

(declare-fun res!260721 () Bool)

(assert (=> b!440711 (=> (not res!260721) (not e!259613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440711 (= res!260721 (validKeyInArray!0 k0!794))))

(declare-fun res!260718 () Bool)

(assert (=> start!40206 (=> (not res!260718) (not e!259613))))

(assert (=> start!40206 (= res!260718 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13333 _keys!709))))))

(assert (=> start!40206 e!259613))

(assert (=> start!40206 tp_is_empty!11625))

(assert (=> start!40206 tp!36947))

(assert (=> start!40206 true))

(declare-fun e!259609 () Bool)

(declare-fun array_inv!9420 (array!27065) Bool)

(assert (=> start!40206 (and (array_inv!9420 _values!549) e!259609)))

(declare-fun array_inv!9421 (array!27063) Bool)

(assert (=> start!40206 (array_inv!9421 _keys!709)))

(declare-fun b!440719 () Bool)

(declare-fun e!259611 () Bool)

(assert (=> b!440719 (= e!259609 (and e!259611 mapRes!19059))))

(declare-fun condMapEmpty!19059 () Bool)

(declare-fun mapDefault!19059 () ValueCell!5469)

(assert (=> b!440719 (= condMapEmpty!19059 (= (arr!12982 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5469)) mapDefault!19059)))))

(declare-fun b!440720 () Bool)

(declare-fun res!260716 () Bool)

(assert (=> b!440720 (=> (not res!260716) (not e!259613))))

(assert (=> b!440720 (= res!260716 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7780))))

(declare-fun b!440721 () Bool)

(declare-fun res!260719 () Bool)

(assert (=> b!440721 (=> (not res!260719) (not e!259613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440721 (= res!260719 (validMask!0 mask!1025))))

(declare-fun b!440722 () Bool)

(assert (=> b!440722 (= e!259611 tp_is_empty!11625)))

(declare-fun b!440723 () Bool)

(assert (=> b!440723 (= e!259614 (not true))))

(declare-fun +!1501 (ListLongMap!6699 tuple2!7786) ListLongMap!6699)

(assert (=> b!440723 (= (getCurrentListMapNoExtraKeys!1554 lt!202667 lt!202669 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1501 (getCurrentListMapNoExtraKeys!1554 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7787 k0!794 v!412)))))

(declare-datatypes ((Unit!13106 0))(
  ( (Unit!13107) )
))
(declare-fun lt!202666 () Unit!13106)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!670 (array!27063 array!27065 (_ BitVec 32) (_ BitVec 32) V!16605 V!16605 (_ BitVec 32) (_ BitVec 64) V!16605 (_ BitVec 32) Int) Unit!13106)

(assert (=> b!440723 (= lt!202666 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!670 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40206 res!260718) b!440721))

(assert (= (and b!440721 res!260719) b!440709))

(assert (= (and b!440709 res!260726) b!440710))

(assert (= (and b!440710 res!260717) b!440720))

(assert (= (and b!440720 res!260716) b!440708))

(assert (= (and b!440708 res!260720) b!440711))

(assert (= (and b!440711 res!260721) b!440715))

(assert (= (and b!440715 res!260727) b!440712))

(assert (= (and b!440712 res!260725) b!440714))

(assert (= (and b!440714 res!260715) b!440713))

(assert (= (and b!440713 res!260723) b!440716))

(assert (= (and b!440716 res!260722) b!440718))

(assert (= (and b!440718 res!260724) b!440723))

(assert (= (and b!440719 condMapEmpty!19059) mapIsEmpty!19059))

(assert (= (and b!440719 (not condMapEmpty!19059)) mapNonEmpty!19059))

(get-info :version)

(assert (= (and mapNonEmpty!19059 ((_ is ValueCellFull!5469) mapValue!19059)) b!440717))

(assert (= (and b!440719 ((_ is ValueCellFull!5469) mapDefault!19059)) b!440722))

(assert (= start!40206 b!440719))

(declare-fun m!427697 () Bool)

(assert (=> b!440714 m!427697))

(declare-fun m!427699 () Bool)

(assert (=> b!440714 m!427699))

(declare-fun m!427701 () Bool)

(assert (=> b!440712 m!427701))

(declare-fun m!427703 () Bool)

(assert (=> b!440715 m!427703))

(declare-fun m!427705 () Bool)

(assert (=> mapNonEmpty!19059 m!427705))

(declare-fun m!427707 () Bool)

(assert (=> start!40206 m!427707))

(declare-fun m!427709 () Bool)

(assert (=> start!40206 m!427709))

(declare-fun m!427711 () Bool)

(assert (=> b!440713 m!427711))

(declare-fun m!427713 () Bool)

(assert (=> b!440711 m!427713))

(declare-fun m!427715 () Bool)

(assert (=> b!440710 m!427715))

(declare-fun m!427717 () Bool)

(assert (=> b!440723 m!427717))

(declare-fun m!427719 () Bool)

(assert (=> b!440723 m!427719))

(assert (=> b!440723 m!427719))

(declare-fun m!427721 () Bool)

(assert (=> b!440723 m!427721))

(declare-fun m!427723 () Bool)

(assert (=> b!440723 m!427723))

(declare-fun m!427725 () Bool)

(assert (=> b!440720 m!427725))

(declare-fun m!427727 () Bool)

(assert (=> b!440721 m!427727))

(declare-fun m!427729 () Bool)

(assert (=> b!440718 m!427729))

(declare-fun m!427731 () Bool)

(assert (=> b!440718 m!427731))

(declare-fun m!427733 () Bool)

(assert (=> b!440718 m!427733))

(check-sat (not b!440710) tp_is_empty!11625 (not b!440713) (not b!440721) (not b!440712) (not b!440723) (not b!440720) (not mapNonEmpty!19059) b_and!18441 (not start!40206) (not b!440711) (not b!440718) (not b_next!10473) (not b!440714))
(check-sat b_and!18441 (not b_next!10473))
