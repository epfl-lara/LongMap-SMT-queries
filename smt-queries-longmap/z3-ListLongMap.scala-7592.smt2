; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95866 () Bool)

(assert start!95866)

(declare-fun b_free!22525 () Bool)

(declare-fun b_next!22525 () Bool)

(assert (=> start!95866 (= b_free!22525 (not b_next!22525))))

(declare-fun tp!79423 () Bool)

(declare-fun b_and!35699 () Bool)

(assert (=> start!95866 (= tp!79423 b_and!35699)))

(declare-fun b!1085128 () Bool)

(declare-fun res!723518 () Bool)

(declare-fun e!619895 () Bool)

(assert (=> b!1085128 (=> (not res!723518) (not e!619895))))

(declare-datatypes ((array!69912 0))(
  ( (array!69913 (arr!33630 (Array (_ BitVec 32) (_ BitVec 64))) (size!34168 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69912)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085128 (= res!723518 (= (select (arr!33630 _keys!1070) i!650) k0!904))))

(declare-fun b!1085129 () Bool)

(declare-fun res!723514 () Bool)

(declare-fun e!619897 () Bool)

(assert (=> b!1085129 (=> (not res!723514) (not e!619897))))

(declare-fun lt!481311 () array!69912)

(declare-datatypes ((List!23511 0))(
  ( (Nil!23508) (Cons!23507 (h!24716 (_ BitVec 64)) (t!33085 List!23511)) )
))
(declare-fun arrayNoDuplicates!0 (array!69912 (_ BitVec 32) List!23511) Bool)

(assert (=> b!1085129 (= res!723514 (arrayNoDuplicates!0 lt!481311 #b00000000000000000000000000000000 Nil!23508))))

(declare-fun b!1085130 () Bool)

(declare-fun e!619901 () Bool)

(declare-fun tp_is_empty!26527 () Bool)

(assert (=> b!1085130 (= e!619901 tp_is_empty!26527)))

(declare-fun mapIsEmpty!41545 () Bool)

(declare-fun mapRes!41545 () Bool)

(assert (=> mapIsEmpty!41545 mapRes!41545))

(declare-fun b!1085131 () Bool)

(declare-fun res!723517 () Bool)

(assert (=> b!1085131 (=> (not res!723517) (not e!619895))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69912 (_ BitVec 32)) Bool)

(assert (=> b!1085131 (= res!723517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085132 () Bool)

(assert (=> b!1085132 (= e!619895 e!619897)))

(declare-fun res!723510 () Bool)

(assert (=> b!1085132 (=> (not res!723510) (not e!619897))))

(assert (=> b!1085132 (= res!723510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481311 mask!1414))))

(assert (=> b!1085132 (= lt!481311 (array!69913 (store (arr!33630 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34168 _keys!1070)))))

(declare-fun b!1085133 () Bool)

(declare-fun e!619894 () Bool)

(assert (=> b!1085133 (= e!619894 true)))

(declare-datatypes ((V!40497 0))(
  ( (V!40498 (val!13320 Int)) )
))
(declare-datatypes ((tuple2!16940 0))(
  ( (tuple2!16941 (_1!8481 (_ BitVec 64)) (_2!8481 V!40497)) )
))
(declare-datatypes ((List!23512 0))(
  ( (Nil!23509) (Cons!23508 (h!24717 tuple2!16940) (t!33086 List!23512)) )
))
(declare-datatypes ((ListLongMap!14909 0))(
  ( (ListLongMap!14910 (toList!7470 List!23512)) )
))
(declare-fun lt!481300 () ListLongMap!14909)

(declare-fun lt!481303 () ListLongMap!14909)

(declare-fun lt!481312 () tuple2!16940)

(declare-fun -!749 (ListLongMap!14909 (_ BitVec 64)) ListLongMap!14909)

(declare-fun +!3278 (ListLongMap!14909 tuple2!16940) ListLongMap!14909)

(assert (=> b!1085133 (= (-!749 lt!481300 k0!904) (+!3278 lt!481303 lt!481312))))

(declare-fun lt!481310 () ListLongMap!14909)

(declare-fun minValue!831 () V!40497)

(declare-datatypes ((Unit!35533 0))(
  ( (Unit!35534) )
))
(declare-fun lt!481304 () Unit!35533)

(declare-fun addRemoveCommutativeForDiffKeys!7 (ListLongMap!14909 (_ BitVec 64) V!40497 (_ BitVec 64)) Unit!35533)

(assert (=> b!1085133 (= lt!481304 (addRemoveCommutativeForDiffKeys!7 lt!481310 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085134 () Bool)

(declare-fun res!723516 () Bool)

(assert (=> b!1085134 (=> (not res!723516) (not e!619895))))

(assert (=> b!1085134 (= res!723516 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23508))))

(declare-fun b!1085135 () Bool)

(declare-fun res!723512 () Bool)

(assert (=> b!1085135 (=> (not res!723512) (not e!619895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085135 (= res!723512 (validKeyInArray!0 k0!904))))

(declare-fun b!1085136 () Bool)

(declare-fun e!619899 () Bool)

(assert (=> b!1085136 (= e!619899 e!619894)))

(declare-fun res!723509 () Bool)

(assert (=> b!1085136 (=> res!723509 e!619894)))

(assert (=> b!1085136 (= res!723509 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481305 () ListLongMap!14909)

(assert (=> b!1085136 (= lt!481303 lt!481305)))

(assert (=> b!1085136 (= lt!481303 (-!749 lt!481310 k0!904))))

(declare-fun lt!481307 () Unit!35533)

(declare-fun lt!481301 () ListLongMap!14909)

(declare-fun zeroValue!831 () V!40497)

(assert (=> b!1085136 (= lt!481307 (addRemoveCommutativeForDiffKeys!7 lt!481301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481315 () ListLongMap!14909)

(assert (=> b!1085136 (= lt!481315 (+!3278 lt!481305 lt!481312))))

(declare-fun lt!481313 () ListLongMap!14909)

(declare-fun lt!481316 () tuple2!16940)

(assert (=> b!1085136 (= lt!481305 (+!3278 lt!481313 lt!481316))))

(declare-fun lt!481302 () ListLongMap!14909)

(assert (=> b!1085136 (= lt!481302 lt!481300)))

(assert (=> b!1085136 (= lt!481300 (+!3278 lt!481310 lt!481312))))

(assert (=> b!1085136 (= lt!481310 (+!3278 lt!481301 lt!481316))))

(declare-fun lt!481314 () ListLongMap!14909)

(assert (=> b!1085136 (= lt!481315 (+!3278 (+!3278 lt!481314 lt!481316) lt!481312))))

(assert (=> b!1085136 (= lt!481312 (tuple2!16941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085136 (= lt!481316 (tuple2!16941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085137 () Bool)

(assert (=> b!1085137 (= e!619897 (not e!619899))))

(declare-fun res!723515 () Bool)

(assert (=> b!1085137 (=> res!723515 e!619899)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085137 (= res!723515 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((ValueCell!12554 0))(
  ( (ValueCellFull!12554 (v!15940 V!40497)) (EmptyCell!12554) )
))
(declare-datatypes ((array!69914 0))(
  ( (array!69915 (arr!33631 (Array (_ BitVec 32) ValueCell!12554)) (size!34169 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69914)

(declare-fun getCurrentListMap!4161 (array!69912 array!69914 (_ BitVec 32) (_ BitVec 32) V!40497 V!40497 (_ BitVec 32) Int) ListLongMap!14909)

(assert (=> b!1085137 (= lt!481302 (getCurrentListMap!4161 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481308 () array!69914)

(assert (=> b!1085137 (= lt!481315 (getCurrentListMap!4161 lt!481311 lt!481308 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085137 (and (= lt!481314 lt!481313) (= lt!481313 lt!481314))))

(assert (=> b!1085137 (= lt!481313 (-!749 lt!481301 k0!904))))

(declare-fun lt!481306 () Unit!35533)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!45 (array!69912 array!69914 (_ BitVec 32) (_ BitVec 32) V!40497 V!40497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35533)

(assert (=> b!1085137 (= lt!481306 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!45 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4031 (array!69912 array!69914 (_ BitVec 32) (_ BitVec 32) V!40497 V!40497 (_ BitVec 32) Int) ListLongMap!14909)

(assert (=> b!1085137 (= lt!481314 (getCurrentListMapNoExtraKeys!4031 lt!481311 lt!481308 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2102 (Int (_ BitVec 64)) V!40497)

(assert (=> b!1085137 (= lt!481308 (array!69915 (store (arr!33631 _values!874) i!650 (ValueCellFull!12554 (dynLambda!2102 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34169 _values!874)))))

(assert (=> b!1085137 (= lt!481301 (getCurrentListMapNoExtraKeys!4031 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085137 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481309 () Unit!35533)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69912 (_ BitVec 64) (_ BitVec 32)) Unit!35533)

(assert (=> b!1085137 (= lt!481309 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085138 () Bool)

(declare-fun e!619898 () Bool)

(assert (=> b!1085138 (= e!619898 tp_is_empty!26527)))

(declare-fun b!1085139 () Bool)

(declare-fun res!723511 () Bool)

(assert (=> b!1085139 (=> (not res!723511) (not e!619895))))

(assert (=> b!1085139 (= res!723511 (and (= (size!34169 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34168 _keys!1070) (size!34169 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!723519 () Bool)

(assert (=> start!95866 (=> (not res!723519) (not e!619895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95866 (= res!723519 (validMask!0 mask!1414))))

(assert (=> start!95866 e!619895))

(assert (=> start!95866 tp!79423))

(assert (=> start!95866 true))

(assert (=> start!95866 tp_is_empty!26527))

(declare-fun array_inv!25988 (array!69912) Bool)

(assert (=> start!95866 (array_inv!25988 _keys!1070)))

(declare-fun e!619896 () Bool)

(declare-fun array_inv!25989 (array!69914) Bool)

(assert (=> start!95866 (and (array_inv!25989 _values!874) e!619896)))

(declare-fun mapNonEmpty!41545 () Bool)

(declare-fun tp!79424 () Bool)

(assert (=> mapNonEmpty!41545 (= mapRes!41545 (and tp!79424 e!619901))))

(declare-fun mapKey!41545 () (_ BitVec 32))

(declare-fun mapValue!41545 () ValueCell!12554)

(declare-fun mapRest!41545 () (Array (_ BitVec 32) ValueCell!12554))

(assert (=> mapNonEmpty!41545 (= (arr!33631 _values!874) (store mapRest!41545 mapKey!41545 mapValue!41545))))

(declare-fun b!1085140 () Bool)

(declare-fun res!723513 () Bool)

(assert (=> b!1085140 (=> (not res!723513) (not e!619895))))

(assert (=> b!1085140 (= res!723513 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34168 _keys!1070))))))

(declare-fun b!1085141 () Bool)

(assert (=> b!1085141 (= e!619896 (and e!619898 mapRes!41545))))

(declare-fun condMapEmpty!41545 () Bool)

(declare-fun mapDefault!41545 () ValueCell!12554)

(assert (=> b!1085141 (= condMapEmpty!41545 (= (arr!33631 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12554)) mapDefault!41545)))))

(assert (= (and start!95866 res!723519) b!1085139))

(assert (= (and b!1085139 res!723511) b!1085131))

(assert (= (and b!1085131 res!723517) b!1085134))

(assert (= (and b!1085134 res!723516) b!1085140))

(assert (= (and b!1085140 res!723513) b!1085135))

(assert (= (and b!1085135 res!723512) b!1085128))

(assert (= (and b!1085128 res!723518) b!1085132))

(assert (= (and b!1085132 res!723510) b!1085129))

(assert (= (and b!1085129 res!723514) b!1085137))

(assert (= (and b!1085137 (not res!723515)) b!1085136))

(assert (= (and b!1085136 (not res!723509)) b!1085133))

(assert (= (and b!1085141 condMapEmpty!41545) mapIsEmpty!41545))

(assert (= (and b!1085141 (not condMapEmpty!41545)) mapNonEmpty!41545))

(get-info :version)

(assert (= (and mapNonEmpty!41545 ((_ is ValueCellFull!12554) mapValue!41545)) b!1085130))

(assert (= (and b!1085141 ((_ is ValueCellFull!12554) mapDefault!41545)) b!1085138))

(assert (= start!95866 b!1085141))

(declare-fun b_lambda!17173 () Bool)

(assert (=> (not b_lambda!17173) (not b!1085137)))

(declare-fun t!33084 () Bool)

(declare-fun tb!7395 () Bool)

(assert (=> (and start!95866 (= defaultEntry!882 defaultEntry!882) t!33084) tb!7395))

(declare-fun result!15317 () Bool)

(assert (=> tb!7395 (= result!15317 tp_is_empty!26527)))

(assert (=> b!1085137 t!33084))

(declare-fun b_and!35701 () Bool)

(assert (= b_and!35699 (and (=> t!33084 result!15317) b_and!35701)))

(declare-fun m!1002629 () Bool)

(assert (=> b!1085133 m!1002629))

(declare-fun m!1002631 () Bool)

(assert (=> b!1085133 m!1002631))

(declare-fun m!1002633 () Bool)

(assert (=> b!1085133 m!1002633))

(declare-fun m!1002635 () Bool)

(assert (=> b!1085132 m!1002635))

(declare-fun m!1002637 () Bool)

(assert (=> b!1085132 m!1002637))

(declare-fun m!1002639 () Bool)

(assert (=> b!1085131 m!1002639))

(declare-fun m!1002641 () Bool)

(assert (=> start!95866 m!1002641))

(declare-fun m!1002643 () Bool)

(assert (=> start!95866 m!1002643))

(declare-fun m!1002645 () Bool)

(assert (=> start!95866 m!1002645))

(declare-fun m!1002647 () Bool)

(assert (=> mapNonEmpty!41545 m!1002647))

(declare-fun m!1002649 () Bool)

(assert (=> b!1085137 m!1002649))

(declare-fun m!1002651 () Bool)

(assert (=> b!1085137 m!1002651))

(declare-fun m!1002653 () Bool)

(assert (=> b!1085137 m!1002653))

(declare-fun m!1002655 () Bool)

(assert (=> b!1085137 m!1002655))

(declare-fun m!1002657 () Bool)

(assert (=> b!1085137 m!1002657))

(declare-fun m!1002659 () Bool)

(assert (=> b!1085137 m!1002659))

(declare-fun m!1002661 () Bool)

(assert (=> b!1085137 m!1002661))

(declare-fun m!1002663 () Bool)

(assert (=> b!1085137 m!1002663))

(declare-fun m!1002665 () Bool)

(assert (=> b!1085137 m!1002665))

(declare-fun m!1002667 () Bool)

(assert (=> b!1085137 m!1002667))

(declare-fun m!1002669 () Bool)

(assert (=> b!1085128 m!1002669))

(declare-fun m!1002671 () Bool)

(assert (=> b!1085136 m!1002671))

(declare-fun m!1002673 () Bool)

(assert (=> b!1085136 m!1002673))

(declare-fun m!1002675 () Bool)

(assert (=> b!1085136 m!1002675))

(declare-fun m!1002677 () Bool)

(assert (=> b!1085136 m!1002677))

(declare-fun m!1002679 () Bool)

(assert (=> b!1085136 m!1002679))

(declare-fun m!1002681 () Bool)

(assert (=> b!1085136 m!1002681))

(declare-fun m!1002683 () Bool)

(assert (=> b!1085136 m!1002683))

(assert (=> b!1085136 m!1002681))

(declare-fun m!1002685 () Bool)

(assert (=> b!1085136 m!1002685))

(declare-fun m!1002687 () Bool)

(assert (=> b!1085134 m!1002687))

(declare-fun m!1002689 () Bool)

(assert (=> b!1085129 m!1002689))

(declare-fun m!1002691 () Bool)

(assert (=> b!1085135 m!1002691))

(check-sat (not b_lambda!17173) (not start!95866) (not b!1085133) tp_is_empty!26527 (not b!1085131) (not b!1085136) (not b_next!22525) (not b!1085137) (not b!1085129) (not b!1085132) (not b!1085134) b_and!35701 (not b!1085135) (not mapNonEmpty!41545))
(check-sat b_and!35701 (not b_next!22525))
