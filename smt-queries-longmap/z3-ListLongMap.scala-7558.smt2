; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95670 () Bool)

(assert start!95670)

(declare-fun b_free!22323 () Bool)

(declare-fun b_next!22323 () Bool)

(assert (=> start!95670 (= b_free!22323 (not b_next!22323))))

(declare-fun tp!78818 () Bool)

(declare-fun b_and!35321 () Bool)

(assert (=> start!95670 (= tp!78818 b_and!35321)))

(declare-fun b!1081349 () Bool)

(declare-fun e!618086 () Bool)

(declare-fun e!618088 () Bool)

(assert (=> b!1081349 (= e!618086 e!618088)))

(declare-fun res!720760 () Bool)

(assert (=> b!1081349 (=> (not res!720760) (not e!618088))))

(declare-datatypes ((array!69597 0))(
  ( (array!69598 (arr!33472 (Array (_ BitVec 32) (_ BitVec 64))) (size!34008 (_ BitVec 32))) )
))
(declare-fun lt!479273 () array!69597)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69597 (_ BitVec 32)) Bool)

(assert (=> b!1081349 (= res!720760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479273 mask!1414))))

(declare-fun _keys!1070 () array!69597)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081349 (= lt!479273 (array!69598 (store (arr!33472 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34008 _keys!1070)))))

(declare-fun b!1081350 () Bool)

(declare-fun res!720765 () Bool)

(assert (=> b!1081350 (=> (not res!720765) (not e!618086))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081350 (= res!720765 (validKeyInArray!0 k0!904))))

(declare-fun b!1081351 () Bool)

(declare-fun e!618084 () Bool)

(declare-fun tp_is_empty!26325 () Bool)

(assert (=> b!1081351 (= e!618084 tp_is_empty!26325)))

(declare-fun b!1081352 () Bool)

(declare-fun res!720758 () Bool)

(assert (=> b!1081352 (=> (not res!720758) (not e!618086))))

(assert (=> b!1081352 (= res!720758 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34008 _keys!1070))))))

(declare-fun res!720763 () Bool)

