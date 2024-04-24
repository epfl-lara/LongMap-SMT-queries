; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15792 () Bool)

(assert start!15792)

(declare-fun b!157506 () Bool)

(declare-fun b_free!3439 () Bool)

(declare-fun b_next!3439 () Bool)

(assert (=> b!157506 (= b_free!3439 (not b_next!3439))))

(declare-fun tp!12846 () Bool)

(declare-fun b_and!9867 () Bool)

(assert (=> b!157506 (= tp!12846 b_and!9867)))

(declare-fun b!157502 () Bool)

(declare-fun res!74433 () Bool)

(declare-fun e!103125 () Bool)

(assert (=> b!157502 (=> (not res!74433) (not e!103125))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157502 (= res!74433 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157503 () Bool)

(declare-fun res!74432 () Bool)

(assert (=> b!157503 (=> (not res!74432) (not e!103125))))

(declare-datatypes ((V!3969 0))(
  ( (V!3970 (val!1665 Int)) )
))
(declare-datatypes ((ValueCell!1277 0))(
  ( (ValueCellFull!1277 (v!3531 V!3969)) (EmptyCell!1277) )
))
(declare-datatypes ((array!5523 0))(
  ( (array!5524 (arr!2618 (Array (_ BitVec 32) (_ BitVec 64))) (size!2897 (_ BitVec 32))) )
))
(declare-datatypes ((array!5525 0))(
  ( (array!5526 (arr!2619 (Array (_ BitVec 32) ValueCell!1277)) (size!2898 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1462 0))(
  ( (LongMapFixedSize!1463 (defaultEntry!3173 Int) (mask!7654 (_ BitVec 32)) (extraKeys!2914 (_ BitVec 32)) (zeroValue!3016 V!3969) (minValue!3016 V!3969) (_size!780 (_ BitVec 32)) (_keys!4949 array!5523) (_values!3156 array!5525) (_vacant!780 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1462)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157503 (= res!74432 (validMask!0 (mask!7654 thiss!1248)))))

(declare-fun b!157504 () Bool)

(declare-fun e!103127 () Bool)

(declare-fun tp_is_empty!3241 () Bool)

(assert (=> b!157504 (= e!103127 tp_is_empty!3241)))

(declare-fun b!157505 () Bool)

(assert (=> b!157505 (= e!103125 (bvslt (mask!7654 thiss!1248) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!5508 () Bool)

(declare-fun mapRes!5508 () Bool)

(assert (=> mapIsEmpty!5508 mapRes!5508))

(declare-fun e!103126 () Bool)

(declare-fun e!103129 () Bool)

(declare-fun array_inv!1665 (array!5523) Bool)

(declare-fun array_inv!1666 (array!5525) Bool)

(assert (=> b!157506 (= e!103129 (and tp!12846 tp_is_empty!3241 (array_inv!1665 (_keys!4949 thiss!1248)) (array_inv!1666 (_values!3156 thiss!1248)) e!103126))))

(declare-fun res!74434 () Bool)

(assert (=> start!15792 (=> (not res!74434) (not e!103125))))

(declare-fun valid!715 (LongMapFixedSize!1462) Bool)

(assert (=> start!15792 (= res!74434 (valid!715 thiss!1248))))

(assert (=> start!15792 e!103125))

(assert (=> start!15792 e!103129))

(assert (=> start!15792 true))

(declare-fun mapNonEmpty!5508 () Bool)

(declare-fun tp!12845 () Bool)

(declare-fun e!103128 () Bool)

(assert (=> mapNonEmpty!5508 (= mapRes!5508 (and tp!12845 e!103128))))

(declare-fun mapValue!5508 () ValueCell!1277)

(declare-fun mapRest!5508 () (Array (_ BitVec 32) ValueCell!1277))

(declare-fun mapKey!5508 () (_ BitVec 32))

(assert (=> mapNonEmpty!5508 (= (arr!2619 (_values!3156 thiss!1248)) (store mapRest!5508 mapKey!5508 mapValue!5508))))

(declare-fun b!157507 () Bool)

(assert (=> b!157507 (= e!103128 tp_is_empty!3241)))

(declare-fun b!157508 () Bool)

(assert (=> b!157508 (= e!103126 (and e!103127 mapRes!5508))))

(declare-fun condMapEmpty!5508 () Bool)

(declare-fun mapDefault!5508 () ValueCell!1277)

(assert (=> b!157508 (= condMapEmpty!5508 (= (arr!2619 (_values!3156 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1277)) mapDefault!5508)))))

(assert (= (and start!15792 res!74434) b!157502))

(assert (= (and b!157502 res!74433) b!157503))

(assert (= (and b!157503 res!74432) b!157505))

(assert (= (and b!157508 condMapEmpty!5508) mapIsEmpty!5508))

(assert (= (and b!157508 (not condMapEmpty!5508)) mapNonEmpty!5508))

(get-info :version)

(assert (= (and mapNonEmpty!5508 ((_ is ValueCellFull!1277) mapValue!5508)) b!157507))

(assert (= (and b!157508 ((_ is ValueCellFull!1277) mapDefault!5508)) b!157504))

(assert (= b!157506 b!157508))

(assert (= start!15792 b!157506))

(declare-fun m!190855 () Bool)

(assert (=> b!157503 m!190855))

(declare-fun m!190857 () Bool)

(assert (=> b!157506 m!190857))

(declare-fun m!190859 () Bool)

(assert (=> b!157506 m!190859))

(declare-fun m!190861 () Bool)

(assert (=> start!15792 m!190861))

(declare-fun m!190863 () Bool)

(assert (=> mapNonEmpty!5508 m!190863))

(check-sat (not b!157503) (not start!15792) tp_is_empty!3241 (not mapNonEmpty!5508) (not b!157506) (not b_next!3439) b_and!9867)
(check-sat b_and!9867 (not b_next!3439))
(get-model)

(declare-fun d!51131 () Bool)

(assert (=> d!51131 (= (array_inv!1665 (_keys!4949 thiss!1248)) (bvsge (size!2897 (_keys!4949 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157506 d!51131))

(declare-fun d!51133 () Bool)

(assert (=> d!51133 (= (array_inv!1666 (_values!3156 thiss!1248)) (bvsge (size!2898 (_values!3156 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157506 d!51133))

(declare-fun d!51135 () Bool)

(assert (=> d!51135 (= (validMask!0 (mask!7654 thiss!1248)) (and (or (= (mask!7654 thiss!1248) #b00000000000000000000000000000111) (= (mask!7654 thiss!1248) #b00000000000000000000000000001111) (= (mask!7654 thiss!1248) #b00000000000000000000000000011111) (= (mask!7654 thiss!1248) #b00000000000000000000000000111111) (= (mask!7654 thiss!1248) #b00000000000000000000000001111111) (= (mask!7654 thiss!1248) #b00000000000000000000000011111111) (= (mask!7654 thiss!1248) #b00000000000000000000000111111111) (= (mask!7654 thiss!1248) #b00000000000000000000001111111111) (= (mask!7654 thiss!1248) #b00000000000000000000011111111111) (= (mask!7654 thiss!1248) #b00000000000000000000111111111111) (= (mask!7654 thiss!1248) #b00000000000000000001111111111111) (= (mask!7654 thiss!1248) #b00000000000000000011111111111111) (= (mask!7654 thiss!1248) #b00000000000000000111111111111111) (= (mask!7654 thiss!1248) #b00000000000000001111111111111111) (= (mask!7654 thiss!1248) #b00000000000000011111111111111111) (= (mask!7654 thiss!1248) #b00000000000000111111111111111111) (= (mask!7654 thiss!1248) #b00000000000001111111111111111111) (= (mask!7654 thiss!1248) #b00000000000011111111111111111111) (= (mask!7654 thiss!1248) #b00000000000111111111111111111111) (= (mask!7654 thiss!1248) #b00000000001111111111111111111111) (= (mask!7654 thiss!1248) #b00000000011111111111111111111111) (= (mask!7654 thiss!1248) #b00000000111111111111111111111111) (= (mask!7654 thiss!1248) #b00000001111111111111111111111111) (= (mask!7654 thiss!1248) #b00000011111111111111111111111111) (= (mask!7654 thiss!1248) #b00000111111111111111111111111111) (= (mask!7654 thiss!1248) #b00001111111111111111111111111111) (= (mask!7654 thiss!1248) #b00011111111111111111111111111111) (= (mask!7654 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7654 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157503 d!51135))

(declare-fun d!51137 () Bool)

(declare-fun res!74459 () Bool)

(declare-fun e!103169 () Bool)

(assert (=> d!51137 (=> (not res!74459) (not e!103169))))

(declare-fun simpleValid!106 (LongMapFixedSize!1462) Bool)

(assert (=> d!51137 (= res!74459 (simpleValid!106 thiss!1248))))

(assert (=> d!51137 (= (valid!715 thiss!1248) e!103169)))

(declare-fun b!157557 () Bool)

(declare-fun res!74460 () Bool)

(assert (=> b!157557 (=> (not res!74460) (not e!103169))))

(declare-fun arrayCountValidKeys!0 (array!5523 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157557 (= res!74460 (= (arrayCountValidKeys!0 (_keys!4949 thiss!1248) #b00000000000000000000000000000000 (size!2897 (_keys!4949 thiss!1248))) (_size!780 thiss!1248)))))

(declare-fun b!157558 () Bool)

(declare-fun res!74461 () Bool)

(assert (=> b!157558 (=> (not res!74461) (not e!103169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5523 (_ BitVec 32)) Bool)

(assert (=> b!157558 (= res!74461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4949 thiss!1248) (mask!7654 thiss!1248)))))

(declare-fun b!157559 () Bool)

(declare-datatypes ((List!1867 0))(
  ( (Nil!1864) (Cons!1863 (h!2472 (_ BitVec 64)) (t!6661 List!1867)) )
))
(declare-fun arrayNoDuplicates!0 (array!5523 (_ BitVec 32) List!1867) Bool)

(assert (=> b!157559 (= e!103169 (arrayNoDuplicates!0 (_keys!4949 thiss!1248) #b00000000000000000000000000000000 Nil!1864))))

(assert (= (and d!51137 res!74459) b!157557))

(assert (= (and b!157557 res!74460) b!157558))

(assert (= (and b!157558 res!74461) b!157559))

(declare-fun m!190885 () Bool)

(assert (=> d!51137 m!190885))

(declare-fun m!190887 () Bool)

(assert (=> b!157557 m!190887))

(declare-fun m!190889 () Bool)

(assert (=> b!157558 m!190889))

(declare-fun m!190891 () Bool)

(assert (=> b!157559 m!190891))

(assert (=> start!15792 d!51137))

(declare-fun condMapEmpty!5517 () Bool)

(declare-fun mapDefault!5517 () ValueCell!1277)

(assert (=> mapNonEmpty!5508 (= condMapEmpty!5517 (= mapRest!5508 ((as const (Array (_ BitVec 32) ValueCell!1277)) mapDefault!5517)))))

(declare-fun e!103175 () Bool)

(declare-fun mapRes!5517 () Bool)

(assert (=> mapNonEmpty!5508 (= tp!12845 (and e!103175 mapRes!5517))))

(declare-fun b!157567 () Bool)

(assert (=> b!157567 (= e!103175 tp_is_empty!3241)))

(declare-fun b!157566 () Bool)

(declare-fun e!103174 () Bool)

(assert (=> b!157566 (= e!103174 tp_is_empty!3241)))

(declare-fun mapIsEmpty!5517 () Bool)

(assert (=> mapIsEmpty!5517 mapRes!5517))

(declare-fun mapNonEmpty!5517 () Bool)

(declare-fun tp!12861 () Bool)

(assert (=> mapNonEmpty!5517 (= mapRes!5517 (and tp!12861 e!103174))))

(declare-fun mapKey!5517 () (_ BitVec 32))

(declare-fun mapValue!5517 () ValueCell!1277)

(declare-fun mapRest!5517 () (Array (_ BitVec 32) ValueCell!1277))

(assert (=> mapNonEmpty!5517 (= mapRest!5508 (store mapRest!5517 mapKey!5517 mapValue!5517))))

(assert (= (and mapNonEmpty!5508 condMapEmpty!5517) mapIsEmpty!5517))

(assert (= (and mapNonEmpty!5508 (not condMapEmpty!5517)) mapNonEmpty!5517))

(assert (= (and mapNonEmpty!5517 ((_ is ValueCellFull!1277) mapValue!5517)) b!157566))

(assert (= (and mapNonEmpty!5508 ((_ is ValueCellFull!1277) mapDefault!5517)) b!157567))

(declare-fun m!190893 () Bool)

(assert (=> mapNonEmpty!5517 m!190893))

(check-sat (not d!51137) tp_is_empty!3241 (not mapNonEmpty!5517) (not b_next!3439) (not b!157557) (not b!157558) b_and!9867 (not b!157559))
(check-sat b_and!9867 (not b_next!3439))
