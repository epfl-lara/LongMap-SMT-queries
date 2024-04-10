; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101218 () Bool)

(assert start!101218)

(declare-fun b_free!26141 () Bool)

(declare-fun b_next!26141 () Bool)

(assert (=> start!101218 (= b_free!26141 (not b_next!26141))))

(declare-fun tp!91444 () Bool)

(declare-fun b_and!43399 () Bool)

(assert (=> start!101218 (= tp!91444 b_and!43399)))

(declare-fun b!1215376 () Bool)

(declare-fun res!806965 () Bool)

(declare-fun e!690114 () Bool)

(assert (=> b!1215376 (=> (not res!806965) (not e!690114))))

(declare-datatypes ((array!78465 0))(
  ( (array!78466 (arr!37867 (Array (_ BitVec 32) (_ BitVec 64))) (size!38403 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78465)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78465 (_ BitVec 32)) Bool)

(assert (=> b!1215376 (= res!806965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215377 () Bool)

(declare-fun res!806962 () Bool)

(assert (=> b!1215377 (=> (not res!806962) (not e!690114))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215377 (= res!806962 (validKeyInArray!0 k!934))))

(declare-fun b!1215378 () Bool)

(declare-fun e!690115 () Bool)

(assert (=> b!1215378 (= e!690115 true)))

(declare-datatypes ((V!46253 0))(
  ( (V!46254 (val!15479 Int)) )
))
(declare-fun zeroValue!944 () V!46253)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19894 0))(
  ( (tuple2!19895 (_1!9958 (_ BitVec 64)) (_2!9958 V!46253)) )
))
(declare-datatypes ((List!26695 0))(
  ( (Nil!26692) (Cons!26691 (h!27900 tuple2!19894) (t!39816 List!26695)) )
))
(declare-datatypes ((ListLongMap!17863 0))(
  ( (ListLongMap!17864 (toList!8947 List!26695)) )
))
(declare-fun lt!552597 () ListLongMap!17863)

(declare-fun minValue!944 () V!46253)

(declare-datatypes ((ValueCell!14713 0))(
  ( (ValueCellFull!14713 (v!18132 V!46253)) (EmptyCell!14713) )
))
(declare-datatypes ((array!78467 0))(
  ( (array!78468 (arr!37868 (Array (_ BitVec 32) ValueCell!14713)) (size!38404 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78467)

(declare-fun lt!552600 () array!78465)

(declare-fun getCurrentListMapNoExtraKeys!5374 (array!78465 array!78467 (_ BitVec 32) (_ BitVec 32) V!46253 V!46253 (_ BitVec 32) Int) ListLongMap!17863)

(declare-fun dynLambda!3263 (Int (_ BitVec 64)) V!46253)

(assert (=> b!1215378 (= lt!552597 (getCurrentListMapNoExtraKeys!5374 lt!552600 (array!78468 (store (arr!37868 _values!996) i!673 (ValueCellFull!14713 (dynLambda!3263 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38404 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552599 () ListLongMap!17863)

(assert (=> b!1215378 (= lt!552599 (getCurrentListMapNoExtraKeys!5374 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215379 () Bool)

(declare-fun res!806958 () Bool)

(assert (=> b!1215379 (=> (not res!806958) (not e!690114))))

(assert (=> b!1215379 (= res!806958 (= (select (arr!37867 _keys!1208) i!673) k!934))))

(declare-fun b!1215380 () Bool)

(declare-fun e!690112 () Bool)

(declare-fun tp_is_empty!30845 () Bool)

(assert (=> b!1215380 (= e!690112 tp_is_empty!30845)))

(declare-fun b!1215381 () Bool)

(declare-fun e!690116 () Bool)

(declare-fun e!690118 () Bool)

(declare-fun mapRes!48142 () Bool)

(assert (=> b!1215381 (= e!690116 (and e!690118 mapRes!48142))))

(declare-fun condMapEmpty!48142 () Bool)

(declare-fun mapDefault!48142 () ValueCell!14713)

