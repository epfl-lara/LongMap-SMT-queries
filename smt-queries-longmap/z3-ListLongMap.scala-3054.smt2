; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43122 () Bool)

(assert start!43122)

(declare-fun b!478093 () Bool)

(declare-fun e!281063 () Bool)

(declare-datatypes ((array!30775 0))(
  ( (array!30776 (arr!14798 (Array (_ BitVec 32) (_ BitVec 64))) (size!15157 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30775)

(assert (=> b!478093 (= e!281063 (and (bvsle #b00000000000000000000000000000000 (size!15157 _keys!1874)) (bvsge (size!15157 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun b!478094 () Bool)

(declare-fun res!285285 () Bool)

(assert (=> b!478094 (=> (not res!285285) (not e!281063))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30775 (_ BitVec 32)) Bool)

(assert (=> b!478094 (= res!285285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22018 () Bool)

(declare-fun mapRes!22018 () Bool)

(assert (=> mapIsEmpty!22018 mapRes!22018))

(declare-fun mapNonEmpty!22018 () Bool)

(declare-fun tp!42493 () Bool)

(declare-fun e!281062 () Bool)

(assert (=> mapNonEmpty!22018 (= mapRes!22018 (and tp!42493 e!281062))))

(declare-fun mapKey!22018 () (_ BitVec 32))

(declare-datatypes ((V!19145 0))(
  ( (V!19146 (val!6825 Int)) )
))
(declare-datatypes ((ValueCell!6416 0))(
  ( (ValueCellFull!6416 (v!9107 V!19145)) (EmptyCell!6416) )
))
(declare-fun mapValue!22018 () ValueCell!6416)

(declare-fun mapRest!22018 () (Array (_ BitVec 32) ValueCell!6416))

(declare-datatypes ((array!30777 0))(
  ( (array!30778 (arr!14799 (Array (_ BitVec 32) ValueCell!6416)) (size!15158 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30777)

(assert (=> mapNonEmpty!22018 (= (arr!14799 _values!1516) (store mapRest!22018 mapKey!22018 mapValue!22018))))

(declare-fun res!285284 () Bool)

(assert (=> start!43122 (=> (not res!285284) (not e!281063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43122 (= res!285284 (validMask!0 mask!2352))))

(assert (=> start!43122 e!281063))

(assert (=> start!43122 true))

(declare-fun e!281061 () Bool)

(declare-fun array_inv!10762 (array!30777) Bool)

(assert (=> start!43122 (and (array_inv!10762 _values!1516) e!281061)))

(declare-fun array_inv!10763 (array!30775) Bool)

(assert (=> start!43122 (array_inv!10763 _keys!1874)))

(declare-fun b!478095 () Bool)

(declare-fun tp_is_empty!13555 () Bool)

(assert (=> b!478095 (= e!281062 tp_is_empty!13555)))

(declare-fun b!478096 () Bool)

(declare-fun e!281064 () Bool)

(assert (=> b!478096 (= e!281064 tp_is_empty!13555)))

(declare-fun b!478097 () Bool)

(assert (=> b!478097 (= e!281061 (and e!281064 mapRes!22018))))

(declare-fun condMapEmpty!22018 () Bool)

(declare-fun mapDefault!22018 () ValueCell!6416)

(assert (=> b!478097 (= condMapEmpty!22018 (= (arr!14799 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6416)) mapDefault!22018)))))

(declare-fun b!478098 () Bool)

(declare-fun res!285286 () Bool)

(assert (=> b!478098 (=> (not res!285286) (not e!281063))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478098 (= res!285286 (and (= (size!15158 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15157 _keys!1874) (size!15158 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43122 res!285284) b!478098))

(assert (= (and b!478098 res!285286) b!478094))

(assert (= (and b!478094 res!285285) b!478093))

(assert (= (and b!478097 condMapEmpty!22018) mapIsEmpty!22018))

(assert (= (and b!478097 (not condMapEmpty!22018)) mapNonEmpty!22018))

(get-info :version)

(assert (= (and mapNonEmpty!22018 ((_ is ValueCellFull!6416) mapValue!22018)) b!478095))

(assert (= (and b!478097 ((_ is ValueCellFull!6416) mapDefault!22018)) b!478096))

(assert (= start!43122 b!478097))

(declare-fun m!459933 () Bool)

(assert (=> b!478094 m!459933))

(declare-fun m!459935 () Bool)

(assert (=> mapNonEmpty!22018 m!459935))

(declare-fun m!459937 () Bool)

(assert (=> start!43122 m!459937))

(declare-fun m!459939 () Bool)

(assert (=> start!43122 m!459939))

(declare-fun m!459941 () Bool)

(assert (=> start!43122 m!459941))

(check-sat (not start!43122) (not b!478094) (not mapNonEmpty!22018) tp_is_empty!13555)
(check-sat)
(get-model)

(declare-fun d!76395 () Bool)

(assert (=> d!76395 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43122 d!76395))

(declare-fun d!76397 () Bool)

(assert (=> d!76397 (= (array_inv!10762 _values!1516) (bvsge (size!15158 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43122 d!76397))

(declare-fun d!76399 () Bool)

(assert (=> d!76399 (= (array_inv!10763 _keys!1874) (bvsge (size!15157 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43122 d!76399))

(declare-fun d!76401 () Bool)

(declare-fun res!285309 () Bool)

(declare-fun e!281103 () Bool)

(assert (=> d!76401 (=> res!285309 e!281103)))

(assert (=> d!76401 (= res!285309 (bvsge #b00000000000000000000000000000000 (size!15157 _keys!1874)))))

(assert (=> d!76401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281103)))

(declare-fun b!478143 () Bool)

(declare-fun e!281102 () Bool)

(assert (=> b!478143 (= e!281103 e!281102)))

(declare-fun c!57593 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478143 (= c!57593 (validKeyInArray!0 (select (arr!14798 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478144 () Bool)

(declare-fun e!281104 () Bool)

(declare-fun call!30810 () Bool)

(assert (=> b!478144 (= e!281104 call!30810)))

(declare-fun b!478145 () Bool)

(assert (=> b!478145 (= e!281102 call!30810)))

(declare-fun b!478146 () Bool)

(assert (=> b!478146 (= e!281102 e!281104)))

(declare-fun lt!217483 () (_ BitVec 64))

(assert (=> b!478146 (= lt!217483 (select (arr!14798 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14040 0))(
  ( (Unit!14041) )
))
(declare-fun lt!217485 () Unit!14040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30775 (_ BitVec 64) (_ BitVec 32)) Unit!14040)

(assert (=> b!478146 (= lt!217485 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217483 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478146 (arrayContainsKey!0 _keys!1874 lt!217483 #b00000000000000000000000000000000)))

(declare-fun lt!217484 () Unit!14040)

(assert (=> b!478146 (= lt!217484 lt!217485)))

(declare-fun res!285310 () Bool)

(declare-datatypes ((SeekEntryResult!3559 0))(
  ( (MissingZero!3559 (index!16415 (_ BitVec 32))) (Found!3559 (index!16416 (_ BitVec 32))) (Intermediate!3559 (undefined!4371 Bool) (index!16417 (_ BitVec 32)) (x!44884 (_ BitVec 32))) (Undefined!3559) (MissingVacant!3559 (index!16418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30775 (_ BitVec 32)) SeekEntryResult!3559)

(assert (=> b!478146 (= res!285310 (= (seekEntryOrOpen!0 (select (arr!14798 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3559 #b00000000000000000000000000000000)))))

(assert (=> b!478146 (=> (not res!285310) (not e!281104))))

(declare-fun bm!30807 () Bool)

(assert (=> bm!30807 (= call!30810 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76401 (not res!285309)) b!478143))

(assert (= (and b!478143 c!57593) b!478146))

(assert (= (and b!478143 (not c!57593)) b!478145))

(assert (= (and b!478146 res!285310) b!478144))

(assert (= (or b!478144 b!478145) bm!30807))

(declare-fun m!459963 () Bool)

(assert (=> b!478143 m!459963))

(assert (=> b!478143 m!459963))

(declare-fun m!459965 () Bool)

(assert (=> b!478143 m!459965))

(assert (=> b!478146 m!459963))

(declare-fun m!459967 () Bool)

(assert (=> b!478146 m!459967))

(declare-fun m!459969 () Bool)

(assert (=> b!478146 m!459969))

(assert (=> b!478146 m!459963))

(declare-fun m!459971 () Bool)

(assert (=> b!478146 m!459971))

(declare-fun m!459973 () Bool)

(assert (=> bm!30807 m!459973))

(assert (=> b!478094 d!76401))

(declare-fun mapIsEmpty!22027 () Bool)

(declare-fun mapRes!22027 () Bool)

(assert (=> mapIsEmpty!22027 mapRes!22027))

(declare-fun b!478154 () Bool)

(declare-fun e!281110 () Bool)

(assert (=> b!478154 (= e!281110 tp_is_empty!13555)))

(declare-fun b!478153 () Bool)

(declare-fun e!281109 () Bool)

(assert (=> b!478153 (= e!281109 tp_is_empty!13555)))

(declare-fun condMapEmpty!22027 () Bool)

(declare-fun mapDefault!22027 () ValueCell!6416)

(assert (=> mapNonEmpty!22018 (= condMapEmpty!22027 (= mapRest!22018 ((as const (Array (_ BitVec 32) ValueCell!6416)) mapDefault!22027)))))

(assert (=> mapNonEmpty!22018 (= tp!42493 (and e!281110 mapRes!22027))))

(declare-fun mapNonEmpty!22027 () Bool)

(declare-fun tp!42502 () Bool)

(assert (=> mapNonEmpty!22027 (= mapRes!22027 (and tp!42502 e!281109))))

(declare-fun mapValue!22027 () ValueCell!6416)

(declare-fun mapRest!22027 () (Array (_ BitVec 32) ValueCell!6416))

(declare-fun mapKey!22027 () (_ BitVec 32))

(assert (=> mapNonEmpty!22027 (= mapRest!22018 (store mapRest!22027 mapKey!22027 mapValue!22027))))

(assert (= (and mapNonEmpty!22018 condMapEmpty!22027) mapIsEmpty!22027))

(assert (= (and mapNonEmpty!22018 (not condMapEmpty!22027)) mapNonEmpty!22027))

(assert (= (and mapNonEmpty!22027 ((_ is ValueCellFull!6416) mapValue!22027)) b!478153))

(assert (= (and mapNonEmpty!22018 ((_ is ValueCellFull!6416) mapDefault!22027)) b!478154))

(declare-fun m!459975 () Bool)

(assert (=> mapNonEmpty!22027 m!459975))

(check-sat tp_is_empty!13555 (not b!478146) (not bm!30807) (not b!478143) (not mapNonEmpty!22027))
(check-sat)
