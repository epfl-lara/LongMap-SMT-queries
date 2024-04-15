; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69810 () Bool)

(assert start!69810)

(declare-fun mapNonEmpty!22576 () Bool)

(declare-fun mapRes!22576 () Bool)

(declare-fun tp!43684 () Bool)

(declare-fun e!449612 () Bool)

(assert (=> mapNonEmpty!22576 (= mapRes!22576 (and tp!43684 e!449612))))

(declare-datatypes ((V!23675 0))(
  ( (V!23676 (val!7050 Int)) )
))
(declare-datatypes ((ValueCell!6587 0))(
  ( (ValueCellFull!6587 (v!9470 V!23675)) (EmptyCell!6587) )
))
(declare-datatypes ((array!44231 0))(
  ( (array!44232 (arr!21180 (Array (_ BitVec 32) ValueCell!6587)) (size!21601 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44231)

(declare-fun mapRest!22576 () (Array (_ BitVec 32) ValueCell!6587))

(declare-fun mapKey!22576 () (_ BitVec 32))

(declare-fun mapValue!22576 () ValueCell!6587)

(assert (=> mapNonEmpty!22576 (= (arr!21180 _values!788) (store mapRest!22576 mapKey!22576 mapValue!22576))))

(declare-fun b!811892 () Bool)

(declare-fun e!449611 () Bool)

(declare-fun e!449614 () Bool)

(assert (=> b!811892 (= e!449611 (and e!449614 mapRes!22576))))

(declare-fun condMapEmpty!22576 () Bool)

(declare-fun mapDefault!22576 () ValueCell!6587)

(assert (=> b!811892 (= condMapEmpty!22576 (= (arr!21180 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6587)) mapDefault!22576)))))

(declare-fun b!811893 () Bool)

(declare-fun res!554901 () Bool)

(declare-fun e!449610 () Bool)

(assert (=> b!811893 (=> (not res!554901) (not e!449610))))

(declare-datatypes ((array!44233 0))(
  ( (array!44234 (arr!21181 (Array (_ BitVec 32) (_ BitVec 64))) (size!21602 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44233)

(assert (=> b!811893 (= res!554901 (and (bvsle #b00000000000000000000000000000000 (size!21602 _keys!976)) (bvslt (size!21602 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun b!811894 () Bool)

(declare-fun tp_is_empty!14005 () Bool)

(assert (=> b!811894 (= e!449612 tp_is_empty!14005)))

(declare-fun res!554904 () Bool)

(assert (=> start!69810 (=> (not res!554904) (not e!449610))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69810 (= res!554904 (validMask!0 mask!1312))))

(assert (=> start!69810 e!449610))

(declare-fun array_inv!17057 (array!44233) Bool)

(assert (=> start!69810 (array_inv!17057 _keys!976)))

(assert (=> start!69810 true))

(declare-fun array_inv!17058 (array!44231) Bool)

(assert (=> start!69810 (and (array_inv!17058 _values!788) e!449611)))

(declare-fun b!811895 () Bool)

(declare-datatypes ((List!15127 0))(
  ( (Nil!15124) (Cons!15123 (h!16252 (_ BitVec 64)) (t!21433 List!15127)) )
))
(declare-fun noDuplicate!1295 (List!15127) Bool)

(assert (=> b!811895 (= e!449610 (not (noDuplicate!1295 Nil!15124)))))

(declare-fun mapIsEmpty!22576 () Bool)

(assert (=> mapIsEmpty!22576 mapRes!22576))

(declare-fun b!811896 () Bool)

(declare-fun res!554903 () Bool)

(assert (=> b!811896 (=> (not res!554903) (not e!449610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44233 (_ BitVec 32)) Bool)

(assert (=> b!811896 (= res!554903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!811897 () Bool)

(assert (=> b!811897 (= e!449614 tp_is_empty!14005)))

(declare-fun b!811898 () Bool)

(declare-fun res!554902 () Bool)

(assert (=> b!811898 (=> (not res!554902) (not e!449610))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!811898 (= res!554902 (and (= (size!21601 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21602 _keys!976) (size!21601 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69810 res!554904) b!811898))

(assert (= (and b!811898 res!554902) b!811896))

(assert (= (and b!811896 res!554903) b!811893))

(assert (= (and b!811893 res!554901) b!811895))

(assert (= (and b!811892 condMapEmpty!22576) mapIsEmpty!22576))

(assert (= (and b!811892 (not condMapEmpty!22576)) mapNonEmpty!22576))

(get-info :version)

(assert (= (and mapNonEmpty!22576 ((_ is ValueCellFull!6587) mapValue!22576)) b!811894))

(assert (= (and b!811892 ((_ is ValueCellFull!6587) mapDefault!22576)) b!811897))

(assert (= start!69810 b!811892))

(declare-fun m!753879 () Bool)

(assert (=> mapNonEmpty!22576 m!753879))

(declare-fun m!753881 () Bool)

(assert (=> start!69810 m!753881))

(declare-fun m!753883 () Bool)

(assert (=> start!69810 m!753883))

(declare-fun m!753885 () Bool)

(assert (=> start!69810 m!753885))

(declare-fun m!753887 () Bool)

(assert (=> b!811895 m!753887))

(declare-fun m!753889 () Bool)

(assert (=> b!811896 m!753889))

(check-sat tp_is_empty!14005 (not start!69810) (not mapNonEmpty!22576) (not b!811896) (not b!811895))
(check-sat)
(get-model)

(declare-fun d!104115 () Bool)

(declare-fun res!554933 () Bool)

(declare-fun e!449649 () Bool)

(assert (=> d!104115 (=> res!554933 e!449649)))

(assert (=> d!104115 (= res!554933 ((_ is Nil!15124) Nil!15124))))

(assert (=> d!104115 (= (noDuplicate!1295 Nil!15124) e!449649)))

(declare-fun b!811945 () Bool)

(declare-fun e!449650 () Bool)

(assert (=> b!811945 (= e!449649 e!449650)))

(declare-fun res!554934 () Bool)

(assert (=> b!811945 (=> (not res!554934) (not e!449650))))

(declare-fun contains!4117 (List!15127 (_ BitVec 64)) Bool)

(assert (=> b!811945 (= res!554934 (not (contains!4117 (t!21433 Nil!15124) (h!16252 Nil!15124))))))

(declare-fun b!811946 () Bool)

(assert (=> b!811946 (= e!449650 (noDuplicate!1295 (t!21433 Nil!15124)))))

(assert (= (and d!104115 (not res!554933)) b!811945))

(assert (= (and b!811945 res!554934) b!811946))

(declare-fun m!753915 () Bool)

(assert (=> b!811945 m!753915))

(declare-fun m!753917 () Bool)

(assert (=> b!811946 m!753917))

(assert (=> b!811895 d!104115))

(declare-fun b!811955 () Bool)

(declare-fun e!449659 () Bool)

(declare-fun e!449657 () Bool)

(assert (=> b!811955 (= e!449659 e!449657)))

(declare-fun lt!363861 () (_ BitVec 64))

(assert (=> b!811955 (= lt!363861 (select (arr!21181 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27664 0))(
  ( (Unit!27665) )
))
(declare-fun lt!363862 () Unit!27664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44233 (_ BitVec 64) (_ BitVec 32)) Unit!27664)

(assert (=> b!811955 (= lt!363862 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!363861 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811955 (arrayContainsKey!0 _keys!976 lt!363861 #b00000000000000000000000000000000)))

(declare-fun lt!363863 () Unit!27664)

(assert (=> b!811955 (= lt!363863 lt!363862)))

(declare-fun res!554940 () Bool)

(declare-datatypes ((SeekEntryResult!8712 0))(
  ( (MissingZero!8712 (index!37219 (_ BitVec 32))) (Found!8712 (index!37220 (_ BitVec 32))) (Intermediate!8712 (undefined!9524 Bool) (index!37221 (_ BitVec 32)) (x!68182 (_ BitVec 32))) (Undefined!8712) (MissingVacant!8712 (index!37222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44233 (_ BitVec 32)) SeekEntryResult!8712)

(assert (=> b!811955 (= res!554940 (= (seekEntryOrOpen!0 (select (arr!21181 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8712 #b00000000000000000000000000000000)))))

(assert (=> b!811955 (=> (not res!554940) (not e!449657))))

(declare-fun b!811956 () Bool)

(declare-fun call!35455 () Bool)

(assert (=> b!811956 (= e!449659 call!35455)))

(declare-fun b!811957 () Bool)

(declare-fun e!449658 () Bool)

(assert (=> b!811957 (= e!449658 e!449659)))

(declare-fun c!88827 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811957 (= c!88827 (validKeyInArray!0 (select (arr!21181 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104117 () Bool)

(declare-fun res!554939 () Bool)

(assert (=> d!104117 (=> res!554939 e!449658)))

(assert (=> d!104117 (= res!554939 (bvsge #b00000000000000000000000000000000 (size!21602 _keys!976)))))

(assert (=> d!104117 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!449658)))

(declare-fun bm!35452 () Bool)

(assert (=> bm!35452 (= call!35455 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!811958 () Bool)

(assert (=> b!811958 (= e!449657 call!35455)))

(assert (= (and d!104117 (not res!554939)) b!811957))

(assert (= (and b!811957 c!88827) b!811955))

(assert (= (and b!811957 (not c!88827)) b!811956))

(assert (= (and b!811955 res!554940) b!811958))

(assert (= (or b!811958 b!811956) bm!35452))

(declare-fun m!753919 () Bool)

(assert (=> b!811955 m!753919))

(declare-fun m!753921 () Bool)

(assert (=> b!811955 m!753921))

(declare-fun m!753923 () Bool)

(assert (=> b!811955 m!753923))

(assert (=> b!811955 m!753919))

(declare-fun m!753925 () Bool)

(assert (=> b!811955 m!753925))

(assert (=> b!811957 m!753919))

(assert (=> b!811957 m!753919))

(declare-fun m!753927 () Bool)

(assert (=> b!811957 m!753927))

(declare-fun m!753929 () Bool)

(assert (=> bm!35452 m!753929))

(assert (=> b!811896 d!104117))

(declare-fun d!104119 () Bool)

(assert (=> d!104119 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69810 d!104119))

(declare-fun d!104121 () Bool)

(assert (=> d!104121 (= (array_inv!17057 _keys!976) (bvsge (size!21602 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69810 d!104121))

(declare-fun d!104123 () Bool)

(assert (=> d!104123 (= (array_inv!17058 _values!788) (bvsge (size!21601 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69810 d!104123))

(declare-fun mapIsEmpty!22585 () Bool)

(declare-fun mapRes!22585 () Bool)

(assert (=> mapIsEmpty!22585 mapRes!22585))

(declare-fun condMapEmpty!22585 () Bool)

(declare-fun mapDefault!22585 () ValueCell!6587)

(assert (=> mapNonEmpty!22576 (= condMapEmpty!22585 (= mapRest!22576 ((as const (Array (_ BitVec 32) ValueCell!6587)) mapDefault!22585)))))

(declare-fun e!449664 () Bool)

(assert (=> mapNonEmpty!22576 (= tp!43684 (and e!449664 mapRes!22585))))

(declare-fun b!811965 () Bool)

(declare-fun e!449665 () Bool)

(assert (=> b!811965 (= e!449665 tp_is_empty!14005)))

(declare-fun mapNonEmpty!22585 () Bool)

(declare-fun tp!43693 () Bool)

(assert (=> mapNonEmpty!22585 (= mapRes!22585 (and tp!43693 e!449665))))

(declare-fun mapRest!22585 () (Array (_ BitVec 32) ValueCell!6587))

(declare-fun mapValue!22585 () ValueCell!6587)

(declare-fun mapKey!22585 () (_ BitVec 32))

(assert (=> mapNonEmpty!22585 (= mapRest!22576 (store mapRest!22585 mapKey!22585 mapValue!22585))))

(declare-fun b!811966 () Bool)

(assert (=> b!811966 (= e!449664 tp_is_empty!14005)))

(assert (= (and mapNonEmpty!22576 condMapEmpty!22585) mapIsEmpty!22585))

(assert (= (and mapNonEmpty!22576 (not condMapEmpty!22585)) mapNonEmpty!22585))

(assert (= (and mapNonEmpty!22585 ((_ is ValueCellFull!6587) mapValue!22585)) b!811965))

(assert (= (and mapNonEmpty!22576 ((_ is ValueCellFull!6587) mapDefault!22585)) b!811966))

(declare-fun m!753931 () Bool)

(assert (=> mapNonEmpty!22585 m!753931))

(check-sat tp_is_empty!14005 (not b!811955) (not mapNonEmpty!22585) (not b!811957) (not bm!35452) (not b!811946) (not b!811945))
(check-sat)
