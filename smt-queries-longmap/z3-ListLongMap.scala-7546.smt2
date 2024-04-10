; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95598 () Bool)

(assert start!95598)

(declare-fun b_free!22251 () Bool)

(declare-fun b_next!22251 () Bool)

(assert (=> start!95598 (= b_free!22251 (not b_next!22251))))

(declare-fun tp!78602 () Bool)

(declare-fun b_and!35229 () Bool)

(assert (=> start!95598 (= tp!78602 b_and!35229)))

(declare-fun b!1080033 () Bool)

(declare-fun res!719789 () Bool)

(declare-fun e!617438 () Bool)

(assert (=> b!1080033 (=> (not res!719789) (not e!617438))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69459 0))(
  ( (array!69460 (arr!33403 (Array (_ BitVec 32) (_ BitVec 64))) (size!33939 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69459)

(assert (=> b!1080033 (= res!719789 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33939 _keys!1070))))))

(declare-fun b!1080034 () Bool)

(declare-fun res!719787 () Bool)

(declare-fun e!617440 () Bool)

(assert (=> b!1080034 (=> (not res!719787) (not e!617440))))

(declare-fun lt!478917 () array!69459)

(declare-datatypes ((List!23275 0))(
  ( (Nil!23272) (Cons!23271 (h!24480 (_ BitVec 64)) (t!32634 List!23275)) )
))
(declare-fun arrayNoDuplicates!0 (array!69459 (_ BitVec 32) List!23275) Bool)

