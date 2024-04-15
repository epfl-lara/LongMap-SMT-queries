; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76246 () Bool)

(assert start!76246)

(declare-fun b!895030 () Bool)

(declare-fun b_free!15901 () Bool)

(declare-fun b_next!15901 () Bool)

(assert (=> b!895030 (= b_free!15901 (not b_next!15901))))

(declare-fun tp!55709 () Bool)

(declare-fun b_and!26167 () Bool)

(assert (=> b!895030 (= tp!55709 b_and!26167)))

(declare-datatypes ((array!52441 0))(
  ( (array!52442 (arr!25217 (Array (_ BitVec 32) (_ BitVec 64))) (size!25668 (_ BitVec 32))) )
))
(declare-datatypes ((V!29271 0))(
  ( (V!29272 (val!9165 Int)) )
))
(declare-datatypes ((ValueCell!8633 0))(
  ( (ValueCellFull!8633 (v!11652 V!29271)) (EmptyCell!8633) )
))
(declare-datatypes ((array!52443 0))(
  ( (array!52444 (arr!25218 (Array (_ BitVec 32) ValueCell!8633)) (size!25669 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4282 0))(
  ( (LongMapFixedSize!4283 (defaultEntry!5353 Int) (mask!25937 (_ BitVec 32)) (extraKeys!5049 (_ BitVec 32)) (zeroValue!5153 V!29271) (minValue!5153 V!29271) (_size!2196 (_ BitVec 32)) (_keys!10059 array!52441) (_values!5340 array!52443) (_vacant!2196 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4282)

(declare-fun e!500043 () Bool)

(declare-fun tp_is_empty!18229 () Bool)

(declare-fun e!500039 () Bool)

(declare-fun array_inv!19850 (array!52441) Bool)

(declare-fun array_inv!19851 (array!52443) Bool)

(assert (=> b!895030 (= e!500039 (and tp!55709 tp_is_empty!18229 (array_inv!19850 (_keys!10059 thiss!1181)) (array_inv!19851 (_values!5340 thiss!1181)) e!500043))))

(declare-fun mapNonEmpty!28935 () Bool)

(declare-fun mapRes!28935 () Bool)

(declare-fun tp!55710 () Bool)

(declare-fun e!500042 () Bool)

(assert (=> mapNonEmpty!28935 (= mapRes!28935 (and tp!55710 e!500042))))

(declare-fun mapValue!28935 () ValueCell!8633)

(declare-fun mapRest!28935 () (Array (_ BitVec 32) ValueCell!8633))

(declare-fun mapKey!28935 () (_ BitVec 32))

(assert (=> mapNonEmpty!28935 (= (arr!25218 (_values!5340 thiss!1181)) (store mapRest!28935 mapKey!28935 mapValue!28935))))

(declare-fun b!895031 () Bool)

(declare-fun e!500045 () Bool)

(declare-fun e!500041 () Bool)

(assert (=> b!895031 (= e!500045 e!500041)))

(declare-fun res!605535 () Bool)

(assert (=> b!895031 (=> (not res!605535) (not e!500041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895031 (= res!605535 (validMask!0 (mask!25937 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8881 0))(
  ( (MissingZero!8881 (index!37895 (_ BitVec 32))) (Found!8881 (index!37896 (_ BitVec 32))) (Intermediate!8881 (undefined!9693 Bool) (index!37897 (_ BitVec 32)) (x!76163 (_ BitVec 32))) (Undefined!8881) (MissingVacant!8881 (index!37898 (_ BitVec 32))) )
))
(declare-fun lt!404246 () SeekEntryResult!8881)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52441 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!895031 (= lt!404246 (seekEntry!0 key!785 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)))))

(declare-fun b!895032 () Bool)

(declare-fun e!500040 () Bool)

(assert (=> b!895032 (= e!500040 tp_is_empty!18229)))

(declare-fun b!895033 () Bool)

(assert (=> b!895033 (= e!500043 (and e!500040 mapRes!28935))))

(declare-fun condMapEmpty!28935 () Bool)

(declare-fun mapDefault!28935 () ValueCell!8633)

(assert (=> b!895033 (= condMapEmpty!28935 (= (arr!25218 (_values!5340 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8633)) mapDefault!28935)))))

(declare-fun b!895035 () Bool)

(declare-fun res!605537 () Bool)

(assert (=> b!895035 (=> (not res!605537) (not e!500045))))

(assert (=> b!895035 (= res!605537 (not (= key!785 (bvneg key!785))))))

(declare-fun res!605536 () Bool)

(assert (=> start!76246 (=> (not res!605536) (not e!500045))))

(declare-fun valid!1660 (LongMapFixedSize!4282) Bool)

(assert (=> start!76246 (= res!605536 (valid!1660 thiss!1181))))

(assert (=> start!76246 e!500045))

(assert (=> start!76246 e!500039))

(assert (=> start!76246 true))

(declare-fun b!895034 () Bool)

(assert (=> b!895034 (= e!500041 (and (= (size!25669 (_values!5340 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25937 thiss!1181))) (= (size!25668 (_keys!10059 thiss!1181)) (size!25669 (_values!5340 thiss!1181))) (bvsge (mask!25937 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5049 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5049 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28935 () Bool)

(assert (=> mapIsEmpty!28935 mapRes!28935))

(declare-fun b!895036 () Bool)

(assert (=> b!895036 (= e!500042 tp_is_empty!18229)))

(assert (= (and start!76246 res!605536) b!895035))

(assert (= (and b!895035 res!605537) b!895031))

(assert (= (and b!895031 res!605535) b!895034))

(assert (= (and b!895033 condMapEmpty!28935) mapIsEmpty!28935))

(assert (= (and b!895033 (not condMapEmpty!28935)) mapNonEmpty!28935))

(get-info :version)

(assert (= (and mapNonEmpty!28935 ((_ is ValueCellFull!8633) mapValue!28935)) b!895036))

(assert (= (and b!895033 ((_ is ValueCellFull!8633) mapDefault!28935)) b!895032))

(assert (= b!895030 b!895033))

(assert (= start!76246 b!895030))

(declare-fun m!832177 () Bool)

(assert (=> b!895030 m!832177))

(declare-fun m!832179 () Bool)

(assert (=> b!895030 m!832179))

(declare-fun m!832181 () Bool)

(assert (=> mapNonEmpty!28935 m!832181))

(declare-fun m!832183 () Bool)

(assert (=> b!895031 m!832183))

(declare-fun m!832185 () Bool)

(assert (=> b!895031 m!832185))

(declare-fun m!832187 () Bool)

(assert (=> start!76246 m!832187))

(check-sat (not b!895031) (not b_next!15901) (not start!76246) b_and!26167 tp_is_empty!18229 (not b!895030) (not mapNonEmpty!28935))
(check-sat b_and!26167 (not b_next!15901))
(get-model)

(declare-fun d!110559 () Bool)

(assert (=> d!110559 (= (validMask!0 (mask!25937 thiss!1181)) (and (or (= (mask!25937 thiss!1181) #b00000000000000000000000000000111) (= (mask!25937 thiss!1181) #b00000000000000000000000000001111) (= (mask!25937 thiss!1181) #b00000000000000000000000000011111) (= (mask!25937 thiss!1181) #b00000000000000000000000000111111) (= (mask!25937 thiss!1181) #b00000000000000000000000001111111) (= (mask!25937 thiss!1181) #b00000000000000000000000011111111) (= (mask!25937 thiss!1181) #b00000000000000000000000111111111) (= (mask!25937 thiss!1181) #b00000000000000000000001111111111) (= (mask!25937 thiss!1181) #b00000000000000000000011111111111) (= (mask!25937 thiss!1181) #b00000000000000000000111111111111) (= (mask!25937 thiss!1181) #b00000000000000000001111111111111) (= (mask!25937 thiss!1181) #b00000000000000000011111111111111) (= (mask!25937 thiss!1181) #b00000000000000000111111111111111) (= (mask!25937 thiss!1181) #b00000000000000001111111111111111) (= (mask!25937 thiss!1181) #b00000000000000011111111111111111) (= (mask!25937 thiss!1181) #b00000000000000111111111111111111) (= (mask!25937 thiss!1181) #b00000000000001111111111111111111) (= (mask!25937 thiss!1181) #b00000000000011111111111111111111) (= (mask!25937 thiss!1181) #b00000000000111111111111111111111) (= (mask!25937 thiss!1181) #b00000000001111111111111111111111) (= (mask!25937 thiss!1181) #b00000000011111111111111111111111) (= (mask!25937 thiss!1181) #b00000000111111111111111111111111) (= (mask!25937 thiss!1181) #b00000001111111111111111111111111) (= (mask!25937 thiss!1181) #b00000011111111111111111111111111) (= (mask!25937 thiss!1181) #b00000111111111111111111111111111) (= (mask!25937 thiss!1181) #b00001111111111111111111111111111) (= (mask!25937 thiss!1181) #b00011111111111111111111111111111) (= (mask!25937 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25937 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895031 d!110559))

(declare-fun b!895092 () Bool)

(declare-fun e!500096 () SeekEntryResult!8881)

(declare-fun lt!404264 () SeekEntryResult!8881)

(assert (=> b!895092 (= e!500096 (MissingZero!8881 (index!37897 lt!404264)))))

(declare-fun b!895093 () Bool)

(declare-fun e!500094 () SeekEntryResult!8881)

(assert (=> b!895093 (= e!500094 (Found!8881 (index!37897 lt!404264)))))

(declare-fun b!895094 () Bool)

(declare-fun lt!404263 () SeekEntryResult!8881)

(assert (=> b!895094 (= e!500096 (ite ((_ is MissingVacant!8881) lt!404263) (MissingZero!8881 (index!37898 lt!404263)) lt!404263))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52441 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!895094 (= lt!404263 (seekKeyOrZeroReturnVacant!0 (x!76163 lt!404264) (index!37897 lt!404264) (index!37897 lt!404264) key!785 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)))))

(declare-fun b!895095 () Bool)

(declare-fun e!500095 () SeekEntryResult!8881)

(assert (=> b!895095 (= e!500095 e!500094)))

(declare-fun lt!404261 () (_ BitVec 64))

(assert (=> b!895095 (= lt!404261 (select (arr!25217 (_keys!10059 thiss!1181)) (index!37897 lt!404264)))))

(declare-fun c!94479 () Bool)

(assert (=> b!895095 (= c!94479 (= lt!404261 key!785))))

(declare-fun b!895096 () Bool)

(assert (=> b!895096 (= e!500095 Undefined!8881)))

(declare-fun d!110561 () Bool)

(declare-fun lt!404262 () SeekEntryResult!8881)

(assert (=> d!110561 (and (or ((_ is MissingVacant!8881) lt!404262) (not ((_ is Found!8881) lt!404262)) (and (bvsge (index!37896 lt!404262) #b00000000000000000000000000000000) (bvslt (index!37896 lt!404262) (size!25668 (_keys!10059 thiss!1181))))) (not ((_ is MissingVacant!8881) lt!404262)) (or (not ((_ is Found!8881) lt!404262)) (= (select (arr!25217 (_keys!10059 thiss!1181)) (index!37896 lt!404262)) key!785)))))

(assert (=> d!110561 (= lt!404262 e!500095)))

(declare-fun c!94478 () Bool)

(assert (=> d!110561 (= c!94478 (and ((_ is Intermediate!8881) lt!404264) (undefined!9693 lt!404264)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52441 (_ BitVec 32)) SeekEntryResult!8881)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110561 (= lt!404264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25937 thiss!1181)) key!785 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)))))

(assert (=> d!110561 (validMask!0 (mask!25937 thiss!1181))))

(assert (=> d!110561 (= (seekEntry!0 key!785 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)) lt!404262)))

(declare-fun b!895091 () Bool)

(declare-fun c!94477 () Bool)

(assert (=> b!895091 (= c!94477 (= lt!404261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895091 (= e!500094 e!500096)))

(assert (= (and d!110561 c!94478) b!895096))

(assert (= (and d!110561 (not c!94478)) b!895095))

(assert (= (and b!895095 c!94479) b!895093))

(assert (= (and b!895095 (not c!94479)) b!895091))

(assert (= (and b!895091 c!94477) b!895092))

(assert (= (and b!895091 (not c!94477)) b!895094))

(declare-fun m!832213 () Bool)

(assert (=> b!895094 m!832213))

(declare-fun m!832215 () Bool)

(assert (=> b!895095 m!832215))

(declare-fun m!832217 () Bool)

(assert (=> d!110561 m!832217))

(declare-fun m!832219 () Bool)

(assert (=> d!110561 m!832219))

(assert (=> d!110561 m!832219))

(declare-fun m!832221 () Bool)

(assert (=> d!110561 m!832221))

(assert (=> d!110561 m!832183))

(assert (=> b!895031 d!110561))

(declare-fun d!110563 () Bool)

(declare-fun res!605562 () Bool)

(declare-fun e!500099 () Bool)

(assert (=> d!110563 (=> (not res!605562) (not e!500099))))

(declare-fun simpleValid!305 (LongMapFixedSize!4282) Bool)

(assert (=> d!110563 (= res!605562 (simpleValid!305 thiss!1181))))

(assert (=> d!110563 (= (valid!1660 thiss!1181) e!500099)))

(declare-fun b!895103 () Bool)

(declare-fun res!605563 () Bool)

(assert (=> b!895103 (=> (not res!605563) (not e!500099))))

(declare-fun arrayCountValidKeys!0 (array!52441 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895103 (= res!605563 (= (arrayCountValidKeys!0 (_keys!10059 thiss!1181) #b00000000000000000000000000000000 (size!25668 (_keys!10059 thiss!1181))) (_size!2196 thiss!1181)))))

(declare-fun b!895104 () Bool)

(declare-fun res!605564 () Bool)

(assert (=> b!895104 (=> (not res!605564) (not e!500099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52441 (_ BitVec 32)) Bool)

(assert (=> b!895104 (= res!605564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)))))

(declare-fun b!895105 () Bool)

(declare-datatypes ((List!17820 0))(
  ( (Nil!17817) (Cons!17816 (h!18952 (_ BitVec 64)) (t!25150 List!17820)) )
))
(declare-fun arrayNoDuplicates!0 (array!52441 (_ BitVec 32) List!17820) Bool)

(assert (=> b!895105 (= e!500099 (arrayNoDuplicates!0 (_keys!10059 thiss!1181) #b00000000000000000000000000000000 Nil!17817))))

(assert (= (and d!110563 res!605562) b!895103))

(assert (= (and b!895103 res!605563) b!895104))

(assert (= (and b!895104 res!605564) b!895105))

(declare-fun m!832223 () Bool)

(assert (=> d!110563 m!832223))

(declare-fun m!832225 () Bool)

(assert (=> b!895103 m!832225))

(declare-fun m!832227 () Bool)

(assert (=> b!895104 m!832227))

(declare-fun m!832229 () Bool)

(assert (=> b!895105 m!832229))

(assert (=> start!76246 d!110563))

(declare-fun d!110565 () Bool)

(assert (=> d!110565 (= (array_inv!19850 (_keys!10059 thiss!1181)) (bvsge (size!25668 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895030 d!110565))

(declare-fun d!110567 () Bool)

(assert (=> d!110567 (= (array_inv!19851 (_values!5340 thiss!1181)) (bvsge (size!25669 (_values!5340 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895030 d!110567))

(declare-fun b!895112 () Bool)

(declare-fun e!500104 () Bool)

(assert (=> b!895112 (= e!500104 tp_is_empty!18229)))

(declare-fun mapIsEmpty!28944 () Bool)

(declare-fun mapRes!28944 () Bool)

(assert (=> mapIsEmpty!28944 mapRes!28944))

(declare-fun condMapEmpty!28944 () Bool)

(declare-fun mapDefault!28944 () ValueCell!8633)

(assert (=> mapNonEmpty!28935 (= condMapEmpty!28944 (= mapRest!28935 ((as const (Array (_ BitVec 32) ValueCell!8633)) mapDefault!28944)))))

(declare-fun e!500105 () Bool)

(assert (=> mapNonEmpty!28935 (= tp!55710 (and e!500105 mapRes!28944))))

(declare-fun mapNonEmpty!28944 () Bool)

(declare-fun tp!55725 () Bool)

(assert (=> mapNonEmpty!28944 (= mapRes!28944 (and tp!55725 e!500104))))

(declare-fun mapKey!28944 () (_ BitVec 32))

(declare-fun mapRest!28944 () (Array (_ BitVec 32) ValueCell!8633))

(declare-fun mapValue!28944 () ValueCell!8633)

(assert (=> mapNonEmpty!28944 (= mapRest!28935 (store mapRest!28944 mapKey!28944 mapValue!28944))))

(declare-fun b!895113 () Bool)

(assert (=> b!895113 (= e!500105 tp_is_empty!18229)))

(assert (= (and mapNonEmpty!28935 condMapEmpty!28944) mapIsEmpty!28944))

(assert (= (and mapNonEmpty!28935 (not condMapEmpty!28944)) mapNonEmpty!28944))

(assert (= (and mapNonEmpty!28944 ((_ is ValueCellFull!8633) mapValue!28944)) b!895112))

(assert (= (and mapNonEmpty!28935 ((_ is ValueCellFull!8633) mapDefault!28944)) b!895113))

(declare-fun m!832231 () Bool)

(assert (=> mapNonEmpty!28944 m!832231))

(check-sat (not b!895104) b_and!26167 tp_is_empty!18229 (not mapNonEmpty!28944) (not b!895094) (not b!895103) (not b_next!15901) (not b!895105) (not d!110561) (not d!110563))
(check-sat b_and!26167 (not b_next!15901))
(get-model)

(declare-fun b!895122 () Bool)

(declare-fun e!500110 () (_ BitVec 32))

(declare-fun call!39722 () (_ BitVec 32))

(assert (=> b!895122 (= e!500110 call!39722)))

(declare-fun b!895123 () Bool)

(declare-fun e!500111 () (_ BitVec 32))

(assert (=> b!895123 (= e!500111 #b00000000000000000000000000000000)))

(declare-fun d!110569 () Bool)

(declare-fun lt!404267 () (_ BitVec 32))

(assert (=> d!110569 (and (bvsge lt!404267 #b00000000000000000000000000000000) (bvsle lt!404267 (bvsub (size!25668 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110569 (= lt!404267 e!500111)))

(declare-fun c!94485 () Bool)

(assert (=> d!110569 (= c!94485 (bvsge #b00000000000000000000000000000000 (size!25668 (_keys!10059 thiss!1181))))))

(assert (=> d!110569 (and (bvsle #b00000000000000000000000000000000 (size!25668 (_keys!10059 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25668 (_keys!10059 thiss!1181)) (size!25668 (_keys!10059 thiss!1181))))))

(assert (=> d!110569 (= (arrayCountValidKeys!0 (_keys!10059 thiss!1181) #b00000000000000000000000000000000 (size!25668 (_keys!10059 thiss!1181))) lt!404267)))

(declare-fun b!895124 () Bool)

(assert (=> b!895124 (= e!500110 (bvadd #b00000000000000000000000000000001 call!39722))))

(declare-fun b!895125 () Bool)

(assert (=> b!895125 (= e!500111 e!500110)))

(declare-fun c!94484 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895125 (= c!94484 (validKeyInArray!0 (select (arr!25217 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39719 () Bool)

(assert (=> bm!39719 (= call!39722 (arrayCountValidKeys!0 (_keys!10059 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25668 (_keys!10059 thiss!1181))))))

(assert (= (and d!110569 c!94485) b!895123))

(assert (= (and d!110569 (not c!94485)) b!895125))

(assert (= (and b!895125 c!94484) b!895124))

(assert (= (and b!895125 (not c!94484)) b!895122))

(assert (= (or b!895124 b!895122) bm!39719))

(declare-fun m!832233 () Bool)

(assert (=> b!895125 m!832233))

(assert (=> b!895125 m!832233))

(declare-fun m!832235 () Bool)

(assert (=> b!895125 m!832235))

(declare-fun m!832237 () Bool)

(assert (=> bm!39719 m!832237))

(assert (=> b!895103 d!110569))

(declare-fun b!895134 () Bool)

(declare-fun res!605574 () Bool)

(declare-fun e!500114 () Bool)

(assert (=> b!895134 (=> (not res!605574) (not e!500114))))

(assert (=> b!895134 (= res!605574 (and (= (size!25669 (_values!5340 thiss!1181)) (bvadd (mask!25937 thiss!1181) #b00000000000000000000000000000001)) (= (size!25668 (_keys!10059 thiss!1181)) (size!25669 (_values!5340 thiss!1181))) (bvsge (_size!2196 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2196 thiss!1181) (bvadd (mask!25937 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!895135 () Bool)

(declare-fun res!605575 () Bool)

(assert (=> b!895135 (=> (not res!605575) (not e!500114))))

(declare-fun size!25674 (LongMapFixedSize!4282) (_ BitVec 32))

(assert (=> b!895135 (= res!605575 (bvsge (size!25674 thiss!1181) (_size!2196 thiss!1181)))))

(declare-fun b!895136 () Bool)

(declare-fun res!605573 () Bool)

(assert (=> b!895136 (=> (not res!605573) (not e!500114))))

(assert (=> b!895136 (= res!605573 (= (size!25674 thiss!1181) (bvadd (_size!2196 thiss!1181) (bvsdiv (bvadd (extraKeys!5049 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!110571 () Bool)

(declare-fun res!605576 () Bool)

(assert (=> d!110571 (=> (not res!605576) (not e!500114))))

(assert (=> d!110571 (= res!605576 (validMask!0 (mask!25937 thiss!1181)))))

(assert (=> d!110571 (= (simpleValid!305 thiss!1181) e!500114)))

(declare-fun b!895137 () Bool)

(assert (=> b!895137 (= e!500114 (and (bvsge (extraKeys!5049 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5049 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2196 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!110571 res!605576) b!895134))

(assert (= (and b!895134 res!605574) b!895135))

(assert (= (and b!895135 res!605575) b!895136))

(assert (= (and b!895136 res!605573) b!895137))

(declare-fun m!832239 () Bool)

(assert (=> b!895135 m!832239))

(assert (=> b!895136 m!832239))

(assert (=> d!110571 m!832183))

(assert (=> d!110563 d!110571))

(declare-fun b!895156 () Bool)

(declare-fun e!500129 () SeekEntryResult!8881)

(assert (=> b!895156 (= e!500129 (Intermediate!8881 false (toIndex!0 key!785 (mask!25937 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895157 () Bool)

(declare-fun lt!404273 () SeekEntryResult!8881)

(assert (=> b!895157 (and (bvsge (index!37897 lt!404273) #b00000000000000000000000000000000) (bvslt (index!37897 lt!404273) (size!25668 (_keys!10059 thiss!1181))))))

(declare-fun res!605583 () Bool)

(assert (=> b!895157 (= res!605583 (= (select (arr!25217 (_keys!10059 thiss!1181)) (index!37897 lt!404273)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500128 () Bool)

(assert (=> b!895157 (=> res!605583 e!500128)))

(declare-fun b!895158 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895158 (= e!500129 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25937 thiss!1181)) #b00000000000000000000000000000000 (mask!25937 thiss!1181)) key!785 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)))))

(declare-fun b!895160 () Bool)

(declare-fun e!500126 () Bool)

(declare-fun e!500127 () Bool)

(assert (=> b!895160 (= e!500126 e!500127)))

(declare-fun res!605584 () Bool)

(assert (=> b!895160 (= res!605584 (and ((_ is Intermediate!8881) lt!404273) (not (undefined!9693 lt!404273)) (bvslt (x!76163 lt!404273) #b01111111111111111111111111111110) (bvsge (x!76163 lt!404273) #b00000000000000000000000000000000) (bvsge (x!76163 lt!404273) #b00000000000000000000000000000000)))))

(assert (=> b!895160 (=> (not res!605584) (not e!500127))))

(declare-fun b!895161 () Bool)

(declare-fun e!500125 () SeekEntryResult!8881)

(assert (=> b!895161 (= e!500125 (Intermediate!8881 true (toIndex!0 key!785 (mask!25937 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895162 () Bool)

(assert (=> b!895162 (= e!500125 e!500129)))

(declare-fun c!94493 () Bool)

(declare-fun lt!404272 () (_ BitVec 64))

(assert (=> b!895162 (= c!94493 (or (= lt!404272 key!785) (= (bvadd lt!404272 lt!404272) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!895163 () Bool)

(assert (=> b!895163 (= e!500126 (bvsge (x!76163 lt!404273) #b01111111111111111111111111111110))))

(declare-fun b!895164 () Bool)

(assert (=> b!895164 (and (bvsge (index!37897 lt!404273) #b00000000000000000000000000000000) (bvslt (index!37897 lt!404273) (size!25668 (_keys!10059 thiss!1181))))))

(declare-fun res!605585 () Bool)

(assert (=> b!895164 (= res!605585 (= (select (arr!25217 (_keys!10059 thiss!1181)) (index!37897 lt!404273)) key!785))))

(assert (=> b!895164 (=> res!605585 e!500128)))

(assert (=> b!895164 (= e!500127 e!500128)))

(declare-fun b!895159 () Bool)

(assert (=> b!895159 (and (bvsge (index!37897 lt!404273) #b00000000000000000000000000000000) (bvslt (index!37897 lt!404273) (size!25668 (_keys!10059 thiss!1181))))))

(assert (=> b!895159 (= e!500128 (= (select (arr!25217 (_keys!10059 thiss!1181)) (index!37897 lt!404273)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!110573 () Bool)

(assert (=> d!110573 e!500126))

(declare-fun c!94494 () Bool)

(assert (=> d!110573 (= c!94494 (and ((_ is Intermediate!8881) lt!404273) (undefined!9693 lt!404273)))))

(assert (=> d!110573 (= lt!404273 e!500125)))

(declare-fun c!94492 () Bool)

(assert (=> d!110573 (= c!94492 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110573 (= lt!404272 (select (arr!25217 (_keys!10059 thiss!1181)) (toIndex!0 key!785 (mask!25937 thiss!1181))))))

(assert (=> d!110573 (validMask!0 (mask!25937 thiss!1181))))

(assert (=> d!110573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25937 thiss!1181)) key!785 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)) lt!404273)))

(assert (= (and d!110573 c!94492) b!895161))

(assert (= (and d!110573 (not c!94492)) b!895162))

(assert (= (and b!895162 c!94493) b!895156))

(assert (= (and b!895162 (not c!94493)) b!895158))

(assert (= (and d!110573 c!94494) b!895163))

(assert (= (and d!110573 (not c!94494)) b!895160))

(assert (= (and b!895160 res!605584) b!895164))

(assert (= (and b!895164 (not res!605585)) b!895157))

(assert (= (and b!895157 (not res!605583)) b!895159))

(declare-fun m!832241 () Bool)

(assert (=> b!895157 m!832241))

(assert (=> b!895159 m!832241))

(assert (=> d!110573 m!832219))

(declare-fun m!832243 () Bool)

(assert (=> d!110573 m!832243))

(assert (=> d!110573 m!832183))

(assert (=> b!895158 m!832219))

(declare-fun m!832245 () Bool)

(assert (=> b!895158 m!832245))

(assert (=> b!895158 m!832245))

(declare-fun m!832247 () Bool)

(assert (=> b!895158 m!832247))

(assert (=> b!895164 m!832241))

(assert (=> d!110561 d!110573))

(declare-fun d!110575 () Bool)

(declare-fun lt!404279 () (_ BitVec 32))

(declare-fun lt!404278 () (_ BitVec 32))

(assert (=> d!110575 (= lt!404279 (bvmul (bvxor lt!404278 (bvlshr lt!404278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110575 (= lt!404278 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110575 (and (bvsge (mask!25937 thiss!1181) #b00000000000000000000000000000000) (let ((res!605586 (let ((h!18953 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76180 (bvmul (bvxor h!18953 (bvlshr h!18953 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76180 (bvlshr x!76180 #b00000000000000000000000000001101)) (mask!25937 thiss!1181)))))) (and (bvslt res!605586 (bvadd (mask!25937 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605586 #b00000000000000000000000000000000))))))

(assert (=> d!110575 (= (toIndex!0 key!785 (mask!25937 thiss!1181)) (bvand (bvxor lt!404279 (bvlshr lt!404279 #b00000000000000000000000000001101)) (mask!25937 thiss!1181)))))

(assert (=> d!110561 d!110575))

(assert (=> d!110561 d!110559))

(declare-fun bm!39722 () Bool)

(declare-fun call!39725 () Bool)

(declare-fun c!94497 () Bool)

(assert (=> bm!39722 (= call!39725 (arrayNoDuplicates!0 (_keys!10059 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94497 (Cons!17816 (select (arr!25217 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000) Nil!17817) Nil!17817)))))

(declare-fun d!110577 () Bool)

(declare-fun res!605593 () Bool)

(declare-fun e!500138 () Bool)

(assert (=> d!110577 (=> res!605593 e!500138)))

(assert (=> d!110577 (= res!605593 (bvsge #b00000000000000000000000000000000 (size!25668 (_keys!10059 thiss!1181))))))

(assert (=> d!110577 (= (arrayNoDuplicates!0 (_keys!10059 thiss!1181) #b00000000000000000000000000000000 Nil!17817) e!500138)))

(declare-fun b!895175 () Bool)

(declare-fun e!500141 () Bool)

(declare-fun contains!4367 (List!17820 (_ BitVec 64)) Bool)

(assert (=> b!895175 (= e!500141 (contains!4367 Nil!17817 (select (arr!25217 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895176 () Bool)

(declare-fun e!500139 () Bool)

(assert (=> b!895176 (= e!500139 call!39725)))

(declare-fun b!895177 () Bool)

(assert (=> b!895177 (= e!500139 call!39725)))

(declare-fun b!895178 () Bool)

(declare-fun e!500140 () Bool)

(assert (=> b!895178 (= e!500138 e!500140)))

(declare-fun res!605594 () Bool)

(assert (=> b!895178 (=> (not res!605594) (not e!500140))))

(assert (=> b!895178 (= res!605594 (not e!500141))))

(declare-fun res!605595 () Bool)

(assert (=> b!895178 (=> (not res!605595) (not e!500141))))

(assert (=> b!895178 (= res!605595 (validKeyInArray!0 (select (arr!25217 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895179 () Bool)

(assert (=> b!895179 (= e!500140 e!500139)))

(assert (=> b!895179 (= c!94497 (validKeyInArray!0 (select (arr!25217 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110577 (not res!605593)) b!895178))

(assert (= (and b!895178 res!605595) b!895175))

(assert (= (and b!895178 res!605594) b!895179))

(assert (= (and b!895179 c!94497) b!895177))

(assert (= (and b!895179 (not c!94497)) b!895176))

(assert (= (or b!895177 b!895176) bm!39722))

(assert (=> bm!39722 m!832233))

(declare-fun m!832249 () Bool)

(assert (=> bm!39722 m!832249))

(assert (=> b!895175 m!832233))

(assert (=> b!895175 m!832233))

(declare-fun m!832251 () Bool)

(assert (=> b!895175 m!832251))

(assert (=> b!895178 m!832233))

(assert (=> b!895178 m!832233))

(assert (=> b!895178 m!832235))

(assert (=> b!895179 m!832233))

(assert (=> b!895179 m!832233))

(assert (=> b!895179 m!832235))

(assert (=> b!895105 d!110577))

(declare-fun b!895188 () Bool)

(declare-fun e!500150 () Bool)

(declare-fun e!500148 () Bool)

(assert (=> b!895188 (= e!500150 e!500148)))

(declare-fun lt!404286 () (_ BitVec 64))

(assert (=> b!895188 (= lt!404286 (select (arr!25217 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30404 0))(
  ( (Unit!30405) )
))
(declare-fun lt!404288 () Unit!30404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52441 (_ BitVec 64) (_ BitVec 32)) Unit!30404)

(assert (=> b!895188 (= lt!404288 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10059 thiss!1181) lt!404286 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895188 (arrayContainsKey!0 (_keys!10059 thiss!1181) lt!404286 #b00000000000000000000000000000000)))

(declare-fun lt!404287 () Unit!30404)

(assert (=> b!895188 (= lt!404287 lt!404288)))

(declare-fun res!605601 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52441 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!895188 (= res!605601 (= (seekEntryOrOpen!0 (select (arr!25217 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000) (_keys!10059 thiss!1181) (mask!25937 thiss!1181)) (Found!8881 #b00000000000000000000000000000000)))))

(assert (=> b!895188 (=> (not res!605601) (not e!500148))))

(declare-fun b!895189 () Bool)

(declare-fun call!39728 () Bool)

(assert (=> b!895189 (= e!500150 call!39728)))

(declare-fun bm!39725 () Bool)

(assert (=> bm!39725 (= call!39728 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10059 thiss!1181) (mask!25937 thiss!1181)))))

(declare-fun b!895190 () Bool)

(declare-fun e!500149 () Bool)

(assert (=> b!895190 (= e!500149 e!500150)))

(declare-fun c!94500 () Bool)

(assert (=> b!895190 (= c!94500 (validKeyInArray!0 (select (arr!25217 (_keys!10059 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895191 () Bool)

(assert (=> b!895191 (= e!500148 call!39728)))

(declare-fun d!110579 () Bool)

(declare-fun res!605600 () Bool)

(assert (=> d!110579 (=> res!605600 e!500149)))

(assert (=> d!110579 (= res!605600 (bvsge #b00000000000000000000000000000000 (size!25668 (_keys!10059 thiss!1181))))))

(assert (=> d!110579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)) e!500149)))

(assert (= (and d!110579 (not res!605600)) b!895190))

(assert (= (and b!895190 c!94500) b!895188))

(assert (= (and b!895190 (not c!94500)) b!895189))

(assert (= (and b!895188 res!605601) b!895191))

(assert (= (or b!895191 b!895189) bm!39725))

(assert (=> b!895188 m!832233))

(declare-fun m!832253 () Bool)

(assert (=> b!895188 m!832253))

(declare-fun m!832255 () Bool)

(assert (=> b!895188 m!832255))

(assert (=> b!895188 m!832233))

(declare-fun m!832257 () Bool)

(assert (=> b!895188 m!832257))

(declare-fun m!832259 () Bool)

(assert (=> bm!39725 m!832259))

(assert (=> b!895190 m!832233))

(assert (=> b!895190 m!832233))

(assert (=> b!895190 m!832235))

(assert (=> b!895104 d!110579))

(declare-fun b!895204 () Bool)

(declare-fun e!500159 () SeekEntryResult!8881)

(assert (=> b!895204 (= e!500159 (MissingVacant!8881 (index!37897 lt!404264)))))

(declare-fun b!895205 () Bool)

(declare-fun c!94508 () Bool)

(declare-fun lt!404293 () (_ BitVec 64))

(assert (=> b!895205 (= c!94508 (= lt!404293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500158 () SeekEntryResult!8881)

(assert (=> b!895205 (= e!500158 e!500159)))

(declare-fun b!895206 () Bool)

(assert (=> b!895206 (= e!500159 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76163 lt!404264) #b00000000000000000000000000000001) (nextIndex!0 (index!37897 lt!404264) (x!76163 lt!404264) (mask!25937 thiss!1181)) (index!37897 lt!404264) key!785 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)))))

(declare-fun d!110581 () Bool)

(declare-fun lt!404294 () SeekEntryResult!8881)

(assert (=> d!110581 (and (or ((_ is Undefined!8881) lt!404294) (not ((_ is Found!8881) lt!404294)) (and (bvsge (index!37896 lt!404294) #b00000000000000000000000000000000) (bvslt (index!37896 lt!404294) (size!25668 (_keys!10059 thiss!1181))))) (or ((_ is Undefined!8881) lt!404294) ((_ is Found!8881) lt!404294) (not ((_ is MissingVacant!8881) lt!404294)) (not (= (index!37898 lt!404294) (index!37897 lt!404264))) (and (bvsge (index!37898 lt!404294) #b00000000000000000000000000000000) (bvslt (index!37898 lt!404294) (size!25668 (_keys!10059 thiss!1181))))) (or ((_ is Undefined!8881) lt!404294) (ite ((_ is Found!8881) lt!404294) (= (select (arr!25217 (_keys!10059 thiss!1181)) (index!37896 lt!404294)) key!785) (and ((_ is MissingVacant!8881) lt!404294) (= (index!37898 lt!404294) (index!37897 lt!404264)) (= (select (arr!25217 (_keys!10059 thiss!1181)) (index!37898 lt!404294)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!500157 () SeekEntryResult!8881)

(assert (=> d!110581 (= lt!404294 e!500157)))

(declare-fun c!94509 () Bool)

(assert (=> d!110581 (= c!94509 (bvsge (x!76163 lt!404264) #b01111111111111111111111111111110))))

(assert (=> d!110581 (= lt!404293 (select (arr!25217 (_keys!10059 thiss!1181)) (index!37897 lt!404264)))))

(assert (=> d!110581 (validMask!0 (mask!25937 thiss!1181))))

(assert (=> d!110581 (= (seekKeyOrZeroReturnVacant!0 (x!76163 lt!404264) (index!37897 lt!404264) (index!37897 lt!404264) key!785 (_keys!10059 thiss!1181) (mask!25937 thiss!1181)) lt!404294)))

(declare-fun b!895207 () Bool)

(assert (=> b!895207 (= e!500157 e!500158)))

(declare-fun c!94507 () Bool)

(assert (=> b!895207 (= c!94507 (= lt!404293 key!785))))

(declare-fun b!895208 () Bool)

(assert (=> b!895208 (= e!500158 (Found!8881 (index!37897 lt!404264)))))

(declare-fun b!895209 () Bool)

(assert (=> b!895209 (= e!500157 Undefined!8881)))

(assert (= (and d!110581 c!94509) b!895209))

(assert (= (and d!110581 (not c!94509)) b!895207))

(assert (= (and b!895207 c!94507) b!895208))

(assert (= (and b!895207 (not c!94507)) b!895205))

(assert (= (and b!895205 c!94508) b!895204))

(assert (= (and b!895205 (not c!94508)) b!895206))

(declare-fun m!832261 () Bool)

(assert (=> b!895206 m!832261))

(assert (=> b!895206 m!832261))

(declare-fun m!832263 () Bool)

(assert (=> b!895206 m!832263))

(declare-fun m!832265 () Bool)

(assert (=> d!110581 m!832265))

(declare-fun m!832267 () Bool)

(assert (=> d!110581 m!832267))

(assert (=> d!110581 m!832215))

(assert (=> d!110581 m!832183))

(assert (=> b!895094 d!110581))

(declare-fun b!895210 () Bool)

(declare-fun e!500160 () Bool)

(assert (=> b!895210 (= e!500160 tp_is_empty!18229)))

(declare-fun mapIsEmpty!28945 () Bool)

(declare-fun mapRes!28945 () Bool)

(assert (=> mapIsEmpty!28945 mapRes!28945))

(declare-fun condMapEmpty!28945 () Bool)

(declare-fun mapDefault!28945 () ValueCell!8633)

(assert (=> mapNonEmpty!28944 (= condMapEmpty!28945 (= mapRest!28944 ((as const (Array (_ BitVec 32) ValueCell!8633)) mapDefault!28945)))))

(declare-fun e!500161 () Bool)

(assert (=> mapNonEmpty!28944 (= tp!55725 (and e!500161 mapRes!28945))))

(declare-fun mapNonEmpty!28945 () Bool)

(declare-fun tp!55726 () Bool)

(assert (=> mapNonEmpty!28945 (= mapRes!28945 (and tp!55726 e!500160))))

(declare-fun mapValue!28945 () ValueCell!8633)

(declare-fun mapRest!28945 () (Array (_ BitVec 32) ValueCell!8633))

(declare-fun mapKey!28945 () (_ BitVec 32))

(assert (=> mapNonEmpty!28945 (= mapRest!28944 (store mapRest!28945 mapKey!28945 mapValue!28945))))

(declare-fun b!895211 () Bool)

(assert (=> b!895211 (= e!500161 tp_is_empty!18229)))

(assert (= (and mapNonEmpty!28944 condMapEmpty!28945) mapIsEmpty!28945))

(assert (= (and mapNonEmpty!28944 (not condMapEmpty!28945)) mapNonEmpty!28945))

(assert (= (and mapNonEmpty!28945 ((_ is ValueCellFull!8633) mapValue!28945)) b!895210))

(assert (= (and mapNonEmpty!28944 ((_ is ValueCellFull!8633) mapDefault!28945)) b!895211))

(declare-fun m!832269 () Bool)

(assert (=> mapNonEmpty!28945 m!832269))

(check-sat (not b!895190) (not d!110571) (not mapNonEmpty!28945) (not b!895136) (not b!895178) (not b_next!15901) (not d!110573) (not b!895135) (not bm!39719) b_and!26167 tp_is_empty!18229 (not b!895158) (not bm!39725) (not b!895188) (not bm!39722) (not d!110581) (not b!895179) (not b!895125) (not b!895175) (not b!895206))
(check-sat b_and!26167 (not b_next!15901))
