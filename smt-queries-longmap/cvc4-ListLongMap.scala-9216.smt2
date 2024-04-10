; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110648 () Bool)

(assert start!110648)

(declare-fun b_free!29483 () Bool)

(declare-fun b_next!29483 () Bool)

(assert (=> start!110648 (= b_free!29483 (not b_next!29483))))

(declare-fun tp!103770 () Bool)

(declare-fun b_and!47691 () Bool)

(assert (=> start!110648 (= tp!103770 b_and!47691)))

(declare-fun b!1309259 () Bool)

(declare-fun e!746985 () Bool)

(declare-fun tp_is_empty!35213 () Bool)

(assert (=> b!1309259 (= e!746985 tp_is_empty!35213)))

(declare-fun mapNonEmpty!54448 () Bool)

(declare-fun mapRes!54448 () Bool)

(declare-fun tp!103771 () Bool)

(assert (=> mapNonEmpty!54448 (= mapRes!54448 (and tp!103771 e!746985))))

(declare-fun mapKey!54448 () (_ BitVec 32))

(declare-datatypes ((V!52053 0))(
  ( (V!52054 (val!17681 Int)) )
))
(declare-datatypes ((ValueCell!16708 0))(
  ( (ValueCellFull!16708 (v!20308 V!52053)) (EmptyCell!16708) )
))
(declare-fun mapValue!54448 () ValueCell!16708)

(declare-fun mapRest!54448 () (Array (_ BitVec 32) ValueCell!16708))

(declare-datatypes ((array!87418 0))(
  ( (array!87419 (arr!42189 (Array (_ BitVec 32) ValueCell!16708)) (size!42739 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87418)

(assert (=> mapNonEmpty!54448 (= (arr!42189 _values!1354) (store mapRest!54448 mapKey!54448 mapValue!54448))))

(declare-fun b!1309260 () Bool)

(declare-fun res!869129 () Bool)

(declare-fun e!746987 () Bool)

(assert (=> b!1309260 (=> (not res!869129) (not e!746987))))

(declare-datatypes ((array!87420 0))(
  ( (array!87421 (arr!42190 (Array (_ BitVec 32) (_ BitVec 64))) (size!42740 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87420)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87420 (_ BitVec 32)) Bool)

(assert (=> b!1309260 (= res!869129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54448 () Bool)

(assert (=> mapIsEmpty!54448 mapRes!54448))

(declare-fun b!1309261 () Bool)

(declare-fun res!869133 () Bool)

(assert (=> b!1309261 (=> (not res!869133) (not e!746987))))

(declare-datatypes ((List!29908 0))(
  ( (Nil!29905) (Cons!29904 (h!31113 (_ BitVec 64)) (t!43514 List!29908)) )
))
(declare-fun arrayNoDuplicates!0 (array!87420 (_ BitVec 32) List!29908) Bool)

(assert (=> b!1309261 (= res!869133 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29905))))

(declare-fun res!869130 () Bool)

(assert (=> start!110648 (=> (not res!869130) (not e!746987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110648 (= res!869130 (validMask!0 mask!2040))))

(assert (=> start!110648 e!746987))

(assert (=> start!110648 tp!103770))

(declare-fun array_inv!31885 (array!87420) Bool)

(assert (=> start!110648 (array_inv!31885 _keys!1628)))

(assert (=> start!110648 true))

(assert (=> start!110648 tp_is_empty!35213))

(declare-fun e!746983 () Bool)

(declare-fun array_inv!31886 (array!87418) Bool)

(assert (=> start!110648 (and (array_inv!31886 _values!1354) e!746983)))

(declare-fun b!1309262 () Bool)

(declare-fun e!746984 () Bool)

(assert (=> b!1309262 (= e!746983 (and e!746984 mapRes!54448))))

(declare-fun condMapEmpty!54448 () Bool)

(declare-fun mapDefault!54448 () ValueCell!16708)

