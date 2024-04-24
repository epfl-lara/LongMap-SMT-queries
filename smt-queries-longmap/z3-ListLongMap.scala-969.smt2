; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20996 () Bool)

(assert start!20996)

(declare-fun b_free!5563 () Bool)

(declare-fun b_next!5563 () Bool)

(assert (=> start!20996 (= b_free!5563 (not b_next!5563))))

(declare-fun tp!19741 () Bool)

(declare-fun b_and!12371 () Bool)

(assert (=> start!20996 (= tp!19741 b_and!12371)))

(declare-fun b!211041 () Bool)

(declare-fun res!103040 () Bool)

(declare-fun e!137392 () Bool)

(assert (=> b!211041 (=> (not res!103040) (not e!137392))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211041 (= res!103040 (validKeyInArray!0 k0!843))))

(declare-fun e!137388 () Bool)

(declare-datatypes ((V!6881 0))(
  ( (V!6882 (val!2757 Int)) )
))
(declare-datatypes ((tuple2!4114 0))(
  ( (tuple2!4115 (_1!2068 (_ BitVec 64)) (_2!2068 V!6881)) )
))
(declare-datatypes ((List!2999 0))(
  ( (Nil!2996) (Cons!2995 (h!3637 tuple2!4114) (t!7930 List!2999)) )
))
(declare-datatypes ((ListLongMap!3029 0))(
  ( (ListLongMap!3030 (toList!1530 List!2999)) )
))
(declare-fun lt!108450 () ListLongMap!3029)

(declare-fun lt!108452 () ListLongMap!3029)

(declare-fun b!211042 () Bool)

(declare-fun zeroValue!615 () V!6881)

(declare-fun +!559 (ListLongMap!3029 tuple2!4114) ListLongMap!3029)

