; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97502 () Bool)

(assert start!97502)

(declare-fun res!742814 () Bool)

(declare-fun e!634520 () Bool)

(assert (=> start!97502 (=> (not res!742814) (not e!634520))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72375 0))(
  ( (array!72376 (arr!34840 (Array (_ BitVec 32) (_ BitVec 64))) (size!35376 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72375)

(assert (=> start!97502 (= res!742814 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35376 _keys!1208))))))

(assert (=> start!97502 e!634520))

(declare-fun array_inv!26790 (array!72375) Bool)

(assert (=> start!97502 (array_inv!26790 _keys!1208)))

(assert (=> start!97502 true))

(declare-datatypes ((V!42105 0))(
  ( (V!42106 (val!13923 Int)) )
))
(declare-datatypes ((ValueCell!13157 0))(
  ( (ValueCellFull!13157 (v!16556 V!42105)) (EmptyCell!13157) )
))
(declare-datatypes ((array!72377 0))(
  ( (array!72378 (arr!34841 (Array (_ BitVec 32) ValueCell!13157)) (size!35377 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72377)

(declare-fun e!634516 () Bool)

(declare-fun array_inv!26791 (array!72377) Bool)

(assert (=> start!97502 (and (array_inv!26791 _values!996) e!634516)))

(declare-fun b!1113027 () Bool)

(declare-fun res!742819 () Bool)

(assert (=> b!1113027 (=> (not res!742819) (not e!634520))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1113027 (= res!742819 (= (select (arr!34840 _keys!1208) i!673) k!934))))

(declare-fun b!1113028 () Bool)

(declare-fun e!634518 () Bool)

(assert (=> b!1113028 (= e!634520 e!634518)))

(declare-fun res!742817 () Bool)

(assert (=> b!1113028 (=> (not res!742817) (not e!634518))))

(declare-fun lt!496610 () array!72375)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72375 (_ BitVec 32)) Bool)

(assert (=> b!1113028 (= res!742817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496610 mask!1564))))

(assert (=> b!1113028 (= lt!496610 (array!72376 (store (arr!34840 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35376 _keys!1208)))))

(declare-fun mapNonEmpty!43417 () Bool)

(declare-fun mapRes!43417 () Bool)

(declare-fun tp!82661 () Bool)

(declare-fun e!634517 () Bool)

(assert (=> mapNonEmpty!43417 (= mapRes!43417 (and tp!82661 e!634517))))

(declare-fun mapValue!43417 () ValueCell!13157)

(declare-fun mapRest!43417 () (Array (_ BitVec 32) ValueCell!13157))

(declare-fun mapKey!43417 () (_ BitVec 32))

(assert (=> mapNonEmpty!43417 (= (arr!34841 _values!996) (store mapRest!43417 mapKey!43417 mapValue!43417))))

(declare-fun b!1113029 () Bool)

(declare-fun res!742816 () Bool)

(assert (=> b!1113029 (=> (not res!742816) (not e!634518))))

(declare-datatypes ((List!24303 0))(
  ( (Nil!24300) (Cons!24299 (h!25508 (_ BitVec 64)) (t!34784 List!24303)) )
))
(declare-fun arrayNoDuplicates!0 (array!72375 (_ BitVec 32) List!24303) Bool)

(assert (=> b!1113029 (= res!742816 (arrayNoDuplicates!0 lt!496610 #b00000000000000000000000000000000 Nil!24300))))

(declare-fun b!1113030 () Bool)

(declare-fun tp_is_empty!27733 () Bool)

(assert (=> b!1113030 (= e!634517 tp_is_empty!27733)))

(declare-fun b!1113031 () Bool)

(declare-fun res!742822 () Bool)

(assert (=> b!1113031 (=> (not res!742822) (not e!634520))))

(assert (=> b!1113031 (= res!742822 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35376 _keys!1208))))))

(declare-fun b!1113032 () Bool)

(declare-fun e!634519 () Bool)

(assert (=> b!1113032 (= e!634516 (and e!634519 mapRes!43417))))

(declare-fun condMapEmpty!43417 () Bool)

(declare-fun mapDefault!43417 () ValueCell!13157)

