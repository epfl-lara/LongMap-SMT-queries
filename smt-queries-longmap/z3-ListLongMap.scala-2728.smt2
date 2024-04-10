; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40188 () Bool)

(assert start!40188)

(declare-fun b_free!10455 () Bool)

(declare-fun b_next!10455 () Bool)

(assert (=> start!40188 (= b_free!10455 (not b_next!10455))))

(declare-fun tp!36894 () Bool)

(declare-fun b_and!18423 () Bool)

(assert (=> start!40188 (= tp!36894 b_and!18423)))

(declare-fun b!440276 () Bool)

(declare-fun res!260370 () Bool)

(declare-fun e!259419 () Bool)

(assert (=> b!440276 (=> (not res!260370) (not e!259419))))

(declare-datatypes ((array!27027 0))(
  ( (array!27028 (arr!12963 (Array (_ BitVec 32) (_ BitVec 64))) (size!13315 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27027)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27027 (_ BitVec 32)) Bool)

(assert (=> b!440276 (= res!260370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440277 () Bool)

(declare-fun res!260375 () Bool)

(declare-fun e!259420 () Bool)

(assert (=> b!440277 (=> (not res!260375) (not e!259420))))

(declare-fun lt!202535 () array!27027)

(declare-datatypes ((List!7768 0))(
  ( (Nil!7765) (Cons!7764 (h!8620 (_ BitVec 64)) (t!13524 List!7768)) )
))
(declare-fun arrayNoDuplicates!0 (array!27027 (_ BitVec 32) List!7768) Bool)

(assert (=> b!440277 (= res!260375 (arrayNoDuplicates!0 lt!202535 #b00000000000000000000000000000000 Nil!7765))))

(declare-fun b!440278 () Bool)

(declare-fun res!260374 () Bool)

(assert (=> b!440278 (=> (not res!260374) (not e!259420))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440278 (= res!260374 (bvsle from!863 i!563))))

(declare-fun b!440279 () Bool)

(declare-fun res!260365 () Bool)

(assert (=> b!440279 (=> (not res!260365) (not e!259419))))

(assert (=> b!440279 (= res!260365 (or (= (select (arr!12963 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12963 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!260372 () Bool)

(assert (=> start!40188 (=> (not res!260372) (not e!259419))))

(assert (=> start!40188 (= res!260372 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13315 _keys!709))))))

(assert (=> start!40188 e!259419))

(declare-fun tp_is_empty!11607 () Bool)

(assert (=> start!40188 tp_is_empty!11607))

(assert (=> start!40188 tp!36894))

(assert (=> start!40188 true))

(declare-datatypes ((V!16581 0))(
  ( (V!16582 (val!5848 Int)) )
))
(declare-datatypes ((ValueCell!5460 0))(
  ( (ValueCellFull!5460 (v!8095 V!16581)) (EmptyCell!5460) )
))
(declare-datatypes ((array!27029 0))(
  ( (array!27030 (arr!12964 (Array (_ BitVec 32) ValueCell!5460)) (size!13316 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27029)

(declare-fun e!259423 () Bool)

(declare-fun array_inv!9410 (array!27029) Bool)

(assert (=> start!40188 (and (array_inv!9410 _values!549) e!259423)))

(declare-fun array_inv!9411 (array!27027) Bool)

(assert (=> start!40188 (array_inv!9411 _keys!709)))

(declare-fun b!440280 () Bool)

(declare-fun res!260373 () Bool)

(assert (=> b!440280 (=> (not res!260373) (not e!259419))))

(assert (=> b!440280 (= res!260373 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13315 _keys!709))))))

(declare-fun mapNonEmpty!19032 () Bool)

(declare-fun mapRes!19032 () Bool)

(declare-fun tp!36893 () Bool)

(declare-fun e!259425 () Bool)

(assert (=> mapNonEmpty!19032 (= mapRes!19032 (and tp!36893 e!259425))))

(declare-fun mapValue!19032 () ValueCell!5460)

(declare-fun mapKey!19032 () (_ BitVec 32))

(declare-fun mapRest!19032 () (Array (_ BitVec 32) ValueCell!5460))

(assert (=> mapNonEmpty!19032 (= (arr!12964 _values!549) (store mapRest!19032 mapKey!19032 mapValue!19032))))

(declare-fun b!440281 () Bool)

(declare-fun res!260369 () Bool)

(assert (=> b!440281 (=> (not res!260369) (not e!259419))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!440281 (= res!260369 (and (= (size!13316 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13315 _keys!709) (size!13316 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19032 () Bool)

(assert (=> mapIsEmpty!19032 mapRes!19032))

(declare-fun b!440282 () Bool)

(declare-fun res!260366 () Bool)

(assert (=> b!440282 (=> (not res!260366) (not e!259419))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440282 (= res!260366 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440283 () Bool)

(declare-fun res!260368 () Bool)

(assert (=> b!440283 (=> (not res!260368) (not e!259419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440283 (= res!260368 (validMask!0 mask!1025))))

(declare-fun b!440284 () Bool)

(declare-fun e!259422 () Bool)

(assert (=> b!440284 (= e!259422 tp_is_empty!11607)))

(declare-fun b!440285 () Bool)

(declare-fun res!260367 () Bool)

(assert (=> b!440285 (=> (not res!260367) (not e!259419))))

(assert (=> b!440285 (= res!260367 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7765))))

(declare-fun b!440286 () Bool)

(assert (=> b!440286 (= e!259419 e!259420)))

(declare-fun res!260371 () Bool)

(assert (=> b!440286 (=> (not res!260371) (not e!259420))))

(assert (=> b!440286 (= res!260371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202535 mask!1025))))

(assert (=> b!440286 (= lt!202535 (array!27028 (store (arr!12963 _keys!709) i!563 k0!794) (size!13315 _keys!709)))))

(declare-fun b!440287 () Bool)

(assert (=> b!440287 (= e!259425 tp_is_empty!11607)))

(declare-fun b!440288 () Bool)

(declare-fun e!259421 () Bool)

(assert (=> b!440288 (= e!259420 e!259421)))

(declare-fun res!260364 () Bool)

(assert (=> b!440288 (=> (not res!260364) (not e!259421))))

(assert (=> b!440288 (= res!260364 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16581)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202532 () array!27029)

(declare-datatypes ((tuple2!7770 0))(
  ( (tuple2!7771 (_1!3896 (_ BitVec 64)) (_2!3896 V!16581)) )
))
(declare-datatypes ((List!7769 0))(
  ( (Nil!7766) (Cons!7765 (h!8621 tuple2!7770) (t!13525 List!7769)) )
))
(declare-datatypes ((ListLongMap!6683 0))(
  ( (ListLongMap!6684 (toList!3357 List!7769)) )
))
(declare-fun lt!202534 () ListLongMap!6683)

(declare-fun zeroValue!515 () V!16581)

(declare-fun getCurrentListMapNoExtraKeys!1546 (array!27027 array!27029 (_ BitVec 32) (_ BitVec 32) V!16581 V!16581 (_ BitVec 32) Int) ListLongMap!6683)

(assert (=> b!440288 (= lt!202534 (getCurrentListMapNoExtraKeys!1546 lt!202535 lt!202532 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16581)

(assert (=> b!440288 (= lt!202532 (array!27030 (store (arr!12964 _values!549) i!563 (ValueCellFull!5460 v!412)) (size!13316 _values!549)))))

(declare-fun lt!202531 () ListLongMap!6683)

(assert (=> b!440288 (= lt!202531 (getCurrentListMapNoExtraKeys!1546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440289 () Bool)

(assert (=> b!440289 (= e!259421 (not true))))

(declare-fun +!1496 (ListLongMap!6683 tuple2!7770) ListLongMap!6683)

(assert (=> b!440289 (= (getCurrentListMapNoExtraKeys!1546 lt!202535 lt!202532 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1496 (getCurrentListMapNoExtraKeys!1546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7771 k0!794 v!412)))))

(declare-datatypes ((Unit!13096 0))(
  ( (Unit!13097) )
))
(declare-fun lt!202533 () Unit!13096)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!665 (array!27027 array!27029 (_ BitVec 32) (_ BitVec 32) V!16581 V!16581 (_ BitVec 32) (_ BitVec 64) V!16581 (_ BitVec 32) Int) Unit!13096)

(assert (=> b!440289 (= lt!202533 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!665 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440290 () Bool)

(assert (=> b!440290 (= e!259423 (and e!259422 mapRes!19032))))

(declare-fun condMapEmpty!19032 () Bool)

(declare-fun mapDefault!19032 () ValueCell!5460)

(assert (=> b!440290 (= condMapEmpty!19032 (= (arr!12964 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5460)) mapDefault!19032)))))

(declare-fun b!440291 () Bool)

(declare-fun res!260376 () Bool)

(assert (=> b!440291 (=> (not res!260376) (not e!259419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440291 (= res!260376 (validKeyInArray!0 k0!794))))

(assert (= (and start!40188 res!260372) b!440283))

(assert (= (and b!440283 res!260368) b!440281))

(assert (= (and b!440281 res!260369) b!440276))

(assert (= (and b!440276 res!260370) b!440285))

(assert (= (and b!440285 res!260367) b!440280))

(assert (= (and b!440280 res!260373) b!440291))

(assert (= (and b!440291 res!260376) b!440279))

(assert (= (and b!440279 res!260365) b!440282))

(assert (= (and b!440282 res!260366) b!440286))

(assert (= (and b!440286 res!260371) b!440277))

(assert (= (and b!440277 res!260375) b!440278))

(assert (= (and b!440278 res!260374) b!440288))

(assert (= (and b!440288 res!260364) b!440289))

(assert (= (and b!440290 condMapEmpty!19032) mapIsEmpty!19032))

(assert (= (and b!440290 (not condMapEmpty!19032)) mapNonEmpty!19032))

(get-info :version)

(assert (= (and mapNonEmpty!19032 ((_ is ValueCellFull!5460) mapValue!19032)) b!440287))

(assert (= (and b!440290 ((_ is ValueCellFull!5460) mapDefault!19032)) b!440284))

(assert (= start!40188 b!440290))

(declare-fun m!427355 () Bool)

(assert (=> start!40188 m!427355))

(declare-fun m!427357 () Bool)

(assert (=> start!40188 m!427357))

(declare-fun m!427359 () Bool)

(assert (=> b!440282 m!427359))

(declare-fun m!427361 () Bool)

(assert (=> b!440283 m!427361))

(declare-fun m!427363 () Bool)

(assert (=> mapNonEmpty!19032 m!427363))

(declare-fun m!427365 () Bool)

(assert (=> b!440291 m!427365))

(declare-fun m!427367 () Bool)

(assert (=> b!440276 m!427367))

(declare-fun m!427369 () Bool)

(assert (=> b!440277 m!427369))

(declare-fun m!427371 () Bool)

(assert (=> b!440279 m!427371))

(declare-fun m!427373 () Bool)

(assert (=> b!440288 m!427373))

(declare-fun m!427375 () Bool)

(assert (=> b!440288 m!427375))

(declare-fun m!427377 () Bool)

(assert (=> b!440288 m!427377))

(declare-fun m!427379 () Bool)

(assert (=> b!440289 m!427379))

(declare-fun m!427381 () Bool)

(assert (=> b!440289 m!427381))

(assert (=> b!440289 m!427381))

(declare-fun m!427383 () Bool)

(assert (=> b!440289 m!427383))

(declare-fun m!427385 () Bool)

(assert (=> b!440289 m!427385))

(declare-fun m!427387 () Bool)

(assert (=> b!440285 m!427387))

(declare-fun m!427389 () Bool)

(assert (=> b!440286 m!427389))

(declare-fun m!427391 () Bool)

(assert (=> b!440286 m!427391))

(check-sat (not b!440289) tp_is_empty!11607 (not b!440276) (not b!440285) (not mapNonEmpty!19032) (not b!440291) (not b!440286) (not b_next!10455) (not start!40188) (not b!440277) (not b!440283) (not b!440282) b_and!18423 (not b!440288))
(check-sat b_and!18423 (not b_next!10455))
