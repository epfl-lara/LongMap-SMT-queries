; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106952 () Bool)

(assert start!106952)

(declare-fun b!1268256 () Bool)

(declare-fun e!722665 () Bool)

(declare-datatypes ((List!28463 0))(
  ( (Nil!28460) (Cons!28459 (h!29668 (_ BitVec 64)) (t!41984 List!28463)) )
))
(declare-fun contains!7631 (List!28463 (_ BitVec 64)) Bool)

(assert (=> b!1268256 (= e!722665 (contains!7631 Nil!28460 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1268257 () Bool)

(declare-fun e!722668 () Bool)

(declare-fun tp_is_empty!32653 () Bool)

(assert (=> b!1268257 (= e!722668 tp_is_empty!32653)))

(declare-fun b!1268258 () Bool)

(declare-fun e!722664 () Bool)

(assert (=> b!1268258 (= e!722664 e!722665)))

(declare-fun res!844154 () Bool)

(assert (=> b!1268258 (=> res!844154 e!722665)))

(assert (=> b!1268258 (= res!844154 (contains!7631 Nil!28460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1268259 () Bool)

(declare-fun res!844153 () Bool)

(assert (=> b!1268259 (=> (not res!844153) (not e!722664))))

(declare-datatypes ((array!82499 0))(
  ( (array!82500 (arr!39788 (Array (_ BitVec 32) (_ BitVec 64))) (size!40326 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82499)

(assert (=> b!1268259 (= res!844153 (and (bvsle #b00000000000000000000000000000000 (size!40326 _keys!1364)) (bvslt (size!40326 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun b!1268260 () Bool)

(declare-fun e!722667 () Bool)

(assert (=> b!1268260 (= e!722667 tp_is_empty!32653)))

(declare-fun b!1268261 () Bool)

(declare-fun e!722666 () Bool)

(declare-fun mapRes!50557 () Bool)

(assert (=> b!1268261 (= e!722666 (and e!722667 mapRes!50557))))

(declare-fun condMapEmpty!50557 () Bool)

(declare-datatypes ((V!48731 0))(
  ( (V!48732 (val!16401 Int)) )
))
(declare-datatypes ((ValueCell!15473 0))(
  ( (ValueCellFull!15473 (v!19036 V!48731)) (EmptyCell!15473) )
))
(declare-datatypes ((array!82501 0))(
  ( (array!82502 (arr!39789 (Array (_ BitVec 32) ValueCell!15473)) (size!40327 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82501)

(declare-fun mapDefault!50557 () ValueCell!15473)

(assert (=> b!1268261 (= condMapEmpty!50557 (= (arr!39789 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15473)) mapDefault!50557)))))

(declare-fun res!844152 () Bool)

(assert (=> start!106952 (=> (not res!844152) (not e!722664))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106952 (= res!844152 (validMask!0 mask!1730))))

(assert (=> start!106952 e!722664))

(declare-fun array_inv!30441 (array!82501) Bool)

(assert (=> start!106952 (and (array_inv!30441 _values!1134) e!722666)))

(assert (=> start!106952 true))

(declare-fun array_inv!30442 (array!82499) Bool)

(assert (=> start!106952 (array_inv!30442 _keys!1364)))

(declare-fun b!1268262 () Bool)

(declare-fun res!844150 () Bool)

(assert (=> b!1268262 (=> (not res!844150) (not e!722664))))

(declare-fun noDuplicate!2062 (List!28463) Bool)

(assert (=> b!1268262 (= res!844150 (noDuplicate!2062 Nil!28460))))

(declare-fun mapIsEmpty!50557 () Bool)

(assert (=> mapIsEmpty!50557 mapRes!50557))

(declare-fun b!1268263 () Bool)

(declare-fun res!844151 () Bool)

(assert (=> b!1268263 (=> (not res!844151) (not e!722664))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268263 (= res!844151 (and (= (size!40327 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40326 _keys!1364) (size!40327 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50557 () Bool)

(declare-fun tp!96737 () Bool)

(assert (=> mapNonEmpty!50557 (= mapRes!50557 (and tp!96737 e!722668))))

(declare-fun mapKey!50557 () (_ BitVec 32))

(declare-fun mapRest!50557 () (Array (_ BitVec 32) ValueCell!15473))

(declare-fun mapValue!50557 () ValueCell!15473)

(assert (=> mapNonEmpty!50557 (= (arr!39789 _values!1134) (store mapRest!50557 mapKey!50557 mapValue!50557))))

(declare-fun b!1268264 () Bool)

(declare-fun res!844155 () Bool)

(assert (=> b!1268264 (=> (not res!844155) (not e!722664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82499 (_ BitVec 32)) Bool)

(assert (=> b!1268264 (= res!844155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!106952 res!844152) b!1268263))

(assert (= (and b!1268263 res!844151) b!1268264))

(assert (= (and b!1268264 res!844155) b!1268259))

(assert (= (and b!1268259 res!844153) b!1268262))

(assert (= (and b!1268262 res!844150) b!1268258))

(assert (= (and b!1268258 (not res!844154)) b!1268256))

(assert (= (and b!1268261 condMapEmpty!50557) mapIsEmpty!50557))

(assert (= (and b!1268261 (not condMapEmpty!50557)) mapNonEmpty!50557))

(get-info :version)

(assert (= (and mapNonEmpty!50557 ((_ is ValueCellFull!15473) mapValue!50557)) b!1268257))

(assert (= (and b!1268261 ((_ is ValueCellFull!15473) mapDefault!50557)) b!1268260))

(assert (= start!106952 b!1268261))

(declare-fun m!1166699 () Bool)

(assert (=> mapNonEmpty!50557 m!1166699))

(declare-fun m!1166701 () Bool)

(assert (=> b!1268264 m!1166701))

(declare-fun m!1166703 () Bool)

(assert (=> start!106952 m!1166703))

(declare-fun m!1166705 () Bool)

(assert (=> start!106952 m!1166705))

(declare-fun m!1166707 () Bool)

(assert (=> start!106952 m!1166707))

(declare-fun m!1166709 () Bool)

(assert (=> b!1268258 m!1166709))

(declare-fun m!1166711 () Bool)

(assert (=> b!1268256 m!1166711))

(declare-fun m!1166713 () Bool)

(assert (=> b!1268262 m!1166713))

(check-sat tp_is_empty!32653 (not mapNonEmpty!50557) (not start!106952) (not b!1268262) (not b!1268256) (not b!1268264) (not b!1268258))
(check-sat)
(get-model)

(declare-fun d!139559 () Bool)

(declare-fun res!844196 () Bool)

(declare-fun e!722710 () Bool)

(assert (=> d!139559 (=> res!844196 e!722710)))

(assert (=> d!139559 (= res!844196 ((_ is Nil!28460) Nil!28460))))

(assert (=> d!139559 (= (noDuplicate!2062 Nil!28460) e!722710)))

(declare-fun b!1268323 () Bool)

(declare-fun e!722711 () Bool)

(assert (=> b!1268323 (= e!722710 e!722711)))

(declare-fun res!844197 () Bool)

(assert (=> b!1268323 (=> (not res!844197) (not e!722711))))

(assert (=> b!1268323 (= res!844197 (not (contains!7631 (t!41984 Nil!28460) (h!29668 Nil!28460))))))

(declare-fun b!1268324 () Bool)

(assert (=> b!1268324 (= e!722711 (noDuplicate!2062 (t!41984 Nil!28460)))))

(assert (= (and d!139559 (not res!844196)) b!1268323))

(assert (= (and b!1268323 res!844197) b!1268324))

(declare-fun m!1166747 () Bool)

(assert (=> b!1268323 m!1166747))

(declare-fun m!1166749 () Bool)

(assert (=> b!1268324 m!1166749))

(assert (=> b!1268262 d!139559))

(declare-fun d!139561 () Bool)

(declare-fun lt!574234 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!637 (List!28463) (InoxSet (_ BitVec 64)))

(assert (=> d!139561 (= lt!574234 (select (content!637 Nil!28460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!722717 () Bool)

(assert (=> d!139561 (= lt!574234 e!722717)))

(declare-fun res!844202 () Bool)

(assert (=> d!139561 (=> (not res!844202) (not e!722717))))

(assert (=> d!139561 (= res!844202 ((_ is Cons!28459) Nil!28460))))

(assert (=> d!139561 (= (contains!7631 Nil!28460 #b0000000000000000000000000000000000000000000000000000000000000000) lt!574234)))

(declare-fun b!1268329 () Bool)

(declare-fun e!722716 () Bool)

(assert (=> b!1268329 (= e!722717 e!722716)))

(declare-fun res!844203 () Bool)

(assert (=> b!1268329 (=> res!844203 e!722716)))

(assert (=> b!1268329 (= res!844203 (= (h!29668 Nil!28460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1268330 () Bool)

(assert (=> b!1268330 (= e!722716 (contains!7631 (t!41984 Nil!28460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!139561 res!844202) b!1268329))

(assert (= (and b!1268329 (not res!844203)) b!1268330))

(declare-fun m!1166751 () Bool)

(assert (=> d!139561 m!1166751))

(declare-fun m!1166753 () Bool)

(assert (=> d!139561 m!1166753))

(declare-fun m!1166755 () Bool)

(assert (=> b!1268330 m!1166755))

(assert (=> b!1268258 d!139561))

(declare-fun d!139563 () Bool)

(assert (=> d!139563 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106952 d!139563))

(declare-fun d!139565 () Bool)

(assert (=> d!139565 (= (array_inv!30441 _values!1134) (bvsge (size!40327 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106952 d!139565))

(declare-fun d!139567 () Bool)

(assert (=> d!139567 (= (array_inv!30442 _keys!1364) (bvsge (size!40326 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106952 d!139567))

(declare-fun d!139569 () Bool)

(declare-fun lt!574235 () Bool)

(assert (=> d!139569 (= lt!574235 (select (content!637 Nil!28460) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!722719 () Bool)

(assert (=> d!139569 (= lt!574235 e!722719)))

(declare-fun res!844204 () Bool)

(assert (=> d!139569 (=> (not res!844204) (not e!722719))))

(assert (=> d!139569 (= res!844204 ((_ is Cons!28459) Nil!28460))))

(assert (=> d!139569 (= (contains!7631 Nil!28460 #b1000000000000000000000000000000000000000000000000000000000000000) lt!574235)))

(declare-fun b!1268331 () Bool)

(declare-fun e!722718 () Bool)

(assert (=> b!1268331 (= e!722719 e!722718)))

(declare-fun res!844205 () Bool)

(assert (=> b!1268331 (=> res!844205 e!722718)))

(assert (=> b!1268331 (= res!844205 (= (h!29668 Nil!28460) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1268332 () Bool)

(assert (=> b!1268332 (= e!722718 (contains!7631 (t!41984 Nil!28460) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!139569 res!844204) b!1268331))

(assert (= (and b!1268331 (not res!844205)) b!1268332))

(assert (=> d!139569 m!1166751))

(declare-fun m!1166757 () Bool)

(assert (=> d!139569 m!1166757))

(declare-fun m!1166759 () Bool)

(assert (=> b!1268332 m!1166759))

(assert (=> b!1268256 d!139569))

(declare-fun b!1268341 () Bool)

(declare-fun e!722726 () Bool)

(declare-fun e!722727 () Bool)

(assert (=> b!1268341 (= e!722726 e!722727)))

(declare-fun c!123616 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1268341 (= c!123616 (validKeyInArray!0 (select (arr!39788 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun bm!62493 () Bool)

(declare-fun call!62496 () Bool)

(assert (=> bm!62493 (= call!62496 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1268342 () Bool)

(assert (=> b!1268342 (= e!722727 call!62496)))

(declare-fun d!139571 () Bool)

(declare-fun res!844210 () Bool)

(assert (=> d!139571 (=> res!844210 e!722726)))

(assert (=> d!139571 (= res!844210 (bvsge #b00000000000000000000000000000000 (size!40326 _keys!1364)))))

(assert (=> d!139571 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!722726)))

(declare-fun b!1268343 () Bool)

(declare-fun e!722728 () Bool)

(assert (=> b!1268343 (= e!722728 call!62496)))

(declare-fun b!1268344 () Bool)

(assert (=> b!1268344 (= e!722727 e!722728)))

(declare-fun lt!574244 () (_ BitVec 64))

(assert (=> b!1268344 (= lt!574244 (select (arr!39788 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42084 0))(
  ( (Unit!42085) )
))
(declare-fun lt!574242 () Unit!42084)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82499 (_ BitVec 64) (_ BitVec 32)) Unit!42084)

(assert (=> b!1268344 (= lt!574242 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574244 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1268344 (arrayContainsKey!0 _keys!1364 lt!574244 #b00000000000000000000000000000000)))

(declare-fun lt!574243 () Unit!42084)

(assert (=> b!1268344 (= lt!574243 lt!574242)))

(declare-fun res!844211 () Bool)

(declare-datatypes ((SeekEntryResult!9985 0))(
  ( (MissingZero!9985 (index!42311 (_ BitVec 32))) (Found!9985 (index!42312 (_ BitVec 32))) (Intermediate!9985 (undefined!10797 Bool) (index!42313 (_ BitVec 32)) (x!111863 (_ BitVec 32))) (Undefined!9985) (MissingVacant!9985 (index!42314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82499 (_ BitVec 32)) SeekEntryResult!9985)

(assert (=> b!1268344 (= res!844211 (= (seekEntryOrOpen!0 (select (arr!39788 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9985 #b00000000000000000000000000000000)))))

(assert (=> b!1268344 (=> (not res!844211) (not e!722728))))

(assert (= (and d!139571 (not res!844210)) b!1268341))

(assert (= (and b!1268341 c!123616) b!1268344))

(assert (= (and b!1268341 (not c!123616)) b!1268342))

(assert (= (and b!1268344 res!844211) b!1268343))

(assert (= (or b!1268343 b!1268342) bm!62493))

(declare-fun m!1166761 () Bool)

(assert (=> b!1268341 m!1166761))

(assert (=> b!1268341 m!1166761))

(declare-fun m!1166763 () Bool)

(assert (=> b!1268341 m!1166763))

(declare-fun m!1166765 () Bool)

(assert (=> bm!62493 m!1166765))

(assert (=> b!1268344 m!1166761))

(declare-fun m!1166767 () Bool)

(assert (=> b!1268344 m!1166767))

(declare-fun m!1166769 () Bool)

(assert (=> b!1268344 m!1166769))

(assert (=> b!1268344 m!1166761))

(declare-fun m!1166771 () Bool)

(assert (=> b!1268344 m!1166771))

(assert (=> b!1268264 d!139571))

(declare-fun mapNonEmpty!50566 () Bool)

(declare-fun mapRes!50566 () Bool)

(declare-fun tp!96746 () Bool)

(declare-fun e!722733 () Bool)

(assert (=> mapNonEmpty!50566 (= mapRes!50566 (and tp!96746 e!722733))))

(declare-fun mapValue!50566 () ValueCell!15473)

(declare-fun mapKey!50566 () (_ BitVec 32))

(declare-fun mapRest!50566 () (Array (_ BitVec 32) ValueCell!15473))

(assert (=> mapNonEmpty!50566 (= mapRest!50557 (store mapRest!50566 mapKey!50566 mapValue!50566))))

(declare-fun mapIsEmpty!50566 () Bool)

(assert (=> mapIsEmpty!50566 mapRes!50566))

(declare-fun condMapEmpty!50566 () Bool)

(declare-fun mapDefault!50566 () ValueCell!15473)

(assert (=> mapNonEmpty!50557 (= condMapEmpty!50566 (= mapRest!50557 ((as const (Array (_ BitVec 32) ValueCell!15473)) mapDefault!50566)))))

(declare-fun e!722734 () Bool)

(assert (=> mapNonEmpty!50557 (= tp!96737 (and e!722734 mapRes!50566))))

(declare-fun b!1268352 () Bool)

(assert (=> b!1268352 (= e!722734 tp_is_empty!32653)))

(declare-fun b!1268351 () Bool)

(assert (=> b!1268351 (= e!722733 tp_is_empty!32653)))

(assert (= (and mapNonEmpty!50557 condMapEmpty!50566) mapIsEmpty!50566))

(assert (= (and mapNonEmpty!50557 (not condMapEmpty!50566)) mapNonEmpty!50566))

(assert (= (and mapNonEmpty!50566 ((_ is ValueCellFull!15473) mapValue!50566)) b!1268351))

(assert (= (and mapNonEmpty!50557 ((_ is ValueCellFull!15473) mapDefault!50566)) b!1268352))

(declare-fun m!1166773 () Bool)

(assert (=> mapNonEmpty!50566 m!1166773))

(check-sat (not b!1268344) (not d!139569) tp_is_empty!32653 (not d!139561) (not b!1268330) (not b!1268324) (not bm!62493) (not b!1268341) (not b!1268323) (not b!1268332) (not mapNonEmpty!50566))
(check-sat)
