; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96792 () Bool)

(assert start!96792)

(declare-fun b_free!23167 () Bool)

(declare-fun b_next!23167 () Bool)

(assert (=> start!96792 (= b_free!23167 (not b_next!23167))))

(declare-fun tp!81451 () Bool)

(declare-fun b_and!37083 () Bool)

(assert (=> start!96792 (= tp!81451 b_and!37083)))

(declare-fun b!1100980 () Bool)

(declare-fun e!628404 () Bool)

(declare-fun tp_is_empty!27217 () Bool)

(assert (=> b!1100980 (= e!628404 tp_is_empty!27217)))

(declare-fun b!1100981 () Bool)

(declare-fun e!628403 () Bool)

(assert (=> b!1100981 (= e!628403 tp_is_empty!27217)))

(declare-fun b!1100982 () Bool)

(declare-datatypes ((V!41417 0))(
  ( (V!41418 (val!13665 Int)) )
))
(declare-datatypes ((tuple2!17438 0))(
  ( (tuple2!17439 (_1!8730 (_ BitVec 64)) (_2!8730 V!41417)) )
))
(declare-datatypes ((List!24027 0))(
  ( (Nil!24024) (Cons!24023 (h!25232 tuple2!17438) (t!34231 List!24027)) )
))
(declare-datatypes ((ListLongMap!15407 0))(
  ( (ListLongMap!15408 (toList!7719 List!24027)) )
))
(declare-fun lt!493395 () ListLongMap!15407)

(declare-fun e!628398 () Bool)

(declare-fun lt!493399 () tuple2!17438)

(declare-fun lt!493394 () ListLongMap!15407)

(declare-fun +!3429 (ListLongMap!15407 tuple2!17438) ListLongMap!15407)

(assert (=> b!1100982 (= e!628398 (= lt!493395 (+!3429 lt!493394 lt!493399)))))

(declare-fun e!628397 () Bool)

(declare-fun lt!493397 () ListLongMap!15407)

(declare-fun lt!493393 () ListLongMap!15407)

(declare-fun b!1100983 () Bool)

(assert (=> b!1100983 (= e!628397 (= lt!493397 (+!3429 lt!493393 lt!493399)))))

(assert (=> b!1100983 e!628398))

(declare-fun res!734705 () Bool)

(assert (=> b!1100983 (=> (not res!734705) (not e!628398))))

(declare-fun lt!493401 () ListLongMap!15407)

(assert (=> b!1100983 (= res!734705 (= lt!493395 (+!3429 lt!493401 lt!493399)))))

(declare-fun minValue!831 () V!41417)

