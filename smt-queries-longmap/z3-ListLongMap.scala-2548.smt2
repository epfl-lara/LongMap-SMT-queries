; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39092 () Bool)

(assert start!39092)

(declare-fun b_free!9373 () Bool)

(declare-fun b_next!9373 () Bool)

(assert (=> start!39092 (= b_free!9373 (not b_next!9373))))

(declare-fun tp!33647 () Bool)

(declare-fun b_and!16733 () Bool)

(assert (=> start!39092 (= tp!33647 b_and!16733)))

(declare-fun b!410726 () Bool)

(declare-fun e!246056 () Bool)

(declare-fun tp_is_empty!10525 () Bool)

(assert (=> b!410726 (= e!246056 tp_is_empty!10525)))

(declare-fun b!410727 () Bool)

(declare-fun res!238213 () Bool)

(declare-fun e!246059 () Bool)

(assert (=> b!410727 (=> (not res!238213) (not e!246059))))

(declare-datatypes ((array!24905 0))(
  ( (array!24906 (arr!11902 (Array (_ BitVec 32) (_ BitVec 64))) (size!12255 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24905)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15139 0))(
  ( (V!15140 (val!5307 Int)) )
))
(declare-datatypes ((ValueCell!4919 0))(
  ( (ValueCellFull!4919 (v!7548 V!15139)) (EmptyCell!4919) )
))
(declare-datatypes ((array!24907 0))(
  ( (array!24908 (arr!11903 (Array (_ BitVec 32) ValueCell!4919)) (size!12256 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24907)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!410727 (= res!238213 (and (= (size!12256 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12255 _keys!709) (size!12256 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!238211 () Bool)

(assert (=> start!39092 (=> (not res!238211) (not e!246059))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39092 (= res!238211 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12255 _keys!709))))))

(assert (=> start!39092 e!246059))

(assert (=> start!39092 tp_is_empty!10525))

(assert (=> start!39092 tp!33647))

(assert (=> start!39092 true))

(declare-fun e!246055 () Bool)

(declare-fun array_inv!8732 (array!24907) Bool)

(assert (=> start!39092 (and (array_inv!8732 _values!549) e!246055)))

(declare-fun array_inv!8733 (array!24905) Bool)

(assert (=> start!39092 (array_inv!8733 _keys!709)))

(declare-fun b!410728 () Bool)

(declare-fun res!238209 () Bool)

(assert (=> b!410728 (=> (not res!238209) (not e!246059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410728 (= res!238209 (validMask!0 mask!1025))))

(declare-fun b!410729 () Bool)

(declare-fun e!246058 () Bool)

(assert (=> b!410729 (= e!246058 false)))

(declare-fun minValue!515 () V!15139)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6870 0))(
  ( (tuple2!6871 (_1!3446 (_ BitVec 64)) (_2!3446 V!15139)) )
))
(declare-datatypes ((List!6882 0))(
  ( (Nil!6879) (Cons!6878 (h!7734 tuple2!6870) (t!12047 List!6882)) )
))
(declare-datatypes ((ListLongMap!5773 0))(
  ( (ListLongMap!5774 (toList!2902 List!6882)) )
))
(declare-fun lt!188960 () ListLongMap!5773)

(declare-fun zeroValue!515 () V!15139)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15139)

(declare-fun lt!188958 () array!24905)

(declare-fun getCurrentListMapNoExtraKeys!1116 (array!24905 array!24907 (_ BitVec 32) (_ BitVec 32) V!15139 V!15139 (_ BitVec 32) Int) ListLongMap!5773)

(assert (=> b!410729 (= lt!188960 (getCurrentListMapNoExtraKeys!1116 lt!188958 (array!24908 (store (arr!11903 _values!549) i!563 (ValueCellFull!4919 v!412)) (size!12256 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!188959 () ListLongMap!5773)

(assert (=> b!410729 (= lt!188959 (getCurrentListMapNoExtraKeys!1116 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17409 () Bool)

(declare-fun mapRes!17409 () Bool)

(declare-fun tp!33648 () Bool)

(assert (=> mapNonEmpty!17409 (= mapRes!17409 (and tp!33648 e!246056))))

(declare-fun mapValue!17409 () ValueCell!4919)

(declare-fun mapRest!17409 () (Array (_ BitVec 32) ValueCell!4919))

(declare-fun mapKey!17409 () (_ BitVec 32))

(assert (=> mapNonEmpty!17409 (= (arr!11903 _values!549) (store mapRest!17409 mapKey!17409 mapValue!17409))))

(declare-fun b!410730 () Bool)

(assert (=> b!410730 (= e!246059 e!246058)))

(declare-fun res!238217 () Bool)

(assert (=> b!410730 (=> (not res!238217) (not e!246058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24905 (_ BitVec 32)) Bool)

(assert (=> b!410730 (= res!238217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188958 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!410730 (= lt!188958 (array!24906 (store (arr!11902 _keys!709) i!563 k0!794) (size!12255 _keys!709)))))

(declare-fun b!410731 () Bool)

(declare-fun res!238215 () Bool)

(assert (=> b!410731 (=> (not res!238215) (not e!246059))))

(assert (=> b!410731 (= res!238215 (or (= (select (arr!11902 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11902 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410732 () Bool)

(declare-fun res!238210 () Bool)

(assert (=> b!410732 (=> (not res!238210) (not e!246058))))

(declare-datatypes ((List!6883 0))(
  ( (Nil!6880) (Cons!6879 (h!7735 (_ BitVec 64)) (t!12048 List!6883)) )
))
(declare-fun arrayNoDuplicates!0 (array!24905 (_ BitVec 32) List!6883) Bool)

(assert (=> b!410732 (= res!238210 (arrayNoDuplicates!0 lt!188958 #b00000000000000000000000000000000 Nil!6880))))

(declare-fun b!410733 () Bool)

(declare-fun res!238208 () Bool)

(assert (=> b!410733 (=> (not res!238208) (not e!246059))))

(assert (=> b!410733 (= res!238208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410734 () Bool)

(declare-fun res!238216 () Bool)

(assert (=> b!410734 (=> (not res!238216) (not e!246059))))

(assert (=> b!410734 (= res!238216 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6880))))

(declare-fun b!410735 () Bool)

(declare-fun res!238214 () Bool)

(assert (=> b!410735 (=> (not res!238214) (not e!246059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410735 (= res!238214 (validKeyInArray!0 k0!794))))

(declare-fun b!410736 () Bool)

(declare-fun e!246060 () Bool)

(assert (=> b!410736 (= e!246060 tp_is_empty!10525)))

(declare-fun b!410737 () Bool)

(declare-fun res!238212 () Bool)

(assert (=> b!410737 (=> (not res!238212) (not e!246058))))

(assert (=> b!410737 (= res!238212 (bvsle from!863 i!563))))

(declare-fun b!410738 () Bool)

(declare-fun res!238218 () Bool)

(assert (=> b!410738 (=> (not res!238218) (not e!246059))))

(declare-fun arrayContainsKey!0 (array!24905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410738 (= res!238218 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410739 () Bool)

(declare-fun res!238207 () Bool)

(assert (=> b!410739 (=> (not res!238207) (not e!246059))))

(assert (=> b!410739 (= res!238207 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12255 _keys!709))))))

(declare-fun b!410740 () Bool)

(assert (=> b!410740 (= e!246055 (and e!246060 mapRes!17409))))

(declare-fun condMapEmpty!17409 () Bool)

(declare-fun mapDefault!17409 () ValueCell!4919)

(assert (=> b!410740 (= condMapEmpty!17409 (= (arr!11903 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4919)) mapDefault!17409)))))

(declare-fun mapIsEmpty!17409 () Bool)

(assert (=> mapIsEmpty!17409 mapRes!17409))

(assert (= (and start!39092 res!238211) b!410728))

(assert (= (and b!410728 res!238209) b!410727))

(assert (= (and b!410727 res!238213) b!410733))

(assert (= (and b!410733 res!238208) b!410734))

(assert (= (and b!410734 res!238216) b!410739))

(assert (= (and b!410739 res!238207) b!410735))

(assert (= (and b!410735 res!238214) b!410731))

(assert (= (and b!410731 res!238215) b!410738))

(assert (= (and b!410738 res!238218) b!410730))

(assert (= (and b!410730 res!238217) b!410732))

(assert (= (and b!410732 res!238210) b!410737))

(assert (= (and b!410737 res!238212) b!410729))

(assert (= (and b!410740 condMapEmpty!17409) mapIsEmpty!17409))

(assert (= (and b!410740 (not condMapEmpty!17409)) mapNonEmpty!17409))

(get-info :version)

(assert (= (and mapNonEmpty!17409 ((_ is ValueCellFull!4919) mapValue!17409)) b!410726))

(assert (= (and b!410740 ((_ is ValueCellFull!4919) mapDefault!17409)) b!410736))

(assert (= start!39092 b!410740))

(declare-fun m!400569 () Bool)

(assert (=> start!39092 m!400569))

(declare-fun m!400571 () Bool)

(assert (=> start!39092 m!400571))

(declare-fun m!400573 () Bool)

(assert (=> b!410735 m!400573))

(declare-fun m!400575 () Bool)

(assert (=> b!410728 m!400575))

(declare-fun m!400577 () Bool)

(assert (=> b!410733 m!400577))

(declare-fun m!400579 () Bool)

(assert (=> b!410734 m!400579))

(declare-fun m!400581 () Bool)

(assert (=> b!410730 m!400581))

(declare-fun m!400583 () Bool)

(assert (=> b!410730 m!400583))

(declare-fun m!400585 () Bool)

(assert (=> b!410731 m!400585))

(declare-fun m!400587 () Bool)

(assert (=> mapNonEmpty!17409 m!400587))

(declare-fun m!400589 () Bool)

(assert (=> b!410729 m!400589))

(declare-fun m!400591 () Bool)

(assert (=> b!410729 m!400591))

(declare-fun m!400593 () Bool)

(assert (=> b!410729 m!400593))

(declare-fun m!400595 () Bool)

(assert (=> b!410732 m!400595))

(declare-fun m!400597 () Bool)

(assert (=> b!410738 m!400597))

(check-sat (not b!410738) (not b!410735) (not b!410728) tp_is_empty!10525 (not b!410729) (not b!410733) (not b!410730) (not start!39092) (not b!410734) (not b!410732) (not b_next!9373) b_and!16733 (not mapNonEmpty!17409))
(check-sat b_and!16733 (not b_next!9373))
