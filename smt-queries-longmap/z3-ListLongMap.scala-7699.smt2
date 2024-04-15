; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96666 () Bool)

(assert start!96666)

(declare-fun b_free!23119 () Bool)

(declare-fun b_next!23119 () Bool)

(assert (=> start!96666 (= b_free!23119 (not b_next!23119))))

(declare-fun tp!81299 () Bool)

(declare-fun b_and!36945 () Bool)

(assert (=> start!96666 (= tp!81299 b_and!36945)))

(declare-fun b!1099343 () Bool)

(declare-fun res!733661 () Bool)

(declare-fun e!627458 () Bool)

(assert (=> b!1099343 (=> (not res!733661) (not e!627458))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((array!71160 0))(
  ( (array!71161 (arr!34247 (Array (_ BitVec 32) (_ BitVec 64))) (size!34785 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71160)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099343 (= res!733661 (= (select (arr!34247 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42529 () Bool)

(declare-fun mapRes!42529 () Bool)

(declare-fun tp!81298 () Bool)

(declare-fun e!627462 () Bool)

(assert (=> mapNonEmpty!42529 (= mapRes!42529 (and tp!81298 e!627462))))

(declare-datatypes ((V!41353 0))(
  ( (V!41354 (val!13641 Int)) )
))
(declare-datatypes ((ValueCell!12875 0))(
  ( (ValueCellFull!12875 (v!16266 V!41353)) (EmptyCell!12875) )
))
(declare-datatypes ((array!71162 0))(
  ( (array!71163 (arr!34248 (Array (_ BitVec 32) ValueCell!12875)) (size!34786 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71162)

(declare-fun mapKey!42529 () (_ BitVec 32))

(declare-fun mapValue!42529 () ValueCell!12875)

(declare-fun mapRest!42529 () (Array (_ BitVec 32) ValueCell!12875))

(assert (=> mapNonEmpty!42529 (= (arr!34248 _values!874) (store mapRest!42529 mapKey!42529 mapValue!42529))))

(declare-fun b!1099345 () Bool)

(declare-fun res!733656 () Bool)

(assert (=> b!1099345 (=> (not res!733656) (not e!627458))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099345 (= res!733656 (and (= (size!34786 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34785 _keys!1070) (size!34786 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!17398 0))(
  ( (tuple2!17399 (_1!8710 (_ BitVec 64)) (_2!8710 V!41353)) )
))
(declare-datatypes ((List!23990 0))(
  ( (Nil!23987) (Cons!23986 (h!25195 tuple2!17398) (t!34146 List!23990)) )
))
(declare-datatypes ((ListLongMap!15367 0))(
  ( (ListLongMap!15368 (toList!7699 List!23990)) )
))
(declare-fun lt!492142 () ListLongMap!15367)

(declare-fun lt!492149 () ListLongMap!15367)

(declare-fun e!627461 () Bool)

(declare-fun lt!492145 () tuple2!17398)

(declare-fun b!1099346 () Bool)

(declare-fun +!3410 (ListLongMap!15367 tuple2!17398) ListLongMap!15367)

(assert (=> b!1099346 (= e!627461 (= lt!492149 (+!3410 lt!492142 lt!492145)))))

(declare-fun lt!492147 () ListLongMap!15367)

(declare-fun lt!492143 () ListLongMap!15367)

(assert (=> b!1099346 (= lt!492147 (+!3410 lt!492143 lt!492145))))

(declare-fun zeroValue!831 () V!41353)

(assert (=> b!1099346 (= lt!492145 (tuple2!17399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099347 () Bool)

(declare-fun e!627457 () Bool)

(declare-fun e!627456 () Bool)

(assert (=> b!1099347 (= e!627457 (and e!627456 mapRes!42529))))

(declare-fun condMapEmpty!42529 () Bool)

(declare-fun mapDefault!42529 () ValueCell!12875)

(assert (=> b!1099347 (= condMapEmpty!42529 (= (arr!34248 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12875)) mapDefault!42529)))))

(declare-fun b!1099348 () Bool)

(declare-fun res!733663 () Bool)

(assert (=> b!1099348 (=> (not res!733663) (not e!627458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71160 (_ BitVec 32)) Bool)

(assert (=> b!1099348 (= res!733663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1099349 () Bool)

(declare-fun res!733655 () Bool)

(assert (=> b!1099349 (=> (not res!733655) (not e!627458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099349 (= res!733655 (validKeyInArray!0 k0!904))))

(declare-fun b!1099350 () Bool)

(declare-fun e!627459 () Bool)

(assert (=> b!1099350 (= e!627458 e!627459)))

(declare-fun res!733664 () Bool)

(assert (=> b!1099350 (=> (not res!733664) (not e!627459))))

(declare-fun lt!492146 () array!71160)

(assert (=> b!1099350 (= res!733664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492146 mask!1414))))

(assert (=> b!1099350 (= lt!492146 (array!71161 (store (arr!34247 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34785 _keys!1070)))))

(declare-fun b!1099351 () Bool)

(declare-fun tp_is_empty!27169 () Bool)

(assert (=> b!1099351 (= e!627462 tp_is_empty!27169)))

(declare-fun b!1099344 () Bool)

(declare-fun res!733658 () Bool)

(assert (=> b!1099344 (=> (not res!733658) (not e!627458))))

(declare-datatypes ((List!23991 0))(
  ( (Nil!23988) (Cons!23987 (h!25196 (_ BitVec 64)) (t!34147 List!23991)) )
))
(declare-fun arrayNoDuplicates!0 (array!71160 (_ BitVec 32) List!23991) Bool)

(assert (=> b!1099344 (= res!733658 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23988))))

(declare-fun res!733660 () Bool)

(assert (=> start!96666 (=> (not res!733660) (not e!627458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96666 (= res!733660 (validMask!0 mask!1414))))

(assert (=> start!96666 e!627458))

(assert (=> start!96666 tp!81299))

(assert (=> start!96666 true))

(assert (=> start!96666 tp_is_empty!27169))

(declare-fun array_inv!26414 (array!71160) Bool)

(assert (=> start!96666 (array_inv!26414 _keys!1070)))

(declare-fun array_inv!26415 (array!71162) Bool)

(assert (=> start!96666 (and (array_inv!26415 _values!874) e!627457)))

(declare-fun b!1099352 () Bool)

(declare-fun res!733659 () Bool)

(assert (=> b!1099352 (=> (not res!733659) (not e!627459))))

(assert (=> b!1099352 (= res!733659 (arrayNoDuplicates!0 lt!492146 #b00000000000000000000000000000000 Nil!23988))))

(declare-fun b!1099353 () Bool)

(declare-fun res!733662 () Bool)

(assert (=> b!1099353 (=> (not res!733662) (not e!627458))))

(assert (=> b!1099353 (= res!733662 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34785 _keys!1070))))))

(declare-fun b!1099354 () Bool)

(assert (=> b!1099354 (= e!627456 tp_is_empty!27169)))

(declare-fun b!1099355 () Bool)

(assert (=> b!1099355 (= e!627459 (not e!627461))))

(declare-fun res!733657 () Bool)

(assert (=> b!1099355 (=> res!733657 e!627461)))

(assert (=> b!1099355 (= res!733657 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41353)

(declare-fun getCurrentListMap!4319 (array!71160 array!71162 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) Int) ListLongMap!15367)

(assert (=> b!1099355 (= lt!492149 (getCurrentListMap!4319 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492150 () array!71162)

(assert (=> b!1099355 (= lt!492147 (getCurrentListMap!4319 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492141 () ListLongMap!15367)

(assert (=> b!1099355 (and (= lt!492143 lt!492141) (= lt!492141 lt!492143))))

(declare-fun -!934 (ListLongMap!15367 (_ BitVec 64)) ListLongMap!15367)

(assert (=> b!1099355 (= lt!492141 (-!934 lt!492142 k0!904))))

(declare-datatypes ((Unit!35985 0))(
  ( (Unit!35986) )
))
(declare-fun lt!492148 () Unit!35985)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!208 (array!71160 array!71162 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35985)

(assert (=> b!1099355 (= lt!492148 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!208 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4226 (array!71160 array!71162 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) Int) ListLongMap!15367)

(assert (=> b!1099355 (= lt!492143 (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2295 (Int (_ BitVec 64)) V!41353)

(assert (=> b!1099355 (= lt!492150 (array!71163 (store (arr!34248 _values!874) i!650 (ValueCellFull!12875 (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34786 _values!874)))))

(assert (=> b!1099355 (= lt!492142 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099355 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492144 () Unit!35985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71160 (_ BitVec 64) (_ BitVec 32)) Unit!35985)

(assert (=> b!1099355 (= lt!492144 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42529 () Bool)

(assert (=> mapIsEmpty!42529 mapRes!42529))

(assert (= (and start!96666 res!733660) b!1099345))

(assert (= (and b!1099345 res!733656) b!1099348))

(assert (= (and b!1099348 res!733663) b!1099344))

(assert (= (and b!1099344 res!733658) b!1099353))

(assert (= (and b!1099353 res!733662) b!1099349))

(assert (= (and b!1099349 res!733655) b!1099343))

(assert (= (and b!1099343 res!733661) b!1099350))

(assert (= (and b!1099350 res!733664) b!1099352))

(assert (= (and b!1099352 res!733659) b!1099355))

(assert (= (and b!1099355 (not res!733657)) b!1099346))

(assert (= (and b!1099347 condMapEmpty!42529) mapIsEmpty!42529))

(assert (= (and b!1099347 (not condMapEmpty!42529)) mapNonEmpty!42529))

(get-info :version)

(assert (= (and mapNonEmpty!42529 ((_ is ValueCellFull!12875) mapValue!42529)) b!1099351))

(assert (= (and b!1099347 ((_ is ValueCellFull!12875) mapDefault!42529)) b!1099354))

(assert (= start!96666 b!1099347))

(declare-fun b_lambda!17905 () Bool)

(assert (=> (not b_lambda!17905) (not b!1099355)))

(declare-fun t!34145 () Bool)

(declare-fun tb!7977 () Bool)

(assert (=> (and start!96666 (= defaultEntry!882 defaultEntry!882) t!34145) tb!7977))

(declare-fun result!16495 () Bool)

(assert (=> tb!7977 (= result!16495 tp_is_empty!27169)))

(assert (=> b!1099355 t!34145))

(declare-fun b_and!36947 () Bool)

(assert (= b_and!36945 (and (=> t!34145 result!16495) b_and!36947)))

(declare-fun m!1018849 () Bool)

(assert (=> b!1099343 m!1018849))

(declare-fun m!1018851 () Bool)

(assert (=> b!1099344 m!1018851))

(declare-fun m!1018853 () Bool)

(assert (=> b!1099348 m!1018853))

(declare-fun m!1018855 () Bool)

(assert (=> mapNonEmpty!42529 m!1018855))

(declare-fun m!1018857 () Bool)

(assert (=> b!1099350 m!1018857))

(declare-fun m!1018859 () Bool)

(assert (=> b!1099350 m!1018859))

(declare-fun m!1018861 () Bool)

(assert (=> b!1099346 m!1018861))

(declare-fun m!1018863 () Bool)

(assert (=> b!1099346 m!1018863))

(declare-fun m!1018865 () Bool)

(assert (=> b!1099355 m!1018865))

(declare-fun m!1018867 () Bool)

(assert (=> b!1099355 m!1018867))

(declare-fun m!1018869 () Bool)

(assert (=> b!1099355 m!1018869))

(declare-fun m!1018871 () Bool)

(assert (=> b!1099355 m!1018871))

(declare-fun m!1018873 () Bool)

(assert (=> b!1099355 m!1018873))

(declare-fun m!1018875 () Bool)

(assert (=> b!1099355 m!1018875))

(declare-fun m!1018877 () Bool)

(assert (=> b!1099355 m!1018877))

(declare-fun m!1018879 () Bool)

(assert (=> b!1099355 m!1018879))

(declare-fun m!1018881 () Bool)

(assert (=> b!1099355 m!1018881))

(declare-fun m!1018883 () Bool)

(assert (=> b!1099355 m!1018883))

(declare-fun m!1018885 () Bool)

(assert (=> b!1099349 m!1018885))

(declare-fun m!1018887 () Bool)

(assert (=> b!1099352 m!1018887))

(declare-fun m!1018889 () Bool)

(assert (=> start!96666 m!1018889))

(declare-fun m!1018891 () Bool)

(assert (=> start!96666 m!1018891))

(declare-fun m!1018893 () Bool)

(assert (=> start!96666 m!1018893))

(check-sat (not b_lambda!17905) (not b!1099348) (not mapNonEmpty!42529) (not b!1099350) (not b!1099346) (not b!1099355) b_and!36947 (not b_next!23119) (not b!1099349) tp_is_empty!27169 (not start!96666) (not b!1099352) (not b!1099344))
(check-sat b_and!36947 (not b_next!23119))
(get-model)

(declare-fun b_lambda!17911 () Bool)

(assert (= b_lambda!17905 (or (and start!96666 b_free!23119) b_lambda!17911)))

(check-sat (not b!1099348) (not mapNonEmpty!42529) (not b!1099350) (not b!1099346) (not b!1099355) b_and!36947 (not b_lambda!17911) (not b_next!23119) (not b!1099349) tp_is_empty!27169 (not start!96666) (not b!1099352) (not b!1099344))
(check-sat b_and!36947 (not b_next!23119))
(get-model)

(declare-fun d!130357 () Bool)

(declare-fun res!733730 () Bool)

(declare-fun e!627511 () Bool)

(assert (=> d!130357 (=> res!733730 e!627511)))

(assert (=> d!130357 (= res!733730 (bvsge #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(assert (=> d!130357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492146 mask!1414) e!627511)))

(declare-fun bm!45971 () Bool)

(declare-fun call!45974 () Bool)

(assert (=> bm!45971 (= call!45974 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!492146 mask!1414))))

(declare-fun b!1099448 () Bool)

(declare-fun e!627512 () Bool)

(assert (=> b!1099448 (= e!627512 call!45974)))

(declare-fun b!1099449 () Bool)

(declare-fun e!627513 () Bool)

(assert (=> b!1099449 (= e!627513 call!45974)))

(declare-fun b!1099450 () Bool)

(assert (=> b!1099450 (= e!627511 e!627513)))

(declare-fun c!108577 () Bool)

(assert (=> b!1099450 (= c!108577 (validKeyInArray!0 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(declare-fun b!1099451 () Bool)

(assert (=> b!1099451 (= e!627513 e!627512)))

(declare-fun lt!492217 () (_ BitVec 64))

(assert (=> b!1099451 (= lt!492217 (select (arr!34247 lt!492146) #b00000000000000000000000000000000))))

(declare-fun lt!492219 () Unit!35985)

(assert (=> b!1099451 (= lt!492219 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!492146 lt!492217 #b00000000000000000000000000000000))))

(assert (=> b!1099451 (arrayContainsKey!0 lt!492146 lt!492217 #b00000000000000000000000000000000)))

(declare-fun lt!492218 () Unit!35985)

(assert (=> b!1099451 (= lt!492218 lt!492219)))

(declare-fun res!733729 () Bool)

(declare-datatypes ((SeekEntryResult!9910 0))(
  ( (MissingZero!9910 (index!42011 (_ BitVec 32))) (Found!9910 (index!42012 (_ BitVec 32))) (Intermediate!9910 (undefined!10722 Bool) (index!42013 (_ BitVec 32)) (x!98892 (_ BitVec 32))) (Undefined!9910) (MissingVacant!9910 (index!42014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71160 (_ BitVec 32)) SeekEntryResult!9910)

(assert (=> b!1099451 (= res!733729 (= (seekEntryOrOpen!0 (select (arr!34247 lt!492146) #b00000000000000000000000000000000) lt!492146 mask!1414) (Found!9910 #b00000000000000000000000000000000)))))

(assert (=> b!1099451 (=> (not res!733729) (not e!627512))))

(assert (= (and d!130357 (not res!733730)) b!1099450))

(assert (= (and b!1099450 c!108577) b!1099451))

(assert (= (and b!1099450 (not c!108577)) b!1099449))

(assert (= (and b!1099451 res!733729) b!1099448))

(assert (= (or b!1099448 b!1099449) bm!45971))

(declare-fun m!1018987 () Bool)

(assert (=> bm!45971 m!1018987))

(declare-fun m!1018989 () Bool)

(assert (=> b!1099450 m!1018989))

(assert (=> b!1099450 m!1018989))

(declare-fun m!1018991 () Bool)

(assert (=> b!1099450 m!1018991))

(assert (=> b!1099451 m!1018989))

(declare-fun m!1018993 () Bool)

(assert (=> b!1099451 m!1018993))

(declare-fun m!1018995 () Bool)

(assert (=> b!1099451 m!1018995))

(assert (=> b!1099451 m!1018989))

(declare-fun m!1018997 () Bool)

(assert (=> b!1099451 m!1018997))

(assert (=> b!1099350 d!130357))

(declare-fun d!130359 () Bool)

(declare-fun res!733735 () Bool)

(declare-fun e!627518 () Bool)

(assert (=> d!130359 (=> res!733735 e!627518)))

(assert (=> d!130359 (= res!733735 (= (select (arr!34247 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130359 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627518)))

(declare-fun b!1099456 () Bool)

(declare-fun e!627519 () Bool)

(assert (=> b!1099456 (= e!627518 e!627519)))

(declare-fun res!733736 () Bool)

(assert (=> b!1099456 (=> (not res!733736) (not e!627519))))

(assert (=> b!1099456 (= res!733736 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34785 _keys!1070)))))

(declare-fun b!1099457 () Bool)

(assert (=> b!1099457 (= e!627519 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130359 (not res!733735)) b!1099456))

(assert (= (and b!1099456 res!733736) b!1099457))

(declare-fun m!1018999 () Bool)

(assert (=> d!130359 m!1018999))

(declare-fun m!1019001 () Bool)

(assert (=> b!1099457 m!1019001))

(assert (=> b!1099355 d!130359))

(declare-fun b!1099500 () Bool)

(declare-fun e!627546 () Bool)

(declare-fun call!45992 () Bool)

(assert (=> b!1099500 (= e!627546 (not call!45992))))

(declare-fun b!1099501 () Bool)

(declare-fun e!627549 () Bool)

(assert (=> b!1099501 (= e!627549 (validKeyInArray!0 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun call!45990 () ListLongMap!15367)

(declare-fun c!108592 () Bool)

(declare-fun call!45989 () ListLongMap!15367)

(declare-fun c!108591 () Bool)

(declare-fun call!45994 () ListLongMap!15367)

(declare-fun call!45991 () ListLongMap!15367)

(declare-fun bm!45986 () Bool)

(assert (=> bm!45986 (= call!45994 (+!3410 (ite c!108591 call!45989 (ite c!108592 call!45990 call!45991)) (ite (or c!108591 c!108592) (tuple2!17399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099502 () Bool)

(declare-fun e!627554 () Bool)

(assert (=> b!1099502 (= e!627546 e!627554)))

(declare-fun res!733757 () Bool)

(assert (=> b!1099502 (= res!733757 call!45992)))

(assert (=> b!1099502 (=> (not res!733757) (not e!627554))))

(declare-fun b!1099503 () Bool)

(declare-fun e!627552 () Bool)

(declare-fun e!627551 () Bool)

(assert (=> b!1099503 (= e!627552 e!627551)))

(declare-fun res!733760 () Bool)

(declare-fun call!45993 () Bool)

(assert (=> b!1099503 (= res!733760 call!45993)))

(assert (=> b!1099503 (=> (not res!733760) (not e!627551))))

(declare-fun lt!492282 () ListLongMap!15367)

(declare-fun e!627558 () Bool)

(declare-fun b!1099504 () Bool)

(declare-fun apply!941 (ListLongMap!15367 (_ BitVec 64)) V!41353)

(declare-fun get!17629 (ValueCell!12875 V!41353) V!41353)

(assert (=> b!1099504 (= e!627558 (= (apply!941 lt!492282 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)) (get!17629 (select (arr!34248 _values!874) #b00000000000000000000000000000000) (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099504 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34786 _values!874)))))

(assert (=> b!1099504 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun d!130361 () Bool)

(declare-fun e!627553 () Bool)

(assert (=> d!130361 e!627553))

(declare-fun res!733759 () Bool)

(assert (=> d!130361 (=> (not res!733759) (not e!627553))))

(assert (=> d!130361 (= res!733759 (or (bvsge #b00000000000000000000000000000000 (size!34785 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))))

(declare-fun lt!492285 () ListLongMap!15367)

(assert (=> d!130361 (= lt!492282 lt!492285)))

(declare-fun lt!492279 () Unit!35985)

(declare-fun e!627547 () Unit!35985)

(assert (=> d!130361 (= lt!492279 e!627547)))

(declare-fun c!108590 () Bool)

(declare-fun e!627548 () Bool)

(assert (=> d!130361 (= c!108590 e!627548)))

(declare-fun res!733762 () Bool)

(assert (=> d!130361 (=> (not res!733762) (not e!627548))))

(assert (=> d!130361 (= res!733762 (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun e!627557 () ListLongMap!15367)

(assert (=> d!130361 (= lt!492285 e!627557)))

(assert (=> d!130361 (= c!108591 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130361 (validMask!0 mask!1414)))

(assert (=> d!130361 (= (getCurrentListMap!4319 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492282)))

(declare-fun b!1099505 () Bool)

(declare-fun res!733758 () Bool)

(assert (=> b!1099505 (=> (not res!733758) (not e!627553))))

(declare-fun e!627556 () Bool)

(assert (=> b!1099505 (= res!733758 e!627556)))

(declare-fun res!733763 () Bool)

(assert (=> b!1099505 (=> res!733763 e!627556)))

(assert (=> b!1099505 (= res!733763 (not e!627549))))

(declare-fun res!733756 () Bool)

(assert (=> b!1099505 (=> (not res!733756) (not e!627549))))

(assert (=> b!1099505 (= res!733756 (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun b!1099506 () Bool)

(assert (=> b!1099506 (= e!627552 (not call!45993))))

(declare-fun b!1099507 () Bool)

(assert (=> b!1099507 (= e!627548 (validKeyInArray!0 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099508 () Bool)

(declare-fun c!108594 () Bool)

(assert (=> b!1099508 (= c!108594 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!627550 () ListLongMap!15367)

(declare-fun e!627555 () ListLongMap!15367)

(assert (=> b!1099508 (= e!627550 e!627555)))

(declare-fun bm!45987 () Bool)

(declare-fun call!45995 () ListLongMap!15367)

(assert (=> bm!45987 (= call!45995 call!45994)))

(declare-fun b!1099509 () Bool)

(assert (=> b!1099509 (= e!627555 call!45995)))

(declare-fun b!1099510 () Bool)

(assert (=> b!1099510 (= e!627556 e!627558)))

(declare-fun res!733761 () Bool)

(assert (=> b!1099510 (=> (not res!733761) (not e!627558))))

(declare-fun contains!6362 (ListLongMap!15367 (_ BitVec 64)) Bool)

(assert (=> b!1099510 (= res!733761 (contains!6362 lt!492282 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099510 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun bm!45988 () Bool)

(assert (=> bm!45988 (= call!45990 call!45989)))

(declare-fun bm!45989 () Bool)

(assert (=> bm!45989 (= call!45993 (contains!6362 lt!492282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099511 () Bool)

(declare-fun res!733755 () Bool)

(assert (=> b!1099511 (=> (not res!733755) (not e!627553))))

(assert (=> b!1099511 (= res!733755 e!627552)))

(declare-fun c!108595 () Bool)

(assert (=> b!1099511 (= c!108595 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099512 () Bool)

(assert (=> b!1099512 (= e!627553 e!627546)))

(declare-fun c!108593 () Bool)

(assert (=> b!1099512 (= c!108593 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099513 () Bool)

(assert (=> b!1099513 (= e!627557 e!627550)))

(assert (=> b!1099513 (= c!108592 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45990 () Bool)

(assert (=> bm!45990 (= call!45991 call!45990)))

(declare-fun b!1099514 () Bool)

(assert (=> b!1099514 (= e!627550 call!45995)))

(declare-fun b!1099515 () Bool)

(assert (=> b!1099515 (= e!627554 (= (apply!941 lt!492282 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!45991 () Bool)

(assert (=> bm!45991 (= call!45989 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099516 () Bool)

(declare-fun Unit!35987 () Unit!35985)

(assert (=> b!1099516 (= e!627547 Unit!35987)))

(declare-fun b!1099517 () Bool)

(assert (=> b!1099517 (= e!627551 (= (apply!941 lt!492282 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099518 () Bool)

(assert (=> b!1099518 (= e!627555 call!45991)))

(declare-fun b!1099519 () Bool)

(assert (=> b!1099519 (= e!627557 (+!3410 call!45994 (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45992 () Bool)

(assert (=> bm!45992 (= call!45992 (contains!6362 lt!492282 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099520 () Bool)

(declare-fun lt!492265 () Unit!35985)

(assert (=> b!1099520 (= e!627547 lt!492265)))

(declare-fun lt!492269 () ListLongMap!15367)

(assert (=> b!1099520 (= lt!492269 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492272 () (_ BitVec 64))

(assert (=> b!1099520 (= lt!492272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492266 () (_ BitVec 64))

(assert (=> b!1099520 (= lt!492266 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492283 () Unit!35985)

(declare-fun addStillContains!654 (ListLongMap!15367 (_ BitVec 64) V!41353 (_ BitVec 64)) Unit!35985)

(assert (=> b!1099520 (= lt!492283 (addStillContains!654 lt!492269 lt!492272 zeroValue!831 lt!492266))))

(assert (=> b!1099520 (contains!6362 (+!3410 lt!492269 (tuple2!17399 lt!492272 zeroValue!831)) lt!492266)))

(declare-fun lt!492276 () Unit!35985)

(assert (=> b!1099520 (= lt!492276 lt!492283)))

(declare-fun lt!492277 () ListLongMap!15367)

(assert (=> b!1099520 (= lt!492277 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492270 () (_ BitVec 64))

(assert (=> b!1099520 (= lt!492270 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492280 () (_ BitVec 64))

(assert (=> b!1099520 (= lt!492280 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492281 () Unit!35985)

(declare-fun addApplyDifferent!510 (ListLongMap!15367 (_ BitVec 64) V!41353 (_ BitVec 64)) Unit!35985)

(assert (=> b!1099520 (= lt!492281 (addApplyDifferent!510 lt!492277 lt!492270 minValue!831 lt!492280))))

(assert (=> b!1099520 (= (apply!941 (+!3410 lt!492277 (tuple2!17399 lt!492270 minValue!831)) lt!492280) (apply!941 lt!492277 lt!492280))))

(declare-fun lt!492278 () Unit!35985)

(assert (=> b!1099520 (= lt!492278 lt!492281)))

(declare-fun lt!492271 () ListLongMap!15367)

(assert (=> b!1099520 (= lt!492271 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492274 () (_ BitVec 64))

(assert (=> b!1099520 (= lt!492274 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492267 () (_ BitVec 64))

(assert (=> b!1099520 (= lt!492267 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492273 () Unit!35985)

(assert (=> b!1099520 (= lt!492273 (addApplyDifferent!510 lt!492271 lt!492274 zeroValue!831 lt!492267))))

(assert (=> b!1099520 (= (apply!941 (+!3410 lt!492271 (tuple2!17399 lt!492274 zeroValue!831)) lt!492267) (apply!941 lt!492271 lt!492267))))

(declare-fun lt!492264 () Unit!35985)

(assert (=> b!1099520 (= lt!492264 lt!492273)))

(declare-fun lt!492268 () ListLongMap!15367)

(assert (=> b!1099520 (= lt!492268 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492275 () (_ BitVec 64))

(assert (=> b!1099520 (= lt!492275 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492284 () (_ BitVec 64))

(assert (=> b!1099520 (= lt!492284 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099520 (= lt!492265 (addApplyDifferent!510 lt!492268 lt!492275 minValue!831 lt!492284))))

(assert (=> b!1099520 (= (apply!941 (+!3410 lt!492268 (tuple2!17399 lt!492275 minValue!831)) lt!492284) (apply!941 lt!492268 lt!492284))))

(assert (= (and d!130361 c!108591) b!1099519))

(assert (= (and d!130361 (not c!108591)) b!1099513))

(assert (= (and b!1099513 c!108592) b!1099514))

(assert (= (and b!1099513 (not c!108592)) b!1099508))

(assert (= (and b!1099508 c!108594) b!1099509))

(assert (= (and b!1099508 (not c!108594)) b!1099518))

(assert (= (or b!1099509 b!1099518) bm!45990))

(assert (= (or b!1099514 bm!45990) bm!45988))

(assert (= (or b!1099514 b!1099509) bm!45987))

(assert (= (or b!1099519 bm!45988) bm!45991))

(assert (= (or b!1099519 bm!45987) bm!45986))

(assert (= (and d!130361 res!733762) b!1099507))

(assert (= (and d!130361 c!108590) b!1099520))

(assert (= (and d!130361 (not c!108590)) b!1099516))

(assert (= (and d!130361 res!733759) b!1099505))

(assert (= (and b!1099505 res!733756) b!1099501))

(assert (= (and b!1099505 (not res!733763)) b!1099510))

(assert (= (and b!1099510 res!733761) b!1099504))

(assert (= (and b!1099505 res!733758) b!1099511))

(assert (= (and b!1099511 c!108595) b!1099503))

(assert (= (and b!1099511 (not c!108595)) b!1099506))

(assert (= (and b!1099503 res!733760) b!1099517))

(assert (= (or b!1099503 b!1099506) bm!45989))

(assert (= (and b!1099511 res!733755) b!1099512))

(assert (= (and b!1099512 c!108593) b!1099502))

(assert (= (and b!1099512 (not c!108593)) b!1099500))

(assert (= (and b!1099502 res!733757) b!1099515))

(assert (= (or b!1099502 b!1099500) bm!45992))

(declare-fun b_lambda!17913 () Bool)

(assert (=> (not b_lambda!17913) (not b!1099504)))

(assert (=> b!1099504 t!34145))

(declare-fun b_and!36957 () Bool)

(assert (= b_and!36947 (and (=> t!34145 result!16495) b_and!36957)))

(declare-fun m!1019003 () Bool)

(assert (=> b!1099519 m!1019003))

(declare-fun m!1019005 () Bool)

(assert (=> bm!45986 m!1019005))

(assert (=> b!1099510 m!1018999))

(assert (=> b!1099510 m!1018999))

(declare-fun m!1019007 () Bool)

(assert (=> b!1099510 m!1019007))

(declare-fun m!1019009 () Bool)

(assert (=> bm!45989 m!1019009))

(declare-fun m!1019011 () Bool)

(assert (=> b!1099515 m!1019011))

(assert (=> d!130361 m!1018889))

(assert (=> bm!45991 m!1018875))

(declare-fun m!1019013 () Bool)

(assert (=> bm!45992 m!1019013))

(declare-fun m!1019015 () Bool)

(assert (=> b!1099520 m!1019015))

(declare-fun m!1019017 () Bool)

(assert (=> b!1099520 m!1019017))

(declare-fun m!1019019 () Bool)

(assert (=> b!1099520 m!1019019))

(assert (=> b!1099520 m!1018875))

(assert (=> b!1099520 m!1019017))

(declare-fun m!1019021 () Bool)

(assert (=> b!1099520 m!1019021))

(declare-fun m!1019023 () Bool)

(assert (=> b!1099520 m!1019023))

(assert (=> b!1099520 m!1019015))

(declare-fun m!1019025 () Bool)

(assert (=> b!1099520 m!1019025))

(declare-fun m!1019027 () Bool)

(assert (=> b!1099520 m!1019027))

(assert (=> b!1099520 m!1018999))

(declare-fun m!1019029 () Bool)

(assert (=> b!1099520 m!1019029))

(declare-fun m!1019031 () Bool)

(assert (=> b!1099520 m!1019031))

(declare-fun m!1019033 () Bool)

(assert (=> b!1099520 m!1019033))

(declare-fun m!1019035 () Bool)

(assert (=> b!1099520 m!1019035))

(assert (=> b!1099520 m!1019033))

(declare-fun m!1019037 () Bool)

(assert (=> b!1099520 m!1019037))

(declare-fun m!1019039 () Bool)

(assert (=> b!1099520 m!1019039))

(assert (=> b!1099520 m!1019029))

(declare-fun m!1019041 () Bool)

(assert (=> b!1099520 m!1019041))

(declare-fun m!1019043 () Bool)

(assert (=> b!1099520 m!1019043))

(declare-fun m!1019045 () Bool)

(assert (=> b!1099517 m!1019045))

(declare-fun m!1019047 () Bool)

(assert (=> b!1099504 m!1019047))

(assert (=> b!1099504 m!1018865))

(assert (=> b!1099504 m!1018999))

(assert (=> b!1099504 m!1019047))

(assert (=> b!1099504 m!1018865))

(declare-fun m!1019049 () Bool)

(assert (=> b!1099504 m!1019049))

(assert (=> b!1099504 m!1018999))

(declare-fun m!1019051 () Bool)

(assert (=> b!1099504 m!1019051))

(assert (=> b!1099507 m!1018999))

(assert (=> b!1099507 m!1018999))

(declare-fun m!1019053 () Bool)

(assert (=> b!1099507 m!1019053))

(assert (=> b!1099501 m!1018999))

(assert (=> b!1099501 m!1018999))

(assert (=> b!1099501 m!1019053))

(assert (=> b!1099355 d!130361))

(declare-fun d!130363 () Bool)

(declare-fun lt!492288 () ListLongMap!15367)

(assert (=> d!130363 (not (contains!6362 lt!492288 k0!904))))

(declare-fun removeStrictlySorted!82 (List!23990 (_ BitVec 64)) List!23990)

(assert (=> d!130363 (= lt!492288 (ListLongMap!15368 (removeStrictlySorted!82 (toList!7699 lt!492142) k0!904)))))

(assert (=> d!130363 (= (-!934 lt!492142 k0!904) lt!492288)))

(declare-fun bs!32264 () Bool)

(assert (= bs!32264 d!130363))

(declare-fun m!1019055 () Bool)

(assert (=> bs!32264 m!1019055))

(declare-fun m!1019057 () Bool)

(assert (=> bs!32264 m!1019057))

(assert (=> b!1099355 d!130363))

(declare-fun b!1099521 () Bool)

(declare-fun e!627559 () Bool)

(declare-fun call!45999 () Bool)

(assert (=> b!1099521 (= e!627559 (not call!45999))))

(declare-fun b!1099522 () Bool)

(declare-fun e!627562 () Bool)

(assert (=> b!1099522 (= e!627562 (validKeyInArray!0 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(declare-fun bm!45993 () Bool)

(declare-fun call!46001 () ListLongMap!15367)

(declare-fun c!108597 () Bool)

(declare-fun c!108598 () Bool)

(declare-fun call!45998 () ListLongMap!15367)

(declare-fun call!45996 () ListLongMap!15367)

(declare-fun call!45997 () ListLongMap!15367)

(assert (=> bm!45993 (= call!46001 (+!3410 (ite c!108597 call!45996 (ite c!108598 call!45997 call!45998)) (ite (or c!108597 c!108598) (tuple2!17399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099523 () Bool)

(declare-fun e!627567 () Bool)

(assert (=> b!1099523 (= e!627559 e!627567)))

(declare-fun res!733766 () Bool)

(assert (=> b!1099523 (= res!733766 call!45999)))

(assert (=> b!1099523 (=> (not res!733766) (not e!627567))))

(declare-fun b!1099524 () Bool)

(declare-fun e!627565 () Bool)

(declare-fun e!627564 () Bool)

(assert (=> b!1099524 (= e!627565 e!627564)))

(declare-fun res!733769 () Bool)

(declare-fun call!46000 () Bool)

(assert (=> b!1099524 (= res!733769 call!46000)))

(assert (=> b!1099524 (=> (not res!733769) (not e!627564))))

(declare-fun b!1099525 () Bool)

(declare-fun lt!492307 () ListLongMap!15367)

(declare-fun e!627571 () Bool)

(assert (=> b!1099525 (= e!627571 (= (apply!941 lt!492307 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)) (get!17629 (select (arr!34248 lt!492150) #b00000000000000000000000000000000) (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34786 lt!492150)))))

(assert (=> b!1099525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(declare-fun d!130365 () Bool)

(declare-fun e!627566 () Bool)

(assert (=> d!130365 e!627566))

(declare-fun res!733768 () Bool)

(assert (=> d!130365 (=> (not res!733768) (not e!627566))))

(assert (=> d!130365 (= res!733768 (or (bvsge #b00000000000000000000000000000000 (size!34785 lt!492146)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))))

(declare-fun lt!492310 () ListLongMap!15367)

(assert (=> d!130365 (= lt!492307 lt!492310)))

(declare-fun lt!492304 () Unit!35985)

(declare-fun e!627560 () Unit!35985)

(assert (=> d!130365 (= lt!492304 e!627560)))

(declare-fun c!108596 () Bool)

(declare-fun e!627561 () Bool)

(assert (=> d!130365 (= c!108596 e!627561)))

(declare-fun res!733771 () Bool)

(assert (=> d!130365 (=> (not res!733771) (not e!627561))))

(assert (=> d!130365 (= res!733771 (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(declare-fun e!627570 () ListLongMap!15367)

(assert (=> d!130365 (= lt!492310 e!627570)))

(assert (=> d!130365 (= c!108597 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130365 (validMask!0 mask!1414)))

(assert (=> d!130365 (= (getCurrentListMap!4319 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492307)))

(declare-fun b!1099526 () Bool)

(declare-fun res!733767 () Bool)

(assert (=> b!1099526 (=> (not res!733767) (not e!627566))))

(declare-fun e!627569 () Bool)

(assert (=> b!1099526 (= res!733767 e!627569)))

(declare-fun res!733772 () Bool)

(assert (=> b!1099526 (=> res!733772 e!627569)))

(assert (=> b!1099526 (= res!733772 (not e!627562))))

(declare-fun res!733765 () Bool)

(assert (=> b!1099526 (=> (not res!733765) (not e!627562))))

(assert (=> b!1099526 (= res!733765 (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(declare-fun b!1099527 () Bool)

(assert (=> b!1099527 (= e!627565 (not call!46000))))

(declare-fun b!1099528 () Bool)

(assert (=> b!1099528 (= e!627561 (validKeyInArray!0 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(declare-fun b!1099529 () Bool)

(declare-fun c!108600 () Bool)

(assert (=> b!1099529 (= c!108600 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!627563 () ListLongMap!15367)

(declare-fun e!627568 () ListLongMap!15367)

(assert (=> b!1099529 (= e!627563 e!627568)))

(declare-fun bm!45994 () Bool)

(declare-fun call!46002 () ListLongMap!15367)

(assert (=> bm!45994 (= call!46002 call!46001)))

(declare-fun b!1099530 () Bool)

(assert (=> b!1099530 (= e!627568 call!46002)))

(declare-fun b!1099531 () Bool)

(assert (=> b!1099531 (= e!627569 e!627571)))

(declare-fun res!733770 () Bool)

(assert (=> b!1099531 (=> (not res!733770) (not e!627571))))

(assert (=> b!1099531 (= res!733770 (contains!6362 lt!492307 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(assert (=> b!1099531 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(declare-fun bm!45995 () Bool)

(assert (=> bm!45995 (= call!45997 call!45996)))

(declare-fun bm!45996 () Bool)

(assert (=> bm!45996 (= call!46000 (contains!6362 lt!492307 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099532 () Bool)

(declare-fun res!733764 () Bool)

(assert (=> b!1099532 (=> (not res!733764) (not e!627566))))

(assert (=> b!1099532 (= res!733764 e!627565)))

(declare-fun c!108601 () Bool)

(assert (=> b!1099532 (= c!108601 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099533 () Bool)

(assert (=> b!1099533 (= e!627566 e!627559)))

(declare-fun c!108599 () Bool)

(assert (=> b!1099533 (= c!108599 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099534 () Bool)

(assert (=> b!1099534 (= e!627570 e!627563)))

(assert (=> b!1099534 (= c!108598 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45997 () Bool)

(assert (=> bm!45997 (= call!45998 call!45997)))

(declare-fun b!1099535 () Bool)

(assert (=> b!1099535 (= e!627563 call!46002)))

(declare-fun b!1099536 () Bool)

(assert (=> b!1099536 (= e!627567 (= (apply!941 lt!492307 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!45998 () Bool)

(assert (=> bm!45998 (= call!45996 (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099537 () Bool)

(declare-fun Unit!35988 () Unit!35985)

(assert (=> b!1099537 (= e!627560 Unit!35988)))

(declare-fun b!1099538 () Bool)

(assert (=> b!1099538 (= e!627564 (= (apply!941 lt!492307 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099539 () Bool)

(assert (=> b!1099539 (= e!627568 call!45998)))

(declare-fun b!1099540 () Bool)

(assert (=> b!1099540 (= e!627570 (+!3410 call!46001 (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45999 () Bool)

(assert (=> bm!45999 (= call!45999 (contains!6362 lt!492307 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099541 () Bool)

(declare-fun lt!492290 () Unit!35985)

(assert (=> b!1099541 (= e!627560 lt!492290)))

(declare-fun lt!492294 () ListLongMap!15367)

(assert (=> b!1099541 (= lt!492294 (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492297 () (_ BitVec 64))

(assert (=> b!1099541 (= lt!492297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492291 () (_ BitVec 64))

(assert (=> b!1099541 (= lt!492291 (select (arr!34247 lt!492146) #b00000000000000000000000000000000))))

(declare-fun lt!492308 () Unit!35985)

(assert (=> b!1099541 (= lt!492308 (addStillContains!654 lt!492294 lt!492297 zeroValue!831 lt!492291))))

(assert (=> b!1099541 (contains!6362 (+!3410 lt!492294 (tuple2!17399 lt!492297 zeroValue!831)) lt!492291)))

(declare-fun lt!492301 () Unit!35985)

(assert (=> b!1099541 (= lt!492301 lt!492308)))

(declare-fun lt!492302 () ListLongMap!15367)

(assert (=> b!1099541 (= lt!492302 (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492295 () (_ BitVec 64))

(assert (=> b!1099541 (= lt!492295 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492305 () (_ BitVec 64))

(assert (=> b!1099541 (= lt!492305 (select (arr!34247 lt!492146) #b00000000000000000000000000000000))))

(declare-fun lt!492306 () Unit!35985)

(assert (=> b!1099541 (= lt!492306 (addApplyDifferent!510 lt!492302 lt!492295 minValue!831 lt!492305))))

(assert (=> b!1099541 (= (apply!941 (+!3410 lt!492302 (tuple2!17399 lt!492295 minValue!831)) lt!492305) (apply!941 lt!492302 lt!492305))))

(declare-fun lt!492303 () Unit!35985)

(assert (=> b!1099541 (= lt!492303 lt!492306)))

(declare-fun lt!492296 () ListLongMap!15367)

(assert (=> b!1099541 (= lt!492296 (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492299 () (_ BitVec 64))

(assert (=> b!1099541 (= lt!492299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492292 () (_ BitVec 64))

(assert (=> b!1099541 (= lt!492292 (select (arr!34247 lt!492146) #b00000000000000000000000000000000))))

(declare-fun lt!492298 () Unit!35985)

(assert (=> b!1099541 (= lt!492298 (addApplyDifferent!510 lt!492296 lt!492299 zeroValue!831 lt!492292))))

(assert (=> b!1099541 (= (apply!941 (+!3410 lt!492296 (tuple2!17399 lt!492299 zeroValue!831)) lt!492292) (apply!941 lt!492296 lt!492292))))

(declare-fun lt!492289 () Unit!35985)

(assert (=> b!1099541 (= lt!492289 lt!492298)))

(declare-fun lt!492293 () ListLongMap!15367)

(assert (=> b!1099541 (= lt!492293 (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492300 () (_ BitVec 64))

(assert (=> b!1099541 (= lt!492300 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492309 () (_ BitVec 64))

(assert (=> b!1099541 (= lt!492309 (select (arr!34247 lt!492146) #b00000000000000000000000000000000))))

(assert (=> b!1099541 (= lt!492290 (addApplyDifferent!510 lt!492293 lt!492300 minValue!831 lt!492309))))

(assert (=> b!1099541 (= (apply!941 (+!3410 lt!492293 (tuple2!17399 lt!492300 minValue!831)) lt!492309) (apply!941 lt!492293 lt!492309))))

(assert (= (and d!130365 c!108597) b!1099540))

(assert (= (and d!130365 (not c!108597)) b!1099534))

(assert (= (and b!1099534 c!108598) b!1099535))

(assert (= (and b!1099534 (not c!108598)) b!1099529))

(assert (= (and b!1099529 c!108600) b!1099530))

(assert (= (and b!1099529 (not c!108600)) b!1099539))

(assert (= (or b!1099530 b!1099539) bm!45997))

(assert (= (or b!1099535 bm!45997) bm!45995))

(assert (= (or b!1099535 b!1099530) bm!45994))

(assert (= (or b!1099540 bm!45995) bm!45998))

(assert (= (or b!1099540 bm!45994) bm!45993))

(assert (= (and d!130365 res!733771) b!1099528))

(assert (= (and d!130365 c!108596) b!1099541))

(assert (= (and d!130365 (not c!108596)) b!1099537))

(assert (= (and d!130365 res!733768) b!1099526))

(assert (= (and b!1099526 res!733765) b!1099522))

(assert (= (and b!1099526 (not res!733772)) b!1099531))

(assert (= (and b!1099531 res!733770) b!1099525))

(assert (= (and b!1099526 res!733767) b!1099532))

(assert (= (and b!1099532 c!108601) b!1099524))

(assert (= (and b!1099532 (not c!108601)) b!1099527))

(assert (= (and b!1099524 res!733769) b!1099538))

(assert (= (or b!1099524 b!1099527) bm!45996))

(assert (= (and b!1099532 res!733764) b!1099533))

(assert (= (and b!1099533 c!108599) b!1099523))

(assert (= (and b!1099533 (not c!108599)) b!1099521))

(assert (= (and b!1099523 res!733766) b!1099536))

(assert (= (or b!1099523 b!1099521) bm!45999))

(declare-fun b_lambda!17915 () Bool)

(assert (=> (not b_lambda!17915) (not b!1099525)))

(assert (=> b!1099525 t!34145))

(declare-fun b_and!36959 () Bool)

(assert (= b_and!36957 (and (=> t!34145 result!16495) b_and!36959)))

(declare-fun m!1019059 () Bool)

(assert (=> b!1099540 m!1019059))

(declare-fun m!1019061 () Bool)

(assert (=> bm!45993 m!1019061))

(assert (=> b!1099531 m!1018989))

(assert (=> b!1099531 m!1018989))

(declare-fun m!1019063 () Bool)

(assert (=> b!1099531 m!1019063))

(declare-fun m!1019065 () Bool)

(assert (=> bm!45996 m!1019065))

(declare-fun m!1019067 () Bool)

(assert (=> b!1099536 m!1019067))

(assert (=> d!130365 m!1018889))

(assert (=> bm!45998 m!1018879))

(declare-fun m!1019069 () Bool)

(assert (=> bm!45999 m!1019069))

(declare-fun m!1019071 () Bool)

(assert (=> b!1099541 m!1019071))

(declare-fun m!1019073 () Bool)

(assert (=> b!1099541 m!1019073))

(declare-fun m!1019075 () Bool)

(assert (=> b!1099541 m!1019075))

(assert (=> b!1099541 m!1018879))

(assert (=> b!1099541 m!1019073))

(declare-fun m!1019077 () Bool)

(assert (=> b!1099541 m!1019077))

(declare-fun m!1019079 () Bool)

(assert (=> b!1099541 m!1019079))

(assert (=> b!1099541 m!1019071))

(declare-fun m!1019081 () Bool)

(assert (=> b!1099541 m!1019081))

(declare-fun m!1019083 () Bool)

(assert (=> b!1099541 m!1019083))

(assert (=> b!1099541 m!1018989))

(declare-fun m!1019085 () Bool)

(assert (=> b!1099541 m!1019085))

(declare-fun m!1019087 () Bool)

(assert (=> b!1099541 m!1019087))

(declare-fun m!1019089 () Bool)

(assert (=> b!1099541 m!1019089))

(declare-fun m!1019091 () Bool)

(assert (=> b!1099541 m!1019091))

(assert (=> b!1099541 m!1019089))

(declare-fun m!1019093 () Bool)

(assert (=> b!1099541 m!1019093))

(declare-fun m!1019095 () Bool)

(assert (=> b!1099541 m!1019095))

(assert (=> b!1099541 m!1019085))

(declare-fun m!1019097 () Bool)

(assert (=> b!1099541 m!1019097))

(declare-fun m!1019099 () Bool)

(assert (=> b!1099541 m!1019099))

(declare-fun m!1019101 () Bool)

(assert (=> b!1099538 m!1019101))

(declare-fun m!1019103 () Bool)

(assert (=> b!1099525 m!1019103))

(assert (=> b!1099525 m!1018865))

(assert (=> b!1099525 m!1018989))

(assert (=> b!1099525 m!1019103))

(assert (=> b!1099525 m!1018865))

(declare-fun m!1019105 () Bool)

(assert (=> b!1099525 m!1019105))

(assert (=> b!1099525 m!1018989))

(declare-fun m!1019107 () Bool)

(assert (=> b!1099525 m!1019107))

(assert (=> b!1099528 m!1018989))

(assert (=> b!1099528 m!1018989))

(assert (=> b!1099528 m!1018991))

(assert (=> b!1099522 m!1018989))

(assert (=> b!1099522 m!1018989))

(assert (=> b!1099522 m!1018991))

(assert (=> b!1099355 d!130365))

(declare-fun bm!46004 () Bool)

(declare-fun call!46007 () ListLongMap!15367)

(assert (=> bm!46004 (= call!46007 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun e!627576 () Bool)

(declare-fun call!46008 () ListLongMap!15367)

(declare-fun b!1099548 () Bool)

(assert (=> b!1099548 (= e!627576 (= call!46008 (-!934 call!46007 k0!904)))))

(assert (=> b!1099548 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34786 _values!874)))))

(declare-fun d!130367 () Bool)

(declare-fun e!627577 () Bool)

(assert (=> d!130367 e!627577))

(declare-fun res!733775 () Bool)

(assert (=> d!130367 (=> (not res!733775) (not e!627577))))

(assert (=> d!130367 (= res!733775 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34785 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34785 _keys!1070))))))))

(declare-fun lt!492313 () Unit!35985)

(declare-fun choose!1775 (array!71160 array!71162 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35985)

(assert (=> d!130367 (= lt!492313 (choose!1775 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130367 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!208 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492313)))

(declare-fun bm!46005 () Bool)

(assert (=> bm!46005 (= call!46008 (getCurrentListMapNoExtraKeys!4226 (array!71161 (store (arr!34247 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34785 _keys!1070)) (array!71163 (store (arr!34248 _values!874) i!650 (ValueCellFull!12875 (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34786 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099549 () Bool)

(assert (=> b!1099549 (= e!627577 e!627576)))

(declare-fun c!108604 () Bool)

(assert (=> b!1099549 (= c!108604 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1099550 () Bool)

(assert (=> b!1099550 (= e!627576 (= call!46008 call!46007))))

(assert (=> b!1099550 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34786 _values!874)))))

(assert (= (and d!130367 res!733775) b!1099549))

(assert (= (and b!1099549 c!108604) b!1099548))

(assert (= (and b!1099549 (not c!108604)) b!1099550))

(assert (= (or b!1099548 b!1099550) bm!46004))

(assert (= (or b!1099548 b!1099550) bm!46005))

(declare-fun b_lambda!17917 () Bool)

(assert (=> (not b_lambda!17917) (not bm!46005)))

(assert (=> bm!46005 t!34145))

(declare-fun b_and!36961 () Bool)

(assert (= b_and!36959 (and (=> t!34145 result!16495) b_and!36961)))

(assert (=> bm!46004 m!1018875))

(declare-fun m!1019109 () Bool)

(assert (=> b!1099548 m!1019109))

(declare-fun m!1019111 () Bool)

(assert (=> d!130367 m!1019111))

(assert (=> bm!46005 m!1018859))

(assert (=> bm!46005 m!1018865))

(assert (=> bm!46005 m!1018877))

(declare-fun m!1019113 () Bool)

(assert (=> bm!46005 m!1019113))

(assert (=> b!1099355 d!130367))

(declare-fun b!1099575 () Bool)

(declare-fun e!627597 () Bool)

(declare-fun e!627598 () Bool)

(assert (=> b!1099575 (= e!627597 e!627598)))

(declare-fun c!108616 () Bool)

(assert (=> b!1099575 (= c!108616 (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun lt!492329 () ListLongMap!15367)

(declare-fun b!1099576 () Bool)

(assert (=> b!1099576 (= e!627598 (= lt!492329 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099577 () Bool)

(declare-fun e!627594 () Bool)

(assert (=> b!1099577 (= e!627594 (validKeyInArray!0 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099577 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099578 () Bool)

(declare-fun e!627595 () ListLongMap!15367)

(assert (=> b!1099578 (= e!627595 (ListLongMap!15368 Nil!23987))))

(declare-fun b!1099579 () Bool)

(declare-fun e!627592 () Bool)

(assert (=> b!1099579 (= e!627597 e!627592)))

(assert (=> b!1099579 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun res!733786 () Bool)

(assert (=> b!1099579 (= res!733786 (contains!6362 lt!492329 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099579 (=> (not res!733786) (not e!627592))))

(declare-fun b!1099581 () Bool)

(declare-fun res!733785 () Bool)

(declare-fun e!627596 () Bool)

(assert (=> b!1099581 (=> (not res!733785) (not e!627596))))

(assert (=> b!1099581 (= res!733785 (not (contains!6362 lt!492329 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099582 () Bool)

(declare-fun lt!492331 () Unit!35985)

(declare-fun lt!492328 () Unit!35985)

(assert (=> b!1099582 (= lt!492331 lt!492328)))

(declare-fun lt!492332 () ListLongMap!15367)

(declare-fun lt!492334 () V!41353)

(declare-fun lt!492330 () (_ BitVec 64))

(declare-fun lt!492333 () (_ BitVec 64))

(assert (=> b!1099582 (not (contains!6362 (+!3410 lt!492332 (tuple2!17399 lt!492330 lt!492334)) lt!492333))))

(declare-fun addStillNotContains!277 (ListLongMap!15367 (_ BitVec 64) V!41353 (_ BitVec 64)) Unit!35985)

(assert (=> b!1099582 (= lt!492328 (addStillNotContains!277 lt!492332 lt!492330 lt!492334 lt!492333))))

(assert (=> b!1099582 (= lt!492333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099582 (= lt!492334 (get!17629 (select (arr!34248 _values!874) #b00000000000000000000000000000000) (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099582 (= lt!492330 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!46011 () ListLongMap!15367)

(assert (=> b!1099582 (= lt!492332 call!46011)))

(declare-fun e!627593 () ListLongMap!15367)

(assert (=> b!1099582 (= e!627593 (+!3410 call!46011 (tuple2!17399 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000) (get!17629 (select (arr!34248 _values!874) #b00000000000000000000000000000000) (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099583 () Bool)

(declare-fun isEmpty!971 (ListLongMap!15367) Bool)

(assert (=> b!1099583 (= e!627598 (isEmpty!971 lt!492329))))

(declare-fun b!1099584 () Bool)

(assert (=> b!1099584 (= e!627595 e!627593)))

(declare-fun c!108613 () Bool)

(assert (=> b!1099584 (= c!108613 (validKeyInArray!0 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099585 () Bool)

(assert (=> b!1099585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> b!1099585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34786 _values!874)))))

(assert (=> b!1099585 (= e!627592 (= (apply!941 lt!492329 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)) (get!17629 (select (arr!34248 _values!874) #b00000000000000000000000000000000) (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!46008 () Bool)

(assert (=> bm!46008 (= call!46011 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099586 () Bool)

(assert (=> b!1099586 (= e!627596 e!627597)))

(declare-fun c!108614 () Bool)

(assert (=> b!1099586 (= c!108614 e!627594)))

(declare-fun res!733787 () Bool)

(assert (=> b!1099586 (=> (not res!733787) (not e!627594))))

(assert (=> b!1099586 (= res!733787 (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun b!1099580 () Bool)

(assert (=> b!1099580 (= e!627593 call!46011)))

(declare-fun d!130369 () Bool)

(assert (=> d!130369 e!627596))

(declare-fun res!733784 () Bool)

(assert (=> d!130369 (=> (not res!733784) (not e!627596))))

(assert (=> d!130369 (= res!733784 (not (contains!6362 lt!492329 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130369 (= lt!492329 e!627595)))

(declare-fun c!108615 () Bool)

(assert (=> d!130369 (= c!108615 (bvsge #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130369 (validMask!0 mask!1414)))

(assert (=> d!130369 (= (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492329)))

(assert (= (and d!130369 c!108615) b!1099578))

(assert (= (and d!130369 (not c!108615)) b!1099584))

(assert (= (and b!1099584 c!108613) b!1099582))

(assert (= (and b!1099584 (not c!108613)) b!1099580))

(assert (= (or b!1099582 b!1099580) bm!46008))

(assert (= (and d!130369 res!733784) b!1099581))

(assert (= (and b!1099581 res!733785) b!1099586))

(assert (= (and b!1099586 res!733787) b!1099577))

(assert (= (and b!1099586 c!108614) b!1099579))

(assert (= (and b!1099586 (not c!108614)) b!1099575))

(assert (= (and b!1099579 res!733786) b!1099585))

(assert (= (and b!1099575 c!108616) b!1099576))

(assert (= (and b!1099575 (not c!108616)) b!1099583))

(declare-fun b_lambda!17919 () Bool)

(assert (=> (not b_lambda!17919) (not b!1099582)))

(assert (=> b!1099582 t!34145))

(declare-fun b_and!36963 () Bool)

(assert (= b_and!36961 (and (=> t!34145 result!16495) b_and!36963)))

(declare-fun b_lambda!17921 () Bool)

(assert (=> (not b_lambda!17921) (not b!1099585)))

(assert (=> b!1099585 t!34145))

(declare-fun b_and!36965 () Bool)

(assert (= b_and!36963 (and (=> t!34145 result!16495) b_and!36965)))

(assert (=> b!1099582 m!1019047))

(declare-fun m!1019115 () Bool)

(assert (=> b!1099582 m!1019115))

(declare-fun m!1019117 () Bool)

(assert (=> b!1099582 m!1019117))

(assert (=> b!1099582 m!1018999))

(assert (=> b!1099582 m!1018865))

(declare-fun m!1019119 () Bool)

(assert (=> b!1099582 m!1019119))

(assert (=> b!1099582 m!1019117))

(declare-fun m!1019121 () Bool)

(assert (=> b!1099582 m!1019121))

(assert (=> b!1099582 m!1019047))

(assert (=> b!1099582 m!1018865))

(assert (=> b!1099582 m!1019049))

(declare-fun m!1019123 () Bool)

(assert (=> b!1099581 m!1019123))

(assert (=> b!1099585 m!1019047))

(assert (=> b!1099585 m!1018999))

(declare-fun m!1019125 () Bool)

(assert (=> b!1099585 m!1019125))

(assert (=> b!1099585 m!1018999))

(assert (=> b!1099585 m!1018865))

(assert (=> b!1099585 m!1019047))

(assert (=> b!1099585 m!1018865))

(assert (=> b!1099585 m!1019049))

(declare-fun m!1019127 () Bool)

(assert (=> b!1099576 m!1019127))

(assert (=> b!1099584 m!1018999))

(assert (=> b!1099584 m!1018999))

(assert (=> b!1099584 m!1019053))

(assert (=> b!1099577 m!1018999))

(assert (=> b!1099577 m!1018999))

(assert (=> b!1099577 m!1019053))

(assert (=> bm!46008 m!1019127))

(declare-fun m!1019129 () Bool)

(assert (=> b!1099583 m!1019129))

(assert (=> b!1099579 m!1018999))

(assert (=> b!1099579 m!1018999))

(declare-fun m!1019131 () Bool)

(assert (=> b!1099579 m!1019131))

(declare-fun m!1019133 () Bool)

(assert (=> d!130369 m!1019133))

(assert (=> d!130369 m!1018889))

(assert (=> b!1099355 d!130369))

(declare-fun b!1099587 () Bool)

(declare-fun e!627604 () Bool)

(declare-fun e!627605 () Bool)

(assert (=> b!1099587 (= e!627604 e!627605)))

(declare-fun c!108620 () Bool)

(assert (=> b!1099587 (= c!108620 (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(declare-fun lt!492336 () ListLongMap!15367)

(declare-fun b!1099588 () Bool)

(assert (=> b!1099588 (= e!627605 (= lt!492336 (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099589 () Bool)

(declare-fun e!627601 () Bool)

(assert (=> b!1099589 (= e!627601 (validKeyInArray!0 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(assert (=> b!1099589 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099590 () Bool)

(declare-fun e!627602 () ListLongMap!15367)

(assert (=> b!1099590 (= e!627602 (ListLongMap!15368 Nil!23987))))

(declare-fun b!1099591 () Bool)

(declare-fun e!627599 () Bool)

(assert (=> b!1099591 (= e!627604 e!627599)))

(assert (=> b!1099591 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(declare-fun res!733790 () Bool)

(assert (=> b!1099591 (= res!733790 (contains!6362 lt!492336 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(assert (=> b!1099591 (=> (not res!733790) (not e!627599))))

(declare-fun b!1099593 () Bool)

(declare-fun res!733789 () Bool)

(declare-fun e!627603 () Bool)

(assert (=> b!1099593 (=> (not res!733789) (not e!627603))))

(assert (=> b!1099593 (= res!733789 (not (contains!6362 lt!492336 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099594 () Bool)

(declare-fun lt!492338 () Unit!35985)

(declare-fun lt!492335 () Unit!35985)

(assert (=> b!1099594 (= lt!492338 lt!492335)))

(declare-fun lt!492341 () V!41353)

(declare-fun lt!492339 () ListLongMap!15367)

(declare-fun lt!492340 () (_ BitVec 64))

(declare-fun lt!492337 () (_ BitVec 64))

(assert (=> b!1099594 (not (contains!6362 (+!3410 lt!492339 (tuple2!17399 lt!492337 lt!492341)) lt!492340))))

(assert (=> b!1099594 (= lt!492335 (addStillNotContains!277 lt!492339 lt!492337 lt!492341 lt!492340))))

(assert (=> b!1099594 (= lt!492340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099594 (= lt!492341 (get!17629 (select (arr!34248 lt!492150) #b00000000000000000000000000000000) (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099594 (= lt!492337 (select (arr!34247 lt!492146) #b00000000000000000000000000000000))))

(declare-fun call!46012 () ListLongMap!15367)

(assert (=> b!1099594 (= lt!492339 call!46012)))

(declare-fun e!627600 () ListLongMap!15367)

(assert (=> b!1099594 (= e!627600 (+!3410 call!46012 (tuple2!17399 (select (arr!34247 lt!492146) #b00000000000000000000000000000000) (get!17629 (select (arr!34248 lt!492150) #b00000000000000000000000000000000) (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099595 () Bool)

(assert (=> b!1099595 (= e!627605 (isEmpty!971 lt!492336))))

(declare-fun b!1099596 () Bool)

(assert (=> b!1099596 (= e!627602 e!627600)))

(declare-fun c!108617 () Bool)

(assert (=> b!1099596 (= c!108617 (validKeyInArray!0 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(declare-fun b!1099597 () Bool)

(assert (=> b!1099597 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(assert (=> b!1099597 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34786 lt!492150)))))

(assert (=> b!1099597 (= e!627599 (= (apply!941 lt!492336 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)) (get!17629 (select (arr!34248 lt!492150) #b00000000000000000000000000000000) (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!46009 () Bool)

(assert (=> bm!46009 (= call!46012 (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099598 () Bool)

(assert (=> b!1099598 (= e!627603 e!627604)))

(declare-fun c!108618 () Bool)

(assert (=> b!1099598 (= c!108618 e!627601)))

(declare-fun res!733791 () Bool)

(assert (=> b!1099598 (=> (not res!733791) (not e!627601))))

(assert (=> b!1099598 (= res!733791 (bvslt #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(declare-fun b!1099592 () Bool)

(assert (=> b!1099592 (= e!627600 call!46012)))

(declare-fun d!130371 () Bool)

(assert (=> d!130371 e!627603))

(declare-fun res!733788 () Bool)

(assert (=> d!130371 (=> (not res!733788) (not e!627603))))

(assert (=> d!130371 (= res!733788 (not (contains!6362 lt!492336 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130371 (= lt!492336 e!627602)))

(declare-fun c!108619 () Bool)

(assert (=> d!130371 (= c!108619 (bvsge #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(assert (=> d!130371 (validMask!0 mask!1414)))

(assert (=> d!130371 (= (getCurrentListMapNoExtraKeys!4226 lt!492146 lt!492150 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492336)))

(assert (= (and d!130371 c!108619) b!1099590))

(assert (= (and d!130371 (not c!108619)) b!1099596))

(assert (= (and b!1099596 c!108617) b!1099594))

(assert (= (and b!1099596 (not c!108617)) b!1099592))

(assert (= (or b!1099594 b!1099592) bm!46009))

(assert (= (and d!130371 res!733788) b!1099593))

(assert (= (and b!1099593 res!733789) b!1099598))

(assert (= (and b!1099598 res!733791) b!1099589))

(assert (= (and b!1099598 c!108618) b!1099591))

(assert (= (and b!1099598 (not c!108618)) b!1099587))

(assert (= (and b!1099591 res!733790) b!1099597))

(assert (= (and b!1099587 c!108620) b!1099588))

(assert (= (and b!1099587 (not c!108620)) b!1099595))

(declare-fun b_lambda!17923 () Bool)

(assert (=> (not b_lambda!17923) (not b!1099594)))

(assert (=> b!1099594 t!34145))

(declare-fun b_and!36967 () Bool)

(assert (= b_and!36965 (and (=> t!34145 result!16495) b_and!36967)))

(declare-fun b_lambda!17925 () Bool)

(assert (=> (not b_lambda!17925) (not b!1099597)))

(assert (=> b!1099597 t!34145))

(declare-fun b_and!36969 () Bool)

(assert (= b_and!36967 (and (=> t!34145 result!16495) b_and!36969)))

(assert (=> b!1099594 m!1019103))

(declare-fun m!1019135 () Bool)

(assert (=> b!1099594 m!1019135))

(declare-fun m!1019137 () Bool)

(assert (=> b!1099594 m!1019137))

(assert (=> b!1099594 m!1018989))

(assert (=> b!1099594 m!1018865))

(declare-fun m!1019139 () Bool)

(assert (=> b!1099594 m!1019139))

(assert (=> b!1099594 m!1019137))

(declare-fun m!1019141 () Bool)

(assert (=> b!1099594 m!1019141))

(assert (=> b!1099594 m!1019103))

(assert (=> b!1099594 m!1018865))

(assert (=> b!1099594 m!1019105))

(declare-fun m!1019143 () Bool)

(assert (=> b!1099593 m!1019143))

(assert (=> b!1099597 m!1019103))

(assert (=> b!1099597 m!1018989))

(declare-fun m!1019145 () Bool)

(assert (=> b!1099597 m!1019145))

(assert (=> b!1099597 m!1018989))

(assert (=> b!1099597 m!1018865))

(assert (=> b!1099597 m!1019103))

(assert (=> b!1099597 m!1018865))

(assert (=> b!1099597 m!1019105))

(declare-fun m!1019147 () Bool)

(assert (=> b!1099588 m!1019147))

(assert (=> b!1099596 m!1018989))

(assert (=> b!1099596 m!1018989))

(assert (=> b!1099596 m!1018991))

(assert (=> b!1099589 m!1018989))

(assert (=> b!1099589 m!1018989))

(assert (=> b!1099589 m!1018991))

(assert (=> bm!46009 m!1019147))

(declare-fun m!1019149 () Bool)

(assert (=> b!1099595 m!1019149))

(assert (=> b!1099591 m!1018989))

(assert (=> b!1099591 m!1018989))

(declare-fun m!1019151 () Bool)

(assert (=> b!1099591 m!1019151))

(declare-fun m!1019153 () Bool)

(assert (=> d!130371 m!1019153))

(assert (=> d!130371 m!1018889))

(assert (=> b!1099355 d!130371))

(declare-fun d!130373 () Bool)

(assert (=> d!130373 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492344 () Unit!35985)

(declare-fun choose!13 (array!71160 (_ BitVec 64) (_ BitVec 32)) Unit!35985)

(assert (=> d!130373 (= lt!492344 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130373 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130373 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!492344)))

(declare-fun bs!32265 () Bool)

(assert (= bs!32265 d!130373))

(assert (=> bs!32265 m!1018871))

(declare-fun m!1019155 () Bool)

(assert (=> bs!32265 m!1019155))

(assert (=> b!1099355 d!130373))

(declare-fun b!1099609 () Bool)

(declare-fun e!627614 () Bool)

(declare-fun e!627615 () Bool)

(assert (=> b!1099609 (= e!627614 e!627615)))

(declare-fun c!108623 () Bool)

(assert (=> b!1099609 (= c!108623 (validKeyInArray!0 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130375 () Bool)

(declare-fun res!733800 () Bool)

(declare-fun e!627616 () Bool)

(assert (=> d!130375 (=> res!733800 e!627616)))

(assert (=> d!130375 (= res!733800 (bvsge #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130375 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23988) e!627616)))

(declare-fun b!1099610 () Bool)

(assert (=> b!1099610 (= e!627616 e!627614)))

(declare-fun res!733799 () Bool)

(assert (=> b!1099610 (=> (not res!733799) (not e!627614))))

(declare-fun e!627617 () Bool)

(assert (=> b!1099610 (= res!733799 (not e!627617))))

(declare-fun res!733798 () Bool)

(assert (=> b!1099610 (=> (not res!733798) (not e!627617))))

(assert (=> b!1099610 (= res!733798 (validKeyInArray!0 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46012 () Bool)

(declare-fun call!46015 () Bool)

(assert (=> bm!46012 (= call!46015 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108623 (Cons!23987 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000) Nil!23988) Nil!23988)))))

(declare-fun b!1099611 () Bool)

(assert (=> b!1099611 (= e!627615 call!46015)))

(declare-fun b!1099612 () Bool)

(declare-fun contains!6363 (List!23991 (_ BitVec 64)) Bool)

(assert (=> b!1099612 (= e!627617 (contains!6363 Nil!23988 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099613 () Bool)

(assert (=> b!1099613 (= e!627615 call!46015)))

(assert (= (and d!130375 (not res!733800)) b!1099610))

(assert (= (and b!1099610 res!733798) b!1099612))

(assert (= (and b!1099610 res!733799) b!1099609))

(assert (= (and b!1099609 c!108623) b!1099611))

(assert (= (and b!1099609 (not c!108623)) b!1099613))

(assert (= (or b!1099611 b!1099613) bm!46012))

(assert (=> b!1099609 m!1018999))

(assert (=> b!1099609 m!1018999))

(assert (=> b!1099609 m!1019053))

(assert (=> b!1099610 m!1018999))

(assert (=> b!1099610 m!1018999))

(assert (=> b!1099610 m!1019053))

(assert (=> bm!46012 m!1018999))

(declare-fun m!1019157 () Bool)

(assert (=> bm!46012 m!1019157))

(assert (=> b!1099612 m!1018999))

(assert (=> b!1099612 m!1018999))

(declare-fun m!1019159 () Bool)

(assert (=> b!1099612 m!1019159))

(assert (=> b!1099344 d!130375))

(declare-fun d!130377 () Bool)

(assert (=> d!130377 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099349 d!130377))

(declare-fun d!130379 () Bool)

(assert (=> d!130379 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96666 d!130379))

(declare-fun d!130381 () Bool)

(assert (=> d!130381 (= (array_inv!26414 _keys!1070) (bvsge (size!34785 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96666 d!130381))

(declare-fun d!130383 () Bool)

(assert (=> d!130383 (= (array_inv!26415 _values!874) (bvsge (size!34786 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96666 d!130383))

(declare-fun d!130385 () Bool)

(declare-fun res!733802 () Bool)

(declare-fun e!627618 () Bool)

(assert (=> d!130385 (=> res!733802 e!627618)))

(assert (=> d!130385 (= res!733802 (bvsge #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627618)))

(declare-fun bm!46013 () Bool)

(declare-fun call!46016 () Bool)

(assert (=> bm!46013 (= call!46016 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1099614 () Bool)

(declare-fun e!627619 () Bool)

(assert (=> b!1099614 (= e!627619 call!46016)))

(declare-fun b!1099615 () Bool)

(declare-fun e!627620 () Bool)

(assert (=> b!1099615 (= e!627620 call!46016)))

(declare-fun b!1099616 () Bool)

(assert (=> b!1099616 (= e!627618 e!627620)))

(declare-fun c!108624 () Bool)

(assert (=> b!1099616 (= c!108624 (validKeyInArray!0 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099617 () Bool)

(assert (=> b!1099617 (= e!627620 e!627619)))

(declare-fun lt!492345 () (_ BitVec 64))

(assert (=> b!1099617 (= lt!492345 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492347 () Unit!35985)

(assert (=> b!1099617 (= lt!492347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!492345 #b00000000000000000000000000000000))))

(assert (=> b!1099617 (arrayContainsKey!0 _keys!1070 lt!492345 #b00000000000000000000000000000000)))

(declare-fun lt!492346 () Unit!35985)

(assert (=> b!1099617 (= lt!492346 lt!492347)))

(declare-fun res!733801 () Bool)

(assert (=> b!1099617 (= res!733801 (= (seekEntryOrOpen!0 (select (arr!34247 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9910 #b00000000000000000000000000000000)))))

(assert (=> b!1099617 (=> (not res!733801) (not e!627619))))

(assert (= (and d!130385 (not res!733802)) b!1099616))

(assert (= (and b!1099616 c!108624) b!1099617))

(assert (= (and b!1099616 (not c!108624)) b!1099615))

(assert (= (and b!1099617 res!733801) b!1099614))

(assert (= (or b!1099614 b!1099615) bm!46013))

(declare-fun m!1019161 () Bool)

(assert (=> bm!46013 m!1019161))

(assert (=> b!1099616 m!1018999))

(assert (=> b!1099616 m!1018999))

(assert (=> b!1099616 m!1019053))

(assert (=> b!1099617 m!1018999))

(declare-fun m!1019163 () Bool)

(assert (=> b!1099617 m!1019163))

(declare-fun m!1019165 () Bool)

(assert (=> b!1099617 m!1019165))

(assert (=> b!1099617 m!1018999))

(declare-fun m!1019167 () Bool)

(assert (=> b!1099617 m!1019167))

(assert (=> b!1099348 d!130385))

(declare-fun d!130387 () Bool)

(declare-fun e!627623 () Bool)

(assert (=> d!130387 e!627623))

(declare-fun res!733808 () Bool)

(assert (=> d!130387 (=> (not res!733808) (not e!627623))))

(declare-fun lt!492359 () ListLongMap!15367)

(assert (=> d!130387 (= res!733808 (contains!6362 lt!492359 (_1!8710 lt!492145)))))

(declare-fun lt!492356 () List!23990)

(assert (=> d!130387 (= lt!492359 (ListLongMap!15368 lt!492356))))

(declare-fun lt!492358 () Unit!35985)

(declare-fun lt!492357 () Unit!35985)

(assert (=> d!130387 (= lt!492358 lt!492357)))

(declare-datatypes ((Option!676 0))(
  ( (Some!675 (v!16269 V!41353)) (None!674) )
))
(declare-fun getValueByKey!625 (List!23990 (_ BitVec 64)) Option!676)

(assert (=> d!130387 (= (getValueByKey!625 lt!492356 (_1!8710 lt!492145)) (Some!675 (_2!8710 lt!492145)))))

(declare-fun lemmaContainsTupThenGetReturnValue!301 (List!23990 (_ BitVec 64) V!41353) Unit!35985)

(assert (=> d!130387 (= lt!492357 (lemmaContainsTupThenGetReturnValue!301 lt!492356 (_1!8710 lt!492145) (_2!8710 lt!492145)))))

(declare-fun insertStrictlySorted!394 (List!23990 (_ BitVec 64) V!41353) List!23990)

(assert (=> d!130387 (= lt!492356 (insertStrictlySorted!394 (toList!7699 lt!492142) (_1!8710 lt!492145) (_2!8710 lt!492145)))))

(assert (=> d!130387 (= (+!3410 lt!492142 lt!492145) lt!492359)))

(declare-fun b!1099622 () Bool)

(declare-fun res!733807 () Bool)

(assert (=> b!1099622 (=> (not res!733807) (not e!627623))))

(assert (=> b!1099622 (= res!733807 (= (getValueByKey!625 (toList!7699 lt!492359) (_1!8710 lt!492145)) (Some!675 (_2!8710 lt!492145))))))

(declare-fun b!1099623 () Bool)

(declare-fun contains!6364 (List!23990 tuple2!17398) Bool)

(assert (=> b!1099623 (= e!627623 (contains!6364 (toList!7699 lt!492359) lt!492145))))

(assert (= (and d!130387 res!733808) b!1099622))

(assert (= (and b!1099622 res!733807) b!1099623))

(declare-fun m!1019169 () Bool)

(assert (=> d!130387 m!1019169))

(declare-fun m!1019171 () Bool)

(assert (=> d!130387 m!1019171))

(declare-fun m!1019173 () Bool)

(assert (=> d!130387 m!1019173))

(declare-fun m!1019175 () Bool)

(assert (=> d!130387 m!1019175))

(declare-fun m!1019177 () Bool)

(assert (=> b!1099622 m!1019177))

(declare-fun m!1019179 () Bool)

(assert (=> b!1099623 m!1019179))

(assert (=> b!1099346 d!130387))

(declare-fun d!130389 () Bool)

(declare-fun e!627624 () Bool)

(assert (=> d!130389 e!627624))

(declare-fun res!733810 () Bool)

(assert (=> d!130389 (=> (not res!733810) (not e!627624))))

(declare-fun lt!492363 () ListLongMap!15367)

(assert (=> d!130389 (= res!733810 (contains!6362 lt!492363 (_1!8710 lt!492145)))))

(declare-fun lt!492360 () List!23990)

(assert (=> d!130389 (= lt!492363 (ListLongMap!15368 lt!492360))))

(declare-fun lt!492362 () Unit!35985)

(declare-fun lt!492361 () Unit!35985)

(assert (=> d!130389 (= lt!492362 lt!492361)))

(assert (=> d!130389 (= (getValueByKey!625 lt!492360 (_1!8710 lt!492145)) (Some!675 (_2!8710 lt!492145)))))

(assert (=> d!130389 (= lt!492361 (lemmaContainsTupThenGetReturnValue!301 lt!492360 (_1!8710 lt!492145) (_2!8710 lt!492145)))))

(assert (=> d!130389 (= lt!492360 (insertStrictlySorted!394 (toList!7699 lt!492143) (_1!8710 lt!492145) (_2!8710 lt!492145)))))

(assert (=> d!130389 (= (+!3410 lt!492143 lt!492145) lt!492363)))

(declare-fun b!1099624 () Bool)

(declare-fun res!733809 () Bool)

(assert (=> b!1099624 (=> (not res!733809) (not e!627624))))

(assert (=> b!1099624 (= res!733809 (= (getValueByKey!625 (toList!7699 lt!492363) (_1!8710 lt!492145)) (Some!675 (_2!8710 lt!492145))))))

(declare-fun b!1099625 () Bool)

(assert (=> b!1099625 (= e!627624 (contains!6364 (toList!7699 lt!492363) lt!492145))))

(assert (= (and d!130389 res!733810) b!1099624))

(assert (= (and b!1099624 res!733809) b!1099625))

(declare-fun m!1019181 () Bool)

(assert (=> d!130389 m!1019181))

(declare-fun m!1019183 () Bool)

(assert (=> d!130389 m!1019183))

(declare-fun m!1019185 () Bool)

(assert (=> d!130389 m!1019185))

(declare-fun m!1019187 () Bool)

(assert (=> d!130389 m!1019187))

(declare-fun m!1019189 () Bool)

(assert (=> b!1099624 m!1019189))

(declare-fun m!1019191 () Bool)

(assert (=> b!1099625 m!1019191))

(assert (=> b!1099346 d!130389))

(declare-fun b!1099626 () Bool)

(declare-fun e!627625 () Bool)

(declare-fun e!627626 () Bool)

(assert (=> b!1099626 (= e!627625 e!627626)))

(declare-fun c!108625 () Bool)

(assert (=> b!1099626 (= c!108625 (validKeyInArray!0 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(declare-fun d!130391 () Bool)

(declare-fun res!733813 () Bool)

(declare-fun e!627627 () Bool)

(assert (=> d!130391 (=> res!733813 e!627627)))

(assert (=> d!130391 (= res!733813 (bvsge #b00000000000000000000000000000000 (size!34785 lt!492146)))))

(assert (=> d!130391 (= (arrayNoDuplicates!0 lt!492146 #b00000000000000000000000000000000 Nil!23988) e!627627)))

(declare-fun b!1099627 () Bool)

(assert (=> b!1099627 (= e!627627 e!627625)))

(declare-fun res!733812 () Bool)

(assert (=> b!1099627 (=> (not res!733812) (not e!627625))))

(declare-fun e!627628 () Bool)

(assert (=> b!1099627 (= res!733812 (not e!627628))))

(declare-fun res!733811 () Bool)

(assert (=> b!1099627 (=> (not res!733811) (not e!627628))))

(assert (=> b!1099627 (= res!733811 (validKeyInArray!0 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(declare-fun bm!46014 () Bool)

(declare-fun call!46017 () Bool)

(assert (=> bm!46014 (= call!46017 (arrayNoDuplicates!0 lt!492146 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108625 (Cons!23987 (select (arr!34247 lt!492146) #b00000000000000000000000000000000) Nil!23988) Nil!23988)))))

(declare-fun b!1099628 () Bool)

(assert (=> b!1099628 (= e!627626 call!46017)))

(declare-fun b!1099629 () Bool)

(assert (=> b!1099629 (= e!627628 (contains!6363 Nil!23988 (select (arr!34247 lt!492146) #b00000000000000000000000000000000)))))

(declare-fun b!1099630 () Bool)

(assert (=> b!1099630 (= e!627626 call!46017)))

(assert (= (and d!130391 (not res!733813)) b!1099627))

(assert (= (and b!1099627 res!733811) b!1099629))

(assert (= (and b!1099627 res!733812) b!1099626))

(assert (= (and b!1099626 c!108625) b!1099628))

(assert (= (and b!1099626 (not c!108625)) b!1099630))

(assert (= (or b!1099628 b!1099630) bm!46014))

(assert (=> b!1099626 m!1018989))

(assert (=> b!1099626 m!1018989))

(assert (=> b!1099626 m!1018991))

(assert (=> b!1099627 m!1018989))

(assert (=> b!1099627 m!1018989))

(assert (=> b!1099627 m!1018991))

(assert (=> bm!46014 m!1018989))

(declare-fun m!1019193 () Bool)

(assert (=> bm!46014 m!1019193))

(assert (=> b!1099629 m!1018989))

(assert (=> b!1099629 m!1018989))

(declare-fun m!1019195 () Bool)

(assert (=> b!1099629 m!1019195))

(assert (=> b!1099352 d!130391))

(declare-fun b!1099638 () Bool)

(declare-fun e!627633 () Bool)

(assert (=> b!1099638 (= e!627633 tp_is_empty!27169)))

(declare-fun mapIsEmpty!42538 () Bool)

(declare-fun mapRes!42538 () Bool)

(assert (=> mapIsEmpty!42538 mapRes!42538))

(declare-fun mapNonEmpty!42538 () Bool)

(declare-fun tp!81314 () Bool)

(declare-fun e!627634 () Bool)

(assert (=> mapNonEmpty!42538 (= mapRes!42538 (and tp!81314 e!627634))))

(declare-fun mapKey!42538 () (_ BitVec 32))

(declare-fun mapRest!42538 () (Array (_ BitVec 32) ValueCell!12875))

(declare-fun mapValue!42538 () ValueCell!12875)

(assert (=> mapNonEmpty!42538 (= mapRest!42529 (store mapRest!42538 mapKey!42538 mapValue!42538))))

(declare-fun b!1099637 () Bool)

(assert (=> b!1099637 (= e!627634 tp_is_empty!27169)))

(declare-fun condMapEmpty!42538 () Bool)

(declare-fun mapDefault!42538 () ValueCell!12875)

(assert (=> mapNonEmpty!42529 (= condMapEmpty!42538 (= mapRest!42529 ((as const (Array (_ BitVec 32) ValueCell!12875)) mapDefault!42538)))))

(assert (=> mapNonEmpty!42529 (= tp!81298 (and e!627633 mapRes!42538))))

(assert (= (and mapNonEmpty!42529 condMapEmpty!42538) mapIsEmpty!42538))

(assert (= (and mapNonEmpty!42529 (not condMapEmpty!42538)) mapNonEmpty!42538))

(assert (= (and mapNonEmpty!42538 ((_ is ValueCellFull!12875) mapValue!42538)) b!1099637))

(assert (= (and mapNonEmpty!42529 ((_ is ValueCellFull!12875) mapDefault!42538)) b!1099638))

(declare-fun m!1019197 () Bool)

(assert (=> mapNonEmpty!42538 m!1019197))

(declare-fun b_lambda!17927 () Bool)

(assert (= b_lambda!17919 (or (and start!96666 b_free!23119) b_lambda!17927)))

(declare-fun b_lambda!17929 () Bool)

(assert (= b_lambda!17917 (or (and start!96666 b_free!23119) b_lambda!17929)))

(declare-fun b_lambda!17931 () Bool)

(assert (= b_lambda!17913 (or (and start!96666 b_free!23119) b_lambda!17931)))

(declare-fun b_lambda!17933 () Bool)

(assert (= b_lambda!17925 (or (and start!96666 b_free!23119) b_lambda!17933)))

(declare-fun b_lambda!17935 () Bool)

(assert (= b_lambda!17923 (or (and start!96666 b_free!23119) b_lambda!17935)))

(declare-fun b_lambda!17937 () Bool)

(assert (= b_lambda!17915 (or (and start!96666 b_free!23119) b_lambda!17937)))

(declare-fun b_lambda!17939 () Bool)

(assert (= b_lambda!17921 (or (and start!96666 b_free!23119) b_lambda!17939)))

(check-sat (not bm!45992) (not b!1099510) (not bm!45993) (not mapNonEmpty!42538) (not b!1099622) (not b!1099610) (not d!130371) (not bm!46008) (not b!1099581) (not b!1099596) (not b!1099504) (not b_lambda!17927) (not b!1099457) (not b!1099595) (not d!130387) (not b_lambda!17935) (not b!1099531) (not b!1099576) (not b!1099515) (not bm!46005) (not b!1099507) (not b_lambda!17939) (not b!1099517) (not b!1099501) (not d!130367) (not b!1099624) (not bm!45986) (not bm!45989) (not bm!45996) (not b!1099584) (not b!1099623) (not b!1099588) (not b!1099528) (not b!1099609) (not b!1099450) (not d!130361) (not d!130365) (not b!1099520) (not b_lambda!17933) (not b!1099525) (not b!1099626) (not bm!46012) b_and!36969 (not b!1099582) (not bm!45999) (not b!1099522) (not bm!45971) (not bm!45998) (not b!1099583) (not d!130369) (not d!130389) (not bm!46014) (not d!130373) (not bm!46009) (not b!1099585) (not b_lambda!17937) (not b!1099589) (not b!1099577) (not b_lambda!17911) (not b!1099616) (not b!1099451) (not b_next!23119) (not b!1099593) (not d!130363) (not bm!45991) (not b!1099541) (not b!1099612) (not b!1099538) (not b!1099629) (not bm!46004) (not b!1099579) (not b!1099540) (not b!1099627) (not b!1099597) (not b!1099594) (not b_lambda!17929) (not b!1099536) tp_is_empty!27169 (not b!1099625) (not b_lambda!17931) (not b!1099519) (not bm!46013) (not b!1099591) (not b!1099548) (not b!1099617))
(check-sat b_and!36969 (not b_next!23119))
