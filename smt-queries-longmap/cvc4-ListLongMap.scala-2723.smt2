; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40160 () Bool)

(assert start!40160)

(declare-fun b_free!10427 () Bool)

(declare-fun b_next!10427 () Bool)

(assert (=> start!40160 (= b_free!10427 (not b_next!10427))))

(declare-fun tp!36809 () Bool)

(declare-fun b_and!18395 () Bool)

(assert (=> start!40160 (= tp!36809 b_and!18395)))

(declare-fun b!439604 () Bool)

(declare-fun res!259818 () Bool)

(declare-fun e!259130 () Bool)

(assert (=> b!439604 (=> (not res!259818) (not e!259130))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439604 (= res!259818 (validMask!0 mask!1025))))

(declare-fun b!439605 () Bool)

(declare-fun res!259821 () Bool)

(declare-fun e!259127 () Bool)

(assert (=> b!439605 (=> (not res!259821) (not e!259127))))

(declare-datatypes ((array!26975 0))(
  ( (array!26976 (arr!12937 (Array (_ BitVec 32) (_ BitVec 64))) (size!13289 (_ BitVec 32))) )
))
(declare-fun lt!202322 () array!26975)

(declare-datatypes ((List!7745 0))(
  ( (Nil!7742) (Cons!7741 (h!8597 (_ BitVec 64)) (t!13501 List!7745)) )
))
(declare-fun arrayNoDuplicates!0 (array!26975 (_ BitVec 32) List!7745) Bool)

