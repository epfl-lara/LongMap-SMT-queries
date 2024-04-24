; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4172 () Bool)

(assert start!4172)

(declare-fun b_free!1081 () Bool)

(declare-fun b_next!1081 () Bool)

(assert (=> start!4172 (= b_free!1081 (not b_next!1081))))

(declare-fun tp!4662 () Bool)

(declare-fun b_and!1881 () Bool)

(assert (=> start!4172 (= tp!4662 b_and!1881)))

(declare-fun mapIsEmpty!1681 () Bool)

(declare-fun mapRes!1681 () Bool)

(assert (=> mapIsEmpty!1681 mapRes!1681))

(declare-fun b!31515 () Bool)

(declare-fun e!20120 () Bool)

(declare-fun tp_is_empty!1435 () Bool)

(assert (=> b!31515 (= e!20120 tp_is_empty!1435)))

(declare-fun b!31516 () Bool)

(declare-fun res!19104 () Bool)

(declare-fun e!20118 () Bool)

(assert (=> b!31516 (=> (not res!19104) (not e!20118))))

(declare-datatypes ((array!2071 0))(
  ( (array!2072 (arr!989 (Array (_ BitVec 32) (_ BitVec 64))) (size!1090 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2071)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2071 (_ BitVec 32)) Bool)

(assert (=> b!31516 (= res!19104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!19106 () Bool)

(assert (=> start!4172 (=> (not res!19106) (not e!20118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4172 (= res!19106 (validMask!0 mask!2294))))

(assert (=> start!4172 e!20118))

(assert (=> start!4172 true))

(assert (=> start!4172 tp!4662))

(declare-datatypes ((V!1739 0))(
  ( (V!1740 (val!744 Int)) )
))
(declare-datatypes ((ValueCell!518 0))(
  ( (ValueCellFull!518 (v!1833 V!1739)) (EmptyCell!518) )
))
(declare-datatypes ((array!2073 0))(
  ( (array!2074 (arr!990 (Array (_ BitVec 32) ValueCell!518)) (size!1091 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2073)

(declare-fun e!20119 () Bool)

(declare-fun array_inv!675 (array!2073) Bool)

(assert (=> start!4172 (and (array_inv!675 _values!1501) e!20119)))

(declare-fun array_inv!676 (array!2071) Bool)

(assert (=> start!4172 (array_inv!676 _keys!1833)))

(assert (=> start!4172 tp_is_empty!1435))

(declare-fun mapNonEmpty!1681 () Bool)

(declare-fun tp!4663 () Bool)

(declare-fun e!20122 () Bool)

(assert (=> mapNonEmpty!1681 (= mapRes!1681 (and tp!4663 e!20122))))

(declare-fun mapRest!1681 () (Array (_ BitVec 32) ValueCell!518))

(declare-fun mapValue!1681 () ValueCell!518)

(declare-fun mapKey!1681 () (_ BitVec 32))

(assert (=> mapNonEmpty!1681 (= (arr!990 _values!1501) (store mapRest!1681 mapKey!1681 mapValue!1681))))

(declare-fun b!31517 () Bool)

(assert (=> b!31517 (= e!20122 tp_is_empty!1435)))

(declare-fun b!31518 () Bool)

(assert (=> b!31518 (= e!20119 (and e!20120 mapRes!1681))))

(declare-fun condMapEmpty!1681 () Bool)

(declare-fun mapDefault!1681 () ValueCell!518)

(assert (=> b!31518 (= condMapEmpty!1681 (= (arr!990 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!518)) mapDefault!1681)))))

(declare-fun b!31519 () Bool)

(assert (=> b!31519 (= e!20118 false)))

(declare-fun lt!11538 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2071 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31519 (= lt!11538 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31520 () Bool)

(declare-fun res!19105 () Bool)

(assert (=> b!31520 (=> (not res!19105) (not e!20118))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31520 (= res!19105 (and (= (size!1091 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1090 _keys!1833) (size!1091 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31521 () Bool)

(declare-fun res!19102 () Bool)

(assert (=> b!31521 (=> (not res!19102) (not e!20118))))

(declare-datatypes ((List!804 0))(
  ( (Nil!801) (Cons!800 (h!1367 (_ BitVec 64)) (t!3491 List!804)) )
))
(declare-fun arrayNoDuplicates!0 (array!2071 (_ BitVec 32) List!804) Bool)

(assert (=> b!31521 (= res!19102 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!801))))

(declare-fun b!31522 () Bool)

(declare-fun res!19100 () Bool)

(assert (=> b!31522 (=> (not res!19100) (not e!20118))))

(declare-fun arrayContainsKey!0 (array!2071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31522 (= res!19100 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31523 () Bool)

(declare-fun res!19101 () Bool)

(assert (=> b!31523 (=> (not res!19101) (not e!20118))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1739)

(declare-fun minValue!1443 () V!1739)

(declare-datatypes ((tuple2!1210 0))(
  ( (tuple2!1211 (_1!616 (_ BitVec 64)) (_2!616 V!1739)) )
))
(declare-datatypes ((List!805 0))(
  ( (Nil!802) (Cons!801 (h!1368 tuple2!1210) (t!3492 List!805)) )
))
(declare-datatypes ((ListLongMap!781 0))(
  ( (ListLongMap!782 (toList!406 List!805)) )
))
(declare-fun contains!348 (ListLongMap!781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!231 (array!2071 array!2073 (_ BitVec 32) (_ BitVec 32) V!1739 V!1739 (_ BitVec 32) Int) ListLongMap!781)

(assert (=> b!31523 (= res!19101 (not (contains!348 (getCurrentListMap!231 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31524 () Bool)

(declare-fun res!19103 () Bool)

(assert (=> b!31524 (=> (not res!19103) (not e!20118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31524 (= res!19103 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4172 res!19106) b!31520))

(assert (= (and b!31520 res!19105) b!31516))

(assert (= (and b!31516 res!19104) b!31521))

(assert (= (and b!31521 res!19102) b!31524))

(assert (= (and b!31524 res!19103) b!31523))

(assert (= (and b!31523 res!19101) b!31522))

(assert (= (and b!31522 res!19100) b!31519))

(assert (= (and b!31518 condMapEmpty!1681) mapIsEmpty!1681))

(assert (= (and b!31518 (not condMapEmpty!1681)) mapNonEmpty!1681))

(get-info :version)

(assert (= (and mapNonEmpty!1681 ((_ is ValueCellFull!518) mapValue!1681)) b!31517))

(assert (= (and b!31518 ((_ is ValueCellFull!518) mapDefault!1681)) b!31515))

(assert (= start!4172 b!31518))

(declare-fun m!25175 () Bool)

(assert (=> start!4172 m!25175))

(declare-fun m!25177 () Bool)

(assert (=> start!4172 m!25177))

(declare-fun m!25179 () Bool)

(assert (=> start!4172 m!25179))

(declare-fun m!25181 () Bool)

(assert (=> b!31516 m!25181))

(declare-fun m!25183 () Bool)

(assert (=> b!31521 m!25183))

(declare-fun m!25185 () Bool)

(assert (=> b!31519 m!25185))

(declare-fun m!25187 () Bool)

(assert (=> b!31523 m!25187))

(assert (=> b!31523 m!25187))

(declare-fun m!25189 () Bool)

(assert (=> b!31523 m!25189))

(declare-fun m!25191 () Bool)

(assert (=> b!31524 m!25191))

(declare-fun m!25193 () Bool)

(assert (=> b!31522 m!25193))

(declare-fun m!25195 () Bool)

(assert (=> mapNonEmpty!1681 m!25195))

(check-sat tp_is_empty!1435 (not b!31516) (not b!31523) b_and!1881 (not b_next!1081) (not b!31522) (not b!31521) (not b!31519) (not start!4172) (not mapNonEmpty!1681) (not b!31524))
(check-sat b_and!1881 (not b_next!1081))
