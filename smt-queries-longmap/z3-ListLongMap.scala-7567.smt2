; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95724 () Bool)

(assert start!95724)

(declare-fun b_free!22377 () Bool)

(declare-fun b_next!22377 () Bool)

(assert (=> start!95724 (= b_free!22377 (not b_next!22377))))

(declare-fun tp!78980 () Bool)

(declare-fun b_and!35429 () Bool)

(assert (=> start!95724 (= tp!78980 b_and!35429)))

(declare-fun b!1082375 () Bool)

(declare-fun e!618571 () Bool)

(declare-fun tp_is_empty!26379 () Bool)

(assert (=> b!1082375 (= e!618571 tp_is_empty!26379)))

(declare-fun b!1082376 () Bool)

(declare-fun res!721486 () Bool)

(declare-fun e!618573 () Bool)

(assert (=> b!1082376 (=> (not res!721486) (not e!618573))))

(declare-datatypes ((array!69705 0))(
  ( (array!69706 (arr!33526 (Array (_ BitVec 32) (_ BitVec 64))) (size!34062 (_ BitVec 32))) )
))
(declare-fun lt!479596 () array!69705)

(declare-datatypes ((List!23366 0))(
  ( (Nil!23363) (Cons!23362 (h!24571 (_ BitVec 64)) (t!32801 List!23366)) )
))
(declare-fun arrayNoDuplicates!0 (array!69705 (_ BitVec 32) List!23366) Bool)

