; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101262 () Bool)

(assert start!101262)

(declare-fun b_free!26185 () Bool)

(declare-fun b_next!26185 () Bool)

(assert (=> start!101262 (= b_free!26185 (not b_next!26185))))

(declare-fun tp!91577 () Bool)

(declare-fun b_and!43487 () Bool)

(assert (=> start!101262 (= tp!91577 b_and!43487)))

(declare-fun b!1216346 () Bool)

(declare-fun res!807691 () Bool)

(declare-fun e!690577 () Bool)

(assert (=> b!1216346 (=> (not res!807691) (not e!690577))))

(declare-datatypes ((array!78551 0))(
  ( (array!78552 (arr!37910 (Array (_ BitVec 32) (_ BitVec 64))) (size!38446 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78551)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1216346 (= res!807691 (= (select (arr!37910 _keys!1208) i!673) k!934))))

(declare-fun b!1216347 () Bool)

(declare-fun e!690579 () Bool)

(declare-fun e!690583 () Bool)

(assert (=> b!1216347 (= e!690579 e!690583)))

(declare-fun res!807684 () Bool)

(assert (=> b!1216347 (=> res!807684 e!690583)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1216347 (= res!807684 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46313 0))(
  ( (V!46314 (val!15501 Int)) )
))
(declare-fun zeroValue!944 () V!46313)

(declare-fun lt!552870 () array!78551)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19920 0))(
  ( (tuple2!19921 (_1!9971 (_ BitVec 64)) (_2!9971 V!46313)) )
))
(declare-datatypes ((List!26726 0))(
  ( (Nil!26723) (Cons!26722 (h!27931 tuple2!19920) (t!39891 List!26726)) )
))
(declare-datatypes ((ListLongMap!17889 0))(
  ( (ListLongMap!17890 (toList!8960 List!26726)) )
))
(declare-fun lt!552869 () ListLongMap!17889)

(declare-fun minValue!944 () V!46313)

(declare-datatypes ((ValueCell!14735 0))(
  ( (ValueCellFull!14735 (v!18154 V!46313)) (EmptyCell!14735) )
))
(declare-datatypes ((array!78553 0))(
  ( (array!78554 (arr!37911 (Array (_ BitVec 32) ValueCell!14735)) (size!38447 (_ BitVec 32))) )
))
(declare-fun lt!552868 () array!78553)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5387 (array!78551 array!78553 (_ BitVec 32) (_ BitVec 32) V!46313 V!46313 (_ BitVec 32) Int) ListLongMap!17889)

(assert (=> b!1216347 (= lt!552869 (getCurrentListMapNoExtraKeys!5387 lt!552870 lt!552868 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78553)

(declare-fun dynLambda!3276 (Int (_ BitVec 64)) V!46313)

(assert (=> b!1216347 (= lt!552868 (array!78554 (store (arr!37911 _values!996) i!673 (ValueCellFull!14735 (dynLambda!3276 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38447 _values!996)))))

(declare-fun lt!552865 () ListLongMap!17889)

(assert (=> b!1216347 (= lt!552865 (getCurrentListMapNoExtraKeys!5387 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216348 () Bool)

(declare-fun res!807689 () Bool)

(assert (=> b!1216348 (=> (not res!807689) (not e!690577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216348 (= res!807689 (validKeyInArray!0 k!934))))

(declare-fun b!1216349 () Bool)

(declare-fun res!807685 () Bool)

(assert (=> b!1216349 (=> (not res!807685) (not e!690577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78551 (_ BitVec 32)) Bool)

(assert (=> b!1216349 (= res!807685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216350 () Bool)

(declare-fun e!690580 () Bool)

(assert (=> b!1216350 (= e!690580 (not e!690579))))

(declare-fun res!807688 () Bool)

(assert (=> b!1216350 (=> res!807688 e!690579)))

(assert (=> b!1216350 (= res!807688 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216350 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40328 0))(
  ( (Unit!40329) )
))
(declare-fun lt!552867 () Unit!40328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78551 (_ BitVec 64) (_ BitVec 32)) Unit!40328)

(assert (=> b!1216350 (= lt!552867 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!48208 () Bool)

(declare-fun mapRes!48208 () Bool)

(declare-fun tp!91576 () Bool)

(declare-fun e!690581 () Bool)

(assert (=> mapNonEmpty!48208 (= mapRes!48208 (and tp!91576 e!690581))))

(declare-fun mapKey!48208 () (_ BitVec 32))

(declare-fun mapRest!48208 () (Array (_ BitVec 32) ValueCell!14735))

(declare-fun mapValue!48208 () ValueCell!14735)

(assert (=> mapNonEmpty!48208 (= (arr!37911 _values!996) (store mapRest!48208 mapKey!48208 mapValue!48208))))

(declare-fun b!1216351 () Bool)

(declare-fun e!690578 () Bool)

(declare-fun e!690576 () Bool)

(assert (=> b!1216351 (= e!690578 (and e!690576 mapRes!48208))))

(declare-fun condMapEmpty!48208 () Bool)

(declare-fun mapDefault!48208 () ValueCell!14735)

