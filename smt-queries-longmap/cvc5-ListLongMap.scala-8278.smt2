; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100768 () Bool)

(assert start!100768)

(declare-fun b_free!25939 () Bool)

(declare-fun b_next!25939 () Bool)

(assert (=> start!100768 (= b_free!25939 (not b_next!25939))))

(declare-fun tp!90819 () Bool)

(declare-fun b_and!42861 () Bool)

(assert (=> start!100768 (= tp!90819 b_and!42861)))

(declare-fun b!1205951 () Bool)

(declare-fun call!58601 () Bool)

(assert (=> b!1205951 call!58601))

(declare-datatypes ((Unit!39980 0))(
  ( (Unit!39981) )
))
(declare-fun lt!547022 () Unit!39980)

(declare-fun call!58600 () Unit!39980)

(assert (=> b!1205951 (= lt!547022 call!58600)))

(declare-fun e!684854 () Unit!39980)

(assert (=> b!1205951 (= e!684854 lt!547022)))

(declare-fun b!1205952 () Bool)

(declare-fun res!802067 () Bool)

(declare-fun e!684853 () Bool)

(assert (=> b!1205952 (=> (not res!802067) (not e!684853))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205952 (= res!802067 (validKeyInArray!0 k!934))))

(declare-fun b!1205954 () Bool)

(declare-fun e!684845 () Unit!39980)

(assert (=> b!1205954 (= e!684845 e!684854)))

(declare-fun c!118370 () Bool)

