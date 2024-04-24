; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104766 () Bool)

(assert start!104766)

(declare-fun mapNonEmpty!48706 () Bool)

(declare-fun mapRes!48706 () Bool)

(declare-fun tp!92807 () Bool)

(declare-fun e!708195 () Bool)

(assert (=> mapNonEmpty!48706 (= mapRes!48706 (and tp!92807 e!708195))))

(declare-datatypes ((V!47111 0))(
  ( (V!47112 (val!15717 Int)) )
))
(declare-datatypes ((ValueCell!14891 0))(
  ( (ValueCellFull!14891 (v!18408 V!47111)) (EmptyCell!14891) )
))
(declare-fun mapRest!48706 () (Array (_ BitVec 32) ValueCell!14891))

(declare-fun mapValue!48706 () ValueCell!14891)

(declare-datatypes ((array!80343 0))(
  ( (array!80344 (arr!38740 (Array (_ BitVec 32) ValueCell!14891)) (size!39277 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80343)

(declare-fun mapKey!48706 () (_ BitVec 32))

(assert (=> mapNonEmpty!48706 (= (arr!38740 _values!914) (store mapRest!48706 mapKey!48706 mapValue!48706))))

(declare-fun b!1248330 () Bool)

(declare-fun tp_is_empty!31309 () Bool)

(assert (=> b!1248330 (= e!708195 tp_is_empty!31309)))

(declare-fun mapIsEmpty!48706 () Bool)

(assert (=> mapIsEmpty!48706 mapRes!48706))

(declare-fun b!1248331 () Bool)

(declare-fun e!708191 () Bool)

(assert (=> b!1248331 (= e!708191 tp_is_empty!31309)))

(declare-fun b!1248332 () Bool)

(declare-fun res!832669 () Bool)

(declare-fun e!708192 () Bool)

(assert (=> b!1248332 (=> (not res!832669) (not e!708192))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80345 0))(
  ( (array!80346 (arr!38741 (Array (_ BitVec 32) (_ BitVec 64))) (size!39278 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80345)

(assert (=> b!1248332 (= res!832669 (and (= (size!39277 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39278 _keys!1118) (size!39277 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832668 () Bool)

(assert (=> start!104766 (=> (not res!832668) (not e!708192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104766 (= res!832668 (validMask!0 mask!1466))))

(assert (=> start!104766 e!708192))

(assert (=> start!104766 true))

(declare-fun array_inv!29673 (array!80345) Bool)

(assert (=> start!104766 (array_inv!29673 _keys!1118)))

(declare-fun e!708194 () Bool)

(declare-fun array_inv!29674 (array!80343) Bool)

(assert (=> start!104766 (and (array_inv!29674 _values!914) e!708194)))

(declare-fun b!1248333 () Bool)

(assert (=> b!1248333 (= e!708192 (bvsgt #b00000000000000000000000000000000 (size!39278 _keys!1118)))))

(declare-fun b!1248334 () Bool)

(assert (=> b!1248334 (= e!708194 (and e!708191 mapRes!48706))))

(declare-fun condMapEmpty!48706 () Bool)

(declare-fun mapDefault!48706 () ValueCell!14891)

(assert (=> b!1248334 (= condMapEmpty!48706 (= (arr!38740 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14891)) mapDefault!48706)))))

(declare-fun b!1248335 () Bool)

(declare-fun res!832670 () Bool)

(assert (=> b!1248335 (=> (not res!832670) (not e!708192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80345 (_ BitVec 32)) Bool)

(assert (=> b!1248335 (= res!832670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104766 res!832668) b!1248332))

(assert (= (and b!1248332 res!832669) b!1248335))

(assert (= (and b!1248335 res!832670) b!1248333))

(assert (= (and b!1248334 condMapEmpty!48706) mapIsEmpty!48706))

(assert (= (and b!1248334 (not condMapEmpty!48706)) mapNonEmpty!48706))

(get-info :version)

(assert (= (and mapNonEmpty!48706 ((_ is ValueCellFull!14891) mapValue!48706)) b!1248330))

(assert (= (and b!1248334 ((_ is ValueCellFull!14891) mapDefault!48706)) b!1248331))

(assert (= start!104766 b!1248334))

(declare-fun m!1150301 () Bool)

(assert (=> mapNonEmpty!48706 m!1150301))

(declare-fun m!1150303 () Bool)

(assert (=> start!104766 m!1150303))

(declare-fun m!1150305 () Bool)

(assert (=> start!104766 m!1150305))

(declare-fun m!1150307 () Bool)

(assert (=> start!104766 m!1150307))

(declare-fun m!1150309 () Bool)

(assert (=> b!1248335 m!1150309))

(check-sat (not b!1248335) (not start!104766) (not mapNonEmpty!48706) tp_is_empty!31309)
(check-sat)
(get-model)

(declare-fun d!138169 () Bool)

(declare-fun res!832694 () Bool)

(declare-fun e!708233 () Bool)

(assert (=> d!138169 (=> res!832694 e!708233)))

(assert (=> d!138169 (= res!832694 (bvsge #b00000000000000000000000000000000 (size!39278 _keys!1118)))))

(assert (=> d!138169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!708233)))

(declare-fun b!1248380 () Bool)

(declare-fun e!708232 () Bool)

(assert (=> b!1248380 (= e!708233 e!708232)))

(declare-fun c!122491 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248380 (= c!122491 (validKeyInArray!0 (select (arr!38741 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1248381 () Bool)

(declare-fun call!61619 () Bool)

(assert (=> b!1248381 (= e!708232 call!61619)))

(declare-fun b!1248382 () Bool)

(declare-fun e!708234 () Bool)

(assert (=> b!1248382 (= e!708232 e!708234)))

(declare-fun lt!563700 () (_ BitVec 64))

(assert (=> b!1248382 (= lt!563700 (select (arr!38741 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41438 0))(
  ( (Unit!41439) )
))
(declare-fun lt!563701 () Unit!41438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80345 (_ BitVec 64) (_ BitVec 32)) Unit!41438)

(assert (=> b!1248382 (= lt!563701 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563700 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1248382 (arrayContainsKey!0 _keys!1118 lt!563700 #b00000000000000000000000000000000)))

(declare-fun lt!563699 () Unit!41438)

(assert (=> b!1248382 (= lt!563699 lt!563701)))

(declare-fun res!832693 () Bool)

(declare-datatypes ((SeekEntryResult!9908 0))(
  ( (MissingZero!9908 (index!42003 (_ BitVec 32))) (Found!9908 (index!42004 (_ BitVec 32))) (Intermediate!9908 (undefined!10720 Bool) (index!42005 (_ BitVec 32)) (x!109551 (_ BitVec 32))) (Undefined!9908) (MissingVacant!9908 (index!42006 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80345 (_ BitVec 32)) SeekEntryResult!9908)

(assert (=> b!1248382 (= res!832693 (= (seekEntryOrOpen!0 (select (arr!38741 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9908 #b00000000000000000000000000000000)))))

(assert (=> b!1248382 (=> (not res!832693) (not e!708234))))

(declare-fun b!1248383 () Bool)

(assert (=> b!1248383 (= e!708234 call!61619)))

(declare-fun bm!61616 () Bool)

(assert (=> bm!61616 (= call!61619 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138169 (not res!832694)) b!1248380))

(assert (= (and b!1248380 c!122491) b!1248382))

(assert (= (and b!1248380 (not c!122491)) b!1248381))

(assert (= (and b!1248382 res!832693) b!1248383))

(assert (= (or b!1248383 b!1248381) bm!61616))

(declare-fun m!1150331 () Bool)

(assert (=> b!1248380 m!1150331))

(assert (=> b!1248380 m!1150331))

(declare-fun m!1150333 () Bool)

(assert (=> b!1248380 m!1150333))

(assert (=> b!1248382 m!1150331))

(declare-fun m!1150335 () Bool)

(assert (=> b!1248382 m!1150335))

(declare-fun m!1150337 () Bool)

(assert (=> b!1248382 m!1150337))

(assert (=> b!1248382 m!1150331))

(declare-fun m!1150339 () Bool)

(assert (=> b!1248382 m!1150339))

(declare-fun m!1150341 () Bool)

(assert (=> bm!61616 m!1150341))

(assert (=> b!1248335 d!138169))

(declare-fun d!138171 () Bool)

(assert (=> d!138171 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104766 d!138171))

(declare-fun d!138173 () Bool)

(assert (=> d!138173 (= (array_inv!29673 _keys!1118) (bvsge (size!39278 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104766 d!138173))

(declare-fun d!138175 () Bool)

(assert (=> d!138175 (= (array_inv!29674 _values!914) (bvsge (size!39277 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104766 d!138175))

(declare-fun b!1248390 () Bool)

(declare-fun e!708239 () Bool)

(assert (=> b!1248390 (= e!708239 tp_is_empty!31309)))

(declare-fun mapIsEmpty!48715 () Bool)

(declare-fun mapRes!48715 () Bool)

(assert (=> mapIsEmpty!48715 mapRes!48715))

(declare-fun mapNonEmpty!48715 () Bool)

(declare-fun tp!92816 () Bool)

(assert (=> mapNonEmpty!48715 (= mapRes!48715 (and tp!92816 e!708239))))

(declare-fun mapRest!48715 () (Array (_ BitVec 32) ValueCell!14891))

(declare-fun mapKey!48715 () (_ BitVec 32))

(declare-fun mapValue!48715 () ValueCell!14891)

(assert (=> mapNonEmpty!48715 (= mapRest!48706 (store mapRest!48715 mapKey!48715 mapValue!48715))))

(declare-fun b!1248391 () Bool)

(declare-fun e!708240 () Bool)

(assert (=> b!1248391 (= e!708240 tp_is_empty!31309)))

(declare-fun condMapEmpty!48715 () Bool)

(declare-fun mapDefault!48715 () ValueCell!14891)

(assert (=> mapNonEmpty!48706 (= condMapEmpty!48715 (= mapRest!48706 ((as const (Array (_ BitVec 32) ValueCell!14891)) mapDefault!48715)))))

(assert (=> mapNonEmpty!48706 (= tp!92807 (and e!708240 mapRes!48715))))

(assert (= (and mapNonEmpty!48706 condMapEmpty!48715) mapIsEmpty!48715))

(assert (= (and mapNonEmpty!48706 (not condMapEmpty!48715)) mapNonEmpty!48715))

(assert (= (and mapNonEmpty!48715 ((_ is ValueCellFull!14891) mapValue!48715)) b!1248390))

(assert (= (and mapNonEmpty!48706 ((_ is ValueCellFull!14891) mapDefault!48715)) b!1248391))

(declare-fun m!1150343 () Bool)

(assert (=> mapNonEmpty!48715 m!1150343))

(check-sat (not b!1248380) (not b!1248382) tp_is_empty!31309 (not mapNonEmpty!48715) (not bm!61616))
(check-sat)
