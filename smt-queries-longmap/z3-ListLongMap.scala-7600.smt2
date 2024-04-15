; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95914 () Bool)

(assert start!95914)

(declare-fun b_free!22573 () Bool)

(declare-fun b_next!22573 () Bool)

(assert (=> start!95914 (= b_free!22573 (not b_next!22573))))

(declare-fun tp!79567 () Bool)

(declare-fun b_and!35795 () Bool)

(assert (=> start!95914 (= tp!79567 b_and!35795)))

(declare-fun b!1086184 () Bool)

(declare-fun e!620476 () Bool)

(declare-fun e!620474 () Bool)

(assert (=> b!1086184 (= e!620476 e!620474)))

(declare-fun res!724304 () Bool)

(assert (=> b!1086184 (=> (not res!724304) (not e!620474))))

(declare-datatypes ((array!70006 0))(
  ( (array!70007 (arr!33677 (Array (_ BitVec 32) (_ BitVec 64))) (size!34215 (_ BitVec 32))) )
))
(declare-fun lt!482526 () array!70006)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70006 (_ BitVec 32)) Bool)

(assert (=> b!1086184 (= res!724304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482526 mask!1414))))

(declare-fun _keys!1070 () array!70006)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086184 (= lt!482526 (array!70007 (store (arr!33677 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34215 _keys!1070)))))

(declare-fun b!1086185 () Bool)

(declare-fun res!724306 () Bool)

(assert (=> b!1086185 (=> (not res!724306) (not e!620476))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1086185 (= res!724306 (= (select (arr!33677 _keys!1070) i!650) k0!904))))

(declare-fun b!1086186 () Bool)

(declare-fun e!620471 () Bool)

(declare-fun tp_is_empty!26575 () Bool)

(assert (=> b!1086186 (= e!620471 tp_is_empty!26575)))

(declare-fun mapNonEmpty!41617 () Bool)

(declare-fun mapRes!41617 () Bool)

(declare-fun tp!79568 () Bool)

(assert (=> mapNonEmpty!41617 (= mapRes!41617 (and tp!79568 e!620471))))

