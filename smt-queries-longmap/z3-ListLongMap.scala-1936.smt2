; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34296 () Bool)

(assert start!34296)

(declare-fun b_free!7285 () Bool)

(declare-fun b_next!7285 () Bool)

(assert (=> start!34296 (= b_free!7285 (not b_next!7285))))

(declare-fun tp!25395 () Bool)

(declare-fun b_and!14463 () Bool)

(assert (=> start!34296 (= tp!25395 b_and!14463)))

(declare-fun b!342096 () Bool)

(declare-fun e!209782 () Bool)

(declare-fun tp_is_empty!7237 () Bool)

(assert (=> b!342096 (= e!209782 tp_is_empty!7237)))

(declare-fun res!189123 () Bool)

(declare-fun e!209780 () Bool)

(assert (=> start!34296 (=> (not res!189123) (not e!209780))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34296 (= res!189123 (validMask!0 mask!2385))))

(assert (=> start!34296 e!209780))

(assert (=> start!34296 true))

(assert (=> start!34296 tp_is_empty!7237))

(assert (=> start!34296 tp!25395))

(declare-datatypes ((V!10627 0))(
  ( (V!10628 (val!3663 Int)) )
))
(declare-datatypes ((ValueCell!3275 0))(
  ( (ValueCellFull!3275 (v!5831 V!10627)) (EmptyCell!3275) )
))
(declare-datatypes ((array!18053 0))(
  ( (array!18054 (arr!8545 (Array (_ BitVec 32) ValueCell!3275)) (size!8898 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18053)

(declare-fun e!209779 () Bool)

(declare-fun array_inv!6354 (array!18053) Bool)

(assert (=> start!34296 (and (array_inv!6354 _values!1525) e!209779)))

(declare-datatypes ((array!18055 0))(
  ( (array!18056 (arr!8546 (Array (_ BitVec 32) (_ BitVec 64))) (size!8899 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18055)

(declare-fun array_inv!6355 (array!18055) Bool)

(assert (=> start!34296 (array_inv!6355 _keys!1895)))

(declare-fun mapNonEmpty!12288 () Bool)

(declare-fun mapRes!12288 () Bool)

(declare-fun tp!25394 () Bool)

(assert (=> mapNonEmpty!12288 (= mapRes!12288 (and tp!25394 e!209782))))

(declare-fun mapKey!12288 () (_ BitVec 32))

(declare-fun mapRest!12288 () (Array (_ BitVec 32) ValueCell!3275))

(declare-fun mapValue!12288 () ValueCell!3275)

(assert (=> mapNonEmpty!12288 (= (arr!8545 _values!1525) (store mapRest!12288 mapKey!12288 mapValue!12288))))

(declare-fun b!342097 () Bool)

(declare-fun lt!161901 () Bool)

(declare-fun e!209778 () Bool)

(assert (=> b!342097 (= e!209778 (and (not lt!161901) (not (= (size!8899 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-datatypes ((Unit!10616 0))(
  ( (Unit!10617) )
))
(declare-fun lt!161898 () Unit!10616)

(declare-fun e!209776 () Unit!10616)

(assert (=> b!342097 (= lt!161898 e!209776)))

(declare-fun c!52736 () Bool)

(assert (=> b!342097 (= c!52736 lt!161901)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342097 (= lt!161901 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342098 () Bool)

(declare-fun res!189124 () Bool)

(assert (=> b!342098 (=> (not res!189124) (not e!209780))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342098 (= res!189124 (and (= (size!8898 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8899 _keys!1895) (size!8898 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342099 () Bool)

(declare-fun res!189120 () Bool)

(assert (=> b!342099 (=> (not res!189120) (not e!209780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342099 (= res!189120 (validKeyInArray!0 k0!1348))))

(declare-fun b!342100 () Bool)

(declare-fun res!189125 () Bool)

(assert (=> b!342100 (=> (not res!189125) (not e!209780))))

(declare-fun zeroValue!1467 () V!10627)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10627)

(declare-datatypes ((tuple2!5256 0))(
  ( (tuple2!5257 (_1!2639 (_ BitVec 64)) (_2!2639 V!10627)) )
))
(declare-datatypes ((List!4879 0))(
  ( (Nil!4876) (Cons!4875 (h!5731 tuple2!5256) (t!9982 List!4879)) )
))
(declare-datatypes ((ListLongMap!4159 0))(
  ( (ListLongMap!4160 (toList!2095 List!4879)) )
))
(declare-fun contains!2162 (ListLongMap!4159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1601 (array!18055 array!18053 (_ BitVec 32) (_ BitVec 32) V!10627 V!10627 (_ BitVec 32) Int) ListLongMap!4159)

(assert (=> b!342100 (= res!189125 (not (contains!2162 (getCurrentListMap!1601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342101 () Bool)

(declare-fun e!209781 () Bool)

(assert (=> b!342101 (= e!209779 (and e!209781 mapRes!12288))))

(declare-fun condMapEmpty!12288 () Bool)

(declare-fun mapDefault!12288 () ValueCell!3275)

(assert (=> b!342101 (= condMapEmpty!12288 (= (arr!8545 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3275)) mapDefault!12288)))))

(declare-fun b!342102 () Bool)

(declare-fun res!189119 () Bool)

(assert (=> b!342102 (=> (not res!189119) (not e!209780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18055 (_ BitVec 32)) Bool)

(assert (=> b!342102 (= res!189119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342103 () Bool)

(declare-fun Unit!10618 () Unit!10616)

(assert (=> b!342103 (= e!209776 Unit!10618)))

(declare-fun mapIsEmpty!12288 () Bool)

(assert (=> mapIsEmpty!12288 mapRes!12288))

(declare-fun b!342104 () Bool)

(declare-fun Unit!10619 () Unit!10616)

(assert (=> b!342104 (= e!209776 Unit!10619)))

(declare-fun lt!161900 () Unit!10616)

(declare-fun lemmaArrayContainsKeyThenInListMap!296 (array!18055 array!18053 (_ BitVec 32) (_ BitVec 32) V!10627 V!10627 (_ BitVec 64) (_ BitVec 32) Int) Unit!10616)

(declare-fun arrayScanForKey!0 (array!18055 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342104 (= lt!161900 (lemmaArrayContainsKeyThenInListMap!296 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342104 false))

(declare-fun b!342105 () Bool)

(declare-fun res!189122 () Bool)

(assert (=> b!342105 (=> (not res!189122) (not e!209780))))

(declare-datatypes ((List!4880 0))(
  ( (Nil!4877) (Cons!4876 (h!5732 (_ BitVec 64)) (t!9983 List!4880)) )
))
(declare-fun arrayNoDuplicates!0 (array!18055 (_ BitVec 32) List!4880) Bool)

(assert (=> b!342105 (= res!189122 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4877))))

(declare-fun b!342106 () Bool)

(assert (=> b!342106 (= e!209781 tp_is_empty!7237)))

(declare-fun b!342107 () Bool)

(assert (=> b!342107 (= e!209780 e!209778)))

(declare-fun res!189121 () Bool)

(assert (=> b!342107 (=> (not res!189121) (not e!209778))))

(declare-datatypes ((SeekEntryResult!3293 0))(
  ( (MissingZero!3293 (index!15351 (_ BitVec 32))) (Found!3293 (index!15352 (_ BitVec 32))) (Intermediate!3293 (undefined!4105 Bool) (index!15353 (_ BitVec 32)) (x!34078 (_ BitVec 32))) (Undefined!3293) (MissingVacant!3293 (index!15354 (_ BitVec 32))) )
))
(declare-fun lt!161899 () SeekEntryResult!3293)

(get-info :version)

(assert (=> b!342107 (= res!189121 (and (not ((_ is Found!3293) lt!161899)) (not ((_ is MissingZero!3293) lt!161899)) ((_ is MissingVacant!3293) lt!161899)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18055 (_ BitVec 32)) SeekEntryResult!3293)

(assert (=> b!342107 (= lt!161899 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34296 res!189123) b!342098))

(assert (= (and b!342098 res!189124) b!342102))

(assert (= (and b!342102 res!189119) b!342105))

(assert (= (and b!342105 res!189122) b!342099))

(assert (= (and b!342099 res!189120) b!342100))

(assert (= (and b!342100 res!189125) b!342107))

(assert (= (and b!342107 res!189121) b!342097))

(assert (= (and b!342097 c!52736) b!342104))

(assert (= (and b!342097 (not c!52736)) b!342103))

(assert (= (and b!342101 condMapEmpty!12288) mapIsEmpty!12288))

(assert (= (and b!342101 (not condMapEmpty!12288)) mapNonEmpty!12288))

(assert (= (and mapNonEmpty!12288 ((_ is ValueCellFull!3275) mapValue!12288)) b!342096))

(assert (= (and b!342101 ((_ is ValueCellFull!3275) mapDefault!12288)) b!342106))

(assert (= start!34296 b!342101))

(declare-fun m!343815 () Bool)

(assert (=> start!34296 m!343815))

(declare-fun m!343817 () Bool)

(assert (=> start!34296 m!343817))

(declare-fun m!343819 () Bool)

(assert (=> start!34296 m!343819))

(declare-fun m!343821 () Bool)

(assert (=> b!342100 m!343821))

(assert (=> b!342100 m!343821))

(declare-fun m!343823 () Bool)

(assert (=> b!342100 m!343823))

(declare-fun m!343825 () Bool)

(assert (=> b!342105 m!343825))

(declare-fun m!343827 () Bool)

(assert (=> b!342107 m!343827))

(declare-fun m!343829 () Bool)

(assert (=> b!342104 m!343829))

(assert (=> b!342104 m!343829))

(declare-fun m!343831 () Bool)

(assert (=> b!342104 m!343831))

(declare-fun m!343833 () Bool)

(assert (=> b!342097 m!343833))

(declare-fun m!343835 () Bool)

(assert (=> mapNonEmpty!12288 m!343835))

(declare-fun m!343837 () Bool)

(assert (=> b!342102 m!343837))

(declare-fun m!343839 () Bool)

(assert (=> b!342099 m!343839))

(check-sat (not b!342104) tp_is_empty!7237 (not b_next!7285) (not mapNonEmpty!12288) (not b!342102) (not start!34296) (not b!342107) (not b!342099) (not b!342097) (not b!342100) b_and!14463 (not b!342105))
(check-sat b_and!14463 (not b_next!7285))
