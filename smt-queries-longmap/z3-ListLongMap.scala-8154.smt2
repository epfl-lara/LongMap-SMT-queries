; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99792 () Bool)

(assert start!99792)

(declare-fun b_free!25371 () Bool)

(declare-fun b_next!25371 () Bool)

(assert (=> start!99792 (= b_free!25371 (not b_next!25371))))

(declare-fun tp!88826 () Bool)

(declare-fun b_and!41609 () Bool)

(assert (=> start!99792 (= tp!88826 b_and!41609)))

(declare-fun b!1185787 () Bool)

(declare-fun e!674209 () Bool)

(declare-fun tp_is_empty!29901 () Bool)

(assert (=> b!1185787 (= e!674209 tp_is_empty!29901)))

(declare-fun b!1185788 () Bool)

(declare-fun res!788252 () Bool)

(declare-fun e!674207 () Bool)

(assert (=> b!1185788 (=> (not res!788252) (not e!674207))))

(declare-datatypes ((array!76599 0))(
  ( (array!76600 (arr!36949 (Array (_ BitVec 32) (_ BitVec 64))) (size!37485 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76599)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76599 (_ BitVec 32)) Bool)

(assert (=> b!1185788 (= res!788252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185789 () Bool)

(declare-fun res!788259 () Bool)

(assert (=> b!1185789 (=> (not res!788259) (not e!674207))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185789 (= res!788259 (validKeyInArray!0 k0!934))))

(declare-fun b!1185790 () Bool)

(declare-datatypes ((Unit!39291 0))(
  ( (Unit!39292) )
))
(declare-fun e!674217 () Unit!39291)

(declare-fun Unit!39293 () Unit!39291)

(assert (=> b!1185790 (= e!674217 Unit!39293)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!538343 () Unit!39291)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76599 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39291)

(assert (=> b!1185790 (= lt!538343 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185790 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538339 () Unit!39291)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76599 (_ BitVec 32) (_ BitVec 32)) Unit!39291)

(assert (=> b!1185790 (= lt!538339 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25994 0))(
  ( (Nil!25991) (Cons!25990 (h!27199 (_ BitVec 64)) (t!38357 List!25994)) )
))
(declare-fun arrayNoDuplicates!0 (array!76599 (_ BitVec 32) List!25994) Bool)

(assert (=> b!1185790 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25991)))

(declare-fun lt!538332 () Unit!39291)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76599 (_ BitVec 64) (_ BitVec 32) List!25994) Unit!39291)

(assert (=> b!1185790 (= lt!538332 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25991))))

(assert (=> b!1185790 false))

(declare-fun b!1185791 () Bool)

(declare-fun e!674214 () Bool)

(declare-fun e!674216 () Bool)

(assert (=> b!1185791 (= e!674214 (not e!674216))))

(declare-fun res!788255 () Bool)

(assert (=> b!1185791 (=> res!788255 e!674216)))

(assert (=> b!1185791 (= res!788255 (bvsgt from!1455 i!673))))

(assert (=> b!1185791 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538326 () Unit!39291)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76599 (_ BitVec 64) (_ BitVec 32)) Unit!39291)

