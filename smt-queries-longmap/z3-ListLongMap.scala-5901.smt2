; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76296 () Bool)

(assert start!76296)

(declare-fun b!895494 () Bool)

(declare-fun b_free!15909 () Bool)

(declare-fun b_next!15909 () Bool)

(assert (=> b!895494 (= b_free!15909 (not b_next!15909))))

(declare-fun tp!55737 () Bool)

(declare-fun b_and!26201 () Bool)

(assert (=> b!895494 (= tp!55737 b_and!26201)))

(declare-fun b!895491 () Bool)

(declare-fun e!500347 () Bool)

(declare-fun tp_is_empty!18237 () Bool)

(assert (=> b!895491 (= e!500347 tp_is_empty!18237)))

(declare-fun b!895492 () Bool)

(declare-fun res!605732 () Bool)

(declare-fun e!500350 () Bool)

(assert (=> b!895492 (=> (not res!605732) (not e!500350))))

(declare-datatypes ((array!52476 0))(
  ( (array!52477 (arr!25233 (Array (_ BitVec 32) (_ BitVec 64))) (size!25683 (_ BitVec 32))) )
))
(declare-datatypes ((V!29281 0))(
  ( (V!29282 (val!9169 Int)) )
))
(declare-datatypes ((ValueCell!8637 0))(
  ( (ValueCellFull!8637 (v!11659 V!29281)) (EmptyCell!8637) )
))
(declare-datatypes ((array!52478 0))(
  ( (array!52479 (arr!25234 (Array (_ BitVec 32) ValueCell!8637)) (size!25684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4290 0))(
  ( (LongMapFixedSize!4291 (defaultEntry!5357 Int) (mask!25956 (_ BitVec 32)) (extraKeys!5053 (_ BitVec 32)) (zeroValue!5157 V!29281) (minValue!5157 V!29281) (_size!2200 (_ BitVec 32)) (_keys!10072 array!52476) (_values!5344 array!52478) (_vacant!2200 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4290)

(assert (=> b!895492 (= res!605732 (and (= (size!25684 (_values!5344 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25956 thiss!1181))) (= (size!25683 (_keys!10072 thiss!1181)) (size!25684 (_values!5344 thiss!1181))) (bvsge (mask!25956 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5053 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5053 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!895493 () Bool)

(declare-fun e!500346 () Bool)

(declare-fun mapRes!28951 () Bool)

(assert (=> b!895493 (= e!500346 (and e!500347 mapRes!28951))))

(declare-fun condMapEmpty!28951 () Bool)

(declare-fun mapDefault!28951 () ValueCell!8637)

(assert (=> b!895493 (= condMapEmpty!28951 (= (arr!25234 (_values!5344 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8637)) mapDefault!28951)))))

(declare-fun e!500351 () Bool)

(declare-fun array_inv!19812 (array!52476) Bool)

(declare-fun array_inv!19813 (array!52478) Bool)

(assert (=> b!895494 (= e!500351 (and tp!55737 tp_is_empty!18237 (array_inv!19812 (_keys!10072 thiss!1181)) (array_inv!19813 (_values!5344 thiss!1181)) e!500346))))

(declare-fun b!895495 () Bool)

(declare-fun e!500345 () Bool)

(assert (=> b!895495 (= e!500345 e!500350)))

(declare-fun res!605733 () Bool)

(assert (=> b!895495 (=> (not res!605733) (not e!500350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895495 (= res!605733 (validMask!0 (mask!25956 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8881 0))(
  ( (MissingZero!8881 (index!37895 (_ BitVec 32))) (Found!8881 (index!37896 (_ BitVec 32))) (Intermediate!8881 (undefined!9693 Bool) (index!37897 (_ BitVec 32)) (x!76193 (_ BitVec 32))) (Undefined!8881) (MissingVacant!8881 (index!37898 (_ BitVec 32))) )
))
(declare-fun lt!404536 () SeekEntryResult!8881)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52476 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!895495 (= lt!404536 (seekEntry!0 key!785 (_keys!10072 thiss!1181) (mask!25956 thiss!1181)))))

(declare-fun mapNonEmpty!28951 () Bool)

(declare-fun tp!55736 () Bool)

(declare-fun e!500348 () Bool)

(assert (=> mapNonEmpty!28951 (= mapRes!28951 (and tp!55736 e!500348))))

(declare-fun mapRest!28951 () (Array (_ BitVec 32) ValueCell!8637))

(declare-fun mapValue!28951 () ValueCell!8637)

(declare-fun mapKey!28951 () (_ BitVec 32))

(assert (=> mapNonEmpty!28951 (= (arr!25234 (_values!5344 thiss!1181)) (store mapRest!28951 mapKey!28951 mapValue!28951))))

(declare-fun res!605734 () Bool)

(assert (=> start!76296 (=> (not res!605734) (not e!500345))))

(declare-fun valid!1656 (LongMapFixedSize!4290) Bool)

(assert (=> start!76296 (= res!605734 (valid!1656 thiss!1181))))

(assert (=> start!76296 e!500345))

(assert (=> start!76296 e!500351))

(assert (=> start!76296 true))

(declare-fun b!895496 () Bool)

(declare-fun res!605735 () Bool)

(assert (=> b!895496 (=> (not res!605735) (not e!500345))))

(assert (=> b!895496 (= res!605735 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895497 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52476 (_ BitVec 32)) Bool)

(assert (=> b!895497 (= e!500350 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10072 thiss!1181) (mask!25956 thiss!1181))))))

(declare-fun b!895498 () Bool)

(assert (=> b!895498 (= e!500348 tp_is_empty!18237)))

(declare-fun mapIsEmpty!28951 () Bool)

(assert (=> mapIsEmpty!28951 mapRes!28951))

(assert (= (and start!76296 res!605734) b!895496))

(assert (= (and b!895496 res!605735) b!895495))

(assert (= (and b!895495 res!605733) b!895492))

(assert (= (and b!895492 res!605732) b!895497))

(assert (= (and b!895493 condMapEmpty!28951) mapIsEmpty!28951))

(assert (= (and b!895493 (not condMapEmpty!28951)) mapNonEmpty!28951))

(get-info :version)

(assert (= (and mapNonEmpty!28951 ((_ is ValueCellFull!8637) mapValue!28951)) b!895498))

(assert (= (and b!895493 ((_ is ValueCellFull!8637) mapDefault!28951)) b!895491))

(assert (= b!895494 b!895493))

(assert (= start!76296 b!895494))

(declare-fun m!833043 () Bool)

(assert (=> b!895495 m!833043))

(declare-fun m!833045 () Bool)

(assert (=> b!895495 m!833045))

(declare-fun m!833047 () Bool)

(assert (=> start!76296 m!833047))

(declare-fun m!833049 () Bool)

(assert (=> b!895494 m!833049))

(declare-fun m!833051 () Bool)

(assert (=> b!895494 m!833051))

(declare-fun m!833053 () Bool)

(assert (=> mapNonEmpty!28951 m!833053))

(declare-fun m!833055 () Bool)

(assert (=> b!895497 m!833055))

(check-sat (not b!895494) (not b!895495) tp_is_empty!18237 (not b!895497) (not b_next!15909) b_and!26201 (not mapNonEmpty!28951) (not start!76296))
(check-sat b_and!26201 (not b_next!15909))
(get-model)

(declare-fun d!110783 () Bool)

(assert (=> d!110783 (= (array_inv!19812 (_keys!10072 thiss!1181)) (bvsge (size!25683 (_keys!10072 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895494 d!110783))

(declare-fun d!110785 () Bool)

(assert (=> d!110785 (= (array_inv!19813 (_values!5344 thiss!1181)) (bvsge (size!25684 (_values!5344 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895494 d!110785))

(declare-fun d!110787 () Bool)

(assert (=> d!110787 (= (validMask!0 (mask!25956 thiss!1181)) (and (or (= (mask!25956 thiss!1181) #b00000000000000000000000000000111) (= (mask!25956 thiss!1181) #b00000000000000000000000000001111) (= (mask!25956 thiss!1181) #b00000000000000000000000000011111) (= (mask!25956 thiss!1181) #b00000000000000000000000000111111) (= (mask!25956 thiss!1181) #b00000000000000000000000001111111) (= (mask!25956 thiss!1181) #b00000000000000000000000011111111) (= (mask!25956 thiss!1181) #b00000000000000000000000111111111) (= (mask!25956 thiss!1181) #b00000000000000000000001111111111) (= (mask!25956 thiss!1181) #b00000000000000000000011111111111) (= (mask!25956 thiss!1181) #b00000000000000000000111111111111) (= (mask!25956 thiss!1181) #b00000000000000000001111111111111) (= (mask!25956 thiss!1181) #b00000000000000000011111111111111) (= (mask!25956 thiss!1181) #b00000000000000000111111111111111) (= (mask!25956 thiss!1181) #b00000000000000001111111111111111) (= (mask!25956 thiss!1181) #b00000000000000011111111111111111) (= (mask!25956 thiss!1181) #b00000000000000111111111111111111) (= (mask!25956 thiss!1181) #b00000000000001111111111111111111) (= (mask!25956 thiss!1181) #b00000000000011111111111111111111) (= (mask!25956 thiss!1181) #b00000000000111111111111111111111) (= (mask!25956 thiss!1181) #b00000000001111111111111111111111) (= (mask!25956 thiss!1181) #b00000000011111111111111111111111) (= (mask!25956 thiss!1181) #b00000000111111111111111111111111) (= (mask!25956 thiss!1181) #b00000001111111111111111111111111) (= (mask!25956 thiss!1181) #b00000011111111111111111111111111) (= (mask!25956 thiss!1181) #b00000111111111111111111111111111) (= (mask!25956 thiss!1181) #b00001111111111111111111111111111) (= (mask!25956 thiss!1181) #b00011111111111111111111111111111) (= (mask!25956 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25956 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895495 d!110787))

(declare-fun b!895535 () Bool)

(declare-fun e!500379 () SeekEntryResult!8881)

(declare-fun lt!404548 () SeekEntryResult!8881)

(assert (=> b!895535 (= e!500379 (ite ((_ is MissingVacant!8881) lt!404548) (MissingZero!8881 (index!37898 lt!404548)) lt!404548))))

(declare-fun lt!404549 () SeekEntryResult!8881)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52476 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!895535 (= lt!404548 (seekKeyOrZeroReturnVacant!0 (x!76193 lt!404549) (index!37897 lt!404549) (index!37897 lt!404549) key!785 (_keys!10072 thiss!1181) (mask!25956 thiss!1181)))))

(declare-fun b!895536 () Bool)

(assert (=> b!895536 (= e!500379 (MissingZero!8881 (index!37897 lt!404549)))))

(declare-fun b!895537 () Bool)

(declare-fun c!94583 () Bool)

(declare-fun lt!404550 () (_ BitVec 64))

(assert (=> b!895537 (= c!94583 (= lt!404550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500381 () SeekEntryResult!8881)

(assert (=> b!895537 (= e!500381 e!500379)))

(declare-fun b!895539 () Bool)

(assert (=> b!895539 (= e!500381 (Found!8881 (index!37897 lt!404549)))))

(declare-fun b!895540 () Bool)

(declare-fun e!500380 () SeekEntryResult!8881)

(assert (=> b!895540 (= e!500380 e!500381)))

(assert (=> b!895540 (= lt!404550 (select (arr!25233 (_keys!10072 thiss!1181)) (index!37897 lt!404549)))))

(declare-fun c!94581 () Bool)

(assert (=> b!895540 (= c!94581 (= lt!404550 key!785))))

(declare-fun b!895538 () Bool)

(assert (=> b!895538 (= e!500380 Undefined!8881)))

(declare-fun d!110789 () Bool)

(declare-fun lt!404551 () SeekEntryResult!8881)

(assert (=> d!110789 (and (or ((_ is MissingVacant!8881) lt!404551) (not ((_ is Found!8881) lt!404551)) (and (bvsge (index!37896 lt!404551) #b00000000000000000000000000000000) (bvslt (index!37896 lt!404551) (size!25683 (_keys!10072 thiss!1181))))) (not ((_ is MissingVacant!8881) lt!404551)) (or (not ((_ is Found!8881) lt!404551)) (= (select (arr!25233 (_keys!10072 thiss!1181)) (index!37896 lt!404551)) key!785)))))

(assert (=> d!110789 (= lt!404551 e!500380)))

(declare-fun c!94582 () Bool)

(assert (=> d!110789 (= c!94582 (and ((_ is Intermediate!8881) lt!404549) (undefined!9693 lt!404549)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52476 (_ BitVec 32)) SeekEntryResult!8881)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110789 (= lt!404549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25956 thiss!1181)) key!785 (_keys!10072 thiss!1181) (mask!25956 thiss!1181)))))

(assert (=> d!110789 (validMask!0 (mask!25956 thiss!1181))))

(assert (=> d!110789 (= (seekEntry!0 key!785 (_keys!10072 thiss!1181) (mask!25956 thiss!1181)) lt!404551)))

(assert (= (and d!110789 c!94582) b!895538))

(assert (= (and d!110789 (not c!94582)) b!895540))

(assert (= (and b!895540 c!94581) b!895539))

(assert (= (and b!895540 (not c!94581)) b!895537))

(assert (= (and b!895537 c!94583) b!895536))

(assert (= (and b!895537 (not c!94583)) b!895535))

(declare-fun m!833071 () Bool)

(assert (=> b!895535 m!833071))

(declare-fun m!833073 () Bool)

(assert (=> b!895540 m!833073))

(declare-fun m!833075 () Bool)

(assert (=> d!110789 m!833075))

(declare-fun m!833077 () Bool)

(assert (=> d!110789 m!833077))

(assert (=> d!110789 m!833077))

(declare-fun m!833079 () Bool)

(assert (=> d!110789 m!833079))

(assert (=> d!110789 m!833043))

(assert (=> b!895495 d!110789))

(declare-fun b!895549 () Bool)

(declare-fun e!500388 () Bool)

(declare-fun call!39757 () Bool)

(assert (=> b!895549 (= e!500388 call!39757)))

(declare-fun b!895550 () Bool)

(declare-fun e!500389 () Bool)

(assert (=> b!895550 (= e!500389 call!39757)))

(declare-fun b!895551 () Bool)

(assert (=> b!895551 (= e!500388 e!500389)))

(declare-fun lt!404560 () (_ BitVec 64))

(assert (=> b!895551 (= lt!404560 (select (arr!25233 (_keys!10072 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30462 0))(
  ( (Unit!30463) )
))
(declare-fun lt!404559 () Unit!30462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52476 (_ BitVec 64) (_ BitVec 32)) Unit!30462)

(assert (=> b!895551 (= lt!404559 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10072 thiss!1181) lt!404560 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895551 (arrayContainsKey!0 (_keys!10072 thiss!1181) lt!404560 #b00000000000000000000000000000000)))

(declare-fun lt!404558 () Unit!30462)

(assert (=> b!895551 (= lt!404558 lt!404559)))

(declare-fun res!605752 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52476 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!895551 (= res!605752 (= (seekEntryOrOpen!0 (select (arr!25233 (_keys!10072 thiss!1181)) #b00000000000000000000000000000000) (_keys!10072 thiss!1181) (mask!25956 thiss!1181)) (Found!8881 #b00000000000000000000000000000000)))))

(assert (=> b!895551 (=> (not res!605752) (not e!500389))))

(declare-fun b!895552 () Bool)

(declare-fun e!500390 () Bool)

(assert (=> b!895552 (= e!500390 e!500388)))

(declare-fun c!94586 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895552 (= c!94586 (validKeyInArray!0 (select (arr!25233 (_keys!10072 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110791 () Bool)

(declare-fun res!605753 () Bool)

(assert (=> d!110791 (=> res!605753 e!500390)))

(assert (=> d!110791 (= res!605753 (bvsge #b00000000000000000000000000000000 (size!25683 (_keys!10072 thiss!1181))))))

(assert (=> d!110791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10072 thiss!1181) (mask!25956 thiss!1181)) e!500390)))

(declare-fun bm!39754 () Bool)

(assert (=> bm!39754 (= call!39757 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10072 thiss!1181) (mask!25956 thiss!1181)))))

(assert (= (and d!110791 (not res!605753)) b!895552))

(assert (= (and b!895552 c!94586) b!895551))

(assert (= (and b!895552 (not c!94586)) b!895549))

(assert (= (and b!895551 res!605752) b!895550))

(assert (= (or b!895550 b!895549) bm!39754))

(declare-fun m!833081 () Bool)

(assert (=> b!895551 m!833081))

(declare-fun m!833083 () Bool)

(assert (=> b!895551 m!833083))

(declare-fun m!833085 () Bool)

(assert (=> b!895551 m!833085))

(assert (=> b!895551 m!833081))

(declare-fun m!833087 () Bool)

(assert (=> b!895551 m!833087))

(assert (=> b!895552 m!833081))

(assert (=> b!895552 m!833081))

(declare-fun m!833089 () Bool)

(assert (=> b!895552 m!833089))

(declare-fun m!833091 () Bool)

(assert (=> bm!39754 m!833091))

(assert (=> b!895497 d!110791))

(declare-fun d!110793 () Bool)

(declare-fun res!605760 () Bool)

(declare-fun e!500393 () Bool)

(assert (=> d!110793 (=> (not res!605760) (not e!500393))))

(declare-fun simpleValid!306 (LongMapFixedSize!4290) Bool)

(assert (=> d!110793 (= res!605760 (simpleValid!306 thiss!1181))))

(assert (=> d!110793 (= (valid!1656 thiss!1181) e!500393)))

(declare-fun b!895559 () Bool)

(declare-fun res!605761 () Bool)

(assert (=> b!895559 (=> (not res!605761) (not e!500393))))

(declare-fun arrayCountValidKeys!0 (array!52476 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895559 (= res!605761 (= (arrayCountValidKeys!0 (_keys!10072 thiss!1181) #b00000000000000000000000000000000 (size!25683 (_keys!10072 thiss!1181))) (_size!2200 thiss!1181)))))

(declare-fun b!895560 () Bool)

(declare-fun res!605762 () Bool)

(assert (=> b!895560 (=> (not res!605762) (not e!500393))))

(assert (=> b!895560 (= res!605762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10072 thiss!1181) (mask!25956 thiss!1181)))))

(declare-fun b!895561 () Bool)

(declare-datatypes ((List!17813 0))(
  ( (Nil!17810) (Cons!17809 (h!18946 (_ BitVec 64)) (t!25152 List!17813)) )
))
(declare-fun arrayNoDuplicates!0 (array!52476 (_ BitVec 32) List!17813) Bool)

(assert (=> b!895561 (= e!500393 (arrayNoDuplicates!0 (_keys!10072 thiss!1181) #b00000000000000000000000000000000 Nil!17810))))

(assert (= (and d!110793 res!605760) b!895559))

(assert (= (and b!895559 res!605761) b!895560))

(assert (= (and b!895560 res!605762) b!895561))

(declare-fun m!833093 () Bool)

(assert (=> d!110793 m!833093))

(declare-fun m!833095 () Bool)

(assert (=> b!895559 m!833095))

(assert (=> b!895560 m!833055))

(declare-fun m!833097 () Bool)

(assert (=> b!895561 m!833097))

(assert (=> start!76296 d!110793))

(declare-fun mapIsEmpty!28957 () Bool)

(declare-fun mapRes!28957 () Bool)

(assert (=> mapIsEmpty!28957 mapRes!28957))

(declare-fun mapNonEmpty!28957 () Bool)

(declare-fun tp!55746 () Bool)

(declare-fun e!500398 () Bool)

(assert (=> mapNonEmpty!28957 (= mapRes!28957 (and tp!55746 e!500398))))

(declare-fun mapKey!28957 () (_ BitVec 32))

(declare-fun mapValue!28957 () ValueCell!8637)

(declare-fun mapRest!28957 () (Array (_ BitVec 32) ValueCell!8637))

(assert (=> mapNonEmpty!28957 (= mapRest!28951 (store mapRest!28957 mapKey!28957 mapValue!28957))))

(declare-fun condMapEmpty!28957 () Bool)

(declare-fun mapDefault!28957 () ValueCell!8637)

(assert (=> mapNonEmpty!28951 (= condMapEmpty!28957 (= mapRest!28951 ((as const (Array (_ BitVec 32) ValueCell!8637)) mapDefault!28957)))))

(declare-fun e!500399 () Bool)

(assert (=> mapNonEmpty!28951 (= tp!55736 (and e!500399 mapRes!28957))))

(declare-fun b!895568 () Bool)

(assert (=> b!895568 (= e!500398 tp_is_empty!18237)))

(declare-fun b!895569 () Bool)

(assert (=> b!895569 (= e!500399 tp_is_empty!18237)))

(assert (= (and mapNonEmpty!28951 condMapEmpty!28957) mapIsEmpty!28957))

(assert (= (and mapNonEmpty!28951 (not condMapEmpty!28957)) mapNonEmpty!28957))

(assert (= (and mapNonEmpty!28957 ((_ is ValueCellFull!8637) mapValue!28957)) b!895568))

(assert (= (and mapNonEmpty!28951 ((_ is ValueCellFull!8637) mapDefault!28957)) b!895569))

(declare-fun m!833099 () Bool)

(assert (=> mapNonEmpty!28957 m!833099))

(check-sat (not d!110789) (not mapNonEmpty!28957) (not b!895535) (not b_next!15909) (not d!110793) b_and!26201 (not b!895559) (not b!895561) (not bm!39754) tp_is_empty!18237 (not b!895552) (not b!895560) (not b!895551))
(check-sat b_and!26201 (not b_next!15909))
