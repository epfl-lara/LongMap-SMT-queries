; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93820 () Bool)

(assert start!93820)

(declare-fun mapNonEmpty!39034 () Bool)

(declare-fun mapRes!39034 () Bool)

(declare-fun tp!74840 () Bool)

(declare-fun e!603556 () Bool)

(assert (=> mapNonEmpty!39034 (= mapRes!39034 (and tp!74840 e!603556))))

(declare-datatypes ((V!38361 0))(
  ( (V!38362 (val!12510 Int)) )
))
(declare-datatypes ((ValueCell!11756 0))(
  ( (ValueCellFull!11756 (v!15115 V!38361)) (EmptyCell!11756) )
))
(declare-fun mapValue!39034 () ValueCell!11756)

(declare-fun mapRest!39034 () (Array (_ BitVec 32) ValueCell!11756))

(declare-datatypes ((array!66911 0))(
  ( (array!66912 (arr!32162 (Array (_ BitVec 32) ValueCell!11756)) (size!32699 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66911)

(declare-fun mapKey!39034 () (_ BitVec 32))

(assert (=> mapNonEmpty!39034 (= (arr!32162 _values!955) (store mapRest!39034 mapKey!39034 mapValue!39034))))

(declare-fun b!1060406 () Bool)

(declare-fun e!603557 () Bool)

(declare-fun tp_is_empty!24919 () Bool)

(assert (=> b!1060406 (= e!603557 tp_is_empty!24919)))

(declare-fun res!708050 () Bool)

(declare-fun e!603555 () Bool)

(assert (=> start!93820 (=> (not res!708050) (not e!603555))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93820 (= res!708050 (validMask!0 mask!1515))))

(assert (=> start!93820 e!603555))

(assert (=> start!93820 true))

(declare-fun e!603558 () Bool)

(declare-fun array_inv!24938 (array!66911) Bool)

(assert (=> start!93820 (and (array_inv!24938 _values!955) e!603558)))

(declare-datatypes ((array!66913 0))(
  ( (array!66914 (arr!32163 (Array (_ BitVec 32) (_ BitVec 64))) (size!32700 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66913)

(declare-fun array_inv!24939 (array!66913) Bool)

(assert (=> start!93820 (array_inv!24939 _keys!1163)))

(declare-fun b!1060407 () Bool)

(declare-fun res!708048 () Bool)

(assert (=> b!1060407 (=> (not res!708048) (not e!603555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66913 (_ BitVec 32)) Bool)

(assert (=> b!1060407 (= res!708048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060408 () Bool)

(declare-fun res!708049 () Bool)

(assert (=> b!1060408 (=> (not res!708049) (not e!603555))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060408 (= res!708049 (and (= (size!32699 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32700 _keys!1163) (size!32699 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060409 () Bool)

(assert (=> b!1060409 (= e!603555 (and (bvsle #b00000000000000000000000000000000 (size!32700 _keys!1163)) (bvsge (size!32700 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1060410 () Bool)

(assert (=> b!1060410 (= e!603556 tp_is_empty!24919)))

(declare-fun mapIsEmpty!39034 () Bool)

(assert (=> mapIsEmpty!39034 mapRes!39034))

(declare-fun b!1060411 () Bool)

(assert (=> b!1060411 (= e!603558 (and e!603557 mapRes!39034))))

(declare-fun condMapEmpty!39034 () Bool)

(declare-fun mapDefault!39034 () ValueCell!11756)

(assert (=> b!1060411 (= condMapEmpty!39034 (= (arr!32162 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11756)) mapDefault!39034)))))

(assert (= (and start!93820 res!708050) b!1060408))

(assert (= (and b!1060408 res!708049) b!1060407))

(assert (= (and b!1060407 res!708048) b!1060409))

(assert (= (and b!1060411 condMapEmpty!39034) mapIsEmpty!39034))

(assert (= (and b!1060411 (not condMapEmpty!39034)) mapNonEmpty!39034))

(get-info :version)

(assert (= (and mapNonEmpty!39034 ((_ is ValueCellFull!11756) mapValue!39034)) b!1060410))

(assert (= (and b!1060411 ((_ is ValueCellFull!11756) mapDefault!39034)) b!1060406))

(assert (= start!93820 b!1060411))

(declare-fun m!980309 () Bool)

(assert (=> mapNonEmpty!39034 m!980309))

(declare-fun m!980311 () Bool)

(assert (=> start!93820 m!980311))

(declare-fun m!980313 () Bool)

(assert (=> start!93820 m!980313))

(declare-fun m!980315 () Bool)

(assert (=> start!93820 m!980315))

(declare-fun m!980317 () Bool)

(assert (=> b!1060407 m!980317))

(check-sat (not start!93820) (not b!1060407) (not mapNonEmpty!39034) tp_is_empty!24919)
(check-sat)
(get-model)

(declare-fun d!129157 () Bool)

(assert (=> d!129157 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93820 d!129157))

(declare-fun d!129159 () Bool)

(assert (=> d!129159 (= (array_inv!24938 _values!955) (bvsge (size!32699 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93820 d!129159))

(declare-fun d!129161 () Bool)

(assert (=> d!129161 (= (array_inv!24939 _keys!1163) (bvsge (size!32700 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93820 d!129161))

(declare-fun d!129163 () Bool)

(declare-fun res!708073 () Bool)

(declare-fun e!603597 () Bool)

(assert (=> d!129163 (=> res!708073 e!603597)))

(assert (=> d!129163 (= res!708073 (bvsge #b00000000000000000000000000000000 (size!32700 _keys!1163)))))

(assert (=> d!129163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!603597)))

(declare-fun b!1060456 () Bool)

(declare-fun e!603598 () Bool)

(declare-fun e!603596 () Bool)

(assert (=> b!1060456 (= e!603598 e!603596)))

(declare-fun lt!467599 () (_ BitVec 64))

(assert (=> b!1060456 (= lt!467599 (select (arr!32163 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34725 0))(
  ( (Unit!34726) )
))
(declare-fun lt!467598 () Unit!34725)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66913 (_ BitVec 64) (_ BitVec 32)) Unit!34725)

(assert (=> b!1060456 (= lt!467598 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467599 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060456 (arrayContainsKey!0 _keys!1163 lt!467599 #b00000000000000000000000000000000)))

(declare-fun lt!467600 () Unit!34725)

(assert (=> b!1060456 (= lt!467600 lt!467598)))

(declare-fun res!708074 () Bool)

(declare-datatypes ((SeekEntryResult!9822 0))(
  ( (MissingZero!9822 (index!41659 (_ BitVec 32))) (Found!9822 (index!41660 (_ BitVec 32))) (Intermediate!9822 (undefined!10634 Bool) (index!41661 (_ BitVec 32)) (x!94611 (_ BitVec 32))) (Undefined!9822) (MissingVacant!9822 (index!41662 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66913 (_ BitVec 32)) SeekEntryResult!9822)

(assert (=> b!1060456 (= res!708074 (= (seekEntryOrOpen!0 (select (arr!32163 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9822 #b00000000000000000000000000000000)))))

(assert (=> b!1060456 (=> (not res!708074) (not e!603596))))

(declare-fun b!1060457 () Bool)

(assert (=> b!1060457 (= e!603597 e!603598)))

(declare-fun c!107597 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1060457 (= c!107597 (validKeyInArray!0 (select (arr!32163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060458 () Bool)

(declare-fun call!44945 () Bool)

(assert (=> b!1060458 (= e!603596 call!44945)))

(declare-fun b!1060459 () Bool)

(assert (=> b!1060459 (= e!603598 call!44945)))

(declare-fun bm!44942 () Bool)

(assert (=> bm!44942 (= call!44945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129163 (not res!708073)) b!1060457))

(assert (= (and b!1060457 c!107597) b!1060456))

(assert (= (and b!1060457 (not c!107597)) b!1060459))

(assert (= (and b!1060456 res!708074) b!1060458))

(assert (= (or b!1060458 b!1060459) bm!44942))

(declare-fun m!980339 () Bool)

(assert (=> b!1060456 m!980339))

(declare-fun m!980341 () Bool)

(assert (=> b!1060456 m!980341))

(declare-fun m!980343 () Bool)

(assert (=> b!1060456 m!980343))

(assert (=> b!1060456 m!980339))

(declare-fun m!980345 () Bool)

(assert (=> b!1060456 m!980345))

(assert (=> b!1060457 m!980339))

(assert (=> b!1060457 m!980339))

(declare-fun m!980347 () Bool)

(assert (=> b!1060457 m!980347))

(declare-fun m!980349 () Bool)

(assert (=> bm!44942 m!980349))

(assert (=> b!1060407 d!129163))

(declare-fun b!1060467 () Bool)

(declare-fun e!603603 () Bool)

(assert (=> b!1060467 (= e!603603 tp_is_empty!24919)))

(declare-fun b!1060466 () Bool)

(declare-fun e!603604 () Bool)

(assert (=> b!1060466 (= e!603604 tp_is_empty!24919)))

(declare-fun mapNonEmpty!39043 () Bool)

(declare-fun mapRes!39043 () Bool)

(declare-fun tp!74849 () Bool)

(assert (=> mapNonEmpty!39043 (= mapRes!39043 (and tp!74849 e!603604))))

(declare-fun mapKey!39043 () (_ BitVec 32))

(declare-fun mapValue!39043 () ValueCell!11756)

(declare-fun mapRest!39043 () (Array (_ BitVec 32) ValueCell!11756))

(assert (=> mapNonEmpty!39043 (= mapRest!39034 (store mapRest!39043 mapKey!39043 mapValue!39043))))

(declare-fun mapIsEmpty!39043 () Bool)

(assert (=> mapIsEmpty!39043 mapRes!39043))

(declare-fun condMapEmpty!39043 () Bool)

(declare-fun mapDefault!39043 () ValueCell!11756)

(assert (=> mapNonEmpty!39034 (= condMapEmpty!39043 (= mapRest!39034 ((as const (Array (_ BitVec 32) ValueCell!11756)) mapDefault!39043)))))

(assert (=> mapNonEmpty!39034 (= tp!74840 (and e!603603 mapRes!39043))))

(assert (= (and mapNonEmpty!39034 condMapEmpty!39043) mapIsEmpty!39043))

(assert (= (and mapNonEmpty!39034 (not condMapEmpty!39043)) mapNonEmpty!39043))

(assert (= (and mapNonEmpty!39043 ((_ is ValueCellFull!11756) mapValue!39043)) b!1060466))

(assert (= (and mapNonEmpty!39034 ((_ is ValueCellFull!11756) mapDefault!39043)) b!1060467))

(declare-fun m!980351 () Bool)

(assert (=> mapNonEmpty!39043 m!980351))

(check-sat (not bm!44942) (not b!1060456) tp_is_empty!24919 (not b!1060457) (not mapNonEmpty!39043))
(check-sat)
