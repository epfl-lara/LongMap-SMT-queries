; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96072 () Bool)

(assert start!96072)

(declare-fun b_free!22725 () Bool)

(declare-fun b_next!22725 () Bool)

(assert (=> start!96072 (= b_free!22725 (not b_next!22725))))

(declare-fun tp!80023 () Bool)

(declare-fun b_and!36125 () Bool)

(assert (=> start!96072 (= tp!80023 b_and!36125)))

(declare-fun b!1089690 () Bool)

(declare-fun res!726892 () Bool)

(declare-fun e!622391 () Bool)

(assert (=> b!1089690 (=> (not res!726892) (not e!622391))))

(declare-datatypes ((array!70377 0))(
  ( (array!70378 (arr!33862 (Array (_ BitVec 32) (_ BitVec 64))) (size!34398 (_ BitVec 32))) )
))
(declare-fun lt!485909 () array!70377)

(declare-datatypes ((List!23639 0))(
  ( (Nil!23636) (Cons!23635 (h!24844 (_ BitVec 64)) (t!33422 List!23639)) )
))
(declare-fun arrayNoDuplicates!0 (array!70377 (_ BitVec 32) List!23639) Bool)

(assert (=> b!1089690 (= res!726892 (arrayNoDuplicates!0 lt!485909 #b00000000000000000000000000000000 Nil!23636))))

(declare-fun b!1089691 () Bool)

(declare-fun e!622387 () Bool)

(declare-fun tp_is_empty!26727 () Bool)

(assert (=> b!1089691 (= e!622387 tp_is_empty!26727)))

(declare-fun b!1089692 () Bool)

(declare-fun res!726889 () Bool)

(declare-fun e!622388 () Bool)

(assert (=> b!1089692 (=> (not res!726889) (not e!622388))))

(declare-fun _keys!1070 () array!70377)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089692 (= res!726889 (= (select (arr!33862 _keys!1070) i!650) k0!904))))

(declare-fun b!1089693 () Bool)

(declare-fun res!726893 () Bool)

(assert (=> b!1089693 (=> (not res!726893) (not e!622388))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70377 (_ BitVec 32)) Bool)

(assert (=> b!1089693 (= res!726893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41845 () Bool)

(declare-fun mapRes!41845 () Bool)

(assert (=> mapIsEmpty!41845 mapRes!41845))

(declare-fun b!1089694 () Bool)

(declare-fun e!622394 () Bool)

(assert (=> b!1089694 (= e!622394 tp_is_empty!26727)))

(declare-fun mapNonEmpty!41845 () Bool)

(declare-fun tp!80024 () Bool)

(assert (=> mapNonEmpty!41845 (= mapRes!41845 (and tp!80024 e!622387))))

(declare-fun mapKey!41845 () (_ BitVec 32))

(declare-datatypes ((V!40763 0))(
  ( (V!40764 (val!13420 Int)) )
))
(declare-datatypes ((ValueCell!12654 0))(
  ( (ValueCellFull!12654 (v!16041 V!40763)) (EmptyCell!12654) )
))
(declare-datatypes ((array!70379 0))(
  ( (array!70380 (arr!33863 (Array (_ BitVec 32) ValueCell!12654)) (size!34399 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70379)

(declare-fun mapRest!41845 () (Array (_ BitVec 32) ValueCell!12654))

(declare-fun mapValue!41845 () ValueCell!12654)

(assert (=> mapNonEmpty!41845 (= (arr!33863 _values!874) (store mapRest!41845 mapKey!41845 mapValue!41845))))

(declare-fun b!1089695 () Bool)

(declare-fun res!726887 () Bool)

(assert (=> b!1089695 (=> (not res!726887) (not e!622388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089695 (= res!726887 (validKeyInArray!0 k0!904))))

(declare-fun b!1089696 () Bool)

(declare-fun res!726897 () Bool)

(assert (=> b!1089696 (=> (not res!726897) (not e!622388))))

(assert (=> b!1089696 (= res!726897 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23636))))

(declare-fun b!1089697 () Bool)

(declare-fun res!726890 () Bool)

(assert (=> b!1089697 (=> (not res!726890) (not e!622388))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089697 (= res!726890 (and (= (size!34399 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34398 _keys!1070) (size!34399 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089698 () Bool)

(declare-fun res!726895 () Bool)

(assert (=> b!1089698 (=> (not res!726895) (not e!622388))))

(assert (=> b!1089698 (= res!726895 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34398 _keys!1070))))))

(declare-fun b!1089699 () Bool)

(declare-fun e!622390 () Bool)

(assert (=> b!1089699 (= e!622390 (and e!622394 mapRes!41845))))

(declare-fun condMapEmpty!41845 () Bool)

(declare-fun mapDefault!41845 () ValueCell!12654)

(assert (=> b!1089699 (= condMapEmpty!41845 (= (arr!33863 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12654)) mapDefault!41845)))))

(declare-fun b!1089700 () Bool)

(assert (=> b!1089700 (= e!622388 e!622391)))

(declare-fun res!726888 () Bool)

(assert (=> b!1089700 (=> (not res!726888) (not e!622391))))

(assert (=> b!1089700 (= res!726888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485909 mask!1414))))

(assert (=> b!1089700 (= lt!485909 (array!70378 (store (arr!33862 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34398 _keys!1070)))))

(declare-fun b!1089701 () Bool)

(declare-fun e!622389 () Bool)

(assert (=> b!1089701 (= e!622389 (bvsle #b00000000000000000000000000000000 (size!34398 _keys!1070)))))

(declare-datatypes ((tuple2!17050 0))(
  ( (tuple2!17051 (_1!8536 (_ BitVec 64)) (_2!8536 V!40763)) )
))
(declare-datatypes ((List!23640 0))(
  ( (Nil!23637) (Cons!23636 (h!24845 tuple2!17050) (t!33423 List!23640)) )
))
(declare-datatypes ((ListLongMap!15019 0))(
  ( (ListLongMap!15020 (toList!7525 List!23640)) )
))
(declare-fun lt!485907 () ListLongMap!15019)

(declare-fun lt!485915 () ListLongMap!15019)

(declare-fun -!850 (ListLongMap!15019 (_ BitVec 64)) ListLongMap!15019)

(assert (=> b!1089701 (= (-!850 lt!485907 k0!904) lt!485915)))

(declare-datatypes ((Unit!35866 0))(
  ( (Unit!35867) )
))
(declare-fun lt!485912 () Unit!35866)

(declare-fun lt!485906 () ListLongMap!15019)

(declare-fun zeroValue!831 () V!40763)

(declare-fun addRemoveCommutativeForDiffKeys!77 (ListLongMap!15019 (_ BitVec 64) V!40763 (_ BitVec 64)) Unit!35866)

(assert (=> b!1089701 (= lt!485912 (addRemoveCommutativeForDiffKeys!77 lt!485906 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun res!726894 () Bool)

(assert (=> start!96072 (=> (not res!726894) (not e!622388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96072 (= res!726894 (validMask!0 mask!1414))))

(assert (=> start!96072 e!622388))

(assert (=> start!96072 tp!80023))

(assert (=> start!96072 true))

(assert (=> start!96072 tp_is_empty!26727))

(declare-fun array_inv!26114 (array!70377) Bool)

(assert (=> start!96072 (array_inv!26114 _keys!1070)))

(declare-fun array_inv!26115 (array!70379) Bool)

(assert (=> start!96072 (and (array_inv!26115 _values!874) e!622390)))

(declare-fun b!1089702 () Bool)

(declare-fun e!622392 () Bool)

(assert (=> b!1089702 (= e!622391 (not e!622392))))

(declare-fun res!726891 () Bool)

(assert (=> b!1089702 (=> res!726891 e!622392)))

(assert (=> b!1089702 (= res!726891 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40763)

(declare-fun lt!485917 () ListLongMap!15019)

(declare-fun getCurrentListMap!4294 (array!70377 array!70379 (_ BitVec 32) (_ BitVec 32) V!40763 V!40763 (_ BitVec 32) Int) ListLongMap!15019)

(assert (=> b!1089702 (= lt!485917 (getCurrentListMap!4294 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485911 () ListLongMap!15019)

(declare-fun lt!485916 () array!70379)

(assert (=> b!1089702 (= lt!485911 (getCurrentListMap!4294 lt!485909 lt!485916 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485905 () ListLongMap!15019)

(declare-fun lt!485910 () ListLongMap!15019)

(assert (=> b!1089702 (and (= lt!485905 lt!485910) (= lt!485910 lt!485905))))

(assert (=> b!1089702 (= lt!485910 (-!850 lt!485906 k0!904))))

(declare-fun lt!485914 () Unit!35866)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!113 (array!70377 array!70379 (_ BitVec 32) (_ BitVec 32) V!40763 V!40763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35866)

(assert (=> b!1089702 (= lt!485914 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!113 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4054 (array!70377 array!70379 (_ BitVec 32) (_ BitVec 32) V!40763 V!40763 (_ BitVec 32) Int) ListLongMap!15019)

(assert (=> b!1089702 (= lt!485905 (getCurrentListMapNoExtraKeys!4054 lt!485909 lt!485916 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2191 (Int (_ BitVec 64)) V!40763)

(assert (=> b!1089702 (= lt!485916 (array!70380 (store (arr!33863 _values!874) i!650 (ValueCellFull!12654 (dynLambda!2191 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34399 _values!874)))))

(assert (=> b!1089702 (= lt!485906 (getCurrentListMapNoExtraKeys!4054 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089702 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485913 () Unit!35866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70377 (_ BitVec 64) (_ BitVec 32)) Unit!35866)

(assert (=> b!1089702 (= lt!485913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089703 () Bool)

(assert (=> b!1089703 (= e!622392 e!622389)))

(declare-fun res!726896 () Bool)

(assert (=> b!1089703 (=> res!726896 e!622389)))

(assert (=> b!1089703 (= res!726896 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089703 (= lt!485911 lt!485915)))

(declare-fun lt!485908 () tuple2!17050)

(declare-fun +!3317 (ListLongMap!15019 tuple2!17050) ListLongMap!15019)

(assert (=> b!1089703 (= lt!485915 (+!3317 lt!485910 lt!485908))))

(assert (=> b!1089703 (= lt!485917 lt!485907)))

(assert (=> b!1089703 (= lt!485907 (+!3317 lt!485906 lt!485908))))

(assert (=> b!1089703 (= lt!485911 (+!3317 lt!485905 lt!485908))))

(assert (=> b!1089703 (= lt!485908 (tuple2!17051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(assert (= (and start!96072 res!726894) b!1089697))

(assert (= (and b!1089697 res!726890) b!1089693))

(assert (= (and b!1089693 res!726893) b!1089696))

(assert (= (and b!1089696 res!726897) b!1089698))

(assert (= (and b!1089698 res!726895) b!1089695))

(assert (= (and b!1089695 res!726887) b!1089692))

(assert (= (and b!1089692 res!726889) b!1089700))

(assert (= (and b!1089700 res!726888) b!1089690))

(assert (= (and b!1089690 res!726892) b!1089702))

(assert (= (and b!1089702 (not res!726891)) b!1089703))

(assert (= (and b!1089703 (not res!726896)) b!1089701))

(assert (= (and b!1089699 condMapEmpty!41845) mapIsEmpty!41845))

(assert (= (and b!1089699 (not condMapEmpty!41845)) mapNonEmpty!41845))

(get-info :version)

(assert (= (and mapNonEmpty!41845 ((_ is ValueCellFull!12654) mapValue!41845)) b!1089691))

(assert (= (and b!1089699 ((_ is ValueCellFull!12654) mapDefault!41845)) b!1089694))

(assert (= start!96072 b!1089699))

(declare-fun b_lambda!17395 () Bool)

(assert (=> (not b_lambda!17395) (not b!1089702)))

(declare-fun t!33421 () Bool)

(declare-fun tb!7603 () Bool)

(assert (=> (and start!96072 (= defaultEntry!882 defaultEntry!882) t!33421) tb!7603))

(declare-fun result!15725 () Bool)

(assert (=> tb!7603 (= result!15725 tp_is_empty!26727)))

(assert (=> b!1089702 t!33421))

(declare-fun b_and!36127 () Bool)

(assert (= b_and!36125 (and (=> t!33421 result!15725) b_and!36127)))

(declare-fun m!1008983 () Bool)

(assert (=> b!1089695 m!1008983))

(declare-fun m!1008985 () Bool)

(assert (=> b!1089692 m!1008985))

(declare-fun m!1008987 () Bool)

(assert (=> mapNonEmpty!41845 m!1008987))

(declare-fun m!1008989 () Bool)

(assert (=> b!1089702 m!1008989))

(declare-fun m!1008991 () Bool)

(assert (=> b!1089702 m!1008991))

(declare-fun m!1008993 () Bool)

(assert (=> b!1089702 m!1008993))

(declare-fun m!1008995 () Bool)

(assert (=> b!1089702 m!1008995))

(declare-fun m!1008997 () Bool)

(assert (=> b!1089702 m!1008997))

(declare-fun m!1008999 () Bool)

(assert (=> b!1089702 m!1008999))

(declare-fun m!1009001 () Bool)

(assert (=> b!1089702 m!1009001))

(declare-fun m!1009003 () Bool)

(assert (=> b!1089702 m!1009003))

(declare-fun m!1009005 () Bool)

(assert (=> b!1089702 m!1009005))

(declare-fun m!1009007 () Bool)

(assert (=> b!1089702 m!1009007))

(declare-fun m!1009009 () Bool)

(assert (=> b!1089696 m!1009009))

(declare-fun m!1009011 () Bool)

(assert (=> b!1089693 m!1009011))

(declare-fun m!1009013 () Bool)

(assert (=> b!1089690 m!1009013))

(declare-fun m!1009015 () Bool)

(assert (=> b!1089703 m!1009015))

(declare-fun m!1009017 () Bool)

(assert (=> b!1089703 m!1009017))

(declare-fun m!1009019 () Bool)

(assert (=> b!1089703 m!1009019))

(declare-fun m!1009021 () Bool)

(assert (=> b!1089701 m!1009021))

(declare-fun m!1009023 () Bool)

(assert (=> b!1089701 m!1009023))

(declare-fun m!1009025 () Bool)

(assert (=> start!96072 m!1009025))

(declare-fun m!1009027 () Bool)

(assert (=> start!96072 m!1009027))

(declare-fun m!1009029 () Bool)

(assert (=> start!96072 m!1009029))

(declare-fun m!1009031 () Bool)

(assert (=> b!1089700 m!1009031))

(declare-fun m!1009033 () Bool)

(assert (=> b!1089700 m!1009033))

(check-sat (not b!1089702) (not mapNonEmpty!41845) (not b!1089696) (not b!1089695) (not b_lambda!17395) (not b!1089701) b_and!36127 (not b!1089703) (not start!96072) (not b_next!22725) (not b!1089693) (not b!1089700) tp_is_empty!26727 (not b!1089690))
(check-sat b_and!36127 (not b_next!22725))
