; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106936 () Bool)

(assert start!106936)

(declare-fun b!1268163 () Bool)

(declare-fun res!844101 () Bool)

(declare-fun e!722600 () Bool)

(assert (=> b!1268163 (=> (not res!844101) (not e!722600))))

(declare-datatypes ((array!82487 0))(
  ( (array!82488 (arr!39783 (Array (_ BitVec 32) (_ BitVec 64))) (size!40321 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82487)

(assert (=> b!1268163 (= res!844101 (and (bvsle #b00000000000000000000000000000000 (size!40321 _keys!1364)) (bvslt (size!40321 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun b!1268164 () Bool)

(declare-fun res!844100 () Bool)

(assert (=> b!1268164 (=> (not res!844100) (not e!722600))))

(declare-datatypes ((V!48723 0))(
  ( (V!48724 (val!16398 Int)) )
))
(declare-datatypes ((ValueCell!15470 0))(
  ( (ValueCellFull!15470 (v!19033 V!48723)) (EmptyCell!15470) )
))
(declare-datatypes ((array!82489 0))(
  ( (array!82490 (arr!39784 (Array (_ BitVec 32) ValueCell!15470)) (size!40322 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82489)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268164 (= res!844100 (and (= (size!40322 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40321 _keys!1364) (size!40322 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844099 () Bool)

(assert (=> start!106936 (=> (not res!844099) (not e!722600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106936 (= res!844099 (validMask!0 mask!1730))))

(assert (=> start!106936 e!722600))

(declare-fun e!722598 () Bool)

(declare-fun array_inv!30439 (array!82489) Bool)

(assert (=> start!106936 (and (array_inv!30439 _values!1134) e!722598)))

(assert (=> start!106936 true))

(declare-fun array_inv!30440 (array!82487) Bool)

(assert (=> start!106936 (array_inv!30440 _keys!1364)))

(declare-fun mapNonEmpty!50545 () Bool)

(declare-fun mapRes!50545 () Bool)

(declare-fun tp!96725 () Bool)

(declare-fun e!722599 () Bool)

(assert (=> mapNonEmpty!50545 (= mapRes!50545 (and tp!96725 e!722599))))

(declare-fun mapRest!50545 () (Array (_ BitVec 32) ValueCell!15470))

(declare-fun mapValue!50545 () ValueCell!15470)

(declare-fun mapKey!50545 () (_ BitVec 32))

(assert (=> mapNonEmpty!50545 (= (arr!39784 _values!1134) (store mapRest!50545 mapKey!50545 mapValue!50545))))

(declare-fun mapIsEmpty!50545 () Bool)

(assert (=> mapIsEmpty!50545 mapRes!50545))

(declare-fun b!1268165 () Bool)

(declare-fun e!722597 () Bool)

(declare-fun tp_is_empty!32647 () Bool)

(assert (=> b!1268165 (= e!722597 tp_is_empty!32647)))

(declare-fun b!1268166 () Bool)

(declare-datatypes ((List!28462 0))(
  ( (Nil!28459) (Cons!28458 (h!29667 (_ BitVec 64)) (t!41983 List!28462)) )
))
(declare-fun noDuplicate!2061 (List!28462) Bool)

(assert (=> b!1268166 (= e!722600 (not (noDuplicate!2061 Nil!28459)))))

(declare-fun b!1268167 () Bool)

(declare-fun res!844098 () Bool)

(assert (=> b!1268167 (=> (not res!844098) (not e!722600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82487 (_ BitVec 32)) Bool)

(assert (=> b!1268167 (= res!844098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268168 () Bool)

(assert (=> b!1268168 (= e!722599 tp_is_empty!32647)))

(declare-fun b!1268169 () Bool)

(assert (=> b!1268169 (= e!722598 (and e!722597 mapRes!50545))))

(declare-fun condMapEmpty!50545 () Bool)

(declare-fun mapDefault!50545 () ValueCell!15470)

(assert (=> b!1268169 (= condMapEmpty!50545 (= (arr!39784 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15470)) mapDefault!50545)))))

(assert (= (and start!106936 res!844099) b!1268164))

(assert (= (and b!1268164 res!844100) b!1268167))

(assert (= (and b!1268167 res!844098) b!1268163))

(assert (= (and b!1268163 res!844101) b!1268166))

(assert (= (and b!1268169 condMapEmpty!50545) mapIsEmpty!50545))

(assert (= (and b!1268169 (not condMapEmpty!50545)) mapNonEmpty!50545))

(get-info :version)

(assert (= (and mapNonEmpty!50545 ((_ is ValueCellFull!15470) mapValue!50545)) b!1268168))

(assert (= (and b!1268169 ((_ is ValueCellFull!15470) mapDefault!50545)) b!1268165))

(assert (= start!106936 b!1268169))

(declare-fun m!1166645 () Bool)

(assert (=> start!106936 m!1166645))

(declare-fun m!1166647 () Bool)

(assert (=> start!106936 m!1166647))

(declare-fun m!1166649 () Bool)

(assert (=> start!106936 m!1166649))

(declare-fun m!1166651 () Bool)

(assert (=> mapNonEmpty!50545 m!1166651))

(declare-fun m!1166653 () Bool)

(assert (=> b!1268166 m!1166653))

(declare-fun m!1166655 () Bool)

(assert (=> b!1268167 m!1166655))

(check-sat (not start!106936) tp_is_empty!32647 (not mapNonEmpty!50545) (not b!1268167) (not b!1268166))
(check-sat)
(get-model)

(declare-fun d!139547 () Bool)

(assert (=> d!139547 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106936 d!139547))

(declare-fun d!139549 () Bool)

(assert (=> d!139549 (= (array_inv!30439 _values!1134) (bvsge (size!40322 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106936 d!139549))

(declare-fun d!139551 () Bool)

(assert (=> d!139551 (= (array_inv!30440 _keys!1364) (bvsge (size!40321 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106936 d!139551))

(declare-fun bm!62490 () Bool)

(declare-fun call!62493 () Bool)

(assert (=> bm!62490 (= call!62493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1268221 () Bool)

(declare-fun e!722638 () Bool)

(assert (=> b!1268221 (= e!722638 call!62493)))

(declare-fun b!1268222 () Bool)

(declare-fun e!722637 () Bool)

(declare-fun e!722639 () Bool)

(assert (=> b!1268222 (= e!722637 e!722639)))

(declare-fun c!123613 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1268222 (= c!123613 (validKeyInArray!0 (select (arr!39783 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1268223 () Bool)

(assert (=> b!1268223 (= e!722639 call!62493)))

(declare-fun b!1268220 () Bool)

(assert (=> b!1268220 (= e!722639 e!722638)))

(declare-fun lt!574231 () (_ BitVec 64))

(assert (=> b!1268220 (= lt!574231 (select (arr!39783 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42082 0))(
  ( (Unit!42083) )
))
(declare-fun lt!574229 () Unit!42082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82487 (_ BitVec 64) (_ BitVec 32)) Unit!42082)

(assert (=> b!1268220 (= lt!574229 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574231 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1268220 (arrayContainsKey!0 _keys!1364 lt!574231 #b00000000000000000000000000000000)))

(declare-fun lt!574230 () Unit!42082)

(assert (=> b!1268220 (= lt!574230 lt!574229)))

(declare-fun res!844130 () Bool)

(declare-datatypes ((SeekEntryResult!9984 0))(
  ( (MissingZero!9984 (index!42307 (_ BitVec 32))) (Found!9984 (index!42308 (_ BitVec 32))) (Intermediate!9984 (undefined!10796 Bool) (index!42309 (_ BitVec 32)) (x!111852 (_ BitVec 32))) (Undefined!9984) (MissingVacant!9984 (index!42310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82487 (_ BitVec 32)) SeekEntryResult!9984)

(assert (=> b!1268220 (= res!844130 (= (seekEntryOrOpen!0 (select (arr!39783 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9984 #b00000000000000000000000000000000)))))

(assert (=> b!1268220 (=> (not res!844130) (not e!722638))))

(declare-fun d!139553 () Bool)

(declare-fun res!844131 () Bool)

(assert (=> d!139553 (=> res!844131 e!722637)))

(assert (=> d!139553 (= res!844131 (bvsge #b00000000000000000000000000000000 (size!40321 _keys!1364)))))

(assert (=> d!139553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!722637)))

(assert (= (and d!139553 (not res!844131)) b!1268222))

(assert (= (and b!1268222 c!123613) b!1268220))

(assert (= (and b!1268222 (not c!123613)) b!1268223))

(assert (= (and b!1268220 res!844130) b!1268221))

(assert (= (or b!1268221 b!1268223) bm!62490))

(declare-fun m!1166681 () Bool)

(assert (=> bm!62490 m!1166681))

(declare-fun m!1166683 () Bool)

(assert (=> b!1268222 m!1166683))

(assert (=> b!1268222 m!1166683))

(declare-fun m!1166685 () Bool)

(assert (=> b!1268222 m!1166685))

(assert (=> b!1268220 m!1166683))

(declare-fun m!1166687 () Bool)

(assert (=> b!1268220 m!1166687))

(declare-fun m!1166689 () Bool)

(assert (=> b!1268220 m!1166689))

(assert (=> b!1268220 m!1166683))

(declare-fun m!1166691 () Bool)

(assert (=> b!1268220 m!1166691))

(assert (=> b!1268167 d!139553))

(declare-fun d!139555 () Bool)

(declare-fun res!844136 () Bool)

(declare-fun e!722644 () Bool)

(assert (=> d!139555 (=> res!844136 e!722644)))

(assert (=> d!139555 (= res!844136 ((_ is Nil!28459) Nil!28459))))

(assert (=> d!139555 (= (noDuplicate!2061 Nil!28459) e!722644)))

(declare-fun b!1268228 () Bool)

(declare-fun e!722645 () Bool)

(assert (=> b!1268228 (= e!722644 e!722645)))

(declare-fun res!844137 () Bool)

(assert (=> b!1268228 (=> (not res!844137) (not e!722645))))

(declare-fun contains!7630 (List!28462 (_ BitVec 64)) Bool)

(assert (=> b!1268228 (= res!844137 (not (contains!7630 (t!41983 Nil!28459) (h!29667 Nil!28459))))))

(declare-fun b!1268229 () Bool)

(assert (=> b!1268229 (= e!722645 (noDuplicate!2061 (t!41983 Nil!28459)))))

(assert (= (and d!139555 (not res!844136)) b!1268228))

(assert (= (and b!1268228 res!844137) b!1268229))

(declare-fun m!1166693 () Bool)

(assert (=> b!1268228 m!1166693))

(declare-fun m!1166695 () Bool)

(assert (=> b!1268229 m!1166695))

(assert (=> b!1268166 d!139555))

(declare-fun mapNonEmpty!50554 () Bool)

(declare-fun mapRes!50554 () Bool)

(declare-fun tp!96734 () Bool)

(declare-fun e!722650 () Bool)

(assert (=> mapNonEmpty!50554 (= mapRes!50554 (and tp!96734 e!722650))))

(declare-fun mapRest!50554 () (Array (_ BitVec 32) ValueCell!15470))

(declare-fun mapValue!50554 () ValueCell!15470)

(declare-fun mapKey!50554 () (_ BitVec 32))

(assert (=> mapNonEmpty!50554 (= mapRest!50545 (store mapRest!50554 mapKey!50554 mapValue!50554))))

(declare-fun b!1268236 () Bool)

(assert (=> b!1268236 (= e!722650 tp_is_empty!32647)))

(declare-fun b!1268237 () Bool)

(declare-fun e!722651 () Bool)

(assert (=> b!1268237 (= e!722651 tp_is_empty!32647)))

(declare-fun condMapEmpty!50554 () Bool)

(declare-fun mapDefault!50554 () ValueCell!15470)

(assert (=> mapNonEmpty!50545 (= condMapEmpty!50554 (= mapRest!50545 ((as const (Array (_ BitVec 32) ValueCell!15470)) mapDefault!50554)))))

(assert (=> mapNonEmpty!50545 (= tp!96725 (and e!722651 mapRes!50554))))

(declare-fun mapIsEmpty!50554 () Bool)

(assert (=> mapIsEmpty!50554 mapRes!50554))

(assert (= (and mapNonEmpty!50545 condMapEmpty!50554) mapIsEmpty!50554))

(assert (= (and mapNonEmpty!50545 (not condMapEmpty!50554)) mapNonEmpty!50554))

(assert (= (and mapNonEmpty!50554 ((_ is ValueCellFull!15470) mapValue!50554)) b!1268236))

(assert (= (and mapNonEmpty!50545 ((_ is ValueCellFull!15470) mapDefault!50554)) b!1268237))

(declare-fun m!1166697 () Bool)

(assert (=> mapNonEmpty!50554 m!1166697))

(check-sat (not mapNonEmpty!50554) (not b!1268229) tp_is_empty!32647 (not bm!62490) (not b!1268222) (not b!1268228) (not b!1268220))
(check-sat)
