; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89370 () Bool)

(assert start!89370)

(declare-fun b!1024349 () Bool)

(declare-fun b_free!20371 () Bool)

(declare-fun b_next!20371 () Bool)

(assert (=> b!1024349 (= b_free!20371 (not b_next!20371))))

(declare-fun tp!72159 () Bool)

(declare-fun b_and!32591 () Bool)

(assert (=> b!1024349 (= tp!72159 b_and!32591)))

(declare-fun b!1024344 () Bool)

(declare-fun e!577417 () Bool)

(declare-fun e!577412 () Bool)

(assert (=> b!1024344 (= e!577417 e!577412)))

(declare-fun res!685870 () Bool)

(assert (=> b!1024344 (=> (not res!685870) (not e!577412))))

(declare-datatypes ((SeekEntryResult!9590 0))(
  ( (MissingZero!9590 (index!40731 (_ BitVec 32))) (Found!9590 (index!40732 (_ BitVec 32))) (Intermediate!9590 (undefined!10402 Bool) (index!40733 (_ BitVec 32)) (x!91081 (_ BitVec 32))) (Undefined!9590) (MissingVacant!9590 (index!40734 (_ BitVec 32))) )
))
(declare-fun lt!450432 () SeekEntryResult!9590)

(get-info :version)

(assert (=> b!1024344 (= res!685870 ((_ is Found!9590) lt!450432))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!36995 0))(
  ( (V!36996 (val!12096 Int)) )
))
(declare-datatypes ((ValueCell!11342 0))(
  ( (ValueCellFull!11342 (v!14664 V!36995)) (EmptyCell!11342) )
))
(declare-datatypes ((array!64171 0))(
  ( (array!64172 (arr!30894 (Array (_ BitVec 32) (_ BitVec 64))) (size!31409 (_ BitVec 32))) )
))
(declare-datatypes ((array!64173 0))(
  ( (array!64174 (arr!30895 (Array (_ BitVec 32) ValueCell!11342)) (size!31410 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5278 0))(
  ( (LongMapFixedSize!5279 (defaultEntry!5991 Int) (mask!29638 (_ BitVec 32)) (extraKeys!5723 (_ BitVec 32)) (zeroValue!5827 V!36995) (minValue!5827 V!36995) (_size!2694 (_ BitVec 32)) (_keys!11134 array!64171) (_values!6014 array!64173) (_vacant!2694 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5278)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64171 (_ BitVec 32)) SeekEntryResult!9590)

(assert (=> b!1024344 (= lt!450432 (seekEntry!0 key!909 (_keys!11134 thiss!1427) (mask!29638 thiss!1427)))))

(declare-fun b!1024345 () Bool)

(declare-fun res!685868 () Bool)

(assert (=> b!1024345 (=> (not res!685868) (not e!577417))))

(assert (=> b!1024345 (= res!685868 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024347 () Bool)

(declare-fun res!685865 () Bool)

(declare-fun e!577416 () Bool)

(assert (=> b!1024347 (=> res!685865 e!577416)))

(declare-datatypes ((List!21763 0))(
  ( (Nil!21760) (Cons!21759 (h!22957 (_ BitVec 64)) (t!30816 List!21763)) )
))
(declare-fun noDuplicate!1471 (List!21763) Bool)

(assert (=> b!1024347 (= res!685865 (not (noDuplicate!1471 Nil!21760)))))

(declare-fun b!1024348 () Bool)

(declare-fun e!577414 () Bool)

(declare-fun tp_is_empty!24091 () Bool)

(assert (=> b!1024348 (= e!577414 tp_is_empty!24091)))

(declare-fun e!577419 () Bool)

(declare-fun e!577415 () Bool)

(declare-fun array_inv!23943 (array!64171) Bool)

(declare-fun array_inv!23944 (array!64173) Bool)

(assert (=> b!1024349 (= e!577419 (and tp!72159 tp_is_empty!24091 (array_inv!23943 (_keys!11134 thiss!1427)) (array_inv!23944 (_values!6014 thiss!1427)) e!577415))))

(declare-fun b!1024350 () Bool)

(declare-fun e!577418 () Bool)

(declare-fun mapRes!37565 () Bool)

(assert (=> b!1024350 (= e!577415 (and e!577418 mapRes!37565))))

(declare-fun condMapEmpty!37565 () Bool)

(declare-fun mapDefault!37565 () ValueCell!11342)

(assert (=> b!1024350 (= condMapEmpty!37565 (= (arr!30895 (_values!6014 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11342)) mapDefault!37565)))))

(declare-fun b!1024351 () Bool)

(assert (=> b!1024351 (= e!577412 (not e!577416))))

(declare-fun res!685864 () Bool)

(assert (=> b!1024351 (=> res!685864 e!577416)))

(assert (=> b!1024351 (= res!685864 (or (bvsge (size!31409 (_keys!11134 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31409 (_keys!11134 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64171 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024351 (= (arrayCountValidKeys!0 (array!64172 (store (arr!30894 (_keys!11134 thiss!1427)) (index!40732 lt!450432) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31409 (_keys!11134 thiss!1427))) #b00000000000000000000000000000000 (size!31409 (_keys!11134 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11134 thiss!1427) #b00000000000000000000000000000000 (size!31409 (_keys!11134 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33253 0))(
  ( (Unit!33254) )
))
(declare-fun lt!450431 () Unit!33253)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64171 (_ BitVec 32) (_ BitVec 64)) Unit!33253)

(assert (=> b!1024351 (= lt!450431 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11134 thiss!1427) (index!40732 lt!450432) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37565 () Bool)

(assert (=> mapIsEmpty!37565 mapRes!37565))

(declare-fun mapNonEmpty!37565 () Bool)

(declare-fun tp!72158 () Bool)

(assert (=> mapNonEmpty!37565 (= mapRes!37565 (and tp!72158 e!577414))))

(declare-fun mapValue!37565 () ValueCell!11342)

(declare-fun mapRest!37565 () (Array (_ BitVec 32) ValueCell!11342))

(declare-fun mapKey!37565 () (_ BitVec 32))

(assert (=> mapNonEmpty!37565 (= (arr!30895 (_values!6014 thiss!1427)) (store mapRest!37565 mapKey!37565 mapValue!37565))))

(declare-fun b!1024352 () Bool)

(assert (=> b!1024352 (= e!577418 tp_is_empty!24091)))

(declare-fun b!1024353 () Bool)

(declare-fun res!685869 () Bool)

(assert (=> b!1024353 (=> res!685869 e!577416)))

(declare-fun contains!5925 (List!21763 (_ BitVec 64)) Bool)

(assert (=> b!1024353 (= res!685869 (contains!5925 Nil!21760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024354 () Bool)

(assert (=> b!1024354 (= e!577416 true)))

(declare-fun lt!450433 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64171 (_ BitVec 32) List!21763) Bool)

(assert (=> b!1024354 (= lt!450433 (arrayNoDuplicates!0 (_keys!11134 thiss!1427) #b00000000000000000000000000000000 Nil!21760))))

(declare-fun res!685867 () Bool)

(assert (=> start!89370 (=> (not res!685867) (not e!577417))))

(declare-fun valid!2003 (LongMapFixedSize!5278) Bool)

(assert (=> start!89370 (= res!685867 (valid!2003 thiss!1427))))

(assert (=> start!89370 e!577417))

(assert (=> start!89370 e!577419))

(assert (=> start!89370 true))

(declare-fun b!1024346 () Bool)

(declare-fun res!685866 () Bool)

(assert (=> b!1024346 (=> res!685866 e!577416)))

(assert (=> b!1024346 (= res!685866 (contains!5925 Nil!21760 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89370 res!685867) b!1024345))

(assert (= (and b!1024345 res!685868) b!1024344))

(assert (= (and b!1024344 res!685870) b!1024351))

(assert (= (and b!1024351 (not res!685864)) b!1024347))

(assert (= (and b!1024347 (not res!685865)) b!1024353))

(assert (= (and b!1024353 (not res!685869)) b!1024346))

(assert (= (and b!1024346 (not res!685866)) b!1024354))

(assert (= (and b!1024350 condMapEmpty!37565) mapIsEmpty!37565))

(assert (= (and b!1024350 (not condMapEmpty!37565)) mapNonEmpty!37565))

(assert (= (and mapNonEmpty!37565 ((_ is ValueCellFull!11342) mapValue!37565)) b!1024348))

(assert (= (and b!1024350 ((_ is ValueCellFull!11342) mapDefault!37565)) b!1024352))

(assert (= b!1024349 b!1024350))

(assert (= start!89370 b!1024349))

(declare-fun m!942209 () Bool)

(assert (=> mapNonEmpty!37565 m!942209))

(declare-fun m!942211 () Bool)

(assert (=> b!1024346 m!942211))

(declare-fun m!942213 () Bool)

(assert (=> b!1024344 m!942213))

(declare-fun m!942215 () Bool)

(assert (=> b!1024353 m!942215))

(declare-fun m!942217 () Bool)

(assert (=> b!1024351 m!942217))

(declare-fun m!942219 () Bool)

(assert (=> b!1024351 m!942219))

(declare-fun m!942221 () Bool)

(assert (=> b!1024351 m!942221))

(declare-fun m!942223 () Bool)

(assert (=> b!1024351 m!942223))

(declare-fun m!942225 () Bool)

(assert (=> b!1024349 m!942225))

(declare-fun m!942227 () Bool)

(assert (=> b!1024349 m!942227))

(declare-fun m!942229 () Bool)

(assert (=> start!89370 m!942229))

(declare-fun m!942231 () Bool)

(assert (=> b!1024354 m!942231))

(declare-fun m!942233 () Bool)

(assert (=> b!1024347 m!942233))

(check-sat (not b!1024346) (not mapNonEmpty!37565) (not b!1024351) b_and!32591 tp_is_empty!24091 (not b!1024354) (not b!1024347) (not b!1024349) (not start!89370) (not b!1024353) (not b_next!20371) (not b!1024344))
(check-sat b_and!32591 (not b_next!20371))
