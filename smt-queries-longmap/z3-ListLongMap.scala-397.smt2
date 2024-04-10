; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7424 () Bool)

(assert start!7424)

(declare-fun b!47762 () Bool)

(declare-fun res!27773 () Bool)

(declare-fun e!30615 () Bool)

(assert (=> b!47762 (=> (not res!27773) (not e!30615))))

(declare-datatypes ((array!3183 0))(
  ( (array!3184 (arr!1526 (Array (_ BitVec 32) (_ BitVec 64))) (size!1748 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3183)

(declare-datatypes ((List!1267 0))(
  ( (Nil!1264) (Cons!1263 (h!1843 (_ BitVec 64)) (t!4295 List!1267)) )
))
(declare-fun arrayNoDuplicates!0 (array!3183 (_ BitVec 32) List!1267) Bool)

(assert (=> b!47762 (= res!27773 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1264))))

(declare-fun b!47763 () Bool)

(declare-fun res!27774 () Bool)

(assert (=> b!47763 (=> (not res!27774) (not e!30615))))

(declare-fun k0!1421 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47763 (= res!27774 (validKeyInArray!0 k0!1421))))

(declare-fun b!47764 () Bool)

(declare-fun e!30620 () Bool)

(declare-fun call!3732 () Bool)

(assert (=> b!47764 (= e!30620 (not call!3732))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!210 0))(
  ( (MissingZero!210 (index!2962 (_ BitVec 32))) (Found!210 (index!2963 (_ BitVec 32))) (Intermediate!210 (undefined!1022 Bool) (index!2964 (_ BitVec 32)) (x!8790 (_ BitVec 32))) (Undefined!210) (MissingVacant!210 (index!2965 (_ BitVec 32))) )
))
(declare-fun lt!20453 () SeekEntryResult!210)

(declare-fun bm!3729 () Bool)

(declare-fun c!6419 () Bool)

(declare-fun c!6420 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3729 (= call!3732 (inRange!0 (ite c!6420 (index!2963 lt!20453) (ite c!6419 (index!2965 lt!20453) (index!2962 lt!20453))) mask!2458))))

(declare-fun b!47765 () Bool)

(declare-fun e!30616 () Bool)

(declare-fun call!3733 () Bool)

(assert (=> b!47765 (= e!30616 (not call!3733))))

(declare-fun mapIsEmpty!2135 () Bool)

(declare-fun mapRes!2135 () Bool)

(assert (=> mapIsEmpty!2135 mapRes!2135))

(declare-fun b!47766 () Bool)

(declare-fun e!30622 () Bool)

(assert (=> b!47766 (= e!30620 e!30622)))

(get-info :version)

(assert (=> b!47766 (= c!6419 ((_ is MissingVacant!210) lt!20453))))

(declare-fun b!47767 () Bool)

(declare-fun e!30619 () Bool)

(declare-fun tp_is_empty!2061 () Bool)

(assert (=> b!47767 (= e!30619 tp_is_empty!2061)))

(declare-fun bm!3730 () Bool)

(assert (=> bm!3730 (= call!3733 call!3732)))

(declare-fun b!47769 () Bool)

(declare-fun res!27779 () Bool)

