; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3926 () Bool)

(assert start!3926)

(declare-fun b_free!831 () Bool)

(declare-fun b_next!831 () Bool)

(assert (=> start!3926 (= b_free!831 (not b_next!831))))

(declare-fun tp!3912 () Bool)

(declare-fun b_and!1641 () Bool)

(assert (=> start!3926 (= tp!3912 b_and!1641)))

(declare-fun b!27846 () Bool)

(declare-fun res!16530 () Bool)

(declare-fun e!18079 () Bool)

(assert (=> b!27846 (=> (not res!16530) (not e!18079))))

(declare-datatypes ((array!1611 0))(
  ( (array!1612 (arr!759 (Array (_ BitVec 32) (_ BitVec 64))) (size!860 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1611)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1611 (_ BitVec 32)) Bool)

(assert (=> b!27846 (= res!16530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27847 () Bool)

(declare-fun e!18083 () Bool)

(declare-fun tp_is_empty!1185 () Bool)

(assert (=> b!27847 (= e!18083 tp_is_empty!1185)))

(declare-fun b!27848 () Bool)

(assert (=> b!27848 (= e!18079 false)))

(declare-fun lt!10721 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1611 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27848 (= lt!10721 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27849 () Bool)

(declare-fun res!16527 () Bool)

(assert (=> b!27849 (=> (not res!16527) (not e!18079))))

(declare-datatypes ((List!638 0))(
  ( (Nil!635) (Cons!634 (h!1201 (_ BitVec 64)) (t!3331 List!638)) )
))
(declare-fun arrayNoDuplicates!0 (array!1611 (_ BitVec 32) List!638) Bool)

(assert (=> b!27849 (= res!16527 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!635))))

(declare-fun b!27850 () Bool)

(declare-fun res!16528 () Bool)

(assert (=> b!27850 (=> (not res!16528) (not e!18079))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1405 0))(
  ( (V!1406 (val!619 Int)) )
))
(declare-datatypes ((ValueCell!393 0))(
  ( (ValueCellFull!393 (v!1708 V!1405)) (EmptyCell!393) )
))
(declare-datatypes ((array!1613 0))(
  ( (array!1614 (arr!760 (Array (_ BitVec 32) ValueCell!393)) (size!861 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1613)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1405)

(declare-fun minValue!1443 () V!1405)

(declare-datatypes ((tuple2!1036 0))(
  ( (tuple2!1037 (_1!529 (_ BitVec 64)) (_2!529 V!1405)) )
))
(declare-datatypes ((List!639 0))(
  ( (Nil!636) (Cons!635 (h!1202 tuple2!1036) (t!3332 List!639)) )
))
(declare-datatypes ((ListLongMap!613 0))(
  ( (ListLongMap!614 (toList!322 List!639)) )
))
(declare-fun contains!262 (ListLongMap!613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!152 (array!1611 array!1613 (_ BitVec 32) (_ BitVec 32) V!1405 V!1405 (_ BitVec 32) Int) ListLongMap!613)

(assert (=> b!27850 (= res!16528 (not (contains!262 (getCurrentListMap!152 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27851 () Bool)

(declare-fun res!16526 () Bool)

(assert (=> b!27851 (=> (not res!16526) (not e!18079))))

(assert (=> b!27851 (= res!16526 (and (= (size!861 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!860 _keys!1833) (size!861 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!16529 () Bool)

(assert (=> start!3926 (=> (not res!16529) (not e!18079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3926 (= res!16529 (validMask!0 mask!2294))))

(assert (=> start!3926 e!18079))

(assert (=> start!3926 true))

(assert (=> start!3926 tp!3912))

(declare-fun e!18081 () Bool)

(declare-fun array_inv!521 (array!1613) Bool)

(assert (=> start!3926 (and (array_inv!521 _values!1501) e!18081)))

(declare-fun array_inv!522 (array!1611) Bool)

(assert (=> start!3926 (array_inv!522 _keys!1833)))

(assert (=> start!3926 tp_is_empty!1185))

(declare-fun b!27852 () Bool)

(declare-fun mapRes!1306 () Bool)

(assert (=> b!27852 (= e!18081 (and e!18083 mapRes!1306))))

(declare-fun condMapEmpty!1306 () Bool)

(declare-fun mapDefault!1306 () ValueCell!393)

(assert (=> b!27852 (= condMapEmpty!1306 (= (arr!760 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!393)) mapDefault!1306)))))

(declare-fun mapNonEmpty!1306 () Bool)

(declare-fun tp!3913 () Bool)

(declare-fun e!18080 () Bool)

(assert (=> mapNonEmpty!1306 (= mapRes!1306 (and tp!3913 e!18080))))

(declare-fun mapKey!1306 () (_ BitVec 32))

(declare-fun mapValue!1306 () ValueCell!393)

(declare-fun mapRest!1306 () (Array (_ BitVec 32) ValueCell!393))

(assert (=> mapNonEmpty!1306 (= (arr!760 _values!1501) (store mapRest!1306 mapKey!1306 mapValue!1306))))

(declare-fun b!27853 () Bool)

(declare-fun res!16524 () Bool)

(assert (=> b!27853 (=> (not res!16524) (not e!18079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27853 (= res!16524 (validKeyInArray!0 k0!1304))))

(declare-fun b!27854 () Bool)

(assert (=> b!27854 (= e!18080 tp_is_empty!1185)))

(declare-fun b!27855 () Bool)

(declare-fun res!16525 () Bool)

(assert (=> b!27855 (=> (not res!16525) (not e!18079))))

(declare-fun arrayContainsKey!0 (array!1611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27855 (= res!16525 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1306 () Bool)

(assert (=> mapIsEmpty!1306 mapRes!1306))

(assert (= (and start!3926 res!16529) b!27851))

(assert (= (and b!27851 res!16526) b!27846))

(assert (= (and b!27846 res!16530) b!27849))

(assert (= (and b!27849 res!16527) b!27853))

(assert (= (and b!27853 res!16524) b!27850))

(assert (= (and b!27850 res!16528) b!27855))

(assert (= (and b!27855 res!16525) b!27848))

(assert (= (and b!27852 condMapEmpty!1306) mapIsEmpty!1306))

(assert (= (and b!27852 (not condMapEmpty!1306)) mapNonEmpty!1306))

(get-info :version)

(assert (= (and mapNonEmpty!1306 ((_ is ValueCellFull!393) mapValue!1306)) b!27854))

(assert (= (and b!27852 ((_ is ValueCellFull!393) mapDefault!1306)) b!27847))

(assert (= start!3926 b!27852))

(declare-fun m!22193 () Bool)

(assert (=> mapNonEmpty!1306 m!22193))

(declare-fun m!22195 () Bool)

(assert (=> b!27853 m!22195))

(declare-fun m!22197 () Bool)

(assert (=> b!27848 m!22197))

(declare-fun m!22199 () Bool)

(assert (=> b!27849 m!22199))

(declare-fun m!22201 () Bool)

(assert (=> b!27850 m!22201))

(assert (=> b!27850 m!22201))

(declare-fun m!22203 () Bool)

(assert (=> b!27850 m!22203))

(declare-fun m!22205 () Bool)

(assert (=> start!3926 m!22205))

(declare-fun m!22207 () Bool)

(assert (=> start!3926 m!22207))

(declare-fun m!22209 () Bool)

(assert (=> start!3926 m!22209))

(declare-fun m!22211 () Bool)

(assert (=> b!27846 m!22211))

(declare-fun m!22213 () Bool)

(assert (=> b!27855 m!22213))

(check-sat tp_is_empty!1185 (not b_next!831) (not mapNonEmpty!1306) (not b!27853) (not start!3926) (not b!27850) (not b!27846) b_and!1641 (not b!27849) (not b!27848) (not b!27855))
(check-sat b_and!1641 (not b_next!831))
