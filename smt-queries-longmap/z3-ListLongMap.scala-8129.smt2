; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99634 () Bool)

(assert start!99634)

(declare-fun b_free!25219 () Bool)

(declare-fun b_next!25219 () Bool)

(assert (=> start!99634 (= b_free!25219 (not b_next!25219))))

(declare-fun tp!88370 () Bool)

(declare-fun b_and!41283 () Bool)

(assert (=> start!99634 (= tp!88370 b_and!41283)))

(declare-fun b!1180901 () Bool)

(declare-fun res!784722 () Bool)

(declare-fun e!671371 () Bool)

(assert (=> b!1180901 (=> (not res!784722) (not e!671371))))

(declare-datatypes ((V!44793 0))(
  ( (V!44794 (val!14931 Int)) )
))
(declare-datatypes ((tuple2!19236 0))(
  ( (tuple2!19237 (_1!9629 (_ BitVec 64)) (_2!9629 V!44793)) )
))
(declare-datatypes ((List!25942 0))(
  ( (Nil!25939) (Cons!25938 (h!27147 tuple2!19236) (t!38144 List!25942)) )
))
(declare-datatypes ((ListLongMap!17205 0))(
  ( (ListLongMap!17206 (toList!8618 List!25942)) )
))
(declare-fun lt!533915 () ListLongMap!17205)

(declare-fun lt!533906 () ListLongMap!17205)

(declare-fun lt!533913 () tuple2!19236)

(declare-fun +!3915 (ListLongMap!17205 tuple2!19236) ListLongMap!17205)

(assert (=> b!1180901 (= res!784722 (= lt!533906 (+!3915 lt!533915 lt!533913)))))

(declare-fun b!1180902 () Bool)

(declare-fun res!784723 () Bool)

(declare-fun e!671380 () Bool)

(assert (=> b!1180902 (=> (not res!784723) (not e!671380))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180902 (= res!784723 (validKeyInArray!0 k0!934))))

