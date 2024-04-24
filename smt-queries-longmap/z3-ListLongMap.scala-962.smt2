; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20872 () Bool)

(assert start!20872)

(declare-fun b_free!5521 () Bool)

(declare-fun b_next!5521 () Bool)

(assert (=> start!20872 (= b_free!5521 (not b_next!5521))))

(declare-fun tp!19603 () Bool)

(declare-fun b_and!12281 () Bool)

(assert (=> start!20872 (= tp!19603 b_and!12281)))

(declare-fun mapIsEmpty!9143 () Bool)

(declare-fun mapRes!9143 () Bool)

(assert (=> mapIsEmpty!9143 mapRes!9143))

(declare-fun b!209529 () Bool)

(declare-fun e!136495 () Bool)

(declare-fun e!136492 () Bool)

(assert (=> b!209529 (= e!136495 (not e!136492))))

(declare-fun res!102153 () Bool)

(assert (=> b!209529 (=> res!102153 e!136492)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209529 (= res!102153 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6825 0))(
  ( (V!6826 (val!2736 Int)) )
))
(declare-datatypes ((tuple2!4080 0))(
  ( (tuple2!4081 (_1!2051 (_ BitVec 64)) (_2!2051 V!6825)) )
))
(declare-datatypes ((List!2966 0))(
  ( (Nil!2963) (Cons!2962 (h!3604 tuple2!4080) (t!7889 List!2966)) )
))
(declare-datatypes ((ListLongMap!2995 0))(
  ( (ListLongMap!2996 (toList!1513 List!2966)) )
))
(declare-fun lt!107104 () ListLongMap!2995)

