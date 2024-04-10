; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95772 () Bool)

(assert start!95772)

(declare-fun b_free!22425 () Bool)

(declare-fun b_next!22425 () Bool)

(assert (=> start!95772 (= b_free!22425 (not b_next!22425))))

(declare-fun tp!79124 () Bool)

(declare-fun b_and!35525 () Bool)

(assert (=> start!95772 (= tp!79124 b_and!35525)))

(declare-fun b!1083287 () Bool)

(declare-fun res!722142 () Bool)

(declare-fun e!619004 () Bool)

(assert (=> b!1083287 (=> (not res!722142) (not e!619004))))

(declare-datatypes ((array!69797 0))(
  ( (array!69798 (arr!33572 (Array (_ BitVec 32) (_ BitVec 64))) (size!34108 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69797)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69797 (_ BitVec 32)) Bool)

(assert (=> b!1083287 (= res!722142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083288 () Bool)

(declare-fun res!722135 () Bool)

(assert (=> b!1083288 (=> (not res!722135) (not e!619004))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40363 0))(
  ( (V!40364 (val!13270 Int)) )
))
(declare-datatypes ((ValueCell!12504 0))(
  ( (ValueCellFull!12504 (v!15891 V!40363)) (EmptyCell!12504) )
))
(declare-datatypes ((array!69799 0))(
  ( (array!69800 (arr!33573 (Array (_ BitVec 32) ValueCell!12504)) (size!34109 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69799)

(assert (=> b!1083288 (= res!722135 (and (= (size!34109 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34108 _keys!1070) (size!34109 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083289 () Bool)

(declare-fun e!619007 () Bool)

(assert (=> b!1083289 (= e!619007 (not true))))

(declare-datatypes ((tuple2!16814 0))(
  ( (tuple2!16815 (_1!8418 (_ BitVec 64)) (_2!8418 V!40363)) )
))
(declare-datatypes ((List!23401 0))(
  ( (Nil!23398) (Cons!23397 (h!24606 tuple2!16814) (t!32884 List!23401)) )
))
(declare-datatypes ((ListLongMap!14783 0))(
  ( (ListLongMap!14784 (toList!7407 List!23401)) )
))
(declare-fun lt!480007 () ListLongMap!14783)

(declare-fun lt!480004 () ListLongMap!14783)

(assert (=> b!1083289 (and (= lt!480007 lt!480004) (= lt!480004 lt!480007))))

(declare-fun lt!480003 () ListLongMap!14783)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!734 (ListLongMap!14783 (_ BitVec 64)) ListLongMap!14783)

(assert (=> b!1083289 (= lt!480004 (-!734 lt!480003 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40363)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40363)

(declare-datatypes ((Unit!35634 0))(
  ( (Unit!35635) )
))
(declare-fun lt!480005 () Unit!35634)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!14 (array!69797 array!69799 (_ BitVec 32) (_ BitVec 32) V!40363 V!40363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35634)

(assert (=> b!1083289 (= lt!480005 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!14 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480002 () array!69797)

(declare-fun getCurrentListMapNoExtraKeys!3955 (array!69797 array!69799 (_ BitVec 32) (_ BitVec 32) V!40363 V!40363 (_ BitVec 32) Int) ListLongMap!14783)

(declare-fun dynLambda!2092 (Int (_ BitVec 64)) V!40363)

(assert (=> b!1083289 (= lt!480007 (getCurrentListMapNoExtraKeys!3955 lt!480002 (array!69800 (store (arr!33573 _values!874) i!650 (ValueCellFull!12504 (dynLambda!2092 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34109 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083289 (= lt!480003 (getCurrentListMapNoExtraKeys!3955 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083289 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480006 () Unit!35634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69797 (_ BitVec 64) (_ BitVec 32)) Unit!35634)

(assert (=> b!1083289 (= lt!480006 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41395 () Bool)

(declare-fun mapRes!41395 () Bool)

(declare-fun tp!79123 () Bool)

(declare-fun e!619002 () Bool)

(assert (=> mapNonEmpty!41395 (= mapRes!41395 (and tp!79123 e!619002))))

(declare-fun mapValue!41395 () ValueCell!12504)

(declare-fun mapRest!41395 () (Array (_ BitVec 32) ValueCell!12504))

(declare-fun mapKey!41395 () (_ BitVec 32))

(assert (=> mapNonEmpty!41395 (= (arr!33573 _values!874) (store mapRest!41395 mapKey!41395 mapValue!41395))))

(declare-fun b!1083290 () Bool)

(declare-fun e!619005 () Bool)

(declare-fun e!619006 () Bool)

(assert (=> b!1083290 (= e!619005 (and e!619006 mapRes!41395))))

(declare-fun condMapEmpty!41395 () Bool)

(declare-fun mapDefault!41395 () ValueCell!12504)

(assert (=> b!1083290 (= condMapEmpty!41395 (= (arr!33573 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12504)) mapDefault!41395)))))

(declare-fun b!1083291 () Bool)

(declare-fun res!722140 () Bool)

(assert (=> b!1083291 (=> (not res!722140) (not e!619004))))

(declare-datatypes ((List!23402 0))(
  ( (Nil!23399) (Cons!23398 (h!24607 (_ BitVec 64)) (t!32885 List!23402)) )
))
(declare-fun arrayNoDuplicates!0 (array!69797 (_ BitVec 32) List!23402) Bool)

(assert (=> b!1083291 (= res!722140 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23399))))

(declare-fun b!1083292 () Bool)

(declare-fun tp_is_empty!26427 () Bool)

(assert (=> b!1083292 (= e!619006 tp_is_empty!26427)))

(declare-fun b!1083293 () Bool)

(declare-fun res!722138 () Bool)

(assert (=> b!1083293 (=> (not res!722138) (not e!619004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083293 (= res!722138 (validKeyInArray!0 k0!904))))

(declare-fun b!1083294 () Bool)

(declare-fun res!722137 () Bool)

(assert (=> b!1083294 (=> (not res!722137) (not e!619004))))

(assert (=> b!1083294 (= res!722137 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34108 _keys!1070))))))

(declare-fun b!1083295 () Bool)

(declare-fun res!722134 () Bool)

(assert (=> b!1083295 (=> (not res!722134) (not e!619004))))

(assert (=> b!1083295 (= res!722134 (= (select (arr!33572 _keys!1070) i!650) k0!904))))

(declare-fun b!1083296 () Bool)

(declare-fun res!722141 () Bool)

(assert (=> b!1083296 (=> (not res!722141) (not e!619007))))

(assert (=> b!1083296 (= res!722141 (arrayNoDuplicates!0 lt!480002 #b00000000000000000000000000000000 Nil!23399))))

(declare-fun res!722139 () Bool)

(assert (=> start!95772 (=> (not res!722139) (not e!619004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95772 (= res!722139 (validMask!0 mask!1414))))

(assert (=> start!95772 e!619004))

(assert (=> start!95772 tp!79124))

(assert (=> start!95772 true))

(assert (=> start!95772 tp_is_empty!26427))

(declare-fun array_inv!25910 (array!69797) Bool)

(assert (=> start!95772 (array_inv!25910 _keys!1070)))

(declare-fun array_inv!25911 (array!69799) Bool)

(assert (=> start!95772 (and (array_inv!25911 _values!874) e!619005)))

(declare-fun b!1083297 () Bool)

(assert (=> b!1083297 (= e!619002 tp_is_empty!26427)))

(declare-fun b!1083298 () Bool)

(assert (=> b!1083298 (= e!619004 e!619007)))

(declare-fun res!722136 () Bool)

(assert (=> b!1083298 (=> (not res!722136) (not e!619007))))

(assert (=> b!1083298 (= res!722136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480002 mask!1414))))

(assert (=> b!1083298 (= lt!480002 (array!69798 (store (arr!33572 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34108 _keys!1070)))))

(declare-fun mapIsEmpty!41395 () Bool)

(assert (=> mapIsEmpty!41395 mapRes!41395))

(assert (= (and start!95772 res!722139) b!1083288))

(assert (= (and b!1083288 res!722135) b!1083287))

(assert (= (and b!1083287 res!722142) b!1083291))

(assert (= (and b!1083291 res!722140) b!1083294))

(assert (= (and b!1083294 res!722137) b!1083293))

(assert (= (and b!1083293 res!722138) b!1083295))

(assert (= (and b!1083295 res!722134) b!1083298))

(assert (= (and b!1083298 res!722136) b!1083296))

(assert (= (and b!1083296 res!722141) b!1083289))

(assert (= (and b!1083290 condMapEmpty!41395) mapIsEmpty!41395))

(assert (= (and b!1083290 (not condMapEmpty!41395)) mapNonEmpty!41395))

(get-info :version)

(assert (= (and mapNonEmpty!41395 ((_ is ValueCellFull!12504) mapValue!41395)) b!1083297))

(assert (= (and b!1083290 ((_ is ValueCellFull!12504) mapDefault!41395)) b!1083292))

(assert (= start!95772 b!1083290))

(declare-fun b_lambda!17095 () Bool)

(assert (=> (not b_lambda!17095) (not b!1083289)))

(declare-fun t!32883 () Bool)

(declare-fun tb!7303 () Bool)

(assert (=> (and start!95772 (= defaultEntry!882 defaultEntry!882) t!32883) tb!7303))

(declare-fun result!15125 () Bool)

(assert (=> tb!7303 (= result!15125 tp_is_empty!26427)))

(assert (=> b!1083289 t!32883))

(declare-fun b_and!35527 () Bool)

(assert (= b_and!35525 (and (=> t!32883 result!15125) b_and!35527)))

(declare-fun m!1000959 () Bool)

(assert (=> mapNonEmpty!41395 m!1000959))

(declare-fun m!1000961 () Bool)

(assert (=> b!1083298 m!1000961))

(declare-fun m!1000963 () Bool)

(assert (=> b!1083298 m!1000963))

(declare-fun m!1000965 () Bool)

(assert (=> b!1083289 m!1000965))

(declare-fun m!1000967 () Bool)

(assert (=> b!1083289 m!1000967))

(declare-fun m!1000969 () Bool)

(assert (=> b!1083289 m!1000969))

(declare-fun m!1000971 () Bool)

(assert (=> b!1083289 m!1000971))

(declare-fun m!1000973 () Bool)

(assert (=> b!1083289 m!1000973))

(declare-fun m!1000975 () Bool)

(assert (=> b!1083289 m!1000975))

(declare-fun m!1000977 () Bool)

(assert (=> b!1083289 m!1000977))

(declare-fun m!1000979 () Bool)

(assert (=> b!1083289 m!1000979))

(declare-fun m!1000981 () Bool)

(assert (=> start!95772 m!1000981))

(declare-fun m!1000983 () Bool)

(assert (=> start!95772 m!1000983))

(declare-fun m!1000985 () Bool)

(assert (=> start!95772 m!1000985))

(declare-fun m!1000987 () Bool)

(assert (=> b!1083295 m!1000987))

(declare-fun m!1000989 () Bool)

(assert (=> b!1083293 m!1000989))

(declare-fun m!1000991 () Bool)

(assert (=> b!1083287 m!1000991))

(declare-fun m!1000993 () Bool)

(assert (=> b!1083291 m!1000993))

(declare-fun m!1000995 () Bool)

(assert (=> b!1083296 m!1000995))

(check-sat (not mapNonEmpty!41395) (not b!1083287) (not b!1083296) (not b_next!22425) (not b!1083298) b_and!35527 (not start!95772) (not b!1083293) tp_is_empty!26427 (not b!1083289) (not b!1083291) (not b_lambda!17095))
(check-sat b_and!35527 (not b_next!22425))
