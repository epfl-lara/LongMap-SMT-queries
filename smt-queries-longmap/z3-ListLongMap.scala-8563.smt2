; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104552 () Bool)

(assert start!104552)

(declare-fun b!1247017 () Bool)

(declare-fun res!832141 () Bool)

(declare-fun e!707360 () Bool)

(assert (=> b!1247017 (=> (not res!832141) (not e!707360))))

(declare-datatypes ((array!80245 0))(
  ( (array!80246 (arr!38695 (Array (_ BitVec 32) (_ BitVec 64))) (size!39233 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80245)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80245 (_ BitVec 32)) Bool)

(assert (=> b!1247017 (= res!832141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247018 () Bool)

(declare-fun res!832142 () Bool)

(assert (=> b!1247018 (=> (not res!832142) (not e!707360))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47119 0))(
  ( (V!47120 (val!15720 Int)) )
))
(declare-datatypes ((ValueCell!14894 0))(
  ( (ValueCellFull!14894 (v!18414 V!47119)) (EmptyCell!14894) )
))
(declare-datatypes ((array!80247 0))(
  ( (array!80248 (arr!38696 (Array (_ BitVec 32) ValueCell!14894)) (size!39234 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80247)

(assert (=> b!1247018 (= res!832142 (and (= (size!39234 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39233 _keys!1118) (size!39234 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48718 () Bool)

(declare-fun mapRes!48718 () Bool)

(declare-fun tp!92819 () Bool)

(declare-fun e!707363 () Bool)

(assert (=> mapNonEmpty!48718 (= mapRes!48718 (and tp!92819 e!707363))))

(declare-fun mapRest!48718 () (Array (_ BitVec 32) ValueCell!14894))

(declare-fun mapKey!48718 () (_ BitVec 32))

(declare-fun mapValue!48718 () ValueCell!14894)

(assert (=> mapNonEmpty!48718 (= (arr!38696 _values!914) (store mapRest!48718 mapKey!48718 mapValue!48718))))

(declare-fun mapIsEmpty!48718 () Bool)

(assert (=> mapIsEmpty!48718 mapRes!48718))

(declare-fun b!1247019 () Bool)

(declare-fun e!707359 () Bool)

(declare-fun e!707362 () Bool)

(assert (=> b!1247019 (= e!707359 (and e!707362 mapRes!48718))))

(declare-fun condMapEmpty!48718 () Bool)

(declare-fun mapDefault!48718 () ValueCell!14894)

(assert (=> b!1247019 (= condMapEmpty!48718 (= (arr!38696 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14894)) mapDefault!48718)))))

(declare-fun b!1247020 () Bool)

(assert (=> b!1247020 (= e!707360 (and (bvsle #b00000000000000000000000000000000 (size!39233 _keys!1118)) (bvsge (size!39233 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun res!832143 () Bool)

(assert (=> start!104552 (=> (not res!832143) (not e!707360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104552 (= res!832143 (validMask!0 mask!1466))))

(assert (=> start!104552 e!707360))

(assert (=> start!104552 true))

(declare-fun array_inv!29671 (array!80245) Bool)

(assert (=> start!104552 (array_inv!29671 _keys!1118)))

(declare-fun array_inv!29672 (array!80247) Bool)

(assert (=> start!104552 (and (array_inv!29672 _values!914) e!707359)))

(declare-fun b!1247021 () Bool)

(declare-fun tp_is_empty!31315 () Bool)

(assert (=> b!1247021 (= e!707362 tp_is_empty!31315)))

(declare-fun b!1247022 () Bool)

(assert (=> b!1247022 (= e!707363 tp_is_empty!31315)))

(assert (= (and start!104552 res!832143) b!1247018))

(assert (= (and b!1247018 res!832142) b!1247017))

(assert (= (and b!1247017 res!832141) b!1247020))

(assert (= (and b!1247019 condMapEmpty!48718) mapIsEmpty!48718))

(assert (= (and b!1247019 (not condMapEmpty!48718)) mapNonEmpty!48718))

(get-info :version)

(assert (= (and mapNonEmpty!48718 ((_ is ValueCellFull!14894) mapValue!48718)) b!1247022))

(assert (= (and b!1247019 ((_ is ValueCellFull!14894) mapDefault!48718)) b!1247021))

(assert (= start!104552 b!1247019))

(declare-fun m!1148213 () Bool)

(assert (=> b!1247017 m!1148213))

(declare-fun m!1148215 () Bool)

(assert (=> mapNonEmpty!48718 m!1148215))

(declare-fun m!1148217 () Bool)

(assert (=> start!104552 m!1148217))

(declare-fun m!1148219 () Bool)

(assert (=> start!104552 m!1148219))

(declare-fun m!1148221 () Bool)

(assert (=> start!104552 m!1148221))

(check-sat (not start!104552) (not b!1247017) (not mapNonEmpty!48718) tp_is_empty!31315)
(check-sat)
(get-model)

(declare-fun d!137599 () Bool)

(assert (=> d!137599 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104552 d!137599))

(declare-fun d!137601 () Bool)

(assert (=> d!137601 (= (array_inv!29671 _keys!1118) (bvsge (size!39233 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104552 d!137601))

(declare-fun d!137603 () Bool)

(assert (=> d!137603 (= (array_inv!29672 _values!914) (bvsge (size!39234 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104552 d!137603))

(declare-fun b!1247067 () Bool)

(declare-fun e!707400 () Bool)

(declare-fun e!707401 () Bool)

(assert (=> b!1247067 (= e!707400 e!707401)))

(declare-fun lt!563047 () (_ BitVec 64))

(assert (=> b!1247067 (= lt!563047 (select (arr!38695 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41312 0))(
  ( (Unit!41313) )
))
(declare-fun lt!563045 () Unit!41312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80245 (_ BitVec 64) (_ BitVec 32)) Unit!41312)

(assert (=> b!1247067 (= lt!563045 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563047 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247067 (arrayContainsKey!0 _keys!1118 lt!563047 #b00000000000000000000000000000000)))

(declare-fun lt!563046 () Unit!41312)

(assert (=> b!1247067 (= lt!563046 lt!563045)))

(declare-fun res!832167 () Bool)

(declare-datatypes ((SeekEntryResult!9952 0))(
  ( (MissingZero!9952 (index!42179 (_ BitVec 32))) (Found!9952 (index!42180 (_ BitVec 32))) (Intermediate!9952 (undefined!10764 Bool) (index!42181 (_ BitVec 32)) (x!109580 (_ BitVec 32))) (Undefined!9952) (MissingVacant!9952 (index!42182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80245 (_ BitVec 32)) SeekEntryResult!9952)

(assert (=> b!1247067 (= res!832167 (= (seekEntryOrOpen!0 (select (arr!38695 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9952 #b00000000000000000000000000000000)))))

(assert (=> b!1247067 (=> (not res!832167) (not e!707401))))

(declare-fun b!1247068 () Bool)

(declare-fun call!61538 () Bool)

(assert (=> b!1247068 (= e!707401 call!61538)))

(declare-fun d!137605 () Bool)

(declare-fun res!832166 () Bool)

(declare-fun e!707402 () Bool)

(assert (=> d!137605 (=> res!832166 e!707402)))

(assert (=> d!137605 (= res!832166 (bvsge #b00000000000000000000000000000000 (size!39233 _keys!1118)))))

(assert (=> d!137605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707402)))

(declare-fun bm!61535 () Bool)

(assert (=> bm!61535 (= call!61538 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1247069 () Bool)

(assert (=> b!1247069 (= e!707402 e!707400)))

(declare-fun c!122076 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247069 (= c!122076 (validKeyInArray!0 (select (arr!38695 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1247070 () Bool)

(assert (=> b!1247070 (= e!707400 call!61538)))

(assert (= (and d!137605 (not res!832166)) b!1247069))

(assert (= (and b!1247069 c!122076) b!1247067))

(assert (= (and b!1247069 (not c!122076)) b!1247070))

(assert (= (and b!1247067 res!832167) b!1247068))

(assert (= (or b!1247068 b!1247070) bm!61535))

(declare-fun m!1148243 () Bool)

(assert (=> b!1247067 m!1148243))

(declare-fun m!1148245 () Bool)

(assert (=> b!1247067 m!1148245))

(declare-fun m!1148247 () Bool)

(assert (=> b!1247067 m!1148247))

(assert (=> b!1247067 m!1148243))

(declare-fun m!1148249 () Bool)

(assert (=> b!1247067 m!1148249))

(declare-fun m!1148251 () Bool)

(assert (=> bm!61535 m!1148251))

(assert (=> b!1247069 m!1148243))

(assert (=> b!1247069 m!1148243))

(declare-fun m!1148253 () Bool)

(assert (=> b!1247069 m!1148253))

(assert (=> b!1247017 d!137605))

(declare-fun b!1247077 () Bool)

(declare-fun e!707408 () Bool)

(assert (=> b!1247077 (= e!707408 tp_is_empty!31315)))

(declare-fun b!1247078 () Bool)

(declare-fun e!707407 () Bool)

(assert (=> b!1247078 (= e!707407 tp_is_empty!31315)))

(declare-fun mapIsEmpty!48727 () Bool)

(declare-fun mapRes!48727 () Bool)

(assert (=> mapIsEmpty!48727 mapRes!48727))

(declare-fun condMapEmpty!48727 () Bool)

(declare-fun mapDefault!48727 () ValueCell!14894)

(assert (=> mapNonEmpty!48718 (= condMapEmpty!48727 (= mapRest!48718 ((as const (Array (_ BitVec 32) ValueCell!14894)) mapDefault!48727)))))

(assert (=> mapNonEmpty!48718 (= tp!92819 (and e!707407 mapRes!48727))))

(declare-fun mapNonEmpty!48727 () Bool)

(declare-fun tp!92828 () Bool)

(assert (=> mapNonEmpty!48727 (= mapRes!48727 (and tp!92828 e!707408))))

(declare-fun mapKey!48727 () (_ BitVec 32))

(declare-fun mapRest!48727 () (Array (_ BitVec 32) ValueCell!14894))

(declare-fun mapValue!48727 () ValueCell!14894)

(assert (=> mapNonEmpty!48727 (= mapRest!48718 (store mapRest!48727 mapKey!48727 mapValue!48727))))

(assert (= (and mapNonEmpty!48718 condMapEmpty!48727) mapIsEmpty!48727))

(assert (= (and mapNonEmpty!48718 (not condMapEmpty!48727)) mapNonEmpty!48727))

(assert (= (and mapNonEmpty!48727 ((_ is ValueCellFull!14894) mapValue!48727)) b!1247077))

(assert (= (and mapNonEmpty!48718 ((_ is ValueCellFull!14894) mapDefault!48727)) b!1247078))

(declare-fun m!1148255 () Bool)

(assert (=> mapNonEmpty!48727 m!1148255))

(check-sat (not bm!61535) (not b!1247067) (not b!1247069) (not mapNonEmpty!48727) tp_is_empty!31315)
(check-sat)
