; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40112 () Bool)

(assert start!40112)

(declare-fun b_free!10393 () Bool)

(declare-fun b_next!10393 () Bool)

(assert (=> start!40112 (= b_free!10393 (not b_next!10393))))

(declare-fun tp!36707 () Bool)

(declare-fun b_and!18375 () Bool)

(assert (=> start!40112 (= tp!36707 b_and!18375)))

(declare-fun mapIsEmpty!18939 () Bool)

(declare-fun mapRes!18939 () Bool)

(assert (=> mapIsEmpty!18939 mapRes!18939))

(declare-fun b!438739 () Bool)

(declare-fun e!258742 () Bool)

(declare-fun e!258736 () Bool)

(assert (=> b!438739 (= e!258742 e!258736)))

(declare-fun res!259159 () Bool)

(assert (=> b!438739 (=> (not res!259159) (not e!258736))))

(declare-datatypes ((array!26912 0))(
  ( (array!26913 (arr!12905 (Array (_ BitVec 32) (_ BitVec 64))) (size!13257 (_ BitVec 32))) )
))
(declare-fun lt!202089 () array!26912)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26912 (_ BitVec 32)) Bool)

(assert (=> b!438739 (= res!259159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202089 mask!1025))))

(declare-fun _keys!709 () array!26912)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438739 (= lt!202089 (array!26913 (store (arr!12905 _keys!709) i!563 k0!794) (size!13257 _keys!709)))))

(declare-fun res!259158 () Bool)

(assert (=> start!40112 (=> (not res!259158) (not e!258742))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40112 (= res!259158 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13257 _keys!709))))))

(assert (=> start!40112 e!258742))

(declare-fun tp_is_empty!11545 () Bool)

(assert (=> start!40112 tp_is_empty!11545))

(assert (=> start!40112 tp!36707))

(assert (=> start!40112 true))