(assert (=> b!1080034 (= res!719787 (arrayNoDuplicates!0 lt!478917 #b00000000000000000000000000000000 Nil!23272))))

(declare-fun b!1080035 () Bool)

(declare-fun e!617441 () Bool)

(declare-fun tp_is_empty!26253 () Bool)

(assert (=> b!1080035 (= e!617441 tp_is_empty!26253)))

(declare-fun b!1080036 () Bool)

(declare-fun res!719786 () Bool)

(assert (=> b!1080036 (=> (not res!719786) (not e!617438))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69459 (_ BitVec 32)) Bool)

(assert (=> b!1080036 (= res!719786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080037 () Bool)

(declare-fun res!719792 () Bool)

(assert (=> b!1080037 (=> (not res!719792) (not e!617438))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1080037 (= res!719792 (= (select (arr!33403 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41134 () Bool)

(declare-fun mapRes!41134 () Bool)

(declare-fun tp!78601 () Bool)

(declare-fun e!617436 () Bool)

(assert (=> mapNonEmpty!41134 (= mapRes!41134 (and tp!78601 e!617436))))

(declare-datatypes ((V!40131 0))(
  ( (V!40132 (val!13183 Int)) )
))
(declare-datatypes ((ValueCell!12417 0))(
  ( (ValueCellFull!12417 (v!15804 V!40131)) (EmptyCell!12417) )
))
(declare-fun mapValue!41134 () ValueCell!12417)

(declare-datatypes ((array!69461 0))(
  ( (array!69462 (arr!33404 (Array (_ BitVec 32) ValueCell!12417)) (size!33940 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69461)

(declare-fun mapKey!41134 () (_ BitVec 32))

(declare-fun mapRest!41134 () (Array (_ BitVec 32) ValueCell!12417))

(assert (=> mapNonEmpty!41134 (= (arr!33404 _values!874) (store mapRest!41134 mapKey!41134 mapValue!41134))))

(declare-fun res!719785 () Bool)

(assert (=> start!95598 (=> (not res!719785) (not e!617438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95598 (= res!719785 (validMask!0 mask!1414))))

(assert (=> start!95598 e!617438))

(assert (=> start!95598 tp!78602))

(assert (=> start!95598 true))

(assert (=> start!95598 tp_is_empty!26253))

(declare-fun array_inv!25792 (array!69459) Bool)

(assert (=> start!95598 (array_inv!25792 _keys!1070)))

(declare-fun e!617437 () Bool)

(declare-fun array_inv!25793 (array!69461) Bool)

(assert (=> start!95598 (and (array_inv!25793 _values!874) e!617437)))

(declare-fun b!1080038 () Bool)

(assert (=> b!1080038 (= e!617437 (and e!617441 mapRes!41134))))

(declare-fun condMapEmpty!41134 () Bool)

(declare-fun mapDefault!41134 () ValueCell!12417)

(assert (=> b!1080038 (= condMapEmpty!41134 (= (arr!33404 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12417)) mapDefault!41134)))))

(declare-fun b!1080039 () Bool)

(declare-fun res!719788 () Bool)

(assert (=> b!1080039 (=> (not res!719788) (not e!617438))))

(assert (=> b!1080039 (= res!719788 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23272))))

(declare-fun b!1080040 () Bool)

(declare-fun res!719791 () Bool)

(assert (=> b!1080040 (=> (not res!719791) (not e!617438))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080040 (= res!719791 (and (= (size!33940 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33939 _keys!1070) (size!33940 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080041 () Bool)

(assert (=> b!1080041 (= e!617438 e!617440)))

(declare-fun res!719790 () Bool)

(assert (=> b!1080041 (=> (not res!719790) (not e!617440))))

(assert (=> b!1080041 (= res!719790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478917 mask!1414))))

(assert (=> b!1080041 (= lt!478917 (array!69460 (store (arr!33403 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33939 _keys!1070)))))

(declare-fun b!1080042 () Bool)

(assert (=> b!1080042 (= e!617436 tp_is_empty!26253)))

(declare-fun b!1080043 () Bool)

(declare-fun res!719793 () Bool)

(assert (=> b!1080043 (=> (not res!719793) (not e!617438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080043 (= res!719793 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41134 () Bool)

(assert (=> mapIsEmpty!41134 mapRes!41134))

(declare-fun b!1080044 () Bool)

(assert (=> b!1080044 (= e!617440 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40131)

(declare-fun zeroValue!831 () V!40131)

(declare-datatypes ((tuple2!16696 0))(
  ( (tuple2!16697 (_1!8359 (_ BitVec 64)) (_2!8359 V!40131)) )
))
(declare-datatypes ((List!23276 0))(
  ( (Nil!23273) (Cons!23272 (h!24481 tuple2!16696) (t!32635 List!23276)) )
))
(declare-datatypes ((ListLongMap!14665 0))(
  ( (ListLongMap!14666 (toList!7348 List!23276)) )
))
(declare-fun lt!478918 () ListLongMap!14665)

(declare-fun getCurrentListMapNoExtraKeys!3896 (array!69459 array!69461 (_ BitVec 32) (_ BitVec 32) V!40131 V!40131 (_ BitVec 32) Int) ListLongMap!14665)

(assert (=> b!1080044 (= lt!478918 (getCurrentListMapNoExtraKeys!3896 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080044 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35516 0))(
  ( (Unit!35517) )
))
(declare-fun lt!478916 () Unit!35516)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69459 (_ BitVec 64) (_ BitVec 32)) Unit!35516)

(assert (=> b!1080044 (= lt!478916 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95598 res!719785) b!1080040))

(assert (= (and b!1080040 res!719791) b!1080036))

(assert (= (and b!1080036 res!719786) b!1080039))

(assert (= (and b!1080039 res!719788) b!1080033))

(assert (= (and b!1080033 res!719789) b!1080043))

(assert (= (and b!1080043 res!719793) b!1080037))

(assert (= (and b!1080037 res!719792) b!1080041))

(assert (= (and b!1080041 res!719790) b!1080034))

(assert (= (and b!1080034 res!719787) b!1080044))

(assert (= (and b!1080038 condMapEmpty!41134) mapIsEmpty!41134))

(assert (= (and b!1080038 (not condMapEmpty!41134)) mapNonEmpty!41134))

(get-info :version)

(assert (= (and mapNonEmpty!41134 ((_ is ValueCellFull!12417) mapValue!41134)) b!1080042))

(assert (= (and b!1080038 ((_ is ValueCellFull!12417) mapDefault!41134)) b!1080035))

(assert (= start!95598 b!1080038))

(declare-fun m!998081 () Bool)

(assert (=> mapNonEmpty!41134 m!998081))

(declare-fun m!998083 () Bool)

(assert (=> b!1080044 m!998083))

(declare-fun m!998085 () Bool)

(assert (=> b!1080044 m!998085))

(declare-fun m!998087 () Bool)

(assert (=> b!1080044 m!998087))

(declare-fun m!998089 () Bool)

(assert (=> b!1080037 m!998089))

(declare-fun m!998091 () Bool)

(assert (=> b!1080043 m!998091))

(declare-fun m!998093 () Bool)

(assert (=> b!1080036 m!998093))

(declare-fun m!998095 () Bool)

(assert (=> start!95598 m!998095))

(declare-fun m!998097 () Bool)

(assert (=> start!95598 m!998097))

(declare-fun m!998099 () Bool)

(assert (=> start!95598 m!998099))

(declare-fun m!998101 () Bool)

(assert (=> b!1080041 m!998101))

(declare-fun m!998103 () Bool)

(assert (=> b!1080041 m!998103))

(declare-fun m!998105 () Bool)

(assert (=> b!1080039 m!998105))

(declare-fun m!998107 () Bool)

(assert (=> b!1080034 m!998107))

(check-sat (not b!1080039) (not mapNonEmpty!41134) tp_is_empty!26253 (not b_next!22251) (not b!1080036) (not b!1080041) b_and!35229 (not b!1080034) (not start!95598) (not b!1080043) (not b!1080044))
(check-sat b_and!35229 (not b_next!22251))
