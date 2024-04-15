; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41290 () Bool)

(assert start!41290)

(declare-fun b!461690 () Bool)

(declare-fun res!276182 () Bool)

(declare-fun e!269299 () Bool)

(assert (=> b!461690 (=> (not res!276182) (not e!269299))))

(declare-datatypes ((array!28697 0))(
  ( (array!28698 (arr!13785 (Array (_ BitVec 32) (_ BitVec 64))) (size!14138 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28697)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28697 (_ BitVec 32)) Bool)

(assert (=> b!461690 (= res!276182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!461691 () Bool)

(declare-fun e!269296 () Bool)

(declare-fun tp_is_empty!12451 () Bool)

(assert (=> b!461691 (= e!269296 tp_is_empty!12451)))

(declare-fun b!461692 () Bool)

(declare-fun e!269298 () Bool)

(declare-fun e!269295 () Bool)

(declare-fun mapRes!20338 () Bool)

(assert (=> b!461692 (= e!269298 (and e!269295 mapRes!20338))))

(declare-fun condMapEmpty!20338 () Bool)

(declare-datatypes ((V!17707 0))(
  ( (V!17708 (val!6270 Int)) )
))
(declare-datatypes ((ValueCell!5882 0))(
  ( (ValueCellFull!5882 (v!8550 V!17707)) (EmptyCell!5882) )
))
(declare-datatypes ((array!28699 0))(
  ( (array!28700 (arr!13786 (Array (_ BitVec 32) ValueCell!5882)) (size!14139 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28699)

(declare-fun mapDefault!20338 () ValueCell!5882)

(assert (=> b!461692 (= condMapEmpty!20338 (= (arr!13786 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5882)) mapDefault!20338)))))

(declare-fun mapIsEmpty!20338 () Bool)

(assert (=> mapIsEmpty!20338 mapRes!20338))

(declare-fun b!461694 () Bool)

(assert (=> b!461694 (= e!269295 tp_is_empty!12451)))

(declare-fun b!461695 () Bool)

(declare-fun res!276183 () Bool)

(assert (=> b!461695 (=> (not res!276183) (not e!269299))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461695 (= res!276183 (and (= (size!14139 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14138 _keys!1025) (size!14139 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20338 () Bool)

(declare-fun tp!39157 () Bool)

(assert (=> mapNonEmpty!20338 (= mapRes!20338 (and tp!39157 e!269296))))

(declare-fun mapKey!20338 () (_ BitVec 32))

(declare-fun mapRest!20338 () (Array (_ BitVec 32) ValueCell!5882))

(declare-fun mapValue!20338 () ValueCell!5882)

(assert (=> mapNonEmpty!20338 (= (arr!13786 _values!833) (store mapRest!20338 mapKey!20338 mapValue!20338))))

(declare-fun b!461693 () Bool)

(assert (=> b!461693 (= e!269299 (and (bvsle #b00000000000000000000000000000000 (size!14138 _keys!1025)) (bvsge (size!14138 _keys!1025) #b01111111111111111111111111111111)))))

(declare-fun res!276181 () Bool)

(assert (=> start!41290 (=> (not res!276181) (not e!269299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41290 (= res!276181 (validMask!0 mask!1365))))

(assert (=> start!41290 e!269299))

(assert (=> start!41290 true))

(declare-fun array_inv!10038 (array!28697) Bool)

(assert (=> start!41290 (array_inv!10038 _keys!1025)))

(declare-fun array_inv!10039 (array!28699) Bool)

(assert (=> start!41290 (and (array_inv!10039 _values!833) e!269298)))

(assert (= (and start!41290 res!276181) b!461695))

(assert (= (and b!461695 res!276183) b!461690))

(assert (= (and b!461690 res!276182) b!461693))

(assert (= (and b!461692 condMapEmpty!20338) mapIsEmpty!20338))

(assert (= (and b!461692 (not condMapEmpty!20338)) mapNonEmpty!20338))

(get-info :version)

(assert (= (and mapNonEmpty!20338 ((_ is ValueCellFull!5882) mapValue!20338)) b!461691))

(assert (= (and b!461692 ((_ is ValueCellFull!5882) mapDefault!20338)) b!461694))

(assert (= start!41290 b!461692))

(declare-fun m!444337 () Bool)

(assert (=> b!461690 m!444337))

(declare-fun m!444339 () Bool)

(assert (=> mapNonEmpty!20338 m!444339))

(declare-fun m!444341 () Bool)

(assert (=> start!41290 m!444341))

(declare-fun m!444343 () Bool)

(assert (=> start!41290 m!444343))

(declare-fun m!444345 () Bool)

(assert (=> start!41290 m!444345))

(check-sat (not b!461690) (not start!41290) (not mapNonEmpty!20338) tp_is_empty!12451)
(check-sat)
(get-model)

(declare-fun b!461740 () Bool)

(declare-fun e!269336 () Bool)

(declare-fun call!30172 () Bool)

(assert (=> b!461740 (= e!269336 call!30172)))

(declare-fun bm!30169 () Bool)

(assert (=> bm!30169 (= call!30172 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!461741 () Bool)

(declare-fun e!269338 () Bool)

(assert (=> b!461741 (= e!269338 e!269336)))

(declare-fun lt!208917 () (_ BitVec 64))

(assert (=> b!461741 (= lt!208917 (select (arr!13785 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13410 0))(
  ( (Unit!13411) )
))
(declare-fun lt!208918 () Unit!13410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28697 (_ BitVec 64) (_ BitVec 32)) Unit!13410)

(assert (=> b!461741 (= lt!208918 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!208917 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461741 (arrayContainsKey!0 _keys!1025 lt!208917 #b00000000000000000000000000000000)))

(declare-fun lt!208916 () Unit!13410)

(assert (=> b!461741 (= lt!208916 lt!208918)))

(declare-fun res!276207 () Bool)

(declare-datatypes ((SeekEntryResult!3534 0))(
  ( (MissingZero!3534 (index!16315 (_ BitVec 32))) (Found!3534 (index!16316 (_ BitVec 32))) (Intermediate!3534 (undefined!4346 Bool) (index!16317 (_ BitVec 32)) (x!43053 (_ BitVec 32))) (Undefined!3534) (MissingVacant!3534 (index!16318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28697 (_ BitVec 32)) SeekEntryResult!3534)

(assert (=> b!461741 (= res!276207 (= (seekEntryOrOpen!0 (select (arr!13785 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3534 #b00000000000000000000000000000000)))))

(assert (=> b!461741 (=> (not res!276207) (not e!269336))))

(declare-fun b!461742 () Bool)

(assert (=> b!461742 (= e!269338 call!30172)))

(declare-fun d!74717 () Bool)

(declare-fun res!276206 () Bool)

(declare-fun e!269337 () Bool)

(assert (=> d!74717 (=> res!276206 e!269337)))

(assert (=> d!74717 (= res!276206 (bvsge #b00000000000000000000000000000000 (size!14138 _keys!1025)))))

(assert (=> d!74717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269337)))

(declare-fun b!461743 () Bool)

(assert (=> b!461743 (= e!269337 e!269338)))

(declare-fun c!56551 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461743 (= c!56551 (validKeyInArray!0 (select (arr!13785 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!74717 (not res!276206)) b!461743))

(assert (= (and b!461743 c!56551) b!461741))

(assert (= (and b!461743 (not c!56551)) b!461742))

(assert (= (and b!461741 res!276207) b!461740))

(assert (= (or b!461740 b!461742) bm!30169))

(declare-fun m!444367 () Bool)

(assert (=> bm!30169 m!444367))

(declare-fun m!444369 () Bool)

(assert (=> b!461741 m!444369))

(declare-fun m!444371 () Bool)

(assert (=> b!461741 m!444371))

(declare-fun m!444373 () Bool)

(assert (=> b!461741 m!444373))

(assert (=> b!461741 m!444369))

(declare-fun m!444375 () Bool)

(assert (=> b!461741 m!444375))

(assert (=> b!461743 m!444369))

(assert (=> b!461743 m!444369))

(declare-fun m!444377 () Bool)

(assert (=> b!461743 m!444377))

(assert (=> b!461690 d!74717))

(declare-fun d!74719 () Bool)

(assert (=> d!74719 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41290 d!74719))

(declare-fun d!74721 () Bool)

(assert (=> d!74721 (= (array_inv!10038 _keys!1025) (bvsge (size!14138 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41290 d!74721))

(declare-fun d!74723 () Bool)

(assert (=> d!74723 (= (array_inv!10039 _values!833) (bvsge (size!14139 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41290 d!74723))

(declare-fun mapIsEmpty!20347 () Bool)

(declare-fun mapRes!20347 () Bool)

(assert (=> mapIsEmpty!20347 mapRes!20347))

(declare-fun b!461751 () Bool)

(declare-fun e!269344 () Bool)

(assert (=> b!461751 (= e!269344 tp_is_empty!12451)))

(declare-fun b!461750 () Bool)

(declare-fun e!269343 () Bool)

(assert (=> b!461750 (= e!269343 tp_is_empty!12451)))

(declare-fun mapNonEmpty!20347 () Bool)

(declare-fun tp!39166 () Bool)

(assert (=> mapNonEmpty!20347 (= mapRes!20347 (and tp!39166 e!269343))))

(declare-fun mapRest!20347 () (Array (_ BitVec 32) ValueCell!5882))

(declare-fun mapKey!20347 () (_ BitVec 32))

(declare-fun mapValue!20347 () ValueCell!5882)

(assert (=> mapNonEmpty!20347 (= mapRest!20338 (store mapRest!20347 mapKey!20347 mapValue!20347))))

(declare-fun condMapEmpty!20347 () Bool)

(declare-fun mapDefault!20347 () ValueCell!5882)

(assert (=> mapNonEmpty!20338 (= condMapEmpty!20347 (= mapRest!20338 ((as const (Array (_ BitVec 32) ValueCell!5882)) mapDefault!20347)))))

(assert (=> mapNonEmpty!20338 (= tp!39157 (and e!269344 mapRes!20347))))

(assert (= (and mapNonEmpty!20338 condMapEmpty!20347) mapIsEmpty!20347))

(assert (= (and mapNonEmpty!20338 (not condMapEmpty!20347)) mapNonEmpty!20347))

(assert (= (and mapNonEmpty!20347 ((_ is ValueCellFull!5882) mapValue!20347)) b!461750))

(assert (= (and mapNonEmpty!20338 ((_ is ValueCellFull!5882) mapDefault!20347)) b!461751))

(declare-fun m!444379 () Bool)

(assert (=> mapNonEmpty!20347 m!444379))

(check-sat (not bm!30169) (not b!461743) (not b!461741) tp_is_empty!12451 (not mapNonEmpty!20347))
(check-sat)
