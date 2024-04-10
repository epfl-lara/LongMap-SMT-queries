; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99608 () Bool)

(assert start!99608)

(declare-fun b_free!25187 () Bool)

(declare-fun b_next!25187 () Bool)

(assert (=> start!99608 (= b_free!25187 (not b_next!25187))))

(declare-fun tp!88274 () Bool)

(declare-fun b_and!41241 () Bool)

(assert (=> start!99608 (= tp!88274 b_and!41241)))

(declare-fun b!1179937 () Bool)

(declare-fun res!783963 () Bool)

(declare-fun e!670823 () Bool)

(assert (=> b!1179937 (=> (not res!783963) (not e!670823))))

(declare-datatypes ((array!76237 0))(
  ( (array!76238 (arr!36768 (Array (_ BitVec 32) (_ BitVec 64))) (size!37304 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76237)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1179937 (= res!783963 (= (select (arr!36768 _keys!1208) i!673) k!934))))

(declare-fun b!1179938 () Bool)

(declare-fun e!670834 () Bool)

(assert (=> b!1179938 (= e!670834 true)))

(declare-fun e!670824 () Bool)

(assert (=> b!1179938 e!670824))

(declare-fun res!783971 () Bool)

(assert (=> b!1179938 (=> (not res!783971) (not e!670824))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179938 (= res!783971 (not (= (select (arr!36768 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38997 0))(
  ( (Unit!38998) )
))
(declare-fun lt!533384 () Unit!38997)

(declare-fun e!670828 () Unit!38997)

(assert (=> b!1179938 (= lt!533384 e!670828)))

(declare-fun c!116904 () Bool)

(assert (=> b!1179938 (= c!116904 (= (select (arr!36768 _keys!1208) from!1455) k!934))))

(declare-fun e!670831 () Bool)

(assert (=> b!1179938 e!670831))

(declare-fun res!783964 () Bool)

(assert (=> b!1179938 (=> (not res!783964) (not e!670831))))

(declare-datatypes ((V!44749 0))(
  ( (V!44750 (val!14915 Int)) )
))
(declare-datatypes ((tuple2!19096 0))(
  ( (tuple2!19097 (_1!9559 (_ BitVec 64)) (_2!9559 V!44749)) )
))
(declare-datatypes ((List!25834 0))(
  ( (Nil!25831) (Cons!25830 (h!27039 tuple2!19096) (t!38013 List!25834)) )
))
(declare-datatypes ((ListLongMap!17065 0))(
  ( (ListLongMap!17066 (toList!8548 List!25834)) )
))
(declare-fun lt!533383 () ListLongMap!17065)

(declare-fun lt!533385 () tuple2!19096)

(declare-fun lt!533387 () ListLongMap!17065)

(declare-fun +!3859 (ListLongMap!17065 tuple2!19096) ListLongMap!17065)

(assert (=> b!1179938 (= res!783964 (= lt!533387 (+!3859 lt!533383 lt!533385)))))

(declare-fun lt!533382 () V!44749)

(declare-datatypes ((ValueCell!14149 0))(
  ( (ValueCellFull!14149 (v!17553 V!44749)) (EmptyCell!14149) )
))
(declare-datatypes ((array!76239 0))(
  ( (array!76240 (arr!36769 (Array (_ BitVec 32) ValueCell!14149)) (size!37305 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76239)

(declare-fun get!18799 (ValueCell!14149 V!44749) V!44749)

(assert (=> b!1179938 (= lt!533385 (tuple2!19097 (select (arr!36768 _keys!1208) from!1455) (get!18799 (select (arr!36769 _values!996) from!1455) lt!533382)))))

(declare-fun b!1179939 () Bool)

(declare-fun res!783975 () Bool)

(assert (=> b!1179939 (=> (not res!783975) (not e!670823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179939 (= res!783975 (validKeyInArray!0 k!934))))

(declare-fun b!1179940 () Bool)

(declare-fun res!783977 () Bool)

(assert (=> b!1179940 (=> (not res!783977) (not e!670823))))

(assert (=> b!1179940 (= res!783977 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37304 _keys!1208))))))

(declare-fun b!1179941 () Bool)

(declare-fun e!670826 () Bool)

(assert (=> b!1179941 (= e!670826 e!670834)))

(declare-fun res!783974 () Bool)

(assert (=> b!1179941 (=> res!783974 e!670834)))

(assert (=> b!1179941 (= res!783974 (not (validKeyInArray!0 (select (arr!36768 _keys!1208) from!1455))))))

(declare-fun lt!533386 () ListLongMap!17065)

(assert (=> b!1179941 (= lt!533386 lt!533383)))

(declare-fun lt!533374 () ListLongMap!17065)

(declare-fun -!1590 (ListLongMap!17065 (_ BitVec 64)) ListLongMap!17065)

(assert (=> b!1179941 (= lt!533383 (-!1590 lt!533374 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533380 () array!76239)

(declare-fun minValue!944 () V!44749)

(declare-fun zeroValue!944 () V!44749)

(declare-fun lt!533379 () array!76237)

(declare-fun getCurrentListMapNoExtraKeys!5002 (array!76237 array!76239 (_ BitVec 32) (_ BitVec 32) V!44749 V!44749 (_ BitVec 32) Int) ListLongMap!17065)

(assert (=> b!1179941 (= lt!533386 (getCurrentListMapNoExtraKeys!5002 lt!533379 lt!533380 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179941 (= lt!533374 (getCurrentListMapNoExtraKeys!5002 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533377 () Unit!38997)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!817 (array!76237 array!76239 (_ BitVec 32) (_ BitVec 32) V!44749 V!44749 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38997)

(assert (=> b!1179941 (= lt!533377 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!817 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179942 () Bool)

(declare-fun e!670822 () Bool)

(assert (=> b!1179942 (= e!670823 e!670822)))

(declare-fun res!783973 () Bool)

(assert (=> b!1179942 (=> (not res!783973) (not e!670822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76237 (_ BitVec 32)) Bool)

(assert (=> b!1179942 (= res!783973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533379 mask!1564))))

(assert (=> b!1179942 (= lt!533379 (array!76238 (store (arr!36768 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37304 _keys!1208)))))

(declare-fun b!1179943 () Bool)

(declare-fun res!783965 () Bool)

(assert (=> b!1179943 (=> (not res!783965) (not e!670822))))

(declare-datatypes ((List!25835 0))(
  ( (Nil!25832) (Cons!25831 (h!27040 (_ BitVec 64)) (t!38014 List!25835)) )
))
(declare-fun arrayNoDuplicates!0 (array!76237 (_ BitVec 32) List!25835) Bool)

(assert (=> b!1179943 (= res!783965 (arrayNoDuplicates!0 lt!533379 #b00000000000000000000000000000000 Nil!25832))))

(declare-fun b!1179944 () Bool)

(declare-fun res!783966 () Bool)

(assert (=> b!1179944 (=> (not res!783966) (not e!670823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179944 (= res!783966 (validMask!0 mask!1564))))

(declare-fun res!783970 () Bool)

(assert (=> start!99608 (=> (not res!783970) (not e!670823))))

(assert (=> start!99608 (= res!783970 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37304 _keys!1208))))))

(assert (=> start!99608 e!670823))

(declare-fun tp_is_empty!29717 () Bool)

(assert (=> start!99608 tp_is_empty!29717))

(declare-fun array_inv!28074 (array!76237) Bool)

(assert (=> start!99608 (array_inv!28074 _keys!1208)))

(assert (=> start!99608 true))

(assert (=> start!99608 tp!88274))

(declare-fun e!670829 () Bool)

(declare-fun array_inv!28075 (array!76239) Bool)

(assert (=> start!99608 (and (array_inv!28075 _values!996) e!670829)))

(declare-fun b!1179945 () Bool)

(declare-fun res!783969 () Bool)

(assert (=> b!1179945 (=> (not res!783969) (not e!670823))))

(assert (=> b!1179945 (= res!783969 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25832))))

(declare-fun mapNonEmpty!46403 () Bool)

(declare-fun mapRes!46403 () Bool)

(declare-fun tp!88275 () Bool)

(declare-fun e!670827 () Bool)

(assert (=> mapNonEmpty!46403 (= mapRes!46403 (and tp!88275 e!670827))))

(declare-fun mapKey!46403 () (_ BitVec 32))

(declare-fun mapRest!46403 () (Array (_ BitVec 32) ValueCell!14149))

(declare-fun mapValue!46403 () ValueCell!14149)

(assert (=> mapNonEmpty!46403 (= (arr!36769 _values!996) (store mapRest!46403 mapKey!46403 mapValue!46403))))

(declare-fun b!1179946 () Bool)

(declare-fun e!670830 () Bool)

(assert (=> b!1179946 (= e!670830 e!670826)))

(declare-fun res!783967 () Bool)

(assert (=> b!1179946 (=> res!783967 e!670826)))

(assert (=> b!1179946 (= res!783967 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179946 (= lt!533387 (getCurrentListMapNoExtraKeys!5002 lt!533379 lt!533380 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179946 (= lt!533380 (array!76240 (store (arr!36769 _values!996) i!673 (ValueCellFull!14149 lt!533382)) (size!37305 _values!996)))))

(declare-fun dynLambda!2962 (Int (_ BitVec 64)) V!44749)

(assert (=> b!1179946 (= lt!533382 (dynLambda!2962 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533375 () ListLongMap!17065)

(assert (=> b!1179946 (= lt!533375 (getCurrentListMapNoExtraKeys!5002 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179947 () Bool)

(declare-fun e!670825 () Bool)

(assert (=> b!1179947 (= e!670831 e!670825)))

(declare-fun res!783972 () Bool)

(assert (=> b!1179947 (=> res!783972 e!670825)))

(assert (=> b!1179947 (= res!783972 (not (= (select (arr!36768 _keys!1208) from!1455) k!934)))))

(declare-fun b!1179948 () Bool)

(assert (=> b!1179948 (= e!670822 (not e!670830))))

(declare-fun res!783976 () Bool)

(assert (=> b!1179948 (=> res!783976 e!670830)))

(assert (=> b!1179948 (= res!783976 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179948 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!533378 () Unit!38997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76237 (_ BitVec 64) (_ BitVec 32)) Unit!38997)

(assert (=> b!1179948 (= lt!533378 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179949 () Bool)

(declare-fun Unit!38999 () Unit!38997)

(assert (=> b!1179949 (= e!670828 Unit!38999)))

(declare-fun b!1179950 () Bool)

(assert (=> b!1179950 (= e!670827 tp_is_empty!29717)))

(declare-fun b!1179951 () Bool)

(assert (=> b!1179951 (= e!670825 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179952 () Bool)

(declare-fun res!783968 () Bool)

(assert (=> b!1179952 (=> (not res!783968) (not e!670823))))

(assert (=> b!1179952 (= res!783968 (and (= (size!37305 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37304 _keys!1208) (size!37305 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179953 () Bool)

(declare-fun res!783978 () Bool)

(assert (=> b!1179953 (=> (not res!783978) (not e!670824))))

(assert (=> b!1179953 (= res!783978 (= lt!533375 (+!3859 lt!533374 lt!533385)))))

(declare-fun b!1179954 () Bool)

(assert (=> b!1179954 (= e!670824 (= lt!533383 lt!533386))))

(declare-fun b!1179955 () Bool)

(declare-fun res!783979 () Bool)

(assert (=> b!1179955 (=> (not res!783979) (not e!670823))))

(assert (=> b!1179955 (= res!783979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179956 () Bool)

(declare-fun e!670833 () Bool)

(assert (=> b!1179956 (= e!670829 (and e!670833 mapRes!46403))))

(declare-fun condMapEmpty!46403 () Bool)

(declare-fun mapDefault!46403 () ValueCell!14149)

