; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98132 () Bool)

(assert start!98132)

(declare-fun b_free!23839 () Bool)

(declare-fun b_next!23839 () Bool)

(assert (=> start!98132 (= b_free!23839 (not b_next!23839))))

(declare-fun tp!84220 () Bool)

(declare-fun b_and!38439 () Bool)

(assert (=> start!98132 (= tp!84220 b_and!38439)))

(declare-fun b!1127962 () Bool)

(declare-fun e!641973 () Bool)

(declare-datatypes ((V!42953 0))(
  ( (V!42954 (val!14241 Int)) )
))
(declare-datatypes ((tuple2!18016 0))(
  ( (tuple2!18017 (_1!9019 (_ BitVec 64)) (_2!9019 V!42953)) )
))
(declare-datatypes ((List!24770 0))(
  ( (Nil!24767) (Cons!24766 (h!25975 tuple2!18016) (t!35592 List!24770)) )
))
(declare-datatypes ((ListLongMap!15985 0))(
  ( (ListLongMap!15986 (toList!8008 List!24770)) )
))
(declare-fun call!47777 () ListLongMap!15985)

(declare-fun call!47776 () ListLongMap!15985)

(assert (=> b!1127962 (= e!641973 (= call!47777 call!47776))))

(declare-fun b!1127963 () Bool)

(declare-fun e!641968 () Bool)

(declare-fun tp_is_empty!28369 () Bool)

(assert (=> b!1127963 (= e!641968 tp_is_empty!28369)))

(declare-fun b!1127964 () Bool)

(declare-fun e!641970 () Bool)

(declare-fun e!641969 () Bool)

(assert (=> b!1127964 (= e!641970 e!641969)))

(declare-fun res!753812 () Bool)

(assert (=> b!1127964 (=> res!753812 e!641969)))

