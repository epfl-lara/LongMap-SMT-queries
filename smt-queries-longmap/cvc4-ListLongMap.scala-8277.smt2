; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100766 () Bool)

(assert start!100766)

(declare-fun b_free!25937 () Bool)

(declare-fun b_next!25937 () Bool)

(assert (=> start!100766 (= b_free!25937 (not b_next!25937))))

(declare-fun tp!90814 () Bool)

(declare-fun b_and!42857 () Bool)

(assert (=> start!100766 (= tp!90814 b_and!42857)))

(declare-datatypes ((V!45981 0))(
  ( (V!45982 (val!15377 Int)) )
))
(declare-fun zeroValue!944 () V!45981)

(declare-datatypes ((array!78063 0))(
  ( (array!78064 (arr!37672 (Array (_ BitVec 32) (_ BitVec 64))) (size!38208 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78063)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19726 0))(
  ( (tuple2!19727 (_1!9874 (_ BitVec 64)) (_2!9874 V!45981)) )
))
(declare-datatypes ((List!26531 0))(
  ( (Nil!26528) (Cons!26527 (h!27736 tuple2!19726) (t!39448 List!26531)) )
))
(declare-datatypes ((ListLongMap!17695 0))(
  ( (ListLongMap!17696 (toList!8863 List!26531)) )
))
(declare-fun call!58574 () ListLongMap!17695)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14611 0))(
  ( (ValueCellFull!14611 (v!18021 V!45981)) (EmptyCell!14611) )
))
(declare-datatypes ((array!78065 0))(
  ( (array!78066 (arr!37673 (Array (_ BitVec 32) ValueCell!14611)) (size!38209 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78065)

(declare-fun minValue!944 () V!45981)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!58569 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5298 (array!78063 array!78065 (_ BitVec 32) (_ BitVec 32) V!45981 V!45981 (_ BitVec 32) Int) ListLongMap!17695)

(assert (=> bm!58569 (= call!58574 (getCurrentListMapNoExtraKeys!5298 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205865 () Bool)

(declare-fun e!684794 () Bool)

(declare-fun e!684797 () Bool)

(assert (=> b!1205865 (= e!684794 e!684797)))

(declare-fun res!802024 () Bool)

(assert (=> b!1205865 (=> (not res!802024) (not e!684797))))

(declare-fun lt!546979 () array!78063)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78063 (_ BitVec 32)) Bool)

(assert (=> b!1205865 (= res!802024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546979 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205865 (= lt!546979 (array!78064 (store (arr!37672 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38208 _keys!1208)))))

(declare-fun b!1205866 () Bool)

(declare-fun res!802025 () Bool)

(assert (=> b!1205866 (=> (not res!802025) (not e!684794))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205866 (= res!802025 (validKeyInArray!0 k!934))))

(declare-fun b!1205867 () Bool)

(declare-fun e!684806 () Bool)

(assert (=> b!1205867 (= e!684806 true)))

(declare-fun e!684803 () Bool)

(assert (=> b!1205867 e!684803))

(declare-fun res!802018 () Bool)

(assert (=> b!1205867 (=> (not res!802018) (not e!684803))))

(declare-fun e!684791 () Bool)

(assert (=> b!1205867 (= res!802018 e!684791)))

(declare-fun c!118359 () Bool)

(assert (=> b!1205867 (= c!118359 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!39978 0))(
  ( (Unit!39979) )
))
(declare-fun lt!546970 () Unit!39978)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!569 (array!78063 array!78065 (_ BitVec 32) (_ BitVec 32) V!45981 V!45981 (_ BitVec 64) (_ BitVec 32) Int) Unit!39978)

(assert (=> b!1205867 (= lt!546970 (lemmaListMapContainsThenArrayContainsFrom!569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546976 () Unit!39978)

(declare-fun e!684799 () Unit!39978)

(assert (=> b!1205867 (= lt!546976 e!684799)))

(declare-fun c!118355 () Bool)

(declare-fun lt!546973 () Bool)

(assert (=> b!1205867 (= c!118355 (and (not lt!546973) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205867 (= lt!546973 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205868 () Bool)

(declare-fun e!684793 () Bool)

(declare-fun e!684801 () Bool)

(declare-fun mapRes!47817 () Bool)

(assert (=> b!1205868 (= e!684793 (and e!684801 mapRes!47817))))

(declare-fun condMapEmpty!47817 () Bool)

(declare-fun mapDefault!47817 () ValueCell!14611)