(declare-fun lt!547019 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1205954 (= c!118370 (and (not lt!547019) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205955 () Bool)

(declare-fun res!802064 () Bool)

(assert (=> b!1205955 (=> (not res!802064) (not e!684853))))

(declare-datatypes ((array!78067 0))(
  ( (array!78068 (arr!37674 (Array (_ BitVec 32) (_ BitVec 64))) (size!38210 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78067)

(declare-datatypes ((List!26532 0))(
  ( (Nil!26529) (Cons!26528 (h!27737 (_ BitVec 64)) (t!39451 List!26532)) )
))
(declare-fun arrayNoDuplicates!0 (array!78067 (_ BitVec 32) List!26532) Bool)

(assert (=> b!1205955 (= res!802064 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26529))))

(declare-fun b!1205956 () Bool)

(declare-fun res!802070 () Bool)

(assert (=> b!1205956 (=> (not res!802070) (not e!684853))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205956 (= res!802070 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38210 _keys!1208))))))

(declare-fun b!1205957 () Bool)

(declare-fun res!802068 () Bool)

(assert (=> b!1205957 (=> (not res!802068) (not e!684853))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205957 (= res!802068 (validMask!0 mask!1564))))

(declare-fun b!1205958 () Bool)

(declare-fun res!802062 () Bool)

(assert (=> b!1205958 (=> (not res!802062) (not e!684853))))

(declare-datatypes ((V!45985 0))(
  ( (V!45986 (val!15378 Int)) )
))
(declare-datatypes ((ValueCell!14612 0))(
  ( (ValueCellFull!14612 (v!18022 V!45985)) (EmptyCell!14612) )
))
(declare-datatypes ((array!78069 0))(
  ( (array!78070 (arr!37675 (Array (_ BitVec 32) ValueCell!14612)) (size!38211 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78069)

(assert (=> b!1205958 (= res!802062 (and (= (size!38211 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38210 _keys!1208) (size!38211 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47820 () Bool)

(declare-fun mapRes!47820 () Bool)

(assert (=> mapIsEmpty!47820 mapRes!47820))

(declare-fun bm!58593 () Bool)

(declare-datatypes ((tuple2!19728 0))(
  ( (tuple2!19729 (_1!9875 (_ BitVec 64)) (_2!9875 V!45985)) )
))
(declare-datatypes ((List!26533 0))(
  ( (Nil!26530) (Cons!26529 (h!27738 tuple2!19728) (t!39452 List!26533)) )
))
(declare-datatypes ((ListLongMap!17697 0))(
  ( (ListLongMap!17698 (toList!8864 List!26533)) )
))
(declare-fun call!58596 () ListLongMap!17697)

(declare-fun call!58602 () ListLongMap!17697)

(assert (=> bm!58593 (= call!58596 call!58602)))

(declare-fun b!1205959 () Bool)

(declare-fun e!684842 () Bool)

(assert (=> b!1205959 (= e!684842 true)))

(declare-fun e!684846 () Bool)

(assert (=> b!1205959 e!684846))

(declare-fun res!802058 () Bool)

(assert (=> b!1205959 (=> (not res!802058) (not e!684846))))

(declare-fun e!684843 () Bool)

(assert (=> b!1205959 (= res!802058 e!684843)))

(declare-fun c!118374 () Bool)

(assert (=> b!1205959 (= c!118374 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!45985)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45985)

(declare-fun lt!547010 () Unit!39980)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!570 (array!78067 array!78069 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 64) (_ BitVec 32) Int) Unit!39980)

(assert (=> b!1205959 (= lt!547010 (lemmaListMapContainsThenArrayContainsFrom!570 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547015 () Unit!39980)

(assert (=> b!1205959 (= lt!547015 e!684845)))

(declare-fun c!118371 () Bool)

(assert (=> b!1205959 (= c!118371 (and (not lt!547019) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205959 (= lt!547019 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205960 () Bool)

(declare-fun e!684841 () Bool)

(declare-fun e!684852 () Bool)

(assert (=> b!1205960 (= e!684841 e!684852)))

(declare-fun res!802061 () Bool)

(assert (=> b!1205960 (=> res!802061 e!684852)))

(assert (=> b!1205960 (= res!802061 (not (= (select (arr!37674 _keys!1208) from!1455) k!934)))))

(declare-fun e!684851 () Bool)

(assert (=> b!1205960 e!684851))

(declare-fun c!118372 () Bool)

(assert (=> b!1205960 (= c!118372 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547013 () Unit!39980)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1030 (array!78067 array!78069 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39980)

(assert (=> b!1205960 (= lt!547013 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1030 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205961 () Bool)

(declare-fun e!684839 () Bool)

(assert (=> b!1205961 (= e!684853 e!684839)))

(declare-fun res!802069 () Bool)

(assert (=> b!1205961 (=> (not res!802069) (not e!684839))))

(declare-fun lt!547021 () array!78067)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78067 (_ BitVec 32)) Bool)

(assert (=> b!1205961 (= res!802069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547021 mask!1564))))

(assert (=> b!1205961 (= lt!547021 (array!78068 (store (arr!37674 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38210 _keys!1208)))))

(declare-fun b!1205962 () Bool)

(declare-fun e!684840 () Unit!39980)

(declare-fun lt!547017 () Unit!39980)

(assert (=> b!1205962 (= e!684840 lt!547017)))

(assert (=> b!1205962 (= lt!547017 call!58600)))

(assert (=> b!1205962 call!58601))

(declare-fun b!1205963 () Bool)

(assert (=> b!1205963 (= e!684843 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547019) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!58594 () Bool)

(declare-fun call!58603 () Unit!39980)

(assert (=> bm!58594 (= call!58600 call!58603)))

(declare-fun b!1205964 () Bool)

(declare-fun e!684850 () Bool)

(assert (=> b!1205964 (= e!684850 e!684841)))

(declare-fun res!802059 () Bool)

(assert (=> b!1205964 (=> res!802059 e!684841)))

(assert (=> b!1205964 (= res!802059 (not (= from!1455 i!673)))))

(declare-fun lt!547014 () array!78069)

(declare-fun lt!547024 () ListLongMap!17697)

(declare-fun getCurrentListMapNoExtraKeys!5299 (array!78067 array!78069 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 32) Int) ListLongMap!17697)

(assert (=> b!1205964 (= lt!547024 (getCurrentListMapNoExtraKeys!5299 lt!547021 lt!547014 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3206 (Int (_ BitVec 64)) V!45985)

(assert (=> b!1205964 (= lt!547014 (array!78070 (store (arr!37675 _values!996) i!673 (ValueCellFull!14612 (dynLambda!3206 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38211 _values!996)))))

(declare-fun lt!547011 () ListLongMap!17697)

(assert (=> b!1205964 (= lt!547011 (getCurrentListMapNoExtraKeys!5299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205965 () Bool)

(declare-fun e!684849 () Bool)

(declare-fun e!684844 () Bool)

(assert (=> b!1205965 (= e!684849 (and e!684844 mapRes!47820))))

(declare-fun condMapEmpty!47820 () Bool)

(declare-fun mapDefault!47820 () ValueCell!14612)

