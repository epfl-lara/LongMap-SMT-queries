; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36838 () Bool)

(assert start!36838)

(declare-fun b_free!7965 () Bool)

(declare-fun b_next!7965 () Bool)

(assert (=> start!36838 (= b_free!7965 (not b_next!7965))))

(declare-fun tp!28611 () Bool)

(declare-fun b_and!15207 () Bool)

(assert (=> start!36838 (= tp!28611 b_and!15207)))

(declare-fun b!368357 () Bool)

(declare-fun res!206428 () Bool)

(declare-fun e!225299 () Bool)

(assert (=> b!368357 (=> (not res!206428) (not e!225299))))

(declare-datatypes ((array!21183 0))(
  ( (array!21184 (arr!10060 (Array (_ BitVec 32) (_ BitVec 64))) (size!10412 (_ BitVec 32))) )
))
(declare-fun lt!169518 () array!21183)

(declare-datatypes ((List!5598 0))(
  ( (Nil!5595) (Cons!5594 (h!6450 (_ BitVec 64)) (t!10748 List!5598)) )
))
(declare-fun arrayNoDuplicates!0 (array!21183 (_ BitVec 32) List!5598) Bool)

(assert (=> b!368357 (= res!206428 (arrayNoDuplicates!0 lt!169518 #b00000000000000000000000000000000 Nil!5595))))

(declare-fun b!368358 () Bool)

(declare-fun e!225297 () Bool)

(declare-fun e!225294 () Bool)

(declare-fun mapRes!14484 () Bool)

(assert (=> b!368358 (= e!225297 (and e!225294 mapRes!14484))))

(declare-fun condMapEmpty!14484 () Bool)

(declare-datatypes ((V!12589 0))(
  ( (V!12590 (val!4351 Int)) )
))
(declare-datatypes ((ValueCell!3963 0))(
  ( (ValueCellFull!3963 (v!6548 V!12589)) (EmptyCell!3963) )
))
(declare-datatypes ((array!21185 0))(
  ( (array!21186 (arr!10061 (Array (_ BitVec 32) ValueCell!3963)) (size!10413 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21185)

(declare-fun mapDefault!14484 () ValueCell!3963)

(assert (=> b!368358 (= condMapEmpty!14484 (= (arr!10061 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3963)) mapDefault!14484)))))

(declare-fun b!368359 () Bool)

(declare-fun e!225298 () Bool)

(assert (=> b!368359 (= e!225298 e!225299)))

(declare-fun res!206426 () Bool)

(assert (=> b!368359 (=> (not res!206426) (not e!225299))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21183 (_ BitVec 32)) Bool)

(assert (=> b!368359 (= res!206426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169518 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21183)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368359 (= lt!169518 (array!21184 (store (arr!10060 _keys!658) i!548 k0!778) (size!10412 _keys!658)))))

(declare-fun res!206423 () Bool)

(assert (=> start!36838 (=> (not res!206423) (not e!225298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36838 (= res!206423 (validMask!0 mask!970))))

(assert (=> start!36838 e!225298))

(assert (=> start!36838 true))

(declare-fun array_inv!7440 (array!21185) Bool)

(assert (=> start!36838 (and (array_inv!7440 _values!506) e!225297)))

(assert (=> start!36838 tp!28611))

(declare-fun tp_is_empty!8613 () Bool)

(assert (=> start!36838 tp_is_empty!8613))

(declare-fun array_inv!7441 (array!21183) Bool)

(assert (=> start!36838 (array_inv!7441 _keys!658)))

(declare-fun b!368360 () Bool)

(assert (=> b!368360 (= e!225299 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12589)

(declare-datatypes ((tuple2!5766 0))(
  ( (tuple2!5767 (_1!2894 (_ BitVec 64)) (_2!2894 V!12589)) )
))
(declare-datatypes ((List!5599 0))(
  ( (Nil!5596) (Cons!5595 (h!6451 tuple2!5766) (t!10749 List!5599)) )
))
(declare-datatypes ((ListLongMap!4679 0))(
  ( (ListLongMap!4680 (toList!2355 List!5599)) )
))
(declare-fun lt!169517 () ListLongMap!4679)

(declare-fun minValue!472 () V!12589)

(declare-fun getCurrentListMapNoExtraKeys!632 (array!21183 array!21185 (_ BitVec 32) (_ BitVec 32) V!12589 V!12589 (_ BitVec 32) Int) ListLongMap!4679)

(assert (=> b!368360 (= lt!169517 (getCurrentListMapNoExtraKeys!632 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368361 () Bool)

(declare-fun e!225296 () Bool)

(assert (=> b!368361 (= e!225296 tp_is_empty!8613)))

(declare-fun mapIsEmpty!14484 () Bool)

(assert (=> mapIsEmpty!14484 mapRes!14484))

(declare-fun b!368362 () Bool)

(declare-fun res!206421 () Bool)

(assert (=> b!368362 (=> (not res!206421) (not e!225298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368362 (= res!206421 (validKeyInArray!0 k0!778))))

(declare-fun b!368363 () Bool)

(declare-fun res!206420 () Bool)

(assert (=> b!368363 (=> (not res!206420) (not e!225298))))

(assert (=> b!368363 (= res!206420 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5595))))

(declare-fun b!368364 () Bool)

(declare-fun res!206422 () Bool)

(assert (=> b!368364 (=> (not res!206422) (not e!225298))))

(declare-fun arrayContainsKey!0 (array!21183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368364 (= res!206422 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14484 () Bool)

(declare-fun tp!28610 () Bool)

(assert (=> mapNonEmpty!14484 (= mapRes!14484 (and tp!28610 e!225296))))

(declare-fun mapValue!14484 () ValueCell!3963)

(declare-fun mapRest!14484 () (Array (_ BitVec 32) ValueCell!3963))

(declare-fun mapKey!14484 () (_ BitVec 32))

(assert (=> mapNonEmpty!14484 (= (arr!10061 _values!506) (store mapRest!14484 mapKey!14484 mapValue!14484))))

(declare-fun b!368365 () Bool)

(declare-fun res!206429 () Bool)

(assert (=> b!368365 (=> (not res!206429) (not e!225298))))

(assert (=> b!368365 (= res!206429 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10412 _keys!658))))))

(declare-fun b!368366 () Bool)

(assert (=> b!368366 (= e!225294 tp_is_empty!8613)))

(declare-fun b!368367 () Bool)

(declare-fun res!206425 () Bool)

(assert (=> b!368367 (=> (not res!206425) (not e!225298))))

(assert (=> b!368367 (= res!206425 (and (= (size!10413 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10412 _keys!658) (size!10413 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368368 () Bool)

(declare-fun res!206424 () Bool)

(assert (=> b!368368 (=> (not res!206424) (not e!225298))))

(assert (=> b!368368 (= res!206424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368369 () Bool)

(declare-fun res!206427 () Bool)

(assert (=> b!368369 (=> (not res!206427) (not e!225298))))

(assert (=> b!368369 (= res!206427 (or (= (select (arr!10060 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10060 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!36838 res!206423) b!368367))

(assert (= (and b!368367 res!206425) b!368368))

(assert (= (and b!368368 res!206424) b!368363))

(assert (= (and b!368363 res!206420) b!368365))

(assert (= (and b!368365 res!206429) b!368362))

(assert (= (and b!368362 res!206421) b!368369))

(assert (= (and b!368369 res!206427) b!368364))

(assert (= (and b!368364 res!206422) b!368359))

(assert (= (and b!368359 res!206426) b!368357))

(assert (= (and b!368357 res!206428) b!368360))

(assert (= (and b!368358 condMapEmpty!14484) mapIsEmpty!14484))

(assert (= (and b!368358 (not condMapEmpty!14484)) mapNonEmpty!14484))

(get-info :version)

(assert (= (and mapNonEmpty!14484 ((_ is ValueCellFull!3963) mapValue!14484)) b!368361))

(assert (= (and b!368358 ((_ is ValueCellFull!3963) mapDefault!14484)) b!368366))

(assert (= start!36838 b!368358))

(declare-fun m!365027 () Bool)

(assert (=> b!368369 m!365027))

(declare-fun m!365029 () Bool)

(assert (=> b!368363 m!365029))

(declare-fun m!365031 () Bool)

(assert (=> b!368368 m!365031))

(declare-fun m!365033 () Bool)

(assert (=> start!36838 m!365033))

(declare-fun m!365035 () Bool)

(assert (=> start!36838 m!365035))

(declare-fun m!365037 () Bool)

(assert (=> start!36838 m!365037))

(declare-fun m!365039 () Bool)

(assert (=> mapNonEmpty!14484 m!365039))

(declare-fun m!365041 () Bool)

(assert (=> b!368364 m!365041))

(declare-fun m!365043 () Bool)

(assert (=> b!368360 m!365043))

(declare-fun m!365045 () Bool)

(assert (=> b!368359 m!365045))

(declare-fun m!365047 () Bool)

(assert (=> b!368359 m!365047))

(declare-fun m!365049 () Bool)

(assert (=> b!368357 m!365049))

(declare-fun m!365051 () Bool)

(assert (=> b!368362 m!365051))

(check-sat tp_is_empty!8613 (not start!36838) (not b!368368) (not b!368357) (not b!368359) (not b_next!7965) (not b!368362) b_and!15207 (not b!368363) (not b!368360) (not b!368364) (not mapNonEmpty!14484))
(check-sat b_and!15207 (not b_next!7965))
