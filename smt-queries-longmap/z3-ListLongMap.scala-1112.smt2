; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22922 () Bool)

(assert start!22922)

(declare-fun b!239049 () Bool)

(declare-fun b_free!6421 () Bool)

(declare-fun b_next!6421 () Bool)

(assert (=> b!239049 (= b_free!6421 (not b_next!6421))))

(declare-fun tp!22467 () Bool)

(declare-fun b_and!13401 () Bool)

(assert (=> b!239049 (= tp!22467 b_and!13401)))

(declare-fun b!239047 () Bool)

(declare-fun e!155211 () Bool)

(declare-fun e!155200 () Bool)

(assert (=> b!239047 (= e!155211 e!155200)))

(declare-fun res!117154 () Bool)

(declare-fun call!22212 () Bool)

(assert (=> b!239047 (= res!117154 call!22212)))

(assert (=> b!239047 (=> (not res!117154) (not e!155200))))

(declare-fun b!239048 () Bool)

(declare-fun e!155205 () Bool)

(declare-fun tp_is_empty!6283 () Bool)

(assert (=> b!239048 (= e!155205 tp_is_empty!6283)))

(declare-fun e!155206 () Bool)

(declare-fun e!155204 () Bool)

(declare-datatypes ((V!8025 0))(
  ( (V!8026 (val!3186 Int)) )
))
(declare-datatypes ((ValueCell!2798 0))(
  ( (ValueCellFull!2798 (v!5225 V!8025)) (EmptyCell!2798) )
))
(declare-datatypes ((array!11843 0))(
  ( (array!11844 (arr!5623 (Array (_ BitVec 32) ValueCell!2798)) (size!5964 (_ BitVec 32))) )
))
(declare-datatypes ((array!11845 0))(
  ( (array!11846 (arr!5624 (Array (_ BitVec 32) (_ BitVec 64))) (size!5965 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3496 0))(
  ( (LongMapFixedSize!3497 (defaultEntry!4433 Int) (mask!10475 (_ BitVec 32)) (extraKeys!4170 (_ BitVec 32)) (zeroValue!4274 V!8025) (minValue!4274 V!8025) (_size!1797 (_ BitVec 32)) (_keys!6535 array!11845) (_values!4416 array!11843) (_vacant!1797 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3496)

(declare-fun array_inv!3697 (array!11845) Bool)

(declare-fun array_inv!3698 (array!11843) Bool)

(assert (=> b!239049 (= e!155204 (and tp!22467 tp_is_empty!6283 (array_inv!3697 (_keys!6535 thiss!1504)) (array_inv!3698 (_values!4416 thiss!1504)) e!155206))))

(declare-fun b!239050 () Bool)

(declare-fun e!155207 () Bool)

(assert (=> b!239050 (= e!155207 (and (= (size!5964 (_values!4416 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10475 thiss!1504))) (not (= (size!5965 (_keys!6535 thiss!1504)) (size!5964 (_values!4416 thiss!1504))))))))

(declare-fun b!239051 () Bool)

(declare-fun res!117150 () Bool)

(declare-datatypes ((SeekEntryResult!995 0))(
  ( (MissingZero!995 (index!6150 (_ BitVec 32))) (Found!995 (index!6151 (_ BitVec 32))) (Intermediate!995 (undefined!1807 Bool) (index!6152 (_ BitVec 32)) (x!24051 (_ BitVec 32))) (Undefined!995) (MissingVacant!995 (index!6153 (_ BitVec 32))) )
))
(declare-fun lt!120763 () SeekEntryResult!995)

(assert (=> b!239051 (= res!117150 (= (select (arr!5624 (_keys!6535 thiss!1504)) (index!6153 lt!120763)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239051 (=> (not res!117150) (not e!155200))))

(declare-fun b!239053 () Bool)

(declare-fun res!117156 () Bool)

(declare-fun e!155202 () Bool)

(assert (=> b!239053 (=> (not res!117156) (not e!155202))))

(assert (=> b!239053 (= res!117156 call!22212)))

(declare-fun e!155208 () Bool)

(assert (=> b!239053 (= e!155208 e!155202)))

(declare-fun b!239054 () Bool)

(declare-fun e!155210 () Bool)

(assert (=> b!239054 (= e!155210 tp_is_empty!6283)))

(declare-fun b!239055 () Bool)

(declare-fun mapRes!10656 () Bool)

(assert (=> b!239055 (= e!155206 (and e!155210 mapRes!10656))))

(declare-fun condMapEmpty!10656 () Bool)

(declare-fun mapDefault!10656 () ValueCell!2798)

(assert (=> b!239055 (= condMapEmpty!10656 (= (arr!5623 (_values!4416 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2798)) mapDefault!10656)))))

(declare-fun b!239056 () Bool)

(declare-fun res!117157 () Bool)

(assert (=> b!239056 (=> (not res!117157) (not e!155207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239056 (= res!117157 (validMask!0 (mask!10475 thiss!1504)))))

(declare-fun mapIsEmpty!10656 () Bool)

(assert (=> mapIsEmpty!10656 mapRes!10656))

(declare-fun bm!22208 () Bool)

(declare-fun call!22211 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22208 (= call!22211 (arrayContainsKey!0 (_keys!6535 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239057 () Bool)

(assert (=> b!239057 (= e!155202 (not call!22211))))

(declare-fun b!239058 () Bool)

(get-info :version)

(assert (=> b!239058 (= e!155211 ((_ is Undefined!995) lt!120763))))

(declare-fun b!239059 () Bool)

(declare-fun res!117158 () Bool)

(assert (=> b!239059 (=> (not res!117158) (not e!155207))))

(assert (=> b!239059 (= res!117158 (arrayContainsKey!0 (_keys!6535 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239060 () Bool)

(declare-fun c!39860 () Bool)

(assert (=> b!239060 (= c!39860 ((_ is MissingVacant!995) lt!120763))))

(assert (=> b!239060 (= e!155208 e!155211)))

(declare-fun b!239061 () Bool)

(declare-fun e!155209 () Bool)

(assert (=> b!239061 (= e!155209 e!155207)))

(declare-fun res!117155 () Bool)

(assert (=> b!239061 (=> (not res!117155) (not e!155207))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239061 (= res!117155 (inRange!0 index!297 (mask!10475 thiss!1504)))))

(declare-datatypes ((Unit!7321 0))(
  ( (Unit!7322) )
))
(declare-fun lt!120761 () Unit!7321)

(declare-fun e!155201 () Unit!7321)

(assert (=> b!239061 (= lt!120761 e!155201)))

(declare-fun c!39859 () Bool)

(declare-datatypes ((tuple2!4624 0))(
  ( (tuple2!4625 (_1!2323 (_ BitVec 64)) (_2!2323 V!8025)) )
))
(declare-datatypes ((List!3509 0))(
  ( (Nil!3506) (Cons!3505 (h!4161 tuple2!4624) (t!8496 List!3509)) )
))
(declare-datatypes ((ListLongMap!3539 0))(
  ( (ListLongMap!3540 (toList!1785 List!3509)) )
))
(declare-fun contains!1687 (ListLongMap!3539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1317 (array!11845 array!11843 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 32) Int) ListLongMap!3539)

(assert (=> b!239061 (= c!39859 (contains!1687 (getCurrentListMap!1317 (_keys!6535 thiss!1504) (_values!4416 thiss!1504) (mask!10475 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4433 thiss!1504)) key!932))))

(declare-fun b!239062 () Bool)

(declare-fun res!117153 () Bool)

(assert (=> b!239062 (=> (not res!117153) (not e!155202))))

(assert (=> b!239062 (= res!117153 (= (select (arr!5624 (_keys!6535 thiss!1504)) (index!6150 lt!120763)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239052 () Bool)

(declare-fun res!117149 () Bool)

(declare-fun e!155199 () Bool)

(assert (=> b!239052 (=> (not res!117149) (not e!155199))))

(assert (=> b!239052 (= res!117149 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!117152 () Bool)

(assert (=> start!22922 (=> (not res!117152) (not e!155199))))

(declare-fun valid!1391 (LongMapFixedSize!3496) Bool)

(assert (=> start!22922 (= res!117152 (valid!1391 thiss!1504))))

(assert (=> start!22922 e!155199))

(assert (=> start!22922 e!155204))

(assert (=> start!22922 true))

(declare-fun bm!22209 () Bool)

(declare-fun c!39861 () Bool)

(assert (=> bm!22209 (= call!22212 (inRange!0 (ite c!39861 (index!6150 lt!120763) (index!6153 lt!120763)) (mask!10475 thiss!1504)))))

(declare-fun b!239063 () Bool)

(declare-fun Unit!7323 () Unit!7321)

(assert (=> b!239063 (= e!155201 Unit!7323)))

(declare-fun lt!120764 () Unit!7321)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!327 (array!11845 array!11843 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 64) Int) Unit!7321)

(assert (=> b!239063 (= lt!120764 (lemmaInListMapThenSeekEntryOrOpenFindsIt!327 (_keys!6535 thiss!1504) (_values!4416 thiss!1504) (mask!10475 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) key!932 (defaultEntry!4433 thiss!1504)))))

(assert (=> b!239063 false))

(declare-fun b!239064 () Bool)

(assert (=> b!239064 (= e!155200 (not call!22211))))

(declare-fun mapNonEmpty!10656 () Bool)

(declare-fun tp!22466 () Bool)

(assert (=> mapNonEmpty!10656 (= mapRes!10656 (and tp!22466 e!155205))))

(declare-fun mapValue!10656 () ValueCell!2798)

(declare-fun mapRest!10656 () (Array (_ BitVec 32) ValueCell!2798))

(declare-fun mapKey!10656 () (_ BitVec 32))

(assert (=> mapNonEmpty!10656 (= (arr!5623 (_values!4416 thiss!1504)) (store mapRest!10656 mapKey!10656 mapValue!10656))))

(declare-fun b!239065 () Bool)

(declare-fun lt!120762 () Unit!7321)

(assert (=> b!239065 (= e!155201 lt!120762)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!320 (array!11845 array!11843 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 64) Int) Unit!7321)

(assert (=> b!239065 (= lt!120762 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!320 (_keys!6535 thiss!1504) (_values!4416 thiss!1504) (mask!10475 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) key!932 (defaultEntry!4433 thiss!1504)))))

(assert (=> b!239065 (= c!39861 ((_ is MissingZero!995) lt!120763))))

(assert (=> b!239065 e!155208))

(declare-fun b!239066 () Bool)

(assert (=> b!239066 (= e!155199 e!155209)))

(declare-fun res!117151 () Bool)

(assert (=> b!239066 (=> (not res!117151) (not e!155209))))

(assert (=> b!239066 (= res!117151 (or (= lt!120763 (MissingZero!995 index!297)) (= lt!120763 (MissingVacant!995 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11845 (_ BitVec 32)) SeekEntryResult!995)

(assert (=> b!239066 (= lt!120763 (seekEntryOrOpen!0 key!932 (_keys!6535 thiss!1504) (mask!10475 thiss!1504)))))

(assert (= (and start!22922 res!117152) b!239052))

(assert (= (and b!239052 res!117149) b!239066))

(assert (= (and b!239066 res!117151) b!239061))

(assert (= (and b!239061 c!39859) b!239063))

(assert (= (and b!239061 (not c!39859)) b!239065))

(assert (= (and b!239065 c!39861) b!239053))

(assert (= (and b!239065 (not c!39861)) b!239060))

(assert (= (and b!239053 res!117156) b!239062))

(assert (= (and b!239062 res!117153) b!239057))

(assert (= (and b!239060 c!39860) b!239047))

(assert (= (and b!239060 (not c!39860)) b!239058))

(assert (= (and b!239047 res!117154) b!239051))

(assert (= (and b!239051 res!117150) b!239064))

(assert (= (or b!239053 b!239047) bm!22209))

(assert (= (or b!239057 b!239064) bm!22208))

(assert (= (and b!239061 res!117155) b!239059))

(assert (= (and b!239059 res!117158) b!239056))

(assert (= (and b!239056 res!117157) b!239050))

(assert (= (and b!239055 condMapEmpty!10656) mapIsEmpty!10656))

(assert (= (and b!239055 (not condMapEmpty!10656)) mapNonEmpty!10656))

(assert (= (and mapNonEmpty!10656 ((_ is ValueCellFull!2798) mapValue!10656)) b!239048))

(assert (= (and b!239055 ((_ is ValueCellFull!2798) mapDefault!10656)) b!239054))

(assert (= b!239049 b!239055))

(assert (= start!22922 b!239049))

(declare-fun m!259471 () Bool)

(assert (=> b!239059 m!259471))

(declare-fun m!259473 () Bool)

(assert (=> b!239056 m!259473))

(declare-fun m!259475 () Bool)

(assert (=> b!239061 m!259475))

(declare-fun m!259477 () Bool)

(assert (=> b!239061 m!259477))

(assert (=> b!239061 m!259477))

(declare-fun m!259479 () Bool)

(assert (=> b!239061 m!259479))

(declare-fun m!259481 () Bool)

(assert (=> b!239063 m!259481))

(declare-fun m!259483 () Bool)

(assert (=> b!239051 m!259483))

(declare-fun m!259485 () Bool)

(assert (=> b!239066 m!259485))

(declare-fun m!259487 () Bool)

(assert (=> mapNonEmpty!10656 m!259487))

(declare-fun m!259489 () Bool)

(assert (=> start!22922 m!259489))

(declare-fun m!259491 () Bool)

(assert (=> bm!22209 m!259491))

(declare-fun m!259493 () Bool)

(assert (=> b!239065 m!259493))

(declare-fun m!259495 () Bool)

(assert (=> b!239049 m!259495))

(declare-fun m!259497 () Bool)

(assert (=> b!239049 m!259497))

(assert (=> bm!22208 m!259471))

(declare-fun m!259499 () Bool)

(assert (=> b!239062 m!259499))

(check-sat (not b!239049) (not b!239061) (not b_next!6421) (not b!239065) (not b!239056) (not mapNonEmpty!10656) b_and!13401 (not bm!22208) tp_is_empty!6283 (not start!22922) (not b!239066) (not b!239059) (not bm!22209) (not b!239063))
(check-sat b_and!13401 (not b_next!6421))
