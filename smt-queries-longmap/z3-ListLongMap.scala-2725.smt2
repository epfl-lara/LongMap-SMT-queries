; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40170 () Bool)

(assert start!40170)

(declare-fun b_free!10437 () Bool)

(declare-fun b_next!10437 () Bool)

(assert (=> start!40170 (= b_free!10437 (not b_next!10437))))

(declare-fun tp!36839 () Bool)

(declare-fun b_and!18405 () Bool)

(assert (=> start!40170 (= tp!36839 b_and!18405)))

(declare-fun mapIsEmpty!19005 () Bool)

(declare-fun mapRes!19005 () Bool)

(assert (=> mapIsEmpty!19005 mapRes!19005))

(declare-fun b!439844 () Bool)

(declare-fun e!259231 () Bool)

(assert (=> b!439844 (= e!259231 (not true))))

(declare-datatypes ((V!16557 0))(
  ( (V!16558 (val!5839 Int)) )
))
(declare-fun minValue!515 () V!16557)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5451 0))(
  ( (ValueCellFull!5451 (v!8086 V!16557)) (EmptyCell!5451) )
))
(declare-datatypes ((array!26993 0))(
  ( (array!26994 (arr!12946 (Array (_ BitVec 32) ValueCell!5451)) (size!13298 (_ BitVec 32))) )
))
(declare-fun lt!202399 () array!26993)

(declare-fun _values!549 () array!26993)

(declare-fun zeroValue!515 () V!16557)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26995 0))(
  ( (array!26996 (arr!12947 (Array (_ BitVec 32) (_ BitVec 64))) (size!13299 (_ BitVec 32))) )
))
(declare-fun lt!202397 () array!26995)

