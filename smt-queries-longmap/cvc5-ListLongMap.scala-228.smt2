; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4050 () Bool)

(assert start!4050)

(declare-fun b_free!955 () Bool)

(declare-fun b_next!955 () Bool)

(assert (=> start!4050 (= b_free!955 (not b_next!955))))

(declare-fun tp!4284 () Bool)

(declare-fun b_and!1765 () Bool)

(assert (=> start!4050 (= tp!4284 b_and!1765)))

(declare-fun b!29729 () Bool)

(declare-fun res!17850 () Bool)

(declare-fun e!19174 () Bool)

(assert (=> b!29729 (=> (not res!17850) (not e!19174))))

(declare-datatypes ((array!1849 0))(
  ( (array!1850 (arr!878 (Array (_ BitVec 32) (_ BitVec 64))) (size!979 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1849)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1849 (_ BitVec 32)) Bool)

(assert (=> b!29729 (= res!17850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29730 () Bool)

(assert (=> b!29730 (= e!19174 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun lt!11348 () Bool)

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1571 0))(
  ( (V!1572 (val!681 Int)) )
))
(declare-datatypes ((ValueCell!455 0))(
  ( (ValueCellFull!455 (v!1770 V!1571)) (EmptyCell!455) )
))
(declare-datatypes ((array!1851 0))(
  ( (array!1852 (arr!879 (Array (_ BitVec 32) ValueCell!455)) (size!980 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1851)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1571)

(declare-fun minValue!1443 () V!1571)

(declare-datatypes ((tuple2!1128 0))(
  ( (tuple2!1129 (_1!575 (_ BitVec 64)) (_2!575 V!1571)) )
))
(declare-datatypes ((List!727 0))(
  ( (Nil!724) (Cons!723 (h!1290 tuple2!1128) (t!3420 List!727)) )
))
(declare-datatypes ((ListLongMap!705 0))(
  ( (ListLongMap!706 (toList!368 List!727)) )
))
(declare-fun contains!308 (ListLongMap!705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!196 (array!1849 array!1851 (_ BitVec 32) (_ BitVec 32) V!1571 V!1571 (_ BitVec 32) Int) ListLongMap!705)

(assert (=> b!29730 (= lt!11348 (contains!308 (getCurrentListMap!196 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304))))

(declare-fun b!29731 () Bool)

(declare-fun e!19175 () Bool)

(declare-fun e!19173 () Bool)

(declare-fun mapRes!1492 () Bool)

(assert (=> b!29731 (= e!19175 (and e!19173 mapRes!1492))))

(declare-fun condMapEmpty!1492 () Bool)

(declare-fun mapDefault!1492 () ValueCell!455)

