; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33710 () Bool)

(assert start!33710)

(declare-fun b_free!6945 () Bool)

(declare-fun b_next!6945 () Bool)

(assert (=> start!33710 (= b_free!6945 (not b_next!6945))))

(declare-fun tp!24338 () Bool)

(declare-fun b_and!14125 () Bool)

(assert (=> start!33710 (= tp!24338 b_and!14125)))

(declare-fun b!335097 () Bool)

(declare-fun res!184853 () Bool)

(declare-fun e!205689 () Bool)

(assert (=> b!335097 (=> (not res!184853) (not e!205689))))

(declare-datatypes ((array!17387 0))(
  ( (array!17388 (arr!8224 (Array (_ BitVec 32) (_ BitVec 64))) (size!8576 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17387)

(declare-datatypes ((List!4694 0))(
  ( (Nil!4691) (Cons!4690 (h!5546 (_ BitVec 64)) (t!9782 List!4694)) )
))
(declare-fun arrayNoDuplicates!0 (array!17387 (_ BitVec 32) List!4694) Bool)

(assert (=> b!335097 (= res!184853 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4691))))

(declare-fun b!335098 () Bool)

(declare-fun e!205688 () Bool)

(declare-fun tp_is_empty!6897 () Bool)

(assert (=> b!335098 (= e!205688 tp_is_empty!6897)))

(declare-fun b!335099 () Bool)

(declare-fun e!205691 () Bool)

(assert (=> b!335099 (= e!205691 tp_is_empty!6897)))

(declare-fun b!335100 () Bool)

(declare-fun e!205686 () Bool)

(declare-fun mapRes!11742 () Bool)

(assert (=> b!335100 (= e!205686 (and e!205691 mapRes!11742))))

(declare-fun condMapEmpty!11742 () Bool)

(declare-datatypes ((V!10173 0))(
  ( (V!10174 (val!3493 Int)) )
))
(declare-datatypes ((ValueCell!3105 0))(
  ( (ValueCellFull!3105 (v!5655 V!10173)) (EmptyCell!3105) )
))
(declare-datatypes ((array!17389 0))(
  ( (array!17390 (arr!8225 (Array (_ BitVec 32) ValueCell!3105)) (size!8577 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17389)

(declare-fun mapDefault!11742 () ValueCell!3105)

(assert (=> b!335100 (= condMapEmpty!11742 (= (arr!8225 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3105)) mapDefault!11742)))))

(declare-fun mapIsEmpty!11742 () Bool)

(assert (=> mapIsEmpty!11742 mapRes!11742))

(declare-fun b!335101 () Bool)

(declare-fun res!184857 () Bool)

(declare-fun e!205690 () Bool)

(assert (=> b!335101 (=> (not res!184857) (not e!205690))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3179 0))(
  ( (MissingZero!3179 (index!14895 (_ BitVec 32))) (Found!3179 (index!14896 (_ BitVec 32))) (Intermediate!3179 (undefined!3991 Bool) (index!14897 (_ BitVec 32)) (x!33393 (_ BitVec 32))) (Undefined!3179) (MissingVacant!3179 (index!14898 (_ BitVec 32))) )
))
(declare-fun lt!159708 () SeekEntryResult!3179)

(declare-fun arrayContainsKey!0 (array!17387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335101 (= res!184857 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14896 lt!159708)))))

(declare-fun b!335102 () Bool)

(declare-fun res!184852 () Bool)

(assert (=> b!335102 (=> (not res!184852) (not e!205689))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335102 (= res!184852 (and (= (size!8577 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8576 _keys!1895) (size!8577 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335103 () Bool)

(declare-fun e!205687 () Bool)

(assert (=> b!335103 (= e!205687 e!205690)))

(declare-fun res!184859 () Bool)

(assert (=> b!335103 (=> (not res!184859) (not e!205690))))

(get-info :version)

(assert (=> b!335103 (= res!184859 (and ((_ is Found!3179) lt!159708) (= (select (arr!8224 _keys!1895) (index!14896 lt!159708)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17387 (_ BitVec 32)) SeekEntryResult!3179)

(assert (=> b!335103 (= lt!159708 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335104 () Bool)

(assert (=> b!335104 (= e!205689 e!205687)))

(declare-fun res!184856 () Bool)

(assert (=> b!335104 (=> (not res!184856) (not e!205687))))

(declare-datatypes ((tuple2!5072 0))(
  ( (tuple2!5073 (_1!2547 (_ BitVec 64)) (_2!2547 V!10173)) )
))
(declare-datatypes ((List!4695 0))(
  ( (Nil!4692) (Cons!4691 (h!5547 tuple2!5072) (t!9783 List!4695)) )
))
(declare-datatypes ((ListLongMap!3985 0))(
  ( (ListLongMap!3986 (toList!2008 List!4695)) )
))
(declare-fun lt!159706 () ListLongMap!3985)

(declare-fun contains!2052 (ListLongMap!3985 (_ BitVec 64)) Bool)

(assert (=> b!335104 (= res!184856 (not (contains!2052 lt!159706 k0!1348)))))

(declare-fun zeroValue!1467 () V!10173)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10173)

(declare-fun getCurrentListMap!1534 (array!17387 array!17389 (_ BitVec 32) (_ BitVec 32) V!10173 V!10173 (_ BitVec 32) Int) ListLongMap!3985)

(assert (=> b!335104 (= lt!159706 (getCurrentListMap!1534 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335105 () Bool)

(assert (=> b!335105 (= e!205690 (not true))))

(assert (=> b!335105 (contains!2052 lt!159706 (select (arr!8224 _keys!1895) (index!14896 lt!159708)))))

(declare-datatypes ((Unit!10427 0))(
  ( (Unit!10428) )
))
(declare-fun lt!159707 () Unit!10427)

(declare-fun lemmaValidKeyInArrayIsInListMap!160 (array!17387 array!17389 (_ BitVec 32) (_ BitVec 32) V!10173 V!10173 (_ BitVec 32) Int) Unit!10427)

(assert (=> b!335105 (= lt!159707 (lemmaValidKeyInArrayIsInListMap!160 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14896 lt!159708) defaultEntry!1528))))

(assert (=> b!335105 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159709 () Unit!10427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17387 (_ BitVec 64) (_ BitVec 32)) Unit!10427)

(assert (=> b!335105 (= lt!159709 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14896 lt!159708)))))

(declare-fun mapNonEmpty!11742 () Bool)

(declare-fun tp!24339 () Bool)

(assert (=> mapNonEmpty!11742 (= mapRes!11742 (and tp!24339 e!205688))))

(declare-fun mapRest!11742 () (Array (_ BitVec 32) ValueCell!3105))

(declare-fun mapValue!11742 () ValueCell!3105)

(declare-fun mapKey!11742 () (_ BitVec 32))

(assert (=> mapNonEmpty!11742 (= (arr!8225 _values!1525) (store mapRest!11742 mapKey!11742 mapValue!11742))))

(declare-fun res!184855 () Bool)

(assert (=> start!33710 (=> (not res!184855) (not e!205689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33710 (= res!184855 (validMask!0 mask!2385))))

(assert (=> start!33710 e!205689))

(assert (=> start!33710 true))

(assert (=> start!33710 tp_is_empty!6897))

(assert (=> start!33710 tp!24338))

(declare-fun array_inv!6112 (array!17389) Bool)

(assert (=> start!33710 (and (array_inv!6112 _values!1525) e!205686)))

(declare-fun array_inv!6113 (array!17387) Bool)

(assert (=> start!33710 (array_inv!6113 _keys!1895)))

(declare-fun b!335106 () Bool)

(declare-fun res!184858 () Bool)

(assert (=> b!335106 (=> (not res!184858) (not e!205689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335106 (= res!184858 (validKeyInArray!0 k0!1348))))

(declare-fun b!335107 () Bool)

(declare-fun res!184854 () Bool)

(assert (=> b!335107 (=> (not res!184854) (not e!205689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17387 (_ BitVec 32)) Bool)

(assert (=> b!335107 (= res!184854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33710 res!184855) b!335102))

(assert (= (and b!335102 res!184852) b!335107))

(assert (= (and b!335107 res!184854) b!335097))

(assert (= (and b!335097 res!184853) b!335106))

(assert (= (and b!335106 res!184858) b!335104))

(assert (= (and b!335104 res!184856) b!335103))

(assert (= (and b!335103 res!184859) b!335101))

(assert (= (and b!335101 res!184857) b!335105))

(assert (= (and b!335100 condMapEmpty!11742) mapIsEmpty!11742))

(assert (= (and b!335100 (not condMapEmpty!11742)) mapNonEmpty!11742))

(assert (= (and mapNonEmpty!11742 ((_ is ValueCellFull!3105) mapValue!11742)) b!335098))

(assert (= (and b!335100 ((_ is ValueCellFull!3105) mapDefault!11742)) b!335099))

(assert (= start!33710 b!335100))

(declare-fun m!339101 () Bool)

(assert (=> b!335107 m!339101))

(declare-fun m!339103 () Bool)

(assert (=> b!335103 m!339103))

(declare-fun m!339105 () Bool)

(assert (=> b!335103 m!339105))

(declare-fun m!339107 () Bool)

(assert (=> b!335104 m!339107))

(declare-fun m!339109 () Bool)

(assert (=> b!335104 m!339109))

(declare-fun m!339111 () Bool)

(assert (=> b!335097 m!339111))

(declare-fun m!339113 () Bool)

(assert (=> mapNonEmpty!11742 m!339113))

(declare-fun m!339115 () Bool)

(assert (=> b!335106 m!339115))

(declare-fun m!339117 () Bool)

(assert (=> b!335105 m!339117))

(assert (=> b!335105 m!339103))

(declare-fun m!339119 () Bool)

(assert (=> b!335105 m!339119))

(assert (=> b!335105 m!339103))

(declare-fun m!339121 () Bool)

(assert (=> b!335105 m!339121))

(declare-fun m!339123 () Bool)

(assert (=> b!335105 m!339123))

(declare-fun m!339125 () Bool)

(assert (=> b!335101 m!339125))

(declare-fun m!339127 () Bool)

(assert (=> start!33710 m!339127))

(declare-fun m!339129 () Bool)

(assert (=> start!33710 m!339129))

(declare-fun m!339131 () Bool)

(assert (=> start!33710 m!339131))

(check-sat (not b!335097) (not start!33710) (not b!335105) (not b_next!6945) (not b!335107) (not b!335106) (not b!335104) (not b!335101) tp_is_empty!6897 (not b!335103) b_and!14125 (not mapNonEmpty!11742))
(check-sat b_and!14125 (not b_next!6945))
