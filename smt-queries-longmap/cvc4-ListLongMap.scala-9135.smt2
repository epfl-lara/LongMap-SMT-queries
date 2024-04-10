; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109598 () Bool)

(assert start!109598)

(declare-fun b_free!29087 () Bool)

(declare-fun b_next!29087 () Bool)

(assert (=> start!109598 (= b_free!29087 (not b_next!29087))))

(declare-fun tp!102380 () Bool)

(declare-fun b_and!47177 () Bool)

(assert (=> start!109598 (= tp!102380 b_and!47177)))

(declare-fun res!862736 () Bool)

(declare-fun e!740625 () Bool)

(assert (=> start!109598 (=> (not res!862736) (not e!740625))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109598 (= res!862736 (validMask!0 mask!2175))))

(assert (=> start!109598 e!740625))

(declare-fun tp_is_empty!34727 () Bool)

(assert (=> start!109598 tp_is_empty!34727))

(assert (=> start!109598 true))

(declare-datatypes ((V!51405 0))(
  ( (V!51406 (val!17438 Int)) )
))
(declare-datatypes ((ValueCell!16465 0))(
  ( (ValueCellFull!16465 (v!20041 V!51405)) (EmptyCell!16465) )
))
(declare-datatypes ((array!86460 0))(
  ( (array!86461 (arr!41731 (Array (_ BitVec 32) ValueCell!16465)) (size!42281 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86460)

(declare-fun e!740627 () Bool)

(declare-fun array_inv!31587 (array!86460) Bool)

(assert (=> start!109598 (and (array_inv!31587 _values!1445) e!740627)))

(declare-datatypes ((array!86462 0))(
  ( (array!86463 (arr!41732 (Array (_ BitVec 32) (_ BitVec 64))) (size!42282 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86462)

(declare-fun array_inv!31588 (array!86462) Bool)

(assert (=> start!109598 (array_inv!31588 _keys!1741)))

(assert (=> start!109598 tp!102380))

(declare-fun b!1298167 () Bool)

(declare-fun e!740623 () Bool)

(assert (=> b!1298167 (= e!740623 tp_is_empty!34727)))

(declare-fun b!1298168 () Bool)

(assert (=> b!1298168 (= e!740625 (not true))))

(declare-fun minValue!1387 () V!51405)

(declare-fun zeroValue!1387 () V!51405)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22482 0))(
  ( (tuple2!22483 (_1!11252 (_ BitVec 64)) (_2!11252 V!51405)) )
))
(declare-datatypes ((List!29613 0))(
  ( (Nil!29610) (Cons!29609 (h!30818 tuple2!22482) (t!43177 List!29613)) )
))
(declare-datatypes ((ListLongMap!20139 0))(
  ( (ListLongMap!20140 (toList!10085 List!29613)) )
))
(declare-fun contains!8203 (ListLongMap!20139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5114 (array!86462 array!86460 (_ BitVec 32) (_ BitVec 32) V!51405 V!51405 (_ BitVec 32) Int) ListLongMap!20139)

(assert (=> b!1298168 (contains!8203 (getCurrentListMap!5114 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42981 0))(
  ( (Unit!42982) )
))
(declare-fun lt!580676 () Unit!42981)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!43 (array!86462 array!86460 (_ BitVec 32) (_ BitVec 32) V!51405 V!51405 (_ BitVec 64) (_ BitVec 32) Int) Unit!42981)

(assert (=> b!1298168 (= lt!580676 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!43 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298169 () Bool)

(declare-fun e!740624 () Bool)

(assert (=> b!1298169 (= e!740624 tp_is_empty!34727)))

(declare-fun b!1298170 () Bool)

(declare-fun res!862735 () Bool)

(assert (=> b!1298170 (=> (not res!862735) (not e!740625))))

(assert (=> b!1298170 (= res!862735 (and (= (size!42281 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42282 _keys!1741) (size!42281 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298171 () Bool)

(declare-fun mapRes!53651 () Bool)

(assert (=> b!1298171 (= e!740627 (and e!740623 mapRes!53651))))

(declare-fun condMapEmpty!53651 () Bool)

(declare-fun mapDefault!53651 () ValueCell!16465)