(declare-datatypes ((array!76234 0))(
  ( (array!76235 (arr!36767 (Array (_ BitVec 32) (_ BitVec 64))) (size!37305 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76234)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!671378 () Bool)

(declare-fun b!1180903 () Bool)

(declare-fun arrayContainsKey!0 (array!76234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180903 (= e!671378 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180904 () Bool)

(declare-fun e!671376 () Bool)

(declare-fun e!671375 () Bool)

(declare-fun mapRes!46451 () Bool)

(assert (=> b!1180904 (= e!671376 (and e!671375 mapRes!46451))))

(declare-fun condMapEmpty!46451 () Bool)

(declare-datatypes ((ValueCell!14165 0))(
  ( (ValueCellFull!14165 (v!17568 V!44793)) (EmptyCell!14165) )
))
(declare-datatypes ((array!76236 0))(
  ( (array!76237 (arr!36768 (Array (_ BitVec 32) ValueCell!14165)) (size!37306 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76236)

(declare-fun mapDefault!46451 () ValueCell!14165)

(assert (=> b!1180904 (= condMapEmpty!46451 (= (arr!36768 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14165)) mapDefault!46451)))))

(declare-fun b!1180905 () Bool)

(declare-fun res!784728 () Bool)

(assert (=> b!1180905 (=> (not res!784728) (not e!671380))))

(assert (=> b!1180905 (= res!784728 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37305 _keys!1208))))))

(declare-fun mapIsEmpty!46451 () Bool)

(assert (=> mapIsEmpty!46451 mapRes!46451))

(declare-fun b!1180906 () Bool)

(declare-fun lt!533909 () ListLongMap!17205)

(declare-fun lt!533908 () ListLongMap!17205)

(assert (=> b!1180906 (= e!671371 (= lt!533909 lt!533908))))

(declare-fun b!1180908 () Bool)

(declare-datatypes ((Unit!38895 0))(
  ( (Unit!38896) )
))
(declare-fun e!671369 () Unit!38895)

(declare-fun Unit!38897 () Unit!38895)

(assert (=> b!1180908 (= e!671369 Unit!38897)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!533914 () Unit!38895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76234 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38895)

(assert (=> b!1180908 (= lt!533914 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180908 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533916 () Unit!38895)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76234 (_ BitVec 32) (_ BitVec 32)) Unit!38895)

(assert (=> b!1180908 (= lt!533916 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25943 0))(
  ( (Nil!25940) (Cons!25939 (h!27148 (_ BitVec 64)) (t!38145 List!25943)) )
))
(declare-fun arrayNoDuplicates!0 (array!76234 (_ BitVec 32) List!25943) Bool)

(assert (=> b!1180908 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25940)))

(declare-fun lt!533912 () Unit!38895)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76234 (_ BitVec 64) (_ BitVec 32) List!25943) Unit!38895)

(assert (=> b!1180908 (= lt!533912 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25940))))

(assert (=> b!1180908 false))

(declare-fun b!1180909 () Bool)

(declare-fun Unit!38898 () Unit!38895)

(assert (=> b!1180909 (= e!671369 Unit!38898)))

(declare-fun b!1180910 () Bool)

(declare-fun res!784726 () Bool)

(assert (=> b!1180910 (=> (not res!784726) (not e!671380))))

(assert (=> b!1180910 (= res!784726 (= (select (arr!36767 _keys!1208) i!673) k0!934))))

(declare-fun b!1180911 () Bool)

(declare-fun e!671373 () Bool)

(declare-fun tp_is_empty!29749 () Bool)

(assert (=> b!1180911 (= e!671373 tp_is_empty!29749)))

(declare-fun mapNonEmpty!46451 () Bool)

(declare-fun tp!88371 () Bool)

(assert (=> mapNonEmpty!46451 (= mapRes!46451 (and tp!88371 e!671373))))

(declare-fun mapValue!46451 () ValueCell!14165)

(declare-fun mapKey!46451 () (_ BitVec 32))

(declare-fun mapRest!46451 () (Array (_ BitVec 32) ValueCell!14165))

(assert (=> mapNonEmpty!46451 (= (arr!36768 _values!996) (store mapRest!46451 mapKey!46451 mapValue!46451))))

(declare-fun b!1180912 () Bool)

(declare-fun res!784724 () Bool)

(declare-fun e!671379 () Bool)

(assert (=> b!1180912 (=> (not res!784724) (not e!671379))))

(declare-fun lt!533902 () array!76234)

(assert (=> b!1180912 (= res!784724 (arrayNoDuplicates!0 lt!533902 #b00000000000000000000000000000000 Nil!25940))))

(declare-fun b!1180913 () Bool)

(declare-fun res!784715 () Bool)

(assert (=> b!1180913 (=> (not res!784715) (not e!671380))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180913 (= res!784715 (validMask!0 mask!1564))))

(declare-fun b!1180914 () Bool)

(declare-fun res!784721 () Bool)

(assert (=> b!1180914 (=> (not res!784721) (not e!671380))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1180914 (= res!784721 (and (= (size!37306 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37305 _keys!1208) (size!37306 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180915 () Bool)

(assert (=> b!1180915 (= e!671375 tp_is_empty!29749)))

(declare-fun b!1180916 () Bool)

(declare-fun res!784717 () Bool)

(assert (=> b!1180916 (=> (not res!784717) (not e!671380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76234 (_ BitVec 32)) Bool)

(assert (=> b!1180916 (= res!784717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180917 () Bool)

(declare-fun e!671370 () Bool)

(declare-fun e!671368 () Bool)

(assert (=> b!1180917 (= e!671370 e!671368)))

(declare-fun res!784719 () Bool)

(assert (=> b!1180917 (=> res!784719 e!671368)))

(assert (=> b!1180917 (= res!784719 (not (validKeyInArray!0 (select (arr!36767 _keys!1208) from!1455))))))

(assert (=> b!1180917 (= lt!533908 lt!533909)))

(declare-fun -!1578 (ListLongMap!17205 (_ BitVec 64)) ListLongMap!17205)

(assert (=> b!1180917 (= lt!533909 (-!1578 lt!533915 k0!934))))

(declare-fun zeroValue!944 () V!44793)

(declare-fun lt!533907 () array!76236)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44793)

(declare-fun getCurrentListMapNoExtraKeys!5074 (array!76234 array!76236 (_ BitVec 32) (_ BitVec 32) V!44793 V!44793 (_ BitVec 32) Int) ListLongMap!17205)

(assert (=> b!1180917 (= lt!533908 (getCurrentListMapNoExtraKeys!5074 lt!533902 lt!533907 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180917 (= lt!533915 (getCurrentListMapNoExtraKeys!5074 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533910 () Unit!38895)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!842 (array!76234 array!76236 (_ BitVec 32) (_ BitVec 32) V!44793 V!44793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38895)

(assert (=> b!1180917 (= lt!533910 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!842 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180918 () Bool)

(declare-fun res!784713 () Bool)

(assert (=> b!1180918 (=> (not res!784713) (not e!671380))))

(assert (=> b!1180918 (= res!784713 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25940))))

(declare-fun b!1180919 () Bool)

(declare-fun e!671377 () Bool)

(assert (=> b!1180919 (= e!671377 e!671378)))

(declare-fun res!784727 () Bool)

(assert (=> b!1180919 (=> res!784727 e!671378)))

(assert (=> b!1180919 (= res!784727 (not (= (select (arr!36767 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180920 () Bool)

(declare-fun e!671374 () Bool)

(assert (=> b!1180920 (= e!671374 e!671370)))

(declare-fun res!784720 () Bool)

(assert (=> b!1180920 (=> res!784720 e!671370)))

(assert (=> b!1180920 (= res!784720 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!533911 () ListLongMap!17205)

(assert (=> b!1180920 (= lt!533911 (getCurrentListMapNoExtraKeys!5074 lt!533902 lt!533907 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533904 () V!44793)

(assert (=> b!1180920 (= lt!533907 (array!76237 (store (arr!36768 _values!996) i!673 (ValueCellFull!14165 lt!533904)) (size!37306 _values!996)))))

(declare-fun dynLambda!2983 (Int (_ BitVec 64)) V!44793)

(assert (=> b!1180920 (= lt!533904 (dynLambda!2983 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1180920 (= lt!533906 (getCurrentListMapNoExtraKeys!5074 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!784729 () Bool)

(assert (=> start!99634 (=> (not res!784729) (not e!671380))))

(assert (=> start!99634 (= res!784729 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37305 _keys!1208))))))

(assert (=> start!99634 e!671380))

(assert (=> start!99634 tp_is_empty!29749))

(declare-fun array_inv!28184 (array!76234) Bool)

(assert (=> start!99634 (array_inv!28184 _keys!1208)))

(assert (=> start!99634 true))

(assert (=> start!99634 tp!88370))

(declare-fun array_inv!28185 (array!76236) Bool)

(assert (=> start!99634 (and (array_inv!28185 _values!996) e!671376)))

(declare-fun b!1180907 () Bool)

(assert (=> b!1180907 (= e!671368 true)))

(assert (=> b!1180907 e!671371))

(declare-fun res!784714 () Bool)

(assert (=> b!1180907 (=> (not res!784714) (not e!671371))))

(assert (=> b!1180907 (= res!784714 (not (= (select (arr!36767 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533903 () Unit!38895)

(assert (=> b!1180907 (= lt!533903 e!671369)))

(declare-fun c!116926 () Bool)

(assert (=> b!1180907 (= c!116926 (= (select (arr!36767 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180907 e!671377))

(declare-fun res!784716 () Bool)

(assert (=> b!1180907 (=> (not res!784716) (not e!671377))))

(assert (=> b!1180907 (= res!784716 (= lt!533911 (+!3915 lt!533909 lt!533913)))))

(declare-fun get!18812 (ValueCell!14165 V!44793) V!44793)

(assert (=> b!1180907 (= lt!533913 (tuple2!19237 (select (arr!36767 _keys!1208) from!1455) (get!18812 (select (arr!36768 _values!996) from!1455) lt!533904)))))

(declare-fun b!1180921 () Bool)

(assert (=> b!1180921 (= e!671380 e!671379)))

(declare-fun res!784725 () Bool)

(assert (=> b!1180921 (=> (not res!784725) (not e!671379))))

(assert (=> b!1180921 (= res!784725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533902 mask!1564))))

(assert (=> b!1180921 (= lt!533902 (array!76235 (store (arr!36767 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37305 _keys!1208)))))

(declare-fun b!1180922 () Bool)

(assert (=> b!1180922 (= e!671379 (not e!671374))))

(declare-fun res!784718 () Bool)

(assert (=> b!1180922 (=> res!784718 e!671374)))

(assert (=> b!1180922 (= res!784718 (bvsgt from!1455 i!673))))

(assert (=> b!1180922 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533905 () Unit!38895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76234 (_ BitVec 64) (_ BitVec 32)) Unit!38895)

(assert (=> b!1180922 (= lt!533905 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99634 res!784729) b!1180913))

(assert (= (and b!1180913 res!784715) b!1180914))

(assert (= (and b!1180914 res!784721) b!1180916))

(assert (= (and b!1180916 res!784717) b!1180918))

(assert (= (and b!1180918 res!784713) b!1180905))

(assert (= (and b!1180905 res!784728) b!1180902))

(assert (= (and b!1180902 res!784723) b!1180910))

(assert (= (and b!1180910 res!784726) b!1180921))

(assert (= (and b!1180921 res!784725) b!1180912))

(assert (= (and b!1180912 res!784724) b!1180922))

(assert (= (and b!1180922 (not res!784718)) b!1180920))

(assert (= (and b!1180920 (not res!784720)) b!1180917))

(assert (= (and b!1180917 (not res!784719)) b!1180907))

(assert (= (and b!1180907 res!784716) b!1180919))

(assert (= (and b!1180919 (not res!784727)) b!1180903))

(assert (= (and b!1180907 c!116926) b!1180908))

(assert (= (and b!1180907 (not c!116926)) b!1180909))

(assert (= (and b!1180907 res!784714) b!1180901))

(assert (= (and b!1180901 res!784722) b!1180906))

(assert (= (and b!1180904 condMapEmpty!46451) mapIsEmpty!46451))

(assert (= (and b!1180904 (not condMapEmpty!46451)) mapNonEmpty!46451))

(get-info :version)

(assert (= (and mapNonEmpty!46451 ((_ is ValueCellFull!14165) mapValue!46451)) b!1180911))

(assert (= (and b!1180904 ((_ is ValueCellFull!14165) mapDefault!46451)) b!1180915))

(assert (= start!99634 b!1180904))

(declare-fun b_lambda!20345 () Bool)

(assert (=> (not b_lambda!20345) (not b!1180920)))

(declare-fun t!38143 () Bool)

(declare-fun tb!10023 () Bool)

(assert (=> (and start!99634 (= defaultEntry!1004 defaultEntry!1004) t!38143) tb!10023))

(declare-fun result!20621 () Bool)

(assert (=> tb!10023 (= result!20621 tp_is_empty!29749)))

(assert (=> b!1180920 t!38143))

(declare-fun b_and!41285 () Bool)

(assert (= b_and!41283 (and (=> t!38143 result!20621) b_and!41285)))

(declare-fun m!1088351 () Bool)

(assert (=> mapNonEmpty!46451 m!1088351))

(declare-fun m!1088353 () Bool)

(assert (=> b!1180913 m!1088353))

(declare-fun m!1088355 () Bool)

(assert (=> b!1180910 m!1088355))

(declare-fun m!1088357 () Bool)

(assert (=> b!1180921 m!1088357))

(declare-fun m!1088359 () Bool)

(assert (=> b!1180921 m!1088359))

(declare-fun m!1088361 () Bool)

(assert (=> b!1180912 m!1088361))

(declare-fun m!1088363 () Bool)

(assert (=> start!99634 m!1088363))

(declare-fun m!1088365 () Bool)

(assert (=> start!99634 m!1088365))

(declare-fun m!1088367 () Bool)

(assert (=> b!1180902 m!1088367))

(declare-fun m!1088369 () Bool)

(assert (=> b!1180916 m!1088369))

(declare-fun m!1088371 () Bool)

(assert (=> b!1180907 m!1088371))

(declare-fun m!1088373 () Bool)

(assert (=> b!1180907 m!1088373))

(declare-fun m!1088375 () Bool)

(assert (=> b!1180907 m!1088375))

(assert (=> b!1180907 m!1088375))

(declare-fun m!1088377 () Bool)

(assert (=> b!1180907 m!1088377))

(declare-fun m!1088379 () Bool)

(assert (=> b!1180901 m!1088379))

(assert (=> b!1180919 m!1088371))

(declare-fun m!1088381 () Bool)

(assert (=> b!1180908 m!1088381))

(declare-fun m!1088383 () Bool)

(assert (=> b!1180908 m!1088383))

(declare-fun m!1088385 () Bool)

(assert (=> b!1180908 m!1088385))

(declare-fun m!1088387 () Bool)

(assert (=> b!1180908 m!1088387))

(declare-fun m!1088389 () Bool)

(assert (=> b!1180908 m!1088389))

(declare-fun m!1088391 () Bool)

(assert (=> b!1180903 m!1088391))

(declare-fun m!1088393 () Bool)

(assert (=> b!1180917 m!1088393))

(declare-fun m!1088395 () Bool)

(assert (=> b!1180917 m!1088395))

(declare-fun m!1088397 () Bool)

(assert (=> b!1180917 m!1088397))

(declare-fun m!1088399 () Bool)

(assert (=> b!1180917 m!1088399))

(assert (=> b!1180917 m!1088371))

(declare-fun m!1088401 () Bool)

(assert (=> b!1180917 m!1088401))

(assert (=> b!1180917 m!1088371))

(declare-fun m!1088403 () Bool)

(assert (=> b!1180922 m!1088403))

(declare-fun m!1088405 () Bool)

(assert (=> b!1180922 m!1088405))

(declare-fun m!1088407 () Bool)

(assert (=> b!1180920 m!1088407))

(declare-fun m!1088409 () Bool)

(assert (=> b!1180920 m!1088409))

(declare-fun m!1088411 () Bool)

(assert (=> b!1180920 m!1088411))

(declare-fun m!1088413 () Bool)

(assert (=> b!1180920 m!1088413))

(declare-fun m!1088415 () Bool)

(assert (=> b!1180918 m!1088415))

(check-sat (not b!1180901) (not b!1180922) (not b!1180903) (not b!1180921) (not mapNonEmpty!46451) tp_is_empty!29749 (not b!1180918) (not b!1180917) (not b_next!25219) (not b!1180916) (not b!1180902) (not b!1180912) (not b!1180908) (not b!1180920) (not start!99634) (not b!1180913) b_and!41285 (not b!1180907) (not b_lambda!20345))
(check-sat b_and!41285 (not b_next!25219))
