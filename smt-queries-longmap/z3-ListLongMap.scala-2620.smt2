; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39524 () Bool)

(assert start!39524)

(declare-fun b_free!9805 () Bool)

(declare-fun b_next!9805 () Bool)

(assert (=> start!39524 (= b_free!9805 (not b_next!9805))))

(declare-fun tp!34944 () Bool)

(declare-fun b_and!17475 () Bool)

(assert (=> start!39524 (= tp!34944 b_and!17475)))

(declare-fun b!422810 () Bool)

(declare-fun res!247017 () Bool)

(declare-fun e!251474 () Bool)

(assert (=> b!422810 (=> (not res!247017) (not e!251474))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422810 (= res!247017 (validKeyInArray!0 k0!794))))

(declare-fun b!422811 () Bool)

(declare-fun e!251471 () Bool)

(assert (=> b!422811 (= e!251474 e!251471)))

(declare-fun res!247013 () Bool)

(assert (=> b!422811 (=> (not res!247013) (not e!251471))))

(declare-datatypes ((array!25768 0))(
  ( (array!25769 (arr!12333 (Array (_ BitVec 32) (_ BitVec 64))) (size!12685 (_ BitVec 32))) )
))
(declare-fun lt!194072 () array!25768)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25768 (_ BitVec 32)) Bool)

(assert (=> b!422811 (= res!247013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194072 mask!1025))))

(declare-fun _keys!709 () array!25768)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422811 (= lt!194072 (array!25769 (store (arr!12333 _keys!709) i!563 k0!794) (size!12685 _keys!709)))))

(declare-fun b!422812 () Bool)

(declare-fun res!247019 () Bool)

