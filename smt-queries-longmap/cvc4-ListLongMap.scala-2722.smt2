; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40154 () Bool)

(assert start!40154)

(declare-fun b_free!10421 () Bool)

(declare-fun b_next!10421 () Bool)

(assert (=> start!40154 (= b_free!10421 (not b_next!10421))))

(declare-fun tp!36792 () Bool)

(declare-fun b_and!18389 () Bool)

(assert (=> start!40154 (= tp!36792 b_and!18389)))

(declare-fun b!439460 () Bool)

(declare-fun res!259702 () Bool)

(declare-fun e!259064 () Bool)

(assert (=> b!439460 (=> (not res!259702) (not e!259064))))

(declare-datatypes ((array!26963 0))(
  ( (array!26964 (arr!12931 (Array (_ BitVec 32) (_ BitVec 64))) (size!13283 (_ BitVec 32))) )
))
(declare-fun lt!202280 () array!26963)

(declare-datatypes ((List!7739 0))(
  ( (Nil!7736) (Cons!7735 (h!8591 (_ BitVec 64)) (t!13495 List!7739)) )
))
(declare-fun arrayNoDuplicates!0 (array!26963 (_ BitVec 32) List!7739) Bool)

(assert (=> b!439460 (= res!259702 (arrayNoDuplicates!0 lt!202280 #b00000000000000000000000000000000 Nil!7736))))

(declare-fun b!439461 () Bool)

(declare-fun e!259067 () Bool)

(declare-fun tp_is_empty!11573 () Bool)

(assert (=> b!439461 (= e!259067 tp_is_empty!11573)))

(declare-fun b!439463 () Bool)

(declare-fun e!259068 () Bool)

(assert (=> b!439463 (= e!259064 e!259068)))

(declare-fun res!259704 () Bool)

(assert (=> b!439463 (=> (not res!259704) (not e!259068))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439463 (= res!259704 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16535 0))(
  ( (V!16536 (val!5831 Int)) )
))
(declare-fun minValue!515 () V!16535)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7742 0))(
  ( (tuple2!7743 (_1!3882 (_ BitVec 64)) (_2!3882 V!16535)) )
))
(declare-datatypes ((List!7740 0))(
  ( (Nil!7737) (Cons!7736 (h!8592 tuple2!7742) (t!13496 List!7740)) )
))
(declare-datatypes ((ListLongMap!6655 0))(
  ( (ListLongMap!6656 (toList!3343 List!7740)) )
))
(declare-fun lt!202279 () ListLongMap!6655)

(declare-fun zeroValue!515 () V!16535)

(declare-datatypes ((ValueCell!5443 0))(
  ( (ValueCellFull!5443 (v!8078 V!16535)) (EmptyCell!5443) )
))
(declare-datatypes ((array!26965 0))(
  ( (array!26966 (arr!12932 (Array (_ BitVec 32) ValueCell!5443)) (size!13284 (_ BitVec 32))) )
))
(declare-fun lt!202277 () array!26965)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1532 (array!26963 array!26965 (_ BitVec 32) (_ BitVec 32) V!16535 V!16535 (_ BitVec 32) Int) ListLongMap!6655)

(assert (=> b!439463 (= lt!202279 (getCurrentListMapNoExtraKeys!1532 lt!202280 lt!202277 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16535)

(declare-fun _values!549 () array!26965)

(assert (=> b!439463 (= lt!202277 (array!26966 (store (arr!12932 _values!549) i!563 (ValueCellFull!5443 v!412)) (size!13284 _values!549)))))

(declare-fun _keys!709 () array!26963)

(declare-fun lt!202278 () ListLongMap!6655)

(assert (=> b!439463 (= lt!202278 (getCurrentListMapNoExtraKeys!1532 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439464 () Bool)

(assert (=> b!439464 (= e!259068 (not true))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1484 (ListLongMap!6655 tuple2!7742) ListLongMap!6655)

(assert (=> b!439464 (= (getCurrentListMapNoExtraKeys!1532 lt!202280 lt!202277 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1484 (getCurrentListMapNoExtraKeys!1532 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7743 k!794 v!412)))))

(declare-datatypes ((Unit!13072 0))(
  ( (Unit!13073) )
))
(declare-fun lt!202276 () Unit!13072)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!653 (array!26963 array!26965 (_ BitVec 32) (_ BitVec 32) V!16535 V!16535 (_ BitVec 32) (_ BitVec 64) V!16535 (_ BitVec 32) Int) Unit!13072)

(assert (=> b!439464 (= lt!202276 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439465 () Bool)

(declare-fun res!259713 () Bool)

(declare-fun e!259062 () Bool)

(assert (=> b!439465 (=> (not res!259713) (not e!259062))))

(assert (=> b!439465 (= res!259713 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7736))))

(declare-fun b!439466 () Bool)

(declare-fun res!259705 () Bool)

(assert (=> b!439466 (=> (not res!259705) (not e!259062))))

(assert (=> b!439466 (= res!259705 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13283 _keys!709))))))

(declare-fun b!439467 () Bool)

(declare-fun res!259709 () Bool)

(assert (=> b!439467 (=> (not res!259709) (not e!259062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439467 (= res!259709 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18981 () Bool)

(declare-fun mapRes!18981 () Bool)

(assert (=> mapIsEmpty!18981 mapRes!18981))

(declare-fun b!439468 () Bool)

(declare-fun res!259701 () Bool)

(assert (=> b!439468 (=> (not res!259701) (not e!259064))))

(assert (=> b!439468 (= res!259701 (bvsle from!863 i!563))))

(declare-fun b!439469 () Bool)

(assert (=> b!439469 (= e!259062 e!259064)))

(declare-fun res!259706 () Bool)

(assert (=> b!439469 (=> (not res!259706) (not e!259064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26963 (_ BitVec 32)) Bool)

(assert (=> b!439469 (= res!259706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202280 mask!1025))))

(assert (=> b!439469 (= lt!202280 (array!26964 (store (arr!12931 _keys!709) i!563 k!794) (size!13283 _keys!709)))))

(declare-fun b!439470 () Bool)

(declare-fun res!259703 () Bool)

(assert (=> b!439470 (=> (not res!259703) (not e!259062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439470 (= res!259703 (validKeyInArray!0 k!794))))

(declare-fun b!439471 () Bool)

(declare-fun res!259707 () Bool)

(assert (=> b!439471 (=> (not res!259707) (not e!259062))))

(assert (=> b!439471 (= res!259707 (and (= (size!13284 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13283 _keys!709) (size!13284 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18981 () Bool)

(declare-fun tp!36791 () Bool)

(assert (=> mapNonEmpty!18981 (= mapRes!18981 (and tp!36791 e!259067))))

(declare-fun mapValue!18981 () ValueCell!5443)

(declare-fun mapRest!18981 () (Array (_ BitVec 32) ValueCell!5443))

(declare-fun mapKey!18981 () (_ BitVec 32))

(assert (=> mapNonEmpty!18981 (= (arr!12932 _values!549) (store mapRest!18981 mapKey!18981 mapValue!18981))))

(declare-fun b!439472 () Bool)

(declare-fun e!259065 () Bool)

(assert (=> b!439472 (= e!259065 tp_is_empty!11573)))

(declare-fun b!439473 () Bool)

(declare-fun e!259063 () Bool)

(assert (=> b!439473 (= e!259063 (and e!259065 mapRes!18981))))

(declare-fun condMapEmpty!18981 () Bool)

(declare-fun mapDefault!18981 () ValueCell!5443)

