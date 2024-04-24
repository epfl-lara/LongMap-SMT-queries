; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69968 () Bool)

(assert start!69968)

(declare-fun res!555286 () Bool)

(declare-fun e!450219 () Bool)

(assert (=> start!69968 (=> (not res!555286) (not e!450219))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69968 (= res!555286 (validMask!0 mask!1312))))

(assert (=> start!69968 e!450219))

(declare-datatypes ((array!44207 0))(
  ( (array!44208 (arr!21165 (Array (_ BitVec 32) (_ BitVec 64))) (size!21585 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44207)

(declare-fun array_inv!17019 (array!44207) Bool)

(assert (=> start!69968 (array_inv!17019 _keys!976)))

(assert (=> start!69968 true))

(declare-datatypes ((V!23659 0))(
  ( (V!23660 (val!7044 Int)) )
))
(declare-datatypes ((ValueCell!6581 0))(
  ( (ValueCellFull!6581 (v!9470 V!23659)) (EmptyCell!6581) )
))
(declare-datatypes ((array!44209 0))(
  ( (array!44210 (arr!21166 (Array (_ BitVec 32) ValueCell!6581)) (size!21586 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44209)

(declare-fun e!450221 () Bool)

(declare-fun array_inv!17020 (array!44209) Bool)

(assert (=> start!69968 (and (array_inv!17020 _values!788) e!450221)))

(declare-fun mapIsEmpty!22552 () Bool)

(declare-fun mapRes!22552 () Bool)

(assert (=> mapIsEmpty!22552 mapRes!22552))

(declare-fun mapNonEmpty!22552 () Bool)

(declare-fun tp!43660 () Bool)

(declare-fun e!450222 () Bool)

(assert (=> mapNonEmpty!22552 (= mapRes!22552 (and tp!43660 e!450222))))

(declare-fun mapRest!22552 () (Array (_ BitVec 32) ValueCell!6581))

(declare-fun mapKey!22552 () (_ BitVec 32))

(declare-fun mapValue!22552 () ValueCell!6581)

(assert (=> mapNonEmpty!22552 (= (arr!21166 _values!788) (store mapRest!22552 mapKey!22552 mapValue!22552))))

(declare-fun b!812882 () Bool)

(declare-fun res!555285 () Bool)

(assert (=> b!812882 (=> (not res!555285) (not e!450219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44207 (_ BitVec 32)) Bool)

(assert (=> b!812882 (= res!555285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812883 () Bool)

(declare-fun e!450220 () Bool)

(assert (=> b!812883 (= e!450221 (and e!450220 mapRes!22552))))

(declare-fun condMapEmpty!22552 () Bool)

(declare-fun mapDefault!22552 () ValueCell!6581)

(assert (=> b!812883 (= condMapEmpty!22552 (= (arr!21166 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6581)) mapDefault!22552)))))

(declare-fun b!812884 () Bool)

(declare-fun res!555287 () Bool)

(assert (=> b!812884 (=> (not res!555287) (not e!450219))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812884 (= res!555287 (and (= (size!21586 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21585 _keys!976) (size!21586 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812885 () Bool)

(declare-fun tp_is_empty!13993 () Bool)

(assert (=> b!812885 (= e!450222 tp_is_empty!13993)))

(declare-fun b!812886 () Bool)

(assert (=> b!812886 (= e!450219 (bvsgt #b00000000000000000000000000000000 (size!21585 _keys!976)))))

(declare-fun b!812887 () Bool)

(assert (=> b!812887 (= e!450220 tp_is_empty!13993)))

(assert (= (and start!69968 res!555286) b!812884))

(assert (= (and b!812884 res!555287) b!812882))

(assert (= (and b!812882 res!555285) b!812886))

(assert (= (and b!812883 condMapEmpty!22552) mapIsEmpty!22552))

(assert (= (and b!812883 (not condMapEmpty!22552)) mapNonEmpty!22552))

(get-info :version)

(assert (= (and mapNonEmpty!22552 ((_ is ValueCellFull!6581) mapValue!22552)) b!812885))

(assert (= (and b!812883 ((_ is ValueCellFull!6581) mapDefault!22552)) b!812887))

(assert (= start!69968 b!812883))

(declare-fun m!755825 () Bool)

(assert (=> start!69968 m!755825))

(declare-fun m!755827 () Bool)

(assert (=> start!69968 m!755827))

(declare-fun m!755829 () Bool)

(assert (=> start!69968 m!755829))

(declare-fun m!755831 () Bool)

(assert (=> mapNonEmpty!22552 m!755831))

(declare-fun m!755833 () Bool)

(assert (=> b!812882 m!755833))

(check-sat (not start!69968) (not b!812882) (not mapNonEmpty!22552) tp_is_empty!13993)
(check-sat)
(get-model)

(declare-fun d!104611 () Bool)

(assert (=> d!104611 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69968 d!104611))

(declare-fun d!104613 () Bool)

(assert (=> d!104613 (= (array_inv!17019 _keys!976) (bvsge (size!21585 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69968 d!104613))

(declare-fun d!104615 () Bool)

(assert (=> d!104615 (= (array_inv!17020 _values!788) (bvsge (size!21586 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69968 d!104615))

(declare-fun d!104617 () Bool)

(declare-fun res!555310 () Bool)

(declare-fun e!450259 () Bool)

(assert (=> d!104617 (=> res!555310 e!450259)))

(assert (=> d!104617 (= res!555310 (bvsge #b00000000000000000000000000000000 (size!21585 _keys!976)))))

(assert (=> d!104617 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450259)))

(declare-fun b!812932 () Bool)

(declare-fun e!450261 () Bool)

(declare-fun call!35520 () Bool)

(assert (=> b!812932 (= e!450261 call!35520)))

(declare-fun bm!35517 () Bool)

(assert (=> bm!35517 (= call!35520 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!812933 () Bool)

(declare-fun e!450260 () Bool)

(assert (=> b!812933 (= e!450260 e!450261)))

(declare-fun lt!364442 () (_ BitVec 64))

(assert (=> b!812933 (= lt!364442 (select (arr!21165 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27687 0))(
  ( (Unit!27688) )
))
(declare-fun lt!364441 () Unit!27687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44207 (_ BitVec 64) (_ BitVec 32)) Unit!27687)

(assert (=> b!812933 (= lt!364441 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364442 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812933 (arrayContainsKey!0 _keys!976 lt!364442 #b00000000000000000000000000000000)))

(declare-fun lt!364440 () Unit!27687)

(assert (=> b!812933 (= lt!364440 lt!364441)))

(declare-fun res!555311 () Bool)

(declare-datatypes ((SeekEntryResult!8665 0))(
  ( (MissingZero!8665 (index!37031 (_ BitVec 32))) (Found!8665 (index!37032 (_ BitVec 32))) (Intermediate!8665 (undefined!9477 Bool) (index!37033 (_ BitVec 32)) (x!68134 (_ BitVec 32))) (Undefined!8665) (MissingVacant!8665 (index!37034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44207 (_ BitVec 32)) SeekEntryResult!8665)

(assert (=> b!812933 (= res!555311 (= (seekEntryOrOpen!0 (select (arr!21165 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8665 #b00000000000000000000000000000000)))))

(assert (=> b!812933 (=> (not res!555311) (not e!450261))))

(declare-fun b!812934 () Bool)

(assert (=> b!812934 (= e!450259 e!450260)))

(declare-fun c!89168 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812934 (= c!89168 (validKeyInArray!0 (select (arr!21165 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!812935 () Bool)

(assert (=> b!812935 (= e!450260 call!35520)))

(assert (= (and d!104617 (not res!555310)) b!812934))

(assert (= (and b!812934 c!89168) b!812933))

(assert (= (and b!812934 (not c!89168)) b!812935))

(assert (= (and b!812933 res!555311) b!812932))

(assert (= (or b!812932 b!812935) bm!35517))

(declare-fun m!755855 () Bool)

(assert (=> bm!35517 m!755855))

(declare-fun m!755857 () Bool)

(assert (=> b!812933 m!755857))

(declare-fun m!755859 () Bool)

(assert (=> b!812933 m!755859))

(declare-fun m!755861 () Bool)

(assert (=> b!812933 m!755861))

(assert (=> b!812933 m!755857))

(declare-fun m!755863 () Bool)

(assert (=> b!812933 m!755863))

(assert (=> b!812934 m!755857))

(assert (=> b!812934 m!755857))

(declare-fun m!755865 () Bool)

(assert (=> b!812934 m!755865))

(assert (=> b!812882 d!104617))

(declare-fun b!812942 () Bool)

(declare-fun e!450266 () Bool)

(assert (=> b!812942 (= e!450266 tp_is_empty!13993)))

(declare-fun mapIsEmpty!22561 () Bool)

(declare-fun mapRes!22561 () Bool)

(assert (=> mapIsEmpty!22561 mapRes!22561))

(declare-fun condMapEmpty!22561 () Bool)

(declare-fun mapDefault!22561 () ValueCell!6581)

(assert (=> mapNonEmpty!22552 (= condMapEmpty!22561 (= mapRest!22552 ((as const (Array (_ BitVec 32) ValueCell!6581)) mapDefault!22561)))))

(declare-fun e!450267 () Bool)

(assert (=> mapNonEmpty!22552 (= tp!43660 (and e!450267 mapRes!22561))))

(declare-fun b!812943 () Bool)

(assert (=> b!812943 (= e!450267 tp_is_empty!13993)))

(declare-fun mapNonEmpty!22561 () Bool)

(declare-fun tp!43669 () Bool)

(assert (=> mapNonEmpty!22561 (= mapRes!22561 (and tp!43669 e!450266))))

(declare-fun mapRest!22561 () (Array (_ BitVec 32) ValueCell!6581))

(declare-fun mapKey!22561 () (_ BitVec 32))

(declare-fun mapValue!22561 () ValueCell!6581)

(assert (=> mapNonEmpty!22561 (= mapRest!22552 (store mapRest!22561 mapKey!22561 mapValue!22561))))

(assert (= (and mapNonEmpty!22552 condMapEmpty!22561) mapIsEmpty!22561))

(assert (= (and mapNonEmpty!22552 (not condMapEmpty!22561)) mapNonEmpty!22561))

(assert (= (and mapNonEmpty!22561 ((_ is ValueCellFull!6581) mapValue!22561)) b!812942))

(assert (= (and mapNonEmpty!22552 ((_ is ValueCellFull!6581) mapDefault!22561)) b!812943))

(declare-fun m!755867 () Bool)

(assert (=> mapNonEmpty!22561 m!755867))

(check-sat (not mapNonEmpty!22561) (not bm!35517) tp_is_empty!13993 (not b!812933) (not b!812934))
(check-sat)
