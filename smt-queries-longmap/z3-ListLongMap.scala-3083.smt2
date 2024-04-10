; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43392 () Bool)

(assert start!43392)

(declare-fun b_free!12219 () Bool)

(declare-fun b_next!12219 () Bool)

(assert (=> start!43392 (= b_free!12219 (not b_next!12219))))

(declare-fun tp!42933 () Bool)

(declare-fun b_and!20975 () Bool)

(assert (=> start!43392 (= tp!42933 b_and!20975)))

(declare-fun res!286730 () Bool)

(declare-fun e!282905 () Bool)

(assert (=> start!43392 (=> (not res!286730) (not e!282905))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43392 (= res!286730 (validMask!0 mask!2352))))

(assert (=> start!43392 e!282905))

(assert (=> start!43392 true))

(declare-fun tp_is_empty!13731 () Bool)

(assert (=> start!43392 tp_is_empty!13731))

(declare-datatypes ((V!19379 0))(
  ( (V!19380 (val!6913 Int)) )
))
(declare-datatypes ((ValueCell!6504 0))(
  ( (ValueCellFull!6504 (v!9204 V!19379)) (EmptyCell!6504) )
))
(declare-datatypes ((array!31127 0))(
  ( (array!31128 (arr!14968 (Array (_ BitVec 32) ValueCell!6504)) (size!15326 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31127)

(declare-fun e!282908 () Bool)

(declare-fun array_inv!10796 (array!31127) Bool)

(assert (=> start!43392 (and (array_inv!10796 _values!1516) e!282908)))

(assert (=> start!43392 tp!42933))

(declare-datatypes ((array!31129 0))(
  ( (array!31130 (arr!14969 (Array (_ BitVec 32) (_ BitVec 64))) (size!15327 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31129)

(declare-fun array_inv!10797 (array!31129) Bool)

(assert (=> start!43392 (array_inv!10797 _keys!1874)))

(declare-fun b!480825 () Bool)

(declare-fun e!282904 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480825 (= e!282904 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22300 () Bool)

(declare-fun mapRes!22300 () Bool)

(assert (=> mapIsEmpty!22300 mapRes!22300))

(declare-fun b!480826 () Bool)

(assert (=> b!480826 (= e!282905 (not (= (size!15327 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218234 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31129 (_ BitVec 32)) Bool)

(assert (=> b!480826 (arrayForallSeekEntryOrOpenFound!0 lt!218234 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14102 0))(
  ( (Unit!14103) )
))
(declare-fun lt!218236 () Unit!14102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14102)

(assert (=> b!480826 (= lt!218236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218234))))

(declare-fun arrayScanForKey!0 (array!31129 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480826 (= lt!218234 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480826 e!282904))

(declare-fun c!57814 () Bool)

(assert (=> b!480826 (= c!57814 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218235 () Unit!14102)

(declare-fun minValue!1458 () V!19379)

(declare-fun zeroValue!1458 () V!19379)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!124 (array!31129 array!31127 (_ BitVec 32) (_ BitVec 32) V!19379 V!19379 (_ BitVec 64) Int) Unit!14102)

(assert (=> b!480826 (= lt!218235 (lemmaKeyInListMapIsInArray!124 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480827 () Bool)

(declare-fun res!286726 () Bool)

(assert (=> b!480827 (=> (not res!286726) (not e!282905))))

(assert (=> b!480827 (= res!286726 (and (= (size!15326 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15327 _keys!1874) (size!15326 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480828 () Bool)

(declare-fun arrayContainsKey!0 (array!31129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480828 (= e!282904 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480829 () Bool)

(declare-fun e!282907 () Bool)

(assert (=> b!480829 (= e!282908 (and e!282907 mapRes!22300))))

(declare-fun condMapEmpty!22300 () Bool)

(declare-fun mapDefault!22300 () ValueCell!6504)

(assert (=> b!480829 (= condMapEmpty!22300 (= (arr!14968 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6504)) mapDefault!22300)))))

(declare-fun b!480830 () Bool)

(declare-fun res!286727 () Bool)

(assert (=> b!480830 (=> (not res!286727) (not e!282905))))

(declare-datatypes ((tuple2!9072 0))(
  ( (tuple2!9073 (_1!4547 (_ BitVec 64)) (_2!4547 V!19379)) )
))
(declare-datatypes ((List!9150 0))(
  ( (Nil!9147) (Cons!9146 (h!10002 tuple2!9072) (t!15360 List!9150)) )
))
(declare-datatypes ((ListLongMap!7985 0))(
  ( (ListLongMap!7986 (toList!4008 List!9150)) )
))
(declare-fun contains!2620 (ListLongMap!7985 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2327 (array!31129 array!31127 (_ BitVec 32) (_ BitVec 32) V!19379 V!19379 (_ BitVec 32) Int) ListLongMap!7985)

(assert (=> b!480830 (= res!286727 (contains!2620 (getCurrentListMap!2327 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480831 () Bool)

(declare-fun res!286731 () Bool)

(assert (=> b!480831 (=> (not res!286731) (not e!282905))))

(declare-datatypes ((List!9151 0))(
  ( (Nil!9148) (Cons!9147 (h!10003 (_ BitVec 64)) (t!15361 List!9151)) )
))
(declare-fun arrayNoDuplicates!0 (array!31129 (_ BitVec 32) List!9151) Bool)

(assert (=> b!480831 (= res!286731 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9148))))

(declare-fun b!480832 () Bool)

(declare-fun e!282906 () Bool)

(assert (=> b!480832 (= e!282906 tp_is_empty!13731)))

(declare-fun b!480833 () Bool)

(declare-fun res!286728 () Bool)

(assert (=> b!480833 (=> (not res!286728) (not e!282905))))

(assert (=> b!480833 (= res!286728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480834 () Bool)

(declare-fun res!286729 () Bool)

(assert (=> b!480834 (=> (not res!286729) (not e!282905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480834 (= res!286729 (validKeyInArray!0 k0!1332))))

(declare-fun b!480835 () Bool)

(assert (=> b!480835 (= e!282907 tp_is_empty!13731)))

(declare-fun mapNonEmpty!22300 () Bool)

(declare-fun tp!42934 () Bool)

(assert (=> mapNonEmpty!22300 (= mapRes!22300 (and tp!42934 e!282906))))

(declare-fun mapKey!22300 () (_ BitVec 32))

(declare-fun mapValue!22300 () ValueCell!6504)

(declare-fun mapRest!22300 () (Array (_ BitVec 32) ValueCell!6504))

(assert (=> mapNonEmpty!22300 (= (arr!14968 _values!1516) (store mapRest!22300 mapKey!22300 mapValue!22300))))

(assert (= (and start!43392 res!286730) b!480827))

(assert (= (and b!480827 res!286726) b!480833))

(assert (= (and b!480833 res!286728) b!480831))

(assert (= (and b!480831 res!286731) b!480830))

(assert (= (and b!480830 res!286727) b!480834))

(assert (= (and b!480834 res!286729) b!480826))

(assert (= (and b!480826 c!57814) b!480828))

(assert (= (and b!480826 (not c!57814)) b!480825))

(assert (= (and b!480829 condMapEmpty!22300) mapIsEmpty!22300))

(assert (= (and b!480829 (not condMapEmpty!22300)) mapNonEmpty!22300))

(get-info :version)

(assert (= (and mapNonEmpty!22300 ((_ is ValueCellFull!6504) mapValue!22300)) b!480832))

(assert (= (and b!480829 ((_ is ValueCellFull!6504) mapDefault!22300)) b!480835))

(assert (= start!43392 b!480829))

(declare-fun m!462387 () Bool)

(assert (=> b!480826 m!462387))

(declare-fun m!462389 () Bool)

(assert (=> b!480826 m!462389))

(declare-fun m!462391 () Bool)

(assert (=> b!480826 m!462391))

(declare-fun m!462393 () Bool)

(assert (=> b!480826 m!462393))

(declare-fun m!462395 () Bool)

(assert (=> b!480834 m!462395))

(declare-fun m!462397 () Bool)

(assert (=> b!480833 m!462397))

(declare-fun m!462399 () Bool)

(assert (=> b!480831 m!462399))

(declare-fun m!462401 () Bool)

(assert (=> b!480828 m!462401))

(declare-fun m!462403 () Bool)

(assert (=> b!480830 m!462403))

(assert (=> b!480830 m!462403))

(declare-fun m!462405 () Bool)

(assert (=> b!480830 m!462405))

(declare-fun m!462407 () Bool)

(assert (=> start!43392 m!462407))

(declare-fun m!462409 () Bool)

(assert (=> start!43392 m!462409))

(declare-fun m!462411 () Bool)

(assert (=> start!43392 m!462411))

(declare-fun m!462413 () Bool)

(assert (=> mapNonEmpty!22300 m!462413))

(check-sat (not mapNonEmpty!22300) (not start!43392) (not b_next!12219) (not b!480830) (not b!480834) (not b!480831) (not b!480833) (not b!480826) b_and!20975 (not b!480828) tp_is_empty!13731)
(check-sat b_and!20975 (not b_next!12219))
