; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40324 () Bool)

(assert start!40324)

(declare-fun b!443104 () Bool)

(declare-fun res!262564 () Bool)

(declare-fun e!260733 () Bool)

(assert (=> b!443104 (=> (not res!262564) (not e!260733))))

(declare-datatypes ((array!27286 0))(
  ( (array!27287 (arr!13091 (Array (_ BitVec 32) (_ BitVec 64))) (size!13443 (_ BitVec 32))) )
))
(declare-fun lt!203316 () array!27286)

(declare-datatypes ((List!7756 0))(
  ( (Nil!7753) (Cons!7752 (h!8608 (_ BitVec 64)) (t!13506 List!7756)) )
))
(declare-fun arrayNoDuplicates!0 (array!27286 (_ BitVec 32) List!7756) Bool)

(assert (=> b!443104 (= res!262564 (arrayNoDuplicates!0 lt!203316 #b00000000000000000000000000000000 Nil!7753))))

(declare-fun b!443106 () Bool)

(declare-fun e!260735 () Bool)

(assert (=> b!443106 (= e!260735 e!260733)))

(declare-fun res!262561 () Bool)

(assert (=> b!443106 (=> (not res!262561) (not e!260733))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27286 (_ BitVec 32)) Bool)

(assert (=> b!443106 (= res!262561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203316 mask!1025))))

(declare-fun _keys!709 () array!27286)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443106 (= lt!203316 (array!27287 (store (arr!13091 _keys!709) i!563 k0!794) (size!13443 _keys!709)))))

(declare-fun b!443107 () Bool)

(declare-fun res!262555 () Bool)

(assert (=> b!443107 (=> (not res!262555) (not e!260735))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16755 0))(
  ( (V!16756 (val!5913 Int)) )
))
(declare-datatypes ((ValueCell!5525 0))(
  ( (ValueCellFull!5525 (v!8165 V!16755)) (EmptyCell!5525) )
))
(declare-datatypes ((array!27288 0))(
  ( (array!27289 (arr!13092 (Array (_ BitVec 32) ValueCell!5525)) (size!13444 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27288)

(assert (=> b!443107 (= res!262555 (and (= (size!13444 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13443 _keys!709) (size!13444 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19230 () Bool)

(declare-fun mapRes!19230 () Bool)

(declare-fun tp!37212 () Bool)

(declare-fun e!260737 () Bool)

(assert (=> mapNonEmpty!19230 (= mapRes!19230 (and tp!37212 e!260737))))

(declare-fun mapKey!19230 () (_ BitVec 32))

(declare-fun mapRest!19230 () (Array (_ BitVec 32) ValueCell!5525))

(declare-fun mapValue!19230 () ValueCell!5525)

(assert (=> mapNonEmpty!19230 (= (arr!13092 _values!549) (store mapRest!19230 mapKey!19230 mapValue!19230))))

(declare-fun mapIsEmpty!19230 () Bool)

(assert (=> mapIsEmpty!19230 mapRes!19230))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun b!443108 () Bool)

(assert (=> b!443108 (= e!260733 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13443 _keys!709)) (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!443109 () Bool)

(declare-fun res!262556 () Bool)

(assert (=> b!443109 (=> (not res!262556) (not e!260735))))

(assert (=> b!443109 (= res!262556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443110 () Bool)

(declare-fun tp_is_empty!11737 () Bool)

(assert (=> b!443110 (= e!260737 tp_is_empty!11737)))

(declare-fun b!443111 () Bool)

(declare-fun res!262557 () Bool)

(assert (=> b!443111 (=> (not res!262557) (not e!260735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443111 (= res!262557 (validMask!0 mask!1025))))

(declare-fun b!443112 () Bool)

(declare-fun res!262560 () Bool)

(assert (=> b!443112 (=> (not res!262560) (not e!260735))))

(assert (=> b!443112 (= res!262560 (or (= (select (arr!13091 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13091 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!262562 () Bool)

(assert (=> start!40324 (=> (not res!262562) (not e!260735))))

(assert (=> start!40324 (= res!262562 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13443 _keys!709))))))

(assert (=> start!40324 e!260735))

(assert (=> start!40324 true))

(declare-fun e!260736 () Bool)

(declare-fun array_inv!9566 (array!27288) Bool)

(assert (=> start!40324 (and (array_inv!9566 _values!549) e!260736)))

(declare-fun array_inv!9567 (array!27286) Bool)

(assert (=> start!40324 (array_inv!9567 _keys!709)))

(declare-fun b!443105 () Bool)

(declare-fun res!262565 () Bool)

(assert (=> b!443105 (=> (not res!262565) (not e!260735))))

(assert (=> b!443105 (= res!262565 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7753))))

(declare-fun b!443113 () Bool)

(declare-fun res!262559 () Bool)

(assert (=> b!443113 (=> (not res!262559) (not e!260735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443113 (= res!262559 (validKeyInArray!0 k0!794))))

(declare-fun b!443114 () Bool)

(declare-fun res!262563 () Bool)

(assert (=> b!443114 (=> (not res!262563) (not e!260735))))

(assert (=> b!443114 (= res!262563 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13443 _keys!709))))))

(declare-fun b!443115 () Bool)

(declare-fun e!260738 () Bool)

(assert (=> b!443115 (= e!260736 (and e!260738 mapRes!19230))))

(declare-fun condMapEmpty!19230 () Bool)

(declare-fun mapDefault!19230 () ValueCell!5525)

(assert (=> b!443115 (= condMapEmpty!19230 (= (arr!13092 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5525)) mapDefault!19230)))))

(declare-fun b!443116 () Bool)

(assert (=> b!443116 (= e!260738 tp_is_empty!11737)))

(declare-fun b!443117 () Bool)

(declare-fun res!262558 () Bool)

(assert (=> b!443117 (=> (not res!262558) (not e!260735))))

(declare-fun arrayContainsKey!0 (array!27286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443117 (= res!262558 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40324 res!262562) b!443111))

(assert (= (and b!443111 res!262557) b!443107))

(assert (= (and b!443107 res!262555) b!443109))

(assert (= (and b!443109 res!262556) b!443105))

(assert (= (and b!443105 res!262565) b!443114))

(assert (= (and b!443114 res!262563) b!443113))

(assert (= (and b!443113 res!262559) b!443112))

(assert (= (and b!443112 res!262560) b!443117))

(assert (= (and b!443117 res!262558) b!443106))

(assert (= (and b!443106 res!262561) b!443104))

(assert (= (and b!443104 res!262564) b!443108))

(assert (= (and b!443115 condMapEmpty!19230) mapIsEmpty!19230))

(assert (= (and b!443115 (not condMapEmpty!19230)) mapNonEmpty!19230))

(get-info :version)

(assert (= (and mapNonEmpty!19230 ((_ is ValueCellFull!5525) mapValue!19230)) b!443110))

(assert (= (and b!443115 ((_ is ValueCellFull!5525) mapDefault!19230)) b!443116))

(assert (= start!40324 b!443115))

(declare-fun m!429747 () Bool)

(assert (=> b!443104 m!429747))

(declare-fun m!429749 () Bool)

(assert (=> b!443109 m!429749))

(declare-fun m!429751 () Bool)

(assert (=> b!443106 m!429751))

(declare-fun m!429753 () Bool)

(assert (=> b!443106 m!429753))

(declare-fun m!429755 () Bool)

(assert (=> b!443112 m!429755))

(declare-fun m!429757 () Bool)

(assert (=> b!443117 m!429757))

(declare-fun m!429759 () Bool)

(assert (=> b!443113 m!429759))

(declare-fun m!429761 () Bool)

(assert (=> start!40324 m!429761))

(declare-fun m!429763 () Bool)

(assert (=> start!40324 m!429763))

(declare-fun m!429765 () Bool)

(assert (=> b!443105 m!429765))

(declare-fun m!429767 () Bool)

(assert (=> mapNonEmpty!19230 m!429767))

(declare-fun m!429769 () Bool)

(assert (=> b!443111 m!429769))

(check-sat (not b!443106) (not b!443104) (not b!443105) tp_is_empty!11737 (not b!443111) (not b!443113) (not b!443109) (not mapNonEmpty!19230) (not start!40324) (not b!443117))
(check-sat)
(get-model)

(declare-fun d!74109 () Bool)

(assert (=> d!74109 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!443111 d!74109))

(declare-fun d!74111 () Bool)

(declare-fun res!262636 () Bool)

(declare-fun e!260779 () Bool)

(assert (=> d!74111 (=> res!262636 e!260779)))

(assert (=> d!74111 (= res!262636 (= (select (arr!13091 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74111 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!260779)))

(declare-fun b!443206 () Bool)

(declare-fun e!260780 () Bool)

(assert (=> b!443206 (= e!260779 e!260780)))

(declare-fun res!262637 () Bool)

(assert (=> b!443206 (=> (not res!262637) (not e!260780))))

(assert (=> b!443206 (= res!262637 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13443 _keys!709)))))

(declare-fun b!443207 () Bool)

(assert (=> b!443207 (= e!260780 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74111 (not res!262636)) b!443206))

(assert (= (and b!443206 res!262637) b!443207))

(declare-fun m!429819 () Bool)

(assert (=> d!74111 m!429819))

(declare-fun m!429821 () Bool)

(assert (=> b!443207 m!429821))

(assert (=> b!443117 d!74111))

(declare-fun b!443218 () Bool)

(declare-fun e!260792 () Bool)

(declare-fun e!260790 () Bool)

(assert (=> b!443218 (= e!260792 e!260790)))

(declare-fun res!262644 () Bool)

(assert (=> b!443218 (=> (not res!262644) (not e!260790))))

(declare-fun e!260789 () Bool)

(assert (=> b!443218 (= res!262644 (not e!260789))))

(declare-fun res!262646 () Bool)

(assert (=> b!443218 (=> (not res!262646) (not e!260789))))

(assert (=> b!443218 (= res!262646 (validKeyInArray!0 (select (arr!13091 lt!203316) #b00000000000000000000000000000000)))))

(declare-fun b!443220 () Bool)

(declare-fun e!260791 () Bool)

(assert (=> b!443220 (= e!260790 e!260791)))

(declare-fun c!55820 () Bool)

(assert (=> b!443220 (= c!55820 (validKeyInArray!0 (select (arr!13091 lt!203316) #b00000000000000000000000000000000)))))

(declare-fun bm!29541 () Bool)

(declare-fun call!29544 () Bool)

(assert (=> bm!29541 (= call!29544 (arrayNoDuplicates!0 lt!203316 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55820 (Cons!7752 (select (arr!13091 lt!203316) #b00000000000000000000000000000000) Nil!7753) Nil!7753)))))

(declare-fun b!443221 () Bool)

(assert (=> b!443221 (= e!260791 call!29544)))

(declare-fun b!443222 () Bool)

(declare-fun contains!2468 (List!7756 (_ BitVec 64)) Bool)

(assert (=> b!443222 (= e!260789 (contains!2468 Nil!7753 (select (arr!13091 lt!203316) #b00000000000000000000000000000000)))))

(declare-fun d!74113 () Bool)

(declare-fun res!262645 () Bool)

(assert (=> d!74113 (=> res!262645 e!260792)))

(assert (=> d!74113 (= res!262645 (bvsge #b00000000000000000000000000000000 (size!13443 lt!203316)))))

(assert (=> d!74113 (= (arrayNoDuplicates!0 lt!203316 #b00000000000000000000000000000000 Nil!7753) e!260792)))

(declare-fun b!443219 () Bool)

(assert (=> b!443219 (= e!260791 call!29544)))

(assert (= (and d!74113 (not res!262645)) b!443218))

(assert (= (and b!443218 res!262646) b!443222))

(assert (= (and b!443218 res!262644) b!443220))

(assert (= (and b!443220 c!55820) b!443219))

(assert (= (and b!443220 (not c!55820)) b!443221))

(assert (= (or b!443219 b!443221) bm!29541))

(declare-fun m!429823 () Bool)

(assert (=> b!443218 m!429823))

(assert (=> b!443218 m!429823))

(declare-fun m!429825 () Bool)

(assert (=> b!443218 m!429825))

(assert (=> b!443220 m!429823))

(assert (=> b!443220 m!429823))

(assert (=> b!443220 m!429825))

(assert (=> bm!29541 m!429823))

(declare-fun m!429827 () Bool)

(assert (=> bm!29541 m!429827))

(assert (=> b!443222 m!429823))

(assert (=> b!443222 m!429823))

(declare-fun m!429829 () Bool)

(assert (=> b!443222 m!429829))

(assert (=> b!443104 d!74113))

(declare-fun d!74115 () Bool)

(assert (=> d!74115 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!443113 d!74115))

(declare-fun b!443223 () Bool)

(declare-fun e!260796 () Bool)

(declare-fun e!260794 () Bool)

(assert (=> b!443223 (= e!260796 e!260794)))

(declare-fun res!262647 () Bool)

(assert (=> b!443223 (=> (not res!262647) (not e!260794))))

(declare-fun e!260793 () Bool)

(assert (=> b!443223 (= res!262647 (not e!260793))))

(declare-fun res!262649 () Bool)

(assert (=> b!443223 (=> (not res!262649) (not e!260793))))

(assert (=> b!443223 (= res!262649 (validKeyInArray!0 (select (arr!13091 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!443225 () Bool)

(declare-fun e!260795 () Bool)

(assert (=> b!443225 (= e!260794 e!260795)))

(declare-fun c!55821 () Bool)

(assert (=> b!443225 (= c!55821 (validKeyInArray!0 (select (arr!13091 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!29542 () Bool)

(declare-fun call!29545 () Bool)

(assert (=> bm!29542 (= call!29545 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55821 (Cons!7752 (select (arr!13091 _keys!709) #b00000000000000000000000000000000) Nil!7753) Nil!7753)))))

(declare-fun b!443226 () Bool)

(assert (=> b!443226 (= e!260795 call!29545)))

(declare-fun b!443227 () Bool)

(assert (=> b!443227 (= e!260793 (contains!2468 Nil!7753 (select (arr!13091 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74117 () Bool)

(declare-fun res!262648 () Bool)

(assert (=> d!74117 (=> res!262648 e!260796)))

(assert (=> d!74117 (= res!262648 (bvsge #b00000000000000000000000000000000 (size!13443 _keys!709)))))

(assert (=> d!74117 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7753) e!260796)))

(declare-fun b!443224 () Bool)

(assert (=> b!443224 (= e!260795 call!29545)))

(assert (= (and d!74117 (not res!262648)) b!443223))

(assert (= (and b!443223 res!262649) b!443227))

(assert (= (and b!443223 res!262647) b!443225))

(assert (= (and b!443225 c!55821) b!443224))

(assert (= (and b!443225 (not c!55821)) b!443226))

(assert (= (or b!443224 b!443226) bm!29542))

(assert (=> b!443223 m!429819))

(assert (=> b!443223 m!429819))

(declare-fun m!429831 () Bool)

(assert (=> b!443223 m!429831))

(assert (=> b!443225 m!429819))

(assert (=> b!443225 m!429819))

(assert (=> b!443225 m!429831))

(assert (=> bm!29542 m!429819))

(declare-fun m!429833 () Bool)

(assert (=> bm!29542 m!429833))

(assert (=> b!443227 m!429819))

(assert (=> b!443227 m!429819))

(declare-fun m!429835 () Bool)

(assert (=> b!443227 m!429835))

(assert (=> b!443105 d!74117))

(declare-fun b!443236 () Bool)

(declare-fun e!260803 () Bool)

(declare-fun e!260805 () Bool)

(assert (=> b!443236 (= e!260803 e!260805)))

(declare-fun lt!203329 () (_ BitVec 64))

(assert (=> b!443236 (= lt!203329 (select (arr!13091 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13129 0))(
  ( (Unit!13130) )
))
(declare-fun lt!203331 () Unit!13129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27286 (_ BitVec 64) (_ BitVec 32)) Unit!13129)

(assert (=> b!443236 (= lt!203331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203329 #b00000000000000000000000000000000))))

(assert (=> b!443236 (arrayContainsKey!0 _keys!709 lt!203329 #b00000000000000000000000000000000)))

(declare-fun lt!203330 () Unit!13129)

(assert (=> b!443236 (= lt!203330 lt!203331)))

(declare-fun res!262655 () Bool)

(declare-datatypes ((SeekEntryResult!3477 0))(
  ( (MissingZero!3477 (index!16087 (_ BitVec 32))) (Found!3477 (index!16088 (_ BitVec 32))) (Intermediate!3477 (undefined!4289 Bool) (index!16089 (_ BitVec 32)) (x!41757 (_ BitVec 32))) (Undefined!3477) (MissingVacant!3477 (index!16090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27286 (_ BitVec 32)) SeekEntryResult!3477)

(assert (=> b!443236 (= res!262655 (= (seekEntryOrOpen!0 (select (arr!13091 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3477 #b00000000000000000000000000000000)))))

(assert (=> b!443236 (=> (not res!262655) (not e!260805))))

(declare-fun b!443237 () Bool)

(declare-fun call!29548 () Bool)

(assert (=> b!443237 (= e!260805 call!29548)))

(declare-fun b!443238 () Bool)

(declare-fun e!260804 () Bool)

(assert (=> b!443238 (= e!260804 e!260803)))

(declare-fun c!55824 () Bool)

(assert (=> b!443238 (= c!55824 (validKeyInArray!0 (select (arr!13091 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!443239 () Bool)

(assert (=> b!443239 (= e!260803 call!29548)))

(declare-fun d!74119 () Bool)

(declare-fun res!262654 () Bool)

(assert (=> d!74119 (=> res!262654 e!260804)))

(assert (=> d!74119 (= res!262654 (bvsge #b00000000000000000000000000000000 (size!13443 _keys!709)))))

(assert (=> d!74119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!260804)))

(declare-fun bm!29545 () Bool)

(assert (=> bm!29545 (= call!29548 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!74119 (not res!262654)) b!443238))

(assert (= (and b!443238 c!55824) b!443236))

(assert (= (and b!443238 (not c!55824)) b!443239))

(assert (= (and b!443236 res!262655) b!443237))

(assert (= (or b!443237 b!443239) bm!29545))

(assert (=> b!443236 m!429819))

(declare-fun m!429837 () Bool)

(assert (=> b!443236 m!429837))

(declare-fun m!429839 () Bool)

(assert (=> b!443236 m!429839))

(assert (=> b!443236 m!429819))

(declare-fun m!429841 () Bool)

(assert (=> b!443236 m!429841))

(assert (=> b!443238 m!429819))

(assert (=> b!443238 m!429819))

(assert (=> b!443238 m!429831))

(declare-fun m!429843 () Bool)

(assert (=> bm!29545 m!429843))

(assert (=> b!443109 d!74119))

(declare-fun b!443240 () Bool)

(declare-fun e!260806 () Bool)

(declare-fun e!260808 () Bool)

(assert (=> b!443240 (= e!260806 e!260808)))

(declare-fun lt!203332 () (_ BitVec 64))

(assert (=> b!443240 (= lt!203332 (select (arr!13091 lt!203316) #b00000000000000000000000000000000))))

(declare-fun lt!203334 () Unit!13129)

(assert (=> b!443240 (= lt!203334 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203316 lt!203332 #b00000000000000000000000000000000))))

(assert (=> b!443240 (arrayContainsKey!0 lt!203316 lt!203332 #b00000000000000000000000000000000)))

(declare-fun lt!203333 () Unit!13129)

(assert (=> b!443240 (= lt!203333 lt!203334)))

(declare-fun res!262657 () Bool)

(assert (=> b!443240 (= res!262657 (= (seekEntryOrOpen!0 (select (arr!13091 lt!203316) #b00000000000000000000000000000000) lt!203316 mask!1025) (Found!3477 #b00000000000000000000000000000000)))))

(assert (=> b!443240 (=> (not res!262657) (not e!260808))))

(declare-fun b!443241 () Bool)

(declare-fun call!29549 () Bool)

(assert (=> b!443241 (= e!260808 call!29549)))

(declare-fun b!443242 () Bool)

(declare-fun e!260807 () Bool)

(assert (=> b!443242 (= e!260807 e!260806)))

(declare-fun c!55825 () Bool)

(assert (=> b!443242 (= c!55825 (validKeyInArray!0 (select (arr!13091 lt!203316) #b00000000000000000000000000000000)))))

(declare-fun b!443243 () Bool)

(assert (=> b!443243 (= e!260806 call!29549)))

(declare-fun d!74121 () Bool)

(declare-fun res!262656 () Bool)

(assert (=> d!74121 (=> res!262656 e!260807)))

(assert (=> d!74121 (= res!262656 (bvsge #b00000000000000000000000000000000 (size!13443 lt!203316)))))

(assert (=> d!74121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203316 mask!1025) e!260807)))

(declare-fun bm!29546 () Bool)

(assert (=> bm!29546 (= call!29549 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203316 mask!1025))))

(assert (= (and d!74121 (not res!262656)) b!443242))

(assert (= (and b!443242 c!55825) b!443240))

(assert (= (and b!443242 (not c!55825)) b!443243))

(assert (= (and b!443240 res!262657) b!443241))

(assert (= (or b!443241 b!443243) bm!29546))

(assert (=> b!443240 m!429823))

(declare-fun m!429845 () Bool)

(assert (=> b!443240 m!429845))

(declare-fun m!429847 () Bool)

(assert (=> b!443240 m!429847))

(assert (=> b!443240 m!429823))

(declare-fun m!429849 () Bool)

(assert (=> b!443240 m!429849))

(assert (=> b!443242 m!429823))

(assert (=> b!443242 m!429823))

(assert (=> b!443242 m!429825))

(declare-fun m!429851 () Bool)

(assert (=> bm!29546 m!429851))

(assert (=> b!443106 d!74121))

(declare-fun d!74123 () Bool)

(assert (=> d!74123 (= (array_inv!9566 _values!549) (bvsge (size!13444 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40324 d!74123))

(declare-fun d!74125 () Bool)

(assert (=> d!74125 (= (array_inv!9567 _keys!709) (bvsge (size!13443 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40324 d!74125))

(declare-fun mapNonEmpty!19239 () Bool)

(declare-fun mapRes!19239 () Bool)

(declare-fun tp!37221 () Bool)

(declare-fun e!260813 () Bool)

(assert (=> mapNonEmpty!19239 (= mapRes!19239 (and tp!37221 e!260813))))

(declare-fun mapRest!19239 () (Array (_ BitVec 32) ValueCell!5525))

(declare-fun mapKey!19239 () (_ BitVec 32))

(declare-fun mapValue!19239 () ValueCell!5525)

(assert (=> mapNonEmpty!19239 (= mapRest!19230 (store mapRest!19239 mapKey!19239 mapValue!19239))))

(declare-fun b!443251 () Bool)

(declare-fun e!260814 () Bool)

(assert (=> b!443251 (= e!260814 tp_is_empty!11737)))

(declare-fun b!443250 () Bool)

(assert (=> b!443250 (= e!260813 tp_is_empty!11737)))

(declare-fun mapIsEmpty!19239 () Bool)

(assert (=> mapIsEmpty!19239 mapRes!19239))

(declare-fun condMapEmpty!19239 () Bool)

(declare-fun mapDefault!19239 () ValueCell!5525)

(assert (=> mapNonEmpty!19230 (= condMapEmpty!19239 (= mapRest!19230 ((as const (Array (_ BitVec 32) ValueCell!5525)) mapDefault!19239)))))

(assert (=> mapNonEmpty!19230 (= tp!37212 (and e!260814 mapRes!19239))))

(assert (= (and mapNonEmpty!19230 condMapEmpty!19239) mapIsEmpty!19239))

(assert (= (and mapNonEmpty!19230 (not condMapEmpty!19239)) mapNonEmpty!19239))

(assert (= (and mapNonEmpty!19239 ((_ is ValueCellFull!5525) mapValue!19239)) b!443250))

(assert (= (and mapNonEmpty!19230 ((_ is ValueCellFull!5525) mapDefault!19239)) b!443251))

(declare-fun m!429853 () Bool)

(assert (=> mapNonEmpty!19239 m!429853))

(check-sat (not bm!29542) (not b!443227) (not b!443240) (not b!443236) (not b!443220) tp_is_empty!11737 (not b!443207) (not bm!29545) (not b!443218) (not bm!29546) (not b!443242) (not b!443222) (not b!443238) (not mapNonEmpty!19239) (not b!443223) (not b!443225) (not bm!29541))
(check-sat)
