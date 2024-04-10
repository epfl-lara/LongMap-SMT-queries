; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95814 () Bool)

(assert start!95814)

(declare-fun b_free!22467 () Bool)

(declare-fun b_next!22467 () Bool)

(assert (=> start!95814 (= b_free!22467 (not b_next!22467))))

(declare-fun tp!79249 () Bool)

(declare-fun b_and!35609 () Bool)

(assert (=> start!95814 (= tp!79249 b_and!35609)))

(declare-fun b!1084085 () Bool)

(declare-fun res!722708 () Bool)

(declare-fun e!619384 () Bool)

(assert (=> b!1084085 (=> (not res!722708) (not e!619384))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69879 0))(
  ( (array!69880 (arr!33613 (Array (_ BitVec 32) (_ BitVec 64))) (size!34149 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69879)

(declare-datatypes ((V!40419 0))(
  ( (V!40420 (val!13291 Int)) )
))
(declare-datatypes ((ValueCell!12525 0))(
  ( (ValueCellFull!12525 (v!15912 V!40419)) (EmptyCell!12525) )
))
(declare-datatypes ((array!69881 0))(
  ( (array!69882 (arr!33614 (Array (_ BitVec 32) ValueCell!12525)) (size!34150 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69881)

(assert (=> b!1084085 (= res!722708 (and (= (size!34150 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34149 _keys!1070) (size!34150 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084086 () Bool)

(declare-fun res!722706 () Bool)

(declare-fun e!619381 () Bool)

(assert (=> b!1084086 (=> (not res!722706) (not e!619381))))

(declare-fun lt!480463 () array!69879)

(declare-datatypes ((List!23435 0))(
  ( (Nil!23432) (Cons!23431 (h!24640 (_ BitVec 64)) (t!32960 List!23435)) )
))
(declare-fun arrayNoDuplicates!0 (array!69879 (_ BitVec 32) List!23435) Bool)

(assert (=> b!1084086 (= res!722706 (arrayNoDuplicates!0 lt!480463 #b00000000000000000000000000000000 Nil!23432))))

(declare-fun b!1084087 () Bool)

(assert (=> b!1084087 (= e!619381 (not true))))

(declare-fun minValue!831 () V!40419)

(declare-fun zeroValue!831 () V!40419)

(declare-fun lt!480462 () array!69881)

(declare-datatypes ((tuple2!16848 0))(
  ( (tuple2!16849 (_1!8435 (_ BitVec 64)) (_2!8435 V!40419)) )
))
(declare-datatypes ((List!23436 0))(
  ( (Nil!23433) (Cons!23432 (h!24641 tuple2!16848) (t!32961 List!23436)) )
))
(declare-datatypes ((ListLongMap!14817 0))(
  ( (ListLongMap!14818 (toList!7424 List!23436)) )
))
(declare-fun lt!480467 () ListLongMap!14817)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4212 (array!69879 array!69881 (_ BitVec 32) (_ BitVec 32) V!40419 V!40419 (_ BitVec 32) Int) ListLongMap!14817)

(assert (=> b!1084087 (= lt!480467 (getCurrentListMap!4212 lt!480463 lt!480462 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480466 () ListLongMap!14817)

(declare-fun lt!480465 () ListLongMap!14817)

(assert (=> b!1084087 (and (= lt!480466 lt!480465) (= lt!480465 lt!480466))))

(declare-fun lt!480464 () ListLongMap!14817)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!751 (ListLongMap!14817 (_ BitVec 64)) ListLongMap!14817)

(assert (=> b!1084087 (= lt!480465 (-!751 lt!480464 k0!904))))

(declare-datatypes ((Unit!35668 0))(
  ( (Unit!35669) )
))
(declare-fun lt!480469 () Unit!35668)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!31 (array!69879 array!69881 (_ BitVec 32) (_ BitVec 32) V!40419 V!40419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35668)

(assert (=> b!1084087 (= lt!480469 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!31 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3972 (array!69879 array!69881 (_ BitVec 32) (_ BitVec 32) V!40419 V!40419 (_ BitVec 32) Int) ListLongMap!14817)

(assert (=> b!1084087 (= lt!480466 (getCurrentListMapNoExtraKeys!3972 lt!480463 lt!480462 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2109 (Int (_ BitVec 64)) V!40419)

(assert (=> b!1084087 (= lt!480462 (array!69882 (store (arr!33614 _values!874) i!650 (ValueCellFull!12525 (dynLambda!2109 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34150 _values!874)))))

(assert (=> b!1084087 (= lt!480464 (getCurrentListMapNoExtraKeys!3972 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084087 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480468 () Unit!35668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69879 (_ BitVec 64) (_ BitVec 32)) Unit!35668)

(assert (=> b!1084087 (= lt!480468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084088 () Bool)

(declare-fun res!722702 () Bool)

(assert (=> b!1084088 (=> (not res!722702) (not e!619384))))

(assert (=> b!1084088 (= res!722702 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23432))))

(declare-fun b!1084089 () Bool)

(assert (=> b!1084089 (= e!619384 e!619381)))

(declare-fun res!722709 () Bool)

(assert (=> b!1084089 (=> (not res!722709) (not e!619381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69879 (_ BitVec 32)) Bool)

(assert (=> b!1084089 (= res!722709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480463 mask!1414))))

(assert (=> b!1084089 (= lt!480463 (array!69880 (store (arr!33613 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34149 _keys!1070)))))

(declare-fun b!1084090 () Bool)

(declare-fun e!619382 () Bool)

(declare-fun tp_is_empty!26469 () Bool)

(assert (=> b!1084090 (= e!619382 tp_is_empty!26469)))

(declare-fun mapIsEmpty!41458 () Bool)

(declare-fun mapRes!41458 () Bool)

(assert (=> mapIsEmpty!41458 mapRes!41458))

(declare-fun b!1084091 () Bool)

(declare-fun res!722701 () Bool)

(assert (=> b!1084091 (=> (not res!722701) (not e!619384))))

(assert (=> b!1084091 (= res!722701 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34149 _keys!1070))))))

(declare-fun b!1084092 () Bool)

(declare-fun res!722705 () Bool)

(assert (=> b!1084092 (=> (not res!722705) (not e!619384))))

(assert (=> b!1084092 (= res!722705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084093 () Bool)

(declare-fun e!619385 () Bool)

(assert (=> b!1084093 (= e!619385 tp_is_empty!26469)))

(declare-fun b!1084094 () Bool)

(declare-fun res!722703 () Bool)

(assert (=> b!1084094 (=> (not res!722703) (not e!619384))))

(assert (=> b!1084094 (= res!722703 (= (select (arr!33613 _keys!1070) i!650) k0!904))))

(declare-fun b!1084095 () Bool)

(declare-fun res!722704 () Bool)

(assert (=> b!1084095 (=> (not res!722704) (not e!619384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084095 (= res!722704 (validKeyInArray!0 k0!904))))

(declare-fun res!722707 () Bool)

(assert (=> start!95814 (=> (not res!722707) (not e!619384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95814 (= res!722707 (validMask!0 mask!1414))))

(assert (=> start!95814 e!619384))

(assert (=> start!95814 tp!79249))

(assert (=> start!95814 true))

(assert (=> start!95814 tp_is_empty!26469))

(declare-fun array_inv!25944 (array!69879) Bool)

(assert (=> start!95814 (array_inv!25944 _keys!1070)))

(declare-fun e!619383 () Bool)

(declare-fun array_inv!25945 (array!69881) Bool)

(assert (=> start!95814 (and (array_inv!25945 _values!874) e!619383)))

(declare-fun mapNonEmpty!41458 () Bool)

(declare-fun tp!79250 () Bool)

(assert (=> mapNonEmpty!41458 (= mapRes!41458 (and tp!79250 e!619385))))

(declare-fun mapRest!41458 () (Array (_ BitVec 32) ValueCell!12525))

(declare-fun mapKey!41458 () (_ BitVec 32))

(declare-fun mapValue!41458 () ValueCell!12525)

(assert (=> mapNonEmpty!41458 (= (arr!33614 _values!874) (store mapRest!41458 mapKey!41458 mapValue!41458))))

(declare-fun b!1084096 () Bool)

(assert (=> b!1084096 (= e!619383 (and e!619382 mapRes!41458))))

(declare-fun condMapEmpty!41458 () Bool)

(declare-fun mapDefault!41458 () ValueCell!12525)

(assert (=> b!1084096 (= condMapEmpty!41458 (= (arr!33614 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12525)) mapDefault!41458)))))

(assert (= (and start!95814 res!722707) b!1084085))

(assert (= (and b!1084085 res!722708) b!1084092))

(assert (= (and b!1084092 res!722705) b!1084088))

(assert (= (and b!1084088 res!722702) b!1084091))

(assert (= (and b!1084091 res!722701) b!1084095))

(assert (= (and b!1084095 res!722704) b!1084094))

(assert (= (and b!1084094 res!722703) b!1084089))

(assert (= (and b!1084089 res!722709) b!1084086))

(assert (= (and b!1084086 res!722706) b!1084087))

(assert (= (and b!1084096 condMapEmpty!41458) mapIsEmpty!41458))

(assert (= (and b!1084096 (not condMapEmpty!41458)) mapNonEmpty!41458))

(get-info :version)

(assert (= (and mapNonEmpty!41458 ((_ is ValueCellFull!12525) mapValue!41458)) b!1084093))

(assert (= (and b!1084096 ((_ is ValueCellFull!12525) mapDefault!41458)) b!1084090))

(assert (= start!95814 b!1084096))

(declare-fun b_lambda!17137 () Bool)

(assert (=> (not b_lambda!17137) (not b!1084087)))

(declare-fun t!32959 () Bool)

(declare-fun tb!7345 () Bool)

(assert (=> (and start!95814 (= defaultEntry!882 defaultEntry!882) t!32959) tb!7345))

(declare-fun result!15209 () Bool)

(assert (=> tb!7345 (= result!15209 tp_is_empty!26469)))

(assert (=> b!1084087 t!32959))

(declare-fun b_and!35611 () Bool)

(assert (= b_and!35609 (and (=> t!32959 result!15209) b_and!35611)))

(declare-fun m!1001783 () Bool)

(assert (=> b!1084087 m!1001783))

(declare-fun m!1001785 () Bool)

(assert (=> b!1084087 m!1001785))

(declare-fun m!1001787 () Bool)

(assert (=> b!1084087 m!1001787))

(declare-fun m!1001789 () Bool)

(assert (=> b!1084087 m!1001789))

(declare-fun m!1001791 () Bool)

(assert (=> b!1084087 m!1001791))

(declare-fun m!1001793 () Bool)

(assert (=> b!1084087 m!1001793))

(declare-fun m!1001795 () Bool)

(assert (=> b!1084087 m!1001795))

(declare-fun m!1001797 () Bool)

(assert (=> b!1084087 m!1001797))

(declare-fun m!1001799 () Bool)

(assert (=> b!1084087 m!1001799))

(declare-fun m!1001801 () Bool)

(assert (=> b!1084089 m!1001801))

(declare-fun m!1001803 () Bool)

(assert (=> b!1084089 m!1001803))

(declare-fun m!1001805 () Bool)

(assert (=> b!1084088 m!1001805))

(declare-fun m!1001807 () Bool)

(assert (=> mapNonEmpty!41458 m!1001807))

(declare-fun m!1001809 () Bool)

(assert (=> b!1084086 m!1001809))

(declare-fun m!1001811 () Bool)

(assert (=> start!95814 m!1001811))

(declare-fun m!1001813 () Bool)

(assert (=> start!95814 m!1001813))

(declare-fun m!1001815 () Bool)

(assert (=> start!95814 m!1001815))

(declare-fun m!1001817 () Bool)

(assert (=> b!1084092 m!1001817))

(declare-fun m!1001819 () Bool)

(assert (=> b!1084094 m!1001819))

(declare-fun m!1001821 () Bool)

(assert (=> b!1084095 m!1001821))

(check-sat (not b!1084086) tp_is_empty!26469 (not mapNonEmpty!41458) (not b!1084087) (not start!95814) (not b_next!22467) (not b!1084089) b_and!35611 (not b!1084088) (not b!1084095) (not b!1084092) (not b_lambda!17137))
(check-sat b_and!35611 (not b_next!22467))
