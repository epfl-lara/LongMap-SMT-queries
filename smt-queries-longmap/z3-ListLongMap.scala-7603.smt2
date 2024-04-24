; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96174 () Bool)

(assert start!96174)

(declare-fun b_free!22591 () Bool)

(declare-fun b_next!22591 () Bool)

(assert (=> start!96174 (= b_free!22591 (not b_next!22591))))

(declare-fun tp!79621 () Bool)

(declare-fun b_and!35867 () Bool)

(assert (=> start!96174 (= tp!79621 b_and!35867)))

(declare-fun b!1088060 () Bool)

(declare-fun res!725192 () Bool)

(declare-fun e!621639 () Bool)

(assert (=> b!1088060 (=> (not res!725192) (not e!621639))))

(declare-datatypes ((array!70151 0))(
  ( (array!70152 (arr!33743 (Array (_ BitVec 32) (_ BitVec 64))) (size!34280 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70151)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1088060 (= res!725192 (= (select (arr!33743 _keys!1070) i!650) k0!904))))

(declare-fun b!1088061 () Bool)

(declare-fun e!621638 () Bool)

(declare-fun tp_is_empty!26593 () Bool)

(assert (=> b!1088061 (= e!621638 tp_is_empty!26593)))

(declare-fun b!1088062 () Bool)

(declare-fun e!621637 () Bool)

(declare-fun mapRes!41644 () Bool)

(assert (=> b!1088062 (= e!621637 (and e!621638 mapRes!41644))))

(declare-fun condMapEmpty!41644 () Bool)

(declare-datatypes ((V!40585 0))(
  ( (V!40586 (val!13353 Int)) )
))
(declare-datatypes ((ValueCell!12587 0))(
  ( (ValueCellFull!12587 (v!15970 V!40585)) (EmptyCell!12587) )
))
(declare-datatypes ((array!70153 0))(
  ( (array!70154 (arr!33744 (Array (_ BitVec 32) ValueCell!12587)) (size!34281 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70153)

(declare-fun mapDefault!41644 () ValueCell!12587)

(assert (=> b!1088062 (= condMapEmpty!41644 (= (arr!33744 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12587)) mapDefault!41644)))))

(declare-fun b!1088063 () Bool)

(declare-fun res!725191 () Bool)

(assert (=> b!1088063 (=> (not res!725191) (not e!621639))))

(declare-datatypes ((List!23543 0))(
  ( (Nil!23540) (Cons!23539 (h!24757 (_ BitVec 64)) (t!33184 List!23543)) )
))
(declare-fun arrayNoDuplicates!0 (array!70151 (_ BitVec 32) List!23543) Bool)

(assert (=> b!1088063 (= res!725191 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23540))))

(declare-fun b!1088064 () Bool)

(declare-fun e!621640 () Bool)

(assert (=> b!1088064 (= e!621640 true)))

(declare-datatypes ((tuple2!16948 0))(
  ( (tuple2!16949 (_1!8485 (_ BitVec 64)) (_2!8485 V!40585)) )
))
(declare-datatypes ((List!23544 0))(
  ( (Nil!23541) (Cons!23540 (h!24758 tuple2!16948) (t!33185 List!23544)) )
))
(declare-datatypes ((ListLongMap!14925 0))(
  ( (ListLongMap!14926 (toList!7478 List!23544)) )
))
(declare-fun lt!483705 () ListLongMap!14925)

(declare-fun lt!483713 () tuple2!16948)

(declare-fun lt!483700 () ListLongMap!14925)

(declare-fun -!790 (ListLongMap!14925 (_ BitVec 64)) ListLongMap!14925)

(declare-fun +!3301 (ListLongMap!14925 tuple2!16948) ListLongMap!14925)

(assert (=> b!1088064 (= (-!790 lt!483700 k0!904) (+!3301 lt!483705 lt!483713))))

(declare-fun lt!483710 () ListLongMap!14925)

(declare-fun minValue!831 () V!40585)

(declare-datatypes ((Unit!35747 0))(
  ( (Unit!35748) )
))
(declare-fun lt!483699 () Unit!35747)

(declare-fun addRemoveCommutativeForDiffKeys!35 (ListLongMap!14925 (_ BitVec 64) V!40585 (_ BitVec 64)) Unit!35747)

(assert (=> b!1088064 (= lt!483699 (addRemoveCommutativeForDiffKeys!35 lt!483710 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1088066 () Bool)

(declare-fun res!725189 () Bool)

(assert (=> b!1088066 (=> (not res!725189) (not e!621639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088066 (= res!725189 (validKeyInArray!0 k0!904))))

(declare-fun b!1088067 () Bool)

(declare-fun res!725197 () Bool)

(declare-fun e!621635 () Bool)

(assert (=> b!1088067 (=> (not res!725197) (not e!621635))))

(declare-fun lt!483704 () array!70151)

(assert (=> b!1088067 (= res!725197 (arrayNoDuplicates!0 lt!483704 #b00000000000000000000000000000000 Nil!23540))))

(declare-fun b!1088068 () Bool)

(declare-fun res!725193 () Bool)

(assert (=> b!1088068 (=> (not res!725193) (not e!621639))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088068 (= res!725193 (and (= (size!34281 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34280 _keys!1070) (size!34281 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088069 () Bool)

(declare-fun e!621634 () Bool)

(assert (=> b!1088069 (= e!621634 tp_is_empty!26593)))

(declare-fun b!1088070 () Bool)

(declare-fun e!621641 () Bool)

(assert (=> b!1088070 (= e!621641 e!621640)))

(declare-fun res!725194 () Bool)

(assert (=> b!1088070 (=> res!725194 e!621640)))

(assert (=> b!1088070 (= res!725194 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483702 () ListLongMap!14925)

(assert (=> b!1088070 (= lt!483705 lt!483702)))

(assert (=> b!1088070 (= lt!483705 (-!790 lt!483710 k0!904))))

(declare-fun lt!483703 () Unit!35747)

(declare-fun lt!483701 () ListLongMap!14925)

(declare-fun zeroValue!831 () V!40585)

(assert (=> b!1088070 (= lt!483703 (addRemoveCommutativeForDiffKeys!35 lt!483701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483708 () ListLongMap!14925)

(assert (=> b!1088070 (= lt!483708 (+!3301 lt!483702 lt!483713))))

(declare-fun lt!483698 () ListLongMap!14925)

(declare-fun lt!483714 () tuple2!16948)

(assert (=> b!1088070 (= lt!483702 (+!3301 lt!483698 lt!483714))))

(declare-fun lt!483712 () ListLongMap!14925)

(assert (=> b!1088070 (= lt!483712 lt!483700)))

(assert (=> b!1088070 (= lt!483700 (+!3301 lt!483710 lt!483713))))

(assert (=> b!1088070 (= lt!483710 (+!3301 lt!483701 lt!483714))))

(declare-fun lt!483706 () ListLongMap!14925)

(assert (=> b!1088070 (= lt!483708 (+!3301 (+!3301 lt!483706 lt!483714) lt!483713))))

(assert (=> b!1088070 (= lt!483713 (tuple2!16949 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1088070 (= lt!483714 (tuple2!16949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088071 () Bool)

(assert (=> b!1088071 (= e!621635 (not e!621641))))

(declare-fun res!725190 () Bool)

(assert (=> b!1088071 (=> res!725190 e!621641)))

(assert (=> b!1088071 (= res!725190 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4243 (array!70151 array!70153 (_ BitVec 32) (_ BitVec 32) V!40585 V!40585 (_ BitVec 32) Int) ListLongMap!14925)

(assert (=> b!1088071 (= lt!483712 (getCurrentListMap!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483709 () array!70153)

(assert (=> b!1088071 (= lt!483708 (getCurrentListMap!4243 lt!483704 lt!483709 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088071 (and (= lt!483706 lt!483698) (= lt!483698 lt!483706))))

(assert (=> b!1088071 (= lt!483698 (-!790 lt!483701 k0!904))))

(declare-fun lt!483707 () Unit!35747)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!72 (array!70151 array!70153 (_ BitVec 32) (_ BitVec 32) V!40585 V!40585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35747)

(assert (=> b!1088071 (= lt!483707 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!72 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4048 (array!70151 array!70153 (_ BitVec 32) (_ BitVec 32) V!40585 V!40585 (_ BitVec 32) Int) ListLongMap!14925)

(assert (=> b!1088071 (= lt!483706 (getCurrentListMapNoExtraKeys!4048 lt!483704 lt!483709 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2169 (Int (_ BitVec 64)) V!40585)

(assert (=> b!1088071 (= lt!483709 (array!70154 (store (arr!33744 _values!874) i!650 (ValueCellFull!12587 (dynLambda!2169 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34281 _values!874)))))

(assert (=> b!1088071 (= lt!483701 (getCurrentListMapNoExtraKeys!4048 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088071 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483711 () Unit!35747)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70151 (_ BitVec 64) (_ BitVec 32)) Unit!35747)

(assert (=> b!1088071 (= lt!483711 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41644 () Bool)

(assert (=> mapIsEmpty!41644 mapRes!41644))

(declare-fun b!1088072 () Bool)

(declare-fun res!725195 () Bool)

(assert (=> b!1088072 (=> (not res!725195) (not e!621639))))

(assert (=> b!1088072 (= res!725195 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34280 _keys!1070))))))

(declare-fun res!725198 () Bool)

(assert (=> start!96174 (=> (not res!725198) (not e!621639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96174 (= res!725198 (validMask!0 mask!1414))))

(assert (=> start!96174 e!621639))

(assert (=> start!96174 tp!79621))

(assert (=> start!96174 true))

(assert (=> start!96174 tp_is_empty!26593))

(declare-fun array_inv!26078 (array!70151) Bool)

(assert (=> start!96174 (array_inv!26078 _keys!1070)))

(declare-fun array_inv!26079 (array!70153) Bool)

(assert (=> start!96174 (and (array_inv!26079 _values!874) e!621637)))

(declare-fun b!1088065 () Bool)

(assert (=> b!1088065 (= e!621639 e!621635)))

(declare-fun res!725196 () Bool)

(assert (=> b!1088065 (=> (not res!725196) (not e!621635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70151 (_ BitVec 32)) Bool)

(assert (=> b!1088065 (= res!725196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483704 mask!1414))))

(assert (=> b!1088065 (= lt!483704 (array!70152 (store (arr!33743 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34280 _keys!1070)))))

(declare-fun b!1088073 () Bool)

(declare-fun res!725199 () Bool)

(assert (=> b!1088073 (=> (not res!725199) (not e!621639))))

(assert (=> b!1088073 (= res!725199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41644 () Bool)

(declare-fun tp!79622 () Bool)

(assert (=> mapNonEmpty!41644 (= mapRes!41644 (and tp!79622 e!621634))))

(declare-fun mapRest!41644 () (Array (_ BitVec 32) ValueCell!12587))

(declare-fun mapKey!41644 () (_ BitVec 32))

(declare-fun mapValue!41644 () ValueCell!12587)

(assert (=> mapNonEmpty!41644 (= (arr!33744 _values!874) (store mapRest!41644 mapKey!41644 mapValue!41644))))

(assert (= (and start!96174 res!725198) b!1088068))

(assert (= (and b!1088068 res!725193) b!1088073))

(assert (= (and b!1088073 res!725199) b!1088063))

(assert (= (and b!1088063 res!725191) b!1088072))

(assert (= (and b!1088072 res!725195) b!1088066))

(assert (= (and b!1088066 res!725189) b!1088060))

(assert (= (and b!1088060 res!725192) b!1088065))

(assert (= (and b!1088065 res!725196) b!1088067))

(assert (= (and b!1088067 res!725197) b!1088071))

(assert (= (and b!1088071 (not res!725190)) b!1088070))

(assert (= (and b!1088070 (not res!725194)) b!1088064))

(assert (= (and b!1088062 condMapEmpty!41644) mapIsEmpty!41644))

(assert (= (and b!1088062 (not condMapEmpty!41644)) mapNonEmpty!41644))

(get-info :version)

(assert (= (and mapNonEmpty!41644 ((_ is ValueCellFull!12587) mapValue!41644)) b!1088069))

(assert (= (and b!1088062 ((_ is ValueCellFull!12587) mapDefault!41644)) b!1088061))

(assert (= start!96174 b!1088062))

(declare-fun b_lambda!17271 () Bool)

(assert (=> (not b_lambda!17271) (not b!1088071)))

(declare-fun t!33183 () Bool)

(declare-fun tb!7461 () Bool)

(assert (=> (and start!96174 (= defaultEntry!882 defaultEntry!882) t!33183) tb!7461))

(declare-fun result!15449 () Bool)

(assert (=> tb!7461 (= result!15449 tp_is_empty!26593)))

(assert (=> b!1088071 t!33183))

(declare-fun b_and!35869 () Bool)

(assert (= b_and!35867 (and (=> t!33183 result!15449) b_and!35869)))

(declare-fun m!1007039 () Bool)

(assert (=> b!1088064 m!1007039))

(declare-fun m!1007041 () Bool)

(assert (=> b!1088064 m!1007041))

(declare-fun m!1007043 () Bool)

(assert (=> b!1088064 m!1007043))

(declare-fun m!1007045 () Bool)

(assert (=> mapNonEmpty!41644 m!1007045))

(declare-fun m!1007047 () Bool)

(assert (=> b!1088066 m!1007047))

(declare-fun m!1007049 () Bool)

(assert (=> b!1088063 m!1007049))

(declare-fun m!1007051 () Bool)

(assert (=> b!1088060 m!1007051))

(declare-fun m!1007053 () Bool)

(assert (=> b!1088067 m!1007053))

(declare-fun m!1007055 () Bool)

(assert (=> start!96174 m!1007055))

(declare-fun m!1007057 () Bool)

(assert (=> start!96174 m!1007057))

(declare-fun m!1007059 () Bool)

(assert (=> start!96174 m!1007059))

(declare-fun m!1007061 () Bool)

(assert (=> b!1088065 m!1007061))

(declare-fun m!1007063 () Bool)

(assert (=> b!1088065 m!1007063))

(declare-fun m!1007065 () Bool)

(assert (=> b!1088073 m!1007065))

(declare-fun m!1007067 () Bool)

(assert (=> b!1088071 m!1007067))

(declare-fun m!1007069 () Bool)

(assert (=> b!1088071 m!1007069))

(declare-fun m!1007071 () Bool)

(assert (=> b!1088071 m!1007071))

(declare-fun m!1007073 () Bool)

(assert (=> b!1088071 m!1007073))

(declare-fun m!1007075 () Bool)

(assert (=> b!1088071 m!1007075))

(declare-fun m!1007077 () Bool)

(assert (=> b!1088071 m!1007077))

(declare-fun m!1007079 () Bool)

(assert (=> b!1088071 m!1007079))

(declare-fun m!1007081 () Bool)

(assert (=> b!1088071 m!1007081))

(declare-fun m!1007083 () Bool)

(assert (=> b!1088071 m!1007083))

(declare-fun m!1007085 () Bool)

(assert (=> b!1088071 m!1007085))

(declare-fun m!1007087 () Bool)

(assert (=> b!1088070 m!1007087))

(declare-fun m!1007089 () Bool)

(assert (=> b!1088070 m!1007089))

(assert (=> b!1088070 m!1007087))

(declare-fun m!1007091 () Bool)

(assert (=> b!1088070 m!1007091))

(declare-fun m!1007093 () Bool)

(assert (=> b!1088070 m!1007093))

(declare-fun m!1007095 () Bool)

(assert (=> b!1088070 m!1007095))

(declare-fun m!1007097 () Bool)

(assert (=> b!1088070 m!1007097))

(declare-fun m!1007099 () Bool)

(assert (=> b!1088070 m!1007099))

(declare-fun m!1007101 () Bool)

(assert (=> b!1088070 m!1007101))

(check-sat tp_is_empty!26593 (not b!1088064) (not b!1088066) (not start!96174) (not mapNonEmpty!41644) (not b!1088071) (not b_next!22591) (not b!1088073) (not b!1088063) (not b!1088070) (not b!1088067) b_and!35869 (not b!1088065) (not b_lambda!17271))
(check-sat b_and!35869 (not b_next!22591))
