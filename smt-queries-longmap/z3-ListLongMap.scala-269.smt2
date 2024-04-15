; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4430 () Bool)

(assert start!4430)

(declare-fun b_free!1201 () Bool)

(declare-fun b_next!1201 () Bool)

(assert (=> start!4430 (= b_free!1201 (not b_next!1201))))

(declare-fun tp!5040 () Bool)

(declare-fun b_and!2017 () Bool)

(assert (=> start!4430 (= tp!5040 b_and!2017)))

(declare-fun b!34177 () Bool)

(declare-fun res!20711 () Bool)

(declare-fun e!21694 () Bool)

(assert (=> b!34177 (=> (not res!20711) (not e!21694))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34177 (= res!20711 (validKeyInArray!0 k0!1304))))

(declare-fun b!34178 () Bool)

(declare-fun res!20712 () Bool)

(declare-fun e!21696 () Bool)

(assert (=> b!34178 (=> (not res!20712) (not e!21696))))

(declare-datatypes ((array!2301 0))(
  ( (array!2302 (arr!1098 (Array (_ BitVec 32) (_ BitVec 64))) (size!1199 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2301)

(declare-fun arrayContainsKey!0 (array!2301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34178 (= res!20712 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!34179 () Bool)

(declare-fun e!21693 () Bool)

(declare-fun tp_is_empty!1555 () Bool)

(assert (=> b!34179 (= e!21693 tp_is_empty!1555)))

(declare-fun b!34180 () Bool)

(declare-fun e!21695 () Bool)

(declare-fun mapRes!1879 () Bool)

(assert (=> b!34180 (= e!21695 (and e!21693 mapRes!1879))))

(declare-fun condMapEmpty!1879 () Bool)

(declare-datatypes ((V!1899 0))(
  ( (V!1900 (val!804 Int)) )
))
(declare-datatypes ((ValueCell!578 0))(
  ( (ValueCellFull!578 (v!1898 V!1899)) (EmptyCell!578) )
))
(declare-datatypes ((array!2303 0))(
  ( (array!2304 (arr!1099 (Array (_ BitVec 32) ValueCell!578)) (size!1200 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2303)

(declare-fun mapDefault!1879 () ValueCell!578)

(assert (=> b!34180 (= condMapEmpty!1879 (= (arr!1099 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!578)) mapDefault!1879)))))

(declare-fun b!34181 () Bool)

(assert (=> b!34181 (= e!21696 (not true))))

(declare-fun lt!12723 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2301 (_ BitVec 32)) Bool)

(assert (=> b!34181 (arrayForallSeekEntryOrOpenFound!0 lt!12723 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!772 0))(
  ( (Unit!773) )
))
(declare-fun lt!12722 () Unit!772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!772)

(assert (=> b!34181 (= lt!12722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12723))))

(declare-datatypes ((SeekEntryResult!145 0))(
  ( (MissingZero!145 (index!2702 (_ BitVec 32))) (Found!145 (index!2703 (_ BitVec 32))) (Intermediate!145 (undefined!957 Bool) (index!2704 (_ BitVec 32)) (x!6899 (_ BitVec 32))) (Undefined!145) (MissingVacant!145 (index!2705 (_ BitVec 32))) )
))
(declare-fun lt!12720 () SeekEntryResult!145)

(get-info :version)

(assert (=> b!34181 (and ((_ is Found!145) lt!12720) (= (index!2703 lt!12720) lt!12723))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2301 (_ BitVec 32)) SeekEntryResult!145)

(assert (=> b!34181 (= lt!12720 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12721 () Unit!772)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2301 (_ BitVec 32)) Unit!772)

(assert (=> b!34181 (= lt!12721 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12723 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1306 0))(
  ( (tuple2!1307 (_1!664 (_ BitVec 64)) (_2!664 V!1899)) )
))
(declare-datatypes ((List!889 0))(
  ( (Nil!886) (Cons!885 (h!1452 tuple2!1306) (t!3587 List!889)) )
))
(declare-datatypes ((ListLongMap!871 0))(
  ( (ListLongMap!872 (toList!451 List!889)) )
))
(declare-fun lt!12725 () ListLongMap!871)

(declare-fun contains!398 (ListLongMap!871 (_ BitVec 64)) Bool)

(assert (=> b!34181 (contains!398 lt!12725 (select (arr!1098 _keys!1833) lt!12723))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!12724 () Unit!772)

(declare-fun zeroValue!1443 () V!1899)

(declare-fun minValue!1443 () V!1899)

(declare-fun lemmaValidKeyInArrayIsInListMap!66 (array!2301 array!2303 (_ BitVec 32) (_ BitVec 32) V!1899 V!1899 (_ BitVec 32) Int) Unit!772)

(assert (=> b!34181 (= lt!12724 (lemmaValidKeyInArrayIsInListMap!66 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12723 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2301 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!34181 (= lt!12723 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!34182 () Bool)

(declare-fun res!20714 () Bool)

(assert (=> b!34182 (=> (not res!20714) (not e!21694))))

(assert (=> b!34182 (= res!20714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34183 () Bool)

(declare-fun res!20713 () Bool)

(assert (=> b!34183 (=> (not res!20713) (not e!21694))))

(assert (=> b!34183 (= res!20713 (and (= (size!1200 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1199 _keys!1833) (size!1200 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34184 () Bool)

(declare-fun res!20716 () Bool)

(assert (=> b!34184 (=> (not res!20716) (not e!21694))))

(declare-datatypes ((List!890 0))(
  ( (Nil!887) (Cons!886 (h!1453 (_ BitVec 64)) (t!3588 List!890)) )
))
(declare-fun arrayNoDuplicates!0 (array!2301 (_ BitVec 32) List!890) Bool)

(assert (=> b!34184 (= res!20716 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!887))))

(declare-fun mapIsEmpty!1879 () Bool)

(assert (=> mapIsEmpty!1879 mapRes!1879))

(declare-fun b!34185 () Bool)

(assert (=> b!34185 (= e!21694 e!21696)))

(declare-fun res!20710 () Bool)

(assert (=> b!34185 (=> (not res!20710) (not e!21696))))

(assert (=> b!34185 (= res!20710 (not (contains!398 lt!12725 k0!1304)))))

(declare-fun getCurrentListMap!270 (array!2301 array!2303 (_ BitVec 32) (_ BitVec 32) V!1899 V!1899 (_ BitVec 32) Int) ListLongMap!871)

(assert (=> b!34185 (= lt!12725 (getCurrentListMap!270 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1879 () Bool)

(declare-fun tp!5041 () Bool)

(declare-fun e!21692 () Bool)

(assert (=> mapNonEmpty!1879 (= mapRes!1879 (and tp!5041 e!21692))))

(declare-fun mapValue!1879 () ValueCell!578)

(declare-fun mapRest!1879 () (Array (_ BitVec 32) ValueCell!578))

(declare-fun mapKey!1879 () (_ BitVec 32))

(assert (=> mapNonEmpty!1879 (= (arr!1099 _values!1501) (store mapRest!1879 mapKey!1879 mapValue!1879))))

(declare-fun res!20715 () Bool)

(assert (=> start!4430 (=> (not res!20715) (not e!21694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4430 (= res!20715 (validMask!0 mask!2294))))

(assert (=> start!4430 e!21694))

(assert (=> start!4430 true))

(assert (=> start!4430 tp!5040))

(declare-fun array_inv!781 (array!2303) Bool)

(assert (=> start!4430 (and (array_inv!781 _values!1501) e!21695)))

(declare-fun array_inv!782 (array!2301) Bool)

(assert (=> start!4430 (array_inv!782 _keys!1833)))

(assert (=> start!4430 tp_is_empty!1555))

(declare-fun b!34186 () Bool)

(assert (=> b!34186 (= e!21692 tp_is_empty!1555)))

(assert (= (and start!4430 res!20715) b!34183))

(assert (= (and b!34183 res!20713) b!34182))

(assert (= (and b!34182 res!20714) b!34184))

(assert (= (and b!34184 res!20716) b!34177))

(assert (= (and b!34177 res!20711) b!34185))

(assert (= (and b!34185 res!20710) b!34178))

(assert (= (and b!34178 res!20712) b!34181))

(assert (= (and b!34180 condMapEmpty!1879) mapIsEmpty!1879))

(assert (= (and b!34180 (not condMapEmpty!1879)) mapNonEmpty!1879))

(assert (= (and mapNonEmpty!1879 ((_ is ValueCellFull!578) mapValue!1879)) b!34186))

(assert (= (and b!34180 ((_ is ValueCellFull!578) mapDefault!1879)) b!34179))

(assert (= start!4430 b!34180))

(declare-fun m!27503 () Bool)

(assert (=> b!34181 m!27503))

(declare-fun m!27505 () Bool)

(assert (=> b!34181 m!27505))

(declare-fun m!27507 () Bool)

(assert (=> b!34181 m!27507))

(declare-fun m!27509 () Bool)

(assert (=> b!34181 m!27509))

(declare-fun m!27511 () Bool)

(assert (=> b!34181 m!27511))

(declare-fun m!27513 () Bool)

(assert (=> b!34181 m!27513))

(assert (=> b!34181 m!27505))

(declare-fun m!27515 () Bool)

(assert (=> b!34181 m!27515))

(declare-fun m!27517 () Bool)

(assert (=> b!34181 m!27517))

(declare-fun m!27519 () Bool)

(assert (=> b!34178 m!27519))

(declare-fun m!27521 () Bool)

(assert (=> b!34184 m!27521))

(declare-fun m!27523 () Bool)

(assert (=> b!34177 m!27523))

(declare-fun m!27525 () Bool)

(assert (=> start!4430 m!27525))

(declare-fun m!27527 () Bool)

(assert (=> start!4430 m!27527))

(declare-fun m!27529 () Bool)

(assert (=> start!4430 m!27529))

(declare-fun m!27531 () Bool)

(assert (=> b!34182 m!27531))

(declare-fun m!27533 () Bool)

(assert (=> b!34185 m!27533))

(declare-fun m!27535 () Bool)

(assert (=> b!34185 m!27535))

(declare-fun m!27537 () Bool)

(assert (=> mapNonEmpty!1879 m!27537))

(check-sat (not mapNonEmpty!1879) (not b!34185) (not b!34178) (not b_next!1201) b_and!2017 tp_is_empty!1555 (not b!34177) (not start!4430) (not b!34182) (not b!34181) (not b!34184))
(check-sat b_and!2017 (not b_next!1201))
