; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99482 () Bool)

(assert start!99482)

(declare-fun b_free!25061 () Bool)

(declare-fun b_next!25061 () Bool)

(assert (=> start!99482 (= b_free!25061 (not b_next!25061))))

(declare-fun tp!87897 () Bool)

(declare-fun b_and!40989 () Bool)

(assert (=> start!99482 (= tp!87897 b_and!40989)))

(declare-fun b!1175835 () Bool)

(declare-fun e!668375 () Bool)

(declare-fun e!668376 () Bool)

(assert (=> b!1175835 (= e!668375 e!668376)))

(declare-fun res!780932 () Bool)

(assert (=> b!1175835 (=> (not res!780932) (not e!668376))))

(declare-datatypes ((array!75989 0))(
  ( (array!75990 (arr!36644 (Array (_ BitVec 32) (_ BitVec 64))) (size!37180 (_ BitVec 32))) )
))
(declare-fun lt!530558 () array!75989)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75989 (_ BitVec 32)) Bool)

(assert (=> b!1175835 (= res!780932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530558 mask!1564))))

(declare-fun _keys!1208 () array!75989)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175835 (= lt!530558 (array!75990 (store (arr!36644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37180 _keys!1208)))))

(declare-fun b!1175836 () Bool)

(declare-fun res!780945 () Bool)

(assert (=> b!1175836 (=> (not res!780945) (not e!668375))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44581 0))(
  ( (V!44582 (val!14852 Int)) )
))
(declare-datatypes ((ValueCell!14086 0))(
  ( (ValueCellFull!14086 (v!17490 V!44581)) (EmptyCell!14086) )
))
(declare-datatypes ((array!75991 0))(
  ( (array!75992 (arr!36645 (Array (_ BitVec 32) ValueCell!14086)) (size!37181 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75991)

(assert (=> b!1175836 (= res!780945 (and (= (size!37181 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37180 _keys!1208) (size!37181 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175837 () Bool)

(declare-fun e!668380 () Bool)

(declare-fun e!668385 () Bool)

(assert (=> b!1175837 (= e!668380 e!668385)))

(declare-fun res!780937 () Bool)

(assert (=> b!1175837 (=> res!780937 e!668385)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1175837 (= res!780937 (not (= (select (arr!36644 _keys!1208) from!1455) k!934)))))

(declare-fun b!1175838 () Bool)

(declare-fun res!780940 () Bool)

(assert (=> b!1175838 (=> (not res!780940) (not e!668376))))

(declare-datatypes ((List!25729 0))(
  ( (Nil!25726) (Cons!25725 (h!26934 (_ BitVec 64)) (t!37782 List!25729)) )
))
(declare-fun arrayNoDuplicates!0 (array!75989 (_ BitVec 32) List!25729) Bool)

(assert (=> b!1175838 (= res!780940 (arrayNoDuplicates!0 lt!530558 #b00000000000000000000000000000000 Nil!25726))))

(declare-fun b!1175839 () Bool)

(declare-datatypes ((Unit!38805 0))(
  ( (Unit!38806) )
))
(declare-fun e!668383 () Unit!38805)

(declare-fun Unit!38807 () Unit!38805)

(assert (=> b!1175839 (= e!668383 Unit!38807)))

(declare-fun b!1175840 () Bool)

(declare-fun res!780933 () Bool)

(assert (=> b!1175840 (=> (not res!780933) (not e!668375))))

(assert (=> b!1175840 (= res!780933 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25726))))

(declare-fun b!1175841 () Bool)

(declare-fun Unit!38808 () Unit!38805)

(assert (=> b!1175841 (= e!668383 Unit!38808)))

(declare-fun lt!530552 () Unit!38805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75989 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38805)

(assert (=> b!1175841 (= lt!530552 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175841 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530553 () Unit!38805)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75989 (_ BitVec 32) (_ BitVec 32)) Unit!38805)

(assert (=> b!1175841 (= lt!530553 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175841 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25726)))

(declare-fun lt!530562 () Unit!38805)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75989 (_ BitVec 64) (_ BitVec 32) List!25729) Unit!38805)

(assert (=> b!1175841 (= lt!530562 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25726))))

(assert (=> b!1175841 false))

(declare-fun b!1175842 () Bool)

(declare-fun res!780942 () Bool)

(assert (=> b!1175842 (=> (not res!780942) (not e!668375))))

(assert (=> b!1175842 (= res!780942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!780939 () Bool)

(assert (=> start!99482 (=> (not res!780939) (not e!668375))))

(assert (=> start!99482 (= res!780939 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37180 _keys!1208))))))

(assert (=> start!99482 e!668375))

(declare-fun tp_is_empty!29591 () Bool)

(assert (=> start!99482 tp_is_empty!29591))

(declare-fun array_inv!27990 (array!75989) Bool)

(assert (=> start!99482 (array_inv!27990 _keys!1208)))

(assert (=> start!99482 true))

(assert (=> start!99482 tp!87897))

(declare-fun e!668381 () Bool)

(declare-fun array_inv!27991 (array!75991) Bool)

(assert (=> start!99482 (and (array_inv!27991 _values!996) e!668381)))

(declare-fun b!1175843 () Bool)

(declare-fun res!780941 () Bool)

(assert (=> b!1175843 (=> (not res!780941) (not e!668375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175843 (= res!780941 (validKeyInArray!0 k!934))))

(declare-fun b!1175844 () Bool)

(declare-fun e!668386 () Bool)

(declare-fun mapRes!46214 () Bool)

(assert (=> b!1175844 (= e!668381 (and e!668386 mapRes!46214))))

(declare-fun condMapEmpty!46214 () Bool)

(declare-fun mapDefault!46214 () ValueCell!14086)

