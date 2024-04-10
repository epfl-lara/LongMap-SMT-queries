; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95802 () Bool)

(assert start!95802)

(declare-fun b_free!22455 () Bool)

(declare-fun b_next!22455 () Bool)

(assert (=> start!95802 (= b_free!22455 (not b_next!22455))))

(declare-fun tp!79213 () Bool)

(declare-fun b_and!35585 () Bool)

(assert (=> start!95802 (= tp!79213 b_and!35585)))

(declare-fun b!1083857 () Bool)

(declare-fun e!619272 () Bool)

(declare-fun e!619274 () Bool)

(assert (=> b!1083857 (= e!619272 e!619274)))

(declare-fun res!722543 () Bool)

(assert (=> b!1083857 (=> (not res!722543) (not e!619274))))

(declare-datatypes ((array!69857 0))(
  ( (array!69858 (arr!33602 (Array (_ BitVec 32) (_ BitVec 64))) (size!34138 (_ BitVec 32))) )
))
(declare-fun lt!480319 () array!69857)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69857 (_ BitVec 32)) Bool)

(assert (=> b!1083857 (= res!722543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480319 mask!1414))))

(declare-fun _keys!1070 () array!69857)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083857 (= lt!480319 (array!69858 (store (arr!33602 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34138 _keys!1070)))))

(declare-fun b!1083858 () Bool)

(declare-fun res!722539 () Bool)

(assert (=> b!1083858 (=> (not res!722539) (not e!619272))))

