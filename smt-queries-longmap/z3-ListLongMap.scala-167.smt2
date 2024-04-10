; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3204 () Bool)

(assert start!3204)

(declare-fun b!19501 () Bool)

(declare-fun b_free!681 () Bool)

(declare-fun b_next!681 () Bool)

(assert (=> b!19501 (= b_free!681 (not b_next!681))))

(declare-fun tp!3255 () Bool)

(declare-fun b_and!1341 () Bool)

(assert (=> b!19501 (= tp!3255 b_and!1341)))

(declare-fun res!13213 () Bool)

(declare-fun e!12604 () Bool)

(assert (=> start!3204 (=> (not res!13213) (not e!12604))))

(declare-datatypes ((V!1085 0))(
  ( (V!1086 (val!499 Int)) )
))
(declare-datatypes ((ValueCell!273 0))(
  ( (ValueCellFull!273 (v!1514 V!1085)) (EmptyCell!273) )
))
(declare-datatypes ((array!1105 0))(
  ( (array!1106 (arr!529 (Array (_ BitVec 32) ValueCell!273)) (size!622 (_ BitVec 32))) )
))
(declare-datatypes ((array!1107 0))(
  ( (array!1108 (arr!530 (Array (_ BitVec 32) (_ BitVec 64))) (size!623 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!132 0))(
  ( (LongMapFixedSize!133 (defaultEntry!1685 Int) (mask!4636 (_ BitVec 32)) (extraKeys!1595 (_ BitVec 32)) (zeroValue!1619 V!1085) (minValue!1619 V!1085) (_size!99 (_ BitVec 32)) (_keys!3113 array!1107) (_values!1681 array!1105) (_vacant!99 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!132 0))(
  ( (Cell!133 (v!1515 LongMapFixedSize!132)) )
))
(declare-datatypes ((LongMap!132 0))(
  ( (LongMap!133 (underlying!77 Cell!132)) )
))
(declare-fun thiss!938 () LongMap!132)

(declare-fun valid!61 (LongMap!132) Bool)

(assert (=> start!3204 (= res!13213 (valid!61 thiss!938))))

(assert (=> start!3204 e!12604))

(declare-fun e!12610 () Bool)

(assert (=> start!3204 e!12610))

(declare-fun b!19500 () Bool)

(declare-fun e!12607 () Bool)

(assert (=> b!19500 (= e!12610 e!12607)))

(declare-fun e!12608 () Bool)

(declare-fun tp_is_empty!945 () Bool)

(declare-fun e!12605 () Bool)

(declare-fun array_inv!359 (array!1107) Bool)

(declare-fun array_inv!360 (array!1105) Bool)

(assert (=> b!19501 (= e!12608 (and tp!3255 tp_is_empty!945 (array_inv!359 (_keys!3113 (v!1515 (underlying!77 thiss!938)))) (array_inv!360 (_values!1681 (v!1515 (underlying!77 thiss!938)))) e!12605))))

(declare-fun b!19502 () Bool)

(declare-fun e!12611 () Bool)

(assert (=> b!19502 (= e!12611 tp_is_empty!945)))

(declare-fun b!19503 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(declare-fun computeNewMask!5 (LongMap!132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19503 (= e!12604 (not (validMask!0 (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))))))))

(declare-fun b!19504 () Bool)

(declare-fun e!12606 () Bool)

(declare-fun mapRes!874 () Bool)

(assert (=> b!19504 (= e!12605 (and e!12606 mapRes!874))))

(declare-fun condMapEmpty!874 () Bool)

(declare-fun mapDefault!874 () ValueCell!273)

(assert (=> b!19504 (= condMapEmpty!874 (= (arr!529 (_values!1681 (v!1515 (underlying!77 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!273)) mapDefault!874)))))

(declare-fun mapNonEmpty!874 () Bool)

(declare-fun tp!3256 () Bool)

(assert (=> mapNonEmpty!874 (= mapRes!874 (and tp!3256 e!12611))))

(declare-fun mapKey!874 () (_ BitVec 32))

(declare-fun mapRest!874 () (Array (_ BitVec 32) ValueCell!273))

(declare-fun mapValue!874 () ValueCell!273)

(assert (=> mapNonEmpty!874 (= (arr!529 (_values!1681 (v!1515 (underlying!77 thiss!938)))) (store mapRest!874 mapKey!874 mapValue!874))))

(declare-fun b!19505 () Bool)

(assert (=> b!19505 (= e!12606 tp_is_empty!945)))

(declare-fun mapIsEmpty!874 () Bool)

(assert (=> mapIsEmpty!874 mapRes!874))

(declare-fun b!19506 () Bool)

(assert (=> b!19506 (= e!12607 e!12608)))

(assert (= (and start!3204 res!13213) b!19503))

(assert (= (and b!19504 condMapEmpty!874) mapIsEmpty!874))

(assert (= (and b!19504 (not condMapEmpty!874)) mapNonEmpty!874))

(get-info :version)

(assert (= (and mapNonEmpty!874 ((_ is ValueCellFull!273) mapValue!874)) b!19502))

(assert (= (and b!19504 ((_ is ValueCellFull!273) mapDefault!874)) b!19505))

(assert (= b!19501 b!19504))

(assert (= b!19506 b!19501))

(assert (= b!19500 b!19506))

(assert (= start!3204 b!19500))

(declare-fun m!13719 () Bool)

(assert (=> start!3204 m!13719))

(declare-fun m!13721 () Bool)

(assert (=> b!19501 m!13721))

(declare-fun m!13723 () Bool)

(assert (=> b!19501 m!13723))

(declare-fun m!13725 () Bool)

(assert (=> b!19503 m!13725))

(assert (=> b!19503 m!13725))

(declare-fun m!13727 () Bool)

(assert (=> b!19503 m!13727))

(declare-fun m!13729 () Bool)

(assert (=> mapNonEmpty!874 m!13729))

(check-sat (not mapNonEmpty!874) (not b!19501) (not b!19503) b_and!1341 (not b_next!681) tp_is_empty!945 (not start!3204))
(check-sat b_and!1341 (not b_next!681))
(get-model)

(declare-fun d!3607 () Bool)

(assert (=> d!3607 (= (array_inv!359 (_keys!3113 (v!1515 (underlying!77 thiss!938)))) (bvsge (size!623 (_keys!3113 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19501 d!3607))

(declare-fun d!3609 () Bool)

(assert (=> d!3609 (= (array_inv!360 (_values!1681 (v!1515 (underlying!77 thiss!938)))) (bvsge (size!622 (_values!1681 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19501 d!3609))

(declare-fun d!3611 () Bool)

(assert (=> d!3611 (= (validMask!0 (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938))))) (and (or (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000000000111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000000001111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000000011111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000000111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000001111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000011111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000000111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000001111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000011111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000000111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000001111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000011111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000000111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000001111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000011111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000000111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000001111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000011111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000000111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000001111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000011111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000000111111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000001111111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000011111111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00000111111111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00001111111111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00011111111111111111111111111111) (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00111111111111111111111111111111)) (bvsle (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) #b00111111111111111111111111111111)))))

(assert (=> b!19503 d!3611))

(declare-fun d!3613 () Bool)

(declare-fun e!12640 () Bool)

(assert (=> d!3613 e!12640))

(declare-fun res!13219 () Bool)

(assert (=> d!3613 (=> (not res!13219) (not e!12640))))

(declare-fun lt!5430 () (_ BitVec 32))

(assert (=> d!3613 (= res!13219 (validMask!0 lt!5430))))

(declare-datatypes ((Unit!384 0))(
  ( (Unit!385) )
))
(declare-datatypes ((tuple2!818 0))(
  ( (tuple2!819 (_1!412 Unit!384) (_2!412 (_ BitVec 32))) )
))
(declare-fun e!12641 () tuple2!818)

(assert (=> d!3613 (= lt!5430 (_2!412 e!12641))))

(declare-fun c!2082 () Bool)

(declare-fun lt!5429 () tuple2!818)

(assert (=> d!3613 (= c!2082 (and (bvsgt (_2!412 lt!5429) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!99 (v!1515 (underlying!77 thiss!938)))) (_2!412 lt!5429)) (bvsge (bvadd (bvand (bvashr (_2!412 lt!5429) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!99 (v!1515 (underlying!77 thiss!938))))))))

(declare-fun Unit!386 () Unit!384)

(declare-fun Unit!387 () Unit!384)

(assert (=> d!3613 (= lt!5429 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!99 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))))) (mask!4636 (v!1515 (underlying!77 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!99 (v!1515 (underlying!77 thiss!938)))) (mask!4636 (v!1515 (underlying!77 thiss!938))))) (tuple2!819 Unit!386 (bvand (bvadd (bvshl (mask!4636 (v!1515 (underlying!77 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!819 Unit!387 (mask!4636 (v!1515 (underlying!77 thiss!938))))))))

(assert (=> d!3613 (validMask!0 (mask!4636 (v!1515 (underlying!77 thiss!938))))))

(assert (=> d!3613 (= (computeNewMask!5 thiss!938 (mask!4636 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (_size!99 (v!1515 (underlying!77 thiss!938)))) lt!5430)))

(declare-fun b!19534 () Bool)

(declare-fun computeNewMaskWhile!3 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!818)

(assert (=> b!19534 (= e!12641 (computeNewMaskWhile!3 (_size!99 (v!1515 (underlying!77 thiss!938))) (_vacant!99 (v!1515 (underlying!77 thiss!938))) (mask!4636 (v!1515 (underlying!77 thiss!938))) (_2!412 lt!5429)))))

(declare-fun b!19535 () Bool)

(declare-fun Unit!388 () Unit!384)

(assert (=> b!19535 (= e!12641 (tuple2!819 Unit!388 (_2!412 lt!5429)))))

(declare-fun b!19536 () Bool)

(assert (=> b!19536 (= e!12640 (bvsle (_size!99 (v!1515 (underlying!77 thiss!938))) (bvadd lt!5430 #b00000000000000000000000000000001)))))

(assert (= (and d!3613 c!2082) b!19534))

(assert (= (and d!3613 (not c!2082)) b!19535))

(assert (= (and d!3613 res!13219) b!19536))

(declare-fun m!13743 () Bool)

(assert (=> d!3613 m!13743))

(declare-fun m!13745 () Bool)

(assert (=> d!3613 m!13745))

(declare-fun m!13747 () Bool)

(assert (=> b!19534 m!13747))

(assert (=> b!19503 d!3613))

(declare-fun d!3615 () Bool)

(declare-fun valid!63 (LongMapFixedSize!132) Bool)

(assert (=> d!3615 (= (valid!61 thiss!938) (valid!63 (v!1515 (underlying!77 thiss!938))))))

(declare-fun bs!874 () Bool)

(assert (= bs!874 d!3615))

(declare-fun m!13749 () Bool)

(assert (=> bs!874 m!13749))

(assert (=> start!3204 d!3615))

(declare-fun mapIsEmpty!880 () Bool)

(declare-fun mapRes!880 () Bool)

(assert (=> mapIsEmpty!880 mapRes!880))

(declare-fun b!19544 () Bool)

(declare-fun e!12647 () Bool)

(assert (=> b!19544 (= e!12647 tp_is_empty!945)))

(declare-fun b!19543 () Bool)

(declare-fun e!12646 () Bool)

(assert (=> b!19543 (= e!12646 tp_is_empty!945)))

(declare-fun condMapEmpty!880 () Bool)

(declare-fun mapDefault!880 () ValueCell!273)

(assert (=> mapNonEmpty!874 (= condMapEmpty!880 (= mapRest!874 ((as const (Array (_ BitVec 32) ValueCell!273)) mapDefault!880)))))

(assert (=> mapNonEmpty!874 (= tp!3256 (and e!12647 mapRes!880))))

(declare-fun mapNonEmpty!880 () Bool)

(declare-fun tp!3265 () Bool)

(assert (=> mapNonEmpty!880 (= mapRes!880 (and tp!3265 e!12646))))

(declare-fun mapRest!880 () (Array (_ BitVec 32) ValueCell!273))

(declare-fun mapValue!880 () ValueCell!273)

(declare-fun mapKey!880 () (_ BitVec 32))

(assert (=> mapNonEmpty!880 (= mapRest!874 (store mapRest!880 mapKey!880 mapValue!880))))

(assert (= (and mapNonEmpty!874 condMapEmpty!880) mapIsEmpty!880))

(assert (= (and mapNonEmpty!874 (not condMapEmpty!880)) mapNonEmpty!880))

(assert (= (and mapNonEmpty!880 ((_ is ValueCellFull!273) mapValue!880)) b!19543))

(assert (= (and mapNonEmpty!874 ((_ is ValueCellFull!273) mapDefault!880)) b!19544))

(declare-fun m!13751 () Bool)

(assert (=> mapNonEmpty!880 m!13751))

(check-sat (not mapNonEmpty!880) (not d!3615) (not b!19534) b_and!1341 (not b_next!681) (not d!3613) tp_is_empty!945)
(check-sat b_and!1341 (not b_next!681))