(assert (=> b!439605 (= res!259821 (arrayNoDuplicates!0 lt!202322 #b00000000000000000000000000000000 Nil!7742))))

(declare-fun b!439606 () Bool)

(declare-fun e!259129 () Bool)

(declare-fun tp_is_empty!11579 () Bool)

(assert (=> b!439606 (= e!259129 tp_is_empty!11579)))

(declare-fun b!439607 () Bool)

(declare-fun res!259820 () Bool)

(assert (=> b!439607 (=> (not res!259820) (not e!259130))))

(declare-fun _keys!709 () array!26975)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439607 (= res!259820 (or (= (select (arr!12937 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12937 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439608 () Bool)

(declare-fun res!259822 () Bool)

(assert (=> b!439608 (=> (not res!259822) (not e!259130))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439608 (= res!259822 (validKeyInArray!0 k!794))))

(declare-fun res!259828 () Bool)

(assert (=> start!40160 (=> (not res!259828) (not e!259130))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40160 (= res!259828 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13289 _keys!709))))))

(assert (=> start!40160 e!259130))

(assert (=> start!40160 tp_is_empty!11579))

(assert (=> start!40160 tp!36809))

(assert (=> start!40160 true))

(declare-datatypes ((V!16543 0))(
  ( (V!16544 (val!5834 Int)) )
))
(declare-datatypes ((ValueCell!5446 0))(
  ( (ValueCellFull!5446 (v!8081 V!16543)) (EmptyCell!5446) )
))
(declare-datatypes ((array!26977 0))(
  ( (array!26978 (arr!12938 (Array (_ BitVec 32) ValueCell!5446)) (size!13290 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26977)

(declare-fun e!259126 () Bool)

(declare-fun array_inv!9394 (array!26977) Bool)

(assert (=> start!40160 (and (array_inv!9394 _values!549) e!259126)))

(declare-fun array_inv!9395 (array!26975) Bool)

(assert (=> start!40160 (array_inv!9395 _keys!709)))

(declare-fun b!439609 () Bool)

(declare-fun res!259819 () Bool)

(assert (=> b!439609 (=> (not res!259819) (not e!259130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26975 (_ BitVec 32)) Bool)

(assert (=> b!439609 (= res!259819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439610 () Bool)

(declare-fun res!259823 () Bool)

(assert (=> b!439610 (=> (not res!259823) (not e!259130))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!439610 (= res!259823 (and (= (size!13290 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13289 _keys!709) (size!13290 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439611 () Bool)

(declare-fun res!259826 () Bool)

(assert (=> b!439611 (=> (not res!259826) (not e!259130))))

(declare-fun arrayContainsKey!0 (array!26975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439611 (= res!259826 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!439612 () Bool)

(declare-fun res!259825 () Bool)

(assert (=> b!439612 (=> (not res!259825) (not e!259130))))

(assert (=> b!439612 (= res!259825 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7742))))

(declare-fun mapNonEmpty!18990 () Bool)

(declare-fun mapRes!18990 () Bool)

(declare-fun tp!36810 () Bool)

(declare-fun e!259125 () Bool)

(assert (=> mapNonEmpty!18990 (= mapRes!18990 (and tp!36810 e!259125))))

(declare-fun mapKey!18990 () (_ BitVec 32))

(declare-fun mapValue!18990 () ValueCell!5446)

(declare-fun mapRest!18990 () (Array (_ BitVec 32) ValueCell!5446))

(assert (=> mapNonEmpty!18990 (= (arr!12938 _values!549) (store mapRest!18990 mapKey!18990 mapValue!18990))))

(declare-fun b!439613 () Bool)

(declare-fun e!259128 () Bool)

(assert (=> b!439613 (= e!259128 (not true))))

(declare-fun minValue!515 () V!16543)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16543)

(declare-fun lt!202325 () array!26977)

(declare-fun v!412 () V!16543)

(declare-datatypes ((tuple2!7748 0))(
  ( (tuple2!7749 (_1!3885 (_ BitVec 64)) (_2!3885 V!16543)) )
))
(declare-datatypes ((List!7746 0))(
  ( (Nil!7743) (Cons!7742 (h!8598 tuple2!7748) (t!13502 List!7746)) )
))
(declare-datatypes ((ListLongMap!6661 0))(
  ( (ListLongMap!6662 (toList!3346 List!7746)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1535 (array!26975 array!26977 (_ BitVec 32) (_ BitVec 32) V!16543 V!16543 (_ BitVec 32) Int) ListLongMap!6661)

(declare-fun +!1486 (ListLongMap!6661 tuple2!7748) ListLongMap!6661)

(assert (=> b!439613 (= (getCurrentListMapNoExtraKeys!1535 lt!202322 lt!202325 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1486 (getCurrentListMapNoExtraKeys!1535 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7749 k!794 v!412)))))

(declare-datatypes ((Unit!13076 0))(
  ( (Unit!13077) )
))
(declare-fun lt!202323 () Unit!13076)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!655 (array!26975 array!26977 (_ BitVec 32) (_ BitVec 32) V!16543 V!16543 (_ BitVec 32) (_ BitVec 64) V!16543 (_ BitVec 32) Int) Unit!13076)

(assert (=> b!439613 (= lt!202323 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!655 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439614 () Bool)

(declare-fun res!259827 () Bool)

(assert (=> b!439614 (=> (not res!259827) (not e!259130))))

(assert (=> b!439614 (= res!259827 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13289 _keys!709))))))

(declare-fun b!439615 () Bool)

(assert (=> b!439615 (= e!259130 e!259127)))

(declare-fun res!259829 () Bool)

(assert (=> b!439615 (=> (not res!259829) (not e!259127))))

(assert (=> b!439615 (= res!259829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202322 mask!1025))))

(assert (=> b!439615 (= lt!202322 (array!26976 (store (arr!12937 _keys!709) i!563 k!794) (size!13289 _keys!709)))))

(declare-fun b!439616 () Bool)

(assert (=> b!439616 (= e!259125 tp_is_empty!11579)))

(declare-fun b!439617 () Bool)

(assert (=> b!439617 (= e!259127 e!259128)))

(declare-fun res!259824 () Bool)

(assert (=> b!439617 (=> (not res!259824) (not e!259128))))

(assert (=> b!439617 (= res!259824 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202324 () ListLongMap!6661)

(assert (=> b!439617 (= lt!202324 (getCurrentListMapNoExtraKeys!1535 lt!202322 lt!202325 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439617 (= lt!202325 (array!26978 (store (arr!12938 _values!549) i!563 (ValueCellFull!5446 v!412)) (size!13290 _values!549)))))

(declare-fun lt!202321 () ListLongMap!6661)

(assert (=> b!439617 (= lt!202321 (getCurrentListMapNoExtraKeys!1535 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18990 () Bool)

(assert (=> mapIsEmpty!18990 mapRes!18990))

(declare-fun b!439618 () Bool)

(assert (=> b!439618 (= e!259126 (and e!259129 mapRes!18990))))

(declare-fun condMapEmpty!18990 () Bool)

(declare-fun mapDefault!18990 () ValueCell!5446)

