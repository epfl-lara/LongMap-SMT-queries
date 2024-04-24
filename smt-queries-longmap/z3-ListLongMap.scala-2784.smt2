; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40578 () Bool)

(assert start!40578)

(declare-fun b_free!10603 () Bool)

(declare-fun b_next!10603 () Bool)

(assert (=> start!40578 (= b_free!10603 (not b_next!10603))))

(declare-fun tp!37629 () Bool)

(declare-fun b_and!18625 () Bool)

(assert (=> start!40578 (= tp!37629 b_and!18625)))

(declare-fun mapNonEmpty!19545 () Bool)

(declare-fun mapRes!19545 () Bool)

(declare-fun tp!37628 () Bool)

(declare-fun e!262816 () Bool)

(assert (=> mapNonEmpty!19545 (= mapRes!19545 (and tp!37628 e!262816))))

(declare-datatypes ((V!17027 0))(
  ( (V!17028 (val!6015 Int)) )
))
(declare-datatypes ((ValueCell!5627 0))(
  ( (ValueCellFull!5627 (v!8271 V!17027)) (EmptyCell!5627) )
))
(declare-datatypes ((array!27690 0))(
  ( (array!27691 (arr!13290 (Array (_ BitVec 32) ValueCell!5627)) (size!13642 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27690)

(declare-fun mapRest!19545 () (Array (_ BitVec 32) ValueCell!5627))

(declare-fun mapKey!19545 () (_ BitVec 32))

(declare-fun mapValue!19545 () ValueCell!5627)

(assert (=> mapNonEmpty!19545 (= (arr!13290 _values!549) (store mapRest!19545 mapKey!19545 mapValue!19545))))

(declare-fun res!265979 () Bool)

(declare-fun e!262818 () Bool)

(assert (=> start!40578 (=> (not res!265979) (not e!262818))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27692 0))(
  ( (array!27693 (arr!13291 (Array (_ BitVec 32) (_ BitVec 64))) (size!13643 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27692)

(assert (=> start!40578 (= res!265979 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13643 _keys!709))))))

(assert (=> start!40578 e!262818))

(declare-fun tp_is_empty!11941 () Bool)

(assert (=> start!40578 tp_is_empty!11941))

(assert (=> start!40578 tp!37629))

(assert (=> start!40578 true))

(declare-fun e!262817 () Bool)

(declare-fun array_inv!9714 (array!27690) Bool)

(assert (=> start!40578 (and (array_inv!9714 _values!549) e!262817)))

(declare-fun array_inv!9715 (array!27692) Bool)

(assert (=> start!40578 (array_inv!9715 _keys!709)))

(declare-fun b!447688 () Bool)

(declare-fun e!262815 () Bool)

(assert (=> b!447688 (= e!262817 (and e!262815 mapRes!19545))))

(declare-fun condMapEmpty!19545 () Bool)

(declare-fun mapDefault!19545 () ValueCell!5627)

(assert (=> b!447688 (= condMapEmpty!19545 (= (arr!13290 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5627)) mapDefault!19545)))))

(declare-fun b!447689 () Bool)

(declare-fun e!262814 () Bool)

(assert (=> b!447689 (= e!262818 e!262814)))

(declare-fun res!265971 () Bool)

(assert (=> b!447689 (=> (not res!265971) (not e!262814))))

(declare-fun lt!204045 () array!27692)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27692 (_ BitVec 32)) Bool)

(assert (=> b!447689 (= res!265971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204045 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447689 (= lt!204045 (array!27693 (store (arr!13291 _keys!709) i!563 k0!794) (size!13643 _keys!709)))))

(declare-fun b!447690 () Bool)

(assert (=> b!447690 (= e!262816 tp_is_empty!11941)))

(declare-fun b!447691 () Bool)

(declare-fun res!265975 () Bool)

(assert (=> b!447691 (=> (not res!265975) (not e!262818))))

(declare-datatypes ((List!7867 0))(
  ( (Nil!7864) (Cons!7863 (h!8719 (_ BitVec 64)) (t!13621 List!7867)) )
))
(declare-fun arrayNoDuplicates!0 (array!27692 (_ BitVec 32) List!7867) Bool)

(assert (=> b!447691 (= res!265975 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7864))))

(declare-fun b!447692 () Bool)

(assert (=> b!447692 (= e!262815 tp_is_empty!11941)))

(declare-fun b!447693 () Bool)

(declare-fun res!265976 () Bool)

(assert (=> b!447693 (=> (not res!265976) (not e!262818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447693 (= res!265976 (validKeyInArray!0 k0!794))))

(declare-fun b!447694 () Bool)

(declare-fun res!265972 () Bool)

(assert (=> b!447694 (=> (not res!265972) (not e!262814))))

(assert (=> b!447694 (= res!265972 (bvsle from!863 i!563))))

(declare-fun b!447695 () Bool)

(declare-fun res!265969 () Bool)

(assert (=> b!447695 (=> (not res!265969) (not e!262818))))

(assert (=> b!447695 (= res!265969 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13643 _keys!709))))))

(declare-fun mapIsEmpty!19545 () Bool)

(assert (=> mapIsEmpty!19545 mapRes!19545))

(declare-fun b!447696 () Bool)

(declare-fun res!265974 () Bool)

