; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100774 () Bool)

(assert start!100774)

(declare-fun b_free!25945 () Bool)

(declare-fun b_next!25945 () Bool)

(assert (=> start!100774 (= b_free!25945 (not b_next!25945))))

(declare-fun tp!90837 () Bool)

(declare-fun b_and!42873 () Bool)

(assert (=> start!100774 (= tp!90837 b_and!42873)))

(declare-fun b!1206209 () Bool)

(declare-fun res!802198 () Bool)

(declare-fun e!684986 () Bool)

(assert (=> b!1206209 (=> (not res!802198) (not e!684986))))

(declare-datatypes ((array!78079 0))(
  ( (array!78080 (arr!37680 (Array (_ BitVec 32) (_ BitVec 64))) (size!38216 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78079)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78079 (_ BitVec 32)) Bool)

(assert (=> b!1206209 (= res!802198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206210 () Bool)

(declare-fun res!802206 () Bool)

(assert (=> b!1206210 (=> (not res!802206) (not e!684986))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206210 (= res!802206 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!45993 0))(
  ( (V!45994 (val!15381 Int)) )
))
(declare-fun zeroValue!944 () V!45993)

(declare-fun bm!58665 () Bool)

(declare-datatypes ((tuple2!19734 0))(
  ( (tuple2!19735 (_1!9878 (_ BitVec 64)) (_2!9878 V!45993)) )
))
(declare-datatypes ((List!26538 0))(
  ( (Nil!26535) (Cons!26534 (h!27743 tuple2!19734) (t!39463 List!26538)) )
))
(declare-datatypes ((ListLongMap!17703 0))(
  ( (ListLongMap!17704 (toList!8867 List!26538)) )
))
(declare-fun call!58668 () ListLongMap!17703)

(declare-fun c!118419 () Bool)

(declare-fun c!118416 () Bool)

(declare-fun minValue!944 () V!45993)

(declare-fun lt!547149 () ListLongMap!17703)

(declare-fun +!3988 (ListLongMap!17703 tuple2!19734) ListLongMap!17703)

(assert (=> bm!58665 (= call!58668 (+!3988 lt!547149 (ite (or c!118416 c!118419) (tuple2!19735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1206211 () Bool)

(declare-fun e!684990 () Bool)

(assert (=> b!1206211 (= e!684986 e!684990)))

(declare-fun res!802197 () Bool)

(assert (=> b!1206211 (=> (not res!802197) (not e!684990))))

(declare-fun lt!547147 () array!78079)

(assert (=> b!1206211 (= res!802197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547147 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206211 (= lt!547147 (array!78080 (store (arr!37680 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38216 _keys!1208)))))

(declare-fun mapIsEmpty!47829 () Bool)

(declare-fun mapRes!47829 () Bool)

(assert (=> mapIsEmpty!47829 mapRes!47829))

(declare-fun bm!58666 () Bool)

(declare-datatypes ((Unit!39988 0))(
  ( (Unit!39989) )
))
(declare-fun call!58670 () Unit!39988)

(declare-fun call!58669 () Unit!39988)

(assert (=> bm!58666 (= call!58670 call!58669)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!58667 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!58674 () ListLongMap!17703)

(declare-datatypes ((ValueCell!14615 0))(
  ( (ValueCellFull!14615 (v!18025 V!45993)) (EmptyCell!14615) )
))
(declare-datatypes ((array!78081 0))(
  ( (array!78082 (arr!37681 (Array (_ BitVec 32) ValueCell!14615)) (size!38217 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78081)

(declare-fun getCurrentListMapNoExtraKeys!5302 (array!78079 array!78081 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 32) Int) ListLongMap!17703)

(assert (=> bm!58667 (= call!58674 (getCurrentListMapNoExtraKeys!5302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206212 () Bool)

(declare-fun e!684992 () Unit!39988)

(declare-fun e!684984 () Unit!39988)

(assert (=> b!1206212 (= e!684992 e!684984)))

(declare-fun lt!547152 () Bool)

(assert (=> b!1206212 (= c!118419 (and (not lt!547152) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206213 () Bool)

(declare-fun lt!547161 () Unit!39988)

(assert (=> b!1206213 (= e!684992 lt!547161)))

(declare-fun lt!547159 () Unit!39988)

(declare-fun addStillContains!1017 (ListLongMap!17703 (_ BitVec 64) V!45993 (_ BitVec 64)) Unit!39988)

(assert (=> b!1206213 (= lt!547159 (addStillContains!1017 lt!547149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!547151 () ListLongMap!17703)

(assert (=> b!1206213 (= lt!547151 call!58668)))

(declare-fun call!58672 () Bool)

(assert (=> b!1206213 call!58672))

(assert (=> b!1206213 (= lt!547161 call!58669)))

(declare-fun contains!6925 (ListLongMap!17703 (_ BitVec 64)) Bool)

(assert (=> b!1206213 (contains!6925 (+!3988 lt!547151 (tuple2!19735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1206214 () Bool)

(declare-fun e!684991 () Bool)

(declare-fun e!684988 () Bool)

(assert (=> b!1206214 (= e!684991 e!684988)))

(declare-fun res!802195 () Bool)

(assert (=> b!1206214 (=> res!802195 e!684988)))

(assert (=> b!1206214 (= res!802195 (not (= (select (arr!37680 _keys!1208) from!1455) k!934)))))

(declare-fun e!684998 () Bool)

(assert (=> b!1206214 e!684998))

(declare-fun c!118415 () Bool)

(assert (=> b!1206214 (= c!118415 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547156 () Unit!39988)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1033 (array!78079 array!78081 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39988)

(assert (=> b!1206214 (= lt!547156 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1033 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!684994 () Bool)

(declare-fun b!1206215 () Bool)

(declare-fun arrayContainsKey!0 (array!78079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206215 (= e!684994 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206216 () Bool)

(declare-fun e!684985 () Bool)

(assert (=> b!1206216 (= e!684988 e!684985)))

(declare-fun res!802205 () Bool)

(assert (=> b!1206216 (=> res!802205 e!684985)))

(assert (=> b!1206216 (= res!802205 (not (contains!6925 lt!547149 k!934)))))

(assert (=> b!1206216 (= lt!547149 (getCurrentListMapNoExtraKeys!5302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206217 () Bool)

(declare-fun c!118418 () Bool)

(assert (=> b!1206217 (= c!118418 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547152))))

(declare-fun e!684987 () Unit!39988)

(assert (=> b!1206217 (= e!684984 e!684987)))

(declare-fun call!58671 () ListLongMap!17703)

(declare-fun bm!58669 () Bool)

(assert (=> bm!58669 (= call!58672 (contains!6925 (ite c!118416 lt!547151 call!58671) k!934))))

(declare-fun b!1206218 () Bool)

(declare-fun lt!547155 () Unit!39988)

(assert (=> b!1206218 (= e!684987 lt!547155)))

(assert (=> b!1206218 (= lt!547155 call!58670)))

(declare-fun call!58675 () Bool)

(assert (=> b!1206218 call!58675))

(declare-fun b!1206219 () Bool)

(declare-fun e!684993 () Bool)

(declare-fun e!684997 () Bool)

(assert (=> b!1206219 (= e!684993 (and e!684997 mapRes!47829))))

(declare-fun condMapEmpty!47829 () Bool)

(declare-fun mapDefault!47829 () ValueCell!14615)

