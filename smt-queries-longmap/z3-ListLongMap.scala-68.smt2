; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!940 () Bool)

(assert start!940)

(declare-fun b_free!313 () Bool)

(declare-fun b_next!313 () Bool)

(assert (=> start!940 (= b_free!313 (not b_next!313))))

(declare-fun tp!1171 () Bool)

(declare-fun b_and!461 () Bool)

(assert (=> start!940 (= tp!1171 b_and!461)))

(declare-fun b!7932 () Bool)

(declare-fun e!4485 () Bool)

(declare-fun tp_is_empty!391 () Bool)

(assert (=> b!7932 (= e!4485 tp_is_empty!391)))

(declare-fun b!7933 () Bool)

(declare-fun res!7689 () Bool)

(declare-fun e!4486 () Bool)

(assert (=> b!7933 (=> (not res!7689) (not e!4486))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!699 0))(
  ( (V!700 (val!201 Int)) )
))
(declare-datatypes ((ValueCell!179 0))(
  ( (ValueCellFull!179 (v!1293 V!699)) (EmptyCell!179) )
))
(declare-datatypes ((array!701 0))(
  ( (array!702 (arr!338 (Array (_ BitVec 32) ValueCell!179)) (size!400 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!701)

(declare-datatypes ((array!703 0))(
  ( (array!704 (arr!339 (Array (_ BitVec 32) (_ BitVec 64))) (size!401 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!703)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7933 (= res!7689 (and (= (size!400 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!401 _keys!1806) (size!400 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7934 () Bool)

(assert (=> b!7934 (= e!4486 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!699)

(declare-fun lt!1608 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!699)

(declare-datatypes ((tuple2!222 0))(
  ( (tuple2!223 (_1!111 (_ BitVec 64)) (_2!111 V!699)) )
))
(declare-datatypes ((List!234 0))(
  ( (Nil!231) (Cons!230 (h!796 tuple2!222) (t!2371 List!234)) )
))
(declare-datatypes ((ListLongMap!227 0))(
  ( (ListLongMap!228 (toList!129 List!234)) )
))
(declare-fun contains!104 (ListLongMap!227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!88 (array!703 array!701 (_ BitVec 32) (_ BitVec 32) V!699 V!699 (_ BitVec 32) Int) ListLongMap!227)

(assert (=> b!7934 (= lt!1608 (contains!104 (getCurrentListMap!88 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!560 () Bool)

(declare-fun mapRes!560 () Bool)

(assert (=> mapIsEmpty!560 mapRes!560))

(declare-fun b!7935 () Bool)

(declare-fun e!4483 () Bool)

(declare-fun e!4484 () Bool)

(assert (=> b!7935 (= e!4483 (and e!4484 mapRes!560))))

(declare-fun condMapEmpty!560 () Bool)

(declare-fun mapDefault!560 () ValueCell!179)

(assert (=> b!7935 (= condMapEmpty!560 (= (arr!338 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!179)) mapDefault!560)))))

(declare-fun mapNonEmpty!560 () Bool)

(declare-fun tp!1172 () Bool)

(assert (=> mapNonEmpty!560 (= mapRes!560 (and tp!1172 e!4485))))

(declare-fun mapValue!560 () ValueCell!179)

(declare-fun mapKey!560 () (_ BitVec 32))

(declare-fun mapRest!560 () (Array (_ BitVec 32) ValueCell!179))

(assert (=> mapNonEmpty!560 (= (arr!338 _values!1492) (store mapRest!560 mapKey!560 mapValue!560))))

(declare-fun b!7936 () Bool)

(declare-fun res!7688 () Bool)

(assert (=> b!7936 (=> (not res!7688) (not e!4486))))

(declare-datatypes ((List!235 0))(
  ( (Nil!232) (Cons!231 (h!797 (_ BitVec 64)) (t!2372 List!235)) )
))
(declare-fun arrayNoDuplicates!0 (array!703 (_ BitVec 32) List!235) Bool)

(assert (=> b!7936 (= res!7688 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!232))))

(declare-fun b!7937 () Bool)

(declare-fun res!7687 () Bool)

(assert (=> b!7937 (=> (not res!7687) (not e!4486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!703 (_ BitVec 32)) Bool)

(assert (=> b!7937 (= res!7687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7938 () Bool)

(assert (=> b!7938 (= e!4484 tp_is_empty!391)))

(declare-fun res!7690 () Bool)

(assert (=> start!940 (=> (not res!7690) (not e!4486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!940 (= res!7690 (validMask!0 mask!2250))))

(assert (=> start!940 e!4486))

(assert (=> start!940 tp!1171))

(assert (=> start!940 true))

(declare-fun array_inv!249 (array!701) Bool)

(assert (=> start!940 (and (array_inv!249 _values!1492) e!4483)))

(assert (=> start!940 tp_is_empty!391))

(declare-fun array_inv!250 (array!703) Bool)

(assert (=> start!940 (array_inv!250 _keys!1806)))

(assert (= (and start!940 res!7690) b!7933))

(assert (= (and b!7933 res!7689) b!7937))

(assert (= (and b!7937 res!7687) b!7936))

(assert (= (and b!7936 res!7688) b!7934))

(assert (= (and b!7935 condMapEmpty!560) mapIsEmpty!560))

(assert (= (and b!7935 (not condMapEmpty!560)) mapNonEmpty!560))

(get-info :version)

(assert (= (and mapNonEmpty!560 ((_ is ValueCellFull!179) mapValue!560)) b!7932))

(assert (= (and b!7935 ((_ is ValueCellFull!179) mapDefault!560)) b!7938))

(assert (= start!940 b!7935))

(declare-fun m!4853 () Bool)

(assert (=> start!940 m!4853))

(declare-fun m!4855 () Bool)

(assert (=> start!940 m!4855))

(declare-fun m!4857 () Bool)

(assert (=> start!940 m!4857))

(declare-fun m!4859 () Bool)

(assert (=> b!7937 m!4859))

(declare-fun m!4861 () Bool)

(assert (=> b!7936 m!4861))

(declare-fun m!4863 () Bool)

(assert (=> mapNonEmpty!560 m!4863))

(declare-fun m!4865 () Bool)

(assert (=> b!7934 m!4865))

(assert (=> b!7934 m!4865))

(declare-fun m!4867 () Bool)

(assert (=> b!7934 m!4867))

(check-sat (not b!7936) tp_is_empty!391 (not b!7934) b_and!461 (not start!940) (not b!7937) (not b_next!313) (not mapNonEmpty!560))
(check-sat b_and!461 (not b_next!313))
