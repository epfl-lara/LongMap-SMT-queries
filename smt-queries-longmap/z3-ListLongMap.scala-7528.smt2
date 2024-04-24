; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95678 () Bool)

(assert start!95678)

(declare-fun res!718767 () Bool)

(declare-fun e!617188 () Bool)

(assert (=> start!95678 (=> (not res!718767) (not e!617188))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95678 (= res!718767 (validMask!0 mask!1414))))

(assert (=> start!95678 e!617188))

(assert (=> start!95678 true))

(declare-datatypes ((array!69275 0))(
  ( (array!69276 (arr!33308 (Array (_ BitVec 32) (_ BitVec 64))) (size!33845 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69275)

(declare-fun array_inv!25768 (array!69275) Bool)

(assert (=> start!95678 (array_inv!25768 _keys!1070)))

(declare-datatypes ((V!39985 0))(
  ( (V!39986 (val!13128 Int)) )
))
(declare-datatypes ((ValueCell!12362 0))(
  ( (ValueCellFull!12362 (v!15744 V!39985)) (EmptyCell!12362) )
))
(declare-datatypes ((array!69277 0))(
  ( (array!69278 (arr!33309 (Array (_ BitVec 32) ValueCell!12362)) (size!33846 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69277)

(declare-fun e!617190 () Bool)

(declare-fun array_inv!25769 (array!69277) Bool)

(assert (=> start!95678 (and (array_inv!25769 _values!874) e!617190)))

(declare-fun b!1079250 () Bool)

(declare-fun e!617191 () Bool)

(declare-fun mapRes!40960 () Bool)

(assert (=> b!1079250 (= e!617190 (and e!617191 mapRes!40960))))

(declare-fun condMapEmpty!40960 () Bool)

(declare-fun mapDefault!40960 () ValueCell!12362)

(assert (=> b!1079250 (= condMapEmpty!40960 (= (arr!33309 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12362)) mapDefault!40960)))))

(declare-fun b!1079251 () Bool)

(declare-fun res!718761 () Bool)

(assert (=> b!1079251 (=> (not res!718761) (not e!617188))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079251 (= res!718761 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33845 _keys!1070))))))

(declare-fun b!1079252 () Bool)

(declare-fun res!718760 () Bool)

(assert (=> b!1079252 (=> (not res!718760) (not e!617188))))

(assert (=> b!1079252 (= res!718760 (and (bvsle #b00000000000000000000000000000000 (size!33845 _keys!1070)) (bvslt (size!33845 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1079253 () Bool)

(declare-fun res!718768 () Bool)

(assert (=> b!1079253 (=> (not res!718768) (not e!617188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69275 (_ BitVec 32)) Bool)

(assert (=> b!1079253 (= res!718768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!40960 () Bool)

(assert (=> mapIsEmpty!40960 mapRes!40960))

(declare-fun b!1079254 () Bool)

(declare-fun res!718765 () Bool)

(assert (=> b!1079254 (=> (not res!718765) (not e!617188))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1079254 (= res!718765 (= (select (arr!33308 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!40960 () Bool)

(declare-fun tp!78422 () Bool)

(declare-fun e!617189 () Bool)

(assert (=> mapNonEmpty!40960 (= mapRes!40960 (and tp!78422 e!617189))))

(declare-fun mapKey!40960 () (_ BitVec 32))

(declare-fun mapRest!40960 () (Array (_ BitVec 32) ValueCell!12362))

(declare-fun mapValue!40960 () ValueCell!12362)

(assert (=> mapNonEmpty!40960 (= (arr!33309 _values!874) (store mapRest!40960 mapKey!40960 mapValue!40960))))

(declare-fun b!1079255 () Bool)

(declare-fun res!718763 () Bool)

(assert (=> b!1079255 (=> (not res!718763) (not e!617188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079255 (= res!718763 (validKeyInArray!0 k0!904))))

(declare-fun b!1079256 () Bool)

(declare-fun res!718766 () Bool)

(assert (=> b!1079256 (=> (not res!718766) (not e!617188))))

(assert (=> b!1079256 (= res!718766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070)) mask!1414))))

(declare-fun b!1079257 () Bool)

(declare-fun tp_is_empty!26143 () Bool)

(assert (=> b!1079257 (= e!617189 tp_is_empty!26143)))

(declare-fun b!1079258 () Bool)

(declare-fun res!718762 () Bool)

(assert (=> b!1079258 (=> (not res!718762) (not e!617188))))

(declare-datatypes ((List!23239 0))(
  ( (Nil!23236) (Cons!23235 (h!24453 (_ BitVec 64)) (t!32590 List!23239)) )
))
(declare-fun arrayNoDuplicates!0 (array!69275 (_ BitVec 32) List!23239) Bool)

(assert (=> b!1079258 (= res!718762 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23236))))

(declare-fun b!1079259 () Bool)

(assert (=> b!1079259 (= e!617191 tp_is_empty!26143)))

(declare-fun b!1079260 () Bool)

(declare-fun noDuplicate!1590 (List!23239) Bool)

(assert (=> b!1079260 (= e!617188 (not (noDuplicate!1590 Nil!23236)))))

(declare-fun b!1079261 () Bool)

(declare-fun res!718764 () Bool)

(assert (=> b!1079261 (=> (not res!718764) (not e!617188))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079261 (= res!718764 (and (= (size!33846 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33845 _keys!1070) (size!33846 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95678 res!718767) b!1079261))

(assert (= (and b!1079261 res!718764) b!1079253))

(assert (= (and b!1079253 res!718768) b!1079258))

(assert (= (and b!1079258 res!718762) b!1079251))

(assert (= (and b!1079251 res!718761) b!1079255))

(assert (= (and b!1079255 res!718763) b!1079254))

(assert (= (and b!1079254 res!718765) b!1079256))

(assert (= (and b!1079256 res!718766) b!1079252))

(assert (= (and b!1079252 res!718760) b!1079260))

(assert (= (and b!1079250 condMapEmpty!40960) mapIsEmpty!40960))

(assert (= (and b!1079250 (not condMapEmpty!40960)) mapNonEmpty!40960))

(get-info :version)

(assert (= (and mapNonEmpty!40960 ((_ is ValueCellFull!12362) mapValue!40960)) b!1079257))

(assert (= (and b!1079250 ((_ is ValueCellFull!12362) mapDefault!40960)) b!1079259))

(assert (= start!95678 b!1079250))

(declare-fun m!998265 () Bool)

(assert (=> b!1079258 m!998265))

(declare-fun m!998267 () Bool)

(assert (=> b!1079255 m!998267))

(declare-fun m!998269 () Bool)

(assert (=> b!1079256 m!998269))

(declare-fun m!998271 () Bool)

(assert (=> b!1079256 m!998271))

(declare-fun m!998273 () Bool)

(assert (=> b!1079254 m!998273))

(declare-fun m!998275 () Bool)

(assert (=> start!95678 m!998275))

(declare-fun m!998277 () Bool)

(assert (=> start!95678 m!998277))

(declare-fun m!998279 () Bool)

(assert (=> start!95678 m!998279))

(declare-fun m!998281 () Bool)

(assert (=> b!1079253 m!998281))

(declare-fun m!998283 () Bool)

(assert (=> mapNonEmpty!40960 m!998283))

(declare-fun m!998285 () Bool)

(assert (=> b!1079260 m!998285))

(check-sat tp_is_empty!26143 (not b!1079256) (not b!1079260) (not b!1079255) (not start!95678) (not b!1079258) (not b!1079253) (not mapNonEmpty!40960))
(check-sat)
(get-model)

(declare-fun b!1079344 () Bool)

(declare-fun e!617232 () Bool)

(declare-fun e!617233 () Bool)

(assert (=> b!1079344 (= e!617232 e!617233)))

(declare-fun res!718831 () Bool)

(assert (=> b!1079344 (=> (not res!718831) (not e!617233))))

(declare-fun e!617234 () Bool)

(assert (=> b!1079344 (= res!718831 (not e!617234))))

(declare-fun res!718830 () Bool)

(assert (=> b!1079344 (=> (not res!718830) (not e!617234))))

(assert (=> b!1079344 (= res!718830 (validKeyInArray!0 (select (arr!33308 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1079346 () Bool)

(declare-fun e!617231 () Bool)

(declare-fun call!45796 () Bool)

(assert (=> b!1079346 (= e!617231 call!45796)))

(declare-fun b!1079347 () Bool)

(assert (=> b!1079347 (= e!617231 call!45796)))

(declare-fun b!1079345 () Bool)

(assert (=> b!1079345 (= e!617233 e!617231)))

(declare-fun c!108733 () Bool)

(assert (=> b!1079345 (= c!108733 (validKeyInArray!0 (select (arr!33308 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130343 () Bool)

(declare-fun res!718829 () Bool)

(assert (=> d!130343 (=> res!718829 e!617232)))

(assert (=> d!130343 (= res!718829 (bvsge #b00000000000000000000000000000000 (size!33845 _keys!1070)))))

(assert (=> d!130343 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23236) e!617232)))

(declare-fun b!1079348 () Bool)

(declare-fun contains!6396 (List!23239 (_ BitVec 64)) Bool)

(assert (=> b!1079348 (= e!617234 (contains!6396 Nil!23236 (select (arr!33308 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45793 () Bool)

(assert (=> bm!45793 (= call!45796 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108733 (Cons!23235 (select (arr!33308 _keys!1070) #b00000000000000000000000000000000) Nil!23236) Nil!23236)))))

(assert (= (and d!130343 (not res!718829)) b!1079344))

(assert (= (and b!1079344 res!718830) b!1079348))

(assert (= (and b!1079344 res!718831) b!1079345))

(assert (= (and b!1079345 c!108733) b!1079346))

(assert (= (and b!1079345 (not c!108733)) b!1079347))

(assert (= (or b!1079346 b!1079347) bm!45793))

(declare-fun m!998331 () Bool)

(assert (=> b!1079344 m!998331))

(assert (=> b!1079344 m!998331))

(declare-fun m!998333 () Bool)

(assert (=> b!1079344 m!998333))

(assert (=> b!1079345 m!998331))

(assert (=> b!1079345 m!998331))

(assert (=> b!1079345 m!998333))

(assert (=> b!1079348 m!998331))

(assert (=> b!1079348 m!998331))

(declare-fun m!998335 () Bool)

(assert (=> b!1079348 m!998335))

(assert (=> bm!45793 m!998331))

(declare-fun m!998337 () Bool)

(assert (=> bm!45793 m!998337))

(assert (=> b!1079258 d!130343))

(declare-fun b!1079357 () Bool)

(declare-fun e!617242 () Bool)

(declare-fun e!617241 () Bool)

(assert (=> b!1079357 (= e!617242 e!617241)))

(declare-fun c!108736 () Bool)

(assert (=> b!1079357 (= c!108736 (validKeyInArray!0 (select (arr!33308 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1079358 () Bool)

(declare-fun e!617243 () Bool)

(assert (=> b!1079358 (= e!617241 e!617243)))

(declare-fun lt!479092 () (_ BitVec 64))

(assert (=> b!1079358 (= lt!479092 (select (arr!33308 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35435 0))(
  ( (Unit!35436) )
))
(declare-fun lt!479091 () Unit!35435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69275 (_ BitVec 64) (_ BitVec 32)) Unit!35435)

(assert (=> b!1079358 (= lt!479091 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!479092 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079358 (arrayContainsKey!0 _keys!1070 lt!479092 #b00000000000000000000000000000000)))

(declare-fun lt!479093 () Unit!35435)

(assert (=> b!1079358 (= lt!479093 lt!479091)))

(declare-fun res!718836 () Bool)

(declare-datatypes ((SeekEntryResult!9857 0))(
  ( (MissingZero!9857 (index!41799 (_ BitVec 32))) (Found!9857 (index!41800 (_ BitVec 32))) (Intermediate!9857 (undefined!10669 Bool) (index!41801 (_ BitVec 32)) (x!96612 (_ BitVec 32))) (Undefined!9857) (MissingVacant!9857 (index!41802 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69275 (_ BitVec 32)) SeekEntryResult!9857)

(assert (=> b!1079358 (= res!718836 (= (seekEntryOrOpen!0 (select (arr!33308 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9857 #b00000000000000000000000000000000)))))

(assert (=> b!1079358 (=> (not res!718836) (not e!617243))))

(declare-fun b!1079359 () Bool)

(declare-fun call!45799 () Bool)

(assert (=> b!1079359 (= e!617241 call!45799)))

(declare-fun d!130345 () Bool)

(declare-fun res!718837 () Bool)

(assert (=> d!130345 (=> res!718837 e!617242)))

(assert (=> d!130345 (= res!718837 (bvsge #b00000000000000000000000000000000 (size!33845 _keys!1070)))))

(assert (=> d!130345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!617242)))

(declare-fun b!1079360 () Bool)

(assert (=> b!1079360 (= e!617243 call!45799)))

(declare-fun bm!45796 () Bool)

(assert (=> bm!45796 (= call!45799 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!130345 (not res!718837)) b!1079357))

(assert (= (and b!1079357 c!108736) b!1079358))

(assert (= (and b!1079357 (not c!108736)) b!1079359))

(assert (= (and b!1079358 res!718836) b!1079360))

(assert (= (or b!1079360 b!1079359) bm!45796))

(assert (=> b!1079357 m!998331))

(assert (=> b!1079357 m!998331))

(assert (=> b!1079357 m!998333))

(assert (=> b!1079358 m!998331))

(declare-fun m!998339 () Bool)

(assert (=> b!1079358 m!998339))

(declare-fun m!998341 () Bool)

(assert (=> b!1079358 m!998341))

(assert (=> b!1079358 m!998331))

(declare-fun m!998343 () Bool)

(assert (=> b!1079358 m!998343))

(declare-fun m!998345 () Bool)

(assert (=> bm!45796 m!998345))

(assert (=> b!1079253 d!130345))

(declare-fun b!1079361 () Bool)

(declare-fun e!617245 () Bool)

(declare-fun e!617244 () Bool)

(assert (=> b!1079361 (= e!617245 e!617244)))

(declare-fun c!108737 () Bool)

(assert (=> b!1079361 (= c!108737 (validKeyInArray!0 (select (arr!33308 (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070))) #b00000000000000000000000000000000)))))

(declare-fun b!1079362 () Bool)

(declare-fun e!617246 () Bool)

(assert (=> b!1079362 (= e!617244 e!617246)))

(declare-fun lt!479095 () (_ BitVec 64))

(assert (=> b!1079362 (= lt!479095 (select (arr!33308 (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070))) #b00000000000000000000000000000000))))

(declare-fun lt!479094 () Unit!35435)

(assert (=> b!1079362 (= lt!479094 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070)) lt!479095 #b00000000000000000000000000000000))))

(assert (=> b!1079362 (arrayContainsKey!0 (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070)) lt!479095 #b00000000000000000000000000000000)))

(declare-fun lt!479096 () Unit!35435)

(assert (=> b!1079362 (= lt!479096 lt!479094)))

(declare-fun res!718838 () Bool)

(assert (=> b!1079362 (= res!718838 (= (seekEntryOrOpen!0 (select (arr!33308 (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070))) #b00000000000000000000000000000000) (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070)) mask!1414) (Found!9857 #b00000000000000000000000000000000)))))

(assert (=> b!1079362 (=> (not res!718838) (not e!617246))))

(declare-fun b!1079363 () Bool)

(declare-fun call!45800 () Bool)

(assert (=> b!1079363 (= e!617244 call!45800)))

(declare-fun d!130347 () Bool)

(declare-fun res!718839 () Bool)

(assert (=> d!130347 (=> res!718839 e!617245)))

(assert (=> d!130347 (= res!718839 (bvsge #b00000000000000000000000000000000 (size!33845 (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070)))))))

(assert (=> d!130347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070)) mask!1414) e!617245)))

(declare-fun b!1079364 () Bool)

(assert (=> b!1079364 (= e!617246 call!45800)))

(declare-fun bm!45797 () Bool)

(assert (=> bm!45797 (= call!45800 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69276 (store (arr!33308 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070)) mask!1414))))

(assert (= (and d!130347 (not res!718839)) b!1079361))

(assert (= (and b!1079361 c!108737) b!1079362))

(assert (= (and b!1079361 (not c!108737)) b!1079363))

(assert (= (and b!1079362 res!718838) b!1079364))

(assert (= (or b!1079364 b!1079363) bm!45797))

(declare-fun m!998347 () Bool)

(assert (=> b!1079361 m!998347))

(assert (=> b!1079361 m!998347))

(declare-fun m!998349 () Bool)

(assert (=> b!1079361 m!998349))

(assert (=> b!1079362 m!998347))

(declare-fun m!998351 () Bool)

(assert (=> b!1079362 m!998351))

(declare-fun m!998353 () Bool)

(assert (=> b!1079362 m!998353))

(assert (=> b!1079362 m!998347))

(declare-fun m!998355 () Bool)

(assert (=> b!1079362 m!998355))

(declare-fun m!998357 () Bool)

(assert (=> bm!45797 m!998357))

(assert (=> b!1079256 d!130347))

(declare-fun d!130349 () Bool)

(assert (=> d!130349 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1079255 d!130349))

(declare-fun d!130351 () Bool)

(assert (=> d!130351 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95678 d!130351))

(declare-fun d!130353 () Bool)

(assert (=> d!130353 (= (array_inv!25768 _keys!1070) (bvsge (size!33845 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95678 d!130353))

(declare-fun d!130355 () Bool)

(assert (=> d!130355 (= (array_inv!25769 _values!874) (bvsge (size!33846 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95678 d!130355))

(declare-fun d!130357 () Bool)

(declare-fun res!718844 () Bool)

(declare-fun e!617251 () Bool)

(assert (=> d!130357 (=> res!718844 e!617251)))

(assert (=> d!130357 (= res!718844 ((_ is Nil!23236) Nil!23236))))

(assert (=> d!130357 (= (noDuplicate!1590 Nil!23236) e!617251)))

(declare-fun b!1079369 () Bool)

(declare-fun e!617252 () Bool)

(assert (=> b!1079369 (= e!617251 e!617252)))

(declare-fun res!718845 () Bool)

(assert (=> b!1079369 (=> (not res!718845) (not e!617252))))

(assert (=> b!1079369 (= res!718845 (not (contains!6396 (t!32590 Nil!23236) (h!24453 Nil!23236))))))

(declare-fun b!1079370 () Bool)

(assert (=> b!1079370 (= e!617252 (noDuplicate!1590 (t!32590 Nil!23236)))))

(assert (= (and d!130357 (not res!718844)) b!1079369))

(assert (= (and b!1079369 res!718845) b!1079370))

(declare-fun m!998359 () Bool)

(assert (=> b!1079369 m!998359))

(declare-fun m!998361 () Bool)

(assert (=> b!1079370 m!998361))

(assert (=> b!1079260 d!130357))

(declare-fun condMapEmpty!40969 () Bool)

(declare-fun mapDefault!40969 () ValueCell!12362)

(assert (=> mapNonEmpty!40960 (= condMapEmpty!40969 (= mapRest!40960 ((as const (Array (_ BitVec 32) ValueCell!12362)) mapDefault!40969)))))

(declare-fun e!617258 () Bool)

(declare-fun mapRes!40969 () Bool)

(assert (=> mapNonEmpty!40960 (= tp!78422 (and e!617258 mapRes!40969))))

(declare-fun b!1079378 () Bool)

(assert (=> b!1079378 (= e!617258 tp_is_empty!26143)))

(declare-fun b!1079377 () Bool)

(declare-fun e!617257 () Bool)

(assert (=> b!1079377 (= e!617257 tp_is_empty!26143)))

(declare-fun mapIsEmpty!40969 () Bool)

(assert (=> mapIsEmpty!40969 mapRes!40969))

(declare-fun mapNonEmpty!40969 () Bool)

(declare-fun tp!78431 () Bool)

(assert (=> mapNonEmpty!40969 (= mapRes!40969 (and tp!78431 e!617257))))

(declare-fun mapRest!40969 () (Array (_ BitVec 32) ValueCell!12362))

(declare-fun mapValue!40969 () ValueCell!12362)

(declare-fun mapKey!40969 () (_ BitVec 32))

(assert (=> mapNonEmpty!40969 (= mapRest!40960 (store mapRest!40969 mapKey!40969 mapValue!40969))))

(assert (= (and mapNonEmpty!40960 condMapEmpty!40969) mapIsEmpty!40969))

(assert (= (and mapNonEmpty!40960 (not condMapEmpty!40969)) mapNonEmpty!40969))

(assert (= (and mapNonEmpty!40969 ((_ is ValueCellFull!12362) mapValue!40969)) b!1079377))

(assert (= (and mapNonEmpty!40960 ((_ is ValueCellFull!12362) mapDefault!40969)) b!1079378))

(declare-fun m!998363 () Bool)

(assert (=> mapNonEmpty!40969 m!998363))

(check-sat (not bm!45797) (not b!1079369) (not b!1079370) (not b!1079358) (not bm!45796) (not b!1079361) (not b!1079357) (not b!1079348) (not b!1079345) tp_is_empty!26143 (not b!1079344) (not bm!45793) (not mapNonEmpty!40969) (not b!1079362))
(check-sat)
