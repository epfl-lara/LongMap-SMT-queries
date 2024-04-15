; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95806 () Bool)

(assert start!95806)

(declare-fun b_free!22465 () Bool)

(declare-fun b_next!22465 () Bool)

(assert (=> start!95806 (= b_free!22465 (not b_next!22465))))

(declare-fun tp!79243 () Bool)

(declare-fun b_and!35579 () Bool)

(assert (=> start!95806 (= tp!79243 b_and!35579)))

(declare-fun b!1083894 () Bool)

(declare-fun res!722611 () Bool)

(declare-fun e!619271 () Bool)

(assert (=> b!1083894 (=> (not res!722611) (not e!619271))))

(declare-datatypes ((array!69802 0))(
  ( (array!69803 (arr!33575 (Array (_ BitVec 32) (_ BitVec 64))) (size!34113 (_ BitVec 32))) )
))
(declare-fun lt!480238 () array!69802)

(declare-datatypes ((List!23476 0))(
  ( (Nil!23473) (Cons!23472 (h!24681 (_ BitVec 64)) (t!32990 List!23476)) )
))
(declare-fun arrayNoDuplicates!0 (array!69802 (_ BitVec 32) List!23476) Bool)

(assert (=> b!1083894 (= res!722611 (arrayNoDuplicates!0 lt!480238 #b00000000000000000000000000000000 Nil!23473))))

(declare-fun mapNonEmpty!41455 () Bool)

(declare-fun mapRes!41455 () Bool)

(declare-fun tp!79244 () Bool)

(declare-fun e!619274 () Bool)

(assert (=> mapNonEmpty!41455 (= mapRes!41455 (and tp!79244 e!619274))))

(declare-datatypes ((V!40417 0))(
  ( (V!40418 (val!13290 Int)) )
))
(declare-datatypes ((ValueCell!12524 0))(
  ( (ValueCellFull!12524 (v!15910 V!40417)) (EmptyCell!12524) )
))
(declare-datatypes ((array!69804 0))(
  ( (array!69805 (arr!33576 (Array (_ BitVec 32) ValueCell!12524)) (size!34114 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69804)

(declare-fun mapValue!41455 () ValueCell!12524)

(declare-fun mapRest!41455 () (Array (_ BitVec 32) ValueCell!12524))

(declare-fun mapKey!41455 () (_ BitVec 32))

(assert (=> mapNonEmpty!41455 (= (arr!33576 _values!874) (store mapRest!41455 mapKey!41455 mapValue!41455))))

(declare-fun res!722606 () Bool)

(declare-fun e!619273 () Bool)

(assert (=> start!95806 (=> (not res!722606) (not e!619273))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95806 (= res!722606 (validMask!0 mask!1414))))

(assert (=> start!95806 e!619273))

(assert (=> start!95806 tp!79243))

(assert (=> start!95806 true))

(declare-fun tp_is_empty!26467 () Bool)

(assert (=> start!95806 tp_is_empty!26467))

(declare-fun _keys!1070 () array!69802)

(declare-fun array_inv!25954 (array!69802) Bool)

(assert (=> start!95806 (array_inv!25954 _keys!1070)))

(declare-fun e!619269 () Bool)

(declare-fun array_inv!25955 (array!69804) Bool)

(assert (=> start!95806 (and (array_inv!25955 _values!874) e!619269)))

(declare-fun b!1083895 () Bool)

(declare-fun e!619270 () Bool)

(assert (=> b!1083895 (= e!619270 tp_is_empty!26467)))

(declare-fun mapIsEmpty!41455 () Bool)

(assert (=> mapIsEmpty!41455 mapRes!41455))

(declare-fun b!1083896 () Bool)

(declare-fun res!722609 () Bool)

(assert (=> b!1083896 (=> (not res!722609) (not e!619273))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083896 (= res!722609 (= (select (arr!33575 _keys!1070) i!650) k0!904))))

(declare-fun b!1083897 () Bool)

(declare-fun res!722608 () Bool)

(assert (=> b!1083897 (=> (not res!722608) (not e!619273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083897 (= res!722608 (validKeyInArray!0 k0!904))))

(declare-fun b!1083898 () Bool)

(assert (=> b!1083898 (= e!619273 e!619271)))

(declare-fun res!722612 () Bool)

(assert (=> b!1083898 (=> (not res!722612) (not e!619271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69802 (_ BitVec 32)) Bool)

(assert (=> b!1083898 (= res!722612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480238 mask!1414))))

(assert (=> b!1083898 (= lt!480238 (array!69803 (store (arr!33575 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34113 _keys!1070)))))

(declare-fun b!1083899 () Bool)

(declare-fun res!722613 () Bool)

(assert (=> b!1083899 (=> (not res!722613) (not e!619273))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1083899 (= res!722613 (and (= (size!34114 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34113 _keys!1070) (size!34114 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083900 () Bool)

(assert (=> b!1083900 (= e!619269 (and e!619270 mapRes!41455))))

(declare-fun condMapEmpty!41455 () Bool)

(declare-fun mapDefault!41455 () ValueCell!12524)

(assert (=> b!1083900 (= condMapEmpty!41455 (= (arr!33576 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12524)) mapDefault!41455)))))

(declare-fun b!1083901 () Bool)

(assert (=> b!1083901 (= e!619271 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16906 0))(
  ( (tuple2!16907 (_1!8464 (_ BitVec 64)) (_2!8464 V!40417)) )
))
(declare-datatypes ((List!23477 0))(
  ( (Nil!23474) (Cons!23473 (h!24682 tuple2!16906) (t!32991 List!23477)) )
))
(declare-datatypes ((ListLongMap!14875 0))(
  ( (ListLongMap!14876 (toList!7453 List!23477)) )
))
(declare-fun lt!480240 () ListLongMap!14875)

(declare-fun minValue!831 () V!40417)

(declare-fun zeroValue!831 () V!40417)

(declare-fun lt!480243 () array!69804)

(declare-fun getCurrentListMap!4146 (array!69802 array!69804 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) Int) ListLongMap!14875)

(assert (=> b!1083901 (= lt!480240 (getCurrentListMap!4146 lt!480238 lt!480243 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480239 () ListLongMap!14875)

(declare-fun lt!480242 () ListLongMap!14875)

(assert (=> b!1083901 (and (= lt!480239 lt!480242) (= lt!480242 lt!480239))))

(declare-fun lt!480245 () ListLongMap!14875)

(declare-fun -!732 (ListLongMap!14875 (_ BitVec 64)) ListLongMap!14875)

(assert (=> b!1083901 (= lt!480242 (-!732 lt!480245 k0!904))))

(declare-datatypes ((Unit!35499 0))(
  ( (Unit!35500) )
))
(declare-fun lt!480244 () Unit!35499)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!30 (array!69802 array!69804 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35499)

(assert (=> b!1083901 (= lt!480244 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!30 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4016 (array!69802 array!69804 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) Int) ListLongMap!14875)

(assert (=> b!1083901 (= lt!480239 (getCurrentListMapNoExtraKeys!4016 lt!480238 lt!480243 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2087 (Int (_ BitVec 64)) V!40417)

(assert (=> b!1083901 (= lt!480243 (array!69805 (store (arr!33576 _values!874) i!650 (ValueCellFull!12524 (dynLambda!2087 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34114 _values!874)))))

(assert (=> b!1083901 (= lt!480245 (getCurrentListMapNoExtraKeys!4016 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083901 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480241 () Unit!35499)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69802 (_ BitVec 64) (_ BitVec 32)) Unit!35499)

(assert (=> b!1083901 (= lt!480241 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083902 () Bool)

(declare-fun res!722607 () Bool)

(assert (=> b!1083902 (=> (not res!722607) (not e!619273))))

(assert (=> b!1083902 (= res!722607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083903 () Bool)

(assert (=> b!1083903 (= e!619274 tp_is_empty!26467)))

(declare-fun b!1083904 () Bool)

(declare-fun res!722605 () Bool)

(assert (=> b!1083904 (=> (not res!722605) (not e!619273))))

(assert (=> b!1083904 (= res!722605 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34113 _keys!1070))))))

(declare-fun b!1083905 () Bool)

(declare-fun res!722610 () Bool)

(assert (=> b!1083905 (=> (not res!722610) (not e!619273))))

(assert (=> b!1083905 (= res!722610 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23473))))

(assert (= (and start!95806 res!722606) b!1083899))

(assert (= (and b!1083899 res!722613) b!1083902))

(assert (= (and b!1083902 res!722607) b!1083905))

(assert (= (and b!1083905 res!722610) b!1083904))

(assert (= (and b!1083904 res!722605) b!1083897))

(assert (= (and b!1083897 res!722608) b!1083896))

(assert (= (and b!1083896 res!722609) b!1083898))

(assert (= (and b!1083898 res!722612) b!1083894))

(assert (= (and b!1083894 res!722611) b!1083901))

(assert (= (and b!1083900 condMapEmpty!41455) mapIsEmpty!41455))

(assert (= (and b!1083900 (not condMapEmpty!41455)) mapNonEmpty!41455))

(get-info :version)

(assert (= (and mapNonEmpty!41455 ((_ is ValueCellFull!12524) mapValue!41455)) b!1083903))

(assert (= (and b!1083900 ((_ is ValueCellFull!12524) mapDefault!41455)) b!1083895))

(assert (= start!95806 b!1083900))

(declare-fun b_lambda!17113 () Bool)

(assert (=> (not b_lambda!17113) (not b!1083901)))

(declare-fun t!32989 () Bool)

(declare-fun tb!7335 () Bool)

(assert (=> (and start!95806 (= defaultEntry!882 defaultEntry!882) t!32989) tb!7335))

(declare-fun result!15197 () Bool)

(assert (=> tb!7335 (= result!15197 tp_is_empty!26467)))

(assert (=> b!1083901 t!32989))

(declare-fun b_and!35581 () Bool)

(assert (= b_and!35579 (and (=> t!32989 result!15197) b_and!35581)))

(declare-fun m!1001117 () Bool)

(assert (=> mapNonEmpty!41455 m!1001117))

(declare-fun m!1001119 () Bool)

(assert (=> start!95806 m!1001119))

(declare-fun m!1001121 () Bool)

(assert (=> start!95806 m!1001121))

(declare-fun m!1001123 () Bool)

(assert (=> start!95806 m!1001123))

(declare-fun m!1001125 () Bool)

(assert (=> b!1083905 m!1001125))

(declare-fun m!1001127 () Bool)

(assert (=> b!1083896 m!1001127))

(declare-fun m!1001129 () Bool)

(assert (=> b!1083898 m!1001129))

(declare-fun m!1001131 () Bool)

(assert (=> b!1083898 m!1001131))

(declare-fun m!1001133 () Bool)

(assert (=> b!1083901 m!1001133))

(declare-fun m!1001135 () Bool)

(assert (=> b!1083901 m!1001135))

(declare-fun m!1001137 () Bool)

(assert (=> b!1083901 m!1001137))

(declare-fun m!1001139 () Bool)

(assert (=> b!1083901 m!1001139))

(declare-fun m!1001141 () Bool)

(assert (=> b!1083901 m!1001141))

(declare-fun m!1001143 () Bool)

(assert (=> b!1083901 m!1001143))

(declare-fun m!1001145 () Bool)

(assert (=> b!1083901 m!1001145))

(declare-fun m!1001147 () Bool)

(assert (=> b!1083901 m!1001147))

(declare-fun m!1001149 () Bool)

(assert (=> b!1083901 m!1001149))

(declare-fun m!1001151 () Bool)

(assert (=> b!1083902 m!1001151))

(declare-fun m!1001153 () Bool)

(assert (=> b!1083894 m!1001153))

(declare-fun m!1001155 () Bool)

(assert (=> b!1083897 m!1001155))

(check-sat tp_is_empty!26467 (not b!1083902) (not b!1083901) (not b_lambda!17113) (not b!1083898) (not b_next!22465) (not b!1083894) (not mapNonEmpty!41455) (not b!1083905) (not start!95806) (not b!1083897) b_and!35581)
(check-sat b_and!35581 (not b_next!22465))
