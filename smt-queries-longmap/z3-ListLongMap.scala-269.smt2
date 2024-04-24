; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4436 () Bool)

(assert start!4436)

(declare-fun b_free!1201 () Bool)

(declare-fun b_next!1201 () Bool)

(assert (=> start!4436 (= b_free!1201 (not b_next!1201))))

(declare-fun tp!5040 () Bool)

(declare-fun b_and!2013 () Bool)

(assert (=> start!4436 (= tp!5040 b_and!2013)))

(declare-fun mapNonEmpty!1879 () Bool)

(declare-fun mapRes!1879 () Bool)

(declare-fun tp!5041 () Bool)

(declare-fun e!21687 () Bool)

(assert (=> mapNonEmpty!1879 (= mapRes!1879 (and tp!5041 e!21687))))

(declare-datatypes ((V!1899 0))(
  ( (V!1900 (val!804 Int)) )
))
(declare-datatypes ((ValueCell!578 0))(
  ( (ValueCellFull!578 (v!1899 V!1899)) (EmptyCell!578) )
))
(declare-datatypes ((array!2311 0))(
  ( (array!2312 (arr!1103 (Array (_ BitVec 32) ValueCell!578)) (size!1204 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2311)

(declare-fun mapKey!1879 () (_ BitVec 32))

(declare-fun mapRest!1879 () (Array (_ BitVec 32) ValueCell!578))

(declare-fun mapValue!1879 () ValueCell!578)

(assert (=> mapNonEmpty!1879 (= (arr!1103 _values!1501) (store mapRest!1879 mapKey!1879 mapValue!1879))))

(declare-fun b!34159 () Bool)

(declare-fun res!20707 () Bool)

(declare-fun e!21685 () Bool)

(assert (=> b!34159 (=> (not res!20707) (not e!21685))))

(declare-datatypes ((array!2313 0))(
  ( (array!2314 (arr!1104 (Array (_ BitVec 32) (_ BitVec 64))) (size!1205 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2313)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2313 (_ BitVec 32)) Bool)

(assert (=> b!34159 (= res!20707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34160 () Bool)

(declare-fun res!20708 () Bool)

(declare-fun e!21682 () Bool)

(assert (=> b!34160 (=> (not res!20708) (not e!21682))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34160 (= res!20708 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!34161 () Bool)

(declare-fun e!21684 () Bool)

(declare-fun tp_is_empty!1555 () Bool)

(assert (=> b!34161 (= e!21684 tp_is_empty!1555)))

(declare-fun b!34162 () Bool)

(assert (=> b!34162 (= e!21687 tp_is_empty!1555)))

(declare-fun res!20706 () Bool)

(assert (=> start!4436 (=> (not res!20706) (not e!21685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4436 (= res!20706 (validMask!0 mask!2294))))

(assert (=> start!4436 e!21685))

(assert (=> start!4436 true))

(assert (=> start!4436 tp!5040))

(declare-fun e!21686 () Bool)

(declare-fun array_inv!755 (array!2311) Bool)

(assert (=> start!4436 (and (array_inv!755 _values!1501) e!21686)))

(declare-fun array_inv!756 (array!2313) Bool)

(assert (=> start!4436 (array_inv!756 _keys!1833)))

(assert (=> start!4436 tp_is_empty!1555))

(declare-fun b!34163 () Bool)

(declare-fun res!20704 () Bool)

(assert (=> b!34163 (=> (not res!20704) (not e!21685))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34163 (= res!20704 (and (= (size!1204 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1205 _keys!1833) (size!1204 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1879 () Bool)

(assert (=> mapIsEmpty!1879 mapRes!1879))

(declare-fun b!34164 () Bool)

(assert (=> b!34164 (= e!21682 (not true))))

(declare-fun lt!12681 () (_ BitVec 32))

(assert (=> b!34164 (arrayForallSeekEntryOrOpenFound!0 lt!12681 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!773 0))(
  ( (Unit!774) )
))
(declare-fun lt!12682 () Unit!773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!773)

(assert (=> b!34164 (= lt!12682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12681))))

(declare-datatypes ((SeekEntryResult!132 0))(
  ( (MissingZero!132 (index!2650 (_ BitVec 32))) (Found!132 (index!2651 (_ BitVec 32))) (Intermediate!132 (undefined!944 Bool) (index!2652 (_ BitVec 32)) (x!6886 (_ BitVec 32))) (Undefined!132) (MissingVacant!132 (index!2653 (_ BitVec 32))) )
))
(declare-fun lt!12680 () SeekEntryResult!132)

(get-info :version)

(assert (=> b!34164 (and ((_ is Found!132) lt!12680) (= (index!2651 lt!12680) lt!12681))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2313 (_ BitVec 32)) SeekEntryResult!132)

(assert (=> b!34164 (= lt!12680 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12685 () Unit!773)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2313 (_ BitVec 32)) Unit!773)

(assert (=> b!34164 (= lt!12685 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12681 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1286 0))(
  ( (tuple2!1287 (_1!654 (_ BitVec 64)) (_2!654 V!1899)) )
))
(declare-datatypes ((List!879 0))(
  ( (Nil!876) (Cons!875 (h!1442 tuple2!1286) (t!3578 List!879)) )
))
(declare-datatypes ((ListLongMap!857 0))(
  ( (ListLongMap!858 (toList!444 List!879)) )
))
(declare-fun lt!12683 () ListLongMap!857)

(declare-fun contains!392 (ListLongMap!857 (_ BitVec 64)) Bool)

(assert (=> b!34164 (contains!392 lt!12683 (select (arr!1104 _keys!1833) lt!12681))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!12684 () Unit!773)

(declare-fun zeroValue!1443 () V!1899)

(declare-fun minValue!1443 () V!1899)

(declare-fun lemmaValidKeyInArrayIsInListMap!66 (array!2313 array!2311 (_ BitVec 32) (_ BitVec 32) V!1899 V!1899 (_ BitVec 32) Int) Unit!773)

(assert (=> b!34164 (= lt!12684 (lemmaValidKeyInArrayIsInListMap!66 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12681 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2313 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!34164 (= lt!12681 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!34165 () Bool)

(assert (=> b!34165 (= e!21686 (and e!21684 mapRes!1879))))

(declare-fun condMapEmpty!1879 () Bool)

(declare-fun mapDefault!1879 () ValueCell!578)

(assert (=> b!34165 (= condMapEmpty!1879 (= (arr!1103 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!578)) mapDefault!1879)))))

(declare-fun b!34166 () Bool)

(assert (=> b!34166 (= e!21685 e!21682)))

(declare-fun res!20705 () Bool)

(assert (=> b!34166 (=> (not res!20705) (not e!21682))))

(assert (=> b!34166 (= res!20705 (not (contains!392 lt!12683 k0!1304)))))

(declare-fun getCurrentListMap!266 (array!2313 array!2311 (_ BitVec 32) (_ BitVec 32) V!1899 V!1899 (_ BitVec 32) Int) ListLongMap!857)

(assert (=> b!34166 (= lt!12683 (getCurrentListMap!266 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!34167 () Bool)

(declare-fun res!20702 () Bool)

(assert (=> b!34167 (=> (not res!20702) (not e!21685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34167 (= res!20702 (validKeyInArray!0 k0!1304))))

(declare-fun b!34168 () Bool)

(declare-fun res!20703 () Bool)

(assert (=> b!34168 (=> (not res!20703) (not e!21685))))

(declare-datatypes ((List!880 0))(
  ( (Nil!877) (Cons!876 (h!1443 (_ BitVec 64)) (t!3579 List!880)) )
))
(declare-fun arrayNoDuplicates!0 (array!2313 (_ BitVec 32) List!880) Bool)

(assert (=> b!34168 (= res!20703 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!877))))

(assert (= (and start!4436 res!20706) b!34163))

(assert (= (and b!34163 res!20704) b!34159))

(assert (= (and b!34159 res!20707) b!34168))

(assert (= (and b!34168 res!20703) b!34167))

(assert (= (and b!34167 res!20702) b!34166))

(assert (= (and b!34166 res!20705) b!34160))

(assert (= (and b!34160 res!20708) b!34164))

(assert (= (and b!34165 condMapEmpty!1879) mapIsEmpty!1879))

(assert (= (and b!34165 (not condMapEmpty!1879)) mapNonEmpty!1879))

(assert (= (and mapNonEmpty!1879 ((_ is ValueCellFull!578) mapValue!1879)) b!34162))

(assert (= (and b!34165 ((_ is ValueCellFull!578) mapDefault!1879)) b!34161))

(assert (= start!4436 b!34165))

(declare-fun m!27421 () Bool)

(assert (=> b!34159 m!27421))

(declare-fun m!27423 () Bool)

(assert (=> b!34168 m!27423))

(declare-fun m!27425 () Bool)

(assert (=> b!34164 m!27425))

(declare-fun m!27427 () Bool)

(assert (=> b!34164 m!27427))

(assert (=> b!34164 m!27427))

(declare-fun m!27429 () Bool)

(assert (=> b!34164 m!27429))

(declare-fun m!27431 () Bool)

(assert (=> b!34164 m!27431))

(declare-fun m!27433 () Bool)

(assert (=> b!34164 m!27433))

(declare-fun m!27435 () Bool)

(assert (=> b!34164 m!27435))

(declare-fun m!27437 () Bool)

(assert (=> b!34164 m!27437))

(declare-fun m!27439 () Bool)

(assert (=> b!34164 m!27439))

(declare-fun m!27441 () Bool)

(assert (=> b!34166 m!27441))

(declare-fun m!27443 () Bool)

(assert (=> b!34166 m!27443))

(declare-fun m!27445 () Bool)

(assert (=> start!4436 m!27445))

(declare-fun m!27447 () Bool)

(assert (=> start!4436 m!27447))

(declare-fun m!27449 () Bool)

(assert (=> start!4436 m!27449))

(declare-fun m!27451 () Bool)

(assert (=> b!34167 m!27451))

(declare-fun m!27453 () Bool)

(assert (=> mapNonEmpty!1879 m!27453))

(declare-fun m!27455 () Bool)

(assert (=> b!34160 m!27455))

(check-sat (not mapNonEmpty!1879) (not b!34167) b_and!2013 (not b!34159) tp_is_empty!1555 (not b!34160) (not b!34168) (not start!4436) (not b!34166) (not b!34164) (not b_next!1201))
(check-sat b_and!2013 (not b_next!1201))
