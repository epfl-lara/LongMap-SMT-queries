; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36848 () Bool)

(assert start!36848)

(declare-fun b_free!7975 () Bool)

(declare-fun b_next!7975 () Bool)

(assert (=> start!36848 (= b_free!7975 (not b_next!7975))))

(declare-fun tp!28640 () Bool)

(declare-fun b_and!15217 () Bool)

(assert (=> start!36848 (= tp!28640 b_and!15217)))

(declare-fun mapIsEmpty!14499 () Bool)

(declare-fun mapRes!14499 () Bool)

(assert (=> mapIsEmpty!14499 mapRes!14499))

(declare-fun b!368552 () Bool)

(declare-fun e!225388 () Bool)

(declare-fun e!225389 () Bool)

(assert (=> b!368552 (= e!225388 e!225389)))

(declare-fun res!206577 () Bool)

(assert (=> b!368552 (=> (not res!206577) (not e!225389))))

(declare-datatypes ((array!21201 0))(
  ( (array!21202 (arr!10069 (Array (_ BitVec 32) (_ BitVec 64))) (size!10421 (_ BitVec 32))) )
))
(declare-fun lt!169548 () array!21201)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21201 (_ BitVec 32)) Bool)

(assert (=> b!368552 (= res!206577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169548 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21201)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368552 (= lt!169548 (array!21202 (store (arr!10069 _keys!658) i!548 k!778) (size!10421 _keys!658)))))

(declare-fun b!368553 () Bool)

(declare-fun res!206575 () Bool)

(assert (=> b!368553 (=> (not res!206575) (not e!225388))))

(declare-datatypes ((List!5605 0))(
  ( (Nil!5602) (Cons!5601 (h!6457 (_ BitVec 64)) (t!10755 List!5605)) )
))
(declare-fun arrayNoDuplicates!0 (array!21201 (_ BitVec 32) List!5605) Bool)

(assert (=> b!368553 (= res!206575 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5602))))

(declare-fun b!368554 () Bool)

(declare-fun res!206573 () Bool)

(assert (=> b!368554 (=> (not res!206573) (not e!225388))))

(assert (=> b!368554 (= res!206573 (or (= (select (arr!10069 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10069 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14499 () Bool)

(declare-fun tp!28641 () Bool)

(declare-fun e!225385 () Bool)

(assert (=> mapNonEmpty!14499 (= mapRes!14499 (and tp!28641 e!225385))))

(declare-datatypes ((V!12603 0))(
  ( (V!12604 (val!4356 Int)) )
))
(declare-datatypes ((ValueCell!3968 0))(
  ( (ValueCellFull!3968 (v!6553 V!12603)) (EmptyCell!3968) )
))
(declare-fun mapValue!14499 () ValueCell!3968)

(declare-datatypes ((array!21203 0))(
  ( (array!21204 (arr!10070 (Array (_ BitVec 32) ValueCell!3968)) (size!10422 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21203)

(declare-fun mapKey!14499 () (_ BitVec 32))

(declare-fun mapRest!14499 () (Array (_ BitVec 32) ValueCell!3968))

(assert (=> mapNonEmpty!14499 (= (arr!10070 _values!506) (store mapRest!14499 mapKey!14499 mapValue!14499))))

(declare-fun b!368555 () Bool)

(declare-fun tp_is_empty!8623 () Bool)

(assert (=> b!368555 (= e!225385 tp_is_empty!8623)))

(declare-fun b!368557 () Bool)

(declare-fun res!206574 () Bool)

(assert (=> b!368557 (=> (not res!206574) (not e!225388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368557 (= res!206574 (validKeyInArray!0 k!778))))

(declare-fun b!368558 () Bool)

(declare-fun res!206578 () Bool)

(assert (=> b!368558 (=> (not res!206578) (not e!225388))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368558 (= res!206578 (and (= (size!10422 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10421 _keys!658) (size!10422 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368559 () Bool)

(declare-fun res!206579 () Bool)

(assert (=> b!368559 (=> (not res!206579) (not e!225388))))

(declare-fun arrayContainsKey!0 (array!21201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368559 (= res!206579 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368560 () Bool)

(assert (=> b!368560 (= e!225389 false)))

(declare-datatypes ((tuple2!5772 0))(
  ( (tuple2!5773 (_1!2897 (_ BitVec 64)) (_2!2897 V!12603)) )
))
(declare-datatypes ((List!5606 0))(
  ( (Nil!5603) (Cons!5602 (h!6458 tuple2!5772) (t!10756 List!5606)) )
))
(declare-datatypes ((ListLongMap!4685 0))(
  ( (ListLongMap!4686 (toList!2358 List!5606)) )
))
(declare-fun lt!169547 () ListLongMap!4685)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12603)

(declare-fun minValue!472 () V!12603)

(declare-fun getCurrentListMapNoExtraKeys!635 (array!21201 array!21203 (_ BitVec 32) (_ BitVec 32) V!12603 V!12603 (_ BitVec 32) Int) ListLongMap!4685)

(assert (=> b!368560 (= lt!169547 (getCurrentListMapNoExtraKeys!635 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368561 () Bool)

(declare-fun res!206571 () Bool)

(assert (=> b!368561 (=> (not res!206571) (not e!225388))))

(assert (=> b!368561 (= res!206571 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10421 _keys!658))))))

(declare-fun b!368562 () Bool)

(declare-fun e!225386 () Bool)

(assert (=> b!368562 (= e!225386 tp_is_empty!8623)))

(declare-fun res!206572 () Bool)

(assert (=> start!36848 (=> (not res!206572) (not e!225388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36848 (= res!206572 (validMask!0 mask!970))))

(assert (=> start!36848 e!225388))

(assert (=> start!36848 true))

(declare-fun e!225387 () Bool)

(declare-fun array_inv!7444 (array!21203) Bool)

(assert (=> start!36848 (and (array_inv!7444 _values!506) e!225387)))

(assert (=> start!36848 tp!28640))

(assert (=> start!36848 tp_is_empty!8623))

(declare-fun array_inv!7445 (array!21201) Bool)

(assert (=> start!36848 (array_inv!7445 _keys!658)))

(declare-fun b!368556 () Bool)

(declare-fun res!206576 () Bool)

(assert (=> b!368556 (=> (not res!206576) (not e!225389))))

(assert (=> b!368556 (= res!206576 (arrayNoDuplicates!0 lt!169548 #b00000000000000000000000000000000 Nil!5602))))

(declare-fun b!368563 () Bool)

(assert (=> b!368563 (= e!225387 (and e!225386 mapRes!14499))))

(declare-fun condMapEmpty!14499 () Bool)

(declare-fun mapDefault!14499 () ValueCell!3968)

