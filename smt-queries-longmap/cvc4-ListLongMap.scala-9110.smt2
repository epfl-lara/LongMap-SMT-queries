; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109448 () Bool)

(assert start!109448)

(declare-fun b_free!28937 () Bool)

(declare-fun b_next!28937 () Bool)

(assert (=> start!109448 (= b_free!28937 (not b_next!28937))))

(declare-fun tp!101930 () Bool)

(declare-fun b_and!47027 () Bool)

(assert (=> start!109448 (= tp!101930 b_and!47027)))

(declare-fun b!1295987 () Bool)

(declare-fun res!861396 () Bool)

(declare-fun e!739407 () Bool)

(assert (=> b!1295987 (=> (not res!861396) (not e!739407))))

(declare-datatypes ((array!86172 0))(
  ( (array!86173 (arr!41587 (Array (_ BitVec 32) (_ BitVec 64))) (size!42137 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86172)

(declare-datatypes ((List!29503 0))(
  ( (Nil!29500) (Cons!29499 (h!30708 (_ BitVec 64)) (t!43067 List!29503)) )
))
(declare-fun arrayNoDuplicates!0 (array!86172 (_ BitVec 32) List!29503) Bool)

(assert (=> b!1295987 (= res!861396 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29500))))

(declare-fun b!1295988 () Bool)

(declare-fun res!861391 () Bool)

(assert (=> b!1295988 (=> (not res!861391) (not e!739407))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295988 (= res!861391 (not (validKeyInArray!0 (select (arr!41587 _keys!1741) from!2144))))))

(declare-fun b!1295989 () Bool)

(declare-fun res!861394 () Bool)

(assert (=> b!1295989 (=> (not res!861394) (not e!739407))))

(assert (=> b!1295989 (= res!861394 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42137 _keys!1741))))))

(declare-fun b!1295990 () Bool)

(declare-fun res!861390 () Bool)

(assert (=> b!1295990 (=> (not res!861390) (not e!739407))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51205 0))(
  ( (V!51206 (val!17363 Int)) )
))
(declare-datatypes ((ValueCell!16390 0))(
  ( (ValueCellFull!16390 (v!19966 V!51205)) (EmptyCell!16390) )
))
(declare-datatypes ((array!86174 0))(
  ( (array!86175 (arr!41588 (Array (_ BitVec 32) ValueCell!16390)) (size!42138 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86174)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295990 (= res!861390 (and (= (size!42138 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42137 _keys!1741) (size!42138 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!861388 () Bool)

(assert (=> start!109448 (=> (not res!861388) (not e!739407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109448 (= res!861388 (validMask!0 mask!2175))))

(assert (=> start!109448 e!739407))

(declare-fun tp_is_empty!34577 () Bool)

(assert (=> start!109448 tp_is_empty!34577))

(assert (=> start!109448 true))

(declare-fun e!739410 () Bool)

(declare-fun array_inv!31483 (array!86174) Bool)

(assert (=> start!109448 (and (array_inv!31483 _values!1445) e!739410)))

(declare-fun array_inv!31484 (array!86172) Bool)

(assert (=> start!109448 (array_inv!31484 _keys!1741)))

(assert (=> start!109448 tp!101930))

(declare-fun b!1295991 () Bool)

(declare-fun e!739408 () Bool)

(declare-fun mapRes!53426 () Bool)

(assert (=> b!1295991 (= e!739410 (and e!739408 mapRes!53426))))

(declare-fun condMapEmpty!53426 () Bool)

(declare-fun mapDefault!53426 () ValueCell!16390)

