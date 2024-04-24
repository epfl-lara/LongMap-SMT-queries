; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41290 () Bool)

(assert start!41290)

(declare-fun b!461900 () Bool)

(declare-fun res!276304 () Bool)

(declare-fun e!269434 () Bool)

(assert (=> b!461900 (=> (not res!276304) (not e!269434))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28698 0))(
  ( (array!28699 (arr!13785 (Array (_ BitVec 32) (_ BitVec 64))) (size!14137 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28698)

(declare-datatypes ((V!17707 0))(
  ( (V!17708 (val!6270 Int)) )
))
(declare-datatypes ((ValueCell!5882 0))(
  ( (ValueCellFull!5882 (v!8557 V!17707)) (EmptyCell!5882) )
))
(declare-datatypes ((array!28700 0))(
  ( (array!28701 (arr!13786 (Array (_ BitVec 32) ValueCell!5882)) (size!14138 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28700)

(assert (=> b!461900 (= res!276304 (and (= (size!14138 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14137 _keys!1025) (size!14138 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276303 () Bool)

(assert (=> start!41290 (=> (not res!276303) (not e!269434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41290 (= res!276303 (validMask!0 mask!1365))))

(assert (=> start!41290 e!269434))

(assert (=> start!41290 true))

(declare-fun array_inv!10052 (array!28698) Bool)

(assert (=> start!41290 (array_inv!10052 _keys!1025)))

(declare-fun e!269433 () Bool)

(declare-fun array_inv!10053 (array!28700) Bool)

(assert (=> start!41290 (and (array_inv!10053 _values!833) e!269433)))

(declare-fun b!461901 () Bool)

(declare-fun res!276305 () Bool)

(assert (=> b!461901 (=> (not res!276305) (not e!269434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28698 (_ BitVec 32)) Bool)

(assert (=> b!461901 (= res!276305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20338 () Bool)

(declare-fun mapRes!20338 () Bool)

(declare-fun tp!39157 () Bool)

(declare-fun e!269432 () Bool)

(assert (=> mapNonEmpty!20338 (= mapRes!20338 (and tp!39157 e!269432))))

(declare-fun mapValue!20338 () ValueCell!5882)

(declare-fun mapRest!20338 () (Array (_ BitVec 32) ValueCell!5882))

(declare-fun mapKey!20338 () (_ BitVec 32))

(assert (=> mapNonEmpty!20338 (= (arr!13786 _values!833) (store mapRest!20338 mapKey!20338 mapValue!20338))))

(declare-fun b!461902 () Bool)

(declare-fun e!269430 () Bool)

(assert (=> b!461902 (= e!269433 (and e!269430 mapRes!20338))))

(declare-fun condMapEmpty!20338 () Bool)

(declare-fun mapDefault!20338 () ValueCell!5882)

(assert (=> b!461902 (= condMapEmpty!20338 (= (arr!13786 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5882)) mapDefault!20338)))))

(declare-fun b!461903 () Bool)

(declare-fun tp_is_empty!12451 () Bool)

(assert (=> b!461903 (= e!269432 tp_is_empty!12451)))

(declare-fun mapIsEmpty!20338 () Bool)

(assert (=> mapIsEmpty!20338 mapRes!20338))

(declare-fun b!461904 () Bool)

(assert (=> b!461904 (= e!269430 tp_is_empty!12451)))

(declare-fun b!461905 () Bool)

(assert (=> b!461905 (= e!269434 (and (bvsle #b00000000000000000000000000000000 (size!14137 _keys!1025)) (bvsge (size!14137 _keys!1025) #b01111111111111111111111111111111)))))

(assert (= (and start!41290 res!276303) b!461900))

(assert (= (and b!461900 res!276304) b!461901))

(assert (= (and b!461901 res!276305) b!461905))

(assert (= (and b!461902 condMapEmpty!20338) mapIsEmpty!20338))

(assert (= (and b!461902 (not condMapEmpty!20338)) mapNonEmpty!20338))

(get-info :version)

(assert (= (and mapNonEmpty!20338 ((_ is ValueCellFull!5882) mapValue!20338)) b!461903))

(assert (= (and b!461902 ((_ is ValueCellFull!5882) mapDefault!20338)) b!461904))

(assert (= start!41290 b!461902))

(declare-fun m!445253 () Bool)

(assert (=> start!41290 m!445253))

(declare-fun m!445255 () Bool)

(assert (=> start!41290 m!445255))

(declare-fun m!445257 () Bool)

(assert (=> start!41290 m!445257))

(declare-fun m!445259 () Bool)

(assert (=> b!461901 m!445259))

(declare-fun m!445261 () Bool)

(assert (=> mapNonEmpty!20338 m!445261))

(check-sat (not start!41290) (not b!461901) (not mapNonEmpty!20338) tp_is_empty!12451)
(check-sat)
(get-model)

(declare-fun d!74949 () Bool)

(assert (=> d!74949 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41290 d!74949))

(declare-fun d!74951 () Bool)

(assert (=> d!74951 (= (array_inv!10052 _keys!1025) (bvsge (size!14137 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41290 d!74951))

(declare-fun d!74953 () Bool)

(assert (=> d!74953 (= (array_inv!10053 _values!833) (bvsge (size!14138 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41290 d!74953))

(declare-fun b!461950 () Bool)

(declare-fun e!269471 () Bool)

(declare-fun call!30183 () Bool)

(assert (=> b!461950 (= e!269471 call!30183)))

(declare-fun d!74955 () Bool)

(declare-fun res!276329 () Bool)

(declare-fun e!269473 () Bool)

(assert (=> d!74955 (=> res!276329 e!269473)))

(assert (=> d!74955 (= res!276329 (bvsge #b00000000000000000000000000000000 (size!14137 _keys!1025)))))

(assert (=> d!74955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269473)))

(declare-fun bm!30180 () Bool)

(assert (=> bm!30180 (= call!30183 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!461951 () Bool)

(declare-fun e!269472 () Bool)

(assert (=> b!461951 (= e!269471 e!269472)))

(declare-fun lt!209162 () (_ BitVec 64))

(assert (=> b!461951 (= lt!209162 (select (arr!13785 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13436 0))(
  ( (Unit!13437) )
))
(declare-fun lt!209163 () Unit!13436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28698 (_ BitVec 64) (_ BitVec 32)) Unit!13436)

(assert (=> b!461951 (= lt!209163 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209162 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461951 (arrayContainsKey!0 _keys!1025 lt!209162 #b00000000000000000000000000000000)))

(declare-fun lt!209164 () Unit!13436)

(assert (=> b!461951 (= lt!209164 lt!209163)))

(declare-fun res!276328 () Bool)

(declare-datatypes ((SeekEntryResult!3488 0))(
  ( (MissingZero!3488 (index!16131 (_ BitVec 32))) (Found!3488 (index!16132 (_ BitVec 32))) (Intermediate!3488 (undefined!4300 Bool) (index!16133 (_ BitVec 32)) (x!43009 (_ BitVec 32))) (Undefined!3488) (MissingVacant!3488 (index!16134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28698 (_ BitVec 32)) SeekEntryResult!3488)

(assert (=> b!461951 (= res!276328 (= (seekEntryOrOpen!0 (select (arr!13785 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3488 #b00000000000000000000000000000000)))))

(assert (=> b!461951 (=> (not res!276328) (not e!269472))))

(declare-fun b!461952 () Bool)

(assert (=> b!461952 (= e!269473 e!269471)))

(declare-fun c!56595 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461952 (= c!56595 (validKeyInArray!0 (select (arr!13785 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!461953 () Bool)

(assert (=> b!461953 (= e!269472 call!30183)))

(assert (= (and d!74955 (not res!276329)) b!461952))

(assert (= (and b!461952 c!56595) b!461951))

(assert (= (and b!461952 (not c!56595)) b!461950))

(assert (= (and b!461951 res!276328) b!461953))

(assert (= (or b!461953 b!461950) bm!30180))

(declare-fun m!445283 () Bool)

(assert (=> bm!30180 m!445283))

(declare-fun m!445285 () Bool)

(assert (=> b!461951 m!445285))

(declare-fun m!445287 () Bool)

(assert (=> b!461951 m!445287))

(declare-fun m!445289 () Bool)

(assert (=> b!461951 m!445289))

(assert (=> b!461951 m!445285))

(declare-fun m!445291 () Bool)

(assert (=> b!461951 m!445291))

(assert (=> b!461952 m!445285))

(assert (=> b!461952 m!445285))

(declare-fun m!445293 () Bool)

(assert (=> b!461952 m!445293))

(assert (=> b!461901 d!74955))

(declare-fun mapIsEmpty!20347 () Bool)

(declare-fun mapRes!20347 () Bool)

(assert (=> mapIsEmpty!20347 mapRes!20347))

(declare-fun condMapEmpty!20347 () Bool)

(declare-fun mapDefault!20347 () ValueCell!5882)

(assert (=> mapNonEmpty!20338 (= condMapEmpty!20347 (= mapRest!20338 ((as const (Array (_ BitVec 32) ValueCell!5882)) mapDefault!20347)))))

(declare-fun e!269479 () Bool)

(assert (=> mapNonEmpty!20338 (= tp!39157 (and e!269479 mapRes!20347))))

(declare-fun b!461960 () Bool)

(declare-fun e!269478 () Bool)

(assert (=> b!461960 (= e!269478 tp_is_empty!12451)))

(declare-fun mapNonEmpty!20347 () Bool)

(declare-fun tp!39166 () Bool)

(assert (=> mapNonEmpty!20347 (= mapRes!20347 (and tp!39166 e!269478))))

(declare-fun mapValue!20347 () ValueCell!5882)

(declare-fun mapKey!20347 () (_ BitVec 32))

(declare-fun mapRest!20347 () (Array (_ BitVec 32) ValueCell!5882))

(assert (=> mapNonEmpty!20347 (= mapRest!20338 (store mapRest!20347 mapKey!20347 mapValue!20347))))

(declare-fun b!461961 () Bool)

(assert (=> b!461961 (= e!269479 tp_is_empty!12451)))

(assert (= (and mapNonEmpty!20338 condMapEmpty!20347) mapIsEmpty!20347))

(assert (= (and mapNonEmpty!20338 (not condMapEmpty!20347)) mapNonEmpty!20347))

(assert (= (and mapNonEmpty!20347 ((_ is ValueCellFull!5882) mapValue!20347)) b!461960))

(assert (= (and mapNonEmpty!20338 ((_ is ValueCellFull!5882) mapDefault!20347)) b!461961))

(declare-fun m!445295 () Bool)

(assert (=> mapNonEmpty!20347 m!445295))

(check-sat tp_is_empty!12451 (not mapNonEmpty!20347) (not b!461951) (not bm!30180) (not b!461952))
(check-sat)
