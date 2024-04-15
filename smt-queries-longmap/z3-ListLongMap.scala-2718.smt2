; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40112 () Bool)

(assert start!40112)

(declare-fun b_free!10393 () Bool)

(declare-fun b_next!10393 () Bool)

(assert (=> start!40112 (= b_free!10393 (not b_next!10393))))

(declare-fun tp!36708 () Bool)

(declare-fun b_and!18335 () Bool)

(assert (=> start!40112 (= tp!36708 b_and!18335)))

(declare-fun b!438517 () Bool)

(declare-fun e!258599 () Bool)

(declare-fun e!258595 () Bool)

(assert (=> b!438517 (= e!258599 e!258595)))

(declare-fun res!259034 () Bool)

(assert (=> b!438517 (=> (not res!259034) (not e!258595))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438517 (= res!259034 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16499 0))(
  ( (V!16500 (val!5817 Int)) )
))
(declare-fun minValue!515 () V!16499)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16499)

(declare-datatypes ((tuple2!7738 0))(
  ( (tuple2!7739 (_1!3880 (_ BitVec 64)) (_2!3880 V!16499)) )
))
(declare-datatypes ((List!7725 0))(
  ( (Nil!7722) (Cons!7721 (h!8577 tuple2!7738) (t!13472 List!7725)) )
))
(declare-datatypes ((ListLongMap!6641 0))(
  ( (ListLongMap!6642 (toList!3336 List!7725)) )
))
(declare-fun lt!201833 () ListLongMap!6641)

(declare-datatypes ((array!26909 0))(
  ( (array!26910 (arr!12904 (Array (_ BitVec 32) (_ BitVec 64))) (size!13257 (_ BitVec 32))) )
))
(declare-fun lt!201836 () array!26909)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5429 0))(
  ( (ValueCellFull!5429 (v!8058 V!16499)) (EmptyCell!5429) )
))
(declare-datatypes ((array!26911 0))(
  ( (array!26912 (arr!12905 (Array (_ BitVec 32) ValueCell!5429)) (size!13258 (_ BitVec 32))) )
))
(declare-fun lt!201832 () array!26911)

(declare-fun getCurrentListMapNoExtraKeys!1535 (array!26909 array!26911 (_ BitVec 32) (_ BitVec 32) V!16499 V!16499 (_ BitVec 32) Int) ListLongMap!6641)

