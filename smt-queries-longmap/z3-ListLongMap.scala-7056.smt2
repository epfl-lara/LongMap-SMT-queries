; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89388 () Bool)

(assert start!89388)

(declare-fun b!1024648 () Bool)

(declare-fun b_free!20389 () Bool)

(declare-fun b_next!20389 () Bool)

(assert (=> b!1024648 (= b_free!20389 (not b_next!20389))))

(declare-fun tp!72212 () Bool)

(declare-fun b_and!32609 () Bool)

(assert (=> b!1024648 (= tp!72212 b_and!32609)))

(declare-fun b!1024641 () Bool)

(declare-fun e!577629 () Bool)

(declare-fun e!577631 () Bool)

(assert (=> b!1024641 (= e!577629 (not e!577631))))

(declare-fun res!686055 () Bool)

(assert (=> b!1024641 (=> res!686055 e!577631)))

(declare-datatypes ((V!37019 0))(
  ( (V!37020 (val!12105 Int)) )
))
(declare-datatypes ((ValueCell!11351 0))(
  ( (ValueCellFull!11351 (v!14673 V!37019)) (EmptyCell!11351) )
))
(declare-datatypes ((array!64207 0))(
  ( (array!64208 (arr!30912 (Array (_ BitVec 32) (_ BitVec 64))) (size!31427 (_ BitVec 32))) )
))
(declare-datatypes ((array!64209 0))(
  ( (array!64210 (arr!30913 (Array (_ BitVec 32) ValueCell!11351)) (size!31428 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5296 0))(
  ( (LongMapFixedSize!5297 (defaultEntry!6000 Int) (mask!29653 (_ BitVec 32)) (extraKeys!5732 (_ BitVec 32)) (zeroValue!5836 V!37019) (minValue!5836 V!37019) (_size!2703 (_ BitVec 32)) (_keys!11143 array!64207) (_values!6023 array!64209) (_vacant!2703 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5296)

(assert (=> b!1024641 (= res!686055 (or (bvsge (size!31427 (_keys!11143 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31427 (_keys!11143 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9596 0))(
  ( (MissingZero!9596 (index!40755 (_ BitVec 32))) (Found!9596 (index!40756 (_ BitVec 32))) (Intermediate!9596 (undefined!10408 Bool) (index!40757 (_ BitVec 32)) (x!91111 (_ BitVec 32))) (Undefined!9596) (MissingVacant!9596 (index!40758 (_ BitVec 32))) )
))
(declare-fun lt!450514 () SeekEntryResult!9596)

(declare-fun arrayCountValidKeys!0 (array!64207 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024641 (= (arrayCountValidKeys!0 (array!64208 (store (arr!30912 (_keys!11143 thiss!1427)) (index!40756 lt!450514) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31427 (_keys!11143 thiss!1427))) #b00000000000000000000000000000000 (size!31427 (_keys!11143 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11143 thiss!1427) #b00000000000000000000000000000000 (size!31427 (_keys!11143 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33263 0))(
  ( (Unit!33264) )
))
(declare-fun lt!450513 () Unit!33263)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64207 (_ BitVec 32) (_ BitVec 64)) Unit!33263)

(assert (=> b!1024641 (= lt!450513 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11143 thiss!1427) (index!40756 lt!450514) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024642 () Bool)

(declare-fun res!686054 () Bool)

(assert (=> b!1024642 (=> res!686054 e!577631)))

(declare-datatypes ((List!21771 0))(
  ( (Nil!21768) (Cons!21767 (h!22965 (_ BitVec 64)) (t!30824 List!21771)) )
))
(declare-fun contains!5931 (List!21771 (_ BitVec 64)) Bool)

(assert (=> b!1024642 (= res!686054 (contains!5931 Nil!21768 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37592 () Bool)

(declare-fun mapRes!37592 () Bool)

(assert (=> mapIsEmpty!37592 mapRes!37592))

(declare-fun b!1024643 () Bool)

(declare-fun e!577628 () Bool)

(declare-fun tp_is_empty!24109 () Bool)

(assert (=> b!1024643 (= e!577628 tp_is_empty!24109)))

(declare-fun b!1024644 () Bool)

(declare-fun res!686057 () Bool)

(assert (=> b!1024644 (=> res!686057 e!577631)))

(declare-fun noDuplicate!1478 (List!21771) Bool)

(assert (=> b!1024644 (= res!686057 (not (noDuplicate!1478 Nil!21768)))))

(declare-fun b!1024645 () Bool)

(assert (=> b!1024645 (= e!577631 true)))

(declare-fun lt!450512 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64207 (_ BitVec 32) List!21771) Bool)

(assert (=> b!1024645 (= lt!450512 (arrayNoDuplicates!0 (_keys!11143 thiss!1427) #b00000000000000000000000000000000 Nil!21768))))

(declare-fun b!1024646 () Bool)

(declare-fun e!577630 () Bool)

(assert (=> b!1024646 (= e!577630 (and e!577628 mapRes!37592))))

(declare-fun condMapEmpty!37592 () Bool)

(declare-fun mapDefault!37592 () ValueCell!11351)

(assert (=> b!1024646 (= condMapEmpty!37592 (= (arr!30913 (_values!6023 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11351)) mapDefault!37592)))))

(declare-fun b!1024647 () Bool)

(declare-fun res!686058 () Bool)

(declare-fun e!577635 () Bool)

(assert (=> b!1024647 (=> (not res!686058) (not e!577635))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024647 (= res!686058 (not (= key!909 (bvneg key!909))))))

(declare-fun res!686056 () Bool)

(assert (=> start!89388 (=> (not res!686056) (not e!577635))))

(declare-fun valid!2008 (LongMapFixedSize!5296) Bool)

(assert (=> start!89388 (= res!686056 (valid!2008 thiss!1427))))

(assert (=> start!89388 e!577635))

(declare-fun e!577634 () Bool)

(assert (=> start!89388 e!577634))

(assert (=> start!89388 true))

(declare-fun array_inv!23955 (array!64207) Bool)

(declare-fun array_inv!23956 (array!64209) Bool)

(assert (=> b!1024648 (= e!577634 (and tp!72212 tp_is_empty!24109 (array_inv!23955 (_keys!11143 thiss!1427)) (array_inv!23956 (_values!6023 thiss!1427)) e!577630))))

(declare-fun b!1024649 () Bool)

(assert (=> b!1024649 (= e!577635 e!577629)))

(declare-fun res!686059 () Bool)

(assert (=> b!1024649 (=> (not res!686059) (not e!577629))))

(get-info :version)

(assert (=> b!1024649 (= res!686059 ((_ is Found!9596) lt!450514))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64207 (_ BitVec 32)) SeekEntryResult!9596)

(assert (=> b!1024649 (= lt!450514 (seekEntry!0 key!909 (_keys!11143 thiss!1427) (mask!29653 thiss!1427)))))

(declare-fun b!1024650 () Bool)

(declare-fun e!577633 () Bool)

(assert (=> b!1024650 (= e!577633 tp_is_empty!24109)))

(declare-fun b!1024651 () Bool)

(declare-fun res!686053 () Bool)

(assert (=> b!1024651 (=> res!686053 e!577631)))

(assert (=> b!1024651 (= res!686053 (contains!5931 Nil!21768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37592 () Bool)

(declare-fun tp!72213 () Bool)

(assert (=> mapNonEmpty!37592 (= mapRes!37592 (and tp!72213 e!577633))))

(declare-fun mapRest!37592 () (Array (_ BitVec 32) ValueCell!11351))

(declare-fun mapValue!37592 () ValueCell!11351)

(declare-fun mapKey!37592 () (_ BitVec 32))

(assert (=> mapNonEmpty!37592 (= (arr!30913 (_values!6023 thiss!1427)) (store mapRest!37592 mapKey!37592 mapValue!37592))))

(assert (= (and start!89388 res!686056) b!1024647))

(assert (= (and b!1024647 res!686058) b!1024649))

(assert (= (and b!1024649 res!686059) b!1024641))

(assert (= (and b!1024641 (not res!686055)) b!1024644))

(assert (= (and b!1024644 (not res!686057)) b!1024651))

(assert (= (and b!1024651 (not res!686053)) b!1024642))

(assert (= (and b!1024642 (not res!686054)) b!1024645))

(assert (= (and b!1024646 condMapEmpty!37592) mapIsEmpty!37592))

(assert (= (and b!1024646 (not condMapEmpty!37592)) mapNonEmpty!37592))

(assert (= (and mapNonEmpty!37592 ((_ is ValueCellFull!11351) mapValue!37592)) b!1024650))

(assert (= (and b!1024646 ((_ is ValueCellFull!11351) mapDefault!37592)) b!1024643))

(assert (= b!1024648 b!1024646))

(assert (= start!89388 b!1024648))

(declare-fun m!942443 () Bool)

(assert (=> b!1024642 m!942443))

(declare-fun m!942445 () Bool)

(assert (=> b!1024641 m!942445))

(declare-fun m!942447 () Bool)

(assert (=> b!1024641 m!942447))

(declare-fun m!942449 () Bool)

(assert (=> b!1024641 m!942449))

(declare-fun m!942451 () Bool)

(assert (=> b!1024641 m!942451))

(declare-fun m!942453 () Bool)

(assert (=> b!1024645 m!942453))

(declare-fun m!942455 () Bool)

(assert (=> start!89388 m!942455))

(declare-fun m!942457 () Bool)

(assert (=> b!1024649 m!942457))

(declare-fun m!942459 () Bool)

(assert (=> b!1024648 m!942459))

(declare-fun m!942461 () Bool)

(assert (=> b!1024648 m!942461))

(declare-fun m!942463 () Bool)

(assert (=> b!1024644 m!942463))

(declare-fun m!942465 () Bool)

(assert (=> mapNonEmpty!37592 m!942465))

(declare-fun m!942467 () Bool)

(assert (=> b!1024651 m!942467))

(check-sat (not start!89388) (not b!1024649) (not b!1024645) b_and!32609 (not b!1024644) (not b!1024648) (not b!1024651) (not b!1024641) (not b_next!20389) (not mapNonEmpty!37592) tp_is_empty!24109 (not b!1024642))
(check-sat b_and!32609 (not b_next!20389))
