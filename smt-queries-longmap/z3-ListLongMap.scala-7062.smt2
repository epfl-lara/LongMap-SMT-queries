; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89428 () Bool)

(assert start!89428)

(declare-fun b!1025424 () Bool)

(declare-fun b_free!20427 () Bool)

(declare-fun b_next!20427 () Bool)

(assert (=> b!1025424 (= b_free!20427 (not b_next!20427))))

(declare-fun tp!72326 () Bool)

(declare-fun b_and!32673 () Bool)

(assert (=> b!1025424 (= tp!72326 b_and!32673)))

(declare-fun b!1025419 () Bool)

(declare-fun e!578181 () Bool)

(declare-fun e!578178 () Bool)

(assert (=> b!1025419 (= e!578181 (not e!578178))))

(declare-fun res!686522 () Bool)

(assert (=> b!1025419 (=> res!686522 e!578178)))

(declare-datatypes ((V!37069 0))(
  ( (V!37070 (val!12124 Int)) )
))
(declare-datatypes ((ValueCell!11370 0))(
  ( (ValueCellFull!11370 (v!14693 V!37069)) (EmptyCell!11370) )
))
(declare-datatypes ((array!64344 0))(
  ( (array!64345 (arr!30981 (Array (_ BitVec 32) (_ BitVec 64))) (size!31494 (_ BitVec 32))) )
))
(declare-datatypes ((array!64346 0))(
  ( (array!64347 (arr!30982 (Array (_ BitVec 32) ValueCell!11370)) (size!31495 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5334 0))(
  ( (LongMapFixedSize!5335 (defaultEntry!6019 Int) (mask!29689 (_ BitVec 32)) (extraKeys!5751 (_ BitVec 32)) (zeroValue!5855 V!37069) (minValue!5855 V!37069) (_size!2722 (_ BitVec 32)) (_keys!11166 array!64344) (_values!6042 array!64346) (_vacant!2722 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5334)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025419 (= res!686522 (not (validMask!0 (mask!29689 thiss!1427))))))

(declare-fun lt!450929 () array!64344)

(declare-datatypes ((List!21752 0))(
  ( (Nil!21749) (Cons!21748 (h!22946 (_ BitVec 64)) (t!30814 List!21752)) )
))
(declare-fun arrayNoDuplicates!0 (array!64344 (_ BitVec 32) List!21752) Bool)

(assert (=> b!1025419 (arrayNoDuplicates!0 lt!450929 #b00000000000000000000000000000000 Nil!21749)))

(declare-datatypes ((Unit!33389 0))(
  ( (Unit!33390) )
))
(declare-fun lt!450930 () Unit!33389)

(declare-datatypes ((SeekEntryResult!9618 0))(
  ( (MissingZero!9618 (index!40843 (_ BitVec 32))) (Found!9618 (index!40844 (_ BitVec 32))) (Intermediate!9618 (undefined!10430 Bool) (index!40845 (_ BitVec 32)) (x!91184 (_ BitVec 32))) (Undefined!9618) (MissingVacant!9618 (index!40846 (_ BitVec 32))) )
))
(declare-fun lt!450933 () SeekEntryResult!9618)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64344 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21752) Unit!33389)

(assert (=> b!1025419 (= lt!450930 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11166 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40844 lt!450933) #b00000000000000000000000000000000 Nil!21749))))

(declare-fun arrayCountValidKeys!0 (array!64344 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025419 (= (arrayCountValidKeys!0 lt!450929 #b00000000000000000000000000000000 (size!31494 (_keys!11166 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11166 thiss!1427) #b00000000000000000000000000000000 (size!31494 (_keys!11166 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025419 (= lt!450929 (array!64345 (store (arr!30981 (_keys!11166 thiss!1427)) (index!40844 lt!450933) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31494 (_keys!11166 thiss!1427))))))

(declare-fun lt!450932 () Unit!33389)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64344 (_ BitVec 32) (_ BitVec 64)) Unit!33389)

(assert (=> b!1025419 (= lt!450932 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11166 thiss!1427) (index!40844 lt!450933) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025420 () Bool)

(declare-fun res!686521 () Bool)

(assert (=> b!1025420 (=> res!686521 e!578178)))

(assert (=> b!1025420 (= res!686521 (or (not (= (size!31494 (_keys!11166 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29689 thiss!1427)))) (bvslt (index!40844 lt!450933) #b00000000000000000000000000000000) (bvsge (index!40844 lt!450933) (size!31494 (_keys!11166 thiss!1427)))))))

(declare-fun b!1025421 () Bool)

(declare-fun e!578176 () Bool)

(declare-fun tp_is_empty!24147 () Bool)

(assert (=> b!1025421 (= e!578176 tp_is_empty!24147)))

(declare-fun b!1025422 () Bool)

(declare-fun res!686524 () Bool)

(assert (=> b!1025422 (=> res!686524 e!578178)))

(assert (=> b!1025422 (= res!686524 (not (arrayNoDuplicates!0 (_keys!11166 thiss!1427) #b00000000000000000000000000000000 Nil!21749)))))

(declare-fun b!1025423 () Bool)

(declare-fun e!578175 () Bool)

(assert (=> b!1025423 (= e!578175 tp_is_empty!24147)))

(declare-fun mapNonEmpty!37649 () Bool)

(declare-fun mapRes!37649 () Bool)

(declare-fun tp!72327 () Bool)

(assert (=> mapNonEmpty!37649 (= mapRes!37649 (and tp!72327 e!578175))))

(declare-fun mapValue!37649 () ValueCell!11370)

(declare-fun mapKey!37649 () (_ BitVec 32))

(declare-fun mapRest!37649 () (Array (_ BitVec 32) ValueCell!11370))

(assert (=> mapNonEmpty!37649 (= (arr!30982 (_values!6042 thiss!1427)) (store mapRest!37649 mapKey!37649 mapValue!37649))))

(declare-fun e!578179 () Bool)

(declare-fun e!578177 () Bool)

(declare-fun array_inv!23995 (array!64344) Bool)

(declare-fun array_inv!23996 (array!64346) Bool)

(assert (=> b!1025424 (= e!578179 (and tp!72326 tp_is_empty!24147 (array_inv!23995 (_keys!11166 thiss!1427)) (array_inv!23996 (_values!6042 thiss!1427)) e!578177))))

(declare-fun res!686519 () Bool)

(declare-fun e!578180 () Bool)

(assert (=> start!89428 (=> (not res!686519) (not e!578180))))

(declare-fun valid!2027 (LongMapFixedSize!5334) Bool)

(assert (=> start!89428 (= res!686519 (valid!2027 thiss!1427))))

(assert (=> start!89428 e!578180))

(assert (=> start!89428 e!578179))

(assert (=> start!89428 true))

(declare-fun b!1025425 () Bool)

(assert (=> b!1025425 (= e!578180 e!578181)))

(declare-fun res!686520 () Bool)

(assert (=> b!1025425 (=> (not res!686520) (not e!578181))))

(get-info :version)

(assert (=> b!1025425 (= res!686520 ((_ is Found!9618) lt!450933))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64344 (_ BitVec 32)) SeekEntryResult!9618)

(assert (=> b!1025425 (= lt!450933 (seekEntry!0 key!909 (_keys!11166 thiss!1427) (mask!29689 thiss!1427)))))

(declare-fun b!1025426 () Bool)

(assert (=> b!1025426 (= e!578177 (and e!578176 mapRes!37649))))

(declare-fun condMapEmpty!37649 () Bool)

(declare-fun mapDefault!37649 () ValueCell!11370)

(assert (=> b!1025426 (= condMapEmpty!37649 (= (arr!30982 (_values!6042 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11370)) mapDefault!37649)))))

(declare-fun mapIsEmpty!37649 () Bool)

(assert (=> mapIsEmpty!37649 mapRes!37649))

(declare-fun b!1025427 () Bool)

(declare-fun res!686523 () Bool)

(assert (=> b!1025427 (=> res!686523 e!578178)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025427 (= res!686523 (not (validKeyInArray!0 (select (arr!30981 (_keys!11166 thiss!1427)) (index!40844 lt!450933)))))))

(declare-fun b!1025428 () Bool)

(assert (=> b!1025428 (= e!578178 true)))

(declare-fun lt!450931 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64344 (_ BitVec 32)) Bool)

(assert (=> b!1025428 (= lt!450931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11166 thiss!1427) (mask!29689 thiss!1427)))))

(declare-fun b!1025429 () Bool)

(declare-fun res!686525 () Bool)

(assert (=> b!1025429 (=> (not res!686525) (not e!578180))))

(assert (=> b!1025429 (= res!686525 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89428 res!686519) b!1025429))

(assert (= (and b!1025429 res!686525) b!1025425))

(assert (= (and b!1025425 res!686520) b!1025419))

(assert (= (and b!1025419 (not res!686522)) b!1025420))

(assert (= (and b!1025420 (not res!686521)) b!1025427))

(assert (= (and b!1025427 (not res!686523)) b!1025422))

(assert (= (and b!1025422 (not res!686524)) b!1025428))

(assert (= (and b!1025426 condMapEmpty!37649) mapIsEmpty!37649))

(assert (= (and b!1025426 (not condMapEmpty!37649)) mapNonEmpty!37649))

(assert (= (and mapNonEmpty!37649 ((_ is ValueCellFull!11370) mapValue!37649)) b!1025423))

(assert (= (and b!1025426 ((_ is ValueCellFull!11370) mapDefault!37649)) b!1025421))

(assert (= b!1025424 b!1025426))

(assert (= start!89428 b!1025424))

(declare-fun m!943599 () Bool)

(assert (=> b!1025427 m!943599))

(assert (=> b!1025427 m!943599))

(declare-fun m!943601 () Bool)

(assert (=> b!1025427 m!943601))

(declare-fun m!943603 () Bool)

(assert (=> b!1025425 m!943603))

(declare-fun m!943605 () Bool)

(assert (=> b!1025419 m!943605))

(declare-fun m!943607 () Bool)

(assert (=> b!1025419 m!943607))

(declare-fun m!943609 () Bool)

(assert (=> b!1025419 m!943609))

(declare-fun m!943611 () Bool)

(assert (=> b!1025419 m!943611))

(declare-fun m!943613 () Bool)

(assert (=> b!1025419 m!943613))

(declare-fun m!943615 () Bool)

(assert (=> b!1025419 m!943615))

(declare-fun m!943617 () Bool)

(assert (=> b!1025419 m!943617))

(declare-fun m!943619 () Bool)

(assert (=> b!1025424 m!943619))

(declare-fun m!943621 () Bool)

(assert (=> b!1025424 m!943621))

(declare-fun m!943623 () Bool)

(assert (=> start!89428 m!943623))

(declare-fun m!943625 () Bool)

(assert (=> mapNonEmpty!37649 m!943625))

(declare-fun m!943627 () Bool)

(assert (=> b!1025428 m!943627))

(declare-fun m!943629 () Bool)

(assert (=> b!1025422 m!943629))

(check-sat tp_is_empty!24147 (not b!1025419) (not b!1025427) (not b!1025424) (not start!89428) (not b!1025425) (not mapNonEmpty!37649) (not b_next!20427) (not b!1025422) b_and!32673 (not b!1025428))
(check-sat b_and!32673 (not b_next!20427))
