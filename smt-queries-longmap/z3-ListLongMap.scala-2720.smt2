; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40140 () Bool)

(assert start!40140)

(declare-fun b_free!10407 () Bool)

(declare-fun b_next!10407 () Bool)

(assert (=> start!40140 (= b_free!10407 (not b_next!10407))))

(declare-fun tp!36750 () Bool)

(declare-fun b_and!18375 () Bool)

(assert (=> start!40140 (= tp!36750 b_and!18375)))

(declare-fun b!439124 () Bool)

(declare-fun res!259440 () Bool)

(declare-fun e!258919 () Bool)

(assert (=> b!439124 (=> (not res!259440) (not e!258919))))

(declare-datatypes ((array!26935 0))(
  ( (array!26936 (arr!12917 (Array (_ BitVec 32) (_ BitVec 64))) (size!13269 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26935)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439124 (= res!259440 (or (= (select (arr!12917 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12917 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439125 () Bool)

(declare-fun e!258921 () Bool)

(declare-fun e!258915 () Bool)

(declare-fun mapRes!18960 () Bool)

(assert (=> b!439125 (= e!258921 (and e!258915 mapRes!18960))))

(declare-fun condMapEmpty!18960 () Bool)

(declare-datatypes ((V!16517 0))(
  ( (V!16518 (val!5824 Int)) )
))
(declare-datatypes ((ValueCell!5436 0))(
  ( (ValueCellFull!5436 (v!8071 V!16517)) (EmptyCell!5436) )
))
(declare-datatypes ((array!26937 0))(
  ( (array!26938 (arr!12918 (Array (_ BitVec 32) ValueCell!5436)) (size!13270 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26937)

(declare-fun mapDefault!18960 () ValueCell!5436)

(assert (=> b!439125 (= condMapEmpty!18960 (= (arr!12918 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5436)) mapDefault!18960)))))

(declare-fun mapNonEmpty!18960 () Bool)

(declare-fun tp!36749 () Bool)

(declare-fun e!258917 () Bool)

(assert (=> mapNonEmpty!18960 (= mapRes!18960 (and tp!36749 e!258917))))

(declare-fun mapKey!18960 () (_ BitVec 32))

(declare-fun mapValue!18960 () ValueCell!5436)

(declare-fun mapRest!18960 () (Array (_ BitVec 32) ValueCell!5436))

(assert (=> mapNonEmpty!18960 (= (arr!12918 _values!549) (store mapRest!18960 mapKey!18960 mapValue!18960))))

(declare-fun b!439126 () Bool)

(declare-fun res!259438 () Bool)

(assert (=> b!439126 (=> (not res!259438) (not e!258919))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439126 (= res!259438 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439127 () Bool)

(declare-fun res!259428 () Bool)

(assert (=> b!439127 (=> (not res!259428) (not e!258919))))

(declare-datatypes ((List!7729 0))(
  ( (Nil!7726) (Cons!7725 (h!8581 (_ BitVec 64)) (t!13485 List!7729)) )
))
(declare-fun arrayNoDuplicates!0 (array!26935 (_ BitVec 32) List!7729) Bool)

(assert (=> b!439127 (= res!259428 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7726))))

(declare-fun b!439128 () Bool)

(declare-fun res!259429 () Bool)

(declare-fun e!258916 () Bool)

(assert (=> b!439128 (=> (not res!259429) (not e!258916))))

(declare-fun lt!202175 () array!26935)

(assert (=> b!439128 (= res!259429 (arrayNoDuplicates!0 lt!202175 #b00000000000000000000000000000000 Nil!7726))))

(declare-fun mapIsEmpty!18960 () Bool)

(assert (=> mapIsEmpty!18960 mapRes!18960))

(declare-fun b!439129 () Bool)

(declare-fun res!259436 () Bool)

(assert (=> b!439129 (=> (not res!259436) (not e!258919))))

(assert (=> b!439129 (= res!259436 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13269 _keys!709))))))

(declare-fun b!439130 () Bool)

(declare-fun res!259430 () Bool)

(assert (=> b!439130 (=> (not res!259430) (not e!258919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439130 (= res!259430 (validKeyInArray!0 k0!794))))

(declare-fun b!439131 () Bool)

(declare-fun res!259432 () Bool)

(assert (=> b!439131 (=> (not res!259432) (not e!258919))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439131 (= res!259432 (validMask!0 mask!1025))))

(declare-fun b!439132 () Bool)

(declare-fun tp_is_empty!11559 () Bool)

(assert (=> b!439132 (= e!258915 tp_is_empty!11559)))

(declare-fun b!439133 () Bool)

(declare-fun res!259433 () Bool)

(assert (=> b!439133 (=> (not res!259433) (not e!258919))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!439133 (= res!259433 (and (= (size!13270 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13269 _keys!709) (size!13270 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!259435 () Bool)

(assert (=> start!40140 (=> (not res!259435) (not e!258919))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40140 (= res!259435 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13269 _keys!709))))))

(assert (=> start!40140 e!258919))

(assert (=> start!40140 tp_is_empty!11559))

(assert (=> start!40140 tp!36750))

(assert (=> start!40140 true))

(declare-fun array_inv!9384 (array!26937) Bool)

(assert (=> start!40140 (and (array_inv!9384 _values!549) e!258921)))

(declare-fun array_inv!9385 (array!26935) Bool)

(assert (=> start!40140 (array_inv!9385 _keys!709)))

(declare-fun b!439134 () Bool)

(declare-fun e!258920 () Bool)

(assert (=> b!439134 (= e!258920 (not true))))

(declare-fun minValue!515 () V!16517)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16517)

(declare-fun v!412 () V!16517)

(declare-fun lt!202172 () array!26937)

(declare-datatypes ((tuple2!7732 0))(
  ( (tuple2!7733 (_1!3877 (_ BitVec 64)) (_2!3877 V!16517)) )
))
(declare-datatypes ((List!7730 0))(
  ( (Nil!7727) (Cons!7726 (h!8582 tuple2!7732) (t!13486 List!7730)) )
))
(declare-datatypes ((ListLongMap!6645 0))(
  ( (ListLongMap!6646 (toList!3338 List!7730)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1527 (array!26935 array!26937 (_ BitVec 32) (_ BitVec 32) V!16517 V!16517 (_ BitVec 32) Int) ListLongMap!6645)

(declare-fun +!1479 (ListLongMap!6645 tuple2!7732) ListLongMap!6645)

(assert (=> b!439134 (= (getCurrentListMapNoExtraKeys!1527 lt!202175 lt!202172 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1479 (getCurrentListMapNoExtraKeys!1527 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7733 k0!794 v!412)))))

(declare-datatypes ((Unit!13062 0))(
  ( (Unit!13063) )
))
(declare-fun lt!202171 () Unit!13062)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!648 (array!26935 array!26937 (_ BitVec 32) (_ BitVec 32) V!16517 V!16517 (_ BitVec 32) (_ BitVec 64) V!16517 (_ BitVec 32) Int) Unit!13062)

(assert (=> b!439134 (= lt!202171 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!648 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439135 () Bool)

(assert (=> b!439135 (= e!258919 e!258916)))

(declare-fun res!259431 () Bool)

(assert (=> b!439135 (=> (not res!259431) (not e!258916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26935 (_ BitVec 32)) Bool)

(assert (=> b!439135 (= res!259431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202175 mask!1025))))

(assert (=> b!439135 (= lt!202175 (array!26936 (store (arr!12917 _keys!709) i!563 k0!794) (size!13269 _keys!709)))))

(declare-fun b!439136 () Bool)

(declare-fun res!259437 () Bool)

(assert (=> b!439136 (=> (not res!259437) (not e!258916))))

(assert (=> b!439136 (= res!259437 (bvsle from!863 i!563))))

(declare-fun b!439137 () Bool)

(declare-fun res!259439 () Bool)

(assert (=> b!439137 (=> (not res!259439) (not e!258919))))

(assert (=> b!439137 (= res!259439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439138 () Bool)

(assert (=> b!439138 (= e!258917 tp_is_empty!11559)))

(declare-fun b!439139 () Bool)

(assert (=> b!439139 (= e!258916 e!258920)))

(declare-fun res!259434 () Bool)

(assert (=> b!439139 (=> (not res!259434) (not e!258920))))

(assert (=> b!439139 (= res!259434 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202174 () ListLongMap!6645)

(assert (=> b!439139 (= lt!202174 (getCurrentListMapNoExtraKeys!1527 lt!202175 lt!202172 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439139 (= lt!202172 (array!26938 (store (arr!12918 _values!549) i!563 (ValueCellFull!5436 v!412)) (size!13270 _values!549)))))

(declare-fun lt!202173 () ListLongMap!6645)

(assert (=> b!439139 (= lt!202173 (getCurrentListMapNoExtraKeys!1527 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40140 res!259435) b!439131))

(assert (= (and b!439131 res!259432) b!439133))

(assert (= (and b!439133 res!259433) b!439137))

(assert (= (and b!439137 res!259439) b!439127))

(assert (= (and b!439127 res!259428) b!439129))

(assert (= (and b!439129 res!259436) b!439130))

(assert (= (and b!439130 res!259430) b!439124))

(assert (= (and b!439124 res!259440) b!439126))

(assert (= (and b!439126 res!259438) b!439135))

(assert (= (and b!439135 res!259431) b!439128))

(assert (= (and b!439128 res!259429) b!439136))

(assert (= (and b!439136 res!259437) b!439139))

(assert (= (and b!439139 res!259434) b!439134))

(assert (= (and b!439125 condMapEmpty!18960) mapIsEmpty!18960))

(assert (= (and b!439125 (not condMapEmpty!18960)) mapNonEmpty!18960))

(get-info :version)

(assert (= (and mapNonEmpty!18960 ((_ is ValueCellFull!5436) mapValue!18960)) b!439138))

(assert (= (and b!439125 ((_ is ValueCellFull!5436) mapDefault!18960)) b!439132))

(assert (= start!40140 b!439125))

(declare-fun m!426443 () Bool)

(assert (=> b!439139 m!426443))

(declare-fun m!426445 () Bool)

(assert (=> b!439139 m!426445))

(declare-fun m!426447 () Bool)

(assert (=> b!439139 m!426447))

(declare-fun m!426449 () Bool)

(assert (=> mapNonEmpty!18960 m!426449))

(declare-fun m!426451 () Bool)

(assert (=> b!439137 m!426451))

(declare-fun m!426453 () Bool)

(assert (=> b!439131 m!426453))

(declare-fun m!426455 () Bool)

(assert (=> b!439135 m!426455))

(declare-fun m!426457 () Bool)

(assert (=> b!439135 m!426457))

(declare-fun m!426459 () Bool)

(assert (=> b!439127 m!426459))

(declare-fun m!426461 () Bool)

(assert (=> b!439126 m!426461))

(declare-fun m!426463 () Bool)

(assert (=> b!439130 m!426463))

(declare-fun m!426465 () Bool)

(assert (=> b!439128 m!426465))

(declare-fun m!426467 () Bool)

(assert (=> b!439134 m!426467))

(declare-fun m!426469 () Bool)

(assert (=> b!439134 m!426469))

(assert (=> b!439134 m!426469))

(declare-fun m!426471 () Bool)

(assert (=> b!439134 m!426471))

(declare-fun m!426473 () Bool)

(assert (=> b!439134 m!426473))

(declare-fun m!426475 () Bool)

(assert (=> start!40140 m!426475))

(declare-fun m!426477 () Bool)

(assert (=> start!40140 m!426477))

(declare-fun m!426479 () Bool)

(assert (=> b!439124 m!426479))

(check-sat tp_is_empty!11559 (not b!439131) (not start!40140) (not b!439134) b_and!18375 (not mapNonEmpty!18960) (not b!439139) (not b!439135) (not b!439130) (not b!439127) (not b!439126) (not b_next!10407) (not b!439128) (not b!439137))
(check-sat b_and!18375 (not b_next!10407))
