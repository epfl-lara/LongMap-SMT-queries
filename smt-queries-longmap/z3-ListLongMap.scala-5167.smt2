; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69956 () Bool)

(assert start!69956)

(declare-fun b_free!12409 () Bool)

(declare-fun b_next!12409 () Bool)

(assert (=> start!69956 (= b_free!12409 (not b_next!12409))))

(declare-fun tp!43938 () Bool)

(declare-fun b_and!21151 () Bool)

(assert (=> start!69956 (= tp!43938 b_and!21151)))

(declare-fun b!813130 () Bool)

(declare-fun res!555579 () Bool)

(declare-fun e!450552 () Bool)

(assert (=> b!813130 (=> (not res!555579) (not e!450552))))

(declare-datatypes ((array!44447 0))(
  ( (array!44448 (arr!21285 (Array (_ BitVec 32) (_ BitVec 64))) (size!21706 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44447)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44447 (_ BitVec 32)) Bool)

(assert (=> b!813130 (= res!555579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813131 () Bool)

(assert (=> b!813131 (= e!450552 (bvsgt #b00000000000000000000000000000000 (size!21706 _keys!976)))))

(declare-datatypes ((V!23827 0))(
  ( (V!23828 (val!7107 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23827)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23827)

(declare-datatypes ((ValueCell!6644 0))(
  ( (ValueCellFull!6644 (v!9528 V!23827)) (EmptyCell!6644) )
))
(declare-datatypes ((array!44449 0))(
  ( (array!44450 (arr!21286 (Array (_ BitVec 32) ValueCell!6644)) (size!21707 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44449)

(declare-datatypes ((tuple2!9356 0))(
  ( (tuple2!9357 (_1!4689 (_ BitVec 64)) (_2!4689 V!23827)) )
))
(declare-datatypes ((List!15180 0))(
  ( (Nil!15177) (Cons!15176 (h!16305 tuple2!9356) (t!21486 List!15180)) )
))
(declare-datatypes ((ListLongMap!8169 0))(
  ( (ListLongMap!8170 (toList!4100 List!15180)) )
))
(declare-fun lt!364032 () ListLongMap!8169)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2165 (array!44447 array!44449 (_ BitVec 32) (_ BitVec 32) V!23827 V!23827 (_ BitVec 32) Int) ListLongMap!8169)

(assert (=> b!813131 (= lt!364032 (getCurrentListMapNoExtraKeys!2165 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22756 () Bool)

(declare-fun mapRes!22756 () Bool)

(assert (=> mapIsEmpty!22756 mapRes!22756))

(declare-fun res!555578 () Bool)

(assert (=> start!69956 (=> (not res!555578) (not e!450552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69956 (= res!555578 (validMask!0 mask!1312))))

(assert (=> start!69956 e!450552))

(declare-fun tp_is_empty!14119 () Bool)

(assert (=> start!69956 tp_is_empty!14119))

(declare-fun array_inv!17127 (array!44447) Bool)

(assert (=> start!69956 (array_inv!17127 _keys!976)))

(assert (=> start!69956 true))

(declare-fun e!450553 () Bool)

(declare-fun array_inv!17128 (array!44449) Bool)

(assert (=> start!69956 (and (array_inv!17128 _values!788) e!450553)))

(assert (=> start!69956 tp!43938))

(declare-fun b!813132 () Bool)

(declare-fun e!450555 () Bool)

(assert (=> b!813132 (= e!450555 tp_is_empty!14119)))

(declare-fun b!813133 () Bool)

(declare-fun e!450554 () Bool)

(assert (=> b!813133 (= e!450554 tp_is_empty!14119)))

(declare-fun b!813134 () Bool)

(declare-fun res!555580 () Bool)

(assert (=> b!813134 (=> (not res!555580) (not e!450552))))

(declare-datatypes ((List!15181 0))(
  ( (Nil!15178) (Cons!15177 (h!16306 (_ BitVec 64)) (t!21487 List!15181)) )
))
(declare-fun arrayNoDuplicates!0 (array!44447 (_ BitVec 32) List!15181) Bool)

(assert (=> b!813134 (= res!555580 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15178))))

(declare-fun b!813135 () Bool)

(assert (=> b!813135 (= e!450553 (and e!450554 mapRes!22756))))

(declare-fun condMapEmpty!22756 () Bool)

(declare-fun mapDefault!22756 () ValueCell!6644)

(assert (=> b!813135 (= condMapEmpty!22756 (= (arr!21286 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6644)) mapDefault!22756)))))

(declare-fun b!813136 () Bool)

(declare-fun res!555581 () Bool)

(assert (=> b!813136 (=> (not res!555581) (not e!450552))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813136 (= res!555581 (and (= (size!21707 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21706 _keys!976) (size!21707 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22756 () Bool)

(declare-fun tp!43939 () Bool)

(assert (=> mapNonEmpty!22756 (= mapRes!22756 (and tp!43939 e!450555))))

(declare-fun mapValue!22756 () ValueCell!6644)

(declare-fun mapKey!22756 () (_ BitVec 32))

(declare-fun mapRest!22756 () (Array (_ BitVec 32) ValueCell!6644))

(assert (=> mapNonEmpty!22756 (= (arr!21286 _values!788) (store mapRest!22756 mapKey!22756 mapValue!22756))))

(assert (= (and start!69956 res!555578) b!813136))

(assert (= (and b!813136 res!555581) b!813130))

(assert (= (and b!813130 res!555579) b!813134))

(assert (= (and b!813134 res!555580) b!813131))

(assert (= (and b!813135 condMapEmpty!22756) mapIsEmpty!22756))

(assert (= (and b!813135 (not condMapEmpty!22756)) mapNonEmpty!22756))

(get-info :version)

(assert (= (and mapNonEmpty!22756 ((_ is ValueCellFull!6644) mapValue!22756)) b!813132))

(assert (= (and b!813135 ((_ is ValueCellFull!6644) mapDefault!22756)) b!813133))

(assert (= start!69956 b!813135))

(declare-fun m!754687 () Bool)

(assert (=> b!813131 m!754687))

(declare-fun m!754689 () Bool)

(assert (=> b!813134 m!754689))

(declare-fun m!754691 () Bool)

(assert (=> mapNonEmpty!22756 m!754691))

(declare-fun m!754693 () Bool)

(assert (=> b!813130 m!754693))

(declare-fun m!754695 () Bool)

(assert (=> start!69956 m!754695))

(declare-fun m!754697 () Bool)

(assert (=> start!69956 m!754697))

(declare-fun m!754699 () Bool)

(assert (=> start!69956 m!754699))

(check-sat (not b!813131) (not b_next!12409) (not mapNonEmpty!22756) (not b!813130) (not b!813134) (not start!69956) tp_is_empty!14119 b_and!21151)
(check-sat b_and!21151 (not b_next!12409))
(get-model)

(declare-fun b!813189 () Bool)

(declare-fun e!450594 () Bool)

(declare-fun e!450597 () Bool)

(assert (=> b!813189 (= e!450594 e!450597)))

(declare-fun c!88839 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!813189 (= c!88839 (validKeyInArray!0 (select (arr!21285 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!813190 () Bool)

(declare-fun e!450595 () Bool)

(assert (=> b!813190 (= e!450595 e!450594)))

(declare-fun res!555614 () Bool)

(assert (=> b!813190 (=> (not res!555614) (not e!450594))))

(declare-fun e!450596 () Bool)

(assert (=> b!813190 (= res!555614 (not e!450596))))

(declare-fun res!555612 () Bool)

(assert (=> b!813190 (=> (not res!555612) (not e!450596))))

(assert (=> b!813190 (= res!555612 (validKeyInArray!0 (select (arr!21285 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!813191 () Bool)

(declare-fun call!35467 () Bool)

(assert (=> b!813191 (= e!450597 call!35467)))

(declare-fun b!813192 () Bool)

(declare-fun contains!4122 (List!15181 (_ BitVec 64)) Bool)

(assert (=> b!813192 (= e!450596 (contains!4122 Nil!15178 (select (arr!21285 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35464 () Bool)

(assert (=> bm!35464 (= call!35467 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88839 (Cons!15177 (select (arr!21285 _keys!976) #b00000000000000000000000000000000) Nil!15178) Nil!15178)))))

(declare-fun d!104187 () Bool)

(declare-fun res!555613 () Bool)

(assert (=> d!104187 (=> res!555613 e!450595)))

(assert (=> d!104187 (= res!555613 (bvsge #b00000000000000000000000000000000 (size!21706 _keys!976)))))

(assert (=> d!104187 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15178) e!450595)))

(declare-fun b!813193 () Bool)

(assert (=> b!813193 (= e!450597 call!35467)))

(assert (= (and d!104187 (not res!555613)) b!813190))

(assert (= (and b!813190 res!555612) b!813192))

(assert (= (and b!813190 res!555614) b!813189))

(assert (= (and b!813189 c!88839) b!813191))

(assert (= (and b!813189 (not c!88839)) b!813193))

(assert (= (or b!813191 b!813193) bm!35464))

(declare-fun m!754729 () Bool)

(assert (=> b!813189 m!754729))

(assert (=> b!813189 m!754729))

(declare-fun m!754731 () Bool)

(assert (=> b!813189 m!754731))

(assert (=> b!813190 m!754729))

(assert (=> b!813190 m!754729))

(assert (=> b!813190 m!754731))

(assert (=> b!813192 m!754729))

(assert (=> b!813192 m!754729))

(declare-fun m!754733 () Bool)

(assert (=> b!813192 m!754733))

(assert (=> bm!35464 m!754729))

(declare-fun m!754735 () Bool)

(assert (=> bm!35464 m!754735))

(assert (=> b!813134 d!104187))

(declare-fun d!104189 () Bool)

(assert (=> d!104189 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69956 d!104189))

(declare-fun d!104191 () Bool)

(assert (=> d!104191 (= (array_inv!17127 _keys!976) (bvsge (size!21706 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69956 d!104191))

(declare-fun d!104193 () Bool)

(assert (=> d!104193 (= (array_inv!17128 _values!788) (bvsge (size!21707 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69956 d!104193))

(declare-fun b!813202 () Bool)

(declare-fun e!450606 () Bool)

(declare-fun call!35470 () Bool)

(assert (=> b!813202 (= e!450606 call!35470)))

(declare-fun b!813203 () Bool)

(declare-fun e!450604 () Bool)

(assert (=> b!813203 (= e!450604 e!450606)))

(declare-fun c!88842 () Bool)

(assert (=> b!813203 (= c!88842 (validKeyInArray!0 (select (arr!21285 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35467 () Bool)

(assert (=> bm!35467 (= call!35470 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104195 () Bool)

(declare-fun res!555619 () Bool)

(assert (=> d!104195 (=> res!555619 e!450604)))

(assert (=> d!104195 (= res!555619 (bvsge #b00000000000000000000000000000000 (size!21706 _keys!976)))))

(assert (=> d!104195 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450604)))

(declare-fun b!813204 () Bool)

(declare-fun e!450605 () Bool)

(assert (=> b!813204 (= e!450605 call!35470)))

(declare-fun b!813205 () Bool)

(assert (=> b!813205 (= e!450606 e!450605)))

(declare-fun lt!364047 () (_ BitVec 64))

(assert (=> b!813205 (= lt!364047 (select (arr!21285 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27670 0))(
  ( (Unit!27671) )
))
(declare-fun lt!364045 () Unit!27670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44447 (_ BitVec 64) (_ BitVec 32)) Unit!27670)

(assert (=> b!813205 (= lt!364045 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364047 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!813205 (arrayContainsKey!0 _keys!976 lt!364047 #b00000000000000000000000000000000)))

(declare-fun lt!364046 () Unit!27670)

(assert (=> b!813205 (= lt!364046 lt!364045)))

(declare-fun res!555620 () Bool)

(declare-datatypes ((SeekEntryResult!8715 0))(
  ( (MissingZero!8715 (index!37231 (_ BitVec 32))) (Found!8715 (index!37232 (_ BitVec 32))) (Intermediate!8715 (undefined!9527 Bool) (index!37233 (_ BitVec 32)) (x!68352 (_ BitVec 32))) (Undefined!8715) (MissingVacant!8715 (index!37234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44447 (_ BitVec 32)) SeekEntryResult!8715)

(assert (=> b!813205 (= res!555620 (= (seekEntryOrOpen!0 (select (arr!21285 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8715 #b00000000000000000000000000000000)))))

(assert (=> b!813205 (=> (not res!555620) (not e!450605))))

(assert (= (and d!104195 (not res!555619)) b!813203))

(assert (= (and b!813203 c!88842) b!813205))

(assert (= (and b!813203 (not c!88842)) b!813202))

(assert (= (and b!813205 res!555620) b!813204))

(assert (= (or b!813204 b!813202) bm!35467))

(assert (=> b!813203 m!754729))

(assert (=> b!813203 m!754729))

(assert (=> b!813203 m!754731))

(declare-fun m!754737 () Bool)

(assert (=> bm!35467 m!754737))

(assert (=> b!813205 m!754729))

(declare-fun m!754739 () Bool)

(assert (=> b!813205 m!754739))

(declare-fun m!754741 () Bool)

(assert (=> b!813205 m!754741))

(assert (=> b!813205 m!754729))

(declare-fun m!754743 () Bool)

(assert (=> b!813205 m!754743))

(assert (=> b!813130 d!104195))

(declare-fun b!813230 () Bool)

(declare-fun e!450623 () Bool)

(declare-fun e!450622 () Bool)

(assert (=> b!813230 (= e!450623 e!450622)))

(declare-fun c!88851 () Bool)

(assert (=> b!813230 (= c!88851 (bvslt #b00000000000000000000000000000000 (size!21706 _keys!976)))))

(declare-fun b!813231 () Bool)

(declare-fun lt!364062 () Unit!27670)

(declare-fun lt!364066 () Unit!27670)

(assert (=> b!813231 (= lt!364062 lt!364066)))

(declare-fun lt!364065 () (_ BitVec 64))

(declare-fun lt!364067 () ListLongMap!8169)

(declare-fun lt!364064 () V!23827)

(declare-fun lt!364063 () (_ BitVec 64))

(declare-fun contains!4123 (ListLongMap!8169 (_ BitVec 64)) Bool)

(declare-fun +!1815 (ListLongMap!8169 tuple2!9356) ListLongMap!8169)

(assert (=> b!813231 (not (contains!4123 (+!1815 lt!364067 (tuple2!9357 lt!364065 lt!364064)) lt!364063))))

(declare-fun addStillNotContains!173 (ListLongMap!8169 (_ BitVec 64) V!23827 (_ BitVec 64)) Unit!27670)

(assert (=> b!813231 (= lt!364066 (addStillNotContains!173 lt!364067 lt!364065 lt!364064 lt!364063))))

(assert (=> b!813231 (= lt!364063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11436 (ValueCell!6644 V!23827) V!23827)

(declare-fun dynLambda!961 (Int (_ BitVec 64)) V!23827)

(assert (=> b!813231 (= lt!364064 (get!11436 (select (arr!21286 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!813231 (= lt!364065 (select (arr!21285 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35473 () ListLongMap!8169)

(assert (=> b!813231 (= lt!364067 call!35473)))

(declare-fun e!450624 () ListLongMap!8169)

(assert (=> b!813231 (= e!450624 (+!1815 call!35473 (tuple2!9357 (select (arr!21285 _keys!976) #b00000000000000000000000000000000) (get!11436 (select (arr!21286 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!104197 () Bool)

(declare-fun e!450627 () Bool)

(assert (=> d!104197 e!450627))

(declare-fun res!555629 () Bool)

(assert (=> d!104197 (=> (not res!555629) (not e!450627))))

(declare-fun lt!364068 () ListLongMap!8169)

(assert (=> d!104197 (= res!555629 (not (contains!4123 lt!364068 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!450626 () ListLongMap!8169)

(assert (=> d!104197 (= lt!364068 e!450626)))

(declare-fun c!88853 () Bool)

(assert (=> d!104197 (= c!88853 (bvsge #b00000000000000000000000000000000 (size!21706 _keys!976)))))

(assert (=> d!104197 (validMask!0 mask!1312)))

(assert (=> d!104197 (= (getCurrentListMapNoExtraKeys!2165 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364068)))

(declare-fun b!813232 () Bool)

(assert (=> b!813232 (= e!450624 call!35473)))

(declare-fun b!813233 () Bool)

(declare-fun res!555631 () Bool)

(assert (=> b!813233 (=> (not res!555631) (not e!450627))))

(assert (=> b!813233 (= res!555631 (not (contains!4123 lt!364068 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!813234 () Bool)

(declare-fun e!450621 () Bool)

(assert (=> b!813234 (= e!450623 e!450621)))

(assert (=> b!813234 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21706 _keys!976)))))

(declare-fun res!555632 () Bool)

(assert (=> b!813234 (= res!555632 (contains!4123 lt!364068 (select (arr!21285 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!813234 (=> (not res!555632) (not e!450621))))

(declare-fun b!813235 () Bool)

(assert (=> b!813235 (= e!450626 (ListLongMap!8170 Nil!15177))))

(declare-fun b!813236 () Bool)

(declare-fun isEmpty!634 (ListLongMap!8169) Bool)

(assert (=> b!813236 (= e!450622 (isEmpty!634 lt!364068))))

(declare-fun b!813237 () Bool)

(assert (=> b!813237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21706 _keys!976)))))

(assert (=> b!813237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21707 _values!788)))))

(declare-fun apply!347 (ListLongMap!8169 (_ BitVec 64)) V!23827)

(assert (=> b!813237 (= e!450621 (= (apply!347 lt!364068 (select (arr!21285 _keys!976) #b00000000000000000000000000000000)) (get!11436 (select (arr!21286 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!35470 () Bool)

(assert (=> bm!35470 (= call!35473 (getCurrentListMapNoExtraKeys!2165 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!813238 () Bool)

(assert (=> b!813238 (= e!450622 (= lt!364068 (getCurrentListMapNoExtraKeys!2165 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!813239 () Bool)

(assert (=> b!813239 (= e!450626 e!450624)))

(declare-fun c!88852 () Bool)

(assert (=> b!813239 (= c!88852 (validKeyInArray!0 (select (arr!21285 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!813240 () Bool)

(assert (=> b!813240 (= e!450627 e!450623)))

(declare-fun c!88854 () Bool)

(declare-fun e!450625 () Bool)

(assert (=> b!813240 (= c!88854 e!450625)))

(declare-fun res!555630 () Bool)

(assert (=> b!813240 (=> (not res!555630) (not e!450625))))

(assert (=> b!813240 (= res!555630 (bvslt #b00000000000000000000000000000000 (size!21706 _keys!976)))))

(declare-fun b!813241 () Bool)

(assert (=> b!813241 (= e!450625 (validKeyInArray!0 (select (arr!21285 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!813241 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104197 c!88853) b!813235))

(assert (= (and d!104197 (not c!88853)) b!813239))

(assert (= (and b!813239 c!88852) b!813231))

(assert (= (and b!813239 (not c!88852)) b!813232))

(assert (= (or b!813231 b!813232) bm!35470))

(assert (= (and d!104197 res!555629) b!813233))

(assert (= (and b!813233 res!555631) b!813240))

(assert (= (and b!813240 res!555630) b!813241))

(assert (= (and b!813240 c!88854) b!813234))

(assert (= (and b!813240 (not c!88854)) b!813230))

(assert (= (and b!813234 res!555632) b!813237))

(assert (= (and b!813230 c!88851) b!813238))

(assert (= (and b!813230 (not c!88851)) b!813236))

(declare-fun b_lambda!10805 () Bool)

(assert (=> (not b_lambda!10805) (not b!813231)))

(declare-fun t!21490 () Bool)

(declare-fun tb!4167 () Bool)

(assert (=> (and start!69956 (= defaultEntry!796 defaultEntry!796) t!21490) tb!4167))

(declare-fun result!7857 () Bool)

(assert (=> tb!4167 (= result!7857 tp_is_empty!14119)))

(assert (=> b!813231 t!21490))

(declare-fun b_and!21157 () Bool)

(assert (= b_and!21151 (and (=> t!21490 result!7857) b_and!21157)))

(declare-fun b_lambda!10807 () Bool)

(assert (=> (not b_lambda!10807) (not b!813237)))

(assert (=> b!813237 t!21490))

(declare-fun b_and!21159 () Bool)

(assert (= b_and!21157 (and (=> t!21490 result!7857) b_and!21159)))

(declare-fun m!754745 () Bool)

(assert (=> b!813237 m!754745))

(declare-fun m!754747 () Bool)

(assert (=> b!813237 m!754747))

(declare-fun m!754749 () Bool)

(assert (=> b!813237 m!754749))

(assert (=> b!813237 m!754729))

(declare-fun m!754751 () Bool)

(assert (=> b!813237 m!754751))

(assert (=> b!813237 m!754747))

(assert (=> b!813237 m!754729))

(assert (=> b!813237 m!754745))

(declare-fun m!754753 () Bool)

(assert (=> b!813236 m!754753))

(assert (=> b!813241 m!754729))

(assert (=> b!813241 m!754729))

(assert (=> b!813241 m!754731))

(declare-fun m!754755 () Bool)

(assert (=> d!104197 m!754755))

(assert (=> d!104197 m!754695))

(declare-fun m!754757 () Bool)

(assert (=> bm!35470 m!754757))

(assert (=> b!813238 m!754757))

(assert (=> b!813234 m!754729))

(assert (=> b!813234 m!754729))

(declare-fun m!754759 () Bool)

(assert (=> b!813234 m!754759))

(declare-fun m!754761 () Bool)

(assert (=> b!813233 m!754761))

(assert (=> b!813231 m!754745))

(assert (=> b!813231 m!754747))

(assert (=> b!813231 m!754749))

(declare-fun m!754763 () Bool)

(assert (=> b!813231 m!754763))

(assert (=> b!813231 m!754747))

(assert (=> b!813231 m!754729))

(declare-fun m!754765 () Bool)

(assert (=> b!813231 m!754765))

(declare-fun m!754767 () Bool)

(assert (=> b!813231 m!754767))

(assert (=> b!813231 m!754745))

(assert (=> b!813231 m!754763))

(declare-fun m!754769 () Bool)

(assert (=> b!813231 m!754769))

(assert (=> b!813239 m!754729))

(assert (=> b!813239 m!754729))

(assert (=> b!813239 m!754731))

(assert (=> b!813131 d!104197))

(declare-fun mapNonEmpty!22765 () Bool)

(declare-fun mapRes!22765 () Bool)

(declare-fun tp!43954 () Bool)

(declare-fun e!450633 () Bool)

(assert (=> mapNonEmpty!22765 (= mapRes!22765 (and tp!43954 e!450633))))

(declare-fun mapKey!22765 () (_ BitVec 32))

(declare-fun mapValue!22765 () ValueCell!6644)

(declare-fun mapRest!22765 () (Array (_ BitVec 32) ValueCell!6644))

(assert (=> mapNonEmpty!22765 (= mapRest!22756 (store mapRest!22765 mapKey!22765 mapValue!22765))))

(declare-fun b!813250 () Bool)

(assert (=> b!813250 (= e!450633 tp_is_empty!14119)))

(declare-fun condMapEmpty!22765 () Bool)

(declare-fun mapDefault!22765 () ValueCell!6644)

(assert (=> mapNonEmpty!22756 (= condMapEmpty!22765 (= mapRest!22756 ((as const (Array (_ BitVec 32) ValueCell!6644)) mapDefault!22765)))))

(declare-fun e!450632 () Bool)

(assert (=> mapNonEmpty!22756 (= tp!43939 (and e!450632 mapRes!22765))))

(declare-fun mapIsEmpty!22765 () Bool)

(assert (=> mapIsEmpty!22765 mapRes!22765))

(declare-fun b!813251 () Bool)

(assert (=> b!813251 (= e!450632 tp_is_empty!14119)))

(assert (= (and mapNonEmpty!22756 condMapEmpty!22765) mapIsEmpty!22765))

(assert (= (and mapNonEmpty!22756 (not condMapEmpty!22765)) mapNonEmpty!22765))

(assert (= (and mapNonEmpty!22765 ((_ is ValueCellFull!6644) mapValue!22765)) b!813250))

(assert (= (and mapNonEmpty!22756 ((_ is ValueCellFull!6644) mapDefault!22765)) b!813251))

(declare-fun m!754771 () Bool)

(assert (=> mapNonEmpty!22765 m!754771))

(declare-fun b_lambda!10809 () Bool)

(assert (= b_lambda!10805 (or (and start!69956 b_free!12409) b_lambda!10809)))

(declare-fun b_lambda!10811 () Bool)

(assert (= b_lambda!10807 (or (and start!69956 b_free!12409) b_lambda!10811)))

(check-sat (not b!813236) (not b_next!12409) (not b!813203) (not b!813237) (not d!104197) (not bm!35467) (not b!813231) (not mapNonEmpty!22765) tp_is_empty!14119 b_and!21159 (not bm!35470) (not b!813189) (not bm!35464) (not b!813190) (not b!813241) (not b!813239) (not b_lambda!10811) (not b!813233) (not b!813234) (not b!813238) (not b_lambda!10809) (not b!813192) (not b!813205))
(check-sat b_and!21159 (not b_next!12409))
