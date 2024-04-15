; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35260 () Bool)

(assert start!35260)

(declare-fun mapIsEmpty!13158 () Bool)

(declare-fun mapRes!13158 () Bool)

(assert (=> mapIsEmpty!13158 mapRes!13158))

(declare-fun b!353238 () Bool)

(declare-fun e!216332 () Bool)

(declare-fun tp_is_empty!7777 () Bool)

(assert (=> b!353238 (= e!216332 tp_is_empty!7777)))

(declare-fun b!353239 () Bool)

(declare-fun e!216333 () Bool)

(declare-datatypes ((array!19123 0))(
  ( (array!19124 (arr!9060 (Array (_ BitVec 32) (_ BitVec 64))) (size!9413 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19123)

(assert (=> b!353239 (= e!216333 (bvsgt #b00000000000000000000000000000000 (size!9413 _keys!1456)))))

(declare-fun b!353240 () Bool)

(declare-fun res!195869 () Bool)

(assert (=> b!353240 (=> (not res!195869) (not e!216333))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11347 0))(
  ( (V!11348 (val!3933 Int)) )
))
(declare-datatypes ((ValueCell!3545 0))(
  ( (ValueCellFull!3545 (v!6120 V!11347)) (EmptyCell!3545) )
))
(declare-datatypes ((array!19125 0))(
  ( (array!19126 (arr!9061 (Array (_ BitVec 32) ValueCell!3545)) (size!9414 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19125)

(assert (=> b!353240 (= res!195869 (and (= (size!9414 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9413 _keys!1456) (size!9414 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13158 () Bool)

(declare-fun tp!27054 () Bool)

(declare-fun e!216330 () Bool)

(assert (=> mapNonEmpty!13158 (= mapRes!13158 (and tp!27054 e!216330))))

(declare-fun mapRest!13158 () (Array (_ BitVec 32) ValueCell!3545))

(declare-fun mapKey!13158 () (_ BitVec 32))

(declare-fun mapValue!13158 () ValueCell!3545)

(assert (=> mapNonEmpty!13158 (= (arr!9061 _values!1208) (store mapRest!13158 mapKey!13158 mapValue!13158))))

(declare-fun b!353241 () Bool)

(assert (=> b!353241 (= e!216330 tp_is_empty!7777)))

(declare-fun res!195867 () Bool)

(assert (=> start!35260 (=> (not res!195867) (not e!216333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35260 (= res!195867 (validMask!0 mask!1842))))

(assert (=> start!35260 e!216333))

(assert (=> start!35260 true))

(declare-fun e!216331 () Bool)

(declare-fun array_inv!6704 (array!19125) Bool)

(assert (=> start!35260 (and (array_inv!6704 _values!1208) e!216331)))

(declare-fun array_inv!6705 (array!19123) Bool)

(assert (=> start!35260 (array_inv!6705 _keys!1456)))

(declare-fun b!353242 () Bool)

(assert (=> b!353242 (= e!216331 (and e!216332 mapRes!13158))))

(declare-fun condMapEmpty!13158 () Bool)

(declare-fun mapDefault!13158 () ValueCell!3545)

(assert (=> b!353242 (= condMapEmpty!13158 (= (arr!9061 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3545)) mapDefault!13158)))))

(declare-fun b!353243 () Bool)

(declare-fun res!195868 () Bool)

(assert (=> b!353243 (=> (not res!195868) (not e!216333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19123 (_ BitVec 32)) Bool)

(assert (=> b!353243 (= res!195868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35260 res!195867) b!353240))

(assert (= (and b!353240 res!195869) b!353243))

(assert (= (and b!353243 res!195868) b!353239))

(assert (= (and b!353242 condMapEmpty!13158) mapIsEmpty!13158))

(assert (= (and b!353242 (not condMapEmpty!13158)) mapNonEmpty!13158))

(get-info :version)

(assert (= (and mapNonEmpty!13158 ((_ is ValueCellFull!3545) mapValue!13158)) b!353241))

(assert (= (and b!353242 ((_ is ValueCellFull!3545) mapDefault!13158)) b!353238))

(assert (= start!35260 b!353242))

(declare-fun m!352135 () Bool)

(assert (=> mapNonEmpty!13158 m!352135))

(declare-fun m!352137 () Bool)

(assert (=> start!35260 m!352137))

(declare-fun m!352139 () Bool)

(assert (=> start!35260 m!352139))

(declare-fun m!352141 () Bool)

(assert (=> start!35260 m!352141))

(declare-fun m!352143 () Bool)

(assert (=> b!353243 m!352143))

(check-sat (not start!35260) (not b!353243) (not mapNonEmpty!13158) tp_is_empty!7777)
(check-sat)
(get-model)

(declare-fun d!71415 () Bool)

(assert (=> d!71415 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35260 d!71415))

(declare-fun d!71417 () Bool)

(assert (=> d!71417 (= (array_inv!6704 _values!1208) (bvsge (size!9414 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35260 d!71417))

(declare-fun d!71419 () Bool)

(assert (=> d!71419 (= (array_inv!6705 _keys!1456) (bvsge (size!9413 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35260 d!71419))

(declare-fun bm!27116 () Bool)

(declare-fun call!27119 () Bool)

(assert (=> bm!27116 (= call!27119 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353288 () Bool)

(declare-fun e!216373 () Bool)

(declare-fun e!216371 () Bool)

(assert (=> b!353288 (= e!216373 e!216371)))

(declare-fun lt!165348 () (_ BitVec 64))

(assert (=> b!353288 (= lt!165348 (select (arr!9060 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10904 0))(
  ( (Unit!10905) )
))
(declare-fun lt!165347 () Unit!10904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19123 (_ BitVec 64) (_ BitVec 32)) Unit!10904)

(assert (=> b!353288 (= lt!165347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165348 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353288 (arrayContainsKey!0 _keys!1456 lt!165348 #b00000000000000000000000000000000)))

(declare-fun lt!165346 () Unit!10904)

(assert (=> b!353288 (= lt!165346 lt!165347)))

(declare-fun res!195892 () Bool)

(declare-datatypes ((SeekEntryResult!3481 0))(
  ( (MissingZero!3481 (index!16103 (_ BitVec 32))) (Found!3481 (index!16104 (_ BitVec 32))) (Intermediate!3481 (undefined!4293 Bool) (index!16105 (_ BitVec 32)) (x!35180 (_ BitVec 32))) (Undefined!3481) (MissingVacant!3481 (index!16106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19123 (_ BitVec 32)) SeekEntryResult!3481)

(assert (=> b!353288 (= res!195892 (= (seekEntryOrOpen!0 (select (arr!9060 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3481 #b00000000000000000000000000000000)))))

(assert (=> b!353288 (=> (not res!195892) (not e!216371))))

(declare-fun b!353289 () Bool)

(assert (=> b!353289 (= e!216371 call!27119)))

(declare-fun d!71421 () Bool)

(declare-fun res!195893 () Bool)

(declare-fun e!216372 () Bool)

(assert (=> d!71421 (=> res!195893 e!216372)))

(assert (=> d!71421 (= res!195893 (bvsge #b00000000000000000000000000000000 (size!9413 _keys!1456)))))

(assert (=> d!71421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216372)))

(declare-fun b!353290 () Bool)

(assert (=> b!353290 (= e!216373 call!27119)))

(declare-fun b!353291 () Bool)

(assert (=> b!353291 (= e!216372 e!216373)))

(declare-fun c!53621 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353291 (= c!53621 (validKeyInArray!0 (select (arr!9060 _keys!1456) #b00000000000000000000000000000000)))))

(assert (= (and d!71421 (not res!195893)) b!353291))

(assert (= (and b!353291 c!53621) b!353288))

(assert (= (and b!353291 (not c!53621)) b!353290))

(assert (= (and b!353288 res!195892) b!353289))

(assert (= (or b!353289 b!353290) bm!27116))

(declare-fun m!352165 () Bool)

(assert (=> bm!27116 m!352165))

(declare-fun m!352167 () Bool)

(assert (=> b!353288 m!352167))

(declare-fun m!352169 () Bool)

(assert (=> b!353288 m!352169))

(declare-fun m!352171 () Bool)

(assert (=> b!353288 m!352171))

(assert (=> b!353288 m!352167))

(declare-fun m!352173 () Bool)

(assert (=> b!353288 m!352173))

(assert (=> b!353291 m!352167))

(assert (=> b!353291 m!352167))

(declare-fun m!352175 () Bool)

(assert (=> b!353291 m!352175))

(assert (=> b!353243 d!71421))

(declare-fun b!353298 () Bool)

(declare-fun e!216378 () Bool)

(assert (=> b!353298 (= e!216378 tp_is_empty!7777)))

(declare-fun mapIsEmpty!13167 () Bool)

(declare-fun mapRes!13167 () Bool)

(assert (=> mapIsEmpty!13167 mapRes!13167))

(declare-fun mapNonEmpty!13167 () Bool)

(declare-fun tp!27063 () Bool)

(assert (=> mapNonEmpty!13167 (= mapRes!13167 (and tp!27063 e!216378))))

(declare-fun mapKey!13167 () (_ BitVec 32))

(declare-fun mapValue!13167 () ValueCell!3545)

(declare-fun mapRest!13167 () (Array (_ BitVec 32) ValueCell!3545))

(assert (=> mapNonEmpty!13167 (= mapRest!13158 (store mapRest!13167 mapKey!13167 mapValue!13167))))

(declare-fun condMapEmpty!13167 () Bool)

(declare-fun mapDefault!13167 () ValueCell!3545)

(assert (=> mapNonEmpty!13158 (= condMapEmpty!13167 (= mapRest!13158 ((as const (Array (_ BitVec 32) ValueCell!3545)) mapDefault!13167)))))

(declare-fun e!216379 () Bool)

(assert (=> mapNonEmpty!13158 (= tp!27054 (and e!216379 mapRes!13167))))

(declare-fun b!353299 () Bool)

(assert (=> b!353299 (= e!216379 tp_is_empty!7777)))

(assert (= (and mapNonEmpty!13158 condMapEmpty!13167) mapIsEmpty!13167))

(assert (= (and mapNonEmpty!13158 (not condMapEmpty!13167)) mapNonEmpty!13167))

(assert (= (and mapNonEmpty!13167 ((_ is ValueCellFull!3545) mapValue!13167)) b!353298))

(assert (= (and mapNonEmpty!13158 ((_ is ValueCellFull!3545) mapDefault!13167)) b!353299))

(declare-fun m!352177 () Bool)

(assert (=> mapNonEmpty!13167 m!352177))

(check-sat (not b!353288) (not b!353291) (not bm!27116) tp_is_empty!7777 (not mapNonEmpty!13167))
(check-sat)
