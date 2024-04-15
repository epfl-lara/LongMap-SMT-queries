; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89358 () Bool)

(assert start!89358)

(declare-fun b!1024152 () Bool)

(declare-fun b_free!20359 () Bool)

(declare-fun b_next!20359 () Bool)

(assert (=> b!1024152 (= b_free!20359 (not b_next!20359))))

(declare-fun tp!72122 () Bool)

(declare-fun b_and!32579 () Bool)

(assert (=> b!1024152 (= tp!72122 b_and!32579)))

(declare-fun b!1024146 () Bool)

(declare-fun e!577274 () Bool)

(assert (=> b!1024146 (= e!577274 true)))

(declare-fun lt!450378 () Bool)

(declare-datatypes ((V!36979 0))(
  ( (V!36980 (val!12090 Int)) )
))
(declare-datatypes ((ValueCell!11336 0))(
  ( (ValueCellFull!11336 (v!14658 V!36979)) (EmptyCell!11336) )
))
(declare-datatypes ((array!64147 0))(
  ( (array!64148 (arr!30882 (Array (_ BitVec 32) (_ BitVec 64))) (size!31397 (_ BitVec 32))) )
))
(declare-datatypes ((array!64149 0))(
  ( (array!64150 (arr!30883 (Array (_ BitVec 32) ValueCell!11336)) (size!31398 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5266 0))(
  ( (LongMapFixedSize!5267 (defaultEntry!5985 Int) (mask!29628 (_ BitVec 32)) (extraKeys!5717 (_ BitVec 32)) (zeroValue!5821 V!36979) (minValue!5821 V!36979) (_size!2688 (_ BitVec 32)) (_keys!11128 array!64147) (_values!6008 array!64149) (_vacant!2688 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5266)

(declare-datatypes ((List!21757 0))(
  ( (Nil!21754) (Cons!21753 (h!22951 (_ BitVec 64)) (t!30810 List!21757)) )
))
(declare-fun arrayNoDuplicates!0 (array!64147 (_ BitVec 32) List!21757) Bool)

(assert (=> b!1024146 (= lt!450378 (arrayNoDuplicates!0 (_keys!11128 thiss!1427) #b00000000000000000000000000000000 Nil!21754))))

(declare-fun b!1024147 () Bool)

(declare-fun res!685742 () Bool)

(declare-fun e!577269 () Bool)

(assert (=> b!1024147 (=> (not res!685742) (not e!577269))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024147 (= res!685742 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024148 () Bool)

(declare-fun res!685744 () Bool)

(assert (=> b!1024148 (=> res!685744 e!577274)))

(declare-fun contains!5919 (List!21757 (_ BitVec 64)) Bool)

(assert (=> b!1024148 (= res!685744 (contains!5919 Nil!21754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37547 () Bool)

(declare-fun mapRes!37547 () Bool)

(declare-fun tp!72123 () Bool)

(declare-fun e!577272 () Bool)

(assert (=> mapNonEmpty!37547 (= mapRes!37547 (and tp!72123 e!577272))))

(declare-fun mapRest!37547 () (Array (_ BitVec 32) ValueCell!11336))

(declare-fun mapValue!37547 () ValueCell!11336)

(declare-fun mapKey!37547 () (_ BitVec 32))

(assert (=> mapNonEmpty!37547 (= (arr!30883 (_values!6008 thiss!1427)) (store mapRest!37547 mapKey!37547 mapValue!37547))))

(declare-fun b!1024149 () Bool)

(declare-fun e!577273 () Bool)

(declare-fun tp_is_empty!24079 () Bool)

(assert (=> b!1024149 (= e!577273 tp_is_empty!24079)))

(declare-fun b!1024150 () Bool)

(declare-fun e!577270 () Bool)

(assert (=> b!1024150 (= e!577269 e!577270)))

(declare-fun res!685743 () Bool)

(assert (=> b!1024150 (=> (not res!685743) (not e!577270))))

(declare-datatypes ((SeekEntryResult!9585 0))(
  ( (MissingZero!9585 (index!40711 (_ BitVec 32))) (Found!9585 (index!40712 (_ BitVec 32))) (Intermediate!9585 (undefined!10397 Bool) (index!40713 (_ BitVec 32)) (x!91060 (_ BitVec 32))) (Undefined!9585) (MissingVacant!9585 (index!40714 (_ BitVec 32))) )
))
(declare-fun lt!450379 () SeekEntryResult!9585)

(get-info :version)

(assert (=> b!1024150 (= res!685743 ((_ is Found!9585) lt!450379))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64147 (_ BitVec 32)) SeekEntryResult!9585)

(assert (=> b!1024150 (= lt!450379 (seekEntry!0 key!909 (_keys!11128 thiss!1427) (mask!29628 thiss!1427)))))

(declare-fun mapIsEmpty!37547 () Bool)

(assert (=> mapIsEmpty!37547 mapRes!37547))

(declare-fun b!1024151 () Bool)

(assert (=> b!1024151 (= e!577270 (not e!577274))))

(declare-fun res!685738 () Bool)

(assert (=> b!1024151 (=> res!685738 e!577274)))

(assert (=> b!1024151 (= res!685738 (or (bvsge (size!31397 (_keys!11128 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31397 (_keys!11128 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64147 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024151 (= (arrayCountValidKeys!0 (array!64148 (store (arr!30882 (_keys!11128 thiss!1427)) (index!40712 lt!450379) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31397 (_keys!11128 thiss!1427))) #b00000000000000000000000000000000 (size!31397 (_keys!11128 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11128 thiss!1427) #b00000000000000000000000000000000 (size!31397 (_keys!11128 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33243 0))(
  ( (Unit!33244) )
))
(declare-fun lt!450377 () Unit!33243)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64147 (_ BitVec 32) (_ BitVec 64)) Unit!33243)

(assert (=> b!1024151 (= lt!450377 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11128 thiss!1427) (index!40712 lt!450379) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!685741 () Bool)

(assert (=> start!89358 (=> (not res!685741) (not e!577269))))

(declare-fun valid!1999 (LongMapFixedSize!5266) Bool)

(assert (=> start!89358 (= res!685741 (valid!1999 thiss!1427))))

(assert (=> start!89358 e!577269))

(declare-fun e!577271 () Bool)

(assert (=> start!89358 e!577271))

(assert (=> start!89358 true))

(declare-fun e!577268 () Bool)

(declare-fun array_inv!23937 (array!64147) Bool)

(declare-fun array_inv!23938 (array!64149) Bool)

(assert (=> b!1024152 (= e!577271 (and tp!72122 tp_is_empty!24079 (array_inv!23937 (_keys!11128 thiss!1427)) (array_inv!23938 (_values!6008 thiss!1427)) e!577268))))

(declare-fun b!1024153 () Bool)

(declare-fun res!685740 () Bool)

(assert (=> b!1024153 (=> res!685740 e!577274)))

(declare-fun noDuplicate!1468 (List!21757) Bool)

(assert (=> b!1024153 (= res!685740 (not (noDuplicate!1468 Nil!21754)))))

(declare-fun b!1024154 () Bool)

(assert (=> b!1024154 (= e!577268 (and e!577273 mapRes!37547))))

(declare-fun condMapEmpty!37547 () Bool)

(declare-fun mapDefault!37547 () ValueCell!11336)

(assert (=> b!1024154 (= condMapEmpty!37547 (= (arr!30883 (_values!6008 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11336)) mapDefault!37547)))))

(declare-fun b!1024155 () Bool)

(declare-fun res!685739 () Bool)

(assert (=> b!1024155 (=> res!685739 e!577274)))

(assert (=> b!1024155 (= res!685739 (contains!5919 Nil!21754 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024156 () Bool)

(assert (=> b!1024156 (= e!577272 tp_is_empty!24079)))

(assert (= (and start!89358 res!685741) b!1024147))

(assert (= (and b!1024147 res!685742) b!1024150))

(assert (= (and b!1024150 res!685743) b!1024151))

(assert (= (and b!1024151 (not res!685738)) b!1024153))

(assert (= (and b!1024153 (not res!685740)) b!1024148))

(assert (= (and b!1024148 (not res!685744)) b!1024155))

(assert (= (and b!1024155 (not res!685739)) b!1024146))

(assert (= (and b!1024154 condMapEmpty!37547) mapIsEmpty!37547))

(assert (= (and b!1024154 (not condMapEmpty!37547)) mapNonEmpty!37547))

(assert (= (and mapNonEmpty!37547 ((_ is ValueCellFull!11336) mapValue!37547)) b!1024156))

(assert (= (and b!1024154 ((_ is ValueCellFull!11336) mapDefault!37547)) b!1024149))

(assert (= b!1024152 b!1024154))

(assert (= start!89358 b!1024152))

(declare-fun m!942053 () Bool)

(assert (=> b!1024152 m!942053))

(declare-fun m!942055 () Bool)

(assert (=> b!1024152 m!942055))

(declare-fun m!942057 () Bool)

(assert (=> start!89358 m!942057))

(declare-fun m!942059 () Bool)

(assert (=> b!1024155 m!942059))

(declare-fun m!942061 () Bool)

(assert (=> b!1024153 m!942061))

(declare-fun m!942063 () Bool)

(assert (=> b!1024148 m!942063))

(declare-fun m!942065 () Bool)

(assert (=> mapNonEmpty!37547 m!942065))

(declare-fun m!942067 () Bool)

(assert (=> b!1024151 m!942067))

(declare-fun m!942069 () Bool)

(assert (=> b!1024151 m!942069))

(declare-fun m!942071 () Bool)

(assert (=> b!1024151 m!942071))

(declare-fun m!942073 () Bool)

(assert (=> b!1024151 m!942073))

(declare-fun m!942075 () Bool)

(assert (=> b!1024150 m!942075))

(declare-fun m!942077 () Bool)

(assert (=> b!1024146 m!942077))

(check-sat (not b!1024155) (not start!89358) (not b!1024148) (not b!1024153) (not b_next!20359) (not b!1024152) tp_is_empty!24079 (not mapNonEmpty!37547) b_and!32579 (not b!1024146) (not b!1024151) (not b!1024150))
(check-sat b_and!32579 (not b_next!20359))
