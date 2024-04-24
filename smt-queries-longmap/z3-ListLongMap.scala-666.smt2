; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16464 () Bool)

(assert start!16464)

(declare-fun b!163818 () Bool)

(declare-fun b_free!3805 () Bool)

(declare-fun b_next!3805 () Bool)

(assert (=> b!163818 (= b_free!3805 (not b_next!3805))))

(declare-fun tp!14006 () Bool)

(declare-fun b_and!10233 () Bool)

(assert (=> b!163818 (= tp!14006 b_and!10233)))

(declare-fun mapNonEmpty!6120 () Bool)

(declare-fun mapRes!6120 () Bool)

(declare-fun tp!14007 () Bool)

(declare-fun e!107477 () Bool)

(assert (=> mapNonEmpty!6120 (= mapRes!6120 (and tp!14007 e!107477))))

(declare-datatypes ((V!4457 0))(
  ( (V!4458 (val!1848 Int)) )
))
(declare-datatypes ((ValueCell!1460 0))(
  ( (ValueCellFull!1460 (v!3714 V!4457)) (EmptyCell!1460) )
))
(declare-fun mapValue!6120 () ValueCell!1460)

(declare-fun mapKey!6120 () (_ BitVec 32))

(declare-fun mapRest!6120 () (Array (_ BitVec 32) ValueCell!1460))

