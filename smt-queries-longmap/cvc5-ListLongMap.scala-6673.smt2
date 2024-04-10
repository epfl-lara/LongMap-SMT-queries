; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84010 () Bool)

(assert start!84010)

(declare-fun b_free!19765 () Bool)

(declare-fun b_next!19765 () Bool)

(assert (=> start!84010 (= b_free!19765 (not b_next!19765))))

(declare-fun tp!68818 () Bool)

(declare-fun b_and!31613 () Bool)

(assert (=> start!84010 (= tp!68818 b_and!31613)))

(declare-fun res!657094 () Bool)

(declare-fun e!553535 () Bool)

(assert (=> start!84010 (=> (not res!657094) (not e!553535))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84010 (= res!657094 (validMask!0 mask!1948))))

(assert (=> start!84010 e!553535))

(assert (=> start!84010 true))

(declare-fun tp_is_empty!22813 () Bool)

(assert (=> start!84010 tp_is_empty!22813))

(declare-datatypes ((V!35401 0))(
  ( (V!35402 (val!11457 Int)) )
))
(declare-datatypes ((ValueCell!10925 0))(
  ( (ValueCellFull!10925 (v!14019 V!35401)) (EmptyCell!10925) )
))
(declare-datatypes ((array!61621 0))(
  ( (array!61622 (arr!29668 (Array (_ BitVec 32) ValueCell!10925)) (size!30147 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61621)

(declare-fun e!553536 () Bool)

(declare-fun array_inv!22939 (array!61621) Bool)

(assert (=> start!84010 (and (array_inv!22939 _values!1278) e!553536)))

(assert (=> start!84010 tp!68818))

(declare-datatypes ((array!61623 0))(
  ( (array!61624 (arr!29669 (Array (_ BitVec 32) (_ BitVec 64))) (size!30148 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61623)

(declare-fun array_inv!22940 (array!61623) Bool)

(assert (=> start!84010 (array_inv!22940 _keys!1544)))

(declare-fun b!981929 () Bool)

(declare-fun e!553531 () Bool)

(declare-fun mapRes!36248 () Bool)

(assert (=> b!981929 (= e!553536 (and e!553531 mapRes!36248))))

(declare-fun condMapEmpty!36248 () Bool)

(declare-fun mapDefault!36248 () ValueCell!10925)

