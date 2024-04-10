; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97488 () Bool)

(assert start!97488)

(declare-fun b!1112754 () Bool)

(declare-fun res!742605 () Bool)

(declare-fun e!634392 () Bool)

(assert (=> b!1112754 (=> (not res!742605) (not e!634392))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112754 (= res!742605 (validKeyInArray!0 k!934))))

(declare-fun b!1112755 () Bool)

(declare-fun e!634391 () Bool)

(declare-fun e!634395 () Bool)

(declare-fun mapRes!43396 () Bool)

(assert (=> b!1112755 (= e!634391 (and e!634395 mapRes!43396))))

(declare-fun condMapEmpty!43396 () Bool)

(declare-datatypes ((V!42085 0))(
  ( (V!42086 (val!13916 Int)) )
))
(declare-datatypes ((ValueCell!13150 0))(
  ( (ValueCellFull!13150 (v!16549 V!42085)) (EmptyCell!13150) )
))
(declare-datatypes ((array!72351 0))(
  ( (array!72352 (arr!34828 (Array (_ BitVec 32) ValueCell!13150)) (size!35364 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72351)

(declare-fun mapDefault!43396 () ValueCell!13150)