(declare-datatypes ((V!40561 0))(
  ( (V!40562 (val!13344 Int)) )
))
(declare-datatypes ((ValueCell!12578 0))(
  ( (ValueCellFull!12578 (v!15964 V!40561)) (EmptyCell!12578) )
))
(declare-datatypes ((array!70008 0))(
  ( (array!70009 (arr!33678 (Array (_ BitVec 32) ValueCell!12578)) (size!34216 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70008)

(declare-fun mapRest!41617 () (Array (_ BitVec 32) ValueCell!12578))

(declare-fun mapKey!41617 () (_ BitVec 32))

(declare-fun mapValue!41617 () ValueCell!12578)

(assert (=> mapNonEmpty!41617 (= (arr!33678 _values!874) (store mapRest!41617 mapKey!41617 mapValue!41617))))

(declare-fun mapIsEmpty!41617 () Bool)

(assert (=> mapIsEmpty!41617 mapRes!41617))

(declare-fun b!1086187 () Bool)

(declare-fun e!620473 () Bool)

(assert (=> b!1086187 (= e!620474 (not e!620473))))

(declare-fun res!724307 () Bool)

(assert (=> b!1086187 (=> res!724307 e!620473)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086187 (= res!724307 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40561)

(declare-datatypes ((tuple2!16980 0))(
  ( (tuple2!16981 (_1!8501 (_ BitVec 64)) (_2!8501 V!40561)) )
))
(declare-datatypes ((List!23550 0))(
  ( (Nil!23547) (Cons!23546 (h!24755 tuple2!16980) (t!33172 List!23550)) )
))
(declare-datatypes ((ListLongMap!14949 0))(
  ( (ListLongMap!14950 (toList!7490 List!23550)) )
))
(declare-fun lt!482525 () ListLongMap!14949)

(declare-fun zeroValue!831 () V!40561)

(declare-fun getCurrentListMap!4175 (array!70006 array!70008 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) Int) ListLongMap!14949)

(assert (=> b!1086187 (= lt!482525 (getCurrentListMap!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482540 () ListLongMap!14949)

(declare-fun lt!482532 () array!70008)

(assert (=> b!1086187 (= lt!482540 (getCurrentListMap!4175 lt!482526 lt!482532 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482531 () ListLongMap!14949)

(declare-fun lt!482536 () ListLongMap!14949)

(assert (=> b!1086187 (and (= lt!482531 lt!482536) (= lt!482536 lt!482531))))

(declare-fun lt!482530 () ListLongMap!14949)

(declare-fun -!769 (ListLongMap!14949 (_ BitVec 64)) ListLongMap!14949)

(assert (=> b!1086187 (= lt!482536 (-!769 lt!482530 k0!904))))

(declare-datatypes ((Unit!35573 0))(
  ( (Unit!35574) )
))
(declare-fun lt!482538 () Unit!35573)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!59 (array!70006 array!70008 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35573)

(assert (=> b!1086187 (= lt!482538 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!59 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4045 (array!70006 array!70008 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) Int) ListLongMap!14949)

(assert (=> b!1086187 (= lt!482531 (getCurrentListMapNoExtraKeys!4045 lt!482526 lt!482532 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2116 (Int (_ BitVec 64)) V!40561)

(assert (=> b!1086187 (= lt!482532 (array!70009 (store (arr!33678 _values!874) i!650 (ValueCellFull!12578 (dynLambda!2116 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34216 _values!874)))))

(assert (=> b!1086187 (= lt!482530 (getCurrentListMapNoExtraKeys!4045 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086187 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482539 () Unit!35573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70006 (_ BitVec 64) (_ BitVec 32)) Unit!35573)

(assert (=> b!1086187 (= lt!482539 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086188 () Bool)

(declare-fun e!620470 () Bool)

(assert (=> b!1086188 (= e!620470 tp_is_empty!26575)))

(declare-fun res!724309 () Bool)

(assert (=> start!95914 (=> (not res!724309) (not e!620476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95914 (= res!724309 (validMask!0 mask!1414))))

(assert (=> start!95914 e!620476))

(assert (=> start!95914 tp!79567))

(assert (=> start!95914 true))

(assert (=> start!95914 tp_is_empty!26575))

(declare-fun array_inv!26024 (array!70006) Bool)

(assert (=> start!95914 (array_inv!26024 _keys!1070)))

(declare-fun e!620477 () Bool)

(declare-fun array_inv!26025 (array!70008) Bool)

(assert (=> start!95914 (and (array_inv!26025 _values!874) e!620477)))

(declare-fun b!1086189 () Bool)

(declare-fun e!620475 () Bool)

(assert (=> b!1086189 (= e!620475 true)))

(declare-fun lt!482537 () ListLongMap!14949)

(declare-fun lt!482528 () ListLongMap!14949)

(declare-fun lt!482524 () tuple2!16980)

(declare-fun +!3298 (ListLongMap!14949 tuple2!16980) ListLongMap!14949)

(assert (=> b!1086189 (= (-!769 lt!482537 k0!904) (+!3298 lt!482528 lt!482524))))

(declare-fun lt!482535 () Unit!35573)

(declare-fun lt!482533 () ListLongMap!14949)

(declare-fun addRemoveCommutativeForDiffKeys!27 (ListLongMap!14949 (_ BitVec 64) V!40561 (_ BitVec 64)) Unit!35573)

(assert (=> b!1086189 (= lt!482535 (addRemoveCommutativeForDiffKeys!27 lt!482533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086190 () Bool)

(assert (=> b!1086190 (= e!620477 (and e!620470 mapRes!41617))))

(declare-fun condMapEmpty!41617 () Bool)

(declare-fun mapDefault!41617 () ValueCell!12578)

(assert (=> b!1086190 (= condMapEmpty!41617 (= (arr!33678 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12578)) mapDefault!41617)))))

(declare-fun b!1086191 () Bool)

(declare-fun res!724302 () Bool)

(assert (=> b!1086191 (=> (not res!724302) (not e!620474))))

(declare-datatypes ((List!23551 0))(
  ( (Nil!23548) (Cons!23547 (h!24756 (_ BitVec 64)) (t!33173 List!23551)) )
))
(declare-fun arrayNoDuplicates!0 (array!70006 (_ BitVec 32) List!23551) Bool)

(assert (=> b!1086191 (= res!724302 (arrayNoDuplicates!0 lt!482526 #b00000000000000000000000000000000 Nil!23548))))

(declare-fun b!1086192 () Bool)

(declare-fun res!724303 () Bool)

(assert (=> b!1086192 (=> (not res!724303) (not e!620476))))

(assert (=> b!1086192 (= res!724303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086193 () Bool)

(declare-fun res!724308 () Bool)

(assert (=> b!1086193 (=> (not res!724308) (not e!620476))))

(assert (=> b!1086193 (= res!724308 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23548))))

(declare-fun b!1086194 () Bool)

(declare-fun res!724301 () Bool)

(assert (=> b!1086194 (=> (not res!724301) (not e!620476))))

(assert (=> b!1086194 (= res!724301 (and (= (size!34216 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34215 _keys!1070) (size!34216 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086195 () Bool)

(declare-fun res!724305 () Bool)

(assert (=> b!1086195 (=> (not res!724305) (not e!620476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086195 (= res!724305 (validKeyInArray!0 k0!904))))

(declare-fun b!1086196 () Bool)

(declare-fun res!724310 () Bool)

(assert (=> b!1086196 (=> (not res!724310) (not e!620476))))

(assert (=> b!1086196 (= res!724310 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34215 _keys!1070))))))

(declare-fun b!1086197 () Bool)

(assert (=> b!1086197 (= e!620473 e!620475)))

(declare-fun res!724311 () Bool)

(assert (=> b!1086197 (=> res!724311 e!620475)))

(assert (=> b!1086197 (= res!724311 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482534 () ListLongMap!14949)

(assert (=> b!1086197 (= lt!482528 lt!482534)))

(assert (=> b!1086197 (= lt!482528 (-!769 lt!482533 k0!904))))

(declare-fun lt!482527 () Unit!35573)

(assert (=> b!1086197 (= lt!482527 (addRemoveCommutativeForDiffKeys!27 lt!482530 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1086197 (= lt!482540 (+!3298 lt!482534 lt!482524))))

(declare-fun lt!482529 () tuple2!16980)

(assert (=> b!1086197 (= lt!482534 (+!3298 lt!482536 lt!482529))))

(assert (=> b!1086197 (= lt!482525 lt!482537)))

(assert (=> b!1086197 (= lt!482537 (+!3298 lt!482533 lt!482524))))

(assert (=> b!1086197 (= lt!482533 (+!3298 lt!482530 lt!482529))))

(assert (=> b!1086197 (= lt!482540 (+!3298 (+!3298 lt!482531 lt!482529) lt!482524))))

(assert (=> b!1086197 (= lt!482524 (tuple2!16981 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086197 (= lt!482529 (tuple2!16981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(assert (= (and start!95914 res!724309) b!1086194))

(assert (= (and b!1086194 res!724301) b!1086192))

(assert (= (and b!1086192 res!724303) b!1086193))

(assert (= (and b!1086193 res!724308) b!1086196))

(assert (= (and b!1086196 res!724310) b!1086195))

(assert (= (and b!1086195 res!724305) b!1086185))

(assert (= (and b!1086185 res!724306) b!1086184))

(assert (= (and b!1086184 res!724304) b!1086191))

(assert (= (and b!1086191 res!724302) b!1086187))

(assert (= (and b!1086187 (not res!724307)) b!1086197))

(assert (= (and b!1086197 (not res!724311)) b!1086189))

(assert (= (and b!1086190 condMapEmpty!41617) mapIsEmpty!41617))

(assert (= (and b!1086190 (not condMapEmpty!41617)) mapNonEmpty!41617))

(get-info :version)

(assert (= (and mapNonEmpty!41617 ((_ is ValueCellFull!12578) mapValue!41617)) b!1086186))

(assert (= (and b!1086190 ((_ is ValueCellFull!12578) mapDefault!41617)) b!1086188))

(assert (= start!95914 b!1086190))

(declare-fun b_lambda!17221 () Bool)

(assert (=> (not b_lambda!17221) (not b!1086187)))

(declare-fun t!33171 () Bool)

(declare-fun tb!7443 () Bool)

(assert (=> (and start!95914 (= defaultEntry!882 defaultEntry!882) t!33171) tb!7443))

(declare-fun result!15413 () Bool)

(assert (=> tb!7443 (= result!15413 tp_is_empty!26575)))

(assert (=> b!1086187 t!33171))

(declare-fun b_and!35797 () Bool)

(assert (= b_and!35795 (and (=> t!33171 result!15413) b_and!35797)))

(declare-fun m!1004165 () Bool)

(assert (=> b!1086192 m!1004165))

(declare-fun m!1004167 () Bool)

(assert (=> mapNonEmpty!41617 m!1004167))

(declare-fun m!1004169 () Bool)

(assert (=> b!1086184 m!1004169))

(declare-fun m!1004171 () Bool)

(assert (=> b!1086184 m!1004171))

(declare-fun m!1004173 () Bool)

(assert (=> b!1086189 m!1004173))

(declare-fun m!1004175 () Bool)

(assert (=> b!1086189 m!1004175))

(declare-fun m!1004177 () Bool)

(assert (=> b!1086189 m!1004177))

(declare-fun m!1004179 () Bool)

(assert (=> b!1086187 m!1004179))

(declare-fun m!1004181 () Bool)

(assert (=> b!1086187 m!1004181))

(declare-fun m!1004183 () Bool)

(assert (=> b!1086187 m!1004183))

(declare-fun m!1004185 () Bool)

(assert (=> b!1086187 m!1004185))

(declare-fun m!1004187 () Bool)

(assert (=> b!1086187 m!1004187))

(declare-fun m!1004189 () Bool)

(assert (=> b!1086187 m!1004189))

(declare-fun m!1004191 () Bool)

(assert (=> b!1086187 m!1004191))

(declare-fun m!1004193 () Bool)

(assert (=> b!1086187 m!1004193))

(declare-fun m!1004195 () Bool)

(assert (=> b!1086187 m!1004195))

(declare-fun m!1004197 () Bool)

(assert (=> b!1086187 m!1004197))

(declare-fun m!1004199 () Bool)

(assert (=> b!1086191 m!1004199))

(declare-fun m!1004201 () Bool)

(assert (=> b!1086195 m!1004201))

(declare-fun m!1004203 () Bool)

(assert (=> start!95914 m!1004203))

(declare-fun m!1004205 () Bool)

(assert (=> start!95914 m!1004205))

(declare-fun m!1004207 () Bool)

(assert (=> start!95914 m!1004207))

(declare-fun m!1004209 () Bool)

(assert (=> b!1086185 m!1004209))

(declare-fun m!1004211 () Bool)

(assert (=> b!1086193 m!1004211))

(declare-fun m!1004213 () Bool)

(assert (=> b!1086197 m!1004213))

(declare-fun m!1004215 () Bool)

(assert (=> b!1086197 m!1004215))

(declare-fun m!1004217 () Bool)

(assert (=> b!1086197 m!1004217))

(declare-fun m!1004219 () Bool)

(assert (=> b!1086197 m!1004219))

(assert (=> b!1086197 m!1004215))

(declare-fun m!1004221 () Bool)

(assert (=> b!1086197 m!1004221))

(declare-fun m!1004223 () Bool)

(assert (=> b!1086197 m!1004223))

(declare-fun m!1004225 () Bool)

(assert (=> b!1086197 m!1004225))

(declare-fun m!1004227 () Bool)

(assert (=> b!1086197 m!1004227))

(check-sat (not b_lambda!17221) (not b!1086192) (not b!1086184) (not b!1086187) (not b!1086189) (not b!1086197) (not b!1086195) tp_is_empty!26575 (not start!95914) (not b!1086191) (not b_next!22573) b_and!35797 (not b!1086193) (not mapNonEmpty!41617))
(check-sat b_and!35797 (not b_next!22573))