(assert (=> b!422812 (=> (not res!247019) (not e!251474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422812 (= res!247019 (validMask!0 mask!1025))))

(declare-fun b!422813 () Bool)

(declare-fun res!247009 () Bool)

(assert (=> b!422813 (=> (not res!247009) (not e!251471))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!422813 (= res!247009 (bvsle from!863 i!563))))

(declare-fun b!422814 () Bool)

(declare-fun e!251473 () Bool)

(declare-fun tp_is_empty!10957 () Bool)

(assert (=> b!422814 (= e!251473 tp_is_empty!10957)))

(declare-fun b!422815 () Bool)

(declare-fun res!247015 () Bool)

(assert (=> b!422815 (=> (not res!247015) (not e!251474))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15715 0))(
  ( (V!15716 (val!5523 Int)) )
))
(declare-datatypes ((ValueCell!5135 0))(
  ( (ValueCellFull!5135 (v!7771 V!15715)) (EmptyCell!5135) )
))
(declare-datatypes ((array!25770 0))(
  ( (array!25771 (arr!12334 (Array (_ BitVec 32) ValueCell!5135)) (size!12686 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25770)

(assert (=> b!422815 (= res!247015 (and (= (size!12686 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12685 _keys!709) (size!12686 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422816 () Bool)

(declare-fun res!247016 () Bool)

(assert (=> b!422816 (=> (not res!247016) (not e!251474))))

(assert (=> b!422816 (= res!247016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422817 () Bool)

(declare-fun res!247018 () Bool)

(assert (=> b!422817 (=> (not res!247018) (not e!251471))))

(declare-datatypes ((List!7138 0))(
  ( (Nil!7135) (Cons!7134 (h!7990 (_ BitVec 64)) (t!12574 List!7138)) )
))
(declare-fun arrayNoDuplicates!0 (array!25768 (_ BitVec 32) List!7138) Bool)

(assert (=> b!422817 (= res!247018 (arrayNoDuplicates!0 lt!194072 #b00000000000000000000000000000000 Nil!7135))))

(declare-fun b!422819 () Bool)

(declare-fun e!251475 () Bool)

(assert (=> b!422819 (= e!251475 tp_is_empty!10957)))

(declare-fun b!422820 () Bool)

(declare-fun e!251472 () Bool)

(declare-fun mapRes!18057 () Bool)

(assert (=> b!422820 (= e!251472 (and e!251475 mapRes!18057))))

(declare-fun condMapEmpty!18057 () Bool)

(declare-fun mapDefault!18057 () ValueCell!5135)

(assert (=> b!422820 (= condMapEmpty!18057 (= (arr!12334 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5135)) mapDefault!18057)))))

(declare-fun b!422821 () Bool)

(declare-fun res!247020 () Bool)

(assert (=> b!422821 (=> (not res!247020) (not e!251474))))

(declare-fun arrayContainsKey!0 (array!25768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422821 (= res!247020 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18057 () Bool)

(declare-fun tp!34943 () Bool)

(assert (=> mapNonEmpty!18057 (= mapRes!18057 (and tp!34943 e!251473))))

(declare-fun mapKey!18057 () (_ BitVec 32))

(declare-fun mapRest!18057 () (Array (_ BitVec 32) ValueCell!5135))

(declare-fun mapValue!18057 () ValueCell!5135)

(assert (=> mapNonEmpty!18057 (= (arr!12334 _values!549) (store mapRest!18057 mapKey!18057 mapValue!18057))))

(declare-fun res!247012 () Bool)

(assert (=> start!39524 (=> (not res!247012) (not e!251474))))

(assert (=> start!39524 (= res!247012 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12685 _keys!709))))))

(assert (=> start!39524 e!251474))

(assert (=> start!39524 tp_is_empty!10957))

(assert (=> start!39524 tp!34944))

(assert (=> start!39524 true))

(declare-fun array_inv!9064 (array!25770) Bool)

(assert (=> start!39524 (and (array_inv!9064 _values!549) e!251472)))

(declare-fun array_inv!9065 (array!25768) Bool)

(assert (=> start!39524 (array_inv!9065 _keys!709)))

(declare-fun b!422818 () Bool)

(declare-fun res!247014 () Bool)

(assert (=> b!422818 (=> (not res!247014) (not e!251474))))

(assert (=> b!422818 (= res!247014 (or (= (select (arr!12333 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12333 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422822 () Bool)

(declare-fun res!247011 () Bool)

(assert (=> b!422822 (=> (not res!247011) (not e!251474))))

(assert (=> b!422822 (= res!247011 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12685 _keys!709))))))

(declare-fun mapIsEmpty!18057 () Bool)

(assert (=> mapIsEmpty!18057 mapRes!18057))

(declare-fun b!422823 () Bool)

(assert (=> b!422823 (= e!251471 false)))

(declare-fun minValue!515 () V!15715)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7136 0))(
  ( (tuple2!7137 (_1!3579 (_ BitVec 64)) (_2!3579 V!15715)) )
))
(declare-datatypes ((List!7139 0))(
  ( (Nil!7136) (Cons!7135 (h!7991 tuple2!7136) (t!12575 List!7139)) )
))
(declare-datatypes ((ListLongMap!6051 0))(
  ( (ListLongMap!6052 (toList!3041 List!7139)) )
))
(declare-fun lt!194071 () ListLongMap!6051)

(declare-fun zeroValue!515 () V!15715)

(declare-fun v!412 () V!15715)

(declare-fun getCurrentListMapNoExtraKeys!1287 (array!25768 array!25770 (_ BitVec 32) (_ BitVec 32) V!15715 V!15715 (_ BitVec 32) Int) ListLongMap!6051)

(assert (=> b!422823 (= lt!194071 (getCurrentListMapNoExtraKeys!1287 lt!194072 (array!25771 (store (arr!12334 _values!549) i!563 (ValueCellFull!5135 v!412)) (size!12686 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194073 () ListLongMap!6051)

(assert (=> b!422823 (= lt!194073 (getCurrentListMapNoExtraKeys!1287 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422824 () Bool)

(declare-fun res!247010 () Bool)

(assert (=> b!422824 (=> (not res!247010) (not e!251474))))

(assert (=> b!422824 (= res!247010 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7135))))

(assert (= (and start!39524 res!247012) b!422812))

(assert (= (and b!422812 res!247019) b!422815))

(assert (= (and b!422815 res!247015) b!422816))

(assert (= (and b!422816 res!247016) b!422824))

(assert (= (and b!422824 res!247010) b!422822))

(assert (= (and b!422822 res!247011) b!422810))

(assert (= (and b!422810 res!247017) b!422818))

(assert (= (and b!422818 res!247014) b!422821))

(assert (= (and b!422821 res!247020) b!422811))

(assert (= (and b!422811 res!247013) b!422817))

(assert (= (and b!422817 res!247018) b!422813))

(assert (= (and b!422813 res!247009) b!422823))

(assert (= (and b!422820 condMapEmpty!18057) mapIsEmpty!18057))

(assert (= (and b!422820 (not condMapEmpty!18057)) mapNonEmpty!18057))

(get-info :version)

(assert (= (and mapNonEmpty!18057 ((_ is ValueCellFull!5135) mapValue!18057)) b!422814))

(assert (= (and b!422820 ((_ is ValueCellFull!5135) mapDefault!18057)) b!422819))

(assert (= start!39524 b!422820))

(declare-fun m!412751 () Bool)

(assert (=> b!422812 m!412751))

(declare-fun m!412753 () Bool)

(assert (=> b!422810 m!412753))

(declare-fun m!412755 () Bool)

(assert (=> b!422824 m!412755))

(declare-fun m!412757 () Bool)

(assert (=> start!39524 m!412757))

(declare-fun m!412759 () Bool)

(assert (=> start!39524 m!412759))

(declare-fun m!412761 () Bool)

(assert (=> b!422811 m!412761))

(declare-fun m!412763 () Bool)

(assert (=> b!422811 m!412763))

(declare-fun m!412765 () Bool)

(assert (=> b!422823 m!412765))

(declare-fun m!412767 () Bool)

(assert (=> b!422823 m!412767))

(declare-fun m!412769 () Bool)

(assert (=> b!422823 m!412769))

(declare-fun m!412771 () Bool)

(assert (=> mapNonEmpty!18057 m!412771))

(declare-fun m!412773 () Bool)

(assert (=> b!422817 m!412773))

(declare-fun m!412775 () Bool)

(assert (=> b!422818 m!412775))

(declare-fun m!412777 () Bool)

(assert (=> b!422816 m!412777))

(declare-fun m!412779 () Bool)

(assert (=> b!422821 m!412779))

(check-sat (not b!422812) (not b!422821) (not b_next!9805) (not b!422824) (not b!422823) (not b!422810) (not b!422816) (not b!422817) b_and!17475 tp_is_empty!10957 (not b!422811) (not start!39524) (not mapNonEmpty!18057))
(check-sat b_and!17475 (not b_next!9805))
