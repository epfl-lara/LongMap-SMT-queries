; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95910 () Bool)

(assert start!95910)

(declare-fun b_free!22563 () Bool)

(declare-fun b_next!22563 () Bool)

(assert (=> start!95910 (= b_free!22563 (not b_next!22563))))

(declare-fun tp!79538 () Bool)

(declare-fun b_and!35801 () Bool)

(assert (=> start!95910 (= tp!79538 b_and!35801)))

(declare-fun res!724213 () Bool)

(declare-fun e!620446 () Bool)

(assert (=> start!95910 (=> (not res!724213) (not e!620446))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95910 (= res!724213 (validMask!0 mask!1414))))

(assert (=> start!95910 e!620446))

(assert (=> start!95910 tp!79538))

(assert (=> start!95910 true))

(declare-fun tp_is_empty!26565 () Bool)

(assert (=> start!95910 tp_is_empty!26565))

(declare-datatypes ((array!70065 0))(
  ( (array!70066 (arr!33706 (Array (_ BitVec 32) (_ BitVec 64))) (size!34242 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70065)

(declare-fun array_inv!26008 (array!70065) Bool)

(assert (=> start!95910 (array_inv!26008 _keys!1070)))

(declare-datatypes ((V!40547 0))(
  ( (V!40548 (val!13339 Int)) )
))
(declare-datatypes ((ValueCell!12573 0))(
  ( (ValueCellFull!12573 (v!15960 V!40547)) (EmptyCell!12573) )
))
(declare-datatypes ((array!70067 0))(
  ( (array!70068 (arr!33707 (Array (_ BitVec 32) ValueCell!12573)) (size!34243 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70067)

(declare-fun e!620447 () Bool)

(declare-fun array_inv!26009 (array!70067) Bool)

(assert (=> start!95910 (and (array_inv!26009 _values!874) e!620447)))

(declare-fun b!1086117 () Bool)

(declare-fun e!620448 () Bool)

(declare-fun e!620449 () Bool)

(assert (=> b!1086117 (= e!620448 e!620449)))

(declare-fun res!724208 () Bool)

(assert (=> b!1086117 (=> res!724208 e!620449)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1086117 (= res!724208 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16918 0))(
  ( (tuple2!16919 (_1!8470 (_ BitVec 64)) (_2!8470 V!40547)) )
))
(declare-datatypes ((List!23507 0))(
  ( (Nil!23504) (Cons!23503 (h!24712 tuple2!16918) (t!33128 List!23507)) )
))
(declare-datatypes ((ListLongMap!14887 0))(
  ( (ListLongMap!14888 (toList!7459 List!23507)) )
))
(declare-fun lt!482477 () ListLongMap!14887)

(declare-fun lt!482476 () ListLongMap!14887)

(assert (=> b!1086117 (= lt!482477 lt!482476)))

(declare-fun lt!482485 () ListLongMap!14887)

(declare-fun -!785 (ListLongMap!14887 (_ BitVec 64)) ListLongMap!14887)

(assert (=> b!1086117 (= lt!482477 (-!785 lt!482485 k0!904))))

(declare-fun lt!482482 () ListLongMap!14887)

(declare-fun zeroValue!831 () V!40547)

(declare-datatypes ((Unit!35736 0))(
  ( (Unit!35737) )
))
(declare-fun lt!482479 () Unit!35736)

(declare-fun addRemoveCommutativeForDiffKeys!23 (ListLongMap!14887 (_ BitVec 64) V!40547 (_ BitVec 64)) Unit!35736)

(assert (=> b!1086117 (= lt!482479 (addRemoveCommutativeForDiffKeys!23 lt!482482 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482472 () ListLongMap!14887)

(declare-fun lt!482474 () tuple2!16918)

(declare-fun +!3267 (ListLongMap!14887 tuple2!16918) ListLongMap!14887)

(assert (=> b!1086117 (= lt!482472 (+!3267 lt!482476 lt!482474))))

(declare-fun lt!482480 () ListLongMap!14887)

(declare-fun lt!482483 () tuple2!16918)

(assert (=> b!1086117 (= lt!482476 (+!3267 lt!482480 lt!482483))))

(declare-fun lt!482481 () ListLongMap!14887)

(declare-fun lt!482478 () ListLongMap!14887)

(assert (=> b!1086117 (= lt!482481 lt!482478)))

(assert (=> b!1086117 (= lt!482478 (+!3267 lt!482485 lt!482474))))

(assert (=> b!1086117 (= lt!482485 (+!3267 lt!482482 lt!482483))))

(declare-fun lt!482469 () ListLongMap!14887)

(assert (=> b!1086117 (= lt!482472 (+!3267 (+!3267 lt!482469 lt!482483) lt!482474))))

(declare-fun minValue!831 () V!40547)

(assert (=> b!1086117 (= lt!482474 (tuple2!16919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086117 (= lt!482483 (tuple2!16919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086118 () Bool)

(declare-fun res!724210 () Bool)

(assert (=> b!1086118 (=> (not res!724210) (not e!620446))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086118 (= res!724210 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34242 _keys!1070))))))

(declare-fun b!1086119 () Bool)

(declare-fun e!620450 () Bool)

(assert (=> b!1086119 (= e!620450 tp_is_empty!26565)))

(declare-fun b!1086120 () Bool)

(declare-fun res!724206 () Bool)

(assert (=> b!1086120 (=> (not res!724206) (not e!620446))))

(assert (=> b!1086120 (= res!724206 (= (select (arr!33706 _keys!1070) i!650) k0!904))))

(declare-fun b!1086121 () Bool)

(declare-fun e!620445 () Bool)

(assert (=> b!1086121 (= e!620446 e!620445)))

(declare-fun res!724214 () Bool)

(assert (=> b!1086121 (=> (not res!724214) (not e!620445))))

(declare-fun lt!482471 () array!70065)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70065 (_ BitVec 32)) Bool)

(assert (=> b!1086121 (= res!724214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482471 mask!1414))))

(assert (=> b!1086121 (= lt!482471 (array!70066 (store (arr!33706 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34242 _keys!1070)))))

(declare-fun b!1086122 () Bool)

(declare-fun e!620443 () Bool)

(assert (=> b!1086122 (= e!620443 tp_is_empty!26565)))

(declare-fun b!1086123 () Bool)

(declare-fun res!724209 () Bool)

(assert (=> b!1086123 (=> (not res!724209) (not e!620446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086123 (= res!724209 (validKeyInArray!0 k0!904))))

(declare-fun b!1086124 () Bool)

(declare-fun res!724215 () Bool)

(assert (=> b!1086124 (=> (not res!724215) (not e!620446))))

(declare-datatypes ((List!23508 0))(
  ( (Nil!23505) (Cons!23504 (h!24713 (_ BitVec 64)) (t!33129 List!23508)) )
))
(declare-fun arrayNoDuplicates!0 (array!70065 (_ BitVec 32) List!23508) Bool)

(assert (=> b!1086124 (= res!724215 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23505))))

(declare-fun b!1086125 () Bool)

(assert (=> b!1086125 (= e!620449 true)))

(assert (=> b!1086125 (= (-!785 lt!482478 k0!904) (+!3267 lt!482477 lt!482474))))

(declare-fun lt!482475 () Unit!35736)

(assert (=> b!1086125 (= lt!482475 (addRemoveCommutativeForDiffKeys!23 lt!482485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086126 () Bool)

(declare-fun mapRes!41602 () Bool)

(assert (=> b!1086126 (= e!620447 (and e!620443 mapRes!41602))))

(declare-fun condMapEmpty!41602 () Bool)

(declare-fun mapDefault!41602 () ValueCell!12573)

(assert (=> b!1086126 (= condMapEmpty!41602 (= (arr!33707 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12573)) mapDefault!41602)))))

(declare-fun mapIsEmpty!41602 () Bool)

(assert (=> mapIsEmpty!41602 mapRes!41602))

(declare-fun b!1086127 () Bool)

(declare-fun res!724212 () Bool)

(assert (=> b!1086127 (=> (not res!724212) (not e!620446))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086127 (= res!724212 (and (= (size!34243 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34242 _keys!1070) (size!34243 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086128 () Bool)

(declare-fun res!724205 () Bool)

(assert (=> b!1086128 (=> (not res!724205) (not e!620446))))

(assert (=> b!1086128 (= res!724205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086129 () Bool)

(declare-fun res!724211 () Bool)

(assert (=> b!1086129 (=> (not res!724211) (not e!620445))))

(assert (=> b!1086129 (= res!724211 (arrayNoDuplicates!0 lt!482471 #b00000000000000000000000000000000 Nil!23505))))

(declare-fun b!1086130 () Bool)

(assert (=> b!1086130 (= e!620445 (not e!620448))))

(declare-fun res!724207 () Bool)

(assert (=> b!1086130 (=> res!724207 e!620448)))

(assert (=> b!1086130 (= res!724207 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4240 (array!70065 array!70067 (_ BitVec 32) (_ BitVec 32) V!40547 V!40547 (_ BitVec 32) Int) ListLongMap!14887)

(assert (=> b!1086130 (= lt!482481 (getCurrentListMap!4240 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482470 () array!70067)

(assert (=> b!1086130 (= lt!482472 (getCurrentListMap!4240 lt!482471 lt!482470 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086130 (and (= lt!482469 lt!482480) (= lt!482480 lt!482469))))

(assert (=> b!1086130 (= lt!482480 (-!785 lt!482482 k0!904))))

(declare-fun lt!482484 () Unit!35736)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!59 (array!70065 array!70067 (_ BitVec 32) (_ BitVec 32) V!40547 V!40547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35736)

(assert (=> b!1086130 (= lt!482484 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!59 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4000 (array!70065 array!70067 (_ BitVec 32) (_ BitVec 32) V!40547 V!40547 (_ BitVec 32) Int) ListLongMap!14887)

(assert (=> b!1086130 (= lt!482469 (getCurrentListMapNoExtraKeys!4000 lt!482471 lt!482470 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2137 (Int (_ BitVec 64)) V!40547)

(assert (=> b!1086130 (= lt!482470 (array!70068 (store (arr!33707 _values!874) i!650 (ValueCellFull!12573 (dynLambda!2137 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34243 _values!874)))))

(assert (=> b!1086130 (= lt!482482 (getCurrentListMapNoExtraKeys!4000 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086130 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482473 () Unit!35736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70065 (_ BitVec 64) (_ BitVec 32)) Unit!35736)

(assert (=> b!1086130 (= lt!482473 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41602 () Bool)

(declare-fun tp!79537 () Bool)

(assert (=> mapNonEmpty!41602 (= mapRes!41602 (and tp!79537 e!620450))))

(declare-fun mapKey!41602 () (_ BitVec 32))

(declare-fun mapValue!41602 () ValueCell!12573)

(declare-fun mapRest!41602 () (Array (_ BitVec 32) ValueCell!12573))

(assert (=> mapNonEmpty!41602 (= (arr!33707 _values!874) (store mapRest!41602 mapKey!41602 mapValue!41602))))

(assert (= (and start!95910 res!724213) b!1086127))

(assert (= (and b!1086127 res!724212) b!1086128))

(assert (= (and b!1086128 res!724205) b!1086124))

(assert (= (and b!1086124 res!724215) b!1086118))

(assert (= (and b!1086118 res!724210) b!1086123))

(assert (= (and b!1086123 res!724209) b!1086120))

(assert (= (and b!1086120 res!724206) b!1086121))

(assert (= (and b!1086121 res!724214) b!1086129))

(assert (= (and b!1086129 res!724211) b!1086130))

(assert (= (and b!1086130 (not res!724207)) b!1086117))

(assert (= (and b!1086117 (not res!724208)) b!1086125))

(assert (= (and b!1086126 condMapEmpty!41602) mapIsEmpty!41602))

(assert (= (and b!1086126 (not condMapEmpty!41602)) mapNonEmpty!41602))

(get-info :version)

(assert (= (and mapNonEmpty!41602 ((_ is ValueCellFull!12573) mapValue!41602)) b!1086119))

(assert (= (and b!1086126 ((_ is ValueCellFull!12573) mapDefault!41602)) b!1086122))

(assert (= start!95910 b!1086126))

(declare-fun b_lambda!17233 () Bool)

(assert (=> (not b_lambda!17233) (not b!1086130)))

(declare-fun t!33127 () Bool)

(declare-fun tb!7441 () Bool)

(assert (=> (and start!95910 (= defaultEntry!882 defaultEntry!882) t!33127) tb!7441))

(declare-fun result!15401 () Bool)

(assert (=> tb!7441 (= result!15401 tp_is_empty!26565)))

(assert (=> b!1086130 t!33127))

(declare-fun b_and!35803 () Bool)

(assert (= b_and!35801 (and (=> t!33127 result!15401) b_and!35803)))

(declare-fun m!1004471 () Bool)

(assert (=> b!1086120 m!1004471))

(declare-fun m!1004473 () Bool)

(assert (=> b!1086117 m!1004473))

(declare-fun m!1004475 () Bool)

(assert (=> b!1086117 m!1004475))

(declare-fun m!1004477 () Bool)

(assert (=> b!1086117 m!1004477))

(declare-fun m!1004479 () Bool)

(assert (=> b!1086117 m!1004479))

(declare-fun m!1004481 () Bool)

(assert (=> b!1086117 m!1004481))

(declare-fun m!1004483 () Bool)

(assert (=> b!1086117 m!1004483))

(declare-fun m!1004485 () Bool)

(assert (=> b!1086117 m!1004485))

(assert (=> b!1086117 m!1004475))

(declare-fun m!1004487 () Bool)

(assert (=> b!1086117 m!1004487))

(declare-fun m!1004489 () Bool)

(assert (=> mapNonEmpty!41602 m!1004489))

(declare-fun m!1004491 () Bool)

(assert (=> b!1086125 m!1004491))

(declare-fun m!1004493 () Bool)

(assert (=> b!1086125 m!1004493))

(declare-fun m!1004495 () Bool)

(assert (=> b!1086125 m!1004495))

(declare-fun m!1004497 () Bool)

(assert (=> b!1086124 m!1004497))

(declare-fun m!1004499 () Bool)

(assert (=> b!1086123 m!1004499))

(declare-fun m!1004501 () Bool)

(assert (=> b!1086121 m!1004501))

(declare-fun m!1004503 () Bool)

(assert (=> b!1086121 m!1004503))

(declare-fun m!1004505 () Bool)

(assert (=> start!95910 m!1004505))

(declare-fun m!1004507 () Bool)

(assert (=> start!95910 m!1004507))

(declare-fun m!1004509 () Bool)

(assert (=> start!95910 m!1004509))

(declare-fun m!1004511 () Bool)

(assert (=> b!1086130 m!1004511))

(declare-fun m!1004513 () Bool)

(assert (=> b!1086130 m!1004513))

(declare-fun m!1004515 () Bool)

(assert (=> b!1086130 m!1004515))

(declare-fun m!1004517 () Bool)

(assert (=> b!1086130 m!1004517))

(declare-fun m!1004519 () Bool)

(assert (=> b!1086130 m!1004519))

(declare-fun m!1004521 () Bool)

(assert (=> b!1086130 m!1004521))

(declare-fun m!1004523 () Bool)

(assert (=> b!1086130 m!1004523))

(declare-fun m!1004525 () Bool)

(assert (=> b!1086130 m!1004525))

(declare-fun m!1004527 () Bool)

(assert (=> b!1086130 m!1004527))

(declare-fun m!1004529 () Bool)

(assert (=> b!1086130 m!1004529))

(declare-fun m!1004531 () Bool)

(assert (=> b!1086128 m!1004531))

(declare-fun m!1004533 () Bool)

(assert (=> b!1086129 m!1004533))

(check-sat (not b!1086129) (not b_next!22563) (not b!1086123) tp_is_empty!26565 (not b!1086117) b_and!35803 (not mapNonEmpty!41602) (not b!1086128) (not start!95910) (not b!1086125) (not b!1086124) (not b!1086130) (not b_lambda!17233) (not b!1086121))
(check-sat b_and!35803 (not b_next!22563))
