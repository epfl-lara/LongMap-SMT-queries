; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109586 () Bool)

(assert start!109586)

(declare-fun b_free!29075 () Bool)

(declare-fun b_next!29075 () Bool)

(assert (=> start!109586 (= b_free!29075 (not b_next!29075))))

(declare-fun tp!102344 () Bool)

(declare-fun b_and!47165 () Bool)

(assert (=> start!109586 (= tp!102344 b_and!47165)))

(declare-fun b!1297987 () Bool)

(declare-fun e!740537 () Bool)

(assert (=> b!1297987 (= e!740537 (not true))))

(declare-datatypes ((V!51389 0))(
  ( (V!51390 (val!17432 Int)) )
))
(declare-fun minValue!1387 () V!51389)

(declare-fun zeroValue!1387 () V!51389)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16459 0))(
  ( (ValueCellFull!16459 (v!20035 V!51389)) (EmptyCell!16459) )
))
(declare-datatypes ((array!86436 0))(
  ( (array!86437 (arr!41719 (Array (_ BitVec 32) ValueCell!16459)) (size!42269 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86436)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86438 0))(
  ( (array!86439 (arr!41720 (Array (_ BitVec 32) (_ BitVec 64))) (size!42270 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86438)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22470 0))(
  ( (tuple2!22471 (_1!11246 (_ BitVec 64)) (_2!11246 V!51389)) )
))
(declare-datatypes ((List!29602 0))(
  ( (Nil!29599) (Cons!29598 (h!30807 tuple2!22470) (t!43166 List!29602)) )
))
(declare-datatypes ((ListLongMap!20127 0))(
  ( (ListLongMap!20128 (toList!10079 List!29602)) )
))
(declare-fun contains!8197 (ListLongMap!20127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5108 (array!86438 array!86436 (_ BitVec 32) (_ BitVec 32) V!51389 V!51389 (_ BitVec 32) Int) ListLongMap!20127)

(assert (=> b!1297987 (contains!8197 (getCurrentListMap!5108 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42971 0))(
  ( (Unit!42972) )
))
(declare-fun lt!580658 () Unit!42971)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!38 (array!86438 array!86436 (_ BitVec 32) (_ BitVec 32) V!51389 V!51389 (_ BitVec 64) (_ BitVec 32) Int) Unit!42971)

(assert (=> b!1297987 (= lt!580658 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!38 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297988 () Bool)

(declare-fun res!862611 () Bool)

(assert (=> b!1297988 (=> (not res!862611) (not e!740537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86438 (_ BitVec 32)) Bool)

(assert (=> b!1297988 (= res!862611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297989 () Bool)

(declare-fun e!740535 () Bool)

(declare-fun e!740533 () Bool)

(declare-fun mapRes!53633 () Bool)

(assert (=> b!1297989 (= e!740535 (and e!740533 mapRes!53633))))

(declare-fun condMapEmpty!53633 () Bool)

(declare-fun mapDefault!53633 () ValueCell!16459)