(assert (=> b!1083858 (= res!722539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41440 () Bool)

(declare-fun mapRes!41440 () Bool)

(assert (=> mapIsEmpty!41440 mapRes!41440))

(declare-fun b!1083859 () Bool)

(declare-fun e!619276 () Bool)

(declare-fun e!619275 () Bool)

(assert (=> b!1083859 (= e!619276 (and e!619275 mapRes!41440))))

(declare-fun condMapEmpty!41440 () Bool)

(declare-datatypes ((V!40403 0))(
  ( (V!40404 (val!13285 Int)) )
))
(declare-datatypes ((ValueCell!12519 0))(
  ( (ValueCellFull!12519 (v!15906 V!40403)) (EmptyCell!12519) )
))
(declare-datatypes ((array!69859 0))(
  ( (array!69860 (arr!33603 (Array (_ BitVec 32) ValueCell!12519)) (size!34139 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69859)

(declare-fun mapDefault!41440 () ValueCell!12519)

(assert (=> b!1083859 (= condMapEmpty!41440 (= (arr!33603 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12519)) mapDefault!41440)))))

(declare-fun res!722541 () Bool)

(assert (=> start!95802 (=> (not res!722541) (not e!619272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95802 (= res!722541 (validMask!0 mask!1414))))

(assert (=> start!95802 e!619272))

(assert (=> start!95802 tp!79213))

(assert (=> start!95802 true))

(declare-fun tp_is_empty!26457 () Bool)

(assert (=> start!95802 tp_is_empty!26457))

(declare-fun array_inv!25936 (array!69857) Bool)

(assert (=> start!95802 (array_inv!25936 _keys!1070)))

(declare-fun array_inv!25937 (array!69859) Bool)

(assert (=> start!95802 (and (array_inv!25937 _values!874) e!619276)))

(declare-fun b!1083860 () Bool)

(declare-fun e!619277 () Bool)

(assert (=> b!1083860 (= e!619277 tp_is_empty!26457)))

(declare-fun b!1083861 () Bool)

(assert (=> b!1083861 (= e!619275 tp_is_empty!26457)))

(declare-fun mapNonEmpty!41440 () Bool)

(declare-fun tp!79214 () Bool)

(assert (=> mapNonEmpty!41440 (= mapRes!41440 (and tp!79214 e!619277))))

(declare-fun mapRest!41440 () (Array (_ BitVec 32) ValueCell!12519))

(declare-fun mapKey!41440 () (_ BitVec 32))

(declare-fun mapValue!41440 () ValueCell!12519)

(assert (=> mapNonEmpty!41440 (= (arr!33603 _values!874) (store mapRest!41440 mapKey!41440 mapValue!41440))))

(declare-fun b!1083862 () Bool)

(declare-fun res!722545 () Bool)

(assert (=> b!1083862 (=> (not res!722545) (not e!619272))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1083862 (= res!722545 (= (select (arr!33602 _keys!1070) i!650) k0!904))))

(declare-fun b!1083863 () Bool)

(declare-fun res!722547 () Bool)

(assert (=> b!1083863 (=> (not res!722547) (not e!619272))))

(declare-datatypes ((List!23427 0))(
  ( (Nil!23424) (Cons!23423 (h!24632 (_ BitVec 64)) (t!32940 List!23427)) )
))
(declare-fun arrayNoDuplicates!0 (array!69857 (_ BitVec 32) List!23427) Bool)

(assert (=> b!1083863 (= res!722547 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23424))))

(declare-fun b!1083864 () Bool)

(declare-fun res!722542 () Bool)

(assert (=> b!1083864 (=> (not res!722542) (not e!619272))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1083864 (= res!722542 (and (= (size!34139 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34138 _keys!1070) (size!34139 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083865 () Bool)

(declare-fun res!722540 () Bool)

(assert (=> b!1083865 (=> (not res!722540) (not e!619272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083865 (= res!722540 (validKeyInArray!0 k0!904))))

(declare-fun b!1083866 () Bool)

(declare-fun res!722544 () Bool)

(assert (=> b!1083866 (=> (not res!722544) (not e!619272))))

(assert (=> b!1083866 (= res!722544 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34138 _keys!1070))))))

(declare-fun b!1083867 () Bool)

(declare-fun res!722546 () Bool)

(assert (=> b!1083867 (=> (not res!722546) (not e!619274))))

(assert (=> b!1083867 (= res!722546 (arrayNoDuplicates!0 lt!480319 #b00000000000000000000000000000000 Nil!23424))))

(declare-fun b!1083868 () Bool)

(assert (=> b!1083868 (= e!619274 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16840 0))(
  ( (tuple2!16841 (_1!8431 (_ BitVec 64)) (_2!8431 V!40403)) )
))
(declare-datatypes ((List!23428 0))(
  ( (Nil!23425) (Cons!23424 (h!24633 tuple2!16840) (t!32941 List!23428)) )
))
(declare-datatypes ((ListLongMap!14809 0))(
  ( (ListLongMap!14810 (toList!7420 List!23428)) )
))
(declare-fun lt!480321 () ListLongMap!14809)

(declare-fun minValue!831 () V!40403)

(declare-fun lt!480323 () array!69859)

(declare-fun zeroValue!831 () V!40403)

(declare-fun getCurrentListMap!4208 (array!69857 array!69859 (_ BitVec 32) (_ BitVec 32) V!40403 V!40403 (_ BitVec 32) Int) ListLongMap!14809)

(assert (=> b!1083868 (= lt!480321 (getCurrentListMap!4208 lt!480319 lt!480323 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480324 () ListLongMap!14809)

(declare-fun lt!480322 () ListLongMap!14809)

(assert (=> b!1083868 (and (= lt!480324 lt!480322) (= lt!480322 lt!480324))))

(declare-fun lt!480320 () ListLongMap!14809)

(declare-fun -!747 (ListLongMap!14809 (_ BitVec 64)) ListLongMap!14809)

(assert (=> b!1083868 (= lt!480322 (-!747 lt!480320 k0!904))))

(declare-datatypes ((Unit!35660 0))(
  ( (Unit!35661) )
))
(declare-fun lt!480325 () Unit!35660)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!27 (array!69857 array!69859 (_ BitVec 32) (_ BitVec 32) V!40403 V!40403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35660)

(assert (=> b!1083868 (= lt!480325 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!27 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3968 (array!69857 array!69859 (_ BitVec 32) (_ BitVec 32) V!40403 V!40403 (_ BitVec 32) Int) ListLongMap!14809)

(assert (=> b!1083868 (= lt!480324 (getCurrentListMapNoExtraKeys!3968 lt!480319 lt!480323 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2105 (Int (_ BitVec 64)) V!40403)

(assert (=> b!1083868 (= lt!480323 (array!69860 (store (arr!33603 _values!874) i!650 (ValueCellFull!12519 (dynLambda!2105 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34139 _values!874)))))

(assert (=> b!1083868 (= lt!480320 (getCurrentListMapNoExtraKeys!3968 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083868 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480318 () Unit!35660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69857 (_ BitVec 64) (_ BitVec 32)) Unit!35660)

(assert (=> b!1083868 (= lt!480318 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95802 res!722541) b!1083864))

(assert (= (and b!1083864 res!722542) b!1083858))

(assert (= (and b!1083858 res!722539) b!1083863))

(assert (= (and b!1083863 res!722547) b!1083866))

(assert (= (and b!1083866 res!722544) b!1083865))

(assert (= (and b!1083865 res!722540) b!1083862))

(assert (= (and b!1083862 res!722545) b!1083857))

(assert (= (and b!1083857 res!722543) b!1083867))

(assert (= (and b!1083867 res!722546) b!1083868))

(assert (= (and b!1083859 condMapEmpty!41440) mapIsEmpty!41440))

(assert (= (and b!1083859 (not condMapEmpty!41440)) mapNonEmpty!41440))

(get-info :version)

(assert (= (and mapNonEmpty!41440 ((_ is ValueCellFull!12519) mapValue!41440)) b!1083860))

(assert (= (and b!1083859 ((_ is ValueCellFull!12519) mapDefault!41440)) b!1083861))

(assert (= start!95802 b!1083859))

(declare-fun b_lambda!17125 () Bool)

(assert (=> (not b_lambda!17125) (not b!1083868)))

(declare-fun t!32939 () Bool)

(declare-fun tb!7333 () Bool)

(assert (=> (and start!95802 (= defaultEntry!882 defaultEntry!882) t!32939) tb!7333))

(declare-fun result!15185 () Bool)

(assert (=> tb!7333 (= result!15185 tp_is_empty!26457)))

(assert (=> b!1083868 t!32939))

(declare-fun b_and!35587 () Bool)

(assert (= b_and!35585 (and (=> t!32939 result!15185) b_and!35587)))

(declare-fun m!1001543 () Bool)

(assert (=> b!1083867 m!1001543))

(declare-fun m!1001545 () Bool)

(assert (=> b!1083862 m!1001545))

(declare-fun m!1001547 () Bool)

(assert (=> b!1083857 m!1001547))

(declare-fun m!1001549 () Bool)

(assert (=> b!1083857 m!1001549))

(declare-fun m!1001551 () Bool)

(assert (=> start!95802 m!1001551))

(declare-fun m!1001553 () Bool)

(assert (=> start!95802 m!1001553))

(declare-fun m!1001555 () Bool)

(assert (=> start!95802 m!1001555))

(declare-fun m!1001557 () Bool)

(assert (=> b!1083863 m!1001557))

(declare-fun m!1001559 () Bool)

(assert (=> b!1083865 m!1001559))

(declare-fun m!1001561 () Bool)

(assert (=> b!1083868 m!1001561))

(declare-fun m!1001563 () Bool)

(assert (=> b!1083868 m!1001563))

(declare-fun m!1001565 () Bool)

(assert (=> b!1083868 m!1001565))

(declare-fun m!1001567 () Bool)

(assert (=> b!1083868 m!1001567))

(declare-fun m!1001569 () Bool)

(assert (=> b!1083868 m!1001569))

(declare-fun m!1001571 () Bool)

(assert (=> b!1083868 m!1001571))

(declare-fun m!1001573 () Bool)

(assert (=> b!1083868 m!1001573))

(declare-fun m!1001575 () Bool)

(assert (=> b!1083868 m!1001575))

(declare-fun m!1001577 () Bool)

(assert (=> b!1083868 m!1001577))

(declare-fun m!1001579 () Bool)

(assert (=> b!1083858 m!1001579))

(declare-fun m!1001581 () Bool)

(assert (=> mapNonEmpty!41440 m!1001581))

(check-sat (not b!1083867) (not start!95802) tp_is_empty!26457 (not b!1083865) b_and!35587 (not b_lambda!17125) (not b!1083858) (not b_next!22455) (not b!1083857) (not mapNonEmpty!41440) (not b!1083868) (not b!1083863))
(check-sat b_and!35587 (not b_next!22455))
