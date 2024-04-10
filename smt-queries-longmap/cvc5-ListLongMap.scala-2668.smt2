; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39826 () Bool)

(assert start!39826)

(declare-fun b_free!10093 () Bool)

(declare-fun b_next!10093 () Bool)

(assert (=> start!39826 (= b_free!10093 (not b_next!10093))))

(declare-fun tp!35807 () Bool)

(declare-fun b_and!17845 () Bool)

(assert (=> start!39826 (= tp!35807 b_and!17845)))

(declare-fun b!430084 () Bool)

(declare-fun res!252675 () Bool)

(declare-fun e!254652 () Bool)

(assert (=> b!430084 (=> (not res!252675) (not e!254652))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430084 (= res!252675 (bvsle from!863 i!563))))

(declare-fun b!430085 () Bool)

(declare-fun res!252662 () Bool)

(declare-fun e!254655 () Bool)

(assert (=> b!430085 (=> (not res!252662) (not e!254655))))

(declare-datatypes ((array!26325 0))(
  ( (array!26326 (arr!12612 (Array (_ BitVec 32) (_ BitVec 64))) (size!12964 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26325)

(assert (=> b!430085 (= res!252662 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12964 _keys!709))))))

(declare-fun b!430086 () Bool)

(declare-fun res!252671 () Bool)

(assert (=> b!430086 (=> (not res!252671) (not e!254655))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430086 (= res!252671 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!430087 () Bool)

(declare-fun e!254656 () Bool)

(declare-fun e!254660 () Bool)

(assert (=> b!430087 (= e!254656 e!254660)))

(declare-fun res!252663 () Bool)

(assert (=> b!430087 (=> res!252663 e!254660)))

(assert (=> b!430087 (= res!252663 (= k!794 (select (arr!12612 _keys!709) from!863)))))

(assert (=> b!430087 (not (= (select (arr!12612 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12648 0))(
  ( (Unit!12649) )
))
(declare-fun lt!196599 () Unit!12648)

(declare-fun e!254657 () Unit!12648)

(assert (=> b!430087 (= lt!196599 e!254657)))

(declare-fun c!55475 () Bool)

(assert (=> b!430087 (= c!55475 (= (select (arr!12612 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16099 0))(
  ( (V!16100 (val!5667 Int)) )
))
(declare-datatypes ((tuple2!7462 0))(
  ( (tuple2!7463 (_1!3742 (_ BitVec 64)) (_2!3742 V!16099)) )
))
(declare-datatypes ((List!7480 0))(
  ( (Nil!7477) (Cons!7476 (h!8332 tuple2!7462) (t!13022 List!7480)) )
))
(declare-datatypes ((ListLongMap!6375 0))(
  ( (ListLongMap!6376 (toList!3203 List!7480)) )
))
(declare-fun lt!196607 () ListLongMap!6375)

(declare-fun lt!196605 () ListLongMap!6375)

(assert (=> b!430087 (= lt!196607 lt!196605)))

(declare-fun lt!196606 () ListLongMap!6375)

(declare-fun lt!196609 () tuple2!7462)

(declare-fun +!1352 (ListLongMap!6375 tuple2!7462) ListLongMap!6375)

(assert (=> b!430087 (= lt!196605 (+!1352 lt!196606 lt!196609))))

(declare-fun lt!196604 () V!16099)

(assert (=> b!430087 (= lt!196609 (tuple2!7463 (select (arr!12612 _keys!709) from!863) lt!196604))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5279 0))(
  ( (ValueCellFull!5279 (v!7914 V!16099)) (EmptyCell!5279) )
))
(declare-datatypes ((array!26327 0))(
  ( (array!26328 (arr!12613 (Array (_ BitVec 32) ValueCell!5279)) (size!12965 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26327)

(declare-fun get!6258 (ValueCell!5279 V!16099) V!16099)

(declare-fun dynLambda!779 (Int (_ BitVec 64)) V!16099)

(assert (=> b!430087 (= lt!196604 (get!6258 (select (arr!12613 _values!549) from!863) (dynLambda!779 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430088 () Bool)

(declare-fun Unit!12650 () Unit!12648)

(assert (=> b!430088 (= e!254657 Unit!12650)))

(declare-fun b!430089 () Bool)

(declare-fun e!254654 () Bool)

(assert (=> b!430089 (= e!254652 e!254654)))

(declare-fun res!252673 () Bool)

(assert (=> b!430089 (=> (not res!252673) (not e!254654))))

(assert (=> b!430089 (= res!252673 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16099)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!196597 () array!26325)

(declare-fun minValue!515 () V!16099)

(declare-fun lt!196610 () array!26327)

(declare-fun getCurrentListMapNoExtraKeys!1405 (array!26325 array!26327 (_ BitVec 32) (_ BitVec 32) V!16099 V!16099 (_ BitVec 32) Int) ListLongMap!6375)

(assert (=> b!430089 (= lt!196607 (getCurrentListMapNoExtraKeys!1405 lt!196597 lt!196610 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16099)

(assert (=> b!430089 (= lt!196610 (array!26328 (store (arr!12613 _values!549) i!563 (ValueCellFull!5279 v!412)) (size!12965 _values!549)))))

(declare-fun lt!196598 () ListLongMap!6375)

(assert (=> b!430089 (= lt!196598 (getCurrentListMapNoExtraKeys!1405 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!252666 () Bool)

(assert (=> start!39826 (=> (not res!252666) (not e!254655))))

(assert (=> start!39826 (= res!252666 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12964 _keys!709))))))

(assert (=> start!39826 e!254655))

(declare-fun tp_is_empty!11245 () Bool)

(assert (=> start!39826 tp_is_empty!11245))

(assert (=> start!39826 tp!35807))

(assert (=> start!39826 true))

(declare-fun e!254659 () Bool)

(declare-fun array_inv!9184 (array!26327) Bool)

(assert (=> start!39826 (and (array_inv!9184 _values!549) e!254659)))

(declare-fun array_inv!9185 (array!26325) Bool)

(assert (=> start!39826 (array_inv!9185 _keys!709)))

(declare-fun b!430090 () Bool)

(assert (=> b!430090 (= e!254654 (not e!254656))))

(declare-fun res!252665 () Bool)

(assert (=> b!430090 (=> res!252665 e!254656)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430090 (= res!252665 (not (validKeyInArray!0 (select (arr!12612 _keys!709) from!863))))))

(declare-fun lt!196600 () ListLongMap!6375)

(assert (=> b!430090 (= lt!196600 lt!196606)))

(declare-fun lt!196608 () ListLongMap!6375)

(declare-fun lt!196601 () tuple2!7462)

(assert (=> b!430090 (= lt!196606 (+!1352 lt!196608 lt!196601))))

(assert (=> b!430090 (= lt!196600 (getCurrentListMapNoExtraKeys!1405 lt!196597 lt!196610 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430090 (= lt!196601 (tuple2!7463 k!794 v!412))))

(assert (=> b!430090 (= lt!196608 (getCurrentListMapNoExtraKeys!1405 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196603 () Unit!12648)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!541 (array!26325 array!26327 (_ BitVec 32) (_ BitVec 32) V!16099 V!16099 (_ BitVec 32) (_ BitVec 64) V!16099 (_ BitVec 32) Int) Unit!12648)

(assert (=> b!430090 (= lt!196603 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!541 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430091 () Bool)

(declare-fun res!252668 () Bool)

(assert (=> b!430091 (=> (not res!252668) (not e!254652))))

(declare-datatypes ((List!7481 0))(
  ( (Nil!7478) (Cons!7477 (h!8333 (_ BitVec 64)) (t!13023 List!7481)) )
))
(declare-fun arrayNoDuplicates!0 (array!26325 (_ BitVec 32) List!7481) Bool)

(assert (=> b!430091 (= res!252668 (arrayNoDuplicates!0 lt!196597 #b00000000000000000000000000000000 Nil!7478))))

(declare-fun b!430092 () Bool)

(declare-fun res!252661 () Bool)

(assert (=> b!430092 (=> (not res!252661) (not e!254655))))

(assert (=> b!430092 (= res!252661 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7478))))

(declare-fun b!430093 () Bool)

(declare-fun res!252670 () Bool)

(assert (=> b!430093 (=> (not res!252670) (not e!254655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26325 (_ BitVec 32)) Bool)

(assert (=> b!430093 (= res!252670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430094 () Bool)

(declare-fun res!252664 () Bool)

(assert (=> b!430094 (=> (not res!252664) (not e!254655))))

(assert (=> b!430094 (= res!252664 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!18489 () Bool)

(declare-fun mapRes!18489 () Bool)

(assert (=> mapIsEmpty!18489 mapRes!18489))

(declare-fun mapNonEmpty!18489 () Bool)

(declare-fun tp!35808 () Bool)

(declare-fun e!254661 () Bool)

(assert (=> mapNonEmpty!18489 (= mapRes!18489 (and tp!35808 e!254661))))

(declare-fun mapValue!18489 () ValueCell!5279)

(declare-fun mapKey!18489 () (_ BitVec 32))

(declare-fun mapRest!18489 () (Array (_ BitVec 32) ValueCell!5279))

(assert (=> mapNonEmpty!18489 (= (arr!12613 _values!549) (store mapRest!18489 mapKey!18489 mapValue!18489))))

(declare-fun b!430095 () Bool)

(declare-fun e!254653 () Bool)

(assert (=> b!430095 (= e!254653 tp_is_empty!11245)))

(declare-fun b!430096 () Bool)

(declare-fun res!252667 () Bool)

(assert (=> b!430096 (=> (not res!252667) (not e!254655))))

(assert (=> b!430096 (= res!252667 (and (= (size!12965 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12964 _keys!709) (size!12965 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430097 () Bool)

(declare-fun res!252669 () Bool)

(assert (=> b!430097 (=> (not res!252669) (not e!254655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430097 (= res!252669 (validMask!0 mask!1025))))

(declare-fun b!430098 () Bool)

(declare-fun res!252674 () Bool)

(assert (=> b!430098 (=> (not res!252674) (not e!254655))))

(assert (=> b!430098 (= res!252674 (or (= (select (arr!12612 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12612 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430099 () Bool)

(assert (=> b!430099 (= e!254661 tp_is_empty!11245)))

(declare-fun b!430100 () Bool)

(assert (=> b!430100 (= e!254659 (and e!254653 mapRes!18489))))

(declare-fun condMapEmpty!18489 () Bool)

(declare-fun mapDefault!18489 () ValueCell!5279)

