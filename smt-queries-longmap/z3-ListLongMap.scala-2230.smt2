; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36844 () Bool)

(assert start!36844)

(declare-fun b_free!7971 () Bool)

(declare-fun b_next!7971 () Bool)

(assert (=> start!36844 (= b_free!7971 (not b_next!7971))))

(declare-fun tp!28628 () Bool)

(declare-fun b_and!15213 () Bool)

(assert (=> start!36844 (= tp!28628 b_and!15213)))

(declare-fun b!368474 () Bool)

(declare-fun res!206512 () Bool)

(declare-fun e!225351 () Bool)

(assert (=> b!368474 (=> (not res!206512) (not e!225351))))

(declare-datatypes ((array!21195 0))(
  ( (array!21196 (arr!10066 (Array (_ BitVec 32) (_ BitVec 64))) (size!10418 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21195)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368474 (= res!206512 (or (= (select (arr!10066 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10066 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368475 () Bool)

(declare-fun res!206510 () Bool)

(assert (=> b!368475 (=> (not res!206510) (not e!225351))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12597 0))(
  ( (V!12598 (val!4354 Int)) )
))
(declare-datatypes ((ValueCell!3966 0))(
  ( (ValueCellFull!3966 (v!6551 V!12597)) (EmptyCell!3966) )
))
(declare-datatypes ((array!21197 0))(
  ( (array!21198 (arr!10067 (Array (_ BitVec 32) ValueCell!3966)) (size!10419 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21197)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!368475 (= res!206510 (and (= (size!10419 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10418 _keys!658) (size!10419 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368476 () Bool)

(declare-fun res!206515 () Bool)

(assert (=> b!368476 (=> (not res!206515) (not e!225351))))

(assert (=> b!368476 (= res!206515 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10418 _keys!658))))))

(declare-fun res!206518 () Bool)

(assert (=> start!36844 (=> (not res!206518) (not e!225351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36844 (= res!206518 (validMask!0 mask!970))))

(assert (=> start!36844 e!225351))

(assert (=> start!36844 true))

(declare-fun e!225352 () Bool)

(declare-fun array_inv!7442 (array!21197) Bool)

(assert (=> start!36844 (and (array_inv!7442 _values!506) e!225352)))

(assert (=> start!36844 tp!28628))

(declare-fun tp_is_empty!8619 () Bool)

(assert (=> start!36844 tp_is_empty!8619))

(declare-fun array_inv!7443 (array!21195) Bool)

(assert (=> start!36844 (array_inv!7443 _keys!658)))

(declare-fun b!368477 () Bool)

(declare-fun e!225350 () Bool)

(assert (=> b!368477 (= e!225350 tp_is_empty!8619)))

(declare-fun b!368478 () Bool)

(declare-fun res!206513 () Bool)

(declare-fun e!225353 () Bool)

(assert (=> b!368478 (=> (not res!206513) (not e!225353))))

(declare-fun lt!169536 () array!21195)

(declare-datatypes ((List!5603 0))(
  ( (Nil!5600) (Cons!5599 (h!6455 (_ BitVec 64)) (t!10753 List!5603)) )
))
(declare-fun arrayNoDuplicates!0 (array!21195 (_ BitVec 32) List!5603) Bool)

(assert (=> b!368478 (= res!206513 (arrayNoDuplicates!0 lt!169536 #b00000000000000000000000000000000 Nil!5600))))

(declare-fun mapNonEmpty!14493 () Bool)

(declare-fun mapRes!14493 () Bool)

(declare-fun tp!28629 () Bool)

(declare-fun e!225348 () Bool)

(assert (=> mapNonEmpty!14493 (= mapRes!14493 (and tp!28629 e!225348))))

(declare-fun mapRest!14493 () (Array (_ BitVec 32) ValueCell!3966))

(declare-fun mapKey!14493 () (_ BitVec 32))

(declare-fun mapValue!14493 () ValueCell!3966)

(assert (=> mapNonEmpty!14493 (= (arr!10067 _values!506) (store mapRest!14493 mapKey!14493 mapValue!14493))))

(declare-fun b!368479 () Bool)

(assert (=> b!368479 (= e!225353 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12597)

(declare-datatypes ((tuple2!5770 0))(
  ( (tuple2!5771 (_1!2896 (_ BitVec 64)) (_2!2896 V!12597)) )
))
(declare-datatypes ((List!5604 0))(
  ( (Nil!5601) (Cons!5600 (h!6456 tuple2!5770) (t!10754 List!5604)) )
))
(declare-datatypes ((ListLongMap!4683 0))(
  ( (ListLongMap!4684 (toList!2357 List!5604)) )
))
(declare-fun lt!169535 () ListLongMap!4683)

(declare-fun minValue!472 () V!12597)

(declare-fun getCurrentListMapNoExtraKeys!634 (array!21195 array!21197 (_ BitVec 32) (_ BitVec 32) V!12597 V!12597 (_ BitVec 32) Int) ListLongMap!4683)

(assert (=> b!368479 (= lt!169535 (getCurrentListMapNoExtraKeys!634 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368480 () Bool)

(assert (=> b!368480 (= e!225351 e!225353)))

(declare-fun res!206517 () Bool)

(assert (=> b!368480 (=> (not res!206517) (not e!225353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21195 (_ BitVec 32)) Bool)

(assert (=> b!368480 (= res!206517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169536 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!368480 (= lt!169536 (array!21196 (store (arr!10066 _keys!658) i!548 k0!778) (size!10418 _keys!658)))))

(declare-fun b!368481 () Bool)

(assert (=> b!368481 (= e!225352 (and e!225350 mapRes!14493))))

(declare-fun condMapEmpty!14493 () Bool)

(declare-fun mapDefault!14493 () ValueCell!3966)

(assert (=> b!368481 (= condMapEmpty!14493 (= (arr!10067 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3966)) mapDefault!14493)))))

(declare-fun b!368482 () Bool)

(declare-fun res!206511 () Bool)

(assert (=> b!368482 (=> (not res!206511) (not e!225351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368482 (= res!206511 (validKeyInArray!0 k0!778))))

(declare-fun b!368483 () Bool)

(declare-fun res!206514 () Bool)

(assert (=> b!368483 (=> (not res!206514) (not e!225351))))

(assert (=> b!368483 (= res!206514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368484 () Bool)

(declare-fun res!206519 () Bool)

(assert (=> b!368484 (=> (not res!206519) (not e!225351))))

(declare-fun arrayContainsKey!0 (array!21195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368484 (= res!206519 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368485 () Bool)

(assert (=> b!368485 (= e!225348 tp_is_empty!8619)))

(declare-fun b!368486 () Bool)

(declare-fun res!206516 () Bool)

(assert (=> b!368486 (=> (not res!206516) (not e!225351))))

(assert (=> b!368486 (= res!206516 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5600))))

(declare-fun mapIsEmpty!14493 () Bool)

(assert (=> mapIsEmpty!14493 mapRes!14493))

(assert (= (and start!36844 res!206518) b!368475))

(assert (= (and b!368475 res!206510) b!368483))

(assert (= (and b!368483 res!206514) b!368486))

(assert (= (and b!368486 res!206516) b!368476))

(assert (= (and b!368476 res!206515) b!368482))

(assert (= (and b!368482 res!206511) b!368474))

(assert (= (and b!368474 res!206512) b!368484))

(assert (= (and b!368484 res!206519) b!368480))

(assert (= (and b!368480 res!206517) b!368478))

(assert (= (and b!368478 res!206513) b!368479))

(assert (= (and b!368481 condMapEmpty!14493) mapIsEmpty!14493))

(assert (= (and b!368481 (not condMapEmpty!14493)) mapNonEmpty!14493))

(get-info :version)

(assert (= (and mapNonEmpty!14493 ((_ is ValueCellFull!3966) mapValue!14493)) b!368485))

(assert (= (and b!368481 ((_ is ValueCellFull!3966) mapDefault!14493)) b!368477))

(assert (= start!36844 b!368481))

(declare-fun m!365105 () Bool)

(assert (=> start!36844 m!365105))

(declare-fun m!365107 () Bool)

(assert (=> start!36844 m!365107))

(declare-fun m!365109 () Bool)

(assert (=> start!36844 m!365109))

(declare-fun m!365111 () Bool)

(assert (=> b!368479 m!365111))

(declare-fun m!365113 () Bool)

(assert (=> b!368484 m!365113))

(declare-fun m!365115 () Bool)

(assert (=> b!368486 m!365115))

(declare-fun m!365117 () Bool)

(assert (=> b!368474 m!365117))

(declare-fun m!365119 () Bool)

(assert (=> mapNonEmpty!14493 m!365119))

(declare-fun m!365121 () Bool)

(assert (=> b!368478 m!365121))

(declare-fun m!365123 () Bool)

(assert (=> b!368482 m!365123))

(declare-fun m!365125 () Bool)

(assert (=> b!368483 m!365125))

(declare-fun m!365127 () Bool)

(assert (=> b!368480 m!365127))

(declare-fun m!365129 () Bool)

(assert (=> b!368480 m!365129))

(check-sat (not b!368478) (not b!368483) (not b_next!7971) (not mapNonEmpty!14493) (not b!368486) tp_is_empty!8619 (not b!368480) (not start!36844) (not b!368479) b_and!15213 (not b!368482) (not b!368484))
(check-sat b_and!15213 (not b_next!7971))
