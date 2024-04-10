; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15456 () Bool)

(assert start!15456)

(declare-fun b!153619 () Bool)

(declare-fun b_free!3197 () Bool)

(declare-fun b_next!3197 () Bool)

(assert (=> b!153619 (= b_free!3197 (not b_next!3197))))

(declare-fun tp!12109 () Bool)

(declare-fun b_and!9559 () Bool)

(assert (=> b!153619 (= tp!12109 b_and!9559)))

(declare-fun b!153620 () Bool)

(declare-fun b_free!3199 () Bool)

(declare-fun b_next!3199 () Bool)

(assert (=> b!153620 (= b_free!3199 (not b_next!3199))))

(declare-fun tp!12108 () Bool)

(declare-fun b_and!9561 () Bool)

(assert (=> b!153620 (= tp!12108 b_and!9561)))

(declare-fun mapIsEmpty!5131 () Bool)

(declare-fun mapRes!5131 () Bool)

(assert (=> mapIsEmpty!5131 mapRes!5131))

(declare-fun b!153608 () Bool)

(declare-fun res!72588 () Bool)

(declare-fun e!100317 () Bool)

(assert (=> b!153608 (=> (not res!72588) (not e!100317))))

(declare-datatypes ((V!3667 0))(
  ( (V!3668 (val!1552 Int)) )
))
(declare-datatypes ((array!5079 0))(
  ( (array!5080 (arr!2399 (Array (_ BitVec 32) (_ BitVec 64))) (size!2676 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1164 0))(
  ( (ValueCellFull!1164 (v!3406 V!3667)) (EmptyCell!1164) )
))
(declare-datatypes ((array!5081 0))(
  ( (array!5082 (arr!2400 (Array (_ BitVec 32) ValueCell!1164)) (size!2677 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1236 0))(
  ( (LongMapFixedSize!1237 (defaultEntry!3057 Int) (mask!7457 (_ BitVec 32)) (extraKeys!2798 (_ BitVec 32)) (zeroValue!2900 V!3667) (minValue!2900 V!3667) (_size!667 (_ BitVec 32)) (_keys!4830 array!5079) (_values!3040 array!5081) (_vacant!667 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1236)

(declare-datatypes ((Cell!1018 0))(
  ( (Cell!1019 (v!3407 LongMapFixedSize!1236)) )
))
(declare-datatypes ((LongMap!1018 0))(
  ( (LongMap!1019 (underlying!520 Cell!1018)) )
))
(declare-fun thiss!992 () LongMap!1018)

(assert (=> b!153608 (= res!72588 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7457 newMap!16)) (_size!667 (v!3407 (underlying!520 thiss!992)))))))

(declare-fun mapNonEmpty!5131 () Bool)

(declare-fun tp!12110 () Bool)

(declare-fun e!100320 () Bool)

(assert (=> mapNonEmpty!5131 (= mapRes!5131 (and tp!12110 e!100320))))

(declare-fun mapRest!5132 () (Array (_ BitVec 32) ValueCell!1164))

(declare-fun mapValue!5132 () ValueCell!1164)

(declare-fun mapKey!5132 () (_ BitVec 32))

(assert (=> mapNonEmpty!5131 (= (arr!2400 (_values!3040 (v!3407 (underlying!520 thiss!992)))) (store mapRest!5132 mapKey!5132 mapValue!5132))))

(declare-fun b!153609 () Bool)

(declare-fun e!100312 () Bool)

(declare-fun tp_is_empty!3015 () Bool)

(assert (=> b!153609 (= e!100312 tp_is_empty!3015)))

(declare-fun b!153610 () Bool)

(declare-fun e!100315 () Bool)

(declare-fun e!100318 () Bool)

(assert (=> b!153610 (= e!100315 e!100318)))

(declare-fun b!153611 () Bool)

(declare-fun res!72590 () Bool)

(assert (=> b!153611 (=> (not res!72590) (not e!100317))))

(declare-fun valid!607 (LongMapFixedSize!1236) Bool)

(assert (=> b!153611 (= res!72590 (valid!607 newMap!16))))

(declare-fun b!153612 () Bool)

(declare-fun res!72587 () Bool)

(assert (=> b!153612 (=> (not res!72587) (not e!100317))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!153612 (= res!72587 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2676 (_keys!4830 (v!3407 (underlying!520 thiss!992)))))))))

(declare-fun b!153613 () Bool)

(assert (=> b!153613 (= e!100320 tp_is_empty!3015)))

(declare-fun b!153614 () Bool)

(declare-fun e!100322 () Bool)

(declare-fun mapRes!5132 () Bool)

(assert (=> b!153614 (= e!100322 (and e!100312 mapRes!5132))))

(declare-fun condMapEmpty!5131 () Bool)

(declare-fun mapDefault!5131 () ValueCell!1164)

(assert (=> b!153614 (= condMapEmpty!5131 (= (arr!2400 (_values!3040 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1164)) mapDefault!5131)))))

(declare-fun b!153615 () Bool)

(declare-fun e!100321 () Bool)

(declare-fun e!100311 () Bool)

(assert (=> b!153615 (= e!100321 (and e!100311 mapRes!5131))))

(declare-fun condMapEmpty!5132 () Bool)

(declare-fun mapDefault!5132 () ValueCell!1164)

(assert (=> b!153615 (= condMapEmpty!5132 (= (arr!2400 (_values!3040 (v!3407 (underlying!520 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1164)) mapDefault!5132)))))

(declare-fun b!153616 () Bool)

(declare-fun e!100310 () Bool)

(assert (=> b!153616 (= e!100310 e!100315)))

(declare-fun mapNonEmpty!5132 () Bool)

(declare-fun tp!12107 () Bool)

(declare-fun e!100316 () Bool)

(assert (=> mapNonEmpty!5132 (= mapRes!5132 (and tp!12107 e!100316))))

(declare-fun mapRest!5131 () (Array (_ BitVec 32) ValueCell!1164))

(declare-fun mapKey!5131 () (_ BitVec 32))

(declare-fun mapValue!5131 () ValueCell!1164)

(assert (=> mapNonEmpty!5132 (= (arr!2400 (_values!3040 newMap!16)) (store mapRest!5131 mapKey!5131 mapValue!5131))))

(declare-fun b!153617 () Bool)

(assert (=> b!153617 (= e!100311 tp_is_empty!3015)))

(declare-fun b!153618 () Bool)

(assert (=> b!153618 (= e!100316 tp_is_empty!3015)))

(declare-fun mapIsEmpty!5132 () Bool)

(assert (=> mapIsEmpty!5132 mapRes!5132))

(declare-fun array_inv!1513 (array!5079) Bool)

(declare-fun array_inv!1514 (array!5081) Bool)

(assert (=> b!153619 (= e!100318 (and tp!12109 tp_is_empty!3015 (array_inv!1513 (_keys!4830 (v!3407 (underlying!520 thiss!992)))) (array_inv!1514 (_values!3040 (v!3407 (underlying!520 thiss!992)))) e!100321))))

(declare-fun e!100319 () Bool)

(assert (=> b!153620 (= e!100319 (and tp!12108 tp_is_empty!3015 (array_inv!1513 (_keys!4830 newMap!16)) (array_inv!1514 (_values!3040 newMap!16)) e!100322))))

(declare-fun b!153621 () Bool)

(assert (=> b!153621 (= e!100317 (and (or (= (select (arr!2399 (_keys!4830 (v!3407 (underlying!520 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2399 (_keys!4830 (v!3407 (underlying!520 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvsge (bvsub from!355 #b00000000000000000000000000000001) from!355)))))

(declare-fun res!72591 () Bool)

(assert (=> start!15456 (=> (not res!72591) (not e!100317))))

(declare-fun valid!608 (LongMap!1018) Bool)

(assert (=> start!15456 (= res!72591 (valid!608 thiss!992))))

(assert (=> start!15456 e!100317))

(assert (=> start!15456 e!100310))

(assert (=> start!15456 true))

(assert (=> start!15456 e!100319))

(declare-fun b!153622 () Bool)

(declare-fun res!72589 () Bool)

(assert (=> b!153622 (=> (not res!72589) (not e!100317))))

(declare-datatypes ((tuple2!2818 0))(
  ( (tuple2!2819 (_1!1420 (_ BitVec 64)) (_2!1420 V!3667)) )
))
(declare-datatypes ((List!1802 0))(
  ( (Nil!1799) (Cons!1798 (h!2407 tuple2!2818) (t!6592 List!1802)) )
))
(declare-datatypes ((ListLongMap!1809 0))(
  ( (ListLongMap!1810 (toList!920 List!1802)) )
))
(declare-fun getCurrentListMap!585 (array!5079 array!5081 (_ BitVec 32) (_ BitVec 32) V!3667 V!3667 (_ BitVec 32) Int) ListLongMap!1809)

(declare-fun map!1495 (LongMapFixedSize!1236) ListLongMap!1809)

(assert (=> b!153622 (= res!72589 (= (getCurrentListMap!585 (_keys!4830 (v!3407 (underlying!520 thiss!992))) (_values!3040 (v!3407 (underlying!520 thiss!992))) (mask!7457 (v!3407 (underlying!520 thiss!992))) (extraKeys!2798 (v!3407 (underlying!520 thiss!992))) (zeroValue!2900 (v!3407 (underlying!520 thiss!992))) (minValue!2900 (v!3407 (underlying!520 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3057 (v!3407 (underlying!520 thiss!992)))) (map!1495 newMap!16)))))

(assert (= (and start!15456 res!72591) b!153612))

(assert (= (and b!153612 res!72587) b!153611))

(assert (= (and b!153611 res!72590) b!153608))

(assert (= (and b!153608 res!72588) b!153622))

(assert (= (and b!153622 res!72589) b!153621))

(assert (= (and b!153615 condMapEmpty!5132) mapIsEmpty!5131))

(assert (= (and b!153615 (not condMapEmpty!5132)) mapNonEmpty!5131))

(get-info :version)

(assert (= (and mapNonEmpty!5131 ((_ is ValueCellFull!1164) mapValue!5132)) b!153613))

(assert (= (and b!153615 ((_ is ValueCellFull!1164) mapDefault!5132)) b!153617))

(assert (= b!153619 b!153615))

(assert (= b!153610 b!153619))

(assert (= b!153616 b!153610))

(assert (= start!15456 b!153616))

(assert (= (and b!153614 condMapEmpty!5131) mapIsEmpty!5132))

(assert (= (and b!153614 (not condMapEmpty!5131)) mapNonEmpty!5132))

(assert (= (and mapNonEmpty!5132 ((_ is ValueCellFull!1164) mapValue!5131)) b!153618))

(assert (= (and b!153614 ((_ is ValueCellFull!1164) mapDefault!5131)) b!153609))

(assert (= b!153620 b!153614))

(assert (= start!15456 b!153620))

(declare-fun m!187481 () Bool)

(assert (=> b!153622 m!187481))

(declare-fun m!187483 () Bool)

(assert (=> b!153622 m!187483))

(declare-fun m!187485 () Bool)

(assert (=> mapNonEmpty!5132 m!187485))

(declare-fun m!187487 () Bool)

(assert (=> b!153619 m!187487))

(declare-fun m!187489 () Bool)

(assert (=> b!153619 m!187489))

(declare-fun m!187491 () Bool)

(assert (=> mapNonEmpty!5131 m!187491))

(declare-fun m!187493 () Bool)

(assert (=> b!153621 m!187493))

(declare-fun m!187495 () Bool)

(assert (=> b!153611 m!187495))

(declare-fun m!187497 () Bool)

(assert (=> b!153620 m!187497))

(declare-fun m!187499 () Bool)

(assert (=> b!153620 m!187499))

(declare-fun m!187501 () Bool)

(assert (=> start!15456 m!187501))

(check-sat tp_is_empty!3015 (not b!153619) (not b_next!3199) (not b!153620) b_and!9561 b_and!9559 (not b!153622) (not mapNonEmpty!5131) (not start!15456) (not b!153611) (not mapNonEmpty!5132) (not b_next!3197))
(check-sat b_and!9559 b_and!9561 (not b_next!3197) (not b_next!3199))
