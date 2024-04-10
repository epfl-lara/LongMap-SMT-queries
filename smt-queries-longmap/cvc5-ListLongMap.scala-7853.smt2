; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97862 () Bool)

(assert start!97862)

(declare-fun b_free!23563 () Bool)

(declare-fun b_next!23563 () Bool)

(assert (=> start!97862 (= b_free!23563 (not b_next!23563))))

(declare-fun tp!83392 () Bool)

(declare-fun b_and!37909 () Bool)

(assert (=> start!97862 (= tp!83392 b_and!37909)))

(declare-fun b!1120310 () Bool)

(declare-fun res!748413 () Bool)

(declare-fun e!637948 () Bool)

(assert (=> b!1120310 (=> (not res!748413) (not e!637948))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!73067 0))(
  ( (array!73068 (arr!35186 (Array (_ BitVec 32) (_ BitVec 64))) (size!35722 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73067)

(assert (=> b!1120310 (= res!748413 (= (select (arr!35186 _keys!1208) i!673) k!934))))

(declare-fun b!1120311 () Bool)

(declare-fun res!748414 () Bool)

(assert (=> b!1120311 (=> (not res!748414) (not e!637948))))

(assert (=> b!1120311 (= res!748414 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35722 _keys!1208))))))

(declare-fun b!1120312 () Bool)

(declare-fun e!637951 () Bool)

(declare-fun e!637953 () Bool)

(assert (=> b!1120312 (= e!637951 (not e!637953))))

(declare-fun res!748411 () Bool)

(assert (=> b!1120312 (=> res!748411 e!637953)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1120312 (= res!748411 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120312 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36760 0))(
  ( (Unit!36761) )
))
(declare-fun lt!497993 () Unit!36760)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73067 (_ BitVec 64) (_ BitVec 32)) Unit!36760)

(assert (=> b!1120312 (= lt!497993 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!43957 () Bool)

(declare-fun mapRes!43957 () Bool)

(assert (=> mapIsEmpty!43957 mapRes!43957))

(declare-fun b!1120313 () Bool)

(declare-fun res!748406 () Bool)

(assert (=> b!1120313 (=> (not res!748406) (not e!637948))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73067 (_ BitVec 32)) Bool)

(assert (=> b!1120313 (= res!748406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120314 () Bool)

(declare-fun e!637949 () Bool)

(declare-fun tp_is_empty!28093 () Bool)

(assert (=> b!1120314 (= e!637949 tp_is_empty!28093)))

(declare-fun b!1120315 () Bool)

(declare-fun res!748408 () Bool)

(assert (=> b!1120315 (=> (not res!748408) (not e!637948))))

(declare-datatypes ((List!24479 0))(
  ( (Nil!24476) (Cons!24475 (h!25684 (_ BitVec 64)) (t!35034 List!24479)) )
))
(declare-fun arrayNoDuplicates!0 (array!73067 (_ BitVec 32) List!24479) Bool)

(assert (=> b!1120315 (= res!748408 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24476))))

(declare-fun b!1120316 () Bool)

(declare-fun res!748404 () Bool)

(assert (=> b!1120316 (=> (not res!748404) (not e!637951))))

(declare-fun lt!497990 () array!73067)

(assert (=> b!1120316 (= res!748404 (arrayNoDuplicates!0 lt!497990 #b00000000000000000000000000000000 Nil!24476))))

(declare-fun b!1120317 () Bool)

(declare-fun e!637947 () Bool)

(assert (=> b!1120317 (= e!637947 tp_is_empty!28093)))

(declare-fun b!1120318 () Bool)

(declare-fun res!748407 () Bool)

(assert (=> b!1120318 (=> (not res!748407) (not e!637948))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42585 0))(
  ( (V!42586 (val!14103 Int)) )
))
(declare-datatypes ((ValueCell!13337 0))(
  ( (ValueCellFull!13337 (v!16736 V!42585)) (EmptyCell!13337) )
))
(declare-datatypes ((array!73069 0))(
  ( (array!73070 (arr!35187 (Array (_ BitVec 32) ValueCell!13337)) (size!35723 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73069)

(assert (=> b!1120318 (= res!748407 (and (= (size!35723 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35722 _keys!1208) (size!35723 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!748409 () Bool)

(assert (=> start!97862 (=> (not res!748409) (not e!637948))))

(assert (=> start!97862 (= res!748409 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35722 _keys!1208))))))

(assert (=> start!97862 e!637948))

(assert (=> start!97862 tp_is_empty!28093))

(declare-fun array_inv!27024 (array!73067) Bool)

(assert (=> start!97862 (array_inv!27024 _keys!1208)))

(assert (=> start!97862 true))

(assert (=> start!97862 tp!83392))

(declare-fun e!637950 () Bool)

(declare-fun array_inv!27025 (array!73069) Bool)

(assert (=> start!97862 (and (array_inv!27025 _values!996) e!637950)))

(declare-fun b!1120319 () Bool)

(declare-fun res!748412 () Bool)

(assert (=> b!1120319 (=> (not res!748412) (not e!637948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120319 (= res!748412 (validMask!0 mask!1564))))

(declare-fun b!1120320 () Bool)

(assert (=> b!1120320 (= e!637948 e!637951)))

(declare-fun res!748405 () Bool)

(assert (=> b!1120320 (=> (not res!748405) (not e!637951))))

(assert (=> b!1120320 (= res!748405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497990 mask!1564))))

(assert (=> b!1120320 (= lt!497990 (array!73068 (store (arr!35186 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35722 _keys!1208)))))

(declare-fun mapNonEmpty!43957 () Bool)

(declare-fun tp!83393 () Bool)

(assert (=> mapNonEmpty!43957 (= mapRes!43957 (and tp!83393 e!637947))))

(declare-fun mapKey!43957 () (_ BitVec 32))

(declare-fun mapRest!43957 () (Array (_ BitVec 32) ValueCell!13337))

(declare-fun mapValue!43957 () ValueCell!13337)

(assert (=> mapNonEmpty!43957 (= (arr!35187 _values!996) (store mapRest!43957 mapKey!43957 mapValue!43957))))

(declare-fun b!1120321 () Bool)

(assert (=> b!1120321 (= e!637950 (and e!637949 mapRes!43957))))

(declare-fun condMapEmpty!43957 () Bool)

(declare-fun mapDefault!43957 () ValueCell!13337)

