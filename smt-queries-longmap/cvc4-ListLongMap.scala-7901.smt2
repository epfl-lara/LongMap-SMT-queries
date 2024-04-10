; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98154 () Bool)

(assert start!98154)

(declare-fun b_free!23855 () Bool)

(declare-fun b_next!23855 () Bool)

(assert (=> start!98154 (= b_free!23855 (not b_next!23855))))

(declare-fun tp!84269 () Bool)

(declare-fun b_and!38493 () Bool)

(assert (=> start!98154 (= tp!84269 b_and!38493)))

(declare-fun mapIsEmpty!44395 () Bool)

(declare-fun mapRes!44395 () Bool)

(assert (=> mapIsEmpty!44395 mapRes!44395))

(declare-fun b!1128539 () Bool)

(declare-fun res!754193 () Bool)

(declare-fun e!642288 () Bool)

(assert (=> b!1128539 (=> (not res!754193) (not e!642288))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73629 0))(
  ( (array!73630 (arr!35467 (Array (_ BitVec 32) (_ BitVec 64))) (size!36003 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73629)

(assert (=> b!1128539 (= res!754193 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36003 _keys!1208))))))

(declare-fun b!1128540 () Bool)

(declare-fun res!754192 () Bool)

(assert (=> b!1128540 (=> (not res!754192) (not e!642288))))

(declare-datatypes ((List!24702 0))(
  ( (Nil!24699) (Cons!24698 (h!25907 (_ BitVec 64)) (t!35549 List!24702)) )
))
(declare-fun arrayNoDuplicates!0 (array!73629 (_ BitVec 32) List!24702) Bool)

(assert (=> b!1128540 (= res!754192 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24699))))

(declare-fun res!754190 () Bool)

(assert (=> start!98154 (=> (not res!754190) (not e!642288))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98154 (= res!754190 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36003 _keys!1208))))))

(assert (=> start!98154 e!642288))

(declare-fun tp_is_empty!28385 () Bool)

(assert (=> start!98154 tp_is_empty!28385))

(declare-fun array_inv!27212 (array!73629) Bool)

(assert (=> start!98154 (array_inv!27212 _keys!1208)))

(assert (=> start!98154 true))

(assert (=> start!98154 tp!84269))

(declare-datatypes ((V!42973 0))(
  ( (V!42974 (val!14249 Int)) )
))
(declare-datatypes ((ValueCell!13483 0))(
  ( (ValueCellFull!13483 (v!16882 V!42973)) (EmptyCell!13483) )
))
(declare-datatypes ((array!73631 0))(
  ( (array!73632 (arr!35468 (Array (_ BitVec 32) ValueCell!13483)) (size!36004 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73631)

(declare-fun e!642291 () Bool)

(declare-fun array_inv!27213 (array!73631) Bool)

(assert (=> start!98154 (and (array_inv!27213 _values!996) e!642291)))

(declare-fun b!1128541 () Bool)

(declare-fun e!642293 () Bool)

(declare-fun e!642295 () Bool)

(assert (=> b!1128541 (= e!642293 e!642295)))

(declare-fun res!754185 () Bool)

(assert (=> b!1128541 (=> res!754185 e!642295)))

(assert (=> b!1128541 (= res!754185 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42973)

(declare-fun lt!500999 () array!73629)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!501004 () array!73631)

(declare-fun minValue!944 () V!42973)

(declare-datatypes ((tuple2!17934 0))(
  ( (tuple2!17935 (_1!8978 (_ BitVec 64)) (_2!8978 V!42973)) )
))
(declare-datatypes ((List!24703 0))(
  ( (Nil!24700) (Cons!24699 (h!25908 tuple2!17934) (t!35550 List!24703)) )
))
(declare-datatypes ((ListLongMap!15903 0))(
  ( (ListLongMap!15904 (toList!7967 List!24703)) )
))
(declare-fun lt!501000 () ListLongMap!15903)

(declare-fun getCurrentListMapNoExtraKeys!4454 (array!73629 array!73631 (_ BitVec 32) (_ BitVec 32) V!42973 V!42973 (_ BitVec 32) Int) ListLongMap!15903)

(assert (=> b!1128541 (= lt!501000 (getCurrentListMapNoExtraKeys!4454 lt!500999 lt!501004 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2535 (Int (_ BitVec 64)) V!42973)

(assert (=> b!1128541 (= lt!501004 (array!73632 (store (arr!35468 _values!996) i!673 (ValueCellFull!13483 (dynLambda!2535 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36004 _values!996)))))

(declare-fun lt!501003 () ListLongMap!15903)

(assert (=> b!1128541 (= lt!501003 (getCurrentListMapNoExtraKeys!4454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128542 () Bool)

(declare-fun e!642289 () Bool)

(assert (=> b!1128542 (= e!642289 (not e!642293))))

(declare-fun res!754195 () Bool)

(assert (=> b!1128542 (=> res!754195 e!642293)))

(assert (=> b!1128542 (= res!754195 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128542 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36972 0))(
  ( (Unit!36973) )
))
(declare-fun lt!501001 () Unit!36972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73629 (_ BitVec 64) (_ BitVec 32)) Unit!36972)

(assert (=> b!1128542 (= lt!501001 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1128543 () Bool)

(declare-fun res!754184 () Bool)

(assert (=> b!1128543 (=> (not res!754184) (not e!642288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73629 (_ BitVec 32)) Bool)

(assert (=> b!1128543 (= res!754184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!47848 () ListLongMap!15903)

(declare-fun bm!47844 () Bool)

(assert (=> bm!47844 (= call!47848 (getCurrentListMapNoExtraKeys!4454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128544 () Bool)

(declare-fun res!754187 () Bool)

(assert (=> b!1128544 (=> (not res!754187) (not e!642288))))

(assert (=> b!1128544 (= res!754187 (and (= (size!36004 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36003 _keys!1208) (size!36004 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128545 () Bool)

(declare-fun res!754189 () Bool)

(assert (=> b!1128545 (=> (not res!754189) (not e!642289))))

(assert (=> b!1128545 (= res!754189 (arrayNoDuplicates!0 lt!500999 #b00000000000000000000000000000000 Nil!24699))))

(declare-fun b!1128546 () Bool)

(declare-fun e!642290 () Bool)

(assert (=> b!1128546 (= e!642291 (and e!642290 mapRes!44395))))

(declare-fun condMapEmpty!44395 () Bool)

(declare-fun mapDefault!44395 () ValueCell!13483)

