; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101782 () Bool)

(assert start!101782)

(declare-fun b_free!26471 () Bool)

(declare-fun b_next!26471 () Bool)

(assert (=> start!101782 (= b_free!26471 (not b_next!26471))))

(declare-fun tp!92458 () Bool)

(declare-fun b_and!44203 () Bool)

(assert (=> start!101782 (= tp!92458 b_and!44203)))

(declare-fun b!1225942 () Bool)

(declare-fun res!814750 () Bool)

(declare-fun e!696272 () Bool)

(assert (=> b!1225942 (=> (not res!814750) (not e!696272))))

(declare-datatypes ((array!79127 0))(
  ( (array!79128 (arr!38190 (Array (_ BitVec 32) (_ BitVec 64))) (size!38726 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79127)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79127 (_ BitVec 32)) Bool)

(assert (=> b!1225942 (= res!814750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225943 () Bool)

(declare-fun e!696270 () Bool)

(declare-fun e!696274 () Bool)

(assert (=> b!1225943 (= e!696270 (not e!696274))))

(declare-fun res!814739 () Bool)

(assert (=> b!1225943 (=> res!814739 e!696274)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225943 (= res!814739 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225943 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40630 0))(
  ( (Unit!40631) )
))
(declare-fun lt!558635 () Unit!40630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79127 (_ BitVec 64) (_ BitVec 32)) Unit!40630)

(assert (=> b!1225943 (= lt!558635 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1225944 () Bool)

(declare-fun res!814741 () Bool)

(assert (=> b!1225944 (=> (not res!814741) (not e!696272))))

(assert (=> b!1225944 (= res!814741 (= (select (arr!38190 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!48661 () Bool)

(declare-fun mapRes!48661 () Bool)

(assert (=> mapIsEmpty!48661 mapRes!48661))

(declare-fun b!1225945 () Bool)

(declare-fun res!814747 () Bool)

(assert (=> b!1225945 (=> (not res!814747) (not e!696272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225945 (= res!814747 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!48661 () Bool)

(declare-fun tp!92459 () Bool)

(declare-fun e!696276 () Bool)

(assert (=> mapNonEmpty!48661 (= mapRes!48661 (and tp!92459 e!696276))))

(declare-fun mapKey!48661 () (_ BitVec 32))

(declare-datatypes ((V!46693 0))(
  ( (V!46694 (val!15644 Int)) )
))
(declare-datatypes ((ValueCell!14878 0))(
  ( (ValueCellFull!14878 (v!18306 V!46693)) (EmptyCell!14878) )
))
(declare-fun mapRest!48661 () (Array (_ BitVec 32) ValueCell!14878))

(declare-fun mapValue!48661 () ValueCell!14878)

(declare-datatypes ((array!79129 0))(
  ( (array!79130 (arr!38191 (Array (_ BitVec 32) ValueCell!14878)) (size!38727 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79129)

(assert (=> mapNonEmpty!48661 (= (arr!38191 _values!996) (store mapRest!48661 mapKey!48661 mapValue!48661))))

(declare-fun b!1225946 () Bool)

(declare-fun e!696271 () Bool)

(declare-fun tp_is_empty!31175 () Bool)

(assert (=> b!1225946 (= e!696271 tp_is_empty!31175)))

(declare-fun res!814740 () Bool)

(assert (=> start!101782 (=> (not res!814740) (not e!696272))))

(assert (=> start!101782 (= res!814740 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38726 _keys!1208))))))

(assert (=> start!101782 e!696272))

(assert (=> start!101782 tp_is_empty!31175))

(declare-fun array_inv!29040 (array!79127) Bool)

(assert (=> start!101782 (array_inv!29040 _keys!1208)))

(assert (=> start!101782 true))

(assert (=> start!101782 tp!92458))

(declare-fun e!696275 () Bool)

(declare-fun array_inv!29041 (array!79129) Bool)

(assert (=> start!101782 (and (array_inv!29041 _values!996) e!696275)))

(declare-fun b!1225947 () Bool)

(declare-fun res!814743 () Bool)

(assert (=> b!1225947 (=> (not res!814743) (not e!696272))))

(declare-datatypes ((List!26966 0))(
  ( (Nil!26963) (Cons!26962 (h!28171 (_ BitVec 64)) (t!40417 List!26966)) )
))
(declare-fun arrayNoDuplicates!0 (array!79127 (_ BitVec 32) List!26966) Bool)

(assert (=> b!1225947 (= res!814743 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26963))))

(declare-fun b!1225948 () Bool)

(assert (=> b!1225948 (= e!696272 e!696270)))

(declare-fun res!814749 () Bool)

(assert (=> b!1225948 (=> (not res!814749) (not e!696270))))

(declare-fun lt!558634 () array!79127)

(assert (=> b!1225948 (= res!814749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558634 mask!1564))))

(assert (=> b!1225948 (= lt!558634 (array!79128 (store (arr!38190 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38726 _keys!1208)))))

(declare-fun b!1225949 () Bool)

(assert (=> b!1225949 (= e!696276 tp_is_empty!31175)))

(declare-fun b!1225950 () Bool)

(declare-fun res!814748 () Bool)

(assert (=> b!1225950 (=> (not res!814748) (not e!696272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225950 (= res!814748 (validMask!0 mask!1564))))

(declare-fun b!1225951 () Bool)

(declare-fun res!814744 () Bool)

(assert (=> b!1225951 (=> (not res!814744) (not e!696270))))

(assert (=> b!1225951 (= res!814744 (arrayNoDuplicates!0 lt!558634 #b00000000000000000000000000000000 Nil!26963))))

(declare-fun b!1225952 () Bool)

(assert (=> b!1225952 (= e!696275 (and e!696271 mapRes!48661))))

(declare-fun condMapEmpty!48661 () Bool)

(declare-fun mapDefault!48661 () ValueCell!14878)

