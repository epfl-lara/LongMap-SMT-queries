; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36828 () Bool)

(assert start!36828)

(declare-fun b_free!7969 () Bool)

(declare-fun b_next!7969 () Bool)

(assert (=> start!36828 (= b_free!7969 (not b_next!7969))))

(declare-fun tp!28623 () Bool)

(declare-fun b_and!15225 () Bool)

(assert (=> start!36828 (= tp!28623 b_and!15225)))

(declare-fun b!368386 () Bool)

(declare-fun e!225300 () Bool)

(declare-fun e!225303 () Bool)

(assert (=> b!368386 (= e!225300 e!225303)))

(declare-fun res!206482 () Bool)

(assert (=> b!368386 (=> (not res!206482) (not e!225303))))

(declare-datatypes ((array!21170 0))(
  ( (array!21171 (arr!10053 (Array (_ BitVec 32) (_ BitVec 64))) (size!10405 (_ BitVec 32))) )
))
(declare-fun lt!169549 () array!21170)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21170 (_ BitVec 32)) Bool)

(assert (=> b!368386 (= res!206482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169549 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21170)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368386 (= lt!169549 (array!21171 (store (arr!10053 _keys!658) i!548 k0!778) (size!10405 _keys!658)))))

(declare-fun b!368387 () Bool)

(declare-fun res!206480 () Bool)

(assert (=> b!368387 (=> (not res!206480) (not e!225300))))

