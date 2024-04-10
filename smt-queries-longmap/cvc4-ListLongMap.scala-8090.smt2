; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99410 () Bool)

(assert start!99410)

(declare-fun b_free!24989 () Bool)

(declare-fun b_next!24989 () Bool)

(assert (=> start!99410 (= b_free!24989 (not b_next!24989))))

(declare-fun tp!87681 () Bool)

(declare-fun b_and!40845 () Bool)

(assert (=> start!99410 (= tp!87681 b_and!40845)))

(declare-fun b!1173603 () Bool)

(declare-fun res!779319 () Bool)

(declare-fun e!667090 () Bool)

(assert (=> b!1173603 (=> (not res!779319) (not e!667090))))

(declare-datatypes ((array!75849 0))(
  ( (array!75850 (arr!36574 (Array (_ BitVec 32) (_ BitVec 64))) (size!37110 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75849)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44485 0))(
  ( (V!44486 (val!14816 Int)) )
))
(declare-datatypes ((ValueCell!14050 0))(
  ( (ValueCellFull!14050 (v!17454 V!44485)) (EmptyCell!14050) )
))
(declare-datatypes ((array!75851 0))(
  ( (array!75852 (arr!36575 (Array (_ BitVec 32) ValueCell!14050)) (size!37111 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75851)

(assert (=> b!1173603 (= res!779319 (and (= (size!37111 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37110 _keys!1208) (size!37111 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173604 () Bool)

(declare-fun e!667087 () Bool)

(declare-fun e!667089 () Bool)

(assert (=> b!1173604 (= e!667087 e!667089)))

(declare-fun res!779312 () Bool)

(assert (=> b!1173604 (=> res!779312 e!667089)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173604 (= res!779312 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44485)

(declare-fun lt!529047 () array!75851)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529043 () array!75849)

(declare-fun minValue!944 () V!44485)

(declare-datatypes ((tuple2!18934 0))(
  ( (tuple2!18935 (_1!9478 (_ BitVec 64)) (_2!9478 V!44485)) )
))
(declare-datatypes ((List!25673 0))(
  ( (Nil!25670) (Cons!25669 (h!26878 tuple2!18934) (t!37654 List!25673)) )
))
(declare-datatypes ((ListLongMap!16903 0))(
  ( (ListLongMap!16904 (toList!8467 List!25673)) )
))
(declare-fun lt!529045 () ListLongMap!16903)

(declare-fun getCurrentListMapNoExtraKeys!4929 (array!75849 array!75851 (_ BitVec 32) (_ BitVec 32) V!44485 V!44485 (_ BitVec 32) Int) ListLongMap!16903)

(assert (=> b!1173604 (= lt!529045 (getCurrentListMapNoExtraKeys!4929 lt!529043 lt!529047 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529042 () V!44485)

(assert (=> b!1173604 (= lt!529047 (array!75852 (store (arr!36575 _values!996) i!673 (ValueCellFull!14050 lt!529042)) (size!37111 _values!996)))))

(declare-fun dynLambda!2900 (Int (_ BitVec 64)) V!44485)

(assert (=> b!1173604 (= lt!529042 (dynLambda!2900 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529050 () ListLongMap!16903)

(assert (=> b!1173604 (= lt!529050 (getCurrentListMapNoExtraKeys!4929 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46106 () Bool)

(declare-fun mapRes!46106 () Bool)

(assert (=> mapIsEmpty!46106 mapRes!46106))

(declare-fun b!1173605 () Bool)

(declare-fun e!667083 () Bool)

(declare-fun e!667084 () Bool)

(assert (=> b!1173605 (= e!667083 (and e!667084 mapRes!46106))))

(declare-fun condMapEmpty!46106 () Bool)

(declare-fun mapDefault!46106 () ValueCell!14050)

