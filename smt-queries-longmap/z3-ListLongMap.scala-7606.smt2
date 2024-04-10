; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95958 () Bool)

(assert start!95958)

(declare-fun b_free!22611 () Bool)

(declare-fun b_next!22611 () Bool)

(assert (=> start!95958 (= b_free!22611 (not b_next!22611))))

(declare-fun tp!79681 () Bool)

(declare-fun b_and!35897 () Bool)

(assert (=> start!95958 (= tp!79681 b_and!35897)))

(declare-fun b!1087173 () Bool)

(declare-fun res!725007 () Bool)

(declare-fun e!621023 () Bool)

(assert (=> b!1087173 (=> (not res!725007) (not e!621023))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70153 0))(
  ( (array!70154 (arr!33750 (Array (_ BitVec 32) (_ BitVec 64))) (size!34286 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70153)

(declare-datatypes ((V!40611 0))(
  ( (V!40612 (val!13363 Int)) )
))
(declare-datatypes ((ValueCell!12597 0))(
  ( (ValueCellFull!12597 (v!15984 V!40611)) (EmptyCell!12597) )
))
(declare-datatypes ((array!70155 0))(
  ( (array!70156 (arr!33751 (Array (_ BitVec 32) ValueCell!12597)) (size!34287 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70155)

(assert (=> b!1087173 (= res!725007 (and (= (size!34287 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34286 _keys!1070) (size!34287 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087174 () Bool)

(declare-fun res!725005 () Bool)

(declare-fun e!621022 () Bool)

(assert (=> b!1087174 (=> (not res!725005) (not e!621022))))

(declare-fun lt!483696 () array!70153)

(declare-datatypes ((List!23543 0))(
  ( (Nil!23540) (Cons!23539 (h!24748 (_ BitVec 64)) (t!33212 List!23543)) )
))
(declare-fun arrayNoDuplicates!0 (array!70153 (_ BitVec 32) List!23543) Bool)

(assert (=> b!1087174 (= res!725005 (arrayNoDuplicates!0 lt!483696 #b00000000000000000000000000000000 Nil!23540))))

(declare-fun b!1087175 () Bool)

(declare-fun e!621026 () Bool)

(declare-fun e!621021 () Bool)

(assert (=> b!1087175 (= e!621026 e!621021)))

(declare-fun res!725000 () Bool)

(assert (=> b!1087175 (=> res!725000 e!621021)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1087175 (= res!725000 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16954 0))(
  ( (tuple2!16955 (_1!8488 (_ BitVec 64)) (_2!8488 V!40611)) )
))
(declare-datatypes ((List!23544 0))(
  ( (Nil!23541) (Cons!23540 (h!24749 tuple2!16954) (t!33213 List!23544)) )
))
(declare-datatypes ((ListLongMap!14923 0))(
  ( (ListLongMap!14924 (toList!7477 List!23544)) )
))
(declare-fun lt!483706 () ListLongMap!14923)

(declare-fun lt!483698 () ListLongMap!14923)

(assert (=> b!1087175 (= lt!483706 lt!483698)))

(declare-fun lt!483709 () ListLongMap!14923)

(declare-fun -!803 (ListLongMap!14923 (_ BitVec 64)) ListLongMap!14923)

(assert (=> b!1087175 (= lt!483706 (-!803 lt!483709 k0!904))))

(declare-datatypes ((Unit!35772 0))(
  ( (Unit!35773) )
))
(declare-fun lt!483702 () Unit!35772)

(declare-fun zeroValue!831 () V!40611)

(declare-fun lt!483697 () ListLongMap!14923)

(declare-fun addRemoveCommutativeForDiffKeys!39 (ListLongMap!14923 (_ BitVec 64) V!40611 (_ BitVec 64)) Unit!35772)

(assert (=> b!1087175 (= lt!483702 (addRemoveCommutativeForDiffKeys!39 lt!483697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483694 () ListLongMap!14923)

(declare-fun lt!483695 () tuple2!16954)

(declare-fun +!3283 (ListLongMap!14923 tuple2!16954) ListLongMap!14923)

(assert (=> b!1087175 (= lt!483694 (+!3283 lt!483698 lt!483695))))

(declare-fun lt!483693 () ListLongMap!14923)

(declare-fun lt!483707 () tuple2!16954)

(assert (=> b!1087175 (= lt!483698 (+!3283 lt!483693 lt!483707))))

(declare-fun lt!483701 () ListLongMap!14923)

(declare-fun lt!483708 () ListLongMap!14923)

(assert (=> b!1087175 (= lt!483701 lt!483708)))

(assert (=> b!1087175 (= lt!483708 (+!3283 lt!483709 lt!483695))))

(assert (=> b!1087175 (= lt!483709 (+!3283 lt!483697 lt!483707))))

(declare-fun lt!483704 () ListLongMap!14923)

(assert (=> b!1087175 (= lt!483694 (+!3283 (+!3283 lt!483704 lt!483707) lt!483695))))

(declare-fun minValue!831 () V!40611)

(assert (=> b!1087175 (= lt!483695 (tuple2!16955 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087175 (= lt!483707 (tuple2!16955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!725001 () Bool)

(assert (=> start!95958 (=> (not res!725001) (not e!621023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95958 (= res!725001 (validMask!0 mask!1414))))

(assert (=> start!95958 e!621023))

(assert (=> start!95958 tp!79681))

(assert (=> start!95958 true))

(declare-fun tp_is_empty!26613 () Bool)

(assert (=> start!95958 tp_is_empty!26613))

(declare-fun array_inv!26036 (array!70153) Bool)

(assert (=> start!95958 (array_inv!26036 _keys!1070)))

(declare-fun e!621020 () Bool)

(declare-fun array_inv!26037 (array!70155) Bool)

(assert (=> start!95958 (and (array_inv!26037 _values!874) e!621020)))

(declare-fun b!1087176 () Bool)

(declare-fun res!725004 () Bool)

(assert (=> b!1087176 (=> (not res!725004) (not e!621023))))

(assert (=> b!1087176 (= res!725004 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23540))))

(declare-fun b!1087177 () Bool)

(assert (=> b!1087177 (= e!621022 (not e!621026))))

(declare-fun res!725002 () Bool)

(assert (=> b!1087177 (=> res!725002 e!621026)))

(assert (=> b!1087177 (= res!725002 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4253 (array!70153 array!70155 (_ BitVec 32) (_ BitVec 32) V!40611 V!40611 (_ BitVec 32) Int) ListLongMap!14923)

(assert (=> b!1087177 (= lt!483701 (getCurrentListMap!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483699 () array!70155)

(assert (=> b!1087177 (= lt!483694 (getCurrentListMap!4253 lt!483696 lt!483699 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087177 (and (= lt!483704 lt!483693) (= lt!483693 lt!483704))))

(assert (=> b!1087177 (= lt!483693 (-!803 lt!483697 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!483705 () Unit!35772)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!72 (array!70153 array!70155 (_ BitVec 32) (_ BitVec 32) V!40611 V!40611 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35772)

(assert (=> b!1087177 (= lt!483705 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!72 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4013 (array!70153 array!70155 (_ BitVec 32) (_ BitVec 32) V!40611 V!40611 (_ BitVec 32) Int) ListLongMap!14923)

(assert (=> b!1087177 (= lt!483704 (getCurrentListMapNoExtraKeys!4013 lt!483696 lt!483699 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2150 (Int (_ BitVec 64)) V!40611)

(assert (=> b!1087177 (= lt!483699 (array!70156 (store (arr!33751 _values!874) i!650 (ValueCellFull!12597 (dynLambda!2150 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34287 _values!874)))))

(assert (=> b!1087177 (= lt!483697 (getCurrentListMapNoExtraKeys!4013 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087177 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483703 () Unit!35772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70153 (_ BitVec 64) (_ BitVec 32)) Unit!35772)

(assert (=> b!1087177 (= lt!483703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41674 () Bool)

(declare-fun mapRes!41674 () Bool)

(declare-fun tp!79682 () Bool)

(declare-fun e!621024 () Bool)

(assert (=> mapNonEmpty!41674 (= mapRes!41674 (and tp!79682 e!621024))))

(declare-fun mapRest!41674 () (Array (_ BitVec 32) ValueCell!12597))

(declare-fun mapValue!41674 () ValueCell!12597)

(declare-fun mapKey!41674 () (_ BitVec 32))

(assert (=> mapNonEmpty!41674 (= (arr!33751 _values!874) (store mapRest!41674 mapKey!41674 mapValue!41674))))

(declare-fun b!1087178 () Bool)

(assert (=> b!1087178 (= e!621024 tp_is_empty!26613)))

(declare-fun b!1087179 () Bool)

(assert (=> b!1087179 (= e!621021 (bvsle #b00000000000000000000000000000000 (size!34286 _keys!1070)))))

(assert (=> b!1087179 (= (-!803 lt!483708 k0!904) (+!3283 lt!483706 lt!483695))))

(declare-fun lt!483700 () Unit!35772)

(assert (=> b!1087179 (= lt!483700 (addRemoveCommutativeForDiffKeys!39 lt!483709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!41674 () Bool)

(assert (=> mapIsEmpty!41674 mapRes!41674))

(declare-fun b!1087180 () Bool)

(declare-fun res!724997 () Bool)

(assert (=> b!1087180 (=> (not res!724997) (not e!621023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087180 (= res!724997 (validKeyInArray!0 k0!904))))

(declare-fun b!1087181 () Bool)

(assert (=> b!1087181 (= e!621023 e!621022)))

(declare-fun res!724999 () Bool)

(assert (=> b!1087181 (=> (not res!724999) (not e!621022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70153 (_ BitVec 32)) Bool)

(assert (=> b!1087181 (= res!724999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483696 mask!1414))))

(assert (=> b!1087181 (= lt!483696 (array!70154 (store (arr!33750 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34286 _keys!1070)))))

(declare-fun b!1087182 () Bool)

(declare-fun res!725003 () Bool)

(assert (=> b!1087182 (=> (not res!725003) (not e!621023))))

(assert (=> b!1087182 (= res!725003 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34286 _keys!1070))))))

(declare-fun b!1087183 () Bool)

(declare-fun e!621019 () Bool)

(assert (=> b!1087183 (= e!621019 tp_is_empty!26613)))

(declare-fun b!1087184 () Bool)

(declare-fun res!724998 () Bool)

(assert (=> b!1087184 (=> (not res!724998) (not e!621023))))

(assert (=> b!1087184 (= res!724998 (= (select (arr!33750 _keys!1070) i!650) k0!904))))

(declare-fun b!1087185 () Bool)

(declare-fun res!725006 () Bool)

(assert (=> b!1087185 (=> (not res!725006) (not e!621023))))

(assert (=> b!1087185 (= res!725006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087186 () Bool)

(assert (=> b!1087186 (= e!621020 (and e!621019 mapRes!41674))))

(declare-fun condMapEmpty!41674 () Bool)

(declare-fun mapDefault!41674 () ValueCell!12597)

(assert (=> b!1087186 (= condMapEmpty!41674 (= (arr!33751 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12597)) mapDefault!41674)))))

(assert (= (and start!95958 res!725001) b!1087173))

(assert (= (and b!1087173 res!725007) b!1087185))

(assert (= (and b!1087185 res!725006) b!1087176))

(assert (= (and b!1087176 res!725004) b!1087182))

(assert (= (and b!1087182 res!725003) b!1087180))

(assert (= (and b!1087180 res!724997) b!1087184))

(assert (= (and b!1087184 res!724998) b!1087181))

(assert (= (and b!1087181 res!724999) b!1087174))

(assert (= (and b!1087174 res!725005) b!1087177))

(assert (= (and b!1087177 (not res!725002)) b!1087175))

(assert (= (and b!1087175 (not res!725000)) b!1087179))

(assert (= (and b!1087186 condMapEmpty!41674) mapIsEmpty!41674))

(assert (= (and b!1087186 (not condMapEmpty!41674)) mapNonEmpty!41674))

(get-info :version)

(assert (= (and mapNonEmpty!41674 ((_ is ValueCellFull!12597) mapValue!41674)) b!1087178))

(assert (= (and b!1087186 ((_ is ValueCellFull!12597) mapDefault!41674)) b!1087183))

(assert (= start!95958 b!1087186))

(declare-fun b_lambda!17281 () Bool)

(assert (=> (not b_lambda!17281) (not b!1087177)))

(declare-fun t!33211 () Bool)

(declare-fun tb!7489 () Bool)

(assert (=> (and start!95958 (= defaultEntry!882 defaultEntry!882) t!33211) tb!7489))

(declare-fun result!15497 () Bool)

(assert (=> tb!7489 (= result!15497 tp_is_empty!26613)))

(assert (=> b!1087177 t!33211))

(declare-fun b_and!35899 () Bool)

(assert (= b_and!35897 (and (=> t!33211 result!15497) b_and!35899)))

(declare-fun m!1006007 () Bool)

(assert (=> b!1087180 m!1006007))

(declare-fun m!1006009 () Bool)

(assert (=> mapNonEmpty!41674 m!1006009))

(declare-fun m!1006011 () Bool)

(assert (=> b!1087177 m!1006011))

(declare-fun m!1006013 () Bool)

(assert (=> b!1087177 m!1006013))

(declare-fun m!1006015 () Bool)

(assert (=> b!1087177 m!1006015))

(declare-fun m!1006017 () Bool)

(assert (=> b!1087177 m!1006017))

(declare-fun m!1006019 () Bool)

(assert (=> b!1087177 m!1006019))

(declare-fun m!1006021 () Bool)

(assert (=> b!1087177 m!1006021))

(declare-fun m!1006023 () Bool)

(assert (=> b!1087177 m!1006023))

(declare-fun m!1006025 () Bool)

(assert (=> b!1087177 m!1006025))

(declare-fun m!1006027 () Bool)

(assert (=> b!1087177 m!1006027))

(declare-fun m!1006029 () Bool)

(assert (=> b!1087177 m!1006029))

(declare-fun m!1006031 () Bool)

(assert (=> b!1087176 m!1006031))

(declare-fun m!1006033 () Bool)

(assert (=> b!1087181 m!1006033))

(declare-fun m!1006035 () Bool)

(assert (=> b!1087181 m!1006035))

(declare-fun m!1006037 () Bool)

(assert (=> start!95958 m!1006037))

(declare-fun m!1006039 () Bool)

(assert (=> start!95958 m!1006039))

(declare-fun m!1006041 () Bool)

(assert (=> start!95958 m!1006041))

(declare-fun m!1006043 () Bool)

(assert (=> b!1087174 m!1006043))

(declare-fun m!1006045 () Bool)

(assert (=> b!1087175 m!1006045))

(declare-fun m!1006047 () Bool)

(assert (=> b!1087175 m!1006047))

(declare-fun m!1006049 () Bool)

(assert (=> b!1087175 m!1006049))

(declare-fun m!1006051 () Bool)

(assert (=> b!1087175 m!1006051))

(assert (=> b!1087175 m!1006049))

(declare-fun m!1006053 () Bool)

(assert (=> b!1087175 m!1006053))

(declare-fun m!1006055 () Bool)

(assert (=> b!1087175 m!1006055))

(declare-fun m!1006057 () Bool)

(assert (=> b!1087175 m!1006057))

(declare-fun m!1006059 () Bool)

(assert (=> b!1087175 m!1006059))

(declare-fun m!1006061 () Bool)

(assert (=> b!1087179 m!1006061))

(declare-fun m!1006063 () Bool)

(assert (=> b!1087179 m!1006063))

(declare-fun m!1006065 () Bool)

(assert (=> b!1087179 m!1006065))

(declare-fun m!1006067 () Bool)

(assert (=> b!1087184 m!1006067))

(declare-fun m!1006069 () Bool)

(assert (=> b!1087185 m!1006069))

(check-sat (not b!1087180) (not mapNonEmpty!41674) (not b_next!22611) (not b!1087179) (not b!1087181) (not b!1087185) (not b!1087177) (not b_lambda!17281) (not b!1087176) (not b!1087174) (not start!95958) (not b!1087175) tp_is_empty!26613 b_and!35899)
(check-sat b_and!35899 (not b_next!22611))
