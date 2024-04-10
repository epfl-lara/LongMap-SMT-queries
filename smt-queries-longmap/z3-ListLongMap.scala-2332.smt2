; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37456 () Bool)

(assert start!37456)

(declare-fun b_free!8583 () Bool)

(declare-fun b_next!8583 () Bool)

(assert (=> start!37456 (= b_free!8583 (not b_next!8583))))

(declare-fun tp!30464 () Bool)

(declare-fun b_and!15825 () Bool)

(assert (=> start!37456 (= tp!30464 b_and!15825)))

(declare-fun b!381520 () Bool)

(declare-fun e!231943 () Bool)

(declare-fun tp_is_empty!9231 () Bool)

(assert (=> b!381520 (= e!231943 tp_is_empty!9231)))

(declare-fun res!216804 () Bool)

(declare-fun e!231944 () Bool)

(assert (=> start!37456 (=> (not res!216804) (not e!231944))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37456 (= res!216804 (validMask!0 mask!970))))

(assert (=> start!37456 e!231944))

(declare-datatypes ((V!13413 0))(
  ( (V!13414 (val!4660 Int)) )
))
(declare-datatypes ((ValueCell!4272 0))(
  ( (ValueCellFull!4272 (v!6857 V!13413)) (EmptyCell!4272) )
))
(declare-datatypes ((array!22377 0))(
  ( (array!22378 (arr!10657 (Array (_ BitVec 32) ValueCell!4272)) (size!11009 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22377)

(declare-fun e!231947 () Bool)

(declare-fun array_inv!7846 (array!22377) Bool)

(assert (=> start!37456 (and (array_inv!7846 _values!506) e!231947)))

(assert (=> start!37456 tp!30464))

(assert (=> start!37456 true))

(assert (=> start!37456 tp_is_empty!9231))

(declare-datatypes ((array!22379 0))(
  ( (array!22380 (arr!10658 (Array (_ BitVec 32) (_ BitVec 64))) (size!11010 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22379)

(declare-fun array_inv!7847 (array!22379) Bool)

(assert (=> start!37456 (array_inv!7847 _keys!658)))

(declare-fun b!381521 () Bool)

(declare-fun res!216807 () Bool)

(assert (=> b!381521 (=> (not res!216807) (not e!231944))))

(declare-datatypes ((List!6091 0))(
  ( (Nil!6088) (Cons!6087 (h!6943 (_ BitVec 64)) (t!11241 List!6091)) )
))
(declare-fun arrayNoDuplicates!0 (array!22379 (_ BitVec 32) List!6091) Bool)

(assert (=> b!381521 (= res!216807 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6088))))

(declare-fun b!381522 () Bool)

(declare-fun res!216812 () Bool)

(assert (=> b!381522 (=> (not res!216812) (not e!231944))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381522 (= res!216812 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11010 _keys!658))))))

(declare-fun b!381523 () Bool)

(declare-fun res!216811 () Bool)

(assert (=> b!381523 (=> (not res!216811) (not e!231944))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381523 (= res!216811 (validKeyInArray!0 k0!778))))

(declare-fun b!381524 () Bool)

(declare-fun res!216806 () Bool)

(assert (=> b!381524 (=> (not res!216806) (not e!231944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22379 (_ BitVec 32)) Bool)

(assert (=> b!381524 (= res!216806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381525 () Bool)

(declare-fun e!231945 () Bool)

(assert (=> b!381525 (= e!231945 tp_is_empty!9231)))

(declare-fun mapNonEmpty!15411 () Bool)

(declare-fun mapRes!15411 () Bool)

(declare-fun tp!30465 () Bool)

(assert (=> mapNonEmpty!15411 (= mapRes!15411 (and tp!30465 e!231945))))

(declare-fun mapRest!15411 () (Array (_ BitVec 32) ValueCell!4272))

(declare-fun mapKey!15411 () (_ BitVec 32))

(declare-fun mapValue!15411 () ValueCell!4272)

(assert (=> mapNonEmpty!15411 (= (arr!10657 _values!506) (store mapRest!15411 mapKey!15411 mapValue!15411))))

(declare-fun b!381526 () Bool)

(declare-fun e!231941 () Bool)

(assert (=> b!381526 (= e!231941 true)))

(declare-datatypes ((tuple2!6260 0))(
  ( (tuple2!6261 (_1!3141 (_ BitVec 64)) (_2!3141 V!13413)) )
))
(declare-datatypes ((List!6092 0))(
  ( (Nil!6089) (Cons!6088 (h!6944 tuple2!6260) (t!11242 List!6092)) )
))
(declare-datatypes ((ListLongMap!5173 0))(
  ( (ListLongMap!5174 (toList!2602 List!6092)) )
))
(declare-fun lt!178837 () ListLongMap!5173)

(declare-fun lt!178831 () ListLongMap!5173)

(assert (=> b!381526 (= lt!178837 lt!178831)))

(declare-fun b!381527 () Bool)

(assert (=> b!381527 (= e!231947 (and e!231943 mapRes!15411))))

(declare-fun condMapEmpty!15411 () Bool)

(declare-fun mapDefault!15411 () ValueCell!4272)

(assert (=> b!381527 (= condMapEmpty!15411 (= (arr!10657 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4272)) mapDefault!15411)))))

(declare-fun b!381528 () Bool)

(declare-fun e!231946 () Bool)

(assert (=> b!381528 (= e!231944 e!231946)))

(declare-fun res!216808 () Bool)

(assert (=> b!381528 (=> (not res!216808) (not e!231946))))

(declare-fun lt!178839 () array!22379)

(assert (=> b!381528 (= res!216808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178839 mask!970))))

(assert (=> b!381528 (= lt!178839 (array!22380 (store (arr!10658 _keys!658) i!548 k0!778) (size!11010 _keys!658)))))

(declare-fun b!381529 () Bool)

(declare-fun res!216805 () Bool)

(assert (=> b!381529 (=> (not res!216805) (not e!231944))))

(assert (=> b!381529 (= res!216805 (or (= (select (arr!10658 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10658 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381530 () Bool)

(assert (=> b!381530 (= e!231946 (not e!231941))))

(declare-fun res!216809 () Bool)

(assert (=> b!381530 (=> res!216809 e!231941)))

(declare-fun lt!178838 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381530 (= res!216809 (or (and (not lt!178838) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178838) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178838)))))

(assert (=> b!381530 (= lt!178838 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!178835 () ListLongMap!5173)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13413)

(declare-fun minValue!472 () V!13413)

(declare-fun getCurrentListMap!2014 (array!22379 array!22377 (_ BitVec 32) (_ BitVec 32) V!13413 V!13413 (_ BitVec 32) Int) ListLongMap!5173)

(assert (=> b!381530 (= lt!178835 (getCurrentListMap!2014 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178832 () array!22377)

(assert (=> b!381530 (= lt!178837 (getCurrentListMap!2014 lt!178839 lt!178832 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178833 () ListLongMap!5173)

(assert (=> b!381530 (and (= lt!178831 lt!178833) (= lt!178833 lt!178831))))

(declare-fun v!373 () V!13413)

(declare-fun lt!178836 () ListLongMap!5173)

(declare-fun +!944 (ListLongMap!5173 tuple2!6260) ListLongMap!5173)

(assert (=> b!381530 (= lt!178833 (+!944 lt!178836 (tuple2!6261 k0!778 v!373)))))

(declare-datatypes ((Unit!11782 0))(
  ( (Unit!11783) )
))
(declare-fun lt!178834 () Unit!11782)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!172 (array!22379 array!22377 (_ BitVec 32) (_ BitVec 32) V!13413 V!13413 (_ BitVec 32) (_ BitVec 64) V!13413 (_ BitVec 32) Int) Unit!11782)

(assert (=> b!381530 (= lt!178834 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!172 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!848 (array!22379 array!22377 (_ BitVec 32) (_ BitVec 32) V!13413 V!13413 (_ BitVec 32) Int) ListLongMap!5173)

(assert (=> b!381530 (= lt!178831 (getCurrentListMapNoExtraKeys!848 lt!178839 lt!178832 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381530 (= lt!178832 (array!22378 (store (arr!10657 _values!506) i!548 (ValueCellFull!4272 v!373)) (size!11009 _values!506)))))

(assert (=> b!381530 (= lt!178836 (getCurrentListMapNoExtraKeys!848 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381531 () Bool)

(declare-fun res!216810 () Bool)

(assert (=> b!381531 (=> (not res!216810) (not e!231946))))

(assert (=> b!381531 (= res!216810 (arrayNoDuplicates!0 lt!178839 #b00000000000000000000000000000000 Nil!6088))))

(declare-fun mapIsEmpty!15411 () Bool)

(assert (=> mapIsEmpty!15411 mapRes!15411))

(declare-fun b!381532 () Bool)

(declare-fun res!216803 () Bool)

(assert (=> b!381532 (=> (not res!216803) (not e!231944))))

(assert (=> b!381532 (= res!216803 (and (= (size!11009 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11010 _keys!658) (size!11009 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381533 () Bool)

(declare-fun res!216802 () Bool)

(assert (=> b!381533 (=> (not res!216802) (not e!231944))))

(declare-fun arrayContainsKey!0 (array!22379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381533 (= res!216802 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37456 res!216804) b!381532))

(assert (= (and b!381532 res!216803) b!381524))

(assert (= (and b!381524 res!216806) b!381521))

(assert (= (and b!381521 res!216807) b!381522))

(assert (= (and b!381522 res!216812) b!381523))

(assert (= (and b!381523 res!216811) b!381529))

(assert (= (and b!381529 res!216805) b!381533))

(assert (= (and b!381533 res!216802) b!381528))

(assert (= (and b!381528 res!216808) b!381531))

(assert (= (and b!381531 res!216810) b!381530))

(assert (= (and b!381530 (not res!216809)) b!381526))

(assert (= (and b!381527 condMapEmpty!15411) mapIsEmpty!15411))

(assert (= (and b!381527 (not condMapEmpty!15411)) mapNonEmpty!15411))

(get-info :version)

(assert (= (and mapNonEmpty!15411 ((_ is ValueCellFull!4272) mapValue!15411)) b!381525))

(assert (= (and b!381527 ((_ is ValueCellFull!4272) mapDefault!15411)) b!381520))

(assert (= start!37456 b!381527))

(declare-fun m!378431 () Bool)

(assert (=> start!37456 m!378431))

(declare-fun m!378433 () Bool)

(assert (=> start!37456 m!378433))

(declare-fun m!378435 () Bool)

(assert (=> start!37456 m!378435))

(declare-fun m!378437 () Bool)

(assert (=> b!381530 m!378437))

(declare-fun m!378439 () Bool)

(assert (=> b!381530 m!378439))

(declare-fun m!378441 () Bool)

(assert (=> b!381530 m!378441))

(declare-fun m!378443 () Bool)

(assert (=> b!381530 m!378443))

(declare-fun m!378445 () Bool)

(assert (=> b!381530 m!378445))

(declare-fun m!378447 () Bool)

(assert (=> b!381530 m!378447))

(declare-fun m!378449 () Bool)

(assert (=> b!381530 m!378449))

(declare-fun m!378451 () Bool)

(assert (=> b!381528 m!378451))

(declare-fun m!378453 () Bool)

(assert (=> b!381528 m!378453))

(declare-fun m!378455 () Bool)

(assert (=> b!381529 m!378455))

(declare-fun m!378457 () Bool)

(assert (=> mapNonEmpty!15411 m!378457))

(declare-fun m!378459 () Bool)

(assert (=> b!381524 m!378459))

(declare-fun m!378461 () Bool)

(assert (=> b!381523 m!378461))

(declare-fun m!378463 () Bool)

(assert (=> b!381521 m!378463))

(declare-fun m!378465 () Bool)

(assert (=> b!381533 m!378465))

(declare-fun m!378467 () Bool)

(assert (=> b!381531 m!378467))

(check-sat (not b!381524) b_and!15825 (not b!381523) (not b!381530) tp_is_empty!9231 (not b!381528) (not start!37456) (not b!381531) (not mapNonEmpty!15411) (not b!381521) (not b!381533) (not b_next!8583))
(check-sat b_and!15825 (not b_next!8583))
