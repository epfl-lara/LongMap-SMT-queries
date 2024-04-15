; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!934 () Bool)

(assert start!934)

(declare-fun b_free!307 () Bool)

(declare-fun b_next!307 () Bool)

(assert (=> start!934 (= b_free!307 (not b_next!307))))

(declare-fun tp!1153 () Bool)

(declare-fun b_and!455 () Bool)

(assert (=> start!934 (= tp!1153 b_and!455)))

(declare-fun b!7869 () Bool)

(declare-fun res!7651 () Bool)

(declare-fun e!4441 () Bool)

(assert (=> b!7869 (=> (not res!7651) (not e!4441))))

(declare-datatypes ((array!691 0))(
  ( (array!692 (arr!333 (Array (_ BitVec 32) (_ BitVec 64))) (size!395 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!691)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!691 (_ BitVec 32)) Bool)

(assert (=> b!7869 (= res!7651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!551 () Bool)

(declare-fun mapRes!551 () Bool)

(declare-fun tp!1154 () Bool)

(declare-fun e!4439 () Bool)

(assert (=> mapNonEmpty!551 (= mapRes!551 (and tp!1154 e!4439))))

(declare-datatypes ((V!691 0))(
  ( (V!692 (val!198 Int)) )
))
(declare-datatypes ((ValueCell!176 0))(
  ( (ValueCellFull!176 (v!1290 V!691)) (EmptyCell!176) )
))
(declare-datatypes ((array!693 0))(
  ( (array!694 (arr!334 (Array (_ BitVec 32) ValueCell!176)) (size!396 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!693)

(declare-fun mapValue!551 () ValueCell!176)

(declare-fun mapRest!551 () (Array (_ BitVec 32) ValueCell!176))

(declare-fun mapKey!551 () (_ BitVec 32))

(assert (=> mapNonEmpty!551 (= (arr!334 _values!1492) (store mapRest!551 mapKey!551 mapValue!551))))

(declare-fun mapIsEmpty!551 () Bool)

(assert (=> mapIsEmpty!551 mapRes!551))

(declare-fun b!7871 () Bool)

(declare-fun res!7653 () Bool)

(assert (=> b!7871 (=> (not res!7653) (not e!4441))))

(declare-datatypes ((List!230 0))(
  ( (Nil!227) (Cons!226 (h!792 (_ BitVec 64)) (t!2367 List!230)) )
))
(declare-fun arrayNoDuplicates!0 (array!691 (_ BitVec 32) List!230) Bool)

(assert (=> b!7871 (= res!7653 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!227))))

(declare-fun b!7872 () Bool)

(declare-fun res!7654 () Bool)

(assert (=> b!7872 (=> (not res!7654) (not e!4441))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7872 (= res!7654 (and (= (size!396 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!395 _keys!1806) (size!396 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7873 () Bool)

(assert (=> b!7873 (= e!4441 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1599 () Bool)

(declare-fun minValue!1434 () V!691)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!691)

(declare-datatypes ((tuple2!218 0))(
  ( (tuple2!219 (_1!109 (_ BitVec 64)) (_2!109 V!691)) )
))
(declare-datatypes ((List!231 0))(
  ( (Nil!228) (Cons!227 (h!793 tuple2!218) (t!2368 List!231)) )
))
(declare-datatypes ((ListLongMap!223 0))(
  ( (ListLongMap!224 (toList!127 List!231)) )
))
(declare-fun contains!102 (ListLongMap!223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!86 (array!691 array!693 (_ BitVec 32) (_ BitVec 32) V!691 V!691 (_ BitVec 32) Int) ListLongMap!223)

(assert (=> b!7873 (= lt!1599 (contains!102 (getCurrentListMap!86 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7874 () Bool)

(declare-fun tp_is_empty!385 () Bool)

(assert (=> b!7874 (= e!4439 tp_is_empty!385)))

(declare-fun b!7875 () Bool)

(declare-fun e!4442 () Bool)

(declare-fun e!4438 () Bool)

(assert (=> b!7875 (= e!4442 (and e!4438 mapRes!551))))

(declare-fun condMapEmpty!551 () Bool)

(declare-fun mapDefault!551 () ValueCell!176)

(assert (=> b!7875 (= condMapEmpty!551 (= (arr!334 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!176)) mapDefault!551)))))

(declare-fun res!7652 () Bool)

(assert (=> start!934 (=> (not res!7652) (not e!4441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!934 (= res!7652 (validMask!0 mask!2250))))

(assert (=> start!934 e!4441))

(assert (=> start!934 tp!1153))

(assert (=> start!934 true))

(declare-fun array_inv!245 (array!693) Bool)

(assert (=> start!934 (and (array_inv!245 _values!1492) e!4442)))

(assert (=> start!934 tp_is_empty!385))

(declare-fun array_inv!246 (array!691) Bool)

(assert (=> start!934 (array_inv!246 _keys!1806)))

(declare-fun b!7870 () Bool)

(assert (=> b!7870 (= e!4438 tp_is_empty!385)))

(assert (= (and start!934 res!7652) b!7872))

(assert (= (and b!7872 res!7654) b!7869))

(assert (= (and b!7869 res!7651) b!7871))

(assert (= (and b!7871 res!7653) b!7873))

(assert (= (and b!7875 condMapEmpty!551) mapIsEmpty!551))

(assert (= (and b!7875 (not condMapEmpty!551)) mapNonEmpty!551))

(get-info :version)

(assert (= (and mapNonEmpty!551 ((_ is ValueCellFull!176) mapValue!551)) b!7874))

(assert (= (and b!7875 ((_ is ValueCellFull!176) mapDefault!551)) b!7870))

(assert (= start!934 b!7875))

(declare-fun m!4805 () Bool)

(assert (=> mapNonEmpty!551 m!4805))

(declare-fun m!4807 () Bool)

(assert (=> b!7869 m!4807))

(declare-fun m!4809 () Bool)

(assert (=> b!7871 m!4809))

(declare-fun m!4811 () Bool)

(assert (=> start!934 m!4811))

(declare-fun m!4813 () Bool)

(assert (=> start!934 m!4813))

(declare-fun m!4815 () Bool)

(assert (=> start!934 m!4815))

(declare-fun m!4817 () Bool)

(assert (=> b!7873 m!4817))

(assert (=> b!7873 m!4817))

(declare-fun m!4819 () Bool)

(assert (=> b!7873 m!4819))

(check-sat tp_is_empty!385 b_and!455 (not b!7869) (not start!934) (not b!7873) (not b!7871) (not b_next!307) (not mapNonEmpty!551))
(check-sat b_and!455 (not b_next!307))
