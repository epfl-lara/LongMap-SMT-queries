; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109562 () Bool)

(assert start!109562)

(declare-fun b_free!29051 () Bool)

(declare-fun b_next!29051 () Bool)

(assert (=> start!109562 (= b_free!29051 (not b_next!29051))))

(declare-fun tp!102272 () Bool)

(declare-fun b_and!47141 () Bool)

(assert (=> start!109562 (= tp!102272 b_and!47141)))

(declare-fun b!1297647 () Bool)

(declare-fun e!740357 () Bool)

(declare-fun tp_is_empty!34691 () Bool)

(assert (=> b!1297647 (= e!740357 tp_is_empty!34691)))

(declare-fun b!1297648 () Bool)

(declare-fun e!740353 () Bool)

(assert (=> b!1297648 (= e!740353 false)))

(declare-datatypes ((V!51357 0))(
  ( (V!51358 (val!17420 Int)) )
))
(declare-fun minValue!1387 () V!51357)

(declare-fun zeroValue!1387 () V!51357)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580622 () Bool)

(declare-datatypes ((ValueCell!16447 0))(
  ( (ValueCellFull!16447 (v!20023 V!51357)) (EmptyCell!16447) )
))
(declare-datatypes ((array!86392 0))(
  ( (array!86393 (arr!41697 (Array (_ BitVec 32) ValueCell!16447)) (size!42247 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86392)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86394 0))(
  ( (array!86395 (arr!41698 (Array (_ BitVec 32) (_ BitVec 64))) (size!42248 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86394)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22450 0))(
  ( (tuple2!22451 (_1!11236 (_ BitVec 64)) (_2!11236 V!51357)) )
))
(declare-datatypes ((List!29585 0))(
  ( (Nil!29582) (Cons!29581 (h!30790 tuple2!22450) (t!43149 List!29585)) )
))
(declare-datatypes ((ListLongMap!20107 0))(
  ( (ListLongMap!20108 (toList!10069 List!29585)) )
))
(declare-fun contains!8187 (ListLongMap!20107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5098 (array!86394 array!86392 (_ BitVec 32) (_ BitVec 32) V!51357 V!51357 (_ BitVec 32) Int) ListLongMap!20107)

(assert (=> b!1297648 (= lt!580622 (contains!8187 (getCurrentListMap!5098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53597 () Bool)

(declare-fun mapRes!53597 () Bool)

(assert (=> mapIsEmpty!53597 mapRes!53597))

(declare-fun b!1297649 () Bool)

(declare-fun res!862376 () Bool)

(assert (=> b!1297649 (=> (not res!862376) (not e!740353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86394 (_ BitVec 32)) Bool)

(assert (=> b!1297649 (= res!862376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297650 () Bool)

(declare-fun e!740356 () Bool)

(declare-fun e!740354 () Bool)

(assert (=> b!1297650 (= e!740356 (and e!740354 mapRes!53597))))

(declare-fun condMapEmpty!53597 () Bool)

(declare-fun mapDefault!53597 () ValueCell!16447)

