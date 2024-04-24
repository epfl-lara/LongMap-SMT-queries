; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96722 () Bool)

(assert start!96722)

(declare-fun b_free!23065 () Bool)

(declare-fun b_next!23065 () Bool)

(assert (=> start!96722 (= b_free!23065 (not b_next!23065))))

(declare-fun tp!81121 () Bool)

(declare-fun b_and!36803 () Bool)

(assert (=> start!96722 (= tp!81121 b_and!36803)))

(declare-fun b!1098649 () Bool)

(declare-fun e!627135 () Bool)

(declare-fun e!627133 () Bool)

(declare-fun mapRes!42433 () Bool)

(assert (=> b!1098649 (= e!627135 (and e!627133 mapRes!42433))))

(declare-fun condMapEmpty!42433 () Bool)

(declare-datatypes ((V!41281 0))(
  ( (V!41282 (val!13614 Int)) )
))
(declare-datatypes ((ValueCell!12848 0))(
  ( (ValueCellFull!12848 (v!16231 V!41281)) (EmptyCell!12848) )
))
(declare-datatypes ((array!71171 0))(
  ( (array!71172 (arr!34251 (Array (_ BitVec 32) ValueCell!12848)) (size!34788 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71171)

(declare-fun mapDefault!42433 () ValueCell!12848)

(assert (=> b!1098649 (= condMapEmpty!42433 (= (arr!34251 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12848)) mapDefault!42433)))))

(declare-fun b!1098650 () Bool)

(declare-fun e!627134 () Bool)

(declare-fun e!627138 () Bool)

(assert (=> b!1098650 (= e!627134 (not e!627138))))

(declare-fun res!732921 () Bool)

(assert (=> b!1098650 (=> res!732921 e!627138)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098650 (= res!732921 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41281)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41281)

(declare-datatypes ((tuple2!17300 0))(
  ( (tuple2!17301 (_1!8661 (_ BitVec 64)) (_2!8661 V!41281)) )
))
(declare-datatypes ((List!23924 0))(
  ( (Nil!23921) (Cons!23920 (h!25138 tuple2!17300) (t!34027 List!23924)) )
))
(declare-datatypes ((ListLongMap!15277 0))(
  ( (ListLongMap!15278 (toList!7654 List!23924)) )
))
(declare-fun lt!491008 () ListLongMap!15277)

(declare-datatypes ((array!71173 0))(
  ( (array!71174 (arr!34252 (Array (_ BitVec 32) (_ BitVec 64))) (size!34789 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71173)

(declare-fun getCurrentListMap!4366 (array!71173 array!71171 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) Int) ListLongMap!15277)

(assert (=> b!1098650 (= lt!491008 (getCurrentListMap!4366 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491006 () ListLongMap!15277)

(declare-fun lt!491010 () array!71171)

(declare-fun lt!491007 () array!71173)

(assert (=> b!1098650 (= lt!491006 (getCurrentListMap!4366 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491011 () ListLongMap!15277)

(declare-fun lt!491005 () ListLongMap!15277)

(assert (=> b!1098650 (and (= lt!491011 lt!491005) (= lt!491005 lt!491011))))

(declare-fun lt!491012 () ListLongMap!15277)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!928 (ListLongMap!15277 (_ BitVec 64)) ListLongMap!15277)

(assert (=> b!1098650 (= lt!491005 (-!928 lt!491012 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36095 0))(
  ( (Unit!36096) )
))
(declare-fun lt!491013 () Unit!36095)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!200 (array!71173 array!71171 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36095)

(assert (=> b!1098650 (= lt!491013 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!200 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4207 (array!71173 array!71171 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) Int) ListLongMap!15277)

(assert (=> b!1098650 (= lt!491011 (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2325 (Int (_ BitVec 64)) V!41281)

(assert (=> b!1098650 (= lt!491010 (array!71172 (store (arr!34251 _values!874) i!650 (ValueCellFull!12848 (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34788 _values!874)))))

(assert (=> b!1098650 (= lt!491012 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098650 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491009 () Unit!36095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71173 (_ BitVec 64) (_ BitVec 32)) Unit!36095)

(assert (=> b!1098650 (= lt!491009 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!732926 () Bool)

(declare-fun e!627136 () Bool)

(assert (=> start!96722 (=> (not res!732926) (not e!627136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96722 (= res!732926 (validMask!0 mask!1414))))

(assert (=> start!96722 e!627136))

(assert (=> start!96722 tp!81121))

(assert (=> start!96722 true))

(declare-fun tp_is_empty!27115 () Bool)

(assert (=> start!96722 tp_is_empty!27115))

(declare-fun array_inv!26414 (array!71173) Bool)

(assert (=> start!96722 (array_inv!26414 _keys!1070)))

(declare-fun array_inv!26415 (array!71171) Bool)

(assert (=> start!96722 (and (array_inv!26415 _values!874) e!627135)))

(declare-fun b!1098651 () Bool)

(assert (=> b!1098651 (= e!627133 tp_is_empty!27115)))

(declare-fun mapIsEmpty!42433 () Bool)

(assert (=> mapIsEmpty!42433 mapRes!42433))

(declare-fun b!1098652 () Bool)

(declare-fun res!732922 () Bool)

(assert (=> b!1098652 (=> (not res!732922) (not e!627134))))

(declare-datatypes ((List!23925 0))(
  ( (Nil!23922) (Cons!23921 (h!25139 (_ BitVec 64)) (t!34028 List!23925)) )
))
(declare-fun arrayNoDuplicates!0 (array!71173 (_ BitVec 32) List!23925) Bool)

(assert (=> b!1098652 (= res!732922 (arrayNoDuplicates!0 lt!491007 #b00000000000000000000000000000000 Nil!23922))))

(declare-fun b!1098653 () Bool)

(declare-fun res!732923 () Bool)

(assert (=> b!1098653 (=> (not res!732923) (not e!627136))))

(assert (=> b!1098653 (= res!732923 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23922))))

(declare-fun b!1098654 () Bool)

(declare-fun e!627139 () Bool)

(assert (=> b!1098654 (= e!627139 tp_is_empty!27115)))

(declare-fun b!1098655 () Bool)

(declare-fun +!3390 (ListLongMap!15277 tuple2!17300) ListLongMap!15277)

(assert (=> b!1098655 (= e!627138 (= lt!491006 (+!3390 (+!3390 lt!491011 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098656 () Bool)

(assert (=> b!1098656 (= e!627136 e!627134)))

(declare-fun res!732919 () Bool)

(assert (=> b!1098656 (=> (not res!732919) (not e!627134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71173 (_ BitVec 32)) Bool)

(assert (=> b!1098656 (= res!732919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491007 mask!1414))))

(assert (=> b!1098656 (= lt!491007 (array!71174 (store (arr!34252 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34789 _keys!1070)))))

(declare-fun b!1098657 () Bool)

(declare-fun res!732924 () Bool)

(assert (=> b!1098657 (=> (not res!732924) (not e!627136))))

(assert (=> b!1098657 (= res!732924 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34789 _keys!1070))))))

(declare-fun b!1098658 () Bool)

(declare-fun res!732927 () Bool)

(assert (=> b!1098658 (=> (not res!732927) (not e!627136))))

(assert (=> b!1098658 (= res!732927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098659 () Bool)

(declare-fun res!732925 () Bool)

(assert (=> b!1098659 (=> (not res!732925) (not e!627136))))

(assert (=> b!1098659 (= res!732925 (and (= (size!34788 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34789 _keys!1070) (size!34788 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098660 () Bool)

(declare-fun res!732928 () Bool)

(assert (=> b!1098660 (=> (not res!732928) (not e!627136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098660 (= res!732928 (validKeyInArray!0 k0!904))))

(declare-fun b!1098661 () Bool)

(declare-fun res!732920 () Bool)

(assert (=> b!1098661 (=> (not res!732920) (not e!627136))))

(assert (=> b!1098661 (= res!732920 (= (select (arr!34252 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42433 () Bool)

(declare-fun tp!81122 () Bool)

(assert (=> mapNonEmpty!42433 (= mapRes!42433 (and tp!81122 e!627139))))

(declare-fun mapKey!42433 () (_ BitVec 32))

(declare-fun mapValue!42433 () ValueCell!12848)

(declare-fun mapRest!42433 () (Array (_ BitVec 32) ValueCell!12848))

(assert (=> mapNonEmpty!42433 (= (arr!34251 _values!874) (store mapRest!42433 mapKey!42433 mapValue!42433))))

(assert (= (and start!96722 res!732926) b!1098659))

(assert (= (and b!1098659 res!732925) b!1098658))

(assert (= (and b!1098658 res!732927) b!1098653))

(assert (= (and b!1098653 res!732923) b!1098657))

(assert (= (and b!1098657 res!732924) b!1098660))

(assert (= (and b!1098660 res!732928) b!1098661))

(assert (= (and b!1098661 res!732920) b!1098656))

(assert (= (and b!1098656 res!732919) b!1098652))

(assert (= (and b!1098652 res!732922) b!1098650))

(assert (= (and b!1098650 (not res!732921)) b!1098655))

(assert (= (and b!1098649 condMapEmpty!42433) mapIsEmpty!42433))

(assert (= (and b!1098649 (not condMapEmpty!42433)) mapNonEmpty!42433))

(get-info :version)

(assert (= (and mapNonEmpty!42433 ((_ is ValueCellFull!12848) mapValue!42433)) b!1098654))

(assert (= (and b!1098649 ((_ is ValueCellFull!12848) mapDefault!42433)) b!1098651))

(assert (= start!96722 b!1098649))

(declare-fun b_lambda!17733 () Bool)

(assert (=> (not b_lambda!17733) (not b!1098650)))

(declare-fun t!34026 () Bool)

(declare-fun tb!7923 () Bool)

(assert (=> (and start!96722 (= defaultEntry!882 defaultEntry!882) t!34026) tb!7923))

(declare-fun result!16377 () Bool)

(assert (=> tb!7923 (= result!16377 tp_is_empty!27115)))

(assert (=> b!1098650 t!34026))

(declare-fun b_and!36805 () Bool)

(assert (= b_and!36803 (and (=> t!34026 result!16377) b_and!36805)))

(declare-fun m!1018467 () Bool)

(assert (=> b!1098656 m!1018467))

(declare-fun m!1018469 () Bool)

(assert (=> b!1098656 m!1018469))

(declare-fun m!1018471 () Bool)

(assert (=> b!1098652 m!1018471))

(declare-fun m!1018473 () Bool)

(assert (=> start!96722 m!1018473))

(declare-fun m!1018475 () Bool)

(assert (=> start!96722 m!1018475))

(declare-fun m!1018477 () Bool)

(assert (=> start!96722 m!1018477))

(declare-fun m!1018479 () Bool)

(assert (=> b!1098661 m!1018479))

(declare-fun m!1018481 () Bool)

(assert (=> b!1098655 m!1018481))

(assert (=> b!1098655 m!1018481))

(declare-fun m!1018483 () Bool)

(assert (=> b!1098655 m!1018483))

(declare-fun m!1018485 () Bool)

(assert (=> b!1098650 m!1018485))

(declare-fun m!1018487 () Bool)

(assert (=> b!1098650 m!1018487))

(declare-fun m!1018489 () Bool)

(assert (=> b!1098650 m!1018489))

(declare-fun m!1018491 () Bool)

(assert (=> b!1098650 m!1018491))

(declare-fun m!1018493 () Bool)

(assert (=> b!1098650 m!1018493))

(declare-fun m!1018495 () Bool)

(assert (=> b!1098650 m!1018495))

(declare-fun m!1018497 () Bool)

(assert (=> b!1098650 m!1018497))

(declare-fun m!1018499 () Bool)

(assert (=> b!1098650 m!1018499))

(declare-fun m!1018501 () Bool)

(assert (=> b!1098650 m!1018501))

(declare-fun m!1018503 () Bool)

(assert (=> b!1098650 m!1018503))

(declare-fun m!1018505 () Bool)

(assert (=> mapNonEmpty!42433 m!1018505))

(declare-fun m!1018507 () Bool)

(assert (=> b!1098658 m!1018507))

(declare-fun m!1018509 () Bool)

(assert (=> b!1098653 m!1018509))

(declare-fun m!1018511 () Bool)

(assert (=> b!1098660 m!1018511))

(check-sat (not mapNonEmpty!42433) (not b!1098655) b_and!36805 (not b!1098653) (not b!1098660) (not b!1098658) tp_is_empty!27115 (not b!1098652) (not start!96722) (not b_next!23065) (not b_lambda!17733) (not b!1098656) (not b!1098650))
(check-sat b_and!36805 (not b_next!23065))
(get-model)

(declare-fun b_lambda!17739 () Bool)

(assert (= b_lambda!17733 (or (and start!96722 b_free!23065) b_lambda!17739)))

(check-sat (not b_lambda!17739) (not mapNonEmpty!42433) (not b_next!23065) (not b!1098655) b_and!36805 (not b!1098653) (not b!1098660) (not b!1098658) tp_is_empty!27115 (not b!1098652) (not start!96722) (not b!1098656) (not b!1098650))
(check-sat b_and!36805 (not b_next!23065))
(get-model)

(declare-fun b!1098754 () Bool)

(declare-fun e!627190 () Bool)

(declare-fun call!45834 () Bool)

(assert (=> b!1098754 (= e!627190 call!45834)))

(declare-fun bm!45831 () Bool)

(assert (=> bm!45831 (= call!45834 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!491007 mask!1414))))

(declare-fun d!130757 () Bool)

(declare-fun res!732993 () Bool)

(declare-fun e!627188 () Bool)

(assert (=> d!130757 (=> res!732993 e!627188)))

(assert (=> d!130757 (= res!732993 (bvsge #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(assert (=> d!130757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491007 mask!1414) e!627188)))

(declare-fun b!1098755 () Bool)

(declare-fun e!627189 () Bool)

(assert (=> b!1098755 (= e!627190 e!627189)))

(declare-fun lt!491075 () (_ BitVec 64))

(assert (=> b!1098755 (= lt!491075 (select (arr!34252 lt!491007) #b00000000000000000000000000000000))))

(declare-fun lt!491074 () Unit!36095)

(assert (=> b!1098755 (= lt!491074 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!491007 lt!491075 #b00000000000000000000000000000000))))

(assert (=> b!1098755 (arrayContainsKey!0 lt!491007 lt!491075 #b00000000000000000000000000000000)))

(declare-fun lt!491076 () Unit!36095)

(assert (=> b!1098755 (= lt!491076 lt!491074)))

(declare-fun res!732994 () Bool)

(declare-datatypes ((SeekEntryResult!9862 0))(
  ( (MissingZero!9862 (index!41819 (_ BitVec 32))) (Found!9862 (index!41820 (_ BitVec 32))) (Intermediate!9862 (undefined!10674 Bool) (index!41821 (_ BitVec 32)) (x!98688 (_ BitVec 32))) (Undefined!9862) (MissingVacant!9862 (index!41822 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71173 (_ BitVec 32)) SeekEntryResult!9862)

(assert (=> b!1098755 (= res!732994 (= (seekEntryOrOpen!0 (select (arr!34252 lt!491007) #b00000000000000000000000000000000) lt!491007 mask!1414) (Found!9862 #b00000000000000000000000000000000)))))

(assert (=> b!1098755 (=> (not res!732994) (not e!627189))))

(declare-fun b!1098756 () Bool)

(assert (=> b!1098756 (= e!627189 call!45834)))

(declare-fun b!1098757 () Bool)

(assert (=> b!1098757 (= e!627188 e!627190)))

(declare-fun c!108771 () Bool)

(assert (=> b!1098757 (= c!108771 (validKeyInArray!0 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(assert (= (and d!130757 (not res!732993)) b!1098757))

(assert (= (and b!1098757 c!108771) b!1098755))

(assert (= (and b!1098757 (not c!108771)) b!1098754))

(assert (= (and b!1098755 res!732994) b!1098756))

(assert (= (or b!1098756 b!1098754) bm!45831))

(declare-fun m!1018605 () Bool)

(assert (=> bm!45831 m!1018605))

(declare-fun m!1018607 () Bool)

(assert (=> b!1098755 m!1018607))

(declare-fun m!1018609 () Bool)

(assert (=> b!1098755 m!1018609))

(declare-fun m!1018611 () Bool)

(assert (=> b!1098755 m!1018611))

(assert (=> b!1098755 m!1018607))

(declare-fun m!1018613 () Bool)

(assert (=> b!1098755 m!1018613))

(assert (=> b!1098757 m!1018607))

(assert (=> b!1098757 m!1018607))

(declare-fun m!1018615 () Bool)

(assert (=> b!1098757 m!1018615))

(assert (=> b!1098656 d!130757))

(declare-fun d!130759 () Bool)

(declare-fun res!732999 () Bool)

(declare-fun e!627195 () Bool)

(assert (=> d!130759 (=> res!732999 e!627195)))

(assert (=> d!130759 (= res!732999 (= (select (arr!34252 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130759 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627195)))

(declare-fun b!1098762 () Bool)

(declare-fun e!627196 () Bool)

(assert (=> b!1098762 (= e!627195 e!627196)))

(declare-fun res!733000 () Bool)

(assert (=> b!1098762 (=> (not res!733000) (not e!627196))))

(assert (=> b!1098762 (= res!733000 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34789 _keys!1070)))))

(declare-fun b!1098763 () Bool)

(assert (=> b!1098763 (= e!627196 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130759 (not res!732999)) b!1098762))

(assert (= (and b!1098762 res!733000) b!1098763))

(declare-fun m!1018617 () Bool)

(assert (=> d!130759 m!1018617))

(declare-fun m!1018619 () Bool)

(assert (=> b!1098763 m!1018619))

(assert (=> b!1098650 d!130759))

(declare-fun bm!45846 () Bool)

(declare-fun call!45854 () ListLongMap!15277)

(declare-fun call!45851 () ListLongMap!15277)

(assert (=> bm!45846 (= call!45854 call!45851)))

(declare-fun b!1098807 () Bool)

(declare-fun e!627229 () Bool)

(declare-fun e!627230 () Bool)

(assert (=> b!1098807 (= e!627229 e!627230)))

(declare-fun res!733025 () Bool)

(declare-fun call!45853 () Bool)

(assert (=> b!1098807 (= res!733025 call!45853)))

(assert (=> b!1098807 (=> (not res!733025) (not e!627230))))

(declare-fun b!1098808 () Bool)

(declare-fun e!627223 () Bool)

(declare-fun e!627224 () Bool)

(assert (=> b!1098808 (= e!627223 e!627224)))

(declare-fun res!733027 () Bool)

(declare-fun call!45850 () Bool)

(assert (=> b!1098808 (= res!733027 call!45850)))

(assert (=> b!1098808 (=> (not res!733027) (not e!627224))))

(declare-fun b!1098809 () Bool)

(declare-fun e!627226 () ListLongMap!15277)

(declare-fun call!45849 () ListLongMap!15277)

(assert (=> b!1098809 (= e!627226 call!45849)))

(declare-fun call!45855 () ListLongMap!15277)

(declare-fun c!108788 () Bool)

(declare-fun c!108787 () Bool)

(declare-fun bm!45847 () Bool)

(assert (=> bm!45847 (= call!45855 (+!3390 (ite c!108788 call!45851 (ite c!108787 call!45854 call!45849)) (ite (or c!108788 c!108787) (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098810 () Bool)

(declare-fun call!45852 () ListLongMap!15277)

(assert (=> b!1098810 (= e!627226 call!45852)))

(declare-fun b!1098811 () Bool)

(assert (=> b!1098811 (= e!627223 (not call!45850))))

(declare-fun b!1098812 () Bool)

(declare-fun e!627227 () ListLongMap!15277)

(assert (=> b!1098812 (= e!627227 call!45852)))

(declare-fun bm!45848 () Bool)

(declare-fun lt!491142 () ListLongMap!15277)

(declare-fun contains!6401 (ListLongMap!15277 (_ BitVec 64)) Bool)

(assert (=> bm!45848 (= call!45853 (contains!6401 lt!491142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098813 () Bool)

(declare-fun e!627233 () Bool)

(declare-fun e!627232 () Bool)

(assert (=> b!1098813 (= e!627233 e!627232)))

(declare-fun res!733023 () Bool)

(assert (=> b!1098813 (=> (not res!733023) (not e!627232))))

(assert (=> b!1098813 (= res!733023 (contains!6401 lt!491142 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(declare-fun bm!45849 () Bool)

(assert (=> bm!45849 (= call!45852 call!45855)))

(declare-fun b!1098814 () Bool)

(assert (=> b!1098814 (= e!627229 (not call!45853))))

(declare-fun b!1098806 () Bool)

(declare-fun e!627235 () Unit!36095)

(declare-fun Unit!36099 () Unit!36095)

(assert (=> b!1098806 (= e!627235 Unit!36099)))

(declare-fun d!130761 () Bool)

(declare-fun e!627228 () Bool)

(assert (=> d!130761 e!627228))

(declare-fun res!733020 () Bool)

(assert (=> d!130761 (=> (not res!733020) (not e!627228))))

(assert (=> d!130761 (= res!733020 (or (bvsge #b00000000000000000000000000000000 (size!34789 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))))

(declare-fun lt!491138 () ListLongMap!15277)

(assert (=> d!130761 (= lt!491142 lt!491138)))

(declare-fun lt!491132 () Unit!36095)

(assert (=> d!130761 (= lt!491132 e!627235)))

(declare-fun c!108786 () Bool)

(declare-fun e!627234 () Bool)

(assert (=> d!130761 (= c!108786 e!627234)))

(declare-fun res!733019 () Bool)

(assert (=> d!130761 (=> (not res!733019) (not e!627234))))

(assert (=> d!130761 (= res!733019 (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(declare-fun e!627231 () ListLongMap!15277)

(assert (=> d!130761 (= lt!491138 e!627231)))

(assert (=> d!130761 (= c!108788 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130761 (validMask!0 mask!1414)))

(assert (=> d!130761 (= (getCurrentListMap!4366 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491142)))

(declare-fun b!1098815 () Bool)

(declare-fun lt!491130 () Unit!36095)

(assert (=> b!1098815 (= e!627235 lt!491130)))

(declare-fun lt!491133 () ListLongMap!15277)

(assert (=> b!1098815 (= lt!491133 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491135 () (_ BitVec 64))

(assert (=> b!1098815 (= lt!491135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491128 () (_ BitVec 64))

(assert (=> b!1098815 (= lt!491128 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491141 () Unit!36095)

(declare-fun addStillContains!656 (ListLongMap!15277 (_ BitVec 64) V!41281 (_ BitVec 64)) Unit!36095)

(assert (=> b!1098815 (= lt!491141 (addStillContains!656 lt!491133 lt!491135 zeroValue!831 lt!491128))))

(assert (=> b!1098815 (contains!6401 (+!3390 lt!491133 (tuple2!17301 lt!491135 zeroValue!831)) lt!491128)))

(declare-fun lt!491122 () Unit!36095)

(assert (=> b!1098815 (= lt!491122 lt!491141)))

(declare-fun lt!491127 () ListLongMap!15277)

(assert (=> b!1098815 (= lt!491127 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491124 () (_ BitVec 64))

(assert (=> b!1098815 (= lt!491124 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491123 () (_ BitVec 64))

(assert (=> b!1098815 (= lt!491123 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491137 () Unit!36095)

(declare-fun addApplyDifferent!512 (ListLongMap!15277 (_ BitVec 64) V!41281 (_ BitVec 64)) Unit!36095)

(assert (=> b!1098815 (= lt!491137 (addApplyDifferent!512 lt!491127 lt!491124 minValue!831 lt!491123))))

(declare-fun apply!952 (ListLongMap!15277 (_ BitVec 64)) V!41281)

(assert (=> b!1098815 (= (apply!952 (+!3390 lt!491127 (tuple2!17301 lt!491124 minValue!831)) lt!491123) (apply!952 lt!491127 lt!491123))))

(declare-fun lt!491140 () Unit!36095)

(assert (=> b!1098815 (= lt!491140 lt!491137)))

(declare-fun lt!491125 () ListLongMap!15277)

(assert (=> b!1098815 (= lt!491125 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491134 () (_ BitVec 64))

(assert (=> b!1098815 (= lt!491134 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491136 () (_ BitVec 64))

(assert (=> b!1098815 (= lt!491136 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491139 () Unit!36095)

(assert (=> b!1098815 (= lt!491139 (addApplyDifferent!512 lt!491125 lt!491134 zeroValue!831 lt!491136))))

(assert (=> b!1098815 (= (apply!952 (+!3390 lt!491125 (tuple2!17301 lt!491134 zeroValue!831)) lt!491136) (apply!952 lt!491125 lt!491136))))

(declare-fun lt!491131 () Unit!36095)

(assert (=> b!1098815 (= lt!491131 lt!491139)))

(declare-fun lt!491121 () ListLongMap!15277)

(assert (=> b!1098815 (= lt!491121 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491126 () (_ BitVec 64))

(assert (=> b!1098815 (= lt!491126 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491129 () (_ BitVec 64))

(assert (=> b!1098815 (= lt!491129 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098815 (= lt!491130 (addApplyDifferent!512 lt!491121 lt!491126 minValue!831 lt!491129))))

(assert (=> b!1098815 (= (apply!952 (+!3390 lt!491121 (tuple2!17301 lt!491126 minValue!831)) lt!491129) (apply!952 lt!491121 lt!491129))))

(declare-fun bm!45850 () Bool)

(assert (=> bm!45850 (= call!45849 call!45854)))

(declare-fun b!1098816 () Bool)

(declare-fun get!17640 (ValueCell!12848 V!41281) V!41281)

(assert (=> b!1098816 (= e!627232 (= (apply!952 lt!491142 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)) (get!17640 (select (arr!34251 _values!874) #b00000000000000000000000000000000) (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34788 _values!874)))))

(assert (=> b!1098816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(declare-fun b!1098817 () Bool)

(declare-fun res!733024 () Bool)

(assert (=> b!1098817 (=> (not res!733024) (not e!627228))))

(assert (=> b!1098817 (= res!733024 e!627233)))

(declare-fun res!733026 () Bool)

(assert (=> b!1098817 (=> res!733026 e!627233)))

(declare-fun e!627225 () Bool)

(assert (=> b!1098817 (= res!733026 (not e!627225))))

(declare-fun res!733021 () Bool)

(assert (=> b!1098817 (=> (not res!733021) (not e!627225))))

(assert (=> b!1098817 (= res!733021 (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(declare-fun b!1098818 () Bool)

(declare-fun res!733022 () Bool)

(assert (=> b!1098818 (=> (not res!733022) (not e!627228))))

(assert (=> b!1098818 (= res!733022 e!627229)))

(declare-fun c!108784 () Bool)

(assert (=> b!1098818 (= c!108784 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1098819 () Bool)

(assert (=> b!1098819 (= e!627231 e!627227)))

(assert (=> b!1098819 (= c!108787 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1098820 () Bool)

(assert (=> b!1098820 (= e!627224 (= (apply!952 lt!491142 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098821 () Bool)

(declare-fun c!108789 () Bool)

(assert (=> b!1098821 (= c!108789 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1098821 (= e!627227 e!627226)))

(declare-fun bm!45851 () Bool)

(assert (=> bm!45851 (= call!45850 (contains!6401 lt!491142 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098822 () Bool)

(assert (=> b!1098822 (= e!627234 (validKeyInArray!0 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45852 () Bool)

(assert (=> bm!45852 (= call!45851 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098823 () Bool)

(assert (=> b!1098823 (= e!627225 (validKeyInArray!0 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098824 () Bool)

(assert (=> b!1098824 (= e!627231 (+!3390 call!45855 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1098825 () Bool)

(assert (=> b!1098825 (= e!627230 (= (apply!952 lt!491142 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1098826 () Bool)

(assert (=> b!1098826 (= e!627228 e!627223)))

(declare-fun c!108785 () Bool)

(assert (=> b!1098826 (= c!108785 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130761 c!108788) b!1098824))

(assert (= (and d!130761 (not c!108788)) b!1098819))

(assert (= (and b!1098819 c!108787) b!1098812))

(assert (= (and b!1098819 (not c!108787)) b!1098821))

(assert (= (and b!1098821 c!108789) b!1098810))

(assert (= (and b!1098821 (not c!108789)) b!1098809))

(assert (= (or b!1098810 b!1098809) bm!45850))

(assert (= (or b!1098812 bm!45850) bm!45846))

(assert (= (or b!1098812 b!1098810) bm!45849))

(assert (= (or b!1098824 bm!45846) bm!45852))

(assert (= (or b!1098824 bm!45849) bm!45847))

(assert (= (and d!130761 res!733019) b!1098822))

(assert (= (and d!130761 c!108786) b!1098815))

(assert (= (and d!130761 (not c!108786)) b!1098806))

(assert (= (and d!130761 res!733020) b!1098817))

(assert (= (and b!1098817 res!733021) b!1098823))

(assert (= (and b!1098817 (not res!733026)) b!1098813))

(assert (= (and b!1098813 res!733023) b!1098816))

(assert (= (and b!1098817 res!733024) b!1098818))

(assert (= (and b!1098818 c!108784) b!1098807))

(assert (= (and b!1098818 (not c!108784)) b!1098814))

(assert (= (and b!1098807 res!733025) b!1098825))

(assert (= (or b!1098807 b!1098814) bm!45848))

(assert (= (and b!1098818 res!733022) b!1098826))

(assert (= (and b!1098826 c!108785) b!1098808))

(assert (= (and b!1098826 (not c!108785)) b!1098811))

(assert (= (and b!1098808 res!733027) b!1098820))

(assert (= (or b!1098808 b!1098811) bm!45851))

(declare-fun b_lambda!17741 () Bool)

(assert (=> (not b_lambda!17741) (not b!1098816)))

(assert (=> b!1098816 t!34026))

(declare-fun b_and!36815 () Bool)

(assert (= b_and!36805 (and (=> t!34026 result!16377) b_and!36815)))

(declare-fun m!1018621 () Bool)

(assert (=> b!1098824 m!1018621))

(assert (=> bm!45852 m!1018495))

(declare-fun m!1018623 () Bool)

(assert (=> bm!45847 m!1018623))

(assert (=> b!1098816 m!1018617))

(declare-fun m!1018625 () Bool)

(assert (=> b!1098816 m!1018625))

(assert (=> b!1098816 m!1018497))

(declare-fun m!1018627 () Bool)

(assert (=> b!1098816 m!1018627))

(assert (=> b!1098816 m!1018497))

(declare-fun m!1018629 () Bool)

(assert (=> b!1098816 m!1018629))

(assert (=> b!1098816 m!1018627))

(assert (=> b!1098816 m!1018617))

(assert (=> b!1098813 m!1018617))

(assert (=> b!1098813 m!1018617))

(declare-fun m!1018631 () Bool)

(assert (=> b!1098813 m!1018631))

(assert (=> b!1098823 m!1018617))

(assert (=> b!1098823 m!1018617))

(declare-fun m!1018633 () Bool)

(assert (=> b!1098823 m!1018633))

(declare-fun m!1018635 () Bool)

(assert (=> bm!45848 m!1018635))

(assert (=> b!1098822 m!1018617))

(assert (=> b!1098822 m!1018617))

(assert (=> b!1098822 m!1018633))

(assert (=> d!130761 m!1018473))

(declare-fun m!1018637 () Bool)

(assert (=> b!1098825 m!1018637))

(declare-fun m!1018639 () Bool)

(assert (=> b!1098820 m!1018639))

(declare-fun m!1018641 () Bool)

(assert (=> bm!45851 m!1018641))

(declare-fun m!1018643 () Bool)

(assert (=> b!1098815 m!1018643))

(declare-fun m!1018645 () Bool)

(assert (=> b!1098815 m!1018645))

(declare-fun m!1018647 () Bool)

(assert (=> b!1098815 m!1018647))

(declare-fun m!1018649 () Bool)

(assert (=> b!1098815 m!1018649))

(declare-fun m!1018651 () Bool)

(assert (=> b!1098815 m!1018651))

(declare-fun m!1018653 () Bool)

(assert (=> b!1098815 m!1018653))

(declare-fun m!1018655 () Bool)

(assert (=> b!1098815 m!1018655))

(declare-fun m!1018657 () Bool)

(assert (=> b!1098815 m!1018657))

(declare-fun m!1018659 () Bool)

(assert (=> b!1098815 m!1018659))

(assert (=> b!1098815 m!1018617))

(assert (=> b!1098815 m!1018649))

(declare-fun m!1018661 () Bool)

(assert (=> b!1098815 m!1018661))

(assert (=> b!1098815 m!1018651))

(declare-fun m!1018663 () Bool)

(assert (=> b!1098815 m!1018663))

(declare-fun m!1018665 () Bool)

(assert (=> b!1098815 m!1018665))

(declare-fun m!1018667 () Bool)

(assert (=> b!1098815 m!1018667))

(declare-fun m!1018669 () Bool)

(assert (=> b!1098815 m!1018669))

(assert (=> b!1098815 m!1018653))

(assert (=> b!1098815 m!1018495))

(assert (=> b!1098815 m!1018657))

(declare-fun m!1018671 () Bool)

(assert (=> b!1098815 m!1018671))

(assert (=> b!1098650 d!130761))

(declare-fun bm!45853 () Bool)

(declare-fun call!45861 () ListLongMap!15277)

(declare-fun call!45858 () ListLongMap!15277)

(assert (=> bm!45853 (= call!45861 call!45858)))

(declare-fun b!1098828 () Bool)

(declare-fun e!627242 () Bool)

(declare-fun e!627243 () Bool)

(assert (=> b!1098828 (= e!627242 e!627243)))

(declare-fun res!733034 () Bool)

(declare-fun call!45860 () Bool)

(assert (=> b!1098828 (= res!733034 call!45860)))

(assert (=> b!1098828 (=> (not res!733034) (not e!627243))))

(declare-fun b!1098829 () Bool)

(declare-fun e!627236 () Bool)

(declare-fun e!627237 () Bool)

(assert (=> b!1098829 (= e!627236 e!627237)))

(declare-fun res!733036 () Bool)

(declare-fun call!45857 () Bool)

(assert (=> b!1098829 (= res!733036 call!45857)))

(assert (=> b!1098829 (=> (not res!733036) (not e!627237))))

(declare-fun b!1098830 () Bool)

(declare-fun e!627239 () ListLongMap!15277)

(declare-fun call!45856 () ListLongMap!15277)

(assert (=> b!1098830 (= e!627239 call!45856)))

(declare-fun bm!45854 () Bool)

(declare-fun c!108793 () Bool)

(declare-fun call!45862 () ListLongMap!15277)

(declare-fun c!108794 () Bool)

(assert (=> bm!45854 (= call!45862 (+!3390 (ite c!108794 call!45858 (ite c!108793 call!45861 call!45856)) (ite (or c!108794 c!108793) (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098831 () Bool)

(declare-fun call!45859 () ListLongMap!15277)

(assert (=> b!1098831 (= e!627239 call!45859)))

(declare-fun b!1098832 () Bool)

(assert (=> b!1098832 (= e!627236 (not call!45857))))

(declare-fun b!1098833 () Bool)

(declare-fun e!627240 () ListLongMap!15277)

(assert (=> b!1098833 (= e!627240 call!45859)))

(declare-fun bm!45855 () Bool)

(declare-fun lt!491164 () ListLongMap!15277)

(assert (=> bm!45855 (= call!45860 (contains!6401 lt!491164 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098834 () Bool)

(declare-fun e!627246 () Bool)

(declare-fun e!627245 () Bool)

(assert (=> b!1098834 (= e!627246 e!627245)))

(declare-fun res!733032 () Bool)

(assert (=> b!1098834 (=> (not res!733032) (not e!627245))))

(assert (=> b!1098834 (= res!733032 (contains!6401 lt!491164 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(assert (=> b!1098834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(declare-fun bm!45856 () Bool)

(assert (=> bm!45856 (= call!45859 call!45862)))

(declare-fun b!1098835 () Bool)

(assert (=> b!1098835 (= e!627242 (not call!45860))))

(declare-fun b!1098827 () Bool)

(declare-fun e!627248 () Unit!36095)

(declare-fun Unit!36100 () Unit!36095)

(assert (=> b!1098827 (= e!627248 Unit!36100)))

(declare-fun d!130763 () Bool)

(declare-fun e!627241 () Bool)

(assert (=> d!130763 e!627241))

(declare-fun res!733029 () Bool)

(assert (=> d!130763 (=> (not res!733029) (not e!627241))))

(assert (=> d!130763 (= res!733029 (or (bvsge #b00000000000000000000000000000000 (size!34789 lt!491007)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))))

(declare-fun lt!491160 () ListLongMap!15277)

(assert (=> d!130763 (= lt!491164 lt!491160)))

(declare-fun lt!491154 () Unit!36095)

(assert (=> d!130763 (= lt!491154 e!627248)))

(declare-fun c!108792 () Bool)

(declare-fun e!627247 () Bool)

(assert (=> d!130763 (= c!108792 e!627247)))

(declare-fun res!733028 () Bool)

(assert (=> d!130763 (=> (not res!733028) (not e!627247))))

(assert (=> d!130763 (= res!733028 (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(declare-fun e!627244 () ListLongMap!15277)

(assert (=> d!130763 (= lt!491160 e!627244)))

(assert (=> d!130763 (= c!108794 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130763 (validMask!0 mask!1414)))

(assert (=> d!130763 (= (getCurrentListMap!4366 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491164)))

(declare-fun b!1098836 () Bool)

(declare-fun lt!491152 () Unit!36095)

(assert (=> b!1098836 (= e!627248 lt!491152)))

(declare-fun lt!491155 () ListLongMap!15277)

(assert (=> b!1098836 (= lt!491155 (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491157 () (_ BitVec 64))

(assert (=> b!1098836 (= lt!491157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491150 () (_ BitVec 64))

(assert (=> b!1098836 (= lt!491150 (select (arr!34252 lt!491007) #b00000000000000000000000000000000))))

(declare-fun lt!491163 () Unit!36095)

(assert (=> b!1098836 (= lt!491163 (addStillContains!656 lt!491155 lt!491157 zeroValue!831 lt!491150))))

(assert (=> b!1098836 (contains!6401 (+!3390 lt!491155 (tuple2!17301 lt!491157 zeroValue!831)) lt!491150)))

(declare-fun lt!491144 () Unit!36095)

(assert (=> b!1098836 (= lt!491144 lt!491163)))

(declare-fun lt!491149 () ListLongMap!15277)

(assert (=> b!1098836 (= lt!491149 (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491146 () (_ BitVec 64))

(assert (=> b!1098836 (= lt!491146 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491145 () (_ BitVec 64))

(assert (=> b!1098836 (= lt!491145 (select (arr!34252 lt!491007) #b00000000000000000000000000000000))))

(declare-fun lt!491159 () Unit!36095)

(assert (=> b!1098836 (= lt!491159 (addApplyDifferent!512 lt!491149 lt!491146 minValue!831 lt!491145))))

(assert (=> b!1098836 (= (apply!952 (+!3390 lt!491149 (tuple2!17301 lt!491146 minValue!831)) lt!491145) (apply!952 lt!491149 lt!491145))))

(declare-fun lt!491162 () Unit!36095)

(assert (=> b!1098836 (= lt!491162 lt!491159)))

(declare-fun lt!491147 () ListLongMap!15277)

(assert (=> b!1098836 (= lt!491147 (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491156 () (_ BitVec 64))

(assert (=> b!1098836 (= lt!491156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491158 () (_ BitVec 64))

(assert (=> b!1098836 (= lt!491158 (select (arr!34252 lt!491007) #b00000000000000000000000000000000))))

(declare-fun lt!491161 () Unit!36095)

(assert (=> b!1098836 (= lt!491161 (addApplyDifferent!512 lt!491147 lt!491156 zeroValue!831 lt!491158))))

(assert (=> b!1098836 (= (apply!952 (+!3390 lt!491147 (tuple2!17301 lt!491156 zeroValue!831)) lt!491158) (apply!952 lt!491147 lt!491158))))

(declare-fun lt!491153 () Unit!36095)

(assert (=> b!1098836 (= lt!491153 lt!491161)))

(declare-fun lt!491143 () ListLongMap!15277)

(assert (=> b!1098836 (= lt!491143 (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491148 () (_ BitVec 64))

(assert (=> b!1098836 (= lt!491148 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491151 () (_ BitVec 64))

(assert (=> b!1098836 (= lt!491151 (select (arr!34252 lt!491007) #b00000000000000000000000000000000))))

(assert (=> b!1098836 (= lt!491152 (addApplyDifferent!512 lt!491143 lt!491148 minValue!831 lt!491151))))

(assert (=> b!1098836 (= (apply!952 (+!3390 lt!491143 (tuple2!17301 lt!491148 minValue!831)) lt!491151) (apply!952 lt!491143 lt!491151))))

(declare-fun bm!45857 () Bool)

(assert (=> bm!45857 (= call!45856 call!45861)))

(declare-fun b!1098837 () Bool)

(assert (=> b!1098837 (= e!627245 (= (apply!952 lt!491164 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)) (get!17640 (select (arr!34251 lt!491010) #b00000000000000000000000000000000) (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34788 lt!491010)))))

(assert (=> b!1098837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(declare-fun b!1098838 () Bool)

(declare-fun res!733033 () Bool)

(assert (=> b!1098838 (=> (not res!733033) (not e!627241))))

(assert (=> b!1098838 (= res!733033 e!627246)))

(declare-fun res!733035 () Bool)

(assert (=> b!1098838 (=> res!733035 e!627246)))

(declare-fun e!627238 () Bool)

(assert (=> b!1098838 (= res!733035 (not e!627238))))

(declare-fun res!733030 () Bool)

(assert (=> b!1098838 (=> (not res!733030) (not e!627238))))

(assert (=> b!1098838 (= res!733030 (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(declare-fun b!1098839 () Bool)

(declare-fun res!733031 () Bool)

(assert (=> b!1098839 (=> (not res!733031) (not e!627241))))

(assert (=> b!1098839 (= res!733031 e!627242)))

(declare-fun c!108790 () Bool)

(assert (=> b!1098839 (= c!108790 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1098840 () Bool)

(assert (=> b!1098840 (= e!627244 e!627240)))

(assert (=> b!1098840 (= c!108793 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1098841 () Bool)

(assert (=> b!1098841 (= e!627237 (= (apply!952 lt!491164 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098842 () Bool)

(declare-fun c!108795 () Bool)

(assert (=> b!1098842 (= c!108795 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1098842 (= e!627240 e!627239)))

(declare-fun bm!45858 () Bool)

(assert (=> bm!45858 (= call!45857 (contains!6401 lt!491164 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098843 () Bool)

(assert (=> b!1098843 (= e!627247 (validKeyInArray!0 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(declare-fun bm!45859 () Bool)

(assert (=> bm!45859 (= call!45858 (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098844 () Bool)

(assert (=> b!1098844 (= e!627238 (validKeyInArray!0 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(declare-fun b!1098845 () Bool)

(assert (=> b!1098845 (= e!627244 (+!3390 call!45862 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1098846 () Bool)

(assert (=> b!1098846 (= e!627243 (= (apply!952 lt!491164 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1098847 () Bool)

(assert (=> b!1098847 (= e!627241 e!627236)))

(declare-fun c!108791 () Bool)

(assert (=> b!1098847 (= c!108791 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130763 c!108794) b!1098845))

(assert (= (and d!130763 (not c!108794)) b!1098840))

(assert (= (and b!1098840 c!108793) b!1098833))

(assert (= (and b!1098840 (not c!108793)) b!1098842))

(assert (= (and b!1098842 c!108795) b!1098831))

(assert (= (and b!1098842 (not c!108795)) b!1098830))

(assert (= (or b!1098831 b!1098830) bm!45857))

(assert (= (or b!1098833 bm!45857) bm!45853))

(assert (= (or b!1098833 b!1098831) bm!45856))

(assert (= (or b!1098845 bm!45853) bm!45859))

(assert (= (or b!1098845 bm!45856) bm!45854))

(assert (= (and d!130763 res!733028) b!1098843))

(assert (= (and d!130763 c!108792) b!1098836))

(assert (= (and d!130763 (not c!108792)) b!1098827))

(assert (= (and d!130763 res!733029) b!1098838))

(assert (= (and b!1098838 res!733030) b!1098844))

(assert (= (and b!1098838 (not res!733035)) b!1098834))

(assert (= (and b!1098834 res!733032) b!1098837))

(assert (= (and b!1098838 res!733033) b!1098839))

(assert (= (and b!1098839 c!108790) b!1098828))

(assert (= (and b!1098839 (not c!108790)) b!1098835))

(assert (= (and b!1098828 res!733034) b!1098846))

(assert (= (or b!1098828 b!1098835) bm!45855))

(assert (= (and b!1098839 res!733031) b!1098847))

(assert (= (and b!1098847 c!108791) b!1098829))

(assert (= (and b!1098847 (not c!108791)) b!1098832))

(assert (= (and b!1098829 res!733036) b!1098841))

(assert (= (or b!1098829 b!1098832) bm!45858))

(declare-fun b_lambda!17743 () Bool)

(assert (=> (not b_lambda!17743) (not b!1098837)))

(assert (=> b!1098837 t!34026))

(declare-fun b_and!36817 () Bool)

(assert (= b_and!36815 (and (=> t!34026 result!16377) b_and!36817)))

(declare-fun m!1018673 () Bool)

(assert (=> b!1098845 m!1018673))

(assert (=> bm!45859 m!1018489))

(declare-fun m!1018675 () Bool)

(assert (=> bm!45854 m!1018675))

(assert (=> b!1098837 m!1018607))

(declare-fun m!1018677 () Bool)

(assert (=> b!1098837 m!1018677))

(assert (=> b!1098837 m!1018497))

(declare-fun m!1018679 () Bool)

(assert (=> b!1098837 m!1018679))

(assert (=> b!1098837 m!1018497))

(declare-fun m!1018681 () Bool)

(assert (=> b!1098837 m!1018681))

(assert (=> b!1098837 m!1018679))

(assert (=> b!1098837 m!1018607))

(assert (=> b!1098834 m!1018607))

(assert (=> b!1098834 m!1018607))

(declare-fun m!1018683 () Bool)

(assert (=> b!1098834 m!1018683))

(assert (=> b!1098844 m!1018607))

(assert (=> b!1098844 m!1018607))

(assert (=> b!1098844 m!1018615))

(declare-fun m!1018685 () Bool)

(assert (=> bm!45855 m!1018685))

(assert (=> b!1098843 m!1018607))

(assert (=> b!1098843 m!1018607))

(assert (=> b!1098843 m!1018615))

(assert (=> d!130763 m!1018473))

(declare-fun m!1018687 () Bool)

(assert (=> b!1098846 m!1018687))

(declare-fun m!1018689 () Bool)

(assert (=> b!1098841 m!1018689))

(declare-fun m!1018691 () Bool)

(assert (=> bm!45858 m!1018691))

(declare-fun m!1018693 () Bool)

(assert (=> b!1098836 m!1018693))

(declare-fun m!1018695 () Bool)

(assert (=> b!1098836 m!1018695))

(declare-fun m!1018697 () Bool)

(assert (=> b!1098836 m!1018697))

(declare-fun m!1018699 () Bool)

(assert (=> b!1098836 m!1018699))

(declare-fun m!1018701 () Bool)

(assert (=> b!1098836 m!1018701))

(declare-fun m!1018703 () Bool)

(assert (=> b!1098836 m!1018703))

(declare-fun m!1018705 () Bool)

(assert (=> b!1098836 m!1018705))

(declare-fun m!1018707 () Bool)

(assert (=> b!1098836 m!1018707))

(declare-fun m!1018709 () Bool)

(assert (=> b!1098836 m!1018709))

(assert (=> b!1098836 m!1018607))

(assert (=> b!1098836 m!1018699))

(declare-fun m!1018711 () Bool)

(assert (=> b!1098836 m!1018711))

(assert (=> b!1098836 m!1018701))

(declare-fun m!1018713 () Bool)

(assert (=> b!1098836 m!1018713))

(declare-fun m!1018715 () Bool)

(assert (=> b!1098836 m!1018715))

(declare-fun m!1018717 () Bool)

(assert (=> b!1098836 m!1018717))

(declare-fun m!1018719 () Bool)

(assert (=> b!1098836 m!1018719))

(assert (=> b!1098836 m!1018703))

(assert (=> b!1098836 m!1018489))

(assert (=> b!1098836 m!1018707))

(declare-fun m!1018721 () Bool)

(assert (=> b!1098836 m!1018721))

(assert (=> b!1098650 d!130763))

(declare-fun d!130765 () Bool)

(declare-fun lt!491167 () ListLongMap!15277)

(assert (=> d!130765 (not (contains!6401 lt!491167 k0!904))))

(declare-fun removeStrictlySorted!76 (List!23924 (_ BitVec 64)) List!23924)

(assert (=> d!130765 (= lt!491167 (ListLongMap!15278 (removeStrictlySorted!76 (toList!7654 lt!491012) k0!904)))))

(assert (=> d!130765 (= (-!928 lt!491012 k0!904) lt!491167)))

(declare-fun bs!32274 () Bool)

(assert (= bs!32274 d!130765))

(declare-fun m!1018723 () Bool)

(assert (=> bs!32274 m!1018723))

(declare-fun m!1018725 () Bool)

(assert (=> bs!32274 m!1018725))

(assert (=> b!1098650 d!130765))

(declare-fun b!1098872 () Bool)

(declare-fun e!627267 () ListLongMap!15277)

(declare-fun e!627263 () ListLongMap!15277)

(assert (=> b!1098872 (= e!627267 e!627263)))

(declare-fun c!108807 () Bool)

(assert (=> b!1098872 (= c!108807 (validKeyInArray!0 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098874 () Bool)

(declare-fun call!45865 () ListLongMap!15277)

(assert (=> b!1098874 (= e!627263 call!45865)))

(declare-fun b!1098875 () Bool)

(assert (=> b!1098875 (= e!627267 (ListLongMap!15278 Nil!23921))))

(declare-fun b!1098876 () Bool)

(assert (=> b!1098876 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(assert (=> b!1098876 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34788 _values!874)))))

(declare-fun e!627266 () Bool)

(declare-fun lt!491187 () ListLongMap!15277)

(assert (=> b!1098876 (= e!627266 (= (apply!952 lt!491187 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)) (get!17640 (select (arr!34251 _values!874) #b00000000000000000000000000000000) (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1098877 () Bool)

(declare-fun e!627269 () Bool)

(assert (=> b!1098877 (= e!627269 e!627266)))

(assert (=> b!1098877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(declare-fun res!733047 () Bool)

(assert (=> b!1098877 (= res!733047 (contains!6401 lt!491187 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098877 (=> (not res!733047) (not e!627266))))

(declare-fun b!1098878 () Bool)

(declare-fun e!627264 () Bool)

(assert (=> b!1098878 (= e!627264 e!627269)))

(declare-fun c!108806 () Bool)

(declare-fun e!627268 () Bool)

(assert (=> b!1098878 (= c!108806 e!627268)))

(declare-fun res!733045 () Bool)

(assert (=> b!1098878 (=> (not res!733045) (not e!627268))))

(assert (=> b!1098878 (= res!733045 (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(declare-fun b!1098879 () Bool)

(declare-fun lt!491184 () Unit!36095)

(declare-fun lt!491188 () Unit!36095)

(assert (=> b!1098879 (= lt!491184 lt!491188)))

(declare-fun lt!491186 () (_ BitVec 64))

(declare-fun lt!491182 () ListLongMap!15277)

(declare-fun lt!491183 () (_ BitVec 64))

(declare-fun lt!491185 () V!41281)

(assert (=> b!1098879 (not (contains!6401 (+!3390 lt!491182 (tuple2!17301 lt!491183 lt!491185)) lt!491186))))

(declare-fun addStillNotContains!273 (ListLongMap!15277 (_ BitVec 64) V!41281 (_ BitVec 64)) Unit!36095)

(assert (=> b!1098879 (= lt!491188 (addStillNotContains!273 lt!491182 lt!491183 lt!491185 lt!491186))))

(assert (=> b!1098879 (= lt!491186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098879 (= lt!491185 (get!17640 (select (arr!34251 _values!874) #b00000000000000000000000000000000) (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098879 (= lt!491183 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098879 (= lt!491182 call!45865)))

(assert (=> b!1098879 (= e!627263 (+!3390 call!45865 (tuple2!17301 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000) (get!17640 (select (arr!34251 _values!874) #b00000000000000000000000000000000) (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1098873 () Bool)

(assert (=> b!1098873 (= e!627268 (validKeyInArray!0 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098873 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130767 () Bool)

(assert (=> d!130767 e!627264))

(declare-fun res!733048 () Bool)

(assert (=> d!130767 (=> (not res!733048) (not e!627264))))

(assert (=> d!130767 (= res!733048 (not (contains!6401 lt!491187 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130767 (= lt!491187 e!627267)))

(declare-fun c!108804 () Bool)

(assert (=> d!130767 (= c!108804 (bvsge #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(assert (=> d!130767 (validMask!0 mask!1414)))

(assert (=> d!130767 (= (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491187)))

(declare-fun b!1098880 () Bool)

(declare-fun e!627265 () Bool)

(declare-fun isEmpty!965 (ListLongMap!15277) Bool)

(assert (=> b!1098880 (= e!627265 (isEmpty!965 lt!491187))))

(declare-fun b!1098881 () Bool)

(assert (=> b!1098881 (= e!627269 e!627265)))

(declare-fun c!108805 () Bool)

(assert (=> b!1098881 (= c!108805 (bvslt #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(declare-fun b!1098882 () Bool)

(declare-fun res!733046 () Bool)

(assert (=> b!1098882 (=> (not res!733046) (not e!627264))))

(assert (=> b!1098882 (= res!733046 (not (contains!6401 lt!491187 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45862 () Bool)

(assert (=> bm!45862 (= call!45865 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1098883 () Bool)

(assert (=> b!1098883 (= e!627265 (= lt!491187 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(assert (= (and d!130767 c!108804) b!1098875))

(assert (= (and d!130767 (not c!108804)) b!1098872))

(assert (= (and b!1098872 c!108807) b!1098879))

(assert (= (and b!1098872 (not c!108807)) b!1098874))

(assert (= (or b!1098879 b!1098874) bm!45862))

(assert (= (and d!130767 res!733048) b!1098882))

(assert (= (and b!1098882 res!733046) b!1098878))

(assert (= (and b!1098878 res!733045) b!1098873))

(assert (= (and b!1098878 c!108806) b!1098877))

(assert (= (and b!1098878 (not c!108806)) b!1098881))

(assert (= (and b!1098877 res!733047) b!1098876))

(assert (= (and b!1098881 c!108805) b!1098883))

(assert (= (and b!1098881 (not c!108805)) b!1098880))

(declare-fun b_lambda!17745 () Bool)

(assert (=> (not b_lambda!17745) (not b!1098876)))

(assert (=> b!1098876 t!34026))

(declare-fun b_and!36819 () Bool)

(assert (= b_and!36817 (and (=> t!34026 result!16377) b_and!36819)))

(declare-fun b_lambda!17747 () Bool)

(assert (=> (not b_lambda!17747) (not b!1098879)))

(assert (=> b!1098879 t!34026))

(declare-fun b_and!36821 () Bool)

(assert (= b_and!36819 (and (=> t!34026 result!16377) b_and!36821)))

(assert (=> b!1098876 m!1018497))

(assert (=> b!1098876 m!1018627))

(assert (=> b!1098876 m!1018497))

(assert (=> b!1098876 m!1018629))

(assert (=> b!1098876 m!1018617))

(declare-fun m!1018727 () Bool)

(assert (=> b!1098876 m!1018727))

(assert (=> b!1098876 m!1018617))

(assert (=> b!1098876 m!1018627))

(declare-fun m!1018729 () Bool)

(assert (=> bm!45862 m!1018729))

(assert (=> b!1098872 m!1018617))

(assert (=> b!1098872 m!1018617))

(assert (=> b!1098872 m!1018633))

(assert (=> b!1098883 m!1018729))

(declare-fun m!1018731 () Bool)

(assert (=> b!1098882 m!1018731))

(assert (=> b!1098879 m!1018497))

(declare-fun m!1018733 () Bool)

(assert (=> b!1098879 m!1018733))

(declare-fun m!1018735 () Bool)

(assert (=> b!1098879 m!1018735))

(assert (=> b!1098879 m!1018627))

(assert (=> b!1098879 m!1018497))

(assert (=> b!1098879 m!1018629))

(assert (=> b!1098879 m!1018733))

(declare-fun m!1018737 () Bool)

(assert (=> b!1098879 m!1018737))

(assert (=> b!1098879 m!1018617))

(declare-fun m!1018739 () Bool)

(assert (=> b!1098879 m!1018739))

(assert (=> b!1098879 m!1018627))

(declare-fun m!1018741 () Bool)

(assert (=> d!130767 m!1018741))

(assert (=> d!130767 m!1018473))

(assert (=> b!1098873 m!1018617))

(assert (=> b!1098873 m!1018617))

(assert (=> b!1098873 m!1018633))

(assert (=> b!1098877 m!1018617))

(assert (=> b!1098877 m!1018617))

(declare-fun m!1018743 () Bool)

(assert (=> b!1098877 m!1018743))

(declare-fun m!1018745 () Bool)

(assert (=> b!1098880 m!1018745))

(assert (=> b!1098650 d!130767))

(declare-fun d!130769 () Bool)

(assert (=> d!130769 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491191 () Unit!36095)

(declare-fun choose!13 (array!71173 (_ BitVec 64) (_ BitVec 32)) Unit!36095)

(assert (=> d!130769 (= lt!491191 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130769 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130769 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!491191)))

(declare-fun bs!32275 () Bool)

(assert (= bs!32275 d!130769))

(assert (=> bs!32275 m!1018491))

(declare-fun m!1018747 () Bool)

(assert (=> bs!32275 m!1018747))

(assert (=> b!1098650 d!130769))

(declare-fun b!1098884 () Bool)

(declare-fun e!627274 () ListLongMap!15277)

(declare-fun e!627270 () ListLongMap!15277)

(assert (=> b!1098884 (= e!627274 e!627270)))

(declare-fun c!108811 () Bool)

(assert (=> b!1098884 (= c!108811 (validKeyInArray!0 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(declare-fun b!1098886 () Bool)

(declare-fun call!45866 () ListLongMap!15277)

(assert (=> b!1098886 (= e!627270 call!45866)))

(declare-fun b!1098887 () Bool)

(assert (=> b!1098887 (= e!627274 (ListLongMap!15278 Nil!23921))))

(declare-fun b!1098888 () Bool)

(assert (=> b!1098888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(assert (=> b!1098888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34788 lt!491010)))))

(declare-fun e!627273 () Bool)

(declare-fun lt!491197 () ListLongMap!15277)

(assert (=> b!1098888 (= e!627273 (= (apply!952 lt!491197 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)) (get!17640 (select (arr!34251 lt!491010) #b00000000000000000000000000000000) (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1098889 () Bool)

(declare-fun e!627276 () Bool)

(assert (=> b!1098889 (= e!627276 e!627273)))

(assert (=> b!1098889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(declare-fun res!733051 () Bool)

(assert (=> b!1098889 (= res!733051 (contains!6401 lt!491197 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(assert (=> b!1098889 (=> (not res!733051) (not e!627273))))

(declare-fun b!1098890 () Bool)

(declare-fun e!627271 () Bool)

(assert (=> b!1098890 (= e!627271 e!627276)))

(declare-fun c!108810 () Bool)

(declare-fun e!627275 () Bool)

(assert (=> b!1098890 (= c!108810 e!627275)))

(declare-fun res!733049 () Bool)

(assert (=> b!1098890 (=> (not res!733049) (not e!627275))))

(assert (=> b!1098890 (= res!733049 (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(declare-fun b!1098891 () Bool)

(declare-fun lt!491194 () Unit!36095)

(declare-fun lt!491198 () Unit!36095)

(assert (=> b!1098891 (= lt!491194 lt!491198)))

(declare-fun lt!491192 () ListLongMap!15277)

(declare-fun lt!491193 () (_ BitVec 64))

(declare-fun lt!491195 () V!41281)

(declare-fun lt!491196 () (_ BitVec 64))

(assert (=> b!1098891 (not (contains!6401 (+!3390 lt!491192 (tuple2!17301 lt!491193 lt!491195)) lt!491196))))

(assert (=> b!1098891 (= lt!491198 (addStillNotContains!273 lt!491192 lt!491193 lt!491195 lt!491196))))

(assert (=> b!1098891 (= lt!491196 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098891 (= lt!491195 (get!17640 (select (arr!34251 lt!491010) #b00000000000000000000000000000000) (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098891 (= lt!491193 (select (arr!34252 lt!491007) #b00000000000000000000000000000000))))

(assert (=> b!1098891 (= lt!491192 call!45866)))

(assert (=> b!1098891 (= e!627270 (+!3390 call!45866 (tuple2!17301 (select (arr!34252 lt!491007) #b00000000000000000000000000000000) (get!17640 (select (arr!34251 lt!491010) #b00000000000000000000000000000000) (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1098885 () Bool)

(assert (=> b!1098885 (= e!627275 (validKeyInArray!0 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(assert (=> b!1098885 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130771 () Bool)

(assert (=> d!130771 e!627271))

(declare-fun res!733052 () Bool)

(assert (=> d!130771 (=> (not res!733052) (not e!627271))))

(assert (=> d!130771 (= res!733052 (not (contains!6401 lt!491197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130771 (= lt!491197 e!627274)))

(declare-fun c!108808 () Bool)

(assert (=> d!130771 (= c!108808 (bvsge #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(assert (=> d!130771 (validMask!0 mask!1414)))

(assert (=> d!130771 (= (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491197)))

(declare-fun b!1098892 () Bool)

(declare-fun e!627272 () Bool)

(assert (=> b!1098892 (= e!627272 (isEmpty!965 lt!491197))))

(declare-fun b!1098893 () Bool)

(assert (=> b!1098893 (= e!627276 e!627272)))

(declare-fun c!108809 () Bool)

(assert (=> b!1098893 (= c!108809 (bvslt #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(declare-fun b!1098894 () Bool)

(declare-fun res!733050 () Bool)

(assert (=> b!1098894 (=> (not res!733050) (not e!627271))))

(assert (=> b!1098894 (= res!733050 (not (contains!6401 lt!491197 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45863 () Bool)

(assert (=> bm!45863 (= call!45866 (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1098895 () Bool)

(assert (=> b!1098895 (= e!627272 (= lt!491197 (getCurrentListMapNoExtraKeys!4207 lt!491007 lt!491010 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(assert (= (and d!130771 c!108808) b!1098887))

(assert (= (and d!130771 (not c!108808)) b!1098884))

(assert (= (and b!1098884 c!108811) b!1098891))

(assert (= (and b!1098884 (not c!108811)) b!1098886))

(assert (= (or b!1098891 b!1098886) bm!45863))

(assert (= (and d!130771 res!733052) b!1098894))

(assert (= (and b!1098894 res!733050) b!1098890))

(assert (= (and b!1098890 res!733049) b!1098885))

(assert (= (and b!1098890 c!108810) b!1098889))

(assert (= (and b!1098890 (not c!108810)) b!1098893))

(assert (= (and b!1098889 res!733051) b!1098888))

(assert (= (and b!1098893 c!108809) b!1098895))

(assert (= (and b!1098893 (not c!108809)) b!1098892))

(declare-fun b_lambda!17749 () Bool)

(assert (=> (not b_lambda!17749) (not b!1098888)))

(assert (=> b!1098888 t!34026))

(declare-fun b_and!36823 () Bool)

(assert (= b_and!36821 (and (=> t!34026 result!16377) b_and!36823)))

(declare-fun b_lambda!17751 () Bool)

(assert (=> (not b_lambda!17751) (not b!1098891)))

(assert (=> b!1098891 t!34026))

(declare-fun b_and!36825 () Bool)

(assert (= b_and!36823 (and (=> t!34026 result!16377) b_and!36825)))

(assert (=> b!1098888 m!1018497))

(assert (=> b!1098888 m!1018679))

(assert (=> b!1098888 m!1018497))

(assert (=> b!1098888 m!1018681))

(assert (=> b!1098888 m!1018607))

(declare-fun m!1018749 () Bool)

(assert (=> b!1098888 m!1018749))

(assert (=> b!1098888 m!1018607))

(assert (=> b!1098888 m!1018679))

(declare-fun m!1018751 () Bool)

(assert (=> bm!45863 m!1018751))

(assert (=> b!1098884 m!1018607))

(assert (=> b!1098884 m!1018607))

(assert (=> b!1098884 m!1018615))

(assert (=> b!1098895 m!1018751))

(declare-fun m!1018753 () Bool)

(assert (=> b!1098894 m!1018753))

(assert (=> b!1098891 m!1018497))

(declare-fun m!1018755 () Bool)

(assert (=> b!1098891 m!1018755))

(declare-fun m!1018757 () Bool)

(assert (=> b!1098891 m!1018757))

(assert (=> b!1098891 m!1018679))

(assert (=> b!1098891 m!1018497))

(assert (=> b!1098891 m!1018681))

(assert (=> b!1098891 m!1018755))

(declare-fun m!1018759 () Bool)

(assert (=> b!1098891 m!1018759))

(assert (=> b!1098891 m!1018607))

(declare-fun m!1018761 () Bool)

(assert (=> b!1098891 m!1018761))

(assert (=> b!1098891 m!1018679))

(declare-fun m!1018763 () Bool)

(assert (=> d!130771 m!1018763))

(assert (=> d!130771 m!1018473))

(assert (=> b!1098885 m!1018607))

(assert (=> b!1098885 m!1018607))

(assert (=> b!1098885 m!1018615))

(assert (=> b!1098889 m!1018607))

(assert (=> b!1098889 m!1018607))

(declare-fun m!1018765 () Bool)

(assert (=> b!1098889 m!1018765))

(declare-fun m!1018767 () Bool)

(assert (=> b!1098892 m!1018767))

(assert (=> b!1098650 d!130771))

(declare-fun b!1098902 () Bool)

(declare-fun e!627281 () Bool)

(declare-fun e!627282 () Bool)

(assert (=> b!1098902 (= e!627281 e!627282)))

(declare-fun c!108814 () Bool)

(assert (=> b!1098902 (= c!108814 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun d!130773 () Bool)

(assert (=> d!130773 e!627281))

(declare-fun res!733055 () Bool)

(assert (=> d!130773 (=> (not res!733055) (not e!627281))))

(assert (=> d!130773 (= res!733055 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34789 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34789 _keys!1070))))))))

(declare-fun lt!491201 () Unit!36095)

(declare-fun choose!1766 (array!71173 array!71171 (_ BitVec 32) (_ BitVec 32) V!41281 V!41281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36095)

(assert (=> d!130773 (= lt!491201 (choose!1766 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(assert (=> d!130773 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!200 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!491201)))

(declare-fun b!1098903 () Bool)

(declare-fun call!45871 () ListLongMap!15277)

(declare-fun call!45872 () ListLongMap!15277)

(assert (=> b!1098903 (= e!627282 (= call!45871 (-!928 call!45872 k0!904)))))

(assert (=> b!1098903 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34788 _values!874)))))

(declare-fun b!1098904 () Bool)

(assert (=> b!1098904 (= e!627282 (= call!45871 call!45872))))

(assert (=> b!1098904 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34788 _values!874)))))

(declare-fun bm!45868 () Bool)

(assert (=> bm!45868 (= call!45872 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!45869 () Bool)

(assert (=> bm!45869 (= call!45871 (getCurrentListMapNoExtraKeys!4207 (array!71174 (store (arr!34252 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34789 _keys!1070)) (array!71172 (store (arr!34251 _values!874) i!650 (ValueCellFull!12848 (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34788 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130773 res!733055) b!1098902))

(assert (= (and b!1098902 c!108814) b!1098903))

(assert (= (and b!1098902 (not c!108814)) b!1098904))

(assert (= (or b!1098903 b!1098904) bm!45868))

(assert (= (or b!1098903 b!1098904) bm!45869))

(declare-fun b_lambda!17753 () Bool)

(assert (=> (not b_lambda!17753) (not bm!45869)))

(assert (=> bm!45869 t!34026))

(declare-fun b_and!36827 () Bool)

(assert (= b_and!36825 (and (=> t!34026 result!16377) b_and!36827)))

(declare-fun m!1018769 () Bool)

(assert (=> d!130773 m!1018769))

(declare-fun m!1018771 () Bool)

(assert (=> b!1098903 m!1018771))

(assert (=> bm!45868 m!1018495))

(assert (=> bm!45869 m!1018469))

(assert (=> bm!45869 m!1018497))

(assert (=> bm!45869 m!1018487))

(declare-fun m!1018773 () Bool)

(assert (=> bm!45869 m!1018773))

(assert (=> b!1098650 d!130773))

(declare-fun d!130775 () Bool)

(assert (=> d!130775 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098660 d!130775))

(declare-fun d!130777 () Bool)

(declare-fun e!627285 () Bool)

(assert (=> d!130777 e!627285))

(declare-fun res!733060 () Bool)

(assert (=> d!130777 (=> (not res!733060) (not e!627285))))

(declare-fun lt!491213 () ListLongMap!15277)

(assert (=> d!130777 (= res!733060 (contains!6401 lt!491213 (_1!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lt!491210 () List!23924)

(assert (=> d!130777 (= lt!491213 (ListLongMap!15278 lt!491210))))

(declare-fun lt!491211 () Unit!36095)

(declare-fun lt!491212 () Unit!36095)

(assert (=> d!130777 (= lt!491211 lt!491212)))

(declare-datatypes ((Option!665 0))(
  ( (Some!664 (v!16234 V!41281)) (None!663) )
))
(declare-fun getValueByKey!614 (List!23924 (_ BitVec 64)) Option!665)

(assert (=> d!130777 (= (getValueByKey!614 lt!491210 (_1!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!664 (_2!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!296 (List!23924 (_ BitVec 64) V!41281) Unit!36095)

(assert (=> d!130777 (= lt!491212 (lemmaContainsTupThenGetReturnValue!296 lt!491210 (_1!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun insertStrictlySorted!389 (List!23924 (_ BitVec 64) V!41281) List!23924)

(assert (=> d!130777 (= lt!491210 (insertStrictlySorted!389 (toList!7654 (+!3390 lt!491011 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (_1!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(assert (=> d!130777 (= (+!3390 (+!3390 lt!491011 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) lt!491213)))

(declare-fun b!1098909 () Bool)

(declare-fun res!733061 () Bool)

(assert (=> b!1098909 (=> (not res!733061) (not e!627285))))

(assert (=> b!1098909 (= res!733061 (= (getValueByKey!614 (toList!7654 lt!491213) (_1!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!664 (_2!8661 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))))

(declare-fun b!1098910 () Bool)

(declare-fun contains!6402 (List!23924 tuple2!17300) Bool)

(assert (=> b!1098910 (= e!627285 (contains!6402 (toList!7654 lt!491213) (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(assert (= (and d!130777 res!733060) b!1098909))

(assert (= (and b!1098909 res!733061) b!1098910))

(declare-fun m!1018775 () Bool)

(assert (=> d!130777 m!1018775))

(declare-fun m!1018777 () Bool)

(assert (=> d!130777 m!1018777))

(declare-fun m!1018779 () Bool)

(assert (=> d!130777 m!1018779))

(declare-fun m!1018781 () Bool)

(assert (=> d!130777 m!1018781))

(declare-fun m!1018783 () Bool)

(assert (=> b!1098909 m!1018783))

(declare-fun m!1018785 () Bool)

(assert (=> b!1098910 m!1018785))

(assert (=> b!1098655 d!130777))

(declare-fun d!130779 () Bool)

(declare-fun e!627286 () Bool)

(assert (=> d!130779 e!627286))

(declare-fun res!733062 () Bool)

(assert (=> d!130779 (=> (not res!733062) (not e!627286))))

(declare-fun lt!491217 () ListLongMap!15277)

(assert (=> d!130779 (= res!733062 (contains!6401 lt!491217 (_1!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lt!491214 () List!23924)

(assert (=> d!130779 (= lt!491217 (ListLongMap!15278 lt!491214))))

(declare-fun lt!491215 () Unit!36095)

(declare-fun lt!491216 () Unit!36095)

(assert (=> d!130779 (= lt!491215 lt!491216)))

(assert (=> d!130779 (= (getValueByKey!614 lt!491214 (_1!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!664 (_2!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130779 (= lt!491216 (lemmaContainsTupThenGetReturnValue!296 lt!491214 (_1!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130779 (= lt!491214 (insertStrictlySorted!389 (toList!7654 lt!491011) (_1!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130779 (= (+!3390 lt!491011 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) lt!491217)))

(declare-fun b!1098911 () Bool)

(declare-fun res!733063 () Bool)

(assert (=> b!1098911 (=> (not res!733063) (not e!627286))))

(assert (=> b!1098911 (= res!733063 (= (getValueByKey!614 (toList!7654 lt!491217) (_1!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!664 (_2!8661 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))))

(declare-fun b!1098912 () Bool)

(assert (=> b!1098912 (= e!627286 (contains!6402 (toList!7654 lt!491217) (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(assert (= (and d!130779 res!733062) b!1098911))

(assert (= (and b!1098911 res!733063) b!1098912))

(declare-fun m!1018787 () Bool)

(assert (=> d!130779 m!1018787))

(declare-fun m!1018789 () Bool)

(assert (=> d!130779 m!1018789))

(declare-fun m!1018791 () Bool)

(assert (=> d!130779 m!1018791))

(declare-fun m!1018793 () Bool)

(assert (=> d!130779 m!1018793))

(declare-fun m!1018795 () Bool)

(assert (=> b!1098911 m!1018795))

(declare-fun m!1018797 () Bool)

(assert (=> b!1098912 m!1018797))

(assert (=> b!1098655 d!130779))

(declare-fun b!1098923 () Bool)

(declare-fun e!627296 () Bool)

(declare-fun e!627295 () Bool)

(assert (=> b!1098923 (= e!627296 e!627295)))

(declare-fun c!108817 () Bool)

(assert (=> b!1098923 (= c!108817 (validKeyInArray!0 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45872 () Bool)

(declare-fun call!45875 () Bool)

(assert (=> bm!45872 (= call!45875 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108817 (Cons!23921 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000) Nil!23922) Nil!23922)))))

(declare-fun d!130781 () Bool)

(declare-fun res!733072 () Bool)

(declare-fun e!627297 () Bool)

(assert (=> d!130781 (=> res!733072 e!627297)))

(assert (=> d!130781 (= res!733072 (bvsge #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(assert (=> d!130781 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23922) e!627297)))

(declare-fun b!1098924 () Bool)

(assert (=> b!1098924 (= e!627295 call!45875)))

(declare-fun b!1098925 () Bool)

(declare-fun e!627298 () Bool)

(declare-fun contains!6403 (List!23925 (_ BitVec 64)) Bool)

(assert (=> b!1098925 (= e!627298 (contains!6403 Nil!23922 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098926 () Bool)

(assert (=> b!1098926 (= e!627295 call!45875)))

(declare-fun b!1098927 () Bool)

(assert (=> b!1098927 (= e!627297 e!627296)))

(declare-fun res!733071 () Bool)

(assert (=> b!1098927 (=> (not res!733071) (not e!627296))))

(assert (=> b!1098927 (= res!733071 (not e!627298))))

(declare-fun res!733070 () Bool)

(assert (=> b!1098927 (=> (not res!733070) (not e!627298))))

(assert (=> b!1098927 (= res!733070 (validKeyInArray!0 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130781 (not res!733072)) b!1098927))

(assert (= (and b!1098927 res!733070) b!1098925))

(assert (= (and b!1098927 res!733071) b!1098923))

(assert (= (and b!1098923 c!108817) b!1098926))

(assert (= (and b!1098923 (not c!108817)) b!1098924))

(assert (= (or b!1098926 b!1098924) bm!45872))

(assert (=> b!1098923 m!1018617))

(assert (=> b!1098923 m!1018617))

(assert (=> b!1098923 m!1018633))

(assert (=> bm!45872 m!1018617))

(declare-fun m!1018799 () Bool)

(assert (=> bm!45872 m!1018799))

(assert (=> b!1098925 m!1018617))

(assert (=> b!1098925 m!1018617))

(declare-fun m!1018801 () Bool)

(assert (=> b!1098925 m!1018801))

(assert (=> b!1098927 m!1018617))

(assert (=> b!1098927 m!1018617))

(assert (=> b!1098927 m!1018633))

(assert (=> b!1098653 d!130781))

(declare-fun d!130783 () Bool)

(assert (=> d!130783 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96722 d!130783))

(declare-fun d!130785 () Bool)

(assert (=> d!130785 (= (array_inv!26414 _keys!1070) (bvsge (size!34789 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96722 d!130785))

(declare-fun d!130787 () Bool)

(assert (=> d!130787 (= (array_inv!26415 _values!874) (bvsge (size!34788 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96722 d!130787))

(declare-fun b!1098928 () Bool)

(declare-fun e!627300 () Bool)

(declare-fun e!627299 () Bool)

(assert (=> b!1098928 (= e!627300 e!627299)))

(declare-fun c!108818 () Bool)

(assert (=> b!1098928 (= c!108818 (validKeyInArray!0 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(declare-fun bm!45873 () Bool)

(declare-fun call!45876 () Bool)

(assert (=> bm!45873 (= call!45876 (arrayNoDuplicates!0 lt!491007 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108818 (Cons!23921 (select (arr!34252 lt!491007) #b00000000000000000000000000000000) Nil!23922) Nil!23922)))))

(declare-fun d!130789 () Bool)

(declare-fun res!733075 () Bool)

(declare-fun e!627301 () Bool)

(assert (=> d!130789 (=> res!733075 e!627301)))

(assert (=> d!130789 (= res!733075 (bvsge #b00000000000000000000000000000000 (size!34789 lt!491007)))))

(assert (=> d!130789 (= (arrayNoDuplicates!0 lt!491007 #b00000000000000000000000000000000 Nil!23922) e!627301)))

(declare-fun b!1098929 () Bool)

(assert (=> b!1098929 (= e!627299 call!45876)))

(declare-fun b!1098930 () Bool)

(declare-fun e!627302 () Bool)

(assert (=> b!1098930 (= e!627302 (contains!6403 Nil!23922 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(declare-fun b!1098931 () Bool)

(assert (=> b!1098931 (= e!627299 call!45876)))

(declare-fun b!1098932 () Bool)

(assert (=> b!1098932 (= e!627301 e!627300)))

(declare-fun res!733074 () Bool)

(assert (=> b!1098932 (=> (not res!733074) (not e!627300))))

(assert (=> b!1098932 (= res!733074 (not e!627302))))

(declare-fun res!733073 () Bool)

(assert (=> b!1098932 (=> (not res!733073) (not e!627302))))

(assert (=> b!1098932 (= res!733073 (validKeyInArray!0 (select (arr!34252 lt!491007) #b00000000000000000000000000000000)))))

(assert (= (and d!130789 (not res!733075)) b!1098932))

(assert (= (and b!1098932 res!733073) b!1098930))

(assert (= (and b!1098932 res!733074) b!1098928))

(assert (= (and b!1098928 c!108818) b!1098931))

(assert (= (and b!1098928 (not c!108818)) b!1098929))

(assert (= (or b!1098931 b!1098929) bm!45873))

(assert (=> b!1098928 m!1018607))

(assert (=> b!1098928 m!1018607))

(assert (=> b!1098928 m!1018615))

(assert (=> bm!45873 m!1018607))

(declare-fun m!1018803 () Bool)

(assert (=> bm!45873 m!1018803))

(assert (=> b!1098930 m!1018607))

(assert (=> b!1098930 m!1018607))

(declare-fun m!1018805 () Bool)

(assert (=> b!1098930 m!1018805))

(assert (=> b!1098932 m!1018607))

(assert (=> b!1098932 m!1018607))

(assert (=> b!1098932 m!1018615))

(assert (=> b!1098652 d!130789))

(declare-fun b!1098933 () Bool)

(declare-fun e!627305 () Bool)

(declare-fun call!45877 () Bool)

(assert (=> b!1098933 (= e!627305 call!45877)))

(declare-fun bm!45874 () Bool)

(assert (=> bm!45874 (= call!45877 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!130791 () Bool)

(declare-fun res!733076 () Bool)

(declare-fun e!627303 () Bool)

(assert (=> d!130791 (=> res!733076 e!627303)))

(assert (=> d!130791 (= res!733076 (bvsge #b00000000000000000000000000000000 (size!34789 _keys!1070)))))

(assert (=> d!130791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627303)))

(declare-fun b!1098934 () Bool)

(declare-fun e!627304 () Bool)

(assert (=> b!1098934 (= e!627305 e!627304)))

(declare-fun lt!491219 () (_ BitVec 64))

(assert (=> b!1098934 (= lt!491219 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491218 () Unit!36095)

(assert (=> b!1098934 (= lt!491218 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!491219 #b00000000000000000000000000000000))))

(assert (=> b!1098934 (arrayContainsKey!0 _keys!1070 lt!491219 #b00000000000000000000000000000000)))

(declare-fun lt!491220 () Unit!36095)

(assert (=> b!1098934 (= lt!491220 lt!491218)))

(declare-fun res!733077 () Bool)

(assert (=> b!1098934 (= res!733077 (= (seekEntryOrOpen!0 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9862 #b00000000000000000000000000000000)))))

(assert (=> b!1098934 (=> (not res!733077) (not e!627304))))

(declare-fun b!1098935 () Bool)

(assert (=> b!1098935 (= e!627304 call!45877)))

(declare-fun b!1098936 () Bool)

(assert (=> b!1098936 (= e!627303 e!627305)))

(declare-fun c!108819 () Bool)

(assert (=> b!1098936 (= c!108819 (validKeyInArray!0 (select (arr!34252 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130791 (not res!733076)) b!1098936))

(assert (= (and b!1098936 c!108819) b!1098934))

(assert (= (and b!1098936 (not c!108819)) b!1098933))

(assert (= (and b!1098934 res!733077) b!1098935))

(assert (= (or b!1098935 b!1098933) bm!45874))

(declare-fun m!1018807 () Bool)

(assert (=> bm!45874 m!1018807))

(assert (=> b!1098934 m!1018617))

(declare-fun m!1018809 () Bool)

(assert (=> b!1098934 m!1018809))

(declare-fun m!1018811 () Bool)

(assert (=> b!1098934 m!1018811))

(assert (=> b!1098934 m!1018617))

(declare-fun m!1018813 () Bool)

(assert (=> b!1098934 m!1018813))

(assert (=> b!1098936 m!1018617))

(assert (=> b!1098936 m!1018617))

(assert (=> b!1098936 m!1018633))

(assert (=> b!1098658 d!130791))

(declare-fun mapNonEmpty!42442 () Bool)

(declare-fun mapRes!42442 () Bool)

(declare-fun tp!81137 () Bool)

(declare-fun e!627311 () Bool)

(assert (=> mapNonEmpty!42442 (= mapRes!42442 (and tp!81137 e!627311))))

(declare-fun mapKey!42442 () (_ BitVec 32))

(declare-fun mapValue!42442 () ValueCell!12848)

(declare-fun mapRest!42442 () (Array (_ BitVec 32) ValueCell!12848))

(assert (=> mapNonEmpty!42442 (= mapRest!42433 (store mapRest!42442 mapKey!42442 mapValue!42442))))

(declare-fun b!1098944 () Bool)

(declare-fun e!627310 () Bool)

(assert (=> b!1098944 (= e!627310 tp_is_empty!27115)))

(declare-fun mapIsEmpty!42442 () Bool)

(assert (=> mapIsEmpty!42442 mapRes!42442))

(declare-fun condMapEmpty!42442 () Bool)

(declare-fun mapDefault!42442 () ValueCell!12848)

(assert (=> mapNonEmpty!42433 (= condMapEmpty!42442 (= mapRest!42433 ((as const (Array (_ BitVec 32) ValueCell!12848)) mapDefault!42442)))))

(assert (=> mapNonEmpty!42433 (= tp!81122 (and e!627310 mapRes!42442))))

(declare-fun b!1098943 () Bool)

(assert (=> b!1098943 (= e!627311 tp_is_empty!27115)))

(assert (= (and mapNonEmpty!42433 condMapEmpty!42442) mapIsEmpty!42442))

(assert (= (and mapNonEmpty!42433 (not condMapEmpty!42442)) mapNonEmpty!42442))

(assert (= (and mapNonEmpty!42442 ((_ is ValueCellFull!12848) mapValue!42442)) b!1098943))

(assert (= (and mapNonEmpty!42433 ((_ is ValueCellFull!12848) mapDefault!42442)) b!1098944))

(declare-fun m!1018815 () Bool)

(assert (=> mapNonEmpty!42442 m!1018815))

(declare-fun b_lambda!17755 () Bool)

(assert (= b_lambda!17753 (or (and start!96722 b_free!23065) b_lambda!17755)))

(declare-fun b_lambda!17757 () Bool)

(assert (= b_lambda!17747 (or (and start!96722 b_free!23065) b_lambda!17757)))

(declare-fun b_lambda!17759 () Bool)

(assert (= b_lambda!17743 (or (and start!96722 b_free!23065) b_lambda!17759)))

(declare-fun b_lambda!17761 () Bool)

(assert (= b_lambda!17741 (or (and start!96722 b_free!23065) b_lambda!17761)))

(declare-fun b_lambda!17763 () Bool)

(assert (= b_lambda!17751 (or (and start!96722 b_free!23065) b_lambda!17763)))

(declare-fun b_lambda!17765 () Bool)

(assert (= b_lambda!17749 (or (and start!96722 b_free!23065) b_lambda!17765)))

(declare-fun b_lambda!17767 () Bool)

(assert (= b_lambda!17745 (or (and start!96722 b_free!23065) b_lambda!17767)))

(check-sat (not b!1098877) (not d!130761) (not b!1098889) (not mapNonEmpty!42442) (not b!1098836) (not b!1098843) (not b!1098911) (not b!1098880) (not b_lambda!17739) (not b!1098932) (not b!1098909) (not bm!45831) (not b_lambda!17757) (not b!1098910) (not b!1098816) (not bm!45852) (not bm!45868) (not d!130769) (not b!1098927) (not b!1098873) (not b!1098813) (not b!1098825) (not bm!45847) (not b!1098834) (not bm!45848) (not b!1098888) (not d!130763) tp_is_empty!27115 (not b!1098928) (not bm!45858) (not b!1098879) (not b!1098824) (not b!1098823) (not b!1098763) (not b!1098755) (not b!1098837) (not b!1098936) (not b!1098882) (not bm!45872) (not b!1098883) (not bm!45855) (not d!130771) (not b!1098885) (not b_lambda!17759) (not d!130773) (not b!1098892) (not b!1098815) (not d!130779) (not b!1098884) (not b!1098757) (not bm!45862) (not b!1098925) (not bm!45873) (not b!1098876) (not bm!45854) (not bm!45863) (not bm!45859) (not b_next!23065) (not bm!45851) (not b_lambda!17765) (not b!1098912) (not b!1098822) (not b!1098930) (not b!1098934) (not d!130767) (not b!1098844) (not b!1098894) (not b!1098846) (not b_lambda!17763) (not b!1098845) (not b!1098891) (not b!1098903) (not b!1098820) (not b!1098923) (not b_lambda!17761) (not b!1098841) (not b!1098872) (not bm!45869) (not bm!45874) (not d!130765) (not b_lambda!17767) (not b!1098895) b_and!36827 (not b_lambda!17755) (not d!130777))
(check-sat b_and!36827 (not b_next!23065))
