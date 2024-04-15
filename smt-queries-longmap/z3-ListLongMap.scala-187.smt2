; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3710 () Bool)

(assert start!3710)

(declare-fun b!25924 () Bool)

(declare-fun res!15414 () Bool)

(declare-fun e!16813 () Bool)

(assert (=> b!25924 (=> (not res!15414) (not e!16813))))

(declare-datatypes ((array!1351 0))(
  ( (array!1352 (arr!635 (Array (_ BitVec 32) (_ BitVec 64))) (size!736 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1351)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1351 (_ BitVec 32)) Bool)

(assert (=> b!25924 (= res!15414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!15416 () Bool)

(assert (=> start!3710 (=> (not res!15416) (not e!16813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3710 (= res!15416 (validMask!0 mask!2294))))

(assert (=> start!3710 e!16813))

(assert (=> start!3710 true))

(declare-datatypes ((V!1243 0))(
  ( (V!1244 (val!558 Int)) )
))
(declare-datatypes ((ValueCell!332 0))(
  ( (ValueCellFull!332 (v!1642 V!1243)) (EmptyCell!332) )
))
(declare-datatypes ((array!1353 0))(
  ( (array!1354 (arr!636 (Array (_ BitVec 32) ValueCell!332)) (size!737 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1353)

(declare-fun e!16814 () Bool)

(declare-fun array_inv!449 (array!1353) Bool)

(assert (=> start!3710 (and (array_inv!449 _values!1501) e!16814)))

(declare-fun array_inv!450 (array!1351) Bool)

(assert (=> start!3710 (array_inv!450 _keys!1833)))

(declare-fun mapIsEmpty!1105 () Bool)

(declare-fun mapRes!1105 () Bool)

(assert (=> mapIsEmpty!1105 mapRes!1105))

(declare-fun b!25925 () Bool)

(declare-fun e!16816 () Bool)

(declare-fun tp_is_empty!1063 () Bool)

(assert (=> b!25925 (= e!16816 tp_is_empty!1063)))

(declare-fun b!25926 () Bool)

(declare-fun e!16817 () Bool)

(assert (=> b!25926 (= e!16817 tp_is_empty!1063)))

(declare-fun b!25927 () Bool)

(declare-fun res!15413 () Bool)

(assert (=> b!25927 (=> (not res!15413) (not e!16813))))

(assert (=> b!25927 (= res!15413 (and (bvsle #b00000000000000000000000000000000 (size!736 _keys!1833)) (bvslt (size!736 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!25928 () Bool)

(declare-datatypes ((List!572 0))(
  ( (Nil!569) (Cons!568 (h!1135 (_ BitVec 64)) (t!3252 List!572)) )
))
(declare-fun noDuplicate!8 (List!572) Bool)

(assert (=> b!25928 (= e!16813 (not (noDuplicate!8 Nil!569)))))

(declare-fun b!25929 () Bool)

(declare-fun res!15415 () Bool)

(assert (=> b!25929 (=> (not res!15415) (not e!16813))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25929 (= res!15415 (and (= (size!737 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!736 _keys!1833) (size!737 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1105 () Bool)

(declare-fun tp!3625 () Bool)

(assert (=> mapNonEmpty!1105 (= mapRes!1105 (and tp!3625 e!16816))))

(declare-fun mapValue!1105 () ValueCell!332)

(declare-fun mapKey!1105 () (_ BitVec 32))

(declare-fun mapRest!1105 () (Array (_ BitVec 32) ValueCell!332))

(assert (=> mapNonEmpty!1105 (= (arr!636 _values!1501) (store mapRest!1105 mapKey!1105 mapValue!1105))))

(declare-fun b!25930 () Bool)

(assert (=> b!25930 (= e!16814 (and e!16817 mapRes!1105))))

(declare-fun condMapEmpty!1105 () Bool)

(declare-fun mapDefault!1105 () ValueCell!332)

(assert (=> b!25930 (= condMapEmpty!1105 (= (arr!636 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!332)) mapDefault!1105)))))

(assert (= (and start!3710 res!15416) b!25929))

(assert (= (and b!25929 res!15415) b!25924))

(assert (= (and b!25924 res!15414) b!25927))

(assert (= (and b!25927 res!15413) b!25928))

(assert (= (and b!25930 condMapEmpty!1105) mapIsEmpty!1105))

(assert (= (and b!25930 (not condMapEmpty!1105)) mapNonEmpty!1105))

(get-info :version)

(assert (= (and mapNonEmpty!1105 ((_ is ValueCellFull!332) mapValue!1105)) b!25925))

(assert (= (and b!25930 ((_ is ValueCellFull!332) mapDefault!1105)) b!25926))

(assert (= start!3710 b!25930))

(declare-fun m!20841 () Bool)

(assert (=> b!25924 m!20841))

(declare-fun m!20843 () Bool)

(assert (=> start!3710 m!20843))

(declare-fun m!20845 () Bool)

(assert (=> start!3710 m!20845))

(declare-fun m!20847 () Bool)

(assert (=> start!3710 m!20847))

(declare-fun m!20849 () Bool)

(assert (=> b!25928 m!20849))

(declare-fun m!20851 () Bool)

(assert (=> mapNonEmpty!1105 m!20851))

(check-sat (not mapNonEmpty!1105) (not b!25928) (not b!25924) tp_is_empty!1063 (not start!3710))
(check-sat)
(get-model)

(declare-fun d!4813 () Bool)

(declare-fun res!15445 () Bool)

(declare-fun e!16852 () Bool)

(assert (=> d!4813 (=> res!15445 e!16852)))

(assert (=> d!4813 (= res!15445 ((_ is Nil!569) Nil!569))))

(assert (=> d!4813 (= (noDuplicate!8 Nil!569) e!16852)))

(declare-fun b!25977 () Bool)

(declare-fun e!16853 () Bool)

(assert (=> b!25977 (= e!16852 e!16853)))

(declare-fun res!15446 () Bool)

(assert (=> b!25977 (=> (not res!15446) (not e!16853))))

(declare-fun contains!235 (List!572 (_ BitVec 64)) Bool)

(assert (=> b!25977 (= res!15446 (not (contains!235 (t!3252 Nil!569) (h!1135 Nil!569))))))

(declare-fun b!25978 () Bool)

(assert (=> b!25978 (= e!16853 (noDuplicate!8 (t!3252 Nil!569)))))

(assert (= (and d!4813 (not res!15445)) b!25977))

(assert (= (and b!25977 res!15446) b!25978))

(declare-fun m!20877 () Bool)

(assert (=> b!25977 m!20877))

(declare-fun m!20879 () Bool)

(assert (=> b!25978 m!20879))

(assert (=> b!25928 d!4813))

(declare-fun d!4815 () Bool)

(assert (=> d!4815 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3710 d!4815))

(declare-fun d!4817 () Bool)

(assert (=> d!4817 (= (array_inv!449 _values!1501) (bvsge (size!737 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3710 d!4817))

(declare-fun d!4819 () Bool)

(assert (=> d!4819 (= (array_inv!450 _keys!1833) (bvsge (size!736 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3710 d!4819))

(declare-fun b!25987 () Bool)

(declare-fun e!16861 () Bool)

(declare-fun e!16860 () Bool)

(assert (=> b!25987 (= e!16861 e!16860)))

(declare-fun c!3636 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!25987 (= c!3636 (validKeyInArray!0 (select (arr!635 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2495 () Bool)

(declare-fun call!2498 () Bool)

(assert (=> bm!2495 (= call!2498 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!4821 () Bool)

(declare-fun res!15452 () Bool)

(assert (=> d!4821 (=> res!15452 e!16861)))

(assert (=> d!4821 (= res!15452 (bvsge #b00000000000000000000000000000000 (size!736 _keys!1833)))))

(assert (=> d!4821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16861)))

(declare-fun b!25988 () Bool)

(declare-fun e!16862 () Bool)

(assert (=> b!25988 (= e!16860 e!16862)))

(declare-fun lt!10302 () (_ BitVec 64))

(assert (=> b!25988 (= lt!10302 (select (arr!635 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!628 0))(
  ( (Unit!629) )
))
(declare-fun lt!10301 () Unit!628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1351 (_ BitVec 64) (_ BitVec 32)) Unit!628)

(assert (=> b!25988 (= lt!10301 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10302 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25988 (arrayContainsKey!0 _keys!1833 lt!10302 #b00000000000000000000000000000000)))

(declare-fun lt!10300 () Unit!628)

(assert (=> b!25988 (= lt!10300 lt!10301)))

(declare-fun res!15451 () Bool)

(declare-datatypes ((SeekEntryResult!60 0))(
  ( (MissingZero!60 (index!2362 (_ BitVec 32))) (Found!60 (index!2363 (_ BitVec 32))) (Intermediate!60 (undefined!872 Bool) (index!2364 (_ BitVec 32)) (x!6064 (_ BitVec 32))) (Undefined!60) (MissingVacant!60 (index!2365 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1351 (_ BitVec 32)) SeekEntryResult!60)

(assert (=> b!25988 (= res!15451 (= (seekEntryOrOpen!0 (select (arr!635 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!60 #b00000000000000000000000000000000)))))

(assert (=> b!25988 (=> (not res!15451) (not e!16862))))

(declare-fun b!25989 () Bool)

(assert (=> b!25989 (= e!16860 call!2498)))

(declare-fun b!25990 () Bool)

(assert (=> b!25990 (= e!16862 call!2498)))

(assert (= (and d!4821 (not res!15452)) b!25987))

(assert (= (and b!25987 c!3636) b!25988))

(assert (= (and b!25987 (not c!3636)) b!25989))

(assert (= (and b!25988 res!15451) b!25990))

(assert (= (or b!25990 b!25989) bm!2495))

(declare-fun m!20881 () Bool)

(assert (=> b!25987 m!20881))

(assert (=> b!25987 m!20881))

(declare-fun m!20883 () Bool)

(assert (=> b!25987 m!20883))

(declare-fun m!20885 () Bool)

(assert (=> bm!2495 m!20885))

(assert (=> b!25988 m!20881))

(declare-fun m!20887 () Bool)

(assert (=> b!25988 m!20887))

(declare-fun m!20889 () Bool)

(assert (=> b!25988 m!20889))

(assert (=> b!25988 m!20881))

(declare-fun m!20891 () Bool)

(assert (=> b!25988 m!20891))

(assert (=> b!25924 d!4821))

(declare-fun mapNonEmpty!1114 () Bool)

(declare-fun mapRes!1114 () Bool)

(declare-fun tp!3634 () Bool)

(declare-fun e!16868 () Bool)

(assert (=> mapNonEmpty!1114 (= mapRes!1114 (and tp!3634 e!16868))))

(declare-fun mapKey!1114 () (_ BitVec 32))

(declare-fun mapValue!1114 () ValueCell!332)

(declare-fun mapRest!1114 () (Array (_ BitVec 32) ValueCell!332))

(assert (=> mapNonEmpty!1114 (= mapRest!1105 (store mapRest!1114 mapKey!1114 mapValue!1114))))

(declare-fun b!25998 () Bool)

(declare-fun e!16867 () Bool)

(assert (=> b!25998 (= e!16867 tp_is_empty!1063)))

(declare-fun condMapEmpty!1114 () Bool)

(declare-fun mapDefault!1114 () ValueCell!332)

(assert (=> mapNonEmpty!1105 (= condMapEmpty!1114 (= mapRest!1105 ((as const (Array (_ BitVec 32) ValueCell!332)) mapDefault!1114)))))

(assert (=> mapNonEmpty!1105 (= tp!3625 (and e!16867 mapRes!1114))))

(declare-fun b!25997 () Bool)

(assert (=> b!25997 (= e!16868 tp_is_empty!1063)))

(declare-fun mapIsEmpty!1114 () Bool)

(assert (=> mapIsEmpty!1114 mapRes!1114))

(assert (= (and mapNonEmpty!1105 condMapEmpty!1114) mapIsEmpty!1114))

(assert (= (and mapNonEmpty!1105 (not condMapEmpty!1114)) mapNonEmpty!1114))

(assert (= (and mapNonEmpty!1114 ((_ is ValueCellFull!332) mapValue!1114)) b!25997))

(assert (= (and mapNonEmpty!1105 ((_ is ValueCellFull!332) mapDefault!1114)) b!25998))

(declare-fun m!20893 () Bool)

(assert (=> mapNonEmpty!1114 m!20893))

(check-sat (not b!25977) (not b!25988) (not bm!2495) (not b!25987) (not mapNonEmpty!1114) tp_is_empty!1063 (not b!25978))
(check-sat)
