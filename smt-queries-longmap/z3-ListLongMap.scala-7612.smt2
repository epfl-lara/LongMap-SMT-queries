; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95994 () Bool)

(assert start!95994)

(declare-fun b_free!22647 () Bool)

(declare-fun b_next!22647 () Bool)

(assert (=> start!95994 (= b_free!22647 (not b_next!22647))))

(declare-fun tp!79789 () Bool)

(declare-fun b_and!35969 () Bool)

(assert (=> start!95994 (= tp!79789 b_and!35969)))

(declare-fun b!1087974 () Bool)

(declare-fun e!621451 () Bool)

(declare-fun tp_is_empty!26649 () Bool)

(assert (=> b!1087974 (= e!621451 tp_is_empty!26649)))

(declare-fun b!1087975 () Bool)

(declare-fun res!725603 () Bool)

(declare-fun e!621453 () Bool)

(assert (=> b!1087975 (=> (not res!725603) (not e!621453))))

(declare-datatypes ((array!70223 0))(
  ( (array!70224 (arr!33785 (Array (_ BitVec 32) (_ BitVec 64))) (size!34321 (_ BitVec 32))) )
))
(declare-fun lt!484386 () array!70223)

(declare-datatypes ((List!23570 0))(
  ( (Nil!23567) (Cons!23566 (h!24775 (_ BitVec 64)) (t!33275 List!23570)) )
))
(declare-fun arrayNoDuplicates!0 (array!70223 (_ BitVec 32) List!23570) Bool)

