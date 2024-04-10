; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109528 () Bool)

(assert start!109528)

(declare-fun b_free!29017 () Bool)

(declare-fun b_next!29017 () Bool)

(assert (=> start!109528 (= b_free!29017 (not b_next!29017))))

(declare-fun tp!102170 () Bool)

(declare-fun b_and!47107 () Bool)

(assert (=> start!109528 (= tp!102170 b_and!47107)))

(declare-fun mapIsEmpty!53546 () Bool)

(declare-fun mapRes!53546 () Bool)

(assert (=> mapIsEmpty!53546 mapRes!53546))

(declare-fun mapNonEmpty!53546 () Bool)

(declare-fun tp!102169 () Bool)

(declare-fun e!740101 () Bool)

(assert (=> mapNonEmpty!53546 (= mapRes!53546 (and tp!102169 e!740101))))

(declare-fun mapKey!53546 () (_ BitVec 32))

(declare-datatypes ((V!51313 0))(
  ( (V!51314 (val!17403 Int)) )
))
(declare-datatypes ((ValueCell!16430 0))(
  ( (ValueCellFull!16430 (v!20006 V!51313)) (EmptyCell!16430) )
))
(declare-fun mapValue!53546 () ValueCell!16430)

(declare-datatypes ((array!86324 0))(
  ( (array!86325 (arr!41663 (Array (_ BitVec 32) ValueCell!16430)) (size!42213 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86324)

(declare-fun mapRest!53546 () (Array (_ BitVec 32) ValueCell!16430))

(assert (=> mapNonEmpty!53546 (= (arr!41663 _values!1445) (store mapRest!53546 mapKey!53546 mapValue!53546))))

(declare-fun b!1297239 () Bool)

(declare-fun res!862120 () Bool)

(declare-fun e!740100 () Bool)

(assert (=> b!1297239 (=> (not res!862120) (not e!740100))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86326 0))(
  ( (array!86327 (arr!41664 (Array (_ BitVec 32) (_ BitVec 64))) (size!42214 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86326)

(assert (=> b!1297239 (= res!862120 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42214 _keys!1741))))))

(declare-fun b!1297240 () Bool)

(declare-fun res!862119 () Bool)

(assert (=> b!1297240 (=> (not res!862119) (not e!740100))))

(declare-datatypes ((List!29559 0))(
  ( (Nil!29556) (Cons!29555 (h!30764 (_ BitVec 64)) (t!43123 List!29559)) )
))
(declare-fun arrayNoDuplicates!0 (array!86326 (_ BitVec 32) List!29559) Bool)

(assert (=> b!1297240 (= res!862119 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29556))))

(declare-fun b!1297241 () Bool)

(declare-fun e!740099 () Bool)

(declare-fun e!740098 () Bool)

(assert (=> b!1297241 (= e!740099 (and e!740098 mapRes!53546))))

(declare-fun condMapEmpty!53546 () Bool)

(declare-fun mapDefault!53546 () ValueCell!16430)

