; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95704 () Bool)

(assert start!95704)

(declare-fun b_free!22363 () Bool)

(declare-fun b_next!22363 () Bool)

(assert (=> start!95704 (= b_free!22363 (not b_next!22363))))

(declare-fun tp!78938 () Bool)

(declare-fun b_and!35375 () Bool)

(assert (=> start!95704 (= tp!78938 b_and!35375)))

(declare-fun b!1081956 () Bool)

(declare-fun res!721231 () Bool)

(declare-fun e!618351 () Bool)

(assert (=> b!1081956 (=> (not res!721231) (not e!618351))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081956 (= res!721231 (validKeyInArray!0 k0!904))))

(declare-fun b!1081957 () Bool)

(declare-fun res!721236 () Bool)

(assert (=> b!1081957 (=> (not res!721236) (not e!618351))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69602 0))(
  ( (array!69603 (arr!33475 (Array (_ BitVec 32) (_ BitVec 64))) (size!34013 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69602)

(declare-datatypes ((V!40281 0))(
  ( (V!40282 (val!13239 Int)) )
))
(declare-datatypes ((ValueCell!12473 0))(
  ( (ValueCellFull!12473 (v!15859 V!40281)) (EmptyCell!12473) )
))
(declare-datatypes ((array!69604 0))(
  ( (array!69605 (arr!33476 (Array (_ BitVec 32) ValueCell!12473)) (size!34014 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69604)

(assert (=> b!1081957 (= res!721236 (and (= (size!34014 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34013 _keys!1070) (size!34014 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081959 () Bool)

(declare-fun e!618356 () Bool)

(assert (=> b!1081959 (= e!618356 (not true))))

(declare-fun lt!479313 () array!69602)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40281)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!16834 0))(
  ( (tuple2!16835 (_1!8428 (_ BitVec 64)) (_2!8428 V!40281)) )
))
(declare-datatypes ((List!23398 0))(
  ( (Nil!23395) (Cons!23394 (h!24603 tuple2!16834) (t!32810 List!23398)) )
))
(declare-datatypes ((ListLongMap!14803 0))(
  ( (ListLongMap!14804 (toList!7417 List!23398)) )
))
(declare-fun lt!479312 () ListLongMap!14803)

(declare-fun zeroValue!831 () V!40281)

(declare-fun getCurrentListMapNoExtraKeys!3980 (array!69602 array!69604 (_ BitVec 32) (_ BitVec 32) V!40281 V!40281 (_ BitVec 32) Int) ListLongMap!14803)

(declare-fun dynLambda!2051 (Int (_ BitVec 64)) V!40281)

(assert (=> b!1081959 (= lt!479312 (getCurrentListMapNoExtraKeys!3980 lt!479313 (array!69605 (store (arr!33476 _values!874) i!650 (ValueCellFull!12473 (dynLambda!2051 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34014 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479314 () ListLongMap!14803)

(assert (=> b!1081959 (= lt!479314 (getCurrentListMapNoExtraKeys!3980 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081959 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35427 0))(
  ( (Unit!35428) )
))
(declare-fun lt!479315 () Unit!35427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69602 (_ BitVec 64) (_ BitVec 32)) Unit!35427)

(assert (=> b!1081959 (= lt!479315 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081960 () Bool)

(declare-fun e!618354 () Bool)

(declare-fun tp_is_empty!26365 () Bool)

(assert (=> b!1081960 (= e!618354 tp_is_empty!26365)))

(declare-fun b!1081961 () Bool)

(declare-fun res!721229 () Bool)

(assert (=> b!1081961 (=> (not res!721229) (not e!618351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69602 (_ BitVec 32)) Bool)

(assert (=> b!1081961 (= res!721229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081962 () Bool)

(declare-fun res!721233 () Bool)

(assert (=> b!1081962 (=> (not res!721233) (not e!618351))))

(declare-datatypes ((List!23399 0))(
  ( (Nil!23396) (Cons!23395 (h!24604 (_ BitVec 64)) (t!32811 List!23399)) )
))
(declare-fun arrayNoDuplicates!0 (array!69602 (_ BitVec 32) List!23399) Bool)

(assert (=> b!1081962 (= res!721233 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23396))))

(declare-fun mapNonEmpty!41302 () Bool)

(declare-fun mapRes!41302 () Bool)

(declare-fun tp!78937 () Bool)

(assert (=> mapNonEmpty!41302 (= mapRes!41302 (and tp!78937 e!618354))))

(declare-fun mapKey!41302 () (_ BitVec 32))

(declare-fun mapValue!41302 () ValueCell!12473)

(declare-fun mapRest!41302 () (Array (_ BitVec 32) ValueCell!12473))

(assert (=> mapNonEmpty!41302 (= (arr!33476 _values!874) (store mapRest!41302 mapKey!41302 mapValue!41302))))

(declare-fun mapIsEmpty!41302 () Bool)

(assert (=> mapIsEmpty!41302 mapRes!41302))

(declare-fun b!1081963 () Bool)

(declare-fun res!721235 () Bool)

(assert (=> b!1081963 (=> (not res!721235) (not e!618351))))

(assert (=> b!1081963 (= res!721235 (= (select (arr!33475 _keys!1070) i!650) k0!904))))

(declare-fun b!1081958 () Bool)

(declare-fun res!721234 () Bool)

(assert (=> b!1081958 (=> (not res!721234) (not e!618351))))

(assert (=> b!1081958 (= res!721234 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34013 _keys!1070))))))

(declare-fun res!721232 () Bool)

(assert (=> start!95704 (=> (not res!721232) (not e!618351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95704 (= res!721232 (validMask!0 mask!1414))))

(assert (=> start!95704 e!618351))

(assert (=> start!95704 tp!78938))

(assert (=> start!95704 true))

(assert (=> start!95704 tp_is_empty!26365))

(declare-fun array_inv!25878 (array!69602) Bool)

(assert (=> start!95704 (array_inv!25878 _keys!1070)))

(declare-fun e!618355 () Bool)

(declare-fun array_inv!25879 (array!69604) Bool)

(assert (=> start!95704 (and (array_inv!25879 _values!874) e!618355)))

(declare-fun b!1081964 () Bool)

(declare-fun res!721230 () Bool)

(assert (=> b!1081964 (=> (not res!721230) (not e!618356))))

(assert (=> b!1081964 (= res!721230 (arrayNoDuplicates!0 lt!479313 #b00000000000000000000000000000000 Nil!23396))))

(declare-fun b!1081965 () Bool)

(declare-fun e!618352 () Bool)

(assert (=> b!1081965 (= e!618352 tp_is_empty!26365)))

(declare-fun b!1081966 () Bool)

(assert (=> b!1081966 (= e!618351 e!618356)))

(declare-fun res!721228 () Bool)

(assert (=> b!1081966 (=> (not res!721228) (not e!618356))))

(assert (=> b!1081966 (= res!721228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479313 mask!1414))))

(assert (=> b!1081966 (= lt!479313 (array!69603 (store (arr!33475 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34013 _keys!1070)))))

(declare-fun b!1081967 () Bool)

(assert (=> b!1081967 (= e!618355 (and e!618352 mapRes!41302))))

(declare-fun condMapEmpty!41302 () Bool)

(declare-fun mapDefault!41302 () ValueCell!12473)

(assert (=> b!1081967 (= condMapEmpty!41302 (= (arr!33476 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12473)) mapDefault!41302)))))

(assert (= (and start!95704 res!721232) b!1081957))

(assert (= (and b!1081957 res!721236) b!1081961))

(assert (= (and b!1081961 res!721229) b!1081962))

(assert (= (and b!1081962 res!721233) b!1081958))

(assert (= (and b!1081958 res!721234) b!1081956))

(assert (= (and b!1081956 res!721231) b!1081963))

(assert (= (and b!1081963 res!721235) b!1081966))

(assert (= (and b!1081966 res!721228) b!1081964))

(assert (= (and b!1081964 res!721230) b!1081959))

(assert (= (and b!1081967 condMapEmpty!41302) mapIsEmpty!41302))

(assert (= (and b!1081967 (not condMapEmpty!41302)) mapNonEmpty!41302))

(get-info :version)

(assert (= (and mapNonEmpty!41302 ((_ is ValueCellFull!12473) mapValue!41302)) b!1081960))

(assert (= (and b!1081967 ((_ is ValueCellFull!12473) mapDefault!41302)) b!1081965))

(assert (= start!95704 b!1081967))

(declare-fun b_lambda!17011 () Bool)

(assert (=> (not b_lambda!17011) (not b!1081959)))

(declare-fun t!32809 () Bool)

(declare-fun tb!7233 () Bool)

(assert (=> (and start!95704 (= defaultEntry!882 defaultEntry!882) t!32809) tb!7233))

(declare-fun result!14993 () Bool)

(assert (=> tb!7233 (= result!14993 tp_is_empty!26365)))

(assert (=> b!1081959 t!32809))

(declare-fun b_and!35377 () Bool)

(assert (= b_and!35375 (and (=> t!32809 result!14993) b_and!35377)))

(declare-fun m!999203 () Bool)

(assert (=> b!1081959 m!999203))

(declare-fun m!999205 () Bool)

(assert (=> b!1081959 m!999205))

(declare-fun m!999207 () Bool)

(assert (=> b!1081959 m!999207))

(declare-fun m!999209 () Bool)

(assert (=> b!1081959 m!999209))

(declare-fun m!999211 () Bool)

(assert (=> b!1081959 m!999211))

(declare-fun m!999213 () Bool)

(assert (=> b!1081959 m!999213))

(declare-fun m!999215 () Bool)

(assert (=> b!1081963 m!999215))

(declare-fun m!999217 () Bool)

(assert (=> b!1081964 m!999217))

(declare-fun m!999219 () Bool)

(assert (=> b!1081956 m!999219))

(declare-fun m!999221 () Bool)

(assert (=> b!1081962 m!999221))

(declare-fun m!999223 () Bool)

(assert (=> mapNonEmpty!41302 m!999223))

(declare-fun m!999225 () Bool)

(assert (=> start!95704 m!999225))

(declare-fun m!999227 () Bool)

(assert (=> start!95704 m!999227))

(declare-fun m!999229 () Bool)

(assert (=> start!95704 m!999229))

(declare-fun m!999231 () Bool)

(assert (=> b!1081961 m!999231))

(declare-fun m!999233 () Bool)

(assert (=> b!1081966 m!999233))

(declare-fun m!999235 () Bool)

(assert (=> b!1081966 m!999235))

(check-sat (not b!1081964) tp_is_empty!26365 (not b_lambda!17011) (not b!1081961) b_and!35377 (not b!1081956) (not start!95704) (not b!1081959) (not b!1081962) (not b!1081966) (not b_next!22363) (not mapNonEmpty!41302))
(check-sat b_and!35377 (not b_next!22363))
