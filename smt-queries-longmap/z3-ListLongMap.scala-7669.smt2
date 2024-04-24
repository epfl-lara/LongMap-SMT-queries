; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96570 () Bool)

(assert start!96570)

(declare-fun b!1096174 () Bool)

(declare-fun e!625928 () Bool)

(declare-fun e!625923 () Bool)

(declare-fun mapRes!42238 () Bool)

(assert (=> b!1096174 (= e!625928 (and e!625923 mapRes!42238))))

(declare-fun condMapEmpty!42238 () Bool)

(declare-datatypes ((V!41113 0))(
  ( (V!41114 (val!13551 Int)) )
))
(declare-datatypes ((ValueCell!12785 0))(
  ( (ValueCellFull!12785 (v!16168 V!41113)) (EmptyCell!12785) )
))
(declare-datatypes ((array!70923 0))(
  ( (array!70924 (arr!34129 (Array (_ BitVec 32) ValueCell!12785)) (size!34666 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70923)

(declare-fun mapDefault!42238 () ValueCell!12785)

(assert (=> b!1096174 (= condMapEmpty!42238 (= (arr!34129 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12785)) mapDefault!42238)))))

(declare-fun b!1096175 () Bool)

(declare-fun res!731162 () Bool)

(declare-fun e!625925 () Bool)

(assert (=> b!1096175 (=> (not res!731162) (not e!625925))))

(declare-datatypes ((array!70925 0))(
  ( (array!70926 (arr!34130 (Array (_ BitVec 32) (_ BitVec 64))) (size!34667 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70925)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70925 (_ BitVec 32)) Bool)

(assert (=> b!1096175 (= res!731162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096176 () Bool)

(declare-fun res!731168 () Bool)

(assert (=> b!1096176 (=> (not res!731168) (not e!625925))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096176 (= res!731168 (validKeyInArray!0 k0!904))))

(declare-fun b!1096177 () Bool)

(declare-fun e!625924 () Bool)

(declare-fun tp_is_empty!26989 () Bool)

(assert (=> b!1096177 (= e!625924 tp_is_empty!26989)))

(declare-fun b!1096178 () Bool)

(declare-fun e!625927 () Bool)

(assert (=> b!1096178 (= e!625927 (bvsge (size!34667 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun b!1096179 () Bool)

(declare-fun res!731163 () Bool)

(assert (=> b!1096179 (=> (not res!731163) (not e!625925))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096179 (= res!731163 (= (select (arr!34130 _keys!1070) i!650) k0!904))))

(declare-fun b!1096180 () Bool)

(assert (=> b!1096180 (= e!625925 e!625927)))

(declare-fun res!731166 () Bool)

(assert (=> b!1096180 (=> (not res!731166) (not e!625927))))

(declare-fun lt!490227 () array!70925)

(assert (=> b!1096180 (= res!731166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490227 mask!1414))))

(assert (=> b!1096180 (= lt!490227 (array!70926 (store (arr!34130 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34667 _keys!1070)))))

(declare-fun b!1096182 () Bool)

(declare-fun res!731165 () Bool)

(assert (=> b!1096182 (=> (not res!731165) (not e!625925))))

(declare-datatypes ((List!23840 0))(
  ( (Nil!23837) (Cons!23836 (h!25054 (_ BitVec 64)) (t!33839 List!23840)) )
))
(declare-fun arrayNoDuplicates!0 (array!70925 (_ BitVec 32) List!23840) Bool)

(assert (=> b!1096182 (= res!731165 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23837))))

(declare-fun b!1096183 () Bool)

(assert (=> b!1096183 (= e!625923 tp_is_empty!26989)))

(declare-fun b!1096184 () Bool)

(declare-fun res!731161 () Bool)

(assert (=> b!1096184 (=> (not res!731161) (not e!625925))))

(assert (=> b!1096184 (= res!731161 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34667 _keys!1070))))))

(declare-fun mapNonEmpty!42238 () Bool)

(declare-fun tp!80753 () Bool)

(assert (=> mapNonEmpty!42238 (= mapRes!42238 (and tp!80753 e!625924))))

(declare-fun mapKey!42238 () (_ BitVec 32))

(declare-fun mapRest!42238 () (Array (_ BitVec 32) ValueCell!12785))

(declare-fun mapValue!42238 () ValueCell!12785)

(assert (=> mapNonEmpty!42238 (= (arr!34129 _values!874) (store mapRest!42238 mapKey!42238 mapValue!42238))))

(declare-fun b!1096185 () Bool)

(declare-fun res!731164 () Bool)

(assert (=> b!1096185 (=> (not res!731164) (not e!625925))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096185 (= res!731164 (and (= (size!34666 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34667 _keys!1070) (size!34666 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42238 () Bool)

(assert (=> mapIsEmpty!42238 mapRes!42238))

(declare-fun res!731169 () Bool)

(assert (=> start!96570 (=> (not res!731169) (not e!625925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96570 (= res!731169 (validMask!0 mask!1414))))

(assert (=> start!96570 e!625925))

(assert (=> start!96570 true))

(declare-fun array_inv!26338 (array!70925) Bool)

(assert (=> start!96570 (array_inv!26338 _keys!1070)))

(declare-fun array_inv!26339 (array!70923) Bool)

(assert (=> start!96570 (and (array_inv!26339 _values!874) e!625928)))

(declare-fun b!1096181 () Bool)

(declare-fun res!731167 () Bool)

(assert (=> b!1096181 (=> (not res!731167) (not e!625927))))

(assert (=> b!1096181 (= res!731167 (arrayNoDuplicates!0 lt!490227 #b00000000000000000000000000000000 Nil!23837))))

(assert (= (and start!96570 res!731169) b!1096185))

(assert (= (and b!1096185 res!731164) b!1096175))

(assert (= (and b!1096175 res!731162) b!1096182))

(assert (= (and b!1096182 res!731165) b!1096184))

(assert (= (and b!1096184 res!731161) b!1096176))

(assert (= (and b!1096176 res!731168) b!1096179))

(assert (= (and b!1096179 res!731163) b!1096180))

(assert (= (and b!1096180 res!731166) b!1096181))

(assert (= (and b!1096181 res!731167) b!1096178))

(assert (= (and b!1096174 condMapEmpty!42238) mapIsEmpty!42238))

(assert (= (and b!1096174 (not condMapEmpty!42238)) mapNonEmpty!42238))

(get-info :version)

(assert (= (and mapNonEmpty!42238 ((_ is ValueCellFull!12785) mapValue!42238)) b!1096177))

(assert (= (and b!1096174 ((_ is ValueCellFull!12785) mapDefault!42238)) b!1096183))

(assert (= start!96570 b!1096174))

(declare-fun m!1016321 () Bool)

(assert (=> start!96570 m!1016321))

(declare-fun m!1016323 () Bool)

(assert (=> start!96570 m!1016323))

(declare-fun m!1016325 () Bool)

(assert (=> start!96570 m!1016325))

(declare-fun m!1016327 () Bool)

(assert (=> b!1096175 m!1016327))

(declare-fun m!1016329 () Bool)

(assert (=> mapNonEmpty!42238 m!1016329))

(declare-fun m!1016331 () Bool)

(assert (=> b!1096180 m!1016331))

(declare-fun m!1016333 () Bool)

(assert (=> b!1096180 m!1016333))

(declare-fun m!1016335 () Bool)

(assert (=> b!1096181 m!1016335))

(declare-fun m!1016337 () Bool)

(assert (=> b!1096176 m!1016337))

(declare-fun m!1016339 () Bool)

(assert (=> b!1096182 m!1016339))

(declare-fun m!1016341 () Bool)

(assert (=> b!1096179 m!1016341))

(check-sat (not b!1096180) (not mapNonEmpty!42238) (not start!96570) (not b!1096182) (not b!1096175) tp_is_empty!26989 (not b!1096176) (not b!1096181))
(check-sat)
(get-model)

(declare-fun b!1096268 () Bool)

(declare-fun e!625973 () Bool)

(declare-fun e!625974 () Bool)

(assert (=> b!1096268 (= e!625973 e!625974)))

(declare-fun c!108755 () Bool)

(assert (=> b!1096268 (= c!108755 (validKeyInArray!0 (select (arr!34130 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45815 () Bool)

(declare-fun call!45818 () Bool)

(assert (=> bm!45815 (= call!45818 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108755 (Cons!23836 (select (arr!34130 _keys!1070) #b00000000000000000000000000000000) Nil!23837) Nil!23837)))))

(declare-fun b!1096269 () Bool)

(assert (=> b!1096269 (= e!625974 call!45818)))

(declare-fun b!1096270 () Bool)

(declare-fun e!625976 () Bool)

(declare-fun contains!6399 (List!23840 (_ BitVec 64)) Bool)

(assert (=> b!1096270 (= e!625976 (contains!6399 Nil!23837 (select (arr!34130 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130681 () Bool)

(declare-fun res!731232 () Bool)

(declare-fun e!625975 () Bool)

(assert (=> d!130681 (=> res!731232 e!625975)))

(assert (=> d!130681 (= res!731232 (bvsge #b00000000000000000000000000000000 (size!34667 _keys!1070)))))

(assert (=> d!130681 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23837) e!625975)))

(declare-fun b!1096271 () Bool)

(assert (=> b!1096271 (= e!625975 e!625973)))

(declare-fun res!731231 () Bool)

(assert (=> b!1096271 (=> (not res!731231) (not e!625973))))

(assert (=> b!1096271 (= res!731231 (not e!625976))))

(declare-fun res!731230 () Bool)

(assert (=> b!1096271 (=> (not res!731230) (not e!625976))))

(assert (=> b!1096271 (= res!731230 (validKeyInArray!0 (select (arr!34130 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1096272 () Bool)

(assert (=> b!1096272 (= e!625974 call!45818)))

(assert (= (and d!130681 (not res!731232)) b!1096271))

(assert (= (and b!1096271 res!731230) b!1096270))

(assert (= (and b!1096271 res!731231) b!1096268))

(assert (= (and b!1096268 c!108755) b!1096269))

(assert (= (and b!1096268 (not c!108755)) b!1096272))

(assert (= (or b!1096269 b!1096272) bm!45815))

(declare-fun m!1016387 () Bool)

(assert (=> b!1096268 m!1016387))

(assert (=> b!1096268 m!1016387))

(declare-fun m!1016389 () Bool)

(assert (=> b!1096268 m!1016389))

(assert (=> bm!45815 m!1016387))

(declare-fun m!1016391 () Bool)

(assert (=> bm!45815 m!1016391))

(assert (=> b!1096270 m!1016387))

(assert (=> b!1096270 m!1016387))

(declare-fun m!1016393 () Bool)

(assert (=> b!1096270 m!1016393))

(assert (=> b!1096271 m!1016387))

(assert (=> b!1096271 m!1016387))

(assert (=> b!1096271 m!1016389))

(assert (=> b!1096182 d!130681))

(declare-fun d!130683 () Bool)

(assert (=> d!130683 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96570 d!130683))

(declare-fun d!130685 () Bool)

(assert (=> d!130685 (= (array_inv!26338 _keys!1070) (bvsge (size!34667 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96570 d!130685))

(declare-fun d!130687 () Bool)

(assert (=> d!130687 (= (array_inv!26339 _values!874) (bvsge (size!34666 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96570 d!130687))

(declare-fun d!130689 () Bool)

(declare-fun res!731237 () Bool)

(declare-fun e!625985 () Bool)

(assert (=> d!130689 (=> res!731237 e!625985)))

(assert (=> d!130689 (= res!731237 (bvsge #b00000000000000000000000000000000 (size!34667 _keys!1070)))))

(assert (=> d!130689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!625985)))

(declare-fun b!1096281 () Bool)

(declare-fun e!625984 () Bool)

(declare-fun e!625983 () Bool)

(assert (=> b!1096281 (= e!625984 e!625983)))

(declare-fun lt!490241 () (_ BitVec 64))

(assert (=> b!1096281 (= lt!490241 (select (arr!34130 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36019 0))(
  ( (Unit!36020) )
))
(declare-fun lt!490242 () Unit!36019)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70925 (_ BitVec 64) (_ BitVec 32)) Unit!36019)

(assert (=> b!1096281 (= lt!490242 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!490241 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!70925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096281 (arrayContainsKey!0 _keys!1070 lt!490241 #b00000000000000000000000000000000)))

(declare-fun lt!490240 () Unit!36019)

(assert (=> b!1096281 (= lt!490240 lt!490242)))

(declare-fun res!731238 () Bool)

(declare-datatypes ((SeekEntryResult!9860 0))(
  ( (MissingZero!9860 (index!41811 (_ BitVec 32))) (Found!9860 (index!41812 (_ BitVec 32))) (Intermediate!9860 (undefined!10672 Bool) (index!41813 (_ BitVec 32)) (x!98397 (_ BitVec 32))) (Undefined!9860) (MissingVacant!9860 (index!41814 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!70925 (_ BitVec 32)) SeekEntryResult!9860)

(assert (=> b!1096281 (= res!731238 (= (seekEntryOrOpen!0 (select (arr!34130 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9860 #b00000000000000000000000000000000)))))

(assert (=> b!1096281 (=> (not res!731238) (not e!625983))))

(declare-fun b!1096282 () Bool)

(declare-fun call!45821 () Bool)

(assert (=> b!1096282 (= e!625983 call!45821)))

(declare-fun b!1096283 () Bool)

(assert (=> b!1096283 (= e!625984 call!45821)))

(declare-fun b!1096284 () Bool)

(assert (=> b!1096284 (= e!625985 e!625984)))

(declare-fun c!108758 () Bool)

(assert (=> b!1096284 (= c!108758 (validKeyInArray!0 (select (arr!34130 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45818 () Bool)

(assert (=> bm!45818 (= call!45821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!130689 (not res!731237)) b!1096284))

(assert (= (and b!1096284 c!108758) b!1096281))

(assert (= (and b!1096284 (not c!108758)) b!1096283))

(assert (= (and b!1096281 res!731238) b!1096282))

(assert (= (or b!1096282 b!1096283) bm!45818))

(assert (=> b!1096281 m!1016387))

(declare-fun m!1016395 () Bool)

(assert (=> b!1096281 m!1016395))

(declare-fun m!1016397 () Bool)

(assert (=> b!1096281 m!1016397))

(assert (=> b!1096281 m!1016387))

(declare-fun m!1016399 () Bool)

(assert (=> b!1096281 m!1016399))

(assert (=> b!1096284 m!1016387))

(assert (=> b!1096284 m!1016387))

(assert (=> b!1096284 m!1016389))

(declare-fun m!1016401 () Bool)

(assert (=> bm!45818 m!1016401))

(assert (=> b!1096175 d!130689))

(declare-fun d!130691 () Bool)

(declare-fun res!731239 () Bool)

(declare-fun e!625988 () Bool)

(assert (=> d!130691 (=> res!731239 e!625988)))

(assert (=> d!130691 (= res!731239 (bvsge #b00000000000000000000000000000000 (size!34667 lt!490227)))))

(assert (=> d!130691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490227 mask!1414) e!625988)))

(declare-fun b!1096285 () Bool)

(declare-fun e!625987 () Bool)

(declare-fun e!625986 () Bool)

(assert (=> b!1096285 (= e!625987 e!625986)))

(declare-fun lt!490244 () (_ BitVec 64))

(assert (=> b!1096285 (= lt!490244 (select (arr!34130 lt!490227) #b00000000000000000000000000000000))))

(declare-fun lt!490245 () Unit!36019)

(assert (=> b!1096285 (= lt!490245 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!490227 lt!490244 #b00000000000000000000000000000000))))

(assert (=> b!1096285 (arrayContainsKey!0 lt!490227 lt!490244 #b00000000000000000000000000000000)))

(declare-fun lt!490243 () Unit!36019)

(assert (=> b!1096285 (= lt!490243 lt!490245)))

(declare-fun res!731240 () Bool)

(assert (=> b!1096285 (= res!731240 (= (seekEntryOrOpen!0 (select (arr!34130 lt!490227) #b00000000000000000000000000000000) lt!490227 mask!1414) (Found!9860 #b00000000000000000000000000000000)))))

(assert (=> b!1096285 (=> (not res!731240) (not e!625986))))

(declare-fun b!1096286 () Bool)

(declare-fun call!45822 () Bool)

(assert (=> b!1096286 (= e!625986 call!45822)))

(declare-fun b!1096287 () Bool)

(assert (=> b!1096287 (= e!625987 call!45822)))

(declare-fun b!1096288 () Bool)

(assert (=> b!1096288 (= e!625988 e!625987)))

(declare-fun c!108759 () Bool)

(assert (=> b!1096288 (= c!108759 (validKeyInArray!0 (select (arr!34130 lt!490227) #b00000000000000000000000000000000)))))

(declare-fun bm!45819 () Bool)

(assert (=> bm!45819 (= call!45822 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!490227 mask!1414))))

(assert (= (and d!130691 (not res!731239)) b!1096288))

(assert (= (and b!1096288 c!108759) b!1096285))

(assert (= (and b!1096288 (not c!108759)) b!1096287))

(assert (= (and b!1096285 res!731240) b!1096286))

(assert (= (or b!1096286 b!1096287) bm!45819))

(declare-fun m!1016403 () Bool)

(assert (=> b!1096285 m!1016403))

(declare-fun m!1016405 () Bool)

(assert (=> b!1096285 m!1016405))

(declare-fun m!1016407 () Bool)

(assert (=> b!1096285 m!1016407))

(assert (=> b!1096285 m!1016403))

(declare-fun m!1016409 () Bool)

(assert (=> b!1096285 m!1016409))

(assert (=> b!1096288 m!1016403))

(assert (=> b!1096288 m!1016403))

(declare-fun m!1016411 () Bool)

(assert (=> b!1096288 m!1016411))

(declare-fun m!1016413 () Bool)

(assert (=> bm!45819 m!1016413))

(assert (=> b!1096180 d!130691))

(declare-fun d!130693 () Bool)

(assert (=> d!130693 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1096176 d!130693))

(declare-fun b!1096289 () Bool)

(declare-fun e!625989 () Bool)

(declare-fun e!625990 () Bool)

(assert (=> b!1096289 (= e!625989 e!625990)))

(declare-fun c!108760 () Bool)

(assert (=> b!1096289 (= c!108760 (validKeyInArray!0 (select (arr!34130 lt!490227) #b00000000000000000000000000000000)))))

(declare-fun bm!45820 () Bool)

(declare-fun call!45823 () Bool)

(assert (=> bm!45820 (= call!45823 (arrayNoDuplicates!0 lt!490227 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108760 (Cons!23836 (select (arr!34130 lt!490227) #b00000000000000000000000000000000) Nil!23837) Nil!23837)))))

(declare-fun b!1096290 () Bool)

(assert (=> b!1096290 (= e!625990 call!45823)))

(declare-fun b!1096291 () Bool)

(declare-fun e!625992 () Bool)

(assert (=> b!1096291 (= e!625992 (contains!6399 Nil!23837 (select (arr!34130 lt!490227) #b00000000000000000000000000000000)))))

(declare-fun d!130695 () Bool)

(declare-fun res!731243 () Bool)

(declare-fun e!625991 () Bool)

(assert (=> d!130695 (=> res!731243 e!625991)))

(assert (=> d!130695 (= res!731243 (bvsge #b00000000000000000000000000000000 (size!34667 lt!490227)))))

(assert (=> d!130695 (= (arrayNoDuplicates!0 lt!490227 #b00000000000000000000000000000000 Nil!23837) e!625991)))

(declare-fun b!1096292 () Bool)

(assert (=> b!1096292 (= e!625991 e!625989)))

(declare-fun res!731242 () Bool)

(assert (=> b!1096292 (=> (not res!731242) (not e!625989))))

(assert (=> b!1096292 (= res!731242 (not e!625992))))

(declare-fun res!731241 () Bool)

(assert (=> b!1096292 (=> (not res!731241) (not e!625992))))

(assert (=> b!1096292 (= res!731241 (validKeyInArray!0 (select (arr!34130 lt!490227) #b00000000000000000000000000000000)))))

(declare-fun b!1096293 () Bool)

(assert (=> b!1096293 (= e!625990 call!45823)))

(assert (= (and d!130695 (not res!731243)) b!1096292))

(assert (= (and b!1096292 res!731241) b!1096291))

(assert (= (and b!1096292 res!731242) b!1096289))

(assert (= (and b!1096289 c!108760) b!1096290))

(assert (= (and b!1096289 (not c!108760)) b!1096293))

(assert (= (or b!1096290 b!1096293) bm!45820))

(assert (=> b!1096289 m!1016403))

(assert (=> b!1096289 m!1016403))

(assert (=> b!1096289 m!1016411))

(assert (=> bm!45820 m!1016403))

(declare-fun m!1016415 () Bool)

(assert (=> bm!45820 m!1016415))

(assert (=> b!1096291 m!1016403))

(assert (=> b!1096291 m!1016403))

(declare-fun m!1016417 () Bool)

(assert (=> b!1096291 m!1016417))

(assert (=> b!1096292 m!1016403))

(assert (=> b!1096292 m!1016403))

(assert (=> b!1096292 m!1016411))

(assert (=> b!1096181 d!130695))

(declare-fun b!1096300 () Bool)

(declare-fun e!625998 () Bool)

(assert (=> b!1096300 (= e!625998 tp_is_empty!26989)))

(declare-fun mapIsEmpty!42247 () Bool)

(declare-fun mapRes!42247 () Bool)

(assert (=> mapIsEmpty!42247 mapRes!42247))

(declare-fun condMapEmpty!42247 () Bool)

(declare-fun mapDefault!42247 () ValueCell!12785)

(assert (=> mapNonEmpty!42238 (= condMapEmpty!42247 (= mapRest!42238 ((as const (Array (_ BitVec 32) ValueCell!12785)) mapDefault!42247)))))

(declare-fun e!625997 () Bool)

(assert (=> mapNonEmpty!42238 (= tp!80753 (and e!625997 mapRes!42247))))

(declare-fun mapNonEmpty!42247 () Bool)

(declare-fun tp!80762 () Bool)

(assert (=> mapNonEmpty!42247 (= mapRes!42247 (and tp!80762 e!625998))))

(declare-fun mapValue!42247 () ValueCell!12785)

(declare-fun mapKey!42247 () (_ BitVec 32))

(declare-fun mapRest!42247 () (Array (_ BitVec 32) ValueCell!12785))

(assert (=> mapNonEmpty!42247 (= mapRest!42238 (store mapRest!42247 mapKey!42247 mapValue!42247))))

(declare-fun b!1096301 () Bool)

(assert (=> b!1096301 (= e!625997 tp_is_empty!26989)))

(assert (= (and mapNonEmpty!42238 condMapEmpty!42247) mapIsEmpty!42247))

(assert (= (and mapNonEmpty!42238 (not condMapEmpty!42247)) mapNonEmpty!42247))

(assert (= (and mapNonEmpty!42247 ((_ is ValueCellFull!12785) mapValue!42247)) b!1096300))

(assert (= (and mapNonEmpty!42238 ((_ is ValueCellFull!12785) mapDefault!42247)) b!1096301))

(declare-fun m!1016419 () Bool)

(assert (=> mapNonEmpty!42247 m!1016419))

(check-sat (not b!1096268) (not bm!45815) (not bm!45820) (not b!1096291) (not bm!45819) (not b!1096270) (not b!1096281) (not b!1096289) (not b!1096292) (not bm!45818) (not b!1096285) (not mapNonEmpty!42247) (not b!1096284) (not b!1096271) tp_is_empty!26989 (not b!1096288))
(check-sat)
