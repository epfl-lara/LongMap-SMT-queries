; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40040 () Bool)

(assert start!40040)

(declare-fun b_free!10321 () Bool)

(declare-fun b_next!10321 () Bool)

(assert (=> start!40040 (= b_free!10321 (not b_next!10321))))

(declare-fun tp!36491 () Bool)

(declare-fun b_and!18263 () Bool)

(assert (=> start!40040 (= tp!36491 b_and!18263)))

(declare-fun b!436789 () Bool)

(declare-fun res!257622 () Bool)

(declare-fun e!257842 () Bool)

(assert (=> b!436789 (=> (not res!257622) (not e!257842))))

(declare-datatypes ((array!26767 0))(
  ( (array!26768 (arr!12833 (Array (_ BitVec 32) (_ BitVec 64))) (size!13186 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26767)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436789 (= res!257622 (or (= (select (arr!12833 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12833 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436790 () Bool)

(declare-fun e!257844 () Bool)

(declare-fun tp_is_empty!11473 () Bool)

(assert (=> b!436790 (= e!257844 tp_is_empty!11473)))

(declare-fun b!436791 () Bool)

(declare-fun e!257838 () Bool)

(declare-fun e!257839 () Bool)

(assert (=> b!436791 (= e!257838 e!257839)))

(declare-fun res!257625 () Bool)

(assert (=> b!436791 (=> (not res!257625) (not e!257839))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!436791 (= res!257625 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16403 0))(
  ( (V!16404 (val!5781 Int)) )
))
(declare-datatypes ((tuple2!7676 0))(
  ( (tuple2!7677 (_1!3849 (_ BitVec 64)) (_2!3849 V!16403)) )
))
(declare-datatypes ((List!7663 0))(
  ( (Nil!7660) (Cons!7659 (h!8515 tuple2!7676) (t!13410 List!7663)) )
))
(declare-datatypes ((ListLongMap!6579 0))(
  ( (ListLongMap!6580 (toList!3305 List!7663)) )
))
(declare-fun lt!201292 () ListLongMap!6579)

(declare-fun lt!201295 () array!26767)

(declare-fun zeroValue!515 () V!16403)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!16403)

(declare-datatypes ((ValueCell!5393 0))(
  ( (ValueCellFull!5393 (v!8022 V!16403)) (EmptyCell!5393) )
))
(declare-datatypes ((array!26769 0))(
  ( (array!26770 (arr!12834 (Array (_ BitVec 32) ValueCell!5393)) (size!13187 (_ BitVec 32))) )
))
(declare-fun lt!201294 () array!26769)

(declare-fun getCurrentListMapNoExtraKeys!1504 (array!26767 array!26769 (_ BitVec 32) (_ BitVec 32) V!16403 V!16403 (_ BitVec 32) Int) ListLongMap!6579)

(assert (=> b!436791 (= lt!201292 (getCurrentListMapNoExtraKeys!1504 lt!201295 lt!201294 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26769)

(declare-fun v!412 () V!16403)

(assert (=> b!436791 (= lt!201294 (array!26770 (store (arr!12834 _values!549) i!563 (ValueCellFull!5393 v!412)) (size!13187 _values!549)))))

(declare-fun lt!201293 () ListLongMap!6579)

(assert (=> b!436791 (= lt!201293 (getCurrentListMapNoExtraKeys!1504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436792 () Bool)

(declare-fun e!257843 () Bool)

(assert (=> b!436792 (= e!257843 tp_is_empty!11473)))

(declare-fun b!436793 () Bool)

(assert (=> b!436793 (= e!257839 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1479 (ListLongMap!6579 tuple2!7676) ListLongMap!6579)

(assert (=> b!436793 (= (getCurrentListMapNoExtraKeys!1504 lt!201295 lt!201294 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1479 (getCurrentListMapNoExtraKeys!1504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7677 k0!794 v!412)))))

(declare-datatypes ((Unit!12975 0))(
  ( (Unit!12976) )
))
(declare-fun lt!201296 () Unit!12975)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!617 (array!26767 array!26769 (_ BitVec 32) (_ BitVec 32) V!16403 V!16403 (_ BitVec 32) (_ BitVec 64) V!16403 (_ BitVec 32) Int) Unit!12975)

(assert (=> b!436793 (= lt!201296 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!617 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436794 () Bool)

(declare-fun res!257634 () Bool)

(assert (=> b!436794 (=> (not res!257634) (not e!257842))))

(declare-fun arrayContainsKey!0 (array!26767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436794 (= res!257634 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436795 () Bool)

(declare-fun e!257840 () Bool)

(declare-fun mapRes!18831 () Bool)

(assert (=> b!436795 (= e!257840 (and e!257843 mapRes!18831))))

(declare-fun condMapEmpty!18831 () Bool)

(declare-fun mapDefault!18831 () ValueCell!5393)

(assert (=> b!436795 (= condMapEmpty!18831 (= (arr!12834 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5393)) mapDefault!18831)))))

(declare-fun b!436796 () Bool)

(declare-fun res!257633 () Bool)

(assert (=> b!436796 (=> (not res!257633) (not e!257842))))

(assert (=> b!436796 (= res!257633 (and (= (size!13187 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13186 _keys!709) (size!13187 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436797 () Bool)

(declare-fun res!257630 () Bool)

(assert (=> b!436797 (=> (not res!257630) (not e!257838))))

(assert (=> b!436797 (= res!257630 (bvsle from!863 i!563))))

(declare-fun b!436798 () Bool)

(declare-fun res!257623 () Bool)

(assert (=> b!436798 (=> (not res!257623) (not e!257842))))

(assert (=> b!436798 (= res!257623 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13186 _keys!709))))))

(declare-fun b!436799 () Bool)

(declare-fun res!257626 () Bool)

(assert (=> b!436799 (=> (not res!257626) (not e!257842))))

(declare-datatypes ((List!7664 0))(
  ( (Nil!7661) (Cons!7660 (h!8516 (_ BitVec 64)) (t!13411 List!7664)) )
))
(declare-fun arrayNoDuplicates!0 (array!26767 (_ BitVec 32) List!7664) Bool)

(assert (=> b!436799 (= res!257626 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7661))))

(declare-fun b!436800 () Bool)

(declare-fun res!257631 () Bool)

(assert (=> b!436800 (=> (not res!257631) (not e!257842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436800 (= res!257631 (validKeyInArray!0 k0!794))))

(declare-fun b!436801 () Bool)

(declare-fun res!257628 () Bool)

(assert (=> b!436801 (=> (not res!257628) (not e!257842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26767 (_ BitVec 32)) Bool)

(assert (=> b!436801 (= res!257628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!257624 () Bool)

(assert (=> start!40040 (=> (not res!257624) (not e!257842))))

(assert (=> start!40040 (= res!257624 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13186 _keys!709))))))

(assert (=> start!40040 e!257842))

(assert (=> start!40040 tp_is_empty!11473))

(assert (=> start!40040 tp!36491))

(assert (=> start!40040 true))

(declare-fun array_inv!9376 (array!26769) Bool)

(assert (=> start!40040 (and (array_inv!9376 _values!549) e!257840)))

(declare-fun array_inv!9377 (array!26767) Bool)

(assert (=> start!40040 (array_inv!9377 _keys!709)))

(declare-fun mapNonEmpty!18831 () Bool)

(declare-fun tp!36492 () Bool)

(assert (=> mapNonEmpty!18831 (= mapRes!18831 (and tp!36492 e!257844))))

(declare-fun mapValue!18831 () ValueCell!5393)

(declare-fun mapRest!18831 () (Array (_ BitVec 32) ValueCell!5393))

(declare-fun mapKey!18831 () (_ BitVec 32))

(assert (=> mapNonEmpty!18831 (= (arr!12834 _values!549) (store mapRest!18831 mapKey!18831 mapValue!18831))))

(declare-fun b!436802 () Bool)

(assert (=> b!436802 (= e!257842 e!257838)))

(declare-fun res!257627 () Bool)

(assert (=> b!436802 (=> (not res!257627) (not e!257838))))

(assert (=> b!436802 (= res!257627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201295 mask!1025))))

(assert (=> b!436802 (= lt!201295 (array!26768 (store (arr!12833 _keys!709) i!563 k0!794) (size!13186 _keys!709)))))

(declare-fun b!436803 () Bool)

(declare-fun res!257629 () Bool)

(assert (=> b!436803 (=> (not res!257629) (not e!257842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436803 (= res!257629 (validMask!0 mask!1025))))

(declare-fun b!436804 () Bool)

(declare-fun res!257632 () Bool)

(assert (=> b!436804 (=> (not res!257632) (not e!257838))))

(assert (=> b!436804 (= res!257632 (arrayNoDuplicates!0 lt!201295 #b00000000000000000000000000000000 Nil!7661))))

(declare-fun mapIsEmpty!18831 () Bool)

(assert (=> mapIsEmpty!18831 mapRes!18831))

(assert (= (and start!40040 res!257624) b!436803))

(assert (= (and b!436803 res!257629) b!436796))

(assert (= (and b!436796 res!257633) b!436801))

(assert (= (and b!436801 res!257628) b!436799))

(assert (= (and b!436799 res!257626) b!436798))

(assert (= (and b!436798 res!257623) b!436800))

(assert (= (and b!436800 res!257631) b!436789))

(assert (= (and b!436789 res!257622) b!436794))

(assert (= (and b!436794 res!257634) b!436802))

(assert (= (and b!436802 res!257627) b!436804))

(assert (= (and b!436804 res!257632) b!436797))

(assert (= (and b!436797 res!257630) b!436791))

(assert (= (and b!436791 res!257625) b!436793))

(assert (= (and b!436795 condMapEmpty!18831) mapIsEmpty!18831))

(assert (= (and b!436795 (not condMapEmpty!18831)) mapNonEmpty!18831))

(get-info :version)

(assert (= (and mapNonEmpty!18831 ((_ is ValueCellFull!5393) mapValue!18831)) b!436790))

(assert (= (and b!436795 ((_ is ValueCellFull!5393) mapDefault!18831)) b!436792))

(assert (= start!40040 b!436795))

(declare-fun m!424077 () Bool)

(assert (=> b!436801 m!424077))

(declare-fun m!424079 () Bool)

(assert (=> b!436799 m!424079))

(declare-fun m!424081 () Bool)

(assert (=> b!436800 m!424081))

(declare-fun m!424083 () Bool)

(assert (=> b!436802 m!424083))

(declare-fun m!424085 () Bool)

(assert (=> b!436802 m!424085))

(declare-fun m!424087 () Bool)

(assert (=> b!436791 m!424087))

(declare-fun m!424089 () Bool)

(assert (=> b!436791 m!424089))

(declare-fun m!424091 () Bool)

(assert (=> b!436791 m!424091))

(declare-fun m!424093 () Bool)

(assert (=> b!436794 m!424093))

(declare-fun m!424095 () Bool)

(assert (=> b!436803 m!424095))

(declare-fun m!424097 () Bool)

(assert (=> b!436789 m!424097))

(declare-fun m!424099 () Bool)

(assert (=> mapNonEmpty!18831 m!424099))

(declare-fun m!424101 () Bool)

(assert (=> b!436804 m!424101))

(declare-fun m!424103 () Bool)

(assert (=> start!40040 m!424103))

(declare-fun m!424105 () Bool)

(assert (=> start!40040 m!424105))

(declare-fun m!424107 () Bool)

(assert (=> b!436793 m!424107))

(declare-fun m!424109 () Bool)

(assert (=> b!436793 m!424109))

(assert (=> b!436793 m!424109))

(declare-fun m!424111 () Bool)

(assert (=> b!436793 m!424111))

(declare-fun m!424113 () Bool)

(assert (=> b!436793 m!424113))

(check-sat (not b!436804) (not b!436802) (not start!40040) (not b!436801) (not b!436791) tp_is_empty!11473 (not b_next!10321) (not b!436800) (not b!436799) (not b!436803) b_and!18263 (not b!436793) (not b!436794) (not mapNonEmpty!18831))
(check-sat b_and!18263 (not b_next!10321))
