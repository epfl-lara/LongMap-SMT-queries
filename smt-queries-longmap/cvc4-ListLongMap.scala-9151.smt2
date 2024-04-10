; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109770 () Bool)

(assert start!109770)

(declare-fun b_free!29183 () Bool)

(declare-fun b_next!29183 () Bool)

(assert (=> start!109770 (= b_free!29183 (not b_next!29183))))

(declare-fun tp!102680 () Bool)

(declare-fun b_and!47291 () Bool)

(assert (=> start!109770 (= tp!102680 b_and!47291)))

(declare-fun res!864106 () Bool)

(declare-fun e!741726 () Bool)

(assert (=> start!109770 (=> (not res!864106) (not e!741726))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109770 (= res!864106 (validMask!0 mask!2175))))

(assert (=> start!109770 e!741726))

(declare-fun tp_is_empty!34823 () Bool)

(assert (=> start!109770 tp_is_empty!34823))

(assert (=> start!109770 true))

(declare-datatypes ((V!51533 0))(
  ( (V!51534 (val!17486 Int)) )
))
(declare-datatypes ((ValueCell!16513 0))(
  ( (ValueCellFull!16513 (v!20093 V!51533)) (EmptyCell!16513) )
))
(declare-datatypes ((array!86656 0))(
  ( (array!86657 (arr!41825 (Array (_ BitVec 32) ValueCell!16513)) (size!42375 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86656)

(declare-fun e!741729 () Bool)

(declare-fun array_inv!31645 (array!86656) Bool)

(assert (=> start!109770 (and (array_inv!31645 _values!1445) e!741729)))

(declare-datatypes ((array!86658 0))(
  ( (array!86659 (arr!41826 (Array (_ BitVec 32) (_ BitVec 64))) (size!42376 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86658)

(declare-fun array_inv!31646 (array!86658) Bool)

(assert (=> start!109770 (array_inv!31646 _keys!1741)))

(assert (=> start!109770 tp!102680))

(declare-fun b!1300294 () Bool)

(declare-fun res!864098 () Bool)

(assert (=> b!1300294 (=> (not res!864098) (not e!741726))))

(declare-fun zeroValue!1387 () V!51533)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!51533)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22550 0))(
  ( (tuple2!22551 (_1!11286 (_ BitVec 64)) (_2!11286 V!51533)) )
))
(declare-datatypes ((List!29683 0))(
  ( (Nil!29680) (Cons!29679 (h!30888 tuple2!22550) (t!43255 List!29683)) )
))
(declare-datatypes ((ListLongMap!20207 0))(
  ( (ListLongMap!20208 (toList!10119 List!29683)) )
))
(declare-fun contains!8243 (ListLongMap!20207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5146 (array!86658 array!86656 (_ BitVec 32) (_ BitVec 32) V!51533 V!51533 (_ BitVec 32) Int) ListLongMap!20207)

(assert (=> b!1300294 (= res!864098 (contains!8243 (getCurrentListMap!5146 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1300295 () Bool)

(declare-fun res!864103 () Bool)

(assert (=> b!1300295 (=> (not res!864103) (not e!741726))))

(assert (=> b!1300295 (= res!864103 (and (= (size!42375 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42376 _keys!1741) (size!42375 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300296 () Bool)

(declare-fun res!864099 () Bool)

(assert (=> b!1300296 (=> (not res!864099) (not e!741726))))

(assert (=> b!1300296 (= res!864099 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42376 _keys!1741))))))

(declare-fun b!1300297 () Bool)

(declare-fun res!864101 () Bool)

(assert (=> b!1300297 (=> (not res!864101) (not e!741726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86658 (_ BitVec 32)) Bool)

(assert (=> b!1300297 (= res!864101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300298 () Bool)

(declare-fun res!864100 () Bool)

(assert (=> b!1300298 (=> (not res!864100) (not e!741726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300298 (= res!864100 (validKeyInArray!0 (select (arr!41826 _keys!1741) from!2144)))))

(declare-fun b!1300299 () Bool)

(declare-fun +!4451 (ListLongMap!20207 tuple2!22550) ListLongMap!20207)

(declare-fun getCurrentListMapNoExtraKeys!6082 (array!86658 array!86656 (_ BitVec 32) (_ BitVec 32) V!51533 V!51533 (_ BitVec 32) Int) ListLongMap!20207)

(assert (=> b!1300299 (= e!741726 (not (contains!8243 (+!4451 (getCurrentListMapNoExtraKeys!6082 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205)))))

(declare-fun b!1300300 () Bool)

(declare-fun res!864105 () Bool)

(assert (=> b!1300300 (=> (not res!864105) (not e!741726))))

(assert (=> b!1300300 (= res!864105 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741))))))

(declare-fun b!1300301 () Bool)

(declare-fun res!864104 () Bool)

(assert (=> b!1300301 (=> (not res!864104) (not e!741726))))

(assert (=> b!1300301 (= res!864104 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!53807 () Bool)

(declare-fun mapRes!53807 () Bool)

(declare-fun tp!102679 () Bool)

(declare-fun e!741727 () Bool)

(assert (=> mapNonEmpty!53807 (= mapRes!53807 (and tp!102679 e!741727))))

(declare-fun mapValue!53807 () ValueCell!16513)

(declare-fun mapKey!53807 () (_ BitVec 32))

(declare-fun mapRest!53807 () (Array (_ BitVec 32) ValueCell!16513))

(assert (=> mapNonEmpty!53807 (= (arr!41825 _values!1445) (store mapRest!53807 mapKey!53807 mapValue!53807))))

(declare-fun b!1300302 () Bool)

(declare-fun res!864102 () Bool)

(assert (=> b!1300302 (=> (not res!864102) (not e!741726))))

(declare-datatypes ((List!29684 0))(
  ( (Nil!29681) (Cons!29680 (h!30889 (_ BitVec 64)) (t!43256 List!29684)) )
))
(declare-fun arrayNoDuplicates!0 (array!86658 (_ BitVec 32) List!29684) Bool)

(assert (=> b!1300302 (= res!864102 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29681))))

(declare-fun b!1300303 () Bool)

(declare-fun e!741728 () Bool)

(assert (=> b!1300303 (= e!741729 (and e!741728 mapRes!53807))))

(declare-fun condMapEmpty!53807 () Bool)

(declare-fun mapDefault!53807 () ValueCell!16513)

