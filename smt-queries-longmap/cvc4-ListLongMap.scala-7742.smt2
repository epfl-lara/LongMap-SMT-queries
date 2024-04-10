; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97200 () Bool)

(assert start!97200)

(declare-fun b!1105914 () Bool)

(declare-fun res!737968 () Bool)

(declare-fun e!631132 () Bool)

(assert (=> b!1105914 (=> (not res!737968) (not e!631132))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105914 (= res!737968 (validKeyInArray!0 k!934))))

(declare-fun b!1105915 () Bool)

(declare-fun res!737967 () Bool)

(assert (=> b!1105915 (=> (not res!737967) (not e!631132))))

(declare-datatypes ((array!71779 0))(
  ( (array!71780 (arr!34542 (Array (_ BitVec 32) (_ BitVec 64))) (size!35078 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71779)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105915 (= res!737967 (= (select (arr!34542 _keys!1208) i!673) k!934))))

(declare-fun b!1105916 () Bool)

(declare-fun res!737959 () Bool)

(assert (=> b!1105916 (=> (not res!737959) (not e!631132))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41701 0))(
  ( (V!41702 (val!13772 Int)) )
))
(declare-datatypes ((ValueCell!13006 0))(
  ( (ValueCellFull!13006 (v!16405 V!41701)) (EmptyCell!13006) )
))
(declare-datatypes ((array!71781 0))(
  ( (array!71782 (arr!34543 (Array (_ BitVec 32) ValueCell!13006)) (size!35079 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71781)

(assert (=> b!1105916 (= res!737959 (and (= (size!35079 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35078 _keys!1208) (size!35079 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105917 () Bool)

(declare-fun res!737964 () Bool)

(declare-fun e!631136 () Bool)

(assert (=> b!1105917 (=> (not res!737964) (not e!631136))))

(declare-fun lt!495379 () array!71779)

(declare-datatypes ((List!24083 0))(
  ( (Nil!24080) (Cons!24079 (h!25288 (_ BitVec 64)) (t!34348 List!24083)) )
))
(declare-fun arrayNoDuplicates!0 (array!71779 (_ BitVec 32) List!24083) Bool)

(assert (=> b!1105917 (= res!737964 (arrayNoDuplicates!0 lt!495379 #b00000000000000000000000000000000 Nil!24080))))

(declare-fun b!1105918 () Bool)

(declare-fun res!737960 () Bool)

(assert (=> b!1105918 (=> (not res!737960) (not e!631132))))

(assert (=> b!1105918 (= res!737960 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24080))))

(declare-fun b!1105919 () Bool)

(declare-fun e!631135 () Bool)

(declare-fun e!631137 () Bool)

(declare-fun mapRes!42964 () Bool)

(assert (=> b!1105919 (= e!631135 (and e!631137 mapRes!42964))))

(declare-fun condMapEmpty!42964 () Bool)

(declare-fun mapDefault!42964 () ValueCell!13006)