(declare-datatypes ((V!16499 0))(
  ( (V!16500 (val!5817 Int)) )
))
(declare-datatypes ((ValueCell!5429 0))(
  ( (ValueCellFull!5429 (v!8065 V!16499)) (EmptyCell!5429) )
))
(declare-datatypes ((array!26914 0))(
  ( (array!26915 (arr!12906 (Array (_ BitVec 32) ValueCell!5429)) (size!13258 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26914)

(declare-fun e!258738 () Bool)

(declare-fun array_inv!9438 (array!26914) Bool)

(assert (=> start!40112 (and (array_inv!9438 _values!549) e!258738)))

(declare-fun array_inv!9439 (array!26912) Bool)

(assert (=> start!40112 (array_inv!9439 _keys!709)))

(declare-fun b!438740 () Bool)

(declare-fun res!259162 () Bool)

(assert (=> b!438740 (=> (not res!259162) (not e!258742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438740 (= res!259162 (validMask!0 mask!1025))))

(declare-fun b!438741 () Bool)

(declare-fun e!258739 () Bool)

(assert (=> b!438741 (= e!258739 (not true))))

(declare-fun minValue!515 () V!16499)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16499)

(declare-fun lt!202087 () array!26914)

(declare-fun v!412 () V!16499)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7624 0))(
  ( (tuple2!7625 (_1!3823 (_ BitVec 64)) (_2!3823 V!16499)) )
))
(declare-datatypes ((List!7612 0))(
  ( (Nil!7609) (Cons!7608 (h!8464 tuple2!7624) (t!13360 List!7612)) )
))
(declare-datatypes ((ListLongMap!6539 0))(
  ( (ListLongMap!6540 (toList!3285 List!7612)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1518 (array!26912 array!26914 (_ BitVec 32) (_ BitVec 32) V!16499 V!16499 (_ BitVec 32) Int) ListLongMap!6539)

(declare-fun +!1480 (ListLongMap!6539 tuple2!7624) ListLongMap!6539)

(assert (=> b!438741 (= (getCurrentListMapNoExtraKeys!1518 lt!202089 lt!202087 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1480 (getCurrentListMapNoExtraKeys!1518 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7625 k0!794 v!412)))))

(declare-datatypes ((Unit!13035 0))(
  ( (Unit!13036) )
))
(declare-fun lt!202086 () Unit!13035)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!640 (array!26912 array!26914 (_ BitVec 32) (_ BitVec 32) V!16499 V!16499 (_ BitVec 32) (_ BitVec 64) V!16499 (_ BitVec 32) Int) Unit!13035)

(assert (=> b!438741 (= lt!202086 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!640 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438742 () Bool)

(declare-fun res!259154 () Bool)

(assert (=> b!438742 (=> (not res!259154) (not e!258742))))

(assert (=> b!438742 (= res!259154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438743 () Bool)

(declare-fun res!259161 () Bool)

(assert (=> b!438743 (=> (not res!259161) (not e!258742))))

(declare-datatypes ((List!7613 0))(
  ( (Nil!7610) (Cons!7609 (h!8465 (_ BitVec 64)) (t!13361 List!7613)) )
))
(declare-fun arrayNoDuplicates!0 (array!26912 (_ BitVec 32) List!7613) Bool)

(assert (=> b!438743 (= res!259161 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7610))))

(declare-fun b!438744 () Bool)

(assert (=> b!438744 (= e!258736 e!258739)))

(declare-fun res!259156 () Bool)

(assert (=> b!438744 (=> (not res!259156) (not e!258739))))

(assert (=> b!438744 (= res!259156 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202085 () ListLongMap!6539)

(assert (=> b!438744 (= lt!202085 (getCurrentListMapNoExtraKeys!1518 lt!202089 lt!202087 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438744 (= lt!202087 (array!26915 (store (arr!12906 _values!549) i!563 (ValueCellFull!5429 v!412)) (size!13258 _values!549)))))

(declare-fun lt!202088 () ListLongMap!6539)

(assert (=> b!438744 (= lt!202088 (getCurrentListMapNoExtraKeys!1518 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438745 () Bool)

(declare-fun e!258740 () Bool)

(assert (=> b!438745 (= e!258738 (and e!258740 mapRes!18939))))

(declare-fun condMapEmpty!18939 () Bool)

(declare-fun mapDefault!18939 () ValueCell!5429)

(assert (=> b!438745 (= condMapEmpty!18939 (= (arr!12906 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5429)) mapDefault!18939)))))

(declare-fun b!438746 () Bool)

(declare-fun res!259160 () Bool)

(assert (=> b!438746 (=> (not res!259160) (not e!258742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438746 (= res!259160 (validKeyInArray!0 k0!794))))

(declare-fun b!438747 () Bool)

(declare-fun res!259164 () Bool)

(assert (=> b!438747 (=> (not res!259164) (not e!258742))))

(assert (=> b!438747 (= res!259164 (or (= (select (arr!12905 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12905 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18939 () Bool)

(declare-fun tp!36708 () Bool)

(declare-fun e!258741 () Bool)

(assert (=> mapNonEmpty!18939 (= mapRes!18939 (and tp!36708 e!258741))))

(declare-fun mapValue!18939 () ValueCell!5429)

(declare-fun mapRest!18939 () (Array (_ BitVec 32) ValueCell!5429))

(declare-fun mapKey!18939 () (_ BitVec 32))

(assert (=> mapNonEmpty!18939 (= (arr!12906 _values!549) (store mapRest!18939 mapKey!18939 mapValue!18939))))

(declare-fun b!438748 () Bool)

(declare-fun res!259155 () Bool)

(assert (=> b!438748 (=> (not res!259155) (not e!258736))))

(assert (=> b!438748 (= res!259155 (arrayNoDuplicates!0 lt!202089 #b00000000000000000000000000000000 Nil!7610))))

(declare-fun b!438749 () Bool)

(declare-fun res!259152 () Bool)

(assert (=> b!438749 (=> (not res!259152) (not e!258742))))

(assert (=> b!438749 (= res!259152 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13257 _keys!709))))))

(declare-fun b!438750 () Bool)

(assert (=> b!438750 (= e!258741 tp_is_empty!11545)))

(declare-fun b!438751 () Bool)

(declare-fun res!259163 () Bool)

(assert (=> b!438751 (=> (not res!259163) (not e!258742))))

(declare-fun arrayContainsKey!0 (array!26912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438751 (= res!259163 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438752 () Bool)

(declare-fun res!259157 () Bool)

(assert (=> b!438752 (=> (not res!259157) (not e!258742))))

(assert (=> b!438752 (= res!259157 (and (= (size!13258 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13257 _keys!709) (size!13258 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438753 () Bool)

(declare-fun res!259153 () Bool)

(assert (=> b!438753 (=> (not res!259153) (not e!258736))))

(assert (=> b!438753 (= res!259153 (bvsle from!863 i!563))))

(declare-fun b!438754 () Bool)

(assert (=> b!438754 (= e!258740 tp_is_empty!11545)))

(assert (= (and start!40112 res!259158) b!438740))

(assert (= (and b!438740 res!259162) b!438752))

(assert (= (and b!438752 res!259157) b!438742))

(assert (= (and b!438742 res!259154) b!438743))

(assert (= (and b!438743 res!259161) b!438749))

(assert (= (and b!438749 res!259152) b!438746))

(assert (= (and b!438746 res!259160) b!438747))

(assert (= (and b!438747 res!259164) b!438751))

(assert (= (and b!438751 res!259163) b!438739))

(assert (= (and b!438739 res!259159) b!438748))

(assert (= (and b!438748 res!259155) b!438753))

(assert (= (and b!438753 res!259153) b!438744))

(assert (= (and b!438744 res!259156) b!438741))

(assert (= (and b!438745 condMapEmpty!18939) mapIsEmpty!18939))

(assert (= (and b!438745 (not condMapEmpty!18939)) mapNonEmpty!18939))

(get-info :version)

(assert (= (and mapNonEmpty!18939 ((_ is ValueCellFull!5429) mapValue!18939)) b!438750))

(assert (= (and b!438745 ((_ is ValueCellFull!5429) mapDefault!18939)) b!438754))

(assert (= start!40112 b!438745))

(declare-fun m!426395 () Bool)

(assert (=> b!438744 m!426395))

(declare-fun m!426397 () Bool)

(assert (=> b!438744 m!426397))

(declare-fun m!426399 () Bool)

(assert (=> b!438744 m!426399))

(declare-fun m!426401 () Bool)

(assert (=> start!40112 m!426401))

(declare-fun m!426403 () Bool)

(assert (=> start!40112 m!426403))

(declare-fun m!426405 () Bool)

(assert (=> b!438742 m!426405))

(declare-fun m!426407 () Bool)

(assert (=> b!438741 m!426407))

(declare-fun m!426409 () Bool)

(assert (=> b!438741 m!426409))

(assert (=> b!438741 m!426409))

(declare-fun m!426411 () Bool)

(assert (=> b!438741 m!426411))

(declare-fun m!426413 () Bool)

(assert (=> b!438741 m!426413))

(declare-fun m!426415 () Bool)

(assert (=> b!438748 m!426415))

(declare-fun m!426417 () Bool)

(assert (=> b!438747 m!426417))

(declare-fun m!426419 () Bool)

(assert (=> b!438746 m!426419))

(declare-fun m!426421 () Bool)

(assert (=> b!438740 m!426421))

(declare-fun m!426423 () Bool)

(assert (=> mapNonEmpty!18939 m!426423))

(declare-fun m!426425 () Bool)

(assert (=> b!438739 m!426425))

(declare-fun m!426427 () Bool)

(assert (=> b!438739 m!426427))

(declare-fun m!426429 () Bool)

(assert (=> b!438751 m!426429))

(declare-fun m!426431 () Bool)

(assert (=> b!438743 m!426431))

(check-sat (not b!438748) (not b!438742) (not b!438746) (not b!438744) (not b_next!10393) b_and!18375 (not b!438741) (not start!40112) (not b!438743) tp_is_empty!11545 (not b!438751) (not b!438739) (not mapNonEmpty!18939) (not b!438740))
(check-sat b_and!18375 (not b_next!10393))
