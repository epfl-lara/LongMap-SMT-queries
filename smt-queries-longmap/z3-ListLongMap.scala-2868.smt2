; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41276 () Bool)

(assert start!41276)

(declare-fun b!461616 () Bool)

(declare-fun e!269237 () Bool)

(declare-fun tp_is_empty!12445 () Bool)

(assert (=> b!461616 (= e!269237 tp_is_empty!12445)))

(declare-fun mapNonEmpty!20326 () Bool)

(declare-fun mapRes!20326 () Bool)

(declare-fun tp!39145 () Bool)

(declare-fun e!269238 () Bool)

(assert (=> mapNonEmpty!20326 (= mapRes!20326 (and tp!39145 e!269238))))

(declare-datatypes ((V!17699 0))(
  ( (V!17700 (val!6267 Int)) )
))
(declare-datatypes ((ValueCell!5879 0))(
  ( (ValueCellFull!5879 (v!8547 V!17699)) (EmptyCell!5879) )
))
(declare-datatypes ((array!28683 0))(
  ( (array!28684 (arr!13779 (Array (_ BitVec 32) ValueCell!5879)) (size!14132 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28683)

(declare-fun mapRest!20326 () (Array (_ BitVec 32) ValueCell!5879))

(declare-fun mapValue!20326 () ValueCell!5879)

(declare-fun mapKey!20326 () (_ BitVec 32))

(assert (=> mapNonEmpty!20326 (= (arr!13779 _values!833) (store mapRest!20326 mapKey!20326 mapValue!20326))))

(declare-fun b!461618 () Bool)

(declare-fun e!269235 () Bool)

(declare-datatypes ((array!28685 0))(
  ( (array!28686 (arr!13780 (Array (_ BitVec 32) (_ BitVec 64))) (size!14133 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28685)

(assert (=> b!461618 (= e!269235 (bvsgt #b00000000000000000000000000000000 (size!14133 _keys!1025)))))

(declare-fun b!461619 () Bool)

(declare-fun res!276150 () Bool)

(assert (=> b!461619 (=> (not res!276150) (not e!269235))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28685 (_ BitVec 32)) Bool)

(assert (=> b!461619 (= res!276150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!461620 () Bool)

(declare-fun res!276149 () Bool)

(assert (=> b!461620 (=> (not res!276149) (not e!269235))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461620 (= res!276149 (and (= (size!14132 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14133 _keys!1025) (size!14132 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!461621 () Bool)

(assert (=> b!461621 (= e!269238 tp_is_empty!12445)))

(declare-fun mapIsEmpty!20326 () Bool)

(assert (=> mapIsEmpty!20326 mapRes!20326))

(declare-fun res!276148 () Bool)

(assert (=> start!41276 (=> (not res!276148) (not e!269235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41276 (= res!276148 (validMask!0 mask!1365))))

(assert (=> start!41276 e!269235))

(assert (=> start!41276 true))

(declare-fun array_inv!10034 (array!28685) Bool)

(assert (=> start!41276 (array_inv!10034 _keys!1025)))

(declare-fun e!269236 () Bool)

(declare-fun array_inv!10035 (array!28683) Bool)

(assert (=> start!41276 (and (array_inv!10035 _values!833) e!269236)))

(declare-fun b!461617 () Bool)

(assert (=> b!461617 (= e!269236 (and e!269237 mapRes!20326))))

(declare-fun condMapEmpty!20326 () Bool)

(declare-fun mapDefault!20326 () ValueCell!5879)

(assert (=> b!461617 (= condMapEmpty!20326 (= (arr!13779 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5879)) mapDefault!20326)))))

(assert (= (and start!41276 res!276148) b!461620))

(assert (= (and b!461620 res!276149) b!461619))

(assert (= (and b!461619 res!276150) b!461618))

(assert (= (and b!461617 condMapEmpty!20326) mapIsEmpty!20326))

(assert (= (and b!461617 (not condMapEmpty!20326)) mapNonEmpty!20326))

(get-info :version)

(assert (= (and mapNonEmpty!20326 ((_ is ValueCellFull!5879) mapValue!20326)) b!461621))

(assert (= (and b!461617 ((_ is ValueCellFull!5879) mapDefault!20326)) b!461616))

(assert (= start!41276 b!461617))

(declare-fun m!444293 () Bool)

(assert (=> mapNonEmpty!20326 m!444293))

(declare-fun m!444295 () Bool)

(assert (=> b!461619 m!444295))

(declare-fun m!444297 () Bool)

(assert (=> start!41276 m!444297))

(declare-fun m!444299 () Bool)

(assert (=> start!41276 m!444299))

(declare-fun m!444301 () Bool)

(assert (=> start!41276 m!444301))

(check-sat (not start!41276) (not b!461619) (not mapNonEmpty!20326) tp_is_empty!12445)
(check-sat)
(get-model)

(declare-fun d!74707 () Bool)

(assert (=> d!74707 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41276 d!74707))

(declare-fun d!74709 () Bool)

(assert (=> d!74709 (= (array_inv!10034 _keys!1025) (bvsge (size!14133 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41276 d!74709))

(declare-fun d!74711 () Bool)

(assert (=> d!74711 (= (array_inv!10035 _values!833) (bvsge (size!14132 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41276 d!74711))

(declare-fun bm!30166 () Bool)

(declare-fun call!30169 () Bool)

(assert (=> bm!30166 (= call!30169 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!461666 () Bool)

(declare-fun e!269278 () Bool)

(assert (=> b!461666 (= e!269278 call!30169)))

(declare-fun b!461667 () Bool)

(declare-fun e!269277 () Bool)

(declare-fun e!269276 () Bool)

(assert (=> b!461667 (= e!269277 e!269276)))

(declare-fun c!56548 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461667 (= c!56548 (validKeyInArray!0 (select (arr!13780 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!74713 () Bool)

(declare-fun res!276173 () Bool)

(assert (=> d!74713 (=> res!276173 e!269277)))

(assert (=> d!74713 (= res!276173 (bvsge #b00000000000000000000000000000000 (size!14133 _keys!1025)))))

(assert (=> d!74713 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269277)))

(declare-fun b!461668 () Bool)

(assert (=> b!461668 (= e!269276 call!30169)))

(declare-fun b!461669 () Bool)

(assert (=> b!461669 (= e!269276 e!269278)))

(declare-fun lt!208908 () (_ BitVec 64))

(assert (=> b!461669 (= lt!208908 (select (arr!13780 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13408 0))(
  ( (Unit!13409) )
))
(declare-fun lt!208907 () Unit!13408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28685 (_ BitVec 64) (_ BitVec 32)) Unit!13408)

(assert (=> b!461669 (= lt!208907 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!208908 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461669 (arrayContainsKey!0 _keys!1025 lt!208908 #b00000000000000000000000000000000)))

(declare-fun lt!208909 () Unit!13408)

(assert (=> b!461669 (= lt!208909 lt!208907)))

(declare-fun res!276174 () Bool)

(declare-datatypes ((SeekEntryResult!3533 0))(
  ( (MissingZero!3533 (index!16311 (_ BitVec 32))) (Found!3533 (index!16312 (_ BitVec 32))) (Intermediate!3533 (undefined!4345 Bool) (index!16313 (_ BitVec 32)) (x!43042 (_ BitVec 32))) (Undefined!3533) (MissingVacant!3533 (index!16314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28685 (_ BitVec 32)) SeekEntryResult!3533)

(assert (=> b!461669 (= res!276174 (= (seekEntryOrOpen!0 (select (arr!13780 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3533 #b00000000000000000000000000000000)))))

(assert (=> b!461669 (=> (not res!276174) (not e!269278))))

(assert (= (and d!74713 (not res!276173)) b!461667))

(assert (= (and b!461667 c!56548) b!461669))

(assert (= (and b!461667 (not c!56548)) b!461668))

(assert (= (and b!461669 res!276174) b!461666))

(assert (= (or b!461666 b!461668) bm!30166))

(declare-fun m!444323 () Bool)

(assert (=> bm!30166 m!444323))

(declare-fun m!444325 () Bool)

(assert (=> b!461667 m!444325))

(assert (=> b!461667 m!444325))

(declare-fun m!444327 () Bool)

(assert (=> b!461667 m!444327))

(assert (=> b!461669 m!444325))

(declare-fun m!444329 () Bool)

(assert (=> b!461669 m!444329))

(declare-fun m!444331 () Bool)

(assert (=> b!461669 m!444331))

(assert (=> b!461669 m!444325))

(declare-fun m!444333 () Bool)

(assert (=> b!461669 m!444333))

(assert (=> b!461619 d!74713))

(declare-fun b!461676 () Bool)

(declare-fun e!269283 () Bool)

(assert (=> b!461676 (= e!269283 tp_is_empty!12445)))

(declare-fun b!461677 () Bool)

(declare-fun e!269284 () Bool)

(assert (=> b!461677 (= e!269284 tp_is_empty!12445)))

(declare-fun condMapEmpty!20335 () Bool)

(declare-fun mapDefault!20335 () ValueCell!5879)

(assert (=> mapNonEmpty!20326 (= condMapEmpty!20335 (= mapRest!20326 ((as const (Array (_ BitVec 32) ValueCell!5879)) mapDefault!20335)))))

(declare-fun mapRes!20335 () Bool)

(assert (=> mapNonEmpty!20326 (= tp!39145 (and e!269284 mapRes!20335))))

(declare-fun mapNonEmpty!20335 () Bool)

(declare-fun tp!39154 () Bool)

(assert (=> mapNonEmpty!20335 (= mapRes!20335 (and tp!39154 e!269283))))

(declare-fun mapKey!20335 () (_ BitVec 32))

(declare-fun mapValue!20335 () ValueCell!5879)

(declare-fun mapRest!20335 () (Array (_ BitVec 32) ValueCell!5879))

(assert (=> mapNonEmpty!20335 (= mapRest!20326 (store mapRest!20335 mapKey!20335 mapValue!20335))))

(declare-fun mapIsEmpty!20335 () Bool)

(assert (=> mapIsEmpty!20335 mapRes!20335))

(assert (= (and mapNonEmpty!20326 condMapEmpty!20335) mapIsEmpty!20335))

(assert (= (and mapNonEmpty!20326 (not condMapEmpty!20335)) mapNonEmpty!20335))

(assert (= (and mapNonEmpty!20335 ((_ is ValueCellFull!5879) mapValue!20335)) b!461676))

(assert (= (and mapNonEmpty!20326 ((_ is ValueCellFull!5879) mapDefault!20335)) b!461677))

(declare-fun m!444335 () Bool)

(assert (=> mapNonEmpty!20335 m!444335))

(check-sat (not b!461669) (not mapNonEmpty!20335) tp_is_empty!12445 (not b!461667) (not bm!30166))
(check-sat)
