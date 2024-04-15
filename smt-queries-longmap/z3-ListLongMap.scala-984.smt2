; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21246 () Bool)

(assert start!21246)

(declare-fun b!213899 () Bool)

(declare-fun b_free!5653 () Bool)

(declare-fun b_next!5653 () Bool)

(assert (=> b!213899 (= b_free!5653 (not b_next!5653))))

(declare-fun tp!20036 () Bool)

(declare-fun b_and!12517 () Bool)

(assert (=> b!213899 (= tp!20036 b_and!12517)))

(declare-fun b!213894 () Bool)

(declare-fun e!139070 () Bool)

(declare-datatypes ((V!7001 0))(
  ( (V!7002 (val!2802 Int)) )
))
(declare-datatypes ((ValueCell!2414 0))(
  ( (ValueCellFull!2414 (v!4814 V!7001)) (EmptyCell!2414) )
))
(declare-datatypes ((array!10227 0))(
  ( (array!10228 (arr!4851 (Array (_ BitVec 32) ValueCell!2414)) (size!5177 (_ BitVec 32))) )
))
(declare-datatypes ((array!10229 0))(
  ( (array!10230 (arr!4852 (Array (_ BitVec 32) (_ BitVec 64))) (size!5178 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2728 0))(
  ( (LongMapFixedSize!2729 (defaultEntry!4014 Int) (mask!9661 (_ BitVec 32)) (extraKeys!3751 (_ BitVec 32)) (zeroValue!3855 V!7001) (minValue!3855 V!7001) (_size!1413 (_ BitVec 32)) (_keys!6029 array!10229) (_values!3997 array!10227) (_vacant!1413 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2728)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!213894 (= e!139070 (not (validMask!0 (mask!9661 thiss!1504))))))

(declare-fun mapIsEmpty!9377 () Bool)

(declare-fun mapRes!9377 () Bool)

(assert (=> mapIsEmpty!9377 mapRes!9377))

(declare-fun b!213895 () Bool)

(declare-fun e!139074 () Bool)

(declare-fun tp_is_empty!5515 () Bool)

(assert (=> b!213895 (= e!139074 tp_is_empty!5515)))

(declare-fun res!104699 () Bool)

(assert (=> start!21246 (=> (not res!104699) (not e!139070))))

(declare-fun valid!1135 (LongMapFixedSize!2728) Bool)

(assert (=> start!21246 (= res!104699 (valid!1135 thiss!1504))))

(assert (=> start!21246 e!139070))

(declare-fun e!139071 () Bool)

(assert (=> start!21246 e!139071))

(assert (=> start!21246 true))

(declare-fun b!213896 () Bool)

(declare-fun res!104698 () Bool)

(assert (=> b!213896 (=> (not res!104698) (not e!139070))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!213896 (= res!104698 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213897 () Bool)

(declare-fun e!139072 () Bool)

(declare-fun e!139069 () Bool)

(assert (=> b!213897 (= e!139072 (and e!139069 mapRes!9377))))

(declare-fun condMapEmpty!9377 () Bool)

(declare-fun mapDefault!9377 () ValueCell!2414)

(assert (=> b!213897 (= condMapEmpty!9377 (= (arr!4851 (_values!3997 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2414)) mapDefault!9377)))))

(declare-fun mapNonEmpty!9377 () Bool)

(declare-fun tp!20035 () Bool)

(assert (=> mapNonEmpty!9377 (= mapRes!9377 (and tp!20035 e!139074))))

(declare-fun mapValue!9377 () ValueCell!2414)

(declare-fun mapRest!9377 () (Array (_ BitVec 32) ValueCell!2414))

(declare-fun mapKey!9377 () (_ BitVec 32))

(assert (=> mapNonEmpty!9377 (= (arr!4851 (_values!3997 thiss!1504)) (store mapRest!9377 mapKey!9377 mapValue!9377))))

(declare-fun b!213898 () Bool)

(assert (=> b!213898 (= e!139069 tp_is_empty!5515)))

(declare-fun array_inv!3187 (array!10229) Bool)

(declare-fun array_inv!3188 (array!10227) Bool)

(assert (=> b!213899 (= e!139071 (and tp!20036 tp_is_empty!5515 (array_inv!3187 (_keys!6029 thiss!1504)) (array_inv!3188 (_values!3997 thiss!1504)) e!139072))))

(assert (= (and start!21246 res!104699) b!213896))

(assert (= (and b!213896 res!104698) b!213894))

(assert (= (and b!213897 condMapEmpty!9377) mapIsEmpty!9377))

(assert (= (and b!213897 (not condMapEmpty!9377)) mapNonEmpty!9377))

(get-info :version)

(assert (= (and mapNonEmpty!9377 ((_ is ValueCellFull!2414) mapValue!9377)) b!213895))

(assert (= (and b!213897 ((_ is ValueCellFull!2414) mapDefault!9377)) b!213898))

(assert (= b!213899 b!213897))

(assert (= start!21246 b!213899))

(declare-fun m!241303 () Bool)

(assert (=> b!213894 m!241303))

(declare-fun m!241305 () Bool)

(assert (=> start!21246 m!241305))

(declare-fun m!241307 () Bool)

(assert (=> mapNonEmpty!9377 m!241307))

(declare-fun m!241309 () Bool)

(assert (=> b!213899 m!241309))

(declare-fun m!241311 () Bool)

(assert (=> b!213899 m!241311))

(check-sat tp_is_empty!5515 (not start!21246) b_and!12517 (not b_next!5653) (not b!213899) (not mapNonEmpty!9377) (not b!213894))
(check-sat b_and!12517 (not b_next!5653))
(get-model)

(declare-fun d!58113 () Bool)

(assert (=> d!58113 (= (array_inv!3187 (_keys!6029 thiss!1504)) (bvsge (size!5178 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!213899 d!58113))

(declare-fun d!58115 () Bool)

(assert (=> d!58115 (= (array_inv!3188 (_values!3997 thiss!1504)) (bvsge (size!5177 (_values!3997 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!213899 d!58115))

(declare-fun d!58117 () Bool)

(declare-fun res!104718 () Bool)

(declare-fun e!139113 () Bool)

(assert (=> d!58117 (=> (not res!104718) (not e!139113))))

(declare-fun simpleValid!207 (LongMapFixedSize!2728) Bool)

(assert (=> d!58117 (= res!104718 (simpleValid!207 thiss!1504))))

(assert (=> d!58117 (= (valid!1135 thiss!1504) e!139113)))

(declare-fun b!213942 () Bool)

(declare-fun res!104719 () Bool)

(assert (=> b!213942 (=> (not res!104719) (not e!139113))))

(declare-fun arrayCountValidKeys!0 (array!10229 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!213942 (= res!104719 (= (arrayCountValidKeys!0 (_keys!6029 thiss!1504) #b00000000000000000000000000000000 (size!5178 (_keys!6029 thiss!1504))) (_size!1413 thiss!1504)))))

(declare-fun b!213943 () Bool)

(declare-fun res!104720 () Bool)

(assert (=> b!213943 (=> (not res!104720) (not e!139113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10229 (_ BitVec 32)) Bool)

(assert (=> b!213943 (= res!104720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6029 thiss!1504) (mask!9661 thiss!1504)))))

(declare-fun b!213944 () Bool)

(declare-datatypes ((List!3113 0))(
  ( (Nil!3110) (Cons!3109 (h!3751 (_ BitVec 64)) (t!8059 List!3113)) )
))
(declare-fun arrayNoDuplicates!0 (array!10229 (_ BitVec 32) List!3113) Bool)

(assert (=> b!213944 (= e!139113 (arrayNoDuplicates!0 (_keys!6029 thiss!1504) #b00000000000000000000000000000000 Nil!3110))))

(assert (= (and d!58117 res!104718) b!213942))

(assert (= (and b!213942 res!104719) b!213943))

(assert (= (and b!213943 res!104720) b!213944))

(declare-fun m!241333 () Bool)

(assert (=> d!58117 m!241333))

(declare-fun m!241335 () Bool)

(assert (=> b!213942 m!241335))

(declare-fun m!241337 () Bool)

(assert (=> b!213943 m!241337))

(declare-fun m!241339 () Bool)

(assert (=> b!213944 m!241339))

(assert (=> start!21246 d!58117))

(declare-fun d!58119 () Bool)

(assert (=> d!58119 (= (validMask!0 (mask!9661 thiss!1504)) (and (or (= (mask!9661 thiss!1504) #b00000000000000000000000000000111) (= (mask!9661 thiss!1504) #b00000000000000000000000000001111) (= (mask!9661 thiss!1504) #b00000000000000000000000000011111) (= (mask!9661 thiss!1504) #b00000000000000000000000000111111) (= (mask!9661 thiss!1504) #b00000000000000000000000001111111) (= (mask!9661 thiss!1504) #b00000000000000000000000011111111) (= (mask!9661 thiss!1504) #b00000000000000000000000111111111) (= (mask!9661 thiss!1504) #b00000000000000000000001111111111) (= (mask!9661 thiss!1504) #b00000000000000000000011111111111) (= (mask!9661 thiss!1504) #b00000000000000000000111111111111) (= (mask!9661 thiss!1504) #b00000000000000000001111111111111) (= (mask!9661 thiss!1504) #b00000000000000000011111111111111) (= (mask!9661 thiss!1504) #b00000000000000000111111111111111) (= (mask!9661 thiss!1504) #b00000000000000001111111111111111) (= (mask!9661 thiss!1504) #b00000000000000011111111111111111) (= (mask!9661 thiss!1504) #b00000000000000111111111111111111) (= (mask!9661 thiss!1504) #b00000000000001111111111111111111) (= (mask!9661 thiss!1504) #b00000000000011111111111111111111) (= (mask!9661 thiss!1504) #b00000000000111111111111111111111) (= (mask!9661 thiss!1504) #b00000000001111111111111111111111) (= (mask!9661 thiss!1504) #b00000000011111111111111111111111) (= (mask!9661 thiss!1504) #b00000000111111111111111111111111) (= (mask!9661 thiss!1504) #b00000001111111111111111111111111) (= (mask!9661 thiss!1504) #b00000011111111111111111111111111) (= (mask!9661 thiss!1504) #b00000111111111111111111111111111) (= (mask!9661 thiss!1504) #b00001111111111111111111111111111) (= (mask!9661 thiss!1504) #b00011111111111111111111111111111) (= (mask!9661 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9661 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!213894 d!58119))

(declare-fun b!213952 () Bool)

(declare-fun e!139118 () Bool)

(assert (=> b!213952 (= e!139118 tp_is_empty!5515)))

(declare-fun mapIsEmpty!9386 () Bool)

(declare-fun mapRes!9386 () Bool)

(assert (=> mapIsEmpty!9386 mapRes!9386))

(declare-fun condMapEmpty!9386 () Bool)

(declare-fun mapDefault!9386 () ValueCell!2414)

(assert (=> mapNonEmpty!9377 (= condMapEmpty!9386 (= mapRest!9377 ((as const (Array (_ BitVec 32) ValueCell!2414)) mapDefault!9386)))))

(assert (=> mapNonEmpty!9377 (= tp!20035 (and e!139118 mapRes!9386))))

(declare-fun mapNonEmpty!9386 () Bool)

(declare-fun tp!20051 () Bool)

(declare-fun e!139119 () Bool)

(assert (=> mapNonEmpty!9386 (= mapRes!9386 (and tp!20051 e!139119))))

(declare-fun mapKey!9386 () (_ BitVec 32))

(declare-fun mapRest!9386 () (Array (_ BitVec 32) ValueCell!2414))

(declare-fun mapValue!9386 () ValueCell!2414)

(assert (=> mapNonEmpty!9386 (= mapRest!9377 (store mapRest!9386 mapKey!9386 mapValue!9386))))

(declare-fun b!213951 () Bool)

(assert (=> b!213951 (= e!139119 tp_is_empty!5515)))

(assert (= (and mapNonEmpty!9377 condMapEmpty!9386) mapIsEmpty!9386))

(assert (= (and mapNonEmpty!9377 (not condMapEmpty!9386)) mapNonEmpty!9386))

(assert (= (and mapNonEmpty!9386 ((_ is ValueCellFull!2414) mapValue!9386)) b!213951))

(assert (= (and mapNonEmpty!9377 ((_ is ValueCellFull!2414) mapDefault!9386)) b!213952))

(declare-fun m!241341 () Bool)

(assert (=> mapNonEmpty!9386 m!241341))

(check-sat tp_is_empty!5515 (not b!213942) b_and!12517 (not b_next!5653) (not b!213944) (not b!213943) (not mapNonEmpty!9386) (not d!58117))
(check-sat b_and!12517 (not b_next!5653))
(get-model)

(declare-fun b!213963 () Bool)

(declare-fun e!139129 () Bool)

(declare-fun call!20283 () Bool)

(assert (=> b!213963 (= e!139129 call!20283)))

(declare-fun d!58121 () Bool)

(declare-fun res!104728 () Bool)

(declare-fun e!139128 () Bool)

(assert (=> d!58121 (=> res!104728 e!139128)))

(assert (=> d!58121 (= res!104728 (bvsge #b00000000000000000000000000000000 (size!5178 (_keys!6029 thiss!1504))))))

(assert (=> d!58121 (= (arrayNoDuplicates!0 (_keys!6029 thiss!1504) #b00000000000000000000000000000000 Nil!3110) e!139128)))

(declare-fun b!213964 () Bool)

(declare-fun e!139130 () Bool)

(assert (=> b!213964 (= e!139128 e!139130)))

(declare-fun res!104727 () Bool)

(assert (=> b!213964 (=> (not res!104727) (not e!139130))))

(declare-fun e!139131 () Bool)

(assert (=> b!213964 (= res!104727 (not e!139131))))

(declare-fun res!104729 () Bool)

(assert (=> b!213964 (=> (not res!104729) (not e!139131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213964 (= res!104729 (validKeyInArray!0 (select (arr!4852 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!213965 () Bool)

(assert (=> b!213965 (= e!139129 call!20283)))

(declare-fun b!213966 () Bool)

(assert (=> b!213966 (= e!139130 e!139129)))

(declare-fun c!36000 () Bool)

(assert (=> b!213966 (= c!36000 (validKeyInArray!0 (select (arr!4852 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20280 () Bool)

(assert (=> bm!20280 (= call!20283 (arrayNoDuplicates!0 (_keys!6029 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36000 (Cons!3109 (select (arr!4852 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000) Nil!3110) Nil!3110)))))

(declare-fun b!213967 () Bool)

(declare-fun contains!1403 (List!3113 (_ BitVec 64)) Bool)

(assert (=> b!213967 (= e!139131 (contains!1403 Nil!3110 (select (arr!4852 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58121 (not res!104728)) b!213964))

(assert (= (and b!213964 res!104729) b!213967))

(assert (= (and b!213964 res!104727) b!213966))

(assert (= (and b!213966 c!36000) b!213965))

(assert (= (and b!213966 (not c!36000)) b!213963))

(assert (= (or b!213965 b!213963) bm!20280))

(declare-fun m!241343 () Bool)

(assert (=> b!213964 m!241343))

(assert (=> b!213964 m!241343))

(declare-fun m!241345 () Bool)

(assert (=> b!213964 m!241345))

(assert (=> b!213966 m!241343))

(assert (=> b!213966 m!241343))

(assert (=> b!213966 m!241345))

(assert (=> bm!20280 m!241343))

(declare-fun m!241347 () Bool)

(assert (=> bm!20280 m!241347))

(assert (=> b!213967 m!241343))

(assert (=> b!213967 m!241343))

(declare-fun m!241349 () Bool)

(assert (=> b!213967 m!241349))

(assert (=> b!213944 d!58121))

(declare-fun b!213976 () Bool)

(declare-fun e!139140 () Bool)

(declare-fun call!20286 () Bool)

(assert (=> b!213976 (= e!139140 call!20286)))

(declare-fun d!58123 () Bool)

(declare-fun res!104735 () Bool)

(declare-fun e!139138 () Bool)

(assert (=> d!58123 (=> res!104735 e!139138)))

(assert (=> d!58123 (= res!104735 (bvsge #b00000000000000000000000000000000 (size!5178 (_keys!6029 thiss!1504))))))

(assert (=> d!58123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6029 thiss!1504) (mask!9661 thiss!1504)) e!139138)))

(declare-fun b!213977 () Bool)

(declare-fun e!139139 () Bool)

(assert (=> b!213977 (= e!139139 e!139140)))

(declare-fun lt!110592 () (_ BitVec 64))

(assert (=> b!213977 (= lt!110592 (select (arr!4852 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6446 0))(
  ( (Unit!6447) )
))
(declare-fun lt!110593 () Unit!6446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10229 (_ BitVec 64) (_ BitVec 32)) Unit!6446)

(assert (=> b!213977 (= lt!110593 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6029 thiss!1504) lt!110592 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!213977 (arrayContainsKey!0 (_keys!6029 thiss!1504) lt!110592 #b00000000000000000000000000000000)))

(declare-fun lt!110594 () Unit!6446)

(assert (=> b!213977 (= lt!110594 lt!110593)))

(declare-fun res!104734 () Bool)

(declare-datatypes ((SeekEntryResult!717 0))(
  ( (MissingZero!717 (index!5038 (_ BitVec 32))) (Found!717 (index!5039 (_ BitVec 32))) (Intermediate!717 (undefined!1529 Bool) (index!5040 (_ BitVec 32)) (x!22297 (_ BitVec 32))) (Undefined!717) (MissingVacant!717 (index!5041 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10229 (_ BitVec 32)) SeekEntryResult!717)

(assert (=> b!213977 (= res!104734 (= (seekEntryOrOpen!0 (select (arr!4852 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000) (_keys!6029 thiss!1504) (mask!9661 thiss!1504)) (Found!717 #b00000000000000000000000000000000)))))

(assert (=> b!213977 (=> (not res!104734) (not e!139140))))

(declare-fun bm!20283 () Bool)

(assert (=> bm!20283 (= call!20286 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6029 thiss!1504) (mask!9661 thiss!1504)))))

(declare-fun b!213978 () Bool)

(assert (=> b!213978 (= e!139139 call!20286)))

(declare-fun b!213979 () Bool)

(assert (=> b!213979 (= e!139138 e!139139)))

(declare-fun c!36003 () Bool)

(assert (=> b!213979 (= c!36003 (validKeyInArray!0 (select (arr!4852 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58123 (not res!104735)) b!213979))

(assert (= (and b!213979 c!36003) b!213977))

(assert (= (and b!213979 (not c!36003)) b!213978))

(assert (= (and b!213977 res!104734) b!213976))

(assert (= (or b!213976 b!213978) bm!20283))

(assert (=> b!213977 m!241343))

(declare-fun m!241351 () Bool)

(assert (=> b!213977 m!241351))

(declare-fun m!241353 () Bool)

(assert (=> b!213977 m!241353))

(assert (=> b!213977 m!241343))

(declare-fun m!241355 () Bool)

(assert (=> b!213977 m!241355))

(declare-fun m!241357 () Bool)

(assert (=> bm!20283 m!241357))

(assert (=> b!213979 m!241343))

(assert (=> b!213979 m!241343))

(assert (=> b!213979 m!241345))

(assert (=> b!213943 d!58123))

(declare-fun b!213989 () Bool)

(declare-fun res!104744 () Bool)

(declare-fun e!139143 () Bool)

(assert (=> b!213989 (=> (not res!104744) (not e!139143))))

(declare-fun size!5183 (LongMapFixedSize!2728) (_ BitVec 32))

(assert (=> b!213989 (= res!104744 (bvsge (size!5183 thiss!1504) (_size!1413 thiss!1504)))))

(declare-fun b!213991 () Bool)

(assert (=> b!213991 (= e!139143 (and (bvsge (extraKeys!3751 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3751 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1413 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!213988 () Bool)

(declare-fun res!104747 () Bool)

(assert (=> b!213988 (=> (not res!104747) (not e!139143))))

(assert (=> b!213988 (= res!104747 (and (= (size!5177 (_values!3997 thiss!1504)) (bvadd (mask!9661 thiss!1504) #b00000000000000000000000000000001)) (= (size!5178 (_keys!6029 thiss!1504)) (size!5177 (_values!3997 thiss!1504))) (bvsge (_size!1413 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1413 thiss!1504) (bvadd (mask!9661 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!213990 () Bool)

(declare-fun res!104746 () Bool)

(assert (=> b!213990 (=> (not res!104746) (not e!139143))))

(assert (=> b!213990 (= res!104746 (= (size!5183 thiss!1504) (bvadd (_size!1413 thiss!1504) (bvsdiv (bvadd (extraKeys!3751 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!58125 () Bool)

(declare-fun res!104745 () Bool)

(assert (=> d!58125 (=> (not res!104745) (not e!139143))))

(assert (=> d!58125 (= res!104745 (validMask!0 (mask!9661 thiss!1504)))))

(assert (=> d!58125 (= (simpleValid!207 thiss!1504) e!139143)))

(assert (= (and d!58125 res!104745) b!213988))

(assert (= (and b!213988 res!104747) b!213989))

(assert (= (and b!213989 res!104744) b!213990))

(assert (= (and b!213990 res!104746) b!213991))

(declare-fun m!241359 () Bool)

(assert (=> b!213989 m!241359))

(assert (=> b!213990 m!241359))

(assert (=> d!58125 m!241303))

(assert (=> d!58117 d!58125))

(declare-fun b!214000 () Bool)

(declare-fun e!139149 () (_ BitVec 32))

(declare-fun call!20289 () (_ BitVec 32))

(assert (=> b!214000 (= e!139149 (bvadd #b00000000000000000000000000000001 call!20289))))

(declare-fun b!214001 () Bool)

(assert (=> b!214001 (= e!139149 call!20289)))

(declare-fun b!214002 () Bool)

(declare-fun e!139148 () (_ BitVec 32))

(assert (=> b!214002 (= e!139148 e!139149)))

(declare-fun c!36008 () Bool)

(assert (=> b!214002 (= c!36008 (validKeyInArray!0 (select (arr!4852 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20286 () Bool)

(assert (=> bm!20286 (= call!20289 (arrayCountValidKeys!0 (_keys!6029 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5178 (_keys!6029 thiss!1504))))))

(declare-fun b!214003 () Bool)

(assert (=> b!214003 (= e!139148 #b00000000000000000000000000000000)))

(declare-fun d!58127 () Bool)

(declare-fun lt!110597 () (_ BitVec 32))

(assert (=> d!58127 (and (bvsge lt!110597 #b00000000000000000000000000000000) (bvsle lt!110597 (bvsub (size!5178 (_keys!6029 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58127 (= lt!110597 e!139148)))

(declare-fun c!36009 () Bool)

(assert (=> d!58127 (= c!36009 (bvsge #b00000000000000000000000000000000 (size!5178 (_keys!6029 thiss!1504))))))

(assert (=> d!58127 (and (bvsle #b00000000000000000000000000000000 (size!5178 (_keys!6029 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5178 (_keys!6029 thiss!1504)) (size!5178 (_keys!6029 thiss!1504))))))

(assert (=> d!58127 (= (arrayCountValidKeys!0 (_keys!6029 thiss!1504) #b00000000000000000000000000000000 (size!5178 (_keys!6029 thiss!1504))) lt!110597)))

(assert (= (and d!58127 c!36009) b!214003))

(assert (= (and d!58127 (not c!36009)) b!214002))

(assert (= (and b!214002 c!36008) b!214000))

(assert (= (and b!214002 (not c!36008)) b!214001))

(assert (= (or b!214000 b!214001) bm!20286))

(assert (=> b!214002 m!241343))

(assert (=> b!214002 m!241343))

(assert (=> b!214002 m!241345))

(declare-fun m!241361 () Bool)

(assert (=> bm!20286 m!241361))

(assert (=> b!213942 d!58127))

(declare-fun b!214005 () Bool)

(declare-fun e!139150 () Bool)

(assert (=> b!214005 (= e!139150 tp_is_empty!5515)))

(declare-fun mapIsEmpty!9387 () Bool)

(declare-fun mapRes!9387 () Bool)

(assert (=> mapIsEmpty!9387 mapRes!9387))

(declare-fun condMapEmpty!9387 () Bool)

(declare-fun mapDefault!9387 () ValueCell!2414)

(assert (=> mapNonEmpty!9386 (= condMapEmpty!9387 (= mapRest!9386 ((as const (Array (_ BitVec 32) ValueCell!2414)) mapDefault!9387)))))

(assert (=> mapNonEmpty!9386 (= tp!20051 (and e!139150 mapRes!9387))))

(declare-fun mapNonEmpty!9387 () Bool)

(declare-fun tp!20052 () Bool)

(declare-fun e!139151 () Bool)

(assert (=> mapNonEmpty!9387 (= mapRes!9387 (and tp!20052 e!139151))))

(declare-fun mapKey!9387 () (_ BitVec 32))

(declare-fun mapValue!9387 () ValueCell!2414)

(declare-fun mapRest!9387 () (Array (_ BitVec 32) ValueCell!2414))

(assert (=> mapNonEmpty!9387 (= mapRest!9386 (store mapRest!9387 mapKey!9387 mapValue!9387))))

(declare-fun b!214004 () Bool)

(assert (=> b!214004 (= e!139151 tp_is_empty!5515)))

(assert (= (and mapNonEmpty!9386 condMapEmpty!9387) mapIsEmpty!9387))

(assert (= (and mapNonEmpty!9386 (not condMapEmpty!9387)) mapNonEmpty!9387))

(assert (= (and mapNonEmpty!9387 ((_ is ValueCellFull!2414) mapValue!9387)) b!214004))

(assert (= (and mapNonEmpty!9386 ((_ is ValueCellFull!2414) mapDefault!9387)) b!214005))

(declare-fun m!241363 () Bool)

(assert (=> mapNonEmpty!9387 m!241363))

(check-sat (not b!213989) (not mapNonEmpty!9387) (not b!213966) (not b!213967) b_and!12517 (not b_next!5653) (not d!58125) (not b!213990) (not b!213964) (not bm!20283) tp_is_empty!5515 (not b!213979) (not b!214002) (not b!213977) (not bm!20280) (not bm!20286))
(check-sat b_and!12517 (not b_next!5653))
