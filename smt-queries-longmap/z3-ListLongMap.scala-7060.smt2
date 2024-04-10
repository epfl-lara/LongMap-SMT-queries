; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89416 () Bool)

(assert start!89416)

(declare-fun b!1025231 () Bool)

(declare-fun b_free!20415 () Bool)

(declare-fun b_next!20415 () Bool)

(assert (=> b!1025231 (= b_free!20415 (not b_next!20415))))

(declare-fun tp!72291 () Bool)

(declare-fun b_and!32661 () Bool)

(assert (=> b!1025231 (= tp!72291 b_and!32661)))

(declare-fun b!1025221 () Bool)

(declare-fun res!686395 () Bool)

(declare-fun e!578038 () Bool)

(assert (=> b!1025221 (=> res!686395 e!578038)))

(declare-datatypes ((V!37053 0))(
  ( (V!37054 (val!12118 Int)) )
))
(declare-datatypes ((ValueCell!11364 0))(
  ( (ValueCellFull!11364 (v!14687 V!37053)) (EmptyCell!11364) )
))
(declare-datatypes ((array!64320 0))(
  ( (array!64321 (arr!30969 (Array (_ BitVec 32) (_ BitVec 64))) (size!31482 (_ BitVec 32))) )
))
(declare-datatypes ((array!64322 0))(
  ( (array!64323 (arr!30970 (Array (_ BitVec 32) ValueCell!11364)) (size!31483 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5322 0))(
  ( (LongMapFixedSize!5323 (defaultEntry!6013 Int) (mask!29679 (_ BitVec 32)) (extraKeys!5745 (_ BitVec 32)) (zeroValue!5849 V!37053) (minValue!5849 V!37053) (_size!2716 (_ BitVec 32)) (_keys!11160 array!64320) (_values!6036 array!64322) (_vacant!2716 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5322)

(declare-datatypes ((List!21747 0))(
  ( (Nil!21744) (Cons!21743 (h!22941 (_ BitVec 64)) (t!30809 List!21747)) )
))
(declare-fun arrayNoDuplicates!0 (array!64320 (_ BitVec 32) List!21747) Bool)

(assert (=> b!1025221 (= res!686395 (not (arrayNoDuplicates!0 (_keys!11160 thiss!1427) #b00000000000000000000000000000000 Nil!21744)))))

(declare-fun b!1025223 () Bool)

(declare-fun res!686396 () Bool)

(assert (=> b!1025223 (=> res!686396 e!578038)))

(declare-datatypes ((SeekEntryResult!9612 0))(
  ( (MissingZero!9612 (index!40819 (_ BitVec 32))) (Found!9612 (index!40820 (_ BitVec 32))) (Intermediate!9612 (undefined!10424 Bool) (index!40821 (_ BitVec 32)) (x!91162 (_ BitVec 32))) (Undefined!9612) (MissingVacant!9612 (index!40822 (_ BitVec 32))) )
))
(declare-fun lt!450840 () SeekEntryResult!9612)

(assert (=> b!1025223 (= res!686396 (or (not (= (size!31482 (_keys!11160 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29679 thiss!1427)))) (bvslt (index!40820 lt!450840) #b00000000000000000000000000000000) (bvsge (index!40820 lt!450840) (size!31482 (_keys!11160 thiss!1427)))))))

(declare-fun mapIsEmpty!37631 () Bool)

(declare-fun mapRes!37631 () Bool)

(assert (=> mapIsEmpty!37631 mapRes!37631))

(declare-fun b!1025224 () Bool)

(declare-fun e!578037 () Bool)

(declare-fun e!578034 () Bool)

(assert (=> b!1025224 (= e!578037 e!578034)))

(declare-fun res!686393 () Bool)

(assert (=> b!1025224 (=> (not res!686393) (not e!578034))))

(get-info :version)

(assert (=> b!1025224 (= res!686393 ((_ is Found!9612) lt!450840))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64320 (_ BitVec 32)) SeekEntryResult!9612)

(assert (=> b!1025224 (= lt!450840 (seekEntry!0 key!909 (_keys!11160 thiss!1427) (mask!29679 thiss!1427)))))

(declare-fun b!1025225 () Bool)

(declare-fun e!578032 () Bool)

(declare-fun tp_is_empty!24135 () Bool)

(assert (=> b!1025225 (= e!578032 tp_is_empty!24135)))

(declare-fun b!1025226 () Bool)

(assert (=> b!1025226 (= e!578034 (not e!578038))))

(declare-fun res!686394 () Bool)

(assert (=> b!1025226 (=> res!686394 e!578038)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025226 (= res!686394 (not (validMask!0 (mask!29679 thiss!1427))))))

(declare-fun lt!450841 () array!64320)

(assert (=> b!1025226 (arrayNoDuplicates!0 lt!450841 #b00000000000000000000000000000000 Nil!21744)))

(declare-datatypes ((Unit!33379 0))(
  ( (Unit!33380) )
))
(declare-fun lt!450839 () Unit!33379)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64320 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21747) Unit!33379)

(assert (=> b!1025226 (= lt!450839 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11160 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40820 lt!450840) #b00000000000000000000000000000000 Nil!21744))))

(declare-fun arrayCountValidKeys!0 (array!64320 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025226 (= (arrayCountValidKeys!0 lt!450841 #b00000000000000000000000000000000 (size!31482 (_keys!11160 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11160 thiss!1427) #b00000000000000000000000000000000 (size!31482 (_keys!11160 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025226 (= lt!450841 (array!64321 (store (arr!30969 (_keys!11160 thiss!1427)) (index!40820 lt!450840) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31482 (_keys!11160 thiss!1427))))))

(declare-fun lt!450842 () Unit!33379)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64320 (_ BitVec 32) (_ BitVec 64)) Unit!33379)

(assert (=> b!1025226 (= lt!450842 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11160 thiss!1427) (index!40820 lt!450840) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025222 () Bool)

(assert (=> b!1025222 (= e!578038 true)))

(declare-fun lt!450843 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64320 (_ BitVec 32)) Bool)

(assert (=> b!1025222 (= lt!450843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11160 thiss!1427) (mask!29679 thiss!1427)))))

(declare-fun res!686397 () Bool)

(assert (=> start!89416 (=> (not res!686397) (not e!578037))))

(declare-fun valid!2023 (LongMapFixedSize!5322) Bool)

(assert (=> start!89416 (= res!686397 (valid!2023 thiss!1427))))

(assert (=> start!89416 e!578037))

(declare-fun e!578031 () Bool)

(assert (=> start!89416 e!578031))

(assert (=> start!89416 true))

(declare-fun b!1025227 () Bool)

(declare-fun e!578036 () Bool)

(assert (=> b!1025227 (= e!578036 tp_is_empty!24135)))

(declare-fun mapNonEmpty!37631 () Bool)

(declare-fun tp!72290 () Bool)

(assert (=> mapNonEmpty!37631 (= mapRes!37631 (and tp!72290 e!578036))))

(declare-fun mapKey!37631 () (_ BitVec 32))

(declare-fun mapRest!37631 () (Array (_ BitVec 32) ValueCell!11364))

(declare-fun mapValue!37631 () ValueCell!11364)

(assert (=> mapNonEmpty!37631 (= (arr!30970 (_values!6036 thiss!1427)) (store mapRest!37631 mapKey!37631 mapValue!37631))))

(declare-fun b!1025228 () Bool)

(declare-fun res!686399 () Bool)

(assert (=> b!1025228 (=> (not res!686399) (not e!578037))))

(assert (=> b!1025228 (= res!686399 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025229 () Bool)

(declare-fun res!686398 () Bool)

(assert (=> b!1025229 (=> res!686398 e!578038)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025229 (= res!686398 (not (validKeyInArray!0 (select (arr!30969 (_keys!11160 thiss!1427)) (index!40820 lt!450840)))))))

(declare-fun b!1025230 () Bool)

(declare-fun e!578035 () Bool)

(assert (=> b!1025230 (= e!578035 (and e!578032 mapRes!37631))))

(declare-fun condMapEmpty!37631 () Bool)

(declare-fun mapDefault!37631 () ValueCell!11364)

(assert (=> b!1025230 (= condMapEmpty!37631 (= (arr!30970 (_values!6036 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11364)) mapDefault!37631)))))

(declare-fun array_inv!23985 (array!64320) Bool)

(declare-fun array_inv!23986 (array!64322) Bool)

(assert (=> b!1025231 (= e!578031 (and tp!72291 tp_is_empty!24135 (array_inv!23985 (_keys!11160 thiss!1427)) (array_inv!23986 (_values!6036 thiss!1427)) e!578035))))

(assert (= (and start!89416 res!686397) b!1025228))

(assert (= (and b!1025228 res!686399) b!1025224))

(assert (= (and b!1025224 res!686393) b!1025226))

(assert (= (and b!1025226 (not res!686394)) b!1025223))

(assert (= (and b!1025223 (not res!686396)) b!1025229))

(assert (= (and b!1025229 (not res!686398)) b!1025221))

(assert (= (and b!1025221 (not res!686395)) b!1025222))

(assert (= (and b!1025230 condMapEmpty!37631) mapIsEmpty!37631))

(assert (= (and b!1025230 (not condMapEmpty!37631)) mapNonEmpty!37631))

(assert (= (and mapNonEmpty!37631 ((_ is ValueCellFull!11364) mapValue!37631)) b!1025227))

(assert (= (and b!1025230 ((_ is ValueCellFull!11364) mapDefault!37631)) b!1025225))

(assert (= b!1025231 b!1025230))

(assert (= start!89416 b!1025231))

(declare-fun m!943407 () Bool)

(assert (=> start!89416 m!943407))

(declare-fun m!943409 () Bool)

(assert (=> mapNonEmpty!37631 m!943409))

(declare-fun m!943411 () Bool)

(assert (=> b!1025231 m!943411))

(declare-fun m!943413 () Bool)

(assert (=> b!1025231 m!943413))

(declare-fun m!943415 () Bool)

(assert (=> b!1025229 m!943415))

(assert (=> b!1025229 m!943415))

(declare-fun m!943417 () Bool)

(assert (=> b!1025229 m!943417))

(declare-fun m!943419 () Bool)

(assert (=> b!1025226 m!943419))

(declare-fun m!943421 () Bool)

(assert (=> b!1025226 m!943421))

(declare-fun m!943423 () Bool)

(assert (=> b!1025226 m!943423))

(declare-fun m!943425 () Bool)

(assert (=> b!1025226 m!943425))

(declare-fun m!943427 () Bool)

(assert (=> b!1025226 m!943427))

(declare-fun m!943429 () Bool)

(assert (=> b!1025226 m!943429))

(declare-fun m!943431 () Bool)

(assert (=> b!1025226 m!943431))

(declare-fun m!943433 () Bool)

(assert (=> b!1025222 m!943433))

(declare-fun m!943435 () Bool)

(assert (=> b!1025221 m!943435))

(declare-fun m!943437 () Bool)

(assert (=> b!1025224 m!943437))

(check-sat (not b!1025231) (not b_next!20415) tp_is_empty!24135 (not mapNonEmpty!37631) b_and!32661 (not b!1025226) (not b!1025222) (not start!89416) (not b!1025221) (not b!1025224) (not b!1025229))
(check-sat b_and!32661 (not b_next!20415))
