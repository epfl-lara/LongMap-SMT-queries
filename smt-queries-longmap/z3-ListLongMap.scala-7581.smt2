; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95800 () Bool)

(assert start!95800)

(declare-fun b_free!22459 () Bool)

(declare-fun b_next!22459 () Bool)

(assert (=> start!95800 (= b_free!22459 (not b_next!22459))))

(declare-fun tp!79225 () Bool)

(declare-fun b_and!35567 () Bool)

(assert (=> start!95800 (= tp!79225 b_and!35567)))

(declare-fun b!1083780 () Bool)

(declare-fun res!722524 () Bool)

(declare-fun e!619218 () Bool)

(assert (=> b!1083780 (=> (not res!722524) (not e!619218))))

(declare-datatypes ((array!69790 0))(
  ( (array!69791 (arr!33569 (Array (_ BitVec 32) (_ BitVec 64))) (size!34107 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69790)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1083780 (= res!722524 (= (select (arr!33569 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41446 () Bool)

(declare-fun mapRes!41446 () Bool)

(assert (=> mapIsEmpty!41446 mapRes!41446))

(declare-fun b!1083781 () Bool)

(declare-fun res!722526 () Bool)

(assert (=> b!1083781 (=> (not res!722526) (not e!619218))))

(assert (=> b!1083781 (= res!722526 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34107 _keys!1070))))))

(declare-fun b!1083782 () Bool)

(declare-fun e!619217 () Bool)

(assert (=> b!1083782 (= e!619217 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40409 0))(
  ( (V!40410 (val!13287 Int)) )
))
(declare-fun minValue!831 () V!40409)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12521 0))(
  ( (ValueCellFull!12521 (v!15907 V!40409)) (EmptyCell!12521) )
))
(declare-datatypes ((array!69792 0))(
  ( (array!69793 (arr!33570 (Array (_ BitVec 32) ValueCell!12521)) (size!34108 (_ BitVec 32))) )
))
(declare-fun lt!480169 () array!69792)

(declare-datatypes ((tuple2!16902 0))(
  ( (tuple2!16903 (_1!8462 (_ BitVec 64)) (_2!8462 V!40409)) )
))
(declare-datatypes ((List!23471 0))(
  ( (Nil!23468) (Cons!23467 (h!24676 tuple2!16902) (t!32979 List!23471)) )
))
(declare-datatypes ((ListLongMap!14871 0))(
  ( (ListLongMap!14872 (toList!7451 List!23471)) )
))
(declare-fun lt!480170 () ListLongMap!14871)

(declare-fun lt!480171 () array!69790)

(declare-fun zeroValue!831 () V!40409)

(declare-fun getCurrentListMap!4144 (array!69790 array!69792 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) Int) ListLongMap!14871)

