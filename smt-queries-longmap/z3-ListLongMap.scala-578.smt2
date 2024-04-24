; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15614 () Bool)

(assert start!15614)

(declare-fun b!155513 () Bool)

(declare-fun b_free!3277 () Bool)

(declare-fun b_next!3277 () Bool)

(assert (=> b!155513 (= b_free!3277 (not b_next!3277))))

(declare-fun tp!12355 () Bool)

(declare-fun b_and!9705 () Bool)

(assert (=> b!155513 (= tp!12355 b_and!9705)))

(declare-fun b!155510 () Bool)

(declare-fun e!101591 () Bool)

(declare-fun e!101595 () Bool)

(declare-fun mapRes!5261 () Bool)

(assert (=> b!155510 (= e!101591 (and e!101595 mapRes!5261))))

(declare-fun condMapEmpty!5261 () Bool)

(declare-datatypes ((V!3753 0))(
  ( (V!3754 (val!1584 Int)) )
))
(declare-datatypes ((ValueCell!1196 0))(
  ( (ValueCellFull!1196 (v!3450 V!3753)) (EmptyCell!1196) )
))
(declare-datatypes ((array!5197 0))(
  ( (array!5198 (arr!2456 (Array (_ BitVec 32) (_ BitVec 64))) (size!2734 (_ BitVec 32))) )
))
(declare-datatypes ((array!5199 0))(
  ( (array!5200 (arr!2457 (Array (_ BitVec 32) ValueCell!1196)) (size!2735 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1300 0))(
  ( (LongMapFixedSize!1301 (defaultEntry!3092 Int) (mask!7517 (_ BitVec 32)) (extraKeys!2833 (_ BitVec 32)) (zeroValue!2935 V!3753) (minValue!2935 V!3753) (_size!699 (_ BitVec 32)) (_keys!4867 array!5197) (_values!3075 array!5199) (_vacant!699 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1300)

(declare-fun mapDefault!5261 () ValueCell!1196)

(assert (=> b!155510 (= condMapEmpty!5261 (= (arr!2457 (_values!3075 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1196)) mapDefault!5261)))))

(declare-fun b!155511 () Bool)

(declare-fun res!73447 () Bool)

(declare-fun e!101590 () Bool)

(assert (=> b!155511 (=> (not res!73447) (not e!101590))))

(assert (=> b!155511 (= res!73447 (and (= (size!2735 (_values!3075 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7517 thiss!1248))) (= (size!2734 (_keys!4867 thiss!1248)) (size!2735 (_values!3075 thiss!1248))) (bvsge (mask!7517 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2833 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2833 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2833 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5261 () Bool)

(assert (=> mapIsEmpty!5261 mapRes!5261))

(declare-fun b!155512 () Bool)

(declare-fun res!73448 () Bool)

(assert (=> b!155512 (=> (not res!73448) (not e!101590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5197 (_ BitVec 32)) Bool)

(assert (=> b!155512 (= res!73448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4867 thiss!1248) (mask!7517 thiss!1248)))))

(declare-fun tp_is_empty!3079 () Bool)

(declare-fun e!101594 () Bool)

(declare-fun array_inv!1553 (array!5197) Bool)

(declare-fun array_inv!1554 (array!5199) Bool)

(assert (=> b!155513 (= e!101594 (and tp!12355 tp_is_empty!3079 (array_inv!1553 (_keys!4867 thiss!1248)) (array_inv!1554 (_values!3075 thiss!1248)) e!101591))))

(declare-fun b!155514 () Bool)

(assert (=> b!155514 (= e!101595 tp_is_empty!3079)))

(declare-fun b!155515 () Bool)

(assert (=> b!155515 (= e!101590 false)))

(declare-fun lt!81426 () Bool)

(declare-datatypes ((List!1808 0))(
  ( (Nil!1805) (Cons!1804 (h!2413 (_ BitVec 64)) (t!6602 List!1808)) )
))
(declare-fun arrayNoDuplicates!0 (array!5197 (_ BitVec 32) List!1808) Bool)

(assert (=> b!155515 (= lt!81426 (arrayNoDuplicates!0 (_keys!4867 thiss!1248) #b00000000000000000000000000000000 Nil!1805))))

(declare-fun b!155516 () Bool)

(declare-fun res!73446 () Bool)

(assert (=> b!155516 (=> (not res!73446) (not e!101590))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155516 (= res!73446 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155517 () Bool)

(declare-fun e!101592 () Bool)

(assert (=> b!155517 (= e!101592 tp_is_empty!3079)))

(declare-fun b!155518 () Bool)

(declare-fun res!73449 () Bool)

(assert (=> b!155518 (=> (not res!73449) (not e!101590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155518 (= res!73449 (validMask!0 (mask!7517 thiss!1248)))))

(declare-fun mapNonEmpty!5261 () Bool)

(declare-fun tp!12356 () Bool)

(assert (=> mapNonEmpty!5261 (= mapRes!5261 (and tp!12356 e!101592))))

(declare-fun mapRest!5261 () (Array (_ BitVec 32) ValueCell!1196))

(declare-fun mapKey!5261 () (_ BitVec 32))

(declare-fun mapValue!5261 () ValueCell!1196)

(assert (=> mapNonEmpty!5261 (= (arr!2457 (_values!3075 thiss!1248)) (store mapRest!5261 mapKey!5261 mapValue!5261))))

(declare-fun res!73450 () Bool)

(assert (=> start!15614 (=> (not res!73450) (not e!101590))))

(declare-fun valid!652 (LongMapFixedSize!1300) Bool)

(assert (=> start!15614 (= res!73450 (valid!652 thiss!1248))))

(assert (=> start!15614 e!101590))

(assert (=> start!15614 e!101594))

(assert (=> start!15614 true))

(assert (= (and start!15614 res!73450) b!155516))

(assert (= (and b!155516 res!73446) b!155518))

(assert (= (and b!155518 res!73449) b!155511))

(assert (= (and b!155511 res!73447) b!155512))

(assert (= (and b!155512 res!73448) b!155515))

(assert (= (and b!155510 condMapEmpty!5261) mapIsEmpty!5261))

(assert (= (and b!155510 (not condMapEmpty!5261)) mapNonEmpty!5261))

(get-info :version)

(assert (= (and mapNonEmpty!5261 ((_ is ValueCellFull!1196) mapValue!5261)) b!155517))

(assert (= (and b!155510 ((_ is ValueCellFull!1196) mapDefault!5261)) b!155514))

(assert (= b!155513 b!155510))

(assert (= start!15614 b!155513))

(declare-fun m!189533 () Bool)

(assert (=> b!155518 m!189533))

(declare-fun m!189535 () Bool)

(assert (=> mapNonEmpty!5261 m!189535))

(declare-fun m!189537 () Bool)

(assert (=> b!155513 m!189537))

(declare-fun m!189539 () Bool)

(assert (=> b!155513 m!189539))

(declare-fun m!189541 () Bool)

(assert (=> b!155515 m!189541))

(declare-fun m!189543 () Bool)

(assert (=> b!155512 m!189543))

(declare-fun m!189545 () Bool)

(assert (=> start!15614 m!189545))

(check-sat (not mapNonEmpty!5261) b_and!9705 (not b!155515) (not b!155512) (not b!155513) (not b_next!3277) (not start!15614) tp_is_empty!3079 (not b!155518))
(check-sat b_and!9705 (not b_next!3277))
