; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36892 () Bool)

(assert start!36892)

(declare-fun b_free!8019 () Bool)

(declare-fun b_next!8019 () Bool)

(assert (=> start!36892 (= b_free!8019 (not b_next!8019))))

(declare-fun tp!28772 () Bool)

(declare-fun b_and!15261 () Bool)

(assert (=> start!36892 (= tp!28772 b_and!15261)))

(declare-fun b!369410 () Bool)

(declare-fun res!207231 () Bool)

(declare-fun e!225784 () Bool)

(assert (=> b!369410 (=> (not res!207231) (not e!225784))))

(declare-datatypes ((array!21285 0))(
  ( (array!21286 (arr!10111 (Array (_ BitVec 32) (_ BitVec 64))) (size!10463 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21285)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369410 (= res!207231 (or (= (select (arr!10111 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10111 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369411 () Bool)

(declare-fun res!207236 () Bool)

(assert (=> b!369411 (=> (not res!207236) (not e!225784))))

(assert (=> b!369411 (= res!207236 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10463 _keys!658))))))

(declare-fun b!369412 () Bool)

(declare-fun e!225785 () Bool)

(declare-fun tp_is_empty!8667 () Bool)

(assert (=> b!369412 (= e!225785 tp_is_empty!8667)))

(declare-fun b!369413 () Bool)

(declare-fun res!207230 () Bool)

(assert (=> b!369413 (=> (not res!207230) (not e!225784))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369413 (= res!207230 (validKeyInArray!0 k0!778))))

(declare-fun b!369414 () Bool)

(declare-fun e!225781 () Bool)

(declare-fun e!225780 () Bool)

(declare-fun mapRes!14565 () Bool)

(assert (=> b!369414 (= e!225781 (and e!225780 mapRes!14565))))

(declare-fun condMapEmpty!14565 () Bool)

(declare-datatypes ((V!12661 0))(
  ( (V!12662 (val!4378 Int)) )
))
(declare-datatypes ((ValueCell!3990 0))(
  ( (ValueCellFull!3990 (v!6575 V!12661)) (EmptyCell!3990) )
))
(declare-datatypes ((array!21287 0))(
  ( (array!21288 (arr!10112 (Array (_ BitVec 32) ValueCell!3990)) (size!10464 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21287)

(declare-fun mapDefault!14565 () ValueCell!3990)

(assert (=> b!369414 (= condMapEmpty!14565 (= (arr!10112 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3990)) mapDefault!14565)))))

(declare-fun b!369415 () Bool)

(declare-fun res!207234 () Bool)

(declare-fun e!225782 () Bool)

(assert (=> b!369415 (=> (not res!207234) (not e!225782))))

(declare-fun lt!169731 () array!21285)

(declare-datatypes ((List!5642 0))(
  ( (Nil!5639) (Cons!5638 (h!6494 (_ BitVec 64)) (t!10792 List!5642)) )
))
(declare-fun arrayNoDuplicates!0 (array!21285 (_ BitVec 32) List!5642) Bool)

(assert (=> b!369415 (= res!207234 (arrayNoDuplicates!0 lt!169731 #b00000000000000000000000000000000 Nil!5639))))

(declare-fun res!207232 () Bool)

(assert (=> start!36892 (=> (not res!207232) (not e!225784))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36892 (= res!207232 (validMask!0 mask!970))))

(assert (=> start!36892 e!225784))

(declare-fun array_inv!7474 (array!21287) Bool)

(assert (=> start!36892 (and (array_inv!7474 _values!506) e!225781)))

(assert (=> start!36892 tp!28772))

(assert (=> start!36892 true))

(assert (=> start!36892 tp_is_empty!8667))

(declare-fun array_inv!7475 (array!21285) Bool)

(assert (=> start!36892 (array_inv!7475 _keys!658)))

(declare-fun b!369416 () Bool)

(assert (=> b!369416 (= e!225782 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12661)

(declare-datatypes ((tuple2!5808 0))(
  ( (tuple2!5809 (_1!2915 (_ BitVec 64)) (_2!2915 V!12661)) )
))
(declare-datatypes ((List!5643 0))(
  ( (Nil!5640) (Cons!5639 (h!6495 tuple2!5808) (t!10793 List!5643)) )
))
(declare-datatypes ((ListLongMap!4721 0))(
  ( (ListLongMap!4722 (toList!2376 List!5643)) )
))
(declare-fun lt!169729 () ListLongMap!4721)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12661)

(declare-fun minValue!472 () V!12661)

(declare-fun getCurrentListMapNoExtraKeys!653 (array!21285 array!21287 (_ BitVec 32) (_ BitVec 32) V!12661 V!12661 (_ BitVec 32) Int) ListLongMap!4721)

(assert (=> b!369416 (= lt!169729 (getCurrentListMapNoExtraKeys!653 lt!169731 (array!21288 (store (arr!10112 _values!506) i!548 (ValueCellFull!3990 v!373)) (size!10464 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169730 () ListLongMap!4721)

(assert (=> b!369416 (= lt!169730 (getCurrentListMapNoExtraKeys!653 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14565 () Bool)

(assert (=> mapIsEmpty!14565 mapRes!14565))

(declare-fun b!369417 () Bool)

(declare-fun res!207239 () Bool)

(assert (=> b!369417 (=> (not res!207239) (not e!225784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21285 (_ BitVec 32)) Bool)

(assert (=> b!369417 (= res!207239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369418 () Bool)

(declare-fun res!207233 () Bool)

(assert (=> b!369418 (=> (not res!207233) (not e!225784))))

(declare-fun arrayContainsKey!0 (array!21285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369418 (= res!207233 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369419 () Bool)

(assert (=> b!369419 (= e!225784 e!225782)))

(declare-fun res!207238 () Bool)

(assert (=> b!369419 (=> (not res!207238) (not e!225782))))

(assert (=> b!369419 (= res!207238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169731 mask!970))))

(assert (=> b!369419 (= lt!169731 (array!21286 (store (arr!10111 _keys!658) i!548 k0!778) (size!10463 _keys!658)))))

(declare-fun mapNonEmpty!14565 () Bool)

(declare-fun tp!28773 () Bool)

(assert (=> mapNonEmpty!14565 (= mapRes!14565 (and tp!28773 e!225785))))

(declare-fun mapRest!14565 () (Array (_ BitVec 32) ValueCell!3990))

(declare-fun mapKey!14565 () (_ BitVec 32))

(declare-fun mapValue!14565 () ValueCell!3990)

(assert (=> mapNonEmpty!14565 (= (arr!10112 _values!506) (store mapRest!14565 mapKey!14565 mapValue!14565))))

(declare-fun b!369420 () Bool)

(assert (=> b!369420 (= e!225780 tp_is_empty!8667)))

(declare-fun b!369421 () Bool)

(declare-fun res!207235 () Bool)

(assert (=> b!369421 (=> (not res!207235) (not e!225784))))

(assert (=> b!369421 (= res!207235 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5639))))

(declare-fun b!369422 () Bool)

(declare-fun res!207237 () Bool)

(assert (=> b!369422 (=> (not res!207237) (not e!225784))))

(assert (=> b!369422 (= res!207237 (and (= (size!10464 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10463 _keys!658) (size!10464 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!36892 res!207232) b!369422))

(assert (= (and b!369422 res!207237) b!369417))

(assert (= (and b!369417 res!207239) b!369421))

(assert (= (and b!369421 res!207235) b!369411))

(assert (= (and b!369411 res!207236) b!369413))

(assert (= (and b!369413 res!207230) b!369410))

(assert (= (and b!369410 res!207231) b!369418))

(assert (= (and b!369418 res!207233) b!369419))

(assert (= (and b!369419 res!207238) b!369415))

(assert (= (and b!369415 res!207234) b!369416))

(assert (= (and b!369414 condMapEmpty!14565) mapIsEmpty!14565))

(assert (= (and b!369414 (not condMapEmpty!14565)) mapNonEmpty!14565))

(get-info :version)

(assert (= (and mapNonEmpty!14565 ((_ is ValueCellFull!3990) mapValue!14565)) b!369412))

(assert (= (and b!369414 ((_ is ValueCellFull!3990) mapDefault!14565)) b!369420))

(assert (= start!36892 b!369414))

(declare-fun m!365793 () Bool)

(assert (=> b!369418 m!365793))

(declare-fun m!365795 () Bool)

(assert (=> b!369413 m!365795))

(declare-fun m!365797 () Bool)

(assert (=> b!369415 m!365797))

(declare-fun m!365799 () Bool)

(assert (=> mapNonEmpty!14565 m!365799))

(declare-fun m!365801 () Bool)

(assert (=> b!369416 m!365801))

(declare-fun m!365803 () Bool)

(assert (=> b!369416 m!365803))

(declare-fun m!365805 () Bool)

(assert (=> b!369416 m!365805))

(declare-fun m!365807 () Bool)

(assert (=> b!369410 m!365807))

(declare-fun m!365809 () Bool)

(assert (=> b!369421 m!365809))

(declare-fun m!365811 () Bool)

(assert (=> start!36892 m!365811))

(declare-fun m!365813 () Bool)

(assert (=> start!36892 m!365813))

(declare-fun m!365815 () Bool)

(assert (=> start!36892 m!365815))

(declare-fun m!365817 () Bool)

(assert (=> b!369417 m!365817))

(declare-fun m!365819 () Bool)

(assert (=> b!369419 m!365819))

(declare-fun m!365821 () Bool)

(assert (=> b!369419 m!365821))

(check-sat b_and!15261 (not b!369416) (not b_next!8019) (not b!369421) (not b!369415) (not start!36892) (not b!369418) (not b!369419) (not b!369417) (not mapNonEmpty!14565) tp_is_empty!8667 (not b!369413))
(check-sat b_and!15261 (not b_next!8019))
