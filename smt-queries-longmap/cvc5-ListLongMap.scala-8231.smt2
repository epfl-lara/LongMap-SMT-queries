; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100294 () Bool)

(assert start!100294)

(declare-fun b_free!25681 () Bool)

(declare-fun b_next!25681 () Bool)

(assert (=> start!100294 (= b_free!25681 (not b_next!25681))))

(declare-fun tp!89991 () Bool)

(declare-fun b_and!42229 () Bool)

(assert (=> start!100294 (= tp!89991 b_and!42229)))

(declare-fun b!1196613 () Bool)

(declare-fun res!796366 () Bool)

(declare-fun e!679854 () Bool)

(assert (=> b!1196613 (=> (not res!796366) (not e!679854))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196613 (= res!796366 (validMask!0 mask!1564))))

(declare-fun b!1196614 () Bool)

(declare-fun res!796362 () Bool)

(assert (=> b!1196614 (=> (not res!796362) (not e!679854))))

(declare-datatypes ((array!77501 0))(
  ( (array!77502 (arr!37397 (Array (_ BitVec 32) (_ BitVec 64))) (size!37933 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77501)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77501 (_ BitVec 32)) Bool)

(assert (=> b!1196614 (= res!796362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196615 () Bool)

(declare-fun e!679850 () Bool)

(assert (=> b!1196615 (= e!679850 true)))

(declare-fun e!679852 () Bool)

(assert (=> b!1196615 e!679852))

(declare-fun c!117336 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196615 (= c!117336 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!45609 0))(
  ( (V!45610 (val!15237 Int)) )
))
(declare-fun zeroValue!944 () V!45609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((Unit!39680 0))(
  ( (Unit!39681) )
))
(declare-fun lt!543111 () Unit!39680)

(declare-datatypes ((ValueCell!14471 0))(
  ( (ValueCellFull!14471 (v!17875 V!45609)) (EmptyCell!14471) )
))
(declare-datatypes ((array!77503 0))(
  ( (array!77504 (arr!37398 (Array (_ BitVec 32) ValueCell!14471)) (size!37934 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77503)

(declare-fun minValue!944 () V!45609)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!978 (array!77501 array!77503 (_ BitVec 32) (_ BitVec 32) V!45609 V!45609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39680)

(assert (=> b!1196615 (= lt!543111 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!978 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196616 () Bool)

(declare-fun res!796361 () Bool)

(assert (=> b!1196616 (=> (not res!796361) (not e!679854))))

(declare-datatypes ((List!26307 0))(
  ( (Nil!26304) (Cons!26303 (h!27512 (_ BitVec 64)) (t!38980 List!26307)) )
))
(declare-fun arrayNoDuplicates!0 (array!77501 (_ BitVec 32) List!26307) Bool)

(assert (=> b!1196616 (= res!796361 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26304))))

(declare-fun b!1196617 () Bool)

(declare-fun e!679851 () Bool)

(declare-fun tp_is_empty!30361 () Bool)

(assert (=> b!1196617 (= e!679851 tp_is_empty!30361)))

(declare-datatypes ((tuple2!19496 0))(
  ( (tuple2!19497 (_1!9759 (_ BitVec 64)) (_2!9759 V!45609)) )
))
(declare-datatypes ((List!26308 0))(
  ( (Nil!26305) (Cons!26304 (h!27513 tuple2!19496) (t!38981 List!26308)) )
))
(declare-datatypes ((ListLongMap!17465 0))(
  ( (ListLongMap!17466 (toList!8748 List!26308)) )
))
(declare-fun call!57164 () ListLongMap!17465)

(declare-fun lt!543110 () array!77501)

(declare-fun bm!57161 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5189 (array!77501 array!77503 (_ BitVec 32) (_ BitVec 32) V!45609 V!45609 (_ BitVec 32) Int) ListLongMap!17465)

(declare-fun dynLambda!3116 (Int (_ BitVec 64)) V!45609)

(assert (=> bm!57161 (= call!57164 (getCurrentListMapNoExtraKeys!5189 lt!543110 (array!77504 (store (arr!37398 _values!996) i!673 (ValueCellFull!14471 (dynLambda!3116 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37934 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196618 () Bool)

(declare-fun e!679849 () Bool)

(assert (=> b!1196618 (= e!679854 e!679849)))

(declare-fun res!796359 () Bool)

(assert (=> b!1196618 (=> (not res!796359) (not e!679849))))

(assert (=> b!1196618 (= res!796359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543110 mask!1564))))

(assert (=> b!1196618 (= lt!543110 (array!77502 (store (arr!37397 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37933 _keys!1208)))))

(declare-fun b!1196619 () Bool)

(declare-fun res!796363 () Bool)

(assert (=> b!1196619 (=> (not res!796363) (not e!679849))))

(assert (=> b!1196619 (= res!796363 (arrayNoDuplicates!0 lt!543110 #b00000000000000000000000000000000 Nil!26304))))

(declare-fun mapIsEmpty!47378 () Bool)

(declare-fun mapRes!47378 () Bool)

(assert (=> mapIsEmpty!47378 mapRes!47378))

(declare-fun bm!57162 () Bool)

(declare-fun call!57165 () ListLongMap!17465)

(assert (=> bm!57162 (= call!57165 (getCurrentListMapNoExtraKeys!5189 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47378 () Bool)

(declare-fun tp!89990 () Bool)

(declare-fun e!679853 () Bool)

(assert (=> mapNonEmpty!47378 (= mapRes!47378 (and tp!89990 e!679853))))

(declare-fun mapKey!47378 () (_ BitVec 32))

(declare-fun mapValue!47378 () ValueCell!14471)

(declare-fun mapRest!47378 () (Array (_ BitVec 32) ValueCell!14471))

(assert (=> mapNonEmpty!47378 (= (arr!37398 _values!996) (store mapRest!47378 mapKey!47378 mapValue!47378))))

(declare-fun b!1196620 () Bool)

(declare-fun e!679855 () Bool)

(assert (=> b!1196620 (= e!679855 (and e!679851 mapRes!47378))))

(declare-fun condMapEmpty!47378 () Bool)

(declare-fun mapDefault!47378 () ValueCell!14471)

