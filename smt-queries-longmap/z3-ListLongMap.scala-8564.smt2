; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104572 () Bool)

(assert start!104572)

(declare-fun b!1247196 () Bool)

(declare-fun res!832230 () Bool)

(declare-fun e!707481 () Bool)

(assert (=> b!1247196 (=> (not res!832230) (not e!707481))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80338 0))(
  ( (array!80339 (arr!38740 (Array (_ BitVec 32) (_ BitVec 64))) (size!39276 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80338)

(declare-datatypes ((V!47129 0))(
  ( (V!47130 (val!15724 Int)) )
))
(declare-datatypes ((ValueCell!14898 0))(
  ( (ValueCellFull!14898 (v!18419 V!47129)) (EmptyCell!14898) )
))
(declare-datatypes ((array!80340 0))(
  ( (array!80341 (arr!38741 (Array (_ BitVec 32) ValueCell!14898)) (size!39277 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80340)

(assert (=> b!1247196 (= res!832230 (and (= (size!39277 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39276 _keys!1118) (size!39277 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247197 () Bool)

(declare-fun e!707479 () Bool)

(declare-fun e!707482 () Bool)

(declare-fun mapRes!48733 () Bool)

(assert (=> b!1247197 (= e!707479 (and e!707482 mapRes!48733))))

(declare-fun condMapEmpty!48733 () Bool)

(declare-fun mapDefault!48733 () ValueCell!14898)

(assert (=> b!1247197 (= condMapEmpty!48733 (= (arr!38741 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14898)) mapDefault!48733)))))

(declare-fun res!832231 () Bool)

(assert (=> start!104572 (=> (not res!832231) (not e!707481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104572 (= res!832231 (validMask!0 mask!1466))))

(assert (=> start!104572 e!707481))

(assert (=> start!104572 true))

(declare-fun array_inv!29583 (array!80338) Bool)

(assert (=> start!104572 (array_inv!29583 _keys!1118)))

(declare-fun array_inv!29584 (array!80340) Bool)

(assert (=> start!104572 (and (array_inv!29584 _values!914) e!707479)))

(declare-fun mapNonEmpty!48733 () Bool)

(declare-fun tp!92834 () Bool)

(declare-fun e!707480 () Bool)

(assert (=> mapNonEmpty!48733 (= mapRes!48733 (and tp!92834 e!707480))))

(declare-fun mapRest!48733 () (Array (_ BitVec 32) ValueCell!14898))

(declare-fun mapValue!48733 () ValueCell!14898)

(declare-fun mapKey!48733 () (_ BitVec 32))

(assert (=> mapNonEmpty!48733 (= (arr!38741 _values!914) (store mapRest!48733 mapKey!48733 mapValue!48733))))

(declare-fun b!1247198 () Bool)

(declare-fun res!832229 () Bool)

(assert (=> b!1247198 (=> (not res!832229) (not e!707481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80338 (_ BitVec 32)) Bool)

(assert (=> b!1247198 (= res!832229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247199 () Bool)

(declare-fun tp_is_empty!31323 () Bool)

(assert (=> b!1247199 (= e!707482 tp_is_empty!31323)))

(declare-fun b!1247200 () Bool)

(declare-fun res!832228 () Bool)

(assert (=> b!1247200 (=> (not res!832228) (not e!707481))))

(assert (=> b!1247200 (= res!832228 (and (bvsle #b00000000000000000000000000000000 (size!39276 _keys!1118)) (bvslt (size!39276 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1247201 () Bool)

(declare-datatypes ((List!27520 0))(
  ( (Nil!27517) (Cons!27516 (h!28725 (_ BitVec 64)) (t!40989 List!27520)) )
))
(declare-fun noDuplicate!2038 (List!27520) Bool)

(assert (=> b!1247201 (= e!707481 (not (noDuplicate!2038 Nil!27517)))))

(declare-fun b!1247202 () Bool)

(assert (=> b!1247202 (= e!707480 tp_is_empty!31323)))

(declare-fun mapIsEmpty!48733 () Bool)

(assert (=> mapIsEmpty!48733 mapRes!48733))

(assert (= (and start!104572 res!832231) b!1247196))

(assert (= (and b!1247196 res!832230) b!1247198))

(assert (= (and b!1247198 res!832229) b!1247200))

(assert (= (and b!1247200 res!832228) b!1247201))

(assert (= (and b!1247197 condMapEmpty!48733) mapIsEmpty!48733))

(assert (= (and b!1247197 (not condMapEmpty!48733)) mapNonEmpty!48733))

(get-info :version)

(assert (= (and mapNonEmpty!48733 ((_ is ValueCellFull!14898) mapValue!48733)) b!1247202))

(assert (= (and b!1247197 ((_ is ValueCellFull!14898) mapDefault!48733)) b!1247199))

(assert (= start!104572 b!1247197))

(declare-fun m!1148789 () Bool)

(assert (=> start!104572 m!1148789))

(declare-fun m!1148791 () Bool)

(assert (=> start!104572 m!1148791))

(declare-fun m!1148793 () Bool)

(assert (=> start!104572 m!1148793))

(declare-fun m!1148795 () Bool)

(assert (=> mapNonEmpty!48733 m!1148795))

(declare-fun m!1148797 () Bool)

(assert (=> b!1247198 m!1148797))

(declare-fun m!1148799 () Bool)

(assert (=> b!1247201 m!1148799))

(check-sat (not b!1247201) (not start!104572) tp_is_empty!31323 (not mapNonEmpty!48733) (not b!1247198))
(check-sat)
(get-model)

(declare-fun d!137741 () Bool)

(declare-fun res!832248 () Bool)

(declare-fun e!707503 () Bool)

(assert (=> d!137741 (=> res!832248 e!707503)))

(assert (=> d!137741 (= res!832248 ((_ is Nil!27517) Nil!27517))))

(assert (=> d!137741 (= (noDuplicate!2038 Nil!27517) e!707503)))

(declare-fun b!1247228 () Bool)

(declare-fun e!707504 () Bool)

(assert (=> b!1247228 (= e!707503 e!707504)))

(declare-fun res!832249 () Bool)

(assert (=> b!1247228 (=> (not res!832249) (not e!707504))))

(declare-fun contains!7465 (List!27520 (_ BitVec 64)) Bool)

(assert (=> b!1247228 (= res!832249 (not (contains!7465 (t!40989 Nil!27517) (h!28725 Nil!27517))))))

(declare-fun b!1247229 () Bool)

(assert (=> b!1247229 (= e!707504 (noDuplicate!2038 (t!40989 Nil!27517)))))

(assert (= (and d!137741 (not res!832248)) b!1247228))

(assert (= (and b!1247228 res!832249) b!1247229))

(declare-fun m!1148813 () Bool)

(assert (=> b!1247228 m!1148813))

(declare-fun m!1148815 () Bool)

(assert (=> b!1247229 m!1148815))

(assert (=> b!1247201 d!137741))

(declare-fun bm!61557 () Bool)

(declare-fun call!61560 () Bool)

(assert (=> bm!61557 (= call!61560 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!137743 () Bool)

(declare-fun res!832255 () Bool)

(declare-fun e!707512 () Bool)

(assert (=> d!137743 (=> res!832255 e!707512)))

(assert (=> d!137743 (= res!832255 (bvsge #b00000000000000000000000000000000 (size!39276 _keys!1118)))))

(assert (=> d!137743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707512)))

(declare-fun b!1247238 () Bool)

(declare-fun e!707511 () Bool)

(assert (=> b!1247238 (= e!707512 e!707511)))

(declare-fun c!122097 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247238 (= c!122097 (validKeyInArray!0 (select (arr!38740 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1247239 () Bool)

(declare-fun e!707513 () Bool)

(assert (=> b!1247239 (= e!707511 e!707513)))

(declare-fun lt!563233 () (_ BitVec 64))

(assert (=> b!1247239 (= lt!563233 (select (arr!38740 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41469 0))(
  ( (Unit!41470) )
))
(declare-fun lt!563235 () Unit!41469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80338 (_ BitVec 64) (_ BitVec 32)) Unit!41469)

(assert (=> b!1247239 (= lt!563235 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563233 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247239 (arrayContainsKey!0 _keys!1118 lt!563233 #b00000000000000000000000000000000)))

(declare-fun lt!563234 () Unit!41469)

(assert (=> b!1247239 (= lt!563234 lt!563235)))

(declare-fun res!832254 () Bool)

(declare-datatypes ((SeekEntryResult!9954 0))(
  ( (MissingZero!9954 (index!42187 (_ BitVec 32))) (Found!9954 (index!42188 (_ BitVec 32))) (Intermediate!9954 (undefined!10766 Bool) (index!42189 (_ BitVec 32)) (x!109595 (_ BitVec 32))) (Undefined!9954) (MissingVacant!9954 (index!42190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80338 (_ BitVec 32)) SeekEntryResult!9954)

(assert (=> b!1247239 (= res!832254 (= (seekEntryOrOpen!0 (select (arr!38740 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9954 #b00000000000000000000000000000000)))))

(assert (=> b!1247239 (=> (not res!832254) (not e!707513))))

(declare-fun b!1247240 () Bool)

(assert (=> b!1247240 (= e!707513 call!61560)))

(declare-fun b!1247241 () Bool)

(assert (=> b!1247241 (= e!707511 call!61560)))

(assert (= (and d!137743 (not res!832255)) b!1247238))

(assert (= (and b!1247238 c!122097) b!1247239))

(assert (= (and b!1247238 (not c!122097)) b!1247241))

(assert (= (and b!1247239 res!832254) b!1247240))

(assert (= (or b!1247240 b!1247241) bm!61557))

(declare-fun m!1148817 () Bool)

(assert (=> bm!61557 m!1148817))

(declare-fun m!1148819 () Bool)

(assert (=> b!1247238 m!1148819))

(assert (=> b!1247238 m!1148819))

(declare-fun m!1148821 () Bool)

(assert (=> b!1247238 m!1148821))

(assert (=> b!1247239 m!1148819))

(declare-fun m!1148823 () Bool)

(assert (=> b!1247239 m!1148823))

(declare-fun m!1148825 () Bool)

(assert (=> b!1247239 m!1148825))

(assert (=> b!1247239 m!1148819))

(declare-fun m!1148827 () Bool)

(assert (=> b!1247239 m!1148827))

(assert (=> b!1247198 d!137743))

(declare-fun d!137745 () Bool)

(assert (=> d!137745 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104572 d!137745))

(declare-fun d!137747 () Bool)

(assert (=> d!137747 (= (array_inv!29583 _keys!1118) (bvsge (size!39276 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104572 d!137747))

(declare-fun d!137749 () Bool)

(assert (=> d!137749 (= (array_inv!29584 _values!914) (bvsge (size!39277 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104572 d!137749))

(declare-fun condMapEmpty!48739 () Bool)

(declare-fun mapDefault!48739 () ValueCell!14898)

(assert (=> mapNonEmpty!48733 (= condMapEmpty!48739 (= mapRest!48733 ((as const (Array (_ BitVec 32) ValueCell!14898)) mapDefault!48739)))))

(declare-fun e!707519 () Bool)

(declare-fun mapRes!48739 () Bool)

(assert (=> mapNonEmpty!48733 (= tp!92834 (and e!707519 mapRes!48739))))

(declare-fun b!1247248 () Bool)

(declare-fun e!707518 () Bool)

(assert (=> b!1247248 (= e!707518 tp_is_empty!31323)))

(declare-fun b!1247249 () Bool)

(assert (=> b!1247249 (= e!707519 tp_is_empty!31323)))

(declare-fun mapNonEmpty!48739 () Bool)

(declare-fun tp!92840 () Bool)

(assert (=> mapNonEmpty!48739 (= mapRes!48739 (and tp!92840 e!707518))))

(declare-fun mapValue!48739 () ValueCell!14898)

(declare-fun mapKey!48739 () (_ BitVec 32))

(declare-fun mapRest!48739 () (Array (_ BitVec 32) ValueCell!14898))

(assert (=> mapNonEmpty!48739 (= mapRest!48733 (store mapRest!48739 mapKey!48739 mapValue!48739))))

(declare-fun mapIsEmpty!48739 () Bool)

(assert (=> mapIsEmpty!48739 mapRes!48739))

(assert (= (and mapNonEmpty!48733 condMapEmpty!48739) mapIsEmpty!48739))

(assert (= (and mapNonEmpty!48733 (not condMapEmpty!48739)) mapNonEmpty!48739))

(assert (= (and mapNonEmpty!48739 ((_ is ValueCellFull!14898) mapValue!48739)) b!1247248))

(assert (= (and mapNonEmpty!48733 ((_ is ValueCellFull!14898) mapDefault!48739)) b!1247249))

(declare-fun m!1148829 () Bool)

(assert (=> mapNonEmpty!48739 m!1148829))

(check-sat (not mapNonEmpty!48739) (not b!1247229) (not b!1247228) (not b!1247239) (not bm!61557) tp_is_empty!31323 (not b!1247238))
(check-sat)
