; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97978 () Bool)

(assert start!97978)

(declare-fun b_free!23679 () Bool)

(declare-fun b_next!23679 () Bool)

(assert (=> start!97978 (= b_free!23679 (not b_next!23679))))

(declare-fun tp!83741 () Bool)

(declare-fun b_and!38141 () Bool)

(assert (=> start!97978 (= tp!83741 b_and!38141)))

(declare-fun b!1123418 () Bool)

(declare-fun e!639564 () Bool)

(declare-fun e!639559 () Bool)

(declare-fun mapRes!44131 () Bool)

(assert (=> b!1123418 (= e!639564 (and e!639559 mapRes!44131))))

(declare-fun condMapEmpty!44131 () Bool)

(declare-datatypes ((V!42739 0))(
  ( (V!42740 (val!14161 Int)) )
))
(declare-datatypes ((ValueCell!13395 0))(
  ( (ValueCellFull!13395 (v!16794 V!42739)) (EmptyCell!13395) )
))
(declare-datatypes ((array!73287 0))(
  ( (array!73288 (arr!35296 (Array (_ BitVec 32) ValueCell!13395)) (size!35832 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73287)

(declare-fun mapDefault!44131 () ValueCell!13395)

(assert (=> b!1123418 (= condMapEmpty!44131 (= (arr!35296 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13395)) mapDefault!44131)))))

(declare-fun b!1123419 () Bool)

(declare-fun e!639565 () Bool)

(declare-fun tp_is_empty!28209 () Bool)

(assert (=> b!1123419 (= e!639565 tp_is_empty!28209)))

(declare-fun zeroValue!944 () V!42739)

(declare-datatypes ((tuple2!17784 0))(
  ( (tuple2!17785 (_1!8903 (_ BitVec 64)) (_2!8903 V!42739)) )
))
(declare-datatypes ((List!24563 0))(
  ( (Nil!24560) (Cons!24559 (h!25768 tuple2!17784) (t!35234 List!24563)) )
))
(declare-datatypes ((ListLongMap!15753 0))(
  ( (ListLongMap!15754 (toList!7892 List!24563)) )
))
(declare-fun call!47319 () ListLongMap!15753)

(declare-datatypes ((array!73289 0))(
  ( (array!73290 (arr!35297 (Array (_ BitVec 32) (_ BitVec 64))) (size!35833 (_ BitVec 32))) )
))
(declare-fun lt!499079 () array!73289)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47316 () Bool)

(declare-fun lt!499077 () array!73287)

(declare-fun minValue!944 () V!42739)

(declare-fun getCurrentListMapNoExtraKeys!4380 (array!73289 array!73287 (_ BitVec 32) (_ BitVec 32) V!42739 V!42739 (_ BitVec 32) Int) ListLongMap!15753)

(assert (=> bm!47316 (= call!47319 (getCurrentListMapNoExtraKeys!4380 lt!499079 lt!499077 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47317 () Bool)

(declare-fun _keys!1208 () array!73289)

(declare-fun call!47320 () ListLongMap!15753)

(assert (=> bm!47317 (= call!47320 (getCurrentListMapNoExtraKeys!4380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123420 () Bool)

(assert (=> b!1123420 (= e!639559 tp_is_empty!28209)))

(declare-fun mapNonEmpty!44131 () Bool)

(declare-fun tp!83740 () Bool)

(assert (=> mapNonEmpty!44131 (= mapRes!44131 (and tp!83740 e!639565))))

(declare-fun mapRest!44131 () (Array (_ BitVec 32) ValueCell!13395))

(declare-fun mapValue!44131 () ValueCell!13395)

(declare-fun mapKey!44131 () (_ BitVec 32))

(assert (=> mapNonEmpty!44131 (= (arr!35296 _values!996) (store mapRest!44131 mapKey!44131 mapValue!44131))))

(declare-fun mapIsEmpty!44131 () Bool)

(assert (=> mapIsEmpty!44131 mapRes!44131))

(declare-fun b!1123421 () Bool)

(declare-fun res!750570 () Bool)

(declare-fun e!639562 () Bool)

(assert (=> b!1123421 (=> (not res!750570) (not e!639562))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1123421 (= res!750570 (= (select (arr!35297 _keys!1208) i!673) k0!934))))

(declare-fun b!1123422 () Bool)

(declare-fun res!750559 () Bool)

(declare-fun e!639563 () Bool)

(assert (=> b!1123422 (=> res!750559 e!639563)))

(declare-fun contains!6432 (ListLongMap!15753 (_ BitVec 64)) Bool)

(assert (=> b!1123422 (= res!750559 (not (contains!6432 (getCurrentListMapNoExtraKeys!4380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(declare-fun b!1123423 () Bool)

(assert (=> b!1123423 (= e!639563 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35833 _keys!1208)))))))

(declare-fun b!1123424 () Bool)

(declare-fun e!639558 () Bool)

(declare-fun e!639560 () Bool)

(assert (=> b!1123424 (= e!639558 (not e!639560))))

(declare-fun res!750571 () Bool)

(assert (=> b!1123424 (=> res!750571 e!639560)))

(assert (=> b!1123424 (= res!750571 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123424 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36840 0))(
  ( (Unit!36841) )
))
(declare-fun lt!499076 () Unit!36840)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73289 (_ BitVec 64) (_ BitVec 32)) Unit!36840)

(assert (=> b!1123424 (= lt!499076 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123425 () Bool)

(assert (=> b!1123425 (= e!639562 e!639558)))

(declare-fun res!750565 () Bool)

(assert (=> b!1123425 (=> (not res!750565) (not e!639558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73289 (_ BitVec 32)) Bool)

(assert (=> b!1123425 (= res!750565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499079 mask!1564))))

(assert (=> b!1123425 (= lt!499079 (array!73290 (store (arr!35297 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35833 _keys!1208)))))

(declare-fun b!1123426 () Bool)

(declare-fun res!750564 () Bool)

(assert (=> b!1123426 (=> (not res!750564) (not e!639562))))

(assert (=> b!1123426 (= res!750564 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35833 _keys!1208))))))

(declare-fun b!1123427 () Bool)

(declare-fun res!750563 () Bool)

(assert (=> b!1123427 (=> (not res!750563) (not e!639562))))

(declare-datatypes ((List!24564 0))(
  ( (Nil!24561) (Cons!24560 (h!25769 (_ BitVec 64)) (t!35235 List!24564)) )
))
(declare-fun arrayNoDuplicates!0 (array!73289 (_ BitVec 32) List!24564) Bool)

(assert (=> b!1123427 (= res!750563 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24561))))

(declare-fun b!1123428 () Bool)

(declare-fun e!639561 () Bool)

(assert (=> b!1123428 (= e!639560 e!639561)))

(declare-fun res!750569 () Bool)

(assert (=> b!1123428 (=> res!750569 e!639561)))

(assert (=> b!1123428 (= res!750569 (not (= from!1455 i!673)))))

(declare-fun lt!499075 () ListLongMap!15753)

(assert (=> b!1123428 (= lt!499075 (getCurrentListMapNoExtraKeys!4380 lt!499079 lt!499077 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2476 (Int (_ BitVec 64)) V!42739)

(assert (=> b!1123428 (= lt!499077 (array!73288 (store (arr!35296 _values!996) i!673 (ValueCellFull!13395 (dynLambda!2476 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35832 _values!996)))))

(declare-fun lt!499078 () ListLongMap!15753)

(assert (=> b!1123428 (= lt!499078 (getCurrentListMapNoExtraKeys!4380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123429 () Bool)

(declare-fun res!750558 () Bool)

(assert (=> b!1123429 (=> (not res!750558) (not e!639562))))

(assert (=> b!1123429 (= res!750558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123430 () Bool)

(declare-fun res!750567 () Bool)

(assert (=> b!1123430 (=> (not res!750567) (not e!639558))))

(assert (=> b!1123430 (= res!750567 (arrayNoDuplicates!0 lt!499079 #b00000000000000000000000000000000 Nil!24561))))

(declare-fun b!1123431 () Bool)

(declare-fun res!750568 () Bool)

(assert (=> b!1123431 (=> (not res!750568) (not e!639562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123431 (= res!750568 (validMask!0 mask!1564))))

(declare-fun b!1123432 () Bool)

(declare-fun res!750560 () Bool)

(assert (=> b!1123432 (=> (not res!750560) (not e!639562))))

(assert (=> b!1123432 (= res!750560 (and (= (size!35832 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35833 _keys!1208) (size!35832 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!750561 () Bool)

(assert (=> start!97978 (=> (not res!750561) (not e!639562))))

(assert (=> start!97978 (= res!750561 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35833 _keys!1208))))))

(assert (=> start!97978 e!639562))

(assert (=> start!97978 tp_is_empty!28209))

(declare-fun array_inv!27098 (array!73289) Bool)

(assert (=> start!97978 (array_inv!27098 _keys!1208)))

(assert (=> start!97978 true))

(assert (=> start!97978 tp!83741))

(declare-fun array_inv!27099 (array!73287) Bool)

(assert (=> start!97978 (and (array_inv!27099 _values!996) e!639564)))

(declare-fun e!639567 () Bool)

(declare-fun b!1123433 () Bool)

(declare-fun -!1097 (ListLongMap!15753 (_ BitVec 64)) ListLongMap!15753)

(assert (=> b!1123433 (= e!639567 (= call!47319 (-!1097 call!47320 k0!934)))))

(declare-fun b!1123434 () Bool)

(assert (=> b!1123434 (= e!639567 (= call!47319 call!47320))))

(declare-fun b!1123435 () Bool)

(declare-fun res!750566 () Bool)

(assert (=> b!1123435 (=> (not res!750566) (not e!639562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123435 (= res!750566 (validKeyInArray!0 k0!934))))

(declare-fun b!1123436 () Bool)

(assert (=> b!1123436 (= e!639561 e!639563)))

(declare-fun res!750562 () Bool)

(assert (=> b!1123436 (=> res!750562 e!639563)))

(assert (=> b!1123436 (= res!750562 (not (= (select (arr!35297 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123436 e!639567))

(declare-fun c!109509 () Bool)

(assert (=> b!1123436 (= c!109509 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499074 () Unit!36840)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!345 (array!73289 array!73287 (_ BitVec 32) (_ BitVec 32) V!42739 V!42739 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36840)

(assert (=> b!1123436 (= lt!499074 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97978 res!750561) b!1123431))

(assert (= (and b!1123431 res!750568) b!1123432))

(assert (= (and b!1123432 res!750560) b!1123429))

(assert (= (and b!1123429 res!750558) b!1123427))

(assert (= (and b!1123427 res!750563) b!1123426))

(assert (= (and b!1123426 res!750564) b!1123435))

(assert (= (and b!1123435 res!750566) b!1123421))

(assert (= (and b!1123421 res!750570) b!1123425))

(assert (= (and b!1123425 res!750565) b!1123430))

(assert (= (and b!1123430 res!750567) b!1123424))

(assert (= (and b!1123424 (not res!750571)) b!1123428))

(assert (= (and b!1123428 (not res!750569)) b!1123436))

(assert (= (and b!1123436 c!109509) b!1123433))

(assert (= (and b!1123436 (not c!109509)) b!1123434))

(assert (= (or b!1123433 b!1123434) bm!47316))

(assert (= (or b!1123433 b!1123434) bm!47317))

(assert (= (and b!1123436 (not res!750562)) b!1123422))

(assert (= (and b!1123422 (not res!750559)) b!1123423))

(assert (= (and b!1123418 condMapEmpty!44131) mapIsEmpty!44131))

(assert (= (and b!1123418 (not condMapEmpty!44131)) mapNonEmpty!44131))

(get-info :version)

(assert (= (and mapNonEmpty!44131 ((_ is ValueCellFull!13395) mapValue!44131)) b!1123419))

(assert (= (and b!1123418 ((_ is ValueCellFull!13395) mapDefault!44131)) b!1123420))

(assert (= start!97978 b!1123418))

(declare-fun b_lambda!18649 () Bool)

(assert (=> (not b_lambda!18649) (not b!1123428)))

(declare-fun t!35233 () Bool)

(declare-fun tb!8491 () Bool)

(assert (=> (and start!97978 (= defaultEntry!1004 defaultEntry!1004) t!35233) tb!8491))

(declare-fun result!17543 () Bool)

(assert (=> tb!8491 (= result!17543 tp_is_empty!28209)))

(assert (=> b!1123428 t!35233))

(declare-fun b_and!38143 () Bool)

(assert (= b_and!38141 (and (=> t!35233 result!17543) b_and!38143)))

(declare-fun m!1037891 () Bool)

(assert (=> b!1123435 m!1037891))

(declare-fun m!1037893 () Bool)

(assert (=> bm!47316 m!1037893))

(declare-fun m!1037895 () Bool)

(assert (=> b!1123421 m!1037895))

(declare-fun m!1037897 () Bool)

(assert (=> b!1123427 m!1037897))

(declare-fun m!1037899 () Bool)

(assert (=> b!1123433 m!1037899))

(declare-fun m!1037901 () Bool)

(assert (=> mapNonEmpty!44131 m!1037901))

(declare-fun m!1037903 () Bool)

(assert (=> bm!47317 m!1037903))

(declare-fun m!1037905 () Bool)

(assert (=> b!1123436 m!1037905))

(declare-fun m!1037907 () Bool)

(assert (=> b!1123436 m!1037907))

(declare-fun m!1037909 () Bool)

(assert (=> b!1123428 m!1037909))

(declare-fun m!1037911 () Bool)

(assert (=> b!1123428 m!1037911))

(declare-fun m!1037913 () Bool)

(assert (=> b!1123428 m!1037913))

(declare-fun m!1037915 () Bool)

(assert (=> b!1123428 m!1037915))

(declare-fun m!1037917 () Bool)

(assert (=> b!1123431 m!1037917))

(declare-fun m!1037919 () Bool)

(assert (=> start!97978 m!1037919))

(declare-fun m!1037921 () Bool)

(assert (=> start!97978 m!1037921))

(declare-fun m!1037923 () Bool)

(assert (=> b!1123425 m!1037923))

(declare-fun m!1037925 () Bool)

(assert (=> b!1123425 m!1037925))

(declare-fun m!1037927 () Bool)

(assert (=> b!1123430 m!1037927))

(declare-fun m!1037929 () Bool)

(assert (=> b!1123429 m!1037929))

(declare-fun m!1037931 () Bool)

(assert (=> b!1123424 m!1037931))

(declare-fun m!1037933 () Bool)

(assert (=> b!1123424 m!1037933))

(assert (=> b!1123422 m!1037903))

(assert (=> b!1123422 m!1037903))

(declare-fun m!1037935 () Bool)

(assert (=> b!1123422 m!1037935))

(check-sat (not bm!47317) (not start!97978) (not b!1123435) (not b!1123433) (not b!1123424) (not b!1123436) (not b!1123429) (not b!1123425) (not b!1123430) (not bm!47316) tp_is_empty!28209 b_and!38143 (not b_next!23679) (not b_lambda!18649) (not b!1123422) (not b!1123431) (not mapNonEmpty!44131) (not b!1123428) (not b!1123427))
(check-sat b_and!38143 (not b_next!23679))
