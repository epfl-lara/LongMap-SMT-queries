; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106924 () Bool)

(assert start!106924)

(declare-fun b!1268169 () Bool)

(declare-fun e!722584 () Bool)

(declare-datatypes ((array!82554 0))(
  ( (array!82555 (arr!39817 (Array (_ BitVec 32) (_ BitVec 64))) (size!40353 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82554)

(assert (=> b!1268169 (= e!722584 (and (bvsle #b00000000000000000000000000000000 (size!40353 _keys!1364)) (bvsge (size!40353 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!50536 () Bool)

(declare-fun mapRes!50536 () Bool)

(assert (=> mapIsEmpty!50536 mapRes!50536))

(declare-fun b!1268170 () Bool)

(declare-fun e!722582 () Bool)

(declare-fun tp_is_empty!32643 () Bool)

(assert (=> b!1268170 (= e!722582 tp_is_empty!32643)))

(declare-fun res!844099 () Bool)

(assert (=> start!106924 (=> (not res!844099) (not e!722584))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106924 (= res!844099 (validMask!0 mask!1730))))

(assert (=> start!106924 e!722584))

(declare-datatypes ((V!48717 0))(
  ( (V!48718 (val!16396 Int)) )
))
(declare-datatypes ((ValueCell!15468 0))(
  ( (ValueCellFull!15468 (v!19032 V!48717)) (EmptyCell!15468) )
))
(declare-datatypes ((array!82556 0))(
  ( (array!82557 (arr!39818 (Array (_ BitVec 32) ValueCell!15468)) (size!40354 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82556)

(declare-fun e!722583 () Bool)

(declare-fun array_inv!30301 (array!82556) Bool)

(assert (=> start!106924 (and (array_inv!30301 _values!1134) e!722583)))

(assert (=> start!106924 true))

(declare-fun array_inv!30302 (array!82554) Bool)

(assert (=> start!106924 (array_inv!30302 _keys!1364)))

(declare-fun mapNonEmpty!50536 () Bool)

(declare-fun tp!96715 () Bool)

(declare-fun e!722581 () Bool)

(assert (=> mapNonEmpty!50536 (= mapRes!50536 (and tp!96715 e!722581))))

(declare-fun mapRest!50536 () (Array (_ BitVec 32) ValueCell!15468))

(declare-fun mapValue!50536 () ValueCell!15468)

(declare-fun mapKey!50536 () (_ BitVec 32))

(assert (=> mapNonEmpty!50536 (= (arr!39818 _values!1134) (store mapRest!50536 mapKey!50536 mapValue!50536))))

(declare-fun b!1268171 () Bool)

(declare-fun res!844100 () Bool)

(assert (=> b!1268171 (=> (not res!844100) (not e!722584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82554 (_ BitVec 32)) Bool)

(assert (=> b!1268171 (= res!844100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268172 () Bool)

(declare-fun res!844101 () Bool)

(assert (=> b!1268172 (=> (not res!844101) (not e!722584))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268172 (= res!844101 (and (= (size!40354 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40353 _keys!1364) (size!40354 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268173 () Bool)

(assert (=> b!1268173 (= e!722581 tp_is_empty!32643)))

(declare-fun b!1268174 () Bool)

(assert (=> b!1268174 (= e!722583 (and e!722582 mapRes!50536))))

(declare-fun condMapEmpty!50536 () Bool)

(declare-fun mapDefault!50536 () ValueCell!15468)

(assert (=> b!1268174 (= condMapEmpty!50536 (= (arr!39818 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15468)) mapDefault!50536)))))

(assert (= (and start!106924 res!844099) b!1268172))

(assert (= (and b!1268172 res!844101) b!1268171))

(assert (= (and b!1268171 res!844100) b!1268169))

(assert (= (and b!1268174 condMapEmpty!50536) mapIsEmpty!50536))

(assert (= (and b!1268174 (not condMapEmpty!50536)) mapNonEmpty!50536))

(get-info :version)

(assert (= (and mapNonEmpty!50536 ((_ is ValueCellFull!15468) mapValue!50536)) b!1268173))

(assert (= (and b!1268174 ((_ is ValueCellFull!15468) mapDefault!50536)) b!1268170))

(assert (= start!106924 b!1268174))

(declare-fun m!1167111 () Bool)

(assert (=> start!106924 m!1167111))

(declare-fun m!1167113 () Bool)

(assert (=> start!106924 m!1167113))

(declare-fun m!1167115 () Bool)

(assert (=> start!106924 m!1167115))

(declare-fun m!1167117 () Bool)

(assert (=> mapNonEmpty!50536 m!1167117))

(declare-fun m!1167119 () Bool)

(assert (=> b!1268171 m!1167119))

(check-sat (not start!106924) (not b!1268171) (not mapNonEmpty!50536) tp_is_empty!32643)
(check-sat)
(get-model)

(declare-fun d!139649 () Bool)

(assert (=> d!139649 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106924 d!139649))

(declare-fun d!139651 () Bool)

(assert (=> d!139651 (= (array_inv!30301 _values!1134) (bvsge (size!40354 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106924 d!139651))

(declare-fun d!139653 () Bool)

(assert (=> d!139653 (= (array_inv!30302 _keys!1364) (bvsge (size!40353 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106924 d!139653))

(declare-fun b!1268201 () Bool)

(declare-fun e!722608 () Bool)

(declare-fun call!62509 () Bool)

(assert (=> b!1268201 (= e!722608 call!62509)))

(declare-fun b!1268202 () Bool)

(declare-fun e!722607 () Bool)

(assert (=> b!1268202 (= e!722607 e!722608)))

(declare-fun c!123626 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1268202 (= c!123626 (validKeyInArray!0 (select (arr!39817 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun d!139655 () Bool)

(declare-fun res!844116 () Bool)

(assert (=> d!139655 (=> res!844116 e!722607)))

(assert (=> d!139655 (= res!844116 (bvsge #b00000000000000000000000000000000 (size!40353 _keys!1364)))))

(assert (=> d!139655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!722607)))

(declare-fun b!1268203 () Bool)

(declare-fun e!722606 () Bool)

(assert (=> b!1268203 (= e!722606 call!62509)))

(declare-fun b!1268204 () Bool)

(assert (=> b!1268204 (= e!722608 e!722606)))

(declare-fun lt!574398 () (_ BitVec 64))

(assert (=> b!1268204 (= lt!574398 (select (arr!39817 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42230 0))(
  ( (Unit!42231) )
))
(declare-fun lt!574399 () Unit!42230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82554 (_ BitVec 64) (_ BitVec 32)) Unit!42230)

(assert (=> b!1268204 (= lt!574399 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574398 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1268204 (arrayContainsKey!0 _keys!1364 lt!574398 #b00000000000000000000000000000000)))

(declare-fun lt!574400 () Unit!42230)

(assert (=> b!1268204 (= lt!574400 lt!574399)))

(declare-fun res!844115 () Bool)

(declare-datatypes ((SeekEntryResult!9984 0))(
  ( (MissingZero!9984 (index!42307 (_ BitVec 32))) (Found!9984 (index!42308 (_ BitVec 32))) (Intermediate!9984 (undefined!10796 Bool) (index!42309 (_ BitVec 32)) (x!111845 (_ BitVec 32))) (Undefined!9984) (MissingVacant!9984 (index!42310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82554 (_ BitVec 32)) SeekEntryResult!9984)

(assert (=> b!1268204 (= res!844115 (= (seekEntryOrOpen!0 (select (arr!39817 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9984 #b00000000000000000000000000000000)))))

(assert (=> b!1268204 (=> (not res!844115) (not e!722606))))

(declare-fun bm!62506 () Bool)

(assert (=> bm!62506 (= call!62509 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(assert (= (and d!139655 (not res!844116)) b!1268202))

(assert (= (and b!1268202 c!123626) b!1268204))

(assert (= (and b!1268202 (not c!123626)) b!1268201))

(assert (= (and b!1268204 res!844115) b!1268203))

(assert (= (or b!1268203 b!1268201) bm!62506))

(declare-fun m!1167131 () Bool)

(assert (=> b!1268202 m!1167131))

(assert (=> b!1268202 m!1167131))

(declare-fun m!1167133 () Bool)

(assert (=> b!1268202 m!1167133))

(assert (=> b!1268204 m!1167131))

(declare-fun m!1167135 () Bool)

(assert (=> b!1268204 m!1167135))

(declare-fun m!1167137 () Bool)

(assert (=> b!1268204 m!1167137))

(assert (=> b!1268204 m!1167131))

(declare-fun m!1167139 () Bool)

(assert (=> b!1268204 m!1167139))

(declare-fun m!1167141 () Bool)

(assert (=> bm!62506 m!1167141))

(assert (=> b!1268171 d!139655))

(declare-fun b!1268212 () Bool)

(declare-fun e!722613 () Bool)

(assert (=> b!1268212 (= e!722613 tp_is_empty!32643)))

(declare-fun mapIsEmpty!50542 () Bool)

(declare-fun mapRes!50542 () Bool)

(assert (=> mapIsEmpty!50542 mapRes!50542))

(declare-fun b!1268211 () Bool)

(declare-fun e!722614 () Bool)

(assert (=> b!1268211 (= e!722614 tp_is_empty!32643)))

(declare-fun mapNonEmpty!50542 () Bool)

(declare-fun tp!96721 () Bool)

(assert (=> mapNonEmpty!50542 (= mapRes!50542 (and tp!96721 e!722614))))

(declare-fun mapRest!50542 () (Array (_ BitVec 32) ValueCell!15468))

(declare-fun mapKey!50542 () (_ BitVec 32))

(declare-fun mapValue!50542 () ValueCell!15468)

(assert (=> mapNonEmpty!50542 (= mapRest!50536 (store mapRest!50542 mapKey!50542 mapValue!50542))))

(declare-fun condMapEmpty!50542 () Bool)

(declare-fun mapDefault!50542 () ValueCell!15468)

(assert (=> mapNonEmpty!50536 (= condMapEmpty!50542 (= mapRest!50536 ((as const (Array (_ BitVec 32) ValueCell!15468)) mapDefault!50542)))))

(assert (=> mapNonEmpty!50536 (= tp!96715 (and e!722613 mapRes!50542))))

(assert (= (and mapNonEmpty!50536 condMapEmpty!50542) mapIsEmpty!50542))

(assert (= (and mapNonEmpty!50536 (not condMapEmpty!50542)) mapNonEmpty!50542))

(assert (= (and mapNonEmpty!50542 ((_ is ValueCellFull!15468) mapValue!50542)) b!1268211))

(assert (= (and mapNonEmpty!50536 ((_ is ValueCellFull!15468) mapDefault!50542)) b!1268212))

(declare-fun m!1167143 () Bool)

(assert (=> mapNonEmpty!50542 m!1167143))

(check-sat (not bm!62506) (not mapNonEmpty!50542) tp_is_empty!32643 (not b!1268202) (not b!1268204))
(check-sat)
