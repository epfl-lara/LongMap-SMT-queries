; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69804 () Bool)

(assert start!69804)

(declare-fun res!554948 () Bool)

(declare-fun e!449655 () Bool)

(assert (=> start!69804 (=> (not res!554948) (not e!449655))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69804 (= res!554948 (validMask!0 mask!1312))))

(assert (=> start!69804 e!449655))

(declare-datatypes ((array!44212 0))(
  ( (array!44213 (arr!21172 (Array (_ BitVec 32) (_ BitVec 64))) (size!21593 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44212)

(declare-fun array_inv!16965 (array!44212) Bool)

(assert (=> start!69804 (array_inv!16965 _keys!976)))

(assert (=> start!69804 true))

(declare-datatypes ((V!23661 0))(
  ( (V!23662 (val!7045 Int)) )
))
(declare-datatypes ((ValueCell!6582 0))(
  ( (ValueCellFull!6582 (v!9471 V!23661)) (EmptyCell!6582) )
))
(declare-datatypes ((array!44214 0))(
  ( (array!44215 (arr!21173 (Array (_ BitVec 32) ValueCell!6582)) (size!21594 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44214)

(declare-fun e!449659 () Bool)

(declare-fun array_inv!16966 (array!44214) Bool)

(assert (=> start!69804 (and (array_inv!16966 _values!788) e!449659)))

(declare-fun b!812006 () Bool)

(declare-fun e!449656 () Bool)

(declare-fun tp_is_empty!13995 () Bool)

(assert (=> b!812006 (= e!449656 tp_is_empty!13995)))

(declare-fun b!812007 () Bool)

(declare-fun e!449657 () Bool)

(declare-fun mapRes!22555 () Bool)

(assert (=> b!812007 (= e!449659 (and e!449657 mapRes!22555))))

(declare-fun condMapEmpty!22555 () Bool)

(declare-fun mapDefault!22555 () ValueCell!6582)

(assert (=> b!812007 (= condMapEmpty!22555 (= (arr!21173 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6582)) mapDefault!22555)))))

(declare-fun b!812008 () Bool)

(assert (=> b!812008 (= e!449655 (bvsgt #b00000000000000000000000000000000 (size!21593 _keys!976)))))

(declare-fun b!812009 () Bool)

(assert (=> b!812009 (= e!449657 tp_is_empty!13995)))

(declare-fun mapIsEmpty!22555 () Bool)

(assert (=> mapIsEmpty!22555 mapRes!22555))

(declare-fun b!812010 () Bool)

(declare-fun res!554949 () Bool)

(assert (=> b!812010 (=> (not res!554949) (not e!449655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44212 (_ BitVec 32)) Bool)

(assert (=> b!812010 (= res!554949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812011 () Bool)

(declare-fun res!554950 () Bool)

(assert (=> b!812011 (=> (not res!554950) (not e!449655))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812011 (= res!554950 (and (= (size!21594 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21593 _keys!976) (size!21594 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22555 () Bool)

(declare-fun tp!43663 () Bool)

(assert (=> mapNonEmpty!22555 (= mapRes!22555 (and tp!43663 e!449656))))

(declare-fun mapRest!22555 () (Array (_ BitVec 32) ValueCell!6582))

(declare-fun mapKey!22555 () (_ BitVec 32))

(declare-fun mapValue!22555 () ValueCell!6582)

(assert (=> mapNonEmpty!22555 (= (arr!21173 _values!788) (store mapRest!22555 mapKey!22555 mapValue!22555))))

(assert (= (and start!69804 res!554948) b!812011))

(assert (= (and b!812011 res!554950) b!812010))

(assert (= (and b!812010 res!554949) b!812008))

(assert (= (and b!812007 condMapEmpty!22555) mapIsEmpty!22555))

(assert (= (and b!812007 (not condMapEmpty!22555)) mapNonEmpty!22555))

(get-info :version)

(assert (= (and mapNonEmpty!22555 ((_ is ValueCellFull!6582) mapValue!22555)) b!812006))

(assert (= (and b!812007 ((_ is ValueCellFull!6582) mapDefault!22555)) b!812009))

(assert (= start!69804 b!812007))

(declare-fun m!754553 () Bool)

(assert (=> start!69804 m!754553))

(declare-fun m!754555 () Bool)

(assert (=> start!69804 m!754555))

(declare-fun m!754557 () Bool)

(assert (=> start!69804 m!754557))

(declare-fun m!754559 () Bool)

(assert (=> b!812010 m!754559))

(declare-fun m!754561 () Bool)

(assert (=> mapNonEmpty!22555 m!754561))

(check-sat (not start!69804) (not b!812010) (not mapNonEmpty!22555) tp_is_empty!13995)
(check-sat)
(get-model)

(declare-fun d!104291 () Bool)

(assert (=> d!104291 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69804 d!104291))

(declare-fun d!104293 () Bool)

(assert (=> d!104293 (= (array_inv!16965 _keys!976) (bvsge (size!21593 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69804 d!104293))

(declare-fun d!104295 () Bool)

(assert (=> d!104295 (= (array_inv!16966 _values!788) (bvsge (size!21594 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69804 d!104295))

(declare-fun bm!35472 () Bool)

(declare-fun call!35475 () Bool)

(assert (=> bm!35472 (= call!35475 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!812038 () Bool)

(declare-fun e!449681 () Bool)

(assert (=> b!812038 (= e!449681 call!35475)))

(declare-fun b!812039 () Bool)

(declare-fun e!449682 () Bool)

(declare-fun e!449683 () Bool)

(assert (=> b!812039 (= e!449682 e!449683)))

(declare-fun c!88891 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812039 (= c!88891 (validKeyInArray!0 (select (arr!21172 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!812040 () Bool)

(assert (=> b!812040 (= e!449683 call!35475)))

(declare-fun d!104297 () Bool)

(declare-fun res!554965 () Bool)

(assert (=> d!104297 (=> res!554965 e!449682)))

(assert (=> d!104297 (= res!554965 (bvsge #b00000000000000000000000000000000 (size!21593 _keys!976)))))

(assert (=> d!104297 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!449682)))

(declare-fun b!812041 () Bool)

(assert (=> b!812041 (= e!449683 e!449681)))

(declare-fun lt!364087 () (_ BitVec 64))

(assert (=> b!812041 (= lt!364087 (select (arr!21172 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27702 0))(
  ( (Unit!27703) )
))
(declare-fun lt!364088 () Unit!27702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44212 (_ BitVec 64) (_ BitVec 32)) Unit!27702)

(assert (=> b!812041 (= lt!364088 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364087 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812041 (arrayContainsKey!0 _keys!976 lt!364087 #b00000000000000000000000000000000)))

(declare-fun lt!364086 () Unit!27702)

(assert (=> b!812041 (= lt!364086 lt!364088)))

(declare-fun res!554964 () Bool)

(declare-datatypes ((SeekEntryResult!8714 0))(
  ( (MissingZero!8714 (index!37227 (_ BitVec 32))) (Found!8714 (index!37228 (_ BitVec 32))) (Intermediate!8714 (undefined!9526 Bool) (index!37229 (_ BitVec 32)) (x!68169 (_ BitVec 32))) (Undefined!8714) (MissingVacant!8714 (index!37230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44212 (_ BitVec 32)) SeekEntryResult!8714)

(assert (=> b!812041 (= res!554964 (= (seekEntryOrOpen!0 (select (arr!21172 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8714 #b00000000000000000000000000000000)))))

(assert (=> b!812041 (=> (not res!554964) (not e!449681))))

(assert (= (and d!104297 (not res!554965)) b!812039))

(assert (= (and b!812039 c!88891) b!812041))

(assert (= (and b!812039 (not c!88891)) b!812040))

(assert (= (and b!812041 res!554964) b!812038))

(assert (= (or b!812038 b!812040) bm!35472))

(declare-fun m!754573 () Bool)

(assert (=> bm!35472 m!754573))

(declare-fun m!754575 () Bool)

(assert (=> b!812039 m!754575))

(assert (=> b!812039 m!754575))

(declare-fun m!754577 () Bool)

(assert (=> b!812039 m!754577))

(assert (=> b!812041 m!754575))

(declare-fun m!754579 () Bool)

(assert (=> b!812041 m!754579))

(declare-fun m!754581 () Bool)

(assert (=> b!812041 m!754581))

(assert (=> b!812041 m!754575))

(declare-fun m!754583 () Bool)

(assert (=> b!812041 m!754583))

(assert (=> b!812010 d!104297))

(declare-fun condMapEmpty!22561 () Bool)

(declare-fun mapDefault!22561 () ValueCell!6582)

(assert (=> mapNonEmpty!22555 (= condMapEmpty!22561 (= mapRest!22555 ((as const (Array (_ BitVec 32) ValueCell!6582)) mapDefault!22561)))))

(declare-fun e!449688 () Bool)

(declare-fun mapRes!22561 () Bool)

(assert (=> mapNonEmpty!22555 (= tp!43663 (and e!449688 mapRes!22561))))

(declare-fun b!812048 () Bool)

(declare-fun e!449689 () Bool)

(assert (=> b!812048 (= e!449689 tp_is_empty!13995)))

(declare-fun mapIsEmpty!22561 () Bool)

(assert (=> mapIsEmpty!22561 mapRes!22561))

(declare-fun b!812049 () Bool)

(assert (=> b!812049 (= e!449688 tp_is_empty!13995)))

(declare-fun mapNonEmpty!22561 () Bool)

(declare-fun tp!43669 () Bool)

(assert (=> mapNonEmpty!22561 (= mapRes!22561 (and tp!43669 e!449689))))

(declare-fun mapKey!22561 () (_ BitVec 32))

(declare-fun mapValue!22561 () ValueCell!6582)

(declare-fun mapRest!22561 () (Array (_ BitVec 32) ValueCell!6582))

(assert (=> mapNonEmpty!22561 (= mapRest!22555 (store mapRest!22561 mapKey!22561 mapValue!22561))))

(assert (= (and mapNonEmpty!22555 condMapEmpty!22561) mapIsEmpty!22561))

(assert (= (and mapNonEmpty!22555 (not condMapEmpty!22561)) mapNonEmpty!22561))

(assert (= (and mapNonEmpty!22561 ((_ is ValueCellFull!6582) mapValue!22561)) b!812048))

(assert (= (and mapNonEmpty!22555 ((_ is ValueCellFull!6582) mapDefault!22561)) b!812049))

(declare-fun m!754585 () Bool)

(assert (=> mapNonEmpty!22561 m!754585))

(check-sat (not b!812039) (not b!812041) tp_is_empty!13995 (not mapNonEmpty!22561) (not bm!35472))
(check-sat)
