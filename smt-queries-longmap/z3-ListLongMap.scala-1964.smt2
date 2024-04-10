; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34532 () Bool)

(assert start!34532)

(declare-fun b_free!7455 () Bool)

(declare-fun b_next!7455 () Bool)

(assert (=> start!34532 (= b_free!7455 (not b_next!7455))))

(declare-fun tp!25911 () Bool)

(declare-fun b_and!14663 () Bool)

(assert (=> start!34532 (= tp!25911 b_and!14663)))

(declare-fun b!345190 () Bool)

(declare-fun e!211568 () Bool)

(declare-fun tp_is_empty!7407 () Bool)

(assert (=> b!345190 (= e!211568 tp_is_empty!7407)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun e!211567 () Bool)

(declare-fun b!345191 () Bool)

(declare-datatypes ((SeekEntryResult!3359 0))(
  ( (MissingZero!3359 (index!15615 (_ BitVec 32))) (Found!3359 (index!15616 (_ BitVec 32))) (Intermediate!3359 (undefined!4171 Bool) (index!15617 (_ BitVec 32)) (x!34393 (_ BitVec 32))) (Undefined!3359) (MissingVacant!3359 (index!15618 (_ BitVec 32))) )
))
(declare-fun lt!162757 () SeekEntryResult!3359)

(declare-datatypes ((array!18397 0))(
  ( (array!18398 (arr!8715 (Array (_ BitVec 32) (_ BitVec 64))) (size!9067 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18397)

(get-info :version)

(assert (=> b!345191 (= e!211567 (and ((_ is Found!3359) lt!162757) (not (= (select (arr!8715 _keys!1895) (index!15616 lt!162757)) k0!1348))))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18397 (_ BitVec 32)) SeekEntryResult!3359)

(assert (=> b!345191 (= lt!162757 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345192 () Bool)

(declare-fun e!211565 () Bool)

(assert (=> b!345192 (= e!211565 tp_is_empty!7407)))

(declare-fun b!345193 () Bool)

(declare-fun res!190989 () Bool)

(assert (=> b!345193 (=> (not res!190989) (not e!211567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18397 (_ BitVec 32)) Bool)

(assert (=> b!345193 (= res!190989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345194 () Bool)

(declare-fun res!190988 () Bool)

(assert (=> b!345194 (=> (not res!190988) (not e!211567))))

(declare-datatypes ((V!10853 0))(
  ( (V!10854 (val!3748 Int)) )
))
(declare-fun zeroValue!1467 () V!10853)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3360 0))(
  ( (ValueCellFull!3360 (v!5924 V!10853)) (EmptyCell!3360) )
))
(declare-datatypes ((array!18399 0))(
  ( (array!18400 (arr!8716 (Array (_ BitVec 32) ValueCell!3360)) (size!9068 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18399)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10853)

(declare-datatypes ((tuple2!5416 0))(
  ( (tuple2!5417 (_1!2719 (_ BitVec 64)) (_2!2719 V!10853)) )
))
(declare-datatypes ((List!5040 0))(
  ( (Nil!5037) (Cons!5036 (h!5892 tuple2!5416) (t!10156 List!5040)) )
))
(declare-datatypes ((ListLongMap!4329 0))(
  ( (ListLongMap!4330 (toList!2180 List!5040)) )
))
(declare-fun contains!2238 (ListLongMap!4329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1701 (array!18397 array!18399 (_ BitVec 32) (_ BitVec 32) V!10853 V!10853 (_ BitVec 32) Int) ListLongMap!4329)

(assert (=> b!345194 (= res!190988 (not (contains!2238 (getCurrentListMap!1701 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345195 () Bool)

(declare-fun res!190991 () Bool)

(assert (=> b!345195 (=> (not res!190991) (not e!211567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345195 (= res!190991 (validKeyInArray!0 k0!1348))))

(declare-fun b!345196 () Bool)

(declare-fun e!211569 () Bool)

(declare-fun mapRes!12549 () Bool)

(assert (=> b!345196 (= e!211569 (and e!211568 mapRes!12549))))

(declare-fun condMapEmpty!12549 () Bool)

(declare-fun mapDefault!12549 () ValueCell!3360)

(assert (=> b!345196 (= condMapEmpty!12549 (= (arr!8716 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3360)) mapDefault!12549)))))

(declare-fun mapIsEmpty!12549 () Bool)

(assert (=> mapIsEmpty!12549 mapRes!12549))

(declare-fun res!190987 () Bool)

(assert (=> start!34532 (=> (not res!190987) (not e!211567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34532 (= res!190987 (validMask!0 mask!2385))))

(assert (=> start!34532 e!211567))

(assert (=> start!34532 true))

(assert (=> start!34532 tp_is_empty!7407))

(assert (=> start!34532 tp!25911))

(declare-fun array_inv!6448 (array!18399) Bool)

(assert (=> start!34532 (and (array_inv!6448 _values!1525) e!211569)))

(declare-fun array_inv!6449 (array!18397) Bool)

(assert (=> start!34532 (array_inv!6449 _keys!1895)))

(declare-fun mapNonEmpty!12549 () Bool)

(declare-fun tp!25910 () Bool)

(assert (=> mapNonEmpty!12549 (= mapRes!12549 (and tp!25910 e!211565))))

(declare-fun mapRest!12549 () (Array (_ BitVec 32) ValueCell!3360))

(declare-fun mapKey!12549 () (_ BitVec 32))

(declare-fun mapValue!12549 () ValueCell!3360)

(assert (=> mapNonEmpty!12549 (= (arr!8716 _values!1525) (store mapRest!12549 mapKey!12549 mapValue!12549))))

(declare-fun b!345197 () Bool)

(declare-fun res!190990 () Bool)

(assert (=> b!345197 (=> (not res!190990) (not e!211567))))

(assert (=> b!345197 (= res!190990 (and (= (size!9068 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9067 _keys!1895) (size!9068 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345198 () Bool)

(declare-fun res!190986 () Bool)

(assert (=> b!345198 (=> (not res!190986) (not e!211567))))

(declare-datatypes ((List!5041 0))(
  ( (Nil!5038) (Cons!5037 (h!5893 (_ BitVec 64)) (t!10157 List!5041)) )
))
(declare-fun arrayNoDuplicates!0 (array!18397 (_ BitVec 32) List!5041) Bool)

(assert (=> b!345198 (= res!190986 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5038))))

(assert (= (and start!34532 res!190987) b!345197))

(assert (= (and b!345197 res!190990) b!345193))

(assert (= (and b!345193 res!190989) b!345198))

(assert (= (and b!345198 res!190986) b!345195))

(assert (= (and b!345195 res!190991) b!345194))

(assert (= (and b!345194 res!190988) b!345191))

(assert (= (and b!345196 condMapEmpty!12549) mapIsEmpty!12549))

(assert (= (and b!345196 (not condMapEmpty!12549)) mapNonEmpty!12549))

(assert (= (and mapNonEmpty!12549 ((_ is ValueCellFull!3360) mapValue!12549)) b!345192))

(assert (= (and b!345196 ((_ is ValueCellFull!3360) mapDefault!12549)) b!345190))

(assert (= start!34532 b!345196))

(declare-fun m!346619 () Bool)

(assert (=> b!345191 m!346619))

(declare-fun m!346621 () Bool)

(assert (=> b!345191 m!346621))

(declare-fun m!346623 () Bool)

(assert (=> mapNonEmpty!12549 m!346623))

(declare-fun m!346625 () Bool)

(assert (=> b!345194 m!346625))

(assert (=> b!345194 m!346625))

(declare-fun m!346627 () Bool)

(assert (=> b!345194 m!346627))

(declare-fun m!346629 () Bool)

(assert (=> b!345195 m!346629))

(declare-fun m!346631 () Bool)

(assert (=> b!345193 m!346631))

(declare-fun m!346633 () Bool)

(assert (=> start!34532 m!346633))

(declare-fun m!346635 () Bool)

(assert (=> start!34532 m!346635))

(declare-fun m!346637 () Bool)

(assert (=> start!34532 m!346637))

(declare-fun m!346639 () Bool)

(assert (=> b!345198 m!346639))

(check-sat (not b!345198) (not b_next!7455) tp_is_empty!7407 (not start!34532) (not b!345195) (not mapNonEmpty!12549) (not b!345193) b_and!14663 (not b!345194) (not b!345191))
(check-sat b_and!14663 (not b_next!7455))
(get-model)

(declare-fun b!345238 () Bool)

(declare-fun e!211593 () SeekEntryResult!3359)

(assert (=> b!345238 (= e!211593 Undefined!3359)))

(declare-fun b!345239 () Bool)

(declare-fun e!211591 () SeekEntryResult!3359)

(declare-fun lt!162768 () SeekEntryResult!3359)

(assert (=> b!345239 (= e!211591 (MissingZero!3359 (index!15617 lt!162768)))))

(declare-fun b!345240 () Bool)

(declare-fun e!211592 () SeekEntryResult!3359)

(assert (=> b!345240 (= e!211593 e!211592)))

(declare-fun lt!162769 () (_ BitVec 64))

(assert (=> b!345240 (= lt!162769 (select (arr!8715 _keys!1895) (index!15617 lt!162768)))))

(declare-fun c!52964 () Bool)

(assert (=> b!345240 (= c!52964 (= lt!162769 k0!1348))))

(declare-fun d!71119 () Bool)

(declare-fun lt!162767 () SeekEntryResult!3359)

(assert (=> d!71119 (and (or ((_ is Undefined!3359) lt!162767) (not ((_ is Found!3359) lt!162767)) (and (bvsge (index!15616 lt!162767) #b00000000000000000000000000000000) (bvslt (index!15616 lt!162767) (size!9067 _keys!1895)))) (or ((_ is Undefined!3359) lt!162767) ((_ is Found!3359) lt!162767) (not ((_ is MissingZero!3359) lt!162767)) (and (bvsge (index!15615 lt!162767) #b00000000000000000000000000000000) (bvslt (index!15615 lt!162767) (size!9067 _keys!1895)))) (or ((_ is Undefined!3359) lt!162767) ((_ is Found!3359) lt!162767) ((_ is MissingZero!3359) lt!162767) (not ((_ is MissingVacant!3359) lt!162767)) (and (bvsge (index!15618 lt!162767) #b00000000000000000000000000000000) (bvslt (index!15618 lt!162767) (size!9067 _keys!1895)))) (or ((_ is Undefined!3359) lt!162767) (ite ((_ is Found!3359) lt!162767) (= (select (arr!8715 _keys!1895) (index!15616 lt!162767)) k0!1348) (ite ((_ is MissingZero!3359) lt!162767) (= (select (arr!8715 _keys!1895) (index!15615 lt!162767)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3359) lt!162767) (= (select (arr!8715 _keys!1895) (index!15618 lt!162767)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71119 (= lt!162767 e!211593)))

(declare-fun c!52963 () Bool)

(assert (=> d!71119 (= c!52963 (and ((_ is Intermediate!3359) lt!162768) (undefined!4171 lt!162768)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18397 (_ BitVec 32)) SeekEntryResult!3359)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71119 (= lt!162768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71119 (validMask!0 mask!2385)))

(assert (=> d!71119 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162767)))

(declare-fun b!345241 () Bool)

(assert (=> b!345241 (= e!211592 (Found!3359 (index!15617 lt!162768)))))

(declare-fun b!345242 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18397 (_ BitVec 32)) SeekEntryResult!3359)

(assert (=> b!345242 (= e!211591 (seekKeyOrZeroReturnVacant!0 (x!34393 lt!162768) (index!15617 lt!162768) (index!15617 lt!162768) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345243 () Bool)

(declare-fun c!52965 () Bool)

(assert (=> b!345243 (= c!52965 (= lt!162769 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!345243 (= e!211592 e!211591)))

(assert (= (and d!71119 c!52963) b!345238))

(assert (= (and d!71119 (not c!52963)) b!345240))

(assert (= (and b!345240 c!52964) b!345241))

(assert (= (and b!345240 (not c!52964)) b!345243))

(assert (= (and b!345243 c!52965) b!345239))

(assert (= (and b!345243 (not c!52965)) b!345242))

(declare-fun m!346663 () Bool)

(assert (=> b!345240 m!346663))

(declare-fun m!346665 () Bool)

(assert (=> d!71119 m!346665))

(declare-fun m!346667 () Bool)

(assert (=> d!71119 m!346667))

(assert (=> d!71119 m!346633))

(declare-fun m!346669 () Bool)

(assert (=> d!71119 m!346669))

(assert (=> d!71119 m!346667))

(declare-fun m!346671 () Bool)

(assert (=> d!71119 m!346671))

(declare-fun m!346673 () Bool)

(assert (=> d!71119 m!346673))

(declare-fun m!346675 () Bool)

(assert (=> b!345242 m!346675))

(assert (=> b!345191 d!71119))

(declare-fun d!71121 () Bool)

(assert (=> d!71121 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34532 d!71121))

(declare-fun d!71123 () Bool)

(assert (=> d!71123 (= (array_inv!6448 _values!1525) (bvsge (size!9068 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34532 d!71123))

(declare-fun d!71125 () Bool)

(assert (=> d!71125 (= (array_inv!6449 _keys!1895) (bvsge (size!9067 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34532 d!71125))

(declare-fun d!71127 () Bool)

(declare-fun e!211599 () Bool)

(assert (=> d!71127 e!211599))

(declare-fun res!191012 () Bool)

(assert (=> d!71127 (=> res!191012 e!211599)))

(declare-fun lt!162779 () Bool)

(assert (=> d!71127 (= res!191012 (not lt!162779))))

(declare-fun lt!162778 () Bool)

(assert (=> d!71127 (= lt!162779 lt!162778)))

(declare-datatypes ((Unit!10729 0))(
  ( (Unit!10730) )
))
(declare-fun lt!162780 () Unit!10729)

(declare-fun e!211598 () Unit!10729)

(assert (=> d!71127 (= lt!162780 e!211598)))

(declare-fun c!52968 () Bool)

(assert (=> d!71127 (= c!52968 lt!162778)))

(declare-fun containsKey!330 (List!5040 (_ BitVec 64)) Bool)

(assert (=> d!71127 (= lt!162778 (containsKey!330 (toList!2180 (getCurrentListMap!1701 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71127 (= (contains!2238 (getCurrentListMap!1701 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162779)))

(declare-fun b!345250 () Bool)

(declare-fun lt!162781 () Unit!10729)

(assert (=> b!345250 (= e!211598 lt!162781)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!278 (List!5040 (_ BitVec 64)) Unit!10729)

(assert (=> b!345250 (= lt!162781 (lemmaContainsKeyImpliesGetValueByKeyDefined!278 (toList!2180 (getCurrentListMap!1701 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!344 0))(
  ( (Some!343 (v!5926 V!10853)) (None!342) )
))
(declare-fun isDefined!279 (Option!344) Bool)

(declare-fun getValueByKey!338 (List!5040 (_ BitVec 64)) Option!344)

(assert (=> b!345250 (isDefined!279 (getValueByKey!338 (toList!2180 (getCurrentListMap!1701 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345251 () Bool)

(declare-fun Unit!10731 () Unit!10729)

(assert (=> b!345251 (= e!211598 Unit!10731)))

(declare-fun b!345252 () Bool)

(assert (=> b!345252 (= e!211599 (isDefined!279 (getValueByKey!338 (toList!2180 (getCurrentListMap!1701 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71127 c!52968) b!345250))

(assert (= (and d!71127 (not c!52968)) b!345251))

(assert (= (and d!71127 (not res!191012)) b!345252))

(declare-fun m!346677 () Bool)

(assert (=> d!71127 m!346677))

(declare-fun m!346679 () Bool)

(assert (=> b!345250 m!346679))

(declare-fun m!346681 () Bool)

(assert (=> b!345250 m!346681))

(assert (=> b!345250 m!346681))

(declare-fun m!346683 () Bool)

(assert (=> b!345250 m!346683))

(assert (=> b!345252 m!346681))

(assert (=> b!345252 m!346681))

(assert (=> b!345252 m!346683))

(assert (=> b!345194 d!71127))

(declare-fun b!345295 () Bool)

(declare-fun e!211630 () Bool)

(assert (=> b!345295 (= e!211630 (validKeyInArray!0 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345296 () Bool)

(declare-fun e!211629 () ListLongMap!4329)

(declare-fun e!211635 () ListLongMap!4329)

(assert (=> b!345296 (= e!211629 e!211635)))

(declare-fun c!52985 () Bool)

(assert (=> b!345296 (= c!52985 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345297 () Bool)

(declare-fun e!211631 () Bool)

(declare-fun e!211626 () Bool)

(assert (=> b!345297 (= e!211631 e!211626)))

(declare-fun c!52982 () Bool)

(assert (=> b!345297 (= c!52982 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345298 () Bool)

(declare-fun c!52984 () Bool)

(assert (=> b!345298 (= c!52984 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!211638 () ListLongMap!4329)

(assert (=> b!345298 (= e!211635 e!211638)))

(declare-fun bm!26686 () Bool)

(declare-fun call!26691 () ListLongMap!4329)

(declare-fun call!26695 () ListLongMap!4329)

(assert (=> bm!26686 (= call!26691 call!26695)))

(declare-fun b!345299 () Bool)

(declare-fun e!211632 () Bool)

(declare-fun e!211633 () Bool)

(assert (=> b!345299 (= e!211632 e!211633)))

(declare-fun res!191034 () Bool)

(declare-fun call!26692 () Bool)

(assert (=> b!345299 (= res!191034 call!26692)))

(assert (=> b!345299 (=> (not res!191034) (not e!211633))))

(declare-fun bm!26687 () Bool)

(declare-fun call!26690 () ListLongMap!4329)

(declare-fun getCurrentListMapNoExtraKeys!602 (array!18397 array!18399 (_ BitVec 32) (_ BitVec 32) V!10853 V!10853 (_ BitVec 32) Int) ListLongMap!4329)

(assert (=> bm!26687 (= call!26690 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345300 () Bool)

(assert (=> b!345300 (= e!211632 (not call!26692))))

(declare-fun b!345301 () Bool)

(declare-fun call!26689 () Bool)

(assert (=> b!345301 (= e!211626 (not call!26689))))

(declare-fun b!345302 () Bool)

(declare-fun e!211627 () Bool)

(assert (=> b!345302 (= e!211626 e!211627)))

(declare-fun res!191036 () Bool)

(assert (=> b!345302 (= res!191036 call!26689)))

(assert (=> b!345302 (=> (not res!191036) (not e!211627))))

(declare-fun b!345303 () Bool)

(declare-fun e!211628 () Bool)

(declare-fun lt!162829 () ListLongMap!4329)

(declare-fun apply!280 (ListLongMap!4329 (_ BitVec 64)) V!10853)

(declare-fun get!4694 (ValueCell!3360 V!10853) V!10853)

(declare-fun dynLambda!623 (Int (_ BitVec 64)) V!10853)

(assert (=> b!345303 (= e!211628 (= (apply!280 lt!162829 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000)) (get!4694 (select (arr!8716 _values!1525) #b00000000000000000000000000000000) (dynLambda!623 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9068 _values!1525)))))

(assert (=> b!345303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9067 _keys!1895)))))

(declare-fun b!345304 () Bool)

(declare-fun e!211637 () Bool)

(assert (=> b!345304 (= e!211637 e!211628)))

(declare-fun res!191032 () Bool)

(assert (=> b!345304 (=> (not res!191032) (not e!211628))))

(assert (=> b!345304 (= res!191032 (contains!2238 lt!162829 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9067 _keys!1895)))))

(declare-fun b!345305 () Bool)

(declare-fun e!211636 () Unit!10729)

(declare-fun Unit!10732 () Unit!10729)

(assert (=> b!345305 (= e!211636 Unit!10732)))

(declare-fun bm!26688 () Bool)

(assert (=> bm!26688 (= call!26689 (contains!2238 lt!162829 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345306 () Bool)

(declare-fun e!211634 () Bool)

(assert (=> b!345306 (= e!211634 (validKeyInArray!0 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345307 () Bool)

(declare-fun res!191035 () Bool)

(assert (=> b!345307 (=> (not res!191035) (not e!211631))))

(assert (=> b!345307 (= res!191035 e!211637)))

(declare-fun res!191037 () Bool)

(assert (=> b!345307 (=> res!191037 e!211637)))

(assert (=> b!345307 (= res!191037 (not e!211634))))

(declare-fun res!191031 () Bool)

(assert (=> b!345307 (=> (not res!191031) (not e!211634))))

(assert (=> b!345307 (= res!191031 (bvslt #b00000000000000000000000000000000 (size!9067 _keys!1895)))))

(declare-fun b!345308 () Bool)

(declare-fun call!26694 () ListLongMap!4329)

(assert (=> b!345308 (= e!211638 call!26694)))

(declare-fun bm!26689 () Bool)

(assert (=> bm!26689 (= call!26695 call!26690)))

(declare-fun b!345309 () Bool)

(assert (=> b!345309 (= e!211627 (= (apply!280 lt!162829 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26690 () Bool)

(assert (=> bm!26690 (= call!26692 (contains!2238 lt!162829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345310 () Bool)

(declare-fun call!26693 () ListLongMap!4329)

(declare-fun +!729 (ListLongMap!4329 tuple2!5416) ListLongMap!4329)

(assert (=> b!345310 (= e!211629 (+!729 call!26693 (tuple2!5417 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun c!52983 () Bool)

(declare-fun bm!26691 () Bool)

(assert (=> bm!26691 (= call!26693 (+!729 (ite c!52983 call!26690 (ite c!52985 call!26695 call!26691)) (ite (or c!52983 c!52985) (tuple2!5417 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5417 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!345311 () Bool)

(declare-fun lt!162843 () Unit!10729)

(assert (=> b!345311 (= e!211636 lt!162843)))

(declare-fun lt!162834 () ListLongMap!4329)

(assert (=> b!345311 (= lt!162834 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162840 () (_ BitVec 64))

(assert (=> b!345311 (= lt!162840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162831 () (_ BitVec 64))

(assert (=> b!345311 (= lt!162831 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162847 () Unit!10729)

(declare-fun addStillContains!256 (ListLongMap!4329 (_ BitVec 64) V!10853 (_ BitVec 64)) Unit!10729)

(assert (=> b!345311 (= lt!162847 (addStillContains!256 lt!162834 lt!162840 zeroValue!1467 lt!162831))))

(assert (=> b!345311 (contains!2238 (+!729 lt!162834 (tuple2!5417 lt!162840 zeroValue!1467)) lt!162831)))

(declare-fun lt!162844 () Unit!10729)

(assert (=> b!345311 (= lt!162844 lt!162847)))

(declare-fun lt!162841 () ListLongMap!4329)

(assert (=> b!345311 (= lt!162841 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162835 () (_ BitVec 64))

(assert (=> b!345311 (= lt!162835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162845 () (_ BitVec 64))

(assert (=> b!345311 (= lt!162845 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162833 () Unit!10729)

(declare-fun addApplyDifferent!256 (ListLongMap!4329 (_ BitVec 64) V!10853 (_ BitVec 64)) Unit!10729)

(assert (=> b!345311 (= lt!162833 (addApplyDifferent!256 lt!162841 lt!162835 minValue!1467 lt!162845))))

(assert (=> b!345311 (= (apply!280 (+!729 lt!162841 (tuple2!5417 lt!162835 minValue!1467)) lt!162845) (apply!280 lt!162841 lt!162845))))

(declare-fun lt!162836 () Unit!10729)

(assert (=> b!345311 (= lt!162836 lt!162833)))

(declare-fun lt!162828 () ListLongMap!4329)

(assert (=> b!345311 (= lt!162828 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162830 () (_ BitVec 64))

(assert (=> b!345311 (= lt!162830 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162839 () (_ BitVec 64))

(assert (=> b!345311 (= lt!162839 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162846 () Unit!10729)

(assert (=> b!345311 (= lt!162846 (addApplyDifferent!256 lt!162828 lt!162830 zeroValue!1467 lt!162839))))

(assert (=> b!345311 (= (apply!280 (+!729 lt!162828 (tuple2!5417 lt!162830 zeroValue!1467)) lt!162839) (apply!280 lt!162828 lt!162839))))

(declare-fun lt!162827 () Unit!10729)

(assert (=> b!345311 (= lt!162827 lt!162846)))

(declare-fun lt!162832 () ListLongMap!4329)

(assert (=> b!345311 (= lt!162832 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162842 () (_ BitVec 64))

(assert (=> b!345311 (= lt!162842 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162838 () (_ BitVec 64))

(assert (=> b!345311 (= lt!162838 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345311 (= lt!162843 (addApplyDifferent!256 lt!162832 lt!162842 minValue!1467 lt!162838))))

(assert (=> b!345311 (= (apply!280 (+!729 lt!162832 (tuple2!5417 lt!162842 minValue!1467)) lt!162838) (apply!280 lt!162832 lt!162838))))

(declare-fun b!345312 () Bool)

(assert (=> b!345312 (= e!211638 call!26691)))

(declare-fun b!345313 () Bool)

(assert (=> b!345313 (= e!211633 (= (apply!280 lt!162829 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!345314 () Bool)

(assert (=> b!345314 (= e!211635 call!26694)))

(declare-fun bm!26692 () Bool)

(assert (=> bm!26692 (= call!26694 call!26693)))

(declare-fun d!71129 () Bool)

(assert (=> d!71129 e!211631))

(declare-fun res!191038 () Bool)

(assert (=> d!71129 (=> (not res!191038) (not e!211631))))

(assert (=> d!71129 (= res!191038 (or (bvsge #b00000000000000000000000000000000 (size!9067 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9067 _keys!1895)))))))

(declare-fun lt!162837 () ListLongMap!4329)

(assert (=> d!71129 (= lt!162829 lt!162837)))

(declare-fun lt!162826 () Unit!10729)

(assert (=> d!71129 (= lt!162826 e!211636)))

(declare-fun c!52981 () Bool)

(assert (=> d!71129 (= c!52981 e!211630)))

(declare-fun res!191039 () Bool)

(assert (=> d!71129 (=> (not res!191039) (not e!211630))))

(assert (=> d!71129 (= res!191039 (bvslt #b00000000000000000000000000000000 (size!9067 _keys!1895)))))

(assert (=> d!71129 (= lt!162837 e!211629)))

(assert (=> d!71129 (= c!52983 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71129 (validMask!0 mask!2385)))

(assert (=> d!71129 (= (getCurrentListMap!1701 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162829)))

(declare-fun b!345315 () Bool)

(declare-fun res!191033 () Bool)

(assert (=> b!345315 (=> (not res!191033) (not e!211631))))

(assert (=> b!345315 (= res!191033 e!211632)))

(declare-fun c!52986 () Bool)

(assert (=> b!345315 (= c!52986 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!71129 c!52983) b!345310))

(assert (= (and d!71129 (not c!52983)) b!345296))

(assert (= (and b!345296 c!52985) b!345314))

(assert (= (and b!345296 (not c!52985)) b!345298))

(assert (= (and b!345298 c!52984) b!345308))

(assert (= (and b!345298 (not c!52984)) b!345312))

(assert (= (or b!345308 b!345312) bm!26686))

(assert (= (or b!345314 bm!26686) bm!26689))

(assert (= (or b!345314 b!345308) bm!26692))

(assert (= (or b!345310 bm!26689) bm!26687))

(assert (= (or b!345310 bm!26692) bm!26691))

(assert (= (and d!71129 res!191039) b!345295))

(assert (= (and d!71129 c!52981) b!345311))

(assert (= (and d!71129 (not c!52981)) b!345305))

(assert (= (and d!71129 res!191038) b!345307))

(assert (= (and b!345307 res!191031) b!345306))

(assert (= (and b!345307 (not res!191037)) b!345304))

(assert (= (and b!345304 res!191032) b!345303))

(assert (= (and b!345307 res!191035) b!345315))

(assert (= (and b!345315 c!52986) b!345299))

(assert (= (and b!345315 (not c!52986)) b!345300))

(assert (= (and b!345299 res!191034) b!345313))

(assert (= (or b!345299 b!345300) bm!26690))

(assert (= (and b!345315 res!191033) b!345297))

(assert (= (and b!345297 c!52982) b!345302))

(assert (= (and b!345297 (not c!52982)) b!345301))

(assert (= (and b!345302 res!191036) b!345309))

(assert (= (or b!345302 b!345301) bm!26688))

(declare-fun b_lambda!8459 () Bool)

(assert (=> (not b_lambda!8459) (not b!345303)))

(declare-fun t!10161 () Bool)

(declare-fun tb!3075 () Bool)

(assert (=> (and start!34532 (= defaultEntry!1528 defaultEntry!1528) t!10161) tb!3075))

(declare-fun result!5555 () Bool)

(assert (=> tb!3075 (= result!5555 tp_is_empty!7407)))

(assert (=> b!345303 t!10161))

(declare-fun b_and!14667 () Bool)

(assert (= b_and!14663 (and (=> t!10161 result!5555) b_and!14667)))

(declare-fun m!346685 () Bool)

(assert (=> bm!26691 m!346685))

(declare-fun m!346687 () Bool)

(assert (=> bm!26688 m!346687))

(declare-fun m!346689 () Bool)

(assert (=> b!345309 m!346689))

(declare-fun m!346691 () Bool)

(assert (=> bm!26687 m!346691))

(declare-fun m!346693 () Bool)

(assert (=> b!345306 m!346693))

(assert (=> b!345306 m!346693))

(declare-fun m!346695 () Bool)

(assert (=> b!345306 m!346695))

(assert (=> d!71129 m!346633))

(declare-fun m!346697 () Bool)

(assert (=> b!345311 m!346697))

(declare-fun m!346699 () Bool)

(assert (=> b!345311 m!346699))

(declare-fun m!346701 () Bool)

(assert (=> b!345311 m!346701))

(declare-fun m!346703 () Bool)

(assert (=> b!345311 m!346703))

(assert (=> b!345311 m!346691))

(declare-fun m!346705 () Bool)

(assert (=> b!345311 m!346705))

(assert (=> b!345311 m!346693))

(declare-fun m!346707 () Bool)

(assert (=> b!345311 m!346707))

(declare-fun m!346709 () Bool)

(assert (=> b!345311 m!346709))

(declare-fun m!346711 () Bool)

(assert (=> b!345311 m!346711))

(declare-fun m!346713 () Bool)

(assert (=> b!345311 m!346713))

(assert (=> b!345311 m!346707))

(assert (=> b!345311 m!346701))

(declare-fun m!346715 () Bool)

(assert (=> b!345311 m!346715))

(declare-fun m!346717 () Bool)

(assert (=> b!345311 m!346717))

(declare-fun m!346719 () Bool)

(assert (=> b!345311 m!346719))

(assert (=> b!345311 m!346713))

(declare-fun m!346721 () Bool)

(assert (=> b!345311 m!346721))

(declare-fun m!346723 () Bool)

(assert (=> b!345311 m!346723))

(assert (=> b!345311 m!346717))

(declare-fun m!346725 () Bool)

(assert (=> b!345311 m!346725))

(declare-fun m!346727 () Bool)

(assert (=> b!345303 m!346727))

(assert (=> b!345303 m!346693))

(declare-fun m!346729 () Bool)

(assert (=> b!345303 m!346729))

(declare-fun m!346731 () Bool)

(assert (=> b!345303 m!346731))

(assert (=> b!345303 m!346693))

(assert (=> b!345303 m!346727))

(assert (=> b!345303 m!346731))

(declare-fun m!346733 () Bool)

(assert (=> b!345303 m!346733))

(declare-fun m!346735 () Bool)

(assert (=> b!345313 m!346735))

(declare-fun m!346737 () Bool)

(assert (=> bm!26690 m!346737))

(declare-fun m!346739 () Bool)

(assert (=> b!345310 m!346739))

(assert (=> b!345295 m!346693))

(assert (=> b!345295 m!346693))

(assert (=> b!345295 m!346695))

(assert (=> b!345304 m!346693))

(assert (=> b!345304 m!346693))

(declare-fun m!346741 () Bool)

(assert (=> b!345304 m!346741))

(assert (=> b!345194 d!71129))

(declare-fun b!345326 () Bool)

(declare-fun e!211645 () Bool)

(declare-fun e!211646 () Bool)

(assert (=> b!345326 (= e!211645 e!211646)))

(declare-fun lt!162855 () (_ BitVec 64))

(assert (=> b!345326 (= lt!162855 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162854 () Unit!10729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18397 (_ BitVec 64) (_ BitVec 32)) Unit!10729)

(assert (=> b!345326 (= lt!162854 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162855 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!18397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345326 (arrayContainsKey!0 _keys!1895 lt!162855 #b00000000000000000000000000000000)))

(declare-fun lt!162856 () Unit!10729)

(assert (=> b!345326 (= lt!162856 lt!162854)))

(declare-fun res!191044 () Bool)

(assert (=> b!345326 (= res!191044 (= (seekEntryOrOpen!0 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3359 #b00000000000000000000000000000000)))))

(assert (=> b!345326 (=> (not res!191044) (not e!211646))))

(declare-fun b!345327 () Bool)

(declare-fun e!211647 () Bool)

(assert (=> b!345327 (= e!211647 e!211645)))

(declare-fun c!52989 () Bool)

(assert (=> b!345327 (= c!52989 (validKeyInArray!0 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345328 () Bool)

(declare-fun call!26698 () Bool)

(assert (=> b!345328 (= e!211646 call!26698)))

(declare-fun bm!26695 () Bool)

(assert (=> bm!26695 (= call!26698 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71131 () Bool)

(declare-fun res!191045 () Bool)

(assert (=> d!71131 (=> res!191045 e!211647)))

(assert (=> d!71131 (= res!191045 (bvsge #b00000000000000000000000000000000 (size!9067 _keys!1895)))))

(assert (=> d!71131 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211647)))

(declare-fun b!345329 () Bool)

(assert (=> b!345329 (= e!211645 call!26698)))

(assert (= (and d!71131 (not res!191045)) b!345327))

(assert (= (and b!345327 c!52989) b!345326))

(assert (= (and b!345327 (not c!52989)) b!345329))

(assert (= (and b!345326 res!191044) b!345328))

(assert (= (or b!345328 b!345329) bm!26695))

(assert (=> b!345326 m!346693))

(declare-fun m!346743 () Bool)

(assert (=> b!345326 m!346743))

(declare-fun m!346745 () Bool)

(assert (=> b!345326 m!346745))

(assert (=> b!345326 m!346693))

(declare-fun m!346747 () Bool)

(assert (=> b!345326 m!346747))

(assert (=> b!345327 m!346693))

(assert (=> b!345327 m!346693))

(assert (=> b!345327 m!346695))

(declare-fun m!346749 () Bool)

(assert (=> bm!26695 m!346749))

(assert (=> b!345193 d!71131))

(declare-fun d!71133 () Bool)

(assert (=> d!71133 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345195 d!71133))

(declare-fun b!345341 () Bool)

(declare-fun e!211659 () Bool)

(declare-fun contains!2240 (List!5041 (_ BitVec 64)) Bool)

(assert (=> b!345341 (= e!211659 (contains!2240 Nil!5038 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345342 () Bool)

(declare-fun e!211656 () Bool)

(declare-fun e!211657 () Bool)

(assert (=> b!345342 (= e!211656 e!211657)))

(declare-fun c!52992 () Bool)

(assert (=> b!345342 (= c!52992 (validKeyInArray!0 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26698 () Bool)

(declare-fun call!26701 () Bool)

(assert (=> bm!26698 (= call!26701 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52992 (Cons!5037 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000) Nil!5038) Nil!5038)))))

(declare-fun b!345343 () Bool)

(assert (=> b!345343 (= e!211657 call!26701)))

(declare-fun b!345344 () Bool)

(assert (=> b!345344 (= e!211657 call!26701)))

(declare-fun b!345340 () Bool)

(declare-fun e!211658 () Bool)

(assert (=> b!345340 (= e!211658 e!211656)))

(declare-fun res!191053 () Bool)

(assert (=> b!345340 (=> (not res!191053) (not e!211656))))

(assert (=> b!345340 (= res!191053 (not e!211659))))

(declare-fun res!191054 () Bool)

(assert (=> b!345340 (=> (not res!191054) (not e!211659))))

(assert (=> b!345340 (= res!191054 (validKeyInArray!0 (select (arr!8715 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71135 () Bool)

(declare-fun res!191052 () Bool)

(assert (=> d!71135 (=> res!191052 e!211658)))

(assert (=> d!71135 (= res!191052 (bvsge #b00000000000000000000000000000000 (size!9067 _keys!1895)))))

(assert (=> d!71135 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5038) e!211658)))

(assert (= (and d!71135 (not res!191052)) b!345340))

(assert (= (and b!345340 res!191054) b!345341))

(assert (= (and b!345340 res!191053) b!345342))

(assert (= (and b!345342 c!52992) b!345344))

(assert (= (and b!345342 (not c!52992)) b!345343))

(assert (= (or b!345344 b!345343) bm!26698))

(assert (=> b!345341 m!346693))

(assert (=> b!345341 m!346693))

(declare-fun m!346751 () Bool)

(assert (=> b!345341 m!346751))

(assert (=> b!345342 m!346693))

(assert (=> b!345342 m!346693))

(assert (=> b!345342 m!346695))

(assert (=> bm!26698 m!346693))

(declare-fun m!346753 () Bool)

(assert (=> bm!26698 m!346753))

(assert (=> b!345340 m!346693))

(assert (=> b!345340 m!346693))

(assert (=> b!345340 m!346695))

(assert (=> b!345198 d!71135))

(declare-fun b!345351 () Bool)

(declare-fun e!211665 () Bool)

(assert (=> b!345351 (= e!211665 tp_is_empty!7407)))

(declare-fun condMapEmpty!12555 () Bool)

(declare-fun mapDefault!12555 () ValueCell!3360)

(assert (=> mapNonEmpty!12549 (= condMapEmpty!12555 (= mapRest!12549 ((as const (Array (_ BitVec 32) ValueCell!3360)) mapDefault!12555)))))

(declare-fun e!211664 () Bool)

(declare-fun mapRes!12555 () Bool)

(assert (=> mapNonEmpty!12549 (= tp!25910 (and e!211664 mapRes!12555))))

(declare-fun mapIsEmpty!12555 () Bool)

(assert (=> mapIsEmpty!12555 mapRes!12555))

(declare-fun b!345352 () Bool)

(assert (=> b!345352 (= e!211664 tp_is_empty!7407)))

(declare-fun mapNonEmpty!12555 () Bool)

(declare-fun tp!25920 () Bool)

(assert (=> mapNonEmpty!12555 (= mapRes!12555 (and tp!25920 e!211665))))

(declare-fun mapValue!12555 () ValueCell!3360)

(declare-fun mapKey!12555 () (_ BitVec 32))

(declare-fun mapRest!12555 () (Array (_ BitVec 32) ValueCell!3360))

(assert (=> mapNonEmpty!12555 (= mapRest!12549 (store mapRest!12555 mapKey!12555 mapValue!12555))))

(assert (= (and mapNonEmpty!12549 condMapEmpty!12555) mapIsEmpty!12555))

(assert (= (and mapNonEmpty!12549 (not condMapEmpty!12555)) mapNonEmpty!12555))

(assert (= (and mapNonEmpty!12555 ((_ is ValueCellFull!3360) mapValue!12555)) b!345351))

(assert (= (and mapNonEmpty!12549 ((_ is ValueCellFull!3360) mapDefault!12555)) b!345352))

(declare-fun m!346755 () Bool)

(assert (=> mapNonEmpty!12555 m!346755))

(declare-fun b_lambda!8461 () Bool)

(assert (= b_lambda!8459 (or (and start!34532 b_free!7455) b_lambda!8461)))

(check-sat (not bm!26690) (not b_lambda!8461) (not d!71119) (not bm!26688) (not b_next!7455) (not b!345326) (not b!345242) (not bm!26698) (not d!71129) (not b!345310) (not b!345309) (not b!345250) (not b!345342) (not b!345341) (not b!345306) (not b!345313) b_and!14667 (not b!345327) (not mapNonEmpty!12555) (not bm!26695) (not b!345311) (not bm!26687) tp_is_empty!7407 (not b!345252) (not b!345295) (not b!345340) (not b!345304) (not bm!26691) (not d!71127) (not b!345303))
(check-sat b_and!14667 (not b_next!7455))
