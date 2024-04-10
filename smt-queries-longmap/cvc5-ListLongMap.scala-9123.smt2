; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109522 () Bool)

(assert start!109522)

(declare-fun b_free!29011 () Bool)

(declare-fun b_next!29011 () Bool)

(assert (=> start!109522 (= b_free!29011 (not b_next!29011))))

(declare-fun tp!102152 () Bool)

(declare-fun b_and!47101 () Bool)

(assert (=> start!109522 (= tp!102152 b_and!47101)))

(declare-fun res!862077 () Bool)

(declare-fun e!740053 () Bool)

(assert (=> start!109522 (=> (not res!862077) (not e!740053))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109522 (= res!862077 (validMask!0 mask!2175))))

(assert (=> start!109522 e!740053))

(declare-fun tp_is_empty!34651 () Bool)

(assert (=> start!109522 tp_is_empty!34651))

(assert (=> start!109522 true))

(declare-datatypes ((V!51305 0))(
  ( (V!51306 (val!17400 Int)) )
))
(declare-datatypes ((ValueCell!16427 0))(
  ( (ValueCellFull!16427 (v!20003 V!51305)) (EmptyCell!16427) )
))
(declare-datatypes ((array!86312 0))(
  ( (array!86313 (arr!41657 (Array (_ BitVec 32) ValueCell!16427)) (size!42207 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86312)

(declare-fun e!740057 () Bool)

(declare-fun array_inv!31527 (array!86312) Bool)

(assert (=> start!109522 (and (array_inv!31527 _values!1445) e!740057)))

(declare-datatypes ((array!86314 0))(
  ( (array!86315 (arr!41658 (Array (_ BitVec 32) (_ BitVec 64))) (size!42208 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86314)

(declare-fun array_inv!31528 (array!86314) Bool)

(assert (=> start!109522 (array_inv!31528 _keys!1741)))

(assert (=> start!109522 tp!102152))

(declare-fun b!1297167 () Bool)

(declare-fun e!740055 () Bool)

(assert (=> b!1297167 (= e!740055 tp_is_empty!34651)))

(declare-fun b!1297168 () Bool)

(declare-fun e!740056 () Bool)

(assert (=> b!1297168 (= e!740056 tp_is_empty!34651)))

(declare-fun b!1297169 () Bool)

(declare-fun mapRes!53537 () Bool)

(assert (=> b!1297169 (= e!740057 (and e!740056 mapRes!53537))))

(declare-fun condMapEmpty!53537 () Bool)

(declare-fun mapDefault!53537 () ValueCell!16427)

