; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109694 () Bool)

(assert start!109694)

(declare-fun b_free!29147 () Bool)

(declare-fun b_next!29147 () Bool)

(assert (=> start!109694 (= b_free!29147 (not b_next!29147))))

(declare-fun tp!102566 () Bool)

(declare-fun b_and!47243 () Bool)

(assert (=> start!109694 (= tp!102566 b_and!47243)))

(declare-fun b!1299336 () Bool)

(declare-fun res!863487 () Bool)

(declare-fun e!741262 () Bool)

(assert (=> b!1299336 (=> (not res!863487) (not e!741262))))

(declare-datatypes ((array!86580 0))(
  ( (array!86581 (arr!41789 (Array (_ BitVec 32) (_ BitVec 64))) (size!42339 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86580)

(declare-datatypes ((List!29660 0))(
  ( (Nil!29657) (Cons!29656 (h!30865 (_ BitVec 64)) (t!43228 List!29660)) )
))
(declare-fun arrayNoDuplicates!0 (array!86580 (_ BitVec 32) List!29660) Bool)

(assert (=> b!1299336 (= res!863487 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29657))))

(declare-fun b!1299337 () Bool)

(declare-fun res!863490 () Bool)

(assert (=> b!1299337 (=> (not res!863490) (not e!741262))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1299337 (= res!863490 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42339 _keys!1741))))))

(declare-fun b!1299338 () Bool)

(declare-fun e!741261 () Bool)

(declare-fun e!741260 () Bool)

(declare-fun mapRes!53747 () Bool)

(assert (=> b!1299338 (= e!741261 (and e!741260 mapRes!53747))))

(declare-fun condMapEmpty!53747 () Bool)

(declare-datatypes ((V!51485 0))(
  ( (V!51486 (val!17468 Int)) )
))
(declare-datatypes ((ValueCell!16495 0))(
  ( (ValueCellFull!16495 (v!20073 V!51485)) (EmptyCell!16495) )
))
(declare-datatypes ((array!86582 0))(
  ( (array!86583 (arr!41790 (Array (_ BitVec 32) ValueCell!16495)) (size!42340 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86582)

(declare-fun mapDefault!53747 () ValueCell!16495)

