; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13430 () Bool)

(assert start!13430)

(declare-fun b!123143 () Bool)

(declare-fun b_free!2785 () Bool)

(declare-fun b_next!2785 () Bool)

(assert (=> b!123143 (= b_free!2785 (not b_next!2785))))

(declare-fun tp!10741 () Bool)

(declare-fun b_and!7553 () Bool)

(assert (=> b!123143 (= tp!10741 b_and!7553)))

(declare-fun b!123133 () Bool)

(declare-fun b_free!2787 () Bool)

(declare-fun b_next!2787 () Bool)

(assert (=> b!123133 (= b_free!2787 (not b_next!2787))))

(declare-fun tp!10743 () Bool)

(declare-fun b_and!7555 () Bool)

(assert (=> b!123133 (= tp!10743 b_and!7555)))

(declare-fun b!123132 () Bool)

(declare-fun res!59825 () Bool)

(declare-fun e!80393 () Bool)

(assert (=> b!123132 (=> (not res!59825) (not e!80393))))

(declare-datatypes ((V!3393 0))(
  ( (V!3394 (val!1449 Int)) )
))
(declare-datatypes ((array!4615 0))(
  ( (array!4616 (arr!2186 (Array (_ BitVec 32) (_ BitVec 64))) (size!2448 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1061 0))(
  ( (ValueCellFull!1061 (v!3080 V!3393)) (EmptyCell!1061) )
))
(declare-datatypes ((array!4617 0))(
  ( (array!4618 (arr!2187 (Array (_ BitVec 32) ValueCell!1061)) (size!2449 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1030 0))(
  ( (LongMapFixedSize!1031 (defaultEntry!2748 Int) (mask!6982 (_ BitVec 32)) (extraKeys!2533 (_ BitVec 32)) (zeroValue!2613 V!3393) (minValue!2613 V!3393) (_size!564 (_ BitVec 32)) (_keys!4475 array!4615) (_values!2731 array!4617) (_vacant!564 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1030)

(declare-datatypes ((Cell!830 0))(
  ( (Cell!831 (v!3081 LongMapFixedSize!1030)) )
))
(declare-datatypes ((LongMap!830 0))(
  ( (LongMap!831 (underlying!426 Cell!830)) )
))
(declare-fun thiss!992 () LongMap!830)

(assert (=> b!123132 (= res!59825 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6982 newMap!16)) (_size!564 (v!3081 (underlying!426 thiss!992)))))))

(declare-fun mapIsEmpty!4383 () Bool)

(declare-fun mapRes!4383 () Bool)

(assert (=> mapIsEmpty!4383 mapRes!4383))

(declare-fun tp_is_empty!2809 () Bool)

(declare-fun e!80390 () Bool)

(declare-fun e!80396 () Bool)

(declare-fun array_inv!1371 (array!4615) Bool)

(declare-fun array_inv!1372 (array!4617) Bool)

(assert (=> b!123133 (= e!80390 (and tp!10743 tp_is_empty!2809 (array_inv!1371 (_keys!4475 newMap!16)) (array_inv!1372 (_values!2731 newMap!16)) e!80396))))

(declare-fun mapIsEmpty!4384 () Bool)

(declare-fun mapRes!4384 () Bool)

(assert (=> mapIsEmpty!4384 mapRes!4384))

(declare-fun res!59827 () Bool)

(assert (=> start!13430 (=> (not res!59827) (not e!80393))))

(declare-fun valid!501 (LongMap!830) Bool)

(assert (=> start!13430 (= res!59827 (valid!501 thiss!992))))

(assert (=> start!13430 e!80393))

(declare-fun e!80395 () Bool)

(assert (=> start!13430 e!80395))

(assert (=> start!13430 true))

(assert (=> start!13430 e!80390))

(declare-fun b!123134 () Bool)

(assert (=> b!123134 (= e!80393 false)))

(declare-datatypes ((tuple2!2504 0))(
  ( (tuple2!2505 (_1!1263 (_ BitVec 64)) (_2!1263 V!3393)) )
))
(declare-datatypes ((List!1668 0))(
  ( (Nil!1665) (Cons!1664 (h!2265 tuple2!2504) (t!5963 List!1668)) )
))
(declare-datatypes ((ListLongMap!1619 0))(
  ( (ListLongMap!1620 (toList!825 List!1668)) )
))
(declare-fun lt!63455 () ListLongMap!1619)

(declare-fun map!1364 (LongMapFixedSize!1030) ListLongMap!1619)

(assert (=> b!123134 (= lt!63455 (map!1364 newMap!16))))

(declare-fun lt!63456 () ListLongMap!1619)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!506 (array!4615 array!4617 (_ BitVec 32) (_ BitVec 32) V!3393 V!3393 (_ BitVec 32) Int) ListLongMap!1619)

(assert (=> b!123134 (= lt!63456 (getCurrentListMap!506 (_keys!4475 (v!3081 (underlying!426 thiss!992))) (_values!2731 (v!3081 (underlying!426 thiss!992))) (mask!6982 (v!3081 (underlying!426 thiss!992))) (extraKeys!2533 (v!3081 (underlying!426 thiss!992))) (zeroValue!2613 (v!3081 (underlying!426 thiss!992))) (minValue!2613 (v!3081 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2748 (v!3081 (underlying!426 thiss!992)))))))

(declare-fun b!123135 () Bool)

(declare-fun e!80397 () Bool)

(declare-fun e!80391 () Bool)

(assert (=> b!123135 (= e!80397 (and e!80391 mapRes!4383))))

(declare-fun condMapEmpty!4383 () Bool)

(declare-fun mapDefault!4383 () ValueCell!1061)

(assert (=> b!123135 (= condMapEmpty!4383 (= (arr!2187 (_values!2731 (v!3081 (underlying!426 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1061)) mapDefault!4383)))))

(declare-fun b!123136 () Bool)

(declare-fun e!80399 () Bool)

(assert (=> b!123136 (= e!80399 tp_is_empty!2809)))

(declare-fun b!123137 () Bool)

(declare-fun e!80392 () Bool)

(assert (=> b!123137 (= e!80395 e!80392)))

(declare-fun mapNonEmpty!4383 () Bool)

(declare-fun tp!10742 () Bool)

(assert (=> mapNonEmpty!4383 (= mapRes!4383 (and tp!10742 e!80399))))

(declare-fun mapRest!4384 () (Array (_ BitVec 32) ValueCell!1061))

(declare-fun mapKey!4383 () (_ BitVec 32))

(declare-fun mapValue!4383 () ValueCell!1061)

(assert (=> mapNonEmpty!4383 (= (arr!2187 (_values!2731 (v!3081 (underlying!426 thiss!992)))) (store mapRest!4384 mapKey!4383 mapValue!4383))))

(declare-fun b!123138 () Bool)

(declare-fun e!80400 () Bool)

(assert (=> b!123138 (= e!80400 tp_is_empty!2809)))

(declare-fun b!123139 () Bool)

(declare-fun e!80401 () Bool)

(assert (=> b!123139 (= e!80392 e!80401)))

(declare-fun b!123140 () Bool)

(declare-fun res!59826 () Bool)

(assert (=> b!123140 (=> (not res!59826) (not e!80393))))

(declare-fun valid!502 (LongMapFixedSize!1030) Bool)

(assert (=> b!123140 (= res!59826 (valid!502 newMap!16))))

(declare-fun b!123141 () Bool)

(assert (=> b!123141 (= e!80396 (and e!80400 mapRes!4384))))

(declare-fun condMapEmpty!4384 () Bool)

(declare-fun mapDefault!4384 () ValueCell!1061)

(assert (=> b!123141 (= condMapEmpty!4384 (= (arr!2187 (_values!2731 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1061)) mapDefault!4384)))))

(declare-fun b!123142 () Bool)

(declare-fun res!59828 () Bool)

(assert (=> b!123142 (=> (not res!59828) (not e!80393))))

(assert (=> b!123142 (= res!59828 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2448 (_keys!4475 (v!3081 (underlying!426 thiss!992)))))))))

(declare-fun mapNonEmpty!4384 () Bool)

(declare-fun tp!10744 () Bool)

(declare-fun e!80398 () Bool)

(assert (=> mapNonEmpty!4384 (= mapRes!4384 (and tp!10744 e!80398))))

(declare-fun mapValue!4384 () ValueCell!1061)

(declare-fun mapKey!4384 () (_ BitVec 32))

(declare-fun mapRest!4383 () (Array (_ BitVec 32) ValueCell!1061))

(assert (=> mapNonEmpty!4384 (= (arr!2187 (_values!2731 newMap!16)) (store mapRest!4383 mapKey!4384 mapValue!4384))))

(assert (=> b!123143 (= e!80401 (and tp!10741 tp_is_empty!2809 (array_inv!1371 (_keys!4475 (v!3081 (underlying!426 thiss!992)))) (array_inv!1372 (_values!2731 (v!3081 (underlying!426 thiss!992)))) e!80397))))

(declare-fun b!123144 () Bool)

(assert (=> b!123144 (= e!80398 tp_is_empty!2809)))

(declare-fun b!123145 () Bool)

(assert (=> b!123145 (= e!80391 tp_is_empty!2809)))

(assert (= (and start!13430 res!59827) b!123142))

(assert (= (and b!123142 res!59828) b!123140))

(assert (= (and b!123140 res!59826) b!123132))

(assert (= (and b!123132 res!59825) b!123134))

(assert (= (and b!123135 condMapEmpty!4383) mapIsEmpty!4383))

(assert (= (and b!123135 (not condMapEmpty!4383)) mapNonEmpty!4383))

(get-info :version)

(assert (= (and mapNonEmpty!4383 ((_ is ValueCellFull!1061) mapValue!4383)) b!123136))

(assert (= (and b!123135 ((_ is ValueCellFull!1061) mapDefault!4383)) b!123145))

(assert (= b!123143 b!123135))

(assert (= b!123139 b!123143))

(assert (= b!123137 b!123139))

(assert (= start!13430 b!123137))

(assert (= (and b!123141 condMapEmpty!4384) mapIsEmpty!4384))

(assert (= (and b!123141 (not condMapEmpty!4384)) mapNonEmpty!4384))

(assert (= (and mapNonEmpty!4384 ((_ is ValueCellFull!1061) mapValue!4384)) b!123144))

(assert (= (and b!123141 ((_ is ValueCellFull!1061) mapDefault!4384)) b!123138))

(assert (= b!123133 b!123141))

(assert (= start!13430 b!123133))

(declare-fun m!143409 () Bool)

(assert (=> b!123140 m!143409))

(declare-fun m!143411 () Bool)

(assert (=> mapNonEmpty!4384 m!143411))

(declare-fun m!143413 () Bool)

(assert (=> b!123134 m!143413))

(declare-fun m!143415 () Bool)

(assert (=> b!123134 m!143415))

(declare-fun m!143417 () Bool)

(assert (=> b!123133 m!143417))

(declare-fun m!143419 () Bool)

(assert (=> b!123133 m!143419))

(declare-fun m!143421 () Bool)

(assert (=> b!123143 m!143421))

(declare-fun m!143423 () Bool)

(assert (=> b!123143 m!143423))

(declare-fun m!143425 () Bool)

(assert (=> start!13430 m!143425))

(declare-fun m!143427 () Bool)

(assert (=> mapNonEmpty!4383 m!143427))

(check-sat b_and!7555 (not mapNonEmpty!4383) tp_is_empty!2809 (not b!123140) (not b_next!2787) (not b_next!2785) (not start!13430) (not b!123143) b_and!7553 (not b!123134) (not b!123133) (not mapNonEmpty!4384))
(check-sat b_and!7553 b_and!7555 (not b_next!2785) (not b_next!2787))
