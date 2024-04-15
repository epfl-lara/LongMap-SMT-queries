; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95890 () Bool)

(assert start!95890)

(declare-fun b_free!22549 () Bool)

(declare-fun b_next!22549 () Bool)

(assert (=> start!95890 (= b_free!22549 (not b_next!22549))))

(declare-fun tp!79495 () Bool)

(declare-fun b_and!35747 () Bool)

(assert (=> start!95890 (= tp!79495 b_and!35747)))

(declare-fun b!1085656 () Bool)

(declare-fun res!723907 () Bool)

(declare-fun e!620186 () Bool)

(assert (=> b!1085656 (=> (not res!723907) (not e!620186))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69960 0))(
  ( (array!69961 (arr!33654 (Array (_ BitVec 32) (_ BitVec 64))) (size!34192 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69960)

(declare-datatypes ((V!40529 0))(
  ( (V!40530 (val!13332 Int)) )
))
(declare-datatypes ((ValueCell!12566 0))(
  ( (ValueCellFull!12566 (v!15952 V!40529)) (EmptyCell!12566) )
))
(declare-datatypes ((array!69962 0))(
  ( (array!69963 (arr!33655 (Array (_ BitVec 32) ValueCell!12566)) (size!34193 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69962)

(assert (=> b!1085656 (= res!723907 (and (= (size!34193 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34192 _keys!1070) (size!34193 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085657 () Bool)

(declare-fun res!723913 () Bool)

(declare-fun e!620185 () Bool)

(assert (=> b!1085657 (=> (not res!723913) (not e!620185))))

(declare-fun lt!481926 () array!69960)

(declare-datatypes ((List!23533 0))(
  ( (Nil!23530) (Cons!23529 (h!24738 (_ BitVec 64)) (t!33131 List!23533)) )
))
(declare-fun arrayNoDuplicates!0 (array!69960 (_ BitVec 32) List!23533) Bool)

(assert (=> b!1085657 (= res!723913 (arrayNoDuplicates!0 lt!481926 #b00000000000000000000000000000000 Nil!23530))))

(declare-fun b!1085658 () Bool)

(declare-fun res!723909 () Bool)

(assert (=> b!1085658 (=> (not res!723909) (not e!620186))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085658 (= res!723909 (validKeyInArray!0 k0!904))))

(declare-fun b!1085659 () Bool)

(declare-fun e!620188 () Bool)

(assert (=> b!1085659 (= e!620188 true)))

(declare-datatypes ((tuple2!16962 0))(
  ( (tuple2!16963 (_1!8492 (_ BitVec 64)) (_2!8492 V!40529)) )
))
(declare-datatypes ((List!23534 0))(
  ( (Nil!23531) (Cons!23530 (h!24739 tuple2!16962) (t!33132 List!23534)) )
))
(declare-datatypes ((ListLongMap!14931 0))(
  ( (ListLongMap!14932 (toList!7481 List!23534)) )
))
(declare-fun lt!481921 () ListLongMap!14931)

(declare-fun lt!481924 () tuple2!16962)

(declare-fun lt!481915 () ListLongMap!14931)

(declare-fun -!760 (ListLongMap!14931 (_ BitVec 64)) ListLongMap!14931)

(declare-fun +!3289 (ListLongMap!14931 tuple2!16962) ListLongMap!14931)

(assert (=> b!1085659 (= (-!760 lt!481921 k0!904) (+!3289 lt!481915 lt!481924))))

(declare-fun lt!481913 () ListLongMap!14931)

(declare-fun minValue!831 () V!40529)

(declare-datatypes ((Unit!35555 0))(
  ( (Unit!35556) )
))
(declare-fun lt!481914 () Unit!35555)

(declare-fun addRemoveCommutativeForDiffKeys!18 (ListLongMap!14931 (_ BitVec 64) V!40529 (_ BitVec 64)) Unit!35555)

(assert (=> b!1085659 (= lt!481914 (addRemoveCommutativeForDiffKeys!18 lt!481913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!41581 () Bool)

(declare-fun mapRes!41581 () Bool)

(assert (=> mapIsEmpty!41581 mapRes!41581))

(declare-fun mapNonEmpty!41581 () Bool)

(declare-fun tp!79496 () Bool)

(declare-fun e!620183 () Bool)

(assert (=> mapNonEmpty!41581 (= mapRes!41581 (and tp!79496 e!620183))))

(declare-fun mapKey!41581 () (_ BitVec 32))

(declare-fun mapRest!41581 () (Array (_ BitVec 32) ValueCell!12566))

(declare-fun mapValue!41581 () ValueCell!12566)

(assert (=> mapNonEmpty!41581 (= (arr!33655 _values!874) (store mapRest!41581 mapKey!41581 mapValue!41581))))

(declare-fun b!1085660 () Bool)

(declare-fun res!723911 () Bool)

(assert (=> b!1085660 (=> (not res!723911) (not e!620186))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085660 (= res!723911 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34192 _keys!1070))))))

(declare-fun b!1085661 () Bool)

(declare-fun e!620189 () Bool)

(assert (=> b!1085661 (= e!620189 e!620188)))

(declare-fun res!723906 () Bool)

(assert (=> b!1085661 (=> res!723906 e!620188)))

(assert (=> b!1085661 (= res!723906 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481916 () ListLongMap!14931)

(assert (=> b!1085661 (= lt!481915 lt!481916)))

(assert (=> b!1085661 (= lt!481915 (-!760 lt!481913 k0!904))))

(declare-fun lt!481928 () ListLongMap!14931)

(declare-fun lt!481919 () Unit!35555)

(declare-fun zeroValue!831 () V!40529)

(assert (=> b!1085661 (= lt!481919 (addRemoveCommutativeForDiffKeys!18 lt!481928 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481912 () ListLongMap!14931)

(assert (=> b!1085661 (= lt!481912 (+!3289 lt!481916 lt!481924))))

(declare-fun lt!481917 () ListLongMap!14931)

(declare-fun lt!481923 () tuple2!16962)

(assert (=> b!1085661 (= lt!481916 (+!3289 lt!481917 lt!481923))))

(declare-fun lt!481922 () ListLongMap!14931)

(assert (=> b!1085661 (= lt!481922 lt!481921)))

(assert (=> b!1085661 (= lt!481921 (+!3289 lt!481913 lt!481924))))

(assert (=> b!1085661 (= lt!481913 (+!3289 lt!481928 lt!481923))))

(declare-fun lt!481920 () ListLongMap!14931)

(assert (=> b!1085661 (= lt!481912 (+!3289 (+!3289 lt!481920 lt!481923) lt!481924))))

(assert (=> b!1085661 (= lt!481924 (tuple2!16963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085661 (= lt!481923 (tuple2!16963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085662 () Bool)

(declare-fun res!723914 () Bool)

(assert (=> b!1085662 (=> (not res!723914) (not e!620186))))

(assert (=> b!1085662 (= res!723914 (= (select (arr!33654 _keys!1070) i!650) k0!904))))

(declare-fun b!1085663 () Bool)

(assert (=> b!1085663 (= e!620186 e!620185)))

(declare-fun res!723912 () Bool)

(assert (=> b!1085663 (=> (not res!723912) (not e!620185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69960 (_ BitVec 32)) Bool)

(assert (=> b!1085663 (= res!723912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481926 mask!1414))))

(assert (=> b!1085663 (= lt!481926 (array!69961 (store (arr!33654 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34192 _keys!1070)))))

(declare-fun b!1085664 () Bool)

(declare-fun res!723905 () Bool)

(assert (=> b!1085664 (=> (not res!723905) (not e!620186))))

(assert (=> b!1085664 (= res!723905 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23530))))

(declare-fun b!1085665 () Bool)

(declare-fun res!723910 () Bool)

(assert (=> b!1085665 (=> (not res!723910) (not e!620186))))

(assert (=> b!1085665 (= res!723910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085666 () Bool)

(assert (=> b!1085666 (= e!620185 (not e!620189))))

(declare-fun res!723908 () Bool)

(assert (=> b!1085666 (=> res!723908 e!620189)))

(assert (=> b!1085666 (= res!723908 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4171 (array!69960 array!69962 (_ BitVec 32) (_ BitVec 32) V!40529 V!40529 (_ BitVec 32) Int) ListLongMap!14931)

(assert (=> b!1085666 (= lt!481922 (getCurrentListMap!4171 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481927 () array!69962)

(assert (=> b!1085666 (= lt!481912 (getCurrentListMap!4171 lt!481926 lt!481927 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085666 (and (= lt!481920 lt!481917) (= lt!481917 lt!481920))))

(assert (=> b!1085666 (= lt!481917 (-!760 lt!481928 k0!904))))

(declare-fun lt!481925 () Unit!35555)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!55 (array!69960 array!69962 (_ BitVec 32) (_ BitVec 32) V!40529 V!40529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35555)

(assert (=> b!1085666 (= lt!481925 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!55 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4041 (array!69960 array!69962 (_ BitVec 32) (_ BitVec 32) V!40529 V!40529 (_ BitVec 32) Int) ListLongMap!14931)

(assert (=> b!1085666 (= lt!481920 (getCurrentListMapNoExtraKeys!4041 lt!481926 lt!481927 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2112 (Int (_ BitVec 64)) V!40529)

(assert (=> b!1085666 (= lt!481927 (array!69963 (store (arr!33655 _values!874) i!650 (ValueCellFull!12566 (dynLambda!2112 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34193 _values!874)))))

(assert (=> b!1085666 (= lt!481928 (getCurrentListMapNoExtraKeys!4041 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085666 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481918 () Unit!35555)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69960 (_ BitVec 64) (_ BitVec 32)) Unit!35555)

(assert (=> b!1085666 (= lt!481918 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!723915 () Bool)

(assert (=> start!95890 (=> (not res!723915) (not e!620186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95890 (= res!723915 (validMask!0 mask!1414))))

(assert (=> start!95890 e!620186))

(assert (=> start!95890 tp!79495))

(assert (=> start!95890 true))

(declare-fun tp_is_empty!26551 () Bool)

(assert (=> start!95890 tp_is_empty!26551))

(declare-fun array_inv!26008 (array!69960) Bool)

(assert (=> start!95890 (array_inv!26008 _keys!1070)))

(declare-fun e!620184 () Bool)

(declare-fun array_inv!26009 (array!69962) Bool)

(assert (=> start!95890 (and (array_inv!26009 _values!874) e!620184)))

(declare-fun b!1085667 () Bool)

(declare-fun e!620182 () Bool)

(assert (=> b!1085667 (= e!620184 (and e!620182 mapRes!41581))))

(declare-fun condMapEmpty!41581 () Bool)

(declare-fun mapDefault!41581 () ValueCell!12566)

(assert (=> b!1085667 (= condMapEmpty!41581 (= (arr!33655 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12566)) mapDefault!41581)))))

(declare-fun b!1085668 () Bool)

(assert (=> b!1085668 (= e!620182 tp_is_empty!26551)))

(declare-fun b!1085669 () Bool)

(assert (=> b!1085669 (= e!620183 tp_is_empty!26551)))

(assert (= (and start!95890 res!723915) b!1085656))

(assert (= (and b!1085656 res!723907) b!1085665))

(assert (= (and b!1085665 res!723910) b!1085664))

(assert (= (and b!1085664 res!723905) b!1085660))

(assert (= (and b!1085660 res!723911) b!1085658))

(assert (= (and b!1085658 res!723909) b!1085662))

(assert (= (and b!1085662 res!723914) b!1085663))

(assert (= (and b!1085663 res!723912) b!1085657))

(assert (= (and b!1085657 res!723913) b!1085666))

(assert (= (and b!1085666 (not res!723908)) b!1085661))

(assert (= (and b!1085661 (not res!723906)) b!1085659))

(assert (= (and b!1085667 condMapEmpty!41581) mapIsEmpty!41581))

(assert (= (and b!1085667 (not condMapEmpty!41581)) mapNonEmpty!41581))

(get-info :version)

(assert (= (and mapNonEmpty!41581 ((_ is ValueCellFull!12566) mapValue!41581)) b!1085669))

(assert (= (and b!1085667 ((_ is ValueCellFull!12566) mapDefault!41581)) b!1085668))

(assert (= start!95890 b!1085667))

(declare-fun b_lambda!17197 () Bool)

(assert (=> (not b_lambda!17197) (not b!1085666)))

(declare-fun t!33130 () Bool)

(declare-fun tb!7419 () Bool)

(assert (=> (and start!95890 (= defaultEntry!882 defaultEntry!882) t!33130) tb!7419))

(declare-fun result!15365 () Bool)

(assert (=> tb!7419 (= result!15365 tp_is_empty!26551)))

(assert (=> b!1085666 t!33130))

(declare-fun b_and!35749 () Bool)

(assert (= b_and!35747 (and (=> t!33130 result!15365) b_and!35749)))

(declare-fun m!1003397 () Bool)

(assert (=> b!1085662 m!1003397))

(declare-fun m!1003399 () Bool)

(assert (=> b!1085664 m!1003399))

(declare-fun m!1003401 () Bool)

(assert (=> b!1085665 m!1003401))

(declare-fun m!1003403 () Bool)

(assert (=> b!1085658 m!1003403))

(declare-fun m!1003405 () Bool)

(assert (=> b!1085657 m!1003405))

(declare-fun m!1003407 () Bool)

(assert (=> b!1085663 m!1003407))

(declare-fun m!1003409 () Bool)

(assert (=> b!1085663 m!1003409))

(declare-fun m!1003411 () Bool)

(assert (=> b!1085661 m!1003411))

(declare-fun m!1003413 () Bool)

(assert (=> b!1085661 m!1003413))

(declare-fun m!1003415 () Bool)

(assert (=> b!1085661 m!1003415))

(declare-fun m!1003417 () Bool)

(assert (=> b!1085661 m!1003417))

(declare-fun m!1003419 () Bool)

(assert (=> b!1085661 m!1003419))

(assert (=> b!1085661 m!1003411))

(declare-fun m!1003421 () Bool)

(assert (=> b!1085661 m!1003421))

(declare-fun m!1003423 () Bool)

(assert (=> b!1085661 m!1003423))

(declare-fun m!1003425 () Bool)

(assert (=> b!1085661 m!1003425))

(declare-fun m!1003427 () Bool)

(assert (=> start!95890 m!1003427))

(declare-fun m!1003429 () Bool)

(assert (=> start!95890 m!1003429))

(declare-fun m!1003431 () Bool)

(assert (=> start!95890 m!1003431))

(declare-fun m!1003433 () Bool)

(assert (=> mapNonEmpty!41581 m!1003433))

(declare-fun m!1003435 () Bool)

(assert (=> b!1085659 m!1003435))

(declare-fun m!1003437 () Bool)

(assert (=> b!1085659 m!1003437))

(declare-fun m!1003439 () Bool)

(assert (=> b!1085659 m!1003439))

(declare-fun m!1003441 () Bool)

(assert (=> b!1085666 m!1003441))

(declare-fun m!1003443 () Bool)

(assert (=> b!1085666 m!1003443))

(declare-fun m!1003445 () Bool)

(assert (=> b!1085666 m!1003445))

(declare-fun m!1003447 () Bool)

(assert (=> b!1085666 m!1003447))

(declare-fun m!1003449 () Bool)

(assert (=> b!1085666 m!1003449))

(declare-fun m!1003451 () Bool)

(assert (=> b!1085666 m!1003451))

(declare-fun m!1003453 () Bool)

(assert (=> b!1085666 m!1003453))

(declare-fun m!1003455 () Bool)

(assert (=> b!1085666 m!1003455))

(declare-fun m!1003457 () Bool)

(assert (=> b!1085666 m!1003457))

(declare-fun m!1003459 () Bool)

(assert (=> b!1085666 m!1003459))

(check-sat (not b!1085663) tp_is_empty!26551 (not b_lambda!17197) (not mapNonEmpty!41581) b_and!35749 (not b!1085666) (not start!95890) (not b_next!22549) (not b!1085665) (not b!1085659) (not b!1085658) (not b!1085657) (not b!1085664) (not b!1085661))
(check-sat b_and!35749 (not b_next!22549))
