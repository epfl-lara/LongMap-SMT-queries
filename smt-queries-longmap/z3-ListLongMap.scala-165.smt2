; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3156 () Bool)

(assert start!3156)

(declare-fun b!19224 () Bool)

(declare-fun b_free!669 () Bool)

(declare-fun b_next!669 () Bool)

(assert (=> b!19224 (= b_free!669 (not b_next!669))))

(declare-fun tp!3210 () Bool)

(declare-fun b_and!1329 () Bool)

(assert (=> b!19224 (= tp!3210 b_and!1329)))

(declare-fun mapIsEmpty!846 () Bool)

(declare-fun mapRes!846 () Bool)

(assert (=> mapIsEmpty!846 mapRes!846))

(declare-fun b!19217 () Bool)

(declare-fun e!12376 () Bool)

(declare-fun tp_is_empty!933 () Bool)

(assert (=> b!19217 (= e!12376 tp_is_empty!933)))

(declare-fun b!19218 () Bool)

(declare-fun e!12375 () Bool)

(declare-fun e!12379 () Bool)

(assert (=> b!19218 (= e!12375 e!12379)))

(declare-fun b!19219 () Bool)

(declare-fun e!12381 () Bool)

(declare-datatypes ((V!1069 0))(
  ( (V!1070 (val!493 Int)) )
))
(declare-datatypes ((ValueCell!267 0))(
  ( (ValueCellFull!267 (v!1502 V!1069)) (EmptyCell!267) )
))
(declare-datatypes ((array!1077 0))(
  ( (array!1078 (arr!517 (Array (_ BitVec 32) ValueCell!267)) (size!608 (_ BitVec 32))) )
))
(declare-datatypes ((array!1079 0))(
  ( (array!1080 (arr!518 (Array (_ BitVec 32) (_ BitVec 64))) (size!609 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!120 0))(
  ( (LongMapFixedSize!121 (defaultEntry!1679 Int) (mask!4622 (_ BitVec 32)) (extraKeys!1589 (_ BitVec 32)) (zeroValue!1613 V!1069) (minValue!1613 V!1069) (_size!93 (_ BitVec 32)) (_keys!3105 array!1079) (_values!1675 array!1077) (_vacant!93 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!120 0))(
  ( (Cell!121 (v!1503 LongMapFixedSize!120)) )
))
(declare-datatypes ((LongMap!120 0))(
  ( (LongMap!121 (underlying!71 Cell!120)) )
))
(declare-fun thiss!938 () LongMap!120)

(assert (=> b!19219 (= e!12381 (or (bvslt (_size!93 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000000) (bvsgt (_size!93 (v!1503 (underlying!71 thiss!938))) (bvadd #b00000000000000000000000000000001 (mask!4622 (v!1503 (underlying!71 thiss!938)))))))))

(declare-fun b!19220 () Bool)

(declare-fun e!12378 () Bool)

(assert (=> b!19220 (= e!12379 e!12378)))

(declare-fun mapNonEmpty!846 () Bool)

(declare-fun tp!3209 () Bool)

(assert (=> mapNonEmpty!846 (= mapRes!846 (and tp!3209 e!12376))))

(declare-fun mapKey!846 () (_ BitVec 32))

(declare-fun mapValue!846 () ValueCell!267)

(declare-fun mapRest!846 () (Array (_ BitVec 32) ValueCell!267))

(assert (=> mapNonEmpty!846 (= (arr!517 (_values!1675 (v!1503 (underlying!71 thiss!938)))) (store mapRest!846 mapKey!846 mapValue!846))))

(declare-fun b!19221 () Bool)

(declare-fun e!12377 () Bool)

(declare-fun e!12380 () Bool)

(assert (=> b!19221 (= e!12377 (and e!12380 mapRes!846))))

(declare-fun condMapEmpty!846 () Bool)

(declare-fun mapDefault!846 () ValueCell!267)

(assert (=> b!19221 (= condMapEmpty!846 (= (arr!517 (_values!1675 (v!1503 (underlying!71 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!267)) mapDefault!846)))))

(declare-fun b!19223 () Bool)

(declare-fun res!13110 () Bool)

(assert (=> b!19223 (=> (not res!13110) (not e!12381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19223 (= res!13110 (validMask!0 (mask!4622 (v!1503 (underlying!71 thiss!938)))))))

(declare-fun array_inv!353 (array!1079) Bool)

(declare-fun array_inv!354 (array!1077) Bool)

(assert (=> b!19224 (= e!12378 (and tp!3210 tp_is_empty!933 (array_inv!353 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) (array_inv!354 (_values!1675 (v!1503 (underlying!71 thiss!938)))) e!12377))))

(declare-fun b!19222 () Bool)

(assert (=> b!19222 (= e!12380 tp_is_empty!933)))

(declare-fun res!13111 () Bool)

(assert (=> start!3156 (=> (not res!13111) (not e!12381))))

(declare-fun valid!56 (LongMap!120) Bool)

(assert (=> start!3156 (= res!13111 (valid!56 thiss!938))))

(assert (=> start!3156 e!12381))

(assert (=> start!3156 e!12375))

(assert (= (and start!3156 res!13111) b!19223))

(assert (= (and b!19223 res!13110) b!19219))

(assert (= (and b!19221 condMapEmpty!846) mapIsEmpty!846))

(assert (= (and b!19221 (not condMapEmpty!846)) mapNonEmpty!846))

(get-info :version)

(assert (= (and mapNonEmpty!846 ((_ is ValueCellFull!267) mapValue!846)) b!19217))

(assert (= (and b!19221 ((_ is ValueCellFull!267) mapDefault!846)) b!19222))

(assert (= b!19224 b!19221))

(assert (= b!19220 b!19224))

(assert (= b!19218 b!19220))

(assert (= start!3156 b!19218))

(declare-fun m!13585 () Bool)

(assert (=> mapNonEmpty!846 m!13585))

(declare-fun m!13587 () Bool)

(assert (=> b!19223 m!13587))

(declare-fun m!13589 () Bool)

(assert (=> b!19224 m!13589))

(declare-fun m!13591 () Bool)

(assert (=> b!19224 m!13591))

(declare-fun m!13593 () Bool)

(assert (=> start!3156 m!13593))

(check-sat (not start!3156) (not b_next!669) tp_is_empty!933 b_and!1329 (not b!19223) (not mapNonEmpty!846) (not b!19224))
(check-sat b_and!1329 (not b_next!669))
(get-model)

(declare-fun d!3567 () Bool)

(assert (=> d!3567 (= (validMask!0 (mask!4622 (v!1503 (underlying!71 thiss!938)))) (and (or (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000001111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000011111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000001111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000011111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000001111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000011111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000001111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000011111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000001111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000011111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000001111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000011111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000001111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000011111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000111111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000001111111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000011111111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000111111111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00001111111111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00011111111111111111111111111111) (= (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19223 d!3567))

(declare-fun d!3569 () Bool)

(assert (=> d!3569 (= (array_inv!353 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) (bvsge (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19224 d!3569))

(declare-fun d!3571 () Bool)

(assert (=> d!3571 (= (array_inv!354 (_values!1675 (v!1503 (underlying!71 thiss!938)))) (bvsge (size!608 (_values!1675 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19224 d!3571))

(declare-fun d!3573 () Bool)

(declare-fun valid!57 (LongMapFixedSize!120) Bool)

(assert (=> d!3573 (= (valid!56 thiss!938) (valid!57 (v!1503 (underlying!71 thiss!938))))))

(declare-fun bs!866 () Bool)

(assert (= bs!866 d!3573))

(declare-fun m!13605 () Bool)

(assert (=> bs!866 m!13605))

(assert (=> start!3156 d!3573))

(declare-fun b!19255 () Bool)

(declare-fun e!12411 () Bool)

(assert (=> b!19255 (= e!12411 tp_is_empty!933)))

(declare-fun b!19256 () Bool)

(declare-fun e!12410 () Bool)

(assert (=> b!19256 (= e!12410 tp_is_empty!933)))

(declare-fun condMapEmpty!852 () Bool)

(declare-fun mapDefault!852 () ValueCell!267)

(assert (=> mapNonEmpty!846 (= condMapEmpty!852 (= mapRest!846 ((as const (Array (_ BitVec 32) ValueCell!267)) mapDefault!852)))))

(declare-fun mapRes!852 () Bool)

(assert (=> mapNonEmpty!846 (= tp!3209 (and e!12410 mapRes!852))))

(declare-fun mapNonEmpty!852 () Bool)

(declare-fun tp!3219 () Bool)

(assert (=> mapNonEmpty!852 (= mapRes!852 (and tp!3219 e!12411))))

(declare-fun mapRest!852 () (Array (_ BitVec 32) ValueCell!267))

(declare-fun mapKey!852 () (_ BitVec 32))

(declare-fun mapValue!852 () ValueCell!267)

(assert (=> mapNonEmpty!852 (= mapRest!846 (store mapRest!852 mapKey!852 mapValue!852))))

(declare-fun mapIsEmpty!852 () Bool)

(assert (=> mapIsEmpty!852 mapRes!852))

(assert (= (and mapNonEmpty!846 condMapEmpty!852) mapIsEmpty!852))

(assert (= (and mapNonEmpty!846 (not condMapEmpty!852)) mapNonEmpty!852))

(assert (= (and mapNonEmpty!852 ((_ is ValueCellFull!267) mapValue!852)) b!19255))

(assert (= (and mapNonEmpty!846 ((_ is ValueCellFull!267) mapDefault!852)) b!19256))

(declare-fun m!13607 () Bool)

(assert (=> mapNonEmpty!852 m!13607))

(check-sat (not mapNonEmpty!852) (not b_next!669) tp_is_empty!933 (not d!3573) b_and!1329)
(check-sat b_and!1329 (not b_next!669))
(get-model)

(declare-fun d!3575 () Bool)

(declare-fun res!13124 () Bool)

(declare-fun e!12414 () Bool)

(assert (=> d!3575 (=> (not res!13124) (not e!12414))))

(declare-fun simpleValid!11 (LongMapFixedSize!120) Bool)

(assert (=> d!3575 (= res!13124 (simpleValid!11 (v!1503 (underlying!71 thiss!938))))))

(assert (=> d!3575 (= (valid!57 (v!1503 (underlying!71 thiss!938))) e!12414)))

(declare-fun b!19263 () Bool)

(declare-fun res!13125 () Bool)

(assert (=> b!19263 (=> (not res!13125) (not e!12414))))

(declare-fun arrayCountValidKeys!0 (array!1079 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19263 (= res!13125 (= (arrayCountValidKeys!0 (_keys!3105 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000000 (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938))))) (_size!93 (v!1503 (underlying!71 thiss!938)))))))

(declare-fun b!19264 () Bool)

(declare-fun res!13126 () Bool)

(assert (=> b!19264 (=> (not res!13126) (not e!12414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1079 (_ BitVec 32)) Bool)

(assert (=> b!19264 (= res!13126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3105 (v!1503 (underlying!71 thiss!938))) (mask!4622 (v!1503 (underlying!71 thiss!938)))))))

(declare-fun b!19265 () Bool)

(declare-datatypes ((List!545 0))(
  ( (Nil!542) (Cons!541 (h!1107 (_ BitVec 64)) (t!3188 List!545)) )
))
(declare-fun arrayNoDuplicates!0 (array!1079 (_ BitVec 32) List!545) Bool)

(assert (=> b!19265 (= e!12414 (arrayNoDuplicates!0 (_keys!3105 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000000 Nil!542))))

(assert (= (and d!3575 res!13124) b!19263))

(assert (= (and b!19263 res!13125) b!19264))

(assert (= (and b!19264 res!13126) b!19265))

(declare-fun m!13609 () Bool)

(assert (=> d!3575 m!13609))

(declare-fun m!13611 () Bool)

(assert (=> b!19263 m!13611))

(declare-fun m!13613 () Bool)

(assert (=> b!19264 m!13613))

(declare-fun m!13615 () Bool)

(assert (=> b!19265 m!13615))

(assert (=> d!3573 d!3575))

(declare-fun b!19266 () Bool)

(declare-fun e!12416 () Bool)

(assert (=> b!19266 (= e!12416 tp_is_empty!933)))

(declare-fun b!19267 () Bool)

(declare-fun e!12415 () Bool)

(assert (=> b!19267 (= e!12415 tp_is_empty!933)))

(declare-fun condMapEmpty!853 () Bool)

(declare-fun mapDefault!853 () ValueCell!267)

(assert (=> mapNonEmpty!852 (= condMapEmpty!853 (= mapRest!852 ((as const (Array (_ BitVec 32) ValueCell!267)) mapDefault!853)))))

(declare-fun mapRes!853 () Bool)

(assert (=> mapNonEmpty!852 (= tp!3219 (and e!12415 mapRes!853))))

(declare-fun mapNonEmpty!853 () Bool)

(declare-fun tp!3220 () Bool)

(assert (=> mapNonEmpty!853 (= mapRes!853 (and tp!3220 e!12416))))

(declare-fun mapKey!853 () (_ BitVec 32))

(declare-fun mapValue!853 () ValueCell!267)

(declare-fun mapRest!853 () (Array (_ BitVec 32) ValueCell!267))

(assert (=> mapNonEmpty!853 (= mapRest!852 (store mapRest!853 mapKey!853 mapValue!853))))

(declare-fun mapIsEmpty!853 () Bool)

(assert (=> mapIsEmpty!853 mapRes!853))

(assert (= (and mapNonEmpty!852 condMapEmpty!853) mapIsEmpty!853))

(assert (= (and mapNonEmpty!852 (not condMapEmpty!853)) mapNonEmpty!853))

(assert (= (and mapNonEmpty!853 ((_ is ValueCellFull!267) mapValue!853)) b!19266))

(assert (= (and mapNonEmpty!852 ((_ is ValueCellFull!267) mapDefault!853)) b!19267))

(declare-fun m!13617 () Bool)

(assert (=> mapNonEmpty!853 m!13617))

(check-sat (not mapNonEmpty!853) (not b_next!669) tp_is_empty!933 (not b!19265) (not d!3575) b_and!1329 (not b!19263) (not b!19264))
(check-sat b_and!1329 (not b_next!669))
(get-model)

(declare-fun b!19277 () Bool)

(declare-fun res!13136 () Bool)

(declare-fun e!12419 () Bool)

(assert (=> b!19277 (=> (not res!13136) (not e!12419))))

(declare-fun size!612 (LongMapFixedSize!120) (_ BitVec 32))

(assert (=> b!19277 (= res!13136 (bvsge (size!612 (v!1503 (underlying!71 thiss!938))) (_size!93 (v!1503 (underlying!71 thiss!938)))))))

(declare-fun b!19276 () Bool)

(declare-fun res!13137 () Bool)

(assert (=> b!19276 (=> (not res!13137) (not e!12419))))

(assert (=> b!19276 (= res!13137 (and (= (size!608 (_values!1675 (v!1503 (underlying!71 thiss!938)))) (bvadd (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000001)) (= (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) (size!608 (_values!1675 (v!1503 (underlying!71 thiss!938))))) (bvsge (_size!93 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!93 (v!1503 (underlying!71 thiss!938))) (bvadd (mask!4622 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun b!19279 () Bool)

(assert (=> b!19279 (= e!12419 (and (bvsge (extraKeys!1589 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1589 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!93 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000000)))))

(declare-fun d!3577 () Bool)

(declare-fun res!13138 () Bool)

(assert (=> d!3577 (=> (not res!13138) (not e!12419))))

(assert (=> d!3577 (= res!13138 (validMask!0 (mask!4622 (v!1503 (underlying!71 thiss!938)))))))

(assert (=> d!3577 (= (simpleValid!11 (v!1503 (underlying!71 thiss!938))) e!12419)))

(declare-fun b!19278 () Bool)

(declare-fun res!13135 () Bool)

(assert (=> b!19278 (=> (not res!13135) (not e!12419))))

(assert (=> b!19278 (= res!13135 (= (size!612 (v!1503 (underlying!71 thiss!938))) (bvadd (_size!93 (v!1503 (underlying!71 thiss!938))) (bvsdiv (bvadd (extraKeys!1589 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!3577 res!13138) b!19276))

(assert (= (and b!19276 res!13137) b!19277))

(assert (= (and b!19277 res!13136) b!19278))

(assert (= (and b!19278 res!13135) b!19279))

(declare-fun m!13619 () Bool)

(assert (=> b!19277 m!13619))

(assert (=> d!3577 m!13587))

(assert (=> b!19278 m!13619))

(assert (=> d!3575 d!3577))

(declare-fun d!3579 () Bool)

(declare-fun res!13143 () Bool)

(declare-fun e!12427 () Bool)

(assert (=> d!3579 (=> res!13143 e!12427)))

(assert (=> d!3579 (= res!13143 (bvsge #b00000000000000000000000000000000 (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938))))))))

(assert (=> d!3579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3105 (v!1503 (underlying!71 thiss!938))) (mask!4622 (v!1503 (underlying!71 thiss!938)))) e!12427)))

(declare-fun bm!886 () Bool)

(declare-fun call!889 () Bool)

(assert (=> bm!886 (= call!889 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3105 (v!1503 (underlying!71 thiss!938))) (mask!4622 (v!1503 (underlying!71 thiss!938)))))))

(declare-fun b!19288 () Bool)

(declare-fun e!12428 () Bool)

(declare-fun e!12426 () Bool)

(assert (=> b!19288 (= e!12428 e!12426)))

(declare-fun lt!5407 () (_ BitVec 64))

(assert (=> b!19288 (= lt!5407 (select (arr!518 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!380 0))(
  ( (Unit!381) )
))
(declare-fun lt!5409 () Unit!380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1079 (_ BitVec 64) (_ BitVec 32)) Unit!380)

(assert (=> b!19288 (= lt!5409 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3105 (v!1503 (underlying!71 thiss!938))) lt!5407 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19288 (arrayContainsKey!0 (_keys!3105 (v!1503 (underlying!71 thiss!938))) lt!5407 #b00000000000000000000000000000000)))

(declare-fun lt!5408 () Unit!380)

(assert (=> b!19288 (= lt!5408 lt!5409)))

(declare-fun res!13144 () Bool)

(declare-datatypes ((SeekEntryResult!45 0))(
  ( (MissingZero!45 (index!2300 (_ BitVec 32))) (Found!45 (index!2301 (_ BitVec 32))) (Intermediate!45 (undefined!857 Bool) (index!2302 (_ BitVec 32)) (x!4728 (_ BitVec 32))) (Undefined!45) (MissingVacant!45 (index!2303 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1079 (_ BitVec 32)) SeekEntryResult!45)

(assert (=> b!19288 (= res!13144 (= (seekEntryOrOpen!0 (select (arr!518 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000) (_keys!3105 (v!1503 (underlying!71 thiss!938))) (mask!4622 (v!1503 (underlying!71 thiss!938)))) (Found!45 #b00000000000000000000000000000000)))))

(assert (=> b!19288 (=> (not res!13144) (not e!12426))))

(declare-fun b!19289 () Bool)

(assert (=> b!19289 (= e!12428 call!889)))

(declare-fun b!19290 () Bool)

(assert (=> b!19290 (= e!12427 e!12428)))

(declare-fun c!2058 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19290 (= c!2058 (validKeyInArray!0 (select (arr!518 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19291 () Bool)

(assert (=> b!19291 (= e!12426 call!889)))

(assert (= (and d!3579 (not res!13143)) b!19290))

(assert (= (and b!19290 c!2058) b!19288))

(assert (= (and b!19290 (not c!2058)) b!19289))

(assert (= (and b!19288 res!13144) b!19291))

(assert (= (or b!19291 b!19289) bm!886))

(declare-fun m!13621 () Bool)

(assert (=> bm!886 m!13621))

(declare-fun m!13623 () Bool)

(assert (=> b!19288 m!13623))

(declare-fun m!13625 () Bool)

(assert (=> b!19288 m!13625))

(declare-fun m!13627 () Bool)

(assert (=> b!19288 m!13627))

(assert (=> b!19288 m!13623))

(declare-fun m!13629 () Bool)

(assert (=> b!19288 m!13629))

(assert (=> b!19290 m!13623))

(assert (=> b!19290 m!13623))

(declare-fun m!13631 () Bool)

(assert (=> b!19290 m!13631))

(assert (=> b!19264 d!3579))

(declare-fun bm!889 () Bool)

(declare-fun call!892 () (_ BitVec 32))

(assert (=> bm!889 (= call!892 (arrayCountValidKeys!0 (_keys!3105 (v!1503 (underlying!71 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938))))))))

(declare-fun b!19300 () Bool)

(declare-fun e!12433 () (_ BitVec 32))

(assert (=> b!19300 (= e!12433 (bvadd #b00000000000000000000000000000001 call!892))))

(declare-fun b!19301 () Bool)

(declare-fun e!12434 () (_ BitVec 32))

(assert (=> b!19301 (= e!12434 e!12433)))

(declare-fun c!2063 () Bool)

(assert (=> b!19301 (= c!2063 (validKeyInArray!0 (select (arr!518 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19303 () Bool)

(assert (=> b!19303 (= e!12433 call!892)))

(declare-fun b!19302 () Bool)

(assert (=> b!19302 (= e!12434 #b00000000000000000000000000000000)))

(declare-fun d!3581 () Bool)

(declare-fun lt!5412 () (_ BitVec 32))

(assert (=> d!3581 (and (bvsge lt!5412 #b00000000000000000000000000000000) (bvsle lt!5412 (bvsub (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (=> d!3581 (= lt!5412 e!12434)))

(declare-fun c!2064 () Bool)

(assert (=> d!3581 (= c!2064 (bvsge #b00000000000000000000000000000000 (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938))))))))

(assert (=> d!3581 (and (bvsle #b00000000000000000000000000000000 (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938))))))))

(assert (=> d!3581 (= (arrayCountValidKeys!0 (_keys!3105 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000000 (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938))))) lt!5412)))

(assert (= (and d!3581 c!2064) b!19302))

(assert (= (and d!3581 (not c!2064)) b!19301))

(assert (= (and b!19301 c!2063) b!19300))

(assert (= (and b!19301 (not c!2063)) b!19303))

(assert (= (or b!19300 b!19303) bm!889))

(declare-fun m!13633 () Bool)

(assert (=> bm!889 m!13633))

(assert (=> b!19301 m!13623))

(assert (=> b!19301 m!13623))

(assert (=> b!19301 m!13631))

(assert (=> b!19263 d!3581))

(declare-fun b!19314 () Bool)

(declare-fun e!12446 () Bool)

(declare-fun call!895 () Bool)

(assert (=> b!19314 (= e!12446 call!895)))

(declare-fun b!19315 () Bool)

(declare-fun e!12444 () Bool)

(declare-fun contains!219 (List!545 (_ BitVec 64)) Bool)

(assert (=> b!19315 (= e!12444 (contains!219 Nil!542 (select (arr!518 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19316 () Bool)

(declare-fun e!12445 () Bool)

(declare-fun e!12443 () Bool)

(assert (=> b!19316 (= e!12445 e!12443)))

(declare-fun res!13151 () Bool)

(assert (=> b!19316 (=> (not res!13151) (not e!12443))))

(assert (=> b!19316 (= res!13151 (not e!12444))))

(declare-fun res!13152 () Bool)

(assert (=> b!19316 (=> (not res!13152) (not e!12444))))

(assert (=> b!19316 (= res!13152 (validKeyInArray!0 (select (arr!518 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19317 () Bool)

(assert (=> b!19317 (= e!12446 call!895)))

(declare-fun d!3583 () Bool)

(declare-fun res!13153 () Bool)

(assert (=> d!3583 (=> res!13153 e!12445)))

(assert (=> d!3583 (= res!13153 (bvsge #b00000000000000000000000000000000 (size!609 (_keys!3105 (v!1503 (underlying!71 thiss!938))))))))

(assert (=> d!3583 (= (arrayNoDuplicates!0 (_keys!3105 (v!1503 (underlying!71 thiss!938))) #b00000000000000000000000000000000 Nil!542) e!12445)))

(declare-fun bm!892 () Bool)

(declare-fun c!2067 () Bool)

(assert (=> bm!892 (= call!895 (arrayNoDuplicates!0 (_keys!3105 (v!1503 (underlying!71 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2067 (Cons!541 (select (arr!518 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000) Nil!542) Nil!542)))))

(declare-fun b!19318 () Bool)

(assert (=> b!19318 (= e!12443 e!12446)))

(assert (=> b!19318 (= c!2067 (validKeyInArray!0 (select (arr!518 (_keys!3105 (v!1503 (underlying!71 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3583 (not res!13153)) b!19316))

(assert (= (and b!19316 res!13152) b!19315))

(assert (= (and b!19316 res!13151) b!19318))

(assert (= (and b!19318 c!2067) b!19317))

(assert (= (and b!19318 (not c!2067)) b!19314))

(assert (= (or b!19317 b!19314) bm!892))

(assert (=> b!19315 m!13623))

(assert (=> b!19315 m!13623))

(declare-fun m!13635 () Bool)

(assert (=> b!19315 m!13635))

(assert (=> b!19316 m!13623))

(assert (=> b!19316 m!13623))

(assert (=> b!19316 m!13631))

(assert (=> bm!892 m!13623))

(declare-fun m!13637 () Bool)

(assert (=> bm!892 m!13637))

(assert (=> b!19318 m!13623))

(assert (=> b!19318 m!13623))

(assert (=> b!19318 m!13631))

(assert (=> b!19265 d!3583))

(declare-fun b!19319 () Bool)

(declare-fun e!12448 () Bool)

(assert (=> b!19319 (= e!12448 tp_is_empty!933)))

(declare-fun b!19320 () Bool)

(declare-fun e!12447 () Bool)

(assert (=> b!19320 (= e!12447 tp_is_empty!933)))

(declare-fun condMapEmpty!854 () Bool)

(declare-fun mapDefault!854 () ValueCell!267)

(assert (=> mapNonEmpty!853 (= condMapEmpty!854 (= mapRest!853 ((as const (Array (_ BitVec 32) ValueCell!267)) mapDefault!854)))))

(declare-fun mapRes!854 () Bool)

(assert (=> mapNonEmpty!853 (= tp!3220 (and e!12447 mapRes!854))))

(declare-fun mapNonEmpty!854 () Bool)

(declare-fun tp!3221 () Bool)

(assert (=> mapNonEmpty!854 (= mapRes!854 (and tp!3221 e!12448))))

(declare-fun mapRest!854 () (Array (_ BitVec 32) ValueCell!267))

(declare-fun mapKey!854 () (_ BitVec 32))

(declare-fun mapValue!854 () ValueCell!267)

(assert (=> mapNonEmpty!854 (= mapRest!853 (store mapRest!854 mapKey!854 mapValue!854))))

(declare-fun mapIsEmpty!854 () Bool)

(assert (=> mapIsEmpty!854 mapRes!854))

(assert (= (and mapNonEmpty!853 condMapEmpty!854) mapIsEmpty!854))

(assert (= (and mapNonEmpty!853 (not condMapEmpty!854)) mapNonEmpty!854))

(assert (= (and mapNonEmpty!854 ((_ is ValueCellFull!267) mapValue!854)) b!19319))

(assert (= (and mapNonEmpty!853 ((_ is ValueCellFull!267) mapDefault!854)) b!19320))

(declare-fun m!13639 () Bool)

(assert (=> mapNonEmpty!854 m!13639))

(check-sat (not bm!889) (not mapNonEmpty!854) (not bm!886) (not b_next!669) tp_is_empty!933 (not b!19301) (not b!19277) (not bm!892) (not b!19288) (not b!19318) (not b!19290) (not b!19278) (not d!3577) (not b!19315) b_and!1329 (not b!19316))
(check-sat b_and!1329 (not b_next!669))
