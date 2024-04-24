; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3150 () Bool)

(assert start!3150)

(declare-fun b!19152 () Bool)

(declare-fun b_free!667 () Bool)

(declare-fun b_next!667 () Bool)

(assert (=> b!19152 (= b_free!667 (not b_next!667))))

(declare-fun tp!3204 () Bool)

(declare-fun b_and!1321 () Bool)

(assert (=> b!19152 (= tp!3204 b_and!1321)))

(declare-fun b!19151 () Bool)

(declare-fun res!13082 () Bool)

(declare-fun e!12321 () Bool)

(assert (=> b!19151 (=> (not res!13082) (not e!12321))))

(declare-datatypes ((V!1067 0))(
  ( (V!1068 (val!492 Int)) )
))
(declare-datatypes ((ValueCell!266 0))(
  ( (ValueCellFull!266 (v!1500 V!1067)) (EmptyCell!266) )
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
  ( (Cell!119 (v!1501 LongMapFixedSize!118)) )
))
(declare-datatypes ((LongMap!118 0))(
  ( (LongMap!119 (underlying!70 Cell!118)) )
))
(declare-fun thiss!938 () LongMap!118)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19151 (= res!13082 (validMask!0 (mask!4621 (v!1501 (underlying!70 thiss!938)))))))

(declare-fun mapIsEmpty!843 () Bool)

(declare-fun mapRes!843 () Bool)

(assert (=> mapIsEmpty!843 mapRes!843))

(declare-fun tp_is_empty!931 () Bool)

(declare-fun e!12319 () Bool)

(declare-fun e!12323 () Bool)

(declare-fun array_inv!365 (array!1057) Bool)

(declare-fun array_inv!366 (array!1055) Bool)

(assert (=> b!19152 (= e!12319 (and tp!3204 tp_is_empty!931 (array_inv!365 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) (array_inv!366 (_values!1674 (v!1501 (underlying!70 thiss!938)))) e!12323))))

(declare-fun b!19153 () Bool)

(declare-fun e!12324 () Bool)

(assert (=> b!19153 (= e!12324 tp_is_empty!931)))

(declare-fun b!19154 () Bool)

(assert (=> b!19154 (= e!12323 (and e!12324 mapRes!843))))

(declare-fun condMapEmpty!843 () Bool)

(declare-fun mapDefault!843 () ValueCell!266)

