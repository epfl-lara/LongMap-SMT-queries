; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96172 () Bool)

(assert start!96172)

(declare-fun b_free!22831 () Bool)

(declare-fun b_next!22831 () Bool)

(assert (=> start!96172 (= b_free!22831 (not b_next!22831))))

(declare-fun tp!80342 () Bool)

(declare-fun b_and!36311 () Bool)

(assert (=> start!96172 (= tp!80342 b_and!36311)))

(declare-fun mapIsEmpty!42004 () Bool)

(declare-fun mapRes!42004 () Bool)

(assert (=> mapIsEmpty!42004 mapRes!42004))

(declare-fun b!1091878 () Bool)

(declare-fun res!728580 () Bool)

(declare-fun e!623570 () Bool)

(assert (=> b!1091878 (=> (not res!728580) (not e!623570))))

(declare-datatypes ((array!70500 0))(
  ( (array!70501 (arr!33924 (Array (_ BitVec 32) (_ BitVec 64))) (size!34462 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70500)

(declare-datatypes ((List!23754 0))(
  ( (Nil!23751) (Cons!23750 (h!24959 (_ BitVec 64)) (t!33634 List!23754)) )
))
(declare-fun arrayNoDuplicates!0 (array!70500 (_ BitVec 32) List!23754) Bool)

(assert (=> b!1091878 (= res!728580 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23751))))

(declare-fun b!1091879 () Bool)

(declare-fun res!728578 () Bool)

(assert (=> b!1091879 (=> (not res!728578) (not e!623570))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091879 (= res!728578 (= (select (arr!33924 _keys!1070) i!650) k0!904))))

(declare-fun b!1091880 () Bool)

(declare-fun res!728585 () Bool)

(assert (=> b!1091880 (=> (not res!728585) (not e!623570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091880 (= res!728585 (validKeyInArray!0 k0!904))))

(declare-fun b!1091881 () Bool)

(declare-fun e!623573 () Bool)

(declare-fun tp_is_empty!26833 () Bool)

(assert (=> b!1091881 (= e!623573 tp_is_empty!26833)))

(declare-fun b!1091882 () Bool)

(declare-fun res!728581 () Bool)

(declare-fun e!623569 () Bool)

(assert (=> b!1091882 (=> (not res!728581) (not e!623569))))

(declare-fun lt!487755 () array!70500)

(assert (=> b!1091882 (= res!728581 (arrayNoDuplicates!0 lt!487755 #b00000000000000000000000000000000 Nil!23751))))

(declare-fun mapNonEmpty!42004 () Bool)

(declare-fun tp!80341 () Bool)

(assert (=> mapNonEmpty!42004 (= mapRes!42004 (and tp!80341 e!623573))))

(declare-datatypes ((V!40905 0))(
  ( (V!40906 (val!13473 Int)) )
))
(declare-datatypes ((ValueCell!12707 0))(
  ( (ValueCellFull!12707 (v!16093 V!40905)) (EmptyCell!12707) )
))
(declare-datatypes ((array!70502 0))(
  ( (array!70503 (arr!33925 (Array (_ BitVec 32) ValueCell!12707)) (size!34463 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70502)

(declare-fun mapRest!42004 () (Array (_ BitVec 32) ValueCell!12707))

(declare-fun mapKey!42004 () (_ BitVec 32))

(declare-fun mapValue!42004 () ValueCell!12707)

(assert (=> mapNonEmpty!42004 (= (arr!33925 _values!874) (store mapRest!42004 mapKey!42004 mapValue!42004))))

(declare-fun b!1091883 () Bool)

(declare-fun e!623567 () Bool)

(assert (=> b!1091883 (= e!623569 (not e!623567))))

(declare-fun res!728579 () Bool)

(assert (=> b!1091883 (=> res!728579 e!623567)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091883 (= res!728579 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40905)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17192 0))(
  ( (tuple2!17193 (_1!8607 (_ BitVec 64)) (_2!8607 V!40905)) )
))
(declare-datatypes ((List!23755 0))(
  ( (Nil!23752) (Cons!23751 (h!24960 tuple2!17192) (t!33635 List!23755)) )
))
(declare-datatypes ((ListLongMap!15161 0))(
  ( (ListLongMap!15162 (toList!7596 List!23755)) )
))
(declare-fun lt!487745 () ListLongMap!15161)

(declare-fun zeroValue!831 () V!40905)

(declare-fun getCurrentListMap!4260 (array!70500 array!70502 (_ BitVec 32) (_ BitVec 32) V!40905 V!40905 (_ BitVec 32) Int) ListLongMap!15161)

(assert (=> b!1091883 (= lt!487745 (getCurrentListMap!4260 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487748 () ListLongMap!15161)

(declare-fun lt!487746 () array!70502)

(assert (=> b!1091883 (= lt!487748 (getCurrentListMap!4260 lt!487755 lt!487746 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487747 () ListLongMap!15161)

(declare-fun lt!487751 () ListLongMap!15161)

(assert (=> b!1091883 (and (= lt!487747 lt!487751) (= lt!487751 lt!487747))))

(declare-fun lt!487752 () ListLongMap!15161)

(declare-fun -!868 (ListLongMap!15161 (_ BitVec 64)) ListLongMap!15161)

(assert (=> b!1091883 (= lt!487751 (-!868 lt!487752 k0!904))))

(declare-datatypes ((Unit!35771 0))(
  ( (Unit!35772) )
))
(declare-fun lt!487753 () Unit!35771)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!144 (array!70500 array!70502 (_ BitVec 32) (_ BitVec 32) V!40905 V!40905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35771)

(assert (=> b!1091883 (= lt!487753 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!144 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4130 (array!70500 array!70502 (_ BitVec 32) (_ BitVec 32) V!40905 V!40905 (_ BitVec 32) Int) ListLongMap!15161)

(assert (=> b!1091883 (= lt!487747 (getCurrentListMapNoExtraKeys!4130 lt!487755 lt!487746 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2201 (Int (_ BitVec 64)) V!40905)

(assert (=> b!1091883 (= lt!487746 (array!70503 (store (arr!33925 _values!874) i!650 (ValueCellFull!12707 (dynLambda!2201 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34463 _values!874)))))

(assert (=> b!1091883 (= lt!487752 (getCurrentListMapNoExtraKeys!4130 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091883 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487754 () Unit!35771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70500 (_ BitVec 64) (_ BitVec 32)) Unit!35771)

(assert (=> b!1091883 (= lt!487754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091884 () Bool)

(declare-fun res!728576 () Bool)

(assert (=> b!1091884 (=> (not res!728576) (not e!623570))))

(assert (=> b!1091884 (= res!728576 (and (= (size!34463 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34462 _keys!1070) (size!34463 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091886 () Bool)

(declare-fun res!728586 () Bool)

(assert (=> b!1091886 (=> (not res!728586) (not e!623570))))

(assert (=> b!1091886 (= res!728586 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34462 _keys!1070))))))

(declare-fun b!1091887 () Bool)

(declare-fun e!623572 () Bool)

(assert (=> b!1091887 (= e!623572 true)))

(declare-fun lt!487749 () ListLongMap!15161)

(declare-fun lt!487757 () ListLongMap!15161)

(assert (=> b!1091887 (= (-!868 lt!487749 k0!904) lt!487757)))

(declare-fun lt!487756 () Unit!35771)

(declare-fun addRemoveCommutativeForDiffKeys!111 (ListLongMap!15161 (_ BitVec 64) V!40905 (_ BitVec 64)) Unit!35771)

(assert (=> b!1091887 (= lt!487756 (addRemoveCommutativeForDiffKeys!111 lt!487752 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091888 () Bool)

(declare-fun e!623571 () Bool)

(declare-fun e!623566 () Bool)

(assert (=> b!1091888 (= e!623571 (and e!623566 mapRes!42004))))

(declare-fun condMapEmpty!42004 () Bool)

(declare-fun mapDefault!42004 () ValueCell!12707)

(assert (=> b!1091888 (= condMapEmpty!42004 (= (arr!33925 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12707)) mapDefault!42004)))))

(declare-fun b!1091889 () Bool)

(assert (=> b!1091889 (= e!623570 e!623569)))

(declare-fun res!728577 () Bool)

(assert (=> b!1091889 (=> (not res!728577) (not e!623569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70500 (_ BitVec 32)) Bool)

(assert (=> b!1091889 (= res!728577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487755 mask!1414))))

(assert (=> b!1091889 (= lt!487755 (array!70501 (store (arr!33924 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34462 _keys!1070)))))

(declare-fun b!1091885 () Bool)

(assert (=> b!1091885 (= e!623567 e!623572)))

(declare-fun res!728582 () Bool)

(assert (=> b!1091885 (=> res!728582 e!623572)))

(assert (=> b!1091885 (= res!728582 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091885 (= lt!487745 lt!487749)))

(declare-fun lt!487750 () tuple2!17192)

(declare-fun +!3383 (ListLongMap!15161 tuple2!17192) ListLongMap!15161)

(assert (=> b!1091885 (= lt!487749 (+!3383 lt!487752 lt!487750))))

(assert (=> b!1091885 (= lt!487748 lt!487757)))

(assert (=> b!1091885 (= lt!487757 (+!3383 lt!487751 lt!487750))))

(assert (=> b!1091885 (= lt!487748 (+!3383 lt!487747 lt!487750))))

(assert (=> b!1091885 (= lt!487750 (tuple2!17193 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun res!728583 () Bool)

(assert (=> start!96172 (=> (not res!728583) (not e!623570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96172 (= res!728583 (validMask!0 mask!1414))))

(assert (=> start!96172 e!623570))

(assert (=> start!96172 tp!80342))

(assert (=> start!96172 true))

(assert (=> start!96172 tp_is_empty!26833))

(declare-fun array_inv!26192 (array!70500) Bool)

(assert (=> start!96172 (array_inv!26192 _keys!1070)))

(declare-fun array_inv!26193 (array!70502) Bool)

(assert (=> start!96172 (and (array_inv!26193 _values!874) e!623571)))

(declare-fun b!1091890 () Bool)

(declare-fun res!728584 () Bool)

(assert (=> b!1091890 (=> (not res!728584) (not e!623570))))

(assert (=> b!1091890 (= res!728584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091891 () Bool)

(assert (=> b!1091891 (= e!623566 tp_is_empty!26833)))

(assert (= (and start!96172 res!728583) b!1091884))

(assert (= (and b!1091884 res!728576) b!1091890))

(assert (= (and b!1091890 res!728584) b!1091878))

(assert (= (and b!1091878 res!728580) b!1091886))

(assert (= (and b!1091886 res!728586) b!1091880))

(assert (= (and b!1091880 res!728585) b!1091879))

(assert (= (and b!1091879 res!728578) b!1091889))

(assert (= (and b!1091889 res!728577) b!1091882))

(assert (= (and b!1091882 res!728581) b!1091883))

(assert (= (and b!1091883 (not res!728579)) b!1091885))

(assert (= (and b!1091885 (not res!728582)) b!1091887))

(assert (= (and b!1091888 condMapEmpty!42004) mapIsEmpty!42004))

(assert (= (and b!1091888 (not condMapEmpty!42004)) mapNonEmpty!42004))

(get-info :version)

(assert (= (and mapNonEmpty!42004 ((_ is ValueCellFull!12707) mapValue!42004)) b!1091881))

(assert (= (and b!1091888 ((_ is ValueCellFull!12707) mapDefault!42004)) b!1091891))

(assert (= start!96172 b!1091888))

(declare-fun b_lambda!17479 () Bool)

(assert (=> (not b_lambda!17479) (not b!1091883)))

(declare-fun t!33633 () Bool)

(declare-fun tb!7701 () Bool)

(assert (=> (and start!96172 (= defaultEntry!882 defaultEntry!882) t!33633) tb!7701))

(declare-fun result!15929 () Bool)

(assert (=> tb!7701 (= result!15929 tp_is_empty!26833)))

(assert (=> b!1091883 t!33633))

(declare-fun b_and!36313 () Bool)

(assert (= b_and!36311 (and (=> t!33633 result!15929) b_and!36313)))

(declare-fun m!1011101 () Bool)

(assert (=> b!1091878 m!1011101))

(declare-fun m!1011103 () Bool)

(assert (=> b!1091882 m!1011103))

(declare-fun m!1011105 () Bool)

(assert (=> b!1091887 m!1011105))

(declare-fun m!1011107 () Bool)

(assert (=> b!1091887 m!1011107))

(declare-fun m!1011109 () Bool)

(assert (=> b!1091889 m!1011109))

(declare-fun m!1011111 () Bool)

(assert (=> b!1091889 m!1011111))

(declare-fun m!1011113 () Bool)

(assert (=> mapNonEmpty!42004 m!1011113))

(declare-fun m!1011115 () Bool)

(assert (=> b!1091885 m!1011115))

(declare-fun m!1011117 () Bool)

(assert (=> b!1091885 m!1011117))

(declare-fun m!1011119 () Bool)

(assert (=> b!1091885 m!1011119))

(declare-fun m!1011121 () Bool)

(assert (=> b!1091880 m!1011121))

(declare-fun m!1011123 () Bool)

(assert (=> b!1091890 m!1011123))

(declare-fun m!1011125 () Bool)

(assert (=> start!96172 m!1011125))

(declare-fun m!1011127 () Bool)

(assert (=> start!96172 m!1011127))

(declare-fun m!1011129 () Bool)

(assert (=> start!96172 m!1011129))

(declare-fun m!1011131 () Bool)

(assert (=> b!1091883 m!1011131))

(declare-fun m!1011133 () Bool)

(assert (=> b!1091883 m!1011133))

(declare-fun m!1011135 () Bool)

(assert (=> b!1091883 m!1011135))

(declare-fun m!1011137 () Bool)

(assert (=> b!1091883 m!1011137))

(declare-fun m!1011139 () Bool)

(assert (=> b!1091883 m!1011139))

(declare-fun m!1011141 () Bool)

(assert (=> b!1091883 m!1011141))

(declare-fun m!1011143 () Bool)

(assert (=> b!1091883 m!1011143))

(declare-fun m!1011145 () Bool)

(assert (=> b!1091883 m!1011145))

(declare-fun m!1011147 () Bool)

(assert (=> b!1091883 m!1011147))

(declare-fun m!1011149 () Bool)

(assert (=> b!1091883 m!1011149))

(declare-fun m!1011151 () Bool)

(assert (=> b!1091879 m!1011151))

(check-sat (not mapNonEmpty!42004) (not b!1091889) (not b!1091887) tp_is_empty!26833 (not b_next!22831) (not b!1091885) (not b_lambda!17479) b_and!36313 (not b!1091890) (not b!1091882) (not b!1091880) (not start!96172) (not b!1091878) (not b!1091883))
(check-sat b_and!36313 (not b_next!22831))
