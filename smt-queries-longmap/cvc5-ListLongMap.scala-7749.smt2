; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97238 () Bool)

(assert start!97238)

(declare-fun b!1106655 () Bool)

(declare-fun e!631478 () Bool)

(declare-fun tp_is_empty!27469 () Bool)

(assert (=> b!1106655 (= e!631478 tp_is_empty!27469)))

(declare-fun b!1106656 () Bool)

(declare-fun res!738531 () Bool)

(declare-fun e!631475 () Bool)

(assert (=> b!1106656 (=> (not res!738531) (not e!631475))))

(declare-datatypes ((array!71855 0))(
  ( (array!71856 (arr!34580 (Array (_ BitVec 32) (_ BitVec 64))) (size!35116 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71855)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1106656 (= res!738531 (= (select (arr!34580 _keys!1208) i!673) k!934))))

(declare-fun b!1106657 () Bool)

(declare-fun res!738530 () Bool)

(assert (=> b!1106657 (=> (not res!738530) (not e!631475))))

(declare-datatypes ((List!24101 0))(
  ( (Nil!24098) (Cons!24097 (h!25306 (_ BitVec 64)) (t!34366 List!24101)) )
))
(declare-fun arrayNoDuplicates!0 (array!71855 (_ BitVec 32) List!24101) Bool)

(assert (=> b!1106657 (= res!738530 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24098))))

(declare-fun b!1106658 () Bool)

(declare-fun e!631479 () Bool)

(declare-fun mapRes!43021 () Bool)

(assert (=> b!1106658 (= e!631479 (and e!631478 mapRes!43021))))

(declare-fun condMapEmpty!43021 () Bool)

(declare-datatypes ((V!41753 0))(
  ( (V!41754 (val!13791 Int)) )
))
(declare-datatypes ((ValueCell!13025 0))(
  ( (ValueCellFull!13025 (v!16424 V!41753)) (EmptyCell!13025) )
))
(declare-datatypes ((array!71857 0))(
  ( (array!71858 (arr!34581 (Array (_ BitVec 32) ValueCell!13025)) (size!35117 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71857)

(declare-fun mapDefault!43021 () ValueCell!13025)

