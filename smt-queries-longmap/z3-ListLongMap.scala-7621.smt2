; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96040 () Bool)

(assert start!96040)

(declare-fun b_free!22699 () Bool)

(declare-fun b_next!22699 () Bool)

(assert (=> start!96040 (= b_free!22699 (not b_next!22699))))

(declare-fun tp!79945 () Bool)

(declare-fun b_and!36047 () Bool)

(assert (=> start!96040 (= tp!79945 b_and!36047)))

(declare-fun b!1088965 () Bool)

(declare-fun e!621985 () Bool)

(declare-fun e!621989 () Bool)

(assert (=> b!1088965 (= e!621985 (not e!621989))))

(declare-fun res!726391 () Bool)

(assert (=> b!1088965 (=> res!726391 e!621989)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088965 (= res!726391 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!40729 0))(
  ( (V!40730 (val!13407 Int)) )
))
(declare-fun minValue!831 () V!40729)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17082 0))(
  ( (tuple2!17083 (_1!8552 (_ BitVec 64)) (_2!8552 V!40729)) )
))
(declare-datatypes ((List!23651 0))(
  ( (Nil!23648) (Cons!23647 (h!24856 tuple2!17082) (t!33399 List!23651)) )
))
(declare-datatypes ((ListLongMap!15051 0))(
  ( (ListLongMap!15052 (toList!7541 List!23651)) )
))
(declare-fun lt!485199 () ListLongMap!15051)