(assert (=> b!1087975 (= res!725603 (arrayNoDuplicates!0 lt!484386 #b00000000000000000000000000000000 Nil!23567))))

(declare-fun b!1087976 () Bool)

(declare-fun e!621457 () Bool)

(assert (=> b!1087976 (= e!621457 true)))

(declare-datatypes ((V!40659 0))(
  ( (V!40660 (val!13381 Int)) )
))
(declare-datatypes ((tuple2!16984 0))(
  ( (tuple2!16985 (_1!8503 (_ BitVec 64)) (_2!8503 V!40659)) )
))
(declare-datatypes ((List!23571 0))(
  ( (Nil!23568) (Cons!23567 (h!24776 tuple2!16984) (t!33276 List!23571)) )
))
(declare-datatypes ((ListLongMap!14953 0))(
  ( (ListLongMap!14954 (toList!7492 List!23571)) )
))
(declare-fun lt!484395 () ListLongMap!14953)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!484390 () ListLongMap!14953)

(declare-fun -!817 (ListLongMap!14953 (_ BitVec 64)) ListLongMap!14953)

(assert (=> b!1087976 (= (-!817 lt!484395 k0!904) lt!484390)))

(declare-fun lt!484385 () ListLongMap!14953)

(declare-datatypes ((Unit!35800 0))(
  ( (Unit!35801) )
))
(declare-fun lt!484391 () Unit!35800)

(declare-fun zeroValue!831 () V!40659)

(declare-fun addRemoveCommutativeForDiffKeys!48 (ListLongMap!14953 (_ BitVec 64) V!40659 (_ BitVec 64)) Unit!35800)

(assert (=> b!1087976 (= lt!484391 (addRemoveCommutativeForDiffKeys!48 lt!484385 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087977 () Bool)

(declare-fun e!621454 () Bool)

(assert (=> b!1087977 (= e!621454 e!621457)))

(declare-fun res!725606 () Bool)

(assert (=> b!1087977 (=> res!725606 e!621457)))

(assert (=> b!1087977 (= res!725606 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484396 () ListLongMap!14953)

(assert (=> b!1087977 (= lt!484396 lt!484390)))

(declare-fun lt!484389 () ListLongMap!14953)

(declare-fun lt!484388 () tuple2!16984)

(declare-fun +!3293 (ListLongMap!14953 tuple2!16984) ListLongMap!14953)

(assert (=> b!1087977 (= lt!484390 (+!3293 lt!484389 lt!484388))))

(declare-fun lt!484384 () ListLongMap!14953)

(assert (=> b!1087977 (= lt!484384 lt!484395)))

(assert (=> b!1087977 (= lt!484395 (+!3293 lt!484385 lt!484388))))

(declare-fun lt!484387 () ListLongMap!14953)

(assert (=> b!1087977 (= lt!484396 (+!3293 lt!484387 lt!484388))))

(assert (=> b!1087977 (= lt!484388 (tuple2!16985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087978 () Bool)

(declare-fun res!725600 () Bool)

(declare-fun e!621452 () Bool)

(assert (=> b!1087978 (=> (not res!725600) (not e!621452))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70223)

(declare-datatypes ((ValueCell!12615 0))(
  ( (ValueCellFull!12615 (v!16002 V!40659)) (EmptyCell!12615) )
))
(declare-datatypes ((array!70225 0))(
  ( (array!70226 (arr!33786 (Array (_ BitVec 32) ValueCell!12615)) (size!34322 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70225)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1087978 (= res!725600 (and (= (size!34322 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34321 _keys!1070) (size!34322 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087979 () Bool)

(assert (=> b!1087979 (= e!621452 e!621453)))

(declare-fun res!725607 () Bool)

(assert (=> b!1087979 (=> (not res!725607) (not e!621453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70223 (_ BitVec 32)) Bool)

(assert (=> b!1087979 (= res!725607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484386 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087979 (= lt!484386 (array!70224 (store (arr!33785 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34321 _keys!1070)))))

(declare-fun b!1087980 () Bool)

(declare-fun res!725604 () Bool)

(assert (=> b!1087980 (=> (not res!725604) (not e!621452))))

(assert (=> b!1087980 (= res!725604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!725601 () Bool)

(assert (=> start!95994 (=> (not res!725601) (not e!621452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95994 (= res!725601 (validMask!0 mask!1414))))

(assert (=> start!95994 e!621452))

(assert (=> start!95994 tp!79789))

(assert (=> start!95994 true))

(assert (=> start!95994 tp_is_empty!26649))

(declare-fun array_inv!26056 (array!70223) Bool)

(assert (=> start!95994 (array_inv!26056 _keys!1070)))

(declare-fun e!621458 () Bool)

(declare-fun array_inv!26057 (array!70225) Bool)

(assert (=> start!95994 (and (array_inv!26057 _values!874) e!621458)))

(declare-fun b!1087981 () Bool)

(declare-fun res!725605 () Bool)

(assert (=> b!1087981 (=> (not res!725605) (not e!621452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087981 (= res!725605 (validKeyInArray!0 k0!904))))

(declare-fun b!1087982 () Bool)

(declare-fun res!725608 () Bool)

(assert (=> b!1087982 (=> (not res!725608) (not e!621452))))

(assert (=> b!1087982 (= res!725608 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23567))))

(declare-fun b!1087983 () Bool)

(declare-fun res!725602 () Bool)

(assert (=> b!1087983 (=> (not res!725602) (not e!621452))))

(assert (=> b!1087983 (= res!725602 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34321 _keys!1070))))))

(declare-fun mapIsEmpty!41728 () Bool)

(declare-fun mapRes!41728 () Bool)

(assert (=> mapIsEmpty!41728 mapRes!41728))

(declare-fun mapNonEmpty!41728 () Bool)

(declare-fun tp!79790 () Bool)

(assert (=> mapNonEmpty!41728 (= mapRes!41728 (and tp!79790 e!621451))))

(declare-fun mapKey!41728 () (_ BitVec 32))

(declare-fun mapRest!41728 () (Array (_ BitVec 32) ValueCell!12615))

(declare-fun mapValue!41728 () ValueCell!12615)

(assert (=> mapNonEmpty!41728 (= (arr!33786 _values!874) (store mapRest!41728 mapKey!41728 mapValue!41728))))

(declare-fun b!1087984 () Bool)

(declare-fun res!725610 () Bool)

(assert (=> b!1087984 (=> (not res!725610) (not e!621452))))

(assert (=> b!1087984 (= res!725610 (= (select (arr!33785 _keys!1070) i!650) k0!904))))

(declare-fun b!1087985 () Bool)

(assert (=> b!1087985 (= e!621453 (not e!621454))))

(declare-fun res!725609 () Bool)

(assert (=> b!1087985 (=> res!725609 e!621454)))

(assert (=> b!1087985 (= res!725609 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40659)

(declare-fun getCurrentListMap!4266 (array!70223 array!70225 (_ BitVec 32) (_ BitVec 32) V!40659 V!40659 (_ BitVec 32) Int) ListLongMap!14953)

(assert (=> b!1087985 (= lt!484384 (getCurrentListMap!4266 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484394 () array!70225)

(assert (=> b!1087985 (= lt!484396 (getCurrentListMap!4266 lt!484386 lt!484394 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087985 (and (= lt!484387 lt!484389) (= lt!484389 lt!484387))))

(assert (=> b!1087985 (= lt!484389 (-!817 lt!484385 k0!904))))

(declare-fun lt!484393 () Unit!35800)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!85 (array!70223 array!70225 (_ BitVec 32) (_ BitVec 32) V!40659 V!40659 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35800)

(assert (=> b!1087985 (= lt!484393 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!85 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4026 (array!70223 array!70225 (_ BitVec 32) (_ BitVec 32) V!40659 V!40659 (_ BitVec 32) Int) ListLongMap!14953)

(assert (=> b!1087985 (= lt!484387 (getCurrentListMapNoExtraKeys!4026 lt!484386 lt!484394 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2163 (Int (_ BitVec 64)) V!40659)

(assert (=> b!1087985 (= lt!484394 (array!70226 (store (arr!33786 _values!874) i!650 (ValueCellFull!12615 (dynLambda!2163 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34322 _values!874)))))

(assert (=> b!1087985 (= lt!484385 (getCurrentListMapNoExtraKeys!4026 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087985 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484392 () Unit!35800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70223 (_ BitVec 64) (_ BitVec 32)) Unit!35800)

(assert (=> b!1087985 (= lt!484392 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087986 () Bool)

(declare-fun e!621456 () Bool)

(assert (=> b!1087986 (= e!621458 (and e!621456 mapRes!41728))))

(declare-fun condMapEmpty!41728 () Bool)

(declare-fun mapDefault!41728 () ValueCell!12615)

(assert (=> b!1087986 (= condMapEmpty!41728 (= (arr!33786 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12615)) mapDefault!41728)))))

(declare-fun b!1087987 () Bool)

(assert (=> b!1087987 (= e!621456 tp_is_empty!26649)))

(assert (= (and start!95994 res!725601) b!1087978))

(assert (= (and b!1087978 res!725600) b!1087980))

(assert (= (and b!1087980 res!725604) b!1087982))

(assert (= (and b!1087982 res!725608) b!1087983))

(assert (= (and b!1087983 res!725602) b!1087981))

(assert (= (and b!1087981 res!725605) b!1087984))

(assert (= (and b!1087984 res!725610) b!1087979))

(assert (= (and b!1087979 res!725607) b!1087975))

(assert (= (and b!1087975 res!725603) b!1087985))

(assert (= (and b!1087985 (not res!725609)) b!1087977))

(assert (= (and b!1087977 (not res!725606)) b!1087976))

(assert (= (and b!1087986 condMapEmpty!41728) mapIsEmpty!41728))

(assert (= (and b!1087986 (not condMapEmpty!41728)) mapNonEmpty!41728))

(get-info :version)

(assert (= (and mapNonEmpty!41728 ((_ is ValueCellFull!12615) mapValue!41728)) b!1087974))

(assert (= (and b!1087986 ((_ is ValueCellFull!12615) mapDefault!41728)) b!1087987))

(assert (= start!95994 b!1087986))

(declare-fun b_lambda!17317 () Bool)

(assert (=> (not b_lambda!17317) (not b!1087985)))

(declare-fun t!33274 () Bool)

(declare-fun tb!7525 () Bool)

(assert (=> (and start!95994 (= defaultEntry!882 defaultEntry!882) t!33274) tb!7525))

(declare-fun result!15569 () Bool)

(assert (=> tb!7525 (= result!15569 tp_is_empty!26649)))

(assert (=> b!1087985 t!33274))

(declare-fun b_and!35971 () Bool)

(assert (= b_and!35969 (and (=> t!33274 result!15569) b_and!35971)))

(declare-fun m!1006955 () Bool)

(assert (=> b!1087980 m!1006955))

(declare-fun m!1006957 () Bool)

(assert (=> b!1087976 m!1006957))

(declare-fun m!1006959 () Bool)

(assert (=> b!1087976 m!1006959))

(declare-fun m!1006961 () Bool)

(assert (=> start!95994 m!1006961))

(declare-fun m!1006963 () Bool)

(assert (=> start!95994 m!1006963))

(declare-fun m!1006965 () Bool)

(assert (=> start!95994 m!1006965))

(declare-fun m!1006967 () Bool)

(assert (=> b!1087979 m!1006967))

(declare-fun m!1006969 () Bool)

(assert (=> b!1087979 m!1006969))

(declare-fun m!1006971 () Bool)

(assert (=> mapNonEmpty!41728 m!1006971))

(declare-fun m!1006973 () Bool)

(assert (=> b!1087981 m!1006973))

(declare-fun m!1006975 () Bool)

(assert (=> b!1087982 m!1006975))

(declare-fun m!1006977 () Bool)

(assert (=> b!1087985 m!1006977))

(declare-fun m!1006979 () Bool)

(assert (=> b!1087985 m!1006979))

(declare-fun m!1006981 () Bool)

(assert (=> b!1087985 m!1006981))

(declare-fun m!1006983 () Bool)

(assert (=> b!1087985 m!1006983))

(declare-fun m!1006985 () Bool)

(assert (=> b!1087985 m!1006985))

(declare-fun m!1006987 () Bool)

(assert (=> b!1087985 m!1006987))

(declare-fun m!1006989 () Bool)

(assert (=> b!1087985 m!1006989))

(declare-fun m!1006991 () Bool)

(assert (=> b!1087985 m!1006991))

(declare-fun m!1006993 () Bool)

(assert (=> b!1087985 m!1006993))

(declare-fun m!1006995 () Bool)

(assert (=> b!1087985 m!1006995))

(declare-fun m!1006997 () Bool)

(assert (=> b!1087984 m!1006997))

(declare-fun m!1006999 () Bool)

(assert (=> b!1087975 m!1006999))

(declare-fun m!1007001 () Bool)

(assert (=> b!1087977 m!1007001))

(declare-fun m!1007003 () Bool)

(assert (=> b!1087977 m!1007003))

(declare-fun m!1007005 () Bool)

(assert (=> b!1087977 m!1007005))

(check-sat b_and!35971 (not b!1087979) (not b!1087982) (not b!1087980) tp_is_empty!26649 (not b!1087977) (not b!1087976) (not start!95994) (not b!1087981) (not b!1087985) (not b!1087975) (not b_next!22647) (not mapNonEmpty!41728) (not b_lambda!17317))
(check-sat b_and!35971 (not b_next!22647))
