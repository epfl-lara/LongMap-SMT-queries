; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34850 () Bool)

(assert start!34850)

(declare-fun b_free!7635 () Bool)

(declare-fun b_next!7635 () Bool)

(assert (=> start!34850 (= b_free!7635 (not b_next!7635))))

(declare-fun tp!26471 () Bool)

(declare-fun b_and!14857 () Bool)

(assert (=> start!34850 (= tp!26471 b_and!14857)))

(declare-fun b!349037 () Bool)

(declare-fun e!213812 () Bool)

(declare-fun e!213809 () Bool)

(assert (=> b!349037 (= e!213812 e!213809)))

(declare-fun res!193449 () Bool)

(assert (=> b!349037 (=> (not res!193449) (not e!213809))))

(declare-datatypes ((SeekEntryResult!3425 0))(
  ( (MissingZero!3425 (index!15879 (_ BitVec 32))) (Found!3425 (index!15880 (_ BitVec 32))) (Intermediate!3425 (undefined!4237 Bool) (index!15881 (_ BitVec 32)) (x!34769 (_ BitVec 32))) (Undefined!3425) (MissingVacant!3425 (index!15882 (_ BitVec 32))) )
))
(declare-fun lt!163987 () SeekEntryResult!3425)

(get-info :version)

(assert (=> b!349037 (= res!193449 (and (not ((_ is Found!3425) lt!163987)) ((_ is MissingZero!3425) lt!163987)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18759 0))(
  ( (array!18760 (arr!8889 (Array (_ BitVec 32) (_ BitVec 64))) (size!9241 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18759)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18759 (_ BitVec 32)) SeekEntryResult!3425)

(assert (=> b!349037 (= lt!163987 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349038 () Bool)

(declare-fun res!193450 () Bool)

(assert (=> b!349038 (=> (not res!193450) (not e!213812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18759 (_ BitVec 32)) Bool)

(assert (=> b!349038 (= res!193450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12840 () Bool)

(declare-fun mapRes!12840 () Bool)

(assert (=> mapIsEmpty!12840 mapRes!12840))

(declare-fun res!193455 () Bool)

(assert (=> start!34850 (=> (not res!193455) (not e!213812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34850 (= res!193455 (validMask!0 mask!2385))))

(assert (=> start!34850 e!213812))

(assert (=> start!34850 true))

(declare-fun tp_is_empty!7587 () Bool)

(assert (=> start!34850 tp_is_empty!7587))

(assert (=> start!34850 tp!26471))

(declare-datatypes ((V!11093 0))(
  ( (V!11094 (val!3838 Int)) )
))
(declare-datatypes ((ValueCell!3450 0))(
  ( (ValueCellFull!3450 (v!6021 V!11093)) (EmptyCell!3450) )
))
(declare-datatypes ((array!18761 0))(
  ( (array!18762 (arr!8890 (Array (_ BitVec 32) ValueCell!3450)) (size!9242 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18761)

(declare-fun e!213808 () Bool)

(declare-fun array_inv!6574 (array!18761) Bool)

(assert (=> start!34850 (and (array_inv!6574 _values!1525) e!213808)))

(declare-fun array_inv!6575 (array!18759) Bool)

(assert (=> start!34850 (array_inv!6575 _keys!1895)))

(declare-fun b!349039 () Bool)

(declare-fun e!213810 () Bool)

(assert (=> b!349039 (= e!213810 tp_is_empty!7587)))

(declare-fun mapNonEmpty!12840 () Bool)

(declare-fun tp!26472 () Bool)

(assert (=> mapNonEmpty!12840 (= mapRes!12840 (and tp!26472 e!213810))))

(declare-fun mapValue!12840 () ValueCell!3450)

(declare-fun mapRest!12840 () (Array (_ BitVec 32) ValueCell!3450))

(declare-fun mapKey!12840 () (_ BitVec 32))

(assert (=> mapNonEmpty!12840 (= (arr!8890 _values!1525) (store mapRest!12840 mapKey!12840 mapValue!12840))))

(declare-fun b!349040 () Bool)

(declare-fun e!213811 () Bool)

(assert (=> b!349040 (= e!213811 tp_is_empty!7587)))

(declare-fun b!349041 () Bool)

(declare-fun res!193451 () Bool)

(assert (=> b!349041 (=> (not res!193451) (not e!213809))))

(declare-fun arrayContainsKey!0 (array!18759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349041 (= res!193451 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349042 () Bool)

(declare-fun res!193454 () Bool)

(assert (=> b!349042 (=> (not res!193454) (not e!213812))))

(declare-datatypes ((List!5165 0))(
  ( (Nil!5162) (Cons!5161 (h!6017 (_ BitVec 64)) (t!10295 List!5165)) )
))
(declare-fun arrayNoDuplicates!0 (array!18759 (_ BitVec 32) List!5165) Bool)

(assert (=> b!349042 (= res!193454 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5162))))

(declare-fun b!349043 () Bool)

(assert (=> b!349043 (= e!213808 (and e!213811 mapRes!12840))))

(declare-fun condMapEmpty!12840 () Bool)

(declare-fun mapDefault!12840 () ValueCell!3450)

(assert (=> b!349043 (= condMapEmpty!12840 (= (arr!8890 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3450)) mapDefault!12840)))))

(declare-fun b!349044 () Bool)

(declare-fun lt!163986 () (_ BitVec 32))

(assert (=> b!349044 (= e!213809 (or (bvslt lt!163986 #b00000000000000000000000000000000) (bvsge lt!163986 (size!9241 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18759 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349044 (= lt!163986 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349045 () Bool)

(declare-fun res!193452 () Bool)

(assert (=> b!349045 (=> (not res!193452) (not e!213812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349045 (= res!193452 (validKeyInArray!0 k0!1348))))

(declare-fun b!349046 () Bool)

(declare-fun res!193456 () Bool)

(assert (=> b!349046 (=> (not res!193456) (not e!213812))))

(declare-fun zeroValue!1467 () V!11093)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11093)

(declare-datatypes ((tuple2!5544 0))(
  ( (tuple2!5545 (_1!2783 (_ BitVec 64)) (_2!2783 V!11093)) )
))
(declare-datatypes ((List!5166 0))(
  ( (Nil!5163) (Cons!5162 (h!6018 tuple2!5544) (t!10296 List!5166)) )
))
(declare-datatypes ((ListLongMap!4457 0))(
  ( (ListLongMap!4458 (toList!2244 List!5166)) )
))
(declare-fun contains!2309 (ListLongMap!4457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1765 (array!18759 array!18761 (_ BitVec 32) (_ BitVec 32) V!11093 V!11093 (_ BitVec 32) Int) ListLongMap!4457)

(assert (=> b!349046 (= res!193456 (not (contains!2309 (getCurrentListMap!1765 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349047 () Bool)

(declare-fun res!193453 () Bool)

(assert (=> b!349047 (=> (not res!193453) (not e!213812))))

(assert (=> b!349047 (= res!193453 (and (= (size!9242 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9241 _keys!1895) (size!9242 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34850 res!193455) b!349047))

(assert (= (and b!349047 res!193453) b!349038))

(assert (= (and b!349038 res!193450) b!349042))

(assert (= (and b!349042 res!193454) b!349045))

(assert (= (and b!349045 res!193452) b!349046))

(assert (= (and b!349046 res!193456) b!349037))

(assert (= (and b!349037 res!193449) b!349041))

(assert (= (and b!349041 res!193451) b!349044))

(assert (= (and b!349043 condMapEmpty!12840) mapIsEmpty!12840))

(assert (= (and b!349043 (not condMapEmpty!12840)) mapNonEmpty!12840))

(assert (= (and mapNonEmpty!12840 ((_ is ValueCellFull!3450) mapValue!12840)) b!349039))

(assert (= (and b!349043 ((_ is ValueCellFull!3450) mapDefault!12840)) b!349040))

(assert (= start!34850 b!349043))

(declare-fun m!349645 () Bool)

(assert (=> b!349046 m!349645))

(assert (=> b!349046 m!349645))

(declare-fun m!349647 () Bool)

(assert (=> b!349046 m!349647))

(declare-fun m!349649 () Bool)

(assert (=> b!349045 m!349649))

(declare-fun m!349651 () Bool)

(assert (=> b!349038 m!349651))

(declare-fun m!349653 () Bool)

(assert (=> start!34850 m!349653))

(declare-fun m!349655 () Bool)

(assert (=> start!34850 m!349655))

(declare-fun m!349657 () Bool)

(assert (=> start!34850 m!349657))

(declare-fun m!349659 () Bool)

(assert (=> b!349041 m!349659))

(declare-fun m!349661 () Bool)

(assert (=> b!349037 m!349661))

(declare-fun m!349663 () Bool)

(assert (=> mapNonEmpty!12840 m!349663))

(declare-fun m!349665 () Bool)

(assert (=> b!349042 m!349665))

(declare-fun m!349667 () Bool)

(assert (=> b!349044 m!349667))

(check-sat (not b!349045) (not b_next!7635) (not mapNonEmpty!12840) b_and!14857 (not b!349041) (not b!349037) (not b!349038) tp_is_empty!7587 (not b!349044) (not b!349046) (not b!349042) (not start!34850))
(check-sat b_and!14857 (not b_next!7635))
(get-model)

(declare-fun b!349091 () Bool)

(declare-fun e!213839 () Bool)

(declare-fun call!26866 () Bool)

(assert (=> b!349091 (= e!213839 call!26866)))

(declare-fun bm!26863 () Bool)

(declare-fun c!53211 () Bool)

(assert (=> bm!26863 (= call!26866 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53211 (Cons!5161 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000) Nil!5162) Nil!5162)))))

(declare-fun b!349092 () Bool)

(assert (=> b!349092 (= e!213839 call!26866)))

(declare-fun b!349093 () Bool)

(declare-fun e!213841 () Bool)

(assert (=> b!349093 (= e!213841 e!213839)))

(assert (=> b!349093 (= c!53211 (validKeyInArray!0 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349094 () Bool)

(declare-fun e!213842 () Bool)

(declare-fun contains!2310 (List!5165 (_ BitVec 64)) Bool)

(assert (=> b!349094 (= e!213842 (contains!2310 Nil!5162 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71319 () Bool)

(declare-fun res!193489 () Bool)

(declare-fun e!213840 () Bool)

(assert (=> d!71319 (=> res!193489 e!213840)))

(assert (=> d!71319 (= res!193489 (bvsge #b00000000000000000000000000000000 (size!9241 _keys!1895)))))

(assert (=> d!71319 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5162) e!213840)))

(declare-fun b!349095 () Bool)

(assert (=> b!349095 (= e!213840 e!213841)))

(declare-fun res!193487 () Bool)

(assert (=> b!349095 (=> (not res!193487) (not e!213841))))

(assert (=> b!349095 (= res!193487 (not e!213842))))

(declare-fun res!193488 () Bool)

(assert (=> b!349095 (=> (not res!193488) (not e!213842))))

(assert (=> b!349095 (= res!193488 (validKeyInArray!0 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71319 (not res!193489)) b!349095))

(assert (= (and b!349095 res!193488) b!349094))

(assert (= (and b!349095 res!193487) b!349093))

(assert (= (and b!349093 c!53211) b!349092))

(assert (= (and b!349093 (not c!53211)) b!349091))

(assert (= (or b!349092 b!349091) bm!26863))

(declare-fun m!349693 () Bool)

(assert (=> bm!26863 m!349693))

(declare-fun m!349695 () Bool)

(assert (=> bm!26863 m!349695))

(assert (=> b!349093 m!349693))

(assert (=> b!349093 m!349693))

(declare-fun m!349697 () Bool)

(assert (=> b!349093 m!349697))

(assert (=> b!349094 m!349693))

(assert (=> b!349094 m!349693))

(declare-fun m!349699 () Bool)

(assert (=> b!349094 m!349699))

(assert (=> b!349095 m!349693))

(assert (=> b!349095 m!349693))

(assert (=> b!349095 m!349697))

(assert (=> b!349042 d!71319))

(declare-fun b!349104 () Bool)

(declare-fun e!213849 () Bool)

(declare-fun e!213851 () Bool)

(assert (=> b!349104 (= e!213849 e!213851)))

(declare-fun lt!164002 () (_ BitVec 64))

(assert (=> b!349104 (= lt!164002 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10805 0))(
  ( (Unit!10806) )
))
(declare-fun lt!164001 () Unit!10805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18759 (_ BitVec 64) (_ BitVec 32)) Unit!10805)

(assert (=> b!349104 (= lt!164001 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164002 #b00000000000000000000000000000000))))

(assert (=> b!349104 (arrayContainsKey!0 _keys!1895 lt!164002 #b00000000000000000000000000000000)))

(declare-fun lt!164000 () Unit!10805)

(assert (=> b!349104 (= lt!164000 lt!164001)))

(declare-fun res!193495 () Bool)

(assert (=> b!349104 (= res!193495 (= (seekEntryOrOpen!0 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3425 #b00000000000000000000000000000000)))))

(assert (=> b!349104 (=> (not res!193495) (not e!213851))))

(declare-fun bm!26866 () Bool)

(declare-fun call!26869 () Bool)

(assert (=> bm!26866 (= call!26869 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71321 () Bool)

(declare-fun res!193494 () Bool)

(declare-fun e!213850 () Bool)

(assert (=> d!71321 (=> res!193494 e!213850)))

(assert (=> d!71321 (= res!193494 (bvsge #b00000000000000000000000000000000 (size!9241 _keys!1895)))))

(assert (=> d!71321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!213850)))

(declare-fun b!349105 () Bool)

(assert (=> b!349105 (= e!213850 e!213849)))

(declare-fun c!53214 () Bool)

(assert (=> b!349105 (= c!53214 (validKeyInArray!0 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349106 () Bool)

(assert (=> b!349106 (= e!213851 call!26869)))

(declare-fun b!349107 () Bool)

(assert (=> b!349107 (= e!213849 call!26869)))

(assert (= (and d!71321 (not res!193494)) b!349105))

(assert (= (and b!349105 c!53214) b!349104))

(assert (= (and b!349105 (not c!53214)) b!349107))

(assert (= (and b!349104 res!193495) b!349106))

(assert (= (or b!349106 b!349107) bm!26866))

(assert (=> b!349104 m!349693))

(declare-fun m!349701 () Bool)

(assert (=> b!349104 m!349701))

(declare-fun m!349703 () Bool)

(assert (=> b!349104 m!349703))

(assert (=> b!349104 m!349693))

(declare-fun m!349705 () Bool)

(assert (=> b!349104 m!349705))

(declare-fun m!349707 () Bool)

(assert (=> bm!26866 m!349707))

(assert (=> b!349105 m!349693))

(assert (=> b!349105 m!349693))

(assert (=> b!349105 m!349697))

(assert (=> b!349038 d!71321))

(declare-fun d!71323 () Bool)

(assert (=> d!71323 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349045 d!71323))

(declare-fun d!71325 () Bool)

(declare-fun lt!164005 () (_ BitVec 32))

(assert (=> d!71325 (and (or (bvslt lt!164005 #b00000000000000000000000000000000) (bvsge lt!164005 (size!9241 _keys!1895)) (and (bvsge lt!164005 #b00000000000000000000000000000000) (bvslt lt!164005 (size!9241 _keys!1895)))) (bvsge lt!164005 #b00000000000000000000000000000000) (bvslt lt!164005 (size!9241 _keys!1895)) (= (select (arr!8889 _keys!1895) lt!164005) k0!1348))))

(declare-fun e!213854 () (_ BitVec 32))

(assert (=> d!71325 (= lt!164005 e!213854)))

(declare-fun c!53217 () Bool)

(assert (=> d!71325 (= c!53217 (= (select (arr!8889 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9241 _keys!1895)) (bvslt (size!9241 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71325 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164005)))

(declare-fun b!349112 () Bool)

(assert (=> b!349112 (= e!213854 #b00000000000000000000000000000000)))

(declare-fun b!349113 () Bool)

(assert (=> b!349113 (= e!213854 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71325 c!53217) b!349112))

(assert (= (and d!71325 (not c!53217)) b!349113))

(declare-fun m!349709 () Bool)

(assert (=> d!71325 m!349709))

(assert (=> d!71325 m!349693))

(declare-fun m!349711 () Bool)

(assert (=> b!349113 m!349711))

(assert (=> b!349044 d!71325))

(declare-fun d!71327 () Bool)

(declare-fun res!193500 () Bool)

(declare-fun e!213859 () Bool)

(assert (=> d!71327 (=> res!193500 e!213859)))

(assert (=> d!71327 (= res!193500 (= (select (arr!8889 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71327 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!213859)))

(declare-fun b!349118 () Bool)

(declare-fun e!213860 () Bool)

(assert (=> b!349118 (= e!213859 e!213860)))

(declare-fun res!193501 () Bool)

(assert (=> b!349118 (=> (not res!193501) (not e!213860))))

(assert (=> b!349118 (= res!193501 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9241 _keys!1895)))))

(declare-fun b!349119 () Bool)

(assert (=> b!349119 (= e!213860 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71327 (not res!193500)) b!349118))

(assert (= (and b!349118 res!193501) b!349119))

(assert (=> d!71327 m!349693))

(declare-fun m!349713 () Bool)

(assert (=> b!349119 m!349713))

(assert (=> b!349041 d!71327))

(declare-fun d!71329 () Bool)

(declare-fun e!213866 () Bool)

(assert (=> d!71329 e!213866))

(declare-fun res!193504 () Bool)

(assert (=> d!71329 (=> res!193504 e!213866)))

(declare-fun lt!164015 () Bool)

(assert (=> d!71329 (= res!193504 (not lt!164015))))

(declare-fun lt!164014 () Bool)

(assert (=> d!71329 (= lt!164015 lt!164014)))

(declare-fun lt!164017 () Unit!10805)

(declare-fun e!213865 () Unit!10805)

(assert (=> d!71329 (= lt!164017 e!213865)))

(declare-fun c!53220 () Bool)

(assert (=> d!71329 (= c!53220 lt!164014)))

(declare-fun containsKey!337 (List!5166 (_ BitVec 64)) Bool)

(assert (=> d!71329 (= lt!164014 (containsKey!337 (toList!2244 (getCurrentListMap!1765 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71329 (= (contains!2309 (getCurrentListMap!1765 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164015)))

(declare-fun b!349126 () Bool)

(declare-fun lt!164016 () Unit!10805)

(assert (=> b!349126 (= e!213865 lt!164016)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!285 (List!5166 (_ BitVec 64)) Unit!10805)

(assert (=> b!349126 (= lt!164016 (lemmaContainsKeyImpliesGetValueByKeyDefined!285 (toList!2244 (getCurrentListMap!1765 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!351 0))(
  ( (Some!350 (v!6023 V!11093)) (None!349) )
))
(declare-fun isDefined!286 (Option!351) Bool)

(declare-fun getValueByKey!345 (List!5166 (_ BitVec 64)) Option!351)

(assert (=> b!349126 (isDefined!286 (getValueByKey!345 (toList!2244 (getCurrentListMap!1765 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349127 () Bool)

(declare-fun Unit!10807 () Unit!10805)

(assert (=> b!349127 (= e!213865 Unit!10807)))

(declare-fun b!349128 () Bool)

(assert (=> b!349128 (= e!213866 (isDefined!286 (getValueByKey!345 (toList!2244 (getCurrentListMap!1765 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71329 c!53220) b!349126))

(assert (= (and d!71329 (not c!53220)) b!349127))

(assert (= (and d!71329 (not res!193504)) b!349128))

(declare-fun m!349715 () Bool)

(assert (=> d!71329 m!349715))

(declare-fun m!349717 () Bool)

(assert (=> b!349126 m!349717))

(declare-fun m!349719 () Bool)

(assert (=> b!349126 m!349719))

(assert (=> b!349126 m!349719))

(declare-fun m!349721 () Bool)

(assert (=> b!349126 m!349721))

(assert (=> b!349128 m!349719))

(assert (=> b!349128 m!349719))

(assert (=> b!349128 m!349721))

(assert (=> b!349046 d!71329))

(declare-fun d!71331 () Bool)

(declare-fun e!213898 () Bool)

(assert (=> d!71331 e!213898))

(declare-fun res!193525 () Bool)

(assert (=> d!71331 (=> (not res!193525) (not e!213898))))

(assert (=> d!71331 (= res!193525 (or (bvsge #b00000000000000000000000000000000 (size!9241 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9241 _keys!1895)))))))

(declare-fun lt!164083 () ListLongMap!4457)

(declare-fun lt!164065 () ListLongMap!4457)

(assert (=> d!71331 (= lt!164083 lt!164065)))

(declare-fun lt!164066 () Unit!10805)

(declare-fun e!213905 () Unit!10805)

(assert (=> d!71331 (= lt!164066 e!213905)))

(declare-fun c!53238 () Bool)

(declare-fun e!213899 () Bool)

(assert (=> d!71331 (= c!53238 e!213899)))

(declare-fun res!193531 () Bool)

(assert (=> d!71331 (=> (not res!193531) (not e!213899))))

(assert (=> d!71331 (= res!193531 (bvslt #b00000000000000000000000000000000 (size!9241 _keys!1895)))))

(declare-fun e!213903 () ListLongMap!4457)

(assert (=> d!71331 (= lt!164065 e!213903)))

(declare-fun c!53236 () Bool)

(assert (=> d!71331 (= c!53236 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71331 (validMask!0 mask!2385)))

(assert (=> d!71331 (= (getCurrentListMap!1765 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164083)))

(declare-fun b!349171 () Bool)

(declare-fun e!213904 () Bool)

(assert (=> b!349171 (= e!213898 e!213904)))

(declare-fun c!53237 () Bool)

(assert (=> b!349171 (= c!53237 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349172 () Bool)

(declare-fun e!213902 () Bool)

(declare-fun e!213900 () Bool)

(assert (=> b!349172 (= e!213902 e!213900)))

(declare-fun res!193524 () Bool)

(assert (=> b!349172 (=> (not res!193524) (not e!213900))))

(assert (=> b!349172 (= res!193524 (contains!2309 lt!164083 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!349172 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9241 _keys!1895)))))

(declare-fun b!349173 () Bool)

(declare-fun Unit!10808 () Unit!10805)

(assert (=> b!349173 (= e!213905 Unit!10808)))

(declare-fun b!349174 () Bool)

(declare-fun e!213894 () Bool)

(declare-fun apply!287 (ListLongMap!4457 (_ BitVec 64)) V!11093)

(assert (=> b!349174 (= e!213894 (= (apply!287 lt!164083 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26881 () Bool)

(declare-fun call!26888 () ListLongMap!4457)

(declare-fun call!26886 () ListLongMap!4457)

(assert (=> bm!26881 (= call!26888 call!26886)))

(declare-fun b!349175 () Bool)

(declare-fun res!193528 () Bool)

(assert (=> b!349175 (=> (not res!193528) (not e!213898))))

(declare-fun e!213896 () Bool)

(assert (=> b!349175 (= res!193528 e!213896)))

(declare-fun c!53233 () Bool)

(assert (=> b!349175 (= c!53233 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!26889 () ListLongMap!4457)

(declare-fun call!26890 () ListLongMap!4457)

(declare-fun c!53235 () Bool)

(declare-fun call!26884 () ListLongMap!4457)

(declare-fun bm!26882 () Bool)

(declare-fun +!736 (ListLongMap!4457 tuple2!5544) ListLongMap!4457)

(assert (=> bm!26882 (= call!26886 (+!736 (ite c!53236 call!26884 (ite c!53235 call!26890 call!26889)) (ite (or c!53236 c!53235) (tuple2!5545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!349176 () Bool)

(declare-fun e!213895 () Bool)

(assert (=> b!349176 (= e!213904 e!213895)))

(declare-fun res!193526 () Bool)

(declare-fun call!26887 () Bool)

(assert (=> b!349176 (= res!193526 call!26887)))

(assert (=> b!349176 (=> (not res!193526) (not e!213895))))

(declare-fun b!349177 () Bool)

(declare-fun e!213901 () ListLongMap!4457)

(assert (=> b!349177 (= e!213901 call!26889)))

(declare-fun b!349178 () Bool)

(assert (=> b!349178 (= e!213903 (+!736 call!26886 (tuple2!5545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!349179 () Bool)

(declare-fun c!53234 () Bool)

(assert (=> b!349179 (= c!53234 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!213893 () ListLongMap!4457)

(assert (=> b!349179 (= e!213893 e!213901)))

(declare-fun b!349180 () Bool)

(declare-fun call!26885 () Bool)

(assert (=> b!349180 (= e!213896 (not call!26885))))

(declare-fun b!349181 () Bool)

(assert (=> b!349181 (= e!213893 call!26888)))

(declare-fun b!349182 () Bool)

(declare-fun get!4761 (ValueCell!3450 V!11093) V!11093)

(declare-fun dynLambda!630 (Int (_ BitVec 64)) V!11093)

(assert (=> b!349182 (= e!213900 (= (apply!287 lt!164083 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000)) (get!4761 (select (arr!8890 _values!1525) #b00000000000000000000000000000000) (dynLambda!630 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349182 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9242 _values!1525)))))

(assert (=> b!349182 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9241 _keys!1895)))))

(declare-fun b!349183 () Bool)

(declare-fun res!193529 () Bool)

(assert (=> b!349183 (=> (not res!193529) (not e!213898))))

(assert (=> b!349183 (= res!193529 e!213902)))

(declare-fun res!193527 () Bool)

(assert (=> b!349183 (=> res!193527 e!213902)))

(declare-fun e!213897 () Bool)

(assert (=> b!349183 (= res!193527 (not e!213897))))

(declare-fun res!193523 () Bool)

(assert (=> b!349183 (=> (not res!193523) (not e!213897))))

(assert (=> b!349183 (= res!193523 (bvslt #b00000000000000000000000000000000 (size!9241 _keys!1895)))))

(declare-fun b!349184 () Bool)

(assert (=> b!349184 (= e!213895 (= (apply!287 lt!164083 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26883 () Bool)

(assert (=> bm!26883 (= call!26889 call!26890)))

(declare-fun b!349185 () Bool)

(assert (=> b!349185 (= e!213896 e!213894)))

(declare-fun res!193530 () Bool)

(assert (=> b!349185 (= res!193530 call!26885)))

(assert (=> b!349185 (=> (not res!193530) (not e!213894))))

(declare-fun b!349186 () Bool)

(assert (=> b!349186 (= e!213901 call!26888)))

(declare-fun b!349187 () Bool)

(declare-fun lt!164079 () Unit!10805)

(assert (=> b!349187 (= e!213905 lt!164079)))

(declare-fun lt!164082 () ListLongMap!4457)

(declare-fun getCurrentListMapNoExtraKeys!609 (array!18759 array!18761 (_ BitVec 32) (_ BitVec 32) V!11093 V!11093 (_ BitVec 32) Int) ListLongMap!4457)

(assert (=> b!349187 (= lt!164082 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164068 () (_ BitVec 64))

(assert (=> b!349187 (= lt!164068 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164067 () (_ BitVec 64))

(assert (=> b!349187 (= lt!164067 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164076 () Unit!10805)

(declare-fun addStillContains!263 (ListLongMap!4457 (_ BitVec 64) V!11093 (_ BitVec 64)) Unit!10805)

(assert (=> b!349187 (= lt!164076 (addStillContains!263 lt!164082 lt!164068 zeroValue!1467 lt!164067))))

(assert (=> b!349187 (contains!2309 (+!736 lt!164082 (tuple2!5545 lt!164068 zeroValue!1467)) lt!164067)))

(declare-fun lt!164063 () Unit!10805)

(assert (=> b!349187 (= lt!164063 lt!164076)))

(declare-fun lt!164081 () ListLongMap!4457)

(assert (=> b!349187 (= lt!164081 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164072 () (_ BitVec 64))

(assert (=> b!349187 (= lt!164072 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164070 () (_ BitVec 64))

(assert (=> b!349187 (= lt!164070 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164069 () Unit!10805)

(declare-fun addApplyDifferent!263 (ListLongMap!4457 (_ BitVec 64) V!11093 (_ BitVec 64)) Unit!10805)

(assert (=> b!349187 (= lt!164069 (addApplyDifferent!263 lt!164081 lt!164072 minValue!1467 lt!164070))))

(assert (=> b!349187 (= (apply!287 (+!736 lt!164081 (tuple2!5545 lt!164072 minValue!1467)) lt!164070) (apply!287 lt!164081 lt!164070))))

(declare-fun lt!164075 () Unit!10805)

(assert (=> b!349187 (= lt!164075 lt!164069)))

(declare-fun lt!164077 () ListLongMap!4457)

(assert (=> b!349187 (= lt!164077 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164078 () (_ BitVec 64))

(assert (=> b!349187 (= lt!164078 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164074 () (_ BitVec 64))

(assert (=> b!349187 (= lt!164074 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164071 () Unit!10805)

(assert (=> b!349187 (= lt!164071 (addApplyDifferent!263 lt!164077 lt!164078 zeroValue!1467 lt!164074))))

(assert (=> b!349187 (= (apply!287 (+!736 lt!164077 (tuple2!5545 lt!164078 zeroValue!1467)) lt!164074) (apply!287 lt!164077 lt!164074))))

(declare-fun lt!164080 () Unit!10805)

(assert (=> b!349187 (= lt!164080 lt!164071)))

(declare-fun lt!164064 () ListLongMap!4457)

(assert (=> b!349187 (= lt!164064 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164062 () (_ BitVec 64))

(assert (=> b!349187 (= lt!164062 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164073 () (_ BitVec 64))

(assert (=> b!349187 (= lt!164073 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!349187 (= lt!164079 (addApplyDifferent!263 lt!164064 lt!164062 minValue!1467 lt!164073))))

(assert (=> b!349187 (= (apply!287 (+!736 lt!164064 (tuple2!5545 lt!164062 minValue!1467)) lt!164073) (apply!287 lt!164064 lt!164073))))

(declare-fun bm!26884 () Bool)

(assert (=> bm!26884 (= call!26884 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!349188 () Bool)

(assert (=> b!349188 (= e!213904 (not call!26887))))

(declare-fun b!349189 () Bool)

(assert (=> b!349189 (= e!213899 (validKeyInArray!0 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26885 () Bool)

(assert (=> bm!26885 (= call!26885 (contains!2309 lt!164083 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349190 () Bool)

(assert (=> b!349190 (= e!213897 (validKeyInArray!0 (select (arr!8889 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26886 () Bool)

(assert (=> bm!26886 (= call!26890 call!26884)))

(declare-fun b!349191 () Bool)

(assert (=> b!349191 (= e!213903 e!213893)))

(assert (=> b!349191 (= c!53235 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26887 () Bool)

(assert (=> bm!26887 (= call!26887 (contains!2309 lt!164083 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71331 c!53236) b!349178))

(assert (= (and d!71331 (not c!53236)) b!349191))

(assert (= (and b!349191 c!53235) b!349181))

(assert (= (and b!349191 (not c!53235)) b!349179))

(assert (= (and b!349179 c!53234) b!349186))

(assert (= (and b!349179 (not c!53234)) b!349177))

(assert (= (or b!349186 b!349177) bm!26883))

(assert (= (or b!349181 bm!26883) bm!26886))

(assert (= (or b!349181 b!349186) bm!26881))

(assert (= (or b!349178 bm!26886) bm!26884))

(assert (= (or b!349178 bm!26881) bm!26882))

(assert (= (and d!71331 res!193531) b!349189))

(assert (= (and d!71331 c!53238) b!349187))

(assert (= (and d!71331 (not c!53238)) b!349173))

(assert (= (and d!71331 res!193525) b!349183))

(assert (= (and b!349183 res!193523) b!349190))

(assert (= (and b!349183 (not res!193527)) b!349172))

(assert (= (and b!349172 res!193524) b!349182))

(assert (= (and b!349183 res!193529) b!349175))

(assert (= (and b!349175 c!53233) b!349185))

(assert (= (and b!349175 (not c!53233)) b!349180))

(assert (= (and b!349185 res!193530) b!349174))

(assert (= (or b!349185 b!349180) bm!26885))

(assert (= (and b!349175 res!193528) b!349171))

(assert (= (and b!349171 c!53237) b!349176))

(assert (= (and b!349171 (not c!53237)) b!349188))

(assert (= (and b!349176 res!193526) b!349184))

(assert (= (or b!349176 b!349188) bm!26887))

(declare-fun b_lambda!8487 () Bool)

(assert (=> (not b_lambda!8487) (not b!349182)))

(declare-fun t!10298 () Bool)

(declare-fun tb!3089 () Bool)

(assert (=> (and start!34850 (= defaultEntry!1528 defaultEntry!1528) t!10298) tb!3089))

(declare-fun result!5597 () Bool)

(assert (=> tb!3089 (= result!5597 tp_is_empty!7587)))

(assert (=> b!349182 t!10298))

(declare-fun b_and!14861 () Bool)

(assert (= b_and!14857 (and (=> t!10298 result!5597) b_and!14861)))

(declare-fun m!349723 () Bool)

(assert (=> b!349174 m!349723))

(assert (=> d!71331 m!349653))

(declare-fun m!349725 () Bool)

(assert (=> bm!26884 m!349725))

(declare-fun m!349727 () Bool)

(assert (=> b!349178 m!349727))

(assert (=> b!349172 m!349693))

(assert (=> b!349172 m!349693))

(declare-fun m!349729 () Bool)

(assert (=> b!349172 m!349729))

(assert (=> b!349189 m!349693))

(assert (=> b!349189 m!349693))

(assert (=> b!349189 m!349697))

(declare-fun m!349731 () Bool)

(assert (=> b!349187 m!349731))

(declare-fun m!349733 () Bool)

(assert (=> b!349187 m!349733))

(declare-fun m!349735 () Bool)

(assert (=> b!349187 m!349735))

(declare-fun m!349737 () Bool)

(assert (=> b!349187 m!349737))

(declare-fun m!349739 () Bool)

(assert (=> b!349187 m!349739))

(declare-fun m!349741 () Bool)

(assert (=> b!349187 m!349741))

(declare-fun m!349743 () Bool)

(assert (=> b!349187 m!349743))

(declare-fun m!349745 () Bool)

(assert (=> b!349187 m!349745))

(declare-fun m!349747 () Bool)

(assert (=> b!349187 m!349747))

(assert (=> b!349187 m!349731))

(declare-fun m!349749 () Bool)

(assert (=> b!349187 m!349749))

(assert (=> b!349187 m!349739))

(declare-fun m!349751 () Bool)

(assert (=> b!349187 m!349751))

(declare-fun m!349753 () Bool)

(assert (=> b!349187 m!349753))

(assert (=> b!349187 m!349725))

(declare-fun m!349755 () Bool)

(assert (=> b!349187 m!349755))

(declare-fun m!349757 () Bool)

(assert (=> b!349187 m!349757))

(assert (=> b!349187 m!349693))

(assert (=> b!349187 m!349755))

(declare-fun m!349759 () Bool)

(assert (=> b!349187 m!349759))

(assert (=> b!349187 m!349735))

(declare-fun m!349761 () Bool)

(assert (=> bm!26882 m!349761))

(declare-fun m!349763 () Bool)

(assert (=> bm!26887 m!349763))

(declare-fun m!349765 () Bool)

(assert (=> b!349182 m!349765))

(assert (=> b!349182 m!349693))

(declare-fun m!349767 () Bool)

(assert (=> b!349182 m!349767))

(assert (=> b!349182 m!349765))

(declare-fun m!349769 () Bool)

(assert (=> b!349182 m!349769))

(declare-fun m!349771 () Bool)

(assert (=> b!349182 m!349771))

(assert (=> b!349182 m!349769))

(assert (=> b!349182 m!349693))

(assert (=> b!349190 m!349693))

(assert (=> b!349190 m!349693))

(assert (=> b!349190 m!349697))

(declare-fun m!349773 () Bool)

(assert (=> b!349184 m!349773))

(declare-fun m!349775 () Bool)

(assert (=> bm!26885 m!349775))

(assert (=> b!349046 d!71331))

(declare-fun d!71333 () Bool)

(assert (=> d!71333 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34850 d!71333))

(declare-fun d!71335 () Bool)

(assert (=> d!71335 (= (array_inv!6574 _values!1525) (bvsge (size!9242 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34850 d!71335))

(declare-fun d!71337 () Bool)

(assert (=> d!71337 (= (array_inv!6575 _keys!1895) (bvsge (size!9241 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34850 d!71337))

(declare-fun b!349206 () Bool)

(declare-fun e!213912 () SeekEntryResult!3425)

(declare-fun lt!164091 () SeekEntryResult!3425)

(assert (=> b!349206 (= e!213912 (Found!3425 (index!15881 lt!164091)))))

(declare-fun b!349207 () Bool)

(declare-fun e!213914 () SeekEntryResult!3425)

(assert (=> b!349207 (= e!213914 e!213912)))

(declare-fun lt!164092 () (_ BitVec 64))

(assert (=> b!349207 (= lt!164092 (select (arr!8889 _keys!1895) (index!15881 lt!164091)))))

(declare-fun c!53245 () Bool)

(assert (=> b!349207 (= c!53245 (= lt!164092 k0!1348))))

(declare-fun b!349208 () Bool)

(declare-fun c!53247 () Bool)

(assert (=> b!349208 (= c!53247 (= lt!164092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!213913 () SeekEntryResult!3425)

(assert (=> b!349208 (= e!213912 e!213913)))

(declare-fun d!71339 () Bool)

(declare-fun lt!164090 () SeekEntryResult!3425)

(assert (=> d!71339 (and (or ((_ is Undefined!3425) lt!164090) (not ((_ is Found!3425) lt!164090)) (and (bvsge (index!15880 lt!164090) #b00000000000000000000000000000000) (bvslt (index!15880 lt!164090) (size!9241 _keys!1895)))) (or ((_ is Undefined!3425) lt!164090) ((_ is Found!3425) lt!164090) (not ((_ is MissingZero!3425) lt!164090)) (and (bvsge (index!15879 lt!164090) #b00000000000000000000000000000000) (bvslt (index!15879 lt!164090) (size!9241 _keys!1895)))) (or ((_ is Undefined!3425) lt!164090) ((_ is Found!3425) lt!164090) ((_ is MissingZero!3425) lt!164090) (not ((_ is MissingVacant!3425) lt!164090)) (and (bvsge (index!15882 lt!164090) #b00000000000000000000000000000000) (bvslt (index!15882 lt!164090) (size!9241 _keys!1895)))) (or ((_ is Undefined!3425) lt!164090) (ite ((_ is Found!3425) lt!164090) (= (select (arr!8889 _keys!1895) (index!15880 lt!164090)) k0!1348) (ite ((_ is MissingZero!3425) lt!164090) (= (select (arr!8889 _keys!1895) (index!15879 lt!164090)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3425) lt!164090) (= (select (arr!8889 _keys!1895) (index!15882 lt!164090)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71339 (= lt!164090 e!213914)))

(declare-fun c!53246 () Bool)

(assert (=> d!71339 (= c!53246 (and ((_ is Intermediate!3425) lt!164091) (undefined!4237 lt!164091)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18759 (_ BitVec 32)) SeekEntryResult!3425)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71339 (= lt!164091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71339 (validMask!0 mask!2385)))

(assert (=> d!71339 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164090)))

(declare-fun b!349209 () Bool)

(assert (=> b!349209 (= e!213913 (MissingZero!3425 (index!15881 lt!164091)))))

(declare-fun b!349210 () Bool)

(assert (=> b!349210 (= e!213914 Undefined!3425)))

(declare-fun b!349211 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18759 (_ BitVec 32)) SeekEntryResult!3425)

(assert (=> b!349211 (= e!213913 (seekKeyOrZeroReturnVacant!0 (x!34769 lt!164091) (index!15881 lt!164091) (index!15881 lt!164091) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!71339 c!53246) b!349210))

(assert (= (and d!71339 (not c!53246)) b!349207))

(assert (= (and b!349207 c!53245) b!349206))

(assert (= (and b!349207 (not c!53245)) b!349208))

(assert (= (and b!349208 c!53247) b!349209))

(assert (= (and b!349208 (not c!53247)) b!349211))

(declare-fun m!349777 () Bool)

(assert (=> b!349207 m!349777))

(assert (=> d!71339 m!349653))

(declare-fun m!349779 () Bool)

(assert (=> d!71339 m!349779))

(declare-fun m!349781 () Bool)

(assert (=> d!71339 m!349781))

(declare-fun m!349783 () Bool)

(assert (=> d!71339 m!349783))

(assert (=> d!71339 m!349781))

(declare-fun m!349785 () Bool)

(assert (=> d!71339 m!349785))

(declare-fun m!349787 () Bool)

(assert (=> d!71339 m!349787))

(declare-fun m!349789 () Bool)

(assert (=> b!349211 m!349789))

(assert (=> b!349037 d!71339))

(declare-fun b!349218 () Bool)

(declare-fun e!213920 () Bool)

(assert (=> b!349218 (= e!213920 tp_is_empty!7587)))

(declare-fun b!349219 () Bool)

(declare-fun e!213919 () Bool)

(assert (=> b!349219 (= e!213919 tp_is_empty!7587)))

(declare-fun mapNonEmpty!12846 () Bool)

(declare-fun mapRes!12846 () Bool)

(declare-fun tp!26481 () Bool)

(assert (=> mapNonEmpty!12846 (= mapRes!12846 (and tp!26481 e!213920))))

(declare-fun mapValue!12846 () ValueCell!3450)

(declare-fun mapRest!12846 () (Array (_ BitVec 32) ValueCell!3450))

(declare-fun mapKey!12846 () (_ BitVec 32))

(assert (=> mapNonEmpty!12846 (= mapRest!12840 (store mapRest!12846 mapKey!12846 mapValue!12846))))

(declare-fun condMapEmpty!12846 () Bool)

(declare-fun mapDefault!12846 () ValueCell!3450)

(assert (=> mapNonEmpty!12840 (= condMapEmpty!12846 (= mapRest!12840 ((as const (Array (_ BitVec 32) ValueCell!3450)) mapDefault!12846)))))

(assert (=> mapNonEmpty!12840 (= tp!26472 (and e!213919 mapRes!12846))))

(declare-fun mapIsEmpty!12846 () Bool)

(assert (=> mapIsEmpty!12846 mapRes!12846))

(assert (= (and mapNonEmpty!12840 condMapEmpty!12846) mapIsEmpty!12846))

(assert (= (and mapNonEmpty!12840 (not condMapEmpty!12846)) mapNonEmpty!12846))

(assert (= (and mapNonEmpty!12846 ((_ is ValueCellFull!3450) mapValue!12846)) b!349218))

(assert (= (and mapNonEmpty!12840 ((_ is ValueCellFull!3450) mapDefault!12846)) b!349219))

(declare-fun m!349791 () Bool)

(assert (=> mapNonEmpty!12846 m!349791))

(declare-fun b_lambda!8489 () Bool)

(assert (= b_lambda!8487 (or (and start!34850 b_free!7635) b_lambda!8489)))

(check-sat (not b!349094) (not b!349095) (not bm!26887) (not b!349105) (not b!349190) (not d!71329) (not b!349174) (not b!349104) (not bm!26882) (not bm!26884) (not b!349189) (not bm!26885) (not b!349187) (not b!349182) (not b!349178) (not b!349211) (not b!349113) (not d!71331) (not bm!26863) (not b!349119) (not b_next!7635) (not b!349126) (not b!349184) tp_is_empty!7587 (not b!349128) (not bm!26866) (not b!349172) (not b_lambda!8489) (not b!349093) (not mapNonEmpty!12846) (not d!71339) b_and!14861)
(check-sat b_and!14861 (not b_next!7635))
