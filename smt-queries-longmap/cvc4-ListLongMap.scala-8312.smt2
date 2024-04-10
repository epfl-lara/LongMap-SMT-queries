; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101224 () Bool)

(assert start!101224)

(declare-fun b_free!26147 () Bool)

(declare-fun b_next!26147 () Bool)

(assert (=> start!101224 (= b_free!26147 (not b_next!26147))))

(declare-fun tp!91463 () Bool)

(declare-fun b_and!43411 () Bool)

(assert (=> start!101224 (= tp!91463 b_and!43411)))

(declare-fun b!1215508 () Bool)

(declare-fun res!807064 () Bool)

(declare-fun e!690177 () Bool)

(assert (=> b!1215508 (=> (not res!807064) (not e!690177))))

(declare-datatypes ((array!78477 0))(
  ( (array!78478 (arr!37873 (Array (_ BitVec 32) (_ BitVec 64))) (size!38409 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78477)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78477 (_ BitVec 32)) Bool)

(assert (=> b!1215508 (= res!807064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215509 () Bool)

(declare-fun res!807055 () Bool)

(assert (=> b!1215509 (=> (not res!807055) (not e!690177))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215509 (= res!807055 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38409 _keys!1208))))))

(declare-fun b!1215510 () Bool)

(declare-fun res!807058 () Bool)

(declare-fun e!690181 () Bool)

(assert (=> b!1215510 (=> (not res!807058) (not e!690181))))

(declare-fun lt!552636 () array!78477)

(declare-datatypes ((List!26700 0))(
  ( (Nil!26697) (Cons!26696 (h!27905 (_ BitVec 64)) (t!39827 List!26700)) )
))
(declare-fun arrayNoDuplicates!0 (array!78477 (_ BitVec 32) List!26700) Bool)

(assert (=> b!1215510 (= res!807058 (arrayNoDuplicates!0 lt!552636 #b00000000000000000000000000000000 Nil!26697))))

(declare-fun b!1215511 () Bool)

(declare-fun res!807056 () Bool)

(assert (=> b!1215511 (=> (not res!807056) (not e!690177))))

(assert (=> b!1215511 (= res!807056 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26697))))

(declare-fun b!1215512 () Bool)

(declare-fun res!807061 () Bool)

(assert (=> b!1215512 (=> (not res!807061) (not e!690177))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215512 (= res!807061 (validKeyInArray!0 k!934))))

(declare-fun res!807059 () Bool)

(assert (=> start!101224 (=> (not res!807059) (not e!690177))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101224 (= res!807059 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38409 _keys!1208))))))

(assert (=> start!101224 e!690177))

(declare-fun tp_is_empty!30851 () Bool)

(assert (=> start!101224 tp_is_empty!30851))

(declare-fun array_inv!28838 (array!78477) Bool)

(assert (=> start!101224 (array_inv!28838 _keys!1208)))

(assert (=> start!101224 true))

(assert (=> start!101224 tp!91463))

(declare-datatypes ((V!46261 0))(
  ( (V!46262 (val!15482 Int)) )
))
(declare-datatypes ((ValueCell!14716 0))(
  ( (ValueCellFull!14716 (v!18135 V!46261)) (EmptyCell!14716) )
))
(declare-datatypes ((array!78479 0))(
  ( (array!78480 (arr!37874 (Array (_ BitVec 32) ValueCell!14716)) (size!38410 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78479)

(declare-fun e!690180 () Bool)

(declare-fun array_inv!28839 (array!78479) Bool)

(assert (=> start!101224 (and (array_inv!28839 _values!996) e!690180)))

(declare-fun b!1215513 () Bool)

(declare-fun e!690176 () Bool)

(assert (=> b!1215513 (= e!690181 (not e!690176))))

(declare-fun res!807063 () Bool)

(assert (=> b!1215513 (=> res!807063 e!690176)))

(assert (=> b!1215513 (= res!807063 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215513 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40302 0))(
  ( (Unit!40303) )
))
(declare-fun lt!552635 () Unit!40302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78477 (_ BitVec 64) (_ BitVec 32)) Unit!40302)

(assert (=> b!1215513 (= lt!552635 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1215514 () Bool)

(declare-fun e!690179 () Bool)

(assert (=> b!1215514 (= e!690179 tp_is_empty!30851)))

(declare-fun b!1215515 () Bool)

(declare-fun e!690178 () Bool)

(assert (=> b!1215515 (= e!690178 tp_is_empty!30851)))

(declare-fun b!1215516 () Bool)

(assert (=> b!1215516 (= e!690176 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun zeroValue!944 () V!46261)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19900 0))(
  ( (tuple2!19901 (_1!9961 (_ BitVec 64)) (_2!9961 V!46261)) )
))
(declare-datatypes ((List!26701 0))(
  ( (Nil!26698) (Cons!26697 (h!27906 tuple2!19900) (t!39828 List!26701)) )
))
(declare-datatypes ((ListLongMap!17869 0))(
  ( (ListLongMap!17870 (toList!8950 List!26701)) )
))
(declare-fun lt!552634 () ListLongMap!17869)

(declare-fun minValue!944 () V!46261)

(declare-fun getCurrentListMapNoExtraKeys!5377 (array!78477 array!78479 (_ BitVec 32) (_ BitVec 32) V!46261 V!46261 (_ BitVec 32) Int) ListLongMap!17869)

(declare-fun dynLambda!3266 (Int (_ BitVec 64)) V!46261)

(assert (=> b!1215516 (= lt!552634 (getCurrentListMapNoExtraKeys!5377 lt!552636 (array!78480 (store (arr!37874 _values!996) i!673 (ValueCellFull!14716 (dynLambda!3266 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38410 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552633 () ListLongMap!17869)

(assert (=> b!1215516 (= lt!552633 (getCurrentListMapNoExtraKeys!5377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215517 () Bool)

(assert (=> b!1215517 (= e!690177 e!690181)))

(declare-fun res!807062 () Bool)

(assert (=> b!1215517 (=> (not res!807062) (not e!690181))))

(assert (=> b!1215517 (= res!807062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552636 mask!1564))))

(assert (=> b!1215517 (= lt!552636 (array!78478 (store (arr!37873 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38409 _keys!1208)))))

(declare-fun b!1215518 () Bool)

(declare-fun res!807060 () Bool)

(assert (=> b!1215518 (=> (not res!807060) (not e!690177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215518 (= res!807060 (validMask!0 mask!1564))))

(declare-fun b!1215519 () Bool)

(declare-fun res!807065 () Bool)

(assert (=> b!1215519 (=> (not res!807065) (not e!690177))))

(assert (=> b!1215519 (= res!807065 (= (select (arr!37873 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!48151 () Bool)

(declare-fun mapRes!48151 () Bool)

(assert (=> mapIsEmpty!48151 mapRes!48151))

(declare-fun mapNonEmpty!48151 () Bool)

(declare-fun tp!91462 () Bool)

(assert (=> mapNonEmpty!48151 (= mapRes!48151 (and tp!91462 e!690179))))

(declare-fun mapValue!48151 () ValueCell!14716)

(declare-fun mapRest!48151 () (Array (_ BitVec 32) ValueCell!14716))

(declare-fun mapKey!48151 () (_ BitVec 32))

(assert (=> mapNonEmpty!48151 (= (arr!37874 _values!996) (store mapRest!48151 mapKey!48151 mapValue!48151))))

(declare-fun b!1215520 () Bool)

(declare-fun res!807057 () Bool)

(assert (=> b!1215520 (=> (not res!807057) (not e!690177))))

(assert (=> b!1215520 (= res!807057 (and (= (size!38410 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38409 _keys!1208) (size!38410 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215521 () Bool)

(assert (=> b!1215521 (= e!690180 (and e!690178 mapRes!48151))))

(declare-fun condMapEmpty!48151 () Bool)

(declare-fun mapDefault!48151 () ValueCell!14716)

