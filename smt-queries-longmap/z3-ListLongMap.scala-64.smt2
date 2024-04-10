; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!918 () Bool)

(assert start!918)

(declare-fun b_free!291 () Bool)

(declare-fun b_next!291 () Bool)

(assert (=> start!918 (= b_free!291 (not b_next!291))))

(declare-fun tp!1105 () Bool)

(declare-fun b_and!439 () Bool)

(assert (=> start!918 (= tp!1105 b_and!439)))

(declare-fun b!7701 () Bool)

(declare-fun res!7555 () Bool)

(declare-fun e!4318 () Bool)

(assert (=> b!7701 (=> (not res!7555) (not e!4318))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!669 0))(
  ( (V!670 (val!190 Int)) )
))
(declare-datatypes ((ValueCell!168 0))(
  ( (ValueCellFull!168 (v!1282 V!669)) (EmptyCell!168) )
))
(declare-datatypes ((array!671 0))(
  ( (array!672 (arr!323 (Array (_ BitVec 32) ValueCell!168)) (size!385 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!671)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-datatypes ((array!673 0))(
  ( (array!674 (arr!324 (Array (_ BitVec 32) (_ BitVec 64))) (size!386 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!673)

(assert (=> b!7701 (= res!7555 (and (= (size!385 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!386 _keys!1806) (size!385 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7702 () Bool)

(declare-fun res!7557 () Bool)

(assert (=> b!7702 (=> (not res!7557) (not e!4318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!673 (_ BitVec 32)) Bool)

(assert (=> b!7702 (= res!7557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7703 () Bool)

(declare-fun res!7556 () Bool)

(assert (=> b!7703 (=> (not res!7556) (not e!4318))))

(declare-datatypes ((List!218 0))(
  ( (Nil!215) (Cons!214 (h!780 (_ BitVec 64)) (t!2355 List!218)) )
))
(declare-fun arrayNoDuplicates!0 (array!673 (_ BitVec 32) List!218) Bool)

(assert (=> b!7703 (= res!7556 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!215))))

(declare-fun b!7704 () Bool)

(declare-fun e!4322 () Bool)

(declare-fun tp_is_empty!369 () Bool)

(assert (=> b!7704 (= e!4322 tp_is_empty!369)))

(declare-fun mapNonEmpty!527 () Bool)

(declare-fun mapRes!527 () Bool)

(declare-fun tp!1106 () Bool)

(assert (=> mapNonEmpty!527 (= mapRes!527 (and tp!1106 e!4322))))

(declare-fun mapRest!527 () (Array (_ BitVec 32) ValueCell!168))

(declare-fun mapKey!527 () (_ BitVec 32))

(declare-fun mapValue!527 () ValueCell!168)

(assert (=> mapNonEmpty!527 (= (arr!323 _values!1492) (store mapRest!527 mapKey!527 mapValue!527))))

(declare-fun mapIsEmpty!527 () Bool)

(assert (=> mapIsEmpty!527 mapRes!527))

(declare-fun b!7705 () Bool)

(declare-fun e!4321 () Bool)

(declare-fun e!4319 () Bool)

(assert (=> b!7705 (= e!4321 (and e!4319 mapRes!527))))

(declare-fun condMapEmpty!527 () Bool)

(declare-fun mapDefault!527 () ValueCell!168)

(assert (=> b!7705 (= condMapEmpty!527 (= (arr!323 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!168)) mapDefault!527)))))

(declare-fun b!7706 () Bool)

(assert (=> b!7706 (= e!4319 tp_is_empty!369)))

(declare-fun b!7707 () Bool)

(assert (=> b!7707 (= e!4318 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1575 () Bool)

(declare-fun minValue!1434 () V!669)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!669)

(declare-datatypes ((tuple2!208 0))(
  ( (tuple2!209 (_1!104 (_ BitVec 64)) (_2!104 V!669)) )
))
(declare-datatypes ((List!219 0))(
  ( (Nil!216) (Cons!215 (h!781 tuple2!208) (t!2356 List!219)) )
))
(declare-datatypes ((ListLongMap!213 0))(
  ( (ListLongMap!214 (toList!122 List!219)) )
))
(declare-fun contains!97 (ListLongMap!213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!81 (array!673 array!671 (_ BitVec 32) (_ BitVec 32) V!669 V!669 (_ BitVec 32) Int) ListLongMap!213)

(assert (=> b!7707 (= lt!1575 (contains!97 (getCurrentListMap!81 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!7558 () Bool)

(assert (=> start!918 (=> (not res!7558) (not e!4318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!918 (= res!7558 (validMask!0 mask!2250))))

(assert (=> start!918 e!4318))

(assert (=> start!918 tp!1105))

(assert (=> start!918 true))

(declare-fun array_inv!239 (array!671) Bool)

(assert (=> start!918 (and (array_inv!239 _values!1492) e!4321)))

(assert (=> start!918 tp_is_empty!369))

(declare-fun array_inv!240 (array!673) Bool)

(assert (=> start!918 (array_inv!240 _keys!1806)))

(assert (= (and start!918 res!7558) b!7701))

(assert (= (and b!7701 res!7555) b!7702))

(assert (= (and b!7702 res!7557) b!7703))

(assert (= (and b!7703 res!7556) b!7707))

(assert (= (and b!7705 condMapEmpty!527) mapIsEmpty!527))

(assert (= (and b!7705 (not condMapEmpty!527)) mapNonEmpty!527))

(get-info :version)

(assert (= (and mapNonEmpty!527 ((_ is ValueCellFull!168) mapValue!527)) b!7704))

(assert (= (and b!7705 ((_ is ValueCellFull!168) mapDefault!527)) b!7706))

(assert (= start!918 b!7705))

(declare-fun m!4677 () Bool)

(assert (=> b!7703 m!4677))

(declare-fun m!4679 () Bool)

(assert (=> mapNonEmpty!527 m!4679))

(declare-fun m!4681 () Bool)

(assert (=> start!918 m!4681))

(declare-fun m!4683 () Bool)

(assert (=> start!918 m!4683))

(declare-fun m!4685 () Bool)

(assert (=> start!918 m!4685))

(declare-fun m!4687 () Bool)

(assert (=> b!7702 m!4687))

(declare-fun m!4689 () Bool)

(assert (=> b!7707 m!4689))

(assert (=> b!7707 m!4689))

(declare-fun m!4691 () Bool)

(assert (=> b!7707 m!4691))

(check-sat b_and!439 tp_is_empty!369 (not b!7707) (not start!918) (not b!7703) (not mapNonEmpty!527) (not b_next!291) (not b!7702))
(check-sat b_and!439 (not b_next!291))
