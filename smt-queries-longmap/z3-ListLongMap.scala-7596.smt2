; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96132 () Bool)

(assert start!96132)

(declare-fun b_free!22549 () Bool)

(declare-fun b_next!22549 () Bool)

(assert (=> start!96132 (= b_free!22549 (not b_next!22549))))

(declare-fun tp!79496 () Bool)

(declare-fun b_and!35783 () Bool)

(assert (=> start!96132 (= tp!79496 b_and!35783)))

(declare-fun b!1087136 () Bool)

(declare-fun res!724499 () Bool)

(declare-fun e!621132 () Bool)

(assert (=> b!1087136 (=> (not res!724499) (not e!621132))))

(declare-datatypes ((array!70075 0))(
  ( (array!70076 (arr!33705 (Array (_ BitVec 32) (_ BitVec 64))) (size!34242 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70075)

(declare-datatypes ((List!23513 0))(
  ( (Nil!23510) (Cons!23509 (h!24727 (_ BitVec 64)) (t!33112 List!23513)) )
))
(declare-fun arrayNoDuplicates!0 (array!70075 (_ BitVec 32) List!23513) Bool)

(assert (=> b!1087136 (= res!724499 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23510))))

(declare-fun res!724501 () Bool)

(assert (=> start!96132 (=> (not res!724501) (not e!621132))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96132 (= res!724501 (validMask!0 mask!1414))))

(assert (=> start!96132 e!621132))

(assert (=> start!96132 tp!79496))

(assert (=> start!96132 true))

(declare-fun tp_is_empty!26551 () Bool)

(assert (=> start!96132 tp_is_empty!26551))

(declare-fun array_inv!26052 (array!70075) Bool)

(assert (=> start!96132 (array_inv!26052 _keys!1070)))

(declare-datatypes ((V!40529 0))(
  ( (V!40530 (val!13332 Int)) )
))
(declare-datatypes ((ValueCell!12566 0))(
  ( (ValueCellFull!12566 (v!15949 V!40529)) (EmptyCell!12566) )
))
(declare-datatypes ((array!70077 0))(
  ( (array!70078 (arr!33706 (Array (_ BitVec 32) ValueCell!12566)) (size!34243 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70077)

(declare-fun e!621137 () Bool)

(declare-fun array_inv!26053 (array!70077) Bool)

(assert (=> start!96132 (and (array_inv!26053 _values!874) e!621137)))

(declare-fun b!1087137 () Bool)

(declare-fun e!621135 () Bool)

(declare-fun mapRes!41581 () Bool)

(assert (=> b!1087137 (= e!621137 (and e!621135 mapRes!41581))))

(declare-fun condMapEmpty!41581 () Bool)

(declare-fun mapDefault!41581 () ValueCell!12566)

(assert (=> b!1087137 (= condMapEmpty!41581 (= (arr!33706 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12566)) mapDefault!41581)))))

(declare-fun mapIsEmpty!41581 () Bool)

(assert (=> mapIsEmpty!41581 mapRes!41581))

(declare-fun b!1087138 () Bool)

(declare-fun res!724496 () Bool)

(assert (=> b!1087138 (=> (not res!724496) (not e!621132))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087138 (= res!724496 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34242 _keys!1070))))))

(declare-fun b!1087139 () Bool)

(declare-fun e!621134 () Bool)

(assert (=> b!1087139 (= e!621134 tp_is_empty!26551)))

(declare-fun mapNonEmpty!41581 () Bool)

(declare-fun tp!79495 () Bool)

(assert (=> mapNonEmpty!41581 (= mapRes!41581 (and tp!79495 e!621134))))

(declare-fun mapValue!41581 () ValueCell!12566)

(declare-fun mapRest!41581 () (Array (_ BitVec 32) ValueCell!12566))

(declare-fun mapKey!41581 () (_ BitVec 32))

(assert (=> mapNonEmpty!41581 (= (arr!33706 _values!874) (store mapRest!41581 mapKey!41581 mapValue!41581))))

(declare-fun b!1087140 () Bool)

(declare-fun e!621136 () Bool)

(declare-fun e!621130 () Bool)

(assert (=> b!1087140 (= e!621136 e!621130)))

(declare-fun res!724503 () Bool)

(assert (=> b!1087140 (=> res!724503 e!621130)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1087140 (= res!724503 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16914 0))(
  ( (tuple2!16915 (_1!8468 (_ BitVec 64)) (_2!8468 V!40529)) )
))
(declare-datatypes ((List!23514 0))(
  ( (Nil!23511) (Cons!23510 (h!24728 tuple2!16914) (t!33113 List!23514)) )
))
(declare-datatypes ((ListLongMap!14891 0))(
  ( (ListLongMap!14892 (toList!7461 List!23514)) )
))
(declare-fun lt!482633 () ListLongMap!14891)

(declare-fun lt!482641 () ListLongMap!14891)

(assert (=> b!1087140 (= lt!482633 lt!482641)))

(declare-fun lt!482631 () ListLongMap!14891)

(declare-fun -!773 (ListLongMap!14891 (_ BitVec 64)) ListLongMap!14891)

(assert (=> b!1087140 (= lt!482633 (-!773 lt!482631 k0!904))))

(declare-datatypes ((Unit!35713 0))(
  ( (Unit!35714) )
))
(declare-fun lt!482635 () Unit!35713)

(declare-fun lt!482643 () ListLongMap!14891)

(declare-fun zeroValue!831 () V!40529)

(declare-fun addRemoveCommutativeForDiffKeys!20 (ListLongMap!14891 (_ BitVec 64) V!40529 (_ BitVec 64)) Unit!35713)

(assert (=> b!1087140 (= lt!482635 (addRemoveCommutativeForDiffKeys!20 lt!482643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482630 () ListLongMap!14891)

(declare-fun lt!482632 () tuple2!16914)

(declare-fun +!3286 (ListLongMap!14891 tuple2!16914) ListLongMap!14891)

(assert (=> b!1087140 (= lt!482630 (+!3286 lt!482641 lt!482632))))

(declare-fun lt!482638 () ListLongMap!14891)

(declare-fun lt!482628 () tuple2!16914)

(assert (=> b!1087140 (= lt!482641 (+!3286 lt!482638 lt!482628))))

(declare-fun lt!482637 () ListLongMap!14891)

(declare-fun lt!482640 () ListLongMap!14891)

(assert (=> b!1087140 (= lt!482637 lt!482640)))

(assert (=> b!1087140 (= lt!482640 (+!3286 lt!482631 lt!482632))))

(assert (=> b!1087140 (= lt!482631 (+!3286 lt!482643 lt!482628))))

(declare-fun lt!482627 () ListLongMap!14891)

(assert (=> b!1087140 (= lt!482630 (+!3286 (+!3286 lt!482627 lt!482628) lt!482632))))

(declare-fun minValue!831 () V!40529)

(assert (=> b!1087140 (= lt!482632 (tuple2!16915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087140 (= lt!482628 (tuple2!16915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087141 () Bool)

(declare-fun res!724497 () Bool)

(assert (=> b!1087141 (=> (not res!724497) (not e!621132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087141 (= res!724497 (validKeyInArray!0 k0!904))))

(declare-fun b!1087142 () Bool)

(assert (=> b!1087142 (= e!621130 true)))

(assert (=> b!1087142 (= (-!773 lt!482640 k0!904) (+!3286 lt!482633 lt!482632))))

(declare-fun lt!482634 () Unit!35713)

(assert (=> b!1087142 (= lt!482634 (addRemoveCommutativeForDiffKeys!20 lt!482631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1087143 () Bool)

(declare-fun res!724504 () Bool)

(assert (=> b!1087143 (=> (not res!724504) (not e!621132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70075 (_ BitVec 32)) Bool)

(assert (=> b!1087143 (= res!724504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087144 () Bool)

(declare-fun e!621133 () Bool)

(assert (=> b!1087144 (= e!621133 (not e!621136))))

(declare-fun res!724506 () Bool)

(assert (=> b!1087144 (=> res!724506 e!621136)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087144 (= res!724506 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4229 (array!70075 array!70077 (_ BitVec 32) (_ BitVec 32) V!40529 V!40529 (_ BitVec 32) Int) ListLongMap!14891)

(assert (=> b!1087144 (= lt!482637 (getCurrentListMap!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482639 () array!70077)

(declare-fun lt!482629 () array!70075)

(assert (=> b!1087144 (= lt!482630 (getCurrentListMap!4229 lt!482629 lt!482639 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087144 (and (= lt!482627 lt!482638) (= lt!482638 lt!482627))))

(assert (=> b!1087144 (= lt!482638 (-!773 lt!482643 k0!904))))

(declare-fun lt!482642 () Unit!35713)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!58 (array!70075 array!70077 (_ BitVec 32) (_ BitVec 32) V!40529 V!40529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35713)

(assert (=> b!1087144 (= lt!482642 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!58 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4034 (array!70075 array!70077 (_ BitVec 32) (_ BitVec 32) V!40529 V!40529 (_ BitVec 32) Int) ListLongMap!14891)

(assert (=> b!1087144 (= lt!482627 (getCurrentListMapNoExtraKeys!4034 lt!482629 lt!482639 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2155 (Int (_ BitVec 64)) V!40529)

(assert (=> b!1087144 (= lt!482639 (array!70078 (store (arr!33706 _values!874) i!650 (ValueCellFull!12566 (dynLambda!2155 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34243 _values!874)))))

(assert (=> b!1087144 (= lt!482643 (getCurrentListMapNoExtraKeys!4034 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087144 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482636 () Unit!35713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70075 (_ BitVec 64) (_ BitVec 32)) Unit!35713)

(assert (=> b!1087144 (= lt!482636 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087145 () Bool)

(assert (=> b!1087145 (= e!621135 tp_is_empty!26551)))

(declare-fun b!1087146 () Bool)

(declare-fun res!724500 () Bool)

(assert (=> b!1087146 (=> (not res!724500) (not e!621133))))

(assert (=> b!1087146 (= res!724500 (arrayNoDuplicates!0 lt!482629 #b00000000000000000000000000000000 Nil!23510))))

(declare-fun b!1087147 () Bool)

(declare-fun res!724505 () Bool)

(assert (=> b!1087147 (=> (not res!724505) (not e!621132))))

(assert (=> b!1087147 (= res!724505 (and (= (size!34243 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34242 _keys!1070) (size!34243 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087148 () Bool)

(assert (=> b!1087148 (= e!621132 e!621133)))

(declare-fun res!724498 () Bool)

(assert (=> b!1087148 (=> (not res!724498) (not e!621133))))

(assert (=> b!1087148 (= res!724498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482629 mask!1414))))

(assert (=> b!1087148 (= lt!482629 (array!70076 (store (arr!33705 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34242 _keys!1070)))))

(declare-fun b!1087149 () Bool)

(declare-fun res!724502 () Bool)

(assert (=> b!1087149 (=> (not res!724502) (not e!621132))))

(assert (=> b!1087149 (= res!724502 (= (select (arr!33705 _keys!1070) i!650) k0!904))))

(assert (= (and start!96132 res!724501) b!1087147))

(assert (= (and b!1087147 res!724505) b!1087143))

(assert (= (and b!1087143 res!724504) b!1087136))

(assert (= (and b!1087136 res!724499) b!1087138))

(assert (= (and b!1087138 res!724496) b!1087141))

(assert (= (and b!1087141 res!724497) b!1087149))

(assert (= (and b!1087149 res!724502) b!1087148))

(assert (= (and b!1087148 res!724498) b!1087146))

(assert (= (and b!1087146 res!724500) b!1087144))

(assert (= (and b!1087144 (not res!724506)) b!1087140))

(assert (= (and b!1087140 (not res!724503)) b!1087142))

(assert (= (and b!1087137 condMapEmpty!41581) mapIsEmpty!41581))

(assert (= (and b!1087137 (not condMapEmpty!41581)) mapNonEmpty!41581))

(get-info :version)

(assert (= (and mapNonEmpty!41581 ((_ is ValueCellFull!12566) mapValue!41581)) b!1087139))

(assert (= (and b!1087137 ((_ is ValueCellFull!12566) mapDefault!41581)) b!1087145))

(assert (= start!96132 b!1087137))

(declare-fun b_lambda!17229 () Bool)

(assert (=> (not b_lambda!17229) (not b!1087144)))

(declare-fun t!33111 () Bool)

(declare-fun tb!7419 () Bool)

(assert (=> (and start!96132 (= defaultEntry!882 defaultEntry!882) t!33111) tb!7419))

(declare-fun result!15365 () Bool)

(assert (=> tb!7419 (= result!15365 tp_is_empty!26551)))

(assert (=> b!1087144 t!33111))

(declare-fun b_and!35785 () Bool)

(assert (= b_and!35783 (and (=> t!33111 result!15365) b_and!35785)))

(declare-fun m!1005695 () Bool)

(assert (=> b!1087136 m!1005695))

(declare-fun m!1005697 () Bool)

(assert (=> b!1087144 m!1005697))

(declare-fun m!1005699 () Bool)

(assert (=> b!1087144 m!1005699))

(declare-fun m!1005701 () Bool)

(assert (=> b!1087144 m!1005701))

(declare-fun m!1005703 () Bool)

(assert (=> b!1087144 m!1005703))

(declare-fun m!1005705 () Bool)

(assert (=> b!1087144 m!1005705))

(declare-fun m!1005707 () Bool)

(assert (=> b!1087144 m!1005707))

(declare-fun m!1005709 () Bool)

(assert (=> b!1087144 m!1005709))

(declare-fun m!1005711 () Bool)

(assert (=> b!1087144 m!1005711))

(declare-fun m!1005713 () Bool)

(assert (=> b!1087144 m!1005713))

(declare-fun m!1005715 () Bool)

(assert (=> b!1087144 m!1005715))

(declare-fun m!1005717 () Bool)

(assert (=> b!1087148 m!1005717))

(declare-fun m!1005719 () Bool)

(assert (=> b!1087148 m!1005719))

(declare-fun m!1005721 () Bool)

(assert (=> b!1087142 m!1005721))

(declare-fun m!1005723 () Bool)

(assert (=> b!1087142 m!1005723))

(declare-fun m!1005725 () Bool)

(assert (=> b!1087142 m!1005725))

(declare-fun m!1005727 () Bool)

(assert (=> b!1087141 m!1005727))

(declare-fun m!1005729 () Bool)

(assert (=> b!1087143 m!1005729))

(declare-fun m!1005731 () Bool)

(assert (=> b!1087146 m!1005731))

(declare-fun m!1005733 () Bool)

(assert (=> b!1087149 m!1005733))

(declare-fun m!1005735 () Bool)

(assert (=> mapNonEmpty!41581 m!1005735))

(declare-fun m!1005737 () Bool)

(assert (=> start!96132 m!1005737))

(declare-fun m!1005739 () Bool)

(assert (=> start!96132 m!1005739))

(declare-fun m!1005741 () Bool)

(assert (=> start!96132 m!1005741))

(declare-fun m!1005743 () Bool)

(assert (=> b!1087140 m!1005743))

(declare-fun m!1005745 () Bool)

(assert (=> b!1087140 m!1005745))

(declare-fun m!1005747 () Bool)

(assert (=> b!1087140 m!1005747))

(declare-fun m!1005749 () Bool)

(assert (=> b!1087140 m!1005749))

(declare-fun m!1005751 () Bool)

(assert (=> b!1087140 m!1005751))

(declare-fun m!1005753 () Bool)

(assert (=> b!1087140 m!1005753))

(declare-fun m!1005755 () Bool)

(assert (=> b!1087140 m!1005755))

(assert (=> b!1087140 m!1005743))

(declare-fun m!1005757 () Bool)

(assert (=> b!1087140 m!1005757))

(check-sat b_and!35785 (not b!1087143) (not b!1087142) (not b!1087140) tp_is_empty!26551 (not b!1087144) (not b!1087136) (not b_lambda!17229) (not b!1087146) (not start!96132) (not b!1087148) (not mapNonEmpty!41581) (not b_next!22549) (not b!1087141))
(check-sat b_and!35785 (not b_next!22549))
