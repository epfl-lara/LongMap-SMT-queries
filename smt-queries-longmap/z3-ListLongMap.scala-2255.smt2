; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36994 () Bool)

(assert start!36994)

(declare-fun b_free!8121 () Bool)

(declare-fun b_next!8121 () Bool)

(assert (=> start!36994 (= b_free!8121 (not b_next!8121))))

(declare-fun tp!29079 () Bool)

(declare-fun b_and!15363 () Bool)

(assert (=> start!36994 (= tp!29079 b_and!15363)))

(declare-fun b!371399 () Bool)

(declare-fun e!226702 () Bool)

(assert (=> b!371399 (= e!226702 (not true))))

(declare-datatypes ((V!12797 0))(
  ( (V!12798 (val!4429 Int)) )
))
(declare-datatypes ((tuple2!5878 0))(
  ( (tuple2!5879 (_1!2950 (_ BitVec 64)) (_2!2950 V!12797)) )
))
(declare-datatypes ((List!5717 0))(
  ( (Nil!5714) (Cons!5713 (h!6569 tuple2!5878) (t!10867 List!5717)) )
))
(declare-datatypes ((ListLongMap!4791 0))(
  ( (ListLongMap!4792 (toList!2411 List!5717)) )
))
(declare-fun lt!170273 () ListLongMap!4791)

(declare-fun lt!170272 () ListLongMap!4791)