(assert (=> b!1100983 (= lt!493399 (tuple2!17439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1100984 () Bool)

(declare-fun res!734700 () Bool)

(declare-fun e!628401 () Bool)

(assert (=> b!1100984 (=> (not res!734700) (not e!628401))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71258 0))(
  ( (array!71259 (arr!34293 (Array (_ BitVec 32) (_ BitVec 64))) (size!34831 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71258)

(assert (=> b!1100984 (= res!734700 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34831 _keys!1070))))))

(declare-fun res!734699 () Bool)

(assert (=> start!96792 (=> (not res!734699) (not e!628401))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96792 (= res!734699 (validMask!0 mask!1414))))

(assert (=> start!96792 e!628401))

(assert (=> start!96792 tp!81451))

(assert (=> start!96792 true))

(assert (=> start!96792 tp_is_empty!27217))

(declare-fun array_inv!26444 (array!71258) Bool)

(assert (=> start!96792 (array_inv!26444 _keys!1070)))

(declare-datatypes ((ValueCell!12899 0))(
  ( (ValueCellFull!12899 (v!16293 V!41417)) (EmptyCell!12899) )
))
(declare-datatypes ((array!71260 0))(
  ( (array!71261 (arr!34294 (Array (_ BitVec 32) ValueCell!12899)) (size!34832 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71260)

(declare-fun e!628399 () Bool)

(declare-fun array_inv!26445 (array!71260) Bool)

(assert (=> start!96792 (and (array_inv!26445 _values!874) e!628399)))

(declare-fun b!1100985 () Bool)

(declare-fun res!734703 () Bool)

(assert (=> b!1100985 (=> (not res!734703) (not e!628401))))

(declare-datatypes ((List!24028 0))(
  ( (Nil!24025) (Cons!24024 (h!25233 (_ BitVec 64)) (t!34232 List!24028)) )
))
(declare-fun arrayNoDuplicates!0 (array!71258 (_ BitVec 32) List!24028) Bool)

(assert (=> b!1100985 (= res!734703 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24025))))

(declare-fun mapNonEmpty!42610 () Bool)

(declare-fun mapRes!42610 () Bool)

(declare-fun tp!81452 () Bool)

(assert (=> mapNonEmpty!42610 (= mapRes!42610 (and tp!81452 e!628403))))

(declare-fun mapRest!42610 () (Array (_ BitVec 32) ValueCell!12899))

(declare-fun mapKey!42610 () (_ BitVec 32))

(declare-fun mapValue!42610 () ValueCell!12899)

(assert (=> mapNonEmpty!42610 (= (arr!34294 _values!874) (store mapRest!42610 mapKey!42610 mapValue!42610))))

(declare-fun b!1100986 () Bool)

(declare-fun res!734704 () Bool)

(assert (=> b!1100986 (=> (not res!734704) (not e!628401))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1100986 (= res!734704 (= (select (arr!34293 _keys!1070) i!650) k0!904))))

(declare-fun b!1100987 () Bool)

(declare-fun e!628402 () Bool)

(assert (=> b!1100987 (= e!628401 e!628402)))

(declare-fun res!734698 () Bool)

(assert (=> b!1100987 (=> (not res!734698) (not e!628402))))

(declare-fun lt!493400 () array!71258)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71258 (_ BitVec 32)) Bool)

(assert (=> b!1100987 (= res!734698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493400 mask!1414))))

(assert (=> b!1100987 (= lt!493400 (array!71259 (store (arr!34293 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34831 _keys!1070)))))

(declare-fun b!1100988 () Bool)

(declare-fun res!734707 () Bool)

(assert (=> b!1100988 (=> (not res!734707) (not e!628401))))

(assert (=> b!1100988 (= res!734707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100989 () Bool)

(declare-fun res!734706 () Bool)

(assert (=> b!1100989 (=> (not res!734706) (not e!628401))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100989 (= res!734706 (and (= (size!34832 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34831 _keys!1070) (size!34832 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100990 () Bool)

(declare-fun res!734708 () Bool)

(assert (=> b!1100990 (=> (not res!734708) (not e!628401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100990 (= res!734708 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42610 () Bool)

(assert (=> mapIsEmpty!42610 mapRes!42610))

(declare-fun b!1100991 () Bool)

(declare-fun res!734702 () Bool)

(assert (=> b!1100991 (=> (not res!734702) (not e!628402))))

(assert (=> b!1100991 (= res!734702 (arrayNoDuplicates!0 lt!493400 #b00000000000000000000000000000000 Nil!24025))))

(declare-fun b!1100992 () Bool)

(assert (=> b!1100992 (= e!628402 (not e!628397))))

(declare-fun res!734701 () Bool)

(assert (=> b!1100992 (=> res!734701 e!628397)))

(assert (=> b!1100992 (= res!734701 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41417)

(declare-fun getCurrentListMap!4334 (array!71258 array!71260 (_ BitVec 32) (_ BitVec 32) V!41417 V!41417 (_ BitVec 32) Int) ListLongMap!15407)

(assert (=> b!1100992 (= lt!493397 (getCurrentListMap!4334 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493392 () array!71260)

(assert (=> b!1100992 (= lt!493395 (getCurrentListMap!4334 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1100992 (and (= lt!493401 lt!493394) (= lt!493394 lt!493401))))

(declare-fun -!949 (ListLongMap!15407 (_ BitVec 64)) ListLongMap!15407)

(assert (=> b!1100992 (= lt!493394 (-!949 lt!493393 k0!904))))

(declare-datatypes ((Unit!36021 0))(
  ( (Unit!36022) )
))
(declare-fun lt!493398 () Unit!36021)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!223 (array!71258 array!71260 (_ BitVec 32) (_ BitVec 32) V!41417 V!41417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36021)

(assert (=> b!1100992 (= lt!493398 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!223 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4241 (array!71258 array!71260 (_ BitVec 32) (_ BitVec 32) V!41417 V!41417 (_ BitVec 32) Int) ListLongMap!15407)

(assert (=> b!1100992 (= lt!493401 (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2310 (Int (_ BitVec 64)) V!41417)

(assert (=> b!1100992 (= lt!493392 (array!71261 (store (arr!34294 _values!874) i!650 (ValueCellFull!12899 (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34832 _values!874)))))

(assert (=> b!1100992 (= lt!493393 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100992 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493396 () Unit!36021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71258 (_ BitVec 64) (_ BitVec 32)) Unit!36021)

(assert (=> b!1100992 (= lt!493396 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100993 () Bool)

(assert (=> b!1100993 (= e!628399 (and e!628404 mapRes!42610))))

(declare-fun condMapEmpty!42610 () Bool)

(declare-fun mapDefault!42610 () ValueCell!12899)

(assert (=> b!1100993 (= condMapEmpty!42610 (= (arr!34294 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12899)) mapDefault!42610)))))

(assert (= (and start!96792 res!734699) b!1100989))

(assert (= (and b!1100989 res!734706) b!1100988))

(assert (= (and b!1100988 res!734707) b!1100985))

(assert (= (and b!1100985 res!734703) b!1100984))

(assert (= (and b!1100984 res!734700) b!1100990))

(assert (= (and b!1100990 res!734708) b!1100986))

(assert (= (and b!1100986 res!734704) b!1100987))

(assert (= (and b!1100987 res!734698) b!1100991))

(assert (= (and b!1100991 res!734702) b!1100992))

(assert (= (and b!1100992 (not res!734701)) b!1100983))

(assert (= (and b!1100983 res!734705) b!1100982))

(assert (= (and b!1100993 condMapEmpty!42610) mapIsEmpty!42610))

(assert (= (and b!1100993 (not condMapEmpty!42610)) mapNonEmpty!42610))

(get-info :version)

(assert (= (and mapNonEmpty!42610 ((_ is ValueCellFull!12899) mapValue!42610)) b!1100981))

(assert (= (and b!1100993 ((_ is ValueCellFull!12899) mapDefault!42610)) b!1100980))

(assert (= start!96792 b!1100993))

(declare-fun b_lambda!18043 () Bool)

(assert (=> (not b_lambda!18043) (not b!1100992)))

(declare-fun t!34230 () Bool)

(declare-fun tb!8025 () Bool)

(assert (=> (and start!96792 (= defaultEntry!882 defaultEntry!882) t!34230) tb!8025))

(declare-fun result!16597 () Bool)

(assert (=> tb!8025 (= result!16597 tp_is_empty!27217)))

(assert (=> b!1100992 t!34230))

(declare-fun b_and!37085 () Bool)

(assert (= b_and!37083 (and (=> t!34230 result!16597) b_and!37085)))

(declare-fun m!1020655 () Bool)

(assert (=> b!1100986 m!1020655))

(declare-fun m!1020657 () Bool)

(assert (=> b!1100991 m!1020657))

(declare-fun m!1020659 () Bool)

(assert (=> b!1100987 m!1020659))

(declare-fun m!1020661 () Bool)

(assert (=> b!1100987 m!1020661))

(declare-fun m!1020663 () Bool)

(assert (=> b!1100988 m!1020663))

(declare-fun m!1020665 () Bool)

(assert (=> start!96792 m!1020665))

(declare-fun m!1020667 () Bool)

(assert (=> start!96792 m!1020667))

(declare-fun m!1020669 () Bool)

(assert (=> start!96792 m!1020669))

(declare-fun m!1020671 () Bool)

(assert (=> b!1100985 m!1020671))

(declare-fun m!1020673 () Bool)

(assert (=> b!1100992 m!1020673))

(declare-fun m!1020675 () Bool)

(assert (=> b!1100992 m!1020675))

(declare-fun m!1020677 () Bool)

(assert (=> b!1100992 m!1020677))

(declare-fun m!1020679 () Bool)

(assert (=> b!1100992 m!1020679))

(declare-fun m!1020681 () Bool)

(assert (=> b!1100992 m!1020681))

(declare-fun m!1020683 () Bool)

(assert (=> b!1100992 m!1020683))

(declare-fun m!1020685 () Bool)

(assert (=> b!1100992 m!1020685))

(declare-fun m!1020687 () Bool)

(assert (=> b!1100992 m!1020687))

(declare-fun m!1020689 () Bool)

(assert (=> b!1100992 m!1020689))

(declare-fun m!1020691 () Bool)

(assert (=> b!1100992 m!1020691))

(declare-fun m!1020693 () Bool)

(assert (=> b!1100990 m!1020693))

(declare-fun m!1020695 () Bool)

(assert (=> b!1100983 m!1020695))

(declare-fun m!1020697 () Bool)

(assert (=> b!1100983 m!1020697))

(declare-fun m!1020699 () Bool)

(assert (=> mapNonEmpty!42610 m!1020699))

(declare-fun m!1020701 () Bool)

(assert (=> b!1100982 m!1020701))

(check-sat (not b!1100991) (not b!1100990) (not b!1100983) (not b!1100987) (not b_lambda!18043) (not b_next!23167) b_and!37085 (not b!1100985) (not b!1100982) (not mapNonEmpty!42610) tp_is_empty!27217 (not b!1100988) (not start!96792) (not b!1100992))
(check-sat b_and!37085 (not b_next!23167))
(get-model)

(declare-fun b_lambda!18049 () Bool)

(assert (= b_lambda!18043 (or (and start!96792 b_free!23167) b_lambda!18049)))

(check-sat (not b!1100991) (not b!1100990) (not b!1100983) (not b!1100987) (not b_lambda!18049) (not b_next!23167) b_and!37085 (not b!1100985) (not b!1100982) (not mapNonEmpty!42610) tp_is_empty!27217 (not b!1100988) (not start!96792) (not b!1100992))
(check-sat b_and!37085 (not b_next!23167))
(get-model)

(declare-fun b!1101094 () Bool)

(declare-fun e!628463 () Bool)

(declare-fun call!46112 () Bool)

(assert (=> b!1101094 (= e!628463 call!46112)))

(declare-fun b!1101095 () Bool)

(declare-fun e!628462 () Bool)

(assert (=> b!1101095 (= e!628462 e!628463)))

(declare-fun c!108730 () Bool)

(assert (=> b!1101095 (= c!108730 (validKeyInArray!0 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130481 () Bool)

(declare-fun res!734782 () Bool)

(declare-fun e!628461 () Bool)

(assert (=> d!130481 (=> res!734782 e!628461)))

(assert (=> d!130481 (= res!734782 (bvsge #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130481 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24025) e!628461)))

(declare-fun b!1101096 () Bool)

(declare-fun e!628464 () Bool)

(declare-fun contains!6371 (List!24028 (_ BitVec 64)) Bool)

(assert (=> b!1101096 (= e!628464 (contains!6371 Nil!24025 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46109 () Bool)

(assert (=> bm!46109 (= call!46112 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108730 (Cons!24024 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000) Nil!24025) Nil!24025)))))

(declare-fun b!1101097 () Bool)

(assert (=> b!1101097 (= e!628463 call!46112)))

(declare-fun b!1101098 () Bool)

(assert (=> b!1101098 (= e!628461 e!628462)))

(declare-fun res!734783 () Bool)

(assert (=> b!1101098 (=> (not res!734783) (not e!628462))))

(assert (=> b!1101098 (= res!734783 (not e!628464))))

(declare-fun res!734781 () Bool)

(assert (=> b!1101098 (=> (not res!734781) (not e!628464))))

(assert (=> b!1101098 (= res!734781 (validKeyInArray!0 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130481 (not res!734782)) b!1101098))

(assert (= (and b!1101098 res!734781) b!1101096))

(assert (= (and b!1101098 res!734783) b!1101095))

(assert (= (and b!1101095 c!108730) b!1101094))

(assert (= (and b!1101095 (not c!108730)) b!1101097))

(assert (= (or b!1101094 b!1101097) bm!46109))

(declare-fun m!1020799 () Bool)

(assert (=> b!1101095 m!1020799))

(assert (=> b!1101095 m!1020799))

(declare-fun m!1020801 () Bool)

(assert (=> b!1101095 m!1020801))

(assert (=> b!1101096 m!1020799))

(assert (=> b!1101096 m!1020799))

(declare-fun m!1020803 () Bool)

(assert (=> b!1101096 m!1020803))

(assert (=> bm!46109 m!1020799))

(declare-fun m!1020805 () Bool)

(assert (=> bm!46109 m!1020805))

(assert (=> b!1101098 m!1020799))

(assert (=> b!1101098 m!1020799))

(assert (=> b!1101098 m!1020801))

(assert (=> b!1100985 d!130481))

(declare-fun d!130483 () Bool)

(assert (=> d!130483 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100990 d!130483))

(declare-fun b!1101107 () Bool)

(declare-fun e!628472 () Bool)

(declare-fun call!46115 () Bool)

(assert (=> b!1101107 (= e!628472 call!46115)))

(declare-fun d!130485 () Bool)

(declare-fun res!734789 () Bool)

(declare-fun e!628471 () Bool)

(assert (=> d!130485 (=> res!734789 e!628471)))

(assert (=> d!130485 (= res!734789 (bvsge #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(assert (=> d!130485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493400 mask!1414) e!628471)))

(declare-fun b!1101108 () Bool)

(declare-fun e!628473 () Bool)

(assert (=> b!1101108 (= e!628471 e!628473)))

(declare-fun c!108733 () Bool)

(assert (=> b!1101108 (= c!108733 (validKeyInArray!0 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(declare-fun b!1101109 () Bool)

(assert (=> b!1101109 (= e!628473 e!628472)))

(declare-fun lt!493470 () (_ BitVec 64))

(assert (=> b!1101109 (= lt!493470 (select (arr!34293 lt!493400) #b00000000000000000000000000000000))))

(declare-fun lt!493469 () Unit!36021)

(assert (=> b!1101109 (= lt!493469 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!493400 lt!493470 #b00000000000000000000000000000000))))

(assert (=> b!1101109 (arrayContainsKey!0 lt!493400 lt!493470 #b00000000000000000000000000000000)))

(declare-fun lt!493468 () Unit!36021)

(assert (=> b!1101109 (= lt!493468 lt!493469)))

(declare-fun res!734788 () Bool)

(declare-datatypes ((SeekEntryResult!9913 0))(
  ( (MissingZero!9913 (index!42023 (_ BitVec 32))) (Found!9913 (index!42024 (_ BitVec 32))) (Intermediate!9913 (undefined!10725 Bool) (index!42025 (_ BitVec 32)) (x!99040 (_ BitVec 32))) (Undefined!9913) (MissingVacant!9913 (index!42026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71258 (_ BitVec 32)) SeekEntryResult!9913)

(assert (=> b!1101109 (= res!734788 (= (seekEntryOrOpen!0 (select (arr!34293 lt!493400) #b00000000000000000000000000000000) lt!493400 mask!1414) (Found!9913 #b00000000000000000000000000000000)))))

(assert (=> b!1101109 (=> (not res!734788) (not e!628472))))

(declare-fun bm!46112 () Bool)

(assert (=> bm!46112 (= call!46115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!493400 mask!1414))))

(declare-fun b!1101110 () Bool)

(assert (=> b!1101110 (= e!628473 call!46115)))

(assert (= (and d!130485 (not res!734789)) b!1101108))

(assert (= (and b!1101108 c!108733) b!1101109))

(assert (= (and b!1101108 (not c!108733)) b!1101110))

(assert (= (and b!1101109 res!734788) b!1101107))

(assert (= (or b!1101107 b!1101110) bm!46112))

(declare-fun m!1020807 () Bool)

(assert (=> b!1101108 m!1020807))

(assert (=> b!1101108 m!1020807))

(declare-fun m!1020809 () Bool)

(assert (=> b!1101108 m!1020809))

(assert (=> b!1101109 m!1020807))

(declare-fun m!1020811 () Bool)

(assert (=> b!1101109 m!1020811))

(declare-fun m!1020813 () Bool)

(assert (=> b!1101109 m!1020813))

(assert (=> b!1101109 m!1020807))

(declare-fun m!1020815 () Bool)

(assert (=> b!1101109 m!1020815))

(declare-fun m!1020817 () Bool)

(assert (=> bm!46112 m!1020817))

(assert (=> b!1100987 d!130485))

(declare-fun b!1101111 () Bool)

(declare-fun e!628476 () Bool)

(declare-fun call!46116 () Bool)

(assert (=> b!1101111 (= e!628476 call!46116)))

(declare-fun b!1101112 () Bool)

(declare-fun e!628475 () Bool)

(assert (=> b!1101112 (= e!628475 e!628476)))

(declare-fun c!108734 () Bool)

(assert (=> b!1101112 (= c!108734 (validKeyInArray!0 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(declare-fun d!130487 () Bool)

(declare-fun res!734791 () Bool)

(declare-fun e!628474 () Bool)

(assert (=> d!130487 (=> res!734791 e!628474)))

(assert (=> d!130487 (= res!734791 (bvsge #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(assert (=> d!130487 (= (arrayNoDuplicates!0 lt!493400 #b00000000000000000000000000000000 Nil!24025) e!628474)))

(declare-fun b!1101113 () Bool)

(declare-fun e!628477 () Bool)

(assert (=> b!1101113 (= e!628477 (contains!6371 Nil!24025 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(declare-fun bm!46113 () Bool)

(assert (=> bm!46113 (= call!46116 (arrayNoDuplicates!0 lt!493400 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108734 (Cons!24024 (select (arr!34293 lt!493400) #b00000000000000000000000000000000) Nil!24025) Nil!24025)))))

(declare-fun b!1101114 () Bool)

(assert (=> b!1101114 (= e!628476 call!46116)))

(declare-fun b!1101115 () Bool)

(assert (=> b!1101115 (= e!628474 e!628475)))

(declare-fun res!734792 () Bool)

(assert (=> b!1101115 (=> (not res!734792) (not e!628475))))

(assert (=> b!1101115 (= res!734792 (not e!628477))))

(declare-fun res!734790 () Bool)

(assert (=> b!1101115 (=> (not res!734790) (not e!628477))))

(assert (=> b!1101115 (= res!734790 (validKeyInArray!0 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(assert (= (and d!130487 (not res!734791)) b!1101115))

(assert (= (and b!1101115 res!734790) b!1101113))

(assert (= (and b!1101115 res!734792) b!1101112))

(assert (= (and b!1101112 c!108734) b!1101111))

(assert (= (and b!1101112 (not c!108734)) b!1101114))

(assert (= (or b!1101111 b!1101114) bm!46113))

(assert (=> b!1101112 m!1020807))

(assert (=> b!1101112 m!1020807))

(assert (=> b!1101112 m!1020809))

(assert (=> b!1101113 m!1020807))

(assert (=> b!1101113 m!1020807))

(declare-fun m!1020819 () Bool)

(assert (=> b!1101113 m!1020819))

(assert (=> bm!46113 m!1020807))

(declare-fun m!1020821 () Bool)

(assert (=> bm!46113 m!1020821))

(assert (=> b!1101115 m!1020807))

(assert (=> b!1101115 m!1020807))

(assert (=> b!1101115 m!1020809))

(assert (=> b!1100991 d!130487))

(declare-fun d!130489 () Bool)

(declare-fun e!628480 () Bool)

(assert (=> d!130489 e!628480))

(declare-fun res!734797 () Bool)

(assert (=> d!130489 (=> (not res!734797) (not e!628480))))

(declare-fun lt!493482 () ListLongMap!15407)

(declare-fun contains!6372 (ListLongMap!15407 (_ BitVec 64)) Bool)

(assert (=> d!130489 (= res!734797 (contains!6372 lt!493482 (_1!8730 lt!493399)))))

(declare-fun lt!493481 () List!24027)

(assert (=> d!130489 (= lt!493482 (ListLongMap!15408 lt!493481))))

(declare-fun lt!493479 () Unit!36021)

(declare-fun lt!493480 () Unit!36021)

(assert (=> d!130489 (= lt!493479 lt!493480)))

(declare-datatypes ((Option!679 0))(
  ( (Some!678 (v!16296 V!41417)) (None!677) )
))
(declare-fun getValueByKey!628 (List!24027 (_ BitVec 64)) Option!679)

(assert (=> d!130489 (= (getValueByKey!628 lt!493481 (_1!8730 lt!493399)) (Some!678 (_2!8730 lt!493399)))))

(declare-fun lemmaContainsTupThenGetReturnValue!304 (List!24027 (_ BitVec 64) V!41417) Unit!36021)

(assert (=> d!130489 (= lt!493480 (lemmaContainsTupThenGetReturnValue!304 lt!493481 (_1!8730 lt!493399) (_2!8730 lt!493399)))))

(declare-fun insertStrictlySorted!397 (List!24027 (_ BitVec 64) V!41417) List!24027)

(assert (=> d!130489 (= lt!493481 (insertStrictlySorted!397 (toList!7719 lt!493394) (_1!8730 lt!493399) (_2!8730 lt!493399)))))

(assert (=> d!130489 (= (+!3429 lt!493394 lt!493399) lt!493482)))

(declare-fun b!1101120 () Bool)

(declare-fun res!734798 () Bool)

(assert (=> b!1101120 (=> (not res!734798) (not e!628480))))

(assert (=> b!1101120 (= res!734798 (= (getValueByKey!628 (toList!7719 lt!493482) (_1!8730 lt!493399)) (Some!678 (_2!8730 lt!493399))))))

(declare-fun b!1101121 () Bool)

(declare-fun contains!6373 (List!24027 tuple2!17438) Bool)

(assert (=> b!1101121 (= e!628480 (contains!6373 (toList!7719 lt!493482) lt!493399))))

(assert (= (and d!130489 res!734797) b!1101120))

(assert (= (and b!1101120 res!734798) b!1101121))

(declare-fun m!1020823 () Bool)

(assert (=> d!130489 m!1020823))

(declare-fun m!1020825 () Bool)

(assert (=> d!130489 m!1020825))

(declare-fun m!1020827 () Bool)

(assert (=> d!130489 m!1020827))

(declare-fun m!1020829 () Bool)

(assert (=> d!130489 m!1020829))

(declare-fun m!1020831 () Bool)

(assert (=> b!1101120 m!1020831))

(declare-fun m!1020833 () Bool)

(assert (=> b!1101121 m!1020833))

(assert (=> b!1100982 d!130489))

(declare-fun b!1101122 () Bool)

(declare-fun e!628482 () Bool)

(declare-fun call!46117 () Bool)

(assert (=> b!1101122 (= e!628482 call!46117)))

(declare-fun d!130491 () Bool)

(declare-fun res!734800 () Bool)

(declare-fun e!628481 () Bool)

(assert (=> d!130491 (=> res!734800 e!628481)))

(assert (=> d!130491 (= res!734800 (bvsge #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628481)))

(declare-fun b!1101123 () Bool)

(declare-fun e!628483 () Bool)

(assert (=> b!1101123 (= e!628481 e!628483)))

(declare-fun c!108735 () Bool)

(assert (=> b!1101123 (= c!108735 (validKeyInArray!0 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101124 () Bool)

(assert (=> b!1101124 (= e!628483 e!628482)))

(declare-fun lt!493485 () (_ BitVec 64))

(assert (=> b!1101124 (= lt!493485 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493484 () Unit!36021)

(assert (=> b!1101124 (= lt!493484 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!493485 #b00000000000000000000000000000000))))

(assert (=> b!1101124 (arrayContainsKey!0 _keys!1070 lt!493485 #b00000000000000000000000000000000)))

(declare-fun lt!493483 () Unit!36021)

(assert (=> b!1101124 (= lt!493483 lt!493484)))

(declare-fun res!734799 () Bool)

(assert (=> b!1101124 (= res!734799 (= (seekEntryOrOpen!0 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9913 #b00000000000000000000000000000000)))))

(assert (=> b!1101124 (=> (not res!734799) (not e!628482))))

(declare-fun bm!46114 () Bool)

(assert (=> bm!46114 (= call!46117 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1101125 () Bool)

(assert (=> b!1101125 (= e!628483 call!46117)))

(assert (= (and d!130491 (not res!734800)) b!1101123))

(assert (= (and b!1101123 c!108735) b!1101124))

(assert (= (and b!1101123 (not c!108735)) b!1101125))

(assert (= (and b!1101124 res!734799) b!1101122))

(assert (= (or b!1101122 b!1101125) bm!46114))

(assert (=> b!1101123 m!1020799))

(assert (=> b!1101123 m!1020799))

(assert (=> b!1101123 m!1020801))

(assert (=> b!1101124 m!1020799))

(declare-fun m!1020835 () Bool)

(assert (=> b!1101124 m!1020835))

(declare-fun m!1020837 () Bool)

(assert (=> b!1101124 m!1020837))

(assert (=> b!1101124 m!1020799))

(declare-fun m!1020839 () Bool)

(assert (=> b!1101124 m!1020839))

(declare-fun m!1020841 () Bool)

(assert (=> bm!46114 m!1020841))

(assert (=> b!1100988 d!130491))

(declare-fun d!130493 () Bool)

(assert (=> d!130493 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96792 d!130493))

(declare-fun d!130495 () Bool)

(assert (=> d!130495 (= (array_inv!26444 _keys!1070) (bvsge (size!34831 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96792 d!130495))

(declare-fun d!130497 () Bool)

(assert (=> d!130497 (= (array_inv!26445 _values!874) (bvsge (size!34832 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96792 d!130497))

(declare-fun d!130499 () Bool)

(declare-fun res!734805 () Bool)

(declare-fun e!628488 () Bool)

(assert (=> d!130499 (=> res!734805 e!628488)))

(assert (=> d!130499 (= res!734805 (= (select (arr!34293 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130499 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628488)))

(declare-fun b!1101130 () Bool)

(declare-fun e!628489 () Bool)

(assert (=> b!1101130 (= e!628488 e!628489)))

(declare-fun res!734806 () Bool)

(assert (=> b!1101130 (=> (not res!734806) (not e!628489))))

(assert (=> b!1101130 (= res!734806 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34831 _keys!1070)))))

(declare-fun b!1101131 () Bool)

(assert (=> b!1101131 (= e!628489 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130499 (not res!734805)) b!1101130))

(assert (= (and b!1101130 res!734806) b!1101131))

(assert (=> d!130499 m!1020799))

(declare-fun m!1020843 () Bool)

(assert (=> b!1101131 m!1020843))

(assert (=> b!1100992 d!130499))

(declare-fun b!1101174 () Bool)

(declare-fun e!628520 () Bool)

(declare-fun call!46135 () Bool)

(assert (=> b!1101174 (= e!628520 (not call!46135))))

(declare-fun bm!46129 () Bool)

(declare-fun lt!493531 () ListLongMap!15407)

(assert (=> bm!46129 (= call!46135 (contains!6372 lt!493531 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101175 () Bool)

(declare-fun e!628522 () Bool)

(declare-fun apply!944 (ListLongMap!15407 (_ BitVec 64)) V!41417)

(declare-fun get!17648 (ValueCell!12899 V!41417) V!41417)

(assert (=> b!1101175 (= e!628522 (= (apply!944 lt!493531 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)) (get!17648 (select (arr!34294 lt!493392) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34832 lt!493392)))))

(assert (=> b!1101175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(declare-fun b!1101176 () Bool)

(declare-fun e!628524 () Bool)

(assert (=> b!1101176 (= e!628524 (validKeyInArray!0 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(declare-fun b!1101177 () Bool)

(declare-fun e!628523 () ListLongMap!15407)

(declare-fun call!46133 () ListLongMap!15407)

(assert (=> b!1101177 (= e!628523 call!46133)))

(declare-fun d!130501 () Bool)

(declare-fun e!628517 () Bool)

(assert (=> d!130501 e!628517))

(declare-fun res!734826 () Bool)

(assert (=> d!130501 (=> (not res!734826) (not e!628517))))

(assert (=> d!130501 (= res!734826 (or (bvsge #b00000000000000000000000000000000 (size!34831 lt!493400)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))))

(declare-fun lt!493534 () ListLongMap!15407)

(assert (=> d!130501 (= lt!493531 lt!493534)))

(declare-fun lt!493548 () Unit!36021)

(declare-fun e!628527 () Unit!36021)

(assert (=> d!130501 (= lt!493548 e!628527)))

(declare-fun c!108748 () Bool)

(declare-fun e!628519 () Bool)

(assert (=> d!130501 (= c!108748 e!628519)))

(declare-fun res!734833 () Bool)

(assert (=> d!130501 (=> (not res!734833) (not e!628519))))

(assert (=> d!130501 (= res!734833 (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(declare-fun e!628521 () ListLongMap!15407)

(assert (=> d!130501 (= lt!493534 e!628521)))

(declare-fun c!108752 () Bool)

(assert (=> d!130501 (= c!108752 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130501 (validMask!0 mask!1414)))

(assert (=> d!130501 (= (getCurrentListMap!4334 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493531)))

(declare-fun b!1101178 () Bool)

(declare-fun e!628516 () Bool)

(declare-fun call!46134 () Bool)

(assert (=> b!1101178 (= e!628516 (not call!46134))))

(declare-fun bm!46130 () Bool)

(declare-fun call!46137 () ListLongMap!15407)

(assert (=> bm!46130 (= call!46137 (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101179 () Bool)

(declare-fun e!628525 () Bool)

(assert (=> b!1101179 (= e!628525 (= (apply!944 lt!493531 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1101180 () Bool)

(declare-fun c!108750 () Bool)

(assert (=> b!1101180 (= c!108750 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628526 () ListLongMap!15407)

(assert (=> b!1101180 (= e!628526 e!628523)))

(declare-fun call!46136 () ListLongMap!15407)

(declare-fun call!46132 () ListLongMap!15407)

(declare-fun bm!46131 () Bool)

(declare-fun c!108749 () Bool)

(assert (=> bm!46131 (= call!46132 (+!3429 (ite c!108752 call!46137 (ite c!108749 call!46136 call!46133)) (ite (or c!108752 c!108749) (tuple2!17439 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!46132 () Bool)

(assert (=> bm!46132 (= call!46136 call!46137)))

(declare-fun b!1101181 () Bool)

(assert (=> b!1101181 (= e!628517 e!628516)))

(declare-fun c!108753 () Bool)

(assert (=> b!1101181 (= c!108753 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101182 () Bool)

(declare-fun res!734831 () Bool)

(assert (=> b!1101182 (=> (not res!734831) (not e!628517))))

(declare-fun e!628518 () Bool)

(assert (=> b!1101182 (= res!734831 e!628518)))

(declare-fun res!734825 () Bool)

(assert (=> b!1101182 (=> res!734825 e!628518)))

(assert (=> b!1101182 (= res!734825 (not e!628524))))

(declare-fun res!734829 () Bool)

(assert (=> b!1101182 (=> (not res!734829) (not e!628524))))

(assert (=> b!1101182 (= res!734829 (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(declare-fun b!1101183 () Bool)

(declare-fun res!734830 () Bool)

(assert (=> b!1101183 (=> (not res!734830) (not e!628517))))

(assert (=> b!1101183 (= res!734830 e!628520)))

(declare-fun c!108751 () Bool)

(assert (=> b!1101183 (= c!108751 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1101184 () Bool)

(assert (=> b!1101184 (= e!628519 (validKeyInArray!0 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(declare-fun b!1101185 () Bool)

(assert (=> b!1101185 (= e!628521 e!628526)))

(assert (=> b!1101185 (= c!108749 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101186 () Bool)

(declare-fun call!46138 () ListLongMap!15407)

(assert (=> b!1101186 (= e!628523 call!46138)))

(declare-fun bm!46133 () Bool)

(assert (=> bm!46133 (= call!46134 (contains!6372 lt!493531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101187 () Bool)

(declare-fun e!628528 () Bool)

(assert (=> b!1101187 (= e!628528 (= (apply!944 lt!493531 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1101188 () Bool)

(assert (=> b!1101188 (= e!628516 e!628528)))

(declare-fun res!734832 () Bool)

(assert (=> b!1101188 (= res!734832 call!46134)))

(assert (=> b!1101188 (=> (not res!734832) (not e!628528))))

(declare-fun b!1101189 () Bool)

(assert (=> b!1101189 (= e!628520 e!628525)))

(declare-fun res!734828 () Bool)

(assert (=> b!1101189 (= res!734828 call!46135)))

(assert (=> b!1101189 (=> (not res!734828) (not e!628525))))

(declare-fun b!1101190 () Bool)

(declare-fun lt!493536 () Unit!36021)

(assert (=> b!1101190 (= e!628527 lt!493536)))

(declare-fun lt!493544 () ListLongMap!15407)

(assert (=> b!1101190 (= lt!493544 (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493547 () (_ BitVec 64))

(assert (=> b!1101190 (= lt!493547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493533 () (_ BitVec 64))

(assert (=> b!1101190 (= lt!493533 (select (arr!34293 lt!493400) #b00000000000000000000000000000000))))

(declare-fun lt!493540 () Unit!36021)

(declare-fun addStillContains!657 (ListLongMap!15407 (_ BitVec 64) V!41417 (_ BitVec 64)) Unit!36021)

(assert (=> b!1101190 (= lt!493540 (addStillContains!657 lt!493544 lt!493547 zeroValue!831 lt!493533))))

(assert (=> b!1101190 (contains!6372 (+!3429 lt!493544 (tuple2!17439 lt!493547 zeroValue!831)) lt!493533)))

(declare-fun lt!493532 () Unit!36021)

(assert (=> b!1101190 (= lt!493532 lt!493540)))

(declare-fun lt!493538 () ListLongMap!15407)

(assert (=> b!1101190 (= lt!493538 (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493542 () (_ BitVec 64))

(assert (=> b!1101190 (= lt!493542 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493537 () (_ BitVec 64))

(assert (=> b!1101190 (= lt!493537 (select (arr!34293 lt!493400) #b00000000000000000000000000000000))))

(declare-fun lt!493539 () Unit!36021)

(declare-fun addApplyDifferent!513 (ListLongMap!15407 (_ BitVec 64) V!41417 (_ BitVec 64)) Unit!36021)

(assert (=> b!1101190 (= lt!493539 (addApplyDifferent!513 lt!493538 lt!493542 minValue!831 lt!493537))))

(assert (=> b!1101190 (= (apply!944 (+!3429 lt!493538 (tuple2!17439 lt!493542 minValue!831)) lt!493537) (apply!944 lt!493538 lt!493537))))

(declare-fun lt!493535 () Unit!36021)

(assert (=> b!1101190 (= lt!493535 lt!493539)))

(declare-fun lt!493549 () ListLongMap!15407)

(assert (=> b!1101190 (= lt!493549 (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493550 () (_ BitVec 64))

(assert (=> b!1101190 (= lt!493550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493530 () (_ BitVec 64))

(assert (=> b!1101190 (= lt!493530 (select (arr!34293 lt!493400) #b00000000000000000000000000000000))))

(declare-fun lt!493541 () Unit!36021)

(assert (=> b!1101190 (= lt!493541 (addApplyDifferent!513 lt!493549 lt!493550 zeroValue!831 lt!493530))))

(assert (=> b!1101190 (= (apply!944 (+!3429 lt!493549 (tuple2!17439 lt!493550 zeroValue!831)) lt!493530) (apply!944 lt!493549 lt!493530))))

(declare-fun lt!493546 () Unit!36021)

(assert (=> b!1101190 (= lt!493546 lt!493541)))

(declare-fun lt!493543 () ListLongMap!15407)

(assert (=> b!1101190 (= lt!493543 (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493551 () (_ BitVec 64))

(assert (=> b!1101190 (= lt!493551 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493545 () (_ BitVec 64))

(assert (=> b!1101190 (= lt!493545 (select (arr!34293 lt!493400) #b00000000000000000000000000000000))))

(assert (=> b!1101190 (= lt!493536 (addApplyDifferent!513 lt!493543 lt!493551 minValue!831 lt!493545))))

(assert (=> b!1101190 (= (apply!944 (+!3429 lt!493543 (tuple2!17439 lt!493551 minValue!831)) lt!493545) (apply!944 lt!493543 lt!493545))))

(declare-fun b!1101191 () Bool)

(assert (=> b!1101191 (= e!628518 e!628522)))

(declare-fun res!734827 () Bool)

(assert (=> b!1101191 (=> (not res!734827) (not e!628522))))

(assert (=> b!1101191 (= res!734827 (contains!6372 lt!493531 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(assert (=> b!1101191 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(declare-fun b!1101192 () Bool)

(assert (=> b!1101192 (= e!628521 (+!3429 call!46132 (tuple2!17439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101193 () Bool)

(declare-fun Unit!36025 () Unit!36021)

(assert (=> b!1101193 (= e!628527 Unit!36025)))

(declare-fun bm!46134 () Bool)

(assert (=> bm!46134 (= call!46133 call!46136)))

(declare-fun bm!46135 () Bool)

(assert (=> bm!46135 (= call!46138 call!46132)))

(declare-fun b!1101194 () Bool)

(assert (=> b!1101194 (= e!628526 call!46138)))

(assert (= (and d!130501 c!108752) b!1101192))

(assert (= (and d!130501 (not c!108752)) b!1101185))

(assert (= (and b!1101185 c!108749) b!1101194))

(assert (= (and b!1101185 (not c!108749)) b!1101180))

(assert (= (and b!1101180 c!108750) b!1101186))

(assert (= (and b!1101180 (not c!108750)) b!1101177))

(assert (= (or b!1101186 b!1101177) bm!46134))

(assert (= (or b!1101194 bm!46134) bm!46132))

(assert (= (or b!1101194 b!1101186) bm!46135))

(assert (= (or b!1101192 bm!46132) bm!46130))

(assert (= (or b!1101192 bm!46135) bm!46131))

(assert (= (and d!130501 res!734833) b!1101184))

(assert (= (and d!130501 c!108748) b!1101190))

(assert (= (and d!130501 (not c!108748)) b!1101193))

(assert (= (and d!130501 res!734826) b!1101182))

(assert (= (and b!1101182 res!734829) b!1101176))

(assert (= (and b!1101182 (not res!734825)) b!1101191))

(assert (= (and b!1101191 res!734827) b!1101175))

(assert (= (and b!1101182 res!734831) b!1101183))

(assert (= (and b!1101183 c!108751) b!1101189))

(assert (= (and b!1101183 (not c!108751)) b!1101174))

(assert (= (and b!1101189 res!734828) b!1101179))

(assert (= (or b!1101189 b!1101174) bm!46129))

(assert (= (and b!1101183 res!734830) b!1101181))

(assert (= (and b!1101181 c!108753) b!1101188))

(assert (= (and b!1101181 (not c!108753)) b!1101178))

(assert (= (and b!1101188 res!734832) b!1101187))

(assert (= (or b!1101188 b!1101178) bm!46133))

(declare-fun b_lambda!18051 () Bool)

(assert (=> (not b_lambda!18051) (not b!1101175)))

(assert (=> b!1101175 t!34230))

(declare-fun b_and!37095 () Bool)

(assert (= b_and!37085 (and (=> t!34230 result!16597) b_and!37095)))

(declare-fun m!1020845 () Bool)

(assert (=> b!1101175 m!1020845))

(assert (=> b!1101175 m!1020807))

(assert (=> b!1101175 m!1020845))

(assert (=> b!1101175 m!1020673))

(declare-fun m!1020847 () Bool)

(assert (=> b!1101175 m!1020847))

(assert (=> b!1101175 m!1020807))

(declare-fun m!1020849 () Bool)

(assert (=> b!1101175 m!1020849))

(assert (=> b!1101175 m!1020673))

(assert (=> b!1101191 m!1020807))

(assert (=> b!1101191 m!1020807))

(declare-fun m!1020851 () Bool)

(assert (=> b!1101191 m!1020851))

(assert (=> bm!46130 m!1020675))

(assert (=> b!1101176 m!1020807))

(assert (=> b!1101176 m!1020807))

(assert (=> b!1101176 m!1020809))

(declare-fun m!1020853 () Bool)

(assert (=> b!1101179 m!1020853))

(declare-fun m!1020855 () Bool)

(assert (=> bm!46131 m!1020855))

(declare-fun m!1020857 () Bool)

(assert (=> b!1101192 m!1020857))

(assert (=> b!1101184 m!1020807))

(assert (=> b!1101184 m!1020807))

(assert (=> b!1101184 m!1020809))

(declare-fun m!1020859 () Bool)

(assert (=> bm!46133 m!1020859))

(assert (=> b!1101190 m!1020675))

(declare-fun m!1020861 () Bool)

(assert (=> b!1101190 m!1020861))

(declare-fun m!1020863 () Bool)

(assert (=> b!1101190 m!1020863))

(declare-fun m!1020865 () Bool)

(assert (=> b!1101190 m!1020865))

(assert (=> b!1101190 m!1020807))

(declare-fun m!1020867 () Bool)

(assert (=> b!1101190 m!1020867))

(declare-fun m!1020869 () Bool)

(assert (=> b!1101190 m!1020869))

(declare-fun m!1020871 () Bool)

(assert (=> b!1101190 m!1020871))

(declare-fun m!1020873 () Bool)

(assert (=> b!1101190 m!1020873))

(declare-fun m!1020875 () Bool)

(assert (=> b!1101190 m!1020875))

(declare-fun m!1020877 () Bool)

(assert (=> b!1101190 m!1020877))

(declare-fun m!1020879 () Bool)

(assert (=> b!1101190 m!1020879))

(declare-fun m!1020881 () Bool)

(assert (=> b!1101190 m!1020881))

(assert (=> b!1101190 m!1020865))

(declare-fun m!1020883 () Bool)

(assert (=> b!1101190 m!1020883))

(declare-fun m!1020885 () Bool)

(assert (=> b!1101190 m!1020885))

(assert (=> b!1101190 m!1020873))

(declare-fun m!1020887 () Bool)

(assert (=> b!1101190 m!1020887))

(assert (=> b!1101190 m!1020867))

(assert (=> b!1101190 m!1020879))

(declare-fun m!1020889 () Bool)

(assert (=> b!1101190 m!1020889))

(declare-fun m!1020891 () Bool)

(assert (=> bm!46129 m!1020891))

(declare-fun m!1020893 () Bool)

(assert (=> b!1101187 m!1020893))

(assert (=> d!130501 m!1020665))

(assert (=> b!1100992 d!130501))

(declare-fun bm!46140 () Bool)

(declare-fun call!46144 () ListLongMap!15407)

(assert (=> bm!46140 (= call!46144 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46141 () Bool)

(declare-fun call!46143 () ListLongMap!15407)

(assert (=> bm!46141 (= call!46143 (getCurrentListMapNoExtraKeys!4241 (array!71259 (store (arr!34293 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34831 _keys!1070)) (array!71261 (store (arr!34294 _values!874) i!650 (ValueCellFull!12899 (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34832 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130503 () Bool)

(declare-fun e!628533 () Bool)

(assert (=> d!130503 e!628533))

(declare-fun res!734836 () Bool)

(assert (=> d!130503 (=> (not res!734836) (not e!628533))))

(assert (=> d!130503 (= res!734836 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34831 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34831 _keys!1070))))))))

(declare-fun lt!493554 () Unit!36021)

(declare-fun choose!1778 (array!71258 array!71260 (_ BitVec 32) (_ BitVec 32) V!41417 V!41417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36021)

(assert (=> d!130503 (= lt!493554 (choose!1778 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130503 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130503 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!223 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!493554)))

(declare-fun e!628534 () Bool)

(declare-fun b!1101201 () Bool)

(assert (=> b!1101201 (= e!628534 (= call!46143 (-!949 call!46144 k0!904)))))

(assert (=> b!1101201 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34832 _values!874)))))

(declare-fun b!1101202 () Bool)

(assert (=> b!1101202 (= e!628534 (= call!46143 call!46144))))

(assert (=> b!1101202 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34832 _values!874)))))

(declare-fun b!1101203 () Bool)

(assert (=> b!1101203 (= e!628533 e!628534)))

(declare-fun c!108756 () Bool)

(assert (=> b!1101203 (= c!108756 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!130503 res!734836) b!1101203))

(assert (= (and b!1101203 c!108756) b!1101201))

(assert (= (and b!1101203 (not c!108756)) b!1101202))

(assert (= (or b!1101201 b!1101202) bm!46140))

(assert (= (or b!1101201 b!1101202) bm!46141))

(declare-fun b_lambda!18053 () Bool)

(assert (=> (not b_lambda!18053) (not bm!46141)))

(assert (=> bm!46141 t!34230))

(declare-fun b_and!37097 () Bool)

(assert (= b_and!37095 (and (=> t!34230 result!16597) b_and!37097)))

(assert (=> bm!46140 m!1020685))

(assert (=> bm!46141 m!1020661))

(assert (=> bm!46141 m!1020673))

(assert (=> bm!46141 m!1020679))

(declare-fun m!1020895 () Bool)

(assert (=> bm!46141 m!1020895))

(declare-fun m!1020897 () Bool)

(assert (=> d!130503 m!1020897))

(declare-fun m!1020899 () Bool)

(assert (=> b!1101201 m!1020899))

(assert (=> b!1100992 d!130503))

(declare-fun d!130505 () Bool)

(declare-fun lt!493557 () ListLongMap!15407)

(assert (=> d!130505 (not (contains!6372 lt!493557 k0!904))))

(declare-fun removeStrictlySorted!85 (List!24027 (_ BitVec 64)) List!24027)

(assert (=> d!130505 (= lt!493557 (ListLongMap!15408 (removeStrictlySorted!85 (toList!7719 lt!493393) k0!904)))))

(assert (=> d!130505 (= (-!949 lt!493393 k0!904) lt!493557)))

(declare-fun bs!32294 () Bool)

(assert (= bs!32294 d!130505))

(declare-fun m!1020901 () Bool)

(assert (=> bs!32294 m!1020901))

(declare-fun m!1020903 () Bool)

(assert (=> bs!32294 m!1020903))

(assert (=> b!1100992 d!130505))

(declare-fun b!1101204 () Bool)

(declare-fun e!628539 () Bool)

(declare-fun call!46148 () Bool)

(assert (=> b!1101204 (= e!628539 (not call!46148))))

(declare-fun bm!46142 () Bool)

(declare-fun lt!493559 () ListLongMap!15407)

(assert (=> bm!46142 (= call!46148 (contains!6372 lt!493559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!628541 () Bool)

(declare-fun b!1101205 () Bool)

(assert (=> b!1101205 (= e!628541 (= (apply!944 lt!493559 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)) (get!17648 (select (arr!34294 _values!874) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101205 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34832 _values!874)))))

(assert (=> b!1101205 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1101206 () Bool)

(declare-fun e!628543 () Bool)

(assert (=> b!1101206 (= e!628543 (validKeyInArray!0 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101207 () Bool)

(declare-fun e!628542 () ListLongMap!15407)

(declare-fun call!46146 () ListLongMap!15407)

(assert (=> b!1101207 (= e!628542 call!46146)))

(declare-fun d!130507 () Bool)

(declare-fun e!628536 () Bool)

(assert (=> d!130507 e!628536))

(declare-fun res!734838 () Bool)

(assert (=> d!130507 (=> (not res!734838) (not e!628536))))

(assert (=> d!130507 (= res!734838 (or (bvsge #b00000000000000000000000000000000 (size!34831 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))))

(declare-fun lt!493562 () ListLongMap!15407)

(assert (=> d!130507 (= lt!493559 lt!493562)))

(declare-fun lt!493576 () Unit!36021)

(declare-fun e!628546 () Unit!36021)

(assert (=> d!130507 (= lt!493576 e!628546)))

(declare-fun c!108757 () Bool)

(declare-fun e!628538 () Bool)

(assert (=> d!130507 (= c!108757 e!628538)))

(declare-fun res!734845 () Bool)

(assert (=> d!130507 (=> (not res!734845) (not e!628538))))

(assert (=> d!130507 (= res!734845 (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun e!628540 () ListLongMap!15407)

(assert (=> d!130507 (= lt!493562 e!628540)))

(declare-fun c!108761 () Bool)

(assert (=> d!130507 (= c!108761 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130507 (validMask!0 mask!1414)))

(assert (=> d!130507 (= (getCurrentListMap!4334 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493559)))

(declare-fun b!1101208 () Bool)

(declare-fun e!628535 () Bool)

(declare-fun call!46147 () Bool)

(assert (=> b!1101208 (= e!628535 (not call!46147))))

(declare-fun bm!46143 () Bool)

(declare-fun call!46150 () ListLongMap!15407)

(assert (=> bm!46143 (= call!46150 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101209 () Bool)

(declare-fun e!628544 () Bool)

(assert (=> b!1101209 (= e!628544 (= (apply!944 lt!493559 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1101210 () Bool)

(declare-fun c!108759 () Bool)

(assert (=> b!1101210 (= c!108759 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628545 () ListLongMap!15407)

(assert (=> b!1101210 (= e!628545 e!628542)))

(declare-fun bm!46144 () Bool)

(declare-fun call!46149 () ListLongMap!15407)

(declare-fun c!108758 () Bool)

(declare-fun call!46145 () ListLongMap!15407)

(assert (=> bm!46144 (= call!46145 (+!3429 (ite c!108761 call!46150 (ite c!108758 call!46149 call!46146)) (ite (or c!108761 c!108758) (tuple2!17439 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!46145 () Bool)

(assert (=> bm!46145 (= call!46149 call!46150)))

(declare-fun b!1101211 () Bool)

(assert (=> b!1101211 (= e!628536 e!628535)))

(declare-fun c!108762 () Bool)

(assert (=> b!1101211 (= c!108762 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101212 () Bool)

(declare-fun res!734843 () Bool)

(assert (=> b!1101212 (=> (not res!734843) (not e!628536))))

(declare-fun e!628537 () Bool)

(assert (=> b!1101212 (= res!734843 e!628537)))

(declare-fun res!734837 () Bool)

(assert (=> b!1101212 (=> res!734837 e!628537)))

(assert (=> b!1101212 (= res!734837 (not e!628543))))

(declare-fun res!734841 () Bool)

(assert (=> b!1101212 (=> (not res!734841) (not e!628543))))

(assert (=> b!1101212 (= res!734841 (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1101213 () Bool)

(declare-fun res!734842 () Bool)

(assert (=> b!1101213 (=> (not res!734842) (not e!628536))))

(assert (=> b!1101213 (= res!734842 e!628539)))

(declare-fun c!108760 () Bool)

(assert (=> b!1101213 (= c!108760 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1101214 () Bool)

(assert (=> b!1101214 (= e!628538 (validKeyInArray!0 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101215 () Bool)

(assert (=> b!1101215 (= e!628540 e!628545)))

(assert (=> b!1101215 (= c!108758 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101216 () Bool)

(declare-fun call!46151 () ListLongMap!15407)

(assert (=> b!1101216 (= e!628542 call!46151)))

(declare-fun bm!46146 () Bool)

(assert (=> bm!46146 (= call!46147 (contains!6372 lt!493559 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101217 () Bool)

(declare-fun e!628547 () Bool)

(assert (=> b!1101217 (= e!628547 (= (apply!944 lt!493559 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1101218 () Bool)

(assert (=> b!1101218 (= e!628535 e!628547)))

(declare-fun res!734844 () Bool)

(assert (=> b!1101218 (= res!734844 call!46147)))

(assert (=> b!1101218 (=> (not res!734844) (not e!628547))))

(declare-fun b!1101219 () Bool)

(assert (=> b!1101219 (= e!628539 e!628544)))

(declare-fun res!734840 () Bool)

(assert (=> b!1101219 (= res!734840 call!46148)))

(assert (=> b!1101219 (=> (not res!734840) (not e!628544))))

(declare-fun b!1101220 () Bool)

(declare-fun lt!493564 () Unit!36021)

(assert (=> b!1101220 (= e!628546 lt!493564)))

(declare-fun lt!493572 () ListLongMap!15407)

(assert (=> b!1101220 (= lt!493572 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493575 () (_ BitVec 64))

(assert (=> b!1101220 (= lt!493575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493561 () (_ BitVec 64))

(assert (=> b!1101220 (= lt!493561 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493568 () Unit!36021)

(assert (=> b!1101220 (= lt!493568 (addStillContains!657 lt!493572 lt!493575 zeroValue!831 lt!493561))))

(assert (=> b!1101220 (contains!6372 (+!3429 lt!493572 (tuple2!17439 lt!493575 zeroValue!831)) lt!493561)))

(declare-fun lt!493560 () Unit!36021)

(assert (=> b!1101220 (= lt!493560 lt!493568)))

(declare-fun lt!493566 () ListLongMap!15407)

(assert (=> b!1101220 (= lt!493566 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493570 () (_ BitVec 64))

(assert (=> b!1101220 (= lt!493570 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493565 () (_ BitVec 64))

(assert (=> b!1101220 (= lt!493565 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493567 () Unit!36021)

(assert (=> b!1101220 (= lt!493567 (addApplyDifferent!513 lt!493566 lt!493570 minValue!831 lt!493565))))

(assert (=> b!1101220 (= (apply!944 (+!3429 lt!493566 (tuple2!17439 lt!493570 minValue!831)) lt!493565) (apply!944 lt!493566 lt!493565))))

(declare-fun lt!493563 () Unit!36021)

(assert (=> b!1101220 (= lt!493563 lt!493567)))

(declare-fun lt!493577 () ListLongMap!15407)

(assert (=> b!1101220 (= lt!493577 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493578 () (_ BitVec 64))

(assert (=> b!1101220 (= lt!493578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493558 () (_ BitVec 64))

(assert (=> b!1101220 (= lt!493558 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493569 () Unit!36021)

(assert (=> b!1101220 (= lt!493569 (addApplyDifferent!513 lt!493577 lt!493578 zeroValue!831 lt!493558))))

(assert (=> b!1101220 (= (apply!944 (+!3429 lt!493577 (tuple2!17439 lt!493578 zeroValue!831)) lt!493558) (apply!944 lt!493577 lt!493558))))

(declare-fun lt!493574 () Unit!36021)

(assert (=> b!1101220 (= lt!493574 lt!493569)))

(declare-fun lt!493571 () ListLongMap!15407)

(assert (=> b!1101220 (= lt!493571 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493579 () (_ BitVec 64))

(assert (=> b!1101220 (= lt!493579 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493573 () (_ BitVec 64))

(assert (=> b!1101220 (= lt!493573 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101220 (= lt!493564 (addApplyDifferent!513 lt!493571 lt!493579 minValue!831 lt!493573))))

(assert (=> b!1101220 (= (apply!944 (+!3429 lt!493571 (tuple2!17439 lt!493579 minValue!831)) lt!493573) (apply!944 lt!493571 lt!493573))))

(declare-fun b!1101221 () Bool)

(assert (=> b!1101221 (= e!628537 e!628541)))

(declare-fun res!734839 () Bool)

(assert (=> b!1101221 (=> (not res!734839) (not e!628541))))

(assert (=> b!1101221 (= res!734839 (contains!6372 lt!493559 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1101222 () Bool)

(assert (=> b!1101222 (= e!628540 (+!3429 call!46145 (tuple2!17439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101223 () Bool)

(declare-fun Unit!36026 () Unit!36021)

(assert (=> b!1101223 (= e!628546 Unit!36026)))

(declare-fun bm!46147 () Bool)

(assert (=> bm!46147 (= call!46146 call!46149)))

(declare-fun bm!46148 () Bool)

(assert (=> bm!46148 (= call!46151 call!46145)))

(declare-fun b!1101224 () Bool)

(assert (=> b!1101224 (= e!628545 call!46151)))

(assert (= (and d!130507 c!108761) b!1101222))

(assert (= (and d!130507 (not c!108761)) b!1101215))

(assert (= (and b!1101215 c!108758) b!1101224))

(assert (= (and b!1101215 (not c!108758)) b!1101210))

(assert (= (and b!1101210 c!108759) b!1101216))

(assert (= (and b!1101210 (not c!108759)) b!1101207))

(assert (= (or b!1101216 b!1101207) bm!46147))

(assert (= (or b!1101224 bm!46147) bm!46145))

(assert (= (or b!1101224 b!1101216) bm!46148))

(assert (= (or b!1101222 bm!46145) bm!46143))

(assert (= (or b!1101222 bm!46148) bm!46144))

(assert (= (and d!130507 res!734845) b!1101214))

(assert (= (and d!130507 c!108757) b!1101220))

(assert (= (and d!130507 (not c!108757)) b!1101223))

(assert (= (and d!130507 res!734838) b!1101212))

(assert (= (and b!1101212 res!734841) b!1101206))

(assert (= (and b!1101212 (not res!734837)) b!1101221))

(assert (= (and b!1101221 res!734839) b!1101205))

(assert (= (and b!1101212 res!734843) b!1101213))

(assert (= (and b!1101213 c!108760) b!1101219))

(assert (= (and b!1101213 (not c!108760)) b!1101204))

(assert (= (and b!1101219 res!734840) b!1101209))

(assert (= (or b!1101219 b!1101204) bm!46142))

(assert (= (and b!1101213 res!734842) b!1101211))

(assert (= (and b!1101211 c!108762) b!1101218))

(assert (= (and b!1101211 (not c!108762)) b!1101208))

(assert (= (and b!1101218 res!734844) b!1101217))

(assert (= (or b!1101218 b!1101208) bm!46146))

(declare-fun b_lambda!18055 () Bool)

(assert (=> (not b_lambda!18055) (not b!1101205)))

(assert (=> b!1101205 t!34230))

(declare-fun b_and!37099 () Bool)

(assert (= b_and!37097 (and (=> t!34230 result!16597) b_and!37099)))

(declare-fun m!1020905 () Bool)

(assert (=> b!1101205 m!1020905))

(assert (=> b!1101205 m!1020799))

(assert (=> b!1101205 m!1020905))

(assert (=> b!1101205 m!1020673))

(declare-fun m!1020907 () Bool)

(assert (=> b!1101205 m!1020907))

(assert (=> b!1101205 m!1020799))

(declare-fun m!1020909 () Bool)

(assert (=> b!1101205 m!1020909))

(assert (=> b!1101205 m!1020673))

(assert (=> b!1101221 m!1020799))

(assert (=> b!1101221 m!1020799))

(declare-fun m!1020911 () Bool)

(assert (=> b!1101221 m!1020911))

(assert (=> bm!46143 m!1020685))

(assert (=> b!1101206 m!1020799))

(assert (=> b!1101206 m!1020799))

(assert (=> b!1101206 m!1020801))

(declare-fun m!1020913 () Bool)

(assert (=> b!1101209 m!1020913))

(declare-fun m!1020915 () Bool)

(assert (=> bm!46144 m!1020915))

(declare-fun m!1020917 () Bool)

(assert (=> b!1101222 m!1020917))

(assert (=> b!1101214 m!1020799))

(assert (=> b!1101214 m!1020799))

(assert (=> b!1101214 m!1020801))

(declare-fun m!1020919 () Bool)

(assert (=> bm!46146 m!1020919))

(assert (=> b!1101220 m!1020685))

(declare-fun m!1020921 () Bool)

(assert (=> b!1101220 m!1020921))

(declare-fun m!1020923 () Bool)

(assert (=> b!1101220 m!1020923))

(declare-fun m!1020925 () Bool)

(assert (=> b!1101220 m!1020925))

(assert (=> b!1101220 m!1020799))

(declare-fun m!1020927 () Bool)

(assert (=> b!1101220 m!1020927))

(declare-fun m!1020929 () Bool)

(assert (=> b!1101220 m!1020929))

(declare-fun m!1020931 () Bool)

(assert (=> b!1101220 m!1020931))

(declare-fun m!1020933 () Bool)

(assert (=> b!1101220 m!1020933))

(declare-fun m!1020935 () Bool)

(assert (=> b!1101220 m!1020935))

(declare-fun m!1020937 () Bool)

(assert (=> b!1101220 m!1020937))

(declare-fun m!1020939 () Bool)

(assert (=> b!1101220 m!1020939))

(declare-fun m!1020941 () Bool)

(assert (=> b!1101220 m!1020941))

(assert (=> b!1101220 m!1020925))

(declare-fun m!1020943 () Bool)

(assert (=> b!1101220 m!1020943))

(declare-fun m!1020945 () Bool)

(assert (=> b!1101220 m!1020945))

(assert (=> b!1101220 m!1020933))

(declare-fun m!1020947 () Bool)

(assert (=> b!1101220 m!1020947))

(assert (=> b!1101220 m!1020927))

(assert (=> b!1101220 m!1020939))

(declare-fun m!1020949 () Bool)

(assert (=> b!1101220 m!1020949))

(declare-fun m!1020951 () Bool)

(assert (=> bm!46142 m!1020951))

(declare-fun m!1020953 () Bool)

(assert (=> b!1101217 m!1020953))

(assert (=> d!130507 m!1020665))

(assert (=> b!1100992 d!130507))

(declare-fun b!1101249 () Bool)

(declare-fun res!734856 () Bool)

(declare-fun e!628564 () Bool)

(assert (=> b!1101249 (=> (not res!734856) (not e!628564))))

(declare-fun lt!493600 () ListLongMap!15407)

(assert (=> b!1101249 (= res!734856 (not (contains!6372 lt!493600 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101250 () Bool)

(declare-fun e!628568 () Bool)

(assert (=> b!1101250 (= e!628564 e!628568)))

(declare-fun c!108771 () Bool)

(declare-fun e!628565 () Bool)

(assert (=> b!1101250 (= c!108771 e!628565)))

(declare-fun res!734857 () Bool)

(assert (=> b!1101250 (=> (not res!734857) (not e!628565))))

(assert (=> b!1101250 (= res!734857 (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(declare-fun call!46154 () ListLongMap!15407)

(declare-fun bm!46151 () Bool)

(assert (=> bm!46151 (= call!46154 (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101252 () Bool)

(declare-fun e!628566 () Bool)

(assert (=> b!1101252 (= e!628566 (= lt!493600 (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101253 () Bool)

(declare-fun e!628567 () ListLongMap!15407)

(declare-fun e!628563 () ListLongMap!15407)

(assert (=> b!1101253 (= e!628567 e!628563)))

(declare-fun c!108773 () Bool)

(assert (=> b!1101253 (= c!108773 (validKeyInArray!0 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(declare-fun b!1101254 () Bool)

(declare-fun isEmpty!974 (ListLongMap!15407) Bool)

(assert (=> b!1101254 (= e!628566 (isEmpty!974 lt!493600))))

(declare-fun b!1101255 () Bool)

(assert (=> b!1101255 (= e!628565 (validKeyInArray!0 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(assert (=> b!1101255 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101256 () Bool)

(declare-fun e!628562 () Bool)

(assert (=> b!1101256 (= e!628568 e!628562)))

(assert (=> b!1101256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(declare-fun res!734854 () Bool)

(assert (=> b!1101256 (= res!734854 (contains!6372 lt!493600 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)))))

(assert (=> b!1101256 (=> (not res!734854) (not e!628562))))

(declare-fun d!130509 () Bool)

(assert (=> d!130509 e!628564))

(declare-fun res!734855 () Bool)

(assert (=> d!130509 (=> (not res!734855) (not e!628564))))

(assert (=> d!130509 (= res!734855 (not (contains!6372 lt!493600 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130509 (= lt!493600 e!628567)))

(declare-fun c!108772 () Bool)

(assert (=> d!130509 (= c!108772 (bvsge #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(assert (=> d!130509 (validMask!0 mask!1414)))

(assert (=> d!130509 (= (getCurrentListMapNoExtraKeys!4241 lt!493400 lt!493392 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493600)))

(declare-fun b!1101251 () Bool)

(assert (=> b!1101251 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(assert (=> b!1101251 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34832 lt!493392)))))

(assert (=> b!1101251 (= e!628562 (= (apply!944 lt!493600 (select (arr!34293 lt!493400) #b00000000000000000000000000000000)) (get!17648 (select (arr!34294 lt!493392) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101257 () Bool)

(assert (=> b!1101257 (= e!628567 (ListLongMap!15408 Nil!24024))))

(declare-fun b!1101258 () Bool)

(assert (=> b!1101258 (= e!628568 e!628566)))

(declare-fun c!108774 () Bool)

(assert (=> b!1101258 (= c!108774 (bvslt #b00000000000000000000000000000000 (size!34831 lt!493400)))))

(declare-fun b!1101259 () Bool)

(declare-fun lt!493596 () Unit!36021)

(declare-fun lt!493594 () Unit!36021)

(assert (=> b!1101259 (= lt!493596 lt!493594)))

(declare-fun lt!493595 () (_ BitVec 64))

(declare-fun lt!493597 () ListLongMap!15407)

(declare-fun lt!493599 () V!41417)

(declare-fun lt!493598 () (_ BitVec 64))

(assert (=> b!1101259 (not (contains!6372 (+!3429 lt!493597 (tuple2!17439 lt!493598 lt!493599)) lt!493595))))

(declare-fun addStillNotContains!280 (ListLongMap!15407 (_ BitVec 64) V!41417 (_ BitVec 64)) Unit!36021)

(assert (=> b!1101259 (= lt!493594 (addStillNotContains!280 lt!493597 lt!493598 lt!493599 lt!493595))))

(assert (=> b!1101259 (= lt!493595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101259 (= lt!493599 (get!17648 (select (arr!34294 lt!493392) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101259 (= lt!493598 (select (arr!34293 lt!493400) #b00000000000000000000000000000000))))

(assert (=> b!1101259 (= lt!493597 call!46154)))

(assert (=> b!1101259 (= e!628563 (+!3429 call!46154 (tuple2!17439 (select (arr!34293 lt!493400) #b00000000000000000000000000000000) (get!17648 (select (arr!34294 lt!493392) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1101260 () Bool)

(assert (=> b!1101260 (= e!628563 call!46154)))

(assert (= (and d!130509 c!108772) b!1101257))

(assert (= (and d!130509 (not c!108772)) b!1101253))

(assert (= (and b!1101253 c!108773) b!1101259))

(assert (= (and b!1101253 (not c!108773)) b!1101260))

(assert (= (or b!1101259 b!1101260) bm!46151))

(assert (= (and d!130509 res!734855) b!1101249))

(assert (= (and b!1101249 res!734856) b!1101250))

(assert (= (and b!1101250 res!734857) b!1101255))

(assert (= (and b!1101250 c!108771) b!1101256))

(assert (= (and b!1101250 (not c!108771)) b!1101258))

(assert (= (and b!1101256 res!734854) b!1101251))

(assert (= (and b!1101258 c!108774) b!1101252))

(assert (= (and b!1101258 (not c!108774)) b!1101254))

(declare-fun b_lambda!18057 () Bool)

(assert (=> (not b_lambda!18057) (not b!1101251)))

(assert (=> b!1101251 t!34230))

(declare-fun b_and!37101 () Bool)

(assert (= b_and!37099 (and (=> t!34230 result!16597) b_and!37101)))

(declare-fun b_lambda!18059 () Bool)

(assert (=> (not b_lambda!18059) (not b!1101259)))

(assert (=> b!1101259 t!34230))

(declare-fun b_and!37103 () Bool)

(assert (= b_and!37101 (and (=> t!34230 result!16597) b_and!37103)))

(declare-fun m!1020955 () Bool)

(assert (=> b!1101254 m!1020955))

(declare-fun m!1020957 () Bool)

(assert (=> d!130509 m!1020957))

(assert (=> d!130509 m!1020665))

(assert (=> b!1101253 m!1020807))

(assert (=> b!1101253 m!1020807))

(assert (=> b!1101253 m!1020809))

(assert (=> b!1101255 m!1020807))

(assert (=> b!1101255 m!1020807))

(assert (=> b!1101255 m!1020809))

(declare-fun m!1020959 () Bool)

(assert (=> b!1101249 m!1020959))

(declare-fun m!1020961 () Bool)

(assert (=> b!1101252 m!1020961))

(assert (=> b!1101259 m!1020845))

(assert (=> b!1101259 m!1020673))

(assert (=> b!1101259 m!1020847))

(assert (=> b!1101259 m!1020673))

(assert (=> b!1101259 m!1020807))

(declare-fun m!1020963 () Bool)

(assert (=> b!1101259 m!1020963))

(declare-fun m!1020965 () Bool)

(assert (=> b!1101259 m!1020965))

(declare-fun m!1020967 () Bool)

(assert (=> b!1101259 m!1020967))

(assert (=> b!1101259 m!1020845))

(assert (=> b!1101259 m!1020963))

(declare-fun m!1020969 () Bool)

(assert (=> b!1101259 m!1020969))

(assert (=> b!1101251 m!1020845))

(assert (=> b!1101251 m!1020673))

(assert (=> b!1101251 m!1020847))

(assert (=> b!1101251 m!1020673))

(assert (=> b!1101251 m!1020807))

(declare-fun m!1020971 () Bool)

(assert (=> b!1101251 m!1020971))

(assert (=> b!1101251 m!1020807))

(assert (=> b!1101251 m!1020845))

(assert (=> bm!46151 m!1020961))

(assert (=> b!1101256 m!1020807))

(assert (=> b!1101256 m!1020807))

(declare-fun m!1020973 () Bool)

(assert (=> b!1101256 m!1020973))

(assert (=> b!1100992 d!130509))

(declare-fun b!1101261 () Bool)

(declare-fun res!734860 () Bool)

(declare-fun e!628571 () Bool)

(assert (=> b!1101261 (=> (not res!734860) (not e!628571))))

(declare-fun lt!493607 () ListLongMap!15407)

(assert (=> b!1101261 (= res!734860 (not (contains!6372 lt!493607 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101262 () Bool)

(declare-fun e!628575 () Bool)

(assert (=> b!1101262 (= e!628571 e!628575)))

(declare-fun c!108775 () Bool)

(declare-fun e!628572 () Bool)

(assert (=> b!1101262 (= c!108775 e!628572)))

(declare-fun res!734861 () Bool)

(assert (=> b!1101262 (=> (not res!734861) (not e!628572))))

(assert (=> b!1101262 (= res!734861 (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun call!46155 () ListLongMap!15407)

(declare-fun bm!46152 () Bool)

(assert (=> bm!46152 (= call!46155 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101264 () Bool)

(declare-fun e!628573 () Bool)

(assert (=> b!1101264 (= e!628573 (= lt!493607 (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101265 () Bool)

(declare-fun e!628574 () ListLongMap!15407)

(declare-fun e!628570 () ListLongMap!15407)

(assert (=> b!1101265 (= e!628574 e!628570)))

(declare-fun c!108777 () Bool)

(assert (=> b!1101265 (= c!108777 (validKeyInArray!0 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101266 () Bool)

(assert (=> b!1101266 (= e!628573 (isEmpty!974 lt!493607))))

(declare-fun b!1101267 () Bool)

(assert (=> b!1101267 (= e!628572 (validKeyInArray!0 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101267 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101268 () Bool)

(declare-fun e!628569 () Bool)

(assert (=> b!1101268 (= e!628575 e!628569)))

(assert (=> b!1101268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun res!734858 () Bool)

(assert (=> b!1101268 (= res!734858 (contains!6372 lt!493607 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101268 (=> (not res!734858) (not e!628569))))

(declare-fun d!130511 () Bool)

(assert (=> d!130511 e!628571))

(declare-fun res!734859 () Bool)

(assert (=> d!130511 (=> (not res!734859) (not e!628571))))

(assert (=> d!130511 (= res!734859 (not (contains!6372 lt!493607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130511 (= lt!493607 e!628574)))

(declare-fun c!108776 () Bool)

(assert (=> d!130511 (= c!108776 (bvsge #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130511 (validMask!0 mask!1414)))

(assert (=> d!130511 (= (getCurrentListMapNoExtraKeys!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493607)))

(declare-fun b!1101263 () Bool)

(assert (=> b!1101263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> b!1101263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34832 _values!874)))))

(assert (=> b!1101263 (= e!628569 (= (apply!944 lt!493607 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000)) (get!17648 (select (arr!34294 _values!874) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101269 () Bool)

(assert (=> b!1101269 (= e!628574 (ListLongMap!15408 Nil!24024))))

(declare-fun b!1101270 () Bool)

(assert (=> b!1101270 (= e!628575 e!628573)))

(declare-fun c!108778 () Bool)

(assert (=> b!1101270 (= c!108778 (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1101271 () Bool)

(declare-fun lt!493603 () Unit!36021)

(declare-fun lt!493601 () Unit!36021)

(assert (=> b!1101271 (= lt!493603 lt!493601)))

(declare-fun lt!493605 () (_ BitVec 64))

(declare-fun lt!493604 () ListLongMap!15407)

(declare-fun lt!493606 () V!41417)

(declare-fun lt!493602 () (_ BitVec 64))

(assert (=> b!1101271 (not (contains!6372 (+!3429 lt!493604 (tuple2!17439 lt!493605 lt!493606)) lt!493602))))

(assert (=> b!1101271 (= lt!493601 (addStillNotContains!280 lt!493604 lt!493605 lt!493606 lt!493602))))

(assert (=> b!1101271 (= lt!493602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101271 (= lt!493606 (get!17648 (select (arr!34294 _values!874) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101271 (= lt!493605 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101271 (= lt!493604 call!46155)))

(assert (=> b!1101271 (= e!628570 (+!3429 call!46155 (tuple2!17439 (select (arr!34293 _keys!1070) #b00000000000000000000000000000000) (get!17648 (select (arr!34294 _values!874) #b00000000000000000000000000000000) (dynLambda!2310 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1101272 () Bool)

(assert (=> b!1101272 (= e!628570 call!46155)))

(assert (= (and d!130511 c!108776) b!1101269))

(assert (= (and d!130511 (not c!108776)) b!1101265))

(assert (= (and b!1101265 c!108777) b!1101271))

(assert (= (and b!1101265 (not c!108777)) b!1101272))

(assert (= (or b!1101271 b!1101272) bm!46152))

(assert (= (and d!130511 res!734859) b!1101261))

(assert (= (and b!1101261 res!734860) b!1101262))

(assert (= (and b!1101262 res!734861) b!1101267))

(assert (= (and b!1101262 c!108775) b!1101268))

(assert (= (and b!1101262 (not c!108775)) b!1101270))

(assert (= (and b!1101268 res!734858) b!1101263))

(assert (= (and b!1101270 c!108778) b!1101264))

(assert (= (and b!1101270 (not c!108778)) b!1101266))

(declare-fun b_lambda!18061 () Bool)

(assert (=> (not b_lambda!18061) (not b!1101263)))

(assert (=> b!1101263 t!34230))

(declare-fun b_and!37105 () Bool)

(assert (= b_and!37103 (and (=> t!34230 result!16597) b_and!37105)))

(declare-fun b_lambda!18063 () Bool)

(assert (=> (not b_lambda!18063) (not b!1101271)))

(assert (=> b!1101271 t!34230))

(declare-fun b_and!37107 () Bool)

(assert (= b_and!37105 (and (=> t!34230 result!16597) b_and!37107)))

(declare-fun m!1020975 () Bool)

(assert (=> b!1101266 m!1020975))

(declare-fun m!1020977 () Bool)

(assert (=> d!130511 m!1020977))

(assert (=> d!130511 m!1020665))

(assert (=> b!1101265 m!1020799))

(assert (=> b!1101265 m!1020799))

(assert (=> b!1101265 m!1020801))

(assert (=> b!1101267 m!1020799))

(assert (=> b!1101267 m!1020799))

(assert (=> b!1101267 m!1020801))

(declare-fun m!1020979 () Bool)

(assert (=> b!1101261 m!1020979))

(declare-fun m!1020981 () Bool)

(assert (=> b!1101264 m!1020981))

(assert (=> b!1101271 m!1020905))

(assert (=> b!1101271 m!1020673))

(assert (=> b!1101271 m!1020907))

(assert (=> b!1101271 m!1020673))

(assert (=> b!1101271 m!1020799))

(declare-fun m!1020983 () Bool)

(assert (=> b!1101271 m!1020983))

(declare-fun m!1020985 () Bool)

(assert (=> b!1101271 m!1020985))

(declare-fun m!1020987 () Bool)

(assert (=> b!1101271 m!1020987))

(assert (=> b!1101271 m!1020905))

(assert (=> b!1101271 m!1020983))

(declare-fun m!1020989 () Bool)

(assert (=> b!1101271 m!1020989))

(assert (=> b!1101263 m!1020905))

(assert (=> b!1101263 m!1020673))

(assert (=> b!1101263 m!1020907))

(assert (=> b!1101263 m!1020673))

(assert (=> b!1101263 m!1020799))

(declare-fun m!1020991 () Bool)

(assert (=> b!1101263 m!1020991))

(assert (=> b!1101263 m!1020799))

(assert (=> b!1101263 m!1020905))

(assert (=> bm!46152 m!1020981))

(assert (=> b!1101268 m!1020799))

(assert (=> b!1101268 m!1020799))

(declare-fun m!1020993 () Bool)

(assert (=> b!1101268 m!1020993))

(assert (=> b!1100992 d!130511))

(declare-fun d!130513 () Bool)

(assert (=> d!130513 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493610 () Unit!36021)

(declare-fun choose!13 (array!71258 (_ BitVec 64) (_ BitVec 32)) Unit!36021)

(assert (=> d!130513 (= lt!493610 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130513 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130513 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!493610)))

(declare-fun bs!32295 () Bool)

(assert (= bs!32295 d!130513))

(assert (=> bs!32295 m!1020681))

(declare-fun m!1020995 () Bool)

(assert (=> bs!32295 m!1020995))

(assert (=> b!1100992 d!130513))

(declare-fun d!130515 () Bool)

(declare-fun e!628576 () Bool)

(assert (=> d!130515 e!628576))

(declare-fun res!734862 () Bool)

(assert (=> d!130515 (=> (not res!734862) (not e!628576))))

(declare-fun lt!493614 () ListLongMap!15407)

(assert (=> d!130515 (= res!734862 (contains!6372 lt!493614 (_1!8730 lt!493399)))))

(declare-fun lt!493613 () List!24027)

(assert (=> d!130515 (= lt!493614 (ListLongMap!15408 lt!493613))))

(declare-fun lt!493611 () Unit!36021)

(declare-fun lt!493612 () Unit!36021)

(assert (=> d!130515 (= lt!493611 lt!493612)))

(assert (=> d!130515 (= (getValueByKey!628 lt!493613 (_1!8730 lt!493399)) (Some!678 (_2!8730 lt!493399)))))

(assert (=> d!130515 (= lt!493612 (lemmaContainsTupThenGetReturnValue!304 lt!493613 (_1!8730 lt!493399) (_2!8730 lt!493399)))))

(assert (=> d!130515 (= lt!493613 (insertStrictlySorted!397 (toList!7719 lt!493393) (_1!8730 lt!493399) (_2!8730 lt!493399)))))

(assert (=> d!130515 (= (+!3429 lt!493393 lt!493399) lt!493614)))

(declare-fun b!1101273 () Bool)

(declare-fun res!734863 () Bool)

(assert (=> b!1101273 (=> (not res!734863) (not e!628576))))

(assert (=> b!1101273 (= res!734863 (= (getValueByKey!628 (toList!7719 lt!493614) (_1!8730 lt!493399)) (Some!678 (_2!8730 lt!493399))))))

(declare-fun b!1101274 () Bool)

(assert (=> b!1101274 (= e!628576 (contains!6373 (toList!7719 lt!493614) lt!493399))))

(assert (= (and d!130515 res!734862) b!1101273))

(assert (= (and b!1101273 res!734863) b!1101274))

(declare-fun m!1020997 () Bool)

(assert (=> d!130515 m!1020997))

(declare-fun m!1020999 () Bool)

(assert (=> d!130515 m!1020999))

(declare-fun m!1021001 () Bool)

(assert (=> d!130515 m!1021001))

(declare-fun m!1021003 () Bool)

(assert (=> d!130515 m!1021003))

(declare-fun m!1021005 () Bool)

(assert (=> b!1101273 m!1021005))

(declare-fun m!1021007 () Bool)

(assert (=> b!1101274 m!1021007))

(assert (=> b!1100983 d!130515))

(declare-fun d!130517 () Bool)

(declare-fun e!628577 () Bool)

(assert (=> d!130517 e!628577))

(declare-fun res!734864 () Bool)

(assert (=> d!130517 (=> (not res!734864) (not e!628577))))

(declare-fun lt!493618 () ListLongMap!15407)

(assert (=> d!130517 (= res!734864 (contains!6372 lt!493618 (_1!8730 lt!493399)))))

(declare-fun lt!493617 () List!24027)

(assert (=> d!130517 (= lt!493618 (ListLongMap!15408 lt!493617))))

(declare-fun lt!493615 () Unit!36021)

(declare-fun lt!493616 () Unit!36021)

(assert (=> d!130517 (= lt!493615 lt!493616)))

(assert (=> d!130517 (= (getValueByKey!628 lt!493617 (_1!8730 lt!493399)) (Some!678 (_2!8730 lt!493399)))))

(assert (=> d!130517 (= lt!493616 (lemmaContainsTupThenGetReturnValue!304 lt!493617 (_1!8730 lt!493399) (_2!8730 lt!493399)))))

(assert (=> d!130517 (= lt!493617 (insertStrictlySorted!397 (toList!7719 lt!493401) (_1!8730 lt!493399) (_2!8730 lt!493399)))))

(assert (=> d!130517 (= (+!3429 lt!493401 lt!493399) lt!493618)))

(declare-fun b!1101275 () Bool)

(declare-fun res!734865 () Bool)

(assert (=> b!1101275 (=> (not res!734865) (not e!628577))))

(assert (=> b!1101275 (= res!734865 (= (getValueByKey!628 (toList!7719 lt!493618) (_1!8730 lt!493399)) (Some!678 (_2!8730 lt!493399))))))

(declare-fun b!1101276 () Bool)

(assert (=> b!1101276 (= e!628577 (contains!6373 (toList!7719 lt!493618) lt!493399))))

(assert (= (and d!130517 res!734864) b!1101275))

(assert (= (and b!1101275 res!734865) b!1101276))

(declare-fun m!1021009 () Bool)

(assert (=> d!130517 m!1021009))

(declare-fun m!1021011 () Bool)

(assert (=> d!130517 m!1021011))

(declare-fun m!1021013 () Bool)

(assert (=> d!130517 m!1021013))

(declare-fun m!1021015 () Bool)

(assert (=> d!130517 m!1021015))

(declare-fun m!1021017 () Bool)

(assert (=> b!1101275 m!1021017))

(declare-fun m!1021019 () Bool)

(assert (=> b!1101276 m!1021019))

(assert (=> b!1100983 d!130517))

(declare-fun b!1101284 () Bool)

(declare-fun e!628583 () Bool)

(assert (=> b!1101284 (= e!628583 tp_is_empty!27217)))

(declare-fun b!1101283 () Bool)

(declare-fun e!628582 () Bool)

(assert (=> b!1101283 (= e!628582 tp_is_empty!27217)))

(declare-fun mapNonEmpty!42619 () Bool)

(declare-fun mapRes!42619 () Bool)

(declare-fun tp!81467 () Bool)

(assert (=> mapNonEmpty!42619 (= mapRes!42619 (and tp!81467 e!628582))))

(declare-fun mapRest!42619 () (Array (_ BitVec 32) ValueCell!12899))

(declare-fun mapValue!42619 () ValueCell!12899)

(declare-fun mapKey!42619 () (_ BitVec 32))

(assert (=> mapNonEmpty!42619 (= mapRest!42610 (store mapRest!42619 mapKey!42619 mapValue!42619))))

(declare-fun mapIsEmpty!42619 () Bool)

(assert (=> mapIsEmpty!42619 mapRes!42619))

(declare-fun condMapEmpty!42619 () Bool)

(declare-fun mapDefault!42619 () ValueCell!12899)

(assert (=> mapNonEmpty!42610 (= condMapEmpty!42619 (= mapRest!42610 ((as const (Array (_ BitVec 32) ValueCell!12899)) mapDefault!42619)))))

(assert (=> mapNonEmpty!42610 (= tp!81452 (and e!628583 mapRes!42619))))

(assert (= (and mapNonEmpty!42610 condMapEmpty!42619) mapIsEmpty!42619))

(assert (= (and mapNonEmpty!42610 (not condMapEmpty!42619)) mapNonEmpty!42619))

(assert (= (and mapNonEmpty!42619 ((_ is ValueCellFull!12899) mapValue!42619)) b!1101283))

(assert (= (and mapNonEmpty!42610 ((_ is ValueCellFull!12899) mapDefault!42619)) b!1101284))

(declare-fun m!1021021 () Bool)

(assert (=> mapNonEmpty!42619 m!1021021))

(declare-fun b_lambda!18065 () Bool)

(assert (= b_lambda!18061 (or (and start!96792 b_free!23167) b_lambda!18065)))

(declare-fun b_lambda!18067 () Bool)

(assert (= b_lambda!18057 (or (and start!96792 b_free!23167) b_lambda!18067)))

(declare-fun b_lambda!18069 () Bool)

(assert (= b_lambda!18063 (or (and start!96792 b_free!23167) b_lambda!18069)))

(declare-fun b_lambda!18071 () Bool)

(assert (= b_lambda!18051 (or (and start!96792 b_free!23167) b_lambda!18071)))

(declare-fun b_lambda!18073 () Bool)

(assert (= b_lambda!18059 (or (and start!96792 b_free!23167) b_lambda!18073)))

(declare-fun b_lambda!18075 () Bool)

(assert (= b_lambda!18053 (or (and start!96792 b_free!23167) b_lambda!18075)))

(declare-fun b_lambda!18077 () Bool)

(assert (= b_lambda!18055 (or (and start!96792 b_free!23167) b_lambda!18077)))

(check-sat (not b!1101187) (not bm!46151) (not bm!46143) (not b!1101276) (not b!1101214) (not bm!46141) (not bm!46112) (not b!1101124) (not b!1101265) (not bm!46113) (not bm!46129) (not b!1101184) (not d!130515) (not mapNonEmpty!42619) (not b!1101115) (not b!1101275) (not b!1101112) b_and!37107 (not b!1101191) (not bm!46133) (not b!1101123) (not b!1101120) tp_is_empty!27217 (not b!1101096) (not b!1101263) (not b_lambda!18067) (not bm!46140) (not b_lambda!18071) (not d!130511) (not b_lambda!18077) (not d!130509) (not bm!46131) (not b!1101253) (not b!1101220) (not b!1101121) (not b!1101254) (not d!130513) (not d!130505) (not bm!46152) (not b!1101261) (not b_lambda!18065) (not bm!46114) (not bm!46144) (not b!1101206) (not b!1101108) (not b!1101251) (not d!130503) (not b!1101201) (not b!1101268) (not b!1101255) (not b!1101217) (not b!1101252) (not b!1101095) (not b_lambda!18069) (not b!1101274) (not b!1101175) (not b!1101205) (not d!130489) (not b!1101209) (not bm!46130) (not b!1101113) (not b!1101192) (not b!1101190) (not b!1101273) (not b_lambda!18049) (not bm!46146) (not b!1101259) (not b!1101131) (not b!1101098) (not bm!46142) (not b!1101249) (not b!1101222) (not b_lambda!18073) (not b!1101179) (not b!1101221) (not b!1101266) (not b!1101267) (not b_lambda!18075) (not d!130501) (not d!130517) (not b_next!23167) (not bm!46109) (not b!1101264) (not d!130507) (not b!1101271) (not b!1101256) (not b!1101109) (not b!1101176))
(check-sat b_and!37107 (not b_next!23167))
