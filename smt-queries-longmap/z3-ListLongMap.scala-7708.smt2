; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96832 () Bool)

(assert start!96832)

(declare-fun b_free!23175 () Bool)

(declare-fun b_next!23175 () Bool)

(assert (=> start!96832 (= b_free!23175 (not b_next!23175))))

(declare-fun tp!81479 () Bool)

(declare-fun b_and!37139 () Bool)

(assert (=> start!96832 (= tp!81479 b_and!37139)))

(declare-fun b!1101515 () Bool)

(declare-fun e!628721 () Bool)

(declare-fun e!628723 () Bool)

(assert (=> b!1101515 (= e!628721 e!628723)))

(declare-fun res!735001 () Bool)

(assert (=> b!1101515 (=> (not res!735001) (not e!628723))))

(declare-datatypes ((array!71371 0))(
  ( (array!71372 (arr!34348 (Array (_ BitVec 32) (_ BitVec 64))) (size!34884 (_ BitVec 32))) )
))
(declare-fun lt!493872 () array!71371)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71371 (_ BitVec 32)) Bool)

(assert (=> b!1101515 (= res!735001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493872 mask!1414))))

(declare-fun _keys!1070 () array!71371)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101515 (= lt!493872 (array!71372 (store (arr!34348 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34884 _keys!1070)))))

(declare-fun res!734996 () Bool)

