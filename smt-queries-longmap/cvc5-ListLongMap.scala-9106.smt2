; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109420 () Bool)

(assert start!109420)

(declare-fun b_free!28909 () Bool)

(declare-fun b_next!28909 () Bool)

(assert (=> start!109420 (= b_free!28909 (not b_next!28909))))

(declare-fun tp!101845 () Bool)

(declare-fun b_and!46999 () Bool)

(assert (=> start!109420 (= tp!101845 b_and!46999)))

(declare-fun b!1295483 () Bool)

(declare-fun res!861013 () Bool)

(declare-fun e!739159 () Bool)

(assert (=> b!1295483 (=> (not res!861013) (not e!739159))))

(declare-datatypes ((array!86118 0))(
  ( (array!86119 (arr!41560 (Array (_ BitVec 32) (_ BitVec 64))) (size!42110 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86118)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295483 (= res!861013 (not (validKeyInArray!0 (select (arr!41560 _keys!1741) from!2144))))))

(declare-fun b!1295484 () Bool)

(declare-fun e!739160 () Bool)

(declare-fun tp_is_empty!34549 () Bool)

(assert (=> b!1295484 (= e!739160 tp_is_empty!34549)))

(declare-fun mapNonEmpty!53384 () Bool)

(declare-fun mapRes!53384 () Bool)

(declare-fun tp!101846 () Bool)

(declare-fun e!739157 () Bool)

(assert (=> mapNonEmpty!53384 (= mapRes!53384 (and tp!101846 e!739157))))

(declare-fun mapKey!53384 () (_ BitVec 32))

(declare-datatypes ((V!51169 0))(
  ( (V!51170 (val!17349 Int)) )
))
(declare-datatypes ((ValueCell!16376 0))(
  ( (ValueCellFull!16376 (v!19952 V!51169)) (EmptyCell!16376) )
))
(declare-fun mapValue!53384 () ValueCell!16376)

(declare-datatypes ((array!86120 0))(
  ( (array!86121 (arr!41561 (Array (_ BitVec 32) ValueCell!16376)) (size!42111 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86120)

(declare-fun mapRest!53384 () (Array (_ BitVec 32) ValueCell!16376))

(assert (=> mapNonEmpty!53384 (= (arr!41561 _values!1445) (store mapRest!53384 mapKey!53384 mapValue!53384))))

(declare-fun b!1295485 () Bool)

(declare-fun res!861010 () Bool)

(assert (=> b!1295485 (=> (not res!861010) (not e!739159))))

(declare-fun minValue!1387 () V!51169)

(declare-fun zeroValue!1387 () V!51169)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22342 0))(
  ( (tuple2!22343 (_1!11182 (_ BitVec 64)) (_2!11182 V!51169)) )
))
(declare-datatypes ((List!29483 0))(
  ( (Nil!29480) (Cons!29479 (h!30688 tuple2!22342) (t!43047 List!29483)) )
))
(declare-datatypes ((ListLongMap!19999 0))(
  ( (ListLongMap!20000 (toList!10015 List!29483)) )
))
(declare-fun contains!8133 (ListLongMap!19999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5049 (array!86118 array!86120 (_ BitVec 32) (_ BitVec 32) V!51169 V!51169 (_ BitVec 32) Int) ListLongMap!19999)

(assert (=> b!1295485 (= res!861010 (contains!8133 (getCurrentListMap!5049 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1295486 () Bool)

(declare-fun e!739158 () Bool)

(assert (=> b!1295486 (= e!739158 (and e!739160 mapRes!53384))))

(declare-fun condMapEmpty!53384 () Bool)

(declare-fun mapDefault!53384 () ValueCell!16376)