(declare-fun v!412 () V!16557)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26995)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7754 0))(
  ( (tuple2!7755 (_1!3888 (_ BitVec 64)) (_2!3888 V!16557)) )
))
(declare-datatypes ((List!7752 0))(
  ( (Nil!7749) (Cons!7748 (h!8604 tuple2!7754) (t!13508 List!7752)) )
))
(declare-datatypes ((ListLongMap!6667 0))(
  ( (ListLongMap!6668 (toList!3349 List!7752)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1538 (array!26995 array!26993 (_ BitVec 32) (_ BitVec 32) V!16557 V!16557 (_ BitVec 32) Int) ListLongMap!6667)

(declare-fun +!1489 (ListLongMap!6667 tuple2!7754) ListLongMap!6667)

(assert (=> b!439844 (= (getCurrentListMapNoExtraKeys!1538 lt!202397 lt!202399 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1489 (getCurrentListMapNoExtraKeys!1538 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7755 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13082 0))(
  ( (Unit!13083) )
))
(declare-fun lt!202396 () Unit!13082)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!658 (array!26995 array!26993 (_ BitVec 32) (_ BitVec 32) V!16557 V!16557 (_ BitVec 32) (_ BitVec 64) V!16557 (_ BitVec 32) Int) Unit!13082)

(assert (=> b!439844 (= lt!202396 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!658 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439845 () Bool)

(declare-fun e!259236 () Bool)

(declare-fun tp_is_empty!11589 () Bool)

(assert (=> b!439845 (= e!259236 tp_is_empty!11589)))

(declare-fun b!439847 () Bool)

(declare-fun res!260021 () Bool)

(declare-fun e!259232 () Bool)

(assert (=> b!439847 (=> (not res!260021) (not e!259232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439847 (= res!260021 (validKeyInArray!0 k0!794))))

(declare-fun b!439848 () Bool)

(declare-fun e!259235 () Bool)

(assert (=> b!439848 (= e!259232 e!259235)))

(declare-fun res!260013 () Bool)

(assert (=> b!439848 (=> (not res!260013) (not e!259235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26995 (_ BitVec 32)) Bool)

(assert (=> b!439848 (= res!260013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202397 mask!1025))))

(assert (=> b!439848 (= lt!202397 (array!26996 (store (arr!12947 _keys!709) i!563 k0!794) (size!13299 _keys!709)))))

(declare-fun b!439849 () Bool)

(declare-fun e!259234 () Bool)

(declare-fun e!259230 () Bool)

(assert (=> b!439849 (= e!259234 (and e!259230 mapRes!19005))))

(declare-fun condMapEmpty!19005 () Bool)

(declare-fun mapDefault!19005 () ValueCell!5451)

(assert (=> b!439849 (= condMapEmpty!19005 (= (arr!12946 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5451)) mapDefault!19005)))))

(declare-fun b!439850 () Bool)

(declare-fun res!260025 () Bool)

(assert (=> b!439850 (=> (not res!260025) (not e!259232))))

(assert (=> b!439850 (= res!260025 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13299 _keys!709))))))

(declare-fun b!439851 () Bool)

(declare-fun res!260015 () Bool)

(assert (=> b!439851 (=> (not res!260015) (not e!259232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439851 (= res!260015 (validMask!0 mask!1025))))

(declare-fun b!439852 () Bool)

(declare-fun res!260019 () Bool)

(assert (=> b!439852 (=> (not res!260019) (not e!259232))))

(declare-fun arrayContainsKey!0 (array!26995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439852 (= res!260019 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439853 () Bool)

(declare-fun res!260018 () Bool)

(assert (=> b!439853 (=> (not res!260018) (not e!259232))))

(assert (=> b!439853 (= res!260018 (and (= (size!13298 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13299 _keys!709) (size!13298 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439854 () Bool)

(declare-fun res!260014 () Bool)

(assert (=> b!439854 (=> (not res!260014) (not e!259232))))

(assert (=> b!439854 (= res!260014 (or (= (select (arr!12947 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12947 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19005 () Bool)

(declare-fun tp!36840 () Bool)

(assert (=> mapNonEmpty!19005 (= mapRes!19005 (and tp!36840 e!259236))))

(declare-fun mapValue!19005 () ValueCell!5451)

(declare-fun mapKey!19005 () (_ BitVec 32))

(declare-fun mapRest!19005 () (Array (_ BitVec 32) ValueCell!5451))

(assert (=> mapNonEmpty!19005 (= (arr!12946 _values!549) (store mapRest!19005 mapKey!19005 mapValue!19005))))

(declare-fun b!439855 () Bool)

(declare-fun res!260022 () Bool)

(assert (=> b!439855 (=> (not res!260022) (not e!259232))))

(assert (=> b!439855 (= res!260022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439856 () Bool)

(declare-fun res!260016 () Bool)

(assert (=> b!439856 (=> (not res!260016) (not e!259232))))

(declare-datatypes ((List!7753 0))(
  ( (Nil!7750) (Cons!7749 (h!8605 (_ BitVec 64)) (t!13509 List!7753)) )
))
(declare-fun arrayNoDuplicates!0 (array!26995 (_ BitVec 32) List!7753) Bool)

(assert (=> b!439856 (= res!260016 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7750))))

(declare-fun b!439857 () Bool)

(declare-fun res!260024 () Bool)

(assert (=> b!439857 (=> (not res!260024) (not e!259235))))

(assert (=> b!439857 (= res!260024 (bvsle from!863 i!563))))

(declare-fun b!439858 () Bool)

(assert (=> b!439858 (= e!259230 tp_is_empty!11589)))

(declare-fun b!439859 () Bool)

(declare-fun res!260017 () Bool)

(assert (=> b!439859 (=> (not res!260017) (not e!259235))))

(assert (=> b!439859 (= res!260017 (arrayNoDuplicates!0 lt!202397 #b00000000000000000000000000000000 Nil!7750))))

(declare-fun b!439846 () Bool)

(assert (=> b!439846 (= e!259235 e!259231)))

(declare-fun res!260023 () Bool)

(assert (=> b!439846 (=> (not res!260023) (not e!259231))))

(assert (=> b!439846 (= res!260023 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202400 () ListLongMap!6667)

(assert (=> b!439846 (= lt!202400 (getCurrentListMapNoExtraKeys!1538 lt!202397 lt!202399 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439846 (= lt!202399 (array!26994 (store (arr!12946 _values!549) i!563 (ValueCellFull!5451 v!412)) (size!13298 _values!549)))))

(declare-fun lt!202398 () ListLongMap!6667)

(assert (=> b!439846 (= lt!202398 (getCurrentListMapNoExtraKeys!1538 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!260020 () Bool)

(assert (=> start!40170 (=> (not res!260020) (not e!259232))))

(assert (=> start!40170 (= res!260020 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13299 _keys!709))))))

(assert (=> start!40170 e!259232))

(assert (=> start!40170 tp_is_empty!11589))

(assert (=> start!40170 tp!36839))

(assert (=> start!40170 true))

(declare-fun array_inv!9400 (array!26993) Bool)

(assert (=> start!40170 (and (array_inv!9400 _values!549) e!259234)))

(declare-fun array_inv!9401 (array!26995) Bool)

(assert (=> start!40170 (array_inv!9401 _keys!709)))

(assert (= (and start!40170 res!260020) b!439851))

(assert (= (and b!439851 res!260015) b!439853))

(assert (= (and b!439853 res!260018) b!439855))

(assert (= (and b!439855 res!260022) b!439856))

(assert (= (and b!439856 res!260016) b!439850))

(assert (= (and b!439850 res!260025) b!439847))

(assert (= (and b!439847 res!260021) b!439854))

(assert (= (and b!439854 res!260014) b!439852))

(assert (= (and b!439852 res!260019) b!439848))

(assert (= (and b!439848 res!260013) b!439859))

(assert (= (and b!439859 res!260017) b!439857))

(assert (= (and b!439857 res!260024) b!439846))

(assert (= (and b!439846 res!260023) b!439844))

(assert (= (and b!439849 condMapEmpty!19005) mapIsEmpty!19005))

(assert (= (and b!439849 (not condMapEmpty!19005)) mapNonEmpty!19005))

(get-info :version)

(assert (= (and mapNonEmpty!19005 ((_ is ValueCellFull!5451) mapValue!19005)) b!439845))

(assert (= (and b!439849 ((_ is ValueCellFull!5451) mapDefault!19005)) b!439858))

(assert (= start!40170 b!439849))

(declare-fun m!427013 () Bool)

(assert (=> b!439846 m!427013))

(declare-fun m!427015 () Bool)

(assert (=> b!439846 m!427015))

(declare-fun m!427017 () Bool)

(assert (=> b!439846 m!427017))

(declare-fun m!427019 () Bool)

(assert (=> b!439847 m!427019))

(declare-fun m!427021 () Bool)

(assert (=> b!439856 m!427021))

(declare-fun m!427023 () Bool)

(assert (=> start!40170 m!427023))

(declare-fun m!427025 () Bool)

(assert (=> start!40170 m!427025))

(declare-fun m!427027 () Bool)

(assert (=> b!439854 m!427027))

(declare-fun m!427029 () Bool)

(assert (=> b!439848 m!427029))

(declare-fun m!427031 () Bool)

(assert (=> b!439848 m!427031))

(declare-fun m!427033 () Bool)

(assert (=> b!439855 m!427033))

(declare-fun m!427035 () Bool)

(assert (=> b!439859 m!427035))

(declare-fun m!427037 () Bool)

(assert (=> b!439844 m!427037))

(declare-fun m!427039 () Bool)

(assert (=> b!439844 m!427039))

(assert (=> b!439844 m!427039))

(declare-fun m!427041 () Bool)

(assert (=> b!439844 m!427041))

(declare-fun m!427043 () Bool)

(assert (=> b!439844 m!427043))

(declare-fun m!427045 () Bool)

(assert (=> b!439852 m!427045))

(declare-fun m!427047 () Bool)

(assert (=> b!439851 m!427047))

(declare-fun m!427049 () Bool)

(assert (=> mapNonEmpty!19005 m!427049))

(check-sat tp_is_empty!11589 (not b!439846) (not b!439847) (not b!439851) (not start!40170) (not b!439844) b_and!18405 (not mapNonEmpty!19005) (not b!439859) (not b!439855) (not b!439856) (not b!439848) (not b!439852) (not b_next!10437))
(check-sat b_and!18405 (not b_next!10437))
