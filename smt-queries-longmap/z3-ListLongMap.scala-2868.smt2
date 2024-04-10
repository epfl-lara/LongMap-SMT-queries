; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41292 () Bool)

(assert start!41292)

(declare-fun b!461905 () Bool)

(declare-fun e!269424 () Bool)

(declare-datatypes ((array!28691 0))(
  ( (array!28692 (arr!13783 (Array (_ BitVec 32) (_ BitVec 64))) (size!14135 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28691)

(assert (=> b!461905 (= e!269424 (bvsgt #b00000000000000000000000000000000 (size!14135 _keys!1025)))))

(declare-fun b!461906 () Bool)

(declare-fun e!269425 () Bool)

(declare-fun e!269428 () Bool)

(declare-fun mapRes!20329 () Bool)

(assert (=> b!461906 (= e!269425 (and e!269428 mapRes!20329))))

(declare-fun condMapEmpty!20329 () Bool)

(declare-datatypes ((V!17701 0))(
  ( (V!17702 (val!6268 Int)) )
))
(declare-datatypes ((ValueCell!5880 0))(
  ( (ValueCellFull!5880 (v!8554 V!17701)) (EmptyCell!5880) )
))
(declare-datatypes ((array!28693 0))(
  ( (array!28694 (arr!13784 (Array (_ BitVec 32) ValueCell!5880)) (size!14136 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28693)

(declare-fun mapDefault!20329 () ValueCell!5880)

(assert (=> b!461906 (= condMapEmpty!20329 (= (arr!13784 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5880)) mapDefault!20329)))))

(declare-fun b!461907 () Bool)

(declare-fun tp_is_empty!12447 () Bool)

(assert (=> b!461907 (= e!269428 tp_is_empty!12447)))

(declare-fun mapNonEmpty!20329 () Bool)

(declare-fun tp!39148 () Bool)

(declare-fun e!269427 () Bool)

(assert (=> mapNonEmpty!20329 (= mapRes!20329 (and tp!39148 e!269427))))

(declare-fun mapKey!20329 () (_ BitVec 32))

(declare-fun mapRest!20329 () (Array (_ BitVec 32) ValueCell!5880))

(declare-fun mapValue!20329 () ValueCell!5880)

(assert (=> mapNonEmpty!20329 (= (arr!13784 _values!833) (store mapRest!20329 mapKey!20329 mapValue!20329))))

(declare-fun b!461908 () Bool)

(declare-fun res!276288 () Bool)

(assert (=> b!461908 (=> (not res!276288) (not e!269424))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28691 (_ BitVec 32)) Bool)

(assert (=> b!461908 (= res!276288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276286 () Bool)

(assert (=> start!41292 (=> (not res!276286) (not e!269424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41292 (= res!276286 (validMask!0 mask!1365))))

(assert (=> start!41292 e!269424))

(assert (=> start!41292 true))

(declare-fun array_inv!9968 (array!28691) Bool)

(assert (=> start!41292 (array_inv!9968 _keys!1025)))

(declare-fun array_inv!9969 (array!28693) Bool)

(assert (=> start!41292 (and (array_inv!9969 _values!833) e!269425)))

(declare-fun mapIsEmpty!20329 () Bool)

(assert (=> mapIsEmpty!20329 mapRes!20329))

(declare-fun b!461909 () Bool)

(declare-fun res!276287 () Bool)

(assert (=> b!461909 (=> (not res!276287) (not e!269424))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461909 (= res!276287 (and (= (size!14136 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14135 _keys!1025) (size!14136 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!461910 () Bool)

(assert (=> b!461910 (= e!269427 tp_is_empty!12447)))

(assert (= (and start!41292 res!276286) b!461909))

(assert (= (and b!461909 res!276287) b!461908))

(assert (= (and b!461908 res!276288) b!461905))

(assert (= (and b!461906 condMapEmpty!20329) mapIsEmpty!20329))

(assert (= (and b!461906 (not condMapEmpty!20329)) mapNonEmpty!20329))

(get-info :version)

(assert (= (and mapNonEmpty!20329 ((_ is ValueCellFull!5880) mapValue!20329)) b!461910))

(assert (= (and b!461906 ((_ is ValueCellFull!5880) mapDefault!20329)) b!461907))

(assert (= start!41292 b!461906))

(declare-fun m!445037 () Bool)

(assert (=> mapNonEmpty!20329 m!445037))

(declare-fun m!445039 () Bool)

(assert (=> b!461908 m!445039))

(declare-fun m!445041 () Bool)

(assert (=> start!41292 m!445041))

(declare-fun m!445043 () Bool)

(assert (=> start!41292 m!445043))

(declare-fun m!445045 () Bool)

(assert (=> start!41292 m!445045))

(check-sat (not b!461908) (not start!41292) (not mapNonEmpty!20329) tp_is_empty!12447)
(check-sat)
(get-model)

(declare-fun b!461937 () Bool)

(declare-fun e!269451 () Bool)

(declare-fun e!269450 () Bool)

(assert (=> b!461937 (= e!269451 e!269450)))

(declare-fun c!56619 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461937 (= c!56619 (validKeyInArray!0 (select (arr!13783 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!461938 () Bool)

(declare-fun e!269452 () Bool)

(declare-fun call!30194 () Bool)

(assert (=> b!461938 (= e!269452 call!30194)))

(declare-fun b!461939 () Bool)

(assert (=> b!461939 (= e!269450 e!269452)))

(declare-fun lt!209141 () (_ BitVec 64))

(assert (=> b!461939 (= lt!209141 (select (arr!13783 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13438 0))(
  ( (Unit!13439) )
))
(declare-fun lt!209142 () Unit!13438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28691 (_ BitVec 64) (_ BitVec 32)) Unit!13438)

(assert (=> b!461939 (= lt!209142 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209141 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461939 (arrayContainsKey!0 _keys!1025 lt!209141 #b00000000000000000000000000000000)))

(declare-fun lt!209143 () Unit!13438)

(assert (=> b!461939 (= lt!209143 lt!209142)))

(declare-fun res!276302 () Bool)

(declare-datatypes ((SeekEntryResult!3538 0))(
  ( (MissingZero!3538 (index!16331 (_ BitVec 32))) (Found!3538 (index!16332 (_ BitVec 32))) (Intermediate!3538 (undefined!4350 Bool) (index!16333 (_ BitVec 32)) (x!43052 (_ BitVec 32))) (Undefined!3538) (MissingVacant!3538 (index!16334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28691 (_ BitVec 32)) SeekEntryResult!3538)

(assert (=> b!461939 (= res!276302 (= (seekEntryOrOpen!0 (select (arr!13783 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3538 #b00000000000000000000000000000000)))))

(assert (=> b!461939 (=> (not res!276302) (not e!269452))))

(declare-fun d!74911 () Bool)

(declare-fun res!276303 () Bool)

(assert (=> d!74911 (=> res!276303 e!269451)))

(assert (=> d!74911 (= res!276303 (bvsge #b00000000000000000000000000000000 (size!14135 _keys!1025)))))

(assert (=> d!74911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269451)))

(declare-fun bm!30191 () Bool)

(assert (=> bm!30191 (= call!30194 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!461940 () Bool)

(assert (=> b!461940 (= e!269450 call!30194)))

(assert (= (and d!74911 (not res!276303)) b!461937))

(assert (= (and b!461937 c!56619) b!461939))

(assert (= (and b!461937 (not c!56619)) b!461940))

(assert (= (and b!461939 res!276302) b!461938))

(assert (= (or b!461938 b!461940) bm!30191))

(declare-fun m!445057 () Bool)

(assert (=> b!461937 m!445057))

(assert (=> b!461937 m!445057))

(declare-fun m!445059 () Bool)

(assert (=> b!461937 m!445059))

(assert (=> b!461939 m!445057))

(declare-fun m!445061 () Bool)

(assert (=> b!461939 m!445061))

(declare-fun m!445063 () Bool)

(assert (=> b!461939 m!445063))

(assert (=> b!461939 m!445057))

(declare-fun m!445065 () Bool)

(assert (=> b!461939 m!445065))

(declare-fun m!445067 () Bool)

(assert (=> bm!30191 m!445067))

(assert (=> b!461908 d!74911))

(declare-fun d!74913 () Bool)

(assert (=> d!74913 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41292 d!74913))

(declare-fun d!74915 () Bool)

(assert (=> d!74915 (= (array_inv!9968 _keys!1025) (bvsge (size!14135 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41292 d!74915))

(declare-fun d!74917 () Bool)

(assert (=> d!74917 (= (array_inv!9969 _values!833) (bvsge (size!14136 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41292 d!74917))

(declare-fun condMapEmpty!20335 () Bool)

(declare-fun mapDefault!20335 () ValueCell!5880)

(assert (=> mapNonEmpty!20329 (= condMapEmpty!20335 (= mapRest!20329 ((as const (Array (_ BitVec 32) ValueCell!5880)) mapDefault!20335)))))

(declare-fun e!269457 () Bool)

(declare-fun mapRes!20335 () Bool)

(assert (=> mapNonEmpty!20329 (= tp!39148 (and e!269457 mapRes!20335))))

(declare-fun mapNonEmpty!20335 () Bool)

(declare-fun tp!39154 () Bool)

(declare-fun e!269458 () Bool)

(assert (=> mapNonEmpty!20335 (= mapRes!20335 (and tp!39154 e!269458))))

(declare-fun mapKey!20335 () (_ BitVec 32))

(declare-fun mapValue!20335 () ValueCell!5880)

(declare-fun mapRest!20335 () (Array (_ BitVec 32) ValueCell!5880))

(assert (=> mapNonEmpty!20335 (= mapRest!20329 (store mapRest!20335 mapKey!20335 mapValue!20335))))

(declare-fun b!461948 () Bool)

(assert (=> b!461948 (= e!269457 tp_is_empty!12447)))

(declare-fun b!461947 () Bool)

(assert (=> b!461947 (= e!269458 tp_is_empty!12447)))

(declare-fun mapIsEmpty!20335 () Bool)

(assert (=> mapIsEmpty!20335 mapRes!20335))

(assert (= (and mapNonEmpty!20329 condMapEmpty!20335) mapIsEmpty!20335))

(assert (= (and mapNonEmpty!20329 (not condMapEmpty!20335)) mapNonEmpty!20335))

(assert (= (and mapNonEmpty!20335 ((_ is ValueCellFull!5880) mapValue!20335)) b!461947))

(assert (= (and mapNonEmpty!20329 ((_ is ValueCellFull!5880) mapDefault!20335)) b!461948))

(declare-fun m!445069 () Bool)

(assert (=> mapNonEmpty!20335 m!445069))

(check-sat (not mapNonEmpty!20335) (not b!461937) tp_is_empty!12447 (not b!461939) (not bm!30191))
(check-sat)
