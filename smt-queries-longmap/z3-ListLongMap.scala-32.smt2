; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!626 () Bool)

(assert start!626)

(declare-fun b_free!99 () Bool)

(declare-fun b_next!99 () Bool)

(assert (=> start!626 (= b_free!99 (not b_next!99))))

(declare-fun tp!515 () Bool)

(declare-fun b_and!237 () Bool)

(assert (=> start!626 (= tp!515 b_and!237)))

(declare-fun b!3973 () Bool)

(declare-fun res!5475 () Bool)

(declare-fun e!2041 () Bool)

(assert (=> b!3973 (=> (not res!5475) (not e!2041))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!413 0))(
  ( (V!414 (val!94 Int)) )
))
(declare-datatypes ((ValueCell!72 0))(
  ( (ValueCellFull!72 (v!1181 V!413)) (EmptyCell!72) )
))
(declare-datatypes ((array!289 0))(
  ( (array!290 (arr!137 (Array (_ BitVec 32) ValueCell!72)) (size!199 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!289)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-datatypes ((array!291 0))(
  ( (array!292 (arr!138 (Array (_ BitVec 32) (_ BitVec 64))) (size!200 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!291)

(assert (=> b!3973 (= res!5475 (and (= (size!199 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!200 _keys!1806) (size!199 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3974 () Bool)

(declare-fun res!5473 () Bool)

(assert (=> b!3974 (=> (not res!5473) (not e!2041))))

(declare-datatypes ((List!82 0))(
  ( (Nil!79) (Cons!78 (h!644 (_ BitVec 64)) (t!2209 List!82)) )
))
(declare-fun arrayNoDuplicates!0 (array!291 (_ BitVec 32) List!82) Bool)

(assert (=> b!3974 (= res!5473 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!79))))

(declare-fun b!3975 () Bool)

(declare-fun e!2042 () Bool)

(declare-fun e!2043 () Bool)

(declare-fun mapRes!224 () Bool)

(assert (=> b!3975 (= e!2042 (and e!2043 mapRes!224))))

(declare-fun condMapEmpty!224 () Bool)

(declare-fun mapDefault!224 () ValueCell!72)

(assert (=> b!3975 (= condMapEmpty!224 (= (arr!137 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!72)) mapDefault!224)))))

(declare-fun mapIsEmpty!224 () Bool)

(assert (=> mapIsEmpty!224 mapRes!224))

(declare-fun mapNonEmpty!224 () Bool)

(declare-fun tp!514 () Bool)

(declare-fun e!2045 () Bool)

(assert (=> mapNonEmpty!224 (= mapRes!224 (and tp!514 e!2045))))

(declare-fun mapValue!224 () ValueCell!72)

(declare-fun mapRest!224 () (Array (_ BitVec 32) ValueCell!72))

(declare-fun mapKey!224 () (_ BitVec 32))

(assert (=> mapNonEmpty!224 (= (arr!137 _values!1492) (store mapRest!224 mapKey!224 mapValue!224))))

(declare-fun b!3977 () Bool)

(declare-fun tp_is_empty!177 () Bool)

(assert (=> b!3977 (= e!2043 tp_is_empty!177)))

(declare-fun b!3978 () Bool)

(assert (=> b!3978 (= e!2041 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!413)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!413)

(declare-fun lt!549 () Bool)

(declare-datatypes ((tuple2!72 0))(
  ( (tuple2!73 (_1!36 (_ BitVec 64)) (_2!36 V!413)) )
))
(declare-datatypes ((List!83 0))(
  ( (Nil!80) (Cons!79 (h!645 tuple2!72) (t!2210 List!83)) )
))
(declare-datatypes ((ListLongMap!77 0))(
  ( (ListLongMap!78 (toList!54 List!83)) )
))
(declare-fun contains!24 (ListLongMap!77 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!13 (array!291 array!289 (_ BitVec 32) (_ BitVec 32) V!413 V!413 (_ BitVec 32) Int) ListLongMap!77)

(assert (=> b!3978 (= lt!549 (contains!24 (getCurrentListMap!13 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!3979 () Bool)

(declare-fun res!5476 () Bool)

(assert (=> b!3979 (=> (not res!5476) (not e!2041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!291 (_ BitVec 32)) Bool)

(assert (=> b!3979 (= res!5476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3976 () Bool)

(assert (=> b!3976 (= e!2045 tp_is_empty!177)))

(declare-fun res!5474 () Bool)

(assert (=> start!626 (=> (not res!5474) (not e!2041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!626 (= res!5474 (validMask!0 mask!2250))))

(assert (=> start!626 e!2041))

(assert (=> start!626 tp!515))

(assert (=> start!626 true))

(declare-fun array_inv!99 (array!289) Bool)

(assert (=> start!626 (and (array_inv!99 _values!1492) e!2042)))

(assert (=> start!626 tp_is_empty!177))

(declare-fun array_inv!100 (array!291) Bool)

(assert (=> start!626 (array_inv!100 _keys!1806)))

(assert (= (and start!626 res!5474) b!3973))

(assert (= (and b!3973 res!5475) b!3979))

(assert (= (and b!3979 res!5476) b!3974))

(assert (= (and b!3974 res!5473) b!3978))

(assert (= (and b!3975 condMapEmpty!224) mapIsEmpty!224))

(assert (= (and b!3975 (not condMapEmpty!224)) mapNonEmpty!224))

(get-info :version)

(assert (= (and mapNonEmpty!224 ((_ is ValueCellFull!72) mapValue!224)) b!3976))

(assert (= (and b!3975 ((_ is ValueCellFull!72) mapDefault!224)) b!3977))

(assert (= start!626 b!3975))

(declare-fun m!2031 () Bool)

(assert (=> b!3979 m!2031))

(declare-fun m!2033 () Bool)

(assert (=> b!3978 m!2033))

(assert (=> b!3978 m!2033))

(declare-fun m!2035 () Bool)

(assert (=> b!3978 m!2035))

(declare-fun m!2037 () Bool)

(assert (=> b!3974 m!2037))

(declare-fun m!2039 () Bool)

(assert (=> start!626 m!2039))

(declare-fun m!2041 () Bool)

(assert (=> start!626 m!2041))

(declare-fun m!2043 () Bool)

(assert (=> start!626 m!2043))

(declare-fun m!2045 () Bool)

(assert (=> mapNonEmpty!224 m!2045))

(check-sat tp_is_empty!177 (not b_next!99) (not b!3979) (not mapNonEmpty!224) (not b!3978) b_and!237 (not start!626) (not b!3974))
(check-sat b_and!237 (not b_next!99))
