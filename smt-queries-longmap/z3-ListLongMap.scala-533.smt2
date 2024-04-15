; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13430 () Bool)

(assert start!13430)

(declare-fun b!123043 () Bool)

(declare-fun b_free!2785 () Bool)

(declare-fun b_next!2785 () Bool)

(assert (=> b!123043 (= b_free!2785 (not b_next!2785))))

(declare-fun tp!10743 () Bool)

(declare-fun b_and!7533 () Bool)

(assert (=> b!123043 (= tp!10743 b_and!7533)))

(declare-fun b!123041 () Bool)

(declare-fun b_free!2787 () Bool)

(declare-fun b_next!2787 () Bool)

(assert (=> b!123041 (= b_free!2787 (not b_next!2787))))

(declare-fun tp!10742 () Bool)

(declare-fun b_and!7535 () Bool)

(assert (=> b!123041 (= tp!10742 b_and!7535)))

(declare-fun b!123034 () Bool)

(declare-fun res!59767 () Bool)

(declare-fun e!80328 () Bool)

(assert (=> b!123034 (=> (not res!59767) (not e!80328))))

(declare-datatypes ((V!3393 0))(
  ( (V!3394 (val!1449 Int)) )
))
(declare-datatypes ((array!4609 0))(
  ( (array!4610 (arr!2182 (Array (_ BitVec 32) (_ BitVec 64))) (size!2445 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1061 0))(
  ( (ValueCellFull!1061 (v!3071 V!3393)) (EmptyCell!1061) )
))
(declare-datatypes ((array!4611 0))(
  ( (array!4612 (arr!2183 (Array (_ BitVec 32) ValueCell!1061)) (size!2446 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1030 0))(
  ( (LongMapFixedSize!1031 (defaultEntry!2748 Int) (mask!6981 (_ BitVec 32)) (extraKeys!2533 (_ BitVec 32)) (zeroValue!2613 V!3393) (minValue!2613 V!3393) (_size!564 (_ BitVec 32)) (_keys!4474 array!4609) (_values!2731 array!4611) (_vacant!564 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1030)

(declare-fun valid!493 (LongMapFixedSize!1030) Bool)

(assert (=> b!123034 (= res!59767 (valid!493 newMap!16))))

(declare-fun b!123035 () Bool)

(declare-fun e!80326 () Bool)

(declare-fun tp_is_empty!2809 () Bool)

(assert (=> b!123035 (= e!80326 tp_is_empty!2809)))

(declare-fun b!123036 () Bool)

(assert (=> b!123036 (= e!80328 false)))

(declare-datatypes ((tuple2!2516 0))(
  ( (tuple2!2517 (_1!1269 (_ BitVec 64)) (_2!1269 V!3393)) )
))
(declare-datatypes ((List!1680 0))(
  ( (Nil!1677) (Cons!1676 (h!2277 tuple2!2516) (t!5974 List!1680)) )
))
(declare-datatypes ((ListLongMap!1629 0))(
  ( (ListLongMap!1630 (toList!830 List!1680)) )
))
(declare-fun lt!63341 () ListLongMap!1629)

(declare-fun map!1351 (LongMapFixedSize!1030) ListLongMap!1629)

(assert (=> b!123036 (= lt!63341 (map!1351 newMap!16))))

(declare-fun lt!63340 () ListLongMap!1629)

(declare-datatypes ((Cell!818 0))(
  ( (Cell!819 (v!3072 LongMapFixedSize!1030)) )
))
(declare-datatypes ((LongMap!818 0))(
  ( (LongMap!819 (underlying!420 Cell!818)) )
))
(declare-fun thiss!992 () LongMap!818)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!501 (array!4609 array!4611 (_ BitVec 32) (_ BitVec 32) V!3393 V!3393 (_ BitVec 32) Int) ListLongMap!1629)

(assert (=> b!123036 (= lt!63340 (getCurrentListMap!501 (_keys!4474 (v!3072 (underlying!420 thiss!992))) (_values!2731 (v!3072 (underlying!420 thiss!992))) (mask!6981 (v!3072 (underlying!420 thiss!992))) (extraKeys!2533 (v!3072 (underlying!420 thiss!992))) (zeroValue!2613 (v!3072 (underlying!420 thiss!992))) (minValue!2613 (v!3072 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2748 (v!3072 (underlying!420 thiss!992)))))))

(declare-fun b!123037 () Bool)

(declare-fun e!80329 () Bool)

(declare-fun e!80333 () Bool)

(assert (=> b!123037 (= e!80329 e!80333)))

(declare-fun mapIsEmpty!4383 () Bool)

(declare-fun mapRes!4384 () Bool)

(assert (=> mapIsEmpty!4383 mapRes!4384))

(declare-fun b!123038 () Bool)

(declare-fun e!80337 () Bool)

(assert (=> b!123038 (= e!80333 e!80337)))

(declare-fun mapIsEmpty!4384 () Bool)

(declare-fun mapRes!4383 () Bool)

(assert (=> mapIsEmpty!4384 mapRes!4383))

(declare-fun b!123039 () Bool)

(declare-fun res!59770 () Bool)

(assert (=> b!123039 (=> (not res!59770) (not e!80328))))

(assert (=> b!123039 (= res!59770 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6981 newMap!16)) (_size!564 (v!3072 (underlying!420 thiss!992)))))))

(declare-fun b!123040 () Bool)

(declare-fun e!80327 () Bool)

(assert (=> b!123040 (= e!80327 tp_is_empty!2809)))

(declare-fun mapNonEmpty!4383 () Bool)

(declare-fun tp!10744 () Bool)

(declare-fun e!80334 () Bool)

(assert (=> mapNonEmpty!4383 (= mapRes!4383 (and tp!10744 e!80334))))

(declare-fun mapValue!4384 () ValueCell!1061)

(declare-fun mapRest!4384 () (Array (_ BitVec 32) ValueCell!1061))

(declare-fun mapKey!4384 () (_ BitVec 32))

(assert (=> mapNonEmpty!4383 (= (arr!2183 (_values!2731 (v!3072 (underlying!420 thiss!992)))) (store mapRest!4384 mapKey!4384 mapValue!4384))))

(declare-fun res!59769 () Bool)

(assert (=> start!13430 (=> (not res!59769) (not e!80328))))

(declare-fun valid!494 (LongMap!818) Bool)

(assert (=> start!13430 (= res!59769 (valid!494 thiss!992))))

(assert (=> start!13430 e!80328))

(assert (=> start!13430 e!80329))

(assert (=> start!13430 true))

(declare-fun e!80332 () Bool)

(assert (=> start!13430 e!80332))

(declare-fun e!80335 () Bool)

(declare-fun array_inv!1381 (array!4609) Bool)

(declare-fun array_inv!1382 (array!4611) Bool)

(assert (=> b!123041 (= e!80332 (and tp!10742 tp_is_empty!2809 (array_inv!1381 (_keys!4474 newMap!16)) (array_inv!1382 (_values!2731 newMap!16)) e!80335))))

(declare-fun b!123042 () Bool)

(assert (=> b!123042 (= e!80334 tp_is_empty!2809)))

(declare-fun e!80336 () Bool)

(assert (=> b!123043 (= e!80337 (and tp!10743 tp_is_empty!2809 (array_inv!1381 (_keys!4474 (v!3072 (underlying!420 thiss!992)))) (array_inv!1382 (_values!2731 (v!3072 (underlying!420 thiss!992)))) e!80336))))

(declare-fun mapNonEmpty!4384 () Bool)

(declare-fun tp!10741 () Bool)

(assert (=> mapNonEmpty!4384 (= mapRes!4384 (and tp!10741 e!80326))))

(declare-fun mapKey!4383 () (_ BitVec 32))

(declare-fun mapRest!4383 () (Array (_ BitVec 32) ValueCell!1061))

(declare-fun mapValue!4383 () ValueCell!1061)

(assert (=> mapNonEmpty!4384 (= (arr!2183 (_values!2731 newMap!16)) (store mapRest!4383 mapKey!4383 mapValue!4383))))

(declare-fun b!123044 () Bool)

(assert (=> b!123044 (= e!80336 (and e!80327 mapRes!4383))))

(declare-fun condMapEmpty!4384 () Bool)

(declare-fun mapDefault!4383 () ValueCell!1061)

(assert (=> b!123044 (= condMapEmpty!4384 (= (arr!2183 (_values!2731 (v!3072 (underlying!420 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1061)) mapDefault!4383)))))

(declare-fun b!123045 () Bool)

(declare-fun e!80338 () Bool)

(assert (=> b!123045 (= e!80335 (and e!80338 mapRes!4384))))

(declare-fun condMapEmpty!4383 () Bool)

(declare-fun mapDefault!4384 () ValueCell!1061)

(assert (=> b!123045 (= condMapEmpty!4383 (= (arr!2183 (_values!2731 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1061)) mapDefault!4384)))))

(declare-fun b!123046 () Bool)

(assert (=> b!123046 (= e!80338 tp_is_empty!2809)))

(declare-fun b!123047 () Bool)

(declare-fun res!59768 () Bool)

(assert (=> b!123047 (=> (not res!59768) (not e!80328))))

(assert (=> b!123047 (= res!59768 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2445 (_keys!4474 (v!3072 (underlying!420 thiss!992)))))))))

(assert (= (and start!13430 res!59769) b!123047))

(assert (= (and b!123047 res!59768) b!123034))

(assert (= (and b!123034 res!59767) b!123039))

(assert (= (and b!123039 res!59770) b!123036))

(assert (= (and b!123044 condMapEmpty!4384) mapIsEmpty!4384))

(assert (= (and b!123044 (not condMapEmpty!4384)) mapNonEmpty!4383))

(get-info :version)

(assert (= (and mapNonEmpty!4383 ((_ is ValueCellFull!1061) mapValue!4384)) b!123042))

(assert (= (and b!123044 ((_ is ValueCellFull!1061) mapDefault!4383)) b!123040))

(assert (= b!123043 b!123044))

(assert (= b!123038 b!123043))

(assert (= b!123037 b!123038))

(assert (= start!13430 b!123037))

(assert (= (and b!123045 condMapEmpty!4383) mapIsEmpty!4383))

(assert (= (and b!123045 (not condMapEmpty!4383)) mapNonEmpty!4384))

(assert (= (and mapNonEmpty!4384 ((_ is ValueCellFull!1061) mapValue!4383)) b!123035))

(assert (= (and b!123045 ((_ is ValueCellFull!1061) mapDefault!4384)) b!123046))

(assert (= b!123041 b!123045))

(assert (= start!13430 b!123041))

(declare-fun m!143019 () Bool)

(assert (=> b!123043 m!143019))

(declare-fun m!143021 () Bool)

(assert (=> b!123043 m!143021))

(declare-fun m!143023 () Bool)

(assert (=> b!123036 m!143023))

(declare-fun m!143025 () Bool)

(assert (=> b!123036 m!143025))

(declare-fun m!143027 () Bool)

(assert (=> start!13430 m!143027))

(declare-fun m!143029 () Bool)

(assert (=> b!123041 m!143029))

(declare-fun m!143031 () Bool)

(assert (=> b!123041 m!143031))

(declare-fun m!143033 () Bool)

(assert (=> b!123034 m!143033))

(declare-fun m!143035 () Bool)

(assert (=> mapNonEmpty!4383 m!143035))

(declare-fun m!143037 () Bool)

(assert (=> mapNonEmpty!4384 m!143037))

(check-sat (not mapNonEmpty!4383) (not b_next!2787) (not b!123034) (not b!123036) (not b_next!2785) (not b!123041) (not b!123043) b_and!7533 b_and!7535 (not start!13430) tp_is_empty!2809 (not mapNonEmpty!4384))
(check-sat b_and!7533 b_and!7535 (not b_next!2785) (not b_next!2787))
