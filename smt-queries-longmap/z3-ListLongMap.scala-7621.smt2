; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96282 () Bool)

(assert start!96282)

(declare-fun b_free!22699 () Bool)

(declare-fun b_next!22699 () Bool)

(assert (=> start!96282 (= b_free!22699 (not b_next!22699))))

(declare-fun tp!79945 () Bool)

(declare-fun b_and!36083 () Bool)

(assert (=> start!96282 (= tp!79945 b_and!36083)))

(declare-fun mapIsEmpty!41806 () Bool)

(declare-fun mapRes!41806 () Bool)

(assert (=> mapIsEmpty!41806 mapRes!41806))

(declare-fun b!1090445 () Bool)

(declare-fun res!726988 () Bool)

(declare-fun e!622931 () Bool)

(assert (=> b!1090445 (=> (not res!726988) (not e!622931))))

(declare-datatypes ((array!70365 0))(
  ( (array!70366 (arr!33850 (Array (_ BitVec 32) (_ BitVec 64))) (size!34387 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70365)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70365 (_ BitVec 32)) Bool)

(assert (=> b!1090445 (= res!726988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090446 () Bool)

(declare-fun e!622934 () Bool)

(declare-fun e!622937 () Bool)

(assert (=> b!1090446 (= e!622934 (and e!622937 mapRes!41806))))

(declare-fun condMapEmpty!41806 () Bool)

(declare-datatypes ((V!40729 0))(
  ( (V!40730 (val!13407 Int)) )
))
(declare-datatypes ((ValueCell!12641 0))(
  ( (ValueCellFull!12641 (v!16024 V!40729)) (EmptyCell!12641) )
))
(declare-datatypes ((array!70367 0))(
  ( (array!70368 (arr!33851 (Array (_ BitVec 32) ValueCell!12641)) (size!34388 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70367)

(declare-fun mapDefault!41806 () ValueCell!12641)

(assert (=> b!1090446 (= condMapEmpty!41806 (= (arr!33851 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12641)) mapDefault!41806)))))

(declare-fun b!1090447 () Bool)

(declare-fun res!726985 () Bool)

(assert (=> b!1090447 (=> (not res!726985) (not e!622931))))

(declare-datatypes ((List!23634 0))(
  ( (Nil!23631) (Cons!23630 (h!24848 (_ BitVec 64)) (t!33383 List!23634)) )
))
(declare-fun arrayNoDuplicates!0 (array!70365 (_ BitVec 32) List!23634) Bool)

(assert (=> b!1090447 (= res!726985 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23631))))

(declare-fun b!1090448 () Bool)

(declare-fun e!622935 () Bool)

(declare-fun e!622933 () Bool)

(assert (=> b!1090448 (= e!622935 (not e!622933))))

(declare-fun res!726990 () Bool)

(assert (=> b!1090448 (=> res!726990 e!622933)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090448 (= res!726990 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40729)

(declare-datatypes ((tuple2!17042 0))(
  ( (tuple2!17043 (_1!8532 (_ BitVec 64)) (_2!8532 V!40729)) )
))
(declare-datatypes ((List!23635 0))(
  ( (Nil!23632) (Cons!23631 (h!24849 tuple2!17042) (t!33384 List!23635)) )
))
(declare-datatypes ((ListLongMap!15019 0))(
  ( (ListLongMap!15020 (toList!7525 List!23635)) )
))
(declare-fun lt!485920 () ListLongMap!15019)

(declare-fun zeroValue!831 () V!40729)

(declare-fun getCurrentListMap!4282 (array!70365 array!70367 (_ BitVec 32) (_ BitVec 32) V!40729 V!40729 (_ BitVec 32) Int) ListLongMap!15019)

(assert (=> b!1090448 (= lt!485920 (getCurrentListMap!4282 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485924 () array!70367)

(declare-fun lt!485916 () array!70365)

(declare-fun lt!485919 () ListLongMap!15019)

(assert (=> b!1090448 (= lt!485919 (getCurrentListMap!4282 lt!485916 lt!485924 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485915 () ListLongMap!15019)

(declare-fun lt!485923 () ListLongMap!15019)

(assert (=> b!1090448 (and (= lt!485915 lt!485923) (= lt!485923 lt!485915))))

(declare-fun lt!485921 () ListLongMap!15019)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!835 (ListLongMap!15019 (_ BitVec 64)) ListLongMap!15019)

(assert (=> b!1090448 (= lt!485923 (-!835 lt!485921 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35837 0))(
  ( (Unit!35838) )
))
(declare-fun lt!485925 () Unit!35837)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!111 (array!70365 array!70367 (_ BitVec 32) (_ BitVec 32) V!40729 V!40729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35837)

(assert (=> b!1090448 (= lt!485925 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!111 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4087 (array!70365 array!70367 (_ BitVec 32) (_ BitVec 32) V!40729 V!40729 (_ BitVec 32) Int) ListLongMap!15019)

(assert (=> b!1090448 (= lt!485915 (getCurrentListMapNoExtraKeys!4087 lt!485916 lt!485924 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2208 (Int (_ BitVec 64)) V!40729)

(assert (=> b!1090448 (= lt!485924 (array!70368 (store (arr!33851 _values!874) i!650 (ValueCellFull!12641 (dynLambda!2208 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34388 _values!874)))))

(assert (=> b!1090448 (= lt!485921 (getCurrentListMapNoExtraKeys!4087 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090448 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485918 () Unit!35837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70365 (_ BitVec 64) (_ BitVec 32)) Unit!35837)

(assert (=> b!1090448 (= lt!485918 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090449 () Bool)

(declare-fun res!726981 () Bool)

(assert (=> b!1090449 (=> (not res!726981) (not e!622931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090449 (= res!726981 (validKeyInArray!0 k0!904))))

(declare-fun b!1090450 () Bool)

(declare-fun tp_is_empty!26701 () Bool)

(assert (=> b!1090450 (= e!622937 tp_is_empty!26701)))

(declare-fun b!1090451 () Bool)

(assert (=> b!1090451 (= e!622931 e!622935)))

(declare-fun res!726987 () Bool)

(assert (=> b!1090451 (=> (not res!726987) (not e!622935))))

(assert (=> b!1090451 (= res!726987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485916 mask!1414))))

(assert (=> b!1090451 (= lt!485916 (array!70366 (store (arr!33850 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34387 _keys!1070)))))

(declare-fun res!726982 () Bool)

(assert (=> start!96282 (=> (not res!726982) (not e!622931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96282 (= res!726982 (validMask!0 mask!1414))))

(assert (=> start!96282 e!622931))

(assert (=> start!96282 tp!79945))

(assert (=> start!96282 true))

(assert (=> start!96282 tp_is_empty!26701))

(declare-fun array_inv!26158 (array!70365) Bool)

(assert (=> start!96282 (array_inv!26158 _keys!1070)))

(declare-fun array_inv!26159 (array!70367) Bool)

(assert (=> start!96282 (and (array_inv!26159 _values!874) e!622934)))

(declare-fun b!1090452 () Bool)

(declare-fun res!726980 () Bool)

(assert (=> b!1090452 (=> (not res!726980) (not e!622931))))

(assert (=> b!1090452 (= res!726980 (= (select (arr!33850 _keys!1070) i!650) k0!904))))

(declare-fun b!1090453 () Bool)

(declare-fun res!726989 () Bool)

(assert (=> b!1090453 (=> (not res!726989) (not e!622935))))

(assert (=> b!1090453 (= res!726989 (arrayNoDuplicates!0 lt!485916 #b00000000000000000000000000000000 Nil!23631))))

(declare-fun b!1090454 () Bool)

(declare-fun res!726986 () Bool)

(assert (=> b!1090454 (=> (not res!726986) (not e!622931))))

(assert (=> b!1090454 (= res!726986 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34387 _keys!1070))))))

(declare-fun b!1090455 () Bool)

(declare-fun e!622936 () Bool)

(assert (=> b!1090455 (= e!622936 tp_is_empty!26701)))

(declare-fun b!1090456 () Bool)

(declare-fun res!726983 () Bool)

(assert (=> b!1090456 (=> (not res!726983) (not e!622931))))

(assert (=> b!1090456 (= res!726983 (and (= (size!34388 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34387 _keys!1070) (size!34388 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41806 () Bool)

(declare-fun tp!79946 () Bool)

(assert (=> mapNonEmpty!41806 (= mapRes!41806 (and tp!79946 e!622936))))

(declare-fun mapValue!41806 () ValueCell!12641)

(declare-fun mapKey!41806 () (_ BitVec 32))

(declare-fun mapRest!41806 () (Array (_ BitVec 32) ValueCell!12641))

(assert (=> mapNonEmpty!41806 (= (arr!33851 _values!874) (store mapRest!41806 mapKey!41806 mapValue!41806))))

(declare-fun b!1090457 () Bool)

(declare-fun e!622930 () Bool)

(assert (=> b!1090457 (= e!622933 e!622930)))

(declare-fun res!726984 () Bool)

(assert (=> b!1090457 (=> res!726984 e!622930)))

(assert (=> b!1090457 (= res!726984 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!485913 () ListLongMap!15019)

(assert (=> b!1090457 (= lt!485919 lt!485913)))

(declare-fun lt!485914 () tuple2!17042)

(declare-fun +!3343 (ListLongMap!15019 tuple2!17042) ListLongMap!15019)

(assert (=> b!1090457 (= lt!485913 (+!3343 lt!485923 lt!485914))))

(declare-fun lt!485922 () ListLongMap!15019)

(assert (=> b!1090457 (= lt!485920 lt!485922)))

(assert (=> b!1090457 (= lt!485922 (+!3343 lt!485921 lt!485914))))

(assert (=> b!1090457 (= lt!485919 (+!3343 lt!485915 lt!485914))))

(assert (=> b!1090457 (= lt!485914 (tuple2!17043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1090458 () Bool)

(assert (=> b!1090458 (= e!622930 true)))

(assert (=> b!1090458 (= (-!835 lt!485922 k0!904) lt!485913)))

(declare-fun lt!485917 () Unit!35837)

(declare-fun addRemoveCommutativeForDiffKeys!73 (ListLongMap!15019 (_ BitVec 64) V!40729 (_ BitVec 64)) Unit!35837)

(assert (=> b!1090458 (= lt!485917 (addRemoveCommutativeForDiffKeys!73 lt!485921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (= (and start!96282 res!726982) b!1090456))

(assert (= (and b!1090456 res!726983) b!1090445))

(assert (= (and b!1090445 res!726988) b!1090447))

(assert (= (and b!1090447 res!726985) b!1090454))

(assert (= (and b!1090454 res!726986) b!1090449))

(assert (= (and b!1090449 res!726981) b!1090452))

(assert (= (and b!1090452 res!726980) b!1090451))

(assert (= (and b!1090451 res!726987) b!1090453))

(assert (= (and b!1090453 res!726989) b!1090448))

(assert (= (and b!1090448 (not res!726990)) b!1090457))

(assert (= (and b!1090457 (not res!726984)) b!1090458))

(assert (= (and b!1090446 condMapEmpty!41806) mapIsEmpty!41806))

(assert (= (and b!1090446 (not condMapEmpty!41806)) mapNonEmpty!41806))

(get-info :version)

(assert (= (and mapNonEmpty!41806 ((_ is ValueCellFull!12641) mapValue!41806)) b!1090455))

(assert (= (and b!1090446 ((_ is ValueCellFull!12641) mapDefault!41806)) b!1090450))

(assert (= start!96282 b!1090446))

(declare-fun b_lambda!17379 () Bool)

(assert (=> (not b_lambda!17379) (not b!1090448)))

(declare-fun t!33382 () Bool)

(declare-fun tb!7569 () Bool)

(assert (=> (and start!96282 (= defaultEntry!882 defaultEntry!882) t!33382) tb!7569))

(declare-fun result!15665 () Bool)

(assert (=> tb!7569 (= result!15665 tp_is_empty!26701)))

(assert (=> b!1090448 t!33382))

(declare-fun b_and!36085 () Bool)

(assert (= b_and!36083 (and (=> t!33382 result!15665) b_and!36085)))

(declare-fun m!1009979 () Bool)

(assert (=> b!1090447 m!1009979))

(declare-fun m!1009981 () Bool)

(assert (=> b!1090449 m!1009981))

(declare-fun m!1009983 () Bool)

(assert (=> b!1090452 m!1009983))

(declare-fun m!1009985 () Bool)

(assert (=> b!1090448 m!1009985))

(declare-fun m!1009987 () Bool)

(assert (=> b!1090448 m!1009987))

(declare-fun m!1009989 () Bool)

(assert (=> b!1090448 m!1009989))

(declare-fun m!1009991 () Bool)

(assert (=> b!1090448 m!1009991))

(declare-fun m!1009993 () Bool)

(assert (=> b!1090448 m!1009993))

(declare-fun m!1009995 () Bool)

(assert (=> b!1090448 m!1009995))

(declare-fun m!1009997 () Bool)

(assert (=> b!1090448 m!1009997))

(declare-fun m!1009999 () Bool)

(assert (=> b!1090448 m!1009999))

(declare-fun m!1010001 () Bool)

(assert (=> b!1090448 m!1010001))

(declare-fun m!1010003 () Bool)

(assert (=> b!1090448 m!1010003))

(declare-fun m!1010005 () Bool)

(assert (=> b!1090457 m!1010005))

(declare-fun m!1010007 () Bool)

(assert (=> b!1090457 m!1010007))

(declare-fun m!1010009 () Bool)

(assert (=> b!1090457 m!1010009))

(declare-fun m!1010011 () Bool)

(assert (=> b!1090453 m!1010011))

(declare-fun m!1010013 () Bool)

(assert (=> b!1090451 m!1010013))

(declare-fun m!1010015 () Bool)

(assert (=> b!1090451 m!1010015))

(declare-fun m!1010017 () Bool)

(assert (=> start!96282 m!1010017))

(declare-fun m!1010019 () Bool)

(assert (=> start!96282 m!1010019))

(declare-fun m!1010021 () Bool)

(assert (=> start!96282 m!1010021))

(declare-fun m!1010023 () Bool)

(assert (=> mapNonEmpty!41806 m!1010023))

(declare-fun m!1010025 () Bool)

(assert (=> b!1090445 m!1010025))

(declare-fun m!1010027 () Bool)

(assert (=> b!1090458 m!1010027))

(declare-fun m!1010029 () Bool)

(assert (=> b!1090458 m!1010029))

(check-sat (not b_next!22699) (not b!1090448) b_and!36085 (not b_lambda!17379) tp_is_empty!26701 (not b!1090447) (not start!96282) (not mapNonEmpty!41806) (not b!1090458) (not b!1090451) (not b!1090457) (not b!1090453) (not b!1090445) (not b!1090449))
(check-sat b_and!36085 (not b_next!22699))
