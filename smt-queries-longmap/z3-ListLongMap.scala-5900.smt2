; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76266 () Bool)

(assert start!76266)

(declare-fun b!895293 () Bool)

(declare-fun b_free!15903 () Bool)

(declare-fun b_next!15903 () Bool)

(assert (=> b!895293 (= b_free!15903 (not b_next!15903))))

(declare-fun tp!55714 () Bool)

(declare-fun b_and!26195 () Bool)

(assert (=> b!895293 (= tp!55714 b_and!26195)))

(declare-fun b!895290 () Bool)

(declare-fun res!605655 () Bool)

(declare-fun e!500213 () Bool)

(assert (=> b!895290 (=> (not res!605655) (not e!500213))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895290 (= res!605655 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895291 () Bool)

(declare-fun e!500212 () Bool)

(declare-datatypes ((array!52462 0))(
  ( (array!52463 (arr!25227 (Array (_ BitVec 32) (_ BitVec 64))) (size!25676 (_ BitVec 32))) )
))
(declare-datatypes ((V!29273 0))(
  ( (V!29274 (val!9166 Int)) )
))
(declare-datatypes ((ValueCell!8634 0))(
  ( (ValueCellFull!8634 (v!11656 V!29273)) (EmptyCell!8634) )
))
(declare-datatypes ((array!52464 0))(
  ( (array!52465 (arr!25228 (Array (_ BitVec 32) ValueCell!8634)) (size!25677 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4284 0))(
  ( (LongMapFixedSize!4285 (defaultEntry!5354 Int) (mask!25945 (_ BitVec 32)) (extraKeys!5050 (_ BitVec 32)) (zeroValue!5154 V!29273) (minValue!5154 V!29273) (_size!2197 (_ BitVec 32)) (_keys!10065 array!52462) (_values!5341 array!52464) (_vacant!2197 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4284)

(assert (=> b!895291 (= e!500212 (and (= (size!25677 (_values!5341 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25945 thiss!1181))) (= (size!25676 (_keys!10065 thiss!1181)) (size!25677 (_values!5341 thiss!1181))) (bvsge (mask!25945 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5050 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5050 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!895292 () Bool)

(declare-fun e!500211 () Bool)

(declare-fun e!500210 () Bool)

(declare-fun mapRes!28938 () Bool)

(assert (=> b!895292 (= e!500211 (and e!500210 mapRes!28938))))

(declare-fun condMapEmpty!28938 () Bool)

(declare-fun mapDefault!28938 () ValueCell!8634)

(assert (=> b!895292 (= condMapEmpty!28938 (= (arr!25228 (_values!5341 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8634)) mapDefault!28938)))))

(declare-fun e!500209 () Bool)

(declare-fun tp_is_empty!18231 () Bool)

(declare-fun array_inv!19806 (array!52462) Bool)

(declare-fun array_inv!19807 (array!52464) Bool)

(assert (=> b!895293 (= e!500209 (and tp!55714 tp_is_empty!18231 (array_inv!19806 (_keys!10065 thiss!1181)) (array_inv!19807 (_values!5341 thiss!1181)) e!500211))))

(declare-fun mapNonEmpty!28938 () Bool)

(declare-fun tp!55715 () Bool)

(declare-fun e!500214 () Bool)

(assert (=> mapNonEmpty!28938 (= mapRes!28938 (and tp!55715 e!500214))))

(declare-fun mapKey!28938 () (_ BitVec 32))

(declare-fun mapRest!28938 () (Array (_ BitVec 32) ValueCell!8634))

(declare-fun mapValue!28938 () ValueCell!8634)

(assert (=> mapNonEmpty!28938 (= (arr!25228 (_values!5341 thiss!1181)) (store mapRest!28938 mapKey!28938 mapValue!28938))))

(declare-fun b!895294 () Bool)

(assert (=> b!895294 (= e!500210 tp_is_empty!18231)))

(declare-fun res!605654 () Bool)

(assert (=> start!76266 (=> (not res!605654) (not e!500213))))

(declare-fun valid!1653 (LongMapFixedSize!4284) Bool)

(assert (=> start!76266 (= res!605654 (valid!1653 thiss!1181))))

(assert (=> start!76266 e!500213))

(assert (=> start!76266 e!500209))

(assert (=> start!76266 true))

(declare-fun b!895295 () Bool)

(assert (=> b!895295 (= e!500213 e!500212)))

(declare-fun res!605656 () Bool)

(assert (=> b!895295 (=> (not res!605656) (not e!500212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895295 (= res!605656 (validMask!0 (mask!25945 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8878 0))(
  ( (MissingZero!8878 (index!37883 (_ BitVec 32))) (Found!8878 (index!37884 (_ BitVec 32))) (Intermediate!8878 (undefined!9690 Bool) (index!37885 (_ BitVec 32)) (x!76165 (_ BitVec 32))) (Undefined!8878) (MissingVacant!8878 (index!37886 (_ BitVec 32))) )
))
(declare-fun lt!404485 () SeekEntryResult!8878)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52462 (_ BitVec 32)) SeekEntryResult!8878)

(assert (=> b!895295 (= lt!404485 (seekEntry!0 key!785 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)))))

(declare-fun b!895296 () Bool)

(assert (=> b!895296 (= e!500214 tp_is_empty!18231)))

(declare-fun mapIsEmpty!28938 () Bool)

(assert (=> mapIsEmpty!28938 mapRes!28938))

(assert (= (and start!76266 res!605654) b!895290))

(assert (= (and b!895290 res!605655) b!895295))

(assert (= (and b!895295 res!605656) b!895291))

(assert (= (and b!895292 condMapEmpty!28938) mapIsEmpty!28938))

(assert (= (and b!895292 (not condMapEmpty!28938)) mapNonEmpty!28938))

(get-info :version)

(assert (= (and mapNonEmpty!28938 ((_ is ValueCellFull!8634) mapValue!28938)) b!895296))

(assert (= (and b!895292 ((_ is ValueCellFull!8634) mapDefault!28938)) b!895294))

(assert (= b!895293 b!895292))

(assert (= start!76266 b!895293))

(declare-fun m!832947 () Bool)

(assert (=> b!895293 m!832947))

(declare-fun m!832949 () Bool)

(assert (=> b!895293 m!832949))

(declare-fun m!832951 () Bool)

(assert (=> mapNonEmpty!28938 m!832951))

(declare-fun m!832953 () Bool)

(assert (=> start!76266 m!832953))

(declare-fun m!832955 () Bool)

(assert (=> b!895295 m!832955))

(declare-fun m!832957 () Bool)

(assert (=> b!895295 m!832957))

(check-sat (not b!895295) (not mapNonEmpty!28938) b_and!26195 (not b_next!15903) tp_is_empty!18231 (not start!76266) (not b!895293))
(check-sat b_and!26195 (not b_next!15903))
(get-model)

(declare-fun d!110757 () Bool)

(assert (=> d!110757 (= (array_inv!19806 (_keys!10065 thiss!1181)) (bvsge (size!25676 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895293 d!110757))

(declare-fun d!110759 () Bool)

(assert (=> d!110759 (= (array_inv!19807 (_values!5341 thiss!1181)) (bvsge (size!25677 (_values!5341 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895293 d!110759))

(declare-fun d!110761 () Bool)

(declare-fun res!605672 () Bool)

(declare-fun e!500238 () Bool)

(assert (=> d!110761 (=> (not res!605672) (not e!500238))))

(declare-fun simpleValid!305 (LongMapFixedSize!4284) Bool)

(assert (=> d!110761 (= res!605672 (simpleValid!305 thiss!1181))))

(assert (=> d!110761 (= (valid!1653 thiss!1181) e!500238)))

(declare-fun b!895324 () Bool)

(declare-fun res!605673 () Bool)

(assert (=> b!895324 (=> (not res!605673) (not e!500238))))

(declare-fun arrayCountValidKeys!0 (array!52462 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895324 (= res!605673 (= (arrayCountValidKeys!0 (_keys!10065 thiss!1181) #b00000000000000000000000000000000 (size!25676 (_keys!10065 thiss!1181))) (_size!2197 thiss!1181)))))

(declare-fun b!895325 () Bool)

(declare-fun res!605674 () Bool)

(assert (=> b!895325 (=> (not res!605674) (not e!500238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52462 (_ BitVec 32)) Bool)

(assert (=> b!895325 (= res!605674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)))))

(declare-fun b!895326 () Bool)

(declare-datatypes ((List!17812 0))(
  ( (Nil!17809) (Cons!17808 (h!18944 (_ BitVec 64)) (t!25151 List!17812)) )
))
(declare-fun arrayNoDuplicates!0 (array!52462 (_ BitVec 32) List!17812) Bool)

(assert (=> b!895326 (= e!500238 (arrayNoDuplicates!0 (_keys!10065 thiss!1181) #b00000000000000000000000000000000 Nil!17809))))

(assert (= (and d!110761 res!605672) b!895324))

(assert (= (and b!895324 res!605673) b!895325))

(assert (= (and b!895325 res!605674) b!895326))

(declare-fun m!832971 () Bool)

(assert (=> d!110761 m!832971))

(declare-fun m!832973 () Bool)

(assert (=> b!895324 m!832973))

(declare-fun m!832975 () Bool)

(assert (=> b!895325 m!832975))

(declare-fun m!832977 () Bool)

(assert (=> b!895326 m!832977))

(assert (=> start!76266 d!110761))

(declare-fun d!110763 () Bool)

(assert (=> d!110763 (= (validMask!0 (mask!25945 thiss!1181)) (and (or (= (mask!25945 thiss!1181) #b00000000000000000000000000000111) (= (mask!25945 thiss!1181) #b00000000000000000000000000001111) (= (mask!25945 thiss!1181) #b00000000000000000000000000011111) (= (mask!25945 thiss!1181) #b00000000000000000000000000111111) (= (mask!25945 thiss!1181) #b00000000000000000000000001111111) (= (mask!25945 thiss!1181) #b00000000000000000000000011111111) (= (mask!25945 thiss!1181) #b00000000000000000000000111111111) (= (mask!25945 thiss!1181) #b00000000000000000000001111111111) (= (mask!25945 thiss!1181) #b00000000000000000000011111111111) (= (mask!25945 thiss!1181) #b00000000000000000000111111111111) (= (mask!25945 thiss!1181) #b00000000000000000001111111111111) (= (mask!25945 thiss!1181) #b00000000000000000011111111111111) (= (mask!25945 thiss!1181) #b00000000000000000111111111111111) (= (mask!25945 thiss!1181) #b00000000000000001111111111111111) (= (mask!25945 thiss!1181) #b00000000000000011111111111111111) (= (mask!25945 thiss!1181) #b00000000000000111111111111111111) (= (mask!25945 thiss!1181) #b00000000000001111111111111111111) (= (mask!25945 thiss!1181) #b00000000000011111111111111111111) (= (mask!25945 thiss!1181) #b00000000000111111111111111111111) (= (mask!25945 thiss!1181) #b00000000001111111111111111111111) (= (mask!25945 thiss!1181) #b00000000011111111111111111111111) (= (mask!25945 thiss!1181) #b00000000111111111111111111111111) (= (mask!25945 thiss!1181) #b00000001111111111111111111111111) (= (mask!25945 thiss!1181) #b00000011111111111111111111111111) (= (mask!25945 thiss!1181) #b00000111111111111111111111111111) (= (mask!25945 thiss!1181) #b00001111111111111111111111111111) (= (mask!25945 thiss!1181) #b00011111111111111111111111111111) (= (mask!25945 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25945 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895295 d!110763))

(declare-fun b!895339 () Bool)

(declare-fun e!500246 () SeekEntryResult!8878)

(declare-fun lt!404499 () SeekEntryResult!8878)

(assert (=> b!895339 (= e!500246 (ite ((_ is MissingVacant!8878) lt!404499) (MissingZero!8878 (index!37886 lt!404499)) lt!404499))))

(declare-fun lt!404500 () SeekEntryResult!8878)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52462 (_ BitVec 32)) SeekEntryResult!8878)

(assert (=> b!895339 (= lt!404499 (seekKeyOrZeroReturnVacant!0 (x!76165 lt!404500) (index!37885 lt!404500) (index!37885 lt!404500) key!785 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)))))

(declare-fun b!895340 () Bool)

(declare-fun e!500245 () SeekEntryResult!8878)

(assert (=> b!895340 (= e!500245 (Found!8878 (index!37885 lt!404500)))))

(declare-fun b!895341 () Bool)

(declare-fun e!500247 () SeekEntryResult!8878)

(assert (=> b!895341 (= e!500247 Undefined!8878)))

(declare-fun d!110765 () Bool)

(declare-fun lt!404498 () SeekEntryResult!8878)

(assert (=> d!110765 (and (or ((_ is MissingVacant!8878) lt!404498) (not ((_ is Found!8878) lt!404498)) (and (bvsge (index!37884 lt!404498) #b00000000000000000000000000000000) (bvslt (index!37884 lt!404498) (size!25676 (_keys!10065 thiss!1181))))) (not ((_ is MissingVacant!8878) lt!404498)) (or (not ((_ is Found!8878) lt!404498)) (= (select (arr!25227 (_keys!10065 thiss!1181)) (index!37884 lt!404498)) key!785)))))

(assert (=> d!110765 (= lt!404498 e!500247)))

(declare-fun c!94544 () Bool)

(assert (=> d!110765 (= c!94544 (and ((_ is Intermediate!8878) lt!404500) (undefined!9690 lt!404500)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52462 (_ BitVec 32)) SeekEntryResult!8878)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110765 (= lt!404500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25945 thiss!1181)) key!785 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)))))

(assert (=> d!110765 (validMask!0 (mask!25945 thiss!1181))))

(assert (=> d!110765 (= (seekEntry!0 key!785 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)) lt!404498)))

(declare-fun b!895342 () Bool)

(assert (=> b!895342 (= e!500246 (MissingZero!8878 (index!37885 lt!404500)))))

(declare-fun b!895343 () Bool)

(declare-fun c!94543 () Bool)

(declare-fun lt!404497 () (_ BitVec 64))

(assert (=> b!895343 (= c!94543 (= lt!404497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895343 (= e!500245 e!500246)))

(declare-fun b!895344 () Bool)

(assert (=> b!895344 (= e!500247 e!500245)))

(assert (=> b!895344 (= lt!404497 (select (arr!25227 (_keys!10065 thiss!1181)) (index!37885 lt!404500)))))

(declare-fun c!94542 () Bool)

(assert (=> b!895344 (= c!94542 (= lt!404497 key!785))))

(assert (= (and d!110765 c!94544) b!895341))

(assert (= (and d!110765 (not c!94544)) b!895344))

(assert (= (and b!895344 c!94542) b!895340))

(assert (= (and b!895344 (not c!94542)) b!895343))

(assert (= (and b!895343 c!94543) b!895342))

(assert (= (and b!895343 (not c!94543)) b!895339))

(declare-fun m!832979 () Bool)

(assert (=> b!895339 m!832979))

(declare-fun m!832981 () Bool)

(assert (=> d!110765 m!832981))

(declare-fun m!832983 () Bool)

(assert (=> d!110765 m!832983))

(assert (=> d!110765 m!832983))

(declare-fun m!832985 () Bool)

(assert (=> d!110765 m!832985))

(assert (=> d!110765 m!832955))

(declare-fun m!832987 () Bool)

(assert (=> b!895344 m!832987))

(assert (=> b!895295 d!110765))

(declare-fun mapNonEmpty!28944 () Bool)

(declare-fun mapRes!28944 () Bool)

(declare-fun tp!55724 () Bool)

(declare-fun e!500252 () Bool)

(assert (=> mapNonEmpty!28944 (= mapRes!28944 (and tp!55724 e!500252))))

(declare-fun mapKey!28944 () (_ BitVec 32))

(declare-fun mapValue!28944 () ValueCell!8634)

(declare-fun mapRest!28944 () (Array (_ BitVec 32) ValueCell!8634))

(assert (=> mapNonEmpty!28944 (= mapRest!28938 (store mapRest!28944 mapKey!28944 mapValue!28944))))

(declare-fun b!895352 () Bool)

(declare-fun e!500253 () Bool)

(assert (=> b!895352 (= e!500253 tp_is_empty!18231)))

(declare-fun mapIsEmpty!28944 () Bool)

(assert (=> mapIsEmpty!28944 mapRes!28944))

(declare-fun condMapEmpty!28944 () Bool)

(declare-fun mapDefault!28944 () ValueCell!8634)

(assert (=> mapNonEmpty!28938 (= condMapEmpty!28944 (= mapRest!28938 ((as const (Array (_ BitVec 32) ValueCell!8634)) mapDefault!28944)))))

(assert (=> mapNonEmpty!28938 (= tp!55715 (and e!500253 mapRes!28944))))

(declare-fun b!895351 () Bool)

(assert (=> b!895351 (= e!500252 tp_is_empty!18231)))

(assert (= (and mapNonEmpty!28938 condMapEmpty!28944) mapIsEmpty!28944))

(assert (= (and mapNonEmpty!28938 (not condMapEmpty!28944)) mapNonEmpty!28944))

(assert (= (and mapNonEmpty!28944 ((_ is ValueCellFull!8634) mapValue!28944)) b!895351))

(assert (= (and mapNonEmpty!28938 ((_ is ValueCellFull!8634) mapDefault!28944)) b!895352))

(declare-fun m!832989 () Bool)

(assert (=> mapNonEmpty!28944 m!832989))

(check-sat b_and!26195 (not b!895339) tp_is_empty!18231 (not d!110765) (not mapNonEmpty!28944) (not b!895326) (not b_next!15903) (not d!110761) (not b!895324) (not b!895325))
(check-sat b_and!26195 (not b_next!15903))
(get-model)

(declare-fun lt!404505 () SeekEntryResult!8878)

(declare-fun d!110767 () Bool)

(assert (=> d!110767 (and (or ((_ is Undefined!8878) lt!404505) (not ((_ is Found!8878) lt!404505)) (and (bvsge (index!37884 lt!404505) #b00000000000000000000000000000000) (bvslt (index!37884 lt!404505) (size!25676 (_keys!10065 thiss!1181))))) (or ((_ is Undefined!8878) lt!404505) ((_ is Found!8878) lt!404505) (not ((_ is MissingVacant!8878) lt!404505)) (not (= (index!37886 lt!404505) (index!37885 lt!404500))) (and (bvsge (index!37886 lt!404505) #b00000000000000000000000000000000) (bvslt (index!37886 lt!404505) (size!25676 (_keys!10065 thiss!1181))))) (or ((_ is Undefined!8878) lt!404505) (ite ((_ is Found!8878) lt!404505) (= (select (arr!25227 (_keys!10065 thiss!1181)) (index!37884 lt!404505)) key!785) (and ((_ is MissingVacant!8878) lt!404505) (= (index!37886 lt!404505) (index!37885 lt!404500)) (= (select (arr!25227 (_keys!10065 thiss!1181)) (index!37886 lt!404505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!500262 () SeekEntryResult!8878)

(assert (=> d!110767 (= lt!404505 e!500262)))

(declare-fun c!94552 () Bool)

(assert (=> d!110767 (= c!94552 (bvsge (x!76165 lt!404500) #b01111111111111111111111111111110))))

(declare-fun lt!404506 () (_ BitVec 64))

(assert (=> d!110767 (= lt!404506 (select (arr!25227 (_keys!10065 thiss!1181)) (index!37885 lt!404500)))))

(assert (=> d!110767 (validMask!0 (mask!25945 thiss!1181))))

(assert (=> d!110767 (= (seekKeyOrZeroReturnVacant!0 (x!76165 lt!404500) (index!37885 lt!404500) (index!37885 lt!404500) key!785 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)) lt!404505)))

(declare-fun b!895365 () Bool)

(declare-fun c!94551 () Bool)

(assert (=> b!895365 (= c!94551 (= lt!404506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500261 () SeekEntryResult!8878)

(declare-fun e!500260 () SeekEntryResult!8878)

(assert (=> b!895365 (= e!500261 e!500260)))

(declare-fun b!895366 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895366 (= e!500260 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76165 lt!404500) #b00000000000000000000000000000001) (nextIndex!0 (index!37885 lt!404500) (x!76165 lt!404500) (mask!25945 thiss!1181)) (index!37885 lt!404500) key!785 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)))))

(declare-fun b!895367 () Bool)

(assert (=> b!895367 (= e!500261 (Found!8878 (index!37885 lt!404500)))))

(declare-fun b!895368 () Bool)

(assert (=> b!895368 (= e!500262 e!500261)))

(declare-fun c!94553 () Bool)

(assert (=> b!895368 (= c!94553 (= lt!404506 key!785))))

(declare-fun b!895369 () Bool)

(assert (=> b!895369 (= e!500262 Undefined!8878)))

(declare-fun b!895370 () Bool)

(assert (=> b!895370 (= e!500260 (MissingVacant!8878 (index!37885 lt!404500)))))

(assert (= (and d!110767 c!94552) b!895369))

(assert (= (and d!110767 (not c!94552)) b!895368))

(assert (= (and b!895368 c!94553) b!895367))

(assert (= (and b!895368 (not c!94553)) b!895365))

(assert (= (and b!895365 c!94551) b!895370))

(assert (= (and b!895365 (not c!94551)) b!895366))

(declare-fun m!832991 () Bool)

(assert (=> d!110767 m!832991))

(declare-fun m!832993 () Bool)

(assert (=> d!110767 m!832993))

(assert (=> d!110767 m!832987))

(assert (=> d!110767 m!832955))

(declare-fun m!832995 () Bool)

(assert (=> b!895366 m!832995))

(assert (=> b!895366 m!832995))

(declare-fun m!832997 () Bool)

(assert (=> b!895366 m!832997))

(assert (=> b!895339 d!110767))

(declare-fun bm!39745 () Bool)

(declare-fun call!39748 () Bool)

(declare-fun c!94556 () Bool)

(assert (=> bm!39745 (= call!39748 (arrayNoDuplicates!0 (_keys!10065 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94556 (Cons!17808 (select (arr!25227 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000) Nil!17809) Nil!17809)))))

(declare-fun b!895381 () Bool)

(declare-fun e!500273 () Bool)

(declare-fun e!500272 () Bool)

(assert (=> b!895381 (= e!500273 e!500272)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895381 (= c!94556 (validKeyInArray!0 (select (arr!25227 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895382 () Bool)

(declare-fun e!500274 () Bool)

(assert (=> b!895382 (= e!500274 e!500273)))

(declare-fun res!605681 () Bool)

(assert (=> b!895382 (=> (not res!605681) (not e!500273))))

(declare-fun e!500271 () Bool)

(assert (=> b!895382 (= res!605681 (not e!500271))))

(declare-fun res!605683 () Bool)

(assert (=> b!895382 (=> (not res!605683) (not e!500271))))

(assert (=> b!895382 (= res!605683 (validKeyInArray!0 (select (arr!25227 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895383 () Bool)

(assert (=> b!895383 (= e!500272 call!39748)))

(declare-fun d!110769 () Bool)

(declare-fun res!605682 () Bool)

(assert (=> d!110769 (=> res!605682 e!500274)))

(assert (=> d!110769 (= res!605682 (bvsge #b00000000000000000000000000000000 (size!25676 (_keys!10065 thiss!1181))))))

(assert (=> d!110769 (= (arrayNoDuplicates!0 (_keys!10065 thiss!1181) #b00000000000000000000000000000000 Nil!17809) e!500274)))

(declare-fun b!895384 () Bool)

(assert (=> b!895384 (= e!500272 call!39748)))

(declare-fun b!895385 () Bool)

(declare-fun contains!4397 (List!17812 (_ BitVec 64)) Bool)

(assert (=> b!895385 (= e!500271 (contains!4397 Nil!17809 (select (arr!25227 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110769 (not res!605682)) b!895382))

(assert (= (and b!895382 res!605683) b!895385))

(assert (= (and b!895382 res!605681) b!895381))

(assert (= (and b!895381 c!94556) b!895383))

(assert (= (and b!895381 (not c!94556)) b!895384))

(assert (= (or b!895383 b!895384) bm!39745))

(declare-fun m!832999 () Bool)

(assert (=> bm!39745 m!832999))

(declare-fun m!833001 () Bool)

(assert (=> bm!39745 m!833001))

(assert (=> b!895381 m!832999))

(assert (=> b!895381 m!832999))

(declare-fun m!833003 () Bool)

(assert (=> b!895381 m!833003))

(assert (=> b!895382 m!832999))

(assert (=> b!895382 m!832999))

(assert (=> b!895382 m!833003))

(assert (=> b!895385 m!832999))

(assert (=> b!895385 m!832999))

(declare-fun m!833005 () Bool)

(assert (=> b!895385 m!833005))

(assert (=> b!895326 d!110769))

(declare-fun d!110771 () Bool)

(declare-fun e!500288 () Bool)

(assert (=> d!110771 e!500288))

(declare-fun c!94563 () Bool)

(declare-fun lt!404512 () SeekEntryResult!8878)

(assert (=> d!110771 (= c!94563 (and ((_ is Intermediate!8878) lt!404512) (undefined!9690 lt!404512)))))

(declare-fun e!500289 () SeekEntryResult!8878)

(assert (=> d!110771 (= lt!404512 e!500289)))

(declare-fun c!94564 () Bool)

(assert (=> d!110771 (= c!94564 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!404511 () (_ BitVec 64))

(assert (=> d!110771 (= lt!404511 (select (arr!25227 (_keys!10065 thiss!1181)) (toIndex!0 key!785 (mask!25945 thiss!1181))))))

(assert (=> d!110771 (validMask!0 (mask!25945 thiss!1181))))

(assert (=> d!110771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25945 thiss!1181)) key!785 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)) lt!404512)))

(declare-fun b!895404 () Bool)

(declare-fun e!500287 () Bool)

(assert (=> b!895404 (= e!500288 e!500287)))

(declare-fun res!605692 () Bool)

(assert (=> b!895404 (= res!605692 (and ((_ is Intermediate!8878) lt!404512) (not (undefined!9690 lt!404512)) (bvslt (x!76165 lt!404512) #b01111111111111111111111111111110) (bvsge (x!76165 lt!404512) #b00000000000000000000000000000000) (bvsge (x!76165 lt!404512) #b00000000000000000000000000000000)))))

(assert (=> b!895404 (=> (not res!605692) (not e!500287))))

(declare-fun b!895405 () Bool)

(assert (=> b!895405 (and (bvsge (index!37885 lt!404512) #b00000000000000000000000000000000) (bvslt (index!37885 lt!404512) (size!25676 (_keys!10065 thiss!1181))))))

(declare-fun res!605690 () Bool)

(assert (=> b!895405 (= res!605690 (= (select (arr!25227 (_keys!10065 thiss!1181)) (index!37885 lt!404512)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500286 () Bool)

(assert (=> b!895405 (=> res!605690 e!500286)))

(declare-fun b!895406 () Bool)

(declare-fun e!500285 () SeekEntryResult!8878)

(assert (=> b!895406 (= e!500285 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25945 thiss!1181)) #b00000000000000000000000000000000 (mask!25945 thiss!1181)) key!785 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)))))

(declare-fun b!895407 () Bool)

(assert (=> b!895407 (= e!500288 (bvsge (x!76165 lt!404512) #b01111111111111111111111111111110))))

(declare-fun b!895408 () Bool)

(assert (=> b!895408 (= e!500285 (Intermediate!8878 false (toIndex!0 key!785 (mask!25945 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895409 () Bool)

(assert (=> b!895409 (= e!500289 (Intermediate!8878 true (toIndex!0 key!785 (mask!25945 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895410 () Bool)

(assert (=> b!895410 (and (bvsge (index!37885 lt!404512) #b00000000000000000000000000000000) (bvslt (index!37885 lt!404512) (size!25676 (_keys!10065 thiss!1181))))))

(declare-fun res!605691 () Bool)

(assert (=> b!895410 (= res!605691 (= (select (arr!25227 (_keys!10065 thiss!1181)) (index!37885 lt!404512)) key!785))))

(assert (=> b!895410 (=> res!605691 e!500286)))

(assert (=> b!895410 (= e!500287 e!500286)))

(declare-fun b!895411 () Bool)

(assert (=> b!895411 (= e!500289 e!500285)))

(declare-fun c!94565 () Bool)

(assert (=> b!895411 (= c!94565 (or (= lt!404511 key!785) (= (bvadd lt!404511 lt!404511) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!895412 () Bool)

(assert (=> b!895412 (and (bvsge (index!37885 lt!404512) #b00000000000000000000000000000000) (bvslt (index!37885 lt!404512) (size!25676 (_keys!10065 thiss!1181))))))

(assert (=> b!895412 (= e!500286 (= (select (arr!25227 (_keys!10065 thiss!1181)) (index!37885 lt!404512)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!110771 c!94564) b!895409))

(assert (= (and d!110771 (not c!94564)) b!895411))

(assert (= (and b!895411 c!94565) b!895408))

(assert (= (and b!895411 (not c!94565)) b!895406))

(assert (= (and d!110771 c!94563) b!895407))

(assert (= (and d!110771 (not c!94563)) b!895404))

(assert (= (and b!895404 res!605692) b!895410))

(assert (= (and b!895410 (not res!605691)) b!895405))

(assert (= (and b!895405 (not res!605690)) b!895412))

(declare-fun m!833007 () Bool)

(assert (=> b!895412 m!833007))

(assert (=> b!895406 m!832983))

(declare-fun m!833009 () Bool)

(assert (=> b!895406 m!833009))

(assert (=> b!895406 m!833009))

(declare-fun m!833011 () Bool)

(assert (=> b!895406 m!833011))

(assert (=> b!895410 m!833007))

(assert (=> d!110771 m!832983))

(declare-fun m!833013 () Bool)

(assert (=> d!110771 m!833013))

(assert (=> d!110771 m!832955))

(assert (=> b!895405 m!833007))

(assert (=> d!110765 d!110771))

(declare-fun d!110773 () Bool)

(declare-fun lt!404518 () (_ BitVec 32))

(declare-fun lt!404517 () (_ BitVec 32))

(assert (=> d!110773 (= lt!404518 (bvmul (bvxor lt!404517 (bvlshr lt!404517 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110773 (= lt!404517 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110773 (and (bvsge (mask!25945 thiss!1181) #b00000000000000000000000000000000) (let ((res!605693 (let ((h!18945 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76183 (bvmul (bvxor h!18945 (bvlshr h!18945 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76183 (bvlshr x!76183 #b00000000000000000000000000001101)) (mask!25945 thiss!1181)))))) (and (bvslt res!605693 (bvadd (mask!25945 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605693 #b00000000000000000000000000000000))))))

(assert (=> d!110773 (= (toIndex!0 key!785 (mask!25945 thiss!1181)) (bvand (bvxor lt!404518 (bvlshr lt!404518 #b00000000000000000000000000001101)) (mask!25945 thiss!1181)))))

(assert (=> d!110765 d!110773))

(assert (=> d!110765 d!110763))

(declare-fun d!110775 () Bool)

(declare-fun res!605699 () Bool)

(declare-fun e!500298 () Bool)

(assert (=> d!110775 (=> res!605699 e!500298)))

(assert (=> d!110775 (= res!605699 (bvsge #b00000000000000000000000000000000 (size!25676 (_keys!10065 thiss!1181))))))

(assert (=> d!110775 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10065 thiss!1181) (mask!25945 thiss!1181)) e!500298)))

(declare-fun bm!39748 () Bool)

(declare-fun call!39751 () Bool)

(assert (=> bm!39748 (= call!39751 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10065 thiss!1181) (mask!25945 thiss!1181)))))

(declare-fun b!895421 () Bool)

(declare-fun e!500297 () Bool)

(assert (=> b!895421 (= e!500298 e!500297)))

(declare-fun c!94568 () Bool)

(assert (=> b!895421 (= c!94568 (validKeyInArray!0 (select (arr!25227 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895422 () Bool)

(declare-fun e!500296 () Bool)

(assert (=> b!895422 (= e!500296 call!39751)))

(declare-fun b!895423 () Bool)

(assert (=> b!895423 (= e!500297 call!39751)))

(declare-fun b!895424 () Bool)

(assert (=> b!895424 (= e!500297 e!500296)))

(declare-fun lt!404526 () (_ BitVec 64))

(assert (=> b!895424 (= lt!404526 (select (arr!25227 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30460 0))(
  ( (Unit!30461) )
))
(declare-fun lt!404527 () Unit!30460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52462 (_ BitVec 64) (_ BitVec 32)) Unit!30460)

(assert (=> b!895424 (= lt!404527 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10065 thiss!1181) lt!404526 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895424 (arrayContainsKey!0 (_keys!10065 thiss!1181) lt!404526 #b00000000000000000000000000000000)))

(declare-fun lt!404525 () Unit!30460)

(assert (=> b!895424 (= lt!404525 lt!404527)))

(declare-fun res!605698 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52462 (_ BitVec 32)) SeekEntryResult!8878)

(assert (=> b!895424 (= res!605698 (= (seekEntryOrOpen!0 (select (arr!25227 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000) (_keys!10065 thiss!1181) (mask!25945 thiss!1181)) (Found!8878 #b00000000000000000000000000000000)))))

(assert (=> b!895424 (=> (not res!605698) (not e!500296))))

(assert (= (and d!110775 (not res!605699)) b!895421))

(assert (= (and b!895421 c!94568) b!895424))

(assert (= (and b!895421 (not c!94568)) b!895423))

(assert (= (and b!895424 res!605698) b!895422))

(assert (= (or b!895422 b!895423) bm!39748))

(declare-fun m!833015 () Bool)

(assert (=> bm!39748 m!833015))

(assert (=> b!895421 m!832999))

(assert (=> b!895421 m!832999))

(assert (=> b!895421 m!833003))

(assert (=> b!895424 m!832999))

(declare-fun m!833017 () Bool)

(assert (=> b!895424 m!833017))

(declare-fun m!833019 () Bool)

(assert (=> b!895424 m!833019))

(assert (=> b!895424 m!832999))

(declare-fun m!833021 () Bool)

(assert (=> b!895424 m!833021))

(assert (=> b!895325 d!110775))

(declare-fun b!895435 () Bool)

(declare-fun res!605710 () Bool)

(declare-fun e!500301 () Bool)

(assert (=> b!895435 (=> (not res!605710) (not e!500301))))

(declare-fun size!25680 (LongMapFixedSize!4284) (_ BitVec 32))

(assert (=> b!895435 (= res!605710 (= (size!25680 thiss!1181) (bvadd (_size!2197 thiss!1181) (bvsdiv (bvadd (extraKeys!5050 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!895434 () Bool)

(declare-fun res!605711 () Bool)

(assert (=> b!895434 (=> (not res!605711) (not e!500301))))

(assert (=> b!895434 (= res!605711 (bvsge (size!25680 thiss!1181) (_size!2197 thiss!1181)))))

(declare-fun d!110777 () Bool)

(declare-fun res!605708 () Bool)

(assert (=> d!110777 (=> (not res!605708) (not e!500301))))

(assert (=> d!110777 (= res!605708 (validMask!0 (mask!25945 thiss!1181)))))

(assert (=> d!110777 (= (simpleValid!305 thiss!1181) e!500301)))

(declare-fun b!895433 () Bool)

(declare-fun res!605709 () Bool)

(assert (=> b!895433 (=> (not res!605709) (not e!500301))))

(assert (=> b!895433 (= res!605709 (and (= (size!25677 (_values!5341 thiss!1181)) (bvadd (mask!25945 thiss!1181) #b00000000000000000000000000000001)) (= (size!25676 (_keys!10065 thiss!1181)) (size!25677 (_values!5341 thiss!1181))) (bvsge (_size!2197 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2197 thiss!1181) (bvadd (mask!25945 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!895436 () Bool)

(assert (=> b!895436 (= e!500301 (and (bvsge (extraKeys!5050 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5050 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2197 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!110777 res!605708) b!895433))

(assert (= (and b!895433 res!605709) b!895434))

(assert (= (and b!895434 res!605711) b!895435))

(assert (= (and b!895435 res!605710) b!895436))

(declare-fun m!833023 () Bool)

(assert (=> b!895435 m!833023))

(assert (=> b!895434 m!833023))

(assert (=> d!110777 m!832955))

(assert (=> d!110761 d!110777))

(declare-fun d!110779 () Bool)

(declare-fun lt!404530 () (_ BitVec 32))

(assert (=> d!110779 (and (bvsge lt!404530 #b00000000000000000000000000000000) (bvsle lt!404530 (bvsub (size!25676 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!500306 () (_ BitVec 32))

(assert (=> d!110779 (= lt!404530 e!500306)))

(declare-fun c!94574 () Bool)

(assert (=> d!110779 (= c!94574 (bvsge #b00000000000000000000000000000000 (size!25676 (_keys!10065 thiss!1181))))))

(assert (=> d!110779 (and (bvsle #b00000000000000000000000000000000 (size!25676 (_keys!10065 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25676 (_keys!10065 thiss!1181)) (size!25676 (_keys!10065 thiss!1181))))))

(assert (=> d!110779 (= (arrayCountValidKeys!0 (_keys!10065 thiss!1181) #b00000000000000000000000000000000 (size!25676 (_keys!10065 thiss!1181))) lt!404530)))

(declare-fun b!895445 () Bool)

(assert (=> b!895445 (= e!500306 #b00000000000000000000000000000000)))

(declare-fun b!895446 () Bool)

(declare-fun e!500307 () (_ BitVec 32))

(declare-fun call!39754 () (_ BitVec 32))

(assert (=> b!895446 (= e!500307 call!39754)))

(declare-fun b!895447 () Bool)

(assert (=> b!895447 (= e!500306 e!500307)))

(declare-fun c!94573 () Bool)

(assert (=> b!895447 (= c!94573 (validKeyInArray!0 (select (arr!25227 (_keys!10065 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39751 () Bool)

(assert (=> bm!39751 (= call!39754 (arrayCountValidKeys!0 (_keys!10065 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25676 (_keys!10065 thiss!1181))))))

(declare-fun b!895448 () Bool)

(assert (=> b!895448 (= e!500307 (bvadd #b00000000000000000000000000000001 call!39754))))

(assert (= (and d!110779 c!94574) b!895445))

(assert (= (and d!110779 (not c!94574)) b!895447))

(assert (= (and b!895447 c!94573) b!895448))

(assert (= (and b!895447 (not c!94573)) b!895446))

(assert (= (or b!895448 b!895446) bm!39751))

(assert (=> b!895447 m!832999))

(assert (=> b!895447 m!832999))

(assert (=> b!895447 m!833003))

(declare-fun m!833025 () Bool)

(assert (=> bm!39751 m!833025))

(assert (=> b!895324 d!110779))

(declare-fun mapNonEmpty!28945 () Bool)

(declare-fun mapRes!28945 () Bool)

(declare-fun tp!55725 () Bool)

(declare-fun e!500308 () Bool)

(assert (=> mapNonEmpty!28945 (= mapRes!28945 (and tp!55725 e!500308))))

(declare-fun mapRest!28945 () (Array (_ BitVec 32) ValueCell!8634))

(declare-fun mapValue!28945 () ValueCell!8634)

(declare-fun mapKey!28945 () (_ BitVec 32))

(assert (=> mapNonEmpty!28945 (= mapRest!28944 (store mapRest!28945 mapKey!28945 mapValue!28945))))

(declare-fun b!895450 () Bool)

(declare-fun e!500309 () Bool)

(assert (=> b!895450 (= e!500309 tp_is_empty!18231)))

(declare-fun mapIsEmpty!28945 () Bool)

(assert (=> mapIsEmpty!28945 mapRes!28945))

(declare-fun condMapEmpty!28945 () Bool)

(declare-fun mapDefault!28945 () ValueCell!8634)

(assert (=> mapNonEmpty!28944 (= condMapEmpty!28945 (= mapRest!28944 ((as const (Array (_ BitVec 32) ValueCell!8634)) mapDefault!28945)))))

(assert (=> mapNonEmpty!28944 (= tp!55724 (and e!500309 mapRes!28945))))

(declare-fun b!895449 () Bool)

(assert (=> b!895449 (= e!500308 tp_is_empty!18231)))

(assert (= (and mapNonEmpty!28944 condMapEmpty!28945) mapIsEmpty!28945))

(assert (= (and mapNonEmpty!28944 (not condMapEmpty!28945)) mapNonEmpty!28945))

(assert (= (and mapNonEmpty!28945 ((_ is ValueCellFull!8634) mapValue!28945)) b!895449))

(assert (= (and mapNonEmpty!28944 ((_ is ValueCellFull!8634) mapDefault!28945)) b!895450))

(declare-fun m!833027 () Bool)

(assert (=> mapNonEmpty!28945 m!833027))

(check-sat (not b!895424) b_and!26195 (not b!895435) (not bm!39748) tp_is_empty!18231 (not d!110771) (not b!895447) (not b!895434) (not bm!39745) (not d!110777) (not b!895366) (not bm!39751) (not d!110767) (not b!895406) (not mapNonEmpty!28945) (not b!895381) (not b_next!15903) (not b!895382) (not b!895385) (not b!895421))
(check-sat b_and!26195 (not b_next!15903))
