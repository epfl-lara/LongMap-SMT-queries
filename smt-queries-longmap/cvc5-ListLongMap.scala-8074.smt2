; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99310 () Bool)

(assert start!99310)

(declare-fun b_free!24889 () Bool)

(declare-fun b_next!24889 () Bool)

(assert (=> start!99310 (= b_free!24889 (not b_next!24889))))

(declare-fun tp!87380 () Bool)

(declare-fun b_and!40645 () Bool)

(assert (=> start!99310 (= tp!87380 b_and!40645)))

(declare-fun b!1170366 () Bool)

(declare-fun res!776716 () Bool)

(declare-fun e!665203 () Bool)

(assert (=> b!1170366 (=> (not res!776716) (not e!665203))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170366 (= res!776716 (validMask!0 mask!1564))))

(declare-datatypes ((array!75657 0))(
  ( (array!75658 (arr!36478 (Array (_ BitVec 32) (_ BitVec 64))) (size!37014 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75657)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!665199 () Bool)

(declare-fun b!1170367 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170367 (= e!665199 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!45956 () Bool)

(declare-fun mapRes!45956 () Bool)

(assert (=> mapIsEmpty!45956 mapRes!45956))

(declare-fun b!1170368 () Bool)

(declare-fun e!665205 () Bool)

(declare-fun tp_is_empty!29419 () Bool)

(assert (=> b!1170368 (= e!665205 tp_is_empty!29419)))

(declare-fun b!1170369 () Bool)

(declare-fun e!665201 () Bool)

(assert (=> b!1170369 (= e!665201 tp_is_empty!29419)))

(declare-fun b!1170370 () Bool)

(declare-fun res!776728 () Bool)

(assert (=> b!1170370 (=> (not res!776728) (not e!665203))))

(assert (=> b!1170370 (= res!776728 (= (select (arr!36478 _keys!1208) i!673) k!934))))

(declare-fun b!1170371 () Bool)

(declare-fun res!776715 () Bool)

(assert (=> b!1170371 (=> (not res!776715) (not e!665203))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44353 0))(
  ( (V!44354 (val!14766 Int)) )
))
(declare-datatypes ((ValueCell!14000 0))(
  ( (ValueCellFull!14000 (v!17404 V!44353)) (EmptyCell!14000) )
))
(declare-datatypes ((array!75659 0))(
  ( (array!75660 (arr!36479 (Array (_ BitVec 32) ValueCell!14000)) (size!37015 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75659)

(assert (=> b!1170371 (= res!776715 (and (= (size!37015 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37014 _keys!1208) (size!37015 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170372 () Bool)

(declare-fun e!665200 () Bool)

(assert (=> b!1170372 (= e!665200 true)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170372 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-datatypes ((Unit!38610 0))(
  ( (Unit!38611) )
))
(declare-fun lt!527103 () Unit!38610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75657 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38610)

(assert (=> b!1170372 (= lt!527103 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!776723 () Bool)

(assert (=> start!99310 (=> (not res!776723) (not e!665203))))

(assert (=> start!99310 (= res!776723 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37014 _keys!1208))))))

(assert (=> start!99310 e!665203))

(assert (=> start!99310 tp_is_empty!29419))

(declare-fun array_inv!27882 (array!75657) Bool)

(assert (=> start!99310 (array_inv!27882 _keys!1208)))

(assert (=> start!99310 true))

(assert (=> start!99310 tp!87380))

(declare-fun e!665198 () Bool)

(declare-fun array_inv!27883 (array!75659) Bool)

(assert (=> start!99310 (and (array_inv!27883 _values!996) e!665198)))

(declare-fun b!1170373 () Bool)

(assert (=> b!1170373 (= e!665198 (and e!665201 mapRes!45956))))

(declare-fun condMapEmpty!45956 () Bool)

(declare-fun mapDefault!45956 () ValueCell!14000)

