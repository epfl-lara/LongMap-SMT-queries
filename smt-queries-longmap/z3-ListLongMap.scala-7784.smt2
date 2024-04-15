; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97442 () Bool)

(assert start!97442)

(declare-fun b_free!23419 () Bool)

(declare-fun b_next!23419 () Bool)

(assert (=> start!97442 (= b_free!23419 (not b_next!23419))))

(declare-fun tp!82556 () Bool)

(declare-fun b_and!37653 () Bool)

(assert (=> start!97442 (= tp!82556 b_and!37653)))

(declare-fun b!1111753 () Bool)

(declare-fun res!741911 () Bool)

(declare-fun e!633903 () Bool)

(assert (=> b!1111753 (=> (not res!741911) (not e!633903))))

(declare-datatypes ((array!72168 0))(
  ( (array!72169 (arr!34737 (Array (_ BitVec 32) (_ BitVec 64))) (size!35275 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72168)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1111753 (= res!741911 (= (select (arr!34737 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43336 () Bool)

(declare-fun mapRes!43336 () Bool)

(declare-fun tp!82555 () Bool)

(declare-fun e!633899 () Bool)

(assert (=> mapNonEmpty!43336 (= mapRes!43336 (and tp!82555 e!633899))))

(declare-fun mapKey!43336 () (_ BitVec 32))

(declare-datatypes ((V!42033 0))(
  ( (V!42034 (val!13896 Int)) )
))
(declare-datatypes ((ValueCell!13130 0))(
  ( (ValueCellFull!13130 (v!16528 V!42033)) (EmptyCell!13130) )
))
(declare-fun mapValue!43336 () ValueCell!13130)

(declare-fun mapRest!43336 () (Array (_ BitVec 32) ValueCell!13130))

(declare-datatypes ((array!72170 0))(
  ( (array!72171 (arr!34738 (Array (_ BitVec 32) ValueCell!13130)) (size!35276 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72170)

(assert (=> mapNonEmpty!43336 (= (arr!34738 _values!996) (store mapRest!43336 mapKey!43336 mapValue!43336))))

(declare-fun b!1111754 () Bool)

(declare-fun res!741912 () Bool)

(assert (=> b!1111754 (=> (not res!741912) (not e!633903))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72168 (_ BitVec 32)) Bool)

(assert (=> b!1111754 (= res!741912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111755 () Bool)

(declare-fun tp_is_empty!27679 () Bool)

(assert (=> b!1111755 (= e!633899 tp_is_empty!27679)))

(declare-fun b!1111756 () Bool)

(declare-fun res!741917 () Bool)

(assert (=> b!1111756 (=> (not res!741917) (not e!633903))))

(assert (=> b!1111756 (= res!741917 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35275 _keys!1208))))))

(declare-fun b!1111757 () Bool)

(declare-fun res!741919 () Bool)

(assert (=> b!1111757 (=> (not res!741919) (not e!633903))))

(declare-datatypes ((List!24304 0))(
  ( (Nil!24301) (Cons!24300 (h!25509 (_ BitVec 64)) (t!34760 List!24304)) )
))
(declare-fun arrayNoDuplicates!0 (array!72168 (_ BitVec 32) List!24304) Bool)

(assert (=> b!1111757 (= res!741919 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24301))))

(declare-fun b!1111758 () Bool)

(declare-fun e!633905 () Bool)

(declare-fun e!633902 () Bool)

(assert (=> b!1111758 (= e!633905 (not e!633902))))

(declare-fun res!741915 () Bool)

(assert (=> b!1111758 (=> res!741915 e!633902)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1111758 (= res!741915 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35275 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111758 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36299 0))(
  ( (Unit!36300) )
))
(declare-fun lt!496222 () Unit!36299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72168 (_ BitVec 64) (_ BitVec 32)) Unit!36299)

(assert (=> b!1111758 (= lt!496222 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111759 () Bool)

(assert (=> b!1111759 (= e!633903 e!633905)))

(declare-fun res!741914 () Bool)

(assert (=> b!1111759 (=> (not res!741914) (not e!633905))))

(declare-fun lt!496223 () array!72168)

(assert (=> b!1111759 (= res!741914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496223 mask!1564))))

(assert (=> b!1111759 (= lt!496223 (array!72169 (store (arr!34737 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35275 _keys!1208)))))

(declare-fun b!1111760 () Bool)

(declare-fun res!741909 () Bool)

(assert (=> b!1111760 (=> (not res!741909) (not e!633903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111760 (= res!741909 (validKeyInArray!0 k0!934))))

(declare-datatypes ((tuple2!17652 0))(
  ( (tuple2!17653 (_1!8837 (_ BitVec 64)) (_2!8837 V!42033)) )
))
(declare-datatypes ((List!24305 0))(
  ( (Nil!24302) (Cons!24301 (h!25510 tuple2!17652) (t!34761 List!24305)) )
))
(declare-datatypes ((ListLongMap!15621 0))(
  ( (ListLongMap!15622 (toList!7826 List!24305)) )
))
(declare-fun call!46931 () ListLongMap!15621)

(declare-fun call!46930 () ListLongMap!15621)

(declare-fun b!1111752 () Bool)

(declare-fun e!633900 () Bool)

(declare-fun -!1036 (ListLongMap!15621 (_ BitVec 64)) ListLongMap!15621)

(assert (=> b!1111752 (= e!633900 (= call!46931 (-!1036 call!46930 k0!934)))))

(declare-fun res!741918 () Bool)

(assert (=> start!97442 (=> (not res!741918) (not e!633903))))

(assert (=> start!97442 (= res!741918 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35275 _keys!1208))))))

(assert (=> start!97442 e!633903))

(assert (=> start!97442 tp_is_empty!27679))

(declare-fun array_inv!26778 (array!72168) Bool)

(assert (=> start!97442 (array_inv!26778 _keys!1208)))

(assert (=> start!97442 true))

(assert (=> start!97442 tp!82556))

(declare-fun e!633906 () Bool)

(declare-fun array_inv!26779 (array!72170) Bool)

(assert (=> start!97442 (and (array_inv!26779 _values!996) e!633906)))

(declare-fun b!1111761 () Bool)

(assert (=> b!1111761 (= e!633902 true)))

(assert (=> b!1111761 e!633900))

(declare-fun c!109299 () Bool)

(assert (=> b!1111761 (= c!109299 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42033)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!496224 () Unit!36299)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42033)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!309 (array!72168 array!72170 (_ BitVec 32) (_ BitVec 32) V!42033 V!42033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36299)

(assert (=> b!1111761 (= lt!496224 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111762 () Bool)

(declare-fun e!633904 () Bool)

(assert (=> b!1111762 (= e!633906 (and e!633904 mapRes!43336))))

(declare-fun condMapEmpty!43336 () Bool)

(declare-fun mapDefault!43336 () ValueCell!13130)

(assert (=> b!1111762 (= condMapEmpty!43336 (= (arr!34738 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13130)) mapDefault!43336)))))

(declare-fun b!1111763 () Bool)

(declare-fun res!741913 () Bool)

(assert (=> b!1111763 (=> (not res!741913) (not e!633905))))

(assert (=> b!1111763 (= res!741913 (arrayNoDuplicates!0 lt!496223 #b00000000000000000000000000000000 Nil!24301))))

(declare-fun mapIsEmpty!43336 () Bool)

(assert (=> mapIsEmpty!43336 mapRes!43336))

(declare-fun b!1111764 () Bool)

(assert (=> b!1111764 (= e!633900 (= call!46931 call!46930))))

(declare-fun b!1111765 () Bool)

(declare-fun res!741916 () Bool)

(assert (=> b!1111765 (=> (not res!741916) (not e!633903))))

(assert (=> b!1111765 (= res!741916 (and (= (size!35276 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35275 _keys!1208) (size!35276 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111766 () Bool)

(declare-fun res!741910 () Bool)

(assert (=> b!1111766 (=> (not res!741910) (not e!633903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111766 (= res!741910 (validMask!0 mask!1564))))

(declare-fun bm!46927 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4336 (array!72168 array!72170 (_ BitVec 32) (_ BitVec 32) V!42033 V!42033 (_ BitVec 32) Int) ListLongMap!15621)

(assert (=> bm!46927 (= call!46930 (getCurrentListMapNoExtraKeys!4336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46928 () Bool)

(declare-fun dynLambda!2399 (Int (_ BitVec 64)) V!42033)

(assert (=> bm!46928 (= call!46931 (getCurrentListMapNoExtraKeys!4336 lt!496223 (array!72171 (store (arr!34738 _values!996) i!673 (ValueCellFull!13130 (dynLambda!2399 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35276 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111767 () Bool)

(assert (=> b!1111767 (= e!633904 tp_is_empty!27679)))

(assert (= (and start!97442 res!741918) b!1111766))

(assert (= (and b!1111766 res!741910) b!1111765))

(assert (= (and b!1111765 res!741916) b!1111754))

(assert (= (and b!1111754 res!741912) b!1111757))

(assert (= (and b!1111757 res!741919) b!1111756))

(assert (= (and b!1111756 res!741917) b!1111760))

(assert (= (and b!1111760 res!741909) b!1111753))

(assert (= (and b!1111753 res!741911) b!1111759))

(assert (= (and b!1111759 res!741914) b!1111763))

(assert (= (and b!1111763 res!741913) b!1111758))

(assert (= (and b!1111758 (not res!741915)) b!1111761))

(assert (= (and b!1111761 c!109299) b!1111752))

(assert (= (and b!1111761 (not c!109299)) b!1111764))

(assert (= (or b!1111752 b!1111764) bm!46928))

(assert (= (or b!1111752 b!1111764) bm!46927))

(assert (= (and b!1111762 condMapEmpty!43336) mapIsEmpty!43336))

(assert (= (and b!1111762 (not condMapEmpty!43336)) mapNonEmpty!43336))

(get-info :version)

(assert (= (and mapNonEmpty!43336 ((_ is ValueCellFull!13130) mapValue!43336)) b!1111755))

(assert (= (and b!1111762 ((_ is ValueCellFull!13130) mapDefault!43336)) b!1111767))

(assert (= start!97442 b!1111762))

(declare-fun b_lambda!18425 () Bool)

(assert (=> (not b_lambda!18425) (not bm!46928)))

(declare-fun t!34759 () Bool)

(declare-fun tb!8277 () Bool)

(assert (=> (and start!97442 (= defaultEntry!1004 defaultEntry!1004) t!34759) tb!8277))

(declare-fun result!17123 () Bool)

(assert (=> tb!8277 (= result!17123 tp_is_empty!27679)))

(assert (=> bm!46928 t!34759))

(declare-fun b_and!37655 () Bool)

(assert (= b_and!37653 (and (=> t!34759 result!17123) b_and!37655)))

(declare-fun m!1028937 () Bool)

(assert (=> bm!46928 m!1028937))

(declare-fun m!1028939 () Bool)

(assert (=> bm!46928 m!1028939))

(declare-fun m!1028941 () Bool)

(assert (=> bm!46928 m!1028941))

(declare-fun m!1028943 () Bool)

(assert (=> mapNonEmpty!43336 m!1028943))

(declare-fun m!1028945 () Bool)

(assert (=> b!1111757 m!1028945))

(declare-fun m!1028947 () Bool)

(assert (=> b!1111758 m!1028947))

(declare-fun m!1028949 () Bool)

(assert (=> b!1111758 m!1028949))

(declare-fun m!1028951 () Bool)

(assert (=> b!1111763 m!1028951))

(declare-fun m!1028953 () Bool)

(assert (=> b!1111752 m!1028953))

(declare-fun m!1028955 () Bool)

(assert (=> start!97442 m!1028955))

(declare-fun m!1028957 () Bool)

(assert (=> start!97442 m!1028957))

(declare-fun m!1028959 () Bool)

(assert (=> b!1111759 m!1028959))

(declare-fun m!1028961 () Bool)

(assert (=> b!1111759 m!1028961))

(declare-fun m!1028963 () Bool)

(assert (=> b!1111766 m!1028963))

(declare-fun m!1028965 () Bool)

(assert (=> b!1111753 m!1028965))

(declare-fun m!1028967 () Bool)

(assert (=> b!1111761 m!1028967))

(declare-fun m!1028969 () Bool)

(assert (=> b!1111754 m!1028969))

(declare-fun m!1028971 () Bool)

(assert (=> b!1111760 m!1028971))

(declare-fun m!1028973 () Bool)

(assert (=> bm!46927 m!1028973))

(check-sat (not bm!46928) (not start!97442) (not b!1111754) (not b!1111763) (not mapNonEmpty!43336) (not b!1111757) b_and!37655 (not b!1111766) (not b!1111760) tp_is_empty!27679 (not b!1111758) (not b!1111752) (not b_lambda!18425) (not b!1111759) (not bm!46927) (not b_next!23419) (not b!1111761))
(check-sat b_and!37655 (not b_next!23419))
