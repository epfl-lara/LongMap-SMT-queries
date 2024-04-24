; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104780 () Bool)

(assert start!104780)

(declare-fun b!1248404 () Bool)

(declare-fun res!832703 () Bool)

(declare-fun e!708254 () Bool)

(assert (=> b!1248404 (=> (not res!832703) (not e!708254))))

(declare-datatypes ((array!80355 0))(
  ( (array!80356 (arr!38745 (Array (_ BitVec 32) (_ BitVec 64))) (size!39282 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80355)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80355 (_ BitVec 32)) Bool)

(assert (=> b!1248404 (= res!832703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248405 () Bool)

(declare-fun e!708251 () Bool)

(declare-fun tp_is_empty!31315 () Bool)

(assert (=> b!1248405 (= e!708251 tp_is_empty!31315)))

(declare-fun mapIsEmpty!48718 () Bool)

(declare-fun mapRes!48718 () Bool)

(assert (=> mapIsEmpty!48718 mapRes!48718))

(declare-fun res!832701 () Bool)

(assert (=> start!104780 (=> (not res!832701) (not e!708254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104780 (= res!832701 (validMask!0 mask!1466))))

(assert (=> start!104780 e!708254))

(assert (=> start!104780 true))

(declare-fun array_inv!29675 (array!80355) Bool)

(assert (=> start!104780 (array_inv!29675 _keys!1118)))

(declare-datatypes ((V!47119 0))(
  ( (V!47120 (val!15720 Int)) )
))
(declare-datatypes ((ValueCell!14894 0))(
  ( (ValueCellFull!14894 (v!18411 V!47119)) (EmptyCell!14894) )
))
(declare-datatypes ((array!80357 0))(
  ( (array!80358 (arr!38746 (Array (_ BitVec 32) ValueCell!14894)) (size!39283 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80357)

(declare-fun e!708255 () Bool)

(declare-fun array_inv!29676 (array!80357) Bool)

(assert (=> start!104780 (and (array_inv!29676 _values!914) e!708255)))

(declare-fun b!1248406 () Bool)

(assert (=> b!1248406 (= e!708254 (and (bvsle #b00000000000000000000000000000000 (size!39282 _keys!1118)) (bvsge (size!39282 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1248407 () Bool)

(assert (=> b!1248407 (= e!708255 (and e!708251 mapRes!48718))))

(declare-fun condMapEmpty!48718 () Bool)

(declare-fun mapDefault!48718 () ValueCell!14894)

(assert (=> b!1248407 (= condMapEmpty!48718 (= (arr!38746 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14894)) mapDefault!48718)))))

(declare-fun b!1248408 () Bool)

(declare-fun res!832702 () Bool)

(assert (=> b!1248408 (=> (not res!832702) (not e!708254))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1248408 (= res!832702 (and (= (size!39283 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39282 _keys!1118) (size!39283 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248409 () Bool)

(declare-fun e!708252 () Bool)

(assert (=> b!1248409 (= e!708252 tp_is_empty!31315)))

(declare-fun mapNonEmpty!48718 () Bool)

(declare-fun tp!92819 () Bool)

(assert (=> mapNonEmpty!48718 (= mapRes!48718 (and tp!92819 e!708252))))

(declare-fun mapValue!48718 () ValueCell!14894)

(declare-fun mapRest!48718 () (Array (_ BitVec 32) ValueCell!14894))

(declare-fun mapKey!48718 () (_ BitVec 32))

(assert (=> mapNonEmpty!48718 (= (arr!38746 _values!914) (store mapRest!48718 mapKey!48718 mapValue!48718))))

(assert (= (and start!104780 res!832701) b!1248408))

(assert (= (and b!1248408 res!832702) b!1248404))

(assert (= (and b!1248404 res!832703) b!1248406))

(assert (= (and b!1248407 condMapEmpty!48718) mapIsEmpty!48718))

(assert (= (and b!1248407 (not condMapEmpty!48718)) mapNonEmpty!48718))

(get-info :version)

(assert (= (and mapNonEmpty!48718 ((_ is ValueCellFull!14894) mapValue!48718)) b!1248409))

(assert (= (and b!1248407 ((_ is ValueCellFull!14894) mapDefault!48718)) b!1248405))

(assert (= start!104780 b!1248407))

(declare-fun m!1150345 () Bool)

(assert (=> b!1248404 m!1150345))

(declare-fun m!1150347 () Bool)

(assert (=> start!104780 m!1150347))

(declare-fun m!1150349 () Bool)

(assert (=> start!104780 m!1150349))

(declare-fun m!1150351 () Bool)

(assert (=> start!104780 m!1150351))

(declare-fun m!1150353 () Bool)

(assert (=> mapNonEmpty!48718 m!1150353))

(check-sat (not start!104780) (not b!1248404) (not mapNonEmpty!48718) tp_is_empty!31315)
(check-sat)
(get-model)

(declare-fun d!138179 () Bool)

(assert (=> d!138179 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104780 d!138179))

(declare-fun d!138181 () Bool)

(assert (=> d!138181 (= (array_inv!29675 _keys!1118) (bvsge (size!39282 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104780 d!138181))

(declare-fun d!138183 () Bool)

(assert (=> d!138183 (= (array_inv!29676 _values!914) (bvsge (size!39283 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104780 d!138183))

(declare-fun b!1248454 () Bool)

(declare-fun e!708293 () Bool)

(declare-fun e!708294 () Bool)

(assert (=> b!1248454 (= e!708293 e!708294)))

(declare-fun lt!563709 () (_ BitVec 64))

(assert (=> b!1248454 (= lt!563709 (select (arr!38745 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41440 0))(
  ( (Unit!41441) )
))
(declare-fun lt!563708 () Unit!41440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80355 (_ BitVec 64) (_ BitVec 32)) Unit!41440)

(assert (=> b!1248454 (= lt!563708 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563709 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1248454 (arrayContainsKey!0 _keys!1118 lt!563709 #b00000000000000000000000000000000)))

(declare-fun lt!563710 () Unit!41440)

(assert (=> b!1248454 (= lt!563710 lt!563708)))

(declare-fun res!832727 () Bool)

(declare-datatypes ((SeekEntryResult!9909 0))(
  ( (MissingZero!9909 (index!42007 (_ BitVec 32))) (Found!9909 (index!42008 (_ BitVec 32))) (Intermediate!9909 (undefined!10721 Bool) (index!42009 (_ BitVec 32)) (x!109562 (_ BitVec 32))) (Undefined!9909) (MissingVacant!9909 (index!42010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80355 (_ BitVec 32)) SeekEntryResult!9909)

(assert (=> b!1248454 (= res!832727 (= (seekEntryOrOpen!0 (select (arr!38745 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9909 #b00000000000000000000000000000000)))))

(assert (=> b!1248454 (=> (not res!832727) (not e!708294))))

(declare-fun b!1248455 () Bool)

(declare-fun call!61622 () Bool)

(assert (=> b!1248455 (= e!708294 call!61622)))

(declare-fun b!1248456 () Bool)

(declare-fun e!708292 () Bool)

(assert (=> b!1248456 (= e!708292 e!708293)))

(declare-fun c!122494 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248456 (= c!122494 (validKeyInArray!0 (select (arr!38745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138185 () Bool)

(declare-fun res!832726 () Bool)

(assert (=> d!138185 (=> res!832726 e!708292)))

(assert (=> d!138185 (= res!832726 (bvsge #b00000000000000000000000000000000 (size!39282 _keys!1118)))))

(assert (=> d!138185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!708292)))

(declare-fun b!1248457 () Bool)

(assert (=> b!1248457 (= e!708293 call!61622)))

(declare-fun bm!61619 () Bool)

(assert (=> bm!61619 (= call!61622 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138185 (not res!832726)) b!1248456))

(assert (= (and b!1248456 c!122494) b!1248454))

(assert (= (and b!1248456 (not c!122494)) b!1248457))

(assert (= (and b!1248454 res!832727) b!1248455))

(assert (= (or b!1248455 b!1248457) bm!61619))

(declare-fun m!1150375 () Bool)

(assert (=> b!1248454 m!1150375))

(declare-fun m!1150377 () Bool)

(assert (=> b!1248454 m!1150377))

(declare-fun m!1150379 () Bool)

(assert (=> b!1248454 m!1150379))

(assert (=> b!1248454 m!1150375))

(declare-fun m!1150381 () Bool)

(assert (=> b!1248454 m!1150381))

(assert (=> b!1248456 m!1150375))

(assert (=> b!1248456 m!1150375))

(declare-fun m!1150383 () Bool)

(assert (=> b!1248456 m!1150383))

(declare-fun m!1150385 () Bool)

(assert (=> bm!61619 m!1150385))

(assert (=> b!1248404 d!138185))

(declare-fun mapIsEmpty!48727 () Bool)

(declare-fun mapRes!48727 () Bool)

(assert (=> mapIsEmpty!48727 mapRes!48727))

(declare-fun mapNonEmpty!48727 () Bool)

(declare-fun tp!92828 () Bool)

(declare-fun e!708300 () Bool)

(assert (=> mapNonEmpty!48727 (= mapRes!48727 (and tp!92828 e!708300))))

(declare-fun mapRest!48727 () (Array (_ BitVec 32) ValueCell!14894))

(declare-fun mapValue!48727 () ValueCell!14894)

(declare-fun mapKey!48727 () (_ BitVec 32))

(assert (=> mapNonEmpty!48727 (= mapRest!48718 (store mapRest!48727 mapKey!48727 mapValue!48727))))

(declare-fun b!1248464 () Bool)

(assert (=> b!1248464 (= e!708300 tp_is_empty!31315)))

(declare-fun b!1248465 () Bool)

(declare-fun e!708299 () Bool)

(assert (=> b!1248465 (= e!708299 tp_is_empty!31315)))

(declare-fun condMapEmpty!48727 () Bool)

(declare-fun mapDefault!48727 () ValueCell!14894)

(assert (=> mapNonEmpty!48718 (= condMapEmpty!48727 (= mapRest!48718 ((as const (Array (_ BitVec 32) ValueCell!14894)) mapDefault!48727)))))

(assert (=> mapNonEmpty!48718 (= tp!92819 (and e!708299 mapRes!48727))))

(assert (= (and mapNonEmpty!48718 condMapEmpty!48727) mapIsEmpty!48727))

(assert (= (and mapNonEmpty!48718 (not condMapEmpty!48727)) mapNonEmpty!48727))

(assert (= (and mapNonEmpty!48727 ((_ is ValueCellFull!14894) mapValue!48727)) b!1248464))

(assert (= (and mapNonEmpty!48718 ((_ is ValueCellFull!14894) mapDefault!48727)) b!1248465))

(declare-fun m!1150387 () Bool)

(assert (=> mapNonEmpty!48727 m!1150387))

(check-sat (not mapNonEmpty!48727) (not b!1248456) (not bm!61619) tp_is_empty!31315 (not b!1248454))
(check-sat)
