; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95880 () Bool)

(assert start!95880)

(declare-fun b_free!22533 () Bool)

(declare-fun b_next!22533 () Bool)

(assert (=> start!95880 (= b_free!22533 (not b_next!22533))))

(declare-fun tp!79447 () Bool)

(declare-fun b_and!35741 () Bool)

(assert (=> start!95880 (= tp!79447 b_and!35741)))

(declare-fun b!1085457 () Bool)

(declare-fun res!723718 () Bool)

(declare-fun e!620086 () Bool)

(assert (=> b!1085457 (=> (not res!723718) (not e!620086))))

(declare-datatypes ((array!70005 0))(
  ( (array!70006 (arr!33676 (Array (_ BitVec 32) (_ BitVec 64))) (size!34212 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70005)

(declare-datatypes ((List!23483 0))(
  ( (Nil!23480) (Cons!23479 (h!24688 (_ BitVec 64)) (t!33074 List!23483)) )
))
(declare-fun arrayNoDuplicates!0 (array!70005 (_ BitVec 32) List!23483) Bool)

(assert (=> b!1085457 (= res!723718 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23480))))

(declare-fun b!1085458 () Bool)

(declare-fun e!620088 () Bool)

(assert (=> b!1085458 (= e!620086 e!620088)))

(declare-fun res!723717 () Bool)

(assert (=> b!1085458 (=> (not res!723717) (not e!620088))))

(declare-fun lt!481707 () array!70005)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70005 (_ BitVec 32)) Bool)

(assert (=> b!1085458 (= res!723717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481707 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085458 (= lt!481707 (array!70006 (store (arr!33676 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34212 _keys!1070)))))

(declare-fun b!1085459 () Bool)

(declare-fun res!723713 () Bool)

(assert (=> b!1085459 (=> (not res!723713) (not e!620086))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40507 0))(
  ( (V!40508 (val!13324 Int)) )
))
(declare-datatypes ((ValueCell!12558 0))(
  ( (ValueCellFull!12558 (v!15945 V!40507)) (EmptyCell!12558) )
))
(declare-datatypes ((array!70007 0))(
  ( (array!70008 (arr!33677 (Array (_ BitVec 32) ValueCell!12558)) (size!34213 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70007)

(assert (=> b!1085459 (= res!723713 (and (= (size!34213 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34212 _keys!1070) (size!34213 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41557 () Bool)

(declare-fun mapRes!41557 () Bool)

(declare-fun tp!79448 () Bool)

(declare-fun e!620090 () Bool)

(assert (=> mapNonEmpty!41557 (= mapRes!41557 (and tp!79448 e!620090))))

(declare-fun mapKey!41557 () (_ BitVec 32))

(declare-fun mapRest!41557 () (Array (_ BitVec 32) ValueCell!12558))

(declare-fun mapValue!41557 () ValueCell!12558)

(assert (=> mapNonEmpty!41557 (= (arr!33677 _values!874) (store mapRest!41557 mapKey!41557 mapValue!41557))))

(declare-fun b!1085460 () Bool)

(declare-fun res!723715 () Bool)

(assert (=> b!1085460 (=> (not res!723715) (not e!620086))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085460 (= res!723715 (validKeyInArray!0 k0!904))))

(declare-fun b!1085461 () Bool)

(declare-fun res!723714 () Bool)

(assert (=> b!1085461 (=> (not res!723714) (not e!620086))))

(assert (=> b!1085461 (= res!723714 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34212 _keys!1070))))))

(declare-fun b!1085462 () Bool)

(declare-fun e!620087 () Bool)

(declare-fun e!620085 () Bool)

(assert (=> b!1085462 (= e!620087 (and e!620085 mapRes!41557))))

(declare-fun condMapEmpty!41557 () Bool)

(declare-fun mapDefault!41557 () ValueCell!12558)

(assert (=> b!1085462 (= condMapEmpty!41557 (= (arr!33677 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12558)) mapDefault!41557)))))

(declare-fun b!1085463 () Bool)

(declare-fun e!620089 () Bool)

(assert (=> b!1085463 (= e!620088 (not e!620089))))

(declare-fun res!723711 () Bool)

(assert (=> b!1085463 (=> res!723711 e!620089)))

(assert (=> b!1085463 (= res!723711 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40507)

(declare-datatypes ((tuple2!16894 0))(
  ( (tuple2!16895 (_1!8458 (_ BitVec 64)) (_2!8458 V!40507)) )
))
(declare-datatypes ((List!23484 0))(
  ( (Nil!23481) (Cons!23480 (h!24689 tuple2!16894) (t!33075 List!23484)) )
))
(declare-datatypes ((ListLongMap!14863 0))(
  ( (ListLongMap!14864 (toList!7447 List!23484)) )
))
(declare-fun lt!481712 () ListLongMap!14863)

(declare-fun zeroValue!831 () V!40507)

(declare-fun getCurrentListMap!4232 (array!70005 array!70007 (_ BitVec 32) (_ BitVec 32) V!40507 V!40507 (_ BitVec 32) Int) ListLongMap!14863)

(assert (=> b!1085463 (= lt!481712 (getCurrentListMap!4232 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481715 () ListLongMap!14863)

(declare-fun lt!481706 () array!70007)

(assert (=> b!1085463 (= lt!481715 (getCurrentListMap!4232 lt!481707 lt!481706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481713 () ListLongMap!14863)

(declare-fun lt!481719 () ListLongMap!14863)

(assert (=> b!1085463 (and (= lt!481713 lt!481719) (= lt!481719 lt!481713))))

(declare-fun lt!481704 () ListLongMap!14863)

(declare-fun -!773 (ListLongMap!14863 (_ BitVec 64)) ListLongMap!14863)

(assert (=> b!1085463 (= lt!481719 (-!773 lt!481704 k0!904))))

(declare-datatypes ((Unit!35712 0))(
  ( (Unit!35713) )
))
(declare-fun lt!481720 () Unit!35712)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!51 (array!70005 array!70007 (_ BitVec 32) (_ BitVec 32) V!40507 V!40507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35712)

(assert (=> b!1085463 (= lt!481720 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!51 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3992 (array!70005 array!70007 (_ BitVec 32) (_ BitVec 32) V!40507 V!40507 (_ BitVec 32) Int) ListLongMap!14863)

(assert (=> b!1085463 (= lt!481713 (getCurrentListMapNoExtraKeys!3992 lt!481707 lt!481706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2129 (Int (_ BitVec 64)) V!40507)

(assert (=> b!1085463 (= lt!481706 (array!70008 (store (arr!33677 _values!874) i!650 (ValueCellFull!12558 (dynLambda!2129 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34213 _values!874)))))

(assert (=> b!1085463 (= lt!481704 (getCurrentListMapNoExtraKeys!3992 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085463 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481708 () Unit!35712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70005 (_ BitVec 64) (_ BitVec 32)) Unit!35712)

(assert (=> b!1085463 (= lt!481708 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085464 () Bool)

(declare-fun res!723716 () Bool)

(assert (=> b!1085464 (=> (not res!723716) (not e!620086))))

(assert (=> b!1085464 (= res!723716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085465 () Bool)

(declare-fun tp_is_empty!26535 () Bool)

(assert (=> b!1085465 (= e!620090 tp_is_empty!26535)))

(declare-fun b!1085466 () Bool)

(declare-fun e!620084 () Bool)

(assert (=> b!1085466 (= e!620089 e!620084)))

(declare-fun res!723719 () Bool)

(assert (=> b!1085466 (=> res!723719 e!620084)))

(assert (=> b!1085466 (= res!723719 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481711 () ListLongMap!14863)

(declare-fun lt!481714 () ListLongMap!14863)

(assert (=> b!1085466 (= lt!481711 lt!481714)))

(declare-fun lt!481716 () ListLongMap!14863)

(assert (=> b!1085466 (= lt!481711 (-!773 lt!481716 k0!904))))

(declare-fun lt!481717 () Unit!35712)

(declare-fun addRemoveCommutativeForDiffKeys!11 (ListLongMap!14863 (_ BitVec 64) V!40507 (_ BitVec 64)) Unit!35712)

(assert (=> b!1085466 (= lt!481717 (addRemoveCommutativeForDiffKeys!11 lt!481704 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481718 () tuple2!16894)

(declare-fun +!3255 (ListLongMap!14863 tuple2!16894) ListLongMap!14863)

(assert (=> b!1085466 (= lt!481715 (+!3255 lt!481714 lt!481718))))

(declare-fun lt!481709 () tuple2!16894)

(assert (=> b!1085466 (= lt!481714 (+!3255 lt!481719 lt!481709))))

(declare-fun lt!481710 () ListLongMap!14863)

(assert (=> b!1085466 (= lt!481712 lt!481710)))

(assert (=> b!1085466 (= lt!481710 (+!3255 lt!481716 lt!481718))))

(assert (=> b!1085466 (= lt!481716 (+!3255 lt!481704 lt!481709))))

(assert (=> b!1085466 (= lt!481715 (+!3255 (+!3255 lt!481713 lt!481709) lt!481718))))

(assert (=> b!1085466 (= lt!481718 (tuple2!16895 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085466 (= lt!481709 (tuple2!16895 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085467 () Bool)

(assert (=> b!1085467 (= e!620085 tp_is_empty!26535)))

(declare-fun b!1085468 () Bool)

(declare-fun res!723712 () Bool)

(assert (=> b!1085468 (=> (not res!723712) (not e!620088))))

(assert (=> b!1085468 (= res!723712 (arrayNoDuplicates!0 lt!481707 #b00000000000000000000000000000000 Nil!23480))))

(declare-fun b!1085469 () Bool)

(declare-fun res!723710 () Bool)

(assert (=> b!1085469 (=> (not res!723710) (not e!620086))))

(assert (=> b!1085469 (= res!723710 (= (select (arr!33676 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41557 () Bool)

(assert (=> mapIsEmpty!41557 mapRes!41557))

(declare-fun b!1085470 () Bool)

(assert (=> b!1085470 (= e!620084 true)))

(assert (=> b!1085470 (= (-!773 lt!481710 k0!904) (+!3255 lt!481711 lt!481718))))

(declare-fun lt!481705 () Unit!35712)

(assert (=> b!1085470 (= lt!481705 (addRemoveCommutativeForDiffKeys!11 lt!481716 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun res!723720 () Bool)

(assert (=> start!95880 (=> (not res!723720) (not e!620086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95880 (= res!723720 (validMask!0 mask!1414))))

(assert (=> start!95880 e!620086))

(assert (=> start!95880 tp!79447))

(assert (=> start!95880 true))

(assert (=> start!95880 tp_is_empty!26535))

(declare-fun array_inv!25988 (array!70005) Bool)

(assert (=> start!95880 (array_inv!25988 _keys!1070)))

(declare-fun array_inv!25989 (array!70007) Bool)

(assert (=> start!95880 (and (array_inv!25989 _values!874) e!620087)))

(assert (= (and start!95880 res!723720) b!1085459))

(assert (= (and b!1085459 res!723713) b!1085464))

(assert (= (and b!1085464 res!723716) b!1085457))

(assert (= (and b!1085457 res!723718) b!1085461))

(assert (= (and b!1085461 res!723714) b!1085460))

(assert (= (and b!1085460 res!723715) b!1085469))

(assert (= (and b!1085469 res!723710) b!1085458))

(assert (= (and b!1085458 res!723717) b!1085468))

(assert (= (and b!1085468 res!723712) b!1085463))

(assert (= (and b!1085463 (not res!723711)) b!1085466))

(assert (= (and b!1085466 (not res!723719)) b!1085470))

(assert (= (and b!1085462 condMapEmpty!41557) mapIsEmpty!41557))

(assert (= (and b!1085462 (not condMapEmpty!41557)) mapNonEmpty!41557))

(get-info :version)

(assert (= (and mapNonEmpty!41557 ((_ is ValueCellFull!12558) mapValue!41557)) b!1085465))

(assert (= (and b!1085462 ((_ is ValueCellFull!12558) mapDefault!41557)) b!1085467))

(assert (= start!95880 b!1085462))

(declare-fun b_lambda!17203 () Bool)

(assert (=> (not b_lambda!17203) (not b!1085463)))

(declare-fun t!33073 () Bool)

(declare-fun tb!7411 () Bool)

(assert (=> (and start!95880 (= defaultEntry!882 defaultEntry!882) t!33073) tb!7411))

(declare-fun result!15341 () Bool)

(assert (=> tb!7411 (= result!15341 tp_is_empty!26535)))

(assert (=> b!1085463 t!33073))

(declare-fun b_and!35743 () Bool)

(assert (= b_and!35741 (and (=> t!33073 result!15341) b_and!35743)))

(declare-fun m!1003511 () Bool)

(assert (=> b!1085458 m!1003511))

(declare-fun m!1003513 () Bool)

(assert (=> b!1085458 m!1003513))

(declare-fun m!1003515 () Bool)

(assert (=> b!1085463 m!1003515))

(declare-fun m!1003517 () Bool)

(assert (=> b!1085463 m!1003517))

(declare-fun m!1003519 () Bool)

(assert (=> b!1085463 m!1003519))

(declare-fun m!1003521 () Bool)

(assert (=> b!1085463 m!1003521))

(declare-fun m!1003523 () Bool)

(assert (=> b!1085463 m!1003523))

(declare-fun m!1003525 () Bool)

(assert (=> b!1085463 m!1003525))

(declare-fun m!1003527 () Bool)

(assert (=> b!1085463 m!1003527))

(declare-fun m!1003529 () Bool)

(assert (=> b!1085463 m!1003529))

(declare-fun m!1003531 () Bool)

(assert (=> b!1085463 m!1003531))

(declare-fun m!1003533 () Bool)

(assert (=> b!1085463 m!1003533))

(declare-fun m!1003535 () Bool)

(assert (=> b!1085464 m!1003535))

(declare-fun m!1003537 () Bool)

(assert (=> b!1085469 m!1003537))

(declare-fun m!1003539 () Bool)

(assert (=> b!1085457 m!1003539))

(declare-fun m!1003541 () Bool)

(assert (=> mapNonEmpty!41557 m!1003541))

(declare-fun m!1003543 () Bool)

(assert (=> b!1085468 m!1003543))

(declare-fun m!1003545 () Bool)

(assert (=> b!1085470 m!1003545))

(declare-fun m!1003547 () Bool)

(assert (=> b!1085470 m!1003547))

(declare-fun m!1003549 () Bool)

(assert (=> b!1085470 m!1003549))

(declare-fun m!1003551 () Bool)

(assert (=> start!95880 m!1003551))

(declare-fun m!1003553 () Bool)

(assert (=> start!95880 m!1003553))

(declare-fun m!1003555 () Bool)

(assert (=> start!95880 m!1003555))

(declare-fun m!1003557 () Bool)

(assert (=> b!1085460 m!1003557))

(declare-fun m!1003559 () Bool)

(assert (=> b!1085466 m!1003559))

(declare-fun m!1003561 () Bool)

(assert (=> b!1085466 m!1003561))

(declare-fun m!1003563 () Bool)

(assert (=> b!1085466 m!1003563))

(declare-fun m!1003565 () Bool)

(assert (=> b!1085466 m!1003565))

(assert (=> b!1085466 m!1003563))

(declare-fun m!1003567 () Bool)

(assert (=> b!1085466 m!1003567))

(declare-fun m!1003569 () Bool)

(assert (=> b!1085466 m!1003569))

(declare-fun m!1003571 () Bool)

(assert (=> b!1085466 m!1003571))

(declare-fun m!1003573 () Bool)

(assert (=> b!1085466 m!1003573))

(check-sat (not b!1085457) (not mapNonEmpty!41557) (not b!1085458) (not start!95880) tp_is_empty!26535 b_and!35743 (not b!1085468) (not b!1085466) (not b!1085470) (not b!1085464) (not b!1085460) (not b_next!22533) (not b_lambda!17203) (not b!1085463))
(check-sat b_and!35743 (not b_next!22533))