(assert (=> start!95670 (=> (not res!720763) (not e!618086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95670 (= res!720763 (validMask!0 mask!1414))))

(assert (=> start!95670 e!618086))

(assert (=> start!95670 tp!78818))

(assert (=> start!95670 true))

(assert (=> start!95670 tp_is_empty!26325))

(declare-fun array_inv!25838 (array!69597) Bool)

(assert (=> start!95670 (array_inv!25838 _keys!1070)))

(declare-datatypes ((V!40227 0))(
  ( (V!40228 (val!13219 Int)) )
))
(declare-datatypes ((ValueCell!12453 0))(
  ( (ValueCellFull!12453 (v!15840 V!40227)) (EmptyCell!12453) )
))
(declare-datatypes ((array!69599 0))(
  ( (array!69600 (arr!33473 (Array (_ BitVec 32) ValueCell!12453)) (size!34009 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69599)

(declare-fun e!618089 () Bool)

(declare-fun array_inv!25839 (array!69599) Bool)

(assert (=> start!95670 (and (array_inv!25839 _values!874) e!618089)))

(declare-fun b!1081353 () Bool)

(declare-fun res!720762 () Bool)

(assert (=> b!1081353 (=> (not res!720762) (not e!618086))))

(assert (=> b!1081353 (= res!720762 (= (select (arr!33472 _keys!1070) i!650) k0!904))))

(declare-fun b!1081354 () Bool)

(declare-fun e!618087 () Bool)

(declare-fun mapRes!41242 () Bool)

(assert (=> b!1081354 (= e!618089 (and e!618087 mapRes!41242))))

(declare-fun condMapEmpty!41242 () Bool)

(declare-fun mapDefault!41242 () ValueCell!12453)

(assert (=> b!1081354 (= condMapEmpty!41242 (= (arr!33473 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12453)) mapDefault!41242)))))

(declare-fun b!1081355 () Bool)

(assert (=> b!1081355 (= e!618087 tp_is_empty!26325)))

(declare-fun mapNonEmpty!41242 () Bool)

(declare-fun tp!78817 () Bool)

(assert (=> mapNonEmpty!41242 (= mapRes!41242 (and tp!78817 e!618084))))

(declare-fun mapRest!41242 () (Array (_ BitVec 32) ValueCell!12453))

(declare-fun mapKey!41242 () (_ BitVec 32))

(declare-fun mapValue!41242 () ValueCell!12453)

(assert (=> mapNonEmpty!41242 (= (arr!33473 _values!874) (store mapRest!41242 mapKey!41242 mapValue!41242))))

(declare-fun b!1081356 () Bool)

(declare-fun res!720764 () Bool)

(assert (=> b!1081356 (=> (not res!720764) (not e!618086))))

(declare-datatypes ((List!23327 0))(
  ( (Nil!23324) (Cons!23323 (h!24532 (_ BitVec 64)) (t!32708 List!23327)) )
))
(declare-fun arrayNoDuplicates!0 (array!69597 (_ BitVec 32) List!23327) Bool)

(assert (=> b!1081356 (= res!720764 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23324))))

(declare-fun mapIsEmpty!41242 () Bool)

(assert (=> mapIsEmpty!41242 mapRes!41242))

(declare-fun b!1081357 () Bool)

(declare-fun res!720761 () Bool)

(assert (=> b!1081357 (=> (not res!720761) (not e!618088))))

(assert (=> b!1081357 (= res!720761 (arrayNoDuplicates!0 lt!479273 #b00000000000000000000000000000000 Nil!23324))))

(declare-fun b!1081358 () Bool)

(assert (=> b!1081358 (= e!618088 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40227)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40227)

(declare-datatypes ((tuple2!16748 0))(
  ( (tuple2!16749 (_1!8385 (_ BitVec 64)) (_2!8385 V!40227)) )
))
(declare-datatypes ((List!23328 0))(
  ( (Nil!23325) (Cons!23324 (h!24533 tuple2!16748) (t!32709 List!23328)) )
))
(declare-datatypes ((ListLongMap!14717 0))(
  ( (ListLongMap!14718 (toList!7374 List!23328)) )
))
(declare-fun lt!479272 () ListLongMap!14717)

(declare-fun getCurrentListMapNoExtraKeys!3922 (array!69597 array!69599 (_ BitVec 32) (_ BitVec 32) V!40227 V!40227 (_ BitVec 32) Int) ListLongMap!14717)

(declare-fun dynLambda!2059 (Int (_ BitVec 64)) V!40227)

(assert (=> b!1081358 (= lt!479272 (getCurrentListMapNoExtraKeys!3922 lt!479273 (array!69600 (store (arr!33473 _values!874) i!650 (ValueCellFull!12453 (dynLambda!2059 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34009 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479275 () ListLongMap!14717)

(assert (=> b!1081358 (= lt!479275 (getCurrentListMapNoExtraKeys!3922 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081358 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35568 0))(
  ( (Unit!35569) )
))
(declare-fun lt!479274 () Unit!35568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69597 (_ BitVec 64) (_ BitVec 32)) Unit!35568)

(assert (=> b!1081358 (= lt!479274 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081359 () Bool)

(declare-fun res!720759 () Bool)

(assert (=> b!1081359 (=> (not res!720759) (not e!618086))))

(assert (=> b!1081359 (= res!720759 (and (= (size!34009 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34008 _keys!1070) (size!34009 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081360 () Bool)

(declare-fun res!720757 () Bool)

(assert (=> b!1081360 (=> (not res!720757) (not e!618086))))

(assert (=> b!1081360 (= res!720757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95670 res!720763) b!1081359))

(assert (= (and b!1081359 res!720759) b!1081360))

(assert (= (and b!1081360 res!720757) b!1081356))

(assert (= (and b!1081356 res!720764) b!1081352))

(assert (= (and b!1081352 res!720758) b!1081350))

(assert (= (and b!1081350 res!720765) b!1081353))

(assert (= (and b!1081353 res!720762) b!1081349))

(assert (= (and b!1081349 res!720760) b!1081357))

(assert (= (and b!1081357 res!720761) b!1081358))

(assert (= (and b!1081354 condMapEmpty!41242) mapIsEmpty!41242))

(assert (= (and b!1081354 (not condMapEmpty!41242)) mapNonEmpty!41242))

(get-info :version)

(assert (= (and mapNonEmpty!41242 ((_ is ValueCellFull!12453) mapValue!41242)) b!1081351))

(assert (= (and b!1081354 ((_ is ValueCellFull!12453) mapDefault!41242)) b!1081355))

(assert (= start!95670 b!1081354))

(declare-fun b_lambda!16993 () Bool)

(assert (=> (not b_lambda!16993) (not b!1081358)))

(declare-fun t!32707 () Bool)

(declare-fun tb!7201 () Bool)

(assert (=> (and start!95670 (= defaultEntry!882 defaultEntry!882) t!32707) tb!7201))

(declare-fun result!14921 () Bool)

(assert (=> tb!7201 (= result!14921 tp_is_empty!26325)))

(assert (=> b!1081358 t!32707))

(declare-fun b_and!35323 () Bool)

(assert (= b_and!35321 (and (=> t!32707 result!14921) b_and!35323)))

(declare-fun m!999149 () Bool)

(assert (=> b!1081357 m!999149))

(declare-fun m!999151 () Bool)

(assert (=> start!95670 m!999151))

(declare-fun m!999153 () Bool)

(assert (=> start!95670 m!999153))

(declare-fun m!999155 () Bool)

(assert (=> start!95670 m!999155))

(declare-fun m!999157 () Bool)

(assert (=> b!1081350 m!999157))

(declare-fun m!999159 () Bool)

(assert (=> b!1081349 m!999159))

(declare-fun m!999161 () Bool)

(assert (=> b!1081349 m!999161))

(declare-fun m!999163 () Bool)

(assert (=> b!1081353 m!999163))

(declare-fun m!999165 () Bool)

(assert (=> mapNonEmpty!41242 m!999165))

(declare-fun m!999167 () Bool)

(assert (=> b!1081356 m!999167))

(declare-fun m!999169 () Bool)

(assert (=> b!1081360 m!999169))

(declare-fun m!999171 () Bool)

(assert (=> b!1081358 m!999171))

(declare-fun m!999173 () Bool)

(assert (=> b!1081358 m!999173))

(declare-fun m!999175 () Bool)

(assert (=> b!1081358 m!999175))

(declare-fun m!999177 () Bool)

(assert (=> b!1081358 m!999177))

(declare-fun m!999179 () Bool)

(assert (=> b!1081358 m!999179))

(declare-fun m!999181 () Bool)

(assert (=> b!1081358 m!999181))

(check-sat (not b_next!22323) (not b!1081360) (not mapNonEmpty!41242) (not b!1081350) tp_is_empty!26325 (not start!95670) (not b!1081358) b_and!35323 (not b!1081357) (not b_lambda!16993) (not b!1081349) (not b!1081356))
(check-sat b_and!35323 (not b_next!22323))