(assert (=> b!1083782 (= lt!480170 (getCurrentListMap!4144 lt!480171 lt!480169 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480168 () ListLongMap!14871)

(declare-fun lt!480166 () ListLongMap!14871)

(assert (=> b!1083782 (and (= lt!480168 lt!480166) (= lt!480166 lt!480168))))

(declare-fun lt!480172 () ListLongMap!14871)

(declare-fun -!730 (ListLongMap!14871 (_ BitVec 64)) ListLongMap!14871)

(assert (=> b!1083782 (= lt!480166 (-!730 lt!480172 k0!904))))

(declare-datatypes ((Unit!35495 0))(
  ( (Unit!35496) )
))
(declare-fun lt!480167 () Unit!35495)

(declare-fun _values!874 () array!69792)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!28 (array!69790 array!69792 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35495)

(assert (=> b!1083782 (= lt!480167 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!28 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4014 (array!69790 array!69792 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) Int) ListLongMap!14871)

(assert (=> b!1083782 (= lt!480168 (getCurrentListMapNoExtraKeys!4014 lt!480171 lt!480169 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2085 (Int (_ BitVec 64)) V!40409)

(assert (=> b!1083782 (= lt!480169 (array!69793 (store (arr!33570 _values!874) i!650 (ValueCellFull!12521 (dynLambda!2085 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34108 _values!874)))))

(assert (=> b!1083782 (= lt!480172 (getCurrentListMapNoExtraKeys!4014 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083782 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480173 () Unit!35495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69790 (_ BitVec 64) (_ BitVec 32)) Unit!35495)

(assert (=> b!1083782 (= lt!480173 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!722528 () Bool)

(assert (=> start!95800 (=> (not res!722528) (not e!619218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95800 (= res!722528 (validMask!0 mask!1414))))

(assert (=> start!95800 e!619218))

(assert (=> start!95800 tp!79225))

(assert (=> start!95800 true))

(declare-fun tp_is_empty!26461 () Bool)

(assert (=> start!95800 tp_is_empty!26461))

(declare-fun array_inv!25950 (array!69790) Bool)

(assert (=> start!95800 (array_inv!25950 _keys!1070)))

(declare-fun e!619216 () Bool)

(declare-fun array_inv!25951 (array!69792) Bool)

(assert (=> start!95800 (and (array_inv!25951 _values!874) e!619216)))

(declare-fun b!1083783 () Bool)

(declare-fun res!722529 () Bool)

(assert (=> b!1083783 (=> (not res!722529) (not e!619218))))

(declare-datatypes ((List!23472 0))(
  ( (Nil!23469) (Cons!23468 (h!24677 (_ BitVec 64)) (t!32980 List!23472)) )
))
(declare-fun arrayNoDuplicates!0 (array!69790 (_ BitVec 32) List!23472) Bool)

(assert (=> b!1083783 (= res!722529 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23469))))

(declare-fun b!1083784 () Bool)

(declare-fun e!619215 () Bool)

(assert (=> b!1083784 (= e!619216 (and e!619215 mapRes!41446))))

(declare-fun condMapEmpty!41446 () Bool)

(declare-fun mapDefault!41446 () ValueCell!12521)

(assert (=> b!1083784 (= condMapEmpty!41446 (= (arr!33570 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12521)) mapDefault!41446)))))

(declare-fun mapNonEmpty!41446 () Bool)

(declare-fun tp!79226 () Bool)

(declare-fun e!619219 () Bool)

(assert (=> mapNonEmpty!41446 (= mapRes!41446 (and tp!79226 e!619219))))

(declare-fun mapKey!41446 () (_ BitVec 32))

(declare-fun mapRest!41446 () (Array (_ BitVec 32) ValueCell!12521))

(declare-fun mapValue!41446 () ValueCell!12521)

(assert (=> mapNonEmpty!41446 (= (arr!33570 _values!874) (store mapRest!41446 mapKey!41446 mapValue!41446))))

(declare-fun b!1083785 () Bool)

(assert (=> b!1083785 (= e!619215 tp_is_empty!26461)))

(declare-fun b!1083786 () Bool)

(declare-fun res!722532 () Bool)

(assert (=> b!1083786 (=> (not res!722532) (not e!619218))))

(assert (=> b!1083786 (= res!722532 (and (= (size!34108 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34107 _keys!1070) (size!34108 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083787 () Bool)

(assert (=> b!1083787 (= e!619218 e!619217)))

(declare-fun res!722525 () Bool)

(assert (=> b!1083787 (=> (not res!722525) (not e!619217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69790 (_ BitVec 32)) Bool)

(assert (=> b!1083787 (= res!722525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480171 mask!1414))))

(assert (=> b!1083787 (= lt!480171 (array!69791 (store (arr!33569 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34107 _keys!1070)))))

(declare-fun b!1083788 () Bool)

(declare-fun res!722530 () Bool)

(assert (=> b!1083788 (=> (not res!722530) (not e!619217))))

(assert (=> b!1083788 (= res!722530 (arrayNoDuplicates!0 lt!480171 #b00000000000000000000000000000000 Nil!23469))))

(declare-fun b!1083789 () Bool)

(assert (=> b!1083789 (= e!619219 tp_is_empty!26461)))

(declare-fun b!1083790 () Bool)

(declare-fun res!722527 () Bool)

(assert (=> b!1083790 (=> (not res!722527) (not e!619218))))

(assert (=> b!1083790 (= res!722527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083791 () Bool)

(declare-fun res!722531 () Bool)

(assert (=> b!1083791 (=> (not res!722531) (not e!619218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083791 (= res!722531 (validKeyInArray!0 k0!904))))

(assert (= (and start!95800 res!722528) b!1083786))

(assert (= (and b!1083786 res!722532) b!1083790))

(assert (= (and b!1083790 res!722527) b!1083783))

(assert (= (and b!1083783 res!722529) b!1083781))

(assert (= (and b!1083781 res!722526) b!1083791))

(assert (= (and b!1083791 res!722531) b!1083780))

(assert (= (and b!1083780 res!722524) b!1083787))

(assert (= (and b!1083787 res!722525) b!1083788))

(assert (= (and b!1083788 res!722530) b!1083782))

(assert (= (and b!1083784 condMapEmpty!41446) mapIsEmpty!41446))

(assert (= (and b!1083784 (not condMapEmpty!41446)) mapNonEmpty!41446))

(get-info :version)

(assert (= (and mapNonEmpty!41446 ((_ is ValueCellFull!12521) mapValue!41446)) b!1083789))

(assert (= (and b!1083784 ((_ is ValueCellFull!12521) mapDefault!41446)) b!1083785))

(assert (= start!95800 b!1083784))

(declare-fun b_lambda!17107 () Bool)

(assert (=> (not b_lambda!17107) (not b!1083782)))

(declare-fun t!32978 () Bool)

(declare-fun tb!7329 () Bool)

(assert (=> (and start!95800 (= defaultEntry!882 defaultEntry!882) t!32978) tb!7329))

(declare-fun result!15185 () Bool)

(assert (=> tb!7329 (= result!15185 tp_is_empty!26461)))

(assert (=> b!1083782 t!32978))

(declare-fun b_and!35569 () Bool)

(assert (= b_and!35567 (and (=> t!32978 result!15185) b_and!35569)))

(declare-fun m!1000997 () Bool)

(assert (=> b!1083791 m!1000997))

(declare-fun m!1000999 () Bool)

(assert (=> b!1083790 m!1000999))

(declare-fun m!1001001 () Bool)

(assert (=> start!95800 m!1001001))

(declare-fun m!1001003 () Bool)

(assert (=> start!95800 m!1001003))

(declare-fun m!1001005 () Bool)

(assert (=> start!95800 m!1001005))

(declare-fun m!1001007 () Bool)

(assert (=> b!1083788 m!1001007))

(declare-fun m!1001009 () Bool)

(assert (=> mapNonEmpty!41446 m!1001009))

(declare-fun m!1001011 () Bool)

(assert (=> b!1083783 m!1001011))

(declare-fun m!1001013 () Bool)

(assert (=> b!1083787 m!1001013))

(declare-fun m!1001015 () Bool)

(assert (=> b!1083787 m!1001015))

(declare-fun m!1001017 () Bool)

(assert (=> b!1083780 m!1001017))

(declare-fun m!1001019 () Bool)

(assert (=> b!1083782 m!1001019))

(declare-fun m!1001021 () Bool)

(assert (=> b!1083782 m!1001021))

(declare-fun m!1001023 () Bool)

(assert (=> b!1083782 m!1001023))

(declare-fun m!1001025 () Bool)

(assert (=> b!1083782 m!1001025))

(declare-fun m!1001027 () Bool)

(assert (=> b!1083782 m!1001027))

(declare-fun m!1001029 () Bool)

(assert (=> b!1083782 m!1001029))

(declare-fun m!1001031 () Bool)

(assert (=> b!1083782 m!1001031))

(declare-fun m!1001033 () Bool)

(assert (=> b!1083782 m!1001033))

(declare-fun m!1001035 () Bool)

(assert (=> b!1083782 m!1001035))

(check-sat (not b!1083782) b_and!35569 (not b!1083790) (not b!1083788) tp_is_empty!26461 (not mapNonEmpty!41446) (not b_next!22459) (not b_lambda!17107) (not b!1083791) (not b!1083783) (not b!1083787) (not start!95800))
(check-sat b_and!35569 (not b_next!22459))