(assert (=> b!447696 (=> (not res!265974) (not e!262818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447696 (= res!265974 (validMask!0 mask!1025))))

(declare-fun b!447697 () Bool)

(declare-fun res!265970 () Bool)

(assert (=> b!447697 (=> (not res!265970) (not e!262818))))

(assert (=> b!447697 (= res!265970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447698 () Bool)

(declare-fun res!265973 () Bool)

(assert (=> b!447698 (=> (not res!265973) (not e!262814))))

(assert (=> b!447698 (= res!265973 (arrayNoDuplicates!0 lt!204045 #b00000000000000000000000000000000 Nil!7864))))

(declare-fun b!447699 () Bool)

(declare-fun res!265978 () Bool)

(assert (=> b!447699 (=> (not res!265978) (not e!262818))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447699 (= res!265978 (and (= (size!13642 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13643 _keys!709) (size!13642 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447700 () Bool)

(declare-fun res!265977 () Bool)

(assert (=> b!447700 (=> (not res!265977) (not e!262818))))

(assert (=> b!447700 (= res!265977 (or (= (select (arr!13291 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13291 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447701 () Bool)

(declare-fun res!265980 () Bool)

(assert (=> b!447701 (=> (not res!265980) (not e!262818))))

(declare-fun arrayContainsKey!0 (array!27692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447701 (= res!265980 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447702 () Bool)

(assert (=> b!447702 (= e!262814 false)))

(declare-fun minValue!515 () V!17027)

(declare-fun zeroValue!515 () V!17027)

(declare-fun v!412 () V!17027)

(declare-datatypes ((tuple2!7796 0))(
  ( (tuple2!7797 (_1!3909 (_ BitVec 64)) (_2!3909 V!17027)) )
))
(declare-datatypes ((List!7868 0))(
  ( (Nil!7865) (Cons!7864 (h!8720 tuple2!7796) (t!13622 List!7868)) )
))
(declare-datatypes ((ListLongMap!6711 0))(
  ( (ListLongMap!6712 (toList!3371 List!7868)) )
))
(declare-fun lt!204044 () ListLongMap!6711)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1601 (array!27692 array!27690 (_ BitVec 32) (_ BitVec 32) V!17027 V!17027 (_ BitVec 32) Int) ListLongMap!6711)

(assert (=> b!447702 (= lt!204044 (getCurrentListMapNoExtraKeys!1601 lt!204045 (array!27691 (store (arr!13290 _values!549) i!563 (ValueCellFull!5627 v!412)) (size!13642 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204046 () ListLongMap!6711)

(assert (=> b!447702 (= lt!204046 (getCurrentListMapNoExtraKeys!1601 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40578 res!265979) b!447696))

(assert (= (and b!447696 res!265974) b!447699))

(assert (= (and b!447699 res!265978) b!447697))

(assert (= (and b!447697 res!265970) b!447691))

(assert (= (and b!447691 res!265975) b!447695))

(assert (= (and b!447695 res!265969) b!447693))

(assert (= (and b!447693 res!265976) b!447700))

(assert (= (and b!447700 res!265977) b!447701))

(assert (= (and b!447701 res!265980) b!447689))

(assert (= (and b!447689 res!265971) b!447698))

(assert (= (and b!447698 res!265973) b!447694))

(assert (= (and b!447694 res!265972) b!447702))

(assert (= (and b!447688 condMapEmpty!19545) mapIsEmpty!19545))

(assert (= (and b!447688 (not condMapEmpty!19545)) mapNonEmpty!19545))

(get-info :version)

(assert (= (and mapNonEmpty!19545 ((_ is ValueCellFull!5627) mapValue!19545)) b!447690))

(assert (= (and b!447688 ((_ is ValueCellFull!5627) mapDefault!19545)) b!447692))

(assert (= start!40578 b!447688))

(declare-fun m!432741 () Bool)

(assert (=> mapNonEmpty!19545 m!432741))

(declare-fun m!432743 () Bool)

(assert (=> b!447701 m!432743))

(declare-fun m!432745 () Bool)

(assert (=> b!447693 m!432745))

(declare-fun m!432747 () Bool)

(assert (=> b!447702 m!432747))

(declare-fun m!432749 () Bool)

(assert (=> b!447702 m!432749))

(declare-fun m!432751 () Bool)

(assert (=> b!447702 m!432751))

(declare-fun m!432753 () Bool)

(assert (=> b!447691 m!432753))

(declare-fun m!432755 () Bool)

(assert (=> b!447697 m!432755))

(declare-fun m!432757 () Bool)

(assert (=> b!447689 m!432757))

(declare-fun m!432759 () Bool)

(assert (=> b!447689 m!432759))

(declare-fun m!432761 () Bool)

(assert (=> b!447698 m!432761))

(declare-fun m!432763 () Bool)

(assert (=> b!447700 m!432763))

(declare-fun m!432765 () Bool)

(assert (=> b!447696 m!432765))

(declare-fun m!432767 () Bool)

(assert (=> start!40578 m!432767))

(declare-fun m!432769 () Bool)

(assert (=> start!40578 m!432769))

(check-sat (not start!40578) tp_is_empty!11941 (not mapNonEmpty!19545) (not b!447702) (not b!447696) (not b_next!10603) (not b!447698) (not b!447697) (not b!447689) (not b!447701) (not b!447691) (not b!447693) b_and!18625)
(check-sat b_and!18625 (not b_next!10603))
