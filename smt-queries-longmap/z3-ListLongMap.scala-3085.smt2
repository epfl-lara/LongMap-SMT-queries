; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43428 () Bool)

(assert start!43428)

(declare-fun b_free!12231 () Bool)

(declare-fun b_next!12231 () Bool)

(assert (=> start!43428 (= b_free!12231 (not b_next!12231))))

(declare-fun tp!42972 () Bool)

(declare-fun b_and!20989 () Bool)

(assert (=> start!43428 (= tp!42972 b_and!20989)))

(declare-fun b!481154 () Bool)

(declare-fun res!286891 () Bool)

(declare-fun e!283099 () Bool)

(assert (=> b!481154 (=> (not res!286891) (not e!283099))))

(declare-datatypes ((array!31147 0))(
  ( (array!31148 (arr!14977 (Array (_ BitVec 32) (_ BitVec 64))) (size!15335 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31147)

(declare-datatypes ((List!9154 0))(
  ( (Nil!9151) (Cons!9150 (h!10006 (_ BitVec 64)) (t!15366 List!9154)) )
))
(declare-fun arrayNoDuplicates!0 (array!31147 (_ BitVec 32) List!9154) Bool)

(assert (=> b!481154 (= res!286891 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9151))))

(declare-fun b!481155 () Bool)

(declare-fun e!283100 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481155 (= e!283100 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481156 () Bool)

(declare-fun res!286889 () Bool)

(assert (=> b!481156 (=> (not res!286889) (not e!283099))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31147 (_ BitVec 32)) Bool)

(assert (=> b!481156 (= res!286889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22321 () Bool)

(declare-fun mapRes!22321 () Bool)

(assert (=> mapIsEmpty!22321 mapRes!22321))

(declare-fun b!481157 () Bool)

(declare-fun e!283101 () Bool)

(declare-fun e!283104 () Bool)

(assert (=> b!481157 (= e!283101 (and e!283104 mapRes!22321))))

(declare-fun condMapEmpty!22321 () Bool)

(declare-datatypes ((V!19395 0))(
  ( (V!19396 (val!6919 Int)) )
))
(declare-datatypes ((ValueCell!6510 0))(
  ( (ValueCellFull!6510 (v!9211 V!19395)) (EmptyCell!6510) )
))
(declare-datatypes ((array!31149 0))(
  ( (array!31150 (arr!14978 (Array (_ BitVec 32) ValueCell!6510)) (size!15336 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31149)

(declare-fun mapDefault!22321 () ValueCell!6510)

(assert (=> b!481157 (= condMapEmpty!22321 (= (arr!14978 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6510)) mapDefault!22321)))))

(declare-fun mapNonEmpty!22321 () Bool)

(declare-fun tp!42973 () Bool)

(declare-fun e!283103 () Bool)

(assert (=> mapNonEmpty!22321 (= mapRes!22321 (and tp!42973 e!283103))))

(declare-fun mapRest!22321 () (Array (_ BitVec 32) ValueCell!6510))

(declare-fun mapValue!22321 () ValueCell!6510)

(declare-fun mapKey!22321 () (_ BitVec 32))

(assert (=> mapNonEmpty!22321 (= (arr!14978 _values!1516) (store mapRest!22321 mapKey!22321 mapValue!22321))))

(declare-fun b!481159 () Bool)

(declare-fun tp_is_empty!13743 () Bool)

(assert (=> b!481159 (= e!283103 tp_is_empty!13743)))

(declare-fun b!481160 () Bool)

(declare-fun res!286890 () Bool)

(assert (=> b!481160 (=> (not res!286890) (not e!283099))))

(assert (=> b!481160 (= res!286890 (and (= (size!15336 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15335 _keys!1874) (size!15336 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun lt!218389 () (_ BitVec 32))

(declare-fun b!481161 () Bool)

(assert (=> b!481161 (= e!283099 (not (or (not (= (size!15335 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvslt lt!218389 #b00000000000000000000000000000000) (bvsle lt!218389 (size!15335 _keys!1874)))))))

(assert (=> b!481161 (arrayForallSeekEntryOrOpenFound!0 lt!218389 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14110 0))(
  ( (Unit!14111) )
))
(declare-fun lt!218388 () Unit!14110)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14110)

(assert (=> b!481161 (= lt!218388 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218389))))

(declare-fun arrayScanForKey!0 (array!31147 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481161 (= lt!218389 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481161 e!283100))

(declare-fun c!57866 () Bool)

(assert (=> b!481161 (= c!57866 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19395)

(declare-fun zeroValue!1458 () V!19395)

(declare-fun lt!218387 () Unit!14110)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!127 (array!31147 array!31149 (_ BitVec 32) (_ BitVec 32) V!19395 V!19395 (_ BitVec 64) Int) Unit!14110)

(assert (=> b!481161 (= lt!218387 (lemmaKeyInListMapIsInArray!127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481162 () Bool)

(declare-fun res!286887 () Bool)

(assert (=> b!481162 (=> (not res!286887) (not e!283099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481162 (= res!286887 (validKeyInArray!0 k0!1332))))

(declare-fun b!481163 () Bool)

(assert (=> b!481163 (= e!283104 tp_is_empty!13743)))

(declare-fun b!481164 () Bool)

(declare-fun res!286892 () Bool)

(assert (=> b!481164 (=> (not res!286892) (not e!283099))))

(declare-datatypes ((tuple2!9076 0))(
  ( (tuple2!9077 (_1!4549 (_ BitVec 64)) (_2!4549 V!19395)) )
))
(declare-datatypes ((List!9155 0))(
  ( (Nil!9152) (Cons!9151 (h!10007 tuple2!9076) (t!15367 List!9155)) )
))
(declare-datatypes ((ListLongMap!7989 0))(
  ( (ListLongMap!7990 (toList!4010 List!9155)) )
))
(declare-fun contains!2623 (ListLongMap!7989 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2329 (array!31147 array!31149 (_ BitVec 32) (_ BitVec 32) V!19395 V!19395 (_ BitVec 32) Int) ListLongMap!7989)

(assert (=> b!481164 (= res!286892 (contains!2623 (getCurrentListMap!2329 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!286888 () Bool)

(assert (=> start!43428 (=> (not res!286888) (not e!283099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43428 (= res!286888 (validMask!0 mask!2352))))

(assert (=> start!43428 e!283099))

(assert (=> start!43428 true))

(assert (=> start!43428 tp_is_empty!13743))

(declare-fun array_inv!10800 (array!31149) Bool)

(assert (=> start!43428 (and (array_inv!10800 _values!1516) e!283101)))

(assert (=> start!43428 tp!42972))

(declare-fun array_inv!10801 (array!31147) Bool)

(assert (=> start!43428 (array_inv!10801 _keys!1874)))

(declare-fun b!481158 () Bool)

(declare-fun arrayContainsKey!0 (array!31147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481158 (= e!283100 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (= (and start!43428 res!286888) b!481160))

(assert (= (and b!481160 res!286890) b!481156))

(assert (= (and b!481156 res!286889) b!481154))

(assert (= (and b!481154 res!286891) b!481164))

(assert (= (and b!481164 res!286892) b!481162))

(assert (= (and b!481162 res!286887) b!481161))

(assert (= (and b!481161 c!57866) b!481158))

(assert (= (and b!481161 (not c!57866)) b!481155))

(assert (= (and b!481157 condMapEmpty!22321) mapIsEmpty!22321))

(assert (= (and b!481157 (not condMapEmpty!22321)) mapNonEmpty!22321))

(get-info :version)

(assert (= (and mapNonEmpty!22321 ((_ is ValueCellFull!6510) mapValue!22321)) b!481159))

(assert (= (and b!481157 ((_ is ValueCellFull!6510) mapDefault!22321)) b!481163))

(assert (= start!43428 b!481157))

(declare-fun m!462657 () Bool)

(assert (=> b!481156 m!462657))

(declare-fun m!462659 () Bool)

(assert (=> b!481162 m!462659))

(declare-fun m!462661 () Bool)

(assert (=> b!481164 m!462661))

(assert (=> b!481164 m!462661))

(declare-fun m!462663 () Bool)

(assert (=> b!481164 m!462663))

(declare-fun m!462665 () Bool)

(assert (=> start!43428 m!462665))

(declare-fun m!462667 () Bool)

(assert (=> start!43428 m!462667))

(declare-fun m!462669 () Bool)

(assert (=> start!43428 m!462669))

(declare-fun m!462671 () Bool)

(assert (=> b!481158 m!462671))

(declare-fun m!462673 () Bool)

(assert (=> mapNonEmpty!22321 m!462673))

(declare-fun m!462675 () Bool)

(assert (=> b!481154 m!462675))

(declare-fun m!462677 () Bool)

(assert (=> b!481161 m!462677))

(declare-fun m!462679 () Bool)

(assert (=> b!481161 m!462679))

(declare-fun m!462681 () Bool)

(assert (=> b!481161 m!462681))

(declare-fun m!462683 () Bool)

(assert (=> b!481161 m!462683))

(check-sat (not b!481156) (not mapNonEmpty!22321) (not b!481158) (not b!481161) (not b!481154) b_and!20989 (not b!481162) (not b_next!12231) tp_is_empty!13743 (not b!481164) (not start!43428))
(check-sat b_and!20989 (not b_next!12231))
(get-model)

(declare-fun d!76769 () Bool)

(declare-fun res!286915 () Bool)

(declare-fun e!283127 () Bool)

(assert (=> d!76769 (=> res!286915 e!283127)))

(assert (=> d!76769 (= res!286915 (= (select (arr!14977 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76769 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!283127)))

(declare-fun b!481202 () Bool)

(declare-fun e!283128 () Bool)

(assert (=> b!481202 (= e!283127 e!283128)))

(declare-fun res!286916 () Bool)

(assert (=> b!481202 (=> (not res!286916) (not e!283128))))

(assert (=> b!481202 (= res!286916 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15335 _keys!1874)))))

(declare-fun b!481203 () Bool)

(assert (=> b!481203 (= e!283128 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76769 (not res!286915)) b!481202))

(assert (= (and b!481202 res!286916) b!481203))

(declare-fun m!462713 () Bool)

(assert (=> d!76769 m!462713))

(declare-fun m!462715 () Bool)

(assert (=> b!481203 m!462715))

(assert (=> b!481158 d!76769))

(declare-fun d!76771 () Bool)

(declare-fun e!283134 () Bool)

(assert (=> d!76771 e!283134))

(declare-fun res!286919 () Bool)

(assert (=> d!76771 (=> res!286919 e!283134)))

(declare-fun lt!218409 () Bool)

(assert (=> d!76771 (= res!286919 (not lt!218409))))

(declare-fun lt!218410 () Bool)

(assert (=> d!76771 (= lt!218409 lt!218410)))

(declare-fun lt!218407 () Unit!14110)

(declare-fun e!283133 () Unit!14110)

(assert (=> d!76771 (= lt!218407 e!283133)))

(declare-fun c!57872 () Bool)

(assert (=> d!76771 (= c!57872 lt!218410)))

(declare-fun containsKey!357 (List!9155 (_ BitVec 64)) Bool)

(assert (=> d!76771 (= lt!218410 (containsKey!357 (toList!4010 (getCurrentListMap!2329 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76771 (= (contains!2623 (getCurrentListMap!2329 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218409)))

(declare-fun b!481210 () Bool)

(declare-fun lt!218408 () Unit!14110)

(assert (=> b!481210 (= e!283133 lt!218408)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!305 (List!9155 (_ BitVec 64)) Unit!14110)

(assert (=> b!481210 (= lt!218408 (lemmaContainsKeyImpliesGetValueByKeyDefined!305 (toList!4010 (getCurrentListMap!2329 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!401 0))(
  ( (Some!400 (v!9213 V!19395)) (None!399) )
))
(declare-fun isDefined!306 (Option!401) Bool)

(declare-fun getValueByKey!395 (List!9155 (_ BitVec 64)) Option!401)

(assert (=> b!481210 (isDefined!306 (getValueByKey!395 (toList!4010 (getCurrentListMap!2329 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!481211 () Bool)

(declare-fun Unit!14114 () Unit!14110)

(assert (=> b!481211 (= e!283133 Unit!14114)))

(declare-fun b!481212 () Bool)

(assert (=> b!481212 (= e!283134 (isDefined!306 (getValueByKey!395 (toList!4010 (getCurrentListMap!2329 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76771 c!57872) b!481210))

(assert (= (and d!76771 (not c!57872)) b!481211))

(assert (= (and d!76771 (not res!286919)) b!481212))

(declare-fun m!462717 () Bool)

(assert (=> d!76771 m!462717))

(declare-fun m!462719 () Bool)

(assert (=> b!481210 m!462719))

(declare-fun m!462721 () Bool)

(assert (=> b!481210 m!462721))

(assert (=> b!481210 m!462721))

(declare-fun m!462723 () Bool)

(assert (=> b!481210 m!462723))

(assert (=> b!481212 m!462721))

(assert (=> b!481212 m!462721))

(assert (=> b!481212 m!462723))

(assert (=> b!481164 d!76771))

(declare-fun b!481255 () Bool)

(declare-fun e!283163 () Bool)

(declare-fun e!283162 () Bool)

(assert (=> b!481255 (= e!283163 e!283162)))

(declare-fun res!286942 () Bool)

(declare-fun call!30949 () Bool)

(assert (=> b!481255 (= res!286942 call!30949)))

(assert (=> b!481255 (=> (not res!286942) (not e!283162))))

(declare-fun b!481256 () Bool)

(declare-fun res!286939 () Bool)

(declare-fun e!283161 () Bool)

(assert (=> b!481256 (=> (not res!286939) (not e!283161))))

(declare-fun e!283170 () Bool)

(assert (=> b!481256 (= res!286939 e!283170)))

(declare-fun c!57885 () Bool)

(assert (=> b!481256 (= c!57885 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!481257 () Bool)

(declare-fun e!283164 () Bool)

(assert (=> b!481257 (= e!283164 (validKeyInArray!0 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481258 () Bool)

(declare-fun e!283167 () Bool)

(declare-fun lt!218471 () ListLongMap!7989)

(declare-fun apply!342 (ListLongMap!7989 (_ BitVec 64)) V!19395)

(assert (=> b!481258 (= e!283167 (= (apply!342 lt!218471 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun bm!30941 () Bool)

(declare-fun call!30948 () ListLongMap!7989)

(declare-fun call!30950 () ListLongMap!7989)

(assert (=> bm!30941 (= call!30948 call!30950)))

(declare-fun b!481259 () Bool)

(assert (=> b!481259 (= e!283163 (not call!30949))))

(declare-fun bm!30942 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2111 (array!31147 array!31149 (_ BitVec 32) (_ BitVec 32) V!19395 V!19395 (_ BitVec 32) Int) ListLongMap!7989)

(assert (=> bm!30942 (= call!30950 (getCurrentListMapNoExtraKeys!2111 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!481260 () Bool)

(declare-fun e!283173 () ListLongMap!7989)

(declare-fun call!30944 () ListLongMap!7989)

(assert (=> b!481260 (= e!283173 call!30944)))

(declare-fun b!481262 () Bool)

(assert (=> b!481262 (= e!283162 (= (apply!342 lt!218471 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!481263 () Bool)

(declare-fun e!283168 () ListLongMap!7989)

(declare-fun call!30946 () ListLongMap!7989)

(declare-fun +!1774 (ListLongMap!7989 tuple2!9076) ListLongMap!7989)

(assert (=> b!481263 (= e!283168 (+!1774 call!30946 (tuple2!9077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun bm!30943 () Bool)

(assert (=> bm!30943 (= call!30944 call!30948)))

(declare-fun e!283165 () Bool)

(declare-fun b!481264 () Bool)

(declare-fun get!7261 (ValueCell!6510 V!19395) V!19395)

(declare-fun dynLambda!953 (Int (_ BitVec 64)) V!19395)

(assert (=> b!481264 (= e!283165 (= (apply!342 lt!218471 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000)) (get!7261 (select (arr!14978 _values!1516) #b00000000000000000000000000000000) (dynLambda!953 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!481264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15336 _values!1516)))))

(assert (=> b!481264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(declare-fun bm!30944 () Bool)

(assert (=> bm!30944 (= call!30949 (contains!2623 lt!218471 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!481265 () Bool)

(declare-fun call!30945 () ListLongMap!7989)

(assert (=> b!481265 (= e!283173 call!30945)))

(declare-fun b!481266 () Bool)

(declare-fun e!283169 () Unit!14110)

(declare-fun Unit!14115 () Unit!14110)

(assert (=> b!481266 (= e!283169 Unit!14115)))

(declare-fun b!481267 () Bool)

(declare-fun e!283172 () Bool)

(assert (=> b!481267 (= e!283172 e!283165)))

(declare-fun res!286938 () Bool)

(assert (=> b!481267 (=> (not res!286938) (not e!283165))))

(assert (=> b!481267 (= res!286938 (contains!2623 lt!218471 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!481267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(declare-fun b!481268 () Bool)

(assert (=> b!481268 (= e!283161 e!283163)))

(declare-fun c!57889 () Bool)

(assert (=> b!481268 (= c!57889 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!57886 () Bool)

(declare-fun bm!30945 () Bool)

(declare-fun c!57890 () Bool)

(assert (=> bm!30945 (= call!30946 (+!1774 (ite c!57890 call!30950 (ite c!57886 call!30948 call!30944)) (ite (or c!57890 c!57886) (tuple2!9077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!481261 () Bool)

(declare-fun res!286946 () Bool)

(assert (=> b!481261 (=> (not res!286946) (not e!283161))))

(assert (=> b!481261 (= res!286946 e!283172)))

(declare-fun res!286945 () Bool)

(assert (=> b!481261 (=> res!286945 e!283172)))

(assert (=> b!481261 (= res!286945 (not e!283164))))

(declare-fun res!286944 () Bool)

(assert (=> b!481261 (=> (not res!286944) (not e!283164))))

(assert (=> b!481261 (= res!286944 (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(declare-fun d!76773 () Bool)

(assert (=> d!76773 e!283161))

(declare-fun res!286943 () Bool)

(assert (=> d!76773 (=> (not res!286943) (not e!283161))))

(assert (=> d!76773 (= res!286943 (or (bvsge #b00000000000000000000000000000000 (size!15335 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))))

(declare-fun lt!218457 () ListLongMap!7989)

(assert (=> d!76773 (= lt!218471 lt!218457)))

(declare-fun lt!218472 () Unit!14110)

(assert (=> d!76773 (= lt!218472 e!283169)))

(declare-fun c!57887 () Bool)

(declare-fun e!283166 () Bool)

(assert (=> d!76773 (= c!57887 e!283166)))

(declare-fun res!286941 () Bool)

(assert (=> d!76773 (=> (not res!286941) (not e!283166))))

(assert (=> d!76773 (= res!286941 (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(assert (=> d!76773 (= lt!218457 e!283168)))

(assert (=> d!76773 (= c!57890 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76773 (validMask!0 mask!2352)))

(assert (=> d!76773 (= (getCurrentListMap!2329 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218471)))

(declare-fun b!481269 () Bool)

(assert (=> b!481269 (= e!283166 (validKeyInArray!0 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481270 () Bool)

(declare-fun c!57888 () Bool)

(assert (=> b!481270 (= c!57888 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!283171 () ListLongMap!7989)

(assert (=> b!481270 (= e!283171 e!283173)))

(declare-fun b!481271 () Bool)

(declare-fun call!30947 () Bool)

(assert (=> b!481271 (= e!283170 (not call!30947))))

(declare-fun b!481272 () Bool)

(assert (=> b!481272 (= e!283171 call!30945)))

(declare-fun bm!30946 () Bool)

(assert (=> bm!30946 (= call!30945 call!30946)))

(declare-fun b!481273 () Bool)

(declare-fun lt!218463 () Unit!14110)

(assert (=> b!481273 (= e!283169 lt!218463)))

(declare-fun lt!218456 () ListLongMap!7989)

(assert (=> b!481273 (= lt!218456 (getCurrentListMapNoExtraKeys!2111 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218460 () (_ BitVec 64))

(assert (=> b!481273 (= lt!218460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218470 () (_ BitVec 64))

(assert (=> b!481273 (= lt!218470 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218475 () Unit!14110)

(declare-fun addStillContains!300 (ListLongMap!7989 (_ BitVec 64) V!19395 (_ BitVec 64)) Unit!14110)

(assert (=> b!481273 (= lt!218475 (addStillContains!300 lt!218456 lt!218460 zeroValue!1458 lt!218470))))

(assert (=> b!481273 (contains!2623 (+!1774 lt!218456 (tuple2!9077 lt!218460 zeroValue!1458)) lt!218470)))

(declare-fun lt!218455 () Unit!14110)

(assert (=> b!481273 (= lt!218455 lt!218475)))

(declare-fun lt!218476 () ListLongMap!7989)

(assert (=> b!481273 (= lt!218476 (getCurrentListMapNoExtraKeys!2111 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218459 () (_ BitVec 64))

(assert (=> b!481273 (= lt!218459 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218469 () (_ BitVec 64))

(assert (=> b!481273 (= lt!218469 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218473 () Unit!14110)

(declare-fun addApplyDifferent!300 (ListLongMap!7989 (_ BitVec 64) V!19395 (_ BitVec 64)) Unit!14110)

(assert (=> b!481273 (= lt!218473 (addApplyDifferent!300 lt!218476 lt!218459 minValue!1458 lt!218469))))

(assert (=> b!481273 (= (apply!342 (+!1774 lt!218476 (tuple2!9077 lt!218459 minValue!1458)) lt!218469) (apply!342 lt!218476 lt!218469))))

(declare-fun lt!218474 () Unit!14110)

(assert (=> b!481273 (= lt!218474 lt!218473)))

(declare-fun lt!218467 () ListLongMap!7989)

(assert (=> b!481273 (= lt!218467 (getCurrentListMapNoExtraKeys!2111 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218466 () (_ BitVec 64))

(assert (=> b!481273 (= lt!218466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218465 () (_ BitVec 64))

(assert (=> b!481273 (= lt!218465 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218458 () Unit!14110)

(assert (=> b!481273 (= lt!218458 (addApplyDifferent!300 lt!218467 lt!218466 zeroValue!1458 lt!218465))))

(assert (=> b!481273 (= (apply!342 (+!1774 lt!218467 (tuple2!9077 lt!218466 zeroValue!1458)) lt!218465) (apply!342 lt!218467 lt!218465))))

(declare-fun lt!218464 () Unit!14110)

(assert (=> b!481273 (= lt!218464 lt!218458)))

(declare-fun lt!218468 () ListLongMap!7989)

(assert (=> b!481273 (= lt!218468 (getCurrentListMapNoExtraKeys!2111 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218462 () (_ BitVec 64))

(assert (=> b!481273 (= lt!218462 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218461 () (_ BitVec 64))

(assert (=> b!481273 (= lt!218461 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!481273 (= lt!218463 (addApplyDifferent!300 lt!218468 lt!218462 minValue!1458 lt!218461))))

(assert (=> b!481273 (= (apply!342 (+!1774 lt!218468 (tuple2!9077 lt!218462 minValue!1458)) lt!218461) (apply!342 lt!218468 lt!218461))))

(declare-fun b!481274 () Bool)

(assert (=> b!481274 (= e!283168 e!283171)))

(assert (=> b!481274 (= c!57886 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30947 () Bool)

(assert (=> bm!30947 (= call!30947 (contains!2623 lt!218471 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!481275 () Bool)

(assert (=> b!481275 (= e!283170 e!283167)))

(declare-fun res!286940 () Bool)

(assert (=> b!481275 (= res!286940 call!30947)))

(assert (=> b!481275 (=> (not res!286940) (not e!283167))))

(assert (= (and d!76773 c!57890) b!481263))

(assert (= (and d!76773 (not c!57890)) b!481274))

(assert (= (and b!481274 c!57886) b!481272))

(assert (= (and b!481274 (not c!57886)) b!481270))

(assert (= (and b!481270 c!57888) b!481265))

(assert (= (and b!481270 (not c!57888)) b!481260))

(assert (= (or b!481265 b!481260) bm!30943))

(assert (= (or b!481272 bm!30943) bm!30941))

(assert (= (or b!481272 b!481265) bm!30946))

(assert (= (or b!481263 bm!30941) bm!30942))

(assert (= (or b!481263 bm!30946) bm!30945))

(assert (= (and d!76773 res!286941) b!481269))

(assert (= (and d!76773 c!57887) b!481273))

(assert (= (and d!76773 (not c!57887)) b!481266))

(assert (= (and d!76773 res!286943) b!481261))

(assert (= (and b!481261 res!286944) b!481257))

(assert (= (and b!481261 (not res!286945)) b!481267))

(assert (= (and b!481267 res!286938) b!481264))

(assert (= (and b!481261 res!286946) b!481256))

(assert (= (and b!481256 c!57885) b!481275))

(assert (= (and b!481256 (not c!57885)) b!481271))

(assert (= (and b!481275 res!286940) b!481258))

(assert (= (or b!481275 b!481271) bm!30947))

(assert (= (and b!481256 res!286939) b!481268))

(assert (= (and b!481268 c!57889) b!481255))

(assert (= (and b!481268 (not c!57889)) b!481259))

(assert (= (and b!481255 res!286942) b!481262))

(assert (= (or b!481255 b!481259) bm!30944))

(declare-fun b_lambda!10803 () Bool)

(assert (=> (not b_lambda!10803) (not b!481264)))

(declare-fun t!15371 () Bool)

(declare-fun tb!4165 () Bool)

(assert (=> (and start!43428 (= defaultEntry!1519 defaultEntry!1519) t!15371) tb!4165))

(declare-fun result!7763 () Bool)

(assert (=> tb!4165 (= result!7763 tp_is_empty!13743)))

(assert (=> b!481264 t!15371))

(declare-fun b_and!20993 () Bool)

(assert (= b_and!20989 (and (=> t!15371 result!7763) b_and!20993)))

(assert (=> b!481264 m!462713))

(declare-fun m!462725 () Bool)

(assert (=> b!481264 m!462725))

(declare-fun m!462727 () Bool)

(assert (=> b!481264 m!462727))

(declare-fun m!462729 () Bool)

(assert (=> b!481264 m!462729))

(assert (=> b!481264 m!462713))

(declare-fun m!462731 () Bool)

(assert (=> b!481264 m!462731))

(assert (=> b!481264 m!462725))

(assert (=> b!481264 m!462727))

(declare-fun m!462733 () Bool)

(assert (=> bm!30947 m!462733))

(declare-fun m!462735 () Bool)

(assert (=> bm!30945 m!462735))

(declare-fun m!462737 () Bool)

(assert (=> b!481258 m!462737))

(assert (=> b!481269 m!462713))

(assert (=> b!481269 m!462713))

(declare-fun m!462739 () Bool)

(assert (=> b!481269 m!462739))

(declare-fun m!462741 () Bool)

(assert (=> b!481273 m!462741))

(declare-fun m!462743 () Bool)

(assert (=> b!481273 m!462743))

(declare-fun m!462745 () Bool)

(assert (=> b!481273 m!462745))

(declare-fun m!462747 () Bool)

(assert (=> b!481273 m!462747))

(declare-fun m!462749 () Bool)

(assert (=> b!481273 m!462749))

(declare-fun m!462751 () Bool)

(assert (=> b!481273 m!462751))

(assert (=> b!481273 m!462749))

(declare-fun m!462753 () Bool)

(assert (=> b!481273 m!462753))

(declare-fun m!462755 () Bool)

(assert (=> b!481273 m!462755))

(declare-fun m!462757 () Bool)

(assert (=> b!481273 m!462757))

(assert (=> b!481273 m!462713))

(assert (=> b!481273 m!462751))

(declare-fun m!462759 () Bool)

(assert (=> b!481273 m!462759))

(assert (=> b!481273 m!462755))

(declare-fun m!462761 () Bool)

(assert (=> b!481273 m!462761))

(declare-fun m!462763 () Bool)

(assert (=> b!481273 m!462763))

(assert (=> b!481273 m!462747))

(declare-fun m!462765 () Bool)

(assert (=> b!481273 m!462765))

(declare-fun m!462767 () Bool)

(assert (=> b!481273 m!462767))

(declare-fun m!462769 () Bool)

(assert (=> b!481273 m!462769))

(declare-fun m!462771 () Bool)

(assert (=> b!481273 m!462771))

(assert (=> b!481257 m!462713))

(assert (=> b!481257 m!462713))

(assert (=> b!481257 m!462739))

(declare-fun m!462773 () Bool)

(assert (=> b!481262 m!462773))

(assert (=> b!481267 m!462713))

(assert (=> b!481267 m!462713))

(declare-fun m!462775 () Bool)

(assert (=> b!481267 m!462775))

(assert (=> d!76773 m!462665))

(declare-fun m!462777 () Bool)

(assert (=> bm!30944 m!462777))

(assert (=> bm!30942 m!462741))

(declare-fun m!462779 () Bool)

(assert (=> b!481263 m!462779))

(assert (=> b!481164 d!76773))

(declare-fun b!481286 () Bool)

(declare-fun e!283182 () Bool)

(declare-fun call!30953 () Bool)

(assert (=> b!481286 (= e!283182 call!30953)))

(declare-fun b!481287 () Bool)

(declare-fun e!283180 () Bool)

(assert (=> b!481287 (= e!283182 e!283180)))

(declare-fun lt!218483 () (_ BitVec 64))

(assert (=> b!481287 (= lt!218483 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218485 () Unit!14110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31147 (_ BitVec 64) (_ BitVec 32)) Unit!14110)

(assert (=> b!481287 (= lt!218485 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218483 #b00000000000000000000000000000000))))

(assert (=> b!481287 (arrayContainsKey!0 _keys!1874 lt!218483 #b00000000000000000000000000000000)))

(declare-fun lt!218484 () Unit!14110)

(assert (=> b!481287 (= lt!218484 lt!218485)))

(declare-fun res!286951 () Bool)

(declare-datatypes ((SeekEntryResult!3571 0))(
  ( (MissingZero!3571 (index!16463 (_ BitVec 32))) (Found!3571 (index!16464 (_ BitVec 32))) (Intermediate!3571 (undefined!4383 Bool) (index!16465 (_ BitVec 32)) (x!45195 (_ BitVec 32))) (Undefined!3571) (MissingVacant!3571 (index!16466 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31147 (_ BitVec 32)) SeekEntryResult!3571)

(assert (=> b!481287 (= res!286951 (= (seekEntryOrOpen!0 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3571 #b00000000000000000000000000000000)))))

(assert (=> b!481287 (=> (not res!286951) (not e!283180))))

(declare-fun b!481288 () Bool)

(assert (=> b!481288 (= e!283180 call!30953)))

(declare-fun d!76775 () Bool)

(declare-fun res!286952 () Bool)

(declare-fun e!283181 () Bool)

(assert (=> d!76775 (=> res!286952 e!283181)))

(assert (=> d!76775 (= res!286952 (bvsge #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(assert (=> d!76775 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!283181)))

(declare-fun b!481289 () Bool)

(assert (=> b!481289 (= e!283181 e!283182)))

(declare-fun c!57893 () Bool)

(assert (=> b!481289 (= c!57893 (validKeyInArray!0 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30950 () Bool)

(assert (=> bm!30950 (= call!30953 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76775 (not res!286952)) b!481289))

(assert (= (and b!481289 c!57893) b!481287))

(assert (= (and b!481289 (not c!57893)) b!481286))

(assert (= (and b!481287 res!286951) b!481288))

(assert (= (or b!481288 b!481286) bm!30950))

(assert (=> b!481287 m!462713))

(declare-fun m!462781 () Bool)

(assert (=> b!481287 m!462781))

(declare-fun m!462783 () Bool)

(assert (=> b!481287 m!462783))

(assert (=> b!481287 m!462713))

(declare-fun m!462785 () Bool)

(assert (=> b!481287 m!462785))

(assert (=> b!481289 m!462713))

(assert (=> b!481289 m!462713))

(assert (=> b!481289 m!462739))

(declare-fun m!462787 () Bool)

(assert (=> bm!30950 m!462787))

(assert (=> b!481156 d!76775))

(declare-fun b!481290 () Bool)

(declare-fun e!283185 () Bool)

(declare-fun call!30954 () Bool)

(assert (=> b!481290 (= e!283185 call!30954)))

(declare-fun b!481291 () Bool)

(declare-fun e!283183 () Bool)

(assert (=> b!481291 (= e!283185 e!283183)))

(declare-fun lt!218486 () (_ BitVec 64))

(assert (=> b!481291 (= lt!218486 (select (arr!14977 _keys!1874) lt!218389))))

(declare-fun lt!218488 () Unit!14110)

(assert (=> b!481291 (= lt!218488 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218486 lt!218389))))

(assert (=> b!481291 (arrayContainsKey!0 _keys!1874 lt!218486 #b00000000000000000000000000000000)))

(declare-fun lt!218487 () Unit!14110)

(assert (=> b!481291 (= lt!218487 lt!218488)))

(declare-fun res!286953 () Bool)

(assert (=> b!481291 (= res!286953 (= (seekEntryOrOpen!0 (select (arr!14977 _keys!1874) lt!218389) _keys!1874 mask!2352) (Found!3571 lt!218389)))))

(assert (=> b!481291 (=> (not res!286953) (not e!283183))))

(declare-fun b!481292 () Bool)

(assert (=> b!481292 (= e!283183 call!30954)))

(declare-fun d!76777 () Bool)

(declare-fun res!286954 () Bool)

(declare-fun e!283184 () Bool)

(assert (=> d!76777 (=> res!286954 e!283184)))

(assert (=> d!76777 (= res!286954 (bvsge lt!218389 (size!15335 _keys!1874)))))

(assert (=> d!76777 (= (arrayForallSeekEntryOrOpenFound!0 lt!218389 _keys!1874 mask!2352) e!283184)))

(declare-fun b!481293 () Bool)

(assert (=> b!481293 (= e!283184 e!283185)))

(declare-fun c!57894 () Bool)

(assert (=> b!481293 (= c!57894 (validKeyInArray!0 (select (arr!14977 _keys!1874) lt!218389)))))

(declare-fun bm!30951 () Bool)

(assert (=> bm!30951 (= call!30954 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!218389 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76777 (not res!286954)) b!481293))

(assert (= (and b!481293 c!57894) b!481291))

(assert (= (and b!481293 (not c!57894)) b!481290))

(assert (= (and b!481291 res!286953) b!481292))

(assert (= (or b!481292 b!481290) bm!30951))

(declare-fun m!462789 () Bool)

(assert (=> b!481291 m!462789))

(declare-fun m!462791 () Bool)

(assert (=> b!481291 m!462791))

(declare-fun m!462793 () Bool)

(assert (=> b!481291 m!462793))

(assert (=> b!481291 m!462789))

(declare-fun m!462795 () Bool)

(assert (=> b!481291 m!462795))

(assert (=> b!481293 m!462789))

(assert (=> b!481293 m!462789))

(declare-fun m!462797 () Bool)

(assert (=> b!481293 m!462797))

(declare-fun m!462799 () Bool)

(assert (=> bm!30951 m!462799))

(assert (=> b!481161 d!76777))

(declare-fun d!76779 () Bool)

(assert (=> d!76779 (arrayForallSeekEntryOrOpenFound!0 lt!218389 _keys!1874 mask!2352)))

(declare-fun lt!218491 () Unit!14110)

(declare-fun choose!38 (array!31147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14110)

(assert (=> d!76779 (= lt!218491 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218389))))

(assert (=> d!76779 (validMask!0 mask!2352)))

(assert (=> d!76779 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218389) lt!218491)))

(declare-fun bs!15304 () Bool)

(assert (= bs!15304 d!76779))

(assert (=> bs!15304 m!462677))

(declare-fun m!462801 () Bool)

(assert (=> bs!15304 m!462801))

(assert (=> bs!15304 m!462665))

(assert (=> b!481161 d!76779))

(declare-fun d!76781 () Bool)

(declare-fun lt!218494 () (_ BitVec 32))

(assert (=> d!76781 (and (or (bvslt lt!218494 #b00000000000000000000000000000000) (bvsge lt!218494 (size!15335 _keys!1874)) (and (bvsge lt!218494 #b00000000000000000000000000000000) (bvslt lt!218494 (size!15335 _keys!1874)))) (bvsge lt!218494 #b00000000000000000000000000000000) (bvslt lt!218494 (size!15335 _keys!1874)) (= (select (arr!14977 _keys!1874) lt!218494) k0!1332))))

(declare-fun e!283188 () (_ BitVec 32))

(assert (=> d!76781 (= lt!218494 e!283188)))

(declare-fun c!57897 () Bool)

(assert (=> d!76781 (= c!57897 (= (select (arr!14977 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)) (bvslt (size!15335 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76781 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218494)))

(declare-fun b!481298 () Bool)

(assert (=> b!481298 (= e!283188 #b00000000000000000000000000000000)))

(declare-fun b!481299 () Bool)

(assert (=> b!481299 (= e!283188 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76781 c!57897) b!481298))

(assert (= (and d!76781 (not c!57897)) b!481299))

(declare-fun m!462803 () Bool)

(assert (=> d!76781 m!462803))

(assert (=> d!76781 m!462713))

(declare-fun m!462805 () Bool)

(assert (=> b!481299 m!462805))

(assert (=> b!481161 d!76781))

(declare-fun d!76783 () Bool)

(declare-fun e!283191 () Bool)

(assert (=> d!76783 e!283191))

(declare-fun c!57900 () Bool)

(assert (=> d!76783 (= c!57900 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218497 () Unit!14110)

(declare-fun choose!1377 (array!31147 array!31149 (_ BitVec 32) (_ BitVec 32) V!19395 V!19395 (_ BitVec 64) Int) Unit!14110)

(assert (=> d!76783 (= lt!218497 (choose!1377 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76783 (validMask!0 mask!2352)))

(assert (=> d!76783 (= (lemmaKeyInListMapIsInArray!127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218497)))

(declare-fun b!481304 () Bool)

(assert (=> b!481304 (= e!283191 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481305 () Bool)

(assert (=> b!481305 (= e!283191 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76783 c!57900) b!481304))

(assert (= (and d!76783 (not c!57900)) b!481305))

(declare-fun m!462807 () Bool)

(assert (=> d!76783 m!462807))

(assert (=> d!76783 m!462665))

(assert (=> b!481304 m!462671))

(assert (=> b!481161 d!76783))

(declare-fun d!76785 () Bool)

(assert (=> d!76785 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!481162 d!76785))

(declare-fun bm!30954 () Bool)

(declare-fun call!30957 () Bool)

(declare-fun c!57903 () Bool)

(assert (=> bm!30954 (= call!30957 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57903 (Cons!9150 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000) Nil!9151) Nil!9151)))))

(declare-fun d!76787 () Bool)

(declare-fun res!286962 () Bool)

(declare-fun e!283203 () Bool)

(assert (=> d!76787 (=> res!286962 e!283203)))

(assert (=> d!76787 (= res!286962 (bvsge #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(assert (=> d!76787 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9151) e!283203)))

(declare-fun b!481316 () Bool)

(declare-fun e!283200 () Bool)

(declare-fun contains!2625 (List!9154 (_ BitVec 64)) Bool)

(assert (=> b!481316 (= e!283200 (contains!2625 Nil!9151 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481317 () Bool)

(declare-fun e!283202 () Bool)

(assert (=> b!481317 (= e!283202 call!30957)))

(declare-fun b!481318 () Bool)

(assert (=> b!481318 (= e!283202 call!30957)))

(declare-fun b!481319 () Bool)

(declare-fun e!283201 () Bool)

(assert (=> b!481319 (= e!283203 e!283201)))

(declare-fun res!286963 () Bool)

(assert (=> b!481319 (=> (not res!286963) (not e!283201))))

(assert (=> b!481319 (= res!286963 (not e!283200))))

(declare-fun res!286961 () Bool)

(assert (=> b!481319 (=> (not res!286961) (not e!283200))))

(assert (=> b!481319 (= res!286961 (validKeyInArray!0 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481320 () Bool)

(assert (=> b!481320 (= e!283201 e!283202)))

(assert (=> b!481320 (= c!57903 (validKeyInArray!0 (select (arr!14977 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76787 (not res!286962)) b!481319))

(assert (= (and b!481319 res!286961) b!481316))

(assert (= (and b!481319 res!286963) b!481320))

(assert (= (and b!481320 c!57903) b!481318))

(assert (= (and b!481320 (not c!57903)) b!481317))

(assert (= (or b!481318 b!481317) bm!30954))

(assert (=> bm!30954 m!462713))

(declare-fun m!462809 () Bool)

(assert (=> bm!30954 m!462809))

(assert (=> b!481316 m!462713))

(assert (=> b!481316 m!462713))

(declare-fun m!462811 () Bool)

(assert (=> b!481316 m!462811))

(assert (=> b!481319 m!462713))

(assert (=> b!481319 m!462713))

(assert (=> b!481319 m!462739))

(assert (=> b!481320 m!462713))

(assert (=> b!481320 m!462713))

(assert (=> b!481320 m!462739))

(assert (=> b!481154 d!76787))

(declare-fun d!76789 () Bool)

(assert (=> d!76789 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43428 d!76789))

(declare-fun d!76791 () Bool)

(assert (=> d!76791 (= (array_inv!10800 _values!1516) (bvsge (size!15336 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43428 d!76791))

(declare-fun d!76793 () Bool)

(assert (=> d!76793 (= (array_inv!10801 _keys!1874) (bvsge (size!15335 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43428 d!76793))

(declare-fun condMapEmpty!22327 () Bool)

(declare-fun mapDefault!22327 () ValueCell!6510)

(assert (=> mapNonEmpty!22321 (= condMapEmpty!22327 (= mapRest!22321 ((as const (Array (_ BitVec 32) ValueCell!6510)) mapDefault!22327)))))

(declare-fun e!283208 () Bool)

(declare-fun mapRes!22327 () Bool)

(assert (=> mapNonEmpty!22321 (= tp!42973 (and e!283208 mapRes!22327))))

(declare-fun mapIsEmpty!22327 () Bool)

(assert (=> mapIsEmpty!22327 mapRes!22327))

(declare-fun b!481328 () Bool)

(assert (=> b!481328 (= e!283208 tp_is_empty!13743)))

(declare-fun mapNonEmpty!22327 () Bool)

(declare-fun tp!42982 () Bool)

(declare-fun e!283209 () Bool)

(assert (=> mapNonEmpty!22327 (= mapRes!22327 (and tp!42982 e!283209))))

(declare-fun mapValue!22327 () ValueCell!6510)

(declare-fun mapRest!22327 () (Array (_ BitVec 32) ValueCell!6510))

(declare-fun mapKey!22327 () (_ BitVec 32))

(assert (=> mapNonEmpty!22327 (= mapRest!22321 (store mapRest!22327 mapKey!22327 mapValue!22327))))

(declare-fun b!481327 () Bool)

(assert (=> b!481327 (= e!283209 tp_is_empty!13743)))

(assert (= (and mapNonEmpty!22321 condMapEmpty!22327) mapIsEmpty!22327))

(assert (= (and mapNonEmpty!22321 (not condMapEmpty!22327)) mapNonEmpty!22327))

(assert (= (and mapNonEmpty!22327 ((_ is ValueCellFull!6510) mapValue!22327)) b!481327))

(assert (= (and mapNonEmpty!22321 ((_ is ValueCellFull!6510) mapDefault!22327)) b!481328))

(declare-fun m!462813 () Bool)

(assert (=> mapNonEmpty!22327 m!462813))

(declare-fun b_lambda!10805 () Bool)

(assert (= b_lambda!10803 (or (and start!43428 b_free!12231) b_lambda!10805)))

(check-sat (not b!481269) (not bm!30944) (not b!481287) (not b!481316) (not d!76773) (not b!481258) (not bm!30950) (not b_next!12231) tp_is_empty!13743 (not b!481293) (not b!481262) (not bm!30954) (not b!481263) (not d!76771) (not b!481299) (not b!481273) (not bm!30945) (not b!481257) (not d!76779) (not bm!30947) (not b!481304) (not b!481291) (not b!481289) (not b!481319) (not bm!30951) (not bm!30942) (not mapNonEmpty!22327) (not d!76783) (not b!481212) (not b!481203) b_and!20993 (not b!481264) (not b!481320) (not b!481267) (not b_lambda!10805) (not b!481210))
(check-sat b_and!20993 (not b_next!12231))