(assert (=> b!371399 (and (= lt!170273 lt!170272) (= lt!170272 lt!170273))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!170270 () ListLongMap!4791)

(declare-fun v!373 () V!12797)

(declare-fun +!757 (ListLongMap!4791 tuple2!5878) ListLongMap!4791)

(assert (=> b!371399 (= lt!170272 (+!757 lt!170270 (tuple2!5879 k0!778 v!373)))))

(declare-datatypes ((ValueCell!4041 0))(
  ( (ValueCellFull!4041 (v!6626 V!12797)) (EmptyCell!4041) )
))
(declare-datatypes ((array!21479 0))(
  ( (array!21480 (arr!10208 (Array (_ BitVec 32) ValueCell!4041)) (size!10560 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21479)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12797)

(declare-datatypes ((Unit!11420 0))(
  ( (Unit!11421) )
))
(declare-fun lt!170271 () Unit!11420)

(declare-datatypes ((array!21481 0))(
  ( (array!21482 (arr!10209 (Array (_ BitVec 32) (_ BitVec 64))) (size!10561 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21481)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12797)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!12 (array!21481 array!21479 (_ BitVec 32) (_ BitVec 32) V!12797 V!12797 (_ BitVec 32) (_ BitVec 64) V!12797 (_ BitVec 32) Int) Unit!11420)

(assert (=> b!371399 (= lt!170271 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!12 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170274 () array!21481)

(declare-fun getCurrentListMapNoExtraKeys!688 (array!21481 array!21479 (_ BitVec 32) (_ BitVec 32) V!12797 V!12797 (_ BitVec 32) Int) ListLongMap!4791)

(assert (=> b!371399 (= lt!170273 (getCurrentListMapNoExtraKeys!688 lt!170274 (array!21480 (store (arr!10208 _values!506) i!548 (ValueCellFull!4041 v!373)) (size!10560 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371399 (= lt!170270 (getCurrentListMapNoExtraKeys!688 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371400 () Bool)

(declare-fun res!208763 () Bool)

(declare-fun e!226703 () Bool)

(assert (=> b!371400 (=> (not res!208763) (not e!226703))))

(assert (=> b!371400 (= res!208763 (or (= (select (arr!10209 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10209 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!208769 () Bool)

(assert (=> start!36994 (=> (not res!208769) (not e!226703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36994 (= res!208769 (validMask!0 mask!970))))

(assert (=> start!36994 e!226703))

(declare-fun e!226700 () Bool)

(declare-fun array_inv!7538 (array!21479) Bool)

(assert (=> start!36994 (and (array_inv!7538 _values!506) e!226700)))

(assert (=> start!36994 tp!29079))

(assert (=> start!36994 true))

(declare-fun tp_is_empty!8769 () Bool)

(assert (=> start!36994 tp_is_empty!8769))

(declare-fun array_inv!7539 (array!21481) Bool)

(assert (=> start!36994 (array_inv!7539 _keys!658)))

(declare-fun b!371401 () Bool)

(declare-fun res!208760 () Bool)

(assert (=> b!371401 (=> (not res!208760) (not e!226703))))

(declare-datatypes ((List!5718 0))(
  ( (Nil!5715) (Cons!5714 (h!6570 (_ BitVec 64)) (t!10868 List!5718)) )
))
(declare-fun arrayNoDuplicates!0 (array!21481 (_ BitVec 32) List!5718) Bool)

(assert (=> b!371401 (= res!208760 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5715))))

(declare-fun b!371402 () Bool)

(declare-fun e!226699 () Bool)

(assert (=> b!371402 (= e!226699 tp_is_empty!8769)))

(declare-fun b!371403 () Bool)

(declare-fun e!226698 () Bool)

(declare-fun mapRes!14718 () Bool)

(assert (=> b!371403 (= e!226700 (and e!226698 mapRes!14718))))

(declare-fun condMapEmpty!14718 () Bool)

(declare-fun mapDefault!14718 () ValueCell!4041)

(assert (=> b!371403 (= condMapEmpty!14718 (= (arr!10208 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4041)) mapDefault!14718)))))

(declare-fun b!371404 () Bool)

(declare-fun res!208762 () Bool)

(assert (=> b!371404 (=> (not res!208762) (not e!226703))))

(assert (=> b!371404 (= res!208762 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10561 _keys!658))))))

(declare-fun mapIsEmpty!14718 () Bool)

(assert (=> mapIsEmpty!14718 mapRes!14718))

(declare-fun b!371405 () Bool)

(declare-fun res!208765 () Bool)

(assert (=> b!371405 (=> (not res!208765) (not e!226702))))

(assert (=> b!371405 (= res!208765 (arrayNoDuplicates!0 lt!170274 #b00000000000000000000000000000000 Nil!5715))))

(declare-fun b!371406 () Bool)

(declare-fun res!208767 () Bool)

(assert (=> b!371406 (=> (not res!208767) (not e!226703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21481 (_ BitVec 32)) Bool)

(assert (=> b!371406 (= res!208767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371407 () Bool)

(assert (=> b!371407 (= e!226698 tp_is_empty!8769)))

(declare-fun mapNonEmpty!14718 () Bool)

(declare-fun tp!29078 () Bool)

(assert (=> mapNonEmpty!14718 (= mapRes!14718 (and tp!29078 e!226699))))

(declare-fun mapKey!14718 () (_ BitVec 32))

(declare-fun mapValue!14718 () ValueCell!4041)

(declare-fun mapRest!14718 () (Array (_ BitVec 32) ValueCell!4041))

(assert (=> mapNonEmpty!14718 (= (arr!10208 _values!506) (store mapRest!14718 mapKey!14718 mapValue!14718))))

(declare-fun b!371408 () Bool)

(declare-fun res!208764 () Bool)

(assert (=> b!371408 (=> (not res!208764) (not e!226703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371408 (= res!208764 (validKeyInArray!0 k0!778))))

(declare-fun b!371409 () Bool)

(assert (=> b!371409 (= e!226703 e!226702)))

(declare-fun res!208766 () Bool)

(assert (=> b!371409 (=> (not res!208766) (not e!226702))))

(assert (=> b!371409 (= res!208766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170274 mask!970))))

(assert (=> b!371409 (= lt!170274 (array!21482 (store (arr!10209 _keys!658) i!548 k0!778) (size!10561 _keys!658)))))

(declare-fun b!371410 () Bool)

(declare-fun res!208761 () Bool)

(assert (=> b!371410 (=> (not res!208761) (not e!226703))))

(assert (=> b!371410 (= res!208761 (and (= (size!10560 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10561 _keys!658) (size!10560 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371411 () Bool)

(declare-fun res!208768 () Bool)

(assert (=> b!371411 (=> (not res!208768) (not e!226703))))

(declare-fun arrayContainsKey!0 (array!21481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371411 (= res!208768 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36994 res!208769) b!371410))

(assert (= (and b!371410 res!208761) b!371406))

(assert (= (and b!371406 res!208767) b!371401))

(assert (= (and b!371401 res!208760) b!371404))

(assert (= (and b!371404 res!208762) b!371408))

(assert (= (and b!371408 res!208764) b!371400))

(assert (= (and b!371400 res!208763) b!371411))

(assert (= (and b!371411 res!208768) b!371409))

(assert (= (and b!371409 res!208766) b!371405))

(assert (= (and b!371405 res!208765) b!371399))

(assert (= (and b!371403 condMapEmpty!14718) mapIsEmpty!14718))

(assert (= (and b!371403 (not condMapEmpty!14718)) mapNonEmpty!14718))

(get-info :version)

(assert (= (and mapNonEmpty!14718 ((_ is ValueCellFull!4041) mapValue!14718)) b!371402))

(assert (= (and b!371403 ((_ is ValueCellFull!4041) mapDefault!14718)) b!371407))

(assert (= start!36994 b!371403))

(declare-fun m!367375 () Bool)

(assert (=> b!371408 m!367375))

(declare-fun m!367377 () Bool)

(assert (=> b!371401 m!367377))

(declare-fun m!367379 () Bool)

(assert (=> b!371405 m!367379))

(declare-fun m!367381 () Bool)

(assert (=> b!371406 m!367381))

(declare-fun m!367383 () Bool)

(assert (=> b!371411 m!367383))

(declare-fun m!367385 () Bool)

(assert (=> b!371400 m!367385))

(declare-fun m!367387 () Bool)

(assert (=> b!371399 m!367387))

(declare-fun m!367389 () Bool)

(assert (=> b!371399 m!367389))

(declare-fun m!367391 () Bool)

(assert (=> b!371399 m!367391))

(declare-fun m!367393 () Bool)

(assert (=> b!371399 m!367393))

(declare-fun m!367395 () Bool)

(assert (=> b!371399 m!367395))

(declare-fun m!367397 () Bool)

(assert (=> mapNonEmpty!14718 m!367397))

(declare-fun m!367399 () Bool)

(assert (=> b!371409 m!367399))

(declare-fun m!367401 () Bool)

(assert (=> b!371409 m!367401))

(declare-fun m!367403 () Bool)

(assert (=> start!36994 m!367403))

(declare-fun m!367405 () Bool)

(assert (=> start!36994 m!367405))

(declare-fun m!367407 () Bool)

(assert (=> start!36994 m!367407))

(check-sat (not b!371408) (not mapNonEmpty!14718) (not b!371406) (not b!371405) (not b!371409) (not b!371401) (not b_next!8121) (not start!36994) (not b!371411) tp_is_empty!8769 b_and!15363 (not b!371399))
(check-sat b_and!15363 (not b_next!8121))
