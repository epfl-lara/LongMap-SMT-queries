; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34566 () Bool)

(assert start!34566)

(declare-fun b_free!7465 () Bool)

(declare-fun b_next!7465 () Bool)

(assert (=> start!34566 (= b_free!7465 (not b_next!7465))))

(declare-fun tp!25947 () Bool)

(declare-fun b_and!14691 () Bool)

(assert (=> start!34566 (= tp!25947 b_and!14691)))

(declare-fun b!345541 () Bool)

(declare-fun e!211787 () Bool)

(declare-datatypes ((SeekEntryResult!3314 0))(
  ( (MissingZero!3314 (index!15435 (_ BitVec 32))) (Found!3314 (index!15436 (_ BitVec 32))) (Intermediate!3314 (undefined!4126 Bool) (index!15437 (_ BitVec 32)) (x!34381 (_ BitVec 32))) (Undefined!3314) (MissingVacant!3314 (index!15438 (_ BitVec 32))) )
))
(declare-fun lt!162982 () SeekEntryResult!3314)

(declare-datatypes ((array!18414 0))(
  ( (array!18415 (arr!8721 (Array (_ BitVec 32) (_ BitVec 64))) (size!9073 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18414)

(get-info :version)

(assert (=> b!345541 (= e!211787 (and ((_ is Found!3314) lt!162982) (or (bvslt (index!15436 lt!162982) #b00000000000000000000000000000000) (bvsge (index!15436 lt!162982) (size!9073 _keys!1895)))))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18414 (_ BitVec 32)) SeekEntryResult!3314)

(assert (=> b!345541 (= lt!162982 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345542 () Bool)

(declare-fun res!191178 () Bool)

(assert (=> b!345542 (=> (not res!191178) (not e!211787))))

(declare-datatypes ((V!10867 0))(
  ( (V!10868 (val!3753 Int)) )
))
(declare-fun zeroValue!1467 () V!10867)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3365 0))(
  ( (ValueCellFull!3365 (v!5932 V!10867)) (EmptyCell!3365) )
))
(declare-datatypes ((array!18416 0))(
  ( (array!18417 (arr!8722 (Array (_ BitVec 32) ValueCell!3365)) (size!9074 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18416)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10867)

(declare-datatypes ((tuple2!5346 0))(
  ( (tuple2!5347 (_1!2684 (_ BitVec 64)) (_2!2684 V!10867)) )
))
(declare-datatypes ((List!4951 0))(
  ( (Nil!4948) (Cons!4947 (h!5803 tuple2!5346) (t!10063 List!4951)) )
))
(declare-datatypes ((ListLongMap!4261 0))(
  ( (ListLongMap!4262 (toList!2146 List!4951)) )
))
(declare-fun contains!2225 (ListLongMap!4261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1675 (array!18414 array!18416 (_ BitVec 32) (_ BitVec 32) V!10867 V!10867 (_ BitVec 32) Int) ListLongMap!4261)

(assert (=> b!345542 (= res!191178 (not (contains!2225 (getCurrentListMap!1675 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345543 () Bool)

(declare-fun e!211785 () Bool)

(declare-fun e!211786 () Bool)

(declare-fun mapRes!12570 () Bool)

(assert (=> b!345543 (= e!211785 (and e!211786 mapRes!12570))))

(declare-fun condMapEmpty!12570 () Bool)

(declare-fun mapDefault!12570 () ValueCell!3365)

(assert (=> b!345543 (= condMapEmpty!12570 (= (arr!8722 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3365)) mapDefault!12570)))))

(declare-fun mapIsEmpty!12570 () Bool)

(assert (=> mapIsEmpty!12570 mapRes!12570))

(declare-fun b!345544 () Bool)

(declare-fun res!191181 () Bool)

(assert (=> b!345544 (=> (not res!191181) (not e!211787))))

(assert (=> b!345544 (= res!191181 (and (= (size!9074 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9073 _keys!1895) (size!9074 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12570 () Bool)

(declare-fun tp!25946 () Bool)

(declare-fun e!211783 () Bool)

(assert (=> mapNonEmpty!12570 (= mapRes!12570 (and tp!25946 e!211783))))

(declare-fun mapKey!12570 () (_ BitVec 32))

(declare-fun mapRest!12570 () (Array (_ BitVec 32) ValueCell!3365))

(declare-fun mapValue!12570 () ValueCell!3365)

(assert (=> mapNonEmpty!12570 (= (arr!8722 _values!1525) (store mapRest!12570 mapKey!12570 mapValue!12570))))

(declare-fun res!191179 () Bool)

(assert (=> start!34566 (=> (not res!191179) (not e!211787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34566 (= res!191179 (validMask!0 mask!2385))))

(assert (=> start!34566 e!211787))

(assert (=> start!34566 true))

(declare-fun tp_is_empty!7417 () Bool)

(assert (=> start!34566 tp_is_empty!7417))

(assert (=> start!34566 tp!25947))

(declare-fun array_inv!6444 (array!18416) Bool)

(assert (=> start!34566 (and (array_inv!6444 _values!1525) e!211785)))

(declare-fun array_inv!6445 (array!18414) Bool)

(assert (=> start!34566 (array_inv!6445 _keys!1895)))

(declare-fun b!345545 () Bool)

(assert (=> b!345545 (= e!211786 tp_is_empty!7417)))

(declare-fun b!345546 () Bool)

(assert (=> b!345546 (= e!211783 tp_is_empty!7417)))

(declare-fun b!345547 () Bool)

(declare-fun res!191182 () Bool)

(assert (=> b!345547 (=> (not res!191182) (not e!211787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345547 (= res!191182 (validKeyInArray!0 k0!1348))))

(declare-fun b!345548 () Bool)

(declare-fun res!191180 () Bool)

(assert (=> b!345548 (=> (not res!191180) (not e!211787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18414 (_ BitVec 32)) Bool)

(assert (=> b!345548 (= res!191180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345549 () Bool)

(declare-fun res!191183 () Bool)

(assert (=> b!345549 (=> (not res!191183) (not e!211787))))

(declare-datatypes ((List!4952 0))(
  ( (Nil!4949) (Cons!4948 (h!5804 (_ BitVec 64)) (t!10064 List!4952)) )
))
(declare-fun arrayNoDuplicates!0 (array!18414 (_ BitVec 32) List!4952) Bool)

(assert (=> b!345549 (= res!191183 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4949))))

(assert (= (and start!34566 res!191179) b!345544))

(assert (= (and b!345544 res!191181) b!345548))

(assert (= (and b!345548 res!191180) b!345549))

(assert (= (and b!345549 res!191183) b!345547))

(assert (= (and b!345547 res!191182) b!345542))

(assert (= (and b!345542 res!191178) b!345541))

(assert (= (and b!345543 condMapEmpty!12570) mapIsEmpty!12570))

(assert (= (and b!345543 (not condMapEmpty!12570)) mapNonEmpty!12570))

(assert (= (and mapNonEmpty!12570 ((_ is ValueCellFull!3365) mapValue!12570)) b!345546))

(assert (= (and b!345543 ((_ is ValueCellFull!3365) mapDefault!12570)) b!345545))

(assert (= start!34566 b!345543))

(declare-fun m!347149 () Bool)

(assert (=> start!34566 m!347149))

(declare-fun m!347151 () Bool)

(assert (=> start!34566 m!347151))

(declare-fun m!347153 () Bool)

(assert (=> start!34566 m!347153))

(declare-fun m!347155 () Bool)

(assert (=> b!345548 m!347155))

(declare-fun m!347157 () Bool)

(assert (=> mapNonEmpty!12570 m!347157))

(declare-fun m!347159 () Bool)

(assert (=> b!345541 m!347159))

(declare-fun m!347161 () Bool)

(assert (=> b!345542 m!347161))

(assert (=> b!345542 m!347161))

(declare-fun m!347163 () Bool)

(assert (=> b!345542 m!347163))

(declare-fun m!347165 () Bool)

(assert (=> b!345549 m!347165))

(declare-fun m!347167 () Bool)

(assert (=> b!345547 m!347167))

(check-sat (not b!345542) (not b!345549) (not b!345541) (not b!345548) b_and!14691 (not start!34566) (not mapNonEmpty!12570) (not b_next!7465) (not b!345547) tp_is_empty!7417)
(check-sat b_and!14691 (not b_next!7465))
(get-model)

(declare-fun d!71189 () Bool)

(declare-fun e!211822 () Bool)

(assert (=> d!71189 e!211822))

(declare-fun res!191222 () Bool)

(assert (=> d!71189 (=> res!191222 e!211822)))

(declare-fun lt!162998 () Bool)

(assert (=> d!71189 (= res!191222 (not lt!162998))))

(declare-fun lt!163000 () Bool)

(assert (=> d!71189 (= lt!162998 lt!163000)))

(declare-datatypes ((Unit!10705 0))(
  ( (Unit!10706) )
))
(declare-fun lt!162997 () Unit!10705)

(declare-fun e!211823 () Unit!10705)

(assert (=> d!71189 (= lt!162997 e!211823)))

(declare-fun c!53006 () Bool)

(assert (=> d!71189 (= c!53006 lt!163000)))

(declare-fun containsKey!332 (List!4951 (_ BitVec 64)) Bool)

(assert (=> d!71189 (= lt!163000 (containsKey!332 (toList!2146 (getCurrentListMap!1675 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71189 (= (contains!2225 (getCurrentListMap!1675 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162998)))

(declare-fun b!345610 () Bool)

(declare-fun lt!162999 () Unit!10705)

(assert (=> b!345610 (= e!211823 lt!162999)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!280 (List!4951 (_ BitVec 64)) Unit!10705)

(assert (=> b!345610 (= lt!162999 (lemmaContainsKeyImpliesGetValueByKeyDefined!280 (toList!2146 (getCurrentListMap!1675 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!347 0))(
  ( (Some!346 (v!5935 V!10867)) (None!345) )
))
(declare-fun isDefined!281 (Option!347) Bool)

(declare-fun getValueByKey!341 (List!4951 (_ BitVec 64)) Option!347)

(assert (=> b!345610 (isDefined!281 (getValueByKey!341 (toList!2146 (getCurrentListMap!1675 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345611 () Bool)

(declare-fun Unit!10707 () Unit!10705)

(assert (=> b!345611 (= e!211823 Unit!10707)))

(declare-fun b!345612 () Bool)

(assert (=> b!345612 (= e!211822 (isDefined!281 (getValueByKey!341 (toList!2146 (getCurrentListMap!1675 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71189 c!53006) b!345610))

(assert (= (and d!71189 (not c!53006)) b!345611))

(assert (= (and d!71189 (not res!191222)) b!345612))

(declare-fun m!347209 () Bool)

(assert (=> d!71189 m!347209))

(declare-fun m!347211 () Bool)

(assert (=> b!345610 m!347211))

(declare-fun m!347213 () Bool)

(assert (=> b!345610 m!347213))

(assert (=> b!345610 m!347213))

(declare-fun m!347215 () Bool)

(assert (=> b!345610 m!347215))

(assert (=> b!345612 m!347213))

(assert (=> b!345612 m!347213))

(assert (=> b!345612 m!347215))

(assert (=> b!345542 d!71189))

(declare-fun b!345655 () Bool)

(declare-fun e!211851 () ListLongMap!4261)

(declare-fun call!26733 () ListLongMap!4261)

(assert (=> b!345655 (= e!211851 call!26733)))

(declare-fun bm!26726 () Bool)

(declare-fun call!26735 () ListLongMap!4261)

(assert (=> bm!26726 (= call!26733 call!26735)))

(declare-fun b!345656 () Bool)

(declare-fun e!211854 () ListLongMap!4261)

(declare-fun call!26730 () ListLongMap!4261)

(assert (=> b!345656 (= e!211854 call!26730)))

(declare-fun b!345657 () Bool)

(declare-fun e!211859 () ListLongMap!4261)

(assert (=> b!345657 (= e!211859 e!211854)))

(declare-fun c!53019 () Bool)

(assert (=> b!345657 (= c!53019 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345658 () Bool)

(declare-fun call!26729 () ListLongMap!4261)

(declare-fun +!733 (ListLongMap!4261 tuple2!5346) ListLongMap!4261)

(assert (=> b!345658 (= e!211859 (+!733 call!26729 (tuple2!5347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26727 () Bool)

(declare-fun call!26732 () Bool)

(declare-fun lt!163065 () ListLongMap!4261)

(assert (=> bm!26727 (= call!26732 (contains!2225 lt!163065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345659 () Bool)

(declare-fun e!211856 () Bool)

(declare-fun apply!282 (ListLongMap!4261 (_ BitVec 64)) V!10867)

(assert (=> b!345659 (= e!211856 (= (apply!282 lt!163065 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!345660 () Bool)

(declare-fun c!53021 () Bool)

(assert (=> b!345660 (= c!53021 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!345660 (= e!211854 e!211851)))

(declare-fun b!345661 () Bool)

(declare-fun e!211857 () Unit!10705)

(declare-fun Unit!10708 () Unit!10705)

(assert (=> b!345661 (= e!211857 Unit!10708)))

(declare-fun b!345662 () Bool)

(declare-fun res!191245 () Bool)

(declare-fun e!211852 () Bool)

(assert (=> b!345662 (=> (not res!191245) (not e!211852))))

(declare-fun e!211853 () Bool)

(assert (=> b!345662 (= res!191245 e!211853)))

(declare-fun c!53023 () Bool)

(assert (=> b!345662 (= c!53023 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345663 () Bool)

(declare-fun e!211858 () Bool)

(assert (=> b!345663 (= e!211858 (not call!26732))))

(declare-fun b!345664 () Bool)

(declare-fun e!211862 () Bool)

(declare-fun e!211855 () Bool)

(assert (=> b!345664 (= e!211862 e!211855)))

(declare-fun res!191243 () Bool)

(assert (=> b!345664 (=> (not res!191243) (not e!211855))))

(assert (=> b!345664 (= res!191243 (contains!2225 lt!163065 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345664 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(declare-fun b!345665 () Bool)

(assert (=> b!345665 (= e!211853 e!211856)))

(declare-fun res!191246 () Bool)

(declare-fun call!26734 () Bool)

(assert (=> b!345665 (= res!191246 call!26734)))

(assert (=> b!345665 (=> (not res!191246) (not e!211856))))

(declare-fun b!345666 () Bool)

(declare-fun e!211861 () Bool)

(assert (=> b!345666 (= e!211858 e!211861)))

(declare-fun res!191248 () Bool)

(assert (=> b!345666 (= res!191248 call!26732)))

(assert (=> b!345666 (=> (not res!191248) (not e!211861))))

(declare-fun b!345667 () Bool)

(assert (=> b!345667 (= e!211853 (not call!26734))))

(declare-fun b!345668 () Bool)

(declare-fun get!4706 (ValueCell!3365 V!10867) V!10867)

(declare-fun dynLambda!625 (Int (_ BitVec 64)) V!10867)

(assert (=> b!345668 (= e!211855 (= (apply!282 lt!163065 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)) (get!4706 (select (arr!8722 _values!1525) #b00000000000000000000000000000000) (dynLambda!625 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9074 _values!1525)))))

(assert (=> b!345668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(declare-fun bm!26729 () Bool)

(declare-fun call!26731 () ListLongMap!4261)

(assert (=> bm!26729 (= call!26735 call!26731)))

(declare-fun bm!26728 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!598 (array!18414 array!18416 (_ BitVec 32) (_ BitVec 32) V!10867 V!10867 (_ BitVec 32) Int) ListLongMap!4261)

(assert (=> bm!26728 (= call!26731 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun d!71191 () Bool)

(assert (=> d!71191 e!211852))

(declare-fun res!191249 () Bool)

(assert (=> d!71191 (=> (not res!191249) (not e!211852))))

(assert (=> d!71191 (= res!191249 (or (bvsge #b00000000000000000000000000000000 (size!9073 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))))

(declare-fun lt!163056 () ListLongMap!4261)

(assert (=> d!71191 (= lt!163065 lt!163056)))

(declare-fun lt!163050 () Unit!10705)

(assert (=> d!71191 (= lt!163050 e!211857)))

(declare-fun c!53020 () Bool)

(declare-fun e!211850 () Bool)

(assert (=> d!71191 (= c!53020 e!211850)))

(declare-fun res!191244 () Bool)

(assert (=> d!71191 (=> (not res!191244) (not e!211850))))

(assert (=> d!71191 (= res!191244 (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(assert (=> d!71191 (= lt!163056 e!211859)))

(declare-fun c!53022 () Bool)

(assert (=> d!71191 (= c!53022 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71191 (validMask!0 mask!2385)))

(assert (=> d!71191 (= (getCurrentListMap!1675 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163065)))

(declare-fun b!345669 () Bool)

(assert (=> b!345669 (= e!211851 call!26730)))

(declare-fun bm!26730 () Bool)

(assert (=> bm!26730 (= call!26730 call!26729)))

(declare-fun b!345670 () Bool)

(assert (=> b!345670 (= e!211850 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26731 () Bool)

(assert (=> bm!26731 (= call!26729 (+!733 (ite c!53022 call!26731 (ite c!53019 call!26735 call!26733)) (ite (or c!53022 c!53019) (tuple2!5347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!345671 () Bool)

(assert (=> b!345671 (= e!211852 e!211858)))

(declare-fun c!53024 () Bool)

(assert (=> b!345671 (= c!53024 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26732 () Bool)

(assert (=> bm!26732 (= call!26734 (contains!2225 lt!163065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345672 () Bool)

(declare-fun e!211860 () Bool)

(assert (=> b!345672 (= e!211860 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345673 () Bool)

(declare-fun lt!163060 () Unit!10705)

(assert (=> b!345673 (= e!211857 lt!163060)))

(declare-fun lt!163059 () ListLongMap!4261)

(assert (=> b!345673 (= lt!163059 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163063 () (_ BitVec 64))

(assert (=> b!345673 (= lt!163063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163046 () (_ BitVec 64))

(assert (=> b!345673 (= lt!163046 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163057 () Unit!10705)

(declare-fun addStillContains!258 (ListLongMap!4261 (_ BitVec 64) V!10867 (_ BitVec 64)) Unit!10705)

(assert (=> b!345673 (= lt!163057 (addStillContains!258 lt!163059 lt!163063 zeroValue!1467 lt!163046))))

(assert (=> b!345673 (contains!2225 (+!733 lt!163059 (tuple2!5347 lt!163063 zeroValue!1467)) lt!163046)))

(declare-fun lt!163055 () Unit!10705)

(assert (=> b!345673 (= lt!163055 lt!163057)))

(declare-fun lt!163051 () ListLongMap!4261)

(assert (=> b!345673 (= lt!163051 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163048 () (_ BitVec 64))

(assert (=> b!345673 (= lt!163048 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163061 () (_ BitVec 64))

(assert (=> b!345673 (= lt!163061 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163052 () Unit!10705)

(declare-fun addApplyDifferent!258 (ListLongMap!4261 (_ BitVec 64) V!10867 (_ BitVec 64)) Unit!10705)

(assert (=> b!345673 (= lt!163052 (addApplyDifferent!258 lt!163051 lt!163048 minValue!1467 lt!163061))))

(assert (=> b!345673 (= (apply!282 (+!733 lt!163051 (tuple2!5347 lt!163048 minValue!1467)) lt!163061) (apply!282 lt!163051 lt!163061))))

(declare-fun lt!163045 () Unit!10705)

(assert (=> b!345673 (= lt!163045 lt!163052)))

(declare-fun lt!163049 () ListLongMap!4261)

(assert (=> b!345673 (= lt!163049 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163053 () (_ BitVec 64))

(assert (=> b!345673 (= lt!163053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163064 () (_ BitVec 64))

(assert (=> b!345673 (= lt!163064 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163047 () Unit!10705)

(assert (=> b!345673 (= lt!163047 (addApplyDifferent!258 lt!163049 lt!163053 zeroValue!1467 lt!163064))))

(assert (=> b!345673 (= (apply!282 (+!733 lt!163049 (tuple2!5347 lt!163053 zeroValue!1467)) lt!163064) (apply!282 lt!163049 lt!163064))))

(declare-fun lt!163062 () Unit!10705)

(assert (=> b!345673 (= lt!163062 lt!163047)))

(declare-fun lt!163054 () ListLongMap!4261)

(assert (=> b!345673 (= lt!163054 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163058 () (_ BitVec 64))

(assert (=> b!345673 (= lt!163058 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163066 () (_ BitVec 64))

(assert (=> b!345673 (= lt!163066 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345673 (= lt!163060 (addApplyDifferent!258 lt!163054 lt!163058 minValue!1467 lt!163066))))

(assert (=> b!345673 (= (apply!282 (+!733 lt!163054 (tuple2!5347 lt!163058 minValue!1467)) lt!163066) (apply!282 lt!163054 lt!163066))))

(declare-fun b!345674 () Bool)

(declare-fun res!191241 () Bool)

(assert (=> b!345674 (=> (not res!191241) (not e!211852))))

(assert (=> b!345674 (= res!191241 e!211862)))

(declare-fun res!191247 () Bool)

(assert (=> b!345674 (=> res!191247 e!211862)))

(assert (=> b!345674 (= res!191247 (not e!211860))))

(declare-fun res!191242 () Bool)

(assert (=> b!345674 (=> (not res!191242) (not e!211860))))

(assert (=> b!345674 (= res!191242 (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(declare-fun b!345675 () Bool)

(assert (=> b!345675 (= e!211861 (= (apply!282 lt!163065 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(assert (= (and d!71191 c!53022) b!345658))

(assert (= (and d!71191 (not c!53022)) b!345657))

(assert (= (and b!345657 c!53019) b!345656))

(assert (= (and b!345657 (not c!53019)) b!345660))

(assert (= (and b!345660 c!53021) b!345669))

(assert (= (and b!345660 (not c!53021)) b!345655))

(assert (= (or b!345669 b!345655) bm!26726))

(assert (= (or b!345656 bm!26726) bm!26729))

(assert (= (or b!345656 b!345669) bm!26730))

(assert (= (or b!345658 bm!26729) bm!26728))

(assert (= (or b!345658 bm!26730) bm!26731))

(assert (= (and d!71191 res!191244) b!345670))

(assert (= (and d!71191 c!53020) b!345673))

(assert (= (and d!71191 (not c!53020)) b!345661))

(assert (= (and d!71191 res!191249) b!345674))

(assert (= (and b!345674 res!191242) b!345672))

(assert (= (and b!345674 (not res!191247)) b!345664))

(assert (= (and b!345664 res!191243) b!345668))

(assert (= (and b!345674 res!191241) b!345662))

(assert (= (and b!345662 c!53023) b!345665))

(assert (= (and b!345662 (not c!53023)) b!345667))

(assert (= (and b!345665 res!191246) b!345659))

(assert (= (or b!345665 b!345667) bm!26732))

(assert (= (and b!345662 res!191245) b!345671))

(assert (= (and b!345671 c!53024) b!345666))

(assert (= (and b!345671 (not c!53024)) b!345663))

(assert (= (and b!345666 res!191248) b!345675))

(assert (= (or b!345666 b!345663) bm!26727))

(declare-fun b_lambda!8489 () Bool)

(assert (=> (not b_lambda!8489) (not b!345668)))

(declare-fun t!10068 () Bool)

(declare-fun tb!3071 () Bool)

(assert (=> (and start!34566 (= defaultEntry!1528 defaultEntry!1528) t!10068) tb!3071))

(declare-fun result!5559 () Bool)

(assert (=> tb!3071 (= result!5559 tp_is_empty!7417)))

(assert (=> b!345668 t!10068))

(declare-fun b_and!14697 () Bool)

(assert (= b_and!14691 (and (=> t!10068 result!5559) b_and!14697)))

(declare-fun m!347217 () Bool)

(assert (=> b!345670 m!347217))

(assert (=> b!345670 m!347217))

(declare-fun m!347219 () Bool)

(assert (=> b!345670 m!347219))

(declare-fun m!347221 () Bool)

(assert (=> bm!26727 m!347221))

(declare-fun m!347223 () Bool)

(assert (=> bm!26728 m!347223))

(assert (=> d!71191 m!347149))

(declare-fun m!347225 () Bool)

(assert (=> b!345675 m!347225))

(declare-fun m!347227 () Bool)

(assert (=> bm!26731 m!347227))

(assert (=> b!345668 m!347217))

(assert (=> b!345668 m!347217))

(declare-fun m!347229 () Bool)

(assert (=> b!345668 m!347229))

(declare-fun m!347231 () Bool)

(assert (=> b!345668 m!347231))

(declare-fun m!347233 () Bool)

(assert (=> b!345668 m!347233))

(assert (=> b!345668 m!347231))

(assert (=> b!345668 m!347233))

(declare-fun m!347235 () Bool)

(assert (=> b!345668 m!347235))

(declare-fun m!347237 () Bool)

(assert (=> b!345659 m!347237))

(assert (=> b!345664 m!347217))

(assert (=> b!345664 m!347217))

(declare-fun m!347239 () Bool)

(assert (=> b!345664 m!347239))

(declare-fun m!347241 () Bool)

(assert (=> b!345658 m!347241))

(assert (=> b!345673 m!347217))

(declare-fun m!347243 () Bool)

(assert (=> b!345673 m!347243))

(declare-fun m!347245 () Bool)

(assert (=> b!345673 m!347245))

(declare-fun m!347247 () Bool)

(assert (=> b!345673 m!347247))

(declare-fun m!347249 () Bool)

(assert (=> b!345673 m!347249))

(declare-fun m!347251 () Bool)

(assert (=> b!345673 m!347251))

(assert (=> b!345673 m!347247))

(declare-fun m!347253 () Bool)

(assert (=> b!345673 m!347253))

(declare-fun m!347255 () Bool)

(assert (=> b!345673 m!347255))

(declare-fun m!347257 () Bool)

(assert (=> b!345673 m!347257))

(declare-fun m!347259 () Bool)

(assert (=> b!345673 m!347259))

(declare-fun m!347261 () Bool)

(assert (=> b!345673 m!347261))

(assert (=> b!345673 m!347251))

(declare-fun m!347263 () Bool)

(assert (=> b!345673 m!347263))

(assert (=> b!345673 m!347223))

(assert (=> b!345673 m!347255))

(declare-fun m!347265 () Bool)

(assert (=> b!345673 m!347265))

(declare-fun m!347267 () Bool)

(assert (=> b!345673 m!347267))

(declare-fun m!347269 () Bool)

(assert (=> b!345673 m!347269))

(declare-fun m!347271 () Bool)

(assert (=> b!345673 m!347271))

(assert (=> b!345673 m!347259))

(assert (=> b!345672 m!347217))

(assert (=> b!345672 m!347217))

(assert (=> b!345672 m!347219))

(declare-fun m!347273 () Bool)

(assert (=> bm!26732 m!347273))

(assert (=> b!345542 d!71191))

(declare-fun d!71193 () Bool)

(assert (=> d!71193 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34566 d!71193))

(declare-fun d!71195 () Bool)

(assert (=> d!71195 (= (array_inv!6444 _values!1525) (bvsge (size!9074 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34566 d!71195))

(declare-fun d!71197 () Bool)

(assert (=> d!71197 (= (array_inv!6445 _keys!1895) (bvsge (size!9073 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34566 d!71197))

(declare-fun d!71199 () Bool)

(assert (=> d!71199 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345547 d!71199))

(declare-fun b!345686 () Bool)

(declare-fun e!211870 () Bool)

(declare-fun e!211869 () Bool)

(assert (=> b!345686 (= e!211870 e!211869)))

(declare-fun lt!163074 () (_ BitVec 64))

(assert (=> b!345686 (= lt!163074 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163075 () Unit!10705)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18414 (_ BitVec 64) (_ BitVec 32)) Unit!10705)

(assert (=> b!345686 (= lt!163075 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163074 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!18414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345686 (arrayContainsKey!0 _keys!1895 lt!163074 #b00000000000000000000000000000000)))

(declare-fun lt!163073 () Unit!10705)

(assert (=> b!345686 (= lt!163073 lt!163075)))

(declare-fun res!191254 () Bool)

(assert (=> b!345686 (= res!191254 (= (seekEntryOrOpen!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3314 #b00000000000000000000000000000000)))))

(assert (=> b!345686 (=> (not res!191254) (not e!211869))))

(declare-fun b!345687 () Bool)

(declare-fun call!26738 () Bool)

(assert (=> b!345687 (= e!211870 call!26738)))

(declare-fun bm!26735 () Bool)

(assert (=> bm!26735 (= call!26738 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!345689 () Bool)

(assert (=> b!345689 (= e!211869 call!26738)))

(declare-fun b!345688 () Bool)

(declare-fun e!211871 () Bool)

(assert (=> b!345688 (= e!211871 e!211870)))

(declare-fun c!53027 () Bool)

(assert (=> b!345688 (= c!53027 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71201 () Bool)

(declare-fun res!191255 () Bool)

(assert (=> d!71201 (=> res!191255 e!211871)))

(assert (=> d!71201 (= res!191255 (bvsge #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(assert (=> d!71201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211871)))

(assert (= (and d!71201 (not res!191255)) b!345688))

(assert (= (and b!345688 c!53027) b!345686))

(assert (= (and b!345688 (not c!53027)) b!345687))

(assert (= (and b!345686 res!191254) b!345689))

(assert (= (or b!345689 b!345687) bm!26735))

(assert (=> b!345686 m!347217))

(declare-fun m!347275 () Bool)

(assert (=> b!345686 m!347275))

(declare-fun m!347277 () Bool)

(assert (=> b!345686 m!347277))

(assert (=> b!345686 m!347217))

(declare-fun m!347279 () Bool)

(assert (=> b!345686 m!347279))

(declare-fun m!347281 () Bool)

(assert (=> bm!26735 m!347281))

(assert (=> b!345688 m!347217))

(assert (=> b!345688 m!347217))

(assert (=> b!345688 m!347219))

(assert (=> b!345548 d!71201))

(declare-fun b!345702 () Bool)

(declare-fun e!211879 () SeekEntryResult!3314)

(declare-fun e!211878 () SeekEntryResult!3314)

(assert (=> b!345702 (= e!211879 e!211878)))

(declare-fun lt!163083 () (_ BitVec 64))

(declare-fun lt!163082 () SeekEntryResult!3314)

(assert (=> b!345702 (= lt!163083 (select (arr!8721 _keys!1895) (index!15437 lt!163082)))))

(declare-fun c!53034 () Bool)

(assert (=> b!345702 (= c!53034 (= lt!163083 k0!1348))))

(declare-fun b!345703 () Bool)

(assert (=> b!345703 (= e!211878 (Found!3314 (index!15437 lt!163082)))))

(declare-fun b!345704 () Bool)

(declare-fun c!53036 () Bool)

(assert (=> b!345704 (= c!53036 (= lt!163083 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!211880 () SeekEntryResult!3314)

(assert (=> b!345704 (= e!211878 e!211880)))

(declare-fun d!71203 () Bool)

(declare-fun lt!163084 () SeekEntryResult!3314)

(assert (=> d!71203 (and (or ((_ is Undefined!3314) lt!163084) (not ((_ is Found!3314) lt!163084)) (and (bvsge (index!15436 lt!163084) #b00000000000000000000000000000000) (bvslt (index!15436 lt!163084) (size!9073 _keys!1895)))) (or ((_ is Undefined!3314) lt!163084) ((_ is Found!3314) lt!163084) (not ((_ is MissingZero!3314) lt!163084)) (and (bvsge (index!15435 lt!163084) #b00000000000000000000000000000000) (bvslt (index!15435 lt!163084) (size!9073 _keys!1895)))) (or ((_ is Undefined!3314) lt!163084) ((_ is Found!3314) lt!163084) ((_ is MissingZero!3314) lt!163084) (not ((_ is MissingVacant!3314) lt!163084)) (and (bvsge (index!15438 lt!163084) #b00000000000000000000000000000000) (bvslt (index!15438 lt!163084) (size!9073 _keys!1895)))) (or ((_ is Undefined!3314) lt!163084) (ite ((_ is Found!3314) lt!163084) (= (select (arr!8721 _keys!1895) (index!15436 lt!163084)) k0!1348) (ite ((_ is MissingZero!3314) lt!163084) (= (select (arr!8721 _keys!1895) (index!15435 lt!163084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3314) lt!163084) (= (select (arr!8721 _keys!1895) (index!15438 lt!163084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71203 (= lt!163084 e!211879)))

(declare-fun c!53035 () Bool)

(assert (=> d!71203 (= c!53035 (and ((_ is Intermediate!3314) lt!163082) (undefined!4126 lt!163082)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18414 (_ BitVec 32)) SeekEntryResult!3314)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71203 (= lt!163082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71203 (validMask!0 mask!2385)))

(assert (=> d!71203 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163084)))

(declare-fun b!345705 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18414 (_ BitVec 32)) SeekEntryResult!3314)

(assert (=> b!345705 (= e!211880 (seekKeyOrZeroReturnVacant!0 (x!34381 lt!163082) (index!15437 lt!163082) (index!15437 lt!163082) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345706 () Bool)

(assert (=> b!345706 (= e!211880 (MissingZero!3314 (index!15437 lt!163082)))))

(declare-fun b!345707 () Bool)

(assert (=> b!345707 (= e!211879 Undefined!3314)))

(assert (= (and d!71203 c!53035) b!345707))

(assert (= (and d!71203 (not c!53035)) b!345702))

(assert (= (and b!345702 c!53034) b!345703))

(assert (= (and b!345702 (not c!53034)) b!345704))

(assert (= (and b!345704 c!53036) b!345706))

(assert (= (and b!345704 (not c!53036)) b!345705))

(declare-fun m!347283 () Bool)

(assert (=> b!345702 m!347283))

(declare-fun m!347285 () Bool)

(assert (=> d!71203 m!347285))

(declare-fun m!347287 () Bool)

(assert (=> d!71203 m!347287))

(declare-fun m!347289 () Bool)

(assert (=> d!71203 m!347289))

(assert (=> d!71203 m!347285))

(assert (=> d!71203 m!347149))

(declare-fun m!347291 () Bool)

(assert (=> d!71203 m!347291))

(declare-fun m!347293 () Bool)

(assert (=> d!71203 m!347293))

(declare-fun m!347295 () Bool)

(assert (=> b!345705 m!347295))

(assert (=> b!345541 d!71203))

(declare-fun b!345718 () Bool)

(declare-fun e!211889 () Bool)

(declare-fun call!26741 () Bool)

(assert (=> b!345718 (= e!211889 call!26741)))

(declare-fun d!71205 () Bool)

(declare-fun res!191264 () Bool)

(declare-fun e!211890 () Bool)

(assert (=> d!71205 (=> res!191264 e!211890)))

(assert (=> d!71205 (= res!191264 (bvsge #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(assert (=> d!71205 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4949) e!211890)))

(declare-fun b!345719 () Bool)

(declare-fun e!211892 () Bool)

(assert (=> b!345719 (= e!211892 e!211889)))

(declare-fun c!53039 () Bool)

(assert (=> b!345719 (= c!53039 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345720 () Bool)

(assert (=> b!345720 (= e!211890 e!211892)))

(declare-fun res!191263 () Bool)

(assert (=> b!345720 (=> (not res!191263) (not e!211892))))

(declare-fun e!211891 () Bool)

(assert (=> b!345720 (= res!191263 (not e!211891))))

(declare-fun res!191262 () Bool)

(assert (=> b!345720 (=> (not res!191262) (not e!211891))))

(assert (=> b!345720 (= res!191262 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345721 () Bool)

(assert (=> b!345721 (= e!211889 call!26741)))

(declare-fun bm!26738 () Bool)

(assert (=> bm!26738 (= call!26741 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53039 (Cons!4948 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000) Nil!4949) Nil!4949)))))

(declare-fun b!345722 () Bool)

(declare-fun contains!2227 (List!4952 (_ BitVec 64)) Bool)

(assert (=> b!345722 (= e!211891 (contains!2227 Nil!4949 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71205 (not res!191264)) b!345720))

(assert (= (and b!345720 res!191262) b!345722))

(assert (= (and b!345720 res!191263) b!345719))

(assert (= (and b!345719 c!53039) b!345718))

(assert (= (and b!345719 (not c!53039)) b!345721))

(assert (= (or b!345718 b!345721) bm!26738))

(assert (=> b!345719 m!347217))

(assert (=> b!345719 m!347217))

(assert (=> b!345719 m!347219))

(assert (=> b!345720 m!347217))

(assert (=> b!345720 m!347217))

(assert (=> b!345720 m!347219))

(assert (=> bm!26738 m!347217))

(declare-fun m!347297 () Bool)

(assert (=> bm!26738 m!347297))

(assert (=> b!345722 m!347217))

(assert (=> b!345722 m!347217))

(declare-fun m!347299 () Bool)

(assert (=> b!345722 m!347299))

(assert (=> b!345549 d!71205))

(declare-fun condMapEmpty!12579 () Bool)

(declare-fun mapDefault!12579 () ValueCell!3365)

(assert (=> mapNonEmpty!12570 (= condMapEmpty!12579 (= mapRest!12570 ((as const (Array (_ BitVec 32) ValueCell!3365)) mapDefault!12579)))))

(declare-fun e!211898 () Bool)

(declare-fun mapRes!12579 () Bool)

(assert (=> mapNonEmpty!12570 (= tp!25946 (and e!211898 mapRes!12579))))

(declare-fun mapIsEmpty!12579 () Bool)

(assert (=> mapIsEmpty!12579 mapRes!12579))

(declare-fun b!345729 () Bool)

(declare-fun e!211897 () Bool)

(assert (=> b!345729 (= e!211897 tp_is_empty!7417)))

(declare-fun b!345730 () Bool)

(assert (=> b!345730 (= e!211898 tp_is_empty!7417)))

(declare-fun mapNonEmpty!12579 () Bool)

(declare-fun tp!25962 () Bool)

(assert (=> mapNonEmpty!12579 (= mapRes!12579 (and tp!25962 e!211897))))

(declare-fun mapRest!12579 () (Array (_ BitVec 32) ValueCell!3365))

(declare-fun mapKey!12579 () (_ BitVec 32))

(declare-fun mapValue!12579 () ValueCell!3365)

(assert (=> mapNonEmpty!12579 (= mapRest!12570 (store mapRest!12579 mapKey!12579 mapValue!12579))))

(assert (= (and mapNonEmpty!12570 condMapEmpty!12579) mapIsEmpty!12579))

(assert (= (and mapNonEmpty!12570 (not condMapEmpty!12579)) mapNonEmpty!12579))

(assert (= (and mapNonEmpty!12579 ((_ is ValueCellFull!3365) mapValue!12579)) b!345729))

(assert (= (and mapNonEmpty!12570 ((_ is ValueCellFull!3365) mapDefault!12579)) b!345730))

(declare-fun m!347301 () Bool)

(assert (=> mapNonEmpty!12579 m!347301))

(declare-fun b_lambda!8491 () Bool)

(assert (= b_lambda!8489 (or (and start!34566 b_free!7465) b_lambda!8491)))

(check-sat (not b!345722) (not d!71203) (not b!345673) (not b!345610) (not b!345664) (not b!345705) (not bm!26727) b_and!14697 tp_is_empty!7417 (not b!345719) (not bm!26735) (not b!345668) (not b!345659) (not d!71191) (not b!345686) (not b!345720) (not b_lambda!8491) (not b!345670) (not bm!26728) (not mapNonEmpty!12579) (not b!345688) (not b!345612) (not b!345658) (not bm!26738) (not bm!26731) (not bm!26732) (not b!345675) (not b_next!7465) (not d!71189) (not b!345672))
(check-sat b_and!14697 (not b_next!7465))
