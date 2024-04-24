; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89660 () Bool)

(assert start!89660)

(declare-fun b!1026704 () Bool)

(declare-fun b_free!20425 () Bool)

(declare-fun b_next!20425 () Bool)

(assert (=> b!1026704 (= b_free!20425 (not b_next!20425))))

(declare-fun tp!72321 () Bool)

(declare-fun b_and!32681 () Bool)

(assert (=> b!1026704 (= tp!72321 b_and!32681)))

(declare-fun b!1026701 () Bool)

(declare-fun res!687010 () Bool)

(declare-fun e!578997 () Bool)

(assert (=> b!1026701 (=> (not res!687010) (not e!578997))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026701 (= res!687010 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37646 () Bool)

(declare-fun mapRes!37646 () Bool)

(assert (=> mapIsEmpty!37646 mapRes!37646))

(declare-fun b!1026702 () Bool)

(declare-fun res!687012 () Bool)

(declare-fun e!578998 () Bool)

(assert (=> b!1026702 (=> res!687012 e!578998)))

(declare-datatypes ((V!37067 0))(
  ( (V!37068 (val!12123 Int)) )
))
(declare-datatypes ((ValueCell!11369 0))(
  ( (ValueCellFull!11369 (v!14688 V!37067)) (EmptyCell!11369) )
))
(declare-datatypes ((array!64389 0))(
  ( (array!64390 (arr!30997 (Array (_ BitVec 32) (_ BitVec 64))) (size!31511 (_ BitVec 32))) )
))
(declare-datatypes ((array!64391 0))(
  ( (array!64392 (arr!30998 (Array (_ BitVec 32) ValueCell!11369)) (size!31512 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5332 0))(
  ( (LongMapFixedSize!5333 (defaultEntry!6018 Int) (mask!29748 (_ BitVec 32)) (extraKeys!5750 (_ BitVec 32)) (zeroValue!5854 V!37067) (minValue!5854 V!37067) (_size!2721 (_ BitVec 32)) (_keys!11203 array!64389) (_values!6041 array!64391) (_vacant!2721 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5332)

(declare-datatypes ((List!21739 0))(
  ( (Nil!21736) (Cons!21735 (h!22942 (_ BitVec 64)) (t!30793 List!21739)) )
))
(declare-fun arrayNoDuplicates!0 (array!64389 (_ BitVec 32) List!21739) Bool)

(assert (=> b!1026702 (= res!687012 (not (arrayNoDuplicates!0 (_keys!11203 thiss!1427) #b00000000000000000000000000000000 Nil!21736)))))

(declare-fun b!1026703 () Bool)

(declare-fun res!687014 () Bool)

(assert (=> b!1026703 (=> res!687014 e!578998)))

(declare-datatypes ((SeekEntryResult!9574 0))(
  ( (MissingZero!9574 (index!40667 (_ BitVec 32))) (Found!9574 (index!40668 (_ BitVec 32))) (Intermediate!9574 (undefined!10386 Bool) (index!40669 (_ BitVec 32)) (x!91162 (_ BitVec 32))) (Undefined!9574) (MissingVacant!9574 (index!40670 (_ BitVec 32))) )
))
(declare-fun lt!451430 () SeekEntryResult!9574)

(assert (=> b!1026703 (= res!687014 (or (not (= (size!31511 (_keys!11203 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29748 thiss!1427)))) (bvslt (index!40668 lt!451430) #b00000000000000000000000000000000) (bvsge (index!40668 lt!451430) (size!31511 (_keys!11203 thiss!1427)))))))

(declare-fun mapNonEmpty!37646 () Bool)

(declare-fun tp!72320 () Bool)

(declare-fun e!578994 () Bool)

(assert (=> mapNonEmpty!37646 (= mapRes!37646 (and tp!72320 e!578994))))

(declare-fun mapValue!37646 () ValueCell!11369)

(declare-fun mapKey!37646 () (_ BitVec 32))

(declare-fun mapRest!37646 () (Array (_ BitVec 32) ValueCell!11369))

(assert (=> mapNonEmpty!37646 (= (arr!30998 (_values!6041 thiss!1427)) (store mapRest!37646 mapKey!37646 mapValue!37646))))

(declare-fun e!578996 () Bool)

(declare-fun e!578995 () Bool)

(declare-fun tp_is_empty!24145 () Bool)

(declare-fun array_inv!24027 (array!64389) Bool)

(declare-fun array_inv!24028 (array!64391) Bool)

(assert (=> b!1026704 (= e!578996 (and tp!72321 tp_is_empty!24145 (array_inv!24027 (_keys!11203 thiss!1427)) (array_inv!24028 (_values!6041 thiss!1427)) e!578995))))

(declare-fun res!687013 () Bool)

(assert (=> start!89660 (=> (not res!687013) (not e!578997))))

(declare-fun valid!2033 (LongMapFixedSize!5332) Bool)

(assert (=> start!89660 (= res!687013 (valid!2033 thiss!1427))))

(assert (=> start!89660 e!578997))

(assert (=> start!89660 e!578996))

(assert (=> start!89660 true))

(declare-fun b!1026705 () Bool)

(assert (=> b!1026705 (= e!578994 tp_is_empty!24145)))

(declare-fun b!1026706 () Bool)

(declare-fun e!579001 () Bool)

(assert (=> b!1026706 (= e!579001 tp_is_empty!24145)))

(declare-fun b!1026707 () Bool)

(declare-fun e!578999 () Bool)

(assert (=> b!1026707 (= e!578999 (not e!578998))))

(declare-fun res!687011 () Bool)

(assert (=> b!1026707 (=> res!687011 e!578998)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026707 (= res!687011 (not (validMask!0 (mask!29748 thiss!1427))))))

(declare-fun lt!451432 () array!64389)

(assert (=> b!1026707 (arrayNoDuplicates!0 lt!451432 #b00000000000000000000000000000000 Nil!21736)))

(declare-datatypes ((Unit!33398 0))(
  ( (Unit!33399) )
))
(declare-fun lt!451429 () Unit!33398)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21739) Unit!33398)

(assert (=> b!1026707 (= lt!451429 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11203 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40668 lt!451430) #b00000000000000000000000000000000 Nil!21736))))

(declare-fun arrayCountValidKeys!0 (array!64389 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026707 (= (arrayCountValidKeys!0 lt!451432 #b00000000000000000000000000000000 (size!31511 (_keys!11203 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11203 thiss!1427) #b00000000000000000000000000000000 (size!31511 (_keys!11203 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026707 (= lt!451432 (array!64390 (store (arr!30997 (_keys!11203 thiss!1427)) (index!40668 lt!451430) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31511 (_keys!11203 thiss!1427))))))

(declare-fun lt!451431 () Unit!33398)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64389 (_ BitVec 32) (_ BitVec 64)) Unit!33398)

(assert (=> b!1026707 (= lt!451431 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11203 thiss!1427) (index!40668 lt!451430) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026708 () Bool)

(assert (=> b!1026708 (= e!578995 (and e!579001 mapRes!37646))))

(declare-fun condMapEmpty!37646 () Bool)

(declare-fun mapDefault!37646 () ValueCell!11369)

(assert (=> b!1026708 (= condMapEmpty!37646 (= (arr!30998 (_values!6041 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11369)) mapDefault!37646)))))

(declare-fun b!1026709 () Bool)

(declare-fun res!687009 () Bool)

(assert (=> b!1026709 (=> res!687009 e!578998)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1026709 (= res!687009 (not (validKeyInArray!0 (select (arr!30997 (_keys!11203 thiss!1427)) (index!40668 lt!451430)))))))

(declare-fun b!1026710 () Bool)

(assert (=> b!1026710 (= e!578997 e!578999)))

(declare-fun res!687008 () Bool)

(assert (=> b!1026710 (=> (not res!687008) (not e!578999))))

(get-info :version)

(assert (=> b!1026710 (= res!687008 ((_ is Found!9574) lt!451430))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64389 (_ BitVec 32)) SeekEntryResult!9574)

(assert (=> b!1026710 (= lt!451430 (seekEntry!0 key!909 (_keys!11203 thiss!1427) (mask!29748 thiss!1427)))))

(declare-fun b!1026711 () Bool)

(assert (=> b!1026711 (= e!578998 true)))

(declare-fun lt!451433 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64389 (_ BitVec 32)) Bool)

(assert (=> b!1026711 (= lt!451433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11203 thiss!1427) (mask!29748 thiss!1427)))))

(assert (= (and start!89660 res!687013) b!1026701))

(assert (= (and b!1026701 res!687010) b!1026710))

(assert (= (and b!1026710 res!687008) b!1026707))

(assert (= (and b!1026707 (not res!687011)) b!1026703))

(assert (= (and b!1026703 (not res!687014)) b!1026709))

(assert (= (and b!1026709 (not res!687009)) b!1026702))

(assert (= (and b!1026702 (not res!687012)) b!1026711))

(assert (= (and b!1026708 condMapEmpty!37646) mapIsEmpty!37646))

(assert (= (and b!1026708 (not condMapEmpty!37646)) mapNonEmpty!37646))

(assert (= (and mapNonEmpty!37646 ((_ is ValueCellFull!11369) mapValue!37646)) b!1026705))

(assert (= (and b!1026708 ((_ is ValueCellFull!11369) mapDefault!37646)) b!1026706))

(assert (= b!1026704 b!1026708))

(assert (= start!89660 b!1026704))

(declare-fun m!945231 () Bool)

(assert (=> b!1026710 m!945231))

(declare-fun m!945233 () Bool)

(assert (=> b!1026704 m!945233))

(declare-fun m!945235 () Bool)

(assert (=> b!1026704 m!945235))

(declare-fun m!945237 () Bool)

(assert (=> b!1026709 m!945237))

(assert (=> b!1026709 m!945237))

(declare-fun m!945239 () Bool)

(assert (=> b!1026709 m!945239))

(declare-fun m!945241 () Bool)

(assert (=> b!1026702 m!945241))

(declare-fun m!945243 () Bool)

(assert (=> b!1026711 m!945243))

(declare-fun m!945245 () Bool)

(assert (=> b!1026707 m!945245))

(declare-fun m!945247 () Bool)

(assert (=> b!1026707 m!945247))

(declare-fun m!945249 () Bool)

(assert (=> b!1026707 m!945249))

(declare-fun m!945251 () Bool)

(assert (=> b!1026707 m!945251))

(declare-fun m!945253 () Bool)

(assert (=> b!1026707 m!945253))

(declare-fun m!945255 () Bool)

(assert (=> b!1026707 m!945255))

(declare-fun m!945257 () Bool)

(assert (=> b!1026707 m!945257))

(declare-fun m!945259 () Bool)

(assert (=> mapNonEmpty!37646 m!945259))

(declare-fun m!945261 () Bool)

(assert (=> start!89660 m!945261))

(check-sat (not b!1026702) (not b!1026709) (not b!1026710) (not b!1026704) (not b!1026711) (not start!89660) (not b_next!20425) tp_is_empty!24145 (not b!1026707) b_and!32681 (not mapNonEmpty!37646))
(check-sat b_and!32681 (not b_next!20425))
