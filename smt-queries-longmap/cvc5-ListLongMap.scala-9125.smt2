; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109534 () Bool)

(assert start!109534)

(declare-fun b_free!29023 () Bool)

(declare-fun b_next!29023 () Bool)

(assert (=> start!109534 (= b_free!29023 (not b_next!29023))))

(declare-fun tp!102188 () Bool)

(declare-fun b_and!47113 () Bool)

(assert (=> start!109534 (= tp!102188 b_and!47113)))

(declare-fun b!1297312 () Bool)

(declare-fun e!740143 () Bool)

(declare-fun tp_is_empty!34663 () Bool)

(assert (=> b!1297312 (= e!740143 tp_is_empty!34663)))

(declare-fun b!1297313 () Bool)

(declare-fun e!740144 () Bool)

(assert (=> b!1297313 (= e!740144 tp_is_empty!34663)))

(declare-fun b!1297314 () Bool)

(declare-fun res!862166 () Bool)

(declare-fun e!740146 () Bool)

(assert (=> b!1297314 (=> (not res!862166) (not e!740146))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51321 0))(
  ( (V!51322 (val!17406 Int)) )
))
(declare-datatypes ((ValueCell!16433 0))(
  ( (ValueCellFull!16433 (v!20009 V!51321)) (EmptyCell!16433) )
))
(declare-datatypes ((array!86336 0))(
  ( (array!86337 (arr!41669 (Array (_ BitVec 32) ValueCell!16433)) (size!42219 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86336)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86338 0))(
  ( (array!86339 (arr!41670 (Array (_ BitVec 32) (_ BitVec 64))) (size!42220 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86338)

(assert (=> b!1297314 (= res!862166 (and (= (size!42219 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42220 _keys!1741) (size!42219 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53555 () Bool)

(declare-fun mapRes!53555 () Bool)

(assert (=> mapIsEmpty!53555 mapRes!53555))

(declare-fun b!1297315 () Bool)

(declare-fun e!740145 () Bool)

(assert (=> b!1297315 (= e!740145 (and e!740144 mapRes!53555))))

(declare-fun condMapEmpty!53555 () Bool)

(declare-fun mapDefault!53555 () ValueCell!16433)

