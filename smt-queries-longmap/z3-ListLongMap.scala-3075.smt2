; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43304 () Bool)

(assert start!43304)

(declare-fun b_free!12171 () Bool)

(declare-fun b_next!12171 () Bool)

(assert (=> start!43304 (= b_free!12171 (not b_next!12171))))

(declare-fun tp!42783 () Bool)

(declare-fun b_and!20923 () Bool)

(assert (=> start!43304 (= tp!42783 b_and!20923)))

(declare-fun mapNonEmpty!22222 () Bool)

(declare-fun mapRes!22222 () Bool)

(declare-fun tp!42784 () Bool)

(declare-fun e!282303 () Bool)

(assert (=> mapNonEmpty!22222 (= mapRes!22222 (and tp!42784 e!282303))))

(declare-datatypes ((V!19315 0))(
  ( (V!19316 (val!6889 Int)) )
))
(declare-datatypes ((ValueCell!6480 0))(
  ( (ValueCellFull!6480 (v!9178 V!19315)) (EmptyCell!6480) )
))
(declare-fun mapValue!22222 () ValueCell!6480)

(declare-datatypes ((array!31033 0))(
  ( (array!31034 (arr!14923 (Array (_ BitVec 32) ValueCell!6480)) (size!15281 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31033)

(declare-fun mapKey!22222 () (_ BitVec 32))

(declare-fun mapRest!22222 () (Array (_ BitVec 32) ValueCell!6480))

(assert (=> mapNonEmpty!22222 (= (arr!14923 _values!1516) (store mapRest!22222 mapKey!22222 mapValue!22222))))

(declare-fun b!479782 () Bool)

(declare-fun res!286188 () Bool)

(declare-fun e!282302 () Bool)

(assert (=> b!479782 (=> (not res!286188) (not e!282302))))

(declare-datatypes ((array!31035 0))(
  ( (array!31036 (arr!14924 (Array (_ BitVec 32) (_ BitVec 64))) (size!15282 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31035)

(declare-datatypes ((List!9122 0))(
  ( (Nil!9119) (Cons!9118 (h!9974 (_ BitVec 64)) (t!15328 List!9122)) )
))
(declare-fun arrayNoDuplicates!0 (array!31035 (_ BitVec 32) List!9122) Bool)

(assert (=> b!479782 (= res!286188 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9119))))

(declare-fun b!479783 () Bool)

(declare-fun e!282301 () Bool)

(declare-fun tp_is_empty!13683 () Bool)

(assert (=> b!479783 (= e!282301 tp_is_empty!13683)))

(declare-fun b!479784 () Bool)

(declare-fun res!286186 () Bool)

(assert (=> b!479784 (=> (not res!286186) (not e!282302))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479784 (= res!286186 (and (= (size!15281 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15282 _keys!1874) (size!15281 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479785 () Bool)

(declare-fun res!286187 () Bool)

(assert (=> b!479785 (=> (not res!286187) (not e!282302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31035 (_ BitVec 32)) Bool)

(assert (=> b!479785 (= res!286187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479786 () Bool)

(assert (=> b!479786 (= e!282302 (not (and (bvslt #b00000000000000000000000000000000 (size!15282 _keys!1874)) (bvslt (size!15282 _keys!1874) #b01111111111111111111111111111111))))))

(declare-fun e!282306 () Bool)

(assert (=> b!479786 e!282306))

(declare-fun c!57682 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(assert (=> b!479786 (= c!57682 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19315)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((Unit!14068 0))(
  ( (Unit!14069) )
))
(declare-fun lt!217909 () Unit!14068)

(declare-fun zeroValue!1458 () V!19315)

(declare-fun lemmaKeyInListMapIsInArray!109 (array!31035 array!31033 (_ BitVec 32) (_ BitVec 32) V!19315 V!19315 (_ BitVec 64) Int) Unit!14068)

(assert (=> b!479786 (= lt!217909 (lemmaKeyInListMapIsInArray!109 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapIsEmpty!22222 () Bool)

(assert (=> mapIsEmpty!22222 mapRes!22222))

(declare-fun b!479787 () Bool)

(assert (=> b!479787 (= e!282306 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!286184 () Bool)

(assert (=> start!43304 (=> (not res!286184) (not e!282302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43304 (= res!286184 (validMask!0 mask!2352))))

(assert (=> start!43304 e!282302))

(assert (=> start!43304 true))

(assert (=> start!43304 tp_is_empty!13683))

(declare-fun e!282304 () Bool)

(declare-fun array_inv!10766 (array!31033) Bool)

(assert (=> start!43304 (and (array_inv!10766 _values!1516) e!282304)))

(assert (=> start!43304 tp!42783))

(declare-fun array_inv!10767 (array!31035) Bool)

(assert (=> start!43304 (array_inv!10767 _keys!1874)))

(declare-fun b!479788 () Bool)

(assert (=> b!479788 (= e!282303 tp_is_empty!13683)))

(declare-fun b!479789 () Bool)

(declare-fun arrayContainsKey!0 (array!31035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479789 (= e!282306 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479790 () Bool)

(declare-fun res!286185 () Bool)

(assert (=> b!479790 (=> (not res!286185) (not e!282302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479790 (= res!286185 (validKeyInArray!0 k0!1332))))

(declare-fun b!479791 () Bool)

(assert (=> b!479791 (= e!282304 (and e!282301 mapRes!22222))))

(declare-fun condMapEmpty!22222 () Bool)

(declare-fun mapDefault!22222 () ValueCell!6480)

(assert (=> b!479791 (= condMapEmpty!22222 (= (arr!14923 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6480)) mapDefault!22222)))))

(declare-fun b!479792 () Bool)

(declare-fun res!286183 () Bool)

(assert (=> b!479792 (=> (not res!286183) (not e!282302))))

(declare-datatypes ((tuple2!9044 0))(
  ( (tuple2!9045 (_1!4533 (_ BitVec 64)) (_2!4533 V!19315)) )
))
(declare-datatypes ((List!9123 0))(
  ( (Nil!9120) (Cons!9119 (h!9975 tuple2!9044) (t!15329 List!9123)) )
))
(declare-datatypes ((ListLongMap!7957 0))(
  ( (ListLongMap!7958 (toList!3994 List!9123)) )
))
(declare-fun contains!2604 (ListLongMap!7957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2313 (array!31035 array!31033 (_ BitVec 32) (_ BitVec 32) V!19315 V!19315 (_ BitVec 32) Int) ListLongMap!7957)

(assert (=> b!479792 (= res!286183 (contains!2604 (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43304 res!286184) b!479784))

(assert (= (and b!479784 res!286186) b!479785))

(assert (= (and b!479785 res!286187) b!479782))

(assert (= (and b!479782 res!286188) b!479792))

(assert (= (and b!479792 res!286183) b!479790))

(assert (= (and b!479790 res!286185) b!479786))

(assert (= (and b!479786 c!57682) b!479789))

(assert (= (and b!479786 (not c!57682)) b!479787))

(assert (= (and b!479791 condMapEmpty!22222) mapIsEmpty!22222))

(assert (= (and b!479791 (not condMapEmpty!22222)) mapNonEmpty!22222))

(get-info :version)

(assert (= (and mapNonEmpty!22222 ((_ is ValueCellFull!6480) mapValue!22222)) b!479788))

(assert (= (and b!479791 ((_ is ValueCellFull!6480) mapDefault!22222)) b!479783))

(assert (= start!43304 b!479791))

(declare-fun m!461637 () Bool)

(assert (=> b!479790 m!461637))

(declare-fun m!461639 () Bool)

(assert (=> b!479786 m!461639))

(declare-fun m!461641 () Bool)

(assert (=> b!479792 m!461641))

(assert (=> b!479792 m!461641))

(declare-fun m!461643 () Bool)

(assert (=> b!479792 m!461643))

(declare-fun m!461645 () Bool)

(assert (=> b!479789 m!461645))

(declare-fun m!461647 () Bool)

(assert (=> start!43304 m!461647))

(declare-fun m!461649 () Bool)

(assert (=> start!43304 m!461649))

(declare-fun m!461651 () Bool)

(assert (=> start!43304 m!461651))

(declare-fun m!461653 () Bool)

(assert (=> b!479785 m!461653))

(declare-fun m!461655 () Bool)

(assert (=> mapNonEmpty!22222 m!461655))

(declare-fun m!461657 () Bool)

(assert (=> b!479782 m!461657))

(check-sat (not start!43304) (not mapNonEmpty!22222) (not b!479792) (not b!479785) b_and!20923 (not b!479786) (not b!479790) (not b!479789) tp_is_empty!13683 (not b_next!12171) (not b!479782))
(check-sat b_and!20923 (not b_next!12171))
(get-model)

(declare-fun bm!30847 () Bool)

(declare-fun call!30850 () Bool)

(declare-fun c!57688 () Bool)

(assert (=> bm!30847 (= call!30850 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57688 (Cons!9118 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000) Nil!9119) Nil!9119)))))

(declare-fun b!479836 () Bool)

(declare-fun e!282335 () Bool)

(declare-fun e!282333 () Bool)

(assert (=> b!479836 (= e!282335 e!282333)))

(assert (=> b!479836 (= c!57688 (validKeyInArray!0 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479837 () Bool)

(declare-fun e!282334 () Bool)

(assert (=> b!479837 (= e!282334 e!282335)))

(declare-fun res!286215 () Bool)

(assert (=> b!479837 (=> (not res!286215) (not e!282335))))

(declare-fun e!282336 () Bool)

(assert (=> b!479837 (= res!286215 (not e!282336))))

(declare-fun res!286213 () Bool)

(assert (=> b!479837 (=> (not res!286213) (not e!282336))))

(assert (=> b!479837 (= res!286213 (validKeyInArray!0 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76683 () Bool)

(declare-fun res!286214 () Bool)

(assert (=> d!76683 (=> res!286214 e!282334)))

(assert (=> d!76683 (= res!286214 (bvsge #b00000000000000000000000000000000 (size!15282 _keys!1874)))))

(assert (=> d!76683 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9119) e!282334)))

(declare-fun b!479838 () Bool)

(assert (=> b!479838 (= e!282333 call!30850)))

(declare-fun b!479839 () Bool)

(declare-fun contains!2605 (List!9122 (_ BitVec 64)) Bool)

(assert (=> b!479839 (= e!282336 (contains!2605 Nil!9119 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479840 () Bool)

(assert (=> b!479840 (= e!282333 call!30850)))

(assert (= (and d!76683 (not res!286214)) b!479837))

(assert (= (and b!479837 res!286213) b!479839))

(assert (= (and b!479837 res!286215) b!479836))

(assert (= (and b!479836 c!57688) b!479838))

(assert (= (and b!479836 (not c!57688)) b!479840))

(assert (= (or b!479838 b!479840) bm!30847))

(declare-fun m!461681 () Bool)

(assert (=> bm!30847 m!461681))

(declare-fun m!461683 () Bool)

(assert (=> bm!30847 m!461683))

(assert (=> b!479836 m!461681))

(assert (=> b!479836 m!461681))

(declare-fun m!461685 () Bool)

(assert (=> b!479836 m!461685))

(assert (=> b!479837 m!461681))

(assert (=> b!479837 m!461681))

(assert (=> b!479837 m!461685))

(assert (=> b!479839 m!461681))

(assert (=> b!479839 m!461681))

(declare-fun m!461687 () Bool)

(assert (=> b!479839 m!461687))

(assert (=> b!479782 d!76683))

(declare-fun d!76685 () Bool)

(assert (=> d!76685 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43304 d!76685))

(declare-fun d!76687 () Bool)

(assert (=> d!76687 (= (array_inv!10766 _values!1516) (bvsge (size!15281 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43304 d!76687))

(declare-fun d!76689 () Bool)

(assert (=> d!76689 (= (array_inv!10767 _keys!1874) (bvsge (size!15282 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43304 d!76689))

(declare-fun d!76691 () Bool)

(declare-fun e!282341 () Bool)

(assert (=> d!76691 e!282341))

(declare-fun res!286218 () Bool)

(assert (=> d!76691 (=> res!286218 e!282341)))

(declare-fun lt!217923 () Bool)

(assert (=> d!76691 (= res!286218 (not lt!217923))))

(declare-fun lt!217924 () Bool)

(assert (=> d!76691 (= lt!217923 lt!217924)))

(declare-fun lt!217921 () Unit!14068)

(declare-fun e!282342 () Unit!14068)

(assert (=> d!76691 (= lt!217921 e!282342)))

(declare-fun c!57691 () Bool)

(assert (=> d!76691 (= c!57691 lt!217924)))

(declare-fun containsKey!354 (List!9123 (_ BitVec 64)) Bool)

(assert (=> d!76691 (= lt!217924 (containsKey!354 (toList!3994 (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76691 (= (contains!2604 (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!217923)))

(declare-fun b!479847 () Bool)

(declare-fun lt!217922 () Unit!14068)

(assert (=> b!479847 (= e!282342 lt!217922)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!302 (List!9123 (_ BitVec 64)) Unit!14068)

(assert (=> b!479847 (= lt!217922 (lemmaContainsKeyImpliesGetValueByKeyDefined!302 (toList!3994 (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!398 0))(
  ( (Some!397 (v!9180 V!19315)) (None!396) )
))
(declare-fun isDefined!303 (Option!398) Bool)

(declare-fun getValueByKey!392 (List!9123 (_ BitVec 64)) Option!398)

(assert (=> b!479847 (isDefined!303 (getValueByKey!392 (toList!3994 (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!479848 () Bool)

(declare-fun Unit!14072 () Unit!14068)

(assert (=> b!479848 (= e!282342 Unit!14072)))

(declare-fun b!479849 () Bool)

(assert (=> b!479849 (= e!282341 (isDefined!303 (getValueByKey!392 (toList!3994 (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76691 c!57691) b!479847))

(assert (= (and d!76691 (not c!57691)) b!479848))

(assert (= (and d!76691 (not res!286218)) b!479849))

(declare-fun m!461689 () Bool)

(assert (=> d!76691 m!461689))

(declare-fun m!461691 () Bool)

(assert (=> b!479847 m!461691))

(declare-fun m!461693 () Bool)

(assert (=> b!479847 m!461693))

(assert (=> b!479847 m!461693))

(declare-fun m!461695 () Bool)

(assert (=> b!479847 m!461695))

(assert (=> b!479849 m!461693))

(assert (=> b!479849 m!461693))

(assert (=> b!479849 m!461695))

(assert (=> b!479792 d!76691))

(declare-fun bm!30862 () Bool)

(declare-fun call!30867 () Bool)

(declare-fun lt!217987 () ListLongMap!7957)

(assert (=> bm!30862 (= call!30867 (contains!2604 lt!217987 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!30865 () ListLongMap!7957)

(declare-fun call!30868 () ListLongMap!7957)

(declare-fun c!57706 () Bool)

(declare-fun bm!30863 () Bool)

(declare-fun call!30870 () ListLongMap!7957)

(declare-fun call!30866 () ListLongMap!7957)

(declare-fun c!57708 () Bool)

(declare-fun +!1771 (ListLongMap!7957 tuple2!9044) ListLongMap!7957)

(assert (=> bm!30863 (= call!30868 (+!1771 (ite c!57708 call!30866 (ite c!57706 call!30865 call!30870)) (ite (or c!57708 c!57706) (tuple2!9045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9045 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!479892 () Bool)

(declare-fun e!282377 () ListLongMap!7957)

(assert (=> b!479892 (= e!282377 (+!1771 call!30868 (tuple2!9045 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!479893 () Bool)

(declare-fun e!282375 () Bool)

(assert (=> b!479893 (= e!282375 (validKeyInArray!0 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479894 () Bool)

(declare-fun e!282376 () Bool)

(declare-fun apply!339 (ListLongMap!7957 (_ BitVec 64)) V!19315)

(assert (=> b!479894 (= e!282376 (= (apply!339 lt!217987 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!479895 () Bool)

(declare-fun e!282378 () Bool)

(assert (=> b!479895 (= e!282378 e!282376)))

(declare-fun res!286241 () Bool)

(assert (=> b!479895 (= res!286241 call!30867)))

(assert (=> b!479895 (=> (not res!286241) (not e!282376))))

(declare-fun d!76693 () Bool)

(declare-fun e!282371 () Bool)

(assert (=> d!76693 e!282371))

(declare-fun res!286242 () Bool)

(assert (=> d!76693 (=> (not res!286242) (not e!282371))))

(assert (=> d!76693 (= res!286242 (or (bvsge #b00000000000000000000000000000000 (size!15282 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15282 _keys!1874)))))))

(declare-fun lt!217978 () ListLongMap!7957)

(assert (=> d!76693 (= lt!217987 lt!217978)))

(declare-fun lt!217973 () Unit!14068)

(declare-fun e!282369 () Unit!14068)

(assert (=> d!76693 (= lt!217973 e!282369)))

(declare-fun c!57709 () Bool)

(assert (=> d!76693 (= c!57709 e!282375)))

(declare-fun res!286237 () Bool)

(assert (=> d!76693 (=> (not res!286237) (not e!282375))))

(assert (=> d!76693 (= res!286237 (bvslt #b00000000000000000000000000000000 (size!15282 _keys!1874)))))

(assert (=> d!76693 (= lt!217978 e!282377)))

(assert (=> d!76693 (= c!57708 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76693 (validMask!0 mask!2352)))

(assert (=> d!76693 (= (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!217987)))

(declare-fun b!479896 () Bool)

(declare-fun Unit!14073 () Unit!14068)

(assert (=> b!479896 (= e!282369 Unit!14073)))

(declare-fun bm!30864 () Bool)

(assert (=> bm!30864 (= call!30870 call!30865)))

(declare-fun b!479897 () Bool)

(declare-fun res!286239 () Bool)

(assert (=> b!479897 (=> (not res!286239) (not e!282371))))

(declare-fun e!282372 () Bool)

(assert (=> b!479897 (= res!286239 e!282372)))

(declare-fun res!286245 () Bool)

(assert (=> b!479897 (=> res!286245 e!282372)))

(declare-fun e!282379 () Bool)

(assert (=> b!479897 (= res!286245 (not e!282379))))

(declare-fun res!286244 () Bool)

(assert (=> b!479897 (=> (not res!286244) (not e!282379))))

(assert (=> b!479897 (= res!286244 (bvslt #b00000000000000000000000000000000 (size!15282 _keys!1874)))))

(declare-fun b!479898 () Bool)

(declare-fun e!282373 () Bool)

(assert (=> b!479898 (= e!282373 (= (apply!339 lt!217987 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!479899 () Bool)

(declare-fun c!57707 () Bool)

(assert (=> b!479899 (= c!57707 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!282370 () ListLongMap!7957)

(declare-fun e!282381 () ListLongMap!7957)

(assert (=> b!479899 (= e!282370 e!282381)))

(declare-fun b!479900 () Bool)

(assert (=> b!479900 (= e!282377 e!282370)))

(assert (=> b!479900 (= c!57706 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30865 () Bool)

(declare-fun call!30869 () Bool)

(assert (=> bm!30865 (= call!30869 (contains!2604 lt!217987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!479901 () Bool)

(assert (=> b!479901 (= e!282381 call!30870)))

(declare-fun bm!30866 () Bool)

(declare-fun call!30871 () ListLongMap!7957)

(assert (=> bm!30866 (= call!30871 call!30868)))

(declare-fun b!479902 () Bool)

(declare-fun e!282374 () Bool)

(assert (=> b!479902 (= e!282374 e!282373)))

(declare-fun res!286238 () Bool)

(assert (=> b!479902 (= res!286238 call!30869)))

(assert (=> b!479902 (=> (not res!286238) (not e!282373))))

(declare-fun b!479903 () Bool)

(assert (=> b!479903 (= e!282374 (not call!30869))))

(declare-fun b!479904 () Bool)

(assert (=> b!479904 (= e!282378 (not call!30867))))

(declare-fun bm!30867 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2108 (array!31035 array!31033 (_ BitVec 32) (_ BitVec 32) V!19315 V!19315 (_ BitVec 32) Int) ListLongMap!7957)

(assert (=> bm!30867 (= call!30866 (getCurrentListMapNoExtraKeys!2108 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun e!282380 () Bool)

(declare-fun b!479905 () Bool)

(declare-fun get!7238 (ValueCell!6480 V!19315) V!19315)

(declare-fun dynLambda!950 (Int (_ BitVec 64)) V!19315)

(assert (=> b!479905 (= e!282380 (= (apply!339 lt!217987 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000)) (get!7238 (select (arr!14923 _values!1516) #b00000000000000000000000000000000) (dynLambda!950 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479905 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15281 _values!1516)))))

(assert (=> b!479905 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15282 _keys!1874)))))

(declare-fun b!479906 () Bool)

(assert (=> b!479906 (= e!282372 e!282380)))

(declare-fun res!286240 () Bool)

(assert (=> b!479906 (=> (not res!286240) (not e!282380))))

(assert (=> b!479906 (= res!286240 (contains!2604 lt!217987 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!479906 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15282 _keys!1874)))))

(declare-fun bm!30868 () Bool)

(assert (=> bm!30868 (= call!30865 call!30866)))

(declare-fun b!479907 () Bool)

(declare-fun res!286243 () Bool)

(assert (=> b!479907 (=> (not res!286243) (not e!282371))))

(assert (=> b!479907 (= res!286243 e!282374)))

(declare-fun c!57705 () Bool)

(assert (=> b!479907 (= c!57705 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!479908 () Bool)

(assert (=> b!479908 (= e!282370 call!30871)))

(declare-fun b!479909 () Bool)

(assert (=> b!479909 (= e!282381 call!30871)))

(declare-fun b!479910 () Bool)

(assert (=> b!479910 (= e!282371 e!282378)))

(declare-fun c!57704 () Bool)

(assert (=> b!479910 (= c!57704 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!479911 () Bool)

(declare-fun lt!217982 () Unit!14068)

(assert (=> b!479911 (= e!282369 lt!217982)))

(declare-fun lt!217972 () ListLongMap!7957)

(assert (=> b!479911 (= lt!217972 (getCurrentListMapNoExtraKeys!2108 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217975 () (_ BitVec 64))

(assert (=> b!479911 (= lt!217975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217988 () (_ BitVec 64))

(assert (=> b!479911 (= lt!217988 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217980 () Unit!14068)

(declare-fun addStillContains!297 (ListLongMap!7957 (_ BitVec 64) V!19315 (_ BitVec 64)) Unit!14068)

(assert (=> b!479911 (= lt!217980 (addStillContains!297 lt!217972 lt!217975 zeroValue!1458 lt!217988))))

(assert (=> b!479911 (contains!2604 (+!1771 lt!217972 (tuple2!9045 lt!217975 zeroValue!1458)) lt!217988)))

(declare-fun lt!217981 () Unit!14068)

(assert (=> b!479911 (= lt!217981 lt!217980)))

(declare-fun lt!217984 () ListLongMap!7957)

(assert (=> b!479911 (= lt!217984 (getCurrentListMapNoExtraKeys!2108 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217970 () (_ BitVec 64))

(assert (=> b!479911 (= lt!217970 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217976 () (_ BitVec 64))

(assert (=> b!479911 (= lt!217976 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217969 () Unit!14068)

(declare-fun addApplyDifferent!297 (ListLongMap!7957 (_ BitVec 64) V!19315 (_ BitVec 64)) Unit!14068)

(assert (=> b!479911 (= lt!217969 (addApplyDifferent!297 lt!217984 lt!217970 minValue!1458 lt!217976))))

(assert (=> b!479911 (= (apply!339 (+!1771 lt!217984 (tuple2!9045 lt!217970 minValue!1458)) lt!217976) (apply!339 lt!217984 lt!217976))))

(declare-fun lt!217974 () Unit!14068)

(assert (=> b!479911 (= lt!217974 lt!217969)))

(declare-fun lt!217989 () ListLongMap!7957)

(assert (=> b!479911 (= lt!217989 (getCurrentListMapNoExtraKeys!2108 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217983 () (_ BitVec 64))

(assert (=> b!479911 (= lt!217983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217990 () (_ BitVec 64))

(assert (=> b!479911 (= lt!217990 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217971 () Unit!14068)

(assert (=> b!479911 (= lt!217971 (addApplyDifferent!297 lt!217989 lt!217983 zeroValue!1458 lt!217990))))

(assert (=> b!479911 (= (apply!339 (+!1771 lt!217989 (tuple2!9045 lt!217983 zeroValue!1458)) lt!217990) (apply!339 lt!217989 lt!217990))))

(declare-fun lt!217979 () Unit!14068)

(assert (=> b!479911 (= lt!217979 lt!217971)))

(declare-fun lt!217985 () ListLongMap!7957)

(assert (=> b!479911 (= lt!217985 (getCurrentListMapNoExtraKeys!2108 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217977 () (_ BitVec 64))

(assert (=> b!479911 (= lt!217977 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217986 () (_ BitVec 64))

(assert (=> b!479911 (= lt!217986 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!479911 (= lt!217982 (addApplyDifferent!297 lt!217985 lt!217977 minValue!1458 lt!217986))))

(assert (=> b!479911 (= (apply!339 (+!1771 lt!217985 (tuple2!9045 lt!217977 minValue!1458)) lt!217986) (apply!339 lt!217985 lt!217986))))

(declare-fun b!479912 () Bool)

(assert (=> b!479912 (= e!282379 (validKeyInArray!0 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76693 c!57708) b!479892))

(assert (= (and d!76693 (not c!57708)) b!479900))

(assert (= (and b!479900 c!57706) b!479908))

(assert (= (and b!479900 (not c!57706)) b!479899))

(assert (= (and b!479899 c!57707) b!479909))

(assert (= (and b!479899 (not c!57707)) b!479901))

(assert (= (or b!479909 b!479901) bm!30864))

(assert (= (or b!479908 bm!30864) bm!30868))

(assert (= (or b!479908 b!479909) bm!30866))

(assert (= (or b!479892 bm!30868) bm!30867))

(assert (= (or b!479892 bm!30866) bm!30863))

(assert (= (and d!76693 res!286237) b!479893))

(assert (= (and d!76693 c!57709) b!479911))

(assert (= (and d!76693 (not c!57709)) b!479896))

(assert (= (and d!76693 res!286242) b!479897))

(assert (= (and b!479897 res!286244) b!479912))

(assert (= (and b!479897 (not res!286245)) b!479906))

(assert (= (and b!479906 res!286240) b!479905))

(assert (= (and b!479897 res!286239) b!479907))

(assert (= (and b!479907 c!57705) b!479902))

(assert (= (and b!479907 (not c!57705)) b!479903))

(assert (= (and b!479902 res!286238) b!479898))

(assert (= (or b!479902 b!479903) bm!30865))

(assert (= (and b!479907 res!286243) b!479910))

(assert (= (and b!479910 c!57704) b!479895))

(assert (= (and b!479910 (not c!57704)) b!479904))

(assert (= (and b!479895 res!286241) b!479894))

(assert (= (or b!479895 b!479904) bm!30862))

(declare-fun b_lambda!10791 () Bool)

(assert (=> (not b_lambda!10791) (not b!479905)))

(declare-fun t!15332 () Bool)

(declare-fun tb!4159 () Bool)

(assert (=> (and start!43304 (= defaultEntry!1519 defaultEntry!1519) t!15332) tb!4159))

(declare-fun result!7745 () Bool)

(assert (=> tb!4159 (= result!7745 tp_is_empty!13683)))

(assert (=> b!479905 t!15332))

(declare-fun b_and!20927 () Bool)

(assert (= b_and!20923 (and (=> t!15332 result!7745) b_and!20927)))

(assert (=> d!76693 m!461647))

(declare-fun m!461697 () Bool)

(assert (=> b!479892 m!461697))

(declare-fun m!461699 () Bool)

(assert (=> b!479898 m!461699))

(assert (=> b!479912 m!461681))

(assert (=> b!479912 m!461681))

(assert (=> b!479912 m!461685))

(declare-fun m!461701 () Bool)

(assert (=> bm!30863 m!461701))

(declare-fun m!461703 () Bool)

(assert (=> bm!30865 m!461703))

(declare-fun m!461705 () Bool)

(assert (=> bm!30867 m!461705))

(assert (=> b!479906 m!461681))

(assert (=> b!479906 m!461681))

(declare-fun m!461707 () Bool)

(assert (=> b!479906 m!461707))

(assert (=> b!479893 m!461681))

(assert (=> b!479893 m!461681))

(assert (=> b!479893 m!461685))

(declare-fun m!461709 () Bool)

(assert (=> b!479894 m!461709))

(declare-fun m!461711 () Bool)

(assert (=> b!479911 m!461711))

(declare-fun m!461713 () Bool)

(assert (=> b!479911 m!461713))

(declare-fun m!461715 () Bool)

(assert (=> b!479911 m!461715))

(declare-fun m!461717 () Bool)

(assert (=> b!479911 m!461717))

(declare-fun m!461719 () Bool)

(assert (=> b!479911 m!461719))

(declare-fun m!461721 () Bool)

(assert (=> b!479911 m!461721))

(declare-fun m!461723 () Bool)

(assert (=> b!479911 m!461723))

(assert (=> b!479911 m!461721))

(declare-fun m!461725 () Bool)

(assert (=> b!479911 m!461725))

(declare-fun m!461727 () Bool)

(assert (=> b!479911 m!461727))

(declare-fun m!461729 () Bool)

(assert (=> b!479911 m!461729))

(assert (=> b!479911 m!461705))

(declare-fun m!461731 () Bool)

(assert (=> b!479911 m!461731))

(declare-fun m!461733 () Bool)

(assert (=> b!479911 m!461733))

(declare-fun m!461735 () Bool)

(assert (=> b!479911 m!461735))

(declare-fun m!461737 () Bool)

(assert (=> b!479911 m!461737))

(assert (=> b!479911 m!461727))

(declare-fun m!461739 () Bool)

(assert (=> b!479911 m!461739))

(assert (=> b!479911 m!461717))

(assert (=> b!479911 m!461733))

(assert (=> b!479911 m!461681))

(declare-fun m!461741 () Bool)

(assert (=> bm!30862 m!461741))

(declare-fun m!461743 () Bool)

(assert (=> b!479905 m!461743))

(assert (=> b!479905 m!461681))

(declare-fun m!461745 () Bool)

(assert (=> b!479905 m!461745))

(declare-fun m!461747 () Bool)

(assert (=> b!479905 m!461747))

(assert (=> b!479905 m!461747))

(assert (=> b!479905 m!461743))

(declare-fun m!461749 () Bool)

(assert (=> b!479905 m!461749))

(assert (=> b!479905 m!461681))

(assert (=> b!479792 d!76693))

(declare-fun d!76695 () Bool)

(declare-fun res!286250 () Bool)

(declare-fun e!282386 () Bool)

(assert (=> d!76695 (=> res!286250 e!282386)))

(assert (=> d!76695 (= res!286250 (= (select (arr!14924 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76695 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282386)))

(declare-fun b!479919 () Bool)

(declare-fun e!282387 () Bool)

(assert (=> b!479919 (= e!282386 e!282387)))

(declare-fun res!286251 () Bool)

(assert (=> b!479919 (=> (not res!286251) (not e!282387))))

(assert (=> b!479919 (= res!286251 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15282 _keys!1874)))))

(declare-fun b!479920 () Bool)

(assert (=> b!479920 (= e!282387 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76695 (not res!286250)) b!479919))

(assert (= (and b!479919 res!286251) b!479920))

(assert (=> d!76695 m!461681))

(declare-fun m!461751 () Bool)

(assert (=> b!479920 m!461751))

(assert (=> b!479789 d!76695))

(declare-fun b!479929 () Bool)

(declare-fun e!282395 () Bool)

(declare-fun call!30874 () Bool)

(assert (=> b!479929 (= e!282395 call!30874)))

(declare-fun b!479930 () Bool)

(declare-fun e!282394 () Bool)

(declare-fun e!282396 () Bool)

(assert (=> b!479930 (= e!282394 e!282396)))

(declare-fun c!57712 () Bool)

(assert (=> b!479930 (= c!57712 (validKeyInArray!0 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479931 () Bool)

(assert (=> b!479931 (= e!282396 call!30874)))

(declare-fun d!76697 () Bool)

(declare-fun res!286257 () Bool)

(assert (=> d!76697 (=> res!286257 e!282394)))

(assert (=> d!76697 (= res!286257 (bvsge #b00000000000000000000000000000000 (size!15282 _keys!1874)))))

(assert (=> d!76697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!282394)))

(declare-fun b!479932 () Bool)

(assert (=> b!479932 (= e!282396 e!282395)))

(declare-fun lt!217999 () (_ BitVec 64))

(assert (=> b!479932 (= lt!217999 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217998 () Unit!14068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31035 (_ BitVec 64) (_ BitVec 32)) Unit!14068)

(assert (=> b!479932 (= lt!217998 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217999 #b00000000000000000000000000000000))))

(assert (=> b!479932 (arrayContainsKey!0 _keys!1874 lt!217999 #b00000000000000000000000000000000)))

(declare-fun lt!217997 () Unit!14068)

(assert (=> b!479932 (= lt!217997 lt!217998)))

(declare-fun res!286256 () Bool)

(declare-datatypes ((SeekEntryResult!3568 0))(
  ( (MissingZero!3568 (index!16451 (_ BitVec 32))) (Found!3568 (index!16452 (_ BitVec 32))) (Intermediate!3568 (undefined!4380 Bool) (index!16453 (_ BitVec 32)) (x!45082 (_ BitVec 32))) (Undefined!3568) (MissingVacant!3568 (index!16454 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31035 (_ BitVec 32)) SeekEntryResult!3568)

(assert (=> b!479932 (= res!286256 (= (seekEntryOrOpen!0 (select (arr!14924 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3568 #b00000000000000000000000000000000)))))

(assert (=> b!479932 (=> (not res!286256) (not e!282395))))

(declare-fun bm!30871 () Bool)

(assert (=> bm!30871 (= call!30874 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76697 (not res!286257)) b!479930))

(assert (= (and b!479930 c!57712) b!479932))

(assert (= (and b!479930 (not c!57712)) b!479931))

(assert (= (and b!479932 res!286256) b!479929))

(assert (= (or b!479929 b!479931) bm!30871))

(assert (=> b!479930 m!461681))

(assert (=> b!479930 m!461681))

(assert (=> b!479930 m!461685))

(assert (=> b!479932 m!461681))

(declare-fun m!461753 () Bool)

(assert (=> b!479932 m!461753))

(declare-fun m!461755 () Bool)

(assert (=> b!479932 m!461755))

(assert (=> b!479932 m!461681))

(declare-fun m!461757 () Bool)

(assert (=> b!479932 m!461757))

(declare-fun m!461759 () Bool)

(assert (=> bm!30871 m!461759))

(assert (=> b!479785 d!76697))

(declare-fun d!76699 () Bool)

(assert (=> d!76699 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479790 d!76699))

(declare-fun d!76701 () Bool)

(declare-fun e!282399 () Bool)

(assert (=> d!76701 e!282399))

(declare-fun c!57715 () Bool)

(assert (=> d!76701 (= c!57715 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218002 () Unit!14068)

(declare-fun choose!1374 (array!31035 array!31033 (_ BitVec 32) (_ BitVec 32) V!19315 V!19315 (_ BitVec 64) Int) Unit!14068)

(assert (=> d!76701 (= lt!218002 (choose!1374 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76701 (validMask!0 mask!2352)))

(assert (=> d!76701 (= (lemmaKeyInListMapIsInArray!109 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218002)))

(declare-fun b!479937 () Bool)

(assert (=> b!479937 (= e!282399 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479938 () Bool)

(assert (=> b!479938 (= e!282399 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76701 c!57715) b!479937))

(assert (= (and d!76701 (not c!57715)) b!479938))

(declare-fun m!461761 () Bool)

(assert (=> d!76701 m!461761))

(assert (=> d!76701 m!461647))

(assert (=> b!479937 m!461645))

(assert (=> b!479786 d!76701))

(declare-fun b!479945 () Bool)

(declare-fun e!282405 () Bool)

(assert (=> b!479945 (= e!282405 tp_is_empty!13683)))

(declare-fun condMapEmpty!22228 () Bool)

(declare-fun mapDefault!22228 () ValueCell!6480)

(assert (=> mapNonEmpty!22222 (= condMapEmpty!22228 (= mapRest!22222 ((as const (Array (_ BitVec 32) ValueCell!6480)) mapDefault!22228)))))

(declare-fun e!282404 () Bool)

(declare-fun mapRes!22228 () Bool)

(assert (=> mapNonEmpty!22222 (= tp!42784 (and e!282404 mapRes!22228))))

(declare-fun mapNonEmpty!22228 () Bool)

(declare-fun tp!42793 () Bool)

(assert (=> mapNonEmpty!22228 (= mapRes!22228 (and tp!42793 e!282405))))

(declare-fun mapKey!22228 () (_ BitVec 32))

(declare-fun mapValue!22228 () ValueCell!6480)

(declare-fun mapRest!22228 () (Array (_ BitVec 32) ValueCell!6480))

(assert (=> mapNonEmpty!22228 (= mapRest!22222 (store mapRest!22228 mapKey!22228 mapValue!22228))))

(declare-fun b!479946 () Bool)

(assert (=> b!479946 (= e!282404 tp_is_empty!13683)))

(declare-fun mapIsEmpty!22228 () Bool)

(assert (=> mapIsEmpty!22228 mapRes!22228))

(assert (= (and mapNonEmpty!22222 condMapEmpty!22228) mapIsEmpty!22228))

(assert (= (and mapNonEmpty!22222 (not condMapEmpty!22228)) mapNonEmpty!22228))

(assert (= (and mapNonEmpty!22228 ((_ is ValueCellFull!6480) mapValue!22228)) b!479945))

(assert (= (and mapNonEmpty!22222 ((_ is ValueCellFull!6480) mapDefault!22228)) b!479946))

(declare-fun m!461763 () Bool)

(assert (=> mapNonEmpty!22228 m!461763))

(declare-fun b_lambda!10793 () Bool)

(assert (= b_lambda!10791 (or (and start!43304 b_free!12171) b_lambda!10793)))

(check-sat (not bm!30863) (not b!479920) (not bm!30871) (not b!479906) (not bm!30865) (not d!76691) (not b!479930) (not b!479937) (not b!479847) (not b!479893) (not b_lambda!10793) (not d!76693) (not b!479892) (not b!479849) (not b!479894) b_and!20927 (not b!479905) (not b!479837) (not bm!30862) (not bm!30867) (not bm!30847) (not b!479836) (not d!76701) (not b!479911) (not b!479932) tp_is_empty!13683 (not b_next!12171) (not b!479898) (not mapNonEmpty!22228) (not b!479912) (not b!479839))
(check-sat b_and!20927 (not b_next!12171))
