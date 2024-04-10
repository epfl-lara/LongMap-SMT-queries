; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89368 () Bool)

(assert start!89368)

(declare-fun b!1024433 () Bool)

(declare-fun b_free!20367 () Bool)

(declare-fun b_next!20367 () Bool)

(assert (=> b!1024433 (= b_free!20367 (not b_next!20367))))

(declare-fun tp!72146 () Bool)

(declare-fun b_and!32613 () Bool)

(assert (=> b!1024433 (= tp!72146 b_and!32613)))

(declare-fun b!1024429 () Bool)

(declare-fun e!577461 () Bool)

(assert (=> b!1024429 (= e!577461 true)))

(declare-fun lt!450614 () Bool)

(declare-datatypes ((V!36989 0))(
  ( (V!36990 (val!12094 Int)) )
))
(declare-datatypes ((ValueCell!11340 0))(
  ( (ValueCellFull!11340 (v!14663 V!36989)) (EmptyCell!11340) )
))
(declare-datatypes ((array!64224 0))(
  ( (array!64225 (arr!30921 (Array (_ BitVec 32) (_ BitVec 64))) (size!31434 (_ BitVec 32))) )
))
(declare-datatypes ((array!64226 0))(
  ( (array!64227 (arr!30922 (Array (_ BitVec 32) ValueCell!11340)) (size!31435 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5274 0))(
  ( (LongMapFixedSize!5275 (defaultEntry!5989 Int) (mask!29639 (_ BitVec 32)) (extraKeys!5721 (_ BitVec 32)) (zeroValue!5825 V!36989) (minValue!5825 V!36989) (_size!2692 (_ BitVec 32)) (_keys!11136 array!64224) (_values!6012 array!64226) (_vacant!2692 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5274)

(declare-datatypes ((List!21730 0))(
  ( (Nil!21727) (Cons!21726 (h!22924 (_ BitVec 64)) (t!30792 List!21730)) )
))
(declare-fun arrayNoDuplicates!0 (array!64224 (_ BitVec 32) List!21730) Bool)

(assert (=> b!1024429 (= lt!450614 (arrayNoDuplicates!0 (_keys!11136 thiss!1427) #b00000000000000000000000000000000 Nil!21727))))

(declare-fun b!1024430 () Bool)

(declare-fun res!685891 () Bool)

(assert (=> b!1024430 (=> res!685891 e!577461)))

(declare-fun contains!5946 (List!21730 (_ BitVec 64)) Bool)

(assert (=> b!1024430 (= res!685891 (contains!5946 Nil!21727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37559 () Bool)

(declare-fun mapRes!37559 () Bool)

(assert (=> mapIsEmpty!37559 mapRes!37559))

(declare-fun res!685893 () Bool)

(declare-fun e!577462 () Bool)

(assert (=> start!89368 (=> (not res!685893) (not e!577462))))

(declare-fun valid!2008 (LongMapFixedSize!5274) Bool)

(assert (=> start!89368 (= res!685893 (valid!2008 thiss!1427))))

(assert (=> start!89368 e!577462))

(declare-fun e!577457 () Bool)

(assert (=> start!89368 e!577457))

(assert (=> start!89368 true))

(declare-fun b!1024431 () Bool)

(declare-fun res!685889 () Bool)

(assert (=> b!1024431 (=> res!685889 e!577461)))

(assert (=> b!1024431 (= res!685889 (contains!5946 Nil!21727 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024432 () Bool)

(declare-fun e!577458 () Bool)

(declare-fun tp_is_empty!24087 () Bool)

(assert (=> b!1024432 (= e!577458 tp_is_empty!24087)))

(declare-fun e!577459 () Bool)

(declare-fun array_inv!23955 (array!64224) Bool)

(declare-fun array_inv!23956 (array!64226) Bool)

(assert (=> b!1024433 (= e!577457 (and tp!72146 tp_is_empty!24087 (array_inv!23955 (_keys!11136 thiss!1427)) (array_inv!23956 (_values!6012 thiss!1427)) e!577459))))

(declare-fun b!1024434 () Bool)

(declare-fun res!685892 () Bool)

(assert (=> b!1024434 (=> (not res!685892) (not e!577462))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024434 (= res!685892 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37559 () Bool)

(declare-fun tp!72147 () Bool)

(declare-fun e!577460 () Bool)

(assert (=> mapNonEmpty!37559 (= mapRes!37559 (and tp!72147 e!577460))))

(declare-fun mapKey!37559 () (_ BitVec 32))

(declare-fun mapRest!37559 () (Array (_ BitVec 32) ValueCell!11340))

(declare-fun mapValue!37559 () ValueCell!11340)

(assert (=> mapNonEmpty!37559 (= (arr!30922 (_values!6012 thiss!1427)) (store mapRest!37559 mapKey!37559 mapValue!37559))))

(declare-fun b!1024435 () Bool)

(assert (=> b!1024435 (= e!577460 tp_is_empty!24087)))

(declare-fun b!1024436 () Bool)

(declare-fun res!685890 () Bool)

(assert (=> b!1024436 (=> res!685890 e!577461)))

(declare-fun noDuplicate!1463 (List!21730) Bool)

(assert (=> b!1024436 (= res!685890 (not (noDuplicate!1463 Nil!21727)))))

(declare-fun b!1024437 () Bool)

(declare-fun e!577455 () Bool)

(assert (=> b!1024437 (= e!577455 (not e!577461))))

(declare-fun res!685895 () Bool)

(assert (=> b!1024437 (=> res!685895 e!577461)))

(assert (=> b!1024437 (= res!685895 (or (bvsge (size!31434 (_keys!11136 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31434 (_keys!11136 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9595 0))(
  ( (MissingZero!9595 (index!40751 (_ BitVec 32))) (Found!9595 (index!40752 (_ BitVec 32))) (Intermediate!9595 (undefined!10407 Bool) (index!40753 (_ BitVec 32)) (x!91081 (_ BitVec 32))) (Undefined!9595) (MissingVacant!9595 (index!40754 (_ BitVec 32))) )
))
(declare-fun lt!450615 () SeekEntryResult!9595)

(declare-fun arrayCountValidKeys!0 (array!64224 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024437 (= (arrayCountValidKeys!0 (array!64225 (store (arr!30921 (_keys!11136 thiss!1427)) (index!40752 lt!450615) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31434 (_keys!11136 thiss!1427))) #b00000000000000000000000000000000 (size!31434 (_keys!11136 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11136 thiss!1427) #b00000000000000000000000000000000 (size!31434 (_keys!11136 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33351 0))(
  ( (Unit!33352) )
))
(declare-fun lt!450613 () Unit!33351)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64224 (_ BitVec 32) (_ BitVec 64)) Unit!33351)

(assert (=> b!1024437 (= lt!450613 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11136 thiss!1427) (index!40752 lt!450615) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024438 () Bool)

(assert (=> b!1024438 (= e!577459 (and e!577458 mapRes!37559))))

(declare-fun condMapEmpty!37559 () Bool)

(declare-fun mapDefault!37559 () ValueCell!11340)

(assert (=> b!1024438 (= condMapEmpty!37559 (= (arr!30922 (_values!6012 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11340)) mapDefault!37559)))))

(declare-fun b!1024439 () Bool)

(assert (=> b!1024439 (= e!577462 e!577455)))

(declare-fun res!685894 () Bool)

(assert (=> b!1024439 (=> (not res!685894) (not e!577455))))

(get-info :version)

(assert (=> b!1024439 (= res!685894 ((_ is Found!9595) lt!450615))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64224 (_ BitVec 32)) SeekEntryResult!9595)

(assert (=> b!1024439 (= lt!450615 (seekEntry!0 key!909 (_keys!11136 thiss!1427) (mask!29639 thiss!1427)))))

(assert (= (and start!89368 res!685893) b!1024434))

(assert (= (and b!1024434 res!685892) b!1024439))

(assert (= (and b!1024439 res!685894) b!1024437))

(assert (= (and b!1024437 (not res!685895)) b!1024436))

(assert (= (and b!1024436 (not res!685890)) b!1024430))

(assert (= (and b!1024430 (not res!685891)) b!1024431))

(assert (= (and b!1024431 (not res!685889)) b!1024429))

(assert (= (and b!1024438 condMapEmpty!37559) mapIsEmpty!37559))

(assert (= (and b!1024438 (not condMapEmpty!37559)) mapNonEmpty!37559))

(assert (= (and mapNonEmpty!37559 ((_ is ValueCellFull!11340) mapValue!37559)) b!1024435))

(assert (= (and b!1024438 ((_ is ValueCellFull!11340) mapDefault!37559)) b!1024432))

(assert (= b!1024433 b!1024438))

(assert (= start!89368 b!1024433))

(declare-fun m!942777 () Bool)

(assert (=> b!1024429 m!942777))

(declare-fun m!942779 () Bool)

(assert (=> b!1024437 m!942779))

(declare-fun m!942781 () Bool)

(assert (=> b!1024437 m!942781))

(declare-fun m!942783 () Bool)

(assert (=> b!1024437 m!942783))

(declare-fun m!942785 () Bool)

(assert (=> b!1024437 m!942785))

(declare-fun m!942787 () Bool)

(assert (=> b!1024439 m!942787))

(declare-fun m!942789 () Bool)

(assert (=> b!1024431 m!942789))

(declare-fun m!942791 () Bool)

(assert (=> start!89368 m!942791))

(declare-fun m!942793 () Bool)

(assert (=> b!1024436 m!942793))

(declare-fun m!942795 () Bool)

(assert (=> b!1024430 m!942795))

(declare-fun m!942797 () Bool)

(assert (=> mapNonEmpty!37559 m!942797))

(declare-fun m!942799 () Bool)

(assert (=> b!1024433 m!942799))

(declare-fun m!942801 () Bool)

(assert (=> b!1024433 m!942801))

(check-sat (not start!89368) tp_is_empty!24087 (not b!1024436) b_and!32613 (not b!1024437) (not b!1024429) (not b_next!20367) (not b!1024430) (not b!1024431) (not mapNonEmpty!37559) (not b!1024439) (not b!1024433))
(check-sat b_and!32613 (not b_next!20367))
