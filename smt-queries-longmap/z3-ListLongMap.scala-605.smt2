; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15792 () Bool)

(assert start!15792)

(declare-fun b!157311 () Bool)

(declare-fun b_free!3439 () Bool)

(declare-fun b_next!3439 () Bool)

(assert (=> b!157311 (= b_free!3439 (not b_next!3439))))

(declare-fun tp!12846 () Bool)

(declare-fun b_and!9827 () Bool)

(assert (=> b!157311 (= tp!12846 b_and!9827)))

(declare-fun b!157308 () Bool)

(declare-fun e!103004 () Bool)

(declare-fun e!103005 () Bool)

(declare-fun mapRes!5508 () Bool)

(assert (=> b!157308 (= e!103004 (and e!103005 mapRes!5508))))

(declare-fun condMapEmpty!5508 () Bool)

(declare-datatypes ((V!3969 0))(
  ( (V!3970 (val!1665 Int)) )
))
(declare-datatypes ((ValueCell!1277 0))(
  ( (ValueCellFull!1277 (v!3524 V!3969)) (EmptyCell!1277) )
))
(declare-datatypes ((array!5517 0))(
  ( (array!5518 (arr!2614 (Array (_ BitVec 32) (_ BitVec 64))) (size!2894 (_ BitVec 32))) )
))
(declare-datatypes ((array!5519 0))(
  ( (array!5520 (arr!2615 (Array (_ BitVec 32) ValueCell!1277)) (size!2895 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1462 0))(
  ( (LongMapFixedSize!1463 (defaultEntry!3173 Int) (mask!7653 (_ BitVec 32)) (extraKeys!2914 (_ BitVec 32)) (zeroValue!3016 V!3969) (minValue!3016 V!3969) (_size!780 (_ BitVec 32)) (_keys!4948 array!5517) (_values!3156 array!5519) (_vacant!780 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1462)

(declare-fun mapDefault!5508 () ValueCell!1277)

(assert (=> b!157308 (= condMapEmpty!5508 (= (arr!2615 (_values!3156 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1277)) mapDefault!5508)))))

(declare-fun b!157309 () Bool)

(declare-fun e!103002 () Bool)

(assert (=> b!157309 (= e!103002 (bvslt (mask!7653 thiss!1248) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!5508 () Bool)

(assert (=> mapIsEmpty!5508 mapRes!5508))

(declare-fun e!103003 () Bool)

(declare-fun tp_is_empty!3241 () Bool)

(declare-fun array_inv!1681 (array!5517) Bool)

(declare-fun array_inv!1682 (array!5519) Bool)

(assert (=> b!157311 (= e!103003 (and tp!12846 tp_is_empty!3241 (array_inv!1681 (_keys!4948 thiss!1248)) (array_inv!1682 (_values!3156 thiss!1248)) e!103004))))

(declare-fun b!157312 () Bool)

(assert (=> b!157312 (= e!103005 tp_is_empty!3241)))

(declare-fun b!157313 () Bool)

(declare-fun res!74316 () Bool)

(assert (=> b!157313 (=> (not res!74316) (not e!103002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157313 (= res!74316 (validMask!0 (mask!7653 thiss!1248)))))

(declare-fun b!157310 () Bool)

(declare-fun res!74317 () Bool)

(assert (=> b!157310 (=> (not res!74317) (not e!103002))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157310 (= res!74317 (not (= key!828 (bvneg key!828))))))

(declare-fun res!74318 () Bool)

(assert (=> start!15792 (=> (not res!74318) (not e!103002))))

(declare-fun valid!700 (LongMapFixedSize!1462) Bool)

(assert (=> start!15792 (= res!74318 (valid!700 thiss!1248))))

(assert (=> start!15792 e!103002))

(assert (=> start!15792 e!103003))

(assert (=> start!15792 true))

(declare-fun b!157314 () Bool)

(declare-fun e!103000 () Bool)

(assert (=> b!157314 (= e!103000 tp_is_empty!3241)))

(declare-fun mapNonEmpty!5508 () Bool)

(declare-fun tp!12845 () Bool)

(assert (=> mapNonEmpty!5508 (= mapRes!5508 (and tp!12845 e!103000))))

(declare-fun mapKey!5508 () (_ BitVec 32))

(declare-fun mapRest!5508 () (Array (_ BitVec 32) ValueCell!1277))

(declare-fun mapValue!5508 () ValueCell!1277)

(assert (=> mapNonEmpty!5508 (= (arr!2615 (_values!3156 thiss!1248)) (store mapRest!5508 mapKey!5508 mapValue!5508))))

(assert (= (and start!15792 res!74318) b!157310))

(assert (= (and b!157310 res!74317) b!157313))

(assert (= (and b!157313 res!74316) b!157309))

(assert (= (and b!157308 condMapEmpty!5508) mapIsEmpty!5508))

(assert (= (and b!157308 (not condMapEmpty!5508)) mapNonEmpty!5508))

(get-info :version)

(assert (= (and mapNonEmpty!5508 ((_ is ValueCellFull!1277) mapValue!5508)) b!157314))

(assert (= (and b!157308 ((_ is ValueCellFull!1277) mapDefault!5508)) b!157312))

(assert (= b!157311 b!157308))

(assert (= start!15792 b!157311))

(declare-fun m!190053 () Bool)

(assert (=> b!157311 m!190053))

(declare-fun m!190055 () Bool)

(assert (=> b!157311 m!190055))

(declare-fun m!190057 () Bool)

(assert (=> b!157313 m!190057))

(declare-fun m!190059 () Bool)

(assert (=> start!15792 m!190059))

(declare-fun m!190061 () Bool)

(assert (=> mapNonEmpty!5508 m!190061))

(check-sat b_and!9827 (not start!15792) (not b!157311) tp_is_empty!3241 (not b_next!3439) (not b!157313) (not mapNonEmpty!5508))
(check-sat b_and!9827 (not b_next!3439))
(get-model)

(declare-fun d!50909 () Bool)

(assert (=> d!50909 (= (array_inv!1681 (_keys!4948 thiss!1248)) (bvsge (size!2894 (_keys!4948 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157311 d!50909))

(declare-fun d!50911 () Bool)

(assert (=> d!50911 (= (array_inv!1682 (_values!3156 thiss!1248)) (bvsge (size!2895 (_values!3156 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157311 d!50911))

(declare-fun d!50913 () Bool)

(assert (=> d!50913 (= (validMask!0 (mask!7653 thiss!1248)) (and (or (= (mask!7653 thiss!1248) #b00000000000000000000000000000111) (= (mask!7653 thiss!1248) #b00000000000000000000000000001111) (= (mask!7653 thiss!1248) #b00000000000000000000000000011111) (= (mask!7653 thiss!1248) #b00000000000000000000000000111111) (= (mask!7653 thiss!1248) #b00000000000000000000000001111111) (= (mask!7653 thiss!1248) #b00000000000000000000000011111111) (= (mask!7653 thiss!1248) #b00000000000000000000000111111111) (= (mask!7653 thiss!1248) #b00000000000000000000001111111111) (= (mask!7653 thiss!1248) #b00000000000000000000011111111111) (= (mask!7653 thiss!1248) #b00000000000000000000111111111111) (= (mask!7653 thiss!1248) #b00000000000000000001111111111111) (= (mask!7653 thiss!1248) #b00000000000000000011111111111111) (= (mask!7653 thiss!1248) #b00000000000000000111111111111111) (= (mask!7653 thiss!1248) #b00000000000000001111111111111111) (= (mask!7653 thiss!1248) #b00000000000000011111111111111111) (= (mask!7653 thiss!1248) #b00000000000000111111111111111111) (= (mask!7653 thiss!1248) #b00000000000001111111111111111111) (= (mask!7653 thiss!1248) #b00000000000011111111111111111111) (= (mask!7653 thiss!1248) #b00000000000111111111111111111111) (= (mask!7653 thiss!1248) #b00000000001111111111111111111111) (= (mask!7653 thiss!1248) #b00000000011111111111111111111111) (= (mask!7653 thiss!1248) #b00000000111111111111111111111111) (= (mask!7653 thiss!1248) #b00000001111111111111111111111111) (= (mask!7653 thiss!1248) #b00000011111111111111111111111111) (= (mask!7653 thiss!1248) #b00000111111111111111111111111111) (= (mask!7653 thiss!1248) #b00001111111111111111111111111111) (= (mask!7653 thiss!1248) #b00011111111111111111111111111111) (= (mask!7653 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7653 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157313 d!50913))

(declare-fun d!50915 () Bool)

(declare-fun res!74343 () Bool)

(declare-fun e!103044 () Bool)

(assert (=> d!50915 (=> (not res!74343) (not e!103044))))

(declare-fun simpleValid!106 (LongMapFixedSize!1462) Bool)

(assert (=> d!50915 (= res!74343 (simpleValid!106 thiss!1248))))

(assert (=> d!50915 (= (valid!700 thiss!1248) e!103044)))

(declare-fun b!157363 () Bool)

(declare-fun res!74344 () Bool)

(assert (=> b!157363 (=> (not res!74344) (not e!103044))))

(declare-fun arrayCountValidKeys!0 (array!5517 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157363 (= res!74344 (= (arrayCountValidKeys!0 (_keys!4948 thiss!1248) #b00000000000000000000000000000000 (size!2894 (_keys!4948 thiss!1248))) (_size!780 thiss!1248)))))

(declare-fun b!157364 () Bool)

(declare-fun res!74345 () Bool)

(assert (=> b!157364 (=> (not res!74345) (not e!103044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5517 (_ BitVec 32)) Bool)

(assert (=> b!157364 (= res!74345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4948 thiss!1248) (mask!7653 thiss!1248)))))

(declare-fun b!157365 () Bool)

(declare-datatypes ((List!1880 0))(
  ( (Nil!1877) (Cons!1876 (h!2485 (_ BitVec 64)) (t!6673 List!1880)) )
))
(declare-fun arrayNoDuplicates!0 (array!5517 (_ BitVec 32) List!1880) Bool)

(assert (=> b!157365 (= e!103044 (arrayNoDuplicates!0 (_keys!4948 thiss!1248) #b00000000000000000000000000000000 Nil!1877))))

(assert (= (and d!50915 res!74343) b!157363))

(assert (= (and b!157363 res!74344) b!157364))

(assert (= (and b!157364 res!74345) b!157365))

(declare-fun m!190083 () Bool)

(assert (=> d!50915 m!190083))

(declare-fun m!190085 () Bool)

(assert (=> b!157363 m!190085))

(declare-fun m!190087 () Bool)

(assert (=> b!157364 m!190087))

(declare-fun m!190089 () Bool)

(assert (=> b!157365 m!190089))

(assert (=> start!15792 d!50915))

(declare-fun b!157373 () Bool)

(declare-fun e!103050 () Bool)

(assert (=> b!157373 (= e!103050 tp_is_empty!3241)))

(declare-fun mapNonEmpty!5517 () Bool)

(declare-fun mapRes!5517 () Bool)

(declare-fun tp!12861 () Bool)

(declare-fun e!103049 () Bool)

(assert (=> mapNonEmpty!5517 (= mapRes!5517 (and tp!12861 e!103049))))

(declare-fun mapValue!5517 () ValueCell!1277)

(declare-fun mapRest!5517 () (Array (_ BitVec 32) ValueCell!1277))

(declare-fun mapKey!5517 () (_ BitVec 32))

(assert (=> mapNonEmpty!5517 (= mapRest!5508 (store mapRest!5517 mapKey!5517 mapValue!5517))))

(declare-fun mapIsEmpty!5517 () Bool)

(assert (=> mapIsEmpty!5517 mapRes!5517))

(declare-fun b!157372 () Bool)

(assert (=> b!157372 (= e!103049 tp_is_empty!3241)))

(declare-fun condMapEmpty!5517 () Bool)

(declare-fun mapDefault!5517 () ValueCell!1277)

(assert (=> mapNonEmpty!5508 (= condMapEmpty!5517 (= mapRest!5508 ((as const (Array (_ BitVec 32) ValueCell!1277)) mapDefault!5517)))))

(assert (=> mapNonEmpty!5508 (= tp!12845 (and e!103050 mapRes!5517))))

(assert (= (and mapNonEmpty!5508 condMapEmpty!5517) mapIsEmpty!5517))

(assert (= (and mapNonEmpty!5508 (not condMapEmpty!5517)) mapNonEmpty!5517))

(assert (= (and mapNonEmpty!5517 ((_ is ValueCellFull!1277) mapValue!5517)) b!157372))

(assert (= (and mapNonEmpty!5508 ((_ is ValueCellFull!1277) mapDefault!5517)) b!157373))

(declare-fun m!190091 () Bool)

(assert (=> mapNonEmpty!5517 m!190091))

(check-sat b_and!9827 (not b!157363) (not b!157364) tp_is_empty!3241 (not b_next!3439) (not mapNonEmpty!5517) (not b!157365) (not d!50915))
(check-sat b_and!9827 (not b_next!3439))
