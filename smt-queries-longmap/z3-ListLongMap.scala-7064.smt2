; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89436 () Bool)

(assert start!89436)

(declare-fun b!1025433 () Bool)

(declare-fun b_free!20437 () Bool)

(declare-fun b_next!20437 () Bool)

(assert (=> b!1025433 (= b_free!20437 (not b_next!20437))))

(declare-fun tp!72356 () Bool)

(declare-fun b_and!32657 () Bool)

(assert (=> b!1025433 (= tp!72356 b_and!32657)))

(declare-fun e!578206 () Bool)

(declare-fun tp_is_empty!24157 () Bool)

(declare-datatypes ((V!37083 0))(
  ( (V!37084 (val!12129 Int)) )
))
(declare-datatypes ((ValueCell!11375 0))(
  ( (ValueCellFull!11375 (v!14697 V!37083)) (EmptyCell!11375) )
))
(declare-datatypes ((array!64303 0))(
  ( (array!64304 (arr!30960 (Array (_ BitVec 32) (_ BitVec 64))) (size!31475 (_ BitVec 32))) )
))
(declare-datatypes ((array!64305 0))(
  ( (array!64306 (arr!30961 (Array (_ BitVec 32) ValueCell!11375)) (size!31476 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5344 0))(
  ( (LongMapFixedSize!5345 (defaultEntry!6024 Int) (mask!29693 (_ BitVec 32)) (extraKeys!5756 (_ BitVec 32)) (zeroValue!5860 V!37083) (minValue!5860 V!37083) (_size!2727 (_ BitVec 32)) (_keys!11167 array!64303) (_values!6047 array!64305) (_vacant!2727 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5344)

(declare-fun e!578209 () Bool)

(declare-fun array_inv!23991 (array!64303) Bool)

(declare-fun array_inv!23992 (array!64305) Bool)

(assert (=> b!1025433 (= e!578209 (and tp!72356 tp_is_empty!24157 (array_inv!23991 (_keys!11167 thiss!1427)) (array_inv!23992 (_values!6047 thiss!1427)) e!578206))))

(declare-fun b!1025435 () Bool)

(declare-fun e!578205 () Bool)

(assert (=> b!1025435 (= e!578205 tp_is_empty!24157)))

(declare-fun mapIsEmpty!37664 () Bool)

(declare-fun mapRes!37664 () Bool)

(assert (=> mapIsEmpty!37664 mapRes!37664))

(declare-fun b!1025436 () Bool)

(declare-fun res!686561 () Bool)

(declare-fun e!578210 () Bool)

(assert (=> b!1025436 (=> res!686561 e!578210)))

(declare-datatypes ((List!21791 0))(
  ( (Nil!21788) (Cons!21787 (h!22985 (_ BitVec 64)) (t!30844 List!21791)) )
))
(declare-fun arrayNoDuplicates!0 (array!64303 (_ BitVec 32) List!21791) Bool)

(assert (=> b!1025436 (= res!686561 (not (arrayNoDuplicates!0 (_keys!11167 thiss!1427) #b00000000000000000000000000000000 Nil!21788)))))

(declare-fun b!1025437 () Bool)

(declare-fun res!686557 () Bool)

(assert (=> b!1025437 (=> res!686557 e!578210)))

(declare-datatypes ((SeekEntryResult!9617 0))(
  ( (MissingZero!9617 (index!40839 (_ BitVec 32))) (Found!9617 (index!40840 (_ BitVec 32))) (Intermediate!9617 (undefined!10429 Bool) (index!40841 (_ BitVec 32)) (x!91196 (_ BitVec 32))) (Undefined!9617) (MissingVacant!9617 (index!40842 (_ BitVec 32))) )
))
(declare-fun lt!450805 () SeekEntryResult!9617)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025437 (= res!686557 (not (validKeyInArray!0 (select (arr!30960 (_keys!11167 thiss!1427)) (index!40840 lt!450805)))))))

(declare-fun b!1025438 () Bool)

(declare-fun res!686559 () Bool)

(declare-fun e!578211 () Bool)

(assert (=> b!1025438 (=> (not res!686559) (not e!578211))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025438 (= res!686559 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025434 () Bool)

(assert (=> b!1025434 (= e!578206 (and e!578205 mapRes!37664))))

(declare-fun condMapEmpty!37664 () Bool)

(declare-fun mapDefault!37664 () ValueCell!11375)

(assert (=> b!1025434 (= condMapEmpty!37664 (= (arr!30961 (_values!6047 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11375)) mapDefault!37664)))))

(declare-fun res!686560 () Bool)

(assert (=> start!89436 (=> (not res!686560) (not e!578211))))

(declare-fun valid!2026 (LongMapFixedSize!5344) Bool)

(assert (=> start!89436 (= res!686560 (valid!2026 thiss!1427))))

(assert (=> start!89436 e!578211))

(assert (=> start!89436 e!578209))

(assert (=> start!89436 true))

(declare-fun b!1025439 () Bool)

(declare-fun e!578208 () Bool)

(assert (=> b!1025439 (= e!578211 e!578208)))

(declare-fun res!686558 () Bool)

(assert (=> b!1025439 (=> (not res!686558) (not e!578208))))

(get-info :version)

(assert (=> b!1025439 (= res!686558 ((_ is Found!9617) lt!450805))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64303 (_ BitVec 32)) SeekEntryResult!9617)

(assert (=> b!1025439 (= lt!450805 (seekEntry!0 key!909 (_keys!11167 thiss!1427) (mask!29693 thiss!1427)))))

(declare-fun mapNonEmpty!37664 () Bool)

(declare-fun tp!72357 () Bool)

(declare-fun e!578207 () Bool)

(assert (=> mapNonEmpty!37664 (= mapRes!37664 (and tp!72357 e!578207))))

(declare-fun mapKey!37664 () (_ BitVec 32))

(declare-fun mapValue!37664 () ValueCell!11375)

(declare-fun mapRest!37664 () (Array (_ BitVec 32) ValueCell!11375))

(assert (=> mapNonEmpty!37664 (= (arr!30961 (_values!6047 thiss!1427)) (store mapRest!37664 mapKey!37664 mapValue!37664))))

(declare-fun b!1025440 () Bool)

(assert (=> b!1025440 (= e!578208 (not e!578210))))

(declare-fun res!686563 () Bool)

(assert (=> b!1025440 (=> res!686563 e!578210)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025440 (= res!686563 (not (validMask!0 (mask!29693 thiss!1427))))))

(declare-fun lt!450806 () array!64303)

(assert (=> b!1025440 (arrayNoDuplicates!0 lt!450806 #b00000000000000000000000000000000 Nil!21788)))

(declare-datatypes ((Unit!33297 0))(
  ( (Unit!33298) )
))
(declare-fun lt!450808 () Unit!33297)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64303 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21791) Unit!33297)

(assert (=> b!1025440 (= lt!450808 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11167 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40840 lt!450805) #b00000000000000000000000000000000 Nil!21788))))

(declare-fun arrayCountValidKeys!0 (array!64303 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025440 (= (arrayCountValidKeys!0 lt!450806 #b00000000000000000000000000000000 (size!31475 (_keys!11167 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11167 thiss!1427) #b00000000000000000000000000000000 (size!31475 (_keys!11167 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025440 (= lt!450806 (array!64304 (store (arr!30960 (_keys!11167 thiss!1427)) (index!40840 lt!450805) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31475 (_keys!11167 thiss!1427))))))

(declare-fun lt!450807 () Unit!33297)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64303 (_ BitVec 32) (_ BitVec 64)) Unit!33297)

(assert (=> b!1025440 (= lt!450807 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11167 thiss!1427) (index!40840 lt!450805) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025441 () Bool)

(assert (=> b!1025441 (= e!578210 true)))

(declare-fun lt!450804 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64303 (_ BitVec 32)) Bool)

(assert (=> b!1025441 (= lt!450804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11167 thiss!1427) (mask!29693 thiss!1427)))))

(declare-fun b!1025442 () Bool)

(assert (=> b!1025442 (= e!578207 tp_is_empty!24157)))

(declare-fun b!1025443 () Bool)

(declare-fun res!686562 () Bool)

(assert (=> b!1025443 (=> res!686562 e!578210)))

(assert (=> b!1025443 (= res!686562 (or (not (= (size!31475 (_keys!11167 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29693 thiss!1427)))) (bvslt (index!40840 lt!450805) #b00000000000000000000000000000000) (bvsge (index!40840 lt!450805) (size!31475 (_keys!11167 thiss!1427)))))))

(assert (= (and start!89436 res!686560) b!1025438))

(assert (= (and b!1025438 res!686559) b!1025439))

(assert (= (and b!1025439 res!686558) b!1025440))

(assert (= (and b!1025440 (not res!686563)) b!1025443))

(assert (= (and b!1025443 (not res!686562)) b!1025437))

(assert (= (and b!1025437 (not res!686557)) b!1025436))

(assert (= (and b!1025436 (not res!686561)) b!1025441))

(assert (= (and b!1025434 condMapEmpty!37664) mapIsEmpty!37664))

(assert (= (and b!1025434 (not condMapEmpty!37664)) mapNonEmpty!37664))

(assert (= (and mapNonEmpty!37664 ((_ is ValueCellFull!11375) mapValue!37664)) b!1025442))

(assert (= (and b!1025434 ((_ is ValueCellFull!11375) mapDefault!37664)) b!1025435))

(assert (= b!1025433 b!1025434))

(assert (= start!89436 b!1025433))

(declare-fun m!943139 () Bool)

(assert (=> b!1025433 m!943139))

(declare-fun m!943141 () Bool)

(assert (=> b!1025433 m!943141))

(declare-fun m!943143 () Bool)

(assert (=> start!89436 m!943143))

(declare-fun m!943145 () Bool)

(assert (=> b!1025441 m!943145))

(declare-fun m!943147 () Bool)

(assert (=> b!1025436 m!943147))

(declare-fun m!943149 () Bool)

(assert (=> b!1025439 m!943149))

(declare-fun m!943151 () Bool)

(assert (=> mapNonEmpty!37664 m!943151))

(declare-fun m!943153 () Bool)

(assert (=> b!1025437 m!943153))

(assert (=> b!1025437 m!943153))

(declare-fun m!943155 () Bool)

(assert (=> b!1025437 m!943155))

(declare-fun m!943157 () Bool)

(assert (=> b!1025440 m!943157))

(declare-fun m!943159 () Bool)

(assert (=> b!1025440 m!943159))

(declare-fun m!943161 () Bool)

(assert (=> b!1025440 m!943161))

(declare-fun m!943163 () Bool)

(assert (=> b!1025440 m!943163))

(declare-fun m!943165 () Bool)

(assert (=> b!1025440 m!943165))

(declare-fun m!943167 () Bool)

(assert (=> b!1025440 m!943167))

(declare-fun m!943169 () Bool)

(assert (=> b!1025440 m!943169))

(check-sat (not mapNonEmpty!37664) tp_is_empty!24157 (not b!1025433) (not b_next!20437) (not start!89436) (not b!1025440) (not b!1025436) (not b!1025437) (not b!1025439) (not b!1025441) b_and!32657)
(check-sat b_and!32657 (not b_next!20437))
