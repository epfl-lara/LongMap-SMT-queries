; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109426 () Bool)

(assert start!109426)

(declare-fun b_free!28915 () Bool)

(declare-fun b_next!28915 () Bool)

(assert (=> start!109426 (= b_free!28915 (not b_next!28915))))

(declare-fun tp!101863 () Bool)

(declare-fun b_and!47005 () Bool)

(assert (=> start!109426 (= tp!101863 b_and!47005)))

(declare-fun b!1295591 () Bool)

(declare-fun res!861096 () Bool)

(declare-fun e!739210 () Bool)

(assert (=> b!1295591 (=> (not res!861096) (not e!739210))))

(declare-datatypes ((array!86130 0))(
  ( (array!86131 (arr!41566 (Array (_ BitVec 32) (_ BitVec 64))) (size!42116 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86130)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86130 (_ BitVec 32)) Bool)

(assert (=> b!1295591 (= res!861096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295592 () Bool)

(declare-fun res!861098 () Bool)

(assert (=> b!1295592 (=> (not res!861098) (not e!739210))))

(declare-datatypes ((List!29488 0))(
  ( (Nil!29485) (Cons!29484 (h!30693 (_ BitVec 64)) (t!43052 List!29488)) )
))
(declare-fun arrayNoDuplicates!0 (array!86130 (_ BitVec 32) List!29488) Bool)

(assert (=> b!1295592 (= res!861098 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29485))))

(declare-fun b!1295593 () Bool)

(declare-fun res!861093 () Bool)

(assert (=> b!1295593 (=> (not res!861093) (not e!739210))))

(declare-datatypes ((V!51177 0))(
  ( (V!51178 (val!17352 Int)) )
))
(declare-datatypes ((ValueCell!16379 0))(
  ( (ValueCellFull!16379 (v!19955 V!51177)) (EmptyCell!16379) )
))
(declare-datatypes ((array!86132 0))(
  ( (array!86133 (arr!41567 (Array (_ BitVec 32) ValueCell!16379)) (size!42117 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86132)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295593 (= res!861093 (and (= (size!42117 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42116 _keys!1741) (size!42117 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295594 () Bool)

(declare-fun e!739212 () Bool)

(declare-fun e!739214 () Bool)

(declare-fun mapRes!53393 () Bool)

(assert (=> b!1295594 (= e!739212 (and e!739214 mapRes!53393))))

(declare-fun condMapEmpty!53393 () Bool)

(declare-fun mapDefault!53393 () ValueCell!16379)

