; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101260 () Bool)

(assert start!101260)

(declare-fun b_free!26183 () Bool)

(declare-fun b_next!26183 () Bool)

(assert (=> start!101260 (= b_free!26183 (not b_next!26183))))

(declare-fun tp!91570 () Bool)

(declare-fun b_and!43483 () Bool)

(assert (=> start!101260 (= tp!91570 b_and!43483)))

(declare-fun b!1216300 () Bool)

(declare-fun res!807655 () Bool)

(declare-fun e!690556 () Bool)

(assert (=> b!1216300 (=> (not res!807655) (not e!690556))))

(declare-datatypes ((array!78547 0))(
  ( (array!78548 (arr!37908 (Array (_ BitVec 32) (_ BitVec 64))) (size!38444 (_ BitVec 32))) )
))
(declare-fun lt!552850 () array!78547)

(declare-datatypes ((List!26724 0))(
  ( (Nil!26721) (Cons!26720 (h!27929 (_ BitVec 64)) (t!39887 List!26724)) )
))
(declare-fun arrayNoDuplicates!0 (array!78547 (_ BitVec 32) List!26724) Bool)

(assert (=> b!1216300 (= res!807655 (arrayNoDuplicates!0 lt!552850 #b00000000000000000000000000000000 Nil!26721))))

(declare-fun res!807659 () Bool)

(declare-fun e!690558 () Bool)

(assert (=> start!101260 (=> (not res!807659) (not e!690558))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!78547)

(assert (=> start!101260 (= res!807659 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38444 _keys!1208))))))

(assert (=> start!101260 e!690558))

(declare-fun tp_is_empty!30887 () Bool)

(assert (=> start!101260 tp_is_empty!30887))

(declare-fun array_inv!28862 (array!78547) Bool)

(assert (=> start!101260 (array_inv!28862 _keys!1208)))

(assert (=> start!101260 true))

(assert (=> start!101260 tp!91570))

(declare-datatypes ((V!46309 0))(
  ( (V!46310 (val!15500 Int)) )
))
(declare-datatypes ((ValueCell!14734 0))(
  ( (ValueCellFull!14734 (v!18153 V!46309)) (EmptyCell!14734) )
))
(declare-datatypes ((array!78549 0))(
  ( (array!78550 (arr!37909 (Array (_ BitVec 32) ValueCell!14734)) (size!38445 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78549)

(declare-fun e!690555 () Bool)

(declare-fun array_inv!28863 (array!78549) Bool)

(assert (=> start!101260 (and (array_inv!28863 _values!996) e!690555)))

(declare-fun b!1216301 () Bool)

(declare-fun res!807650 () Bool)

(assert (=> b!1216301 (=> (not res!807650) (not e!690558))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216301 (= res!807650 (validKeyInArray!0 k!934))))

(declare-fun b!1216302 () Bool)

(declare-fun res!807651 () Bool)

(assert (=> b!1216302 (=> (not res!807651) (not e!690558))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216302 (= res!807651 (validMask!0 mask!1564))))

(declare-fun b!1216303 () Bool)

(declare-fun res!807654 () Bool)

(assert (=> b!1216303 (=> (not res!807654) (not e!690558))))

(assert (=> b!1216303 (= res!807654 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26721))))

(declare-fun b!1216304 () Bool)

(declare-fun res!807658 () Bool)

(assert (=> b!1216304 (=> (not res!807658) (not e!690558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78547 (_ BitVec 32)) Bool)

(assert (=> b!1216304 (= res!807658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216305 () Bool)

(declare-fun e!690557 () Bool)

(assert (=> b!1216305 (= e!690556 (not e!690557))))

(declare-fun res!807652 () Bool)

(assert (=> b!1216305 (=> res!807652 e!690557)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216305 (= res!807652 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216305 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40326 0))(
  ( (Unit!40327) )
))
(declare-fun lt!552852 () Unit!40326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78547 (_ BitVec 64) (_ BitVec 32)) Unit!40326)

(assert (=> b!1216305 (= lt!552852 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1216306 () Bool)

(declare-fun res!807656 () Bool)

(assert (=> b!1216306 (=> (not res!807656) (not e!690558))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1216306 (= res!807656 (and (= (size!38445 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38444 _keys!1208) (size!38445 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216307 () Bool)

(declare-fun e!690553 () Bool)

(assert (=> b!1216307 (= e!690553 tp_is_empty!30887)))

(declare-fun b!1216308 () Bool)

(assert (=> b!1216308 (= e!690557 (or (= from!1455 i!673) (bvsge from!1455 i!673) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!38444 _keys!1208)) (bvslt (bvsub (size!38444 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!38444 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!46309)

(declare-datatypes ((tuple2!19918 0))(
  ( (tuple2!19919 (_1!9970 (_ BitVec 64)) (_2!9970 V!46309)) )
))
(declare-datatypes ((List!26725 0))(
  ( (Nil!26722) (Cons!26721 (h!27930 tuple2!19918) (t!39888 List!26725)) )
))
(declare-datatypes ((ListLongMap!17887 0))(
  ( (ListLongMap!17888 (toList!8959 List!26725)) )
))
(declare-fun lt!552851 () ListLongMap!17887)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46309)

(declare-fun getCurrentListMapNoExtraKeys!5386 (array!78547 array!78549 (_ BitVec 32) (_ BitVec 32) V!46309 V!46309 (_ BitVec 32) Int) ListLongMap!17887)

(declare-fun dynLambda!3275 (Int (_ BitVec 64)) V!46309)

(assert (=> b!1216308 (= lt!552851 (getCurrentListMapNoExtraKeys!5386 lt!552850 (array!78550 (store (arr!37909 _values!996) i!673 (ValueCellFull!14734 (dynLambda!3275 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38445 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552849 () ListLongMap!17887)

(assert (=> b!1216308 (= lt!552849 (getCurrentListMapNoExtraKeys!5386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216309 () Bool)

(declare-fun e!690554 () Bool)

(declare-fun mapRes!48205 () Bool)

(assert (=> b!1216309 (= e!690555 (and e!690554 mapRes!48205))))

(declare-fun condMapEmpty!48205 () Bool)

(declare-fun mapDefault!48205 () ValueCell!14734)

