; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70012 () Bool)

(assert start!70012)

(declare-fun b!813125 () Bool)

(declare-fun e!450408 () Bool)

(declare-datatypes ((List!14992 0))(
  ( (Nil!14989) (Cons!14988 (h!16123 (_ BitVec 64)) (t!21299 List!14992)) )
))
(declare-fun contains!4117 (List!14992 (_ BitVec 64)) Bool)

(assert (=> b!813125 (= e!450408 (contains!4117 Nil!14989 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!813126 () Bool)

(declare-fun e!450407 () Bool)

(declare-fun tp_is_empty!14011 () Bool)

(assert (=> b!813126 (= e!450407 tp_is_empty!14011)))

(declare-fun b!813127 () Bool)

(declare-fun res!555407 () Bool)

(declare-fun e!450410 () Bool)

(assert (=> b!813127 (=> (not res!555407) (not e!450410))))

(declare-datatypes ((array!44243 0))(
  ( (array!44244 (arr!21180 (Array (_ BitVec 32) (_ BitVec 64))) (size!21600 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44243)

(assert (=> b!813127 (= res!555407 (and (bvsle #b00000000000000000000000000000000 (size!21600 _keys!976)) (bvslt (size!21600 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun res!555410 () Bool)

(assert (=> start!70012 (=> (not res!555410) (not e!450410))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70012 (= res!555410 (validMask!0 mask!1312))))

(assert (=> start!70012 e!450410))

(declare-fun array_inv!17027 (array!44243) Bool)

(assert (=> start!70012 (array_inv!17027 _keys!976)))

(assert (=> start!70012 true))

(declare-datatypes ((V!23683 0))(
  ( (V!23684 (val!7053 Int)) )
))
(declare-datatypes ((ValueCell!6590 0))(
  ( (ValueCellFull!6590 (v!9479 V!23683)) (EmptyCell!6590) )
))
(declare-datatypes ((array!44245 0))(
  ( (array!44246 (arr!21181 (Array (_ BitVec 32) ValueCell!6590)) (size!21601 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44245)

(declare-fun e!450406 () Bool)

(declare-fun array_inv!17028 (array!44245) Bool)

(assert (=> start!70012 (and (array_inv!17028 _values!788) e!450406)))

(declare-fun mapNonEmpty!22588 () Bool)

(declare-fun mapRes!22588 () Bool)

(declare-fun tp!43696 () Bool)

(assert (=> mapNonEmpty!22588 (= mapRes!22588 (and tp!43696 e!450407))))

(declare-fun mapRest!22588 () (Array (_ BitVec 32) ValueCell!6590))

(declare-fun mapValue!22588 () ValueCell!6590)

(declare-fun mapKey!22588 () (_ BitVec 32))

(assert (=> mapNonEmpty!22588 (= (arr!21181 _values!788) (store mapRest!22588 mapKey!22588 mapValue!22588))))

(declare-fun b!813128 () Bool)

(assert (=> b!813128 (= e!450410 e!450408)))

(declare-fun res!555408 () Bool)

(assert (=> b!813128 (=> res!555408 e!450408)))

(assert (=> b!813128 (= res!555408 (contains!4117 Nil!14989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!813129 () Bool)

(declare-fun e!450409 () Bool)

(assert (=> b!813129 (= e!450406 (and e!450409 mapRes!22588))))

(declare-fun condMapEmpty!22588 () Bool)

(declare-fun mapDefault!22588 () ValueCell!6590)

(assert (=> b!813129 (= condMapEmpty!22588 (= (arr!21181 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6590)) mapDefault!22588)))))

(declare-fun b!813130 () Bool)

(assert (=> b!813130 (= e!450409 tp_is_empty!14011)))

(declare-fun b!813131 () Bool)

(declare-fun res!555405 () Bool)

(assert (=> b!813131 (=> (not res!555405) (not e!450410))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813131 (= res!555405 (and (= (size!21601 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21600 _keys!976) (size!21601 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813132 () Bool)

(declare-fun res!555409 () Bool)

(assert (=> b!813132 (=> (not res!555409) (not e!450410))))

(declare-fun noDuplicate!1295 (List!14992) Bool)

(assert (=> b!813132 (= res!555409 (noDuplicate!1295 Nil!14989))))

(declare-fun b!813133 () Bool)

(declare-fun res!555406 () Bool)

(assert (=> b!813133 (=> (not res!555406) (not e!450410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44243 (_ BitVec 32)) Bool)

(assert (=> b!813133 (= res!555406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22588 () Bool)

(assert (=> mapIsEmpty!22588 mapRes!22588))

(assert (= (and start!70012 res!555410) b!813131))

(assert (= (and b!813131 res!555405) b!813133))

(assert (= (and b!813133 res!555406) b!813127))

(assert (= (and b!813127 res!555407) b!813132))

(assert (= (and b!813132 res!555409) b!813128))

(assert (= (and b!813128 (not res!555408)) b!813125))

(assert (= (and b!813129 condMapEmpty!22588) mapIsEmpty!22588))

(assert (= (and b!813129 (not condMapEmpty!22588)) mapNonEmpty!22588))

(get-info :version)

(assert (= (and mapNonEmpty!22588 ((_ is ValueCellFull!6590) mapValue!22588)) b!813126))

(assert (= (and b!813129 ((_ is ValueCellFull!6590) mapDefault!22588)) b!813130))

(assert (= start!70012 b!813129))

(declare-fun m!755967 () Bool)

(assert (=> b!813125 m!755967))

(declare-fun m!755969 () Bool)

(assert (=> b!813132 m!755969))

(declare-fun m!755971 () Bool)

(assert (=> b!813128 m!755971))

(declare-fun m!755973 () Bool)

(assert (=> start!70012 m!755973))

(declare-fun m!755975 () Bool)

(assert (=> start!70012 m!755975))

(declare-fun m!755977 () Bool)

(assert (=> start!70012 m!755977))

(declare-fun m!755979 () Bool)

(assert (=> b!813133 m!755979))

(declare-fun m!755981 () Bool)

(assert (=> mapNonEmpty!22588 m!755981))

(check-sat (not b!813125) (not b!813128) (not b!813132) (not b!813133) (not mapNonEmpty!22588) (not start!70012) tp_is_empty!14011)
(check-sat)
(get-model)

(declare-fun d!104643 () Bool)

(declare-fun lt!364463 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!385 (List!14992) (InoxSet (_ BitVec 64)))

(assert (=> d!104643 (= lt!364463 (select (content!385 Nil!14989) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!450453 () Bool)

(assert (=> d!104643 (= lt!364463 e!450453)))

(declare-fun res!555451 () Bool)

(assert (=> d!104643 (=> (not res!555451) (not e!450453))))

(assert (=> d!104643 (= res!555451 ((_ is Cons!14988) Nil!14989))))

(assert (=> d!104643 (= (contains!4117 Nil!14989 #b1000000000000000000000000000000000000000000000000000000000000000) lt!364463)))

(declare-fun b!813192 () Bool)

(declare-fun e!450452 () Bool)

(assert (=> b!813192 (= e!450453 e!450452)))

(declare-fun res!555452 () Bool)

(assert (=> b!813192 (=> res!555452 e!450452)))

(assert (=> b!813192 (= res!555452 (= (h!16123 Nil!14989) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!813193 () Bool)

(assert (=> b!813193 (= e!450452 (contains!4117 (t!21299 Nil!14989) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!104643 res!555451) b!813192))

(assert (= (and b!813192 (not res!555452)) b!813193))

(declare-fun m!756015 () Bool)

(assert (=> d!104643 m!756015))

(declare-fun m!756017 () Bool)

(assert (=> d!104643 m!756017))

(declare-fun m!756019 () Bool)

(assert (=> b!813193 m!756019))

(assert (=> b!813125 d!104643))

(declare-fun d!104645 () Bool)

(assert (=> d!104645 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70012 d!104645))

(declare-fun d!104647 () Bool)

(assert (=> d!104647 (= (array_inv!17027 _keys!976) (bvsge (size!21600 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70012 d!104647))

(declare-fun d!104649 () Bool)

(assert (=> d!104649 (= (array_inv!17028 _values!788) (bvsge (size!21601 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70012 d!104649))

(declare-fun d!104651 () Bool)

(declare-fun lt!364464 () Bool)

(assert (=> d!104651 (= lt!364464 (select (content!385 Nil!14989) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!450455 () Bool)

(assert (=> d!104651 (= lt!364464 e!450455)))

(declare-fun res!555453 () Bool)

(assert (=> d!104651 (=> (not res!555453) (not e!450455))))

(assert (=> d!104651 (= res!555453 ((_ is Cons!14988) Nil!14989))))

(assert (=> d!104651 (= (contains!4117 Nil!14989 #b0000000000000000000000000000000000000000000000000000000000000000) lt!364464)))

(declare-fun b!813194 () Bool)

(declare-fun e!450454 () Bool)

(assert (=> b!813194 (= e!450455 e!450454)))

(declare-fun res!555454 () Bool)

(assert (=> b!813194 (=> res!555454 e!450454)))

(assert (=> b!813194 (= res!555454 (= (h!16123 Nil!14989) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!813195 () Bool)

(assert (=> b!813195 (= e!450454 (contains!4117 (t!21299 Nil!14989) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!104651 res!555453) b!813194))

(assert (= (and b!813194 (not res!555454)) b!813195))

(assert (=> d!104651 m!756015))

(declare-fun m!756021 () Bool)

(assert (=> d!104651 m!756021))

(declare-fun m!756023 () Bool)

(assert (=> b!813195 m!756023))

(assert (=> b!813128 d!104651))

(declare-fun b!813204 () Bool)

(declare-fun e!450464 () Bool)

(declare-fun e!450463 () Bool)

(assert (=> b!813204 (= e!450464 e!450463)))

(declare-fun lt!364472 () (_ BitVec 64))

(assert (=> b!813204 (= lt!364472 (select (arr!21180 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27693 0))(
  ( (Unit!27694) )
))
(declare-fun lt!364471 () Unit!27693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44243 (_ BitVec 64) (_ BitVec 32)) Unit!27693)

(assert (=> b!813204 (= lt!364471 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364472 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!813204 (arrayContainsKey!0 _keys!976 lt!364472 #b00000000000000000000000000000000)))

(declare-fun lt!364473 () Unit!27693)

(assert (=> b!813204 (= lt!364473 lt!364471)))

(declare-fun res!555460 () Bool)

(declare-datatypes ((SeekEntryResult!8668 0))(
  ( (MissingZero!8668 (index!37043 (_ BitVec 32))) (Found!8668 (index!37044 (_ BitVec 32))) (Intermediate!8668 (undefined!9480 Bool) (index!37045 (_ BitVec 32)) (x!68167 (_ BitVec 32))) (Undefined!8668) (MissingVacant!8668 (index!37046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44243 (_ BitVec 32)) SeekEntryResult!8668)

(assert (=> b!813204 (= res!555460 (= (seekEntryOrOpen!0 (select (arr!21180 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8668 #b00000000000000000000000000000000)))))

(assert (=> b!813204 (=> (not res!555460) (not e!450463))))

(declare-fun b!813205 () Bool)

(declare-fun call!35529 () Bool)

(assert (=> b!813205 (= e!450464 call!35529)))

(declare-fun d!104653 () Bool)

(declare-fun res!555459 () Bool)

(declare-fun e!450462 () Bool)

(assert (=> d!104653 (=> res!555459 e!450462)))

(assert (=> d!104653 (= res!555459 (bvsge #b00000000000000000000000000000000 (size!21600 _keys!976)))))

(assert (=> d!104653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450462)))

(declare-fun b!813206 () Bool)

(assert (=> b!813206 (= e!450463 call!35529)))

(declare-fun bm!35526 () Bool)

(assert (=> bm!35526 (= call!35529 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!813207 () Bool)

(assert (=> b!813207 (= e!450462 e!450464)))

(declare-fun c!89177 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!813207 (= c!89177 (validKeyInArray!0 (select (arr!21180 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104653 (not res!555459)) b!813207))

(assert (= (and b!813207 c!89177) b!813204))

(assert (= (and b!813207 (not c!89177)) b!813205))

(assert (= (and b!813204 res!555460) b!813206))

(assert (= (or b!813206 b!813205) bm!35526))

(declare-fun m!756025 () Bool)

(assert (=> b!813204 m!756025))

(declare-fun m!756027 () Bool)

(assert (=> b!813204 m!756027))

(declare-fun m!756029 () Bool)

(assert (=> b!813204 m!756029))

(assert (=> b!813204 m!756025))

(declare-fun m!756031 () Bool)

(assert (=> b!813204 m!756031))

(declare-fun m!756033 () Bool)

(assert (=> bm!35526 m!756033))

(assert (=> b!813207 m!756025))

(assert (=> b!813207 m!756025))

(declare-fun m!756035 () Bool)

(assert (=> b!813207 m!756035))

(assert (=> b!813133 d!104653))

(declare-fun d!104655 () Bool)

(declare-fun res!555465 () Bool)

(declare-fun e!450469 () Bool)

(assert (=> d!104655 (=> res!555465 e!450469)))

(assert (=> d!104655 (= res!555465 ((_ is Nil!14989) Nil!14989))))

(assert (=> d!104655 (= (noDuplicate!1295 Nil!14989) e!450469)))

(declare-fun b!813212 () Bool)

(declare-fun e!450470 () Bool)

(assert (=> b!813212 (= e!450469 e!450470)))

(declare-fun res!555466 () Bool)

(assert (=> b!813212 (=> (not res!555466) (not e!450470))))

(assert (=> b!813212 (= res!555466 (not (contains!4117 (t!21299 Nil!14989) (h!16123 Nil!14989))))))

(declare-fun b!813213 () Bool)

(assert (=> b!813213 (= e!450470 (noDuplicate!1295 (t!21299 Nil!14989)))))

(assert (= (and d!104655 (not res!555465)) b!813212))

(assert (= (and b!813212 res!555466) b!813213))

(declare-fun m!756037 () Bool)

(assert (=> b!813212 m!756037))

(declare-fun m!756039 () Bool)

(assert (=> b!813213 m!756039))

(assert (=> b!813132 d!104655))

(declare-fun mapIsEmpty!22597 () Bool)

(declare-fun mapRes!22597 () Bool)

(assert (=> mapIsEmpty!22597 mapRes!22597))

(declare-fun b!813220 () Bool)

(declare-fun e!450475 () Bool)

(assert (=> b!813220 (= e!450475 tp_is_empty!14011)))

(declare-fun b!813221 () Bool)

(declare-fun e!450476 () Bool)

(assert (=> b!813221 (= e!450476 tp_is_empty!14011)))

(declare-fun mapNonEmpty!22597 () Bool)

(declare-fun tp!43705 () Bool)

(assert (=> mapNonEmpty!22597 (= mapRes!22597 (and tp!43705 e!450475))))

(declare-fun mapRest!22597 () (Array (_ BitVec 32) ValueCell!6590))

(declare-fun mapKey!22597 () (_ BitVec 32))

(declare-fun mapValue!22597 () ValueCell!6590)

(assert (=> mapNonEmpty!22597 (= mapRest!22588 (store mapRest!22597 mapKey!22597 mapValue!22597))))

(declare-fun condMapEmpty!22597 () Bool)

(declare-fun mapDefault!22597 () ValueCell!6590)

(assert (=> mapNonEmpty!22588 (= condMapEmpty!22597 (= mapRest!22588 ((as const (Array (_ BitVec 32) ValueCell!6590)) mapDefault!22597)))))

(assert (=> mapNonEmpty!22588 (= tp!43696 (and e!450476 mapRes!22597))))

(assert (= (and mapNonEmpty!22588 condMapEmpty!22597) mapIsEmpty!22597))

(assert (= (and mapNonEmpty!22588 (not condMapEmpty!22597)) mapNonEmpty!22597))

(assert (= (and mapNonEmpty!22597 ((_ is ValueCellFull!6590) mapValue!22597)) b!813220))

(assert (= (and mapNonEmpty!22588 ((_ is ValueCellFull!6590) mapDefault!22597)) b!813221))

(declare-fun m!756041 () Bool)

(assert (=> mapNonEmpty!22597 m!756041))

(check-sat (not b!813195) (not b!813204) (not d!104651) (not b!813212) (not b!813193) (not mapNonEmpty!22597) (not b!813207) (not d!104643) tp_is_empty!14011 (not bm!35526) (not b!813213))
(check-sat)
