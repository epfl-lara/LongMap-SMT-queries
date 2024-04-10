; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99922 () Bool)

(assert start!99922)

(declare-fun b_free!25501 () Bool)

(declare-fun b_next!25501 () Bool)

(assert (=> start!99922 (= b_free!25501 (not b_next!25501))))

(declare-fun tp!89217 () Bool)

(declare-fun b_and!41869 () Bool)

(assert (=> start!99922 (= tp!89217 b_and!41869)))

(declare-fun b!1189447 () Bool)

(declare-fun e!676256 () Bool)

(declare-fun e!676253 () Bool)

(assert (=> b!1189447 (= e!676256 e!676253)))

(declare-fun res!790959 () Bool)

(assert (=> b!1189447 (=> res!790959 e!676253)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189447 (= res!790959 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45169 0))(
  ( (V!45170 (val!15072 Int)) )
))
(declare-fun zeroValue!944 () V!45169)

(declare-datatypes ((ValueCell!14306 0))(
  ( (ValueCellFull!14306 (v!17710 V!45169)) (EmptyCell!14306) )
))
(declare-datatypes ((array!76857 0))(
  ( (array!76858 (arr!37078 (Array (_ BitVec 32) ValueCell!14306)) (size!37614 (_ BitVec 32))) )
))
(declare-fun lt!541070 () array!76857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!76859 0))(
  ( (array!76860 (arr!37079 (Array (_ BitVec 32) (_ BitVec 64))) (size!37615 (_ BitVec 32))) )
))
(declare-fun lt!541069 () array!76859)

(declare-fun minValue!944 () V!45169)

(declare-datatypes ((tuple2!19358 0))(
  ( (tuple2!19359 (_1!9690 (_ BitVec 64)) (_2!9690 V!45169)) )
))
(declare-datatypes ((List!26102 0))(
  ( (Nil!26099) (Cons!26098 (h!27307 tuple2!19358) (t!38595 List!26102)) )
))
(declare-datatypes ((ListLongMap!17327 0))(
  ( (ListLongMap!17328 (toList!8679 List!26102)) )
))
(declare-fun lt!541074 () ListLongMap!17327)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5120 (array!76859 array!76857 (_ BitVec 32) (_ BitVec 32) V!45169 V!45169 (_ BitVec 32) Int) ListLongMap!17327)

