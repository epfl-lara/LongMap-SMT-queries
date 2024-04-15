; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39218 () Bool)

(assert start!39218)

(declare-fun b_free!9499 () Bool)

(declare-fun b_next!9499 () Bool)

(assert (=> start!39218 (= b_free!9499 (not b_next!9499))))

(declare-fun tp!34026 () Bool)

(declare-fun b_and!16859 () Bool)

(assert (=> start!39218 (= tp!34026 b_and!16859)))

(declare-fun b!413756 () Bool)

(declare-fun e!247321 () Bool)

(declare-fun tp_is_empty!10651 () Bool)

(assert (=> b!413756 (= e!247321 tp_is_empty!10651)))

(declare-fun b!413757 () Bool)

(declare-fun res!240541 () Bool)

(declare-fun e!247326 () Bool)

(assert (=> b!413757 (=> (not res!240541) (not e!247326))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413757 (= res!240541 (bvsle from!863 i!563))))

(declare-fun b!413758 () Bool)

(declare-fun res!240540 () Bool)

(declare-fun e!247319 () Bool)

(assert (=> b!413758 (=> (not res!240540) (not e!247319))))

(declare-datatypes ((array!25151 0))(
  ( (array!25152 (arr!12025 (Array (_ BitVec 32) (_ BitVec 64))) (size!12378 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25151)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25151 (_ BitVec 32)) Bool)

(assert (=> b!413758 (= res!240540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17598 () Bool)

(declare-fun mapRes!17598 () Bool)

(assert (=> mapIsEmpty!17598 mapRes!17598))

(declare-fun b!413759 () Bool)

(declare-fun res!240544 () Bool)

(assert (=> b!413759 (=> (not res!240544) (not e!247326))))

(declare-fun lt!189655 () array!25151)

(declare-datatypes ((List!6978 0))(
  ( (Nil!6975) (Cons!6974 (h!7830 (_ BitVec 64)) (t!12143 List!6978)) )
))
(declare-fun arrayNoDuplicates!0 (array!25151 (_ BitVec 32) List!6978) Bool)

(assert (=> b!413759 (= res!240544 (arrayNoDuplicates!0 lt!189655 #b00000000000000000000000000000000 Nil!6975))))

(declare-fun b!413760 () Bool)

(assert (=> b!413760 (= e!247319 e!247326)))

(declare-fun res!240551 () Bool)

(assert (=> b!413760 (=> (not res!240551) (not e!247326))))

(assert (=> b!413760 (= res!240551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189655 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!413760 (= lt!189655 (array!25152 (store (arr!12025 _keys!709) i!563 k0!794) (size!12378 _keys!709)))))

(declare-fun b!413761 () Bool)

(declare-datatypes ((V!15307 0))(
  ( (V!15308 (val!5370 Int)) )
))
(declare-datatypes ((tuple2!6964 0))(
  ( (tuple2!6965 (_1!3493 (_ BitVec 64)) (_2!3493 V!15307)) )
))
(declare-datatypes ((List!6979 0))(
  ( (Nil!6976) (Cons!6975 (h!7831 tuple2!6964) (t!12144 List!6979)) )
))
(declare-datatypes ((ListLongMap!5867 0))(
  ( (ListLongMap!5868 (toList!2949 List!6979)) )
))
(declare-fun call!28651 () ListLongMap!5867)

(declare-fun v!412 () V!15307)

(declare-fun call!28650 () ListLongMap!5867)

(declare-fun e!247323 () Bool)

(declare-fun +!1188 (ListLongMap!5867 tuple2!6964) ListLongMap!5867)

(assert (=> b!413761 (= e!247323 (= call!28651 (+!1188 call!28650 (tuple2!6965 k0!794 v!412))))))

(declare-fun minValue!515 () V!15307)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4982 0))(
  ( (ValueCellFull!4982 (v!7611 V!15307)) (EmptyCell!4982) )
))
(declare-datatypes ((array!25153 0))(
  ( (array!25154 (arr!12026 (Array (_ BitVec 32) ValueCell!4982)) (size!12379 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25153)

(declare-fun zeroValue!515 () V!15307)

(declare-fun c!54891 () Bool)

(declare-fun bm!28647 () Bool)

(declare-fun lt!189658 () array!25153)

(declare-fun getCurrentListMapNoExtraKeys!1162 (array!25151 array!25153 (_ BitVec 32) (_ BitVec 32) V!15307 V!15307 (_ BitVec 32) Int) ListLongMap!5867)

(assert (=> bm!28647 (= call!28650 (getCurrentListMapNoExtraKeys!1162 (ite c!54891 _keys!709 lt!189655) (ite c!54891 _values!549 lt!189658) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413762 () Bool)

(declare-fun e!247325 () Bool)

(assert (=> b!413762 (= e!247325 tp_is_empty!10651)))

(declare-fun res!240550 () Bool)

(assert (=> start!39218 (=> (not res!240550) (not e!247319))))

(assert (=> start!39218 (= res!240550 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12378 _keys!709))))))

(assert (=> start!39218 e!247319))

(assert (=> start!39218 tp_is_empty!10651))

(assert (=> start!39218 tp!34026))

(assert (=> start!39218 true))

(declare-fun e!247324 () Bool)

(declare-fun array_inv!8824 (array!25153) Bool)

(assert (=> start!39218 (and (array_inv!8824 _values!549) e!247324)))

(declare-fun array_inv!8825 (array!25151) Bool)

(assert (=> start!39218 (array_inv!8825 _keys!709)))

(declare-fun b!413763 () Bool)

(declare-fun res!240547 () Bool)

(assert (=> b!413763 (=> (not res!240547) (not e!247319))))

(assert (=> b!413763 (= res!240547 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12378 _keys!709))))))

(declare-fun b!413764 () Bool)

(declare-fun res!240548 () Bool)

(assert (=> b!413764 (=> (not res!240548) (not e!247319))))

(assert (=> b!413764 (= res!240548 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6975))))

(declare-fun b!413765 () Bool)

(declare-fun res!240542 () Bool)

(assert (=> b!413765 (=> (not res!240542) (not e!247319))))

(assert (=> b!413765 (= res!240542 (and (= (size!12379 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12378 _keys!709) (size!12379 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413766 () Bool)

(declare-fun e!247320 () Bool)

(assert (=> b!413766 (= e!247326 e!247320)))

(declare-fun res!240549 () Bool)

(assert (=> b!413766 (=> (not res!240549) (not e!247320))))

(assert (=> b!413766 (= res!240549 (= from!863 i!563))))

(declare-fun lt!189657 () ListLongMap!5867)

(assert (=> b!413766 (= lt!189657 (getCurrentListMapNoExtraKeys!1162 lt!189655 lt!189658 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413766 (= lt!189658 (array!25154 (store (arr!12026 _values!549) i!563 (ValueCellFull!4982 v!412)) (size!12379 _values!549)))))

(declare-fun lt!189656 () ListLongMap!5867)

(assert (=> b!413766 (= lt!189656 (getCurrentListMapNoExtraKeys!1162 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413767 () Bool)

(declare-fun res!240552 () Bool)

(assert (=> b!413767 (=> (not res!240552) (not e!247319))))

(assert (=> b!413767 (= res!240552 (or (= (select (arr!12025 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12025 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413768 () Bool)

(declare-fun res!240546 () Bool)

(assert (=> b!413768 (=> (not res!240546) (not e!247319))))

(declare-fun arrayContainsKey!0 (array!25151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413768 (= res!240546 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413769 () Bool)

(assert (=> b!413769 (= e!247324 (and e!247321 mapRes!17598))))

(declare-fun condMapEmpty!17598 () Bool)

(declare-fun mapDefault!17598 () ValueCell!4982)

(assert (=> b!413769 (= condMapEmpty!17598 (= (arr!12026 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4982)) mapDefault!17598)))))

(declare-fun b!413770 () Bool)

(assert (=> b!413770 (= e!247320 (not true))))

(assert (=> b!413770 e!247323))

(assert (=> b!413770 (= c!54891 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12218 0))(
  ( (Unit!12219) )
))
(declare-fun lt!189659 () Unit!12218)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!372 (array!25151 array!25153 (_ BitVec 32) (_ BitVec 32) V!15307 V!15307 (_ BitVec 32) (_ BitVec 64) V!15307 (_ BitVec 32) Int) Unit!12218)

(assert (=> b!413770 (= lt!189659 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!372 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413771 () Bool)

(assert (=> b!413771 (= e!247323 (= call!28650 call!28651))))

(declare-fun b!413772 () Bool)

(declare-fun res!240545 () Bool)

(assert (=> b!413772 (=> (not res!240545) (not e!247319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413772 (= res!240545 (validMask!0 mask!1025))))

(declare-fun bm!28648 () Bool)

(assert (=> bm!28648 (= call!28651 (getCurrentListMapNoExtraKeys!1162 (ite c!54891 lt!189655 _keys!709) (ite c!54891 lt!189658 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413773 () Bool)

(declare-fun res!240543 () Bool)

(assert (=> b!413773 (=> (not res!240543) (not e!247319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413773 (= res!240543 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17598 () Bool)

(declare-fun tp!34025 () Bool)

(assert (=> mapNonEmpty!17598 (= mapRes!17598 (and tp!34025 e!247325))))

(declare-fun mapRest!17598 () (Array (_ BitVec 32) ValueCell!4982))

(declare-fun mapValue!17598 () ValueCell!4982)

(declare-fun mapKey!17598 () (_ BitVec 32))

(assert (=> mapNonEmpty!17598 (= (arr!12026 _values!549) (store mapRest!17598 mapKey!17598 mapValue!17598))))

(assert (= (and start!39218 res!240550) b!413772))

(assert (= (and b!413772 res!240545) b!413765))

(assert (= (and b!413765 res!240542) b!413758))

(assert (= (and b!413758 res!240540) b!413764))

(assert (= (and b!413764 res!240548) b!413763))

(assert (= (and b!413763 res!240547) b!413773))

(assert (= (and b!413773 res!240543) b!413767))

(assert (= (and b!413767 res!240552) b!413768))

(assert (= (and b!413768 res!240546) b!413760))

(assert (= (and b!413760 res!240551) b!413759))

(assert (= (and b!413759 res!240544) b!413757))

(assert (= (and b!413757 res!240541) b!413766))

(assert (= (and b!413766 res!240549) b!413770))

(assert (= (and b!413770 c!54891) b!413761))

(assert (= (and b!413770 (not c!54891)) b!413771))

(assert (= (or b!413761 b!413771) bm!28648))

(assert (= (or b!413761 b!413771) bm!28647))

(assert (= (and b!413769 condMapEmpty!17598) mapIsEmpty!17598))

(assert (= (and b!413769 (not condMapEmpty!17598)) mapNonEmpty!17598))

(get-info :version)

(assert (= (and mapNonEmpty!17598 ((_ is ValueCellFull!4982) mapValue!17598)) b!413762))

(assert (= (and b!413769 ((_ is ValueCellFull!4982) mapDefault!17598)) b!413756))

(assert (= start!39218 b!413769))

(declare-fun m!402627 () Bool)

(assert (=> start!39218 m!402627))

(declare-fun m!402629 () Bool)

(assert (=> start!39218 m!402629))

(declare-fun m!402631 () Bool)

(assert (=> b!413770 m!402631))

(declare-fun m!402633 () Bool)

(assert (=> bm!28647 m!402633))

(declare-fun m!402635 () Bool)

(assert (=> b!413768 m!402635))

(declare-fun m!402637 () Bool)

(assert (=> b!413764 m!402637))

(declare-fun m!402639 () Bool)

(assert (=> b!413761 m!402639))

(declare-fun m!402641 () Bool)

(assert (=> b!413772 m!402641))

(declare-fun m!402643 () Bool)

(assert (=> mapNonEmpty!17598 m!402643))

(declare-fun m!402645 () Bool)

(assert (=> b!413759 m!402645))

(declare-fun m!402647 () Bool)

(assert (=> b!413767 m!402647))

(declare-fun m!402649 () Bool)

(assert (=> b!413758 m!402649))

(declare-fun m!402651 () Bool)

(assert (=> b!413760 m!402651))

(declare-fun m!402653 () Bool)

(assert (=> b!413760 m!402653))

(declare-fun m!402655 () Bool)

(assert (=> bm!28648 m!402655))

(declare-fun m!402657 () Bool)

(assert (=> b!413766 m!402657))

(declare-fun m!402659 () Bool)

(assert (=> b!413766 m!402659))

(declare-fun m!402661 () Bool)

(assert (=> b!413766 m!402661))

(declare-fun m!402663 () Bool)

(assert (=> b!413773 m!402663))

(check-sat (not b!413766) (not b!413758) (not bm!28647) (not b!413772) (not b!413770) (not start!39218) b_and!16859 (not b!413764) (not b!413768) (not b!413773) (not bm!28648) (not mapNonEmpty!17598) (not b_next!9499) tp_is_empty!10651 (not b!413760) (not b!413761) (not b!413759))
(check-sat b_and!16859 (not b_next!9499))
