; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97558 () Bool)

(assert start!97558)

(declare-fun b_free!23293 () Bool)

(declare-fun b_next!23293 () Bool)

(assert (=> start!97558 (= b_free!23293 (not b_next!23293))))

(declare-fun tp!82178 () Bool)

(declare-fun b_and!37429 () Bool)

(assert (=> start!97558 (= tp!82178 b_and!37429)))

(declare-datatypes ((V!41865 0))(
  ( (V!41866 (val!13833 Int)) )
))
(declare-fun zeroValue!944 () V!41865)

(declare-datatypes ((array!72057 0))(
  ( (array!72058 (arr!34675 (Array (_ BitVec 32) (_ BitVec 64))) (size!35212 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72057)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17490 0))(
  ( (tuple2!17491 (_1!8756 (_ BitVec 64)) (_2!8756 V!41865)) )
))
(declare-datatypes ((List!24177 0))(
  ( (Nil!24174) (Cons!24173 (h!25391 tuple2!17490) (t!34508 List!24177)) )
))
(declare-datatypes ((ListLongMap!15467 0))(
  ( (ListLongMap!15468 (toList!7749 List!24177)) )
))
(declare-fun call!46643 () ListLongMap!15467)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46639 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13067 0))(
  ( (ValueCellFull!13067 (v!16462 V!41865)) (EmptyCell!13067) )
))
(declare-datatypes ((array!72059 0))(
  ( (array!72060 (arr!34676 (Array (_ BitVec 32) ValueCell!13067)) (size!35213 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72059)

(declare-fun minValue!944 () V!41865)

(declare-fun getCurrentListMapNoExtraKeys!4284 (array!72057 array!72059 (_ BitVec 32) (_ BitVec 32) V!41865 V!41865 (_ BitVec 32) Int) ListLongMap!15467)

(assert (=> bm!46639 (= call!46643 (getCurrentListMapNoExtraKeys!4284 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110034 () Bool)

(declare-fun res!740421 () Bool)

(declare-fun e!633312 () Bool)

(assert (=> b!1110034 (=> (not res!740421) (not e!633312))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110034 (= res!740421 (= (select (arr!34675 _keys!1208) i!673) k0!934))))

(declare-fun b!1110035 () Bool)

(declare-fun e!633313 () Bool)

(declare-fun tp_is_empty!27553 () Bool)

(assert (=> b!1110035 (= e!633313 tp_is_empty!27553)))

(declare-fun b!1110036 () Bool)

(declare-fun res!740426 () Bool)

(assert (=> b!1110036 (=> (not res!740426) (not e!633312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110036 (= res!740426 (validMask!0 mask!1564))))

(declare-fun b!1110037 () Bool)

(declare-fun res!740430 () Bool)

(declare-fun e!633317 () Bool)

(assert (=> b!1110037 (=> (not res!740430) (not e!633317))))

(declare-fun lt!496371 () array!72057)

(declare-datatypes ((List!24178 0))(
  ( (Nil!24175) (Cons!24174 (h!25392 (_ BitVec 64)) (t!34509 List!24178)) )
))
(declare-fun arrayNoDuplicates!0 (array!72057 (_ BitVec 32) List!24178) Bool)

(assert (=> b!1110037 (= res!740430 (arrayNoDuplicates!0 lt!496371 #b00000000000000000000000000000000 Nil!24175))))

(declare-fun b!1110038 () Bool)

(declare-fun res!740428 () Bool)

(assert (=> b!1110038 (=> (not res!740428) (not e!633312))))

(assert (=> b!1110038 (= res!740428 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35212 _keys!1208))))))

(declare-fun e!633316 () Bool)

(declare-fun b!1110039 () Bool)

(declare-fun call!46642 () ListLongMap!15467)

(declare-fun -!1006 (ListLongMap!15467 (_ BitVec 64)) ListLongMap!15467)

(assert (=> b!1110039 (= e!633316 (= call!46642 (-!1006 call!46643 k0!934)))))

(declare-fun b!1110040 () Bool)

(declare-fun res!740424 () Bool)

(assert (=> b!1110040 (=> (not res!740424) (not e!633312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72057 (_ BitVec 32)) Bool)

(assert (=> b!1110040 (= res!740424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110041 () Bool)

(declare-fun res!740427 () Bool)

(assert (=> b!1110041 (=> (not res!740427) (not e!633312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110041 (= res!740427 (validKeyInArray!0 k0!934))))

(declare-fun b!1110042 () Bool)

(declare-fun e!633314 () Bool)

(declare-fun mapRes!43147 () Bool)

(assert (=> b!1110042 (= e!633314 (and e!633313 mapRes!43147))))

(declare-fun condMapEmpty!43147 () Bool)

(declare-fun mapDefault!43147 () ValueCell!13067)

(assert (=> b!1110042 (= condMapEmpty!43147 (= (arr!34676 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13067)) mapDefault!43147)))))

(declare-fun res!740425 () Bool)

(assert (=> start!97558 (=> (not res!740425) (not e!633312))))

(assert (=> start!97558 (= res!740425 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35212 _keys!1208))))))

(assert (=> start!97558 e!633312))

(assert (=> start!97558 tp_is_empty!27553))

(declare-fun array_inv!26716 (array!72057) Bool)

(assert (=> start!97558 (array_inv!26716 _keys!1208)))

(assert (=> start!97558 true))

(assert (=> start!97558 tp!82178))

(declare-fun array_inv!26717 (array!72059) Bool)

(assert (=> start!97558 (and (array_inv!26717 _values!996) e!633314)))

(declare-fun mapIsEmpty!43147 () Bool)

(assert (=> mapIsEmpty!43147 mapRes!43147))

(declare-fun b!1110043 () Bool)

(assert (=> b!1110043 (= e!633316 (= call!46642 call!46643))))

(declare-fun mapNonEmpty!43147 () Bool)

(declare-fun tp!82177 () Bool)

(declare-fun e!633318 () Bool)

(assert (=> mapNonEmpty!43147 (= mapRes!43147 (and tp!82177 e!633318))))

(declare-fun mapValue!43147 () ValueCell!13067)

(declare-fun mapRest!43147 () (Array (_ BitVec 32) ValueCell!13067))

(declare-fun mapKey!43147 () (_ BitVec 32))

(assert (=> mapNonEmpty!43147 (= (arr!34676 _values!996) (store mapRest!43147 mapKey!43147 mapValue!43147))))

(declare-fun b!1110044 () Bool)

(declare-fun e!633315 () Bool)

(assert (=> b!1110044 (= e!633315 true)))

(assert (=> b!1110044 e!633316))

(declare-fun c!109535 () Bool)

(assert (=> b!1110044 (= c!109535 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36363 0))(
  ( (Unit!36364) )
))
(declare-fun lt!496370 () Unit!36363)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!277 (array!72057 array!72059 (_ BitVec 32) (_ BitVec 32) V!41865 V!41865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36363)

(assert (=> b!1110044 (= lt!496370 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110045 () Bool)

(declare-fun res!740422 () Bool)

(assert (=> b!1110045 (=> (not res!740422) (not e!633312))))

(assert (=> b!1110045 (= res!740422 (and (= (size!35213 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35212 _keys!1208) (size!35213 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46640 () Bool)

(declare-fun dynLambda!2398 (Int (_ BitVec 64)) V!41865)

(assert (=> bm!46640 (= call!46642 (getCurrentListMapNoExtraKeys!4284 lt!496371 (array!72060 (store (arr!34676 _values!996) i!673 (ValueCellFull!13067 (dynLambda!2398 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35213 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110046 () Bool)

(assert (=> b!1110046 (= e!633318 tp_is_empty!27553)))

(declare-fun b!1110047 () Bool)

(assert (=> b!1110047 (= e!633312 e!633317)))

(declare-fun res!740429 () Bool)

(assert (=> b!1110047 (=> (not res!740429) (not e!633317))))

(assert (=> b!1110047 (= res!740429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496371 mask!1564))))

(assert (=> b!1110047 (= lt!496371 (array!72058 (store (arr!34675 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35212 _keys!1208)))))

(declare-fun b!1110048 () Bool)

(assert (=> b!1110048 (= e!633317 (not e!633315))))

(declare-fun res!740423 () Bool)

(assert (=> b!1110048 (=> res!740423 e!633315)))

(assert (=> b!1110048 (= res!740423 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35212 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110048 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496372 () Unit!36363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72057 (_ BitVec 64) (_ BitVec 32)) Unit!36363)

(assert (=> b!1110048 (= lt!496372 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110049 () Bool)

(declare-fun res!740431 () Bool)

(assert (=> b!1110049 (=> (not res!740431) (not e!633312))))

(assert (=> b!1110049 (= res!740431 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24175))))

(assert (= (and start!97558 res!740425) b!1110036))

(assert (= (and b!1110036 res!740426) b!1110045))

(assert (= (and b!1110045 res!740422) b!1110040))

(assert (= (and b!1110040 res!740424) b!1110049))

(assert (= (and b!1110049 res!740431) b!1110038))

(assert (= (and b!1110038 res!740428) b!1110041))

(assert (= (and b!1110041 res!740427) b!1110034))

(assert (= (and b!1110034 res!740421) b!1110047))

(assert (= (and b!1110047 res!740429) b!1110037))

(assert (= (and b!1110037 res!740430) b!1110048))

(assert (= (and b!1110048 (not res!740423)) b!1110044))

(assert (= (and b!1110044 c!109535) b!1110039))

(assert (= (and b!1110044 (not c!109535)) b!1110043))

(assert (= (or b!1110039 b!1110043) bm!46640))

(assert (= (or b!1110039 b!1110043) bm!46639))

(assert (= (and b!1110042 condMapEmpty!43147) mapIsEmpty!43147))

(assert (= (and b!1110042 (not condMapEmpty!43147)) mapNonEmpty!43147))

(get-info :version)

(assert (= (and mapNonEmpty!43147 ((_ is ValueCellFull!13067) mapValue!43147)) b!1110046))

(assert (= (and b!1110042 ((_ is ValueCellFull!13067) mapDefault!43147)) b!1110035))

(assert (= start!97558 b!1110042))

(declare-fun b_lambda!18323 () Bool)

(assert (=> (not b_lambda!18323) (not bm!46640)))

(declare-fun t!34507 () Bool)

(declare-fun tb!8151 () Bool)

(assert (=> (and start!97558 (= defaultEntry!1004 defaultEntry!1004) t!34507) tb!8151))

(declare-fun result!16871 () Bool)

(assert (=> tb!8151 (= result!16871 tp_is_empty!27553)))

(assert (=> bm!46640 t!34507))

(declare-fun b_and!37431 () Bool)

(assert (= b_and!37429 (and (=> t!34507 result!16871) b_and!37431)))

(declare-fun m!1028841 () Bool)

(assert (=> b!1110039 m!1028841))

(declare-fun m!1028843 () Bool)

(assert (=> b!1110044 m!1028843))

(declare-fun m!1028845 () Bool)

(assert (=> b!1110049 m!1028845))

(declare-fun m!1028847 () Bool)

(assert (=> b!1110036 m!1028847))

(declare-fun m!1028849 () Bool)

(assert (=> b!1110037 m!1028849))

(declare-fun m!1028851 () Bool)

(assert (=> bm!46640 m!1028851))

(declare-fun m!1028853 () Bool)

(assert (=> bm!46640 m!1028853))

(declare-fun m!1028855 () Bool)

(assert (=> bm!46640 m!1028855))

(declare-fun m!1028857 () Bool)

(assert (=> b!1110040 m!1028857))

(declare-fun m!1028859 () Bool)

(assert (=> start!97558 m!1028859))

(declare-fun m!1028861 () Bool)

(assert (=> start!97558 m!1028861))

(declare-fun m!1028863 () Bool)

(assert (=> b!1110041 m!1028863))

(declare-fun m!1028865 () Bool)

(assert (=> b!1110034 m!1028865))

(declare-fun m!1028867 () Bool)

(assert (=> b!1110047 m!1028867))

(declare-fun m!1028869 () Bool)

(assert (=> b!1110047 m!1028869))

(declare-fun m!1028871 () Bool)

(assert (=> bm!46639 m!1028871))

(declare-fun m!1028873 () Bool)

(assert (=> b!1110048 m!1028873))

(declare-fun m!1028875 () Bool)

(assert (=> b!1110048 m!1028875))

(declare-fun m!1028877 () Bool)

(assert (=> mapNonEmpty!43147 m!1028877))

(check-sat (not bm!46640) (not b_lambda!18323) (not b!1110036) (not start!97558) (not b!1110041) (not b!1110039) (not b!1110037) (not b!1110044) tp_is_empty!27553 (not b_next!23293) (not b!1110048) (not b!1110049) (not b!1110040) (not b!1110047) (not bm!46639) b_and!37431 (not mapNonEmpty!43147))
(check-sat b_and!37431 (not b_next!23293))
