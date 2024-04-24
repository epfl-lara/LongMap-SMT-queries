; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93806 () Bool)

(assert start!93806)

(declare-fun b!1060332 () Bool)

(declare-fun e!603496 () Bool)

(declare-fun tp_is_empty!24913 () Bool)

(assert (=> b!1060332 (= e!603496 tp_is_empty!24913)))

(declare-fun b!1060333 () Bool)

(declare-fun e!603499 () Bool)

(assert (=> b!1060333 (= e!603499 tp_is_empty!24913)))

(declare-fun mapNonEmpty!39022 () Bool)

(declare-fun mapRes!39022 () Bool)

(declare-fun tp!74828 () Bool)

(assert (=> mapNonEmpty!39022 (= mapRes!39022 (and tp!74828 e!603499))))

(declare-datatypes ((V!38353 0))(
  ( (V!38354 (val!12507 Int)) )
))
(declare-datatypes ((ValueCell!11753 0))(
  ( (ValueCellFull!11753 (v!15112 V!38353)) (EmptyCell!11753) )
))
(declare-fun mapRest!39022 () (Array (_ BitVec 32) ValueCell!11753))

(declare-fun mapKey!39022 () (_ BitVec 32))

(declare-datatypes ((array!66897 0))(
  ( (array!66898 (arr!32156 (Array (_ BitVec 32) ValueCell!11753)) (size!32693 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66897)

(declare-fun mapValue!39022 () ValueCell!11753)

(assert (=> mapNonEmpty!39022 (= (arr!32156 _values!955) (store mapRest!39022 mapKey!39022 mapValue!39022))))

(declare-fun b!1060334 () Bool)

(declare-fun e!603495 () Bool)

(assert (=> b!1060334 (= e!603495 (and e!603496 mapRes!39022))))

(declare-fun condMapEmpty!39022 () Bool)

(declare-fun mapDefault!39022 () ValueCell!11753)

(assert (=> b!1060334 (= condMapEmpty!39022 (= (arr!32156 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11753)) mapDefault!39022)))))

(declare-fun res!708016 () Bool)

(declare-fun e!603498 () Bool)

(assert (=> start!93806 (=> (not res!708016) (not e!603498))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93806 (= res!708016 (validMask!0 mask!1515))))

(assert (=> start!93806 e!603498))

(assert (=> start!93806 true))

(declare-fun array_inv!24936 (array!66897) Bool)

(assert (=> start!93806 (and (array_inv!24936 _values!955) e!603495)))

(declare-datatypes ((array!66899 0))(
  ( (array!66900 (arr!32157 (Array (_ BitVec 32) (_ BitVec 64))) (size!32694 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66899)

(declare-fun array_inv!24937 (array!66899) Bool)

(assert (=> start!93806 (array_inv!24937 _keys!1163)))

(declare-fun b!1060335 () Bool)

(declare-fun res!708017 () Bool)

(assert (=> b!1060335 (=> (not res!708017) (not e!603498))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060335 (= res!708017 (and (= (size!32693 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32694 _keys!1163) (size!32693 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060336 () Bool)

(declare-fun res!708015 () Bool)

(assert (=> b!1060336 (=> (not res!708015) (not e!603498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66899 (_ BitVec 32)) Bool)

(assert (=> b!1060336 (= res!708015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39022 () Bool)

(assert (=> mapIsEmpty!39022 mapRes!39022))

(declare-fun b!1060337 () Bool)

(assert (=> b!1060337 (= e!603498 (bvsgt #b00000000000000000000000000000000 (size!32694 _keys!1163)))))

(assert (= (and start!93806 res!708016) b!1060335))

(assert (= (and b!1060335 res!708017) b!1060336))

(assert (= (and b!1060336 res!708015) b!1060337))

(assert (= (and b!1060334 condMapEmpty!39022) mapIsEmpty!39022))

(assert (= (and b!1060334 (not condMapEmpty!39022)) mapNonEmpty!39022))

(get-info :version)

(assert (= (and mapNonEmpty!39022 ((_ is ValueCellFull!11753) mapValue!39022)) b!1060333))

(assert (= (and b!1060334 ((_ is ValueCellFull!11753) mapDefault!39022)) b!1060332))

(assert (= start!93806 b!1060334))

(declare-fun m!980265 () Bool)

(assert (=> mapNonEmpty!39022 m!980265))

(declare-fun m!980267 () Bool)

(assert (=> start!93806 m!980267))

(declare-fun m!980269 () Bool)

(assert (=> start!93806 m!980269))

(declare-fun m!980271 () Bool)

(assert (=> start!93806 m!980271))

(declare-fun m!980273 () Bool)

(assert (=> b!1060336 m!980273))

(check-sat (not start!93806) (not b!1060336) (not mapNonEmpty!39022) tp_is_empty!24913)
(check-sat)
(get-model)

(declare-fun d!129147 () Bool)

(assert (=> d!129147 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93806 d!129147))

(declare-fun d!129149 () Bool)

(assert (=> d!129149 (= (array_inv!24936 _values!955) (bvsge (size!32693 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93806 d!129149))

(declare-fun d!129151 () Bool)

(assert (=> d!129151 (= (array_inv!24937 _keys!1163) (bvsge (size!32694 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93806 d!129151))

(declare-fun b!1060382 () Bool)

(declare-fun e!603536 () Bool)

(declare-fun e!603538 () Bool)

(assert (=> b!1060382 (= e!603536 e!603538)))

(declare-fun lt!467590 () (_ BitVec 64))

(assert (=> b!1060382 (= lt!467590 (select (arr!32157 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34723 0))(
  ( (Unit!34724) )
))
(declare-fun lt!467589 () Unit!34723)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66899 (_ BitVec 64) (_ BitVec 32)) Unit!34723)

(assert (=> b!1060382 (= lt!467589 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467590 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060382 (arrayContainsKey!0 _keys!1163 lt!467590 #b00000000000000000000000000000000)))

(declare-fun lt!467591 () Unit!34723)

(assert (=> b!1060382 (= lt!467591 lt!467589)))

(declare-fun res!708041 () Bool)

(declare-datatypes ((SeekEntryResult!9821 0))(
  ( (MissingZero!9821 (index!41655 (_ BitVec 32))) (Found!9821 (index!41656 (_ BitVec 32))) (Intermediate!9821 (undefined!10633 Bool) (index!41657 (_ BitVec 32)) (x!94600 (_ BitVec 32))) (Undefined!9821) (MissingVacant!9821 (index!41658 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66899 (_ BitVec 32)) SeekEntryResult!9821)

(assert (=> b!1060382 (= res!708041 (= (seekEntryOrOpen!0 (select (arr!32157 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9821 #b00000000000000000000000000000000)))))

(assert (=> b!1060382 (=> (not res!708041) (not e!603538))))

(declare-fun b!1060383 () Bool)

(declare-fun call!44942 () Bool)

(assert (=> b!1060383 (= e!603538 call!44942)))

(declare-fun d!129153 () Bool)

(declare-fun res!708040 () Bool)

(declare-fun e!603537 () Bool)

(assert (=> d!129153 (=> res!708040 e!603537)))

(assert (=> d!129153 (= res!708040 (bvsge #b00000000000000000000000000000000 (size!32694 _keys!1163)))))

(assert (=> d!129153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!603537)))

(declare-fun b!1060384 () Bool)

(assert (=> b!1060384 (= e!603536 call!44942)))

(declare-fun bm!44939 () Bool)

(assert (=> bm!44939 (= call!44942 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1060385 () Bool)

(assert (=> b!1060385 (= e!603537 e!603536)))

(declare-fun c!107594 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1060385 (= c!107594 (validKeyInArray!0 (select (arr!32157 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129153 (not res!708040)) b!1060385))

(assert (= (and b!1060385 c!107594) b!1060382))

(assert (= (and b!1060385 (not c!107594)) b!1060384))

(assert (= (and b!1060382 res!708041) b!1060383))

(assert (= (or b!1060383 b!1060384) bm!44939))

(declare-fun m!980295 () Bool)

(assert (=> b!1060382 m!980295))

(declare-fun m!980297 () Bool)

(assert (=> b!1060382 m!980297))

(declare-fun m!980299 () Bool)

(assert (=> b!1060382 m!980299))

(assert (=> b!1060382 m!980295))

(declare-fun m!980301 () Bool)

(assert (=> b!1060382 m!980301))

(declare-fun m!980303 () Bool)

(assert (=> bm!44939 m!980303))

(assert (=> b!1060385 m!980295))

(assert (=> b!1060385 m!980295))

(declare-fun m!980305 () Bool)

(assert (=> b!1060385 m!980305))

(assert (=> b!1060336 d!129153))

(declare-fun mapNonEmpty!39031 () Bool)

(declare-fun mapRes!39031 () Bool)

(declare-fun tp!74837 () Bool)

(declare-fun e!603543 () Bool)

(assert (=> mapNonEmpty!39031 (= mapRes!39031 (and tp!74837 e!603543))))

(declare-fun mapRest!39031 () (Array (_ BitVec 32) ValueCell!11753))

(declare-fun mapValue!39031 () ValueCell!11753)

(declare-fun mapKey!39031 () (_ BitVec 32))

(assert (=> mapNonEmpty!39031 (= mapRest!39022 (store mapRest!39031 mapKey!39031 mapValue!39031))))

(declare-fun b!1060392 () Bool)

(assert (=> b!1060392 (= e!603543 tp_is_empty!24913)))

(declare-fun b!1060393 () Bool)

(declare-fun e!603544 () Bool)

(assert (=> b!1060393 (= e!603544 tp_is_empty!24913)))

(declare-fun mapIsEmpty!39031 () Bool)

(assert (=> mapIsEmpty!39031 mapRes!39031))

(declare-fun condMapEmpty!39031 () Bool)

(declare-fun mapDefault!39031 () ValueCell!11753)

(assert (=> mapNonEmpty!39022 (= condMapEmpty!39031 (= mapRest!39022 ((as const (Array (_ BitVec 32) ValueCell!11753)) mapDefault!39031)))))

(assert (=> mapNonEmpty!39022 (= tp!74828 (and e!603544 mapRes!39031))))

(assert (= (and mapNonEmpty!39022 condMapEmpty!39031) mapIsEmpty!39031))

(assert (= (and mapNonEmpty!39022 (not condMapEmpty!39031)) mapNonEmpty!39031))

(assert (= (and mapNonEmpty!39031 ((_ is ValueCellFull!11753) mapValue!39031)) b!1060392))

(assert (= (and mapNonEmpty!39022 ((_ is ValueCellFull!11753) mapDefault!39031)) b!1060393))

(declare-fun m!980307 () Bool)

(assert (=> mapNonEmpty!39031 m!980307))

(check-sat tp_is_empty!24913 (not bm!44939) (not b!1060382) (not b!1060385) (not mapNonEmpty!39031))
(check-sat)
