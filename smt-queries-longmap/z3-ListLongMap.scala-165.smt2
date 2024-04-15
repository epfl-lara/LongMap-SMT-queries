; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3144 () Bool)

(assert start!3144)

(declare-fun b!19135 () Bool)

(declare-fun b_free!667 () Bool)

(declare-fun b_next!667 () Bool)

(assert (=> b!19135 (= b_free!667 (not b_next!667))))

(declare-fun tp!3203 () Bool)

(declare-fun b_and!1321 () Bool)

(assert (=> b!19135 (= tp!3203 b_and!1321)))

(declare-fun b!19133 () Bool)

(declare-fun e!12311 () Bool)

(declare-fun e!12304 () Bool)

(assert (=> b!19133 (= e!12311 e!12304)))

(declare-fun b!19134 () Bool)

(declare-fun e!12309 () Bool)

(assert (=> b!19134 (= e!12304 e!12309)))

(declare-fun tp_is_empty!931 () Bool)

(declare-fun e!12305 () Bool)

(declare-datatypes ((V!1067 0))(
  ( (V!1068 (val!492 Int)) )
))
(declare-datatypes ((ValueCell!266 0))(
  ( (ValueCellFull!266 (v!1499 V!1067)) (EmptyCell!266) )
))
(declare-datatypes ((array!1055 0))(
  ( (array!1056 (arr!506 (Array (_ BitVec 32) ValueCell!266)) (size!597 (_ BitVec 32))) )
))
(declare-datatypes ((array!1057 0))(
  ( (array!1058 (arr!507 (Array (_ BitVec 32) (_ BitVec 64))) (size!598 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!118 0))(
  ( (LongMapFixedSize!119 (defaultEntry!1678 Int) (mask!4621 (_ BitVec 32)) (extraKeys!1588 (_ BitVec 32)) (zeroValue!1612 V!1067) (minValue!1612 V!1067) (_size!92 (_ BitVec 32)) (_keys!3104 array!1057) (_values!1674 array!1055) (_vacant!92 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!118 0))(
  ( (Cell!119 (v!1500 LongMapFixedSize!118)) )
))
(declare-datatypes ((LongMap!118 0))(
  ( (LongMap!119 (underlying!70 Cell!118)) )
))
(declare-fun thiss!938 () LongMap!118)

(declare-fun array_inv!359 (array!1057) Bool)

(declare-fun array_inv!360 (array!1055) Bool)

(assert (=> b!19135 (= e!12309 (and tp!3203 tp_is_empty!931 (array_inv!359 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) (array_inv!360 (_values!1674 (v!1500 (underlying!70 thiss!938)))) e!12305))))

(declare-fun mapIsEmpty!843 () Bool)

(declare-fun mapRes!843 () Bool)

(assert (=> mapIsEmpty!843 mapRes!843))

(declare-fun b!19136 () Bool)

(declare-fun e!12307 () Bool)

(assert (=> b!19136 (= e!12307 tp_is_empty!931)))

(declare-fun res!13073 () Bool)

(declare-fun e!12310 () Bool)

(assert (=> start!3144 (=> (not res!13073) (not e!12310))))

(declare-fun valid!65 (LongMap!118) Bool)

(assert (=> start!3144 (= res!13073 (valid!65 thiss!938))))

(assert (=> start!3144 e!12310))

(assert (=> start!3144 e!12311))

(declare-fun b!19137 () Bool)

(declare-fun res!13072 () Bool)

(assert (=> b!19137 (=> (not res!13072) (not e!12310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19137 (= res!13072 (validMask!0 (mask!4621 (v!1500 (underlying!70 thiss!938)))))))

(declare-fun b!19138 () Bool)

(declare-fun e!12306 () Bool)

(assert (=> b!19138 (= e!12306 tp_is_empty!931)))

(declare-fun b!19139 () Bool)

(assert (=> b!19139 (= e!12310 (or (bvslt (_size!92 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000000) (bvsgt (_size!92 (v!1500 (underlying!70 thiss!938))) (bvadd #b00000000000000000000000000000001 (mask!4621 (v!1500 (underlying!70 thiss!938)))))))))

(declare-fun mapNonEmpty!843 () Bool)

(declare-fun tp!3204 () Bool)

(assert (=> mapNonEmpty!843 (= mapRes!843 (and tp!3204 e!12306))))

(declare-fun mapValue!843 () ValueCell!266)

(declare-fun mapRest!843 () (Array (_ BitVec 32) ValueCell!266))

(declare-fun mapKey!843 () (_ BitVec 32))

(assert (=> mapNonEmpty!843 (= (arr!506 (_values!1674 (v!1500 (underlying!70 thiss!938)))) (store mapRest!843 mapKey!843 mapValue!843))))

(declare-fun b!19140 () Bool)

(assert (=> b!19140 (= e!12305 (and e!12307 mapRes!843))))

(declare-fun condMapEmpty!843 () Bool)

(declare-fun mapDefault!843 () ValueCell!266)

(assert (=> b!19140 (= condMapEmpty!843 (= (arr!506 (_values!1674 (v!1500 (underlying!70 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!266)) mapDefault!843)))))

(assert (= (and start!3144 res!13073) b!19137))

(assert (= (and b!19137 res!13072) b!19139))

(assert (= (and b!19140 condMapEmpty!843) mapIsEmpty!843))

(assert (= (and b!19140 (not condMapEmpty!843)) mapNonEmpty!843))

(get-info :version)

(assert (= (and mapNonEmpty!843 ((_ is ValueCellFull!266) mapValue!843)) b!19138))

(assert (= (and b!19140 ((_ is ValueCellFull!266) mapDefault!843)) b!19136))

(assert (= b!19135 b!19140))

(assert (= b!19134 b!19135))

(assert (= b!19133 b!19134))

(assert (= start!3144 b!19133))

(declare-fun m!13513 () Bool)

(assert (=> b!19135 m!13513))

(declare-fun m!13515 () Bool)

(assert (=> b!19135 m!13515))

(declare-fun m!13517 () Bool)

(assert (=> start!3144 m!13517))

(declare-fun m!13519 () Bool)

(assert (=> b!19137 m!13519))

(declare-fun m!13521 () Bool)

(assert (=> mapNonEmpty!843 m!13521))

(check-sat (not b!19137) b_and!1321 (not b!19135) (not mapNonEmpty!843) (not b_next!667) tp_is_empty!931 (not start!3144))
(check-sat b_and!1321 (not b_next!667))
(get-model)

(declare-fun d!3529 () Bool)

(assert (=> d!3529 (= (array_inv!359 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) (bvsge (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19135 d!3529))

(declare-fun d!3531 () Bool)

(assert (=> d!3531 (= (array_inv!360 (_values!1674 (v!1500 (underlying!70 thiss!938)))) (bvsge (size!597 (_values!1674 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19135 d!3531))

(declare-fun d!3533 () Bool)

(declare-fun valid!66 (LongMapFixedSize!118) Bool)

(assert (=> d!3533 (= (valid!65 thiss!938) (valid!66 (v!1500 (underlying!70 thiss!938))))))

(declare-fun bs!864 () Bool)

(assert (= bs!864 d!3533))

(declare-fun m!13543 () Bool)

(assert (=> bs!864 m!13543))

(assert (=> start!3144 d!3533))

(declare-fun d!3535 () Bool)

(assert (=> d!3535 (= (validMask!0 (mask!4621 (v!1500 (underlying!70 thiss!938)))) (and (or (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000001111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000011111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000001111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000011111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000001111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000011111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000001111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000011111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000001111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000011111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000001111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000011111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000001111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000011111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000111111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000001111111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000011111111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000111111111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00001111111111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00011111111111111111111111111111) (= (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19137 d!3535))

(declare-fun b!19195 () Bool)

(declare-fun e!12364 () Bool)

(assert (=> b!19195 (= e!12364 tp_is_empty!931)))

(declare-fun b!19196 () Bool)

(declare-fun e!12365 () Bool)

(assert (=> b!19196 (= e!12365 tp_is_empty!931)))

(declare-fun condMapEmpty!852 () Bool)

(declare-fun mapDefault!852 () ValueCell!266)

(assert (=> mapNonEmpty!843 (= condMapEmpty!852 (= mapRest!843 ((as const (Array (_ BitVec 32) ValueCell!266)) mapDefault!852)))))

(declare-fun mapRes!852 () Bool)

(assert (=> mapNonEmpty!843 (= tp!3204 (and e!12365 mapRes!852))))

(declare-fun mapNonEmpty!852 () Bool)

(declare-fun tp!3219 () Bool)

(assert (=> mapNonEmpty!852 (= mapRes!852 (and tp!3219 e!12364))))

(declare-fun mapRest!852 () (Array (_ BitVec 32) ValueCell!266))

(declare-fun mapValue!852 () ValueCell!266)

(declare-fun mapKey!852 () (_ BitVec 32))

(assert (=> mapNonEmpty!852 (= mapRest!843 (store mapRest!852 mapKey!852 mapValue!852))))

(declare-fun mapIsEmpty!852 () Bool)

(assert (=> mapIsEmpty!852 mapRes!852))

(assert (= (and mapNonEmpty!843 condMapEmpty!852) mapIsEmpty!852))

(assert (= (and mapNonEmpty!843 (not condMapEmpty!852)) mapNonEmpty!852))

(assert (= (and mapNonEmpty!852 ((_ is ValueCellFull!266) mapValue!852)) b!19195))

(assert (= (and mapNonEmpty!843 ((_ is ValueCellFull!266) mapDefault!852)) b!19196))

(declare-fun m!13545 () Bool)

(assert (=> mapNonEmpty!852 m!13545))

(check-sat b_and!1321 tp_is_empty!931 (not d!3533) (not b_next!667) (not mapNonEmpty!852))
(check-sat b_and!1321 (not b_next!667))
(get-model)

(declare-fun d!3537 () Bool)

(declare-fun res!13092 () Bool)

(declare-fun e!12368 () Bool)

(assert (=> d!3537 (=> (not res!13092) (not e!12368))))

(declare-fun simpleValid!11 (LongMapFixedSize!118) Bool)

(assert (=> d!3537 (= res!13092 (simpleValid!11 (v!1500 (underlying!70 thiss!938))))))

(assert (=> d!3537 (= (valid!66 (v!1500 (underlying!70 thiss!938))) e!12368)))

(declare-fun b!19203 () Bool)

(declare-fun res!13093 () Bool)

(assert (=> b!19203 (=> (not res!13093) (not e!12368))))

(declare-fun arrayCountValidKeys!0 (array!1057 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19203 (= res!13093 (= (arrayCountValidKeys!0 (_keys!3104 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938))))) (_size!92 (v!1500 (underlying!70 thiss!938)))))))

(declare-fun b!19204 () Bool)

(declare-fun res!13094 () Bool)

(assert (=> b!19204 (=> (not res!13094) (not e!12368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1057 (_ BitVec 32)) Bool)

(assert (=> b!19204 (= res!13094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3104 (v!1500 (underlying!70 thiss!938))) (mask!4621 (v!1500 (underlying!70 thiss!938)))))))

(declare-fun b!19205 () Bool)

(declare-datatypes ((List!541 0))(
  ( (Nil!538) (Cons!537 (h!1103 (_ BitVec 64)) (t!3177 List!541)) )
))
(declare-fun arrayNoDuplicates!0 (array!1057 (_ BitVec 32) List!541) Bool)

(assert (=> b!19205 (= e!12368 (arrayNoDuplicates!0 (_keys!3104 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000000 Nil!538))))

(assert (= (and d!3537 res!13092) b!19203))

(assert (= (and b!19203 res!13093) b!19204))

(assert (= (and b!19204 res!13094) b!19205))

(declare-fun m!13547 () Bool)

(assert (=> d!3537 m!13547))

(declare-fun m!13549 () Bool)

(assert (=> b!19203 m!13549))

(declare-fun m!13551 () Bool)

(assert (=> b!19204 m!13551))

(declare-fun m!13553 () Bool)

(assert (=> b!19205 m!13553))

(assert (=> d!3533 d!3537))

(declare-fun b!19206 () Bool)

(declare-fun e!12369 () Bool)

(assert (=> b!19206 (= e!12369 tp_is_empty!931)))

(declare-fun b!19207 () Bool)

(declare-fun e!12370 () Bool)

(assert (=> b!19207 (= e!12370 tp_is_empty!931)))

(declare-fun condMapEmpty!853 () Bool)

(declare-fun mapDefault!853 () ValueCell!266)

(assert (=> mapNonEmpty!852 (= condMapEmpty!853 (= mapRest!852 ((as const (Array (_ BitVec 32) ValueCell!266)) mapDefault!853)))))

(declare-fun mapRes!853 () Bool)

(assert (=> mapNonEmpty!852 (= tp!3219 (and e!12370 mapRes!853))))

(declare-fun mapNonEmpty!853 () Bool)

(declare-fun tp!3220 () Bool)

(assert (=> mapNonEmpty!853 (= mapRes!853 (and tp!3220 e!12369))))

(declare-fun mapKey!853 () (_ BitVec 32))

(declare-fun mapRest!853 () (Array (_ BitVec 32) ValueCell!266))

(declare-fun mapValue!853 () ValueCell!266)

(assert (=> mapNonEmpty!853 (= mapRest!852 (store mapRest!853 mapKey!853 mapValue!853))))

(declare-fun mapIsEmpty!853 () Bool)

(assert (=> mapIsEmpty!853 mapRes!853))

(assert (= (and mapNonEmpty!852 condMapEmpty!853) mapIsEmpty!853))

(assert (= (and mapNonEmpty!852 (not condMapEmpty!853)) mapNonEmpty!853))

(assert (= (and mapNonEmpty!853 ((_ is ValueCellFull!266) mapValue!853)) b!19206))

(assert (= (and mapNonEmpty!852 ((_ is ValueCellFull!266) mapDefault!853)) b!19207))

(declare-fun m!13555 () Bool)

(assert (=> mapNonEmpty!853 m!13555))

(check-sat b_and!1321 (not b!19203) tp_is_empty!931 (not b!19204) (not mapNonEmpty!853) (not b_next!667) (not d!3537) (not b!19205))
(check-sat b_and!1321 (not b_next!667))
(get-model)

(declare-fun bm!886 () Bool)

(declare-fun call!889 () (_ BitVec 32))

(assert (=> bm!886 (= call!889 (arrayCountValidKeys!0 (_keys!3104 (v!1500 (underlying!70 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938))))))))

(declare-fun b!19216 () Bool)

(declare-fun e!12375 () (_ BitVec 32))

(declare-fun e!12376 () (_ BitVec 32))

(assert (=> b!19216 (= e!12375 e!12376)))

(declare-fun c!2047 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19216 (= c!2047 (validKeyInArray!0 (select (arr!507 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19217 () Bool)

(assert (=> b!19217 (= e!12376 (bvadd #b00000000000000000000000000000001 call!889))))

(declare-fun d!3539 () Bool)

(declare-fun lt!5399 () (_ BitVec 32))

(assert (=> d!3539 (and (bvsge lt!5399 #b00000000000000000000000000000000) (bvsle lt!5399 (bvsub (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (=> d!3539 (= lt!5399 e!12375)))

(declare-fun c!2046 () Bool)

(assert (=> d!3539 (= c!2046 (bvsge #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938))))))))

(assert (=> d!3539 (and (bvsle #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938))))))))

(assert (=> d!3539 (= (arrayCountValidKeys!0 (_keys!3104 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938))))) lt!5399)))

(declare-fun b!19218 () Bool)

(assert (=> b!19218 (= e!12375 #b00000000000000000000000000000000)))

(declare-fun b!19219 () Bool)

(assert (=> b!19219 (= e!12376 call!889)))

(assert (= (and d!3539 c!2046) b!19218))

(assert (= (and d!3539 (not c!2046)) b!19216))

(assert (= (and b!19216 c!2047) b!19217))

(assert (= (and b!19216 (not c!2047)) b!19219))

(assert (= (or b!19217 b!19219) bm!886))

(declare-fun m!13557 () Bool)

(assert (=> bm!886 m!13557))

(declare-fun m!13559 () Bool)

(assert (=> b!19216 m!13559))

(assert (=> b!19216 m!13559))

(declare-fun m!13561 () Bool)

(assert (=> b!19216 m!13561))

(assert (=> b!19203 d!3539))

(declare-fun d!3541 () Bool)

(declare-fun res!13103 () Bool)

(declare-fun e!12379 () Bool)

(assert (=> d!3541 (=> (not res!13103) (not e!12379))))

(assert (=> d!3541 (= res!13103 (validMask!0 (mask!4621 (v!1500 (underlying!70 thiss!938)))))))

(assert (=> d!3541 (= (simpleValid!11 (v!1500 (underlying!70 thiss!938))) e!12379)))

(declare-fun b!19230 () Bool)

(declare-fun res!13106 () Bool)

(assert (=> b!19230 (=> (not res!13106) (not e!12379))))

(declare-fun size!603 (LongMapFixedSize!118) (_ BitVec 32))

(assert (=> b!19230 (= res!13106 (= (size!603 (v!1500 (underlying!70 thiss!938))) (bvadd (_size!92 (v!1500 (underlying!70 thiss!938))) (bvsdiv (bvadd (extraKeys!1588 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!19229 () Bool)

(declare-fun res!13104 () Bool)

(assert (=> b!19229 (=> (not res!13104) (not e!12379))))

(assert (=> b!19229 (= res!13104 (bvsge (size!603 (v!1500 (underlying!70 thiss!938))) (_size!92 (v!1500 (underlying!70 thiss!938)))))))

(declare-fun b!19228 () Bool)

(declare-fun res!13105 () Bool)

(assert (=> b!19228 (=> (not res!13105) (not e!12379))))

(assert (=> b!19228 (= res!13105 (and (= (size!597 (_values!1674 (v!1500 (underlying!70 thiss!938)))) (bvadd (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000001)) (= (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) (size!597 (_values!1674 (v!1500 (underlying!70 thiss!938))))) (bvsge (_size!92 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!92 (v!1500 (underlying!70 thiss!938))) (bvadd (mask!4621 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun b!19231 () Bool)

(assert (=> b!19231 (= e!12379 (and (bvsge (extraKeys!1588 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1588 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!92 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000000)))))

(assert (= (and d!3541 res!13103) b!19228))

(assert (= (and b!19228 res!13105) b!19229))

(assert (= (and b!19229 res!13104) b!19230))

(assert (= (and b!19230 res!13106) b!19231))

(assert (=> d!3541 m!13519))

(declare-fun m!13563 () Bool)

(assert (=> b!19230 m!13563))

(assert (=> b!19229 m!13563))

(assert (=> d!3537 d!3541))

(declare-fun bm!889 () Bool)

(declare-fun call!892 () Bool)

(assert (=> bm!889 (= call!892 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3104 (v!1500 (underlying!70 thiss!938))) (mask!4621 (v!1500 (underlying!70 thiss!938)))))))

(declare-fun d!3543 () Bool)

(declare-fun res!13112 () Bool)

(declare-fun e!12387 () Bool)

(assert (=> d!3543 (=> res!13112 e!12387)))

(assert (=> d!3543 (= res!13112 (bvsge #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938))))))))

(assert (=> d!3543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3104 (v!1500 (underlying!70 thiss!938))) (mask!4621 (v!1500 (underlying!70 thiss!938)))) e!12387)))

(declare-fun b!19240 () Bool)

(declare-fun e!12386 () Bool)

(assert (=> b!19240 (= e!12386 call!892)))

(declare-fun b!19241 () Bool)

(declare-fun e!12388 () Bool)

(assert (=> b!19241 (= e!12386 e!12388)))

(declare-fun lt!5406 () (_ BitVec 64))

(assert (=> b!19241 (= lt!5406 (select (arr!507 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!387 0))(
  ( (Unit!388) )
))
(declare-fun lt!5407 () Unit!387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1057 (_ BitVec 64) (_ BitVec 32)) Unit!387)

(assert (=> b!19241 (= lt!5407 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3104 (v!1500 (underlying!70 thiss!938))) lt!5406 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19241 (arrayContainsKey!0 (_keys!3104 (v!1500 (underlying!70 thiss!938))) lt!5406 #b00000000000000000000000000000000)))

(declare-fun lt!5408 () Unit!387)

(assert (=> b!19241 (= lt!5408 lt!5407)))

(declare-fun res!13111 () Bool)

(declare-datatypes ((SeekEntryResult!46 0))(
  ( (MissingZero!46 (index!2304 (_ BitVec 32))) (Found!46 (index!2305 (_ BitVec 32))) (Intermediate!46 (undefined!858 Bool) (index!2306 (_ BitVec 32)) (x!4729 (_ BitVec 32))) (Undefined!46) (MissingVacant!46 (index!2307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1057 (_ BitVec 32)) SeekEntryResult!46)

(assert (=> b!19241 (= res!13111 (= (seekEntryOrOpen!0 (select (arr!507 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000) (_keys!3104 (v!1500 (underlying!70 thiss!938))) (mask!4621 (v!1500 (underlying!70 thiss!938)))) (Found!46 #b00000000000000000000000000000000)))))

(assert (=> b!19241 (=> (not res!13111) (not e!12388))))

(declare-fun b!19242 () Bool)

(assert (=> b!19242 (= e!12387 e!12386)))

(declare-fun c!2050 () Bool)

(assert (=> b!19242 (= c!2050 (validKeyInArray!0 (select (arr!507 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19243 () Bool)

(assert (=> b!19243 (= e!12388 call!892)))

(assert (= (and d!3543 (not res!13112)) b!19242))

(assert (= (and b!19242 c!2050) b!19241))

(assert (= (and b!19242 (not c!2050)) b!19240))

(assert (= (and b!19241 res!13111) b!19243))

(assert (= (or b!19243 b!19240) bm!889))

(declare-fun m!13565 () Bool)

(assert (=> bm!889 m!13565))

(assert (=> b!19241 m!13559))

(declare-fun m!13567 () Bool)

(assert (=> b!19241 m!13567))

(declare-fun m!13569 () Bool)

(assert (=> b!19241 m!13569))

(assert (=> b!19241 m!13559))

(declare-fun m!13571 () Bool)

(assert (=> b!19241 m!13571))

(assert (=> b!19242 m!13559))

(assert (=> b!19242 m!13559))

(assert (=> b!19242 m!13561))

(assert (=> b!19204 d!3543))

(declare-fun bm!892 () Bool)

(declare-fun call!895 () Bool)

(declare-fun c!2053 () Bool)

(assert (=> bm!892 (= call!895 (arrayNoDuplicates!0 (_keys!3104 (v!1500 (underlying!70 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2053 (Cons!537 (select (arr!507 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000) Nil!538) Nil!538)))))

(declare-fun b!19254 () Bool)

(declare-fun e!12399 () Bool)

(declare-fun e!12398 () Bool)

(assert (=> b!19254 (= e!12399 e!12398)))

(assert (=> b!19254 (= c!2053 (validKeyInArray!0 (select (arr!507 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19255 () Bool)

(declare-fun e!12397 () Bool)

(assert (=> b!19255 (= e!12397 e!12399)))

(declare-fun res!13121 () Bool)

(assert (=> b!19255 (=> (not res!13121) (not e!12399))))

(declare-fun e!12400 () Bool)

(assert (=> b!19255 (= res!13121 (not e!12400))))

(declare-fun res!13120 () Bool)

(assert (=> b!19255 (=> (not res!13120) (not e!12400))))

(assert (=> b!19255 (= res!13120 (validKeyInArray!0 (select (arr!507 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun d!3545 () Bool)

(declare-fun res!13119 () Bool)

(assert (=> d!3545 (=> res!13119 e!12397)))

(assert (=> d!3545 (= res!13119 (bvsge #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1500 (underlying!70 thiss!938))))))))

(assert (=> d!3545 (= (arrayNoDuplicates!0 (_keys!3104 (v!1500 (underlying!70 thiss!938))) #b00000000000000000000000000000000 Nil!538) e!12397)))

(declare-fun b!19256 () Bool)

(declare-fun contains!219 (List!541 (_ BitVec 64)) Bool)

(assert (=> b!19256 (= e!12400 (contains!219 Nil!538 (select (arr!507 (_keys!3104 (v!1500 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19257 () Bool)

(assert (=> b!19257 (= e!12398 call!895)))

(declare-fun b!19258 () Bool)

(assert (=> b!19258 (= e!12398 call!895)))

(assert (= (and d!3545 (not res!13119)) b!19255))

(assert (= (and b!19255 res!13120) b!19256))

(assert (= (and b!19255 res!13121) b!19254))

(assert (= (and b!19254 c!2053) b!19258))

(assert (= (and b!19254 (not c!2053)) b!19257))

(assert (= (or b!19258 b!19257) bm!892))

(assert (=> bm!892 m!13559))

(declare-fun m!13573 () Bool)

(assert (=> bm!892 m!13573))

(assert (=> b!19254 m!13559))

(assert (=> b!19254 m!13559))

(assert (=> b!19254 m!13561))

(assert (=> b!19255 m!13559))

(assert (=> b!19255 m!13559))

(assert (=> b!19255 m!13561))

(assert (=> b!19256 m!13559))

(assert (=> b!19256 m!13559))

(declare-fun m!13575 () Bool)

(assert (=> b!19256 m!13575))

(assert (=> b!19205 d!3545))

(declare-fun b!19259 () Bool)

(declare-fun e!12401 () Bool)

(assert (=> b!19259 (= e!12401 tp_is_empty!931)))

(declare-fun b!19260 () Bool)

(declare-fun e!12402 () Bool)

(assert (=> b!19260 (= e!12402 tp_is_empty!931)))

(declare-fun condMapEmpty!854 () Bool)

(declare-fun mapDefault!854 () ValueCell!266)

(assert (=> mapNonEmpty!853 (= condMapEmpty!854 (= mapRest!853 ((as const (Array (_ BitVec 32) ValueCell!266)) mapDefault!854)))))

(declare-fun mapRes!854 () Bool)

(assert (=> mapNonEmpty!853 (= tp!3220 (and e!12402 mapRes!854))))

(declare-fun mapNonEmpty!854 () Bool)

(declare-fun tp!3221 () Bool)

(assert (=> mapNonEmpty!854 (= mapRes!854 (and tp!3221 e!12401))))

(declare-fun mapRest!854 () (Array (_ BitVec 32) ValueCell!266))

(declare-fun mapValue!854 () ValueCell!266)

(declare-fun mapKey!854 () (_ BitVec 32))

(assert (=> mapNonEmpty!854 (= mapRest!853 (store mapRest!854 mapKey!854 mapValue!854))))

(declare-fun mapIsEmpty!854 () Bool)

(assert (=> mapIsEmpty!854 mapRes!854))

(assert (= (and mapNonEmpty!853 condMapEmpty!854) mapIsEmpty!854))

(assert (= (and mapNonEmpty!853 (not condMapEmpty!854)) mapNonEmpty!854))

(assert (= (and mapNonEmpty!854 ((_ is ValueCellFull!266) mapValue!854)) b!19259))

(assert (= (and mapNonEmpty!853 ((_ is ValueCellFull!266) mapDefault!854)) b!19260))

(declare-fun m!13577 () Bool)

(assert (=> mapNonEmpty!854 m!13577))

(check-sat (not b!19241) (not bm!889) b_and!1321 (not bm!892) (not b!19242) (not b!19256) tp_is_empty!931 (not mapNonEmpty!854) (not b!19229) (not b!19230) (not b!19255) (not b!19216) (not b!19254) (not b_next!667) (not bm!886) (not d!3541))
(check-sat b_and!1321 (not b_next!667))
