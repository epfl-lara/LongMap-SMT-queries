; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!430 () Bool)

(assert start!430)

(declare-fun b!2538 () Bool)

(declare-fun b_free!55 () Bool)

(declare-fun b_next!55 () Bool)

(assert (=> b!2538 (= b_free!55 (not b_next!55))))

(declare-fun tp!227 () Bool)

(declare-fun b_and!193 () Bool)

(assert (=> b!2538 (= tp!227 b_and!193)))

(declare-fun b!2532 () Bool)

(declare-fun e!859 () Bool)

(declare-fun tp_is_empty!43 () Bool)

(assert (=> b!2532 (= e!859 tp_is_empty!43)))

(declare-fun mapNonEmpty!2 () Bool)

(declare-fun mapRes!2 () Bool)

(declare-fun tp!226 () Bool)

(assert (=> mapNonEmpty!2 (= mapRes!2 (and tp!226 e!859))))

(declare-datatypes ((V!235 0))(
  ( (V!236 (val!27 Int)) )
))
(declare-datatypes ((ValueCell!5 0))(
  ( (ValueCellFull!5 (v!1107 V!235)) (EmptyCell!5) )
))
(declare-fun mapRest!2 () (Array (_ BitVec 32) ValueCell!5))

(declare-datatypes ((array!15 0))(
  ( (array!16 (arr!7 (Array (_ BitVec 32) ValueCell!5)) (size!69 (_ BitVec 32))) )
))
(declare-datatypes ((array!17 0))(
  ( (array!18 (arr!8 (Array (_ BitVec 32) (_ BitVec 64))) (size!70 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!10 0))(
  ( (LongMapFixedSize!11 (defaultEntry!1589 Int) (mask!4165 (_ BitVec 32)) (extraKeys!1506 (_ BitVec 32)) (zeroValue!1529 V!235) (minValue!1529 V!235) (_size!36 (_ BitVec 32)) (_keys!2991 array!17) (_values!1590 array!15) (_vacant!36 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!10 0))(
  ( (Cell!11 (v!1108 LongMapFixedSize!10)) )
))
(declare-datatypes ((LongMap!10 0))(
  ( (LongMap!11 (underlying!16 Cell!10)) )
))
(declare-fun thiss!814 () LongMap!10)

(declare-fun mapKey!2 () (_ BitVec 32))

(declare-fun mapValue!2 () ValueCell!5)

(assert (=> mapNonEmpty!2 (= (arr!7 (_values!1590 (v!1108 (underlying!16 thiss!814)))) (store mapRest!2 mapKey!2 mapValue!2))))

(declare-fun b!2533 () Bool)

(declare-fun e!860 () Bool)

(declare-fun e!862 () Bool)

(assert (=> b!2533 (= e!860 (and e!862 mapRes!2))))

(declare-fun condMapEmpty!2 () Bool)

(declare-fun mapDefault!2 () ValueCell!5)

(assert (=> b!2533 (= condMapEmpty!2 (= (arr!7 (_values!1590 (v!1108 (underlying!16 thiss!814)))) ((as const (Array (_ BitVec 32) ValueCell!5)) mapDefault!2)))))

(declare-fun b!2534 () Bool)

(declare-fun e!863 () Bool)

(declare-fun e!857 () Bool)

(assert (=> b!2534 (= e!863 e!857)))

(declare-fun b!2535 () Bool)

(assert (=> b!2535 (= e!862 tp_is_empty!43)))

(declare-fun mapIsEmpty!2 () Bool)

(assert (=> mapIsEmpty!2 mapRes!2))

(declare-fun res!4775 () Bool)

(declare-fun e!858 () Bool)

(assert (=> start!430 (=> (not res!4775) (not e!858))))

(declare-fun valid!9 (LongMap!10) Bool)

(assert (=> start!430 (= res!4775 (valid!9 thiss!814))))

(assert (=> start!430 e!858))

(assert (=> start!430 e!863))

(declare-fun b!2536 () Bool)

(declare-fun e!864 () Bool)

(assert (=> b!2536 (= e!857 e!864)))

(declare-fun b!2537 () Bool)

(declare-fun valid!10 (LongMapFixedSize!10) Bool)

(assert (=> b!2537 (= e!858 (not (valid!10 (v!1108 (underlying!16 thiss!814)))))))

(declare-fun array_inv!1 (array!17) Bool)

(declare-fun array_inv!2 (array!15) Bool)

(assert (=> b!2538 (= e!864 (and tp!227 tp_is_empty!43 (array_inv!1 (_keys!2991 (v!1108 (underlying!16 thiss!814)))) (array_inv!2 (_values!1590 (v!1108 (underlying!16 thiss!814)))) e!860))))

(assert (= (and start!430 res!4775) b!2537))

(assert (= (and b!2533 condMapEmpty!2) mapIsEmpty!2))

(assert (= (and b!2533 (not condMapEmpty!2)) mapNonEmpty!2))

(get-info :version)

(assert (= (and mapNonEmpty!2 ((_ is ValueCellFull!5) mapValue!2)) b!2532))

(assert (= (and b!2533 ((_ is ValueCellFull!5) mapDefault!2)) b!2535))

(assert (= b!2538 b!2533))

(assert (= b!2536 b!2538))

(assert (= b!2534 b!2536))

(assert (= start!430 b!2534))

(declare-fun m!1095 () Bool)

(assert (=> mapNonEmpty!2 m!1095))

(declare-fun m!1097 () Bool)

(assert (=> start!430 m!1097))

(declare-fun m!1099 () Bool)

(assert (=> b!2537 m!1099))

(declare-fun m!1101 () Bool)

(assert (=> b!2538 m!1101))

(declare-fun m!1103 () Bool)

(assert (=> b!2538 m!1103))

(check-sat (not b!2537) (not b_next!55) (not start!430) (not b!2538) b_and!193 (not mapNonEmpty!2) tp_is_empty!43)
(check-sat b_and!193 (not b_next!55))
(get-model)

(declare-fun d!551 () Bool)

(assert (=> d!551 (= (array_inv!1 (_keys!2991 (v!1108 (underlying!16 thiss!814)))) (bvsge (size!70 (_keys!2991 (v!1108 (underlying!16 thiss!814)))) #b00000000000000000000000000000000))))

(assert (=> b!2538 d!551))

(declare-fun d!553 () Bool)

(assert (=> d!553 (= (array_inv!2 (_values!1590 (v!1108 (underlying!16 thiss!814)))) (bvsge (size!69 (_values!1590 (v!1108 (underlying!16 thiss!814)))) #b00000000000000000000000000000000))))

(assert (=> b!2538 d!553))

(declare-fun d!555 () Bool)

(assert (=> d!555 (= (valid!9 thiss!814) (valid!10 (v!1108 (underlying!16 thiss!814))))))

(declare-fun bs!123 () Bool)

(assert (= bs!123 d!555))

(assert (=> bs!123 m!1099))

(assert (=> start!430 d!555))

(declare-fun d!557 () Bool)

(declare-fun res!4788 () Bool)

(declare-fun e!915 () Bool)

(assert (=> d!557 (=> (not res!4788) (not e!915))))

(declare-fun simpleValid!4 (LongMapFixedSize!10) Bool)

(assert (=> d!557 (= res!4788 (simpleValid!4 (v!1108 (underlying!16 thiss!814))))))

(assert (=> d!557 (= (valid!10 (v!1108 (underlying!16 thiss!814))) e!915)))

(declare-fun b!2587 () Bool)

(declare-fun res!4789 () Bool)

(assert (=> b!2587 (=> (not res!4789) (not e!915))))

(declare-fun arrayCountValidKeys!0 (array!17 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!2587 (= res!4789 (= (arrayCountValidKeys!0 (_keys!2991 (v!1108 (underlying!16 thiss!814))) #b00000000000000000000000000000000 (size!70 (_keys!2991 (v!1108 (underlying!16 thiss!814))))) (_size!36 (v!1108 (underlying!16 thiss!814)))))))

(declare-fun b!2588 () Bool)

(declare-fun res!4790 () Bool)

(assert (=> b!2588 (=> (not res!4790) (not e!915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17 (_ BitVec 32)) Bool)

(assert (=> b!2588 (= res!4790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2991 (v!1108 (underlying!16 thiss!814))) (mask!4165 (v!1108 (underlying!16 thiss!814)))))))

(declare-fun b!2589 () Bool)

(declare-datatypes ((List!36 0))(
  ( (Nil!33) (Cons!32 (h!598 (_ BitVec 64)) (t!2163 List!36)) )
))
(declare-fun arrayNoDuplicates!0 (array!17 (_ BitVec 32) List!36) Bool)

(assert (=> b!2589 (= e!915 (arrayNoDuplicates!0 (_keys!2991 (v!1108 (underlying!16 thiss!814))) #b00000000000000000000000000000000 Nil!33))))

(assert (= (and d!557 res!4788) b!2587))

(assert (= (and b!2587 res!4789) b!2588))

(assert (= (and b!2588 res!4790) b!2589))

(declare-fun m!1125 () Bool)

(assert (=> d!557 m!1125))

(declare-fun m!1127 () Bool)

(assert (=> b!2587 m!1127))

(declare-fun m!1129 () Bool)

(assert (=> b!2588 m!1129))

(declare-fun m!1131 () Bool)

(assert (=> b!2589 m!1131))

(assert (=> b!2537 d!557))

(declare-fun mapNonEmpty!11 () Bool)

(declare-fun mapRes!11 () Bool)

(declare-fun tp!242 () Bool)

(declare-fun e!920 () Bool)

(assert (=> mapNonEmpty!11 (= mapRes!11 (and tp!242 e!920))))

(declare-fun mapValue!11 () ValueCell!5)

(declare-fun mapKey!11 () (_ BitVec 32))

(declare-fun mapRest!11 () (Array (_ BitVec 32) ValueCell!5))

(assert (=> mapNonEmpty!11 (= mapRest!2 (store mapRest!11 mapKey!11 mapValue!11))))

(declare-fun mapIsEmpty!11 () Bool)

(assert (=> mapIsEmpty!11 mapRes!11))

(declare-fun condMapEmpty!11 () Bool)

(declare-fun mapDefault!11 () ValueCell!5)

(assert (=> mapNonEmpty!2 (= condMapEmpty!11 (= mapRest!2 ((as const (Array (_ BitVec 32) ValueCell!5)) mapDefault!11)))))

(declare-fun e!921 () Bool)

(assert (=> mapNonEmpty!2 (= tp!226 (and e!921 mapRes!11))))

(declare-fun b!2596 () Bool)

(assert (=> b!2596 (= e!920 tp_is_empty!43)))

(declare-fun b!2597 () Bool)

(assert (=> b!2597 (= e!921 tp_is_empty!43)))

(assert (= (and mapNonEmpty!2 condMapEmpty!11) mapIsEmpty!11))

(assert (= (and mapNonEmpty!2 (not condMapEmpty!11)) mapNonEmpty!11))

(assert (= (and mapNonEmpty!11 ((_ is ValueCellFull!5) mapValue!11)) b!2596))

(assert (= (and mapNonEmpty!2 ((_ is ValueCellFull!5) mapDefault!11)) b!2597))

(declare-fun m!1133 () Bool)

(assert (=> mapNonEmpty!11 m!1133))

(check-sat (not d!555) (not b!2589) (not d!557) (not b_next!55) (not b!2588) tp_is_empty!43 (not b!2587) b_and!193 (not mapNonEmpty!11))
(check-sat b_and!193 (not b_next!55))
