; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109408 () Bool)

(assert start!109408)

(declare-fun b_free!28897 () Bool)

(declare-fun b_next!28897 () Bool)

(assert (=> start!109408 (= b_free!28897 (not b_next!28897))))

(declare-fun tp!101809 () Bool)

(declare-fun b_and!46987 () Bool)

(assert (=> start!109408 (= tp!101809 b_and!46987)))

(declare-fun b!1295267 () Bool)

(declare-fun res!860848 () Bool)

(declare-fun e!739048 () Bool)

(assert (=> b!1295267 (=> (not res!860848) (not e!739048))))

(declare-datatypes ((array!86094 0))(
  ( (array!86095 (arr!41548 (Array (_ BitVec 32) (_ BitVec 64))) (size!42098 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86094)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86094 (_ BitVec 32)) Bool)

(assert (=> b!1295267 (= res!860848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!860852 () Bool)

(assert (=> start!109408 (=> (not res!860852) (not e!739048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109408 (= res!860852 (validMask!0 mask!2175))))

(assert (=> start!109408 e!739048))

(declare-fun tp_is_empty!34537 () Bool)

(assert (=> start!109408 tp_is_empty!34537))

(assert (=> start!109408 true))

(declare-datatypes ((V!51153 0))(
  ( (V!51154 (val!17343 Int)) )
))
(declare-datatypes ((ValueCell!16370 0))(
  ( (ValueCellFull!16370 (v!19946 V!51153)) (EmptyCell!16370) )
))
(declare-datatypes ((array!86096 0))(
  ( (array!86097 (arr!41549 (Array (_ BitVec 32) ValueCell!16370)) (size!42099 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86096)

(declare-fun e!739047 () Bool)

(declare-fun array_inv!31461 (array!86096) Bool)

(assert (=> start!109408 (and (array_inv!31461 _values!1445) e!739047)))

(declare-fun array_inv!31462 (array!86094) Bool)

(assert (=> start!109408 (array_inv!31462 _keys!1741)))

(assert (=> start!109408 tp!101809))

(declare-fun b!1295268 () Bool)

(declare-fun res!860849 () Bool)

(assert (=> b!1295268 (=> (not res!860849) (not e!739048))))

(declare-fun minValue!1387 () V!51153)

(declare-fun zeroValue!1387 () V!51153)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22332 0))(
  ( (tuple2!22333 (_1!11177 (_ BitVec 64)) (_2!11177 V!51153)) )
))
(declare-datatypes ((List!29475 0))(
  ( (Nil!29472) (Cons!29471 (h!30680 tuple2!22332) (t!43039 List!29475)) )
))
(declare-datatypes ((ListLongMap!19989 0))(
  ( (ListLongMap!19990 (toList!10010 List!29475)) )
))
(declare-fun contains!8128 (ListLongMap!19989 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5045 (array!86094 array!86096 (_ BitVec 32) (_ BitVec 32) V!51153 V!51153 (_ BitVec 32) Int) ListLongMap!19989)

(assert (=> b!1295268 (= res!860849 (contains!8128 (getCurrentListMap!5045 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1295269 () Bool)

(declare-fun e!739052 () Bool)

(declare-fun mapRes!53366 () Bool)

(assert (=> b!1295269 (= e!739047 (and e!739052 mapRes!53366))))

(declare-fun condMapEmpty!53366 () Bool)

(declare-fun mapDefault!53366 () ValueCell!16370)