(declare-datatypes ((array!73524 0))(
  ( (array!73525 (arr!35415 (Array (_ BitVec 32) (_ BitVec 64))) (size!35953 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73524)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1127964 (= res!753812 (not (= (select (arr!35415 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127964 e!641973))

(declare-fun c!109722 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127964 (= c!109722 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36811 0))(
  ( (Unit!36812) )
))
(declare-fun lt!500633 () Unit!36811)

(declare-datatypes ((ValueCell!13475 0))(
  ( (ValueCellFull!13475 (v!16873 V!42953)) (EmptyCell!13475) )
))
(declare-datatypes ((array!73526 0))(
  ( (array!73527 (arr!35416 (Array (_ BitVec 32) ValueCell!13475)) (size!35954 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73526)

(declare-fun minValue!944 () V!42953)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!408 (array!73524 array!73526 (_ BitVec 32) (_ BitVec 32) V!42953 V!42953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36811)

(assert (=> b!1127964 (= lt!500633 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127965 () Bool)

(declare-fun res!753804 () Bool)

(declare-fun e!641975 () Bool)

(assert (=> b!1127965 (=> (not res!753804) (not e!641975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127965 (= res!753804 (validKeyInArray!0 k0!934))))

(declare-fun b!1127966 () Bool)

(declare-fun res!753805 () Bool)

(assert (=> b!1127966 (=> (not res!753805) (not e!641975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73524 (_ BitVec 32)) Bool)

(assert (=> b!1127966 (= res!753805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127967 () Bool)

(assert (=> b!1127967 (= e!641969 true)))

(declare-fun lt!500634 () Bool)

(declare-fun contains!6464 (ListLongMap!15985 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4508 (array!73524 array!73526 (_ BitVec 32) (_ BitVec 32) V!42953 V!42953 (_ BitVec 32) Int) ListLongMap!15985)

(assert (=> b!1127967 (= lt!500634 (contains!6464 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127968 () Bool)

(declare-fun e!641971 () Bool)

(declare-fun e!641974 () Bool)

(assert (=> b!1127968 (= e!641971 (not e!641974))))

(declare-fun res!753802 () Bool)

(assert (=> b!1127968 (=> res!753802 e!641974)))

(assert (=> b!1127968 (= res!753802 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127968 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500631 () Unit!36811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73524 (_ BitVec 64) (_ BitVec 32)) Unit!36811)

(assert (=> b!1127968 (= lt!500631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127969 () Bool)

(declare-fun res!753808 () Bool)

(assert (=> b!1127969 (=> (not res!753808) (not e!641971))))

(declare-fun lt!500637 () array!73524)

(declare-datatypes ((List!24771 0))(
  ( (Nil!24768) (Cons!24767 (h!25976 (_ BitVec 64)) (t!35593 List!24771)) )
))
(declare-fun arrayNoDuplicates!0 (array!73524 (_ BitVec 32) List!24771) Bool)

(assert (=> b!1127969 (= res!753808 (arrayNoDuplicates!0 lt!500637 #b00000000000000000000000000000000 Nil!24768))))

(declare-fun b!1127970 () Bool)

(declare-fun res!753807 () Bool)

(assert (=> b!1127970 (=> (not res!753807) (not e!641975))))

(assert (=> b!1127970 (= res!753807 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24768))))

(declare-fun b!1127971 () Bool)

(assert (=> b!1127971 (= e!641975 e!641971)))

(declare-fun res!753806 () Bool)

(assert (=> b!1127971 (=> (not res!753806) (not e!641971))))

(assert (=> b!1127971 (= res!753806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500637 mask!1564))))

(assert (=> b!1127971 (= lt!500637 (array!73525 (store (arr!35415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35953 _keys!1208)))))

(declare-fun b!1127972 () Bool)

(declare-fun res!753809 () Bool)

(assert (=> b!1127972 (=> (not res!753809) (not e!641975))))

(assert (=> b!1127972 (= res!753809 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35953 _keys!1208))))))

(declare-fun b!1127973 () Bool)

(assert (=> b!1127973 (= e!641974 e!641970)))

(declare-fun res!753813 () Bool)

(assert (=> b!1127973 (=> res!753813 e!641970)))

(assert (=> b!1127973 (= res!753813 (not (= from!1455 i!673)))))

(declare-fun lt!500635 () array!73526)

(declare-fun lt!500632 () ListLongMap!15985)

(assert (=> b!1127973 (= lt!500632 (getCurrentListMapNoExtraKeys!4508 lt!500637 lt!500635 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2519 (Int (_ BitVec 64)) V!42953)

(assert (=> b!1127973 (= lt!500635 (array!73527 (store (arr!35416 _values!996) i!673 (ValueCellFull!13475 (dynLambda!2519 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35954 _values!996)))))

(declare-fun lt!500636 () ListLongMap!15985)

(assert (=> b!1127973 (= lt!500636 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127974 () Bool)

(declare-fun res!753810 () Bool)

(assert (=> b!1127974 (=> (not res!753810) (not e!641975))))

(assert (=> b!1127974 (= res!753810 (= (select (arr!35415 _keys!1208) i!673) k0!934))))

(declare-fun b!1127975 () Bool)

(declare-fun e!641967 () Bool)

(assert (=> b!1127975 (= e!641967 tp_is_empty!28369)))

(declare-fun mapIsEmpty!44371 () Bool)

(declare-fun mapRes!44371 () Bool)

(assert (=> mapIsEmpty!44371 mapRes!44371))

(declare-fun b!1127976 () Bool)

(declare-fun -!1128 (ListLongMap!15985 (_ BitVec 64)) ListLongMap!15985)

(assert (=> b!1127976 (= e!641973 (= call!47777 (-!1128 call!47776 k0!934)))))

(declare-fun res!753811 () Bool)

(assert (=> start!98132 (=> (not res!753811) (not e!641975))))

(assert (=> start!98132 (= res!753811 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35953 _keys!1208))))))

(assert (=> start!98132 e!641975))

(assert (=> start!98132 tp_is_empty!28369))

(declare-fun array_inv!27254 (array!73524) Bool)

(assert (=> start!98132 (array_inv!27254 _keys!1208)))

(assert (=> start!98132 true))

(assert (=> start!98132 tp!84220))

(declare-fun e!641972 () Bool)

(declare-fun array_inv!27255 (array!73526) Bool)

(assert (=> start!98132 (and (array_inv!27255 _values!996) e!641972)))

(declare-fun mapNonEmpty!44371 () Bool)

(declare-fun tp!84221 () Bool)

(assert (=> mapNonEmpty!44371 (= mapRes!44371 (and tp!84221 e!641968))))

(declare-fun mapRest!44371 () (Array (_ BitVec 32) ValueCell!13475))

(declare-fun mapKey!44371 () (_ BitVec 32))

(declare-fun mapValue!44371 () ValueCell!13475)

(assert (=> mapNonEmpty!44371 (= (arr!35416 _values!996) (store mapRest!44371 mapKey!44371 mapValue!44371))))

(declare-fun b!1127977 () Bool)

(assert (=> b!1127977 (= e!641972 (and e!641967 mapRes!44371))))

(declare-fun condMapEmpty!44371 () Bool)

(declare-fun mapDefault!44371 () ValueCell!13475)

(assert (=> b!1127977 (= condMapEmpty!44371 (= (arr!35416 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13475)) mapDefault!44371)))))

(declare-fun bm!47773 () Bool)

(assert (=> bm!47773 (= call!47777 (getCurrentListMapNoExtraKeys!4508 lt!500637 lt!500635 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127978 () Bool)

(declare-fun res!753803 () Bool)

(assert (=> b!1127978 (=> (not res!753803) (not e!641975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127978 (= res!753803 (validMask!0 mask!1564))))

(declare-fun b!1127979 () Bool)

(declare-fun res!753814 () Bool)

(assert (=> b!1127979 (=> (not res!753814) (not e!641975))))

(assert (=> b!1127979 (= res!753814 (and (= (size!35954 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35953 _keys!1208) (size!35954 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!47774 () Bool)

(assert (=> bm!47774 (= call!47776 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98132 res!753811) b!1127978))

(assert (= (and b!1127978 res!753803) b!1127979))

(assert (= (and b!1127979 res!753814) b!1127966))

(assert (= (and b!1127966 res!753805) b!1127970))

(assert (= (and b!1127970 res!753807) b!1127972))

(assert (= (and b!1127972 res!753809) b!1127965))

(assert (= (and b!1127965 res!753804) b!1127974))

(assert (= (and b!1127974 res!753810) b!1127971))

(assert (= (and b!1127971 res!753806) b!1127969))

(assert (= (and b!1127969 res!753808) b!1127968))

(assert (= (and b!1127968 (not res!753802)) b!1127973))

(assert (= (and b!1127973 (not res!753813)) b!1127964))

(assert (= (and b!1127964 c!109722) b!1127976))

(assert (= (and b!1127964 (not c!109722)) b!1127962))

(assert (= (or b!1127976 b!1127962) bm!47773))

(assert (= (or b!1127976 b!1127962) bm!47774))

(assert (= (and b!1127964 (not res!753812)) b!1127967))

(assert (= (and b!1127977 condMapEmpty!44371) mapIsEmpty!44371))

(assert (= (and b!1127977 (not condMapEmpty!44371)) mapNonEmpty!44371))

(get-info :version)

(assert (= (and mapNonEmpty!44371 ((_ is ValueCellFull!13475) mapValue!44371)) b!1127963))

(assert (= (and b!1127977 ((_ is ValueCellFull!13475) mapDefault!44371)) b!1127975))

(assert (= start!98132 b!1127977))

(declare-fun b_lambda!18791 () Bool)

(assert (=> (not b_lambda!18791) (not b!1127973)))

(declare-fun t!35591 () Bool)

(declare-fun tb!8643 () Bool)

(assert (=> (and start!98132 (= defaultEntry!1004 defaultEntry!1004) t!35591) tb!8643))

(declare-fun result!17855 () Bool)

(assert (=> tb!8643 (= result!17855 tp_is_empty!28369)))

(assert (=> b!1127973 t!35591))

(declare-fun b_and!38441 () Bool)

(assert (= b_and!38439 (and (=> t!35591 result!17855) b_and!38441)))

(declare-fun m!1041123 () Bool)

(assert (=> b!1127978 m!1041123))

(declare-fun m!1041125 () Bool)

(assert (=> b!1127976 m!1041125))

(declare-fun m!1041127 () Bool)

(assert (=> bm!47774 m!1041127))

(declare-fun m!1041129 () Bool)

(assert (=> mapNonEmpty!44371 m!1041129))

(declare-fun m!1041131 () Bool)

(assert (=> bm!47773 m!1041131))

(declare-fun m!1041133 () Bool)

(assert (=> b!1127965 m!1041133))

(assert (=> b!1127967 m!1041127))

(assert (=> b!1127967 m!1041127))

(declare-fun m!1041135 () Bool)

(assert (=> b!1127967 m!1041135))

(declare-fun m!1041137 () Bool)

(assert (=> b!1127973 m!1041137))

(declare-fun m!1041139 () Bool)

(assert (=> b!1127973 m!1041139))

(declare-fun m!1041141 () Bool)

(assert (=> b!1127973 m!1041141))

(declare-fun m!1041143 () Bool)

(assert (=> b!1127973 m!1041143))

(declare-fun m!1041145 () Bool)

(assert (=> b!1127966 m!1041145))

(declare-fun m!1041147 () Bool)

(assert (=> b!1127971 m!1041147))

(declare-fun m!1041149 () Bool)

(assert (=> b!1127971 m!1041149))

(declare-fun m!1041151 () Bool)

(assert (=> b!1127964 m!1041151))

(declare-fun m!1041153 () Bool)

(assert (=> b!1127964 m!1041153))

(declare-fun m!1041155 () Bool)

(assert (=> b!1127970 m!1041155))

(declare-fun m!1041157 () Bool)

(assert (=> b!1127974 m!1041157))

(declare-fun m!1041159 () Bool)

(assert (=> b!1127968 m!1041159))

(declare-fun m!1041161 () Bool)

(assert (=> b!1127968 m!1041161))

(declare-fun m!1041163 () Bool)

(assert (=> b!1127969 m!1041163))

(declare-fun m!1041165 () Bool)

(assert (=> start!98132 m!1041165))

(declare-fun m!1041167 () Bool)

(assert (=> start!98132 m!1041167))

(check-sat (not b!1127970) (not b!1127964) (not bm!47773) tp_is_empty!28369 (not b!1127971) (not mapNonEmpty!44371) (not b_next!23839) (not b!1127966) (not b!1127968) (not b!1127976) b_and!38441 (not b!1127965) (not b!1127978) (not bm!47774) (not b!1127973) (not b!1127969) (not b!1127967) (not start!98132) (not b_lambda!18791))
(check-sat b_and!38441 (not b_next!23839))
