; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20930 () Bool)

(assert start!20930)

(declare-fun b_free!5539 () Bool)

(declare-fun b_next!5539 () Bool)

(assert (=> start!20930 (= b_free!5539 (not b_next!5539))))

(declare-fun tp!19663 () Bool)

(declare-fun b_and!12283 () Bool)

(assert (=> start!20930 (= tp!19663 b_and!12283)))

(declare-fun b!210025 () Bool)

(declare-fun e!136780 () Bool)

(declare-fun tp_is_empty!5401 () Bool)

(assert (=> b!210025 (= e!136780 tp_is_empty!5401)))

(declare-fun b!210026 () Bool)

(declare-fun res!102425 () Bool)

(declare-fun e!136778 () Bool)

(assert (=> b!210026 (=> (not res!102425) (not e!136778))))

(declare-datatypes ((array!9989 0))(
  ( (array!9990 (arr!4742 (Array (_ BitVec 32) (_ BitVec 64))) (size!5068 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9989)

(declare-datatypes ((List!3034 0))(
  ( (Nil!3031) (Cons!3030 (h!3672 (_ BitVec 64)) (t!7960 List!3034)) )
))
(declare-fun arrayNoDuplicates!0 (array!9989 (_ BitVec 32) List!3034) Bool)

(assert (=> b!210026 (= res!102425 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3031))))

(declare-fun mapNonEmpty!9176 () Bool)

(declare-fun mapRes!9176 () Bool)

(declare-fun tp!19664 () Bool)

(assert (=> mapNonEmpty!9176 (= mapRes!9176 (and tp!19664 e!136780))))

(declare-fun mapKey!9176 () (_ BitVec 32))

(declare-datatypes ((V!6849 0))(
  ( (V!6850 (val!2745 Int)) )
))
(declare-datatypes ((ValueCell!2357 0))(
  ( (ValueCellFull!2357 (v!4717 V!6849)) (EmptyCell!2357) )
))
(declare-fun mapRest!9176 () (Array (_ BitVec 32) ValueCell!2357))

(declare-fun mapValue!9176 () ValueCell!2357)

(declare-datatypes ((array!9991 0))(
  ( (array!9992 (arr!4743 (Array (_ BitVec 32) ValueCell!2357)) (size!5069 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9991)

(assert (=> mapNonEmpty!9176 (= (arr!4743 _values!649) (store mapRest!9176 mapKey!9176 mapValue!9176))))

(declare-fun res!102431 () Bool)

(assert (=> start!20930 (=> (not res!102431) (not e!136778))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20930 (= res!102431 (validMask!0 mask!1149))))

(assert (=> start!20930 e!136778))

(declare-fun e!136782 () Bool)

(declare-fun array_inv!3113 (array!9991) Bool)

(assert (=> start!20930 (and (array_inv!3113 _values!649) e!136782)))

(assert (=> start!20930 true))

(assert (=> start!20930 tp_is_empty!5401))

(declare-fun array_inv!3114 (array!9989) Bool)

(assert (=> start!20930 (array_inv!3114 _keys!825)))

(assert (=> start!20930 tp!19663))

(declare-fun b!210027 () Bool)

(declare-fun e!136779 () Bool)

(assert (=> b!210027 (= e!136779 tp_is_empty!5401)))

(declare-fun mapIsEmpty!9176 () Bool)

(assert (=> mapIsEmpty!9176 mapRes!9176))

(declare-fun b!210028 () Bool)

(assert (=> b!210028 (= e!136782 (and e!136779 mapRes!9176))))

(declare-fun condMapEmpty!9176 () Bool)

(declare-fun mapDefault!9176 () ValueCell!2357)

(assert (=> b!210028 (= condMapEmpty!9176 (= (arr!4743 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2357)) mapDefault!9176)))))

(declare-fun b!210029 () Bool)

(declare-fun e!136783 () Bool)

(assert (=> b!210029 (= e!136778 (not e!136783))))

(declare-fun res!102432 () Bool)

(assert (=> b!210029 (=> res!102432 e!136783)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210029 (= res!102432 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4126 0))(
  ( (tuple2!4127 (_1!2074 (_ BitVec 64)) (_2!2074 V!6849)) )
))
(declare-datatypes ((List!3035 0))(
  ( (Nil!3032) (Cons!3031 (h!3673 tuple2!4126) (t!7961 List!3035)) )
))
(declare-datatypes ((ListLongMap!3029 0))(
  ( (ListLongMap!3030 (toList!1530 List!3035)) )
))
(declare-fun lt!107396 () ListLongMap!3029)

(declare-fun zeroValue!615 () V!6849)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6849)

(declare-fun getCurrentListMap!1042 (array!9989 array!9991 (_ BitVec 32) (_ BitVec 32) V!6849 V!6849 (_ BitVec 32) Int) ListLongMap!3029)

(assert (=> b!210029 (= lt!107396 (getCurrentListMap!1042 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107400 () array!9991)

(declare-fun lt!107392 () ListLongMap!3029)

(assert (=> b!210029 (= lt!107392 (getCurrentListMap!1042 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107393 () ListLongMap!3029)

(declare-fun lt!107395 () ListLongMap!3029)

(assert (=> b!210029 (and (= lt!107393 lt!107395) (= lt!107395 lt!107393))))

(declare-fun lt!107398 () ListLongMap!3029)

(declare-fun v!520 () V!6849)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!554 (ListLongMap!3029 tuple2!4126) ListLongMap!3029)

(assert (=> b!210029 (= lt!107395 (+!554 lt!107398 (tuple2!4127 k0!843 v!520)))))

(declare-datatypes ((Unit!6348 0))(
  ( (Unit!6349) )
))
(declare-fun lt!107399 () Unit!6348)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!203 (array!9989 array!9991 (_ BitVec 32) (_ BitVec 32) V!6849 V!6849 (_ BitVec 32) (_ BitVec 64) V!6849 (_ BitVec 32) Int) Unit!6348)

(assert (=> b!210029 (= lt!107399 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!203 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!479 (array!9989 array!9991 (_ BitVec 32) (_ BitVec 32) V!6849 V!6849 (_ BitVec 32) Int) ListLongMap!3029)

(assert (=> b!210029 (= lt!107393 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210029 (= lt!107400 (array!9992 (store (arr!4743 _values!649) i!601 (ValueCellFull!2357 v!520)) (size!5069 _values!649)))))

(assert (=> b!210029 (= lt!107398 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210030 () Bool)

(declare-fun res!102429 () Bool)

(assert (=> b!210030 (=> (not res!102429) (not e!136778))))

(assert (=> b!210030 (= res!102429 (= (select (arr!4742 _keys!825) i!601) k0!843))))

(declare-fun b!210031 () Bool)

(declare-fun res!102424 () Bool)

(assert (=> b!210031 (=> (not res!102424) (not e!136778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210031 (= res!102424 (validKeyInArray!0 k0!843))))

(declare-fun b!210032 () Bool)

(declare-fun res!102427 () Bool)

(declare-fun e!136781 () Bool)

(assert (=> b!210032 (=> (not res!102427) (not e!136781))))

(declare-fun lt!107397 () tuple2!4126)

(declare-fun lt!107394 () tuple2!4126)

(assert (=> b!210032 (= res!102427 (= lt!107396 (+!554 (+!554 lt!107398 lt!107397) lt!107394)))))

(declare-fun b!210033 () Bool)

(assert (=> b!210033 (= e!136781 (= lt!107392 (+!554 (+!554 lt!107395 lt!107397) lt!107394)))))

(declare-fun b!210034 () Bool)

(declare-fun res!102433 () Bool)

(assert (=> b!210034 (=> (not res!102433) (not e!136778))))

(assert (=> b!210034 (= res!102433 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5068 _keys!825))))))

(declare-fun b!210035 () Bool)

(declare-fun res!102428 () Bool)

(assert (=> b!210035 (=> (not res!102428) (not e!136778))))

(assert (=> b!210035 (= res!102428 (and (= (size!5069 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5068 _keys!825) (size!5069 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210036 () Bool)

(declare-fun res!102426 () Bool)

(assert (=> b!210036 (=> (not res!102426) (not e!136778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9989 (_ BitVec 32)) Bool)

(assert (=> b!210036 (= res!102426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210037 () Bool)

(assert (=> b!210037 (= e!136783 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210037 e!136781))

(declare-fun res!102430 () Bool)

(assert (=> b!210037 (=> (not res!102430) (not e!136781))))

(assert (=> b!210037 (= res!102430 (= lt!107392 (+!554 (+!554 lt!107393 lt!107397) lt!107394)))))

(assert (=> b!210037 (= lt!107394 (tuple2!4127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210037 (= lt!107397 (tuple2!4127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20930 res!102431) b!210035))

(assert (= (and b!210035 res!102428) b!210036))

(assert (= (and b!210036 res!102426) b!210026))

(assert (= (and b!210026 res!102425) b!210034))

(assert (= (and b!210034 res!102433) b!210031))

(assert (= (and b!210031 res!102424) b!210030))

(assert (= (and b!210030 res!102429) b!210029))

(assert (= (and b!210029 (not res!102432)) b!210037))

(assert (= (and b!210037 res!102430) b!210032))

(assert (= (and b!210032 res!102427) b!210033))

(assert (= (and b!210028 condMapEmpty!9176) mapIsEmpty!9176))

(assert (= (and b!210028 (not condMapEmpty!9176)) mapNonEmpty!9176))

(get-info :version)

(assert (= (and mapNonEmpty!9176 ((_ is ValueCellFull!2357) mapValue!9176)) b!210025))

(assert (= (and b!210028 ((_ is ValueCellFull!2357) mapDefault!9176)) b!210027))

(assert (= start!20930 b!210028))

(declare-fun m!237011 () Bool)

(assert (=> b!210030 m!237011))

(declare-fun m!237013 () Bool)

(assert (=> b!210033 m!237013))

(assert (=> b!210033 m!237013))

(declare-fun m!237015 () Bool)

(assert (=> b!210033 m!237015))

(declare-fun m!237017 () Bool)

(assert (=> b!210032 m!237017))

(assert (=> b!210032 m!237017))

(declare-fun m!237019 () Bool)

(assert (=> b!210032 m!237019))

(declare-fun m!237021 () Bool)

(assert (=> b!210029 m!237021))

(declare-fun m!237023 () Bool)

(assert (=> b!210029 m!237023))

(declare-fun m!237025 () Bool)

(assert (=> b!210029 m!237025))

(declare-fun m!237027 () Bool)

(assert (=> b!210029 m!237027))

(declare-fun m!237029 () Bool)

(assert (=> b!210029 m!237029))

(declare-fun m!237031 () Bool)

(assert (=> b!210029 m!237031))

(declare-fun m!237033 () Bool)

(assert (=> b!210029 m!237033))

(declare-fun m!237035 () Bool)

(assert (=> b!210026 m!237035))

(declare-fun m!237037 () Bool)

(assert (=> b!210031 m!237037))

(declare-fun m!237039 () Bool)

(assert (=> b!210036 m!237039))

(declare-fun m!237041 () Bool)

(assert (=> start!20930 m!237041))

(declare-fun m!237043 () Bool)

(assert (=> start!20930 m!237043))

(declare-fun m!237045 () Bool)

(assert (=> start!20930 m!237045))

(declare-fun m!237047 () Bool)

(assert (=> mapNonEmpty!9176 m!237047))

(declare-fun m!237049 () Bool)

(assert (=> b!210037 m!237049))

(assert (=> b!210037 m!237049))

(declare-fun m!237051 () Bool)

(assert (=> b!210037 m!237051))

(check-sat (not b!210037) (not start!20930) (not b_next!5539) (not b!210029) (not b!210031) (not b!210026) (not b!210036) (not b!210032) (not mapNonEmpty!9176) b_and!12283 tp_is_empty!5401 (not b!210033))
(check-sat b_and!12283 (not b_next!5539))
(get-model)

(declare-fun bm!19840 () Bool)

(declare-fun call!19843 () Bool)

(assert (=> bm!19840 (= call!19843 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!210124 () Bool)

(declare-fun e!136834 () Bool)

(declare-fun e!136833 () Bool)

(assert (=> b!210124 (= e!136834 e!136833)))

(declare-fun c!35510 () Bool)

(assert (=> b!210124 (= c!35510 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210125 () Bool)

(assert (=> b!210125 (= e!136833 call!19843)))

(declare-fun b!210126 () Bool)

(declare-fun e!136832 () Bool)

(assert (=> b!210126 (= e!136833 e!136832)))

(declare-fun lt!107462 () (_ BitVec 64))

(assert (=> b!210126 (= lt!107462 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107461 () Unit!6348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9989 (_ BitVec 64) (_ BitVec 32)) Unit!6348)

(assert (=> b!210126 (= lt!107461 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107462 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!9989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!210126 (arrayContainsKey!0 _keys!825 lt!107462 #b00000000000000000000000000000000)))

(declare-fun lt!107463 () Unit!6348)

(assert (=> b!210126 (= lt!107463 lt!107461)))

(declare-fun res!102499 () Bool)

(declare-datatypes ((SeekEntryResult!707 0))(
  ( (MissingZero!707 (index!4998 (_ BitVec 32))) (Found!707 (index!4999 (_ BitVec 32))) (Intermediate!707 (undefined!1519 Bool) (index!5000 (_ BitVec 32)) (x!22022 (_ BitVec 32))) (Undefined!707) (MissingVacant!707 (index!5001 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9989 (_ BitVec 32)) SeekEntryResult!707)

(assert (=> b!210126 (= res!102499 (= (seekEntryOrOpen!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!707 #b00000000000000000000000000000000)))))

(assert (=> b!210126 (=> (not res!102499) (not e!136832))))

(declare-fun d!57779 () Bool)

(declare-fun res!102498 () Bool)

(assert (=> d!57779 (=> res!102498 e!136834)))

(assert (=> d!57779 (= res!102498 (bvsge #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> d!57779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136834)))

(declare-fun b!210127 () Bool)

(assert (=> b!210127 (= e!136832 call!19843)))

(assert (= (and d!57779 (not res!102498)) b!210124))

(assert (= (and b!210124 c!35510) b!210126))

(assert (= (and b!210124 (not c!35510)) b!210125))

(assert (= (and b!210126 res!102499) b!210127))

(assert (= (or b!210127 b!210125) bm!19840))

(declare-fun m!237137 () Bool)

(assert (=> bm!19840 m!237137))

(declare-fun m!237139 () Bool)

(assert (=> b!210124 m!237139))

(assert (=> b!210124 m!237139))

(declare-fun m!237141 () Bool)

(assert (=> b!210124 m!237141))

(assert (=> b!210126 m!237139))

(declare-fun m!237143 () Bool)

(assert (=> b!210126 m!237143))

(declare-fun m!237145 () Bool)

(assert (=> b!210126 m!237145))

(assert (=> b!210126 m!237139))

(declare-fun m!237147 () Bool)

(assert (=> b!210126 m!237147))

(assert (=> b!210036 d!57779))

(declare-fun d!57781 () Bool)

(assert (=> d!57781 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210031 d!57781))

(declare-fun d!57783 () Bool)

(declare-fun e!136837 () Bool)

(assert (=> d!57783 e!136837))

(declare-fun res!102504 () Bool)

(assert (=> d!57783 (=> (not res!102504) (not e!136837))))

(declare-fun lt!107473 () ListLongMap!3029)

(declare-fun contains!1373 (ListLongMap!3029 (_ BitVec 64)) Bool)

(assert (=> d!57783 (= res!102504 (contains!1373 lt!107473 (_1!2074 (tuple2!4127 k0!843 v!520))))))

(declare-fun lt!107475 () List!3035)

(assert (=> d!57783 (= lt!107473 (ListLongMap!3030 lt!107475))))

(declare-fun lt!107474 () Unit!6348)

(declare-fun lt!107472 () Unit!6348)

(assert (=> d!57783 (= lt!107474 lt!107472)))

(declare-datatypes ((Option!253 0))(
  ( (Some!252 (v!4723 V!6849)) (None!251) )
))
(declare-fun getValueByKey!247 (List!3035 (_ BitVec 64)) Option!253)

(assert (=> d!57783 (= (getValueByKey!247 lt!107475 (_1!2074 (tuple2!4127 k0!843 v!520))) (Some!252 (_2!2074 (tuple2!4127 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!137 (List!3035 (_ BitVec 64) V!6849) Unit!6348)

(assert (=> d!57783 (= lt!107472 (lemmaContainsTupThenGetReturnValue!137 lt!107475 (_1!2074 (tuple2!4127 k0!843 v!520)) (_2!2074 (tuple2!4127 k0!843 v!520))))))

(declare-fun insertStrictlySorted!140 (List!3035 (_ BitVec 64) V!6849) List!3035)

(assert (=> d!57783 (= lt!107475 (insertStrictlySorted!140 (toList!1530 lt!107398) (_1!2074 (tuple2!4127 k0!843 v!520)) (_2!2074 (tuple2!4127 k0!843 v!520))))))

(assert (=> d!57783 (= (+!554 lt!107398 (tuple2!4127 k0!843 v!520)) lt!107473)))

(declare-fun b!210132 () Bool)

(declare-fun res!102505 () Bool)

(assert (=> b!210132 (=> (not res!102505) (not e!136837))))

(assert (=> b!210132 (= res!102505 (= (getValueByKey!247 (toList!1530 lt!107473) (_1!2074 (tuple2!4127 k0!843 v!520))) (Some!252 (_2!2074 (tuple2!4127 k0!843 v!520)))))))

(declare-fun b!210133 () Bool)

(declare-fun contains!1374 (List!3035 tuple2!4126) Bool)

(assert (=> b!210133 (= e!136837 (contains!1374 (toList!1530 lt!107473) (tuple2!4127 k0!843 v!520)))))

(assert (= (and d!57783 res!102504) b!210132))

(assert (= (and b!210132 res!102505) b!210133))

(declare-fun m!237149 () Bool)

(assert (=> d!57783 m!237149))

(declare-fun m!237151 () Bool)

(assert (=> d!57783 m!237151))

(declare-fun m!237153 () Bool)

(assert (=> d!57783 m!237153))

(declare-fun m!237155 () Bool)

(assert (=> d!57783 m!237155))

(declare-fun m!237157 () Bool)

(assert (=> b!210132 m!237157))

(declare-fun m!237159 () Bool)

(assert (=> b!210133 m!237159))

(assert (=> b!210029 d!57783))

(declare-fun b!210158 () Bool)

(declare-fun e!136852 () ListLongMap!3029)

(declare-fun e!136854 () ListLongMap!3029)

(assert (=> b!210158 (= e!136852 e!136854)))

(declare-fun c!35520 () Bool)

(assert (=> b!210158 (= c!35520 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210159 () Bool)

(declare-fun lt!107493 () Unit!6348)

(declare-fun lt!107491 () Unit!6348)

(assert (=> b!210159 (= lt!107493 lt!107491)))

(declare-fun lt!107494 () (_ BitVec 64))

(declare-fun lt!107490 () ListLongMap!3029)

(declare-fun lt!107495 () V!6849)

(declare-fun lt!107496 () (_ BitVec 64))

(assert (=> b!210159 (not (contains!1373 (+!554 lt!107490 (tuple2!4127 lt!107496 lt!107495)) lt!107494))))

(declare-fun addStillNotContains!101 (ListLongMap!3029 (_ BitVec 64) V!6849 (_ BitVec 64)) Unit!6348)

(assert (=> b!210159 (= lt!107491 (addStillNotContains!101 lt!107490 lt!107496 lt!107495 lt!107494))))

(assert (=> b!210159 (= lt!107494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2541 (ValueCell!2357 V!6849) V!6849)

(declare-fun dynLambda!525 (Int (_ BitVec 64)) V!6849)

(assert (=> b!210159 (= lt!107495 (get!2541 (select (arr!4743 _values!649) #b00000000000000000000000000000000) (dynLambda!525 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210159 (= lt!107496 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19846 () ListLongMap!3029)

(assert (=> b!210159 (= lt!107490 call!19846)))

(assert (=> b!210159 (= e!136854 (+!554 call!19846 (tuple2!4127 (select (arr!4742 _keys!825) #b00000000000000000000000000000000) (get!2541 (select (arr!4743 _values!649) #b00000000000000000000000000000000) (dynLambda!525 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!19843 () Bool)

(assert (=> bm!19843 (= call!19846 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210161 () Bool)

(declare-fun e!136856 () Bool)

(declare-fun lt!107492 () ListLongMap!3029)

(declare-fun isEmpty!496 (ListLongMap!3029) Bool)

(assert (=> b!210161 (= e!136856 (isEmpty!496 lt!107492))))

(declare-fun b!210162 () Bool)

(assert (=> b!210162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> b!210162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5069 _values!649)))))

(declare-fun e!136857 () Bool)

(declare-fun apply!191 (ListLongMap!3029 (_ BitVec 64)) V!6849)

(assert (=> b!210162 (= e!136857 (= (apply!191 lt!107492 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)) (get!2541 (select (arr!4743 _values!649) #b00000000000000000000000000000000) (dynLambda!525 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210163 () Bool)

(assert (=> b!210163 (= e!136852 (ListLongMap!3030 Nil!3032))))

(declare-fun b!210164 () Bool)

(assert (=> b!210164 (= e!136854 call!19846)))

(declare-fun b!210165 () Bool)

(declare-fun e!136858 () Bool)

(assert (=> b!210165 (= e!136858 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210165 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210166 () Bool)

(declare-fun e!136855 () Bool)

(assert (=> b!210166 (= e!136855 e!136856)))

(declare-fun c!35521 () Bool)

(assert (=> b!210166 (= c!35521 (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun b!210167 () Bool)

(declare-fun e!136853 () Bool)

(assert (=> b!210167 (= e!136853 e!136855)))

(declare-fun c!35522 () Bool)

(assert (=> b!210167 (= c!35522 e!136858)))

(declare-fun res!102515 () Bool)

(assert (=> b!210167 (=> (not res!102515) (not e!136858))))

(assert (=> b!210167 (= res!102515 (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun b!210160 () Bool)

(assert (=> b!210160 (= e!136855 e!136857)))

(assert (=> b!210160 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun res!102514 () Bool)

(assert (=> b!210160 (= res!102514 (contains!1373 lt!107492 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210160 (=> (not res!102514) (not e!136857))))

(declare-fun d!57785 () Bool)

(assert (=> d!57785 e!136853))

(declare-fun res!102517 () Bool)

(assert (=> d!57785 (=> (not res!102517) (not e!136853))))

(assert (=> d!57785 (= res!102517 (not (contains!1373 lt!107492 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57785 (= lt!107492 e!136852)))

(declare-fun c!35519 () Bool)

(assert (=> d!57785 (= c!35519 (bvsge #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> d!57785 (validMask!0 mask!1149)))

(assert (=> d!57785 (= (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107492)))

(declare-fun b!210168 () Bool)

(declare-fun res!102516 () Bool)

(assert (=> b!210168 (=> (not res!102516) (not e!136853))))

(assert (=> b!210168 (= res!102516 (not (contains!1373 lt!107492 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!210169 () Bool)

(assert (=> b!210169 (= e!136856 (= lt!107492 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(assert (= (and d!57785 c!35519) b!210163))

(assert (= (and d!57785 (not c!35519)) b!210158))

(assert (= (and b!210158 c!35520) b!210159))

(assert (= (and b!210158 (not c!35520)) b!210164))

(assert (= (or b!210159 b!210164) bm!19843))

(assert (= (and d!57785 res!102517) b!210168))

(assert (= (and b!210168 res!102516) b!210167))

(assert (= (and b!210167 res!102515) b!210165))

(assert (= (and b!210167 c!35522) b!210160))

(assert (= (and b!210167 (not c!35522)) b!210166))

(assert (= (and b!210160 res!102514) b!210162))

(assert (= (and b!210166 c!35521) b!210169))

(assert (= (and b!210166 (not c!35521)) b!210161))

(declare-fun b_lambda!7569 () Bool)

(assert (=> (not b_lambda!7569) (not b!210159)))

(declare-fun t!7967 () Bool)

(declare-fun tb!2887 () Bool)

(assert (=> (and start!20930 (= defaultEntry!657 defaultEntry!657) t!7967) tb!2887))

(declare-fun result!4965 () Bool)

(assert (=> tb!2887 (= result!4965 tp_is_empty!5401)))

(assert (=> b!210159 t!7967))

(declare-fun b_and!12289 () Bool)

(assert (= b_and!12283 (and (=> t!7967 result!4965) b_and!12289)))

(declare-fun b_lambda!7571 () Bool)

(assert (=> (not b_lambda!7571) (not b!210162)))

(assert (=> b!210162 t!7967))

(declare-fun b_and!12291 () Bool)

(assert (= b_and!12289 (and (=> t!7967 result!4965) b_and!12291)))

(assert (=> b!210165 m!237139))

(assert (=> b!210165 m!237139))

(assert (=> b!210165 m!237141))

(assert (=> b!210158 m!237139))

(assert (=> b!210158 m!237139))

(assert (=> b!210158 m!237141))

(declare-fun m!237161 () Bool)

(assert (=> d!57785 m!237161))

(assert (=> d!57785 m!237041))

(declare-fun m!237163 () Bool)

(assert (=> b!210159 m!237163))

(declare-fun m!237165 () Bool)

(assert (=> b!210159 m!237165))

(assert (=> b!210159 m!237139))

(declare-fun m!237167 () Bool)

(assert (=> b!210159 m!237167))

(assert (=> b!210159 m!237165))

(declare-fun m!237169 () Bool)

(assert (=> b!210159 m!237169))

(declare-fun m!237171 () Bool)

(assert (=> b!210159 m!237171))

(assert (=> b!210159 m!237167))

(declare-fun m!237173 () Bool)

(assert (=> b!210159 m!237173))

(assert (=> b!210159 m!237171))

(declare-fun m!237175 () Bool)

(assert (=> b!210159 m!237175))

(assert (=> b!210160 m!237139))

(assert (=> b!210160 m!237139))

(declare-fun m!237177 () Bool)

(assert (=> b!210160 m!237177))

(declare-fun m!237179 () Bool)

(assert (=> b!210161 m!237179))

(declare-fun m!237181 () Bool)

(assert (=> b!210169 m!237181))

(assert (=> b!210162 m!237165))

(assert (=> b!210162 m!237139))

(declare-fun m!237183 () Bool)

(assert (=> b!210162 m!237183))

(assert (=> b!210162 m!237139))

(assert (=> b!210162 m!237167))

(assert (=> b!210162 m!237165))

(assert (=> b!210162 m!237169))

(assert (=> b!210162 m!237167))

(assert (=> bm!19843 m!237181))

(declare-fun m!237185 () Bool)

(assert (=> b!210168 m!237185))

(assert (=> b!210029 d!57785))

(declare-fun b!210178 () Bool)

(declare-fun e!136864 () Bool)

(declare-fun e!136863 () Bool)

(assert (=> b!210178 (= e!136864 e!136863)))

(declare-fun c!35525 () Bool)

(assert (=> b!210178 (= c!35525 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun d!57787 () Bool)

(assert (=> d!57787 e!136864))

(declare-fun res!102520 () Bool)

(assert (=> d!57787 (=> (not res!102520) (not e!136864))))

(assert (=> d!57787 (= res!102520 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5069 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5069 _values!649))))))))

(declare-fun lt!107499 () Unit!6348)

(declare-fun choose!1081 (array!9989 array!9991 (_ BitVec 32) (_ BitVec 32) V!6849 V!6849 (_ BitVec 32) (_ BitVec 64) V!6849 (_ BitVec 32) Int) Unit!6348)

(assert (=> d!57787 (= lt!107499 (choose!1081 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> d!57787 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!203 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107499)))

(declare-fun call!19852 () ListLongMap!3029)

(declare-fun bm!19848 () Bool)

(assert (=> bm!19848 (= call!19852 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun call!19851 () ListLongMap!3029)

(declare-fun bm!19849 () Bool)

(assert (=> bm!19849 (= call!19851 (getCurrentListMapNoExtraKeys!479 _keys!825 (array!9992 (store (arr!4743 _values!649) i!601 (ValueCellFull!2357 v!520)) (size!5069 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210179 () Bool)

(assert (=> b!210179 (= e!136863 (= call!19851 call!19852))))

(declare-fun b!210180 () Bool)

(assert (=> b!210180 (= e!136863 (= call!19851 (+!554 call!19852 (tuple2!4127 k0!843 v!520))))))

(assert (= (and d!57787 res!102520) b!210178))

(assert (= (and b!210178 c!35525) b!210180))

(assert (= (and b!210178 (not c!35525)) b!210179))

(assert (= (or b!210180 b!210179) bm!19849))

(assert (= (or b!210180 b!210179) bm!19848))

(declare-fun m!237187 () Bool)

(assert (=> d!57787 m!237187))

(assert (=> bm!19848 m!237033))

(assert (=> bm!19849 m!237025))

(declare-fun m!237189 () Bool)

(assert (=> bm!19849 m!237189))

(declare-fun m!237191 () Bool)

(assert (=> b!210180 m!237191))

(assert (=> b!210029 d!57787))

(declare-fun bm!19864 () Bool)

(declare-fun call!19869 () Bool)

(declare-fun lt!107553 () ListLongMap!3029)

(assert (=> bm!19864 (= call!19869 (contains!1373 lt!107553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210223 () Bool)

(declare-fun e!136901 () Bool)

(assert (=> b!210223 (= e!136901 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19865 () Bool)

(declare-fun call!19871 () ListLongMap!3029)

(declare-fun call!19868 () ListLongMap!3029)

(assert (=> bm!19865 (= call!19871 call!19868)))

(declare-fun b!210224 () Bool)

(declare-fun e!136900 () Bool)

(assert (=> b!210224 (= e!136900 (not call!19869))))

(declare-fun b!210226 () Bool)

(declare-fun e!136893 () ListLongMap!3029)

(declare-fun e!136898 () ListLongMap!3029)

(assert (=> b!210226 (= e!136893 e!136898)))

(declare-fun c!35543 () Bool)

(assert (=> b!210226 (= c!35543 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210227 () Bool)

(declare-fun e!136894 () Bool)

(declare-fun call!19872 () Bool)

(assert (=> b!210227 (= e!136894 (not call!19872))))

(declare-fun b!210228 () Bool)

(declare-fun e!136897 () Bool)

(assert (=> b!210228 (= e!136897 (= (apply!191 lt!107553 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210229 () Bool)

(declare-fun e!136891 () Bool)

(declare-fun e!136896 () Bool)

(assert (=> b!210229 (= e!136891 e!136896)))

(declare-fun res!102542 () Bool)

(assert (=> b!210229 (=> (not res!102542) (not e!136896))))

(assert (=> b!210229 (= res!102542 (contains!1373 lt!107553 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun b!210230 () Bool)

(declare-fun e!136899 () Unit!6348)

(declare-fun Unit!6354 () Unit!6348)

(assert (=> b!210230 (= e!136899 Unit!6354)))

(declare-fun bm!19866 () Bool)

(declare-fun call!19873 () ListLongMap!3029)

(declare-fun call!19870 () ListLongMap!3029)

(assert (=> bm!19866 (= call!19873 call!19870)))

(declare-fun b!210231 () Bool)

(assert (=> b!210231 (= e!136896 (= (apply!191 lt!107553 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)) (get!2541 (select (arr!4743 lt!107400) #b00000000000000000000000000000000) (dynLambda!525 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210231 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5069 lt!107400)))))

(assert (=> b!210231 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun b!210232 () Bool)

(declare-fun res!102541 () Bool)

(declare-fun e!136892 () Bool)

(assert (=> b!210232 (=> (not res!102541) (not e!136892))))

(assert (=> b!210232 (= res!102541 e!136891)))

(declare-fun res!102539 () Bool)

(assert (=> b!210232 (=> res!102539 e!136891)))

(declare-fun e!136895 () Bool)

(assert (=> b!210232 (= res!102539 (not e!136895))))

(declare-fun res!102546 () Bool)

(assert (=> b!210232 (=> (not res!102546) (not e!136895))))

(assert (=> b!210232 (= res!102546 (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun bm!19867 () Bool)

(assert (=> bm!19867 (= call!19872 (contains!1373 lt!107553 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210233 () Bool)

(declare-fun e!136903 () ListLongMap!3029)

(assert (=> b!210233 (= e!136903 call!19873)))

(declare-fun b!210234 () Bool)

(assert (=> b!210234 (= e!136895 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210235 () Bool)

(declare-fun c!35539 () Bool)

(assert (=> b!210235 (= c!35539 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!210235 (= e!136898 e!136903)))

(declare-fun bm!19868 () Bool)

(declare-fun call!19867 () ListLongMap!3029)

(assert (=> bm!19868 (= call!19870 call!19867)))

(declare-fun b!210236 () Bool)

(assert (=> b!210236 (= e!136893 (+!554 call!19868 (tuple2!4127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210237 () Bool)

(assert (=> b!210237 (= e!136903 call!19871)))

(declare-fun b!210238 () Bool)

(assert (=> b!210238 (= e!136892 e!136894)))

(declare-fun c!35542 () Bool)

(assert (=> b!210238 (= c!35542 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210239 () Bool)

(declare-fun lt!107552 () Unit!6348)

(assert (=> b!210239 (= e!136899 lt!107552)))

(declare-fun lt!107564 () ListLongMap!3029)

(assert (=> b!210239 (= lt!107564 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107554 () (_ BitVec 64))

(assert (=> b!210239 (= lt!107554 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107561 () (_ BitVec 64))

(assert (=> b!210239 (= lt!107561 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107549 () Unit!6348)

(declare-fun addStillContains!167 (ListLongMap!3029 (_ BitVec 64) V!6849 (_ BitVec 64)) Unit!6348)

(assert (=> b!210239 (= lt!107549 (addStillContains!167 lt!107564 lt!107554 zeroValue!615 lt!107561))))

(assert (=> b!210239 (contains!1373 (+!554 lt!107564 (tuple2!4127 lt!107554 zeroValue!615)) lt!107561)))

(declare-fun lt!107565 () Unit!6348)

(assert (=> b!210239 (= lt!107565 lt!107549)))

(declare-fun lt!107559 () ListLongMap!3029)

(assert (=> b!210239 (= lt!107559 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107557 () (_ BitVec 64))

(assert (=> b!210239 (= lt!107557 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107558 () (_ BitVec 64))

(assert (=> b!210239 (= lt!107558 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107551 () Unit!6348)

(declare-fun addApplyDifferent!167 (ListLongMap!3029 (_ BitVec 64) V!6849 (_ BitVec 64)) Unit!6348)

(assert (=> b!210239 (= lt!107551 (addApplyDifferent!167 lt!107559 lt!107557 minValue!615 lt!107558))))

(assert (=> b!210239 (= (apply!191 (+!554 lt!107559 (tuple2!4127 lt!107557 minValue!615)) lt!107558) (apply!191 lt!107559 lt!107558))))

(declare-fun lt!107555 () Unit!6348)

(assert (=> b!210239 (= lt!107555 lt!107551)))

(declare-fun lt!107556 () ListLongMap!3029)

(assert (=> b!210239 (= lt!107556 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107545 () (_ BitVec 64))

(assert (=> b!210239 (= lt!107545 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107548 () (_ BitVec 64))

(assert (=> b!210239 (= lt!107548 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107563 () Unit!6348)

(assert (=> b!210239 (= lt!107563 (addApplyDifferent!167 lt!107556 lt!107545 zeroValue!615 lt!107548))))

(assert (=> b!210239 (= (apply!191 (+!554 lt!107556 (tuple2!4127 lt!107545 zeroValue!615)) lt!107548) (apply!191 lt!107556 lt!107548))))

(declare-fun lt!107547 () Unit!6348)

(assert (=> b!210239 (= lt!107547 lt!107563)))

(declare-fun lt!107544 () ListLongMap!3029)

(assert (=> b!210239 (= lt!107544 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107560 () (_ BitVec 64))

(assert (=> b!210239 (= lt!107560 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107546 () (_ BitVec 64))

(assert (=> b!210239 (= lt!107546 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210239 (= lt!107552 (addApplyDifferent!167 lt!107544 lt!107560 minValue!615 lt!107546))))

(assert (=> b!210239 (= (apply!191 (+!554 lt!107544 (tuple2!4127 lt!107560 minValue!615)) lt!107546) (apply!191 lt!107544 lt!107546))))

(declare-fun b!210225 () Bool)

(declare-fun res!102547 () Bool)

(assert (=> b!210225 (=> (not res!102547) (not e!136892))))

(assert (=> b!210225 (= res!102547 e!136900)))

(declare-fun c!35538 () Bool)

(assert (=> b!210225 (= c!35538 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!57789 () Bool)

(assert (=> d!57789 e!136892))

(declare-fun res!102543 () Bool)

(assert (=> d!57789 (=> (not res!102543) (not e!136892))))

(assert (=> d!57789 (= res!102543 (or (bvsge #b00000000000000000000000000000000 (size!5068 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))))

(declare-fun lt!107550 () ListLongMap!3029)

(assert (=> d!57789 (= lt!107553 lt!107550)))

(declare-fun lt!107562 () Unit!6348)

(assert (=> d!57789 (= lt!107562 e!136899)))

(declare-fun c!35541 () Bool)

(assert (=> d!57789 (= c!35541 e!136901)))

(declare-fun res!102544 () Bool)

(assert (=> d!57789 (=> (not res!102544) (not e!136901))))

(assert (=> d!57789 (= res!102544 (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> d!57789 (= lt!107550 e!136893)))

(declare-fun c!35540 () Bool)

(assert (=> d!57789 (= c!35540 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57789 (validMask!0 mask!1149)))

(assert (=> d!57789 (= (getCurrentListMap!1042 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107553)))

(declare-fun b!210240 () Bool)

(declare-fun e!136902 () Bool)

(assert (=> b!210240 (= e!136894 e!136902)))

(declare-fun res!102540 () Bool)

(assert (=> b!210240 (= res!102540 call!19872)))

(assert (=> b!210240 (=> (not res!102540) (not e!136902))))

(declare-fun b!210241 () Bool)

(assert (=> b!210241 (= e!136900 e!136897)))

(declare-fun res!102545 () Bool)

(assert (=> b!210241 (= res!102545 call!19869)))

(assert (=> b!210241 (=> (not res!102545) (not e!136897))))

(declare-fun bm!19869 () Bool)

(assert (=> bm!19869 (= call!19868 (+!554 (ite c!35540 call!19867 (ite c!35543 call!19870 call!19873)) (ite (or c!35540 c!35543) (tuple2!4127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19870 () Bool)

(assert (=> bm!19870 (= call!19867 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210242 () Bool)

(assert (=> b!210242 (= e!136902 (= (apply!191 lt!107553 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210243 () Bool)

(assert (=> b!210243 (= e!136898 call!19871)))

(assert (= (and d!57789 c!35540) b!210236))

(assert (= (and d!57789 (not c!35540)) b!210226))

(assert (= (and b!210226 c!35543) b!210243))

(assert (= (and b!210226 (not c!35543)) b!210235))

(assert (= (and b!210235 c!35539) b!210237))

(assert (= (and b!210235 (not c!35539)) b!210233))

(assert (= (or b!210237 b!210233) bm!19866))

(assert (= (or b!210243 bm!19866) bm!19868))

(assert (= (or b!210243 b!210237) bm!19865))

(assert (= (or b!210236 bm!19868) bm!19870))

(assert (= (or b!210236 bm!19865) bm!19869))

(assert (= (and d!57789 res!102544) b!210223))

(assert (= (and d!57789 c!35541) b!210239))

(assert (= (and d!57789 (not c!35541)) b!210230))

(assert (= (and d!57789 res!102543) b!210232))

(assert (= (and b!210232 res!102546) b!210234))

(assert (= (and b!210232 (not res!102539)) b!210229))

(assert (= (and b!210229 res!102542) b!210231))

(assert (= (and b!210232 res!102541) b!210225))

(assert (= (and b!210225 c!35538) b!210241))

(assert (= (and b!210225 (not c!35538)) b!210224))

(assert (= (and b!210241 res!102545) b!210228))

(assert (= (or b!210241 b!210224) bm!19864))

(assert (= (and b!210225 res!102547) b!210238))

(assert (= (and b!210238 c!35542) b!210240))

(assert (= (and b!210238 (not c!35542)) b!210227))

(assert (= (and b!210240 res!102540) b!210242))

(assert (= (or b!210240 b!210227) bm!19867))

(declare-fun b_lambda!7573 () Bool)

(assert (=> (not b_lambda!7573) (not b!210231)))

(assert (=> b!210231 t!7967))

(declare-fun b_and!12293 () Bool)

(assert (= b_and!12291 (and (=> t!7967 result!4965) b_and!12293)))

(declare-fun m!237193 () Bool)

(assert (=> bm!19867 m!237193))

(assert (=> b!210231 m!237139))

(assert (=> b!210231 m!237165))

(declare-fun m!237195 () Bool)

(assert (=> b!210231 m!237195))

(assert (=> b!210231 m!237195))

(assert (=> b!210231 m!237165))

(declare-fun m!237197 () Bool)

(assert (=> b!210231 m!237197))

(assert (=> b!210231 m!237139))

(declare-fun m!237199 () Bool)

(assert (=> b!210231 m!237199))

(declare-fun m!237201 () Bool)

(assert (=> bm!19864 m!237201))

(assert (=> b!210229 m!237139))

(assert (=> b!210229 m!237139))

(declare-fun m!237203 () Bool)

(assert (=> b!210229 m!237203))

(declare-fun m!237205 () Bool)

(assert (=> bm!19869 m!237205))

(declare-fun m!237207 () Bool)

(assert (=> b!210236 m!237207))

(assert (=> bm!19870 m!237021))

(assert (=> b!210234 m!237139))

(assert (=> b!210234 m!237139))

(assert (=> b!210234 m!237141))

(assert (=> b!210223 m!237139))

(assert (=> b!210223 m!237139))

(assert (=> b!210223 m!237141))

(declare-fun m!237209 () Bool)

(assert (=> b!210239 m!237209))

(declare-fun m!237211 () Bool)

(assert (=> b!210239 m!237211))

(declare-fun m!237213 () Bool)

(assert (=> b!210239 m!237213))

(declare-fun m!237215 () Bool)

(assert (=> b!210239 m!237215))

(declare-fun m!237217 () Bool)

(assert (=> b!210239 m!237217))

(declare-fun m!237219 () Bool)

(assert (=> b!210239 m!237219))

(declare-fun m!237221 () Bool)

(assert (=> b!210239 m!237221))

(declare-fun m!237223 () Bool)

(assert (=> b!210239 m!237223))

(assert (=> b!210239 m!237021))

(assert (=> b!210239 m!237219))

(declare-fun m!237225 () Bool)

(assert (=> b!210239 m!237225))

(assert (=> b!210239 m!237209))

(declare-fun m!237227 () Bool)

(assert (=> b!210239 m!237227))

(declare-fun m!237229 () Bool)

(assert (=> b!210239 m!237229))

(assert (=> b!210239 m!237139))

(declare-fun m!237231 () Bool)

(assert (=> b!210239 m!237231))

(assert (=> b!210239 m!237213))

(declare-fun m!237233 () Bool)

(assert (=> b!210239 m!237233))

(declare-fun m!237235 () Bool)

(assert (=> b!210239 m!237235))

(assert (=> b!210239 m!237223))

(declare-fun m!237237 () Bool)

(assert (=> b!210239 m!237237))

(declare-fun m!237239 () Bool)

(assert (=> b!210228 m!237239))

(declare-fun m!237241 () Bool)

(assert (=> b!210242 m!237241))

(assert (=> d!57789 m!237041))

(assert (=> b!210029 d!57789))

(declare-fun bm!19871 () Bool)

(declare-fun call!19876 () Bool)

(declare-fun lt!107575 () ListLongMap!3029)

(assert (=> bm!19871 (= call!19876 (contains!1373 lt!107575 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210244 () Bool)

(declare-fun e!136914 () Bool)

(assert (=> b!210244 (= e!136914 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19872 () Bool)

(declare-fun call!19878 () ListLongMap!3029)

(declare-fun call!19875 () ListLongMap!3029)

(assert (=> bm!19872 (= call!19878 call!19875)))

(declare-fun b!210245 () Bool)

(declare-fun e!136913 () Bool)

(assert (=> b!210245 (= e!136913 (not call!19876))))

(declare-fun b!210247 () Bool)

(declare-fun e!136906 () ListLongMap!3029)

(declare-fun e!136911 () ListLongMap!3029)

(assert (=> b!210247 (= e!136906 e!136911)))

(declare-fun c!35549 () Bool)

(assert (=> b!210247 (= c!35549 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210248 () Bool)

(declare-fun e!136907 () Bool)

(declare-fun call!19879 () Bool)

(assert (=> b!210248 (= e!136907 (not call!19879))))

(declare-fun b!210249 () Bool)

(declare-fun e!136910 () Bool)

(assert (=> b!210249 (= e!136910 (= (apply!191 lt!107575 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210250 () Bool)

(declare-fun e!136904 () Bool)

(declare-fun e!136909 () Bool)

(assert (=> b!210250 (= e!136904 e!136909)))

(declare-fun res!102551 () Bool)

(assert (=> b!210250 (=> (not res!102551) (not e!136909))))

(assert (=> b!210250 (= res!102551 (contains!1373 lt!107575 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210250 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun b!210251 () Bool)

(declare-fun e!136912 () Unit!6348)

(declare-fun Unit!6355 () Unit!6348)

(assert (=> b!210251 (= e!136912 Unit!6355)))

(declare-fun bm!19873 () Bool)

(declare-fun call!19880 () ListLongMap!3029)

(declare-fun call!19877 () ListLongMap!3029)

(assert (=> bm!19873 (= call!19880 call!19877)))

(declare-fun b!210252 () Bool)

(assert (=> b!210252 (= e!136909 (= (apply!191 lt!107575 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)) (get!2541 (select (arr!4743 _values!649) #b00000000000000000000000000000000) (dynLambda!525 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5069 _values!649)))))

(assert (=> b!210252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun b!210253 () Bool)

(declare-fun res!102550 () Bool)

(declare-fun e!136905 () Bool)

(assert (=> b!210253 (=> (not res!102550) (not e!136905))))

(assert (=> b!210253 (= res!102550 e!136904)))

(declare-fun res!102548 () Bool)

(assert (=> b!210253 (=> res!102548 e!136904)))

(declare-fun e!136908 () Bool)

(assert (=> b!210253 (= res!102548 (not e!136908))))

(declare-fun res!102555 () Bool)

(assert (=> b!210253 (=> (not res!102555) (not e!136908))))

(assert (=> b!210253 (= res!102555 (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun bm!19874 () Bool)

(assert (=> bm!19874 (= call!19879 (contains!1373 lt!107575 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210254 () Bool)

(declare-fun e!136916 () ListLongMap!3029)

(assert (=> b!210254 (= e!136916 call!19880)))

(declare-fun b!210255 () Bool)

(assert (=> b!210255 (= e!136908 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210256 () Bool)

(declare-fun c!35545 () Bool)

(assert (=> b!210256 (= c!35545 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!210256 (= e!136911 e!136916)))

(declare-fun bm!19875 () Bool)

(declare-fun call!19874 () ListLongMap!3029)

(assert (=> bm!19875 (= call!19877 call!19874)))

(declare-fun b!210257 () Bool)

(assert (=> b!210257 (= e!136906 (+!554 call!19875 (tuple2!4127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210258 () Bool)

(assert (=> b!210258 (= e!136916 call!19878)))

(declare-fun b!210259 () Bool)

(assert (=> b!210259 (= e!136905 e!136907)))

(declare-fun c!35548 () Bool)

(assert (=> b!210259 (= c!35548 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210260 () Bool)

(declare-fun lt!107574 () Unit!6348)

(assert (=> b!210260 (= e!136912 lt!107574)))

(declare-fun lt!107586 () ListLongMap!3029)

(assert (=> b!210260 (= lt!107586 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107576 () (_ BitVec 64))

(assert (=> b!210260 (= lt!107576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107583 () (_ BitVec 64))

(assert (=> b!210260 (= lt!107583 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107571 () Unit!6348)

(assert (=> b!210260 (= lt!107571 (addStillContains!167 lt!107586 lt!107576 zeroValue!615 lt!107583))))

(assert (=> b!210260 (contains!1373 (+!554 lt!107586 (tuple2!4127 lt!107576 zeroValue!615)) lt!107583)))

(declare-fun lt!107587 () Unit!6348)

(assert (=> b!210260 (= lt!107587 lt!107571)))

(declare-fun lt!107581 () ListLongMap!3029)

(assert (=> b!210260 (= lt!107581 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107579 () (_ BitVec 64))

(assert (=> b!210260 (= lt!107579 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107580 () (_ BitVec 64))

(assert (=> b!210260 (= lt!107580 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107573 () Unit!6348)

(assert (=> b!210260 (= lt!107573 (addApplyDifferent!167 lt!107581 lt!107579 minValue!615 lt!107580))))

(assert (=> b!210260 (= (apply!191 (+!554 lt!107581 (tuple2!4127 lt!107579 minValue!615)) lt!107580) (apply!191 lt!107581 lt!107580))))

(declare-fun lt!107577 () Unit!6348)

(assert (=> b!210260 (= lt!107577 lt!107573)))

(declare-fun lt!107578 () ListLongMap!3029)

(assert (=> b!210260 (= lt!107578 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107567 () (_ BitVec 64))

(assert (=> b!210260 (= lt!107567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107570 () (_ BitVec 64))

(assert (=> b!210260 (= lt!107570 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107585 () Unit!6348)

(assert (=> b!210260 (= lt!107585 (addApplyDifferent!167 lt!107578 lt!107567 zeroValue!615 lt!107570))))

(assert (=> b!210260 (= (apply!191 (+!554 lt!107578 (tuple2!4127 lt!107567 zeroValue!615)) lt!107570) (apply!191 lt!107578 lt!107570))))

(declare-fun lt!107569 () Unit!6348)

(assert (=> b!210260 (= lt!107569 lt!107585)))

(declare-fun lt!107566 () ListLongMap!3029)

(assert (=> b!210260 (= lt!107566 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107582 () (_ BitVec 64))

(assert (=> b!210260 (= lt!107582 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107568 () (_ BitVec 64))

(assert (=> b!210260 (= lt!107568 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210260 (= lt!107574 (addApplyDifferent!167 lt!107566 lt!107582 minValue!615 lt!107568))))

(assert (=> b!210260 (= (apply!191 (+!554 lt!107566 (tuple2!4127 lt!107582 minValue!615)) lt!107568) (apply!191 lt!107566 lt!107568))))

(declare-fun b!210246 () Bool)

(declare-fun res!102556 () Bool)

(assert (=> b!210246 (=> (not res!102556) (not e!136905))))

(assert (=> b!210246 (= res!102556 e!136913)))

(declare-fun c!35544 () Bool)

(assert (=> b!210246 (= c!35544 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!57791 () Bool)

(assert (=> d!57791 e!136905))

(declare-fun res!102552 () Bool)

(assert (=> d!57791 (=> (not res!102552) (not e!136905))))

(assert (=> d!57791 (= res!102552 (or (bvsge #b00000000000000000000000000000000 (size!5068 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))))

(declare-fun lt!107572 () ListLongMap!3029)

(assert (=> d!57791 (= lt!107575 lt!107572)))

(declare-fun lt!107584 () Unit!6348)

(assert (=> d!57791 (= lt!107584 e!136912)))

(declare-fun c!35547 () Bool)

(assert (=> d!57791 (= c!35547 e!136914)))

(declare-fun res!102553 () Bool)

(assert (=> d!57791 (=> (not res!102553) (not e!136914))))

(assert (=> d!57791 (= res!102553 (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> d!57791 (= lt!107572 e!136906)))

(declare-fun c!35546 () Bool)

(assert (=> d!57791 (= c!35546 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57791 (validMask!0 mask!1149)))

(assert (=> d!57791 (= (getCurrentListMap!1042 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107575)))

(declare-fun b!210261 () Bool)

(declare-fun e!136915 () Bool)

(assert (=> b!210261 (= e!136907 e!136915)))

(declare-fun res!102549 () Bool)

(assert (=> b!210261 (= res!102549 call!19879)))

(assert (=> b!210261 (=> (not res!102549) (not e!136915))))

(declare-fun b!210262 () Bool)

(assert (=> b!210262 (= e!136913 e!136910)))

(declare-fun res!102554 () Bool)

(assert (=> b!210262 (= res!102554 call!19876)))

(assert (=> b!210262 (=> (not res!102554) (not e!136910))))

(declare-fun bm!19876 () Bool)

(assert (=> bm!19876 (= call!19875 (+!554 (ite c!35546 call!19874 (ite c!35549 call!19877 call!19880)) (ite (or c!35546 c!35549) (tuple2!4127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19877 () Bool)

(assert (=> bm!19877 (= call!19874 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210263 () Bool)

(assert (=> b!210263 (= e!136915 (= (apply!191 lt!107575 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210264 () Bool)

(assert (=> b!210264 (= e!136911 call!19878)))

(assert (= (and d!57791 c!35546) b!210257))

(assert (= (and d!57791 (not c!35546)) b!210247))

(assert (= (and b!210247 c!35549) b!210264))

(assert (= (and b!210247 (not c!35549)) b!210256))

(assert (= (and b!210256 c!35545) b!210258))

(assert (= (and b!210256 (not c!35545)) b!210254))

(assert (= (or b!210258 b!210254) bm!19873))

(assert (= (or b!210264 bm!19873) bm!19875))

(assert (= (or b!210264 b!210258) bm!19872))

(assert (= (or b!210257 bm!19875) bm!19877))

(assert (= (or b!210257 bm!19872) bm!19876))

(assert (= (and d!57791 res!102553) b!210244))

(assert (= (and d!57791 c!35547) b!210260))

(assert (= (and d!57791 (not c!35547)) b!210251))

(assert (= (and d!57791 res!102552) b!210253))

(assert (= (and b!210253 res!102555) b!210255))

(assert (= (and b!210253 (not res!102548)) b!210250))

(assert (= (and b!210250 res!102551) b!210252))

(assert (= (and b!210253 res!102550) b!210246))

(assert (= (and b!210246 c!35544) b!210262))

(assert (= (and b!210246 (not c!35544)) b!210245))

(assert (= (and b!210262 res!102554) b!210249))

(assert (= (or b!210262 b!210245) bm!19871))

(assert (= (and b!210246 res!102556) b!210259))

(assert (= (and b!210259 c!35548) b!210261))

(assert (= (and b!210259 (not c!35548)) b!210248))

(assert (= (and b!210261 res!102549) b!210263))

(assert (= (or b!210261 b!210248) bm!19874))

(declare-fun b_lambda!7575 () Bool)

(assert (=> (not b_lambda!7575) (not b!210252)))

(assert (=> b!210252 t!7967))

(declare-fun b_and!12295 () Bool)

(assert (= b_and!12293 (and (=> t!7967 result!4965) b_and!12295)))

(declare-fun m!237243 () Bool)

(assert (=> bm!19874 m!237243))

(assert (=> b!210252 m!237139))

(assert (=> b!210252 m!237165))

(assert (=> b!210252 m!237167))

(assert (=> b!210252 m!237167))

(assert (=> b!210252 m!237165))

(assert (=> b!210252 m!237169))

(assert (=> b!210252 m!237139))

(declare-fun m!237245 () Bool)

(assert (=> b!210252 m!237245))

(declare-fun m!237247 () Bool)

(assert (=> bm!19871 m!237247))

(assert (=> b!210250 m!237139))

(assert (=> b!210250 m!237139))

(declare-fun m!237249 () Bool)

(assert (=> b!210250 m!237249))

(declare-fun m!237251 () Bool)

(assert (=> bm!19876 m!237251))

(declare-fun m!237253 () Bool)

(assert (=> b!210257 m!237253))

(assert (=> bm!19877 m!237033))

(assert (=> b!210255 m!237139))

(assert (=> b!210255 m!237139))

(assert (=> b!210255 m!237141))

(assert (=> b!210244 m!237139))

(assert (=> b!210244 m!237139))

(assert (=> b!210244 m!237141))

(declare-fun m!237255 () Bool)

(assert (=> b!210260 m!237255))

(declare-fun m!237257 () Bool)

(assert (=> b!210260 m!237257))

(declare-fun m!237259 () Bool)

(assert (=> b!210260 m!237259))

(declare-fun m!237261 () Bool)

(assert (=> b!210260 m!237261))

(declare-fun m!237263 () Bool)

(assert (=> b!210260 m!237263))

(declare-fun m!237265 () Bool)

(assert (=> b!210260 m!237265))

(declare-fun m!237267 () Bool)

(assert (=> b!210260 m!237267))

(declare-fun m!237269 () Bool)

(assert (=> b!210260 m!237269))

(assert (=> b!210260 m!237033))

(assert (=> b!210260 m!237265))

(declare-fun m!237271 () Bool)

(assert (=> b!210260 m!237271))

(assert (=> b!210260 m!237255))

(declare-fun m!237273 () Bool)

(assert (=> b!210260 m!237273))

(declare-fun m!237275 () Bool)

(assert (=> b!210260 m!237275))

(assert (=> b!210260 m!237139))

(declare-fun m!237277 () Bool)

(assert (=> b!210260 m!237277))

(assert (=> b!210260 m!237259))

(declare-fun m!237279 () Bool)

(assert (=> b!210260 m!237279))

(declare-fun m!237281 () Bool)

(assert (=> b!210260 m!237281))

(assert (=> b!210260 m!237269))

(declare-fun m!237283 () Bool)

(assert (=> b!210260 m!237283))

(declare-fun m!237285 () Bool)

(assert (=> b!210249 m!237285))

(declare-fun m!237287 () Bool)

(assert (=> b!210263 m!237287))

(assert (=> d!57791 m!237041))

(assert (=> b!210029 d!57791))

(declare-fun b!210265 () Bool)

(declare-fun e!136917 () ListLongMap!3029)

(declare-fun e!136919 () ListLongMap!3029)

(assert (=> b!210265 (= e!136917 e!136919)))

(declare-fun c!35551 () Bool)

(assert (=> b!210265 (= c!35551 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210266 () Bool)

(declare-fun lt!107591 () Unit!6348)

(declare-fun lt!107589 () Unit!6348)

(assert (=> b!210266 (= lt!107591 lt!107589)))

(declare-fun lt!107594 () (_ BitVec 64))

(declare-fun lt!107588 () ListLongMap!3029)

(declare-fun lt!107592 () (_ BitVec 64))

(declare-fun lt!107593 () V!6849)

(assert (=> b!210266 (not (contains!1373 (+!554 lt!107588 (tuple2!4127 lt!107594 lt!107593)) lt!107592))))

(assert (=> b!210266 (= lt!107589 (addStillNotContains!101 lt!107588 lt!107594 lt!107593 lt!107592))))

(assert (=> b!210266 (= lt!107592 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210266 (= lt!107593 (get!2541 (select (arr!4743 lt!107400) #b00000000000000000000000000000000) (dynLambda!525 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210266 (= lt!107594 (select (arr!4742 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19881 () ListLongMap!3029)

(assert (=> b!210266 (= lt!107588 call!19881)))

(assert (=> b!210266 (= e!136919 (+!554 call!19881 (tuple2!4127 (select (arr!4742 _keys!825) #b00000000000000000000000000000000) (get!2541 (select (arr!4743 lt!107400) #b00000000000000000000000000000000) (dynLambda!525 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!19878 () Bool)

(assert (=> bm!19878 (= call!19881 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210268 () Bool)

(declare-fun e!136921 () Bool)

(declare-fun lt!107590 () ListLongMap!3029)

(assert (=> b!210268 (= e!136921 (isEmpty!496 lt!107590))))

(declare-fun b!210269 () Bool)

(assert (=> b!210269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> b!210269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5069 lt!107400)))))

(declare-fun e!136922 () Bool)

(assert (=> b!210269 (= e!136922 (= (apply!191 lt!107590 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)) (get!2541 (select (arr!4743 lt!107400) #b00000000000000000000000000000000) (dynLambda!525 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210270 () Bool)

(assert (=> b!210270 (= e!136917 (ListLongMap!3030 Nil!3032))))

(declare-fun b!210271 () Bool)

(assert (=> b!210271 (= e!136919 call!19881)))

(declare-fun b!210272 () Bool)

(declare-fun e!136923 () Bool)

(assert (=> b!210272 (= e!136923 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210272 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210273 () Bool)

(declare-fun e!136920 () Bool)

(assert (=> b!210273 (= e!136920 e!136921)))

(declare-fun c!35552 () Bool)

(assert (=> b!210273 (= c!35552 (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun b!210274 () Bool)

(declare-fun e!136918 () Bool)

(assert (=> b!210274 (= e!136918 e!136920)))

(declare-fun c!35553 () Bool)

(assert (=> b!210274 (= c!35553 e!136923)))

(declare-fun res!102558 () Bool)

(assert (=> b!210274 (=> (not res!102558) (not e!136923))))

(assert (=> b!210274 (= res!102558 (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun b!210267 () Bool)

(assert (=> b!210267 (= e!136920 e!136922)))

(assert (=> b!210267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(declare-fun res!102557 () Bool)

(assert (=> b!210267 (= res!102557 (contains!1373 lt!107590 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210267 (=> (not res!102557) (not e!136922))))

(declare-fun d!57793 () Bool)

(assert (=> d!57793 e!136918))

(declare-fun res!102560 () Bool)

(assert (=> d!57793 (=> (not res!102560) (not e!136918))))

(assert (=> d!57793 (= res!102560 (not (contains!1373 lt!107590 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57793 (= lt!107590 e!136917)))

(declare-fun c!35550 () Bool)

(assert (=> d!57793 (= c!35550 (bvsge #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> d!57793 (validMask!0 mask!1149)))

(assert (=> d!57793 (= (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107590)))

(declare-fun b!210275 () Bool)

(declare-fun res!102559 () Bool)

(assert (=> b!210275 (=> (not res!102559) (not e!136918))))

(assert (=> b!210275 (= res!102559 (not (contains!1373 lt!107590 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!210276 () Bool)

(assert (=> b!210276 (= e!136921 (= lt!107590 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107400 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(assert (= (and d!57793 c!35550) b!210270))

(assert (= (and d!57793 (not c!35550)) b!210265))

(assert (= (and b!210265 c!35551) b!210266))

(assert (= (and b!210265 (not c!35551)) b!210271))

(assert (= (or b!210266 b!210271) bm!19878))

(assert (= (and d!57793 res!102560) b!210275))

(assert (= (and b!210275 res!102559) b!210274))

(assert (= (and b!210274 res!102558) b!210272))

(assert (= (and b!210274 c!35553) b!210267))

(assert (= (and b!210274 (not c!35553)) b!210273))

(assert (= (and b!210267 res!102557) b!210269))

(assert (= (and b!210273 c!35552) b!210276))

(assert (= (and b!210273 (not c!35552)) b!210268))

(declare-fun b_lambda!7577 () Bool)

(assert (=> (not b_lambda!7577) (not b!210266)))

(assert (=> b!210266 t!7967))

(declare-fun b_and!12297 () Bool)

(assert (= b_and!12295 (and (=> t!7967 result!4965) b_and!12297)))

(declare-fun b_lambda!7579 () Bool)

(assert (=> (not b_lambda!7579) (not b!210269)))

(assert (=> b!210269 t!7967))

(declare-fun b_and!12299 () Bool)

(assert (= b_and!12297 (and (=> t!7967 result!4965) b_and!12299)))

(assert (=> b!210272 m!237139))

(assert (=> b!210272 m!237139))

(assert (=> b!210272 m!237141))

(assert (=> b!210265 m!237139))

(assert (=> b!210265 m!237139))

(assert (=> b!210265 m!237141))

(declare-fun m!237289 () Bool)

(assert (=> d!57793 m!237289))

(assert (=> d!57793 m!237041))

(declare-fun m!237291 () Bool)

(assert (=> b!210266 m!237291))

(assert (=> b!210266 m!237165))

(assert (=> b!210266 m!237139))

(assert (=> b!210266 m!237195))

(assert (=> b!210266 m!237165))

(assert (=> b!210266 m!237197))

(declare-fun m!237293 () Bool)

(assert (=> b!210266 m!237293))

(assert (=> b!210266 m!237195))

(declare-fun m!237295 () Bool)

(assert (=> b!210266 m!237295))

(assert (=> b!210266 m!237293))

(declare-fun m!237297 () Bool)

(assert (=> b!210266 m!237297))

(assert (=> b!210267 m!237139))

(assert (=> b!210267 m!237139))

(declare-fun m!237299 () Bool)

(assert (=> b!210267 m!237299))

(declare-fun m!237301 () Bool)

(assert (=> b!210268 m!237301))

(declare-fun m!237303 () Bool)

(assert (=> b!210276 m!237303))

(assert (=> b!210269 m!237165))

(assert (=> b!210269 m!237139))

(declare-fun m!237305 () Bool)

(assert (=> b!210269 m!237305))

(assert (=> b!210269 m!237139))

(assert (=> b!210269 m!237195))

(assert (=> b!210269 m!237165))

(assert (=> b!210269 m!237197))

(assert (=> b!210269 m!237195))

(assert (=> bm!19878 m!237303))

(declare-fun m!237307 () Bool)

(assert (=> b!210275 m!237307))

(assert (=> b!210029 d!57793))

(declare-fun b!210287 () Bool)

(declare-fun e!136932 () Bool)

(declare-fun call!19884 () Bool)

(assert (=> b!210287 (= e!136932 call!19884)))

(declare-fun b!210288 () Bool)

(assert (=> b!210288 (= e!136932 call!19884)))

(declare-fun b!210289 () Bool)

(declare-fun e!136933 () Bool)

(assert (=> b!210289 (= e!136933 e!136932)))

(declare-fun c!35556 () Bool)

(assert (=> b!210289 (= c!35556 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210290 () Bool)

(declare-fun e!136934 () Bool)

(assert (=> b!210290 (= e!136934 e!136933)))

(declare-fun res!102569 () Bool)

(assert (=> b!210290 (=> (not res!102569) (not e!136933))))

(declare-fun e!136935 () Bool)

(assert (=> b!210290 (= res!102569 (not e!136935))))

(declare-fun res!102567 () Bool)

(assert (=> b!210290 (=> (not res!102567) (not e!136935))))

(assert (=> b!210290 (= res!102567 (validKeyInArray!0 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57795 () Bool)

(declare-fun res!102568 () Bool)

(assert (=> d!57795 (=> res!102568 e!136934)))

(assert (=> d!57795 (= res!102568 (bvsge #b00000000000000000000000000000000 (size!5068 _keys!825)))))

(assert (=> d!57795 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3031) e!136934)))

(declare-fun b!210291 () Bool)

(declare-fun contains!1375 (List!3034 (_ BitVec 64)) Bool)

(assert (=> b!210291 (= e!136935 (contains!1375 Nil!3031 (select (arr!4742 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19881 () Bool)

(assert (=> bm!19881 (= call!19884 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35556 (Cons!3030 (select (arr!4742 _keys!825) #b00000000000000000000000000000000) Nil!3031) Nil!3031)))))

(assert (= (and d!57795 (not res!102568)) b!210290))

(assert (= (and b!210290 res!102567) b!210291))

(assert (= (and b!210290 res!102569) b!210289))

(assert (= (and b!210289 c!35556) b!210288))

(assert (= (and b!210289 (not c!35556)) b!210287))

(assert (= (or b!210288 b!210287) bm!19881))

(assert (=> b!210289 m!237139))

(assert (=> b!210289 m!237139))

(assert (=> b!210289 m!237141))

(assert (=> b!210290 m!237139))

(assert (=> b!210290 m!237139))

(assert (=> b!210290 m!237141))

(assert (=> b!210291 m!237139))

(assert (=> b!210291 m!237139))

(declare-fun m!237309 () Bool)

(assert (=> b!210291 m!237309))

(assert (=> bm!19881 m!237139))

(declare-fun m!237311 () Bool)

(assert (=> bm!19881 m!237311))

(assert (=> b!210026 d!57795))

(declare-fun d!57797 () Bool)

(declare-fun e!136936 () Bool)

(assert (=> d!57797 e!136936))

(declare-fun res!102570 () Bool)

(assert (=> d!57797 (=> (not res!102570) (not e!136936))))

(declare-fun lt!107596 () ListLongMap!3029)

(assert (=> d!57797 (= res!102570 (contains!1373 lt!107596 (_1!2074 lt!107394)))))

(declare-fun lt!107598 () List!3035)

(assert (=> d!57797 (= lt!107596 (ListLongMap!3030 lt!107598))))

(declare-fun lt!107597 () Unit!6348)

(declare-fun lt!107595 () Unit!6348)

(assert (=> d!57797 (= lt!107597 lt!107595)))

(assert (=> d!57797 (= (getValueByKey!247 lt!107598 (_1!2074 lt!107394)) (Some!252 (_2!2074 lt!107394)))))

(assert (=> d!57797 (= lt!107595 (lemmaContainsTupThenGetReturnValue!137 lt!107598 (_1!2074 lt!107394) (_2!2074 lt!107394)))))

(assert (=> d!57797 (= lt!107598 (insertStrictlySorted!140 (toList!1530 (+!554 lt!107395 lt!107397)) (_1!2074 lt!107394) (_2!2074 lt!107394)))))

(assert (=> d!57797 (= (+!554 (+!554 lt!107395 lt!107397) lt!107394) lt!107596)))

(declare-fun b!210292 () Bool)

(declare-fun res!102571 () Bool)

(assert (=> b!210292 (=> (not res!102571) (not e!136936))))

(assert (=> b!210292 (= res!102571 (= (getValueByKey!247 (toList!1530 lt!107596) (_1!2074 lt!107394)) (Some!252 (_2!2074 lt!107394))))))

(declare-fun b!210293 () Bool)

(assert (=> b!210293 (= e!136936 (contains!1374 (toList!1530 lt!107596) lt!107394))))

(assert (= (and d!57797 res!102570) b!210292))

(assert (= (and b!210292 res!102571) b!210293))

(declare-fun m!237313 () Bool)

(assert (=> d!57797 m!237313))

(declare-fun m!237315 () Bool)

(assert (=> d!57797 m!237315))

(declare-fun m!237317 () Bool)

(assert (=> d!57797 m!237317))

(declare-fun m!237319 () Bool)

(assert (=> d!57797 m!237319))

(declare-fun m!237321 () Bool)

(assert (=> b!210292 m!237321))

(declare-fun m!237323 () Bool)

(assert (=> b!210293 m!237323))

(assert (=> b!210033 d!57797))

(declare-fun d!57799 () Bool)

(declare-fun e!136937 () Bool)

(assert (=> d!57799 e!136937))

(declare-fun res!102572 () Bool)

(assert (=> d!57799 (=> (not res!102572) (not e!136937))))

(declare-fun lt!107600 () ListLongMap!3029)

(assert (=> d!57799 (= res!102572 (contains!1373 lt!107600 (_1!2074 lt!107397)))))

(declare-fun lt!107602 () List!3035)

(assert (=> d!57799 (= lt!107600 (ListLongMap!3030 lt!107602))))

(declare-fun lt!107601 () Unit!6348)

(declare-fun lt!107599 () Unit!6348)

(assert (=> d!57799 (= lt!107601 lt!107599)))

(assert (=> d!57799 (= (getValueByKey!247 lt!107602 (_1!2074 lt!107397)) (Some!252 (_2!2074 lt!107397)))))

(assert (=> d!57799 (= lt!107599 (lemmaContainsTupThenGetReturnValue!137 lt!107602 (_1!2074 lt!107397) (_2!2074 lt!107397)))))

(assert (=> d!57799 (= lt!107602 (insertStrictlySorted!140 (toList!1530 lt!107395) (_1!2074 lt!107397) (_2!2074 lt!107397)))))

(assert (=> d!57799 (= (+!554 lt!107395 lt!107397) lt!107600)))

(declare-fun b!210294 () Bool)

(declare-fun res!102573 () Bool)

(assert (=> b!210294 (=> (not res!102573) (not e!136937))))

(assert (=> b!210294 (= res!102573 (= (getValueByKey!247 (toList!1530 lt!107600) (_1!2074 lt!107397)) (Some!252 (_2!2074 lt!107397))))))

(declare-fun b!210295 () Bool)

(assert (=> b!210295 (= e!136937 (contains!1374 (toList!1530 lt!107600) lt!107397))))

(assert (= (and d!57799 res!102572) b!210294))

(assert (= (and b!210294 res!102573) b!210295))

(declare-fun m!237325 () Bool)

(assert (=> d!57799 m!237325))

(declare-fun m!237327 () Bool)

(assert (=> d!57799 m!237327))

(declare-fun m!237329 () Bool)

(assert (=> d!57799 m!237329))

(declare-fun m!237331 () Bool)

(assert (=> d!57799 m!237331))

(declare-fun m!237333 () Bool)

(assert (=> b!210294 m!237333))

(declare-fun m!237335 () Bool)

(assert (=> b!210295 m!237335))

(assert (=> b!210033 d!57799))

(declare-fun d!57801 () Bool)

(declare-fun e!136938 () Bool)

(assert (=> d!57801 e!136938))

(declare-fun res!102574 () Bool)

(assert (=> d!57801 (=> (not res!102574) (not e!136938))))

(declare-fun lt!107604 () ListLongMap!3029)

(assert (=> d!57801 (= res!102574 (contains!1373 lt!107604 (_1!2074 lt!107394)))))

(declare-fun lt!107606 () List!3035)

(assert (=> d!57801 (= lt!107604 (ListLongMap!3030 lt!107606))))

(declare-fun lt!107605 () Unit!6348)

(declare-fun lt!107603 () Unit!6348)

(assert (=> d!57801 (= lt!107605 lt!107603)))

(assert (=> d!57801 (= (getValueByKey!247 lt!107606 (_1!2074 lt!107394)) (Some!252 (_2!2074 lt!107394)))))

(assert (=> d!57801 (= lt!107603 (lemmaContainsTupThenGetReturnValue!137 lt!107606 (_1!2074 lt!107394) (_2!2074 lt!107394)))))

(assert (=> d!57801 (= lt!107606 (insertStrictlySorted!140 (toList!1530 (+!554 lt!107393 lt!107397)) (_1!2074 lt!107394) (_2!2074 lt!107394)))))

(assert (=> d!57801 (= (+!554 (+!554 lt!107393 lt!107397) lt!107394) lt!107604)))

(declare-fun b!210296 () Bool)

(declare-fun res!102575 () Bool)

(assert (=> b!210296 (=> (not res!102575) (not e!136938))))

(assert (=> b!210296 (= res!102575 (= (getValueByKey!247 (toList!1530 lt!107604) (_1!2074 lt!107394)) (Some!252 (_2!2074 lt!107394))))))

(declare-fun b!210297 () Bool)

(assert (=> b!210297 (= e!136938 (contains!1374 (toList!1530 lt!107604) lt!107394))))

(assert (= (and d!57801 res!102574) b!210296))

(assert (= (and b!210296 res!102575) b!210297))

(declare-fun m!237337 () Bool)

(assert (=> d!57801 m!237337))

(declare-fun m!237339 () Bool)

(assert (=> d!57801 m!237339))

(declare-fun m!237341 () Bool)

(assert (=> d!57801 m!237341))

(declare-fun m!237343 () Bool)

(assert (=> d!57801 m!237343))

(declare-fun m!237345 () Bool)

(assert (=> b!210296 m!237345))

(declare-fun m!237347 () Bool)

(assert (=> b!210297 m!237347))

(assert (=> b!210037 d!57801))

(declare-fun d!57803 () Bool)

(declare-fun e!136939 () Bool)

(assert (=> d!57803 e!136939))

(declare-fun res!102576 () Bool)

(assert (=> d!57803 (=> (not res!102576) (not e!136939))))

(declare-fun lt!107608 () ListLongMap!3029)

(assert (=> d!57803 (= res!102576 (contains!1373 lt!107608 (_1!2074 lt!107397)))))

(declare-fun lt!107610 () List!3035)

(assert (=> d!57803 (= lt!107608 (ListLongMap!3030 lt!107610))))

(declare-fun lt!107609 () Unit!6348)

(declare-fun lt!107607 () Unit!6348)

(assert (=> d!57803 (= lt!107609 lt!107607)))

(assert (=> d!57803 (= (getValueByKey!247 lt!107610 (_1!2074 lt!107397)) (Some!252 (_2!2074 lt!107397)))))

(assert (=> d!57803 (= lt!107607 (lemmaContainsTupThenGetReturnValue!137 lt!107610 (_1!2074 lt!107397) (_2!2074 lt!107397)))))

(assert (=> d!57803 (= lt!107610 (insertStrictlySorted!140 (toList!1530 lt!107393) (_1!2074 lt!107397) (_2!2074 lt!107397)))))

(assert (=> d!57803 (= (+!554 lt!107393 lt!107397) lt!107608)))

(declare-fun b!210298 () Bool)

(declare-fun res!102577 () Bool)

(assert (=> b!210298 (=> (not res!102577) (not e!136939))))

(assert (=> b!210298 (= res!102577 (= (getValueByKey!247 (toList!1530 lt!107608) (_1!2074 lt!107397)) (Some!252 (_2!2074 lt!107397))))))

(declare-fun b!210299 () Bool)

(assert (=> b!210299 (= e!136939 (contains!1374 (toList!1530 lt!107608) lt!107397))))

(assert (= (and d!57803 res!102576) b!210298))

(assert (= (and b!210298 res!102577) b!210299))

(declare-fun m!237349 () Bool)

(assert (=> d!57803 m!237349))

(declare-fun m!237351 () Bool)

(assert (=> d!57803 m!237351))

(declare-fun m!237353 () Bool)

(assert (=> d!57803 m!237353))

(declare-fun m!237355 () Bool)

(assert (=> d!57803 m!237355))

(declare-fun m!237357 () Bool)

(assert (=> b!210298 m!237357))

(declare-fun m!237359 () Bool)

(assert (=> b!210299 m!237359))

(assert (=> b!210037 d!57803))

(declare-fun d!57805 () Bool)

(declare-fun e!136940 () Bool)

(assert (=> d!57805 e!136940))

(declare-fun res!102578 () Bool)

(assert (=> d!57805 (=> (not res!102578) (not e!136940))))

(declare-fun lt!107612 () ListLongMap!3029)

(assert (=> d!57805 (= res!102578 (contains!1373 lt!107612 (_1!2074 lt!107394)))))

(declare-fun lt!107614 () List!3035)

(assert (=> d!57805 (= lt!107612 (ListLongMap!3030 lt!107614))))

(declare-fun lt!107613 () Unit!6348)

(declare-fun lt!107611 () Unit!6348)

(assert (=> d!57805 (= lt!107613 lt!107611)))

(assert (=> d!57805 (= (getValueByKey!247 lt!107614 (_1!2074 lt!107394)) (Some!252 (_2!2074 lt!107394)))))

(assert (=> d!57805 (= lt!107611 (lemmaContainsTupThenGetReturnValue!137 lt!107614 (_1!2074 lt!107394) (_2!2074 lt!107394)))))

(assert (=> d!57805 (= lt!107614 (insertStrictlySorted!140 (toList!1530 (+!554 lt!107398 lt!107397)) (_1!2074 lt!107394) (_2!2074 lt!107394)))))

(assert (=> d!57805 (= (+!554 (+!554 lt!107398 lt!107397) lt!107394) lt!107612)))

(declare-fun b!210300 () Bool)

(declare-fun res!102579 () Bool)

(assert (=> b!210300 (=> (not res!102579) (not e!136940))))

(assert (=> b!210300 (= res!102579 (= (getValueByKey!247 (toList!1530 lt!107612) (_1!2074 lt!107394)) (Some!252 (_2!2074 lt!107394))))))

(declare-fun b!210301 () Bool)

(assert (=> b!210301 (= e!136940 (contains!1374 (toList!1530 lt!107612) lt!107394))))

(assert (= (and d!57805 res!102578) b!210300))

(assert (= (and b!210300 res!102579) b!210301))

(declare-fun m!237361 () Bool)

(assert (=> d!57805 m!237361))

(declare-fun m!237363 () Bool)

(assert (=> d!57805 m!237363))

(declare-fun m!237365 () Bool)

(assert (=> d!57805 m!237365))

(declare-fun m!237367 () Bool)

(assert (=> d!57805 m!237367))

(declare-fun m!237369 () Bool)

(assert (=> b!210300 m!237369))

(declare-fun m!237371 () Bool)

(assert (=> b!210301 m!237371))

(assert (=> b!210032 d!57805))

(declare-fun d!57807 () Bool)

(declare-fun e!136941 () Bool)

(assert (=> d!57807 e!136941))

(declare-fun res!102580 () Bool)

(assert (=> d!57807 (=> (not res!102580) (not e!136941))))

(declare-fun lt!107616 () ListLongMap!3029)

(assert (=> d!57807 (= res!102580 (contains!1373 lt!107616 (_1!2074 lt!107397)))))

(declare-fun lt!107618 () List!3035)

(assert (=> d!57807 (= lt!107616 (ListLongMap!3030 lt!107618))))

(declare-fun lt!107617 () Unit!6348)

(declare-fun lt!107615 () Unit!6348)

(assert (=> d!57807 (= lt!107617 lt!107615)))

(assert (=> d!57807 (= (getValueByKey!247 lt!107618 (_1!2074 lt!107397)) (Some!252 (_2!2074 lt!107397)))))

(assert (=> d!57807 (= lt!107615 (lemmaContainsTupThenGetReturnValue!137 lt!107618 (_1!2074 lt!107397) (_2!2074 lt!107397)))))

(assert (=> d!57807 (= lt!107618 (insertStrictlySorted!140 (toList!1530 lt!107398) (_1!2074 lt!107397) (_2!2074 lt!107397)))))

(assert (=> d!57807 (= (+!554 lt!107398 lt!107397) lt!107616)))

(declare-fun b!210302 () Bool)

(declare-fun res!102581 () Bool)

(assert (=> b!210302 (=> (not res!102581) (not e!136941))))

(assert (=> b!210302 (= res!102581 (= (getValueByKey!247 (toList!1530 lt!107616) (_1!2074 lt!107397)) (Some!252 (_2!2074 lt!107397))))))

(declare-fun b!210303 () Bool)

(assert (=> b!210303 (= e!136941 (contains!1374 (toList!1530 lt!107616) lt!107397))))

(assert (= (and d!57807 res!102580) b!210302))

(assert (= (and b!210302 res!102581) b!210303))

(declare-fun m!237373 () Bool)

(assert (=> d!57807 m!237373))

(declare-fun m!237375 () Bool)

(assert (=> d!57807 m!237375))

(declare-fun m!237377 () Bool)

(assert (=> d!57807 m!237377))

(declare-fun m!237379 () Bool)

(assert (=> d!57807 m!237379))

(declare-fun m!237381 () Bool)

(assert (=> b!210302 m!237381))

(declare-fun m!237383 () Bool)

(assert (=> b!210303 m!237383))

(assert (=> b!210032 d!57807))

(declare-fun d!57809 () Bool)

(assert (=> d!57809 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20930 d!57809))

(declare-fun d!57811 () Bool)

(assert (=> d!57811 (= (array_inv!3113 _values!649) (bvsge (size!5069 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20930 d!57811))

(declare-fun d!57813 () Bool)

(assert (=> d!57813 (= (array_inv!3114 _keys!825) (bvsge (size!5068 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20930 d!57813))

(declare-fun mapIsEmpty!9185 () Bool)

(declare-fun mapRes!9185 () Bool)

(assert (=> mapIsEmpty!9185 mapRes!9185))

(declare-fun b!210311 () Bool)

(declare-fun e!136947 () Bool)

(assert (=> b!210311 (= e!136947 tp_is_empty!5401)))

(declare-fun mapNonEmpty!9185 () Bool)

(declare-fun tp!19679 () Bool)

(declare-fun e!136946 () Bool)

(assert (=> mapNonEmpty!9185 (= mapRes!9185 (and tp!19679 e!136946))))

(declare-fun mapValue!9185 () ValueCell!2357)

(declare-fun mapRest!9185 () (Array (_ BitVec 32) ValueCell!2357))

(declare-fun mapKey!9185 () (_ BitVec 32))

(assert (=> mapNonEmpty!9185 (= mapRest!9176 (store mapRest!9185 mapKey!9185 mapValue!9185))))

(declare-fun condMapEmpty!9185 () Bool)

(declare-fun mapDefault!9185 () ValueCell!2357)

(assert (=> mapNonEmpty!9176 (= condMapEmpty!9185 (= mapRest!9176 ((as const (Array (_ BitVec 32) ValueCell!2357)) mapDefault!9185)))))

(assert (=> mapNonEmpty!9176 (= tp!19664 (and e!136947 mapRes!9185))))

(declare-fun b!210310 () Bool)

(assert (=> b!210310 (= e!136946 tp_is_empty!5401)))

(assert (= (and mapNonEmpty!9176 condMapEmpty!9185) mapIsEmpty!9185))

(assert (= (and mapNonEmpty!9176 (not condMapEmpty!9185)) mapNonEmpty!9185))

(assert (= (and mapNonEmpty!9185 ((_ is ValueCellFull!2357) mapValue!9185)) b!210310))

(assert (= (and mapNonEmpty!9176 ((_ is ValueCellFull!2357) mapDefault!9185)) b!210311))

(declare-fun m!237385 () Bool)

(assert (=> mapNonEmpty!9185 m!237385))

(declare-fun b_lambda!7581 () Bool)

(assert (= b_lambda!7579 (or (and start!20930 b_free!5539) b_lambda!7581)))

(declare-fun b_lambda!7583 () Bool)

(assert (= b_lambda!7573 (or (and start!20930 b_free!5539) b_lambda!7583)))

(declare-fun b_lambda!7585 () Bool)

(assert (= b_lambda!7577 (or (and start!20930 b_free!5539) b_lambda!7585)))

(declare-fun b_lambda!7587 () Bool)

(assert (= b_lambda!7569 (or (and start!20930 b_free!5539) b_lambda!7587)))

(declare-fun b_lambda!7589 () Bool)

(assert (= b_lambda!7575 (or (and start!20930 b_free!5539) b_lambda!7589)))

(declare-fun b_lambda!7591 () Bool)

(assert (= b_lambda!7571 (or (and start!20930 b_free!5539) b_lambda!7591)))

(check-sat (not bm!19871) (not b!210162) (not d!57783) (not mapNonEmpty!9185) (not b!210289) (not b!210276) (not bm!19874) (not b!210223) (not bm!19878) b_and!12299 (not b!210239) (not b!210180) (not bm!19881) (not b!210294) (not b!210158) (not b!210231) (not b!210165) (not d!57803) (not b!210296) (not b!210242) (not d!57805) (not d!57799) (not b_next!5539) (not b!210159) (not b!210244) (not bm!19843) (not bm!19870) (not bm!19849) (not b!210133) (not b!210293) tp_is_empty!5401 (not d!57807) (not b_lambda!7589) (not b!210265) (not b!210252) (not b!210249) (not d!57787) (not bm!19840) (not b!210255) (not b!210275) (not d!57785) (not b!210291) (not b!210295) (not b!210269) (not bm!19848) (not b_lambda!7585) (not b!210168) (not b!210126) (not b!210266) (not b!210301) (not bm!19876) (not b!210263) (not b!210302) (not b!210161) (not b!210236) (not b!210298) (not b!210228) (not b!210290) (not b!210229) (not bm!19869) (not b_lambda!7581) (not b!210234) (not b!210260) (not d!57797) (not d!57801) (not b!210132) (not b!210124) (not b!210299) (not b!210292) (not b_lambda!7587) (not b!210250) (not b_lambda!7583) (not b!210257) (not bm!19864) (not bm!19867) (not b!210300) (not d!57791) (not b!210169) (not b!210268) (not b!210297) (not b!210160) (not d!57793) (not d!57789) (not b!210267) (not b_lambda!7591) (not bm!19877) (not b!210272) (not b!210303))
(check-sat b_and!12299 (not b_next!5539))
