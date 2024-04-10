; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97548 () Bool)

(assert start!97548)

(declare-fun b!1113924 () Bool)

(declare-fun e!634935 () Bool)

(assert (=> b!1113924 (= e!634935 (not true))))

(declare-datatypes ((array!72465 0))(
  ( (array!72466 (arr!34885 (Array (_ BitVec 32) (_ BitVec 64))) (size!35421 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72465)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113924 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36558 0))(
  ( (Unit!36559) )
))
(declare-fun lt!496748 () Unit!36558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72465 (_ BitVec 64) (_ BitVec 32)) Unit!36558)

(assert (=> b!1113924 (= lt!496748 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1113925 () Bool)

(declare-fun e!634933 () Bool)

(assert (=> b!1113925 (= e!634933 e!634935)))

(declare-fun res!743505 () Bool)

(assert (=> b!1113925 (=> (not res!743505) (not e!634935))))

(declare-fun lt!496747 () array!72465)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72465 (_ BitVec 32)) Bool)

(assert (=> b!1113925 (= res!743505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496747 mask!1564))))

(assert (=> b!1113925 (= lt!496747 (array!72466 (store (arr!34885 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35421 _keys!1208)))))

(declare-fun mapIsEmpty!43486 () Bool)

(declare-fun mapRes!43486 () Bool)

(assert (=> mapIsEmpty!43486 mapRes!43486))

(declare-fun b!1113926 () Bool)

(declare-fun res!743512 () Bool)

(assert (=> b!1113926 (=> (not res!743512) (not e!634935))))

(declare-datatypes ((List!24318 0))(
  ( (Nil!24315) (Cons!24314 (h!25523 (_ BitVec 64)) (t!34799 List!24318)) )
))
(declare-fun arrayNoDuplicates!0 (array!72465 (_ BitVec 32) List!24318) Bool)

(assert (=> b!1113926 (= res!743512 (arrayNoDuplicates!0 lt!496747 #b00000000000000000000000000000000 Nil!24315))))

(declare-fun b!1113927 () Bool)

(declare-fun res!743503 () Bool)

(assert (=> b!1113927 (=> (not res!743503) (not e!634933))))

(assert (=> b!1113927 (= res!743503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113928 () Bool)

(declare-fun res!743504 () Bool)

(assert (=> b!1113928 (=> (not res!743504) (not e!634933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113928 (= res!743504 (validMask!0 mask!1564))))

(declare-fun b!1113929 () Bool)

(declare-fun e!634932 () Bool)

(declare-fun tp_is_empty!27779 () Bool)

(assert (=> b!1113929 (= e!634932 tp_is_empty!27779)))

(declare-fun b!1113930 () Bool)

(declare-fun res!743507 () Bool)

(assert (=> b!1113930 (=> (not res!743507) (not e!634933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113930 (= res!743507 (validKeyInArray!0 k!934))))

(declare-fun b!1113932 () Bool)

(declare-fun e!634931 () Bool)

(assert (=> b!1113932 (= e!634931 tp_is_empty!27779)))

(declare-fun b!1113933 () Bool)

(declare-fun e!634934 () Bool)

(assert (=> b!1113933 (= e!634934 (and e!634932 mapRes!43486))))

(declare-fun condMapEmpty!43486 () Bool)

(declare-datatypes ((V!42165 0))(
  ( (V!42166 (val!13946 Int)) )
))
(declare-datatypes ((ValueCell!13180 0))(
  ( (ValueCellFull!13180 (v!16579 V!42165)) (EmptyCell!13180) )
))
(declare-datatypes ((array!72467 0))(
  ( (array!72468 (arr!34886 (Array (_ BitVec 32) ValueCell!13180)) (size!35422 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72467)

(declare-fun mapDefault!43486 () ValueCell!13180)

