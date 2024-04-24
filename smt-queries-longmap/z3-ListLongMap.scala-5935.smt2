; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77564 () Bool)

(assert start!77564)

(declare-fun b!903203 () Bool)

(declare-fun res!609275 () Bool)

(declare-fun e!505890 () Bool)

(assert (=> b!903203 (=> (not res!609275) (not e!505890))))

(declare-datatypes ((V!29551 0))(
  ( (V!29552 (val!9270 Int)) )
))
(declare-datatypes ((ValueCell!8738 0))(
  ( (ValueCellFull!8738 (v!11771 V!29551)) (EmptyCell!8738) )
))
(declare-datatypes ((array!52975 0))(
  ( (array!52976 (arr!25446 (Array (_ BitVec 32) ValueCell!8738)) (size!25906 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52975)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!52977 0))(
  ( (array!52978 (arr!25447 (Array (_ BitVec 32) (_ BitVec 64))) (size!25907 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52977)

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903203 (= res!609275 (and (= (size!25906 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25907 _keys!1386) (size!25906 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609274 () Bool)

(assert (=> start!77564 (=> (not res!609274) (not e!505890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77564 (= res!609274 (validMask!0 mask!1756))))

(assert (=> start!77564 e!505890))

(assert (=> start!77564 true))

(declare-fun e!505888 () Bool)

(declare-fun array_inv!20014 (array!52975) Bool)

(assert (=> start!77564 (and (array_inv!20014 _values!1152) e!505888)))

(declare-fun array_inv!20015 (array!52977) Bool)

(assert (=> start!77564 (array_inv!20015 _keys!1386)))

(declare-fun b!903204 () Bool)

(declare-fun e!505891 () Bool)

(declare-fun mapRes!29359 () Bool)

(assert (=> b!903204 (= e!505888 (and e!505891 mapRes!29359))))

(declare-fun condMapEmpty!29359 () Bool)

(declare-fun mapDefault!29359 () ValueCell!8738)

(assert (=> b!903204 (= condMapEmpty!29359 (= (arr!25446 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8738)) mapDefault!29359)))))

(declare-fun mapNonEmpty!29359 () Bool)

(declare-fun tp!56419 () Bool)

(declare-fun e!505887 () Bool)

(assert (=> mapNonEmpty!29359 (= mapRes!29359 (and tp!56419 e!505887))))

(declare-fun mapRest!29359 () (Array (_ BitVec 32) ValueCell!8738))

(declare-fun mapValue!29359 () ValueCell!8738)

(declare-fun mapKey!29359 () (_ BitVec 32))

(assert (=> mapNonEmpty!29359 (= (arr!25446 _values!1152) (store mapRest!29359 mapKey!29359 mapValue!29359))))

(declare-fun b!903205 () Bool)

(declare-fun tp_is_empty!18439 () Bool)

(assert (=> b!903205 (= e!505891 tp_is_empty!18439)))

(declare-fun mapIsEmpty!29359 () Bool)

(assert (=> mapIsEmpty!29359 mapRes!29359))

(declare-fun b!903206 () Bool)

(assert (=> b!903206 (= e!505890 (and (bvsle #b00000000000000000000000000000000 (size!25907 _keys!1386)) (bvsge (size!25907 _keys!1386) #b01111111111111111111111111111111)))))

(declare-fun b!903207 () Bool)

(declare-fun res!609273 () Bool)

(assert (=> b!903207 (=> (not res!609273) (not e!505890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52977 (_ BitVec 32)) Bool)

(assert (=> b!903207 (= res!609273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903208 () Bool)

(assert (=> b!903208 (= e!505887 tp_is_empty!18439)))

(assert (= (and start!77564 res!609274) b!903203))

(assert (= (and b!903203 res!609275) b!903207))

(assert (= (and b!903207 res!609273) b!903206))

(assert (= (and b!903204 condMapEmpty!29359) mapIsEmpty!29359))

(assert (= (and b!903204 (not condMapEmpty!29359)) mapNonEmpty!29359))

(get-info :version)

(assert (= (and mapNonEmpty!29359 ((_ is ValueCellFull!8738) mapValue!29359)) b!903208))

(assert (= (and b!903204 ((_ is ValueCellFull!8738) mapDefault!29359)) b!903205))

(assert (= start!77564 b!903204))

(declare-fun m!839651 () Bool)

(assert (=> start!77564 m!839651))

(declare-fun m!839653 () Bool)

(assert (=> start!77564 m!839653))

(declare-fun m!839655 () Bool)

(assert (=> start!77564 m!839655))

(declare-fun m!839657 () Bool)

(assert (=> mapNonEmpty!29359 m!839657))

(declare-fun m!839659 () Bool)

(assert (=> b!903207 m!839659))

(check-sat (not start!77564) (not b!903207) (not mapNonEmpty!29359) tp_is_empty!18439)
(check-sat)
(get-model)

(declare-fun d!112261 () Bool)

(assert (=> d!112261 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77564 d!112261))

(declare-fun d!112263 () Bool)

(assert (=> d!112263 (= (array_inv!20014 _values!1152) (bvsge (size!25906 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77564 d!112263))

(declare-fun d!112265 () Bool)

(assert (=> d!112265 (= (array_inv!20015 _keys!1386) (bvsge (size!25907 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77564 d!112265))

(declare-fun d!112267 () Bool)

(declare-fun res!609298 () Bool)

(declare-fun e!505930 () Bool)

(assert (=> d!112267 (=> res!609298 e!505930)))

(assert (=> d!112267 (= res!609298 (bvsge #b00000000000000000000000000000000 (size!25907 _keys!1386)))))

(assert (=> d!112267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505930)))

(declare-fun b!903253 () Bool)

(declare-fun e!505928 () Bool)

(declare-fun call!40285 () Bool)

(assert (=> b!903253 (= e!505928 call!40285)))

(declare-fun b!903254 () Bool)

(declare-fun e!505929 () Bool)

(assert (=> b!903254 (= e!505930 e!505929)))

(declare-fun c!95918 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!903254 (= c!95918 (validKeyInArray!0 (select (arr!25447 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40282 () Bool)

(assert (=> bm!40282 (= call!40285 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!903255 () Bool)

(assert (=> b!903255 (= e!505929 call!40285)))

(declare-fun b!903256 () Bool)

(assert (=> b!903256 (= e!505929 e!505928)))

(declare-fun lt!408215 () (_ BitVec 64))

(assert (=> b!903256 (= lt!408215 (select (arr!25447 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30638 0))(
  ( (Unit!30639) )
))
(declare-fun lt!408214 () Unit!30638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52977 (_ BitVec 64) (_ BitVec 32)) Unit!30638)

(assert (=> b!903256 (= lt!408214 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!408215 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903256 (arrayContainsKey!0 _keys!1386 lt!408215 #b00000000000000000000000000000000)))

(declare-fun lt!408216 () Unit!30638)

(assert (=> b!903256 (= lt!408216 lt!408214)))

(declare-fun res!609299 () Bool)

(declare-datatypes ((SeekEntryResult!8913 0))(
  ( (MissingZero!8913 (index!38023 (_ BitVec 32))) (Found!8913 (index!38024 (_ BitVec 32))) (Intermediate!8913 (undefined!9725 Bool) (index!38025 (_ BitVec 32)) (x!76878 (_ BitVec 32))) (Undefined!8913) (MissingVacant!8913 (index!38026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52977 (_ BitVec 32)) SeekEntryResult!8913)

(assert (=> b!903256 (= res!609299 (= (seekEntryOrOpen!0 (select (arr!25447 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8913 #b00000000000000000000000000000000)))))

(assert (=> b!903256 (=> (not res!609299) (not e!505928))))

(assert (= (and d!112267 (not res!609298)) b!903254))

(assert (= (and b!903254 c!95918) b!903256))

(assert (= (and b!903254 (not c!95918)) b!903255))

(assert (= (and b!903256 res!609299) b!903253))

(assert (= (or b!903253 b!903255) bm!40282))

(declare-fun m!839681 () Bool)

(assert (=> b!903254 m!839681))

(assert (=> b!903254 m!839681))

(declare-fun m!839683 () Bool)

(assert (=> b!903254 m!839683))

(declare-fun m!839685 () Bool)

(assert (=> bm!40282 m!839685))

(assert (=> b!903256 m!839681))

(declare-fun m!839687 () Bool)

(assert (=> b!903256 m!839687))

(declare-fun m!839689 () Bool)

(assert (=> b!903256 m!839689))

(assert (=> b!903256 m!839681))

(declare-fun m!839691 () Bool)

(assert (=> b!903256 m!839691))

(assert (=> b!903207 d!112267))

(declare-fun condMapEmpty!29368 () Bool)

(declare-fun mapDefault!29368 () ValueCell!8738)

(assert (=> mapNonEmpty!29359 (= condMapEmpty!29368 (= mapRest!29359 ((as const (Array (_ BitVec 32) ValueCell!8738)) mapDefault!29368)))))

(declare-fun e!505936 () Bool)

(declare-fun mapRes!29368 () Bool)

(assert (=> mapNonEmpty!29359 (= tp!56419 (and e!505936 mapRes!29368))))

(declare-fun b!903263 () Bool)

(declare-fun e!505935 () Bool)

(assert (=> b!903263 (= e!505935 tp_is_empty!18439)))

(declare-fun mapIsEmpty!29368 () Bool)

(assert (=> mapIsEmpty!29368 mapRes!29368))

(declare-fun mapNonEmpty!29368 () Bool)

(declare-fun tp!56428 () Bool)

(assert (=> mapNonEmpty!29368 (= mapRes!29368 (and tp!56428 e!505935))))

(declare-fun mapRest!29368 () (Array (_ BitVec 32) ValueCell!8738))

(declare-fun mapKey!29368 () (_ BitVec 32))

(declare-fun mapValue!29368 () ValueCell!8738)

(assert (=> mapNonEmpty!29368 (= mapRest!29359 (store mapRest!29368 mapKey!29368 mapValue!29368))))

(declare-fun b!903264 () Bool)

(assert (=> b!903264 (= e!505936 tp_is_empty!18439)))

(assert (= (and mapNonEmpty!29359 condMapEmpty!29368) mapIsEmpty!29368))

(assert (= (and mapNonEmpty!29359 (not condMapEmpty!29368)) mapNonEmpty!29368))

(assert (= (and mapNonEmpty!29368 ((_ is ValueCellFull!8738) mapValue!29368)) b!903263))

(assert (= (and mapNonEmpty!29359 ((_ is ValueCellFull!8738) mapDefault!29368)) b!903264))

(declare-fun m!839693 () Bool)

(assert (=> mapNonEmpty!29368 m!839693))

(check-sat (not bm!40282) (not b!903254) (not b!903256) (not mapNonEmpty!29368) tp_is_empty!18439)
(check-sat)
