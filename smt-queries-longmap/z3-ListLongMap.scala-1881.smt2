; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33706 () Bool)

(assert start!33706)

(declare-fun b_free!6955 () Bool)

(declare-fun b_next!6955 () Bool)

(assert (=> start!33706 (= b_free!6955 (not b_next!6955))))

(declare-fun tp!24369 () Bool)

(declare-fun b_and!14149 () Bool)

(assert (=> start!33706 (= tp!24369 b_and!14149)))

(declare-fun b!335209 () Bool)

(declare-fun res!184974 () Bool)

(declare-fun e!205760 () Bool)

(assert (=> b!335209 (=> (not res!184974) (not e!205760))))

(declare-datatypes ((array!17398 0))(
  ( (array!17399 (arr!8229 (Array (_ BitVec 32) (_ BitVec 64))) (size!8581 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17398)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17398 (_ BitVec 32)) Bool)

(assert (=> b!335209 (= res!184974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335210 () Bool)

(declare-fun e!205762 () Bool)

(assert (=> b!335210 (= e!205762 (not true))))

(declare-datatypes ((V!10187 0))(
  ( (V!10188 (val!3498 Int)) )
))
(declare-datatypes ((tuple2!5002 0))(
  ( (tuple2!5003 (_1!2512 (_ BitVec 64)) (_2!2512 V!10187)) )
))
(declare-datatypes ((List!4619 0))(
  ( (Nil!4616) (Cons!4615 (h!5471 tuple2!5002) (t!9699 List!4619)) )
))
(declare-datatypes ((ListLongMap!3917 0))(
  ( (ListLongMap!3918 (toList!1974 List!4619)) )
))
(declare-fun lt!159784 () ListLongMap!3917)

(declare-datatypes ((SeekEntryResult!3146 0))(
  ( (MissingZero!3146 (index!14763 (_ BitVec 32))) (Found!3146 (index!14764 (_ BitVec 32))) (Intermediate!3146 (undefined!3958 Bool) (index!14765 (_ BitVec 32)) (x!33373 (_ BitVec 32))) (Undefined!3146) (MissingVacant!3146 (index!14766 (_ BitVec 32))) )
))
(declare-fun lt!159785 () SeekEntryResult!3146)

(declare-fun contains!2037 (ListLongMap!3917 (_ BitVec 64)) Bool)

(assert (=> b!335210 (contains!2037 lt!159784 (select (arr!8229 _keys!1895) (index!14764 lt!159785)))))

(declare-fun zeroValue!1467 () V!10187)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10187)

(declare-datatypes ((ValueCell!3110 0))(
  ( (ValueCellFull!3110 (v!5661 V!10187)) (EmptyCell!3110) )
))
(declare-datatypes ((array!17400 0))(
  ( (array!17401 (arr!8230 (Array (_ BitVec 32) ValueCell!3110)) (size!8582 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17400)

(declare-datatypes ((Unit!10411 0))(
  ( (Unit!10412) )
))
(declare-fun lt!159787 () Unit!10411)

(declare-fun lemmaValidKeyInArrayIsInListMap!163 (array!17398 array!17400 (_ BitVec 32) (_ BitVec 32) V!10187 V!10187 (_ BitVec 32) Int) Unit!10411)

(assert (=> b!335210 (= lt!159787 (lemmaValidKeyInArrayIsInListMap!163 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14764 lt!159785) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335210 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159786 () Unit!10411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17398 (_ BitVec 64) (_ BitVec 32)) Unit!10411)

(assert (=> b!335210 (= lt!159786 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14764 lt!159785)))))

(declare-fun b!335211 () Bool)

(declare-fun res!184973 () Bool)

(assert (=> b!335211 (=> (not res!184973) (not e!205762))))

(assert (=> b!335211 (= res!184973 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14764 lt!159785)))))

(declare-fun b!335212 () Bool)

(declare-fun e!205763 () Bool)

(declare-fun tp_is_empty!6907 () Bool)

(assert (=> b!335212 (= e!205763 tp_is_empty!6907)))

(declare-fun b!335213 () Bool)

(declare-fun res!184976 () Bool)

(assert (=> b!335213 (=> (not res!184976) (not e!205760))))

(assert (=> b!335213 (= res!184976 (and (= (size!8582 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8581 _keys!1895) (size!8582 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!184969 () Bool)

(assert (=> start!33706 (=> (not res!184969) (not e!205760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33706 (= res!184969 (validMask!0 mask!2385))))

(assert (=> start!33706 e!205760))

(assert (=> start!33706 true))

(assert (=> start!33706 tp_is_empty!6907))

(assert (=> start!33706 tp!24369))

(declare-fun e!205757 () Bool)

(declare-fun array_inv!6124 (array!17400) Bool)

(assert (=> start!33706 (and (array_inv!6124 _values!1525) e!205757)))

(declare-fun array_inv!6125 (array!17398) Bool)

(assert (=> start!33706 (array_inv!6125 _keys!1895)))

(declare-fun b!335214 () Bool)

(declare-fun e!205759 () Bool)

(assert (=> b!335214 (= e!205759 e!205762)))

(declare-fun res!184971 () Bool)

(assert (=> b!335214 (=> (not res!184971) (not e!205762))))

(get-info :version)

(assert (=> b!335214 (= res!184971 (and ((_ is Found!3146) lt!159785) (= (select (arr!8229 _keys!1895) (index!14764 lt!159785)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17398 (_ BitVec 32)) SeekEntryResult!3146)

(assert (=> b!335214 (= lt!159785 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335215 () Bool)

(declare-fun res!184975 () Bool)

(assert (=> b!335215 (=> (not res!184975) (not e!205760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335215 (= res!184975 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11757 () Bool)

(declare-fun mapRes!11757 () Bool)

(assert (=> mapIsEmpty!11757 mapRes!11757))

(declare-fun b!335216 () Bool)

(declare-fun res!184970 () Bool)

(assert (=> b!335216 (=> (not res!184970) (not e!205760))))

(declare-datatypes ((List!4620 0))(
  ( (Nil!4617) (Cons!4616 (h!5472 (_ BitVec 64)) (t!9700 List!4620)) )
))
(declare-fun arrayNoDuplicates!0 (array!17398 (_ BitVec 32) List!4620) Bool)

(assert (=> b!335216 (= res!184970 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4617))))

(declare-fun b!335217 () Bool)

(assert (=> b!335217 (= e!205757 (and e!205763 mapRes!11757))))

(declare-fun condMapEmpty!11757 () Bool)

(declare-fun mapDefault!11757 () ValueCell!3110)

(assert (=> b!335217 (= condMapEmpty!11757 (= (arr!8230 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3110)) mapDefault!11757)))))

(declare-fun mapNonEmpty!11757 () Bool)

(declare-fun tp!24368 () Bool)

(declare-fun e!205761 () Bool)

(assert (=> mapNonEmpty!11757 (= mapRes!11757 (and tp!24368 e!205761))))

(declare-fun mapKey!11757 () (_ BitVec 32))

(declare-fun mapRest!11757 () (Array (_ BitVec 32) ValueCell!3110))

(declare-fun mapValue!11757 () ValueCell!3110)

(assert (=> mapNonEmpty!11757 (= (arr!8230 _values!1525) (store mapRest!11757 mapKey!11757 mapValue!11757))))

(declare-fun b!335218 () Bool)

(assert (=> b!335218 (= e!205761 tp_is_empty!6907)))

(declare-fun b!335219 () Bool)

(assert (=> b!335219 (= e!205760 e!205759)))

(declare-fun res!184972 () Bool)

(assert (=> b!335219 (=> (not res!184972) (not e!205759))))

(assert (=> b!335219 (= res!184972 (not (contains!2037 lt!159784 k0!1348)))))

(declare-fun getCurrentListMap!1504 (array!17398 array!17400 (_ BitVec 32) (_ BitVec 32) V!10187 V!10187 (_ BitVec 32) Int) ListLongMap!3917)

(assert (=> b!335219 (= lt!159784 (getCurrentListMap!1504 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(assert (= (and start!33706 res!184969) b!335213))

(assert (= (and b!335213 res!184976) b!335209))

(assert (= (and b!335209 res!184974) b!335216))

(assert (= (and b!335216 res!184970) b!335215))

(assert (= (and b!335215 res!184975) b!335219))

(assert (= (and b!335219 res!184972) b!335214))

(assert (= (and b!335214 res!184971) b!335211))

(assert (= (and b!335211 res!184973) b!335210))

(assert (= (and b!335217 condMapEmpty!11757) mapIsEmpty!11757))

(assert (= (and b!335217 (not condMapEmpty!11757)) mapNonEmpty!11757))

(assert (= (and mapNonEmpty!11757 ((_ is ValueCellFull!3110) mapValue!11757)) b!335218))

(assert (= (and b!335217 ((_ is ValueCellFull!3110) mapDefault!11757)) b!335212))

(assert (= start!33706 b!335217))

(declare-fun m!339485 () Bool)

(assert (=> b!335214 m!339485))

(declare-fun m!339487 () Bool)

(assert (=> b!335214 m!339487))

(declare-fun m!339489 () Bool)

(assert (=> b!335209 m!339489))

(declare-fun m!339491 () Bool)

(assert (=> b!335219 m!339491))

(declare-fun m!339493 () Bool)

(assert (=> b!335219 m!339493))

(declare-fun m!339495 () Bool)

(assert (=> b!335211 m!339495))

(declare-fun m!339497 () Bool)

(assert (=> b!335215 m!339497))

(declare-fun m!339499 () Bool)

(assert (=> b!335216 m!339499))

(declare-fun m!339501 () Bool)

(assert (=> start!33706 m!339501))

(declare-fun m!339503 () Bool)

(assert (=> start!33706 m!339503))

(declare-fun m!339505 () Bool)

(assert (=> start!33706 m!339505))

(assert (=> b!335210 m!339485))

(declare-fun m!339507 () Bool)

(assert (=> b!335210 m!339507))

(declare-fun m!339509 () Bool)

(assert (=> b!335210 m!339509))

(declare-fun m!339511 () Bool)

(assert (=> b!335210 m!339511))

(assert (=> b!335210 m!339485))

(declare-fun m!339513 () Bool)

(assert (=> b!335210 m!339513))

(declare-fun m!339515 () Bool)

(assert (=> mapNonEmpty!11757 m!339515))

(check-sat (not b!335219) (not b!335214) (not b!335211) (not b!335210) (not b!335209) (not start!33706) tp_is_empty!6907 (not b!335216) (not b_next!6955) (not mapNonEmpty!11757) b_and!14149 (not b!335215))
(check-sat b_and!14149 (not b_next!6955))
