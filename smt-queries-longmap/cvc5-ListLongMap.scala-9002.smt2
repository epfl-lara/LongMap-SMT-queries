; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108772 () Bool)

(assert start!108772)

(declare-fun b_free!28285 () Bool)

(declare-fun b_next!28285 () Bool)

(assert (=> start!108772 (= b_free!28285 (not b_next!28285))))

(declare-fun tp!99970 () Bool)

(declare-fun b_and!46351 () Bool)

(assert (=> start!108772 (= tp!99970 b_and!46351)))

(declare-fun res!853278 () Bool)

(declare-fun e!733697 () Bool)

(assert (=> start!108772 (=> (not res!853278) (not e!733697))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108772 (= res!853278 (validMask!0 mask!2175))))

(assert (=> start!108772 e!733697))

(declare-fun tp_is_empty!33925 () Bool)

(assert (=> start!108772 tp_is_empty!33925))

(assert (=> start!108772 true))

(declare-datatypes ((V!50337 0))(
  ( (V!50338 (val!17037 Int)) )
))
(declare-datatypes ((ValueCell!16064 0))(
  ( (ValueCellFull!16064 (v!19639 V!50337)) (EmptyCell!16064) )
))
(declare-datatypes ((array!84908 0))(
  ( (array!84909 (arr!40956 (Array (_ BitVec 32) ValueCell!16064)) (size!41506 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84908)

(declare-fun e!733698 () Bool)

(declare-fun array_inv!31063 (array!84908) Bool)

(assert (=> start!108772 (and (array_inv!31063 _values!1445) e!733698)))

(declare-datatypes ((array!84910 0))(
  ( (array!84911 (arr!40957 (Array (_ BitVec 32) (_ BitVec 64))) (size!41507 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84910)

(declare-fun array_inv!31064 (array!84910) Bool)

(assert (=> start!108772 (array_inv!31064 _keys!1741)))

(assert (=> start!108772 tp!99970))

(declare-fun b!1284452 () Bool)

(declare-fun e!733696 () Bool)

(assert (=> b!1284452 (= e!733696 tp_is_empty!33925)))

(declare-fun b!1284453 () Bool)

(declare-fun res!853279 () Bool)

(assert (=> b!1284453 (=> (not res!853279) (not e!733697))))

(declare-datatypes ((List!29022 0))(
  ( (Nil!29019) (Cons!29018 (h!30227 (_ BitVec 64)) (t!42566 List!29022)) )
))
(declare-fun arrayNoDuplicates!0 (array!84910 (_ BitVec 32) List!29022) Bool)

(assert (=> b!1284453 (= res!853279 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29019))))

(declare-fun b!1284454 () Bool)

(declare-fun e!733699 () Bool)

(assert (=> b!1284454 (= e!733699 tp_is_empty!33925)))

(declare-fun b!1284455 () Bool)

(declare-fun res!853280 () Bool)

(assert (=> b!1284455 (=> (not res!853280) (not e!733697))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284455 (= res!853280 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41507 _keys!1741))))))

(declare-fun b!1284456 () Bool)

(declare-fun res!853281 () Bool)

(assert (=> b!1284456 (=> (not res!853281) (not e!733697))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284456 (= res!853281 (and (= (size!41506 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41507 _keys!1741) (size!41506 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52445 () Bool)

(declare-fun mapRes!52445 () Bool)

(declare-fun tp!99971 () Bool)

(assert (=> mapNonEmpty!52445 (= mapRes!52445 (and tp!99971 e!733699))))

(declare-fun mapRest!52445 () (Array (_ BitVec 32) ValueCell!16064))

(declare-fun mapKey!52445 () (_ BitVec 32))

(declare-fun mapValue!52445 () ValueCell!16064)

(assert (=> mapNonEmpty!52445 (= (arr!40956 _values!1445) (store mapRest!52445 mapKey!52445 mapValue!52445))))

(declare-fun b!1284457 () Bool)

(assert (=> b!1284457 (= e!733698 (and e!733696 mapRes!52445))))

(declare-fun condMapEmpty!52445 () Bool)

(declare-fun mapDefault!52445 () ValueCell!16064)