(assert (=> b!1082376 (= res!721486 (arrayNoDuplicates!0 lt!479596 #b00000000000000000000000000000000 Nil!23363))))

(declare-fun res!721493 () Bool)

(declare-fun e!618574 () Bool)

(assert (=> start!95724 (=> (not res!721493) (not e!618574))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95724 (= res!721493 (validMask!0 mask!1414))))

(assert (=> start!95724 e!618574))

(assert (=> start!95724 tp!78980))

(assert (=> start!95724 true))

(assert (=> start!95724 tp_is_empty!26379))

(declare-fun _keys!1070 () array!69705)

(declare-fun array_inv!25880 (array!69705) Bool)

(assert (=> start!95724 (array_inv!25880 _keys!1070)))

(declare-datatypes ((V!40299 0))(
  ( (V!40300 (val!13246 Int)) )
))
(declare-datatypes ((ValueCell!12480 0))(
  ( (ValueCellFull!12480 (v!15867 V!40299)) (EmptyCell!12480) )
))
(declare-datatypes ((array!69707 0))(
  ( (array!69708 (arr!33527 (Array (_ BitVec 32) ValueCell!12480)) (size!34063 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69707)

(declare-fun e!618575 () Bool)

(declare-fun array_inv!25881 (array!69707) Bool)

(assert (=> start!95724 (and (array_inv!25881 _values!874) e!618575)))

(declare-fun b!1082377 () Bool)

(declare-fun res!721490 () Bool)

(assert (=> b!1082377 (=> (not res!721490) (not e!618574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69705 (_ BitVec 32)) Bool)

(assert (=> b!1082377 (= res!721490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082378 () Bool)

(assert (=> b!1082378 (= e!618574 e!618573)))

(declare-fun res!721491 () Bool)

(assert (=> b!1082378 (=> (not res!721491) (not e!618573))))

(assert (=> b!1082378 (= res!721491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479596 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082378 (= lt!479596 (array!69706 (store (arr!33526 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34062 _keys!1070)))))

(declare-fun b!1082379 () Bool)

(assert (=> b!1082379 (= e!618573 (not true))))

(declare-datatypes ((tuple2!16782 0))(
  ( (tuple2!16783 (_1!8402 (_ BitVec 64)) (_2!8402 V!40299)) )
))
(declare-datatypes ((List!23367 0))(
  ( (Nil!23364) (Cons!23363 (h!24572 tuple2!16782) (t!32802 List!23367)) )
))
(declare-datatypes ((ListLongMap!14751 0))(
  ( (ListLongMap!14752 (toList!7391 List!23367)) )
))
(declare-fun lt!479598 () ListLongMap!14751)

(declare-fun minValue!831 () V!40299)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40299)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3939 (array!69705 array!69707 (_ BitVec 32) (_ BitVec 32) V!40299 V!40299 (_ BitVec 32) Int) ListLongMap!14751)

(declare-fun dynLambda!2076 (Int (_ BitVec 64)) V!40299)

(assert (=> b!1082379 (= lt!479598 (getCurrentListMapNoExtraKeys!3939 lt!479596 (array!69708 (store (arr!33527 _values!874) i!650 (ValueCellFull!12480 (dynLambda!2076 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34063 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479599 () ListLongMap!14751)

(assert (=> b!1082379 (= lt!479599 (getCurrentListMapNoExtraKeys!3939 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082379 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35602 0))(
  ( (Unit!35603) )
))
(declare-fun lt!479597 () Unit!35602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69705 (_ BitVec 64) (_ BitVec 32)) Unit!35602)

(assert (=> b!1082379 (= lt!479597 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082380 () Bool)

(declare-fun res!721489 () Bool)

(assert (=> b!1082380 (=> (not res!721489) (not e!618574))))

(assert (=> b!1082380 (= res!721489 (and (= (size!34063 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34062 _keys!1070) (size!34063 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082381 () Bool)

(declare-fun res!721487 () Bool)

(assert (=> b!1082381 (=> (not res!721487) (not e!618574))))

(assert (=> b!1082381 (= res!721487 (= (select (arr!33526 _keys!1070) i!650) k0!904))))

(declare-fun b!1082382 () Bool)

(declare-fun res!721488 () Bool)

(assert (=> b!1082382 (=> (not res!721488) (not e!618574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082382 (= res!721488 (validKeyInArray!0 k0!904))))

(declare-fun b!1082383 () Bool)

(declare-fun res!721494 () Bool)

(assert (=> b!1082383 (=> (not res!721494) (not e!618574))))

(assert (=> b!1082383 (= res!721494 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23363))))

(declare-fun b!1082384 () Bool)

(declare-fun e!618570 () Bool)

(assert (=> b!1082384 (= e!618570 tp_is_empty!26379)))

(declare-fun b!1082385 () Bool)

(declare-fun res!721492 () Bool)

(assert (=> b!1082385 (=> (not res!721492) (not e!618574))))

(assert (=> b!1082385 (= res!721492 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34062 _keys!1070))))))

(declare-fun b!1082386 () Bool)

(declare-fun mapRes!41323 () Bool)

(assert (=> b!1082386 (= e!618575 (and e!618570 mapRes!41323))))

(declare-fun condMapEmpty!41323 () Bool)

(declare-fun mapDefault!41323 () ValueCell!12480)

(assert (=> b!1082386 (= condMapEmpty!41323 (= (arr!33527 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12480)) mapDefault!41323)))))

(declare-fun mapNonEmpty!41323 () Bool)

(declare-fun tp!78979 () Bool)

(assert (=> mapNonEmpty!41323 (= mapRes!41323 (and tp!78979 e!618571))))

(declare-fun mapValue!41323 () ValueCell!12480)

(declare-fun mapKey!41323 () (_ BitVec 32))

(declare-fun mapRest!41323 () (Array (_ BitVec 32) ValueCell!12480))

(assert (=> mapNonEmpty!41323 (= (arr!33527 _values!874) (store mapRest!41323 mapKey!41323 mapValue!41323))))

(declare-fun mapIsEmpty!41323 () Bool)

(assert (=> mapIsEmpty!41323 mapRes!41323))

(assert (= (and start!95724 res!721493) b!1082380))

(assert (= (and b!1082380 res!721489) b!1082377))

(assert (= (and b!1082377 res!721490) b!1082383))

(assert (= (and b!1082383 res!721494) b!1082385))

(assert (= (and b!1082385 res!721492) b!1082382))

(assert (= (and b!1082382 res!721488) b!1082381))

(assert (= (and b!1082381 res!721487) b!1082378))

(assert (= (and b!1082378 res!721491) b!1082376))

(assert (= (and b!1082376 res!721486) b!1082379))

(assert (= (and b!1082386 condMapEmpty!41323) mapIsEmpty!41323))

(assert (= (and b!1082386 (not condMapEmpty!41323)) mapNonEmpty!41323))

(get-info :version)

(assert (= (and mapNonEmpty!41323 ((_ is ValueCellFull!12480) mapValue!41323)) b!1082375))

(assert (= (and b!1082386 ((_ is ValueCellFull!12480) mapDefault!41323)) b!1082384))

(assert (= start!95724 b!1082386))

(declare-fun b_lambda!17047 () Bool)

(assert (=> (not b_lambda!17047) (not b!1082379)))

(declare-fun t!32800 () Bool)

(declare-fun tb!7255 () Bool)

(assert (=> (and start!95724 (= defaultEntry!882 defaultEntry!882) t!32800) tb!7255))

(declare-fun result!15029 () Bool)

(assert (=> tb!7255 (= result!15029 tp_is_empty!26379)))

(assert (=> b!1082379 t!32800))

(declare-fun b_and!35431 () Bool)

(assert (= b_and!35429 (and (=> t!32800 result!15029) b_and!35431)))

(declare-fun m!1000067 () Bool)

(assert (=> b!1082382 m!1000067))

(declare-fun m!1000069 () Bool)

(assert (=> b!1082378 m!1000069))

(declare-fun m!1000071 () Bool)

(assert (=> b!1082378 m!1000071))

(declare-fun m!1000073 () Bool)

(assert (=> start!95724 m!1000073))

(declare-fun m!1000075 () Bool)

(assert (=> start!95724 m!1000075))

(declare-fun m!1000077 () Bool)

(assert (=> start!95724 m!1000077))

(declare-fun m!1000079 () Bool)

(assert (=> b!1082377 m!1000079))

(declare-fun m!1000081 () Bool)

(assert (=> b!1082381 m!1000081))

(declare-fun m!1000083 () Bool)

(assert (=> b!1082383 m!1000083))

(declare-fun m!1000085 () Bool)

(assert (=> b!1082376 m!1000085))

(declare-fun m!1000087 () Bool)

(assert (=> b!1082379 m!1000087))

(declare-fun m!1000089 () Bool)

(assert (=> b!1082379 m!1000089))

(declare-fun m!1000091 () Bool)

(assert (=> b!1082379 m!1000091))

(declare-fun m!1000093 () Bool)

(assert (=> b!1082379 m!1000093))

(declare-fun m!1000095 () Bool)

(assert (=> b!1082379 m!1000095))

(declare-fun m!1000097 () Bool)

(assert (=> b!1082379 m!1000097))

(declare-fun m!1000099 () Bool)

(assert (=> mapNonEmpty!41323 m!1000099))

(check-sat tp_is_empty!26379 (not b!1082379) (not start!95724) (not mapNonEmpty!41323) (not b!1082383) b_and!35431 (not b!1082376) (not b!1082377) (not b_next!22377) (not b_lambda!17047) (not b!1082382) (not b!1082378))
(check-sat b_and!35431 (not b_next!22377))