(assert (=> start!96832 (=> (not res!734996) (not e!628721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96832 (= res!734996 (validMask!0 mask!1414))))

(assert (=> start!96832 e!628721))

(assert (=> start!96832 tp!81479))

(assert (=> start!96832 true))

(declare-fun tp_is_empty!27225 () Bool)

(assert (=> start!96832 tp_is_empty!27225))

(declare-fun array_inv!26454 (array!71371) Bool)

(assert (=> start!96832 (array_inv!26454 _keys!1070)))

(declare-datatypes ((V!41427 0))(
  ( (V!41428 (val!13669 Int)) )
))
(declare-datatypes ((ValueCell!12903 0))(
  ( (ValueCellFull!12903 (v!16299 V!41427)) (EmptyCell!12903) )
))
(declare-datatypes ((array!71373 0))(
  ( (array!71374 (arr!34349 (Array (_ BitVec 32) ValueCell!12903)) (size!34885 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71373)

(declare-fun e!628720 () Bool)

(declare-fun array_inv!26455 (array!71373) Bool)

(assert (=> start!96832 (and (array_inv!26455 _values!874) e!628720)))

(declare-fun b!1101516 () Bool)

(declare-fun res!735004 () Bool)

(declare-fun e!628722 () Bool)

(assert (=> b!1101516 (=> (not res!735004) (not e!628722))))

(declare-datatypes ((tuple2!17382 0))(
  ( (tuple2!17383 (_1!8702 (_ BitVec 64)) (_2!8702 V!41427)) )
))
(declare-datatypes ((List!23997 0))(
  ( (Nil!23994) (Cons!23993 (h!25202 tuple2!17382) (t!34218 List!23997)) )
))
(declare-datatypes ((ListLongMap!15351 0))(
  ( (ListLongMap!15352 (toList!7691 List!23997)) )
))
(declare-fun lt!493876 () ListLongMap!15351)

(declare-fun lt!493869 () ListLongMap!15351)

(declare-fun lt!493877 () tuple2!17382)

(declare-fun +!3396 (ListLongMap!15351 tuple2!17382) ListLongMap!15351)

(assert (=> b!1101516 (= res!735004 (= lt!493869 (+!3396 lt!493876 lt!493877)))))

(declare-fun b!1101517 () Bool)

(declare-fun res!734997 () Bool)

(assert (=> b!1101517 (=> (not res!734997) (not e!628721))))

(assert (=> b!1101517 (= res!734997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun lt!493874 () ListLongMap!15351)

(declare-fun lt!493870 () ListLongMap!15351)

(declare-fun b!1101518 () Bool)

(assert (=> b!1101518 (= e!628722 (= lt!493870 (+!3396 lt!493874 lt!493877)))))

(declare-fun b!1101519 () Bool)

(declare-fun res!734995 () Bool)

(assert (=> b!1101519 (=> (not res!734995) (not e!628721))))

(assert (=> b!1101519 (= res!734995 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34884 _keys!1070))))))

(declare-fun b!1101520 () Bool)

(declare-fun e!628719 () Bool)

(declare-fun mapRes!42625 () Bool)

(assert (=> b!1101520 (= e!628720 (and e!628719 mapRes!42625))))

(declare-fun condMapEmpty!42625 () Bool)

(declare-fun mapDefault!42625 () ValueCell!12903)

(assert (=> b!1101520 (= condMapEmpty!42625 (= (arr!34349 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12903)) mapDefault!42625)))))

(declare-fun mapIsEmpty!42625 () Bool)

(assert (=> mapIsEmpty!42625 mapRes!42625))

(declare-fun b!1101521 () Bool)

(declare-fun res!735005 () Bool)

(assert (=> b!1101521 (=> (not res!735005) (not e!628721))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101521 (= res!735005 (and (= (size!34885 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34884 _keys!1070) (size!34885 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101522 () Bool)

(declare-fun res!734999 () Bool)

(assert (=> b!1101522 (=> (not res!734999) (not e!628721))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1101522 (= res!734999 (= (select (arr!34348 _keys!1070) i!650) k0!904))))

(declare-fun b!1101523 () Bool)

(declare-fun res!735000 () Bool)

(assert (=> b!1101523 (=> (not res!735000) (not e!628721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101523 (= res!735000 (validKeyInArray!0 k0!904))))

(declare-fun b!1101524 () Bool)

(assert (=> b!1101524 (= e!628719 tp_is_empty!27225)))

(declare-fun b!1101525 () Bool)

(declare-fun e!628717 () Bool)

(assert (=> b!1101525 (= e!628717 tp_is_empty!27225)))

(declare-fun b!1101526 () Bool)

(declare-fun res!735002 () Bool)

(assert (=> b!1101526 (=> (not res!735002) (not e!628721))))

(declare-datatypes ((List!23998 0))(
  ( (Nil!23995) (Cons!23994 (h!25203 (_ BitVec 64)) (t!34219 List!23998)) )
))
(declare-fun arrayNoDuplicates!0 (array!71371 (_ BitVec 32) List!23998) Bool)

(assert (=> b!1101526 (= res!735002 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23995))))

(declare-fun b!1101527 () Bool)

(declare-fun e!628718 () Bool)

(assert (=> b!1101527 (= e!628723 (not e!628718))))

(declare-fun res!735006 () Bool)

(assert (=> b!1101527 (=> res!735006 e!628718)))

(assert (=> b!1101527 (= res!735006 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41427)

(declare-fun zeroValue!831 () V!41427)

(declare-fun getCurrentListMap!4396 (array!71371 array!71373 (_ BitVec 32) (_ BitVec 32) V!41427 V!41427 (_ BitVec 32) Int) ListLongMap!15351)

(assert (=> b!1101527 (= lt!493870 (getCurrentListMap!4396 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493871 () array!71373)

(assert (=> b!1101527 (= lt!493869 (getCurrentListMap!4396 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493875 () ListLongMap!15351)

(assert (=> b!1101527 (and (= lt!493875 lt!493876) (= lt!493876 lt!493875))))

(declare-fun -!974 (ListLongMap!15351 (_ BitVec 64)) ListLongMap!15351)

(assert (=> b!1101527 (= lt!493876 (-!974 lt!493874 k0!904))))

(declare-datatypes ((Unit!36198 0))(
  ( (Unit!36199) )
))
(declare-fun lt!493873 () Unit!36198)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!222 (array!71371 array!71373 (_ BitVec 32) (_ BitVec 32) V!41427 V!41427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36198)

(assert (=> b!1101527 (= lt!493873 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!222 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4192 (array!71371 array!71373 (_ BitVec 32) (_ BitVec 32) V!41427 V!41427 (_ BitVec 32) Int) ListLongMap!15351)

(assert (=> b!1101527 (= lt!493875 (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2327 (Int (_ BitVec 64)) V!41427)

(assert (=> b!1101527 (= lt!493871 (array!71374 (store (arr!34349 _values!874) i!650 (ValueCellFull!12903 (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34885 _values!874)))))

(assert (=> b!1101527 (= lt!493874 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101527 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493878 () Unit!36198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71371 (_ BitVec 64) (_ BitVec 32)) Unit!36198)

(assert (=> b!1101527 (= lt!493878 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42625 () Bool)

(declare-fun tp!81478 () Bool)

(assert (=> mapNonEmpty!42625 (= mapRes!42625 (and tp!81478 e!628717))))

(declare-fun mapRest!42625 () (Array (_ BitVec 32) ValueCell!12903))

(declare-fun mapKey!42625 () (_ BitVec 32))

(declare-fun mapValue!42625 () ValueCell!12903)

(assert (=> mapNonEmpty!42625 (= (arr!34349 _values!874) (store mapRest!42625 mapKey!42625 mapValue!42625))))

(declare-fun b!1101528 () Bool)

(declare-fun res!735003 () Bool)

(assert (=> b!1101528 (=> (not res!735003) (not e!628723))))

(assert (=> b!1101528 (= res!735003 (arrayNoDuplicates!0 lt!493872 #b00000000000000000000000000000000 Nil!23995))))

(declare-fun b!1101529 () Bool)

(assert (=> b!1101529 (= e!628718 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(assert (=> b!1101529 e!628722))

(declare-fun res!734998 () Bool)

(assert (=> b!1101529 (=> (not res!734998) (not e!628722))))

(assert (=> b!1101529 (= res!734998 (= lt!493869 (+!3396 lt!493875 lt!493877)))))

(assert (=> b!1101529 (= lt!493877 (tuple2!17383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (= (and start!96832 res!734996) b!1101521))

(assert (= (and b!1101521 res!735005) b!1101517))

(assert (= (and b!1101517 res!734997) b!1101526))

(assert (= (and b!1101526 res!735002) b!1101519))

(assert (= (and b!1101519 res!734995) b!1101523))

(assert (= (and b!1101523 res!735000) b!1101522))

(assert (= (and b!1101522 res!734999) b!1101515))

(assert (= (and b!1101515 res!735001) b!1101528))

(assert (= (and b!1101528 res!735003) b!1101527))

(assert (= (and b!1101527 (not res!735006)) b!1101529))

(assert (= (and b!1101529 res!734998) b!1101516))

(assert (= (and b!1101516 res!735004) b!1101518))

(assert (= (and b!1101520 condMapEmpty!42625) mapIsEmpty!42625))

(assert (= (and b!1101520 (not condMapEmpty!42625)) mapNonEmpty!42625))

(get-info :version)

(assert (= (and mapNonEmpty!42625 ((_ is ValueCellFull!12903) mapValue!42625)) b!1101525))

(assert (= (and b!1101520 ((_ is ValueCellFull!12903) mapDefault!42625)) b!1101524))

(assert (= start!96832 b!1101520))

(declare-fun b_lambda!18103 () Bool)

(assert (=> (not b_lambda!18103) (not b!1101527)))

(declare-fun t!34217 () Bool)

(declare-fun tb!8041 () Bool)

(assert (=> (and start!96832 (= defaultEntry!882 defaultEntry!882) t!34217) tb!8041))

(declare-fun result!16623 () Bool)

(assert (=> tb!8041 (= result!16623 tp_is_empty!27225)))

(assert (=> b!1101527 t!34217))

(declare-fun b_and!37141 () Bool)

(assert (= b_and!37139 (and (=> t!34217 result!16623) b_and!37141)))

(declare-fun m!1021697 () Bool)

(assert (=> b!1101516 m!1021697))

(declare-fun m!1021699 () Bool)

(assert (=> b!1101522 m!1021699))

(declare-fun m!1021701 () Bool)

(assert (=> b!1101515 m!1021701))

(declare-fun m!1021703 () Bool)

(assert (=> b!1101515 m!1021703))

(declare-fun m!1021705 () Bool)

(assert (=> b!1101523 m!1021705))

(declare-fun m!1021707 () Bool)

(assert (=> b!1101517 m!1021707))

(declare-fun m!1021709 () Bool)

(assert (=> b!1101528 m!1021709))

(declare-fun m!1021711 () Bool)

(assert (=> b!1101527 m!1021711))

(declare-fun m!1021713 () Bool)

(assert (=> b!1101527 m!1021713))

(declare-fun m!1021715 () Bool)

(assert (=> b!1101527 m!1021715))

(declare-fun m!1021717 () Bool)

(assert (=> b!1101527 m!1021717))

(declare-fun m!1021719 () Bool)

(assert (=> b!1101527 m!1021719))

(declare-fun m!1021721 () Bool)

(assert (=> b!1101527 m!1021721))

(declare-fun m!1021723 () Bool)

(assert (=> b!1101527 m!1021723))

(declare-fun m!1021725 () Bool)

(assert (=> b!1101527 m!1021725))

(declare-fun m!1021727 () Bool)

(assert (=> b!1101527 m!1021727))

(declare-fun m!1021729 () Bool)

(assert (=> b!1101527 m!1021729))

(declare-fun m!1021731 () Bool)

(assert (=> b!1101529 m!1021731))

(declare-fun m!1021733 () Bool)

(assert (=> mapNonEmpty!42625 m!1021733))

(declare-fun m!1021735 () Bool)

(assert (=> b!1101518 m!1021735))

(declare-fun m!1021737 () Bool)

(assert (=> start!96832 m!1021737))

(declare-fun m!1021739 () Bool)

(assert (=> start!96832 m!1021739))

(declare-fun m!1021741 () Bool)

(assert (=> start!96832 m!1021741))

(declare-fun m!1021743 () Bool)

(assert (=> b!1101526 m!1021743))

(check-sat tp_is_empty!27225 (not b_lambda!18103) (not b_next!23175) (not start!96832) (not b!1101515) b_and!37141 (not mapNonEmpty!42625) (not b!1101526) (not b!1101517) (not b!1101527) (not b!1101529) (not b!1101518) (not b!1101528) (not b!1101523) (not b!1101516))
(check-sat b_and!37141 (not b_next!23175))
(get-model)

(declare-fun b_lambda!18107 () Bool)

(assert (= b_lambda!18103 (or (and start!96832 b_free!23175) b_lambda!18107)))

(check-sat tp_is_empty!27225 (not b_next!23175) (not start!96832) (not b!1101515) b_and!37141 (not mapNonEmpty!42625) (not b!1101526) (not b!1101517) (not b!1101527) (not b_lambda!18107) (not b!1101529) (not b!1101518) (not b!1101528) (not b!1101523) (not b!1101516))
(check-sat b_and!37141 (not b_next!23175))
(get-model)

(declare-fun b!1101587 () Bool)

(declare-fun e!628755 () Bool)

(declare-fun e!628756 () Bool)

(assert (=> b!1101587 (= e!628755 e!628756)))

(declare-fun lt!493916 () (_ BitVec 64))

(assert (=> b!1101587 (= lt!493916 (select (arr!34348 lt!493872) #b00000000000000000000000000000000))))

(declare-fun lt!493915 () Unit!36198)

(assert (=> b!1101587 (= lt!493915 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!493872 lt!493916 #b00000000000000000000000000000000))))

(assert (=> b!1101587 (arrayContainsKey!0 lt!493872 lt!493916 #b00000000000000000000000000000000)))

(declare-fun lt!493917 () Unit!36198)

(assert (=> b!1101587 (= lt!493917 lt!493915)))

(declare-fun res!735048 () Bool)

(declare-datatypes ((SeekEntryResult!9915 0))(
  ( (MissingZero!9915 (index!42031 (_ BitVec 32))) (Found!9915 (index!42032 (_ BitVec 32))) (Intermediate!9915 (undefined!10727 Bool) (index!42033 (_ BitVec 32)) (x!99070 (_ BitVec 32))) (Undefined!9915) (MissingVacant!9915 (index!42034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71371 (_ BitVec 32)) SeekEntryResult!9915)

(assert (=> b!1101587 (= res!735048 (= (seekEntryOrOpen!0 (select (arr!34348 lt!493872) #b00000000000000000000000000000000) lt!493872 mask!1414) (Found!9915 #b00000000000000000000000000000000)))))

(assert (=> b!1101587 (=> (not res!735048) (not e!628756))))

(declare-fun b!1101588 () Bool)

(declare-fun call!46181 () Bool)

(assert (=> b!1101588 (= e!628756 call!46181)))

(declare-fun bm!46178 () Bool)

(assert (=> bm!46178 (= call!46181 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!493872 mask!1414))))

(declare-fun b!1101589 () Bool)

(assert (=> b!1101589 (= e!628755 call!46181)))

(declare-fun b!1101590 () Bool)

(declare-fun e!628757 () Bool)

(assert (=> b!1101590 (= e!628757 e!628755)))

(declare-fun c!108820 () Bool)

(assert (=> b!1101590 (= c!108820 (validKeyInArray!0 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(declare-fun d!130677 () Bool)

(declare-fun res!735047 () Bool)

(assert (=> d!130677 (=> res!735047 e!628757)))

(assert (=> d!130677 (= res!735047 (bvsge #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(assert (=> d!130677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493872 mask!1414) e!628757)))

(assert (= (and d!130677 (not res!735047)) b!1101590))

(assert (= (and b!1101590 c!108820) b!1101587))

(assert (= (and b!1101590 (not c!108820)) b!1101589))

(assert (= (and b!1101587 res!735048) b!1101588))

(assert (= (or b!1101588 b!1101589) bm!46178))

(declare-fun m!1021793 () Bool)

(assert (=> b!1101587 m!1021793))

(declare-fun m!1021795 () Bool)

(assert (=> b!1101587 m!1021795))

(declare-fun m!1021797 () Bool)

(assert (=> b!1101587 m!1021797))

(assert (=> b!1101587 m!1021793))

(declare-fun m!1021799 () Bool)

(assert (=> b!1101587 m!1021799))

(declare-fun m!1021801 () Bool)

(assert (=> bm!46178 m!1021801))

(assert (=> b!1101590 m!1021793))

(assert (=> b!1101590 m!1021793))

(declare-fun m!1021803 () Bool)

(assert (=> b!1101590 m!1021803))

(assert (=> b!1101515 d!130677))

(declare-fun d!130679 () Bool)

(declare-fun e!628760 () Bool)

(assert (=> d!130679 e!628760))

(declare-fun res!735054 () Bool)

(assert (=> d!130679 (=> (not res!735054) (not e!628760))))

(declare-fun lt!493928 () ListLongMap!15351)

(declare-fun contains!6404 (ListLongMap!15351 (_ BitVec 64)) Bool)

(assert (=> d!130679 (= res!735054 (contains!6404 lt!493928 (_1!8702 lt!493877)))))

(declare-fun lt!493929 () List!23997)

(assert (=> d!130679 (= lt!493928 (ListLongMap!15352 lt!493929))))

(declare-fun lt!493926 () Unit!36198)

(declare-fun lt!493927 () Unit!36198)

(assert (=> d!130679 (= lt!493926 lt!493927)))

(declare-datatypes ((Option!678 0))(
  ( (Some!677 (v!16301 V!41427)) (None!676) )
))
(declare-fun getValueByKey!627 (List!23997 (_ BitVec 64)) Option!678)

(assert (=> d!130679 (= (getValueByKey!627 lt!493929 (_1!8702 lt!493877)) (Some!677 (_2!8702 lt!493877)))))

(declare-fun lemmaContainsTupThenGetReturnValue!304 (List!23997 (_ BitVec 64) V!41427) Unit!36198)

(assert (=> d!130679 (= lt!493927 (lemmaContainsTupThenGetReturnValue!304 lt!493929 (_1!8702 lt!493877) (_2!8702 lt!493877)))))

(declare-fun insertStrictlySorted!397 (List!23997 (_ BitVec 64) V!41427) List!23997)

(assert (=> d!130679 (= lt!493929 (insertStrictlySorted!397 (toList!7691 lt!493875) (_1!8702 lt!493877) (_2!8702 lt!493877)))))

(assert (=> d!130679 (= (+!3396 lt!493875 lt!493877) lt!493928)))

(declare-fun b!1101595 () Bool)

(declare-fun res!735053 () Bool)

(assert (=> b!1101595 (=> (not res!735053) (not e!628760))))

(assert (=> b!1101595 (= res!735053 (= (getValueByKey!627 (toList!7691 lt!493928) (_1!8702 lt!493877)) (Some!677 (_2!8702 lt!493877))))))

(declare-fun b!1101596 () Bool)

(declare-fun contains!6405 (List!23997 tuple2!17382) Bool)

(assert (=> b!1101596 (= e!628760 (contains!6405 (toList!7691 lt!493928) lt!493877))))

(assert (= (and d!130679 res!735054) b!1101595))

(assert (= (and b!1101595 res!735053) b!1101596))

(declare-fun m!1021805 () Bool)

(assert (=> d!130679 m!1021805))

(declare-fun m!1021807 () Bool)

(assert (=> d!130679 m!1021807))

(declare-fun m!1021809 () Bool)

(assert (=> d!130679 m!1021809))

(declare-fun m!1021811 () Bool)

(assert (=> d!130679 m!1021811))

(declare-fun m!1021813 () Bool)

(assert (=> b!1101595 m!1021813))

(declare-fun m!1021815 () Bool)

(assert (=> b!1101596 m!1021815))

(assert (=> b!1101529 d!130679))

(declare-fun b!1101607 () Bool)

(declare-fun e!628772 () Bool)

(declare-fun e!628769 () Bool)

(assert (=> b!1101607 (= e!628772 e!628769)))

(declare-fun res!735063 () Bool)

(assert (=> b!1101607 (=> (not res!735063) (not e!628769))))

(declare-fun e!628771 () Bool)

(assert (=> b!1101607 (= res!735063 (not e!628771))))

(declare-fun res!735061 () Bool)

(assert (=> b!1101607 (=> (not res!735061) (not e!628771))))

(assert (=> b!1101607 (= res!735061 (validKeyInArray!0 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(declare-fun b!1101608 () Bool)

(declare-fun e!628770 () Bool)

(declare-fun call!46184 () Bool)

(assert (=> b!1101608 (= e!628770 call!46184)))

(declare-fun b!1101609 () Bool)

(assert (=> b!1101609 (= e!628770 call!46184)))

(declare-fun bm!46181 () Bool)

(declare-fun c!108823 () Bool)

(assert (=> bm!46181 (= call!46184 (arrayNoDuplicates!0 lt!493872 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108823 (Cons!23994 (select (arr!34348 lt!493872) #b00000000000000000000000000000000) Nil!23995) Nil!23995)))))

(declare-fun d!130681 () Bool)

(declare-fun res!735062 () Bool)

(assert (=> d!130681 (=> res!735062 e!628772)))

(assert (=> d!130681 (= res!735062 (bvsge #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(assert (=> d!130681 (= (arrayNoDuplicates!0 lt!493872 #b00000000000000000000000000000000 Nil!23995) e!628772)))

(declare-fun b!1101610 () Bool)

(assert (=> b!1101610 (= e!628769 e!628770)))

(assert (=> b!1101610 (= c!108823 (validKeyInArray!0 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(declare-fun b!1101611 () Bool)

(declare-fun contains!6406 (List!23998 (_ BitVec 64)) Bool)

(assert (=> b!1101611 (= e!628771 (contains!6406 Nil!23995 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(assert (= (and d!130681 (not res!735062)) b!1101607))

(assert (= (and b!1101607 res!735061) b!1101611))

(assert (= (and b!1101607 res!735063) b!1101610))

(assert (= (and b!1101610 c!108823) b!1101608))

(assert (= (and b!1101610 (not c!108823)) b!1101609))

(assert (= (or b!1101608 b!1101609) bm!46181))

(assert (=> b!1101607 m!1021793))

(assert (=> b!1101607 m!1021793))

(assert (=> b!1101607 m!1021803))

(assert (=> bm!46181 m!1021793))

(declare-fun m!1021817 () Bool)

(assert (=> bm!46181 m!1021817))

(assert (=> b!1101610 m!1021793))

(assert (=> b!1101610 m!1021793))

(assert (=> b!1101610 m!1021803))

(assert (=> b!1101611 m!1021793))

(assert (=> b!1101611 m!1021793))

(declare-fun m!1021819 () Bool)

(assert (=> b!1101611 m!1021819))

(assert (=> b!1101528 d!130681))

(declare-fun d!130683 () Bool)

(assert (=> d!130683 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96832 d!130683))

(declare-fun d!130685 () Bool)

(assert (=> d!130685 (= (array_inv!26454 _keys!1070) (bvsge (size!34884 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96832 d!130685))

(declare-fun d!130687 () Bool)

(assert (=> d!130687 (= (array_inv!26455 _values!874) (bvsge (size!34885 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96832 d!130687))

(declare-fun d!130689 () Bool)

(assert (=> d!130689 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101523 d!130689))

(declare-fun d!130691 () Bool)

(declare-fun e!628773 () Bool)

(assert (=> d!130691 e!628773))

(declare-fun res!735065 () Bool)

(assert (=> d!130691 (=> (not res!735065) (not e!628773))))

(declare-fun lt!493932 () ListLongMap!15351)

(assert (=> d!130691 (= res!735065 (contains!6404 lt!493932 (_1!8702 lt!493877)))))

(declare-fun lt!493933 () List!23997)

(assert (=> d!130691 (= lt!493932 (ListLongMap!15352 lt!493933))))

(declare-fun lt!493930 () Unit!36198)

(declare-fun lt!493931 () Unit!36198)

(assert (=> d!130691 (= lt!493930 lt!493931)))

(assert (=> d!130691 (= (getValueByKey!627 lt!493933 (_1!8702 lt!493877)) (Some!677 (_2!8702 lt!493877)))))

(assert (=> d!130691 (= lt!493931 (lemmaContainsTupThenGetReturnValue!304 lt!493933 (_1!8702 lt!493877) (_2!8702 lt!493877)))))

(assert (=> d!130691 (= lt!493933 (insertStrictlySorted!397 (toList!7691 lt!493874) (_1!8702 lt!493877) (_2!8702 lt!493877)))))

(assert (=> d!130691 (= (+!3396 lt!493874 lt!493877) lt!493932)))

(declare-fun b!1101612 () Bool)

(declare-fun res!735064 () Bool)

(assert (=> b!1101612 (=> (not res!735064) (not e!628773))))

(assert (=> b!1101612 (= res!735064 (= (getValueByKey!627 (toList!7691 lt!493932) (_1!8702 lt!493877)) (Some!677 (_2!8702 lt!493877))))))

(declare-fun b!1101613 () Bool)

(assert (=> b!1101613 (= e!628773 (contains!6405 (toList!7691 lt!493932) lt!493877))))

(assert (= (and d!130691 res!735065) b!1101612))

(assert (= (and b!1101612 res!735064) b!1101613))

(declare-fun m!1021821 () Bool)

(assert (=> d!130691 m!1021821))

(declare-fun m!1021823 () Bool)

(assert (=> d!130691 m!1021823))

(declare-fun m!1021825 () Bool)

(assert (=> d!130691 m!1021825))

(declare-fun m!1021827 () Bool)

(assert (=> d!130691 m!1021827))

(declare-fun m!1021829 () Bool)

(assert (=> b!1101612 m!1021829))

(declare-fun m!1021831 () Bool)

(assert (=> b!1101613 m!1021831))

(assert (=> b!1101518 d!130691))

(declare-fun d!130693 () Bool)

(declare-fun res!735070 () Bool)

(declare-fun e!628778 () Bool)

(assert (=> d!130693 (=> res!735070 e!628778)))

(assert (=> d!130693 (= res!735070 (= (select (arr!34348 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130693 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628778)))

(declare-fun b!1101618 () Bool)

(declare-fun e!628779 () Bool)

(assert (=> b!1101618 (= e!628778 e!628779)))

(declare-fun res!735071 () Bool)

(assert (=> b!1101618 (=> (not res!735071) (not e!628779))))

(assert (=> b!1101618 (= res!735071 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34884 _keys!1070)))))

(declare-fun b!1101619 () Bool)

(assert (=> b!1101619 (= e!628779 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130693 (not res!735070)) b!1101618))

(assert (= (and b!1101618 res!735071) b!1101619))

(declare-fun m!1021833 () Bool)

(assert (=> d!130693 m!1021833))

(declare-fun m!1021835 () Bool)

(assert (=> b!1101619 m!1021835))

(assert (=> b!1101527 d!130693))

(declare-fun b!1101662 () Bool)

(declare-fun e!628810 () ListLongMap!15351)

(declare-fun call!46200 () ListLongMap!15351)

(assert (=> b!1101662 (= e!628810 call!46200)))

(declare-fun b!1101663 () Bool)

(declare-fun e!628815 () Bool)

(assert (=> b!1101663 (= e!628815 (validKeyInArray!0 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101664 () Bool)

(declare-fun e!628816 () Bool)

(declare-fun e!628818 () Bool)

(assert (=> b!1101664 (= e!628816 e!628818)))

(declare-fun res!735098 () Bool)

(declare-fun call!46204 () Bool)

(assert (=> b!1101664 (= res!735098 call!46204)))

(assert (=> b!1101664 (=> (not res!735098) (not e!628818))))

(declare-fun b!1101665 () Bool)

(declare-fun e!628808 () Bool)

(declare-fun e!628809 () Bool)

(assert (=> b!1101665 (= e!628808 e!628809)))

(declare-fun res!735095 () Bool)

(assert (=> b!1101665 (=> (not res!735095) (not e!628809))))

(declare-fun lt!493994 () ListLongMap!15351)

(assert (=> b!1101665 (= res!735095 (contains!6404 lt!493994 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101665 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(declare-fun bm!46196 () Bool)

(declare-fun call!46199 () ListLongMap!15351)

(declare-fun call!46202 () ListLongMap!15351)

(assert (=> bm!46196 (= call!46199 call!46202)))

(declare-fun bm!46197 () Bool)

(declare-fun call!46203 () ListLongMap!15351)

(assert (=> bm!46197 (= call!46200 call!46203)))

(declare-fun b!1101666 () Bool)

(declare-fun e!628806 () Bool)

(declare-fun apply!952 (ListLongMap!15351 (_ BitVec 64)) V!41427)

(assert (=> b!1101666 (= e!628806 (= (apply!952 lt!493994 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46198 () Bool)

(assert (=> bm!46198 (= call!46204 (contains!6404 lt!493994 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101667 () Bool)

(declare-fun e!628812 () Unit!36198)

(declare-fun Unit!36202 () Unit!36198)

(assert (=> b!1101667 (= e!628812 Unit!36202)))

(declare-fun b!1101668 () Bool)

(assert (=> b!1101668 (= e!628818 (= (apply!952 lt!493994 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1101669 () Bool)

(declare-fun e!628811 () ListLongMap!15351)

(declare-fun e!628814 () ListLongMap!15351)

(assert (=> b!1101669 (= e!628811 e!628814)))

(declare-fun c!108840 () Bool)

(assert (=> b!1101669 (= c!108840 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101670 () Bool)

(declare-fun e!628817 () Bool)

(assert (=> b!1101670 (= e!628817 (validKeyInArray!0 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101671 () Bool)

(declare-fun c!108839 () Bool)

(assert (=> b!1101671 (= c!108839 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1101671 (= e!628814 e!628810)))

(declare-fun bm!46199 () Bool)

(declare-fun call!46201 () Bool)

(assert (=> bm!46199 (= call!46201 (contains!6404 lt!493994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46200 () Bool)

(declare-fun call!46205 () ListLongMap!15351)

(assert (=> bm!46200 (= call!46202 call!46205)))

(declare-fun b!1101673 () Bool)

(assert (=> b!1101673 (= e!628816 (not call!46204))))

(declare-fun bm!46201 () Bool)

(declare-fun c!108836 () Bool)

(assert (=> bm!46201 (= call!46203 (+!3396 (ite c!108836 call!46205 (ite c!108840 call!46202 call!46199)) (ite (or c!108836 c!108840) (tuple2!17383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1101674 () Bool)

(declare-fun get!17656 (ValueCell!12903 V!41427) V!41427)

(assert (=> b!1101674 (= e!628809 (= (apply!952 lt!493994 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)) (get!17656 (select (arr!34349 _values!874) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101674 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34885 _values!874)))))

(assert (=> b!1101674 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(declare-fun b!1101675 () Bool)

(declare-fun e!628813 () Bool)

(assert (=> b!1101675 (= e!628813 (not call!46201))))

(declare-fun bm!46202 () Bool)

(assert (=> bm!46202 (= call!46205 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101676 () Bool)

(declare-fun res!735097 () Bool)

(declare-fun e!628807 () Bool)

(assert (=> b!1101676 (=> (not res!735097) (not e!628807))))

(assert (=> b!1101676 (= res!735097 e!628808)))

(declare-fun res!735092 () Bool)

(assert (=> b!1101676 (=> res!735092 e!628808)))

(assert (=> b!1101676 (= res!735092 (not e!628815))))

(declare-fun res!735094 () Bool)

(assert (=> b!1101676 (=> (not res!735094) (not e!628815))))

(assert (=> b!1101676 (= res!735094 (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(declare-fun b!1101677 () Bool)

(assert (=> b!1101677 (= e!628810 call!46199)))

(declare-fun b!1101678 () Bool)

(declare-fun lt!493990 () Unit!36198)

(assert (=> b!1101678 (= e!628812 lt!493990)))

(declare-fun lt!493998 () ListLongMap!15351)

(assert (=> b!1101678 (= lt!493998 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493989 () (_ BitVec 64))

(assert (=> b!1101678 (= lt!493989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493992 () (_ BitVec 64))

(assert (=> b!1101678 (= lt!493992 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493996 () Unit!36198)

(declare-fun addStillContains!665 (ListLongMap!15351 (_ BitVec 64) V!41427 (_ BitVec 64)) Unit!36198)

(assert (=> b!1101678 (= lt!493996 (addStillContains!665 lt!493998 lt!493989 zeroValue!831 lt!493992))))

(assert (=> b!1101678 (contains!6404 (+!3396 lt!493998 (tuple2!17383 lt!493989 zeroValue!831)) lt!493992)))

(declare-fun lt!493983 () Unit!36198)

(assert (=> b!1101678 (= lt!493983 lt!493996)))

(declare-fun lt!493985 () ListLongMap!15351)

(assert (=> b!1101678 (= lt!493985 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493979 () (_ BitVec 64))

(assert (=> b!1101678 (= lt!493979 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493978 () (_ BitVec 64))

(assert (=> b!1101678 (= lt!493978 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493980 () Unit!36198)

(declare-fun addApplyDifferent!525 (ListLongMap!15351 (_ BitVec 64) V!41427 (_ BitVec 64)) Unit!36198)

(assert (=> b!1101678 (= lt!493980 (addApplyDifferent!525 lt!493985 lt!493979 minValue!831 lt!493978))))

(assert (=> b!1101678 (= (apply!952 (+!3396 lt!493985 (tuple2!17383 lt!493979 minValue!831)) lt!493978) (apply!952 lt!493985 lt!493978))))

(declare-fun lt!493984 () Unit!36198)

(assert (=> b!1101678 (= lt!493984 lt!493980)))

(declare-fun lt!493997 () ListLongMap!15351)

(assert (=> b!1101678 (= lt!493997 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493999 () (_ BitVec 64))

(assert (=> b!1101678 (= lt!493999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493991 () (_ BitVec 64))

(assert (=> b!1101678 (= lt!493991 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493986 () Unit!36198)

(assert (=> b!1101678 (= lt!493986 (addApplyDifferent!525 lt!493997 lt!493999 zeroValue!831 lt!493991))))

(assert (=> b!1101678 (= (apply!952 (+!3396 lt!493997 (tuple2!17383 lt!493999 zeroValue!831)) lt!493991) (apply!952 lt!493997 lt!493991))))

(declare-fun lt!493995 () Unit!36198)

(assert (=> b!1101678 (= lt!493995 lt!493986)))

(declare-fun lt!493987 () ListLongMap!15351)

(assert (=> b!1101678 (= lt!493987 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493982 () (_ BitVec 64))

(assert (=> b!1101678 (= lt!493982 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493993 () (_ BitVec 64))

(assert (=> b!1101678 (= lt!493993 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101678 (= lt!493990 (addApplyDifferent!525 lt!493987 lt!493982 minValue!831 lt!493993))))

(assert (=> b!1101678 (= (apply!952 (+!3396 lt!493987 (tuple2!17383 lt!493982 minValue!831)) lt!493993) (apply!952 lt!493987 lt!493993))))

(declare-fun b!1101679 () Bool)

(assert (=> b!1101679 (= e!628813 e!628806)))

(declare-fun res!735091 () Bool)

(assert (=> b!1101679 (= res!735091 call!46201)))

(assert (=> b!1101679 (=> (not res!735091) (not e!628806))))

(declare-fun b!1101680 () Bool)

(assert (=> b!1101680 (= e!628814 call!46200)))

(declare-fun d!130695 () Bool)

(assert (=> d!130695 e!628807))

(declare-fun res!735093 () Bool)

(assert (=> d!130695 (=> (not res!735093) (not e!628807))))

(assert (=> d!130695 (= res!735093 (or (bvsge #b00000000000000000000000000000000 (size!34884 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))))

(declare-fun lt!493988 () ListLongMap!15351)

(assert (=> d!130695 (= lt!493994 lt!493988)))

(declare-fun lt!493981 () Unit!36198)

(assert (=> d!130695 (= lt!493981 e!628812)))

(declare-fun c!108841 () Bool)

(assert (=> d!130695 (= c!108841 e!628817)))

(declare-fun res!735090 () Bool)

(assert (=> d!130695 (=> (not res!735090) (not e!628817))))

(assert (=> d!130695 (= res!735090 (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(assert (=> d!130695 (= lt!493988 e!628811)))

(assert (=> d!130695 (= c!108836 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130695 (validMask!0 mask!1414)))

(assert (=> d!130695 (= (getCurrentListMap!4396 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493994)))

(declare-fun b!1101672 () Bool)

(assert (=> b!1101672 (= e!628811 (+!3396 call!46203 (tuple2!17383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101681 () Bool)

(assert (=> b!1101681 (= e!628807 e!628816)))

(declare-fun c!108838 () Bool)

(assert (=> b!1101681 (= c!108838 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101682 () Bool)

(declare-fun res!735096 () Bool)

(assert (=> b!1101682 (=> (not res!735096) (not e!628807))))

(assert (=> b!1101682 (= res!735096 e!628813)))

(declare-fun c!108837 () Bool)

(assert (=> b!1101682 (= c!108837 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!130695 c!108836) b!1101672))

(assert (= (and d!130695 (not c!108836)) b!1101669))

(assert (= (and b!1101669 c!108840) b!1101680))

(assert (= (and b!1101669 (not c!108840)) b!1101671))

(assert (= (and b!1101671 c!108839) b!1101662))

(assert (= (and b!1101671 (not c!108839)) b!1101677))

(assert (= (or b!1101662 b!1101677) bm!46196))

(assert (= (or b!1101680 bm!46196) bm!46200))

(assert (= (or b!1101680 b!1101662) bm!46197))

(assert (= (or b!1101672 bm!46200) bm!46202))

(assert (= (or b!1101672 bm!46197) bm!46201))

(assert (= (and d!130695 res!735090) b!1101670))

(assert (= (and d!130695 c!108841) b!1101678))

(assert (= (and d!130695 (not c!108841)) b!1101667))

(assert (= (and d!130695 res!735093) b!1101676))

(assert (= (and b!1101676 res!735094) b!1101663))

(assert (= (and b!1101676 (not res!735092)) b!1101665))

(assert (= (and b!1101665 res!735095) b!1101674))

(assert (= (and b!1101676 res!735097) b!1101682))

(assert (= (and b!1101682 c!108837) b!1101679))

(assert (= (and b!1101682 (not c!108837)) b!1101675))

(assert (= (and b!1101679 res!735091) b!1101666))

(assert (= (or b!1101679 b!1101675) bm!46199))

(assert (= (and b!1101682 res!735096) b!1101681))

(assert (= (and b!1101681 c!108838) b!1101664))

(assert (= (and b!1101681 (not c!108838)) b!1101673))

(assert (= (and b!1101664 res!735098) b!1101668))

(assert (= (or b!1101664 b!1101673) bm!46198))

(declare-fun b_lambda!18109 () Bool)

(assert (=> (not b_lambda!18109) (not b!1101674)))

(assert (=> b!1101674 t!34217))

(declare-fun b_and!37147 () Bool)

(assert (= b_and!37141 (and (=> t!34217 result!16623) b_and!37147)))

(assert (=> b!1101670 m!1021833))

(assert (=> b!1101670 m!1021833))

(declare-fun m!1021837 () Bool)

(assert (=> b!1101670 m!1021837))

(declare-fun m!1021839 () Bool)

(assert (=> bm!46199 m!1021839))

(declare-fun m!1021841 () Bool)

(assert (=> bm!46198 m!1021841))

(declare-fun m!1021843 () Bool)

(assert (=> b!1101674 m!1021843))

(assert (=> b!1101674 m!1021713))

(declare-fun m!1021845 () Bool)

(assert (=> b!1101674 m!1021845))

(assert (=> b!1101674 m!1021833))

(declare-fun m!1021847 () Bool)

(assert (=> b!1101674 m!1021847))

(assert (=> b!1101674 m!1021713))

(assert (=> b!1101674 m!1021833))

(assert (=> b!1101674 m!1021843))

(declare-fun m!1021849 () Bool)

(assert (=> b!1101678 m!1021849))

(declare-fun m!1021851 () Bool)

(assert (=> b!1101678 m!1021851))

(declare-fun m!1021853 () Bool)

(assert (=> b!1101678 m!1021853))

(declare-fun m!1021855 () Bool)

(assert (=> b!1101678 m!1021855))

(declare-fun m!1021857 () Bool)

(assert (=> b!1101678 m!1021857))

(declare-fun m!1021859 () Bool)

(assert (=> b!1101678 m!1021859))

(assert (=> b!1101678 m!1021833))

(assert (=> b!1101678 m!1021849))

(assert (=> b!1101678 m!1021853))

(declare-fun m!1021861 () Bool)

(assert (=> b!1101678 m!1021861))

(assert (=> b!1101678 m!1021861))

(declare-fun m!1021863 () Bool)

(assert (=> b!1101678 m!1021863))

(declare-fun m!1021865 () Bool)

(assert (=> b!1101678 m!1021865))

(declare-fun m!1021867 () Bool)

(assert (=> b!1101678 m!1021867))

(declare-fun m!1021869 () Bool)

(assert (=> b!1101678 m!1021869))

(assert (=> b!1101678 m!1021867))

(declare-fun m!1021871 () Bool)

(assert (=> b!1101678 m!1021871))

(declare-fun m!1021873 () Bool)

(assert (=> b!1101678 m!1021873))

(declare-fun m!1021875 () Bool)

(assert (=> b!1101678 m!1021875))

(declare-fun m!1021877 () Bool)

(assert (=> b!1101678 m!1021877))

(assert (=> b!1101678 m!1021719))

(declare-fun m!1021879 () Bool)

(assert (=> bm!46201 m!1021879))

(assert (=> d!130695 m!1021737))

(assert (=> bm!46202 m!1021719))

(assert (=> b!1101665 m!1021833))

(assert (=> b!1101665 m!1021833))

(declare-fun m!1021881 () Bool)

(assert (=> b!1101665 m!1021881))

(declare-fun m!1021883 () Bool)

(assert (=> b!1101668 m!1021883))

(assert (=> b!1101663 m!1021833))

(assert (=> b!1101663 m!1021833))

(assert (=> b!1101663 m!1021837))

(declare-fun m!1021885 () Bool)

(assert (=> b!1101672 m!1021885))

(declare-fun m!1021887 () Bool)

(assert (=> b!1101666 m!1021887))

(assert (=> b!1101527 d!130695))

(declare-fun b!1101689 () Bool)

(declare-fun e!628823 () Bool)

(declare-fun e!628824 () Bool)

(assert (=> b!1101689 (= e!628823 e!628824)))

(declare-fun c!108844 () Bool)

(assert (=> b!1101689 (= c!108844 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun call!46211 () ListLongMap!15351)

(declare-fun bm!46207 () Bool)

(assert (=> bm!46207 (= call!46211 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46208 () Bool)

(declare-fun call!46210 () ListLongMap!15351)

(assert (=> bm!46208 (= call!46210 (getCurrentListMapNoExtraKeys!4192 (array!71372 (store (arr!34348 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34884 _keys!1070)) (array!71374 (store (arr!34349 _values!874) i!650 (ValueCellFull!12903 (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34885 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101691 () Bool)

(assert (=> b!1101691 (= e!628824 (= call!46210 call!46211))))

(assert (=> b!1101691 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34885 _values!874)))))

(declare-fun b!1101690 () Bool)

(assert (=> b!1101690 (= e!628824 (= call!46210 (-!974 call!46211 k0!904)))))

(assert (=> b!1101690 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34885 _values!874)))))

(declare-fun d!130697 () Bool)

(assert (=> d!130697 e!628823))

(declare-fun res!735101 () Bool)

(assert (=> d!130697 (=> (not res!735101) (not e!628823))))

(assert (=> d!130697 (= res!735101 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34884 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34884 _keys!1070))))))))

(declare-fun lt!494002 () Unit!36198)

(declare-fun choose!1771 (array!71371 array!71373 (_ BitVec 32) (_ BitVec 32) V!41427 V!41427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36198)

(assert (=> d!130697 (= lt!494002 (choose!1771 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(assert (=> d!130697 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!222 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!494002)))

(assert (= (and d!130697 res!735101) b!1101689))

(assert (= (and b!1101689 c!108844) b!1101690))

(assert (= (and b!1101689 (not c!108844)) b!1101691))

(assert (= (or b!1101690 b!1101691) bm!46207))

(assert (= (or b!1101690 b!1101691) bm!46208))

(declare-fun b_lambda!18111 () Bool)

(assert (=> (not b_lambda!18111) (not bm!46208)))

(assert (=> bm!46208 t!34217))

(declare-fun b_and!37149 () Bool)

(assert (= b_and!37147 (and (=> t!34217 result!16623) b_and!37149)))

(assert (=> bm!46207 m!1021719))

(assert (=> bm!46208 m!1021703))

(assert (=> bm!46208 m!1021713))

(assert (=> bm!46208 m!1021715))

(declare-fun m!1021889 () Bool)

(assert (=> bm!46208 m!1021889))

(declare-fun m!1021891 () Bool)

(assert (=> b!1101690 m!1021891))

(declare-fun m!1021893 () Bool)

(assert (=> d!130697 m!1021893))

(assert (=> b!1101527 d!130697))

(declare-fun b!1101716 () Bool)

(declare-fun e!628843 () ListLongMap!15351)

(assert (=> b!1101716 (= e!628843 (ListLongMap!15352 Nil!23994))))

(declare-fun b!1101717 () Bool)

(declare-fun e!628839 () Bool)

(declare-fun lt!494017 () ListLongMap!15351)

(declare-fun isEmpty!970 (ListLongMap!15351) Bool)

(assert (=> b!1101717 (= e!628839 (isEmpty!970 lt!494017))))

(declare-fun b!1101718 () Bool)

(declare-fun lt!494023 () Unit!36198)

(declare-fun lt!494020 () Unit!36198)

(assert (=> b!1101718 (= lt!494023 lt!494020)))

(declare-fun lt!494019 () (_ BitVec 64))

(declare-fun lt!494018 () V!41427)

(declare-fun lt!494021 () ListLongMap!15351)

(declare-fun lt!494022 () (_ BitVec 64))

(assert (=> b!1101718 (not (contains!6404 (+!3396 lt!494021 (tuple2!17383 lt!494022 lt!494018)) lt!494019))))

(declare-fun addStillNotContains!280 (ListLongMap!15351 (_ BitVec 64) V!41427 (_ BitVec 64)) Unit!36198)

(assert (=> b!1101718 (= lt!494020 (addStillNotContains!280 lt!494021 lt!494022 lt!494018 lt!494019))))

(assert (=> b!1101718 (= lt!494019 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101718 (= lt!494018 (get!17656 (select (arr!34349 lt!493871) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101718 (= lt!494022 (select (arr!34348 lt!493872) #b00000000000000000000000000000000))))

(declare-fun call!46214 () ListLongMap!15351)

(assert (=> b!1101718 (= lt!494021 call!46214)))

(declare-fun e!628841 () ListLongMap!15351)

(assert (=> b!1101718 (= e!628841 (+!3396 call!46214 (tuple2!17383 (select (arr!34348 lt!493872) #b00000000000000000000000000000000) (get!17656 (select (arr!34349 lt!493871) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1101719 () Bool)

(assert (=> b!1101719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(assert (=> b!1101719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34885 lt!493871)))))

(declare-fun e!628844 () Bool)

(assert (=> b!1101719 (= e!628844 (= (apply!952 lt!494017 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)) (get!17656 (select (arr!34349 lt!493871) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101720 () Bool)

(declare-fun e!628840 () Bool)

(declare-fun e!628842 () Bool)

(assert (=> b!1101720 (= e!628840 e!628842)))

(declare-fun c!108856 () Bool)

(declare-fun e!628845 () Bool)

(assert (=> b!1101720 (= c!108856 e!628845)))

(declare-fun res!735110 () Bool)

(assert (=> b!1101720 (=> (not res!735110) (not e!628845))))

(assert (=> b!1101720 (= res!735110 (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(declare-fun bm!46211 () Bool)

(assert (=> bm!46211 (= call!46214 (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101721 () Bool)

(assert (=> b!1101721 (= e!628843 e!628841)))

(declare-fun c!108855 () Bool)

(assert (=> b!1101721 (= c!108855 (validKeyInArray!0 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(declare-fun b!1101723 () Bool)

(declare-fun res!735113 () Bool)

(assert (=> b!1101723 (=> (not res!735113) (not e!628840))))

(assert (=> b!1101723 (= res!735113 (not (contains!6404 lt!494017 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101724 () Bool)

(assert (=> b!1101724 (= e!628845 (validKeyInArray!0 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(assert (=> b!1101724 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101725 () Bool)

(assert (=> b!1101725 (= e!628839 (= lt!494017 (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101726 () Bool)

(assert (=> b!1101726 (= e!628842 e!628839)))

(declare-fun c!108853 () Bool)

(assert (=> b!1101726 (= c!108853 (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(declare-fun b!1101727 () Bool)

(assert (=> b!1101727 (= e!628841 call!46214)))

(declare-fun d!130699 () Bool)

(assert (=> d!130699 e!628840))

(declare-fun res!735111 () Bool)

(assert (=> d!130699 (=> (not res!735111) (not e!628840))))

(assert (=> d!130699 (= res!735111 (not (contains!6404 lt!494017 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130699 (= lt!494017 e!628843)))

(declare-fun c!108854 () Bool)

(assert (=> d!130699 (= c!108854 (bvsge #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(assert (=> d!130699 (validMask!0 mask!1414)))

(assert (=> d!130699 (= (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494017)))

(declare-fun b!1101722 () Bool)

(assert (=> b!1101722 (= e!628842 e!628844)))

(assert (=> b!1101722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(declare-fun res!735112 () Bool)

(assert (=> b!1101722 (= res!735112 (contains!6404 lt!494017 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(assert (=> b!1101722 (=> (not res!735112) (not e!628844))))

(assert (= (and d!130699 c!108854) b!1101716))

(assert (= (and d!130699 (not c!108854)) b!1101721))

(assert (= (and b!1101721 c!108855) b!1101718))

(assert (= (and b!1101721 (not c!108855)) b!1101727))

(assert (= (or b!1101718 b!1101727) bm!46211))

(assert (= (and d!130699 res!735111) b!1101723))

(assert (= (and b!1101723 res!735113) b!1101720))

(assert (= (and b!1101720 res!735110) b!1101724))

(assert (= (and b!1101720 c!108856) b!1101722))

(assert (= (and b!1101720 (not c!108856)) b!1101726))

(assert (= (and b!1101722 res!735112) b!1101719))

(assert (= (and b!1101726 c!108853) b!1101725))

(assert (= (and b!1101726 (not c!108853)) b!1101717))

(declare-fun b_lambda!18113 () Bool)

(assert (=> (not b_lambda!18113) (not b!1101718)))

(assert (=> b!1101718 t!34217))

(declare-fun b_and!37151 () Bool)

(assert (= b_and!37149 (and (=> t!34217 result!16623) b_and!37151)))

(declare-fun b_lambda!18115 () Bool)

(assert (=> (not b_lambda!18115) (not b!1101719)))

(assert (=> b!1101719 t!34217))

(declare-fun b_and!37153 () Bool)

(assert (= b_and!37151 (and (=> t!34217 result!16623) b_and!37153)))

(assert (=> b!1101722 m!1021793))

(assert (=> b!1101722 m!1021793))

(declare-fun m!1021895 () Bool)

(assert (=> b!1101722 m!1021895))

(declare-fun m!1021897 () Bool)

(assert (=> d!130699 m!1021897))

(assert (=> d!130699 m!1021737))

(declare-fun m!1021899 () Bool)

(assert (=> bm!46211 m!1021899))

(assert (=> b!1101721 m!1021793))

(assert (=> b!1101721 m!1021793))

(assert (=> b!1101721 m!1021803))

(assert (=> b!1101719 m!1021793))

(declare-fun m!1021901 () Bool)

(assert (=> b!1101719 m!1021901))

(assert (=> b!1101719 m!1021713))

(declare-fun m!1021903 () Bool)

(assert (=> b!1101719 m!1021903))

(assert (=> b!1101719 m!1021713))

(assert (=> b!1101719 m!1021901))

(assert (=> b!1101719 m!1021793))

(declare-fun m!1021905 () Bool)

(assert (=> b!1101719 m!1021905))

(declare-fun m!1021907 () Bool)

(assert (=> b!1101717 m!1021907))

(declare-fun m!1021909 () Bool)

(assert (=> b!1101723 m!1021909))

(assert (=> b!1101718 m!1021901))

(assert (=> b!1101718 m!1021713))

(assert (=> b!1101718 m!1021903))

(declare-fun m!1021911 () Bool)

(assert (=> b!1101718 m!1021911))

(assert (=> b!1101718 m!1021713))

(assert (=> b!1101718 m!1021901))

(declare-fun m!1021913 () Bool)

(assert (=> b!1101718 m!1021913))

(declare-fun m!1021915 () Bool)

(assert (=> b!1101718 m!1021915))

(assert (=> b!1101718 m!1021793))

(assert (=> b!1101718 m!1021913))

(declare-fun m!1021917 () Bool)

(assert (=> b!1101718 m!1021917))

(assert (=> b!1101724 m!1021793))

(assert (=> b!1101724 m!1021793))

(assert (=> b!1101724 m!1021803))

(assert (=> b!1101725 m!1021899))

(assert (=> b!1101527 d!130699))

(declare-fun b!1101728 () Bool)

(declare-fun e!628850 () ListLongMap!15351)

(declare-fun call!46216 () ListLongMap!15351)

(assert (=> b!1101728 (= e!628850 call!46216)))

(declare-fun b!1101729 () Bool)

(declare-fun e!628855 () Bool)

(assert (=> b!1101729 (= e!628855 (validKeyInArray!0 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(declare-fun b!1101730 () Bool)

(declare-fun e!628856 () Bool)

(declare-fun e!628858 () Bool)

(assert (=> b!1101730 (= e!628856 e!628858)))

(declare-fun res!735122 () Bool)

(declare-fun call!46220 () Bool)

(assert (=> b!1101730 (= res!735122 call!46220)))

(assert (=> b!1101730 (=> (not res!735122) (not e!628858))))

(declare-fun b!1101731 () Bool)

(declare-fun e!628848 () Bool)

(declare-fun e!628849 () Bool)

(assert (=> b!1101731 (= e!628848 e!628849)))

(declare-fun res!735119 () Bool)

(assert (=> b!1101731 (=> (not res!735119) (not e!628849))))

(declare-fun lt!494040 () ListLongMap!15351)

(assert (=> b!1101731 (= res!735119 (contains!6404 lt!494040 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(assert (=> b!1101731 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(declare-fun bm!46212 () Bool)

(declare-fun call!46215 () ListLongMap!15351)

(declare-fun call!46218 () ListLongMap!15351)

(assert (=> bm!46212 (= call!46215 call!46218)))

(declare-fun bm!46213 () Bool)

(declare-fun call!46219 () ListLongMap!15351)

(assert (=> bm!46213 (= call!46216 call!46219)))

(declare-fun b!1101732 () Bool)

(declare-fun e!628846 () Bool)

(assert (=> b!1101732 (= e!628846 (= (apply!952 lt!494040 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46214 () Bool)

(assert (=> bm!46214 (= call!46220 (contains!6404 lt!494040 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101733 () Bool)

(declare-fun e!628852 () Unit!36198)

(declare-fun Unit!36203 () Unit!36198)

(assert (=> b!1101733 (= e!628852 Unit!36203)))

(declare-fun b!1101734 () Bool)

(assert (=> b!1101734 (= e!628858 (= (apply!952 lt!494040 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1101735 () Bool)

(declare-fun e!628851 () ListLongMap!15351)

(declare-fun e!628854 () ListLongMap!15351)

(assert (=> b!1101735 (= e!628851 e!628854)))

(declare-fun c!108861 () Bool)

(assert (=> b!1101735 (= c!108861 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101736 () Bool)

(declare-fun e!628857 () Bool)

(assert (=> b!1101736 (= e!628857 (validKeyInArray!0 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)))))

(declare-fun b!1101737 () Bool)

(declare-fun c!108860 () Bool)

(assert (=> b!1101737 (= c!108860 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1101737 (= e!628854 e!628850)))

(declare-fun bm!46215 () Bool)

(declare-fun call!46217 () Bool)

(assert (=> bm!46215 (= call!46217 (contains!6404 lt!494040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46216 () Bool)

(declare-fun call!46221 () ListLongMap!15351)

(assert (=> bm!46216 (= call!46218 call!46221)))

(declare-fun b!1101739 () Bool)

(assert (=> b!1101739 (= e!628856 (not call!46220))))

(declare-fun bm!46217 () Bool)

(declare-fun c!108857 () Bool)

(assert (=> bm!46217 (= call!46219 (+!3396 (ite c!108857 call!46221 (ite c!108861 call!46218 call!46215)) (ite (or c!108857 c!108861) (tuple2!17383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1101740 () Bool)

(assert (=> b!1101740 (= e!628849 (= (apply!952 lt!494040 (select (arr!34348 lt!493872) #b00000000000000000000000000000000)) (get!17656 (select (arr!34349 lt!493871) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34885 lt!493871)))))

(assert (=> b!1101740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(declare-fun b!1101741 () Bool)

(declare-fun e!628853 () Bool)

(assert (=> b!1101741 (= e!628853 (not call!46217))))

(declare-fun bm!46218 () Bool)

(assert (=> bm!46218 (= call!46221 (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101742 () Bool)

(declare-fun res!735121 () Bool)

(declare-fun e!628847 () Bool)

(assert (=> b!1101742 (=> (not res!735121) (not e!628847))))

(assert (=> b!1101742 (= res!735121 e!628848)))

(declare-fun res!735116 () Bool)

(assert (=> b!1101742 (=> res!735116 e!628848)))

(assert (=> b!1101742 (= res!735116 (not e!628855))))

(declare-fun res!735118 () Bool)

(assert (=> b!1101742 (=> (not res!735118) (not e!628855))))

(assert (=> b!1101742 (= res!735118 (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(declare-fun b!1101743 () Bool)

(assert (=> b!1101743 (= e!628850 call!46215)))

(declare-fun b!1101744 () Bool)

(declare-fun lt!494036 () Unit!36198)

(assert (=> b!1101744 (= e!628852 lt!494036)))

(declare-fun lt!494044 () ListLongMap!15351)

(assert (=> b!1101744 (= lt!494044 (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494035 () (_ BitVec 64))

(assert (=> b!1101744 (= lt!494035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494038 () (_ BitVec 64))

(assert (=> b!1101744 (= lt!494038 (select (arr!34348 lt!493872) #b00000000000000000000000000000000))))

(declare-fun lt!494042 () Unit!36198)

(assert (=> b!1101744 (= lt!494042 (addStillContains!665 lt!494044 lt!494035 zeroValue!831 lt!494038))))

(assert (=> b!1101744 (contains!6404 (+!3396 lt!494044 (tuple2!17383 lt!494035 zeroValue!831)) lt!494038)))

(declare-fun lt!494029 () Unit!36198)

(assert (=> b!1101744 (= lt!494029 lt!494042)))

(declare-fun lt!494031 () ListLongMap!15351)

(assert (=> b!1101744 (= lt!494031 (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494025 () (_ BitVec 64))

(assert (=> b!1101744 (= lt!494025 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494024 () (_ BitVec 64))

(assert (=> b!1101744 (= lt!494024 (select (arr!34348 lt!493872) #b00000000000000000000000000000000))))

(declare-fun lt!494026 () Unit!36198)

(assert (=> b!1101744 (= lt!494026 (addApplyDifferent!525 lt!494031 lt!494025 minValue!831 lt!494024))))

(assert (=> b!1101744 (= (apply!952 (+!3396 lt!494031 (tuple2!17383 lt!494025 minValue!831)) lt!494024) (apply!952 lt!494031 lt!494024))))

(declare-fun lt!494030 () Unit!36198)

(assert (=> b!1101744 (= lt!494030 lt!494026)))

(declare-fun lt!494043 () ListLongMap!15351)

(assert (=> b!1101744 (= lt!494043 (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494045 () (_ BitVec 64))

(assert (=> b!1101744 (= lt!494045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494037 () (_ BitVec 64))

(assert (=> b!1101744 (= lt!494037 (select (arr!34348 lt!493872) #b00000000000000000000000000000000))))

(declare-fun lt!494032 () Unit!36198)

(assert (=> b!1101744 (= lt!494032 (addApplyDifferent!525 lt!494043 lt!494045 zeroValue!831 lt!494037))))

(assert (=> b!1101744 (= (apply!952 (+!3396 lt!494043 (tuple2!17383 lt!494045 zeroValue!831)) lt!494037) (apply!952 lt!494043 lt!494037))))

(declare-fun lt!494041 () Unit!36198)

(assert (=> b!1101744 (= lt!494041 lt!494032)))

(declare-fun lt!494033 () ListLongMap!15351)

(assert (=> b!1101744 (= lt!494033 (getCurrentListMapNoExtraKeys!4192 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494028 () (_ BitVec 64))

(assert (=> b!1101744 (= lt!494028 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494039 () (_ BitVec 64))

(assert (=> b!1101744 (= lt!494039 (select (arr!34348 lt!493872) #b00000000000000000000000000000000))))

(assert (=> b!1101744 (= lt!494036 (addApplyDifferent!525 lt!494033 lt!494028 minValue!831 lt!494039))))

(assert (=> b!1101744 (= (apply!952 (+!3396 lt!494033 (tuple2!17383 lt!494028 minValue!831)) lt!494039) (apply!952 lt!494033 lt!494039))))

(declare-fun b!1101745 () Bool)

(assert (=> b!1101745 (= e!628853 e!628846)))

(declare-fun res!735115 () Bool)

(assert (=> b!1101745 (= res!735115 call!46217)))

(assert (=> b!1101745 (=> (not res!735115) (not e!628846))))

(declare-fun b!1101746 () Bool)

(assert (=> b!1101746 (= e!628854 call!46216)))

(declare-fun d!130701 () Bool)

(assert (=> d!130701 e!628847))

(declare-fun res!735117 () Bool)

(assert (=> d!130701 (=> (not res!735117) (not e!628847))))

(assert (=> d!130701 (= res!735117 (or (bvsge #b00000000000000000000000000000000 (size!34884 lt!493872)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))))

(declare-fun lt!494034 () ListLongMap!15351)

(assert (=> d!130701 (= lt!494040 lt!494034)))

(declare-fun lt!494027 () Unit!36198)

(assert (=> d!130701 (= lt!494027 e!628852)))

(declare-fun c!108862 () Bool)

(assert (=> d!130701 (= c!108862 e!628857)))

(declare-fun res!735114 () Bool)

(assert (=> d!130701 (=> (not res!735114) (not e!628857))))

(assert (=> d!130701 (= res!735114 (bvslt #b00000000000000000000000000000000 (size!34884 lt!493872)))))

(assert (=> d!130701 (= lt!494034 e!628851)))

(assert (=> d!130701 (= c!108857 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130701 (validMask!0 mask!1414)))

(assert (=> d!130701 (= (getCurrentListMap!4396 lt!493872 lt!493871 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494040)))

(declare-fun b!1101738 () Bool)

(assert (=> b!1101738 (= e!628851 (+!3396 call!46219 (tuple2!17383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101747 () Bool)

(assert (=> b!1101747 (= e!628847 e!628856)))

(declare-fun c!108859 () Bool)

(assert (=> b!1101747 (= c!108859 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101748 () Bool)

(declare-fun res!735120 () Bool)

(assert (=> b!1101748 (=> (not res!735120) (not e!628847))))

(assert (=> b!1101748 (= res!735120 e!628853)))

(declare-fun c!108858 () Bool)

(assert (=> b!1101748 (= c!108858 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!130701 c!108857) b!1101738))

(assert (= (and d!130701 (not c!108857)) b!1101735))

(assert (= (and b!1101735 c!108861) b!1101746))

(assert (= (and b!1101735 (not c!108861)) b!1101737))

(assert (= (and b!1101737 c!108860) b!1101728))

(assert (= (and b!1101737 (not c!108860)) b!1101743))

(assert (= (or b!1101728 b!1101743) bm!46212))

(assert (= (or b!1101746 bm!46212) bm!46216))

(assert (= (or b!1101746 b!1101728) bm!46213))

(assert (= (or b!1101738 bm!46216) bm!46218))

(assert (= (or b!1101738 bm!46213) bm!46217))

(assert (= (and d!130701 res!735114) b!1101736))

(assert (= (and d!130701 c!108862) b!1101744))

(assert (= (and d!130701 (not c!108862)) b!1101733))

(assert (= (and d!130701 res!735117) b!1101742))

(assert (= (and b!1101742 res!735118) b!1101729))

(assert (= (and b!1101742 (not res!735116)) b!1101731))

(assert (= (and b!1101731 res!735119) b!1101740))

(assert (= (and b!1101742 res!735121) b!1101748))

(assert (= (and b!1101748 c!108858) b!1101745))

(assert (= (and b!1101748 (not c!108858)) b!1101741))

(assert (= (and b!1101745 res!735115) b!1101732))

(assert (= (or b!1101745 b!1101741) bm!46215))

(assert (= (and b!1101748 res!735120) b!1101747))

(assert (= (and b!1101747 c!108859) b!1101730))

(assert (= (and b!1101747 (not c!108859)) b!1101739))

(assert (= (and b!1101730 res!735122) b!1101734))

(assert (= (or b!1101730 b!1101739) bm!46214))

(declare-fun b_lambda!18117 () Bool)

(assert (=> (not b_lambda!18117) (not b!1101740)))

(assert (=> b!1101740 t!34217))

(declare-fun b_and!37155 () Bool)

(assert (= b_and!37153 (and (=> t!34217 result!16623) b_and!37155)))

(assert (=> b!1101736 m!1021793))

(assert (=> b!1101736 m!1021793))

(assert (=> b!1101736 m!1021803))

(declare-fun m!1021919 () Bool)

(assert (=> bm!46215 m!1021919))

(declare-fun m!1021921 () Bool)

(assert (=> bm!46214 m!1021921))

(assert (=> b!1101740 m!1021901))

(assert (=> b!1101740 m!1021713))

(assert (=> b!1101740 m!1021903))

(assert (=> b!1101740 m!1021793))

(declare-fun m!1021923 () Bool)

(assert (=> b!1101740 m!1021923))

(assert (=> b!1101740 m!1021713))

(assert (=> b!1101740 m!1021793))

(assert (=> b!1101740 m!1021901))

(declare-fun m!1021925 () Bool)

(assert (=> b!1101744 m!1021925))

(declare-fun m!1021927 () Bool)

(assert (=> b!1101744 m!1021927))

(declare-fun m!1021929 () Bool)

(assert (=> b!1101744 m!1021929))

(declare-fun m!1021931 () Bool)

(assert (=> b!1101744 m!1021931))

(declare-fun m!1021933 () Bool)

(assert (=> b!1101744 m!1021933))

(declare-fun m!1021935 () Bool)

(assert (=> b!1101744 m!1021935))

(assert (=> b!1101744 m!1021793))

(assert (=> b!1101744 m!1021925))

(assert (=> b!1101744 m!1021929))

(declare-fun m!1021937 () Bool)

(assert (=> b!1101744 m!1021937))

(assert (=> b!1101744 m!1021937))

(declare-fun m!1021939 () Bool)

(assert (=> b!1101744 m!1021939))

(declare-fun m!1021941 () Bool)

(assert (=> b!1101744 m!1021941))

(declare-fun m!1021943 () Bool)

(assert (=> b!1101744 m!1021943))

(declare-fun m!1021945 () Bool)

(assert (=> b!1101744 m!1021945))

(assert (=> b!1101744 m!1021943))

(declare-fun m!1021947 () Bool)

(assert (=> b!1101744 m!1021947))

(declare-fun m!1021949 () Bool)

(assert (=> b!1101744 m!1021949))

(declare-fun m!1021951 () Bool)

(assert (=> b!1101744 m!1021951))

(declare-fun m!1021953 () Bool)

(assert (=> b!1101744 m!1021953))

(assert (=> b!1101744 m!1021721))

(declare-fun m!1021955 () Bool)

(assert (=> bm!46217 m!1021955))

(assert (=> d!130701 m!1021737))

(assert (=> bm!46218 m!1021721))

(assert (=> b!1101731 m!1021793))

(assert (=> b!1101731 m!1021793))

(declare-fun m!1021957 () Bool)

(assert (=> b!1101731 m!1021957))

(declare-fun m!1021959 () Bool)

(assert (=> b!1101734 m!1021959))

(assert (=> b!1101729 m!1021793))

(assert (=> b!1101729 m!1021793))

(assert (=> b!1101729 m!1021803))

(declare-fun m!1021961 () Bool)

(assert (=> b!1101738 m!1021961))

(declare-fun m!1021963 () Bool)

(assert (=> b!1101732 m!1021963))

(assert (=> b!1101527 d!130701))

(declare-fun d!130703 () Bool)

(declare-fun lt!494048 () ListLongMap!15351)

(assert (=> d!130703 (not (contains!6404 lt!494048 k0!904))))

(declare-fun removeStrictlySorted!86 (List!23997 (_ BitVec 64)) List!23997)

(assert (=> d!130703 (= lt!494048 (ListLongMap!15352 (removeStrictlySorted!86 (toList!7691 lt!493874) k0!904)))))

(assert (=> d!130703 (= (-!974 lt!493874 k0!904) lt!494048)))

(declare-fun bs!32328 () Bool)

(assert (= bs!32328 d!130703))

(declare-fun m!1021965 () Bool)

(assert (=> bs!32328 m!1021965))

(declare-fun m!1021967 () Bool)

(assert (=> bs!32328 m!1021967))

(assert (=> b!1101527 d!130703))

(declare-fun b!1101749 () Bool)

(declare-fun e!628863 () ListLongMap!15351)

(assert (=> b!1101749 (= e!628863 (ListLongMap!15352 Nil!23994))))

(declare-fun b!1101750 () Bool)

(declare-fun e!628859 () Bool)

(declare-fun lt!494049 () ListLongMap!15351)

(assert (=> b!1101750 (= e!628859 (isEmpty!970 lt!494049))))

(declare-fun b!1101751 () Bool)

(declare-fun lt!494055 () Unit!36198)

(declare-fun lt!494052 () Unit!36198)

(assert (=> b!1101751 (= lt!494055 lt!494052)))

(declare-fun lt!494054 () (_ BitVec 64))

(declare-fun lt!494051 () (_ BitVec 64))

(declare-fun lt!494053 () ListLongMap!15351)

(declare-fun lt!494050 () V!41427)

(assert (=> b!1101751 (not (contains!6404 (+!3396 lt!494053 (tuple2!17383 lt!494054 lt!494050)) lt!494051))))

(assert (=> b!1101751 (= lt!494052 (addStillNotContains!280 lt!494053 lt!494054 lt!494050 lt!494051))))

(assert (=> b!1101751 (= lt!494051 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101751 (= lt!494050 (get!17656 (select (arr!34349 _values!874) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101751 (= lt!494054 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!46222 () ListLongMap!15351)

(assert (=> b!1101751 (= lt!494053 call!46222)))

(declare-fun e!628861 () ListLongMap!15351)

(assert (=> b!1101751 (= e!628861 (+!3396 call!46222 (tuple2!17383 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000) (get!17656 (select (arr!34349 _values!874) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1101752 () Bool)

(assert (=> b!1101752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(assert (=> b!1101752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34885 _values!874)))))

(declare-fun e!628864 () Bool)

(assert (=> b!1101752 (= e!628864 (= (apply!952 lt!494049 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)) (get!17656 (select (arr!34349 _values!874) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101753 () Bool)

(declare-fun e!628860 () Bool)

(declare-fun e!628862 () Bool)

(assert (=> b!1101753 (= e!628860 e!628862)))

(declare-fun c!108866 () Bool)

(declare-fun e!628865 () Bool)

(assert (=> b!1101753 (= c!108866 e!628865)))

(declare-fun res!735123 () Bool)

(assert (=> b!1101753 (=> (not res!735123) (not e!628865))))

(assert (=> b!1101753 (= res!735123 (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(declare-fun bm!46219 () Bool)

(assert (=> bm!46219 (= call!46222 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101754 () Bool)

(assert (=> b!1101754 (= e!628863 e!628861)))

(declare-fun c!108865 () Bool)

(assert (=> b!1101754 (= c!108865 (validKeyInArray!0 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101756 () Bool)

(declare-fun res!735126 () Bool)

(assert (=> b!1101756 (=> (not res!735126) (not e!628860))))

(assert (=> b!1101756 (= res!735126 (not (contains!6404 lt!494049 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101757 () Bool)

(assert (=> b!1101757 (= e!628865 (validKeyInArray!0 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101757 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101758 () Bool)

(assert (=> b!1101758 (= e!628859 (= lt!494049 (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101759 () Bool)

(assert (=> b!1101759 (= e!628862 e!628859)))

(declare-fun c!108863 () Bool)

(assert (=> b!1101759 (= c!108863 (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(declare-fun b!1101760 () Bool)

(assert (=> b!1101760 (= e!628861 call!46222)))

(declare-fun d!130705 () Bool)

(assert (=> d!130705 e!628860))

(declare-fun res!735124 () Bool)

(assert (=> d!130705 (=> (not res!735124) (not e!628860))))

(assert (=> d!130705 (= res!735124 (not (contains!6404 lt!494049 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130705 (= lt!494049 e!628863)))

(declare-fun c!108864 () Bool)

(assert (=> d!130705 (= c!108864 (bvsge #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(assert (=> d!130705 (validMask!0 mask!1414)))

(assert (=> d!130705 (= (getCurrentListMapNoExtraKeys!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494049)))

(declare-fun b!1101755 () Bool)

(assert (=> b!1101755 (= e!628862 e!628864)))

(assert (=> b!1101755 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(declare-fun res!735125 () Bool)

(assert (=> b!1101755 (= res!735125 (contains!6404 lt!494049 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101755 (=> (not res!735125) (not e!628864))))

(assert (= (and d!130705 c!108864) b!1101749))

(assert (= (and d!130705 (not c!108864)) b!1101754))

(assert (= (and b!1101754 c!108865) b!1101751))

(assert (= (and b!1101754 (not c!108865)) b!1101760))

(assert (= (or b!1101751 b!1101760) bm!46219))

(assert (= (and d!130705 res!735124) b!1101756))

(assert (= (and b!1101756 res!735126) b!1101753))

(assert (= (and b!1101753 res!735123) b!1101757))

(assert (= (and b!1101753 c!108866) b!1101755))

(assert (= (and b!1101753 (not c!108866)) b!1101759))

(assert (= (and b!1101755 res!735125) b!1101752))

(assert (= (and b!1101759 c!108863) b!1101758))

(assert (= (and b!1101759 (not c!108863)) b!1101750))

(declare-fun b_lambda!18119 () Bool)

(assert (=> (not b_lambda!18119) (not b!1101751)))

(assert (=> b!1101751 t!34217))

(declare-fun b_and!37157 () Bool)

(assert (= b_and!37155 (and (=> t!34217 result!16623) b_and!37157)))

(declare-fun b_lambda!18121 () Bool)

(assert (=> (not b_lambda!18121) (not b!1101752)))

(assert (=> b!1101752 t!34217))

(declare-fun b_and!37159 () Bool)

(assert (= b_and!37157 (and (=> t!34217 result!16623) b_and!37159)))

(assert (=> b!1101755 m!1021833))

(assert (=> b!1101755 m!1021833))

(declare-fun m!1021969 () Bool)

(assert (=> b!1101755 m!1021969))

(declare-fun m!1021971 () Bool)

(assert (=> d!130705 m!1021971))

(assert (=> d!130705 m!1021737))

(declare-fun m!1021973 () Bool)

(assert (=> bm!46219 m!1021973))

(assert (=> b!1101754 m!1021833))

(assert (=> b!1101754 m!1021833))

(assert (=> b!1101754 m!1021837))

(assert (=> b!1101752 m!1021833))

(assert (=> b!1101752 m!1021843))

(assert (=> b!1101752 m!1021713))

(assert (=> b!1101752 m!1021845))

(assert (=> b!1101752 m!1021713))

(assert (=> b!1101752 m!1021843))

(assert (=> b!1101752 m!1021833))

(declare-fun m!1021975 () Bool)

(assert (=> b!1101752 m!1021975))

(declare-fun m!1021977 () Bool)

(assert (=> b!1101750 m!1021977))

(declare-fun m!1021979 () Bool)

(assert (=> b!1101756 m!1021979))

(assert (=> b!1101751 m!1021843))

(assert (=> b!1101751 m!1021713))

(assert (=> b!1101751 m!1021845))

(declare-fun m!1021981 () Bool)

(assert (=> b!1101751 m!1021981))

(assert (=> b!1101751 m!1021713))

(assert (=> b!1101751 m!1021843))

(declare-fun m!1021983 () Bool)

(assert (=> b!1101751 m!1021983))

(declare-fun m!1021985 () Bool)

(assert (=> b!1101751 m!1021985))

(assert (=> b!1101751 m!1021833))

(assert (=> b!1101751 m!1021983))

(declare-fun m!1021987 () Bool)

(assert (=> b!1101751 m!1021987))

(assert (=> b!1101757 m!1021833))

(assert (=> b!1101757 m!1021833))

(assert (=> b!1101757 m!1021837))

(assert (=> b!1101758 m!1021973))

(assert (=> b!1101527 d!130705))

(declare-fun d!130707 () Bool)

(assert (=> d!130707 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494058 () Unit!36198)

(declare-fun choose!13 (array!71371 (_ BitVec 64) (_ BitVec 32)) Unit!36198)

(assert (=> d!130707 (= lt!494058 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130707 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130707 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!494058)))

(declare-fun bs!32329 () Bool)

(assert (= bs!32329 d!130707))

(assert (=> bs!32329 m!1021717))

(declare-fun m!1021989 () Bool)

(assert (=> bs!32329 m!1021989))

(assert (=> b!1101527 d!130707))

(declare-fun b!1101761 () Bool)

(declare-fun e!628866 () Bool)

(declare-fun e!628867 () Bool)

(assert (=> b!1101761 (= e!628866 e!628867)))

(declare-fun lt!494060 () (_ BitVec 64))

(assert (=> b!1101761 (= lt!494060 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494059 () Unit!36198)

(assert (=> b!1101761 (= lt!494059 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!494060 #b00000000000000000000000000000000))))

(assert (=> b!1101761 (arrayContainsKey!0 _keys!1070 lt!494060 #b00000000000000000000000000000000)))

(declare-fun lt!494061 () Unit!36198)

(assert (=> b!1101761 (= lt!494061 lt!494059)))

(declare-fun res!735128 () Bool)

(assert (=> b!1101761 (= res!735128 (= (seekEntryOrOpen!0 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9915 #b00000000000000000000000000000000)))))

(assert (=> b!1101761 (=> (not res!735128) (not e!628867))))

(declare-fun b!1101762 () Bool)

(declare-fun call!46223 () Bool)

(assert (=> b!1101762 (= e!628867 call!46223)))

(declare-fun bm!46220 () Bool)

(assert (=> bm!46220 (= call!46223 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1101763 () Bool)

(assert (=> b!1101763 (= e!628866 call!46223)))

(declare-fun b!1101764 () Bool)

(declare-fun e!628868 () Bool)

(assert (=> b!1101764 (= e!628868 e!628866)))

(declare-fun c!108867 () Bool)

(assert (=> b!1101764 (= c!108867 (validKeyInArray!0 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130709 () Bool)

(declare-fun res!735127 () Bool)

(assert (=> d!130709 (=> res!735127 e!628868)))

(assert (=> d!130709 (= res!735127 (bvsge #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(assert (=> d!130709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628868)))

(assert (= (and d!130709 (not res!735127)) b!1101764))

(assert (= (and b!1101764 c!108867) b!1101761))

(assert (= (and b!1101764 (not c!108867)) b!1101763))

(assert (= (and b!1101761 res!735128) b!1101762))

(assert (= (or b!1101762 b!1101763) bm!46220))

(assert (=> b!1101761 m!1021833))

(declare-fun m!1021991 () Bool)

(assert (=> b!1101761 m!1021991))

(declare-fun m!1021993 () Bool)

(assert (=> b!1101761 m!1021993))

(assert (=> b!1101761 m!1021833))

(declare-fun m!1021995 () Bool)

(assert (=> b!1101761 m!1021995))

(declare-fun m!1021997 () Bool)

(assert (=> bm!46220 m!1021997))

(assert (=> b!1101764 m!1021833))

(assert (=> b!1101764 m!1021833))

(assert (=> b!1101764 m!1021837))

(assert (=> b!1101517 d!130709))

(declare-fun b!1101765 () Bool)

(declare-fun e!628872 () Bool)

(declare-fun e!628869 () Bool)

(assert (=> b!1101765 (= e!628872 e!628869)))

(declare-fun res!735131 () Bool)

(assert (=> b!1101765 (=> (not res!735131) (not e!628869))))

(declare-fun e!628871 () Bool)

(assert (=> b!1101765 (= res!735131 (not e!628871))))

(declare-fun res!735129 () Bool)

(assert (=> b!1101765 (=> (not res!735129) (not e!628871))))

(assert (=> b!1101765 (= res!735129 (validKeyInArray!0 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101766 () Bool)

(declare-fun e!628870 () Bool)

(declare-fun call!46224 () Bool)

(assert (=> b!1101766 (= e!628870 call!46224)))

(declare-fun b!1101767 () Bool)

(assert (=> b!1101767 (= e!628870 call!46224)))

(declare-fun bm!46221 () Bool)

(declare-fun c!108868 () Bool)

(assert (=> bm!46221 (= call!46224 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108868 (Cons!23994 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000) Nil!23995) Nil!23995)))))

(declare-fun d!130711 () Bool)

(declare-fun res!735130 () Bool)

(assert (=> d!130711 (=> res!735130 e!628872)))

(assert (=> d!130711 (= res!735130 (bvsge #b00000000000000000000000000000000 (size!34884 _keys!1070)))))

(assert (=> d!130711 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23995) e!628872)))

(declare-fun b!1101768 () Bool)

(assert (=> b!1101768 (= e!628869 e!628870)))

(assert (=> b!1101768 (= c!108868 (validKeyInArray!0 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101769 () Bool)

(assert (=> b!1101769 (= e!628871 (contains!6406 Nil!23995 (select (arr!34348 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130711 (not res!735130)) b!1101765))

(assert (= (and b!1101765 res!735129) b!1101769))

(assert (= (and b!1101765 res!735131) b!1101768))

(assert (= (and b!1101768 c!108868) b!1101766))

(assert (= (and b!1101768 (not c!108868)) b!1101767))

(assert (= (or b!1101766 b!1101767) bm!46221))

(assert (=> b!1101765 m!1021833))

(assert (=> b!1101765 m!1021833))

(assert (=> b!1101765 m!1021837))

(assert (=> bm!46221 m!1021833))

(declare-fun m!1021999 () Bool)

(assert (=> bm!46221 m!1021999))

(assert (=> b!1101768 m!1021833))

(assert (=> b!1101768 m!1021833))

(assert (=> b!1101768 m!1021837))

(assert (=> b!1101769 m!1021833))

(assert (=> b!1101769 m!1021833))

(declare-fun m!1022001 () Bool)

(assert (=> b!1101769 m!1022001))

(assert (=> b!1101526 d!130711))

(declare-fun d!130713 () Bool)

(declare-fun e!628873 () Bool)

(assert (=> d!130713 e!628873))

(declare-fun res!735133 () Bool)

(assert (=> d!130713 (=> (not res!735133) (not e!628873))))

(declare-fun lt!494064 () ListLongMap!15351)

(assert (=> d!130713 (= res!735133 (contains!6404 lt!494064 (_1!8702 lt!493877)))))

(declare-fun lt!494065 () List!23997)

(assert (=> d!130713 (= lt!494064 (ListLongMap!15352 lt!494065))))

(declare-fun lt!494062 () Unit!36198)

(declare-fun lt!494063 () Unit!36198)

(assert (=> d!130713 (= lt!494062 lt!494063)))

(assert (=> d!130713 (= (getValueByKey!627 lt!494065 (_1!8702 lt!493877)) (Some!677 (_2!8702 lt!493877)))))

(assert (=> d!130713 (= lt!494063 (lemmaContainsTupThenGetReturnValue!304 lt!494065 (_1!8702 lt!493877) (_2!8702 lt!493877)))))

(assert (=> d!130713 (= lt!494065 (insertStrictlySorted!397 (toList!7691 lt!493876) (_1!8702 lt!493877) (_2!8702 lt!493877)))))

(assert (=> d!130713 (= (+!3396 lt!493876 lt!493877) lt!494064)))

(declare-fun b!1101770 () Bool)

(declare-fun res!735132 () Bool)

(assert (=> b!1101770 (=> (not res!735132) (not e!628873))))

(assert (=> b!1101770 (= res!735132 (= (getValueByKey!627 (toList!7691 lt!494064) (_1!8702 lt!493877)) (Some!677 (_2!8702 lt!493877))))))

(declare-fun b!1101771 () Bool)

(assert (=> b!1101771 (= e!628873 (contains!6405 (toList!7691 lt!494064) lt!493877))))

(assert (= (and d!130713 res!735133) b!1101770))

(assert (= (and b!1101770 res!735132) b!1101771))

(declare-fun m!1022003 () Bool)

(assert (=> d!130713 m!1022003))

(declare-fun m!1022005 () Bool)

(assert (=> d!130713 m!1022005))

(declare-fun m!1022007 () Bool)

(assert (=> d!130713 m!1022007))

(declare-fun m!1022009 () Bool)

(assert (=> d!130713 m!1022009))

(declare-fun m!1022011 () Bool)

(assert (=> b!1101770 m!1022011))

(declare-fun m!1022013 () Bool)

(assert (=> b!1101771 m!1022013))

(assert (=> b!1101516 d!130713))

(declare-fun mapNonEmpty!42631 () Bool)

(declare-fun mapRes!42631 () Bool)

(declare-fun tp!81488 () Bool)

(declare-fun e!628878 () Bool)

(assert (=> mapNonEmpty!42631 (= mapRes!42631 (and tp!81488 e!628878))))

(declare-fun mapValue!42631 () ValueCell!12903)

(declare-fun mapKey!42631 () (_ BitVec 32))

(declare-fun mapRest!42631 () (Array (_ BitVec 32) ValueCell!12903))

(assert (=> mapNonEmpty!42631 (= mapRest!42625 (store mapRest!42631 mapKey!42631 mapValue!42631))))

(declare-fun condMapEmpty!42631 () Bool)

(declare-fun mapDefault!42631 () ValueCell!12903)

(assert (=> mapNonEmpty!42625 (= condMapEmpty!42631 (= mapRest!42625 ((as const (Array (_ BitVec 32) ValueCell!12903)) mapDefault!42631)))))

(declare-fun e!628879 () Bool)

(assert (=> mapNonEmpty!42625 (= tp!81478 (and e!628879 mapRes!42631))))

(declare-fun mapIsEmpty!42631 () Bool)

(assert (=> mapIsEmpty!42631 mapRes!42631))

(declare-fun b!1101778 () Bool)

(assert (=> b!1101778 (= e!628878 tp_is_empty!27225)))

(declare-fun b!1101779 () Bool)

(assert (=> b!1101779 (= e!628879 tp_is_empty!27225)))

(assert (= (and mapNonEmpty!42625 condMapEmpty!42631) mapIsEmpty!42631))

(assert (= (and mapNonEmpty!42625 (not condMapEmpty!42631)) mapNonEmpty!42631))

(assert (= (and mapNonEmpty!42631 ((_ is ValueCellFull!12903) mapValue!42631)) b!1101778))

(assert (= (and mapNonEmpty!42625 ((_ is ValueCellFull!12903) mapDefault!42631)) b!1101779))

(declare-fun m!1022015 () Bool)

(assert (=> mapNonEmpty!42631 m!1022015))

(declare-fun b_lambda!18123 () Bool)

(assert (= b_lambda!18113 (or (and start!96832 b_free!23175) b_lambda!18123)))

(declare-fun b_lambda!18125 () Bool)

(assert (= b_lambda!18117 (or (and start!96832 b_free!23175) b_lambda!18125)))

(declare-fun b_lambda!18127 () Bool)

(assert (= b_lambda!18121 (or (and start!96832 b_free!23175) b_lambda!18127)))

(declare-fun b_lambda!18129 () Bool)

(assert (= b_lambda!18109 (or (and start!96832 b_free!23175) b_lambda!18129)))

(declare-fun b_lambda!18131 () Bool)

(assert (= b_lambda!18115 (or (and start!96832 b_free!23175) b_lambda!18131)))

(declare-fun b_lambda!18133 () Bool)

(assert (= b_lambda!18119 (or (and start!96832 b_free!23175) b_lambda!18133)))

(declare-fun b_lambda!18135 () Bool)

(assert (= b_lambda!18111 (or (and start!96832 b_free!23175) b_lambda!18135)))

(check-sat (not b_lambda!18129) (not b!1101596) (not d!130705) (not b!1101770) (not b!1101736) (not b!1101724) (not d!130701) tp_is_empty!27225 (not b!1101752) (not b!1101738) (not b!1101771) (not bm!46207) (not bm!46221) (not b!1101731) (not b!1101758) b_and!37159 (not b!1101607) (not b!1101587) (not bm!46181) (not bm!46214) (not d!130707) (not b!1101672) (not b!1101663) (not b!1101757) (not bm!46208) (not b!1101610) (not d!130679) (not d!130703) (not b!1101751) (not b!1101723) (not b!1101590) (not bm!46217) (not b!1101732) (not b!1101740) (not b!1101764) (not b!1101722) (not b_next!23175) (not b!1101754) (not b!1101765) (not b!1101768) (not b_lambda!18123) (not b!1101761) (not bm!46201) (not b!1101755) (not b!1101717) (not b!1101719) (not d!130713) (not b_lambda!18135) (not d!130699) (not b!1101725) (not bm!46215) (not mapNonEmpty!42631) (not b!1101729) (not b!1101750) (not b!1101619) (not b!1101734) (not b!1101744) (not bm!46219) (not b!1101678) (not bm!46218) (not bm!46220) (not b!1101674) (not b_lambda!18125) (not b_lambda!18127) (not bm!46199) (not bm!46202) (not b!1101665) (not d!130697) (not b!1101668) (not bm!46178) (not bm!46211) (not b!1101670) (not bm!46198) (not b!1101595) (not b!1101690) (not b!1101721) (not b_lambda!18133) (not b!1101611) (not b!1101756) (not b!1101666) (not b_lambda!18107) (not d!130691) (not b!1101718) (not d!130695) (not b_lambda!18131) (not b!1101769) (not b!1101613) (not b!1101612))
(check-sat b_and!37159 (not b_next!23175))
