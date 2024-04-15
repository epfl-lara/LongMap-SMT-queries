; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77378 () Bool)

(assert start!77378)

(declare-fun b!902061 () Bool)

(declare-fun res!608820 () Bool)

(declare-fun e!505161 () Bool)

(assert (=> b!902061 (=> (not res!608820) (not e!505161))))

(declare-datatypes ((V!29551 0))(
  ( (V!29552 (val!9270 Int)) )
))
(declare-datatypes ((ValueCell!8738 0))(
  ( (ValueCellFull!8738 (v!11773 V!29551)) (EmptyCell!8738) )
))
(declare-datatypes ((array!52919 0))(
  ( (array!52920 (arr!25423 (Array (_ BitVec 32) ValueCell!8738)) (size!25884 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52919)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52921 0))(
  ( (array!52922 (arr!25424 (Array (_ BitVec 32) (_ BitVec 64))) (size!25885 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52921)

(assert (=> b!902061 (= res!608820 (and (= (size!25884 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25885 _keys!1386) (size!25884 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29359 () Bool)

(declare-fun mapRes!29359 () Bool)

(declare-fun tp!56419 () Bool)

(declare-fun e!505157 () Bool)

(assert (=> mapNonEmpty!29359 (= mapRes!29359 (and tp!56419 e!505157))))

(declare-fun mapRest!29359 () (Array (_ BitVec 32) ValueCell!8738))

(declare-fun mapValue!29359 () ValueCell!8738)

(declare-fun mapKey!29359 () (_ BitVec 32))

(assert (=> mapNonEmpty!29359 (= (arr!25423 _values!1152) (store mapRest!29359 mapKey!29359 mapValue!29359))))

(declare-fun b!902062 () Bool)

(declare-fun tp_is_empty!18439 () Bool)

(assert (=> b!902062 (= e!505157 tp_is_empty!18439)))

(declare-fun b!902063 () Bool)

(declare-fun res!608819 () Bool)

(assert (=> b!902063 (=> (not res!608819) (not e!505161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52921 (_ BitVec 32)) Bool)

(assert (=> b!902063 (= res!608819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!608821 () Bool)

(assert (=> start!77378 (=> (not res!608821) (not e!505161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77378 (= res!608821 (validMask!0 mask!1756))))

(assert (=> start!77378 e!505161))

(assert (=> start!77378 true))

(declare-fun e!505158 () Bool)

(declare-fun array_inv!19992 (array!52919) Bool)

(assert (=> start!77378 (and (array_inv!19992 _values!1152) e!505158)))

(declare-fun array_inv!19993 (array!52921) Bool)

(assert (=> start!77378 (array_inv!19993 _keys!1386)))

(declare-fun b!902064 () Bool)

(assert (=> b!902064 (= e!505161 (and (bvsle #b00000000000000000000000000000000 (size!25885 _keys!1386)) (bvsge (size!25885 _keys!1386) #b01111111111111111111111111111111)))))

(declare-fun b!902065 () Bool)

(declare-fun e!505160 () Bool)

(assert (=> b!902065 (= e!505158 (and e!505160 mapRes!29359))))

(declare-fun condMapEmpty!29359 () Bool)

(declare-fun mapDefault!29359 () ValueCell!8738)

(assert (=> b!902065 (= condMapEmpty!29359 (= (arr!25423 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8738)) mapDefault!29359)))))

(declare-fun b!902066 () Bool)

(assert (=> b!902066 (= e!505160 tp_is_empty!18439)))

(declare-fun mapIsEmpty!29359 () Bool)

(assert (=> mapIsEmpty!29359 mapRes!29359))

(assert (= (and start!77378 res!608821) b!902061))

(assert (= (and b!902061 res!608820) b!902063))

(assert (= (and b!902063 res!608819) b!902064))

(assert (= (and b!902065 condMapEmpty!29359) mapIsEmpty!29359))

(assert (= (and b!902065 (not condMapEmpty!29359)) mapNonEmpty!29359))

(get-info :version)

(assert (= (and mapNonEmpty!29359 ((_ is ValueCellFull!8738) mapValue!29359)) b!902062))

(assert (= (and b!902065 ((_ is ValueCellFull!8738) mapDefault!29359)) b!902066))

(assert (= start!77378 b!902065))

(declare-fun m!837599 () Bool)

(assert (=> mapNonEmpty!29359 m!837599))

(declare-fun m!837601 () Bool)

(assert (=> b!902063 m!837601))

(declare-fun m!837603 () Bool)

(assert (=> start!77378 m!837603))

(declare-fun m!837605 () Bool)

(assert (=> start!77378 m!837605))

(declare-fun m!837607 () Bool)

(assert (=> start!77378 m!837607))

(check-sat (not start!77378) (not b!902063) (not mapNonEmpty!29359) tp_is_empty!18439)
(check-sat)
(get-model)

(declare-fun d!111741 () Bool)

(assert (=> d!111741 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77378 d!111741))

(declare-fun d!111743 () Bool)

(assert (=> d!111743 (= (array_inv!19992 _values!1152) (bvsge (size!25884 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77378 d!111743))

(declare-fun d!111745 () Bool)

(assert (=> d!111745 (= (array_inv!19993 _keys!1386) (bvsge (size!25885 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77378 d!111745))

(declare-fun d!111747 () Bool)

(declare-fun res!608844 () Bool)

(declare-fun e!505199 () Bool)

(assert (=> d!111747 (=> res!608844 e!505199)))

(assert (=> d!111747 (= res!608844 (bvsge #b00000000000000000000000000000000 (size!25885 _keys!1386)))))

(assert (=> d!111747 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505199)))

(declare-fun b!902111 () Bool)

(declare-fun e!505200 () Bool)

(assert (=> b!902111 (= e!505199 e!505200)))

(declare-fun c!95571 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902111 (= c!95571 (validKeyInArray!0 (select (arr!25424 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!902112 () Bool)

(declare-fun call!40214 () Bool)

(assert (=> b!902112 (= e!505200 call!40214)))

(declare-fun b!902113 () Bool)

(declare-fun e!505198 () Bool)

(assert (=> b!902113 (= e!505198 call!40214)))

(declare-fun b!902114 () Bool)

(assert (=> b!902114 (= e!505200 e!505198)))

(declare-fun lt!407617 () (_ BitVec 64))

(assert (=> b!902114 (= lt!407617 (select (arr!25424 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30576 0))(
  ( (Unit!30577) )
))
(declare-fun lt!407618 () Unit!30576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52921 (_ BitVec 64) (_ BitVec 32)) Unit!30576)

(assert (=> b!902114 (= lt!407618 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407617 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902114 (arrayContainsKey!0 _keys!1386 lt!407617 #b00000000000000000000000000000000)))

(declare-fun lt!407619 () Unit!30576)

(assert (=> b!902114 (= lt!407619 lt!407618)))

(declare-fun res!608845 () Bool)

(declare-datatypes ((SeekEntryResult!8959 0))(
  ( (MissingZero!8959 (index!38207 (_ BitVec 32))) (Found!8959 (index!38208 (_ BitVec 32))) (Intermediate!8959 (undefined!9771 Bool) (index!38209 (_ BitVec 32)) (x!76905 (_ BitVec 32))) (Undefined!8959) (MissingVacant!8959 (index!38210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52921 (_ BitVec 32)) SeekEntryResult!8959)

(assert (=> b!902114 (= res!608845 (= (seekEntryOrOpen!0 (select (arr!25424 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8959 #b00000000000000000000000000000000)))))

(assert (=> b!902114 (=> (not res!608845) (not e!505198))))

(declare-fun bm!40211 () Bool)

(assert (=> bm!40211 (= call!40214 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(assert (= (and d!111747 (not res!608844)) b!902111))

(assert (= (and b!902111 c!95571) b!902114))

(assert (= (and b!902111 (not c!95571)) b!902112))

(assert (= (and b!902114 res!608845) b!902113))

(assert (= (or b!902113 b!902112) bm!40211))

(declare-fun m!837629 () Bool)

(assert (=> b!902111 m!837629))

(assert (=> b!902111 m!837629))

(declare-fun m!837631 () Bool)

(assert (=> b!902111 m!837631))

(assert (=> b!902114 m!837629))

(declare-fun m!837633 () Bool)

(assert (=> b!902114 m!837633))

(declare-fun m!837635 () Bool)

(assert (=> b!902114 m!837635))

(assert (=> b!902114 m!837629))

(declare-fun m!837637 () Bool)

(assert (=> b!902114 m!837637))

(declare-fun m!837639 () Bool)

(assert (=> bm!40211 m!837639))

(assert (=> b!902063 d!111747))

(declare-fun b!902121 () Bool)

(declare-fun e!505206 () Bool)

(assert (=> b!902121 (= e!505206 tp_is_empty!18439)))

(declare-fun mapNonEmpty!29368 () Bool)

(declare-fun mapRes!29368 () Bool)

(declare-fun tp!56428 () Bool)

(assert (=> mapNonEmpty!29368 (= mapRes!29368 (and tp!56428 e!505206))))

(declare-fun mapKey!29368 () (_ BitVec 32))

(declare-fun mapRest!29368 () (Array (_ BitVec 32) ValueCell!8738))

(declare-fun mapValue!29368 () ValueCell!8738)

(assert (=> mapNonEmpty!29368 (= mapRest!29359 (store mapRest!29368 mapKey!29368 mapValue!29368))))

(declare-fun condMapEmpty!29368 () Bool)

(declare-fun mapDefault!29368 () ValueCell!8738)

(assert (=> mapNonEmpty!29359 (= condMapEmpty!29368 (= mapRest!29359 ((as const (Array (_ BitVec 32) ValueCell!8738)) mapDefault!29368)))))

(declare-fun e!505205 () Bool)

(assert (=> mapNonEmpty!29359 (= tp!56419 (and e!505205 mapRes!29368))))

(declare-fun mapIsEmpty!29368 () Bool)

(assert (=> mapIsEmpty!29368 mapRes!29368))

(declare-fun b!902122 () Bool)

(assert (=> b!902122 (= e!505205 tp_is_empty!18439)))

(assert (= (and mapNonEmpty!29359 condMapEmpty!29368) mapIsEmpty!29368))

(assert (= (and mapNonEmpty!29359 (not condMapEmpty!29368)) mapNonEmpty!29368))

(assert (= (and mapNonEmpty!29368 ((_ is ValueCellFull!8738) mapValue!29368)) b!902121))

(assert (= (and mapNonEmpty!29359 ((_ is ValueCellFull!8738) mapDefault!29368)) b!902122))

(declare-fun m!837641 () Bool)

(assert (=> mapNonEmpty!29368 m!837641))

(check-sat tp_is_empty!18439 (not b!902111) (not mapNonEmpty!29368) (not bm!40211) (not b!902114))
(check-sat)
