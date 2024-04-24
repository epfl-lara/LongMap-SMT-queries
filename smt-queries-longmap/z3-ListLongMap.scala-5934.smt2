; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77550 () Bool)

(assert start!77550)

(declare-fun b!903129 () Bool)

(declare-fun e!505829 () Bool)

(declare-fun tp_is_empty!18433 () Bool)

(assert (=> b!903129 (= e!505829 tp_is_empty!18433)))

(declare-fun res!609242 () Bool)

(declare-fun e!505831 () Bool)

(assert (=> start!77550 (=> (not res!609242) (not e!505831))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77550 (= res!609242 (validMask!0 mask!1756))))

(assert (=> start!77550 e!505831))

(assert (=> start!77550 true))

(declare-datatypes ((V!29543 0))(
  ( (V!29544 (val!9267 Int)) )
))
(declare-datatypes ((ValueCell!8735 0))(
  ( (ValueCellFull!8735 (v!11768 V!29543)) (EmptyCell!8735) )
))
(declare-datatypes ((array!52963 0))(
  ( (array!52964 (arr!25441 (Array (_ BitVec 32) ValueCell!8735)) (size!25901 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52963)

(declare-fun e!505828 () Bool)

(declare-fun array_inv!20010 (array!52963) Bool)

(assert (=> start!77550 (and (array_inv!20010 _values!1152) e!505828)))

(declare-datatypes ((array!52965 0))(
  ( (array!52966 (arr!25442 (Array (_ BitVec 32) (_ BitVec 64))) (size!25902 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52965)

(declare-fun array_inv!20011 (array!52965) Bool)

(assert (=> start!77550 (array_inv!20011 _keys!1386)))

(declare-fun b!903130 () Bool)

(declare-fun res!609241 () Bool)

(assert (=> b!903130 (=> (not res!609241) (not e!505831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52965 (_ BitVec 32)) Bool)

(assert (=> b!903130 (= res!609241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903131 () Bool)

(declare-fun res!609240 () Bool)

(assert (=> b!903131 (=> (not res!609240) (not e!505831))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903131 (= res!609240 (and (= (size!25901 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25902 _keys!1386) (size!25901 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903132 () Bool)

(assert (=> b!903132 (= e!505831 (bvsgt #b00000000000000000000000000000000 (size!25902 _keys!1386)))))

(declare-fun b!903133 () Bool)

(declare-fun e!505827 () Bool)

(assert (=> b!903133 (= e!505827 tp_is_empty!18433)))

(declare-fun b!903134 () Bool)

(declare-fun mapRes!29347 () Bool)

(assert (=> b!903134 (= e!505828 (and e!505827 mapRes!29347))))

(declare-fun condMapEmpty!29347 () Bool)

(declare-fun mapDefault!29347 () ValueCell!8735)

(assert (=> b!903134 (= condMapEmpty!29347 (= (arr!25441 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8735)) mapDefault!29347)))))

(declare-fun mapNonEmpty!29347 () Bool)

(declare-fun tp!56407 () Bool)

(assert (=> mapNonEmpty!29347 (= mapRes!29347 (and tp!56407 e!505829))))

(declare-fun mapKey!29347 () (_ BitVec 32))

(declare-fun mapRest!29347 () (Array (_ BitVec 32) ValueCell!8735))

(declare-fun mapValue!29347 () ValueCell!8735)

(assert (=> mapNonEmpty!29347 (= (arr!25441 _values!1152) (store mapRest!29347 mapKey!29347 mapValue!29347))))

(declare-fun mapIsEmpty!29347 () Bool)

(assert (=> mapIsEmpty!29347 mapRes!29347))

(assert (= (and start!77550 res!609242) b!903131))

(assert (= (and b!903131 res!609240) b!903130))

(assert (= (and b!903130 res!609241) b!903132))

(assert (= (and b!903134 condMapEmpty!29347) mapIsEmpty!29347))

(assert (= (and b!903134 (not condMapEmpty!29347)) mapNonEmpty!29347))

(get-info :version)

(assert (= (and mapNonEmpty!29347 ((_ is ValueCellFull!8735) mapValue!29347)) b!903129))

(assert (= (and b!903134 ((_ is ValueCellFull!8735) mapDefault!29347)) b!903133))

(assert (= start!77550 b!903134))

(declare-fun m!839607 () Bool)

(assert (=> start!77550 m!839607))

(declare-fun m!839609 () Bool)

(assert (=> start!77550 m!839609))

(declare-fun m!839611 () Bool)

(assert (=> start!77550 m!839611))

(declare-fun m!839613 () Bool)

(assert (=> b!903130 m!839613))

(declare-fun m!839615 () Bool)

(assert (=> mapNonEmpty!29347 m!839615))

(check-sat (not b!903130) (not start!77550) (not mapNonEmpty!29347) tp_is_empty!18433)
(check-sat)
(get-model)

(declare-fun b!903179 () Bool)

(declare-fun e!505868 () Bool)

(declare-fun e!505870 () Bool)

(assert (=> b!903179 (= e!505868 e!505870)))

(declare-fun c!95915 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!903179 (= c!95915 (validKeyInArray!0 (select (arr!25442 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40279 () Bool)

(declare-fun call!40282 () Bool)

(assert (=> bm!40279 (= call!40282 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!903180 () Bool)

(declare-fun e!505869 () Bool)

(assert (=> b!903180 (= e!505870 e!505869)))

(declare-fun lt!408205 () (_ BitVec 64))

(assert (=> b!903180 (= lt!408205 (select (arr!25442 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30636 0))(
  ( (Unit!30637) )
))
(declare-fun lt!408206 () Unit!30636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52965 (_ BitVec 64) (_ BitVec 32)) Unit!30636)

(assert (=> b!903180 (= lt!408206 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!408205 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903180 (arrayContainsKey!0 _keys!1386 lt!408205 #b00000000000000000000000000000000)))

(declare-fun lt!408207 () Unit!30636)

(assert (=> b!903180 (= lt!408207 lt!408206)))

(declare-fun res!609265 () Bool)

(declare-datatypes ((SeekEntryResult!8912 0))(
  ( (MissingZero!8912 (index!38019 (_ BitVec 32))) (Found!8912 (index!38020 (_ BitVec 32))) (Intermediate!8912 (undefined!9724 Bool) (index!38021 (_ BitVec 32)) (x!76867 (_ BitVec 32))) (Undefined!8912) (MissingVacant!8912 (index!38022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52965 (_ BitVec 32)) SeekEntryResult!8912)

(assert (=> b!903180 (= res!609265 (= (seekEntryOrOpen!0 (select (arr!25442 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8912 #b00000000000000000000000000000000)))))

(assert (=> b!903180 (=> (not res!609265) (not e!505869))))

(declare-fun b!903182 () Bool)

(assert (=> b!903182 (= e!505870 call!40282)))

(declare-fun b!903181 () Bool)

(assert (=> b!903181 (= e!505869 call!40282)))

(declare-fun d!112251 () Bool)

(declare-fun res!609266 () Bool)

(assert (=> d!112251 (=> res!609266 e!505868)))

(assert (=> d!112251 (= res!609266 (bvsge #b00000000000000000000000000000000 (size!25902 _keys!1386)))))

(assert (=> d!112251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505868)))

(assert (= (and d!112251 (not res!609266)) b!903179))

(assert (= (and b!903179 c!95915) b!903180))

(assert (= (and b!903179 (not c!95915)) b!903182))

(assert (= (and b!903180 res!609265) b!903181))

(assert (= (or b!903181 b!903182) bm!40279))

(declare-fun m!839637 () Bool)

(assert (=> b!903179 m!839637))

(assert (=> b!903179 m!839637))

(declare-fun m!839639 () Bool)

(assert (=> b!903179 m!839639))

(declare-fun m!839641 () Bool)

(assert (=> bm!40279 m!839641))

(assert (=> b!903180 m!839637))

(declare-fun m!839643 () Bool)

(assert (=> b!903180 m!839643))

(declare-fun m!839645 () Bool)

(assert (=> b!903180 m!839645))

(assert (=> b!903180 m!839637))

(declare-fun m!839647 () Bool)

(assert (=> b!903180 m!839647))

(assert (=> b!903130 d!112251))

(declare-fun d!112253 () Bool)

(assert (=> d!112253 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77550 d!112253))

(declare-fun d!112255 () Bool)

(assert (=> d!112255 (= (array_inv!20010 _values!1152) (bvsge (size!25901 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77550 d!112255))

(declare-fun d!112257 () Bool)

(assert (=> d!112257 (= (array_inv!20011 _keys!1386) (bvsge (size!25902 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77550 d!112257))

(declare-fun mapIsEmpty!29356 () Bool)

(declare-fun mapRes!29356 () Bool)

(assert (=> mapIsEmpty!29356 mapRes!29356))

(declare-fun b!903190 () Bool)

(declare-fun e!505876 () Bool)

(assert (=> b!903190 (= e!505876 tp_is_empty!18433)))

(declare-fun b!903189 () Bool)

(declare-fun e!505875 () Bool)

(assert (=> b!903189 (= e!505875 tp_is_empty!18433)))

(declare-fun condMapEmpty!29356 () Bool)

(declare-fun mapDefault!29356 () ValueCell!8735)

(assert (=> mapNonEmpty!29347 (= condMapEmpty!29356 (= mapRest!29347 ((as const (Array (_ BitVec 32) ValueCell!8735)) mapDefault!29356)))))

(assert (=> mapNonEmpty!29347 (= tp!56407 (and e!505876 mapRes!29356))))

(declare-fun mapNonEmpty!29356 () Bool)

(declare-fun tp!56416 () Bool)

(assert (=> mapNonEmpty!29356 (= mapRes!29356 (and tp!56416 e!505875))))

(declare-fun mapRest!29356 () (Array (_ BitVec 32) ValueCell!8735))

(declare-fun mapValue!29356 () ValueCell!8735)

(declare-fun mapKey!29356 () (_ BitVec 32))

(assert (=> mapNonEmpty!29356 (= mapRest!29347 (store mapRest!29356 mapKey!29356 mapValue!29356))))

(assert (= (and mapNonEmpty!29347 condMapEmpty!29356) mapIsEmpty!29356))

(assert (= (and mapNonEmpty!29347 (not condMapEmpty!29356)) mapNonEmpty!29356))

(assert (= (and mapNonEmpty!29356 ((_ is ValueCellFull!8735) mapValue!29356)) b!903189))

(assert (= (and mapNonEmpty!29347 ((_ is ValueCellFull!8735) mapDefault!29356)) b!903190))

(declare-fun m!839649 () Bool)

(assert (=> mapNonEmpty!29356 m!839649))

(check-sat tp_is_empty!18433 (not b!903180) (not mapNonEmpty!29356) (not b!903179) (not bm!40279))
(check-sat)
