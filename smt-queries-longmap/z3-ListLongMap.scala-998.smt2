; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21550 () Bool)

(assert start!21550)

(declare-fun b!216057 () Bool)

(declare-fun b_free!5739 () Bool)

(declare-fun b_next!5739 () Bool)

(assert (=> b!216057 (= b_free!5739 (not b_next!5739))))

(declare-fun tp!20343 () Bool)

(declare-fun b_and!12629 () Bool)

(assert (=> b!216057 (= tp!20343 b_and!12629)))

(declare-fun b!216051 () Bool)

(declare-fun e!140567 () Bool)

(declare-fun e!140565 () Bool)

(assert (=> b!216051 (= e!140567 e!140565)))

(declare-fun res!105640 () Bool)

(assert (=> b!216051 (=> (not res!105640) (not e!140565))))

(declare-datatypes ((SeekEntryResult!738 0))(
  ( (MissingZero!738 (index!5122 (_ BitVec 32))) (Found!738 (index!5123 (_ BitVec 32))) (Intermediate!738 (undefined!1550 Bool) (index!5124 (_ BitVec 32)) (x!22586 (_ BitVec 32))) (Undefined!738) (MissingVacant!738 (index!5125 (_ BitVec 32))) )
))
(declare-fun lt!111090 () SeekEntryResult!738)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216051 (= res!105640 (or (= lt!111090 (MissingZero!738 index!297)) (= lt!111090 (MissingVacant!738 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7115 0))(
  ( (V!7116 (val!2845 Int)) )
))
(declare-datatypes ((ValueCell!2457 0))(
  ( (ValueCellFull!2457 (v!4863 V!7115)) (EmptyCell!2457) )
))
(declare-datatypes ((array!10435 0))(
  ( (array!10436 (arr!4942 (Array (_ BitVec 32) ValueCell!2457)) (size!5274 (_ BitVec 32))) )
))
(declare-datatypes ((array!10437 0))(
  ( (array!10438 (arr!4943 (Array (_ BitVec 32) (_ BitVec 64))) (size!5275 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2814 0))(
  ( (LongMapFixedSize!2815 (defaultEntry!4057 Int) (mask!9779 (_ BitVec 32)) (extraKeys!3794 (_ BitVec 32)) (zeroValue!3898 V!7115) (minValue!3898 V!7115) (_size!1456 (_ BitVec 32)) (_keys!6100 array!10437) (_values!4040 array!10435) (_vacant!1456 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2814)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10437 (_ BitVec 32)) SeekEntryResult!738)

(assert (=> b!216051 (= lt!111090 (seekEntryOrOpen!0 key!932 (_keys!6100 thiss!1504) (mask!9779 thiss!1504)))))

(declare-fun mapNonEmpty!9555 () Bool)

(declare-fun mapRes!9555 () Bool)

(declare-fun tp!20342 () Bool)

(declare-fun e!140563 () Bool)

(assert (=> mapNonEmpty!9555 (= mapRes!9555 (and tp!20342 e!140563))))

(declare-fun mapRest!9555 () (Array (_ BitVec 32) ValueCell!2457))

(declare-fun mapValue!9555 () ValueCell!2457)

(declare-fun mapKey!9555 () (_ BitVec 32))

(assert (=> mapNonEmpty!9555 (= (arr!4942 (_values!4040 thiss!1504)) (store mapRest!9555 mapKey!9555 mapValue!9555))))

(declare-fun b!216052 () Bool)

(declare-fun tp_is_empty!5601 () Bool)

(assert (=> b!216052 (= e!140563 tp_is_empty!5601)))

(declare-fun b!216053 () Bool)

(declare-fun res!105639 () Bool)

(assert (=> b!216053 (=> (not res!105639) (not e!140565))))

(assert (=> b!216053 (= res!105639 (and (= (size!5274 (_values!4040 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9779 thiss!1504))) (= (size!5275 (_keys!6100 thiss!1504)) (size!5274 (_values!4040 thiss!1504))) (bvsge (mask!9779 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3794 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3794 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216054 () Bool)

(declare-fun e!140568 () Bool)

(declare-fun e!140564 () Bool)

(assert (=> b!216054 (= e!140568 (and e!140564 mapRes!9555))))

(declare-fun condMapEmpty!9555 () Bool)

(declare-fun mapDefault!9555 () ValueCell!2457)

(assert (=> b!216054 (= condMapEmpty!9555 (= (arr!4942 (_values!4040 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2457)) mapDefault!9555)))))

(declare-fun b!216055 () Bool)

(assert (=> b!216055 (= e!140564 tp_is_empty!5601)))

(declare-fun b!216056 () Bool)

(declare-fun res!105641 () Bool)

(assert (=> b!216056 (=> (not res!105641) (not e!140567))))

(assert (=> b!216056 (= res!105641 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!140566 () Bool)

(declare-fun array_inv!3269 (array!10437) Bool)

(declare-fun array_inv!3270 (array!10435) Bool)

(assert (=> b!216057 (= e!140566 (and tp!20343 tp_is_empty!5601 (array_inv!3269 (_keys!6100 thiss!1504)) (array_inv!3270 (_values!4040 thiss!1504)) e!140568))))

(declare-fun b!216058 () Bool)

(declare-fun res!105638 () Bool)

(assert (=> b!216058 (=> (not res!105638) (not e!140565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216058 (= res!105638 (validMask!0 (mask!9779 thiss!1504)))))

(declare-fun b!216059 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10437 (_ BitVec 32)) Bool)

(assert (=> b!216059 (= e!140565 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6100 thiss!1504) (mask!9779 thiss!1504))))))

(declare-fun res!105642 () Bool)

(assert (=> start!21550 (=> (not res!105642) (not e!140567))))

(declare-fun valid!1144 (LongMapFixedSize!2814) Bool)

(assert (=> start!21550 (= res!105642 (valid!1144 thiss!1504))))

(assert (=> start!21550 e!140567))

(assert (=> start!21550 e!140566))

(assert (=> start!21550 true))

(declare-fun mapIsEmpty!9555 () Bool)

(assert (=> mapIsEmpty!9555 mapRes!9555))

(assert (= (and start!21550 res!105642) b!216056))

(assert (= (and b!216056 res!105641) b!216051))

(assert (= (and b!216051 res!105640) b!216058))

(assert (= (and b!216058 res!105638) b!216053))

(assert (= (and b!216053 res!105639) b!216059))

(assert (= (and b!216054 condMapEmpty!9555) mapIsEmpty!9555))

(assert (= (and b!216054 (not condMapEmpty!9555)) mapNonEmpty!9555))

(get-info :version)

(assert (= (and mapNonEmpty!9555 ((_ is ValueCellFull!2457) mapValue!9555)) b!216052))

(assert (= (and b!216054 ((_ is ValueCellFull!2457) mapDefault!9555)) b!216055))

(assert (= b!216057 b!216054))

(assert (= start!21550 b!216057))

(declare-fun m!242939 () Bool)

(assert (=> start!21550 m!242939))

(declare-fun m!242941 () Bool)

(assert (=> mapNonEmpty!9555 m!242941))

(declare-fun m!242943 () Bool)

(assert (=> b!216051 m!242943))

(declare-fun m!242945 () Bool)

(assert (=> b!216057 m!242945))

(declare-fun m!242947 () Bool)

(assert (=> b!216057 m!242947))

(declare-fun m!242949 () Bool)

(assert (=> b!216059 m!242949))

(declare-fun m!242951 () Bool)

(assert (=> b!216058 m!242951))

(check-sat (not b!216059) (not b_next!5739) (not b!216058) (not b!216057) (not b!216051) (not mapNonEmpty!9555) (not start!21550) b_and!12629 tp_is_empty!5601)
(check-sat b_and!12629 (not b_next!5739))
(get-model)

(declare-fun d!58511 () Bool)

(assert (=> d!58511 (= (validMask!0 (mask!9779 thiss!1504)) (and (or (= (mask!9779 thiss!1504) #b00000000000000000000000000000111) (= (mask!9779 thiss!1504) #b00000000000000000000000000001111) (= (mask!9779 thiss!1504) #b00000000000000000000000000011111) (= (mask!9779 thiss!1504) #b00000000000000000000000000111111) (= (mask!9779 thiss!1504) #b00000000000000000000000001111111) (= (mask!9779 thiss!1504) #b00000000000000000000000011111111) (= (mask!9779 thiss!1504) #b00000000000000000000000111111111) (= (mask!9779 thiss!1504) #b00000000000000000000001111111111) (= (mask!9779 thiss!1504) #b00000000000000000000011111111111) (= (mask!9779 thiss!1504) #b00000000000000000000111111111111) (= (mask!9779 thiss!1504) #b00000000000000000001111111111111) (= (mask!9779 thiss!1504) #b00000000000000000011111111111111) (= (mask!9779 thiss!1504) #b00000000000000000111111111111111) (= (mask!9779 thiss!1504) #b00000000000000001111111111111111) (= (mask!9779 thiss!1504) #b00000000000000011111111111111111) (= (mask!9779 thiss!1504) #b00000000000000111111111111111111) (= (mask!9779 thiss!1504) #b00000000000001111111111111111111) (= (mask!9779 thiss!1504) #b00000000000011111111111111111111) (= (mask!9779 thiss!1504) #b00000000000111111111111111111111) (= (mask!9779 thiss!1504) #b00000000001111111111111111111111) (= (mask!9779 thiss!1504) #b00000000011111111111111111111111) (= (mask!9779 thiss!1504) #b00000000111111111111111111111111) (= (mask!9779 thiss!1504) #b00000001111111111111111111111111) (= (mask!9779 thiss!1504) #b00000011111111111111111111111111) (= (mask!9779 thiss!1504) #b00000111111111111111111111111111) (= (mask!9779 thiss!1504) #b00001111111111111111111111111111) (= (mask!9779 thiss!1504) #b00011111111111111111111111111111) (= (mask!9779 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9779 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!216058 d!58511))

(declare-fun d!58513 () Bool)

(assert (=> d!58513 (= (array_inv!3269 (_keys!6100 thiss!1504)) (bvsge (size!5275 (_keys!6100 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216057 d!58513))

(declare-fun d!58515 () Bool)

(assert (=> d!58515 (= (array_inv!3270 (_values!4040 thiss!1504)) (bvsge (size!5274 (_values!4040 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216057 d!58515))

(declare-fun d!58517 () Bool)

(declare-fun res!105664 () Bool)

(declare-fun e!140593 () Bool)

(assert (=> d!58517 (=> (not res!105664) (not e!140593))))

(declare-fun simpleValid!221 (LongMapFixedSize!2814) Bool)

(assert (=> d!58517 (= res!105664 (simpleValid!221 thiss!1504))))

(assert (=> d!58517 (= (valid!1144 thiss!1504) e!140593)))

(declare-fun b!216093 () Bool)

(declare-fun res!105665 () Bool)

(assert (=> b!216093 (=> (not res!105665) (not e!140593))))

(declare-fun arrayCountValidKeys!0 (array!10437 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!216093 (= res!105665 (= (arrayCountValidKeys!0 (_keys!6100 thiss!1504) #b00000000000000000000000000000000 (size!5275 (_keys!6100 thiss!1504))) (_size!1456 thiss!1504)))))

(declare-fun b!216094 () Bool)

(declare-fun res!105666 () Bool)

(assert (=> b!216094 (=> (not res!105666) (not e!140593))))

(assert (=> b!216094 (= res!105666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6100 thiss!1504) (mask!9779 thiss!1504)))))

(declare-fun b!216095 () Bool)

(declare-datatypes ((List!3140 0))(
  ( (Nil!3137) (Cons!3136 (h!3783 (_ BitVec 64)) (t!8095 List!3140)) )
))
(declare-fun arrayNoDuplicates!0 (array!10437 (_ BitVec 32) List!3140) Bool)

(assert (=> b!216095 (= e!140593 (arrayNoDuplicates!0 (_keys!6100 thiss!1504) #b00000000000000000000000000000000 Nil!3137))))

(assert (= (and d!58517 res!105664) b!216093))

(assert (= (and b!216093 res!105665) b!216094))

(assert (= (and b!216094 res!105666) b!216095))

(declare-fun m!242967 () Bool)

(assert (=> d!58517 m!242967))

(declare-fun m!242969 () Bool)

(assert (=> b!216093 m!242969))

(assert (=> b!216094 m!242949))

(declare-fun m!242971 () Bool)

(assert (=> b!216095 m!242971))

(assert (=> start!21550 d!58517))

(declare-fun b!216108 () Bool)

(declare-fun e!140602 () SeekEntryResult!738)

(assert (=> b!216108 (= e!140602 Undefined!738)))

(declare-fun b!216109 () Bool)

(declare-fun e!140600 () SeekEntryResult!738)

(declare-fun lt!111100 () SeekEntryResult!738)

(assert (=> b!216109 (= e!140600 (MissingZero!738 (index!5124 lt!111100)))))

(declare-fun b!216110 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10437 (_ BitVec 32)) SeekEntryResult!738)

(assert (=> b!216110 (= e!140600 (seekKeyOrZeroReturnVacant!0 (x!22586 lt!111100) (index!5124 lt!111100) (index!5124 lt!111100) key!932 (_keys!6100 thiss!1504) (mask!9779 thiss!1504)))))

(declare-fun b!216111 () Bool)

(declare-fun e!140601 () SeekEntryResult!738)

(assert (=> b!216111 (= e!140602 e!140601)))

(declare-fun lt!111101 () (_ BitVec 64))

(assert (=> b!216111 (= lt!111101 (select (arr!4943 (_keys!6100 thiss!1504)) (index!5124 lt!111100)))))

(declare-fun c!36296 () Bool)

(assert (=> b!216111 (= c!36296 (= lt!111101 key!932))))

(declare-fun b!216112 () Bool)

(declare-fun c!36294 () Bool)

(assert (=> b!216112 (= c!36294 (= lt!111101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!216112 (= e!140601 e!140600)))

(declare-fun d!58519 () Bool)

(declare-fun lt!111102 () SeekEntryResult!738)

(assert (=> d!58519 (and (or ((_ is Undefined!738) lt!111102) (not ((_ is Found!738) lt!111102)) (and (bvsge (index!5123 lt!111102) #b00000000000000000000000000000000) (bvslt (index!5123 lt!111102) (size!5275 (_keys!6100 thiss!1504))))) (or ((_ is Undefined!738) lt!111102) ((_ is Found!738) lt!111102) (not ((_ is MissingZero!738) lt!111102)) (and (bvsge (index!5122 lt!111102) #b00000000000000000000000000000000) (bvslt (index!5122 lt!111102) (size!5275 (_keys!6100 thiss!1504))))) (or ((_ is Undefined!738) lt!111102) ((_ is Found!738) lt!111102) ((_ is MissingZero!738) lt!111102) (not ((_ is MissingVacant!738) lt!111102)) (and (bvsge (index!5125 lt!111102) #b00000000000000000000000000000000) (bvslt (index!5125 lt!111102) (size!5275 (_keys!6100 thiss!1504))))) (or ((_ is Undefined!738) lt!111102) (ite ((_ is Found!738) lt!111102) (= (select (arr!4943 (_keys!6100 thiss!1504)) (index!5123 lt!111102)) key!932) (ite ((_ is MissingZero!738) lt!111102) (= (select (arr!4943 (_keys!6100 thiss!1504)) (index!5122 lt!111102)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!738) lt!111102) (= (select (arr!4943 (_keys!6100 thiss!1504)) (index!5125 lt!111102)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58519 (= lt!111102 e!140602)))

(declare-fun c!36295 () Bool)

(assert (=> d!58519 (= c!36295 (and ((_ is Intermediate!738) lt!111100) (undefined!1550 lt!111100)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10437 (_ BitVec 32)) SeekEntryResult!738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58519 (= lt!111100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9779 thiss!1504)) key!932 (_keys!6100 thiss!1504) (mask!9779 thiss!1504)))))

(assert (=> d!58519 (validMask!0 (mask!9779 thiss!1504))))

(assert (=> d!58519 (= (seekEntryOrOpen!0 key!932 (_keys!6100 thiss!1504) (mask!9779 thiss!1504)) lt!111102)))

(declare-fun b!216113 () Bool)

(assert (=> b!216113 (= e!140601 (Found!738 (index!5124 lt!111100)))))

(assert (= (and d!58519 c!36295) b!216108))

(assert (= (and d!58519 (not c!36295)) b!216111))

(assert (= (and b!216111 c!36296) b!216113))

(assert (= (and b!216111 (not c!36296)) b!216112))

(assert (= (and b!216112 c!36294) b!216109))

(assert (= (and b!216112 (not c!36294)) b!216110))

(declare-fun m!242973 () Bool)

(assert (=> b!216110 m!242973))

(declare-fun m!242975 () Bool)

(assert (=> b!216111 m!242975))

(declare-fun m!242977 () Bool)

(assert (=> d!58519 m!242977))

(assert (=> d!58519 m!242977))

(declare-fun m!242979 () Bool)

(assert (=> d!58519 m!242979))

(declare-fun m!242981 () Bool)

(assert (=> d!58519 m!242981))

(assert (=> d!58519 m!242951))

(declare-fun m!242983 () Bool)

(assert (=> d!58519 m!242983))

(declare-fun m!242985 () Bool)

(assert (=> d!58519 m!242985))

(assert (=> b!216051 d!58519))

(declare-fun d!58521 () Bool)

(declare-fun res!105671 () Bool)

(declare-fun e!140610 () Bool)

(assert (=> d!58521 (=> res!105671 e!140610)))

(assert (=> d!58521 (= res!105671 (bvsge #b00000000000000000000000000000000 (size!5275 (_keys!6100 thiss!1504))))))

(assert (=> d!58521 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6100 thiss!1504) (mask!9779 thiss!1504)) e!140610)))

(declare-fun bm!20367 () Bool)

(declare-fun call!20370 () Bool)

(assert (=> bm!20367 (= call!20370 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6100 thiss!1504) (mask!9779 thiss!1504)))))

(declare-fun b!216122 () Bool)

(declare-fun e!140609 () Bool)

(declare-fun e!140611 () Bool)

(assert (=> b!216122 (= e!140609 e!140611)))

(declare-fun lt!111111 () (_ BitVec 64))

(assert (=> b!216122 (= lt!111111 (select (arr!4943 (_keys!6100 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6502 0))(
  ( (Unit!6503) )
))
(declare-fun lt!111110 () Unit!6502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10437 (_ BitVec 64) (_ BitVec 32)) Unit!6502)

(assert (=> b!216122 (= lt!111110 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6100 thiss!1504) lt!111111 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216122 (arrayContainsKey!0 (_keys!6100 thiss!1504) lt!111111 #b00000000000000000000000000000000)))

(declare-fun lt!111109 () Unit!6502)

(assert (=> b!216122 (= lt!111109 lt!111110)))

(declare-fun res!105672 () Bool)

(assert (=> b!216122 (= res!105672 (= (seekEntryOrOpen!0 (select (arr!4943 (_keys!6100 thiss!1504)) #b00000000000000000000000000000000) (_keys!6100 thiss!1504) (mask!9779 thiss!1504)) (Found!738 #b00000000000000000000000000000000)))))

(assert (=> b!216122 (=> (not res!105672) (not e!140611))))

(declare-fun b!216123 () Bool)

(assert (=> b!216123 (= e!140610 e!140609)))

(declare-fun c!36299 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!216123 (= c!36299 (validKeyInArray!0 (select (arr!4943 (_keys!6100 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216124 () Bool)

(assert (=> b!216124 (= e!140611 call!20370)))

(declare-fun b!216125 () Bool)

(assert (=> b!216125 (= e!140609 call!20370)))

(assert (= (and d!58521 (not res!105671)) b!216123))

(assert (= (and b!216123 c!36299) b!216122))

(assert (= (and b!216123 (not c!36299)) b!216125))

(assert (= (and b!216122 res!105672) b!216124))

(assert (= (or b!216124 b!216125) bm!20367))

(declare-fun m!242987 () Bool)

(assert (=> bm!20367 m!242987))

(declare-fun m!242989 () Bool)

(assert (=> b!216122 m!242989))

(declare-fun m!242991 () Bool)

(assert (=> b!216122 m!242991))

(declare-fun m!242993 () Bool)

(assert (=> b!216122 m!242993))

(assert (=> b!216122 m!242989))

(declare-fun m!242995 () Bool)

(assert (=> b!216122 m!242995))

(assert (=> b!216123 m!242989))

(assert (=> b!216123 m!242989))

(declare-fun m!242997 () Bool)

(assert (=> b!216123 m!242997))

(assert (=> b!216059 d!58521))

(declare-fun b!216133 () Bool)

(declare-fun e!140617 () Bool)

(assert (=> b!216133 (= e!140617 tp_is_empty!5601)))

(declare-fun condMapEmpty!9561 () Bool)

(declare-fun mapDefault!9561 () ValueCell!2457)

(assert (=> mapNonEmpty!9555 (= condMapEmpty!9561 (= mapRest!9555 ((as const (Array (_ BitVec 32) ValueCell!2457)) mapDefault!9561)))))

(declare-fun mapRes!9561 () Bool)

(assert (=> mapNonEmpty!9555 (= tp!20342 (and e!140617 mapRes!9561))))

(declare-fun mapNonEmpty!9561 () Bool)

(declare-fun tp!20352 () Bool)

(declare-fun e!140616 () Bool)

(assert (=> mapNonEmpty!9561 (= mapRes!9561 (and tp!20352 e!140616))))

(declare-fun mapRest!9561 () (Array (_ BitVec 32) ValueCell!2457))

(declare-fun mapKey!9561 () (_ BitVec 32))

(declare-fun mapValue!9561 () ValueCell!2457)

(assert (=> mapNonEmpty!9561 (= mapRest!9555 (store mapRest!9561 mapKey!9561 mapValue!9561))))

(declare-fun mapIsEmpty!9561 () Bool)

(assert (=> mapIsEmpty!9561 mapRes!9561))

(declare-fun b!216132 () Bool)

(assert (=> b!216132 (= e!140616 tp_is_empty!5601)))

(assert (= (and mapNonEmpty!9555 condMapEmpty!9561) mapIsEmpty!9561))

(assert (= (and mapNonEmpty!9555 (not condMapEmpty!9561)) mapNonEmpty!9561))

(assert (= (and mapNonEmpty!9561 ((_ is ValueCellFull!2457) mapValue!9561)) b!216132))

(assert (= (and mapNonEmpty!9555 ((_ is ValueCellFull!2457) mapDefault!9561)) b!216133))

(declare-fun m!242999 () Bool)

(assert (=> mapNonEmpty!9561 m!242999))

(check-sat (not b_next!5739) (not b!216123) (not b!216122) (not b!216110) (not bm!20367) (not b!216095) (not d!58519) (not mapNonEmpty!9561) (not b!216093) b_and!12629 tp_is_empty!5601 (not b!216094) (not d!58517))
(check-sat b_and!12629 (not b_next!5739))
