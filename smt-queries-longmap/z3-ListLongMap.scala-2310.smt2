; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37324 () Bool)

(assert start!37324)

(declare-fun b_free!8451 () Bool)

(declare-fun b_next!8451 () Bool)

(assert (=> start!37324 (= b_free!8451 (not b_next!8451))))

(declare-fun tp!30068 () Bool)

(declare-fun b_and!15693 () Bool)

(assert (=> start!37324 (= tp!30068 b_and!15693)))

(declare-fun res!214484 () Bool)

(declare-fun e!230407 () Bool)

(assert (=> start!37324 (=> (not res!214484) (not e!230407))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37324 (= res!214484 (validMask!0 mask!970))))

(assert (=> start!37324 e!230407))

(declare-datatypes ((V!13237 0))(
  ( (V!13238 (val!4594 Int)) )
))
(declare-datatypes ((ValueCell!4206 0))(
  ( (ValueCellFull!4206 (v!6791 V!13237)) (EmptyCell!4206) )
))
(declare-datatypes ((array!22123 0))(
  ( (array!22124 (arr!10530 (Array (_ BitVec 32) ValueCell!4206)) (size!10882 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22123)

(declare-fun e!230409 () Bool)

(declare-fun array_inv!7754 (array!22123) Bool)

(assert (=> start!37324 (and (array_inv!7754 _values!506) e!230409)))

(assert (=> start!37324 tp!30068))

(assert (=> start!37324 true))

(declare-fun tp_is_empty!9099 () Bool)

(assert (=> start!37324 tp_is_empty!9099))

(declare-datatypes ((array!22125 0))(
  ( (array!22126 (arr!10531 (Array (_ BitVec 32) (_ BitVec 64))) (size!10883 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22125)

(declare-fun array_inv!7755 (array!22125) Bool)

(assert (=> start!37324 (array_inv!7755 _keys!658)))

(declare-fun b!378600 () Bool)

(declare-fun e!230410 () Bool)

(assert (=> b!378600 (= e!230407 e!230410)))

(declare-fun res!214481 () Bool)

(assert (=> b!378600 (=> (not res!214481) (not e!230410))))

(declare-fun lt!176458 () array!22125)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22125 (_ BitVec 32)) Bool)

(assert (=> b!378600 (= res!214481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176458 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378600 (= lt!176458 (array!22126 (store (arr!10531 _keys!658) i!548 k0!778) (size!10883 _keys!658)))))

(declare-fun b!378601 () Bool)

(declare-fun e!230408 () Bool)

(assert (=> b!378601 (= e!230408 tp_is_empty!9099)))

(declare-fun b!378602 () Bool)

(declare-fun res!214485 () Bool)

(assert (=> b!378602 (=> (not res!214485) (not e!230410))))

(declare-datatypes ((List!5975 0))(
  ( (Nil!5972) (Cons!5971 (h!6827 (_ BitVec 64)) (t!11125 List!5975)) )
))
(declare-fun arrayNoDuplicates!0 (array!22125 (_ BitVec 32) List!5975) Bool)

(assert (=> b!378602 (= res!214485 (arrayNoDuplicates!0 lt!176458 #b00000000000000000000000000000000 Nil!5972))))

(declare-fun mapIsEmpty!15213 () Bool)

(declare-fun mapRes!15213 () Bool)

(assert (=> mapIsEmpty!15213 mapRes!15213))

(declare-fun b!378603 () Bool)

(declare-fun res!214483 () Bool)

(assert (=> b!378603 (=> (not res!214483) (not e!230407))))

(assert (=> b!378603 (= res!214483 (or (= (select (arr!10531 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10531 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378604 () Bool)

(declare-fun res!214479 () Bool)

(assert (=> b!378604 (=> (not res!214479) (not e!230407))))

(assert (=> b!378604 (= res!214479 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5972))))

(declare-fun mapNonEmpty!15213 () Bool)

(declare-fun tp!30069 () Bool)

(assert (=> mapNonEmpty!15213 (= mapRes!15213 (and tp!30069 e!230408))))

(declare-fun mapKey!15213 () (_ BitVec 32))

(declare-fun mapRest!15213 () (Array (_ BitVec 32) ValueCell!4206))

(declare-fun mapValue!15213 () ValueCell!4206)

(assert (=> mapNonEmpty!15213 (= (arr!10530 _values!506) (store mapRest!15213 mapKey!15213 mapValue!15213))))

(declare-fun b!378605 () Bool)

(declare-fun e!230413 () Bool)

(assert (=> b!378605 (= e!230410 (not e!230413))))

(declare-fun res!214477 () Bool)

(assert (=> b!378605 (=> res!214477 e!230413)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378605 (= res!214477 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6138 0))(
  ( (tuple2!6139 (_1!3080 (_ BitVec 64)) (_2!3080 V!13237)) )
))
(declare-datatypes ((List!5976 0))(
  ( (Nil!5973) (Cons!5972 (h!6828 tuple2!6138) (t!11126 List!5976)) )
))
(declare-datatypes ((ListLongMap!5051 0))(
  ( (ListLongMap!5052 (toList!2541 List!5976)) )
))
(declare-fun lt!176464 () ListLongMap!5051)

(declare-fun zeroValue!472 () V!13237)

(declare-fun minValue!472 () V!13237)

(declare-fun getCurrentListMap!1966 (array!22125 array!22123 (_ BitVec 32) (_ BitVec 32) V!13237 V!13237 (_ BitVec 32) Int) ListLongMap!5051)

(assert (=> b!378605 (= lt!176464 (getCurrentListMap!1966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176457 () array!22123)

(declare-fun lt!176460 () ListLongMap!5051)

(assert (=> b!378605 (= lt!176460 (getCurrentListMap!1966 lt!176458 lt!176457 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176467 () ListLongMap!5051)

(declare-fun lt!176466 () ListLongMap!5051)

(assert (=> b!378605 (and (= lt!176467 lt!176466) (= lt!176466 lt!176467))))

(declare-fun lt!176463 () ListLongMap!5051)

(declare-fun lt!176459 () tuple2!6138)

(declare-fun +!887 (ListLongMap!5051 tuple2!6138) ListLongMap!5051)

(assert (=> b!378605 (= lt!176466 (+!887 lt!176463 lt!176459))))

(declare-fun v!373 () V!13237)

(assert (=> b!378605 (= lt!176459 (tuple2!6139 k0!778 v!373))))

(declare-datatypes ((Unit!11674 0))(
  ( (Unit!11675) )
))
(declare-fun lt!176465 () Unit!11674)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!124 (array!22125 array!22123 (_ BitVec 32) (_ BitVec 32) V!13237 V!13237 (_ BitVec 32) (_ BitVec 64) V!13237 (_ BitVec 32) Int) Unit!11674)

(assert (=> b!378605 (= lt!176465 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!124 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!800 (array!22125 array!22123 (_ BitVec 32) (_ BitVec 32) V!13237 V!13237 (_ BitVec 32) Int) ListLongMap!5051)

(assert (=> b!378605 (= lt!176467 (getCurrentListMapNoExtraKeys!800 lt!176458 lt!176457 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378605 (= lt!176457 (array!22124 (store (arr!10530 _values!506) i!548 (ValueCellFull!4206 v!373)) (size!10882 _values!506)))))

(assert (=> b!378605 (= lt!176463 (getCurrentListMapNoExtraKeys!800 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378606 () Bool)

(declare-fun res!214476 () Bool)

(assert (=> b!378606 (=> (not res!214476) (not e!230407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378606 (= res!214476 (validKeyInArray!0 k0!778))))

(declare-fun b!378607 () Bool)

(declare-fun e!230412 () Bool)

(assert (=> b!378607 (= e!230409 (and e!230412 mapRes!15213))))

(declare-fun condMapEmpty!15213 () Bool)

(declare-fun mapDefault!15213 () ValueCell!4206)

(assert (=> b!378607 (= condMapEmpty!15213 (= (arr!10530 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4206)) mapDefault!15213)))))

(declare-fun b!378608 () Bool)

(declare-fun res!214480 () Bool)

(assert (=> b!378608 (=> (not res!214480) (not e!230407))))

(declare-fun arrayContainsKey!0 (array!22125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378608 (= res!214480 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378609 () Bool)

(declare-fun res!214486 () Bool)

(assert (=> b!378609 (=> (not res!214486) (not e!230407))))

(assert (=> b!378609 (= res!214486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378610 () Bool)

(declare-fun e!230414 () Bool)

(assert (=> b!378610 (= e!230413 e!230414)))

(declare-fun res!214478 () Bool)

(assert (=> b!378610 (=> res!214478 e!230414)))

(assert (=> b!378610 (= res!214478 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176462 () ListLongMap!5051)

(assert (=> b!378610 (= lt!176464 lt!176462)))

(declare-fun lt!176461 () tuple2!6138)

(assert (=> b!378610 (= lt!176462 (+!887 lt!176463 lt!176461))))

(declare-fun lt!176468 () ListLongMap!5051)

(assert (=> b!378610 (= lt!176460 lt!176468)))

(assert (=> b!378610 (= lt!176468 (+!887 lt!176466 lt!176461))))

(assert (=> b!378610 (= lt!176460 (+!887 lt!176467 lt!176461))))

(assert (=> b!378610 (= lt!176461 (tuple2!6139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378611 () Bool)

(declare-fun res!214487 () Bool)

(assert (=> b!378611 (=> (not res!214487) (not e!230407))))

(assert (=> b!378611 (= res!214487 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10883 _keys!658))))))

(declare-fun b!378612 () Bool)

(declare-fun res!214482 () Bool)

(assert (=> b!378612 (=> (not res!214482) (not e!230407))))

(assert (=> b!378612 (= res!214482 (and (= (size!10882 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10883 _keys!658) (size!10882 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378613 () Bool)

(assert (=> b!378613 (= e!230414 true)))

(assert (=> b!378613 (= lt!176468 (+!887 lt!176462 lt!176459))))

(declare-fun lt!176469 () Unit!11674)

(declare-fun addCommutativeForDiffKeys!289 (ListLongMap!5051 (_ BitVec 64) V!13237 (_ BitVec 64) V!13237) Unit!11674)

(assert (=> b!378613 (= lt!176469 (addCommutativeForDiffKeys!289 lt!176463 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378614 () Bool)

(assert (=> b!378614 (= e!230412 tp_is_empty!9099)))

(assert (= (and start!37324 res!214484) b!378612))

(assert (= (and b!378612 res!214482) b!378609))

(assert (= (and b!378609 res!214486) b!378604))

(assert (= (and b!378604 res!214479) b!378611))

(assert (= (and b!378611 res!214487) b!378606))

(assert (= (and b!378606 res!214476) b!378603))

(assert (= (and b!378603 res!214483) b!378608))

(assert (= (and b!378608 res!214480) b!378600))

(assert (= (and b!378600 res!214481) b!378602))

(assert (= (and b!378602 res!214485) b!378605))

(assert (= (and b!378605 (not res!214477)) b!378610))

(assert (= (and b!378610 (not res!214478)) b!378613))

(assert (= (and b!378607 condMapEmpty!15213) mapIsEmpty!15213))

(assert (= (and b!378607 (not condMapEmpty!15213)) mapNonEmpty!15213))

(get-info :version)

(assert (= (and mapNonEmpty!15213 ((_ is ValueCellFull!4206) mapValue!15213)) b!378601))

(assert (= (and b!378607 ((_ is ValueCellFull!4206) mapDefault!15213)) b!378614))

(assert (= start!37324 b!378607))

(declare-fun m!375423 () Bool)

(assert (=> b!378602 m!375423))

(declare-fun m!375425 () Bool)

(assert (=> b!378604 m!375425))

(declare-fun m!375427 () Bool)

(assert (=> b!378609 m!375427))

(declare-fun m!375429 () Bool)

(assert (=> b!378610 m!375429))

(declare-fun m!375431 () Bool)

(assert (=> b!378610 m!375431))

(declare-fun m!375433 () Bool)

(assert (=> b!378610 m!375433))

(declare-fun m!375435 () Bool)

(assert (=> mapNonEmpty!15213 m!375435))

(declare-fun m!375437 () Bool)

(assert (=> start!37324 m!375437))

(declare-fun m!375439 () Bool)

(assert (=> start!37324 m!375439))

(declare-fun m!375441 () Bool)

(assert (=> start!37324 m!375441))

(declare-fun m!375443 () Bool)

(assert (=> b!378605 m!375443))

(declare-fun m!375445 () Bool)

(assert (=> b!378605 m!375445))

(declare-fun m!375447 () Bool)

(assert (=> b!378605 m!375447))

(declare-fun m!375449 () Bool)

(assert (=> b!378605 m!375449))

(declare-fun m!375451 () Bool)

(assert (=> b!378605 m!375451))

(declare-fun m!375453 () Bool)

(assert (=> b!378605 m!375453))

(declare-fun m!375455 () Bool)

(assert (=> b!378605 m!375455))

(declare-fun m!375457 () Bool)

(assert (=> b!378603 m!375457))

(declare-fun m!375459 () Bool)

(assert (=> b!378613 m!375459))

(declare-fun m!375461 () Bool)

(assert (=> b!378613 m!375461))

(declare-fun m!375463 () Bool)

(assert (=> b!378608 m!375463))

(declare-fun m!375465 () Bool)

(assert (=> b!378600 m!375465))

(declare-fun m!375467 () Bool)

(assert (=> b!378600 m!375467))

(declare-fun m!375469 () Bool)

(assert (=> b!378606 m!375469))

(check-sat (not b!378602) (not b!378609) (not b!378605) (not b!378610) tp_is_empty!9099 (not b!378604) (not mapNonEmpty!15213) (not b!378600) (not b!378608) (not b!378606) (not b!378613) b_and!15693 (not b_next!8451) (not start!37324))
(check-sat b_and!15693 (not b_next!8451))