(declare-datatypes ((array!6291 0))(
  ( (array!6292 (arr!2984 (Array (_ BitVec 32) (_ BitVec 64))) (size!3272 (_ BitVec 32))) )
))
(declare-datatypes ((array!6293 0))(
  ( (array!6294 (arr!2985 (Array (_ BitVec 32) ValueCell!1460)) (size!3273 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1828 0))(
  ( (LongMapFixedSize!1829 (defaultEntry!3356 Int) (mask!8028 (_ BitVec 32)) (extraKeys!3097 (_ BitVec 32)) (zeroValue!3199 V!4457) (minValue!3199 V!4457) (_size!963 (_ BitVec 32)) (_keys!5175 array!6291) (_values!3339 array!6293) (_vacant!963 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1828)

(assert (=> mapNonEmpty!6120 (= (arr!2985 (_values!3339 thiss!1248)) (store mapRest!6120 mapKey!6120 mapValue!6120))))

(declare-fun e!107480 () Bool)

(declare-fun e!107479 () Bool)

(declare-fun tp_is_empty!3607 () Bool)

(declare-fun array_inv!1917 (array!6291) Bool)

(declare-fun array_inv!1918 (array!6293) Bool)

(assert (=> b!163818 (= e!107480 (and tp!14006 tp_is_empty!3607 (array_inv!1917 (_keys!5175 thiss!1248)) (array_inv!1918 (_values!3339 thiss!1248)) e!107479))))

(declare-fun b!163819 () Bool)

(assert (=> b!163819 (= e!107477 tp_is_empty!3607)))

(declare-fun b!163820 () Bool)

(declare-fun res!77508 () Bool)

(declare-fun e!107474 () Bool)

(assert (=> b!163820 (=> (not res!77508) (not e!107474))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163820 (= res!77508 (not (= key!828 (bvneg key!828))))))

(declare-fun res!77507 () Bool)

(assert (=> start!16464 (=> (not res!77507) (not e!107474))))

(declare-fun valid!838 (LongMapFixedSize!1828) Bool)

(assert (=> start!16464 (= res!77507 (valid!838 thiss!1248))))

(assert (=> start!16464 e!107474))

(assert (=> start!16464 e!107480))

(assert (=> start!16464 true))

(declare-fun b!163821 () Bool)

(declare-fun e!107475 () Bool)

(assert (=> b!163821 (= e!107479 (and e!107475 mapRes!6120))))

(declare-fun condMapEmpty!6120 () Bool)

(declare-fun mapDefault!6120 () ValueCell!1460)

(assert (=> b!163821 (= condMapEmpty!6120 (= (arr!2985 (_values!3339 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1460)) mapDefault!6120)))))

(declare-fun b!163822 () Bool)

(declare-fun res!77506 () Bool)

(declare-fun e!107478 () Bool)

(assert (=> b!163822 (=> (not res!77506) (not e!107478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163822 (= res!77506 (validMask!0 (mask!8028 thiss!1248)))))

(declare-fun b!163823 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6291 (_ BitVec 32)) Bool)

(assert (=> b!163823 (= e!107478 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5175 thiss!1248) (mask!8028 thiss!1248))))))

(declare-fun b!163824 () Bool)

(assert (=> b!163824 (= e!107475 tp_is_empty!3607)))

(declare-fun b!163825 () Bool)

(declare-fun res!77505 () Bool)

(assert (=> b!163825 (=> (not res!77505) (not e!107478))))

(assert (=> b!163825 (= res!77505 (and (= (size!3273 (_values!3339 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8028 thiss!1248))) (= (size!3272 (_keys!5175 thiss!1248)) (size!3273 (_values!3339 thiss!1248))) (bvsge (mask!8028 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3097 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3097 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6120 () Bool)

(assert (=> mapIsEmpty!6120 mapRes!6120))

(declare-fun b!163826 () Bool)

(assert (=> b!163826 (= e!107474 e!107478)))

(declare-fun res!77504 () Bool)

(assert (=> b!163826 (=> (not res!77504) (not e!107478))))

(declare-datatypes ((SeekEntryResult!402 0))(
  ( (MissingZero!402 (index!3776 (_ BitVec 32))) (Found!402 (index!3777 (_ BitVec 32))) (Intermediate!402 (undefined!1214 Bool) (index!3778 (_ BitVec 32)) (x!18158 (_ BitVec 32))) (Undefined!402) (MissingVacant!402 (index!3779 (_ BitVec 32))) )
))
(declare-fun lt!82824 () SeekEntryResult!402)

(get-info :version)

(assert (=> b!163826 (= res!77504 (and (not ((_ is Undefined!402) lt!82824)) (not ((_ is MissingVacant!402) lt!82824)) (not ((_ is MissingZero!402) lt!82824)) ((_ is Found!402) lt!82824)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6291 (_ BitVec 32)) SeekEntryResult!402)

(assert (=> b!163826 (= lt!82824 (seekEntryOrOpen!0 key!828 (_keys!5175 thiss!1248) (mask!8028 thiss!1248)))))

(assert (= (and start!16464 res!77507) b!163820))

(assert (= (and b!163820 res!77508) b!163826))

(assert (= (and b!163826 res!77504) b!163822))

(assert (= (and b!163822 res!77506) b!163825))

(assert (= (and b!163825 res!77505) b!163823))

(assert (= (and b!163821 condMapEmpty!6120) mapIsEmpty!6120))

(assert (= (and b!163821 (not condMapEmpty!6120)) mapNonEmpty!6120))

(assert (= (and mapNonEmpty!6120 ((_ is ValueCellFull!1460) mapValue!6120)) b!163819))

(assert (= (and b!163821 ((_ is ValueCellFull!1460) mapDefault!6120)) b!163824))

(assert (= b!163818 b!163821))

(assert (= start!16464 b!163818))

(declare-fun m!194449 () Bool)

(assert (=> mapNonEmpty!6120 m!194449))

(declare-fun m!194451 () Bool)

(assert (=> b!163818 m!194451))

(declare-fun m!194453 () Bool)

(assert (=> b!163818 m!194453))

(declare-fun m!194455 () Bool)

(assert (=> start!16464 m!194455))

(declare-fun m!194457 () Bool)

(assert (=> b!163823 m!194457))

(declare-fun m!194459 () Bool)

(assert (=> b!163826 m!194459))

(declare-fun m!194461 () Bool)

(assert (=> b!163822 m!194461))

(check-sat (not b!163822) (not b!163818) (not b!163826) b_and!10233 (not mapNonEmpty!6120) (not b!163823) (not b_next!3805) tp_is_empty!3607 (not start!16464))
(check-sat b_and!10233 (not b_next!3805))
(get-model)

(declare-fun b!163889 () Bool)

(declare-fun e!107529 () Bool)

(declare-fun call!17311 () Bool)

(assert (=> b!163889 (= e!107529 call!17311)))

(declare-fun d!51559 () Bool)

(declare-fun res!77543 () Bool)

(declare-fun e!107530 () Bool)

(assert (=> d!51559 (=> res!77543 e!107530)))

(assert (=> d!51559 (= res!77543 (bvsge #b00000000000000000000000000000000 (size!3272 (_keys!5175 thiss!1248))))))

(assert (=> d!51559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5175 thiss!1248) (mask!8028 thiss!1248)) e!107530)))

(declare-fun b!163890 () Bool)

(declare-fun e!107531 () Bool)

(assert (=> b!163890 (= e!107531 e!107529)))

(declare-fun lt!82837 () (_ BitVec 64))

(assert (=> b!163890 (= lt!82837 (select (arr!2984 (_keys!5175 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5050 0))(
  ( (Unit!5051) )
))
(declare-fun lt!82838 () Unit!5050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6291 (_ BitVec 64) (_ BitVec 32)) Unit!5050)

(assert (=> b!163890 (= lt!82838 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5175 thiss!1248) lt!82837 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163890 (arrayContainsKey!0 (_keys!5175 thiss!1248) lt!82837 #b00000000000000000000000000000000)))

(declare-fun lt!82839 () Unit!5050)

(assert (=> b!163890 (= lt!82839 lt!82838)))

(declare-fun res!77544 () Bool)

(assert (=> b!163890 (= res!77544 (= (seekEntryOrOpen!0 (select (arr!2984 (_keys!5175 thiss!1248)) #b00000000000000000000000000000000) (_keys!5175 thiss!1248) (mask!8028 thiss!1248)) (Found!402 #b00000000000000000000000000000000)))))

(assert (=> b!163890 (=> (not res!77544) (not e!107529))))

(declare-fun b!163891 () Bool)

(assert (=> b!163891 (= e!107530 e!107531)))

(declare-fun c!30167 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163891 (= c!30167 (validKeyInArray!0 (select (arr!2984 (_keys!5175 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163892 () Bool)

(assert (=> b!163892 (= e!107531 call!17311)))

(declare-fun bm!17308 () Bool)

(assert (=> bm!17308 (= call!17311 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5175 thiss!1248) (mask!8028 thiss!1248)))))

(assert (= (and d!51559 (not res!77543)) b!163891))

(assert (= (and b!163891 c!30167) b!163890))

(assert (= (and b!163891 (not c!30167)) b!163892))

(assert (= (and b!163890 res!77544) b!163889))

(assert (= (or b!163889 b!163892) bm!17308))

(declare-fun m!194491 () Bool)

(assert (=> b!163890 m!194491))

(declare-fun m!194493 () Bool)

(assert (=> b!163890 m!194493))

(declare-fun m!194495 () Bool)

(assert (=> b!163890 m!194495))

(assert (=> b!163890 m!194491))

(declare-fun m!194497 () Bool)

(assert (=> b!163890 m!194497))

(assert (=> b!163891 m!194491))

(assert (=> b!163891 m!194491))

(declare-fun m!194499 () Bool)

(assert (=> b!163891 m!194499))

(declare-fun m!194501 () Bool)

(assert (=> bm!17308 m!194501))

(assert (=> b!163823 d!51559))

(declare-fun d!51561 () Bool)

(assert (=> d!51561 (= (array_inv!1917 (_keys!5175 thiss!1248)) (bvsge (size!3272 (_keys!5175 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163818 d!51561))

(declare-fun d!51563 () Bool)

(assert (=> d!51563 (= (array_inv!1918 (_values!3339 thiss!1248)) (bvsge (size!3273 (_values!3339 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163818 d!51563))

(declare-fun d!51565 () Bool)

(declare-fun res!77551 () Bool)

(declare-fun e!107534 () Bool)

(assert (=> d!51565 (=> (not res!77551) (not e!107534))))

(declare-fun simpleValid!124 (LongMapFixedSize!1828) Bool)

(assert (=> d!51565 (= res!77551 (simpleValid!124 thiss!1248))))

(assert (=> d!51565 (= (valid!838 thiss!1248) e!107534)))

(declare-fun b!163899 () Bool)

(declare-fun res!77552 () Bool)

(assert (=> b!163899 (=> (not res!77552) (not e!107534))))

(declare-fun arrayCountValidKeys!0 (array!6291 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163899 (= res!77552 (= (arrayCountValidKeys!0 (_keys!5175 thiss!1248) #b00000000000000000000000000000000 (size!3272 (_keys!5175 thiss!1248))) (_size!963 thiss!1248)))))

(declare-fun b!163900 () Bool)

(declare-fun res!77553 () Bool)

(assert (=> b!163900 (=> (not res!77553) (not e!107534))))

(assert (=> b!163900 (= res!77553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5175 thiss!1248) (mask!8028 thiss!1248)))))

(declare-fun b!163901 () Bool)

(declare-datatypes ((List!1989 0))(
  ( (Nil!1986) (Cons!1985 (h!2602 (_ BitVec 64)) (t!6783 List!1989)) )
))
(declare-fun arrayNoDuplicates!0 (array!6291 (_ BitVec 32) List!1989) Bool)

(assert (=> b!163901 (= e!107534 (arrayNoDuplicates!0 (_keys!5175 thiss!1248) #b00000000000000000000000000000000 Nil!1986))))

(assert (= (and d!51565 res!77551) b!163899))

(assert (= (and b!163899 res!77552) b!163900))

(assert (= (and b!163900 res!77553) b!163901))

(declare-fun m!194503 () Bool)

(assert (=> d!51565 m!194503))

(declare-fun m!194505 () Bool)

(assert (=> b!163899 m!194505))

(assert (=> b!163900 m!194457))

(declare-fun m!194507 () Bool)

(assert (=> b!163901 m!194507))

(assert (=> start!16464 d!51565))

(declare-fun d!51567 () Bool)

(declare-fun lt!82846 () SeekEntryResult!402)

(assert (=> d!51567 (and (or ((_ is Undefined!402) lt!82846) (not ((_ is Found!402) lt!82846)) (and (bvsge (index!3777 lt!82846) #b00000000000000000000000000000000) (bvslt (index!3777 lt!82846) (size!3272 (_keys!5175 thiss!1248))))) (or ((_ is Undefined!402) lt!82846) ((_ is Found!402) lt!82846) (not ((_ is MissingZero!402) lt!82846)) (and (bvsge (index!3776 lt!82846) #b00000000000000000000000000000000) (bvslt (index!3776 lt!82846) (size!3272 (_keys!5175 thiss!1248))))) (or ((_ is Undefined!402) lt!82846) ((_ is Found!402) lt!82846) ((_ is MissingZero!402) lt!82846) (not ((_ is MissingVacant!402) lt!82846)) (and (bvsge (index!3779 lt!82846) #b00000000000000000000000000000000) (bvslt (index!3779 lt!82846) (size!3272 (_keys!5175 thiss!1248))))) (or ((_ is Undefined!402) lt!82846) (ite ((_ is Found!402) lt!82846) (= (select (arr!2984 (_keys!5175 thiss!1248)) (index!3777 lt!82846)) key!828) (ite ((_ is MissingZero!402) lt!82846) (= (select (arr!2984 (_keys!5175 thiss!1248)) (index!3776 lt!82846)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!402) lt!82846) (= (select (arr!2984 (_keys!5175 thiss!1248)) (index!3779 lt!82846)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!107543 () SeekEntryResult!402)

(assert (=> d!51567 (= lt!82846 e!107543)))

(declare-fun c!30174 () Bool)

(declare-fun lt!82847 () SeekEntryResult!402)

(assert (=> d!51567 (= c!30174 (and ((_ is Intermediate!402) lt!82847) (undefined!1214 lt!82847)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6291 (_ BitVec 32)) SeekEntryResult!402)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51567 (= lt!82847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8028 thiss!1248)) key!828 (_keys!5175 thiss!1248) (mask!8028 thiss!1248)))))

(assert (=> d!51567 (validMask!0 (mask!8028 thiss!1248))))

(assert (=> d!51567 (= (seekEntryOrOpen!0 key!828 (_keys!5175 thiss!1248) (mask!8028 thiss!1248)) lt!82846)))

(declare-fun b!163914 () Bool)

(assert (=> b!163914 (= e!107543 Undefined!402)))

(declare-fun b!163915 () Bool)

(declare-fun c!30175 () Bool)

(declare-fun lt!82848 () (_ BitVec 64))

(assert (=> b!163915 (= c!30175 (= lt!82848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107541 () SeekEntryResult!402)

(declare-fun e!107542 () SeekEntryResult!402)

(assert (=> b!163915 (= e!107541 e!107542)))

(declare-fun b!163916 () Bool)

(assert (=> b!163916 (= e!107541 (Found!402 (index!3778 lt!82847)))))

(declare-fun b!163917 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6291 (_ BitVec 32)) SeekEntryResult!402)

(assert (=> b!163917 (= e!107542 (seekKeyOrZeroReturnVacant!0 (x!18158 lt!82847) (index!3778 lt!82847) (index!3778 lt!82847) key!828 (_keys!5175 thiss!1248) (mask!8028 thiss!1248)))))

(declare-fun b!163918 () Bool)

(assert (=> b!163918 (= e!107543 e!107541)))

(assert (=> b!163918 (= lt!82848 (select (arr!2984 (_keys!5175 thiss!1248)) (index!3778 lt!82847)))))

(declare-fun c!30176 () Bool)

(assert (=> b!163918 (= c!30176 (= lt!82848 key!828))))

(declare-fun b!163919 () Bool)

(assert (=> b!163919 (= e!107542 (MissingZero!402 (index!3778 lt!82847)))))

(assert (= (and d!51567 c!30174) b!163914))

(assert (= (and d!51567 (not c!30174)) b!163918))

(assert (= (and b!163918 c!30176) b!163916))

(assert (= (and b!163918 (not c!30176)) b!163915))

(assert (= (and b!163915 c!30175) b!163919))

(assert (= (and b!163915 (not c!30175)) b!163917))

(assert (=> d!51567 m!194461))

(declare-fun m!194509 () Bool)

(assert (=> d!51567 m!194509))

(declare-fun m!194511 () Bool)

(assert (=> d!51567 m!194511))

(declare-fun m!194513 () Bool)

(assert (=> d!51567 m!194513))

(assert (=> d!51567 m!194511))

(declare-fun m!194515 () Bool)

(assert (=> d!51567 m!194515))

(declare-fun m!194517 () Bool)

(assert (=> d!51567 m!194517))

(declare-fun m!194519 () Bool)

(assert (=> b!163917 m!194519))

(declare-fun m!194521 () Bool)

(assert (=> b!163918 m!194521))

(assert (=> b!163826 d!51567))

(declare-fun d!51569 () Bool)

(assert (=> d!51569 (= (validMask!0 (mask!8028 thiss!1248)) (and (or (= (mask!8028 thiss!1248) #b00000000000000000000000000000111) (= (mask!8028 thiss!1248) #b00000000000000000000000000001111) (= (mask!8028 thiss!1248) #b00000000000000000000000000011111) (= (mask!8028 thiss!1248) #b00000000000000000000000000111111) (= (mask!8028 thiss!1248) #b00000000000000000000000001111111) (= (mask!8028 thiss!1248) #b00000000000000000000000011111111) (= (mask!8028 thiss!1248) #b00000000000000000000000111111111) (= (mask!8028 thiss!1248) #b00000000000000000000001111111111) (= (mask!8028 thiss!1248) #b00000000000000000000011111111111) (= (mask!8028 thiss!1248) #b00000000000000000000111111111111) (= (mask!8028 thiss!1248) #b00000000000000000001111111111111) (= (mask!8028 thiss!1248) #b00000000000000000011111111111111) (= (mask!8028 thiss!1248) #b00000000000000000111111111111111) (= (mask!8028 thiss!1248) #b00000000000000001111111111111111) (= (mask!8028 thiss!1248) #b00000000000000011111111111111111) (= (mask!8028 thiss!1248) #b00000000000000111111111111111111) (= (mask!8028 thiss!1248) #b00000000000001111111111111111111) (= (mask!8028 thiss!1248) #b00000000000011111111111111111111) (= (mask!8028 thiss!1248) #b00000000000111111111111111111111) (= (mask!8028 thiss!1248) #b00000000001111111111111111111111) (= (mask!8028 thiss!1248) #b00000000011111111111111111111111) (= (mask!8028 thiss!1248) #b00000000111111111111111111111111) (= (mask!8028 thiss!1248) #b00000001111111111111111111111111) (= (mask!8028 thiss!1248) #b00000011111111111111111111111111) (= (mask!8028 thiss!1248) #b00000111111111111111111111111111) (= (mask!8028 thiss!1248) #b00001111111111111111111111111111) (= (mask!8028 thiss!1248) #b00011111111111111111111111111111) (= (mask!8028 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8028 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163822 d!51569))

(declare-fun b!163926 () Bool)

(declare-fun e!107549 () Bool)

(assert (=> b!163926 (= e!107549 tp_is_empty!3607)))

(declare-fun mapNonEmpty!6129 () Bool)

(declare-fun mapRes!6129 () Bool)

(declare-fun tp!14022 () Bool)

(assert (=> mapNonEmpty!6129 (= mapRes!6129 (and tp!14022 e!107549))))

(declare-fun mapRest!6129 () (Array (_ BitVec 32) ValueCell!1460))

(declare-fun mapKey!6129 () (_ BitVec 32))

(declare-fun mapValue!6129 () ValueCell!1460)

(assert (=> mapNonEmpty!6129 (= mapRest!6120 (store mapRest!6129 mapKey!6129 mapValue!6129))))

(declare-fun b!163927 () Bool)

(declare-fun e!107548 () Bool)

(assert (=> b!163927 (= e!107548 tp_is_empty!3607)))

(declare-fun mapIsEmpty!6129 () Bool)

(assert (=> mapIsEmpty!6129 mapRes!6129))

(declare-fun condMapEmpty!6129 () Bool)

(declare-fun mapDefault!6129 () ValueCell!1460)

(assert (=> mapNonEmpty!6120 (= condMapEmpty!6129 (= mapRest!6120 ((as const (Array (_ BitVec 32) ValueCell!1460)) mapDefault!6129)))))

(assert (=> mapNonEmpty!6120 (= tp!14007 (and e!107548 mapRes!6129))))

(assert (= (and mapNonEmpty!6120 condMapEmpty!6129) mapIsEmpty!6129))

(assert (= (and mapNonEmpty!6120 (not condMapEmpty!6129)) mapNonEmpty!6129))

(assert (= (and mapNonEmpty!6129 ((_ is ValueCellFull!1460) mapValue!6129)) b!163926))

(assert (= (and mapNonEmpty!6120 ((_ is ValueCellFull!1460) mapDefault!6129)) b!163927))

(declare-fun m!194523 () Bool)

(assert (=> mapNonEmpty!6129 m!194523))

(check-sat (not b!163901) (not b!163917) (not b!163899) b_and!10233 (not b_next!3805) (not bm!17308) tp_is_empty!3607 (not d!51567) (not b!163890) (not mapNonEmpty!6129) (not d!51565) (not b!163891) (not b!163900))
(check-sat b_and!10233 (not b_next!3805))
