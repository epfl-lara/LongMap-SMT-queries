; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109324 () Bool)

(assert start!109324)

(declare-fun b_free!28813 () Bool)

(declare-fun b_next!28813 () Bool)

(assert (=> start!109324 (= b_free!28813 (not b_next!28813))))

(declare-fun tp!101557 () Bool)

(declare-fun b_and!46903 () Bool)

(assert (=> start!109324 (= tp!101557 b_and!46903)))

(declare-fun b!1293836 () Bool)

(declare-fun res!859797 () Bool)

(declare-fun e!738373 () Bool)

(assert (=> b!1293836 (=> (not res!859797) (not e!738373))))

(declare-datatypes ((V!51041 0))(
  ( (V!51042 (val!17301 Int)) )
))
(declare-fun minValue!1387 () V!51041)

(declare-fun zeroValue!1387 () V!51041)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16328 0))(
  ( (ValueCellFull!16328 (v!19904 V!51041)) (EmptyCell!16328) )
))
(declare-datatypes ((array!85932 0))(
  ( (array!85933 (arr!41467 (Array (_ BitVec 32) ValueCell!16328)) (size!42017 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85932)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85934 0))(
  ( (array!85935 (arr!41468 (Array (_ BitVec 32) (_ BitVec 64))) (size!42018 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85934)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22268 0))(
  ( (tuple2!22269 (_1!11145 (_ BitVec 64)) (_2!11145 V!51041)) )
))
(declare-datatypes ((List!29414 0))(
  ( (Nil!29411) (Cons!29410 (h!30619 tuple2!22268) (t!42978 List!29414)) )
))
(declare-datatypes ((ListLongMap!19925 0))(
  ( (ListLongMap!19926 (toList!9978 List!29414)) )
))
(declare-fun contains!8096 (ListLongMap!19925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5019 (array!85934 array!85932 (_ BitVec 32) (_ BitVec 32) V!51041 V!51041 (_ BitVec 32) Int) ListLongMap!19925)

(assert (=> b!1293836 (= res!859797 (contains!8096 (getCurrentListMap!5019 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1293837 () Bool)

(declare-fun res!859800 () Bool)

(assert (=> b!1293837 (=> (not res!859800) (not e!738373))))

(assert (=> b!1293837 (= res!859800 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42018 _keys!1741))))))

(declare-fun b!1293838 () Bool)

(declare-fun res!859796 () Bool)

(assert (=> b!1293838 (=> (not res!859796) (not e!738373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293838 (= res!859796 (not (validKeyInArray!0 (select (arr!41468 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53240 () Bool)

(declare-fun mapRes!53240 () Bool)

(declare-fun tp!101558 () Bool)

(declare-fun e!738377 () Bool)

(assert (=> mapNonEmpty!53240 (= mapRes!53240 (and tp!101558 e!738377))))

(declare-fun mapRest!53240 () (Array (_ BitVec 32) ValueCell!16328))

(declare-fun mapValue!53240 () ValueCell!16328)

(declare-fun mapKey!53240 () (_ BitVec 32))

(assert (=> mapNonEmpty!53240 (= (arr!41467 _values!1445) (store mapRest!53240 mapKey!53240 mapValue!53240))))

(declare-fun b!1293839 () Bool)

(declare-fun e!738376 () Bool)

(declare-fun e!738374 () Bool)

(assert (=> b!1293839 (= e!738376 (and e!738374 mapRes!53240))))

(declare-fun condMapEmpty!53240 () Bool)

(declare-fun mapDefault!53240 () ValueCell!16328)

