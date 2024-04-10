; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34918 () Bool)

(assert start!34918)

(declare-fun b_free!7659 () Bool)

(declare-fun b_next!7659 () Bool)

(assert (=> start!34918 (= b_free!7659 (not b_next!7659))))

(declare-fun tp!26549 () Bool)

(declare-fun b_and!14885 () Bool)

(assert (=> start!34918 (= tp!26549 b_and!14885)))

(declare-fun mapNonEmpty!12882 () Bool)

(declare-fun mapRes!12882 () Bool)

(declare-fun tp!26550 () Bool)

(declare-fun e!214238 () Bool)

(assert (=> mapNonEmpty!12882 (= mapRes!12882 (and tp!26550 e!214238))))

(declare-datatypes ((V!11125 0))(
  ( (V!11126 (val!3850 Int)) )
))
(declare-datatypes ((ValueCell!3462 0))(
  ( (ValueCellFull!3462 (v!6035 V!11125)) (EmptyCell!3462) )
))
(declare-fun mapValue!12882 () ValueCell!3462)

(declare-datatypes ((array!18805 0))(
  ( (array!18806 (arr!8910 (Array (_ BitVec 32) ValueCell!3462)) (size!9262 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18805)

(declare-fun mapKey!12882 () (_ BitVec 32))

(declare-fun mapRest!12882 () (Array (_ BitVec 32) ValueCell!3462))

(assert (=> mapNonEmpty!12882 (= (arr!8910 _values!1525) (store mapRest!12882 mapKey!12882 mapValue!12882))))

(declare-fun res!193846 () Bool)

(declare-fun e!214234 () Bool)

(assert (=> start!34918 (=> (not res!193846) (not e!214234))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34918 (= res!193846 (validMask!0 mask!2385))))

(assert (=> start!34918 e!214234))

(assert (=> start!34918 true))

(declare-fun tp_is_empty!7611 () Bool)

(assert (=> start!34918 tp_is_empty!7611))

(assert (=> start!34918 tp!26549))

(declare-fun e!214235 () Bool)

(declare-fun array_inv!6586 (array!18805) Bool)

(assert (=> start!34918 (and (array_inv!6586 _values!1525) e!214235)))

(declare-datatypes ((array!18807 0))(
  ( (array!18808 (arr!8911 (Array (_ BitVec 32) (_ BitVec 64))) (size!9263 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18807)

(declare-fun array_inv!6587 (array!18807) Bool)

(assert (=> start!34918 (array_inv!6587 _keys!1895)))

(declare-fun b!349746 () Bool)

(declare-fun res!193848 () Bool)

(assert (=> b!349746 (=> (not res!193848) (not e!214234))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349746 (= res!193848 (validKeyInArray!0 k0!1348))))

(declare-fun b!349747 () Bool)

(declare-fun e!214237 () Bool)

(assert (=> b!349747 (= e!214235 (and e!214237 mapRes!12882))))

(declare-fun condMapEmpty!12882 () Bool)

(declare-fun mapDefault!12882 () ValueCell!3462)

(assert (=> b!349747 (= condMapEmpty!12882 (= (arr!8910 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3462)) mapDefault!12882)))))

(declare-fun b!349748 () Bool)

(declare-fun res!193849 () Bool)

(declare-fun e!214233 () Bool)

(assert (=> b!349748 (=> (not res!193849) (not e!214233))))

(declare-datatypes ((SeekEntryResult!3432 0))(
  ( (MissingZero!3432 (index!15907 (_ BitVec 32))) (Found!3432 (index!15908 (_ BitVec 32))) (Intermediate!3432 (undefined!4244 Bool) (index!15909 (_ BitVec 32)) (x!34828 (_ BitVec 32))) (Undefined!3432) (MissingVacant!3432 (index!15910 (_ BitVec 32))) )
))
(declare-fun lt!164284 () SeekEntryResult!3432)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!349748 (= res!193849 (inRange!0 (index!15907 lt!164284) mask!2385))))

(declare-fun b!349749 () Bool)

(declare-fun res!193850 () Bool)

(assert (=> b!349749 (=> (not res!193850) (not e!214234))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!349749 (= res!193850 (and (= (size!9262 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9263 _keys!1895) (size!9262 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349750 () Bool)

(declare-fun e!214236 () Bool)

(assert (=> b!349750 (= e!214236 e!214233)))

(declare-fun res!193851 () Bool)

(assert (=> b!349750 (=> (not res!193851) (not e!214233))))

(declare-fun lt!164286 () Bool)

(assert (=> b!349750 (= res!193851 (not lt!164286))))

(declare-datatypes ((Unit!10831 0))(
  ( (Unit!10832) )
))
(declare-fun lt!164285 () Unit!10831)

(declare-fun e!214240 () Unit!10831)

(assert (=> b!349750 (= lt!164285 e!214240)))

(declare-fun c!53301 () Bool)

(assert (=> b!349750 (= c!53301 lt!164286)))

(declare-fun arrayContainsKey!0 (array!18807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349750 (= lt!164286 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349751 () Bool)

(declare-fun res!193852 () Bool)

(assert (=> b!349751 (=> (not res!193852) (not e!214234))))

(declare-fun zeroValue!1467 () V!11125)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11125)

(declare-datatypes ((tuple2!5560 0))(
  ( (tuple2!5561 (_1!2791 (_ BitVec 64)) (_2!2791 V!11125)) )
))
(declare-datatypes ((List!5181 0))(
  ( (Nil!5178) (Cons!5177 (h!6033 tuple2!5560) (t!10315 List!5181)) )
))
(declare-datatypes ((ListLongMap!4473 0))(
  ( (ListLongMap!4474 (toList!2252 List!5181)) )
))
(declare-fun contains!2319 (ListLongMap!4473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1773 (array!18807 array!18805 (_ BitVec 32) (_ BitVec 32) V!11125 V!11125 (_ BitVec 32) Int) ListLongMap!4473)

(assert (=> b!349751 (= res!193852 (not (contains!2319 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349752 () Bool)

(assert (=> b!349752 (= e!214233 (or (bvslt (index!15907 lt!164284) #b00000000000000000000000000000000) (bvsge (index!15907 lt!164284) (size!9263 _keys!1895))))))

(declare-fun b!349753 () Bool)

(assert (=> b!349753 (= e!214237 tp_is_empty!7611)))

(declare-fun b!349754 () Bool)

(declare-fun Unit!10833 () Unit!10831)

(assert (=> b!349754 (= e!214240 Unit!10833)))

(declare-fun lt!164287 () Unit!10831)

(declare-fun lemmaArrayContainsKeyThenInListMap!321 (array!18807 array!18805 (_ BitVec 32) (_ BitVec 32) V!11125 V!11125 (_ BitVec 64) (_ BitVec 32) Int) Unit!10831)

(declare-fun arrayScanForKey!0 (array!18807 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349754 (= lt!164287 (lemmaArrayContainsKeyThenInListMap!321 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349754 false))

(declare-fun b!349755 () Bool)

(declare-fun Unit!10834 () Unit!10831)

(assert (=> b!349755 (= e!214240 Unit!10834)))

(declare-fun b!349756 () Bool)

(assert (=> b!349756 (= e!214238 tp_is_empty!7611)))

(declare-fun b!349757 () Bool)

(declare-fun res!193853 () Bool)

(assert (=> b!349757 (=> (not res!193853) (not e!214234))))

(declare-datatypes ((List!5182 0))(
  ( (Nil!5179) (Cons!5178 (h!6034 (_ BitVec 64)) (t!10316 List!5182)) )
))
(declare-fun arrayNoDuplicates!0 (array!18807 (_ BitVec 32) List!5182) Bool)

(assert (=> b!349757 (= res!193853 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5179))))

(declare-fun b!349758 () Bool)

(assert (=> b!349758 (= e!214234 e!214236)))

(declare-fun res!193854 () Bool)

(assert (=> b!349758 (=> (not res!193854) (not e!214236))))

(get-info :version)

(assert (=> b!349758 (= res!193854 (and (not ((_ is Found!3432) lt!164284)) ((_ is MissingZero!3432) lt!164284)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18807 (_ BitVec 32)) SeekEntryResult!3432)

(assert (=> b!349758 (= lt!164284 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12882 () Bool)

(assert (=> mapIsEmpty!12882 mapRes!12882))

(declare-fun b!349759 () Bool)

(declare-fun res!193847 () Bool)

(assert (=> b!349759 (=> (not res!193847) (not e!214234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18807 (_ BitVec 32)) Bool)

(assert (=> b!349759 (= res!193847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34918 res!193846) b!349749))

(assert (= (and b!349749 res!193850) b!349759))

(assert (= (and b!349759 res!193847) b!349757))

(assert (= (and b!349757 res!193853) b!349746))

(assert (= (and b!349746 res!193848) b!349751))

(assert (= (and b!349751 res!193852) b!349758))

(assert (= (and b!349758 res!193854) b!349750))

(assert (= (and b!349750 c!53301) b!349754))

(assert (= (and b!349750 (not c!53301)) b!349755))

(assert (= (and b!349750 res!193851) b!349748))

(assert (= (and b!349748 res!193849) b!349752))

(assert (= (and b!349747 condMapEmpty!12882) mapIsEmpty!12882))

(assert (= (and b!349747 (not condMapEmpty!12882)) mapNonEmpty!12882))

(assert (= (and mapNonEmpty!12882 ((_ is ValueCellFull!3462) mapValue!12882)) b!349756))

(assert (= (and b!349747 ((_ is ValueCellFull!3462) mapDefault!12882)) b!349753))

(assert (= start!34918 b!349747))

(declare-fun m!350159 () Bool)

(assert (=> b!349754 m!350159))

(assert (=> b!349754 m!350159))

(declare-fun m!350161 () Bool)

(assert (=> b!349754 m!350161))

(declare-fun m!350163 () Bool)

(assert (=> b!349751 m!350163))

(assert (=> b!349751 m!350163))

(declare-fun m!350165 () Bool)

(assert (=> b!349751 m!350165))

(declare-fun m!350167 () Bool)

(assert (=> b!349748 m!350167))

(declare-fun m!350169 () Bool)

(assert (=> b!349757 m!350169))

(declare-fun m!350171 () Bool)

(assert (=> b!349758 m!350171))

(declare-fun m!350173 () Bool)

(assert (=> b!349759 m!350173))

(declare-fun m!350175 () Bool)

(assert (=> b!349750 m!350175))

(declare-fun m!350177 () Bool)

(assert (=> b!349746 m!350177))

(declare-fun m!350179 () Bool)

(assert (=> start!34918 m!350179))

(declare-fun m!350181 () Bool)

(assert (=> start!34918 m!350181))

(declare-fun m!350183 () Bool)

(assert (=> start!34918 m!350183))

(declare-fun m!350185 () Bool)

(assert (=> mapNonEmpty!12882 m!350185))

(check-sat b_and!14885 (not b_next!7659) (not b!349746) (not b!349751) (not b!349758) (not start!34918) (not b!349748) tp_is_empty!7611 (not b!349757) (not b!349754) (not mapNonEmpty!12882) (not b!349750) (not b!349759))
(check-sat b_and!14885 (not b_next!7659))
(get-model)

(declare-fun d!71373 () Bool)

(assert (=> d!71373 (contains!2319 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!164302 () Unit!10831)

(declare-fun choose!1306 (array!18807 array!18805 (_ BitVec 32) (_ BitVec 32) V!11125 V!11125 (_ BitVec 64) (_ BitVec 32) Int) Unit!10831)

(assert (=> d!71373 (= lt!164302 (choose!1306 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71373 (validMask!0 mask!2385)))

(assert (=> d!71373 (= (lemmaArrayContainsKeyThenInListMap!321 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!164302)))

(declare-fun bs!11933 () Bool)

(assert (= bs!11933 d!71373))

(assert (=> bs!11933 m!350163))

(assert (=> bs!11933 m!350163))

(assert (=> bs!11933 m!350165))

(assert (=> bs!11933 m!350159))

(declare-fun m!350215 () Bool)

(assert (=> bs!11933 m!350215))

(assert (=> bs!11933 m!350179))

(assert (=> b!349754 d!71373))

(declare-fun d!71375 () Bool)

(declare-fun lt!164305 () (_ BitVec 32))

(assert (=> d!71375 (and (or (bvslt lt!164305 #b00000000000000000000000000000000) (bvsge lt!164305 (size!9263 _keys!1895)) (and (bvsge lt!164305 #b00000000000000000000000000000000) (bvslt lt!164305 (size!9263 _keys!1895)))) (bvsge lt!164305 #b00000000000000000000000000000000) (bvslt lt!164305 (size!9263 _keys!1895)) (= (select (arr!8911 _keys!1895) lt!164305) k0!1348))))

(declare-fun e!214267 () (_ BitVec 32))

(assert (=> d!71375 (= lt!164305 e!214267)))

(declare-fun c!53307 () Bool)

(assert (=> d!71375 (= c!53307 (= (select (arr!8911 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71375 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)) (bvslt (size!9263 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71375 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164305)))

(declare-fun b!349806 () Bool)

(assert (=> b!349806 (= e!214267 #b00000000000000000000000000000000)))

(declare-fun b!349807 () Bool)

(assert (=> b!349807 (= e!214267 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71375 c!53307) b!349806))

(assert (= (and d!71375 (not c!53307)) b!349807))

(declare-fun m!350217 () Bool)

(assert (=> d!71375 m!350217))

(declare-fun m!350219 () Bool)

(assert (=> d!71375 m!350219))

(declare-fun m!350221 () Bool)

(assert (=> b!349807 m!350221))

(assert (=> b!349754 d!71375))

(declare-fun d!71377 () Bool)

(assert (=> d!71377 (= (inRange!0 (index!15907 lt!164284) mask!2385) (and (bvsge (index!15907 lt!164284) #b00000000000000000000000000000000) (bvslt (index!15907 lt!164284) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!349748 d!71377))

(declare-fun d!71379 () Bool)

(assert (=> d!71379 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34918 d!71379))

(declare-fun d!71381 () Bool)

(assert (=> d!71381 (= (array_inv!6586 _values!1525) (bvsge (size!9262 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34918 d!71381))

(declare-fun d!71383 () Bool)

(assert (=> d!71383 (= (array_inv!6587 _keys!1895) (bvsge (size!9263 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34918 d!71383))

(declare-fun lt!164312 () SeekEntryResult!3432)

(declare-fun e!214275 () SeekEntryResult!3432)

(declare-fun b!349820 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18807 (_ BitVec 32)) SeekEntryResult!3432)

(assert (=> b!349820 (= e!214275 (seekKeyOrZeroReturnVacant!0 (x!34828 lt!164312) (index!15909 lt!164312) (index!15909 lt!164312) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349821 () Bool)

(declare-fun e!214276 () SeekEntryResult!3432)

(declare-fun e!214274 () SeekEntryResult!3432)

(assert (=> b!349821 (= e!214276 e!214274)))

(declare-fun lt!164314 () (_ BitVec 64))

(assert (=> b!349821 (= lt!164314 (select (arr!8911 _keys!1895) (index!15909 lt!164312)))))

(declare-fun c!53314 () Bool)

(assert (=> b!349821 (= c!53314 (= lt!164314 k0!1348))))

(declare-fun b!349822 () Bool)

(assert (=> b!349822 (= e!214275 (MissingZero!3432 (index!15909 lt!164312)))))

(declare-fun d!71385 () Bool)

(declare-fun lt!164313 () SeekEntryResult!3432)

(assert (=> d!71385 (and (or ((_ is Undefined!3432) lt!164313) (not ((_ is Found!3432) lt!164313)) (and (bvsge (index!15908 lt!164313) #b00000000000000000000000000000000) (bvslt (index!15908 lt!164313) (size!9263 _keys!1895)))) (or ((_ is Undefined!3432) lt!164313) ((_ is Found!3432) lt!164313) (not ((_ is MissingZero!3432) lt!164313)) (and (bvsge (index!15907 lt!164313) #b00000000000000000000000000000000) (bvslt (index!15907 lt!164313) (size!9263 _keys!1895)))) (or ((_ is Undefined!3432) lt!164313) ((_ is Found!3432) lt!164313) ((_ is MissingZero!3432) lt!164313) (not ((_ is MissingVacant!3432) lt!164313)) (and (bvsge (index!15910 lt!164313) #b00000000000000000000000000000000) (bvslt (index!15910 lt!164313) (size!9263 _keys!1895)))) (or ((_ is Undefined!3432) lt!164313) (ite ((_ is Found!3432) lt!164313) (= (select (arr!8911 _keys!1895) (index!15908 lt!164313)) k0!1348) (ite ((_ is MissingZero!3432) lt!164313) (= (select (arr!8911 _keys!1895) (index!15907 lt!164313)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3432) lt!164313) (= (select (arr!8911 _keys!1895) (index!15910 lt!164313)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71385 (= lt!164313 e!214276)))

(declare-fun c!53316 () Bool)

(assert (=> d!71385 (= c!53316 (and ((_ is Intermediate!3432) lt!164312) (undefined!4244 lt!164312)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18807 (_ BitVec 32)) SeekEntryResult!3432)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71385 (= lt!164312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71385 (validMask!0 mask!2385)))

(assert (=> d!71385 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164313)))

(declare-fun b!349823 () Bool)

(assert (=> b!349823 (= e!214276 Undefined!3432)))

(declare-fun b!349824 () Bool)

(declare-fun c!53315 () Bool)

(assert (=> b!349824 (= c!53315 (= lt!164314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!349824 (= e!214274 e!214275)))

(declare-fun b!349825 () Bool)

(assert (=> b!349825 (= e!214274 (Found!3432 (index!15909 lt!164312)))))

(assert (= (and d!71385 c!53316) b!349823))

(assert (= (and d!71385 (not c!53316)) b!349821))

(assert (= (and b!349821 c!53314) b!349825))

(assert (= (and b!349821 (not c!53314)) b!349824))

(assert (= (and b!349824 c!53315) b!349822))

(assert (= (and b!349824 (not c!53315)) b!349820))

(declare-fun m!350223 () Bool)

(assert (=> b!349820 m!350223))

(declare-fun m!350225 () Bool)

(assert (=> b!349821 m!350225))

(declare-fun m!350227 () Bool)

(assert (=> d!71385 m!350227))

(assert (=> d!71385 m!350179))

(declare-fun m!350229 () Bool)

(assert (=> d!71385 m!350229))

(assert (=> d!71385 m!350227))

(declare-fun m!350231 () Bool)

(assert (=> d!71385 m!350231))

(declare-fun m!350233 () Bool)

(assert (=> d!71385 m!350233))

(declare-fun m!350235 () Bool)

(assert (=> d!71385 m!350235))

(assert (=> b!349758 d!71385))

(declare-fun b!349836 () Bool)

(declare-fun e!214285 () Bool)

(declare-fun e!214287 () Bool)

(assert (=> b!349836 (= e!214285 e!214287)))

(declare-fun c!53319 () Bool)

(assert (=> b!349836 (= c!53319 (validKeyInArray!0 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349837 () Bool)

(declare-fun e!214288 () Bool)

(declare-fun contains!2320 (List!5182 (_ BitVec 64)) Bool)

(assert (=> b!349837 (= e!214288 (contains!2320 Nil!5179 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349838 () Bool)

(declare-fun e!214286 () Bool)

(assert (=> b!349838 (= e!214286 e!214285)))

(declare-fun res!193889 () Bool)

(assert (=> b!349838 (=> (not res!193889) (not e!214285))))

(assert (=> b!349838 (= res!193889 (not e!214288))))

(declare-fun res!193890 () Bool)

(assert (=> b!349838 (=> (not res!193890) (not e!214288))))

(assert (=> b!349838 (= res!193890 (validKeyInArray!0 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71387 () Bool)

(declare-fun res!193888 () Bool)

(assert (=> d!71387 (=> res!193888 e!214286)))

(assert (=> d!71387 (= res!193888 (bvsge #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(assert (=> d!71387 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5179) e!214286)))

(declare-fun b!349839 () Bool)

(declare-fun call!26920 () Bool)

(assert (=> b!349839 (= e!214287 call!26920)))

(declare-fun bm!26917 () Bool)

(assert (=> bm!26917 (= call!26920 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53319 (Cons!5178 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000) Nil!5179) Nil!5179)))))

(declare-fun b!349840 () Bool)

(assert (=> b!349840 (= e!214287 call!26920)))

(assert (= (and d!71387 (not res!193888)) b!349838))

(assert (= (and b!349838 res!193890) b!349837))

(assert (= (and b!349838 res!193889) b!349836))

(assert (= (and b!349836 c!53319) b!349839))

(assert (= (and b!349836 (not c!53319)) b!349840))

(assert (= (or b!349839 b!349840) bm!26917))

(assert (=> b!349836 m!350219))

(assert (=> b!349836 m!350219))

(declare-fun m!350237 () Bool)

(assert (=> b!349836 m!350237))

(assert (=> b!349837 m!350219))

(assert (=> b!349837 m!350219))

(declare-fun m!350239 () Bool)

(assert (=> b!349837 m!350239))

(assert (=> b!349838 m!350219))

(assert (=> b!349838 m!350219))

(assert (=> b!349838 m!350237))

(assert (=> bm!26917 m!350219))

(declare-fun m!350241 () Bool)

(assert (=> bm!26917 m!350241))

(assert (=> b!349757 d!71387))

(declare-fun d!71389 () Bool)

(assert (=> d!71389 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349746 d!71389))

(declare-fun d!71391 () Bool)

(declare-fun e!214294 () Bool)

(assert (=> d!71391 e!214294))

(declare-fun res!193893 () Bool)

(assert (=> d!71391 (=> res!193893 e!214294)))

(declare-fun lt!164326 () Bool)

(assert (=> d!71391 (= res!193893 (not lt!164326))))

(declare-fun lt!164324 () Bool)

(assert (=> d!71391 (= lt!164326 lt!164324)))

(declare-fun lt!164325 () Unit!10831)

(declare-fun e!214293 () Unit!10831)

(assert (=> d!71391 (= lt!164325 e!214293)))

(declare-fun c!53322 () Bool)

(assert (=> d!71391 (= c!53322 lt!164324)))

(declare-fun containsKey!339 (List!5181 (_ BitVec 64)) Bool)

(assert (=> d!71391 (= lt!164324 (containsKey!339 (toList!2252 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71391 (= (contains!2319 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164326)))

(declare-fun b!349847 () Bool)

(declare-fun lt!164323 () Unit!10831)

(assert (=> b!349847 (= e!214293 lt!164323)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!287 (List!5181 (_ BitVec 64)) Unit!10831)

(assert (=> b!349847 (= lt!164323 (lemmaContainsKeyImpliesGetValueByKeyDefined!287 (toList!2252 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!353 0))(
  ( (Some!352 (v!6037 V!11125)) (None!351) )
))
(declare-fun isDefined!288 (Option!353) Bool)

(declare-fun getValueByKey!347 (List!5181 (_ BitVec 64)) Option!353)

(assert (=> b!349847 (isDefined!288 (getValueByKey!347 (toList!2252 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349848 () Bool)

(declare-fun Unit!10838 () Unit!10831)

(assert (=> b!349848 (= e!214293 Unit!10838)))

(declare-fun b!349849 () Bool)

(assert (=> b!349849 (= e!214294 (isDefined!288 (getValueByKey!347 (toList!2252 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71391 c!53322) b!349847))

(assert (= (and d!71391 (not c!53322)) b!349848))

(assert (= (and d!71391 (not res!193893)) b!349849))

(declare-fun m!350243 () Bool)

(assert (=> d!71391 m!350243))

(declare-fun m!350245 () Bool)

(assert (=> b!349847 m!350245))

(declare-fun m!350247 () Bool)

(assert (=> b!349847 m!350247))

(assert (=> b!349847 m!350247))

(declare-fun m!350249 () Bool)

(assert (=> b!349847 m!350249))

(assert (=> b!349849 m!350247))

(assert (=> b!349849 m!350247))

(assert (=> b!349849 m!350249))

(assert (=> b!349751 d!71391))

(declare-fun b!349892 () Bool)

(declare-fun e!214331 () Bool)

(declare-fun lt!164388 () ListLongMap!4473)

(declare-fun apply!289 (ListLongMap!4473 (_ BitVec 64)) V!11125)

(assert (=> b!349892 (= e!214331 (= (apply!289 lt!164388 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26932 () Bool)

(declare-fun call!26937 () ListLongMap!4473)

(declare-fun call!26939 () ListLongMap!4473)

(assert (=> bm!26932 (= call!26937 call!26939)))

(declare-fun d!71393 () Bool)

(declare-fun e!214323 () Bool)

(assert (=> d!71393 e!214323))

(declare-fun res!193916 () Bool)

(assert (=> d!71393 (=> (not res!193916) (not e!214323))))

(assert (=> d!71393 (= res!193916 (or (bvsge #b00000000000000000000000000000000 (size!9263 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))))

(declare-fun lt!164384 () ListLongMap!4473)

(assert (=> d!71393 (= lt!164388 lt!164384)))

(declare-fun lt!164373 () Unit!10831)

(declare-fun e!214328 () Unit!10831)

(assert (=> d!71393 (= lt!164373 e!214328)))

(declare-fun c!53340 () Bool)

(declare-fun e!214327 () Bool)

(assert (=> d!71393 (= c!53340 e!214327)))

(declare-fun res!193912 () Bool)

(assert (=> d!71393 (=> (not res!193912) (not e!214327))))

(assert (=> d!71393 (= res!193912 (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(declare-fun e!214333 () ListLongMap!4473)

(assert (=> d!71393 (= lt!164384 e!214333)))

(declare-fun c!53339 () Bool)

(assert (=> d!71393 (= c!53339 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71393 (validMask!0 mask!2385)))

(assert (=> d!71393 (= (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164388)))

(declare-fun b!349893 () Bool)

(declare-fun e!214322 () Bool)

(assert (=> b!349893 (= e!214322 e!214331)))

(declare-fun res!193919 () Bool)

(declare-fun call!26938 () Bool)

(assert (=> b!349893 (= res!193919 call!26938)))

(assert (=> b!349893 (=> (not res!193919) (not e!214331))))

(declare-fun b!349894 () Bool)

(declare-fun Unit!10839 () Unit!10831)

(assert (=> b!349894 (= e!214328 Unit!10839)))

(declare-fun b!349895 () Bool)

(declare-fun call!26941 () ListLongMap!4473)

(declare-fun +!738 (ListLongMap!4473 tuple2!5560) ListLongMap!4473)

(assert (=> b!349895 (= e!214333 (+!738 call!26941 (tuple2!5561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!349896 () Bool)

(declare-fun e!214325 () ListLongMap!4473)

(assert (=> b!349896 (= e!214325 call!26937)))

(declare-fun b!349897 () Bool)

(declare-fun call!26936 () ListLongMap!4473)

(assert (=> b!349897 (= e!214325 call!26936)))

(declare-fun b!349898 () Bool)

(declare-fun c!53336 () Bool)

(assert (=> b!349898 (= c!53336 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!214329 () ListLongMap!4473)

(assert (=> b!349898 (= e!214329 e!214325)))

(declare-fun bm!26933 () Bool)

(declare-fun c!53335 () Bool)

(declare-fun call!26940 () ListLongMap!4473)

(assert (=> bm!26933 (= call!26941 (+!738 (ite c!53339 call!26940 (ite c!53335 call!26939 call!26937)) (ite (or c!53339 c!53335) (tuple2!5561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!349899 () Bool)

(declare-fun e!214326 () Bool)

(assert (=> b!349899 (= e!214323 e!214326)))

(declare-fun c!53338 () Bool)

(assert (=> b!349899 (= c!53338 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26934 () Bool)

(declare-fun call!26935 () Bool)

(assert (=> bm!26934 (= call!26935 (contains!2319 lt!164388 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349900 () Bool)

(assert (=> b!349900 (= e!214322 (not call!26938))))

(declare-fun bm!26935 () Bool)

(assert (=> bm!26935 (= call!26938 (contains!2319 lt!164388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349901 () Bool)

(declare-fun e!214321 () Bool)

(assert (=> b!349901 (= e!214321 (validKeyInArray!0 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26936 () Bool)

(assert (=> bm!26936 (= call!26939 call!26940)))

(declare-fun b!349902 () Bool)

(assert (=> b!349902 (= e!214326 (not call!26935))))

(declare-fun b!349903 () Bool)

(declare-fun e!214324 () Bool)

(assert (=> b!349903 (= e!214324 (= (apply!289 lt!164388 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!349904 () Bool)

(assert (=> b!349904 (= e!214329 call!26936)))

(declare-fun b!349905 () Bool)

(declare-fun res!193920 () Bool)

(assert (=> b!349905 (=> (not res!193920) (not e!214323))))

(declare-fun e!214332 () Bool)

(assert (=> b!349905 (= res!193920 e!214332)))

(declare-fun res!193914 () Bool)

(assert (=> b!349905 (=> res!193914 e!214332)))

(assert (=> b!349905 (= res!193914 (not e!214321))))

(declare-fun res!193918 () Bool)

(assert (=> b!349905 (=> (not res!193918) (not e!214321))))

(assert (=> b!349905 (= res!193918 (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(declare-fun b!349906 () Bool)

(declare-fun res!193913 () Bool)

(assert (=> b!349906 (=> (not res!193913) (not e!214323))))

(assert (=> b!349906 (= res!193913 e!214322)))

(declare-fun c!53337 () Bool)

(assert (=> b!349906 (= c!53337 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!349907 () Bool)

(declare-fun lt!164371 () Unit!10831)

(assert (=> b!349907 (= e!214328 lt!164371)))

(declare-fun lt!164390 () ListLongMap!4473)

(declare-fun getCurrentListMapNoExtraKeys!611 (array!18807 array!18805 (_ BitVec 32) (_ BitVec 32) V!11125 V!11125 (_ BitVec 32) Int) ListLongMap!4473)

(assert (=> b!349907 (= lt!164390 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164391 () (_ BitVec 64))

(assert (=> b!349907 (= lt!164391 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164389 () (_ BitVec 64))

(assert (=> b!349907 (= lt!164389 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164378 () Unit!10831)

(declare-fun addStillContains!265 (ListLongMap!4473 (_ BitVec 64) V!11125 (_ BitVec 64)) Unit!10831)

(assert (=> b!349907 (= lt!164378 (addStillContains!265 lt!164390 lt!164391 zeroValue!1467 lt!164389))))

(assert (=> b!349907 (contains!2319 (+!738 lt!164390 (tuple2!5561 lt!164391 zeroValue!1467)) lt!164389)))

(declare-fun lt!164372 () Unit!10831)

(assert (=> b!349907 (= lt!164372 lt!164378)))

(declare-fun lt!164377 () ListLongMap!4473)

(assert (=> b!349907 (= lt!164377 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164392 () (_ BitVec 64))

(assert (=> b!349907 (= lt!164392 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164379 () (_ BitVec 64))

(assert (=> b!349907 (= lt!164379 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164385 () Unit!10831)

(declare-fun addApplyDifferent!265 (ListLongMap!4473 (_ BitVec 64) V!11125 (_ BitVec 64)) Unit!10831)

(assert (=> b!349907 (= lt!164385 (addApplyDifferent!265 lt!164377 lt!164392 minValue!1467 lt!164379))))

(assert (=> b!349907 (= (apply!289 (+!738 lt!164377 (tuple2!5561 lt!164392 minValue!1467)) lt!164379) (apply!289 lt!164377 lt!164379))))

(declare-fun lt!164381 () Unit!10831)

(assert (=> b!349907 (= lt!164381 lt!164385)))

(declare-fun lt!164374 () ListLongMap!4473)

(assert (=> b!349907 (= lt!164374 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164383 () (_ BitVec 64))

(assert (=> b!349907 (= lt!164383 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164387 () (_ BitVec 64))

(assert (=> b!349907 (= lt!164387 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164380 () Unit!10831)

(assert (=> b!349907 (= lt!164380 (addApplyDifferent!265 lt!164374 lt!164383 zeroValue!1467 lt!164387))))

(assert (=> b!349907 (= (apply!289 (+!738 lt!164374 (tuple2!5561 lt!164383 zeroValue!1467)) lt!164387) (apply!289 lt!164374 lt!164387))))

(declare-fun lt!164376 () Unit!10831)

(assert (=> b!349907 (= lt!164376 lt!164380)))

(declare-fun lt!164375 () ListLongMap!4473)

(assert (=> b!349907 (= lt!164375 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164386 () (_ BitVec 64))

(assert (=> b!349907 (= lt!164386 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164382 () (_ BitVec 64))

(assert (=> b!349907 (= lt!164382 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!349907 (= lt!164371 (addApplyDifferent!265 lt!164375 lt!164386 minValue!1467 lt!164382))))

(assert (=> b!349907 (= (apply!289 (+!738 lt!164375 (tuple2!5561 lt!164386 minValue!1467)) lt!164382) (apply!289 lt!164375 lt!164382))))

(declare-fun bm!26937 () Bool)

(assert (=> bm!26937 (= call!26936 call!26941)))

(declare-fun b!349908 () Bool)

(assert (=> b!349908 (= e!214333 e!214329)))

(assert (=> b!349908 (= c!53335 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349909 () Bool)

(assert (=> b!349909 (= e!214326 e!214324)))

(declare-fun res!193917 () Bool)

(assert (=> b!349909 (= res!193917 call!26935)))

(assert (=> b!349909 (=> (not res!193917) (not e!214324))))

(declare-fun b!349910 () Bool)

(declare-fun e!214330 () Bool)

(declare-fun get!4771 (ValueCell!3462 V!11125) V!11125)

(declare-fun dynLambda!632 (Int (_ BitVec 64)) V!11125)

(assert (=> b!349910 (= e!214330 (= (apply!289 lt!164388 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000)) (get!4771 (select (arr!8910 _values!1525) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9262 _values!1525)))))

(assert (=> b!349910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(declare-fun bm!26938 () Bool)

(assert (=> bm!26938 (= call!26940 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!349911 () Bool)

(assert (=> b!349911 (= e!214332 e!214330)))

(declare-fun res!193915 () Bool)

(assert (=> b!349911 (=> (not res!193915) (not e!214330))))

(assert (=> b!349911 (= res!193915 (contains!2319 lt!164388 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!349911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(declare-fun b!349912 () Bool)

(assert (=> b!349912 (= e!214327 (validKeyInArray!0 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71393 c!53339) b!349895))

(assert (= (and d!71393 (not c!53339)) b!349908))

(assert (= (and b!349908 c!53335) b!349904))

(assert (= (and b!349908 (not c!53335)) b!349898))

(assert (= (and b!349898 c!53336) b!349897))

(assert (= (and b!349898 (not c!53336)) b!349896))

(assert (= (or b!349897 b!349896) bm!26932))

(assert (= (or b!349904 bm!26932) bm!26936))

(assert (= (or b!349904 b!349897) bm!26937))

(assert (= (or b!349895 bm!26936) bm!26938))

(assert (= (or b!349895 bm!26937) bm!26933))

(assert (= (and d!71393 res!193912) b!349912))

(assert (= (and d!71393 c!53340) b!349907))

(assert (= (and d!71393 (not c!53340)) b!349894))

(assert (= (and d!71393 res!193916) b!349905))

(assert (= (and b!349905 res!193918) b!349901))

(assert (= (and b!349905 (not res!193914)) b!349911))

(assert (= (and b!349911 res!193915) b!349910))

(assert (= (and b!349905 res!193920) b!349906))

(assert (= (and b!349906 c!53337) b!349893))

(assert (= (and b!349906 (not c!53337)) b!349900))

(assert (= (and b!349893 res!193919) b!349892))

(assert (= (or b!349893 b!349900) bm!26935))

(assert (= (and b!349906 res!193913) b!349899))

(assert (= (and b!349899 c!53338) b!349909))

(assert (= (and b!349899 (not c!53338)) b!349902))

(assert (= (and b!349909 res!193917) b!349903))

(assert (= (or b!349909 b!349902) bm!26934))

(declare-fun b_lambda!8495 () Bool)

(assert (=> (not b_lambda!8495) (not b!349910)))

(declare-fun t!10318 () Bool)

(declare-fun tb!3093 () Bool)

(assert (=> (and start!34918 (= defaultEntry!1528 defaultEntry!1528) t!10318) tb!3093))

(declare-fun result!5609 () Bool)

(assert (=> tb!3093 (= result!5609 tp_is_empty!7611)))

(assert (=> b!349910 t!10318))

(declare-fun b_and!14889 () Bool)

(assert (= b_and!14885 (and (=> t!10318 result!5609) b_and!14889)))

(assert (=> d!71393 m!350179))

(assert (=> b!349912 m!350219))

(assert (=> b!349912 m!350219))

(assert (=> b!349912 m!350237))

(assert (=> b!349901 m!350219))

(assert (=> b!349901 m!350219))

(assert (=> b!349901 m!350237))

(declare-fun m!350251 () Bool)

(assert (=> bm!26933 m!350251))

(assert (=> b!349911 m!350219))

(assert (=> b!349911 m!350219))

(declare-fun m!350253 () Bool)

(assert (=> b!349911 m!350253))

(declare-fun m!350255 () Bool)

(assert (=> bm!26935 m!350255))

(declare-fun m!350257 () Bool)

(assert (=> b!349892 m!350257))

(declare-fun m!350259 () Bool)

(assert (=> b!349895 m!350259))

(declare-fun m!350261 () Bool)

(assert (=> b!349910 m!350261))

(declare-fun m!350263 () Bool)

(assert (=> b!349910 m!350263))

(assert (=> b!349910 m!350261))

(declare-fun m!350265 () Bool)

(assert (=> b!349910 m!350265))

(assert (=> b!349910 m!350263))

(assert (=> b!349910 m!350219))

(assert (=> b!349910 m!350219))

(declare-fun m!350267 () Bool)

(assert (=> b!349910 m!350267))

(declare-fun m!350269 () Bool)

(assert (=> b!349907 m!350269))

(declare-fun m!350271 () Bool)

(assert (=> b!349907 m!350271))

(declare-fun m!350273 () Bool)

(assert (=> b!349907 m!350273))

(declare-fun m!350275 () Bool)

(assert (=> b!349907 m!350275))

(declare-fun m!350277 () Bool)

(assert (=> b!349907 m!350277))

(assert (=> b!349907 m!350219))

(declare-fun m!350279 () Bool)

(assert (=> b!349907 m!350279))

(assert (=> b!349907 m!350275))

(declare-fun m!350281 () Bool)

(assert (=> b!349907 m!350281))

(declare-fun m!350283 () Bool)

(assert (=> b!349907 m!350283))

(declare-fun m!350285 () Bool)

(assert (=> b!349907 m!350285))

(declare-fun m!350287 () Bool)

(assert (=> b!349907 m!350287))

(declare-fun m!350289 () Bool)

(assert (=> b!349907 m!350289))

(declare-fun m!350291 () Bool)

(assert (=> b!349907 m!350291))

(declare-fun m!350293 () Bool)

(assert (=> b!349907 m!350293))

(declare-fun m!350295 () Bool)

(assert (=> b!349907 m!350295))

(declare-fun m!350297 () Bool)

(assert (=> b!349907 m!350297))

(assert (=> b!349907 m!350293))

(assert (=> b!349907 m!350277))

(declare-fun m!350299 () Bool)

(assert (=> b!349907 m!350299))

(assert (=> b!349907 m!350287))

(declare-fun m!350301 () Bool)

(assert (=> b!349903 m!350301))

(declare-fun m!350303 () Bool)

(assert (=> bm!26934 m!350303))

(assert (=> bm!26938 m!350273))

(assert (=> b!349751 d!71393))

(declare-fun d!71395 () Bool)

(declare-fun res!193925 () Bool)

(declare-fun e!214338 () Bool)

(assert (=> d!71395 (=> res!193925 e!214338)))

(assert (=> d!71395 (= res!193925 (= (select (arr!8911 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71395 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!214338)))

(declare-fun b!349919 () Bool)

(declare-fun e!214339 () Bool)

(assert (=> b!349919 (= e!214338 e!214339)))

(declare-fun res!193926 () Bool)

(assert (=> b!349919 (=> (not res!193926) (not e!214339))))

(assert (=> b!349919 (= res!193926 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9263 _keys!1895)))))

(declare-fun b!349920 () Bool)

(assert (=> b!349920 (= e!214339 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71395 (not res!193925)) b!349919))

(assert (= (and b!349919 res!193926) b!349920))

(assert (=> d!71395 m!350219))

(declare-fun m!350305 () Bool)

(assert (=> b!349920 m!350305))

(assert (=> b!349750 d!71395))

(declare-fun b!349929 () Bool)

(declare-fun e!214348 () Bool)

(declare-fun call!26944 () Bool)

(assert (=> b!349929 (= e!214348 call!26944)))

(declare-fun d!71397 () Bool)

(declare-fun res!193932 () Bool)

(declare-fun e!214346 () Bool)

(assert (=> d!71397 (=> res!193932 e!214346)))

(assert (=> d!71397 (= res!193932 (bvsge #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(assert (=> d!71397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!214346)))

(declare-fun b!349930 () Bool)

(declare-fun e!214347 () Bool)

(assert (=> b!349930 (= e!214347 call!26944)))

(declare-fun bm!26941 () Bool)

(assert (=> bm!26941 (= call!26944 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!349931 () Bool)

(assert (=> b!349931 (= e!214346 e!214347)))

(declare-fun c!53343 () Bool)

(assert (=> b!349931 (= c!53343 (validKeyInArray!0 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349932 () Bool)

(assert (=> b!349932 (= e!214347 e!214348)))

(declare-fun lt!164400 () (_ BitVec 64))

(assert (=> b!349932 (= lt!164400 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164399 () Unit!10831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18807 (_ BitVec 64) (_ BitVec 32)) Unit!10831)

(assert (=> b!349932 (= lt!164399 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164400 #b00000000000000000000000000000000))))

(assert (=> b!349932 (arrayContainsKey!0 _keys!1895 lt!164400 #b00000000000000000000000000000000)))

(declare-fun lt!164401 () Unit!10831)

(assert (=> b!349932 (= lt!164401 lt!164399)))

(declare-fun res!193931 () Bool)

(assert (=> b!349932 (= res!193931 (= (seekEntryOrOpen!0 (select (arr!8911 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3432 #b00000000000000000000000000000000)))))

(assert (=> b!349932 (=> (not res!193931) (not e!214348))))

(assert (= (and d!71397 (not res!193932)) b!349931))

(assert (= (and b!349931 c!53343) b!349932))

(assert (= (and b!349931 (not c!53343)) b!349930))

(assert (= (and b!349932 res!193931) b!349929))

(assert (= (or b!349929 b!349930) bm!26941))

(declare-fun m!350307 () Bool)

(assert (=> bm!26941 m!350307))

(assert (=> b!349931 m!350219))

(assert (=> b!349931 m!350219))

(assert (=> b!349931 m!350237))

(assert (=> b!349932 m!350219))

(declare-fun m!350309 () Bool)

(assert (=> b!349932 m!350309))

(declare-fun m!350311 () Bool)

(assert (=> b!349932 m!350311))

(assert (=> b!349932 m!350219))

(declare-fun m!350313 () Bool)

(assert (=> b!349932 m!350313))

(assert (=> b!349759 d!71397))

(declare-fun b!349939 () Bool)

(declare-fun e!214353 () Bool)

(assert (=> b!349939 (= e!214353 tp_is_empty!7611)))

(declare-fun condMapEmpty!12888 () Bool)

(declare-fun mapDefault!12888 () ValueCell!3462)

(assert (=> mapNonEmpty!12882 (= condMapEmpty!12888 (= mapRest!12882 ((as const (Array (_ BitVec 32) ValueCell!3462)) mapDefault!12888)))))

(declare-fun e!214354 () Bool)

(declare-fun mapRes!12888 () Bool)

(assert (=> mapNonEmpty!12882 (= tp!26550 (and e!214354 mapRes!12888))))

(declare-fun mapIsEmpty!12888 () Bool)

(assert (=> mapIsEmpty!12888 mapRes!12888))

(declare-fun mapNonEmpty!12888 () Bool)

(declare-fun tp!26559 () Bool)

(assert (=> mapNonEmpty!12888 (= mapRes!12888 (and tp!26559 e!214353))))

(declare-fun mapKey!12888 () (_ BitVec 32))

(declare-fun mapRest!12888 () (Array (_ BitVec 32) ValueCell!3462))

(declare-fun mapValue!12888 () ValueCell!3462)

(assert (=> mapNonEmpty!12888 (= mapRest!12882 (store mapRest!12888 mapKey!12888 mapValue!12888))))

(declare-fun b!349940 () Bool)

(assert (=> b!349940 (= e!214354 tp_is_empty!7611)))

(assert (= (and mapNonEmpty!12882 condMapEmpty!12888) mapIsEmpty!12888))

(assert (= (and mapNonEmpty!12882 (not condMapEmpty!12888)) mapNonEmpty!12888))

(assert (= (and mapNonEmpty!12888 ((_ is ValueCellFull!3462) mapValue!12888)) b!349939))

(assert (= (and mapNonEmpty!12882 ((_ is ValueCellFull!3462) mapDefault!12888)) b!349940))

(declare-fun m!350315 () Bool)

(assert (=> mapNonEmpty!12888 m!350315))

(declare-fun b_lambda!8497 () Bool)

(assert (= b_lambda!8495 (or (and start!34918 b_free!7659) b_lambda!8497)))

(check-sat (not b_lambda!8497) (not b!349907) (not b!349820) (not b!349932) (not d!71393) (not b!349849) (not b!349837) (not b!349910) tp_is_empty!7611 (not bm!26938) (not b!349895) (not bm!26934) (not bm!26917) (not b!349807) (not b_next!7659) (not b!349912) b_and!14889 (not b!349836) (not b!349901) (not bm!26941) (not b!349911) (not b!349892) (not d!71385) (not b!349838) (not b!349903) (not mapNonEmpty!12888) (not b!349847) (not bm!26935) (not b!349931) (not d!71373) (not d!71391) (not bm!26933) (not b!349920))
(check-sat b_and!14889 (not b_next!7659))