(assert (=> b!211042 (= e!137388 (= lt!108450 (+!559 lt!108452 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun b!211043 () Bool)

(declare-fun res!103041 () Bool)

(assert (=> b!211043 (=> (not res!103041) (not e!137392))))

(declare-datatypes ((array!10045 0))(
  ( (array!10046 (arr!4769 (Array (_ BitVec 32) (_ BitVec 64))) (size!5094 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10045)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2369 0))(
  ( (ValueCellFull!2369 (v!4744 V!6881)) (EmptyCell!2369) )
))
(declare-datatypes ((array!10047 0))(
  ( (array!10048 (arr!4770 (Array (_ BitVec 32) ValueCell!2369)) (size!5095 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10047)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!211043 (= res!103041 (and (= (size!5095 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5094 _keys!825) (size!5095 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211044 () Bool)

(declare-fun e!137393 () Bool)

(declare-fun e!137390 () Bool)

(declare-fun mapRes!9218 () Bool)

(assert (=> b!211044 (= e!137393 (and e!137390 mapRes!9218))))

(declare-fun condMapEmpty!9218 () Bool)

(declare-fun mapDefault!9218 () ValueCell!2369)

(assert (=> b!211044 (= condMapEmpty!9218 (= (arr!4770 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2369)) mapDefault!9218)))))

(declare-fun mapIsEmpty!9218 () Bool)

(assert (=> mapIsEmpty!9218 mapRes!9218))

(declare-fun b!211045 () Bool)

(declare-fun res!103045 () Bool)

(assert (=> b!211045 (=> (not res!103045) (not e!137392))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211045 (= res!103045 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5094 _keys!825))))))

(declare-fun b!211046 () Bool)

(declare-fun e!137389 () Bool)

(declare-fun tp_is_empty!5425 () Bool)

(assert (=> b!211046 (= e!137389 tp_is_empty!5425)))

(declare-fun res!103042 () Bool)

(assert (=> start!20996 (=> (not res!103042) (not e!137392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20996 (= res!103042 (validMask!0 mask!1149))))

(assert (=> start!20996 e!137392))

(declare-fun array_inv!3129 (array!10047) Bool)

(assert (=> start!20996 (and (array_inv!3129 _values!649) e!137393)))

(assert (=> start!20996 true))

(assert (=> start!20996 tp_is_empty!5425))

(declare-fun array_inv!3130 (array!10045) Bool)

(assert (=> start!20996 (array_inv!3130 _keys!825)))

(assert (=> start!20996 tp!19741))

(declare-fun b!211047 () Bool)

(assert (=> b!211047 (= e!137390 tp_is_empty!5425)))

(declare-fun b!211048 () Bool)

(declare-fun res!103044 () Bool)

(assert (=> b!211048 (=> (not res!103044) (not e!137392))))

(assert (=> b!211048 (= res!103044 (= (select (arr!4769 _keys!825) i!601) k0!843))))

(declare-fun b!211049 () Bool)

(declare-fun res!103038 () Bool)

(assert (=> b!211049 (=> (not res!103038) (not e!137392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10045 (_ BitVec 32)) Bool)

(assert (=> b!211049 (= res!103038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!9218 () Bool)

(declare-fun tp!19742 () Bool)

(assert (=> mapNonEmpty!9218 (= mapRes!9218 (and tp!19742 e!137389))))

(declare-fun mapRest!9218 () (Array (_ BitVec 32) ValueCell!2369))

(declare-fun mapKey!9218 () (_ BitVec 32))

(declare-fun mapValue!9218 () ValueCell!2369)

(assert (=> mapNonEmpty!9218 (= (arr!4770 _values!649) (store mapRest!9218 mapKey!9218 mapValue!9218))))

(declare-fun b!211050 () Bool)

(declare-fun res!103039 () Bool)

(assert (=> b!211050 (=> (not res!103039) (not e!137392))))

(declare-datatypes ((List!3000 0))(
  ( (Nil!2997) (Cons!2996 (h!3638 (_ BitVec 64)) (t!7931 List!3000)) )
))
(declare-fun arrayNoDuplicates!0 (array!10045 (_ BitVec 32) List!3000) Bool)

(assert (=> b!211050 (= res!103039 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2997))))

(declare-fun b!211051 () Bool)

(assert (=> b!211051 (= e!137392 (not e!137388))))

(declare-fun res!103043 () Bool)

(assert (=> b!211051 (=> res!103043 e!137388)))

(assert (=> b!211051 (= res!103043 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6881)

(declare-fun lt!108454 () ListLongMap!3029)

(declare-fun getCurrentListMap!1067 (array!10045 array!10047 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) Int) ListLongMap!3029)

(assert (=> b!211051 (= lt!108454 (getCurrentListMap!1067 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108449 () array!10047)

(assert (=> b!211051 (= lt!108450 (getCurrentListMap!1067 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108455 () ListLongMap!3029)

(assert (=> b!211051 (and (= lt!108452 lt!108455) (= lt!108455 lt!108452))))

(declare-fun v!520 () V!6881)

(declare-fun lt!108453 () ListLongMap!3029)

(assert (=> b!211051 (= lt!108455 (+!559 lt!108453 (tuple2!4115 k0!843 v!520)))))

(declare-datatypes ((Unit!6400 0))(
  ( (Unit!6401) )
))
(declare-fun lt!108451 () Unit!6400)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!208 (array!10045 array!10047 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) (_ BitVec 64) V!6881 (_ BitVec 32) Int) Unit!6400)

(assert (=> b!211051 (= lt!108451 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!208 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!490 (array!10045 array!10047 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) Int) ListLongMap!3029)

(assert (=> b!211051 (= lt!108452 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211051 (= lt!108449 (array!10048 (store (arr!4770 _values!649) i!601 (ValueCellFull!2369 v!520)) (size!5095 _values!649)))))

(assert (=> b!211051 (= lt!108453 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20996 res!103042) b!211043))

(assert (= (and b!211043 res!103041) b!211049))

(assert (= (and b!211049 res!103038) b!211050))

(assert (= (and b!211050 res!103039) b!211045))

(assert (= (and b!211045 res!103045) b!211041))

(assert (= (and b!211041 res!103040) b!211048))

(assert (= (and b!211048 res!103044) b!211051))

(assert (= (and b!211051 (not res!103043)) b!211042))

(assert (= (and b!211044 condMapEmpty!9218) mapIsEmpty!9218))

(assert (= (and b!211044 (not condMapEmpty!9218)) mapNonEmpty!9218))

(get-info :version)

(assert (= (and mapNonEmpty!9218 ((_ is ValueCellFull!2369) mapValue!9218)) b!211046))

(assert (= (and b!211044 ((_ is ValueCellFull!2369) mapDefault!9218)) b!211047))

(assert (= start!20996 b!211044))

(declare-fun m!238913 () Bool)

(assert (=> b!211048 m!238913))

(declare-fun m!238915 () Bool)

(assert (=> b!211051 m!238915))

(declare-fun m!238917 () Bool)

(assert (=> b!211051 m!238917))

(declare-fun m!238919 () Bool)

(assert (=> b!211051 m!238919))

(declare-fun m!238921 () Bool)

(assert (=> b!211051 m!238921))

(declare-fun m!238923 () Bool)

(assert (=> b!211051 m!238923))

(declare-fun m!238925 () Bool)

(assert (=> b!211051 m!238925))

(declare-fun m!238927 () Bool)

(assert (=> b!211051 m!238927))

(declare-fun m!238929 () Bool)

(assert (=> b!211041 m!238929))

(declare-fun m!238931 () Bool)

(assert (=> start!20996 m!238931))

(declare-fun m!238933 () Bool)

(assert (=> start!20996 m!238933))

(declare-fun m!238935 () Bool)

(assert (=> start!20996 m!238935))

(declare-fun m!238937 () Bool)

(assert (=> mapNonEmpty!9218 m!238937))

(declare-fun m!238939 () Bool)

(assert (=> b!211042 m!238939))

(declare-fun m!238941 () Bool)

(assert (=> b!211050 m!238941))

(declare-fun m!238943 () Bool)

(assert (=> b!211049 m!238943))

(check-sat b_and!12371 (not b_next!5563) (not b!211042) tp_is_empty!5425 (not start!20996) (not b!211050) (not b!211041) (not b!211051) (not mapNonEmpty!9218) (not b!211049))
(check-sat b_and!12371 (not b_next!5563))
(get-model)

(declare-fun b!211126 () Bool)

(declare-fun e!137437 () Bool)

(declare-fun call!19943 () Bool)

(assert (=> b!211126 (= e!137437 call!19943)))

(declare-fun b!211127 () Bool)

(declare-fun e!137438 () Bool)

(assert (=> b!211127 (= e!137438 call!19943)))

(declare-fun b!211128 () Bool)

(declare-fun e!137436 () Bool)

(assert (=> b!211128 (= e!137436 e!137438)))

(declare-fun c!35647 () Bool)

(assert (=> b!211128 (= c!35647 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19940 () Bool)

(assert (=> bm!19940 (= call!19943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun d!58085 () Bool)

(declare-fun res!103099 () Bool)

(assert (=> d!58085 (=> res!103099 e!137436)))

(assert (=> d!58085 (= res!103099 (bvsge #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(assert (=> d!58085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137436)))

(declare-fun b!211129 () Bool)

(assert (=> b!211129 (= e!137438 e!137437)))

(declare-fun lt!108505 () (_ BitVec 64))

(assert (=> b!211129 (= lt!108505 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108506 () Unit!6400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10045 (_ BitVec 64) (_ BitVec 32)) Unit!6400)

(assert (=> b!211129 (= lt!108506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!108505 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!211129 (arrayContainsKey!0 _keys!825 lt!108505 #b00000000000000000000000000000000)))

(declare-fun lt!108504 () Unit!6400)

(assert (=> b!211129 (= lt!108504 lt!108506)))

(declare-fun res!103098 () Bool)

(declare-datatypes ((SeekEntryResult!697 0))(
  ( (MissingZero!697 (index!4958 (_ BitVec 32))) (Found!697 (index!4959 (_ BitVec 32))) (Intermediate!697 (undefined!1509 Bool) (index!4960 (_ BitVec 32)) (x!22067 (_ BitVec 32))) (Undefined!697) (MissingVacant!697 (index!4961 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10045 (_ BitVec 32)) SeekEntryResult!697)

(assert (=> b!211129 (= res!103098 (= (seekEntryOrOpen!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!697 #b00000000000000000000000000000000)))))

(assert (=> b!211129 (=> (not res!103098) (not e!137437))))

(assert (= (and d!58085 (not res!103099)) b!211128))

(assert (= (and b!211128 c!35647) b!211129))

(assert (= (and b!211128 (not c!35647)) b!211127))

(assert (= (and b!211129 res!103098) b!211126))

(assert (= (or b!211126 b!211127) bm!19940))

(declare-fun m!239009 () Bool)

(assert (=> b!211128 m!239009))

(assert (=> b!211128 m!239009))

(declare-fun m!239011 () Bool)

(assert (=> b!211128 m!239011))

(declare-fun m!239013 () Bool)

(assert (=> bm!19940 m!239013))

(assert (=> b!211129 m!239009))

(declare-fun m!239015 () Bool)

(assert (=> b!211129 m!239015))

(declare-fun m!239017 () Bool)

(assert (=> b!211129 m!239017))

(assert (=> b!211129 m!239009))

(declare-fun m!239019 () Bool)

(assert (=> b!211129 m!239019))

(assert (=> b!211049 d!58085))

(declare-fun d!58087 () Bool)

(assert (=> d!58087 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20996 d!58087))

(declare-fun d!58089 () Bool)

(assert (=> d!58089 (= (array_inv!3129 _values!649) (bvsge (size!5095 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20996 d!58089))

(declare-fun d!58091 () Bool)

(assert (=> d!58091 (= (array_inv!3130 _keys!825) (bvsge (size!5094 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20996 d!58091))

(declare-fun d!58093 () Bool)

(declare-fun e!137441 () Bool)

(assert (=> d!58093 e!137441))

(declare-fun res!103105 () Bool)

(assert (=> d!58093 (=> (not res!103105) (not e!137441))))

(declare-fun lt!108516 () ListLongMap!3029)

(declare-fun contains!1384 (ListLongMap!3029 (_ BitVec 64)) Bool)

(assert (=> d!58093 (= res!103105 (contains!1384 lt!108516 (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lt!108518 () List!2999)

(assert (=> d!58093 (= lt!108516 (ListLongMap!3030 lt!108518))))

(declare-fun lt!108517 () Unit!6400)

(declare-fun lt!108515 () Unit!6400)

(assert (=> d!58093 (= lt!108517 lt!108515)))

(declare-datatypes ((Option!258 0))(
  ( (Some!257 (v!4750 V!6881)) (None!256) )
))
(declare-fun getValueByKey!252 (List!2999 (_ BitVec 64)) Option!258)

(assert (=> d!58093 (= (getValueByKey!252 lt!108518 (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!257 (_2!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lemmaContainsTupThenGetReturnValue!139 (List!2999 (_ BitVec 64) V!6881) Unit!6400)

(assert (=> d!58093 (= lt!108515 (lemmaContainsTupThenGetReturnValue!139 lt!108518 (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun insertStrictlySorted!142 (List!2999 (_ BitVec 64) V!6881) List!2999)

(assert (=> d!58093 (= lt!108518 (insertStrictlySorted!142 (toList!1530 lt!108452) (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!58093 (= (+!559 lt!108452 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) lt!108516)))

(declare-fun b!211134 () Bool)

(declare-fun res!103104 () Bool)

(assert (=> b!211134 (=> (not res!103104) (not e!137441))))

(assert (=> b!211134 (= res!103104 (= (getValueByKey!252 (toList!1530 lt!108516) (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!257 (_2!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))))

(declare-fun b!211135 () Bool)

(declare-fun contains!1385 (List!2999 tuple2!4114) Bool)

(assert (=> b!211135 (= e!137441 (contains!1385 (toList!1530 lt!108516) (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))

(assert (= (and d!58093 res!103105) b!211134))

(assert (= (and b!211134 res!103104) b!211135))

(declare-fun m!239021 () Bool)

(assert (=> d!58093 m!239021))

(declare-fun m!239023 () Bool)

(assert (=> d!58093 m!239023))

(declare-fun m!239025 () Bool)

(assert (=> d!58093 m!239025))

(declare-fun m!239027 () Bool)

(assert (=> d!58093 m!239027))

(declare-fun m!239029 () Bool)

(assert (=> b!211134 m!239029))

(declare-fun m!239031 () Bool)

(assert (=> b!211135 m!239031))

(assert (=> b!211042 d!58093))

(declare-fun d!58095 () Bool)

(declare-fun e!137442 () Bool)

(assert (=> d!58095 e!137442))

(declare-fun res!103107 () Bool)

(assert (=> d!58095 (=> (not res!103107) (not e!137442))))

(declare-fun lt!108520 () ListLongMap!3029)

(assert (=> d!58095 (= res!103107 (contains!1384 lt!108520 (_1!2068 (tuple2!4115 k0!843 v!520))))))

(declare-fun lt!108522 () List!2999)

(assert (=> d!58095 (= lt!108520 (ListLongMap!3030 lt!108522))))

(declare-fun lt!108521 () Unit!6400)

(declare-fun lt!108519 () Unit!6400)

(assert (=> d!58095 (= lt!108521 lt!108519)))

(assert (=> d!58095 (= (getValueByKey!252 lt!108522 (_1!2068 (tuple2!4115 k0!843 v!520))) (Some!257 (_2!2068 (tuple2!4115 k0!843 v!520))))))

(assert (=> d!58095 (= lt!108519 (lemmaContainsTupThenGetReturnValue!139 lt!108522 (_1!2068 (tuple2!4115 k0!843 v!520)) (_2!2068 (tuple2!4115 k0!843 v!520))))))

(assert (=> d!58095 (= lt!108522 (insertStrictlySorted!142 (toList!1530 lt!108453) (_1!2068 (tuple2!4115 k0!843 v!520)) (_2!2068 (tuple2!4115 k0!843 v!520))))))

(assert (=> d!58095 (= (+!559 lt!108453 (tuple2!4115 k0!843 v!520)) lt!108520)))

(declare-fun b!211136 () Bool)

(declare-fun res!103106 () Bool)

(assert (=> b!211136 (=> (not res!103106) (not e!137442))))

(assert (=> b!211136 (= res!103106 (= (getValueByKey!252 (toList!1530 lt!108520) (_1!2068 (tuple2!4115 k0!843 v!520))) (Some!257 (_2!2068 (tuple2!4115 k0!843 v!520)))))))

(declare-fun b!211137 () Bool)

(assert (=> b!211137 (= e!137442 (contains!1385 (toList!1530 lt!108520) (tuple2!4115 k0!843 v!520)))))

(assert (= (and d!58095 res!103107) b!211136))

(assert (= (and b!211136 res!103106) b!211137))

(declare-fun m!239033 () Bool)

(assert (=> d!58095 m!239033))

(declare-fun m!239035 () Bool)

(assert (=> d!58095 m!239035))

(declare-fun m!239037 () Bool)

(assert (=> d!58095 m!239037))

(declare-fun m!239039 () Bool)

(assert (=> d!58095 m!239039))

(declare-fun m!239041 () Bool)

(assert (=> b!211136 m!239041))

(declare-fun m!239043 () Bool)

(assert (=> b!211137 m!239043))

(assert (=> b!211051 d!58095))

(declare-fun b!211162 () Bool)

(declare-fun e!137457 () Bool)

(declare-fun e!137460 () Bool)

(assert (=> b!211162 (= e!137457 e!137460)))

(assert (=> b!211162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun res!103116 () Bool)

(declare-fun lt!108541 () ListLongMap!3029)

(assert (=> b!211162 (= res!103116 (contains!1384 lt!108541 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211162 (=> (not res!103116) (not e!137460))))

(declare-fun b!211163 () Bool)

(declare-fun e!137462 () ListLongMap!3029)

(assert (=> b!211163 (= e!137462 (ListLongMap!3030 Nil!2996))))

(declare-fun call!19946 () ListLongMap!3029)

(declare-fun bm!19943 () Bool)

(assert (=> bm!19943 (= call!19946 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211164 () Bool)

(declare-fun e!137461 () Bool)

(assert (=> b!211164 (= e!137457 e!137461)))

(declare-fun c!35658 () Bool)

(assert (=> b!211164 (= c!35658 (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun b!211165 () Bool)

(declare-fun res!103118 () Bool)

(declare-fun e!137463 () Bool)

(assert (=> b!211165 (=> (not res!103118) (not e!137463))))

(assert (=> b!211165 (= res!103118 (not (contains!1384 lt!108541 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211166 () Bool)

(declare-fun e!137459 () Bool)

(assert (=> b!211166 (= e!137459 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211166 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211167 () Bool)

(declare-fun isEmpty!500 (ListLongMap!3029) Bool)

(assert (=> b!211167 (= e!137461 (isEmpty!500 lt!108541))))

(declare-fun d!58097 () Bool)

(assert (=> d!58097 e!137463))

(declare-fun res!103119 () Bool)

(assert (=> d!58097 (=> (not res!103119) (not e!137463))))

(assert (=> d!58097 (= res!103119 (not (contains!1384 lt!108541 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58097 (= lt!108541 e!137462)))

(declare-fun c!35656 () Bool)

(assert (=> d!58097 (= c!35656 (bvsge #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(assert (=> d!58097 (validMask!0 mask!1149)))

(assert (=> d!58097 (= (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108541)))

(declare-fun b!211168 () Bool)

(assert (=> b!211168 (= e!137463 e!137457)))

(declare-fun c!35657 () Bool)

(assert (=> b!211168 (= c!35657 e!137459)))

(declare-fun res!103117 () Bool)

(assert (=> b!211168 (=> (not res!103117) (not e!137459))))

(assert (=> b!211168 (= res!103117 (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun b!211169 () Bool)

(declare-fun lt!108540 () Unit!6400)

(declare-fun lt!108543 () Unit!6400)

(assert (=> b!211169 (= lt!108540 lt!108543)))

(declare-fun lt!108542 () (_ BitVec 64))

(declare-fun lt!108539 () V!6881)

(declare-fun lt!108538 () ListLongMap!3029)

(declare-fun lt!108537 () (_ BitVec 64))

(assert (=> b!211169 (not (contains!1384 (+!559 lt!108538 (tuple2!4115 lt!108537 lt!108539)) lt!108542))))

(declare-fun addStillNotContains!104 (ListLongMap!3029 (_ BitVec 64) V!6881 (_ BitVec 64)) Unit!6400)

(assert (=> b!211169 (= lt!108543 (addStillNotContains!104 lt!108538 lt!108537 lt!108539 lt!108542))))

(assert (=> b!211169 (= lt!108542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2563 (ValueCell!2369 V!6881) V!6881)

(declare-fun dynLambda!536 (Int (_ BitVec 64)) V!6881)

(assert (=> b!211169 (= lt!108539 (get!2563 (select (arr!4770 _values!649) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211169 (= lt!108537 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211169 (= lt!108538 call!19946)))

(declare-fun e!137458 () ListLongMap!3029)

(assert (=> b!211169 (= e!137458 (+!559 call!19946 (tuple2!4115 (select (arr!4769 _keys!825) #b00000000000000000000000000000000) (get!2563 (select (arr!4770 _values!649) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211170 () Bool)

(assert (=> b!211170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(assert (=> b!211170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5095 _values!649)))))

(declare-fun apply!193 (ListLongMap!3029 (_ BitVec 64)) V!6881)

(assert (=> b!211170 (= e!137460 (= (apply!193 lt!108541 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)) (get!2563 (select (arr!4770 _values!649) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211171 () Bool)

(assert (=> b!211171 (= e!137462 e!137458)))

(declare-fun c!35659 () Bool)

(assert (=> b!211171 (= c!35659 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211172 () Bool)

(assert (=> b!211172 (= e!137461 (= lt!108541 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211173 () Bool)

(assert (=> b!211173 (= e!137458 call!19946)))

(assert (= (and d!58097 c!35656) b!211163))

(assert (= (and d!58097 (not c!35656)) b!211171))

(assert (= (and b!211171 c!35659) b!211169))

(assert (= (and b!211171 (not c!35659)) b!211173))

(assert (= (or b!211169 b!211173) bm!19943))

(assert (= (and d!58097 res!103119) b!211165))

(assert (= (and b!211165 res!103118) b!211168))

(assert (= (and b!211168 res!103117) b!211166))

(assert (= (and b!211168 c!35657) b!211162))

(assert (= (and b!211168 (not c!35657)) b!211164))

(assert (= (and b!211162 res!103116) b!211170))

(assert (= (and b!211164 c!35658) b!211172))

(assert (= (and b!211164 (not c!35658)) b!211167))

(declare-fun b_lambda!7657 () Bool)

(assert (=> (not b_lambda!7657) (not b!211169)))

(declare-fun t!7937 () Bool)

(declare-fun tb!2891 () Bool)

(assert (=> (and start!20996 (= defaultEntry!657 defaultEntry!657) t!7937) tb!2891))

(declare-fun result!4977 () Bool)

(assert (=> tb!2891 (= result!4977 tp_is_empty!5425)))

(assert (=> b!211169 t!7937))

(declare-fun b_and!12377 () Bool)

(assert (= b_and!12371 (and (=> t!7937 result!4977) b_and!12377)))

(declare-fun b_lambda!7659 () Bool)

(assert (=> (not b_lambda!7659) (not b!211170)))

(assert (=> b!211170 t!7937))

(declare-fun b_and!12379 () Bool)

(assert (= b_and!12377 (and (=> t!7937 result!4977) b_and!12379)))

(declare-fun m!239045 () Bool)

(assert (=> b!211169 m!239045))

(declare-fun m!239047 () Bool)

(assert (=> b!211169 m!239047))

(declare-fun m!239049 () Bool)

(assert (=> b!211169 m!239049))

(declare-fun m!239051 () Bool)

(assert (=> b!211169 m!239051))

(assert (=> b!211169 m!239009))

(assert (=> b!211169 m!239045))

(declare-fun m!239053 () Bool)

(assert (=> b!211169 m!239053))

(declare-fun m!239055 () Bool)

(assert (=> b!211169 m!239055))

(assert (=> b!211169 m!239051))

(assert (=> b!211169 m!239055))

(declare-fun m!239057 () Bool)

(assert (=> b!211169 m!239057))

(assert (=> b!211166 m!239009))

(assert (=> b!211166 m!239009))

(assert (=> b!211166 m!239011))

(assert (=> b!211162 m!239009))

(assert (=> b!211162 m!239009))

(declare-fun m!239059 () Bool)

(assert (=> b!211162 m!239059))

(declare-fun m!239061 () Bool)

(assert (=> bm!19943 m!239061))

(assert (=> b!211171 m!239009))

(assert (=> b!211171 m!239009))

(assert (=> b!211171 m!239011))

(declare-fun m!239063 () Bool)

(assert (=> b!211165 m!239063))

(assert (=> b!211172 m!239061))

(assert (=> b!211170 m!239051))

(assert (=> b!211170 m!239009))

(assert (=> b!211170 m!239055))

(assert (=> b!211170 m!239051))

(assert (=> b!211170 m!239055))

(assert (=> b!211170 m!239057))

(assert (=> b!211170 m!239009))

(declare-fun m!239065 () Bool)

(assert (=> b!211170 m!239065))

(declare-fun m!239067 () Bool)

(assert (=> d!58097 m!239067))

(assert (=> d!58097 m!238931))

(declare-fun m!239069 () Bool)

(assert (=> b!211167 m!239069))

(assert (=> b!211051 d!58097))

(declare-fun b!211218 () Bool)

(declare-fun e!137500 () Unit!6400)

(declare-fun lt!108608 () Unit!6400)

(assert (=> b!211218 (= e!137500 lt!108608)))

(declare-fun lt!108595 () ListLongMap!3029)

(assert (=> b!211218 (= lt!108595 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108592 () (_ BitVec 64))

(assert (=> b!211218 (= lt!108592 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108597 () (_ BitVec 64))

(assert (=> b!211218 (= lt!108597 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108599 () Unit!6400)

(declare-fun addStillContains!169 (ListLongMap!3029 (_ BitVec 64) V!6881 (_ BitVec 64)) Unit!6400)

(assert (=> b!211218 (= lt!108599 (addStillContains!169 lt!108595 lt!108592 zeroValue!615 lt!108597))))

(assert (=> b!211218 (contains!1384 (+!559 lt!108595 (tuple2!4115 lt!108592 zeroValue!615)) lt!108597)))

(declare-fun lt!108607 () Unit!6400)

(assert (=> b!211218 (= lt!108607 lt!108599)))

(declare-fun lt!108596 () ListLongMap!3029)

(assert (=> b!211218 (= lt!108596 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108606 () (_ BitVec 64))

(assert (=> b!211218 (= lt!108606 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108593 () (_ BitVec 64))

(assert (=> b!211218 (= lt!108593 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108600 () Unit!6400)

(declare-fun addApplyDifferent!169 (ListLongMap!3029 (_ BitVec 64) V!6881 (_ BitVec 64)) Unit!6400)

(assert (=> b!211218 (= lt!108600 (addApplyDifferent!169 lt!108596 lt!108606 minValue!615 lt!108593))))

(assert (=> b!211218 (= (apply!193 (+!559 lt!108596 (tuple2!4115 lt!108606 minValue!615)) lt!108593) (apply!193 lt!108596 lt!108593))))

(declare-fun lt!108588 () Unit!6400)

(assert (=> b!211218 (= lt!108588 lt!108600)))

(declare-fun lt!108589 () ListLongMap!3029)

(assert (=> b!211218 (= lt!108589 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108601 () (_ BitVec 64))

(assert (=> b!211218 (= lt!108601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108605 () (_ BitVec 64))

(assert (=> b!211218 (= lt!108605 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108604 () Unit!6400)

(assert (=> b!211218 (= lt!108604 (addApplyDifferent!169 lt!108589 lt!108601 zeroValue!615 lt!108605))))

(assert (=> b!211218 (= (apply!193 (+!559 lt!108589 (tuple2!4115 lt!108601 zeroValue!615)) lt!108605) (apply!193 lt!108589 lt!108605))))

(declare-fun lt!108590 () Unit!6400)

(assert (=> b!211218 (= lt!108590 lt!108604)))

(declare-fun lt!108598 () ListLongMap!3029)

(assert (=> b!211218 (= lt!108598 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108603 () (_ BitVec 64))

(assert (=> b!211218 (= lt!108603 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108594 () (_ BitVec 64))

(assert (=> b!211218 (= lt!108594 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211218 (= lt!108608 (addApplyDifferent!169 lt!108598 lt!108603 minValue!615 lt!108594))))

(assert (=> b!211218 (= (apply!193 (+!559 lt!108598 (tuple2!4115 lt!108603 minValue!615)) lt!108594) (apply!193 lt!108598 lt!108594))))

(declare-fun b!211219 () Bool)

(declare-fun e!137493 () Bool)

(declare-fun e!137491 () Bool)

(assert (=> b!211219 (= e!137493 e!137491)))

(declare-fun res!103144 () Bool)

(declare-fun call!19965 () Bool)

(assert (=> b!211219 (= res!103144 call!19965)))

(assert (=> b!211219 (=> (not res!103144) (not e!137491))))

(declare-fun c!35675 () Bool)

(declare-fun c!35672 () Bool)

(declare-fun call!19967 () ListLongMap!3029)

(declare-fun bm!19958 () Bool)

(declare-fun call!19961 () ListLongMap!3029)

(declare-fun call!19962 () ListLongMap!3029)

(declare-fun call!19966 () ListLongMap!3029)

(assert (=> bm!19958 (= call!19961 (+!559 (ite c!35672 call!19966 (ite c!35675 call!19962 call!19967)) (ite (or c!35672 c!35675) (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211220 () Bool)

(declare-fun c!35673 () Bool)

(assert (=> b!211220 (= c!35673 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137498 () ListLongMap!3029)

(declare-fun e!137502 () ListLongMap!3029)

(assert (=> b!211220 (= e!137498 e!137502)))

(declare-fun bm!19959 () Bool)

(assert (=> bm!19959 (= call!19967 call!19962)))

(declare-fun b!211221 () Bool)

(declare-fun e!137492 () Bool)

(assert (=> b!211221 (= e!137492 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211222 () Bool)

(declare-fun e!137499 () Bool)

(declare-fun e!137495 () Bool)

(assert (=> b!211222 (= e!137499 e!137495)))

(declare-fun res!103143 () Bool)

(declare-fun call!19964 () Bool)

(assert (=> b!211222 (= res!103143 call!19964)))

(assert (=> b!211222 (=> (not res!103143) (not e!137495))))

(declare-fun b!211223 () Bool)

(declare-fun lt!108609 () ListLongMap!3029)

(declare-fun e!137501 () Bool)

(assert (=> b!211223 (= e!137501 (= (apply!193 lt!108609 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)) (get!2563 (select (arr!4770 lt!108449) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211223 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5095 lt!108449)))))

(assert (=> b!211223 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun b!211224 () Bool)

(assert (=> b!211224 (= e!137502 call!19967)))

(declare-fun b!211225 () Bool)

(declare-fun call!19963 () ListLongMap!3029)

(assert (=> b!211225 (= e!137498 call!19963)))

(declare-fun b!211226 () Bool)

(declare-fun e!137496 () Bool)

(assert (=> b!211226 (= e!137496 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211228 () Bool)

(assert (=> b!211228 (= e!137495 (= (apply!193 lt!108609 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211227 () Bool)

(declare-fun res!103141 () Bool)

(declare-fun e!137497 () Bool)

(assert (=> b!211227 (=> (not res!103141) (not e!137497))))

(declare-fun e!137494 () Bool)

(assert (=> b!211227 (= res!103141 e!137494)))

(declare-fun res!103138 () Bool)

(assert (=> b!211227 (=> res!103138 e!137494)))

(assert (=> b!211227 (= res!103138 (not e!137496))))

(declare-fun res!103142 () Bool)

(assert (=> b!211227 (=> (not res!103142) (not e!137496))))

(assert (=> b!211227 (= res!103142 (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun d!58099 () Bool)

(assert (=> d!58099 e!137497))

(declare-fun res!103139 () Bool)

(assert (=> d!58099 (=> (not res!103139) (not e!137497))))

(assert (=> d!58099 (= res!103139 (or (bvsge #b00000000000000000000000000000000 (size!5094 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))))

(declare-fun lt!108602 () ListLongMap!3029)

(assert (=> d!58099 (= lt!108609 lt!108602)))

(declare-fun lt!108591 () Unit!6400)

(assert (=> d!58099 (= lt!108591 e!137500)))

(declare-fun c!35677 () Bool)

(assert (=> d!58099 (= c!35677 e!137492)))

(declare-fun res!103146 () Bool)

(assert (=> d!58099 (=> (not res!103146) (not e!137492))))

(assert (=> d!58099 (= res!103146 (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun e!137490 () ListLongMap!3029)

(assert (=> d!58099 (= lt!108602 e!137490)))

(assert (=> d!58099 (= c!35672 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58099 (validMask!0 mask!1149)))

(assert (=> d!58099 (= (getCurrentListMap!1067 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108609)))

(declare-fun b!211229 () Bool)

(assert (=> b!211229 (= e!137491 (= (apply!193 lt!108609 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19960 () Bool)

(assert (=> bm!19960 (= call!19963 call!19961)))

(declare-fun bm!19961 () Bool)

(assert (=> bm!19961 (= call!19965 (contains!1384 lt!108609 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19962 () Bool)

(assert (=> bm!19962 (= call!19966 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19963 () Bool)

(assert (=> bm!19963 (= call!19964 (contains!1384 lt!108609 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211230 () Bool)

(assert (=> b!211230 (= e!137502 call!19963)))

(declare-fun b!211231 () Bool)

(assert (=> b!211231 (= e!137493 (not call!19965))))

(declare-fun b!211232 () Bool)

(assert (=> b!211232 (= e!137490 e!137498)))

(assert (=> b!211232 (= c!35675 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211233 () Bool)

(assert (=> b!211233 (= e!137497 e!137499)))

(declare-fun c!35674 () Bool)

(assert (=> b!211233 (= c!35674 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211234 () Bool)

(assert (=> b!211234 (= e!137499 (not call!19964))))

(declare-fun b!211235 () Bool)

(declare-fun res!103140 () Bool)

(assert (=> b!211235 (=> (not res!103140) (not e!137497))))

(assert (=> b!211235 (= res!103140 e!137493)))

(declare-fun c!35676 () Bool)

(assert (=> b!211235 (= c!35676 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211236 () Bool)

(declare-fun Unit!6406 () Unit!6400)

(assert (=> b!211236 (= e!137500 Unit!6406)))

(declare-fun bm!19964 () Bool)

(assert (=> bm!19964 (= call!19962 call!19966)))

(declare-fun b!211237 () Bool)

(assert (=> b!211237 (= e!137494 e!137501)))

(declare-fun res!103145 () Bool)

(assert (=> b!211237 (=> (not res!103145) (not e!137501))))

(assert (=> b!211237 (= res!103145 (contains!1384 lt!108609 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun b!211238 () Bool)

(assert (=> b!211238 (= e!137490 (+!559 call!19961 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!58099 c!35672) b!211238))

(assert (= (and d!58099 (not c!35672)) b!211232))

(assert (= (and b!211232 c!35675) b!211225))

(assert (= (and b!211232 (not c!35675)) b!211220))

(assert (= (and b!211220 c!35673) b!211230))

(assert (= (and b!211220 (not c!35673)) b!211224))

(assert (= (or b!211230 b!211224) bm!19959))

(assert (= (or b!211225 bm!19959) bm!19964))

(assert (= (or b!211225 b!211230) bm!19960))

(assert (= (or b!211238 bm!19964) bm!19962))

(assert (= (or b!211238 bm!19960) bm!19958))

(assert (= (and d!58099 res!103146) b!211221))

(assert (= (and d!58099 c!35677) b!211218))

(assert (= (and d!58099 (not c!35677)) b!211236))

(assert (= (and d!58099 res!103139) b!211227))

(assert (= (and b!211227 res!103142) b!211226))

(assert (= (and b!211227 (not res!103138)) b!211237))

(assert (= (and b!211237 res!103145) b!211223))

(assert (= (and b!211227 res!103141) b!211235))

(assert (= (and b!211235 c!35676) b!211219))

(assert (= (and b!211235 (not c!35676)) b!211231))

(assert (= (and b!211219 res!103144) b!211229))

(assert (= (or b!211219 b!211231) bm!19961))

(assert (= (and b!211235 res!103140) b!211233))

(assert (= (and b!211233 c!35674) b!211222))

(assert (= (and b!211233 (not c!35674)) b!211234))

(assert (= (and b!211222 res!103143) b!211228))

(assert (= (or b!211222 b!211234) bm!19963))

(declare-fun b_lambda!7661 () Bool)

(assert (=> (not b_lambda!7661) (not b!211223)))

(assert (=> b!211223 t!7937))

(declare-fun b_and!12381 () Bool)

(assert (= b_and!12379 (and (=> t!7937 result!4977) b_and!12381)))

(declare-fun m!239071 () Bool)

(assert (=> b!211229 m!239071))

(assert (=> b!211223 m!239055))

(assert (=> b!211223 m!239009))

(declare-fun m!239073 () Bool)

(assert (=> b!211223 m!239073))

(assert (=> b!211223 m!239009))

(declare-fun m!239075 () Bool)

(assert (=> b!211223 m!239075))

(assert (=> b!211223 m!239075))

(assert (=> b!211223 m!239055))

(declare-fun m!239077 () Bool)

(assert (=> b!211223 m!239077))

(declare-fun m!239079 () Bool)

(assert (=> b!211228 m!239079))

(assert (=> b!211237 m!239009))

(assert (=> b!211237 m!239009))

(declare-fun m!239081 () Bool)

(assert (=> b!211237 m!239081))

(assert (=> b!211221 m!239009))

(assert (=> b!211221 m!239009))

(assert (=> b!211221 m!239011))

(declare-fun m!239083 () Bool)

(assert (=> b!211218 m!239083))

(declare-fun m!239085 () Bool)

(assert (=> b!211218 m!239085))

(declare-fun m!239087 () Bool)

(assert (=> b!211218 m!239087))

(declare-fun m!239089 () Bool)

(assert (=> b!211218 m!239089))

(declare-fun m!239091 () Bool)

(assert (=> b!211218 m!239091))

(assert (=> b!211218 m!238925))

(assert (=> b!211218 m!239083))

(declare-fun m!239093 () Bool)

(assert (=> b!211218 m!239093))

(declare-fun m!239095 () Bool)

(assert (=> b!211218 m!239095))

(declare-fun m!239097 () Bool)

(assert (=> b!211218 m!239097))

(declare-fun m!239099 () Bool)

(assert (=> b!211218 m!239099))

(declare-fun m!239101 () Bool)

(assert (=> b!211218 m!239101))

(declare-fun m!239103 () Bool)

(assert (=> b!211218 m!239103))

(assert (=> b!211218 m!239091))

(declare-fun m!239105 () Bool)

(assert (=> b!211218 m!239105))

(assert (=> b!211218 m!239087))

(declare-fun m!239107 () Bool)

(assert (=> b!211218 m!239107))

(assert (=> b!211218 m!239101))

(declare-fun m!239109 () Bool)

(assert (=> b!211218 m!239109))

(assert (=> b!211218 m!239009))

(declare-fun m!239111 () Bool)

(assert (=> b!211218 m!239111))

(assert (=> b!211226 m!239009))

(assert (=> b!211226 m!239009))

(assert (=> b!211226 m!239011))

(declare-fun m!239113 () Bool)

(assert (=> bm!19958 m!239113))

(declare-fun m!239115 () Bool)

(assert (=> b!211238 m!239115))

(declare-fun m!239117 () Bool)

(assert (=> bm!19961 m!239117))

(assert (=> d!58099 m!238931))

(declare-fun m!239119 () Bool)

(assert (=> bm!19963 m!239119))

(assert (=> bm!19962 m!238925))

(assert (=> b!211051 d!58099))

(declare-fun b!211239 () Bool)

(declare-fun e!137513 () Unit!6400)

(declare-fun lt!108630 () Unit!6400)

(assert (=> b!211239 (= e!137513 lt!108630)))

(declare-fun lt!108617 () ListLongMap!3029)

(assert (=> b!211239 (= lt!108617 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108614 () (_ BitVec 64))

(assert (=> b!211239 (= lt!108614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108619 () (_ BitVec 64))

(assert (=> b!211239 (= lt!108619 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108621 () Unit!6400)

(assert (=> b!211239 (= lt!108621 (addStillContains!169 lt!108617 lt!108614 zeroValue!615 lt!108619))))

(assert (=> b!211239 (contains!1384 (+!559 lt!108617 (tuple2!4115 lt!108614 zeroValue!615)) lt!108619)))

(declare-fun lt!108629 () Unit!6400)

(assert (=> b!211239 (= lt!108629 lt!108621)))

(declare-fun lt!108618 () ListLongMap!3029)

(assert (=> b!211239 (= lt!108618 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108628 () (_ BitVec 64))

(assert (=> b!211239 (= lt!108628 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108615 () (_ BitVec 64))

(assert (=> b!211239 (= lt!108615 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108622 () Unit!6400)

(assert (=> b!211239 (= lt!108622 (addApplyDifferent!169 lt!108618 lt!108628 minValue!615 lt!108615))))

(assert (=> b!211239 (= (apply!193 (+!559 lt!108618 (tuple2!4115 lt!108628 minValue!615)) lt!108615) (apply!193 lt!108618 lt!108615))))

(declare-fun lt!108610 () Unit!6400)

(assert (=> b!211239 (= lt!108610 lt!108622)))

(declare-fun lt!108611 () ListLongMap!3029)

(assert (=> b!211239 (= lt!108611 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108623 () (_ BitVec 64))

(assert (=> b!211239 (= lt!108623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108627 () (_ BitVec 64))

(assert (=> b!211239 (= lt!108627 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108626 () Unit!6400)

(assert (=> b!211239 (= lt!108626 (addApplyDifferent!169 lt!108611 lt!108623 zeroValue!615 lt!108627))))

(assert (=> b!211239 (= (apply!193 (+!559 lt!108611 (tuple2!4115 lt!108623 zeroValue!615)) lt!108627) (apply!193 lt!108611 lt!108627))))

(declare-fun lt!108612 () Unit!6400)

(assert (=> b!211239 (= lt!108612 lt!108626)))

(declare-fun lt!108620 () ListLongMap!3029)

(assert (=> b!211239 (= lt!108620 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108625 () (_ BitVec 64))

(assert (=> b!211239 (= lt!108625 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108616 () (_ BitVec 64))

(assert (=> b!211239 (= lt!108616 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211239 (= lt!108630 (addApplyDifferent!169 lt!108620 lt!108625 minValue!615 lt!108616))))

(assert (=> b!211239 (= (apply!193 (+!559 lt!108620 (tuple2!4115 lt!108625 minValue!615)) lt!108616) (apply!193 lt!108620 lt!108616))))

(declare-fun b!211240 () Bool)

(declare-fun e!137506 () Bool)

(declare-fun e!137504 () Bool)

(assert (=> b!211240 (= e!137506 e!137504)))

(declare-fun res!103153 () Bool)

(declare-fun call!19972 () Bool)

(assert (=> b!211240 (= res!103153 call!19972)))

(assert (=> b!211240 (=> (not res!103153) (not e!137504))))

(declare-fun call!19973 () ListLongMap!3029)

(declare-fun call!19968 () ListLongMap!3029)

(declare-fun c!35678 () Bool)

(declare-fun c!35681 () Bool)

(declare-fun call!19974 () ListLongMap!3029)

(declare-fun call!19969 () ListLongMap!3029)

(declare-fun bm!19965 () Bool)

(assert (=> bm!19965 (= call!19968 (+!559 (ite c!35678 call!19973 (ite c!35681 call!19969 call!19974)) (ite (or c!35678 c!35681) (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211241 () Bool)

(declare-fun c!35679 () Bool)

(assert (=> b!211241 (= c!35679 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137511 () ListLongMap!3029)

(declare-fun e!137515 () ListLongMap!3029)

(assert (=> b!211241 (= e!137511 e!137515)))

(declare-fun bm!19966 () Bool)

(assert (=> bm!19966 (= call!19974 call!19969)))

(declare-fun b!211242 () Bool)

(declare-fun e!137505 () Bool)

(assert (=> b!211242 (= e!137505 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211243 () Bool)

(declare-fun e!137512 () Bool)

(declare-fun e!137508 () Bool)

(assert (=> b!211243 (= e!137512 e!137508)))

(declare-fun res!103152 () Bool)

(declare-fun call!19971 () Bool)

(assert (=> b!211243 (= res!103152 call!19971)))

(assert (=> b!211243 (=> (not res!103152) (not e!137508))))

(declare-fun b!211244 () Bool)

(declare-fun lt!108631 () ListLongMap!3029)

(declare-fun e!137514 () Bool)

(assert (=> b!211244 (= e!137514 (= (apply!193 lt!108631 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)) (get!2563 (select (arr!4770 _values!649) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5095 _values!649)))))

(assert (=> b!211244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun b!211245 () Bool)

(assert (=> b!211245 (= e!137515 call!19974)))

(declare-fun b!211246 () Bool)

(declare-fun call!19970 () ListLongMap!3029)

(assert (=> b!211246 (= e!137511 call!19970)))

(declare-fun b!211247 () Bool)

(declare-fun e!137509 () Bool)

(assert (=> b!211247 (= e!137509 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211249 () Bool)

(assert (=> b!211249 (= e!137508 (= (apply!193 lt!108631 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211248 () Bool)

(declare-fun res!103150 () Bool)

(declare-fun e!137510 () Bool)

(assert (=> b!211248 (=> (not res!103150) (not e!137510))))

(declare-fun e!137507 () Bool)

(assert (=> b!211248 (= res!103150 e!137507)))

(declare-fun res!103147 () Bool)

(assert (=> b!211248 (=> res!103147 e!137507)))

(assert (=> b!211248 (= res!103147 (not e!137509))))

(declare-fun res!103151 () Bool)

(assert (=> b!211248 (=> (not res!103151) (not e!137509))))

(assert (=> b!211248 (= res!103151 (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun d!58101 () Bool)

(assert (=> d!58101 e!137510))

(declare-fun res!103148 () Bool)

(assert (=> d!58101 (=> (not res!103148) (not e!137510))))

(assert (=> d!58101 (= res!103148 (or (bvsge #b00000000000000000000000000000000 (size!5094 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))))

(declare-fun lt!108624 () ListLongMap!3029)

(assert (=> d!58101 (= lt!108631 lt!108624)))

(declare-fun lt!108613 () Unit!6400)

(assert (=> d!58101 (= lt!108613 e!137513)))

(declare-fun c!35683 () Bool)

(assert (=> d!58101 (= c!35683 e!137505)))

(declare-fun res!103155 () Bool)

(assert (=> d!58101 (=> (not res!103155) (not e!137505))))

(assert (=> d!58101 (= res!103155 (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun e!137503 () ListLongMap!3029)

(assert (=> d!58101 (= lt!108624 e!137503)))

(assert (=> d!58101 (= c!35678 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58101 (validMask!0 mask!1149)))

(assert (=> d!58101 (= (getCurrentListMap!1067 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108631)))

(declare-fun b!211250 () Bool)

(assert (=> b!211250 (= e!137504 (= (apply!193 lt!108631 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19967 () Bool)

(assert (=> bm!19967 (= call!19970 call!19968)))

(declare-fun bm!19968 () Bool)

(assert (=> bm!19968 (= call!19972 (contains!1384 lt!108631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19969 () Bool)

(assert (=> bm!19969 (= call!19973 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19970 () Bool)

(assert (=> bm!19970 (= call!19971 (contains!1384 lt!108631 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211251 () Bool)

(assert (=> b!211251 (= e!137515 call!19970)))

(declare-fun b!211252 () Bool)

(assert (=> b!211252 (= e!137506 (not call!19972))))

(declare-fun b!211253 () Bool)

(assert (=> b!211253 (= e!137503 e!137511)))

(assert (=> b!211253 (= c!35681 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211254 () Bool)

(assert (=> b!211254 (= e!137510 e!137512)))

(declare-fun c!35680 () Bool)

(assert (=> b!211254 (= c!35680 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211255 () Bool)

(assert (=> b!211255 (= e!137512 (not call!19971))))

(declare-fun b!211256 () Bool)

(declare-fun res!103149 () Bool)

(assert (=> b!211256 (=> (not res!103149) (not e!137510))))

(assert (=> b!211256 (= res!103149 e!137506)))

(declare-fun c!35682 () Bool)

(assert (=> b!211256 (= c!35682 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211257 () Bool)

(declare-fun Unit!6407 () Unit!6400)

(assert (=> b!211257 (= e!137513 Unit!6407)))

(declare-fun bm!19971 () Bool)

(assert (=> bm!19971 (= call!19969 call!19973)))

(declare-fun b!211258 () Bool)

(assert (=> b!211258 (= e!137507 e!137514)))

(declare-fun res!103154 () Bool)

(assert (=> b!211258 (=> (not res!103154) (not e!137514))))

(assert (=> b!211258 (= res!103154 (contains!1384 lt!108631 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun b!211259 () Bool)

(assert (=> b!211259 (= e!137503 (+!559 call!19968 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!58101 c!35678) b!211259))

(assert (= (and d!58101 (not c!35678)) b!211253))

(assert (= (and b!211253 c!35681) b!211246))

(assert (= (and b!211253 (not c!35681)) b!211241))

(assert (= (and b!211241 c!35679) b!211251))

(assert (= (and b!211241 (not c!35679)) b!211245))

(assert (= (or b!211251 b!211245) bm!19966))

(assert (= (or b!211246 bm!19966) bm!19971))

(assert (= (or b!211246 b!211251) bm!19967))

(assert (= (or b!211259 bm!19971) bm!19969))

(assert (= (or b!211259 bm!19967) bm!19965))

(assert (= (and d!58101 res!103155) b!211242))

(assert (= (and d!58101 c!35683) b!211239))

(assert (= (and d!58101 (not c!35683)) b!211257))

(assert (= (and d!58101 res!103148) b!211248))

(assert (= (and b!211248 res!103151) b!211247))

(assert (= (and b!211248 (not res!103147)) b!211258))

(assert (= (and b!211258 res!103154) b!211244))

(assert (= (and b!211248 res!103150) b!211256))

(assert (= (and b!211256 c!35682) b!211240))

(assert (= (and b!211256 (not c!35682)) b!211252))

(assert (= (and b!211240 res!103153) b!211250))

(assert (= (or b!211240 b!211252) bm!19968))

(assert (= (and b!211256 res!103149) b!211254))

(assert (= (and b!211254 c!35680) b!211243))

(assert (= (and b!211254 (not c!35680)) b!211255))

(assert (= (and b!211243 res!103152) b!211249))

(assert (= (or b!211243 b!211255) bm!19970))

(declare-fun b_lambda!7663 () Bool)

(assert (=> (not b_lambda!7663) (not b!211244)))

(assert (=> b!211244 t!7937))

(declare-fun b_and!12383 () Bool)

(assert (= b_and!12381 (and (=> t!7937 result!4977) b_and!12383)))

(declare-fun m!239121 () Bool)

(assert (=> b!211250 m!239121))

(assert (=> b!211244 m!239055))

(assert (=> b!211244 m!239009))

(declare-fun m!239123 () Bool)

(assert (=> b!211244 m!239123))

(assert (=> b!211244 m!239009))

(assert (=> b!211244 m!239051))

(assert (=> b!211244 m!239051))

(assert (=> b!211244 m!239055))

(assert (=> b!211244 m!239057))

(declare-fun m!239125 () Bool)

(assert (=> b!211249 m!239125))

(assert (=> b!211258 m!239009))

(assert (=> b!211258 m!239009))

(declare-fun m!239127 () Bool)

(assert (=> b!211258 m!239127))

(assert (=> b!211242 m!239009))

(assert (=> b!211242 m!239009))

(assert (=> b!211242 m!239011))

(declare-fun m!239129 () Bool)

(assert (=> b!211239 m!239129))

(declare-fun m!239131 () Bool)

(assert (=> b!211239 m!239131))

(declare-fun m!239133 () Bool)

(assert (=> b!211239 m!239133))

(declare-fun m!239135 () Bool)

(assert (=> b!211239 m!239135))

(declare-fun m!239137 () Bool)

(assert (=> b!211239 m!239137))

(assert (=> b!211239 m!238923))

(assert (=> b!211239 m!239129))

(declare-fun m!239139 () Bool)

(assert (=> b!211239 m!239139))

(declare-fun m!239141 () Bool)

(assert (=> b!211239 m!239141))

(declare-fun m!239143 () Bool)

(assert (=> b!211239 m!239143))

(declare-fun m!239145 () Bool)

(assert (=> b!211239 m!239145))

(declare-fun m!239147 () Bool)

(assert (=> b!211239 m!239147))

(declare-fun m!239149 () Bool)

(assert (=> b!211239 m!239149))

(assert (=> b!211239 m!239137))

(declare-fun m!239151 () Bool)

(assert (=> b!211239 m!239151))

(assert (=> b!211239 m!239133))

(declare-fun m!239153 () Bool)

(assert (=> b!211239 m!239153))

(assert (=> b!211239 m!239147))

(declare-fun m!239155 () Bool)

(assert (=> b!211239 m!239155))

(assert (=> b!211239 m!239009))

(declare-fun m!239157 () Bool)

(assert (=> b!211239 m!239157))

(assert (=> b!211247 m!239009))

(assert (=> b!211247 m!239009))

(assert (=> b!211247 m!239011))

(declare-fun m!239159 () Bool)

(assert (=> bm!19965 m!239159))

(declare-fun m!239161 () Bool)

(assert (=> b!211259 m!239161))

(declare-fun m!239163 () Bool)

(assert (=> bm!19968 m!239163))

(assert (=> d!58101 m!238931))

(declare-fun m!239165 () Bool)

(assert (=> bm!19970 m!239165))

(assert (=> bm!19969 m!238923))

(assert (=> b!211051 d!58101))

(declare-fun b!211260 () Bool)

(declare-fun e!137516 () Bool)

(declare-fun e!137519 () Bool)

(assert (=> b!211260 (= e!137516 e!137519)))

(assert (=> b!211260 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun res!103156 () Bool)

(declare-fun lt!108636 () ListLongMap!3029)

(assert (=> b!211260 (= res!103156 (contains!1384 lt!108636 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211260 (=> (not res!103156) (not e!137519))))

(declare-fun b!211261 () Bool)

(declare-fun e!137521 () ListLongMap!3029)

(assert (=> b!211261 (= e!137521 (ListLongMap!3030 Nil!2996))))

(declare-fun bm!19972 () Bool)

(declare-fun call!19975 () ListLongMap!3029)

(assert (=> bm!19972 (= call!19975 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211262 () Bool)

(declare-fun e!137520 () Bool)

(assert (=> b!211262 (= e!137516 e!137520)))

(declare-fun c!35686 () Bool)

(assert (=> b!211262 (= c!35686 (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun b!211263 () Bool)

(declare-fun res!103158 () Bool)

(declare-fun e!137522 () Bool)

(assert (=> b!211263 (=> (not res!103158) (not e!137522))))

(assert (=> b!211263 (= res!103158 (not (contains!1384 lt!108636 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211264 () Bool)

(declare-fun e!137518 () Bool)

(assert (=> b!211264 (= e!137518 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211264 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211265 () Bool)

(assert (=> b!211265 (= e!137520 (isEmpty!500 lt!108636))))

(declare-fun d!58103 () Bool)

(assert (=> d!58103 e!137522))

(declare-fun res!103159 () Bool)

(assert (=> d!58103 (=> (not res!103159) (not e!137522))))

(assert (=> d!58103 (= res!103159 (not (contains!1384 lt!108636 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58103 (= lt!108636 e!137521)))

(declare-fun c!35684 () Bool)

(assert (=> d!58103 (= c!35684 (bvsge #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(assert (=> d!58103 (validMask!0 mask!1149)))

(assert (=> d!58103 (= (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108636)))

(declare-fun b!211266 () Bool)

(assert (=> b!211266 (= e!137522 e!137516)))

(declare-fun c!35685 () Bool)

(assert (=> b!211266 (= c!35685 e!137518)))

(declare-fun res!103157 () Bool)

(assert (=> b!211266 (=> (not res!103157) (not e!137518))))

(assert (=> b!211266 (= res!103157 (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(declare-fun b!211267 () Bool)

(declare-fun lt!108635 () Unit!6400)

(declare-fun lt!108638 () Unit!6400)

(assert (=> b!211267 (= lt!108635 lt!108638)))

(declare-fun lt!108633 () ListLongMap!3029)

(declare-fun lt!108634 () V!6881)

(declare-fun lt!108637 () (_ BitVec 64))

(declare-fun lt!108632 () (_ BitVec 64))

(assert (=> b!211267 (not (contains!1384 (+!559 lt!108633 (tuple2!4115 lt!108632 lt!108634)) lt!108637))))

(assert (=> b!211267 (= lt!108638 (addStillNotContains!104 lt!108633 lt!108632 lt!108634 lt!108637))))

(assert (=> b!211267 (= lt!108637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211267 (= lt!108634 (get!2563 (select (arr!4770 lt!108449) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211267 (= lt!108632 (select (arr!4769 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211267 (= lt!108633 call!19975)))

(declare-fun e!137517 () ListLongMap!3029)

(assert (=> b!211267 (= e!137517 (+!559 call!19975 (tuple2!4115 (select (arr!4769 _keys!825) #b00000000000000000000000000000000) (get!2563 (select (arr!4770 lt!108449) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211268 () Bool)

(assert (=> b!211268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(assert (=> b!211268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5095 lt!108449)))))

(assert (=> b!211268 (= e!137519 (= (apply!193 lt!108636 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)) (get!2563 (select (arr!4770 lt!108449) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211269 () Bool)

(assert (=> b!211269 (= e!137521 e!137517)))

(declare-fun c!35687 () Bool)

(assert (=> b!211269 (= c!35687 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211270 () Bool)

(assert (=> b!211270 (= e!137520 (= lt!108636 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108449 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211271 () Bool)

(assert (=> b!211271 (= e!137517 call!19975)))

(assert (= (and d!58103 c!35684) b!211261))

(assert (= (and d!58103 (not c!35684)) b!211269))

(assert (= (and b!211269 c!35687) b!211267))

(assert (= (and b!211269 (not c!35687)) b!211271))

(assert (= (or b!211267 b!211271) bm!19972))

(assert (= (and d!58103 res!103159) b!211263))

(assert (= (and b!211263 res!103158) b!211266))

(assert (= (and b!211266 res!103157) b!211264))

(assert (= (and b!211266 c!35685) b!211260))

(assert (= (and b!211266 (not c!35685)) b!211262))

(assert (= (and b!211260 res!103156) b!211268))

(assert (= (and b!211262 c!35686) b!211270))

(assert (= (and b!211262 (not c!35686)) b!211265))

(declare-fun b_lambda!7665 () Bool)

(assert (=> (not b_lambda!7665) (not b!211267)))

(assert (=> b!211267 t!7937))

(declare-fun b_and!12385 () Bool)

(assert (= b_and!12383 (and (=> t!7937 result!4977) b_and!12385)))

(declare-fun b_lambda!7667 () Bool)

(assert (=> (not b_lambda!7667) (not b!211268)))

(assert (=> b!211268 t!7937))

(declare-fun b_and!12387 () Bool)

(assert (= b_and!12385 (and (=> t!7937 result!4977) b_and!12387)))

(declare-fun m!239167 () Bool)

(assert (=> b!211267 m!239167))

(declare-fun m!239169 () Bool)

(assert (=> b!211267 m!239169))

(declare-fun m!239171 () Bool)

(assert (=> b!211267 m!239171))

(assert (=> b!211267 m!239075))

(assert (=> b!211267 m!239009))

(assert (=> b!211267 m!239167))

(declare-fun m!239173 () Bool)

(assert (=> b!211267 m!239173))

(assert (=> b!211267 m!239055))

(assert (=> b!211267 m!239075))

(assert (=> b!211267 m!239055))

(assert (=> b!211267 m!239077))

(assert (=> b!211264 m!239009))

(assert (=> b!211264 m!239009))

(assert (=> b!211264 m!239011))

(assert (=> b!211260 m!239009))

(assert (=> b!211260 m!239009))

(declare-fun m!239175 () Bool)

(assert (=> b!211260 m!239175))

(declare-fun m!239177 () Bool)

(assert (=> bm!19972 m!239177))

(assert (=> b!211269 m!239009))

(assert (=> b!211269 m!239009))

(assert (=> b!211269 m!239011))

(declare-fun m!239179 () Bool)

(assert (=> b!211263 m!239179))

(assert (=> b!211270 m!239177))

(assert (=> b!211268 m!239075))

(assert (=> b!211268 m!239009))

(assert (=> b!211268 m!239055))

(assert (=> b!211268 m!239075))

(assert (=> b!211268 m!239055))

(assert (=> b!211268 m!239077))

(assert (=> b!211268 m!239009))

(declare-fun m!239181 () Bool)

(assert (=> b!211268 m!239181))

(declare-fun m!239183 () Bool)

(assert (=> d!58103 m!239183))

(assert (=> d!58103 m!238931))

(declare-fun m!239185 () Bool)

(assert (=> b!211265 m!239185))

(assert (=> b!211051 d!58103))

(declare-fun bm!19977 () Bool)

(declare-fun call!19980 () ListLongMap!3029)

(assert (=> bm!19977 (= call!19980 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun e!137528 () Bool)

(declare-fun call!19981 () ListLongMap!3029)

(declare-fun b!211278 () Bool)

(assert (=> b!211278 (= e!137528 (= call!19981 (+!559 call!19980 (tuple2!4115 k0!843 v!520))))))

(declare-fun bm!19978 () Bool)

(assert (=> bm!19978 (= call!19981 (getCurrentListMapNoExtraKeys!490 _keys!825 (array!10048 (store (arr!4770 _values!649) i!601 (ValueCellFull!2369 v!520)) (size!5095 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211279 () Bool)

(declare-fun e!137527 () Bool)

(assert (=> b!211279 (= e!137527 e!137528)))

(declare-fun c!35690 () Bool)

(assert (=> b!211279 (= c!35690 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun d!58105 () Bool)

(assert (=> d!58105 e!137527))

(declare-fun res!103162 () Bool)

(assert (=> d!58105 (=> (not res!103162) (not e!137527))))

(assert (=> d!58105 (= res!103162 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5095 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5095 _values!649))))))))

(declare-fun lt!108641 () Unit!6400)

(declare-fun choose!1084 (array!10045 array!10047 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) (_ BitVec 64) V!6881 (_ BitVec 32) Int) Unit!6400)

(assert (=> d!58105 (= lt!108641 (choose!1084 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(assert (=> d!58105 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!208 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108641)))

(declare-fun b!211280 () Bool)

(assert (=> b!211280 (= e!137528 (= call!19981 call!19980))))

(assert (= (and d!58105 res!103162) b!211279))

(assert (= (and b!211279 c!35690) b!211278))

(assert (= (and b!211279 (not c!35690)) b!211280))

(assert (= (or b!211278 b!211280) bm!19978))

(assert (= (or b!211278 b!211280) bm!19977))

(assert (=> bm!19977 m!238923))

(declare-fun m!239187 () Bool)

(assert (=> b!211278 m!239187))

(assert (=> bm!19978 m!238917))

(declare-fun m!239189 () Bool)

(assert (=> bm!19978 m!239189))

(declare-fun m!239191 () Bool)

(assert (=> d!58105 m!239191))

(assert (=> b!211051 d!58105))

(declare-fun d!58107 () Bool)

(declare-fun res!103170 () Bool)

(declare-fun e!137537 () Bool)

(assert (=> d!58107 (=> res!103170 e!137537)))

(assert (=> d!58107 (= res!103170 (bvsge #b00000000000000000000000000000000 (size!5094 _keys!825)))))

(assert (=> d!58107 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2997) e!137537)))

(declare-fun bm!19981 () Bool)

(declare-fun call!19984 () Bool)

(declare-fun c!35693 () Bool)

(assert (=> bm!19981 (= call!19984 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35693 (Cons!2996 (select (arr!4769 _keys!825) #b00000000000000000000000000000000) Nil!2997) Nil!2997)))))

(declare-fun b!211291 () Bool)

(declare-fun e!137538 () Bool)

(assert (=> b!211291 (= e!137538 call!19984)))

(declare-fun b!211292 () Bool)

(declare-fun e!137539 () Bool)

(declare-fun contains!1386 (List!3000 (_ BitVec 64)) Bool)

(assert (=> b!211292 (= e!137539 (contains!1386 Nil!2997 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211293 () Bool)

(assert (=> b!211293 (= e!137538 call!19984)))

(declare-fun b!211294 () Bool)

(declare-fun e!137540 () Bool)

(assert (=> b!211294 (= e!137540 e!137538)))

(assert (=> b!211294 (= c!35693 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211295 () Bool)

(assert (=> b!211295 (= e!137537 e!137540)))

(declare-fun res!103169 () Bool)

(assert (=> b!211295 (=> (not res!103169) (not e!137540))))

(assert (=> b!211295 (= res!103169 (not e!137539))))

(declare-fun res!103171 () Bool)

(assert (=> b!211295 (=> (not res!103171) (not e!137539))))

(assert (=> b!211295 (= res!103171 (validKeyInArray!0 (select (arr!4769 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58107 (not res!103170)) b!211295))

(assert (= (and b!211295 res!103171) b!211292))

(assert (= (and b!211295 res!103169) b!211294))

(assert (= (and b!211294 c!35693) b!211293))

(assert (= (and b!211294 (not c!35693)) b!211291))

(assert (= (or b!211293 b!211291) bm!19981))

(assert (=> bm!19981 m!239009))

(declare-fun m!239193 () Bool)

(assert (=> bm!19981 m!239193))

(assert (=> b!211292 m!239009))

(assert (=> b!211292 m!239009))

(declare-fun m!239195 () Bool)

(assert (=> b!211292 m!239195))

(assert (=> b!211294 m!239009))

(assert (=> b!211294 m!239009))

(assert (=> b!211294 m!239011))

(assert (=> b!211295 m!239009))

(assert (=> b!211295 m!239009))

(assert (=> b!211295 m!239011))

(assert (=> b!211050 d!58107))

(declare-fun d!58109 () Bool)

(assert (=> d!58109 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211041 d!58109))

(declare-fun mapIsEmpty!9227 () Bool)

(declare-fun mapRes!9227 () Bool)

(assert (=> mapIsEmpty!9227 mapRes!9227))

(declare-fun mapNonEmpty!9227 () Bool)

(declare-fun tp!19757 () Bool)

(declare-fun e!137545 () Bool)

(assert (=> mapNonEmpty!9227 (= mapRes!9227 (and tp!19757 e!137545))))

(declare-fun mapRest!9227 () (Array (_ BitVec 32) ValueCell!2369))

(declare-fun mapKey!9227 () (_ BitVec 32))

(declare-fun mapValue!9227 () ValueCell!2369)

(assert (=> mapNonEmpty!9227 (= mapRest!9218 (store mapRest!9227 mapKey!9227 mapValue!9227))))

(declare-fun condMapEmpty!9227 () Bool)

(declare-fun mapDefault!9227 () ValueCell!2369)

(assert (=> mapNonEmpty!9218 (= condMapEmpty!9227 (= mapRest!9218 ((as const (Array (_ BitVec 32) ValueCell!2369)) mapDefault!9227)))))

(declare-fun e!137546 () Bool)

(assert (=> mapNonEmpty!9218 (= tp!19742 (and e!137546 mapRes!9227))))

(declare-fun b!211302 () Bool)

(assert (=> b!211302 (= e!137545 tp_is_empty!5425)))

(declare-fun b!211303 () Bool)

(assert (=> b!211303 (= e!137546 tp_is_empty!5425)))

(assert (= (and mapNonEmpty!9218 condMapEmpty!9227) mapIsEmpty!9227))

(assert (= (and mapNonEmpty!9218 (not condMapEmpty!9227)) mapNonEmpty!9227))

(assert (= (and mapNonEmpty!9227 ((_ is ValueCellFull!2369) mapValue!9227)) b!211302))

(assert (= (and mapNonEmpty!9218 ((_ is ValueCellFull!2369) mapDefault!9227)) b!211303))

(declare-fun m!239197 () Bool)

(assert (=> mapNonEmpty!9227 m!239197))

(declare-fun b_lambda!7669 () Bool)

(assert (= b_lambda!7665 (or (and start!20996 b_free!5563) b_lambda!7669)))

(declare-fun b_lambda!7671 () Bool)

(assert (= b_lambda!7657 (or (and start!20996 b_free!5563) b_lambda!7671)))

(declare-fun b_lambda!7673 () Bool)

(assert (= b_lambda!7661 (or (and start!20996 b_free!5563) b_lambda!7673)))

(declare-fun b_lambda!7675 () Bool)

(assert (= b_lambda!7667 (or (and start!20996 b_free!5563) b_lambda!7675)))

(declare-fun b_lambda!7677 () Bool)

(assert (= b_lambda!7659 (or (and start!20996 b_free!5563) b_lambda!7677)))

(declare-fun b_lambda!7679 () Bool)

(assert (= b_lambda!7663 (or (and start!20996 b_free!5563) b_lambda!7679)))

(check-sat (not b!211169) (not b!211218) (not b!211165) (not bm!19969) (not b!211237) (not bm!19968) (not b!211170) (not bm!19972) (not b_lambda!7679) (not b!211250) (not mapNonEmpty!9227) (not b!211247) (not bm!19977) (not bm!19962) (not b!211228) (not b!211242) (not d!58093) (not d!58103) (not bm!19940) (not b!211292) (not b!211268) (not b!211238) (not b!211264) (not b!211265) (not b!211263) (not b!211226) (not b_next!5563) (not b_lambda!7673) (not b!211295) (not b!211162) (not b!211270) (not b!211136) tp_is_empty!5425 (not b_lambda!7677) (not b!211258) (not b!211244) (not b!211167) (not b!211229) (not bm!19981) (not bm!19978) (not b!211294) (not b!211223) (not b!211166) (not d!58105) (not b!211221) (not b!211128) (not bm!19963) (not d!58101) (not bm!19943) (not b!211267) (not b!211259) b_and!12387 (not b!211135) (not b!211239) (not bm!19970) (not b_lambda!7675) (not d!58095) (not d!58097) (not bm!19958) (not b!211137) (not b!211278) (not d!58099) (not b!211172) (not bm!19965) (not b!211269) (not b!211260) (not b!211171) (not bm!19961) (not b_lambda!7669) (not b!211134) (not b!211249) (not b!211129) (not b_lambda!7671))
(check-sat b_and!12387 (not b_next!5563))
