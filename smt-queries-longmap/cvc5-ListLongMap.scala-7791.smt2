; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97490 () Bool)

(assert start!97490)

(declare-fun b!1112793 () Bool)

(declare-fun e!634408 () Bool)

(declare-fun tp_is_empty!27721 () Bool)

(assert (=> b!1112793 (= e!634408 tp_is_empty!27721)))

(declare-fun b!1112794 () Bool)

(declare-fun res!742636 () Bool)

(declare-fun e!634410 () Bool)

(assert (=> b!1112794 (=> (not res!742636) (not e!634410))))

(declare-datatypes ((array!72353 0))(
  ( (array!72354 (arr!34829 (Array (_ BitVec 32) (_ BitVec 64))) (size!35365 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72353)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72353 (_ BitVec 32)) Bool)

(assert (=> b!1112794 (= res!742636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112795 () Bool)

(declare-fun res!742634 () Bool)

(assert (=> b!1112795 (=> (not res!742634) (not e!634410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112795 (= res!742634 (validMask!0 mask!1564))))

(declare-fun b!1112796 () Bool)

(declare-fun e!634409 () Bool)

(assert (=> b!1112796 (= e!634409 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112796 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36516 0))(
  ( (Unit!36517) )
))
(declare-fun lt!496573 () Unit!36516)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72353 (_ BitVec 64) (_ BitVec 32)) Unit!36516)

(assert (=> b!1112796 (= lt!496573 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1112797 () Bool)

(declare-fun res!742637 () Bool)

(assert (=> b!1112797 (=> (not res!742637) (not e!634409))))

(declare-fun lt!496574 () array!72353)

(declare-datatypes ((List!24298 0))(
  ( (Nil!24295) (Cons!24294 (h!25503 (_ BitVec 64)) (t!34779 List!24298)) )
))
(declare-fun arrayNoDuplicates!0 (array!72353 (_ BitVec 32) List!24298) Bool)

(assert (=> b!1112797 (= res!742637 (arrayNoDuplicates!0 lt!496574 #b00000000000000000000000000000000 Nil!24295))))

(declare-fun b!1112798 () Bool)

(declare-fun res!742641 () Bool)

(assert (=> b!1112798 (=> (not res!742641) (not e!634410))))

(assert (=> b!1112798 (= res!742641 (= (select (arr!34829 _keys!1208) i!673) k!934))))

(declare-fun b!1112799 () Bool)

(declare-fun res!742639 () Bool)

(assert (=> b!1112799 (=> (not res!742639) (not e!634410))))

(assert (=> b!1112799 (= res!742639 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35365 _keys!1208))))))

(declare-fun mapIsEmpty!43399 () Bool)

(declare-fun mapRes!43399 () Bool)

(assert (=> mapIsEmpty!43399 mapRes!43399))

(declare-fun b!1112800 () Bool)

(declare-fun e!634412 () Bool)

(declare-fun e!634413 () Bool)

(assert (=> b!1112800 (= e!634412 (and e!634413 mapRes!43399))))

(declare-fun condMapEmpty!43399 () Bool)

(declare-datatypes ((V!42089 0))(
  ( (V!42090 (val!13917 Int)) )
))
(declare-datatypes ((ValueCell!13151 0))(
  ( (ValueCellFull!13151 (v!16550 V!42089)) (EmptyCell!13151) )
))
(declare-datatypes ((array!72355 0))(
  ( (array!72356 (arr!34830 (Array (_ BitVec 32) ValueCell!13151)) (size!35366 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72355)

(declare-fun mapDefault!43399 () ValueCell!13151)

