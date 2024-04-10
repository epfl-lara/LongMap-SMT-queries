; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36834 () Bool)

(assert start!36834)

(declare-fun b_free!7961 () Bool)

(declare-fun b_next!7961 () Bool)

(assert (=> start!36834 (= b_free!7961 (not b_next!7961))))

(declare-fun tp!28599 () Bool)

(declare-fun b_and!15203 () Bool)

(assert (=> start!36834 (= tp!28599 b_and!15203)))

(declare-fun b!368279 () Bool)

(declare-fun e!225262 () Bool)

(assert (=> b!368279 (= e!225262 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12583 0))(
  ( (V!12584 (val!4349 Int)) )
))
(declare-datatypes ((ValueCell!3961 0))(
  ( (ValueCellFull!3961 (v!6546 V!12583)) (EmptyCell!3961) )
))
(declare-datatypes ((array!21175 0))(
  ( (array!21176 (arr!10056 (Array (_ BitVec 32) ValueCell!3961)) (size!10408 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21175)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5762 0))(
  ( (tuple2!5763 (_1!2892 (_ BitVec 64)) (_2!2892 V!12583)) )
))
(declare-datatypes ((List!5594 0))(
  ( (Nil!5591) (Cons!5590 (h!6446 tuple2!5762) (t!10744 List!5594)) )
))
(declare-datatypes ((ListLongMap!4675 0))(
  ( (ListLongMap!4676 (toList!2353 List!5594)) )
))
(declare-fun lt!169506 () ListLongMap!4675)

(declare-fun zeroValue!472 () V!12583)

(declare-datatypes ((array!21177 0))(
  ( (array!21178 (arr!10057 (Array (_ BitVec 32) (_ BitVec 64))) (size!10409 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21177)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12583)

(declare-fun getCurrentListMapNoExtraKeys!630 (array!21177 array!21175 (_ BitVec 32) (_ BitVec 32) V!12583 V!12583 (_ BitVec 32) Int) ListLongMap!4675)

(assert (=> b!368279 (= lt!169506 (getCurrentListMapNoExtraKeys!630 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368280 () Bool)

(declare-fun e!225263 () Bool)

(assert (=> b!368280 (= e!225263 e!225262)))

(declare-fun res!206361 () Bool)

(assert (=> b!368280 (=> (not res!206361) (not e!225262))))

(declare-fun lt!169505 () array!21177)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21177 (_ BitVec 32)) Bool)

(assert (=> b!368280 (= res!206361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169505 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368280 (= lt!169505 (array!21178 (store (arr!10057 _keys!658) i!548 k!778) (size!10409 _keys!658)))))

(declare-fun mapIsEmpty!14478 () Bool)

(declare-fun mapRes!14478 () Bool)

(assert (=> mapIsEmpty!14478 mapRes!14478))

(declare-fun b!368281 () Bool)

(declare-fun res!206364 () Bool)

(assert (=> b!368281 (=> (not res!206364) (not e!225263))))

(assert (=> b!368281 (= res!206364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!206366 () Bool)

(assert (=> start!36834 (=> (not res!206366) (not e!225263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36834 (= res!206366 (validMask!0 mask!970))))

(assert (=> start!36834 e!225263))

(assert (=> start!36834 true))

(declare-fun e!225259 () Bool)

(declare-fun array_inv!7436 (array!21175) Bool)

(assert (=> start!36834 (and (array_inv!7436 _values!506) e!225259)))

(assert (=> start!36834 tp!28599))

(declare-fun tp_is_empty!8609 () Bool)

(assert (=> start!36834 tp_is_empty!8609))

(declare-fun array_inv!7437 (array!21177) Bool)

(assert (=> start!36834 (array_inv!7437 _keys!658)))

(declare-fun b!368282 () Bool)

(declare-fun res!206368 () Bool)

(assert (=> b!368282 (=> (not res!206368) (not e!225263))))

(assert (=> b!368282 (= res!206368 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10409 _keys!658))))))

(declare-fun b!368283 () Bool)

(declare-fun res!206360 () Bool)

(assert (=> b!368283 (=> (not res!206360) (not e!225263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368283 (= res!206360 (validKeyInArray!0 k!778))))

(declare-fun b!368284 () Bool)

(declare-fun res!206365 () Bool)

(assert (=> b!368284 (=> (not res!206365) (not e!225263))))

(declare-fun arrayContainsKey!0 (array!21177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368284 (= res!206365 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368285 () Bool)

(declare-fun e!225258 () Bool)

(assert (=> b!368285 (= e!225258 tp_is_empty!8609)))

(declare-fun b!368286 () Bool)

(declare-fun res!206362 () Bool)

(assert (=> b!368286 (=> (not res!206362) (not e!225263))))

(assert (=> b!368286 (= res!206362 (or (= (select (arr!10057 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10057 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368287 () Bool)

(declare-fun res!206363 () Bool)

(assert (=> b!368287 (=> (not res!206363) (not e!225262))))

(declare-datatypes ((List!5595 0))(
  ( (Nil!5592) (Cons!5591 (h!6447 (_ BitVec 64)) (t!10745 List!5595)) )
))
(declare-fun arrayNoDuplicates!0 (array!21177 (_ BitVec 32) List!5595) Bool)

(assert (=> b!368287 (= res!206363 (arrayNoDuplicates!0 lt!169505 #b00000000000000000000000000000000 Nil!5592))))

(declare-fun b!368288 () Bool)

(declare-fun res!206367 () Bool)

(assert (=> b!368288 (=> (not res!206367) (not e!225263))))

(assert (=> b!368288 (= res!206367 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5592))))

(declare-fun b!368289 () Bool)

(declare-fun res!206369 () Bool)

(assert (=> b!368289 (=> (not res!206369) (not e!225263))))

(assert (=> b!368289 (= res!206369 (and (= (size!10408 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10409 _keys!658) (size!10408 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368290 () Bool)

(declare-fun e!225260 () Bool)

(assert (=> b!368290 (= e!225259 (and e!225260 mapRes!14478))))

(declare-fun condMapEmpty!14478 () Bool)

(declare-fun mapDefault!14478 () ValueCell!3961)

