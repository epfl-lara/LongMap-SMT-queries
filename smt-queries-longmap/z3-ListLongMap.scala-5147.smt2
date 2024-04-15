; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69796 () Bool)

(assert start!69796)

(declare-fun mapIsEmpty!22564 () Bool)

(declare-fun mapRes!22564 () Bool)

(assert (=> mapIsEmpty!22564 mapRes!22564))

(declare-fun b!811816 () Bool)

(declare-fun e!449552 () Bool)

(declare-fun tp_is_empty!13999 () Bool)

(assert (=> b!811816 (= e!449552 tp_is_empty!13999)))

(declare-fun mapNonEmpty!22564 () Bool)

(declare-fun tp!43672 () Bool)

(assert (=> mapNonEmpty!22564 (= mapRes!22564 (and tp!43672 e!449552))))

(declare-datatypes ((V!23667 0))(
  ( (V!23668 (val!7047 Int)) )
))
(declare-datatypes ((ValueCell!6584 0))(
  ( (ValueCellFull!6584 (v!9467 V!23667)) (EmptyCell!6584) )
))
(declare-fun mapRest!22564 () (Array (_ BitVec 32) ValueCell!6584))

(declare-datatypes ((array!44221 0))(
  ( (array!44222 (arr!21176 (Array (_ BitVec 32) ValueCell!6584)) (size!21597 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44221)

(declare-fun mapValue!22564 () ValueCell!6584)

(declare-fun mapKey!22564 () (_ BitVec 32))

(assert (=> mapNonEmpty!22564 (= (arr!21176 _values!788) (store mapRest!22564 mapKey!22564 mapValue!22564))))

(declare-fun b!811817 () Bool)

(declare-fun res!554868 () Bool)

(declare-fun e!449553 () Bool)

(assert (=> b!811817 (=> (not res!554868) (not e!449553))))

(declare-datatypes ((array!44223 0))(
  ( (array!44224 (arr!21177 (Array (_ BitVec 32) (_ BitVec 64))) (size!21598 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44223)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!811817 (= res!554868 (and (= (size!21597 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21598 _keys!976) (size!21597 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!811818 () Bool)

(declare-fun res!554867 () Bool)

(assert (=> b!811818 (=> (not res!554867) (not e!449553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44223 (_ BitVec 32)) Bool)

(assert (=> b!811818 (= res!554867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!811819 () Bool)

(declare-fun e!449550 () Bool)

(assert (=> b!811819 (= e!449550 tp_is_empty!13999)))

(declare-fun res!554866 () Bool)

(assert (=> start!69796 (=> (not res!554866) (not e!449553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69796 (= res!554866 (validMask!0 mask!1312))))

(assert (=> start!69796 e!449553))

(declare-fun array_inv!17055 (array!44223) Bool)

(assert (=> start!69796 (array_inv!17055 _keys!976)))

(assert (=> start!69796 true))

(declare-fun e!449551 () Bool)

(declare-fun array_inv!17056 (array!44221) Bool)

(assert (=> start!69796 (and (array_inv!17056 _values!788) e!449551)))

(declare-fun b!811820 () Bool)

(assert (=> b!811820 (= e!449553 (and (bvsle #b00000000000000000000000000000000 (size!21598 _keys!976)) (bvsge (size!21598 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun b!811821 () Bool)

(assert (=> b!811821 (= e!449551 (and e!449550 mapRes!22564))))

(declare-fun condMapEmpty!22564 () Bool)

(declare-fun mapDefault!22564 () ValueCell!6584)

(assert (=> b!811821 (= condMapEmpty!22564 (= (arr!21176 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6584)) mapDefault!22564)))))

(assert (= (and start!69796 res!554866) b!811817))

(assert (= (and b!811817 res!554868) b!811818))

(assert (= (and b!811818 res!554867) b!811820))

(assert (= (and b!811821 condMapEmpty!22564) mapIsEmpty!22564))

(assert (= (and b!811821 (not condMapEmpty!22564)) mapNonEmpty!22564))

(get-info :version)

(assert (= (and mapNonEmpty!22564 ((_ is ValueCellFull!6584) mapValue!22564)) b!811816))

(assert (= (and b!811821 ((_ is ValueCellFull!6584) mapDefault!22564)) b!811819))

(assert (= start!69796 b!811821))

(declare-fun m!753835 () Bool)

(assert (=> mapNonEmpty!22564 m!753835))

(declare-fun m!753837 () Bool)

(assert (=> b!811818 m!753837))

(declare-fun m!753839 () Bool)

(assert (=> start!69796 m!753839))

(declare-fun m!753841 () Bool)

(assert (=> start!69796 m!753841))

(declare-fun m!753843 () Bool)

(assert (=> start!69796 m!753843))

(check-sat (not start!69796) (not b!811818) (not mapNonEmpty!22564) tp_is_empty!13999)
(check-sat)
(get-model)

(declare-fun d!104105 () Bool)

(assert (=> d!104105 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69796 d!104105))

(declare-fun d!104107 () Bool)

(assert (=> d!104107 (= (array_inv!17055 _keys!976) (bvsge (size!21598 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69796 d!104107))

(declare-fun d!104109 () Bool)

(assert (=> d!104109 (= (array_inv!17056 _values!788) (bvsge (size!21597 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69796 d!104109))

(declare-fun b!811866 () Bool)

(declare-fun e!449592 () Bool)

(declare-fun e!449593 () Bool)

(assert (=> b!811866 (= e!449592 e!449593)))

(declare-fun c!88824 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811866 (= c!88824 (validKeyInArray!0 (select (arr!21177 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104111 () Bool)

(declare-fun res!554892 () Bool)

(assert (=> d!104111 (=> res!554892 e!449592)))

(assert (=> d!104111 (= res!554892 (bvsge #b00000000000000000000000000000000 (size!21598 _keys!976)))))

(assert (=> d!104111 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!449592)))

(declare-fun b!811867 () Bool)

(declare-fun e!449591 () Bool)

(assert (=> b!811867 (= e!449593 e!449591)))

(declare-fun lt!363852 () (_ BitVec 64))

(assert (=> b!811867 (= lt!363852 (select (arr!21177 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27662 0))(
  ( (Unit!27663) )
))
(declare-fun lt!363854 () Unit!27662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44223 (_ BitVec 64) (_ BitVec 32)) Unit!27662)

(assert (=> b!811867 (= lt!363854 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!363852 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811867 (arrayContainsKey!0 _keys!976 lt!363852 #b00000000000000000000000000000000)))

(declare-fun lt!363853 () Unit!27662)

(assert (=> b!811867 (= lt!363853 lt!363854)))

(declare-fun res!554891 () Bool)

(declare-datatypes ((SeekEntryResult!8711 0))(
  ( (MissingZero!8711 (index!37215 (_ BitVec 32))) (Found!8711 (index!37216 (_ BitVec 32))) (Intermediate!8711 (undefined!9523 Bool) (index!37217 (_ BitVec 32)) (x!68171 (_ BitVec 32))) (Undefined!8711) (MissingVacant!8711 (index!37218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44223 (_ BitVec 32)) SeekEntryResult!8711)

(assert (=> b!811867 (= res!554891 (= (seekEntryOrOpen!0 (select (arr!21177 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8711 #b00000000000000000000000000000000)))))

(assert (=> b!811867 (=> (not res!554891) (not e!449591))))

(declare-fun b!811868 () Bool)

(declare-fun call!35452 () Bool)

(assert (=> b!811868 (= e!449591 call!35452)))

(declare-fun b!811869 () Bool)

(assert (=> b!811869 (= e!449593 call!35452)))

(declare-fun bm!35449 () Bool)

(assert (=> bm!35449 (= call!35452 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!104111 (not res!554892)) b!811866))

(assert (= (and b!811866 c!88824) b!811867))

(assert (= (and b!811866 (not c!88824)) b!811869))

(assert (= (and b!811867 res!554891) b!811868))

(assert (= (or b!811868 b!811869) bm!35449))

(declare-fun m!753865 () Bool)

(assert (=> b!811866 m!753865))

(assert (=> b!811866 m!753865))

(declare-fun m!753867 () Bool)

(assert (=> b!811866 m!753867))

(assert (=> b!811867 m!753865))

(declare-fun m!753869 () Bool)

(assert (=> b!811867 m!753869))

(declare-fun m!753871 () Bool)

(assert (=> b!811867 m!753871))

(assert (=> b!811867 m!753865))

(declare-fun m!753873 () Bool)

(assert (=> b!811867 m!753873))

(declare-fun m!753875 () Bool)

(assert (=> bm!35449 m!753875))

(assert (=> b!811818 d!104111))

(declare-fun mapNonEmpty!22573 () Bool)

(declare-fun mapRes!22573 () Bool)

(declare-fun tp!43681 () Bool)

(declare-fun e!449599 () Bool)

(assert (=> mapNonEmpty!22573 (= mapRes!22573 (and tp!43681 e!449599))))

(declare-fun mapValue!22573 () ValueCell!6584)

(declare-fun mapRest!22573 () (Array (_ BitVec 32) ValueCell!6584))

(declare-fun mapKey!22573 () (_ BitVec 32))

(assert (=> mapNonEmpty!22573 (= mapRest!22564 (store mapRest!22573 mapKey!22573 mapValue!22573))))

(declare-fun b!811877 () Bool)

(declare-fun e!449598 () Bool)

(assert (=> b!811877 (= e!449598 tp_is_empty!13999)))

(declare-fun condMapEmpty!22573 () Bool)

(declare-fun mapDefault!22573 () ValueCell!6584)

(assert (=> mapNonEmpty!22564 (= condMapEmpty!22573 (= mapRest!22564 ((as const (Array (_ BitVec 32) ValueCell!6584)) mapDefault!22573)))))

(assert (=> mapNonEmpty!22564 (= tp!43672 (and e!449598 mapRes!22573))))

(declare-fun b!811876 () Bool)

(assert (=> b!811876 (= e!449599 tp_is_empty!13999)))

(declare-fun mapIsEmpty!22573 () Bool)

(assert (=> mapIsEmpty!22573 mapRes!22573))

(assert (= (and mapNonEmpty!22564 condMapEmpty!22573) mapIsEmpty!22573))

(assert (= (and mapNonEmpty!22564 (not condMapEmpty!22573)) mapNonEmpty!22573))

(assert (= (and mapNonEmpty!22573 ((_ is ValueCellFull!6584) mapValue!22573)) b!811876))

(assert (= (and mapNonEmpty!22564 ((_ is ValueCellFull!6584) mapDefault!22573)) b!811877))

(declare-fun m!753877 () Bool)

(assert (=> mapNonEmpty!22573 m!753877))

(check-sat (not b!811866) (not mapNonEmpty!22573) (not bm!35449) tp_is_empty!13999 (not b!811867))
(check-sat)
