; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40146 () Bool)

(assert start!40146)

(declare-fun b_free!10413 () Bool)

(declare-fun b_next!10413 () Bool)

(assert (=> start!40146 (= b_free!10413 (not b_next!10413))))

(declare-fun tp!36768 () Bool)

(declare-fun b_and!18381 () Bool)

(assert (=> start!40146 (= tp!36768 b_and!18381)))

(declare-fun b!439268 () Bool)

(declare-fun res!259555 () Bool)

(declare-fun e!258984 () Bool)

(assert (=> b!439268 (=> (not res!259555) (not e!258984))))

(declare-datatypes ((array!26947 0))(
  ( (array!26948 (arr!12923 (Array (_ BitVec 32) (_ BitVec 64))) (size!13275 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26947)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16525 0))(
  ( (V!16526 (val!5827 Int)) )
))
(declare-datatypes ((ValueCell!5439 0))(
  ( (ValueCellFull!5439 (v!8074 V!16525)) (EmptyCell!5439) )
))
(declare-datatypes ((array!26949 0))(
  ( (array!26950 (arr!12924 (Array (_ BitVec 32) ValueCell!5439)) (size!13276 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26949)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!439268 (= res!259555 (and (= (size!13276 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13275 _keys!709) (size!13276 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439269 () Bool)

(declare-fun res!259546 () Bool)

(assert (=> b!439269 (=> (not res!259546) (not e!258984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26947 (_ BitVec 32)) Bool)

(assert (=> b!439269 (= res!259546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439271 () Bool)

(declare-fun e!258982 () Bool)

(declare-fun e!258979 () Bool)

(declare-fun mapRes!18969 () Bool)

(assert (=> b!439271 (= e!258982 (and e!258979 mapRes!18969))))

(declare-fun condMapEmpty!18969 () Bool)

(declare-fun mapDefault!18969 () ValueCell!5439)

(assert (=> b!439271 (= condMapEmpty!18969 (= (arr!12924 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5439)) mapDefault!18969)))))

(declare-fun b!439272 () Bool)

(declare-fun e!258978 () Bool)

(assert (=> b!439272 (= e!258978 (not true))))

(declare-fun minValue!515 () V!16525)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202218 () array!26949)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16525)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16525)

(declare-fun lt!202217 () array!26947)

(declare-datatypes ((tuple2!7738 0))(
  ( (tuple2!7739 (_1!3880 (_ BitVec 64)) (_2!3880 V!16525)) )
))
(declare-datatypes ((List!7734 0))(
  ( (Nil!7731) (Cons!7730 (h!8586 tuple2!7738) (t!13490 List!7734)) )
))
(declare-datatypes ((ListLongMap!6651 0))(
  ( (ListLongMap!6652 (toList!3341 List!7734)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1530 (array!26947 array!26949 (_ BitVec 32) (_ BitVec 32) V!16525 V!16525 (_ BitVec 32) Int) ListLongMap!6651)

(declare-fun +!1482 (ListLongMap!6651 tuple2!7738) ListLongMap!6651)

(assert (=> b!439272 (= (getCurrentListMapNoExtraKeys!1530 lt!202217 lt!202218 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1482 (getCurrentListMapNoExtraKeys!1530 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7739 k0!794 v!412)))))

(declare-datatypes ((Unit!13068 0))(
  ( (Unit!13069) )
))
(declare-fun lt!202216 () Unit!13068)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!651 (array!26947 array!26949 (_ BitVec 32) (_ BitVec 32) V!16525 V!16525 (_ BitVec 32) (_ BitVec 64) V!16525 (_ BitVec 32) Int) Unit!13068)

(assert (=> b!439272 (= lt!202216 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!651 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439273 () Bool)

(declare-fun res!259547 () Bool)

(assert (=> b!439273 (=> (not res!259547) (not e!258984))))

(declare-fun arrayContainsKey!0 (array!26947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439273 (= res!259547 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439274 () Bool)

(declare-fun res!259550 () Bool)

(assert (=> b!439274 (=> (not res!259550) (not e!258984))))

(assert (=> b!439274 (= res!259550 (or (= (select (arr!12923 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12923 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18969 () Bool)

(declare-fun tp!36767 () Bool)

(declare-fun e!258983 () Bool)

(assert (=> mapNonEmpty!18969 (= mapRes!18969 (and tp!36767 e!258983))))

(declare-fun mapKey!18969 () (_ BitVec 32))

(declare-fun mapRest!18969 () (Array (_ BitVec 32) ValueCell!5439))

(declare-fun mapValue!18969 () ValueCell!5439)

(assert (=> mapNonEmpty!18969 (= (arr!12924 _values!549) (store mapRest!18969 mapKey!18969 mapValue!18969))))

(declare-fun b!439275 () Bool)

(declare-fun res!259553 () Bool)

(assert (=> b!439275 (=> (not res!259553) (not e!258984))))

(assert (=> b!439275 (= res!259553 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13275 _keys!709))))))

(declare-fun b!439276 () Bool)

(declare-fun res!259552 () Bool)

(assert (=> b!439276 (=> (not res!259552) (not e!258984))))

(declare-datatypes ((List!7735 0))(
  ( (Nil!7732) (Cons!7731 (h!8587 (_ BitVec 64)) (t!13491 List!7735)) )
))
(declare-fun arrayNoDuplicates!0 (array!26947 (_ BitVec 32) List!7735) Bool)

(assert (=> b!439276 (= res!259552 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7732))))

(declare-fun b!439277 () Bool)

(declare-fun res!259556 () Bool)

(declare-fun e!258981 () Bool)

(assert (=> b!439277 (=> (not res!259556) (not e!258981))))

(assert (=> b!439277 (= res!259556 (bvsle from!863 i!563))))

(declare-fun b!439278 () Bool)

(declare-fun res!259551 () Bool)

(assert (=> b!439278 (=> (not res!259551) (not e!258984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439278 (= res!259551 (validMask!0 mask!1025))))

(declare-fun b!439270 () Bool)

(declare-fun res!259557 () Bool)

(assert (=> b!439270 (=> (not res!259557) (not e!258981))))

(assert (=> b!439270 (= res!259557 (arrayNoDuplicates!0 lt!202217 #b00000000000000000000000000000000 Nil!7732))))

(declare-fun res!259549 () Bool)

(assert (=> start!40146 (=> (not res!259549) (not e!258984))))

(assert (=> start!40146 (= res!259549 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13275 _keys!709))))))

(assert (=> start!40146 e!258984))

(declare-fun tp_is_empty!11565 () Bool)

(assert (=> start!40146 tp_is_empty!11565))

(assert (=> start!40146 tp!36768))

(assert (=> start!40146 true))

(declare-fun array_inv!9386 (array!26949) Bool)

(assert (=> start!40146 (and (array_inv!9386 _values!549) e!258982)))

(declare-fun array_inv!9387 (array!26947) Bool)

(assert (=> start!40146 (array_inv!9387 _keys!709)))

(declare-fun b!439279 () Bool)

(assert (=> b!439279 (= e!258979 tp_is_empty!11565)))

(declare-fun b!439280 () Bool)

(declare-fun res!259554 () Bool)

(assert (=> b!439280 (=> (not res!259554) (not e!258984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439280 (= res!259554 (validKeyInArray!0 k0!794))))

(declare-fun b!439281 () Bool)

(assert (=> b!439281 (= e!258983 tp_is_empty!11565)))

(declare-fun b!439282 () Bool)

(assert (=> b!439282 (= e!258984 e!258981)))

(declare-fun res!259548 () Bool)

(assert (=> b!439282 (=> (not res!259548) (not e!258981))))

(assert (=> b!439282 (= res!259548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202217 mask!1025))))

(assert (=> b!439282 (= lt!202217 (array!26948 (store (arr!12923 _keys!709) i!563 k0!794) (size!13275 _keys!709)))))

(declare-fun mapIsEmpty!18969 () Bool)

(assert (=> mapIsEmpty!18969 mapRes!18969))

(declare-fun b!439283 () Bool)

(assert (=> b!439283 (= e!258981 e!258978)))

(declare-fun res!259545 () Bool)

(assert (=> b!439283 (=> (not res!259545) (not e!258978))))

(assert (=> b!439283 (= res!259545 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202219 () ListLongMap!6651)

(assert (=> b!439283 (= lt!202219 (getCurrentListMapNoExtraKeys!1530 lt!202217 lt!202218 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439283 (= lt!202218 (array!26950 (store (arr!12924 _values!549) i!563 (ValueCellFull!5439 v!412)) (size!13276 _values!549)))))

(declare-fun lt!202220 () ListLongMap!6651)

(assert (=> b!439283 (= lt!202220 (getCurrentListMapNoExtraKeys!1530 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40146 res!259549) b!439278))

(assert (= (and b!439278 res!259551) b!439268))

(assert (= (and b!439268 res!259555) b!439269))

(assert (= (and b!439269 res!259546) b!439276))

(assert (= (and b!439276 res!259552) b!439275))

(assert (= (and b!439275 res!259553) b!439280))

(assert (= (and b!439280 res!259554) b!439274))

(assert (= (and b!439274 res!259550) b!439273))

(assert (= (and b!439273 res!259547) b!439282))

(assert (= (and b!439282 res!259548) b!439270))

(assert (= (and b!439270 res!259557) b!439277))

(assert (= (and b!439277 res!259556) b!439283))

(assert (= (and b!439283 res!259545) b!439272))

(assert (= (and b!439271 condMapEmpty!18969) mapIsEmpty!18969))

(assert (= (and b!439271 (not condMapEmpty!18969)) mapNonEmpty!18969))

(get-info :version)

(assert (= (and mapNonEmpty!18969 ((_ is ValueCellFull!5439) mapValue!18969)) b!439281))

(assert (= (and b!439271 ((_ is ValueCellFull!5439) mapDefault!18969)) b!439279))

(assert (= start!40146 b!439271))

(declare-fun m!426557 () Bool)

(assert (=> start!40146 m!426557))

(declare-fun m!426559 () Bool)

(assert (=> start!40146 m!426559))

(declare-fun m!426561 () Bool)

(assert (=> mapNonEmpty!18969 m!426561))

(declare-fun m!426563 () Bool)

(assert (=> b!439273 m!426563))

(declare-fun m!426565 () Bool)

(assert (=> b!439278 m!426565))

(declare-fun m!426567 () Bool)

(assert (=> b!439280 m!426567))

(declare-fun m!426569 () Bool)

(assert (=> b!439269 m!426569))

(declare-fun m!426571 () Bool)

(assert (=> b!439283 m!426571))

(declare-fun m!426573 () Bool)

(assert (=> b!439283 m!426573))

(declare-fun m!426575 () Bool)

(assert (=> b!439283 m!426575))

(declare-fun m!426577 () Bool)

(assert (=> b!439282 m!426577))

(declare-fun m!426579 () Bool)

(assert (=> b!439282 m!426579))

(declare-fun m!426581 () Bool)

(assert (=> b!439274 m!426581))

(declare-fun m!426583 () Bool)

(assert (=> b!439276 m!426583))

(declare-fun m!426585 () Bool)

(assert (=> b!439272 m!426585))

(declare-fun m!426587 () Bool)

(assert (=> b!439272 m!426587))

(assert (=> b!439272 m!426587))

(declare-fun m!426589 () Bool)

(assert (=> b!439272 m!426589))

(declare-fun m!426591 () Bool)

(assert (=> b!439272 m!426591))

(declare-fun m!426593 () Bool)

(assert (=> b!439270 m!426593))

(check-sat (not b!439276) (not b_next!10413) (not b!439278) (not start!40146) (not mapNonEmpty!18969) (not b!439270) b_and!18381 (not b!439283) (not b!439280) (not b!439272) (not b!439269) (not b!439282) tp_is_empty!11565 (not b!439273))
(check-sat b_and!18381 (not b_next!10413))
