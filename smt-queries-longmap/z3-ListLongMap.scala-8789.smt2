; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106938 () Bool)

(assert start!106938)

(declare-fun b!1268248 () Bool)

(declare-fun e!722644 () Bool)

(declare-fun tp_is_empty!32649 () Bool)

(assert (=> b!1268248 (= e!722644 tp_is_empty!32649)))

(declare-fun b!1268249 () Bool)

(declare-fun e!722642 () Bool)

(declare-datatypes ((List!28378 0))(
  ( (Nil!28375) (Cons!28374 (h!29583 (_ BitVec 64)) (t!41907 List!28378)) )
))
(declare-fun noDuplicate!2042 (List!28378) Bool)

(assert (=> b!1268249 (= e!722642 (not (noDuplicate!2042 Nil!28375)))))

(declare-fun mapIsEmpty!50548 () Bool)

(declare-fun mapRes!50548 () Bool)

(assert (=> mapIsEmpty!50548 mapRes!50548))

(declare-fun res!844138 () Bool)

(assert (=> start!106938 (=> (not res!844138) (not e!722642))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106938 (= res!844138 (validMask!0 mask!1730))))

(assert (=> start!106938 e!722642))

(declare-datatypes ((V!48725 0))(
  ( (V!48726 (val!16399 Int)) )
))
(declare-datatypes ((ValueCell!15471 0))(
  ( (ValueCellFull!15471 (v!19035 V!48725)) (EmptyCell!15471) )
))
(declare-datatypes ((array!82568 0))(
  ( (array!82569 (arr!39823 (Array (_ BitVec 32) ValueCell!15471)) (size!40359 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82568)

(declare-fun e!722641 () Bool)

(declare-fun array_inv!30303 (array!82568) Bool)

(assert (=> start!106938 (and (array_inv!30303 _values!1134) e!722641)))

(assert (=> start!106938 true))

(declare-datatypes ((array!82570 0))(
  ( (array!82571 (arr!39824 (Array (_ BitVec 32) (_ BitVec 64))) (size!40360 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82570)

(declare-fun array_inv!30304 (array!82570) Bool)

(assert (=> start!106938 (array_inv!30304 _keys!1364)))

(declare-fun b!1268250 () Bool)

(declare-fun e!722640 () Bool)

(assert (=> b!1268250 (= e!722640 tp_is_empty!32649)))

(declare-fun b!1268251 () Bool)

(assert (=> b!1268251 (= e!722641 (and e!722640 mapRes!50548))))

(declare-fun condMapEmpty!50548 () Bool)

(declare-fun mapDefault!50548 () ValueCell!15471)

(assert (=> b!1268251 (= condMapEmpty!50548 (= (arr!39823 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15471)) mapDefault!50548)))))

(declare-fun mapNonEmpty!50548 () Bool)

(declare-fun tp!96727 () Bool)

(assert (=> mapNonEmpty!50548 (= mapRes!50548 (and tp!96727 e!722644))))

(declare-fun mapKey!50548 () (_ BitVec 32))

(declare-fun mapRest!50548 () (Array (_ BitVec 32) ValueCell!15471))

(declare-fun mapValue!50548 () ValueCell!15471)

(assert (=> mapNonEmpty!50548 (= (arr!39823 _values!1134) (store mapRest!50548 mapKey!50548 mapValue!50548))))

(declare-fun b!1268252 () Bool)

(declare-fun res!844137 () Bool)

(assert (=> b!1268252 (=> (not res!844137) (not e!722642))))

(assert (=> b!1268252 (= res!844137 (and (bvsle #b00000000000000000000000000000000 (size!40360 _keys!1364)) (bvslt (size!40360 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun b!1268253 () Bool)

(declare-fun res!844139 () Bool)

(assert (=> b!1268253 (=> (not res!844139) (not e!722642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82570 (_ BitVec 32)) Bool)

(assert (=> b!1268253 (= res!844139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268254 () Bool)

(declare-fun res!844140 () Bool)

(assert (=> b!1268254 (=> (not res!844140) (not e!722642))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268254 (= res!844140 (and (= (size!40359 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40360 _keys!1364) (size!40359 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!106938 res!844138) b!1268254))

(assert (= (and b!1268254 res!844140) b!1268253))

(assert (= (and b!1268253 res!844139) b!1268252))

(assert (= (and b!1268252 res!844137) b!1268249))

(assert (= (and b!1268251 condMapEmpty!50548) mapIsEmpty!50548))

(assert (= (and b!1268251 (not condMapEmpty!50548)) mapNonEmpty!50548))

(get-info :version)

(assert (= (and mapNonEmpty!50548 ((_ is ValueCellFull!15471) mapValue!50548)) b!1268248))

(assert (= (and b!1268251 ((_ is ValueCellFull!15471) mapDefault!50548)) b!1268250))

(assert (= start!106938 b!1268251))

(declare-fun m!1167157 () Bool)

(assert (=> b!1268249 m!1167157))

(declare-fun m!1167159 () Bool)

(assert (=> start!106938 m!1167159))

(declare-fun m!1167161 () Bool)

(assert (=> start!106938 m!1167161))

(declare-fun m!1167163 () Bool)

(assert (=> start!106938 m!1167163))

(declare-fun m!1167165 () Bool)

(assert (=> mapNonEmpty!50548 m!1167165))

(declare-fun m!1167167 () Bool)

(assert (=> b!1268253 m!1167167))

(check-sat (not b!1268249) (not mapNonEmpty!50548) (not b!1268253) tp_is_empty!32649 (not start!106938))
(check-sat)
(get-model)

(declare-fun bm!62509 () Bool)

(declare-fun call!62512 () Bool)

(assert (=> bm!62509 (= call!62512 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1268284 () Bool)

(declare-fun e!722666 () Bool)

(assert (=> b!1268284 (= e!722666 call!62512)))

(declare-fun b!1268285 () Bool)

(declare-fun e!722667 () Bool)

(assert (=> b!1268285 (= e!722667 e!722666)))

(declare-fun lt!574407 () (_ BitVec 64))

(assert (=> b!1268285 (= lt!574407 (select (arr!39824 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42232 0))(
  ( (Unit!42233) )
))
(declare-fun lt!574409 () Unit!42232)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82570 (_ BitVec 64) (_ BitVec 32)) Unit!42232)

(assert (=> b!1268285 (= lt!574409 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574407 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1268285 (arrayContainsKey!0 _keys!1364 lt!574407 #b00000000000000000000000000000000)))

(declare-fun lt!574408 () Unit!42232)

(assert (=> b!1268285 (= lt!574408 lt!574409)))

(declare-fun res!844157 () Bool)

(declare-datatypes ((SeekEntryResult!9985 0))(
  ( (MissingZero!9985 (index!42311 (_ BitVec 32))) (Found!9985 (index!42312 (_ BitVec 32))) (Intermediate!9985 (undefined!10797 Bool) (index!42313 (_ BitVec 32)) (x!111856 (_ BitVec 32))) (Undefined!9985) (MissingVacant!9985 (index!42314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82570 (_ BitVec 32)) SeekEntryResult!9985)

(assert (=> b!1268285 (= res!844157 (= (seekEntryOrOpen!0 (select (arr!39824 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9985 #b00000000000000000000000000000000)))))

(assert (=> b!1268285 (=> (not res!844157) (not e!722666))))

(declare-fun b!1268286 () Bool)

(declare-fun e!722668 () Bool)

(assert (=> b!1268286 (= e!722668 e!722667)))

(declare-fun c!123629 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1268286 (= c!123629 (validKeyInArray!0 (select (arr!39824 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1268287 () Bool)

(assert (=> b!1268287 (= e!722667 call!62512)))

(declare-fun d!139659 () Bool)

(declare-fun res!844158 () Bool)

(assert (=> d!139659 (=> res!844158 e!722668)))

(assert (=> d!139659 (= res!844158 (bvsge #b00000000000000000000000000000000 (size!40360 _keys!1364)))))

(assert (=> d!139659 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!722668)))

(assert (= (and d!139659 (not res!844158)) b!1268286))

(assert (= (and b!1268286 c!123629) b!1268285))

(assert (= (and b!1268286 (not c!123629)) b!1268287))

(assert (= (and b!1268285 res!844157) b!1268284))

(assert (= (or b!1268284 b!1268287) bm!62509))

(declare-fun m!1167181 () Bool)

(assert (=> bm!62509 m!1167181))

(declare-fun m!1167183 () Bool)

(assert (=> b!1268285 m!1167183))

(declare-fun m!1167185 () Bool)

(assert (=> b!1268285 m!1167185))

(declare-fun m!1167187 () Bool)

(assert (=> b!1268285 m!1167187))

(assert (=> b!1268285 m!1167183))

(declare-fun m!1167189 () Bool)

(assert (=> b!1268285 m!1167189))

(assert (=> b!1268286 m!1167183))

(assert (=> b!1268286 m!1167183))

(declare-fun m!1167191 () Bool)

(assert (=> b!1268286 m!1167191))

(assert (=> b!1268253 d!139659))

(declare-fun d!139661 () Bool)

(declare-fun res!844163 () Bool)

(declare-fun e!722673 () Bool)

(assert (=> d!139661 (=> res!844163 e!722673)))

(assert (=> d!139661 (= res!844163 ((_ is Nil!28375) Nil!28375))))

(assert (=> d!139661 (= (noDuplicate!2042 Nil!28375) e!722673)))

(declare-fun b!1268292 () Bool)

(declare-fun e!722674 () Bool)

(assert (=> b!1268292 (= e!722673 e!722674)))

(declare-fun res!844164 () Bool)

(assert (=> b!1268292 (=> (not res!844164) (not e!722674))))

(declare-fun contains!7661 (List!28378 (_ BitVec 64)) Bool)

(assert (=> b!1268292 (= res!844164 (not (contains!7661 (t!41907 Nil!28375) (h!29583 Nil!28375))))))

(declare-fun b!1268293 () Bool)

(assert (=> b!1268293 (= e!722674 (noDuplicate!2042 (t!41907 Nil!28375)))))

(assert (= (and d!139661 (not res!844163)) b!1268292))

(assert (= (and b!1268292 res!844164) b!1268293))

(declare-fun m!1167193 () Bool)

(assert (=> b!1268292 m!1167193))

(declare-fun m!1167195 () Bool)

(assert (=> b!1268293 m!1167195))

(assert (=> b!1268249 d!139661))

(declare-fun d!139663 () Bool)

(assert (=> d!139663 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106938 d!139663))

(declare-fun d!139665 () Bool)

(assert (=> d!139665 (= (array_inv!30303 _values!1134) (bvsge (size!40359 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106938 d!139665))

(declare-fun d!139667 () Bool)

(assert (=> d!139667 (= (array_inv!30304 _keys!1364) (bvsge (size!40360 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106938 d!139667))

(declare-fun condMapEmpty!50554 () Bool)

(declare-fun mapDefault!50554 () ValueCell!15471)

(assert (=> mapNonEmpty!50548 (= condMapEmpty!50554 (= mapRest!50548 ((as const (Array (_ BitVec 32) ValueCell!15471)) mapDefault!50554)))))

(declare-fun e!722680 () Bool)

(declare-fun mapRes!50554 () Bool)

(assert (=> mapNonEmpty!50548 (= tp!96727 (and e!722680 mapRes!50554))))

(declare-fun b!1268300 () Bool)

(declare-fun e!722679 () Bool)

(assert (=> b!1268300 (= e!722679 tp_is_empty!32649)))

(declare-fun b!1268301 () Bool)

(assert (=> b!1268301 (= e!722680 tp_is_empty!32649)))

(declare-fun mapIsEmpty!50554 () Bool)

(assert (=> mapIsEmpty!50554 mapRes!50554))

(declare-fun mapNonEmpty!50554 () Bool)

(declare-fun tp!96733 () Bool)

(assert (=> mapNonEmpty!50554 (= mapRes!50554 (and tp!96733 e!722679))))

(declare-fun mapRest!50554 () (Array (_ BitVec 32) ValueCell!15471))

(declare-fun mapValue!50554 () ValueCell!15471)

(declare-fun mapKey!50554 () (_ BitVec 32))

(assert (=> mapNonEmpty!50554 (= mapRest!50548 (store mapRest!50554 mapKey!50554 mapValue!50554))))

(assert (= (and mapNonEmpty!50548 condMapEmpty!50554) mapIsEmpty!50554))

(assert (= (and mapNonEmpty!50548 (not condMapEmpty!50554)) mapNonEmpty!50554))

(assert (= (and mapNonEmpty!50554 ((_ is ValueCellFull!15471) mapValue!50554)) b!1268300))

(assert (= (and mapNonEmpty!50548 ((_ is ValueCellFull!15471) mapDefault!50554)) b!1268301))

(declare-fun m!1167197 () Bool)

(assert (=> mapNonEmpty!50554 m!1167197))

(check-sat (not b!1268286) (not b!1268285) (not b!1268292) (not mapNonEmpty!50554) (not bm!62509) (not b!1268293) tp_is_empty!32649)
(check-sat)
