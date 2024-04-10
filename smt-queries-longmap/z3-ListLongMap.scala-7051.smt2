; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89362 () Bool)

(assert start!89362)

(declare-fun b!1024331 () Bool)

(declare-fun b_free!20361 () Bool)

(declare-fun b_next!20361 () Bool)

(assert (=> b!1024331 (= b_free!20361 (not b_next!20361))))

(declare-fun tp!72128 () Bool)

(declare-fun b_and!32607 () Bool)

(assert (=> b!1024331 (= tp!72128 b_and!32607)))

(declare-fun b!1024330 () Bool)

(declare-fun e!577386 () Bool)

(declare-fun e!577385 () Bool)

(declare-fun mapRes!37550 () Bool)

(assert (=> b!1024330 (= e!577386 (and e!577385 mapRes!37550))))

(declare-fun condMapEmpty!37550 () Bool)

(declare-datatypes ((V!36981 0))(
  ( (V!36982 (val!12091 Int)) )
))
(declare-datatypes ((ValueCell!11337 0))(
  ( (ValueCellFull!11337 (v!14660 V!36981)) (EmptyCell!11337) )
))
(declare-datatypes ((array!64212 0))(
  ( (array!64213 (arr!30915 (Array (_ BitVec 32) (_ BitVec 64))) (size!31428 (_ BitVec 32))) )
))
(declare-datatypes ((array!64214 0))(
  ( (array!64215 (arr!30916 (Array (_ BitVec 32) ValueCell!11337)) (size!31429 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5268 0))(
  ( (LongMapFixedSize!5269 (defaultEntry!5986 Int) (mask!29634 (_ BitVec 32)) (extraKeys!5718 (_ BitVec 32)) (zeroValue!5822 V!36981) (minValue!5822 V!36981) (_size!2689 (_ BitVec 32)) (_keys!11133 array!64212) (_values!6009 array!64214) (_vacant!2689 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5268)

(declare-fun mapDefault!37550 () ValueCell!11337)

(assert (=> b!1024330 (= condMapEmpty!37550 (= (arr!30916 (_values!6009 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11337)) mapDefault!37550)))))

(declare-fun mapIsEmpty!37550 () Bool)

(assert (=> mapIsEmpty!37550 mapRes!37550))

(declare-fun b!1024332 () Bool)

(declare-fun e!577387 () Bool)

(declare-fun e!577388 () Bool)

(assert (=> b!1024332 (= e!577387 e!577388)))

(declare-fun res!685828 () Bool)

(assert (=> b!1024332 (=> (not res!685828) (not e!577388))))

(declare-datatypes ((SeekEntryResult!9592 0))(
  ( (MissingZero!9592 (index!40739 (_ BitVec 32))) (Found!9592 (index!40740 (_ BitVec 32))) (Intermediate!9592 (undefined!10404 Bool) (index!40741 (_ BitVec 32)) (x!91070 (_ BitVec 32))) (Undefined!9592) (MissingVacant!9592 (index!40742 (_ BitVec 32))) )
))
(declare-fun lt!450587 () SeekEntryResult!9592)

(get-info :version)

(assert (=> b!1024332 (= res!685828 ((_ is Found!9592) lt!450587))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64212 (_ BitVec 32)) SeekEntryResult!9592)

(assert (=> b!1024332 (= lt!450587 (seekEntry!0 key!909 (_keys!11133 thiss!1427) (mask!29634 thiss!1427)))))

(declare-fun mapNonEmpty!37550 () Bool)

(declare-fun tp!72129 () Bool)

(declare-fun e!577390 () Bool)

(assert (=> mapNonEmpty!37550 (= mapRes!37550 (and tp!72129 e!577390))))

(declare-fun mapKey!37550 () (_ BitVec 32))

(declare-fun mapValue!37550 () ValueCell!11337)

(declare-fun mapRest!37550 () (Array (_ BitVec 32) ValueCell!11337))

(assert (=> mapNonEmpty!37550 (= (arr!30916 (_values!6009 thiss!1427)) (store mapRest!37550 mapKey!37550 mapValue!37550))))

(declare-fun b!1024333 () Bool)

(declare-fun e!577383 () Bool)

(assert (=> b!1024333 (= e!577383 true)))

(declare-fun lt!450588 () Bool)

(declare-datatypes ((List!21727 0))(
  ( (Nil!21724) (Cons!21723 (h!22921 (_ BitVec 64)) (t!30789 List!21727)) )
))
(declare-fun arrayNoDuplicates!0 (array!64212 (_ BitVec 32) List!21727) Bool)

(assert (=> b!1024333 (= lt!450588 (arrayNoDuplicates!0 (_keys!11133 thiss!1427) #b00000000000000000000000000000000 Nil!21724))))

(declare-fun b!1024334 () Bool)

(declare-fun res!685830 () Bool)

(assert (=> b!1024334 (=> res!685830 e!577383)))

(declare-fun contains!5943 (List!21727 (_ BitVec 64)) Bool)

(assert (=> b!1024334 (= res!685830 (contains!5943 Nil!21724 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024335 () Bool)

(declare-fun tp_is_empty!24081 () Bool)

(assert (=> b!1024335 (= e!577390 tp_is_empty!24081)))

(declare-fun b!1024336 () Bool)

(declare-fun res!685831 () Bool)

(assert (=> b!1024336 (=> res!685831 e!577383)))

(declare-fun noDuplicate!1460 (List!21727) Bool)

(assert (=> b!1024336 (= res!685831 (not (noDuplicate!1460 Nil!21724)))))

(declare-fun b!1024337 () Bool)

(declare-fun res!685826 () Bool)

(assert (=> b!1024337 (=> res!685826 e!577383)))

(assert (=> b!1024337 (= res!685826 (contains!5943 Nil!21724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024338 () Bool)

(declare-fun res!685827 () Bool)

(assert (=> b!1024338 (=> (not res!685827) (not e!577387))))

(assert (=> b!1024338 (= res!685827 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024339 () Bool)

(assert (=> b!1024339 (= e!577385 tp_is_empty!24081)))

(declare-fun b!1024340 () Bool)

(assert (=> b!1024340 (= e!577388 (not e!577383))))

(declare-fun res!685832 () Bool)

(assert (=> b!1024340 (=> res!685832 e!577383)))

(assert (=> b!1024340 (= res!685832 (or (bvsge (size!31428 (_keys!11133 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31428 (_keys!11133 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64212 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024340 (= (arrayCountValidKeys!0 (array!64213 (store (arr!30915 (_keys!11133 thiss!1427)) (index!40740 lt!450587) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31428 (_keys!11133 thiss!1427))) #b00000000000000000000000000000000 (size!31428 (_keys!11133 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11133 thiss!1427) #b00000000000000000000000000000000 (size!31428 (_keys!11133 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33345 0))(
  ( (Unit!33346) )
))
(declare-fun lt!450586 () Unit!33345)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64212 (_ BitVec 32) (_ BitVec 64)) Unit!33345)

(assert (=> b!1024340 (= lt!450586 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11133 thiss!1427) (index!40740 lt!450587) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!685829 () Bool)

(assert (=> start!89362 (=> (not res!685829) (not e!577387))))

(declare-fun valid!2005 (LongMapFixedSize!5268) Bool)

(assert (=> start!89362 (= res!685829 (valid!2005 thiss!1427))))

(assert (=> start!89362 e!577387))

(declare-fun e!577384 () Bool)

(assert (=> start!89362 e!577384))

(assert (=> start!89362 true))

(declare-fun array_inv!23949 (array!64212) Bool)

(declare-fun array_inv!23950 (array!64214) Bool)

(assert (=> b!1024331 (= e!577384 (and tp!72128 tp_is_empty!24081 (array_inv!23949 (_keys!11133 thiss!1427)) (array_inv!23950 (_values!6009 thiss!1427)) e!577386))))

(assert (= (and start!89362 res!685829) b!1024338))

(assert (= (and b!1024338 res!685827) b!1024332))

(assert (= (and b!1024332 res!685828) b!1024340))

(assert (= (and b!1024340 (not res!685832)) b!1024336))

(assert (= (and b!1024336 (not res!685831)) b!1024337))

(assert (= (and b!1024337 (not res!685826)) b!1024334))

(assert (= (and b!1024334 (not res!685830)) b!1024333))

(assert (= (and b!1024330 condMapEmpty!37550) mapIsEmpty!37550))

(assert (= (and b!1024330 (not condMapEmpty!37550)) mapNonEmpty!37550))

(assert (= (and mapNonEmpty!37550 ((_ is ValueCellFull!11337) mapValue!37550)) b!1024335))

(assert (= (and b!1024330 ((_ is ValueCellFull!11337) mapDefault!37550)) b!1024339))

(assert (= b!1024331 b!1024330))

(assert (= start!89362 b!1024331))

(declare-fun m!942699 () Bool)

(assert (=> b!1024331 m!942699))

(declare-fun m!942701 () Bool)

(assert (=> b!1024331 m!942701))

(declare-fun m!942703 () Bool)

(assert (=> b!1024337 m!942703))

(declare-fun m!942705 () Bool)

(assert (=> mapNonEmpty!37550 m!942705))

(declare-fun m!942707 () Bool)

(assert (=> b!1024334 m!942707))

(declare-fun m!942709 () Bool)

(assert (=> b!1024340 m!942709))

(declare-fun m!942711 () Bool)

(assert (=> b!1024340 m!942711))

(declare-fun m!942713 () Bool)

(assert (=> b!1024340 m!942713))

(declare-fun m!942715 () Bool)

(assert (=> b!1024340 m!942715))

(declare-fun m!942717 () Bool)

(assert (=> b!1024336 m!942717))

(declare-fun m!942719 () Bool)

(assert (=> b!1024333 m!942719))

(declare-fun m!942721 () Bool)

(assert (=> b!1024332 m!942721))

(declare-fun m!942723 () Bool)

(assert (=> start!89362 m!942723))

(check-sat (not mapNonEmpty!37550) b_and!32607 (not b!1024337) (not b!1024332) (not start!89362) (not b!1024340) (not b!1024333) (not b!1024334) (not b!1024336) (not b_next!20361) (not b!1024331) tp_is_empty!24081)
(check-sat b_and!32607 (not b_next!20361))
