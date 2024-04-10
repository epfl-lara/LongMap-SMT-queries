; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95868 () Bool)

(assert start!95868)

(declare-fun b_free!22521 () Bool)

(declare-fun b_next!22521 () Bool)

(assert (=> start!95868 (= b_free!22521 (not b_next!22521))))

(declare-fun tp!79411 () Bool)

(declare-fun b_and!35717 () Bool)

(assert (=> start!95868 (= tp!79411 b_and!35717)))

(declare-fun b!1085193 () Bool)

(declare-fun res!723522 () Bool)

(declare-fun e!619940 () Bool)

(assert (=> b!1085193 (=> (not res!723522) (not e!619940))))

(declare-datatypes ((array!69981 0))(
  ( (array!69982 (arr!33664 (Array (_ BitVec 32) (_ BitVec 64))) (size!34200 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69981)

(declare-datatypes ((List!23474 0))(
  ( (Nil!23471) (Cons!23470 (h!24679 (_ BitVec 64)) (t!33053 List!23474)) )
))
(declare-fun arrayNoDuplicates!0 (array!69981 (_ BitVec 32) List!23474) Bool)

(assert (=> b!1085193 (= res!723522 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23471))))

(declare-fun b!1085194 () Bool)

(declare-fun res!723514 () Bool)

(assert (=> b!1085194 (=> (not res!723514) (not e!619940))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085194 (= res!723514 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41539 () Bool)

(declare-fun mapRes!41539 () Bool)

(declare-fun tp!79412 () Bool)

(declare-fun e!619943 () Bool)

(assert (=> mapNonEmpty!41539 (= mapRes!41539 (and tp!79412 e!619943))))

(declare-datatypes ((V!40491 0))(
  ( (V!40492 (val!13318 Int)) )
))
(declare-datatypes ((ValueCell!12552 0))(
  ( (ValueCellFull!12552 (v!15939 V!40491)) (EmptyCell!12552) )
))
(declare-datatypes ((array!69983 0))(
  ( (array!69984 (arr!33665 (Array (_ BitVec 32) ValueCell!12552)) (size!34201 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69983)

(declare-fun mapKey!41539 () (_ BitVec 32))

(declare-fun mapValue!41539 () ValueCell!12552)

(declare-fun mapRest!41539 () (Array (_ BitVec 32) ValueCell!12552))

(assert (=> mapNonEmpty!41539 (= (arr!33665 _values!874) (store mapRest!41539 mapKey!41539 mapValue!41539))))

(declare-fun b!1085195 () Bool)

(declare-fun e!619945 () Bool)

(declare-fun e!619941 () Bool)

(assert (=> b!1085195 (= e!619945 e!619941)))

(declare-fun res!723518 () Bool)

(assert (=> b!1085195 (=> res!723518 e!619941)))

(assert (=> b!1085195 (= res!723518 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16886 0))(
  ( (tuple2!16887 (_1!8454 (_ BitVec 64)) (_2!8454 V!40491)) )
))
(declare-datatypes ((List!23475 0))(
  ( (Nil!23472) (Cons!23471 (h!24680 tuple2!16886) (t!33054 List!23475)) )
))
(declare-datatypes ((ListLongMap!14855 0))(
  ( (ListLongMap!14856 (toList!7443 List!23475)) )
))
(declare-fun lt!481413 () ListLongMap!14855)

(declare-fun lt!481409 () ListLongMap!14855)

(assert (=> b!1085195 (= lt!481413 lt!481409)))

(declare-fun lt!481406 () ListLongMap!14855)

(declare-fun -!769 (ListLongMap!14855 (_ BitVec 64)) ListLongMap!14855)

(assert (=> b!1085195 (= lt!481413 (-!769 lt!481406 k0!904))))

(declare-datatypes ((Unit!35704 0))(
  ( (Unit!35705) )
))
(declare-fun lt!481398 () Unit!35704)

(declare-fun lt!481411 () ListLongMap!14855)

(declare-fun zeroValue!831 () V!40491)

(declare-fun addRemoveCommutativeForDiffKeys!8 (ListLongMap!14855 (_ BitVec 64) V!40491 (_ BitVec 64)) Unit!35704)

(assert (=> b!1085195 (= lt!481398 (addRemoveCommutativeForDiffKeys!8 lt!481411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481405 () ListLongMap!14855)

(declare-fun lt!481414 () tuple2!16886)

(declare-fun +!3252 (ListLongMap!14855 tuple2!16886) ListLongMap!14855)

(assert (=> b!1085195 (= lt!481405 (+!3252 lt!481409 lt!481414))))

(declare-fun lt!481400 () ListLongMap!14855)

(declare-fun lt!481401 () tuple2!16886)

(assert (=> b!1085195 (= lt!481409 (+!3252 lt!481400 lt!481401))))

(declare-fun lt!481407 () ListLongMap!14855)

(declare-fun lt!481404 () ListLongMap!14855)

(assert (=> b!1085195 (= lt!481407 lt!481404)))

(assert (=> b!1085195 (= lt!481404 (+!3252 lt!481406 lt!481414))))

(assert (=> b!1085195 (= lt!481406 (+!3252 lt!481411 lt!481401))))

(declare-fun lt!481410 () ListLongMap!14855)

(assert (=> b!1085195 (= lt!481405 (+!3252 (+!3252 lt!481410 lt!481401) lt!481414))))

(declare-fun minValue!831 () V!40491)

(assert (=> b!1085195 (= lt!481414 (tuple2!16887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085195 (= lt!481401 (tuple2!16887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085196 () Bool)

(declare-fun res!723513 () Bool)

(assert (=> b!1085196 (=> (not res!723513) (not e!619940))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085196 (= res!723513 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34200 _keys!1070))))))

(declare-fun mapIsEmpty!41539 () Bool)

(assert (=> mapIsEmpty!41539 mapRes!41539))

(declare-fun res!723517 () Bool)

(assert (=> start!95868 (=> (not res!723517) (not e!619940))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95868 (= res!723517 (validMask!0 mask!1414))))

(assert (=> start!95868 e!619940))

(assert (=> start!95868 tp!79411))

(assert (=> start!95868 true))

(declare-fun tp_is_empty!26523 () Bool)

(assert (=> start!95868 tp_is_empty!26523))

(declare-fun array_inv!25980 (array!69981) Bool)

(assert (=> start!95868 (array_inv!25980 _keys!1070)))

(declare-fun e!619944 () Bool)

(declare-fun array_inv!25981 (array!69983) Bool)

(assert (=> start!95868 (and (array_inv!25981 _values!874) e!619944)))

(declare-fun b!1085197 () Bool)

(declare-fun res!723521 () Bool)

(assert (=> b!1085197 (=> (not res!723521) (not e!619940))))

(assert (=> b!1085197 (= res!723521 (= (select (arr!33664 _keys!1070) i!650) k0!904))))

(declare-fun b!1085198 () Bool)

(declare-fun e!619939 () Bool)

(assert (=> b!1085198 (= e!619944 (and e!619939 mapRes!41539))))

(declare-fun condMapEmpty!41539 () Bool)

(declare-fun mapDefault!41539 () ValueCell!12552)

(assert (=> b!1085198 (= condMapEmpty!41539 (= (arr!33665 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12552)) mapDefault!41539)))))

(declare-fun b!1085199 () Bool)

(declare-fun e!619942 () Bool)

(assert (=> b!1085199 (= e!619940 e!619942)))

(declare-fun res!723519 () Bool)

(assert (=> b!1085199 (=> (not res!723519) (not e!619942))))

(declare-fun lt!481402 () array!69981)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69981 (_ BitVec 32)) Bool)

(assert (=> b!1085199 (= res!723519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481402 mask!1414))))

(assert (=> b!1085199 (= lt!481402 (array!69982 (store (arr!33664 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34200 _keys!1070)))))

(declare-fun b!1085200 () Bool)

(assert (=> b!1085200 (= e!619939 tp_is_empty!26523)))

(declare-fun b!1085201 () Bool)

(declare-fun res!723520 () Bool)

(assert (=> b!1085201 (=> (not res!723520) (not e!619942))))

(assert (=> b!1085201 (= res!723520 (arrayNoDuplicates!0 lt!481402 #b00000000000000000000000000000000 Nil!23471))))

(declare-fun b!1085202 () Bool)

(assert (=> b!1085202 (= e!619941 true)))

(assert (=> b!1085202 (= (-!769 lt!481404 k0!904) (+!3252 lt!481413 lt!481414))))

(declare-fun lt!481403 () Unit!35704)

(assert (=> b!1085202 (= lt!481403 (addRemoveCommutativeForDiffKeys!8 lt!481406 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085203 () Bool)

(assert (=> b!1085203 (= e!619943 tp_is_empty!26523)))

(declare-fun b!1085204 () Bool)

(declare-fun res!723512 () Bool)

(assert (=> b!1085204 (=> (not res!723512) (not e!619940))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085204 (= res!723512 (and (= (size!34201 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34200 _keys!1070) (size!34201 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085205 () Bool)

(declare-fun res!723516 () Bool)

(assert (=> b!1085205 (=> (not res!723516) (not e!619940))))

(assert (=> b!1085205 (= res!723516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085206 () Bool)

(assert (=> b!1085206 (= e!619942 (not e!619945))))

(declare-fun res!723515 () Bool)

(assert (=> b!1085206 (=> res!723515 e!619945)))

(assert (=> b!1085206 (= res!723515 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4228 (array!69981 array!69983 (_ BitVec 32) (_ BitVec 32) V!40491 V!40491 (_ BitVec 32) Int) ListLongMap!14855)

(assert (=> b!1085206 (= lt!481407 (getCurrentListMap!4228 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481399 () array!69983)

(assert (=> b!1085206 (= lt!481405 (getCurrentListMap!4228 lt!481402 lt!481399 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085206 (and (= lt!481410 lt!481400) (= lt!481400 lt!481410))))

(assert (=> b!1085206 (= lt!481400 (-!769 lt!481411 k0!904))))

(declare-fun lt!481408 () Unit!35704)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!47 (array!69981 array!69983 (_ BitVec 32) (_ BitVec 32) V!40491 V!40491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35704)

(assert (=> b!1085206 (= lt!481408 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!47 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3988 (array!69981 array!69983 (_ BitVec 32) (_ BitVec 32) V!40491 V!40491 (_ BitVec 32) Int) ListLongMap!14855)

(assert (=> b!1085206 (= lt!481410 (getCurrentListMapNoExtraKeys!3988 lt!481402 lt!481399 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2125 (Int (_ BitVec 64)) V!40491)

(assert (=> b!1085206 (= lt!481399 (array!69984 (store (arr!33665 _values!874) i!650 (ValueCellFull!12552 (dynLambda!2125 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34201 _values!874)))))

(assert (=> b!1085206 (= lt!481411 (getCurrentListMapNoExtraKeys!3988 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085206 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481412 () Unit!35704)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69981 (_ BitVec 64) (_ BitVec 32)) Unit!35704)

(assert (=> b!1085206 (= lt!481412 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95868 res!723517) b!1085204))

(assert (= (and b!1085204 res!723512) b!1085205))

(assert (= (and b!1085205 res!723516) b!1085193))

(assert (= (and b!1085193 res!723522) b!1085196))

(assert (= (and b!1085196 res!723513) b!1085194))

(assert (= (and b!1085194 res!723514) b!1085197))

(assert (= (and b!1085197 res!723521) b!1085199))

(assert (= (and b!1085199 res!723519) b!1085201))

(assert (= (and b!1085201 res!723520) b!1085206))

(assert (= (and b!1085206 (not res!723515)) b!1085195))

(assert (= (and b!1085195 (not res!723518)) b!1085202))

(assert (= (and b!1085198 condMapEmpty!41539) mapIsEmpty!41539))

(assert (= (and b!1085198 (not condMapEmpty!41539)) mapNonEmpty!41539))

(get-info :version)

(assert (= (and mapNonEmpty!41539 ((_ is ValueCellFull!12552) mapValue!41539)) b!1085203))

(assert (= (and b!1085198 ((_ is ValueCellFull!12552) mapDefault!41539)) b!1085200))

(assert (= start!95868 b!1085198))

(declare-fun b_lambda!17191 () Bool)

(assert (=> (not b_lambda!17191) (not b!1085206)))

(declare-fun t!33052 () Bool)

(declare-fun tb!7399 () Bool)

(assert (=> (and start!95868 (= defaultEntry!882 defaultEntry!882) t!33052) tb!7399))

(declare-fun result!15317 () Bool)

(assert (=> tb!7399 (= result!15317 tp_is_empty!26523)))

(assert (=> b!1085206 t!33052))

(declare-fun b_and!35719 () Bool)

(assert (= b_and!35717 (and (=> t!33052 result!15317) b_and!35719)))

(declare-fun m!1003127 () Bool)

(assert (=> b!1085201 m!1003127))

(declare-fun m!1003129 () Bool)

(assert (=> b!1085194 m!1003129))

(declare-fun m!1003131 () Bool)

(assert (=> b!1085193 m!1003131))

(declare-fun m!1003133 () Bool)

(assert (=> b!1085206 m!1003133))

(declare-fun m!1003135 () Bool)

(assert (=> b!1085206 m!1003135))

(declare-fun m!1003137 () Bool)

(assert (=> b!1085206 m!1003137))

(declare-fun m!1003139 () Bool)

(assert (=> b!1085206 m!1003139))

(declare-fun m!1003141 () Bool)

(assert (=> b!1085206 m!1003141))

(declare-fun m!1003143 () Bool)

(assert (=> b!1085206 m!1003143))

(declare-fun m!1003145 () Bool)

(assert (=> b!1085206 m!1003145))

(declare-fun m!1003147 () Bool)

(assert (=> b!1085206 m!1003147))

(declare-fun m!1003149 () Bool)

(assert (=> b!1085206 m!1003149))

(declare-fun m!1003151 () Bool)

(assert (=> b!1085206 m!1003151))

(declare-fun m!1003153 () Bool)

(assert (=> mapNonEmpty!41539 m!1003153))

(declare-fun m!1003155 () Bool)

(assert (=> b!1085195 m!1003155))

(declare-fun m!1003157 () Bool)

(assert (=> b!1085195 m!1003157))

(declare-fun m!1003159 () Bool)

(assert (=> b!1085195 m!1003159))

(declare-fun m!1003161 () Bool)

(assert (=> b!1085195 m!1003161))

(declare-fun m!1003163 () Bool)

(assert (=> b!1085195 m!1003163))

(assert (=> b!1085195 m!1003161))

(declare-fun m!1003165 () Bool)

(assert (=> b!1085195 m!1003165))

(declare-fun m!1003167 () Bool)

(assert (=> b!1085195 m!1003167))

(declare-fun m!1003169 () Bool)

(assert (=> b!1085195 m!1003169))

(declare-fun m!1003171 () Bool)

(assert (=> b!1085205 m!1003171))

(declare-fun m!1003173 () Bool)

(assert (=> start!95868 m!1003173))

(declare-fun m!1003175 () Bool)

(assert (=> start!95868 m!1003175))

(declare-fun m!1003177 () Bool)

(assert (=> start!95868 m!1003177))

(declare-fun m!1003179 () Bool)

(assert (=> b!1085199 m!1003179))

(declare-fun m!1003181 () Bool)

(assert (=> b!1085199 m!1003181))

(declare-fun m!1003183 () Bool)

(assert (=> b!1085197 m!1003183))

(declare-fun m!1003185 () Bool)

(assert (=> b!1085202 m!1003185))

(declare-fun m!1003187 () Bool)

(assert (=> b!1085202 m!1003187))

(declare-fun m!1003189 () Bool)

(assert (=> b!1085202 m!1003189))

(check-sat (not b!1085195) tp_is_empty!26523 b_and!35719 (not b!1085205) (not b_next!22521) (not start!95868) (not b!1085199) (not b!1085202) (not b!1085194) (not b_lambda!17191) (not b!1085206) (not mapNonEmpty!41539) (not b!1085201) (not b!1085193))
(check-sat b_and!35719 (not b_next!22521))