(assert (=> b!1189447 (= lt!541074 (getCurrentListMapNoExtraKeys!5120 lt!541069 lt!541070 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76857)

(declare-fun dynLambda!3063 (Int (_ BitVec 64)) V!45169)

(assert (=> b!1189447 (= lt!541070 (array!76858 (store (arr!37078 _values!996) i!673 (ValueCellFull!14306 (dynLambda!3063 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37614 _values!996)))))

(declare-fun _keys!1208 () array!76859)

(declare-fun lt!541072 () ListLongMap!17327)

(assert (=> b!1189447 (= lt!541072 (getCurrentListMapNoExtraKeys!5120 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189448 () Bool)

(declare-fun e!676257 () Bool)

(declare-fun tp_is_empty!30031 () Bool)

(assert (=> b!1189448 (= e!676257 tp_is_empty!30031)))

(declare-fun b!1189449 () Bool)

(declare-fun e!676252 () Bool)

(assert (=> b!1189449 (= e!676252 tp_is_empty!30031)))

(declare-fun b!1189450 () Bool)

(declare-fun res!790961 () Bool)

(declare-fun e!676251 () Bool)

(assert (=> b!1189450 (=> (not res!790961) (not e!676251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189450 (= res!790961 (validMask!0 mask!1564))))

(declare-fun b!1189451 () Bool)

(declare-fun e!676255 () Bool)

(assert (=> b!1189451 (= e!676255 (not e!676256))))

(declare-fun res!790954 () Bool)

(assert (=> b!1189451 (=> res!790954 e!676256)))

(assert (=> b!1189451 (= res!790954 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189451 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39458 0))(
  ( (Unit!39459) )
))
(declare-fun lt!541071 () Unit!39458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76859 (_ BitVec 64) (_ BitVec 32)) Unit!39458)

(assert (=> b!1189451 (= lt!541071 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46874 () Bool)

(declare-fun mapRes!46874 () Bool)

(assert (=> mapIsEmpty!46874 mapRes!46874))

(declare-fun b!1189452 () Bool)

(declare-fun res!790953 () Bool)

(assert (=> b!1189452 (=> (not res!790953) (not e!676251))))

(declare-datatypes ((List!26103 0))(
  ( (Nil!26100) (Cons!26099 (h!27308 (_ BitVec 64)) (t!38596 List!26103)) )
))
(declare-fun arrayNoDuplicates!0 (array!76859 (_ BitVec 32) List!26103) Bool)

(assert (=> b!1189452 (= res!790953 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26100))))

(declare-fun mapNonEmpty!46874 () Bool)

(declare-fun tp!89216 () Bool)

(assert (=> mapNonEmpty!46874 (= mapRes!46874 (and tp!89216 e!676252))))

(declare-fun mapKey!46874 () (_ BitVec 32))

(declare-fun mapRest!46874 () (Array (_ BitVec 32) ValueCell!14306))

(declare-fun mapValue!46874 () ValueCell!14306)

(assert (=> mapNonEmpty!46874 (= (arr!37078 _values!996) (store mapRest!46874 mapKey!46874 mapValue!46874))))

(declare-fun res!790963 () Bool)

(assert (=> start!99922 (=> (not res!790963) (not e!676251))))

(assert (=> start!99922 (= res!790963 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37615 _keys!1208))))))

(assert (=> start!99922 e!676251))

(assert (=> start!99922 tp_is_empty!30031))

(declare-fun array_inv!28282 (array!76859) Bool)

(assert (=> start!99922 (array_inv!28282 _keys!1208)))

(assert (=> start!99922 true))

(assert (=> start!99922 tp!89217))

(declare-fun e!676254 () Bool)

(declare-fun array_inv!28283 (array!76857) Bool)

(assert (=> start!99922 (and (array_inv!28283 _values!996) e!676254)))

(declare-fun b!1189453 () Bool)

(declare-fun res!790952 () Bool)

(assert (=> b!1189453 (=> (not res!790952) (not e!676251))))

(assert (=> b!1189453 (= res!790952 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37615 _keys!1208))))))

(declare-fun b!1189454 () Bool)

(declare-fun res!790956 () Bool)

(assert (=> b!1189454 (=> (not res!790956) (not e!676255))))

(assert (=> b!1189454 (= res!790956 (arrayNoDuplicates!0 lt!541069 #b00000000000000000000000000000000 Nil!26100))))

(declare-fun b!1189455 () Bool)

(assert (=> b!1189455 (= e!676253 true)))

(declare-fun -!1708 (ListLongMap!17327 (_ BitVec 64)) ListLongMap!17327)

(assert (=> b!1189455 (= (getCurrentListMapNoExtraKeys!5120 lt!541069 lt!541070 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1708 (getCurrentListMapNoExtraKeys!5120 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!541073 () Unit!39458)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!917 (array!76859 array!76857 (_ BitVec 32) (_ BitVec 32) V!45169 V!45169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39458)

(assert (=> b!1189455 (= lt!541073 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!917 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189456 () Bool)

(declare-fun res!790955 () Bool)

(assert (=> b!1189456 (=> (not res!790955) (not e!676251))))

(assert (=> b!1189456 (= res!790955 (= (select (arr!37079 _keys!1208) i!673) k!934))))

(declare-fun b!1189457 () Bool)

(declare-fun res!790962 () Bool)

(assert (=> b!1189457 (=> (not res!790962) (not e!676251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76859 (_ BitVec 32)) Bool)

(assert (=> b!1189457 (= res!790962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189458 () Bool)

(assert (=> b!1189458 (= e!676254 (and e!676257 mapRes!46874))))

(declare-fun condMapEmpty!46874 () Bool)

(declare-fun mapDefault!46874 () ValueCell!14306)

