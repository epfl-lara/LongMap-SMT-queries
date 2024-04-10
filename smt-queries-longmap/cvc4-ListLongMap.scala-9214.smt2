; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110636 () Bool)

(assert start!110636)

(declare-fun b_free!29471 () Bool)

(declare-fun b_next!29471 () Bool)

(assert (=> start!110636 (= b_free!29471 (not b_next!29471))))

(declare-fun tp!103735 () Bool)

(declare-fun b_and!47679 () Bool)

(assert (=> start!110636 (= tp!103735 b_and!47679)))

(declare-fun mapNonEmpty!54430 () Bool)

(declare-fun mapRes!54430 () Bool)

(declare-fun tp!103734 () Bool)

(declare-fun e!746894 () Bool)

(assert (=> mapNonEmpty!54430 (= mapRes!54430 (and tp!103734 e!746894))))

(declare-fun mapKey!54430 () (_ BitVec 32))

(declare-datatypes ((V!52037 0))(
  ( (V!52038 (val!17675 Int)) )
))
(declare-datatypes ((ValueCell!16702 0))(
  ( (ValueCellFull!16702 (v!20302 V!52037)) (EmptyCell!16702) )
))
(declare-fun mapRest!54430 () (Array (_ BitVec 32) ValueCell!16702))

(declare-datatypes ((array!87396 0))(
  ( (array!87397 (arr!42178 (Array (_ BitVec 32) ValueCell!16702)) (size!42728 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87396)

(declare-fun mapValue!54430 () ValueCell!16702)

(assert (=> mapNonEmpty!54430 (= (arr!42178 _values!1354) (store mapRest!54430 mapKey!54430 mapValue!54430))))

(declare-fun b!1309115 () Bool)

(declare-fun tp_is_empty!35201 () Bool)

(assert (=> b!1309115 (= e!746894 tp_is_empty!35201)))

(declare-fun b!1309116 () Bool)

(declare-fun res!869043 () Bool)

(declare-fun e!746896 () Bool)

(assert (=> b!1309116 (=> (not res!869043) (not e!746896))))

(declare-datatypes ((array!87398 0))(
  ( (array!87399 (arr!42179 (Array (_ BitVec 32) (_ BitVec 64))) (size!42729 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87398)

(declare-datatypes ((List!29902 0))(
  ( (Nil!29899) (Cons!29898 (h!31107 (_ BitVec 64)) (t!43508 List!29902)) )
))
(declare-fun arrayNoDuplicates!0 (array!87398 (_ BitVec 32) List!29902) Bool)

(assert (=> b!1309116 (= res!869043 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29899))))

(declare-fun b!1309117 () Bool)

(declare-fun res!869039 () Bool)

(assert (=> b!1309117 (=> (not res!869039) (not e!746896))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87398 (_ BitVec 32)) Bool)

(assert (=> b!1309117 (= res!869039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309118 () Bool)

(declare-fun e!746897 () Bool)

(declare-fun e!746893 () Bool)

(assert (=> b!1309118 (= e!746897 (and e!746893 mapRes!54430))))

(declare-fun condMapEmpty!54430 () Bool)

(declare-fun mapDefault!54430 () ValueCell!16702)

