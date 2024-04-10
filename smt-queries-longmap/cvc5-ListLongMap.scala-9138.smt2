; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109612 () Bool)

(assert start!109612)

(declare-fun b_free!29101 () Bool)

(declare-fun b_next!29101 () Bool)

(assert (=> start!109612 (= b_free!29101 (not b_next!29101))))

(declare-fun tp!102422 () Bool)

(declare-fun b_and!47191 () Bool)

(assert (=> start!109612 (= tp!102422 b_and!47191)))

(declare-fun b!1298377 () Bool)

(declare-fun res!862880 () Bool)

(declare-fun e!740732 () Bool)

(assert (=> b!1298377 (=> (not res!862880) (not e!740732))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86488 0))(
  ( (array!86489 (arr!41745 (Array (_ BitVec 32) (_ BitVec 64))) (size!42295 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86488)

(assert (=> b!1298377 (= res!862880 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42295 _keys!1741)) (not (= (select (arr!41745 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298378 () Bool)

(declare-fun e!740728 () Bool)

(declare-fun tp_is_empty!34741 () Bool)

(assert (=> b!1298378 (= e!740728 tp_is_empty!34741)))

(declare-fun b!1298379 () Bool)

(declare-fun res!862878 () Bool)

(assert (=> b!1298379 (=> (not res!862878) (not e!740732))))

(declare-datatypes ((V!51425 0))(
  ( (V!51426 (val!17445 Int)) )
))
(declare-fun minValue!1387 () V!51425)

(declare-fun zeroValue!1387 () V!51425)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16472 0))(
  ( (ValueCellFull!16472 (v!20048 V!51425)) (EmptyCell!16472) )
))
(declare-datatypes ((array!86490 0))(
  ( (array!86491 (arr!41746 (Array (_ BitVec 32) ValueCell!16472)) (size!42296 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86490)

(declare-datatypes ((tuple2!22492 0))(
  ( (tuple2!22493 (_1!11257 (_ BitVec 64)) (_2!11257 V!51425)) )
))
(declare-datatypes ((List!29622 0))(
  ( (Nil!29619) (Cons!29618 (h!30827 tuple2!22492) (t!43186 List!29622)) )
))
(declare-datatypes ((ListLongMap!20149 0))(
  ( (ListLongMap!20150 (toList!10090 List!29622)) )
))
(declare-fun contains!8208 (ListLongMap!20149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5119 (array!86488 array!86490 (_ BitVec 32) (_ BitVec 32) V!51425 V!51425 (_ BitVec 32) Int) ListLongMap!20149)

(assert (=> b!1298379 (= res!862878 (contains!8208 (getCurrentListMap!5119 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298380 () Bool)

(declare-fun e!740729 () Bool)

(assert (=> b!1298380 (= e!740729 tp_is_empty!34741)))

(declare-fun b!1298381 () Bool)

(declare-fun e!740731 () Bool)

(declare-fun mapRes!53672 () Bool)

(assert (=> b!1298381 (= e!740731 (and e!740728 mapRes!53672))))

(declare-fun condMapEmpty!53672 () Bool)

(declare-fun mapDefault!53672 () ValueCell!16472)