(declare-datatypes ((ValueCell!2348 0))(
  ( (ValueCellFull!2348 (v!4707 V!6825)) (EmptyCell!2348) )
))
(declare-datatypes ((array!9959 0))(
  ( (array!9960 (arr!4730 (Array (_ BitVec 32) ValueCell!2348)) (size!5055 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9959)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6825)

(declare-datatypes ((array!9961 0))(
  ( (array!9962 (arr!4731 (Array (_ BitVec 32) (_ BitVec 64))) (size!5056 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9961)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6825)

(declare-fun getCurrentListMap!1053 (array!9961 array!9959 (_ BitVec 32) (_ BitVec 32) V!6825 V!6825 (_ BitVec 32) Int) ListLongMap!2995)

(assert (=> b!209529 (= lt!107104 (getCurrentListMap!1053 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107105 () array!9959)

(declare-fun lt!107101 () ListLongMap!2995)

(assert (=> b!209529 (= lt!107101 (getCurrentListMap!1053 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107103 () ListLongMap!2995)

(declare-fun lt!107100 () ListLongMap!2995)

(assert (=> b!209529 (and (= lt!107103 lt!107100) (= lt!107100 lt!107103))))

(declare-fun v!520 () V!6825)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!107102 () ListLongMap!2995)

(declare-fun +!542 (ListLongMap!2995 tuple2!4080) ListLongMap!2995)

(assert (=> b!209529 (= lt!107100 (+!542 lt!107102 (tuple2!4081 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6360 0))(
  ( (Unit!6361) )
))
(declare-fun lt!107099 () Unit!6360)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!194 (array!9961 array!9959 (_ BitVec 32) (_ BitVec 32) V!6825 V!6825 (_ BitVec 32) (_ BitVec 64) V!6825 (_ BitVec 32) Int) Unit!6360)

(assert (=> b!209529 (= lt!107099 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!194 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!476 (array!9961 array!9959 (_ BitVec 32) (_ BitVec 32) V!6825 V!6825 (_ BitVec 32) Int) ListLongMap!2995)

(assert (=> b!209529 (= lt!107103 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209529 (= lt!107105 (array!9960 (store (arr!4730 _values!649) i!601 (ValueCellFull!2348 v!520)) (size!5055 _values!649)))))

(assert (=> b!209529 (= lt!107102 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209530 () Bool)

(declare-fun e!136493 () Bool)

(declare-fun tp_is_empty!5383 () Bool)

(assert (=> b!209530 (= e!136493 tp_is_empty!5383)))

(declare-fun b!209531 () Bool)

(declare-fun res!102150 () Bool)

(assert (=> b!209531 (=> (not res!102150) (not e!136495))))

(assert (=> b!209531 (= res!102150 (= (select (arr!4731 _keys!825) i!601) k0!843))))

(declare-fun b!209532 () Bool)

(declare-fun e!136496 () Bool)

(assert (=> b!209532 (= e!136496 tp_is_empty!5383)))

(declare-fun mapNonEmpty!9143 () Bool)

(declare-fun tp!19604 () Bool)

(assert (=> mapNonEmpty!9143 (= mapRes!9143 (and tp!19604 e!136496))))

(declare-fun mapKey!9143 () (_ BitVec 32))

(declare-fun mapRest!9143 () (Array (_ BitVec 32) ValueCell!2348))

(declare-fun mapValue!9143 () ValueCell!2348)

(assert (=> mapNonEmpty!9143 (= (arr!4730 _values!649) (store mapRest!9143 mapKey!9143 mapValue!9143))))

(declare-fun res!102148 () Bool)

(assert (=> start!20872 (=> (not res!102148) (not e!136495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20872 (= res!102148 (validMask!0 mask!1149))))

(assert (=> start!20872 e!136495))

(declare-fun e!136494 () Bool)

(declare-fun array_inv!3103 (array!9959) Bool)

(assert (=> start!20872 (and (array_inv!3103 _values!649) e!136494)))

(assert (=> start!20872 true))

(assert (=> start!20872 tp_is_empty!5383))

(declare-fun array_inv!3104 (array!9961) Bool)

(assert (=> start!20872 (array_inv!3104 _keys!825)))

(assert (=> start!20872 tp!19603))

(declare-fun b!209533 () Bool)

(declare-fun res!102149 () Bool)

(assert (=> b!209533 (=> (not res!102149) (not e!136495))))

(assert (=> b!209533 (= res!102149 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5056 _keys!825))))))

(declare-fun b!209534 () Bool)

(assert (=> b!209534 (= e!136492 (= lt!107101 (+!542 (+!542 lt!107103 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!209535 () Bool)

(declare-fun res!102147 () Bool)

(assert (=> b!209535 (=> (not res!102147) (not e!136495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209535 (= res!102147 (validKeyInArray!0 k0!843))))

(declare-fun b!209536 () Bool)

(declare-fun res!102154 () Bool)

(assert (=> b!209536 (=> (not res!102154) (not e!136495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9961 (_ BitVec 32)) Bool)

(assert (=> b!209536 (= res!102154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209537 () Bool)

(declare-fun res!102152 () Bool)

(assert (=> b!209537 (=> (not res!102152) (not e!136495))))

(declare-datatypes ((List!2967 0))(
  ( (Nil!2964) (Cons!2963 (h!3605 (_ BitVec 64)) (t!7890 List!2967)) )
))
(declare-fun arrayNoDuplicates!0 (array!9961 (_ BitVec 32) List!2967) Bool)

(assert (=> b!209537 (= res!102152 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2964))))

(declare-fun b!209538 () Bool)

(declare-fun res!102151 () Bool)

(assert (=> b!209538 (=> (not res!102151) (not e!136495))))

(assert (=> b!209538 (= res!102151 (and (= (size!5055 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5056 _keys!825) (size!5055 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209539 () Bool)

(assert (=> b!209539 (= e!136494 (and e!136493 mapRes!9143))))

(declare-fun condMapEmpty!9143 () Bool)

(declare-fun mapDefault!9143 () ValueCell!2348)

(assert (=> b!209539 (= condMapEmpty!9143 (= (arr!4730 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2348)) mapDefault!9143)))))

(assert (= (and start!20872 res!102148) b!209538))

(assert (= (and b!209538 res!102151) b!209536))

(assert (= (and b!209536 res!102154) b!209537))

(assert (= (and b!209537 res!102152) b!209533))

(assert (= (and b!209533 res!102149) b!209535))

(assert (= (and b!209535 res!102147) b!209531))

(assert (= (and b!209531 res!102150) b!209529))

(assert (= (and b!209529 (not res!102153)) b!209534))

(assert (= (and b!209539 condMapEmpty!9143) mapIsEmpty!9143))

(assert (= (and b!209539 (not condMapEmpty!9143)) mapNonEmpty!9143))

(get-info :version)

(assert (= (and mapNonEmpty!9143 ((_ is ValueCellFull!2348) mapValue!9143)) b!209532))

(assert (= (and b!209539 ((_ is ValueCellFull!2348) mapDefault!9143)) b!209530))

(assert (= start!20872 b!209539))

(declare-fun m!237039 () Bool)

(assert (=> b!209534 m!237039))

(assert (=> b!209534 m!237039))

(declare-fun m!237041 () Bool)

(assert (=> b!209534 m!237041))

(declare-fun m!237043 () Bool)

(assert (=> start!20872 m!237043))

(declare-fun m!237045 () Bool)

(assert (=> start!20872 m!237045))

(declare-fun m!237047 () Bool)

(assert (=> start!20872 m!237047))

(declare-fun m!237049 () Bool)

(assert (=> b!209535 m!237049))

(declare-fun m!237051 () Bool)

(assert (=> b!209537 m!237051))

(declare-fun m!237053 () Bool)

(assert (=> mapNonEmpty!9143 m!237053))

(declare-fun m!237055 () Bool)

(assert (=> b!209529 m!237055))

(declare-fun m!237057 () Bool)

(assert (=> b!209529 m!237057))

(declare-fun m!237059 () Bool)

(assert (=> b!209529 m!237059))

(declare-fun m!237061 () Bool)

(assert (=> b!209529 m!237061))

(declare-fun m!237063 () Bool)

(assert (=> b!209529 m!237063))

(declare-fun m!237065 () Bool)

(assert (=> b!209529 m!237065))

(declare-fun m!237067 () Bool)

(assert (=> b!209529 m!237067))

(declare-fun m!237069 () Bool)

(assert (=> b!209531 m!237069))

(declare-fun m!237071 () Bool)

(assert (=> b!209536 m!237071))

(check-sat (not start!20872) (not b!209535) (not b_next!5521) (not b!209529) (not b!209536) tp_is_empty!5383 b_and!12281 (not mapNonEmpty!9143) (not b!209534) (not b!209537))
(check-sat b_and!12281 (not b_next!5521))
(get-model)

(declare-fun b!209616 () Bool)

(declare-fun e!136541 () Bool)

(declare-fun e!136542 () Bool)

(assert (=> b!209616 (= e!136541 e!136542)))

(declare-fun res!102211 () Bool)

(assert (=> b!209616 (=> (not res!102211) (not e!136542))))

(declare-fun e!136544 () Bool)

(assert (=> b!209616 (= res!102211 (not e!136544))))

(declare-fun res!102210 () Bool)

(assert (=> b!209616 (=> (not res!102210) (not e!136544))))

(assert (=> b!209616 (= res!102210 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209617 () Bool)

(declare-fun e!136543 () Bool)

(declare-fun call!19767 () Bool)

(assert (=> b!209617 (= e!136543 call!19767)))

(declare-fun d!57935 () Bool)

(declare-fun res!102209 () Bool)

(assert (=> d!57935 (=> res!102209 e!136541)))

(assert (=> d!57935 (= res!102209 (bvsge #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> d!57935 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2964) e!136541)))

(declare-fun b!209618 () Bool)

(assert (=> b!209618 (= e!136543 call!19767)))

(declare-fun bm!19764 () Bool)

(declare-fun c!35451 () Bool)

(assert (=> bm!19764 (= call!19767 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35451 (Cons!2963 (select (arr!4731 _keys!825) #b00000000000000000000000000000000) Nil!2964) Nil!2964)))))

(declare-fun b!209619 () Bool)

(declare-fun contains!1372 (List!2967 (_ BitVec 64)) Bool)

(assert (=> b!209619 (= e!136544 (contains!1372 Nil!2964 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209620 () Bool)

(assert (=> b!209620 (= e!136542 e!136543)))

(assert (=> b!209620 (= c!35451 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57935 (not res!102209)) b!209616))

(assert (= (and b!209616 res!102210) b!209619))

(assert (= (and b!209616 res!102211) b!209620))

(assert (= (and b!209620 c!35451) b!209618))

(assert (= (and b!209620 (not c!35451)) b!209617))

(assert (= (or b!209618 b!209617) bm!19764))

(declare-fun m!237141 () Bool)

(assert (=> b!209616 m!237141))

(assert (=> b!209616 m!237141))

(declare-fun m!237143 () Bool)

(assert (=> b!209616 m!237143))

(assert (=> bm!19764 m!237141))

(declare-fun m!237145 () Bool)

(assert (=> bm!19764 m!237145))

(assert (=> b!209619 m!237141))

(assert (=> b!209619 m!237141))

(declare-fun m!237147 () Bool)

(assert (=> b!209619 m!237147))

(assert (=> b!209620 m!237141))

(assert (=> b!209620 m!237141))

(assert (=> b!209620 m!237143))

(assert (=> b!209537 d!57935))

(declare-fun b!209629 () Bool)

(declare-fun e!136551 () Bool)

(declare-fun call!19770 () Bool)

(assert (=> b!209629 (= e!136551 call!19770)))

(declare-fun d!57937 () Bool)

(declare-fun res!102217 () Bool)

(declare-fun e!136553 () Bool)

(assert (=> d!57937 (=> res!102217 e!136553)))

(assert (=> d!57937 (= res!102217 (bvsge #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> d!57937 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136553)))

(declare-fun b!209630 () Bool)

(declare-fun e!136552 () Bool)

(assert (=> b!209630 (= e!136552 call!19770)))

(declare-fun bm!19767 () Bool)

(assert (=> bm!19767 (= call!19770 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!209631 () Bool)

(assert (=> b!209631 (= e!136553 e!136552)))

(declare-fun c!35454 () Bool)

(assert (=> b!209631 (= c!35454 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209632 () Bool)

(assert (=> b!209632 (= e!136552 e!136551)))

(declare-fun lt!107154 () (_ BitVec 64))

(assert (=> b!209632 (= lt!107154 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107155 () Unit!6360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9961 (_ BitVec 64) (_ BitVec 32)) Unit!6360)

(assert (=> b!209632 (= lt!107155 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107154 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!9961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!209632 (arrayContainsKey!0 _keys!825 lt!107154 #b00000000000000000000000000000000)))

(declare-fun lt!107156 () Unit!6360)

(assert (=> b!209632 (= lt!107156 lt!107155)))

(declare-fun res!102216 () Bool)

(declare-datatypes ((SeekEntryResult!693 0))(
  ( (MissingZero!693 (index!4942 (_ BitVec 32))) (Found!693 (index!4943 (_ BitVec 32))) (Intermediate!693 (undefined!1505 Bool) (index!4944 (_ BitVec 32)) (x!21963 (_ BitVec 32))) (Undefined!693) (MissingVacant!693 (index!4945 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9961 (_ BitVec 32)) SeekEntryResult!693)

(assert (=> b!209632 (= res!102216 (= (seekEntryOrOpen!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!693 #b00000000000000000000000000000000)))))

(assert (=> b!209632 (=> (not res!102216) (not e!136551))))

(assert (= (and d!57937 (not res!102217)) b!209631))

(assert (= (and b!209631 c!35454) b!209632))

(assert (= (and b!209631 (not c!35454)) b!209630))

(assert (= (and b!209632 res!102216) b!209629))

(assert (= (or b!209629 b!209630) bm!19767))

(declare-fun m!237149 () Bool)

(assert (=> bm!19767 m!237149))

(assert (=> b!209631 m!237141))

(assert (=> b!209631 m!237141))

(assert (=> b!209631 m!237143))

(assert (=> b!209632 m!237141))

(declare-fun m!237151 () Bool)

(assert (=> b!209632 m!237151))

(declare-fun m!237153 () Bool)

(assert (=> b!209632 m!237153))

(assert (=> b!209632 m!237141))

(declare-fun m!237155 () Bool)

(assert (=> b!209632 m!237155))

(assert (=> b!209536 d!57937))

(declare-fun d!57939 () Bool)

(assert (=> d!57939 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209535 d!57939))

(declare-fun d!57941 () Bool)

(declare-fun e!136556 () Bool)

(assert (=> d!57941 e!136556))

(declare-fun res!102222 () Bool)

(assert (=> d!57941 (=> (not res!102222) (not e!136556))))

(declare-fun lt!107167 () ListLongMap!2995)

(declare-fun contains!1373 (ListLongMap!2995 (_ BitVec 64)) Bool)

(assert (=> d!57941 (= res!102222 (contains!1373 lt!107167 (_1!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lt!107168 () List!2966)

(assert (=> d!57941 (= lt!107167 (ListLongMap!2996 lt!107168))))

(declare-fun lt!107166 () Unit!6360)

(declare-fun lt!107165 () Unit!6360)

(assert (=> d!57941 (= lt!107166 lt!107165)))

(declare-datatypes ((Option!254 0))(
  ( (Some!253 (v!4713 V!6825)) (None!252) )
))
(declare-fun getValueByKey!248 (List!2966 (_ BitVec 64)) Option!254)

(assert (=> d!57941 (= (getValueByKey!248 lt!107168 (_1!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!253 (_2!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lemmaContainsTupThenGetReturnValue!135 (List!2966 (_ BitVec 64) V!6825) Unit!6360)

(assert (=> d!57941 (= lt!107165 (lemmaContainsTupThenGetReturnValue!135 lt!107168 (_1!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun insertStrictlySorted!138 (List!2966 (_ BitVec 64) V!6825) List!2966)

(assert (=> d!57941 (= lt!107168 (insertStrictlySorted!138 (toList!1513 (+!542 lt!107103 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (_1!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!57941 (= (+!542 (+!542 lt!107103 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) lt!107167)))

(declare-fun b!209637 () Bool)

(declare-fun res!102223 () Bool)

(assert (=> b!209637 (=> (not res!102223) (not e!136556))))

(assert (=> b!209637 (= res!102223 (= (getValueByKey!248 (toList!1513 lt!107167) (_1!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!253 (_2!2051 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))))

(declare-fun b!209638 () Bool)

(declare-fun contains!1374 (List!2966 tuple2!4080) Bool)

(assert (=> b!209638 (= e!136556 (contains!1374 (toList!1513 lt!107167) (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!57941 res!102222) b!209637))

(assert (= (and b!209637 res!102223) b!209638))

(declare-fun m!237157 () Bool)

(assert (=> d!57941 m!237157))

(declare-fun m!237159 () Bool)

(assert (=> d!57941 m!237159))

(declare-fun m!237161 () Bool)

(assert (=> d!57941 m!237161))

(declare-fun m!237163 () Bool)

(assert (=> d!57941 m!237163))

(declare-fun m!237165 () Bool)

(assert (=> b!209637 m!237165))

(declare-fun m!237167 () Bool)

(assert (=> b!209638 m!237167))

(assert (=> b!209534 d!57941))

(declare-fun d!57943 () Bool)

(declare-fun e!136557 () Bool)

(assert (=> d!57943 e!136557))

(declare-fun res!102224 () Bool)

(assert (=> d!57943 (=> (not res!102224) (not e!136557))))

(declare-fun lt!107171 () ListLongMap!2995)

(assert (=> d!57943 (= res!102224 (contains!1373 lt!107171 (_1!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lt!107172 () List!2966)

(assert (=> d!57943 (= lt!107171 (ListLongMap!2996 lt!107172))))

(declare-fun lt!107170 () Unit!6360)

(declare-fun lt!107169 () Unit!6360)

(assert (=> d!57943 (= lt!107170 lt!107169)))

(assert (=> d!57943 (= (getValueByKey!248 lt!107172 (_1!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!253 (_2!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57943 (= lt!107169 (lemmaContainsTupThenGetReturnValue!135 lt!107172 (_1!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57943 (= lt!107172 (insertStrictlySorted!138 (toList!1513 lt!107103) (_1!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57943 (= (+!542 lt!107103 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) lt!107171)))

(declare-fun b!209639 () Bool)

(declare-fun res!102225 () Bool)

(assert (=> b!209639 (=> (not res!102225) (not e!136557))))

(assert (=> b!209639 (= res!102225 (= (getValueByKey!248 (toList!1513 lt!107171) (_1!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!253 (_2!2051 (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))))

(declare-fun b!209640 () Bool)

(assert (=> b!209640 (= e!136557 (contains!1374 (toList!1513 lt!107171) (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))

(assert (= (and d!57943 res!102224) b!209639))

(assert (= (and b!209639 res!102225) b!209640))

(declare-fun m!237169 () Bool)

(assert (=> d!57943 m!237169))

(declare-fun m!237171 () Bool)

(assert (=> d!57943 m!237171))

(declare-fun m!237173 () Bool)

(assert (=> d!57943 m!237173))

(declare-fun m!237175 () Bool)

(assert (=> d!57943 m!237175))

(declare-fun m!237177 () Bool)

(assert (=> b!209639 m!237177))

(declare-fun m!237179 () Bool)

(assert (=> b!209640 m!237179))

(assert (=> b!209534 d!57943))

(declare-fun d!57945 () Bool)

(assert (=> d!57945 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20872 d!57945))

(declare-fun d!57947 () Bool)

(assert (=> d!57947 (= (array_inv!3103 _values!649) (bvsge (size!5055 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20872 d!57947))

(declare-fun d!57949 () Bool)

(assert (=> d!57949 (= (array_inv!3104 _keys!825) (bvsge (size!5056 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20872 d!57949))

(declare-fun d!57951 () Bool)

(declare-fun e!136558 () Bool)

(assert (=> d!57951 e!136558))

(declare-fun res!102226 () Bool)

(assert (=> d!57951 (=> (not res!102226) (not e!136558))))

(declare-fun lt!107175 () ListLongMap!2995)

(assert (=> d!57951 (= res!102226 (contains!1373 lt!107175 (_1!2051 (tuple2!4081 k0!843 v!520))))))

(declare-fun lt!107176 () List!2966)

(assert (=> d!57951 (= lt!107175 (ListLongMap!2996 lt!107176))))

(declare-fun lt!107174 () Unit!6360)

(declare-fun lt!107173 () Unit!6360)

(assert (=> d!57951 (= lt!107174 lt!107173)))

(assert (=> d!57951 (= (getValueByKey!248 lt!107176 (_1!2051 (tuple2!4081 k0!843 v!520))) (Some!253 (_2!2051 (tuple2!4081 k0!843 v!520))))))

(assert (=> d!57951 (= lt!107173 (lemmaContainsTupThenGetReturnValue!135 lt!107176 (_1!2051 (tuple2!4081 k0!843 v!520)) (_2!2051 (tuple2!4081 k0!843 v!520))))))

(assert (=> d!57951 (= lt!107176 (insertStrictlySorted!138 (toList!1513 lt!107102) (_1!2051 (tuple2!4081 k0!843 v!520)) (_2!2051 (tuple2!4081 k0!843 v!520))))))

(assert (=> d!57951 (= (+!542 lt!107102 (tuple2!4081 k0!843 v!520)) lt!107175)))

(declare-fun b!209641 () Bool)

(declare-fun res!102227 () Bool)

(assert (=> b!209641 (=> (not res!102227) (not e!136558))))

(assert (=> b!209641 (= res!102227 (= (getValueByKey!248 (toList!1513 lt!107175) (_1!2051 (tuple2!4081 k0!843 v!520))) (Some!253 (_2!2051 (tuple2!4081 k0!843 v!520)))))))

(declare-fun b!209642 () Bool)

(assert (=> b!209642 (= e!136558 (contains!1374 (toList!1513 lt!107175) (tuple2!4081 k0!843 v!520)))))

(assert (= (and d!57951 res!102226) b!209641))

(assert (= (and b!209641 res!102227) b!209642))

(declare-fun m!237181 () Bool)

(assert (=> d!57951 m!237181))

(declare-fun m!237183 () Bool)

(assert (=> d!57951 m!237183))

(declare-fun m!237185 () Bool)

(assert (=> d!57951 m!237185))

(declare-fun m!237187 () Bool)

(assert (=> d!57951 m!237187))

(declare-fun m!237189 () Bool)

(assert (=> b!209641 m!237189))

(declare-fun m!237191 () Bool)

(assert (=> b!209642 m!237191))

(assert (=> b!209529 d!57951))

(declare-fun b!209667 () Bool)

(declare-fun e!136574 () ListLongMap!2995)

(declare-fun e!136578 () ListLongMap!2995)

(assert (=> b!209667 (= e!136574 e!136578)))

(declare-fun c!35466 () Bool)

(assert (=> b!209667 (= c!35466 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57953 () Bool)

(declare-fun e!136579 () Bool)

(assert (=> d!57953 e!136579))

(declare-fun res!102236 () Bool)

(assert (=> d!57953 (=> (not res!102236) (not e!136579))))

(declare-fun lt!107196 () ListLongMap!2995)

(assert (=> d!57953 (= res!102236 (not (contains!1373 lt!107196 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57953 (= lt!107196 e!136574)))

(declare-fun c!35465 () Bool)

(assert (=> d!57953 (= c!35465 (bvsge #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> d!57953 (validMask!0 mask!1149)))

(assert (=> d!57953 (= (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107196)))

(declare-fun e!136575 () Bool)

(declare-fun b!209668 () Bool)

(assert (=> b!209668 (= e!136575 (= lt!107196 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!209669 () Bool)

(declare-fun e!136577 () Bool)

(assert (=> b!209669 (= e!136577 e!136575)))

(declare-fun c!35463 () Bool)

(assert (=> b!209669 (= c!35463 (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209670 () Bool)

(declare-fun res!102238 () Bool)

(assert (=> b!209670 (=> (not res!102238) (not e!136579))))

(assert (=> b!209670 (= res!102238 (not (contains!1373 lt!107196 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209671 () Bool)

(assert (=> b!209671 (= e!136579 e!136577)))

(declare-fun c!35464 () Bool)

(declare-fun e!136573 () Bool)

(assert (=> b!209671 (= c!35464 e!136573)))

(declare-fun res!102237 () Bool)

(assert (=> b!209671 (=> (not res!102237) (not e!136573))))

(assert (=> b!209671 (= res!102237 (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209672 () Bool)

(declare-fun isEmpty!496 (ListLongMap!2995) Bool)

(assert (=> b!209672 (= e!136575 (isEmpty!496 lt!107196))))

(declare-fun b!209673 () Bool)

(declare-fun e!136576 () Bool)

(assert (=> b!209673 (= e!136577 e!136576)))

(assert (=> b!209673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun res!102239 () Bool)

(assert (=> b!209673 (= res!102239 (contains!1373 lt!107196 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209673 (=> (not res!102239) (not e!136576))))

(declare-fun b!209674 () Bool)

(assert (=> b!209674 (= e!136573 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209674 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!19773 () ListLongMap!2995)

(declare-fun bm!19770 () Bool)

(assert (=> bm!19770 (= call!19773 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!209675 () Bool)

(assert (=> b!209675 (= e!136574 (ListLongMap!2996 Nil!2963))))

(declare-fun b!209676 () Bool)

(assert (=> b!209676 (= e!136578 call!19773)))

(declare-fun b!209677 () Bool)

(declare-fun lt!107193 () Unit!6360)

(declare-fun lt!107194 () Unit!6360)

(assert (=> b!209677 (= lt!107193 lt!107194)))

(declare-fun lt!107191 () (_ BitVec 64))

(declare-fun lt!107197 () ListLongMap!2995)

(declare-fun lt!107195 () (_ BitVec 64))

(declare-fun lt!107192 () V!6825)

(assert (=> b!209677 (not (contains!1373 (+!542 lt!107197 (tuple2!4081 lt!107195 lt!107192)) lt!107191))))

(declare-fun addStillNotContains!100 (ListLongMap!2995 (_ BitVec 64) V!6825 (_ BitVec 64)) Unit!6360)

(assert (=> b!209677 (= lt!107194 (addStillNotContains!100 lt!107197 lt!107195 lt!107192 lt!107191))))

(assert (=> b!209677 (= lt!107191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2545 (ValueCell!2348 V!6825) V!6825)

(declare-fun dynLambda!532 (Int (_ BitVec 64)) V!6825)

(assert (=> b!209677 (= lt!107192 (get!2545 (select (arr!4730 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209677 (= lt!107195 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209677 (= lt!107197 call!19773)))

(assert (=> b!209677 (= e!136578 (+!542 call!19773 (tuple2!4081 (select (arr!4731 _keys!825) #b00000000000000000000000000000000) (get!2545 (select (arr!4730 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209678 () Bool)

(assert (=> b!209678 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> b!209678 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5055 _values!649)))))

(declare-fun apply!189 (ListLongMap!2995 (_ BitVec 64)) V!6825)

(assert (=> b!209678 (= e!136576 (= (apply!189 lt!107196 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)) (get!2545 (select (arr!4730 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!57953 c!35465) b!209675))

(assert (= (and d!57953 (not c!35465)) b!209667))

(assert (= (and b!209667 c!35466) b!209677))

(assert (= (and b!209667 (not c!35466)) b!209676))

(assert (= (or b!209677 b!209676) bm!19770))

(assert (= (and d!57953 res!102236) b!209670))

(assert (= (and b!209670 res!102238) b!209671))

(assert (= (and b!209671 res!102237) b!209674))

(assert (= (and b!209671 c!35464) b!209673))

(assert (= (and b!209671 (not c!35464)) b!209669))

(assert (= (and b!209673 res!102239) b!209678))

(assert (= (and b!209669 c!35463) b!209668))

(assert (= (and b!209669 (not c!35463)) b!209672))

(declare-fun b_lambda!7561 () Bool)

(assert (=> (not b_lambda!7561) (not b!209677)))

(declare-fun t!7896 () Bool)

(declare-fun tb!2883 () Bool)

(assert (=> (and start!20872 (= defaultEntry!657 defaultEntry!657) t!7896) tb!2883))

(declare-fun result!4953 () Bool)

(assert (=> tb!2883 (= result!4953 tp_is_empty!5383)))

(assert (=> b!209677 t!7896))

(declare-fun b_and!12287 () Bool)

(assert (= b_and!12281 (and (=> t!7896 result!4953) b_and!12287)))

(declare-fun b_lambda!7563 () Bool)

(assert (=> (not b_lambda!7563) (not b!209678)))

(assert (=> b!209678 t!7896))

(declare-fun b_and!12289 () Bool)

(assert (= b_and!12287 (and (=> t!7896 result!4953) b_and!12289)))

(declare-fun m!237193 () Bool)

(assert (=> b!209670 m!237193))

(declare-fun m!237195 () Bool)

(assert (=> b!209678 m!237195))

(assert (=> b!209678 m!237141))

(declare-fun m!237197 () Bool)

(assert (=> b!209678 m!237197))

(declare-fun m!237199 () Bool)

(assert (=> b!209678 m!237199))

(assert (=> b!209678 m!237141))

(assert (=> b!209678 m!237199))

(assert (=> b!209678 m!237195))

(declare-fun m!237201 () Bool)

(assert (=> b!209678 m!237201))

(assert (=> b!209674 m!237141))

(assert (=> b!209674 m!237141))

(assert (=> b!209674 m!237143))

(declare-fun m!237203 () Bool)

(assert (=> bm!19770 m!237203))

(declare-fun m!237205 () Bool)

(assert (=> b!209672 m!237205))

(assert (=> b!209673 m!237141))

(assert (=> b!209673 m!237141))

(declare-fun m!237207 () Bool)

(assert (=> b!209673 m!237207))

(assert (=> b!209667 m!237141))

(assert (=> b!209667 m!237141))

(assert (=> b!209667 m!237143))

(assert (=> b!209677 m!237195))

(declare-fun m!237209 () Bool)

(assert (=> b!209677 m!237209))

(declare-fun m!237211 () Bool)

(assert (=> b!209677 m!237211))

(assert (=> b!209677 m!237209))

(assert (=> b!209677 m!237199))

(declare-fun m!237213 () Bool)

(assert (=> b!209677 m!237213))

(assert (=> b!209677 m!237141))

(declare-fun m!237215 () Bool)

(assert (=> b!209677 m!237215))

(assert (=> b!209677 m!237199))

(assert (=> b!209677 m!237195))

(assert (=> b!209677 m!237201))

(assert (=> b!209668 m!237203))

(declare-fun m!237217 () Bool)

(assert (=> d!57953 m!237217))

(assert (=> d!57953 m!237043))

(assert (=> b!209529 d!57953))

(declare-fun d!57955 () Bool)

(declare-fun e!136585 () Bool)

(assert (=> d!57955 e!136585))

(declare-fun res!102242 () Bool)

(assert (=> d!57955 (=> (not res!102242) (not e!136585))))

(assert (=> d!57955 (= res!102242 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5055 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5055 _values!649))))))))

(declare-fun lt!107200 () Unit!6360)

(declare-fun choose!1079 (array!9961 array!9959 (_ BitVec 32) (_ BitVec 32) V!6825 V!6825 (_ BitVec 32) (_ BitVec 64) V!6825 (_ BitVec 32) Int) Unit!6360)

(assert (=> d!57955 (= lt!107200 (choose!1079 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> d!57955 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!194 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107200)))

(declare-fun call!19778 () ListLongMap!2995)

(declare-fun bm!19775 () Bool)

(assert (=> bm!19775 (= call!19778 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209687 () Bool)

(declare-fun e!136584 () Bool)

(declare-fun call!19779 () ListLongMap!2995)

(assert (=> b!209687 (= e!136584 (= call!19779 call!19778))))

(declare-fun bm!19776 () Bool)

(assert (=> bm!19776 (= call!19779 (getCurrentListMapNoExtraKeys!476 _keys!825 (array!9960 (store (arr!4730 _values!649) i!601 (ValueCellFull!2348 v!520)) (size!5055 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209688 () Bool)

(assert (=> b!209688 (= e!136584 (= call!19779 (+!542 call!19778 (tuple2!4081 k0!843 v!520))))))

(declare-fun b!209689 () Bool)

(assert (=> b!209689 (= e!136585 e!136584)))

(declare-fun c!35469 () Bool)

(assert (=> b!209689 (= c!35469 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!57955 res!102242) b!209689))

(assert (= (and b!209689 c!35469) b!209688))

(assert (= (and b!209689 (not c!35469)) b!209687))

(assert (= (or b!209688 b!209687) bm!19776))

(assert (= (or b!209688 b!209687) bm!19775))

(declare-fun m!237219 () Bool)

(assert (=> d!57955 m!237219))

(assert (=> bm!19775 m!237063))

(assert (=> bm!19776 m!237057))

(declare-fun m!237221 () Bool)

(assert (=> bm!19776 m!237221))

(declare-fun m!237223 () Bool)

(assert (=> b!209688 m!237223))

(assert (=> b!209529 d!57955))

(declare-fun b!209732 () Bool)

(declare-fun e!136622 () Bool)

(declare-fun lt!107261 () ListLongMap!2995)

(assert (=> b!209732 (= e!136622 (= (apply!189 lt!107261 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!209733 () Bool)

(declare-fun e!136620 () ListLongMap!2995)

(declare-fun call!19796 () ListLongMap!2995)

(assert (=> b!209733 (= e!136620 (+!542 call!19796 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19791 () Bool)

(declare-fun call!19798 () Bool)

(assert (=> bm!19791 (= call!19798 (contains!1373 lt!107261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209734 () Bool)

(declare-fun c!35487 () Bool)

(assert (=> b!209734 (= c!35487 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!136624 () ListLongMap!2995)

(declare-fun e!136615 () ListLongMap!2995)

(assert (=> b!209734 (= e!136624 e!136615)))

(declare-fun b!209735 () Bool)

(declare-fun e!136616 () Bool)

(declare-fun e!136613 () Bool)

(assert (=> b!209735 (= e!136616 e!136613)))

(declare-fun c!35484 () Bool)

(assert (=> b!209735 (= c!35484 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209736 () Bool)

(declare-fun res!102262 () Bool)

(assert (=> b!209736 (=> (not res!102262) (not e!136616))))

(declare-fun e!136623 () Bool)

(assert (=> b!209736 (= res!102262 e!136623)))

(declare-fun res!102264 () Bool)

(assert (=> b!209736 (=> res!102264 e!136623)))

(declare-fun e!136621 () Bool)

(assert (=> b!209736 (= res!102264 (not e!136621))))

(declare-fun res!102268 () Bool)

(assert (=> b!209736 (=> (not res!102268) (not e!136621))))

(assert (=> b!209736 (= res!102268 (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209737 () Bool)

(declare-fun call!19795 () ListLongMap!2995)

(assert (=> b!209737 (= e!136624 call!19795)))

(declare-fun bm!19792 () Bool)

(declare-fun call!19799 () ListLongMap!2995)

(assert (=> bm!19792 (= call!19799 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209738 () Bool)

(declare-fun e!136619 () Unit!6360)

(declare-fun Unit!6366 () Unit!6360)

(assert (=> b!209738 (= e!136619 Unit!6366)))

(declare-fun bm!19793 () Bool)

(assert (=> bm!19793 (= call!19795 call!19796)))

(declare-fun b!209739 () Bool)

(declare-fun e!136614 () Bool)

(assert (=> b!209739 (= e!136623 e!136614)))

(declare-fun res!102267 () Bool)

(assert (=> b!209739 (=> (not res!102267) (not e!136614))))

(assert (=> b!209739 (= res!102267 (contains!1373 lt!107261 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209740 () Bool)

(declare-fun res!102263 () Bool)

(assert (=> b!209740 (=> (not res!102263) (not e!136616))))

(declare-fun e!136618 () Bool)

(assert (=> b!209740 (= res!102263 e!136618)))

(declare-fun c!35483 () Bool)

(assert (=> b!209740 (= c!35483 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!209741 () Bool)

(declare-fun call!19794 () ListLongMap!2995)

(assert (=> b!209741 (= e!136615 call!19794)))

(declare-fun b!209742 () Bool)

(assert (=> b!209742 (= e!136621 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19794 () Bool)

(declare-fun c!35482 () Bool)

(declare-fun call!19797 () ListLongMap!2995)

(declare-fun c!35486 () Bool)

(assert (=> bm!19794 (= call!19796 (+!542 (ite c!35482 call!19799 (ite c!35486 call!19797 call!19794)) (ite (or c!35482 c!35486) (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!209743 () Bool)

(declare-fun e!136612 () Bool)

(assert (=> b!209743 (= e!136612 (= (apply!189 lt!107261 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!209744 () Bool)

(declare-fun call!19800 () Bool)

(assert (=> b!209744 (= e!136613 (not call!19800))))

(declare-fun b!209745 () Bool)

(assert (=> b!209745 (= e!136613 e!136622)))

(declare-fun res!102266 () Bool)

(assert (=> b!209745 (= res!102266 call!19800)))

(assert (=> b!209745 (=> (not res!102266) (not e!136622))))

(declare-fun b!209746 () Bool)

(assert (=> b!209746 (= e!136620 e!136624)))

(assert (=> b!209746 (= c!35486 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209747 () Bool)

(assert (=> b!209747 (= e!136615 call!19795)))

(declare-fun b!209748 () Bool)

(assert (=> b!209748 (= e!136618 (not call!19798))))

(declare-fun bm!19795 () Bool)

(assert (=> bm!19795 (= call!19797 call!19799)))

(declare-fun bm!19796 () Bool)

(assert (=> bm!19796 (= call!19800 (contains!1373 lt!107261 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209749 () Bool)

(declare-fun e!136617 () Bool)

(assert (=> b!209749 (= e!136617 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57957 () Bool)

(assert (=> d!57957 e!136616))

(declare-fun res!102261 () Bool)

(assert (=> d!57957 (=> (not res!102261) (not e!136616))))

(assert (=> d!57957 (= res!102261 (or (bvsge #b00000000000000000000000000000000 (size!5056 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))))

(declare-fun lt!107257 () ListLongMap!2995)

(assert (=> d!57957 (= lt!107261 lt!107257)))

(declare-fun lt!107254 () Unit!6360)

(assert (=> d!57957 (= lt!107254 e!136619)))

(declare-fun c!35485 () Bool)

(assert (=> d!57957 (= c!35485 e!136617)))

(declare-fun res!102269 () Bool)

(assert (=> d!57957 (=> (not res!102269) (not e!136617))))

(assert (=> d!57957 (= res!102269 (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> d!57957 (= lt!107257 e!136620)))

(assert (=> d!57957 (= c!35482 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57957 (validMask!0 mask!1149)))

(assert (=> d!57957 (= (getCurrentListMap!1053 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107261)))

(declare-fun b!209750 () Bool)

(assert (=> b!209750 (= e!136618 e!136612)))

(declare-fun res!102265 () Bool)

(assert (=> b!209750 (= res!102265 call!19798)))

(assert (=> b!209750 (=> (not res!102265) (not e!136612))))

(declare-fun b!209751 () Bool)

(assert (=> b!209751 (= e!136614 (= (apply!189 lt!107261 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)) (get!2545 (select (arr!4730 lt!107105) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5055 lt!107105)))))

(assert (=> b!209751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209752 () Bool)

(declare-fun lt!107248 () Unit!6360)

(assert (=> b!209752 (= e!136619 lt!107248)))

(declare-fun lt!107256 () ListLongMap!2995)

(assert (=> b!209752 (= lt!107256 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107253 () (_ BitVec 64))

(assert (=> b!209752 (= lt!107253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107260 () (_ BitVec 64))

(assert (=> b!209752 (= lt!107260 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107251 () Unit!6360)

(declare-fun addStillContains!165 (ListLongMap!2995 (_ BitVec 64) V!6825 (_ BitVec 64)) Unit!6360)

(assert (=> b!209752 (= lt!107251 (addStillContains!165 lt!107256 lt!107253 zeroValue!615 lt!107260))))

(assert (=> b!209752 (contains!1373 (+!542 lt!107256 (tuple2!4081 lt!107253 zeroValue!615)) lt!107260)))

(declare-fun lt!107259 () Unit!6360)

(assert (=> b!209752 (= lt!107259 lt!107251)))

(declare-fun lt!107246 () ListLongMap!2995)

(assert (=> b!209752 (= lt!107246 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107245 () (_ BitVec 64))

(assert (=> b!209752 (= lt!107245 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107263 () (_ BitVec 64))

(assert (=> b!209752 (= lt!107263 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107250 () Unit!6360)

(declare-fun addApplyDifferent!165 (ListLongMap!2995 (_ BitVec 64) V!6825 (_ BitVec 64)) Unit!6360)

(assert (=> b!209752 (= lt!107250 (addApplyDifferent!165 lt!107246 lt!107245 minValue!615 lt!107263))))

(assert (=> b!209752 (= (apply!189 (+!542 lt!107246 (tuple2!4081 lt!107245 minValue!615)) lt!107263) (apply!189 lt!107246 lt!107263))))

(declare-fun lt!107258 () Unit!6360)

(assert (=> b!209752 (= lt!107258 lt!107250)))

(declare-fun lt!107266 () ListLongMap!2995)

(assert (=> b!209752 (= lt!107266 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107249 () (_ BitVec 64))

(assert (=> b!209752 (= lt!107249 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107247 () (_ BitVec 64))

(assert (=> b!209752 (= lt!107247 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107265 () Unit!6360)

(assert (=> b!209752 (= lt!107265 (addApplyDifferent!165 lt!107266 lt!107249 zeroValue!615 lt!107247))))

(assert (=> b!209752 (= (apply!189 (+!542 lt!107266 (tuple2!4081 lt!107249 zeroValue!615)) lt!107247) (apply!189 lt!107266 lt!107247))))

(declare-fun lt!107252 () Unit!6360)

(assert (=> b!209752 (= lt!107252 lt!107265)))

(declare-fun lt!107264 () ListLongMap!2995)

(assert (=> b!209752 (= lt!107264 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107262 () (_ BitVec 64))

(assert (=> b!209752 (= lt!107262 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107255 () (_ BitVec 64))

(assert (=> b!209752 (= lt!107255 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209752 (= lt!107248 (addApplyDifferent!165 lt!107264 lt!107262 minValue!615 lt!107255))))

(assert (=> b!209752 (= (apply!189 (+!542 lt!107264 (tuple2!4081 lt!107262 minValue!615)) lt!107255) (apply!189 lt!107264 lt!107255))))

(declare-fun bm!19797 () Bool)

(assert (=> bm!19797 (= call!19794 call!19797)))

(assert (= (and d!57957 c!35482) b!209733))

(assert (= (and d!57957 (not c!35482)) b!209746))

(assert (= (and b!209746 c!35486) b!209737))

(assert (= (and b!209746 (not c!35486)) b!209734))

(assert (= (and b!209734 c!35487) b!209747))

(assert (= (and b!209734 (not c!35487)) b!209741))

(assert (= (or b!209747 b!209741) bm!19797))

(assert (= (or b!209737 bm!19797) bm!19795))

(assert (= (or b!209737 b!209747) bm!19793))

(assert (= (or b!209733 bm!19795) bm!19792))

(assert (= (or b!209733 bm!19793) bm!19794))

(assert (= (and d!57957 res!102269) b!209749))

(assert (= (and d!57957 c!35485) b!209752))

(assert (= (and d!57957 (not c!35485)) b!209738))

(assert (= (and d!57957 res!102261) b!209736))

(assert (= (and b!209736 res!102268) b!209742))

(assert (= (and b!209736 (not res!102264)) b!209739))

(assert (= (and b!209739 res!102267) b!209751))

(assert (= (and b!209736 res!102262) b!209740))

(assert (= (and b!209740 c!35483) b!209750))

(assert (= (and b!209740 (not c!35483)) b!209748))

(assert (= (and b!209750 res!102265) b!209743))

(assert (= (or b!209750 b!209748) bm!19791))

(assert (= (and b!209740 res!102263) b!209735))

(assert (= (and b!209735 c!35484) b!209745))

(assert (= (and b!209735 (not c!35484)) b!209744))

(assert (= (and b!209745 res!102266) b!209732))

(assert (= (or b!209745 b!209744) bm!19796))

(declare-fun b_lambda!7565 () Bool)

(assert (=> (not b_lambda!7565) (not b!209751)))

(assert (=> b!209751 t!7896))

(declare-fun b_and!12291 () Bool)

(assert (= b_and!12289 (and (=> t!7896 result!4953) b_and!12291)))

(declare-fun m!237225 () Bool)

(assert (=> b!209733 m!237225))

(assert (=> d!57957 m!237043))

(declare-fun m!237227 () Bool)

(assert (=> bm!19796 m!237227))

(declare-fun m!237229 () Bool)

(assert (=> bm!19791 m!237229))

(assert (=> b!209752 m!237059))

(declare-fun m!237231 () Bool)

(assert (=> b!209752 m!237231))

(declare-fun m!237233 () Bool)

(assert (=> b!209752 m!237233))

(declare-fun m!237235 () Bool)

(assert (=> b!209752 m!237235))

(declare-fun m!237237 () Bool)

(assert (=> b!209752 m!237237))

(declare-fun m!237239 () Bool)

(assert (=> b!209752 m!237239))

(declare-fun m!237241 () Bool)

(assert (=> b!209752 m!237241))

(declare-fun m!237243 () Bool)

(assert (=> b!209752 m!237243))

(declare-fun m!237245 () Bool)

(assert (=> b!209752 m!237245))

(assert (=> b!209752 m!237233))

(declare-fun m!237247 () Bool)

(assert (=> b!209752 m!237247))

(declare-fun m!237249 () Bool)

(assert (=> b!209752 m!237249))

(assert (=> b!209752 m!237231))

(declare-fun m!237251 () Bool)

(assert (=> b!209752 m!237251))

(declare-fun m!237253 () Bool)

(assert (=> b!209752 m!237253))

(declare-fun m!237255 () Bool)

(assert (=> b!209752 m!237255))

(assert (=> b!209752 m!237243))

(assert (=> b!209752 m!237141))

(assert (=> b!209752 m!237253))

(declare-fun m!237257 () Bool)

(assert (=> b!209752 m!237257))

(declare-fun m!237259 () Bool)

(assert (=> b!209752 m!237259))

(declare-fun m!237261 () Bool)

(assert (=> bm!19794 m!237261))

(declare-fun m!237263 () Bool)

(assert (=> b!209751 m!237263))

(assert (=> b!209751 m!237195))

(declare-fun m!237265 () Bool)

(assert (=> b!209751 m!237265))

(assert (=> b!209751 m!237195))

(assert (=> b!209751 m!237263))

(assert (=> b!209751 m!237141))

(declare-fun m!237267 () Bool)

(assert (=> b!209751 m!237267))

(assert (=> b!209751 m!237141))

(assert (=> bm!19792 m!237059))

(assert (=> b!209749 m!237141))

(assert (=> b!209749 m!237141))

(assert (=> b!209749 m!237143))

(declare-fun m!237269 () Bool)

(assert (=> b!209743 m!237269))

(assert (=> b!209742 m!237141))

(assert (=> b!209742 m!237141))

(assert (=> b!209742 m!237143))

(assert (=> b!209739 m!237141))

(assert (=> b!209739 m!237141))

(declare-fun m!237271 () Bool)

(assert (=> b!209739 m!237271))

(declare-fun m!237273 () Bool)

(assert (=> b!209732 m!237273))

(assert (=> b!209529 d!57957))

(declare-fun b!209753 () Bool)

(declare-fun e!136635 () Bool)

(declare-fun lt!107283 () ListLongMap!2995)

(assert (=> b!209753 (= e!136635 (= (apply!189 lt!107283 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!209754 () Bool)

(declare-fun e!136633 () ListLongMap!2995)

(declare-fun call!19803 () ListLongMap!2995)

(assert (=> b!209754 (= e!136633 (+!542 call!19803 (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19798 () Bool)

(declare-fun call!19805 () Bool)

(assert (=> bm!19798 (= call!19805 (contains!1373 lt!107283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209755 () Bool)

(declare-fun c!35493 () Bool)

(assert (=> b!209755 (= c!35493 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!136637 () ListLongMap!2995)

(declare-fun e!136628 () ListLongMap!2995)

(assert (=> b!209755 (= e!136637 e!136628)))

(declare-fun b!209756 () Bool)

(declare-fun e!136629 () Bool)

(declare-fun e!136626 () Bool)

(assert (=> b!209756 (= e!136629 e!136626)))

(declare-fun c!35490 () Bool)

(assert (=> b!209756 (= c!35490 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209757 () Bool)

(declare-fun res!102271 () Bool)

(assert (=> b!209757 (=> (not res!102271) (not e!136629))))

(declare-fun e!136636 () Bool)

(assert (=> b!209757 (= res!102271 e!136636)))

(declare-fun res!102273 () Bool)

(assert (=> b!209757 (=> res!102273 e!136636)))

(declare-fun e!136634 () Bool)

(assert (=> b!209757 (= res!102273 (not e!136634))))

(declare-fun res!102277 () Bool)

(assert (=> b!209757 (=> (not res!102277) (not e!136634))))

(assert (=> b!209757 (= res!102277 (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209758 () Bool)

(declare-fun call!19802 () ListLongMap!2995)

(assert (=> b!209758 (= e!136637 call!19802)))

(declare-fun call!19806 () ListLongMap!2995)

(declare-fun bm!19799 () Bool)

(assert (=> bm!19799 (= call!19806 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209759 () Bool)

(declare-fun e!136632 () Unit!6360)

(declare-fun Unit!6367 () Unit!6360)

(assert (=> b!209759 (= e!136632 Unit!6367)))

(declare-fun bm!19800 () Bool)

(assert (=> bm!19800 (= call!19802 call!19803)))

(declare-fun b!209760 () Bool)

(declare-fun e!136627 () Bool)

(assert (=> b!209760 (= e!136636 e!136627)))

(declare-fun res!102276 () Bool)

(assert (=> b!209760 (=> (not res!102276) (not e!136627))))

(assert (=> b!209760 (= res!102276 (contains!1373 lt!107283 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209761 () Bool)

(declare-fun res!102272 () Bool)

(assert (=> b!209761 (=> (not res!102272) (not e!136629))))

(declare-fun e!136631 () Bool)

(assert (=> b!209761 (= res!102272 e!136631)))

(declare-fun c!35489 () Bool)

(assert (=> b!209761 (= c!35489 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!209762 () Bool)

(declare-fun call!19801 () ListLongMap!2995)

(assert (=> b!209762 (= e!136628 call!19801)))

(declare-fun b!209763 () Bool)

(assert (=> b!209763 (= e!136634 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun c!35488 () Bool)

(declare-fun c!35492 () Bool)

(declare-fun call!19804 () ListLongMap!2995)

(declare-fun bm!19801 () Bool)

(assert (=> bm!19801 (= call!19803 (+!542 (ite c!35488 call!19806 (ite c!35492 call!19804 call!19801)) (ite (or c!35488 c!35492) (tuple2!4081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!209764 () Bool)

(declare-fun e!136625 () Bool)

(assert (=> b!209764 (= e!136625 (= (apply!189 lt!107283 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!209765 () Bool)

(declare-fun call!19807 () Bool)

(assert (=> b!209765 (= e!136626 (not call!19807))))

(declare-fun b!209766 () Bool)

(assert (=> b!209766 (= e!136626 e!136635)))

(declare-fun res!102275 () Bool)

(assert (=> b!209766 (= res!102275 call!19807)))

(assert (=> b!209766 (=> (not res!102275) (not e!136635))))

(declare-fun b!209767 () Bool)

(assert (=> b!209767 (= e!136633 e!136637)))

(assert (=> b!209767 (= c!35492 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209768 () Bool)

(assert (=> b!209768 (= e!136628 call!19802)))

(declare-fun b!209769 () Bool)

(assert (=> b!209769 (= e!136631 (not call!19805))))

(declare-fun bm!19802 () Bool)

(assert (=> bm!19802 (= call!19804 call!19806)))

(declare-fun bm!19803 () Bool)

(assert (=> bm!19803 (= call!19807 (contains!1373 lt!107283 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209770 () Bool)

(declare-fun e!136630 () Bool)

(assert (=> b!209770 (= e!136630 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57959 () Bool)

(assert (=> d!57959 e!136629))

(declare-fun res!102270 () Bool)

(assert (=> d!57959 (=> (not res!102270) (not e!136629))))

(assert (=> d!57959 (= res!102270 (or (bvsge #b00000000000000000000000000000000 (size!5056 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))))

(declare-fun lt!107279 () ListLongMap!2995)

(assert (=> d!57959 (= lt!107283 lt!107279)))

(declare-fun lt!107276 () Unit!6360)

(assert (=> d!57959 (= lt!107276 e!136632)))

(declare-fun c!35491 () Bool)

(assert (=> d!57959 (= c!35491 e!136630)))

(declare-fun res!102278 () Bool)

(assert (=> d!57959 (=> (not res!102278) (not e!136630))))

(assert (=> d!57959 (= res!102278 (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> d!57959 (= lt!107279 e!136633)))

(assert (=> d!57959 (= c!35488 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57959 (validMask!0 mask!1149)))

(assert (=> d!57959 (= (getCurrentListMap!1053 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107283)))

(declare-fun b!209771 () Bool)

(assert (=> b!209771 (= e!136631 e!136625)))

(declare-fun res!102274 () Bool)

(assert (=> b!209771 (= res!102274 call!19805)))

(assert (=> b!209771 (=> (not res!102274) (not e!136625))))

(declare-fun b!209772 () Bool)

(assert (=> b!209772 (= e!136627 (= (apply!189 lt!107283 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)) (get!2545 (select (arr!4730 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5055 _values!649)))))

(assert (=> b!209772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209773 () Bool)

(declare-fun lt!107270 () Unit!6360)

(assert (=> b!209773 (= e!136632 lt!107270)))

(declare-fun lt!107278 () ListLongMap!2995)

(assert (=> b!209773 (= lt!107278 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107275 () (_ BitVec 64))

(assert (=> b!209773 (= lt!107275 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107282 () (_ BitVec 64))

(assert (=> b!209773 (= lt!107282 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107273 () Unit!6360)

(assert (=> b!209773 (= lt!107273 (addStillContains!165 lt!107278 lt!107275 zeroValue!615 lt!107282))))

(assert (=> b!209773 (contains!1373 (+!542 lt!107278 (tuple2!4081 lt!107275 zeroValue!615)) lt!107282)))

(declare-fun lt!107281 () Unit!6360)

(assert (=> b!209773 (= lt!107281 lt!107273)))

(declare-fun lt!107268 () ListLongMap!2995)

(assert (=> b!209773 (= lt!107268 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107267 () (_ BitVec 64))

(assert (=> b!209773 (= lt!107267 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107285 () (_ BitVec 64))

(assert (=> b!209773 (= lt!107285 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107272 () Unit!6360)

(assert (=> b!209773 (= lt!107272 (addApplyDifferent!165 lt!107268 lt!107267 minValue!615 lt!107285))))

(assert (=> b!209773 (= (apply!189 (+!542 lt!107268 (tuple2!4081 lt!107267 minValue!615)) lt!107285) (apply!189 lt!107268 lt!107285))))

(declare-fun lt!107280 () Unit!6360)

(assert (=> b!209773 (= lt!107280 lt!107272)))

(declare-fun lt!107288 () ListLongMap!2995)

(assert (=> b!209773 (= lt!107288 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107271 () (_ BitVec 64))

(assert (=> b!209773 (= lt!107271 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107269 () (_ BitVec 64))

(assert (=> b!209773 (= lt!107269 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107287 () Unit!6360)

(assert (=> b!209773 (= lt!107287 (addApplyDifferent!165 lt!107288 lt!107271 zeroValue!615 lt!107269))))

(assert (=> b!209773 (= (apply!189 (+!542 lt!107288 (tuple2!4081 lt!107271 zeroValue!615)) lt!107269) (apply!189 lt!107288 lt!107269))))

(declare-fun lt!107274 () Unit!6360)

(assert (=> b!209773 (= lt!107274 lt!107287)))

(declare-fun lt!107286 () ListLongMap!2995)

(assert (=> b!209773 (= lt!107286 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107284 () (_ BitVec 64))

(assert (=> b!209773 (= lt!107284 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107277 () (_ BitVec 64))

(assert (=> b!209773 (= lt!107277 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209773 (= lt!107270 (addApplyDifferent!165 lt!107286 lt!107284 minValue!615 lt!107277))))

(assert (=> b!209773 (= (apply!189 (+!542 lt!107286 (tuple2!4081 lt!107284 minValue!615)) lt!107277) (apply!189 lt!107286 lt!107277))))

(declare-fun bm!19804 () Bool)

(assert (=> bm!19804 (= call!19801 call!19804)))

(assert (= (and d!57959 c!35488) b!209754))

(assert (= (and d!57959 (not c!35488)) b!209767))

(assert (= (and b!209767 c!35492) b!209758))

(assert (= (and b!209767 (not c!35492)) b!209755))

(assert (= (and b!209755 c!35493) b!209768))

(assert (= (and b!209755 (not c!35493)) b!209762))

(assert (= (or b!209768 b!209762) bm!19804))

(assert (= (or b!209758 bm!19804) bm!19802))

(assert (= (or b!209758 b!209768) bm!19800))

(assert (= (or b!209754 bm!19802) bm!19799))

(assert (= (or b!209754 bm!19800) bm!19801))

(assert (= (and d!57959 res!102278) b!209770))

(assert (= (and d!57959 c!35491) b!209773))

(assert (= (and d!57959 (not c!35491)) b!209759))

(assert (= (and d!57959 res!102270) b!209757))

(assert (= (and b!209757 res!102277) b!209763))

(assert (= (and b!209757 (not res!102273)) b!209760))

(assert (= (and b!209760 res!102276) b!209772))

(assert (= (and b!209757 res!102271) b!209761))

(assert (= (and b!209761 c!35489) b!209771))

(assert (= (and b!209761 (not c!35489)) b!209769))

(assert (= (and b!209771 res!102274) b!209764))

(assert (= (or b!209771 b!209769) bm!19798))

(assert (= (and b!209761 res!102272) b!209756))

(assert (= (and b!209756 c!35490) b!209766))

(assert (= (and b!209756 (not c!35490)) b!209765))

(assert (= (and b!209766 res!102275) b!209753))

(assert (= (or b!209766 b!209765) bm!19803))

(declare-fun b_lambda!7567 () Bool)

(assert (=> (not b_lambda!7567) (not b!209772)))

(assert (=> b!209772 t!7896))

(declare-fun b_and!12293 () Bool)

(assert (= b_and!12291 (and (=> t!7896 result!4953) b_and!12293)))

(declare-fun m!237275 () Bool)

(assert (=> b!209754 m!237275))

(assert (=> d!57959 m!237043))

(declare-fun m!237277 () Bool)

(assert (=> bm!19803 m!237277))

(declare-fun m!237279 () Bool)

(assert (=> bm!19798 m!237279))

(assert (=> b!209773 m!237063))

(declare-fun m!237281 () Bool)

(assert (=> b!209773 m!237281))

(declare-fun m!237283 () Bool)

(assert (=> b!209773 m!237283))

(declare-fun m!237285 () Bool)

(assert (=> b!209773 m!237285))

(declare-fun m!237287 () Bool)

(assert (=> b!209773 m!237287))

(declare-fun m!237289 () Bool)

(assert (=> b!209773 m!237289))

(declare-fun m!237291 () Bool)

(assert (=> b!209773 m!237291))

(declare-fun m!237293 () Bool)

(assert (=> b!209773 m!237293))

(declare-fun m!237295 () Bool)

(assert (=> b!209773 m!237295))

(assert (=> b!209773 m!237283))

(declare-fun m!237297 () Bool)

(assert (=> b!209773 m!237297))

(declare-fun m!237299 () Bool)

(assert (=> b!209773 m!237299))

(assert (=> b!209773 m!237281))

(declare-fun m!237301 () Bool)

(assert (=> b!209773 m!237301))

(declare-fun m!237303 () Bool)

(assert (=> b!209773 m!237303))

(declare-fun m!237305 () Bool)

(assert (=> b!209773 m!237305))

(assert (=> b!209773 m!237293))

(assert (=> b!209773 m!237141))

(assert (=> b!209773 m!237303))

(declare-fun m!237307 () Bool)

(assert (=> b!209773 m!237307))

(declare-fun m!237309 () Bool)

(assert (=> b!209773 m!237309))

(declare-fun m!237311 () Bool)

(assert (=> bm!19801 m!237311))

(assert (=> b!209772 m!237199))

(assert (=> b!209772 m!237195))

(assert (=> b!209772 m!237201))

(assert (=> b!209772 m!237195))

(assert (=> b!209772 m!237199))

(assert (=> b!209772 m!237141))

(declare-fun m!237313 () Bool)

(assert (=> b!209772 m!237313))

(assert (=> b!209772 m!237141))

(assert (=> bm!19799 m!237063))

(assert (=> b!209770 m!237141))

(assert (=> b!209770 m!237141))

(assert (=> b!209770 m!237143))

(declare-fun m!237315 () Bool)

(assert (=> b!209764 m!237315))

(assert (=> b!209763 m!237141))

(assert (=> b!209763 m!237141))

(assert (=> b!209763 m!237143))

(assert (=> b!209760 m!237141))

(assert (=> b!209760 m!237141))

(declare-fun m!237317 () Bool)

(assert (=> b!209760 m!237317))

(declare-fun m!237319 () Bool)

(assert (=> b!209753 m!237319))

(assert (=> b!209529 d!57959))

(declare-fun b!209774 () Bool)

(declare-fun e!136639 () ListLongMap!2995)

(declare-fun e!136643 () ListLongMap!2995)

(assert (=> b!209774 (= e!136639 e!136643)))

(declare-fun c!35497 () Bool)

(assert (=> b!209774 (= c!35497 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57961 () Bool)

(declare-fun e!136644 () Bool)

(assert (=> d!57961 e!136644))

(declare-fun res!102279 () Bool)

(assert (=> d!57961 (=> (not res!102279) (not e!136644))))

(declare-fun lt!107294 () ListLongMap!2995)

(assert (=> d!57961 (= res!102279 (not (contains!1373 lt!107294 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57961 (= lt!107294 e!136639)))

(declare-fun c!35496 () Bool)

(assert (=> d!57961 (= c!35496 (bvsge #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> d!57961 (validMask!0 mask!1149)))

(assert (=> d!57961 (= (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107294)))

(declare-fun e!136640 () Bool)

(declare-fun b!209775 () Bool)

(assert (=> b!209775 (= e!136640 (= lt!107294 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!209776 () Bool)

(declare-fun e!136642 () Bool)

(assert (=> b!209776 (= e!136642 e!136640)))

(declare-fun c!35494 () Bool)

(assert (=> b!209776 (= c!35494 (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209777 () Bool)

(declare-fun res!102281 () Bool)

(assert (=> b!209777 (=> (not res!102281) (not e!136644))))

(assert (=> b!209777 (= res!102281 (not (contains!1373 lt!107294 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209778 () Bool)

(assert (=> b!209778 (= e!136644 e!136642)))

(declare-fun c!35495 () Bool)

(declare-fun e!136638 () Bool)

(assert (=> b!209778 (= c!35495 e!136638)))

(declare-fun res!102280 () Bool)

(assert (=> b!209778 (=> (not res!102280) (not e!136638))))

(assert (=> b!209778 (= res!102280 (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun b!209779 () Bool)

(assert (=> b!209779 (= e!136640 (isEmpty!496 lt!107294))))

(declare-fun b!209780 () Bool)

(declare-fun e!136641 () Bool)

(assert (=> b!209780 (= e!136642 e!136641)))

(assert (=> b!209780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(declare-fun res!102282 () Bool)

(assert (=> b!209780 (= res!102282 (contains!1373 lt!107294 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209780 (=> (not res!102282) (not e!136641))))

(declare-fun b!209781 () Bool)

(assert (=> b!209781 (= e!136638 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209781 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!19805 () Bool)

(declare-fun call!19808 () ListLongMap!2995)

(assert (=> bm!19805 (= call!19808 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107105 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!209782 () Bool)

(assert (=> b!209782 (= e!136639 (ListLongMap!2996 Nil!2963))))

(declare-fun b!209783 () Bool)

(assert (=> b!209783 (= e!136643 call!19808)))

(declare-fun b!209784 () Bool)

(declare-fun lt!107291 () Unit!6360)

(declare-fun lt!107292 () Unit!6360)

(assert (=> b!209784 (= lt!107291 lt!107292)))

(declare-fun lt!107293 () (_ BitVec 64))

(declare-fun lt!107289 () (_ BitVec 64))

(declare-fun lt!107290 () V!6825)

(declare-fun lt!107295 () ListLongMap!2995)

(assert (=> b!209784 (not (contains!1373 (+!542 lt!107295 (tuple2!4081 lt!107293 lt!107290)) lt!107289))))

(assert (=> b!209784 (= lt!107292 (addStillNotContains!100 lt!107295 lt!107293 lt!107290 lt!107289))))

(assert (=> b!209784 (= lt!107289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209784 (= lt!107290 (get!2545 (select (arr!4730 lt!107105) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209784 (= lt!107293 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209784 (= lt!107295 call!19808)))

(assert (=> b!209784 (= e!136643 (+!542 call!19808 (tuple2!4081 (select (arr!4731 _keys!825) #b00000000000000000000000000000000) (get!2545 (select (arr!4730 lt!107105) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209785 () Bool)

(assert (=> b!209785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5056 _keys!825)))))

(assert (=> b!209785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5055 lt!107105)))))

(assert (=> b!209785 (= e!136641 (= (apply!189 lt!107294 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)) (get!2545 (select (arr!4730 lt!107105) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!57961 c!35496) b!209782))

(assert (= (and d!57961 (not c!35496)) b!209774))

(assert (= (and b!209774 c!35497) b!209784))

(assert (= (and b!209774 (not c!35497)) b!209783))

(assert (= (or b!209784 b!209783) bm!19805))

(assert (= (and d!57961 res!102279) b!209777))

(assert (= (and b!209777 res!102281) b!209778))

(assert (= (and b!209778 res!102280) b!209781))

(assert (= (and b!209778 c!35495) b!209780))

(assert (= (and b!209778 (not c!35495)) b!209776))

(assert (= (and b!209780 res!102282) b!209785))

(assert (= (and b!209776 c!35494) b!209775))

(assert (= (and b!209776 (not c!35494)) b!209779))

(declare-fun b_lambda!7569 () Bool)

(assert (=> (not b_lambda!7569) (not b!209784)))

(assert (=> b!209784 t!7896))

(declare-fun b_and!12295 () Bool)

(assert (= b_and!12293 (and (=> t!7896 result!4953) b_and!12295)))

(declare-fun b_lambda!7571 () Bool)

(assert (=> (not b_lambda!7571) (not b!209785)))

(assert (=> b!209785 t!7896))

(declare-fun b_and!12297 () Bool)

(assert (= b_and!12295 (and (=> t!7896 result!4953) b_and!12297)))

(declare-fun m!237321 () Bool)

(assert (=> b!209777 m!237321))

(assert (=> b!209785 m!237195))

(assert (=> b!209785 m!237141))

(declare-fun m!237323 () Bool)

(assert (=> b!209785 m!237323))

(assert (=> b!209785 m!237263))

(assert (=> b!209785 m!237141))

(assert (=> b!209785 m!237263))

(assert (=> b!209785 m!237195))

(assert (=> b!209785 m!237265))

(assert (=> b!209781 m!237141))

(assert (=> b!209781 m!237141))

(assert (=> b!209781 m!237143))

(declare-fun m!237325 () Bool)

(assert (=> bm!19805 m!237325))

(declare-fun m!237327 () Bool)

(assert (=> b!209779 m!237327))

(assert (=> b!209780 m!237141))

(assert (=> b!209780 m!237141))

(declare-fun m!237329 () Bool)

(assert (=> b!209780 m!237329))

(assert (=> b!209774 m!237141))

(assert (=> b!209774 m!237141))

(assert (=> b!209774 m!237143))

(assert (=> b!209784 m!237195))

(declare-fun m!237331 () Bool)

(assert (=> b!209784 m!237331))

(declare-fun m!237333 () Bool)

(assert (=> b!209784 m!237333))

(assert (=> b!209784 m!237331))

(assert (=> b!209784 m!237263))

(declare-fun m!237335 () Bool)

(assert (=> b!209784 m!237335))

(assert (=> b!209784 m!237141))

(declare-fun m!237337 () Bool)

(assert (=> b!209784 m!237337))

(assert (=> b!209784 m!237263))

(assert (=> b!209784 m!237195))

(assert (=> b!209784 m!237265))

(assert (=> b!209775 m!237325))

(declare-fun m!237339 () Bool)

(assert (=> d!57961 m!237339))

(assert (=> d!57961 m!237043))

(assert (=> b!209529 d!57961))

(declare-fun mapIsEmpty!9152 () Bool)

(declare-fun mapRes!9152 () Bool)

(assert (=> mapIsEmpty!9152 mapRes!9152))

(declare-fun b!209792 () Bool)

(declare-fun e!136650 () Bool)

(assert (=> b!209792 (= e!136650 tp_is_empty!5383)))

(declare-fun condMapEmpty!9152 () Bool)

(declare-fun mapDefault!9152 () ValueCell!2348)

(assert (=> mapNonEmpty!9143 (= condMapEmpty!9152 (= mapRest!9143 ((as const (Array (_ BitVec 32) ValueCell!2348)) mapDefault!9152)))))

(declare-fun e!136649 () Bool)

(assert (=> mapNonEmpty!9143 (= tp!19604 (and e!136649 mapRes!9152))))

(declare-fun mapNonEmpty!9152 () Bool)

(declare-fun tp!19619 () Bool)

(assert (=> mapNonEmpty!9152 (= mapRes!9152 (and tp!19619 e!136650))))

(declare-fun mapKey!9152 () (_ BitVec 32))

(declare-fun mapValue!9152 () ValueCell!2348)

(declare-fun mapRest!9152 () (Array (_ BitVec 32) ValueCell!2348))

(assert (=> mapNonEmpty!9152 (= mapRest!9143 (store mapRest!9152 mapKey!9152 mapValue!9152))))

(declare-fun b!209793 () Bool)

(assert (=> b!209793 (= e!136649 tp_is_empty!5383)))

(assert (= (and mapNonEmpty!9143 condMapEmpty!9152) mapIsEmpty!9152))

(assert (= (and mapNonEmpty!9143 (not condMapEmpty!9152)) mapNonEmpty!9152))

(assert (= (and mapNonEmpty!9152 ((_ is ValueCellFull!2348) mapValue!9152)) b!209792))

(assert (= (and mapNonEmpty!9143 ((_ is ValueCellFull!2348) mapDefault!9152)) b!209793))

(declare-fun m!237341 () Bool)

(assert (=> mapNonEmpty!9152 m!237341))

(declare-fun b_lambda!7573 () Bool)

(assert (= b_lambda!7569 (or (and start!20872 b_free!5521) b_lambda!7573)))

(declare-fun b_lambda!7575 () Bool)

(assert (= b_lambda!7561 (or (and start!20872 b_free!5521) b_lambda!7575)))

(declare-fun b_lambda!7577 () Bool)

(assert (= b_lambda!7563 (or (and start!20872 b_free!5521) b_lambda!7577)))

(declare-fun b_lambda!7579 () Bool)

(assert (= b_lambda!7565 (or (and start!20872 b_free!5521) b_lambda!7579)))

(declare-fun b_lambda!7581 () Bool)

(assert (= b_lambda!7571 (or (and start!20872 b_free!5521) b_lambda!7581)))

(declare-fun b_lambda!7583 () Bool)

(assert (= b_lambda!7567 (or (and start!20872 b_free!5521) b_lambda!7583)))

(check-sat (not b!209640) (not b!209775) (not bm!19767) (not mapNonEmpty!9152) (not b!209760) (not bm!19776) (not b!209677) (not b_lambda!7575) (not d!57959) (not b!209619) (not b!209751) (not b!209678) (not b!209639) (not b!209770) (not b!209632) (not b!209674) (not b!209620) (not b!209742) (not bm!19803) (not b!209784) (not b_lambda!7583) (not b_lambda!7581) (not b!209754) (not bm!19791) (not d!57955) (not bm!19796) (not d!57953) (not bm!19798) b_and!12297 (not b!209753) (not bm!19801) (not b!209752) (not b!209733) (not b!209673) (not d!57951) (not bm!19799) (not bm!19792) (not b!209743) (not b!209638) (not b!209641) (not b!209774) (not b!209763) (not d!57943) (not bm!19794) (not b!209672) (not d!57957) (not b!209667) (not bm!19770) (not b!209637) (not d!57961) (not b!209739) (not b_next!5521) (not b!209631) (not bm!19775) (not b_lambda!7573) tp_is_empty!5383 (not bm!19805) (not b!209785) (not b!209668) (not b!209780) (not b!209642) (not b!209777) (not b!209670) (not b_lambda!7579) (not b!209688) (not d!57941) (not b!209781) (not b!209616) (not b!209732) (not b_lambda!7577) (not b!209772) (not b!209749) (not b!209764) (not bm!19764) (not b!209779) (not b!209773))
(check-sat b_and!12297 (not b_next!5521))
