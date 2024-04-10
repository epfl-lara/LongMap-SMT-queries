; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108694 () Bool)

(assert start!108694)

(declare-fun b_free!28207 () Bool)

(declare-fun b_next!28207 () Bool)

(assert (=> start!108694 (= b_free!28207 (not b_next!28207))))

(declare-fun tp!99737 () Bool)

(declare-fun b_and!46273 () Bool)

(assert (=> start!108694 (= tp!99737 b_and!46273)))

(declare-fun b!1283164 () Bool)

(declare-fun e!733114 () Bool)

(declare-fun tp_is_empty!33847 () Bool)

(assert (=> b!1283164 (= e!733114 tp_is_empty!33847)))

(declare-fun b!1283165 () Bool)

(declare-fun res!852343 () Bool)

(declare-fun e!733115 () Bool)

(assert (=> b!1283165 (=> (not res!852343) (not e!733115))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!84756 0))(
  ( (array!84757 (arr!40880 (Array (_ BitVec 32) (_ BitVec 64))) (size!41430 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84756)

(assert (=> b!1283165 (= res!852343 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41430 _keys!1741))))))

(declare-fun b!1283166 () Bool)

(declare-fun res!852340 () Bool)

(assert (=> b!1283166 (=> (not res!852340) (not e!733115))))

(assert (=> b!1283166 (= res!852340 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41430 _keys!1741))))))

(declare-fun b!1283167 () Bool)

(declare-fun res!852346 () Bool)

(assert (=> b!1283167 (=> (not res!852346) (not e!733115))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50233 0))(
  ( (V!50234 (val!16998 Int)) )
))
(declare-datatypes ((ValueCell!16025 0))(
  ( (ValueCellFull!16025 (v!19600 V!50233)) (EmptyCell!16025) )
))
(declare-datatypes ((array!84758 0))(
  ( (array!84759 (arr!40881 (Array (_ BitVec 32) ValueCell!16025)) (size!41431 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84758)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283167 (= res!852346 (and (= (size!41431 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41430 _keys!1741) (size!41431 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283168 () Bool)

(declare-fun e!733113 () Bool)

(declare-fun mapRes!52328 () Bool)

(assert (=> b!1283168 (= e!733113 (and e!733114 mapRes!52328))))

(declare-fun condMapEmpty!52328 () Bool)

(declare-fun mapDefault!52328 () ValueCell!16025)

