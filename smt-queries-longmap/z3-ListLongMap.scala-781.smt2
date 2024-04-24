; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18486 () Bool)

(assert start!18486)

(declare-fun b!183365 () Bool)

(declare-fun b_free!4525 () Bool)

(declare-fun b_next!4525 () Bool)

(assert (=> b!183365 (= b_free!4525 (not b_next!4525))))

(declare-fun tp!16346 () Bool)

(declare-fun b_and!11109 () Bool)

(assert (=> b!183365 (= tp!16346 b_and!11109)))

(declare-fun b!183357 () Bool)

(declare-fun res!86792 () Bool)

(declare-fun e!120714 () Bool)

(assert (=> b!183357 (=> (not res!86792) (not e!120714))))

(declare-datatypes ((V!5377 0))(
  ( (V!5378 (val!2193 Int)) )
))
(declare-datatypes ((ValueCell!1805 0))(
  ( (ValueCellFull!1805 (v!4097 V!5377)) (EmptyCell!1805) )
))
(declare-datatypes ((array!7773 0))(
  ( (array!7774 (arr!3674 (Array (_ BitVec 32) (_ BitVec 64))) (size!3986 (_ BitVec 32))) )
))
(declare-datatypes ((array!7775 0))(
  ( (array!7776 (arr!3675 (Array (_ BitVec 32) ValueCell!1805)) (size!3987 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2518 0))(
  ( (LongMapFixedSize!2519 (defaultEntry!3749 Int) (mask!8811 (_ BitVec 32)) (extraKeys!3486 (_ BitVec 32)) (zeroValue!3590 V!5377) (minValue!3590 V!5377) (_size!1308 (_ BitVec 32)) (_keys!5667 array!7773) (_values!3732 array!7775) (_vacant!1308 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2518)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3360 0))(
  ( (tuple2!3361 (_1!1691 (_ BitVec 64)) (_2!1691 V!5377)) )
))
(declare-datatypes ((List!2300 0))(
  ( (Nil!2297) (Cons!2296 (h!2925 tuple2!3360) (t!7160 List!2300)) )
))
(declare-datatypes ((ListLongMap!2281 0))(
  ( (ListLongMap!2282 (toList!1156 List!2300)) )
))
(declare-fun contains!1254 (ListLongMap!2281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!808 (array!7773 array!7775 (_ BitVec 32) (_ BitVec 32) V!5377 V!5377 (_ BitVec 32) Int) ListLongMap!2281)

(assert (=> b!183357 (= res!86792 (not (contains!1254 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) key!828)))))

(declare-fun b!183358 () Bool)

(declare-fun e!120716 () Bool)

(assert (=> b!183358 (= e!120716 e!120714)))

(declare-fun res!86790 () Bool)

(assert (=> b!183358 (=> (not res!86790) (not e!120714))))

(declare-datatypes ((SeekEntryResult!608 0))(
  ( (MissingZero!608 (index!4602 (_ BitVec 32))) (Found!608 (index!4603 (_ BitVec 32))) (Intermediate!608 (undefined!1420 Bool) (index!4604 (_ BitVec 32)) (x!19962 (_ BitVec 32))) (Undefined!608) (MissingVacant!608 (index!4605 (_ BitVec 32))) )
))
(declare-fun lt!90678 () SeekEntryResult!608)

(get-info :version)

(assert (=> b!183358 (= res!86790 (and (not ((_ is Undefined!608) lt!90678)) (not ((_ is MissingVacant!608) lt!90678)) (not ((_ is MissingZero!608) lt!90678)) ((_ is Found!608) lt!90678)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7773 (_ BitVec 32)) SeekEntryResult!608)

(assert (=> b!183358 (= lt!90678 (seekEntryOrOpen!0 key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)))))

(declare-fun mapIsEmpty!7379 () Bool)

(declare-fun mapRes!7379 () Bool)

(assert (=> mapIsEmpty!7379 mapRes!7379))

(declare-fun mapNonEmpty!7379 () Bool)

(declare-fun tp!16345 () Bool)

(declare-fun e!120712 () Bool)

(assert (=> mapNonEmpty!7379 (= mapRes!7379 (and tp!16345 e!120712))))

(declare-fun mapValue!7379 () ValueCell!1805)

(declare-fun mapRest!7379 () (Array (_ BitVec 32) ValueCell!1805))

(declare-fun mapKey!7379 () (_ BitVec 32))

(assert (=> mapNonEmpty!7379 (= (arr!3675 (_values!3732 thiss!1248)) (store mapRest!7379 mapKey!7379 mapValue!7379))))

(declare-fun b!183359 () Bool)

(declare-fun res!86793 () Bool)

(assert (=> b!183359 (=> (not res!86793) (not e!120714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183359 (= res!86793 (validMask!0 (mask!8811 thiss!1248)))))

(declare-fun b!183360 () Bool)

(declare-fun e!120710 () Bool)

(declare-fun tp_is_empty!4297 () Bool)

(assert (=> b!183360 (= e!120710 tp_is_empty!4297)))

(declare-fun b!183361 () Bool)

(declare-fun e!120713 () Bool)

(assert (=> b!183361 (= e!120713 (and e!120710 mapRes!7379))))

(declare-fun condMapEmpty!7379 () Bool)

(declare-fun mapDefault!7379 () ValueCell!1805)

(assert (=> b!183361 (= condMapEmpty!7379 (= (arr!3675 (_values!3732 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1805)) mapDefault!7379)))))

(declare-fun res!86791 () Bool)

(assert (=> start!18486 (=> (not res!86791) (not e!120716))))

(declare-fun valid!1064 (LongMapFixedSize!2518) Bool)

(assert (=> start!18486 (= res!86791 (valid!1064 thiss!1248))))

(assert (=> start!18486 e!120716))

(declare-fun e!120711 () Bool)

(assert (=> start!18486 e!120711))

(assert (=> start!18486 true))

(declare-fun b!183362 () Bool)

(assert (=> b!183362 (= e!120714 (not (= (size!3987 (_values!3732 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8811 thiss!1248)))))))

(declare-fun b!183363 () Bool)

(assert (=> b!183363 (= e!120712 tp_is_empty!4297)))

(declare-fun b!183364 () Bool)

(declare-fun res!86789 () Bool)

(assert (=> b!183364 (=> (not res!86789) (not e!120716))))

(assert (=> b!183364 (= res!86789 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2371 (array!7773) Bool)

(declare-fun array_inv!2372 (array!7775) Bool)

(assert (=> b!183365 (= e!120711 (and tp!16346 tp_is_empty!4297 (array_inv!2371 (_keys!5667 thiss!1248)) (array_inv!2372 (_values!3732 thiss!1248)) e!120713))))

(assert (= (and start!18486 res!86791) b!183364))

(assert (= (and b!183364 res!86789) b!183358))

(assert (= (and b!183358 res!86790) b!183357))

(assert (= (and b!183357 res!86792) b!183359))

(assert (= (and b!183359 res!86793) b!183362))

(assert (= (and b!183361 condMapEmpty!7379) mapIsEmpty!7379))

(assert (= (and b!183361 (not condMapEmpty!7379)) mapNonEmpty!7379))

(assert (= (and mapNonEmpty!7379 ((_ is ValueCellFull!1805) mapValue!7379)) b!183363))

(assert (= (and b!183361 ((_ is ValueCellFull!1805) mapDefault!7379)) b!183360))

(assert (= b!183365 b!183361))

(assert (= start!18486 b!183365))

(declare-fun m!211013 () Bool)

(assert (=> b!183357 m!211013))

(assert (=> b!183357 m!211013))

(declare-fun m!211015 () Bool)

(assert (=> b!183357 m!211015))

(declare-fun m!211017 () Bool)

(assert (=> b!183365 m!211017))

(declare-fun m!211019 () Bool)

(assert (=> b!183365 m!211019))

(declare-fun m!211021 () Bool)

(assert (=> mapNonEmpty!7379 m!211021))

(declare-fun m!211023 () Bool)

(assert (=> b!183358 m!211023))

(declare-fun m!211025 () Bool)

(assert (=> b!183359 m!211025))

(declare-fun m!211027 () Bool)

(assert (=> start!18486 m!211027))

(check-sat (not start!18486) (not mapNonEmpty!7379) tp_is_empty!4297 (not b_next!4525) (not b!183359) (not b!183358) (not b!183365) (not b!183357) b_and!11109)
(check-sat b_and!11109 (not b_next!4525))
(get-model)

(declare-fun b!183432 () Bool)

(declare-fun e!120766 () SeekEntryResult!608)

(declare-fun lt!90693 () SeekEntryResult!608)

(assert (=> b!183432 (= e!120766 (Found!608 (index!4604 lt!90693)))))

(declare-fun b!183433 () Bool)

(declare-fun e!120767 () SeekEntryResult!608)

(assert (=> b!183433 (= e!120767 e!120766)))

(declare-fun lt!90692 () (_ BitVec 64))

(assert (=> b!183433 (= lt!90692 (select (arr!3674 (_keys!5667 thiss!1248)) (index!4604 lt!90693)))))

(declare-fun c!32869 () Bool)

(assert (=> b!183433 (= c!32869 (= lt!90692 key!828))))

(declare-fun b!183434 () Bool)

(declare-fun e!120765 () SeekEntryResult!608)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7773 (_ BitVec 32)) SeekEntryResult!608)

(assert (=> b!183434 (= e!120765 (seekKeyOrZeroReturnVacant!0 (x!19962 lt!90693) (index!4604 lt!90693) (index!4604 lt!90693) key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)))))

(declare-fun b!183435 () Bool)

(declare-fun c!32868 () Bool)

(assert (=> b!183435 (= c!32868 (= lt!90692 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183435 (= e!120766 e!120765)))

(declare-fun d!54777 () Bool)

(declare-fun lt!90691 () SeekEntryResult!608)

(assert (=> d!54777 (and (or ((_ is Undefined!608) lt!90691) (not ((_ is Found!608) lt!90691)) (and (bvsge (index!4603 lt!90691) #b00000000000000000000000000000000) (bvslt (index!4603 lt!90691) (size!3986 (_keys!5667 thiss!1248))))) (or ((_ is Undefined!608) lt!90691) ((_ is Found!608) lt!90691) (not ((_ is MissingZero!608) lt!90691)) (and (bvsge (index!4602 lt!90691) #b00000000000000000000000000000000) (bvslt (index!4602 lt!90691) (size!3986 (_keys!5667 thiss!1248))))) (or ((_ is Undefined!608) lt!90691) ((_ is Found!608) lt!90691) ((_ is MissingZero!608) lt!90691) (not ((_ is MissingVacant!608) lt!90691)) (and (bvsge (index!4605 lt!90691) #b00000000000000000000000000000000) (bvslt (index!4605 lt!90691) (size!3986 (_keys!5667 thiss!1248))))) (or ((_ is Undefined!608) lt!90691) (ite ((_ is Found!608) lt!90691) (= (select (arr!3674 (_keys!5667 thiss!1248)) (index!4603 lt!90691)) key!828) (ite ((_ is MissingZero!608) lt!90691) (= (select (arr!3674 (_keys!5667 thiss!1248)) (index!4602 lt!90691)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!608) lt!90691) (= (select (arr!3674 (_keys!5667 thiss!1248)) (index!4605 lt!90691)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54777 (= lt!90691 e!120767)))

(declare-fun c!32867 () Bool)

(assert (=> d!54777 (= c!32867 (and ((_ is Intermediate!608) lt!90693) (undefined!1420 lt!90693)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7773 (_ BitVec 32)) SeekEntryResult!608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54777 (= lt!90693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8811 thiss!1248)) key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)))))

(assert (=> d!54777 (validMask!0 (mask!8811 thiss!1248))))

(assert (=> d!54777 (= (seekEntryOrOpen!0 key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)) lt!90691)))

(declare-fun b!183436 () Bool)

(assert (=> b!183436 (= e!120767 Undefined!608)))

(declare-fun b!183437 () Bool)

(assert (=> b!183437 (= e!120765 (MissingZero!608 (index!4604 lt!90693)))))

(assert (= (and d!54777 c!32867) b!183436))

(assert (= (and d!54777 (not c!32867)) b!183433))

(assert (= (and b!183433 c!32869) b!183432))

(assert (= (and b!183433 (not c!32869)) b!183435))

(assert (= (and b!183435 c!32868) b!183437))

(assert (= (and b!183435 (not c!32868)) b!183434))

(declare-fun m!211061 () Bool)

(assert (=> b!183433 m!211061))

(declare-fun m!211063 () Bool)

(assert (=> b!183434 m!211063))

(declare-fun m!211065 () Bool)

(assert (=> d!54777 m!211065))

(declare-fun m!211067 () Bool)

(assert (=> d!54777 m!211067))

(declare-fun m!211069 () Bool)

(assert (=> d!54777 m!211069))

(assert (=> d!54777 m!211025))

(declare-fun m!211071 () Bool)

(assert (=> d!54777 m!211071))

(assert (=> d!54777 m!211065))

(declare-fun m!211073 () Bool)

(assert (=> d!54777 m!211073))

(assert (=> b!183358 d!54777))

(declare-fun d!54779 () Bool)

(declare-fun res!86830 () Bool)

(declare-fun e!120770 () Bool)

(assert (=> d!54779 (=> (not res!86830) (not e!120770))))

(declare-fun simpleValid!175 (LongMapFixedSize!2518) Bool)

(assert (=> d!54779 (= res!86830 (simpleValid!175 thiss!1248))))

(assert (=> d!54779 (= (valid!1064 thiss!1248) e!120770)))

(declare-fun b!183444 () Bool)

(declare-fun res!86831 () Bool)

(assert (=> b!183444 (=> (not res!86831) (not e!120770))))

(declare-fun arrayCountValidKeys!0 (array!7773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183444 (= res!86831 (= (arrayCountValidKeys!0 (_keys!5667 thiss!1248) #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))) (_size!1308 thiss!1248)))))

(declare-fun b!183445 () Bool)

(declare-fun res!86832 () Bool)

(assert (=> b!183445 (=> (not res!86832) (not e!120770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7773 (_ BitVec 32)) Bool)

(assert (=> b!183445 (= res!86832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)))))

(declare-fun b!183446 () Bool)

(declare-datatypes ((List!2303 0))(
  ( (Nil!2300) (Cons!2299 (h!2928 (_ BitVec 64)) (t!7165 List!2303)) )
))
(declare-fun arrayNoDuplicates!0 (array!7773 (_ BitVec 32) List!2303) Bool)

(assert (=> b!183446 (= e!120770 (arrayNoDuplicates!0 (_keys!5667 thiss!1248) #b00000000000000000000000000000000 Nil!2300))))

(assert (= (and d!54779 res!86830) b!183444))

(assert (= (and b!183444 res!86831) b!183445))

(assert (= (and b!183445 res!86832) b!183446))

(declare-fun m!211075 () Bool)

(assert (=> d!54779 m!211075))

(declare-fun m!211077 () Bool)

(assert (=> b!183444 m!211077))

(declare-fun m!211079 () Bool)

(assert (=> b!183445 m!211079))

(declare-fun m!211081 () Bool)

(assert (=> b!183446 m!211081))

(assert (=> start!18486 d!54779))

(declare-fun d!54781 () Bool)

(assert (=> d!54781 (= (validMask!0 (mask!8811 thiss!1248)) (and (or (= (mask!8811 thiss!1248) #b00000000000000000000000000000111) (= (mask!8811 thiss!1248) #b00000000000000000000000000001111) (= (mask!8811 thiss!1248) #b00000000000000000000000000011111) (= (mask!8811 thiss!1248) #b00000000000000000000000000111111) (= (mask!8811 thiss!1248) #b00000000000000000000000001111111) (= (mask!8811 thiss!1248) #b00000000000000000000000011111111) (= (mask!8811 thiss!1248) #b00000000000000000000000111111111) (= (mask!8811 thiss!1248) #b00000000000000000000001111111111) (= (mask!8811 thiss!1248) #b00000000000000000000011111111111) (= (mask!8811 thiss!1248) #b00000000000000000000111111111111) (= (mask!8811 thiss!1248) #b00000000000000000001111111111111) (= (mask!8811 thiss!1248) #b00000000000000000011111111111111) (= (mask!8811 thiss!1248) #b00000000000000000111111111111111) (= (mask!8811 thiss!1248) #b00000000000000001111111111111111) (= (mask!8811 thiss!1248) #b00000000000000011111111111111111) (= (mask!8811 thiss!1248) #b00000000000000111111111111111111) (= (mask!8811 thiss!1248) #b00000000000001111111111111111111) (= (mask!8811 thiss!1248) #b00000000000011111111111111111111) (= (mask!8811 thiss!1248) #b00000000000111111111111111111111) (= (mask!8811 thiss!1248) #b00000000001111111111111111111111) (= (mask!8811 thiss!1248) #b00000000011111111111111111111111) (= (mask!8811 thiss!1248) #b00000000111111111111111111111111) (= (mask!8811 thiss!1248) #b00000001111111111111111111111111) (= (mask!8811 thiss!1248) #b00000011111111111111111111111111) (= (mask!8811 thiss!1248) #b00000111111111111111111111111111) (= (mask!8811 thiss!1248) #b00001111111111111111111111111111) (= (mask!8811 thiss!1248) #b00011111111111111111111111111111) (= (mask!8811 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8811 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183359 d!54781))

(declare-fun d!54783 () Bool)

(assert (=> d!54783 (= (array_inv!2371 (_keys!5667 thiss!1248)) (bvsge (size!3986 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183365 d!54783))

(declare-fun d!54785 () Bool)

(assert (=> d!54785 (= (array_inv!2372 (_values!3732 thiss!1248)) (bvsge (size!3987 (_values!3732 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183365 d!54785))

(declare-fun d!54787 () Bool)

(declare-fun e!120776 () Bool)

(assert (=> d!54787 e!120776))

(declare-fun res!86835 () Bool)

(assert (=> d!54787 (=> res!86835 e!120776)))

(declare-fun lt!90703 () Bool)

(assert (=> d!54787 (= res!86835 (not lt!90703))))

(declare-fun lt!90702 () Bool)

(assert (=> d!54787 (= lt!90703 lt!90702)))

(declare-datatypes ((Unit!5548 0))(
  ( (Unit!5549) )
))
(declare-fun lt!90705 () Unit!5548)

(declare-fun e!120775 () Unit!5548)

(assert (=> d!54787 (= lt!90705 e!120775)))

(declare-fun c!32872 () Bool)

(assert (=> d!54787 (= c!32872 lt!90702)))

(declare-fun containsKey!220 (List!2300 (_ BitVec 64)) Bool)

(assert (=> d!54787 (= lt!90702 (containsKey!220 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(assert (=> d!54787 (= (contains!1254 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) key!828) lt!90703)))

(declare-fun b!183453 () Bool)

(declare-fun lt!90704 () Unit!5548)

(assert (=> b!183453 (= e!120775 lt!90704)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!168 (List!2300 (_ BitVec 64)) Unit!5548)

(assert (=> b!183453 (= lt!90704 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(declare-datatypes ((Option!223 0))(
  ( (Some!222 (v!4100 V!5377)) (None!221) )
))
(declare-fun isDefined!169 (Option!223) Bool)

(declare-fun getValueByKey!217 (List!2300 (_ BitVec 64)) Option!223)

(assert (=> b!183453 (isDefined!169 (getValueByKey!217 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(declare-fun b!183454 () Bool)

(declare-fun Unit!5550 () Unit!5548)

(assert (=> b!183454 (= e!120775 Unit!5550)))

(declare-fun b!183455 () Bool)

(assert (=> b!183455 (= e!120776 (isDefined!169 (getValueByKey!217 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828)))))

(assert (= (and d!54787 c!32872) b!183453))

(assert (= (and d!54787 (not c!32872)) b!183454))

(assert (= (and d!54787 (not res!86835)) b!183455))

(declare-fun m!211083 () Bool)

(assert (=> d!54787 m!211083))

(declare-fun m!211085 () Bool)

(assert (=> b!183453 m!211085))

(declare-fun m!211087 () Bool)

(assert (=> b!183453 m!211087))

(assert (=> b!183453 m!211087))

(declare-fun m!211089 () Bool)

(assert (=> b!183453 m!211089))

(assert (=> b!183455 m!211087))

(assert (=> b!183455 m!211087))

(assert (=> b!183455 m!211089))

(assert (=> b!183357 d!54787))

(declare-fun b!183498 () Bool)

(declare-fun e!120806 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183498 (= e!120806 (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183499 () Bool)

(declare-fun e!120812 () ListLongMap!2281)

(declare-fun call!18515 () ListLongMap!2281)

(assert (=> b!183499 (= e!120812 call!18515)))

(declare-fun b!183500 () Bool)

(declare-fun e!120808 () Bool)

(declare-fun lt!90756 () ListLongMap!2281)

(declare-fun apply!159 (ListLongMap!2281 (_ BitVec 64)) V!5377)

(assert (=> b!183500 (= e!120808 (= (apply!159 lt!90756 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3590 thiss!1248)))))

(declare-fun b!183501 () Bool)

(declare-fun e!120805 () Unit!5548)

(declare-fun lt!90768 () Unit!5548)

(assert (=> b!183501 (= e!120805 lt!90768)))

(declare-fun lt!90770 () ListLongMap!2281)

(declare-fun getCurrentListMapNoExtraKeys!190 (array!7773 array!7775 (_ BitVec 32) (_ BitVec 32) V!5377 V!5377 (_ BitVec 32) Int) ListLongMap!2281)

(assert (=> b!183501 (= lt!90770 (getCurrentListMapNoExtraKeys!190 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun lt!90765 () (_ BitVec 64))

(assert (=> b!183501 (= lt!90765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90758 () (_ BitVec 64))

(assert (=> b!183501 (= lt!90758 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90764 () Unit!5548)

(declare-fun addStillContains!135 (ListLongMap!2281 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5548)

(assert (=> b!183501 (= lt!90764 (addStillContains!135 lt!90770 lt!90765 (zeroValue!3590 thiss!1248) lt!90758))))

(declare-fun +!279 (ListLongMap!2281 tuple2!3360) ListLongMap!2281)

(assert (=> b!183501 (contains!1254 (+!279 lt!90770 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248))) lt!90758)))

(declare-fun lt!90760 () Unit!5548)

(assert (=> b!183501 (= lt!90760 lt!90764)))

(declare-fun lt!90757 () ListLongMap!2281)

(assert (=> b!183501 (= lt!90757 (getCurrentListMapNoExtraKeys!190 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun lt!90751 () (_ BitVec 64))

(assert (=> b!183501 (= lt!90751 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90761 () (_ BitVec 64))

(assert (=> b!183501 (= lt!90761 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90753 () Unit!5548)

(declare-fun addApplyDifferent!135 (ListLongMap!2281 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5548)

(assert (=> b!183501 (= lt!90753 (addApplyDifferent!135 lt!90757 lt!90751 (minValue!3590 thiss!1248) lt!90761))))

(assert (=> b!183501 (= (apply!159 (+!279 lt!90757 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248))) lt!90761) (apply!159 lt!90757 lt!90761))))

(declare-fun lt!90754 () Unit!5548)

(assert (=> b!183501 (= lt!90754 lt!90753)))

(declare-fun lt!90767 () ListLongMap!2281)

(assert (=> b!183501 (= lt!90767 (getCurrentListMapNoExtraKeys!190 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun lt!90750 () (_ BitVec 64))

(assert (=> b!183501 (= lt!90750 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90766 () (_ BitVec 64))

(assert (=> b!183501 (= lt!90766 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90752 () Unit!5548)

(assert (=> b!183501 (= lt!90752 (addApplyDifferent!135 lt!90767 lt!90750 (zeroValue!3590 thiss!1248) lt!90766))))

(assert (=> b!183501 (= (apply!159 (+!279 lt!90767 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248))) lt!90766) (apply!159 lt!90767 lt!90766))))

(declare-fun lt!90771 () Unit!5548)

(assert (=> b!183501 (= lt!90771 lt!90752)))

(declare-fun lt!90755 () ListLongMap!2281)

(assert (=> b!183501 (= lt!90755 (getCurrentListMapNoExtraKeys!190 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun lt!90759 () (_ BitVec 64))

(assert (=> b!183501 (= lt!90759 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90769 () (_ BitVec 64))

(assert (=> b!183501 (= lt!90769 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183501 (= lt!90768 (addApplyDifferent!135 lt!90755 lt!90759 (minValue!3590 thiss!1248) lt!90769))))

(assert (=> b!183501 (= (apply!159 (+!279 lt!90755 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248))) lt!90769) (apply!159 lt!90755 lt!90769))))

(declare-fun b!183502 () Bool)

(declare-fun e!120813 () Bool)

(declare-fun e!120803 () Bool)

(assert (=> b!183502 (= e!120813 e!120803)))

(declare-fun res!86862 () Bool)

(declare-fun call!18512 () Bool)

(assert (=> b!183502 (= res!86862 call!18512)))

(assert (=> b!183502 (=> (not res!86862) (not e!120803))))

(declare-fun b!183503 () Bool)

(declare-fun e!120807 () Bool)

(assert (=> b!183503 (= e!120807 (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18508 () Bool)

(declare-fun call!18511 () ListLongMap!2281)

(assert (=> bm!18508 (= call!18511 (getCurrentListMapNoExtraKeys!190 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun bm!18509 () Bool)

(declare-fun call!18513 () ListLongMap!2281)

(declare-fun call!18516 () ListLongMap!2281)

(assert (=> bm!18509 (= call!18513 call!18516)))

(declare-fun b!183504 () Bool)

(declare-fun res!86856 () Bool)

(declare-fun e!120810 () Bool)

(assert (=> b!183504 (=> (not res!86856) (not e!120810))))

(declare-fun e!120804 () Bool)

(assert (=> b!183504 (= res!86856 e!120804)))

(declare-fun res!86860 () Bool)

(assert (=> b!183504 (=> res!86860 e!120804)))

(assert (=> b!183504 (= res!86860 (not e!120807))))

(declare-fun res!86854 () Bool)

(assert (=> b!183504 (=> (not res!86854) (not e!120807))))

(assert (=> b!183504 (= res!86854 (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun b!183505 () Bool)

(declare-fun e!120814 () Bool)

(assert (=> b!183505 (= e!120814 e!120808)))

(declare-fun res!86861 () Bool)

(declare-fun call!18514 () Bool)

(assert (=> b!183505 (= res!86861 call!18514)))

(assert (=> b!183505 (=> (not res!86861) (not e!120808))))

(declare-fun b!183506 () Bool)

(assert (=> b!183506 (= e!120803 (= (apply!159 lt!90756 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3590 thiss!1248)))))

(declare-fun bm!18510 () Bool)

(declare-fun call!18517 () ListLongMap!2281)

(assert (=> bm!18510 (= call!18515 call!18517)))

(declare-fun bm!18511 () Bool)

(assert (=> bm!18511 (= call!18514 (contains!1254 lt!90756 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183507 () Bool)

(declare-fun e!120811 () Bool)

(assert (=> b!183507 (= e!120804 e!120811)))

(declare-fun res!86857 () Bool)

(assert (=> b!183507 (=> (not res!86857) (not e!120811))))

(assert (=> b!183507 (= res!86857 (contains!1254 lt!90756 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun b!183508 () Bool)

(declare-fun e!120815 () ListLongMap!2281)

(assert (=> b!183508 (= e!120815 call!18515)))

(declare-fun b!183509 () Bool)

(assert (=> b!183509 (= e!120814 (not call!18514))))

(declare-fun b!183510 () Bool)

(declare-fun res!86858 () Bool)

(assert (=> b!183510 (=> (not res!86858) (not e!120810))))

(assert (=> b!183510 (= res!86858 e!120813)))

(declare-fun c!32887 () Bool)

(assert (=> b!183510 (= c!32887 (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!54789 () Bool)

(assert (=> d!54789 e!120810))

(declare-fun res!86855 () Bool)

(assert (=> d!54789 (=> (not res!86855) (not e!120810))))

(assert (=> d!54789 (= res!86855 (or (bvsge #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))))

(declare-fun lt!90763 () ListLongMap!2281)

(assert (=> d!54789 (= lt!90756 lt!90763)))

(declare-fun lt!90762 () Unit!5548)

(assert (=> d!54789 (= lt!90762 e!120805)))

(declare-fun c!32886 () Bool)

(assert (=> d!54789 (= c!32886 e!120806)))

(declare-fun res!86859 () Bool)

(assert (=> d!54789 (=> (not res!86859) (not e!120806))))

(assert (=> d!54789 (= res!86859 (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun e!120809 () ListLongMap!2281)

(assert (=> d!54789 (= lt!90763 e!120809)))

(declare-fun c!32888 () Bool)

(assert (=> d!54789 (= c!32888 (and (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54789 (validMask!0 (mask!8811 thiss!1248))))

(assert (=> d!54789 (= (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) lt!90756)))

(declare-fun bm!18512 () Bool)

(declare-fun c!32889 () Bool)

(assert (=> bm!18512 (= call!18517 (+!279 (ite c!32888 call!18511 (ite c!32889 call!18516 call!18513)) (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(declare-fun b!183511 () Bool)

(assert (=> b!183511 (= e!120815 call!18513)))

(declare-fun b!183512 () Bool)

(assert (=> b!183512 (= e!120809 e!120812)))

(assert (=> b!183512 (= c!32889 (and (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183513 () Bool)

(assert (=> b!183513 (= e!120809 (+!279 call!18517 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))

(declare-fun b!183514 () Bool)

(declare-fun get!2114 (ValueCell!1805 V!5377) V!5377)

(declare-fun dynLambda!502 (Int (_ BitVec 64)) V!5377)

(assert (=> b!183514 (= e!120811 (= (apply!159 lt!90756 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)) (get!2114 (select (arr!3675 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3987 (_values!3732 thiss!1248))))))

(assert (=> b!183514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun b!183515 () Bool)

(declare-fun Unit!5551 () Unit!5548)

(assert (=> b!183515 (= e!120805 Unit!5551)))

(declare-fun b!183516 () Bool)

(assert (=> b!183516 (= e!120810 e!120814)))

(declare-fun c!32890 () Bool)

(assert (=> b!183516 (= c!32890 (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18513 () Bool)

(assert (=> bm!18513 (= call!18516 call!18511)))

(declare-fun b!183517 () Bool)

(assert (=> b!183517 (= e!120813 (not call!18512))))

(declare-fun bm!18514 () Bool)

(assert (=> bm!18514 (= call!18512 (contains!1254 lt!90756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183518 () Bool)

(declare-fun c!32885 () Bool)

(assert (=> b!183518 (= c!32885 (and (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!183518 (= e!120812 e!120815)))

(assert (= (and d!54789 c!32888) b!183513))

(assert (= (and d!54789 (not c!32888)) b!183512))

(assert (= (and b!183512 c!32889) b!183499))

(assert (= (and b!183512 (not c!32889)) b!183518))

(assert (= (and b!183518 c!32885) b!183508))

(assert (= (and b!183518 (not c!32885)) b!183511))

(assert (= (or b!183508 b!183511) bm!18509))

(assert (= (or b!183499 bm!18509) bm!18513))

(assert (= (or b!183499 b!183508) bm!18510))

(assert (= (or b!183513 bm!18513) bm!18508))

(assert (= (or b!183513 bm!18510) bm!18512))

(assert (= (and d!54789 res!86859) b!183498))

(assert (= (and d!54789 c!32886) b!183501))

(assert (= (and d!54789 (not c!32886)) b!183515))

(assert (= (and d!54789 res!86855) b!183504))

(assert (= (and b!183504 res!86854) b!183503))

(assert (= (and b!183504 (not res!86860)) b!183507))

(assert (= (and b!183507 res!86857) b!183514))

(assert (= (and b!183504 res!86856) b!183510))

(assert (= (and b!183510 c!32887) b!183502))

(assert (= (and b!183510 (not c!32887)) b!183517))

(assert (= (and b!183502 res!86862) b!183506))

(assert (= (or b!183502 b!183517) bm!18514))

(assert (= (and b!183510 res!86858) b!183516))

(assert (= (and b!183516 c!32890) b!183505))

(assert (= (and b!183516 (not c!32890)) b!183509))

(assert (= (and b!183505 res!86861) b!183500))

(assert (= (or b!183505 b!183509) bm!18511))

(declare-fun b_lambda!7213 () Bool)

(assert (=> (not b_lambda!7213) (not b!183514)))

(declare-fun t!7164 () Bool)

(declare-fun tb!2821 () Bool)

(assert (=> (and b!183365 (= (defaultEntry!3749 thiss!1248) (defaultEntry!3749 thiss!1248)) t!7164) tb!2821))

(declare-fun result!4757 () Bool)

(assert (=> tb!2821 (= result!4757 tp_is_empty!4297)))

(assert (=> b!183514 t!7164))

(declare-fun b_and!11115 () Bool)

(assert (= b_and!11109 (and (=> t!7164 result!4757) b_and!11115)))

(declare-fun m!211091 () Bool)

(assert (=> b!183513 m!211091))

(declare-fun m!211093 () Bool)

(assert (=> b!183501 m!211093))

(declare-fun m!211095 () Bool)

(assert (=> b!183501 m!211095))

(declare-fun m!211097 () Bool)

(assert (=> b!183501 m!211097))

(declare-fun m!211099 () Bool)

(assert (=> b!183501 m!211099))

(declare-fun m!211101 () Bool)

(assert (=> b!183501 m!211101))

(declare-fun m!211103 () Bool)

(assert (=> b!183501 m!211103))

(declare-fun m!211105 () Bool)

(assert (=> b!183501 m!211105))

(declare-fun m!211107 () Bool)

(assert (=> b!183501 m!211107))

(declare-fun m!211109 () Bool)

(assert (=> b!183501 m!211109))

(declare-fun m!211111 () Bool)

(assert (=> b!183501 m!211111))

(assert (=> b!183501 m!211093))

(declare-fun m!211113 () Bool)

(assert (=> b!183501 m!211113))

(declare-fun m!211115 () Bool)

(assert (=> b!183501 m!211115))

(assert (=> b!183501 m!211103))

(declare-fun m!211117 () Bool)

(assert (=> b!183501 m!211117))

(declare-fun m!211119 () Bool)

(assert (=> b!183501 m!211119))

(declare-fun m!211121 () Bool)

(assert (=> b!183501 m!211121))

(declare-fun m!211123 () Bool)

(assert (=> b!183501 m!211123))

(assert (=> b!183501 m!211107))

(declare-fun m!211125 () Bool)

(assert (=> b!183501 m!211125))

(assert (=> b!183501 m!211097))

(declare-fun m!211127 () Bool)

(assert (=> bm!18512 m!211127))

(declare-fun m!211129 () Bool)

(assert (=> bm!18511 m!211129))

(assert (=> b!183498 m!211121))

(assert (=> b!183498 m!211121))

(declare-fun m!211131 () Bool)

(assert (=> b!183498 m!211131))

(assert (=> d!54789 m!211025))

(assert (=> b!183503 m!211121))

(assert (=> b!183503 m!211121))

(assert (=> b!183503 m!211131))

(assert (=> bm!18508 m!211115))

(assert (=> b!183507 m!211121))

(assert (=> b!183507 m!211121))

(declare-fun m!211133 () Bool)

(assert (=> b!183507 m!211133))

(declare-fun m!211135 () Bool)

(assert (=> bm!18514 m!211135))

(declare-fun m!211137 () Bool)

(assert (=> b!183506 m!211137))

(declare-fun m!211139 () Bool)

(assert (=> b!183500 m!211139))

(declare-fun m!211141 () Bool)

(assert (=> b!183514 m!211141))

(assert (=> b!183514 m!211121))

(declare-fun m!211143 () Bool)

(assert (=> b!183514 m!211143))

(assert (=> b!183514 m!211141))

(declare-fun m!211145 () Bool)

(assert (=> b!183514 m!211145))

(assert (=> b!183514 m!211121))

(declare-fun m!211147 () Bool)

(assert (=> b!183514 m!211147))

(assert (=> b!183514 m!211143))

(assert (=> b!183357 d!54789))

(declare-fun condMapEmpty!7388 () Bool)

(declare-fun mapDefault!7388 () ValueCell!1805)

(assert (=> mapNonEmpty!7379 (= condMapEmpty!7388 (= mapRest!7379 ((as const (Array (_ BitVec 32) ValueCell!1805)) mapDefault!7388)))))

(declare-fun e!120821 () Bool)

(declare-fun mapRes!7388 () Bool)

(assert (=> mapNonEmpty!7379 (= tp!16345 (and e!120821 mapRes!7388))))

(declare-fun b!183528 () Bool)

(assert (=> b!183528 (= e!120821 tp_is_empty!4297)))

(declare-fun mapIsEmpty!7388 () Bool)

(assert (=> mapIsEmpty!7388 mapRes!7388))

(declare-fun b!183527 () Bool)

(declare-fun e!120820 () Bool)

(assert (=> b!183527 (= e!120820 tp_is_empty!4297)))

(declare-fun mapNonEmpty!7388 () Bool)

(declare-fun tp!16361 () Bool)

(assert (=> mapNonEmpty!7388 (= mapRes!7388 (and tp!16361 e!120820))))

(declare-fun mapRest!7388 () (Array (_ BitVec 32) ValueCell!1805))

(declare-fun mapKey!7388 () (_ BitVec 32))

(declare-fun mapValue!7388 () ValueCell!1805)

(assert (=> mapNonEmpty!7388 (= mapRest!7379 (store mapRest!7388 mapKey!7388 mapValue!7388))))

(assert (= (and mapNonEmpty!7379 condMapEmpty!7388) mapIsEmpty!7388))

(assert (= (and mapNonEmpty!7379 (not condMapEmpty!7388)) mapNonEmpty!7388))

(assert (= (and mapNonEmpty!7388 ((_ is ValueCellFull!1805) mapValue!7388)) b!183527))

(assert (= (and mapNonEmpty!7379 ((_ is ValueCellFull!1805) mapDefault!7388)) b!183528))

(declare-fun m!211149 () Bool)

(assert (=> mapNonEmpty!7388 m!211149))

(declare-fun b_lambda!7215 () Bool)

(assert (= b_lambda!7213 (or (and b!183365 b_free!4525) b_lambda!7215)))

(check-sat (not b!183513) (not b_lambda!7215) (not b!183506) (not b_next!4525) (not b!183507) (not b!183514) (not d!54789) (not b!183444) (not bm!18512) (not mapNonEmpty!7388) (not bm!18511) (not b!183501) (not d!54787) (not b!183503) (not d!54779) (not bm!18508) b_and!11115 (not b!183500) (not b!183498) (not b!183445) (not d!54777) (not b!183455) tp_is_empty!4297 (not b!183446) (not b!183453) (not b!183434) (not bm!18514))
(check-sat b_and!11115 (not b_next!4525))
(get-model)

(declare-fun d!54791 () Bool)

(declare-fun res!86867 () Bool)

(declare-fun e!120828 () Bool)

(assert (=> d!54791 (=> res!86867 e!120828)))

(assert (=> d!54791 (= res!86867 (bvsge #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(assert (=> d!54791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)) e!120828)))

(declare-fun b!183537 () Bool)

(declare-fun e!120830 () Bool)

(assert (=> b!183537 (= e!120828 e!120830)))

(declare-fun c!32893 () Bool)

(assert (=> b!183537 (= c!32893 (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183538 () Bool)

(declare-fun e!120829 () Bool)

(declare-fun call!18520 () Bool)

(assert (=> b!183538 (= e!120829 call!18520)))

(declare-fun bm!18517 () Bool)

(assert (=> bm!18517 (= call!18520 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5667 thiss!1248) (mask!8811 thiss!1248)))))

(declare-fun b!183539 () Bool)

(assert (=> b!183539 (= e!120830 call!18520)))

(declare-fun b!183540 () Bool)

(assert (=> b!183540 (= e!120830 e!120829)))

(declare-fun lt!90778 () (_ BitVec 64))

(assert (=> b!183540 (= lt!90778 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90779 () Unit!5548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7773 (_ BitVec 64) (_ BitVec 32)) Unit!5548)

(assert (=> b!183540 (= lt!90779 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5667 thiss!1248) lt!90778 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!183540 (arrayContainsKey!0 (_keys!5667 thiss!1248) lt!90778 #b00000000000000000000000000000000)))

(declare-fun lt!90780 () Unit!5548)

(assert (=> b!183540 (= lt!90780 lt!90779)))

(declare-fun res!86868 () Bool)

(assert (=> b!183540 (= res!86868 (= (seekEntryOrOpen!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000) (_keys!5667 thiss!1248) (mask!8811 thiss!1248)) (Found!608 #b00000000000000000000000000000000)))))

(assert (=> b!183540 (=> (not res!86868) (not e!120829))))

(assert (= (and d!54791 (not res!86867)) b!183537))

(assert (= (and b!183537 c!32893) b!183540))

(assert (= (and b!183537 (not c!32893)) b!183539))

(assert (= (and b!183540 res!86868) b!183538))

(assert (= (or b!183538 b!183539) bm!18517))

(assert (=> b!183537 m!211121))

(assert (=> b!183537 m!211121))

(assert (=> b!183537 m!211131))

(declare-fun m!211151 () Bool)

(assert (=> bm!18517 m!211151))

(assert (=> b!183540 m!211121))

(declare-fun m!211153 () Bool)

(assert (=> b!183540 m!211153))

(declare-fun m!211155 () Bool)

(assert (=> b!183540 m!211155))

(assert (=> b!183540 m!211121))

(declare-fun m!211157 () Bool)

(assert (=> b!183540 m!211157))

(assert (=> b!183445 d!54791))

(declare-fun b!183553 () Bool)

(declare-fun e!120837 () SeekEntryResult!608)

(declare-fun e!120839 () SeekEntryResult!608)

(assert (=> b!183553 (= e!120837 e!120839)))

(declare-fun c!32902 () Bool)

(declare-fun lt!90786 () (_ BitVec 64))

(assert (=> b!183553 (= c!32902 (= lt!90786 key!828))))

(declare-fun b!183554 () Bool)

(assert (=> b!183554 (= e!120839 (Found!608 (index!4604 lt!90693)))))

(declare-fun b!183556 () Bool)

(assert (=> b!183556 (= e!120837 Undefined!608)))

(declare-fun b!183557 () Bool)

(declare-fun e!120838 () SeekEntryResult!608)

(assert (=> b!183557 (= e!120838 (MissingVacant!608 (index!4604 lt!90693)))))

(declare-fun b!183558 () Bool)

(declare-fun c!32901 () Bool)

(assert (=> b!183558 (= c!32901 (= lt!90786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183558 (= e!120839 e!120838)))

(declare-fun b!183555 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183555 (= e!120838 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19962 lt!90693) #b00000000000000000000000000000001) (nextIndex!0 (index!4604 lt!90693) (bvadd (x!19962 lt!90693) #b00000000000000000000000000000001) (mask!8811 thiss!1248)) (index!4604 lt!90693) key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)))))

(declare-fun d!54793 () Bool)

(declare-fun lt!90785 () SeekEntryResult!608)

(assert (=> d!54793 (and (or ((_ is Undefined!608) lt!90785) (not ((_ is Found!608) lt!90785)) (and (bvsge (index!4603 lt!90785) #b00000000000000000000000000000000) (bvslt (index!4603 lt!90785) (size!3986 (_keys!5667 thiss!1248))))) (or ((_ is Undefined!608) lt!90785) ((_ is Found!608) lt!90785) (not ((_ is MissingVacant!608) lt!90785)) (not (= (index!4605 lt!90785) (index!4604 lt!90693))) (and (bvsge (index!4605 lt!90785) #b00000000000000000000000000000000) (bvslt (index!4605 lt!90785) (size!3986 (_keys!5667 thiss!1248))))) (or ((_ is Undefined!608) lt!90785) (ite ((_ is Found!608) lt!90785) (= (select (arr!3674 (_keys!5667 thiss!1248)) (index!4603 lt!90785)) key!828) (and ((_ is MissingVacant!608) lt!90785) (= (index!4605 lt!90785) (index!4604 lt!90693)) (= (select (arr!3674 (_keys!5667 thiss!1248)) (index!4605 lt!90785)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54793 (= lt!90785 e!120837)))

(declare-fun c!32900 () Bool)

(assert (=> d!54793 (= c!32900 (bvsge (x!19962 lt!90693) #b01111111111111111111111111111110))))

(assert (=> d!54793 (= lt!90786 (select (arr!3674 (_keys!5667 thiss!1248)) (index!4604 lt!90693)))))

(assert (=> d!54793 (validMask!0 (mask!8811 thiss!1248))))

(assert (=> d!54793 (= (seekKeyOrZeroReturnVacant!0 (x!19962 lt!90693) (index!4604 lt!90693) (index!4604 lt!90693) key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)) lt!90785)))

(assert (= (and d!54793 c!32900) b!183556))

(assert (= (and d!54793 (not c!32900)) b!183553))

(assert (= (and b!183553 c!32902) b!183554))

(assert (= (and b!183553 (not c!32902)) b!183558))

(assert (= (and b!183558 c!32901) b!183557))

(assert (= (and b!183558 (not c!32901)) b!183555))

(declare-fun m!211159 () Bool)

(assert (=> b!183555 m!211159))

(assert (=> b!183555 m!211159))

(declare-fun m!211161 () Bool)

(assert (=> b!183555 m!211161))

(declare-fun m!211163 () Bool)

(assert (=> d!54793 m!211163))

(declare-fun m!211165 () Bool)

(assert (=> d!54793 m!211165))

(assert (=> d!54793 m!211061))

(assert (=> d!54793 m!211025))

(assert (=> b!183434 d!54793))

(declare-fun b!183569 () Bool)

(declare-fun e!120851 () Bool)

(declare-fun contains!1257 (List!2303 (_ BitVec 64)) Bool)

(assert (=> b!183569 (= e!120851 (contains!1257 Nil!2300 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18520 () Bool)

(declare-fun call!18523 () Bool)

(declare-fun c!32905 () Bool)

(assert (=> bm!18520 (= call!18523 (arrayNoDuplicates!0 (_keys!5667 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32905 (Cons!2299 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000) Nil!2300) Nil!2300)))))

(declare-fun b!183570 () Bool)

(declare-fun e!120850 () Bool)

(assert (=> b!183570 (= e!120850 call!18523)))

(declare-fun b!183571 () Bool)

(assert (=> b!183571 (= e!120850 call!18523)))

(declare-fun d!54795 () Bool)

(declare-fun res!86877 () Bool)

(declare-fun e!120848 () Bool)

(assert (=> d!54795 (=> res!86877 e!120848)))

(assert (=> d!54795 (= res!86877 (bvsge #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(assert (=> d!54795 (= (arrayNoDuplicates!0 (_keys!5667 thiss!1248) #b00000000000000000000000000000000 Nil!2300) e!120848)))

(declare-fun b!183572 () Bool)

(declare-fun e!120849 () Bool)

(assert (=> b!183572 (= e!120849 e!120850)))

(assert (=> b!183572 (= c!32905 (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183573 () Bool)

(assert (=> b!183573 (= e!120848 e!120849)))

(declare-fun res!86876 () Bool)

(assert (=> b!183573 (=> (not res!86876) (not e!120849))))

(assert (=> b!183573 (= res!86876 (not e!120851))))

(declare-fun res!86875 () Bool)

(assert (=> b!183573 (=> (not res!86875) (not e!120851))))

(assert (=> b!183573 (= res!86875 (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54795 (not res!86877)) b!183573))

(assert (= (and b!183573 res!86875) b!183569))

(assert (= (and b!183573 res!86876) b!183572))

(assert (= (and b!183572 c!32905) b!183571))

(assert (= (and b!183572 (not c!32905)) b!183570))

(assert (= (or b!183571 b!183570) bm!18520))

(assert (=> b!183569 m!211121))

(assert (=> b!183569 m!211121))

(declare-fun m!211167 () Bool)

(assert (=> b!183569 m!211167))

(assert (=> bm!18520 m!211121))

(declare-fun m!211169 () Bool)

(assert (=> bm!18520 m!211169))

(assert (=> b!183572 m!211121))

(assert (=> b!183572 m!211121))

(assert (=> b!183572 m!211131))

(assert (=> b!183573 m!211121))

(assert (=> b!183573 m!211121))

(assert (=> b!183573 m!211131))

(assert (=> b!183446 d!54795))

(declare-fun d!54797 () Bool)

(declare-fun e!120854 () Bool)

(assert (=> d!54797 e!120854))

(declare-fun res!86882 () Bool)

(assert (=> d!54797 (=> (not res!86882) (not e!120854))))

(declare-fun lt!90798 () ListLongMap!2281)

(assert (=> d!54797 (= res!86882 (contains!1254 lt!90798 (_1!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(declare-fun lt!90795 () List!2300)

(assert (=> d!54797 (= lt!90798 (ListLongMap!2282 lt!90795))))

(declare-fun lt!90796 () Unit!5548)

(declare-fun lt!90797 () Unit!5548)

(assert (=> d!54797 (= lt!90796 lt!90797)))

(assert (=> d!54797 (= (getValueByKey!217 lt!90795 (_1!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))) (Some!222 (_2!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!114 (List!2300 (_ BitVec 64) V!5377) Unit!5548)

(assert (=> d!54797 (= lt!90797 (lemmaContainsTupThenGetReturnValue!114 lt!90795 (_1!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) (_2!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(declare-fun insertStrictlySorted!117 (List!2300 (_ BitVec 64) V!5377) List!2300)

(assert (=> d!54797 (= lt!90795 (insertStrictlySorted!117 (toList!1156 (ite c!32888 call!18511 (ite c!32889 call!18516 call!18513))) (_1!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) (_2!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(assert (=> d!54797 (= (+!279 (ite c!32888 call!18511 (ite c!32889 call!18516 call!18513)) (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) lt!90798)))

(declare-fun b!183578 () Bool)

(declare-fun res!86883 () Bool)

(assert (=> b!183578 (=> (not res!86883) (not e!120854))))

(assert (=> b!183578 (= res!86883 (= (getValueByKey!217 (toList!1156 lt!90798) (_1!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))) (Some!222 (_2!1691 (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))))

(declare-fun b!183579 () Bool)

(declare-fun contains!1258 (List!2300 tuple2!3360) Bool)

(assert (=> b!183579 (= e!120854 (contains!1258 (toList!1156 lt!90798) (ite (or c!32888 c!32889) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(assert (= (and d!54797 res!86882) b!183578))

(assert (= (and b!183578 res!86883) b!183579))

(declare-fun m!211171 () Bool)

(assert (=> d!54797 m!211171))

(declare-fun m!211173 () Bool)

(assert (=> d!54797 m!211173))

(declare-fun m!211175 () Bool)

(assert (=> d!54797 m!211175))

(declare-fun m!211177 () Bool)

(assert (=> d!54797 m!211177))

(declare-fun m!211179 () Bool)

(assert (=> b!183578 m!211179))

(declare-fun m!211181 () Bool)

(assert (=> b!183579 m!211181))

(assert (=> bm!18512 d!54797))

(declare-fun b!183604 () Bool)

(declare-fun e!120875 () Bool)

(assert (=> b!183604 (= e!120875 (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183604 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!183605 () Bool)

(declare-fun e!120873 () Bool)

(declare-fun lt!90817 () ListLongMap!2281)

(declare-fun isEmpty!469 (ListLongMap!2281) Bool)

(assert (=> b!183605 (= e!120873 (isEmpty!469 lt!90817))))

(declare-fun b!183606 () Bool)

(declare-fun e!120869 () ListLongMap!2281)

(declare-fun e!120870 () ListLongMap!2281)

(assert (=> b!183606 (= e!120869 e!120870)))

(declare-fun c!32915 () Bool)

(assert (=> b!183606 (= c!32915 (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183607 () Bool)

(assert (=> b!183607 (= e!120873 (= lt!90817 (getCurrentListMapNoExtraKeys!190 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3749 thiss!1248))))))

(declare-fun bm!18523 () Bool)

(declare-fun call!18526 () ListLongMap!2281)

(assert (=> bm!18523 (= call!18526 (getCurrentListMapNoExtraKeys!190 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3749 thiss!1248)))))

(declare-fun b!183608 () Bool)

(declare-fun lt!90818 () Unit!5548)

(declare-fun lt!90816 () Unit!5548)

(assert (=> b!183608 (= lt!90818 lt!90816)))

(declare-fun lt!90819 () (_ BitVec 64))

(declare-fun lt!90815 () V!5377)

(declare-fun lt!90814 () (_ BitVec 64))

(declare-fun lt!90813 () ListLongMap!2281)

(assert (=> b!183608 (not (contains!1254 (+!279 lt!90813 (tuple2!3361 lt!90819 lt!90815)) lt!90814))))

(declare-fun addStillNotContains!87 (ListLongMap!2281 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5548)

(assert (=> b!183608 (= lt!90816 (addStillNotContains!87 lt!90813 lt!90819 lt!90815 lt!90814))))

(assert (=> b!183608 (= lt!90814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!183608 (= lt!90815 (get!2114 (select (arr!3675 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183608 (= lt!90819 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183608 (= lt!90813 call!18526)))

(assert (=> b!183608 (= e!120870 (+!279 call!18526 (tuple2!3361 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000) (get!2114 (select (arr!3675 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!183609 () Bool)

(assert (=> b!183609 (= e!120870 call!18526)))

(declare-fun d!54799 () Bool)

(declare-fun e!120872 () Bool)

(assert (=> d!54799 e!120872))

(declare-fun res!86892 () Bool)

(assert (=> d!54799 (=> (not res!86892) (not e!120872))))

(assert (=> d!54799 (= res!86892 (not (contains!1254 lt!90817 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54799 (= lt!90817 e!120869)))

(declare-fun c!32917 () Bool)

(assert (=> d!54799 (= c!32917 (bvsge #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(assert (=> d!54799 (validMask!0 (mask!8811 thiss!1248))))

(assert (=> d!54799 (= (getCurrentListMapNoExtraKeys!190 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) lt!90817)))

(declare-fun b!183610 () Bool)

(declare-fun e!120874 () Bool)

(assert (=> b!183610 (= e!120872 e!120874)))

(declare-fun c!32916 () Bool)

(assert (=> b!183610 (= c!32916 e!120875)))

(declare-fun res!86895 () Bool)

(assert (=> b!183610 (=> (not res!86895) (not e!120875))))

(assert (=> b!183610 (= res!86895 (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun b!183611 () Bool)

(assert (=> b!183611 (= e!120874 e!120873)))

(declare-fun c!32914 () Bool)

(assert (=> b!183611 (= c!32914 (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun b!183612 () Bool)

(declare-fun res!86893 () Bool)

(assert (=> b!183612 (=> (not res!86893) (not e!120872))))

(assert (=> b!183612 (= res!86893 (not (contains!1254 lt!90817 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183613 () Bool)

(assert (=> b!183613 (= e!120869 (ListLongMap!2282 Nil!2297))))

(declare-fun b!183614 () Bool)

(declare-fun e!120871 () Bool)

(assert (=> b!183614 (= e!120874 e!120871)))

(assert (=> b!183614 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun res!86894 () Bool)

(assert (=> b!183614 (= res!86894 (contains!1254 lt!90817 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183614 (=> (not res!86894) (not e!120871))))

(declare-fun b!183615 () Bool)

(assert (=> b!183615 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(assert (=> b!183615 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3987 (_values!3732 thiss!1248))))))

(assert (=> b!183615 (= e!120871 (= (apply!159 lt!90817 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)) (get!2114 (select (arr!3675 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!54799 c!32917) b!183613))

(assert (= (and d!54799 (not c!32917)) b!183606))

(assert (= (and b!183606 c!32915) b!183608))

(assert (= (and b!183606 (not c!32915)) b!183609))

(assert (= (or b!183608 b!183609) bm!18523))

(assert (= (and d!54799 res!86892) b!183612))

(assert (= (and b!183612 res!86893) b!183610))

(assert (= (and b!183610 res!86895) b!183604))

(assert (= (and b!183610 c!32916) b!183614))

(assert (= (and b!183610 (not c!32916)) b!183611))

(assert (= (and b!183614 res!86894) b!183615))

(assert (= (and b!183611 c!32914) b!183607))

(assert (= (and b!183611 (not c!32914)) b!183605))

(declare-fun b_lambda!7217 () Bool)

(assert (=> (not b_lambda!7217) (not b!183608)))

(assert (=> b!183608 t!7164))

(declare-fun b_and!11117 () Bool)

(assert (= b_and!11115 (and (=> t!7164 result!4757) b_and!11117)))

(declare-fun b_lambda!7219 () Bool)

(assert (=> (not b_lambda!7219) (not b!183615)))

(assert (=> b!183615 t!7164))

(declare-fun b_and!11119 () Bool)

(assert (= b_and!11117 (and (=> t!7164 result!4757) b_and!11119)))

(declare-fun m!211183 () Bool)

(assert (=> bm!18523 m!211183))

(assert (=> b!183606 m!211121))

(assert (=> b!183606 m!211121))

(assert (=> b!183606 m!211131))

(assert (=> b!183614 m!211121))

(assert (=> b!183614 m!211121))

(declare-fun m!211185 () Bool)

(assert (=> b!183614 m!211185))

(assert (=> b!183607 m!211183))

(declare-fun m!211187 () Bool)

(assert (=> b!183605 m!211187))

(assert (=> b!183615 m!211121))

(assert (=> b!183615 m!211141))

(assert (=> b!183615 m!211143))

(assert (=> b!183615 m!211121))

(declare-fun m!211189 () Bool)

(assert (=> b!183615 m!211189))

(assert (=> b!183615 m!211143))

(assert (=> b!183615 m!211141))

(assert (=> b!183615 m!211145))

(declare-fun m!211191 () Bool)

(assert (=> b!183608 m!211191))

(assert (=> b!183608 m!211121))

(assert (=> b!183608 m!211141))

(declare-fun m!211193 () Bool)

(assert (=> b!183608 m!211193))

(assert (=> b!183608 m!211143))

(assert (=> b!183608 m!211143))

(assert (=> b!183608 m!211141))

(assert (=> b!183608 m!211145))

(declare-fun m!211195 () Bool)

(assert (=> b!183608 m!211195))

(assert (=> b!183608 m!211193))

(declare-fun m!211197 () Bool)

(assert (=> b!183608 m!211197))

(declare-fun m!211199 () Bool)

(assert (=> b!183612 m!211199))

(assert (=> b!183604 m!211121))

(assert (=> b!183604 m!211121))

(assert (=> b!183604 m!211131))

(declare-fun m!211201 () Bool)

(assert (=> d!54799 m!211201))

(assert (=> d!54799 m!211025))

(assert (=> bm!18508 d!54799))

(declare-fun d!54801 () Bool)

(assert (=> d!54801 (= (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183503 d!54801))

(declare-fun d!54803 () Bool)

(declare-fun e!120877 () Bool)

(assert (=> d!54803 e!120877))

(declare-fun res!86896 () Bool)

(assert (=> d!54803 (=> res!86896 e!120877)))

(declare-fun lt!90821 () Bool)

(assert (=> d!54803 (= res!86896 (not lt!90821))))

(declare-fun lt!90820 () Bool)

(assert (=> d!54803 (= lt!90821 lt!90820)))

(declare-fun lt!90823 () Unit!5548)

(declare-fun e!120876 () Unit!5548)

(assert (=> d!54803 (= lt!90823 e!120876)))

(declare-fun c!32918 () Bool)

(assert (=> d!54803 (= c!32918 lt!90820)))

(assert (=> d!54803 (= lt!90820 (containsKey!220 (toList!1156 lt!90756) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54803 (= (contains!1254 lt!90756 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90821)))

(declare-fun b!183616 () Bool)

(declare-fun lt!90822 () Unit!5548)

(assert (=> b!183616 (= e!120876 lt!90822)))

(assert (=> b!183616 (= lt!90822 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1156 lt!90756) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183616 (isDefined!169 (getValueByKey!217 (toList!1156 lt!90756) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183617 () Bool)

(declare-fun Unit!5552 () Unit!5548)

(assert (=> b!183617 (= e!120876 Unit!5552)))

(declare-fun b!183618 () Bool)

(assert (=> b!183618 (= e!120877 (isDefined!169 (getValueByKey!217 (toList!1156 lt!90756) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54803 c!32918) b!183616))

(assert (= (and d!54803 (not c!32918)) b!183617))

(assert (= (and d!54803 (not res!86896)) b!183618))

(declare-fun m!211203 () Bool)

(assert (=> d!54803 m!211203))

(declare-fun m!211205 () Bool)

(assert (=> b!183616 m!211205))

(declare-fun m!211207 () Bool)

(assert (=> b!183616 m!211207))

(assert (=> b!183616 m!211207))

(declare-fun m!211209 () Bool)

(assert (=> b!183616 m!211209))

(assert (=> b!183618 m!211207))

(assert (=> b!183618 m!211207))

(assert (=> b!183618 m!211209))

(assert (=> bm!18514 d!54803))

(declare-fun d!54805 () Bool)

(declare-fun e!120889 () Bool)

(assert (=> d!54805 e!120889))

(declare-fun c!32926 () Bool)

(declare-fun lt!90829 () SeekEntryResult!608)

(assert (=> d!54805 (= c!32926 (and ((_ is Intermediate!608) lt!90829) (undefined!1420 lt!90829)))))

(declare-fun e!120892 () SeekEntryResult!608)

(assert (=> d!54805 (= lt!90829 e!120892)))

(declare-fun c!32925 () Bool)

(assert (=> d!54805 (= c!32925 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!90828 () (_ BitVec 64))

(assert (=> d!54805 (= lt!90828 (select (arr!3674 (_keys!5667 thiss!1248)) (toIndex!0 key!828 (mask!8811 thiss!1248))))))

(assert (=> d!54805 (validMask!0 (mask!8811 thiss!1248))))

(assert (=> d!54805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8811 thiss!1248)) key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)) lt!90829)))

(declare-fun b!183637 () Bool)

(assert (=> b!183637 (and (bvsge (index!4604 lt!90829) #b00000000000000000000000000000000) (bvslt (index!4604 lt!90829) (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun res!86905 () Bool)

(assert (=> b!183637 (= res!86905 (= (select (arr!3674 (_keys!5667 thiss!1248)) (index!4604 lt!90829)) key!828))))

(declare-fun e!120891 () Bool)

(assert (=> b!183637 (=> res!86905 e!120891)))

(declare-fun e!120888 () Bool)

(assert (=> b!183637 (= e!120888 e!120891)))

(declare-fun b!183638 () Bool)

(assert (=> b!183638 (and (bvsge (index!4604 lt!90829) #b00000000000000000000000000000000) (bvslt (index!4604 lt!90829) (size!3986 (_keys!5667 thiss!1248))))))

(assert (=> b!183638 (= e!120891 (= (select (arr!3674 (_keys!5667 thiss!1248)) (index!4604 lt!90829)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183639 () Bool)

(declare-fun e!120890 () SeekEntryResult!608)

(assert (=> b!183639 (= e!120890 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8811 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8811 thiss!1248)) key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)))))

(declare-fun b!183640 () Bool)

(assert (=> b!183640 (= e!120892 e!120890)))

(declare-fun c!32927 () Bool)

(assert (=> b!183640 (= c!32927 (or (= lt!90828 key!828) (= (bvadd lt!90828 lt!90828) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183641 () Bool)

(assert (=> b!183641 (and (bvsge (index!4604 lt!90829) #b00000000000000000000000000000000) (bvslt (index!4604 lt!90829) (size!3986 (_keys!5667 thiss!1248))))))

(declare-fun res!86903 () Bool)

(assert (=> b!183641 (= res!86903 (= (select (arr!3674 (_keys!5667 thiss!1248)) (index!4604 lt!90829)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183641 (=> res!86903 e!120891)))

(declare-fun b!183642 () Bool)

(assert (=> b!183642 (= e!120892 (Intermediate!608 true (toIndex!0 key!828 (mask!8811 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183643 () Bool)

(assert (=> b!183643 (= e!120889 e!120888)))

(declare-fun res!86904 () Bool)

(assert (=> b!183643 (= res!86904 (and ((_ is Intermediate!608) lt!90829) (not (undefined!1420 lt!90829)) (bvslt (x!19962 lt!90829) #b01111111111111111111111111111110) (bvsge (x!19962 lt!90829) #b00000000000000000000000000000000) (bvsge (x!19962 lt!90829) #b00000000000000000000000000000000)))))

(assert (=> b!183643 (=> (not res!86904) (not e!120888))))

(declare-fun b!183644 () Bool)

(assert (=> b!183644 (= e!120890 (Intermediate!608 false (toIndex!0 key!828 (mask!8811 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183645 () Bool)

(assert (=> b!183645 (= e!120889 (bvsge (x!19962 lt!90829) #b01111111111111111111111111111110))))

(assert (= (and d!54805 c!32925) b!183642))

(assert (= (and d!54805 (not c!32925)) b!183640))

(assert (= (and b!183640 c!32927) b!183644))

(assert (= (and b!183640 (not c!32927)) b!183639))

(assert (= (and d!54805 c!32926) b!183645))

(assert (= (and d!54805 (not c!32926)) b!183643))

(assert (= (and b!183643 res!86904) b!183637))

(assert (= (and b!183637 (not res!86905)) b!183641))

(assert (= (and b!183641 (not res!86903)) b!183638))

(declare-fun m!211211 () Bool)

(assert (=> b!183637 m!211211))

(assert (=> b!183639 m!211065))

(declare-fun m!211213 () Bool)

(assert (=> b!183639 m!211213))

(assert (=> b!183639 m!211213))

(declare-fun m!211215 () Bool)

(assert (=> b!183639 m!211215))

(assert (=> b!183638 m!211211))

(assert (=> b!183641 m!211211))

(assert (=> d!54805 m!211065))

(declare-fun m!211217 () Bool)

(assert (=> d!54805 m!211217))

(assert (=> d!54805 m!211025))

(assert (=> d!54777 d!54805))

(declare-fun d!54807 () Bool)

(declare-fun lt!90835 () (_ BitVec 32))

(declare-fun lt!90834 () (_ BitVec 32))

(assert (=> d!54807 (= lt!90835 (bvmul (bvxor lt!90834 (bvlshr lt!90834 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54807 (= lt!90834 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54807 (and (bvsge (mask!8811 thiss!1248) #b00000000000000000000000000000000) (let ((res!86906 (let ((h!2929 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19981 (bvmul (bvxor h!2929 (bvlshr h!2929 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19981 (bvlshr x!19981 #b00000000000000000000000000001101)) (mask!8811 thiss!1248)))))) (and (bvslt res!86906 (bvadd (mask!8811 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86906 #b00000000000000000000000000000000))))))

(assert (=> d!54807 (= (toIndex!0 key!828 (mask!8811 thiss!1248)) (bvand (bvxor lt!90835 (bvlshr lt!90835 #b00000000000000000000000000001101)) (mask!8811 thiss!1248)))))

(assert (=> d!54777 d!54807))

(assert (=> d!54777 d!54781))

(declare-fun d!54809 () Bool)

(declare-fun res!86911 () Bool)

(declare-fun e!120897 () Bool)

(assert (=> d!54809 (=> res!86911 e!120897)))

(assert (=> d!54809 (= res!86911 (and ((_ is Cons!2296) (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) (= (_1!1691 (h!2925 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828)))))

(assert (=> d!54809 (= (containsKey!220 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828) e!120897)))

(declare-fun b!183650 () Bool)

(declare-fun e!120898 () Bool)

(assert (=> b!183650 (= e!120897 e!120898)))

(declare-fun res!86912 () Bool)

(assert (=> b!183650 (=> (not res!86912) (not e!120898))))

(assert (=> b!183650 (= res!86912 (and (or (not ((_ is Cons!2296) (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) (bvsle (_1!1691 (h!2925 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828)) ((_ is Cons!2296) (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) (bvslt (_1!1691 (h!2925 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828)))))

(declare-fun b!183651 () Bool)

(assert (=> b!183651 (= e!120898 (containsKey!220 (t!7160 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) key!828))))

(assert (= (and d!54809 (not res!86911)) b!183650))

(assert (= (and b!183650 res!86912) b!183651))

(declare-fun m!211219 () Bool)

(assert (=> b!183651 m!211219))

(assert (=> d!54787 d!54809))

(declare-fun d!54811 () Bool)

(declare-fun get!2115 (Option!223) V!5377)

(assert (=> d!54811 (= (apply!159 lt!90755 lt!90769) (get!2115 (getValueByKey!217 (toList!1156 lt!90755) lt!90769)))))

(declare-fun bs!7473 () Bool)

(assert (= bs!7473 d!54811))

(declare-fun m!211221 () Bool)

(assert (=> bs!7473 m!211221))

(assert (=> bs!7473 m!211221))

(declare-fun m!211223 () Bool)

(assert (=> bs!7473 m!211223))

(assert (=> b!183501 d!54811))

(assert (=> b!183501 d!54799))

(declare-fun d!54813 () Bool)

(assert (=> d!54813 (= (apply!159 (+!279 lt!90757 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248))) lt!90761) (apply!159 lt!90757 lt!90761))))

(declare-fun lt!90838 () Unit!5548)

(declare-fun choose!977 (ListLongMap!2281 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5548)

(assert (=> d!54813 (= lt!90838 (choose!977 lt!90757 lt!90751 (minValue!3590 thiss!1248) lt!90761))))

(declare-fun e!120901 () Bool)

(assert (=> d!54813 e!120901))

(declare-fun res!86915 () Bool)

(assert (=> d!54813 (=> (not res!86915) (not e!120901))))

(assert (=> d!54813 (= res!86915 (contains!1254 lt!90757 lt!90761))))

(assert (=> d!54813 (= (addApplyDifferent!135 lt!90757 lt!90751 (minValue!3590 thiss!1248) lt!90761) lt!90838)))

(declare-fun b!183655 () Bool)

(assert (=> b!183655 (= e!120901 (not (= lt!90761 lt!90751)))))

(assert (= (and d!54813 res!86915) b!183655))

(assert (=> d!54813 m!211093))

(assert (=> d!54813 m!211095))

(assert (=> d!54813 m!211101))

(assert (=> d!54813 m!211093))

(declare-fun m!211225 () Bool)

(assert (=> d!54813 m!211225))

(declare-fun m!211227 () Bool)

(assert (=> d!54813 m!211227))

(assert (=> b!183501 d!54813))

(declare-fun d!54815 () Bool)

(declare-fun e!120902 () Bool)

(assert (=> d!54815 e!120902))

(declare-fun res!86916 () Bool)

(assert (=> d!54815 (=> (not res!86916) (not e!120902))))

(declare-fun lt!90842 () ListLongMap!2281)

(assert (=> d!54815 (= res!86916 (contains!1254 lt!90842 (_1!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248)))))))

(declare-fun lt!90839 () List!2300)

(assert (=> d!54815 (= lt!90842 (ListLongMap!2282 lt!90839))))

(declare-fun lt!90840 () Unit!5548)

(declare-fun lt!90841 () Unit!5548)

(assert (=> d!54815 (= lt!90840 lt!90841)))

(assert (=> d!54815 (= (getValueByKey!217 lt!90839 (_1!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54815 (= lt!90841 (lemmaContainsTupThenGetReturnValue!114 lt!90839 (_1!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54815 (= lt!90839 (insertStrictlySorted!117 (toList!1156 lt!90767) (_1!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54815 (= (+!279 lt!90767 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248))) lt!90842)))

(declare-fun b!183656 () Bool)

(declare-fun res!86917 () Bool)

(assert (=> b!183656 (=> (not res!86917) (not e!120902))))

(assert (=> b!183656 (= res!86917 (= (getValueByKey!217 (toList!1156 lt!90842) (_1!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248))))))))

(declare-fun b!183657 () Bool)

(assert (=> b!183657 (= e!120902 (contains!1258 (toList!1156 lt!90842) (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248))))))

(assert (= (and d!54815 res!86916) b!183656))

(assert (= (and b!183656 res!86917) b!183657))

(declare-fun m!211229 () Bool)

(assert (=> d!54815 m!211229))

(declare-fun m!211231 () Bool)

(assert (=> d!54815 m!211231))

(declare-fun m!211233 () Bool)

(assert (=> d!54815 m!211233))

(declare-fun m!211235 () Bool)

(assert (=> d!54815 m!211235))

(declare-fun m!211237 () Bool)

(assert (=> b!183656 m!211237))

(declare-fun m!211239 () Bool)

(assert (=> b!183657 m!211239))

(assert (=> b!183501 d!54815))

(declare-fun d!54817 () Bool)

(assert (=> d!54817 (= (apply!159 lt!90757 lt!90761) (get!2115 (getValueByKey!217 (toList!1156 lt!90757) lt!90761)))))

(declare-fun bs!7474 () Bool)

(assert (= bs!7474 d!54817))

(declare-fun m!211241 () Bool)

(assert (=> bs!7474 m!211241))

(assert (=> bs!7474 m!211241))

(declare-fun m!211243 () Bool)

(assert (=> bs!7474 m!211243))

(assert (=> b!183501 d!54817))

(declare-fun d!54819 () Bool)

(assert (=> d!54819 (= (apply!159 (+!279 lt!90755 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248))) lt!90769) (apply!159 lt!90755 lt!90769))))

(declare-fun lt!90843 () Unit!5548)

(assert (=> d!54819 (= lt!90843 (choose!977 lt!90755 lt!90759 (minValue!3590 thiss!1248) lt!90769))))

(declare-fun e!120903 () Bool)

(assert (=> d!54819 e!120903))

(declare-fun res!86918 () Bool)

(assert (=> d!54819 (=> (not res!86918) (not e!120903))))

(assert (=> d!54819 (= res!86918 (contains!1254 lt!90755 lt!90769))))

(assert (=> d!54819 (= (addApplyDifferent!135 lt!90755 lt!90759 (minValue!3590 thiss!1248) lt!90769) lt!90843)))

(declare-fun b!183658 () Bool)

(assert (=> b!183658 (= e!120903 (not (= lt!90769 lt!90759)))))

(assert (= (and d!54819 res!86918) b!183658))

(assert (=> d!54819 m!211103))

(assert (=> d!54819 m!211105))

(assert (=> d!54819 m!211113))

(assert (=> d!54819 m!211103))

(declare-fun m!211245 () Bool)

(assert (=> d!54819 m!211245))

(declare-fun m!211247 () Bool)

(assert (=> d!54819 m!211247))

(assert (=> b!183501 d!54819))

(declare-fun d!54821 () Bool)

(assert (=> d!54821 (= (apply!159 lt!90767 lt!90766) (get!2115 (getValueByKey!217 (toList!1156 lt!90767) lt!90766)))))

(declare-fun bs!7475 () Bool)

(assert (= bs!7475 d!54821))

(declare-fun m!211249 () Bool)

(assert (=> bs!7475 m!211249))

(assert (=> bs!7475 m!211249))

(declare-fun m!211251 () Bool)

(assert (=> bs!7475 m!211251))

(assert (=> b!183501 d!54821))

(declare-fun d!54823 () Bool)

(declare-fun e!120905 () Bool)

(assert (=> d!54823 e!120905))

(declare-fun res!86919 () Bool)

(assert (=> d!54823 (=> res!86919 e!120905)))

(declare-fun lt!90845 () Bool)

(assert (=> d!54823 (= res!86919 (not lt!90845))))

(declare-fun lt!90844 () Bool)

(assert (=> d!54823 (= lt!90845 lt!90844)))

(declare-fun lt!90847 () Unit!5548)

(declare-fun e!120904 () Unit!5548)

(assert (=> d!54823 (= lt!90847 e!120904)))

(declare-fun c!32928 () Bool)

(assert (=> d!54823 (= c!32928 lt!90844)))

(assert (=> d!54823 (= lt!90844 (containsKey!220 (toList!1156 (+!279 lt!90770 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))) lt!90758))))

(assert (=> d!54823 (= (contains!1254 (+!279 lt!90770 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248))) lt!90758) lt!90845)))

(declare-fun b!183659 () Bool)

(declare-fun lt!90846 () Unit!5548)

(assert (=> b!183659 (= e!120904 lt!90846)))

(assert (=> b!183659 (= lt!90846 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1156 (+!279 lt!90770 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))) lt!90758))))

(assert (=> b!183659 (isDefined!169 (getValueByKey!217 (toList!1156 (+!279 lt!90770 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))) lt!90758))))

(declare-fun b!183660 () Bool)

(declare-fun Unit!5553 () Unit!5548)

(assert (=> b!183660 (= e!120904 Unit!5553)))

(declare-fun b!183661 () Bool)

(assert (=> b!183661 (= e!120905 (isDefined!169 (getValueByKey!217 (toList!1156 (+!279 lt!90770 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))) lt!90758)))))

(assert (= (and d!54823 c!32928) b!183659))

(assert (= (and d!54823 (not c!32928)) b!183660))

(assert (= (and d!54823 (not res!86919)) b!183661))

(declare-fun m!211253 () Bool)

(assert (=> d!54823 m!211253))

(declare-fun m!211255 () Bool)

(assert (=> b!183659 m!211255))

(declare-fun m!211257 () Bool)

(assert (=> b!183659 m!211257))

(assert (=> b!183659 m!211257))

(declare-fun m!211259 () Bool)

(assert (=> b!183659 m!211259))

(assert (=> b!183661 m!211257))

(assert (=> b!183661 m!211257))

(assert (=> b!183661 m!211259))

(assert (=> b!183501 d!54823))

(declare-fun d!54825 () Bool)

(assert (=> d!54825 (contains!1254 (+!279 lt!90770 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248))) lt!90758)))

(declare-fun lt!90850 () Unit!5548)

(declare-fun choose!978 (ListLongMap!2281 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5548)

(assert (=> d!54825 (= lt!90850 (choose!978 lt!90770 lt!90765 (zeroValue!3590 thiss!1248) lt!90758))))

(assert (=> d!54825 (contains!1254 lt!90770 lt!90758)))

(assert (=> d!54825 (= (addStillContains!135 lt!90770 lt!90765 (zeroValue!3590 thiss!1248) lt!90758) lt!90850)))

(declare-fun bs!7476 () Bool)

(assert (= bs!7476 d!54825))

(assert (=> bs!7476 m!211097))

(assert (=> bs!7476 m!211097))

(assert (=> bs!7476 m!211099))

(declare-fun m!211261 () Bool)

(assert (=> bs!7476 m!211261))

(declare-fun m!211263 () Bool)

(assert (=> bs!7476 m!211263))

(assert (=> b!183501 d!54825))

(declare-fun d!54827 () Bool)

(declare-fun e!120906 () Bool)

(assert (=> d!54827 e!120906))

(declare-fun res!86920 () Bool)

(assert (=> d!54827 (=> (not res!86920) (not e!120906))))

(declare-fun lt!90854 () ListLongMap!2281)

(assert (=> d!54827 (= res!86920 (contains!1254 lt!90854 (_1!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248)))))))

(declare-fun lt!90851 () List!2300)

(assert (=> d!54827 (= lt!90854 (ListLongMap!2282 lt!90851))))

(declare-fun lt!90852 () Unit!5548)

(declare-fun lt!90853 () Unit!5548)

(assert (=> d!54827 (= lt!90852 lt!90853)))

(assert (=> d!54827 (= (getValueByKey!217 lt!90851 (_1!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248)))))))

(assert (=> d!54827 (= lt!90853 (lemmaContainsTupThenGetReturnValue!114 lt!90851 (_1!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248)))))))

(assert (=> d!54827 (= lt!90851 (insertStrictlySorted!117 (toList!1156 lt!90757) (_1!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248)))))))

(assert (=> d!54827 (= (+!279 lt!90757 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248))) lt!90854)))

(declare-fun b!183663 () Bool)

(declare-fun res!86921 () Bool)

(assert (=> b!183663 (=> (not res!86921) (not e!120906))))

(assert (=> b!183663 (= res!86921 (= (getValueByKey!217 (toList!1156 lt!90854) (_1!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248))))))))

(declare-fun b!183664 () Bool)

(assert (=> b!183664 (= e!120906 (contains!1258 (toList!1156 lt!90854) (tuple2!3361 lt!90751 (minValue!3590 thiss!1248))))))

(assert (= (and d!54827 res!86920) b!183663))

(assert (= (and b!183663 res!86921) b!183664))

(declare-fun m!211265 () Bool)

(assert (=> d!54827 m!211265))

(declare-fun m!211267 () Bool)

(assert (=> d!54827 m!211267))

(declare-fun m!211269 () Bool)

(assert (=> d!54827 m!211269))

(declare-fun m!211271 () Bool)

(assert (=> d!54827 m!211271))

(declare-fun m!211273 () Bool)

(assert (=> b!183663 m!211273))

(declare-fun m!211275 () Bool)

(assert (=> b!183664 m!211275))

(assert (=> b!183501 d!54827))

(declare-fun d!54829 () Bool)

(declare-fun e!120907 () Bool)

(assert (=> d!54829 e!120907))

(declare-fun res!86922 () Bool)

(assert (=> d!54829 (=> (not res!86922) (not e!120907))))

(declare-fun lt!90858 () ListLongMap!2281)

(assert (=> d!54829 (= res!86922 (contains!1254 lt!90858 (_1!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248)))))))

(declare-fun lt!90855 () List!2300)

(assert (=> d!54829 (= lt!90858 (ListLongMap!2282 lt!90855))))

(declare-fun lt!90856 () Unit!5548)

(declare-fun lt!90857 () Unit!5548)

(assert (=> d!54829 (= lt!90856 lt!90857)))

(assert (=> d!54829 (= (getValueByKey!217 lt!90855 (_1!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248)))))))

(assert (=> d!54829 (= lt!90857 (lemmaContainsTupThenGetReturnValue!114 lt!90855 (_1!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248)))))))

(assert (=> d!54829 (= lt!90855 (insertStrictlySorted!117 (toList!1156 lt!90755) (_1!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248)))))))

(assert (=> d!54829 (= (+!279 lt!90755 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248))) lt!90858)))

(declare-fun b!183665 () Bool)

(declare-fun res!86923 () Bool)

(assert (=> b!183665 (=> (not res!86923) (not e!120907))))

(assert (=> b!183665 (= res!86923 (= (getValueByKey!217 (toList!1156 lt!90858) (_1!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248))))))))

(declare-fun b!183666 () Bool)

(assert (=> b!183666 (= e!120907 (contains!1258 (toList!1156 lt!90858) (tuple2!3361 lt!90759 (minValue!3590 thiss!1248))))))

(assert (= (and d!54829 res!86922) b!183665))

(assert (= (and b!183665 res!86923) b!183666))

(declare-fun m!211277 () Bool)

(assert (=> d!54829 m!211277))

(declare-fun m!211279 () Bool)

(assert (=> d!54829 m!211279))

(declare-fun m!211281 () Bool)

(assert (=> d!54829 m!211281))

(declare-fun m!211283 () Bool)

(assert (=> d!54829 m!211283))

(declare-fun m!211285 () Bool)

(assert (=> b!183665 m!211285))

(declare-fun m!211287 () Bool)

(assert (=> b!183666 m!211287))

(assert (=> b!183501 d!54829))

(declare-fun d!54831 () Bool)

(assert (=> d!54831 (= (apply!159 (+!279 lt!90767 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248))) lt!90766) (get!2115 (getValueByKey!217 (toList!1156 (+!279 lt!90767 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248)))) lt!90766)))))

(declare-fun bs!7477 () Bool)

(assert (= bs!7477 d!54831))

(declare-fun m!211289 () Bool)

(assert (=> bs!7477 m!211289))

(assert (=> bs!7477 m!211289))

(declare-fun m!211291 () Bool)

(assert (=> bs!7477 m!211291))

(assert (=> b!183501 d!54831))

(declare-fun d!54833 () Bool)

(declare-fun e!120908 () Bool)

(assert (=> d!54833 e!120908))

(declare-fun res!86924 () Bool)

(assert (=> d!54833 (=> (not res!86924) (not e!120908))))

(declare-fun lt!90862 () ListLongMap!2281)

(assert (=> d!54833 (= res!86924 (contains!1254 lt!90862 (_1!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))))))

(declare-fun lt!90859 () List!2300)

(assert (=> d!54833 (= lt!90862 (ListLongMap!2282 lt!90859))))

(declare-fun lt!90860 () Unit!5548)

(declare-fun lt!90861 () Unit!5548)

(assert (=> d!54833 (= lt!90860 lt!90861)))

(assert (=> d!54833 (= (getValueByKey!217 lt!90859 (_1!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54833 (= lt!90861 (lemmaContainsTupThenGetReturnValue!114 lt!90859 (_1!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54833 (= lt!90859 (insertStrictlySorted!117 (toList!1156 lt!90770) (_1!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54833 (= (+!279 lt!90770 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248))) lt!90862)))

(declare-fun b!183667 () Bool)

(declare-fun res!86925 () Bool)

(assert (=> b!183667 (=> (not res!86925) (not e!120908))))

(assert (=> b!183667 (= res!86925 (= (getValueByKey!217 (toList!1156 lt!90862) (_1!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248))))))))

(declare-fun b!183668 () Bool)

(assert (=> b!183668 (= e!120908 (contains!1258 (toList!1156 lt!90862) (tuple2!3361 lt!90765 (zeroValue!3590 thiss!1248))))))

(assert (= (and d!54833 res!86924) b!183667))

(assert (= (and b!183667 res!86925) b!183668))

(declare-fun m!211293 () Bool)

(assert (=> d!54833 m!211293))

(declare-fun m!211295 () Bool)

(assert (=> d!54833 m!211295))

(declare-fun m!211297 () Bool)

(assert (=> d!54833 m!211297))

(declare-fun m!211299 () Bool)

(assert (=> d!54833 m!211299))

(declare-fun m!211301 () Bool)

(assert (=> b!183667 m!211301))

(declare-fun m!211303 () Bool)

(assert (=> b!183668 m!211303))

(assert (=> b!183501 d!54833))

(declare-fun d!54835 () Bool)

(assert (=> d!54835 (= (apply!159 (+!279 lt!90767 (tuple2!3361 lt!90750 (zeroValue!3590 thiss!1248))) lt!90766) (apply!159 lt!90767 lt!90766))))

(declare-fun lt!90863 () Unit!5548)

(assert (=> d!54835 (= lt!90863 (choose!977 lt!90767 lt!90750 (zeroValue!3590 thiss!1248) lt!90766))))

(declare-fun e!120909 () Bool)

(assert (=> d!54835 e!120909))

(declare-fun res!86926 () Bool)

(assert (=> d!54835 (=> (not res!86926) (not e!120909))))

(assert (=> d!54835 (= res!86926 (contains!1254 lt!90767 lt!90766))))

(assert (=> d!54835 (= (addApplyDifferent!135 lt!90767 lt!90750 (zeroValue!3590 thiss!1248) lt!90766) lt!90863)))

(declare-fun b!183669 () Bool)

(assert (=> b!183669 (= e!120909 (not (= lt!90766 lt!90750)))))

(assert (= (and d!54835 res!86926) b!183669))

(assert (=> d!54835 m!211107))

(assert (=> d!54835 m!211109))

(assert (=> d!54835 m!211117))

(assert (=> d!54835 m!211107))

(declare-fun m!211305 () Bool)

(assert (=> d!54835 m!211305))

(declare-fun m!211307 () Bool)

(assert (=> d!54835 m!211307))

(assert (=> b!183501 d!54835))

(declare-fun d!54837 () Bool)

(assert (=> d!54837 (= (apply!159 (+!279 lt!90755 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248))) lt!90769) (get!2115 (getValueByKey!217 (toList!1156 (+!279 lt!90755 (tuple2!3361 lt!90759 (minValue!3590 thiss!1248)))) lt!90769)))))

(declare-fun bs!7478 () Bool)

(assert (= bs!7478 d!54837))

(declare-fun m!211309 () Bool)

(assert (=> bs!7478 m!211309))

(assert (=> bs!7478 m!211309))

(declare-fun m!211311 () Bool)

(assert (=> bs!7478 m!211311))

(assert (=> b!183501 d!54837))

(declare-fun d!54839 () Bool)

(assert (=> d!54839 (= (apply!159 (+!279 lt!90757 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248))) lt!90761) (get!2115 (getValueByKey!217 (toList!1156 (+!279 lt!90757 (tuple2!3361 lt!90751 (minValue!3590 thiss!1248)))) lt!90761)))))

(declare-fun bs!7479 () Bool)

(assert (= bs!7479 d!54839))

(declare-fun m!211313 () Bool)

(assert (=> bs!7479 m!211313))

(assert (=> bs!7479 m!211313))

(declare-fun m!211315 () Bool)

(assert (=> bs!7479 m!211315))

(assert (=> b!183501 d!54839))

(declare-fun d!54841 () Bool)

(declare-fun e!120911 () Bool)

(assert (=> d!54841 e!120911))

(declare-fun res!86927 () Bool)

(assert (=> d!54841 (=> res!86927 e!120911)))

(declare-fun lt!90865 () Bool)

(assert (=> d!54841 (= res!86927 (not lt!90865))))

(declare-fun lt!90864 () Bool)

(assert (=> d!54841 (= lt!90865 lt!90864)))

(declare-fun lt!90867 () Unit!5548)

(declare-fun e!120910 () Unit!5548)

(assert (=> d!54841 (= lt!90867 e!120910)))

(declare-fun c!32929 () Bool)

(assert (=> d!54841 (= c!32929 lt!90864)))

(assert (=> d!54841 (= lt!90864 (containsKey!220 (toList!1156 lt!90756) (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54841 (= (contains!1254 lt!90756 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)) lt!90865)))

(declare-fun b!183670 () Bool)

(declare-fun lt!90866 () Unit!5548)

(assert (=> b!183670 (= e!120910 lt!90866)))

(assert (=> b!183670 (= lt!90866 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1156 lt!90756) (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183670 (isDefined!169 (getValueByKey!217 (toList!1156 lt!90756) (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183671 () Bool)

(declare-fun Unit!5554 () Unit!5548)

(assert (=> b!183671 (= e!120910 Unit!5554)))

(declare-fun b!183672 () Bool)

(assert (=> b!183672 (= e!120911 (isDefined!169 (getValueByKey!217 (toList!1156 lt!90756) (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54841 c!32929) b!183670))

(assert (= (and d!54841 (not c!32929)) b!183671))

(assert (= (and d!54841 (not res!86927)) b!183672))

(assert (=> d!54841 m!211121))

(declare-fun m!211317 () Bool)

(assert (=> d!54841 m!211317))

(assert (=> b!183670 m!211121))

(declare-fun m!211319 () Bool)

(assert (=> b!183670 m!211319))

(assert (=> b!183670 m!211121))

(declare-fun m!211321 () Bool)

(assert (=> b!183670 m!211321))

(assert (=> b!183670 m!211321))

(declare-fun m!211323 () Bool)

(assert (=> b!183670 m!211323))

(assert (=> b!183672 m!211121))

(assert (=> b!183672 m!211321))

(assert (=> b!183672 m!211321))

(assert (=> b!183672 m!211323))

(assert (=> b!183507 d!54841))

(declare-fun d!54843 () Bool)

(assert (=> d!54843 (= (apply!159 lt!90756 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2115 (getValueByKey!217 (toList!1156 lt!90756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7480 () Bool)

(assert (= bs!7480 d!54843))

(declare-fun m!211325 () Bool)

(assert (=> bs!7480 m!211325))

(assert (=> bs!7480 m!211325))

(declare-fun m!211327 () Bool)

(assert (=> bs!7480 m!211327))

(assert (=> b!183500 d!54843))

(declare-fun d!54845 () Bool)

(declare-fun e!120913 () Bool)

(assert (=> d!54845 e!120913))

(declare-fun res!86928 () Bool)

(assert (=> d!54845 (=> res!86928 e!120913)))

(declare-fun lt!90869 () Bool)

(assert (=> d!54845 (= res!86928 (not lt!90869))))

(declare-fun lt!90868 () Bool)

(assert (=> d!54845 (= lt!90869 lt!90868)))

(declare-fun lt!90871 () Unit!5548)

(declare-fun e!120912 () Unit!5548)

(assert (=> d!54845 (= lt!90871 e!120912)))

(declare-fun c!32930 () Bool)

(assert (=> d!54845 (= c!32930 lt!90868)))

(assert (=> d!54845 (= lt!90868 (containsKey!220 (toList!1156 lt!90756) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54845 (= (contains!1254 lt!90756 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90869)))

(declare-fun b!183673 () Bool)

(declare-fun lt!90870 () Unit!5548)

(assert (=> b!183673 (= e!120912 lt!90870)))

(assert (=> b!183673 (= lt!90870 (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1156 lt!90756) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183673 (isDefined!169 (getValueByKey!217 (toList!1156 lt!90756) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183674 () Bool)

(declare-fun Unit!5555 () Unit!5548)

(assert (=> b!183674 (= e!120912 Unit!5555)))

(declare-fun b!183675 () Bool)

(assert (=> b!183675 (= e!120913 (isDefined!169 (getValueByKey!217 (toList!1156 lt!90756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54845 c!32930) b!183673))

(assert (= (and d!54845 (not c!32930)) b!183674))

(assert (= (and d!54845 (not res!86928)) b!183675))

(declare-fun m!211329 () Bool)

(assert (=> d!54845 m!211329))

(declare-fun m!211331 () Bool)

(assert (=> b!183673 m!211331))

(assert (=> b!183673 m!211325))

(assert (=> b!183673 m!211325))

(declare-fun m!211333 () Bool)

(assert (=> b!183673 m!211333))

(assert (=> b!183675 m!211325))

(assert (=> b!183675 m!211325))

(assert (=> b!183675 m!211333))

(assert (=> bm!18511 d!54845))

(declare-fun d!54847 () Bool)

(assert (=> d!54847 (isDefined!169 (getValueByKey!217 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(declare-fun lt!90874 () Unit!5548)

(declare-fun choose!979 (List!2300 (_ BitVec 64)) Unit!5548)

(assert (=> d!54847 (= lt!90874 (choose!979 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(declare-fun e!120916 () Bool)

(assert (=> d!54847 e!120916))

(declare-fun res!86931 () Bool)

(assert (=> d!54847 (=> (not res!86931) (not e!120916))))

(declare-fun isStrictlySorted!332 (List!2300) Bool)

(assert (=> d!54847 (= res!86931 (isStrictlySorted!332 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))))

(assert (=> d!54847 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!168 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828) lt!90874)))

(declare-fun b!183678 () Bool)

(assert (=> b!183678 (= e!120916 (containsKey!220 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(assert (= (and d!54847 res!86931) b!183678))

(assert (=> d!54847 m!211087))

(assert (=> d!54847 m!211087))

(assert (=> d!54847 m!211089))

(declare-fun m!211335 () Bool)

(assert (=> d!54847 m!211335))

(declare-fun m!211337 () Bool)

(assert (=> d!54847 m!211337))

(assert (=> b!183678 m!211083))

(assert (=> b!183453 d!54847))

(declare-fun d!54849 () Bool)

(declare-fun isEmpty!470 (Option!223) Bool)

(assert (=> d!54849 (= (isDefined!169 (getValueByKey!217 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828)) (not (isEmpty!470 (getValueByKey!217 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))))

(declare-fun bs!7481 () Bool)

(assert (= bs!7481 d!54849))

(assert (=> bs!7481 m!211087))

(declare-fun m!211339 () Bool)

(assert (=> bs!7481 m!211339))

(assert (=> b!183453 d!54849))

(declare-fun d!54851 () Bool)

(declare-fun c!32935 () Bool)

(assert (=> d!54851 (= c!32935 (and ((_ is Cons!2296) (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) (= (_1!1691 (h!2925 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828)))))

(declare-fun e!120921 () Option!223)

(assert (=> d!54851 (= (getValueByKey!217 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828) e!120921)))

(declare-fun b!183689 () Bool)

(declare-fun e!120922 () Option!223)

(assert (=> b!183689 (= e!120922 (getValueByKey!217 (t!7160 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) key!828))))

(declare-fun b!183690 () Bool)

(assert (=> b!183690 (= e!120922 None!221)))

(declare-fun b!183688 () Bool)

(assert (=> b!183688 (= e!120921 e!120922)))

(declare-fun c!32936 () Bool)

(assert (=> b!183688 (= c!32936 (and ((_ is Cons!2296) (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) (not (= (_1!1691 (h!2925 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828))))))

(declare-fun b!183687 () Bool)

(assert (=> b!183687 (= e!120921 (Some!222 (_2!1691 (h!2925 (toList!1156 (getCurrentListMap!808 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))))))

(assert (= (and d!54851 c!32935) b!183687))

(assert (= (and d!54851 (not c!32935)) b!183688))

(assert (= (and b!183688 c!32936) b!183689))

(assert (= (and b!183688 (not c!32936)) b!183690))

(declare-fun m!211341 () Bool)

(assert (=> b!183689 m!211341))

(assert (=> b!183453 d!54851))

(assert (=> b!183498 d!54801))

(declare-fun d!54853 () Bool)

(assert (=> d!54853 (= (apply!159 lt!90756 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)) (get!2115 (getValueByKey!217 (toList!1156 lt!90756) (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7482 () Bool)

(assert (= bs!7482 d!54853))

(assert (=> bs!7482 m!211121))

(assert (=> bs!7482 m!211321))

(assert (=> bs!7482 m!211321))

(declare-fun m!211343 () Bool)

(assert (=> bs!7482 m!211343))

(assert (=> b!183514 d!54853))

(declare-fun d!54855 () Bool)

(declare-fun c!32939 () Bool)

(assert (=> d!54855 (= c!32939 ((_ is ValueCellFull!1805) (select (arr!3675 (_values!3732 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!120925 () V!5377)

(assert (=> d!54855 (= (get!2114 (select (arr!3675 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!120925)))

(declare-fun b!183695 () Bool)

(declare-fun get!2116 (ValueCell!1805 V!5377) V!5377)

(assert (=> b!183695 (= e!120925 (get!2116 (select (arr!3675 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183696 () Bool)

(declare-fun get!2117 (ValueCell!1805 V!5377) V!5377)

(assert (=> b!183696 (= e!120925 (get!2117 (select (arr!3675 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54855 c!32939) b!183695))

(assert (= (and d!54855 (not c!32939)) b!183696))

(assert (=> b!183695 m!211143))

(assert (=> b!183695 m!211141))

(declare-fun m!211345 () Bool)

(assert (=> b!183695 m!211345))

(assert (=> b!183696 m!211143))

(assert (=> b!183696 m!211141))

(declare-fun m!211347 () Bool)

(assert (=> b!183696 m!211347))

(assert (=> b!183514 d!54855))

(declare-fun d!54857 () Bool)

(assert (=> d!54857 (= (apply!159 lt!90756 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2115 (getValueByKey!217 (toList!1156 lt!90756) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7483 () Bool)

(assert (= bs!7483 d!54857))

(assert (=> bs!7483 m!211207))

(assert (=> bs!7483 m!211207))

(declare-fun m!211349 () Bool)

(assert (=> bs!7483 m!211349))

(assert (=> b!183506 d!54857))

(declare-fun d!54859 () Bool)

(declare-fun res!86941 () Bool)

(declare-fun e!120928 () Bool)

(assert (=> d!54859 (=> (not res!86941) (not e!120928))))

(assert (=> d!54859 (= res!86941 (validMask!0 (mask!8811 thiss!1248)))))

(assert (=> d!54859 (= (simpleValid!175 thiss!1248) e!120928)))

(declare-fun b!183705 () Bool)

(declare-fun res!86940 () Bool)

(assert (=> b!183705 (=> (not res!86940) (not e!120928))))

(assert (=> b!183705 (= res!86940 (and (= (size!3987 (_values!3732 thiss!1248)) (bvadd (mask!8811 thiss!1248) #b00000000000000000000000000000001)) (= (size!3986 (_keys!5667 thiss!1248)) (size!3987 (_values!3732 thiss!1248))) (bvsge (_size!1308 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1308 thiss!1248) (bvadd (mask!8811 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!183708 () Bool)

(assert (=> b!183708 (= e!120928 (and (bvsge (extraKeys!3486 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3486 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1308 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!183707 () Bool)

(declare-fun res!86942 () Bool)

(assert (=> b!183707 (=> (not res!86942) (not e!120928))))

(declare-fun size!3992 (LongMapFixedSize!2518) (_ BitVec 32))

(assert (=> b!183707 (= res!86942 (= (size!3992 thiss!1248) (bvadd (_size!1308 thiss!1248) (bvsdiv (bvadd (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!183706 () Bool)

(declare-fun res!86943 () Bool)

(assert (=> b!183706 (=> (not res!86943) (not e!120928))))

(assert (=> b!183706 (= res!86943 (bvsge (size!3992 thiss!1248) (_size!1308 thiss!1248)))))

(assert (= (and d!54859 res!86941) b!183705))

(assert (= (and b!183705 res!86940) b!183706))

(assert (= (and b!183706 res!86943) b!183707))

(assert (= (and b!183707 res!86942) b!183708))

(assert (=> d!54859 m!211025))

(declare-fun m!211351 () Bool)

(assert (=> b!183707 m!211351))

(assert (=> b!183706 m!211351))

(assert (=> d!54779 d!54859))

(assert (=> d!54789 d!54781))

(declare-fun d!54861 () Bool)

(declare-fun e!120929 () Bool)

(assert (=> d!54861 e!120929))

(declare-fun res!86944 () Bool)

(assert (=> d!54861 (=> (not res!86944) (not e!120929))))

(declare-fun lt!90878 () ListLongMap!2281)

(assert (=> d!54861 (= res!86944 (contains!1254 lt!90878 (_1!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(declare-fun lt!90875 () List!2300)

(assert (=> d!54861 (= lt!90878 (ListLongMap!2282 lt!90875))))

(declare-fun lt!90876 () Unit!5548)

(declare-fun lt!90877 () Unit!5548)

(assert (=> d!54861 (= lt!90876 lt!90877)))

(assert (=> d!54861 (= (getValueByKey!217 lt!90875 (_1!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(assert (=> d!54861 (= lt!90877 (lemmaContainsTupThenGetReturnValue!114 lt!90875 (_1!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(assert (=> d!54861 (= lt!90875 (insertStrictlySorted!117 (toList!1156 call!18517) (_1!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))) (_2!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(assert (=> d!54861 (= (+!279 call!18517 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))) lt!90878)))

(declare-fun b!183709 () Bool)

(declare-fun res!86945 () Bool)

(assert (=> b!183709 (=> (not res!86945) (not e!120929))))

(assert (=> b!183709 (= res!86945 (= (getValueByKey!217 (toList!1156 lt!90878) (_1!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) (Some!222 (_2!1691 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(declare-fun b!183710 () Bool)

(assert (=> b!183710 (= e!120929 (contains!1258 (toList!1156 lt!90878) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))

(assert (= (and d!54861 res!86944) b!183709))

(assert (= (and b!183709 res!86945) b!183710))

(declare-fun m!211353 () Bool)

(assert (=> d!54861 m!211353))

(declare-fun m!211355 () Bool)

(assert (=> d!54861 m!211355))

(declare-fun m!211357 () Bool)

(assert (=> d!54861 m!211357))

(declare-fun m!211359 () Bool)

(assert (=> d!54861 m!211359))

(declare-fun m!211361 () Bool)

(assert (=> b!183709 m!211361))

(declare-fun m!211363 () Bool)

(assert (=> b!183710 m!211363))

(assert (=> b!183513 d!54861))

(declare-fun b!183719 () Bool)

(declare-fun e!120934 () (_ BitVec 32))

(declare-fun call!18529 () (_ BitVec 32))

(assert (=> b!183719 (= e!120934 (bvadd #b00000000000000000000000000000001 call!18529))))

(declare-fun b!183720 () Bool)

(declare-fun e!120935 () (_ BitVec 32))

(assert (=> b!183720 (= e!120935 e!120934)))

(declare-fun c!32944 () Bool)

(assert (=> b!183720 (= c!32944 (validKeyInArray!0 (select (arr!3674 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54863 () Bool)

(declare-fun lt!90881 () (_ BitVec 32))

(assert (=> d!54863 (and (bvsge lt!90881 #b00000000000000000000000000000000) (bvsle lt!90881 (bvsub (size!3986 (_keys!5667 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54863 (= lt!90881 e!120935)))

(declare-fun c!32945 () Bool)

(assert (=> d!54863 (= c!32945 (bvsge #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))))))

(assert (=> d!54863 (and (bvsle #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3986 (_keys!5667 thiss!1248)) (size!3986 (_keys!5667 thiss!1248))))))

(assert (=> d!54863 (= (arrayCountValidKeys!0 (_keys!5667 thiss!1248) #b00000000000000000000000000000000 (size!3986 (_keys!5667 thiss!1248))) lt!90881)))

(declare-fun b!183721 () Bool)

(assert (=> b!183721 (= e!120934 call!18529)))

(declare-fun b!183722 () Bool)

(assert (=> b!183722 (= e!120935 #b00000000000000000000000000000000)))

(declare-fun bm!18526 () Bool)

(assert (=> bm!18526 (= call!18529 (arrayCountValidKeys!0 (_keys!5667 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3986 (_keys!5667 thiss!1248))))))

(assert (= (and d!54863 c!32945) b!183722))

(assert (= (and d!54863 (not c!32945)) b!183720))

(assert (= (and b!183720 c!32944) b!183719))

(assert (= (and b!183720 (not c!32944)) b!183721))

(assert (= (or b!183719 b!183721) bm!18526))

(assert (=> b!183720 m!211121))

(assert (=> b!183720 m!211121))

(assert (=> b!183720 m!211131))

(declare-fun m!211365 () Bool)

(assert (=> bm!18526 m!211365))

(assert (=> b!183444 d!54863))

(assert (=> b!183455 d!54849))

(assert (=> b!183455 d!54851))

(declare-fun condMapEmpty!7389 () Bool)

(declare-fun mapDefault!7389 () ValueCell!1805)

(assert (=> mapNonEmpty!7388 (= condMapEmpty!7389 (= mapRest!7388 ((as const (Array (_ BitVec 32) ValueCell!1805)) mapDefault!7389)))))

(declare-fun e!120937 () Bool)

(declare-fun mapRes!7389 () Bool)

(assert (=> mapNonEmpty!7388 (= tp!16361 (and e!120937 mapRes!7389))))

(declare-fun b!183724 () Bool)

(assert (=> b!183724 (= e!120937 tp_is_empty!4297)))

(declare-fun mapIsEmpty!7389 () Bool)

(assert (=> mapIsEmpty!7389 mapRes!7389))

(declare-fun b!183723 () Bool)

(declare-fun e!120936 () Bool)

(assert (=> b!183723 (= e!120936 tp_is_empty!4297)))

(declare-fun mapNonEmpty!7389 () Bool)

(declare-fun tp!16362 () Bool)

(assert (=> mapNonEmpty!7389 (= mapRes!7389 (and tp!16362 e!120936))))

(declare-fun mapKey!7389 () (_ BitVec 32))

(declare-fun mapValue!7389 () ValueCell!1805)

(declare-fun mapRest!7389 () (Array (_ BitVec 32) ValueCell!1805))

(assert (=> mapNonEmpty!7389 (= mapRest!7388 (store mapRest!7389 mapKey!7389 mapValue!7389))))

(assert (= (and mapNonEmpty!7388 condMapEmpty!7389) mapIsEmpty!7389))

(assert (= (and mapNonEmpty!7388 (not condMapEmpty!7389)) mapNonEmpty!7389))

(assert (= (and mapNonEmpty!7389 ((_ is ValueCellFull!1805) mapValue!7389)) b!183723))

(assert (= (and mapNonEmpty!7388 ((_ is ValueCellFull!1805) mapDefault!7389)) b!183724))

(declare-fun m!211367 () Bool)

(assert (=> mapNonEmpty!7389 m!211367))

(declare-fun b_lambda!7221 () Bool)

(assert (= b_lambda!7219 (or (and b!183365 b_free!4525) b_lambda!7221)))

(declare-fun b_lambda!7223 () Bool)

(assert (= b_lambda!7217 (or (and b!183365 b_free!4525) b_lambda!7223)))

(check-sat (not d!54837) (not d!54827) (not b!183659) (not d!54833) (not b!183612) (not d!54805) (not b!183656) (not b!183639) (not b!183720) (not b!183678) (not d!54857) (not d!54849) (not b!183657) (not d!54843) (not b!183573) (not b!183661) (not b_lambda!7221) (not b_lambda!7223) (not b!183666) (not d!54845) (not d!54823) (not b_lambda!7215) (not d!54853) (not b!183665) (not b!183667) (not b!183663) (not b!183615) (not d!54829) (not b!183664) (not bm!18523) (not b!183706) (not b!183696) (not d!54819) (not b!183673) (not b!183707) (not b!183668) (not mapNonEmpty!7389) (not b!183675) (not d!54815) tp_is_empty!4297 (not b!183614) (not d!54821) (not d!54813) (not b_next!4525) (not b!183606) (not d!54817) (not d!54859) (not d!54799) (not b!183578) (not b!183537) (not d!54839) (not b!183608) (not d!54831) (not d!54793) (not b!183604) (not bm!18526) (not d!54803) (not b!183651) (not b!183555) (not d!54811) (not d!54847) (not b!183572) (not b!183672) b_and!11119 (not bm!18520) (not b!183569) (not b!183605) (not b!183710) (not b!183607) (not b!183579) (not b!183618) (not d!54861) (not bm!18517) (not b!183689) (not d!54835) (not b!183540) (not b!183670) (not d!54825) (not d!54841) (not b!183616) (not b!183709) (not d!54797) (not b!183695))
(check-sat b_and!11119 (not b_next!4525))
