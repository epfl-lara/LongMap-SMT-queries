; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97420 () Bool)

(assert start!97420)

(declare-fun b_free!23391 () Bool)

(declare-fun b_next!23391 () Bool)

(assert (=> start!97420 (= b_free!23391 (not b_next!23391))))

(declare-fun tp!82471 () Bool)

(declare-fun b_and!37619 () Bool)

(assert (=> start!97420 (= tp!82471 b_and!37619)))

(declare-fun b!1111181 () Bool)

(declare-fun res!741521 () Bool)

(declare-fun e!633644 () Bool)

(assert (=> b!1111181 (=> (not res!741521) (not e!633644))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111181 (= res!741521 (validMask!0 mask!1564))))

(declare-fun b!1111182 () Bool)

(declare-fun e!633650 () Bool)

(declare-fun e!633651 () Bool)

(declare-fun mapRes!43294 () Bool)

(assert (=> b!1111182 (= e!633650 (and e!633651 mapRes!43294))))

(declare-fun condMapEmpty!43294 () Bool)

(declare-datatypes ((V!41995 0))(
  ( (V!41996 (val!13882 Int)) )
))
(declare-datatypes ((ValueCell!13116 0))(
  ( (ValueCellFull!13116 (v!16515 V!41995)) (EmptyCell!13116) )
))
(declare-datatypes ((array!72219 0))(
  ( (array!72220 (arr!34762 (Array (_ BitVec 32) ValueCell!13116)) (size!35298 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72219)

(declare-fun mapDefault!43294 () ValueCell!13116)

(assert (=> b!1111182 (= condMapEmpty!43294 (= (arr!34762 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13116)) mapDefault!43294)))))

(declare-fun zeroValue!944 () V!41995)

(declare-datatypes ((array!72221 0))(
  ( (array!72222 (arr!34763 (Array (_ BitVec 32) (_ BitVec 64))) (size!35299 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72221)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46866 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17566 0))(
  ( (tuple2!17567 (_1!8794 (_ BitVec 64)) (_2!8794 V!41995)) )
))
(declare-datatypes ((List!24249 0))(
  ( (Nil!24246) (Cons!24245 (h!25454 tuple2!17566) (t!34686 List!24249)) )
))
(declare-datatypes ((ListLongMap!15535 0))(
  ( (ListLongMap!15536 (toList!7783 List!24249)) )
))
(declare-fun call!46870 () ListLongMap!15535)

(declare-fun minValue!944 () V!41995)

(declare-fun getCurrentListMapNoExtraKeys!4275 (array!72221 array!72219 (_ BitVec 32) (_ BitVec 32) V!41995 V!41995 (_ BitVec 32) Int) ListLongMap!15535)

(assert (=> bm!46866 (= call!46870 (getCurrentListMapNoExtraKeys!4275 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111183 () Bool)

(declare-fun res!741524 () Bool)

(assert (=> b!1111183 (=> (not res!741524) (not e!633644))))

(declare-datatypes ((List!24250 0))(
  ( (Nil!24247) (Cons!24246 (h!25455 (_ BitVec 64)) (t!34687 List!24250)) )
))
(declare-fun arrayNoDuplicates!0 (array!72221 (_ BitVec 32) List!24250) Bool)

(assert (=> b!1111183 (= res!741524 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24247))))

(declare-fun b!1111184 () Bool)

(declare-fun e!633647 () Bool)

(assert (=> b!1111184 (= e!633644 e!633647)))

(declare-fun res!741520 () Bool)

(assert (=> b!1111184 (=> (not res!741520) (not e!633647))))

(declare-fun lt!496298 () array!72221)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72221 (_ BitVec 32)) Bool)

(assert (=> b!1111184 (= res!741520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496298 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111184 (= lt!496298 (array!72222 (store (arr!34763 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35299 _keys!1208)))))

(declare-fun mapNonEmpty!43294 () Bool)

(declare-fun tp!82472 () Bool)

(declare-fun e!633649 () Bool)

(assert (=> mapNonEmpty!43294 (= mapRes!43294 (and tp!82472 e!633649))))

(declare-fun mapRest!43294 () (Array (_ BitVec 32) ValueCell!13116))

(declare-fun mapKey!43294 () (_ BitVec 32))

(declare-fun mapValue!43294 () ValueCell!13116)

(assert (=> mapNonEmpty!43294 (= (arr!34762 _values!996) (store mapRest!43294 mapKey!43294 mapValue!43294))))

(declare-fun call!46869 () ListLongMap!15535)

(declare-fun b!1111186 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!633645 () Bool)

(declare-fun -!1052 (ListLongMap!15535 (_ BitVec 64)) ListLongMap!15535)

(assert (=> b!1111186 (= e!633645 (= call!46869 (-!1052 call!46870 k0!934)))))

(declare-fun b!1111187 () Bool)

(declare-fun res!741525 () Bool)

(assert (=> b!1111187 (=> (not res!741525) (not e!633647))))

(assert (=> b!1111187 (= res!741525 (arrayNoDuplicates!0 lt!496298 #b00000000000000000000000000000000 Nil!24247))))

(declare-fun b!1111188 () Bool)

(declare-fun res!741519 () Bool)

(assert (=> b!1111188 (=> (not res!741519) (not e!633644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111188 (= res!741519 (validKeyInArray!0 k0!934))))

(declare-fun b!1111189 () Bool)

(declare-fun res!741518 () Bool)

(assert (=> b!1111189 (=> (not res!741518) (not e!633644))))

(assert (=> b!1111189 (= res!741518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111190 () Bool)

(declare-fun e!633646 () Bool)

(assert (=> b!1111190 (= e!633646 true)))

(assert (=> b!1111190 e!633645))

(declare-fun c!109284 () Bool)

(assert (=> b!1111190 (= c!109284 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36466 0))(
  ( (Unit!36467) )
))
(declare-fun lt!496297 () Unit!36466)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!300 (array!72221 array!72219 (_ BitVec 32) (_ BitVec 32) V!41995 V!41995 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36466)

(assert (=> b!1111190 (= lt!496297 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!300 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111191 () Bool)

(declare-fun res!741522 () Bool)

(assert (=> b!1111191 (=> (not res!741522) (not e!633644))))

(assert (=> b!1111191 (= res!741522 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35299 _keys!1208))))))

(declare-fun b!1111192 () Bool)

(assert (=> b!1111192 (= e!633645 (= call!46869 call!46870))))

(declare-fun b!1111185 () Bool)

(declare-fun tp_is_empty!27651 () Bool)

(assert (=> b!1111185 (= e!633649 tp_is_empty!27651)))

(declare-fun res!741516 () Bool)

(assert (=> start!97420 (=> (not res!741516) (not e!633644))))

(assert (=> start!97420 (= res!741516 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35299 _keys!1208))))))

(assert (=> start!97420 e!633644))

(assert (=> start!97420 tp_is_empty!27651))

(declare-fun array_inv!26740 (array!72221) Bool)

(assert (=> start!97420 (array_inv!26740 _keys!1208)))

(assert (=> start!97420 true))

(assert (=> start!97420 tp!82471))

(declare-fun array_inv!26741 (array!72219) Bool)

(assert (=> start!97420 (and (array_inv!26741 _values!996) e!633650)))

(declare-fun b!1111193 () Bool)

(declare-fun res!741517 () Bool)

(assert (=> b!1111193 (=> (not res!741517) (not e!633644))))

(assert (=> b!1111193 (= res!741517 (and (= (size!35298 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35299 _keys!1208) (size!35298 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111194 () Bool)

(assert (=> b!1111194 (= e!633647 (not e!633646))))

(declare-fun res!741526 () Bool)

(assert (=> b!1111194 (=> res!741526 e!633646)))

(assert (=> b!1111194 (= res!741526 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35299 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111194 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496296 () Unit!36466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72221 (_ BitVec 64) (_ BitVec 32)) Unit!36466)

(assert (=> b!1111194 (= lt!496296 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!46867 () Bool)

(declare-fun dynLambda!2403 (Int (_ BitVec 64)) V!41995)

(assert (=> bm!46867 (= call!46869 (getCurrentListMapNoExtraKeys!4275 lt!496298 (array!72220 (store (arr!34762 _values!996) i!673 (ValueCellFull!13116 (dynLambda!2403 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35298 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111195 () Bool)

(assert (=> b!1111195 (= e!633651 tp_is_empty!27651)))

(declare-fun b!1111196 () Bool)

(declare-fun res!741523 () Bool)

(assert (=> b!1111196 (=> (not res!741523) (not e!633644))))

(assert (=> b!1111196 (= res!741523 (= (select (arr!34763 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43294 () Bool)

(assert (=> mapIsEmpty!43294 mapRes!43294))

(assert (= (and start!97420 res!741516) b!1111181))

(assert (= (and b!1111181 res!741521) b!1111193))

(assert (= (and b!1111193 res!741517) b!1111189))

(assert (= (and b!1111189 res!741518) b!1111183))

(assert (= (and b!1111183 res!741524) b!1111191))

(assert (= (and b!1111191 res!741522) b!1111188))

(assert (= (and b!1111188 res!741519) b!1111196))

(assert (= (and b!1111196 res!741523) b!1111184))

(assert (= (and b!1111184 res!741520) b!1111187))

(assert (= (and b!1111187 res!741525) b!1111194))

(assert (= (and b!1111194 (not res!741526)) b!1111190))

(assert (= (and b!1111190 c!109284) b!1111186))

(assert (= (and b!1111190 (not c!109284)) b!1111192))

(assert (= (or b!1111186 b!1111192) bm!46867))

(assert (= (or b!1111186 b!1111192) bm!46866))

(assert (= (and b!1111182 condMapEmpty!43294) mapIsEmpty!43294))

(assert (= (and b!1111182 (not condMapEmpty!43294)) mapNonEmpty!43294))

(get-info :version)

(assert (= (and mapNonEmpty!43294 ((_ is ValueCellFull!13116) mapValue!43294)) b!1111185))

(assert (= (and b!1111182 ((_ is ValueCellFull!13116) mapDefault!43294)) b!1111195))

(assert (= start!97420 b!1111182))

(declare-fun b_lambda!18415 () Bool)

(assert (=> (not b_lambda!18415) (not bm!46867)))

(declare-fun t!34685 () Bool)

(declare-fun tb!8257 () Bool)

(assert (=> (and start!97420 (= defaultEntry!1004 defaultEntry!1004) t!34685) tb!8257))

(declare-fun result!17075 () Bool)

(assert (=> tb!8257 (= result!17075 tp_is_empty!27651)))

(assert (=> bm!46867 t!34685))

(declare-fun b_and!37621 () Bool)

(assert (= b_and!37619 (and (=> t!34685 result!17075) b_and!37621)))

(declare-fun m!1029031 () Bool)

(assert (=> bm!46867 m!1029031))

(declare-fun m!1029033 () Bool)

(assert (=> bm!46867 m!1029033))

(declare-fun m!1029035 () Bool)

(assert (=> bm!46867 m!1029035))

(declare-fun m!1029037 () Bool)

(assert (=> b!1111189 m!1029037))

(declare-fun m!1029039 () Bool)

(assert (=> b!1111186 m!1029039))

(declare-fun m!1029041 () Bool)

(assert (=> b!1111187 m!1029041))

(declare-fun m!1029043 () Bool)

(assert (=> b!1111194 m!1029043))

(declare-fun m!1029045 () Bool)

(assert (=> b!1111194 m!1029045))

(declare-fun m!1029047 () Bool)

(assert (=> mapNonEmpty!43294 m!1029047))

(declare-fun m!1029049 () Bool)

(assert (=> b!1111188 m!1029049))

(declare-fun m!1029051 () Bool)

(assert (=> b!1111196 m!1029051))

(declare-fun m!1029053 () Bool)

(assert (=> b!1111183 m!1029053))

(declare-fun m!1029055 () Bool)

(assert (=> bm!46866 m!1029055))

(declare-fun m!1029057 () Bool)

(assert (=> b!1111190 m!1029057))

(declare-fun m!1029059 () Bool)

(assert (=> b!1111184 m!1029059))

(declare-fun m!1029061 () Bool)

(assert (=> b!1111184 m!1029061))

(declare-fun m!1029063 () Bool)

(assert (=> b!1111181 m!1029063))

(declare-fun m!1029065 () Bool)

(assert (=> start!97420 m!1029065))

(declare-fun m!1029067 () Bool)

(assert (=> start!97420 m!1029067))

(check-sat (not b!1111184) (not start!97420) (not b!1111187) (not b!1111194) (not b!1111186) (not b!1111181) (not mapNonEmpty!43294) (not bm!46867) (not b!1111189) (not b!1111190) (not b_next!23391) (not b_lambda!18415) b_and!37621 (not b!1111183) (not bm!46866) (not b!1111188) tp_is_empty!27651)
(check-sat b_and!37621 (not b_next!23391))
