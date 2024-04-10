; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110374 () Bool)

(assert start!110374)

(declare-fun b!1306182 () Bool)

(declare-fun e!745127 () Bool)

(declare-datatypes ((array!86966 0))(
  ( (array!86967 (arr!41967 (Array (_ BitVec 32) (_ BitVec 64))) (size!42517 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86966)

(assert (=> b!1306182 (= e!745127 (bvsgt #b00000000000000000000000000000000 (size!42517 _keys!1628)))))

(declare-fun b!1306183 () Bool)

(declare-fun res!867172 () Bool)

(assert (=> b!1306183 (=> (not res!867172) (not e!745127))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86966 (_ BitVec 32)) Bool)

(assert (=> b!1306183 (= res!867172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306184 () Bool)

(declare-fun e!745125 () Bool)

(declare-fun tp_is_empty!34977 () Bool)

(assert (=> b!1306184 (= e!745125 tp_is_empty!34977)))

(declare-fun b!1306185 () Bool)

(declare-fun e!745124 () Bool)

(declare-fun mapRes!54082 () Bool)

(assert (=> b!1306185 (= e!745124 (and e!745125 mapRes!54082))))

(declare-fun condMapEmpty!54082 () Bool)

(declare-datatypes ((V!51739 0))(
  ( (V!51740 (val!17563 Int)) )
))
(declare-datatypes ((ValueCell!16590 0))(
  ( (ValueCellFull!16590 (v!20189 V!51739)) (EmptyCell!16590) )
))
(declare-datatypes ((array!86968 0))(
  ( (array!86969 (arr!41968 (Array (_ BitVec 32) ValueCell!16590)) (size!42518 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86968)

(declare-fun mapDefault!54082 () ValueCell!16590)

(assert (=> b!1306185 (= condMapEmpty!54082 (= (arr!41968 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16590)) mapDefault!54082)))))

(declare-fun res!867171 () Bool)

(assert (=> start!110374 (=> (not res!867171) (not e!745127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110374 (= res!867171 (validMask!0 mask!2040))))

(assert (=> start!110374 e!745127))

(assert (=> start!110374 true))

(declare-fun array_inv!31731 (array!86968) Bool)

(assert (=> start!110374 (and (array_inv!31731 _values!1354) e!745124)))

(declare-fun array_inv!31732 (array!86966) Bool)

(assert (=> start!110374 (array_inv!31732 _keys!1628)))

(declare-fun mapNonEmpty!54082 () Bool)

(declare-fun tp!103162 () Bool)

(declare-fun e!745128 () Bool)

(assert (=> mapNonEmpty!54082 (= mapRes!54082 (and tp!103162 e!745128))))

(declare-fun mapValue!54082 () ValueCell!16590)

(declare-fun mapRest!54082 () (Array (_ BitVec 32) ValueCell!16590))

(declare-fun mapKey!54082 () (_ BitVec 32))

(assert (=> mapNonEmpty!54082 (= (arr!41968 _values!1354) (store mapRest!54082 mapKey!54082 mapValue!54082))))

(declare-fun mapIsEmpty!54082 () Bool)

(assert (=> mapIsEmpty!54082 mapRes!54082))

(declare-fun b!1306186 () Bool)

(declare-fun res!867170 () Bool)

(assert (=> b!1306186 (=> (not res!867170) (not e!745127))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306186 (= res!867170 (and (= (size!42518 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42517 _keys!1628) (size!42518 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306187 () Bool)

(assert (=> b!1306187 (= e!745128 tp_is_empty!34977)))

(assert (= (and start!110374 res!867171) b!1306186))

(assert (= (and b!1306186 res!867170) b!1306183))

(assert (= (and b!1306183 res!867172) b!1306182))

(assert (= (and b!1306185 condMapEmpty!54082) mapIsEmpty!54082))

(assert (= (and b!1306185 (not condMapEmpty!54082)) mapNonEmpty!54082))

(get-info :version)

(assert (= (and mapNonEmpty!54082 ((_ is ValueCellFull!16590) mapValue!54082)) b!1306187))

(assert (= (and b!1306185 ((_ is ValueCellFull!16590) mapDefault!54082)) b!1306184))

(assert (= start!110374 b!1306185))

(declare-fun m!1197317 () Bool)

(assert (=> b!1306183 m!1197317))

(declare-fun m!1197319 () Bool)

(assert (=> start!110374 m!1197319))

(declare-fun m!1197321 () Bool)

(assert (=> start!110374 m!1197321))

(declare-fun m!1197323 () Bool)

(assert (=> start!110374 m!1197323))

(declare-fun m!1197325 () Bool)

(assert (=> mapNonEmpty!54082 m!1197325))

(check-sat (not b!1306183) (not start!110374) (not mapNonEmpty!54082) tp_is_empty!34977)
(check-sat)
(get-model)

(declare-fun b!1306214 () Bool)

(declare-fun e!745152 () Bool)

(declare-fun e!745151 () Bool)

(assert (=> b!1306214 (= e!745152 e!745151)))

(declare-fun c!125538 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306214 (= c!125538 (validKeyInArray!0 (select (arr!41967 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun bm!64620 () Bool)

(declare-fun call!64623 () Bool)

(assert (=> bm!64620 (= call!64623 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1306215 () Bool)

(declare-fun e!745150 () Bool)

(assert (=> b!1306215 (= e!745151 e!745150)))

(declare-fun lt!584897 () (_ BitVec 64))

(assert (=> b!1306215 (= lt!584897 (select (arr!41967 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43266 0))(
  ( (Unit!43267) )
))
(declare-fun lt!584896 () Unit!43266)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86966 (_ BitVec 64) (_ BitVec 32)) Unit!43266)

(assert (=> b!1306215 (= lt!584896 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!584897 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306215 (arrayContainsKey!0 _keys!1628 lt!584897 #b00000000000000000000000000000000)))

(declare-fun lt!584895 () Unit!43266)

(assert (=> b!1306215 (= lt!584895 lt!584896)))

(declare-fun res!867187 () Bool)

(declare-datatypes ((SeekEntryResult!10031 0))(
  ( (MissingZero!10031 (index!42495 (_ BitVec 32))) (Found!10031 (index!42496 (_ BitVec 32))) (Intermediate!10031 (undefined!10843 Bool) (index!42497 (_ BitVec 32)) (x!115997 (_ BitVec 32))) (Undefined!10031) (MissingVacant!10031 (index!42498 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86966 (_ BitVec 32)) SeekEntryResult!10031)

(assert (=> b!1306215 (= res!867187 (= (seekEntryOrOpen!0 (select (arr!41967 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10031 #b00000000000000000000000000000000)))))

(assert (=> b!1306215 (=> (not res!867187) (not e!745150))))

(declare-fun b!1306216 () Bool)

(assert (=> b!1306216 (= e!745151 call!64623)))

(declare-fun d!142223 () Bool)

(declare-fun res!867186 () Bool)

(assert (=> d!142223 (=> res!867186 e!745152)))

(assert (=> d!142223 (= res!867186 (bvsge #b00000000000000000000000000000000 (size!42517 _keys!1628)))))

(assert (=> d!142223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745152)))

(declare-fun b!1306217 () Bool)

(assert (=> b!1306217 (= e!745150 call!64623)))

(assert (= (and d!142223 (not res!867186)) b!1306214))

(assert (= (and b!1306214 c!125538) b!1306215))

(assert (= (and b!1306214 (not c!125538)) b!1306216))

(assert (= (and b!1306215 res!867187) b!1306217))

(assert (= (or b!1306217 b!1306216) bm!64620))

(declare-fun m!1197337 () Bool)

(assert (=> b!1306214 m!1197337))

(assert (=> b!1306214 m!1197337))

(declare-fun m!1197339 () Bool)

(assert (=> b!1306214 m!1197339))

(declare-fun m!1197341 () Bool)

(assert (=> bm!64620 m!1197341))

(assert (=> b!1306215 m!1197337))

(declare-fun m!1197343 () Bool)

(assert (=> b!1306215 m!1197343))

(declare-fun m!1197345 () Bool)

(assert (=> b!1306215 m!1197345))

(assert (=> b!1306215 m!1197337))

(declare-fun m!1197347 () Bool)

(assert (=> b!1306215 m!1197347))

(assert (=> b!1306183 d!142223))

(declare-fun d!142225 () Bool)

(assert (=> d!142225 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110374 d!142225))

(declare-fun d!142227 () Bool)

(assert (=> d!142227 (= (array_inv!31731 _values!1354) (bvsge (size!42518 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110374 d!142227))

(declare-fun d!142229 () Bool)

(assert (=> d!142229 (= (array_inv!31732 _keys!1628) (bvsge (size!42517 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110374 d!142229))

(declare-fun b!1306224 () Bool)

(declare-fun e!745158 () Bool)

(assert (=> b!1306224 (= e!745158 tp_is_empty!34977)))

(declare-fun mapIsEmpty!54088 () Bool)

(declare-fun mapRes!54088 () Bool)

(assert (=> mapIsEmpty!54088 mapRes!54088))

(declare-fun condMapEmpty!54088 () Bool)

(declare-fun mapDefault!54088 () ValueCell!16590)

(assert (=> mapNonEmpty!54082 (= condMapEmpty!54088 (= mapRest!54082 ((as const (Array (_ BitVec 32) ValueCell!16590)) mapDefault!54088)))))

(declare-fun e!745157 () Bool)

(assert (=> mapNonEmpty!54082 (= tp!103162 (and e!745157 mapRes!54088))))

(declare-fun b!1306225 () Bool)

(assert (=> b!1306225 (= e!745157 tp_is_empty!34977)))

(declare-fun mapNonEmpty!54088 () Bool)

(declare-fun tp!103168 () Bool)

(assert (=> mapNonEmpty!54088 (= mapRes!54088 (and tp!103168 e!745158))))

(declare-fun mapValue!54088 () ValueCell!16590)

(declare-fun mapKey!54088 () (_ BitVec 32))

(declare-fun mapRest!54088 () (Array (_ BitVec 32) ValueCell!16590))

(assert (=> mapNonEmpty!54088 (= mapRest!54082 (store mapRest!54088 mapKey!54088 mapValue!54088))))

(assert (= (and mapNonEmpty!54082 condMapEmpty!54088) mapIsEmpty!54088))

(assert (= (and mapNonEmpty!54082 (not condMapEmpty!54088)) mapNonEmpty!54088))

(assert (= (and mapNonEmpty!54088 ((_ is ValueCellFull!16590) mapValue!54088)) b!1306224))

(assert (= (and mapNonEmpty!54082 ((_ is ValueCellFull!16590) mapDefault!54088)) b!1306225))

(declare-fun m!1197349 () Bool)

(assert (=> mapNonEmpty!54088 m!1197349))

(check-sat (not b!1306215) (not bm!64620) (not mapNonEmpty!54088) (not b!1306214) tp_is_empty!34977)
(check-sat)
