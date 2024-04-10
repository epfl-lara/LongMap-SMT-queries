; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36842 () Bool)

(assert start!36842)

(declare-fun b_free!7969 () Bool)

(declare-fun b_next!7969 () Bool)

(assert (=> start!36842 (= b_free!7969 (not b_next!7969))))

(declare-fun tp!28623 () Bool)

(declare-fun b_and!15211 () Bool)

(assert (=> start!36842 (= tp!28623 b_and!15211)))

(declare-fun b!368435 () Bool)

(declare-fun e!225332 () Bool)

(assert (=> b!368435 (= e!225332 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12595 0))(
  ( (V!12596 (val!4353 Int)) )
))
(declare-datatypes ((ValueCell!3965 0))(
  ( (ValueCellFull!3965 (v!6550 V!12595)) (EmptyCell!3965) )
))
(declare-datatypes ((array!21191 0))(
  ( (array!21192 (arr!10064 (Array (_ BitVec 32) ValueCell!3965)) (size!10416 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21191)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5768 0))(
  ( (tuple2!5769 (_1!2895 (_ BitVec 64)) (_2!2895 V!12595)) )
))
(declare-datatypes ((List!5601 0))(
  ( (Nil!5598) (Cons!5597 (h!6453 tuple2!5768) (t!10751 List!5601)) )
))
(declare-datatypes ((ListLongMap!4681 0))(
  ( (ListLongMap!4682 (toList!2356 List!5601)) )
))
(declare-fun lt!169530 () ListLongMap!4681)

(declare-fun zeroValue!472 () V!12595)

(declare-datatypes ((array!21193 0))(
  ( (array!21194 (arr!10065 (Array (_ BitVec 32) (_ BitVec 64))) (size!10417 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21193)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12595)

(declare-fun getCurrentListMapNoExtraKeys!633 (array!21193 array!21191 (_ BitVec 32) (_ BitVec 32) V!12595 V!12595 (_ BitVec 32) Int) ListLongMap!4681)

(assert (=> b!368435 (= lt!169530 (getCurrentListMapNoExtraKeys!633 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368436 () Bool)

(declare-fun e!225334 () Bool)

(assert (=> b!368436 (= e!225334 e!225332)))

(declare-fun res!206481 () Bool)

(assert (=> b!368436 (=> (not res!206481) (not e!225332))))

(declare-fun lt!169529 () array!21193)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21193 (_ BitVec 32)) Bool)

(assert (=> b!368436 (= res!206481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169529 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368436 (= lt!169529 (array!21194 (store (arr!10065 _keys!658) i!548 k!778) (size!10417 _keys!658)))))

(declare-fun b!368437 () Bool)

(declare-fun res!206484 () Bool)

(assert (=> b!368437 (=> (not res!206484) (not e!225334))))

(declare-fun arrayContainsKey!0 (array!21193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368437 (= res!206484 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368438 () Bool)

(declare-fun res!206487 () Bool)

(assert (=> b!368438 (=> (not res!206487) (not e!225334))))

(declare-datatypes ((List!5602 0))(
  ( (Nil!5599) (Cons!5598 (h!6454 (_ BitVec 64)) (t!10752 List!5602)) )
))
(declare-fun arrayNoDuplicates!0 (array!21193 (_ BitVec 32) List!5602) Bool)

(assert (=> b!368438 (= res!206487 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5599))))

(declare-fun b!368439 () Bool)

(declare-fun res!206488 () Bool)

(assert (=> b!368439 (=> (not res!206488) (not e!225334))))

(assert (=> b!368439 (= res!206488 (or (= (select (arr!10065 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10065 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14490 () Bool)

(declare-fun mapRes!14490 () Bool)

(declare-fun tp!28622 () Bool)

(declare-fun e!225331 () Bool)

(assert (=> mapNonEmpty!14490 (= mapRes!14490 (and tp!28622 e!225331))))

(declare-fun mapValue!14490 () ValueCell!3965)

(declare-fun mapRest!14490 () (Array (_ BitVec 32) ValueCell!3965))

(declare-fun mapKey!14490 () (_ BitVec 32))

(assert (=> mapNonEmpty!14490 (= (arr!10064 _values!506) (store mapRest!14490 mapKey!14490 mapValue!14490))))

(declare-fun b!368440 () Bool)

(declare-fun res!206485 () Bool)

(assert (=> b!368440 (=> (not res!206485) (not e!225334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368440 (= res!206485 (validKeyInArray!0 k!778))))

(declare-fun b!368441 () Bool)

(declare-fun e!225335 () Bool)

(declare-fun tp_is_empty!8617 () Bool)

(assert (=> b!368441 (= e!225335 tp_is_empty!8617)))

(declare-fun b!368442 () Bool)

(declare-fun e!225333 () Bool)

(assert (=> b!368442 (= e!225333 (and e!225335 mapRes!14490))))

(declare-fun condMapEmpty!14490 () Bool)

(declare-fun mapDefault!14490 () ValueCell!3965)

