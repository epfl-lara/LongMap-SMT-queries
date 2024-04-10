; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109938 () Bool)

(assert start!109938)

(declare-fun b_free!29237 () Bool)

(declare-fun b_next!29237 () Bool)

(assert (=> start!109938 (= b_free!29237 (not b_next!29237))))

(declare-fun tp!102852 () Bool)

(declare-fun b_and!47379 () Bool)

(assert (=> start!109938 (= tp!102852 b_and!47379)))

(declare-fun b!1302364 () Bool)

(declare-fun e!742838 () Bool)

(declare-fun tp_is_empty!34877 () Bool)

(assert (=> b!1302364 (= e!742838 tp_is_empty!34877)))

(declare-fun b!1302365 () Bool)

(declare-fun e!742836 () Bool)

(declare-fun e!742840 () Bool)

(assert (=> b!1302365 (= e!742836 e!742840)))

(declare-fun res!865116 () Bool)

(assert (=> b!1302365 (=> (not res!865116) (not e!742840))))

(declare-datatypes ((V!51605 0))(
  ( (V!51606 (val!17513 Int)) )
))
(declare-fun minValue!1387 () V!51605)

(declare-fun zeroValue!1387 () V!51605)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16540 0))(
  ( (ValueCellFull!16540 (v!20125 V!51605)) (EmptyCell!16540) )
))
(declare-datatypes ((array!86764 0))(
  ( (array!86765 (arr!41876 (Array (_ BitVec 32) ValueCell!16540)) (size!42426 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86764)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86766 0))(
  ( (array!86767 (arr!41877 (Array (_ BitVec 32) (_ BitVec 64))) (size!42427 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86766)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22594 0))(
  ( (tuple2!22595 (_1!11308 (_ BitVec 64)) (_2!11308 V!51605)) )
))
(declare-datatypes ((List!29722 0))(
  ( (Nil!29719) (Cons!29718 (h!30927 tuple2!22594) (t!43310 List!29722)) )
))
(declare-datatypes ((ListLongMap!20251 0))(
  ( (ListLongMap!20252 (toList!10141 List!29722)) )
))
(declare-fun contains!8271 (ListLongMap!20251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6100 (array!86766 array!86764 (_ BitVec 32) (_ BitVec 32) V!51605 V!51605 (_ BitVec 32) Int) ListLongMap!20251)

(assert (=> b!1302365 (= res!865116 (not (contains!8271 (getCurrentListMapNoExtraKeys!6100 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205)))))

(declare-fun b!1302366 () Bool)

(declare-fun res!865119 () Bool)

(declare-fun e!742835 () Bool)

(assert (=> b!1302366 (=> (not res!865119) (not e!742835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86766 (_ BitVec 32)) Bool)

(assert (=> b!1302366 (= res!865119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302367 () Bool)

(declare-fun e!742837 () Bool)

(assert (=> b!1302367 (= e!742837 tp_is_empty!34877)))

(declare-fun b!1302368 () Bool)

(assert (=> b!1302368 (= e!742835 (not e!742836))))

(declare-fun res!865113 () Bool)

(assert (=> b!1302368 (=> res!865113 e!742836)))

(assert (=> b!1302368 (= res!865113 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1302368 (not (contains!8271 (ListLongMap!20252 Nil!29719) k!1205))))

(declare-datatypes ((Unit!43113 0))(
  ( (Unit!43114) )
))
(declare-fun lt!582574 () Unit!43113)

(declare-fun emptyContainsNothing!208 ((_ BitVec 64)) Unit!43113)

(assert (=> b!1302368 (= lt!582574 (emptyContainsNothing!208 k!1205))))

(declare-fun b!1302369 () Bool)

(declare-fun res!865118 () Bool)

(assert (=> b!1302369 (=> (not res!865118) (not e!742835))))

(assert (=> b!1302369 (= res!865118 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42427 _keys!1741))))))

(declare-fun mapNonEmpty!53898 () Bool)

(declare-fun mapRes!53898 () Bool)

(declare-fun tp!102851 () Bool)

(assert (=> mapNonEmpty!53898 (= mapRes!53898 (and tp!102851 e!742838))))

(declare-fun mapValue!53898 () ValueCell!16540)

(declare-fun mapRest!53898 () (Array (_ BitVec 32) ValueCell!16540))

(declare-fun mapKey!53898 () (_ BitVec 32))

(assert (=> mapNonEmpty!53898 (= (arr!41876 _values!1445) (store mapRest!53898 mapKey!53898 mapValue!53898))))

(declare-fun b!1302370 () Bool)

(assert (=> b!1302370 (= e!742840 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k!1205)))))

(declare-fun b!1302371 () Bool)

(declare-fun e!742839 () Bool)

(assert (=> b!1302371 (= e!742839 (and e!742837 mapRes!53898))))

(declare-fun condMapEmpty!53898 () Bool)

(declare-fun mapDefault!53898 () ValueCell!16540)

