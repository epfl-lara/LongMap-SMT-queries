; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41320 () Bool)

(assert start!41320)

(declare-fun b!462058 () Bool)

(declare-fun res!276359 () Bool)

(declare-fun e!269546 () Bool)

(assert (=> b!462058 (=> (not res!276359) (not e!269546))))

(declare-datatypes ((array!28717 0))(
  ( (array!28718 (arr!13794 (Array (_ BitVec 32) (_ BitVec 64))) (size!14146 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28717)

(assert (=> b!462058 (= res!276359 (and (bvsle #b00000000000000000000000000000000 (size!14146 _keys!1025)) (bvslt (size!14146 _keys!1025) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!20353 () Bool)

(declare-fun mapRes!20353 () Bool)

(assert (=> mapIsEmpty!20353 mapRes!20353))

(declare-fun b!462059 () Bool)

(declare-fun e!269545 () Bool)

(declare-fun tp_is_empty!12459 () Bool)

(assert (=> b!462059 (= e!269545 tp_is_empty!12459)))

(declare-fun b!462060 () Bool)

(declare-datatypes ((List!8333 0))(
  ( (Nil!8330) (Cons!8329 (h!9185 (_ BitVec 64)) (t!14277 List!8333)) )
))
(declare-fun noDuplicate!201 (List!8333) Bool)

(assert (=> b!462060 (= e!269546 (not (noDuplicate!201 Nil!8330)))))

(declare-fun b!462061 () Bool)

(declare-fun e!269548 () Bool)

(assert (=> b!462061 (= e!269548 (and e!269545 mapRes!20353))))

(declare-fun condMapEmpty!20353 () Bool)

(declare-datatypes ((V!17717 0))(
  ( (V!17718 (val!6274 Int)) )
))
(declare-datatypes ((ValueCell!5886 0))(
  ( (ValueCellFull!5886 (v!8560 V!17717)) (EmptyCell!5886) )
))
(declare-datatypes ((array!28719 0))(
  ( (array!28720 (arr!13795 (Array (_ BitVec 32) ValueCell!5886)) (size!14147 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28719)

(declare-fun mapDefault!20353 () ValueCell!5886)

(assert (=> b!462061 (= condMapEmpty!20353 (= (arr!13795 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5886)) mapDefault!20353)))))

(declare-fun res!276360 () Bool)

(assert (=> start!41320 (=> (not res!276360) (not e!269546))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41320 (= res!276360 (validMask!0 mask!1365))))

(assert (=> start!41320 e!269546))

(assert (=> start!41320 true))

(declare-fun array_inv!9976 (array!28717) Bool)

(assert (=> start!41320 (array_inv!9976 _keys!1025)))

(declare-fun array_inv!9977 (array!28719) Bool)

(assert (=> start!41320 (and (array_inv!9977 _values!833) e!269548)))

(declare-fun mapNonEmpty!20353 () Bool)

(declare-fun tp!39172 () Bool)

(declare-fun e!269547 () Bool)

(assert (=> mapNonEmpty!20353 (= mapRes!20353 (and tp!39172 e!269547))))

(declare-fun mapValue!20353 () ValueCell!5886)

(declare-fun mapRest!20353 () (Array (_ BitVec 32) ValueCell!5886))

(declare-fun mapKey!20353 () (_ BitVec 32))

(assert (=> mapNonEmpty!20353 (= (arr!13795 _values!833) (store mapRest!20353 mapKey!20353 mapValue!20353))))

(declare-fun b!462062 () Bool)

(declare-fun res!276358 () Bool)

(assert (=> b!462062 (=> (not res!276358) (not e!269546))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462062 (= res!276358 (and (= (size!14147 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14146 _keys!1025) (size!14147 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462063 () Bool)

(assert (=> b!462063 (= e!269547 tp_is_empty!12459)))

(declare-fun b!462064 () Bool)

(declare-fun res!276357 () Bool)

(assert (=> b!462064 (=> (not res!276357) (not e!269546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28717 (_ BitVec 32)) Bool)

(assert (=> b!462064 (= res!276357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41320 res!276360) b!462062))

(assert (= (and b!462062 res!276358) b!462064))

(assert (= (and b!462064 res!276357) b!462058))

(assert (= (and b!462058 res!276359) b!462060))

(assert (= (and b!462061 condMapEmpty!20353) mapIsEmpty!20353))

(assert (= (and b!462061 (not condMapEmpty!20353)) mapNonEmpty!20353))

(get-info :version)

(assert (= (and mapNonEmpty!20353 ((_ is ValueCellFull!5886) mapValue!20353)) b!462063))

(assert (= (and b!462061 ((_ is ValueCellFull!5886) mapDefault!20353)) b!462059))

(assert (= start!41320 b!462061))

(declare-fun m!445127 () Bool)

(assert (=> b!462060 m!445127))

(declare-fun m!445129 () Bool)

(assert (=> start!41320 m!445129))

(declare-fun m!445131 () Bool)

(assert (=> start!41320 m!445131))

(declare-fun m!445133 () Bool)

(assert (=> start!41320 m!445133))

(declare-fun m!445135 () Bool)

(assert (=> mapNonEmpty!20353 m!445135))

(declare-fun m!445137 () Bool)

(assert (=> b!462064 m!445137))

(check-sat (not mapNonEmpty!20353) tp_is_empty!12459 (not b!462064) (not b!462060) (not start!41320))
(check-sat)
(get-model)

(declare-fun d!74931 () Bool)

(declare-fun res!276377 () Bool)

(declare-fun e!269568 () Bool)

(assert (=> d!74931 (=> res!276377 e!269568)))

(assert (=> d!74931 (= res!276377 ((_ is Nil!8330) Nil!8330))))

(assert (=> d!74931 (= (noDuplicate!201 Nil!8330) e!269568)))

(declare-fun b!462090 () Bool)

(declare-fun e!269569 () Bool)

(assert (=> b!462090 (= e!269568 e!269569)))

(declare-fun res!276378 () Bool)

(assert (=> b!462090 (=> (not res!276378) (not e!269569))))

(declare-fun contains!2515 (List!8333 (_ BitVec 64)) Bool)

(assert (=> b!462090 (= res!276378 (not (contains!2515 (t!14277 Nil!8330) (h!9185 Nil!8330))))))

(declare-fun b!462091 () Bool)

(assert (=> b!462091 (= e!269569 (noDuplicate!201 (t!14277 Nil!8330)))))

(assert (= (and d!74931 (not res!276377)) b!462090))

(assert (= (and b!462090 res!276378) b!462091))

(declare-fun m!445151 () Bool)

(assert (=> b!462090 m!445151))

(declare-fun m!445153 () Bool)

(assert (=> b!462091 m!445153))

(assert (=> b!462060 d!74931))

(declare-fun d!74933 () Bool)

(assert (=> d!74933 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41320 d!74933))

(declare-fun d!74935 () Bool)

(assert (=> d!74935 (= (array_inv!9976 _keys!1025) (bvsge (size!14146 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41320 d!74935))

(declare-fun d!74937 () Bool)

(assert (=> d!74937 (= (array_inv!9977 _values!833) (bvsge (size!14147 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41320 d!74937))

(declare-fun b!462100 () Bool)

(declare-fun e!269576 () Bool)

(declare-fun e!269578 () Bool)

(assert (=> b!462100 (= e!269576 e!269578)))

(declare-fun lt!209159 () (_ BitVec 64))

(assert (=> b!462100 (= lt!209159 (select (arr!13794 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13442 0))(
  ( (Unit!13443) )
))
(declare-fun lt!209160 () Unit!13442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28717 (_ BitVec 64) (_ BitVec 32)) Unit!13442)

(assert (=> b!462100 (= lt!209160 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209159 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!462100 (arrayContainsKey!0 _keys!1025 lt!209159 #b00000000000000000000000000000000)))

(declare-fun lt!209161 () Unit!13442)

(assert (=> b!462100 (= lt!209161 lt!209160)))

(declare-fun res!276384 () Bool)

(declare-datatypes ((SeekEntryResult!3540 0))(
  ( (MissingZero!3540 (index!16339 (_ BitVec 32))) (Found!3540 (index!16340 (_ BitVec 32))) (Intermediate!3540 (undefined!4352 Bool) (index!16341 (_ BitVec 32)) (x!43074 (_ BitVec 32))) (Undefined!3540) (MissingVacant!3540 (index!16342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28717 (_ BitVec 32)) SeekEntryResult!3540)

(assert (=> b!462100 (= res!276384 (= (seekEntryOrOpen!0 (select (arr!13794 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3540 #b00000000000000000000000000000000)))))

(assert (=> b!462100 (=> (not res!276384) (not e!269578))))

(declare-fun b!462101 () Bool)

(declare-fun call!30200 () Bool)

(assert (=> b!462101 (= e!269576 call!30200)))

(declare-fun b!462102 () Bool)

(assert (=> b!462102 (= e!269578 call!30200)))

(declare-fun bm!30197 () Bool)

(assert (=> bm!30197 (= call!30200 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!74939 () Bool)

(declare-fun res!276383 () Bool)

(declare-fun e!269577 () Bool)

(assert (=> d!74939 (=> res!276383 e!269577)))

(assert (=> d!74939 (= res!276383 (bvsge #b00000000000000000000000000000000 (size!14146 _keys!1025)))))

(assert (=> d!74939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269577)))

(declare-fun b!462103 () Bool)

(assert (=> b!462103 (= e!269577 e!269576)))

(declare-fun c!56625 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!462103 (= c!56625 (validKeyInArray!0 (select (arr!13794 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!74939 (not res!276383)) b!462103))

(assert (= (and b!462103 c!56625) b!462100))

(assert (= (and b!462103 (not c!56625)) b!462101))

(assert (= (and b!462100 res!276384) b!462102))

(assert (= (or b!462102 b!462101) bm!30197))

(declare-fun m!445155 () Bool)

(assert (=> b!462100 m!445155))

(declare-fun m!445157 () Bool)

(assert (=> b!462100 m!445157))

(declare-fun m!445159 () Bool)

(assert (=> b!462100 m!445159))

(assert (=> b!462100 m!445155))

(declare-fun m!445161 () Bool)

(assert (=> b!462100 m!445161))

(declare-fun m!445163 () Bool)

(assert (=> bm!30197 m!445163))

(assert (=> b!462103 m!445155))

(assert (=> b!462103 m!445155))

(declare-fun m!445165 () Bool)

(assert (=> b!462103 m!445165))

(assert (=> b!462064 d!74939))

(declare-fun b!462111 () Bool)

(declare-fun e!269584 () Bool)

(assert (=> b!462111 (= e!269584 tp_is_empty!12459)))

(declare-fun b!462110 () Bool)

(declare-fun e!269583 () Bool)

(assert (=> b!462110 (= e!269583 tp_is_empty!12459)))

(declare-fun mapNonEmpty!20359 () Bool)

(declare-fun mapRes!20359 () Bool)

(declare-fun tp!39178 () Bool)

(assert (=> mapNonEmpty!20359 (= mapRes!20359 (and tp!39178 e!269583))))

(declare-fun mapKey!20359 () (_ BitVec 32))

(declare-fun mapRest!20359 () (Array (_ BitVec 32) ValueCell!5886))

(declare-fun mapValue!20359 () ValueCell!5886)

(assert (=> mapNonEmpty!20359 (= mapRest!20353 (store mapRest!20359 mapKey!20359 mapValue!20359))))

(declare-fun mapIsEmpty!20359 () Bool)

(assert (=> mapIsEmpty!20359 mapRes!20359))

(declare-fun condMapEmpty!20359 () Bool)

(declare-fun mapDefault!20359 () ValueCell!5886)

(assert (=> mapNonEmpty!20353 (= condMapEmpty!20359 (= mapRest!20353 ((as const (Array (_ BitVec 32) ValueCell!5886)) mapDefault!20359)))))

(assert (=> mapNonEmpty!20353 (= tp!39172 (and e!269584 mapRes!20359))))

(assert (= (and mapNonEmpty!20353 condMapEmpty!20359) mapIsEmpty!20359))

(assert (= (and mapNonEmpty!20353 (not condMapEmpty!20359)) mapNonEmpty!20359))

(assert (= (and mapNonEmpty!20359 ((_ is ValueCellFull!5886) mapValue!20359)) b!462110))

(assert (= (and mapNonEmpty!20353 ((_ is ValueCellFull!5886) mapDefault!20359)) b!462111))

(declare-fun m!445167 () Bool)

(assert (=> mapNonEmpty!20359 m!445167))

(check-sat (not b!462100) tp_is_empty!12459 (not mapNonEmpty!20359) (not b!462090) (not b!462091) (not b!462103) (not bm!30197))
(check-sat)
