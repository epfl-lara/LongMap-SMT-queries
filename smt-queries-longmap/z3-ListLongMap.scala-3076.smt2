; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43314 () Bool)

(assert start!43314)

(declare-fun b_free!12175 () Bool)

(declare-fun b_next!12175 () Bool)

(assert (=> start!43314 (= b_free!12175 (not b_next!12175))))

(declare-fun tp!42799 () Bool)

(declare-fun b_and!20939 () Bool)

(assert (=> start!43314 (= tp!42799 b_and!20939)))

(declare-fun mapNonEmpty!22231 () Bool)

(declare-fun mapRes!22231 () Bool)

(declare-fun tp!42798 () Bool)

(declare-fun e!282383 () Bool)

(assert (=> mapNonEmpty!22231 (= mapRes!22231 (and tp!42798 e!282383))))

(declare-datatypes ((V!19321 0))(
  ( (V!19322 (val!6891 Int)) )
))
(declare-datatypes ((ValueCell!6482 0))(
  ( (ValueCellFull!6482 (v!9182 V!19321)) (EmptyCell!6482) )
))
(declare-fun mapValue!22231 () ValueCell!6482)

(declare-fun mapRest!22231 () (Array (_ BitVec 32) ValueCell!6482))

(declare-fun mapKey!22231 () (_ BitVec 32))

