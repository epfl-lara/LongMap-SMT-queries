; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100428 () Bool)

(assert start!100428)

(declare-fun b_free!25751 () Bool)

(declare-fun b_next!25751 () Bool)

(assert (=> start!100428 (= b_free!25751 (not b_next!25751))))

(declare-fun tp!90242 () Bool)

(declare-fun b_and!42389 () Bool)

(assert (=> start!100428 (= tp!90242 b_and!42389)))

(declare-fun b!1198924 () Bool)

(declare-fun e!681000 () Bool)

(assert (=> b!1198924 (= e!681000 true)))

(declare-datatypes ((V!45733 0))(
  ( (V!45734 (val!15284 Int)) )
))
(declare-fun zeroValue!944 () V!45733)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77687 0))(
  ( (array!77688 (arr!37488 (Array (_ BitVec 32) (_ BitVec 64))) (size!38024 (_ BitVec 32))) )
))
(declare-fun lt!543630 () array!77687)

(declare-datatypes ((ValueCell!14518 0))(
  ( (ValueCellFull!14518 (v!17922 V!45733)) (EmptyCell!14518) )
))
(declare-datatypes ((array!77689 0))(
  ( (array!77690 (arr!37489 (Array (_ BitVec 32) ValueCell!14518)) (size!38025 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77689)

(declare-datatypes ((tuple2!19560 0))(
  ( (tuple2!19561 (_1!9791 (_ BitVec 64)) (_2!9791 V!45733)) )
))
(declare-datatypes ((List!26376 0))(
  ( (Nil!26373) (Cons!26372 (h!27581 tuple2!19560) (t!39107 List!26376)) )
))
(declare-datatypes ((ListLongMap!17529 0))(
  ( (ListLongMap!17530 (toList!8780 List!26376)) )
))
(declare-fun lt!543629 () ListLongMap!17529)

(declare-fun minValue!944 () V!45733)

(declare-fun getCurrentListMapNoExtraKeys!5219 (array!77687 array!77689 (_ BitVec 32) (_ BitVec 32) V!45733 V!45733 (_ BitVec 32) Int) ListLongMap!17529)

(declare-fun dynLambda!3139 (Int (_ BitVec 64)) V!45733)

(assert (=> b!1198924 (= lt!543629 (getCurrentListMapNoExtraKeys!5219 lt!543630 (array!77690 (store (arr!37489 _values!996) i!673 (ValueCellFull!14518 (dynLambda!3139 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38025 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77687)

(declare-fun lt!543628 () ListLongMap!17529)

(assert (=> b!1198924 (= lt!543628 (getCurrentListMapNoExtraKeys!5219 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198925 () Bool)

(declare-fun res!797969 () Bool)

(declare-fun e!680999 () Bool)

(assert (=> b!1198925 (=> (not res!797969) (not e!680999))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198925 (= res!797969 (validKeyInArray!0 k!934))))

(declare-fun b!1198926 () Bool)

(declare-fun e!680998 () Bool)

(declare-fun e!681003 () Bool)

(declare-fun mapRes!47525 () Bool)

(assert (=> b!1198926 (= e!680998 (and e!681003 mapRes!47525))))

(declare-fun condMapEmpty!47525 () Bool)

(declare-fun mapDefault!47525 () ValueCell!14518)

