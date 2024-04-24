; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38582 () Bool)

(assert start!38582)

(declare-fun b_free!9133 () Bool)

(declare-fun b_next!9133 () Bool)

(assert (=> start!38582 (= b_free!9133 (not b_next!9133))))

(declare-fun tp!32522 () Bool)

(declare-fun b_and!16533 () Bool)

(assert (=> start!38582 (= tp!32522 b_and!16533)))

(declare-fun mapNonEmpty!16644 () Bool)

(declare-fun mapRes!16644 () Bool)

(declare-fun tp!32523 () Bool)

(declare-fun e!241368 () Bool)

(assert (=> mapNonEmpty!16644 (= mapRes!16644 (and tp!32523 e!241368))))

(declare-datatypes ((V!14459 0))(
  ( (V!14460 (val!5052 Int)) )
))
(declare-datatypes ((ValueCell!4664 0))(
  ( (ValueCellFull!4664 (v!7300 V!14459)) (EmptyCell!4664) )
))
(declare-datatypes ((array!23918 0))(
  ( (array!23919 (arr!11408 (Array (_ BitVec 32) ValueCell!4664)) (size!11760 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23918)

(declare-fun mapValue!16644 () ValueCell!4664)

(declare-fun mapKey!16644 () (_ BitVec 32))

(declare-fun mapRest!16644 () (Array (_ BitVec 32) ValueCell!4664))

(assert (=> mapNonEmpty!16644 (= (arr!11408 _values!549) (store mapRest!16644 mapKey!16644 mapValue!16644))))

(declare-fun b!399802 () Bool)

(declare-fun res!229974 () Bool)

(declare-fun e!241371 () Bool)

(assert (=> b!399802 (=> (not res!229974) (not e!241371))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23920 0))(
  ( (array!23921 (arr!11409 (Array (_ BitVec 32) (_ BitVec 64))) (size!11761 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23920)

(assert (=> b!399802 (= res!229974 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11761 _keys!709))))))

(declare-fun b!399803 () Bool)

(declare-fun res!229971 () Bool)

(assert (=> b!399803 (=> (not res!229971) (not e!241371))))

(declare-datatypes ((List!6476 0))(
  ( (Nil!6473) (Cons!6472 (h!7328 (_ BitVec 64)) (t!11642 List!6476)) )
))
(declare-fun arrayNoDuplicates!0 (array!23920 (_ BitVec 32) List!6476) Bool)

(assert (=> b!399803 (= res!229971 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6473))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!241367 () Bool)

(declare-datatypes ((tuple2!6556 0))(
  ( (tuple2!6557 (_1!3289 (_ BitVec 64)) (_2!3289 V!14459)) )
))
(declare-datatypes ((List!6477 0))(
  ( (Nil!6474) (Cons!6473 (h!7329 tuple2!6556) (t!11643 List!6477)) )
))
(declare-datatypes ((ListLongMap!5471 0))(
  ( (ListLongMap!5472 (toList!2751 List!6477)) )
))
(declare-fun call!28050 () ListLongMap!5471)

(declare-fun b!399804 () Bool)

(declare-fun call!28051 () ListLongMap!5471)

(declare-fun v!412 () V!14459)

(declare-fun +!1099 (ListLongMap!5471 tuple2!6556) ListLongMap!5471)

(assert (=> b!399804 (= e!241367 (= call!28050 (+!1099 call!28051 (tuple2!6557 k0!794 v!412))))))

(declare-fun b!399805 () Bool)

(declare-fun e!241369 () Bool)

(assert (=> b!399805 (= e!241369 (not true))))

(assert (=> b!399805 e!241367))

(declare-fun c!54633 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!399805 (= c!54633 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14459)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14459)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!12087 0))(
  ( (Unit!12088) )
))
(declare-fun lt!187643 () Unit!12087)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!311 (array!23920 array!23918 (_ BitVec 32) (_ BitVec 32) V!14459 V!14459 (_ BitVec 32) (_ BitVec 64) V!14459 (_ BitVec 32) Int) Unit!12087)