(assert (=> b!1185791 (= lt!538326 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185792 () Bool)

(declare-fun e!674218 () Bool)

(declare-fun e!674212 () Bool)

(assert (=> b!1185792 (= e!674218 e!674212)))

(declare-fun res!788260 () Bool)

(assert (=> b!1185792 (=> res!788260 e!674212)))

(assert (=> b!1185792 (= res!788260 (not (= (select (arr!36949 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185793 () Bool)

(declare-fun e!674210 () Bool)

(declare-fun e!674211 () Bool)

(declare-fun mapRes!46679 () Bool)

(assert (=> b!1185793 (= e!674210 (and e!674211 mapRes!46679))))

(declare-fun condMapEmpty!46679 () Bool)

(declare-datatypes ((V!44995 0))(
  ( (V!44996 (val!15007 Int)) )
))
(declare-datatypes ((ValueCell!14241 0))(
  ( (ValueCellFull!14241 (v!17645 V!44995)) (EmptyCell!14241) )
))
(declare-datatypes ((array!76601 0))(
  ( (array!76602 (arr!36950 (Array (_ BitVec 32) ValueCell!14241)) (size!37486 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76601)

(declare-fun mapDefault!46679 () ValueCell!14241)

(assert (=> b!1185793 (= condMapEmpty!46679 (= (arr!36950 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14241)) mapDefault!46679)))))

(declare-fun res!788254 () Bool)

(assert (=> start!99792 (=> (not res!788254) (not e!674207))))

(assert (=> start!99792 (= res!788254 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37485 _keys!1208))))))

(assert (=> start!99792 e!674207))

(assert (=> start!99792 tp_is_empty!29901))

(declare-fun array_inv!28196 (array!76599) Bool)

(assert (=> start!99792 (array_inv!28196 _keys!1208)))

(assert (=> start!99792 true))

(assert (=> start!99792 tp!88826))

(declare-fun array_inv!28197 (array!76601) Bool)

(assert (=> start!99792 (and (array_inv!28197 _values!996) e!674210)))

(declare-fun b!1185794 () Bool)

(declare-fun res!788261 () Bool)

(assert (=> b!1185794 (=> (not res!788261) (not e!674207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185794 (= res!788261 (validMask!0 mask!1564))))

(declare-fun b!1185795 () Bool)

(declare-fun e!674213 () Bool)

(assert (=> b!1185795 (= e!674216 e!674213)))

(declare-fun res!788257 () Bool)

(assert (=> b!1185795 (=> res!788257 e!674213)))

(assert (=> b!1185795 (= res!788257 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!538341 () array!76599)

(declare-datatypes ((tuple2!19254 0))(
  ( (tuple2!19255 (_1!9638 (_ BitVec 64)) (_2!9638 V!44995)) )
))
(declare-datatypes ((List!25995 0))(
  ( (Nil!25992) (Cons!25991 (h!27200 tuple2!19254) (t!38358 List!25995)) )
))
(declare-datatypes ((ListLongMap!17223 0))(
  ( (ListLongMap!17224 (toList!8627 List!25995)) )
))
(declare-fun lt!538336 () ListLongMap!17223)

(declare-fun minValue!944 () V!44995)

(declare-fun zeroValue!944 () V!44995)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538335 () array!76601)

(declare-fun getCurrentListMapNoExtraKeys!5072 (array!76599 array!76601 (_ BitVec 32) (_ BitVec 32) V!44995 V!44995 (_ BitVec 32) Int) ListLongMap!17223)

(assert (=> b!1185795 (= lt!538336 (getCurrentListMapNoExtraKeys!5072 lt!538341 lt!538335 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538342 () V!44995)

(assert (=> b!1185795 (= lt!538335 (array!76602 (store (arr!36950 _values!996) i!673 (ValueCellFull!14241 lt!538342)) (size!37486 _values!996)))))

(declare-fun dynLambda!3023 (Int (_ BitVec 64)) V!44995)

(assert (=> b!1185795 (= lt!538342 (dynLambda!3023 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538331 () ListLongMap!17223)

(assert (=> b!1185795 (= lt!538331 (getCurrentListMapNoExtraKeys!5072 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185796 () Bool)

(declare-fun e!674208 () Bool)

(assert (=> b!1185796 (= e!674208 true)))

(declare-fun lt!538329 () ListLongMap!17223)

(declare-fun lt!538327 () ListLongMap!17223)

(declare-fun -!1660 (ListLongMap!17223 (_ BitVec 64)) ListLongMap!17223)

(assert (=> b!1185796 (= (-!1660 lt!538329 k0!934) lt!538327)))

(declare-fun lt!538330 () ListLongMap!17223)

(declare-fun lt!538338 () V!44995)

(declare-fun lt!538340 () Unit!39291)

(declare-fun addRemoveCommutativeForDiffKeys!185 (ListLongMap!17223 (_ BitVec 64) V!44995 (_ BitVec 64)) Unit!39291)

(assert (=> b!1185796 (= lt!538340 (addRemoveCommutativeForDiffKeys!185 lt!538330 (select (arr!36949 _keys!1208) from!1455) lt!538338 k0!934))))

(declare-fun lt!538334 () ListLongMap!17223)

(declare-fun lt!538333 () ListLongMap!17223)

(assert (=> b!1185796 (and (= lt!538331 lt!538329) (= lt!538334 lt!538333))))

(declare-fun lt!538344 () tuple2!19254)

(declare-fun +!3922 (ListLongMap!17223 tuple2!19254) ListLongMap!17223)

(assert (=> b!1185796 (= lt!538329 (+!3922 lt!538330 lt!538344))))

(assert (=> b!1185796 (not (= (select (arr!36949 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538328 () Unit!39291)

(assert (=> b!1185796 (= lt!538328 e!674217)))

(declare-fun c!117180 () Bool)

(assert (=> b!1185796 (= c!117180 (= (select (arr!36949 _keys!1208) from!1455) k0!934))))

(assert (=> b!1185796 e!674218))

(declare-fun res!788250 () Bool)

(assert (=> b!1185796 (=> (not res!788250) (not e!674218))))

(assert (=> b!1185796 (= res!788250 (= lt!538336 lt!538327))))

(assert (=> b!1185796 (= lt!538327 (+!3922 lt!538334 lt!538344))))

(assert (=> b!1185796 (= lt!538344 (tuple2!19255 (select (arr!36949 _keys!1208) from!1455) lt!538338))))

(declare-fun get!18919 (ValueCell!14241 V!44995) V!44995)

(assert (=> b!1185796 (= lt!538338 (get!18919 (select (arr!36950 _values!996) from!1455) lt!538342))))

(declare-fun mapNonEmpty!46679 () Bool)

(declare-fun tp!88827 () Bool)

(assert (=> mapNonEmpty!46679 (= mapRes!46679 (and tp!88827 e!674209))))

(declare-fun mapKey!46679 () (_ BitVec 32))

(declare-fun mapValue!46679 () ValueCell!14241)

(declare-fun mapRest!46679 () (Array (_ BitVec 32) ValueCell!14241))

(assert (=> mapNonEmpty!46679 (= (arr!36950 _values!996) (store mapRest!46679 mapKey!46679 mapValue!46679))))

(declare-fun b!1185797 () Bool)

(declare-fun res!788262 () Bool)

(assert (=> b!1185797 (=> (not res!788262) (not e!674214))))

(assert (=> b!1185797 (= res!788262 (arrayNoDuplicates!0 lt!538341 #b00000000000000000000000000000000 Nil!25991))))

(declare-fun b!1185798 () Bool)

(declare-fun res!788263 () Bool)

(assert (=> b!1185798 (=> (not res!788263) (not e!674207))))

(assert (=> b!1185798 (= res!788263 (and (= (size!37486 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37485 _keys!1208) (size!37486 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185799 () Bool)

(assert (=> b!1185799 (= e!674207 e!674214)))

(declare-fun res!788249 () Bool)

(assert (=> b!1185799 (=> (not res!788249) (not e!674214))))

(assert (=> b!1185799 (= res!788249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538341 mask!1564))))

(assert (=> b!1185799 (= lt!538341 (array!76600 (store (arr!36949 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37485 _keys!1208)))))

(declare-fun b!1185800 () Bool)

(assert (=> b!1185800 (= e!674212 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46679 () Bool)

(assert (=> mapIsEmpty!46679 mapRes!46679))

(declare-fun b!1185801 () Bool)

(assert (=> b!1185801 (= e!674213 e!674208)))

(declare-fun res!788253 () Bool)

(assert (=> b!1185801 (=> res!788253 e!674208)))

(assert (=> b!1185801 (= res!788253 (not (validKeyInArray!0 (select (arr!36949 _keys!1208) from!1455))))))

(assert (=> b!1185801 (= lt!538333 lt!538334)))

(assert (=> b!1185801 (= lt!538334 (-!1660 lt!538330 k0!934))))

(assert (=> b!1185801 (= lt!538333 (getCurrentListMapNoExtraKeys!5072 lt!538341 lt!538335 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185801 (= lt!538330 (getCurrentListMapNoExtraKeys!5072 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538337 () Unit!39291)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!875 (array!76599 array!76601 (_ BitVec 32) (_ BitVec 32) V!44995 V!44995 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39291)

(assert (=> b!1185801 (= lt!538337 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!875 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185802 () Bool)

(declare-fun Unit!39294 () Unit!39291)

(assert (=> b!1185802 (= e!674217 Unit!39294)))

(declare-fun b!1185803 () Bool)

(declare-fun res!788251 () Bool)

(assert (=> b!1185803 (=> (not res!788251) (not e!674207))))

(assert (=> b!1185803 (= res!788251 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37485 _keys!1208))))))

(declare-fun b!1185804 () Bool)

(assert (=> b!1185804 (= e!674211 tp_is_empty!29901)))

(declare-fun b!1185805 () Bool)

(declare-fun res!788256 () Bool)

(assert (=> b!1185805 (=> (not res!788256) (not e!674207))))

(assert (=> b!1185805 (= res!788256 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25991))))

(declare-fun b!1185806 () Bool)

(declare-fun res!788258 () Bool)

(assert (=> b!1185806 (=> (not res!788258) (not e!674207))))

(assert (=> b!1185806 (= res!788258 (= (select (arr!36949 _keys!1208) i!673) k0!934))))

(assert (= (and start!99792 res!788254) b!1185794))

(assert (= (and b!1185794 res!788261) b!1185798))

(assert (= (and b!1185798 res!788263) b!1185788))

(assert (= (and b!1185788 res!788252) b!1185805))

(assert (= (and b!1185805 res!788256) b!1185803))

(assert (= (and b!1185803 res!788251) b!1185789))

(assert (= (and b!1185789 res!788259) b!1185806))

(assert (= (and b!1185806 res!788258) b!1185799))

(assert (= (and b!1185799 res!788249) b!1185797))

(assert (= (and b!1185797 res!788262) b!1185791))

(assert (= (and b!1185791 (not res!788255)) b!1185795))

(assert (= (and b!1185795 (not res!788257)) b!1185801))

(assert (= (and b!1185801 (not res!788253)) b!1185796))

(assert (= (and b!1185796 res!788250) b!1185792))

(assert (= (and b!1185792 (not res!788260)) b!1185800))

(assert (= (and b!1185796 c!117180) b!1185790))

(assert (= (and b!1185796 (not c!117180)) b!1185802))

(assert (= (and b!1185793 condMapEmpty!46679) mapIsEmpty!46679))

(assert (= (and b!1185793 (not condMapEmpty!46679)) mapNonEmpty!46679))

(get-info :version)

(assert (= (and mapNonEmpty!46679 ((_ is ValueCellFull!14241) mapValue!46679)) b!1185787))

(assert (= (and b!1185793 ((_ is ValueCellFull!14241) mapDefault!46679)) b!1185804))

(assert (= start!99792 b!1185793))

(declare-fun b_lambda!20515 () Bool)

(assert (=> (not b_lambda!20515) (not b!1185795)))

(declare-fun t!38356 () Bool)

(declare-fun tb!10183 () Bool)

(assert (=> (and start!99792 (= defaultEntry!1004 defaultEntry!1004) t!38356) tb!10183))

(declare-fun result!20933 () Bool)

(assert (=> tb!10183 (= result!20933 tp_is_empty!29901)))

(assert (=> b!1185795 t!38356))

(declare-fun b_and!41611 () Bool)

(assert (= b_and!41609 (and (=> t!38356 result!20933) b_and!41611)))

(declare-fun m!1094245 () Bool)

(assert (=> b!1185790 m!1094245))

(declare-fun m!1094247 () Bool)

(assert (=> b!1185790 m!1094247))

(declare-fun m!1094249 () Bool)

(assert (=> b!1185790 m!1094249))

(declare-fun m!1094251 () Bool)

(assert (=> b!1185790 m!1094251))

(declare-fun m!1094253 () Bool)

(assert (=> b!1185790 m!1094253))

(declare-fun m!1094255 () Bool)

(assert (=> b!1185796 m!1094255))

(declare-fun m!1094257 () Bool)

(assert (=> b!1185796 m!1094257))

(assert (=> b!1185796 m!1094257))

(declare-fun m!1094259 () Bool)

(assert (=> b!1185796 m!1094259))

(declare-fun m!1094261 () Bool)

(assert (=> b!1185796 m!1094261))

(declare-fun m!1094263 () Bool)

(assert (=> b!1185796 m!1094263))

(declare-fun m!1094265 () Bool)

(assert (=> b!1185796 m!1094265))

(assert (=> b!1185796 m!1094261))

(declare-fun m!1094267 () Bool)

(assert (=> b!1185796 m!1094267))

(declare-fun m!1094269 () Bool)

(assert (=> mapNonEmpty!46679 m!1094269))

(declare-fun m!1094271 () Bool)

(assert (=> b!1185806 m!1094271))

(declare-fun m!1094273 () Bool)

(assert (=> b!1185788 m!1094273))

(declare-fun m!1094275 () Bool)

(assert (=> b!1185801 m!1094275))

(declare-fun m!1094277 () Bool)

(assert (=> b!1185801 m!1094277))

(assert (=> b!1185801 m!1094261))

(declare-fun m!1094279 () Bool)

(assert (=> b!1185801 m!1094279))

(assert (=> b!1185801 m!1094261))

(declare-fun m!1094281 () Bool)

(assert (=> b!1185801 m!1094281))

(declare-fun m!1094283 () Bool)

(assert (=> b!1185801 m!1094283))

(declare-fun m!1094285 () Bool)

(assert (=> b!1185795 m!1094285))

(declare-fun m!1094287 () Bool)

(assert (=> b!1185795 m!1094287))

(declare-fun m!1094289 () Bool)

(assert (=> b!1185795 m!1094289))

(declare-fun m!1094291 () Bool)

(assert (=> b!1185795 m!1094291))

(declare-fun m!1094293 () Bool)

(assert (=> b!1185800 m!1094293))

(declare-fun m!1094295 () Bool)

(assert (=> b!1185789 m!1094295))

(declare-fun m!1094297 () Bool)

(assert (=> b!1185805 m!1094297))

(declare-fun m!1094299 () Bool)

(assert (=> start!99792 m!1094299))

(declare-fun m!1094301 () Bool)

(assert (=> start!99792 m!1094301))

(assert (=> b!1185792 m!1094261))

(declare-fun m!1094303 () Bool)

(assert (=> b!1185794 m!1094303))

(declare-fun m!1094305 () Bool)

(assert (=> b!1185791 m!1094305))

(declare-fun m!1094307 () Bool)

(assert (=> b!1185791 m!1094307))

(declare-fun m!1094309 () Bool)

(assert (=> b!1185799 m!1094309))

(declare-fun m!1094311 () Bool)

(assert (=> b!1185799 m!1094311))

(declare-fun m!1094313 () Bool)

(assert (=> b!1185797 m!1094313))

(check-sat (not b_lambda!20515) (not b!1185789) (not b!1185800) (not mapNonEmpty!46679) (not b!1185797) (not start!99792) (not b!1185795) b_and!41611 (not b!1185791) (not b!1185801) tp_is_empty!29901 (not b!1185794) (not b!1185790) (not b!1185796) (not b!1185805) (not b_next!25371) (not b!1185799) (not b!1185788))
(check-sat b_and!41611 (not b_next!25371))
