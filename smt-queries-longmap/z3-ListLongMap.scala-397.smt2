; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7424 () Bool)

(assert start!7424)

(declare-fun b!47654 () Bool)

(declare-fun e!30550 () Bool)

(declare-fun call!3726 () Bool)

(assert (=> b!47654 (= e!30550 (not call!3726))))

(declare-fun b!47655 () Bool)

(declare-fun res!27737 () Bool)

(declare-fun e!30546 () Bool)

(assert (=> b!47655 (=> (not res!27737) (not e!30546))))

(declare-datatypes ((array!3158 0))(
  ( (array!3159 (arr!1513 (Array (_ BitVec 32) (_ BitVec 64))) (size!1736 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3158)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3158 (_ BitVec 32)) Bool)

(assert (=> b!47655 (= res!27737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47657 () Bool)

(declare-fun e!30549 () Bool)

(declare-fun e!30548 () Bool)

(assert (=> b!47657 (= e!30549 e!30548)))

(declare-fun c!6391 () Bool)

(declare-datatypes ((SeekEntryResult!212 0))(
  ( (MissingZero!212 (index!2970 (_ BitVec 32))) (Found!212 (index!2971 (_ BitVec 32))) (Intermediate!212 (undefined!1024 Bool) (index!2972 (_ BitVec 32)) (x!8791 (_ BitVec 32))) (Undefined!212) (MissingVacant!212 (index!2973 (_ BitVec 32))) )
))
(declare-fun lt!20434 () SeekEntryResult!212)

(get-info :version)

(assert (=> b!47657 (= c!6391 ((_ is Found!212) lt!20434))))

(declare-fun mapIsEmpty!2132 () Bool)

(declare-fun mapRes!2132 () Bool)

(assert (=> mapIsEmpty!2132 mapRes!2132))

(declare-fun b!47658 () Bool)

(declare-fun e!30545 () Bool)

(declare-fun tp_is_empty!2059 () Bool)

(assert (=> b!47658 (= e!30545 tp_is_empty!2059)))

(declare-fun b!47659 () Bool)

(declare-fun res!27733 () Bool)

(assert (=> b!47659 (=> (not res!27733) (not e!30546))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-datatypes ((V!2479 0))(
  ( (V!2480 (val!1068 Int)) )
))
(declare-datatypes ((ValueCell!740 0))(
  ( (ValueCellFull!740 (v!2127 V!2479)) (EmptyCell!740) )
))
(declare-datatypes ((array!3160 0))(
  ( (array!3161 (arr!1514 (Array (_ BitVec 32) ValueCell!740)) (size!1737 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3160)

(assert (=> b!47659 (= res!27733 (and (= (size!1737 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1736 _keys!1940) (size!1737 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47660 () Bool)

(assert (=> b!47660 (= e!30546 e!30549)))

(declare-fun res!27735 () Bool)

(assert (=> b!47660 (=> (not res!27735) (not e!30549))))

(assert (=> b!47660 (= res!27735 (not ((_ is Undefined!212) lt!20434)))))

(declare-fun k0!1421 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3158 (_ BitVec 32)) SeekEntryResult!212)

(assert (=> b!47660 (= lt!20434 (seekEntryOrOpen!0 k0!1421 _keys!1940 mask!2458))))

(declare-fun b!47661 () Bool)

(assert (=> b!47661 (= e!30548 e!30550)))

(declare-fun c!6390 () Bool)

(assert (=> b!47661 (= c!6390 ((_ is MissingVacant!212) lt!20434))))

(declare-fun b!47662 () Bool)

(declare-fun e!30544 () Bool)

(assert (=> b!47662 (= e!30544 tp_is_empty!2059)))

(declare-fun b!47663 () Bool)

(declare-fun e!30547 () Bool)

(assert (=> b!47663 (= e!30547 (not call!3726))))

(declare-fun b!47664 () Bool)

(declare-fun e!30552 () Bool)

(assert (=> b!47664 (= e!30552 (and e!30545 mapRes!2132))))

(declare-fun condMapEmpty!2132 () Bool)

(declare-fun mapDefault!2132 () ValueCell!740)

(assert (=> b!47664 (= condMapEmpty!2132 (= (arr!1514 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!740)) mapDefault!2132)))))

(declare-fun b!47656 () Bool)

(declare-fun res!27732 () Bool)

(assert (=> b!47656 (=> (not res!27732) (not e!30546))))

(declare-datatypes ((List!1261 0))(
  ( (Nil!1258) (Cons!1257 (h!1837 (_ BitVec 64)) (t!4288 List!1261)) )
))
(declare-fun arrayNoDuplicates!0 (array!3158 (_ BitVec 32) List!1261) Bool)

(assert (=> b!47656 (= res!27732 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1258))))

(declare-fun res!27736 () Bool)

(assert (=> start!7424 (=> (not res!27736) (not e!30546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7424 (= res!27736 (validMask!0 mask!2458))))

(assert (=> start!7424 e!30546))

(assert (=> start!7424 true))

(declare-fun array_inv!914 (array!3158) Bool)

(assert (=> start!7424 (array_inv!914 _keys!1940)))

(declare-fun array_inv!915 (array!3160) Bool)

(assert (=> start!7424 (and (array_inv!915 _values!1550) e!30552)))

(declare-fun b!47665 () Bool)

(declare-fun res!27738 () Bool)

(assert (=> b!47665 (=> (not res!27738) (not e!30546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47665 (= res!27738 (validKeyInArray!0 k0!1421))))

(declare-fun mapNonEmpty!2132 () Bool)

(declare-fun tp!6281 () Bool)

(assert (=> mapNonEmpty!2132 (= mapRes!2132 (and tp!6281 e!30544))))

(declare-fun mapValue!2132 () ValueCell!740)

(declare-fun mapKey!2132 () (_ BitVec 32))

(declare-fun mapRest!2132 () (Array (_ BitVec 32) ValueCell!740))

(assert (=> mapNonEmpty!2132 (= (arr!1514 _values!1550) (store mapRest!2132 mapKey!2132 mapValue!2132))))

(declare-fun bm!3722 () Bool)

(declare-fun call!3725 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3722 (= call!3725 (inRange!0 (ite c!6391 (index!2971 lt!20434) (ite c!6390 (index!2973 lt!20434) (index!2970 lt!20434))) mask!2458))))

(declare-fun b!47666 () Bool)

(declare-fun res!27734 () Bool)

(assert (=> b!47666 (=> res!27734 e!30547)))

(assert (=> b!47666 (= res!27734 (not ((_ is MissingZero!212) lt!20434)))))

(assert (=> b!47666 (= e!30550 e!30547)))

(declare-fun bm!3723 () Bool)

(assert (=> bm!3723 (= call!3726 call!3725)))

(declare-fun b!47667 () Bool)

(assert (=> b!47667 (= e!30548 (not call!3725))))

(assert (= (and start!7424 res!27736) b!47659))

(assert (= (and b!47659 res!27733) b!47655))

(assert (= (and b!47655 res!27737) b!47656))

(assert (= (and b!47656 res!27732) b!47665))

(assert (= (and b!47665 res!27738) b!47660))

(assert (= (and b!47660 res!27735) b!47657))

(assert (= (and b!47657 c!6391) b!47667))

(assert (= (and b!47657 (not c!6391)) b!47661))

(assert (= (and b!47661 c!6390) b!47654))

(assert (= (and b!47661 (not c!6390)) b!47666))

(assert (= (and b!47666 (not res!27734)) b!47663))

(assert (= (or b!47654 b!47663) bm!3723))

(assert (= (or b!47667 bm!3723) bm!3722))

(assert (= (and b!47664 condMapEmpty!2132) mapIsEmpty!2132))

(assert (= (and b!47664 (not condMapEmpty!2132)) mapNonEmpty!2132))

(assert (= (and mapNonEmpty!2132 ((_ is ValueCellFull!740) mapValue!2132)) b!47662))

(assert (= (and b!47664 ((_ is ValueCellFull!740) mapDefault!2132)) b!47658))

(assert (= start!7424 b!47664))

(declare-fun m!41745 () Bool)

(assert (=> b!47665 m!41745))

(declare-fun m!41747 () Bool)

(assert (=> start!7424 m!41747))

(declare-fun m!41749 () Bool)

(assert (=> start!7424 m!41749))

(declare-fun m!41751 () Bool)

(assert (=> start!7424 m!41751))

(declare-fun m!41753 () Bool)

(assert (=> b!47660 m!41753))

(declare-fun m!41755 () Bool)

(assert (=> mapNonEmpty!2132 m!41755))

(declare-fun m!41757 () Bool)

(assert (=> b!47656 m!41757))

(declare-fun m!41759 () Bool)

(assert (=> b!47655 m!41759))

(declare-fun m!41761 () Bool)

(assert (=> bm!3722 m!41761))

(check-sat (not bm!3722) tp_is_empty!2059 (not mapNonEmpty!2132) (not b!47655) (not start!7424) (not b!47656) (not b!47660) (not b!47665))
(check-sat)
(get-model)

(declare-fun d!9445 () Bool)

(declare-fun res!27787 () Bool)

(declare-fun e!30617 () Bool)

(assert (=> d!9445 (=> res!27787 e!30617)))

(assert (=> d!9445 (= res!27787 (bvsge #b00000000000000000000000000000000 (size!1736 _keys!1940)))))

(assert (=> d!9445 (= (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1258) e!30617)))

(declare-fun b!47762 () Bool)

(declare-fun e!30616 () Bool)

(declare-fun call!3741 () Bool)

(assert (=> b!47762 (= e!30616 call!3741)))

(declare-fun b!47763 () Bool)

(assert (=> b!47763 (= e!30616 call!3741)))

(declare-fun b!47764 () Bool)

(declare-fun e!30615 () Bool)

(assert (=> b!47764 (= e!30617 e!30615)))

(declare-fun res!27789 () Bool)

(assert (=> b!47764 (=> (not res!27789) (not e!30615))))

(declare-fun e!30618 () Bool)

(assert (=> b!47764 (= res!27789 (not e!30618))))

(declare-fun res!27788 () Bool)

(assert (=> b!47764 (=> (not res!27788) (not e!30618))))

(assert (=> b!47764 (= res!27788 (validKeyInArray!0 (select (arr!1513 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun bm!3738 () Bool)

(declare-fun c!6406 () Bool)

(assert (=> bm!3738 (= call!3741 (arrayNoDuplicates!0 _keys!1940 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6406 (Cons!1257 (select (arr!1513 _keys!1940) #b00000000000000000000000000000000) Nil!1258) Nil!1258)))))

(declare-fun b!47765 () Bool)

(assert (=> b!47765 (= e!30615 e!30616)))

(assert (=> b!47765 (= c!6406 (validKeyInArray!0 (select (arr!1513 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun b!47766 () Bool)

(declare-fun contains!584 (List!1261 (_ BitVec 64)) Bool)

(assert (=> b!47766 (= e!30618 (contains!584 Nil!1258 (select (arr!1513 _keys!1940) #b00000000000000000000000000000000)))))

(assert (= (and d!9445 (not res!27787)) b!47764))

(assert (= (and b!47764 res!27788) b!47766))

(assert (= (and b!47764 res!27789) b!47765))

(assert (= (and b!47765 c!6406) b!47763))

(assert (= (and b!47765 (not c!6406)) b!47762))

(assert (= (or b!47763 b!47762) bm!3738))

(declare-fun m!41799 () Bool)

(assert (=> b!47764 m!41799))

(assert (=> b!47764 m!41799))

(declare-fun m!41801 () Bool)

(assert (=> b!47764 m!41801))

(assert (=> bm!3738 m!41799))

(declare-fun m!41803 () Bool)

(assert (=> bm!3738 m!41803))

(assert (=> b!47765 m!41799))

(assert (=> b!47765 m!41799))

(assert (=> b!47765 m!41801))

(assert (=> b!47766 m!41799))

(assert (=> b!47766 m!41799))

(declare-fun m!41805 () Bool)

(assert (=> b!47766 m!41805))

(assert (=> b!47656 d!9445))

(declare-fun d!9447 () Bool)

(assert (=> d!9447 (= (validKeyInArray!0 k0!1421) (and (not (= k0!1421 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1421 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!47665 d!9447))

(declare-fun b!47779 () Bool)

(declare-fun e!30626 () SeekEntryResult!212)

(declare-fun lt!20447 () SeekEntryResult!212)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3158 (_ BitVec 32)) SeekEntryResult!212)

(assert (=> b!47779 (= e!30626 (seekKeyOrZeroReturnVacant!0 (x!8791 lt!20447) (index!2972 lt!20447) (index!2972 lt!20447) k0!1421 _keys!1940 mask!2458))))

(declare-fun b!47780 () Bool)

(assert (=> b!47780 (= e!30626 (MissingZero!212 (index!2972 lt!20447)))))

(declare-fun b!47781 () Bool)

(declare-fun c!6415 () Bool)

(declare-fun lt!20449 () (_ BitVec 64))

(assert (=> b!47781 (= c!6415 (= lt!20449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30625 () SeekEntryResult!212)

(assert (=> b!47781 (= e!30625 e!30626)))

(declare-fun b!47782 () Bool)

(declare-fun e!30627 () SeekEntryResult!212)

(assert (=> b!47782 (= e!30627 e!30625)))

(assert (=> b!47782 (= lt!20449 (select (arr!1513 _keys!1940) (index!2972 lt!20447)))))

(declare-fun c!6413 () Bool)

(assert (=> b!47782 (= c!6413 (= lt!20449 k0!1421))))

(declare-fun d!9449 () Bool)

(declare-fun lt!20448 () SeekEntryResult!212)

(assert (=> d!9449 (and (or ((_ is Undefined!212) lt!20448) (not ((_ is Found!212) lt!20448)) (and (bvsge (index!2971 lt!20448) #b00000000000000000000000000000000) (bvslt (index!2971 lt!20448) (size!1736 _keys!1940)))) (or ((_ is Undefined!212) lt!20448) ((_ is Found!212) lt!20448) (not ((_ is MissingZero!212) lt!20448)) (and (bvsge (index!2970 lt!20448) #b00000000000000000000000000000000) (bvslt (index!2970 lt!20448) (size!1736 _keys!1940)))) (or ((_ is Undefined!212) lt!20448) ((_ is Found!212) lt!20448) ((_ is MissingZero!212) lt!20448) (not ((_ is MissingVacant!212) lt!20448)) (and (bvsge (index!2973 lt!20448) #b00000000000000000000000000000000) (bvslt (index!2973 lt!20448) (size!1736 _keys!1940)))) (or ((_ is Undefined!212) lt!20448) (ite ((_ is Found!212) lt!20448) (= (select (arr!1513 _keys!1940) (index!2971 lt!20448)) k0!1421) (ite ((_ is MissingZero!212) lt!20448) (= (select (arr!1513 _keys!1940) (index!2970 lt!20448)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!212) lt!20448) (= (select (arr!1513 _keys!1940) (index!2973 lt!20448)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!9449 (= lt!20448 e!30627)))

(declare-fun c!6414 () Bool)

(assert (=> d!9449 (= c!6414 (and ((_ is Intermediate!212) lt!20447) (undefined!1024 lt!20447)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3158 (_ BitVec 32)) SeekEntryResult!212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!9449 (= lt!20447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1421 mask!2458) k0!1421 _keys!1940 mask!2458))))

(assert (=> d!9449 (validMask!0 mask!2458)))

(assert (=> d!9449 (= (seekEntryOrOpen!0 k0!1421 _keys!1940 mask!2458) lt!20448)))

(declare-fun b!47783 () Bool)

(assert (=> b!47783 (= e!30625 (Found!212 (index!2972 lt!20447)))))

(declare-fun b!47784 () Bool)

(assert (=> b!47784 (= e!30627 Undefined!212)))

(assert (= (and d!9449 c!6414) b!47784))

(assert (= (and d!9449 (not c!6414)) b!47782))

(assert (= (and b!47782 c!6413) b!47783))

(assert (= (and b!47782 (not c!6413)) b!47781))

(assert (= (and b!47781 c!6415) b!47780))

(assert (= (and b!47781 (not c!6415)) b!47779))

(declare-fun m!41807 () Bool)

(assert (=> b!47779 m!41807))

(declare-fun m!41809 () Bool)

(assert (=> b!47782 m!41809))

(declare-fun m!41811 () Bool)

(assert (=> d!9449 m!41811))

(declare-fun m!41813 () Bool)

(assert (=> d!9449 m!41813))

(declare-fun m!41815 () Bool)

(assert (=> d!9449 m!41815))

(declare-fun m!41817 () Bool)

(assert (=> d!9449 m!41817))

(assert (=> d!9449 m!41813))

(declare-fun m!41819 () Bool)

(assert (=> d!9449 m!41819))

(assert (=> d!9449 m!41747))

(assert (=> b!47660 d!9449))

(declare-fun d!9451 () Bool)

(assert (=> d!9451 (= (inRange!0 (ite c!6391 (index!2971 lt!20434) (ite c!6390 (index!2973 lt!20434) (index!2970 lt!20434))) mask!2458) (and (bvsge (ite c!6391 (index!2971 lt!20434) (ite c!6390 (index!2973 lt!20434) (index!2970 lt!20434))) #b00000000000000000000000000000000) (bvslt (ite c!6391 (index!2971 lt!20434) (ite c!6390 (index!2973 lt!20434) (index!2970 lt!20434))) (bvadd mask!2458 #b00000000000000000000000000000001))))))

(assert (=> bm!3722 d!9451))

(declare-fun d!9453 () Bool)

(assert (=> d!9453 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7424 d!9453))

(declare-fun d!9455 () Bool)

(assert (=> d!9455 (= (array_inv!914 _keys!1940) (bvsge (size!1736 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7424 d!9455))

(declare-fun d!9457 () Bool)

(assert (=> d!9457 (= (array_inv!915 _values!1550) (bvsge (size!1737 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7424 d!9457))

(declare-fun d!9459 () Bool)

(declare-fun res!27795 () Bool)

(declare-fun e!30635 () Bool)

(assert (=> d!9459 (=> res!27795 e!30635)))

(assert (=> d!9459 (= res!27795 (bvsge #b00000000000000000000000000000000 (size!1736 _keys!1940)))))

(assert (=> d!9459 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30635)))

(declare-fun b!47793 () Bool)

(declare-fun e!30636 () Bool)

(declare-fun e!30634 () Bool)

(assert (=> b!47793 (= e!30636 e!30634)))

(declare-fun lt!20456 () (_ BitVec 64))

(assert (=> b!47793 (= lt!20456 (select (arr!1513 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1340 0))(
  ( (Unit!1341) )
))
(declare-fun lt!20457 () Unit!1340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3158 (_ BitVec 64) (_ BitVec 32)) Unit!1340)

(assert (=> b!47793 (= lt!20457 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20456 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47793 (arrayContainsKey!0 _keys!1940 lt!20456 #b00000000000000000000000000000000)))

(declare-fun lt!20458 () Unit!1340)

(assert (=> b!47793 (= lt!20458 lt!20457)))

(declare-fun res!27794 () Bool)

(assert (=> b!47793 (= res!27794 (= (seekEntryOrOpen!0 (select (arr!1513 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!212 #b00000000000000000000000000000000)))))

(assert (=> b!47793 (=> (not res!27794) (not e!30634))))

(declare-fun b!47794 () Bool)

(declare-fun call!3744 () Bool)

(assert (=> b!47794 (= e!30634 call!3744)))

(declare-fun b!47795 () Bool)

(assert (=> b!47795 (= e!30636 call!3744)))

(declare-fun b!47796 () Bool)

(assert (=> b!47796 (= e!30635 e!30636)))

(declare-fun c!6418 () Bool)

(assert (=> b!47796 (= c!6418 (validKeyInArray!0 (select (arr!1513 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun bm!3741 () Bool)

(assert (=> bm!3741 (= call!3744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(assert (= (and d!9459 (not res!27795)) b!47796))

(assert (= (and b!47796 c!6418) b!47793))

(assert (= (and b!47796 (not c!6418)) b!47795))

(assert (= (and b!47793 res!27794) b!47794))

(assert (= (or b!47794 b!47795) bm!3741))

(assert (=> b!47793 m!41799))

(declare-fun m!41821 () Bool)

(assert (=> b!47793 m!41821))

(declare-fun m!41823 () Bool)

(assert (=> b!47793 m!41823))

(assert (=> b!47793 m!41799))

(declare-fun m!41825 () Bool)

(assert (=> b!47793 m!41825))

(assert (=> b!47796 m!41799))

(assert (=> b!47796 m!41799))

(assert (=> b!47796 m!41801))

(declare-fun m!41827 () Bool)

(assert (=> bm!3741 m!41827))

(assert (=> b!47655 d!9459))

(declare-fun mapIsEmpty!2141 () Bool)

(declare-fun mapRes!2141 () Bool)

(assert (=> mapIsEmpty!2141 mapRes!2141))

(declare-fun condMapEmpty!2141 () Bool)

(declare-fun mapDefault!2141 () ValueCell!740)

(assert (=> mapNonEmpty!2132 (= condMapEmpty!2141 (= mapRest!2132 ((as const (Array (_ BitVec 32) ValueCell!740)) mapDefault!2141)))))

(declare-fun e!30641 () Bool)

(assert (=> mapNonEmpty!2132 (= tp!6281 (and e!30641 mapRes!2141))))

(declare-fun b!47803 () Bool)

(declare-fun e!30642 () Bool)

(assert (=> b!47803 (= e!30642 tp_is_empty!2059)))

(declare-fun mapNonEmpty!2141 () Bool)

(declare-fun tp!6290 () Bool)

(assert (=> mapNonEmpty!2141 (= mapRes!2141 (and tp!6290 e!30642))))

(declare-fun mapRest!2141 () (Array (_ BitVec 32) ValueCell!740))

(declare-fun mapValue!2141 () ValueCell!740)

(declare-fun mapKey!2141 () (_ BitVec 32))

(assert (=> mapNonEmpty!2141 (= mapRest!2132 (store mapRest!2141 mapKey!2141 mapValue!2141))))

(declare-fun b!47804 () Bool)

(assert (=> b!47804 (= e!30641 tp_is_empty!2059)))

(assert (= (and mapNonEmpty!2132 condMapEmpty!2141) mapIsEmpty!2141))

(assert (= (and mapNonEmpty!2132 (not condMapEmpty!2141)) mapNonEmpty!2141))

(assert (= (and mapNonEmpty!2141 ((_ is ValueCellFull!740) mapValue!2141)) b!47803))

(assert (= (and mapNonEmpty!2132 ((_ is ValueCellFull!740) mapDefault!2141)) b!47804))

(declare-fun m!41829 () Bool)

(assert (=> mapNonEmpty!2141 m!41829))

(check-sat (not bm!3741) (not b!47765) (not b!47766) (not b!47796) tp_is_empty!2059 (not bm!3738) (not b!47764) (not d!9449) (not mapNonEmpty!2141) (not b!47779) (not b!47793))
(check-sat)
