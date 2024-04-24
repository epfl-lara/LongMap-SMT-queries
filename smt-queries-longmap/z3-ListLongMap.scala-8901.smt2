; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108270 () Bool)

(assert start!108270)

(declare-fun b!1277415 () Bool)

(declare-fun e!729495 () Bool)

(declare-fun tp_is_empty!33319 () Bool)

(assert (=> b!1277415 (= e!729495 tp_is_empty!33319)))

(declare-fun b!1277416 () Bool)

(declare-fun e!729493 () Bool)

(declare-datatypes ((array!83759 0))(
  ( (array!83760 (arr!40387 (Array (_ BitVec 32) (_ BitVec 64))) (size!40938 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83759)

(assert (=> b!1277416 (= e!729493 (bvsgt #b00000000000000000000000000000000 (size!40938 _keys!1427)))))

(declare-fun b!1277417 () Bool)

(declare-fun res!848620 () Bool)

(assert (=> b!1277417 (=> (not res!848620) (not e!729493))))

(declare-datatypes ((List!28665 0))(
  ( (Nil!28662) (Cons!28661 (h!29879 (_ BitVec 64)) (t!42193 List!28665)) )
))
(declare-fun arrayNoDuplicates!0 (array!83759 (_ BitVec 32) List!28665) Bool)

(assert (=> b!1277417 (= res!848620 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28662))))

(declare-fun mapIsEmpty!51506 () Bool)

(declare-fun mapRes!51506 () Bool)

(assert (=> mapIsEmpty!51506 mapRes!51506))

(declare-fun b!1277418 () Bool)

(declare-fun res!848623 () Bool)

(assert (=> b!1277418 (=> (not res!848623) (not e!729493))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83759 (_ BitVec 32)) Bool)

(assert (=> b!1277418 (= res!848623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!848621 () Bool)

(assert (=> start!108270 (=> (not res!848621) (not e!729493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108270 (= res!848621 (validMask!0 mask!1805))))

(assert (=> start!108270 e!729493))

(assert (=> start!108270 true))

(declare-datatypes ((V!49529 0))(
  ( (V!49530 (val!16734 Int)) )
))
(declare-datatypes ((ValueCell!15761 0))(
  ( (ValueCellFull!15761 (v!19326 V!49529)) (EmptyCell!15761) )
))
(declare-datatypes ((array!83761 0))(
  ( (array!83762 (arr!40388 (Array (_ BitVec 32) ValueCell!15761)) (size!40939 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83761)

(declare-fun e!729492 () Bool)

(declare-fun array_inv!30881 (array!83761) Bool)

(assert (=> start!108270 (and (array_inv!30881 _values!1187) e!729492)))

(declare-fun array_inv!30882 (array!83759) Bool)

(assert (=> start!108270 (array_inv!30882 _keys!1427)))

(declare-fun b!1277419 () Bool)

(assert (=> b!1277419 (= e!729492 (and e!729495 mapRes!51506))))

(declare-fun condMapEmpty!51506 () Bool)

(declare-fun mapDefault!51506 () ValueCell!15761)

(assert (=> b!1277419 (= condMapEmpty!51506 (= (arr!40388 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15761)) mapDefault!51506)))))

(declare-fun b!1277420 () Bool)

(declare-fun res!848622 () Bool)

(assert (=> b!1277420 (=> (not res!848622) (not e!729493))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277420 (= res!848622 (and (= (size!40939 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40938 _keys!1427) (size!40939 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51506 () Bool)

(declare-fun tp!98264 () Bool)

(declare-fun e!729496 () Bool)

(assert (=> mapNonEmpty!51506 (= mapRes!51506 (and tp!98264 e!729496))))

(declare-fun mapKey!51506 () (_ BitVec 32))

(declare-fun mapRest!51506 () (Array (_ BitVec 32) ValueCell!15761))

(declare-fun mapValue!51506 () ValueCell!15761)

(assert (=> mapNonEmpty!51506 (= (arr!40388 _values!1187) (store mapRest!51506 mapKey!51506 mapValue!51506))))

(declare-fun b!1277421 () Bool)

(assert (=> b!1277421 (= e!729496 tp_is_empty!33319)))

(assert (= (and start!108270 res!848621) b!1277420))

(assert (= (and b!1277420 res!848622) b!1277418))

(assert (= (and b!1277418 res!848623) b!1277417))

(assert (= (and b!1277417 res!848620) b!1277416))

(assert (= (and b!1277419 condMapEmpty!51506) mapIsEmpty!51506))

(assert (= (and b!1277419 (not condMapEmpty!51506)) mapNonEmpty!51506))

(get-info :version)

(assert (= (and mapNonEmpty!51506 ((_ is ValueCellFull!15761) mapValue!51506)) b!1277421))

(assert (= (and b!1277419 ((_ is ValueCellFull!15761) mapDefault!51506)) b!1277415))

(assert (= start!108270 b!1277419))

(declare-fun m!1173735 () Bool)

(assert (=> b!1277417 m!1173735))

(declare-fun m!1173737 () Bool)

(assert (=> b!1277418 m!1173737))

(declare-fun m!1173739 () Bool)

(assert (=> start!108270 m!1173739))

(declare-fun m!1173741 () Bool)

(assert (=> start!108270 m!1173741))

(declare-fun m!1173743 () Bool)

(assert (=> start!108270 m!1173743))

(declare-fun m!1173745 () Bool)

(assert (=> mapNonEmpty!51506 m!1173745))

(check-sat (not b!1277417) tp_is_empty!33319 (not start!108270) (not mapNonEmpty!51506) (not b!1277418))
(check-sat)
(get-model)

(declare-fun b!1277472 () Bool)

(declare-fun e!729535 () Bool)

(declare-fun e!729533 () Bool)

(assert (=> b!1277472 (= e!729535 e!729533)))

(declare-fun lt!575936 () (_ BitVec 64))

(assert (=> b!1277472 (= lt!575936 (select (arr!40387 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42330 0))(
  ( (Unit!42331) )
))
(declare-fun lt!575935 () Unit!42330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83759 (_ BitVec 64) (_ BitVec 32)) Unit!42330)

(assert (=> b!1277472 (= lt!575935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575936 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1277472 (arrayContainsKey!0 _keys!1427 lt!575936 #b00000000000000000000000000000000)))

(declare-fun lt!575934 () Unit!42330)

(assert (=> b!1277472 (= lt!575934 lt!575935)))

(declare-fun res!848653 () Bool)

(declare-datatypes ((SeekEntryResult!9961 0))(
  ( (MissingZero!9961 (index!42215 (_ BitVec 32))) (Found!9961 (index!42216 (_ BitVec 32))) (Intermediate!9961 (undefined!10773 Bool) (index!42217 (_ BitVec 32)) (x!113032 (_ BitVec 32))) (Undefined!9961) (MissingVacant!9961 (index!42218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83759 (_ BitVec 32)) SeekEntryResult!9961)

(assert (=> b!1277472 (= res!848653 (= (seekEntryOrOpen!0 (select (arr!40387 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!9961 #b00000000000000000000000000000000)))))

(assert (=> b!1277472 (=> (not res!848653) (not e!729533))))

(declare-fun b!1277473 () Bool)

(declare-fun e!729534 () Bool)

(assert (=> b!1277473 (= e!729534 e!729535)))

(declare-fun c!124330 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1277473 (= c!124330 (validKeyInArray!0 (select (arr!40387 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140859 () Bool)

(declare-fun res!848652 () Bool)

(assert (=> d!140859 (=> res!848652 e!729534)))

(assert (=> d!140859 (= res!848652 (bvsge #b00000000000000000000000000000000 (size!40938 _keys!1427)))))

(assert (=> d!140859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!729534)))

(declare-fun b!1277474 () Bool)

(declare-fun call!62712 () Bool)

(assert (=> b!1277474 (= e!729535 call!62712)))

(declare-fun bm!62709 () Bool)

(assert (=> bm!62709 (= call!62712 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1277475 () Bool)

(assert (=> b!1277475 (= e!729533 call!62712)))

(assert (= (and d!140859 (not res!848652)) b!1277473))

(assert (= (and b!1277473 c!124330) b!1277472))

(assert (= (and b!1277473 (not c!124330)) b!1277474))

(assert (= (and b!1277472 res!848653) b!1277475))

(assert (= (or b!1277475 b!1277474) bm!62709))

(declare-fun m!1173771 () Bool)

(assert (=> b!1277472 m!1173771))

(declare-fun m!1173773 () Bool)

(assert (=> b!1277472 m!1173773))

(declare-fun m!1173775 () Bool)

(assert (=> b!1277472 m!1173775))

(assert (=> b!1277472 m!1173771))

(declare-fun m!1173777 () Bool)

(assert (=> b!1277472 m!1173777))

(assert (=> b!1277473 m!1173771))

(assert (=> b!1277473 m!1173771))

(declare-fun m!1173779 () Bool)

(assert (=> b!1277473 m!1173779))

(declare-fun m!1173781 () Bool)

(assert (=> bm!62709 m!1173781))

(assert (=> b!1277418 d!140859))

(declare-fun bm!62712 () Bool)

(declare-fun call!62715 () Bool)

(declare-fun c!124333 () Bool)

(assert (=> bm!62712 (= call!62715 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124333 (Cons!28661 (select (arr!40387 _keys!1427) #b00000000000000000000000000000000) Nil!28662) Nil!28662)))))

(declare-fun b!1277486 () Bool)

(declare-fun e!729545 () Bool)

(assert (=> b!1277486 (= e!729545 call!62715)))

(declare-fun b!1277487 () Bool)

(declare-fun e!729544 () Bool)

(declare-fun contains!7708 (List!28665 (_ BitVec 64)) Bool)

(assert (=> b!1277487 (= e!729544 (contains!7708 Nil!28662 (select (arr!40387 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277488 () Bool)

(assert (=> b!1277488 (= e!729545 call!62715)))

(declare-fun d!140861 () Bool)

(declare-fun res!848660 () Bool)

(declare-fun e!729546 () Bool)

(assert (=> d!140861 (=> res!848660 e!729546)))

(assert (=> d!140861 (= res!848660 (bvsge #b00000000000000000000000000000000 (size!40938 _keys!1427)))))

(assert (=> d!140861 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28662) e!729546)))

(declare-fun b!1277489 () Bool)

(declare-fun e!729547 () Bool)

(assert (=> b!1277489 (= e!729546 e!729547)))

(declare-fun res!848662 () Bool)

(assert (=> b!1277489 (=> (not res!848662) (not e!729547))))

(assert (=> b!1277489 (= res!848662 (not e!729544))))

(declare-fun res!848661 () Bool)

(assert (=> b!1277489 (=> (not res!848661) (not e!729544))))

(assert (=> b!1277489 (= res!848661 (validKeyInArray!0 (select (arr!40387 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277490 () Bool)

(assert (=> b!1277490 (= e!729547 e!729545)))

(assert (=> b!1277490 (= c!124333 (validKeyInArray!0 (select (arr!40387 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140861 (not res!848660)) b!1277489))

(assert (= (and b!1277489 res!848661) b!1277487))

(assert (= (and b!1277489 res!848662) b!1277490))

(assert (= (and b!1277490 c!124333) b!1277488))

(assert (= (and b!1277490 (not c!124333)) b!1277486))

(assert (= (or b!1277488 b!1277486) bm!62712))

(assert (=> bm!62712 m!1173771))

(declare-fun m!1173783 () Bool)

(assert (=> bm!62712 m!1173783))

(assert (=> b!1277487 m!1173771))

(assert (=> b!1277487 m!1173771))

(declare-fun m!1173785 () Bool)

(assert (=> b!1277487 m!1173785))

(assert (=> b!1277489 m!1173771))

(assert (=> b!1277489 m!1173771))

(assert (=> b!1277489 m!1173779))

(assert (=> b!1277490 m!1173771))

(assert (=> b!1277490 m!1173771))

(assert (=> b!1277490 m!1173779))

(assert (=> b!1277417 d!140861))

(declare-fun d!140863 () Bool)

(assert (=> d!140863 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108270 d!140863))

(declare-fun d!140865 () Bool)

(assert (=> d!140865 (= (array_inv!30881 _values!1187) (bvsge (size!40939 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108270 d!140865))

(declare-fun d!140867 () Bool)

(assert (=> d!140867 (= (array_inv!30882 _keys!1427) (bvsge (size!40938 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108270 d!140867))

(declare-fun mapNonEmpty!51515 () Bool)

(declare-fun mapRes!51515 () Bool)

(declare-fun tp!98273 () Bool)

(declare-fun e!729553 () Bool)

(assert (=> mapNonEmpty!51515 (= mapRes!51515 (and tp!98273 e!729553))))

(declare-fun mapValue!51515 () ValueCell!15761)

(declare-fun mapKey!51515 () (_ BitVec 32))

(declare-fun mapRest!51515 () (Array (_ BitVec 32) ValueCell!15761))

(assert (=> mapNonEmpty!51515 (= mapRest!51506 (store mapRest!51515 mapKey!51515 mapValue!51515))))

(declare-fun mapIsEmpty!51515 () Bool)

(assert (=> mapIsEmpty!51515 mapRes!51515))

(declare-fun b!1277497 () Bool)

(assert (=> b!1277497 (= e!729553 tp_is_empty!33319)))

(declare-fun b!1277498 () Bool)

(declare-fun e!729552 () Bool)

(assert (=> b!1277498 (= e!729552 tp_is_empty!33319)))

(declare-fun condMapEmpty!51515 () Bool)

(declare-fun mapDefault!51515 () ValueCell!15761)

(assert (=> mapNonEmpty!51506 (= condMapEmpty!51515 (= mapRest!51506 ((as const (Array (_ BitVec 32) ValueCell!15761)) mapDefault!51515)))))

(assert (=> mapNonEmpty!51506 (= tp!98264 (and e!729552 mapRes!51515))))

(assert (= (and mapNonEmpty!51506 condMapEmpty!51515) mapIsEmpty!51515))

(assert (= (and mapNonEmpty!51506 (not condMapEmpty!51515)) mapNonEmpty!51515))

(assert (= (and mapNonEmpty!51515 ((_ is ValueCellFull!15761) mapValue!51515)) b!1277497))

(assert (= (and mapNonEmpty!51506 ((_ is ValueCellFull!15761) mapDefault!51515)) b!1277498))

(declare-fun m!1173787 () Bool)

(assert (=> mapNonEmpty!51515 m!1173787))

(check-sat tp_is_empty!33319 (not b!1277489) (not mapNonEmpty!51515) (not b!1277472) (not b!1277473) (not b!1277487) (not b!1277490) (not bm!62712) (not bm!62709))
(check-sat)