(assert (=> b!438517 (= lt!201833 (getCurrentListMapNoExtraKeys!1535 lt!201836 lt!201832 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26911)

(declare-fun v!412 () V!16499)

(assert (=> b!438517 (= lt!201832 (array!26912 (store (arr!12905 _values!549) i!563 (ValueCellFull!5429 v!412)) (size!13258 _values!549)))))

(declare-fun lt!201834 () ListLongMap!6641)

(declare-fun _keys!709 () array!26909)

(assert (=> b!438517 (= lt!201834 (getCurrentListMapNoExtraKeys!1535 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438518 () Bool)

(assert (=> b!438518 (= e!258595 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1503 (ListLongMap!6641 tuple2!7738) ListLongMap!6641)

(assert (=> b!438518 (= (getCurrentListMapNoExtraKeys!1535 lt!201836 lt!201832 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1503 (getCurrentListMapNoExtraKeys!1535 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7739 k0!794 v!412)))))

(declare-datatypes ((Unit!13023 0))(
  ( (Unit!13024) )
))
(declare-fun lt!201835 () Unit!13023)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!641 (array!26909 array!26911 (_ BitVec 32) (_ BitVec 32) V!16499 V!16499 (_ BitVec 32) (_ BitVec 64) V!16499 (_ BitVec 32) Int) Unit!13023)

(assert (=> b!438518 (= lt!201835 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!641 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438519 () Bool)

(declare-fun res!259026 () Bool)

(assert (=> b!438519 (=> (not res!259026) (not e!258599))))

(assert (=> b!438519 (= res!259026 (bvsle from!863 i!563))))

(declare-fun b!438521 () Bool)

(declare-fun res!259037 () Bool)

(declare-fun e!258596 () Bool)

(assert (=> b!438521 (=> (not res!259037) (not e!258596))))

(declare-fun arrayContainsKey!0 (array!26909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438521 (= res!259037 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438522 () Bool)

(declare-fun e!258598 () Bool)

(declare-fun e!258594 () Bool)

(declare-fun mapRes!18939 () Bool)

(assert (=> b!438522 (= e!258598 (and e!258594 mapRes!18939))))

(declare-fun condMapEmpty!18939 () Bool)

(declare-fun mapDefault!18939 () ValueCell!5429)

(assert (=> b!438522 (= condMapEmpty!18939 (= (arr!12905 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5429)) mapDefault!18939)))))

(declare-fun b!438523 () Bool)

(declare-fun res!259030 () Bool)

(assert (=> b!438523 (=> (not res!259030) (not e!258596))))

(declare-datatypes ((List!7726 0))(
  ( (Nil!7723) (Cons!7722 (h!8578 (_ BitVec 64)) (t!13473 List!7726)) )
))
(declare-fun arrayNoDuplicates!0 (array!26909 (_ BitVec 32) List!7726) Bool)

(assert (=> b!438523 (= res!259030 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7723))))

(declare-fun mapIsEmpty!18939 () Bool)

(assert (=> mapIsEmpty!18939 mapRes!18939))

(declare-fun b!438524 () Bool)

(declare-fun res!259033 () Bool)

(assert (=> b!438524 (=> (not res!259033) (not e!258599))))

(assert (=> b!438524 (= res!259033 (arrayNoDuplicates!0 lt!201836 #b00000000000000000000000000000000 Nil!7723))))

(declare-fun b!438525 () Bool)

(declare-fun res!259027 () Bool)

(assert (=> b!438525 (=> (not res!259027) (not e!258596))))

(assert (=> b!438525 (= res!259027 (or (= (select (arr!12904 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12904 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438526 () Bool)

(declare-fun res!259036 () Bool)

(assert (=> b!438526 (=> (not res!259036) (not e!258596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26909 (_ BitVec 32)) Bool)

(assert (=> b!438526 (= res!259036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438527 () Bool)

(declare-fun res!259038 () Bool)

(assert (=> b!438527 (=> (not res!259038) (not e!258596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438527 (= res!259038 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18939 () Bool)

(declare-fun tp!36707 () Bool)

(declare-fun e!258597 () Bool)

(assert (=> mapNonEmpty!18939 (= mapRes!18939 (and tp!36707 e!258597))))

(declare-fun mapKey!18939 () (_ BitVec 32))

(declare-fun mapValue!18939 () ValueCell!5429)

(declare-fun mapRest!18939 () (Array (_ BitVec 32) ValueCell!5429))

(assert (=> mapNonEmpty!18939 (= (arr!12905 _values!549) (store mapRest!18939 mapKey!18939 mapValue!18939))))

(declare-fun b!438528 () Bool)

(declare-fun res!259029 () Bool)

(assert (=> b!438528 (=> (not res!259029) (not e!258596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438528 (= res!259029 (validKeyInArray!0 k0!794))))

(declare-fun b!438529 () Bool)

(declare-fun res!259031 () Bool)

(assert (=> b!438529 (=> (not res!259031) (not e!258596))))

(assert (=> b!438529 (= res!259031 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13257 _keys!709))))))

(declare-fun b!438530 () Bool)

(declare-fun tp_is_empty!11545 () Bool)

(assert (=> b!438530 (= e!258594 tp_is_empty!11545)))

(declare-fun b!438531 () Bool)

(assert (=> b!438531 (= e!258597 tp_is_empty!11545)))

(declare-fun b!438532 () Bool)

(assert (=> b!438532 (= e!258596 e!258599)))

(declare-fun res!259032 () Bool)

(assert (=> b!438532 (=> (not res!259032) (not e!258599))))

(assert (=> b!438532 (= res!259032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201836 mask!1025))))

(assert (=> b!438532 (= lt!201836 (array!26910 (store (arr!12904 _keys!709) i!563 k0!794) (size!13257 _keys!709)))))

(declare-fun b!438520 () Bool)

(declare-fun res!259035 () Bool)

(assert (=> b!438520 (=> (not res!259035) (not e!258596))))

(assert (=> b!438520 (= res!259035 (and (= (size!13258 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13257 _keys!709) (size!13258 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!259028 () Bool)

(assert (=> start!40112 (=> (not res!259028) (not e!258596))))

(assert (=> start!40112 (= res!259028 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13257 _keys!709))))))

(assert (=> start!40112 e!258596))

(assert (=> start!40112 tp_is_empty!11545))

(assert (=> start!40112 tp!36708))

(assert (=> start!40112 true))

(declare-fun array_inv!9420 (array!26911) Bool)

(assert (=> start!40112 (and (array_inv!9420 _values!549) e!258598)))

(declare-fun array_inv!9421 (array!26909) Bool)

(assert (=> start!40112 (array_inv!9421 _keys!709)))

(assert (= (and start!40112 res!259028) b!438527))

(assert (= (and b!438527 res!259038) b!438520))

(assert (= (and b!438520 res!259035) b!438526))

(assert (= (and b!438526 res!259036) b!438523))

(assert (= (and b!438523 res!259030) b!438529))

(assert (= (and b!438529 res!259031) b!438528))

(assert (= (and b!438528 res!259029) b!438525))

(assert (= (and b!438525 res!259027) b!438521))

(assert (= (and b!438521 res!259037) b!438532))

(assert (= (and b!438532 res!259032) b!438524))

(assert (= (and b!438524 res!259033) b!438519))

(assert (= (and b!438519 res!259026) b!438517))

(assert (= (and b!438517 res!259034) b!438518))

(assert (= (and b!438522 condMapEmpty!18939) mapIsEmpty!18939))

(assert (= (and b!438522 (not condMapEmpty!18939)) mapNonEmpty!18939))

(get-info :version)

(assert (= (and mapNonEmpty!18939 ((_ is ValueCellFull!5429) mapValue!18939)) b!438531))

(assert (= (and b!438522 ((_ is ValueCellFull!5429) mapDefault!18939)) b!438530))

(assert (= start!40112 b!438522))

(declare-fun m!425445 () Bool)

(assert (=> b!438524 m!425445))

(declare-fun m!425447 () Bool)

(assert (=> mapNonEmpty!18939 m!425447))

(declare-fun m!425449 () Bool)

(assert (=> b!438532 m!425449))

(declare-fun m!425451 () Bool)

(assert (=> b!438532 m!425451))

(declare-fun m!425453 () Bool)

(assert (=> start!40112 m!425453))

(declare-fun m!425455 () Bool)

(assert (=> start!40112 m!425455))

(declare-fun m!425457 () Bool)

(assert (=> b!438525 m!425457))

(declare-fun m!425459 () Bool)

(assert (=> b!438521 m!425459))

(declare-fun m!425461 () Bool)

(assert (=> b!438523 m!425461))

(declare-fun m!425463 () Bool)

(assert (=> b!438518 m!425463))

(declare-fun m!425465 () Bool)

(assert (=> b!438518 m!425465))

(assert (=> b!438518 m!425465))

(declare-fun m!425467 () Bool)

(assert (=> b!438518 m!425467))

(declare-fun m!425469 () Bool)

(assert (=> b!438518 m!425469))

(declare-fun m!425471 () Bool)

(assert (=> b!438526 m!425471))

(declare-fun m!425473 () Bool)

(assert (=> b!438527 m!425473))

(declare-fun m!425475 () Bool)

(assert (=> b!438528 m!425475))

(declare-fun m!425477 () Bool)

(assert (=> b!438517 m!425477))

(declare-fun m!425479 () Bool)

(assert (=> b!438517 m!425479))

(declare-fun m!425481 () Bool)

(assert (=> b!438517 m!425481))

(check-sat (not b!438518) (not b!438526) tp_is_empty!11545 (not b!438517) (not b!438532) (not start!40112) (not b!438528) (not mapNonEmpty!18939) (not b!438521) b_and!18335 (not b!438524) (not b!438527) (not b!438523) (not b_next!10393))
(check-sat b_and!18335 (not b_next!10393))
