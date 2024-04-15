; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36888 () Bool)

(assert start!36888)

(declare-fun b_free!8029 () Bool)

(declare-fun b_next!8029 () Bool)

(assert (=> start!36888 (= b_free!8029 (not b_next!8029))))

(declare-fun tp!28803 () Bool)

(declare-fun b_and!15245 () Bool)

(assert (=> start!36888 (= tp!28803 b_and!15245)))

(declare-fun b!369334 () Bool)

(declare-fun e!225701 () Bool)

(declare-fun e!225698 () Bool)

(declare-fun mapRes!14580 () Bool)

(assert (=> b!369334 (= e!225701 (and e!225698 mapRes!14580))))

(declare-fun condMapEmpty!14580 () Bool)

(declare-datatypes ((V!12675 0))(
  ( (V!12676 (val!4383 Int)) )
))
(declare-datatypes ((ValueCell!3995 0))(
  ( (ValueCellFull!3995 (v!6574 V!12675)) (EmptyCell!3995) )
))
(declare-datatypes ((array!21289 0))(
  ( (array!21290 (arr!10113 (Array (_ BitVec 32) ValueCell!3995)) (size!10466 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21289)

(declare-fun mapDefault!14580 () ValueCell!3995)

(assert (=> b!369334 (= condMapEmpty!14580 (= (arr!10113 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3995)) mapDefault!14580)))))

(declare-fun b!369335 () Bool)

(declare-fun res!207256 () Bool)

(declare-fun e!225699 () Bool)

(assert (=> b!369335 (=> (not res!207256) (not e!225699))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369335 (= res!207256 (validKeyInArray!0 k0!778))))

(declare-fun b!369336 () Bool)

(declare-fun res!207251 () Bool)

(assert (=> b!369336 (=> (not res!207251) (not e!225699))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21291 0))(
  ( (array!21292 (arr!10114 (Array (_ BitVec 32) (_ BitVec 64))) (size!10467 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21291)

(assert (=> b!369336 (= res!207251 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10467 _keys!658))))))

(declare-fun b!369337 () Bool)

(declare-fun res!207259 () Bool)

(assert (=> b!369337 (=> (not res!207259) (not e!225699))))

(declare-fun arrayContainsKey!0 (array!21291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369337 (= res!207259 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369338 () Bool)

(declare-fun res!207258 () Bool)

(declare-fun e!225700 () Bool)

(assert (=> b!369338 (=> (not res!207258) (not e!225700))))

(declare-fun lt!169540 () array!21291)

(declare-datatypes ((List!5616 0))(
  ( (Nil!5613) (Cons!5612 (h!6468 (_ BitVec 64)) (t!10757 List!5616)) )
))
(declare-fun arrayNoDuplicates!0 (array!21291 (_ BitVec 32) List!5616) Bool)

(assert (=> b!369338 (= res!207258 (arrayNoDuplicates!0 lt!169540 #b00000000000000000000000000000000 Nil!5613))))

(declare-fun b!369339 () Bool)

(declare-fun tp_is_empty!8677 () Bool)

(assert (=> b!369339 (= e!225698 tp_is_empty!8677)))

(declare-fun b!369340 () Bool)

(declare-fun e!225696 () Bool)

(assert (=> b!369340 (= e!225696 tp_is_empty!8677)))

(declare-fun b!369341 () Bool)

(assert (=> b!369341 (= e!225700 false)))

(declare-datatypes ((tuple2!5786 0))(
  ( (tuple2!5787 (_1!2904 (_ BitVec 64)) (_2!2904 V!12675)) )
))
(declare-datatypes ((List!5617 0))(
  ( (Nil!5614) (Cons!5613 (h!6469 tuple2!5786) (t!10758 List!5617)) )
))
(declare-datatypes ((ListLongMap!4689 0))(
  ( (ListLongMap!4690 (toList!2360 List!5617)) )
))
(declare-fun lt!169541 () ListLongMap!4689)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12675)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12675)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12675)

(declare-fun getCurrentListMapNoExtraKeys!651 (array!21291 array!21289 (_ BitVec 32) (_ BitVec 32) V!12675 V!12675 (_ BitVec 32) Int) ListLongMap!4689)

(assert (=> b!369341 (= lt!169541 (getCurrentListMapNoExtraKeys!651 lt!169540 (array!21290 (store (arr!10113 _values!506) i!548 (ValueCellFull!3995 v!373)) (size!10466 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169542 () ListLongMap!4689)

(assert (=> b!369341 (= lt!169542 (getCurrentListMapNoExtraKeys!651 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369342 () Bool)

(assert (=> b!369342 (= e!225699 e!225700)))

(declare-fun res!207253 () Bool)

(assert (=> b!369342 (=> (not res!207253) (not e!225700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21291 (_ BitVec 32)) Bool)

(assert (=> b!369342 (= res!207253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169540 mask!970))))

(assert (=> b!369342 (= lt!169540 (array!21292 (store (arr!10114 _keys!658) i!548 k0!778) (size!10467 _keys!658)))))

(declare-fun b!369343 () Bool)

(declare-fun res!207254 () Bool)

(assert (=> b!369343 (=> (not res!207254) (not e!225699))))

(assert (=> b!369343 (= res!207254 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5613))))

(declare-fun b!369344 () Bool)

(declare-fun res!207257 () Bool)

(assert (=> b!369344 (=> (not res!207257) (not e!225699))))

(assert (=> b!369344 (= res!207257 (or (= (select (arr!10114 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10114 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14580 () Bool)

(assert (=> mapIsEmpty!14580 mapRes!14580))

(declare-fun b!369345 () Bool)

(declare-fun res!207260 () Bool)

(assert (=> b!369345 (=> (not res!207260) (not e!225699))))

(assert (=> b!369345 (= res!207260 (and (= (size!10466 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10467 _keys!658) (size!10466 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369346 () Bool)

(declare-fun res!207255 () Bool)

(assert (=> b!369346 (=> (not res!207255) (not e!225699))))

(assert (=> b!369346 (= res!207255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14580 () Bool)

(declare-fun tp!28802 () Bool)

(assert (=> mapNonEmpty!14580 (= mapRes!14580 (and tp!28802 e!225696))))

(declare-fun mapKey!14580 () (_ BitVec 32))

(declare-fun mapValue!14580 () ValueCell!3995)

(declare-fun mapRest!14580 () (Array (_ BitVec 32) ValueCell!3995))

(assert (=> mapNonEmpty!14580 (= (arr!10113 _values!506) (store mapRest!14580 mapKey!14580 mapValue!14580))))

(declare-fun res!207252 () Bool)

(assert (=> start!36888 (=> (not res!207252) (not e!225699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36888 (= res!207252 (validMask!0 mask!970))))

(assert (=> start!36888 e!225699))

(declare-fun array_inv!7488 (array!21289) Bool)

(assert (=> start!36888 (and (array_inv!7488 _values!506) e!225701)))

(assert (=> start!36888 tp!28803))

(assert (=> start!36888 true))

(assert (=> start!36888 tp_is_empty!8677))

(declare-fun array_inv!7489 (array!21291) Bool)

(assert (=> start!36888 (array_inv!7489 _keys!658)))

(assert (= (and start!36888 res!207252) b!369345))

(assert (= (and b!369345 res!207260) b!369346))

(assert (= (and b!369346 res!207255) b!369343))

(assert (= (and b!369343 res!207254) b!369336))

(assert (= (and b!369336 res!207251) b!369335))

(assert (= (and b!369335 res!207256) b!369344))

(assert (= (and b!369344 res!207257) b!369337))

(assert (= (and b!369337 res!207259) b!369342))

(assert (= (and b!369342 res!207253) b!369338))

(assert (= (and b!369338 res!207258) b!369341))

(assert (= (and b!369334 condMapEmpty!14580) mapIsEmpty!14580))

(assert (= (and b!369334 (not condMapEmpty!14580)) mapNonEmpty!14580))

(get-info :version)

(assert (= (and mapNonEmpty!14580 ((_ is ValueCellFull!3995) mapValue!14580)) b!369340))

(assert (= (and b!369334 ((_ is ValueCellFull!3995) mapDefault!14580)) b!369339))

(assert (= start!36888 b!369334))

(declare-fun m!365219 () Bool)

(assert (=> b!369346 m!365219))

(declare-fun m!365221 () Bool)

(assert (=> b!369337 m!365221))

(declare-fun m!365223 () Bool)

(assert (=> b!369344 m!365223))

(declare-fun m!365225 () Bool)

(assert (=> b!369341 m!365225))

(declare-fun m!365227 () Bool)

(assert (=> b!369341 m!365227))

(declare-fun m!365229 () Bool)

(assert (=> b!369341 m!365229))

(declare-fun m!365231 () Bool)

(assert (=> b!369338 m!365231))

(declare-fun m!365233 () Bool)

(assert (=> start!36888 m!365233))

(declare-fun m!365235 () Bool)

(assert (=> start!36888 m!365235))

(declare-fun m!365237 () Bool)

(assert (=> start!36888 m!365237))

(declare-fun m!365239 () Bool)

(assert (=> b!369343 m!365239))

(declare-fun m!365241 () Bool)

(assert (=> b!369342 m!365241))

(declare-fun m!365243 () Bool)

(assert (=> b!369342 m!365243))

(declare-fun m!365245 () Bool)

(assert (=> mapNonEmpty!14580 m!365245))

(declare-fun m!365247 () Bool)

(assert (=> b!369335 m!365247))

(check-sat (not b!369346) (not mapNonEmpty!14580) (not b!369335) (not b!369337) tp_is_empty!8677 (not b!369341) (not start!36888) (not b!369342) (not b_next!8029) (not b!369338) (not b!369343) b_and!15245)
(check-sat b_and!15245 (not b_next!8029))
