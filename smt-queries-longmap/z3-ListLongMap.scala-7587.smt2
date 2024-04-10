; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95844 () Bool)

(assert start!95844)

(declare-fun b_free!22497 () Bool)

(declare-fun b_next!22497 () Bool)

(assert (=> start!95844 (= b_free!22497 (not b_next!22497))))

(declare-fun tp!79340 () Bool)

(declare-fun b_and!35669 () Bool)

(assert (=> start!95844 (= tp!79340 b_and!35669)))

(declare-fun b!1084670 () Bool)

(declare-fun e!619664 () Bool)

(declare-fun e!619663 () Bool)

(declare-fun mapRes!41503 () Bool)

(assert (=> b!1084670 (= e!619664 (and e!619663 mapRes!41503))))

(declare-fun condMapEmpty!41503 () Bool)

(declare-datatypes ((V!40459 0))(
  ( (V!40460 (val!13306 Int)) )
))
(declare-datatypes ((ValueCell!12540 0))(
  ( (ValueCellFull!12540 (v!15927 V!40459)) (EmptyCell!12540) )
))
(declare-datatypes ((array!69935 0))(
  ( (array!69936 (arr!33641 (Array (_ BitVec 32) ValueCell!12540)) (size!34177 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69935)

(declare-fun mapDefault!41503 () ValueCell!12540)

(assert (=> b!1084670 (= condMapEmpty!41503 (= (arr!33641 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12540)) mapDefault!41503)))))

(declare-datatypes ((tuple2!16866 0))(
  ( (tuple2!16867 (_1!8444 (_ BitVec 64)) (_2!8444 V!40459)) )
))
(declare-datatypes ((List!23455 0))(
  ( (Nil!23452) (Cons!23451 (h!24660 tuple2!16866) (t!33010 List!23455)) )
))
(declare-datatypes ((ListLongMap!14835 0))(
  ( (ListLongMap!14836 (toList!7433 List!23455)) )
))
(declare-fun lt!480842 () ListLongMap!14835)

(declare-fun lt!480840 () ListLongMap!14835)

(declare-fun e!619666 () Bool)

(declare-fun b!1084671 () Bool)

(declare-fun lt!480838 () tuple2!16866)

(declare-fun lt!480846 () tuple2!16866)

(declare-fun +!3243 (ListLongMap!14835 tuple2!16866) ListLongMap!14835)

(assert (=> b!1084671 (= e!619666 (= lt!480842 (+!3243 (+!3243 lt!480840 lt!480846) lt!480838)))))

(declare-fun b!1084672 () Bool)

(declare-fun e!619660 () Bool)

(declare-fun e!619667 () Bool)

(assert (=> b!1084672 (= e!619660 e!619667)))

(declare-fun res!723128 () Bool)

(assert (=> b!1084672 (=> (not res!723128) (not e!619667))))

(declare-datatypes ((array!69937 0))(
  ( (array!69938 (arr!33642 (Array (_ BitVec 32) (_ BitVec 64))) (size!34178 (_ BitVec 32))) )
))
(declare-fun lt!480843 () array!69937)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69937 (_ BitVec 32)) Bool)

(assert (=> b!1084672 (= res!723128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480843 mask!1414))))

(declare-fun _keys!1070 () array!69937)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084672 (= lt!480843 (array!69938 (store (arr!33642 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34178 _keys!1070)))))

(declare-fun b!1084673 () Bool)

(declare-fun e!619662 () Bool)

(declare-fun tp_is_empty!26499 () Bool)

(assert (=> b!1084673 (= e!619662 tp_is_empty!26499)))

(declare-fun b!1084675 () Bool)

(declare-fun res!723132 () Bool)

(assert (=> b!1084675 (=> (not res!723132) (not e!619666))))

(declare-fun lt!480847 () ListLongMap!14835)

(declare-fun lt!480844 () ListLongMap!14835)

(assert (=> b!1084675 (= res!723132 (= lt!480847 (+!3243 (+!3243 lt!480844 lt!480846) lt!480838)))))

(declare-fun b!1084676 () Bool)

(declare-fun res!723127 () Bool)

(assert (=> b!1084676 (=> (not res!723127) (not e!619660))))

