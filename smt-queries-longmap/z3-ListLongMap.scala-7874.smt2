; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98224 () Bool)

(assert start!98224)

(declare-fun b_free!23689 () Bool)

(declare-fun b_next!23689 () Bool)

(assert (=> start!98224 (= b_free!23689 (not b_next!23689))))

(declare-fun tp!83770 () Bool)

(declare-fun b_and!38171 () Bool)

(assert (=> start!98224 (= tp!83770 b_and!38171)))

(declare-fun b!1125033 () Bool)

(declare-fun res!751285 () Bool)

(declare-fun e!640569 () Bool)

(assert (=> b!1125033 (=> (not res!751285) (not e!640569))))

(declare-datatypes ((array!73353 0))(
  ( (array!73354 (arr!35323 (Array (_ BitVec 32) (_ BitVec 64))) (size!35860 (_ BitVec 32))) )
))
(declare-fun lt!499696 () array!73353)

(declare-datatypes ((List!24596 0))(
  ( (Nil!24593) (Cons!24592 (h!25810 (_ BitVec 64)) (t!35269 List!24596)) )
))
(declare-fun arrayNoDuplicates!0 (array!73353 (_ BitVec 32) List!24596) Bool)

(assert (=> b!1125033 (= res!751285 (arrayNoDuplicates!0 lt!499696 #b00000000000000000000000000000000 Nil!24593))))

(declare-fun b!1125034 () Bool)

(declare-fun res!751286 () Bool)

(declare-fun e!640571 () Bool)

(assert (=> b!1125034 (=> (not res!751286) (not e!640571))))

(declare-fun _keys!1208 () array!73353)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42753 0))(
  ( (V!42754 (val!14166 Int)) )
))
(declare-datatypes ((ValueCell!13400 0))(
  ( (ValueCellFull!13400 (v!16795 V!42753)) (EmptyCell!13400) )
))
(declare-datatypes ((array!73355 0))(
  ( (array!73356 (arr!35324 (Array (_ BitVec 32) ValueCell!13400)) (size!35861 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73355)

(assert (=> b!1125034 (= res!751286 (and (= (size!35861 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35860 _keys!1208) (size!35861 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44146 () Bool)

(declare-fun mapRes!44146 () Bool)

(declare-fun tp!83771 () Bool)

(declare-fun e!640565 () Bool)

(assert (=> mapNonEmpty!44146 (= mapRes!44146 (and tp!83771 e!640565))))

(declare-fun mapRest!44146 () (Array (_ BitVec 32) ValueCell!13400))

(declare-fun mapKey!44146 () (_ BitVec 32))

(declare-fun mapValue!44146 () ValueCell!13400)

(assert (=> mapNonEmpty!44146 (= (arr!35324 _values!996) (store mapRest!44146 mapKey!44146 mapValue!44146))))

(declare-fun zeroValue!944 () V!42753)

(declare-fun bm!47413 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17804 0))(
  ( (tuple2!17805 (_1!8913 (_ BitVec 64)) (_2!8913 V!42753)) )
))
(declare-datatypes ((List!24597 0))(
  ( (Nil!24594) (Cons!24593 (h!25811 tuple2!17804) (t!35270 List!24597)) )
))
(declare-datatypes ((ListLongMap!15781 0))(
  ( (ListLongMap!15782 (toList!7906 List!24597)) )
))
(declare-fun call!47417 () ListLongMap!15781)

(declare-fun minValue!944 () V!42753)

(declare-fun getCurrentListMapNoExtraKeys!4433 (array!73353 array!73355 (_ BitVec 32) (_ BitVec 32) V!42753 V!42753 (_ BitVec 32) Int) ListLongMap!15781)

(assert (=> bm!47413 (= call!47417 (getCurrentListMapNoExtraKeys!4433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125035 () Bool)

(declare-fun res!751289 () Bool)

(assert (=> b!1125035 (=> (not res!751289) (not e!640571))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125035 (= res!751289 (validKeyInArray!0 k0!934))))

(declare-fun b!1125036 () Bool)

(declare-fun res!751288 () Bool)

(declare-fun e!640573 () Bool)

(assert (=> b!1125036 (=> res!751288 e!640573)))

(assert (=> b!1125036 (= res!751288 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125038 () Bool)

(declare-fun res!751287 () Bool)

(assert (=> b!1125038 (=> (not res!751287) (not e!640571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73353 (_ BitVec 32)) Bool)

(assert (=> b!1125038 (= res!751287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125039 () Bool)

(declare-fun tp_is_empty!28219 () Bool)

(assert (=> b!1125039 (= e!640565 tp_is_empty!28219)))

(declare-fun b!1125040 () Bool)

(declare-fun e!640575 () Bool)

(declare-fun e!640568 () Bool)

(assert (=> b!1125040 (= e!640575 e!640568)))

(declare-fun res!751295 () Bool)

(assert (=> b!1125040 (=> res!751295 e!640568)))

(assert (=> b!1125040 (= res!751295 (not (= (select (arr!35323 _keys!1208) from!1455) k0!934)))))

(declare-fun e!640567 () Bool)

(assert (=> b!1125040 e!640567))

(declare-fun c!109934 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125040 (= c!109934 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36837 0))(
  ( (Unit!36838) )
))
(declare-fun lt!499697 () Unit!36837)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!359 (array!73353 array!73355 (_ BitVec 32) (_ BitVec 32) V!42753 V!42753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36837)

(assert (=> b!1125040 (= lt!499697 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44146 () Bool)

(assert (=> mapIsEmpty!44146 mapRes!44146))

(declare-fun lt!499694 () array!73355)

(declare-fun call!47416 () ListLongMap!15781)

(declare-fun bm!47414 () Bool)

(assert (=> bm!47414 (= call!47416 (getCurrentListMapNoExtraKeys!4433 lt!499696 lt!499694 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125041 () Bool)

(declare-fun e!640572 () Bool)

(declare-fun e!640574 () Bool)

(assert (=> b!1125041 (= e!640572 (and e!640574 mapRes!44146))))

(declare-fun condMapEmpty!44146 () Bool)

(declare-fun mapDefault!44146 () ValueCell!13400)

(assert (=> b!1125041 (= condMapEmpty!44146 (= (arr!35324 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13400)) mapDefault!44146)))))

(declare-fun b!1125037 () Bool)

(assert (=> b!1125037 (= e!640567 (= call!47416 call!47417))))

(declare-fun res!751291 () Bool)

(assert (=> start!98224 (=> (not res!751291) (not e!640571))))

(assert (=> start!98224 (= res!751291 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35860 _keys!1208))))))

(assert (=> start!98224 e!640571))

(assert (=> start!98224 tp_is_empty!28219))

(declare-fun array_inv!27184 (array!73353) Bool)

(assert (=> start!98224 (array_inv!27184 _keys!1208)))

(assert (=> start!98224 true))

(assert (=> start!98224 tp!83770))

(declare-fun array_inv!27185 (array!73355) Bool)

(assert (=> start!98224 (and (array_inv!27185 _values!996) e!640572)))

(declare-fun b!1125042 () Bool)

(declare-fun e!640566 () Bool)

(assert (=> b!1125042 (= e!640569 (not e!640566))))

(declare-fun res!751293 () Bool)

(assert (=> b!1125042 (=> res!751293 e!640566)))

(assert (=> b!1125042 (= res!751293 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125042 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499695 () Unit!36837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73353 (_ BitVec 64) (_ BitVec 32)) Unit!36837)

(assert (=> b!1125042 (= lt!499695 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125043 () Bool)

(declare-fun -!1098 (ListLongMap!15781 (_ BitVec 64)) ListLongMap!15781)

(assert (=> b!1125043 (= e!640567 (= call!47416 (-!1098 call!47417 k0!934)))))

(declare-fun b!1125044 () Bool)

(assert (=> b!1125044 (= e!640568 e!640573)))

(declare-fun res!751290 () Bool)

(assert (=> b!1125044 (=> res!751290 e!640573)))

(declare-fun lt!499692 () ListLongMap!15781)

(declare-fun contains!6464 (ListLongMap!15781 (_ BitVec 64)) Bool)

(assert (=> b!1125044 (= res!751290 (not (contains!6464 lt!499692 k0!934)))))

(assert (=> b!1125044 (= lt!499692 (getCurrentListMapNoExtraKeys!4433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125045 () Bool)

(assert (=> b!1125045 (= e!640573 true)))

(declare-fun +!3442 (ListLongMap!15781 tuple2!17804) ListLongMap!15781)

(assert (=> b!1125045 (contains!6464 (+!3442 lt!499692 (tuple2!17805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499699 () Unit!36837)

(declare-fun addStillContains!668 (ListLongMap!15781 (_ BitVec 64) V!42753 (_ BitVec 64)) Unit!36837)

(assert (=> b!1125045 (= lt!499699 (addStillContains!668 lt!499692 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125046 () Bool)

(declare-fun res!751297 () Bool)

(assert (=> b!1125046 (=> (not res!751297) (not e!640571))))

(assert (=> b!1125046 (= res!751297 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24593))))

(declare-fun b!1125047 () Bool)

(assert (=> b!1125047 (= e!640571 e!640569)))

(declare-fun res!751284 () Bool)

(assert (=> b!1125047 (=> (not res!751284) (not e!640569))))

(assert (=> b!1125047 (= res!751284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499696 mask!1564))))

(assert (=> b!1125047 (= lt!499696 (array!73354 (store (arr!35323 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35860 _keys!1208)))))

(declare-fun b!1125048 () Bool)

(declare-fun res!751294 () Bool)

(assert (=> b!1125048 (=> (not res!751294) (not e!640571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125048 (= res!751294 (validMask!0 mask!1564))))

(declare-fun b!1125049 () Bool)

(assert (=> b!1125049 (= e!640566 e!640575)))

(declare-fun res!751292 () Bool)

(assert (=> b!1125049 (=> res!751292 e!640575)))

(assert (=> b!1125049 (= res!751292 (not (= from!1455 i!673)))))

(declare-fun lt!499693 () ListLongMap!15781)

(assert (=> b!1125049 (= lt!499693 (getCurrentListMapNoExtraKeys!4433 lt!499696 lt!499694 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2514 (Int (_ BitVec 64)) V!42753)

(assert (=> b!1125049 (= lt!499694 (array!73356 (store (arr!35324 _values!996) i!673 (ValueCellFull!13400 (dynLambda!2514 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35861 _values!996)))))

(declare-fun lt!499698 () ListLongMap!15781)

(assert (=> b!1125049 (= lt!499698 (getCurrentListMapNoExtraKeys!4433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125050 () Bool)

(declare-fun res!751283 () Bool)

(assert (=> b!1125050 (=> (not res!751283) (not e!640571))))

(assert (=> b!1125050 (= res!751283 (= (select (arr!35323 _keys!1208) i!673) k0!934))))

(declare-fun b!1125051 () Bool)

(assert (=> b!1125051 (= e!640574 tp_is_empty!28219)))

(declare-fun b!1125052 () Bool)

(declare-fun res!751296 () Bool)

(assert (=> b!1125052 (=> (not res!751296) (not e!640571))))

(assert (=> b!1125052 (= res!751296 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35860 _keys!1208))))))

(assert (= (and start!98224 res!751291) b!1125048))

(assert (= (and b!1125048 res!751294) b!1125034))

(assert (= (and b!1125034 res!751286) b!1125038))

(assert (= (and b!1125038 res!751287) b!1125046))

(assert (= (and b!1125046 res!751297) b!1125052))

(assert (= (and b!1125052 res!751296) b!1125035))

(assert (= (and b!1125035 res!751289) b!1125050))

(assert (= (and b!1125050 res!751283) b!1125047))

(assert (= (and b!1125047 res!751284) b!1125033))

(assert (= (and b!1125033 res!751285) b!1125042))

(assert (= (and b!1125042 (not res!751293)) b!1125049))

(assert (= (and b!1125049 (not res!751292)) b!1125040))

(assert (= (and b!1125040 c!109934) b!1125043))

(assert (= (and b!1125040 (not c!109934)) b!1125037))

(assert (= (or b!1125043 b!1125037) bm!47414))

(assert (= (or b!1125043 b!1125037) bm!47413))

(assert (= (and b!1125040 (not res!751295)) b!1125044))

(assert (= (and b!1125044 (not res!751290)) b!1125036))

(assert (= (and b!1125036 (not res!751288)) b!1125045))

(assert (= (and b!1125041 condMapEmpty!44146) mapIsEmpty!44146))

(assert (= (and b!1125041 (not condMapEmpty!44146)) mapNonEmpty!44146))

(get-info :version)

(assert (= (and mapNonEmpty!44146 ((_ is ValueCellFull!13400) mapValue!44146)) b!1125039))

(assert (= (and b!1125041 ((_ is ValueCellFull!13400) mapDefault!44146)) b!1125051))

(assert (= start!98224 b!1125041))

(declare-fun b_lambda!18669 () Bool)

(assert (=> (not b_lambda!18669) (not b!1125049)))

(declare-fun t!35268 () Bool)

(declare-fun tb!8493 () Bool)

(assert (=> (and start!98224 (= defaultEntry!1004 defaultEntry!1004) t!35268) tb!8493))

(declare-fun result!17555 () Bool)

(assert (=> tb!8493 (= result!17555 tp_is_empty!28219)))

(assert (=> b!1125049 t!35268))

(declare-fun b_and!38173 () Bool)

(assert (= b_and!38171 (and (=> t!35268 result!17555) b_and!38173)))

(declare-fun m!1039793 () Bool)

(assert (=> b!1125045 m!1039793))

(assert (=> b!1125045 m!1039793))

(declare-fun m!1039795 () Bool)

(assert (=> b!1125045 m!1039795))

(declare-fun m!1039797 () Bool)

(assert (=> b!1125045 m!1039797))

(declare-fun m!1039799 () Bool)

(assert (=> start!98224 m!1039799))

(declare-fun m!1039801 () Bool)

(assert (=> start!98224 m!1039801))

(declare-fun m!1039803 () Bool)

(assert (=> b!1125047 m!1039803))

(declare-fun m!1039805 () Bool)

(assert (=> b!1125047 m!1039805))

(declare-fun m!1039807 () Bool)

(assert (=> b!1125035 m!1039807))

(declare-fun m!1039809 () Bool)

(assert (=> b!1125048 m!1039809))

(declare-fun m!1039811 () Bool)

(assert (=> b!1125038 m!1039811))

(declare-fun m!1039813 () Bool)

(assert (=> bm!47413 m!1039813))

(declare-fun m!1039815 () Bool)

(assert (=> mapNonEmpty!44146 m!1039815))

(declare-fun m!1039817 () Bool)

(assert (=> b!1125043 m!1039817))

(declare-fun m!1039819 () Bool)

(assert (=> b!1125049 m!1039819))

(declare-fun m!1039821 () Bool)

(assert (=> b!1125049 m!1039821))

(declare-fun m!1039823 () Bool)

(assert (=> b!1125049 m!1039823))

(declare-fun m!1039825 () Bool)

(assert (=> b!1125049 m!1039825))

(declare-fun m!1039827 () Bool)

(assert (=> b!1125040 m!1039827))

(declare-fun m!1039829 () Bool)

(assert (=> b!1125040 m!1039829))

(declare-fun m!1039831 () Bool)

(assert (=> b!1125033 m!1039831))

(declare-fun m!1039833 () Bool)

(assert (=> b!1125050 m!1039833))

(declare-fun m!1039835 () Bool)

(assert (=> b!1125042 m!1039835))

(declare-fun m!1039837 () Bool)

(assert (=> b!1125042 m!1039837))

(declare-fun m!1039839 () Bool)

(assert (=> b!1125046 m!1039839))

(declare-fun m!1039841 () Bool)

(assert (=> b!1125044 m!1039841))

(assert (=> b!1125044 m!1039813))

(declare-fun m!1039843 () Bool)

(assert (=> bm!47414 m!1039843))

(check-sat (not b!1125047) (not b!1125046) (not b!1125035) (not start!98224) (not b!1125048) (not b!1125049) (not b!1125043) (not mapNonEmpty!44146) (not b!1125040) (not b!1125042) b_and!38173 (not b_next!23689) (not b!1125033) (not b!1125045) tp_is_empty!28219 (not b!1125044) (not bm!47414) (not b!1125038) (not b_lambda!18669) (not bm!47413))
(check-sat b_and!38173 (not b_next!23689))
