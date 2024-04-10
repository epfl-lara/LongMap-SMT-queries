; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!432 () Bool)

(assert start!432)

(declare-fun b!2553 () Bool)

(declare-fun b_free!57 () Bool)

(declare-fun b_next!57 () Bool)

(assert (=> b!2553 (= b_free!57 (not b_next!57))))

(declare-fun tp!233 () Bool)

(declare-fun b_and!195 () Bool)

(assert (=> b!2553 (= tp!233 b_and!195)))

(declare-datatypes ((V!237 0))(
  ( (V!238 (val!28 Int)) )
))
(declare-datatypes ((ValueCell!6 0))(
  ( (ValueCellFull!6 (v!1109 V!237)) (EmptyCell!6) )
))
(declare-datatypes ((array!19 0))(
  ( (array!20 (arr!9 (Array (_ BitVec 32) ValueCell!6)) (size!71 (_ BitVec 32))) )
))
(declare-datatypes ((array!21 0))(
  ( (array!22 (arr!10 (Array (_ BitVec 32) (_ BitVec 64))) (size!72 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!12 0))(
  ( (LongMapFixedSize!13 (defaultEntry!1590 Int) (mask!4166 (_ BitVec 32)) (extraKeys!1507 (_ BitVec 32)) (zeroValue!1530 V!237) (minValue!1530 V!237) (_size!37 (_ BitVec 32)) (_keys!2992 array!21) (_values!1591 array!19) (_vacant!37 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!12 0))(
  ( (Cell!13 (v!1110 LongMapFixedSize!12)) )
))
(declare-datatypes ((LongMap!12 0))(
  ( (LongMap!13 (underlying!17 Cell!12)) )
))
(declare-fun thiss!814 () LongMap!12)

(declare-fun e!881 () Bool)

(declare-fun e!887 () Bool)

(declare-fun tp_is_empty!45 () Bool)

(declare-fun array_inv!1 (array!21) Bool)

(declare-fun array_inv!2 (array!19) Bool)

(assert (=> b!2553 (= e!887 (and tp!233 tp_is_empty!45 (array_inv!1 (_keys!2992 (v!1110 (underlying!17 thiss!814)))) (array_inv!2 (_values!1591 (v!1110 (underlying!17 thiss!814)))) e!881))))

(declare-fun b!2554 () Bool)

(declare-fun e!888 () Bool)

(declare-fun mapRes!5 () Bool)

(assert (=> b!2554 (= e!881 (and e!888 mapRes!5))))

(declare-fun condMapEmpty!5 () Bool)

(declare-fun mapDefault!5 () ValueCell!6)

(assert (=> b!2554 (= condMapEmpty!5 (= (arr!9 (_values!1591 (v!1110 (underlying!17 thiss!814)))) ((as const (Array (_ BitVec 32) ValueCell!6)) mapDefault!5)))))

(declare-fun mapNonEmpty!5 () Bool)

(declare-fun tp!232 () Bool)

(declare-fun e!884 () Bool)

(assert (=> mapNonEmpty!5 (= mapRes!5 (and tp!232 e!884))))

(declare-fun mapValue!5 () ValueCell!6)

(declare-fun mapKey!5 () (_ BitVec 32))

(declare-fun mapRest!5 () (Array (_ BitVec 32) ValueCell!6))

(assert (=> mapNonEmpty!5 (= (arr!9 (_values!1591 (v!1110 (underlying!17 thiss!814)))) (store mapRest!5 mapKey!5 mapValue!5))))

(declare-fun b!2555 () Bool)

(declare-fun e!886 () Bool)

(declare-fun e!883 () Bool)

(assert (=> b!2555 (= e!886 e!883)))

(declare-fun b!2556 () Bool)

(assert (=> b!2556 (= e!888 tp_is_empty!45)))

(declare-fun b!2557 () Bool)

(assert (=> b!2557 (= e!883 e!887)))

(declare-fun mapIsEmpty!5 () Bool)

(assert (=> mapIsEmpty!5 mapRes!5))

(declare-fun res!4778 () Bool)

(declare-fun e!885 () Bool)

(assert (=> start!432 (=> (not res!4778) (not e!885))))

(declare-fun valid!9 (LongMap!12) Bool)

(assert (=> start!432 (= res!4778 (valid!9 thiss!814))))

(assert (=> start!432 e!885))

(assert (=> start!432 e!886))

(declare-fun b!2558 () Bool)

(declare-fun valid!10 (LongMapFixedSize!12) Bool)

(assert (=> b!2558 (= e!885 (not (valid!10 (v!1110 (underlying!17 thiss!814)))))))

(declare-fun b!2559 () Bool)

(assert (=> b!2559 (= e!884 tp_is_empty!45)))

(assert (= (and start!432 res!4778) b!2558))

(assert (= (and b!2554 condMapEmpty!5) mapIsEmpty!5))

(assert (= (and b!2554 (not condMapEmpty!5)) mapNonEmpty!5))

(get-info :version)

(assert (= (and mapNonEmpty!5 ((_ is ValueCellFull!6) mapValue!5)) b!2559))

(assert (= (and b!2554 ((_ is ValueCellFull!6) mapDefault!5)) b!2556))

(assert (= b!2553 b!2554))

(assert (= b!2557 b!2553))

(assert (= b!2555 b!2557))

(assert (= start!432 b!2555))

(declare-fun m!1105 () Bool)

(assert (=> b!2553 m!1105))

(declare-fun m!1107 () Bool)

(assert (=> b!2553 m!1107))

(declare-fun m!1109 () Bool)

(assert (=> mapNonEmpty!5 m!1109))

(declare-fun m!1111 () Bool)

(assert (=> start!432 m!1111))

(declare-fun m!1113 () Bool)

(assert (=> b!2558 m!1113))

(check-sat b_and!195 (not start!432) (not b_next!57) (not mapNonEmpty!5) (not b!2558) (not b!2553) tp_is_empty!45)
(check-sat b_and!195 (not b_next!57))
(get-model)

(declare-fun d!551 () Bool)

(declare-fun res!4788 () Bool)

(declare-fun e!915 () Bool)

(assert (=> d!551 (=> (not res!4788) (not e!915))))

(declare-fun simpleValid!4 (LongMapFixedSize!12) Bool)

(assert (=> d!551 (= res!4788 (simpleValid!4 (v!1110 (underlying!17 thiss!814))))))

(assert (=> d!551 (= (valid!10 (v!1110 (underlying!17 thiss!814))) e!915)))

(declare-fun b!2587 () Bool)

(declare-fun res!4789 () Bool)

(assert (=> b!2587 (=> (not res!4789) (not e!915))))

(declare-fun arrayCountValidKeys!0 (array!21 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!2587 (= res!4789 (= (arrayCountValidKeys!0 (_keys!2992 (v!1110 (underlying!17 thiss!814))) #b00000000000000000000000000000000 (size!72 (_keys!2992 (v!1110 (underlying!17 thiss!814))))) (_size!37 (v!1110 (underlying!17 thiss!814)))))))

(declare-fun b!2588 () Bool)

(declare-fun res!4790 () Bool)

(assert (=> b!2588 (=> (not res!4790) (not e!915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21 (_ BitVec 32)) Bool)

(assert (=> b!2588 (= res!4790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2992 (v!1110 (underlying!17 thiss!814))) (mask!4166 (v!1110 (underlying!17 thiss!814)))))))

(declare-fun b!2589 () Bool)

(declare-datatypes ((List!36 0))(
  ( (Nil!33) (Cons!32 (h!598 (_ BitVec 64)) (t!2163 List!36)) )
))
(declare-fun arrayNoDuplicates!0 (array!21 (_ BitVec 32) List!36) Bool)

(assert (=> b!2589 (= e!915 (arrayNoDuplicates!0 (_keys!2992 (v!1110 (underlying!17 thiss!814))) #b00000000000000000000000000000000 Nil!33))))

(assert (= (and d!551 res!4788) b!2587))

(assert (= (and b!2587 res!4789) b!2588))

(assert (= (and b!2588 res!4790) b!2589))

(declare-fun m!1125 () Bool)

(assert (=> d!551 m!1125))

(declare-fun m!1127 () Bool)

(assert (=> b!2587 m!1127))

(declare-fun m!1129 () Bool)

(assert (=> b!2588 m!1129))

(declare-fun m!1131 () Bool)

(assert (=> b!2589 m!1131))

(assert (=> b!2558 d!551))

(declare-fun d!553 () Bool)

(assert (=> d!553 (= (valid!9 thiss!814) (valid!10 (v!1110 (underlying!17 thiss!814))))))

(declare-fun bs!123 () Bool)

(assert (= bs!123 d!553))

(assert (=> bs!123 m!1113))

(assert (=> start!432 d!553))

(declare-fun d!555 () Bool)

(assert (=> d!555 (= (array_inv!1 (_keys!2992 (v!1110 (underlying!17 thiss!814)))) (bvsge (size!72 (_keys!2992 (v!1110 (underlying!17 thiss!814)))) #b00000000000000000000000000000000))))

(assert (=> b!2553 d!555))

(declare-fun d!557 () Bool)

(assert (=> d!557 (= (array_inv!2 (_values!1591 (v!1110 (underlying!17 thiss!814)))) (bvsge (size!71 (_values!1591 (v!1110 (underlying!17 thiss!814)))) #b00000000000000000000000000000000))))

(assert (=> b!2553 d!557))

(declare-fun mapNonEmpty!11 () Bool)

(declare-fun mapRes!11 () Bool)

(declare-fun tp!242 () Bool)

(declare-fun e!920 () Bool)

(assert (=> mapNonEmpty!11 (= mapRes!11 (and tp!242 e!920))))

(declare-fun mapRest!11 () (Array (_ BitVec 32) ValueCell!6))

(declare-fun mapKey!11 () (_ BitVec 32))

(declare-fun mapValue!11 () ValueCell!6)

(assert (=> mapNonEmpty!11 (= mapRest!5 (store mapRest!11 mapKey!11 mapValue!11))))

(declare-fun condMapEmpty!11 () Bool)

(declare-fun mapDefault!11 () ValueCell!6)

(assert (=> mapNonEmpty!5 (= condMapEmpty!11 (= mapRest!5 ((as const (Array (_ BitVec 32) ValueCell!6)) mapDefault!11)))))

(declare-fun e!921 () Bool)

(assert (=> mapNonEmpty!5 (= tp!232 (and e!921 mapRes!11))))

(declare-fun b!2597 () Bool)

(assert (=> b!2597 (= e!921 tp_is_empty!45)))

(declare-fun mapIsEmpty!11 () Bool)

(assert (=> mapIsEmpty!11 mapRes!11))

(declare-fun b!2596 () Bool)

(assert (=> b!2596 (= e!920 tp_is_empty!45)))

(assert (= (and mapNonEmpty!5 condMapEmpty!11) mapIsEmpty!11))

(assert (= (and mapNonEmpty!5 (not condMapEmpty!11)) mapNonEmpty!11))

(assert (= (and mapNonEmpty!11 ((_ is ValueCellFull!6) mapValue!11)) b!2596))

(assert (= (and mapNonEmpty!5 ((_ is ValueCellFull!6) mapDefault!11)) b!2597))

(declare-fun m!1133 () Bool)

(assert (=> mapNonEmpty!11 m!1133))

(check-sat b_and!195 (not b!2589) (not b!2587) (not d!553) tp_is_empty!45 (not d!551) (not b!2588) (not mapNonEmpty!11) (not b_next!57))
(check-sat b_and!195 (not b_next!57))