(assert (=> b!399805 (= lt!187643 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!311 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399806 () Bool)

(declare-fun res!229967 () Bool)

(assert (=> b!399806 (=> (not res!229967) (not e!241371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23920 (_ BitVec 32)) Bool)

(assert (=> b!399806 (= res!229967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399807 () Bool)

(assert (=> b!399807 (= e!241367 (= call!28051 call!28050))))

(declare-fun lt!187644 () array!23920)

(declare-fun bm!28047 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1009 (array!23920 array!23918 (_ BitVec 32) (_ BitVec 32) V!14459 V!14459 (_ BitVec 32) Int) ListLongMap!5471)

(assert (=> bm!28047 (= call!28050 (getCurrentListMapNoExtraKeys!1009 (ite c!54633 lt!187644 _keys!709) (ite c!54633 (array!23919 (store (arr!11408 _values!549) i!563 (ValueCellFull!4664 v!412)) (size!11760 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28048 () Bool)

(assert (=> bm!28048 (= call!28051 (getCurrentListMapNoExtraKeys!1009 (ite c!54633 _keys!709 lt!187644) (ite c!54633 _values!549 (array!23919 (store (arr!11408 _values!549) i!563 (ValueCellFull!4664 v!412)) (size!11760 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399808 () Bool)

(declare-fun res!229970 () Bool)

(assert (=> b!399808 (=> (not res!229970) (not e!241371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399808 (= res!229970 (validMask!0 mask!1025))))

(declare-fun b!399809 () Bool)

(declare-fun tp_is_empty!10015 () Bool)

(assert (=> b!399809 (= e!241368 tp_is_empty!10015)))

(declare-fun b!399810 () Bool)

(declare-fun res!229973 () Bool)

(assert (=> b!399810 (=> (not res!229973) (not e!241371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399810 (= res!229973 (validKeyInArray!0 k0!794))))

(declare-fun b!399801 () Bool)

(declare-fun res!229964 () Bool)

(assert (=> b!399801 (=> (not res!229964) (not e!241371))))

(assert (=> b!399801 (= res!229964 (or (= (select (arr!11409 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11409 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!229963 () Bool)

(assert (=> start!38582 (=> (not res!229963) (not e!241371))))

(assert (=> start!38582 (= res!229963 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11761 _keys!709))))))

(assert (=> start!38582 e!241371))

(assert (=> start!38582 tp_is_empty!10015))

(assert (=> start!38582 tp!32522))

(assert (=> start!38582 true))

(declare-fun e!241366 () Bool)

(declare-fun array_inv!8426 (array!23918) Bool)

(assert (=> start!38582 (and (array_inv!8426 _values!549) e!241366)))

(declare-fun array_inv!8427 (array!23920) Bool)

(assert (=> start!38582 (array_inv!8427 _keys!709)))

(declare-fun b!399811 () Bool)

(declare-fun e!241370 () Bool)

(assert (=> b!399811 (= e!241366 (and e!241370 mapRes!16644))))

(declare-fun condMapEmpty!16644 () Bool)

(declare-fun mapDefault!16644 () ValueCell!4664)

(assert (=> b!399811 (= condMapEmpty!16644 (= (arr!11408 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4664)) mapDefault!16644)))))

(declare-fun b!399812 () Bool)

(declare-fun res!229965 () Bool)

(assert (=> b!399812 (=> (not res!229965) (not e!241369))))

(assert (=> b!399812 (= res!229965 (arrayNoDuplicates!0 lt!187644 #b00000000000000000000000000000000 Nil!6473))))

(declare-fun b!399813 () Bool)

(declare-fun res!229969 () Bool)

(assert (=> b!399813 (=> (not res!229969) (not e!241371))))

(assert (=> b!399813 (= res!229969 (and (= (size!11760 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11761 _keys!709) (size!11760 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399814 () Bool)

(declare-fun res!229968 () Bool)

(assert (=> b!399814 (=> (not res!229968) (not e!241371))))

(declare-fun arrayContainsKey!0 (array!23920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399814 (= res!229968 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399815 () Bool)

(declare-fun res!229972 () Bool)

(assert (=> b!399815 (=> (not res!229972) (not e!241369))))

(assert (=> b!399815 (= res!229972 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11761 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399816 () Bool)

(assert (=> b!399816 (= e!241371 e!241369)))

(declare-fun res!229966 () Bool)

(assert (=> b!399816 (=> (not res!229966) (not e!241369))))

(assert (=> b!399816 (= res!229966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187644 mask!1025))))

(assert (=> b!399816 (= lt!187644 (array!23921 (store (arr!11409 _keys!709) i!563 k0!794) (size!11761 _keys!709)))))

(declare-fun mapIsEmpty!16644 () Bool)

(assert (=> mapIsEmpty!16644 mapRes!16644))

(declare-fun b!399817 () Bool)

(assert (=> b!399817 (= e!241370 tp_is_empty!10015)))

(assert (= (and start!38582 res!229963) b!399808))

(assert (= (and b!399808 res!229970) b!399813))

(assert (= (and b!399813 res!229969) b!399806))

(assert (= (and b!399806 res!229967) b!399803))

(assert (= (and b!399803 res!229971) b!399802))

(assert (= (and b!399802 res!229974) b!399810))

(assert (= (and b!399810 res!229973) b!399801))

(assert (= (and b!399801 res!229964) b!399814))

(assert (= (and b!399814 res!229968) b!399816))

(assert (= (and b!399816 res!229966) b!399812))

(assert (= (and b!399812 res!229965) b!399815))

(assert (= (and b!399815 res!229972) b!399805))

(assert (= (and b!399805 c!54633) b!399804))

(assert (= (and b!399805 (not c!54633)) b!399807))

(assert (= (or b!399804 b!399807) bm!28047))

(assert (= (or b!399804 b!399807) bm!28048))

(assert (= (and b!399811 condMapEmpty!16644) mapIsEmpty!16644))

(assert (= (and b!399811 (not condMapEmpty!16644)) mapNonEmpty!16644))

(get-info :version)

(assert (= (and mapNonEmpty!16644 ((_ is ValueCellFull!4664) mapValue!16644)) b!399809))

(assert (= (and b!399811 ((_ is ValueCellFull!4664) mapDefault!16644)) b!399817))

(assert (= start!38582 b!399811))

(declare-fun m!394467 () Bool)

(assert (=> b!399804 m!394467))

(declare-fun m!394469 () Bool)

(assert (=> b!399805 m!394469))

(declare-fun m!394471 () Bool)

(assert (=> b!399810 m!394471))

(declare-fun m!394473 () Bool)

(assert (=> b!399803 m!394473))

(declare-fun m!394475 () Bool)

(assert (=> b!399814 m!394475))

(declare-fun m!394477 () Bool)

(assert (=> mapNonEmpty!16644 m!394477))

(declare-fun m!394479 () Bool)

(assert (=> start!38582 m!394479))

(declare-fun m!394481 () Bool)

(assert (=> start!38582 m!394481))

(declare-fun m!394483 () Bool)

(assert (=> b!399801 m!394483))

(declare-fun m!394485 () Bool)

(assert (=> b!399816 m!394485))

(declare-fun m!394487 () Bool)

(assert (=> b!399816 m!394487))

(declare-fun m!394489 () Bool)

(assert (=> b!399806 m!394489))

(declare-fun m!394491 () Bool)

(assert (=> bm!28047 m!394491))

(declare-fun m!394493 () Bool)

(assert (=> bm!28047 m!394493))

(declare-fun m!394495 () Bool)

(assert (=> b!399808 m!394495))

(assert (=> bm!28048 m!394491))

(declare-fun m!394497 () Bool)

(assert (=> bm!28048 m!394497))

(declare-fun m!394499 () Bool)

(assert (=> b!399812 m!394499))

(check-sat (not b!399814) (not b!399803) (not b!399816) (not bm!28047) (not bm!28048) b_and!16533 tp_is_empty!10015 (not b!399806) (not b!399805) (not b!399810) (not b!399812) (not b!399808) (not b_next!9133) (not b!399804) (not start!38582) (not mapNonEmpty!16644))
(check-sat b_and!16533 (not b_next!9133))