(declare-datatypes ((array!31028 0))(
  ( (array!31029 (arr!14919 (Array (_ BitVec 32) ValueCell!6482)) (size!15277 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31028)

(assert (=> mapNonEmpty!22231 (= (arr!14919 _values!1516) (store mapRest!22231 mapKey!22231 mapValue!22231))))

(declare-fun b!479911 () Bool)

(declare-fun tp_is_empty!13687 () Bool)

(assert (=> b!479911 (= e!282383 tp_is_empty!13687)))

(declare-fun b!479912 () Bool)

(declare-fun res!286265 () Bool)

(declare-fun e!282381 () Bool)

(assert (=> b!479912 (=> (not res!286265) (not e!282381))))

(declare-datatypes ((array!31030 0))(
  ( (array!31031 (arr!14920 (Array (_ BitVec 32) (_ BitVec 64))) (size!15278 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31030)

(declare-datatypes ((List!9030 0))(
  ( (Nil!9027) (Cons!9026 (h!9882 (_ BitVec 64)) (t!15230 List!9030)) )
))
(declare-fun arrayNoDuplicates!0 (array!31030 (_ BitVec 32) List!9030) Bool)

(assert (=> b!479912 (= res!286265 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9027))))

(declare-fun b!479913 () Bool)

(declare-fun res!286266 () Bool)

(assert (=> b!479913 (=> (not res!286266) (not e!282381))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19321)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19321)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8960 0))(
  ( (tuple2!8961 (_1!4491 (_ BitVec 64)) (_2!4491 V!19321)) )
))
(declare-datatypes ((List!9031 0))(
  ( (Nil!9028) (Cons!9027 (h!9883 tuple2!8960) (t!15231 List!9031)) )
))
(declare-datatypes ((ListLongMap!7875 0))(
  ( (ListLongMap!7876 (toList!3953 List!9031)) )
))
(declare-fun contains!2582 (ListLongMap!7875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2267 (array!31030 array!31028 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 32) Int) ListLongMap!7875)

(assert (=> b!479913 (= res!286266 (contains!2582 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479914 () Bool)

(declare-fun res!286268 () Bool)

(assert (=> b!479914 (=> (not res!286268) (not e!282381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31030 (_ BitVec 32)) Bool)

(assert (=> b!479914 (= res!286268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479915 () Bool)

(declare-fun e!282384 () Bool)

(assert (=> b!479915 (= e!282381 (not e!282384))))

(declare-fun res!286270 () Bool)

(assert (=> b!479915 (=> res!286270 e!282384)))

(assert (=> b!479915 (= res!286270 (or (bvsge #b00000000000000000000000000000000 (size!15278 _keys!1874)) (bvsge (size!15278 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun e!282385 () Bool)

(assert (=> b!479915 e!282385))

(declare-fun c!57691 () Bool)

(assert (=> b!479915 (= c!57691 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14043 0))(
  ( (Unit!14044) )
))
(declare-fun lt!218017 () Unit!14043)

(declare-fun lemmaKeyInListMapIsInArray!116 (array!31030 array!31028 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 64) Int) Unit!14043)

(assert (=> b!479915 (= lt!218017 (lemmaKeyInListMapIsInArray!116 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!479916 () Bool)

(declare-fun res!286267 () Bool)

(assert (=> b!479916 (=> (not res!286267) (not e!282381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479916 (= res!286267 (validKeyInArray!0 k0!1332))))

(declare-fun b!479910 () Bool)

(declare-fun e!282387 () Bool)

(declare-fun e!282382 () Bool)

(assert (=> b!479910 (= e!282387 (and e!282382 mapRes!22231))))

(declare-fun condMapEmpty!22231 () Bool)

(declare-fun mapDefault!22231 () ValueCell!6482)

(assert (=> b!479910 (= condMapEmpty!22231 (= (arr!14919 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6482)) mapDefault!22231)))))

(declare-fun res!286269 () Bool)

(assert (=> start!43314 (=> (not res!286269) (not e!282381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43314 (= res!286269 (validMask!0 mask!2352))))

(assert (=> start!43314 e!282381))

(assert (=> start!43314 true))

(assert (=> start!43314 tp_is_empty!13687))

(declare-fun array_inv!10836 (array!31028) Bool)

(assert (=> start!43314 (and (array_inv!10836 _values!1516) e!282387)))

(assert (=> start!43314 tp!42799))

(declare-fun array_inv!10837 (array!31030) Bool)

(assert (=> start!43314 (array_inv!10837 _keys!1874)))

(declare-fun b!479917 () Bool)

(declare-fun arrayContainsKey!0 (array!31030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479917 (= e!282385 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479918 () Bool)

(declare-fun res!286271 () Bool)

(assert (=> b!479918 (=> (not res!286271) (not e!282381))))

(assert (=> b!479918 (= res!286271 (and (= (size!15277 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15278 _keys!1874) (size!15277 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479919 () Bool)

(assert (=> b!479919 (= e!282384 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479920 () Bool)

(assert (=> b!479920 (= e!282385 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22231 () Bool)

(assert (=> mapIsEmpty!22231 mapRes!22231))

(declare-fun b!479921 () Bool)

(assert (=> b!479921 (= e!282382 tp_is_empty!13687)))

(assert (= (and start!43314 res!286269) b!479918))

(assert (= (and b!479918 res!286271) b!479914))

(assert (= (and b!479914 res!286268) b!479912))

(assert (= (and b!479912 res!286265) b!479913))

(assert (= (and b!479913 res!286266) b!479916))

(assert (= (and b!479916 res!286267) b!479915))

(assert (= (and b!479915 c!57691) b!479917))

(assert (= (and b!479915 (not c!57691)) b!479920))

(assert (= (and b!479915 (not res!286270)) b!479919))

(assert (= (and b!479910 condMapEmpty!22231) mapIsEmpty!22231))

(assert (= (and b!479910 (not condMapEmpty!22231)) mapNonEmpty!22231))

(get-info :version)

(assert (= (and mapNonEmpty!22231 ((_ is ValueCellFull!6482) mapValue!22231)) b!479911))

(assert (= (and b!479910 ((_ is ValueCellFull!6482) mapDefault!22231)) b!479921))

(assert (= start!43314 b!479910))

(declare-fun m!461947 () Bool)

(assert (=> b!479917 m!461947))

(declare-fun m!461949 () Bool)

(assert (=> b!479913 m!461949))

(assert (=> b!479913 m!461949))

(declare-fun m!461951 () Bool)

(assert (=> b!479913 m!461951))

(declare-fun m!461953 () Bool)

(assert (=> b!479912 m!461953))

(declare-fun m!461955 () Bool)

(assert (=> mapNonEmpty!22231 m!461955))

(declare-fun m!461957 () Bool)

(assert (=> b!479916 m!461957))

(assert (=> b!479919 m!461947))

(declare-fun m!461959 () Bool)

(assert (=> b!479915 m!461959))

(declare-fun m!461961 () Bool)

(assert (=> start!43314 m!461961))

(declare-fun m!461963 () Bool)

(assert (=> start!43314 m!461963))

(declare-fun m!461965 () Bool)

(assert (=> start!43314 m!461965))

(declare-fun m!461967 () Bool)

(assert (=> b!479914 m!461967))

(check-sat (not start!43314) (not b!479915) (not b!479914) (not b!479912) (not mapNonEmpty!22231) (not b!479917) (not b!479913) (not b!479919) b_and!20939 tp_is_empty!13687 (not b_next!12175) (not b!479916))
(check-sat b_and!20939 (not b_next!12175))
(get-model)

(declare-fun d!76733 () Bool)

(declare-fun e!282432 () Bool)

(assert (=> d!76733 e!282432))

(declare-fun c!57700 () Bool)

(assert (=> d!76733 (= c!57700 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218026 () Unit!14043)

(declare-fun choose!1381 (array!31030 array!31028 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 64) Int) Unit!14043)

(assert (=> d!76733 (= lt!218026 (choose!1381 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76733 (validMask!0 mask!2352)))

(assert (=> d!76733 (= (lemmaKeyInListMapIsInArray!116 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218026)))

(declare-fun b!479998 () Bool)

(assert (=> b!479998 (= e!282432 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479999 () Bool)

(assert (=> b!479999 (= e!282432 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76733 c!57700) b!479998))

(assert (= (and d!76733 (not c!57700)) b!479999))

(declare-fun m!462013 () Bool)

(assert (=> d!76733 m!462013))

(assert (=> d!76733 m!461961))

(assert (=> b!479998 m!461947))

(assert (=> b!479915 d!76733))

(declare-fun d!76735 () Bool)

(assert (=> d!76735 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479916 d!76735))

(declare-fun b!480010 () Bool)

(declare-fun e!282444 () Bool)

(declare-fun call!30863 () Bool)

(assert (=> b!480010 (= e!282444 call!30863)))

(declare-fun b!480011 () Bool)

(declare-fun e!282442 () Bool)

(declare-fun contains!2585 (List!9030 (_ BitVec 64)) Bool)

(assert (=> b!480011 (= e!282442 (contains!2585 Nil!9027 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30860 () Bool)

(declare-fun c!57703 () Bool)

(assert (=> bm!30860 (= call!30863 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57703 (Cons!9026 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000) Nil!9027) Nil!9027)))))

(declare-fun b!480012 () Bool)

(declare-fun e!282443 () Bool)

(assert (=> b!480012 (= e!282443 e!282444)))

(assert (=> b!480012 (= c!57703 (validKeyInArray!0 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480013 () Bool)

(assert (=> b!480013 (= e!282444 call!30863)))

(declare-fun b!480014 () Bool)

(declare-fun e!282441 () Bool)

(assert (=> b!480014 (= e!282441 e!282443)))

(declare-fun res!286322 () Bool)

(assert (=> b!480014 (=> (not res!286322) (not e!282443))))

(assert (=> b!480014 (= res!286322 (not e!282442))))

(declare-fun res!286321 () Bool)

(assert (=> b!480014 (=> (not res!286321) (not e!282442))))

(assert (=> b!480014 (= res!286321 (validKeyInArray!0 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76737 () Bool)

(declare-fun res!286320 () Bool)

(assert (=> d!76737 (=> res!286320 e!282441)))

(assert (=> d!76737 (= res!286320 (bvsge #b00000000000000000000000000000000 (size!15278 _keys!1874)))))

(assert (=> d!76737 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9027) e!282441)))

(assert (= (and d!76737 (not res!286320)) b!480014))

(assert (= (and b!480014 res!286321) b!480011))

(assert (= (and b!480014 res!286322) b!480012))

(assert (= (and b!480012 c!57703) b!480010))

(assert (= (and b!480012 (not c!57703)) b!480013))

(assert (= (or b!480010 b!480013) bm!30860))

(declare-fun m!462015 () Bool)

(assert (=> b!480011 m!462015))

(assert (=> b!480011 m!462015))

(declare-fun m!462017 () Bool)

(assert (=> b!480011 m!462017))

(assert (=> bm!30860 m!462015))

(declare-fun m!462019 () Bool)

(assert (=> bm!30860 m!462019))

(assert (=> b!480012 m!462015))

(assert (=> b!480012 m!462015))

(declare-fun m!462021 () Bool)

(assert (=> b!480012 m!462021))

(assert (=> b!480014 m!462015))

(assert (=> b!480014 m!462015))

(assert (=> b!480014 m!462021))

(assert (=> b!479912 d!76737))

(declare-fun d!76739 () Bool)

(declare-fun res!286327 () Bool)

(declare-fun e!282449 () Bool)

(assert (=> d!76739 (=> res!286327 e!282449)))

(assert (=> d!76739 (= res!286327 (= (select (arr!14920 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76739 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282449)))

(declare-fun b!480019 () Bool)

(declare-fun e!282450 () Bool)

(assert (=> b!480019 (= e!282449 e!282450)))

(declare-fun res!286328 () Bool)

(assert (=> b!480019 (=> (not res!286328) (not e!282450))))

(assert (=> b!480019 (= res!286328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15278 _keys!1874)))))

(declare-fun b!480020 () Bool)

(assert (=> b!480020 (= e!282450 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76739 (not res!286327)) b!480019))

(assert (= (and b!480019 res!286328) b!480020))

(assert (=> d!76739 m!462015))

(declare-fun m!462023 () Bool)

(assert (=> b!480020 m!462023))

(assert (=> b!479917 d!76739))

(declare-fun d!76741 () Bool)

(assert (=> d!76741 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43314 d!76741))

(declare-fun d!76743 () Bool)

(assert (=> d!76743 (= (array_inv!10836 _values!1516) (bvsge (size!15277 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43314 d!76743))

(declare-fun d!76745 () Bool)

(assert (=> d!76745 (= (array_inv!10837 _keys!1874) (bvsge (size!15278 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43314 d!76745))

(declare-fun d!76747 () Bool)

(declare-fun e!282455 () Bool)

(assert (=> d!76747 e!282455))

(declare-fun res!286331 () Bool)

(assert (=> d!76747 (=> res!286331 e!282455)))

(declare-fun lt!218038 () Bool)

(assert (=> d!76747 (= res!286331 (not lt!218038))))

(declare-fun lt!218036 () Bool)

(assert (=> d!76747 (= lt!218038 lt!218036)))

(declare-fun lt!218037 () Unit!14043)

(declare-fun e!282456 () Unit!14043)

(assert (=> d!76747 (= lt!218037 e!282456)))

(declare-fun c!57706 () Bool)

(assert (=> d!76747 (= c!57706 lt!218036)))

(declare-fun containsKey!355 (List!9031 (_ BitVec 64)) Bool)

(assert (=> d!76747 (= lt!218036 (containsKey!355 (toList!3953 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76747 (= (contains!2582 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218038)))

(declare-fun b!480027 () Bool)

(declare-fun lt!218035 () Unit!14043)

(assert (=> b!480027 (= e!282456 lt!218035)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!303 (List!9031 (_ BitVec 64)) Unit!14043)

(assert (=> b!480027 (= lt!218035 (lemmaContainsKeyImpliesGetValueByKeyDefined!303 (toList!3953 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!400 0))(
  ( (Some!399 (v!9185 V!19321)) (None!398) )
))
(declare-fun isDefined!304 (Option!400) Bool)

(declare-fun getValueByKey!394 (List!9031 (_ BitVec 64)) Option!400)

(assert (=> b!480027 (isDefined!304 (getValueByKey!394 (toList!3953 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!480028 () Bool)

(declare-fun Unit!14047 () Unit!14043)

(assert (=> b!480028 (= e!282456 Unit!14047)))

(declare-fun b!480029 () Bool)

(assert (=> b!480029 (= e!282455 (isDefined!304 (getValueByKey!394 (toList!3953 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76747 c!57706) b!480027))

(assert (= (and d!76747 (not c!57706)) b!480028))

(assert (= (and d!76747 (not res!286331)) b!480029))

(declare-fun m!462025 () Bool)

(assert (=> d!76747 m!462025))

(declare-fun m!462027 () Bool)

(assert (=> b!480027 m!462027))

(declare-fun m!462029 () Bool)

(assert (=> b!480027 m!462029))

(assert (=> b!480027 m!462029))

(declare-fun m!462031 () Bool)

(assert (=> b!480027 m!462031))

(assert (=> b!480029 m!462029))

(assert (=> b!480029 m!462029))

(assert (=> b!480029 m!462031))

(assert (=> b!479913 d!76747))

(declare-fun b!480072 () Bool)

(declare-fun e!282489 () ListLongMap!7875)

(declare-fun call!30879 () ListLongMap!7875)

(assert (=> b!480072 (= e!282489 call!30879)))

(declare-fun b!480073 () Bool)

(declare-fun res!286355 () Bool)

(declare-fun e!282492 () Bool)

(assert (=> b!480073 (=> (not res!286355) (not e!282492))))

(declare-fun e!282485 () Bool)

(assert (=> b!480073 (= res!286355 e!282485)))

(declare-fun c!57719 () Bool)

(assert (=> b!480073 (= c!57719 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!76749 () Bool)

(assert (=> d!76749 e!282492))

(declare-fun res!286358 () Bool)

(assert (=> d!76749 (=> (not res!286358) (not e!282492))))

(assert (=> d!76749 (= res!286358 (or (bvsge #b00000000000000000000000000000000 (size!15278 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15278 _keys!1874)))))))

(declare-fun lt!218100 () ListLongMap!7875)

(declare-fun lt!218088 () ListLongMap!7875)

(assert (=> d!76749 (= lt!218100 lt!218088)))

(declare-fun lt!218086 () Unit!14043)

(declare-fun e!282494 () Unit!14043)

(assert (=> d!76749 (= lt!218086 e!282494)))

(declare-fun c!57721 () Bool)

(declare-fun e!282486 () Bool)

(assert (=> d!76749 (= c!57721 e!282486)))

(declare-fun res!286357 () Bool)

(assert (=> d!76749 (=> (not res!286357) (not e!282486))))

(assert (=> d!76749 (= res!286357 (bvslt #b00000000000000000000000000000000 (size!15278 _keys!1874)))))

(declare-fun e!282488 () ListLongMap!7875)

(assert (=> d!76749 (= lt!218088 e!282488)))

(declare-fun c!57724 () Bool)

(assert (=> d!76749 (= c!57724 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76749 (validMask!0 mask!2352)))

(assert (=> d!76749 (= (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218100)))

(declare-fun b!480074 () Bool)

(declare-fun lt!218103 () Unit!14043)

(assert (=> b!480074 (= e!282494 lt!218103)))

(declare-fun lt!218096 () ListLongMap!7875)

(declare-fun getCurrentListMapNoExtraKeys!2124 (array!31030 array!31028 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 32) Int) ListLongMap!7875)

(assert (=> b!480074 (= lt!218096 (getCurrentListMapNoExtraKeys!2124 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218098 () (_ BitVec 64))

(assert (=> b!480074 (= lt!218098 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218087 () (_ BitVec 64))

(assert (=> b!480074 (= lt!218087 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218101 () Unit!14043)

(declare-fun addStillContains!298 (ListLongMap!7875 (_ BitVec 64) V!19321 (_ BitVec 64)) Unit!14043)

(assert (=> b!480074 (= lt!218101 (addStillContains!298 lt!218096 lt!218098 zeroValue!1458 lt!218087))))

(declare-fun +!1779 (ListLongMap!7875 tuple2!8960) ListLongMap!7875)

(assert (=> b!480074 (contains!2582 (+!1779 lt!218096 (tuple2!8961 lt!218098 zeroValue!1458)) lt!218087)))

(declare-fun lt!218099 () Unit!14043)

(assert (=> b!480074 (= lt!218099 lt!218101)))

(declare-fun lt!218104 () ListLongMap!7875)

(assert (=> b!480074 (= lt!218104 (getCurrentListMapNoExtraKeys!2124 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218095 () (_ BitVec 64))

(assert (=> b!480074 (= lt!218095 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218084 () (_ BitVec 64))

(assert (=> b!480074 (= lt!218084 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218094 () Unit!14043)

(declare-fun addApplyDifferent!298 (ListLongMap!7875 (_ BitVec 64) V!19321 (_ BitVec 64)) Unit!14043)

(assert (=> b!480074 (= lt!218094 (addApplyDifferent!298 lt!218104 lt!218095 minValue!1458 lt!218084))))

(declare-fun apply!340 (ListLongMap!7875 (_ BitVec 64)) V!19321)

(assert (=> b!480074 (= (apply!340 (+!1779 lt!218104 (tuple2!8961 lt!218095 minValue!1458)) lt!218084) (apply!340 lt!218104 lt!218084))))

(declare-fun lt!218093 () Unit!14043)

(assert (=> b!480074 (= lt!218093 lt!218094)))

(declare-fun lt!218083 () ListLongMap!7875)

(assert (=> b!480074 (= lt!218083 (getCurrentListMapNoExtraKeys!2124 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218092 () (_ BitVec 64))

(assert (=> b!480074 (= lt!218092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218090 () (_ BitVec 64))

(assert (=> b!480074 (= lt!218090 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218102 () Unit!14043)

(assert (=> b!480074 (= lt!218102 (addApplyDifferent!298 lt!218083 lt!218092 zeroValue!1458 lt!218090))))

(assert (=> b!480074 (= (apply!340 (+!1779 lt!218083 (tuple2!8961 lt!218092 zeroValue!1458)) lt!218090) (apply!340 lt!218083 lt!218090))))

(declare-fun lt!218089 () Unit!14043)

(assert (=> b!480074 (= lt!218089 lt!218102)))

(declare-fun lt!218091 () ListLongMap!7875)

(assert (=> b!480074 (= lt!218091 (getCurrentListMapNoExtraKeys!2124 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218085 () (_ BitVec 64))

(assert (=> b!480074 (= lt!218085 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218097 () (_ BitVec 64))

(assert (=> b!480074 (= lt!218097 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!480074 (= lt!218103 (addApplyDifferent!298 lt!218091 lt!218085 minValue!1458 lt!218097))))

(assert (=> b!480074 (= (apply!340 (+!1779 lt!218091 (tuple2!8961 lt!218085 minValue!1458)) lt!218097) (apply!340 lt!218091 lt!218097))))

(declare-fun b!480075 () Bool)

(declare-fun e!282495 () Bool)

(declare-fun get!7244 (ValueCell!6482 V!19321) V!19321)

(declare-fun dynLambda!948 (Int (_ BitVec 64)) V!19321)

(assert (=> b!480075 (= e!282495 (= (apply!340 lt!218100 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000)) (get!7244 (select (arr!14919 _values!1516) #b00000000000000000000000000000000) (dynLambda!948 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!480075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15277 _values!1516)))))

(assert (=> b!480075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15278 _keys!1874)))))

(declare-fun b!480076 () Bool)

(declare-fun e!282484 () Bool)

(assert (=> b!480076 (= e!282484 (validKeyInArray!0 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480077 () Bool)

(declare-fun call!30880 () ListLongMap!7875)

(assert (=> b!480077 (= e!282488 (+!1779 call!30880 (tuple2!8961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!480078 () Bool)

(declare-fun e!282493 () Bool)

(assert (=> b!480078 (= e!282492 e!282493)))

(declare-fun c!57723 () Bool)

(assert (=> b!480078 (= c!57723 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!480079 () Bool)

(declare-fun res!286351 () Bool)

(assert (=> b!480079 (=> (not res!286351) (not e!282492))))

(declare-fun e!282490 () Bool)

(assert (=> b!480079 (= res!286351 e!282490)))

(declare-fun res!286350 () Bool)

(assert (=> b!480079 (=> res!286350 e!282490)))

(assert (=> b!480079 (= res!286350 (not e!282484))))

(declare-fun res!286352 () Bool)

(assert (=> b!480079 (=> (not res!286352) (not e!282484))))

(assert (=> b!480079 (= res!286352 (bvslt #b00000000000000000000000000000000 (size!15278 _keys!1874)))))

(declare-fun b!480080 () Bool)

(declare-fun call!30882 () ListLongMap!7875)

(assert (=> b!480080 (= e!282489 call!30882)))

(declare-fun bm!30875 () Bool)

(declare-fun call!30881 () ListLongMap!7875)

(assert (=> bm!30875 (= call!30879 call!30881)))

(declare-fun b!480081 () Bool)

(assert (=> b!480081 (= e!282486 (validKeyInArray!0 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480082 () Bool)

(declare-fun call!30884 () Bool)

(assert (=> b!480082 (= e!282485 (not call!30884))))

(declare-fun b!480083 () Bool)

(declare-fun e!282491 () Bool)

(assert (=> b!480083 (= e!282491 (= (apply!340 lt!218100 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!480084 () Bool)

(declare-fun e!282483 () Bool)

(assert (=> b!480084 (= e!282485 e!282483)))

(declare-fun res!286353 () Bool)

(assert (=> b!480084 (= res!286353 call!30884)))

(assert (=> b!480084 (=> (not res!286353) (not e!282483))))

(declare-fun b!480085 () Bool)

(assert (=> b!480085 (= e!282493 e!282491)))

(declare-fun res!286354 () Bool)

(declare-fun call!30883 () Bool)

(assert (=> b!480085 (= res!286354 call!30883)))

(assert (=> b!480085 (=> (not res!286354) (not e!282491))))

(declare-fun bm!30876 () Bool)

(assert (=> bm!30876 (= call!30884 (contains!2582 lt!218100 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!480086 () Bool)

(declare-fun c!57720 () Bool)

(assert (=> b!480086 (= c!57720 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!282487 () ListLongMap!7875)

(assert (=> b!480086 (= e!282487 e!282489)))

(declare-fun bm!30877 () Bool)

(assert (=> bm!30877 (= call!30882 call!30880)))

(declare-fun b!480087 () Bool)

(assert (=> b!480087 (= e!282493 (not call!30883))))

(declare-fun b!480088 () Bool)

(assert (=> b!480088 (= e!282490 e!282495)))

(declare-fun res!286356 () Bool)

(assert (=> b!480088 (=> (not res!286356) (not e!282495))))

(assert (=> b!480088 (= res!286356 (contains!2582 lt!218100 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!480088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15278 _keys!1874)))))

(declare-fun b!480089 () Bool)

(assert (=> b!480089 (= e!282488 e!282487)))

(declare-fun c!57722 () Bool)

(assert (=> b!480089 (= c!57722 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!480090 () Bool)

(assert (=> b!480090 (= e!282483 (= (apply!340 lt!218100 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun bm!30878 () Bool)

(declare-fun call!30878 () ListLongMap!7875)

(assert (=> bm!30878 (= call!30881 call!30878)))

(declare-fun bm!30879 () Bool)

(assert (=> bm!30879 (= call!30880 (+!1779 (ite c!57724 call!30878 (ite c!57722 call!30881 call!30879)) (ite (or c!57724 c!57722) (tuple2!8961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!8961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!480091 () Bool)

(assert (=> b!480091 (= e!282487 call!30882)))

(declare-fun b!480092 () Bool)

(declare-fun Unit!14048 () Unit!14043)

(assert (=> b!480092 (= e!282494 Unit!14048)))

(declare-fun bm!30880 () Bool)

(assert (=> bm!30880 (= call!30883 (contains!2582 lt!218100 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30881 () Bool)

(assert (=> bm!30881 (= call!30878 (getCurrentListMapNoExtraKeys!2124 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(assert (= (and d!76749 c!57724) b!480077))

(assert (= (and d!76749 (not c!57724)) b!480089))

(assert (= (and b!480089 c!57722) b!480091))

(assert (= (and b!480089 (not c!57722)) b!480086))

(assert (= (and b!480086 c!57720) b!480080))

(assert (= (and b!480086 (not c!57720)) b!480072))

(assert (= (or b!480080 b!480072) bm!30875))

(assert (= (or b!480091 bm!30875) bm!30878))

(assert (= (or b!480091 b!480080) bm!30877))

(assert (= (or b!480077 bm!30878) bm!30881))

(assert (= (or b!480077 bm!30877) bm!30879))

(assert (= (and d!76749 res!286357) b!480081))

(assert (= (and d!76749 c!57721) b!480074))

(assert (= (and d!76749 (not c!57721)) b!480092))

(assert (= (and d!76749 res!286358) b!480079))

(assert (= (and b!480079 res!286352) b!480076))

(assert (= (and b!480079 (not res!286350)) b!480088))

(assert (= (and b!480088 res!286356) b!480075))

(assert (= (and b!480079 res!286351) b!480073))

(assert (= (and b!480073 c!57719) b!480084))

(assert (= (and b!480073 (not c!57719)) b!480082))

(assert (= (and b!480084 res!286353) b!480090))

(assert (= (or b!480084 b!480082) bm!30876))

(assert (= (and b!480073 res!286355) b!480078))

(assert (= (and b!480078 c!57723) b!480085))

(assert (= (and b!480078 (not c!57723)) b!480087))

(assert (= (and b!480085 res!286354) b!480083))

(assert (= (or b!480085 b!480087) bm!30880))

(declare-fun b_lambda!10809 () Bool)

(assert (=> (not b_lambda!10809) (not b!480075)))

(declare-fun t!15237 () Bool)

(declare-fun tb!4153 () Bool)

(assert (=> (and start!43314 (= defaultEntry!1519 defaultEntry!1519) t!15237) tb!4153))

(declare-fun result!7743 () Bool)

(assert (=> tb!4153 (= result!7743 tp_is_empty!13687)))

(assert (=> b!480075 t!15237))

(declare-fun b_and!20945 () Bool)

(assert (= b_and!20939 (and (=> t!15237 result!7743) b_and!20945)))

(declare-fun m!462033 () Bool)

(assert (=> bm!30876 m!462033))

(declare-fun m!462035 () Bool)

(assert (=> b!480077 m!462035))

(declare-fun m!462037 () Bool)

(assert (=> b!480074 m!462037))

(declare-fun m!462039 () Bool)

(assert (=> b!480074 m!462039))

(declare-fun m!462041 () Bool)

(assert (=> b!480074 m!462041))

(declare-fun m!462043 () Bool)

(assert (=> b!480074 m!462043))

(declare-fun m!462045 () Bool)

(assert (=> b!480074 m!462045))

(declare-fun m!462047 () Bool)

(assert (=> b!480074 m!462047))

(declare-fun m!462049 () Bool)

(assert (=> b!480074 m!462049))

(declare-fun m!462051 () Bool)

(assert (=> b!480074 m!462051))

(declare-fun m!462053 () Bool)

(assert (=> b!480074 m!462053))

(declare-fun m!462055 () Bool)

(assert (=> b!480074 m!462055))

(declare-fun m!462057 () Bool)

(assert (=> b!480074 m!462057))

(assert (=> b!480074 m!462015))

(declare-fun m!462059 () Bool)

(assert (=> b!480074 m!462059))

(assert (=> b!480074 m!462043))

(declare-fun m!462061 () Bool)

(assert (=> b!480074 m!462061))

(assert (=> b!480074 m!462049))

(declare-fun m!462063 () Bool)

(assert (=> b!480074 m!462063))

(declare-fun m!462065 () Bool)

(assert (=> b!480074 m!462065))

(assert (=> b!480074 m!462039))

(assert (=> b!480074 m!462053))

(declare-fun m!462067 () Bool)

(assert (=> b!480074 m!462067))

(declare-fun m!462069 () Bool)

(assert (=> b!480090 m!462069))

(declare-fun m!462071 () Bool)

(assert (=> bm!30879 m!462071))

(assert (=> b!480081 m!462015))

(assert (=> b!480081 m!462015))

(assert (=> b!480081 m!462021))

(assert (=> b!480076 m!462015))

(assert (=> b!480076 m!462015))

(assert (=> b!480076 m!462021))

(assert (=> b!480088 m!462015))

(assert (=> b!480088 m!462015))

(declare-fun m!462073 () Bool)

(assert (=> b!480088 m!462073))

(assert (=> b!480075 m!462015))

(declare-fun m!462075 () Bool)

(assert (=> b!480075 m!462075))

(declare-fun m!462077 () Bool)

(assert (=> b!480075 m!462077))

(declare-fun m!462079 () Bool)

(assert (=> b!480075 m!462079))

(assert (=> b!480075 m!462079))

(assert (=> b!480075 m!462077))

(declare-fun m!462081 () Bool)

(assert (=> b!480075 m!462081))

(assert (=> b!480075 m!462015))

(assert (=> bm!30881 m!462055))

(declare-fun m!462083 () Bool)

(assert (=> b!480083 m!462083))

(assert (=> d!76749 m!461961))

(declare-fun m!462085 () Bool)

(assert (=> bm!30880 m!462085))

(assert (=> b!479913 d!76749))

(declare-fun b!480103 () Bool)

(declare-fun e!282503 () Bool)

(declare-fun e!282504 () Bool)

(assert (=> b!480103 (= e!282503 e!282504)))

(declare-fun lt!218112 () (_ BitVec 64))

(assert (=> b!480103 (= lt!218112 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218111 () Unit!14043)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31030 (_ BitVec 64) (_ BitVec 32)) Unit!14043)

(assert (=> b!480103 (= lt!218111 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218112 #b00000000000000000000000000000000))))

(assert (=> b!480103 (arrayContainsKey!0 _keys!1874 lt!218112 #b00000000000000000000000000000000)))

(declare-fun lt!218113 () Unit!14043)

(assert (=> b!480103 (= lt!218113 lt!218111)))

(declare-fun res!286364 () Bool)

(declare-datatypes ((SeekEntryResult!3518 0))(
  ( (MissingZero!3518 (index!16251 (_ BitVec 32))) (Found!3518 (index!16252 (_ BitVec 32))) (Intermediate!3518 (undefined!4330 Bool) (index!16253 (_ BitVec 32)) (x!45047 (_ BitVec 32))) (Undefined!3518) (MissingVacant!3518 (index!16254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31030 (_ BitVec 32)) SeekEntryResult!3518)

(assert (=> b!480103 (= res!286364 (= (seekEntryOrOpen!0 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3518 #b00000000000000000000000000000000)))))

(assert (=> b!480103 (=> (not res!286364) (not e!282504))))

(declare-fun b!480104 () Bool)

(declare-fun call!30887 () Bool)

(assert (=> b!480104 (= e!282503 call!30887)))

(declare-fun d!76751 () Bool)

(declare-fun res!286363 () Bool)

(declare-fun e!282502 () Bool)

(assert (=> d!76751 (=> res!286363 e!282502)))

(assert (=> d!76751 (= res!286363 (bvsge #b00000000000000000000000000000000 (size!15278 _keys!1874)))))

(assert (=> d!76751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!282502)))

(declare-fun b!480105 () Bool)

(assert (=> b!480105 (= e!282502 e!282503)))

(declare-fun c!57727 () Bool)

(assert (=> b!480105 (= c!57727 (validKeyInArray!0 (select (arr!14920 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30884 () Bool)

(assert (=> bm!30884 (= call!30887 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!480106 () Bool)

(assert (=> b!480106 (= e!282504 call!30887)))

(assert (= (and d!76751 (not res!286363)) b!480105))

(assert (= (and b!480105 c!57727) b!480103))

(assert (= (and b!480105 (not c!57727)) b!480104))

(assert (= (and b!480103 res!286364) b!480106))

(assert (= (or b!480106 b!480104) bm!30884))

(assert (=> b!480103 m!462015))

(declare-fun m!462087 () Bool)

(assert (=> b!480103 m!462087))

(declare-fun m!462089 () Bool)

(assert (=> b!480103 m!462089))

(assert (=> b!480103 m!462015))

(declare-fun m!462091 () Bool)

(assert (=> b!480103 m!462091))

(assert (=> b!480105 m!462015))

(assert (=> b!480105 m!462015))

(assert (=> b!480105 m!462021))

(declare-fun m!462093 () Bool)

(assert (=> bm!30884 m!462093))

(assert (=> b!479914 d!76751))

(assert (=> b!479919 d!76739))

(declare-fun mapNonEmpty!22240 () Bool)

(declare-fun mapRes!22240 () Bool)

(declare-fun tp!42814 () Bool)

(declare-fun e!282509 () Bool)

(assert (=> mapNonEmpty!22240 (= mapRes!22240 (and tp!42814 e!282509))))

(declare-fun mapRest!22240 () (Array (_ BitVec 32) ValueCell!6482))

(declare-fun mapValue!22240 () ValueCell!6482)

(declare-fun mapKey!22240 () (_ BitVec 32))

(assert (=> mapNonEmpty!22240 (= mapRest!22231 (store mapRest!22240 mapKey!22240 mapValue!22240))))

(declare-fun b!480114 () Bool)

(declare-fun e!282510 () Bool)

(assert (=> b!480114 (= e!282510 tp_is_empty!13687)))

(declare-fun condMapEmpty!22240 () Bool)

(declare-fun mapDefault!22240 () ValueCell!6482)

(assert (=> mapNonEmpty!22231 (= condMapEmpty!22240 (= mapRest!22231 ((as const (Array (_ BitVec 32) ValueCell!6482)) mapDefault!22240)))))

(assert (=> mapNonEmpty!22231 (= tp!42798 (and e!282510 mapRes!22240))))

(declare-fun b!480113 () Bool)

(assert (=> b!480113 (= e!282509 tp_is_empty!13687)))

(declare-fun mapIsEmpty!22240 () Bool)

(assert (=> mapIsEmpty!22240 mapRes!22240))

(assert (= (and mapNonEmpty!22231 condMapEmpty!22240) mapIsEmpty!22240))

(assert (= (and mapNonEmpty!22231 (not condMapEmpty!22240)) mapNonEmpty!22240))

(assert (= (and mapNonEmpty!22240 ((_ is ValueCellFull!6482) mapValue!22240)) b!480113))

(assert (= (and mapNonEmpty!22231 ((_ is ValueCellFull!6482) mapDefault!22240)) b!480114))

(declare-fun m!462095 () Bool)

(assert (=> mapNonEmpty!22240 m!462095))

(declare-fun b_lambda!10811 () Bool)

(assert (= b_lambda!10809 (or (and start!43314 b_free!12175) b_lambda!10811)))

(check-sat (not b!480011) (not bm!30879) (not b!480075) (not b!480076) (not b!480083) (not b_lambda!10811) (not b!480027) (not d!76733) (not b!480081) (not b!480012) (not b_next!12175) (not b!480020) (not bm!30881) (not b!480103) (not b!480105) (not bm!30860) (not d!76747) (not bm!30884) (not b!480088) (not d!76749) (not b!480029) b_and!20945 (not b!480090) (not b!480074) (not b!479998) (not mapNonEmpty!22240) (not bm!30876) (not b!480077) (not b!480014) (not bm!30880) tp_is_empty!13687)
(check-sat b_and!20945 (not b_next!12175))
