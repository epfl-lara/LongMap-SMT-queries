; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78358 () Bool)

(assert start!78358)

(declare-fun b_free!16741 () Bool)

(declare-fun b_next!16741 () Bool)

(assert (=> start!78358 (= b_free!16741 (not b_next!16741))))

(declare-fun tp!58512 () Bool)

(declare-fun b_and!27323 () Bool)

(assert (=> start!78358 (= tp!58512 b_and!27323)))

(declare-fun b!913964 () Bool)

(declare-fun res!616428 () Bool)

(declare-fun e!512701 () Bool)

(assert (=> b!913964 (=> (not res!616428) (not e!512701))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54315 0))(
  ( (array!54316 (arr!26109 (Array (_ BitVec 32) (_ BitVec 64))) (size!26570 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54315)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!913964 (= res!616428 (and (= (select (arr!26109 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913965 () Bool)

(declare-fun e!512700 () Bool)

(declare-fun e!512699 () Bool)

(declare-fun mapRes!30477 () Bool)

(assert (=> b!913965 (= e!512700 (and e!512699 mapRes!30477))))

(declare-fun condMapEmpty!30477 () Bool)

(declare-datatypes ((V!30511 0))(
  ( (V!30512 (val!9630 Int)) )
))
(declare-datatypes ((ValueCell!9098 0))(
  ( (ValueCellFull!9098 (v!12145 V!30511)) (EmptyCell!9098) )
))
(declare-datatypes ((array!54317 0))(
  ( (array!54318 (arr!26110 (Array (_ BitVec 32) ValueCell!9098)) (size!26571 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54317)

(declare-fun mapDefault!30477 () ValueCell!9098)

(assert (=> b!913965 (= condMapEmpty!30477 (= (arr!26110 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9098)) mapDefault!30477)))))

(declare-fun mapIsEmpty!30477 () Bool)

(assert (=> mapIsEmpty!30477 mapRes!30477))

(declare-fun b!913966 () Bool)

(declare-fun res!616425 () Bool)

(assert (=> b!913966 (=> (not res!616425) (not e!512701))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913966 (= res!616425 (inRange!0 i!717 mask!1756))))

(declare-fun b!913967 () Bool)

(declare-fun res!616427 () Bool)

(declare-fun e!512696 () Bool)

(assert (=> b!913967 (=> res!616427 e!512696)))

(declare-datatypes ((tuple2!12600 0))(
  ( (tuple2!12601 (_1!6311 (_ BitVec 64)) (_2!6311 V!30511)) )
))
(declare-datatypes ((List!18378 0))(
  ( (Nil!18375) (Cons!18374 (h!19520 tuple2!12600) (t!25970 List!18378)) )
))
(declare-datatypes ((ListLongMap!11287 0))(
  ( (ListLongMap!11288 (toList!5659 List!18378)) )
))
(declare-fun lt!411169 () ListLongMap!11287)

(declare-fun lt!411165 () V!30511)

(declare-fun apply!523 (ListLongMap!11287 (_ BitVec 64)) V!30511)

(assert (=> b!913967 (= res!616427 (not (= (apply!523 lt!411169 k0!1033) lt!411165)))))

(declare-fun b!913968 () Bool)

(declare-fun e!512698 () Bool)

(declare-fun tp_is_empty!19159 () Bool)

(assert (=> b!913968 (= e!512698 tp_is_empty!19159)))

(declare-fun b!913969 () Bool)

(declare-fun res!616426 () Bool)

(declare-fun e!512694 () Bool)

(assert (=> b!913969 (=> (not res!616426) (not e!512694))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!913969 (= res!616426 (and (= (size!26571 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26570 _keys!1386) (size!26571 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913970 () Bool)

(declare-fun e!512695 () Bool)

(assert (=> b!913970 (= e!512695 e!512696)))

(declare-fun res!616429 () Bool)

(assert (=> b!913970 (=> res!616429 e!512696)))

(declare-fun contains!4666 (ListLongMap!11287 (_ BitVec 64)) Bool)

(assert (=> b!913970 (= res!616429 (not (contains!4666 lt!411169 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30511)

(declare-fun minValue!1094 () V!30511)

(declare-fun getCurrentListMap!2860 (array!54315 array!54317 (_ BitVec 32) (_ BitVec 32) V!30511 V!30511 (_ BitVec 32) Int) ListLongMap!11287)

(assert (=> b!913970 (= lt!411169 (getCurrentListMap!2860 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!30477 () Bool)

(declare-fun tp!58511 () Bool)

(assert (=> mapNonEmpty!30477 (= mapRes!30477 (and tp!58511 e!512698))))

(declare-fun mapRest!30477 () (Array (_ BitVec 32) ValueCell!9098))

(declare-fun mapKey!30477 () (_ BitVec 32))

(declare-fun mapValue!30477 () ValueCell!9098)

(assert (=> mapNonEmpty!30477 (= (arr!26110 _values!1152) (store mapRest!30477 mapKey!30477 mapValue!30477))))

(declare-fun b!913971 () Bool)

(assert (=> b!913971 (= e!512694 e!512701)))

(declare-fun res!616423 () Bool)

(assert (=> b!913971 (=> (not res!616423) (not e!512701))))

(declare-fun lt!411167 () ListLongMap!11287)

(assert (=> b!913971 (= res!616423 (contains!4666 lt!411167 k0!1033))))

(assert (=> b!913971 (= lt!411167 (getCurrentListMap!2860 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!913972 () Bool)

(declare-fun res!616431 () Bool)

(assert (=> b!913972 (=> (not res!616431) (not e!512694))))

(declare-datatypes ((List!18379 0))(
  ( (Nil!18376) (Cons!18375 (h!19521 (_ BitVec 64)) (t!25971 List!18379)) )
))
(declare-fun arrayNoDuplicates!0 (array!54315 (_ BitVec 32) List!18379) Bool)

(assert (=> b!913972 (= res!616431 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18376))))

(declare-fun res!616422 () Bool)

(assert (=> start!78358 (=> (not res!616422) (not e!512694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78358 (= res!616422 (validMask!0 mask!1756))))

(assert (=> start!78358 e!512694))

(declare-fun array_inv!20472 (array!54317) Bool)

(assert (=> start!78358 (and (array_inv!20472 _values!1152) e!512700)))

(assert (=> start!78358 tp!58512))

(assert (=> start!78358 true))

(assert (=> start!78358 tp_is_empty!19159))

(declare-fun array_inv!20473 (array!54315) Bool)

(assert (=> start!78358 (array_inv!20473 _keys!1386)))

(declare-fun b!913973 () Bool)

(assert (=> b!913973 (= e!512696 (bvslt i!717 (size!26571 _values!1152)))))

(assert (=> b!913973 (= (apply!523 lt!411167 k0!1033) lt!411165)))

(declare-datatypes ((Unit!30866 0))(
  ( (Unit!30867) )
))
(declare-fun lt!411168 () Unit!30866)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!69 (array!54315 array!54317 (_ BitVec 32) (_ BitVec 32) V!30511 V!30511 (_ BitVec 64) V!30511 (_ BitVec 32) Int) Unit!30866)

(assert (=> b!913973 (= lt!411168 (lemmaListMapApplyFromThenApplyFromZero!69 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!411165 i!717 defaultEntry!1160))))

(declare-fun b!913974 () Bool)

(assert (=> b!913974 (= e!512701 (not e!512695))))

(declare-fun res!616430 () Bool)

(assert (=> b!913974 (=> res!616430 e!512695)))

(assert (=> b!913974 (= res!616430 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26570 _keys!1386))))))

(declare-fun get!13710 (ValueCell!9098 V!30511) V!30511)

(declare-fun dynLambda!1388 (Int (_ BitVec 64)) V!30511)

(assert (=> b!913974 (= lt!411165 (get!13710 (select (arr!26110 _values!1152) i!717) (dynLambda!1388 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!54315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913974 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!411166 () Unit!30866)

(declare-fun lemmaKeyInListMapIsInArray!277 (array!54315 array!54317 (_ BitVec 32) (_ BitVec 32) V!30511 V!30511 (_ BitVec 64) Int) Unit!30866)

(assert (=> b!913974 (= lt!411166 (lemmaKeyInListMapIsInArray!277 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913975 () Bool)

(assert (=> b!913975 (= e!512699 tp_is_empty!19159)))

(declare-fun b!913976 () Bool)

(declare-fun res!616424 () Bool)

(assert (=> b!913976 (=> (not res!616424) (not e!512694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54315 (_ BitVec 32)) Bool)

(assert (=> b!913976 (= res!616424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78358 res!616422) b!913969))

(assert (= (and b!913969 res!616426) b!913976))

(assert (= (and b!913976 res!616424) b!913972))

(assert (= (and b!913972 res!616431) b!913971))

(assert (= (and b!913971 res!616423) b!913966))

(assert (= (and b!913966 res!616425) b!913964))

(assert (= (and b!913964 res!616428) b!913974))

(assert (= (and b!913974 (not res!616430)) b!913970))

(assert (= (and b!913970 (not res!616429)) b!913967))

(assert (= (and b!913967 (not res!616427)) b!913973))

(assert (= (and b!913965 condMapEmpty!30477) mapIsEmpty!30477))

(assert (= (and b!913965 (not condMapEmpty!30477)) mapNonEmpty!30477))

(get-info :version)

(assert (= (and mapNonEmpty!30477 ((_ is ValueCellFull!9098) mapValue!30477)) b!913968))

(assert (= (and b!913965 ((_ is ValueCellFull!9098) mapDefault!30477)) b!913975))

(assert (= start!78358 b!913965))

(declare-fun b_lambda!13353 () Bool)

(assert (=> (not b_lambda!13353) (not b!913974)))

(declare-fun t!25969 () Bool)

(declare-fun tb!5443 () Bool)

(assert (=> (and start!78358 (= defaultEntry!1160 defaultEntry!1160) t!25969) tb!5443))

(declare-fun result!10705 () Bool)

(assert (=> tb!5443 (= result!10705 tp_is_empty!19159)))

(assert (=> b!913974 t!25969))

(declare-fun b_and!27325 () Bool)

(assert (= b_and!27323 (and (=> t!25969 result!10705) b_and!27325)))

(declare-fun m!848177 () Bool)

(assert (=> b!913964 m!848177))

(declare-fun m!848179 () Bool)

(assert (=> b!913972 m!848179))

(declare-fun m!848181 () Bool)

(assert (=> b!913973 m!848181))

(declare-fun m!848183 () Bool)

(assert (=> b!913973 m!848183))

(declare-fun m!848185 () Bool)

(assert (=> b!913966 m!848185))

(declare-fun m!848187 () Bool)

(assert (=> start!78358 m!848187))

(declare-fun m!848189 () Bool)

(assert (=> start!78358 m!848189))

(declare-fun m!848191 () Bool)

(assert (=> start!78358 m!848191))

(declare-fun m!848193 () Bool)

(assert (=> b!913974 m!848193))

(declare-fun m!848195 () Bool)

(assert (=> b!913974 m!848195))

(declare-fun m!848197 () Bool)

(assert (=> b!913974 m!848197))

(declare-fun m!848199 () Bool)

(assert (=> b!913974 m!848199))

(assert (=> b!913974 m!848193))

(assert (=> b!913974 m!848197))

(declare-fun m!848201 () Bool)

(assert (=> b!913974 m!848201))

(declare-fun m!848203 () Bool)

(assert (=> mapNonEmpty!30477 m!848203))

(declare-fun m!848205 () Bool)

(assert (=> b!913970 m!848205))

(declare-fun m!848207 () Bool)

(assert (=> b!913970 m!848207))

(declare-fun m!848209 () Bool)

(assert (=> b!913976 m!848209))

(declare-fun m!848211 () Bool)

(assert (=> b!913967 m!848211))

(declare-fun m!848213 () Bool)

(assert (=> b!913971 m!848213))

(declare-fun m!848215 () Bool)

(assert (=> b!913971 m!848215))

(check-sat (not b!913967) tp_is_empty!19159 (not b!913976) (not b_lambda!13353) (not b!913966) (not mapNonEmpty!30477) (not b!913972) (not b_next!16741) (not start!78358) (not b!913974) b_and!27325 (not b!913973) (not b!913971) (not b!913970))
(check-sat b_and!27325 (not b_next!16741))