(assert (=> b!19154 (= condMapEmpty!843 (= (arr!506 (_values!1674 (v!1501 (underlying!70 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!266)) mapDefault!843)))))

(declare-fun b!19155 () Bool)

(assert (=> b!19155 (= e!12321 (or (bvslt (_size!92 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000000) (bvsgt (_size!92 (v!1501 (underlying!70 thiss!938))) (bvadd #b00000000000000000000000000000001 (mask!4621 (v!1501 (underlying!70 thiss!938)))))))))

(declare-fun mapNonEmpty!843 () Bool)

(declare-fun tp!3203 () Bool)

(declare-fun e!12322 () Bool)

(assert (=> mapNonEmpty!843 (= mapRes!843 (and tp!3203 e!12322))))

(declare-fun mapKey!843 () (_ BitVec 32))

(declare-fun mapValue!843 () ValueCell!266)

(declare-fun mapRest!843 () (Array (_ BitVec 32) ValueCell!266))

(assert (=> mapNonEmpty!843 (= (arr!506 (_values!1674 (v!1501 (underlying!70 thiss!938)))) (store mapRest!843 mapKey!843 mapValue!843))))

(declare-fun res!13083 () Bool)

(assert (=> start!3150 (=> (not res!13083) (not e!12321))))

(declare-fun valid!66 (LongMap!118) Bool)

(assert (=> start!3150 (= res!13083 (valid!66 thiss!938))))

(assert (=> start!3150 e!12321))

(declare-fun e!12320 () Bool)

(assert (=> start!3150 e!12320))

(declare-fun b!19156 () Bool)

(declare-fun e!12325 () Bool)

(assert (=> b!19156 (= e!12320 e!12325)))

(declare-fun b!19157 () Bool)

(assert (=> b!19157 (= e!12322 tp_is_empty!931)))

(declare-fun b!19158 () Bool)

(assert (=> b!19158 (= e!12325 e!12319)))

(assert (= (and start!3150 res!13083) b!19151))

(assert (= (and b!19151 res!13082) b!19155))

(assert (= (and b!19154 condMapEmpty!843) mapIsEmpty!843))

(assert (= (and b!19154 (not condMapEmpty!843)) mapNonEmpty!843))

(get-info :version)

(assert (= (and mapNonEmpty!843 ((_ is ValueCellFull!266) mapValue!843)) b!19157))

(assert (= (and b!19154 ((_ is ValueCellFull!266) mapDefault!843)) b!19153))

(assert (= b!19152 b!19154))

(assert (= b!19158 b!19152))

(assert (= b!19156 b!19158))

(assert (= start!3150 b!19156))

(declare-fun m!13527 () Bool)

(assert (=> b!19151 m!13527))

(declare-fun m!13529 () Bool)

(assert (=> b!19152 m!13529))

(declare-fun m!13531 () Bool)

(assert (=> b!19152 m!13531))

(declare-fun m!13533 () Bool)

(assert (=> mapNonEmpty!843 m!13533))

(declare-fun m!13535 () Bool)

(assert (=> start!3150 m!13535))

(check-sat (not start!3150) b_and!1321 tp_is_empty!931 (not b!19151) (not b_next!667) (not mapNonEmpty!843) (not b!19152))
(check-sat b_and!1321 (not b_next!667))
(get-model)

(declare-fun d!3535 () Bool)

(assert (=> d!3535 (= (validMask!0 (mask!4621 (v!1501 (underlying!70 thiss!938)))) (and (or (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000001111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000011111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000001111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000011111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000001111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000011111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000001111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000011111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000001111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000011111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000001111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000011111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000001111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000011111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000111111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000001111111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000011111111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000111111111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00001111111111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00011111111111111111111111111111) (= (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19151 d!3535))

(declare-fun d!3537 () Bool)

(declare-fun valid!68 (LongMapFixedSize!118) Bool)

(assert (=> d!3537 (= (valid!66 thiss!938) (valid!68 (v!1501 (underlying!70 thiss!938))))))

(declare-fun bs!864 () Bool)

(assert (= bs!864 d!3537))

(declare-fun m!13557 () Bool)

(assert (=> bs!864 m!13557))

(assert (=> start!3150 d!3537))

(declare-fun d!3539 () Bool)

(assert (=> d!3539 (= (array_inv!365 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) (bvsge (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19152 d!3539))

(declare-fun d!3541 () Bool)

(assert (=> d!3541 (= (array_inv!366 (_values!1674 (v!1501 (underlying!70 thiss!938)))) (bvsge (size!597 (_values!1674 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19152 d!3541))

(declare-fun mapNonEmpty!852 () Bool)

(declare-fun mapRes!852 () Bool)

(declare-fun tp!3219 () Bool)

(declare-fun e!12378 () Bool)

(assert (=> mapNonEmpty!852 (= mapRes!852 (and tp!3219 e!12378))))

(declare-fun mapRest!852 () (Array (_ BitVec 32) ValueCell!266))

(declare-fun mapValue!852 () ValueCell!266)

(declare-fun mapKey!852 () (_ BitVec 32))

(assert (=> mapNonEmpty!852 (= mapRest!843 (store mapRest!852 mapKey!852 mapValue!852))))

(declare-fun b!19213 () Bool)

(assert (=> b!19213 (= e!12378 tp_is_empty!931)))

(declare-fun condMapEmpty!852 () Bool)

(declare-fun mapDefault!852 () ValueCell!266)

(assert (=> mapNonEmpty!843 (= condMapEmpty!852 (= mapRest!843 ((as const (Array (_ BitVec 32) ValueCell!266)) mapDefault!852)))))

(declare-fun e!12379 () Bool)

(assert (=> mapNonEmpty!843 (= tp!3203 (and e!12379 mapRes!852))))

(declare-fun b!19214 () Bool)

(assert (=> b!19214 (= e!12379 tp_is_empty!931)))

(declare-fun mapIsEmpty!852 () Bool)

(assert (=> mapIsEmpty!852 mapRes!852))

(assert (= (and mapNonEmpty!843 condMapEmpty!852) mapIsEmpty!852))

(assert (= (and mapNonEmpty!843 (not condMapEmpty!852)) mapNonEmpty!852))

(assert (= (and mapNonEmpty!852 ((_ is ValueCellFull!266) mapValue!852)) b!19213))

(assert (= (and mapNonEmpty!843 ((_ is ValueCellFull!266) mapDefault!852)) b!19214))

(declare-fun m!13559 () Bool)

(assert (=> mapNonEmpty!852 m!13559))

(check-sat b_and!1321 tp_is_empty!931 (not mapNonEmpty!852) (not d!3537) (not b_next!667))
(check-sat b_and!1321 (not b_next!667))
(get-model)

(declare-fun d!3543 () Bool)

(declare-fun res!13102 () Bool)

(declare-fun e!12382 () Bool)

(assert (=> d!3543 (=> (not res!13102) (not e!12382))))

(declare-fun simpleValid!11 (LongMapFixedSize!118) Bool)

(assert (=> d!3543 (= res!13102 (simpleValid!11 (v!1501 (underlying!70 thiss!938))))))

(assert (=> d!3543 (= (valid!68 (v!1501 (underlying!70 thiss!938))) e!12382)))

(declare-fun b!19221 () Bool)

(declare-fun res!13103 () Bool)

(assert (=> b!19221 (=> (not res!13103) (not e!12382))))

(declare-fun arrayCountValidKeys!0 (array!1057 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19221 (= res!13103 (= (arrayCountValidKeys!0 (_keys!3104 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938))))) (_size!92 (v!1501 (underlying!70 thiss!938)))))))

(declare-fun b!19222 () Bool)

(declare-fun res!13104 () Bool)

(assert (=> b!19222 (=> (not res!13104) (not e!12382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1057 (_ BitVec 32)) Bool)

(assert (=> b!19222 (= res!13104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3104 (v!1501 (underlying!70 thiss!938))) (mask!4621 (v!1501 (underlying!70 thiss!938)))))))

(declare-fun b!19223 () Bool)

(declare-datatypes ((List!542 0))(
  ( (Nil!539) (Cons!538 (h!1104 (_ BitVec 64)) (t!3179 List!542)) )
))
(declare-fun arrayNoDuplicates!0 (array!1057 (_ BitVec 32) List!542) Bool)

(assert (=> b!19223 (= e!12382 (arrayNoDuplicates!0 (_keys!3104 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000000 Nil!539))))

(assert (= (and d!3543 res!13102) b!19221))

(assert (= (and b!19221 res!13103) b!19222))

(assert (= (and b!19222 res!13104) b!19223))

(declare-fun m!13561 () Bool)

(assert (=> d!3543 m!13561))

(declare-fun m!13563 () Bool)

(assert (=> b!19221 m!13563))

(declare-fun m!13565 () Bool)

(assert (=> b!19222 m!13565))

(declare-fun m!13567 () Bool)

(assert (=> b!19223 m!13567))

(assert (=> d!3537 d!3543))

(declare-fun mapNonEmpty!853 () Bool)

(declare-fun mapRes!853 () Bool)

(declare-fun tp!3220 () Bool)

(declare-fun e!12383 () Bool)

(assert (=> mapNonEmpty!853 (= mapRes!853 (and tp!3220 e!12383))))

(declare-fun mapKey!853 () (_ BitVec 32))

(declare-fun mapValue!853 () ValueCell!266)

(declare-fun mapRest!853 () (Array (_ BitVec 32) ValueCell!266))

(assert (=> mapNonEmpty!853 (= mapRest!852 (store mapRest!853 mapKey!853 mapValue!853))))

(declare-fun b!19224 () Bool)

(assert (=> b!19224 (= e!12383 tp_is_empty!931)))

(declare-fun condMapEmpty!853 () Bool)

(declare-fun mapDefault!853 () ValueCell!266)

(assert (=> mapNonEmpty!852 (= condMapEmpty!853 (= mapRest!852 ((as const (Array (_ BitVec 32) ValueCell!266)) mapDefault!853)))))

(declare-fun e!12384 () Bool)

(assert (=> mapNonEmpty!852 (= tp!3219 (and e!12384 mapRes!853))))

(declare-fun b!19225 () Bool)

(assert (=> b!19225 (= e!12384 tp_is_empty!931)))

(declare-fun mapIsEmpty!853 () Bool)

(assert (=> mapIsEmpty!853 mapRes!853))

(assert (= (and mapNonEmpty!852 condMapEmpty!853) mapIsEmpty!853))

(assert (= (and mapNonEmpty!852 (not condMapEmpty!853)) mapNonEmpty!853))

(assert (= (and mapNonEmpty!853 ((_ is ValueCellFull!266) mapValue!853)) b!19224))

(assert (= (and mapNonEmpty!852 ((_ is ValueCellFull!266) mapDefault!853)) b!19225))

(declare-fun m!13569 () Bool)

(assert (=> mapNonEmpty!853 m!13569))

(check-sat (not d!3543) b_and!1321 tp_is_empty!931 (not b!19223) (not b!19221) (not mapNonEmpty!853) (not b_next!667) (not b!19222))
(check-sat b_and!1321 (not b_next!667))
(get-model)

(declare-fun b!19234 () Bool)

(declare-fun e!12391 () Bool)

(declare-fun call!889 () Bool)

(assert (=> b!19234 (= e!12391 call!889)))

(declare-fun b!19235 () Bool)

(declare-fun e!12392 () Bool)

(declare-fun e!12393 () Bool)

(assert (=> b!19235 (= e!12392 e!12393)))

(declare-fun c!2048 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19235 (= c!2048 (validKeyInArray!0 (select (arr!507 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19236 () Bool)

(assert (=> b!19236 (= e!12393 e!12391)))

(declare-fun lt!5409 () (_ BitVec 64))

(assert (=> b!19236 (= lt!5409 (select (arr!507 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!390 0))(
  ( (Unit!391) )
))
(declare-fun lt!5407 () Unit!390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1057 (_ BitVec 64) (_ BitVec 32)) Unit!390)

(assert (=> b!19236 (= lt!5407 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3104 (v!1501 (underlying!70 thiss!938))) lt!5409 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19236 (arrayContainsKey!0 (_keys!3104 (v!1501 (underlying!70 thiss!938))) lt!5409 #b00000000000000000000000000000000)))

(declare-fun lt!5408 () Unit!390)

(assert (=> b!19236 (= lt!5408 lt!5407)))

(declare-fun res!13110 () Bool)

(declare-datatypes ((SeekEntryResult!45 0))(
  ( (MissingZero!45 (index!2300 (_ BitVec 32))) (Found!45 (index!2301 (_ BitVec 32))) (Intermediate!45 (undefined!857 Bool) (index!2302 (_ BitVec 32)) (x!4728 (_ BitVec 32))) (Undefined!45) (MissingVacant!45 (index!2303 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1057 (_ BitVec 32)) SeekEntryResult!45)

(assert (=> b!19236 (= res!13110 (= (seekEntryOrOpen!0 (select (arr!507 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000) (_keys!3104 (v!1501 (underlying!70 thiss!938))) (mask!4621 (v!1501 (underlying!70 thiss!938)))) (Found!45 #b00000000000000000000000000000000)))))

(assert (=> b!19236 (=> (not res!13110) (not e!12391))))

(declare-fun b!19237 () Bool)

(assert (=> b!19237 (= e!12393 call!889)))

(declare-fun bm!886 () Bool)

(assert (=> bm!886 (= call!889 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3104 (v!1501 (underlying!70 thiss!938))) (mask!4621 (v!1501 (underlying!70 thiss!938)))))))

(declare-fun d!3545 () Bool)

(declare-fun res!13109 () Bool)

(assert (=> d!3545 (=> res!13109 e!12392)))

(assert (=> d!3545 (= res!13109 (bvsge #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938))))))))

(assert (=> d!3545 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3104 (v!1501 (underlying!70 thiss!938))) (mask!4621 (v!1501 (underlying!70 thiss!938)))) e!12392)))

(assert (= (and d!3545 (not res!13109)) b!19235))

(assert (= (and b!19235 c!2048) b!19236))

(assert (= (and b!19235 (not c!2048)) b!19237))

(assert (= (and b!19236 res!13110) b!19234))

(assert (= (or b!19234 b!19237) bm!886))

(declare-fun m!13571 () Bool)

(assert (=> b!19235 m!13571))

(assert (=> b!19235 m!13571))

(declare-fun m!13573 () Bool)

(assert (=> b!19235 m!13573))

(assert (=> b!19236 m!13571))

(declare-fun m!13575 () Bool)

(assert (=> b!19236 m!13575))

(declare-fun m!13577 () Bool)

(assert (=> b!19236 m!13577))

(assert (=> b!19236 m!13571))

(declare-fun m!13579 () Bool)

(assert (=> b!19236 m!13579))

(declare-fun m!13581 () Bool)

(assert (=> bm!886 m!13581))

(assert (=> b!19222 d!3545))

(declare-fun b!19246 () Bool)

(declare-fun e!12399 () (_ BitVec 32))

(assert (=> b!19246 (= e!12399 #b00000000000000000000000000000000)))

(declare-fun d!3547 () Bool)

(declare-fun lt!5412 () (_ BitVec 32))

(assert (=> d!3547 (and (bvsge lt!5412 #b00000000000000000000000000000000) (bvsle lt!5412 (bvsub (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (=> d!3547 (= lt!5412 e!12399)))

(declare-fun c!2053 () Bool)

(assert (=> d!3547 (= c!2053 (bvsge #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938))))))))

(assert (=> d!3547 (and (bvsle #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938))))))))

(assert (=> d!3547 (= (arrayCountValidKeys!0 (_keys!3104 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938))))) lt!5412)))

(declare-fun b!19247 () Bool)

(declare-fun e!12398 () (_ BitVec 32))

(declare-fun call!892 () (_ BitVec 32))

(assert (=> b!19247 (= e!12398 (bvadd #b00000000000000000000000000000001 call!892))))

(declare-fun bm!889 () Bool)

(assert (=> bm!889 (= call!892 (arrayCountValidKeys!0 (_keys!3104 (v!1501 (underlying!70 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938))))))))

(declare-fun b!19248 () Bool)

(assert (=> b!19248 (= e!12399 e!12398)))

(declare-fun c!2054 () Bool)

(assert (=> b!19248 (= c!2054 (validKeyInArray!0 (select (arr!507 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19249 () Bool)

(assert (=> b!19249 (= e!12398 call!892)))

(assert (= (and d!3547 c!2053) b!19246))

(assert (= (and d!3547 (not c!2053)) b!19248))

(assert (= (and b!19248 c!2054) b!19247))

(assert (= (and b!19248 (not c!2054)) b!19249))

(assert (= (or b!19247 b!19249) bm!889))

(declare-fun m!13583 () Bool)

(assert (=> bm!889 m!13583))

(assert (=> b!19248 m!13571))

(assert (=> b!19248 m!13571))

(assert (=> b!19248 m!13573))

(assert (=> b!19221 d!3547))

(declare-fun b!19260 () Bool)

(declare-fun e!12408 () Bool)

(declare-fun e!12411 () Bool)

(assert (=> b!19260 (= e!12408 e!12411)))

(declare-fun res!13118 () Bool)

(assert (=> b!19260 (=> (not res!13118) (not e!12411))))

(declare-fun e!12410 () Bool)

(assert (=> b!19260 (= res!13118 (not e!12410))))

(declare-fun res!13117 () Bool)

(assert (=> b!19260 (=> (not res!13117) (not e!12410))))

(assert (=> b!19260 (= res!13117 (validKeyInArray!0 (select (arr!507 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19261 () Bool)

(declare-fun contains!218 (List!542 (_ BitVec 64)) Bool)

(assert (=> b!19261 (= e!12410 (contains!218 Nil!539 (select (arr!507 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19262 () Bool)

(declare-fun e!12409 () Bool)

(declare-fun call!895 () Bool)

(assert (=> b!19262 (= e!12409 call!895)))

(declare-fun b!19263 () Bool)

(assert (=> b!19263 (= e!12411 e!12409)))

(declare-fun c!2057 () Bool)

(assert (=> b!19263 (= c!2057 (validKeyInArray!0 (select (arr!507 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun bm!892 () Bool)

(assert (=> bm!892 (= call!895 (arrayNoDuplicates!0 (_keys!3104 (v!1501 (underlying!70 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2057 (Cons!538 (select (arr!507 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) #b00000000000000000000000000000000) Nil!539) Nil!539)))))

(declare-fun d!3549 () Bool)

(declare-fun res!13119 () Bool)

(assert (=> d!3549 (=> res!13119 e!12408)))

(assert (=> d!3549 (= res!13119 (bvsge #b00000000000000000000000000000000 (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938))))))))

(assert (=> d!3549 (= (arrayNoDuplicates!0 (_keys!3104 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000000 Nil!539) e!12408)))

(declare-fun b!19264 () Bool)

(assert (=> b!19264 (= e!12409 call!895)))

(assert (= (and d!3549 (not res!13119)) b!19260))

(assert (= (and b!19260 res!13117) b!19261))

(assert (= (and b!19260 res!13118) b!19263))

(assert (= (and b!19263 c!2057) b!19264))

(assert (= (and b!19263 (not c!2057)) b!19262))

(assert (= (or b!19264 b!19262) bm!892))

(assert (=> b!19260 m!13571))

(assert (=> b!19260 m!13571))

(assert (=> b!19260 m!13573))

(assert (=> b!19261 m!13571))

(assert (=> b!19261 m!13571))

(declare-fun m!13585 () Bool)

(assert (=> b!19261 m!13585))

(assert (=> b!19263 m!13571))

(assert (=> b!19263 m!13571))

(assert (=> b!19263 m!13573))

(assert (=> bm!892 m!13571))

(declare-fun m!13587 () Bool)

(assert (=> bm!892 m!13587))

(assert (=> b!19223 d!3549))

(declare-fun b!19275 () Bool)

(declare-fun res!13129 () Bool)

(declare-fun e!12414 () Bool)

(assert (=> b!19275 (=> (not res!13129) (not e!12414))))

(declare-fun size!603 (LongMapFixedSize!118) (_ BitVec 32))

(assert (=> b!19275 (= res!13129 (= (size!603 (v!1501 (underlying!70 thiss!938))) (bvadd (_size!92 (v!1501 (underlying!70 thiss!938))) (bvsdiv (bvadd (extraKeys!1588 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!19273 () Bool)

(declare-fun res!13130 () Bool)

(assert (=> b!19273 (=> (not res!13130) (not e!12414))))

(assert (=> b!19273 (= res!13130 (and (= (size!597 (_values!1674 (v!1501 (underlying!70 thiss!938)))) (bvadd (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000001)) (= (size!598 (_keys!3104 (v!1501 (underlying!70 thiss!938)))) (size!597 (_values!1674 (v!1501 (underlying!70 thiss!938))))) (bvsge (_size!92 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!92 (v!1501 (underlying!70 thiss!938))) (bvadd (mask!4621 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun d!3551 () Bool)

(declare-fun res!13131 () Bool)

(assert (=> d!3551 (=> (not res!13131) (not e!12414))))

(assert (=> d!3551 (= res!13131 (validMask!0 (mask!4621 (v!1501 (underlying!70 thiss!938)))))))

(assert (=> d!3551 (= (simpleValid!11 (v!1501 (underlying!70 thiss!938))) e!12414)))

(declare-fun b!19276 () Bool)

(assert (=> b!19276 (= e!12414 (and (bvsge (extraKeys!1588 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1588 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!92 (v!1501 (underlying!70 thiss!938))) #b00000000000000000000000000000000)))))

(declare-fun b!19274 () Bool)

(declare-fun res!13128 () Bool)

(assert (=> b!19274 (=> (not res!13128) (not e!12414))))

(assert (=> b!19274 (= res!13128 (bvsge (size!603 (v!1501 (underlying!70 thiss!938))) (_size!92 (v!1501 (underlying!70 thiss!938)))))))

(assert (= (and d!3551 res!13131) b!19273))

(assert (= (and b!19273 res!13130) b!19274))

(assert (= (and b!19274 res!13128) b!19275))

(assert (= (and b!19275 res!13129) b!19276))

(declare-fun m!13589 () Bool)

(assert (=> b!19275 m!13589))

(assert (=> d!3551 m!13527))

(assert (=> b!19274 m!13589))

(assert (=> d!3543 d!3551))

(declare-fun mapNonEmpty!854 () Bool)

(declare-fun mapRes!854 () Bool)

(declare-fun tp!3221 () Bool)

(declare-fun e!12415 () Bool)

(assert (=> mapNonEmpty!854 (= mapRes!854 (and tp!3221 e!12415))))

(declare-fun mapKey!854 () (_ BitVec 32))

(declare-fun mapRest!854 () (Array (_ BitVec 32) ValueCell!266))

(declare-fun mapValue!854 () ValueCell!266)

(assert (=> mapNonEmpty!854 (= mapRest!853 (store mapRest!854 mapKey!854 mapValue!854))))

(declare-fun b!19277 () Bool)

(assert (=> b!19277 (= e!12415 tp_is_empty!931)))

(declare-fun condMapEmpty!854 () Bool)

(declare-fun mapDefault!854 () ValueCell!266)

(assert (=> mapNonEmpty!853 (= condMapEmpty!854 (= mapRest!853 ((as const (Array (_ BitVec 32) ValueCell!266)) mapDefault!854)))))

(declare-fun e!12416 () Bool)

(assert (=> mapNonEmpty!853 (= tp!3220 (and e!12416 mapRes!854))))

(declare-fun b!19278 () Bool)

(assert (=> b!19278 (= e!12416 tp_is_empty!931)))

(declare-fun mapIsEmpty!854 () Bool)

(assert (=> mapIsEmpty!854 mapRes!854))

(assert (= (and mapNonEmpty!853 condMapEmpty!854) mapIsEmpty!854))

(assert (= (and mapNonEmpty!853 (not condMapEmpty!854)) mapNonEmpty!854))

(assert (= (and mapNonEmpty!854 ((_ is ValueCellFull!266) mapValue!854)) b!19277))

(assert (= (and mapNonEmpty!853 ((_ is ValueCellFull!266) mapDefault!854)) b!19278))

(declare-fun m!13591 () Bool)

(assert (=> mapNonEmpty!854 m!13591))

(check-sat (not b!19236) (not bm!886) (not b!19275) (not bm!892) (not b!19263) (not b!19261) (not b!19274) (not b!19235) (not b!19260) (not b_next!667) b_and!1321 (not b!19248) (not bm!889) tp_is_empty!931 (not mapNonEmpty!854) (not d!3551))
(check-sat b_and!1321 (not b_next!667))
