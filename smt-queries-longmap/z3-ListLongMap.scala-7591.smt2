; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96102 () Bool)

(assert start!96102)

(declare-fun b_free!22519 () Bool)

(declare-fun b_next!22519 () Bool)

(assert (=> start!96102 (= b_free!22519 (not b_next!22519))))

(declare-fun tp!79405 () Bool)

(declare-fun b_and!35723 () Bool)

(assert (=> start!96102 (= tp!79405 b_and!35723)))

(declare-fun b!1086476 () Bool)

(declare-fun res!724005 () Bool)

(declare-fun e!620776 () Bool)

(assert (=> b!1086476 (=> (not res!724005) (not e!620776))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70017 0))(
  ( (array!70018 (arr!33676 (Array (_ BitVec 32) (_ BitVec 64))) (size!34213 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70017)

(declare-datatypes ((V!40489 0))(
  ( (V!40490 (val!13317 Int)) )
))
(declare-datatypes ((ValueCell!12551 0))(
  ( (ValueCellFull!12551 (v!15934 V!40489)) (EmptyCell!12551) )
))
(declare-datatypes ((array!70019 0))(
  ( (array!70020 (arr!33677 (Array (_ BitVec 32) ValueCell!12551)) (size!34214 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70019)

(assert (=> b!1086476 (= res!724005 (and (= (size!34214 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34213 _keys!1070) (size!34214 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086477 () Bool)

(declare-fun res!724003 () Bool)

(assert (=> b!1086477 (=> (not res!724003) (not e!620776))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086477 (= res!724003 (validKeyInArray!0 k0!904))))

(declare-fun b!1086478 () Bool)

(declare-fun e!620771 () Bool)

(declare-fun e!620773 () Bool)

(assert (=> b!1086478 (= e!620771 (not e!620773))))

(declare-fun res!724007 () Bool)

(assert (=> b!1086478 (=> res!724007 e!620773)))

(assert (=> b!1086478 (= res!724007 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40489)

(declare-datatypes ((tuple2!16890 0))(
  ( (tuple2!16891 (_1!8456 (_ BitVec 64)) (_2!8456 V!40489)) )
))
(declare-datatypes ((List!23489 0))(
  ( (Nil!23486) (Cons!23485 (h!24703 tuple2!16890) (t!33058 List!23489)) )
))
(declare-datatypes ((ListLongMap!14867 0))(
  ( (ListLongMap!14868 (toList!7449 List!23489)) )
))
(declare-fun lt!481874 () ListLongMap!14867)

(declare-fun zeroValue!831 () V!40489)

(declare-fun getCurrentListMap!4221 (array!70017 array!70019 (_ BitVec 32) (_ BitVec 32) V!40489 V!40489 (_ BitVec 32) Int) ListLongMap!14867)

(assert (=> b!1086478 (= lt!481874 (getCurrentListMap!4221 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481878 () ListLongMap!14867)

(declare-fun lt!481873 () array!70017)

(declare-fun lt!481872 () array!70019)

(assert (=> b!1086478 (= lt!481878 (getCurrentListMap!4221 lt!481873 lt!481872 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481867 () ListLongMap!14867)

(declare-fun lt!481876 () ListLongMap!14867)

(assert (=> b!1086478 (and (= lt!481867 lt!481876) (= lt!481876 lt!481867))))

(declare-fun lt!481868 () ListLongMap!14867)

(declare-fun -!761 (ListLongMap!14867 (_ BitVec 64)) ListLongMap!14867)

(assert (=> b!1086478 (= lt!481876 (-!761 lt!481868 k0!904))))

(declare-datatypes ((Unit!35689 0))(
  ( (Unit!35690) )
))
(declare-fun lt!481870 () Unit!35689)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!50 (array!70017 array!70019 (_ BitVec 32) (_ BitVec 32) V!40489 V!40489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35689)

(assert (=> b!1086478 (= lt!481870 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!50 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4026 (array!70017 array!70019 (_ BitVec 32) (_ BitVec 32) V!40489 V!40489 (_ BitVec 32) Int) ListLongMap!14867)

(assert (=> b!1086478 (= lt!481867 (getCurrentListMapNoExtraKeys!4026 lt!481873 lt!481872 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2147 (Int (_ BitVec 64)) V!40489)

(assert (=> b!1086478 (= lt!481872 (array!70020 (store (arr!33677 _values!874) i!650 (ValueCellFull!12551 (dynLambda!2147 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34214 _values!874)))))

(assert (=> b!1086478 (= lt!481868 (getCurrentListMapNoExtraKeys!4026 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086478 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481862 () Unit!35689)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70017 (_ BitVec 64) (_ BitVec 32)) Unit!35689)

(assert (=> b!1086478 (= lt!481862 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41536 () Bool)

(declare-fun mapRes!41536 () Bool)

(declare-fun tp!79406 () Bool)

(declare-fun e!620772 () Bool)

(assert (=> mapNonEmpty!41536 (= mapRes!41536 (and tp!79406 e!620772))))

(declare-fun mapRest!41536 () (Array (_ BitVec 32) ValueCell!12551))

(declare-fun mapValue!41536 () ValueCell!12551)

(declare-fun mapKey!41536 () (_ BitVec 32))

(assert (=> mapNonEmpty!41536 (= (arr!33677 _values!874) (store mapRest!41536 mapKey!41536 mapValue!41536))))

(declare-fun b!1086480 () Bool)

(declare-fun res!724009 () Bool)

(assert (=> b!1086480 (=> (not res!724009) (not e!620776))))

(declare-datatypes ((List!23490 0))(
  ( (Nil!23487) (Cons!23486 (h!24704 (_ BitVec 64)) (t!33059 List!23490)) )
))
(declare-fun arrayNoDuplicates!0 (array!70017 (_ BitVec 32) List!23490) Bool)

(assert (=> b!1086480 (= res!724009 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23487))))

(declare-fun mapIsEmpty!41536 () Bool)

(assert (=> mapIsEmpty!41536 mapRes!41536))

(declare-fun b!1086481 () Bool)

(declare-fun res!724008 () Bool)

(assert (=> b!1086481 (=> (not res!724008) (not e!620776))))

(assert (=> b!1086481 (= res!724008 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34213 _keys!1070))))))

(declare-fun b!1086482 () Bool)

(declare-fun tp_is_empty!26521 () Bool)

(assert (=> b!1086482 (= e!620772 tp_is_empty!26521)))

(declare-fun b!1086483 () Bool)

(declare-fun e!620774 () Bool)

(assert (=> b!1086483 (= e!620774 true)))

(declare-fun lt!481865 () ListLongMap!14867)

(declare-fun lt!481864 () tuple2!16890)

(declare-fun lt!481877 () ListLongMap!14867)

(declare-fun +!3274 (ListLongMap!14867 tuple2!16890) ListLongMap!14867)

(assert (=> b!1086483 (= (-!761 lt!481865 k0!904) (+!3274 lt!481877 lt!481864))))

(declare-fun lt!481863 () Unit!35689)

(declare-fun lt!481866 () ListLongMap!14867)

(declare-fun addRemoveCommutativeForDiffKeys!8 (ListLongMap!14867 (_ BitVec 64) V!40489 (_ BitVec 64)) Unit!35689)

(assert (=> b!1086483 (= lt!481863 (addRemoveCommutativeForDiffKeys!8 lt!481866 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086484 () Bool)

(declare-fun e!620777 () Bool)

(assert (=> b!1086484 (= e!620777 tp_is_empty!26521)))

(declare-fun b!1086479 () Bool)

(declare-fun res!724011 () Bool)

(assert (=> b!1086479 (=> (not res!724011) (not e!620776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70017 (_ BitVec 32)) Bool)

(assert (=> b!1086479 (= res!724011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!724006 () Bool)

(assert (=> start!96102 (=> (not res!724006) (not e!620776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96102 (= res!724006 (validMask!0 mask!1414))))

(assert (=> start!96102 e!620776))

(assert (=> start!96102 tp!79405))

(assert (=> start!96102 true))

(assert (=> start!96102 tp_is_empty!26521))

(declare-fun array_inv!26034 (array!70017) Bool)

(assert (=> start!96102 (array_inv!26034 _keys!1070)))

(declare-fun e!620770 () Bool)

(declare-fun array_inv!26035 (array!70019) Bool)

(assert (=> start!96102 (and (array_inv!26035 _values!874) e!620770)))

(declare-fun b!1086485 () Bool)

(assert (=> b!1086485 (= e!620773 e!620774)))

(declare-fun res!724001 () Bool)

(assert (=> b!1086485 (=> res!724001 e!620774)))

(assert (=> b!1086485 (= res!724001 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481871 () ListLongMap!14867)

(assert (=> b!1086485 (= lt!481877 lt!481871)))

(assert (=> b!1086485 (= lt!481877 (-!761 lt!481866 k0!904))))

(declare-fun lt!481869 () Unit!35689)

(assert (=> b!1086485 (= lt!481869 (addRemoveCommutativeForDiffKeys!8 lt!481868 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1086485 (= lt!481878 (+!3274 lt!481871 lt!481864))))

(declare-fun lt!481875 () tuple2!16890)

(assert (=> b!1086485 (= lt!481871 (+!3274 lt!481876 lt!481875))))

(assert (=> b!1086485 (= lt!481874 lt!481865)))

(assert (=> b!1086485 (= lt!481865 (+!3274 lt!481866 lt!481864))))

(assert (=> b!1086485 (= lt!481866 (+!3274 lt!481868 lt!481875))))

(assert (=> b!1086485 (= lt!481878 (+!3274 (+!3274 lt!481867 lt!481875) lt!481864))))

(assert (=> b!1086485 (= lt!481864 (tuple2!16891 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086485 (= lt!481875 (tuple2!16891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086486 () Bool)

(assert (=> b!1086486 (= e!620776 e!620771)))

(declare-fun res!724004 () Bool)

(assert (=> b!1086486 (=> (not res!724004) (not e!620771))))

(assert (=> b!1086486 (= res!724004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481873 mask!1414))))

(assert (=> b!1086486 (= lt!481873 (array!70018 (store (arr!33676 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34213 _keys!1070)))))

(declare-fun b!1086487 () Bool)

(declare-fun res!724002 () Bool)

(assert (=> b!1086487 (=> (not res!724002) (not e!620776))))

(assert (=> b!1086487 (= res!724002 (= (select (arr!33676 _keys!1070) i!650) k0!904))))

(declare-fun b!1086488 () Bool)

(assert (=> b!1086488 (= e!620770 (and e!620777 mapRes!41536))))

(declare-fun condMapEmpty!41536 () Bool)

(declare-fun mapDefault!41536 () ValueCell!12551)

(assert (=> b!1086488 (= condMapEmpty!41536 (= (arr!33677 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12551)) mapDefault!41536)))))

(declare-fun b!1086489 () Bool)

(declare-fun res!724010 () Bool)

(assert (=> b!1086489 (=> (not res!724010) (not e!620771))))

(assert (=> b!1086489 (= res!724010 (arrayNoDuplicates!0 lt!481873 #b00000000000000000000000000000000 Nil!23487))))

(assert (= (and start!96102 res!724006) b!1086476))

(assert (= (and b!1086476 res!724005) b!1086479))

(assert (= (and b!1086479 res!724011) b!1086480))

(assert (= (and b!1086480 res!724009) b!1086481))

(assert (= (and b!1086481 res!724008) b!1086477))

(assert (= (and b!1086477 res!724003) b!1086487))

(assert (= (and b!1086487 res!724002) b!1086486))

(assert (= (and b!1086486 res!724004) b!1086489))

(assert (= (and b!1086489 res!724010) b!1086478))

(assert (= (and b!1086478 (not res!724007)) b!1086485))

(assert (= (and b!1086485 (not res!724001)) b!1086483))

(assert (= (and b!1086488 condMapEmpty!41536) mapIsEmpty!41536))

(assert (= (and b!1086488 (not condMapEmpty!41536)) mapNonEmpty!41536))

(get-info :version)

(assert (= (and mapNonEmpty!41536 ((_ is ValueCellFull!12551) mapValue!41536)) b!1086482))

(assert (= (and b!1086488 ((_ is ValueCellFull!12551) mapDefault!41536)) b!1086484))

(assert (= start!96102 b!1086488))

(declare-fun b_lambda!17199 () Bool)

(assert (=> (not b_lambda!17199) (not b!1086478)))

(declare-fun t!33057 () Bool)

(declare-fun tb!7389 () Bool)

(assert (=> (and start!96102 (= defaultEntry!882 defaultEntry!882) t!33057) tb!7389))

(declare-fun result!15305 () Bool)

(assert (=> tb!7389 (= result!15305 tp_is_empty!26521)))

(assert (=> b!1086478 t!33057))

(declare-fun b_and!35725 () Bool)

(assert (= b_and!35723 (and (=> t!33057 result!15305) b_and!35725)))

(declare-fun m!1004735 () Bool)

(assert (=> b!1086478 m!1004735))

(declare-fun m!1004737 () Bool)

(assert (=> b!1086478 m!1004737))

(declare-fun m!1004739 () Bool)

(assert (=> b!1086478 m!1004739))

(declare-fun m!1004741 () Bool)

(assert (=> b!1086478 m!1004741))

(declare-fun m!1004743 () Bool)

(assert (=> b!1086478 m!1004743))

(declare-fun m!1004745 () Bool)

(assert (=> b!1086478 m!1004745))

(declare-fun m!1004747 () Bool)

(assert (=> b!1086478 m!1004747))

(declare-fun m!1004749 () Bool)

(assert (=> b!1086478 m!1004749))

(declare-fun m!1004751 () Bool)

(assert (=> b!1086478 m!1004751))

(declare-fun m!1004753 () Bool)

(assert (=> b!1086478 m!1004753))

(declare-fun m!1004755 () Bool)

(assert (=> b!1086483 m!1004755))

(declare-fun m!1004757 () Bool)

(assert (=> b!1086483 m!1004757))

(declare-fun m!1004759 () Bool)

(assert (=> b!1086483 m!1004759))

(declare-fun m!1004761 () Bool)

(assert (=> b!1086485 m!1004761))

(declare-fun m!1004763 () Bool)

(assert (=> b!1086485 m!1004763))

(declare-fun m!1004765 () Bool)

(assert (=> b!1086485 m!1004765))

(declare-fun m!1004767 () Bool)

(assert (=> b!1086485 m!1004767))

(declare-fun m!1004769 () Bool)

(assert (=> b!1086485 m!1004769))

(assert (=> b!1086485 m!1004761))

(declare-fun m!1004771 () Bool)

(assert (=> b!1086485 m!1004771))

(declare-fun m!1004773 () Bool)

(assert (=> b!1086485 m!1004773))

(declare-fun m!1004775 () Bool)

(assert (=> b!1086485 m!1004775))

(declare-fun m!1004777 () Bool)

(assert (=> b!1086486 m!1004777))

(declare-fun m!1004779 () Bool)

(assert (=> b!1086486 m!1004779))

(declare-fun m!1004781 () Bool)

(assert (=> b!1086489 m!1004781))

(declare-fun m!1004783 () Bool)

(assert (=> start!96102 m!1004783))

(declare-fun m!1004785 () Bool)

(assert (=> start!96102 m!1004785))

(declare-fun m!1004787 () Bool)

(assert (=> start!96102 m!1004787))

(declare-fun m!1004789 () Bool)

(assert (=> b!1086477 m!1004789))

(declare-fun m!1004791 () Bool)

(assert (=> b!1086480 m!1004791))

(declare-fun m!1004793 () Bool)

(assert (=> b!1086487 m!1004793))

(declare-fun m!1004795 () Bool)

(assert (=> mapNonEmpty!41536 m!1004795))

(declare-fun m!1004797 () Bool)

(assert (=> b!1086479 m!1004797))

(check-sat (not b!1086489) (not b_next!22519) (not b!1086486) b_and!35725 (not b!1086485) (not b!1086480) (not b!1086477) (not b!1086478) (not b!1086483) (not mapNonEmpty!41536) (not b_lambda!17199) (not start!96102) (not b!1086479) tp_is_empty!26521)
(check-sat b_and!35725 (not b_next!22519))
