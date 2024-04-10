; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18040 () Bool)

(assert start!18040)

(declare-fun b!179648 () Bool)

(declare-fun b_free!4431 () Bool)

(declare-fun b_next!4431 () Bool)

(assert (=> b!179648 (= b_free!4431 (not b_next!4431))))

(declare-fun tp!16021 () Bool)

(declare-fun b_and!10963 () Bool)

(assert (=> b!179648 (= tp!16021 b_and!10963)))

(declare-fun b!179637 () Bool)

(declare-fun res!85089 () Bool)

(declare-fun e!118330 () Bool)

(assert (=> b!179637 (=> (not res!85089) (not e!118330))))

(declare-datatypes ((V!5251 0))(
  ( (V!5252 (val!2146 Int)) )
))
(declare-datatypes ((ValueCell!1758 0))(
  ( (ValueCellFull!1758 (v!4034 V!5251)) (EmptyCell!1758) )
))
(declare-datatypes ((array!7573 0))(
  ( (array!7574 (arr!3587 (Array (_ BitVec 32) (_ BitVec 64))) (size!3895 (_ BitVec 32))) )
))
(declare-datatypes ((array!7575 0))(
  ( (array!7576 (arr!3588 (Array (_ BitVec 32) ValueCell!1758)) (size!3896 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2424 0))(
  ( (LongMapFixedSize!2425 (defaultEntry!3687 Int) (mask!8673 (_ BitVec 32)) (extraKeys!3424 (_ BitVec 32)) (zeroValue!3528 V!5251) (minValue!3528 V!5251) (_size!1261 (_ BitVec 32)) (_keys!5576 array!7573) (_values!3670 array!7575) (_vacant!1261 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2424)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3336 0))(
  ( (tuple2!3337 (_1!1679 (_ BitVec 64)) (_2!1679 V!5251)) )
))
(declare-datatypes ((List!2279 0))(
  ( (Nil!2276) (Cons!2275 (h!2900 tuple2!3336) (t!7125 List!2279)) )
))
(declare-datatypes ((ListLongMap!2263 0))(
  ( (ListLongMap!2264 (toList!1147 List!2279)) )
))
(declare-fun contains!1222 (ListLongMap!2263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!799 (array!7573 array!7575 (_ BitVec 32) (_ BitVec 32) V!5251 V!5251 (_ BitVec 32) Int) ListLongMap!2263)

(assert (=> b!179637 (= res!85089 (not (contains!1222 (getCurrentListMap!799 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248)) key!828)))))

(declare-fun b!179638 () Bool)

(declare-fun res!85096 () Bool)

(assert (=> b!179638 (=> (not res!85096) (not e!118330))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!583 0))(
  ( (MissingZero!583 (index!4500 (_ BitVec 32))) (Found!583 (index!4501 (_ BitVec 32))) (Intermediate!583 (undefined!1395 Bool) (index!4502 (_ BitVec 32)) (x!19639 (_ BitVec 32))) (Undefined!583) (MissingVacant!583 (index!4503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7573 (_ BitVec 32)) SeekEntryResult!583)

(assert (=> b!179638 (= res!85096 ((_ is Undefined!583) (seekEntryOrOpen!0 key!828 (_keys!5576 thiss!1248) (mask!8673 thiss!1248))))))

(declare-fun b!179639 () Bool)

(declare-fun e!118329 () Bool)

(declare-fun tp_is_empty!4203 () Bool)

(assert (=> b!179639 (= e!118329 tp_is_empty!4203)))

(declare-fun res!85095 () Bool)

(assert (=> start!18040 (=> (not res!85095) (not e!118330))))

(declare-fun valid!1012 (LongMapFixedSize!2424) Bool)

(assert (=> start!18040 (= res!85095 (valid!1012 thiss!1248))))

(assert (=> start!18040 e!118330))

(declare-fun e!118325 () Bool)

(assert (=> start!18040 e!118325))

(assert (=> start!18040 true))

(declare-fun b!179640 () Bool)

(declare-fun res!85092 () Bool)

(assert (=> b!179640 (=> (not res!85092) (not e!118330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179640 (= res!85092 (validMask!0 (mask!8673 thiss!1248)))))

(declare-fun b!179641 () Bool)

(declare-fun res!85091 () Bool)

(assert (=> b!179641 (=> (not res!85091) (not e!118330))))

(assert (=> b!179641 (= res!85091 (and (= (size!3896 (_values!3670 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8673 thiss!1248))) (= (size!3895 (_keys!5576 thiss!1248)) (size!3896 (_values!3670 thiss!1248))) (bvsge (mask!8673 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3424 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3424 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!179642 () Bool)

(declare-fun res!85090 () Bool)

(assert (=> b!179642 (=> (not res!85090) (not e!118330))))

(declare-datatypes ((List!2280 0))(
  ( (Nil!2277) (Cons!2276 (h!2901 (_ BitVec 64)) (t!7126 List!2280)) )
))
(declare-fun arrayNoDuplicates!0 (array!7573 (_ BitVec 32) List!2280) Bool)

(assert (=> b!179642 (= res!85090 (arrayNoDuplicates!0 (_keys!5576 thiss!1248) #b00000000000000000000000000000000 Nil!2277))))

(declare-fun b!179643 () Bool)

(declare-fun res!85093 () Bool)

(assert (=> b!179643 (=> (not res!85093) (not e!118330))))

(assert (=> b!179643 (= res!85093 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179644 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179644 (= e!118330 (not (validKeyInArray!0 key!828)))))

(declare-fun b!179645 () Bool)

(declare-fun res!85094 () Bool)

(assert (=> b!179645 (=> (not res!85094) (not e!118330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7573 (_ BitVec 32)) Bool)

(assert (=> b!179645 (= res!85094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5576 thiss!1248) (mask!8673 thiss!1248)))))

(declare-fun b!179646 () Bool)

(declare-fun e!118327 () Bool)

(assert (=> b!179646 (= e!118327 tp_is_empty!4203)))

(declare-fun b!179647 () Bool)

(declare-fun e!118328 () Bool)

(declare-fun mapRes!7195 () Bool)

(assert (=> b!179647 (= e!118328 (and e!118329 mapRes!7195))))

(declare-fun condMapEmpty!7195 () Bool)

(declare-fun mapDefault!7195 () ValueCell!1758)

(assert (=> b!179647 (= condMapEmpty!7195 (= (arr!3588 (_values!3670 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1758)) mapDefault!7195)))))

(declare-fun array_inv!2311 (array!7573) Bool)

(declare-fun array_inv!2312 (array!7575) Bool)

(assert (=> b!179648 (= e!118325 (and tp!16021 tp_is_empty!4203 (array_inv!2311 (_keys!5576 thiss!1248)) (array_inv!2312 (_values!3670 thiss!1248)) e!118328))))

(declare-fun mapNonEmpty!7195 () Bool)

(declare-fun tp!16020 () Bool)

(assert (=> mapNonEmpty!7195 (= mapRes!7195 (and tp!16020 e!118327))))

(declare-fun mapRest!7195 () (Array (_ BitVec 32) ValueCell!1758))

(declare-fun mapKey!7195 () (_ BitVec 32))

(declare-fun mapValue!7195 () ValueCell!1758)

(assert (=> mapNonEmpty!7195 (= (arr!3588 (_values!3670 thiss!1248)) (store mapRest!7195 mapKey!7195 mapValue!7195))))

(declare-fun mapIsEmpty!7195 () Bool)

(assert (=> mapIsEmpty!7195 mapRes!7195))

(assert (= (and start!18040 res!85095) b!179643))

(assert (= (and b!179643 res!85093) b!179638))

(assert (= (and b!179638 res!85096) b!179637))

(assert (= (and b!179637 res!85089) b!179640))

(assert (= (and b!179640 res!85092) b!179641))

(assert (= (and b!179641 res!85091) b!179645))

(assert (= (and b!179645 res!85094) b!179642))

(assert (= (and b!179642 res!85090) b!179644))

(assert (= (and b!179647 condMapEmpty!7195) mapIsEmpty!7195))

(assert (= (and b!179647 (not condMapEmpty!7195)) mapNonEmpty!7195))

(assert (= (and mapNonEmpty!7195 ((_ is ValueCellFull!1758) mapValue!7195)) b!179646))

(assert (= (and b!179647 ((_ is ValueCellFull!1758) mapDefault!7195)) b!179639))

(assert (= b!179648 b!179647))

(assert (= start!18040 b!179648))

(declare-fun m!207823 () Bool)

(assert (=> b!179645 m!207823))

(declare-fun m!207825 () Bool)

(assert (=> b!179638 m!207825))

(declare-fun m!207827 () Bool)

(assert (=> b!179648 m!207827))

(declare-fun m!207829 () Bool)

(assert (=> b!179648 m!207829))

(declare-fun m!207831 () Bool)

(assert (=> b!179637 m!207831))

(assert (=> b!179637 m!207831))

(declare-fun m!207833 () Bool)

(assert (=> b!179637 m!207833))

(declare-fun m!207835 () Bool)

(assert (=> mapNonEmpty!7195 m!207835))

(declare-fun m!207837 () Bool)

(assert (=> start!18040 m!207837))

(declare-fun m!207839 () Bool)

(assert (=> b!179640 m!207839))

(declare-fun m!207841 () Bool)

(assert (=> b!179644 m!207841))

(declare-fun m!207843 () Bool)

(assert (=> b!179642 m!207843))

(check-sat (not mapNonEmpty!7195) (not b!179642) (not b!179645) (not b!179640) (not b_next!4431) (not b!179638) tp_is_empty!4203 (not b!179637) (not b!179648) (not start!18040) b_and!10963 (not b!179644))
(check-sat b_and!10963 (not b_next!4431))
(get-model)

(declare-fun d!54163 () Bool)

(declare-fun res!85127 () Bool)

(declare-fun e!118351 () Bool)

(assert (=> d!54163 (=> (not res!85127) (not e!118351))))

(declare-fun simpleValid!162 (LongMapFixedSize!2424) Bool)

(assert (=> d!54163 (= res!85127 (simpleValid!162 thiss!1248))))

(assert (=> d!54163 (= (valid!1012 thiss!1248) e!118351)))

(declare-fun b!179691 () Bool)

(declare-fun res!85128 () Bool)

(assert (=> b!179691 (=> (not res!85128) (not e!118351))))

(declare-fun arrayCountValidKeys!0 (array!7573 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179691 (= res!85128 (= (arrayCountValidKeys!0 (_keys!5576 thiss!1248) #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))) (_size!1261 thiss!1248)))))

(declare-fun b!179692 () Bool)

(declare-fun res!85129 () Bool)

(assert (=> b!179692 (=> (not res!85129) (not e!118351))))

(assert (=> b!179692 (= res!85129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5576 thiss!1248) (mask!8673 thiss!1248)))))

(declare-fun b!179693 () Bool)

(assert (=> b!179693 (= e!118351 (arrayNoDuplicates!0 (_keys!5576 thiss!1248) #b00000000000000000000000000000000 Nil!2277))))

(assert (= (and d!54163 res!85127) b!179691))

(assert (= (and b!179691 res!85128) b!179692))

(assert (= (and b!179692 res!85129) b!179693))

(declare-fun m!207867 () Bool)

(assert (=> d!54163 m!207867))

(declare-fun m!207869 () Bool)

(assert (=> b!179691 m!207869))

(assert (=> b!179692 m!207823))

(assert (=> b!179693 m!207843))

(assert (=> start!18040 d!54163))

(declare-fun d!54165 () Bool)

(assert (=> d!54165 (= (validMask!0 (mask!8673 thiss!1248)) (and (or (= (mask!8673 thiss!1248) #b00000000000000000000000000000111) (= (mask!8673 thiss!1248) #b00000000000000000000000000001111) (= (mask!8673 thiss!1248) #b00000000000000000000000000011111) (= (mask!8673 thiss!1248) #b00000000000000000000000000111111) (= (mask!8673 thiss!1248) #b00000000000000000000000001111111) (= (mask!8673 thiss!1248) #b00000000000000000000000011111111) (= (mask!8673 thiss!1248) #b00000000000000000000000111111111) (= (mask!8673 thiss!1248) #b00000000000000000000001111111111) (= (mask!8673 thiss!1248) #b00000000000000000000011111111111) (= (mask!8673 thiss!1248) #b00000000000000000000111111111111) (= (mask!8673 thiss!1248) #b00000000000000000001111111111111) (= (mask!8673 thiss!1248) #b00000000000000000011111111111111) (= (mask!8673 thiss!1248) #b00000000000000000111111111111111) (= (mask!8673 thiss!1248) #b00000000000000001111111111111111) (= (mask!8673 thiss!1248) #b00000000000000011111111111111111) (= (mask!8673 thiss!1248) #b00000000000000111111111111111111) (= (mask!8673 thiss!1248) #b00000000000001111111111111111111) (= (mask!8673 thiss!1248) #b00000000000011111111111111111111) (= (mask!8673 thiss!1248) #b00000000000111111111111111111111) (= (mask!8673 thiss!1248) #b00000000001111111111111111111111) (= (mask!8673 thiss!1248) #b00000000011111111111111111111111) (= (mask!8673 thiss!1248) #b00000000111111111111111111111111) (= (mask!8673 thiss!1248) #b00000001111111111111111111111111) (= (mask!8673 thiss!1248) #b00000011111111111111111111111111) (= (mask!8673 thiss!1248) #b00000111111111111111111111111111) (= (mask!8673 thiss!1248) #b00001111111111111111111111111111) (= (mask!8673 thiss!1248) #b00011111111111111111111111111111) (= (mask!8673 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8673 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179640 d!54165))

(declare-fun bm!18148 () Bool)

(declare-fun call!18151 () Bool)

(assert (=> bm!18148 (= call!18151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5576 thiss!1248) (mask!8673 thiss!1248)))))

(declare-fun b!179703 () Bool)

(declare-fun e!118360 () Bool)

(declare-fun e!118359 () Bool)

(assert (=> b!179703 (= e!118360 e!118359)))

(declare-fun c!32204 () Bool)

(assert (=> b!179703 (= c!32204 (validKeyInArray!0 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179702 () Bool)

(declare-fun e!118358 () Bool)

(assert (=> b!179702 (= e!118358 call!18151)))

(declare-fun d!54167 () Bool)

(declare-fun res!85135 () Bool)

(assert (=> d!54167 (=> res!85135 e!118360)))

(assert (=> d!54167 (= res!85135 (bvsge #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))))))

(assert (=> d!54167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5576 thiss!1248) (mask!8673 thiss!1248)) e!118360)))

(declare-fun b!179704 () Bool)

(assert (=> b!179704 (= e!118359 e!118358)))

(declare-fun lt!88748 () (_ BitVec 64))

(assert (=> b!179704 (= lt!88748 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5468 0))(
  ( (Unit!5469) )
))
(declare-fun lt!88747 () Unit!5468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7573 (_ BitVec 64) (_ BitVec 32)) Unit!5468)

(assert (=> b!179704 (= lt!88747 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5576 thiss!1248) lt!88748 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179704 (arrayContainsKey!0 (_keys!5576 thiss!1248) lt!88748 #b00000000000000000000000000000000)))

(declare-fun lt!88746 () Unit!5468)

(assert (=> b!179704 (= lt!88746 lt!88747)))

(declare-fun res!85134 () Bool)

(assert (=> b!179704 (= res!85134 (= (seekEntryOrOpen!0 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000) (_keys!5576 thiss!1248) (mask!8673 thiss!1248)) (Found!583 #b00000000000000000000000000000000)))))

(assert (=> b!179704 (=> (not res!85134) (not e!118358))))

(declare-fun b!179705 () Bool)

(assert (=> b!179705 (= e!118359 call!18151)))

(assert (= (and d!54167 (not res!85135)) b!179703))

(assert (= (and b!179703 c!32204) b!179704))

(assert (= (and b!179703 (not c!32204)) b!179705))

(assert (= (and b!179704 res!85134) b!179702))

(assert (= (or b!179702 b!179705) bm!18148))

(declare-fun m!207871 () Bool)

(assert (=> bm!18148 m!207871))

(declare-fun m!207873 () Bool)

(assert (=> b!179703 m!207873))

(assert (=> b!179703 m!207873))

(declare-fun m!207875 () Bool)

(assert (=> b!179703 m!207875))

(assert (=> b!179704 m!207873))

(declare-fun m!207877 () Bool)

(assert (=> b!179704 m!207877))

(declare-fun m!207879 () Bool)

(assert (=> b!179704 m!207879))

(assert (=> b!179704 m!207873))

(declare-fun m!207881 () Bool)

(assert (=> b!179704 m!207881))

(assert (=> b!179645 d!54167))

(declare-fun b!179718 () Bool)

(declare-fun c!32211 () Bool)

(declare-fun lt!88755 () (_ BitVec 64))

(assert (=> b!179718 (= c!32211 (= lt!88755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118368 () SeekEntryResult!583)

(declare-fun e!118369 () SeekEntryResult!583)

(assert (=> b!179718 (= e!118368 e!118369)))

(declare-fun lt!88757 () SeekEntryResult!583)

(declare-fun b!179719 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7573 (_ BitVec 32)) SeekEntryResult!583)

(assert (=> b!179719 (= e!118369 (seekKeyOrZeroReturnVacant!0 (x!19639 lt!88757) (index!4502 lt!88757) (index!4502 lt!88757) key!828 (_keys!5576 thiss!1248) (mask!8673 thiss!1248)))))

(declare-fun d!54169 () Bool)

(declare-fun lt!88756 () SeekEntryResult!583)

(assert (=> d!54169 (and (or ((_ is Undefined!583) lt!88756) (not ((_ is Found!583) lt!88756)) (and (bvsge (index!4501 lt!88756) #b00000000000000000000000000000000) (bvslt (index!4501 lt!88756) (size!3895 (_keys!5576 thiss!1248))))) (or ((_ is Undefined!583) lt!88756) ((_ is Found!583) lt!88756) (not ((_ is MissingZero!583) lt!88756)) (and (bvsge (index!4500 lt!88756) #b00000000000000000000000000000000) (bvslt (index!4500 lt!88756) (size!3895 (_keys!5576 thiss!1248))))) (or ((_ is Undefined!583) lt!88756) ((_ is Found!583) lt!88756) ((_ is MissingZero!583) lt!88756) (not ((_ is MissingVacant!583) lt!88756)) (and (bvsge (index!4503 lt!88756) #b00000000000000000000000000000000) (bvslt (index!4503 lt!88756) (size!3895 (_keys!5576 thiss!1248))))) (or ((_ is Undefined!583) lt!88756) (ite ((_ is Found!583) lt!88756) (= (select (arr!3587 (_keys!5576 thiss!1248)) (index!4501 lt!88756)) key!828) (ite ((_ is MissingZero!583) lt!88756) (= (select (arr!3587 (_keys!5576 thiss!1248)) (index!4500 lt!88756)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!583) lt!88756) (= (select (arr!3587 (_keys!5576 thiss!1248)) (index!4503 lt!88756)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118367 () SeekEntryResult!583)

(assert (=> d!54169 (= lt!88756 e!118367)))

(declare-fun c!32213 () Bool)

(assert (=> d!54169 (= c!32213 (and ((_ is Intermediate!583) lt!88757) (undefined!1395 lt!88757)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7573 (_ BitVec 32)) SeekEntryResult!583)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54169 (= lt!88757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8673 thiss!1248)) key!828 (_keys!5576 thiss!1248) (mask!8673 thiss!1248)))))

(assert (=> d!54169 (validMask!0 (mask!8673 thiss!1248))))

(assert (=> d!54169 (= (seekEntryOrOpen!0 key!828 (_keys!5576 thiss!1248) (mask!8673 thiss!1248)) lt!88756)))

(declare-fun b!179720 () Bool)

(assert (=> b!179720 (= e!118367 Undefined!583)))

(declare-fun b!179721 () Bool)

(assert (=> b!179721 (= e!118368 (Found!583 (index!4502 lt!88757)))))

(declare-fun b!179722 () Bool)

(assert (=> b!179722 (= e!118367 e!118368)))

(assert (=> b!179722 (= lt!88755 (select (arr!3587 (_keys!5576 thiss!1248)) (index!4502 lt!88757)))))

(declare-fun c!32212 () Bool)

(assert (=> b!179722 (= c!32212 (= lt!88755 key!828))))

(declare-fun b!179723 () Bool)

(assert (=> b!179723 (= e!118369 (MissingZero!583 (index!4502 lt!88757)))))

(assert (= (and d!54169 c!32213) b!179720))

(assert (= (and d!54169 (not c!32213)) b!179722))

(assert (= (and b!179722 c!32212) b!179721))

(assert (= (and b!179722 (not c!32212)) b!179718))

(assert (= (and b!179718 c!32211) b!179723))

(assert (= (and b!179718 (not c!32211)) b!179719))

(declare-fun m!207883 () Bool)

(assert (=> b!179719 m!207883))

(declare-fun m!207885 () Bool)

(assert (=> d!54169 m!207885))

(assert (=> d!54169 m!207839))

(declare-fun m!207887 () Bool)

(assert (=> d!54169 m!207887))

(declare-fun m!207889 () Bool)

(assert (=> d!54169 m!207889))

(declare-fun m!207891 () Bool)

(assert (=> d!54169 m!207891))

(assert (=> d!54169 m!207885))

(declare-fun m!207893 () Bool)

(assert (=> d!54169 m!207893))

(declare-fun m!207895 () Bool)

(assert (=> b!179722 m!207895))

(assert (=> b!179638 d!54169))

(declare-fun d!54171 () Bool)

(assert (=> d!54171 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179644 d!54171))

(declare-fun b!179734 () Bool)

(declare-fun e!118381 () Bool)

(declare-fun e!118378 () Bool)

(assert (=> b!179734 (= e!118381 e!118378)))

(declare-fun c!32216 () Bool)

(assert (=> b!179734 (= c!32216 (validKeyInArray!0 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18151 () Bool)

(declare-fun call!18154 () Bool)

(assert (=> bm!18151 (= call!18154 (arrayNoDuplicates!0 (_keys!5576 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32216 (Cons!2276 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000) Nil!2277) Nil!2277)))))

(declare-fun b!179735 () Bool)

(declare-fun e!118379 () Bool)

(assert (=> b!179735 (= e!118379 e!118381)))

(declare-fun res!85144 () Bool)

(assert (=> b!179735 (=> (not res!85144) (not e!118381))))

(declare-fun e!118380 () Bool)

(assert (=> b!179735 (= res!85144 (not e!118380))))

(declare-fun res!85142 () Bool)

(assert (=> b!179735 (=> (not res!85142) (not e!118380))))

(assert (=> b!179735 (= res!85142 (validKeyInArray!0 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54173 () Bool)

(declare-fun res!85143 () Bool)

(assert (=> d!54173 (=> res!85143 e!118379)))

(assert (=> d!54173 (= res!85143 (bvsge #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))))))

(assert (=> d!54173 (= (arrayNoDuplicates!0 (_keys!5576 thiss!1248) #b00000000000000000000000000000000 Nil!2277) e!118379)))

(declare-fun b!179736 () Bool)

(assert (=> b!179736 (= e!118378 call!18154)))

(declare-fun b!179737 () Bool)

(declare-fun contains!1223 (List!2280 (_ BitVec 64)) Bool)

(assert (=> b!179737 (= e!118380 (contains!1223 Nil!2277 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179738 () Bool)

(assert (=> b!179738 (= e!118378 call!18154)))

(assert (= (and d!54173 (not res!85143)) b!179735))

(assert (= (and b!179735 res!85142) b!179737))

(assert (= (and b!179735 res!85144) b!179734))

(assert (= (and b!179734 c!32216) b!179736))

(assert (= (and b!179734 (not c!32216)) b!179738))

(assert (= (or b!179736 b!179738) bm!18151))

(assert (=> b!179734 m!207873))

(assert (=> b!179734 m!207873))

(assert (=> b!179734 m!207875))

(assert (=> bm!18151 m!207873))

(declare-fun m!207897 () Bool)

(assert (=> bm!18151 m!207897))

(assert (=> b!179735 m!207873))

(assert (=> b!179735 m!207873))

(assert (=> b!179735 m!207875))

(assert (=> b!179737 m!207873))

(assert (=> b!179737 m!207873))

(declare-fun m!207899 () Bool)

(assert (=> b!179737 m!207899))

(assert (=> b!179642 d!54173))

(declare-fun d!54175 () Bool)

(assert (=> d!54175 (= (array_inv!2311 (_keys!5576 thiss!1248)) (bvsge (size!3895 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179648 d!54175))

(declare-fun d!54177 () Bool)

(assert (=> d!54177 (= (array_inv!2312 (_values!3670 thiss!1248)) (bvsge (size!3896 (_values!3670 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179648 d!54177))

(declare-fun d!54179 () Bool)

(declare-fun e!118386 () Bool)

(assert (=> d!54179 e!118386))

(declare-fun res!85147 () Bool)

(assert (=> d!54179 (=> res!85147 e!118386)))

(declare-fun lt!88769 () Bool)

(assert (=> d!54179 (= res!85147 (not lt!88769))))

(declare-fun lt!88766 () Bool)

(assert (=> d!54179 (= lt!88769 lt!88766)))

(declare-fun lt!88768 () Unit!5468)

(declare-fun e!118387 () Unit!5468)

(assert (=> d!54179 (= lt!88768 e!118387)))

(declare-fun c!32219 () Bool)

(assert (=> d!54179 (= c!32219 lt!88766)))

(declare-fun containsKey!207 (List!2279 (_ BitVec 64)) Bool)

(assert (=> d!54179 (= lt!88766 (containsKey!207 (toList!1147 (getCurrentListMap!799 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248))) key!828))))

(assert (=> d!54179 (= (contains!1222 (getCurrentListMap!799 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248)) key!828) lt!88769)))

(declare-fun b!179745 () Bool)

(declare-fun lt!88767 () Unit!5468)

(assert (=> b!179745 (= e!118387 lt!88767)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!155 (List!2279 (_ BitVec 64)) Unit!5468)

(assert (=> b!179745 (= lt!88767 (lemmaContainsKeyImpliesGetValueByKeyDefined!155 (toList!1147 (getCurrentListMap!799 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248))) key!828))))

(declare-datatypes ((Option!209 0))(
  ( (Some!208 (v!4036 V!5251)) (None!207) )
))
(declare-fun isDefined!156 (Option!209) Bool)

(declare-fun getValueByKey!203 (List!2279 (_ BitVec 64)) Option!209)

(assert (=> b!179745 (isDefined!156 (getValueByKey!203 (toList!1147 (getCurrentListMap!799 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248))) key!828))))

(declare-fun b!179746 () Bool)

(declare-fun Unit!5470 () Unit!5468)

(assert (=> b!179746 (= e!118387 Unit!5470)))

(declare-fun b!179747 () Bool)

(assert (=> b!179747 (= e!118386 (isDefined!156 (getValueByKey!203 (toList!1147 (getCurrentListMap!799 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248))) key!828)))))

(assert (= (and d!54179 c!32219) b!179745))

(assert (= (and d!54179 (not c!32219)) b!179746))

(assert (= (and d!54179 (not res!85147)) b!179747))

(declare-fun m!207901 () Bool)

(assert (=> d!54179 m!207901))

(declare-fun m!207903 () Bool)

(assert (=> b!179745 m!207903))

(declare-fun m!207905 () Bool)

(assert (=> b!179745 m!207905))

(assert (=> b!179745 m!207905))

(declare-fun m!207907 () Bool)

(assert (=> b!179745 m!207907))

(assert (=> b!179747 m!207905))

(assert (=> b!179747 m!207905))

(assert (=> b!179747 m!207907))

(assert (=> b!179637 d!54179))

(declare-fun b!179790 () Bool)

(declare-fun e!118426 () Bool)

(declare-fun lt!88825 () ListLongMap!2263)

(declare-fun apply!148 (ListLongMap!2263 (_ BitVec 64)) V!5251)

(assert (=> b!179790 (= e!118426 (= (apply!148 lt!88825 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3528 thiss!1248)))))

(declare-fun bm!18166 () Bool)

(declare-fun call!18174 () ListLongMap!2263)

(declare-fun call!18172 () ListLongMap!2263)

(assert (=> bm!18166 (= call!18174 call!18172)))

(declare-fun b!179791 () Bool)

(declare-fun e!118419 () Bool)

(declare-fun e!118416 () Bool)

(assert (=> b!179791 (= e!118419 e!118416)))

(declare-fun res!85170 () Bool)

(declare-fun call!18171 () Bool)

(assert (=> b!179791 (= res!85170 call!18171)))

(assert (=> b!179791 (=> (not res!85170) (not e!118416))))

(declare-fun b!179792 () Bool)

(declare-fun e!118424 () Bool)

(assert (=> b!179792 (= e!118424 (validKeyInArray!0 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179793 () Bool)

(assert (=> b!179793 (= e!118416 (= (apply!148 lt!88825 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3528 thiss!1248)))))

(declare-fun c!32237 () Bool)

(declare-fun c!32236 () Bool)

(declare-fun call!18170 () ListLongMap!2263)

(declare-fun bm!18167 () Bool)

(declare-fun call!18175 () ListLongMap!2263)

(declare-fun +!265 (ListLongMap!2263 tuple2!3336) ListLongMap!2263)

(assert (=> bm!18167 (= call!18175 (+!265 (ite c!32236 call!18170 (ite c!32237 call!18172 call!18174)) (ite (or c!32236 c!32237) (tuple2!3337 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3528 thiss!1248)) (tuple2!3337 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3528 thiss!1248)))))))

(declare-fun b!179794 () Bool)

(declare-fun e!118414 () ListLongMap!2263)

(assert (=> b!179794 (= e!118414 (+!265 call!18175 (tuple2!3337 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3528 thiss!1248))))))

(declare-fun b!179795 () Bool)

(declare-fun e!118418 () ListLongMap!2263)

(assert (=> b!179795 (= e!118414 e!118418)))

(assert (=> b!179795 (= c!32237 (and (not (= (bvand (extraKeys!3424 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3424 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18168 () Bool)

(assert (=> bm!18168 (= call!18171 (contains!1222 lt!88825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179796 () Bool)

(declare-fun e!118421 () Bool)

(declare-fun get!2053 (ValueCell!1758 V!5251) V!5251)

(declare-fun dynLambda!491 (Int (_ BitVec 64)) V!5251)

(assert (=> b!179796 (= e!118421 (= (apply!148 lt!88825 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000)) (get!2053 (select (arr!3588 (_values!3670 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!491 (defaultEntry!3687 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3896 (_values!3670 thiss!1248))))))

(assert (=> b!179796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))))))

(declare-fun d!54181 () Bool)

(declare-fun e!118415 () Bool)

(assert (=> d!54181 e!118415))

(declare-fun res!85174 () Bool)

(assert (=> d!54181 (=> (not res!85174) (not e!118415))))

(assert (=> d!54181 (= res!85174 (or (bvsge #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))))))))

(declare-fun lt!88834 () ListLongMap!2263)

(assert (=> d!54181 (= lt!88825 lt!88834)))

(declare-fun lt!88833 () Unit!5468)

(declare-fun e!118417 () Unit!5468)

(assert (=> d!54181 (= lt!88833 e!118417)))

(declare-fun c!32234 () Bool)

(declare-fun e!118420 () Bool)

(assert (=> d!54181 (= c!32234 e!118420)))

(declare-fun res!85166 () Bool)

(assert (=> d!54181 (=> (not res!85166) (not e!118420))))

(assert (=> d!54181 (= res!85166 (bvslt #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))))))

(assert (=> d!54181 (= lt!88834 e!118414)))

(assert (=> d!54181 (= c!32236 (and (not (= (bvand (extraKeys!3424 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3424 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54181 (validMask!0 (mask!8673 thiss!1248))))

(assert (=> d!54181 (= (getCurrentListMap!799 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248)) lt!88825)))

(declare-fun bm!18169 () Bool)

(declare-fun call!18173 () Bool)

(assert (=> bm!18169 (= call!18173 (contains!1222 lt!88825 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179797 () Bool)

(declare-fun e!118423 () ListLongMap!2263)

(assert (=> b!179797 (= e!118423 call!18174)))

(declare-fun bm!18170 () Bool)

(declare-fun call!18169 () ListLongMap!2263)

(assert (=> bm!18170 (= call!18169 call!18175)))

(declare-fun b!179798 () Bool)

(declare-fun e!118425 () Bool)

(assert (=> b!179798 (= e!118415 e!118425)))

(declare-fun c!32233 () Bool)

(assert (=> b!179798 (= c!32233 (not (= (bvand (extraKeys!3424 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179799 () Bool)

(declare-fun res!85173 () Bool)

(assert (=> b!179799 (=> (not res!85173) (not e!118415))))

(assert (=> b!179799 (= res!85173 e!118419)))

(declare-fun c!32232 () Bool)

(assert (=> b!179799 (= c!32232 (not (= (bvand (extraKeys!3424 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!179800 () Bool)

(declare-fun res!85169 () Bool)

(assert (=> b!179800 (=> (not res!85169) (not e!118415))))

(declare-fun e!118422 () Bool)

(assert (=> b!179800 (= res!85169 e!118422)))

(declare-fun res!85171 () Bool)

(assert (=> b!179800 (=> res!85171 e!118422)))

(assert (=> b!179800 (= res!85171 (not e!118424))))

(declare-fun res!85172 () Bool)

(assert (=> b!179800 (=> (not res!85172) (not e!118424))))

(assert (=> b!179800 (= res!85172 (bvslt #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))))))

(declare-fun b!179801 () Bool)

(assert (=> b!179801 (= e!118425 (not call!18173))))

(declare-fun b!179802 () Bool)

(declare-fun c!32235 () Bool)

(assert (=> b!179802 (= c!32235 (and (not (= (bvand (extraKeys!3424 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3424 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!179802 (= e!118418 e!118423)))

(declare-fun b!179803 () Bool)

(declare-fun lt!88826 () Unit!5468)

(assert (=> b!179803 (= e!118417 lt!88826)))

(declare-fun lt!88830 () ListLongMap!2263)

(declare-fun getCurrentListMapNoExtraKeys!181 (array!7573 array!7575 (_ BitVec 32) (_ BitVec 32) V!5251 V!5251 (_ BitVec 32) Int) ListLongMap!2263)

(assert (=> b!179803 (= lt!88830 (getCurrentListMapNoExtraKeys!181 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248)))))

(declare-fun lt!88829 () (_ BitVec 64))

(assert (=> b!179803 (= lt!88829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88814 () (_ BitVec 64))

(assert (=> b!179803 (= lt!88814 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88827 () Unit!5468)

(declare-fun addStillContains!124 (ListLongMap!2263 (_ BitVec 64) V!5251 (_ BitVec 64)) Unit!5468)

(assert (=> b!179803 (= lt!88827 (addStillContains!124 lt!88830 lt!88829 (zeroValue!3528 thiss!1248) lt!88814))))

(assert (=> b!179803 (contains!1222 (+!265 lt!88830 (tuple2!3337 lt!88829 (zeroValue!3528 thiss!1248))) lt!88814)))

(declare-fun lt!88828 () Unit!5468)

(assert (=> b!179803 (= lt!88828 lt!88827)))

(declare-fun lt!88835 () ListLongMap!2263)

(assert (=> b!179803 (= lt!88835 (getCurrentListMapNoExtraKeys!181 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248)))))

(declare-fun lt!88831 () (_ BitVec 64))

(assert (=> b!179803 (= lt!88831 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88816 () (_ BitVec 64))

(assert (=> b!179803 (= lt!88816 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88822 () Unit!5468)

(declare-fun addApplyDifferent!124 (ListLongMap!2263 (_ BitVec 64) V!5251 (_ BitVec 64)) Unit!5468)

(assert (=> b!179803 (= lt!88822 (addApplyDifferent!124 lt!88835 lt!88831 (minValue!3528 thiss!1248) lt!88816))))

(assert (=> b!179803 (= (apply!148 (+!265 lt!88835 (tuple2!3337 lt!88831 (minValue!3528 thiss!1248))) lt!88816) (apply!148 lt!88835 lt!88816))))

(declare-fun lt!88818 () Unit!5468)

(assert (=> b!179803 (= lt!88818 lt!88822)))

(declare-fun lt!88817 () ListLongMap!2263)

(assert (=> b!179803 (= lt!88817 (getCurrentListMapNoExtraKeys!181 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248)))))

(declare-fun lt!88820 () (_ BitVec 64))

(assert (=> b!179803 (= lt!88820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88832 () (_ BitVec 64))

(assert (=> b!179803 (= lt!88832 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88823 () Unit!5468)

(assert (=> b!179803 (= lt!88823 (addApplyDifferent!124 lt!88817 lt!88820 (zeroValue!3528 thiss!1248) lt!88832))))

(assert (=> b!179803 (= (apply!148 (+!265 lt!88817 (tuple2!3337 lt!88820 (zeroValue!3528 thiss!1248))) lt!88832) (apply!148 lt!88817 lt!88832))))

(declare-fun lt!88815 () Unit!5468)

(assert (=> b!179803 (= lt!88815 lt!88823)))

(declare-fun lt!88819 () ListLongMap!2263)

(assert (=> b!179803 (= lt!88819 (getCurrentListMapNoExtraKeys!181 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248)))))

(declare-fun lt!88821 () (_ BitVec 64))

(assert (=> b!179803 (= lt!88821 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88824 () (_ BitVec 64))

(assert (=> b!179803 (= lt!88824 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179803 (= lt!88826 (addApplyDifferent!124 lt!88819 lt!88821 (minValue!3528 thiss!1248) lt!88824))))

(assert (=> b!179803 (= (apply!148 (+!265 lt!88819 (tuple2!3337 lt!88821 (minValue!3528 thiss!1248))) lt!88824) (apply!148 lt!88819 lt!88824))))

(declare-fun b!179804 () Bool)

(assert (=> b!179804 (= e!118418 call!18169)))

(declare-fun b!179805 () Bool)

(declare-fun Unit!5471 () Unit!5468)

(assert (=> b!179805 (= e!118417 Unit!5471)))

(declare-fun b!179806 () Bool)

(assert (=> b!179806 (= e!118423 call!18169)))

(declare-fun bm!18171 () Bool)

(assert (=> bm!18171 (= call!18170 (getCurrentListMapNoExtraKeys!181 (_keys!5576 thiss!1248) (_values!3670 thiss!1248) (mask!8673 thiss!1248) (extraKeys!3424 thiss!1248) (zeroValue!3528 thiss!1248) (minValue!3528 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3687 thiss!1248)))))

(declare-fun b!179807 () Bool)

(assert (=> b!179807 (= e!118419 (not call!18171))))

(declare-fun bm!18172 () Bool)

(assert (=> bm!18172 (= call!18172 call!18170)))

(declare-fun b!179808 () Bool)

(assert (=> b!179808 (= e!118422 e!118421)))

(declare-fun res!85167 () Bool)

(assert (=> b!179808 (=> (not res!85167) (not e!118421))))

(assert (=> b!179808 (= res!85167 (contains!1222 lt!88825 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3895 (_keys!5576 thiss!1248))))))

(declare-fun b!179809 () Bool)

(assert (=> b!179809 (= e!118425 e!118426)))

(declare-fun res!85168 () Bool)

(assert (=> b!179809 (= res!85168 call!18173)))

(assert (=> b!179809 (=> (not res!85168) (not e!118426))))

(declare-fun b!179810 () Bool)

(assert (=> b!179810 (= e!118420 (validKeyInArray!0 (select (arr!3587 (_keys!5576 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54181 c!32236) b!179794))

(assert (= (and d!54181 (not c!32236)) b!179795))

(assert (= (and b!179795 c!32237) b!179804))

(assert (= (and b!179795 (not c!32237)) b!179802))

(assert (= (and b!179802 c!32235) b!179806))

(assert (= (and b!179802 (not c!32235)) b!179797))

(assert (= (or b!179806 b!179797) bm!18166))

(assert (= (or b!179804 bm!18166) bm!18172))

(assert (= (or b!179804 b!179806) bm!18170))

(assert (= (or b!179794 bm!18172) bm!18171))

(assert (= (or b!179794 bm!18170) bm!18167))

(assert (= (and d!54181 res!85166) b!179810))

(assert (= (and d!54181 c!32234) b!179803))

(assert (= (and d!54181 (not c!32234)) b!179805))

(assert (= (and d!54181 res!85174) b!179800))

(assert (= (and b!179800 res!85172) b!179792))

(assert (= (and b!179800 (not res!85171)) b!179808))

(assert (= (and b!179808 res!85167) b!179796))

(assert (= (and b!179800 res!85169) b!179799))

(assert (= (and b!179799 c!32232) b!179791))

(assert (= (and b!179799 (not c!32232)) b!179807))

(assert (= (and b!179791 res!85170) b!179793))

(assert (= (or b!179791 b!179807) bm!18168))

(assert (= (and b!179799 res!85173) b!179798))

(assert (= (and b!179798 c!32233) b!179809))

(assert (= (and b!179798 (not c!32233)) b!179801))

(assert (= (and b!179809 res!85168) b!179790))

(assert (= (or b!179809 b!179801) bm!18169))

(declare-fun b_lambda!7115 () Bool)

(assert (=> (not b_lambda!7115) (not b!179796)))

(declare-fun t!7128 () Bool)

(declare-fun tb!2807 () Bool)

(assert (=> (and b!179648 (= (defaultEntry!3687 thiss!1248) (defaultEntry!3687 thiss!1248)) t!7128) tb!2807))

(declare-fun result!4695 () Bool)

(assert (=> tb!2807 (= result!4695 tp_is_empty!4203)))

(assert (=> b!179796 t!7128))

(declare-fun b_and!10967 () Bool)

(assert (= b_and!10963 (and (=> t!7128 result!4695) b_and!10967)))

(declare-fun m!207909 () Bool)

(assert (=> b!179796 m!207909))

(assert (=> b!179796 m!207909))

(declare-fun m!207911 () Bool)

(assert (=> b!179796 m!207911))

(declare-fun m!207913 () Bool)

(assert (=> b!179796 m!207913))

(assert (=> b!179796 m!207873))

(declare-fun m!207915 () Bool)

(assert (=> b!179796 m!207915))

(assert (=> b!179796 m!207911))

(assert (=> b!179796 m!207873))

(assert (=> d!54181 m!207839))

(declare-fun m!207917 () Bool)

(assert (=> b!179793 m!207917))

(declare-fun m!207919 () Bool)

(assert (=> bm!18167 m!207919))

(declare-fun m!207921 () Bool)

(assert (=> b!179803 m!207921))

(declare-fun m!207923 () Bool)

(assert (=> b!179803 m!207923))

(declare-fun m!207925 () Bool)

(assert (=> b!179803 m!207925))

(declare-fun m!207927 () Bool)

(assert (=> b!179803 m!207927))

(declare-fun m!207929 () Bool)

(assert (=> b!179803 m!207929))

(declare-fun m!207931 () Bool)

(assert (=> b!179803 m!207931))

(declare-fun m!207933 () Bool)

(assert (=> b!179803 m!207933))

(assert (=> b!179803 m!207931))

(declare-fun m!207935 () Bool)

(assert (=> b!179803 m!207935))

(declare-fun m!207937 () Bool)

(assert (=> b!179803 m!207937))

(assert (=> b!179803 m!207923))

(declare-fun m!207939 () Bool)

(assert (=> b!179803 m!207939))

(declare-fun m!207941 () Bool)

(assert (=> b!179803 m!207941))

(assert (=> b!179803 m!207927))

(declare-fun m!207943 () Bool)

(assert (=> b!179803 m!207943))

(declare-fun m!207945 () Bool)

(assert (=> b!179803 m!207945))

(declare-fun m!207947 () Bool)

(assert (=> b!179803 m!207947))

(assert (=> b!179803 m!207935))

(declare-fun m!207949 () Bool)

(assert (=> b!179803 m!207949))

(declare-fun m!207951 () Bool)

(assert (=> b!179803 m!207951))

(assert (=> b!179803 m!207873))

(declare-fun m!207953 () Bool)

(assert (=> b!179790 m!207953))

(assert (=> b!179792 m!207873))

(assert (=> b!179792 m!207873))

(assert (=> b!179792 m!207875))

(assert (=> bm!18171 m!207945))

(declare-fun m!207955 () Bool)

(assert (=> bm!18169 m!207955))

(assert (=> b!179810 m!207873))

(assert (=> b!179810 m!207873))

(assert (=> b!179810 m!207875))

(declare-fun m!207957 () Bool)

(assert (=> bm!18168 m!207957))

(assert (=> b!179808 m!207873))

(assert (=> b!179808 m!207873))

(declare-fun m!207959 () Bool)

(assert (=> b!179808 m!207959))

(declare-fun m!207961 () Bool)

(assert (=> b!179794 m!207961))

(assert (=> b!179637 d!54181))

(declare-fun b!179819 () Bool)

(declare-fun e!118432 () Bool)

(assert (=> b!179819 (= e!118432 tp_is_empty!4203)))

(declare-fun condMapEmpty!7201 () Bool)

(declare-fun mapDefault!7201 () ValueCell!1758)

(assert (=> mapNonEmpty!7195 (= condMapEmpty!7201 (= mapRest!7195 ((as const (Array (_ BitVec 32) ValueCell!1758)) mapDefault!7201)))))

(declare-fun e!118431 () Bool)

(declare-fun mapRes!7201 () Bool)

(assert (=> mapNonEmpty!7195 (= tp!16020 (and e!118431 mapRes!7201))))

(declare-fun mapIsEmpty!7201 () Bool)

(assert (=> mapIsEmpty!7201 mapRes!7201))

(declare-fun b!179820 () Bool)

(assert (=> b!179820 (= e!118431 tp_is_empty!4203)))

(declare-fun mapNonEmpty!7201 () Bool)

(declare-fun tp!16030 () Bool)

(assert (=> mapNonEmpty!7201 (= mapRes!7201 (and tp!16030 e!118432))))

(declare-fun mapValue!7201 () ValueCell!1758)

(declare-fun mapKey!7201 () (_ BitVec 32))

(declare-fun mapRest!7201 () (Array (_ BitVec 32) ValueCell!1758))

(assert (=> mapNonEmpty!7201 (= mapRest!7195 (store mapRest!7201 mapKey!7201 mapValue!7201))))

(assert (= (and mapNonEmpty!7195 condMapEmpty!7201) mapIsEmpty!7201))

(assert (= (and mapNonEmpty!7195 (not condMapEmpty!7201)) mapNonEmpty!7201))

(assert (= (and mapNonEmpty!7201 ((_ is ValueCellFull!1758) mapValue!7201)) b!179819))

(assert (= (and mapNonEmpty!7195 ((_ is ValueCellFull!1758) mapDefault!7201)) b!179820))

(declare-fun m!207963 () Bool)

(assert (=> mapNonEmpty!7201 m!207963))

(declare-fun b_lambda!7117 () Bool)

(assert (= b_lambda!7115 (or (and b!179648 b_free!4431) b_lambda!7117)))

(check-sat (not b!179735) (not d!54163) (not b_next!4431) (not b!179704) b_and!10967 (not d!54169) tp_is_empty!4203 (not b_lambda!7117) (not b!179794) (not bm!18151) (not b!179747) (not bm!18169) (not b!179691) (not b!179790) (not mapNonEmpty!7201) (not b!179803) (not d!54181) (not b!179693) (not b!179734) (not b!179810) (not b!179745) (not b!179792) (not bm!18167) (not b!179703) (not bm!18148) (not b!179796) (not b!179793) (not bm!18168) (not b!179737) (not b!179692) (not b!179719) (not d!54179) (not bm!18171) (not b!179808))
(check-sat b_and!10967 (not b_next!4431))
