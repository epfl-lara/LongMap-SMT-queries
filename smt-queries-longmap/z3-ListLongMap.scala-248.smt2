; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4172 () Bool)

(assert start!4172)

(declare-fun b_free!1077 () Bool)

(declare-fun b_next!1077 () Bool)

(assert (=> start!4172 (= b_free!1077 (not b_next!1077))))

(declare-fun tp!4651 () Bool)

(declare-fun b_and!1887 () Bool)

(assert (=> start!4172 (= tp!4651 b_and!1887)))

(declare-fun b!31527 () Bool)

(declare-fun res!19100 () Bool)

(declare-fun e!20144 () Bool)

(assert (=> b!31527 (=> (not res!19100) (not e!20144))))

(declare-datatypes ((array!2079 0))(
  ( (array!2080 (arr!993 (Array (_ BitVec 32) (_ BitVec 64))) (size!1094 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2079)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2079 (_ BitVec 32)) Bool)

(assert (=> b!31527 (= res!19100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31528 () Bool)

(declare-fun res!19098 () Bool)

(assert (=> b!31528 (=> (not res!19098) (not e!20144))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31528 (= res!19098 (validKeyInArray!0 k0!1304))))

(declare-fun b!31529 () Bool)

(declare-fun res!19099 () Bool)

(assert (=> b!31529 (=> (not res!19099) (not e!20144))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1733 0))(
  ( (V!1734 (val!742 Int)) )
))
(declare-datatypes ((ValueCell!516 0))(
  ( (ValueCellFull!516 (v!1831 V!1733)) (EmptyCell!516) )
))
(declare-datatypes ((array!2081 0))(
  ( (array!2082 (arr!994 (Array (_ BitVec 32) ValueCell!516)) (size!1095 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2081)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1733)

(declare-fun minValue!1443 () V!1733)

(declare-datatypes ((tuple2!1210 0))(
  ( (tuple2!1211 (_1!616 (_ BitVec 64)) (_2!616 V!1733)) )
))
(declare-datatypes ((List!804 0))(
  ( (Nil!801) (Cons!800 (h!1367 tuple2!1210) (t!3497 List!804)) )
))
(declare-datatypes ((ListLongMap!787 0))(
  ( (ListLongMap!788 (toList!409 List!804)) )
))
(declare-fun contains!349 (ListLongMap!787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!237 (array!2079 array!2081 (_ BitVec 32) (_ BitVec 32) V!1733 V!1733 (_ BitVec 32) Int) ListLongMap!787)

(assert (=> b!31529 (= res!19099 (not (contains!349 (getCurrentListMap!237 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1675 () Bool)

(declare-fun mapRes!1675 () Bool)

(assert (=> mapIsEmpty!1675 mapRes!1675))

(declare-fun b!31530 () Bool)

(declare-fun e!20142 () Bool)

(declare-fun tp_is_empty!1431 () Bool)

(assert (=> b!31530 (= e!20142 tp_is_empty!1431)))

(declare-fun b!31531 () Bool)

(declare-fun res!19104 () Bool)

(assert (=> b!31531 (=> (not res!19104) (not e!20144))))

(declare-datatypes ((List!805 0))(
  ( (Nil!802) (Cons!801 (h!1368 (_ BitVec 64)) (t!3498 List!805)) )
))
(declare-fun arrayNoDuplicates!0 (array!2079 (_ BitVec 32) List!805) Bool)

(assert (=> b!31531 (= res!19104 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!802))))

(declare-fun res!19102 () Bool)

(assert (=> start!4172 (=> (not res!19102) (not e!20144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4172 (= res!19102 (validMask!0 mask!2294))))

(assert (=> start!4172 e!20144))

(assert (=> start!4172 true))

(assert (=> start!4172 tp!4651))

(declare-fun e!20141 () Bool)

(declare-fun array_inv!693 (array!2081) Bool)

(assert (=> start!4172 (and (array_inv!693 _values!1501) e!20141)))

(declare-fun array_inv!694 (array!2079) Bool)

(assert (=> start!4172 (array_inv!694 _keys!1833)))

(assert (=> start!4172 tp_is_empty!1431))

(declare-fun b!31532 () Bool)

(declare-fun res!19103 () Bool)

(assert (=> b!31532 (=> (not res!19103) (not e!20144))))

(declare-fun arrayContainsKey!0 (array!2079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31532 (= res!19103 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31533 () Bool)

(assert (=> b!31533 (= e!20141 (and e!20142 mapRes!1675))))

(declare-fun condMapEmpty!1675 () Bool)

(declare-fun mapDefault!1675 () ValueCell!516)

(assert (=> b!31533 (= condMapEmpty!1675 (= (arr!994 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!516)) mapDefault!1675)))))

(declare-fun b!31534 () Bool)

(assert (=> b!31534 (= e!20144 false)))

(declare-fun lt!11576 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2079 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31534 (= lt!11576 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31535 () Bool)

(declare-fun res!19101 () Bool)

(assert (=> b!31535 (=> (not res!19101) (not e!20144))))

(assert (=> b!31535 (= res!19101 (and (= (size!1095 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1094 _keys!1833) (size!1095 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31536 () Bool)

(declare-fun e!20143 () Bool)

(assert (=> b!31536 (= e!20143 tp_is_empty!1431)))

(declare-fun mapNonEmpty!1675 () Bool)

(declare-fun tp!4650 () Bool)

(assert (=> mapNonEmpty!1675 (= mapRes!1675 (and tp!4650 e!20143))))

(declare-fun mapValue!1675 () ValueCell!516)

(declare-fun mapRest!1675 () (Array (_ BitVec 32) ValueCell!516))

(declare-fun mapKey!1675 () (_ BitVec 32))

(assert (=> mapNonEmpty!1675 (= (arr!994 _values!1501) (store mapRest!1675 mapKey!1675 mapValue!1675))))

(assert (= (and start!4172 res!19102) b!31535))

(assert (= (and b!31535 res!19101) b!31527))

(assert (= (and b!31527 res!19100) b!31531))

(assert (= (and b!31531 res!19104) b!31528))

(assert (= (and b!31528 res!19098) b!31529))

(assert (= (and b!31529 res!19099) b!31532))

(assert (= (and b!31532 res!19103) b!31534))

(assert (= (and b!31533 condMapEmpty!1675) mapIsEmpty!1675))

(assert (= (and b!31533 (not condMapEmpty!1675)) mapNonEmpty!1675))

(get-info :version)

(assert (= (and mapNonEmpty!1675 ((_ is ValueCellFull!516) mapValue!1675)) b!31536))

(assert (= (and b!31533 ((_ is ValueCellFull!516) mapDefault!1675)) b!31530))

(assert (= start!4172 b!31533))

(declare-fun m!25283 () Bool)

(assert (=> b!31529 m!25283))

(assert (=> b!31529 m!25283))

(declare-fun m!25285 () Bool)

(assert (=> b!31529 m!25285))

(declare-fun m!25287 () Bool)

(assert (=> mapNonEmpty!1675 m!25287))

(declare-fun m!25289 () Bool)

(assert (=> b!31527 m!25289))

(declare-fun m!25291 () Bool)

(assert (=> b!31531 m!25291))

(declare-fun m!25293 () Bool)

(assert (=> b!31532 m!25293))

(declare-fun m!25295 () Bool)

(assert (=> b!31534 m!25295))

(declare-fun m!25297 () Bool)

(assert (=> b!31528 m!25297))

(declare-fun m!25299 () Bool)

(assert (=> start!4172 m!25299))

(declare-fun m!25301 () Bool)

(assert (=> start!4172 m!25301))

(declare-fun m!25303 () Bool)

(assert (=> start!4172 m!25303))

(check-sat (not mapNonEmpty!1675) (not b!31531) (not b!31528) b_and!1887 (not b!31529) (not b!31532) tp_is_empty!1431 (not b!31534) (not start!4172) (not b!31527) (not b_next!1077))
(check-sat b_and!1887 (not b_next!1077))