(assert (=> b!1084676 (= res!723127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084677 () Bool)

(declare-fun e!619665 () Bool)

(assert (=> b!1084677 (= e!619665 true)))

(assert (=> b!1084677 e!619666))

(declare-fun res!723125 () Bool)

(assert (=> b!1084677 (=> (not res!723125) (not e!619666))))

(declare-fun lt!480837 () ListLongMap!14835)

(assert (=> b!1084677 (= res!723125 (= lt!480842 (+!3243 (+!3243 lt!480837 lt!480846) lt!480838)))))

(declare-fun minValue!831 () V!40459)

(assert (=> b!1084677 (= lt!480838 (tuple2!16867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!40459)

(assert (=> b!1084677 (= lt!480846 (tuple2!16867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1084678 () Bool)

(declare-fun res!723130 () Bool)

(assert (=> b!1084678 (=> (not res!723130) (not e!619667))))

(declare-datatypes ((List!23456 0))(
  ( (Nil!23453) (Cons!23452 (h!24661 (_ BitVec 64)) (t!33011 List!23456)) )
))
(declare-fun arrayNoDuplicates!0 (array!69937 (_ BitVec 32) List!23456) Bool)

(assert (=> b!1084678 (= res!723130 (arrayNoDuplicates!0 lt!480843 #b00000000000000000000000000000000 Nil!23453))))

(declare-fun b!1084679 () Bool)

(declare-fun res!723121 () Bool)

(assert (=> b!1084679 (=> (not res!723121) (not e!619660))))

(assert (=> b!1084679 (= res!723121 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23453))))

(declare-fun b!1084680 () Bool)

(declare-fun res!723123 () Bool)

(assert (=> b!1084680 (=> (not res!723123) (not e!619660))))

(assert (=> b!1084680 (= res!723123 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34178 _keys!1070))))))

(declare-fun b!1084681 () Bool)

(declare-fun res!723124 () Bool)

(assert (=> b!1084681 (=> (not res!723124) (not e!619660))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1084681 (= res!723124 (= (select (arr!33642 _keys!1070) i!650) k0!904))))

(declare-fun b!1084682 () Bool)

(assert (=> b!1084682 (= e!619663 tp_is_empty!26499)))

(declare-fun mapIsEmpty!41503 () Bool)

(assert (=> mapIsEmpty!41503 mapRes!41503))

(declare-fun b!1084683 () Bool)

(assert (=> b!1084683 (= e!619667 (not e!619665))))

(declare-fun res!723126 () Bool)

(assert (=> b!1084683 (=> res!723126 e!619665)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084683 (= res!723126 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4220 (array!69937 array!69935 (_ BitVec 32) (_ BitVec 32) V!40459 V!40459 (_ BitVec 32) Int) ListLongMap!14835)

(assert (=> b!1084683 (= lt!480847 (getCurrentListMap!4220 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480839 () array!69935)

(assert (=> b!1084683 (= lt!480842 (getCurrentListMap!4220 lt!480843 lt!480839 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084683 (and (= lt!480837 lt!480840) (= lt!480840 lt!480837))))

(declare-fun -!759 (ListLongMap!14835 (_ BitVec 64)) ListLongMap!14835)

(assert (=> b!1084683 (= lt!480840 (-!759 lt!480844 k0!904))))

(declare-datatypes ((Unit!35684 0))(
  ( (Unit!35685) )
))
(declare-fun lt!480845 () Unit!35684)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!39 (array!69937 array!69935 (_ BitVec 32) (_ BitVec 32) V!40459 V!40459 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35684)

(assert (=> b!1084683 (= lt!480845 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!39 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3980 (array!69937 array!69935 (_ BitVec 32) (_ BitVec 32) V!40459 V!40459 (_ BitVec 32) Int) ListLongMap!14835)

(assert (=> b!1084683 (= lt!480837 (getCurrentListMapNoExtraKeys!3980 lt!480843 lt!480839 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2117 (Int (_ BitVec 64)) V!40459)

(assert (=> b!1084683 (= lt!480839 (array!69936 (store (arr!33641 _values!874) i!650 (ValueCellFull!12540 (dynLambda!2117 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34177 _values!874)))))

(assert (=> b!1084683 (= lt!480844 (getCurrentListMapNoExtraKeys!3980 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084683 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480841 () Unit!35684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69937 (_ BitVec 64) (_ BitVec 32)) Unit!35684)

(assert (=> b!1084683 (= lt!480841 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084674 () Bool)

(declare-fun res!723122 () Bool)

(assert (=> b!1084674 (=> (not res!723122) (not e!619660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084674 (= res!723122 (validKeyInArray!0 k0!904))))

(declare-fun res!723129 () Bool)

(assert (=> start!95844 (=> (not res!723129) (not e!619660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95844 (= res!723129 (validMask!0 mask!1414))))

(assert (=> start!95844 e!619660))

(assert (=> start!95844 tp!79340))

(assert (=> start!95844 true))

(assert (=> start!95844 tp_is_empty!26499))

(declare-fun array_inv!25964 (array!69937) Bool)

(assert (=> start!95844 (array_inv!25964 _keys!1070)))

(declare-fun array_inv!25965 (array!69935) Bool)

(assert (=> start!95844 (and (array_inv!25965 _values!874) e!619664)))

(declare-fun mapNonEmpty!41503 () Bool)

(declare-fun tp!79339 () Bool)

(assert (=> mapNonEmpty!41503 (= mapRes!41503 (and tp!79339 e!619662))))

(declare-fun mapRest!41503 () (Array (_ BitVec 32) ValueCell!12540))

(declare-fun mapValue!41503 () ValueCell!12540)

(declare-fun mapKey!41503 () (_ BitVec 32))

(assert (=> mapNonEmpty!41503 (= (arr!33641 _values!874) (store mapRest!41503 mapKey!41503 mapValue!41503))))

(declare-fun b!1084684 () Bool)

(declare-fun res!723131 () Bool)

(assert (=> b!1084684 (=> (not res!723131) (not e!619660))))

(assert (=> b!1084684 (= res!723131 (and (= (size!34177 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34178 _keys!1070) (size!34177 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95844 res!723129) b!1084684))

(assert (= (and b!1084684 res!723131) b!1084676))

(assert (= (and b!1084676 res!723127) b!1084679))

(assert (= (and b!1084679 res!723121) b!1084680))

(assert (= (and b!1084680 res!723123) b!1084674))

(assert (= (and b!1084674 res!723122) b!1084681))

(assert (= (and b!1084681 res!723124) b!1084672))

(assert (= (and b!1084672 res!723128) b!1084678))

(assert (= (and b!1084678 res!723130) b!1084683))

(assert (= (and b!1084683 (not res!723126)) b!1084677))

(assert (= (and b!1084677 res!723125) b!1084675))

(assert (= (and b!1084675 res!723132) b!1084671))

(assert (= (and b!1084670 condMapEmpty!41503) mapIsEmpty!41503))

(assert (= (and b!1084670 (not condMapEmpty!41503)) mapNonEmpty!41503))

(get-info :version)

(assert (= (and mapNonEmpty!41503 ((_ is ValueCellFull!12540) mapValue!41503)) b!1084673))

(assert (= (and b!1084670 ((_ is ValueCellFull!12540) mapDefault!41503)) b!1084682))

(assert (= start!95844 b!1084670))

(declare-fun b_lambda!17167 () Bool)

(assert (=> (not b_lambda!17167) (not b!1084683)))

(declare-fun t!33009 () Bool)

(declare-fun tb!7375 () Bool)

(assert (=> (and start!95844 (= defaultEntry!882 defaultEntry!882) t!33009) tb!7375))

(declare-fun result!15269 () Bool)

(assert (=> tb!7375 (= result!15269 tp_is_empty!26499)))

(assert (=> b!1084683 t!33009))

(declare-fun b_and!35671 () Bool)

(assert (= b_and!35669 (and (=> t!33009 result!15269) b_and!35671)))

(declare-fun m!1002397 () Bool)

(assert (=> b!1084672 m!1002397))

(declare-fun m!1002399 () Bool)

(assert (=> b!1084672 m!1002399))

(declare-fun m!1002401 () Bool)

(assert (=> b!1084677 m!1002401))

(assert (=> b!1084677 m!1002401))

(declare-fun m!1002403 () Bool)

(assert (=> b!1084677 m!1002403))

(declare-fun m!1002405 () Bool)

(assert (=> b!1084675 m!1002405))

(assert (=> b!1084675 m!1002405))

(declare-fun m!1002407 () Bool)

(assert (=> b!1084675 m!1002407))

(declare-fun m!1002409 () Bool)

(assert (=> b!1084683 m!1002409))

(declare-fun m!1002411 () Bool)

(assert (=> b!1084683 m!1002411))

(declare-fun m!1002413 () Bool)

(assert (=> b!1084683 m!1002413))

(declare-fun m!1002415 () Bool)

(assert (=> b!1084683 m!1002415))

(declare-fun m!1002417 () Bool)

(assert (=> b!1084683 m!1002417))

(declare-fun m!1002419 () Bool)

(assert (=> b!1084683 m!1002419))

(declare-fun m!1002421 () Bool)

(assert (=> b!1084683 m!1002421))

(declare-fun m!1002423 () Bool)

(assert (=> b!1084683 m!1002423))

(declare-fun m!1002425 () Bool)

(assert (=> b!1084683 m!1002425))

(declare-fun m!1002427 () Bool)

(assert (=> b!1084683 m!1002427))

(declare-fun m!1002429 () Bool)

(assert (=> start!95844 m!1002429))

(declare-fun m!1002431 () Bool)

(assert (=> start!95844 m!1002431))

(declare-fun m!1002433 () Bool)

(assert (=> start!95844 m!1002433))

(declare-fun m!1002435 () Bool)

(assert (=> b!1084674 m!1002435))

(declare-fun m!1002437 () Bool)

(assert (=> b!1084681 m!1002437))

(declare-fun m!1002439 () Bool)

(assert (=> b!1084679 m!1002439))

(declare-fun m!1002441 () Bool)

(assert (=> b!1084671 m!1002441))

(assert (=> b!1084671 m!1002441))

(declare-fun m!1002443 () Bool)

(assert (=> b!1084671 m!1002443))

(declare-fun m!1002445 () Bool)

(assert (=> b!1084678 m!1002445))

(declare-fun m!1002447 () Bool)

(assert (=> b!1084676 m!1002447))

(declare-fun m!1002449 () Bool)

(assert (=> mapNonEmpty!41503 m!1002449))

(check-sat (not b_lambda!17167) (not mapNonEmpty!41503) b_and!35671 (not b!1084675) tp_is_empty!26499 (not b!1084672) (not b!1084678) (not b!1084679) (not b!1084671) (not b!1084676) (not start!95844) (not b!1084683) (not b!1084677) (not b!1084674) (not b_next!22497))
(check-sat b_and!35671 (not b_next!22497))