(assert (=> b!47769 (=> (not res!27779) (not e!30615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3183 (_ BitVec 32)) Bool)

(assert (=> b!47769 (= res!27779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47770 () Bool)

(declare-fun res!27775 () Bool)

(assert (=> b!47770 (=> res!27775 e!30616)))

(assert (=> b!47770 (= res!27775 (not ((_ is MissingZero!210) lt!20453)))))

(assert (=> b!47770 (= e!30622 e!30616)))

(declare-fun mapNonEmpty!2135 () Bool)

(declare-fun tp!6284 () Bool)

(assert (=> mapNonEmpty!2135 (= mapRes!2135 (and tp!6284 e!30619))))

(declare-fun mapKey!2135 () (_ BitVec 32))

(declare-datatypes ((V!2481 0))(
  ( (V!2482 (val!1069 Int)) )
))
(declare-datatypes ((ValueCell!741 0))(
  ( (ValueCellFull!741 (v!2130 V!2481)) (EmptyCell!741) )
))
(declare-fun mapRest!2135 () (Array (_ BitVec 32) ValueCell!741))

(declare-datatypes ((array!3185 0))(
  ( (array!3186 (arr!1527 (Array (_ BitVec 32) ValueCell!741)) (size!1749 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3185)

(declare-fun mapValue!2135 () ValueCell!741)

(assert (=> mapNonEmpty!2135 (= (arr!1527 _values!1550) (store mapRest!2135 mapKey!2135 mapValue!2135))))

(declare-fun b!47771 () Bool)

(declare-fun e!30621 () Bool)

(assert (=> b!47771 (= e!30615 e!30621)))

(declare-fun res!27778 () Bool)

(assert (=> b!47771 (=> (not res!27778) (not e!30621))))

(assert (=> b!47771 (= res!27778 (not ((_ is Undefined!210) lt!20453)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3183 (_ BitVec 32)) SeekEntryResult!210)

(assert (=> b!47771 (= lt!20453 (seekEntryOrOpen!0 k0!1421 _keys!1940 mask!2458))))

(declare-fun b!47772 () Bool)

(declare-fun e!30617 () Bool)

(declare-fun e!30614 () Bool)

(assert (=> b!47772 (= e!30617 (and e!30614 mapRes!2135))))

(declare-fun condMapEmpty!2135 () Bool)

(declare-fun mapDefault!2135 () ValueCell!741)

(assert (=> b!47772 (= condMapEmpty!2135 (= (arr!1527 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!741)) mapDefault!2135)))))

(declare-fun b!47773 () Bool)

(assert (=> b!47773 (= e!30622 (not call!3733))))

(declare-fun b!47774 () Bool)

(assert (=> b!47774 (= e!30614 tp_is_empty!2061)))

(declare-fun b!47775 () Bool)

(declare-fun res!27777 () Bool)

(assert (=> b!47775 (=> (not res!27777) (not e!30615))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47775 (= res!27777 (and (= (size!1749 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1748 _keys!1940) (size!1749 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47768 () Bool)

(assert (=> b!47768 (= e!30621 e!30620)))

(assert (=> b!47768 (= c!6420 ((_ is Found!210) lt!20453))))

(declare-fun res!27776 () Bool)

(assert (=> start!7424 (=> (not res!27776) (not e!30615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7424 (= res!27776 (validMask!0 mask!2458))))

(assert (=> start!7424 e!30615))

(assert (=> start!7424 true))

(declare-fun array_inv!922 (array!3183) Bool)

(assert (=> start!7424 (array_inv!922 _keys!1940)))

(declare-fun array_inv!923 (array!3185) Bool)

(assert (=> start!7424 (and (array_inv!923 _values!1550) e!30617)))

(assert (= (and start!7424 res!27776) b!47775))

(assert (= (and b!47775 res!27777) b!47769))

(assert (= (and b!47769 res!27779) b!47762))

(assert (= (and b!47762 res!27773) b!47763))

(assert (= (and b!47763 res!27774) b!47771))

(assert (= (and b!47771 res!27778) b!47768))

(assert (= (and b!47768 c!6420) b!47764))

(assert (= (and b!47768 (not c!6420)) b!47766))

(assert (= (and b!47766 c!6419) b!47773))

(assert (= (and b!47766 (not c!6419)) b!47770))

(assert (= (and b!47770 (not res!27775)) b!47765))

(assert (= (or b!47773 b!47765) bm!3730))

(assert (= (or b!47764 bm!3730) bm!3729))

(assert (= (and b!47772 condMapEmpty!2135) mapIsEmpty!2135))

(assert (= (and b!47772 (not condMapEmpty!2135)) mapNonEmpty!2135))

(assert (= (and mapNonEmpty!2135 ((_ is ValueCellFull!741) mapValue!2135)) b!47767))

(assert (= (and b!47772 ((_ is ValueCellFull!741) mapDefault!2135)) b!47774))

(assert (= start!7424 b!47772))

(declare-fun m!41845 () Bool)

(assert (=> b!47762 m!41845))

(declare-fun m!41847 () Bool)

(assert (=> start!7424 m!41847))

(declare-fun m!41849 () Bool)

(assert (=> start!7424 m!41849))

(declare-fun m!41851 () Bool)

(assert (=> start!7424 m!41851))

(declare-fun m!41853 () Bool)

(assert (=> b!47763 m!41853))

(declare-fun m!41855 () Bool)

(assert (=> mapNonEmpty!2135 m!41855))

(declare-fun m!41857 () Bool)

(assert (=> bm!3729 m!41857))

(declare-fun m!41859 () Bool)

(assert (=> b!47769 m!41859))

(declare-fun m!41861 () Bool)

(assert (=> b!47771 m!41861))

(check-sat (not mapNonEmpty!2135) (not start!7424) (not bm!3729) (not b!47763) tp_is_empty!2061 (not b!47769) (not b!47762) (not b!47771))
(check-sat)
(get-model)

(declare-fun b!47830 () Bool)

(declare-fun e!30657 () SeekEntryResult!210)

(declare-fun lt!20463 () SeekEntryResult!210)

(assert (=> b!47830 (= e!30657 (MissingZero!210 (index!2964 lt!20463)))))

(declare-fun d!9471 () Bool)

(declare-fun lt!20465 () SeekEntryResult!210)

(assert (=> d!9471 (and (or ((_ is Undefined!210) lt!20465) (not ((_ is Found!210) lt!20465)) (and (bvsge (index!2963 lt!20465) #b00000000000000000000000000000000) (bvslt (index!2963 lt!20465) (size!1748 _keys!1940)))) (or ((_ is Undefined!210) lt!20465) ((_ is Found!210) lt!20465) (not ((_ is MissingZero!210) lt!20465)) (and (bvsge (index!2962 lt!20465) #b00000000000000000000000000000000) (bvslt (index!2962 lt!20465) (size!1748 _keys!1940)))) (or ((_ is Undefined!210) lt!20465) ((_ is Found!210) lt!20465) ((_ is MissingZero!210) lt!20465) (not ((_ is MissingVacant!210) lt!20465)) (and (bvsge (index!2965 lt!20465) #b00000000000000000000000000000000) (bvslt (index!2965 lt!20465) (size!1748 _keys!1940)))) (or ((_ is Undefined!210) lt!20465) (ite ((_ is Found!210) lt!20465) (= (select (arr!1526 _keys!1940) (index!2963 lt!20465)) k0!1421) (ite ((_ is MissingZero!210) lt!20465) (= (select (arr!1526 _keys!1940) (index!2962 lt!20465)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!210) lt!20465) (= (select (arr!1526 _keys!1940) (index!2965 lt!20465)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!30656 () SeekEntryResult!210)

(assert (=> d!9471 (= lt!20465 e!30656)))

(declare-fun c!6435 () Bool)

(assert (=> d!9471 (= c!6435 (and ((_ is Intermediate!210) lt!20463) (undefined!1022 lt!20463)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3183 (_ BitVec 32)) SeekEntryResult!210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!9471 (= lt!20463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1421 mask!2458) k0!1421 _keys!1940 mask!2458))))

(assert (=> d!9471 (validMask!0 mask!2458)))

(assert (=> d!9471 (= (seekEntryOrOpen!0 k0!1421 _keys!1940 mask!2458) lt!20465)))

(declare-fun b!47831 () Bool)

(declare-fun e!30658 () SeekEntryResult!210)

(assert (=> b!47831 (= e!30658 (Found!210 (index!2964 lt!20463)))))

(declare-fun b!47832 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3183 (_ BitVec 32)) SeekEntryResult!210)

(assert (=> b!47832 (= e!30657 (seekKeyOrZeroReturnVacant!0 (x!8790 lt!20463) (index!2964 lt!20463) (index!2964 lt!20463) k0!1421 _keys!1940 mask!2458))))

(declare-fun b!47833 () Bool)

(assert (=> b!47833 (= e!30656 e!30658)))

(declare-fun lt!20464 () (_ BitVec 64))

(assert (=> b!47833 (= lt!20464 (select (arr!1526 _keys!1940) (index!2964 lt!20463)))))

(declare-fun c!6434 () Bool)

(assert (=> b!47833 (= c!6434 (= lt!20464 k0!1421))))

(declare-fun b!47834 () Bool)

(declare-fun c!6433 () Bool)

(assert (=> b!47834 (= c!6433 (= lt!20464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!47834 (= e!30658 e!30657)))

(declare-fun b!47835 () Bool)

(assert (=> b!47835 (= e!30656 Undefined!210)))

(assert (= (and d!9471 c!6435) b!47835))

(assert (= (and d!9471 (not c!6435)) b!47833))

(assert (= (and b!47833 c!6434) b!47831))

(assert (= (and b!47833 (not c!6434)) b!47834))

(assert (= (and b!47834 c!6433) b!47830))

(assert (= (and b!47834 (not c!6433)) b!47832))

(assert (=> d!9471 m!41847))

(declare-fun m!41881 () Bool)

(assert (=> d!9471 m!41881))

(declare-fun m!41883 () Bool)

(assert (=> d!9471 m!41883))

(declare-fun m!41885 () Bool)

(assert (=> d!9471 m!41885))

(declare-fun m!41887 () Bool)

(assert (=> d!9471 m!41887))

(declare-fun m!41889 () Bool)

(assert (=> d!9471 m!41889))

(assert (=> d!9471 m!41885))

(declare-fun m!41891 () Bool)

(assert (=> b!47832 m!41891))

(declare-fun m!41893 () Bool)

(assert (=> b!47833 m!41893))

(assert (=> b!47771 d!9471))

(declare-fun d!9473 () Bool)

(assert (=> d!9473 (= (inRange!0 (ite c!6420 (index!2963 lt!20453) (ite c!6419 (index!2965 lt!20453) (index!2962 lt!20453))) mask!2458) (and (bvsge (ite c!6420 (index!2963 lt!20453) (ite c!6419 (index!2965 lt!20453) (index!2962 lt!20453))) #b00000000000000000000000000000000) (bvslt (ite c!6420 (index!2963 lt!20453) (ite c!6419 (index!2965 lt!20453) (index!2962 lt!20453))) (bvadd mask!2458 #b00000000000000000000000000000001))))))

(assert (=> bm!3729 d!9473))

(declare-fun d!9475 () Bool)

(assert (=> d!9475 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7424 d!9475))

(declare-fun d!9477 () Bool)

(assert (=> d!9477 (= (array_inv!922 _keys!1940) (bvsge (size!1748 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7424 d!9477))

(declare-fun d!9479 () Bool)

(assert (=> d!9479 (= (array_inv!923 _values!1550) (bvsge (size!1749 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7424 d!9479))

(declare-fun b!47846 () Bool)

(declare-fun e!30670 () Bool)

(declare-fun call!3742 () Bool)

(assert (=> b!47846 (= e!30670 call!3742)))

(declare-fun bm!3739 () Bool)

(declare-fun c!6438 () Bool)

(assert (=> bm!3739 (= call!3742 (arrayNoDuplicates!0 _keys!1940 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6438 (Cons!1263 (select (arr!1526 _keys!1940) #b00000000000000000000000000000000) Nil!1264) Nil!1264)))))

(declare-fun b!47847 () Bool)

(declare-fun e!30669 () Bool)

(assert (=> b!47847 (= e!30669 e!30670)))

(assert (=> b!47847 (= c!6438 (validKeyInArray!0 (select (arr!1526 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun b!47848 () Bool)

(declare-fun e!30668 () Bool)

(declare-fun contains!587 (List!1267 (_ BitVec 64)) Bool)

(assert (=> b!47848 (= e!30668 (contains!587 Nil!1264 (select (arr!1526 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun d!9481 () Bool)

(declare-fun res!27808 () Bool)

(declare-fun e!30667 () Bool)

(assert (=> d!9481 (=> res!27808 e!30667)))

(assert (=> d!9481 (= res!27808 (bvsge #b00000000000000000000000000000000 (size!1748 _keys!1940)))))

(assert (=> d!9481 (= (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1264) e!30667)))

(declare-fun b!47849 () Bool)

(assert (=> b!47849 (= e!30667 e!30669)))

(declare-fun res!27809 () Bool)

(assert (=> b!47849 (=> (not res!27809) (not e!30669))))

(assert (=> b!47849 (= res!27809 (not e!30668))))

(declare-fun res!27807 () Bool)

(assert (=> b!47849 (=> (not res!27807) (not e!30668))))

(assert (=> b!47849 (= res!27807 (validKeyInArray!0 (select (arr!1526 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun b!47850 () Bool)

(assert (=> b!47850 (= e!30670 call!3742)))

(assert (= (and d!9481 (not res!27808)) b!47849))

(assert (= (and b!47849 res!27807) b!47848))

(assert (= (and b!47849 res!27809) b!47847))

(assert (= (and b!47847 c!6438) b!47846))

(assert (= (and b!47847 (not c!6438)) b!47850))

(assert (= (or b!47846 b!47850) bm!3739))

(declare-fun m!41895 () Bool)

(assert (=> bm!3739 m!41895))

(declare-fun m!41897 () Bool)

(assert (=> bm!3739 m!41897))

(assert (=> b!47847 m!41895))

(assert (=> b!47847 m!41895))

(declare-fun m!41899 () Bool)

(assert (=> b!47847 m!41899))

(assert (=> b!47848 m!41895))

(assert (=> b!47848 m!41895))

(declare-fun m!41901 () Bool)

(assert (=> b!47848 m!41901))

(assert (=> b!47849 m!41895))

(assert (=> b!47849 m!41895))

(assert (=> b!47849 m!41899))

(assert (=> b!47762 d!9481))

(declare-fun bm!3742 () Bool)

(declare-fun call!3745 () Bool)

(assert (=> bm!3742 (= call!3745 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(declare-fun d!9483 () Bool)

(declare-fun res!27815 () Bool)

(declare-fun e!30677 () Bool)

(assert (=> d!9483 (=> res!27815 e!30677)))

(assert (=> d!9483 (= res!27815 (bvsge #b00000000000000000000000000000000 (size!1748 _keys!1940)))))

(assert (=> d!9483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30677)))

(declare-fun b!47859 () Bool)

(declare-fun e!30678 () Bool)

(assert (=> b!47859 (= e!30677 e!30678)))

(declare-fun c!6441 () Bool)

(assert (=> b!47859 (= c!6441 (validKeyInArray!0 (select (arr!1526 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun b!47860 () Bool)

(declare-fun e!30679 () Bool)

(assert (=> b!47860 (= e!30679 call!3745)))

(declare-fun b!47861 () Bool)

(assert (=> b!47861 (= e!30678 call!3745)))

(declare-fun b!47862 () Bool)

(assert (=> b!47862 (= e!30678 e!30679)))

(declare-fun lt!20473 () (_ BitVec 64))

(assert (=> b!47862 (= lt!20473 (select (arr!1526 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1335 0))(
  ( (Unit!1336) )
))
(declare-fun lt!20474 () Unit!1335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3183 (_ BitVec 64) (_ BitVec 32)) Unit!1335)

(assert (=> b!47862 (= lt!20474 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20473 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47862 (arrayContainsKey!0 _keys!1940 lt!20473 #b00000000000000000000000000000000)))

(declare-fun lt!20472 () Unit!1335)

(assert (=> b!47862 (= lt!20472 lt!20474)))

(declare-fun res!27814 () Bool)

(assert (=> b!47862 (= res!27814 (= (seekEntryOrOpen!0 (select (arr!1526 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!210 #b00000000000000000000000000000000)))))

(assert (=> b!47862 (=> (not res!27814) (not e!30679))))

(assert (= (and d!9483 (not res!27815)) b!47859))

(assert (= (and b!47859 c!6441) b!47862))

(assert (= (and b!47859 (not c!6441)) b!47861))

(assert (= (and b!47862 res!27814) b!47860))

(assert (= (or b!47860 b!47861) bm!3742))

(declare-fun m!41903 () Bool)

(assert (=> bm!3742 m!41903))

(assert (=> b!47859 m!41895))

(assert (=> b!47859 m!41895))

(assert (=> b!47859 m!41899))

(assert (=> b!47862 m!41895))

(declare-fun m!41905 () Bool)

(assert (=> b!47862 m!41905))

(declare-fun m!41907 () Bool)

(assert (=> b!47862 m!41907))

(assert (=> b!47862 m!41895))

(declare-fun m!41909 () Bool)

(assert (=> b!47862 m!41909))

(assert (=> b!47769 d!9483))

(declare-fun d!9485 () Bool)

(assert (=> d!9485 (= (validKeyInArray!0 k0!1421) (and (not (= k0!1421 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1421 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!47763 d!9485))

(declare-fun b!47870 () Bool)

(declare-fun e!30685 () Bool)

(assert (=> b!47870 (= e!30685 tp_is_empty!2061)))

(declare-fun b!47869 () Bool)

(declare-fun e!30684 () Bool)

(assert (=> b!47869 (= e!30684 tp_is_empty!2061)))

(declare-fun mapIsEmpty!2141 () Bool)

(declare-fun mapRes!2141 () Bool)

(assert (=> mapIsEmpty!2141 mapRes!2141))

(declare-fun condMapEmpty!2141 () Bool)

(declare-fun mapDefault!2141 () ValueCell!741)

(assert (=> mapNonEmpty!2135 (= condMapEmpty!2141 (= mapRest!2135 ((as const (Array (_ BitVec 32) ValueCell!741)) mapDefault!2141)))))

(assert (=> mapNonEmpty!2135 (= tp!6284 (and e!30685 mapRes!2141))))

(declare-fun mapNonEmpty!2141 () Bool)

(declare-fun tp!6290 () Bool)

(assert (=> mapNonEmpty!2141 (= mapRes!2141 (and tp!6290 e!30684))))

(declare-fun mapKey!2141 () (_ BitVec 32))

(declare-fun mapValue!2141 () ValueCell!741)

(declare-fun mapRest!2141 () (Array (_ BitVec 32) ValueCell!741))

(assert (=> mapNonEmpty!2141 (= mapRest!2135 (store mapRest!2141 mapKey!2141 mapValue!2141))))

(assert (= (and mapNonEmpty!2135 condMapEmpty!2141) mapIsEmpty!2141))

(assert (= (and mapNonEmpty!2135 (not condMapEmpty!2141)) mapNonEmpty!2141))

(assert (= (and mapNonEmpty!2141 ((_ is ValueCellFull!741) mapValue!2141)) b!47869))

(assert (= (and mapNonEmpty!2135 ((_ is ValueCellFull!741) mapDefault!2141)) b!47870))

(declare-fun m!41911 () Bool)

(assert (=> mapNonEmpty!2141 m!41911))

(check-sat (not mapNonEmpty!2141) (not b!47849) (not bm!3739) (not b!47859) (not d!9471) (not b!47862) tp_is_empty!2061 (not bm!3742) (not b!47832) (not b!47848) (not b!47847))
(check-sat)
