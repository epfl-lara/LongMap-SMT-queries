; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101580 () Bool)

(assert start!101580)

(declare-fun b_free!26335 () Bool)

(declare-fun b_next!26335 () Bool)

(assert (=> start!101580 (= b_free!26335 (not b_next!26335))))

(declare-fun tp!92044 () Bool)

(declare-fun b_and!43895 () Bool)

(assert (=> start!101580 (= tp!92044 b_and!43895)))

(declare-fun b!1221405 () Bool)

(declare-fun e!693620 () Bool)

(declare-fun e!693624 () Bool)

(assert (=> b!1221405 (= e!693620 e!693624)))

(declare-fun res!811417 () Bool)

(assert (=> b!1221405 (=> res!811417 e!693624)))

(declare-datatypes ((array!78859 0))(
  ( (array!78860 (arr!38058 (Array (_ BitVec 32) (_ BitVec 64))) (size!38594 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78859)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221405 (= res!811417 (not (= (select (arr!38058 _keys!1208) from!1455) k!934)))))

(declare-fun b!1221406 () Bool)

(declare-fun e!693621 () Bool)

(declare-fun e!693614 () Bool)

(assert (=> b!1221406 (= e!693621 e!693614)))

(declare-fun res!811423 () Bool)

(assert (=> b!1221406 (=> (not res!811423) (not e!693614))))

(declare-datatypes ((List!26856 0))(
  ( (Nil!26853) (Cons!26852 (h!28061 (_ BitVec 64)) (t!40171 List!26856)) )
))
(declare-fun contains!7023 (List!26856 (_ BitVec 64)) Bool)

(assert (=> b!1221406 (= res!811423 (not (contains!7023 Nil!26853 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221407 () Bool)

(declare-fun res!811427 () Bool)

(declare-fun e!693619 () Bool)

(assert (=> b!1221407 (=> (not res!811427) (not e!693619))))

(declare-fun arrayNoDuplicates!0 (array!78859 (_ BitVec 32) List!26856) Bool)

(assert (=> b!1221407 (= res!811427 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26853))))

(declare-fun b!1221408 () Bool)

(declare-fun e!693617 () Bool)

(assert (=> b!1221408 (= e!693617 e!693621)))

(declare-fun res!811413 () Bool)

(assert (=> b!1221408 (=> res!811413 e!693621)))

(assert (=> b!1221408 (= res!811413 (or (bvsge (size!38594 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38594 _keys!1208)) (bvsge from!1455 (size!38594 _keys!1208))))))

(assert (=> b!1221408 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26853)))

(declare-datatypes ((Unit!40460 0))(
  ( (Unit!40461) )
))
(declare-fun lt!555568 () Unit!40460)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78859 (_ BitVec 32) (_ BitVec 32)) Unit!40460)

(assert (=> b!1221408 (= lt!555568 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!78859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221408 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555574 () Unit!40460)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78859 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40460)

(assert (=> b!1221408 (= lt!555574 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!811416 () Bool)

(assert (=> start!101580 (=> (not res!811416) (not e!693619))))

(assert (=> start!101580 (= res!811416 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38594 _keys!1208))))))

(assert (=> start!101580 e!693619))

(declare-fun tp_is_empty!31039 () Bool)

(assert (=> start!101580 tp_is_empty!31039))

(declare-fun array_inv!28956 (array!78859) Bool)

(assert (=> start!101580 (array_inv!28956 _keys!1208)))

(assert (=> start!101580 true))

(assert (=> start!101580 tp!92044))

(declare-datatypes ((V!46513 0))(
  ( (V!46514 (val!15576 Int)) )
))
(declare-datatypes ((ValueCell!14810 0))(
  ( (ValueCellFull!14810 (v!18235 V!46513)) (EmptyCell!14810) )
))
(declare-datatypes ((array!78861 0))(
  ( (array!78862 (arr!38059 (Array (_ BitVec 32) ValueCell!14810)) (size!38595 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78861)

(declare-fun e!693612 () Bool)

(declare-fun array_inv!28957 (array!78861) Bool)

(assert (=> start!101580 (and (array_inv!28957 _values!996) e!693612)))

(declare-fun b!1221409 () Bool)

(declare-fun res!811421 () Bool)

(assert (=> b!1221409 (=> (not res!811421) (not e!693619))))

(assert (=> b!1221409 (= res!811421 (= (select (arr!38058 _keys!1208) i!673) k!934))))

(declare-fun b!1221410 () Bool)

(declare-fun e!693615 () Bool)

(assert (=> b!1221410 (= e!693615 tp_is_empty!31039)))

(declare-fun b!1221411 () Bool)

(declare-fun e!693616 () Bool)

(declare-fun e!693613 () Bool)

(assert (=> b!1221411 (= e!693616 e!693613)))

(declare-fun res!811419 () Bool)

(assert (=> b!1221411 (=> res!811419 e!693613)))

(assert (=> b!1221411 (= res!811419 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46513)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555570 () array!78859)

(declare-datatypes ((tuple2!20056 0))(
  ( (tuple2!20057 (_1!10039 (_ BitVec 64)) (_2!10039 V!46513)) )
))
(declare-datatypes ((List!26857 0))(
  ( (Nil!26854) (Cons!26853 (h!28062 tuple2!20056) (t!40172 List!26857)) )
))
(declare-datatypes ((ListLongMap!18025 0))(
  ( (ListLongMap!18026 (toList!9028 List!26857)) )
))
(declare-fun lt!555572 () ListLongMap!18025)

(declare-fun minValue!944 () V!46513)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!555569 () array!78861)

(declare-fun getCurrentListMapNoExtraKeys!5450 (array!78859 array!78861 (_ BitVec 32) (_ BitVec 32) V!46513 V!46513 (_ BitVec 32) Int) ListLongMap!18025)

(assert (=> b!1221411 (= lt!555572 (getCurrentListMapNoExtraKeys!5450 lt!555570 lt!555569 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555576 () V!46513)

(assert (=> b!1221411 (= lt!555569 (array!78862 (store (arr!38059 _values!996) i!673 (ValueCellFull!14810 lt!555576)) (size!38595 _values!996)))))

(declare-fun dynLambda!3330 (Int (_ BitVec 64)) V!46513)

(assert (=> b!1221411 (= lt!555576 (dynLambda!3330 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555566 () ListLongMap!18025)

(assert (=> b!1221411 (= lt!555566 (getCurrentListMapNoExtraKeys!5450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221412 () Bool)

(declare-fun res!811412 () Bool)

(assert (=> b!1221412 (=> (not res!811412) (not e!693619))))

(assert (=> b!1221412 (= res!811412 (and (= (size!38595 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38594 _keys!1208) (size!38595 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221413 () Bool)

(declare-fun res!811424 () Bool)

(assert (=> b!1221413 (=> (not res!811424) (not e!693619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78859 (_ BitVec 32)) Bool)

(assert (=> b!1221413 (= res!811424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221414 () Bool)

(declare-fun e!693618 () Bool)

(assert (=> b!1221414 (= e!693619 e!693618)))

(declare-fun res!811420 () Bool)

(assert (=> b!1221414 (=> (not res!811420) (not e!693618))))

(assert (=> b!1221414 (= res!811420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555570 mask!1564))))

(assert (=> b!1221414 (= lt!555570 (array!78860 (store (arr!38058 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38594 _keys!1208)))))

(declare-fun b!1221415 () Bool)

(declare-fun res!811415 () Bool)

(assert (=> b!1221415 (=> (not res!811415) (not e!693618))))

(assert (=> b!1221415 (= res!811415 (arrayNoDuplicates!0 lt!555570 #b00000000000000000000000000000000 Nil!26853))))

(declare-fun b!1221416 () Bool)

(assert (=> b!1221416 (= e!693624 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1221417 () Bool)

(declare-fun mapRes!48451 () Bool)

(assert (=> b!1221417 (= e!693612 (and e!693615 mapRes!48451))))

(declare-fun condMapEmpty!48451 () Bool)

(declare-fun mapDefault!48451 () ValueCell!14810)

