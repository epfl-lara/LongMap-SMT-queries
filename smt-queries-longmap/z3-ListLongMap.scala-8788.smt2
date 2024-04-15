; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106922 () Bool)

(assert start!106922)

(declare-fun b!1268087 () Bool)

(declare-fun e!722540 () Bool)

(declare-datatypes ((array!82475 0))(
  ( (array!82476 (arr!39778 (Array (_ BitVec 32) (_ BitVec 64))) (size!40316 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82475)

(assert (=> b!1268087 (= e!722540 (and (bvsle #b00000000000000000000000000000000 (size!40316 _keys!1364)) (bvsge (size!40316 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!50533 () Bool)

(declare-fun mapRes!50533 () Bool)

(assert (=> mapIsEmpty!50533 mapRes!50533))

(declare-fun b!1268088 () Bool)

(declare-fun e!722539 () Bool)

(declare-fun tp_is_empty!32641 () Bool)

(assert (=> b!1268088 (= e!722539 tp_is_empty!32641)))

(declare-fun mapNonEmpty!50533 () Bool)

(declare-fun tp!96713 () Bool)

(assert (=> mapNonEmpty!50533 (= mapRes!50533 (and tp!96713 e!722539))))

(declare-datatypes ((V!48715 0))(
  ( (V!48716 (val!16395 Int)) )
))
(declare-datatypes ((ValueCell!15467 0))(
  ( (ValueCellFull!15467 (v!19030 V!48715)) (EmptyCell!15467) )
))
(declare-datatypes ((array!82477 0))(
  ( (array!82478 (arr!39779 (Array (_ BitVec 32) ValueCell!15467)) (size!40317 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82477)

(declare-fun mapRest!50533 () (Array (_ BitVec 32) ValueCell!15467))

(declare-fun mapKey!50533 () (_ BitVec 32))

(declare-fun mapValue!50533 () ValueCell!15467)

(assert (=> mapNonEmpty!50533 (= (arr!39779 _values!1134) (store mapRest!50533 mapKey!50533 mapValue!50533))))

(declare-fun res!844063 () Bool)

(assert (=> start!106922 (=> (not res!844063) (not e!722540))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106922 (= res!844063 (validMask!0 mask!1730))))

(assert (=> start!106922 e!722540))

(declare-fun e!722537 () Bool)

(declare-fun array_inv!30435 (array!82477) Bool)

(assert (=> start!106922 (and (array_inv!30435 _values!1134) e!722537)))

(assert (=> start!106922 true))

(declare-fun array_inv!30436 (array!82475) Bool)

(assert (=> start!106922 (array_inv!30436 _keys!1364)))

(declare-fun b!1268089 () Bool)

(declare-fun e!722536 () Bool)

(assert (=> b!1268089 (= e!722537 (and e!722536 mapRes!50533))))

(declare-fun condMapEmpty!50533 () Bool)

(declare-fun mapDefault!50533 () ValueCell!15467)

(assert (=> b!1268089 (= condMapEmpty!50533 (= (arr!39779 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15467)) mapDefault!50533)))))

(declare-fun b!1268090 () Bool)

(declare-fun res!844064 () Bool)

(assert (=> b!1268090 (=> (not res!844064) (not e!722540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82475 (_ BitVec 32)) Bool)

(assert (=> b!1268090 (= res!844064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268091 () Bool)

(declare-fun res!844065 () Bool)

(assert (=> b!1268091 (=> (not res!844065) (not e!722540))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268091 (= res!844065 (and (= (size!40317 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40316 _keys!1364) (size!40317 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268092 () Bool)

(assert (=> b!1268092 (= e!722536 tp_is_empty!32641)))

(assert (= (and start!106922 res!844063) b!1268091))

(assert (= (and b!1268091 res!844065) b!1268090))

(assert (= (and b!1268090 res!844064) b!1268087))

(assert (= (and b!1268089 condMapEmpty!50533) mapIsEmpty!50533))

(assert (= (and b!1268089 (not condMapEmpty!50533)) mapNonEmpty!50533))

(get-info :version)

(assert (= (and mapNonEmpty!50533 ((_ is ValueCellFull!15467) mapValue!50533)) b!1268088))

(assert (= (and b!1268089 ((_ is ValueCellFull!15467) mapDefault!50533)) b!1268092))

(assert (= start!106922 b!1268089))

(declare-fun m!1166601 () Bool)

(assert (=> mapNonEmpty!50533 m!1166601))

(declare-fun m!1166603 () Bool)

(assert (=> start!106922 m!1166603))

(declare-fun m!1166605 () Bool)

(assert (=> start!106922 m!1166605))

(declare-fun m!1166607 () Bool)

(assert (=> start!106922 m!1166607))

(declare-fun m!1166609 () Bool)

(assert (=> b!1268090 m!1166609))

(check-sat (not b!1268090) (not start!106922) (not mapNonEmpty!50533) tp_is_empty!32641)
(check-sat)
(get-model)

(declare-fun b!1268137 () Bool)

(declare-fun e!722579 () Bool)

(declare-fun e!722577 () Bool)

(assert (=> b!1268137 (= e!722579 e!722577)))

(declare-fun c!123610 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1268137 (= c!123610 (validKeyInArray!0 (select (arr!39778 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun d!139537 () Bool)

(declare-fun res!844089 () Bool)

(assert (=> d!139537 (=> res!844089 e!722579)))

(assert (=> d!139537 (= res!844089 (bvsge #b00000000000000000000000000000000 (size!40316 _keys!1364)))))

(assert (=> d!139537 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!722579)))

(declare-fun b!1268138 () Bool)

(declare-fun call!62490 () Bool)

(assert (=> b!1268138 (= e!722577 call!62490)))

(declare-fun b!1268139 () Bool)

(declare-fun e!722578 () Bool)

(assert (=> b!1268139 (= e!722577 e!722578)))

(declare-fun lt!574220 () (_ BitVec 64))

(assert (=> b!1268139 (= lt!574220 (select (arr!39778 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42080 0))(
  ( (Unit!42081) )
))
(declare-fun lt!574222 () Unit!42080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82475 (_ BitVec 64) (_ BitVec 32)) Unit!42080)

(assert (=> b!1268139 (= lt!574222 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574220 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1268139 (arrayContainsKey!0 _keys!1364 lt!574220 #b00000000000000000000000000000000)))

(declare-fun lt!574221 () Unit!42080)

(assert (=> b!1268139 (= lt!574221 lt!574222)))

(declare-fun res!844088 () Bool)

(declare-datatypes ((SeekEntryResult!9983 0))(
  ( (MissingZero!9983 (index!42303 (_ BitVec 32))) (Found!9983 (index!42304 (_ BitVec 32))) (Intermediate!9983 (undefined!10795 Bool) (index!42305 (_ BitVec 32)) (x!111841 (_ BitVec 32))) (Undefined!9983) (MissingVacant!9983 (index!42306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82475 (_ BitVec 32)) SeekEntryResult!9983)

(assert (=> b!1268139 (= res!844088 (= (seekEntryOrOpen!0 (select (arr!39778 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9983 #b00000000000000000000000000000000)))))

(assert (=> b!1268139 (=> (not res!844088) (not e!722578))))

(declare-fun b!1268140 () Bool)

(assert (=> b!1268140 (= e!722578 call!62490)))

(declare-fun bm!62487 () Bool)

(assert (=> bm!62487 (= call!62490 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(assert (= (and d!139537 (not res!844089)) b!1268137))

(assert (= (and b!1268137 c!123610) b!1268139))

(assert (= (and b!1268137 (not c!123610)) b!1268138))

(assert (= (and b!1268139 res!844088) b!1268140))

(assert (= (or b!1268140 b!1268138) bm!62487))

(declare-fun m!1166631 () Bool)

(assert (=> b!1268137 m!1166631))

(assert (=> b!1268137 m!1166631))

(declare-fun m!1166633 () Bool)

(assert (=> b!1268137 m!1166633))

(assert (=> b!1268139 m!1166631))

(declare-fun m!1166635 () Bool)

(assert (=> b!1268139 m!1166635))

(declare-fun m!1166637 () Bool)

(assert (=> b!1268139 m!1166637))

(assert (=> b!1268139 m!1166631))

(declare-fun m!1166639 () Bool)

(assert (=> b!1268139 m!1166639))

(declare-fun m!1166641 () Bool)

(assert (=> bm!62487 m!1166641))

(assert (=> b!1268090 d!139537))

(declare-fun d!139539 () Bool)

(assert (=> d!139539 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106922 d!139539))

(declare-fun d!139541 () Bool)

(assert (=> d!139541 (= (array_inv!30435 _values!1134) (bvsge (size!40317 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106922 d!139541))

(declare-fun d!139543 () Bool)

(assert (=> d!139543 (= (array_inv!30436 _keys!1364) (bvsge (size!40316 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106922 d!139543))

(declare-fun condMapEmpty!50542 () Bool)

(declare-fun mapDefault!50542 () ValueCell!15467)

(assert (=> mapNonEmpty!50533 (= condMapEmpty!50542 (= mapRest!50533 ((as const (Array (_ BitVec 32) ValueCell!15467)) mapDefault!50542)))))

(declare-fun e!722585 () Bool)

(declare-fun mapRes!50542 () Bool)

(assert (=> mapNonEmpty!50533 (= tp!96713 (and e!722585 mapRes!50542))))

(declare-fun b!1268148 () Bool)

(assert (=> b!1268148 (= e!722585 tp_is_empty!32641)))

(declare-fun mapIsEmpty!50542 () Bool)

(assert (=> mapIsEmpty!50542 mapRes!50542))

(declare-fun b!1268147 () Bool)

(declare-fun e!722584 () Bool)

(assert (=> b!1268147 (= e!722584 tp_is_empty!32641)))

(declare-fun mapNonEmpty!50542 () Bool)

(declare-fun tp!96722 () Bool)

(assert (=> mapNonEmpty!50542 (= mapRes!50542 (and tp!96722 e!722584))))

(declare-fun mapValue!50542 () ValueCell!15467)

(declare-fun mapKey!50542 () (_ BitVec 32))

(declare-fun mapRest!50542 () (Array (_ BitVec 32) ValueCell!15467))

(assert (=> mapNonEmpty!50542 (= mapRest!50533 (store mapRest!50542 mapKey!50542 mapValue!50542))))

(assert (= (and mapNonEmpty!50533 condMapEmpty!50542) mapIsEmpty!50542))

(assert (= (and mapNonEmpty!50533 (not condMapEmpty!50542)) mapNonEmpty!50542))

(assert (= (and mapNonEmpty!50542 ((_ is ValueCellFull!15467) mapValue!50542)) b!1268147))

(assert (= (and mapNonEmpty!50533 ((_ is ValueCellFull!15467) mapDefault!50542)) b!1268148))

(declare-fun m!1166643 () Bool)

(assert (=> mapNonEmpty!50542 m!1166643))

(check-sat (not mapNonEmpty!50542) (not bm!62487) tp_is_empty!32641 (not b!1268139) (not b!1268137))
(check-sat)
