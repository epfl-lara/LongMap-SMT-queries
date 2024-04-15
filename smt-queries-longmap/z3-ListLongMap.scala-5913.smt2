; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76602 () Bool)

(assert start!76602)

(declare-fun b!897091 () Bool)

(declare-fun b_free!15979 () Bool)

(declare-fun b_next!15979 () Bool)

(assert (=> b!897091 (= b_free!15979 (not b_next!15979))))

(declare-fun tp!55987 () Bool)

(declare-fun b_and!26245 () Bool)

(assert (=> b!897091 (= tp!55987 b_and!26245)))

(declare-fun b!897089 () Bool)

(declare-fun e!501604 () Bool)

(declare-datatypes ((array!52623 0))(
  ( (array!52624 (arr!25295 (Array (_ BitVec 32) (_ BitVec 64))) (size!25751 (_ BitVec 32))) )
))
(declare-datatypes ((V!29375 0))(
  ( (V!29376 (val!9204 Int)) )
))
(declare-datatypes ((ValueCell!8672 0))(
  ( (ValueCellFull!8672 (v!11691 V!29375)) (EmptyCell!8672) )
))
(declare-datatypes ((array!52625 0))(
  ( (array!52626 (arr!25296 (Array (_ BitVec 32) ValueCell!8672)) (size!25752 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4360 0))(
  ( (LongMapFixedSize!4361 (defaultEntry!5392 Int) (mask!26070 (_ BitVec 32)) (extraKeys!5101 (_ BitVec 32)) (zeroValue!5205 V!29375) (minValue!5205 V!29375) (_size!2235 (_ BitVec 32)) (_keys!10142 array!52623) (_values!5392 array!52625) (_vacant!2235 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4360)

(assert (=> b!897089 (= e!501604 (or (not (= (size!25752 (_values!5392 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26070 thiss!1181)))) (not (= (size!25751 (_keys!10142 thiss!1181)) (size!25752 (_values!5392 thiss!1181)))) (bvslt (mask!26070 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5101 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5101 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897090 () Bool)

(declare-fun e!501598 () Bool)

(declare-fun tp_is_empty!18307 () Bool)

(assert (=> b!897090 (= e!501598 tp_is_empty!18307)))

(declare-fun mapNonEmpty!29096 () Bool)

(declare-fun mapRes!29096 () Bool)

(declare-fun tp!55988 () Bool)

(declare-fun e!501606 () Bool)

(assert (=> mapNonEmpty!29096 (= mapRes!29096 (and tp!55988 e!501606))))

(declare-fun mapKey!29096 () (_ BitVec 32))

(declare-fun mapRest!29096 () (Array (_ BitVec 32) ValueCell!8672))

(declare-fun mapValue!29096 () ValueCell!8672)

(assert (=> mapNonEmpty!29096 (= (arr!25296 (_values!5392 thiss!1181)) (store mapRest!29096 mapKey!29096 mapValue!29096))))

(declare-fun e!501601 () Bool)

(declare-fun e!501600 () Bool)

(declare-fun array_inv!19906 (array!52623) Bool)

(declare-fun array_inv!19907 (array!52625) Bool)

(assert (=> b!897091 (= e!501600 (and tp!55987 tp_is_empty!18307 (array_inv!19906 (_keys!10142 thiss!1181)) (array_inv!19907 (_values!5392 thiss!1181)) e!501601))))

(declare-fun b!897092 () Bool)

(declare-fun e!501603 () Bool)

(declare-datatypes ((SeekEntryResult!8912 0))(
  ( (MissingZero!8912 (index!38019 (_ BitVec 32))) (Found!8912 (index!38020 (_ BitVec 32))) (Intermediate!8912 (undefined!9724 Bool) (index!38021 (_ BitVec 32)) (x!76447 (_ BitVec 32))) (Undefined!8912) (MissingVacant!8912 (index!38022 (_ BitVec 32))) )
))
(declare-fun lt!404908 () SeekEntryResult!8912)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897092 (= e!501603 (inRange!0 (index!38020 lt!404908) (mask!26070 thiss!1181)))))

(declare-fun b!897093 () Bool)

(assert (=> b!897093 (= e!501601 (and e!501598 mapRes!29096))))

(declare-fun condMapEmpty!29096 () Bool)

(declare-fun mapDefault!29096 () ValueCell!8672)

(assert (=> b!897093 (= condMapEmpty!29096 (= (arr!25296 (_values!5392 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8672)) mapDefault!29096)))))

(declare-fun b!897094 () Bool)

(declare-fun res!606457 () Bool)

(declare-fun e!501605 () Bool)

(assert (=> b!897094 (=> (not res!606457) (not e!501605))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897094 (= res!606457 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29096 () Bool)

(assert (=> mapIsEmpty!29096 mapRes!29096))

(declare-fun b!897095 () Bool)

(declare-fun e!501599 () Bool)

(assert (=> b!897095 (= e!501599 e!501604)))

(declare-fun res!606455 () Bool)

(assert (=> b!897095 (=> res!606455 e!501604)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897095 (= res!606455 (not (validMask!0 (mask!26070 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897095 (arrayContainsKey!0 (_keys!10142 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30446 0))(
  ( (Unit!30447) )
))
(declare-fun lt!404907 () Unit!30446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52623 (_ BitVec 64) (_ BitVec 32)) Unit!30446)

(assert (=> b!897095 (= lt!404907 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10142 thiss!1181) key!785 (index!38020 lt!404908)))))

(declare-fun res!606456 () Bool)

(assert (=> start!76602 (=> (not res!606456) (not e!501605))))

(declare-fun valid!1686 (LongMapFixedSize!4360) Bool)

(assert (=> start!76602 (= res!606456 (valid!1686 thiss!1181))))

(assert (=> start!76602 e!501605))

(assert (=> start!76602 e!501600))

(assert (=> start!76602 true))

(declare-fun b!897096 () Bool)

(assert (=> b!897096 (= e!501606 tp_is_empty!18307)))

(declare-fun b!897097 () Bool)

(assert (=> b!897097 (= e!501605 (not e!501599))))

(declare-fun res!606454 () Bool)

(assert (=> b!897097 (=> res!606454 e!501599)))

(get-info :version)

(assert (=> b!897097 (= res!606454 (not ((_ is Found!8912) lt!404908)))))

(assert (=> b!897097 e!501603))

(declare-fun res!606453 () Bool)

(assert (=> b!897097 (=> res!606453 e!501603)))

(assert (=> b!897097 (= res!606453 (not ((_ is Found!8912) lt!404908)))))

(declare-fun lt!404909 () Unit!30446)

(declare-fun lemmaSeekEntryGivesInRangeIndex!79 (array!52623 array!52625 (_ BitVec 32) (_ BitVec 32) V!29375 V!29375 (_ BitVec 64)) Unit!30446)

(assert (=> b!897097 (= lt!404909 (lemmaSeekEntryGivesInRangeIndex!79 (_keys!10142 thiss!1181) (_values!5392 thiss!1181) (mask!26070 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52623 (_ BitVec 32)) SeekEntryResult!8912)

(assert (=> b!897097 (= lt!404908 (seekEntry!0 key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(assert (= (and start!76602 res!606456) b!897094))

(assert (= (and b!897094 res!606457) b!897097))

(assert (= (and b!897097 (not res!606453)) b!897092))

(assert (= (and b!897097 (not res!606454)) b!897095))

(assert (= (and b!897095 (not res!606455)) b!897089))

(assert (= (and b!897093 condMapEmpty!29096) mapIsEmpty!29096))

(assert (= (and b!897093 (not condMapEmpty!29096)) mapNonEmpty!29096))

(assert (= (and mapNonEmpty!29096 ((_ is ValueCellFull!8672) mapValue!29096)) b!897096))

(assert (= (and b!897093 ((_ is ValueCellFull!8672) mapDefault!29096)) b!897090))

(assert (= b!897091 b!897093))

(assert (= start!76602 b!897091))

(declare-fun m!833407 () Bool)

(assert (=> mapNonEmpty!29096 m!833407))

(declare-fun m!833409 () Bool)

(assert (=> b!897097 m!833409))

(declare-fun m!833411 () Bool)

(assert (=> b!897097 m!833411))

(declare-fun m!833413 () Bool)

(assert (=> start!76602 m!833413))

(declare-fun m!833415 () Bool)

(assert (=> b!897095 m!833415))

(declare-fun m!833417 () Bool)

(assert (=> b!897095 m!833417))

(declare-fun m!833419 () Bool)

(assert (=> b!897095 m!833419))

(declare-fun m!833421 () Bool)

(assert (=> b!897092 m!833421))

(declare-fun m!833423 () Bool)

(assert (=> b!897091 m!833423))

(declare-fun m!833425 () Bool)

(assert (=> b!897091 m!833425))

(check-sat (not b!897095) (not mapNonEmpty!29096) (not start!76602) tp_is_empty!18307 (not b!897091) (not b_next!15979) b_and!26245 (not b!897092) (not b!897097))
(check-sat b_and!26245 (not b_next!15979))
(get-model)

(declare-fun d!110877 () Bool)

(declare-fun res!606494 () Bool)

(declare-fun e!501663 () Bool)

(assert (=> d!110877 (=> (not res!606494) (not e!501663))))

(declare-fun simpleValid!318 (LongMapFixedSize!4360) Bool)

(assert (=> d!110877 (= res!606494 (simpleValid!318 thiss!1181))))

(assert (=> d!110877 (= (valid!1686 thiss!1181) e!501663)))

(declare-fun b!897158 () Bool)

(declare-fun res!606495 () Bool)

(assert (=> b!897158 (=> (not res!606495) (not e!501663))))

(declare-fun arrayCountValidKeys!0 (array!52623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897158 (= res!606495 (= (arrayCountValidKeys!0 (_keys!10142 thiss!1181) #b00000000000000000000000000000000 (size!25751 (_keys!10142 thiss!1181))) (_size!2235 thiss!1181)))))

(declare-fun b!897159 () Bool)

(declare-fun res!606496 () Bool)

(assert (=> b!897159 (=> (not res!606496) (not e!501663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52623 (_ BitVec 32)) Bool)

(assert (=> b!897159 (= res!606496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(declare-fun b!897160 () Bool)

(declare-datatypes ((List!17836 0))(
  ( (Nil!17833) (Cons!17832 (h!18973 (_ BitVec 64)) (t!25166 List!17836)) )
))
(declare-fun arrayNoDuplicates!0 (array!52623 (_ BitVec 32) List!17836) Bool)

(assert (=> b!897160 (= e!501663 (arrayNoDuplicates!0 (_keys!10142 thiss!1181) #b00000000000000000000000000000000 Nil!17833))))

(assert (= (and d!110877 res!606494) b!897158))

(assert (= (and b!897158 res!606495) b!897159))

(assert (= (and b!897159 res!606496) b!897160))

(declare-fun m!833467 () Bool)

(assert (=> d!110877 m!833467))

(declare-fun m!833469 () Bool)

(assert (=> b!897158 m!833469))

(declare-fun m!833471 () Bool)

(assert (=> b!897159 m!833471))

(declare-fun m!833473 () Bool)

(assert (=> b!897160 m!833473))

(assert (=> start!76602 d!110877))

(declare-fun d!110879 () Bool)

(assert (=> d!110879 (= (validMask!0 (mask!26070 thiss!1181)) (and (or (= (mask!26070 thiss!1181) #b00000000000000000000000000000111) (= (mask!26070 thiss!1181) #b00000000000000000000000000001111) (= (mask!26070 thiss!1181) #b00000000000000000000000000011111) (= (mask!26070 thiss!1181) #b00000000000000000000000000111111) (= (mask!26070 thiss!1181) #b00000000000000000000000001111111) (= (mask!26070 thiss!1181) #b00000000000000000000000011111111) (= (mask!26070 thiss!1181) #b00000000000000000000000111111111) (= (mask!26070 thiss!1181) #b00000000000000000000001111111111) (= (mask!26070 thiss!1181) #b00000000000000000000011111111111) (= (mask!26070 thiss!1181) #b00000000000000000000111111111111) (= (mask!26070 thiss!1181) #b00000000000000000001111111111111) (= (mask!26070 thiss!1181) #b00000000000000000011111111111111) (= (mask!26070 thiss!1181) #b00000000000000000111111111111111) (= (mask!26070 thiss!1181) #b00000000000000001111111111111111) (= (mask!26070 thiss!1181) #b00000000000000011111111111111111) (= (mask!26070 thiss!1181) #b00000000000000111111111111111111) (= (mask!26070 thiss!1181) #b00000000000001111111111111111111) (= (mask!26070 thiss!1181) #b00000000000011111111111111111111) (= (mask!26070 thiss!1181) #b00000000000111111111111111111111) (= (mask!26070 thiss!1181) #b00000000001111111111111111111111) (= (mask!26070 thiss!1181) #b00000000011111111111111111111111) (= (mask!26070 thiss!1181) #b00000000111111111111111111111111) (= (mask!26070 thiss!1181) #b00000001111111111111111111111111) (= (mask!26070 thiss!1181) #b00000011111111111111111111111111) (= (mask!26070 thiss!1181) #b00000111111111111111111111111111) (= (mask!26070 thiss!1181) #b00001111111111111111111111111111) (= (mask!26070 thiss!1181) #b00011111111111111111111111111111) (= (mask!26070 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26070 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897095 d!110879))

(declare-fun d!110881 () Bool)

(declare-fun res!606501 () Bool)

(declare-fun e!501668 () Bool)

(assert (=> d!110881 (=> res!606501 e!501668)))

(assert (=> d!110881 (= res!606501 (= (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110881 (= (arrayContainsKey!0 (_keys!10142 thiss!1181) key!785 #b00000000000000000000000000000000) e!501668)))

(declare-fun b!897165 () Bool)

(declare-fun e!501669 () Bool)

(assert (=> b!897165 (= e!501668 e!501669)))

(declare-fun res!606502 () Bool)

(assert (=> b!897165 (=> (not res!606502) (not e!501669))))

(assert (=> b!897165 (= res!606502 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25751 (_keys!10142 thiss!1181))))))

(declare-fun b!897166 () Bool)

(assert (=> b!897166 (= e!501669 (arrayContainsKey!0 (_keys!10142 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110881 (not res!606501)) b!897165))

(assert (= (and b!897165 res!606502) b!897166))

(declare-fun m!833475 () Bool)

(assert (=> d!110881 m!833475))

(declare-fun m!833477 () Bool)

(assert (=> b!897166 m!833477))

(assert (=> b!897095 d!110881))

(declare-fun d!110883 () Bool)

(assert (=> d!110883 (arrayContainsKey!0 (_keys!10142 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404930 () Unit!30446)

(declare-fun choose!13 (array!52623 (_ BitVec 64) (_ BitVec 32)) Unit!30446)

(assert (=> d!110883 (= lt!404930 (choose!13 (_keys!10142 thiss!1181) key!785 (index!38020 lt!404908)))))

(assert (=> d!110883 (bvsge (index!38020 lt!404908) #b00000000000000000000000000000000)))

(assert (=> d!110883 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10142 thiss!1181) key!785 (index!38020 lt!404908)) lt!404930)))

(declare-fun bs!25156 () Bool)

(assert (= bs!25156 d!110883))

(assert (=> bs!25156 m!833417))

(declare-fun m!833479 () Bool)

(assert (=> bs!25156 m!833479))

(assert (=> b!897095 d!110883))

(declare-fun d!110885 () Bool)

(assert (=> d!110885 (= (array_inv!19906 (_keys!10142 thiss!1181)) (bvsge (size!25751 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897091 d!110885))

(declare-fun d!110887 () Bool)

(assert (=> d!110887 (= (array_inv!19907 (_values!5392 thiss!1181)) (bvsge (size!25752 (_values!5392 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897091 d!110887))

(declare-fun d!110889 () Bool)

(declare-fun e!501672 () Bool)

(assert (=> d!110889 e!501672))

(declare-fun res!606505 () Bool)

(assert (=> d!110889 (=> res!606505 e!501672)))

(declare-fun lt!404936 () SeekEntryResult!8912)

(assert (=> d!110889 (= res!606505 (not ((_ is Found!8912) lt!404936)))))

(assert (=> d!110889 (= lt!404936 (seekEntry!0 key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(declare-fun lt!404935 () Unit!30446)

(declare-fun choose!1492 (array!52623 array!52625 (_ BitVec 32) (_ BitVec 32) V!29375 V!29375 (_ BitVec 64)) Unit!30446)

(assert (=> d!110889 (= lt!404935 (choose!1492 (_keys!10142 thiss!1181) (_values!5392 thiss!1181) (mask!26070 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785))))

(assert (=> d!110889 (validMask!0 (mask!26070 thiss!1181))))

(assert (=> d!110889 (= (lemmaSeekEntryGivesInRangeIndex!79 (_keys!10142 thiss!1181) (_values!5392 thiss!1181) (mask!26070 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785) lt!404935)))

(declare-fun b!897169 () Bool)

(assert (=> b!897169 (= e!501672 (inRange!0 (index!38020 lt!404936) (mask!26070 thiss!1181)))))

(assert (= (and d!110889 (not res!606505)) b!897169))

(assert (=> d!110889 m!833411))

(declare-fun m!833481 () Bool)

(assert (=> d!110889 m!833481))

(assert (=> d!110889 m!833415))

(declare-fun m!833483 () Bool)

(assert (=> b!897169 m!833483))

(assert (=> b!897097 d!110889))

(declare-fun b!897182 () Bool)

(declare-fun e!501680 () SeekEntryResult!8912)

(declare-fun e!501679 () SeekEntryResult!8912)

(assert (=> b!897182 (= e!501680 e!501679)))

(declare-fun lt!404947 () (_ BitVec 64))

(declare-fun lt!404948 () SeekEntryResult!8912)

(assert (=> b!897182 (= lt!404947 (select (arr!25295 (_keys!10142 thiss!1181)) (index!38021 lt!404948)))))

(declare-fun c!94761 () Bool)

(assert (=> b!897182 (= c!94761 (= lt!404947 key!785))))

(declare-fun d!110891 () Bool)

(declare-fun lt!404946 () SeekEntryResult!8912)

(assert (=> d!110891 (and (or ((_ is MissingVacant!8912) lt!404946) (not ((_ is Found!8912) lt!404946)) (and (bvsge (index!38020 lt!404946) #b00000000000000000000000000000000) (bvslt (index!38020 lt!404946) (size!25751 (_keys!10142 thiss!1181))))) (not ((_ is MissingVacant!8912) lt!404946)) (or (not ((_ is Found!8912) lt!404946)) (= (select (arr!25295 (_keys!10142 thiss!1181)) (index!38020 lt!404946)) key!785)))))

(assert (=> d!110891 (= lt!404946 e!501680)))

(declare-fun c!94759 () Bool)

(assert (=> d!110891 (= c!94759 (and ((_ is Intermediate!8912) lt!404948) (undefined!9724 lt!404948)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52623 (_ BitVec 32)) SeekEntryResult!8912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110891 (= lt!404948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26070 thiss!1181)) key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(assert (=> d!110891 (validMask!0 (mask!26070 thiss!1181))))

(assert (=> d!110891 (= (seekEntry!0 key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)) lt!404946)))

(declare-fun b!897183 () Bool)

(declare-fun e!501681 () SeekEntryResult!8912)

(assert (=> b!897183 (= e!501681 (MissingZero!8912 (index!38021 lt!404948)))))

(declare-fun b!897184 () Bool)

(assert (=> b!897184 (= e!501679 (Found!8912 (index!38021 lt!404948)))))

(declare-fun b!897185 () Bool)

(declare-fun c!94760 () Bool)

(assert (=> b!897185 (= c!94760 (= lt!404947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897185 (= e!501679 e!501681)))

(declare-fun b!897186 () Bool)

(declare-fun lt!404945 () SeekEntryResult!8912)

(assert (=> b!897186 (= e!501681 (ite ((_ is MissingVacant!8912) lt!404945) (MissingZero!8912 (index!38022 lt!404945)) lt!404945))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52623 (_ BitVec 32)) SeekEntryResult!8912)

(assert (=> b!897186 (= lt!404945 (seekKeyOrZeroReturnVacant!0 (x!76447 lt!404948) (index!38021 lt!404948) (index!38021 lt!404948) key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(declare-fun b!897187 () Bool)

(assert (=> b!897187 (= e!501680 Undefined!8912)))

(assert (= (and d!110891 c!94759) b!897187))

(assert (= (and d!110891 (not c!94759)) b!897182))

(assert (= (and b!897182 c!94761) b!897184))

(assert (= (and b!897182 (not c!94761)) b!897185))

(assert (= (and b!897185 c!94760) b!897183))

(assert (= (and b!897185 (not c!94760)) b!897186))

(declare-fun m!833485 () Bool)

(assert (=> b!897182 m!833485))

(declare-fun m!833487 () Bool)

(assert (=> d!110891 m!833487))

(declare-fun m!833489 () Bool)

(assert (=> d!110891 m!833489))

(assert (=> d!110891 m!833489))

(declare-fun m!833491 () Bool)

(assert (=> d!110891 m!833491))

(assert (=> d!110891 m!833415))

(declare-fun m!833493 () Bool)

(assert (=> b!897186 m!833493))

(assert (=> b!897097 d!110891))

(declare-fun d!110893 () Bool)

(assert (=> d!110893 (= (inRange!0 (index!38020 lt!404908) (mask!26070 thiss!1181)) (and (bvsge (index!38020 lt!404908) #b00000000000000000000000000000000) (bvslt (index!38020 lt!404908) (bvadd (mask!26070 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897092 d!110893))

(declare-fun b!897194 () Bool)

(declare-fun e!501686 () Bool)

(assert (=> b!897194 (= e!501686 tp_is_empty!18307)))

(declare-fun mapNonEmpty!29105 () Bool)

(declare-fun mapRes!29105 () Bool)

(declare-fun tp!56003 () Bool)

(assert (=> mapNonEmpty!29105 (= mapRes!29105 (and tp!56003 e!501686))))

(declare-fun mapKey!29105 () (_ BitVec 32))

(declare-fun mapValue!29105 () ValueCell!8672)

(declare-fun mapRest!29105 () (Array (_ BitVec 32) ValueCell!8672))

(assert (=> mapNonEmpty!29105 (= mapRest!29096 (store mapRest!29105 mapKey!29105 mapValue!29105))))

(declare-fun condMapEmpty!29105 () Bool)

(declare-fun mapDefault!29105 () ValueCell!8672)

(assert (=> mapNonEmpty!29096 (= condMapEmpty!29105 (= mapRest!29096 ((as const (Array (_ BitVec 32) ValueCell!8672)) mapDefault!29105)))))

(declare-fun e!501687 () Bool)

(assert (=> mapNonEmpty!29096 (= tp!55988 (and e!501687 mapRes!29105))))

(declare-fun mapIsEmpty!29105 () Bool)

(assert (=> mapIsEmpty!29105 mapRes!29105))

(declare-fun b!897195 () Bool)

(assert (=> b!897195 (= e!501687 tp_is_empty!18307)))

(assert (= (and mapNonEmpty!29096 condMapEmpty!29105) mapIsEmpty!29105))

(assert (= (and mapNonEmpty!29096 (not condMapEmpty!29105)) mapNonEmpty!29105))

(assert (= (and mapNonEmpty!29105 ((_ is ValueCellFull!8672) mapValue!29105)) b!897194))

(assert (= (and mapNonEmpty!29096 ((_ is ValueCellFull!8672) mapDefault!29105)) b!897195))

(declare-fun m!833495 () Bool)

(assert (=> mapNonEmpty!29105 m!833495))

(check-sat (not mapNonEmpty!29105) (not d!110891) (not b!897186) tp_is_empty!18307 (not b!897166) (not b!897158) (not b_next!15979) (not d!110877) (not b!897169) (not b!897159) (not d!110883) (not b!897160) (not d!110889) b_and!26245)
(check-sat b_and!26245 (not b_next!15979))
(get-model)

(declare-fun b!897204 () Bool)

(declare-fun e!501694 () Bool)

(declare-fun e!501695 () Bool)

(assert (=> b!897204 (= e!501694 e!501695)))

(declare-fun lt!404957 () (_ BitVec 64))

(assert (=> b!897204 (= lt!404957 (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404956 () Unit!30446)

(assert (=> b!897204 (= lt!404956 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10142 thiss!1181) lt!404957 #b00000000000000000000000000000000))))

(assert (=> b!897204 (arrayContainsKey!0 (_keys!10142 thiss!1181) lt!404957 #b00000000000000000000000000000000)))

(declare-fun lt!404955 () Unit!30446)

(assert (=> b!897204 (= lt!404955 lt!404956)))

(declare-fun res!606510 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52623 (_ BitVec 32)) SeekEntryResult!8912)

(assert (=> b!897204 (= res!606510 (= (seekEntryOrOpen!0 (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000) (_keys!10142 thiss!1181) (mask!26070 thiss!1181)) (Found!8912 #b00000000000000000000000000000000)))))

(assert (=> b!897204 (=> (not res!606510) (not e!501695))))

(declare-fun b!897205 () Bool)

(declare-fun call!39782 () Bool)

(assert (=> b!897205 (= e!501695 call!39782)))

(declare-fun b!897206 () Bool)

(assert (=> b!897206 (= e!501694 call!39782)))

(declare-fun d!110895 () Bool)

(declare-fun res!606511 () Bool)

(declare-fun e!501696 () Bool)

(assert (=> d!110895 (=> res!606511 e!501696)))

(assert (=> d!110895 (= res!606511 (bvsge #b00000000000000000000000000000000 (size!25751 (_keys!10142 thiss!1181))))))

(assert (=> d!110895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)) e!501696)))

(declare-fun b!897207 () Bool)

(assert (=> b!897207 (= e!501696 e!501694)))

(declare-fun c!94764 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897207 (= c!94764 (validKeyInArray!0 (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39779 () Bool)

(assert (=> bm!39779 (= call!39782 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(assert (= (and d!110895 (not res!606511)) b!897207))

(assert (= (and b!897207 c!94764) b!897204))

(assert (= (and b!897207 (not c!94764)) b!897206))

(assert (= (and b!897204 res!606510) b!897205))

(assert (= (or b!897205 b!897206) bm!39779))

(assert (=> b!897204 m!833475))

(declare-fun m!833497 () Bool)

(assert (=> b!897204 m!833497))

(declare-fun m!833499 () Bool)

(assert (=> b!897204 m!833499))

(assert (=> b!897204 m!833475))

(declare-fun m!833501 () Bool)

(assert (=> b!897204 m!833501))

(assert (=> b!897207 m!833475))

(assert (=> b!897207 m!833475))

(declare-fun m!833503 () Bool)

(assert (=> b!897207 m!833503))

(declare-fun m!833505 () Bool)

(assert (=> bm!39779 m!833505))

(assert (=> b!897159 d!110895))

(declare-fun d!110897 () Bool)

(declare-fun res!606512 () Bool)

(declare-fun e!501697 () Bool)

(assert (=> d!110897 (=> res!606512 e!501697)))

(assert (=> d!110897 (= res!606512 (= (select (arr!25295 (_keys!10142 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110897 (= (arrayContainsKey!0 (_keys!10142 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501697)))

(declare-fun b!897208 () Bool)

(declare-fun e!501698 () Bool)

(assert (=> b!897208 (= e!501697 e!501698)))

(declare-fun res!606513 () Bool)

(assert (=> b!897208 (=> (not res!606513) (not e!501698))))

(assert (=> b!897208 (= res!606513 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25751 (_keys!10142 thiss!1181))))))

(declare-fun b!897209 () Bool)

(assert (=> b!897209 (= e!501698 (arrayContainsKey!0 (_keys!10142 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110897 (not res!606512)) b!897208))

(assert (= (and b!897208 res!606513) b!897209))

(declare-fun m!833507 () Bool)

(assert (=> d!110897 m!833507))

(declare-fun m!833509 () Bool)

(assert (=> b!897209 m!833509))

(assert (=> b!897166 d!110897))

(declare-fun b!897228 () Bool)

(declare-fun e!501709 () SeekEntryResult!8912)

(assert (=> b!897228 (= e!501709 (Intermediate!8912 true (toIndex!0 key!785 (mask!26070 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897229 () Bool)

(declare-fun e!501711 () SeekEntryResult!8912)

(assert (=> b!897229 (= e!501711 (Intermediate!8912 false (toIndex!0 key!785 (mask!26070 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897230 () Bool)

(declare-fun lt!404962 () SeekEntryResult!8912)

(assert (=> b!897230 (and (bvsge (index!38021 lt!404962) #b00000000000000000000000000000000) (bvslt (index!38021 lt!404962) (size!25751 (_keys!10142 thiss!1181))))))

(declare-fun res!606520 () Bool)

(assert (=> b!897230 (= res!606520 (= (select (arr!25295 (_keys!10142 thiss!1181)) (index!38021 lt!404962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501712 () Bool)

(assert (=> b!897230 (=> res!606520 e!501712)))

(declare-fun b!897231 () Bool)

(assert (=> b!897231 (and (bvsge (index!38021 lt!404962) #b00000000000000000000000000000000) (bvslt (index!38021 lt!404962) (size!25751 (_keys!10142 thiss!1181))))))

(assert (=> b!897231 (= e!501712 (= (select (arr!25295 (_keys!10142 thiss!1181)) (index!38021 lt!404962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!897232 () Bool)

(assert (=> b!897232 (= e!501709 e!501711)))

(declare-fun c!94772 () Bool)

(declare-fun lt!404963 () (_ BitVec 64))

(assert (=> b!897232 (= c!94772 (or (= lt!404963 key!785) (= (bvadd lt!404963 lt!404963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!110899 () Bool)

(declare-fun e!501713 () Bool)

(assert (=> d!110899 e!501713))

(declare-fun c!94771 () Bool)

(assert (=> d!110899 (= c!94771 (and ((_ is Intermediate!8912) lt!404962) (undefined!9724 lt!404962)))))

(assert (=> d!110899 (= lt!404962 e!501709)))

(declare-fun c!94773 () Bool)

(assert (=> d!110899 (= c!94773 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110899 (= lt!404963 (select (arr!25295 (_keys!10142 thiss!1181)) (toIndex!0 key!785 (mask!26070 thiss!1181))))))

(assert (=> d!110899 (validMask!0 (mask!26070 thiss!1181))))

(assert (=> d!110899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26070 thiss!1181)) key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)) lt!404962)))

(declare-fun b!897233 () Bool)

(assert (=> b!897233 (= e!501713 (bvsge (x!76447 lt!404962) #b01111111111111111111111111111110))))

(declare-fun b!897234 () Bool)

(declare-fun e!501710 () Bool)

(assert (=> b!897234 (= e!501713 e!501710)))

(declare-fun res!606522 () Bool)

(assert (=> b!897234 (= res!606522 (and ((_ is Intermediate!8912) lt!404962) (not (undefined!9724 lt!404962)) (bvslt (x!76447 lt!404962) #b01111111111111111111111111111110) (bvsge (x!76447 lt!404962) #b00000000000000000000000000000000) (bvsge (x!76447 lt!404962) #b00000000000000000000000000000000)))))

(assert (=> b!897234 (=> (not res!606522) (not e!501710))))

(declare-fun b!897235 () Bool)

(assert (=> b!897235 (and (bvsge (index!38021 lt!404962) #b00000000000000000000000000000000) (bvslt (index!38021 lt!404962) (size!25751 (_keys!10142 thiss!1181))))))

(declare-fun res!606521 () Bool)

(assert (=> b!897235 (= res!606521 (= (select (arr!25295 (_keys!10142 thiss!1181)) (index!38021 lt!404962)) key!785))))

(assert (=> b!897235 (=> res!606521 e!501712)))

(assert (=> b!897235 (= e!501710 e!501712)))

(declare-fun b!897236 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897236 (= e!501711 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26070 thiss!1181)) #b00000000000000000000000000000000 (mask!26070 thiss!1181)) key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(assert (= (and d!110899 c!94773) b!897228))

(assert (= (and d!110899 (not c!94773)) b!897232))

(assert (= (and b!897232 c!94772) b!897229))

(assert (= (and b!897232 (not c!94772)) b!897236))

(assert (= (and d!110899 c!94771) b!897233))

(assert (= (and d!110899 (not c!94771)) b!897234))

(assert (= (and b!897234 res!606522) b!897235))

(assert (= (and b!897235 (not res!606521)) b!897230))

(assert (= (and b!897230 (not res!606520)) b!897231))

(declare-fun m!833511 () Bool)

(assert (=> b!897231 m!833511))

(assert (=> b!897235 m!833511))

(assert (=> d!110899 m!833489))

(declare-fun m!833513 () Bool)

(assert (=> d!110899 m!833513))

(assert (=> d!110899 m!833415))

(assert (=> b!897236 m!833489))

(declare-fun m!833515 () Bool)

(assert (=> b!897236 m!833515))

(assert (=> b!897236 m!833515))

(declare-fun m!833517 () Bool)

(assert (=> b!897236 m!833517))

(assert (=> b!897230 m!833511))

(assert (=> d!110891 d!110899))

(declare-fun d!110901 () Bool)

(declare-fun lt!404969 () (_ BitVec 32))

(declare-fun lt!404968 () (_ BitVec 32))

(assert (=> d!110901 (= lt!404969 (bvmul (bvxor lt!404968 (bvlshr lt!404968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110901 (= lt!404968 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110901 (and (bvsge (mask!26070 thiss!1181) #b00000000000000000000000000000000) (let ((res!606523 (let ((h!18974 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76464 (bvmul (bvxor h!18974 (bvlshr h!18974 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76464 (bvlshr x!76464 #b00000000000000000000000000001101)) (mask!26070 thiss!1181)))))) (and (bvslt res!606523 (bvadd (mask!26070 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606523 #b00000000000000000000000000000000))))))

(assert (=> d!110901 (= (toIndex!0 key!785 (mask!26070 thiss!1181)) (bvand (bvxor lt!404969 (bvlshr lt!404969 #b00000000000000000000000000001101)) (mask!26070 thiss!1181)))))

(assert (=> d!110891 d!110901))

(assert (=> d!110891 d!110879))

(declare-fun b!897247 () Bool)

(declare-fun e!501724 () Bool)

(declare-fun e!501725 () Bool)

(assert (=> b!897247 (= e!501724 e!501725)))

(declare-fun c!94776 () Bool)

(assert (=> b!897247 (= c!94776 (validKeyInArray!0 (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110903 () Bool)

(declare-fun res!606530 () Bool)

(declare-fun e!501723 () Bool)

(assert (=> d!110903 (=> res!606530 e!501723)))

(assert (=> d!110903 (= res!606530 (bvsge #b00000000000000000000000000000000 (size!25751 (_keys!10142 thiss!1181))))))

(assert (=> d!110903 (= (arrayNoDuplicates!0 (_keys!10142 thiss!1181) #b00000000000000000000000000000000 Nil!17833) e!501723)))

(declare-fun b!897248 () Bool)

(assert (=> b!897248 (= e!501723 e!501724)))

(declare-fun res!606532 () Bool)

(assert (=> b!897248 (=> (not res!606532) (not e!501724))))

(declare-fun e!501722 () Bool)

(assert (=> b!897248 (= res!606532 (not e!501722))))

(declare-fun res!606531 () Bool)

(assert (=> b!897248 (=> (not res!606531) (not e!501722))))

(assert (=> b!897248 (= res!606531 (validKeyInArray!0 (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39782 () Bool)

(declare-fun call!39785 () Bool)

(assert (=> bm!39782 (= call!39785 (arrayNoDuplicates!0 (_keys!10142 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94776 (Cons!17832 (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000) Nil!17833) Nil!17833)))))

(declare-fun b!897249 () Bool)

(declare-fun contains!4374 (List!17836 (_ BitVec 64)) Bool)

(assert (=> b!897249 (= e!501722 (contains!4374 Nil!17833 (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897250 () Bool)

(assert (=> b!897250 (= e!501725 call!39785)))

(declare-fun b!897251 () Bool)

(assert (=> b!897251 (= e!501725 call!39785)))

(assert (= (and d!110903 (not res!606530)) b!897248))

(assert (= (and b!897248 res!606531) b!897249))

(assert (= (and b!897248 res!606532) b!897247))

(assert (= (and b!897247 c!94776) b!897250))

(assert (= (and b!897247 (not c!94776)) b!897251))

(assert (= (or b!897250 b!897251) bm!39782))

(assert (=> b!897247 m!833475))

(assert (=> b!897247 m!833475))

(assert (=> b!897247 m!833503))

(assert (=> b!897248 m!833475))

(assert (=> b!897248 m!833475))

(assert (=> b!897248 m!833503))

(assert (=> bm!39782 m!833475))

(declare-fun m!833519 () Bool)

(assert (=> bm!39782 m!833519))

(assert (=> b!897249 m!833475))

(assert (=> b!897249 m!833475))

(declare-fun m!833521 () Bool)

(assert (=> b!897249 m!833521))

(assert (=> b!897160 d!110903))

(declare-fun d!110905 () Bool)

(assert (=> d!110905 (= (inRange!0 (index!38020 lt!404936) (mask!26070 thiss!1181)) (and (bvsge (index!38020 lt!404936) #b00000000000000000000000000000000) (bvslt (index!38020 lt!404936) (bvadd (mask!26070 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897169 d!110905))

(declare-fun b!897264 () Bool)

(declare-fun e!501734 () SeekEntryResult!8912)

(assert (=> b!897264 (= e!501734 (Found!8912 (index!38021 lt!404948)))))

(declare-fun b!897265 () Bool)

(declare-fun c!94784 () Bool)

(declare-fun lt!404975 () (_ BitVec 64))

(assert (=> b!897265 (= c!94784 (= lt!404975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501732 () SeekEntryResult!8912)

(assert (=> b!897265 (= e!501734 e!501732)))

(declare-fun b!897266 () Bool)

(assert (=> b!897266 (= e!501732 (MissingVacant!8912 (index!38021 lt!404948)))))

(declare-fun lt!404974 () SeekEntryResult!8912)

(declare-fun d!110907 () Bool)

(assert (=> d!110907 (and (or ((_ is Undefined!8912) lt!404974) (not ((_ is Found!8912) lt!404974)) (and (bvsge (index!38020 lt!404974) #b00000000000000000000000000000000) (bvslt (index!38020 lt!404974) (size!25751 (_keys!10142 thiss!1181))))) (or ((_ is Undefined!8912) lt!404974) ((_ is Found!8912) lt!404974) (not ((_ is MissingVacant!8912) lt!404974)) (not (= (index!38022 lt!404974) (index!38021 lt!404948))) (and (bvsge (index!38022 lt!404974) #b00000000000000000000000000000000) (bvslt (index!38022 lt!404974) (size!25751 (_keys!10142 thiss!1181))))) (or ((_ is Undefined!8912) lt!404974) (ite ((_ is Found!8912) lt!404974) (= (select (arr!25295 (_keys!10142 thiss!1181)) (index!38020 lt!404974)) key!785) (and ((_ is MissingVacant!8912) lt!404974) (= (index!38022 lt!404974) (index!38021 lt!404948)) (= (select (arr!25295 (_keys!10142 thiss!1181)) (index!38022 lt!404974)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!501733 () SeekEntryResult!8912)

(assert (=> d!110907 (= lt!404974 e!501733)))

(declare-fun c!94783 () Bool)

(assert (=> d!110907 (= c!94783 (bvsge (x!76447 lt!404948) #b01111111111111111111111111111110))))

(assert (=> d!110907 (= lt!404975 (select (arr!25295 (_keys!10142 thiss!1181)) (index!38021 lt!404948)))))

(assert (=> d!110907 (validMask!0 (mask!26070 thiss!1181))))

(assert (=> d!110907 (= (seekKeyOrZeroReturnVacant!0 (x!76447 lt!404948) (index!38021 lt!404948) (index!38021 lt!404948) key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)) lt!404974)))

(declare-fun b!897267 () Bool)

(assert (=> b!897267 (= e!501732 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76447 lt!404948) #b00000000000000000000000000000001) (nextIndex!0 (index!38021 lt!404948) (x!76447 lt!404948) (mask!26070 thiss!1181)) (index!38021 lt!404948) key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(declare-fun b!897268 () Bool)

(assert (=> b!897268 (= e!501733 e!501734)))

(declare-fun c!94785 () Bool)

(assert (=> b!897268 (= c!94785 (= lt!404975 key!785))))

(declare-fun b!897269 () Bool)

(assert (=> b!897269 (= e!501733 Undefined!8912)))

(assert (= (and d!110907 c!94783) b!897269))

(assert (= (and d!110907 (not c!94783)) b!897268))

(assert (= (and b!897268 c!94785) b!897264))

(assert (= (and b!897268 (not c!94785)) b!897265))

(assert (= (and b!897265 c!94784) b!897266))

(assert (= (and b!897265 (not c!94784)) b!897267))

(declare-fun m!833523 () Bool)

(assert (=> d!110907 m!833523))

(declare-fun m!833525 () Bool)

(assert (=> d!110907 m!833525))

(assert (=> d!110907 m!833485))

(assert (=> d!110907 m!833415))

(declare-fun m!833527 () Bool)

(assert (=> b!897267 m!833527))

(assert (=> b!897267 m!833527))

(declare-fun m!833529 () Bool)

(assert (=> b!897267 m!833529))

(assert (=> b!897186 d!110907))

(assert (=> d!110883 d!110881))

(declare-fun d!110909 () Bool)

(assert (=> d!110909 (arrayContainsKey!0 (_keys!10142 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110909 true))

(declare-fun _$60!412 () Unit!30446)

(assert (=> d!110909 (= (choose!13 (_keys!10142 thiss!1181) key!785 (index!38020 lt!404908)) _$60!412)))

(declare-fun bs!25157 () Bool)

(assert (= bs!25157 d!110909))

(assert (=> bs!25157 m!833417))

(assert (=> d!110883 d!110909))

(declare-fun d!110911 () Bool)

(declare-fun lt!404978 () (_ BitVec 32))

(assert (=> d!110911 (and (bvsge lt!404978 #b00000000000000000000000000000000) (bvsle lt!404978 (bvsub (size!25751 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!501739 () (_ BitVec 32))

(assert (=> d!110911 (= lt!404978 e!501739)))

(declare-fun c!94791 () Bool)

(assert (=> d!110911 (= c!94791 (bvsge #b00000000000000000000000000000000 (size!25751 (_keys!10142 thiss!1181))))))

(assert (=> d!110911 (and (bvsle #b00000000000000000000000000000000 (size!25751 (_keys!10142 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25751 (_keys!10142 thiss!1181)) (size!25751 (_keys!10142 thiss!1181))))))

(assert (=> d!110911 (= (arrayCountValidKeys!0 (_keys!10142 thiss!1181) #b00000000000000000000000000000000 (size!25751 (_keys!10142 thiss!1181))) lt!404978)))

(declare-fun b!897278 () Bool)

(declare-fun e!501740 () (_ BitVec 32))

(declare-fun call!39788 () (_ BitVec 32))

(assert (=> b!897278 (= e!501740 (bvadd #b00000000000000000000000000000001 call!39788))))

(declare-fun bm!39785 () Bool)

(assert (=> bm!39785 (= call!39788 (arrayCountValidKeys!0 (_keys!10142 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25751 (_keys!10142 thiss!1181))))))

(declare-fun b!897279 () Bool)

(assert (=> b!897279 (= e!501739 e!501740)))

(declare-fun c!94790 () Bool)

(assert (=> b!897279 (= c!94790 (validKeyInArray!0 (select (arr!25295 (_keys!10142 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897280 () Bool)

(assert (=> b!897280 (= e!501740 call!39788)))

(declare-fun b!897281 () Bool)

(assert (=> b!897281 (= e!501739 #b00000000000000000000000000000000)))

(assert (= (and d!110911 c!94791) b!897281))

(assert (= (and d!110911 (not c!94791)) b!897279))

(assert (= (and b!897279 c!94790) b!897278))

(assert (= (and b!897279 (not c!94790)) b!897280))

(assert (= (or b!897278 b!897280) bm!39785))

(declare-fun m!833531 () Bool)

(assert (=> bm!39785 m!833531))

(assert (=> b!897279 m!833475))

(assert (=> b!897279 m!833475))

(assert (=> b!897279 m!833503))

(assert (=> b!897158 d!110911))

(declare-fun b!897292 () Bool)

(declare-fun res!606541 () Bool)

(declare-fun e!501743 () Bool)

(assert (=> b!897292 (=> (not res!606541) (not e!501743))))

(declare-fun size!25757 (LongMapFixedSize!4360) (_ BitVec 32))

(assert (=> b!897292 (= res!606541 (= (size!25757 thiss!1181) (bvadd (_size!2235 thiss!1181) (bvsdiv (bvadd (extraKeys!5101 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!897291 () Bool)

(declare-fun res!606544 () Bool)

(assert (=> b!897291 (=> (not res!606544) (not e!501743))))

(assert (=> b!897291 (= res!606544 (bvsge (size!25757 thiss!1181) (_size!2235 thiss!1181)))))

(declare-fun b!897290 () Bool)

(declare-fun res!606542 () Bool)

(assert (=> b!897290 (=> (not res!606542) (not e!501743))))

(assert (=> b!897290 (= res!606542 (and (= (size!25752 (_values!5392 thiss!1181)) (bvadd (mask!26070 thiss!1181) #b00000000000000000000000000000001)) (= (size!25751 (_keys!10142 thiss!1181)) (size!25752 (_values!5392 thiss!1181))) (bvsge (_size!2235 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2235 thiss!1181) (bvadd (mask!26070 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!897293 () Bool)

(assert (=> b!897293 (= e!501743 (and (bvsge (extraKeys!5101 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5101 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2235 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!110913 () Bool)

(declare-fun res!606543 () Bool)

(assert (=> d!110913 (=> (not res!606543) (not e!501743))))

(assert (=> d!110913 (= res!606543 (validMask!0 (mask!26070 thiss!1181)))))

(assert (=> d!110913 (= (simpleValid!318 thiss!1181) e!501743)))

(assert (= (and d!110913 res!606543) b!897290))

(assert (= (and b!897290 res!606542) b!897291))

(assert (= (and b!897291 res!606544) b!897292))

(assert (= (and b!897292 res!606541) b!897293))

(declare-fun m!833533 () Bool)

(assert (=> b!897292 m!833533))

(assert (=> b!897291 m!833533))

(assert (=> d!110913 m!833415))

(assert (=> d!110877 d!110913))

(assert (=> d!110889 d!110891))

(declare-fun d!110915 () Bool)

(declare-fun e!501746 () Bool)

(assert (=> d!110915 e!501746))

(declare-fun res!606547 () Bool)

(assert (=> d!110915 (=> res!606547 e!501746)))

(declare-fun lt!404981 () SeekEntryResult!8912)

(assert (=> d!110915 (= res!606547 (not ((_ is Found!8912) lt!404981)))))

(assert (=> d!110915 (= lt!404981 (seekEntry!0 key!785 (_keys!10142 thiss!1181) (mask!26070 thiss!1181)))))

(assert (=> d!110915 true))

(declare-fun _$36!363 () Unit!30446)

(assert (=> d!110915 (= (choose!1492 (_keys!10142 thiss!1181) (_values!5392 thiss!1181) (mask!26070 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785) _$36!363)))

(declare-fun b!897296 () Bool)

(assert (=> b!897296 (= e!501746 (inRange!0 (index!38020 lt!404981) (mask!26070 thiss!1181)))))

(assert (= (and d!110915 (not res!606547)) b!897296))

(assert (=> d!110915 m!833411))

(declare-fun m!833535 () Bool)

(assert (=> b!897296 m!833535))

(assert (=> d!110889 d!110915))

(assert (=> d!110889 d!110879))

(declare-fun b!897297 () Bool)

(declare-fun e!501747 () Bool)

(assert (=> b!897297 (= e!501747 tp_is_empty!18307)))

(declare-fun mapNonEmpty!29106 () Bool)

(declare-fun mapRes!29106 () Bool)

(declare-fun tp!56004 () Bool)

(assert (=> mapNonEmpty!29106 (= mapRes!29106 (and tp!56004 e!501747))))

(declare-fun mapKey!29106 () (_ BitVec 32))

(declare-fun mapValue!29106 () ValueCell!8672)

(declare-fun mapRest!29106 () (Array (_ BitVec 32) ValueCell!8672))

(assert (=> mapNonEmpty!29106 (= mapRest!29105 (store mapRest!29106 mapKey!29106 mapValue!29106))))

(declare-fun condMapEmpty!29106 () Bool)

(declare-fun mapDefault!29106 () ValueCell!8672)

(assert (=> mapNonEmpty!29105 (= condMapEmpty!29106 (= mapRest!29105 ((as const (Array (_ BitVec 32) ValueCell!8672)) mapDefault!29106)))))

(declare-fun e!501748 () Bool)

(assert (=> mapNonEmpty!29105 (= tp!56003 (and e!501748 mapRes!29106))))

(declare-fun mapIsEmpty!29106 () Bool)

(assert (=> mapIsEmpty!29106 mapRes!29106))

(declare-fun b!897298 () Bool)

(assert (=> b!897298 (= e!501748 tp_is_empty!18307)))

(assert (= (and mapNonEmpty!29105 condMapEmpty!29106) mapIsEmpty!29106))

(assert (= (and mapNonEmpty!29105 (not condMapEmpty!29106)) mapNonEmpty!29106))

(assert (= (and mapNonEmpty!29106 ((_ is ValueCellFull!8672) mapValue!29106)) b!897297))

(assert (= (and mapNonEmpty!29105 ((_ is ValueCellFull!8672) mapDefault!29106)) b!897298))

(declare-fun m!833537 () Bool)

(assert (=> mapNonEmpty!29106 m!833537))

(check-sat (not bm!39785) (not bm!39779) (not b!897279) (not b!897236) (not d!110907) (not b!897292) (not b!897209) (not b_next!15979) (not b!897207) (not d!110915) (not mapNonEmpty!29106) (not b!897248) (not b!897249) (not d!110909) (not d!110913) tp_is_empty!18307 (not b!897204) (not b!897291) (not b!897296) b_and!26245 (not b!897247) (not bm!39782) (not b!897267) (not d!110899))
(check-sat b_and!26245 (not b_next!15979))
