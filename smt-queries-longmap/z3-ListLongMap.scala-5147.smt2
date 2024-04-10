; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69818 () Bool)

(assert start!69818)

(declare-fun b!812080 () Bool)

(declare-fun e!449717 () Bool)

(declare-fun e!449718 () Bool)

(declare-fun mapRes!22567 () Bool)

(assert (=> b!812080 (= e!449717 (and e!449718 mapRes!22567))))

(declare-fun condMapEmpty!22567 () Bool)

(declare-datatypes ((V!23669 0))(
  ( (V!23670 (val!7048 Int)) )
))
(declare-datatypes ((ValueCell!6585 0))(
  ( (ValueCellFull!6585 (v!9474 V!23669)) (EmptyCell!6585) )
))
(declare-datatypes ((array!44224 0))(
  ( (array!44225 (arr!21177 (Array (_ BitVec 32) ValueCell!6585)) (size!21598 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44224)

(declare-fun mapDefault!22567 () ValueCell!6585)

(assert (=> b!812080 (= condMapEmpty!22567 (= (arr!21177 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6585)) mapDefault!22567)))))

(declare-fun b!812081 () Bool)

(declare-fun tp_is_empty!14001 () Bool)

(assert (=> b!812081 (= e!449718 tp_is_empty!14001)))

(declare-fun mapIsEmpty!22567 () Bool)

(assert (=> mapIsEmpty!22567 mapRes!22567))

(declare-fun b!812082 () Bool)

(declare-fun res!554981 () Bool)

(declare-fun e!449715 () Bool)

(assert (=> b!812082 (=> (not res!554981) (not e!449715))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!44226 0))(
  ( (array!44227 (arr!21178 (Array (_ BitVec 32) (_ BitVec 64))) (size!21599 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44226)

(assert (=> b!812082 (= res!554981 (and (= (size!21598 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21599 _keys!976) (size!21598 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!554982 () Bool)

(assert (=> start!69818 (=> (not res!554982) (not e!449715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69818 (= res!554982 (validMask!0 mask!1312))))

(assert (=> start!69818 e!449715))

(declare-fun array_inv!16967 (array!44226) Bool)

(assert (=> start!69818 (array_inv!16967 _keys!976)))

(assert (=> start!69818 true))

(declare-fun array_inv!16968 (array!44224) Bool)

(assert (=> start!69818 (and (array_inv!16968 _values!788) e!449717)))

(declare-fun b!812083 () Bool)

(declare-fun res!554983 () Bool)

(assert (=> b!812083 (=> (not res!554983) (not e!449715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44226 (_ BitVec 32)) Bool)

(assert (=> b!812083 (= res!554983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812084 () Bool)

(declare-fun e!449716 () Bool)

(assert (=> b!812084 (= e!449716 tp_is_empty!14001)))

(declare-fun mapNonEmpty!22567 () Bool)

(declare-fun tp!43675 () Bool)

(assert (=> mapNonEmpty!22567 (= mapRes!22567 (and tp!43675 e!449716))))

(declare-fun mapKey!22567 () (_ BitVec 32))

(declare-fun mapValue!22567 () ValueCell!6585)

(declare-fun mapRest!22567 () (Array (_ BitVec 32) ValueCell!6585))

(assert (=> mapNonEmpty!22567 (= (arr!21177 _values!788) (store mapRest!22567 mapKey!22567 mapValue!22567))))

(declare-fun b!812085 () Bool)

(assert (=> b!812085 (= e!449715 (and (bvsle #b00000000000000000000000000000000 (size!21599 _keys!976)) (bvsge (size!21599 _keys!976) #b01111111111111111111111111111111)))))

(assert (= (and start!69818 res!554982) b!812082))

(assert (= (and b!812082 res!554981) b!812083))

(assert (= (and b!812083 res!554983) b!812085))

(assert (= (and b!812080 condMapEmpty!22567) mapIsEmpty!22567))

(assert (= (and b!812080 (not condMapEmpty!22567)) mapNonEmpty!22567))

(get-info :version)

(assert (= (and mapNonEmpty!22567 ((_ is ValueCellFull!6585) mapValue!22567)) b!812084))

(assert (= (and b!812080 ((_ is ValueCellFull!6585) mapDefault!22567)) b!812081))

(assert (= start!69818 b!812080))

(declare-fun m!754597 () Bool)

(assert (=> start!69818 m!754597))

(declare-fun m!754599 () Bool)

(assert (=> start!69818 m!754599))

(declare-fun m!754601 () Bool)

(assert (=> start!69818 m!754601))

(declare-fun m!754603 () Bool)

(assert (=> b!812083 m!754603))

(declare-fun m!754605 () Bool)

(assert (=> mapNonEmpty!22567 m!754605))

(check-sat (not b!812083) (not start!69818) (not mapNonEmpty!22567) tp_is_empty!14001)
(check-sat)
(get-model)

(declare-fun d!104301 () Bool)

(declare-fun res!554997 () Bool)

(declare-fun e!449741 () Bool)

(assert (=> d!104301 (=> res!554997 e!449741)))

(assert (=> d!104301 (= res!554997 (bvsge #b00000000000000000000000000000000 (size!21599 _keys!976)))))

(assert (=> d!104301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!449741)))

(declare-fun bm!35475 () Bool)

(declare-fun call!35478 () Bool)

(assert (=> bm!35475 (= call!35478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!812112 () Bool)

(declare-fun e!449742 () Bool)

(declare-fun e!449743 () Bool)

(assert (=> b!812112 (= e!449742 e!449743)))

(declare-fun lt!364096 () (_ BitVec 64))

(assert (=> b!812112 (= lt!364096 (select (arr!21178 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27704 0))(
  ( (Unit!27705) )
))
(declare-fun lt!364097 () Unit!27704)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44226 (_ BitVec 64) (_ BitVec 32)) Unit!27704)

(assert (=> b!812112 (= lt!364097 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364096 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812112 (arrayContainsKey!0 _keys!976 lt!364096 #b00000000000000000000000000000000)))

(declare-fun lt!364095 () Unit!27704)

(assert (=> b!812112 (= lt!364095 lt!364097)))

(declare-fun res!554998 () Bool)

(declare-datatypes ((SeekEntryResult!8715 0))(
  ( (MissingZero!8715 (index!37231 (_ BitVec 32))) (Found!8715 (index!37232 (_ BitVec 32))) (Intermediate!8715 (undefined!9527 Bool) (index!37233 (_ BitVec 32)) (x!68180 (_ BitVec 32))) (Undefined!8715) (MissingVacant!8715 (index!37234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44226 (_ BitVec 32)) SeekEntryResult!8715)

(assert (=> b!812112 (= res!554998 (= (seekEntryOrOpen!0 (select (arr!21178 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8715 #b00000000000000000000000000000000)))))

(assert (=> b!812112 (=> (not res!554998) (not e!449743))))

(declare-fun b!812113 () Bool)

(assert (=> b!812113 (= e!449741 e!449742)))

(declare-fun c!88894 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812113 (= c!88894 (validKeyInArray!0 (select (arr!21178 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!812114 () Bool)

(assert (=> b!812114 (= e!449742 call!35478)))

(declare-fun b!812115 () Bool)

(assert (=> b!812115 (= e!449743 call!35478)))

(assert (= (and d!104301 (not res!554997)) b!812113))

(assert (= (and b!812113 c!88894) b!812112))

(assert (= (and b!812113 (not c!88894)) b!812114))

(assert (= (and b!812112 res!554998) b!812115))

(assert (= (or b!812115 b!812114) bm!35475))

(declare-fun m!754617 () Bool)

(assert (=> bm!35475 m!754617))

(declare-fun m!754619 () Bool)

(assert (=> b!812112 m!754619))

(declare-fun m!754621 () Bool)

(assert (=> b!812112 m!754621))

(declare-fun m!754623 () Bool)

(assert (=> b!812112 m!754623))

(assert (=> b!812112 m!754619))

(declare-fun m!754625 () Bool)

(assert (=> b!812112 m!754625))

(assert (=> b!812113 m!754619))

(assert (=> b!812113 m!754619))

(declare-fun m!754627 () Bool)

(assert (=> b!812113 m!754627))

(assert (=> b!812083 d!104301))

(declare-fun d!104303 () Bool)

(assert (=> d!104303 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69818 d!104303))

(declare-fun d!104305 () Bool)

(assert (=> d!104305 (= (array_inv!16967 _keys!976) (bvsge (size!21599 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69818 d!104305))

(declare-fun d!104307 () Bool)

(assert (=> d!104307 (= (array_inv!16968 _values!788) (bvsge (size!21598 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69818 d!104307))

(declare-fun b!812122 () Bool)

(declare-fun e!449749 () Bool)

(assert (=> b!812122 (= e!449749 tp_is_empty!14001)))

(declare-fun condMapEmpty!22573 () Bool)

(declare-fun mapDefault!22573 () ValueCell!6585)

(assert (=> mapNonEmpty!22567 (= condMapEmpty!22573 (= mapRest!22567 ((as const (Array (_ BitVec 32) ValueCell!6585)) mapDefault!22573)))))

(declare-fun e!449748 () Bool)

(declare-fun mapRes!22573 () Bool)

(assert (=> mapNonEmpty!22567 (= tp!43675 (and e!449748 mapRes!22573))))

(declare-fun mapIsEmpty!22573 () Bool)

(assert (=> mapIsEmpty!22573 mapRes!22573))

(declare-fun mapNonEmpty!22573 () Bool)

(declare-fun tp!43681 () Bool)

(assert (=> mapNonEmpty!22573 (= mapRes!22573 (and tp!43681 e!449749))))

(declare-fun mapKey!22573 () (_ BitVec 32))

(declare-fun mapRest!22573 () (Array (_ BitVec 32) ValueCell!6585))

(declare-fun mapValue!22573 () ValueCell!6585)

(assert (=> mapNonEmpty!22573 (= mapRest!22567 (store mapRest!22573 mapKey!22573 mapValue!22573))))

(declare-fun b!812123 () Bool)

(assert (=> b!812123 (= e!449748 tp_is_empty!14001)))

(assert (= (and mapNonEmpty!22567 condMapEmpty!22573) mapIsEmpty!22573))

(assert (= (and mapNonEmpty!22567 (not condMapEmpty!22573)) mapNonEmpty!22573))

(assert (= (and mapNonEmpty!22573 ((_ is ValueCellFull!6585) mapValue!22573)) b!812122))

(assert (= (and mapNonEmpty!22567 ((_ is ValueCellFull!6585) mapDefault!22573)) b!812123))

(declare-fun m!754629 () Bool)

(assert (=> mapNonEmpty!22573 m!754629))

(check-sat (not b!812113) (not mapNonEmpty!22573) tp_is_empty!14001 (not b!812112) (not bm!35475))
(check-sat)
