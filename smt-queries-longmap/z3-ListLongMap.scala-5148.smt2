; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69832 () Bool)

(assert start!69832)

(declare-fun b!812159 () Bool)

(declare-fun e!449778 () Bool)

(declare-datatypes ((List!15090 0))(
  ( (Nil!15087) (Cons!15086 (h!16215 (_ BitVec 64)) (t!21405 List!15090)) )
))
(declare-fun noDuplicate!1291 (List!15090) Bool)

(assert (=> b!812159 (= e!449778 (not (noDuplicate!1291 Nil!15087)))))

(declare-fun mapNonEmpty!22579 () Bool)

(declare-fun mapRes!22579 () Bool)

(declare-fun tp!43687 () Bool)

(declare-fun e!449776 () Bool)

(assert (=> mapNonEmpty!22579 (= mapRes!22579 (and tp!43687 e!449776))))

(declare-datatypes ((V!23677 0))(
  ( (V!23678 (val!7051 Int)) )
))
(declare-datatypes ((ValueCell!6588 0))(
  ( (ValueCellFull!6588 (v!9477 V!23677)) (EmptyCell!6588) )
))
(declare-datatypes ((array!44238 0))(
  ( (array!44239 (arr!21183 (Array (_ BitVec 32) ValueCell!6588)) (size!21604 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44238)

(declare-fun mapKey!22579 () (_ BitVec 32))

(declare-fun mapValue!22579 () ValueCell!6588)

(declare-fun mapRest!22579 () (Array (_ BitVec 32) ValueCell!6588))

(assert (=> mapNonEmpty!22579 (= (arr!21183 _values!788) (store mapRest!22579 mapKey!22579 mapValue!22579))))

(declare-fun res!555022 () Bool)

(assert (=> start!69832 (=> (not res!555022) (not e!449778))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69832 (= res!555022 (validMask!0 mask!1312))))

(assert (=> start!69832 e!449778))

(declare-datatypes ((array!44240 0))(
  ( (array!44241 (arr!21184 (Array (_ BitVec 32) (_ BitVec 64))) (size!21605 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44240)

(declare-fun array_inv!16973 (array!44240) Bool)

(assert (=> start!69832 (array_inv!16973 _keys!976)))

(assert (=> start!69832 true))

(declare-fun e!449775 () Bool)

(declare-fun array_inv!16974 (array!44238) Bool)

(assert (=> start!69832 (and (array_inv!16974 _values!788) e!449775)))

(declare-fun b!812160 () Bool)

(declare-fun tp_is_empty!14007 () Bool)

(assert (=> b!812160 (= e!449776 tp_is_empty!14007)))

(declare-fun b!812161 () Bool)

(declare-fun res!555021 () Bool)

(assert (=> b!812161 (=> (not res!555021) (not e!449778))))

(assert (=> b!812161 (= res!555021 (and (bvsle #b00000000000000000000000000000000 (size!21605 _keys!976)) (bvslt (size!21605 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!22579 () Bool)

(assert (=> mapIsEmpty!22579 mapRes!22579))

(declare-fun b!812162 () Bool)

(declare-fun e!449779 () Bool)

(assert (=> b!812162 (= e!449779 tp_is_empty!14007)))

(declare-fun b!812163 () Bool)

(declare-fun res!555020 () Bool)

(assert (=> b!812163 (=> (not res!555020) (not e!449778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44240 (_ BitVec 32)) Bool)

(assert (=> b!812163 (= res!555020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812164 () Bool)

(assert (=> b!812164 (= e!449775 (and e!449779 mapRes!22579))))

(declare-fun condMapEmpty!22579 () Bool)

(declare-fun mapDefault!22579 () ValueCell!6588)

(assert (=> b!812164 (= condMapEmpty!22579 (= (arr!21183 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6588)) mapDefault!22579)))))

(declare-fun b!812165 () Bool)

(declare-fun res!555019 () Bool)

(assert (=> b!812165 (=> (not res!555019) (not e!449778))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812165 (= res!555019 (and (= (size!21604 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21605 _keys!976) (size!21604 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69832 res!555022) b!812165))

(assert (= (and b!812165 res!555019) b!812163))

(assert (= (and b!812163 res!555020) b!812161))

(assert (= (and b!812161 res!555021) b!812159))

(assert (= (and b!812164 condMapEmpty!22579) mapIsEmpty!22579))

(assert (= (and b!812164 (not condMapEmpty!22579)) mapNonEmpty!22579))

(get-info :version)

(assert (= (and mapNonEmpty!22579 ((_ is ValueCellFull!6588) mapValue!22579)) b!812160))

(assert (= (and b!812164 ((_ is ValueCellFull!6588) mapDefault!22579)) b!812162))

(assert (= start!69832 b!812164))

(declare-fun m!754643 () Bool)

(assert (=> b!812159 m!754643))

(declare-fun m!754645 () Bool)

(assert (=> mapNonEmpty!22579 m!754645))

(declare-fun m!754647 () Bool)

(assert (=> start!69832 m!754647))

(declare-fun m!754649 () Bool)

(assert (=> start!69832 m!754649))

(declare-fun m!754651 () Bool)

(assert (=> start!69832 m!754651))

(declare-fun m!754653 () Bool)

(assert (=> b!812163 m!754653))

(check-sat (not b!812163) (not b!812159) (not mapNonEmpty!22579) tp_is_empty!14007 (not start!69832))
(check-sat)
(get-model)

(declare-fun d!104311 () Bool)

(declare-fun res!555039 () Bool)

(declare-fun e!449799 () Bool)

(assert (=> d!104311 (=> res!555039 e!449799)))

(assert (=> d!104311 (= res!555039 ((_ is Nil!15087) Nil!15087))))

(assert (=> d!104311 (= (noDuplicate!1291 Nil!15087) e!449799)))

(declare-fun b!812191 () Bool)

(declare-fun e!449800 () Bool)

(assert (=> b!812191 (= e!449799 e!449800)))

(declare-fun res!555040 () Bool)

(assert (=> b!812191 (=> (not res!555040) (not e!449800))))

(declare-fun contains!4139 (List!15090 (_ BitVec 64)) Bool)

(assert (=> b!812191 (= res!555040 (not (contains!4139 (t!21405 Nil!15087) (h!16215 Nil!15087))))))

(declare-fun b!812192 () Bool)

(assert (=> b!812192 (= e!449800 (noDuplicate!1291 (t!21405 Nil!15087)))))

(assert (= (and d!104311 (not res!555039)) b!812191))

(assert (= (and b!812191 res!555040) b!812192))

(declare-fun m!754667 () Bool)

(assert (=> b!812191 m!754667))

(declare-fun m!754669 () Bool)

(assert (=> b!812192 m!754669))

(assert (=> b!812159 d!104311))

(declare-fun d!104313 () Bool)

(assert (=> d!104313 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69832 d!104313))

(declare-fun d!104315 () Bool)

(assert (=> d!104315 (= (array_inv!16973 _keys!976) (bvsge (size!21605 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69832 d!104315))

(declare-fun d!104317 () Bool)

(assert (=> d!104317 (= (array_inv!16974 _values!788) (bvsge (size!21604 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69832 d!104317))

(declare-fun b!812201 () Bool)

(declare-fun e!449808 () Bool)

(declare-fun e!449807 () Bool)

(assert (=> b!812201 (= e!449808 e!449807)))

(declare-fun lt!364105 () (_ BitVec 64))

(assert (=> b!812201 (= lt!364105 (select (arr!21184 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27706 0))(
  ( (Unit!27707) )
))
(declare-fun lt!364104 () Unit!27706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44240 (_ BitVec 64) (_ BitVec 32)) Unit!27706)

(assert (=> b!812201 (= lt!364104 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364105 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812201 (arrayContainsKey!0 _keys!976 lt!364105 #b00000000000000000000000000000000)))

(declare-fun lt!364106 () Unit!27706)

(assert (=> b!812201 (= lt!364106 lt!364104)))

(declare-fun res!555046 () Bool)

(declare-datatypes ((SeekEntryResult!8716 0))(
  ( (MissingZero!8716 (index!37235 (_ BitVec 32))) (Found!8716 (index!37236 (_ BitVec 32))) (Intermediate!8716 (undefined!9528 Bool) (index!37237 (_ BitVec 32)) (x!68191 (_ BitVec 32))) (Undefined!8716) (MissingVacant!8716 (index!37238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44240 (_ BitVec 32)) SeekEntryResult!8716)

(assert (=> b!812201 (= res!555046 (= (seekEntryOrOpen!0 (select (arr!21184 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8716 #b00000000000000000000000000000000)))))

(assert (=> b!812201 (=> (not res!555046) (not e!449807))))

(declare-fun bm!35478 () Bool)

(declare-fun call!35481 () Bool)

(assert (=> bm!35478 (= call!35481 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!812202 () Bool)

(assert (=> b!812202 (= e!449808 call!35481)))

(declare-fun b!812203 () Bool)

(declare-fun e!449809 () Bool)

(assert (=> b!812203 (= e!449809 e!449808)))

(declare-fun c!88897 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812203 (= c!88897 (validKeyInArray!0 (select (arr!21184 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!812204 () Bool)

(assert (=> b!812204 (= e!449807 call!35481)))

(declare-fun d!104319 () Bool)

(declare-fun res!555045 () Bool)

(assert (=> d!104319 (=> res!555045 e!449809)))

(assert (=> d!104319 (= res!555045 (bvsge #b00000000000000000000000000000000 (size!21605 _keys!976)))))

(assert (=> d!104319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!449809)))

(assert (= (and d!104319 (not res!555045)) b!812203))

(assert (= (and b!812203 c!88897) b!812201))

(assert (= (and b!812203 (not c!88897)) b!812202))

(assert (= (and b!812201 res!555046) b!812204))

(assert (= (or b!812204 b!812202) bm!35478))

(declare-fun m!754671 () Bool)

(assert (=> b!812201 m!754671))

(declare-fun m!754673 () Bool)

(assert (=> b!812201 m!754673))

(declare-fun m!754675 () Bool)

(assert (=> b!812201 m!754675))

(assert (=> b!812201 m!754671))

(declare-fun m!754677 () Bool)

(assert (=> b!812201 m!754677))

(declare-fun m!754679 () Bool)

(assert (=> bm!35478 m!754679))

(assert (=> b!812203 m!754671))

(assert (=> b!812203 m!754671))

(declare-fun m!754681 () Bool)

(assert (=> b!812203 m!754681))

(assert (=> b!812163 d!104319))

(declare-fun b!812212 () Bool)

(declare-fun e!449814 () Bool)

(assert (=> b!812212 (= e!449814 tp_is_empty!14007)))

(declare-fun mapIsEmpty!22585 () Bool)

(declare-fun mapRes!22585 () Bool)

(assert (=> mapIsEmpty!22585 mapRes!22585))

(declare-fun b!812211 () Bool)

(declare-fun e!449815 () Bool)

(assert (=> b!812211 (= e!449815 tp_is_empty!14007)))

(declare-fun condMapEmpty!22585 () Bool)

(declare-fun mapDefault!22585 () ValueCell!6588)

(assert (=> mapNonEmpty!22579 (= condMapEmpty!22585 (= mapRest!22579 ((as const (Array (_ BitVec 32) ValueCell!6588)) mapDefault!22585)))))

(assert (=> mapNonEmpty!22579 (= tp!43687 (and e!449814 mapRes!22585))))

(declare-fun mapNonEmpty!22585 () Bool)

(declare-fun tp!43693 () Bool)

(assert (=> mapNonEmpty!22585 (= mapRes!22585 (and tp!43693 e!449815))))

(declare-fun mapKey!22585 () (_ BitVec 32))

(declare-fun mapRest!22585 () (Array (_ BitVec 32) ValueCell!6588))

(declare-fun mapValue!22585 () ValueCell!6588)

(assert (=> mapNonEmpty!22585 (= mapRest!22579 (store mapRest!22585 mapKey!22585 mapValue!22585))))

(assert (= (and mapNonEmpty!22579 condMapEmpty!22585) mapIsEmpty!22585))

(assert (= (and mapNonEmpty!22579 (not condMapEmpty!22585)) mapNonEmpty!22585))

(assert (= (and mapNonEmpty!22585 ((_ is ValueCellFull!6588) mapValue!22585)) b!812211))

(assert (= (and mapNonEmpty!22579 ((_ is ValueCellFull!6588) mapDefault!22585)) b!812212))

(declare-fun m!754683 () Bool)

(assert (=> mapNonEmpty!22585 m!754683))

(check-sat (not mapNonEmpty!22585) (not b!812203) tp_is_empty!14007 (not b!812201) (not bm!35478) (not b!812192) (not b!812191))
(check-sat)