(declare-fun arrayContainsKey!0 (array!21170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368387 (= res!206480 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368388 () Bool)

(declare-fun res!206481 () Bool)

(assert (=> b!368388 (=> (not res!206481) (not e!225303))))

(declare-datatypes ((List!5507 0))(
  ( (Nil!5504) (Cons!5503 (h!6359 (_ BitVec 64)) (t!10649 List!5507)) )
))
(declare-fun arrayNoDuplicates!0 (array!21170 (_ BitVec 32) List!5507) Bool)

(assert (=> b!368388 (= res!206481 (arrayNoDuplicates!0 lt!169549 #b00000000000000000000000000000000 Nil!5504))))

(declare-fun mapIsEmpty!14490 () Bool)

(declare-fun mapRes!14490 () Bool)

(assert (=> mapIsEmpty!14490 mapRes!14490))

(declare-fun b!368389 () Bool)

(declare-fun e!225299 () Bool)

(declare-fun tp_is_empty!8617 () Bool)

(assert (=> b!368389 (= e!225299 tp_is_empty!8617)))

(declare-fun b!368391 () Bool)

(declare-fun res!206485 () Bool)

(assert (=> b!368391 (=> (not res!206485) (not e!225300))))

(assert (=> b!368391 (= res!206485 (or (= (select (arr!10053 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10053 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14490 () Bool)

(declare-fun tp!28622 () Bool)

(declare-fun e!225298 () Bool)

(assert (=> mapNonEmpty!14490 (= mapRes!14490 (and tp!28622 e!225298))))

(declare-datatypes ((V!12595 0))(
  ( (V!12596 (val!4353 Int)) )
))
(declare-datatypes ((ValueCell!3965 0))(
  ( (ValueCellFull!3965 (v!6551 V!12595)) (EmptyCell!3965) )
))
(declare-fun mapRest!14490 () (Array (_ BitVec 32) ValueCell!3965))

(declare-fun mapValue!14490 () ValueCell!3965)

(declare-datatypes ((array!21172 0))(
  ( (array!21173 (arr!10054 (Array (_ BitVec 32) ValueCell!3965)) (size!10406 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21172)

(declare-fun mapKey!14490 () (_ BitVec 32))

(assert (=> mapNonEmpty!14490 (= (arr!10054 _values!506) (store mapRest!14490 mapKey!14490 mapValue!14490))))

(declare-fun b!368392 () Bool)

(assert (=> b!368392 (= e!225303 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5684 0))(
  ( (tuple2!5685 (_1!2853 (_ BitVec 64)) (_2!2853 V!12595)) )
))
(declare-datatypes ((List!5508 0))(
  ( (Nil!5505) (Cons!5504 (h!6360 tuple2!5684) (t!10650 List!5508)) )
))
(declare-datatypes ((ListLongMap!4599 0))(
  ( (ListLongMap!4600 (toList!2315 List!5508)) )
))
(declare-fun lt!169548 () ListLongMap!4599)

(declare-fun zeroValue!472 () V!12595)

(declare-fun minValue!472 () V!12595)

(declare-fun getCurrentListMapNoExtraKeys!624 (array!21170 array!21172 (_ BitVec 32) (_ BitVec 32) V!12595 V!12595 (_ BitVec 32) Int) ListLongMap!4599)

(assert (=> b!368392 (= lt!169548 (getCurrentListMapNoExtraKeys!624 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368393 () Bool)

(declare-fun res!206477 () Bool)

(assert (=> b!368393 (=> (not res!206477) (not e!225300))))

(assert (=> b!368393 (= res!206477 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5504))))

(declare-fun b!368394 () Bool)

(assert (=> b!368394 (= e!225298 tp_is_empty!8617)))

(declare-fun b!368395 () Bool)

(declare-fun res!206486 () Bool)

(assert (=> b!368395 (=> (not res!206486) (not e!225300))))

(assert (=> b!368395 (= res!206486 (and (= (size!10406 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10405 _keys!658) (size!10406 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368396 () Bool)

(declare-fun res!206478 () Bool)

(assert (=> b!368396 (=> (not res!206478) (not e!225300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368396 (= res!206478 (validKeyInArray!0 k0!778))))

(declare-fun b!368390 () Bool)

(declare-fun res!206484 () Bool)

(assert (=> b!368390 (=> (not res!206484) (not e!225300))))

(assert (=> b!368390 (= res!206484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!206483 () Bool)

(assert (=> start!36828 (=> (not res!206483) (not e!225300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36828 (= res!206483 (validMask!0 mask!970))))

(assert (=> start!36828 e!225300))

(assert (=> start!36828 true))

(declare-fun e!225301 () Bool)

(declare-fun array_inv!7466 (array!21172) Bool)

(assert (=> start!36828 (and (array_inv!7466 _values!506) e!225301)))

(assert (=> start!36828 tp!28623))

(assert (=> start!36828 tp_is_empty!8617))

(declare-fun array_inv!7467 (array!21170) Bool)

(assert (=> start!36828 (array_inv!7467 _keys!658)))

(declare-fun b!368397 () Bool)

(assert (=> b!368397 (= e!225301 (and e!225299 mapRes!14490))))

(declare-fun condMapEmpty!14490 () Bool)

(declare-fun mapDefault!14490 () ValueCell!3965)

(assert (=> b!368397 (= condMapEmpty!14490 (= (arr!10054 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3965)) mapDefault!14490)))))

(declare-fun b!368398 () Bool)

(declare-fun res!206479 () Bool)

(assert (=> b!368398 (=> (not res!206479) (not e!225300))))

(assert (=> b!368398 (= res!206479 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10405 _keys!658))))))

(assert (= (and start!36828 res!206483) b!368395))

(assert (= (and b!368395 res!206486) b!368390))

(assert (= (and b!368390 res!206484) b!368393))

(assert (= (and b!368393 res!206477) b!368398))

(assert (= (and b!368398 res!206479) b!368396))

(assert (= (and b!368396 res!206478) b!368391))

(assert (= (and b!368391 res!206485) b!368387))

(assert (= (and b!368387 res!206480) b!368386))

(assert (= (and b!368386 res!206482) b!368388))

(assert (= (and b!368388 res!206481) b!368392))

(assert (= (and b!368397 condMapEmpty!14490) mapIsEmpty!14490))

(assert (= (and b!368397 (not condMapEmpty!14490)) mapNonEmpty!14490))

(get-info :version)

(assert (= (and mapNonEmpty!14490 ((_ is ValueCellFull!3965) mapValue!14490)) b!368394))

(assert (= (and b!368397 ((_ is ValueCellFull!3965) mapDefault!14490)) b!368389))

(assert (= start!36828 b!368397))

(declare-fun m!365309 () Bool)

(assert (=> b!368392 m!365309))

(declare-fun m!365311 () Bool)

(assert (=> b!368396 m!365311))

(declare-fun m!365313 () Bool)

(assert (=> mapNonEmpty!14490 m!365313))

(declare-fun m!365315 () Bool)

(assert (=> b!368387 m!365315))

(declare-fun m!365317 () Bool)

(assert (=> b!368386 m!365317))

(declare-fun m!365319 () Bool)

(assert (=> b!368386 m!365319))

(declare-fun m!365321 () Bool)

(assert (=> start!36828 m!365321))

(declare-fun m!365323 () Bool)

(assert (=> start!36828 m!365323))

(declare-fun m!365325 () Bool)

(assert (=> start!36828 m!365325))

(declare-fun m!365327 () Bool)

(assert (=> b!368390 m!365327))

(declare-fun m!365329 () Bool)

(assert (=> b!368391 m!365329))

(declare-fun m!365331 () Bool)

(assert (=> b!368388 m!365331))

(declare-fun m!365333 () Bool)

(assert (=> b!368393 m!365333))

(check-sat b_and!15225 (not b!368386) tp_is_empty!8617 (not b!368387) (not mapNonEmpty!14490) (not b!368392) (not b_next!7969) (not start!36828) (not b!368393) (not b!368388) (not b!368396) (not b!368390))
(check-sat b_and!15225 (not b_next!7969))