(declare-fun zeroValue!831 () V!40729)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((array!70248 0))(
  ( (array!70249 (arr!33798 (Array (_ BitVec 32) (_ BitVec 64))) (size!34336 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70248)

(declare-datatypes ((ValueCell!12641 0))(
  ( (ValueCellFull!12641 (v!16027 V!40729)) (EmptyCell!12641) )
))
(declare-datatypes ((array!70250 0))(
  ( (array!70251 (arr!33799 (Array (_ BitVec 32) ValueCell!12641)) (size!34337 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70250)

(declare-fun getCurrentListMap!4220 (array!70248 array!70250 (_ BitVec 32) (_ BitVec 32) V!40729 V!40729 (_ BitVec 32) Int) ListLongMap!15051)

(assert (=> b!1088965 (= lt!485199 (getCurrentListMap!4220 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485209 () array!70248)

(declare-fun lt!485210 () ListLongMap!15051)

(declare-fun lt!485208 () array!70250)

(assert (=> b!1088965 (= lt!485210 (getCurrentListMap!4220 lt!485209 lt!485208 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485204 () ListLongMap!15051)

(declare-fun lt!485205 () ListLongMap!15051)

(assert (=> b!1088965 (and (= lt!485204 lt!485205) (= lt!485205 lt!485204))))

(declare-fun lt!485198 () ListLongMap!15051)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!819 (ListLongMap!15051 (_ BitVec 64)) ListLongMap!15051)

(assert (=> b!1088965 (= lt!485205 (-!819 lt!485198 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35673 0))(
  ( (Unit!35674) )
))
(declare-fun lt!485203 () Unit!35673)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!104 (array!70248 array!70250 (_ BitVec 32) (_ BitVec 32) V!40729 V!40729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35673)

(assert (=> b!1088965 (= lt!485203 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!104 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4090 (array!70248 array!70250 (_ BitVec 32) (_ BitVec 32) V!40729 V!40729 (_ BitVec 32) Int) ListLongMap!15051)

(assert (=> b!1088965 (= lt!485204 (getCurrentListMapNoExtraKeys!4090 lt!485209 lt!485208 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2161 (Int (_ BitVec 64)) V!40729)

(assert (=> b!1088965 (= lt!485208 (array!70251 (store (arr!33799 _values!874) i!650 (ValueCellFull!12641 (dynLambda!2161 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34337 _values!874)))))

(assert (=> b!1088965 (= lt!485198 (getCurrentListMapNoExtraKeys!4090 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088965 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485207 () Unit!35673)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70248 (_ BitVec 64) (_ BitVec 32)) Unit!35673)

(assert (=> b!1088965 (= lt!485207 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088966 () Bool)

(declare-fun res!726389 () Bool)

(declare-fun e!621983 () Bool)

(assert (=> b!1088966 (=> (not res!726389) (not e!621983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70248 (_ BitVec 32)) Bool)

(assert (=> b!1088966 (= res!726389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088967 () Bool)

(declare-fun e!621987 () Bool)

(declare-fun tp_is_empty!26701 () Bool)

(assert (=> b!1088967 (= e!621987 tp_is_empty!26701)))

(declare-fun b!1088968 () Bool)

(declare-fun res!726393 () Bool)

(assert (=> b!1088968 (=> (not res!726393) (not e!621983))))

(assert (=> b!1088968 (= res!726393 (and (= (size!34337 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34336 _keys!1070) (size!34337 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088969 () Bool)

(declare-fun e!621982 () Bool)

(assert (=> b!1088969 (= e!621982 tp_is_empty!26701)))

(declare-fun b!1088970 () Bool)

(declare-fun res!726395 () Bool)

(assert (=> b!1088970 (=> (not res!726395) (not e!621983))))

(declare-datatypes ((List!23652 0))(
  ( (Nil!23649) (Cons!23648 (h!24857 (_ BitVec 64)) (t!33400 List!23652)) )
))
(declare-fun arrayNoDuplicates!0 (array!70248 (_ BitVec 32) List!23652) Bool)

(assert (=> b!1088970 (= res!726395 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23649))))

(declare-fun mapIsEmpty!41806 () Bool)

(declare-fun mapRes!41806 () Bool)

(assert (=> mapIsEmpty!41806 mapRes!41806))

(declare-fun b!1088971 () Bool)

(declare-fun res!726398 () Bool)

(assert (=> b!1088971 (=> (not res!726398) (not e!621983))))

(assert (=> b!1088971 (= res!726398 (= (select (arr!33798 _keys!1070) i!650) k0!904))))

(declare-fun b!1088972 () Bool)

(declare-fun res!726399 () Bool)

(assert (=> b!1088972 (=> (not res!726399) (not e!621983))))

(assert (=> b!1088972 (= res!726399 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34336 _keys!1070))))))

(declare-fun b!1088973 () Bool)

(assert (=> b!1088973 (= e!621983 e!621985)))

(declare-fun res!726390 () Bool)

(assert (=> b!1088973 (=> (not res!726390) (not e!621985))))

(assert (=> b!1088973 (= res!726390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485209 mask!1414))))

(assert (=> b!1088973 (= lt!485209 (array!70249 (store (arr!33798 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34336 _keys!1070)))))

(declare-fun b!1088974 () Bool)

(declare-fun e!621984 () Bool)

(assert (=> b!1088974 (= e!621989 e!621984)))

(declare-fun res!726394 () Bool)

(assert (=> b!1088974 (=> res!726394 e!621984)))

(assert (=> b!1088974 (= res!726394 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!485206 () ListLongMap!15051)

(assert (=> b!1088974 (= lt!485210 lt!485206)))

(declare-fun lt!485200 () tuple2!17082)

(declare-fun +!3341 (ListLongMap!15051 tuple2!17082) ListLongMap!15051)

(assert (=> b!1088974 (= lt!485206 (+!3341 lt!485205 lt!485200))))

(declare-fun lt!485201 () ListLongMap!15051)

(assert (=> b!1088974 (= lt!485199 lt!485201)))

(assert (=> b!1088974 (= lt!485201 (+!3341 lt!485198 lt!485200))))

(assert (=> b!1088974 (= lt!485210 (+!3341 lt!485204 lt!485200))))

(assert (=> b!1088974 (= lt!485200 (tuple2!17083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088975 () Bool)

(declare-fun res!726392 () Bool)

(assert (=> b!1088975 (=> (not res!726392) (not e!621985))))

(assert (=> b!1088975 (= res!726392 (arrayNoDuplicates!0 lt!485209 #b00000000000000000000000000000000 Nil!23649))))

(declare-fun res!726397 () Bool)

(assert (=> start!96040 (=> (not res!726397) (not e!621983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96040 (= res!726397 (validMask!0 mask!1414))))

(assert (=> start!96040 e!621983))

(assert (=> start!96040 tp!79945))

(assert (=> start!96040 true))

(assert (=> start!96040 tp_is_empty!26701))

(declare-fun array_inv!26110 (array!70248) Bool)

(assert (=> start!96040 (array_inv!26110 _keys!1070)))

(declare-fun e!621988 () Bool)

(declare-fun array_inv!26111 (array!70250) Bool)

(assert (=> start!96040 (and (array_inv!26111 _values!874) e!621988)))

(declare-fun mapNonEmpty!41806 () Bool)

(declare-fun tp!79946 () Bool)

(assert (=> mapNonEmpty!41806 (= mapRes!41806 (and tp!79946 e!621987))))

(declare-fun mapValue!41806 () ValueCell!12641)

(declare-fun mapKey!41806 () (_ BitVec 32))

(declare-fun mapRest!41806 () (Array (_ BitVec 32) ValueCell!12641))

(assert (=> mapNonEmpty!41806 (= (arr!33799 _values!874) (store mapRest!41806 mapKey!41806 mapValue!41806))))

(declare-fun b!1088976 () Bool)

(assert (=> b!1088976 (= e!621984 true)))

(assert (=> b!1088976 (= (-!819 lt!485201 k0!904) lt!485206)))

(declare-fun lt!485202 () Unit!35673)

(declare-fun addRemoveCommutativeForDiffKeys!70 (ListLongMap!15051 (_ BitVec 64) V!40729 (_ BitVec 64)) Unit!35673)

(assert (=> b!1088976 (= lt!485202 (addRemoveCommutativeForDiffKeys!70 lt!485198 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088977 () Bool)

(declare-fun res!726396 () Bool)

(assert (=> b!1088977 (=> (not res!726396) (not e!621983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088977 (= res!726396 (validKeyInArray!0 k0!904))))

(declare-fun b!1088978 () Bool)

(assert (=> b!1088978 (= e!621988 (and e!621982 mapRes!41806))))

(declare-fun condMapEmpty!41806 () Bool)

(declare-fun mapDefault!41806 () ValueCell!12641)

(assert (=> b!1088978 (= condMapEmpty!41806 (= (arr!33799 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12641)) mapDefault!41806)))))

(assert (= (and start!96040 res!726397) b!1088968))

(assert (= (and b!1088968 res!726393) b!1088966))

(assert (= (and b!1088966 res!726389) b!1088970))

(assert (= (and b!1088970 res!726395) b!1088972))

(assert (= (and b!1088972 res!726399) b!1088977))

(assert (= (and b!1088977 res!726396) b!1088971))

(assert (= (and b!1088971 res!726398) b!1088973))

(assert (= (and b!1088973 res!726390) b!1088975))

(assert (= (and b!1088975 res!726392) b!1088965))

(assert (= (and b!1088965 (not res!726391)) b!1088974))

(assert (= (and b!1088974 (not res!726394)) b!1088976))

(assert (= (and b!1088978 condMapEmpty!41806) mapIsEmpty!41806))

(assert (= (and b!1088978 (not condMapEmpty!41806)) mapNonEmpty!41806))

(get-info :version)

(assert (= (and mapNonEmpty!41806 ((_ is ValueCellFull!12641) mapValue!41806)) b!1088967))

(assert (= (and b!1088978 ((_ is ValueCellFull!12641) mapDefault!41806)) b!1088969))

(assert (= start!96040 b!1088978))

(declare-fun b_lambda!17347 () Bool)

(assert (=> (not b_lambda!17347) (not b!1088965)))

(declare-fun t!33398 () Bool)

(declare-fun tb!7569 () Bool)

(assert (=> (and start!96040 (= defaultEntry!882 defaultEntry!882) t!33398) tb!7569))

(declare-fun result!15665 () Bool)

(assert (=> tb!7569 (= result!15665 tp_is_empty!26701)))

(assert (=> b!1088965 t!33398))

(declare-fun b_and!36049 () Bool)

(assert (= b_and!36047 (and (=> t!33398 result!15665) b_and!36049)))

(declare-fun m!1007681 () Bool)

(assert (=> b!1088965 m!1007681))

(declare-fun m!1007683 () Bool)

(assert (=> b!1088965 m!1007683))

(declare-fun m!1007685 () Bool)

(assert (=> b!1088965 m!1007685))

(declare-fun m!1007687 () Bool)

(assert (=> b!1088965 m!1007687))

(declare-fun m!1007689 () Bool)

(assert (=> b!1088965 m!1007689))

(declare-fun m!1007691 () Bool)

(assert (=> b!1088965 m!1007691))

(declare-fun m!1007693 () Bool)

(assert (=> b!1088965 m!1007693))

(declare-fun m!1007695 () Bool)

(assert (=> b!1088965 m!1007695))

(declare-fun m!1007697 () Bool)

(assert (=> b!1088965 m!1007697))

(declare-fun m!1007699 () Bool)

(assert (=> b!1088965 m!1007699))

(declare-fun m!1007701 () Bool)

(assert (=> b!1088973 m!1007701))

(declare-fun m!1007703 () Bool)

(assert (=> b!1088973 m!1007703))

(declare-fun m!1007705 () Bool)

(assert (=> start!96040 m!1007705))

(declare-fun m!1007707 () Bool)

(assert (=> start!96040 m!1007707))

(declare-fun m!1007709 () Bool)

(assert (=> start!96040 m!1007709))

(declare-fun m!1007711 () Bool)

(assert (=> b!1088974 m!1007711))

(declare-fun m!1007713 () Bool)

(assert (=> b!1088974 m!1007713))

(declare-fun m!1007715 () Bool)

(assert (=> b!1088974 m!1007715))

(declare-fun m!1007717 () Bool)

(assert (=> b!1088970 m!1007717))

(declare-fun m!1007719 () Bool)

(assert (=> b!1088975 m!1007719))

(declare-fun m!1007721 () Bool)

(assert (=> b!1088976 m!1007721))

(declare-fun m!1007723 () Bool)

(assert (=> b!1088976 m!1007723))

(declare-fun m!1007725 () Bool)

(assert (=> b!1088966 m!1007725))

(declare-fun m!1007727 () Bool)

(assert (=> b!1088977 m!1007727))

(declare-fun m!1007729 () Bool)

(assert (=> b!1088971 m!1007729))

(declare-fun m!1007731 () Bool)

(assert (=> mapNonEmpty!41806 m!1007731))

(check-sat (not b!1088975) (not b!1088976) (not b!1088974) (not mapNonEmpty!41806) b_and!36049 tp_is_empty!26701 (not b!1088970) (not b_next!22699) (not b_lambda!17347) (not start!96040) (not b!1088977) (not b!1088966) (not b!1088965) (not b!1088973))
(check-sat b_and!36049 (not b_next!22699))
