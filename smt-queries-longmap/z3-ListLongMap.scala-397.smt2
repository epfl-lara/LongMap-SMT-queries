; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7428 () Bool)

(assert start!7428)

(declare-fun res!27732 () Bool)

(declare-fun e!30556 () Bool)

(assert (=> start!7428 (=> (not res!27732) (not e!30556))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7428 (= res!27732 (validMask!0 mask!2458))))

(assert (=> start!7428 e!30556))

(assert (=> start!7428 true))

(declare-datatypes ((array!3168 0))(
  ( (array!3169 (arr!1518 (Array (_ BitVec 32) (_ BitVec 64))) (size!1740 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3168)

(declare-fun array_inv!906 (array!3168) Bool)

(assert (=> start!7428 (array_inv!906 _keys!1940)))

(declare-datatypes ((V!2479 0))(
  ( (V!2480 (val!1068 Int)) )
))
(declare-datatypes ((ValueCell!740 0))(
  ( (ValueCellFull!740 (v!2130 V!2479)) (EmptyCell!740) )
))
(declare-datatypes ((array!3170 0))(
  ( (array!3171 (arr!1519 (Array (_ BitVec 32) ValueCell!740)) (size!1741 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3170)

(declare-fun e!30555 () Bool)

(declare-fun array_inv!907 (array!3170) Bool)

(assert (=> start!7428 (and (array_inv!907 _values!1550) e!30555)))

(declare-fun b!47663 () Bool)

(declare-fun e!30553 () Bool)

(declare-fun tp_is_empty!2059 () Bool)

(assert (=> b!47663 (= e!30553 tp_is_empty!2059)))

(declare-fun b!47664 () Bool)

(declare-fun res!27729 () Bool)

(assert (=> b!47664 (=> (not res!27729) (not e!30556))))

(declare-datatypes ((List!1252 0))(
  ( (Nil!1249) (Cons!1248 (h!1828 (_ BitVec 64)) (t!4280 List!1252)) )
))
(declare-fun arrayNoDuplicates!0 (array!3168 (_ BitVec 32) List!1252) Bool)

(assert (=> b!47664 (= res!27729 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1249))))

(declare-fun b!47665 () Bool)

(declare-fun e!30552 () Bool)

(declare-fun mapRes!2132 () Bool)

(assert (=> b!47665 (= e!30555 (and e!30552 mapRes!2132))))

(declare-fun condMapEmpty!2132 () Bool)

(declare-fun mapDefault!2132 () ValueCell!740)

(assert (=> b!47665 (= condMapEmpty!2132 (= (arr!1519 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!740)) mapDefault!2132)))))

(declare-fun b!47666 () Bool)

(declare-fun e!30550 () Bool)

(assert (=> b!47666 (= e!30556 e!30550)))

(declare-fun res!27727 () Bool)

(assert (=> b!47666 (=> (not res!27727) (not e!30550))))

(declare-datatypes ((SeekEntryResult!203 0))(
  ( (MissingZero!203 (index!2934 (_ BitVec 32))) (Found!203 (index!2935 (_ BitVec 32))) (Intermediate!203 (undefined!1015 Bool) (index!2936 (_ BitVec 32)) (x!8783 (_ BitVec 32))) (Undefined!203) (MissingVacant!203 (index!2937 (_ BitVec 32))) )
))
(declare-fun lt!20407 () SeekEntryResult!203)

(get-info :version)

(assert (=> b!47666 (= res!27727 (not ((_ is Undefined!203) lt!20407)))))

(declare-fun k0!1421 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3168 (_ BitVec 32)) SeekEntryResult!203)

(assert (=> b!47666 (= lt!20407 (seekEntryOrOpen!0 k0!1421 _keys!1940 mask!2458))))

(declare-fun mapNonEmpty!2132 () Bool)

(declare-fun tp!6281 () Bool)

(assert (=> mapNonEmpty!2132 (= mapRes!2132 (and tp!6281 e!30553))))

(declare-fun mapKey!2132 () (_ BitVec 32))

(declare-fun mapValue!2132 () ValueCell!740)

(declare-fun mapRest!2132 () (Array (_ BitVec 32) ValueCell!740))

(assert (=> mapNonEmpty!2132 (= (arr!1519 _values!1550) (store mapRest!2132 mapKey!2132 mapValue!2132))))

(declare-fun b!47667 () Bool)

(declare-fun e!30558 () Bool)

(declare-fun call!3712 () Bool)

(assert (=> b!47667 (= e!30558 (not call!3712))))

(declare-fun c!6398 () Bool)

(declare-fun call!3713 () Bool)

(declare-fun bm!3709 () Bool)

(declare-fun c!6397 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3709 (= call!3713 (inRange!0 (ite c!6397 (index!2935 lt!20407) (ite c!6398 (index!2937 lt!20407) (index!2934 lt!20407))) mask!2458))))

(declare-fun b!47668 () Bool)

(declare-fun res!27733 () Bool)

(assert (=> b!47668 (=> (not res!27733) (not e!30556))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47668 (= res!27733 (and (= (size!1741 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1740 _keys!1940) (size!1741 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47669 () Bool)

(declare-fun e!30557 () Bool)

(assert (=> b!47669 (= e!30557 (not call!3713))))

(declare-fun b!47670 () Bool)

(assert (=> b!47670 (= e!30550 e!30557)))

(assert (=> b!47670 (= c!6397 ((_ is Found!203) lt!20407))))

(declare-fun b!47671 () Bool)

(declare-fun res!27730 () Bool)

(assert (=> b!47671 (=> (not res!27730) (not e!30556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3168 (_ BitVec 32)) Bool)

(assert (=> b!47671 (= res!27730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun bm!3710 () Bool)

(assert (=> bm!3710 (= call!3712 call!3713)))

(declare-fun b!47672 () Bool)

(assert (=> b!47672 (= e!30552 tp_is_empty!2059)))

(declare-fun b!47673 () Bool)

(assert (=> b!47673 (= e!30557 e!30558)))

(assert (=> b!47673 (= c!6398 ((_ is MissingVacant!203) lt!20407))))

(declare-fun mapIsEmpty!2132 () Bool)

(assert (=> mapIsEmpty!2132 mapRes!2132))

(declare-fun b!47674 () Bool)

(declare-fun res!27731 () Bool)

(assert (=> b!47674 (=> (not res!27731) (not e!30556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47674 (= res!27731 (validKeyInArray!0 k0!1421))))

(declare-fun b!47675 () Bool)

(declare-fun e!30554 () Bool)

(assert (=> b!47675 (= e!30554 (not call!3712))))

(declare-fun b!47676 () Bool)

(declare-fun res!27728 () Bool)

(assert (=> b!47676 (=> res!27728 e!30554)))

(assert (=> b!47676 (= res!27728 (not ((_ is MissingZero!203) lt!20407)))))

(assert (=> b!47676 (= e!30558 e!30554)))

(assert (= (and start!7428 res!27732) b!47668))

(assert (= (and b!47668 res!27733) b!47671))

(assert (= (and b!47671 res!27730) b!47664))

(assert (= (and b!47664 res!27729) b!47674))

(assert (= (and b!47674 res!27731) b!47666))

(assert (= (and b!47666 res!27727) b!47670))

(assert (= (and b!47670 c!6397) b!47669))

(assert (= (and b!47670 (not c!6397)) b!47673))

(assert (= (and b!47673 c!6398) b!47667))

(assert (= (and b!47673 (not c!6398)) b!47676))

(assert (= (and b!47676 (not res!27728)) b!47675))

(assert (= (or b!47667 b!47675) bm!3710))

(assert (= (or b!47669 bm!3710) bm!3709))

(assert (= (and b!47665 condMapEmpty!2132) mapIsEmpty!2132))

(assert (= (and b!47665 (not condMapEmpty!2132)) mapNonEmpty!2132))

(assert (= (and mapNonEmpty!2132 ((_ is ValueCellFull!740) mapValue!2132)) b!47663))

(assert (= (and b!47665 ((_ is ValueCellFull!740) mapDefault!2132)) b!47672))

(assert (= start!7428 b!47665))

(declare-fun m!41703 () Bool)

(assert (=> b!47674 m!41703))

(declare-fun m!41705 () Bool)

(assert (=> b!47671 m!41705))

(declare-fun m!41707 () Bool)

(assert (=> start!7428 m!41707))

(declare-fun m!41709 () Bool)

(assert (=> start!7428 m!41709))

(declare-fun m!41711 () Bool)

(assert (=> start!7428 m!41711))

(declare-fun m!41713 () Bool)

(assert (=> b!47664 m!41713))

(declare-fun m!41715 () Bool)

(assert (=> b!47666 m!41715))

(declare-fun m!41717 () Bool)

(assert (=> bm!3709 m!41717))

(declare-fun m!41719 () Bool)

(assert (=> mapNonEmpty!2132 m!41719))

(check-sat (not b!47674) (not b!47666) tp_is_empty!2059 (not mapNonEmpty!2132) (not start!7428) (not b!47664) (not b!47671) (not bm!3709))
(check-sat)
(get-model)

(declare-fun d!9459 () Bool)

(assert (=> d!9459 (= (inRange!0 (ite c!6397 (index!2935 lt!20407) (ite c!6398 (index!2937 lt!20407) (index!2934 lt!20407))) mask!2458) (and (bvsge (ite c!6397 (index!2935 lt!20407) (ite c!6398 (index!2937 lt!20407) (index!2934 lt!20407))) #b00000000000000000000000000000000) (bvslt (ite c!6397 (index!2935 lt!20407) (ite c!6398 (index!2937 lt!20407) (index!2934 lt!20407))) (bvadd mask!2458 #b00000000000000000000000000000001))))))

(assert (=> bm!3709 d!9459))

(declare-fun d!9461 () Bool)

(assert (=> d!9461 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7428 d!9461))

(declare-fun d!9463 () Bool)

(assert (=> d!9463 (= (array_inv!906 _keys!1940) (bvsge (size!1740 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7428 d!9463))

(declare-fun d!9465 () Bool)

(assert (=> d!9465 (= (array_inv!907 _values!1550) (bvsge (size!1741 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7428 d!9465))

(declare-fun b!47771 () Bool)

(declare-fun e!30621 () Bool)

(declare-fun e!30623 () Bool)

(assert (=> b!47771 (= e!30621 e!30623)))

(declare-fun c!6413 () Bool)

(assert (=> b!47771 (= c!6413 (validKeyInArray!0 (select (arr!1518 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun bm!3725 () Bool)

(declare-fun call!3728 () Bool)

(assert (=> bm!3725 (= call!3728 (arrayNoDuplicates!0 _keys!1940 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6413 (Cons!1248 (select (arr!1518 _keys!1940) #b00000000000000000000000000000000) Nil!1249) Nil!1249)))))

(declare-fun d!9467 () Bool)

(declare-fun res!27783 () Bool)

(declare-fun e!30622 () Bool)

(assert (=> d!9467 (=> res!27783 e!30622)))

(assert (=> d!9467 (= res!27783 (bvsge #b00000000000000000000000000000000 (size!1740 _keys!1940)))))

(assert (=> d!9467 (= (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1249) e!30622)))

(declare-fun b!47772 () Bool)

(assert (=> b!47772 (= e!30622 e!30621)))

(declare-fun res!27782 () Bool)

(assert (=> b!47772 (=> (not res!27782) (not e!30621))))

(declare-fun e!30624 () Bool)

(assert (=> b!47772 (= res!27782 (not e!30624))))

(declare-fun res!27784 () Bool)

(assert (=> b!47772 (=> (not res!27784) (not e!30624))))

(assert (=> b!47772 (= res!27784 (validKeyInArray!0 (select (arr!1518 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun b!47773 () Bool)

(assert (=> b!47773 (= e!30623 call!3728)))

(declare-fun b!47774 () Bool)

(assert (=> b!47774 (= e!30623 call!3728)))

(declare-fun b!47775 () Bool)

(declare-fun contains!578 (List!1252 (_ BitVec 64)) Bool)

(assert (=> b!47775 (= e!30624 (contains!578 Nil!1249 (select (arr!1518 _keys!1940) #b00000000000000000000000000000000)))))

(assert (= (and d!9467 (not res!27783)) b!47772))

(assert (= (and b!47772 res!27784) b!47775))

(assert (= (and b!47772 res!27782) b!47771))

(assert (= (and b!47771 c!6413) b!47774))

(assert (= (and b!47771 (not c!6413)) b!47773))

(assert (= (or b!47774 b!47773) bm!3725))

(declare-fun m!41757 () Bool)

(assert (=> b!47771 m!41757))

(assert (=> b!47771 m!41757))

(declare-fun m!41759 () Bool)

(assert (=> b!47771 m!41759))

(assert (=> bm!3725 m!41757))

(declare-fun m!41761 () Bool)

(assert (=> bm!3725 m!41761))

(assert (=> b!47772 m!41757))

(assert (=> b!47772 m!41757))

(assert (=> b!47772 m!41759))

(assert (=> b!47775 m!41757))

(assert (=> b!47775 m!41757))

(declare-fun m!41763 () Bool)

(assert (=> b!47775 m!41763))

(assert (=> b!47664 d!9467))

(declare-fun e!30632 () SeekEntryResult!203)

(declare-fun b!47788 () Bool)

(declare-fun lt!20422 () SeekEntryResult!203)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3168 (_ BitVec 32)) SeekEntryResult!203)

(assert (=> b!47788 (= e!30632 (seekKeyOrZeroReturnVacant!0 (x!8783 lt!20422) (index!2936 lt!20422) (index!2936 lt!20422) k0!1421 _keys!1940 mask!2458))))

(declare-fun b!47789 () Bool)

(declare-fun e!30633 () SeekEntryResult!203)

(assert (=> b!47789 (= e!30633 (Found!203 (index!2936 lt!20422)))))

(declare-fun b!47790 () Bool)

(assert (=> b!47790 (= e!30632 (MissingZero!203 (index!2936 lt!20422)))))

(declare-fun d!9469 () Bool)

(declare-fun lt!20420 () SeekEntryResult!203)

(assert (=> d!9469 (and (or ((_ is Undefined!203) lt!20420) (not ((_ is Found!203) lt!20420)) (and (bvsge (index!2935 lt!20420) #b00000000000000000000000000000000) (bvslt (index!2935 lt!20420) (size!1740 _keys!1940)))) (or ((_ is Undefined!203) lt!20420) ((_ is Found!203) lt!20420) (not ((_ is MissingZero!203) lt!20420)) (and (bvsge (index!2934 lt!20420) #b00000000000000000000000000000000) (bvslt (index!2934 lt!20420) (size!1740 _keys!1940)))) (or ((_ is Undefined!203) lt!20420) ((_ is Found!203) lt!20420) ((_ is MissingZero!203) lt!20420) (not ((_ is MissingVacant!203) lt!20420)) (and (bvsge (index!2937 lt!20420) #b00000000000000000000000000000000) (bvslt (index!2937 lt!20420) (size!1740 _keys!1940)))) (or ((_ is Undefined!203) lt!20420) (ite ((_ is Found!203) lt!20420) (= (select (arr!1518 _keys!1940) (index!2935 lt!20420)) k0!1421) (ite ((_ is MissingZero!203) lt!20420) (= (select (arr!1518 _keys!1940) (index!2934 lt!20420)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!203) lt!20420) (= (select (arr!1518 _keys!1940) (index!2937 lt!20420)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!30631 () SeekEntryResult!203)

(assert (=> d!9469 (= lt!20420 e!30631)))

(declare-fun c!6422 () Bool)

(assert (=> d!9469 (= c!6422 (and ((_ is Intermediate!203) lt!20422) (undefined!1015 lt!20422)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3168 (_ BitVec 32)) SeekEntryResult!203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!9469 (= lt!20422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1421 mask!2458) k0!1421 _keys!1940 mask!2458))))

(assert (=> d!9469 (validMask!0 mask!2458)))

(assert (=> d!9469 (= (seekEntryOrOpen!0 k0!1421 _keys!1940 mask!2458) lt!20420)))

(declare-fun b!47791 () Bool)

(assert (=> b!47791 (= e!30631 e!30633)))

(declare-fun lt!20421 () (_ BitVec 64))

(assert (=> b!47791 (= lt!20421 (select (arr!1518 _keys!1940) (index!2936 lt!20422)))))

(declare-fun c!6421 () Bool)

(assert (=> b!47791 (= c!6421 (= lt!20421 k0!1421))))

(declare-fun b!47792 () Bool)

(assert (=> b!47792 (= e!30631 Undefined!203)))

(declare-fun b!47793 () Bool)

(declare-fun c!6420 () Bool)

(assert (=> b!47793 (= c!6420 (= lt!20421 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!47793 (= e!30633 e!30632)))

(assert (= (and d!9469 c!6422) b!47792))

(assert (= (and d!9469 (not c!6422)) b!47791))

(assert (= (and b!47791 c!6421) b!47789))

(assert (= (and b!47791 (not c!6421)) b!47793))

(assert (= (and b!47793 c!6420) b!47790))

(assert (= (and b!47793 (not c!6420)) b!47788))

(declare-fun m!41765 () Bool)

(assert (=> b!47788 m!41765))

(declare-fun m!41767 () Bool)

(assert (=> d!9469 m!41767))

(declare-fun m!41769 () Bool)

(assert (=> d!9469 m!41769))

(declare-fun m!41771 () Bool)

(assert (=> d!9469 m!41771))

(declare-fun m!41773 () Bool)

(assert (=> d!9469 m!41773))

(declare-fun m!41775 () Bool)

(assert (=> d!9469 m!41775))

(assert (=> d!9469 m!41773))

(assert (=> d!9469 m!41707))

(declare-fun m!41777 () Bool)

(assert (=> b!47791 m!41777))

(assert (=> b!47666 d!9469))

(declare-fun d!9471 () Bool)

(assert (=> d!9471 (= (validKeyInArray!0 k0!1421) (and (not (= k0!1421 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1421 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!47674 d!9471))

(declare-fun b!47802 () Bool)

(declare-fun e!30641 () Bool)

(declare-fun e!30642 () Bool)

(assert (=> b!47802 (= e!30641 e!30642)))

(declare-fun lt!20429 () (_ BitVec 64))

(assert (=> b!47802 (= lt!20429 (select (arr!1518 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1346 0))(
  ( (Unit!1347) )
))
(declare-fun lt!20430 () Unit!1346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3168 (_ BitVec 64) (_ BitVec 32)) Unit!1346)

(assert (=> b!47802 (= lt!20430 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20429 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47802 (arrayContainsKey!0 _keys!1940 lt!20429 #b00000000000000000000000000000000)))

(declare-fun lt!20431 () Unit!1346)

(assert (=> b!47802 (= lt!20431 lt!20430)))

(declare-fun res!27790 () Bool)

(assert (=> b!47802 (= res!27790 (= (seekEntryOrOpen!0 (select (arr!1518 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!203 #b00000000000000000000000000000000)))))

(assert (=> b!47802 (=> (not res!27790) (not e!30642))))

(declare-fun b!47803 () Bool)

(declare-fun e!30640 () Bool)

(assert (=> b!47803 (= e!30640 e!30641)))

(declare-fun c!6425 () Bool)

(assert (=> b!47803 (= c!6425 (validKeyInArray!0 (select (arr!1518 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun b!47804 () Bool)

(declare-fun call!3731 () Bool)

(assert (=> b!47804 (= e!30641 call!3731)))

(declare-fun d!9473 () Bool)

(declare-fun res!27789 () Bool)

(assert (=> d!9473 (=> res!27789 e!30640)))

(assert (=> d!9473 (= res!27789 (bvsge #b00000000000000000000000000000000 (size!1740 _keys!1940)))))

(assert (=> d!9473 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30640)))

(declare-fun b!47805 () Bool)

(assert (=> b!47805 (= e!30642 call!3731)))

(declare-fun bm!3728 () Bool)

(assert (=> bm!3728 (= call!3731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(assert (= (and d!9473 (not res!27789)) b!47803))

(assert (= (and b!47803 c!6425) b!47802))

(assert (= (and b!47803 (not c!6425)) b!47804))

(assert (= (and b!47802 res!27790) b!47805))

(assert (= (or b!47805 b!47804) bm!3728))

(assert (=> b!47802 m!41757))

(declare-fun m!41779 () Bool)

(assert (=> b!47802 m!41779))

(declare-fun m!41781 () Bool)

(assert (=> b!47802 m!41781))

(assert (=> b!47802 m!41757))

(declare-fun m!41783 () Bool)

(assert (=> b!47802 m!41783))

(assert (=> b!47803 m!41757))

(assert (=> b!47803 m!41757))

(assert (=> b!47803 m!41759))

(declare-fun m!41785 () Bool)

(assert (=> bm!3728 m!41785))

(assert (=> b!47671 d!9473))

(declare-fun b!47812 () Bool)

(declare-fun e!30647 () Bool)

(assert (=> b!47812 (= e!30647 tp_is_empty!2059)))

(declare-fun mapNonEmpty!2141 () Bool)

(declare-fun mapRes!2141 () Bool)

(declare-fun tp!6290 () Bool)

(assert (=> mapNonEmpty!2141 (= mapRes!2141 (and tp!6290 e!30647))))

(declare-fun mapKey!2141 () (_ BitVec 32))

(declare-fun mapValue!2141 () ValueCell!740)

(declare-fun mapRest!2141 () (Array (_ BitVec 32) ValueCell!740))

(assert (=> mapNonEmpty!2141 (= mapRest!2132 (store mapRest!2141 mapKey!2141 mapValue!2141))))

(declare-fun b!47813 () Bool)

(declare-fun e!30648 () Bool)

(assert (=> b!47813 (= e!30648 tp_is_empty!2059)))

(declare-fun mapIsEmpty!2141 () Bool)

(assert (=> mapIsEmpty!2141 mapRes!2141))

(declare-fun condMapEmpty!2141 () Bool)

(declare-fun mapDefault!2141 () ValueCell!740)

(assert (=> mapNonEmpty!2132 (= condMapEmpty!2141 (= mapRest!2132 ((as const (Array (_ BitVec 32) ValueCell!740)) mapDefault!2141)))))

(assert (=> mapNonEmpty!2132 (= tp!6281 (and e!30648 mapRes!2141))))

(assert (= (and mapNonEmpty!2132 condMapEmpty!2141) mapIsEmpty!2141))

(assert (= (and mapNonEmpty!2132 (not condMapEmpty!2141)) mapNonEmpty!2141))

(assert (= (and mapNonEmpty!2141 ((_ is ValueCellFull!740) mapValue!2141)) b!47812))

(assert (= (and mapNonEmpty!2132 ((_ is ValueCellFull!740) mapDefault!2141)) b!47813))

(declare-fun m!41787 () Bool)

(assert (=> mapNonEmpty!2141 m!41787))

(check-sat (not b!47772) (not b!47788) (not b!47775) (not mapNonEmpty!2141) (not d!9469) tp_is_empty!2059 (not b!47802) (not bm!3725) (not b!47803) (not bm!3728) (not b!47771))
(check-sat)
