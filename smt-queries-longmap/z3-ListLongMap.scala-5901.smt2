; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76276 () Bool)

(assert start!76276)

(declare-fun b!895230 () Bool)

(declare-fun b_free!15907 () Bool)

(declare-fun b_next!15907 () Bool)

(assert (=> b!895230 (= b_free!15907 (not b_next!15907))))

(declare-fun tp!55732 () Bool)

(declare-fun b_and!26173 () Bool)

(assert (=> b!895230 (= tp!55732 b_and!26173)))

(declare-fun mapNonEmpty!28948 () Bool)

(declare-fun mapRes!28948 () Bool)

(declare-fun tp!55731 () Bool)

(declare-fun e!500182 () Bool)

(assert (=> mapNonEmpty!28948 (= mapRes!28948 (and tp!55731 e!500182))))

(declare-datatypes ((array!52455 0))(
  ( (array!52456 (arr!25223 (Array (_ BitVec 32) (_ BitVec 64))) (size!25675 (_ BitVec 32))) )
))
(declare-datatypes ((V!29279 0))(
  ( (V!29280 (val!9168 Int)) )
))
(declare-datatypes ((ValueCell!8636 0))(
  ( (ValueCellFull!8636 (v!11655 V!29279)) (EmptyCell!8636) )
))
(declare-datatypes ((array!52457 0))(
  ( (array!52458 (arr!25224 (Array (_ BitVec 32) ValueCell!8636)) (size!25676 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4288 0))(
  ( (LongMapFixedSize!4289 (defaultEntry!5356 Int) (mask!25948 (_ BitVec 32)) (extraKeys!5052 (_ BitVec 32)) (zeroValue!5156 V!29279) (minValue!5156 V!29279) (_size!2199 (_ BitVec 32)) (_keys!10066 array!52455) (_values!5343 array!52457) (_vacant!2199 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4288)

(declare-fun mapValue!28948 () ValueCell!8636)

(declare-fun mapRest!28948 () (Array (_ BitVec 32) ValueCell!8636))

(declare-fun mapKey!28948 () (_ BitVec 32))

(assert (=> mapNonEmpty!28948 (= (arr!25224 (_values!5343 thiss!1181)) (store mapRest!28948 mapKey!28948 mapValue!28948))))

(declare-fun b!895228 () Bool)

(declare-fun res!605610 () Bool)

(declare-fun e!500178 () Bool)

(assert (=> b!895228 (=> (not res!605610) (not e!500178))))

(assert (=> b!895228 (= res!605610 (and (= (size!25676 (_values!5343 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25948 thiss!1181))) (= (size!25675 (_keys!10066 thiss!1181)) (size!25676 (_values!5343 thiss!1181))) (bvsge (mask!25948 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5052 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5052 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!500179 () Bool)

(declare-fun e!500177 () Bool)

(declare-fun tp_is_empty!18235 () Bool)

(declare-fun array_inv!19852 (array!52455) Bool)

(declare-fun array_inv!19853 (array!52457) Bool)

(assert (=> b!895230 (= e!500177 (and tp!55732 tp_is_empty!18235 (array_inv!19852 (_keys!10066 thiss!1181)) (array_inv!19853 (_values!5343 thiss!1181)) e!500179))))

(declare-fun b!895231 () Bool)

(declare-fun e!500181 () Bool)

(assert (=> b!895231 (= e!500179 (and e!500181 mapRes!28948))))

(declare-fun condMapEmpty!28948 () Bool)

(declare-fun mapDefault!28948 () ValueCell!8636)

(assert (=> b!895231 (= condMapEmpty!28948 (= (arr!25224 (_values!5343 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8636)) mapDefault!28948)))))

(declare-fun b!895232 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52455 (_ BitVec 32)) Bool)

(assert (=> b!895232 (= e!500178 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10066 thiss!1181) (mask!25948 thiss!1181))))))

(declare-fun b!895233 () Bool)

(declare-fun res!605613 () Bool)

(declare-fun e!500180 () Bool)

(assert (=> b!895233 (=> (not res!605613) (not e!500180))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895233 (= res!605613 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28948 () Bool)

(assert (=> mapIsEmpty!28948 mapRes!28948))

(declare-fun b!895234 () Bool)

(assert (=> b!895234 (= e!500181 tp_is_empty!18235)))

(declare-fun b!895235 () Bool)

(assert (=> b!895235 (= e!500180 e!500178)))

(declare-fun res!605612 () Bool)

(assert (=> b!895235 (=> (not res!605612) (not e!500178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895235 (= res!605612 (validMask!0 (mask!25948 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8883 0))(
  ( (MissingZero!8883 (index!37903 (_ BitVec 32))) (Found!8883 (index!37904 (_ BitVec 32))) (Intermediate!8883 (undefined!9695 Bool) (index!37905 (_ BitVec 32)) (x!76190 (_ BitVec 32))) (Undefined!8883) (MissingVacant!8883 (index!37906 (_ BitVec 32))) )
))
(declare-fun lt!404297 () SeekEntryResult!8883)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52455 (_ BitVec 32)) SeekEntryResult!8883)

(assert (=> b!895235 (= lt!404297 (seekEntry!0 key!785 (_keys!10066 thiss!1181) (mask!25948 thiss!1181)))))

(declare-fun res!605611 () Bool)

(assert (=> start!76276 (=> (not res!605611) (not e!500180))))

(declare-fun valid!1662 (LongMapFixedSize!4288) Bool)

(assert (=> start!76276 (= res!605611 (valid!1662 thiss!1181))))

(assert (=> start!76276 e!500180))

(assert (=> start!76276 e!500177))

(assert (=> start!76276 true))

(declare-fun b!895229 () Bool)

(assert (=> b!895229 (= e!500182 tp_is_empty!18235)))

(assert (= (and start!76276 res!605611) b!895233))

(assert (= (and b!895233 res!605613) b!895235))

(assert (= (and b!895235 res!605612) b!895228))

(assert (= (and b!895228 res!605610) b!895232))

(assert (= (and b!895231 condMapEmpty!28948) mapIsEmpty!28948))

(assert (= (and b!895231 (not condMapEmpty!28948)) mapNonEmpty!28948))

(get-info :version)

(assert (= (and mapNonEmpty!28948 ((_ is ValueCellFull!8636) mapValue!28948)) b!895229))

(assert (= (and b!895231 ((_ is ValueCellFull!8636) mapDefault!28948)) b!895234))

(assert (= b!895230 b!895231))

(assert (= start!76276 b!895230))

(declare-fun m!832271 () Bool)

(assert (=> mapNonEmpty!28948 m!832271))

(declare-fun m!832273 () Bool)

(assert (=> b!895230 m!832273))

(declare-fun m!832275 () Bool)

(assert (=> b!895230 m!832275))

(declare-fun m!832277 () Bool)

(assert (=> b!895232 m!832277))

(declare-fun m!832279 () Bool)

(assert (=> b!895235 m!832279))

(declare-fun m!832281 () Bool)

(assert (=> b!895235 m!832281))

(declare-fun m!832283 () Bool)

(assert (=> start!76276 m!832283))

(check-sat (not b!895235) (not start!76276) (not b!895232) tp_is_empty!18235 (not mapNonEmpty!28948) (not b!895230) b_and!26173 (not b_next!15907))
(check-sat b_and!26173 (not b_next!15907))
(get-model)

(declare-fun d!110585 () Bool)

(assert (=> d!110585 (= (array_inv!19852 (_keys!10066 thiss!1181)) (bvsge (size!25675 (_keys!10066 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895230 d!110585))

(declare-fun d!110587 () Bool)

(assert (=> d!110587 (= (array_inv!19853 (_values!5343 thiss!1181)) (bvsge (size!25676 (_values!5343 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895230 d!110587))

(declare-fun d!110589 () Bool)

(declare-fun res!605644 () Bool)

(declare-fun e!500227 () Bool)

(assert (=> d!110589 (=> (not res!605644) (not e!500227))))

(declare-fun simpleValid!306 (LongMapFixedSize!4288) Bool)

(assert (=> d!110589 (= res!605644 (simpleValid!306 thiss!1181))))

(assert (=> d!110589 (= (valid!1662 thiss!1181) e!500227)))

(declare-fun b!895290 () Bool)

(declare-fun res!605645 () Bool)

(assert (=> b!895290 (=> (not res!605645) (not e!500227))))

(declare-fun arrayCountValidKeys!0 (array!52455 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895290 (= res!605645 (= (arrayCountValidKeys!0 (_keys!10066 thiss!1181) #b00000000000000000000000000000000 (size!25675 (_keys!10066 thiss!1181))) (_size!2199 thiss!1181)))))

(declare-fun b!895291 () Bool)

(declare-fun res!605646 () Bool)

(assert (=> b!895291 (=> (not res!605646) (not e!500227))))

(assert (=> b!895291 (= res!605646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10066 thiss!1181) (mask!25948 thiss!1181)))))

(declare-fun b!895292 () Bool)

(declare-datatypes ((List!17821 0))(
  ( (Nil!17818) (Cons!17817 (h!18954 (_ BitVec 64)) (t!25151 List!17821)) )
))
(declare-fun arrayNoDuplicates!0 (array!52455 (_ BitVec 32) List!17821) Bool)

(assert (=> b!895292 (= e!500227 (arrayNoDuplicates!0 (_keys!10066 thiss!1181) #b00000000000000000000000000000000 Nil!17818))))

(assert (= (and d!110589 res!605644) b!895290))

(assert (= (and b!895290 res!605645) b!895291))

(assert (= (and b!895291 res!605646) b!895292))

(declare-fun m!832313 () Bool)

(assert (=> d!110589 m!832313))

(declare-fun m!832315 () Bool)

(assert (=> b!895290 m!832315))

(assert (=> b!895291 m!832277))

(declare-fun m!832317 () Bool)

(assert (=> b!895292 m!832317))

(assert (=> start!76276 d!110589))

(declare-fun d!110591 () Bool)

(declare-fun res!605652 () Bool)

(declare-fun e!500234 () Bool)

(assert (=> d!110591 (=> res!605652 e!500234)))

(assert (=> d!110591 (= res!605652 (bvsge #b00000000000000000000000000000000 (size!25675 (_keys!10066 thiss!1181))))))

(assert (=> d!110591 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10066 thiss!1181) (mask!25948 thiss!1181)) e!500234)))

(declare-fun b!895301 () Bool)

(declare-fun e!500236 () Bool)

(assert (=> b!895301 (= e!500234 e!500236)))

(declare-fun c!94512 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895301 (= c!94512 (validKeyInArray!0 (select (arr!25223 (_keys!10066 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895302 () Bool)

(declare-fun e!500235 () Bool)

(declare-fun call!39731 () Bool)

(assert (=> b!895302 (= e!500235 call!39731)))

(declare-fun b!895303 () Bool)

(assert (=> b!895303 (= e!500236 e!500235)))

(declare-fun lt!404312 () (_ BitVec 64))

(assert (=> b!895303 (= lt!404312 (select (arr!25223 (_keys!10066 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30406 0))(
  ( (Unit!30407) )
))
(declare-fun lt!404311 () Unit!30406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52455 (_ BitVec 64) (_ BitVec 32)) Unit!30406)

(assert (=> b!895303 (= lt!404311 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10066 thiss!1181) lt!404312 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895303 (arrayContainsKey!0 (_keys!10066 thiss!1181) lt!404312 #b00000000000000000000000000000000)))

(declare-fun lt!404310 () Unit!30406)

(assert (=> b!895303 (= lt!404310 lt!404311)))

(declare-fun res!605651 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52455 (_ BitVec 32)) SeekEntryResult!8883)

(assert (=> b!895303 (= res!605651 (= (seekEntryOrOpen!0 (select (arr!25223 (_keys!10066 thiss!1181)) #b00000000000000000000000000000000) (_keys!10066 thiss!1181) (mask!25948 thiss!1181)) (Found!8883 #b00000000000000000000000000000000)))))

(assert (=> b!895303 (=> (not res!605651) (not e!500235))))

(declare-fun b!895304 () Bool)

(assert (=> b!895304 (= e!500236 call!39731)))

(declare-fun bm!39728 () Bool)

(assert (=> bm!39728 (= call!39731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10066 thiss!1181) (mask!25948 thiss!1181)))))

(assert (= (and d!110591 (not res!605652)) b!895301))

(assert (= (and b!895301 c!94512) b!895303))

(assert (= (and b!895301 (not c!94512)) b!895304))

(assert (= (and b!895303 res!605651) b!895302))

(assert (= (or b!895302 b!895304) bm!39728))

(declare-fun m!832319 () Bool)

(assert (=> b!895301 m!832319))

(assert (=> b!895301 m!832319))

(declare-fun m!832321 () Bool)

(assert (=> b!895301 m!832321))

(assert (=> b!895303 m!832319))

(declare-fun m!832323 () Bool)

(assert (=> b!895303 m!832323))

(declare-fun m!832325 () Bool)

(assert (=> b!895303 m!832325))

(assert (=> b!895303 m!832319))

(declare-fun m!832327 () Bool)

(assert (=> b!895303 m!832327))

(declare-fun m!832329 () Bool)

(assert (=> bm!39728 m!832329))

(assert (=> b!895232 d!110591))

(declare-fun d!110593 () Bool)

(assert (=> d!110593 (= (validMask!0 (mask!25948 thiss!1181)) (and (or (= (mask!25948 thiss!1181) #b00000000000000000000000000000111) (= (mask!25948 thiss!1181) #b00000000000000000000000000001111) (= (mask!25948 thiss!1181) #b00000000000000000000000000011111) (= (mask!25948 thiss!1181) #b00000000000000000000000000111111) (= (mask!25948 thiss!1181) #b00000000000000000000000001111111) (= (mask!25948 thiss!1181) #b00000000000000000000000011111111) (= (mask!25948 thiss!1181) #b00000000000000000000000111111111) (= (mask!25948 thiss!1181) #b00000000000000000000001111111111) (= (mask!25948 thiss!1181) #b00000000000000000000011111111111) (= (mask!25948 thiss!1181) #b00000000000000000000111111111111) (= (mask!25948 thiss!1181) #b00000000000000000001111111111111) (= (mask!25948 thiss!1181) #b00000000000000000011111111111111) (= (mask!25948 thiss!1181) #b00000000000000000111111111111111) (= (mask!25948 thiss!1181) #b00000000000000001111111111111111) (= (mask!25948 thiss!1181) #b00000000000000011111111111111111) (= (mask!25948 thiss!1181) #b00000000000000111111111111111111) (= (mask!25948 thiss!1181) #b00000000000001111111111111111111) (= (mask!25948 thiss!1181) #b00000000000011111111111111111111) (= (mask!25948 thiss!1181) #b00000000000111111111111111111111) (= (mask!25948 thiss!1181) #b00000000001111111111111111111111) (= (mask!25948 thiss!1181) #b00000000011111111111111111111111) (= (mask!25948 thiss!1181) #b00000000111111111111111111111111) (= (mask!25948 thiss!1181) #b00000001111111111111111111111111) (= (mask!25948 thiss!1181) #b00000011111111111111111111111111) (= (mask!25948 thiss!1181) #b00000111111111111111111111111111) (= (mask!25948 thiss!1181) #b00001111111111111111111111111111) (= (mask!25948 thiss!1181) #b00011111111111111111111111111111) (= (mask!25948 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25948 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895235 d!110593))

(declare-fun b!895317 () Bool)

(declare-fun e!500244 () SeekEntryResult!8883)

(assert (=> b!895317 (= e!500244 Undefined!8883)))

(declare-fun b!895318 () Bool)

(declare-fun e!500243 () SeekEntryResult!8883)

(assert (=> b!895318 (= e!500244 e!500243)))

(declare-fun lt!404323 () (_ BitVec 64))

(declare-fun lt!404324 () SeekEntryResult!8883)

(assert (=> b!895318 (= lt!404323 (select (arr!25223 (_keys!10066 thiss!1181)) (index!37905 lt!404324)))))

(declare-fun c!94519 () Bool)

(assert (=> b!895318 (= c!94519 (= lt!404323 key!785))))

(declare-fun b!895320 () Bool)

(declare-fun c!94520 () Bool)

(assert (=> b!895320 (= c!94520 (= lt!404323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500245 () SeekEntryResult!8883)

(assert (=> b!895320 (= e!500243 e!500245)))

(declare-fun b!895321 () Bool)

(assert (=> b!895321 (= e!500243 (Found!8883 (index!37905 lt!404324)))))

(declare-fun b!895322 () Bool)

(declare-fun lt!404321 () SeekEntryResult!8883)

(assert (=> b!895322 (= e!500245 (ite ((_ is MissingVacant!8883) lt!404321) (MissingZero!8883 (index!37906 lt!404321)) lt!404321))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52455 (_ BitVec 32)) SeekEntryResult!8883)

(assert (=> b!895322 (= lt!404321 (seekKeyOrZeroReturnVacant!0 (x!76190 lt!404324) (index!37905 lt!404324) (index!37905 lt!404324) key!785 (_keys!10066 thiss!1181) (mask!25948 thiss!1181)))))

(declare-fun b!895319 () Bool)

(assert (=> b!895319 (= e!500245 (MissingZero!8883 (index!37905 lt!404324)))))

(declare-fun d!110595 () Bool)

(declare-fun lt!404322 () SeekEntryResult!8883)

(assert (=> d!110595 (and (or ((_ is MissingVacant!8883) lt!404322) (not ((_ is Found!8883) lt!404322)) (and (bvsge (index!37904 lt!404322) #b00000000000000000000000000000000) (bvslt (index!37904 lt!404322) (size!25675 (_keys!10066 thiss!1181))))) (not ((_ is MissingVacant!8883) lt!404322)) (or (not ((_ is Found!8883) lt!404322)) (= (select (arr!25223 (_keys!10066 thiss!1181)) (index!37904 lt!404322)) key!785)))))

(assert (=> d!110595 (= lt!404322 e!500244)))

(declare-fun c!94521 () Bool)

(assert (=> d!110595 (= c!94521 (and ((_ is Intermediate!8883) lt!404324) (undefined!9695 lt!404324)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52455 (_ BitVec 32)) SeekEntryResult!8883)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110595 (= lt!404324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25948 thiss!1181)) key!785 (_keys!10066 thiss!1181) (mask!25948 thiss!1181)))))

(assert (=> d!110595 (validMask!0 (mask!25948 thiss!1181))))

(assert (=> d!110595 (= (seekEntry!0 key!785 (_keys!10066 thiss!1181) (mask!25948 thiss!1181)) lt!404322)))

(assert (= (and d!110595 c!94521) b!895317))

(assert (= (and d!110595 (not c!94521)) b!895318))

(assert (= (and b!895318 c!94519) b!895321))

(assert (= (and b!895318 (not c!94519)) b!895320))

(assert (= (and b!895320 c!94520) b!895319))

(assert (= (and b!895320 (not c!94520)) b!895322))

(declare-fun m!832331 () Bool)

(assert (=> b!895318 m!832331))

(declare-fun m!832333 () Bool)

(assert (=> b!895322 m!832333))

(declare-fun m!832335 () Bool)

(assert (=> d!110595 m!832335))

(declare-fun m!832337 () Bool)

(assert (=> d!110595 m!832337))

(assert (=> d!110595 m!832337))

(declare-fun m!832339 () Bool)

(assert (=> d!110595 m!832339))

(assert (=> d!110595 m!832279))

(assert (=> b!895235 d!110595))

(declare-fun mapIsEmpty!28957 () Bool)

(declare-fun mapRes!28957 () Bool)

(assert (=> mapIsEmpty!28957 mapRes!28957))

(declare-fun b!895330 () Bool)

(declare-fun e!500250 () Bool)

(assert (=> b!895330 (= e!500250 tp_is_empty!18235)))

(declare-fun mapNonEmpty!28957 () Bool)

(declare-fun tp!55747 () Bool)

(declare-fun e!500251 () Bool)

(assert (=> mapNonEmpty!28957 (= mapRes!28957 (and tp!55747 e!500251))))

(declare-fun mapValue!28957 () ValueCell!8636)

(declare-fun mapRest!28957 () (Array (_ BitVec 32) ValueCell!8636))

(declare-fun mapKey!28957 () (_ BitVec 32))

(assert (=> mapNonEmpty!28957 (= mapRest!28948 (store mapRest!28957 mapKey!28957 mapValue!28957))))

(declare-fun b!895329 () Bool)

(assert (=> b!895329 (= e!500251 tp_is_empty!18235)))

(declare-fun condMapEmpty!28957 () Bool)

(declare-fun mapDefault!28957 () ValueCell!8636)

(assert (=> mapNonEmpty!28948 (= condMapEmpty!28957 (= mapRest!28948 ((as const (Array (_ BitVec 32) ValueCell!8636)) mapDefault!28957)))))

(assert (=> mapNonEmpty!28948 (= tp!55731 (and e!500250 mapRes!28957))))

(assert (= (and mapNonEmpty!28948 condMapEmpty!28957) mapIsEmpty!28957))

(assert (= (and mapNonEmpty!28948 (not condMapEmpty!28957)) mapNonEmpty!28957))

(assert (= (and mapNonEmpty!28957 ((_ is ValueCellFull!8636) mapValue!28957)) b!895329))

(assert (= (and mapNonEmpty!28948 ((_ is ValueCellFull!8636) mapDefault!28957)) b!895330))

(declare-fun m!832341 () Bool)

(assert (=> mapNonEmpty!28957 m!832341))

(check-sat (not b!895301) (not b!895322) tp_is_empty!18235 (not b!895291) (not b!895290) b_and!26173 (not b_next!15907) (not b!895292) (not b!895303) (not bm!39728) (not mapNonEmpty!28957) (not d!110589) (not d!110595))
(check-sat b_and!26173 (not b_next!15907))
