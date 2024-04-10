; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38364 () Bool)

(assert start!38364)

(declare-fun mapIsEmpty!16359 () Bool)

(declare-fun mapRes!16359 () Bool)

(assert (=> mapIsEmpty!16359 mapRes!16359))

(declare-fun res!226916 () Bool)

(declare-fun e!239557 () Bool)

(assert (=> start!38364 (=> (not res!226916) (not e!239557))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23569 0))(
  ( (array!23570 (arr!11237 (Array (_ BitVec 32) (_ BitVec 64))) (size!11589 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23569)

(assert (=> start!38364 (= res!226916 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11589 _keys!709))))))

(assert (=> start!38364 e!239557))

(assert (=> start!38364 true))

(declare-datatypes ((V!14213 0))(
  ( (V!14214 (val!4960 Int)) )
))
(declare-datatypes ((ValueCell!4572 0))(
  ( (ValueCellFull!4572 (v!7206 V!14213)) (EmptyCell!4572) )
))
(declare-datatypes ((array!23571 0))(
  ( (array!23572 (arr!11238 (Array (_ BitVec 32) ValueCell!4572)) (size!11590 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23571)

(declare-fun e!239553 () Bool)

(declare-fun array_inv!8248 (array!23571) Bool)

(assert (=> start!38364 (and (array_inv!8248 _values!549) e!239553)))

(declare-fun array_inv!8249 (array!23569) Bool)

(assert (=> start!38364 (array_inv!8249 _keys!709)))

(declare-fun b!395739 () Bool)

(declare-fun res!226921 () Bool)

(assert (=> b!395739 (=> (not res!226921) (not e!239557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395739 (= res!226921 (validKeyInArray!0 k0!794))))

(declare-fun b!395740 () Bool)

(declare-fun res!226922 () Bool)

(assert (=> b!395740 (=> (not res!226922) (not e!239557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23569 (_ BitVec 32)) Bool)

(assert (=> b!395740 (= res!226922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23570 (store (arr!11237 _keys!709) i!563 k0!794) (size!11589 _keys!709)) mask!1025))))

(declare-fun b!395741 () Bool)

(declare-fun res!226919 () Bool)

(assert (=> b!395741 (=> (not res!226919) (not e!239557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395741 (= res!226919 (validMask!0 mask!1025))))

(declare-fun b!395742 () Bool)

(declare-fun e!239556 () Bool)

(assert (=> b!395742 (= e!239553 (and e!239556 mapRes!16359))))

(declare-fun condMapEmpty!16359 () Bool)

(declare-fun mapDefault!16359 () ValueCell!4572)

(assert (=> b!395742 (= condMapEmpty!16359 (= (arr!11238 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4572)) mapDefault!16359)))))

(declare-fun mapNonEmpty!16359 () Bool)

(declare-fun tp!32154 () Bool)

(declare-fun e!239555 () Bool)

(assert (=> mapNonEmpty!16359 (= mapRes!16359 (and tp!32154 e!239555))))

(declare-fun mapValue!16359 () ValueCell!4572)

(declare-fun mapKey!16359 () (_ BitVec 32))

(declare-fun mapRest!16359 () (Array (_ BitVec 32) ValueCell!4572))

(assert (=> mapNonEmpty!16359 (= (arr!11238 _values!549) (store mapRest!16359 mapKey!16359 mapValue!16359))))

(declare-fun b!395743 () Bool)

(assert (=> b!395743 (= e!239557 (bvsgt #b00000000000000000000000000000000 (size!11589 _keys!709)))))

(declare-fun b!395744 () Bool)

(declare-fun res!226918 () Bool)

(assert (=> b!395744 (=> (not res!226918) (not e!239557))))

(assert (=> b!395744 (= res!226918 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11589 _keys!709))))))

(declare-fun b!395745 () Bool)

(declare-fun res!226917 () Bool)

(assert (=> b!395745 (=> (not res!226917) (not e!239557))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395745 (= res!226917 (and (= (size!11590 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11589 _keys!709) (size!11590 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395746 () Bool)

(declare-fun res!226924 () Bool)

(assert (=> b!395746 (=> (not res!226924) (not e!239557))))

(declare-datatypes ((List!6516 0))(
  ( (Nil!6513) (Cons!6512 (h!7368 (_ BitVec 64)) (t!11690 List!6516)) )
))
(declare-fun arrayNoDuplicates!0 (array!23569 (_ BitVec 32) List!6516) Bool)

(assert (=> b!395746 (= res!226924 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6513))))

(declare-fun b!395747 () Bool)

(declare-fun tp_is_empty!9831 () Bool)

(assert (=> b!395747 (= e!239555 tp_is_empty!9831)))

(declare-fun b!395748 () Bool)

(declare-fun res!226915 () Bool)

(assert (=> b!395748 (=> (not res!226915) (not e!239557))))

(declare-fun arrayContainsKey!0 (array!23569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395748 (= res!226915 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395749 () Bool)

(declare-fun res!226923 () Bool)

(assert (=> b!395749 (=> (not res!226923) (not e!239557))))

(assert (=> b!395749 (= res!226923 (or (= (select (arr!11237 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11237 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395750 () Bool)

(assert (=> b!395750 (= e!239556 tp_is_empty!9831)))

(declare-fun b!395751 () Bool)

(declare-fun res!226920 () Bool)

(assert (=> b!395751 (=> (not res!226920) (not e!239557))))

(assert (=> b!395751 (= res!226920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38364 res!226916) b!395741))

(assert (= (and b!395741 res!226919) b!395745))

(assert (= (and b!395745 res!226917) b!395751))

(assert (= (and b!395751 res!226920) b!395746))

(assert (= (and b!395746 res!226924) b!395744))

(assert (= (and b!395744 res!226918) b!395739))

(assert (= (and b!395739 res!226921) b!395749))

(assert (= (and b!395749 res!226923) b!395748))

(assert (= (and b!395748 res!226915) b!395740))

(assert (= (and b!395740 res!226922) b!395743))

(assert (= (and b!395742 condMapEmpty!16359) mapIsEmpty!16359))

(assert (= (and b!395742 (not condMapEmpty!16359)) mapNonEmpty!16359))

(get-info :version)

(assert (= (and mapNonEmpty!16359 ((_ is ValueCellFull!4572) mapValue!16359)) b!395747))

(assert (= (and b!395742 ((_ is ValueCellFull!4572) mapDefault!16359)) b!395750))

(assert (= start!38364 b!395742))

(declare-fun m!391643 () Bool)

(assert (=> b!395746 m!391643))

(declare-fun m!391645 () Bool)

(assert (=> b!395749 m!391645))

(declare-fun m!391647 () Bool)

(assert (=> b!395751 m!391647))

(declare-fun m!391649 () Bool)

(assert (=> b!395748 m!391649))

(declare-fun m!391651 () Bool)

(assert (=> b!395739 m!391651))

(declare-fun m!391653 () Bool)

(assert (=> b!395741 m!391653))

(declare-fun m!391655 () Bool)

(assert (=> b!395740 m!391655))

(declare-fun m!391657 () Bool)

(assert (=> b!395740 m!391657))

(declare-fun m!391659 () Bool)

(assert (=> mapNonEmpty!16359 m!391659))

(declare-fun m!391661 () Bool)

(assert (=> start!38364 m!391661))

(declare-fun m!391663 () Bool)

(assert (=> start!38364 m!391663))

(check-sat (not start!38364) (not mapNonEmpty!16359) (not b!395751) (not b!395740) tp_is_empty!9831 (not b!395741) (not b!395748) (not b!395746) (not b!395739))
(check-sat)
