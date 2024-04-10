; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109666 () Bool)

(assert start!109666)

(declare-fun b_free!29135 () Bool)

(declare-fun b_next!29135 () Bool)

(assert (=> start!109666 (= b_free!29135 (not b_next!29135))))

(declare-fun tp!102526 () Bool)

(declare-fun b_and!47229 () Bool)

(assert (=> start!109666 (= tp!102526 b_and!47229)))

(declare-fun b!1299044 () Bool)

(declare-fun e!741092 () Bool)

(declare-fun tp_is_empty!34775 () Bool)

(assert (=> b!1299044 (= e!741092 tp_is_empty!34775)))

(declare-fun b!1299045 () Bool)

(declare-fun res!863310 () Bool)

(declare-fun e!741091 () Bool)

(assert (=> b!1299045 (=> (not res!863310) (not e!741091))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86556 0))(
  ( (array!86557 (arr!41778 (Array (_ BitVec 32) (_ BitVec 64))) (size!42328 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86556)

(assert (=> b!1299045 (= res!863310 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42328 _keys!1741))))))

(declare-fun b!1299046 () Bool)

(declare-fun res!863307 () Bool)

(assert (=> b!1299046 (=> (not res!863307) (not e!741091))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51469 0))(
  ( (V!51470 (val!17462 Int)) )
))
(declare-datatypes ((ValueCell!16489 0))(
  ( (ValueCellFull!16489 (v!20066 V!51469)) (EmptyCell!16489) )
))
(declare-datatypes ((array!86558 0))(
  ( (array!86559 (arr!41779 (Array (_ BitVec 32) ValueCell!16489)) (size!42329 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86558)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299046 (= res!863307 (and (= (size!42329 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42328 _keys!1741) (size!42329 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun b!1299047 () Bool)

(declare-fun arrayContainsKey!0 (array!86556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1299047 (= e!741091 (not (arrayContainsKey!0 _keys!1741 k!1205 from!2144)))))

(declare-fun mapIsEmpty!53726 () Bool)

(declare-fun mapRes!53726 () Bool)

(assert (=> mapIsEmpty!53726 mapRes!53726))

(declare-fun b!1299048 () Bool)

(declare-fun res!863313 () Bool)

(assert (=> b!1299048 (=> (not res!863313) (not e!741091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86556 (_ BitVec 32)) Bool)

(assert (=> b!1299048 (= res!863313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299049 () Bool)

(declare-fun res!863308 () Bool)

(assert (=> b!1299049 (=> (not res!863308) (not e!741091))))

(declare-datatypes ((List!29651 0))(
  ( (Nil!29648) (Cons!29647 (h!30856 (_ BitVec 64)) (t!43217 List!29651)) )
))
(declare-fun arrayNoDuplicates!0 (array!86556 (_ BitVec 32) List!29651) Bool)

(assert (=> b!1299049 (= res!863308 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29648))))

(declare-fun b!1299050 () Bool)

(declare-fun e!741094 () Bool)

(declare-fun e!741093 () Bool)

(assert (=> b!1299050 (= e!741094 (and e!741093 mapRes!53726))))

(declare-fun condMapEmpty!53726 () Bool)

(declare-fun mapDefault!53726 () ValueCell!16489)

