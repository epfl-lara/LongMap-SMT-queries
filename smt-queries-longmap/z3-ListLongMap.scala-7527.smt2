; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95660 () Bool)

(assert start!95660)

(declare-fun b!1079110 () Bool)

(declare-fun e!617113 () Bool)

(declare-datatypes ((array!69263 0))(
  ( (array!69264 (arr!33303 (Array (_ BitVec 32) (_ BitVec 64))) (size!33840 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69263)

(assert (=> b!1079110 (= e!617113 (and (bvsle #b00000000000000000000000000000000 (size!33840 _keys!1070)) (bvsge (size!33840 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1079111 () Bool)

(declare-fun res!718670 () Bool)

(assert (=> b!1079111 (=> (not res!718670) (not e!617113))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079111 (= res!718670 (= (select (arr!33303 _keys!1070) i!650) k0!904))))

(declare-fun b!1079112 () Bool)

(declare-fun e!617114 () Bool)

(declare-fun tp_is_empty!26137 () Bool)

(assert (=> b!1079112 (= e!617114 tp_is_empty!26137)))

(declare-fun b!1079113 () Bool)

(declare-fun res!718669 () Bool)

(assert (=> b!1079113 (=> (not res!718669) (not e!617113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079113 (= res!718669 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!40948 () Bool)

(declare-fun mapRes!40948 () Bool)

(assert (=> mapIsEmpty!40948 mapRes!40948))

(declare-fun b!1079114 () Bool)

(declare-fun e!617117 () Bool)

(assert (=> b!1079114 (= e!617117 (and e!617114 mapRes!40948))))

(declare-fun condMapEmpty!40948 () Bool)

(declare-datatypes ((V!39977 0))(
  ( (V!39978 (val!13125 Int)) )
))
(declare-datatypes ((ValueCell!12359 0))(
  ( (ValueCellFull!12359 (v!15741 V!39977)) (EmptyCell!12359) )
))
(declare-datatypes ((array!69265 0))(
  ( (array!69266 (arr!33304 (Array (_ BitVec 32) ValueCell!12359)) (size!33841 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69265)

(declare-fun mapDefault!40948 () ValueCell!12359)

(assert (=> b!1079114 (= condMapEmpty!40948 (= (arr!33304 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12359)) mapDefault!40948)))))

(declare-fun b!1079115 () Bool)

(declare-fun e!617115 () Bool)

(assert (=> b!1079115 (= e!617115 tp_is_empty!26137)))

(declare-fun b!1079117 () Bool)

(declare-fun res!718675 () Bool)

(assert (=> b!1079117 (=> (not res!718675) (not e!617113))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69263 (_ BitVec 32)) Bool)

(assert (=> b!1079117 (= res!718675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079118 () Bool)

(declare-fun res!718672 () Bool)

(assert (=> b!1079118 (=> (not res!718672) (not e!617113))))

(declare-datatypes ((List!23238 0))(
  ( (Nil!23235) (Cons!23234 (h!24452 (_ BitVec 64)) (t!32589 List!23238)) )
))
(declare-fun arrayNoDuplicates!0 (array!69263 (_ BitVec 32) List!23238) Bool)

(assert (=> b!1079118 (= res!718672 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23235))))

(declare-fun b!1079119 () Bool)

(declare-fun res!718671 () Bool)

(assert (=> b!1079119 (=> (not res!718671) (not e!617113))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079119 (= res!718671 (and (= (size!33841 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33840 _keys!1070) (size!33841 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079120 () Bool)

(declare-fun res!718676 () Bool)

(assert (=> b!1079120 (=> (not res!718676) (not e!617113))))

(assert (=> b!1079120 (= res!718676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) mask!1414))))

(declare-fun mapNonEmpty!40948 () Bool)

(declare-fun tp!78410 () Bool)

(assert (=> mapNonEmpty!40948 (= mapRes!40948 (and tp!78410 e!617115))))

(declare-fun mapKey!40948 () (_ BitVec 32))

(declare-fun mapRest!40948 () (Array (_ BitVec 32) ValueCell!12359))

(declare-fun mapValue!40948 () ValueCell!12359)

(assert (=> mapNonEmpty!40948 (= (arr!33304 _values!874) (store mapRest!40948 mapKey!40948 mapValue!40948))))

(declare-fun res!718673 () Bool)

(assert (=> start!95660 (=> (not res!718673) (not e!617113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95660 (= res!718673 (validMask!0 mask!1414))))

(assert (=> start!95660 e!617113))

(assert (=> start!95660 true))

(declare-fun array_inv!25764 (array!69263) Bool)

(assert (=> start!95660 (array_inv!25764 _keys!1070)))

(declare-fun array_inv!25765 (array!69265) Bool)

(assert (=> start!95660 (and (array_inv!25765 _values!874) e!617117)))

(declare-fun b!1079116 () Bool)

(declare-fun res!718674 () Bool)

(assert (=> b!1079116 (=> (not res!718674) (not e!617113))))

(assert (=> b!1079116 (= res!718674 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33840 _keys!1070))))))

(assert (= (and start!95660 res!718673) b!1079119))

(assert (= (and b!1079119 res!718671) b!1079117))

(assert (= (and b!1079117 res!718675) b!1079118))

(assert (= (and b!1079118 res!718672) b!1079116))

(assert (= (and b!1079116 res!718674) b!1079113))

(assert (= (and b!1079113 res!718669) b!1079111))

(assert (= (and b!1079111 res!718670) b!1079120))

(assert (= (and b!1079120 res!718676) b!1079110))

(assert (= (and b!1079114 condMapEmpty!40948) mapIsEmpty!40948))

(assert (= (and b!1079114 (not condMapEmpty!40948)) mapNonEmpty!40948))

(get-info :version)

(assert (= (and mapNonEmpty!40948 ((_ is ValueCellFull!12359) mapValue!40948)) b!1079115))

(assert (= (and b!1079114 ((_ is ValueCellFull!12359) mapDefault!40948)) b!1079112))

(assert (= start!95660 b!1079114))

(declare-fun m!998175 () Bool)

(assert (=> b!1079113 m!998175))

(declare-fun m!998177 () Bool)

(assert (=> b!1079117 m!998177))

(declare-fun m!998179 () Bool)

(assert (=> mapNonEmpty!40948 m!998179))

(declare-fun m!998181 () Bool)

(assert (=> b!1079111 m!998181))

(declare-fun m!998183 () Bool)

(assert (=> b!1079120 m!998183))

(declare-fun m!998185 () Bool)

(assert (=> b!1079120 m!998185))

(declare-fun m!998187 () Bool)

(assert (=> b!1079118 m!998187))

(declare-fun m!998189 () Bool)

(assert (=> start!95660 m!998189))

(declare-fun m!998191 () Bool)

(assert (=> start!95660 m!998191))

(declare-fun m!998193 () Bool)

(assert (=> start!95660 m!998193))

(check-sat tp_is_empty!26137 (not b!1079113) (not b!1079117) (not mapNonEmpty!40948) (not b!1079118) (not b!1079120) (not start!95660))
(check-sat)
(get-model)

(declare-fun b!1079197 () Bool)

(declare-fun e!617159 () Bool)

(declare-fun call!45789 () Bool)

(assert (=> b!1079197 (= e!617159 call!45789)))

(declare-fun b!1079198 () Bool)

(declare-fun e!617157 () Bool)

(declare-fun contains!6395 (List!23238 (_ BitVec 64)) Bool)

(assert (=> b!1079198 (= e!617157 (contains!6395 Nil!23235 (select (arr!33303 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45786 () Bool)

(declare-fun c!108726 () Bool)

(assert (=> bm!45786 (= call!45789 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108726 (Cons!23234 (select (arr!33303 _keys!1070) #b00000000000000000000000000000000) Nil!23235) Nil!23235)))))

(declare-fun b!1079199 () Bool)

(assert (=> b!1079199 (= e!617159 call!45789)))

(declare-fun d!130327 () Bool)

(declare-fun res!718733 () Bool)

(declare-fun e!617158 () Bool)

(assert (=> d!130327 (=> res!718733 e!617158)))

(assert (=> d!130327 (= res!718733 (bvsge #b00000000000000000000000000000000 (size!33840 _keys!1070)))))

(assert (=> d!130327 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23235) e!617158)))

(declare-fun b!1079200 () Bool)

(declare-fun e!617156 () Bool)

(assert (=> b!1079200 (= e!617158 e!617156)))

(declare-fun res!718731 () Bool)

(assert (=> b!1079200 (=> (not res!718731) (not e!617156))))

(assert (=> b!1079200 (= res!718731 (not e!617157))))

(declare-fun res!718732 () Bool)

(assert (=> b!1079200 (=> (not res!718732) (not e!617157))))

(assert (=> b!1079200 (= res!718732 (validKeyInArray!0 (select (arr!33303 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1079201 () Bool)

(assert (=> b!1079201 (= e!617156 e!617159)))

(assert (=> b!1079201 (= c!108726 (validKeyInArray!0 (select (arr!33303 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130327 (not res!718733)) b!1079200))

(assert (= (and b!1079200 res!718732) b!1079198))

(assert (= (and b!1079200 res!718731) b!1079201))

(assert (= (and b!1079201 c!108726) b!1079199))

(assert (= (and b!1079201 (not c!108726)) b!1079197))

(assert (= (or b!1079199 b!1079197) bm!45786))

(declare-fun m!998235 () Bool)

(assert (=> b!1079198 m!998235))

(assert (=> b!1079198 m!998235))

(declare-fun m!998237 () Bool)

(assert (=> b!1079198 m!998237))

(assert (=> bm!45786 m!998235))

(declare-fun m!998239 () Bool)

(assert (=> bm!45786 m!998239))

(assert (=> b!1079200 m!998235))

(assert (=> b!1079200 m!998235))

(declare-fun m!998241 () Bool)

(assert (=> b!1079200 m!998241))

(assert (=> b!1079201 m!998235))

(assert (=> b!1079201 m!998235))

(assert (=> b!1079201 m!998241))

(assert (=> b!1079118 d!130327))

(declare-fun d!130329 () Bool)

(declare-fun res!718739 () Bool)

(declare-fun e!617166 () Bool)

(assert (=> d!130329 (=> res!718739 e!617166)))

(assert (=> d!130329 (= res!718739 (bvsge #b00000000000000000000000000000000 (size!33840 _keys!1070)))))

(assert (=> d!130329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!617166)))

(declare-fun bm!45789 () Bool)

(declare-fun call!45792 () Bool)

(assert (=> bm!45789 (= call!45792 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1079210 () Bool)

(declare-fun e!617168 () Bool)

(assert (=> b!1079210 (= e!617168 call!45792)))

(declare-fun b!1079211 () Bool)

(declare-fun e!617167 () Bool)

(assert (=> b!1079211 (= e!617167 call!45792)))

(declare-fun b!1079212 () Bool)

(assert (=> b!1079212 (= e!617168 e!617167)))

(declare-fun lt!479080 () (_ BitVec 64))

(assert (=> b!1079212 (= lt!479080 (select (arr!33303 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35433 0))(
  ( (Unit!35434) )
))
(declare-fun lt!479081 () Unit!35433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69263 (_ BitVec 64) (_ BitVec 32)) Unit!35433)

(assert (=> b!1079212 (= lt!479081 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!479080 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079212 (arrayContainsKey!0 _keys!1070 lt!479080 #b00000000000000000000000000000000)))

(declare-fun lt!479079 () Unit!35433)

(assert (=> b!1079212 (= lt!479079 lt!479081)))

(declare-fun res!718738 () Bool)

(declare-datatypes ((SeekEntryResult!9856 0))(
  ( (MissingZero!9856 (index!41795 (_ BitVec 32))) (Found!9856 (index!41796 (_ BitVec 32))) (Intermediate!9856 (undefined!10668 Bool) (index!41797 (_ BitVec 32)) (x!96601 (_ BitVec 32))) (Undefined!9856) (MissingVacant!9856 (index!41798 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69263 (_ BitVec 32)) SeekEntryResult!9856)

(assert (=> b!1079212 (= res!718738 (= (seekEntryOrOpen!0 (select (arr!33303 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9856 #b00000000000000000000000000000000)))))

(assert (=> b!1079212 (=> (not res!718738) (not e!617167))))

(declare-fun b!1079213 () Bool)

(assert (=> b!1079213 (= e!617166 e!617168)))

(declare-fun c!108729 () Bool)

(assert (=> b!1079213 (= c!108729 (validKeyInArray!0 (select (arr!33303 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130329 (not res!718739)) b!1079213))

(assert (= (and b!1079213 c!108729) b!1079212))

(assert (= (and b!1079213 (not c!108729)) b!1079210))

(assert (= (and b!1079212 res!718738) b!1079211))

(assert (= (or b!1079211 b!1079210) bm!45789))

(declare-fun m!998243 () Bool)

(assert (=> bm!45789 m!998243))

(assert (=> b!1079212 m!998235))

(declare-fun m!998245 () Bool)

(assert (=> b!1079212 m!998245))

(declare-fun m!998247 () Bool)

(assert (=> b!1079212 m!998247))

(assert (=> b!1079212 m!998235))

(declare-fun m!998249 () Bool)

(assert (=> b!1079212 m!998249))

(assert (=> b!1079213 m!998235))

(assert (=> b!1079213 m!998235))

(assert (=> b!1079213 m!998241))

(assert (=> b!1079117 d!130329))

(declare-fun d!130331 () Bool)

(assert (=> d!130331 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1079113 d!130331))

(declare-fun d!130333 () Bool)

(assert (=> d!130333 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95660 d!130333))

(declare-fun d!130335 () Bool)

(assert (=> d!130335 (= (array_inv!25764 _keys!1070) (bvsge (size!33840 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95660 d!130335))

(declare-fun d!130337 () Bool)

(assert (=> d!130337 (= (array_inv!25765 _values!874) (bvsge (size!33841 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95660 d!130337))

(declare-fun d!130339 () Bool)

(declare-fun res!718741 () Bool)

(declare-fun e!617169 () Bool)

(assert (=> d!130339 (=> res!718741 e!617169)))

(assert (=> d!130339 (= res!718741 (bvsge #b00000000000000000000000000000000 (size!33840 (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)))))))

(assert (=> d!130339 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) mask!1414) e!617169)))

(declare-fun call!45793 () Bool)

(declare-fun bm!45790 () Bool)

(assert (=> bm!45790 (= call!45793 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) mask!1414))))

(declare-fun b!1079214 () Bool)

(declare-fun e!617171 () Bool)

(assert (=> b!1079214 (= e!617171 call!45793)))

(declare-fun b!1079215 () Bool)

(declare-fun e!617170 () Bool)

(assert (=> b!1079215 (= e!617170 call!45793)))

(declare-fun b!1079216 () Bool)

(assert (=> b!1079216 (= e!617171 e!617170)))

(declare-fun lt!479083 () (_ BitVec 64))

(assert (=> b!1079216 (= lt!479083 (select (arr!33303 (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070))) #b00000000000000000000000000000000))))

(declare-fun lt!479084 () Unit!35433)

(assert (=> b!1079216 (= lt!479084 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) lt!479083 #b00000000000000000000000000000000))))

(assert (=> b!1079216 (arrayContainsKey!0 (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) lt!479083 #b00000000000000000000000000000000)))

(declare-fun lt!479082 () Unit!35433)

(assert (=> b!1079216 (= lt!479082 lt!479084)))

(declare-fun res!718740 () Bool)

(assert (=> b!1079216 (= res!718740 (= (seekEntryOrOpen!0 (select (arr!33303 (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070))) #b00000000000000000000000000000000) (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) mask!1414) (Found!9856 #b00000000000000000000000000000000)))))

(assert (=> b!1079216 (=> (not res!718740) (not e!617170))))

(declare-fun b!1079217 () Bool)

(assert (=> b!1079217 (= e!617169 e!617171)))

(declare-fun c!108730 () Bool)

(assert (=> b!1079217 (= c!108730 (validKeyInArray!0 (select (arr!33303 (array!69264 (store (arr!33303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070))) #b00000000000000000000000000000000)))))

(assert (= (and d!130339 (not res!718741)) b!1079217))

(assert (= (and b!1079217 c!108730) b!1079216))

(assert (= (and b!1079217 (not c!108730)) b!1079214))

(assert (= (and b!1079216 res!718740) b!1079215))

(assert (= (or b!1079215 b!1079214) bm!45790))

(declare-fun m!998251 () Bool)

(assert (=> bm!45790 m!998251))

(declare-fun m!998253 () Bool)

(assert (=> b!1079216 m!998253))

(declare-fun m!998255 () Bool)

(assert (=> b!1079216 m!998255))

(declare-fun m!998257 () Bool)

(assert (=> b!1079216 m!998257))

(assert (=> b!1079216 m!998253))

(declare-fun m!998259 () Bool)

(assert (=> b!1079216 m!998259))

(assert (=> b!1079217 m!998253))

(assert (=> b!1079217 m!998253))

(declare-fun m!998261 () Bool)

(assert (=> b!1079217 m!998261))

(assert (=> b!1079120 d!130339))

(declare-fun b!1079224 () Bool)

(declare-fun e!617177 () Bool)

(assert (=> b!1079224 (= e!617177 tp_is_empty!26137)))

(declare-fun condMapEmpty!40957 () Bool)

(declare-fun mapDefault!40957 () ValueCell!12359)

(assert (=> mapNonEmpty!40948 (= condMapEmpty!40957 (= mapRest!40948 ((as const (Array (_ BitVec 32) ValueCell!12359)) mapDefault!40957)))))

(declare-fun e!617176 () Bool)

(declare-fun mapRes!40957 () Bool)

(assert (=> mapNonEmpty!40948 (= tp!78410 (and e!617176 mapRes!40957))))

(declare-fun b!1079225 () Bool)

(assert (=> b!1079225 (= e!617176 tp_is_empty!26137)))

(declare-fun mapNonEmpty!40957 () Bool)

(declare-fun tp!78419 () Bool)

(assert (=> mapNonEmpty!40957 (= mapRes!40957 (and tp!78419 e!617177))))

(declare-fun mapRest!40957 () (Array (_ BitVec 32) ValueCell!12359))

(declare-fun mapKey!40957 () (_ BitVec 32))

(declare-fun mapValue!40957 () ValueCell!12359)

(assert (=> mapNonEmpty!40957 (= mapRest!40948 (store mapRest!40957 mapKey!40957 mapValue!40957))))

(declare-fun mapIsEmpty!40957 () Bool)

(assert (=> mapIsEmpty!40957 mapRes!40957))

(assert (= (and mapNonEmpty!40948 condMapEmpty!40957) mapIsEmpty!40957))

(assert (= (and mapNonEmpty!40948 (not condMapEmpty!40957)) mapNonEmpty!40957))

(assert (= (and mapNonEmpty!40957 ((_ is ValueCellFull!12359) mapValue!40957)) b!1079224))

(assert (= (and mapNonEmpty!40948 ((_ is ValueCellFull!12359) mapDefault!40957)) b!1079225))

(declare-fun m!998263 () Bool)

(assert (=> mapNonEmpty!40957 m!998263))

(check-sat (not b!1079217) tp_is_empty!26137 (not bm!45790) (not mapNonEmpty!40957) (not bm!45789) (not b!1079201) (not b!1079213) (not bm!45786) (not b!1079216) (not b!1079198) (not b!1079212) (not b!1079200))
(check-sat)
