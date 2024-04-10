; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95808 () Bool)

(assert start!95808)

(declare-fun b_free!22461 () Bool)

(declare-fun b_next!22461 () Bool)

(assert (=> start!95808 (= b_free!22461 (not b_next!22461))))

(declare-fun tp!79232 () Bool)

(declare-fun b_and!35597 () Bool)

(assert (=> start!95808 (= tp!79232 b_and!35597)))

(declare-fun b!1083971 () Bool)

(declare-fun e!619331 () Bool)

(declare-fun e!619329 () Bool)

(declare-fun mapRes!41449 () Bool)

(assert (=> b!1083971 (= e!619331 (and e!619329 mapRes!41449))))

(declare-fun condMapEmpty!41449 () Bool)

(declare-datatypes ((V!40411 0))(
  ( (V!40412 (val!13288 Int)) )
))
(declare-datatypes ((ValueCell!12522 0))(
  ( (ValueCellFull!12522 (v!15909 V!40411)) (EmptyCell!12522) )
))
(declare-datatypes ((array!69869 0))(
  ( (array!69870 (arr!33608 (Array (_ BitVec 32) ValueCell!12522)) (size!34144 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69869)

(declare-fun mapDefault!41449 () ValueCell!12522)

(assert (=> b!1083971 (= condMapEmpty!41449 (= (arr!33608 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12522)) mapDefault!41449)))))

(declare-fun b!1083972 () Bool)

(declare-fun e!619326 () Bool)

(declare-fun tp_is_empty!26463 () Bool)

(assert (=> b!1083972 (= e!619326 tp_is_empty!26463)))

(declare-fun mapNonEmpty!41449 () Bool)

(declare-fun tp!79231 () Bool)

(assert (=> mapNonEmpty!41449 (= mapRes!41449 (and tp!79231 e!619326))))

(declare-fun mapValue!41449 () ValueCell!12522)

(declare-fun mapRest!41449 () (Array (_ BitVec 32) ValueCell!12522))

(declare-fun mapKey!41449 () (_ BitVec 32))

(assert (=> mapNonEmpty!41449 (= (arr!33608 _values!874) (store mapRest!41449 mapKey!41449 mapValue!41449))))

(declare-fun b!1083973 () Bool)

(declare-fun res!722628 () Bool)

(declare-fun e!619330 () Bool)

(assert (=> b!1083973 (=> (not res!722628) (not e!619330))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69871 0))(
  ( (array!69872 (arr!33609 (Array (_ BitVec 32) (_ BitVec 64))) (size!34145 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69871)

(assert (=> b!1083973 (= res!722628 (and (= (size!34144 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34145 _keys!1070) (size!34144 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!722623 () Bool)

(assert (=> start!95808 (=> (not res!722623) (not e!619330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95808 (= res!722623 (validMask!0 mask!1414))))

(assert (=> start!95808 e!619330))

(assert (=> start!95808 tp!79232))

(assert (=> start!95808 true))

(assert (=> start!95808 tp_is_empty!26463))

(declare-fun array_inv!25940 (array!69871) Bool)

(assert (=> start!95808 (array_inv!25940 _keys!1070)))

(declare-fun array_inv!25941 (array!69869) Bool)

(assert (=> start!95808 (and (array_inv!25941 _values!874) e!619331)))

(declare-fun b!1083974 () Bool)

(declare-fun res!722621 () Bool)

(assert (=> b!1083974 (=> (not res!722621) (not e!619330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69871 (_ BitVec 32)) Bool)

(assert (=> b!1083974 (= res!722621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41449 () Bool)

(assert (=> mapIsEmpty!41449 mapRes!41449))

(declare-fun b!1083975 () Bool)

(declare-fun e!619327 () Bool)

(assert (=> b!1083975 (= e!619327 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16844 0))(
  ( (tuple2!16845 (_1!8433 (_ BitVec 64)) (_2!8433 V!40411)) )
))
(declare-datatypes ((List!23431 0))(
  ( (Nil!23428) (Cons!23427 (h!24636 tuple2!16844) (t!32950 List!23431)) )
))
(declare-datatypes ((ListLongMap!14813 0))(
  ( (ListLongMap!14814 (toList!7422 List!23431)) )
))
(declare-fun lt!480392 () ListLongMap!14813)

(declare-fun minValue!831 () V!40411)

(declare-fun lt!480396 () array!69871)

(declare-fun zeroValue!831 () V!40411)

(declare-fun lt!480393 () array!69869)

(declare-fun getCurrentListMap!4210 (array!69871 array!69869 (_ BitVec 32) (_ BitVec 32) V!40411 V!40411 (_ BitVec 32) Int) ListLongMap!14813)

(assert (=> b!1083975 (= lt!480392 (getCurrentListMap!4210 lt!480396 lt!480393 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480395 () ListLongMap!14813)

(declare-fun lt!480397 () ListLongMap!14813)

(assert (=> b!1083975 (and (= lt!480395 lt!480397) (= lt!480397 lt!480395))))

(declare-fun lt!480391 () ListLongMap!14813)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!749 (ListLongMap!14813 (_ BitVec 64)) ListLongMap!14813)

(assert (=> b!1083975 (= lt!480397 (-!749 lt!480391 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35664 0))(
  ( (Unit!35665) )
))
(declare-fun lt!480390 () Unit!35664)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!29 (array!69871 array!69869 (_ BitVec 32) (_ BitVec 32) V!40411 V!40411 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35664)

(assert (=> b!1083975 (= lt!480390 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!29 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3970 (array!69871 array!69869 (_ BitVec 32) (_ BitVec 32) V!40411 V!40411 (_ BitVec 32) Int) ListLongMap!14813)

(assert (=> b!1083975 (= lt!480395 (getCurrentListMapNoExtraKeys!3970 lt!480396 lt!480393 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2107 (Int (_ BitVec 64)) V!40411)

(assert (=> b!1083975 (= lt!480393 (array!69870 (store (arr!33608 _values!874) i!650 (ValueCellFull!12522 (dynLambda!2107 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34144 _values!874)))))

(assert (=> b!1083975 (= lt!480391 (getCurrentListMapNoExtraKeys!3970 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083975 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480394 () Unit!35664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69871 (_ BitVec 64) (_ BitVec 32)) Unit!35664)

(assert (=> b!1083975 (= lt!480394 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083976 () Bool)

(declare-fun res!722625 () Bool)

(assert (=> b!1083976 (=> (not res!722625) (not e!619330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083976 (= res!722625 (validKeyInArray!0 k0!904))))

(declare-fun b!1083977 () Bool)

(declare-fun res!722627 () Bool)

(assert (=> b!1083977 (=> (not res!722627) (not e!619327))))

(declare-datatypes ((List!23432 0))(
  ( (Nil!23429) (Cons!23428 (h!24637 (_ BitVec 64)) (t!32951 List!23432)) )
))
(declare-fun arrayNoDuplicates!0 (array!69871 (_ BitVec 32) List!23432) Bool)

(assert (=> b!1083977 (= res!722627 (arrayNoDuplicates!0 lt!480396 #b00000000000000000000000000000000 Nil!23429))))

(declare-fun b!1083978 () Bool)

(declare-fun res!722626 () Bool)

(assert (=> b!1083978 (=> (not res!722626) (not e!619330))))

(assert (=> b!1083978 (= res!722626 (= (select (arr!33609 _keys!1070) i!650) k0!904))))

(declare-fun b!1083979 () Bool)

(declare-fun res!722620 () Bool)

(assert (=> b!1083979 (=> (not res!722620) (not e!619330))))

(assert (=> b!1083979 (= res!722620 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34145 _keys!1070))))))

(declare-fun b!1083980 () Bool)

(assert (=> b!1083980 (= e!619329 tp_is_empty!26463)))

(declare-fun b!1083981 () Bool)

(assert (=> b!1083981 (= e!619330 e!619327)))

(declare-fun res!722622 () Bool)

(assert (=> b!1083981 (=> (not res!722622) (not e!619327))))

(assert (=> b!1083981 (= res!722622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480396 mask!1414))))

(assert (=> b!1083981 (= lt!480396 (array!69872 (store (arr!33609 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34145 _keys!1070)))))

(declare-fun b!1083982 () Bool)

(declare-fun res!722624 () Bool)

(assert (=> b!1083982 (=> (not res!722624) (not e!619330))))

(assert (=> b!1083982 (= res!722624 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23429))))

(assert (= (and start!95808 res!722623) b!1083973))

(assert (= (and b!1083973 res!722628) b!1083974))

(assert (= (and b!1083974 res!722621) b!1083982))

(assert (= (and b!1083982 res!722624) b!1083979))

(assert (= (and b!1083979 res!722620) b!1083976))

(assert (= (and b!1083976 res!722625) b!1083978))

(assert (= (and b!1083978 res!722626) b!1083981))

(assert (= (and b!1083981 res!722622) b!1083977))

(assert (= (and b!1083977 res!722627) b!1083975))

(assert (= (and b!1083971 condMapEmpty!41449) mapIsEmpty!41449))

(assert (= (and b!1083971 (not condMapEmpty!41449)) mapNonEmpty!41449))

(get-info :version)

(assert (= (and mapNonEmpty!41449 ((_ is ValueCellFull!12522) mapValue!41449)) b!1083972))

(assert (= (and b!1083971 ((_ is ValueCellFull!12522) mapDefault!41449)) b!1083980))

(assert (= start!95808 b!1083971))

(declare-fun b_lambda!17131 () Bool)

(assert (=> (not b_lambda!17131) (not b!1083975)))

(declare-fun t!32949 () Bool)

(declare-fun tb!7339 () Bool)

(assert (=> (and start!95808 (= defaultEntry!882 defaultEntry!882) t!32949) tb!7339))

(declare-fun result!15197 () Bool)

(assert (=> tb!7339 (= result!15197 tp_is_empty!26463)))

(assert (=> b!1083975 t!32949))

(declare-fun b_and!35599 () Bool)

(assert (= b_and!35597 (and (=> t!32949 result!15197) b_and!35599)))

(declare-fun m!1001663 () Bool)

(assert (=> b!1083981 m!1001663))

(declare-fun m!1001665 () Bool)

(assert (=> b!1083981 m!1001665))

(declare-fun m!1001667 () Bool)

(assert (=> b!1083982 m!1001667))

(declare-fun m!1001669 () Bool)

(assert (=> b!1083978 m!1001669))

(declare-fun m!1001671 () Bool)

(assert (=> b!1083976 m!1001671))

(declare-fun m!1001673 () Bool)

(assert (=> b!1083974 m!1001673))

(declare-fun m!1001675 () Bool)

(assert (=> b!1083975 m!1001675))

(declare-fun m!1001677 () Bool)

(assert (=> b!1083975 m!1001677))

(declare-fun m!1001679 () Bool)

(assert (=> b!1083975 m!1001679))

(declare-fun m!1001681 () Bool)

(assert (=> b!1083975 m!1001681))

(declare-fun m!1001683 () Bool)

(assert (=> b!1083975 m!1001683))

(declare-fun m!1001685 () Bool)

(assert (=> b!1083975 m!1001685))

(declare-fun m!1001687 () Bool)

(assert (=> b!1083975 m!1001687))

(declare-fun m!1001689 () Bool)

(assert (=> b!1083975 m!1001689))

(declare-fun m!1001691 () Bool)

(assert (=> b!1083975 m!1001691))

(declare-fun m!1001693 () Bool)

(assert (=> start!95808 m!1001693))

(declare-fun m!1001695 () Bool)

(assert (=> start!95808 m!1001695))

(declare-fun m!1001697 () Bool)

(assert (=> start!95808 m!1001697))

(declare-fun m!1001699 () Bool)

(assert (=> b!1083977 m!1001699))

(declare-fun m!1001701 () Bool)

(assert (=> mapNonEmpty!41449 m!1001701))

(check-sat tp_is_empty!26463 (not start!95808) (not b!1083975) (not b!1083982) b_and!35599 (not b!1083974) (not b_next!22461) (not b_lambda!17131) (not b!1083981) (not b!1083976) (not mapNonEmpty!41449) (not b!1083977))
(check-sat b_and!35599 (not b_next!22461))
