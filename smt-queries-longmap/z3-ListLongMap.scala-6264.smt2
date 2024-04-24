; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80228 () Bool)

(assert start!80228)

(declare-fun b!942141 () Bool)

(declare-fun b_free!17905 () Bool)

(declare-fun b_next!17905 () Bool)

(assert (=> b!942141 (= b_free!17905 (not b_next!17905))))

(declare-fun tp!62193 () Bool)

(declare-fun b_and!29327 () Bool)

(assert (=> b!942141 (= tp!62193 b_and!29327)))

(declare-fun b!942136 () Bool)

(declare-fun e!529721 () Bool)

(declare-fun tp_is_empty!20413 () Bool)

(assert (=> b!942136 (= e!529721 tp_is_empty!20413)))

(declare-fun mapIsEmpty!32413 () Bool)

(declare-fun mapRes!32413 () Bool)

(assert (=> mapIsEmpty!32413 mapRes!32413))

(declare-fun b!942137 () Bool)

(declare-fun e!529719 () Bool)

(assert (=> b!942137 (= e!529719 tp_is_empty!20413)))

(declare-fun b!942138 () Bool)

(declare-fun res!633137 () Bool)

(declare-fun e!529720 () Bool)

(assert (=> b!942138 (=> (not res!633137) (not e!529720))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942138 (= res!633137 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942139 () Bool)

(declare-fun res!633138 () Bool)

(assert (=> b!942139 (=> (not res!633138) (not e!529720))))

(declare-datatypes ((V!32183 0))(
  ( (V!32184 (val!10257 Int)) )
))
(declare-datatypes ((ValueCell!9725 0))(
  ( (ValueCellFull!9725 (v!12785 V!32183)) (EmptyCell!9725) )
))
(declare-datatypes ((array!56827 0))(
  ( (array!56828 (arr!27343 (Array (_ BitVec 32) ValueCell!9725)) (size!27805 (_ BitVec 32))) )
))
(declare-datatypes ((array!56829 0))(
  ( (array!56830 (arr!27344 (Array (_ BitVec 32) (_ BitVec 64))) (size!27806 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4600 0))(
  ( (LongMapFixedSize!4601 (defaultEntry!5591 Int) (mask!27195 (_ BitVec 32)) (extraKeys!5323 (_ BitVec 32)) (zeroValue!5427 V!32183) (minValue!5427 V!32183) (_size!2355 (_ BitVec 32)) (_keys!10470 array!56829) (_values!5614 array!56827) (_vacant!2355 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4600)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942139 (= res!633138 (validMask!0 (mask!27195 thiss!1141)))))

(declare-fun b!942140 () Bool)

(declare-fun e!529723 () Bool)

(assert (=> b!942140 (= e!529723 (and e!529721 mapRes!32413))))

(declare-fun condMapEmpty!32413 () Bool)

(declare-fun mapDefault!32413 () ValueCell!9725)

(assert (=> b!942140 (= condMapEmpty!32413 (= (arr!27343 (_values!5614 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9725)) mapDefault!32413)))))

(declare-fun b!942142 () Bool)

(assert (=> b!942142 (= e!529720 (not (= (size!27805 (_values!5614 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27195 thiss!1141)))))))

(declare-fun b!942143 () Bool)

(declare-fun res!633136 () Bool)

(assert (=> b!942143 (=> (not res!633136) (not e!529720))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8974 0))(
  ( (MissingZero!8974 (index!38267 (_ BitVec 32))) (Found!8974 (index!38268 (_ BitVec 32))) (Intermediate!8974 (undefined!9786 Bool) (index!38269 (_ BitVec 32)) (x!80729 (_ BitVec 32))) (Undefined!8974) (MissingVacant!8974 (index!38270 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56829 (_ BitVec 32)) SeekEntryResult!8974)

(assert (=> b!942143 (= res!633136 (not ((_ is Found!8974) (seekEntry!0 key!756 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)))))))

(declare-fun mapNonEmpty!32413 () Bool)

(declare-fun tp!62194 () Bool)

(assert (=> mapNonEmpty!32413 (= mapRes!32413 (and tp!62194 e!529719))))

(declare-fun mapValue!32413 () ValueCell!9725)

(declare-fun mapKey!32413 () (_ BitVec 32))

(declare-fun mapRest!32413 () (Array (_ BitVec 32) ValueCell!9725))

(assert (=> mapNonEmpty!32413 (= (arr!27343 (_values!5614 thiss!1141)) (store mapRest!32413 mapKey!32413 mapValue!32413))))

(declare-fun res!633135 () Bool)

(assert (=> start!80228 (=> (not res!633135) (not e!529720))))

(declare-fun valid!1766 (LongMapFixedSize!4600) Bool)

(assert (=> start!80228 (= res!633135 (valid!1766 thiss!1141))))

(assert (=> start!80228 e!529720))

(declare-fun e!529722 () Bool)

(assert (=> start!80228 e!529722))

(assert (=> start!80228 true))

(declare-fun array_inv!21340 (array!56829) Bool)

(declare-fun array_inv!21341 (array!56827) Bool)

(assert (=> b!942141 (= e!529722 (and tp!62193 tp_is_empty!20413 (array_inv!21340 (_keys!10470 thiss!1141)) (array_inv!21341 (_values!5614 thiss!1141)) e!529723))))

(assert (= (and start!80228 res!633135) b!942138))

(assert (= (and b!942138 res!633137) b!942143))

(assert (= (and b!942143 res!633136) b!942139))

(assert (= (and b!942139 res!633138) b!942142))

(assert (= (and b!942140 condMapEmpty!32413) mapIsEmpty!32413))

(assert (= (and b!942140 (not condMapEmpty!32413)) mapNonEmpty!32413))

(assert (= (and mapNonEmpty!32413 ((_ is ValueCellFull!9725) mapValue!32413)) b!942137))

(assert (= (and b!942140 ((_ is ValueCellFull!9725) mapDefault!32413)) b!942136))

(assert (= b!942141 b!942140))

(assert (= start!80228 b!942141))

(declare-fun m!877729 () Bool)

(assert (=> b!942139 m!877729))

(declare-fun m!877731 () Bool)

(assert (=> start!80228 m!877731))

(declare-fun m!877733 () Bool)

(assert (=> mapNonEmpty!32413 m!877733))

(declare-fun m!877735 () Bool)

(assert (=> b!942143 m!877735))

(declare-fun m!877737 () Bool)

(assert (=> b!942141 m!877737))

(declare-fun m!877739 () Bool)

(assert (=> b!942141 m!877739))

(check-sat (not b!942143) (not b!942139) tp_is_empty!20413 (not b!942141) (not mapNonEmpty!32413) (not start!80228) b_and!29327 (not b_next!17905))
(check-sat b_and!29327 (not b_next!17905))
(get-model)

(declare-fun d!114365 () Bool)

(assert (=> d!114365 (= (validMask!0 (mask!27195 thiss!1141)) (and (or (= (mask!27195 thiss!1141) #b00000000000000000000000000000111) (= (mask!27195 thiss!1141) #b00000000000000000000000000001111) (= (mask!27195 thiss!1141) #b00000000000000000000000000011111) (= (mask!27195 thiss!1141) #b00000000000000000000000000111111) (= (mask!27195 thiss!1141) #b00000000000000000000000001111111) (= (mask!27195 thiss!1141) #b00000000000000000000000011111111) (= (mask!27195 thiss!1141) #b00000000000000000000000111111111) (= (mask!27195 thiss!1141) #b00000000000000000000001111111111) (= (mask!27195 thiss!1141) #b00000000000000000000011111111111) (= (mask!27195 thiss!1141) #b00000000000000000000111111111111) (= (mask!27195 thiss!1141) #b00000000000000000001111111111111) (= (mask!27195 thiss!1141) #b00000000000000000011111111111111) (= (mask!27195 thiss!1141) #b00000000000000000111111111111111) (= (mask!27195 thiss!1141) #b00000000000000001111111111111111) (= (mask!27195 thiss!1141) #b00000000000000011111111111111111) (= (mask!27195 thiss!1141) #b00000000000000111111111111111111) (= (mask!27195 thiss!1141) #b00000000000001111111111111111111) (= (mask!27195 thiss!1141) #b00000000000011111111111111111111) (= (mask!27195 thiss!1141) #b00000000000111111111111111111111) (= (mask!27195 thiss!1141) #b00000000001111111111111111111111) (= (mask!27195 thiss!1141) #b00000000011111111111111111111111) (= (mask!27195 thiss!1141) #b00000000111111111111111111111111) (= (mask!27195 thiss!1141) #b00000001111111111111111111111111) (= (mask!27195 thiss!1141) #b00000011111111111111111111111111) (= (mask!27195 thiss!1141) #b00000111111111111111111111111111) (= (mask!27195 thiss!1141) #b00001111111111111111111111111111) (= (mask!27195 thiss!1141) #b00011111111111111111111111111111) (= (mask!27195 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27195 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942139 d!114365))

(declare-fun d!114367 () Bool)

(declare-fun res!633169 () Bool)

(declare-fun e!529762 () Bool)

(assert (=> d!114367 (=> (not res!633169) (not e!529762))))

(declare-fun simpleValid!340 (LongMapFixedSize!4600) Bool)

(assert (=> d!114367 (= res!633169 (simpleValid!340 thiss!1141))))

(assert (=> d!114367 (= (valid!1766 thiss!1141) e!529762)))

(declare-fun b!942198 () Bool)

(declare-fun res!633170 () Bool)

(assert (=> b!942198 (=> (not res!633170) (not e!529762))))

(declare-fun arrayCountValidKeys!0 (array!56829 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942198 (= res!633170 (= (arrayCountValidKeys!0 (_keys!10470 thiss!1141) #b00000000000000000000000000000000 (size!27806 (_keys!10470 thiss!1141))) (_size!2355 thiss!1141)))))

(declare-fun b!942199 () Bool)

(declare-fun res!633171 () Bool)

(assert (=> b!942199 (=> (not res!633171) (not e!529762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56829 (_ BitVec 32)) Bool)

(assert (=> b!942199 (= res!633171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)))))

(declare-fun b!942200 () Bool)

(declare-datatypes ((List!19191 0))(
  ( (Nil!19188) (Cons!19187 (h!20339 (_ BitVec 64)) (t!27498 List!19191)) )
))
(declare-fun arrayNoDuplicates!0 (array!56829 (_ BitVec 32) List!19191) Bool)

(assert (=> b!942200 (= e!529762 (arrayNoDuplicates!0 (_keys!10470 thiss!1141) #b00000000000000000000000000000000 Nil!19188))))

(assert (= (and d!114367 res!633169) b!942198))

(assert (= (and b!942198 res!633170) b!942199))

(assert (= (and b!942199 res!633171) b!942200))

(declare-fun m!877765 () Bool)

(assert (=> d!114367 m!877765))

(declare-fun m!877767 () Bool)

(assert (=> b!942198 m!877767))

(declare-fun m!877769 () Bool)

(assert (=> b!942199 m!877769))

(declare-fun m!877771 () Bool)

(assert (=> b!942200 m!877771))

(assert (=> start!80228 d!114367))

(declare-fun d!114369 () Bool)

(declare-fun lt!425305 () SeekEntryResult!8974)

(assert (=> d!114369 (and (or ((_ is MissingVacant!8974) lt!425305) (not ((_ is Found!8974) lt!425305)) (and (bvsge (index!38268 lt!425305) #b00000000000000000000000000000000) (bvslt (index!38268 lt!425305) (size!27806 (_keys!10470 thiss!1141))))) (not ((_ is MissingVacant!8974) lt!425305)) (or (not ((_ is Found!8974) lt!425305)) (= (select (arr!27344 (_keys!10470 thiss!1141)) (index!38268 lt!425305)) key!756)))))

(declare-fun e!529770 () SeekEntryResult!8974)

(assert (=> d!114369 (= lt!425305 e!529770)))

(declare-fun c!98324 () Bool)

(declare-fun lt!425306 () SeekEntryResult!8974)

(assert (=> d!114369 (= c!98324 (and ((_ is Intermediate!8974) lt!425306) (undefined!9786 lt!425306)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56829 (_ BitVec 32)) SeekEntryResult!8974)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114369 (= lt!425306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27195 thiss!1141)) key!756 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)))))

(assert (=> d!114369 (validMask!0 (mask!27195 thiss!1141))))

(assert (=> d!114369 (= (seekEntry!0 key!756 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)) lt!425305)))

(declare-fun b!942213 () Bool)

(declare-fun c!98326 () Bool)

(declare-fun lt!425303 () (_ BitVec 64))

(assert (=> b!942213 (= c!98326 (= lt!425303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529769 () SeekEntryResult!8974)

(declare-fun e!529771 () SeekEntryResult!8974)

(assert (=> b!942213 (= e!529769 e!529771)))

(declare-fun b!942214 () Bool)

(assert (=> b!942214 (= e!529769 (Found!8974 (index!38269 lt!425306)))))

(declare-fun b!942215 () Bool)

(assert (=> b!942215 (= e!529770 e!529769)))

(assert (=> b!942215 (= lt!425303 (select (arr!27344 (_keys!10470 thiss!1141)) (index!38269 lt!425306)))))

(declare-fun c!98325 () Bool)

(assert (=> b!942215 (= c!98325 (= lt!425303 key!756))))

(declare-fun b!942216 () Bool)

(declare-fun lt!425304 () SeekEntryResult!8974)

(assert (=> b!942216 (= e!529771 (ite ((_ is MissingVacant!8974) lt!425304) (MissingZero!8974 (index!38270 lt!425304)) lt!425304))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56829 (_ BitVec 32)) SeekEntryResult!8974)

(assert (=> b!942216 (= lt!425304 (seekKeyOrZeroReturnVacant!0 (x!80729 lt!425306) (index!38269 lt!425306) (index!38269 lt!425306) key!756 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)))))

(declare-fun b!942217 () Bool)

(assert (=> b!942217 (= e!529771 (MissingZero!8974 (index!38269 lt!425306)))))

(declare-fun b!942218 () Bool)

(assert (=> b!942218 (= e!529770 Undefined!8974)))

(assert (= (and d!114369 c!98324) b!942218))

(assert (= (and d!114369 (not c!98324)) b!942215))

(assert (= (and b!942215 c!98325) b!942214))

(assert (= (and b!942215 (not c!98325)) b!942213))

(assert (= (and b!942213 c!98326) b!942217))

(assert (= (and b!942213 (not c!98326)) b!942216))

(declare-fun m!877773 () Bool)

(assert (=> d!114369 m!877773))

(declare-fun m!877775 () Bool)

(assert (=> d!114369 m!877775))

(assert (=> d!114369 m!877775))

(declare-fun m!877777 () Bool)

(assert (=> d!114369 m!877777))

(assert (=> d!114369 m!877729))

(declare-fun m!877779 () Bool)

(assert (=> b!942215 m!877779))

(declare-fun m!877781 () Bool)

(assert (=> b!942216 m!877781))

(assert (=> b!942143 d!114369))

(declare-fun d!114371 () Bool)

(assert (=> d!114371 (= (array_inv!21340 (_keys!10470 thiss!1141)) (bvsge (size!27806 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942141 d!114371))

(declare-fun d!114373 () Bool)

(assert (=> d!114373 (= (array_inv!21341 (_values!5614 thiss!1141)) (bvsge (size!27805 (_values!5614 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942141 d!114373))

(declare-fun b!942226 () Bool)

(declare-fun e!529777 () Bool)

(assert (=> b!942226 (= e!529777 tp_is_empty!20413)))

(declare-fun mapIsEmpty!32422 () Bool)

(declare-fun mapRes!32422 () Bool)

(assert (=> mapIsEmpty!32422 mapRes!32422))

(declare-fun mapNonEmpty!32422 () Bool)

(declare-fun tp!62209 () Bool)

(declare-fun e!529776 () Bool)

(assert (=> mapNonEmpty!32422 (= mapRes!32422 (and tp!62209 e!529776))))

(declare-fun mapValue!32422 () ValueCell!9725)

(declare-fun mapRest!32422 () (Array (_ BitVec 32) ValueCell!9725))

(declare-fun mapKey!32422 () (_ BitVec 32))

(assert (=> mapNonEmpty!32422 (= mapRest!32413 (store mapRest!32422 mapKey!32422 mapValue!32422))))

(declare-fun condMapEmpty!32422 () Bool)

(declare-fun mapDefault!32422 () ValueCell!9725)

(assert (=> mapNonEmpty!32413 (= condMapEmpty!32422 (= mapRest!32413 ((as const (Array (_ BitVec 32) ValueCell!9725)) mapDefault!32422)))))

(assert (=> mapNonEmpty!32413 (= tp!62194 (and e!529777 mapRes!32422))))

(declare-fun b!942225 () Bool)

(assert (=> b!942225 (= e!529776 tp_is_empty!20413)))

(assert (= (and mapNonEmpty!32413 condMapEmpty!32422) mapIsEmpty!32422))

(assert (= (and mapNonEmpty!32413 (not condMapEmpty!32422)) mapNonEmpty!32422))

(assert (= (and mapNonEmpty!32422 ((_ is ValueCellFull!9725) mapValue!32422)) b!942225))

(assert (= (and mapNonEmpty!32413 ((_ is ValueCellFull!9725) mapDefault!32422)) b!942226))

(declare-fun m!877783 () Bool)

(assert (=> mapNonEmpty!32422 m!877783))

(check-sat (not b!942198) (not d!114369) (not d!114367) (not b!942200) tp_is_empty!20413 (not b!942199) (not b!942216) (not mapNonEmpty!32422) b_and!29327 (not b_next!17905))
(check-sat b_and!29327 (not b_next!17905))
(get-model)

(declare-fun b!942236 () Bool)

(declare-fun res!633183 () Bool)

(declare-fun e!529780 () Bool)

(assert (=> b!942236 (=> (not res!633183) (not e!529780))))

(declare-fun size!27811 (LongMapFixedSize!4600) (_ BitVec 32))

(assert (=> b!942236 (= res!633183 (bvsge (size!27811 thiss!1141) (_size!2355 thiss!1141)))))

(declare-fun b!942237 () Bool)

(declare-fun res!633180 () Bool)

(assert (=> b!942237 (=> (not res!633180) (not e!529780))))

(assert (=> b!942237 (= res!633180 (= (size!27811 thiss!1141) (bvadd (_size!2355 thiss!1141) (bvsdiv (bvadd (extraKeys!5323 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!114375 () Bool)

(declare-fun res!633182 () Bool)

(assert (=> d!114375 (=> (not res!633182) (not e!529780))))

(assert (=> d!114375 (= res!633182 (validMask!0 (mask!27195 thiss!1141)))))

(assert (=> d!114375 (= (simpleValid!340 thiss!1141) e!529780)))

(declare-fun b!942235 () Bool)

(declare-fun res!633181 () Bool)

(assert (=> b!942235 (=> (not res!633181) (not e!529780))))

(assert (=> b!942235 (= res!633181 (and (= (size!27805 (_values!5614 thiss!1141)) (bvadd (mask!27195 thiss!1141) #b00000000000000000000000000000001)) (= (size!27806 (_keys!10470 thiss!1141)) (size!27805 (_values!5614 thiss!1141))) (bvsge (_size!2355 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2355 thiss!1141) (bvadd (mask!27195 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!942238 () Bool)

(assert (=> b!942238 (= e!529780 (and (bvsge (extraKeys!5323 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5323 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2355 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114375 res!633182) b!942235))

(assert (= (and b!942235 res!633181) b!942236))

(assert (= (and b!942236 res!633183) b!942237))

(assert (= (and b!942237 res!633180) b!942238))

(declare-fun m!877785 () Bool)

(assert (=> b!942236 m!877785))

(assert (=> b!942237 m!877785))

(assert (=> d!114375 m!877729))

(assert (=> d!114367 d!114375))

(declare-fun b!942257 () Bool)

(declare-fun lt!425311 () SeekEntryResult!8974)

(assert (=> b!942257 (and (bvsge (index!38269 lt!425311) #b00000000000000000000000000000000) (bvslt (index!38269 lt!425311) (size!27806 (_keys!10470 thiss!1141))))))

(declare-fun e!529793 () Bool)

(assert (=> b!942257 (= e!529793 (= (select (arr!27344 (_keys!10470 thiss!1141)) (index!38269 lt!425311)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!942258 () Bool)

(declare-fun e!529794 () SeekEntryResult!8974)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942258 (= e!529794 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27195 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27195 thiss!1141)) key!756 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)))))

(declare-fun b!942259 () Bool)

(declare-fun e!529795 () Bool)

(declare-fun e!529791 () Bool)

(assert (=> b!942259 (= e!529795 e!529791)))

(declare-fun res!633192 () Bool)

(assert (=> b!942259 (= res!633192 (and ((_ is Intermediate!8974) lt!425311) (not (undefined!9786 lt!425311)) (bvslt (x!80729 lt!425311) #b01111111111111111111111111111110) (bvsge (x!80729 lt!425311) #b00000000000000000000000000000000) (bvsge (x!80729 lt!425311) #b00000000000000000000000000000000)))))

(assert (=> b!942259 (=> (not res!633192) (not e!529791))))

(declare-fun d!114377 () Bool)

(assert (=> d!114377 e!529795))

(declare-fun c!98335 () Bool)

(assert (=> d!114377 (= c!98335 (and ((_ is Intermediate!8974) lt!425311) (undefined!9786 lt!425311)))))

(declare-fun e!529792 () SeekEntryResult!8974)

(assert (=> d!114377 (= lt!425311 e!529792)))

(declare-fun c!98333 () Bool)

(assert (=> d!114377 (= c!98333 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!425312 () (_ BitVec 64))

(assert (=> d!114377 (= lt!425312 (select (arr!27344 (_keys!10470 thiss!1141)) (toIndex!0 key!756 (mask!27195 thiss!1141))))))

(assert (=> d!114377 (validMask!0 (mask!27195 thiss!1141))))

(assert (=> d!114377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27195 thiss!1141)) key!756 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)) lt!425311)))

(declare-fun b!942260 () Bool)

(assert (=> b!942260 (= e!529795 (bvsge (x!80729 lt!425311) #b01111111111111111111111111111110))))

(declare-fun b!942261 () Bool)

(assert (=> b!942261 (= e!529794 (Intermediate!8974 false (toIndex!0 key!756 (mask!27195 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!942262 () Bool)

(assert (=> b!942262 (= e!529792 e!529794)))

(declare-fun c!98334 () Bool)

(assert (=> b!942262 (= c!98334 (or (= lt!425312 key!756) (= (bvadd lt!425312 lt!425312) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!942263 () Bool)

(assert (=> b!942263 (and (bvsge (index!38269 lt!425311) #b00000000000000000000000000000000) (bvslt (index!38269 lt!425311) (size!27806 (_keys!10470 thiss!1141))))))

(declare-fun res!633190 () Bool)

(assert (=> b!942263 (= res!633190 (= (select (arr!27344 (_keys!10470 thiss!1141)) (index!38269 lt!425311)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942263 (=> res!633190 e!529793)))

(declare-fun b!942264 () Bool)

(assert (=> b!942264 (= e!529792 (Intermediate!8974 true (toIndex!0 key!756 (mask!27195 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!942265 () Bool)

(assert (=> b!942265 (and (bvsge (index!38269 lt!425311) #b00000000000000000000000000000000) (bvslt (index!38269 lt!425311) (size!27806 (_keys!10470 thiss!1141))))))

(declare-fun res!633191 () Bool)

(assert (=> b!942265 (= res!633191 (= (select (arr!27344 (_keys!10470 thiss!1141)) (index!38269 lt!425311)) key!756))))

(assert (=> b!942265 (=> res!633191 e!529793)))

(assert (=> b!942265 (= e!529791 e!529793)))

(assert (= (and d!114377 c!98333) b!942264))

(assert (= (and d!114377 (not c!98333)) b!942262))

(assert (= (and b!942262 c!98334) b!942261))

(assert (= (and b!942262 (not c!98334)) b!942258))

(assert (= (and d!114377 c!98335) b!942260))

(assert (= (and d!114377 (not c!98335)) b!942259))

(assert (= (and b!942259 res!633192) b!942265))

(assert (= (and b!942265 (not res!633191)) b!942263))

(assert (= (and b!942263 (not res!633190)) b!942257))

(declare-fun m!877787 () Bool)

(assert (=> b!942263 m!877787))

(assert (=> d!114377 m!877775))

(declare-fun m!877789 () Bool)

(assert (=> d!114377 m!877789))

(assert (=> d!114377 m!877729))

(assert (=> b!942258 m!877775))

(declare-fun m!877791 () Bool)

(assert (=> b!942258 m!877791))

(assert (=> b!942258 m!877791))

(declare-fun m!877793 () Bool)

(assert (=> b!942258 m!877793))

(assert (=> b!942257 m!877787))

(assert (=> b!942265 m!877787))

(assert (=> d!114369 d!114377))

(declare-fun d!114379 () Bool)

(declare-fun lt!425318 () (_ BitVec 32))

(declare-fun lt!425317 () (_ BitVec 32))

(assert (=> d!114379 (= lt!425318 (bvmul (bvxor lt!425317 (bvlshr lt!425317 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114379 (= lt!425317 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114379 (and (bvsge (mask!27195 thiss!1141) #b00000000000000000000000000000000) (let ((res!633193 (let ((h!20340 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80746 (bvmul (bvxor h!20340 (bvlshr h!20340 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80746 (bvlshr x!80746 #b00000000000000000000000000001101)) (mask!27195 thiss!1141)))))) (and (bvslt res!633193 (bvadd (mask!27195 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!633193 #b00000000000000000000000000000000))))))

(assert (=> d!114379 (= (toIndex!0 key!756 (mask!27195 thiss!1141)) (bvand (bvxor lt!425318 (bvlshr lt!425318 #b00000000000000000000000000001101)) (mask!27195 thiss!1141)))))

(assert (=> d!114369 d!114379))

(assert (=> d!114369 d!114365))

(declare-fun b!942276 () Bool)

(declare-fun e!529807 () Bool)

(declare-fun contains!5135 (List!19191 (_ BitVec 64)) Bool)

(assert (=> b!942276 (= e!529807 (contains!5135 Nil!19188 (select (arr!27344 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942277 () Bool)

(declare-fun e!529805 () Bool)

(declare-fun e!529804 () Bool)

(assert (=> b!942277 (= e!529805 e!529804)))

(declare-fun res!633201 () Bool)

(assert (=> b!942277 (=> (not res!633201) (not e!529804))))

(assert (=> b!942277 (= res!633201 (not e!529807))))

(declare-fun res!633200 () Bool)

(assert (=> b!942277 (=> (not res!633200) (not e!529807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942277 (= res!633200 (validKeyInArray!0 (select (arr!27344 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114381 () Bool)

(declare-fun res!633202 () Bool)

(assert (=> d!114381 (=> res!633202 e!529805)))

(assert (=> d!114381 (= res!633202 (bvsge #b00000000000000000000000000000000 (size!27806 (_keys!10470 thiss!1141))))))

(assert (=> d!114381 (= (arrayNoDuplicates!0 (_keys!10470 thiss!1141) #b00000000000000000000000000000000 Nil!19188) e!529805)))

(declare-fun b!942278 () Bool)

(declare-fun e!529806 () Bool)

(declare-fun call!40962 () Bool)

(assert (=> b!942278 (= e!529806 call!40962)))

(declare-fun b!942279 () Bool)

(assert (=> b!942279 (= e!529804 e!529806)))

(declare-fun c!98338 () Bool)

(assert (=> b!942279 (= c!98338 (validKeyInArray!0 (select (arr!27344 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40959 () Bool)

(assert (=> bm!40959 (= call!40962 (arrayNoDuplicates!0 (_keys!10470 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98338 (Cons!19187 (select (arr!27344 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000) Nil!19188) Nil!19188)))))

(declare-fun b!942280 () Bool)

(assert (=> b!942280 (= e!529806 call!40962)))

(assert (= (and d!114381 (not res!633202)) b!942277))

(assert (= (and b!942277 res!633200) b!942276))

(assert (= (and b!942277 res!633201) b!942279))

(assert (= (and b!942279 c!98338) b!942280))

(assert (= (and b!942279 (not c!98338)) b!942278))

(assert (= (or b!942280 b!942278) bm!40959))

(declare-fun m!877795 () Bool)

(assert (=> b!942276 m!877795))

(assert (=> b!942276 m!877795))

(declare-fun m!877797 () Bool)

(assert (=> b!942276 m!877797))

(assert (=> b!942277 m!877795))

(assert (=> b!942277 m!877795))

(declare-fun m!877799 () Bool)

(assert (=> b!942277 m!877799))

(assert (=> b!942279 m!877795))

(assert (=> b!942279 m!877795))

(assert (=> b!942279 m!877799))

(assert (=> bm!40959 m!877795))

(declare-fun m!877801 () Bool)

(assert (=> bm!40959 m!877801))

(assert (=> b!942200 d!114381))

(declare-fun d!114383 () Bool)

(declare-fun lt!425323 () SeekEntryResult!8974)

(assert (=> d!114383 (and (or ((_ is Undefined!8974) lt!425323) (not ((_ is Found!8974) lt!425323)) (and (bvsge (index!38268 lt!425323) #b00000000000000000000000000000000) (bvslt (index!38268 lt!425323) (size!27806 (_keys!10470 thiss!1141))))) (or ((_ is Undefined!8974) lt!425323) ((_ is Found!8974) lt!425323) (not ((_ is MissingVacant!8974) lt!425323)) (not (= (index!38270 lt!425323) (index!38269 lt!425306))) (and (bvsge (index!38270 lt!425323) #b00000000000000000000000000000000) (bvslt (index!38270 lt!425323) (size!27806 (_keys!10470 thiss!1141))))) (or ((_ is Undefined!8974) lt!425323) (ite ((_ is Found!8974) lt!425323) (= (select (arr!27344 (_keys!10470 thiss!1141)) (index!38268 lt!425323)) key!756) (and ((_ is MissingVacant!8974) lt!425323) (= (index!38270 lt!425323) (index!38269 lt!425306)) (= (select (arr!27344 (_keys!10470 thiss!1141)) (index!38270 lt!425323)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!529815 () SeekEntryResult!8974)

(assert (=> d!114383 (= lt!425323 e!529815)))

(declare-fun c!98347 () Bool)

(assert (=> d!114383 (= c!98347 (bvsge (x!80729 lt!425306) #b01111111111111111111111111111110))))

(declare-fun lt!425324 () (_ BitVec 64))

(assert (=> d!114383 (= lt!425324 (select (arr!27344 (_keys!10470 thiss!1141)) (index!38269 lt!425306)))))

(assert (=> d!114383 (validMask!0 (mask!27195 thiss!1141))))

(assert (=> d!114383 (= (seekKeyOrZeroReturnVacant!0 (x!80729 lt!425306) (index!38269 lt!425306) (index!38269 lt!425306) key!756 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)) lt!425323)))

(declare-fun b!942293 () Bool)

(declare-fun e!529814 () SeekEntryResult!8974)

(assert (=> b!942293 (= e!529814 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80729 lt!425306) #b00000000000000000000000000000001) (nextIndex!0 (index!38269 lt!425306) (bvadd (x!80729 lt!425306) #b00000000000000000000000000000001) (mask!27195 thiss!1141)) (index!38269 lt!425306) key!756 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)))))

(declare-fun b!942294 () Bool)

(assert (=> b!942294 (= e!529815 Undefined!8974)))

(declare-fun b!942295 () Bool)

(assert (=> b!942295 (= e!529814 (MissingVacant!8974 (index!38269 lt!425306)))))

(declare-fun b!942296 () Bool)

(declare-fun c!98345 () Bool)

(assert (=> b!942296 (= c!98345 (= lt!425324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529816 () SeekEntryResult!8974)

(assert (=> b!942296 (= e!529816 e!529814)))

(declare-fun b!942297 () Bool)

(assert (=> b!942297 (= e!529816 (Found!8974 (index!38269 lt!425306)))))

(declare-fun b!942298 () Bool)

(assert (=> b!942298 (= e!529815 e!529816)))

(declare-fun c!98346 () Bool)

(assert (=> b!942298 (= c!98346 (= lt!425324 key!756))))

(assert (= (and d!114383 c!98347) b!942294))

(assert (= (and d!114383 (not c!98347)) b!942298))

(assert (= (and b!942298 c!98346) b!942297))

(assert (= (and b!942298 (not c!98346)) b!942296))

(assert (= (and b!942296 c!98345) b!942295))

(assert (= (and b!942296 (not c!98345)) b!942293))

(declare-fun m!877803 () Bool)

(assert (=> d!114383 m!877803))

(declare-fun m!877805 () Bool)

(assert (=> d!114383 m!877805))

(assert (=> d!114383 m!877779))

(assert (=> d!114383 m!877729))

(declare-fun m!877807 () Bool)

(assert (=> b!942293 m!877807))

(assert (=> b!942293 m!877807))

(declare-fun m!877809 () Bool)

(assert (=> b!942293 m!877809))

(assert (=> b!942216 d!114383))

(declare-fun b!942307 () Bool)

(declare-fun e!529822 () (_ BitVec 32))

(declare-fun call!40965 () (_ BitVec 32))

(assert (=> b!942307 (= e!529822 (bvadd #b00000000000000000000000000000001 call!40965))))

(declare-fun b!942308 () Bool)

(assert (=> b!942308 (= e!529822 call!40965)))

(declare-fun bm!40962 () Bool)

(assert (=> bm!40962 (= call!40965 (arrayCountValidKeys!0 (_keys!10470 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27806 (_keys!10470 thiss!1141))))))

(declare-fun b!942309 () Bool)

(declare-fun e!529821 () (_ BitVec 32))

(assert (=> b!942309 (= e!529821 #b00000000000000000000000000000000)))

(declare-fun d!114385 () Bool)

(declare-fun lt!425327 () (_ BitVec 32))

(assert (=> d!114385 (and (bvsge lt!425327 #b00000000000000000000000000000000) (bvsle lt!425327 (bvsub (size!27806 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114385 (= lt!425327 e!529821)))

(declare-fun c!98353 () Bool)

(assert (=> d!114385 (= c!98353 (bvsge #b00000000000000000000000000000000 (size!27806 (_keys!10470 thiss!1141))))))

(assert (=> d!114385 (and (bvsle #b00000000000000000000000000000000 (size!27806 (_keys!10470 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27806 (_keys!10470 thiss!1141)) (size!27806 (_keys!10470 thiss!1141))))))

(assert (=> d!114385 (= (arrayCountValidKeys!0 (_keys!10470 thiss!1141) #b00000000000000000000000000000000 (size!27806 (_keys!10470 thiss!1141))) lt!425327)))

(declare-fun b!942310 () Bool)

(assert (=> b!942310 (= e!529821 e!529822)))

(declare-fun c!98352 () Bool)

(assert (=> b!942310 (= c!98352 (validKeyInArray!0 (select (arr!27344 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114385 c!98353) b!942309))

(assert (= (and d!114385 (not c!98353)) b!942310))

(assert (= (and b!942310 c!98352) b!942307))

(assert (= (and b!942310 (not c!98352)) b!942308))

(assert (= (or b!942307 b!942308) bm!40962))

(declare-fun m!877811 () Bool)

(assert (=> bm!40962 m!877811))

(assert (=> b!942310 m!877795))

(assert (=> b!942310 m!877795))

(assert (=> b!942310 m!877799))

(assert (=> b!942198 d!114385))

(declare-fun b!942319 () Bool)

(declare-fun e!529830 () Bool)

(declare-fun call!40968 () Bool)

(assert (=> b!942319 (= e!529830 call!40968)))

(declare-fun b!942320 () Bool)

(declare-fun e!529829 () Bool)

(assert (=> b!942320 (= e!529829 call!40968)))

(declare-fun bm!40965 () Bool)

(assert (=> bm!40965 (= call!40968 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10470 thiss!1141) (mask!27195 thiss!1141)))))

(declare-fun d!114387 () Bool)

(declare-fun res!633207 () Bool)

(declare-fun e!529831 () Bool)

(assert (=> d!114387 (=> res!633207 e!529831)))

(assert (=> d!114387 (= res!633207 (bvsge #b00000000000000000000000000000000 (size!27806 (_keys!10470 thiss!1141))))))

(assert (=> d!114387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10470 thiss!1141) (mask!27195 thiss!1141)) e!529831)))

(declare-fun b!942321 () Bool)

(assert (=> b!942321 (= e!529830 e!529829)))

(declare-fun lt!425334 () (_ BitVec 64))

(assert (=> b!942321 (= lt!425334 (select (arr!27344 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31774 0))(
  ( (Unit!31775) )
))
(declare-fun lt!425336 () Unit!31774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56829 (_ BitVec 64) (_ BitVec 32)) Unit!31774)

(assert (=> b!942321 (= lt!425336 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10470 thiss!1141) lt!425334 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942321 (arrayContainsKey!0 (_keys!10470 thiss!1141) lt!425334 #b00000000000000000000000000000000)))

(declare-fun lt!425335 () Unit!31774)

(assert (=> b!942321 (= lt!425335 lt!425336)))

(declare-fun res!633208 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56829 (_ BitVec 32)) SeekEntryResult!8974)

(assert (=> b!942321 (= res!633208 (= (seekEntryOrOpen!0 (select (arr!27344 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000) (_keys!10470 thiss!1141) (mask!27195 thiss!1141)) (Found!8974 #b00000000000000000000000000000000)))))

(assert (=> b!942321 (=> (not res!633208) (not e!529829))))

(declare-fun b!942322 () Bool)

(assert (=> b!942322 (= e!529831 e!529830)))

(declare-fun c!98356 () Bool)

(assert (=> b!942322 (= c!98356 (validKeyInArray!0 (select (arr!27344 (_keys!10470 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114387 (not res!633207)) b!942322))

(assert (= (and b!942322 c!98356) b!942321))

(assert (= (and b!942322 (not c!98356)) b!942319))

(assert (= (and b!942321 res!633208) b!942320))

(assert (= (or b!942320 b!942319) bm!40965))

(declare-fun m!877813 () Bool)

(assert (=> bm!40965 m!877813))

(assert (=> b!942321 m!877795))

(declare-fun m!877815 () Bool)

(assert (=> b!942321 m!877815))

(declare-fun m!877817 () Bool)

(assert (=> b!942321 m!877817))

(assert (=> b!942321 m!877795))

(declare-fun m!877819 () Bool)

(assert (=> b!942321 m!877819))

(assert (=> b!942322 m!877795))

(assert (=> b!942322 m!877795))

(assert (=> b!942322 m!877799))

(assert (=> b!942199 d!114387))

(declare-fun b!942324 () Bool)

(declare-fun e!529833 () Bool)

(assert (=> b!942324 (= e!529833 tp_is_empty!20413)))

(declare-fun mapIsEmpty!32423 () Bool)

(declare-fun mapRes!32423 () Bool)

(assert (=> mapIsEmpty!32423 mapRes!32423))

(declare-fun mapNonEmpty!32423 () Bool)

(declare-fun tp!62210 () Bool)

(declare-fun e!529832 () Bool)

(assert (=> mapNonEmpty!32423 (= mapRes!32423 (and tp!62210 e!529832))))

(declare-fun mapKey!32423 () (_ BitVec 32))

(declare-fun mapRest!32423 () (Array (_ BitVec 32) ValueCell!9725))

(declare-fun mapValue!32423 () ValueCell!9725)

(assert (=> mapNonEmpty!32423 (= mapRest!32422 (store mapRest!32423 mapKey!32423 mapValue!32423))))

(declare-fun condMapEmpty!32423 () Bool)

(declare-fun mapDefault!32423 () ValueCell!9725)

(assert (=> mapNonEmpty!32422 (= condMapEmpty!32423 (= mapRest!32422 ((as const (Array (_ BitVec 32) ValueCell!9725)) mapDefault!32423)))))

(assert (=> mapNonEmpty!32422 (= tp!62209 (and e!529833 mapRes!32423))))

(declare-fun b!942323 () Bool)

(assert (=> b!942323 (= e!529832 tp_is_empty!20413)))

(assert (= (and mapNonEmpty!32422 condMapEmpty!32423) mapIsEmpty!32423))

(assert (= (and mapNonEmpty!32422 (not condMapEmpty!32423)) mapNonEmpty!32423))

(assert (= (and mapNonEmpty!32423 ((_ is ValueCellFull!9725) mapValue!32423)) b!942323))

(assert (= (and mapNonEmpty!32422 ((_ is ValueCellFull!9725) mapDefault!32423)) b!942324))

(declare-fun m!877821 () Bool)

(assert (=> mapNonEmpty!32423 m!877821))

(check-sat (not d!114377) (not b!942258) (not mapNonEmpty!32423) (not b!942277) tp_is_empty!20413 (not d!114375) (not bm!40965) (not bm!40959) (not b!942321) (not b!942322) (not d!114383) (not b!942276) b_and!29327 (not b_next!17905) (not b!942310) (not b!942293) (not b!942237) (not b!942279) (not bm!40962) (not b!942236))
(check-sat b_and!29327 (not b_next!17905))
