; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97250 () Bool)

(assert start!97250)

(declare-fun b_free!23227 () Bool)

(declare-fun b_next!23227 () Bool)

(assert (=> start!97250 (= b_free!23227 (not b_next!23227))))

(declare-fun tp!81979 () Bool)

(declare-fun b_and!37259 () Bool)

(assert (=> start!97250 (= tp!81979 b_and!37259)))

(declare-datatypes ((V!41777 0))(
  ( (V!41778 (val!13800 Int)) )
))
(declare-fun zeroValue!944 () V!41777)

(declare-fun bm!46351 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17480 0))(
  ( (tuple2!17481 (_1!8751 (_ BitVec 64)) (_2!8751 V!41777)) )
))
(declare-datatypes ((List!24142 0))(
  ( (Nil!24139) (Cons!24138 (h!25347 tuple2!17480) (t!34406 List!24142)) )
))
(declare-datatypes ((ListLongMap!15449 0))(
  ( (ListLongMap!15450 (toList!7740 List!24142)) )
))
(declare-fun call!46354 () ListLongMap!15449)

(declare-datatypes ((array!71796 0))(
  ( (array!71797 (arr!34551 (Array (_ BitVec 32) (_ BitVec 64))) (size!35089 (_ BitVec 32))) )
))
(declare-fun lt!495358 () array!71796)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13034 0))(
  ( (ValueCellFull!13034 (v!16432 V!41777)) (EmptyCell!13034) )
))
(declare-datatypes ((array!71798 0))(
  ( (array!71799 (arr!34552 (Array (_ BitVec 32) ValueCell!13034)) (size!35090 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71798)

(declare-fun minValue!944 () V!41777)

(declare-fun getCurrentListMapNoExtraKeys!4259 (array!71796 array!71798 (_ BitVec 32) (_ BitVec 32) V!41777 V!41777 (_ BitVec 32) Int) ListLongMap!15449)

(declare-fun dynLambda!2328 (Int (_ BitVec 64)) V!41777)

(assert (=> bm!46351 (= call!46354 (getCurrentListMapNoExtraKeys!4259 lt!495358 (array!71799 (store (arr!34552 _values!996) i!673 (ValueCellFull!13034 (dynLambda!2328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35090 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1106892 () Bool)

(declare-fun res!738751 () Bool)

(declare-fun e!631566 () Bool)

(assert (=> b!1106892 (=> (not res!738751) (not e!631566))))

(declare-fun _keys!1208 () array!71796)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71796 (_ BitVec 32)) Bool)

(assert (=> b!1106892 (= res!738751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106893 () Bool)

(declare-fun e!631568 () Bool)

(declare-fun e!631570 () Bool)

(declare-fun mapRes!43048 () Bool)

(assert (=> b!1106893 (= e!631568 (and e!631570 mapRes!43048))))

(declare-fun condMapEmpty!43048 () Bool)

(declare-fun mapDefault!43048 () ValueCell!13034)

(assert (=> b!1106893 (= condMapEmpty!43048 (= (arr!34552 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13034)) mapDefault!43048)))))

(declare-fun b!1106894 () Bool)

(declare-fun e!631567 () Bool)

(declare-fun e!631565 () Bool)

(assert (=> b!1106894 (= e!631567 (not e!631565))))

(declare-fun res!738741 () Bool)

(assert (=> b!1106894 (=> res!738741 e!631565)))

(assert (=> b!1106894 (= res!738741 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35089 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106894 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36145 0))(
  ( (Unit!36146) )
))
(declare-fun lt!495359 () Unit!36145)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71796 (_ BitVec 64) (_ BitVec 32)) Unit!36145)

(assert (=> b!1106894 (= lt!495359 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!738747 () Bool)

(assert (=> start!97250 (=> (not res!738747) (not e!631566))))

(assert (=> start!97250 (= res!738747 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35089 _keys!1208))))))

(assert (=> start!97250 e!631566))

(declare-fun tp_is_empty!27487 () Bool)

(assert (=> start!97250 tp_is_empty!27487))

(declare-fun array_inv!26644 (array!71796) Bool)

(assert (=> start!97250 (array_inv!26644 _keys!1208)))

(assert (=> start!97250 true))

(assert (=> start!97250 tp!81979))

(declare-fun array_inv!26645 (array!71798) Bool)

(assert (=> start!97250 (and (array_inv!26645 _values!996) e!631568)))

(declare-fun mapNonEmpty!43048 () Bool)

(declare-fun tp!81980 () Bool)

(declare-fun e!631572 () Bool)

(assert (=> mapNonEmpty!43048 (= mapRes!43048 (and tp!81980 e!631572))))

(declare-fun mapValue!43048 () ValueCell!13034)

(declare-fun mapKey!43048 () (_ BitVec 32))

(declare-fun mapRest!43048 () (Array (_ BitVec 32) ValueCell!13034))

(assert (=> mapNonEmpty!43048 (= (arr!34552 _values!996) (store mapRest!43048 mapKey!43048 mapValue!43048))))

(declare-fun b!1106895 () Bool)

(assert (=> b!1106895 (= e!631570 tp_is_empty!27487)))

(declare-fun b!1106896 () Bool)

(declare-fun res!738743 () Bool)

(assert (=> b!1106896 (=> (not res!738743) (not e!631566))))

(assert (=> b!1106896 (= res!738743 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35089 _keys!1208))))))

(declare-fun b!1106897 () Bool)

(declare-fun res!738750 () Bool)

(assert (=> b!1106897 (=> (not res!738750) (not e!631566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106897 (= res!738750 (validMask!0 mask!1564))))

(declare-fun b!1106898 () Bool)

(declare-fun call!46355 () ListLongMap!15449)

(declare-fun e!631569 () Bool)

(declare-fun -!967 (ListLongMap!15449 (_ BitVec 64)) ListLongMap!15449)

(assert (=> b!1106898 (= e!631569 (= call!46354 (-!967 call!46355 k0!934)))))

(declare-fun b!1106899 () Bool)

(declare-fun res!738748 () Bool)

(assert (=> b!1106899 (=> (not res!738748) (not e!631566))))

(assert (=> b!1106899 (= res!738748 (and (= (size!35090 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35089 _keys!1208) (size!35090 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106900 () Bool)

(declare-fun res!738749 () Bool)

(assert (=> b!1106900 (=> (not res!738749) (not e!631566))))

(declare-datatypes ((List!24143 0))(
  ( (Nil!24140) (Cons!24139 (h!25348 (_ BitVec 64)) (t!34407 List!24143)) )
))
(declare-fun arrayNoDuplicates!0 (array!71796 (_ BitVec 32) List!24143) Bool)

(assert (=> b!1106900 (= res!738749 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24140))))

(declare-fun b!1106901 () Bool)

(assert (=> b!1106901 (= e!631572 tp_is_empty!27487)))

(declare-fun b!1106902 () Bool)

(declare-fun res!738745 () Bool)

(assert (=> b!1106902 (=> (not res!738745) (not e!631566))))

(assert (=> b!1106902 (= res!738745 (= (select (arr!34551 _keys!1208) i!673) k0!934))))

(declare-fun b!1106903 () Bool)

(assert (=> b!1106903 (= e!631566 e!631567)))

(declare-fun res!738742 () Bool)

(assert (=> b!1106903 (=> (not res!738742) (not e!631567))))

(assert (=> b!1106903 (= res!738742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495358 mask!1564))))

(assert (=> b!1106903 (= lt!495358 (array!71797 (store (arr!34551 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35089 _keys!1208)))))

(declare-fun b!1106904 () Bool)

(declare-fun res!738746 () Bool)

(assert (=> b!1106904 (=> (not res!738746) (not e!631567))))

(assert (=> b!1106904 (= res!738746 (arrayNoDuplicates!0 lt!495358 #b00000000000000000000000000000000 Nil!24140))))

(declare-fun bm!46352 () Bool)

(assert (=> bm!46352 (= call!46355 (getCurrentListMapNoExtraKeys!4259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43048 () Bool)

(assert (=> mapIsEmpty!43048 mapRes!43048))

(declare-fun b!1106905 () Bool)

(declare-fun res!738744 () Bool)

(assert (=> b!1106905 (=> (not res!738744) (not e!631566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106905 (= res!738744 (validKeyInArray!0 k0!934))))

(declare-fun b!1106906 () Bool)

(assert (=> b!1106906 (= e!631569 (= call!46354 call!46355))))

(declare-fun b!1106907 () Bool)

(assert (=> b!1106907 (= e!631565 true)))

(assert (=> b!1106907 e!631569))

(declare-fun c!108981 () Bool)

(assert (=> b!1106907 (= c!108981 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495360 () Unit!36145)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!241 (array!71796 array!71798 (_ BitVec 32) (_ BitVec 32) V!41777 V!41777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36145)

(assert (=> b!1106907 (= lt!495360 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!241 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97250 res!738747) b!1106897))

(assert (= (and b!1106897 res!738750) b!1106899))

(assert (= (and b!1106899 res!738748) b!1106892))

(assert (= (and b!1106892 res!738751) b!1106900))

(assert (= (and b!1106900 res!738749) b!1106896))

(assert (= (and b!1106896 res!738743) b!1106905))

(assert (= (and b!1106905 res!738744) b!1106902))

(assert (= (and b!1106902 res!738745) b!1106903))

(assert (= (and b!1106903 res!738742) b!1106904))

(assert (= (and b!1106904 res!738746) b!1106894))

(assert (= (and b!1106894 (not res!738741)) b!1106907))

(assert (= (and b!1106907 c!108981) b!1106898))

(assert (= (and b!1106907 (not c!108981)) b!1106906))

(assert (= (or b!1106898 b!1106906) bm!46351))

(assert (= (or b!1106898 b!1106906) bm!46352))

(assert (= (and b!1106893 condMapEmpty!43048) mapIsEmpty!43048))

(assert (= (and b!1106893 (not condMapEmpty!43048)) mapNonEmpty!43048))

(get-info :version)

(assert (= (and mapNonEmpty!43048 ((_ is ValueCellFull!13034) mapValue!43048)) b!1106901))

(assert (= (and b!1106893 ((_ is ValueCellFull!13034) mapDefault!43048)) b!1106895))

(assert (= start!97250 b!1106893))

(declare-fun b_lambda!18223 () Bool)

(assert (=> (not b_lambda!18223) (not bm!46351)))

(declare-fun t!34405 () Bool)

(declare-fun tb!8085 () Bool)

(assert (=> (and start!97250 (= defaultEntry!1004 defaultEntry!1004) t!34405) tb!8085))

(declare-fun result!16739 () Bool)

(assert (=> tb!8085 (= result!16739 tp_is_empty!27487)))

(assert (=> bm!46351 t!34405))

(declare-fun b_and!37261 () Bool)

(assert (= b_and!37259 (and (=> t!34405 result!16739) b_and!37261)))

(declare-fun m!1025289 () Bool)

(assert (=> b!1106898 m!1025289))

(declare-fun m!1025291 () Bool)

(assert (=> b!1106902 m!1025291))

(declare-fun m!1025293 () Bool)

(assert (=> mapNonEmpty!43048 m!1025293))

(declare-fun m!1025295 () Bool)

(assert (=> bm!46352 m!1025295))

(declare-fun m!1025297 () Bool)

(assert (=> b!1106897 m!1025297))

(declare-fun m!1025299 () Bool)

(assert (=> bm!46351 m!1025299))

(declare-fun m!1025301 () Bool)

(assert (=> bm!46351 m!1025301))

(declare-fun m!1025303 () Bool)

(assert (=> bm!46351 m!1025303))

(declare-fun m!1025305 () Bool)

(assert (=> start!97250 m!1025305))

(declare-fun m!1025307 () Bool)

(assert (=> start!97250 m!1025307))

(declare-fun m!1025309 () Bool)

(assert (=> b!1106892 m!1025309))

(declare-fun m!1025311 () Bool)

(assert (=> b!1106907 m!1025311))

(declare-fun m!1025313 () Bool)

(assert (=> b!1106903 m!1025313))

(declare-fun m!1025315 () Bool)

(assert (=> b!1106903 m!1025315))

(declare-fun m!1025317 () Bool)

(assert (=> b!1106900 m!1025317))

(declare-fun m!1025319 () Bool)

(assert (=> b!1106905 m!1025319))

(declare-fun m!1025321 () Bool)

(assert (=> b!1106894 m!1025321))

(declare-fun m!1025323 () Bool)

(assert (=> b!1106894 m!1025323))

(declare-fun m!1025325 () Bool)

(assert (=> b!1106904 m!1025325))

(check-sat (not b!1106897) (not bm!46352) (not b!1106900) (not b!1106898) (not b!1106903) (not bm!46351) (not start!97250) (not b!1106907) (not b!1106894) tp_is_empty!27487 (not b!1106892) (not mapNonEmpty!43048) b_and!37261 (not b!1106904) (not b!1106905) (not b_next!23227) (not b_lambda!18223))
(check-sat b_and!37261 (not b_next!23227))
