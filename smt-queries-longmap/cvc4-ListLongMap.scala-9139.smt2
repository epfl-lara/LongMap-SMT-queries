; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109622 () Bool)

(assert start!109622)

(declare-fun b_free!29111 () Bool)

(declare-fun b_next!29111 () Bool)

(assert (=> start!109622 (= b_free!29111 (not b_next!29111))))

(declare-fun tp!102451 () Bool)

(declare-fun b_and!47201 () Bool)

(assert (=> start!109622 (= tp!102451 b_and!47201)))

(declare-fun b!1298527 () Bool)

(declare-fun res!862986 () Bool)

(declare-fun e!740805 () Bool)

(assert (=> b!1298527 (=> (not res!862986) (not e!740805))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86508 0))(
  ( (array!86509 (arr!41755 (Array (_ BitVec 32) (_ BitVec 64))) (size!42305 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86508)

(assert (=> b!1298527 (= res!862986 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42305 _keys!1741)) (not (= (select (arr!41755 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298528 () Bool)

(declare-fun res!862983 () Bool)

(assert (=> b!1298528 (=> (not res!862983) (not e!740805))))

(declare-datatypes ((List!29630 0))(
  ( (Nil!29627) (Cons!29626 (h!30835 (_ BitVec 64)) (t!43194 List!29630)) )
))
(declare-fun arrayNoDuplicates!0 (array!86508 (_ BitVec 32) List!29630) Bool)

(assert (=> b!1298528 (= res!862983 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29627))))

(declare-fun b!1298529 () Bool)

(declare-fun res!862984 () Bool)

(assert (=> b!1298529 (=> (not res!862984) (not e!740805))))

(declare-datatypes ((V!51437 0))(
  ( (V!51438 (val!17450 Int)) )
))
(declare-fun minValue!1387 () V!51437)

(declare-fun zeroValue!1387 () V!51437)

(declare-datatypes ((ValueCell!16477 0))(
  ( (ValueCellFull!16477 (v!20053 V!51437)) (EmptyCell!16477) )
))
(declare-datatypes ((array!86510 0))(
  ( (array!86511 (arr!41756 (Array (_ BitVec 32) ValueCell!16477)) (size!42306 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86510)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22502 0))(
  ( (tuple2!22503 (_1!11262 (_ BitVec 64)) (_2!11262 V!51437)) )
))
(declare-datatypes ((List!29631 0))(
  ( (Nil!29628) (Cons!29627 (h!30836 tuple2!22502) (t!43195 List!29631)) )
))
(declare-datatypes ((ListLongMap!20159 0))(
  ( (ListLongMap!20160 (toList!10095 List!29631)) )
))
(declare-fun contains!8213 (ListLongMap!20159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5124 (array!86508 array!86510 (_ BitVec 32) (_ BitVec 32) V!51437 V!51437 (_ BitVec 32) Int) ListLongMap!20159)

(assert (=> b!1298529 (= res!862984 (contains!8213 (getCurrentListMap!5124 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!862988 () Bool)

(assert (=> start!109622 (=> (not res!862988) (not e!740805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109622 (= res!862988 (validMask!0 mask!2175))))

(assert (=> start!109622 e!740805))

(declare-fun tp_is_empty!34751 () Bool)

(assert (=> start!109622 tp_is_empty!34751))

(assert (=> start!109622 true))

(declare-fun e!740806 () Bool)

(declare-fun array_inv!31605 (array!86510) Bool)

(assert (=> start!109622 (and (array_inv!31605 _values!1445) e!740806)))

(declare-fun array_inv!31606 (array!86508) Bool)

(assert (=> start!109622 (array_inv!31606 _keys!1741)))

(assert (=> start!109622 tp!102451))

(declare-fun b!1298530 () Bool)

(declare-fun res!862989 () Bool)

(assert (=> b!1298530 (=> (not res!862989) (not e!740805))))

(assert (=> b!1298530 (= res!862989 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42305 _keys!1741))))))

(declare-fun b!1298531 () Bool)

(declare-fun e!740803 () Bool)

(assert (=> b!1298531 (= e!740803 tp_is_empty!34751)))

(declare-fun mapIsEmpty!53687 () Bool)

(declare-fun mapRes!53687 () Bool)

(assert (=> mapIsEmpty!53687 mapRes!53687))

(declare-fun b!1298532 () Bool)

(declare-fun e!740807 () Bool)

(assert (=> b!1298532 (= e!740806 (and e!740807 mapRes!53687))))

(declare-fun condMapEmpty!53687 () Bool)

(declare-fun mapDefault!53687 () ValueCell!16477)

