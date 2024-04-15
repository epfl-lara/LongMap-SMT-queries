; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69892 () Bool)

(assert start!69892)

(declare-fun b!812528 () Bool)

(declare-fun e!450119 () Bool)

(declare-fun e!450120 () Bool)

(declare-fun mapRes!22672 () Bool)

(assert (=> b!812528 (= e!450119 (and e!450120 mapRes!22672))))

(declare-fun condMapEmpty!22672 () Bool)

(declare-datatypes ((V!23755 0))(
  ( (V!23756 (val!7080 Int)) )
))
(declare-datatypes ((ValueCell!6617 0))(
  ( (ValueCellFull!6617 (v!9501 V!23755)) (EmptyCell!6617) )
))
(declare-datatypes ((array!44349 0))(
  ( (array!44350 (arr!21237 (Array (_ BitVec 32) ValueCell!6617)) (size!21658 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44349)

(declare-fun mapDefault!22672 () ValueCell!6617)

(assert (=> b!812528 (= condMapEmpty!22672 (= (arr!21237 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6617)) mapDefault!22672)))))

(declare-fun b!812529 () Bool)

(declare-fun e!450121 () Bool)

(declare-datatypes ((array!44351 0))(
  ( (array!44352 (arr!21238 (Array (_ BitVec 32) (_ BitVec 64))) (size!21659 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44351)

(assert (=> b!812529 (= e!450121 (bvsgt #b00000000000000000000000000000000 (size!21659 _keys!976)))))

(declare-fun res!555239 () Bool)

(assert (=> start!69892 (=> (not res!555239) (not e!450121))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69892 (= res!555239 (validMask!0 mask!1312))))

(assert (=> start!69892 e!450121))

(declare-fun array_inv!17095 (array!44351) Bool)

(assert (=> start!69892 (array_inv!17095 _keys!976)))

(assert (=> start!69892 true))

(declare-fun array_inv!17096 (array!44349) Bool)

(assert (=> start!69892 (and (array_inv!17096 _values!788) e!450119)))

(declare-fun mapIsEmpty!22672 () Bool)

(assert (=> mapIsEmpty!22672 mapRes!22672))

(declare-fun b!812530 () Bool)

(declare-fun res!555240 () Bool)

(assert (=> b!812530 (=> (not res!555240) (not e!450121))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812530 (= res!555240 (and (= (size!21658 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21659 _keys!976) (size!21658 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812531 () Bool)

(declare-fun res!555241 () Bool)

(assert (=> b!812531 (=> (not res!555241) (not e!450121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44351 (_ BitVec 32)) Bool)

(assert (=> b!812531 (= res!555241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812532 () Bool)

(declare-fun res!555242 () Bool)

(assert (=> b!812532 (=> (not res!555242) (not e!450121))))

(declare-datatypes ((List!15148 0))(
  ( (Nil!15145) (Cons!15144 (h!16273 (_ BitVec 64)) (t!21454 List!15148)) )
))
(declare-fun arrayNoDuplicates!0 (array!44351 (_ BitVec 32) List!15148) Bool)

(assert (=> b!812532 (= res!555242 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15145))))

(declare-fun b!812533 () Bool)

(declare-fun tp_is_empty!14065 () Bool)

(assert (=> b!812533 (= e!450120 tp_is_empty!14065)))

(declare-fun b!812534 () Bool)

(declare-fun e!450122 () Bool)

(assert (=> b!812534 (= e!450122 tp_is_empty!14065)))

(declare-fun mapNonEmpty!22672 () Bool)

(declare-fun tp!43780 () Bool)

(assert (=> mapNonEmpty!22672 (= mapRes!22672 (and tp!43780 e!450122))))

(declare-fun mapRest!22672 () (Array (_ BitVec 32) ValueCell!6617))

(declare-fun mapKey!22672 () (_ BitVec 32))

(declare-fun mapValue!22672 () ValueCell!6617)

(assert (=> mapNonEmpty!22672 (= (arr!21237 _values!788) (store mapRest!22672 mapKey!22672 mapValue!22672))))

(assert (= (and start!69892 res!555239) b!812530))

(assert (= (and b!812530 res!555240) b!812531))

(assert (= (and b!812531 res!555241) b!812532))

(assert (= (and b!812532 res!555242) b!812529))

(assert (= (and b!812528 condMapEmpty!22672) mapIsEmpty!22672))

(assert (= (and b!812528 (not condMapEmpty!22672)) mapNonEmpty!22672))

(get-info :version)

(assert (= (and mapNonEmpty!22672 ((_ is ValueCellFull!6617) mapValue!22672)) b!812534))

(assert (= (and b!812528 ((_ is ValueCellFull!6617) mapDefault!22672)) b!812533))

(assert (= start!69892 b!812528))

(declare-fun m!754297 () Bool)

(assert (=> start!69892 m!754297))

(declare-fun m!754299 () Bool)

(assert (=> start!69892 m!754299))

(declare-fun m!754301 () Bool)

(assert (=> start!69892 m!754301))

(declare-fun m!754303 () Bool)

(assert (=> b!812531 m!754303))

(declare-fun m!754305 () Bool)

(assert (=> b!812532 m!754305))

(declare-fun m!754307 () Bool)

(assert (=> mapNonEmpty!22672 m!754307))

(check-sat tp_is_empty!14065 (not start!69892) (not b!812531) (not mapNonEmpty!22672) (not b!812532))
(check-sat)
(get-model)

(declare-fun b!812587 () Bool)

(declare-fun e!450164 () Bool)

(declare-fun call!35461 () Bool)

(assert (=> b!812587 (= e!450164 call!35461)))

(declare-fun bm!35458 () Bool)

(declare-fun c!88833 () Bool)

(assert (=> bm!35458 (= call!35461 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88833 (Cons!15144 (select (arr!21238 _keys!976) #b00000000000000000000000000000000) Nil!15145) Nil!15145)))))

(declare-fun b!812588 () Bool)

(declare-fun e!450163 () Bool)

(declare-fun contains!4121 (List!15148 (_ BitVec 64)) Bool)

(assert (=> b!812588 (= e!450163 (contains!4121 Nil!15145 (select (arr!21238 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!812589 () Bool)

(assert (=> b!812589 (= e!450164 call!35461)))

(declare-fun d!104159 () Bool)

(declare-fun res!555275 () Bool)

(declare-fun e!450165 () Bool)

(assert (=> d!104159 (=> res!555275 e!450165)))

(assert (=> d!104159 (= res!555275 (bvsge #b00000000000000000000000000000000 (size!21659 _keys!976)))))

(assert (=> d!104159 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15145) e!450165)))

(declare-fun b!812590 () Bool)

(declare-fun e!450162 () Bool)

(assert (=> b!812590 (= e!450165 e!450162)))

(declare-fun res!555273 () Bool)

(assert (=> b!812590 (=> (not res!555273) (not e!450162))))

(assert (=> b!812590 (= res!555273 (not e!450163))))

(declare-fun res!555274 () Bool)

(assert (=> b!812590 (=> (not res!555274) (not e!450163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812590 (= res!555274 (validKeyInArray!0 (select (arr!21238 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!812591 () Bool)

(assert (=> b!812591 (= e!450162 e!450164)))

(assert (=> b!812591 (= c!88833 (validKeyInArray!0 (select (arr!21238 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104159 (not res!555275)) b!812590))

(assert (= (and b!812590 res!555274) b!812588))

(assert (= (and b!812590 res!555273) b!812591))

(assert (= (and b!812591 c!88833) b!812587))

(assert (= (and b!812591 (not c!88833)) b!812589))

(assert (= (or b!812587 b!812589) bm!35458))

(declare-fun m!754333 () Bool)

(assert (=> bm!35458 m!754333))

(declare-fun m!754335 () Bool)

(assert (=> bm!35458 m!754335))

(assert (=> b!812588 m!754333))

(assert (=> b!812588 m!754333))

(declare-fun m!754337 () Bool)

(assert (=> b!812588 m!754337))

(assert (=> b!812590 m!754333))

(assert (=> b!812590 m!754333))

(declare-fun m!754339 () Bool)

(assert (=> b!812590 m!754339))

(assert (=> b!812591 m!754333))

(assert (=> b!812591 m!754333))

(assert (=> b!812591 m!754339))

(assert (=> b!812532 d!104159))

(declare-fun d!104161 () Bool)

(assert (=> d!104161 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69892 d!104161))

(declare-fun d!104163 () Bool)

(assert (=> d!104163 (= (array_inv!17095 _keys!976) (bvsge (size!21659 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69892 d!104163))

(declare-fun d!104165 () Bool)

(assert (=> d!104165 (= (array_inv!17096 _values!788) (bvsge (size!21658 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69892 d!104165))

(declare-fun b!812600 () Bool)

(declare-fun e!450174 () Bool)

(declare-fun call!35464 () Bool)

(assert (=> b!812600 (= e!450174 call!35464)))

(declare-fun b!812601 () Bool)

(declare-fun e!450172 () Bool)

(assert (=> b!812601 (= e!450172 call!35464)))

(declare-fun bm!35461 () Bool)

(assert (=> bm!35461 (= call!35464 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!812602 () Bool)

(declare-fun e!450173 () Bool)

(assert (=> b!812602 (= e!450173 e!450174)))

(declare-fun c!88836 () Bool)

(assert (=> b!812602 (= c!88836 (validKeyInArray!0 (select (arr!21238 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!812603 () Bool)

(assert (=> b!812603 (= e!450174 e!450172)))

(declare-fun lt!363955 () (_ BitVec 64))

(assert (=> b!812603 (= lt!363955 (select (arr!21238 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27668 0))(
  ( (Unit!27669) )
))
(declare-fun lt!363957 () Unit!27668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44351 (_ BitVec 64) (_ BitVec 32)) Unit!27668)

(assert (=> b!812603 (= lt!363957 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!363955 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812603 (arrayContainsKey!0 _keys!976 lt!363955 #b00000000000000000000000000000000)))

(declare-fun lt!363956 () Unit!27668)

(assert (=> b!812603 (= lt!363956 lt!363957)))

(declare-fun res!555280 () Bool)

(declare-datatypes ((SeekEntryResult!8714 0))(
  ( (MissingZero!8714 (index!37227 (_ BitVec 32))) (Found!8714 (index!37228 (_ BitVec 32))) (Intermediate!8714 (undefined!9526 Bool) (index!37229 (_ BitVec 32)) (x!68268 (_ BitVec 32))) (Undefined!8714) (MissingVacant!8714 (index!37230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44351 (_ BitVec 32)) SeekEntryResult!8714)

(assert (=> b!812603 (= res!555280 (= (seekEntryOrOpen!0 (select (arr!21238 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8714 #b00000000000000000000000000000000)))))

(assert (=> b!812603 (=> (not res!555280) (not e!450172))))

(declare-fun d!104167 () Bool)

(declare-fun res!555281 () Bool)

(assert (=> d!104167 (=> res!555281 e!450173)))

(assert (=> d!104167 (= res!555281 (bvsge #b00000000000000000000000000000000 (size!21659 _keys!976)))))

(assert (=> d!104167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450173)))

(assert (= (and d!104167 (not res!555281)) b!812602))

(assert (= (and b!812602 c!88836) b!812603))

(assert (= (and b!812602 (not c!88836)) b!812600))

(assert (= (and b!812603 res!555280) b!812601))

(assert (= (or b!812601 b!812600) bm!35461))

(declare-fun m!754341 () Bool)

(assert (=> bm!35461 m!754341))

(assert (=> b!812602 m!754333))

(assert (=> b!812602 m!754333))

(assert (=> b!812602 m!754339))

(assert (=> b!812603 m!754333))

(declare-fun m!754343 () Bool)

(assert (=> b!812603 m!754343))

(declare-fun m!754345 () Bool)

(assert (=> b!812603 m!754345))

(assert (=> b!812603 m!754333))

(declare-fun m!754347 () Bool)

(assert (=> b!812603 m!754347))

(assert (=> b!812531 d!104167))

(declare-fun condMapEmpty!22681 () Bool)

(declare-fun mapDefault!22681 () ValueCell!6617)

(assert (=> mapNonEmpty!22672 (= condMapEmpty!22681 (= mapRest!22672 ((as const (Array (_ BitVec 32) ValueCell!6617)) mapDefault!22681)))))

(declare-fun e!450179 () Bool)

(declare-fun mapRes!22681 () Bool)

(assert (=> mapNonEmpty!22672 (= tp!43780 (and e!450179 mapRes!22681))))

(declare-fun mapNonEmpty!22681 () Bool)

(declare-fun tp!43789 () Bool)

(declare-fun e!450180 () Bool)

(assert (=> mapNonEmpty!22681 (= mapRes!22681 (and tp!43789 e!450180))))

(declare-fun mapKey!22681 () (_ BitVec 32))

(declare-fun mapRest!22681 () (Array (_ BitVec 32) ValueCell!6617))

(declare-fun mapValue!22681 () ValueCell!6617)

(assert (=> mapNonEmpty!22681 (= mapRest!22672 (store mapRest!22681 mapKey!22681 mapValue!22681))))

(declare-fun b!812610 () Bool)

(assert (=> b!812610 (= e!450180 tp_is_empty!14065)))

(declare-fun mapIsEmpty!22681 () Bool)

(assert (=> mapIsEmpty!22681 mapRes!22681))

(declare-fun b!812611 () Bool)

(assert (=> b!812611 (= e!450179 tp_is_empty!14065)))

(assert (= (and mapNonEmpty!22672 condMapEmpty!22681) mapIsEmpty!22681))

(assert (= (and mapNonEmpty!22672 (not condMapEmpty!22681)) mapNonEmpty!22681))

(assert (= (and mapNonEmpty!22681 ((_ is ValueCellFull!6617) mapValue!22681)) b!812610))

(assert (= (and mapNonEmpty!22672 ((_ is ValueCellFull!6617) mapDefault!22681)) b!812611))

(declare-fun m!754349 () Bool)

(assert (=> mapNonEmpty!22681 m!754349))

(check-sat (not bm!35461) (not b!812591) (not b!812590) (not b!812588) (not b!812602) (not b!812603) (not bm!35458) (not mapNonEmpty!22681) tp_is_empty!14065)
(check-sat)
