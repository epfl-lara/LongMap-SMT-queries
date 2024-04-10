; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109498 () Bool)

(assert start!109498)

(declare-fun b_free!28987 () Bool)

(declare-fun b_next!28987 () Bool)

(assert (=> start!109498 (= b_free!28987 (not b_next!28987))))

(declare-fun tp!102079 () Bool)

(declare-fun b_and!47077 () Bool)

(assert (=> start!109498 (= tp!102079 b_and!47077)))

(declare-fun b!1296879 () Bool)

(declare-fun e!739876 () Bool)

(declare-fun tp_is_empty!34627 () Bool)

(assert (=> b!1296879 (= e!739876 tp_is_empty!34627)))

(declare-fun mapNonEmpty!53501 () Bool)

(declare-fun mapRes!53501 () Bool)

(declare-fun tp!102080 () Bool)

(declare-fun e!739875 () Bool)

(assert (=> mapNonEmpty!53501 (= mapRes!53501 (and tp!102080 e!739875))))

(declare-datatypes ((V!51273 0))(
  ( (V!51274 (val!17388 Int)) )
))
(declare-datatypes ((ValueCell!16415 0))(
  ( (ValueCellFull!16415 (v!19991 V!51273)) (EmptyCell!16415) )
))
(declare-fun mapValue!53501 () ValueCell!16415)

(declare-fun mapRest!53501 () (Array (_ BitVec 32) ValueCell!16415))

(declare-datatypes ((array!86270 0))(
  ( (array!86271 (arr!41636 (Array (_ BitVec 32) ValueCell!16415)) (size!42186 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86270)

(declare-fun mapKey!53501 () (_ BitVec 32))

(assert (=> mapNonEmpty!53501 (= (arr!41636 _values!1445) (store mapRest!53501 mapKey!53501 mapValue!53501))))

(declare-fun b!1296880 () Bool)

(declare-fun res!861896 () Bool)

(declare-fun e!739874 () Bool)

(assert (=> b!1296880 (=> (not res!861896) (not e!739874))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86272 0))(
  ( (array!86273 (arr!41637 (Array (_ BitVec 32) (_ BitVec 64))) (size!42187 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86272)

(assert (=> b!1296880 (= res!861896 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42187 _keys!1741))))))

(declare-fun mapIsEmpty!53501 () Bool)

(assert (=> mapIsEmpty!53501 mapRes!53501))

(declare-fun b!1296881 () Bool)

(declare-fun res!861894 () Bool)

(assert (=> b!1296881 (=> (not res!861894) (not e!739874))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296881 (= res!861894 (and (= (size!42186 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42187 _keys!1741) (size!42186 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!861897 () Bool)

(assert (=> start!109498 (=> (not res!861897) (not e!739874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109498 (= res!861897 (validMask!0 mask!2175))))

(assert (=> start!109498 e!739874))

(assert (=> start!109498 tp_is_empty!34627))

(assert (=> start!109498 true))

(declare-fun e!739873 () Bool)

(declare-fun array_inv!31513 (array!86270) Bool)

(assert (=> start!109498 (and (array_inv!31513 _values!1445) e!739873)))

(declare-fun array_inv!31514 (array!86272) Bool)

(assert (=> start!109498 (array_inv!31514 _keys!1741)))

(assert (=> start!109498 tp!102079))

(declare-fun b!1296882 () Bool)

(assert (=> b!1296882 (= e!739874 false)))

(declare-fun minValue!1387 () V!51273)

(declare-fun zeroValue!1387 () V!51273)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580526 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22404 0))(
  ( (tuple2!22405 (_1!11213 (_ BitVec 64)) (_2!11213 V!51273)) )
))
(declare-datatypes ((List!29540 0))(
  ( (Nil!29537) (Cons!29536 (h!30745 tuple2!22404) (t!43104 List!29540)) )
))
(declare-datatypes ((ListLongMap!20061 0))(
  ( (ListLongMap!20062 (toList!10046 List!29540)) )
))
(declare-fun contains!8164 (ListLongMap!20061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5075 (array!86272 array!86270 (_ BitVec 32) (_ BitVec 32) V!51273 V!51273 (_ BitVec 32) Int) ListLongMap!20061)

(assert (=> b!1296882 (= lt!580526 (contains!8164 (getCurrentListMap!5075 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1296883 () Bool)

(declare-fun res!861893 () Bool)

(assert (=> b!1296883 (=> (not res!861893) (not e!739874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86272 (_ BitVec 32)) Bool)

(assert (=> b!1296883 (= res!861893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296884 () Bool)

(declare-fun res!861895 () Bool)

(assert (=> b!1296884 (=> (not res!861895) (not e!739874))))

(declare-datatypes ((List!29541 0))(
  ( (Nil!29538) (Cons!29537 (h!30746 (_ BitVec 64)) (t!43105 List!29541)) )
))
(declare-fun arrayNoDuplicates!0 (array!86272 (_ BitVec 32) List!29541) Bool)

(assert (=> b!1296884 (= res!861895 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29538))))

(declare-fun b!1296885 () Bool)

(assert (=> b!1296885 (= e!739873 (and e!739876 mapRes!53501))))

(declare-fun condMapEmpty!53501 () Bool)

(declare-fun mapDefault!53501 () ValueCell!16415)

